@interface CALNFakeNotificationSource
+ (id)_activeSources;
+ (id)_activeSourcesQueue;
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNFakeNotificationSource)initWithNotificationManager:(id)a3 iconIdentifierProvider:(id)a4 sourceIdentifierSuffix:(id)a5;
- (CALNNotificationManager)notificationManager;
- (NSArray)categories;
- (NSString)sourceIdentifier;
- (id)contentForNotificationWithSourceClientIdentifier:(id)a3;
- (void)postFakeNotification;
@end

@implementation CALNFakeNotificationSource

- (CALNFakeNotificationSource)initWithNotificationManager:(id)a3 iconIdentifierProvider:(id)a4 sourceIdentifierSuffix:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CALNFakeNotificationSource;
  v12 = [(CALNFakeNotificationSource *)&v19 init];
  if (v12)
  {
    if (initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix__onceToken != -1) {
      dispatch_once(&initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix__onceToken, &__block_literal_global_20);
    }
    objc_storeStrong((id *)&v12->_notificationManager, a3);
    objc_storeStrong((id *)&v12->_iconIdentifierProvider, a4);
    uint64_t v13 = [NSString stringWithFormat:@"com.apple.calendar.notifications.FakeNotification.%@", v11];
    sourceIdentifier = v12->_sourceIdentifier;
    v12->_sourceIdentifier = (NSString *)v13;

    v15 = [(id)objc_opt_class() _activeSourcesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__CALNFakeNotificationSource_initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix___block_invoke_2;
    block[3] = &unk_2645C0D98;
    v18 = v12;
    dispatch_sync(v15, block);
  }
  return v12;
}

void __104__CALNFakeNotificationSource_initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix___block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)HandleDarwinNotification, @"com.apple.calendar.notifications.postFakeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __104__CALNFakeNotificationSource_initWithNotificationManager_iconIdentifierProvider_sourceIdentifierSuffix___block_invoke_2(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _activeSources];
  [v2 addObject:*(void *)(a1 + 32)];
}

+ (id)_activeSources
{
  if (_activeSources_onceToken != -1) {
    dispatch_once(&_activeSources_onceToken, &__block_literal_global_6_0);
  }
  id v2 = (void *)_activeSources_activeSources;
  return v2;
}

uint64_t __44__CALNFakeNotificationSource__activeSources__block_invoke()
{
  _activeSources_activeSources = [MEMORY[0x263F088B0] hashTableWithOptions:5];
  return MEMORY[0x270F9A758]();
}

+ (id)_activeSourcesQueue
{
  if (_activeSourcesQueue_onceToken != -1) {
    dispatch_once(&_activeSourcesQueue_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)_activeSourcesQueue_queue;
  return v2;
}

void __49__CALNFakeNotificationSource__activeSourcesQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.calendar.notifications.fakeNotificationSourceQ", v2);
  v1 = (void *)_activeSourcesQueue_queue;
  _activeSourcesQueue_queue = (uint64_t)v0;
}

- (void)postFakeNotification
{
  CalGenerateUUID();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(CALNFakeNotificationSource *)self contentForNotificationWithSourceClientIdentifier:v8];
  v4 = [CALNNotificationRecord alloc];
  v5 = [(CALNFakeNotificationSource *)self sourceIdentifier];
  v6 = [(CALNNotificationRecord *)v4 initWithSourceIdentifier:v5 sourceClientIdentifier:v8 content:v3];

  v7 = [(CALNFakeNotificationSource *)self notificationManager];
  [v7 addRecord:v6];
}

- (NSArray)categories
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CALNFakeNotificationSource_categories__block_invoke;
  block[3] = &unk_2645C0D98;
  void block[4] = self;
  if (categories_onceToken_5 != -1) {
    dispatch_once(&categories_onceToken_5, block);
  }
  return (NSArray *)(id)categories_categories_5;
}

void __40__CALNFakeNotificationSource_categories__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) sourceIdentifier];
  id v2 = +[CALNNotificationCategory categoryWithIdentifier:v1 actions:MEMORY[0x263EFFA68] hiddenPreviewsBodyPlaceholder:@"Discrete" options:0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  v4 = (void *)categories_categories_5;
  categories_categories_5 = v3;
}

- (id)contentForNotificationWithSourceClientIdentifier:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F30020] hasBeenUnlockedSinceBoot]) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"Private";
  }
  v6 = objc_opt_new();
  [v6 setTitle:@"Fake notification"];
  [v6 setBody:v5];
  v7 = [(CALNFakeNotificationSource *)self sourceIdentifier];
  [v6 setCategoryIdentifier:v7];

  id v8 = [MEMORY[0x263EFF910] date];
  id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v10 = [v8 dateByAddingDays:1 inCalendar:v9];
  [v6 setExpirationDate:v10];

  id v11 = [(CALNFakeNotificationSource *)self iconIdentifierProvider];
  v12 = [MEMORY[0x263EFF910] date];
  uint64_t v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  v14 = [v11 identifierForIconWithDate:v12 inCalendar:v13];
  [v6 setIconIdentifier:v14];

  v15 = (void *)[v6 copy];
  return v15;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (CALNNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider
{
  return self->_iconIdentifierProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end