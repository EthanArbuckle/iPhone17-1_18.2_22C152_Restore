@interface HNDRockerButton
+ (HNDRockerButton)buttonWithTitle:(id)a3 imageName:(id)a4 downBlock:(id)a5 upBlock:(id)a6 dataSource:(id)a7 showWithGuidedAccess:(BOOL)a8 showWithAssistiveAccess:(BOOL)a9;
+ (id)_dummyImage;
- (BOOL)_inSelectedState;
- (BOOL)canBecomeFocused;
- (BOOL)continueHighlightAfterTouch;
- (BOOL)customTitle;
- (BOOL)disabled;
- (BOOL)highlighted;
- (BOOL)isAccessibilityElement;
- (BOOL)isBackButton;
- (BOOL)isEmptyFavorite;
- (BOOL)isModalDown;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)selected;
- (BOOL)showWithAssistiveAccess;
- (BOOL)showWithGuidedAccess;
- (CGRect)accessibilityFrame;
- (HNDRockerButton)initWithImageName:(id)a3;
- (HNDRockerButtonDataSource)dataSource;
- (NSString)imageName;
- (NSString)location;
- (NSString)title;
- (NSString)type;
- (UIImage)deviceSpecificImage;
- (UIImage)overrideImage;
- (UIImage)selectedImage;
- (UIImage)unselectedImage;
- (UIImageView)imageView;
- (UILabel)label;
- (UIView)imageViewContainerView;
- (double)_screenHeight;
- (id)_deviceSpecificImageForName:(id)a3 screenHeight:(double)a4;
- (id)accessibilityLabel;
- (id)currentImage;
- (id)description;
- (id)downBlock;
- (id)substantialTransitionOccurredBlock;
- (id)upBlock;
- (id)viewForLastBaselineLayout;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateFont;
- (void)_updateImage;
- (void)_updateImageView;
- (void)_updateLabelText;
- (void)dealloc;
- (void)getDeviceSpecificImageForColor:(id)a3 withCompletion:(id)a4;
- (void)handleFingerDriftedAway;
- (void)handleRealCancelEvent:(CGPoint)a3;
- (void)handleRealDownEvent:(CGPoint)a3;
- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4;
- (void)performPress:(BOOL)a3;
- (void)resetImages;
- (void)setContinueHighlightAfterTouch:(BOOL)a3;
- (void)setCustomTitle:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDownBlock:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setIsBackButton:(BOOL)a3;
- (void)setIsEmptyFavorite:(BOOL)a3;
- (void)setIsModalDown:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setOverrideImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedImage:(id)a3;
- (void)setShowWithAssistiveAccess:(BOOL)a3;
- (void)setShowWithGuidedAccess:(BOOL)a3;
- (void)setSubstantialTransitionOccurredBlock:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUnselectedImage:(id)a3;
- (void)setUpBlock:(id)a3;
- (void)updateTextColor;
@end

@implementation HNDRockerButton

+ (HNDRockerButton)buttonWithTitle:(id)a3 imageName:(id)a4 downBlock:(id)a5 upBlock:(id)a6 dataSource:(id)a7 showWithGuidedAccess:(BOOL)a8 showWithAssistiveAccess:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_allocWithZone((Class)HNDRockerButton) initWithImageName:v17];

  [v19 setTitle:v18];
  [v19 setDownBlock:v16];

  [v19 setUpBlock:v15];
  [v19 setDataSource:v14];

  [v19 setShowWithGuidedAccess:v9];
  [v19 setShowWithAssistiveAccess:a9];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [v19 imageView];
  LODWORD(v21) = 1148846080;
  [v20 setContentCompressionResistancePriority:0 forAxis:v21];

  v22 = [v19 imageView];
  LODWORD(v23) = 1148846080;
  [v22 setContentCompressionResistancePriority:1 forAxis:v23];

  v24 = [v19 imageView];
  LODWORD(v25) = 1148846080;
  [v24 setContentHuggingPriority:0 forAxis:v25];

  v26 = [v19 imageView];
  LODWORD(v27) = 1148846080;
  [v26 setContentHuggingPriority:1 forAxis:v27];

  return (HNDRockerButton *)v19;
}

+ (id)_dummyImage
{
  if (qword_1001F0A90 != -1) {
    dispatch_once(&qword_1001F0A90, &stru_1001AC9C8);
  }
  v2 = (void *)qword_1001F0A88;

  return v2;
}

- (HNDRockerButton)initWithImageName:(id)a3
{
  id v60 = a3;
  v70.receiver = self;
  v70.super_class = (Class)HNDRockerButton;
  v4 = [(HNDRockerButton *)&v70 init];
  [(HNDRockerButton *)v4 setClipsToBounds:0];
  v5 = +[UIColor clearColor];
  [(HNDRockerButton *)v4 setBackgroundColor:v5];

  [(HNDRockerButton *)v4 setAlpha:1.0];
  id obj = (id)objc_opt_new();
  v6 = +[AXAssistiveTouchLayoutView fontMetrics];
  [obj setFontMetrics:v6];

  v7 = +[AXAssistiveTouchLayoutView imageMinimumContentSizeCategory];
  [obj setMinimumContentSizeCategory:v7];

  v8 = +[AXAssistiveTouchLayoutView imageMaximumContentSizeCategory];
  [obj setMaximumContentSizeCategory:v8];

  objc_storeStrong((id *)&v4->_imageView, obj);
  [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v9 = [(id)objc_opt_class() _dummyImage];
  [(UIImageView *)v4->_imageView setImage:v9];

  [(HNDRockerButton *)v4 setImageName:v60];
  v10 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = v4->_label;
  v4->_label = v10;

  [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = +[UIColor clearColor];
  [(UILabel *)v4->_label setBackgroundColor:v12];

  [(UILabel *)v4->_label setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)v4->_label setClipsToBounds:0];
  [(UILabel *)v4->_label setNumberOfLines:2];
  [(HNDRockerButton *)v4 _updateFont];
  [(HNDRockerButton *)v4 updateTextColor];
  [(HNDRockerButton *)v4 addSubview:v4->_imageView];
  [(HNDRockerButton *)v4 addSubview:v4->_label];
  v13 = [(UILabel *)v4->_label topAnchor];
  id v14 = [(UIImageView *)v4->_imageView centerYAnchor];
  v65 = [v13 constraintEqualToAnchor:v14 constant:32.0];

  LODWORD(v15) = 1148829696;
  [v65 setPriority:v15];
  id v16 = [(HNDRockerButton *)v4 leadingAnchor];
  id v17 = [(UIImageView *)v4->_imageView leadingAnchor];
  v64 = [v16 constraintEqualToAnchor:v17];

  LODWORD(v18) = 1132003328;
  [v64 setPriority:v18];
  id v19 = [(HNDRockerButton *)v4 leadingAnchor];
  v20 = [(UILabel *)v4->_label leadingAnchor];
  v63 = [v19 constraintEqualToAnchor:v20];

  LODWORD(v21) = 1132003328;
  [v63 setPriority:v21];
  v22 = [(HNDRockerButton *)v4 trailingAnchor];
  double v23 = [(UIImageView *)v4->_imageView trailingAnchor];
  v62 = [v22 constraintEqualToAnchor:v23];

  LODWORD(v24) = 1132003328;
  [v62 setPriority:v24];
  double v25 = [(HNDRockerButton *)v4 trailingAnchor];
  v26 = [(UILabel *)v4->_label trailingAnchor];
  v61 = [v25 constraintEqualToAnchor:v26];

  LODWORD(v27) = 1132003328;
  [v61 setPriority:v27];
  v59 = [(UIImageView *)v4->_imageView topAnchor];
  v58 = [(HNDRockerButton *)v4 topAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v72[0] = v57;
  v72[1] = v65;
  v56 = [(UILabel *)v4->_label topAnchor];
  v55 = [(UIImageView *)v4->_imageView bottomAnchor];
  v54 = [v56 constraintGreaterThanOrEqualToAnchor:v55];
  v72[2] = v54;
  v53 = [(UILabel *)v4->_label bottomAnchor];
  v52 = [(HNDRockerButton *)v4 bottomAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v72[3] = v51;
  v50 = [(UILabel *)v4->_label centerXAnchor];
  v49 = [(UIImageView *)v4->_imageView centerXAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v72[4] = v48;
  v47 = [(UIImageView *)v4->_imageView centerXAnchor];
  v46 = [(HNDRockerButton *)v4 centerXAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v72[5] = v45;
  v44 = [(UIImageView *)v4->_imageView leadingAnchor];
  v43 = [(HNDRockerButton *)v4 leadingAnchor];
  v42 = [v44 constraintGreaterThanOrEqualToAnchor:v43];
  v72[6] = v42;
  v41 = [(UILabel *)v4->_label leadingAnchor];
  v28 = [(HNDRockerButton *)v4 leadingAnchor];
  v29 = [v41 constraintGreaterThanOrEqualToAnchor:v28];
  v72[7] = v29;
  v30 = [(UIImageView *)v4->_imageView trailingAnchor];
  v31 = [(HNDRockerButton *)v4 trailingAnchor];
  v32 = [v30 constraintLessThanOrEqualToAnchor:v31];
  v72[8] = v32;
  v33 = [(UILabel *)v4->_label trailingAnchor];
  v34 = [(HNDRockerButton *)v4 trailingAnchor];
  v35 = [v33 constraintLessThanOrEqualToAnchor:v34];
  v72[9] = v35;
  v72[10] = v64;
  v72[11] = v63;
  v72[12] = v62;
  v72[13] = v61;
  v36 = +[NSArray arrayWithObjects:v72 count:14];
  +[NSLayoutConstraint activateConstraints:v36];

  objc_initWeak(&location, v4);
  v37 = self;
  v71 = v37;
  v38 = +[NSArray arrayWithObjects:&v71 count:1];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10005D564;
  v67[3] = &unk_1001AC9F0;
  objc_copyWeak(&v68, &location);
  id v39 = [(HNDRockerButton *)v4 registerForTraitChanges:v38 withHandler:v67];

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);

  return v4;
}

- (void)_traitCollectionDidChange:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  v5 = [(HNDRockerButton *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  unsigned __int8 v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    [(HNDRockerButton *)self _updateFont];
    [(HNDRockerButton *)self _updateLabelText];
  }
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)_updateFont
{
  id v3 = +[AXAssistiveTouchLayoutView labelFont];
  [(UILabel *)self->_label setFont:v3];
}

- (void)_updateImage
{
  [(HNDRockerButton *)self resetImages];

  [(HNDRockerButton *)self _updateImageView];
}

- (void)_updateImageView
{
  id v7 = [(HNDRockerButton *)self currentImage];
  if ([UIApp userInterfaceLayoutDirection] == (id)1
    && AXUIAssistiveTouchIconRequiresRTLFlipping())
  {
    uint64_t v3 = [v7 imageWithHorizontallyFlippedOrientation];

    id v7 = (id)v3;
  }
  if ([(NSString *)self->_imageName isEqualToString:@"AT_pinned_narrow_for_flipping"])
  {
    uint64_t v4 = [v7 imageWithHorizontallyFlippedOrientation];

    uint64_t v5 = v4;
    if (v4) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = (uint64_t)v7;
    if (v7) {
      goto LABEL_9;
    }
  }
  uint64_t v5 = [(id)objc_opt_class() _dummyImage];
LABEL_9:
  id v8 = (id)v5;
  [(UIImageView *)self->_imageView setImage:v5];
  double v6 = 0.5;
  if (!self->_disabled) {
    double v6 = 1.0;
  }
  [(UIImageView *)self->_imageView setAlpha:v6];
}

- (void)setImageName:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_imageName = &self->_imageName;
  if (self->_imageName != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_imageName, a3);
    p_imageName = (NSString **)[(HNDRockerButton *)self _updateImage];
    uint64_t v5 = v7;
  }

  _objc_release_x1(p_imageName, v5);
}

- (void)setOverrideImage:(id)a3
{
  objc_storeStrong((id *)&self->_overrideImage, a3);
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D958;
  block[3] = &unk_1001AAA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setUpBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id upBlock = self->_upBlock;
  self->_id upBlock = v4;

  _objc_release_x1(v4, upBlock);
}

- (void)setDownBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id downBlock = self->_downBlock;
  self->_id downBlock = v4;

  _objc_release_x1(v4, downBlock);
}

- (void)handleRealDownEvent:(CGPoint)a3
{
  if (![(HNDRockerButton *)self highlighted])
  {
    [(HNDRockerButton *)self performPress:1];
  }
}

- (void)handleFingerDriftedAway
{
  [(HNDRockerButton *)self setHighlighted:0];
  if ([(HNDRockerButton *)self isModalDown])
  {
    [(HNDRockerButton *)self performPress:0];
  }
}

- (void)handleRealCancelEvent:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(HNDRockerButton *)self isModalDown])
  {
    double v6 = +[HNDHandManager sharedManager];
    unsigned int v7 = [v6 isVoiceControlRunning];

    if (v7)
    {
      [(HNDRockerButton *)self setHighlighted:0];
      id v13 = +[HNDHandManager sharedManager];
      id v8 = [(HNDRockerButton *)self window];
      BOOL v9 = [v8 screen];
      v10 = [v9 displayIdentity];
      v11 = objc_msgSend(v13, "displayManagerForDisplayId:", objc_msgSend(v10, "displayID"));
      v12 = [v11 hardwareIdentifier];
      [v13 menuExitedOnDisplay:v12];
    }
    else
    {
      [(HNDRockerButton *)self handleFingerDriftedAway];
    }
  }
  else
  {
    -[HNDRockerButton handleRealUpEvent:maxOrb:](self, "handleRealUpEvent:maxOrb:", x, y, 0.0);
  }
}

- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4
{
  if (-[HNDRockerButton pointInside:withEvent:](self, "pointInside:withEvent:", 0, a3.x, a3.y, a4))
  {
    [(HNDRockerButton *)self performPress:0];
  }
  else
  {
    [(HNDRockerButton *)self handleFingerDriftedAway];
    [(HNDRockerButton *)self setHighlighted:0];
  }
}

- (void)performPress:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(HNDRockerButton *)self disabled])
  {
    if (v3)
    {
      [(HNDRockerButton *)self setHighlighted:1];
      uint64_t v5 = 32;
    }
    else
    {
      [(HNDRockerButton *)self setHighlighted:[(HNDRockerButton *)self continueHighlightAfterTouch]];
      uint64_t v5 = 40;
    }
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v5);
    if (v6)
    {
      unsigned int v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIImageView *)self->_imageView frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(UILabel *)self->_label frame];
  v26.origin.CGFloat x = v15;
  v26.origin.CGFloat y = v16;
  v26.size.width = v17;
  v26.size.height = v18;
  v23.origin.CGFloat x = v8;
  v23.origin.CGFloat y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  CGRect v24 = CGRectUnion(v23, v26);
  CGRect v25 = CGRectInset(v24, -20.0, -20.0);
  CGFloat v19 = x;
  CGFloat v20 = y;

  return CGRectContainsPoint(v25, *(CGPoint *)&v19);
}

- (BOOL)_inSelectedState
{
  if ([(HNDRockerButton *)self highlighted] || (BOOL v3 = [(HNDRockerButton *)self selected])) {
    LOBYTE(v3) = ![(HNDRockerButton *)self disabled];
  }
  return v3;
}

- (void)resetImages
{
  selectedImage = self->_selectedImage;
  self->_selectedImage = 0;

  unselectedImage = self->_unselectedImage;
  self->_unselectedImage = 0;
}

- (id)currentImage
{
  if ([(HNDRockerButton *)self _inSelectedState])
  {
    p_selectedImage = &self->_selectedImage;
    selectedImage = self->_selectedImage;
    if (selectedImage) {
      goto LABEL_7;
    }
    uint64_t v5 = +[UIColor colorWithRed:0.37 green:0.79 blue:0.96 alpha:1.0];
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    CGFloat v15 = sub_10005DFC0;
    CGFloat v16 = &unk_1001ACA18;
    CGFloat v17 = self;
    uint64_t v6 = &v13;
  }
  else
  {
    p_selectedImage = &self->_unselectedImage;
    selectedImage = self->_unselectedImage;
    if (selectedImage) {
      goto LABEL_7;
    }
    uint64_t v5 = +[UIColor whiteColor];
    CGFloat v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    CGFloat v10 = sub_10005E04C;
    double v11 = &unk_1001ACA18;
    CGFloat v12 = self;
    uint64_t v6 = &v8;
  }
  -[HNDRockerButton getDeviceSpecificImageForColor:withCompletion:](self, "getDeviceSpecificImageForColor:withCompletion:", v5, v6, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);

  selectedImage = *p_selectedImage;
LABEL_7:

  return selectedImage;
}

- (void)getDeviceSpecificImageForColor:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [(HNDRockerButton *)self overrideImage];
  if (!v8)
  {
    uint64_t v9 = self->_imageName;
    if ([(NSString *)v9 length])
    {
      [(HNDRockerButton *)self _screenHeight];
      uint64_t v11 = v10;
      CGFloat v12 = dispatch_get_global_queue(0, 0);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10005E2A4;
      v14[3] = &unk_1001ACA40;
      v14[4] = self;
      CGFloat v15 = v9;
      uint64_t v18 = v11;
      id v16 = v6;
      id v17 = v7;
      dispatch_async(v12, v14);

      double v13 = v15;
    }
    else
    {
      if (!v7)
      {
LABEL_8:

        goto LABEL_9;
      }
      CGFloat v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      double v21 = sub_10005E290;
      v22 = &unk_1001AB490;
      CGRect v23 = (NSString *)v7;
      AXPerformBlockAsynchronouslyOnMainThread();
      double v13 = v23;
    }

    goto LABEL_8;
  }
  (*((void (**)(id, void *))v7 + 2))(v7, v8);
LABEL_9:
}

- (id)_deviceSpecificImageForName:(id)a3 screenHeight:(double)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:AXAssistiveTouchIconTypeDetectionMode]) {
    goto LABEL_7;
  }
  id v6 = AXUIAssistiveTouchImageNameForName();
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:AXAssistiveTouchIconTypeWatchRemoteScreen]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:AXAssistiveTouchIconTypeBackgroundSounds]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:AXAssistiveTouchIconTypeLiveCaptions]) {
    goto LABEL_7;
  }
  uint64_t v10 = AXUIAssistiveTouchImageNameForName();
  unsigned int v11 = [v5 isEqualToString:v10];

  if (v11
    || AXDeviceHasStaccato()
    && [v5 isEqualToString:AXAssistiveTouchIconTypeActionButton])
  {
    goto LABEL_7;
  }
  if (AXDeviceSupportsCameraButton())
  {
    CGFloat v12 = AXUIAssistiveTouchImageNameForName();
    unsigned int v13 = [v5 isEqualToString:v12];

    if (v13) {
      goto LABEL_7;
    }
  }
  if (AXDeviceSupportsCameraButton())
  {
    uint64_t v14 = AXUIAssistiveTouchImageNameForName();
    unsigned int v15 = [v5 isEqualToString:v14];

    if (v15) {
      goto LABEL_7;
    }
  }
  if (AXDeviceSupportsCameraButton())
  {
    id v16 = AXUIAssistiveTouchImageNameForName();
    unsigned int v17 = [v5 isEqualToString:v16];

    if (v17) {
      goto LABEL_7;
    }
  }
  if (AXDeviceSupportsCameraButton())
  {
    if (AXDeviceHasGreyMatterEnabled())
    {
      uint64_t v18 = AXUIAssistiveTouchImageNameForName();
      unsigned int v19 = [v5 isEqualToString:v18];

      if (v19) {
        goto LABEL_7;
      }
    }
  }
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    uint64_t v20 = AXUIAssistiveTouchImageNameForName();
    unsigned int v21 = [v5 isEqualToString:v20];

    if (v21) {
      goto LABEL_7;
    }
  }
  if (AXDeviceSupportsOnDeviceEyeTracking()
    && (AXUIAssistiveTouchImageNameForName(),
        v22 = objc_claimAutoreleasedReturnValue(),
        unsigned int v23 = [v5 isEqualToString:v22],
        v22,
        v23)
    || [v5 hasPrefix:@"system-image-"])
  {
LABEL_7:
    AXUIAssistiveTouchImageForName();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int IsPhoneIdiom = AXDeviceIsPhoneIdiom();
    if (a4 <= 480.0
      || !IsPhoneIdiom
      || ([v5 stringByAppendingString:@"-tall"],
          CGRect v25 = objc_claimAutoreleasedReturnValue(),
          +[UIImage _deviceSpecificImageNamed:v25],
          id v8 = (id)objc_claimAutoreleasedReturnValue(),
          v25,
          !v8))
    {
      CGRect v26 = +[UIImage _deviceSpecificImageNamed:v5];
      double v27 = objc_msgSend(v26, "imageByPreparingThumbnailOfSize:", 60.0, 60.0);
      v28 = v27;
      if (v27)
      {
        id v8 = v27;
      }
      else
      {
        uint64_t v29 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
        id v8 = [v26 imageByApplyingSymbolConfiguration:v29];

        CGRect v26 = (void *)v29;
      }
    }
  }

  return v8;
}

- (double)_screenHeight
{
  v2 = +[UIScreen mainScreen];
  [v2 _referenceBounds];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (UIImage)deviceSpecificImage
{
  imageName = self->_imageName;
  if (imageName)
  {
    [(HNDRockerButton *)self _screenHeight];
    id v4 = -[HNDRockerButton _deviceSpecificImageForName:screenHeight:](self, "_deviceSpecificImageForName:screenHeight:", imageName);
  }
  else
  {
    id v4 = 0;
  }

  return (UIImage *)v4;
}

- (void)updateTextColor
{
  if (self->_disabled)
  {
    label = self->_label;
    double v3 = 1.0;
    double v4 = 1.0;
    double v5 = 1.0;
    double v6 = 0.5;
  }
  else
  {
    if (self->_selected || self->_highlighted)
    {
      label = self->_label;
      double v3 = 0.250980392;
      double v4 = 0.670588235;
      double v5 = 0.992156863;
    }
    else
    {
      label = self->_label;
      double v3 = 1.0;
      double v4 = 1.0;
      double v5 = 1.0;
    }
    double v6 = 1.0;
  }
  id v7 = +[UIColor colorWithRed:v3 green:v4 blue:v5 alpha:v6];
  [(UILabel *)label setTextColor:v7];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(HNDRockerButton *)self updateTextColor];
    [(HNDRockerButton *)self _updateImageView];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(HNDRockerButton *)self updateTextColor];
    [(HNDRockerButton *)self _updateImageView];
  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(HNDRockerButton *)self updateTextColor];
    [(HNDRockerButton *)self _updateImageView];
  }
}

- (void)setTitle:(id)a3
{
  double v5 = (NSString *)a3;
  p_title = &self->_title;
  if (self->_title != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_title, a3);
    p_title = (NSString **)[(HNDRockerButton *)self _updateLabelText];
    double v5 = v7;
  }

  _objc_release_x1(p_title, v5);
}

- (void)_updateLabelText
{
  uint64_t v3 = [(HNDRockerButton *)self title];
  if (v3)
  {
    double v4 = (void *)v3;
    id v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    LODWORD(v6) = 981668463;
    [v5 setHyphenationFactor:v6];
    id v7 = +[AXAssistiveTouchLayoutView fontMetrics];
    if (AXDeviceIsPad()) {
      double v8 = 20.0;
    }
    else {
      double v8 = 16.0;
    }
    uint64_t v9 = +[AXAssistiveTouchLayoutView traitCollectionForLabelPreferredContentSizeCategory];
    [v7 scaledValueForValue:v9 compatibleWithTraitCollection:v8];
    objc_msgSend(v5, "setMinimumLineHeight:");

    [v5 minimumLineHeight];
    objc_msgSend(v5, "setMaximumLineHeight:");
    if ([v4 containsString:@"\\n"])
    {
      uint64_t v10 = [v4 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

      double v4 = (void *)v10;
    }
    [v5 setAlignment:1];
    [v5 setLineBreakMode:4];
    [(UILabel *)self->_label setText:0];
    id v11 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v15 = NSParagraphStyleAttributeName;
    id v16 = v5;
    CGFloat v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v13 = [v11 initWithString:v4 attributes:v12];

    [(UILabel *)self->_label setAttributedText:v13];
  }
  else
  {
    label = self->_label;
    [(UILabel *)label setText:0];
  }
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HNDRockerButton;
  [(HNDRockerButton *)&v4 dealloc];
}

- (UIView)imageViewContainerView
{
  return (UIView *)self->_imageView;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(UILabel *)self->_label text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  label = self->_label;
  [(UIImageView *)self->_imageView accessibilityFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (label)
  {
    [(UILabel *)self->_label accessibilityFrame];
    v23.origin.CGFloat x = v12;
    v23.origin.CGFloat y = v13;
    v23.size.CGFloat width = v14;
    v23.size.CGFloat height = v15;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectUnion(v20, v23);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)accessibilityLabel
{
  if ([(HNDRockerButton *)self isBackButton])
  {
    BOOL v3 = @"back.button";
LABEL_5:
    double v4 = sub_100040EC8(v3);
    goto LABEL_7;
  }
  if ([(HNDRockerButton *)self isEmptyFavorite])
  {
    BOOL v3 = @"empty.favorite.gesture.button";
    goto LABEL_5;
  }
  double v4 = [(NSString *)self->_title stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
LABEL_7:

  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(UILabel *)self->_label text];
  [(HNDRockerButton *)self frame];
  id v5 = NSStringFromCGRect(v9);
  double v6 = +[NSString stringWithFormat:@"[%@ %p] - Label: %@ Frame: %@", v3, self, v4, v5];

  return v6;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (NSString)title
{
  return self->_title;
}

- (id)downBlock
{
  return self->_downBlock;
}

- (id)upBlock
{
  return self->_upBlock;
}

- (BOOL)isEmptyFavorite
{
  return self->isEmptyFavorite;
}

- (void)setIsEmptyFavorite:(BOOL)a3
{
  self->isEmptyFavorite = a3;
}

- (BOOL)customTitle
{
  return self->customTitle;
}

- (void)setCustomTitle:(BOOL)a3
{
  self->customTitle = a3;
}

- (BOOL)isModalDown
{
  return self->isModalDown;
}

- (void)setIsModalDown:(BOOL)a3
{
  self->isModalDown = a3;
}

- (BOOL)isBackButton
{
  return self->_isBackButton;
}

- (void)setIsBackButton:(BOOL)a3
{
  self->_isBackButton = a3;
}

- (BOOL)continueHighlightAfterTouch
{
  return self->_continueHighlightAfterTouch;
}

- (void)setContinueHighlightAfterTouch:(BOOL)a3
{
  self->_continueHighlightAfterTouch = a3;
}

- (BOOL)showWithGuidedAccess
{
  return self->_showWithGuidedAccess;
}

- (void)setShowWithGuidedAccess:(BOOL)a3
{
  self->_showWithGuidedAccess = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (id)substantialTransitionOccurredBlock
{
  return self->_substantialTransitionOccurredBlock;
}

- (void)setSubstantialTransitionOccurredBlock:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (HNDRockerButtonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HNDRockerButtonDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (BOOL)showWithAssistiveAccess
{
  return self->_showWithAssistiveAccess;
}

- (void)setShowWithAssistiveAccess:(BOOL)a3
{
  self->_showWithAssistiveAccess = a3;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (UIImage)unselectedImage
{
  return self->_unselectedImage;
}

- (void)setUnselectedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedImage, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong(&self->_substantialTransitionOccurredBlock, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_upBlock, 0);

  objc_storeStrong(&self->_downBlock, 0);
}

@end