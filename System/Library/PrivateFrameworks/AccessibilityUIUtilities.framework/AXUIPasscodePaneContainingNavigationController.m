@interface AXUIPasscodePaneContainingNavigationController
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation AXUIPasscodePaneContainingNavigationController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXUIPasscodePaneContainingNavigationController;
  [(AXUIPasscodePaneContainingNavigationController *)&v8 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  v5 = [(AXUIPasscodePaneContainingNavigationController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(AXUIPasscodePaneContainingNavigationController *)self delegate];
    -[AXUIPasscodePaneContainingNavigationController setInterfaceOrientation:](self, "setInterfaceOrientation:", [v7 navigationControllerPreferredInterfaceOrientationForPresentation:self]);
  }
  [(AXUIPasscodePaneContainingNavigationController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(AXUIPasscodePaneContainingNavigationController *)self delegate];
  uint64_t v4 = objc_msgSend(v3, "axui_activeInterfaceOrientationForNavigationController:", self);

  if ((unint64_t)(v4 - 2) > 2) {
    return 2;
  }
  else {
    return qword_1C3A2F598[v4 - 2];
  }
}

@end