@interface CNAvatarCardHighlightView
- (BOOL)highlighted;
- (CALayer)highlightLayer;
- (CNAvatarCardHighlightView)initWithFrame:(CGRect)a3;
- (UIColor)highlightColor;
- (void)_commonInit;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CNAvatarCardHighlightView

- (void).cxx_destruct
{
}

- (void)setHighlightLayer:(id)a3
{
}

- (CALayer)highlightLayer
{
  return self->_highlightLayer;
}

- (BOOL)highlighted
{
  v2 = [(CNAvatarCardHighlightView *)self highlightLayer];
  [v2 opacity];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    float v4 = 1.0;
  }
  else {
    float v4 = 0.0;
  }
  id v6 = [(CNAvatarCardHighlightView *)self highlightLayer];
  *(float *)&double v5 = v4;
  [v6 setOpacity:v5];
}

- (void)setHighlightColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [(CNAvatarCardHighlightView *)self highlightLayer];
  [v5 setBackgroundColor:v4];
}

- (UIColor)highlightColor
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  float v3 = [(CNAvatarCardHighlightView *)self highlightLayer];
  uint64_t v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "backgroundColor"));

  return (UIColor *)v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarCardHighlightView;
  [(CNAvatarCardHighlightView *)&v13 layoutSubviews];
  float v3 = [(CNAvatarCardHighlightView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(CNAvatarCardHighlightView *)self highlightLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)CNAvatarCardHighlightView;
  [(CNAvatarCardHighlightView *)&v3 awakeFromNib];
  [(CNAvatarCardHighlightView *)self _commonInit];
}

- (CNAvatarCardHighlightView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardHighlightView;
  objc_super v3 = -[CNAvatarCardHighlightView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CNAvatarCardHighlightView *)v3 _commonInit];
  return v3;
}

- (void)_commonInit
{
  objc_super v3 = [MEMORY[0x1E4F39BE8] layer];
  [(CNAvatarCardHighlightView *)self setHighlightLayer:v3];

  double v4 = [(CNAvatarCardHighlightView *)self layer];
  objc_super v5 = [(CNAvatarCardHighlightView *)self highlightLayer];
  [v4 insertSublayer:v5 atIndex:0];

  id v6 = +[CNUIColorRepository navigationListCellBackgroundHighlightedColorRegular];
  [(CNAvatarCardHighlightView *)self setHighlightColor:v6];
}

@end