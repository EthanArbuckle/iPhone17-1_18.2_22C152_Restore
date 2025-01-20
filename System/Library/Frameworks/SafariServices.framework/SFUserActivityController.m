@interface SFUserActivityController
@end

@implementation SFUserActivityController

void __53___SFUserActivityController_sharedActivityController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[_SFUserActivityController sharedActivityController]::sharedController;
  +[_SFUserActivityController sharedActivityController]::sharedController = (uint64_t)v1;
}

@end