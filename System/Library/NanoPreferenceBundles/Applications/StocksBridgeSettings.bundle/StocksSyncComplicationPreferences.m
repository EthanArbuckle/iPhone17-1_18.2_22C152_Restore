@interface StocksSyncComplicationPreferences
+ (StocksSyncComplicationPreferences)sharedPreferences;
- (NSArray)stocks;
- (NSBundle)bundle;
- (NSHashTable)observers;
- (NSString)defaultStockSymbol;
- (StocksSyncAppPreferences)appPreferences;
- (StocksSyncBridgePreferences)bridgePreferences;
- (id)complicationDisplayModeDescription:(unint64_t)a3;
- (id)initPrivate;
- (unint64_t)complicationDisplayMode;
- (void)_notifyObservers;
- (void)addPreferencesObserver:(id)a3;
- (void)preferencesUpdated:(id)a3;
- (void)removePreferencesObserver:(id)a3;
- (void)setAppPreferences:(id)a3;
- (void)setBridgePreferences:(id)a3;
- (void)setComplicationDisplayMode:(unint64_t)a3;
- (void)setDefaultStockSymbol:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation StocksSyncComplicationPreferences

+ (StocksSyncComplicationPreferences)sharedPreferences
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C10;
  block[3] = &unk_8308;
  block[4] = a1;
  if (qword_D938 != -1) {
    dispatch_once(&qword_D938, block);
  }
  v2 = (void *)qword_D930;

  return (StocksSyncComplicationPreferences *)v2;
}

- (id)initPrivate
{
  v13.receiver = self;
  v13.super_class = (Class)StocksSyncComplicationPreferences;
  v2 = [(StocksSyncComplicationPreferences *)&v13 init];
  if (v2)
  {
    v3 = [StocksSyncAppPreferences alloc];
    v4 = objc_opt_new();
    v5 = [(StocksSyncAppPreferences *)v3 initWithPersistence:v4 delegate:v2];
    appPreferences = v2->_appPreferences;
    v2->_appPreferences = v5;

    v7 = objc_opt_new();
    v8 = [[StocksSyncBridgePreferences alloc] initWithPersistence:v7 delegate:v2];
    bridgePreferences = v2->_bridgePreferences;
    v2->_bridgePreferences = v8;

    uint64_t v10 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;
  }
  return v2;
}

- (void)addPreferencesObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [(StocksSyncComplicationPreferences *)self observers];
  [v5 addObject:v4];
}

- (void)removePreferencesObserver:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v5 = [(StocksSyncComplicationPreferences *)self observers];
  [v5 removeObject:v4];
}

- (id)complicationDisplayModeDescription:(unint64_t)a3
{
  id v4 = +[StocksSyncComplicationPreferences sharedPreferences];
  id v5 = [v4 bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"METRIC_OPTIONS_CURRENT_PRICE" value:&stru_8580 table:@"MetricSettings"];

  v7 = +[StocksSyncComplicationPreferences sharedPreferences];
  v8 = [v7 bundle];
  uint64_t v9 = [v8 localizedStringForKey:@"METRIC_OPTIONS_POINTS_CHANGE" value:&stru_8580 table:@"MetricSettings"];

  uint64_t v10 = +[StocksSyncComplicationPreferences sharedPreferences];
  v11 = [v10 bundle];
  uint64_t v12 = [v11 localizedStringForKey:@"METRIC_OPTIONS_PERCENTAGE_CHANGE" value:&stru_8580 table:@"MetricSettings"];

  objc_super v13 = +[StocksSyncComplicationPreferences sharedPreferences];
  v14 = [v13 bundle];
  uint64_t v15 = [v14 localizedStringForKey:@"METRIC_OPTIONS_MARKET_CAP" value:&stru_8580 table:@"MetricSettings"];

  v19[0] = v6;
  v19[1] = v9;
  v19[2] = v12;
  v19[3] = v15;
  id v16 = (id)v19[a3];
  for (uint64_t i = 3; i != -1; --i)

  return v16;
}

- (void)_notifyObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = [(StocksSyncComplicationPreferences *)self observers];
  v3 = [v4 allObjects];
  [v3 makeObjectsPerformSelector:"preferencesObservedUpdate:" withObject:self];
}

- (void)preferencesUpdated:(id)a3
{
}

- (NSBundle)bundle
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_20E8;
  block[3] = &unk_8330;
  block[4] = self;
  if (qword_D948 != -1) {
    dispatch_once(&qword_D948, block);
  }
  return (NSBundle *)(id)qword_D940;
}

- (unint64_t)complicationDisplayMode
{
  v2 = [(StocksSyncComplicationPreferences *)self bridgePreferences];
  id v3 = [v2 complicationDisplayMode];

  return (unint64_t)v3;
}

- (void)setComplicationDisplayMode:(unint64_t)a3
{
  id v5 = [(StocksSyncComplicationPreferences *)self bridgePreferences];
  [v5 setComplicationDisplayMode:a3];

  [(StocksSyncComplicationPreferences *)self _notifyObservers];
}

- (NSString)defaultStockSymbol
{
  v2 = [(StocksSyncComplicationPreferences *)self bridgePreferences];
  id v3 = [v2 defaultStockSymbol];

  return (NSString *)v3;
}

- (void)setDefaultStockSymbol:(id)a3
{
  id v4 = a3;
  id v5 = [(StocksSyncComplicationPreferences *)self bridgePreferences];
  [v5 setDefaultStockSymbol:v4];

  [(StocksSyncComplicationPreferences *)self _notifyObservers];
}

- (NSArray)stocks
{
  v2 = [(StocksSyncComplicationPreferences *)self appPreferences];
  id v3 = [v2 stocklist];

  return (NSArray *)v3;
}

- (StocksSyncAppPreferences)appPreferences
{
  return self->_appPreferences;
}

- (void)setAppPreferences:(id)a3
{
}

- (StocksSyncBridgePreferences)bridgePreferences
{
  return self->_bridgePreferences;
}

- (void)setBridgePreferences:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bridgePreferences, 0);

  objc_storeStrong((id *)&self->_appPreferences, 0);
}

@end