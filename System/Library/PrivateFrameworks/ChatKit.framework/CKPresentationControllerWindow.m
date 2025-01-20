@interface CKPresentationControllerWindow
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)restrictedToPortraitOrientation;
- (CKPresentationControllerWindow)initWithFrame:(CGRect)a3 allowsRotation:(BOOL)a4 allowsStatusBarChanges:(BOOL)a5 restrictedToPortraitOrientation:(BOOL)a6;
- (CKPresentationControllerWindow)initWithWindowScene:(id)a3 allowsRotation:(BOOL)a4 allowsStatusBarChanges:(BOOL)a5 restrictedToPortraitOrientation:(BOOL)a6;
- (CKPresentationControllerWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 allowsRotation:(BOOL)a5 allowsStatusBarChanges:(BOOL)a6 restrictedToPortraitOrientation:(BOOL)a7;
- (void)restrictedToPortraitOrientation:(BOOL)a3;
- (void)setRestrictedToPortraitOrientation:(BOOL)a3;
@end

@implementation CKPresentationControllerWindow

- (CKPresentationControllerWindow)initWithWindowScene:(id)a3 allowsRotation:(BOOL)a4 allowsStatusBarChanges:(BOOL)a5 restrictedToPortraitOrientation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKPresentationControllerWindow;
  v9 = [(CKPresentationControllerWindow *)&v15 initWithWindowScene:a3];
  if (v9)
  {
    v10 = objc_alloc_init(CKPresentationControllerRootViewController);
    [(CKPresentationControllerRootViewController *)v10 setAllowsRotation:v8];
    [(CKPresentationControllerRootViewController *)v10 setAllowsStatusBarChanges:v7];
    [(CKPresentationControllerRootViewController *)v10 setRestrictedToPortraitOrientation:v6];
    v11 = [(CKPresentationControllerRootViewController *)v10 view];
    [v11 setBackgroundColor:0];

    [(CKPresentationControllerWindow *)v9 setRootViewController:v10];
    v12 = [(CKPresentationControllerRootViewController *)v10 view];
    [(CKPresentationControllerWindow *)v9 addSubview:v12];

    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 presentationControllerWindowLevel];
    -[CKPresentationControllerWindow setWindowLevel:](v9, "setWindowLevel:");
  }
  return v9;
}

- (CKPresentationControllerWindow)initWithFrame:(CGRect)a3 allowsRotation:(BOOL)a4 allowsStatusBarChanges:(BOOL)a5 restrictedToPortraitOrientation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14 = [MEMORY[0x1E4F43058] keyWindow];
  objc_super v15 = [v14 windowScene];
  v16 = -[CKPresentationControllerWindow initWithWindowScene:frame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](self, "initWithWindowScene:frame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", v15, v8, v7, v6, x, y, width, height);

  return v16;
}

- (CKPresentationControllerWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 allowsRotation:(BOOL)a5 allowsStatusBarChanges:(BOOL)a6 restrictedToPortraitOrientation:(BOOL)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v11 = [(CKPresentationControllerWindow *)self initWithWindowScene:a3 allowsRotation:a5 allowsStatusBarChanges:a6 restrictedToPortraitOrientation:a7];
  v12 = v11;
  if (v11) {
    -[CKPresentationControllerWindow setFrame:](v11, "setFrame:", x, y, width, height);
  }
  return v12;
}

- (void)restrictedToPortraitOrientation:(BOOL)a3
{
  if (self->_restrictedToPortraitOrientation != a3)
  {
    BOOL v3 = a3;
    self->_restrictedToPortraitOrientation = a3;
    id v4 = [(CKPresentationControllerWindow *)self rootViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setRestrictedToPortraitOrientation:v3];
    }
  }
}

- (BOOL)_canAffectStatusBarAppearance
{
  v2 = [(CKPresentationControllerWindow *)self rootViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 allowsStatusBarChanges];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)restrictedToPortraitOrientation
{
  return self->_restrictedToPortraitOrientation;
}

- (void)setRestrictedToPortraitOrientation:(BOOL)a3
{
  self->_restrictedToPortraitOrientation = a3;
}

@end