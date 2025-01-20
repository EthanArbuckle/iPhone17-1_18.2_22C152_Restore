@interface MSMessageExtensionBalloonLoadingView
- (BOOL)isFromMe;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MSMessageExtensionBalloonLoadingView)initWithAppIcon:(id)a3 fromMe:(BOOL)a4;
- (UIActivityIndicatorView)spinnerView;
- (UIEdgeInsets)insets;
- (UIImage)appIcon;
- (UIImageView)iconView;
- (UILabel)titleLabel;
- (double)iconWidth;
- (double)itemPadding;
- (double)spinnerHorizontalPadding;
- (void)layoutSubviews;
- (void)setAppIcon:(id)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MSMessageExtensionBalloonLoadingView

- (MSMessageExtensionBalloonLoadingView)initWithAppIcon:(id)a3 fromMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MSMessageExtensionBalloonLoadingView;
  v7 = -[_MSBlurCapableView initWithFrame:](&v32, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    [(MSMessageExtensionBalloonLoadingView *)v7 setAppIcon:v6];
    id v9 = objc_alloc((Class)UIImageView);
    v10 = [(MSMessageExtensionBalloonLoadingView *)v8 appIcon];
    id v11 = [v9 initWithImage:v10];

    [v11 setContentMode:1];
    id v12 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v12 setHidesWhenStopped:1];
    [v12 startAnimating];
    id v13 = objc_alloc_init((Class)UILabel);
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"LOADING" value:&stru_3D720 table:@"Localizable"];
    [v13 setText:v15];

    v16 = +[CKUIBehavior sharedBehaviors];
    v17 = [v16 transcriptLoadingViewTextFont];
    [v13 setFont:v17];

    [(MSMessageExtensionBalloonLoadingView *)v8 setFromMe:v4];
    v18 = [v11 image];
    [v18 size];
    double v20 = v19;
    double v22 = v21;

    if (v20 != CGSizeZero.width || v22 != CGSizeZero.height)
    {
      [(MSMessageExtensionBalloonLoadingView *)v8 iconWidth];
      double v24 = v23;
      [(MSMessageExtensionBalloonLoadingView *)v8 iconWidth];
      objc_msgSend(v11, "setFrame:", 0.0, 0.0, v24, v22 / v20 * v25);
    }
    [(MSMessageExtensionBalloonLoadingView *)v8 addSubview:v11];
    [(MSMessageExtensionBalloonLoadingView *)v8 setIconView:v11];
    [(MSMessageExtensionBalloonLoadingView *)v8 addSubview:v12];
    [(MSMessageExtensionBalloonLoadingView *)v8 setSpinnerView:v12];
    v26 = [(MSMessageExtensionBalloonLoadingView *)v8 spinnerView];
    [v26 sizeToFit];

    [(MSMessageExtensionBalloonLoadingView *)v8 addSubview:v13];
    [(MSMessageExtensionBalloonLoadingView *)v8 setTitleLabel:v13];
    v27 = +[CKUIBehavior sharedBehaviors];
    v28 = [v27 theme];
    v29 = [v28 balloonColorsForColorType:0xFFFFFFFFLL];
    v30 = [v29 lastObject];
    [(MSMessageExtensionBalloonLoadingView *)v8 setBackgroundColor:v30];
  }
  return v8;
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)MSMessageExtensionBalloonLoadingView;
  [(MSMessageExtensionBalloonLoadingView *)&v55 layoutSubviews];
  v3 = [(MSMessageExtensionBalloonLoadingView *)self titleLabel];
  [v3 sizeToFit];

  BOOL v4 = [(MSMessageExtensionBalloonLoadingView *)self titleLabel];
  [v4 frame];
  uint64_t v52 = v6;
  double v54 = v5;

  [(MSMessageExtensionBalloonLoadingView *)self insets];
  v7 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
  v8 = [v7 image];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  id v13 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  [(MSMessageExtensionBalloonLoadingView *)self bounds];
  double MidY = CGRectGetMidY(v56);
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  BOOL v25 = v12 == height && v10 == CGSizeZero.width;
  if (v25)
  {
    double v26 = MidY;
  }
  else
  {
    double v27 = MidY;
    [(MSMessageExtensionBalloonLoadingView *)self insets];
    double v15 = v28;
    [(MSMessageExtensionBalloonLoadingView *)self insets];
    *(float *)&double v29 = v29;
    double v26 = v27;
    float v30 = v27 + v21 * -0.5;
    double v17 = fmaxf(*(float *)&v29, v30);
    double height = v21;
    double width = v19;
  }
  v31 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
  objc_msgSend(v31, "setFrame:", v15, v17, width, height);

  objc_super v32 = [(MSMessageExtensionBalloonLoadingView *)self spinnerView];
  [v32 frame];
  double v34 = v33;
  double v36 = v35;

  v37 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
  [v37 frame];
  double MaxX = CGRectGetMaxX(v57);
  if (v25)
  {
    [(MSMessageExtensionBalloonLoadingView *)self insets];
    double v40 = v39;
  }
  else
  {
    [(MSMessageExtensionBalloonLoadingView *)self spinnerHorizontalPadding];
  }
  CGFloat v41 = MaxX + v40;

  double v42 = v26;
  CGFloat v43 = v26 - v36 * 0.5;
  v44 = [(MSMessageExtensionBalloonLoadingView *)self spinnerView];
  objc_msgSend(v44, "setFrame:", v41, v43, v34, v36);

  v58.origin.x = v41;
  v58.origin.y = v43;
  v58.size.double width = v34;
  v58.size.double height = v36;
  double v45 = CGRectGetMaxX(v58);
  [(MSMessageExtensionBalloonLoadingView *)self spinnerHorizontalPadding];
  double v47 = v45 + v46;
  [(MSMessageExtensionBalloonLoadingView *)self insets];
  *(float *)&double v48 = v48;
  float v49 = v42 - v53 * 0.5;
  double v50 = fmaxf(*(float *)&v48, v49);
  v51 = [(MSMessageExtensionBalloonLoadingView *)self titleLabel];
  objc_msgSend(v51, "setFrame:", v47, v50, v54, v53);
}

- (void)setAppIcon:(id)a3
{
  v7 = (UIImage *)a3;
  if (self->_appIcon != v7)
  {
    objc_storeStrong((id *)&self->_appIcon, a3);
    double v5 = [(MSMessageExtensionBalloonLoadingView *)self iconView];

    if (v5)
    {
      uint64_t v6 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
      [v6 setImage:v7];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(MSMessageExtensionBalloonLoadingView *)self titleLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  [(MSMessageExtensionBalloonLoadingView *)self insets];
  double v17 = v16;
  double v18 = 0.0;
  if (v13 != CGSizeZero.width || v15 != CGSizeZero.height) {
    [(MSMessageExtensionBalloonLoadingView *)self itemPadding];
  }
  double v20 = v13 + v17 + v18;
  double v21 = [(MSMessageExtensionBalloonLoadingView *)self spinnerView];
  [v21 frame];
  double v23 = v20 + v22;
  [(MSMessageExtensionBalloonLoadingView *)self spinnerHorizontalPadding];
  double v25 = v8 + v24 + v23;
  [(MSMessageExtensionBalloonLoadingView *)self insets];
  double v27 = v26 + v25;

  [(MSMessageExtensionBalloonLoadingView *)self insets];
  double v29 = v28;
  v31 = [(MSMessageExtensionBalloonLoadingView *)self iconView];
  [v31 frame];
  float v33 = v32;
  float v30 = v10;
  double v34 = v29 + fmaxf(v30, v33);
  [(MSMessageExtensionBalloonLoadingView *)self insets];
  double v36 = v35 + v34;

  double v37 = v27;
  double v38 = v36;
  result.double height = v38;
  result.double width = v37;
  return result;
}

- (UIEdgeInsets)insets
{
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 balloonMaskTailWidth];
  double v5 = v4;

  [(MSMessageExtensionBalloonLoadingView *)self itemPadding];
  double v7 = v6;
  [(MSMessageExtensionBalloonLoadingView *)self itemPadding];
  double v9 = v8;
  if ([(MSMessageExtensionBalloonLoadingView *)self isFromMe]) {
    double v10 = 0.0;
  }
  else {
    double v10 = v5;
  }
  double v11 = v9 + v10;
  [(MSMessageExtensionBalloonLoadingView *)self itemPadding];
  double v13 = v12;
  [(MSMessageExtensionBalloonLoadingView *)self itemPadding];
  double v15 = v14;
  if ([(MSMessageExtensionBalloonLoadingView *)self isFromMe]) {
    double v16 = v5;
  }
  else {
    double v16 = 0.0;
  }
  double v17 = v15 + v16;
  double v18 = v7;
  double v19 = v11;
  double v20 = v13;
  result.right = v17;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)itemPadding
{
  return 10.0;
}

- (double)spinnerHorizontalPadding
{
  return 6.0;
}

- (double)iconWidth
{
  return 40.0;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_appIcon, 0);
}

@end