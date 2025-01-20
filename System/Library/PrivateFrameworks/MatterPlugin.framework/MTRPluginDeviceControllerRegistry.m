@interface MTRPluginDeviceControllerRegistry
+ (id)sharedInstance;
- (BOOL)addDeviceController:(id)a3;
- (BOOL)addDeviceController:(id)a3 forEntityWithIdentifier:(id)a4;
- (BOOL)removeDeviceController:(id)a3;
- (MTRPluginDeviceControllerRegistry)init;
- (NSArray)controllers;
- (NSMutableArray)controllerEntities;
- (id)_deviceControllerEntityForIdentifier:(id)a3;
- (id)deviceControllerForUUID:(id)a3;
- (void)setControllerEntities:(id)a3;
@end

@implementation MTRPluginDeviceControllerRegistry

+ (id)sharedInstance
{
  if (sharedInstance_creation_3 != -1) {
    dispatch_once(&sharedInstance_creation_3, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sInstance_3;
  return v2;
}

uint64_t __51__MTRPluginDeviceControllerRegistry_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_3 = objc_alloc_init(MTRPluginDeviceControllerRegistry);
  return MEMORY[0x270F9A758]();
}

- (MTRPluginDeviceControllerRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginDeviceControllerRegistry;
  v2 = [(MTRPluginDeviceControllerRegistry *)&v8 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    controllers = v2->_controllers;
    v2->_controllers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    controllerEntities = v2->_controllerEntities;
    v2->_controllerEntities = v5;
  }
  return v2;
}

- (NSArray)controllers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(MTRPluginDeviceControllerRegistry *)v2 controllerEntities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) controller];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return (NSArray *)v3;
}

- (id)deviceControllerForUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTRPluginDeviceControllerRegistry *)self _deviceControllerEntityForIdentifier:v4];
  uint64_t v6 = [v5 controller];

  if (v6)
  {
    v7 = [v5 controller];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = [(MTRPluginDeviceControllerRegistry *)self controllers];
      int v12 = 138412802;
      long long v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = [v8 count];
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot find controller for UUID %@ in %lu controllers - returning first available controller", (uint8_t *)&v12, 0x20u);
    }
    v9 = [(MTRPluginDeviceControllerRegistry *)self controllerEntities];
    long long v10 = [v9 firstObject];
    v7 = [v10 controller];
  }
  return v7;
}

- (id)_deviceControllerEntityForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(MTRPluginDeviceControllerRegistry *)v5 controllerEntities];
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 entityIdentifier];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)addDeviceController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uniqueIdentifier];
  LOBYTE(self) = [(MTRPluginDeviceControllerRegistry *)self addDeviceController:v4 forEntityWithIdentifier:v5];

  return (char)self;
}

- (BOOL)addDeviceController:(id)a3 forEntityWithIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  v9 = [(MTRPluginDeviceControllerRegistry *)v8 _deviceControllerEntityForIdentifier:v7];
  if (v9)
  {
    long long v10 = &_os_log_internal;
    id v11 = &_os_log_internal;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [v9 controller];
      int v15 = 138412802;
      long long v16 = v8;
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Found existing controller %@ for entity UUID %@, ignoring add request", (uint8_t *)&v15, 0x20u);

      long long v10 = &_os_log_internal;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      long long v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Adding device controller: %@ for entityIdentifier %@", (uint8_t *)&v15, 0x20u);
    }
    long long v10 = [(MTRPluginDeviceControllerRegistry *)v8 controllerEntities];
    long long v13 = [[MTRDeviceControllerEntity alloc] initWithController:v6 entityIdentifier:v7];
    [v10 addObject:v13];
  }
  objc_sync_exit(v8);

  return 1;
}

- (BOOL)removeDeviceController:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ IGNORING request to remove device controller: %@", (uint8_t *)&v7, 0x16u);
  }
  objc_sync_exit(v5);

  return 1;
}

- (NSMutableArray)controllerEntities
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setControllerEntities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerEntities, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end