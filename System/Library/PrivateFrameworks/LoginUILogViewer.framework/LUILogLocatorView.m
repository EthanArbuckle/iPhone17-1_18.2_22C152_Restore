@interface LUILogLocatorView
- (LUILogLocatorView)initWithFrame:(CGRect)a3;
- (UIButton)downArrowButton;
- (UIButton)screenshotButton;
- (UIButton)upArrowButton;
- (UICollectionView)screenshotCollectionView;
- (id)_createButtonWithImageName:(id)a3;
- (id)_createElementStackViewWithElements:(id)a3;
- (id)_createScreenshotCollectionView;
- (void)_setup;
- (void)handleOrientationChange:(int64_t)a3;
- (void)layoutSubviews;
- (void)setDownArrowButton:(id)a3;
- (void)setScreenshotButton:(id)a3;
- (void)setScreenshotCollectionView:(id)a3;
- (void)setUpArrowButton:(id)a3;
@end

@implementation LUILogLocatorView

- (LUILogLocatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LUILogLocatorView;
  v3 = -[LUILogLocatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LUILogLocatorView *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  id v3 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(LUILogLocatorView *)self layer];
  [v5 setBorderColor:v4];

  objc_super v6 = [(LUILogLocatorView *)self layer];
  [v6 setBorderWidth:1.5];

  v7 = [(LUILogLocatorView *)self layer];
  [v7 setCornerRadius:5.0];

  v8 = [(LUILogLocatorView *)self _createButtonWithImageName:@"UpArrowIcon"];
  upArrowButton = self->_upArrowButton;
  self->_upArrowButton = v8;

  v10 = [(LUILogLocatorView *)self _createButtonWithImageName:@"DownArrowIcon"];
  downArrowButton = self->_downArrowButton;
  self->_downArrowButton = v10;

  v12 = [(LUILogLocatorView *)self _createButtonWithImageName:@"CameraIcon"];
  screenshotButton = self->_screenshotButton;
  self->_screenshotButton = v12;

  v14 = [(LUILogLocatorView *)self _createScreenshotCollectionView];
  screenshotCollectionView = self->_screenshotCollectionView;
  self->_screenshotCollectionView = v14;

  [(LUILogLocatorView *)self addSubview:self->_screenshotCollectionView];
  [(LUILogLocatorView *)self addSubview:self->_upArrowButton];
  [(LUILogLocatorView *)self addSubview:self->_downArrowButton];
  v16 = self->_screenshotButton;

  [(LUILogLocatorView *)self addSubview:v16];
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)LUILogLocatorView;
  [(LUILogLocatorView *)&v42 layoutSubviews];
  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v4 = [v3 delegate];
  v5 = [v4 window];
  objc_super v6 = [v5 windowScene];
  uint64_t v7 = [v6 interfaceOrientation];

  [(LUILogLocatorView *)self bounds];
  double Width = CGRectGetWidth(v43);
  if ((unint64_t)(v7 - 1) > 1)
  {
    double v29 = Width * 0.5;
    [(LUILogLocatorView *)self bounds];
    CGFloat v30 = CGRectGetHeight(v51) + -20.0 + -25.0;
    v31 = [(LUILogLocatorView *)self downArrowButton];
    objc_msgSend(v31, "setCenter:", v29, v30);

    [(LUILogLocatorView *)self bounds];
    CGFloat v32 = CGRectGetWidth(v52) * 0.5;
    v33 = [(LUILogLocatorView *)self downArrowButton];
    [v33 frame];
    CGFloat v34 = CGRectGetMinY(v53) + -20.0 + -25.0;
    v35 = [(LUILogLocatorView *)self upArrowButton];
    objc_msgSend(v35, "setCenter:", v32, v34);

    [(LUILogLocatorView *)self bounds];
    CGFloat v36 = CGRectGetWidth(v54) * 0.5;
    v37 = [(LUILogLocatorView *)self upArrowButton];
    [v37 frame];
    CGFloat v38 = CGRectGetMinY(v55) + -20.0 + -25.0;
    v39 = [(LUILogLocatorView *)self screenshotButton];
    objc_msgSend(v39, "setCenter:", v36, v38);

    [(LUILogLocatorView *)self bounds];
    CGFloat v40 = (CGRectGetWidth(v56) + -130.0) * 0.5;
    v21 = [(LUILogLocatorView *)self screenshotButton];
    [v21 frame];
    CGFloat v41 = CGRectGetMinY(v57) + -10.0 + -20.0;
    v23 = [(LUILogLocatorView *)self screenshotCollectionView];
    v24 = v23;
    double v28 = 130.0;
    double v27 = 10.0;
    double v26 = v40;
    double v25 = v41;
  }
  else
  {
    double v9 = Width + -20.0 + -25.0;
    [(LUILogLocatorView *)self bounds];
    CGFloat v10 = CGRectGetHeight(v44) * 0.5;
    v11 = [(LUILogLocatorView *)self downArrowButton];
    objc_msgSend(v11, "setCenter:", v9, v10);

    v12 = [(LUILogLocatorView *)self downArrowButton];
    [v12 frame];
    CGFloat v13 = CGRectGetMinX(v45) + -20.0 + -25.0;
    [(LUILogLocatorView *)self bounds];
    CGFloat v14 = CGRectGetHeight(v46) * 0.5;
    v15 = [(LUILogLocatorView *)self upArrowButton];
    objc_msgSend(v15, "setCenter:", v13, v14);

    v16 = [(LUILogLocatorView *)self upArrowButton];
    [v16 frame];
    CGFloat v17 = CGRectGetMinX(v47) + -20.0 + -25.0;
    [(LUILogLocatorView *)self bounds];
    CGFloat v18 = CGRectGetHeight(v48) * 0.5;
    v19 = [(LUILogLocatorView *)self screenshotButton];
    objc_msgSend(v19, "setCenter:", v17, v18);

    [(LUILogLocatorView *)self bounds];
    CGFloat v20 = (CGRectGetHeight(v49) + -130.0) * 0.5;
    v21 = [(LUILogLocatorView *)self screenshotButton];
    [v21 frame];
    CGFloat v22 = CGRectGetMinX(v50) + -10.0 + -20.0;
    v23 = [(LUILogLocatorView *)self screenshotCollectionView];
    v24 = v23;
    double v25 = 130.0;
    double v26 = 10.0;
    double v27 = v20;
    double v28 = v22;
  }
  objc_msgSend(v23, "setFrame:", v26, v27, v28, v25);

  [(LUILogLocatorView *)self handleOrientationChange:v7];
}

- (void)handleOrientationChange:(int64_t)a3
{
  BOOL v4 = (unint64_t)(a3 - 1) < 2;
  id v5 = (id)objc_opt_new();
  [v5 setScrollDirection:v4];
  [(UICollectionView *)self->_screenshotCollectionView setCollectionViewLayout:v5];
}

- (id)_createElementStackViewWithElements:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1C9B8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithArrangedSubviews:v4];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAxis:0];
  [v5 setDistribution:3];
  [v5 setAlignment:3];

  return v5;
}

- (id)_createScreenshotCollectionView
{
  v2 = objc_opt_new();
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  id v4 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v5 = [MEMORY[0x263F1C550] grayColor];
  objc_super v6 = [v5 colorWithAlphaComponent:0.5];
  [v4 setBackgroundColor:v6];

  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"screenshotCell"];

  return v4;
}

- (id)_createButtonWithImageName:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1C488];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
  objc_super v6 = [MEMORY[0x263F1C6B0] imageNamed:v4];

  uint64_t v7 = [v6 imageWithRenderingMode:2];

  v8 = [MEMORY[0x263F1C550] whiteColor];
  double v9 = [v5 imageView];
  [v9 setTintColor:v8];

  [v5 setImage:v7 forState:0];
  CGFloat v10 = [v5 widthAnchor];
  v11 = [v10 constraintEqualToConstant:50.0];
  [v11 setActive:1];

  v12 = [v5 heightAnchor];
  CGFloat v13 = [v12 constraintEqualToConstant:50.0];
  [v13 setActive:1];

  return v5;
}

- (UIButton)upArrowButton
{
  return self->_upArrowButton;
}

- (void)setUpArrowButton:(id)a3
{
}

- (UIButton)downArrowButton
{
  return self->_downArrowButton;
}

- (void)setDownArrowButton:(id)a3
{
}

- (UIButton)screenshotButton
{
  return self->_screenshotButton;
}

- (void)setScreenshotButton:(id)a3
{
}

- (UICollectionView)screenshotCollectionView
{
  return self->_screenshotCollectionView;
}

- (void)setScreenshotCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotCollectionView, 0);
  objc_storeStrong((id *)&self->_screenshotButton, 0);
  objc_storeStrong((id *)&self->_downArrowButton, 0);

  objc_storeStrong((id *)&self->_upArrowButton, 0);
}

@end