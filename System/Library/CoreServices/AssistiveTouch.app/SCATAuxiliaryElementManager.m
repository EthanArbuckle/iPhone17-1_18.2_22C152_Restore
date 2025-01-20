@interface SCATAuxiliaryElementManager
- (BOOL)containsElement:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isViewControllerLoaded;
- (BOOL)isVisibilityTiedToFocus;
- (BOOL)providesElements;
- (SCATAuxiliaryElementManagerViewController)viewController;
- (SCATElement)contextElement;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (int64_t)numberOfElements;
- (int64_t)role;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)setContextElement:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setRole:(int64_t)a3;
- (void)setViewController:(id)a3;
- (void)willBecomeCurrentAuxiliaryElementManager;
- (void)willResignCurrentAuxiliaryElementManager;
@end

@implementation SCATAuxiliaryElementManager

- (BOOL)isViewControllerLoaded
{
  return self->_viewController != 0;
}

- (BOOL)isVisibilityTiedToFocus
{
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_enabled == a3) {
    return;
  }
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->_enabled = a3;
  id v15 = [(SCATAuxiliaryElementManager *)self viewController];
  v7 = [v15 view];
  v8 = v7;
  if (v5)
  {
    unsigned int v9 = [(SCATAuxiliaryElementManager *)self isVisibilityTiedToFocus];
    double v10 = 1.0;
    if (v9) {
      double v10 = 0.0;
    }
    [v8 setAlpha:v10];
    v11 = [v8 window];

    if (!v11)
    {
      v13 = +[SCATScannerManager sharedManager];
      v14 = [v13 scatUIContext];

      [v14 bounds];
      objc_msgSend(v8, "setFrame:");
      [v15 viewWillAppear:v4];
      [v14 addSubview:v8];
      [v8 setHidden:0];
      [v15 viewDidAppear:v4];

      goto LABEL_10;
    }
    v7 = v8;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  [v7 setHidden:v12];
LABEL_10:
}

- (void)setContextElement:(id)a3
{
  objc_storeStrong((id *)&self->_contextElement, a3);
  id v5 = a3;
  id v6 = [(SCATAuxiliaryElementManager *)self viewController];
  [v6 updateWithContextElement:v5];
}

- (void)willBecomeCurrentAuxiliaryElementManager
{
  if ([(SCATAuxiliaryElementManager *)self isVisibilityTiedToFocus])
  {
    v3 = [(SCATAuxiliaryElementManager *)self viewController];
    [v3 setTransitioningToOrFromActive:1];

    BOOL v4 = [(SCATAuxiliaryElementManager *)self viewController];
    id v5 = [v4 view];

    id v6 = [v5 superview];
    [v6 bringSubviewToFront:v5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001065C;
    v12[3] = &unk_1001AAA90;
    id v7 = v5;
    id v13 = v7;
    +[UIView animateWithDuration:4 delay:v12 options:0 animations:0.3 completion:0.0];
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010668;
    v10[3] = &unk_1001AAA90;
    id v11 = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010674;
    v9[3] = &unk_1001AACE0;
    id v8 = v7;
    +[UIView animateWithDuration:4 delay:v10 options:v9 animations:0.3 completion:0.0];
  }
}

- (void)willResignCurrentAuxiliaryElementManager
{
  if ([(SCATAuxiliaryElementManager *)self isVisibilityTiedToFocus])
  {
    v3 = [(SCATAuxiliaryElementManager *)self viewController];
    [v3 setTransitioningToOrFromActive:1];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000107BC;
    v5[3] = &unk_1001AAA90;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10001081C;
    v4[3] = &unk_1001AACE0;
    v4[4] = self;
    +[UIView animateWithDuration:4 delay:v5 options:v4 animations:0.3 completion:0.0];
  }
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v5 = a4;
  id v7 = [(SCATAuxiliaryElementManager *)self viewController];
  id v6 = [v5 element];

  [v7 updateCustomFocusingViewStateForViewsWithElement:v6];
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  return 0;
}

- (id)lastElementWithOptions:(int *)a3
{
  return 0;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return 0;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return 0;
}

- (BOOL)containsElement:(id)a3
{
  return 0;
}

- (int64_t)numberOfElements
{
  return 0;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (SCATAuxiliaryElementManagerViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (SCATElement)contextElement
{
  return self->_contextElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextElement, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end