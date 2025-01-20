@interface HUTipsManager
+ (id)sharedManager;
- (void)donateAppLaunchEvent;
- (void)warmUp;
@end

@implementation HUTipsManager

- (void)donateAppLaunchEvent
{
  id v2 = +[HUTipsManager_Swift sharedManager];
  [v2 donateAppLaunchEvent];
}

- (void)warmUp
{
  id v2 = +[HUTipsManager_Swift sharedManager];
  [v2 warmUp];
}

+ (id)sharedManager
{
  if (qword_1EBA47918 != -1) {
    dispatch_once(&qword_1EBA47918, &__block_literal_global_192);
  }
  id v2 = (void *)_MergedGlobals_632;

  return v2;
}

void __30__HUTipsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HUTipsManager);
  v1 = (void *)_MergedGlobals_632;
  _MergedGlobals_632 = (uint64_t)v0;
}

@end