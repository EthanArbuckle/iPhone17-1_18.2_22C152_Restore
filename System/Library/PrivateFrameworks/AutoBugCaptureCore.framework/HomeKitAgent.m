@interface HomeKitAgent
+ (BOOL)_loadHomeKit;
- (HomeKitAgent)initWithIDSService:(id)a3;
- (void)_replyWithResidentDevicesIDSIdentifiers:(id)a3;
- (void)dealloc;
- (void)fetchResidentDevicesIDSIdentifiersWithReply:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeKitAgent

- (HomeKitAgent)initWithIDSService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeKitAgent;
  v6 = [(HomeKitAgent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_idsService, a3);
  }

  return v7;
}

- (void)dealloc
{
  gHMHomeManagerClass = 0;
  if (gHomeKitDyLibHandle)
  {
    dlclose((void *)gHomeKitDyLibHandle);
    gHomeKitDyLibHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)HomeKitAgent;
  [(HomeKitAgent *)&v3 dealloc];
}

+ (BOOL)_loadHomeKit
{
  if (_loadHomeKit_symbolLoadOnce != -1) {
    dispatch_once(&_loadHomeKit_symbolLoadOnce, &__block_literal_global_9);
  }
  return _loadHomeKit_symbolsLoaded;
}

void __28__HomeKitAgent__loadHomeKit__block_invoke()
{
  gHomeKitDyLibHandle = (uint64_t)dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 6);
  if (!gHomeKitDyLibHandle)
  {
    objc_super v3 = xpcLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __int16 v6 = 0;
      v4 = "Failed to load HomeKit.framework";
      id v5 = (uint8_t *)&v6;
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  gHMHomeManagerClass Class = (uint64_t)objc_getClass("HMHomeManager");
  Class Class = objc_getClass("HMMutableHomeManagerConfiguration");
  gHMMutableHomeManagerConfigurationClass Class = (uint64_t)Class;
  if (gHMHomeManagerClass) {
    BOOL v1 = Class == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  _loadHomeKit_symbolsLoaded = v2;
  if (v1)
  {
    objc_super v3 = xpcLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      v4 = "Failed to load HMHomeManager and/or HMHomeManagerConfiguration class from HomeKit.framework";
      id v5 = (uint8_t *)&v7;
LABEL_14:
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
}

- (void)fetchResidentDevicesIDSIdentifiersWithReply:(id)a3
{
  id aBlock = a3;
  uint64_t v4 = +[HomeKitAgent _loadHomeKit];
  id v5 = aBlock;
  if (v4)
  {
    if (self->_homeManager)
    {
      id v5 = aBlock;
      if (!self->_didUpdateHomes) {
        goto LABEL_9;
      }
      uint64_t v4 = [(HomeKitAgent *)self _replyWithResidentDevicesIDSIdentifiers:aBlock];
    }
    else
    {
      __int16 v6 = [(id)gHMMutableHomeManagerConfigurationClass defaultPrivateConfiguration];
      [v6 setOptions:2056];
      [v6 setCachePolicy:2];
      [v6 setDiscretionary:1];
      __int16 v7 = (HMHomeManager *)[objc_alloc((Class)gHMHomeManagerClass) initWithHomeMangerConfiguration:v6];
      homeManager = self->_homeManager;
      self->_homeManager = v7;

      id completionBlock = self->_completionBlock;
      if (completionBlock)
      {
        _Block_release(completionBlock);
        id v10 = self->_completionBlock;
        self->_id completionBlock = 0;
      }
      v11 = _Block_copy(aBlock);
      id v12 = self->_completionBlock;
      self->_id completionBlock = v11;

      [(HMHomeManager *)self->_homeManager setDelegate:self];
    }
    id v5 = aBlock;
  }
LABEL_9:

  MEMORY[0x270F9A758](v4, v5);
}

- (void)_replyWithResidentDevicesIDSIdentifiers:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = [(HMHomeManager *)self->_homeManager homes];
  __int16 v6 = [MEMORY[0x263EFF980] array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke;
  v8[3] = &unk_263FC3C70;
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [v5 enumerateObjectsUsingBlock:v8];
  if (v4) {
    v4[2](v4, v7);
  }
}

void __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 currentUser];
  id v5 = [v3 homeAccessControlForUser:v4];
  int v6 = [v5 isOwner];

  if (v6)
  {
    id v7 = [v3 residentDevices];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke_2;
    v9[3] = &unk_263FC3C48;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v7 enumerateObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = homekitLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "User does not own this home : %@", buf, 0xCu);
    }
  }
}

void __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 device];
  id v5 = [v4 IDSDeviceForIDSService:*(void *)(*(void *)(a1 + 32) + 24)];
  int v6 = [v5 uniqueID];

  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    id v7 = homekitLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v3 name];
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Failed to retrieve account ID from ResidentDevice %@ (%@)", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  self->_didUpdateHomes = 1;
  if (self->_completionBlock)
  {
    -[HomeKitAgent _replyWithResidentDevicesIDSIdentifiers:](self, "_replyWithResidentDevicesIDSIdentifiers:");
    _Block_release(self->_completionBlock);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_idsService, 0);

  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end