@interface CKSendAnimationWindow
- (BOOL)_canAffectStatusBarAppearance;
- (CKGradientReferenceView)gradientReferenceView;
- (CKSendAnimationWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4;
- (void)setGradientReferenceView:(id)a3;
@end

@implementation CKSendAnimationWindow

- (CKSendAnimationWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKSendAnimationWindow;
  v10 = [(UIApplicationRotationFollowingWindow *)&v15 initWithWindowScene:v9];
  v11 = v10;
  if (v10)
  {
    -[CKSendAnimationWindow setFrame:](v10, "setFrame:", x, y, width, height);
    v12 = [CKGradientReferenceView alloc];
    [(CKSendAnimationWindow *)v11 bounds];
    v13 = -[CKGradientReferenceView initWithFrame:](v12, "initWithFrame:");
    [(CKGradientReferenceView *)v13 setAutoresizingMask:18];
    [(CKSendAnimationWindow *)v11 setGradientReferenceView:v13];
    [(CKSendAnimationWindow *)v11 addSubview:v13];
    -[UIAutoRotatingWindow updateForOrientation:](v11, "updateForOrientation:", [v9 interfaceOrientation]);
  }
  return v11;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (CKGradientReferenceView)gradientReferenceView
{
  return self->_gradientReferenceView;
}

- (void)setGradientReferenceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end