@interface NPKRemotePassActionPassView
+ (CGSize)_passImageSize;
+ (CGSize)contactImageSize;
+ (void)_applyShadowToView:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NPKRemotePassActionPassView)initWithPassImage:(id)a3 frame:(CGRect)a4;
- (UIImage)contactImage;
- (void)_setUpContactImageView;
- (void)_setUpPassImageViewForImage:(id)a3;
- (void)layoutSubviews;
- (void)setContactImage:(id)a3;
- (void)shakeImage;
- (void)smallShakeImage;
@end

@implementation NPKRemotePassActionPassView

- (NPKRemotePassActionPassView)initWithPassImage:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NPKRemotePassActionPassView;
  v10 = -[NPKRemotePassActionPassView initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    passImageView = v10->_passImageView;
    v10->_passImageView = v11;

    v13 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    contactImageView = v10->_contactImageView;
    v10->_contactImageView = v13;

    v15 = (UIView *)objc_alloc_init((Class)UIView);
    contactBackgroundView = v10->_contactBackgroundView;
    v10->_contactBackgroundView = v15;

    [(NPKRemotePassActionPassView *)v10 _setUpPassImageViewForImage:v9];
    [(NPKRemotePassActionPassView *)v10 _setUpContactImageView];
  }

  return v10;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NPKRemotePassActionPassView;
  [(NPKRemotePassActionPassView *)&v13 layoutSubviews];
  [(NPKRemotePassActionPassView *)self bounds];
  double v4 = v3;
  [(id)objc_opt_class() _passImageSize];
  -[UIImageView setFrame:](self->_passImageView, "setFrame:", v4 * 0.5 - v5 * 0.5, 0.0, v5, v6);
  [(id)objc_opt_class() contactImageSize];
  [(NPKRemotePassActionPassView *)self _shouldReverseLayoutDirection];
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v10 = v9 + 4.0;
  -[UIView setFrame:](self->_contactBackgroundView, "setFrame:", v7 + -2.0, v8 + -2.0, v9 + 4.0, v11 + 4.0);
  v12 = [(UIView *)self->_contactBackgroundView layer];
  [v12 setCornerRadius:v10 * 0.5];

  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](self->_contactImageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() _passImageSize];
  double v5 = v4;
  [(id)objc_opt_class() contactImageSize];
  double v7 = v5 + v6 * 0.5;
  double v8 = width;
  result.double height = v7;
  result.CGFloat width = v8;
  return result;
}

- (UIImage)contactImage
{
  return [(UIImageView *)self->_contactImageView image];
}

- (void)setContactImage:(id)a3
{
  -[UIImageView setImage:](self->_contactImageView, "setImage:");
  BOOL v5 = a3 == 0;
  [(UIImageView *)self->_contactImageView setHidden:v5];
  contactBackgroundView = self->_contactBackgroundView;

  [(UIView *)contactBackgroundView setHidden:v5];
}

- (void)shakeImage
{
  [(UIImageView *)self->_passImageView pkui_shakeWithCompletion:0];
  [(UIView *)self->_contactBackgroundView pkui_smallShakeWithCompletion:0];
  contactImageView = self->_contactImageView;

  [(UIImageView *)contactImageView pkui_smallShakeWithCompletion:0];
}

- (void)smallShakeImage
{
}

+ (CGSize)contactImageSize
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (CGSize)_passImageSize
{
  double v2 = 190.0;
  double v3 = 121.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)_setUpPassImageViewForImage:(id)a3
{
  passImageView = self->_passImageView;
  if (passImageView)
  {
    id v5 = a3;
    double v6 = [(UIImageView *)passImageView layer];
    [v6 setMasksToBounds:1];

    double v7 = [(UIImageView *)self->_passImageView layer];
    [v7 setCornerCurve:kCACornerCurveContinuous];

    double v8 = [(UIImageView *)self->_passImageView layer];
    [v8 setCornerRadius:5.5];

    [(UIImageView *)self->_passImageView setImage:v5];
    [(id)objc_opt_class() _applyShadowToView:self->_passImageView];
    [(UIImageView *)self->_passImageView setAccessibilityIgnoresInvertColors:1];
    double v9 = self->_passImageView;
    [(NPKRemotePassActionPassView *)self addSubview:v9];
  }
}

- (void)_setUpContactImageView
{
  if (self->_contactBackgroundView && self->_contactImageView)
  {
    double v3 = +[UIColor labelColor];
    [(UIView *)self->_contactBackgroundView setBackgroundColor:v3];

    [(id)objc_opt_class() _applyShadowToView:self->_contactBackgroundView];
    [(NPKRemotePassActionPassView *)self addSubview:self->_contactBackgroundView];
    [(UIImageView *)self->_contactImageView setAccessibilityIgnoresInvertColors:1];
    contactImageView = self->_contactImageView;
    contactBackgroundView = self->_contactBackgroundView;
    [(NPKRemotePassActionPassView *)self insertSubview:contactImageView aboveSubview:contactBackgroundView];
  }
}

+ (void)_applyShadowToView:(id)a3
{
  id v3 = a3;
  double v4 = [v3 layer];
  [v4 setShadowRadius:12.0];

  id v5 = +[UIColor colorWithWhite:0.0 alpha:0.15];
  id v6 = [v5 CGColor];
  double v7 = [v3 layer];
  [v7 setShadowColor:v6];

  double v8 = [v3 layer];
  [v8 setShadowOffset:0.0, 12.0];

  id v10 = [v3 layer];

  LODWORD(v9) = 1.0;
  [v10 setShadowOpacity:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactBackgroundView, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);

  objc_storeStrong((id *)&self->_passImageView, 0);
}

@end