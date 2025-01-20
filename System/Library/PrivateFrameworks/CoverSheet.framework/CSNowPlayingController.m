@interface CSNowPlayingController
- (CSMediaControlsViewController)controlsViewController;
- (CSNowPlayingController)init;
@end

@implementation CSNowPlayingController

- (CSNowPlayingController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSNowPlayingController;
  v2 = [(CSNowPlayingController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CSMediaControlsViewController);
    controlsViewController = v2->_controlsViewController;
    v2->_controlsViewController = v3;
  }
  return v2;
}

- (CSMediaControlsViewController)controlsViewController
{
  return self->_controlsViewController;
}

- (void).cxx_destruct
{
}

@end