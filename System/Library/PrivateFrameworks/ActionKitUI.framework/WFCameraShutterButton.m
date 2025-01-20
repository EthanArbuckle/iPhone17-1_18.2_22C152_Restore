@interface WFCameraShutterButton
- (BOOL)isAccessibilityElement;
- (CAShapeLayer)buttonLayer;
- (CAShapeLayer)outlineLayer;
- (CGSize)intrinsicContentSize;
- (WFCameraShutterButton)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setButtonLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOutlineLayer:(id)a3;
@end

@implementation WFCameraShutterButton

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonLayer);
  objc_destroyWeak((id *)&self->_outlineLayer);
}

- (void)setButtonLayer:(id)a3
{
}

- (CAShapeLayer)buttonLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonLayer);
  return (CAShapeLayer *)WeakRetained;
}

- (void)setOutlineLayer:(id)a3
{
}

- (CAShapeLayer)outlineLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outlineLayer);
  return (CAShapeLayer *)WeakRetained;
}

- (id)accessibilityLabel
{
  return WFLocalizedString(@"Take picture");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFCameraShutterButton;
  -[WFCameraShutterButton setHighlighted:](&v8, sel_setHighlighted_);
  if (v3) {
    [MEMORY[0x263F825C8] colorWithWhite:0.600000024 alpha:1.0];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  uint64_t v6 = [v5 CGColor];
  v7 = [(WFCameraShutterButton *)self buttonLayer];
  [v7 setFillColor:v6];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 66.0;
  double v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)WFCameraShutterButton;
  [(WFCameraShutterButton *)&v20 layoutSubviews];
  [(WFCameraShutterButton *)self bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double v7 = CGRectGetHeight(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v22);
  if (v7 < v8) {
    double v8 = v7;
  }
  double v9 = v8 * 0.5;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v24);
  v12 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9, 0.0, 6.28318531);
  v13 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9 + -6.0, 0.0, 6.28318531);
  [v12 appendPath:v13];

  id v14 = v12;
  uint64_t v15 = [v14 CGPath];
  v16 = [(WFCameraShutterButton *)self outlineLayer];
  [v16 setPath:v15];

  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9 + -6.0 + -2.0, 0.0, 6.28318531);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 CGPath];
  v19 = [(WFCameraShutterButton *)self buttonLayer];
  [v19 setPath:v18];
}

- (WFCameraShutterButton)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WFCameraShutterButton;
  double v3 = -[WFCameraShutterButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F15880] layer];
    [v4 setFillRule:*MEMORY[0x263F15AC0]];
    id v5 = [MEMORY[0x263F825C8] whiteColor];
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v5, "CGColor"));

    id v6 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

    double v7 = [(WFCameraShutterButton *)v3 layer];
    [v7 addSublayer:v4];

    [(WFCameraShutterButton *)v3 setOutlineLayer:v4];
    double v8 = [MEMORY[0x263F15880] layer];
    id v9 = [MEMORY[0x263F825C8] whiteColor];
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

    id v10 = [MEMORY[0x263F825C8] clearColor];
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

    v11 = [(WFCameraShutterButton *)v3 layer];
    [v11 addSublayer:v8];

    [(WFCameraShutterButton *)v3 setButtonLayer:v8];
    LODWORD(v12) = 1144750080;
    [(WFCameraShutterButton *)v3 setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1144750080;
    [(WFCameraShutterButton *)v3 setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1144750080;
    [(WFCameraShutterButton *)v3 setContentHuggingPriority:0 forAxis:v14];
    LODWORD(v15) = 1144750080;
    [(WFCameraShutterButton *)v3 setContentHuggingPriority:1 forAxis:v15];
  }
  return v3;
}

@end