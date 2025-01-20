@interface CAMPanoramaArrowView
- (CAMPanoramaArrowView)initWithFrame:(CGRect)a3;
- (CGPath)_newTailPiecesPathOfWidth:(double *)a3;
- (CGSize)intrinsicContentSize;
- (void)_updateTailWithAnimationDuration:(double)a3;
- (void)animateWithNormalizedSpeed:(double)a3 duration:(double)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reset;
@end

@implementation CAMPanoramaArrowView

- (CAMPanoramaArrowView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CAMPanoramaArrowView;
  v3 = -[CAMPanoramaArrowView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = CAMCameraUIFrameworkBundle();
    v5 = [MEMORY[0x263F827E8] imageNamed:@"firebreak-PLCameraPanoramaArrowHead_2only_" inBundle:v4];
    uint64_t v6 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
    arrowHead = v3->_arrowHead;
    v3->_arrowHead = (UIImageView *)v6;

    [(UIImageView *)v3->_arrowHead sizeToFit];
    [v5 size];
    double v9 = v8;
    [v5 size];
    double v11 = v10;
    v12 = [(CAMPanoramaArrowView *)v3 traitCollection];
    [v12 displayScale];
    double v14 = v9 + 20.0 + v13 * 3.0;

    -[CAMPanoramaArrowView setFrame:](v3, "setFrame:", 0.0, 0.0, v14, v11);
    CGFloat v15 = v14 - v9;
    -[UIImageView setFrame:](v3->_arrowHead, "setFrame:", v15, 0.0, v9, v11);
    [(CAMPanoramaArrowView *)v3 addSubview:v3->_arrowHead];
    v3->_arrowTailRect.origin.x = 0.0;
    v3->_arrowTailRect.origin.y = 0.0;
    v3->_arrowTailRect.size.width = v15;
    v3->_arrowTailRect.size.height = v11;
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v3->_arrowTailRect.origin.x, v3->_arrowTailRect.origin.y, v3->_arrowTailRect.size.width, v3->_arrowTailRect.size.height);
    arrowTail = v3->_arrowTail;
    v3->_arrowTail = (UIView *)v16;

    [(CAMPanoramaArrowView *)v3 addSubview:v3->_arrowTail];
    v3->_tailBiggestDelta = 0.0;
    v3->_tailBigDelta = 0.0;
    v3->_tailMediumDelta = 0.0;
    v3->_tailSmallDelta = 0.0;
    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    arrowTailPiecesLayer = v3->_arrowTailPiecesLayer;
    v3->_arrowTailPiecesLayer = v18;

    [(CAShapeLayer *)v3->_arrowTailPiecesLayer setMasksToBounds:0];
    -[CAShapeLayer setFrame:](v3->_arrowTailPiecesLayer, "setFrame:", v3->_arrowTailRect.origin.x, v3->_arrowTailRect.origin.y, v3->_arrowTailRect.size.width, v3->_arrowTailRect.size.height);
    v20 = v3->_arrowTailPiecesLayer;
    id v21 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", [v21 CGColor]);

    v22 = [(UIView *)v3->_arrowTail layer];
    [v22 addSublayer:v3->_arrowTailPiecesLayer];

    [(CAMPanoramaArrowView *)v3 _updateTailWithAnimationDuration:0.0];
  }
  return v3;
}

- (void)dealloc
{
  CGPathRelease(self->_currentTailPiecesPath);
  v3.receiver = self;
  v3.super_class = (Class)CAMPanoramaArrowView;
  [(CAMPanoramaArrowView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_arrowHead intrinsicContentSize];
  double v4 = v3;
  double v6 = v5 + 20.0;
  v7 = [(CAMPanoramaArrowView *)self traitCollection];
  [v7 displayScale];
  double v9 = v6 + v8 * 3.0;

  double v10 = v9;
  double v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CAMPanoramaArrowView;
  [(CAMPanoramaArrowView *)&v2 layoutSubviews];
}

- (CGPath)_newTailPiecesPathOfWidth:(double *)a3
{
  Mutable = CGPathCreateMutable();
  double MaxX = CGRectGetMaxX(self->_arrowTailRect);
  CGFloat MinY = CGRectGetMinY(self->_arrowTailRect);
  double v8 = MaxX + -4.0 - self->_tailBiggestDelta;
  CGFloat v9 = v8 + -3.0 - self->_tailBigDelta;
  CGFloat v10 = v9 + -2.0 - self->_tailMediumDelta;
  double v11 = v10 + -1.0 - self->_tailSmallDelta;
  double v12 = MinY + 16.0;
  double v13 = CGRectGetHeight(self->_arrowTailRect) + -16.0 + -16.0;
  v16.size.width = 1.0;
  v16.origin.x = v11;
  v16.origin.y = v12;
  v16.size.height = v13;
  CGPathAddRect(Mutable, 0, v16);
  v17.size.width = 2.0;
  v17.origin.x = v10;
  v17.origin.y = v12;
  v17.size.height = v13;
  CGPathAddRect(Mutable, 0, v17);
  v18.size.width = 3.0;
  v18.origin.x = v9;
  v18.origin.y = v12;
  v18.size.height = v13;
  CGPathAddRect(Mutable, 0, v18);
  v19.size.width = 4.0;
  v19.origin.x = v8;
  v19.origin.y = v12;
  v19.size.height = v13;
  CGPathAddRect(Mutable, 0, v19);
  if (a3)
  {
    v20.size.width = 4.0;
    v20.origin.x = v8;
    v20.origin.y = v12;
    v20.size.height = v13;
    double v14 = CGRectGetMaxX(v20);
    v21.size.width = 1.0;
    v21.origin.x = v11;
    v21.origin.y = v12;
    v21.size.height = v13;
    *a3 = v14 - CGRectGetMinX(v21);
  }
  return Mutable;
}

- (void)_updateTailWithAnimationDuration:(double)a3
{
  uint64_t v9 = 0;
  double v5 = [(CAMPanoramaArrowView *)self _newTailPiecesPathOfWidth:&v9];
  if (a3 <= 0.0)
  {
    [(CAShapeLayer *)self->_arrowTailPiecesLayer setPath:v5];
  }
  else
  {
    double v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"path"];
    [v6 setDuration:a3];
    v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    [v6 setTimingFunction:v7];

    [v6 setRemovedOnCompletion:0];
    [v6 setFillMode:*MEMORY[0x263F15AB0]];
    [v6 setFromValue:self->_currentTailPiecesPath];
    [v6 setToValue:v5];
    [(CAShapeLayer *)self->_arrowTailPiecesLayer addAnimation:v6 forKey:@"pathAnimation"];
  }
  currentTailPiecesPath = self->_currentTailPiecesPath;
  if (currentTailPiecesPath) {
    CGPathRelease(currentTailPiecesPath);
  }
  self->_currentTailPiecesPath = v5;
}

- (void)animateWithNormalizedSpeed:(double)a3 duration:(double)a4
{
  double currentNormalizedSpeed = self->_currentNormalizedSpeed;
  BOOL v7 = a3 >= 1.0;
  if (currentNormalizedSpeed >= 1.0) {
    BOOL v7 = 0;
  }
  int v8 = currentNormalizedSpeed * 1.02 <= a3 || v7;
  if (a3 < 1.0)
  {
    double v9 = self->_tailBiggestDelta + -1.0;
    double v10 = 0.0;
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    double v11 = self->_tailBigDelta + -1.0;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    double v12 = self->_tailMediumDelta + -1.0;
    if (v12 < 0.0) {
      double v12 = 0.0;
    }
    double v13 = self->_tailSmallDelta + -1.0;
    BOOL v14 = v13 < 0.0;
    goto LABEL_14;
  }
  double v15 = currentNormalizedSpeed * 0.98;
  if (a3 >= 1.15)
  {
    if (a3 >= 1.3)
    {
      double v13 = 0.0;
      if (v8)
      {
        double v9 = fmin(self->_tailBiggestDelta + 1.0, 1.0);
        double v11 = fmin(self->_tailBigDelta + 1.0, 2.0);
        double v12 = fmin(self->_tailMediumDelta + 1.0, 3.0);
        double v13 = fmin(self->_tailSmallDelta + 1.0, 4.0);
        goto LABEL_33;
      }
      BOOL v14 = v15 < a3;
      double v12 = 0.0;
      double v11 = 0.0;
      double v9 = 0.0;
      if (v14) {
        goto LABEL_33;
      }
      double v9 = self->_tailBiggestDelta + -1.0;
      if (v9 < 0.0) {
        double v9 = 0.0;
      }
      double v11 = self->_tailBigDelta + -1.0;
      if (v11 < 1.0) {
        double v11 = 1.0;
      }
      double v12 = self->_tailMediumDelta + -1.0;
      if (v12 < 2.0) {
        double v12 = 2.0;
      }
      double v13 = self->_tailSmallDelta + -1.0;
      double v10 = 3.0;
    }
    else
    {
      if (v8)
      {
        double v11 = fmin(self->_tailBigDelta + 1.0, 1.0);
        double v12 = fmin(self->_tailMediumDelta + 1.0, 2.0);
        double v13 = fmin(self->_tailSmallDelta + 1.0, 3.0);
        goto LABEL_32;
      }
      double v13 = 0.0;
      BOOL v14 = v15 < a3;
      double v12 = 0.0;
      double v11 = 0.0;
      double v9 = 0.0;
      if (v14) {
        goto LABEL_33;
      }
      double v9 = self->_tailBiggestDelta + -1.0;
      if (v9 < 0.0) {
        double v9 = 0.0;
      }
      if (self->_tailBigDelta + -1.0 >= 0.0) {
        double v11 = self->_tailBigDelta + -1.0;
      }
      double v12 = self->_tailMediumDelta + -1.0;
      if (v12 < 1.0) {
        double v12 = 1.0;
      }
      double v13 = self->_tailSmallDelta + -1.0;
      double v10 = 2.0;
    }
  }
  else
  {
    if (v8)
    {
      double v12 = fmin(self->_tailMediumDelta + 1.0, 1.0);
      double v13 = fmin(self->_tailSmallDelta + 1.0, 2.0);
      double v11 = 0.0;
LABEL_32:
      double v9 = 0.0;
      goto LABEL_33;
    }
    double v13 = 0.0;
    BOOL v14 = v15 < a3;
    double v12 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    if (v14) {
      goto LABEL_33;
    }
    double v9 = self->_tailBiggestDelta + -1.0;
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    double v11 = self->_tailBigDelta + -1.0;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    if (self->_tailMediumDelta + -1.0 >= 0.0) {
      double v12 = self->_tailMediumDelta + -1.0;
    }
    double v13 = self->_tailSmallDelta + -1.0;
    double v10 = 1.0;
  }
  BOOL v14 = v13 < v10;
LABEL_14:
  if (v14) {
    double v13 = v10;
  }
LABEL_33:
  if (v9 != self->_tailBiggestDelta
    || v11 != self->_tailBigDelta
    || v12 != self->_tailMediumDelta
    || v13 != self->_tailSmallDelta)
  {
    self->_tailBiggestDelta = v9;
    self->_tailBigDelta = v11;
    self->_tailMediumDelta = v12;
    self->_tailSmallDelta = v13;
    [(CAMPanoramaArrowView *)self _updateTailWithAnimationDuration:a4];
  }
  self->_double currentNormalizedSpeed = a3;
}

- (void)reset
{
  [(CAShapeLayer *)self->_arrowTailPiecesLayer removeAllAnimations];
  self->_double currentNormalizedSpeed = 0.0;
  self->_tailBiggestDelta = 0.0;
  self->_tailBigDelta = 0.0;
  self->_tailMediumDelta = 0.0;
  self->_tailSmallDelta = 0.0;
  [(CAMPanoramaArrowView *)self _updateTailWithAnimationDuration:0.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowTailPiecesLayer, 0);
  objc_storeStrong((id *)&self->_arrowTail, 0);
  objc_storeStrong((id *)&self->_arrowHead, 0);
}

@end