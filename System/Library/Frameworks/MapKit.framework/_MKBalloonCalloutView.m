@interface _MKBalloonCalloutView
- (BOOL)calloutContainsPoint:(CGPoint)a3;
- (BOOL)originatesAsSmallBalloon;
- (BOOL)showsArrow;
- (CGRect)_centerFrame;
- (CGRect)_idealFrame;
- (CGSize)intrinsicContentSize;
- (UIColor)balloonTintColor;
- (UIColor)imageTintColor;
- (UIColor)innerStrokeColor;
- (UIColor)strokeColor;
- (UIImage)image;
- (UIView)contentView;
- (_MKBalloonCalloutView)initWithAnnotationView:(id)a3;
- (_MKBalloonCalloutView)initWithStyle:(int64_t)a3;
- (double)_innerDiameter;
- (double)smallBalloonScale;
- (int64_t)style;
- (void)_commonInit;
- (void)_configureForArrowStateWithDuration:(double)a3;
- (void)_handleTapOnCallout:(id)a3;
- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_showAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)_startObservingAnnotationView;
- (void)_stopObservingAnnotationView;
- (void)_updateCroppedImage;
- (void)_updateStyle;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)hideCalloutAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)layoutSubviews;
- (void)setBalloonTintColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setInnerStrokeColor:(id)a3;
- (void)setOriginatesAsSmallBalloon:(BOOL)a3;
- (void)setShowsArrow:(BOOL)a3;
- (void)setShowsArrow:(BOOL)a3 animated:(BOOL)a4;
- (void)setSmallBalloonScale:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)showCalloutAnimated:(BOOL)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateWithNewCalloutOffset;
@end

@implementation _MKBalloonCalloutView

- (_MKBalloonCalloutView)initWithAnnotationView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MKBalloonCalloutView;
  v3 = [(MKCalloutView *)&v6 initWithAnnotationView:a3];
  v4 = v3;
  if (v3) {
    [(_MKBalloonCalloutView *)v3 _commonInit];
  }
  return v4;
}

- (_MKBalloonCalloutView)initWithStyle:(int64_t)a3
{
  return [(_MKBalloonCalloutView *)self initWithAnnotationView:0];
}

- (void)dealloc
{
  [(_MKBalloonCalloutView *)self _stopObservingAnnotationView];
  v3.receiver = self;
  v3.super_class = (Class)_MKBalloonCalloutView;
  [(_MKBalloonCalloutView *)&v3 dealloc];
}

- (void)_commonInit
{
  objc_super v3 = [(MKCalloutView *)self annotationView];
  if ([v3 conformsToProtocol:&unk_1ED9DF828])
  {
    [(_MKBalloonCalloutView *)self _startObservingAnnotationView];
    self->_int64_t style = [v3 _balloonCalloutStyle];
    v4 = [MEMORY[0x1E4F428B8] whiteColor];
    strokeColor = self->_strokeColor;
    self->_strokeColor = v4;

    self->_showsArrow = 1;
    if (objc_opt_respondsToSelector())
    {
      objc_super v6 = [v3 _balloonImageTintColor];
      v7 = (UIColor *)[v6 copy];
      imageTintColor = self->_imageTintColor;
      self->_imageTintColor = v7;
    }
    if (objc_opt_respondsToSelector()) {
      self->_centerAnnotationWhenOffscreen = [v3 _balloonCalloutShouldCenterWhenOffscreen];
    }
    id v9 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v10 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    containerView = self->_containerView;
    self->_containerView = v10;

    v12 = [(_MKBalloonCalloutView *)self layer];
    objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);

    v13 = [(UIView *)self->_containerView layer];
    objc_msgSend(v13, "setAnchorPoint:", 0.5, 1.0);

    unint64_t v14 = 0x1E4F42000uLL;
    if (self->_style == 1)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"rectangle_balloon_shadow");
      [v15 size];
      self->_shadowSize.width = v16;
      self->_shadowSize.height = v17;
      [v15 scale];
      double v19 = v18;
      id v20 = v15;
      v21 = (CGImage *)[v20 CGImage];
      v87.size.width = v19 * self->_shadowSize.width * 0.5;
      v87.size.height = v19 * self->_shadowSize.height;
      v87.origin.x = 0.0;
      v87.origin.y = 0.0;
      v22 = CGImageCreateWithImageInRect(v21, v87);
      v88.origin.x = v19 * self->_shadowSize.width * 0.5;
      v88.size.height = v19 * self->_shadowSize.height;
      v88.origin.y = 0.0;
      v88.size.width = v88.origin.x;
      v23 = CGImageCreateWithImageInRect(v21, v88);
      v24 = objc_opt_new();
      [v24 setContents:v22];
      [v24 setContentsScale:v19];
      objc_msgSend(v24, "setContentsCenter:", 0.589999974, 0.0, 0.00999999978, 1.0);
      v25 = objc_opt_new();
      [v25 setContents:v23];
      [v25 setContentsScale:v19];
      objc_msgSend(v25, "setContentsCenter:", 0.400000006, 0.0, 0.00999999978, 1.0);
      CGImageRelease(v22);
      CGImageRelease(v23);
      v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, self->_shadowSize.width, self->_shadowSize.height);
      v27 = [(UIView *)v26 layer];
      [v27 addSublayer:v24];

      v28 = [(UIView *)v26 layer];
      [v28 addSublayer:v25];

      shadowView = self->_shadowView;
      self->_shadowView = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"balloon_shadow");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      [v20 size];
      self->_shadowSize.width = v33;
      self->_shadowSize.height = v34;
      v35 = (UIView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v20];
      v24 = self->_shadowView;
      self->_shadowView = v35;
    }

    v36 = [(UIView *)self->_shadowView layer];
    objc_msgSend(v36, "setAnchorPoint:", 0.5, 1.0);

    [(UIView *)self->_shadowView _mapkit_sizeToFit];
    [(_MKBalloonCalloutView *)self addSubview:self->_shadowView];
    v37 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"balloon_tail");
    v38 = [v37 _flatImageWithColor:self->_strokeColor];

    v39 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v38];
    tailView = self->_tailView;
    self->_tailView = v39;

    [(UIImageView *)self->_tailView _mapkit_sizeToFit];
    switch(self->_style)
    {
      case 0:
      case 2:
        v41 = [[_MKBezierPathView alloc] initWithBalloonRadius:1 tailLength:30.0 smoothTailTransition:6.0];
        backgroundShapeView = self->_backgroundShapeView;
        self->_backgroundShapeView = v41;

        v43 = [(_MKBezierPathView *)self->_backgroundShapeView layer];
        objc_msgSend(v43, "setShadowOffset:", 0.0, 4.0);

        v44 = [(_MKBezierPathView *)self->_backgroundShapeView layer];
        [v44 setShadowRadius:4.0];

        v45 = [(_MKBezierPathView *)self->_backgroundShapeView layer];
        [v45 setShadowOpacity:0.0];

        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v3 _balloonMaterial], (uint64_t v46 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v47 = (void *)v46;
          v48 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v46];
          backgroundVisualEffectView = self->_backgroundVisualEffectView;
          self->_backgroundVisualEffectView = v48;

          [(_MKBezierPathView *)self->_backgroundShapeView frame];
          -[UIVisualEffectView setFrame:](self->_backgroundVisualEffectView, "setFrame:");
          [(UIVisualEffectView *)self->_backgroundVisualEffectView setMaskView:self->_backgroundShapeView];
          objc_storeStrong((id *)&self->_backgroundView, self->_backgroundVisualEffectView);
        }
        else
        {
          objc_storeStrong((id *)&self->_backgroundView, self->_backgroundShapeView);
          [(_MKBezierPathView *)self->_backgroundShapeView setFillColor:self->_strokeColor];
        }
        [(UIView *)self->_containerView addSubview:self->_backgroundView];
        unint64_t v14 = 0x1E4F42000;
        break;
      case 1:
        id v50 = objc_alloc(MEMORY[0x1E4F42AA0]);
        v51 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"square_balloon_mask");
        v52 = (UIImageView *)[v50 initWithImage:v51];
        balloonBodyImageView = self->_balloonBodyImageView;
        self->_balloonBodyImageView = v52;

        -[UIImageView setFrame:](self->_balloonBodyImageView, "setFrame:", 0.0, 0.0, 60.0, 60.0);
        [(UIImageView *)self->_balloonBodyImageView setTintColor:self->_strokeColor];
        [(UIView *)self->_containerView addSubview:self->_balloonBodyImageView];
        backgroundView = (_MKMarkerAnnotationBaseImageView *)self->_tailView;
        v55 = self;
        goto LABEL_19;
      case 3:
        v56 = [[_MKMarkerAnnotationBaseImageView alloc] initWithBalloonRadius:30.0 tailLength:6.0];
        backgroundShapeGradientView = self->_backgroundShapeGradientView;
        self->_backgroundShapeGradientView = v56;

        objc_storeStrong((id *)&self->_backgroundView, self->_backgroundShapeGradientView);
        v55 = (_MKBalloonCalloutView *)self->_containerView;
        backgroundView = (_MKMarkerAnnotationBaseImageView *)self->_backgroundView;
        goto LABEL_19;
      case 4:
        v58 = [_MKMarkerAnnotationBaseImageView alloc];
        v59 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"rectaloon_asset");
        v60 = [(_MKMarkerAnnotationBaseImageView *)v58 initWithImage:v59];
        rectangularImageView = self->_rectangularImageView;
        self->_rectangularImageView = v60;

        -[_MKMarkerAnnotationBaseImageView setFrame:](self->_rectangularImageView, "setFrame:", 0.0, 0.0, 60.0, 66.0);
        v55 = (_MKBalloonCalloutView *)self->_containerView;
        backgroundView = self->_rectangularImageView;
LABEL_19:
        [(_MKBalloonCalloutView *)v55 addSubview:backgroundView];
        break;
      default:
        break;
    }
    [(UIImageView *)self->_tailView frame];
    -[UIImageView setFrame:](self->_tailView, "setFrame:", 30.0 - v62 * 0.5, 59.0);
    [(_MKBalloonCalloutView *)self _innerDiameter];
    double v64 = v63;
    double v65 = (60.0 - v63) * 0.5;
    int64_t style = self->_style;
    if ((unint64_t)(style - 2) >= 2 && style)
    {
      if (style == 1)
      {
        id v67 = objc_alloc(*(Class *)(v14 + 2720));
        v68 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"square_balloon_inner_mask");
        v69 = (UIView *)[v67 initWithImage:v68];

        -[UIView setFrame:](v69, "setFrame:", v65, v65, v64, v64);
        innerBackgroundView = self->_innerBackgroundView;
        self->_innerBackgroundView = v69;
      }
    }
    else
    {
      v71 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v65, v65, v63, v63);
      v72 = self->_innerBackgroundView;
      self->_innerBackgroundView = v71;

      v73 = [(UIView *)self->_innerBackgroundView layer];
      [v73 setMasksToBounds:1];

      v74 = [(UIView *)self->_innerBackgroundView layer];
      [v74 setCornerRadius:floor(v64 * 0.5)];
    }
    [(UIView *)self->_containerView addSubview:self->_innerBackgroundView];
    v75 = (UIImageView *)objc_msgSend(objc_alloc(*(Class *)(v14 + 2720)), "initWithFrame:", v65, v65, v64, v64);
    imageView = self->_imageView;
    self->_imageView = v75;

    [(UIImageView *)self->_imageView setContentMode:2];
    [(UIView *)self->_containerView addSubview:self->_imageView];
    [(_MKBalloonCalloutView *)self addSubview:self->_containerView];
    unint64_t v77 = self->_style;
    double MaxX = 0.0;
    if (v77 <= 4
      && ([*(id *)((char *)&self->super.super.super.super.isa + *off_1E54BC490[v77]) frame],
          double MaxX = CGRectGetMaxX(v89),
          self->_style == 4))
    {
      v79 = self->_rectangularImageView;
    }
    else
    {
      v79 = (_MKMarkerAnnotationBaseImageView *)self->_tailView;
    }
    [(_MKMarkerAnnotationBaseImageView *)v79 frame];
    CGFloat MaxY = CGRectGetMaxY(v90);
    self->_intrinsicSize.width = MaxX;
    self->_intrinsicSize.height = MaxY;
    [(_MKBalloonCalloutView *)self frame];
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    -[UIView setFrame:](self->_containerView, "setFrame:", 0.0, 0.0, MaxX, 60.0);
    [(UIView *)self _mapkit_setNeedsLayout];
    uint64_t v86 = 0x3FF0000000000000;
    char v81 = objc_opt_respondsToSelector();
    double v82 = 1.0;
    if (v81)
    {
      -[_MKBalloonCalloutView setOriginatesAsSmallBalloon:](self, "setOriginatesAsSmallBalloon:", objc_msgSend(v3, "_balloonCalloutShouldOriginateFromSmallSize:", &v86, 1.0));
      double v82 = *(double *)&v86;
    }
    [(_MKBalloonCalloutView *)self setSmallBalloonScale:v82];
    if (objc_opt_respondsToSelector()) {
      -[_MKBalloonCalloutView setShowsArrow:animated:](self, "setShowsArrow:animated:", [v3 _balloonCalloutShouldShowArrow], 0);
    }
    v83 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapOnCallout_];
    [(_MKBalloonCalloutView *)self addGestureRecognizer:v83];
    [(_MKBalloonCalloutView *)self _updateStyle];
    v84 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
    id v85 = (id)[(_MKBalloonCalloutView *)self registerForTraitChanges:v84 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  else
  {
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = NSStringFromProtocol((Protocol *)&unk_1ED9DF828);
    NSLog(&cfstr_DoesNotConform.isa, v31, v32);
  }
}

- (void)_startObservingAnnotationView
{
  objc_super v3 = [(MKCalloutView *)self annotationView];
  if (v3)
  {
    kvoProxy = self->_kvoProxy;
    id obj = v3;
    if (!kvoProxy)
    {
      v5 = [[_MKKVOProxy alloc] initWithDelegate:self];
      objc_super v6 = self->_kvoProxy;
      self->_kvoProxy = v5;

      kvoProxy = self->_kvoProxy;
    }
    [(_MKKVOProxy *)kvoProxy addObserverForObject:obj forKeyPath:@"balloonImage" options:0 context:0];
    [(_MKKVOProxy *)self->_kvoProxy addObserverForObject:obj forKeyPath:@"balloonImageTintColor" options:0 context:0];
    objc_storeStrong((id *)&self->_observedAnnotationView, obj);
    objc_super v3 = obj;
  }
}

- (void)_stopObservingAnnotationView
{
  observedAnnotationView = self->_observedAnnotationView;
  if (observedAnnotationView)
  {
    kvoProxy = self->_kvoProxy;
    objc_super v6 = observedAnnotationView;
    [(_MKKVOProxy *)kvoProxy removeObserverForObject:v6 forKeyPath:@"balloonImage"];
    [(_MKKVOProxy *)self->_kvoProxy removeObserverForObject:v6 forKeyPath:@"balloonImageTintColor"];
    v5 = self->_observedAnnotationView;
    self->_observedAnnotationView = 0;
  }
}

- (void)_updateStyle
{
  id v18 = [(MKCalloutView *)self annotationView];
  if ([v18 conformsToProtocol:&unk_1ED9DF828])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v18 _balloonContentView], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v3;
      [(_MKBalloonCalloutView *)self setContentView:v3];
    }
    else
    {
      v4 = [v18 _balloonImage];
      [(_MKBalloonCalloutView *)self setImage:v4];
    }

    int64_t style = self->_style;
    if (style == 4)
    {
      rectangularImageView = self->_rectangularImageView;
      v15 = [_MKMarkerAnnotationBaseImageContent alloc];
      objc_super v6 = [v18 _balloonTintColor];
      v7 = [v18 _balloonStrokeColor];
      CGFloat v16 = [(_MKMarkerAnnotationBaseImageContent *)v15 initWithFillColor:v6 strokeColor:v7 strokeWidth:3 blendMode:6 baseImageType:0.0];
      [(_MKMarkerAnnotationBaseImageView *)rectangularImageView _setBaseImageContent:v16];
    }
    else if (style == 3)
    {
      backgroundShapeGradientView = self->_backgroundShapeGradientView;
      v10 = [_MKMarkerAnnotationBaseImageContent alloc];
      objc_super v6 = [v18 _balloonTintColor];
      v7 = [v18 _balloonStrokeColor];
      v11 = [v18 _balloonStrokeColor];
      double v12 = 0.5;
      if (!v11) {
        double v12 = 0.0;
      }
      v13 = [(_MKMarkerAnnotationBaseImageContent *)v10 initWithFillColor:v6 strokeColor:v7 strokeWidth:3 blendMode:5 baseImageType:v12];
      [(_MKMarkerAnnotationBaseImageView *)backgroundShapeGradientView _setBaseImageContent:v13];
    }
    else
    {
      objc_super v6 = [v18 _balloonTintColor];
      [(_MKBalloonCalloutView *)self setBalloonTintColor:v6];
      CGFloat v17 = [v18 _balloonStrokeColor];
      [(_MKBalloonCalloutView *)self setStrokeColor:v17];

      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_16;
      }
      v7 = [v18 _balloonInnerStrokeColor];
      [(_MKBalloonCalloutView *)self setInnerStrokeColor:v7];
    }
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    v7 = NSStringFromProtocol((Protocol *)&unk_1ED9DF828);
    NSLog(&cfstr_DoesNotConform.isa, v6, v7);
  }

LABEL_16:
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(_MKBalloonCalloutView *)self traitCollection];
  int v7 = [v6 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v7)
  {
    [(_MKBalloonCalloutView *)self _updateStyle];
  }
}

- (void)_handleTapOnCallout:(id)a3
{
  id v8 = [(MKCalloutView *)self annotationView];
  v4 = [v8 _mapView];
  id v5 = [(MKCalloutView *)self annotationView];
  objc_super v6 = [v5 _annotationContainer];
  int v7 = [(MKCalloutView *)self annotationView];
  [v4 annotationContainer:v6 calloutPrimaryActionTriggeredForAnnotationView:v7];
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)_centerFrame
{
  [(UIView *)self->_innerBackgroundView frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_innerDiameter
{
  double result = *(double *)&_MKBalloonCalloutInnerDiameterUserLocation;
  if (self->_style != 2) {
    return 56.0;
  }
  return result;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)_MKBalloonCalloutView;
  [(_MKBalloonCalloutView *)&v19 layoutSubviews];
  if (self->_style == 1)
  {
    CGFloat v3 = self->_shadowSize.width + -60.0;
    double v4 = self->_intrinsicSize.height - self->_shadowSize.height + 8.0;
    double v5 = v3 * -0.5;
    double width = v3 + self->_intrinsicSize.width;
  }
  else
  {
    double width = self->_shadowSize.width;
    double v5 = self->_intrinsicSize.width * 0.5 - width * 0.5;
    double v4 = self->_intrinsicSize.height - self->_shadowSize.height + 11.0;
  }
  -[UIView setFrame:](self->_shadowView, "setFrame:", v5, v4, width);
  if (self->_contentView)
  {
    [(_MKBalloonCalloutView *)self _centerFrame];
    -[UIView setFrame:](self->_contentView, "setFrame:");
  }
  if (self->_style == 1)
  {
    int v7 = [(UIView *)self->_shadowView layer];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;

    double v12 = [(UIView *)self->_shadowView layer];
    v13 = [v12 sublayers];
    unint64_t v14 = [v13 objectAtIndexedSubscript:0];
    double v15 = v9 * 0.5;
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v15, v11);

    CGFloat v16 = [(UIView *)self->_shadowView layer];
    CGFloat v17 = [v16 sublayers];
    id v18 = [v17 objectAtIndexedSubscript:1];
    objc_msgSend(v18, "setFrame:", v15, 0.0, v15, v11);
  }
  [(UIImageView *)self->_tailView frame];
  -[UIImageView setFrame:](self->_tailView, "setFrame:");
}

- (void)setStrokeColor:(id)a3
{
  id v9 = a3;
  double v4 = (UIColor *)[v9 copy];
  strokeColor = self->_strokeColor;
  self->_strokeColor = v4;

  objc_super v6 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"balloon_tail");
  int v7 = [v6 _flatImageWithColor:self->_strokeColor];

  [(UIImageView *)self->_tailView setImage:v7];
  [(UIImageView *)self->_balloonBodyImageView setTintColor:self->_strokeColor];
  if (v9) {
    double v8 = 0.5;
  }
  else {
    double v8 = 0.0;
  }
  -[_MKBezierPathView setStrokeColor:width:](self->_backgroundShapeView, "setStrokeColor:width:", v8);
  if (!self->_innerStrokeColor) {
    [(_MKBezierPathView *)self->_backgroundShapeView setFillColor:self->_strokeColor];
  }
}

- (void)setInnerStrokeColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_innerStrokeColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_innerStrokeColor, a3);
    -[_MKBezierPathView setFillColor:](self->_backgroundShapeView, "setFillColor:");
    double v5 = v6;
  }
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView == v5) {
    goto LABEL_11;
  }
  v31 = v5;
  [(UIView *)contentView removeFromSuperview];
  contentViewMaskView = self->_contentViewMaskView;
  self->_contentViewMaskView = 0;

  objc_storeStrong((id *)&self->_contentView, a3);
  double v5 = v31;
  if (!v31) {
    goto LABEL_11;
  }
  int64_t style = self->_style;
  if ((unint64_t)(style - 2) >= 2)
  {
    if (style == 1)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F42AA0]);
      CGFloat v16 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"square_balloon_inner_mask");
      CGFloat v17 = (UIImageView *)[v15 initWithImage:v16];
      id v18 = self->_contentViewMaskView;
      self->_contentViewMaskView = v17;

      -[UIImageView setFrame:](self->_contentViewMaskView, "setFrame:", 0.0, 0.0, 60.0, 60.0);
      double v11 = [(UIImageView *)self->_contentViewMaskView layer];
      unint64_t v14 = [(UIView *)v31 layer];
      [v14 setMask:v11];
      goto LABEL_8;
    }
    if (style) {
      goto LABEL_9;
    }
  }
  double v10 = [(UIView *)v31 layer];
  [v10 setMasksToBounds:1];

  double v11 = [(UIView *)self->_innerBackgroundView layer];
  [v11 cornerRadius];
  double v13 = v12;
  unint64_t v14 = [(UIView *)v31 layer];
  [v14 setCornerRadius:v13];
LABEL_8:

LABEL_9:
  [(UIView *)self->_containerView _mapkit_insertSubviewAboveAllOtherSubviews:v31];
  [(_MKBalloonCalloutView *)self _innerDiameter];
  double v5 = v31;
  if (self->_style == 1)
  {
    double v20 = v19;
    [(UIView *)v31 _mapkit_fittingSize];
    double v22 = v21;
    -[UIImageView setFrame:](self->_balloonBodyImageView, "setFrame:", 0.0, 0.0, 60.0 - v20 + v21, 60.0);
    [(UIImageView *)self->_tailView frame];
    double v24 = v23;
    double v26 = v25;
    [(UIImageView *)self->_balloonBodyImageView frame];
    -[UIImageView setFrame:](self->_tailView, "setFrame:", CGRectGetMidX(v33) - v24 * 0.5, 59.0, v24, v26);
    -[UIView setFrame:](self->_innerBackgroundView, "setFrame:", (60.0 - v20) * 0.5, (60.0 - v20) * 0.5, v22, v20);
    [(UIView *)*p_contentView bounds];
    -[UIView setFrame:](*p_contentView, "setFrame:", round((60.0 - v20) * 0.5 + (v22 - v27) * 0.5), round((60.0 - v20) * 0.5 + (v20 - v28) * 0.5));
    -[UIView convertRect:fromView:](*p_contentView, "convertRect:fromView:", self, (60.0 - v20) * 0.5, (60.0 - v20) * 0.5, v22, v20);
    -[UIImageView setFrame:](self->_contentViewMaskView, "setFrame:");
    [(UIImageView *)self->_balloonBodyImageView frame];
    CGFloat MaxX = CGRectGetMaxX(v34);
    [(UIImageView *)self->_tailView frame];
    CGFloat MaxY = CGRectGetMaxY(v35);
    self->_intrinsicSize.double width = MaxX;
    self->_intrinsicSize.double height = MaxY;
    [(_MKBalloonCalloutView *)self frame];
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    [(UIImageView *)self->_balloonBodyImageView frame];
    -[UIView setFrame:](self->_containerView, "setFrame:", 0.0, 0.0, CGRectGetMaxX(v36), 60.0);
    [(UIView *)self _mapkit_setNeedsLayout];
    double v5 = v31;
  }
LABEL_11:
}

- (void)setShowsArrow:(BOOL)a3
{
}

- (void)_configureForArrowStateWithDuration:(double)a3
{
  BOOL showsArrow = self->_showsArrow;
  objc_super v6 = [(_MKBalloonCalloutView *)self layer];
  int v7 = v6;
  if (showsArrow)
  {
    objc_msgSend(v6, "setAnchorPoint:", 0.5, 1.0);

    [(_MKBalloonCalloutView *)self _idealFrame];
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    double v8 = +[_MKBezierPathView _createSmoothTransitionPathForBalloonRadius:30.0 tailLength:6.0];
    [(_MKBezierPathView *)self->_backgroundShapeView setPath:v8 duration:a3];
    CGPathRelease(v8);
    [(UIView *)self->_shadowView setAlpha:1.0];
    backgroundView = self->_backgroundView;
    if (!backgroundView) {
      return;
    }
    double v10 = [(UIView *)backgroundView layer];
    double v11 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.5);

    [(_MKBalloonCalloutView *)self _idealFrame];
    -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
    double v12 = +[_MKBezierPathView _createPathForBalloonRadius:30.0 tailLength:0.0];
    [(_MKBezierPathView *)self->_backgroundShapeView setPath:v12 duration:a3];
    CGPathRelease(v12);
    [(UIView *)self->_shadowView setAlpha:0.0];
    double v13 = self->_backgroundView;
    if (!v13) {
      return;
    }
    double v10 = [(UIView *)v13 layer];
    LODWORD(v11) = 1045220557;
  }
  id v14 = v10;
  [v10 setShadowOpacity:v11];
}

- (void)setShowsArrow:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsArrow != a3)
  {
    self->_BOOL showsArrow = a3;
    if (a4)
    {
      uint64_t v5 = [MEMORY[0x1E4F39CF8] disableActions];
      [MEMORY[0x1E4F39CF8] setDisableActions:0];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48___MKBalloonCalloutView_setShowsArrow_animated___block_invoke;
      v6[3] = &unk_1E54B81B0;
      v6[4] = self;
      v6[5] = 0x3FD0000000000000;
      objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v6, 0, 0.25);
      [MEMORY[0x1E4F39CF8] setDisableActions:v5];
    }
    else
    {
      [(_MKBalloonCalloutView *)self _configureForArrowStateWithDuration:0.0];
      [(UIView *)self _mapkit_setNeedsLayout];
    }
  }
}

- (CGRect)_idealFrame
{
  CGFloat v3 = [(MKCalloutView *)self annotationView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(MKCalloutView *)self annotationView];
  [v12 calloutOffset];
  double v14 = v13;

  if (self->_showsArrow) {
    [(_MKBalloonCalloutView *)self frame];
  }
  else {
    double v15 = 30.0;
  }
  double v16 = round(v14 - v15);
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  double MidX = CGRectGetMidX(v25);
  [(_MKBalloonCalloutView *)self frame];
  double v18 = round(MidX + CGRectGetWidth(v26) * -0.5);
  [(_MKBalloonCalloutView *)self frame];
  double v20 = v19;
  [(_MKBalloonCalloutView *)self frame];
  double v22 = v18;
  double v23 = v16;
  double v24 = v20;
  result.size.double height = v21;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)updateWithNewCalloutOffset
{
  [(_MKBalloonCalloutView *)self _idealFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_MKBalloonCalloutView *)self frame];
  v18.origin.x = v11;
  v18.origin.y = v12;
  v18.size.double width = v13;
  v18.size.double height = v14;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  if (!CGRectEqualToRect(v17, v18))
  {
    uint64_t v15 = [MEMORY[0x1E4F39CF8] disableActions];
    [MEMORY[0x1E4F39CF8] setDisableActions:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51___MKBalloonCalloutView_updateWithNewCalloutOffset__block_invoke;
    v16[3] = &unk_1E54B8188;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v16, 0, 0.25);
    [MEMORY[0x1E4F39CF8] setDisableActions:v15];
  }
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);

  [(_MKBalloonCalloutView *)self _updateCroppedImage];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_MKBalloonCalloutView;
  [(_MKBalloonCalloutView *)&v4 didMoveToWindow];
  [(_MKBalloonCalloutView *)self _currentScreenScale];
  if (vabdd_f64(v3, self->_croppedImageScale) >= 0.000001) {
    [(_MKBalloonCalloutView *)self _updateCroppedImage];
  }
}

- (void)_updateCroppedImage
{
  double v3 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  objc_super v4 = [(_MKBalloonCalloutView *)self traitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v4];

  [(_MKBalloonCalloutView *)self _currentScreenScale];
  double v6 = v5;
  [(_MKBalloonCalloutView *)self _innerDiameter];
  CGFloat v8 = v7;
  size_t v9 = vcvtpd_u64_f64(v6 * v7);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  CGFloat v12 = CGBitmapContextCreate(0, v9, v9, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.double width = v8;
  v24.size.double height = v8;
  CGContextClearRect(v12, v24);
  CGContextScaleCTM(v12, v6, v6);
  CGContextGetCTM(&v23, v12);
  CGContextSetBaseCTM();
  switch(self->_style)
  {
    case 0:
    case 2:
    case 3:
      v25.origin.x = 0.0;
      v25.origin.y = 0.0;
      v25.size.double width = v8;
      v25.size.double height = v8;
      CGFloat v13 = CGPathCreateWithEllipseInRect(v25, 0);
      CGContextAddPath(v12, v13);
      CGContextClip(v12);
      CGPathRelease(v13);
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"square_balloon_inner_mask");
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v15 = (CGImage *)[v14 CGImage];
      v26.origin.x = 0.0;
      v26.origin.y = 0.0;
      v26.size.double width = v8;
      v26.size.double height = v8;
      CGContextClipToMask(v12, v26, v15);

      break;
    default:
      break;
  }
  double v16 = [(UIImage *)self->_image CGImage];
  double v17 = ((double)v9 - (double)CGImageGetWidth(v16)) * 0.5;
  double v18 = ((double)v9 - (double)CGImageGetHeight(v16)) * 0.5;
  double Width = (double)CGImageGetWidth(v16);
  double Height = (double)CGImageGetHeight(v16);
  CGContextResetCTM();
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.double width = Width;
  v27.size.double height = Height;
  CGContextDrawImage(v12, v27, v16);
  if (self->_imageTintColor)
  {
    CGContextSaveGState(v12);
    CGContextSetBlendMode(v12, kCGBlendModeSourceIn);
    CGContextSetFillColorWithColor(v12, [(UIColor *)self->_imageTintColor CGColor]);
    v28.origin.x = v17;
    v28.origin.y = v18;
    v28.size.double width = Width;
    v28.size.double height = Height;
    CGContextFillRect(v12, v28);
    CGContextRestoreGState(v12);
  }
  Image = CGBitmapContextCreateImage(v12);
  double v22 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:v6];
  [(UIImageView *)self->_imageView setImage:v22];
  self->_croppedImageScale = v6;
  CGContextRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGImageRelease(Image);
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v3];
}

- (void)setBalloonTintColor:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_balloonTintColor] & 1) == 0)
  {
    objc_super v4 = (UIColor *)[v7 copy];
    balloonTintColor = self->_balloonTintColor;
    self->_balloonTintColor = v4;

    int64_t style = self->_style;
    if (style == 2)
    {
LABEL_5:
      [(UIView *)self->_innerBackgroundView setBackgroundColor:self->_balloonTintColor];
      goto LABEL_7;
    }
    if (style != 1)
    {
      if (style) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }
    [(UIView *)self->_innerBackgroundView setTintColor:self->_balloonTintColor];
  }
LABEL_7:
}

- (void)showCalloutAnimated:(BOOL)a3
{
}

- (void)hideCalloutAnimated:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_centerAnnotationWhenOffscreen || !v4)
  {
    [(_MKBalloonCalloutView *)self _showAnimated:v4 completionBlock:v6];
  }
  else
  {
    CGFloat v8 = [(MKCalloutView *)self annotationView];
    size_t v9 = [v8 _containerView];
    [v9 _visibleCenteringRectInView:v8];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    [(_MKBalloonCalloutView *)self _idealFrame];
    v35.origin.x = v18;
    v35.origin.y = v19;
    v35.size.double width = v20;
    v35.size.double height = v21;
    v34.origin.x = v11;
    v34.origin.y = v13;
    v34.size.double width = v15;
    v34.size.double height = v17;
    if (CGRectContainsRect(v34, v35))
    {
      [(_MKBalloonCalloutView *)self _showAnimated:1 completionBlock:v6];
    }
    else
    {
      CGAffineTransform v23 = [v8 _mapView];
      CGRect v24 = [v8 _containerView];
      CGRect v25 = [(MKCalloutView *)self annotationView];
      CGRect v26 = [v25 annotation];
      [v26 coordinate];
      double v28 = v27;
      double v30 = v29;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __54___MKBalloonCalloutView_showAnimated_completionBlock___block_invoke;
      v31[3] = &unk_1E54BC470;
      v31[4] = self;
      BOOL v33 = v4;
      id v32 = v6;
      objc_msgSend(v23, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v24, v31, 1.79769313e308, 1.79769313e308, v28, v30);
    }
  }
}

- (void)_showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  v43[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  id v7 = [(MKCalloutView *)self annotationView];
  [v7 addSubview:self];
  [v7 calloutOffset];
  double v9 = v8;
  [(_MKBalloonCalloutView *)self _idealFrame];
  -[_MKBalloonCalloutView setFrame:](self, "setFrame:");
  double v10 = [(_MKBalloonCalloutView *)self layer];
  LODWORD(v11) = 1.0;
  [v10 setOpacity:v11];

  double v12 = [(_MKBalloonCalloutView *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (v13 == 3)
  {
    CGAffineTransformMakeScale(&v42, 0.75, 0.75);
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v42.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v42.c = v14;
    *(_OWORD *)&v42.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  CGAffineTransform v41 = v42;
  [(_MKBalloonCalloutView *)self setTransform:&v41];
  memset(&v40, 0, sizeof(v40));
  if (v13 == 3)
  {
    CATransform3DMakeScale(&v40, 0.75, 0.75, 1.0);
    if (!v4)
    {
LABEL_6:
      v6[2](v6);
      goto LABEL_15;
    }
  }
  else
  {
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v40.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v40.m33 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v40.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v40.m43 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v40.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v40.m13 = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v40.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v40.m23 = v18;
    if (!v4) {
      goto LABEL_6;
    }
  }
  BOOL originatesAsSmallBalloon = self->_originatesAsSmallBalloon;
  CGFloat v20 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  [v20 setMass:3.0];
  [v20 setStiffness:1940.0];
  [v20 setDamping:91.4000015];
  [v20 setInitialVelocity:0.0];
  memset(&v39, 0, sizeof(v39));
  if (originatesAsSmallBalloon)
  {
    CATransform3DMakeScale(&v39, self->_smallBalloonScale, self->_smallBalloonScale, 1.0);
    CATransform3D v37 = v39;
    CATransform3DTranslate(&v38, &v37, 0.0, v9 + 2.0, 0.0);
    CATransform3D v39 = v38;
    CGFloat v21 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v38];
    [v20 setFromValue:v21];

    CATransform3D v38 = v40;
    double v22 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v38];
    [v20 setToValue:v22];

    [v20 settlingDuration];
    objc_msgSend(v20, "setDuration:");
    CGAffineTransform v23 = [(_MKBalloonCalloutView *)self layer];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke;
    v35[3] = &unk_1E54B9388;
    v35[4] = self;
    CGRect v36 = v6;
    objc_msgSend(v23, "_mapkit_addAnimation:forKey:completion:", v20, @"show", v35);
  }
  else
  {
    CATransform3DMakeScale(&v39, 0.100000001, 0.100000001, 1.0);
    CATransform3D v37 = v39;
    CATransform3DTranslate(&v38, &v37, 0.0, -v9, 0.0);
    CATransform3D v39 = v38;
    CGRect v24 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v38];
    [v20 setFromValue:v24];

    CATransform3D v38 = v40;
    CGRect v25 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v38];
    [v20 setToValue:v25];

    CGRect v26 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v26 setFromValue:&unk_1ED97E7D8];
    [v26 setToValue:&unk_1ED97E7F0];
    [v26 setDuration:0.24];
    double v27 = [MEMORY[0x1E4F39B38] animation];
    [v27 setRemovedOnCompletion:1];
    [v20 settlingDuration];
    objc_msgSend(v27, "setDuration:");
    double v28 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v27 setTimingFunction:v28];

    v43[0] = v20;
    v43[1] = v26;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    [v27 setAnimations:v29];

    double v30 = [(_MKBalloonCalloutView *)self layer];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke_158;
    v33[3] = &unk_1E54B9388;
    v33[4] = self;
    CGRect v34 = v6;
    objc_msgSend(v30, "_mapkit_addAnimation:forKey:completion:", v27, @"show", v33);
  }
  if (_MKMarkerAnnotationViewSelectionShouldSway())
  {
    v31 = _MKMarkerAnnotationViewSelectionSwayAnimation();
    if (v31)
    {
      id v32 = [(_MKBalloonCalloutView *)self layer];
      [v32 addAnimation:v31 forKey:@"sway"];
    }
  }
LABEL_15:
}

- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  v41[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  self->_dismissed = 1;
  id v7 = [(MKCalloutView *)self annotationView];
  [v7 calloutOffset];
  double v9 = v8;

  if (!self->_originatesAsSmallBalloon)
  {
    double v10 = [(_MKBalloonCalloutView *)self layer];
    [v10 setOpacity:0.0];
  }
  double v11 = [(_MKBalloonCalloutView *)self traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v40[0] = *MEMORY[0x1E4F1DAB8];
  v40[1] = v13;
  v40[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(_MKBalloonCalloutView *)self setTransform:v40];
  memset(&v39, 0, sizeof(v39));
  if (v12 == 3)
  {
    CATransform3DMakeScale(&v39, 0.75, 0.75, 1.0);
    if (!v4)
    {
LABEL_5:
      v6[2](v6);
      goto LABEL_11;
    }
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v39.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v39.m33 = v14;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v39.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v39.m43 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v39.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v39.m13 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v39.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v39.m23 = v17;
    if (!v4) {
      goto LABEL_5;
    }
  }
  if (self->_originatesAsSmallBalloon)
  {
    long long v18 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
    [v18 setMass:3.0];
    [v18 setStiffness:1940.0];
    [v18 setDamping:91.4000015];
    [v18 setInitialVelocity:0.0];
    memset(&v38, 0, sizeof(v38));
    CATransform3DMakeScale(&v38, self->_smallBalloonScale, self->_smallBalloonScale, 1.0);
    CATransform3D v36 = v38;
    CATransform3DTranslate(&v37, &v36, 0.0, 2.0 - v9, 0.0);
    CATransform3D v38 = v37;
    CATransform3D v37 = v39;
    CGFloat v19 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v37];
    [v18 setFromValue:v19];

    CATransform3D v37 = v38;
    CGFloat v20 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v37];
    [v18 setToValue:v20];

    [v18 settlingDuration];
    objc_msgSend(v18, "setDuration:");
    CATransform3D v35 = v38;
    CGFloat v21 = [(_MKBalloonCalloutView *)self layer];
    CATransform3D v34 = v35;
    [v21 setTransform:&v34];

    double v22 = [(_MKBalloonCalloutView *)self layer];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke;
    v32[3] = &unk_1E54B89C0;
    BOOL v33 = v6;
    objc_msgSend(v22, "_mapkit_addAnimation:forKey:completion:", v18, @"hide", v32);
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    memset(&v38, 0, sizeof(v38));
    CATransform3DMakeScale(&v38, 0.100000001, 0.100000001, 1.0);
    CATransform3D v36 = v38;
    CATransform3DTranslate(&v37, &v36, 0.0, -v9, 0.0);
    CATransform3D v38 = v37;
    CATransform3D v37 = v39;
    CGAffineTransform v23 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v37];
    [v18 setFromValue:v23];

    CATransform3D v37 = v38;
    CGRect v24 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v37];
    [v18 setToValue:v24];

    CGRect v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v25 setFromValue:&unk_1ED97E7F0];
    [v25 setToValue:&unk_1ED97E7D8];
    CGRect v26 = [MEMORY[0x1E4F39B38] animation];
    double v27 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v26 setTimingFunction:v27];

    [v26 setDuration:0.13333];
    v41[0] = v18;
    v41[1] = v25;
    double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    [v26 setAnimations:v28];

    [v26 setRemovedOnCompletion:1];
    double v29 = [(_MKBalloonCalloutView *)self layer];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke_2;
    v30[3] = &unk_1E54B89C0;
    v31 = v6;
    objc_msgSend(v29, "_mapkit_addAnimation:forKey:completion:", v26, @"hide", v30);
  }
LABEL_11:
}

- (BOOL)calloutContainsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  backgroundShapeView = self->_backgroundShapeView;
  if (backgroundShapeView)
  {
    -[_MKBezierPathView convertPoint:fromView:](backgroundShapeView, "convertPoint:fromView:", self, a3.x, a3.y);
    id v7 = self->_backgroundShapeView;
    LOBYTE(balloonBodyImageView) = -[_MKBezierPathView containsPoint:](v7, "containsPoint:");
  }
  else
  {
    balloonBodyImageView = self->_balloonBodyImageView;
    if (balloonBodyImageView)
    {
      [(UIImageView *)balloonBodyImageView frame];
      CGFloat v13 = x;
      CGFloat v14 = y;
      LOBYTE(balloonBodyImageView) = CGRectContainsPoint(*(CGRect *)&v9, *(CGPoint *)&v13);
    }
  }
  return (char)balloonBodyImageView;
}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if (([v7 isEqualToString:@"balloonImage"] & 1) != 0
    || [v7 isEqualToString:@"balloonImageTintColor"])
  {
    [(_MKBalloonCalloutView *)self _updateStyle];
  }
}

- (UIColor)balloonTintColor
{
  return self->_balloonTintColor;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)showsArrow
{
  return self->_showsArrow;
}

- (int64_t)style
{
  return self->_style;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)originatesAsSmallBalloon
{
  return self->_originatesAsSmallBalloon;
}

- (void)setOriginatesAsSmallBalloon:(BOOL)a3
{
  self->_BOOL originatesAsSmallBalloon = a3;
}

- (double)smallBalloonScale
{
  return self->_smallBalloonScale;
}

- (void)setSmallBalloonScale:(double)a3
{
  self->_smallBalloonScale = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)innerStrokeColor
{
  return self->_innerStrokeColor;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observedAnnotationView, 0);
  objc_storeStrong((id *)&self->_kvoProxy, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_rectangularImageView, 0);
  objc_storeStrong((id *)&self->_backgroundShapeGradientView, 0);
  objc_storeStrong((id *)&self->_backgroundShapeView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentViewMaskView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_innerBackgroundView, 0);
  objc_storeStrong((id *)&self->_tailView, 0);
  objc_storeStrong((id *)&self->_balloonBodyImageView, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_innerStrokeColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_balloonTintColor, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end