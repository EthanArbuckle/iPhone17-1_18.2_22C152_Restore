@interface GKWelcomeBannerVisibility
+ (id)shared;
- (BOOL)isShowingRemoteUI;
- (void)setIsShowingRemoteUI:(BOOL)a3;
@end

@implementation GKWelcomeBannerVisibility

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)shared_sharedInstance;
  return v2;
}

uint64_t __35__GKWelcomeBannerVisibility_shared__block_invoke()
{
  shared_sharedInstance = objc_alloc_init(GKWelcomeBannerVisibility);
  return MEMORY[0x270F9A758]();
}

- (BOOL)isShowingRemoteUI
{
  return self->_isShowingRemoteUI;
}

- (void)setIsShowingRemoteUI:(BOOL)a3
{
  self->_isShowingRemoteUI = a3;
}

@end