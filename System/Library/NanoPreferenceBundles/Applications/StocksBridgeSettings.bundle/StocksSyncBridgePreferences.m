@interface StocksSyncBridgePreferences
+ (NSString)defaultStockOptionBiggestMover;
+ (NSString)defaultStockOptionLastViewed;
+ (NSString)defaultStockOptionStaticStock;
- (BOOL)hasComplicationDisplayModeBeenSet;
- (NSString)defaultStockSymbol;
- (StocksSyncBridgePreferences)initWithPersistence:(id)a3 delegate:(id)a4;
- (unint64_t)complicationDisplayMode;
- (void)_notifyDelegateOfUpdate;
- (void)dealloc;
- (void)setComplicationDisplayMode:(unint64_t)a3;
- (void)setDefaultStockSymbol:(id)a3;
@end

@implementation StocksSyncBridgePreferences

+ (NSString)defaultStockOptionLastViewed
{
  return (NSString *)@"lastViewed";
}

+ (NSString)defaultStockOptionBiggestMover
{
  return (NSString *)@"biggestMover";
}

+ (NSString)defaultStockOptionStaticStock
{
  return (NSString *)@"stock";
}

- (StocksSyncBridgePreferences)initWithPersistence:(id)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)StocksSyncBridgePreferences;
  v4 = [(StocksSyncPreferences *)&v8 initWithPersistence:a3 delegate:a4];
  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_346C, @"com.apple.stocks.watchapp.bridge-preferences-updated", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)sub_346C, kNPSInitialSyncCompletionDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)StocksSyncBridgePreferences;
  [(StocksSyncBridgePreferences *)&v4 dealloc];
}

- (void)_notifyDelegateOfUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(StocksSyncPreferences *)self delegate];
  [v3 preferencesUpdated:self];
}

- (unint64_t)complicationDisplayMode
{
  id v3 = [(StocksSyncPreferences *)self persistence];
  [v3 synchronize];

  objc_super v4 = [(StocksSyncPreferences *)self persistence];
  id v5 = [v4 integerForKey:@"DefaultComplication"];

  if ((unint64_t)v5 <= 3) {
    return (unint64_t)v5;
  }
  else {
    return 0;
  }
}

- (void)setComplicationDisplayMode:(unint64_t)a3
{
  id v5 = [(StocksSyncPreferences *)self persistence];
  [v5 setInteger:a3 forKey:@"DefaultComplication"];

  id v6 = [(StocksSyncPreferences *)self persistence];
  [v6 synchronize];
}

- (NSString)defaultStockSymbol
{
  id v3 = [(StocksSyncPreferences *)self persistence];
  [v3 synchronize];

  objc_super v4 = [(StocksSyncPreferences *)self persistence];
  id v5 = [v4 stringForKey:@"DefaultStock"];

  return (NSString *)v5;
}

- (void)setDefaultStockSymbol:(id)a3
{
  id v4 = a3;
  id v5 = [(StocksSyncPreferences *)self persistence];
  [v5 setObject:v4 forKey:@"DefaultStock"];

  id v6 = [(StocksSyncPreferences *)self persistence];
  [v6 synchronize];
}

- (BOOL)hasComplicationDisplayModeBeenSet
{
  id v3 = [(StocksSyncPreferences *)self persistence];
  [v3 synchronize];

  id v4 = [(StocksSyncPreferences *)self persistence];
  id v5 = [v4 objectForKey:@"DefaultComplication"];
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

@end