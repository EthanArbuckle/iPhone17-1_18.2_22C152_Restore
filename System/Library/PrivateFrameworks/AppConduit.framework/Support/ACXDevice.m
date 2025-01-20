@interface ACXDevice
- (ACXDevice)init;
- (ACXDevice)initWithIDSDevice:(id)a3 messager:(id)a4;
- (ACXIDSMessaging)messager;
- (BOOL)_onQueue_isReachable;
- (BOOL)deletableSystemAppStateIsMirrored;
- (BOOL)isActivePairedDevice;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (BOOL)isTombstone;
- (BOOL)supportsStandaloneApps;
- (BOOL)supportsTrackingAppRemovability;
- (BOOL)syncingIsRestricted;
- (BOOL)usesLegacySocketService;
- (NRDevice)nrDevice;
- (NSHashTable)observers;
- (NSString)UUID;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)osBuildVersion;
- (NSString)osVersion;
- (NSString)productType;
- (NSString)serialNumber;
- (NSString)watchSize;
- (NSURL)pairingStoreURL;
- (NSUUID)pairingID;
- (OS_dispatch_queue)internalQueue;
- (int)cpuSubtype;
- (int)cpuType;
- (unint64_t)hash;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIsActivePairedDevice:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsTombstone:(BOOL)a3;
- (void)setMessager:(id)a3;
- (void)setSupportsStandaloneApps:(BOOL)a3;
- (void)setSyncingIsRestricted:(BOOL)a3;
- (void)updateIDSDevice:(id)a3 forMessager:(id)a4;
@end

@implementation ACXDevice

- (ACXDevice)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACXDevice;
  v2 = [(ACXDevice *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appconduitd.device_internal_queue", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (ACXDevice)initWithIDSDevice:(id)a3 messager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACXDevice *)self init];
  if (!v8) {
    goto LABEL_6;
  }
  if (!v6)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_16;
    }
LABEL_15:
    MOLogWrite();
LABEL_16:
    v15 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = IDSCopyIDForDevice();
  idsDeviceIdentifier = v8->_idsDeviceIdentifier;
  v8->_idsDeviceIdentifier = (NSString *)v9;

  v11 = [(ACXDevice *)v8 idsDeviceIdentifier];

  if (!v11)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  [(ACXDevice *)v8 updateIDSDevice:v6 forMessager:v7];
  v12 = [(ACXDevice *)v8 nrDevice];

  if (!v12)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v13 = +[ACXPairedSyncDelegate sharedSyncDelegate];
  v14 = [(ACXDevice *)v8 pairingID];
  -[ACXDevice setSyncingIsRestricted:](v8, "setSyncingIsRestricted:", [v13 syncingIsRestrictedForPairingID:v14]);

LABEL_6:
  v15 = v8;
LABEL_17:

  return v15;
}

- (void)updateIDSDevice:(id)a3 forMessager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ACXDevice *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030D38;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(ACXDevice *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000311E0;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(ACXDevice *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000312E8;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSUUID)pairingID
{
  v2 = [(ACXDevice *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyPairingID];

  return (NSUUID *)v3;
}

- (NSURL)pairingStoreURL
{
  v2 = [(ACXDevice *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];

  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

- (BOOL)_onQueue_isReachable
{
  BOOL v3 = [(ACXDevice *)self isConnected];
  if (v3)
  {
    LOBYTE(v3) = [(ACXDevice *)self isActivePairedDevice];
  }
  return v3;
}

- (BOOL)isReachable
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(ACXDevice *)self internalQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003152C;
  v5[3] = &unk_10008C950;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSString)model
{
  BOOL v3 = [(ACXDevice *)self nrDevice];
  id v4 = [v3 valueForProperty:NRDevicePropertyModelNumber];

  v5 = [(ACXDevice *)self nrDevice];
  uint64_t v6 = [v5 valueForProperty:NRDevicePropertyRegionInfo];

  if (!v6) {
    uint64_t v6 = &stru_10008F348;
  }
  if ([v4 length])
  {
    id v7 = +[NSString stringWithFormat:@"%@%@", v4, v6];
  }
  else
  {
    id v7 = @"N/A";
  }

  return (NSString *)v7;
}

- (NSString)watchSize
{
  v2 = [(ACXDevice *)self productType];
  unsigned int v3 = NRDeviceSizeForProductType();
  if (v3 > 4) {
    CFStringRef v4 = @"Unhandled";
  }
  else {
    CFStringRef v4 = *(&off_10008D8C0 + (__int16)v3);
  }

  return &v4->isa;
}

- (NSString)productType
{
  v2 = [(ACXDevice *)self nrDevice];
  unsigned int v3 = [v2 valueForProperty:NRDevicePropertyProductType];

  return (NSString *)v3;
}

- (NSString)osVersion
{
  v2 = [(ACXDevice *)self nrDevice];
  unsigned int v3 = [v2 valueForProperty:NRDevicePropertySystemVersion];

  return (NSString *)v3;
}

- (NSString)osBuildVersion
{
  v2 = [(ACXDevice *)self nrDevice];
  unsigned int v3 = [v2 valueForProperty:NRDevicePropertySystemBuildVersion];

  return (NSString *)v3;
}

- (NSString)serialNumber
{
  v2 = [(ACXDevice *)self nrDevice];
  unsigned int v3 = [v2 valueForProperty:NRDevicePropertySerialNumber];

  return (NSString *)v3;
}

- (NSString)UUID
{
  v2 = [(ACXDevice *)self nrDevice];
  unsigned int v3 = [v2 valueForProperty:NRDevicePropertyUDID];

  return (NSString *)v3;
}

- (int)cpuType
{
  unsigned int v3 = [(ACXDevice *)self nrDevice];
  CFStringRef v4 = [v3 valueForProperty:NRDevicePropertyCPUType];

  if (!v4
    && ([(ACXDevice *)self osVersion],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 compare:@"5.0" options:64],
        v5,
        v6 == (id)-1))
  {
    int v7 = 12;
  }
  else
  {
    int v7 = [v4 intValue];
  }

  return v7;
}

- (int)cpuSubtype
{
  unsigned int v3 = [(ACXDevice *)self nrDevice];
  CFStringRef v4 = [v3 valueForProperty:NRDevicePropertyCPUSubType];

  if (!v4
    && ([(ACXDevice *)self osVersion],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 compare:@"5.0" options:64],
        v5,
        v6 == (id)-1))
  {
    int v7 = 12;
  }
  else
  {
    int v7 = [v4 intValue];
  }

  return v7;
}

- (BOOL)deletableSystemAppStateIsMirrored
{
  return 1;
}

- (BOOL)usesLegacySocketService
{
  v2 = [(ACXDevice *)self messager];
  unsigned int v3 = [v2 serviceName];
  char v4 = [v3 isEqualToString:@"com.apple.private.alloy.appsyncconduit.v2"] ^ 1;

  return v4;
}

- (unint64_t)hash
{
  v2 = [(ACXDevice *)self idsDeviceIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (ACXDevice *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(ACXDevice *)v4 idsDeviceIdentifier];
      id v6 = [(ACXDevice *)self idsDeviceIdentifier];
      unsigned __int8 v7 = [v5 isEqualToString:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (NRDevice)nrDevice
{
  return self->_nrDevice;
}

- (ACXIDSMessaging)messager
{
  return self->_messager;
}

- (void)setMessager:(id)a3
{
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (BOOL)isActivePairedDevice
{
  return self->_isActivePairedDevice;
}

- (void)setIsActivePairedDevice:(BOOL)a3
{
  self->_isActivePairedDevice = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)supportsStandaloneApps
{
  return self->_supportsStandaloneApps;
}

- (void)setSupportsStandaloneApps:(BOOL)a3
{
  self->_supportsStandaloneApps = a3;
}

- (BOOL)isTombstone
{
  return self->_isTombstone;
}

- (void)setIsTombstone:(BOOL)a3
{
  self->_isTombstone = a3;
}

- (BOOL)supportsTrackingAppRemovability
{
  return self->_supportsTrackingAppRemovability;
}

- (BOOL)syncingIsRestricted
{
  return self->_syncingIsRestricted;
}

- (void)setSyncingIsRestricted:(BOOL)a3
{
  self->_syncingIsRestricted = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_messager, 0);

  objc_storeStrong((id *)&self->_nrDevice, 0);
}

@end