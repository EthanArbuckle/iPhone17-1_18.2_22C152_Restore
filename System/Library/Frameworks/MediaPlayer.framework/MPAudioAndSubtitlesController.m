@interface MPAudioAndSubtitlesController
- (UIViewController)viewControllerForOrientation;
- (void)setViewControllerForOrientation:(id)a3;
@end

@implementation MPAudioAndSubtitlesController

- (void).cxx_destruct
{
}

- (void)setViewControllerForOrientation:(id)a3
{
}

- (UIViewController)viewControllerForOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForOrientation);

  return (UIViewController *)WeakRetained;
}

@end