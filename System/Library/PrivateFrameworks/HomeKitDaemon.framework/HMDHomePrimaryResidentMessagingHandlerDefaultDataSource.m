@interface HMDHomePrimaryResidentMessagingHandlerDefaultDataSource
- (HMDHomePrimaryResidentMessagingHandlerDefaultDataSource)init;
- (HMFTimerManager)timerManager;
- (NSNotificationCenter)notificationCenter;
@end

@implementation HMDHomePrimaryResidentMessagingHandlerDefaultDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (HMFTimerManager)timerManager
{
  return self->_timerManager;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDHomePrimaryResidentMessagingHandlerDefaultDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDHomePrimaryResidentMessagingHandlerDefaultDataSource;
  v2 = [(HMDHomePrimaryResidentMessagingHandlerDefaultDataSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F42660]) initWithOptions:0];
    timerManager = v2->_timerManager;
    v2->_timerManager = (HMFTimerManager *)v5;
  }
  return v2;
}

@end