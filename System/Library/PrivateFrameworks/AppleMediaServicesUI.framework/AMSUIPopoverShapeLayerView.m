@interface AMSUIPopoverShapeLayerView
+ (double)arrowBase;
+ (double)cornerRadius;
- (AMSUIPopoverShapeLayerMaskView)shapeLayerMaskView;
- (AMSUIPopoverShapeLayerView)initWithFrame:(CGRect)a3;
- (BOOL)arrowDirectionWasFlipped;
- (BOOL)arrowOffsetWasFlipped;
- (BOOL)arrowVisible;
- (BOOL)popoverBackgroundColorIsOpaque;
- (BOOL)shapeLayerPathNeedsUpdate;
- (BOOL)wouldPinForOffset:(double)a3;
- (CGSize)_shadowOffset;
- (UIEdgeInsets)_shadowInsets;
- (UIView)viewToMaskWhenContentExtendsOverArrow;
- (double)_leftAndRightStartYLocationForBounds:(CGRect)a3;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3;
- (double)arrowHeight;
- (double)arrowOffset;
- (double)maxNonPinnedOffset;
- (double)minNonPinnedOffset;
- (id)_shadowPath;
- (unint64_t)arrowDirection;
- (void)_addLeadingPinnedCurveToPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5;
- (void)_addLeadingPinnedCurveToPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6;
- (void)_addLeftRightArrowCurveForPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 isPinned:(BOOL)a8;
- (void)_addLeftRightRoundedRectWithGapForPath:(id)a3 bounds:(CGRect)a4;
- (void)_addRoundedRectExcludingTopLeftCornerForPath:(id)a3 bounds:(CGRect)a4;
- (void)_addTopBottomArrowCurveForPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 isPinned:(BOOL)a8;
- (void)_addTopBottomRoundedRectWithGapForPath:(id)a3 bounds:(CGRect)a4;
- (void)_loadNecessaryViews;
- (void)_updatePathAnimationState;
- (void)_updateShapeLayerPath;
- (void)_updateShapeLayerPathIfNeeded;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setArrowDirectionWasFlipped:(BOOL)a3;
- (void)setArrowOffset:(double)a3;
- (void)setArrowOffsetWasFlipped:(BOOL)a3;
- (void)setArrowVisible:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setPopoverBackgroundColorIsOpaque:(BOOL)a3;
- (void)setShapeLayerMaskView:(id)a3;
- (void)setShapeLayerPathNeedsUpdate:(BOOL)a3;
- (void)setViewToMaskWhenContentExtendsOverArrow:(id)a3;
@end

@implementation AMSUIPopoverShapeLayerView

- (double)arrowHeight
{
  return 13.0;
}

+ (double)arrowBase
{
  return 26.0;
}

+ (double)cornerRadius
{
  return 13.0;
}

- (AMSUIPopoverShapeLayerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AMSUIPopoverShapeLayerView;
  v3 = -[AMSUIPopoverShapeLayerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_arrowDirection = -1;
    v3->_shapeLayerPathNeedsUpdate = 1;
    v5 = objc_alloc_init(AMSUIPopoverShapeLayerMaskView);
    shapeLayerMaskView = v4->_shapeLayerMaskView;
    v4->_shapeLayerMaskView = v5;
  }
  return v4;
}

- (double)minNonPinnedOffset
{
  unint64_t v3 = [(AMSUIPopoverShapeLayerView *)self arrowDirection];
  if (v3 - 1 < 2)
  {
    [(AMSUIPopoverShapeLayerView *)self bounds];
    double v6 = v7 * 0.5;
    return -(floor(v6) + -13.0 + -15.0);
  }
  if (v3 == 4 || (double result = 0.0, v3 == 8))
  {
    [(AMSUIPopoverShapeLayerView *)self bounds];
    double v6 = v5 * 0.5;
    return -(floor(v6) + -13.0 + -15.0);
  }
  return result;
}

- (double)maxNonPinnedOffset
{
  unint64_t v3 = [(AMSUIPopoverShapeLayerView *)self arrowDirection];
  if (v3 - 1 < 2)
  {
    [(AMSUIPopoverShapeLayerView *)self bounds];
    double v6 = v7 * 0.5;
    return floor(v6) + -13.0 + -15.0;
  }
  if (v3 == 4 || (double result = 0.0, v3 == 8))
  {
    [(AMSUIPopoverShapeLayerView *)self bounds];
    double v6 = v5 * 0.5;
    return floor(v6) + -13.0 + -15.0;
  }
  return result;
}

- (UIEdgeInsets)_shadowInsets
{
  double v2 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPath
{
  return 0;
}

- (void)_updateShapeLayerPathIfNeeded
{
  if (self->_shapeLayerPathNeedsUpdate)
  {
    [(AMSUIPopoverShapeLayerView *)self _updateShapeLayerPath];
    self->_shapeLayerPathNeedsUpdate = 0;
  }
}

- (BOOL)wouldPinForOffset:(double)a3
{
  if (a3 >= 0.0)
  {
    [(AMSUIPopoverShapeLayerView *)self maxNonPinnedOffset];
    return v6 < a3;
  }
  else
  {
    [(AMSUIPopoverShapeLayerView *)self minNonPinnedOffset];
    return v4 > a3;
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIPopoverShapeLayerView;
  [(AMSUIPopoverShapeLayerView *)&v6 layoutSubviews];
  double v3 = [(AMSUIPopoverShapeLayerView *)self layer];
  id v4 = [MEMORY[0x263F825C8] systemGrayColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  double v5 = [(AMSUIPopoverShapeLayerView *)self layer];
  [v5 setBorderWidth:10.0];

  [(AMSUIPopoverShapeLayerView *)self _updateShapeLayerPathIfNeeded];
}

- (void)_updatePathAnimationState
{
  BOOL v2 = self->_arrowOffsetWasFlipped || self->_arrowDirectionWasFlipped;
  [(AMSUIPopoverShapeLayerMaskView *)self->_shapeLayerMaskView setDisablePathAnimation:v2];
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirectionWasFlipped = [(AMSUIPopoverShapeLayerView *)self arrowDirection] != a3;
  self->_arrowDirection = a3;
  [(AMSUIPopoverShapeLayerView *)self _updatePathAnimationState];
  [(AMSUIPopoverShapeLayerView *)self setNeedsLayout];
}

- (void)setNeedsLayout
{
  self->_shapeLayerPathNeedsUpdate = 1;
  v2.receiver = self;
  v2.super_class = (Class)AMSUIPopoverShapeLayerView;
  [(AMSUIPopoverShapeLayerView *)&v2 setNeedsLayout];
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (void)setArrowOffset:(double)a3
{
  [(AMSUIPopoverShapeLayerView *)self arrowOffset];
  self->_arrowOffsetWasFlipped = v5 * a3 <= 0.0;
  self->_arrowOffset = a3;
  [(AMSUIPopoverShapeLayerView *)self _updatePathAnimationState];
  self->_shapeLayerPathNeedsUpdate = 1;
  [(AMSUIPopoverShapeLayerView *)self setNeedsLayout];
}

- (void)_addRoundedRectExcludingTopLeftCornerForPath:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double v5 = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  [(id)objc_opt_class() cornerRadius];
  double v8 = v7;
  double v9 = v5 + v7;
  objc_msgSend(v15, "moveToPoint:", x, v5 + v7 + 6.0);
  double v10 = v5 + height;
  objc_msgSend(v15, "addLineToPoint:", x, v10 - v8);
  double v11 = x + v8;
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v8, v10 - v8, v8, 3.14159265, 1.57079633);
  double v12 = x + width;
  objc_msgSend(v15, "addLineToPoint:", v12 - v8, v10);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v12 - v8, v10 - v8, v8, 1.57079633, 0.0);
  objc_msgSend(v15, "addLineToPoint:", v12, v9);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v12 - v8, v9, v8, 0.0, 4.71238898);
  objc_msgSend(v15, "addLineToPoint:", v11 + 26.0 + 6.0, y);
}

- (void)_addLeftRightRoundedRectWithGapForPath:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a3;
  [(id)objc_opt_class() cornerRadius];
  double v9 = v8;
  double v18 = y;
  [(AMSUIPopoverShapeLayerView *)self arrowOffset];
  double v11 = y + height * 0.5 + v10;
  [(id)objc_opt_class() arrowBase];
  double v13 = v11 - v12 * 0.5;
  double v20 = v13;
  [(id)objc_opt_class() arrowBase];
  objc_msgSend(v21, "moveToPoint:", x, v13 + v14);
  double v15 = y + height;
  double v16 = y + height - v9;
  objc_msgSend(v21, "addLineToPoint:", x, v16);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v9, v16, v9);
  double v17 = x + width - v9;
  objc_msgSend(v21, "addLineToPoint:", v17, v15);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, v16, v9, 1.57079633, 0.0);
  objc_msgSend(v21, "addLineToPoint:", x + width, v18 + v9);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, v18 + v9, v9, 0.0, 4.71238898);
  objc_msgSend(v21, "addLineToPoint:", x + v9 + 26.0 + 6.0, v18);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v9, v18 + v9, v9, 4.71238898, 3.14159265);
  objc_msgSend(v21, "addLineToPoint:", x, v20);
}

- (void)_addTopBottomRoundedRectWithGapForPath:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v19 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a3;
  [(id)objc_opt_class() cornerRadius];
  double v10 = v9;
  [(AMSUIPopoverShapeLayerView *)self arrowOffset];
  double v12 = x + width * 0.5 + v11;
  [(id)objc_opt_class() arrowBase];
  double v14 = v12 - v13 * 0.5;
  [(id)objc_opt_class() arrowBase];
  double v20 = v14 + v15;
  objc_msgSend(v21, "moveToPoint:", v14, y);
  objc_msgSend(v21, "addLineToPoint:", x + v10, y);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v10, y + v10, v10);
  double v16 = y + height;
  double v17 = y + height - v10;
  objc_msgSend(v21, "addLineToPoint:", x, v17);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, x + v10, v17, v10, 3.14159265, 1.57079633);
  double v18 = x + v19;
  objc_msgSend(v21, "addLineToPoint:", v18 - v10, v16);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18 - v10, v17, v10, 1.57079633, 0.0);
  objc_msgSend(v21, "addLineToPoint:", v18, y + v10);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18 - v10, y + v10, v10, 0.0, 4.71238898);
  objc_msgSend(v21, "addLineToPoint:", v20, y);
}

- (void)_addLeadingPinnedCurveToPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.origin.y;
  double v8 = a4.origin.x;
  id v13 = a3;
  [(id)objc_opt_class() cornerRadius];
  double v10 = v7 + v9 + 6.0;
  [(id)objc_opt_class() cornerRadius];
  double v12 = fmin(v8 + v11, x);
  objc_msgSend(v13, "moveToPoint:", x, y);
  objc_msgSend(v13, "addLineToPoint:", v12, v7);
  objc_msgSend(v13, "addCurveToPoint:controlPoint1:controlPoint2:", v8, v10, v8, v7, v8, v10);
}

- (void)_addLeadingPinnedCurveToPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a4.origin.y;
  double v9 = a4.origin.x;
  id v14 = a3;
  [(id)objc_opt_class() cornerRadius];
  double v11 = v9 + v10 + 6.0;
  [(id)objc_opt_class() cornerRadius];
  double v13 = fmin(v8 + v12, y);
  objc_msgSend(v14, "addLineToPoint:", v11, v8);
  objc_msgSend(v14, "addCurveToPoint:controlPoint1:controlPoint2:", v9, v13, v9, v8, v9, v13);
  objc_msgSend(v14, "addLineToPoint:", x, y);
}

- (void)_addTopBottomArrowCurveForPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 isPinned:(BOOL)a8
{
  int x_low = LODWORD(a7.x);
  double y = a6.y;
  double x = a6.x;
  double v11 = a5.y;
  double v12 = a5.x;
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  double v27 = a4.origin.y;
  double v28 = a4.origin.x;
  id v29 = a3;
  [(id)objc_opt_class() cornerRadius];
  double v26 = v14;
  if ((x_low & 1) == 0) {
    objc_msgSend(v29, "moveToPoint:", x + 6.0, y);
  }
  objc_msgSend(v29, "addCurveToPoint:controlPoint1:controlPoint2:", x + -2.5, y + -2.0, x + -0.5, y, x + -0.5, y, *(void *)&width, *(void *)&height);
  objc_msgSend(v29, "addLineToPoint:", v31 + 2.0, v32 + 1.0);
  objc_msgSend(v29, "addCurveToPoint:controlPoint1:controlPoint2:", v31 + -2.0, v32 + 1.0, v31, v32 + -0.5, v31, v32 + -0.5);
  if (x_low)
  {
    if (v12 > v28 + 1.0)
    {
      objc_msgSend(v29, "addLineToPoint:", v12, v11);
      -[AMSUIPopoverShapeLayerView _addLeadingPinnedCurveToPath:bounds:startPoint:](self, "_addLeadingPinnedCurveToPath:bounds:startPoint:", v29, v28, v27, v23, v25, v12, v11);
      objc_msgSend(v29, "addLineToPoint:", v28, v27 + v26 + 6.0);
      goto LABEL_9;
    }
    objc_msgSend(v29, "addLineToPoint:", v12 + 2.0, v11 + -2.0);
    double v19 = v11 + 1.0;
    double v18 = v27 + v26 + 6.0;
    double v17 = v29;
    double v16 = v28;
    double v15 = v12;
    double v20 = v12;
    double v21 = v11 + 1.0;
  }
  else
  {
    objc_msgSend(v29, "addLineToPoint:", v12 + 2.0, v11 + -2.0);
    double v15 = v12 + -0.5;
    double v16 = v12 + -6.0;
    double v17 = v29;
    double v18 = v11;
    double v19 = v11;
    double v20 = v12 + -0.5;
    double v21 = v11;
  }
  objc_msgSend(v17, "addCurveToPoint:controlPoint1:controlPoint2:", v16, v18, v15, v19, v20, v21);
LABEL_9:
}

- (void)_addLeftRightArrowCurveForPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 isPinned:(BOOL)a8
{
  int x_low = LODWORD(a7.x);
  double y = a6.y;
  double x = a6.x;
  double v10 = a5.y;
  double v11 = a5.x;
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double v14 = a4.origin.y;
  CGFloat v15 = a4.origin.x;
  id v17 = a3;
  id v23 = v17;
  if (x_low)
  {
    double v18 = v15;
    double v19 = width;
    double v21 = v25;
    double v20 = y;
    if (v10 <= v14 + 1.0)
    {
      objc_msgSend(v17, "addLineToPoint:", v11 + 2.0, v10, v19);
      objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v11 + -2.0, v10 + 2.0, v11, v10 + 1.0, v11, v10 + 1.0);
    }
    else
    {
      -[AMSUIPopoverShapeLayerView _addLeadingPinnedCurveToPath:bounds:startPoint:endPoint:](self, "_addLeadingPinnedCurveToPath:bounds:startPoint:endPoint:", v17, v18, v14, v19, height, v11, v10, x, y);
    }
  }
  else
  {
    objc_msgSend(v17, "moveToPoint:", v11, fmax(v10 + -6.0, 0.0));
    objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v11 + -1.5, v10 + 3.0, v11, v10 + 0.5, v11, v10 + 0.5);
    double v21 = v25;
    double v20 = y;
  }
  objc_msgSend(v23, "addLineToPoint:", v21 + 1.0, v26 + -2.0);
  objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", v21 + 1.0, v26 + 2.0, v21 + -0.5, v26, v21 + -0.5, v26);
  objc_msgSend(v23, "addLineToPoint:", x + -1.5, v20 + -3.0);
  objc_msgSend(v23, "addCurveToPoint:controlPoint1:controlPoint2:", x, v20 + 6.0, x, v20 + 0.5, x, v20 + 0.5);
}

- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double x = a3.origin.x;
  [(id)objc_opt_class() arrowBase];
  double v7 = v6 * 0.5;
  [(id)objc_opt_class() arrowBase];
  double v9 = x + width - v8;
  [(AMSUIPopoverShapeLayerView *)self arrowOffset];
  return fmin(fmax(x, x + width * 0.5 - fabs(v10) - v7), v9);
}

- (double)_leftAndRightStartYLocationForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  CGFloat v6 = a3.origin.y + a3.size.height;
  [(id)objc_opt_class() arrowBase];
  double v8 = v6 - v7;
  [(AMSUIPopoverShapeLayerView *)self arrowOffset];
  double v10 = y + height * 0.5 - fabs(v9);
  [(id)objc_opt_class() arrowBase];
  return fmin(fmax(y, v10 - v11 * 0.5), v8);
}

- (void)_updateShapeLayerPath
{
  double v3 = [(AMSUIPopoverShapeLayerView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [MEMORY[0x263F824C0] bezierPath];
  [v12 setUsesEvenOddFillRule:1];
  [(AMSUIPopoverShapeLayerView *)self arrowOffset];
  BOOL v13 = -[AMSUIPopoverShapeLayerView wouldPinForOffset:](self, "wouldPinForOffset:");
  unint64_t v14 = [(AMSUIPopoverShapeLayerView *)self arrowDirection];
  if (v14 - 1 < 2)
  {
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    double v21 = v7 + v20;
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    double v23 = v11 - v22;
    if (v13) {
      -[AMSUIPopoverShapeLayerView _addRoundedRectExcludingTopLeftCornerForPath:bounds:](self, "_addRoundedRectExcludingTopLeftCornerForPath:bounds:", v12, v5, v21, v9, v23);
    }
    else {
      -[AMSUIPopoverShapeLayerView _addTopBottomRoundedRectWithGapForPath:bounds:](self, "_addTopBottomRoundedRectWithGapForPath:bounds:", v12, v5, v21, v9, v23);
    }
    -[AMSUIPopoverShapeLayerView _upAndDownStartingXLocationForBounds:](self, "_upAndDownStartingXLocationForBounds:", v5, v21, v9, v23);
    double v39 = v38;
    [(id)objc_opt_class() arrowBase];
    double v41 = v39 + v40;
    [(id)objc_opt_class() arrowBase];
    double v43 = v39 + v42 * 0.5;
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    -[AMSUIPopoverShapeLayerView _addTopBottomArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:](self, "_addTopBottomArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:", v12, v13, v5, v21, v9, v23, v39, v21, v41, v21, *(void *)&v43, v21 - v44);
    long long v52 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v54 = *MEMORY[0x263F000D0];
    *(_OWORD *)&v60.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v60.c = v52;
    long long v50 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v60.tdouble x = v50;
    [(AMSUIPopoverShapeLayerView *)self arrowOffset];
    if (v45 >= 0.0)
    {
      *(_OWORD *)&v58.a = v54;
      *(_OWORD *)&v58.c = v52;
      *(_OWORD *)&v58.tdouble x = v50;
      CGAffineTransformScale(&v59, &v58, -1.0, 1.0);
      CGAffineTransformTranslate(&v60, &v59, -v9, 0.0);
    }
    if ([(AMSUIPopoverShapeLayerView *)self arrowDirection] == 2)
    {
      CGAffineTransform v58 = v60;
      CGAffineTransformScale(&v57, &v58, 1.0, -1.0);
      [(AMSUIPopoverShapeLayerView *)self arrowHeight];
      CGAffineTransformTranslate(&v58, &v57, 0.0, -v23 - v46);
      CGAffineTransform v60 = v58;
    }
    CGAffineTransform v58 = v60;
    [v12 applyTransform:&v58];
  }
  else if (v14 == 4 || v14 == 8)
  {
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    double v16 = v5 + v15;
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    double v18 = v9 - v17;
    double v19 = [MEMORY[0x263F824C0] bezierPath];

    if (v13) {
      -[AMSUIPopoverShapeLayerView _addRoundedRectExcludingTopLeftCornerForPath:bounds:](self, "_addRoundedRectExcludingTopLeftCornerForPath:bounds:", v19, v16, v7, v18, v11);
    }
    else {
      -[AMSUIPopoverShapeLayerView _addLeftRightRoundedRectWithGapForPath:bounds:](self, "_addLeftRightRoundedRectWithGapForPath:bounds:", v19, v16, v7, v18, v11);
    }
    -[AMSUIPopoverShapeLayerView _leftAndRightStartYLocationForBounds:](self, "_leftAndRightStartYLocationForBounds:", v16, v7, v18, v11);
    double v30 = v29;
    [(id)objc_opt_class() arrowBase];
    double v32 = v30 + v31;
    [(id)objc_opt_class() arrowBase];
    double v34 = v30 + v33 * 0.5;
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    -[AMSUIPopoverShapeLayerView _addLeftRightArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:](self, "_addLeftRightArrowCurveForPath:bounds:startPoint:endPoint:peakPoint:isPinned:", v19, v13, v16, v7, v18, v11, v16, v30, v16, v32, v16 - v35, *(void *)&v34);
    long long v51 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v53 = *MEMORY[0x263F000D0];
    *(_OWORD *)&v60.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v60.c = v51;
    long long v49 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v60.tdouble x = v49;
    [(AMSUIPopoverShapeLayerView *)self arrowOffset];
    if (v36 >= 0.0)
    {
      *(_OWORD *)&v58.a = v53;
      *(_OWORD *)&v58.c = v51;
      *(_OWORD *)&v58.tdouble x = v49;
      CGAffineTransformScale(&v56, &v58, 1.0, -1.0);
      CGAffineTransformTranslate(&v60, &v56, 0.0, -v11);
    }
    if ([(AMSUIPopoverShapeLayerView *)self arrowDirection] == 8)
    {
      [(AMSUIPopoverShapeLayerView *)self arrowHeight];
      CGAffineTransform v58 = v60;
      CGAffineTransformTranslate(&v55, &v58, v18 + v37, 0.0);
      CGAffineTransformScale(&v58, &v55, -1.0, 1.0);
      CGAffineTransform v60 = v58;
    }
    CGAffineTransform v58 = v60;
    [v19 applyTransform:&v58];
    double v12 = v19;
  }
  else
  {
    [(AMSUIPopoverShapeLayerView *)self arrowHeight];
    double v25 = v11 - v24;
    double v26 = (void *)MEMORY[0x263F824C0];
    [(id)objc_opt_class() cornerRadius];
    uint64_t v28 = objc_msgSend(v26, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v25, v27);

    double v12 = (void *)v28;
  }
  v47 = [(AMSUIPopoverShapeLayerMaskView *)self->_shapeLayerMaskView layer];
  id v48 = v12;
  objc_msgSend(v47, "setPath:", objc_msgSend(v48, "CGPath"));
}

- (void)_loadNecessaryViews
{
  double v3 = [(AMSUIPopoverShapeLayerView *)self viewToMaskWhenContentExtendsOverArrow];

  shapeLayerMaskView = self->_shapeLayerMaskView;
  if (v3)
  {
    double v5 = [(AMSUIPopoverShapeLayerView *)self viewToMaskWhenContentExtendsOverArrow];
    [v5 setMaskView:shapeLayerMaskView];
  }
  else
  {
    [(AMSUIPopoverShapeLayerView *)self setMaskView:self->_shapeLayerMaskView];
  }
  [(AMSUIPopoverShapeLayerView *)self _updateShapeLayerPathIfNeeded];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIPopoverShapeLayerView;
  [(AMSUIPopoverShapeLayerView *)&v5 didMoveToWindow];
  double v3 = [(AMSUIPopoverShapeLayerView *)self window];

  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __45__AMSUIPopoverShapeLayerView_didMoveToWindow__block_invoke;
    v4[3] = &unk_2643E3118;
    v4[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v4];
  }
}

uint64_t __45__AMSUIPopoverShapeLayerView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadNecessaryViews];
}

- (UIView)viewToMaskWhenContentExtendsOverArrow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMaskWhenContentExtendsOverArrow);
  return (UIView *)WeakRetained;
}

- (void)setViewToMaskWhenContentExtendsOverArrow:(id)a3
{
}

- (BOOL)shapeLayerPathNeedsUpdate
{
  return self->_shapeLayerPathNeedsUpdate;
}

- (void)setShapeLayerPathNeedsUpdate:(BOOL)a3
{
  self->_shapeLayerPathNeedsUpdate = a3;
}

- (BOOL)popoverBackgroundColorIsOpaque
{
  return self->_popoverBackgroundColorIsOpaque;
}

- (void)setPopoverBackgroundColorIsOpaque:(BOOL)a3
{
  self->_popoverBackgroundColorIsOpaque = a3;
}

- (BOOL)arrowVisible
{
  return self->_arrowVisible;
}

- (void)setArrowVisible:(BOOL)a3
{
  self->_arrowVisible = a3;
}

- (BOOL)arrowOffsetWasFlipped
{
  return self->_arrowOffsetWasFlipped;
}

- (void)setArrowOffsetWasFlipped:(BOOL)a3
{
  self->_arrowOffsetWasFlipped = a3;
}

- (BOOL)arrowDirectionWasFlipped
{
  return self->_arrowDirectionWasFlipped;
}

- (void)setArrowDirectionWasFlipped:(BOOL)a3
{
  self->_arrowDirectionWasFlipped = a3;
}

- (AMSUIPopoverShapeLayerMaskView)shapeLayerMaskView
{
  return (AMSUIPopoverShapeLayerMaskView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setShapeLayerMaskView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayerMaskView, 0);
  objc_destroyWeak((id *)&self->_viewToMaskWhenContentExtendsOverArrow);
}

@end