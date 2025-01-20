@interface GAXOverlayUserInterfaceViewController
- (BOOL)_hasOverlayUserInterface;
- (BOOL)hasOverlayUserInterface;
- (BOOL)isModalContentBeingPresentedInOverlayUserInterfaceView:(id)a3;
- (GAXOverlayUserInterfaceViewControllerDelegate)delegate;
- (void)_checkPresenceOfOverlayUserInterface;
- (void)loadView;
- (void)releaseOutlets;
- (void)setDelegate:(id)a3;
- (void)setHasOverlayUserInterface:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willPresentModalViewController;
@end

@implementation GAXOverlayUserInterfaceViewController

- (void)willPresentModalViewController
{
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [v3 setAutoresizingMask:18];
  [v3 setDelegate:self];
  [(GAXViewController *)self setView:v3];
}

- (void)releaseOutlets
{
  v4.receiver = self;
  v4.super_class = (Class)GAXOverlayUserInterfaceViewController;
  [(GAXViewController *)&v4 releaseOutlets];
  if ([(GAXOverlayUserInterfaceViewController *)self isViewLoaded])
  {
    id v3 = [(GAXOverlayUserInterfaceViewController *)self view];
    [v3 setDelegate:0];
  }
}

- (BOOL)_hasOverlayUserInterface
{
  id v3 = [(GAXOverlayUserInterfaceViewController *)self view];
  objc_super v4 = [v3 subviews];
  if ([v4 count])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(GAXOverlayUserInterfaceViewController *)self presentedViewController];
    char v5 = v6 != 0;
  }
  return v5;
}

- (void)_checkPresenceOfOverlayUserInterface
{
  unsigned int v3 = [(GAXOverlayUserInterfaceViewController *)self hasOverlayUserInterface];
  BOOL v4 = [(GAXOverlayUserInterfaceViewController *)self _hasOverlayUserInterface];
  [(GAXOverlayUserInterfaceViewController *)self setHasOverlayUserInterface:v4];
  if (!v4)
  {
    if (v3) {
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GAXOverlayUserInterfaceViewController;
  [(GAXOverlayUserInterfaceViewController *)&v3 viewWillLayoutSubviews];
  [(GAXOverlayUserInterfaceViewController *)self _checkPresenceOfOverlayUserInterface];
}

- (BOOL)isModalContentBeingPresentedInOverlayUserInterfaceView:(id)a3
{
  objc_super v3 = [(GAXOverlayUserInterfaceViewController *)self presentedViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (GAXOverlayUserInterfaceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXOverlayUserInterfaceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasOverlayUserInterface
{
  return self->_hasOverlayUserInterface;
}

- (void)setHasOverlayUserInterface:(BOOL)a3
{
  self->_hasOverlayUserInterface = a3;
}

- (void).cxx_destruct
{
}

@end