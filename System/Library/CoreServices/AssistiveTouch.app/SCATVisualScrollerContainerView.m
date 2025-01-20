@interface SCATVisualScrollerContainerView
- (BOOL)updateFocusState:(int64_t)a3;
- (CALayer)borderLayer;
- (SCATVisualScrollerContainerView)initWithAxis:(int64_t)a3;
- (SCATVisualScrollerContainerView)initWithCoder:(id)a3;
- (SCATVisualScrollerContainerView)initWithFrame:(CGRect)a3;
- (SCATVisualScrollerContainerViewScrollingDelegate)delegate;
- (SCATVisualScrollerView)scrollDownView;
- (SCATVisualScrollerView)scrollLeftView;
- (SCATVisualScrollerView)scrollRightView;
- (SCATVisualScrollerView)scrollUpView;
- (UIView)scrollerContainerView;
- (UIVisualEffectView)backgroundView;
- (id)description;
- (int64_t)axis;
- (void)layoutSubviews;
- (void)setAxis:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBorderLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollDownView:(id)a3;
- (void)setScrollLeftView:(id)a3;
- (void)setScrollRightView:(id)a3;
- (void)setScrollUpView:(id)a3;
- (void)setScrollerContainerView:(id)a3;
@end

@implementation SCATVisualScrollerContainerView

- (SCATVisualScrollerContainerView)initWithCoder:(id)a3
{
  return [(SCATVisualScrollerContainerView *)self initWithAxis:0];
}

- (SCATVisualScrollerContainerView)initWithFrame:(CGRect)a3
{
  return -[SCATVisualScrollerContainerView initWithAxis:](self, "initWithAxis:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SCATVisualScrollerContainerView)initWithAxis:(int64_t)a3
{
  v82.receiver = self;
  v82.super_class = (Class)SCATVisualScrollerContainerView;
  v4 = -[SCATCustomFocusingView initWithFrame:](&v82, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_axis = a3;
    [(SCATVisualScrollerContainerView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v71 = +[UIBlurEffect effectWithStyle:4007];
    id v6 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v71];
    [v6 setAutoresizingMask:18];
    [v6 setClipsToBounds:1];
    [(SCATVisualScrollerContainerView *)v5 setBackgroundView:v6];
    [(SCATVisualScrollerContainerView *)v5 addSubview:v6];
    id v7 = objc_alloc_init((Class)UIView);
    [v7 setAutoresizingMask:18];
    [(SCATVisualScrollerContainerView *)v5 setScrollerContainerView:v7];
    [(SCATVisualScrollerContainerView *)v5 addSubview:v7];
    [v7 setClipsToBounds:1];
    v8 = +[CALayer layer];
    v9 = [(SCATVisualScrollerContainerView *)v5 layer];
    [v9 addSublayer:v8];

    [(SCATVisualScrollerContainerView *)v5 setBorderLayer:v8];
    objc_initWeak(&location, v5);
    if (a3)
    {
      v10 = [[SCATVisualScrollerView alloc] initWithTriangle:3];
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_100078CD0;
      v75[3] = &unk_1001AAA68;
      v72 = &v76;
      objc_copyWeak(&v76, &location);
      [(SCATVisualScrollerView *)v10 setActivateActionHandler:v75];
      v11 = sub_100040EC8(@"Scroll-Left");
      [(SCATVisualScrollerView *)v10 setAccessibilityLabel:v11];

      [(SCATVisualScrollerContainerView *)v5 setScrollLeftView:v10];
      [v7 addSubview:v10];
      v12 = [(SCATVisualScrollerView *)v10 leftAnchor];
      v13 = [(SCATVisualScrollerContainerView *)v5 leftAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      [v14 setActive:1];

      v15 = [(SCATVisualScrollerView *)v10 topAnchor];
      v16 = [(SCATVisualScrollerContainerView *)v5 topAnchor];
      v17 = [v15 constraintEqualToAnchor:v16];
      [v17 setActive:1];

      v18 = [(SCATVisualScrollerView *)v10 bottomAnchor];
      v19 = [(SCATVisualScrollerContainerView *)v5 bottomAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      [v20 setActive:1];

      v21 = [(SCATVisualScrollerView *)v10 rightAnchor];
      v22 = [(SCATVisualScrollerContainerView *)v5 centerXAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      [v23 setActive:1];

      v24 = [[SCATVisualScrollerView alloc] initWithTriangle:1];
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100078D48;
      v73[3] = &unk_1001AAA68;
      v25 = &v74;
      objc_copyWeak(&v74, &location);
      [(SCATVisualScrollerView *)v24 setActivateActionHandler:v73];
      v26 = sub_100040EC8(@"Scroll-Right");
      [(SCATVisualScrollerView *)v24 setAccessibilityLabel:v26];

      [(SCATVisualScrollerContainerView *)v5 setScrollRightView:v24];
      [v7 addSubview:v24];
      v27 = [(SCATVisualScrollerView *)v24 rightAnchor];
      v28 = [(SCATVisualScrollerContainerView *)v5 rightAnchor];
      v29 = [v27 constraintEqualToAnchor:v28];
      [v29 setActive:1];

      v30 = [(SCATVisualScrollerView *)v24 topAnchor];
      v31 = [(SCATVisualScrollerContainerView *)v5 topAnchor];
      v32 = [v30 constraintEqualToAnchor:v31];
      [v32 setActive:1];

      v33 = [(SCATVisualScrollerView *)v24 bottomAnchor];
      v34 = [(SCATVisualScrollerContainerView *)v5 bottomAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      [v35 setActive:1];

      v36 = [(SCATVisualScrollerView *)v24 leftAnchor];
      v37 = [(SCATVisualScrollerContainerView *)v5 centerXAnchor];
      v38 = [v36 constraintEqualToAnchor:v37];
      [v38 setActive:1];

      v39 = [(SCATVisualScrollerContainerView *)v5 heightAnchor];
      +[SCATVisualScrollerView scrollerSize];
      v41 = [v39 constraintEqualToConstant:v40 + 20.0];
      [v41 setActive:1];
    }
    else
    {
      v42 = [[SCATVisualScrollerView alloc] initWithTriangle:0];
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_100078BE0;
      v79[3] = &unk_1001AAA68;
      v72 = &v80;
      objc_copyWeak(&v80, &location);
      [(SCATVisualScrollerView *)v42 setActivateActionHandler:v79];
      v43 = sub_100040EC8(@"Scroll-Up");
      [(SCATVisualScrollerView *)v42 setAccessibilityLabel:v43];

      [(SCATVisualScrollerContainerView *)v5 setScrollUpView:v42];
      [v7 addSubview:v42];
      v44 = [(SCATVisualScrollerView *)v42 leftAnchor];
      v45 = [(SCATVisualScrollerContainerView *)v5 leftAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v46 setActive:1];

      v47 = [(SCATVisualScrollerView *)v42 topAnchor];
      v48 = [(SCATVisualScrollerContainerView *)v5 topAnchor];
      v49 = [v47 constraintEqualToAnchor:v48];
      [v49 setActive:1];

      v50 = [(SCATVisualScrollerView *)v42 rightAnchor];
      v51 = [(SCATVisualScrollerContainerView *)v5 rightAnchor];
      v52 = [v50 constraintEqualToAnchor:v51];
      [v52 setActive:1];

      v53 = [(SCATVisualScrollerView *)v42 bottomAnchor];
      v54 = [(SCATVisualScrollerContainerView *)v5 centerYAnchor];
      v55 = [v53 constraintEqualToAnchor:v54];
      [v55 setActive:1];

      v24 = [[SCATVisualScrollerView alloc] initWithTriangle:2];
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100078C58;
      v77[3] = &unk_1001AAA68;
      v25 = &v78;
      objc_copyWeak(&v78, &location);
      [(SCATVisualScrollerView *)v24 setActivateActionHandler:v77];
      v56 = sub_100040EC8(@"Scroll-Down");
      [(SCATVisualScrollerView *)v24 setAccessibilityLabel:v56];

      [(SCATVisualScrollerContainerView *)v5 setScrollDownView:v24];
      [v7 addSubview:v24];
      v57 = [(SCATVisualScrollerView *)v24 leftAnchor];
      v58 = [(SCATVisualScrollerContainerView *)v5 leftAnchor];
      v59 = [v57 constraintEqualToAnchor:v58];
      [v59 setActive:1];

      v60 = [(SCATVisualScrollerView *)v24 bottomAnchor];
      v61 = [(SCATVisualScrollerContainerView *)v5 bottomAnchor];
      v62 = [v60 constraintEqualToAnchor:v61];
      [v62 setActive:1];

      v63 = [(SCATVisualScrollerView *)v24 rightAnchor];
      v64 = [(SCATVisualScrollerContainerView *)v5 rightAnchor];
      v65 = [v63 constraintEqualToAnchor:v64];
      [v65 setActive:1];

      v66 = [(SCATVisualScrollerView *)v24 topAnchor];
      v67 = [(SCATVisualScrollerContainerView *)v5 centerYAnchor];
      v68 = [v66 constraintEqualToAnchor:v67];
      [v68 setActive:1];

      v39 = [(SCATVisualScrollerContainerView *)v5 widthAnchor];
      +[SCATVisualScrollerView scrollerSize];
      v41 = [v39 constraintEqualToConstant:v69 + 20.0];
      [v41 setActive:1];
    }

    objc_destroyWeak(v25);
    objc_destroyWeak(v72);

    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)SCATVisualScrollerContainerView;
  [(SCATVisualScrollerContainerView *)&v26 layoutSubviews];
  [(SCATVisualScrollerContainerView *)self bounds];
  double width = v27.size.width;
  double height = v27.size.height;
  CGRect v28 = CGRectInset(v27, -7.0, -7.0);
  double x = v28.origin.x;
  double y = v28.origin.y;
  double v7 = v28.size.width;
  double v8 = v28.size.height;
  v9 = [(SCATVisualScrollerContainerView *)self borderLayer];
  objc_msgSend(v9, "setFrame:", x, y, v7, v8);

  if (width >= height) {
    double v10 = height;
  }
  else {
    double v10 = width;
  }
  double v11 = v10 * 0.5;
  v12 = [(SCATVisualScrollerContainerView *)self layer];
  [v12 setCornerRadius:v11];

  v13 = [(SCATVisualScrollerContainerView *)self backgroundView];
  v14 = [v13 layer];
  [v14 setCornerRadius:v11];

  v15 = [(SCATVisualScrollerContainerView *)self scrollerContainerView];
  v16 = [v15 layer];
  [v16 setCornerRadius:v11];

  v17 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v17 bounds];
  double v19 = v18;

  v20 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v20 bounds];
  double v22 = v21;

  if (v19 >= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v19;
  }
  double v24 = v23 * 0.5;
  v25 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v25 setCornerRadius:v24];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SCATVisualScrollerContainerView;
  uint64_t v3 = [(SCATVisualScrollerContainerView *)&v8 description];
  v4 = (void *)v3;
  if (self->_axis) {
    CFStringRef v5 = @"Horizontal";
  }
  else {
    CFStringRef v5 = @"Vertical";
  }
  id v6 = +[NSString stringWithFormat:@"%@ - Axis:%@", v3, v5];

  return v6;
}

- (BOOL)updateFocusState:(int64_t)a3
{
  v53.receiver = self;
  v53.super_class = (Class)SCATVisualScrollerContainerView;
  -[SCATCustomFocusingView updateFocusState:](&v53, "updateFocusState:");
  [(SCATVisualScrollerContainerView *)self bounds];
  if (!a3)
  {
    CGRect v55 = CGRectInset(*(CGRect *)&v5, -2.0, -2.0);
    double x = v55.origin.x;
    double y = v55.origin.y;
    double width = v55.size.width;
    double height = v55.size.height;
    CGRect v27 = [(SCATVisualScrollerContainerView *)self borderLayer];
    objc_msgSend(v27, "setFrame:", x, y, width, height);

    [(id)objc_opt_class() unfocusedStateBorderThickness];
    double v29 = v28;
    v30 = [(SCATVisualScrollerContainerView *)self borderLayer];
    [v30 setBorderWidth:v29];

    v31 = [(id)objc_opt_class() unfocusedStateColor];
LABEL_7:
    id v40 = v31;
    id v41 = [v40 CGColor];
    v42 = [(SCATVisualScrollerContainerView *)self borderLayer];
    [v42 setBorderColor:v41];

    v20 = [(SCATVisualScrollerContainerView *)self borderLayer];
    double v21 = v20;
    LODWORD(v22) = 1053609165;
    goto LABEL_8;
  }
  if (a3 == 2)
  {
    CGRect v56 = CGRectInset(*(CGRect *)&v5, -2.0, -2.0);
    double v32 = v56.origin.x;
    double v33 = v56.origin.y;
    double v34 = v56.size.width;
    double v35 = v56.size.height;
    v36 = [(SCATVisualScrollerContainerView *)self borderLayer];
    objc_msgSend(v36, "setFrame:", v32, v33, v34, v35);

    [(id)objc_opt_class() unfocusedStateBorderThickness];
    double v38 = v37;
    v39 = [(SCATVisualScrollerContainerView *)self borderLayer];
    [v39 setBorderWidth:v38];

    v31 = [(id)objc_opt_class() focusedGroupStateColor];
    goto LABEL_7;
  }
  if (a3 != 1) {
    goto LABEL_9;
  }
  CGRect v54 = CGRectInset(*(CGRect *)&v5, -7.0, -7.0);
  double v9 = v54.origin.x;
  double v10 = v54.origin.y;
  double v11 = v54.size.width;
  double v12 = v54.size.height;
  v13 = [(SCATVisualScrollerContainerView *)self borderLayer];
  objc_msgSend(v13, "setFrame:", v9, v10, v11, v12);

  [(id)objc_opt_class() focusedStateBorderThickness];
  double v15 = v14;
  v16 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v16 setBorderWidth:v15];

  id v17 = [(id)objc_opt_class() focusedStateColor];
  id v18 = [v17 CGColor];
  double v19 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v19 setBorderColor:v18];

  v20 = [(SCATVisualScrollerContainerView *)self borderLayer];
  double v21 = v20;
  LODWORD(v22) = 1.0;
LABEL_8:
  [v20 setOpacity:v22];

LABEL_9:
  v43 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v43 bounds];
  double v45 = v44;

  v46 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v46 bounds];
  double v48 = v47;

  if (v45 >= v48) {
    double v49 = v48;
  }
  else {
    double v49 = v45;
  }
  double v50 = v49 * 0.5;
  v51 = [(SCATVisualScrollerContainerView *)self borderLayer];
  [v51 setCornerRadius:v50];

  return 1;
}

- (SCATVisualScrollerContainerViewScrollingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATVisualScrollerContainerViewScrollingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATVisualScrollerView)scrollUpView
{
  return self->_scrollUpView;
}

- (void)setScrollUpView:(id)a3
{
}

- (SCATVisualScrollerView)scrollDownView
{
  return self->_scrollDownView;
}

- (void)setScrollDownView:(id)a3
{
}

- (SCATVisualScrollerView)scrollLeftView
{
  return self->_scrollLeftView;
}

- (void)setScrollLeftView:(id)a3
{
}

- (SCATVisualScrollerView)scrollRightView
{
  return self->_scrollRightView;
}

- (void)setScrollRightView:(id)a3
{
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (CALayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)scrollerContainerView
{
  return self->_scrollerContainerView;
}

- (void)setScrollerContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollerContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_scrollRightView, 0);
  objc_storeStrong((id *)&self->_scrollLeftView, 0);
  objc_storeStrong((id *)&self->_scrollDownView, 0);
  objc_storeStrong((id *)&self->_scrollUpView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end