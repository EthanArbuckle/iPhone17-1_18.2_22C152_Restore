@interface PHAudioControlsButton
- (BOOL)isButtonLayoutEnabled;
- (CABackdropLayer)backdropLayer;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)_buttonSize;
- (CGSize)sizeOverride;
- (NSArray)ambientButtonParts;
- (NSUUID)uuid;
- (PHAudioControlsButton)initWithFrame:(CGRect)a3;
- (PHAudioControlsButton)initWithSize:(CGSize)a3;
- (PHAudioControlsButtonMenuDataSource)menuDataSource;
- (PHRoundView)roundView;
- (UIEdgeInsets)contentInsets;
- (UIImage)controlImage;
- (UIView)backdropView;
- (UIVisualEffectView)backdropEffectView;
- (double)_titleOffset;
- (id)circleWithColor:(id)a3 radius:(int)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (int64_t)ambientButtonType;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)controlType;
- (void)adjustImageColors;
- (void)setBackdropEffectView:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setCaptureView:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentRect:(CGRect)a3;
- (void)setControlImage:(id)a3;
- (void)setControlType:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMenuDataSource:(id)a3;
- (void)setRoundView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setupBackdropView;
- (void)setupConstraints;
- (void)setupLabel;
- (void)setupRoundview;
- (void)setupTitleColors;
- (void)updateBackgroundMaterial:(unint64_t)a3;
- (void)updateImageColor;
- (void)updateMaterialAndAlpha;
- (void)updateRoundViewColorAnimated:(BOOL)a3;
- (void)updateViewsAnimated:(BOOL)a3;
@end

@implementation PHAudioControlsButton

- (PHAudioControlsButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PHAudioControlsButton;
  v3 = -[PHAudioControlsButton initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v4;

    [(PHAudioControlsButton *)v3 setupLabel];
    [(PHAudioControlsButton *)v3 setupBackdropView];
    [(PHAudioControlsButton *)v3 setupRoundview];
    [(PHAudioControlsButton *)v3 setupConstraints];
    [(PHAudioControlsButton *)v3 sendSubviewToBack:v3->_roundView];
    if ([(PHAudioControlsButton *)v3 isButtonLayoutEnabled]) {
      [(PHAudioControlsButton *)v3 sendSubviewToBack:v3->_backdropEffectView];
    }
    v6 = [(PHAudioControlsButton *)v3 imageView];
    [(PHAudioControlsButton *)v3 bringSubviewToFront:v6];

    [(PHAudioControlsButton *)v3 setupTitleColors];
    [(PHAudioControlsButton *)v3 adjustImageColors];
    v7 = [(PHAudioControlsButton *)v3 layer];
    [v7 setAllowsGroupBlending:0];

    v8 = [(PHAudioControlsButton *)v3 layer];
    [v8 setAllowsGroupOpacity:0];

    [(PHAudioControlsButton *)v3 _titleOffset];
    -[PHAudioControlsButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:");
    [(PHAudioControlsButton *)v3 updateViewsAnimated:0];
  }
  return v3;
}

- (PHAudioControlsButton)initWithSize:(CGSize)a3
{
  self->_sizeOverride = a3;
  return -[PHAudioControlsButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)setupLabel
{
  id v5 = [(PHAudioControlsButton *)self titleLabel];
  unint64_t v2 = +[PHUIConfiguration inCallControlSize];
  double v3 = 15.0;
  if (v2 == 1) {
    double v3 = 13.0;
  }
  uint64_t v4 = +[UIFont systemFontOfSize:v3];
  [v5 setFont:v4];

  [v5 setLineBreakMode:0];
  [v5 setTextAlignment:1];
}

- (void)setupRoundview
{
  [(PHAudioControlsButton *)self _buttonSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [PHRoundView alloc];
  *(float *)&double v8 = v6 * 0.5;
  v9 = -[PHRoundView initWithFrame:cornerRadius:](v7, "initWithFrame:cornerRadius:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v8);
  roundView = self->_roundView;
  self->_roundView = v9;

  [(PHRoundView *)self->_roundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(PHRoundView *)self->_roundView widthAnchor];
  v12 = [v11 constraintEqualToConstant:v4];
  [v12 setActive:1];

  v13 = [(PHRoundView *)self->_roundView heightAnchor];
  v14 = [v13 constraintEqualToConstant:v6];
  [v14 setActive:1];

  [(PHRoundView *)self->_roundView setUserInteractionEnabled:0];
  v15 = self->_roundView;

  [(PHAudioControlsButton *)self addSubview:v15];
}

- (void)setupBackdropView
{
  [(PHAudioControlsButton *)self _buttonSize];
  double v4 = v3;
  double v6 = v5;
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled])
  {
    v7 = objc_alloc_init(BackdropView);
    double v8 = +[UIColorEffect inCallControls];
    backdropLayer = +[UIBlurEffect effectWithBlurRadius:40.0];
    id v10 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:0];

    v18[0] = v8;
    v18[1] = backdropLayer;
    v11 = +[NSArray arrayWithObjects:v18 count:2];
    [v10 setBackgroundEffects:v11];

    [v10 setFrame:0.0, 0.0, v4, v6];
    [v10 _setCornerRadius:v6 * 0.5];
    [v10 setUserInteractionEnabled:0];
    [(PHAudioControlsButton *)self addSubview:v10];
    [(PHAudioControlsButton *)self setBackdropEffectView:v10];
  }
  else
  {
    v12 = (UIView *)objc_alloc_init((Class)UIView);
    id v13 = objc_alloc_init((Class)CABackdropLayer);
    id v10 = +[CAFilter filterWithType:kCAFilterColorSaturate];
    [v10 setName:@"saturation"];
    [v10 setValue:&off_1002DF9F8 forKey:@"inputAmount"];
    id v17 = v10;
    v14 = +[NSArray arrayWithObjects:&v17 count:1];
    [v13 setFilters:v14];

    v15 = [(UIView *)v12 layer];
    [v15 addSublayer:v13];

    [v13 setFrame:0.0, 0.0, v4, v6];
    [v13 setCornerRadius:v6 * 0.5];
    [(UIView *)v12 setUserInteractionEnabled:0];
    [(PHAudioControlsButton *)self addSubview:v12];
    backdropView = self->_backdropView;
    self->_backdropView = v12;
    double v8 = v12;

    backdropLayer = self->_backdropLayer;
    self->_backdropLayer = (CABackdropLayer *)v13;
  }
}

- (void)updateBackgroundMaterial:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v4 = [(PHAudioControlsButton *)self backdropEffectView];

      if (v4)
      {
        double v5 = +[UIColorEffect inCallControls];
        double v6 = +[UIBlurEffect effectWithBlurRadius:40.0];
        v15 = v5;
        v16 = v6;
        v7 = &v15;
        goto LABEL_10;
      }
      break;
    case 1uLL:
      double v8 = [(PHAudioControlsButton *)self backdropEffectView];

      if (v8)
      {
        double v5 = +[UIColorEffect inCallControlsButtonAvatarOnly];
        v19 = v5;
        double v6 = +[NSArray arrayWithObjects:&v19 count:1];
        v9 = [(PHAudioControlsButton *)self backdropEffectView];
        [v9 setBackgroundEffects:v6];
        goto LABEL_11;
      }
      break;
    case 2uLL:
      id v10 = [(PHAudioControlsButton *)self backdropEffectView];

      if (v10)
      {
        double v5 = +[UIColorEffect inCallControlsButtonNoPhotoNoAvatar];
        double v6 = +[UIBlurEffect effectWithBlurRadius:30.0];
        id v17 = v5;
        v18 = v6;
        v7 = &v17;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      v11 = [(PHAudioControlsButton *)self backdropEffectView];

      if (v11)
      {
        double v5 = +[UIColorEffect inCallControlsEmergencyCallButton];
        double v6 = +[UIBlurEffect effectWithBlurRadius:100.0];
        id v13 = v5;
        v14 = v6;
        v7 = &v13;
LABEL_10:
        v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2, v13, v14, v15, v16, v17, v18);
        v12 = [(PHAudioControlsButton *)self backdropEffectView];
        [v12 setBackgroundEffects:v9];

LABEL_11:
      }
      break;
    default:
      return;
  }
}

- (void)setupTitleColors
{
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled])
  {
    +[UIColor colorWithWhite:1.0 alpha:1.0];
  }
  else
  {
    double v3 = +[UIColor colorWithWhite:0.899999976 alpha:1.0];
    [(PHAudioControlsButton *)self setTitleColor:v3 forState:0];

    +[UIColor colorWithWhite:1.0 alpha:0.200000003];
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PHAudioControlsButton setTitleColor:forState:](self, "setTitleColor:forState:");
}

- (void)setupConstraints
{
  double v3 = +[NSLayoutConstraint constraintWithItem:self->_roundView attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHAudioControlsButton *)self addConstraint:v3];

  id v4 = +[NSLayoutConstraint constraintWithItem:self->_roundView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [(PHAudioControlsButton *)self addConstraint:v4];
}

- (void)adjustImageColors
{
  if (![(PHAudioControlsButton *)self isButtonLayoutEnabled]) {
    [(PHAudioControlsButton *)self setAdjustsImageWhenDisabled:1];
  }

  [(PHAudioControlsButton *)self setAdjustsImageWhenHighlighted:0];
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double right = self->_contentInsets.right;
  double v9 = a3.origin.y + top;
  double v10 = a3.size.height - (top + self->_contentInsets.bottom);
  if ((id)[(PHAudioControlsButton *)self controlType] == (id)17) {
    double v11 = 15.0;
  }
  else {
    double v11 = 12.0;
  }
  uint64_t v12 = [(PHAudioControlsButton *)self currentTitle];
  [(PHAudioControlsButton *)self bounds];
  CGRect v30 = CGRectInset(v29, -v11, 0.0);
  double v13 = v30.size.width;
  double height = v30.size.height;
  NSAttributedStringKey v27 = NSFontAttributeName;
  v15 = [(PHAudioControlsButton *)self _font];
  v28 = v15;
  v16 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v12 boundingRectWithSize:1 options:v16 context:v13 height];
  double v18 = v17;
  double v20 = v19;

  double v21 = ceil(v20);
  LOBYTE(v12) = [(PHAudioControlsButton *)self isButtonLayoutEnabled];
  [(PHAudioControlsButton *)self _titleOffset];
  double v23 = v9 + v10 + v22;
  if ((v12 & 1) == 0) {
    double v23 = v23 - floor(v21 / 2.4000001);
  }
  double v24 = ceil(v18);
  double v25 = x + left + (width - (left + right) - v24) * 0.5;
  double v26 = v21;
  result.size.double height = v26;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.double x = v25;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double left = self->_contentInsets.left;
  double v5 = a3.origin.x + left;
  double v6 = a3.size.width - (left + self->_contentInsets.right);
  double v7 = a3.size.height - (self->_contentInsets.top + self->_contentInsets.bottom);
  double v8 = [(PHAudioControlsButton *)self currentImage];
  if (v8)
  {
    double v9 = [(PHAudioControlsButton *)self currentImage];
    [v9 size];
    double width = v10;
    double height = v12;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  [(PHAudioControlsButton *)self imageEdgeInsets];
  double v15 = width - v14;
  [(PHAudioControlsButton *)self imageEdgeInsets];
  double v17 = v15 - v16;
  [(PHAudioControlsButton *)self imageEdgeInsets];
  double v19 = height - v18;
  [(PHAudioControlsButton *)self imageEdgeInsets];
  double v21 = v19 - v20;
  double x = v5 + (v6 - v17) * 0.5;
  double y = v7 * 0.5 - ceil(v21 * 0.5);
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled]
    && (id)[(PHAudioControlsButton *)self controlType] == (id)4)
  {
    CGFloat v24 = -2.0;
    CGFloat v25 = 0.0;
LABEL_9:
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = v17;
    v30.size.double height = v21;
    CGRect v31 = CGRectOffset(v30, v24, v25);
    double x = v31.origin.x;
    double y = v31.origin.y;
    double v17 = v31.size.width;
    double v21 = v31.size.height;
    goto LABEL_10;
  }
  if ((id)[(PHAudioControlsButton *)self controlType] == (id)19)
  {
    CGFloat v24 = 2.0;
    CGFloat v25 = 2.0;
    goto LABEL_9;
  }
LABEL_10:
  double v26 = x;
  double v27 = y;
  double v28 = v17;
  double v29 = v21;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_contentInsets = &self->_contentInsets;
  [(PHAudioControlsButton *)self bounds];
  CGFloat v10 = v9 - height - y;
  [(PHAudioControlsButton *)self bounds];
  p_contentInsets->double top = y;
  p_contentInsets->double left = x;
  p_contentInsets->bottom = v10;
  p_contentInsets->double right = v11 - x - width;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioControlsButton;
  [(PHAudioControlsButton *)&v4 setHighlighted:a3];
  [(PHAudioControlsButton *)self updateViewsAnimated:1];
  [(PHAudioControlsButton *)self sendSubviewToBack:self->_roundView];
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled]) {
    [(PHAudioControlsButton *)self sendSubviewToBack:self->_backdropEffectView];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHAudioControlsButton *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)PHAudioControlsButton;
  [(PHAudioControlsButton *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(PHAudioControlsButton *)self updateViewsAnimated:1];
  }
  [(PHAudioControlsButton *)self sendSubviewToBack:self->_roundView];
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled]) {
    [(PHAudioControlsButton *)self sendSubviewToBack:self->_backdropEffectView];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHAudioControlsButton *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)PHAudioControlsButton;
  [(PHAudioControlsButton *)&v6 setEnabled:v3];
  if (v5 != v3) {
    [(PHAudioControlsButton *)self updateViewsAnimated:1];
  }
  [(PHAudioControlsButton *)self sendSubviewToBack:self->_roundView];
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled]) {
    [(PHAudioControlsButton *)self sendSubviewToBack:self->_backdropEffectView];
  }
}

- (void)setControlImage:(id)a3
{
  unsigned int v5 = (UIImage *)a3;
  if (self->_controlImage != v5)
  {
    double v19 = v5;
    objc_storeStrong((id *)&self->_controlImage, a3);
    objc_super v6 = [(PHAudioControlsButton *)self controlImage];
    [(PHAudioControlsButton *)self setImage:v6 forStates:0];

    if ([(PHAudioControlsButton *)self isButtonLayoutEnabled])
    {
      double v7 = [(UIImage *)v19 imageWithRenderingMode:2];
      [v7 size];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      [(UIImage *)v19 scale];
      CGFloat v13 = v12;
      v21.double width = v9;
      v21.double height = v11;
      UIGraphicsBeginImageContextWithOptions(v21, 0, v13);
      double v14 = +[UIColor whiteColor];
      [v14 set];

      [(UIImage *)v19 size];
      double v16 = v15;
      [(UIImage *)v19 size];
      [v7 drawInRect:2 blendMode:0.0 alpha:0.0 v16, v17, 0.2];
      double v18 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      [(PHAudioControlsButton *)self setImage:v18 forState:2];
    }
    [(PHAudioControlsButton *)self updateViewsAnimated:0];
    unsigned int v5 = v19;
  }
}

- (void)updateViewsAnimated:(BOOL)a3
{
  [(PHAudioControlsButton *)self updateRoundViewColorAnimated:a3];
  [(PHAudioControlsButton *)self updateImageColor];
  [(PHAudioControlsButton *)self updateMaterialAndAlpha];
  [(PHAudioControlsButton *)self setNeedsDisplay];
  [(PHAudioControlsButton *)self forceDisplayIfNeeded];
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled]
    && (id)[(PHAudioControlsButton *)self controlType] == (id)16)
  {
    objc_super v4 = [(PHAudioControlsButton *)self roundView];
    [v4 setAlpha:0.0];

    unsigned int v5 = [(PHAudioControlsButton *)self backdropEffectView];
    [v5 setAlpha:0.0];
  }
  if ((id)[(PHAudioControlsButton *)self controlType] == (id)15)
  {
    objc_super v6 = [(PHAudioControlsButton *)self backdropView];
    [v6 setAlpha:0.0];

    id v7 = [(PHAudioControlsButton *)self backdropEffectView];
    [v7 setAlpha:0.0];
  }
}

- (void)updateMaterialAndAlpha
{
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled])
  {
    unsigned int v3 = [(PHAudioControlsButton *)self isSelected];
    objc_super v4 = [(PHAudioControlsButton *)self backdropEffectView];
    id v6 = v4;
    double v5 = 1.0;
    if (v3) {
      double v5 = 0.0;
    }
    [v4 setAlpha:v5];
  }
}

- (id)circleWithColor:(id)a3 radius:(int)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, (double)(2 * a4), (double)(2 * a4)];
  [v6 setBackgroundColor:v5];

  double v7 = (double)a4;
  double v8 = [v6 layer];
  [v8 setCornerRadius:v7];

  CGFloat v9 = [v6 layer];
  [v9 setMasksToBounds:1];

  return v6;
}

- (void)updateRoundViewColorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100040F94;
  v6[3] = &unk_1002CD518;
  v6[4] = self;
  objc_super v4 = objc_retainBlock(v6);
  id v5 = v4;
  if (v3) {
    +[UIView animateWithDuration:v4 animations:0.170000002];
  }
  else {
    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)updateImageColor
{
  if ([(PHAudioControlsButton *)self controlType]) {
    +[UIColor blackColor];
  }
  else {
  id v4 = +[UIColor systemRedColor];
  }
  if ([(PHAudioControlsButton *)self isSelected])
  {
    [(PHAudioControlsButton *)self setTintColor:v4];
  }
  else
  {
    BOOL v3 = +[UIColor whiteColor];
    [(PHAudioControlsButton *)self setTintColor:v3];
  }
}

- (BOOL)isButtonLayoutEnabled
{
  unint64_t v2 = +[CNKFeatures sharedInstance];
  unsigned __int8 v3 = [v2 isButtonLayoutEnabled];

  return v3;
}

- (CGSize)_buttonSize
{
  [(PHAudioControlsButton *)self sizeOverride];
  if (CGSizeZero.width == v4 && CGSizeZero.height == v3)
  {
    if ([(PHAudioControlsButton *)self isButtonLayoutEnabled])
    {
      double v8 = +[UIScreen mainScreen];
      [v8 bounds];
      double v10 = v9;
      double v12 = v11;

      if (v10 >= v12) {
        double v13 = v12;
      }
      else {
        double v13 = v10;
      }
      float v14 = v13 * 0.1976;
      double v6 = roundf(v14);
    }
    else
    {
      unint64_t v15 = +[PHUIConfiguration inCallControlSize];
      double v6 = 65.0;
      switch(v15)
      {
        case 1uLL:
          break;
        case 4uLL:
          double v6 = 85.0;
          break;
        default:
          double v6 = 75.0;
          break;
      }
    }
    double v7 = v6;
  }
  else
  {
    [(PHAudioControlsButton *)self sizeOverride];
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (double)_titleOffset
{
  unsigned __int8 v2 = [(PHAudioControlsButton *)self isButtonLayoutEnabled];
  double result = 6.0;
  if ((v2 & 1) == 0)
  {
    unint64_t v4 = +[PHUIConfiguration inCallControlSize];
    double result = 0.0;
    if (v4 - 1 <= 3) {
      return dbl_1002846F8[v4 - 1];
    }
  }
  return result;
}

- (void)setCaptureView:(id)a3
{
  id v6 = a3;
  if ([(PHAudioControlsButton *)self isButtonLayoutEnabled])
  {
    unint64_t v4 = [(PHAudioControlsButton *)self backdropEffectView];
    [v4 _setGroupName:@"InCallButtonsCaptureGroup"];

    id v5 = [(PHAudioControlsButton *)self backdropEffectView];
    [v5 _setCaptureView:v6];
  }
}

- (void)setMenuDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuDataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_menuDataSource, obj);
    [(PHAudioControlsButton *)self setContextMenuEnabled:obj != 0];
    [(PHAudioControlsButton *)self setContextMenuIsPrimary:obj != 0];
  }
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041578;
  v6[3] = &unk_1002CE100;
  CGPoint v7 = a4;
  v6[4] = self;
  unint64_t v4 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];

  return v4;
}

- (int64_t)ambientButtonType
{
  return 2 * ((id)[(PHAudioControlsButton *)self controlType] == (id)15);
}

- (NSArray)ambientButtonParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  roundView = self->_roundView;
  if (roundView)
  {
    id v5 = +[PHAmbientButtonPart partWithView:roundView type:0];
    [v3 addObject:v5];
  }
  backdropView = self->_backdropView;
  if (backdropView)
  {
    CGPoint v7 = +[PHAmbientButtonPart partWithView:backdropView type:0];
    [v3 addObject:v7];
  }
  if (self->_backdropEffectView && (id)[(PHAudioControlsButton *)self ambientButtonType] != (id)2)
  {
    double v8 = +[PHAmbientButtonPart partWithView:self->_backdropEffectView type:0];
    [v3 addObject:v8];
  }
  double v9 = [(PHAudioControlsButton *)self imageView];

  if (v9)
  {
    double v10 = [(PHAudioControlsButton *)self imageView];
    double v11 = +[PHAmbientButtonPart partWithView:v10 type:1];
    [v3 addObject:v11];
  }
  double v12 = [(PHAudioControlsButton *)self titleLabel];

  if (v12)
  {
    double v13 = [(PHAudioControlsButton *)self titleLabel];
    float v14 = +[PHAmbientButtonPart partWithView:v13 type:2];
    [v3 addObject:v14];
  }

  return (NSArray *)v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (UIImage)controlImage
{
  return self->_controlImage;
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (void)setControlType:(unint64_t)a3
{
  self->_controlType = a3;
}

- (PHAudioControlsButtonMenuDataSource)menuDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuDataSource);

  return (PHAudioControlsButtonMenuDataSource *)WeakRetained;
}

- (PHRoundView)roundView
{
  return (PHRoundView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRoundView:(id)a3
{
}

- (CGSize)sizeOverride
{
  objc_copyStruct(v4, &self->_sizeOverride, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  objc_copyStruct(v6, &self->_contentInsets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.double right = v5;
  result.bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->_contentInsets, &v3, 32, 1, 0);
}

- (UIView)backdropView
{
  return (UIView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackdropView:(id)a3
{
}

- (UIVisualEffectView)backdropEffectView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBackdropEffectView:(id)a3
{
}

- (CABackdropLayer)backdropLayer
{
  return (CABackdropLayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackdropLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_roundView, 0);
  objc_destroyWeak((id *)&self->_menuDataSource);
  objc_storeStrong((id *)&self->_controlImage, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end