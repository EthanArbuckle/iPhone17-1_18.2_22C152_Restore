@interface NSBBridgePersistence
- (NPSDomainAccessor)defaults;
- (NPSManager)syncManager;
- (NSBBridgePersistence)init;
- (NSMutableSet)keysToSynchronize;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)_addObservers;
- (void)_deviceDidBecomeActive:(id)a3;
- (void)_removeObservers;
- (void)_setupDefaults;
- (void)dealloc;
- (void)removeObjectForKey:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setKeysToSynchronize:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSyncManager:(id)a3;
- (void)synchronize;
@end

@implementation NSBBridgePersistence

- (NSBBridgePersistence)init
{
  v8.receiver = self;
  v8.super_class = (Class)NSBBridgePersistence;
  v2 = [(NSBBridgePersistence *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    uint64_t v5 = objc_opt_new();
    keysToSynchronize = v2->_keysToSynchronize;
    v2->_keysToSynchronize = (NSMutableSet *)v5;

    [(NSBBridgePersistence *)v2 _setupDefaults];
    [(NSBBridgePersistence *)v2 _addObservers];
  }
  return v2;
}

- (void)dealloc
{
  [(NSBBridgePersistence *)self _removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)NSBBridgePersistence;
  [(NSBBridgePersistence *)&v3 dealloc];
}

- (void)_addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_deviceDidBecomeActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];
}

- (void)_deviceDidBecomeActive:(id)a3
{
  v4 = stocks_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Device became active; reset defaults.", v5, 2u);
  }

  [(NSBBridgePersistence *)self _setupDefaults];
}

- (void)_removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_setupDefaults
{
  self->_defaults = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.stocks.bridge"];

  _objc_release_x1();
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSBBridgePersistence *)self defaults];
  id v6 = [v5 integerForKey:v4];

  return (int64_t)v6;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  v7 = [(NSBBridgePersistence *)self defaults];
  [v7 setInteger:a3 forKey:v6];

  id v8 = [(NSBBridgePersistence *)self keysToSynchronize];
  [v8 addObject:v6];
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSBBridgePersistence *)self defaults];
  id v6 = [v5 stringForKey:v4];

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSBBridgePersistence *)self defaults];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSBBridgePersistence *)self defaults];
  [v5 removeObjectForKey:v4];

  id v6 = [(NSBBridgePersistence *)self keysToSynchronize];
  [v6 addObject:v4];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSBBridgePersistence *)self defaults];
  [v8 setObject:v7 forKey:v6];

  id v9 = [(NSBBridgePersistence *)self keysToSynchronize];
  [v9 addObject:v6];
}

- (void)synchronize
{
  id v3 = [(NSBBridgePersistence *)self defaults];
  id v4 = [v3 synchronize];

  uint64_t v5 = [(NSBBridgePersistence *)self keysToSynchronize];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(NSBBridgePersistence *)self syncManager];
    id v8 = [(NSBBridgePersistence *)self keysToSynchronize];
    [v7 synchronizeNanoDomain:@"com.apple.stocks.bridge" keys:v8];

    id v9 = [(NSBBridgePersistence *)self keysToSynchronize];
    [v9 removeAllObjects];
  }
}

- (NPSDomainAccessor)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (NSMutableSet)keysToSynchronize
{
  return self->_keysToSynchronize;
}

- (void)setKeysToSynchronize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToSynchronize, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end