@interface StocksSyncAppPreferences
- (BOOL)hasWatchlistBeenSet;
- (NSArray)stocklist;
- (NSArray)watchlist;
- (StocksSyncAppPreferences)initWithPersistence:(id)a3 delegate:(id)a4;
- (id)_stockDictionaries;
- (void)_notifyDelegateOfUpdate;
- (void)dealloc;
- (void)setWatchlist:(id)a3;
- (void)updateStockData:(id)a3;
@end

@implementation StocksSyncAppPreferences

- (StocksSyncAppPreferences)initWithPersistence:(id)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)StocksSyncAppPreferences;
  v4 = [(StocksSyncPreferences *)&v8 initWithPersistence:a3 delegate:a4];
  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_4000, @"com.apple.stocks.PreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDrop);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)sub_4000, kNPSInitialSyncCompletionDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)StocksSyncAppPreferences;
  [(StocksSyncAppPreferences *)&v4 dealloc];
}

- (void)updateStockData:(id)a3
{
  id v4 = a3;
  v5 = [(StocksSyncAppPreferences *)self _stockDictionaries];
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = +[StocksSyncPreferenceKeys symbol];
        v13 = [v11 objectForKeyedSubscript:v12];

        if (v13)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_4368;
          v24[3] = &unk_8478;
          id v25 = v13;
          v14 = objc_retainBlock(v24);
          id v15 = [v4 indexOfObjectPassingTest:v14];
          if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            [v6 addObject:v11];
          }
          else
          {
            v16 = [v4 objectAtIndexedSubscript:v15];
            v17 = [v16 dictionaryRepresentation];
            [v6 addObject:v17];
          }
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  if (([obj isEqualToArray:v6] & 1) == 0)
  {
    v18 = [(StocksSyncPreferences *)self persistence];
    [v18 setObject:v6 forKey:@"watch_stocks"];

    v19 = [(StocksSyncPreferences *)self persistence];
    v20 = +[NSDate date];
    [v20 timeIntervalSince1970];
    v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 setObject:v21 forKey:@"watch_lastModified"];

    v22 = [(StocksSyncPreferences *)self persistence];
    [v22 synchronize];
  }
}

- (void)_notifyDelegateOfUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(StocksSyncPreferences *)self delegate];
  [v3 preferencesUpdated:self];
}

- (id)_stockDictionaries
{
  v2 = [(StocksSyncPreferences *)self persistence];
  id v3 = [v2 objectForKey:@"watch_stocks"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (BOOL)hasWatchlistBeenSet
{
  id v3 = [(StocksSyncPreferences *)self persistence];
  [v3 synchronize];

  id v4 = [(StocksSyncPreferences *)self persistence];
  v5 = [v4 objectForKey:@"watch_stocks"];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (NSArray)watchlist
{
  id v3 = [(StocksSyncPreferences *)self persistence];
  [v3 synchronize];

  id v4 = [(StocksSyncAppPreferences *)self _stockDictionaries];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = +[StocksSyncPreferenceKeys symbol];
          v13 = [v11 objectForKeyedSubscript:v12];

          if (v13) {
            [v5 addObject:v13];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return (NSArray *)v14;
}

- (void)setWatchlist:(id)a3
{
  id v4 = a3;
  v21 = self;
  id v5 = [(StocksSyncAppPreferences *)self _stockDictionaries];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v10);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_49A4;
        v23[3] = &unk_84A0;
        v23[4] = v11;
        v12 = objc_retainBlock(v23);
        id v13 = [v5 indexOfObjectPassingTest:v12];
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v14 = +[StocksSyncPreferenceKeys symbol];
          long long v28 = v14;
          uint64_t v29 = v11;
          id v15 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        }
        else
        {
          id v15 = [v5 objectAtIndexedSubscript:v13];
        }
        [v6 addObject:v15];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  long long v16 = [(StocksSyncPreferences *)v21 persistence];
  [v16 setObject:v6 forKey:@"watch_stocks"];

  long long v17 = [(StocksSyncPreferences *)v21 persistence];
  long long v18 = +[NSDate date];
  [v18 timeIntervalSince1970];
  long long v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v17 setObject:v19 forKey:@"watch_lastModified"];

  v20 = [(StocksSyncPreferences *)v21 persistence];
  [v20 synchronize];
}

- (NSArray)stocklist
{
  id v3 = [(StocksSyncPreferences *)self persistence];
  [v3 synchronize];

  id v4 = [(StocksSyncAppPreferences *)self _stockDictionaries];
  id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = +[StocksSyncPreferenceKeys symbol];
          uint64_t v11 = [v9 objectForKeyedSubscript:v10];

          if (v11)
          {
            v12 = +[StocksSyncPreferenceKeys companyName];
            id v13 = [v9 objectForKeyedSubscript:v12];

            +[StocksSyncPreferenceKeys listName];
            id v15 = v14 = v7;
            long long v16 = [v9 objectForKeyedSubscript:v15];

            long long v17 = +[StocksSyncPreferenceKeys compactListName];
            long long v18 = [v9 objectForKeyedSubscript:v17];

            long long v19 = +[StocksSyncPreferenceKeys type];
            v20 = [v9 objectForKeyedSubscript:v19];

            v21 = [[StocksSyncStock alloc] initWithSymbol:v11 companyName:v13 listName:v16 compactListName:v18 type:v20];
            [v24 addObject:v21];

            uint64_t v7 = v14;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  id v22 = [v24 copy];

  return (NSArray *)v22;
}

@end