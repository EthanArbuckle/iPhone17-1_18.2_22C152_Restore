@interface CKFullscreenBrowserNavigationController
- (BOOL)constrainToPresentingVCBounds;
- (BOOL)forceWindowedPresentation;
- (BOOL)preserveModalPresentationStyle;
- (BOOL)wantsWindowedPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)setPreserveModalPresentationStyle:(BOOL)a3;
- (void)setWantsWindowedPresentation:(BOOL)a3;
@end

@implementation CKFullscreenBrowserNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(CKFullscreenBrowserNavigationController *)self childViewControllers];
  v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = (id)[v4 supportedInterfaceOrientations];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKFullscreenBrowserNavigationController;
    id v5 = [(CKFullscreenBrowserNavigationController *)&v8 supportedInterfaceOrientations];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)CKFullscreenBrowserNavigationController;
  [(CKFullscreenBrowserNavigationController *)&v4 loadView];
  v3 = [(CKFullscreenBrowserNavigationController *)self view];
  [v3 setBackgroundColor:0];
}

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 0;
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 1;
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 0;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

@end