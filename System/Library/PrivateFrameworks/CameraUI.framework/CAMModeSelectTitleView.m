@interface CAMModeSelectTitleView
- (CAMModeSelectTitleView)initWithFrame:(CGRect)a3;
- (NSString)text;
- (UIColor)textColor;
- (UILabel)_titleLabel;
- (void)layoutSubviews;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation CAMModeSelectTitleView

- (CAMModeSelectTitleView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMModeSelectTitleView;
  v3 = -[CAMModeSelectTitleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] whiteColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v4;

    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleLabel = v3->__titleLabel;
    v3->__titleLabel = (UILabel *)v7;

    [(UILabel *)v3->__titleLabel setTextAlignment:0];
    v9 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v3->__titleLabel setTextColor:v9];

    v10 = [MEMORY[0x263F81708] systemFontOfSize:72.0 weight:*MEMORY[0x263F81800]];
    [(UILabel *)v3->__titleLabel setFont:v10];

    [(CAMModeSelectTitleView *)v3 addSubview:v3->__titleLabel];
    v11 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UILabel *)self->__titleLabel text];
}

- (void)setTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    titleLabel = self->__titleLabel;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__CAMModeSelectTitleView_setTextColor___block_invoke;
    v7[3] = &unk_263FA0208;
    v7[4] = self;
    [MEMORY[0x263F82E00] transitionWithView:titleLabel duration:5242880 options:v7 animations:0 completion:0.3];
  }
}

void __39__CAMModeSelectTitleView_setTextColor___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[51];
  id v3 = [v1 _titleLabel];
  [v3 setTextColor:v2];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CAMModeSelectTitleView;
  [(CAMModeSelectTitleView *)&v12 layoutSubviews];
  [(CAMModeSelectTitleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMModeSelectTitleView *)self _titleLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end