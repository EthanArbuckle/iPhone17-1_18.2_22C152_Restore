@interface STRestrictionsPINNavigationController
+ (BOOL)st_isPad;
+ (BOOL)st_shouldAnimate;
- (BOOL)prefersStatusBarHidden;
- (BOOL)prefersStatusBarHiddenOverride;
- (CGRect)lastKnownSuperviewFrame;
- (unint64_t)internalSupportedOrientations;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustToSuperviewFrame;
- (void)_freezeSupportedOrientations;
- (void)setInternalSupportedOrientations:(unint64_t)a3;
- (void)setLastKnownSuperviewFrame:(CGRect)a3;
- (void)setPrefersStatusBarHiddenOverride:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation STRestrictionsPINNavigationController

+ (BOOL)st_shouldAnimate
{
  return [a1 st_isPad] ^ 1;
}

- (void)viewWillLayoutSubviews
{
  [(STRestrictionsPINNavigationController *)self lastKnownSuperviewFrame];
  if (CGRectGetWidth(v4) == 0.0)
  {
    [(STRestrictionsPINNavigationController *)self _adjustToSuperviewFrame];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  [(STRestrictionsPINNavigationController *)self setPrefersStatusBarHiddenOverride:1];
  [(STRestrictionsPINNavigationController *)self setNeedsStatusBarAppearanceUpdate];
  v6 = [(STRestrictionsPINNavigationController *)self view];
  [v6 frame];
  v11.receiver = self;
  v11.super_class = (Class)STRestrictionsPINNavigationController;
  -[STRestrictionsPINNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v5, v7, v8);

  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004C3C;
  v10[3] = &unk_100008450;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004C44;
  v9[3] = &unk_100008450;
  [v5 animateAlongsideTransition:v10 completion:v9];
}

- (BOOL)prefersStatusBarHidden
{
  if ([(STRestrictionsPINNavigationController *)self prefersStatusBarHiddenOverride]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STRestrictionsPINNavigationController;
  return [(STRestrictionsPINNavigationController *)&v4 prefersStatusBarHidden];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (!objc_msgSend((id)objc_opt_class(), "st_isPad")) {
    return 26;
  }

  return [(STRestrictionsPINNavigationController *)self internalSupportedOrientations];
}

+ (BOOL)st_isPad
{
  if (qword_10000D340 != -1) {
    dispatch_once(&qword_10000D340, &stru_100008470);
  }
  return byte_10000D348;
}

- (void)_adjustToSuperviewFrame
{
  id v16 = [(STRestrictionsPINNavigationController *)self view];
  v3 = [v16 superview];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(STRestrictionsPINNavigationController *)self lastKnownSuperviewFrame];
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  if (!CGRectEqualToRect(v18, v21))
  {
    -[STRestrictionsPINNavigationController setLastKnownSuperviewFrame:](self, "setLastKnownSuperviewFrame:", v5, v7, v9, v11);
    if (objc_msgSend((id)objc_opt_class(), "st_isPad"))
    {
      v12 = [v16 layer];
      [v12 setCornerRadius:10.0];

      [v16 setClipsToBounds:1];
      [(STRestrictionsPINNavigationController *)self _freezeSupportedOrientations];
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      CGFloat v13 = CGRectGetMidX(v19) + -160.0;
      v20.origin.x = v5;
      v20.origin.y = v7;
      v20.size.width = v9;
      v20.size.height = v11;
      CGFloat MidY = CGRectGetMidY(v20);
      v15 = v16;
      double v7 = MidY + -240.0;
      double v11 = 480.0;
      double v9 = 320.0;
      double v5 = v13;
    }
    else
    {
      v15 = v16;
    }
    [v15 setFrame:v5, v7, v9, v11];
  }
}

- (void)_freezeSupportedOrientations
{
  v3 = [(STRestrictionsPINNavigationController *)self view];
  double v4 = [v3 window];
  double v5 = [v4 windowScene];
  double v6 = (char *)[v5 interfaceOrientation];

  if ((unint64_t)(v6 - 2) > 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = qword_1000063E8[(void)(v6 - 2)];
  }

  [(STRestrictionsPINNavigationController *)self setInternalSupportedOrientations:v7];
}

- (unint64_t)internalSupportedOrientations
{
  return self->_internalSupportedOrientations;
}

- (void)setInternalSupportedOrientations:(unint64_t)a3
{
  self->_internalSupportedOrientations = a3;
}

- (CGRect)lastKnownSuperviewFrame
{
  objc_copyStruct(v6, &self->_lastKnownSuperviewFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setLastKnownSuperviewFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_lastKnownSuperviewFrame, &v3, 32, 1, 0);
}

- (BOOL)prefersStatusBarHiddenOverride
{
  return self->_prefersStatusBarHiddenOverride;
}

- (void)setPrefersStatusBarHiddenOverride:(BOOL)a3
{
  self->_prefersStatusBarHiddenOverride = a3;
}

@end