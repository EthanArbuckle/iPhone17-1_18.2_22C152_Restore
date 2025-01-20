@interface BuddyCoverSheetController
- (UIScreenEdgePanGestureRecognizer)gestureRecognizer;
- (UIView)dimmingView;
- (UIViewController)backgroundViewController;
- (UIViewController)foregroundViewController;
- (UIViewFloatAnimatableProperty)progressProperty;
- (id)backgroundViewControllerPresented;
- (void)_animationTickForPresentationValue:(BOOL)a3;
- (void)_dismissGestureChanged:(id)a3;
- (void)_dismissGestureEndedWithGestureRecognizer:(id)a3;
- (void)_handleGesture:(id)a3;
- (void)_updateDimmingViewForProgress:(double)a3;
- (void)_updateForLocation:(CGPoint)a3 interactive:(BOOL)a4;
- (void)setBackgroundViewController:(id)a3;
- (void)setBackgroundViewControllerPresented:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setForegroundViewController:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setProgressProperty:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyCoverSheetController

- (void)viewDidLoad
{
  v49 = self;
  SEL v48 = a2;
  v47.receiver = self;
  v47.super_class = (Class)BuddyCoverSheetController;
  [(BuddyCoverSheetController *)&v47 viewDidLoad];
  id v2 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyCoverSheetController *)v49 setDimmingView:v2];

  v3 = [(BuddyCoverSheetController *)v49 dimmingView];
  [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(BuddyCoverSheetController *)v49 view];
  v5 = [(BuddyCoverSheetController *)v49 dimmingView];
  [v4 addSubview:v5];

  v6 = [(BuddyCoverSheetController *)v49 dimmingView];
  v7 = [(UIView *)v6 topAnchor];
  id v8 = [(BuddyCoverSheetController *)v49 view];
  id v9 = [v8 topAnchor];
  id v10 = [(NSLayoutYAxisAnchor *)v7 constraintEqualToAnchor:v9];
  v51[0] = v10;
  v11 = [(BuddyCoverSheetController *)v49 dimmingView];
  v12 = [(UIView *)v11 rightAnchor];
  id v13 = [(BuddyCoverSheetController *)v49 view];
  id v33 = [v13 rightAnchor];
  id v32 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v12, "constraintEqualToAnchor:");
  v51[1] = v32;
  v31 = [(BuddyCoverSheetController *)v49 dimmingView];
  v30 = [(UIView *)v31 bottomAnchor];
  id v29 = [(BuddyCoverSheetController *)v49 view];
  id v28 = [v29 bottomAnchor];
  id v27 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v30, "constraintEqualToAnchor:");
  v51[2] = v27;
  v26 = [(BuddyCoverSheetController *)v49 dimmingView];
  v25 = [(UIView *)v26 leftAnchor];
  id v24 = [(BuddyCoverSheetController *)v49 view];
  id v23 = [v24 leftAnchor];
  id v22 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v25, "constraintEqualToAnchor:");
  v51[3] = v22;
  v14 = +[NSArray arrayWithObjects:v51 count:4];
  +[NSLayoutConstraint activateConstraints:v14];

  id v15 = objc_alloc((Class)UIScreenEdgePanGestureRecognizer);
  id v16 = [v15 initWithTarget:v49 action:"_handleGesture:"];
  [(BuddyCoverSheetController *)v49 setGestureRecognizer:v16];

  v17 = [(BuddyCoverSheetController *)v49 gestureRecognizer];
  [(UIScreenEdgePanGestureRecognizer *)v17 setEdges:4];

  id v18 = [(BuddyCoverSheetController *)v49 view];
  v19 = [(BuddyCoverSheetController *)v49 gestureRecognizer];
  [v18 addGestureRecognizer:v19];

  id v20 = objc_alloc_init((Class)UIViewFloatAnimatableProperty);
  [(BuddyCoverSheetController *)v49 setProgressProperty:v20];

  objc_initWeak(&location, v49);
  progressProperty = v49->_progressProperty;
  v21 = +[NSArray arrayWithObjects:&progressProperty count:1];
  v40 = _NSConcreteStackBlock;
  int v41 = -1073741824;
  int v42 = 0;
  v43 = sub_1000E9A20;
  v44 = &unk_1002B0CA8;
  objc_copyWeak(v45, &location);
  v34 = _NSConcreteStackBlock;
  int v35 = -1073741824;
  int v36 = 0;
  v37 = sub_1000E9A68;
  v38 = &unk_1002B0CA8;
  objc_copyWeak(&v39, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:v21 modelValueSetter:&v40 presentationValueSetter:&v34];

  [(BuddyCoverSheetController *)v49 _updateDimmingViewForProgress:0.0];
  objc_destroyWeak(&v39);
  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
}

- (void)setForegroundViewController:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_foregroundViewController, location[0]);
  [(BuddyCoverSheetController *)v7 addChildViewController:location[0]];
  id v3 = [(BuddyCoverSheetController *)v7 view];
  id v4 = [location[0] view];
  v5 = [(BuddyCoverSheetController *)v7 dimmingView];
  [v3 insertSubview:v4 above:v5];

  [location[0] didMoveToParentViewController:v7];
  objc_storeStrong(location, 0);
}

- (void)setBackgroundViewController:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_backgroundViewController, location[0]);
  [(BuddyCoverSheetController *)v7 addChildViewController:location[0]];
  id v3 = [(BuddyCoverSheetController *)v7 view];
  id v4 = [location[0] view];
  v5 = [(BuddyCoverSheetController *)v7 dimmingView];
  [v3 insertSubview:v4 below:v5];

  [location[0] didMoveToParentViewController:v7];
  objc_storeStrong(location, 0);
}

- (void)_animationTickForPresentationValue:(BOOL)a3
{
  v38 = self;
  SEL v37 = a2;
  BOOL v36 = a3;
  id v3 = [(BuddyCoverSheetController *)self progressProperty];
  [(UIViewFloatAnimatableProperty *)v3 value];
  double v5 = v4;

  double v35 = v5;
  if (v36)
  {
    v6 = [(BuddyCoverSheetController *)v38 progressProperty];
    [(UIViewFloatAnimatableProperty *)v6 presentationValue];
    double v35 = v7;
  }
  id v8 = [(BuddyCoverSheetController *)v38 view];
  [v8 bounds];
  uint64_t v31 = v9;
  uint64_t v30 = v10;
  double v33 = v11;
  uint64_t v32 = v12;
  double v13 = v11;

  double v34 = v13;
  double v29 = v34 - v35 * v34;
  v14 = [(BuddyCoverSheetController *)v38 foregroundViewController];
  id v15 = [(UIViewController *)v14 view];
  [(UIView *)v15 frame];
  rect.origin.y = v16;
  rect.origin.x = v17;
  rect.size.height = v18;
  rect.size.width = v19;

  rect.origin.y = v29 - CGRectGetHeight(rect);
  UIRectGetCenter();
  double v26 = v20;
  double v27 = v21;
  id v22 = [(BuddyCoverSheetController *)v38 foregroundViewController];
  id v23 = [(UIViewController *)v22 view];
  if (v36)
  {
    *(double *)v25 = v26;
    *(double *)&v25[1] = v27;
    id v24 = +[NSValue valueWithBytes:v25 objCType:"{CGPoint=dd}"];
    [(UIView *)v23 _setPresentationValue:v24 forKey:@"position"];
  }
  else
  {
    -[UIView setCenter:](v23, "setCenter:", v26, v27);
  }
}

- (void)_updateForLocation:(CGPoint)a3 interactive:(BOOL)a4
{
  double y = a3.y;
  id v4 = [(BuddyCoverSheetController *)self view];
  [v4 bounds];
  double v6 = v5;

  double v7 = [(BuddyCoverSheetController *)self progressProperty];
  [(UIViewFloatAnimatableProperty *)v7 setValue:1.0 - y / v6];

  [(BuddyCoverSheetController *)self _updateDimmingViewForProgress:1.0 - y / v6];
}

- (void)_updateDimmingViewForProgress:(double)a3
{
  id v3 = +[UIColor colorWithWhite:0.0 alpha:0.2];
  id v4 = [(BuddyCoverSheetController *)self dimmingView];
  [(UIView *)v4 setBackgroundColor:v3];

  double v5 = [(BuddyCoverSheetController *)self dimmingView];
  [(UIView *)v5 setAlpha:0.5 * (1.0 - a3)];
}

- (void)_dismissGestureChanged:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = [(BuddyCoverSheetController *)v10 view];
  [v3 locationInView:v4];
  double v7 = v5;
  double v8 = v6;

  -[BuddyCoverSheetController _updateForLocation:interactive:](v10, "_updateForLocation:interactive:", 1, v7, v8);
  objc_storeStrong(location, 0);
}

- (void)_dismissGestureEndedWithGestureRecognizer:(id)a3
{
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v41 = 0;
  id v3 = location[0];
  id v4 = [(BuddyCoverSheetController *)v43 view];
  [v3 locationInView:v4];
  uint64_t v38 = v5;
  double v39 = v6;
  double v7 = v6;

  double v40 = v7;
  id v8 = location[0];
  id v9 = [(BuddyCoverSheetController *)v43 view];
  [v8 velocityInView:v9];
  uint64_t v35 = v10;
  double v36 = v11;
  double v12 = v11;

  double v37 = v12;
  id v13 = [(BuddyCoverSheetController *)v43 view];
  [v13 bounds];
  CGRect v34 = v44;
  BOOL v14 = 1;
  if (v40 + v12 * 0.15 >= CGRectGetHeight(v44) * 0.6) {
    BOOL v14 = v37 < -306.0;
  }

  if (v14) {
    char v41 = 1;
  }
  memset(__b, 0, sizeof(__b));
  __b[0] = *(void *)&CGPointZero.x;
  __b[1] = *(void *)&CGPointZero.y;
  if ((v41 & 1) == 0)
  {
    id v15 = [(BuddyCoverSheetController *)v43 view];
    [v15 bounds];
    CGRect rect = v45;
    CGRectGetHeight(v45);
    double v31 = sub_1000EA45C();
    uint64_t v32 = v16;
    *(double *)__b = v31;
    __b[1] = v16;
  }
  id v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  double v27 = sub_1000EA490;
  id v28 = &unk_1002B1430;
  v29[0] = v43;
  v29[1] = (id)__b[0];
  v29[2] = (id)__b[1];
  CGFloat v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  double v20 = sub_1000EA4CC;
  double v21 = &unk_1002B2C50;
  char v23 = v41 & 1;
  id v22 = v43;
  +[UIView _animateUsingSpringWithTension:0 friction:&v24 interactive:&v17 animations:300.0 completion:34.0];
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleGesture:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (char *)[location[0] state];
  if (v3)
  {
    if ((unint64_t)(v3 - 1) < 2)
    {
      [(BuddyCoverSheetController *)v5 _dismissGestureChanged:location[0]];
    }
    else if ((unint64_t)(v3 - 3) < 3)
    {
      [(BuddyCoverSheetController *)v5 _dismissGestureEndedWithGestureRecognizer:location[0]];
    }
  }
  objc_storeStrong(location, 0);
}

- (UIViewController)foregroundViewController
{
  return self->_foregroundViewController;
}

- (UIViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (id)backgroundViewControllerPresented
{
  return self->_backgroundViewControllerPresented;
}

- (void)setBackgroundViewControllerPresented:(id)a3
{
}

- (UIScreenEdgePanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (UIViewFloatAnimatableProperty)progressProperty
{
  return self->_progressProperty;
}

- (void)setProgressProperty:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end