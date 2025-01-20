@interface PHBottomBarButton
+ (UIFont)defaultFont;
- (BOOL)canBeEnabled;
- (BOOL)isShowingCountdown;
- (BOOL)usesSmallerFontSize;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)buttonSize;
- (CGSize)intrinsicContentSize;
- (NSArray)ambientButtonParts;
- (PHBottomBarButton)initWithConfiguration:(id)a3;
- (PHRingHighlightView)ringView;
- (UIColor)originalBackgroundColor;
- (UIView)overlayView;
- (UIView)roundView;
- (UIVisualEffectView)effectView;
- (double)diameter;
- (double)iconSizeRatio;
- (double)titleRectYOffset;
- (id)backgroundColor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)newOverlayView;
- (int64_t)actionType;
- (int64_t)ambientButtonType;
- (int64_t)orientation;
- (void)_performSetEnabled:(BOOL)a3;
- (void)_performSetHighlighted:(BOOL)a3;
- (void)_performSetSelected:(BOOL)a3;
- (void)layoutSubviews;
- (void)refreshForCallState:(int64_t)a3;
- (void)setActionType:(int64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonSize:(CGSize)a3;
- (void)setDiameter:(double)a3;
- (void)setEffectView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconSizeRatio:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOriginalBackgroundColor:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setRingView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUsesSmallerFontSize:(BOOL)a3;
@end

@implementation PHBottomBarButton

+ (UIFont)defaultFont
{
  if (defaultFont_onceToken != -1) {
    dispatch_once(&defaultFont_onceToken, &__block_literal_global_34);
  }
  double v2 = *(double *)&defaultFont_defaultFontSize;

  return +[UIFont systemFontOfSize:v2 weight:UIFontWeightRegular];
}

void __32__PHBottomBarButton_defaultFont__block_invoke(id a1)
{
  v1 = +[UIScreen mainScreen];
  double v2 = [v1 currentMode];
  [v2 size];
  int v4 = (int)v3;

  BOOL v5 = v4 > 2207 || v4 == 1334;
  double v6 = 13.0;
  if (v5) {
    double v6 = 15.0;
  }
  defaultFont_defaultFontSize = *(void *)&v6;
}

- (PHBottomBarButton)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)PHBottomBarButton;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[PHBottomBarButton initWithFrame:](&v72, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (!v8) {
    goto LABEL_16;
  }
  [v4 diameter];
  v8->_diameter = v9;
  v10 = [PHRoundView alloc];
  *(float *)&double v11 = v8->_diameter * 0.5;
  v12 = -[PHRoundView initWithFrame:cornerRadius:](v10, "initWithFrame:cornerRadius:", CGRectZero.origin.x, y, width, height, v11);
  roundView = v8->_roundView;
  v8->_roundView = &v12->super;

  [(UIView *)v8->_roundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [(UIView *)v8->_roundView widthAnchor];
  v15 = [v14 constraintEqualToConstant:v8->_diameter];
  [v15 setActive:1];

  v16 = [(UIView *)v8->_roundView heightAnchor];
  v17 = [v16 constraintEqualToConstant:v8->_diameter];
  [v17 setActive:1];

  [(UIView *)v8->_roundView setUserInteractionEnabled:0];
  v18 = v8->_roundView;
  v19 = [(PHBottomBarButton *)v8 imageView];
  [(PHBottomBarButton *)v8 insertSubview:v18 below:v19];

  v20 = [(PHBottomBarButton *)v8 titleLabel];
  [v20 setAdjustsFontSizeToFitWidth:0];

  v21 = [(PHBottomBarButton *)v8 titleLabel];
  [v21 setTextAlignment:1];

  v22 = [(id)objc_opt_class() defaultFont];
  v23 = [(PHBottomBarButton *)v8 titleLabel];
  [v23 setFont:v22];

  v24 = [(PHBottomBarButton *)v8 titleLabel];
  [v24 setLineBreakMode:4];

  if ((id)+[PHUIConfiguration inCallBottomBarMaxTitleSize] == (id)1)double v25 = 100.0; {
  else
  }
    double v25 = 105.0;
  v26 = [(PHBottomBarButton *)v8 titleLabel];
  [v26 setPreferredMaxLayoutWidth:v25];

  double v27 = v8->_diameter * 0.5;
  v28 = [(PHBottomBarButton *)v8 layer];
  [v28 setCornerRadius:v27];

  [(PHBottomBarButton *)v8 setClipsToBounds:0];
  [(PHBottomBarButton *)v8 setAdjustsImageWhenHighlighted:0];
  v29 = [v4 title];
  [(PHBottomBarButton *)v8 setTitle:v29 forState:0];

  v30 = [v4 icon];
  [(PHBottomBarButton *)v8 setImage:v30 forState:0];

  v31 = [(PHBottomBarButton *)v8 titleLabel];
  [v31 setNumberOfLines:0];

  v32 = [v4 backgroundColor];
  [(PHBottomBarButton *)v8 setBackgroundColor:v32];

  v33 = +[UIColor whiteColor];
  [(PHBottomBarButton *)v8 setTintColor:v33];

  v34 = [v4 accessibilityIdentifier];
  [(PHBottomBarButton *)v8 setAccessibilityIdentifier:v34];

  v35 = [v4 selectedIcon];

  if (v35)
  {
    v36 = [v4 selectedIcon];
    [(PHBottomBarButton *)v8 setImage:v36 forState:4];
  }
  if ([v4 action] == (id)12
    || [v4 action] == (id)25
    || [v4 action] == (id)13)
  {
    v37 = [v4 colorEffect];

    if (v37)
    {
      v38 = [v4 colorEffect];
      v39 = +[UIBlurEffect effectWithBlurRadius:40.0];
      id v40 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:0];
      [(PHBottomBarButton *)v8 setEffectView:v40];

      v73[0] = v38;
      v73[1] = v39;
      v41 = +[NSArray arrayWithObjects:v73 count:2];
      v42 = [(PHBottomBarButton *)v8 effectView];
      [v42 setBackgroundEffects:v41];

      v43 = [(PHBottomBarButton *)v8 effectView];
      [v43 _setGroupName:@"PHBottomBarButtonCaptureGroup"];

      v44 = [v4 captureView];
      v45 = [(PHBottomBarButton *)v8 effectView];
      [v45 _setCaptureView:v44];
    }
    v46 = [(PHBottomBarButton *)v8 effectView];
    [v46 setAutoresizingMask:18];

    v47 = [(PHBottomBarButton *)v8 layer];
    [v47 cornerRadius];
    double v49 = v48;
    v50 = [(PHBottomBarButton *)v8 effectView];
    v51 = [v50 layer];
    [v51 setCornerRadius:v49];

    v52 = [(PHBottomBarButton *)v8 effectView];
    [v52 setClipsToBounds:1];

    v53 = [(PHBottomBarButton *)v8 effectView];
    v54 = [(PHBottomBarButton *)v8 imageView];
    [(PHBottomBarButton *)v8 insertSubview:v53 belowSubview:v54];
    goto LABEL_13;
  }
  v61 = [v4 backgroundMaterial];

  if (v61)
  {
    id v62 = objc_alloc((Class)UIVisualEffectView);
    v63 = [v4 backgroundMaterial];
    id v64 = [v62 initWithEffect:v63];
    [(PHBottomBarButton *)v8 setEffectView:v64];

    v65 = [(PHBottomBarButton *)v8 effectView];
    [v65 setAutoresizingMask:18];

    v66 = [(PHBottomBarButton *)v8 layer];
    [v66 cornerRadius];
    double v68 = v67;
    v69 = [(PHBottomBarButton *)v8 effectView];
    v70 = [v69 layer];
    [v70 setCornerRadius:v68];

    v71 = [(PHBottomBarButton *)v8 effectView];
    [v71 setClipsToBounds:1];

    v53 = [(PHBottomBarButton *)v8 effectView];
    v54 = [(PHBottomBarButton *)v8 imageView];
    [(PHBottomBarButton *)v8 insertSubview:v53 below:v54];
LABEL_13:
  }
  -[PHBottomBarButton setAction:](v8, "setAction:", [v4 action]);
  if ([v4 action] == (id)36)
  {
    v55 = [v4 icon];
    [v55 size];
    double v57 = v56;
    v58 = [v4 icon];
    [v58 size];
    [(PHBottomBarButton *)v8 setIconSizeRatio:v57 / v59];

    -[PHBottomBarButton setActionType:](v8, "setActionType:", [v4 action]);
  }
LABEL_16:

  return v8;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PHBottomBarButton;
  [(PHBottomBarButton *)&v5 layoutSubviews];
  double v3 = [(PHBottomBarButton *)self effectView];

  if (v3)
  {
    id v4 = [(PHBottomBarButton *)self effectView];
    [(PHBottomBarButton *)self sendSubviewToBack:v4];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarButton;
  id v4 = -[PHBottomBarButton hitTest:withEvent:](&v6, "hitTest:withEvent:", a4, a3.x, a3.y);

  return v4;
}

- (CGSize)intrinsicContentSize
{
  [(PHBottomBarButton *)self iconSizeRatio];
  double v4 = v3;
  [(PHBottomBarButton *)self diameter];
  double v6 = v5;
  if (v4 != 0.0)
  {
    [(PHBottomBarButton *)self iconSizeRatio];
    double v6 = v6 * v7;
  }
  [(PHBottomBarButton *)self diameter];
  double v9 = v8;
  double v10 = v6;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v9.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v9.c = v5;
    *(_OWORD *)&v9.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if ((unint64_t)(a3 - 2) <= 2) {
      CGAffineTransformMakeRotation(&v9, dbl_100204530[a3 - 2]);
    }
    self->_orientation = a3;
    CGAffineTransform v8 = v9;
    double v6 = [(PHBottomBarButton *)self imageView];
    CGAffineTransform v7 = v8;
    [v6 setTransform:&v7];
  }
}

- (void)setUsesSmallerFontSize:(BOOL)a3
{
  self->_usesSmallerFontSize = a3;
  id v5 = +[UIFont systemFontOfSize:10.0];
  double v4 = [(PHBottomBarButton *)self titleLabel];
  [v4 setFont:v5];
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v20.receiver = self;
  v20.super_class = (Class)PHBottomBarButton;
  -[PHBottomBarButton imageRectForContentRect:](&v20, "imageRectForContentRect:", a3.origin.x, a3.origin.y);
  double v7 = v6;
  double v9 = v8;
  int64_t v10 = [(PHBottomBarButton *)self orientation];
  if ((unint64_t)(v10 - 3) >= 2) {
    double v11 = v9;
  }
  else {
    double v11 = v7;
  }
  if ((unint64_t)(v10 - 3) < 2) {
    double v7 = v9;
  }
  double x = width * 0.5 - v7 * 0.5;
  double y = height * 0.5 - v11 * 0.5;
  v14 = +[UIScreen mainScreen];
  [v14 scale];
  if (v15 == 1.0)
  {
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = v7;
    v21.size.double height = v11;
    CGRect v22 = CGRectIntegral(v21);
    double x = v22.origin.x;
    double y = v22.origin.y;
    double v7 = v22.size.width;
    double v11 = v22.size.height;
  }

  double v16 = x;
  double v17 = y;
  double v18 = v7;
  double v19 = v11;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double v8 = CGRectZero.size.width;
  double v9 = CGRectZero.size.height;
  uint64_t v10 = [(PHBottomBarButton *)self currentTitle];
  if (v10)
  {
    double v11 = (void *)v10;
    v12 = [(PHBottomBarButton *)self currentTitle];
    id v13 = [v12 length];

    if (v13)
    {
      v14 = [(PHBottomBarButton *)self titleLabel];
      [v14 preferredMaxLayoutWidth];
      double v16 = v15;
      if ((id)[(PHBottomBarButton *)self actionType] == (id)36) {
        double v17 = v16 + -15.0;
      }
      else {
        double v17 = v16;
      }
      double v18 = [v14 font];
      double v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        id v20 = [(id)objc_opt_class() defaultFont];
      }
      CGRect v21 = v20;

      NSAttributedStringKey v42 = NSFontAttributeName;
      v43 = v21;
      CGRect v22 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v23 = [(PHBottomBarButton *)self currentTitle];
      [v23 boundingRectWithSize:1 options:v22 context:3.40282347e38];
      double v25 = v24;
      double v27 = v26;

      double v28 = ceil(v25);
      if (v17 >= v28) {
        double v8 = v28;
      }
      else {
        double v8 = v17;
      }
      if (v8 == v17)
      {
        v29 = [(PHBottomBarButton *)self currentTitle];
        [v29 boundingRectWithSize:1 options:v22 context:v17];
        double v31 = v30;

        double v32 = ceil(v31);
        if (v32 <= 45.0) {
          double v9 = v32;
        }
        else {
          double v9 = 45.0;
        }
      }
      else
      {
        double v9 = ceil(v27);
      }
      double v33 = ceil(width * 0.5 - v8 * 0.5);
      int64_t v34 = [(PHBottomBarButton *)self actionType];
      double v35 = ceil((width + -15.0) * 0.5 - v8 * 0.5);
      if (v34 == 36) {
        double x = v35;
      }
      else {
        double x = v33;
      }
      [(PHBottomBarButton *)self titleRectYOffset];
      double v37 = height + v36;
      if (v8 == v17 && v9 == 45.0) {
        [v14 setAdjustsFontSizeToFitWidth:1];
      }
      double y = ceil(v37);
    }
  }
  double v38 = x;
  double v39 = y;
  double v40 = v8;
  double v41 = v9;
  result.size.double height = v41;
  result.size.double width = v40;
  result.origin.double y = v39;
  result.origin.double x = v38;
  return result;
}

- (double)titleRectYOffset
{
  double v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (!_os_feature_enabled_impl() || (double result = 6.0, v3 == (id)1))
  {
    if (titleRectYOffset_onceToken != -1) {
      dispatch_once(&titleRectYOffset_onceToken, &__block_literal_global_62);
    }
    return *(double *)&titleRectYOffset_yOffset;
  }
  return result;
}

void __37__PHBottomBarButton_titleRectYOffset__block_invoke(id a1)
{
  unint64_t v1 = +[PHUIConfiguration inCallBottomBarSpacing];
  double v2 = 8.0;
  if (v1 == 6) {
    double v2 = 11.0;
  }
  titleRectYOffset_yOffset = *(void *)&v2;
}

- (id)newOverlayView
{
  if ([(PHBottomBarButton *)self action] == (id)4
    || [(PHBottomBarButton *)self action] == (id)5
    || [(PHBottomBarButton *)self action] == (id)6
    || [(PHBottomBarButton *)self action] == (id)36)
  {
    id v3 = objc_alloc((Class)UIImageView);
    double v4 = [(PHBottomBarButton *)self imageView];
    id v5 = [v4 image];
    double v6 = +[UIColor blackColor];
    double v7 = [v5 _flatImageWithColor:v6];
    id v8 = [v3 initWithImage:v7];

    double v9 = +[UIColor clearColor];
    [v8 setBackgroundColor:v9];

    [(PHBottomBarButton *)self frame];
    -[PHBottomBarButton imageRectForContentRect:](self, "imageRectForContentRect:");
    [v8 setFrame:];
  }
  else
  {
    id v11 = objc_alloc((Class)UIView);
    [(PHBottomBarButton *)self bounds];
    id v8 = [v11 initWithFrame:];
    v12 = +[UIColor blackColor];
    [v8 setBackgroundColor:v12];

    [(PHBottomBarButton *)self frame];
    double v14 = v13 * 0.5;
    double v15 = [v8 layer];
    [v15 setCornerRadius:v14];
  }
  [v8 setAlpha:0.400000006];
  [v8 setUserInteractionEnabled:0];
  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHBottomBarButton *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarButton;
  [(PHBottomBarButton *)&v6 setEnabled:v3];
  if (v5 != v3) {
    [(PHBottomBarButton *)self _performSetEnabled:v3];
  }
}

- (void)_performSetEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHBottomBarButton *)self action] == (id)9 || [(PHBottomBarButton *)self action] == (id)12)
  {
    if (v3) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.3;
    }
    objc_super v6 = +[UIColor whiteColor];
    double v7 = [v6 colorWithAlphaComponent:v5];
    [(PHBottomBarButton *)self setTintColor:v7];
  }
  if ([(PHBottomBarButton *)self canBeEnabled])
  {
    if (v3)
    {
      [(PHBottomBarButton *)self setAlpha:1.0];
      if ([(PHBottomBarButton *)self action] == (id)1 || [(PHBottomBarButton *)self action] == (id)3)
      {
        uint64_t v8 = +[UIColor systemGreenColor];
      }
      else
      {
        uint64_t v8 = +[UIColor systemRedColor];
      }
      double v17 = (void *)v8;
      [(PHBottomBarButton *)self setBackgroundColor:v8];

      double v18 = [(PHBottomBarButton *)self layer];
      [v18 setCompositingFilter:0];

      double v19 = [(PHBottomBarButton *)self imageView];
      id v20 = [v19 image];
      CGRect v21 = +[UIColor whiteColor];
      id v22 = [v20 _flatImageWithColor:v21];

      [(PHBottomBarButton *)self setImage:v22 forState:0];
    }
    else
    {
      double v9 = +[UIColor whiteColor];
      [(PHBottomBarButton *)self setBackgroundColor:v9];

      [(PHBottomBarButton *)self setAlpha:0.0500000007];
      uint64_t v10 = [(PHBottomBarButton *)self imageView];
      id v11 = [v10 image];
      v12 = +[UIColor blackColor];
      id v22 = [v11 _flatImageWithColor:v12];

      [(PHBottomBarButton *)self setImage:v22 forState:0];
      [(PHBottomBarButton *)self setImage:v22 forState:2];
      double v13 = [(PHBottomBarButton *)self layer];
      [v13 setAllowsGroupBlending:0];

      double v14 = [(PHBottomBarButton *)self layer];
      [v14 setAllowsGroupOpacity:0];

      double v15 = +[CAFilter filterWithType:kCAFilterOverlayBlendMode];
      double v16 = [(PHBottomBarButton *)self layer];
      [v16 setCompositingFilter:v15];
    }
  }
}

- (BOOL)canBeEnabled
{
  if ([(PHBottomBarButton *)self action] == (id)15 || [(PHBottomBarButton *)self action] == (id)16) {
    goto LABEL_6;
  }
  id v3 = [(PHBottomBarButton *)self action];
  if (v3 != (id)1)
  {
    if ([(PHBottomBarButton *)self action] == (id)7 || [(PHBottomBarButton *)self action] == (id)3)
    {
LABEL_6:
      LOBYTE(v3) = 1;
      return (char)v3;
    }
    LOBYTE(v3) = [(PHBottomBarButton *)self action] == (id)8;
  }
  return (char)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  if ((((self->_overlayView == 0) ^ a3) & 1) == 0) {
    -[PHBottomBarButton _performSetHighlighted:](self, "_performSetHighlighted:");
  }
}

- (void)_performSetHighlighted:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(PHBottomBarButton *)self newOverlayView];
    overlayView = self->_overlayView;
    self->_overlayView = v4;

    objc_super v6 = self->_overlayView;
    [(PHBottomBarButton *)self addSubview:v6];
  }
  else if ([(PHBottomBarButton *)self isSelected])
  {
    [(UIView *)self->_overlayView removeFromSuperview];
    double v7 = self->_overlayView;
    self->_overlayView = 0;
  }
  else
  {
    uint64_t v8 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    double v9 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [v8 setTimingFunction:v9];

    [v8 setToValue:&off_10028D0D8];
    [v8 setDuration:0.5];
    [v8 setFillMode:kCAFillModeForwards];
    [v8 setRemovedOnCompletion:0];
    +[CATransaction begin];
    uint64_t v10 = self->_overlayView;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __44__PHBottomBarButton__performSetHighlighted___block_invoke;
    v13[3] = &unk_10027C670;
    double v14 = v10;
    id v11 = v10;
    +[CATransaction setCompletionBlock:v13];
    v12 = [(UIView *)self->_overlayView layer];
    [v12 addAnimation:v8 forKey:@"opacityAnimation"];

    +[CATransaction commit];
  }
}

id __44__PHBottomBarButton__performSetHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHBottomBarButton *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarButton;
  [(PHBottomBarButton *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(PHBottomBarButton *)self _performSetSelected:v3];
  }
}

- (void)_performSetSelected:(BOOL)a3
{
  if (a3)
  {
    double v4 = [(PHBottomBarButton *)self backgroundColor];
    [(PHBottomBarButton *)self setOriginalBackgroundColor:v4];

    id v6 = [(PHBottomBarButton *)self backgroundColor];
    unsigned int v5 = [v6 colorWithAlphaComponent:1.0];
    [(PHBottomBarButton *)self setBackgroundColor:v5];
  }
  else
  {
    id v6 = [(PHBottomBarButton *)self originalBackgroundColor];
    -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:");
  }
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)backgroundColor
{
  return [(UIView *)self->_roundView backgroundColor];
}

- (int64_t)ambientButtonType
{
  return [(PHBottomBarButton *)self action] == (id)1;
}

- (NSArray)ambientButtonParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  roundView = self->_roundView;
  if (roundView)
  {
    unsigned int v5 = +[PHAmbientButtonPart partWithView:roundView type:0];
    [v3 addObject:v5];
  }
  effectView = self->_effectView;
  if (effectView)
  {
    double v7 = +[PHAmbientButtonPart partWithView:effectView type:0];
    [v3 addObject:v7];
  }
  overlayView = self->_overlayView;
  if (overlayView)
  {
    double v9 = +[PHAmbientButtonPart partWithView:overlayView type:0];
    [v3 addObject:v9];
  }
  uint64_t v10 = [(PHBottomBarButton *)self imageView];

  if (v10)
  {
    id v11 = [(PHBottomBarButton *)self imageView];
    v12 = +[PHAmbientButtonPart partWithView:v11 type:1];
    [v3 addObject:v12];
  }
  double v13 = [(PHBottomBarButton *)self titleLabel];

  if (v13)
  {
    double v14 = [(PHBottomBarButton *)self titleLabel];
    double v15 = +[PHAmbientButtonPart partWithView:v14 type:2];
    [v3 addObject:v15];
  }

  return (NSArray *)v3;
}

- (void)refreshForCallState:(int64_t)a3
{
  unsigned int v5 = [PHBottomBarButtonConfiguration alloc];
  id v6 = [(PHBottomBarButton *)self action];
  [(PHBottomBarButton *)self diameter];
  double v7 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v5, "initWithAction:diameter:callState:", v6, a3);
  uint64_t v8 = [(PHBottomBarButtonConfiguration *)v7 icon];
  [(PHBottomBarButton *)self setImage:v8 forState:0];

  double v9 = [(PHBottomBarButtonConfiguration *)v7 backgroundColor];
  [(PHBottomBarButton *)self setBackgroundColor:v9];

  uint64_t v10 = [(PHBottomBarButtonConfiguration *)v7 selectedIcon];

  if (v10)
  {
    id v11 = [(PHBottomBarButtonConfiguration *)v7 selectedIcon];
    [(PHBottomBarButton *)self setImage:v11 forState:4];
  }
  v12 = [(PHBottomBarButton *)self imageView];
  double v13 = [v12 layer];
  long long v14 = *(_OWORD *)&CATransform3DIdentity.m33;
  v18[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v18[5] = v14;
  long long v15 = *(_OWORD *)&CATransform3DIdentity.m43;
  v18[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v18[7] = v15;
  long long v16 = *(_OWORD *)&CATransform3DIdentity.m13;
  v18[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v18[1] = v16;
  long long v17 = *(_OWORD *)&CATransform3DIdentity.m23;
  v18[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v18[3] = v17;
  [v13 setTransform:v18];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)usesSmallerFontSize
{
  return self->_usesSmallerFontSize;
}

- (BOOL)isShowingCountdown
{
  return self->_isShowingCountdown;
}

- (UIView)roundView
{
  return self->_roundView;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIColor)originalBackgroundColor
{
  return self->_originalBackgroundColor;
}

- (void)setOriginalBackgroundColor:(id)a3
{
}

- (CGSize)buttonSize
{
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (PHRingHighlightView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
}

- (double)iconSizeRatio
{
  return self->_iconSizeRatio;
}

- (void)setIconSizeRatio:(double)a3
{
  self->_iconSizeRatio = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_roundView, 0);
}

@end