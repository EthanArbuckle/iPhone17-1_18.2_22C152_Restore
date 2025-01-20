@interface MRAVDistantEndpoint
+ (BOOL)supportsSecureCoding;
+ (MRAVDistantExternalDeviceFactory)externalDeviceFactory;
- (BOOL)canModifyGroupMembership;
- (BOOL)isConnected;
- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements;
- (BOOL)isProxyGroupPlayer;
- (MRAVDistantEndpoint)initWithCoder:(id)a3;
- (MRAVDistantEndpoint)initWithDescriptor:(id)a3;
- (MRAVDistantEndpoint)initWithDescriptor:(id)a3 xpcEndpointListener:(id)a4;
- (MRAVDistantOutputDevice)distantGroupLeader;
- (MRDistantExternalDevice)distantExternalDevice;
- (NSArray)distantOutputDevices;
- (NSArray)distantPersonalOutputDevices;
- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint;
- (OS_dispatch_queue)externalDeviceQueue;
- (id)_externalOutputContext;
- (id)debugDescription;
- (id)designatedGroupLeader;
- (id)groupSessionInfo;
- (id)localizedName;
- (id)outputDevices;
- (id)personalOutputDevices;
- (id)uniqueIdentifier;
- (int64_t)connectionType;
- (uint64_t)_handleEndpointDidConnectWithExternalDevice:(uint64_t)result;
- (void)_handleConnectionStateDidChangeNotification:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_handleEndpointDidDisconnectWithError:(void *)a1;
- (void)_onExternalDeviceQueue_setExternalDevice:(uint64_t)a1;
- (void)_registerNotificationsForExternalDevice:(uint64_t)a1;
- (void)_unregisterNotificationsForExternalDevice:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDistantExternalDevice:(id)a3;
- (void)setDistantGroupLeader:(id)a3;
- (void)setDistantOutputDevices:(id)a3;
- (void)setDistantPersonalOutputDevices:(id)a3;
- (void)setExternalDeviceListenerEndpoint:(id)a3;
- (void)setExternalDeviceQueue:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation MRAVDistantEndpoint

- (MRAVDistantEndpoint)initWithDescriptor:(id)a3 xpcEndpointListener:(id)a4
{
  id v7 = a4;
  v8 = [(MRAVDistantEndpoint *)self initWithDescriptor:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_externalDeviceListenerEndpoint, a4);
  }

  return v9;
}

- (MRAVDistantEndpoint)initWithDescriptor:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MRAVDistantEndpoint;
  v5 = [(MRAVEndpoint *)&v46 _init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.distantEndpoint/externalDeviceQueue", v6);
    externalDeviceQueue = v5->_externalDeviceQueue;
    v5->_externalDeviceQueue = (OS_dispatch_queue *)v7;

    v9 = [v4 name];
    uint64_t v10 = [v9 copy];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v10;

    v12 = [v4 uniqueIdentifier];
    uint64_t v13 = [v12 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v13;

    v5->_connectionType = (int)[v4 connectionType];
    v5->_canModifyGroupMembership = [v4 canModifyGroupMembership];
    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v16 = [v4 outputDevices];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:*(void *)(*((void *)&v42 + 1) + 8 * v20)];
          [(NSArray *)v15 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v18);
    }

    v22 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v23 = objc_msgSend(v4, "personalOutputDevices", 0);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:*(void *)(*((void *)&v38 + 1) + 8 * v27)];
          [(NSArray *)v22 addObject:v28];

          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v25);
    }

    distantOutputDevices = v5->_distantOutputDevices;
    v5->_distantOutputDevices = v15;
    v30 = v15;

    distantPersonalOutputDevices = v5->_distantPersonalOutputDevices;
    v5->_distantPersonalOutputDevices = v22;
    v32 = v22;

    v33 = [MRAVDistantOutputDevice alloc];
    v34 = [v4 designatedGroupLeader];
    uint64_t v35 = [(MRAVDistantOutputDevice *)v33 initWithDescriptor:v34];
    distantGroupLeader = v5->_distantGroupLeader;
    v5->_distantGroupLeader = (MRAVDistantOutputDevice *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(_MRAVEndpointDescriptorProtobuf);
  [(_MRAVEndpointDescriptorProtobuf *)v5 setName:self->_localizedName];
  [(_MRAVEndpointDescriptorProtobuf *)v5 setUniqueIdentifier:self->_uniqueIdentifier];
  [(_MRAVEndpointDescriptorProtobuf *)v5 setConnectionType:LODWORD(self->_connectionType)];
  v6 = [(MRAVDistantOutputDevice *)self->_distantGroupLeader protobuf];
  [(_MRAVEndpointDescriptorProtobuf *)v5 setDesignatedGroupLeader:v6];

  [(_MRAVEndpointDescriptorProtobuf *)v5 setCanModifyGroupMembership:self->_canModifyGroupMembership];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  dispatch_queue_t v7 = self->_distantOutputDevices;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v27 + 1) + 8 * v11) protobuf];
        [(_MRAVEndpointDescriptorProtobuf *)v5 addOutputDevices:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = self->_distantPersonalOutputDevices;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) protobuf];
        [(_MRAVEndpointDescriptorProtobuf *)v5 addPersonalOutputDevices:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  [v4 encodeObject:v5 forKey:@"protobuf"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    externalDeviceQueue = self->_externalDeviceQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__MRAVDistantEndpoint_encodeWithCoder___block_invoke;
    v20[3] = &unk_1E57D0790;
    id v21 = v4;
    v22 = self;
    dispatch_sync(externalDeviceQueue, v20);
  }
}

- (id)outputDevices
{
  return self->_distantOutputDevices;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (id)designatedGroupLeader
{
  return self->_distantGroupLeader;
}

- (BOOL)canModifyGroupMembership
{
  return self->_canModifyGroupMembership;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

uint64_t __39__MRAVDistantEndpoint_encodeWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 128) forKey:@"externalDeviceListenerEndpoint"];
}

- (MRAVDistantEndpoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalDeviceListenerEndpoint"];

  dispatch_queue_t v7 = [(MRAVDistantEndpoint *)self initWithDescriptor:v5 xpcEndpointListener:v6];
  return v7;
}

- (void)dealloc
{
  v3 = +[MRMediaRemoteServiceClient sharedServiceClient];
  [v3 removeDistantEndpoint:self];

  v4.receiver = self;
  v4.super_class = (Class)MRAVDistantEndpoint;
  [(MRAVDistantEndpoint *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDeviceListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_distantGroupLeader, 0);
  objc_storeStrong((id *)&self->_distantPersonalOutputDevices, 0);
  objc_storeStrong((id *)&self->_distantOutputDevices, 0);
  objc_storeStrong((id *)&self->_externalDeviceQueue, 0);
  objc_storeStrong((id *)&self->_distantExternalDevice, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  v12.receiver = self;
  v12.super_class = (Class)MRAVDistantEndpoint;
  v3 = [(MRAVEndpoint *)&v12 debugDescription];
  objc_super v4 = (void *)[v3 mutableCopy];

  externalDeviceQueue = self->_externalDeviceQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__MRAVDistantEndpoint_debugDescription__block_invoke;
  v9[3] = &unk_1E57D0790;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  dispatch_sync(externalDeviceQueue, v9);
  id v7 = v6;

  return v7;
}

uint64_t __39__MRAVDistantEndpoint_debugDescription__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "mr_formattedDebugDescription");
  [v2 appendFormat:@"\n  distantExternalDevice = %@\n", v3];

  objc_super v4 = *(void **)(a1 + 32);

  return [v4 appendFormat:@">"];
}

- (id)personalOutputDevices
{
  return self->_distantPersonalOutputDevices;
}

- (BOOL)isProxyGroupPlayer
{
  v2 = [(MRAVDistantEndpoint *)self designatedGroupLeader];
  char v3 = [v2 isProxyGroupPlayer];

  return v3;
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  externalDeviceQueue = self->_externalDeviceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MRAVDistantEndpoint_isConnected__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalDeviceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__MRAVDistantEndpoint_isConnected__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) isConnected];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)groupSessionInfo
{
  char v3 = [(MRAVDistantEndpoint *)self distantExternalDevice];
  objc_super v4 = [v3 deviceInfo];

  v5 = [MRGroupSessionInfo alloc];
  uint64_t v6 = [v4 groupSessionToken];
  id v7 = [(MRGroupSessionInfo *)v5 initWithToken:v6 isHosted:0];

  if (v7)
  {
    uint64_t v8 = v7;
  }
  else
  {
    if ([v4 hasPlaceholderGroupSession])
    {
      char v9 = [[MRGroupSessionToken alloc] initWithDeviceInfo:v4];
      id v10 = [[MRGroupSessionInfo alloc] initWithToken:v9 isHosted:0 isPlaceholder:1];

      goto LABEL_7;
    }
    v12.receiver = self;
    v12.super_class = (Class)MRAVDistantEndpoint;
    uint64_t v8 = [(MRAVEndpoint *)&v12 groupSessionInfo];
  }
  id v10 = v8;
LABEL_7:

  return v10;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  v2 = [(MRAVDistantEndpoint *)self distantExternalDevice];
  char v3 = [v2 deviceInfo];
  char v4 = [v3 isEligibleForHostingGroupSessionExcludingAcknowledgements];

  return v4;
}

- (MRDistantExternalDevice)distantExternalDevice
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  externalDeviceQueue = self->_externalDeviceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MRAVDistantEndpoint_distantExternalDevice__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(externalDeviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDistantExternalDevice *)v3;
}

void __44__MRAVDistantEndpoint_distantExternalDevice__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 88);
  if (!v3)
  {
    char v4 = [(id)objc_opt_class() externalDeviceFactory];
    v5 = [v4 distantExternalDeviceForEndpoint:*(void *)(a1 + 32)];
    -[MRAVDistantEndpoint _onExternalDeviceQueue_setExternalDevice:](v2, v5);

    id v3 = *(void **)(*(void *)(a1 + 32) + 88);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v3);
}

- (void)_onExternalDeviceQueue_setExternalDevice:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    if (*(void *)(a1 + 88)) {
      -[MRAVDistantEndpoint _unregisterNotificationsForExternalDevice:](a1);
    }
    objc_storeStrong((id *)(a1 + 88), a2);
    if (*(void *)(a1 + 88)) {
      -[MRAVDistantEndpoint _registerNotificationsForExternalDevice:](a1);
    }
    if ([v5 connectionState] == 2) {
      -[MRAVDistantEndpoint _handleEndpointDidConnectWithExternalDevice:](a1, v5);
    }
    char v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
    [v4 addDistantEndpoint:a1];
  }
}

- (void)setDistantExternalDevice:(id)a3
{
  id v4 = a3;
  externalDeviceQueue = self->_externalDeviceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MRAVDistantEndpoint_setDistantExternalDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(externalDeviceQueue, v7);
}

uint64_t __48__MRAVDistantEndpoint_setDistantExternalDevice___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (*(void **)(result + 88) != v3)
  {
    -[MRAVDistantEndpoint _onExternalDeviceQueue_setExternalDevice:](result, v3);
    *(void *)(*(void *)(a1 + 32) + 128) = [*(id *)(a1 + 40) listenerEndpoint];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)_externalOutputContext
{
  uint64_t v2 = [(MRAVDistantEndpoint *)self distantExternalDevice];
  id v3 = [v2 externalOutputContext];

  return v3;
}

- (void)_handleConnectionStateDidChangeNotification:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  id v5 = [v4 objectForKey:@"kMRExternalDeviceConnectionStateUserInfoKey"];
  int v6 = [v5 unsignedIntValue];

  id v7 = [v10 userInfo];
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F28A50]];

  if (v6 == 3)
  {
    -[MRAVDistantEndpoint _handleEndpointDidDisconnectWithError:](self, v8);
  }
  else if (v6 == 2)
  {
    char v9 = [v10 object];
    -[MRAVDistantEndpoint _handleEndpointDidConnectWithExternalDevice:]((uint64_t)self, v9);
  }
}

- (uint64_t)_handleEndpointDidConnectWithExternalDevice:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = [a2 externalOutputContext];
    [v2 setOutputContextDataSource:v3];

    id v4 = objc_opt_class();
    return [v4 _notifyEndpointDidConnect:v2];
  }
  return result;
}

- (void)_handleEndpointDidDisconnectWithError:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    [a1 setOutputContextDataSource:0];
    [(id)objc_opt_class() _notifyEndpointDidDisconnect:a1 withError:v3];
  }
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v18 = [v5 objectForKey:@"MRExternalDeviceDeviceInfoUserInfoKey"];

  int v6 = [v4 userInfo];

  id v7 = [v6 objectForKey:@"MRExternalDevicePreviousDeviceInfoUserInfoKey"];

  if (v7)
  {
    id v8 = [v7 groupSessionToken];
    char v9 = [v18 groupSessionToken];
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      BOOL v11 = [(MRGroupSessionInfo *)v8 isEqual:v9];

      if (v11) {
        goto LABEL_8;
      }
      objc_super v12 = [MRGroupSessionInfo alloc];
      uint64_t v13 = [v18 groupSessionToken];
      id v8 = [(MRGroupSessionInfo *)v12 initWithToken:v13 isHosted:0];

      [(id)objc_opt_class() _notifyGroupSessionInfoDidChange:v8 endpoint:self];
    }

LABEL_8:
    int v17 = [v7 isEligibleForHostingGroupSessionExcludingAcknowledgements];
    if (v17 == [v18 isEligibleForHostingGroupSessionExcludingAcknowledgements]) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v14 = [MRGroupSessionInfo alloc];
  uint64_t v15 = [v18 groupSessionToken];
  uint64_t v16 = [(MRGroupSessionInfo *)v14 initWithToken:v15 isHosted:0];

  [(id)objc_opt_class() _notifyGroupSessionInfoDidChange:v16 endpoint:self];
LABEL_9:
  [(id)objc_opt_class() _notifyGroupSessionHostingEligibilityDidChangeForEndpoint:self];
LABEL_10:
  [(id)objc_opt_class() _notifyDeviceInfoDidChange:v18 previousDeviceInfo:v7 endpoint:self];
}

+ (MRAVDistantExternalDeviceFactory)externalDeviceFactory
{
  if (externalDeviceFactory_onceToken != -1) {
    dispatch_once(&externalDeviceFactory_onceToken, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)externalDeviceFactory_cache;

  return (MRAVDistantExternalDeviceFactory *)v2;
}

uint64_t __44__MRAVDistantEndpoint_externalDeviceFactory__block_invoke()
{
  externalDeviceFactory_cache = objc_alloc_init(MRAVDistantExternalDeviceFactory);

  return MEMORY[0x1F41817F8]();
}

- (void)_unregisterNotificationsForExternalDevice:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:a1 name:@"kMRExternalDeviceConnectionStateDidChangeNotification" object:*(void *)(a1 + 88)];

    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:a1 name:@"MRExternalDeviceDeviceInfoDidChangeNotification" object:*(void *)(a1 + 88)];
  }
}

- (void)_registerNotificationsForExternalDevice:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel__handleConnectionStateDidChangeNotification_ name:@"kMRExternalDeviceConnectionStateDidChangeNotification" object:*(void *)(a1 + 88)];

    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:a1 selector:sel__handleDeviceInfoDidChangeNotification_ name:@"MRExternalDeviceDeviceInfoDidChangeNotification" object:*(void *)(a1 + 88)];
  }
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (OS_dispatch_queue)externalDeviceQueue
{
  return self->_externalDeviceQueue;
}

- (void)setExternalDeviceQueue:(id)a3
{
}

- (NSArray)distantOutputDevices
{
  return self->_distantOutputDevices;
}

- (void)setDistantOutputDevices:(id)a3
{
}

- (NSArray)distantPersonalOutputDevices
{
  return self->_distantPersonalOutputDevices;
}

- (void)setDistantPersonalOutputDevices:(id)a3
{
}

- (MRAVDistantOutputDevice)distantGroupLeader
{
  return self->_distantGroupLeader;
}

- (void)setDistantGroupLeader:(id)a3
{
}

- (NSXPCListenerEndpoint)externalDeviceListenerEndpoint
{
  return self->_externalDeviceListenerEndpoint;
}

- (void)setExternalDeviceListenerEndpoint:(id)a3
{
}

@end