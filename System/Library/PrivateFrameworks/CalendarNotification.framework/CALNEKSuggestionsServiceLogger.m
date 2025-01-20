@interface CALNEKSuggestionsServiceLogger
+ (CALNEKSuggestionsServiceLogger)sharedInstance;
- (void)logEventShowedTimeToLeaveNotificationWithUniqueKey:(id)a3;
@end

@implementation CALNEKSuggestionsServiceLogger

+ (CALNEKSuggestionsServiceLogger)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CALNEKSuggestionsServiceLogger_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_7;
  return (CALNEKSuggestionsServiceLogger *)v2;
}

uint64_t __48__CALNEKSuggestionsServiceLogger_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_7 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)logEventShowedTimeToLeaveNotificationWithUniqueKey:(id)a3
{
}

@end