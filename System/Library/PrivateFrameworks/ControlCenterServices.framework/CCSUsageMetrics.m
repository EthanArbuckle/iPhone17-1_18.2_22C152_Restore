@interface CCSUsageMetrics
+ (id)sharedInstance;
- (unint64_t)userInvocationCount;
- (void)incrementUserInvocationCount;
@end

@implementation CCSUsageMetrics

- (unint64_t)userInvocationCount
{
  v2 = +[CCSControlCenterDefaults standardDefaults];
  unint64_t v3 = [v2 userInvocationCount];

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CCSUsageMetrics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

uint64_t __33__CCSUsageMetrics_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)incrementUserInvocationCount
{
  id v2 = +[CCSControlCenterDefaults standardDefaults];
  if ([v2 presentationGesture] == 1) {
    objc_msgSend(v2, "setUserInvocationCount:", objc_msgSend(v2, "userInvocationCount") + 1);
  }
}

@end