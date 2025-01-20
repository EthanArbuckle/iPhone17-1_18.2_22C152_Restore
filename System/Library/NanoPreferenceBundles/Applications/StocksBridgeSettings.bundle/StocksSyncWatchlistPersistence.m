@interface StocksSyncWatchlistPersistence
- (NPSManager)syncManager;
- (NSMutableSet)keysToSynchronize;
- (NSUserDefaults)companionDefaults;
- (StocksSyncWatchlistPersistence)init;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setCompanionDefaults:(id)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setKeysToSynchronize:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSyncManager:(id)a3;
- (void)synchronize;
@end

@implementation StocksSyncWatchlistPersistence

- (StocksSyncWatchlistPersistence)init
{
  v12.receiver = self;
  v12.super_class = (Class)StocksSyncWatchlistPersistence;
  v2 = [(StocksSyncWatchlistPersistence *)&v12 init];
  if (v2)
  {
    v3 = +[NSFileManager defaultManager];
    v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.stocks"];

    v5 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) _initWithSuiteName:@"group.com.apple.stocks" container:v4];
    companionDefaults = v2->_companionDefaults;
    v2->_companionDefaults = v5;

    uint64_t v7 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v7;

    uint64_t v9 = objc_opt_new();
    keysToSynchronize = v2->_keysToSynchronize;
    v2->_keysToSynchronize = (NSMutableSet *)v9;
  }
  return v2;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  v5 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  id v6 = [v5 integerForKey:v4];

  return (int64_t)v6;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  [v7 setInteger:a3 forKey:v6];

  id v8 = [(StocksSyncWatchlistPersistence *)self keysToSynchronize];
  [v8 addObject:v6];
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  v5 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  id v6 = [v5 stringForKey:v4];

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  [v5 removeObjectForKey:v4];

  id v6 = [(StocksSyncWatchlistPersistence *)self keysToSynchronize];
  [v6 addObject:v4];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  [v8 setObject:v7 forKey:v6];

  id v9 = [(StocksSyncWatchlistPersistence *)self keysToSynchronize];
  [v9 addObject:v6];
}

- (void)synchronize
{
  v3 = [(StocksSyncWatchlistPersistence *)self companionDefaults];
  [v3 synchronize];

  id v4 = [(StocksSyncWatchlistPersistence *)self keysToSynchronize];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(StocksSyncWatchlistPersistence *)self syncManager];
    id v7 = [(StocksSyncWatchlistPersistence *)self keysToSynchronize];
    [v6 synchronizeUserDefaultsDomain:@"group.com.apple.stocks" keys:v7 container:@"com.apple.stocks.watchapp" appGroupContainer:@"group.com.apple.stocks"];

    id v8 = [(StocksSyncWatchlistPersistence *)self keysToSynchronize];
    [v8 removeAllObjects];
  }
}

- (NSUserDefaults)companionDefaults
{
  return self->_companionDefaults;
}

- (void)setCompanionDefaults:(id)a3
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

  objc_storeStrong((id *)&self->_companionDefaults, 0);
}

@end