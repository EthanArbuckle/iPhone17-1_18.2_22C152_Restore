@interface DOCICloudQuotaInAppMessaging
+ (DOCICloudQuotaInAppMessaging)shared;
+ (NSString)currentInAppMessageChangedNotification;
- (DOCICloudQuotaInAppMessaging)init;
- (ICQInAppMessaging)messaging;
- (id)fetchMessageFromNotification:(id)a3;
- (void)startObservingUpdates;
- (void)stopObservingUpdates;
@end

@implementation DOCICloudQuotaInAppMessaging

+ (DOCICloudQuotaInAppMessaging)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)shared_shared;
  return (DOCICloudQuotaInAppMessaging *)v2;
}

uint64_t __38__DOCICloudQuotaInAppMessaging_shared__block_invoke()
{
  shared_shared = objc_alloc_init(DOCICloudQuotaInAppMessaging);
  return MEMORY[0x270F9A758]();
}

+ (NSString)currentInAppMessageChangedNotification
{
  return (NSString *)(id)*MEMORY[0x263F889F8];
}

- (DOCICloudQuotaInAppMessaging)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCICloudQuotaInAppMessaging;
  v2 = [(DOCICloudQuotaInAppMessaging *)&v6 init];
  uint64_t v3 = [MEMORY[0x263F88A20] shared];
  messaging = v2->_messaging;
  v2->_messaging = (ICQInAppMessaging *)v3;

  return v2;
}

- (void)startObservingUpdates
{
  id v2 = [(DOCICloudQuotaInAppMessaging *)self messaging];
  [v2 observeUpdates];
}

- (void)stopObservingUpdates
{
  id v2 = [(DOCICloudQuotaInAppMessaging *)self messaging];
  [v2 stopObservingUpdates];
}

- (id)fetchMessageFromNotification:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F88A00]];

  if (v4) {
    v5 = [[DOCICloudQuotaInAppMessage alloc] initWithICQInAppMessage:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (ICQInAppMessaging)messaging
{
  return self->_messaging;
}

- (void).cxx_destruct
{
}

@end