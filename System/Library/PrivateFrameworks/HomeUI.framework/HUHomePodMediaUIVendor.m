@interface HUHomePodMediaUIVendor
+ (id)sharedInstance;
- (MRUNowPlayingViewController)nowPlayingViewController;
- (void)setNowPlayingViewController:(id)a3;
@end

@implementation HUHomePodMediaUIVendor

+ (id)sharedInstance
{
  if (qword_1EBA47808 != -1) {
    dispatch_once(&qword_1EBA47808, &__block_literal_global_88);
  }
  v2 = (void *)_MergedGlobals_620;

  return v2;
}

void __40__HUHomePodMediaUIVendor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HUHomePodMediaUIVendor);
  v1 = (void *)_MergedGlobals_620;
  _MergedGlobals_620 = (uint64_t)v0;
}

- (MRUNowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end