@interface PKDetectionView
- (BOOL)hitTest:(CGPoint)a3;
- (CGAffineTransform)drawingTransform;
- (CGRect)drawingBounds;
- (PKDetectionItem)item;
- (PKDetectionView)init;
- (UIContextMenuInteraction)menuInteraction;
- (double)_underlineThickness;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_underlineColor;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (unint64_t)accessibilityTraits;
- (void)drawRect:(CGRect)a3;
- (void)setDrawingTransform:(CGAffineTransform *)a3;
- (void)setMenuInteraction:(id)a3;
- (void)tapHandler:(id)a3;
@end

@implementation PKDetectionView

- (PKDetectionView)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDetectionView;
  v2 = [(PKDetectionView *)&v7 init];
  [(PKDetectionView *)v2 setOpaque:0];
  [(PKDetectionView *)v2 setContentMode:3];
  [(PKDetectionView *)v2 setTintAdjustmentMode:1];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v2];
  menuInteraction = v2->_menuInteraction;
  v2->_menuInteraction = (UIContextMenuInteraction *)v3;

  [(PKDetectionView *)v2 addInteraction:v2->_menuInteraction];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v2 action:sel_tapHandler_];
  [(PKDetectionView *)v2 addGestureRecognizer:v5];

  return v2;
}

- (PKDetectionItem)item
{
  v2 = objc_opt_new();

  return (PKDetectionItem *)v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2568];
}

- (CGRect)drawingBounds
{
  v2 = [(PKDetectionView *)self item];
  [v2 _frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_underlineThickness
{
  v2 = [(PKDetectionView *)self item];
  [v2 _strokeWidth];
  double v4 = v3 * 0.5;

  double result = fmin(v4, 10.0);
  if (result < 1.0) {
    return 1.0;
  }
  return result;
}

- (id)_underlineColor
{
  double v3 = [(PKDetectionView *)self item];
  double v4 = [v3 strokeColor];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PKDetectionView *)self tintColor];
  }
  double v7 = v6;

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v4 = [(PKDetectionView *)self _underlineColor];
  double v5 = [(PKDetectionView *)self item];
  id v6 = [v5 strokeColor];

  double v7 = [(PKDetectionView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v6)
  {
    if (v8 == 2)
    {
      *(void *)&long long v23 = 0;
      double v27 = 0.0;
      *(void *)&long long v28 = 0;
      double v26 = 0.0;
      if ([v4 getHue:&v23 saturation:&v28 brightness:&v27 alpha:&v26])
      {
        double v9 = fmin(v27 + 0.7, 1.0);
        double v10 = 0.0;
        if (*(double *)&v28 + -0.1 >= 0.0) {
          double v10 = *(double *)&v28 + -0.1;
        }
        double v27 = v9;
        *(double *)&long long v28 = v10;
        double v26 = fmin(v26 + 0.2, 1.0);
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", *(double *)&v23);

        double v4 = (void *)v11;
      }
    }
  }
  [v4 set];
  double v12 = [(PKDetectionView *)self item];
  double v13 = [v12 itemSpaceBaselinePath];
  double v14 = (void *)[v13 copy];

  [(PKDetectionView *)self _setLineDashFor:v14];
  [(PKDetectionView *)self _underlineThickness];
  objc_msgSend(v14, "setLineWidth:");
  [v14 setLineCapStyle:1];
  [v14 setLineJoinStyle:1];
  p_drawingTransform = &self->_drawingTransform;
  long long v16 = *(_OWORD *)&self->_drawingTransform.c;
  long long v23 = *(_OWORD *)&self->_drawingTransform.a;
  long long v24 = v16;
  long long v25 = *(_OWORD *)&self->_drawingTransform.tx;
  [v14 applyTransform:&v23];
  [v14 stroke];
  v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  LODWORD(v13) = [v17 BOOLForKey:@"internalSettings.datadetectors.showBounds"];

  if (v13)
  {
    v18 = [MEMORY[0x1E4FB1618] blueColor];
    [v18 set];

    v19 = [(PKDetectionView *)self item];
    v20 = [v19 itemSpaceBoundsPath];
    v21 = (void *)[v20 copy];

    [v21 setLineWidth:0.5];
    long long v28 = xmmword_1C4829440;
    [v21 setLineDash:&v28 count:2 phase:0.0];
    long long v22 = *(_OWORD *)&p_drawingTransform->c;
    long long v23 = *(_OWORD *)&p_drawingTransform->a;
    long long v24 = v22;
    long long v25 = *(_OWORD *)&p_drawingTransform->tx;
    [v21 applyTransform:&v23];
    [v21 stroke];
  }
}

- (BOOL)hitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(PKDetectionView *)self isHidden]) {
    return 0;
  }
  [(PKDetectionView *)self alpha];
  if (v4 <= 0.0) {
    return 0;
  }
  long long v5 = *(_OWORD *)&self->_drawingTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->_drawingTransform.a;
  *(_OWORD *)&v13.c = v5;
  *(_OWORD *)&v13.tdouble x = *(_OWORD *)&self->_drawingTransform.tx;
  CGAffineTransformInvert(&v14, &v13);
  float64x2_t v12 = vaddq_f64(*(float64x2_t *)&v14.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v14.c, y), *(float64x2_t *)&v14.a, x));
  id v6 = [(PKDetectionView *)self item];
  double v7 = [v6 itemSpaceBoundsPath];
  char v8 = [v7 containsPoint:*(_OWORD *)&v12];

  return v8;
}

- (void)tapHandler:(id)a3
{
  [a3 locationInView:self];
  if (-[PKDetectionView hitTest:](self, "hitTest:"))
  {
    [(PKDetectionView *)self bounds];
    double MidX = CGRectGetMidX(v11);
    [(PKDetectionView *)self bounds];
    double MaxY = CGRectGetMaxY(v12);
    id v6 = [(PKDetectionView *)self item];
    double v7 = [(PKDetectionView *)self menuInteraction];
    [(PKDetectionView *)self drawingTransform];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v9[0] = *MEMORY[0x1E4F1DAB8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    objc_msgSend(v6, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:", v7, self, v9, v10, MidX, MaxY);
  }
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (CGAffineTransform)drawingTransform
{
  long long v3 = *(_OWORD *)&self[9].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[9].c;
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_drawingTransform.c = v4;
  *(_OWORD *)&self->_drawingTransform.tdouble x = v3;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void)setMenuInteraction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end