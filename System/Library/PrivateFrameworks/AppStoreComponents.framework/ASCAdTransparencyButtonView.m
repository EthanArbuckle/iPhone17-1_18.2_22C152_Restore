@interface ASCAdTransparencyButtonView
+ (id)adButtonTitleLocalized;
+ (id)adTransparencyButtonImage;
+ (id)buttonFontCompatibleWithTraitColletion:(id)a3;
+ (id)selectedTitleColor;
+ (id)titleColor;
- (ASCAdTransparencyButtonView)initWithCoder:(id)a3;
- (ASCAdTransparencyButtonView)initWithFrame:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)onPreferredContentSizeCategoryChange;
- (void)setLoading:(BOOL)a3;
- (void)updateFont;
- (void)updateInsets;
@end

@implementation ASCAdTransparencyButtonView

+ (id)titleColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (id)selectedTitleColor
{
  v2 = [a1 titleColor];
  v3 = [v2 colorWithAlphaComponent:0.22];

  return v3;
}

+ (id)adTransparencyButtonImage
{
  return +[ASCImageRenderer bundleImageNamed:@"adTransparencyButton" compatibleWithTraitCollection:0];
}

+ (id)adButtonTitleLocalized
{
  return (id)ASCLocalizedString(@"IAD_PRIVACY_MARKER_BUTTON_TITLE", a2);
}

+ (id)buttonFontCompatibleWithTraitColletion:(id)a3
{
  v3 = [a3 preferredContentSizeCategory];
  +[__ASCLayoutProxy adTransparencyButtonTitlePointSizeProvider:v3];
  double v5 = v4;

  if (!buttonFontCompatibleWithTraitColletion__buttonFont
    || ([(id)buttonFontCompatibleWithTraitColletion__buttonFont pointSize], v6 != v5))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1798] systemFontOfSize:v5 weight:*MEMORY[0x1E4FB29C8]];
    v8 = (void *)buttonFontCompatibleWithTraitColletion__buttonFont;
    buttonFontCompatibleWithTraitColletion__buttonFont = v7;
  }
  v9 = (void *)buttonFontCompatibleWithTraitColletion__buttonFont;

  return v9;
}

- (ASCAdTransparencyButtonView)initWithFrame:(CGRect)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)ASCAdTransparencyButtonView;
  v3 = -[ASCAdTransparencyButtonView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[ASCAdTransparencyButtonView adTransparencyButtonImage];
    [(ASCAdTransparencyButtonView *)v3 setBackgroundImage:v4 forState:0];

    double v5 = +[ASCAdTransparencyButtonView titleColor];
    [(ASCAdTransparencyButtonView *)v3 setTitleColor:v5 forState:0];

    double v6 = +[ASCAdTransparencyButtonView selectedTitleColor];
    [(ASCAdTransparencyButtonView *)v3 setTitleColor:v6 forState:4];

    self;
    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.6 green:0.8 blue:0.996078431 alpha:1.0];
    [(ASCAdTransparencyButtonView *)v3 setTintColor:v7];

    -[ASCAdTransparencyButtonView setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    -[ASCAdTransparencyButtonView _setTouchInsets:](v3, "_setTouchInsets:", -10.0, -5.0, -10.0, -5.0);
    v8 = +[ASCAdTransparencyButtonView adButtonTitleLocalized];
    [(ASCAdTransparencyButtonView *)v3 setTitle:v8 forState:0];

    v9 = [(ASCAdTransparencyButtonView *)v3 imageView];
    [v9 setContentMode:0];

    [(ASCAdTransparencyButtonView *)v3 updateFont];
    [(ASCAdTransparencyButtonView *)v3 updateInsets];
    v10 = self;
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v12 = (id)[(ASCAdTransparencyButtonView *)v3 registerForTraitChanges:v11 withAction:sel_onPreferredContentSizeCategoryChange];
  }
  return v3;
}

- (ASCAdTransparencyButtonView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    double v4 = +[ASCSemanticColor loading]();
    [(ASCAdTransparencyButtonView *)self setTintColor:v4];

    [(ASCAdTransparencyButtonView *)self setTitle:0 forState:0];
  }
  else
  {
    self;
    double v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.6 green:0.8 blue:0.996078431 alpha:1.0];
    [(ASCAdTransparencyButtonView *)self setTintColor:v5];

    id v6 = +[ASCAdTransparencyButtonView adButtonTitleLocalized];
    [(ASCAdTransparencyButtonView *)self setTitle:v6 forState:0];
  }
}

- (void)updateFont
{
  id v5 = [(ASCAdTransparencyButtonView *)self titleLabel];
  v3 = [(ASCAdTransparencyButtonView *)self traitCollection];
  double v4 = +[ASCAdTransparencyButtonView buttonFontCompatibleWithTraitColletion:v3];
  [v5 setFont:v4];
}

- (void)updateInsets
{
  self;
  v3 = [(ASCAdTransparencyButtonView *)self traitCollection];
  +[__ASCLayoutProxy adTransparencyButtonScaledCapInset:v3 in:3.0];
  double v5 = v4;

  -[ASCAdTransparencyButtonView setContentEdgeInsets:](self, "setContentEdgeInsets:", 0.0, v5, 0.0, v5);
}

- (void)onPreferredContentSizeCategoryChange
{
  [(ASCAdTransparencyButtonView *)self updateFont];

  [(ASCAdTransparencyButtonView *)self updateInsets];
}

@end