@interface MUPlacePhotoSectionControllerConfiguration
- (BOOL)showLookAround;
- (BOOL)supportsARPCallToAction;
- (UIViewController)presentingViewController;
- (void)setPresentingViewController:(id)a3;
- (void)setShowLookAround:(BOOL)a3;
- (void)setSupportsARPCallToAction:(BOOL)a3;
@end

@implementation MUPlacePhotoSectionControllerConfiguration

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BOOL)supportsARPCallToAction
{
  return self->_supportsARPCallToAction;
}

- (void)setSupportsARPCallToAction:(BOOL)a3
{
  self->_supportsARPCallToAction = a3;
}

- (BOOL)showLookAround
{
  return self->_showLookAround;
}

- (void)setShowLookAround:(BOOL)a3
{
  self->_showLookAround = a3;
}

- (void).cxx_destruct
{
}

@end