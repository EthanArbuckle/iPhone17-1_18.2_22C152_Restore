@interface BKUIJindoPositioningGuideView
- (BOOL)needsMaskedNeedsPositionStyleEnrollment;
- (double)_edgeDistanceHeightDifference;
- (double)_squareLayoutOpenValue;
- (double)lineYpositionDifference;
- (double)startLineYposition;
- (double)targetLineYposition;
- (id)_roundedRectMaskForMaskDistance:(double)a3 portalCenter:(CGPoint)a4 cornerRadius:(double)a5;
- (void)_startAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)_updateChildrenValuesForDisplayTickProgress:(double)a3;
- (void)_updateTargetValuesForAnimation:(int64_t)a3 animationCurve:(int64_t)a4;
- (void)drawRect:(CGRect)a3;
- (void)resetValuesToStart;
- (void)setLineYpositionDifference:(double)a3;
- (void)setStartLineYposition:(double)a3;
- (void)setTargetLineYposition:(double)a3;
@end

@implementation BKUIJindoPositioningGuideView

- (void)resetValuesToStart
{
  [(BKUIPearlPositioningGuideView *)self setLineWidth:4.33333333];
  [(BKUIJindoPositioningGuideView *)self _squareLayoutOpenValue];
  -[BKUIPearlPositioningGuideView setEdgeDistance:](self, "setEdgeDistance:");
  [(BKUIJindoPositioningGuideView *)self _squareLayoutOpenValue];
  -[BKUIPearlPositioningGuideView setTargetEdgeDistance:](self, "setTargetEdgeDistance:");
  [(BKUIJindoPositioningGuideView *)self _edgeDistanceHeightDifference];
  -[BKUIJindoPositioningGuideView setLineYpositionDifference:](self, "setLineYpositionDifference:");
  [(BKUIPearlPositioningGuideView *)self setCornerRadius:17.6666667];
  [(BKUIPearlPositioningGuideView *)self setPostCornerLength:19.0];
  [(BKUIPearlPositioningGuideView *)self setLineAlpha:0.0];
  [(BKUIJindoPositioningGuideView *)self center];
  -[BKUIPearlPositioningGuideView setPortalCenter:](self, "setPortalCenter:");

  [(BKUIJindoPositioningGuideView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  [(BKUIPearlPositioningGuideView *)self portalCenter];
  double v5 = v4;
  double v35 = v4;
  double v7 = v6;
  id v40 = [MEMORY[0x1E4F427D0] bezierPath];
  [(BKUIPearlPositioningGuideView *)self edgeDistance];
  double v9 = v8;
  [(BKUIPearlPositioningGuideView *)self cornerRadius];
  double v11 = v10;
  [(BKUIPearlPositioningGuideView *)self postCornerLength];
  double v13 = v12;
  [(BKUIJindoPositioningGuideView *)self lineYpositionDifference];
  double v15 = v14;
  [(BKUIPearlPositioningGuideView *)self lineWidth];
  double v38 = v5 + v9;
  double v39 = v16;
  double v17 = v7;
  double v34 = v7;
  objc_msgSend(v40, "moveToPoint:", v38, v7 + v9 - v11 - v13 + v15);
  double v18 = v13 + v7 + v9 - v11 - v13 + v15;
  objc_msgSend(v40, "addLineToPoint:", v38, v18);
  [v40 addArcWithCenter:1 radius:v38 - v11 startAngle:v18 endAngle:v11 clockwise:0.0];
  double v19 = v17 + v9;
  double v20 = v17 + v9 + v15;
  double v37 = v38 - v11 - v13;
  objc_msgSend(v40, "addLineToPoint:");
  double v21 = v35 - v9;
  double v22 = v35 - v9 + v11;
  double v36 = v22 + v13;
  objc_msgSend(v40, "moveToPoint:");
  objc_msgSend(v40, "addLineToPoint:", v22, v20);
  double v23 = v19 - v11;
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v22, v23 + v15, v11, 1.57079633, 3.14159265);
  objc_msgSend(v40, "addLineToPoint:", v21, v23 - v13 + v15);
  double v24 = v34 - v9;
  double v25 = v34 - v9 + v11;
  double v26 = v25 + v13 - v15;
  objc_msgSend(v40, "moveToPoint:", v21, v26);
  double v27 = v25 - v15;
  objc_msgSend(v40, "addLineToPoint:", v21, v27);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v22, v27, v11, 3.14159265, 4.71238898);
  objc_msgSend(v40, "addLineToPoint:", v36, v24 - v15);
  objc_msgSend(v40, "moveToPoint:", v37, v24 - v15);
  objc_msgSend(v40, "addLineToPoint:", v38 - v11, v24 - v15);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v38 - v11, v27, v11, 4.71238898, 0.0);
  objc_msgSend(v40, "addLineToPoint:", v38, v26);
  [v40 setLineCapStyle:1];
  [v40 setLineWidth:v39 + 1.0];
  v28 = (void *)MEMORY[0x1E4F428B8];
  [(BKUIPearlPositioningGuideView *)self lineAlpha];
  v30 = [v28 colorWithWhite:0.0 alpha:v29 * 0.25];
  [v30 setStroke];

  [v40 stroke];
  [v40 setLineWidth:v39];
  v31 = (void *)MEMORY[0x1E4F428B8];
  [(BKUIPearlPositioningGuideView *)self lineAlpha];
  v33 = [v31 colorWithWhite:1.0 alpha:v32];
  [v33 setStroke];

  [v40 stroke];
}

- (double)_squareLayoutOpenValue
{
  v3 = +[BKUIDevice sharedInstance];
  int v4 = [v3 isZoomEnabled];

  if (v4)
  {
    double v5 = +[BKUIDevice sharedInstance];
    if ([v5 mainScreenClass] == 31) {
      int v6 = 40;
    }
    else {
      int v6 = 30;
    }
    double v7 = (double)v6;

    [(BKUIJindoPositioningGuideView *)self bounds];
    double v9 = v8 + v7 * -2.0;
  }
  else
  {
    [(BKUIJindoPositioningGuideView *)self bounds];
    double v9 = v10 + -90.0;
  }
  return v9 * 0.5;
}

- (double)_edgeDistanceHeightDifference
{
  v2 = +[BKUIDevice sharedInstance];
  int v3 = [v2 mainScreenClass];

  if (v3 != 31) {
    return 26.5;
  }
  int v4 = +[BKUIDevice sharedInstance];
  int v5 = [v4 isZoomEnabled];

  double result = 30.0;
  if (v5) {
    return 7.5;
  }
  return result;
}

- (void)_updateTargetValuesForAnimation:(int64_t)a3 animationCurve:(int64_t)a4
{
  if ((unint64_t)a3 >= 3)
  {
    if (a3 == 3)
    {
      -[BKUIPearlPositioningGuideView setTargetLineWidth:](self, "setTargetLineWidth:", 3, a4, 3.5);
      [(BKUIPearlPositioningGuideView *)self ringRadius];
      double v7 = v6;
      [(BKUIPearlPositioningGuideView *)self targetLineWidth];
      [(BKUIPearlPositioningGuideView *)self setTargetEdgeDistance:v7 + v8 * 0.5];
      [(BKUIPearlPositioningGuideView *)self targetEdgeDistance];
      -[BKUIPearlPositioningGuideView setTargetCornerRadius:](self, "setTargetCornerRadius:");
      [(BKUIPearlPositioningGuideView *)self setTargetPostCornerLength:0.0];
      [(BKUIJindoPositioningGuideView *)self setTargetLineYposition:0.0];
      [(BKUIPearlPositioningGuideView *)self setTargetLineAlpha:0.85];
    }
  }
  else
  {
    [(BKUIPearlPositioningGuideView *)self setTargetLineWidth:4.33333333];
    [(BKUIJindoPositioningGuideView *)self _squareLayoutOpenValue];
    -[BKUIPearlPositioningGuideView setTargetEdgeDistance:](self, "setTargetEdgeDistance:");
    [(BKUIPearlPositioningGuideView *)self setTargetCornerRadius:17.0];
    [(BKUIPearlPositioningGuideView *)self setTargetPostCornerLength:24.0];
    [(BKUIJindoPositioningGuideView *)self _edgeDistanceHeightDifference];
    -[BKUIJindoPositioningGuideView setTargetLineYposition:](self, "setTargetLineYposition:");
    [(BKUIPearlPositioningGuideView *)self setTargetLineAlpha:1.0];
    [(BKUIJindoPositioningGuideView *)self center];
    -[BKUIPearlPositioningGuideView setTargetPortalCenter:](self, "setTargetPortalCenter:");
    [(BKUIPearlPositioningGuideView *)self setAnimationCurve:a4];
  }
}

- (void)_updateChildrenValuesForDisplayTickProgress:(double)a3
{
  double targetLineYposition = self->_targetLineYposition;
  [(BKUIJindoPositioningGuideView *)self lineYpositionDifference];
  [(BKUIPearlPositioningGuideView *)self _updatedFloatWithTarget:targetLineYposition current:v6 start:self->_startLineYposition progress:a3];

  -[BKUIJindoPositioningGuideView setLineYpositionDifference:](self, "setLineYpositionDifference:");
}

- (id)_roundedRectMaskForMaskDistance:(double)a3 portalCenter:(CGPoint)a4 cornerRadius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  [(BKUIJindoPositioningGuideView *)self bounds];
  double v14 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v10 + -1.0, v11 + -1.0, v12 + 2.0, v13 + 2.0);
  [(BKUIJindoPositioningGuideView *)self lineYpositionDifference];
  double v16 = y - a3 - v15;
  [(BKUIJindoPositioningGuideView *)self lineYpositionDifference];
  double v18 = objc_msgSend(MEMORY[0x1E4F427D0], "_bezierPathWithArcRoundedRect:cornerRadius:", x - a3, v16, a3 + a3, v17 + v17 + a3 * 2.0, a5);
  [v14 appendPath:v18];

  return v14;
}

- (void)_startAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (([(BKUIJindoPositioningGuideView *)self isHidden] & 1) == 0 && !UIAccessibilityIsReduceMotionEnabled()) {
    self->_startLineYposition = self->_lineYpositionDifference;
  }
  v7.receiver = self;
  v7.super_class = (Class)BKUIJindoPositioningGuideView;
  [(BKUIPearlPositioningGuideView *)&v7 _startAnimationWithDuration:v6 completion:a3];
}

- (BOOL)needsMaskedNeedsPositionStyleEnrollment
{
  return 1;
}

- (double)targetLineYposition
{
  return self->_targetLineYposition;
}

- (void)setTargetLineYposition:(double)a3
{
  self->_double targetLineYposition = a3;
}

- (double)lineYpositionDifference
{
  return self->_lineYpositionDifference;
}

- (void)setLineYpositionDifference:(double)a3
{
  self->_lineYpositionDifference = a3;
}

- (double)startLineYposition
{
  return self->_startLineYposition;
}

- (void)setStartLineYposition:(double)a3
{
  self->_startLineYposition = a3;
}

@end