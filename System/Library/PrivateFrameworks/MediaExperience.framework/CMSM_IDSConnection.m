@interface CMSM_IDSConnection
- (CMSM_IDSConnection)init;
- (id)copyNearbyPairedDevice;
- (id)copyNearbyPairedDeviceModelIdentifier;
- (id)copyNearbyPairedDeviceName;
- (id)copyNearbyPairedDeviceProductName;
- (id)copyNearbyPairedDeviceUniqueID;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)updateNearbyPairedDevice;
@end

@implementation CMSM_IDSConnection

- (id)copyNearbyPairedDevice
{
  if (sIDSConnectedInitializationDone != 1) {
    return 0;
  }
  MEMORY[0x199716E90](qword_1E9359000, a2);
  v3 = self->pNearbyPairedDevice;
  MEMORY[0x199716EA0](qword_1E9359000);
  return v3;
}

- (CMSM_IDSConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMSM_IDSConnection;
  v2 = [(CMSM_IDSConnection *)&v6 init];
  v2->pNearbyPairedDevice = 0;
  v2->pIdsService = (IDSService *)[objc_alloc((Class)CMSM_GetIDSServiceClass()) initWithService:@"com.apple.private.alloy.cmsession"];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.cmsession.ids.server.dispatch", v3);
  v2->idsDispatchQueue = (OS_dispatch_queue *)v4;
  [(IDSService *)v2->pIdsService addDelegate:v2 queue:v4];
  return v2;
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  int IsNearbyPairedDevicePresentAndConnected = CMSM_IDSConnection_IsNearbyPairedDevicePresentAndConnected();
  if (IsNearbyPairedDevicePresentAndConnected != service_connectedDevicesChanged__nearbyPairedDeviceIsConnectedOldValue)
  {
    service_connectedDevicesChanged__nearbyPairedDeviceIsConnectedOldValue = IsNearbyPairedDevicePresentAndConnected;
    CMSM_IDSConnection_HandleNearbyDeviceStatusChange();
  }
}

- (void)updateNearbyPairedDevice
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(IDSService *)self->pIdsService devices];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isLocallyPaired] && objc_msgSend(v8, "isNearby"))
        {
          v9 = v8;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v9 = 0;
LABEL_12:
  MEMORY[0x199716E90](qword_1E9359000);
  pNearbyPairedDevice = self->pNearbyPairedDevice;

  self->pNearbyPairedDevice = v9;
  MEMORY[0x199716EA0](qword_1E9359000);
  if (pNearbyPairedDevice != v9)
  {
    CMSM_IDSConnection_HandleNearbyDeviceStatusChange();
    cmsm_IDSConnection_UpdateOtherDevicesConnectedInfoInPickableRoutesCache();
  }
}

- (id)copyNearbyPairedDeviceUniqueID
{
  MEMORY[0x199716E90](qword_1E9359000, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice) {
    id v4 = (id)[(IDSDevice *)pNearbyPairedDevice uniqueIDOverride];
  }
  else {
    id v4 = 0;
  }
  MEMORY[0x199716EA0](qword_1E9359000);
  return v4;
}

- (id)copyNearbyPairedDeviceProductName
{
  MEMORY[0x199716E90](qword_1E9359000, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice) {
    id v4 = (id)[(IDSDevice *)pNearbyPairedDevice productName];
  }
  else {
    id v4 = 0;
  }
  MEMORY[0x199716EA0](qword_1E9359000);
  return v4;
}

- (id)copyNearbyPairedDeviceModelIdentifier
{
  MEMORY[0x199716E90](qword_1E9359000, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice) {
    id v4 = (id)[(IDSDevice *)pNearbyPairedDevice modelIdentifier];
  }
  else {
    id v4 = 0;
  }
  MEMORY[0x199716EA0](qword_1E9359000);
  return v4;
}

- (id)copyNearbyPairedDeviceName
{
  MEMORY[0x199716E90](qword_1E9359000, a2);
  pNearbyPairedDevice = self->pNearbyPairedDevice;
  if (pNearbyPairedDevice) {
    id v4 = (id)[(IDSDevice *)pNearbyPairedDevice name];
  }
  else {
    id v4 = 0;
  }
  MEMORY[0x199716EA0](qword_1E9359000);
  return v4;
}

@end