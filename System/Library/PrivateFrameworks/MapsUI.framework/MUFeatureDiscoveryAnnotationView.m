@interface MUFeatureDiscoveryAnnotationView
- (BOOL)floatingIndicator;
- (BOOL)showBubbleIndicator;
- (MUFeatureDiscoveryAnnotationView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)sourceView;
- (_TipMaskView)tipMaskView;
- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3;
- (double)arrowBase;
- (double)arrowHeight;
- (double)arrowOffset;
- (double)cornerRadius;
- (void)_addArrowCurveToPath:(id)a3 direction:(unint64_t)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7;
- (void)_addLineWithSlightTrailingAndLeadingCurveToPath:(id)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 leadingEdge:(BOOL)a6 isVertical:(BOOL)a7;
- (void)_setupSubviews;
- (void)_updateShapeLayerPath;
- (void)_updateUI;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setFloatingIndicator:(BOOL)a3;
- (void)setShowBubbleIndicator:(BOOL)a3;
- (void)setSourceView:(id)a3;
- (void)setTipMaskView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MUFeatureDiscoveryAnnotationView

- (MUFeatureDiscoveryAnnotationView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUFeatureDiscoveryAnnotationView;
  v3 = -[MUFeatureDiscoveryAnnotationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUFeatureDiscoveryAnnotationView *)v3 _setupSubviews];
    [(MUFeatureDiscoveryAnnotationView *)v4 _updateUI];
  }
  return v4;
}

- (double)arrowHeight
{
  return 13.0;
}

- (double)arrowBase
{
  return 26.0;
}

- (double)arrowOffset
{
  sourceView = self->_sourceView;
  if (!sourceView) {
    return 0.0;
  }
  [(UIView *)sourceView frame];
  double v5 = v4;
  [(UIView *)self->_sourceView frame];
  double v7 = v5 + v6 * 0.5;
  [(MUFeatureDiscoveryAnnotationView *)self frame];
  double v9 = v8;
  [(MUFeatureDiscoveryAnnotationView *)self frame];
  return v7 - (v9 + v10 * 0.5);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MUFeatureDiscoveryAnnotationView;
  [(MUFeatureDiscoveryAnnotationView *)&v5 layoutSubviews];
  v3 = [(MUFeatureDiscoveryAnnotationView *)self tipMaskView];
  double v4 = [(MUFeatureDiscoveryAnnotationView *)self backgroundView];
  [v4 setMaskView:v3];

  [(MUFeatureDiscoveryAnnotationView *)self _updateShapeLayerPath];
}

- (void)_setupSubviews
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_TipMaskView);
  tipMaskView = self->_tipMaskView;
  self->_tipMaskView = v3;

  objc_super v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUFeatureDiscoveryAnnotationView *)self addSubview:self->_backgroundView];
  double v7 = [(UIView *)self->_backgroundView topAnchor];
  double v8 = [(MUFeatureDiscoveryAnnotationView *)self topAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  topLayoutConstraint = self->_topLayoutConstraint;
  self->_topLayoutConstraint = v9;

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22[0] = self->_topLayoutConstraint;
  v11 = [(UIView *)self->_backgroundView bottomAnchor];
  v12 = [(MUFeatureDiscoveryAnnotationView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v22[1] = v13;
  v14 = [(UIView *)self->_backgroundView leadingAnchor];
  v15 = [(MUFeatureDiscoveryAnnotationView *)self leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v22[2] = v16;
  v17 = [(UIView *)self->_backgroundView trailingAnchor];
  v18 = [(MUFeatureDiscoveryAnnotationView *)self trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v22[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  [v21 activateConstraints:v20];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(MUFeatureDiscoveryAnnotationView *)self setNeedsLayout];
  }
}

- (void)setShowBubbleIndicator:(BOOL)a3
{
  if (self->_showBubbleIndicator != a3)
  {
    self->_showBubbleIndicator = a3;
    [(MUFeatureDiscoveryAnnotationView *)self _updateUI];
  }
}

- (void)setFloatingIndicator:(BOOL)a3
{
  if (self->_floatingIndicator != a3)
  {
    self->_floatingIndicator = a3;
    [(MUFeatureDiscoveryAnnotationView *)self _updateUI];
  }
}

- (void)_updateUI
{
  v3 = [(MUFeatureDiscoveryAnnotationView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  objc_super v5 = [MEMORY[0x1E4FB1618] clearColor];
  [(MUFeatureDiscoveryAnnotationView *)self setBackgroundColor:v5];

  double v6 = [(MUFeatureDiscoveryAnnotationView *)self backgroundView];
  if (v4 == 2) {
    [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  }
  else {
  double v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [v6 setBackgroundColor:v7];

  double v8 = 0.0;
  if ([(MUFeatureDiscoveryAnnotationView *)self showBubbleIndicator]
    && [(MUFeatureDiscoveryAnnotationView *)self floatingIndicator])
  {
    [(MUFeatureDiscoveryAnnotationView *)self arrowHeight];
    double v8 = -v9;
    [(MUFeatureDiscoveryAnnotationView *)self setClipsToBounds:0];
  }
  topLayoutConstraint = self->_topLayoutConstraint;
  [(NSLayoutConstraint *)topLayoutConstraint setConstant:v8];
}

- (void)_updateShapeLayerPath
{
  v3 = [(MUFeatureDiscoveryAnnotationView *)self backgroundView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [MEMORY[0x1E4FB14C0] bezierPath];
  if ([(MUFeatureDiscoveryAnnotationView *)self showBubbleIndicator])
  {
    [(MUFeatureDiscoveryAnnotationView *)self arrowHeight];
    double v14 = v7 + v13;
    [(MUFeatureDiscoveryAnnotationView *)self arrowHeight];
    double v16 = v11 - v15;
    -[MUFeatureDiscoveryAnnotationView _upAndDownStartingXLocationForBounds:](self, "_upAndDownStartingXLocationForBounds:", v5, v14, v9, v16);
    double v18 = v17;
    [(MUFeatureDiscoveryAnnotationView *)self arrowBase];
    double v20 = v18 + v19;
    [(MUFeatureDiscoveryAnnotationView *)self arrowBase];
    double v22 = v18 + v21 * 0.5;
    [(MUFeatureDiscoveryAnnotationView *)self arrowHeight];
    double v24 = v14 - v23;
    [(MUFeatureDiscoveryAnnotationView *)self cornerRadius];
    v26 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v5, v14, v9, v16, v25, v25);

    -[MUFeatureDiscoveryAnnotationView _addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:](self, "_addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:", v26, 1, v18, v14, v20, v14, v22, v24);
  }
  else
  {
    [(MUFeatureDiscoveryAnnotationView *)self cornerRadius];
    v26 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v5, v7, v9, v11, v27, v27);
  }
  v28 = [(MUFeatureDiscoveryAnnotationView *)self tipMaskView];
  v29 = [v28 layer];

  id v30 = v26;
  objc_msgSend(v29, "setPath:", objc_msgSend(v30, "CGPath"));
}

- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  [(MUFeatureDiscoveryAnnotationView *)self arrowBase];
  double v7 = v6;
  double v8 = x + width - v6;
  [(MUFeatureDiscoveryAnnotationView *)self arrowOffset];
  return fmin(fmax(x, x + width * 0.5 + v9 - v7 * 0.5), v8);
}

- (void)_addLineWithSlightTrailingAndLeadingCurveToPath:(id)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 leadingEdge:(BOOL)a6 isVertical:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a5.y;
  double x = a5.x;
  double v11 = a4.y;
  double v12 = a4.x;
  double v13 = (a5.x - a4.x) * 0.5;
  double v14 = (a5.y - a4.y) * 0.5;
  id v22 = a3;
  if (v8)
  {
    double v15 = 0.0;
    if (v7) {
      double v16 = 0.0;
    }
    else {
      double v16 = v13;
    }
    double v17 = v12 - v16;
    if (v7) {
      double v15 = v14;
    }
    objc_msgSend(v22, "moveToPoint:", v17, v11 - v15);
    objc_msgSend(v22, "addCurveToPoint:controlPoint1:controlPoint2:", v12 + v13, v11 + v14, v12, v11, v12, v11);
    objc_msgSend(v22, "addLineToPoint:", x, y);
  }
  else
  {
    double v18 = -0.0;
    if (v7) {
      double v19 = -0.0;
    }
    else {
      double v19 = v13;
    }
    double v20 = x + v19;
    if (v7) {
      double v18 = v14;
    }
    double v21 = y + v18;
    objc_msgSend(v22, "addLineToPoint:", x - v13, y - v14);
    objc_msgSend(v22, "addCurveToPoint:controlPoint1:controlPoint2:", v20, v21, x, y, x, y);
  }
}

- (void)_addArrowCurveToPath:(id)a3 direction:(unint64_t)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  double v11 = a5.y;
  double v12 = a5.x;
  CGFloat v14 = a7.x + 2.0;
  CGFloat v15 = a7.y + 1.0;
  id v16 = a3;
  -[MUFeatureDiscoveryAnnotationView _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v16, 1, 0, v10, v9, v14, v15);
  objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", x + -2.0, v15, x, y, x, y);
  -[MUFeatureDiscoveryAnnotationView _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v16, 0, 0, x + -2.0, v15, v12, v11);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUFeatureDiscoveryAnnotationView;
  [(MUFeatureDiscoveryAnnotationView *)&v11 traitCollectionDidChange:v4];
  double v5 = [(MUFeatureDiscoveryAnnotationView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  if (v6 == [v4 userInterfaceStyle])
  {
    BOOL v7 = [(MUFeatureDiscoveryAnnotationView *)self traitCollection];
    BOOL v8 = [v7 preferredContentSizeCategory];
    double v9 = [v4 preferredContentSizeCategory];
    NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

    if (v10 == NSOrderedSame) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(MUFeatureDiscoveryAnnotationView *)self _updateUI];
LABEL_6:
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)showBubbleIndicator
{
  return self->_showBubbleIndicator;
}

- (BOOL)floatingIndicator
{
  return self->_floatingIndicator;
}

- (_TipMaskView)tipMaskView
{
  return self->_tipMaskView;
}

- (void)setTipMaskView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_topLayoutConstraint, 0);
}

@end