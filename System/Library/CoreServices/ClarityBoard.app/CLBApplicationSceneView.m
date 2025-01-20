@interface CLBApplicationSceneView
- (BOOL)shouldPresentWithinSafeArea;
- (CGSize)_flipDimensionsForSize:(CGSize)a3;
- (CLBApplicationSceneView)initWithSceneInterfaceOrientation:(int64_t)a3 includeBackgroundView:(BOOL)a4;
- (FBScene)scene;
- (UIEdgeInsets)realSafeAreaInsets;
- (double)_angleForInterfaceOrientation:(int64_t)a3;
- (int64_t)sceneInterfaceOrientation;
- (void)_trackScene:(id)a3;
- (void)_updateHostView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setRealSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setScene:(id)a3;
- (void)setSceneInterfaceOrientation:(int64_t)a3;
- (void)setShouldPresentWithinSafeArea:(BOOL)a3;
- (void)updateSceneUI;
@end

@implementation CLBApplicationSceneView

- (CLBApplicationSceneView)initWithSceneInterfaceOrientation:(int64_t)a3 includeBackgroundView:(BOOL)a4
{
  BOOL v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLBApplicationSceneView;
  v6 = [(CLBApplicationSceneView *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_includeBackgroundView = v4;
    if (v4)
    {
      v8 = objc_opt_new();
      [(CLBApplicationSceneView *)v7 addSubview:v8];
      [(CLBApplicationSceneView *)v7 bounds];
      objc_msgSend(v8, "setFrame:");
      [v8 setAutoresizingMask:18];
    }
    v9 = +[BSDescriptionBuilder descriptionForObject:v7];
    uint64_t v10 = +[NSString stringWithFormat:@"%@-%u", v9, ++dword_100181158];
    requester = v7->_requester;
    v7->_requester = (NSString *)v10;

    v7->_sceneInterfaceOrientation = a3;
  }
  return v7;
}

- (void)dealloc
{
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CLBApplicationSceneView;
  [(CLBApplicationSceneView *)&v3 dealloc];
}

- (void)setScene:(id)a3
{
  if (self->_scene != a3) {
    -[CLBApplicationSceneView _trackScene:](self, "_trackScene:");
  }
}

- (void)setRealSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->_realSafeAreaInsets.left != a3.left
    || self->_realSafeAreaInsets.top != a3.top
    || self->_realSafeAreaInsets.right != a3.right
    || self->_realSafeAreaInsets.bottom != a3.bottom)
  {
    self->_realSafeAreaInsets = a3;
    [(CLBApplicationSceneView *)self setNeedsLayout];
  }
}

- (void)setShouldPresentWithinSafeArea:(BOOL)a3
{
  if (self->_shouldPresentWithinSafeArea != a3)
  {
    self->_shouldPresentWithinSafeArea = a3;
    [(CLBApplicationSceneView *)self setNeedsLayout];
  }
}

- (void)setSceneInterfaceOrientation:(int64_t)a3
{
  if (self->_sceneInterfaceOrientation != a3)
  {
    self->_sceneInterfaceOrientation = a3;
    [(CLBApplicationSceneView *)self setNeedsLayout];
  }
}

- (void)updateSceneUI
{
  [(CLBApplicationSceneView *)self setNeedsLayout];

  [(CLBApplicationSceneView *)self _updateHostView];
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)CLBApplicationSceneView;
  [(CLBApplicationSceneView *)&v51 layoutSubviews];
  [(CLBApplicationSceneView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CLBApplicationSceneView *)self shouldPresentWithinSafeArea])
  {
    [(CLBApplicationSceneView *)self realSafeAreaInsets];
    double v4 = v4 + v11;
    double v6 = v6 + v12;
    double v8 = v8 - (v11 + v13);
    double v10 = v10 - (v12 + v14);
  }
  v15 = [(CLBApplicationSceneView *)self scene];
  v16 = [v15 settings];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;

  int64_t v21 = [(CLBApplicationSceneView *)self sceneInterfaceOrientation];
  if (v21)
  {
    v22 = [(CLBApplicationSceneView *)self sceneInterfaceOrientation];
  }
  else
  {
    v23 = [(CLBApplicationSceneView *)self window];
    v22 = (char *)[v23 interfaceOrientation];
  }
  if ((unint64_t)(v22 - 3) <= 1)
  {
    -[CLBApplicationSceneView _flipDimensionsForSize:](self, "_flipDimensionsForSize:", v18, v20);
    double v18 = v24;
    double v20 = v25;
  }
  double v26 = v10;
  double v27 = v8;
  if (v21)
  {
    int v28 = (char *)[(CLBApplicationSceneView *)self sceneInterfaceOrientation] - 3 < (char *)2;
    v29 = [(CLBApplicationSceneView *)self window];
    int v30 = (char *)[v29 interfaceOrientation] - 3 < (char *)2;

    double v26 = v10;
    double v27 = v8;
    if (v28 != v30)
    {
      -[CLBApplicationSceneView _flipDimensionsForSize:](self, "_flipDimensionsForSize:", v8, v10);
      double v27 = v31;
      double v26 = v32;
    }
  }
  BSRectWithSize();
  -[UIView setBounds:](self->_sceneHostContainerView, "setBounds:");
  v58.origin.x = v4;
  v58.origin.y = v6;
  v58.size.width = v8;
  v58.size.height = v10;
  CGFloat MidX = CGRectGetMidX(v58);
  v59.origin.y = v6;
  double v34 = MidX;
  v59.origin.x = v4;
  v59.size.width = v8;
  v59.size.height = v10;
  -[UIView setCenter:](self->_sceneHostContainerView, "setCenter:", v34, CGRectGetMidY(v59));
  double v35 = fmin(v27 / v18, v26 / v20);
  if (v21)
  {
    [(CLBApplicationSceneView *)self _angleForInterfaceOrientation:[(CLBApplicationSceneView *)self sceneInterfaceOrientation]];
    double v37 = v36;
    -[CLBApplicationSceneView _angleForInterfaceOrientation:](self, "_angleForInterfaceOrientation:", [(id)qword_100186478 systemInterfaceOrientation]);
    double v39 = v37 - v38;
  }
  else
  {
    double v39 = 0.0;
  }
  CGAffineTransformMakeScale(&t1, v35, v35);
  CGAffineTransformMakeRotation(&t2, v39);
  CGAffineTransformConcat(&v50, &t1, &t2);
  sceneHostContainerView = self->_sceneHostContainerView;
  CGAffineTransform v47 = v50;
  [(UIView *)sceneHostContainerView setTransform:&v47];
  v41 = +[CLFLog commonLog];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = [(CLBApplicationSceneView *)self scene];
    [(UIView *)self->_sceneHostContainerView bounds];
    v43 = NSStringFromCGRect(v60);
    v44 = self->_sceneHostContainerView;
    if (v44) {
      [(UIView *)v44 transform];
    }
    else {
      memset(&v46, 0, sizeof(v46));
    }
    v45 = NSStringFromCGAffineTransform(&v46);
    *(_DWORD *)buf = 138412802;
    v53 = v42;
    __int16 v54 = 2112;
    v55 = v43;
    __int16 v56 = 2112;
    v57 = v45;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Scene %@ using bounds: %@, transform: %@", buf, 0x20u);
  }
}

- (double)_angleForInterfaceOrientation:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2) {
    return dbl_10010F218[a3 - 2];
  }
  return result;
}

- (CGSize)_flipDimensionsForSize:(CGSize)a3
{
  CGFloat width = a3.width;
  double height = a3.height;
  double v5 = width;
  result.double height = v5;
  result.CGFloat width = height;
  return result;
}

- (void)_trackScene:(id)a3
{
  id v17 = a3;
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  sceneHostView = self->_sceneHostView;
  self->_sceneHostView = 0;

  sceneHostContainerView = self->_sceneHostContainerView;
  self->_sceneHostContainerView = 0;

  scene = self->_scene;
  self->_scene = 0;

  if (v17)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    double v9 = [v17 uiPresentationManager];
    double v10 = [v9 createPresenterWithIdentifier:self->_requester];
    double v11 = self->_scenePresenter;
    self->_scenePresenter = v10;

    [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&stru_10015CE30];
    [(UIScenePresenter *)self->_scenePresenter activate];
    double v12 = [(UIScenePresenter *)self->_scenePresenter presentationView];
    double v13 = self->_sceneHostView;
    self->_sceneHostView = v12;

    double v14 = (UIView *)objc_opt_new();
    v15 = self->_sceneHostContainerView;
    self->_sceneHostContainerView = v14;

    v16 = +[UIColor clearColor];
    [(UIView *)self->_sceneHostContainerView setBackgroundColor:v16];

    [(UIView *)self->_sceneHostContainerView addSubview:self->_sceneHostView];
    [(CLBApplicationSceneView *)self addSubview:self->_sceneHostContainerView];
    [(UIView *)self->_sceneHostContainerView bounds];
    -[UIView setFrame:](self->_sceneHostView, "setFrame:");
    [(UIView *)self->_sceneHostView setAutoresizingMask:18];
    [(CLBApplicationSceneView *)self _updateHostView];
    [(CLBApplicationSceneView *)self setNeedsLayout];
  }
}

- (void)_updateHostView
{
  id v3 = [(FBScene *)self->_scene contentState];
  double v4 = 0.0;
  if (v3 == (id)2) {
    double v4 = 1.0;
  }
  sceneHostContainerView = self->_sceneHostContainerView;

  [(UIView *)sceneHostContainerView setAlpha:v4];
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIEdgeInsets)realSafeAreaInsets
{
  double top = self->_realSafeAreaInsets.top;
  double left = self->_realSafeAreaInsets.left;
  double bottom = self->_realSafeAreaInsets.bottom;
  double right = self->_realSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)shouldPresentWithinSafeArea
{
  return self->_shouldPresentWithinSafeArea;
}

- (int64_t)sceneInterfaceOrientation
{
  return self->_sceneInterfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_sceneHostContainerView, 0);
  objc_storeStrong((id *)&self->_sceneHostView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end