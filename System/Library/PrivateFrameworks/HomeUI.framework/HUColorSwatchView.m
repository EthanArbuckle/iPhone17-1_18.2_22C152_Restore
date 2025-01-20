@interface HUColorSwatchView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)labelHidden;
- (CAShapeLayer)circleLayer;
- (CAShapeLayer)selectedCircleInnerLayer;
- (CAShapeLayer)selectedCircleLayer;
- (CAShapeLayer)selectedCircleOuterLayer;
- (HUColorSwatchView)initWithFrame:(CGRect)a3;
- (HUColorSwatchView)initWithFrame:(CGRect)a3 text:(id)a4;
- (NSString)text;
- (UIColor)color;
- (UILabel)label;
- (unint64_t)selectionState;
- (void)_updateLayout;
- (void)_updateTextColor;
- (void)layoutSubviews;
- (void)setCircleLayer:(id)a3;
- (void)setColor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)setSelectedCircleInnerLayer:(id)a3;
- (void)setSelectedCircleLayer:(id)a3;
- (void)setSelectedCircleOuterLayer:(id)a3;
- (void)setSelectionState:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUColorSwatchView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (HUColorSwatchView)initWithFrame:(CGRect)a3
{
  return -[HUColorSwatchView initWithFrame:text:](self, "initWithFrame:text:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUColorSwatchView)initWithFrame:(CGRect)a3 text:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HUColorSwatchView;
  v11 = -[HUColorSwatchView initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    circleLayer = v11->_circleLayer;
    v11->_circleLayer = v12;

    [(CAShapeLayer *)v11->_circleLayer setFillRule:*MEMORY[0x1E4F39FB8]];
    [(CAShapeLayer *)v11->_circleLayer setLineWidth:0.5];
    v14 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v15 = [v14 colorWithAlphaComponent:0.1];
    -[CAShapeLayer setStrokeColor:](v11->_circleLayer, "setStrokeColor:", [v15 CGColor]);

    v16 = [(HUColorSwatchView *)v11 layer];
    [v16 addSublayer:v11->_circleLayer];

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    selectedCircleLayer = v11->_selectedCircleLayer;
    v11->_selectedCircleLayer = v17;

    v19 = [(HUColorSwatchView *)v11 layer];
    [v19 addSublayer:v11->_selectedCircleLayer];

    v20 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    selectedCircleInnerLayer = v11->_selectedCircleInnerLayer;
    v11->_selectedCircleInnerLayer = v20;

    [(CAShapeLayer *)v11->_selectedCircleInnerLayer setLineWidth:0.3];
    v22 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v23 = [v22 colorWithAlphaComponent:0.1];
    -[CAShapeLayer setStrokeColor:](v11->_selectedCircleInnerLayer, "setStrokeColor:", [v23 CGColor]);

    id v24 = [MEMORY[0x1E4F428B8] clearColor];
    -[CAShapeLayer setFillColor:](v11->_selectedCircleInnerLayer, "setFillColor:", [v24 CGColor]);

    v25 = [(HUColorSwatchView *)v11 layer];
    [v25 addSublayer:v11->_selectedCircleInnerLayer];

    v26 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    selectedCircleOuterLayer = v11->_selectedCircleOuterLayer;
    v11->_selectedCircleOuterLayer = v26;

    [(CAShapeLayer *)v11->_selectedCircleOuterLayer setLineWidth:0.3];
    v28 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v29 = [v28 colorWithAlphaComponent:0.1];
    -[CAShapeLayer setStrokeColor:](v11->_selectedCircleOuterLayer, "setStrokeColor:", [v29 CGColor]);

    id v30 = [MEMORY[0x1E4F428B8] clearColor];
    -[CAShapeLayer setFillColor:](v11->_selectedCircleOuterLayer, "setFillColor:", [v30 CGColor]);

    v31 = [(HUColorSwatchView *)v11 layer];
    [v31 addSublayer:v11->_selectedCircleOuterLayer];

    objc_storeStrong((id *)&v11->_text, a4);
    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    label = v11->_label;
    v11->_label = v32;

    [(UILabel *)v11->_label setText:v10];
    [(UILabel *)v11->_label setTextAlignment:1];
    v34 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v11->_label setTextColor:v34];

    v35 = [MEMORY[0x1E4F42A30] systemFontOfSize:11.0 weight:*MEMORY[0x1E4F43930]];
    [(UILabel *)v11->_label setFont:v35];

    [(UILabel *)v11->_label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v11->_label setMinimumScaleFactor:0.1];
    [(HUColorSwatchView *)v11 addSubview:v11->_label];
    [(HUColorSwatchView *)v11 setClipsToBounds:0];
  }

  return v11;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  id v5 = a3;
  id v6 = [(HUColorSwatchView *)self label];
  [v6 setText:v5];
}

- (UIColor)color
{
  v2 = (void *)MEMORY[0x1E4F428B8];
  v3 = [(HUColorSwatchView *)self circleLayer];
  v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "fillColor"));

  return (UIColor *)v4;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 CGColor];
  id v6 = [(HUColorSwatchView *)self circleLayer];
  [v6 setFillColor:v5];

  id v7 = v4;
  uint64_t v8 = [v7 CGColor];

  v9 = [(HUColorSwatchView *)self selectedCircleLayer];
  [v9 setStrokeColor:v8];

  [(HUColorSwatchView *)self _updateTextColor];
}

- (void)setSelectionState:(unint64_t)a3
{
  if (self->_selectionState != a3)
  {
    self->_selectionState = a3;
    [(HUColorSwatchView *)self _updateLayout];
    [(HUColorSwatchView *)self _updateTextColor];
  }
}

- (void)_updateLayout
{
  [(HUColorSwatchView *)self bounds];
  double v4 = v3;
  [(HUColorSwatchView *)self bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(HUColorSwatchView *)self bounds];
  double v8 = v7;
  [(HUColorSwatchView *)self bounds];
  double v10 = v9;
  if (([(HUColorSwatchView *)self selectionState] & 2) != 0
    || ([(HUColorSwatchView *)self selectionState] & 1) != 0)
  {
    v21 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v22 = [v21 colorWithAlphaComponent:0.05];
    uint64_t v23 = [v22 CGColor];
    id v24 = [(HUColorSwatchView *)self circleLayer];
    [v24 setStrokeColor:v23];

    v25 = [(HUColorSwatchView *)self selectedCircleLayer];
    [v25 setHidden:0];

    v26 = [(HUColorSwatchView *)self selectedCircleInnerLayer];
    [v26 setHidden:0];

    v27 = [(HUColorSwatchView *)self selectedCircleOuterLayer];
    [v27 setHidden:0];

    double v18 = v6 * 0.5;
    double v19 = v18 + -3.0;
    double v20 = v18 + -3.0 + -3.0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v12 = [v11 colorWithAlphaComponent:0.1];
    uint64_t v13 = [v12 CGColor];
    v14 = [(HUColorSwatchView *)self circleLayer];
    [v14 setStrokeColor:v13];

    id v15 = [(HUColorSwatchView *)self selectedCircleLayer];
    [v15 setHidden:1];

    v16 = [(HUColorSwatchView *)self selectedCircleInnerLayer];
    [v16 setHidden:1];

    v17 = [(HUColorSwatchView *)self selectedCircleOuterLayer];
    [v17 setHidden:1];

    double v18 = v6 * 0.5;
    double v19 = v18 + -3.0;
    double v20 = v18;
  }
  double v28 = v10 * 0.5;
  double v29 = v8 * 0.5;
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v20, 0.0, 6.28318531);
  id v50 = objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v50 CGPath];
  v31 = [(HUColorSwatchView *)self circleLayer];
  [v31 setPath:v30];

  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v18 + -1.5, 0.0, 6.28318531);
  id v32 = objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [v32 CGPath];
  v34 = [(HUColorSwatchView *)self selectedCircleLayer];
  [v34 setPath:v33];

  id v35 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v36 = [v35 CGColor];
  objc_super v37 = [(HUColorSwatchView *)self selectedCircleLayer];
  [v37 setFillColor:v36];

  v38 = [(HUColorSwatchView *)self selectedCircleLayer];
  [v38 setLineWidth:3.0];

  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v19, 0.0, 6.28318531);
  id v39 = objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [v39 CGPath];
  v41 = [(HUColorSwatchView *)self selectedCircleInnerLayer];
  [v41 setPath:v40];

  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v18, 0.0, 6.28318531);
  id v42 = objc_claimAutoreleasedReturnValue();
  uint64_t v43 = [v42 CGPath];
  v44 = [(HUColorSwatchView *)self selectedCircleOuterLayer];
  [v44 setPath:v43];

  [(HUColorSwatchView *)self frame];
  double v46 = v45 + -18.0;
  [(HUColorSwatchView *)self frame];
  double v48 = v47 + -18.0;
  v49 = [(HUColorSwatchView *)self label];
  objc_msgSend(v49, "setFrame:", 9.0, 9.0, v46, v48);
}

- (void)_updateTextColor
{
  id v8 = [(HUColorSwatchView *)self color];
  if (HUIsLightColor(v8))
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    double v4 = [(HUColorSwatchView *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 1) {
      [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    else {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
    }
  }
  double v6 = (void *)v3;
  double v7 = [(HUColorSwatchView *)self label];
  [v7 setTextColor:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUColorSwatchView;
  [(HUColorSwatchView *)&v4 traitCollectionDidChange:a3];
  [(HUColorSwatchView *)self _updateTextColor];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUColorSwatchView;
  [(HUColorSwatchView *)&v3 layoutSubviews];
  [(HUColorSwatchView *)self _updateLayout];
  [(HUColorSwatchView *)self _updateTextColor];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 hasPrefix:@"path"] & 1) != 0
    || ([v4 hasPrefix:@"fillColor"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUColorSwatchView;
    BOOL v5 = [(HUColorSwatchView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setLabelHidden:(BOOL)a3
{
  self->_labelHidden = a3;
  BOOL v5 = [(HUColorSwatchView *)self label];
  [v5 setHidden:self->_labelHidden];

  if (!a3)
  {
    [(HUColorSwatchView *)self _updateTextColor];
  }
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (BOOL)labelHidden
{
  return self->_labelHidden;
}

- (NSString)text
{
  return self->_text;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (CAShapeLayer)selectedCircleLayer
{
  return self->_selectedCircleLayer;
}

- (void)setSelectedCircleLayer:(id)a3
{
}

- (CAShapeLayer)selectedCircleInnerLayer
{
  return self->_selectedCircleInnerLayer;
}

- (void)setSelectedCircleInnerLayer:(id)a3
{
}

- (CAShapeLayer)selectedCircleOuterLayer
{
  return self->_selectedCircleOuterLayer;
}

- (void)setSelectedCircleOuterLayer:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_selectedCircleOuterLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleInnerLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end