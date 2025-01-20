@interface _SFPopoverPresentationDelegate
+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToReloadButtonInNavigationBar:(id)a4;
+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToURLOutlineInNavigationBar:(id)a4;
+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToURLOutlineInNavigationBar:(id)a4 usesAdaptivePresentationInCompact:(BOOL)a5;
- (BOOL)nestsAdaptiveSheetPresentationInNavigationController;
- (BOOL)popoverUsesAdaptivePresentationInCompact;
- (_SFPopoverPresentationDelegate)initWithSourceInfo:(id)a3;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)attachToPopoverPresentationController:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setNestsAdaptiveSheetPresentationInNavigationController:(BOOL)a3;
- (void)setPopoverUsesAdaptivePresentationInCompact:(BOOL)a3;
- (void)updatePopoverPosition;
@end

@implementation _SFPopoverPresentationDelegate

- (_SFPopoverPresentationDelegate)initWithSourceInfo:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPopoverPresentationDelegate;
  v6 = [(_SFPopoverPresentationDelegate *)&v10 init];
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_nestsAdaptiveSheetPresentationInNavigationController = 257;
    objc_storeStrong((id *)&v6->_sourceInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)attachToPopoverPresentationController:(id)a3
{
  if (a3)
  {
    p_popoverPresentationController = &self->_popoverPresentationController;
    id object = a3;
    objc_storeWeak((id *)p_popoverPresentationController, object);
    [object setDelegate:self];
    [object setPassthroughViews:0];
    [object setPermittedArrowDirections:3];
    [object _setIgnoreBarButtonItemSiblings:1];
    [(_SFPopoverPresentationDelegate *)self updatePopoverPosition];
    objc_setAssociatedObject(object, &popoverPresentationDelegateKey, self, (void *)1);
  }
}

- (void)updatePopoverPosition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverPresentationController);
  v3 = NSString;
  v4 = [WeakRetained presentedViewController];
  id v5 = [v3 stringWithFormat:@"popover presentation delegate (%@)", v4];
  v6 = [WeakRetained presentingViewController];
  v7 = [v6 view];
  v8 = [v7 window];
  v9 = [v8 windowScene];
  objc_super v10 = _SFContextInfoWithComment();

  id v12 = WeakRetained;
  id v11 = v12;
  _SFPopoverSourceInfoUnwrap();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_popoverUsesAdaptivePresentationInCompact && [v7 horizontalSizeClass] == 1) {
    int64_t v9 = 2;
  }
  else {
    int64_t v9 = -1;
  }

  return v9;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  if (self->_nestsAdaptiveSheetPresentationInNavigationController)
  {
    id v5 = [a3 presentedViewController];
    if (a4 != 2
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = v5;
    }
    else
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v5 = a3;
  id v6 = NSString;
  id v7 = [v5 presentedViewController];
  v8 = [v6 stringWithFormat:@"popover presentation delegate (%@)", v7];
  int64_t v9 = [v5 presentingViewController];
  objc_super v10 = [v9 view];
  id v11 = [v10 window];
  id v12 = [v11 windowScene];
  v13 = _SFContextInfoWithComment();

  v15 = v5;
  id v14 = v5;
  _SFPopoverSourceInfoUnwrap();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id object = objc_loadWeakRetained((id *)&self->_popoverPresentationController);
  [object setDelegate:0];
  objc_setAssociatedObject(object, &popoverPresentationDelegateKey, 0, (void *)1);
}

+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToReloadButtonInNavigationBar:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [_SFPopoverPresentationDelegate alloc];
  v8 = [v5 reloadButtonPopoverSourceInfo];

  int64_t v9 = [(_SFPopoverPresentationDelegate *)v7 initWithSourceInfo:v8];
  [(_SFPopoverPresentationDelegate *)v9 attachToPopoverPresentationController:v6];
}

+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToURLOutlineInNavigationBar:(id)a4
{
}

+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToURLOutlineInNavigationBar:(id)a4 usesAdaptivePresentationInCompact:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  int64_t v9 = [_SFPopoverPresentationDelegate alloc];
  objc_super v10 = [v7 URLOutlinePopoverSourceInfo];

  id v11 = [(_SFPopoverPresentationDelegate *)v9 initWithSourceInfo:v10];
  [(_SFPopoverPresentationDelegate *)v11 setPopoverUsesAdaptivePresentationInCompact:v5];
  [(_SFPopoverPresentationDelegate *)v11 attachToPopoverPresentationController:v8];
}

- (BOOL)nestsAdaptiveSheetPresentationInNavigationController
{
  return self->_nestsAdaptiveSheetPresentationInNavigationController;
}

- (void)setNestsAdaptiveSheetPresentationInNavigationController:(BOOL)a3
{
  self->_nestsAdaptiveSheetPresentationInNavigationController = a3;
}

- (BOOL)popoverUsesAdaptivePresentationInCompact
{
  return self->_popoverUsesAdaptivePresentationInCompact;
}

- (void)setPopoverUsesAdaptivePresentationInCompact:(BOOL)a3
{
  self->_popoverUsesAdaptivePresentationInCompact = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popoverPresentationController);

  objc_storeStrong((id *)&self->_sourceInfo, 0);
}

@end