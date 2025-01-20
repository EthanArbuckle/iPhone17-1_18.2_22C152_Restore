@interface PHBottomBarSupplementalButton
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (PHBottomBarSupplementalButton)initWithAction:(int64_t)a3;
- (PHBottomBarSupplementalButton)initWithText:(id)a3 image:(id)a4;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PHBottomBarSupplementalButton

- (PHBottomBarSupplementalButton)initWithText:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[PHBottomBarSupplementalButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    [(PHBottomBarSupplementalButton *)v8 setTitle:v6 forState:0];
    [(PHBottomBarSupplementalButton *)v9 setImage:v7 forState:0];
    v10 = +[UIColor whiteColor];
    [(PHBottomBarSupplementalButton *)v9 setTintColor:v10];

    v11 = [(PHBottomBarSupplementalButton *)v9 titleLabel];
    [v11 setTextAlignment:1];

    v12 = +[PHBottomBarButton defaultFont];
    v13 = [(PHBottomBarSupplementalButton *)v9 titleLabel];
    [v13 setFont:v12];

    v14 = [(PHBottomBarSupplementalButton *)v9 titleLabel];
    [v14 setLineBreakMode:4];

    v15 = [(PHBottomBarSupplementalButton *)v9 titleLabel];
    [v15 setNumberOfLines:2];
  }
  return v9;
}

- (PHBottomBarSupplementalButton)initWithAction:(int64_t)a3
{
  switch(a3)
  {
    case 9:
      goto LABEL_4;
    case 10:
      v5 = +[UIImage tpImageForSymbolType:14 textStyle:UIFontTextStyleTitle3 scale:-1 isStaticSize:1];
      id v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"SCREENING_BLOCK";
      goto LABEL_10;
    case 11:
      v5 = +[UIImage tpImageForSymbolType:14 textStyle:UIFontTextStyleTitle3 scale:-1 isStaticSize:1];
      id v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"SCREENING_STOP";
      goto LABEL_10;
    case 12:
      goto LABEL_5;
    case 13:
      v5 = +[UIImage tpImageForSymbolType:39 textStyle:UIFontTextStyleTitle3 scale:-1 isStaticSize:1];
      id v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"CALL_BACK_LATER";
      goto LABEL_10;
    default:
      if (a3 == 28)
      {
LABEL_4:
        v5 = +[UIImage tpImageForSymbolType:14 textStyle:UIFontTextStyleTitle3 scale:-1 isStaticSize:1];
        id v6 = +[NSBundle mainBundle];
        id v7 = v6;
        CFStringRef v8 = @"SEND_MESSAGE";
LABEL_10:
        v11 = [v6 localizedStringForKey:v8 value:&stru_1002D6110 table:@"BottomBar"];
        self = [(PHBottomBarSupplementalButton *)self initWithText:v11 image:v5];

        v10 = self;
      }
      else
      {
LABEL_5:
        v9 = sub_1000D5130();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1001EC314(a3, v9);
        }

        v10 = 0;
      }

      return v10;
  }
}

- (CGSize)intrinsicContentSize
{
  +[PHBottomBarButtonConfiguration defaultHeight];
  double v4 = v3;
  v5 = [(PHBottomBarSupplementalButton *)self image];
  [v5 size];
  double v7 = v6;

  CFStringRef v8 = [(PHBottomBarSupplementalButton *)self titleLabel];
  [v8 intrinsicContentSize];
  double v10 = v9;

  if (v7 >= v10) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  if (v4 >= v11) {
    double v11 = v4;
  }
  double v12 = ceil(v11);
  if (v12 <= 100.0) {
    double v13 = v12;
  }
  else {
    double v13 = 100.0;
  }
  +[PHBottomBarButtonConfiguration defaultHeight];
  double v15 = v14;
  double v16 = v13;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)PHBottomBarSupplementalButton;
  -[PHBottomBarSupplementalButton imageRectForContentRect:](&v8, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width * 0.5 - v4 * 0.5;
  double v7 = 2.0;
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double width = a3.size.width;
  v19.receiver = self;
  v19.super_class = (Class)PHBottomBarSupplementalButton;
  -[PHBottomBarSupplementalButton titleRectForContentRect:](&v19, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = [(PHBottomBarSupplementalButton *)self imageForState:0];
  [v5 size];
  double v7 = v6 + 10.0;

  +[PHBottomBarButtonConfiguration defaultHeight];
  double v9 = v8 - v7;
  double v10 = [(PHBottomBarSupplementalButton *)self currentTitle];
  NSAttributedStringKey v20 = NSFontAttributeName;
  double v11 = +[PHBottomBarButton defaultFont];
  v21 = v11;
  double v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v10 boundingRectWithSize:1 options:v12 attributes:0 context:width, 3.40282347e38];
  double v14 = v13;

  if (v9 >= v14) {
    double v15 = v14;
  }
  else {
    double v15 = v9;
  }
  double v16 = 0.0;
  double v17 = v7;
  double v18 = width;
  result.size.height = v15;
  result.size.double width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHBottomBarSupplementalButton *)self isHighlighted];
  v11.receiver = self;
  v11.super_class = (Class)PHBottomBarSupplementalButton;
  [(PHBottomBarSupplementalButton *)&v11 setHighlighted:v3];
  if (v5 != v3)
  {
    if (v3)
    {
      double v6 = [(PHBottomBarSupplementalButton *)self layer];
      [v6 removeAllAnimations];

      double v7 = [(PHBottomBarSupplementalButton *)self layer];
      LODWORD(v8) = 1045220557;
      [v7 setOpacity:v8];
    }
    else
    {
      double v7 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
      double v9 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
      [v7 setTimingFunction:v9];

      [v7 setToValue:&off_1002DF9D8];
      [v7 setDuration:0.5];
      [v7 setFillMode:kCAFillModeForwards];
      [v7 setDelegate:self];
      [v7 setRemovedOnCompletion:0];
      double v10 = [(PHBottomBarSupplementalButton *)self layer];
      [v10 addAnimation:v7 forKey:@"opacityAnimation"];
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  unsigned int v5 = [(PHBottomBarSupplementalButton *)self layer];
  double v6 = [v5 animationForKey:@"opacityAnimation"];

  if (v6)
  {
    if ([(PHBottomBarSupplementalButton *)self isHighlighted]) {
      float v7 = 0.2;
    }
    else {
      float v7 = 1.0;
    }
    double v8 = [(PHBottomBarSupplementalButton *)self layer];
    *(float *)&double v9 = v7;
    [v8 setOpacity:v9];

    id v10 = [(PHBottomBarSupplementalButton *)self layer];
    [v10 removeAnimationForKey:@"opacityAnimation"];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(PHBottomBarSupplementalButton *)self isEnabled];
  v10.receiver = self;
  v10.super_class = (Class)PHBottomBarSupplementalButton;
  [(PHBottomBarSupplementalButton *)&v10 setEnabled:v3];
  if (v5 != v3)
  {
    if (v3)
    {
      [(PHBottomBarSupplementalButton *)self setAlpha:1.0];
      double v6 = [(PHBottomBarSupplementalButton *)self layer];
      [v6 setCompositingFilter:0];
    }
    else
    {
      [(PHBottomBarSupplementalButton *)self setAlpha:0.0500000007];
      float v7 = [(PHBottomBarSupplementalButton *)self layer];
      [v7 setAllowsGroupBlending:0];

      double v8 = [(PHBottomBarSupplementalButton *)self layer];
      [v8 setAllowsGroupOpacity:0];

      double v6 = +[CAFilter filterWithType:kCAFilterOverlayBlendMode];
      double v9 = [(PHBottomBarSupplementalButton *)self layer];
      [v9 setCompositingFilter:v6];
    }
  }
}

@end