@interface WFContentCoercionNodeView
- (CAShapeLayer)outlineLayer;
- (UILabel)nameLabel;
- (WFContentCoercionNode)node;
- (WFContentCoercionNodeView)initWithFrame:(CGRect)a3 isRootNode:(BOOL)a4;
- (void)layoutSubviews;
- (void)setNameLabel:(id)a3;
- (void)setNode:(id)a3;
- (void)setOutlineLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColors;
@end

@implementation WFContentCoercionNodeView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_outlineLayer);
  objc_storeStrong((id *)&self->_node, 0);
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  return (UILabel *)WeakRetained;
}

- (void)setOutlineLayer:(id)a3
{
}

- (CAShapeLayer)outlineLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outlineLayer);
  return (CAShapeLayer *)WeakRetained;
}

- (WFContentCoercionNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
  id v5 = a3;
  id v8 = [v5 itemOrItemClass];

  v6 = [(id)objc_opt_class() localizedTypeDescription];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  [WeakRetained setText:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFContentCoercionNodeView;
  id v4 = a3;
  [(WFContentCoercionNodeView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(WFContentCoercionNodeView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(WFContentCoercionNodeView *)self updateColors];
  }
}

- (void)updateColors
{
  id v5 = [MEMORY[0x263F825C8] systemBlueColor];
  uint64_t v3 = [v5 CGColor];
  id v4 = [(WFContentCoercionNodeView *)self outlineLayer];
  [v4 setStrokeColor:v3];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)WFContentCoercionNodeView;
  [(WFContentCoercionNodeView *)&v20 layoutSubviews];
  Mutable = CGPathCreateMutable();
  [(WFContentCoercionNodeView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v21);
  [(WFContentCoercionNodeView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v22);
  [(WFContentCoercionNodeView *)self bounds];
  double Width = CGRectGetWidth(v23);
  [(WFContentCoercionNodeView *)self bounds];
  double Height = CGRectGetHeight(v24);
  if (Width < Height) {
    double Height = Width;
  }
  CGPathAddArc(Mutable, 0, MidX, MidY, Height * 0.5, 0.0, 6.28318531, 1);
  objc_super v8 = [(WFContentCoercionNodeView *)self layer];
  v9 = [v8 mask];
  [v9 setPath:Mutable];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_outlineLayer);
  [WeakRetained setPath:Mutable];

  CGPathRelease(Mutable);
  [(WFContentCoercionNodeView *)self bounds];
  double v12 = v11 + 5.0;
  double v14 = v13 + 5.0;
  double v16 = v15 + -10.0;
  double v18 = v17 + -10.0;
  id v19 = objc_loadWeakRetained((id *)&self->_nameLabel);
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
}

- (WFContentCoercionNodeView)initWithFrame:(CGRect)a3 isRootNode:(BOOL)a4
{
  double height = a3.size.height;
  v20.receiver = self;
  v20.super_class = (Class)WFContentCoercionNodeView;
  uint64_t v6 = -[WFContentCoercionNodeView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WFContentCoercionNodeView *)v6 setBackgroundColor:v7];

    objc_super v8 = [MEMORY[0x263F15880] layer];
    v9 = [(WFContentCoercionNodeView *)v6 layer];
    [v9 setMask:v8];

    id v10 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v10 setNumberOfLines:2];
    [v10 setLineBreakMode:0];
    double v11 = [MEMORY[0x263F825C8] clearColor];
    [v10 setBackgroundColor:v11];

    double v12 = 12.0;
    if (height >= 100.0) {
      double v12 = 17.0;
    }
    double v13 = [MEMORY[0x263F81708] boldSystemFontOfSize:v12];
    [v10 setFont:v13];

    [v10 setTextAlignment:1];
    [v10 setAdjustsFontSizeToFitWidth:1];
    if (a4)
    {
      double v14 = [MEMORY[0x263F825C8] whiteColor];
      [v10 setTextColor:v14];

      [(WFContentCoercionNodeView *)v6 addSubview:v10];
      objc_storeWeak((id *)&v6->_nameLabel, v10);
      double v15 = [MEMORY[0x263F825C8] systemBlueColor];
      [(WFContentCoercionNodeView *)v6 setBackgroundColor:v15];
    }
    else
    {
      double v16 = [MEMORY[0x263F825C8] systemBlueColor];
      [v10 setTextColor:v16];

      [(WFContentCoercionNodeView *)v6 addSubview:v10];
      objc_storeWeak((id *)&v6->_nameLabel, v10);
      double v15 = [MEMORY[0x263F15880] layer];
      id v17 = [MEMORY[0x263F825C8] clearColor];
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v17, "CGColor"));

      [v15 setLineWidth:3.0];
      double v18 = [(WFContentCoercionNodeView *)v6 layer];
      [v18 addSublayer:v15];

      objc_storeWeak((id *)&v6->_outlineLayer, v15);
    }

    [(WFContentCoercionNodeView *)v6 updateColors];
  }
  return v6;
}

@end