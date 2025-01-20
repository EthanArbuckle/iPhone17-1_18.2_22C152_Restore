@interface IDSPairingManager
+ (BOOL)_isEncryptionKeyRegenerationSupportedByCapabilityFlags:(unint64_t)a3;
+ (BOOL)_isIPsecSupportedByCapabilityFlags:(unint64_t)a3;
+ (BOOL)_isTinkerPairedInCapabilityFlags:(unint64_t)a3;
+ (IDSPairingManager)sharedInstance;
+ (void)devicePairingProtocolVersion:(unsigned int *)a3 minCompatibilityVersion:(unsigned int *)a4 maxCompatibilityVersion:(unsigned int *)a5;
- (BOOL)_hasAllEncryptionKeys;
- (BOOL)_isPairedToDevice:(id)a3;
- (BOOL)_markSecuredEncryptionKeysAsRegenerated:(BOOL)a3;
- (BOOL)_purgeSecuredEncryptionKeysForAllPairedDevices;
- (BOOL)activePairedDeviceHasPairingType:(int64_t)a3;
- (BOOL)addLocalPairedDevice:(id)a3 BTOutOfBandKey:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5 pairingType:(int64_t)a6 bluetoothMACAddress:(id)a7;
- (BOOL)isCurrentDevicePairedOrPairing;
- (BOOL)isCurrentDeviceTinkerConfiguredWatch;
- (BOOL)isMissingAnyPublicKeyForPairedDeviceWithCBUUID:(id)a3;
- (BOOL)isPaired;
- (BOOL)isTraditionalDevicePairedOrPairing;
- (BOOL)pairedDeviceSupportsSendLaterMessages;
- (BOOL)removeLocalPairedDevice:(id)a3;
- (BOOL)setPairedDeviceInfo:(id)a3;
- (BOOL)shouldQuickSwitchAfterIPSecConnected;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice;
- (BOOL)shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:(BOOL)a3;
- (BOOL)updateLocalPairedDevice:(id)a3 pairingType:(int64_t)a4;
- (BOOL)updatePairedDeviceBuildVersion:(id)a3 productVersion:(id)a4 productName:(id)a5 pairingProtocolVersion:(unsigned int)a6 minCompatibilityVersion:(unsigned int)a7 maxCompatibilityVersion:(unsigned int)a8 serviceMinCompatibilityVersion:(unsigned __int16)a9 capabilityFlags:(unint64_t)a10 deviceUniqueID:(id)a11;
- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4;
- (BOOL)updatePairedDeviceiCloudURIs:(id)a3 pushToken:(id)a4;
- (IDSPairedDeviceRepository)pairedDeviceRepository;
- (IDSPairingManager)init;
- (IDSPairingManager)initWithNRDeviceManager:(id)a3 pairedDeviceRepository:(id)a4;
- (NRDeviceManager)nrDeviceManager;
- (NSData)pairedDevicePublicClassAKey;
- (NSData)pairedDevicePublicClassCKey;
- (NSData)pairedDevicePublicKey;
- (NSData)pairedDevicePushToken;
- (NSDictionary)localDevice;
- (NSDictionary)pairedDevice;
- (NSDictionary)pairedDevicePrivateData;
- (NSMutableArray)registeredPairedDeviceDidConnectBlockPairs;
- (NSSet)allPairedDevices;
- (NSSet)allPairedUniqueIDs;
- (NSSet)allTraditionallyPairedUniqueIDs;
- (NSString)description;
- (NSString)pairedDeviceProductVersion;
- (NSString)pairedDeviceUniqueID;
- (id)_activePairedDeviceCBUUID;
- (id)_cbuuidsWithIsPairingValue:(BOOL)a3;
- (id)_createRegistrationProperties:(BOOL)a3 maxCompatibilityVersion:(id)a4 BTOutOfBandKey:(id)a5 supportsIPsecWithSPPLink:(BOOL)a6 bluetoothMACAddress:(id)a7;
- (id)_identityDataErrorPairForDataProtectionClass:(unsigned int)a3;
- (id)_localDevicePrivateData;
- (id)_nrDeviceIdentifierWithCBUUID:(id)a3;
- (id)allPairedDevicesWithType:(int64_t)a3;
- (id)cbuuidsOfPairedDevices;
- (id)cbuuidsOfPairingDevices;
- (id)localDeviceRecord;
- (id)pairedDeviceBuildVersion;
- (id)pairedDeviceForUniqueID:(id)a3;
- (id)pairedDeviceHandlesWithPairingType:(int64_t)a3;
- (id)pairedDeviceProductName;
- (id)pairedDeviceRecords;
- (id)pairedDeviceiCloudURIs;
- (id)uniqueIDToCbuuidsOfPairingDevicesDictionary;
- (int64_t)_migrateSecuredEncryptionKeys;
- (int64_t)activatePairedDeviceWithCBUUID:(id)a3;
- (int64_t)pairedDevicePairingType;
- (unint64_t)_hasRegeneratedSecuredEncryptionKeys;
- (unsigned)pairedDeviceMaxCompatibilityVersion;
- (unsigned)pairedDeviceMinCompatibilityVersion;
- (unsigned)pairedDevicePairingProtocolVersion;
- (unsigned)pairedDeviceServiceMinCompatibilityVersion;
- (void)_callPairedDeviceDidConnectBlocksForUniqueID:(id)a3 withError:(id)a4;
- (void)_clearPairedDeviceDidConnectBlocksForUniqueID:(id)a3;
- (void)_loadPairedDevicePropertiesIfNeeded;
- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 properties:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5;
- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 wasInitiallySetupUsingIDSPairing:(BOOL)a4 maxCompatibilityVersion:(id)a5 BTOutOfBandKey:(id)a6 supportsIPsecWithSPPLink:(BOOL)a7 bluetoothMACAddress:(id)a8;
- (void)_notifyDelegatesDevicePairedToDevice:(id)a3;
- (void)_notifyDelegatesDeviceUnpairedFromDevice:(id)a3;
- (void)_notifyDelegatesWithBlock:(id)a3;
- (void)_regenerateSecuredEncryptionKeys;
- (void)_requestPairedDeviceInfo;
- (void)_requestPairedDeviceInfoAfterDelay:(double)a3;
- (void)_suspendOTRSessionsWithProtectionClass:(unsigned int)a3;
- (void)_updateActiveStateForAllPairedDevices;
- (void)_updateActiveStateForAllPairedDevices:(BOOL)a3;
- (void)_updatePairedState:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)deactivatePairedDevices;
- (void)dealloc;
- (void)deliveryController:(id)a3 foundNearbyIPsecCapableDeviceWithUniqueID:(id)a4;
- (void)disconnectActivePairedDevice;
- (void)ensureCommunicationWithActivePairedDeviceIsPossible;
- (void)gatherLocalDeviceInfoWithCompletionBlock:(id)a3;
- (void)refreshPairedDeviceEncryptionKeys;
- (void)registerPairedDeviceWithUniqueID:(id)a3 didConnectBlock:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setBTOutOfBandKey:(id)a3 forCBUUID:(id)a4;
- (void)setShouldQuickSwitchAfterIPSecConnected:(BOOL)a3;
- (void)updateNetworkRelayStateForAllPairedDevices;
@end

@implementation IDSPairingManager

- (NSString)pairedDeviceUniqueID
{
  v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  v3 = [v2 activePairedDevice];
  v4 = [v3 uniqueID];

  return (NSString *)v4;
}

- (IDSPairedDeviceRepository)pairedDeviceRepository
{
  return self->_pairedDeviceRepository;
}

+ (IDSPairingManager)sharedInstance
{
  if (qword_100A4A8D8 != -1) {
    dispatch_once(&qword_100A4A8D8, &stru_100984730);
  }
  v2 = (void *)qword_100A4A8E0;

  return (IDSPairingManager *)v2;
}

- (id)allPairedDevicesWithType:(int64_t)a3
{
  v4 = [(IDSPairingManager *)self pairedDeviceRepository];
  v5 = [v4 allPairedDevicesWithType:a3];

  return v5;
}

- (void)_notifyDelegatesWithBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[IDSPairingManager _notifyDelegatesWithBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(NSHashTable *)self->_delegateMap copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_notifyDelegatesDevicePairedToDevice:(id)a3
{
  v4 = (char *)a3;
  v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[IDSPairingManager _notifyDelegatesDevicePairedToDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying all IDS accounts device paired to: %@", buf, 0xCu);
  }

  [v4 dictionaryRepresentation];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001907E4;
  v8[3] = &unk_100984758;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [(IDSPairingManager *)self _notifyDelegatesWithBlock:v8];
}

- (void)_notifyDelegatesDeviceUnpairedFromDevice:(id)a3
{
  v4 = (char *)a3;
  v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[IDSPairingManager _notifyDelegatesDeviceUnpairedFromDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying all IDS accounts device unpaired from: %@", buf, 0xCu);
  }

  [v4 dictionaryRepresentation];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001909D4;
  v8[3] = &unk_100984758;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [(IDSPairingManager *)self _notifyDelegatesWithBlock:v8];
}

- (void)_requestPairedDeviceInfoAfterDelay:(double)a3
{
}

- (void)_requestPairedDeviceInfo
{
  v3 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v4 = [(IDSPairingManager *)self _activePairedDeviceCBUUID];
  BOOL v5 = [v4 length] == 0;

  if (v5)
  {
    id v6 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Cannot send paired device info request because we don't have the device's Bluetooth identifier.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_7;
  }
  if ([(IDSCountdown *)self->_pairedDeviceInfoRequestCountdown isCountingDown])
  {
    id v6 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Ignoring paired device info request because another request is already in flight.", (uint8_t *)&buf, 0xCu);
    }
LABEL_7:

    return;
  }
  [(IDSCountdown *)self->_pairedDeviceInfoRequestCountdown startCountingDown];
  id v7 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[IDSPairingManager _requestPairedDeviceInfo]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Sending paired device info request.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3032000000;
  long long v12 = sub_100190E44;
  long long v13 = sub_100190E54;
  id v14 = (id)0xAAAAAAAAAAAAAAAALL;
  id v14 = objc_alloc_init((Class)IDSRemoteCredential);
  [*(id *)(*((void *)&buf + 1) + 40) setWantsRetries:1];
  id v8 = *(void **)(*((void *)&buf + 1) + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100190E5C;
  v9[3] = &unk_10097ED88;
  v9[4] = &buf;
  [v8 sendIDSLocalDeviceInfoRequestWithCompletionBlock:v9];
  _Block_object_dispose(&buf, 8);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IDSPairingManager;
  [(IDSPairingManager *)&v4 dealloc];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)IDSPairingManager;
  v3 = [(IDSPairingManager *)&v6 description];
  objc_super v4 = +[NSString stringWithFormat:@"%@ -- %@", v3, self->_pairedDeviceRepository];

  return (NSString *)v4;
}

- (IDSPairingManager)initWithNRDeviceManager:(id)a3 pairedDeviceRepository:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IDSPairingManager;
  id v9 = [(IDSPairingManager *)&v22 init];
  uint64_t v10 = v9;
  if (v9)
  {
    cbuuidToBTOutOfBandKeyDictionary = v9->_cbuuidToBTOutOfBandKeyDictionary;
    v9->_cbuuidToBTOutOfBandKeyDictionary = 0;

    long long v12 = [[IDSCountdown alloc] initWithTimeInterval:15.0];
    pairedDeviceInfoRequestCountdown = v10->_pairedDeviceInfoRequestCountdown;
    v10->_pairedDeviceInfoRequestCountdown = v12;

    registeredPairedDeviceDidConnectBlockPairs = v10->_registeredPairedDeviceDidConnectBlockPairs;
    v10->_registeredPairedDeviceDidConnectBlockPairs = 0;

    objc_storeStrong((id *)&v10->_pairedDeviceRepository, a4);
    objc_storeStrong((id *)&v10->_nrDeviceManager, a3);
    long long v15 = +[IMSystemMonitor sharedInstance];
    [v15 setActive:1];

    v16 = +[IMSystemMonitor sharedInstance];
    [v16 setWatchesDataProtectionLockState:1];

    v17 = +[IMSystemMonitor sharedInstance];
    [v17 _addEarlyListener:v10];

    [(IDSPairingManager *)v10 _loadPairedDevicePropertiesIfNeeded];
    [IDSPairingStateChangedNotification UTF8String];
    v18 = (const char *)IMUserScopedNotification();
    notify_register_check(v18, &v10->_pairingStateToken);
    [(IDSPairingManager *)v10 _updatePairedState:[(IDSPairingManager *)v10 isPaired]];
    v19 = IMGetDomainValueForKey();

    if (!v19)
    {
      v20 = [(IDSPairingManager *)v10 pairedDeviceUUIDString];
      if (v20) {
        IMSetDomainValueForKey();
      }
    }
    [(IDSPairingManager *)v10 _updateActiveStateForAllPairedDevices];
    [(IDSPairingManager *)v10 updateNetworkRelayStateForAllPairedDevices];
  }

  return v10;
}

- (IDSPairingManager)init
{
  v3 = objc_alloc_init(IDSPairedDeviceKeychainPersister);
  id v4 = +[NRDeviceManager copySharedDeviceManager];
  BOOL v5 = [[IDSPairedDeviceRepository alloc] initWithPersister:v3];
  objc_super v6 = [(IDSPairingManager *)self initWithNRDeviceManager:v4 pairedDeviceRepository:v5];

  return v6;
}

- (void)setBTOutOfBandKey:(id)a3 forCBUUID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    cbuuidToBTOutOfBandKeyDictionary = self->_cbuuidToBTOutOfBandKeyDictionary;
    id v8 = v12;
    if (v12)
    {
      if (!cbuuidToBTOutOfBandKeyDictionary)
      {
        id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v10 = self->_cbuuidToBTOutOfBandKeyDictionary;
        self->_cbuuidToBTOutOfBandKeyDictionary = v9;

        id v8 = v12;
        cbuuidToBTOutOfBandKeyDictionary = self->_cbuuidToBTOutOfBandKeyDictionary;
      }
      [(NSMutableDictionary *)cbuuidToBTOutOfBandKeyDictionary setObject:v8 forKeyedSubscript:v6];
    }
    else
    {
      [(NSMutableDictionary *)cbuuidToBTOutOfBandKeyDictionary setObject:0 forKeyedSubscript:v6];
      if (![(NSMutableDictionary *)self->_cbuuidToBTOutOfBandKeyDictionary count])
      {
        uint64_t v11 = self->_cbuuidToBTOutOfBandKeyDictionary;
        self->_cbuuidToBTOutOfBandKeyDictionary = 0;
      }
    }
  }
}

- (void)_loadPairedDevicePropertiesIfNeeded
{
  if (!self->_hasLoadedPairedDevices)
  {
    v3 = [(IDSPairingManager *)self pairedDeviceRepository];
    self->_hasLoadedPairedDevices = [v3 loadPairedDevicesFromStorage];

    if (self->_hasLoadedPairedDevices)
    {
      [(IDSPairingManager *)self _migrateSecuredEncryptionKeys];
      [(IDSPairingManager *)self _requestPairedDeviceInfoAfterDelay:10.0];
      id v4 = [(IDSPairingManager *)self pairedDevice];
      BOOL v5 = v4;
      if (v4)
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_10019134C;
        v6[3] = &unk_100984758;
        id v7 = v4;
        [(IDSPairingManager *)self _notifyDelegatesWithBlock:v6];
      }
    }
  }
}

- (int64_t)_migrateSecuredEncryptionKeys
{
  v2 = +[IDSRegistrationKeyManager sharedInstance];
  unsigned int v3 = [v2 isUsingSecureStorageForClassA];
  unsigned __int8 v4 = [v2 isUsingSecureStorageForClassC];
  unsigned __int8 v5 = v4;
  if (!v3 || (v4 & 1) == 0)
  {
    id v7 = +[IMSystemMonitor sharedInstance];
    unsigned int v8 = [v7 isUnderDataProtectionLock];

    if (v8)
    {
      id v9 = +[IMRGLog migration];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migration is prohibited.", buf, 2u);
      }
      int64_t v6 = 1;
      goto LABEL_24;
    }
    if ((v3 & 1) == 0)
    {
      unsigned int v10 = [v2 migrateToSecureStorageForClassA];
      uint64_t v11 = +[IMRGLog migration];
      id v9 = v11;
      if (!v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_10071454C();
        }
LABEL_23:
        int64_t v6 = 2;
LABEL_24:

        goto LABEL_25;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrated key to class A.", v16, 2u);
      }
    }
    if (v5)
    {
      int64_t v6 = 3;
      goto LABEL_25;
    }
    unsigned int v12 = [v2 migrateToSecureStorageForClassC];
    long long v13 = +[IMRGLog migration];
    id v9 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrated key to class C.", v15, 2u);
      }
      int64_t v6 = 3;
      goto LABEL_24;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100714518();
    }
    goto LABEL_23;
  }
  int64_t v6 = 0;
LABEL_25:

  return v6;
}

- (unint64_t)_hasRegeneratedSecuredEncryptionKeys
{
  if (self->_isPendingResetOfKeyRegenerationFlag)
  {
    if ([(IDSPairingManager *)self _markSecuredEncryptionKeysAsRegenerated:0])
    {
      self->_isPendingResetOfKeyRegenerationFlag = 0;
      unsigned int v3 = +[IMRGLog regeneration];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v13 = "-[IDSPairingManager _hasRegeneratedSecuredEncryptionKeys]";
        unsigned __int8 v4 = "%s Set the pending-reset flag back to NO.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
      }
    }
    else
    {
      unsigned int v3 = +[IMRGLog regeneration];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v13 = "-[IDSPairingManager _hasRegeneratedSecuredEncryptionKeys]";
        unsigned __int8 v4 = "%s Could not set the pending-reset flag back to NO.";
        goto LABEL_11;
      }
    }
    unint64_t v8 = 2;
    goto LABEL_21;
  }
  char v5 = IMGetKeychainData();
  int64_t v6 = 0;
  unsigned int v3 = v6;
  if (v5)
  {
    id v9 = [v6 length];
    if (v9) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = 2;
    }
    id v7 = +[IMRGLog regeneration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"YES";
      if (!v9) {
        CFStringRef v10 = @"NO";
      }
      *(_DWORD *)long long buf = 138412290;
      long long v13 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Able to determine the has-regenerated-secured-encryption-key status. Has regenerated? %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = +[IMRGLog regeneration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to determine the has-regenerated-secured-encryption-key status. keychainError: %d", buf, 8u);
    }
    unint64_t v8 = 0;
  }

LABEL_21:
  return v8;
}

- (BOOL)_markSecuredEncryptionKeysAsRegenerated:(BOOL)a3
{
  if (a3)
  {
    unsigned int v3 = [@"regenerated" dataUsingEncoding:4];
    *(_DWORD *)id v9 = 0;
    int v4 = IMSetKeychainDataWithProtection();
    char v5 = +[IMRGLog regeneration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      *(_DWORD *)long long buf = 138412802;
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      CFStringRef v11 = @"YES";
      __int16 v12 = 2112;
      CFStringRef v13 = v6;
      __int16 v14 = 1024;
      int v15 = *(_DWORD *)v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updated the has-regenerated-secured-encryption-keys flag to: %@  success? %@  keychainError: %d", buf, 0x1Cu);
    }
  }
  else
  {
    *(_DWORD *)long long buf = 0;
    int v4 = IMRemoveKeychainData();
    id v7 = +[IMRGLog regeneration];
    unsigned int v3 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removed the has-regenerated-secured-encryption-keys flag from the keychain.", v9, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      sub_100714580((int *)buf, v3);
    }
  }

  return v4;
}

+ (BOOL)_isEncryptionKeyRegenerationSupportedByCapabilityFlags:(unint64_t)a3
{
  return (a3 >> 5) & 1;
}

+ (BOOL)_isIPsecSupportedByCapabilityFlags:(unint64_t)a3
{
  return (a3 >> 8) & 1;
}

+ (BOOL)_isTinkerPairedInCapabilityFlags:(unint64_t)a3
{
  return (a3 >> 10) & 1;
}

- (void)_regenerateSecuredEncryptionKeys
{
  unsigned int v3 = +[IMRGLog regeneration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Suspending OTR sessions for protection classes A and C...", buf, 2u);
  }

  [(IDSPairingManager *)self _suspendOTRSessionsWithProtectionClass:1];
  [(IDSPairingManager *)self _suspendOTRSessionsWithProtectionClass:0];
  int v4 = +[IMRGLog regeneration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Regenerating encryption keys for protection classes A and C...", v6, 2u);
  }

  char v5 = +[IDSRegistrationKeyManager sharedInstance];
  [v5 regeneratePairingIdentitiesIncludingClassD:0];
}

- (void)_suspendOTRSessionsWithProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = +[IDSOTRController sharedInstance];
  char v5 = +[IDSOTRKeyStorage sharedInstance];
  v21 = sub_10028BE18(0, v3);
  v30[0] = v21;
  CFStringRef v6 = sub_10028BE18(100, v3);
  v30[1] = v6;
  id v7 = sub_10028BE18(200, v3);
  v30[2] = v7;
  unint64_t v8 = sub_10028BE18(300, v3);
  v30[3] = v8;
  id v9 = sub_10028BE5C(100, v3, @"UTunDelivery_Default_Sync");
  v30[4] = v9;
  CFStringRef v10 = sub_10028BE5C(200, v3, @"UTunDelivery_Default_Default");
  v30[5] = v10;
  CFStringRef v11 = sub_10028BE5C(300, v3, @"UTunDelivery_Default_Urgent");
  v30[6] = v11;
  __int16 v12 = sub_10028BE5C(300, v3, @"UTunDelivery_Default_UrgentCloud");
  v30[7] = v12;
  CFStringRef v13 = +[NSArray arrayWithObjects:v30 count:8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    uint64_t v22 = 138412290;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v20 = +[IMRGLog regeneration];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v22;
          uint64_t v28 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Suspending OTR session with token: %@", buf, 0xCu);
        }

        [v5 removeSessionKeyForToken:v19];
        [v4 suspendSessionNegotiation:v19 askedByPairedDevice:0];
      }
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v16);
  }
}

- (BOOL)_purgeSecuredEncryptionKeysForAllPairedDevices
{
  v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 purgeSecuredEncryptionKeysForAllPairedDevices];

  int v4 = +[IMRGLog regeneration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Purged encryption keys for all paired devices. Success: %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (NSDictionary)localDevice
{
  unsigned int v3 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[IDSPairingManager localDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v16, 0xCu);
  }

  CFStringRef v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v6 = +[IDSCurrentDevice sharedInstance];
  int v7 = +[FTDeviceSupport sharedInstance];
  CFStringRef v8 = [v6 deviceIdentifier];
  if (v8) {
    CFDictionarySetValue(v5, IDSDevicePropertyIdentifier, v8);
  }

  id v9 = [v6 encryptionClassAKey];
  if (v9) {
    CFDictionarySetValue(v5, IDSDevicePropertyEncryptionClassAKey, v9);
  }

  CFStringRef v10 = [v6 encryptionClassCKey];
  if (v10) {
    CFDictionarySetValue(v5, IDSDevicePropertyEncryptionClassCKey, v10);
  }

  CFStringRef v11 = [v6 encryptionClassDKey];
  if (v11) {
    CFDictionarySetValue(v5, IDSDevicePropertyEncryptionKey, v11);
  }

  __int16 v12 = [(IDSPairingManager *)self _localDevicePrivateData];
  if (v12) {
    CFDictionarySetValue(v5, IDSDevicePropertyPrivateDeviceData, v12);
  }

  CFStringRef v13 = [v7 deviceName];
  if (v13) {
    CFDictionarySetValue(v5, IDSDevicePropertyName, v13);
  }

  id v14 = [v7 model];
  if (v14) {
    CFDictionarySetValue(v5, IDSDevicePropertyHardwareVersion, v14);
  }

  return (NSDictionary *)v5;
}

- (id)_localDevicePrivateData
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v3 = +[FTDeviceSupport sharedInstance];
  id v4 = [v3 supportsSMS];
  id v5 = [v3 supportsMMS];
  id v6 = [v3 supportsApplePay];
  id v7 = [v3 supportsHandoff];
  id v8 = [v3 supportsTethering];
  id v9 = +[IDSCTAdapter sharedInstance];
  if ([v9 supportsIdentification])
  {
    CFStringRef v10 = +[FTDeviceSupport sharedInstance];
    BOOL v11 = [v10 deviceType] == (id)2;
  }
  else
  {
    BOOL v11 = 0;
  }

  __int16 v12 = _IDSPrivateDeviceDataVersionNumber();
  CFStringRef v13 = [v12 stringValue];
  [v2 setObject:v13 forKeyedSubscript:IDSPrivateDeviceDataVersion];

  id v14 = +[NSNumber numberWithBool:v6];
  id v15 = [v14 stringValue];
  [v2 setObject:v15 forKeyedSubscript:IDSPrivateDeviceDataSupportsApplePay];

  int v16 = +[NSNumber numberWithBool:v7];
  uint64_t v17 = [v16 stringValue];
  [v2 setObject:v17 forKeyedSubscript:IDSPrivateDeviceDataSupportsHandoff];

  v18 = +[NSNumber numberWithBool:v8];
  uint64_t v19 = [v18 stringValue];
  [v2 setObject:v19 forKeyedSubscript:IDSPrivateDeviceDataSupportsTethering];

  v20 = +[NSNumber numberWithBool:v4];
  v21 = [v20 stringValue];
  [v2 setObject:v21 forKeyedSubscript:IDSPrivateDeviceDataSupportsSMSRelay];

  uint64_t v22 = +[NSNumber numberWithBool:v5];
  long long v23 = [v22 stringValue];
  [v2 setObject:v23 forKeyedSubscript:IDSPrivateDeviceDataSupportsMMSRelay];

  long long v24 = +[NSNumber numberWithBool:v11];
  long long v25 = [v24 stringValue];
  [v2 setObject:v25 forKeyedSubscript:IDSPrivateDeviceDataSupportsPhoneCalls];

  long long v26 = +[IMDeviceSupport sharedInstance];
  v27 = [v26 productBuildVersion];
  if (v27) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataProductBuildVersion, v27);
  }

  uint64_t v28 = [v26 productName];
  if (v28) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataProductName, v28);
  }

  v29 = [v26 productVersion];
  if (v29) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataProductVersion, v29);
  }

  v30 = [v3 deviceColor];
  if (v30) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataColor, v30);
  }

  v31 = [v3 enclosureColor];
  if (v31) {
    CFDictionarySetValue((CFMutableDictionaryRef)v2, IDSPrivateDeviceDataEnclosureColor, v31);
  }

  return v2;
}

- (void)gatherLocalDeviceInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315138;
    v31 = "-[IDSPairingManager gatherLocalDeviceInfoWithCompletionBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v30, 0xCu);
  }

  if (v4)
  {
    id v6 = (void (**)(id, void *))[v4 copy];
    id v7 = [(IDSPairingManager *)self localDevice];
    id v8 = [v7 objectForKey:IDSDevicePropertyEncryptionKey];
    id v9 = [v7 objectForKey:IDSDevicePropertyEncryptionClassAKey];
    CFStringRef v10 = [v7 objectForKey:IDSDevicePropertyEncryptionClassCKey];
    BOOL v11 = [(IDSPairingManager *)self pairedDevicePublicKey];
    if (v11)
    {
      __int16 v12 = [(IDSPairingManager *)self pairedDevicePublicClassAKey];
      if (v12)
      {
        CFStringRef v13 = [(IDSPairingManager *)self pairedDevicePublicClassCKey];
        BOOL v14 = v13 == 0;
      }
      else
      {
        BOOL v14 = 1;
      }
    }
    else
    {
      BOOL v14 = 1;
    }

    if ([v8 length] && objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    {
      id v15 = +[IMRGLog pairing];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "We have all the encryption keys, sending device info back", (uint8_t *)&v30, 2u);
      }

      v6[2](v6, v7);
      id block = self->_block;
      if (block)
      {
        self->_id block = 0;
      }
      if (v14)
      {
        uint64_t v17 = +[IMRGLog NRPairing];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "We're missing their keys but we sent our keys, requesting...", (uint8_t *)&v30, 2u);
        }

        [(IDSPairingManager *)self _requestPairedDeviceInfoAfterDelay:0.0];
      }
      goto LABEL_43;
    }
    v18 = +[IMSystemMonitor sharedInstance];
    unsigned int v19 = [v18 isUnderDataProtectionLock];

    v20 = +[IMSystemMonitor sharedInstance];
    unsigned int v21 = [v20 isUnderFirstDataProtectionLock];

    uint64_t v22 = +[IMRGLog pairing];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v23 = @"NO";
      int v30 = 134219010;
      v31 = (const char *)v9;
      if (v19) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      __int16 v32 = 2048;
      v33 = v10;
      if (v21) {
        CFStringRef v23 = @"YES";
      }
      __int16 v34 = 2048;
      v35 = v8;
      __int16 v36 = 2112;
      CFStringRef v37 = v24;
      __int16 v38 = 2112;
      CFStringRef v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "We're missing some keys (A: %p) (C: %p) (D: %p) (locked: %@) (firstLocked: %@)", (uint8_t *)&v30, 0x34u);
    }

    if ([v9 length])
    {
      if ([v10 length])
      {
        if ([v8 length]) {
          goto LABEL_43;
        }
        long long v25 = +[IMRGLog warning];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          sub_1007145FC();
        }

        v6[2](v6, v7);
        id v26 = self->_block;
        if (!v26) {
          goto LABEL_43;
        }
        self->_id block = 0;
        goto LABEL_42;
      }
      v27 = +[IMRGLog pairing];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        uint64_t v28 = "Missing class C key, waiting for keychain save...";
        goto LABEL_39;
      }
    }
    else
    {
      v27 = +[IMRGLog pairing];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        uint64_t v28 = "Missing class A key, waiting for keychain save...";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v30, 2u);
      }
    }

    if (!v6)
    {
LABEL_43:

      goto LABEL_44;
    }
    v29 = objc_retainBlock(v6);
    id v26 = self->_block;
    self->_id block = v29;
LABEL_42:

    goto LABEL_43;
  }
LABEL_44:
}

- (id)_activePairedDeviceCBUUID
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  id v4 = [v3 cbuuid];

  return v4;
}

- (id)pairedDeviceBuildVersion
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  id v4 = [v3 buildVersion];

  return v4;
}

- (NSString)pairedDeviceProductVersion
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  id v4 = [v3 productVersion];

  return (NSString *)v4;
}

- (id)pairedDeviceProductName
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  id v4 = [v3 productName];

  return v4;
}

- (unsigned)pairedDevicePairingProtocolVersion
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned int v4 = [v3 pairingProtocolVersion];

  return v4;
}

- (unsigned)pairedDeviceMinCompatibilityVersion
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned int v4 = [v3 minCompatibilityVersion];

  return v4;
}

- (unsigned)pairedDeviceMaxCompatibilityVersion
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned int v4 = [v3 maxCompatibilityVersion];

  return v4;
}

- (unsigned)pairedDeviceServiceMinCompatibilityVersion
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned __int16 v4 = (unsigned __int16)[v3 serviceMinCompatibilityVersion];

  return v4;
}

- (BOOL)activePairedDeviceHasPairingType:(int64_t)a3
{
  unsigned __int16 v4 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v5 = [v4 activePairedDevice];
  LOBYTE(a3) = [v5 pairingType] == (id)a3;

  return a3;
}

- (BOOL)isCurrentDeviceTinkerConfiguredWatch
{
  return 0;
}

- (NSSet)allPairedDevices
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 allPairedDevices];

  return (NSSet *)v3;
}

- (id)pairedDeviceHandlesWithPairingType:(int64_t)a3
{
  unsigned __int16 v4 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v5 = [v4 allPairedDevicesWithType:a3];

  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        CFStringRef v13 = objc_msgSend(v12, "iCloudURIs", (void)v17);
        id v14 = [v13 count];

        if (v14)
        {
          id v15 = [v12 iCloudURIs];
          [v6 addObjectsFromArray:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (NSDictionary)pairedDevice
{
  if ([(IDSPairingManager *)self isPaired])
  {
    unsigned int v3 = [(IDSPairingManager *)self pairedDeviceRepository];
    unsigned __int16 v4 = [v3 activePairedDevice];
    id v5 = [v4 dictionaryRepresentation];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (NSData)pairedDevicePublicKey
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned __int16 v4 = [v3 publicClassDKey];

  return (NSData *)v4;
}

- (NSData)pairedDevicePublicClassAKey
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned __int16 v4 = [v3 publicClassAKey];

  return (NSData *)v4;
}

- (NSData)pairedDevicePublicClassCKey
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned __int16 v4 = [v3 publicClassCKey];

  return (NSData *)v4;
}

- (NSData)pairedDevicePushToken
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned __int16 v4 = [v3 pushToken];

  return (NSData *)v4;
}

- (id)pairedDeviceiCloudURIs
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  unsigned __int16 v4 = [v3 iCloudURIs];

  return v4;
}

- (int64_t)pairedDevicePairingType
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  id v4 = [v3 pairingType];

  return (int64_t)v4;
}

- (NSDictionary)pairedDevicePrivateData
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v3 = [v2 activePairedDevice];
  id v4 = [v3 privateData];

  return (NSDictionary *)v4;
}

- (BOOL)isPaired
{
  id v2 = self;
  unsigned int v3 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v4 = [v3 activePairedDevice];
  LOBYTE(v2) = [(IDSPairingManager *)v2 _isPairedToDevice:v4];

  return (char)v2;
}

- (BOOL)_isPairedToDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 cbuuid];
  id v5 = [v4 length];

  id v6 = [v3 publicClassDKey];
  id v7 = [v6 length];

  id v8 = [v3 uniqueID];

  id v9 = [v8 length];
  if (v5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  return !v10 && v7 != 0;
}

- (NSSet)allPairedUniqueIDs
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v5 = [v4 allPairedDevices];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([(IDSPairingManager *)self _isPairedToDevice:v10])
        {
          BOOL v11 = [v10 uniqueID];
          [v3 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (NSSet)allTraditionallyPairedUniqueIDs
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v6 = [v5 allPairedDevicesWithType:0];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(IDSPairingManager *)self _isPairedToDevice:v11])
        {
          __int16 v12 = [v11 uniqueID];
          [v4 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSSet *)v4;
}

- (id)pairedDeviceForUniqueID:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v6 = [v5 allPairedDevices];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([(IDSPairingManager *)self _isPairedToDevice:v11])
        {
          __int16 v12 = [v11 uniqueID];
          unsigned __int8 v13 = [v12 isEqualToIgnoringCase:v4];

          if (v13)
          {
            id v14 = v11;
            goto LABEL_12;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_hasAllEncryptionKeys
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v3 = [v2 activePairedDevice];

  id v4 = [v3 publicClassAKey];
  id v5 = [v4 length];

  id v6 = [v3 publicClassCKey];
  id v7 = [v6 length];

  id v8 = [v3 publicClassDKey];
  id v9 = [v8 length];

  if (v5) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v12 = !v10 && v9 != 0;

  return v12;
}

- (void)_updatePairedState:(BOOL)a3
{
  BOOL v3 = a3;
  notify_set_state(self->_pairingStateToken, a3);
  id v4 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[IDSPairingManager _updatePairedState:]";
    __int16 v8 = 2048;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Updating notify token state to: isPaired %llu", (uint8_t *)&v6, 0x16u);
  }

  [IDSPairingStateChangedNotification UTF8String];
  id v5 = (const char *)IMUserScopedNotification();
  notify_post(v5);
}

- (void)_updateActiveStateForAllPairedDevices
{
}

- (void)_updateActiveStateForAllPairedDevices:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[IMRGLog deviceState];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update notifier state for paired devices", buf, 2u);
  }

  int v6 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v7 = [v6 allPairedDevices];

  __int16 v8 = +[IMRGLog deviceState];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
    *(_DWORD *)long long buf = 138412290;
    int v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "All devices count: %@", buf, 0xCu);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v25;
    *(void *)&long long v12 = 138412290;
    long long v21 = v12;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v15);
        long long v17 = +[IMRGLog deviceState];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v21;
          int v30 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Checking %@", buf, 0xCu);
        }

        long long v18 = [v16 uniqueID];
        if (v3)
        {
          long long v19 = +[IDSDevicePropertiesStateNotifier sharedInstance];
          [v19 updateStateForDeviceWithUniqueID:v18];
        }
        else
        {
          long long v20 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100193B5C;
          block[3] = &unk_10097E4D0;
          id v23 = v18;
          dispatch_async(v20, block);

          long long v19 = v23;
        }

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  delegateMap = self->_delegateMap;
  id v8 = v4;
  if (!delegateMap)
  {
    int v6 = +[NSHashTable weakObjectsHashTable];
    id v7 = self->_delegateMap;
    self->_delegateMap = v6;

    id v4 = v8;
    delegateMap = self->_delegateMap;
  }
  if (![(NSHashTable *)delegateMap containsObject:v4]) {
    [(NSHashTable *)self->_delegateMap addObject:v8];
  }
}

- (void)removeDelegate:(id)a3
{
  [(NSHashTable *)self->_delegateMap removeObject:a3];
  if (![(NSHashTable *)self->_delegateMap count])
  {
    delegateMap = self->_delegateMap;
    self->_delegateMap = 0;
  }
}

- (BOOL)addLocalPairedDevice:(id)a3 BTOutOfBandKey:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5 pairingType:(int64_t)a6 bluetoothMACAddress:(id)a7
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([v11 length])
  {
    uint64_t v14 = [(IDSPairingManager *)self pairedDeviceRepository];
    unsigned __int8 v15 = [v14 containsPairedDeviceWithCBUUID:v11];

    if (v15)
    {
      int v16 = 0;
LABEL_20:
      BOOL v43 = [(IDSPairingManager *)self isPaired];
      v44 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v45 = @"YES";
        *(_DWORD *)long long buf = 136315906;
        v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
        if (v16) {
          CFStringRef v46 = @"YES";
        }
        else {
          CFStringRef v46 = @"NO";
        }
        if (!v43) {
          CFStringRef v45 = @"NO";
        }
        __int16 v55 = 2112;
        id v56 = v11;
        __int16 v57 = 2112;
        CFStringRef v58 = v46;
        __int16 v59 = 2112;
        CFStringRef v60 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s Added locally paired device with CBUUID %@ to repository? %@. Device is now paired? %@ ", buf, 0x2Au);
      }

      if (v16)
      {
        v47 = +[IMRGLog NRPairing];
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
        if (v43)
        {
          if (v48)
          {
            *(_DWORD *)long long buf = 136315138;
            v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s notifying delegate that we are properly paired with a local device", buf, 0xCu);
          }

          v49 = [(IDSPairingManager *)self pairedDeviceRepository];
          v50 = [v49 pairedDeviceWithCBUUID:v11];

          [(IDSPairingManager *)self _notifyDelegatesDevicePairedToDevice:v50];
        }
        else
        {
          if (v48)
          {
            *(_DWORD *)long long buf = 136315138;
            v54 = "-[IDSPairingManager addLocalPairedDevice:BTOutOfBandKey:shouldPairDirectlyOverIPsec:pairingType:bluetoothMACAddress:]";
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s We are missing the local device information to properly pair, requesting it now.", buf, 0xCu);
          }

          [(IDSPairingManager *)self _requestPairedDeviceInfoAfterDelay:10.0];
        }
        [(IDSPairingManager *)self _updatePairedState:v43];
      }
      BOOL v18 = v16 != 0;
      goto LABEL_37;
    }
    long long v19 = +[IMRGLog regeneration];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Marking the encryption keys as regenerated to avoid regenerating newly created keys.", buf, 2u);
    }

    [(IDSPairingManager *)self _markSecuredEncryptionKeysAsRegenerated:1];
    [(IDSPairingManager *)self setBTOutOfBandKey:v12 forCBUUID:v11];
    long long v20 = [(IDSPairingManager *)self pairedDeviceRepository];
    unsigned int v21 = [v20 addPairedDeviceWithCBUUID:v11 pairingType:a6];

    if (v21)
    {
      uint64_t v22 = [(IDSPairingManager *)self pairedDeviceRepository];
      id v23 = [v22 activatePairedDeviceWithCBUUID:v11];

      if (!v23)
      {
        int v16 = 1;
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      long long v24 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_1007146B0(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    else
    {
      long long v24 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_100714728(v24, v32, v33, v34, v35, v36, v37, v38);
      }
    }

    int v16 = 0;
    if (!v8)
    {
LABEL_19:
      [(IDSPairingManager *)self _updateActiveStateForAllPairedDevices];
      goto LABEL_20;
    }
LABEL_18:
    id v39 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
    v40 = [(IDSPairingManager *)self _createRegistrationProperties:0 maxCompatibilityVersion:0 BTOutOfBandKey:v12 supportsIPsecWithSPPLink:0 bluetoothMACAddress:0];
    [v40 setIsAltAccountPairing:a6 == 1];
    [(IDSPairingManager *)self _networkRelayRegisterDeviceWithCBUUID:v39 properties:v40 shouldPairDirectlyOverIPsec:1];
    v41 = [(IDSPairingManager *)self pairedDeviceRepository];
    [v41 updatePairedDeviceWithCBUUID:v11 supportIPsec:1];

    v42 = [(IDSPairingManager *)self pairedDeviceRepository];
    LOWORD(v52) = 10;
    objc_msgSend(v42, "updatePairedDeviceWithCBUUID:deviceUniqueID:buildVersion:productVersion:productName:pairingProtocolVersion:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:", v11, 0, 0, 0, 0, 0, 0, v52);

    goto LABEL_19;
  }
  long long v17 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    sub_100714630();
  }

  BOOL v18 = 0;
LABEL_37:

  return v18;
}

- (BOOL)removeLocalPairedDevice:(id)a3
{
  id v4 = (char *)a3;
  id v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    unsigned int v21 = "-[IDSPairingManager removeLocalPairedDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  if ([v4 length])
  {
    int v6 = [(IDSPairingManager *)self pairedDeviceRepository];
    id v7 = [v6 pairedDeviceWithCBUUID:v4];

    BOOL v8 = (__CFString *)[objc_alloc((Class)NSUUID) initWithUUIDString:v4];
    [(IDSPairingManager *)self _clearPairedDeviceDidConnectBlocksForUniqueID:v8];
    BOOL v9 = [(IDSPairingManager *)self _nrDeviceIdentifierWithCBUUID:v8];
    id v10 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138478083;
      unsigned int v21 = v9;
      __int16 v22 = 2113;
      CFStringRef v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will unregister device from nrDeviceManager {nrIdentifier: %{private}@, cbuuidUUID: %{private}@, }", (uint8_t *)&v20, 0x16u);
    }

    if (v9)
    {
      id v11 = [(IDSPairingManager *)self nrDeviceManager];
      [v11 unregisterDevice:v9];
    }
    id v12 = [(IDSPairingManager *)self pairedDeviceRepository];
    unsigned int v13 = [v12 removePairedDeviceWithCBUUID:v4];

    uint64_t v14 = +[IMRGLog registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v15 = @"NO";
      if (v13) {
        CFStringRef v15 = @"YES";
      }
      int v20 = 138412546;
      unsigned int v21 = v4;
      __int16 v22 = 2112;
      CFStringRef v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed locally paired device with CBUUID: %@? %@", (uint8_t *)&v20, 0x16u);
    }

    int v16 = [(IDSPairingManager *)self pairedDeviceRepository];
    unsigned int v17 = [v16 isEmpty];

    if (v17)
    {
      BOOL v18 = +[IDSRegistrationKeyManager sharedInstance];
      [v18 regeneratePairingIdentitiesIncludingClassD:1];
    }
    if (v13)
    {
      [(IDSPairingManager *)self _notifyDelegatesDeviceUnpairedFromDevice:v7];
      [(IDSPairingManager *)self _updateActiveStateForAllPairedDevices];
      [(IDSPairingManager *)self _updatePairedState:0];
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)disconnectActivePairedDevice
{
  BOOL v3 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[IDSPairingManager disconnectActivePairedDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(IDSPairingManager *)self deactivatePairedDevices];
  [(IDSPairingManager *)self _updateActiveStateForAllPairedDevices];
  [(IDSPairingManager *)self _updatePairedState:0];
}

- (int64_t)activatePairedDeviceWithCBUUID:(id)a3
{
  int v4 = (char *)a3;
  id v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v24 = "-[IDSPairingManager activatePairedDeviceWithCBUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v6 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Activating a paired device with CBUUID: %@", buf, 0xCu);
  }

  id v7 = [(IDSPairingManager *)self _activePairedDeviceCBUUID];
  BOOL v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    long long v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Switching active paired device from %@ to %@", buf, 0x16u);
  }

  if ([v4 isEqualToIgnoringCase:v7])
  {
    BOOL v9 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1007147A0();
    }
    unint64_t v10 = 1;
  }
  else
  {
    BOOL v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    id v11 = (char *)[objc_alloc((Class)NSUUID) initWithUUIDString:v4];
    id v12 = [(IDSPairingManager *)self _nrDeviceIdentifierWithCBUUID:v9];
    unsigned int v13 = [(IDSPairingManager *)self _nrDeviceIdentifierWithCBUUID:v11];
    if (v12)
    {
      uint64_t v14 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138478083;
        long long v24 = (const char *)v9;
        __int16 v25 = 2113;
        uint64_t v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disabling NetworkRelay device {activeUUID: %{private}@, activeDeviceIdentifier: %{private}@}", buf, 0x16u);
      }

      CFStringRef v15 = [(IDSPairingManager *)self nrDeviceManager];
      [v15 disableDevice:v12];
    }
    if (v13)
    {
      int v16 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138478083;
        long long v24 = v11;
        __int16 v25 = 2113;
        uint64_t v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Enabling NetworkRelay device {newUUID: %{private}@, newDeviceIdentifier: %{private}@}", buf, 0x16u);
      }

      unsigned int v17 = [(IDSPairingManager *)self nrDeviceManager];
      [v17 enableDevice:v13];
    }
    BOOL v18 = [(IDSPairingManager *)self pairedDeviceRepository];
    unint64_t v10 = (unint64_t)[v18 activatePairedDeviceWithCBUUID:v4];

    [(IDSPairingManager *)self _updateActiveStateForAllPairedDevices];
  }

  long long v19 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 > 4) {
      CFStringRef v20 = @"<unknown>";
    }
    else {
      CFStringRef v20 = *(&off_1009847C8 + v10);
    }
    unsigned int v21 = +[NSString stringWithFormat:@"%@ (%d)", v20, v10];
    *(_DWORD *)long long buf = 138412546;
    long long v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Result of activating a paired device with CBUUID %@ is %@", buf, 0x16u);
  }
  return v10;
}

- (void)deactivatePairedDevices
{
  BOOL v3 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v22 = "-[IDSPairingManager deactivatePairedDevices]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(IDSPairingManager *)self setShouldQuickSwitchAfterIPSecConnected:0];
  int v4 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling NetworkRelay for all paired devices.", buf, 2u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(IDSPairingManager *)self cbuuidsOfPairedDevices];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138477827;
    long long v16 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(const char **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = -[IDSPairingManager _nrDeviceIdentifierWithCBUUID:](self, "_nrDeviceIdentifierWithCBUUID:", v11, v16);
        unsigned int v13 = +[IMRGLog NRPairing];
        uint64_t v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138478083;
            __int16 v22 = v11;
            __int16 v23 = 2113;
            long long v24 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disabling NetworkRelay device {pairedDeviceUUID: %{private}@, nrIdentifier: %{private}@}", buf, 0x16u);
          }

          uint64_t v14 = [(IDSPairingManager *)self nrDeviceManager];
          [v14 disableDevice:v12];
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = v16;
          __int16 v22 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create IDSNRDeviceIdentifier from pairedDeviceUUID - failed to deactivate device {pairedDeviceUUID: %{private}@}", buf, 0xCu);
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  CFStringRef v15 = [(IDSPairingManager *)self pairedDeviceRepository];
  [v15 deactivatePairedDevices];

  [(IDSPairingManager *)self _updateActiveStateForAllPairedDevices];
}

- (void)updateNetworkRelayStateForAllPairedDevices
{
  BOOL v3 = [(IDSPairingManager *)self pairedDeviceRepository];
  int v4 = [v3 allPairedDevices];

  id v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update registration status with NetworkRelay for active device and disable non-active devices: %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 supportIPsec])
        {
          id v12 = [v11 cbuuidUUID];
          unsigned int v13 = [(IDSPairingManager *)self _nrDeviceIdentifierWithCBUUID:v12];

          if (v13)
          {
            if ([v11 isActive])
            {
              if ([(IDSPairingManager *)self _isPairedToDevice:v11])
              {
                uint64_t v14 = [v11 cbuuidUUID];
                CFStringRef v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 maxCompatibilityVersion]);
                [(IDSPairingManager *)self _networkRelayRegisterDeviceWithCBUUID:v14 wasInitiallySetupUsingIDSPairing:1 maxCompatibilityVersion:v15 BTOutOfBandKey:0 supportsIPsecWithSPPLink:0 bluetoothMACAddress:0];
              }
              else
              {
                uint64_t v14 = +[IMRGLog NRPairing];
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                  sub_100714830(&v18, v19, v14);
                }
              }
            }
            else
            {
              long long v16 = +[IMRGLog NRPairing];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                long long v17 = [v11 cbuuidUUID];
                *(_DWORD *)long long buf = 138478083;
                __int16 v25 = v17;
                __int16 v26 = 2113;
                uint64_t v27 = v13;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Disabling NetworkRelay device {cbuuidUUID: %{private}@, nrIdentifier: %{private}@}", buf, 0x16u);
              }
              uint64_t v14 = [(IDSPairingManager *)self nrDeviceManager];
              [v14 disableDevice:v13];
            }
          }
          else
          {
            uint64_t v14 = +[IMRGLog NRPairing];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_1007147D4((uint64_t)v28, (uint64_t)v11);
            }
          }
        }
        else
        {
          unsigned int v13 = +[IMRGLog NRPairing];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_100714870((uint64_t)v29, (uint64_t)v11);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v8);
  }
}

- (void)ensureCommunicationWithActivePairedDeviceIsPossible
{
  BOOL v3 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    unint64_t v10 = "-[IDSPairingManager ensureCommunicationWithActivePairedDeviceIsPossible]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  int v4 = [(IDSPairingManager *)self _activePairedDeviceCBUUID];
  if ([v4 length])
  {
    unsigned int v5 = [(IDSPairingManager *)self isMissingAnyPublicKeyForPairedDeviceWithCBUUID:v4];
    id v6 = +[IMRGLog watchPairing];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting information about the new active paired device.", (uint8_t *)&v9, 2u);
      }

      [(IDSPairingManager *)self _requestPairedDeviceInfoAfterDelay:0.0];
    }
    else
    {
      if (v7)
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting information about the new active paired device was unnecessary. Communication is possible.", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    id v8 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cannot ensure communication is possible because there is no active paired device.", (uint8_t *)&v9, 2u);
    }
  }
}

- (BOOL)isCurrentDevicePairedOrPairing
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  BOOL v3 = [v2 allPairedDevices];
  id v4 = [v3 count];

  return v4 != 0;
}

- (BOOL)isTraditionalDevicePairedOrPairing
{
  id v2 = [(IDSPairingManager *)self pairedDeviceRepository];
  BOOL v3 = [v2 allPairedDevicesWithType:0];
  id v4 = [v3 count];

  return v4 != 0;
}

- (id)cbuuidsOfPairingDevices
{
  return [(IDSPairingManager *)self _cbuuidsWithIsPairingValue:1];
}

- (id)cbuuidsOfPairedDevices
{
  return [(IDSPairingManager *)self _cbuuidsWithIsPairingValue:0];
}

- (id)uniqueIDToCbuuidsOfPairingDevicesDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v5 = [v4 pairedDevicesWithIsPairingValue:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "cbuuid", (void)v19);
        if (v12)
        {
          unsigned int v13 = (void *)v12;
          uint64_t v14 = [v11 uniqueID];

          if (v14)
          {
            CFStringRef v15 = [v11 cbuuid];
            long long v16 = [v11 uniqueID];
            [v3 setValue:v15 forKey:v16];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v17 = [v3 copy];

  return v17;
}

- (id)_identityDataErrorPairForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[IDSRegistrationKeyManager sharedInstance];
  unsigned int v5 = [v4 fullMessageProtectionIdentityForDataProtectionClass:v3];

  id v12 = 0;
  id v6 = [v5 dataRepresentationWithError:&v12];
  id v7 = v12;
  id v8 = objc_alloc((Class)IDSLocalPairingIdentityDataErrorPair);
  if (v6) {
    id v9 = [v8 initWithIdentityData:v6];
  }
  else {
    id v9 = [v8 initWithError:v7];
  }
  unint64_t v10 = v9;

  return v10;
}

- (id)localDeviceRecord
{
  uint64_t v3 = [(IDSPairingManager *)self _identityDataErrorPairForDataProtectionClass:1];
  id v4 = [(IDSPairingManager *)self _identityDataErrorPairForDataProtectionClass:0];
  unsigned int v5 = [(IDSPairingManager *)self _identityDataErrorPairForDataProtectionClass:2];
  id v6 = [objc_alloc((Class)IDSLocalPairingLocalDeviceRecord) initWithWithFullIdentityDataClassA:v3 classC:v4 classD:v5];

  return v6;
}

- (id)pairedDeviceRecords
{
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v4 = [v3 pairedDevicesWithIsPairingValue:0];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
        id v11 = objc_alloc((Class)NSUUID);
        id v12 = [v10 cbuuid];
        id v13 = [v11 initWithUUIDString:v12];

        if (v13)
        {
          id v14 = objc_alloc((Class)IDSLocalPairingIdentityDataErrorPair);
          CFStringRef v15 = [v10 publicClassAKey];
          long long v16 = [v14 initWithIdentityData:v15];

          id v17 = objc_alloc((Class)IDSLocalPairingIdentityDataErrorPair);
          uint8_t v18 = [v10 publicClassCKey];
          id v19 = [v17 initWithIdentityData:v18];

          id v20 = objc_alloc((Class)IDSLocalPairingIdentityDataErrorPair);
          long long v21 = [v10 publicClassDKey];
          id v22 = [v20 initWithIdentityData:v21];

          id v23 = [objc_alloc((Class)IDSLocalPairingPairedDeviceRecord) initWithCBUUID:v13 publicIdentityDataClassA:v16 classC:v19 classD:v22];
          [v25 setObject:v23 forKeyedSubscript:v13];
        }
        else
        {
          long long v16 = +[IMRGLog NRPairing];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138477827;
            uint64_t v31 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Missing cbuuid for paired device -- skipping {pairedDevice: %{private}@}", buf, 0xCu);
          }
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v7);
  }

  return v25;
}

- (id)_cbuuidsWithIsPairingValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v5 = [v4 pairedDevicesWithIsPairingValue:v3];

  id v6 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "cbuuidUUID", (void)v16);

        if (v13)
        {
          id v14 = [v12 cbuuidUUID];
          [v6 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDevice
{
  return [(IDSPairingManager *)self shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:0];
}

- (BOOL)shouldUseIPsecLinkForDefaultPairedDeviceAndLogQuery:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v6 = [v5 shouldUseIPsecLinkForDefaultPairedDevice];

  if (v3)
  {
    id v7 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        CFStringRef v8 = @"YES";
      }
      else {
        CFStringRef v8 = @"NO";
      }
      id v9 = [(IDSPairingManager *)self pairedDeviceRepository];
      uint64_t v10 = [v9 activePairedDevice];
      int v12 = 138412546;
      CFStringRef v13 = v8;
      __int16 v14 = 2112;
      CFStringRef v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Queried shouldUseIPsecLinkForDefaultPairedDevice {shouldUseIPsec: %@, activePairedDevice: %@}", (uint8_t *)&v12, 0x16u);
    }
  }
  return v6;
}

- (void)registerPairedDeviceWithUniqueID:(id)a3 didConnectBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)IMPair);
  id v9 = objc_retainBlock(v6);

  id v10 = [v8 initWithFirst:v7 second:v9];
  id v11 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registering didConnectToPairedDevice block {pair: %@}", (uint8_t *)&v15, 0xCu);
  }

  if (!self->_registeredPairedDeviceDidConnectBlockPairs)
  {
    int v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    registeredPairedDeviceDidConnectBlockPairs = self->_registeredPairedDeviceDidConnectBlockPairs;
    self->_registeredPairedDeviceDidConnectBlockPairs = v12;
  }
  __int16 v14 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];
  [v14 addObject:v10];
}

- (void)_callPairedDeviceDidConnectBlocksForUniqueID:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];
    *(_DWORD *)long long buf = 138412802;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling didConnectToPairedDeviceBlocks {cbuuid: %@, error: %@, pairs: %@}", buf, 0x20u);
  }
  id v10 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];

  if (v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v17 = [v16 first];
          unsigned int v18 = [v17 isEqual:v6];

          if (v18)
          {
            long long v19 = [v16 second];
            ((void (**)(void, id))v19)[2](v19, v7);
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  [(IDSPairingManager *)self _clearPairedDeviceDidConnectBlocksForUniqueID:v6];
}

- (void)_clearPairedDeviceDidConnectBlocksForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];
    *(_DWORD *)long long buf = 138412546;
    id v25 = v4;
    __int16 v26 = 2112;
    __int16 v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing didConnectToPairedDeviceBlocks {cbuuid: %@, pairs: %@}", buf, 0x16u);
  }
  id v7 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v15 = [v14 first];
          unsigned int v16 = [v15 isEqual:v4];

          if (v16) {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    long long v17 = [(IDSPairingManager *)self registeredPairedDeviceDidConnectBlockPairs];
    [v17 removeObjectsInArray:v8];

    if (![(NSMutableArray *)self->_registeredPairedDeviceDidConnectBlockPairs count])
    {
      registeredPairedDeviceDidConnectBlockPairs = self->_registeredPairedDeviceDidConnectBlockPairs;
      self->_registeredPairedDeviceDidConnectBlockPairs = 0;
    }
  }
}

- (BOOL)updatePairedDeviceWithCBUUID:(id)a3 supportIPsec:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = [a3 UUIDString];
  id v7 = [(IDSPairingManager *)self pairedDeviceRepository];
  LOBYTE(v4) = [v7 updatePairedDeviceWithCBUUID:v6 supportIPsec:v4];

  return v4;
}

- (BOOL)updateLocalPairedDevice:(id)a3 pairingType:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(IDSPairingManager *)self pairedDevicePairingType];
  id v8 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v9 = [v8 updatePairedDeviceWithCBUUID:v6 pairingType:a4];

  if (v9 && v7 != a4)
  {
    [(IDSPairingManager *)self pairedDevice];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100196170;
    v12[3] = &unk_100984758;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v13;
    [(IDSPairingManager *)self _notifyDelegatesWithBlock:v12];
  }
  return v9;
}

- (BOOL)setPairedDeviceInfo:(id)a3
{
  uint64_t v4 = (char *)a3;
  id v5 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v39 = "-[IDSPairingManager setPairedDeviceInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received paired device info: %@", buf, 0xCu);
  }

  if (![v4 count])
  {
    id v10 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1007148CC();
    }
    goto LABEL_31;
  }
  int64_t v7 = [(IDSPairingManager *)self pairedDeviceUUIDString];
  id v8 = [v7 length];

  if (!v8)
  {
    id v10 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10071494C(v10, v28, v29, v30, v31, v32, v33, v34);
    }
LABEL_31:
    LOBYTE(v13) = 0;
    goto LABEL_32;
  }
  unsigned __int8 v9 = [(IDSPairingManager *)self isPaired];
  id v10 = [(IDSPairingManager *)self _activePairedDeviceCBUUID];
  unsigned int v11 = [(IDSPairingManager *)self isMissingAnyPublicKeyForPairedDeviceWithCBUUID:v10];
  uint64_t v12 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v13 = [v12 updatePairedDeviceWithCBUUID:v10 deviceInfoPayload:v4];

  [(IDSPairingManager *)self _updateActiveStateForAllPairedDevices:1];
  unsigned int v14 = [(IDSPairingManager *)self isMissingAnyPublicKeyForPairedDeviceWithCBUUID:v10];
  int v15 = [(IDSPairingManager *)self pairedDeviceRepository];
  unsigned int v16 = [v15 pairedDeviceWithCBUUID:v10];

  long long v17 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    if (v13) {
      CFStringRef v18 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    id v39 = (const char *)v18;
    __int16 v40 = 2112;
    v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updated paired device? %@ updated state: %@", buf, 0x16u);
  }

  if (v13)
  {
    uint64_t v37 = v16;
    unsigned int v19 = [(IDSPairingManager *)self isPaired];
    char v36 = v19 ^ 1 | v9;
    if ((v36 & 1) == 0) {
      [(IDSPairingManager *)self _updatePairedState:1];
    }
    long long v20 = +[IDSCurrentDevice sharedInstance];
    unsigned int v21 = [v20 hasAllEncryptionKeys];

    if ((v19 & v11) == 1 && v14 != 1 && v21)
    {
      long long v22 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "We were missing keys from the remote device, resuming OTR session negotiation", buf, 2u);
      }

      long long v23 = +[IDSOTRController sharedInstance];
      [v23 resumeSessionNegotiation];
    }
    unsigned int v16 = v37;
    if ([(IDSPairingManager *)self pairedDeviceServiceMinCompatibilityVersion] >= 3)
    {
      long long v24 = +[IMRGLog watchPairing];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "This device supports cloud delivery, updating flag to enable it when possbile", buf, 2u);
      }

      id v25 = +[IDSUTunDeliveryController sharedInstance];
      [v25 setPendingCloudFlagOnDefaultPeer];
    }
    if ((v36 & 1) == 0)
    {
      __int16 v26 = [(IDSPairingManager *)self pairedDeviceRepository];
      __int16 v27 = [v26 pairedDeviceWithCBUUID:v10];

      [(IDSPairingManager *)self _notifyDelegatesDevicePairedToDevice:v27];
    }
  }

LABEL_32:
  return v13;
}

- (BOOL)isMissingAnyPublicKeyForPairedDeviceWithCBUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPairingManager *)self pairedDeviceRepository];
  id v6 = [v5 pairedDeviceWithCBUUID:v4];

  LOBYTE(v5) = [v6 hasAllPublicKeys] ^ 1;
  return (char)v5;
}

- (id)_createRegistrationProperties:(BOOL)a3 maxCompatibilityVersion:(id)a4 BTOutOfBandKey:(id)a5 supportsIPsecWithSPPLink:(BOOL)a6 bluetoothMACAddress:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = objc_alloc_init((Class)NRDevicePairingProperties);
  if (v11) {
    objc_msgSend(v14, "setPairingProtocolVersion:", objc_msgSend(v11, "unsignedIntegerValue"));
  }
  [v14 setWasInitiallySetupUsingIDSPairing:v10];
  if (v10) {
    id v15 = 0;
  }
  else {
    id v15 = v12;
  }
  [v14 setOutOfBandKey:v15];
  [v14 setBluetoothMACAddress:v13];

  [v14 setPairWithSPPLink:v8];

  return v14;
}

- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 wasInitiallySetupUsingIDSPairing:(BOOL)a4 maxCompatibilityVersion:(id)a5 BTOutOfBandKey:(id)a6 supportsIPsecWithSPPLink:(BOOL)a7 bluetoothMACAddress:(id)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = [(IDSPairingManager *)self _createRegistrationProperties:v12 maxCompatibilityVersion:a5 BTOutOfBandKey:a6 supportsIPsecWithSPPLink:v9 bluetoothMACAddress:a8];
  [(IDSPairingManager *)self _networkRelayRegisterDeviceWithCBUUID:v14 properties:v15 shouldPairDirectlyOverIPsec:0];
}

- (void)_networkRelayRegisterDeviceWithCBUUID:(id)a3 properties:(id)a4 shouldPairDirectlyOverIPsec:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(IDSPairingManager *)self _nrDeviceIdentifierWithCBUUID:v8];
  id v11 = +[IMRGLog NRPairing];
  BOOL v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138478339;
      __int16 v27 = v10;
      __int16 v28 = 2113;
      id v29 = v9;
      __int16 v30 = 2113;
      id v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Calling -[NRDeviceManager registerDevice:properties:queue:completionBlock:] {nrDeviceIdentifier: %{private}@, properties: %{private}@, cbuuid: %{private}@}", buf, 0x20u);
    }

    id v13 = [(IDSPairingManager *)self nrDeviceManager];
    id v14 = im_primary_queue();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001969EC;
    v21[3] = &unk_100984780;
    long long v22 = v8;
    BOOL v25 = a5;
    id v23 = v10;
    long long v24 = self;
    [v13 registerDevice:v23 properties:v9 queue:v14 completionBlock:v21];

    BOOL v12 = v22;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    sub_1007149C4((uint64_t)v8, v12, v15, v16, v17, v18, v19, v20);
  }
}

- (BOOL)updatePairedDeviceBuildVersion:(id)a3 productVersion:(id)a4 productName:(id)a5 pairingProtocolVersion:(unsigned int)a6 minCompatibilityVersion:(unsigned int)a7 maxCompatibilityVersion:(unsigned int)a8 serviceMinCompatibilityVersion:(unsigned __int16)a9 capabilityFlags:(unint64_t)a10 deviceUniqueID:(id)a11
{
  LODWORD(v83) = a7;
  HIDWORD(v83) = a8;
  id v14 = (__CFString *)a3;
  uint64_t v15 = (__CFString *)a4;
  CFStringRef v16 = (const __CFString *)a5;
  id v85 = a11;
  uint64_t v17 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)v90 = "-[IDSPairingManager updatePairedDeviceBuildVersion:productVersion:productName:pairingProtocolVersio"
                     "n:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:capabilityFlags:deviceUniqueID:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v18 = +[IMRGLog pairingProtocolDebug];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)v90 = "-[IDSPairingManager updatePairedDeviceBuildVersion:productVersion:productName:pairingProtocolVersio"
                     "n:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:capabilityFlags:deviceUniqueID:]";
    *(_WORD *)&v90[8] = 1024;
    LODWORD(v91) = a6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s setting version %u", buf, 0x12u);
  }

  uint64_t v19 = [(IDSPairingManager *)self pairedDeviceRepository];
  uint64_t v20 = [v19 activePairedDevice];
  unsigned int v79 = [v20 supportIPsec];

  unsigned int v21 = [(id)objc_opt_class() _isIPsecSupportedByCapabilityFlags:a10];
  unsigned int v80 = [(id)objc_opt_class() _isTinkerPairedInCapabilityFlags:a10];
  long long v22 = [(IDSPairingManager *)self _activePairedDeviceCBUUID];
  v84 = (__CFString *)v16;
  if (v22)
  {
    uint64_t v76 = [(IDSPairingManager *)self pairedDeviceUniqueID];
    uint64_t v23 = [(IDSPairingManager *)self pairedDeviceBuildVersion];
    v82 = [(IDSPairingManager *)self pairedDeviceProductVersion];
    v81 = [(IDSPairingManager *)self pairedDeviceProductName];
    unsigned int v72 = [(IDSPairingManager *)self pairedDevicePairingProtocolVersion];
    HIDWORD(v71) = [(IDSPairingManager *)self pairedDeviceMinCompatibilityVersion];
    LODWORD(v71) = [(IDSPairingManager *)self pairedDeviceMaxCompatibilityVersion];
    unsigned int v73 = [(IDSPairingManager *)self pairedDeviceServiceMinCompatibilityVersion];
    unsigned int v75 = [(IDSPairingManager *)self activePairedDeviceHasPairingType:1];
    long long v24 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)v90 = v23;
      *(_WORD *)&v90[8] = 2112;
      CFStringRef v91 = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "buildVersion                   %@ vs %@", buf, 0x16u);
    }

    BOOL v25 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)v90 = v82;
      *(_WORD *)&v90[8] = 2112;
      CFStringRef v91 = v15;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "productVersion                 %@ vs %@", buf, 0x16u);
    }
    v77 = (void *)v23;

    __int16 v26 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)v90 = v81;
      *(_WORD *)&v90[8] = 2112;
      CFStringRef v91 = v16;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "productName                    %@ vs %@", buf, 0x16u);
    }

    __int16 v27 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)v90 = v72;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = a6;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "pairingProtocolVersion         %d vs %d", buf, 0xEu);
    }

    __int16 v28 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)v90 = HIDWORD(v71);
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v83;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "minCompatibilityVersion        %d vs %d", buf, 0xEu);
    }

    id v29 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)v90 = v71;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = HIDWORD(v83);
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "maxCompatibilityVersion        %d vs %d", buf, 0xEu);
    }

    __int16 v30 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)v90 = v73;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = a9;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "serviceMinCompatibilityVersion %d vs %d", buf, 0xEu);
    }

    id v31 = +[IMRGLog watchPairing];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v32 = @"NO";
      if (v79) {
        CFStringRef v33 = @"YES";
      }
      else {
        CFStringRef v33 = @"NO";
      }
      if (v21) {
        CFStringRef v32 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)v90 = v33;
      *(_WORD *)&v90[8] = 2112;
      CFStringRef v91 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "supportIPsec                  %@ vs %@", buf, 0x16u);
    }

    uint64_t v34 = +[IMRGLog watchPairing];
    uint64_t v35 = v85;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v36 = @"NO";
      if (v75) {
        CFStringRef v37 = @"YES";
      }
      else {
        CFStringRef v37 = @"NO";
      }
      if (v80) {
        CFStringRef v36 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)v90 = v37;
      *(_WORD *)&v90[8] = 2112;
      CFStringRef v91 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "isTinkerPaired                       %@ vs %@", buf, 0x16u);
    }

    uint64_t v38 = [(IDSPairingManager *)self pairedDeviceRepository];
    LOWORD(v70) = a9;
    unsigned int v39 = objc_msgSend(v38, "updatePairedDeviceWithCBUUID:deviceUniqueID:buildVersion:productVersion:productName:pairingProtocolVersion:minCompatibilityVersion:maxCompatibilityVersion:serviceMinCompatibilityVersion:", v22, v85, v14, v15, v16, a6, v83, v70);

    id v40 = [objc_alloc((Class)NSUUID) initWithUUIDString:v22];
    v41 = v40;
    v78 = v15;
    if (!v39)
    {
      v54 = +[IMRGLog watchPairing];
      v53 = v76;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
        sub_100714AAC();
      }
      goto LABEL_91;
    }
    id v74 = v40;
    BOOL v42 = [(IDSPairingManager *)self isPaired];
    if (((v75 | v80 ^ 1) & 1) == 0)
    {
      BOOL v43 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Device wants Tinker pairing - updating repository", buf, 2u);
      }

      v44 = [(IDSPairingManager *)self pairedDeviceRepository];
      [v44 updatePairedDeviceWithCBUUID:v22 pairingType:1];
    }
    unsigned int v45 = [(IDSPairingManager *)self _isIPSecLinkEnabled];
    CFStringRef v46 = +[IMRGLog NRPairing];
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if ((v45 & v21) == 1)
    {
      if (v47)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Device supports IPsec - Registering", buf, 2u);
      }

      if ((v79 & 1) == 0) {
        [(IDSPairingManager *)self setShouldQuickSwitchAfterIPSecConnected:1];
      }
      BOOL v48 = [(IDSPairingManager *)self pairedDeviceRepository];
      [v48 updatePairedDeviceWithCBUUID:v22 supportIPsec:1];

      v49 = +[IDSUTunDeliveryController sharedInstance];
      [v49 addConnectivityDelegate:self];

      v50 = +[IDSUTunDeliveryController sharedInstance];
      [v50 startIdsNRDeviceBridgeAndPreferenceHandlerWithIdentifier:v74];

      cbuuidToBTOutOfBandKeyDictionary = self->_cbuuidToBTOutOfBandKeyDictionary;
      uint64_t v35 = v85;
      if (cbuuidToBTOutOfBandKeyDictionary)
      {
        uint64_t v52 = [(NSMutableDictionary *)cbuuidToBTOutOfBandKeyDictionary objectForKeyedSubscript:v22];
      }
      else
      {
        uint64_t v52 = 0;
      }
      v53 = v76;
      if (v52) {
        int v58 = 1;
      }
      else {
        int v58 = v42;
      }
      if (v58 == 1)
      {
        __int16 v59 = +[NSNumber numberWithUnsignedInt:HIDWORD(v83)];
        [(IDSPairingManager *)self _networkRelayRegisterDeviceWithCBUUID:v74 wasInitiallySetupUsingIDSPairing:v42 maxCompatibilityVersion:v59 BTOutOfBandKey:v52 supportsIPsecWithSPPLink:0 bluetoothMACAddress:0];
      }
      else
      {
        __int16 v59 = +[IMRGLog NRPairing];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_100714AE0();
        }
      }

      v41 = v74;
      if (!v42) {
        goto LABEL_92;
      }
    }
    else
    {
      if (v47)
      {
        CFStringRef v55 = @"NO";
        if (v45) {
          CFStringRef v56 = @"YES";
        }
        else {
          CFStringRef v56 = @"NO";
        }
        if (v21) {
          CFStringRef v55 = @"YES";
        }
        *(_DWORD *)long long buf = 138543618;
        *(void *)v90 = v56;
        *(_WORD *)&v90[8] = 2114;
        CFStringRef v91 = v55;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Some device does not support IPsec - EnablingOTRForDefaultPairedDevice {localDeviceSupportIPsec: %{public}@, remoteDeviceSupportIPsec: %{public}@}", buf, 0x16u);
      }

      __int16 v57 = +[IDSUTunDeliveryController sharedInstance];
      [v57 enableOTRForDefaultPairedDevice];

      v41 = v74;
      [(IDSPairingManager *)self _callPairedDeviceDidConnectBlocksForUniqueID:v74 withError:0];
      uint64_t v35 = v85;
      v53 = v76;
      if (!v42) {
        goto LABEL_92;
      }
    }
    unsigned int v60 = [v53 isEqualToIgnoringCase:v35];
    unsigned int v61 = [v77 isEqualToIgnoringCase:v14];
    unsigned int v62 = [v82 isEqualToIgnoringCase:v78];
    unsigned __int8 v63 = [v81 isEqualToIgnoringCase:v84];
    if (v61 && v62 && (v63 & 1) != 0)
    {
      v54 = [(IDSPairingManager *)self pairedDevice];
      if (v60)
      {
        v53 = v76;
        if (v80 == v75)
        {
          if (v72 == a6 && v71 == __PAIR64__(v83, HIDWORD(v83))) {
            goto LABEL_85;
          }
          v64 = +[IMRGLog watchPairing];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v90 = v54;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Notifying all IDS accounts protocol information is different: %@", buf, 0xCu);
          }

          v65 = v87;
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_1001978D0;
          v87[3] = &unk_100984758;
          v54 = v54;
          v87[4] = v54;
LABEL_84:
          [(IDSPairingManager *)self _notifyDelegatesWithBlock:v65];

LABEL_85:
          v41 = v74;
          if (a9 >= 3u && v73 != a9)
          {
            v67 = +[IMRGLog watchPairing];
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "This device now supports cloud delivery, updating flag to enable it when possbile", buf, 2u);
            }

            v68 = +[IDSUTunDeliveryController sharedInstance];
            [v68 setPendingCloudFlagOnDefaultPeer];

            v41 = v74;
          }
          [(IDSPairingManager *)self _requestPairedDeviceInfoAfterDelay:0.0];
LABEL_91:

LABEL_92:
          uint64_t v15 = v78;
          goto LABEL_93;
        }
LABEL_81:
        v66 = +[IMRGLog watchPairing];
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)v90 = v54;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Notifying all IDS accounts paired device updated: %@", buf, 0xCu);
        }

        v65 = v88;
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_100197870;
        v88[3] = &unk_100984758;
        v54 = v54;
        v88[4] = v54;
        goto LABEL_84;
      }
    }
    else
    {
      v54 = [(IDSPairingManager *)self pairedDevice];
    }
    v53 = v76;
    goto LABEL_81;
  }
  v53 = +[IMRGLog watchPairing];
  uint64_t v35 = v85;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
    sub_100714AAC();
  }
  LOBYTE(v39) = 0;
LABEL_93:

  return v39;
}

- (BOOL)updatePairedDeviceiCloudURIs:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IDSPairingManager *)self activePairedDeviceHasPairingType:1])
  {
    id v8 = [(IDSPairingManager *)self pairedDevicePushToken];
    id v9 = [(IDSPairingManager *)self pairedDeviceiCloudURIs];
    BOOL v10 = +[NSSet setWithArray:v9];

    id v11 = [(IDSPairingManager *)self _activePairedDeviceCBUUID];
    BOOL v12 = [(IDSPairingManager *)self pairedDeviceRepository];
    unsigned int v13 = [v12 updatePairedDeviceWithCBUUID:v11 iCloudURIs:v6 pushToken:v7];

    if ([v8 isEqualToData:v7])
    {
      id v14 = +[NSSet setWithArray:v6];
      unsigned __int8 v15 = [v10 isEqualToSet:v14];

      if (!v13) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if ((v15 & 1) == 0)
    {
      [(IDSPairingManager *)self pairedDevice];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100197B28;
      v18[3] = &unk_100984758;
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v19;
      [(IDSPairingManager *)self _notifyDelegatesWithBlock:v18];
    }
    goto LABEL_11;
  }
  id v8 = +[IMRGLog watchPairing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100714B6C();
  }
  LOBYTE(v13) = 0;
LABEL_12:

  return v13;
}

- (void)refreshPairedDeviceEncryptionKeys
{
  BOOL v3 = +[IMRGLog regeneration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Refreshing Paired Device Encryption Keys", buf, 2u);
  }

  id v4 = +[IMRGLog regeneration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Suspending OTR sessions for protection classes A and C...", v10, 2u);
  }

  [(IDSPairingManager *)self _suspendOTRSessionsWithProtectionClass:1];
  [(IDSPairingManager *)self _suspendOTRSessionsWithProtectionClass:0];
  unsigned int v5 = [(IDSPairingManager *)self _purgeSecuredEncryptionKeysForAllPairedDevices];
  id v6 = +[IMRGLog regeneration];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Purged all paired device encryption keys. Requesting paired device info...", v9, 2u);
    }

    [(IDSPairingManager *)self _requestPairedDeviceInfoAfterDelay:0.0];
    id v7 = +[IMRGLog regeneration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requested paired device info. Refresh Complete!", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    sub_100714BD8();
  }
}

+ (void)devicePairingProtocolVersion:(unsigned int *)a3 minCompatibilityVersion:(unsigned int *)a4 maxCompatibilityVersion:(unsigned int *)a5
{
  *a3 = 0;
  *a4 = -1;
  *a5 = -1;
  id v8 = (void *)qword_100A4A8E8;
  if (qword_100A4A8E8 || (id v8 = (void *)IMWeakLinkClass(), (qword_100A4A8E8 = (uint64_t)v8) != 0))
  {
    id v9 = [v8 sharedInstance];
    *a3 = [v9 pairingCompatibilityVersion];
    *a4 = [v9 minPairingCompatibilityVersion];
    *a5 = [v9 maxPairingCompatibilityVersion];
  }
  BOOL v10 = +[IMRGLog pairingProtocolDebug];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = *a3;
    unsigned int v12 = *a4;
    unsigned int v13 = *a5;
    int v14 = 136315906;
    unsigned __int8 v15 = "+[IDSPairingManager devicePairingProtocolVersion:minCompatibilityVersion:maxCompatibilityVersion:]";
    __int16 v16 = 1024;
    unsigned int v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v12;
    __int16 v20 = 1024;
    unsigned int v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s reading version: %u, min/max: %u/%u", (uint8_t *)&v14, 0x1Eu);
  }
}

- (BOOL)pairedDeviceSupportsSendLaterMessages
{
  return 0;
}

- (void)deliveryController:(id)a3 foundNearbyIPsecCapableDeviceWithUniqueID:(id)a4
{
  id v5 = a4;
  id v6 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PairingManager found nearbyIPsec device", buf, 2u);
  }

  if ([v5 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID])
  {
    id v7 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(IDSPairingManager *)self pairedDeviceUUIDString];
      *(_DWORD *)long long buf = 138478083;
      id v23 = v5;
      __int16 v24 = 2113;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Replacing uniqueID with pairedDeviceUniqueID {uniqueID: %{private}@, pairedDeviceUUIDString: %{private}@}", buf, 0x16u);
    }
    uint64_t v9 = [(IDSPairingManager *)self pairedDeviceUUIDString];

    id v5 = (id)v9;
  }
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  unsigned int v11 = [(IDSPairingManager *)self pairedDeviceUUIDString];
  unsigned int v12 = [v11 isEqualToString:v5];

  if (v12)
  {
    if ([(IDSPairingManager *)self shouldQuickSwitchAfterIPSecConnected])
    {
      [(IDSPairingManager *)self setShouldQuickSwitchAfterIPSecConnected:0];
      unsigned int v13 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SupportIPSec status updated.  Should now QuickSwitch to using IPSec.", buf, 2u);
      }

      int v14 = +[IDSQuickSwitchHelper sharedInstance];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001981F0;
      v18[3] = &unk_1009847A8;
      id v19 = v5;
      __int16 v20 = self;
      id v21 = v10;
      [v14 initiateQuickSwitchToDeviceWithCBUUID:v19 force:1 completionBlock:v18];
    }
    else
    {
      unsigned int v17 = +[IMRGLog NRPairing];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "ActivePairedDevice alread marked with supportIPsec -- Done", buf, 2u);
      }

      [(IDSPairingManager *)self _callPairedDeviceDidConnectBlocksForUniqueID:v10 withError:0];
    }
  }
  else
  {
    unsigned __int8 v15 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(IDSPairingManager *)self pairedDeviceUniqueID];
      *(_DWORD *)long long buf = 138478083;
      id v23 = v16;
      __int16 v24 = 2113;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device found IPsec nearby but is not active paired device -- Ignoring {pairedDeviceUniqueID: %{private}@, uniqueID: %{private}@}", buf, 0x16u);
    }
  }
}

- (id)_nrDeviceIdentifierWithCBUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NRDeviceIdentifier newDeviceIdentifierWithBluetoothUUID:v3];
    if (v4) {
      goto LABEL_9;
    }
    id v5 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100714C4C((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    id v5 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100714C0C();
    }
    id v4 = 0;
  }

LABEL_9:

  return v4;
}

- (NRDeviceManager)nrDeviceManager
{
  return self->_nrDeviceManager;
}

- (NSMutableArray)registeredPairedDeviceDidConnectBlockPairs
{
  return self->_registeredPairedDeviceDidConnectBlockPairs;
}

- (BOOL)shouldQuickSwitchAfterIPSecConnected
{
  return self->_shouldQuickSwitchAfterIPSecConnected;
}

- (void)setShouldQuickSwitchAfterIPSecConnected:(BOOL)a3
{
  self->_shouldQuickSwitchAfterIPSecConnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPairedDeviceDidConnectBlockPairs, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRepository, 0);
  objc_storeStrong((id *)&self->_nrDeviceManager, 0);
  objc_storeStrong((id *)&self->_cbuuidToBTOutOfBandKeyDictionary, 0);
  objc_storeStrong((id *)&self->_pairedDeviceInfoRequestCountdown, 0);
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_delegateMap, 0);
}

@end