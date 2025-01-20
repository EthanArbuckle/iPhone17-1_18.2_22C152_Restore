@interface AKMarkupButtonContainerView
- (AKMarkupButtonContainerView)initWithFrame:(CGRect)a3;
- (BOOL)selected;
- (CGSize)_buttonSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)button;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateForMiniBarState:(BOOL)a3;
@end

@implementation AKMarkupButtonContainerView

- (AKMarkupButtonContainerView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AKMarkupButtonContainerView;
  v3 = -[AKMarkupButtonContainerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C488] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button setClipsToBounds:1];
    v6 = v3->_button;
    v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"pencil.tip.crop.circle"];
    [(UIButton *)v6 setImage:v7 forState:0];

    [(AKMarkupButtonContainerView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)AKMarkupButtonContainerView;
  [(AKMarkupButtonContainerView *)&v15 layoutSubviews];
  [(AKMarkupButtonContainerView *)self intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(AKMarkupButtonContainerView *)self button];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  [(AKMarkupButtonContainerView *)self bounds];
  CGFloat v8 = CGRectGetWidth(v16) * 0.5;
  [(AKMarkupButtonContainerView *)self bounds];
  CGFloat v9 = CGRectGetHeight(v17) * 0.5;
  v10 = [(AKMarkupButtonContainerView *)self button];
  objc_msgSend(v10, "setCenter:", v8, v9);

  v11 = [(AKMarkupButtonContainerView *)self button];
  [v11 bounds];
  CGFloat v12 = CGRectGetWidth(v18) * 0.5;
  v13 = [(AKMarkupButtonContainerView *)self button];
  v14 = [v13 layer];
  [v14 setCornerRadius:v12];
}

- (void)updateForMiniBarState:(BOOL)a3
{
  [(AKMarkupButtonContainerView *)self setNeedsLayout];

  [(AKMarkupButtonContainerView *)self layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  MEMORY[0x270F9A6D0](self, sel__buttonSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  MEMORY[0x270F9A6D0](self, sel__buttonSize);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selected = a3;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v5 = [(AKMarkupButtonContainerView *)self button];
  [v5 setSelected:v3];

  double v6 = (void *)MEMORY[0x263F158F8];

  [v6 commit];
}

- (CGSize)_buttonSize
{
  double v2 = [(AKMarkupButtonContainerView *)self traitCollection];
  uint64_t v3 = [v2 verticalSizeClass];

  double v4 = 28.0;
  if (v3 == 1) {
    double v4 = 27.0;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end