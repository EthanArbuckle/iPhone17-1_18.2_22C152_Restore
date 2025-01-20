@interface _BRKSignificantTimeChangeNotifier
+ (id)sharedInstance;
- (_BRKSignificantTimeChangeNotifier)init;
- (void)_notify:(id)a3;
- (void)dealloc;
- (void)triggerNotification;
@end

@implementation _BRKSignificantTimeChangeNotifier

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_91 != -1) {
    dispatch_once(&sharedInstance_onceToken_91, &__block_literal_global_93);
  }
  v2 = (void *)sharedInstance_Notifier;
  return v2;
}

- (_BRKSignificantTimeChangeNotifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BRKSignificantTimeChangeNotifier;
  v2 = [(_BRKSignificantTimeChangeNotifier *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_triggerNotification name:*MEMORY[0x263EFF3C8] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_triggerNotification name:*MEMORY[0x263EFF5C8] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_triggerNotification name:*MEMORY[0x263EFF5D0] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_significantTimeChangeForScheduler, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  v5.receiver = self;
  v5.super_class = (Class)_BRKSignificantTimeChangeNotifier;
  [(_BRKSignificantTimeChangeNotifier *)&v5 dealloc];
}

- (void)triggerNotification
{
}

- (void)_notify:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"_BRKSignificantTimeChangeNotification" object:0];
}

@end