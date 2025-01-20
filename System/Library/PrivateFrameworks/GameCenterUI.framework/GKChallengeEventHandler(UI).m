@interface GKChallengeEventHandler(UI)
+ (uint64_t)uiDelegateClass;
@end

@implementation GKChallengeEventHandler(UI)

+ (uint64_t)uiDelegateClass
{
  return objc_opt_class();
}

@end