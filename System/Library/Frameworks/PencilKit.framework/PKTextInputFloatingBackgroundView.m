@interface PKTextInputFloatingBackgroundView
- (PKTextInputFloatingBackgroundView)initWithFrame:(CGRect)a3;
- (UIView)_textureView;
- (UIVisualEffectView)_blurView;
- (void)layoutSubviews;
@end

@implementation PKTextInputFloatingBackgroundView

- (PKTextInputFloatingBackgroundView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)PKTextInputFloatingBackgroundView;
  v3 = -[PKTextInputFloatingBackgroundView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = (void *)MEMORY[0x1E4FB1E20];
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v8 = v7;

    v9 = objc_msgSend(v5, "traitCollectionWithDisplayScale:", fmin(v8, 2.0));
    v10 = [v4 _kitImageNamed:@"UITexturedPaperTile" withTrait:v9];

    v11 = [MEMORY[0x1E4FB1618] colorWithPatternImage:v10];
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    textureView = v3->__textureView;
    v3->__textureView = v12;

    v14 = [(UIView *)v3->__textureView layer];
    [v14 setCornerRadius:12.0];

    [(UIView *)v3->__textureView setBackgroundColor:v11];
    [(UIView *)v3->__textureView setAlpha:0.85];
    v15 = [MEMORY[0x1E4FB14C8] _effectWithBlurRadius:4.0 scale:2.0];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v15];
    blurView = v3->__blurView;
    v3->__blurView = (UIVisualEffectView *)v16;

    [(UIVisualEffectView *)v3->__blurView _setCornerRadius:12.0];
    [(UIVisualEffectView *)v3->__blurView setClipsToBounds:1];
    v18 = [(UIVisualEffectView *)v3->__blurView contentView];
    [v18 addSubview:v3->__textureView];

    v19 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKTextInputFloatingBackgroundView *)v3 setBackgroundColor:v19];

    [(PKTextInputFloatingBackgroundView *)v3 _setCornerRadius:12.0];
    [(PKTextInputFloatingBackgroundView *)v3 setUserInteractionEnabled:0];
    id v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    uint64_t v21 = [v20 CGColor];
    v22 = [(PKTextInputFloatingBackgroundView *)v3 layer];
    [v22 setBorderColor:v21];

    v23 = [(PKTextInputFloatingBackgroundView *)v3 layer];
    [v23 setBorderWidth:0.5];

    v24 = [(PKTextInputFloatingBackgroundView *)v3 layer];
    objc_msgSend(v24, "setShadowOffset:", 0.0, 3.0);

    id v25 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v26 = [v25 CGColor];
    v27 = [(PKTextInputFloatingBackgroundView *)v3 layer];
    [v27 setShadowColor:v26];

    v28 = [(PKTextInputFloatingBackgroundView *)v3 layer];
    LODWORD(v29) = 1036831949;
    [v28 setShadowOpacity:v29];

    v30 = [(PKTextInputFloatingBackgroundView *)v3 layer];
    [v30 setShadowRadius:7.0];

    [(PKTextInputFloatingBackgroundView *)v3 addSubview:v3->__blurView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKTextInputFloatingBackgroundView;
  [(PKTextInputFloatingBackgroundView *)&v23 layoutSubviews];
  [(PKTextInputFloatingBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PKTextInputFloatingBackgroundView *)self _blurView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(PKTextInputFloatingBackgroundView *)self _blurView];
  v13 = [v12 contentView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(PKTextInputFloatingBackgroundView *)self _textureView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);
}

- (UIVisualEffectView)_blurView
{
  return self->__blurView;
}

- (UIView)_textureView
{
  return self->__textureView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textureView, 0);

  objc_storeStrong((id *)&self->__blurView, 0);
}

@end