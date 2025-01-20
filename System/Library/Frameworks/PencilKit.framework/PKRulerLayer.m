@interface PKRulerLayer
- (BOOL)compactRuler;
- (BOOL)isExpandedInline;
- (BOOL)isInlineResizing;
- (BOOL)isRulerDrawingMovingToEndOfRuler;
- (BOOL)shouldUseLargestRulerTextFontSize;
- (BOOL)viewPointInRuler:(CGPoint)a3;
- (BOOL)zooming;
- (CALayer)rulerAngleMarker;
- (CALayer)rulerAngleTick;
- (CALayer)rulerDistanceHUD;
- (CALayer)rulerLayer;
- (CATextLayer)rulerAngleText;
- (CATextLayer)rulerDistanceText;
- (CGAffineTransform)previousRulerTransform;
- (CGAffineTransform)rulerTransform;
- (CGAffineTransform)rulerZoomStartTransform;
- (CGPoint)getRulerCenterLineOriginAndTangent:(CGPoint *)a3;
- (NSTimer)imageTransformTimer;
- (PKRulerController)rulerController;
- (PKRulerLayer)initWithRulerController:(id)a3;
- (double)_distanceMarkerFontSize;
- (double)_fontSizeForRulerTextHUD:(id)a3;
- (double)currentTValueForSnappedDrawing;
- (double)initialDrawingBoundsYOrigin;
- (double)maxTValueForSnappedDrawing;
- (double)minTValueForSnappedDrawing;
- (double)originTValueForSnappedDrawing;
- (double)rulerAlignInset;
- (double)rulerAlpha;
- (double)rulerTickMarkInset;
- (double)rulerWidth;
- (double)rulerZoomStartCenterTValueOnScreen;
- (double)rulerZoomStartScale;
- (id)_rulerImage;
- (id)_textForRulerHUD:(double)a3;
- (id)addOpacityAnimationOnLayer:(id)a3 delegate:(id)a4 toOpacity:(double)a5;
- (id)addScaleAnimationOnLayer:(id)a3 delegate:(id)a4 fromScale:(double)a5 toScale:(double)a6;
- (id)rulerDialImage;
- (id)rulerDialLevelImage;
- (int64_t)currentAngle;
- (int64_t)userAngle;
- (void)addScaleAndOpacityAnimationOnLayer:(id)a3 delegate:(id)a4 fromScale:(double)a5 toScale:(double)a6 fromAlpha:(double)a7 toAlpha:(double)a8;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)hideRulerAngleMarker;
- (void)hideRulerAnimated:(BOOL)a3;
- (void)removeRulerMarkers;
- (void)setCurrentTValueForSnappedDrawing:(double)a3;
- (void)setImageTransformTimer:(id)a3;
- (void)setInitialDrawingBoundsYOrigin:(double)a3;
- (void)setIsExpandedInline:(BOOL)a3;
- (void)setIsInlineResizing:(BOOL)a3;
- (void)setIsRulerDrawingMovingToEndOfRuler:(BOOL)a3;
- (void)setMaxTValueForSnappedDrawing:(double)a3;
- (void)setMinTValueForSnappedDrawing:(double)a3;
- (void)setOriginTValueForSnappedDrawing:(double)a3;
- (void)setPreviousRulerTransform:(CGAffineTransform *)a3;
- (void)setRulerAlpha:(double)a3;
- (void)setRulerAngleMarker:(id)a3;
- (void)setRulerAngleText:(id)a3;
- (void)setRulerAngleTick:(id)a3;
- (void)setRulerController:(id)a3;
- (void)setRulerDistanceHUD:(id)a3;
- (void)setRulerDistanceText:(id)a3;
- (void)setRulerLayer:(id)a3;
- (void)setRulerTransform:(CGAffineTransform *)a3;
- (void)setRulerZoomStartCenterTValueOnScreen:(double)a3;
- (void)setRulerZoomStartScale:(double)a3;
- (void)setRulerZoomStartTransform:(CGAffineTransform *)a3;
- (void)setZooming:(BOOL)a3;
- (void)showRuler;
- (void)updateAngleWithAngleMarkerPosition:(CGPoint)a3;
- (void)updateDistanceMarkerWithSpacing:(double)a3;
- (void)updateRulerAlpha:(double)a3;
- (void)updateRulerMarkerForLocation:(CGPoint)a3 firstTouch:(BOOL)a4;
- (void)updateRulerTickMarkImage;
@end

@implementation PKRulerLayer

- (PKRulerLayer)initWithRulerController:(id)a3
{
  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)PKRulerLayer;
  v4 = [(PKRulerLayer *)&v7 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_rulerController, v5);
  }
  objc_destroyWeak(&location);
  return v4;
}

- (BOOL)compactRuler
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (id)_rulerImage
{
  v2 = (void *)MEMORY[0x1E4FB1E20];
  if ([(PKRulerLayer *)self compactRuler]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  v4 = [v2 traitCollectionWithHorizontalSizeClass:v3];
  id v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v7 = [v5 imageNamed:@"ios_ruler_bg" inBundle:v6 compatibleWithTraitCollection:v4];

  return v7;
}

- (id)rulerDialImage
{
  v2 = (void *)MEMORY[0x1E4FB1E20];
  if ([(PKRulerLayer *)self compactRuler]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  v4 = [v2 traitCollectionWithHorizontalSizeClass:v3];
  id v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v7 = [v5 imageNamed:@"ios_ruler_angle_dial" inBundle:v6 compatibleWithTraitCollection:v4];

  return v7;
}

- (id)rulerDialLevelImage
{
  v2 = (void *)MEMORY[0x1E4FB1E20];
  if ([(PKRulerLayer *)self compactRuler]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  v4 = [v2 traitCollectionWithHorizontalSizeClass:v3];
  id v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v7 = [v5 imageNamed:@"ios_ruler_angle_level" inBundle:v6 compatibleWithTraitCollection:v4];

  return v7;
}

- (double)rulerWidth
{
  v2 = [(PKRulerLayer *)self _rulerImage];
  [v2 size];
  double v4 = v3;

  return v4;
}

- (double)rulerTickMarkInset
{
  return 4.5;
}

- (double)rulerAlignInset
{
  return 9.0;
}

- (void)setRulerAlpha:(double)a3
{
  self->_rulerAlpha = a3;
  -[PKRulerLayer updateRulerAlpha:](self, "updateRulerAlpha:");
}

- (void)updateRulerAlpha:(double)a3
{
  id v14 = [(PKRulerLayer *)self rulerLayer];
  [v14 opacity];
  double v6 = v5;

  if (v6 != a3)
  {
    float v7 = a3;
    id v15 = [(PKRulerLayer *)self rulerLayer];
    *(float *)&double v8 = v7;
    [v15 setOpacity:v8];

    v9 = [(PKRulerLayer *)self rulerController];
    if (v9)
    {
      int v10 = v9[18];

      if (!v10) {
        return;
      }
      id v16 = [(PKRulerLayer *)self rulerAngleMarker];
      *(float *)&double v11 = v7;
      [v16 setOpacity:v11];

      id v17 = [(PKRulerLayer *)self rulerAngleTick];
      *(float *)&double v12 = v7;
      [v17 setOpacity:v12];

      id v18 = [(PKRulerLayer *)self rulerAngleText];
      *(float *)&double v13 = v7;
      [v18 setOpacity:v13];
    }
    else
    {
      id v18 = 0;
    }
  }
}

- (CGAffineTransform)rulerTransform
{
  double v4 = [(PKRulerLayer *)self rulerLayer];
  id v6 = v4;
  if (v4)
  {
    [v4 affineTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setRulerTransform:(CGAffineTransform *)a3
{
  double v3 = [(PKRulerLayer *)self rulerLayer];
  [v3 setAffineTransform:&v4];
}

- (void)updateRulerTickMarkImage
{
  double v3 = [(PKRulerLayer *)self rulerLayer];

  if (v3)
  {
    long long v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    CGFloat v6 = v5;

    [(PKRulerLayer *)self rulerWidth];
    double v8 = v7;
    v41.width = 50.0;
    v41.height = v8;
    UIGraphicsBeginImageContextWithOptions(v41, 0, v6);
    CurrentContext = UIGraphicsGetCurrentContext();
    int v10 = [(PKRulerLayer *)self _rulerImage];
    [(PKRulerLayer *)self rulerWidth];
    objc_msgSend(v10, "drawInRect:", 0.0, 0.0, 50.0, v11);

    Mutable = CGPathCreateMutable();
    BOOL v13 = [(PKRulerLayer *)self compactRuler];
    unint64_t v14 = 0;
    if (v13) {
      double v15 = 10.0;
    }
    else {
      double v15 = 16.0;
    }
    if (v13) {
      double v16 = 6.0;
    }
    else {
      double v16 = 8.0;
    }
    if (v13) {
      double v17 = 3.0;
    }
    else {
      double v17 = 5.0;
    }
    double v36 = v6;
    double v18 = 0.5 / v6;
    do
    {
      unint64_t v19 = v14 - 5;
      if (v14 < 5) {
        unint64_t v19 = v14;
      }
      if (v19) {
        double v20 = v17;
      }
      else {
        double v20 = v16;
      }
      if (v14) {
        double v21 = v20;
      }
      else {
        double v21 = v15;
      }
      CGFloat v22 = v18 + floor((double)v14 * 5.0);
      CGPathMoveToPoint(Mutable, 0, v22, 4.5);
      CGFloat v23 = (double)(unint64_t)v21 + 4.5;
      CGPathAddLineToPoint(Mutable, 0, v22, v23);
      CGPathMoveToPoint(Mutable, 0, v22, v8 + -4.5);
      CGPathAddLineToPoint(Mutable, 0, v22, v8 - v23);
      ++v14;
    }
    while (v14 != 10);
    CGContextSetLineWidth(CurrentContext, 1.0 / v36);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetRGBStrokeColor(CurrentContext, 0.45, 0.45, 0.45, 1.0);
    CGContextStrokePath(CurrentContext);
    CGPathRelease(Mutable);
    v24 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
    id v25 = v24;
    uint64_t v26 = [v25 CGImage];
    v27 = [(PKRulerLayer *)self rulerLayer];
    [v27 setContents:v26];

    if ([(PKRulerLayer *)self zooming])
    {
      [(PKRulerLayer *)self rulerZoomStartCenterTValueOnScreen];
      double v29 = v28;
      [(PKRulerLayer *)self rulerZoomStartScale];
      double v31 = v30;
      [(PKRulerLayer *)self rulerZoomStartCenterTValueOnScreen];
      double v33 = v32;
      v34 = [(PKRulerLayer *)self rulerController];
      [(PKRulerLayer *)self rulerZoomStartTransform];
      CGAffineTransformTranslate(&v39, &v38, (v33 - v29 * 50.0 / floor(v31 * 50.0)) * 4000.0, 0.0);
      v35 = [(PKRulerLayer *)self rulerLayer];
      v37[0] = v40[0];
      v37[1] = v40[1];
      v37[2] = v40[2];
      [v35 setAffineTransform:v37];
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (id)addOpacityAnimationOnLayer:(id)a3 delegate:(id)a4 toOpacity:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  int v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v9 setTimingFunction:v10];

  double v11 = NSNumber;
  [v7 opacity];
  double v12 = objc_msgSend(v11, "numberWithFloat:");
  [v9 setFromValue:v12];

  BOOL v13 = [NSNumber numberWithDouble:a5];
  [v9 setToValue:v13];

  [v7 opacity];
  objc_msgSend(v9, "setDuration:", vabdd_f64(v14, a5) * 0.3);
  if (v8)
  {
    [v9 setValue:v7 forKey:@"ICLayer"];
    [v9 setDelegate:v8];
  }
  *(float *)&double v15 = a5;
  [v7 setOpacity:v15];
  [v7 addAnimation:v9 forKey:@"fade"];

  return v9;
}

- (id)addScaleAnimationOnLayer:(id)a3 delegate:(id)a4 fromScale:(double)a5 toScale:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  double v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v11 setTimingFunction:v12];

  BOOL v13 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v21, a5, a5, 1.0);
  float v14 = [v13 valueWithCATransform3D:&v21];
  [v11 setFromValue:v14];

  double v15 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v20, a6, a6, 1.0);
  double v16 = [v15 valueWithCATransform3D:&v20];
  [v11 setToValue:v16];

  [v11 setDuration:0.2];
  [v11 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v11 setRemovedOnCompletion:0];
  if (v10)
  {
    [v11 setValue:v9 forKey:@"ICLayer"];
    [v11 setDelegate:v10];
  }
  CATransform3DMakeScale(&v19, a6, a6, 1.0);
  CATransform3D v18 = v19;
  [v9 setTransform:&v18];
  [v9 addAnimation:v11 forKey:@"scale"];

  return v11;
}

- (void)addScaleAndOpacityAnimationOnLayer:(id)a3 delegate:(id)a4 fromScale:(double)a5 toScale:(double)a6 fromAlpha:(double)a7 toAlpha:(double)a8
{
  v56[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  if (a5 <= a6) {
    double v15 = a6;
  }
  else {
    double v15 = a5;
  }
  if (a5 <= a6) {
    double v16 = 0.133333333;
  }
  else {
    double v16 = 0.0666666667;
  }
  if (a5 <= a6) {
    double v17 = 0.0666666667;
  }
  else {
    double v17 = 0.133333333;
  }
  CATransform3D v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  uint64_t v19 = *MEMORY[0x1E4F3A490];
  CATransform3D v20 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v18 setTimingFunction:v20];

  CATransform3D v21 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v55, a5, a5, 1.0);
  CGFloat v22 = [v21 valueWithCATransform3D:&v55];
  [v18 setFromValue:v22];

  double v23 = v15 * 1.066;
  v24 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v54, v23, v23, 1.0);
  id v25 = [v24 valueWithCATransform3D:&v54];
  [v18 setToValue:v25];

  [v18 setDuration:v16];
  uint64_t v26 = *MEMORY[0x1E4F39FA8];
  [v18 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v18 setRemovedOnCompletion:0];
  if (v14)
  {
    [v18 setValue:v13 forKey:@"ICLayer"];
    [v18 setDelegate:v14];
  }
  v27 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  double v28 = [MEMORY[0x1E4F39C10] functionWithName:v19];
  [v27 setTimingFunction:v28];

  double v29 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v53, v23, v23, 1.0);
  double v30 = [v29 valueWithCATransform3D:&v53];
  [v27 setFromValue:v30];

  double v31 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v52, a6, a6, 1.0);
  double v32 = [v31 valueWithCATransform3D:&v52];
  [v27 setToValue:v32];

  [v27 setBeginTime:v16];
  [v27 setDuration:v17];
  [v27 setFillMode:v26];
  [v27 setRemovedOnCompletion:0];
  if (v14)
  {
    [v27 setValue:v13 forKey:@"ICLayer"];
    [v27 setDelegate:v14];
  }
  CATransform3DMakeScale(&v51, a6, a6, 1.0);
  CATransform3D v50 = v51;
  [v13 setTransform:&v50];
  double v33 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  v34 = [MEMORY[0x1E4F39C10] functionWithName:v19];
  [v33 setTimingFunction:v34];

  *(float *)&double v35 = a7;
  double v36 = [NSNumber numberWithFloat:v35];
  [v33 setFromValue:v36];

  if (a5 <= a6) {
    double v37 = a8;
  }
  else {
    double v37 = a7;
  }
  float v38 = v37;
  *(float *)&double v37 = v38;
  CGAffineTransform v39 = [NSNumber numberWithFloat:v37];
  [v33 setToValue:v39];

  [v33 setDuration:v16];
  [v33 setFillMode:v26];
  [v33 setRemovedOnCompletion:0];
  if (v14)
  {
    [v33 setValue:v13 forKey:@"ICLayer"];
    [v33 setDelegate:v14];
  }
  v40 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  CGSize v41 = [MEMORY[0x1E4F39C10] functionWithName:v19];
  [v40 setTimingFunction:v41];

  *(float *)&double v42 = v38;
  v43 = [NSNumber numberWithFloat:v42];
  [v40 setFromValue:v43];

  float v44 = a8;
  *(float *)&double v45 = v44;
  v46 = [NSNumber numberWithFloat:v45];
  [v40 setToValue:v46];

  [v40 setBeginTime:v16];
  [v40 setDuration:v17];
  [v40 setFillMode:v26];
  [v40 setRemovedOnCompletion:0];
  if (v14)
  {
    [v40 setValue:v13 forKey:@"ICLayer"];
    [v40 setDelegate:v14];
  }
  *(float *)&double v47 = v44;
  [v13 setOpacity:v47];
  v48 = [MEMORY[0x1E4F39B38] animation];
  v56[0] = v18;
  v56[1] = v27;
  v56[2] = v33;
  v56[3] = v40;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
  [v48 setAnimations:v49];

  [v48 setDuration:0.2];
  [v13 addAnimation:v48 forKey:@"scaleAndFade"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  long long v4 = [v6 valueForKey:@"ICLayer"];

  if (v4)
  {
    double v5 = [v6 valueForKey:@"ICLayer"];
    [v5 removeFromSuperlayer];
  }
}

- (void)showRuler
{
  double v3 = [(PKRulerLayer *)self rulerLayer];

  if (!v3)
  {
    [(PKRulerLayer *)self previousRulerTransform];
    double v4 = sqrt(v36 * v36 + v35 * v35);
    if (v4 > 0.01)
    {
      [(PKRulerLayer *)self previousRulerTransform];
    }
    else
    {
      double v3 = [(PKRulerLayer *)self rulerController];
      double v5 = [(PKRulerController *)v3 defaultRulerTransform];
    }
    id v6 = [(PKRulerLayer *)self rulerController];
    if (v6)
    {
      long long v7 = v37[1];
      v6[7] = v37[0];
      v6[8] = v7;
      v6[9] = v37[2];
    }

    if (v4 <= 0.01) {
    id v8 = [(PKRulerLayer *)self rulerController];
    }
    if (v8) {
      v8[18] = 0;
    }

    id v9 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [(PKRulerLayer *)self setRulerLayer:v9];

    [(PKRulerLayer *)self rulerWidth];
    double v11 = v10;
    double v12 = [(PKRulerLayer *)self rulerLayer];
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, 4000.0, v11);

    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v15 = [(PKRulerLayer *)self rulerLayer];
    objc_msgSend(v15, "setPosition:", v13, v14);

    double v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v16 scale];
    double v18 = v17;
    uint64_t v19 = [(PKRulerLayer *)self rulerLayer];
    [v19 setContentsScale:v18];

    [(PKRulerLayer *)self updateRulerTickMarkImage];
    uint64_t v20 = *MEMORY[0x1E4F39E30];
    CATransform3D v21 = [(PKRulerLayer *)self rulerLayer];
    [v21 setContentsScaling:v20];

    CGFloat v22 = [(PKRulerLayer *)self rulerController];
    double v23 = v22;
    if (v22)
    {
      long long v24 = v22[8];
      long long v32 = v22[7];
      long long v33 = v24;
      long long v34 = v22[9];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
    }
    id v25 = [(PKRulerLayer *)self rulerLayer];
    v31[0] = v32;
    v31[1] = v33;
    v31[2] = v34;
    [v25 setAffineTransform:v31];

    uint64_t v26 = [(PKRulerLayer *)self rulerLayer];
    [(PKRulerLayer *)self addSublayer:v26];

    v27 = [(PKRulerLayer *)self rulerLayer];
    [v27 setOpacity:0.0];

    [MEMORY[0x1E4F39CF8] begin];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __25__PKRulerLayer_showRuler__block_invoke;
    v30[3] = &unk_1E64C5368;
    v30[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v30];
    double v28 = [(PKRulerLayer *)self rulerLayer];
    id v29 = [(PKRulerLayer *)self addOpacityAnimationOnLayer:v28 delegate:0 toOpacity:1.0];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

uint64_t __25__PKRulerLayer_showRuler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRulerAlpha:1.0];
}

- (void)hideRulerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKRulerLayer *)self rulerLayer];

  if (v5)
  {
    if (v3)
    {
      [(PKRulerLayer *)self removeRulerMarkers];
      id v6 = [(PKRulerLayer *)self rulerAngleMarker];
      id v7 = [(PKRulerLayer *)self addOpacityAnimationOnLayer:v6 delegate:0 toOpacity:0.0];

      id v8 = [(PKRulerLayer *)self rulerLayer];
      id v9 = [(PKRulerLayer *)self addOpacityAnimationOnLayer:v8 delegate:self toOpacity:0.0];
    }
    else
    {
      double v10 = [(PKRulerLayer *)self rulerLayer];
      [v10 removeFromSuperlayer];

      id v8 = [(PKRulerLayer *)self rulerDistanceHUD];
      [v8 removeFromSuperlayer];
    }

    double v11 = [(PKRulerLayer *)self rulerLayer];
    double v12 = v11;
    if (v11)
    {
      [v11 affineTransform];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
    }
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    [(PKRulerLayer *)self setPreviousRulerTransform:v13];
  }
  [(PKRulerLayer *)self setRulerLayer:0];
  [(PKRulerLayer *)self setRulerAngleMarker:0];
}

- (BOOL)shouldUseLargestRulerTextFontSize
{
  return 0;
}

- (void)updateAngleWithAngleMarkerPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v90[1] = *MEMORY[0x1E4F143B8];
  if ([(PKRulerLayer *)self compactRuler]) {
    double v6 = 14.0;
  }
  else {
    double v6 = 18.0;
  }
  if ([(PKRulerLayer *)self shouldUseLargestRulerTextFontSize]) {
    double v6 = v6 + 10.0;
  }
  id v7 = [(PKRulerLayer *)self rulerAngleMarker];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [(PKRulerLayer *)self setRulerAngleMarker:v8];

    id v9 = [(PKRulerLayer *)self rulerDialImage];
    [v9 size];
    double v11 = v10;
    double v13 = v12;
    long long v14 = [(PKRulerLayer *)self rulerAngleMarker];
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v11, v13);

    id v15 = v9;
    uint64_t v16 = [v15 CGImage];
    double v17 = [(PKRulerLayer *)self rulerAngleMarker];
    [v17 setContents:v16];

    double v18 = [(PKRulerLayer *)self rulerAngleMarker];
    [v18 setOpacity:0.0];

    uint64_t v19 = [(PKRulerLayer *)self rulerAngleMarker];
    uint64_t v20 = [(PKRulerLayer *)self rulerLayer];
    [(PKRulerLayer *)self insertSublayer:v19 above:v20];

    id v21 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [(PKRulerLayer *)self setRulerAngleTick:v21];

    CGFloat v22 = [(PKRulerLayer *)self rulerDialLevelImage];
    [v22 size];
    double v24 = v23;
    double v26 = v25;
    v27 = [(PKRulerLayer *)self rulerAngleTick];
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v24, v26);

    [v15 size];
    double v29 = v28;
    [v15 size];
    double v31 = v30;
    long long v32 = [(PKRulerLayer *)self rulerAngleTick];
    objc_msgSend(v32, "setPosition:", v29 * 0.5, v31 * 0.5);

    id v33 = v22;
    uint64_t v34 = [v33 CGImage];
    double v35 = [(PKRulerLayer *)self rulerAngleTick];
    [v35 setContents:v34];

    double v36 = [(PKRulerLayer *)self rulerAngleTick];
    LODWORD(v37) = 1.0;
    [v36 setOpacity:v37];

    float v38 = [(PKRulerLayer *)self rulerAngleMarker];
    CGAffineTransform v39 = [(PKRulerLayer *)self rulerAngleTick];
    v40 = [(PKRulerLayer *)self rulerAngleMarker];
    [v38 insertSublayer:v39 above:v40];

    id v41 = objc_alloc_init(MEMORY[0x1E4F39CE8]);
    [(PKRulerLayer *)self setRulerAngleText:v41];

    double v42 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v42 scale];
    double v44 = v43;
    double v45 = [(PKRulerLayer *)self rulerAngleText];
    [v45 setContentsScale:v44];

    v46 = [(PKRulerLayer *)self rulerAngleText];
    objc_msgSend(v46, "setFrame:", 0.0, 0.0, 75.0, v6 + 4.0);

    [v15 size];
    double v48 = v47;
    [v15 size];
    double v50 = v49;
    CATransform3D v51 = [(PKRulerLayer *)self rulerAngleText];
    objc_msgSend(v51, "setPosition:", v48 * 0.5, v50 * 0.5);

    CATransform3D v52 = [(PKRulerLayer *)self rulerAngleText];
    [v52 setAlignmentMode:*MEMORY[0x1E4F39D38]];

    id v53 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v54 = [v53 CGColor];
    CATransform3D v55 = [(PKRulerLayer *)self rulerAngleText];
    [v55 setForegroundColor:v54];

    v56 = [(PKRulerLayer *)self rulerAngleMarker];
    v57 = [(PKRulerLayer *)self rulerAngleText];
    v58 = [(PKRulerLayer *)self rulerAngleTick];
    [v56 insertSublayer:v57 above:v58];
  }
  v59 = [(PKRulerLayer *)self rulerAngleMarker];
  [v59 opacity];
  float v61 = v60;
  v62 = [(PKRulerLayer *)self rulerLayer];
  [v62 opacity];
  float v64 = v63;

  if (v61 < v64)
  {
    v65 = [(PKRulerLayer *)self rulerAngleMarker];
    id v66 = [(PKRulerLayer *)self addOpacityAnimationOnLayer:v65 delegate:0 toOpacity:1.0];
  }
  v67 = [(PKRulerLayer *)self rulerAngleMarker];
  objc_msgSend(v67, "setPosition:", x, y);

  long long v87 = 0u;
  long long v88 = 0u;
  long long v86 = 0u;
  v68 = [(PKRulerLayer *)self rulerLayer];
  v69 = v68;
  if (v68)
  {
    [v68 affineTransform];
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v86 = 0u;
  }

  long long v88 = 0uLL;
  long long v83 = v86;
  long long v84 = v87;
  long long v85 = 0uLL;
  v70 = [(PKRulerLayer *)self rulerAngleTick];
  v82[0] = v83;
  v82[1] = v84;
  v82[2] = 0uLL;
  [v70 setAffineTransform:v82];

  int64_t v71 = [(PKRulerLayer *)self userAngle];
  id v72 = objc_alloc(MEMORY[0x1E4F28E48]);
  v73 = NSString;
  v74 = _PencilKitBundle();
  v75 = [v74 localizedStringForKey:@"°%d°" value:@"°%d°" table:@"Localizable"];
  v76 = objc_msgSend(v73, "localizedStringWithFormat:", v75, v71);
  uint64_t v89 = *MEMORY[0x1E4FB06F8];
  v77 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v6];
  v90[0] = v77;
  v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
  v79 = (void *)[v72 initWithString:v76 attributes:v78];

  v80 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v79, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v80, 0, 1);

  v81 = [(PKRulerLayer *)self rulerAngleText];
  [v81 setString:v79];
}

- (int64_t)currentAngle
{
  [(PKRulerLayer *)self rulerTransform];
  double v2 = DKDTransformAngle(&v6);
  double v3 = fmod(-v2, 360.0);
  if (v2 >= -360.0 && v2 <= 0.0) {
    double v3 = -v2;
  }
  if (v3 < 0.0) {
    double v3 = v3 + 360.0;
  }
  if (v3 == 0.0) {
    double v3 = 0.0;
  }
  return llround(v3);
}

- (int64_t)userAngle
{
  int64_t v2 = [(PKRulerLayer *)self currentAngle];
  if (v2 % 180 <= 90) {
    return v2 % 180;
  }
  else {
    return 180 - v2 % 180;
  }
}

- (void)hideRulerAngleMarker
{
  id v4 = [(PKRulerLayer *)self rulerAngleMarker];
  id v3 = -[PKRulerLayer addOpacityAnimationOnLayer:delegate:toOpacity:](self, "addOpacityAnimationOnLayer:delegate:toOpacity:", 0.0);
}

- (BOOL)viewPointInRuler:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PKRulerLayer *)self rulerLayer];

  if (!v6) {
    return 0;
  }
  id v7 = [(PKRulerLayer *)self rulerLayer];
  objc_msgSend(v7, "convertPoint:fromLayer:", self, x, y);
  double v9 = v8;

  [(PKRulerLayer *)self rulerWidth];
  if (v9 <= v10 * 0.15) {
    return 0;
  }
  [(PKRulerLayer *)self rulerWidth];
  return v9 < v11 * 0.85;
}

- (CGPoint)getRulerCenterLineOriginAndTangent:(CGPoint *)a3
{
  memset(&v22, 0, sizeof(v22));
  double v5 = [(PKRulerLayer *)self rulerLayer];
  double v6 = v5;
  if (v5) {
    [v5 affineTransform];
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }

  memset(&v21, 0, sizeof(v21));
  uint64_t v7 = [(PKRulerLayer *)self rulerController];
  double v8 = (void *)v7;
  if (v7 && (id WeakRetained = objc_loadWeakRetained((id *)(v7 + 40))) != 0)
  {
    double v10 = WeakRetained;
    [WeakRetained strokeTransform];
  }
  else
  {
    double v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformInvert(&v21, &v20);

  CGAffineTransform t1 = v22;
  CGAffineTransform v17 = v21;
  CGAffineTransformConcat(&v19, &t1, &v17);
  CGAffineTransform v22 = v19;
  long long v11 = *(_OWORD *)&v19.a;
  long long v12 = *(_OWORD *)&v19.tx;
  double v13 = v19.c * 0.0;
  double v14 = v19.d * 0.0;
  if (a3)
  {
    a3->double x = v19.tx + v13 + v19.a * 2000.0;
    a3->double y = *((double *)&v12 + 1) + v14 + *((double *)&v11 + 1) * 2000.0;
  }
  double v15 = *(double *)&v12 + v13 + *(double *)&v11 * -2000.0;
  double v16 = *((double *)&v12 + 1) + v14 + *((double *)&v11 + 1) * -2000.0;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (double)_fontSizeForRulerTextHUD:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v4 = objc_msgSend(&stru_1F1FB2C00, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v29, "length"), @"X", 0);
  [(PKRulerLayer *)self _distanceMarkerFontSize];
  double v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  uint64_t v32 = *MEMORY[0x1E4FB06F8];
  double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");
  v33[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  [(CATextLayer *)self->_rulerDistanceText frame];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v9, 0, 1.79769313e308, v10);
  double v12 = v11;
  [(CATextLayer *)self->_rulerDistanceText frame];
  double v14 = v13 - v12;
  if (v13 - v12 <= 3.0)
  {
    BOOL v16 = v14 > 3.5 && v14 < 3.0;
    double v15 = 8.0;
    double v17 = 8.0;
    if (v16 || v6 != 8.0)
    {
      CGAffineTransform v19 = v9;
      do
      {
        double v15 = (v6 + v17) * 0.5;
        uint64_t v30 = v7;
        CGAffineTransform v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v15];
        double v31 = v20;
        double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

        [(CATextLayer *)self->_rulerDistanceText frame];
        objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v9, 0, 1.79769313e308, v21);
        double v23 = v22;
        [(CATextLayer *)self->_rulerDistanceText frame];
        double v25 = v24 - v23;
        if (v24 - v23 < 3.0) {
          double v6 = (v6 + v17) * 0.5;
        }
        else {
          double v17 = (v6 + v17) * 0.5;
        }
        BOOL v27 = (v25 <= 3.5 || v25 >= 3.0) && v15 == v17;
        CGAffineTransform v19 = v9;
      }
      while (!v27);
    }
  }
  else
  {
    double v15 = v6;
  }

  return v15;
}

- (id)_textForRulerHUD:(double)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  p_rulerController = &self->_rulerController;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_rulerController);
  uint64_t v7 = WeakRetained;
  if (WeakRetained && (id v8 = objc_loadWeakRetained(WeakRetained + 6)) != 0)
  {
    double v9 = v8;
    double v10 = (id *)objc_loadWeakRetained((id *)p_rulerController);
    double v11 = v10;
    if (v10) {
      id v12 = objc_loadWeakRetained(v10 + 6);
    }
    else {
      id v12 = 0;
    }
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      double v14 = (id *)objc_loadWeakRetained((id *)p_rulerController);
      double v15 = v14;
      if (v14) {
        id v16 = objc_loadWeakRetained(v14 + 6);
      }
      else {
        id v16 = 0;
      }
      double v17 = [v16 rulerHostingStringFromPixels:a3];

      [(PKRulerLayer *)self _fontSizeForRulerTextHUD:v17];
      double v19 = v18;
      id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v21 = [NSString localizedStringWithFormat:@"%@", v17];
      uint64_t v31 = *MEMORY[0x1E4FB06F8];
      double v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v19];
      v32[0] = v22;
      double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      double v24 = (void *)[v20 initWithString:v21 attributes:v23];

      goto LABEL_11;
    }
  }
  else
  {
  }
  double v17 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", (uint64_t)a3);
  [(PKRulerLayer *)self _fontSizeForRulerTextHUD:v17];
  double v26 = v25;
  id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v29 = *MEMORY[0x1E4FB06F8];
  double v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v26];
  uint64_t v30 = v21;
  double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  double v24 = (void *)[v27 initWithString:v17 attributes:v22];
LABEL_11:

  return v24;
}

- (double)_distanceMarkerFontSize
{
  BOOL v2 = [(PKRulerLayer *)self compactRuler];
  double result = 18.0;
  if (v2) {
    return 14.0;
  }
  return result;
}

- (void)updateDistanceMarkerWithSpacing:(double)a3
{
  v85[1] = *MEMORY[0x1E4F143B8];
  if ([(PKRulerLayer *)self compactRuler]) {
    double v5 = 36.0;
  }
  else {
    double v5 = 49.0;
  }
  [(PKRulerLayer *)self _distanceMarkerFontSize];
  double v7 = v6;
  if ([(PKRulerLayer *)self compactRuler]) {
    double v8 = 9.0;
  }
  else {
    double v8 = 13.0;
  }
  BOOL v9 = [(PKRulerLayer *)self shouldUseLargestRulerTextFontSize];
  double v10 = v7 + 10.0;
  if (v9) {
    double v11 = v8 + 7.0;
  }
  else {
    double v11 = v8;
  }
  if (v9) {
    double v12 = v7 + 10.0;
  }
  else {
    double v12 = v7;
  }
  if (v9) {
    double v13 = v5 + 26.0;
  }
  else {
    double v13 = v5;
  }
  [(PKRulerLayer *)self maxTValueForSnappedDrawing];
  double v15 = v14;
  [(PKRulerLayer *)self minTValueForSnappedDrawing];
  double v17 = v16;
  double v18 = [(PKRulerLayer *)self rulerDistanceText];

  if (!v18)
  {
    [(PKRulerLayer *)self maxTValueForSnappedDrawing];
    double v20 = v19;
    [(PKRulerLayer *)self originTValueForSnappedDrawing];
    double v22 = vabdd_f64(v20, v21);
    [(PKRulerLayer *)self minTValueForSnappedDrawing];
    double v24 = v23;
    [(PKRulerLayer *)self originTValueForSnappedDrawing];
    [(PKRulerLayer *)self setIsRulerDrawingMovingToEndOfRuler:v22 > vabdd_f64(v24, v25)];
    id v26 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    [(PKRulerLayer *)self setRulerDistanceHUD:v26];

    id v27 = [(PKRulerLayer *)self rulerDistanceHUD];
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v13, v13);

    id v28 = [MEMORY[0x1E4FB1618] colorWithWhite:0.96 alpha:0.8];
    uint64_t v29 = [v28 CGColor];
    uint64_t v30 = [(PKRulerLayer *)self rulerDistanceHUD];
    [v30 setBackgroundColor:v29];

    uint64_t v31 = [(PKRulerLayer *)self rulerDistanceHUD];
    [v31 setCornerRadius:v13 * 0.5];

    uint64_t v32 = [(PKRulerLayer *)self rulerDistanceHUD];
    id v33 = [(PKRulerLayer *)self rulerLayer];
    [(PKRulerLayer *)self insertSublayer:v32 above:v33];

    id v34 = objc_alloc_init(MEMORY[0x1E4F39CE8]);
    [(PKRulerLayer *)self setRulerDistanceText:v34];

    id v35 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v36 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", 1234567890);
    uint64_t v84 = *MEMORY[0x1E4FB06F8];
    double v37 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v12];
    v85[0] = v37;
    float v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    CGAffineTransform v39 = (void *)[v35 initWithString:v36 attributes:v38];
    [v39 size];
    double v41 = v40;

    id v42 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v43 = [v42 CGColor];
    double v44 = [(PKRulerLayer *)self rulerDistanceText];
    [v44 setForegroundColor:v43];

    double v45 = [(PKRulerLayer *)self rulerDistanceText];
    [v45 setFontSize:v12];

    v46 = [(PKRulerLayer *)self rulerDistanceText];
    objc_msgSend(v46, "setFrame:", 0.0, v11, v13, v41);

    double v47 = [(PKRulerLayer *)self rulerDistanceText];
    [v47 setAlignmentMode:*MEMORY[0x1E4F39D38]];

    double v48 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v48 scale];
    double v50 = v49;
    CATransform3D v51 = [(PKRulerLayer *)self rulerDistanceText];
    [v51 setContentsScale:v50];

    CATransform3D v52 = [(PKRulerLayer *)self rulerDistanceHUD];
    id v53 = [(PKRulerLayer *)self rulerDistanceText];
    uint64_t v54 = [(PKRulerLayer *)self rulerDistanceHUD];
    [v52 insertSublayer:v53 above:v54];

    CATransform3D v55 = [(PKRulerLayer *)self rulerDistanceHUD];
    [(PKRulerLayer *)self addScaleAndOpacityAnimationOnLayer:v55 delegate:0 fromScale:0.25 toScale:1.0 fromAlpha:0.0 toAlpha:1.0];
  }
  [(PKRulerLayer *)self currentTValueForSnappedDrawing];
  double v57 = v56;
  v58 = [(PKRulerLayer *)self rulerLayer];
  v59 = v58;
  if (v58)
  {
    [v58 affineTransform];
    float64x2_t v79 = v81;
    float64x2_t v80 = v83;
    float64x2_t v60 = vmulq_f64(v82, (float64x2_t)0);
  }
  else
  {
    float64x2_t v60 = 0uLL;
    float64x2_t v80 = 0u;
    float64x2_t v79 = 0u;
  }
  float64x2_t v78 = v60;

  float v61 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v61 scale];
  double v77 = v62;
  float v63 = [(PKRulerLayer *)self rulerDistanceHUD];
  objc_msgSend(v63, "setPosition:", vmulq_n_f64(vrndaq_f64(vmulq_n_f64(vaddq_f64(v80, vmlaq_n_f64(v78, v79, v57 + -2000.0)), v77)), 1.0 / v77));

  double v64 = (v15 - v17) / (a3 * 0.5);
  v65 = [(PKRulerLayer *)self _textForRulerHUD:v64];
  id v66 = [(PKRulerLayer *)self rulerDistanceHUD];
  [v66 size];
  double v68 = v67;
  v69 = [(PKRulerLayer *)self rulerDistanceHUD];
  [v69 size];
  double v71 = v70;
  [v65 size];
  double v73 = v72;

  v74 = [(PKRulerLayer *)self rulerDistanceText];
  objc_msgSend(v74, "setFrame:", v68 * 0.5 - v13 * 0.5, v71 * 0.5 - v73 * 0.5, v13, v73);

  v75 = [(PKRulerLayer *)self _textForRulerHUD:v64];
  v76 = [(PKRulerLayer *)self rulerDistanceText];
  [v76 setString:v75];
}

- (void)updateRulerMarkerForLocation:(CGPoint)a3 firstTouch:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v8 = [(PKRulerLayer *)self rulerLayer];
  if (!v8) {
    return;
  }
  uint64_t v9 = [(PKRulerLayer *)self rulerController];
  double v10 = (void *)v9;
  if (v9) {
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 40));
  }
  else {
    id WeakRetained = 0;
  }
  if (![WeakRetained isDrawing])
  {

    if (!v4) {
      return;
    }
    goto LABEL_10;
  }
  uint64_t v12 = [(PKRulerLayer *)self rulerController];
  double v13 = (void *)v12;
  if (v12) {
    id v14 = objc_loadWeakRetained((id *)(v12 + 40));
  }
  else {
    id v14 = 0;
  }
  double v15 = [v14 drawingController];
  double v16 = -[PKController inputController](v15);
  char v17 = [v16 isSnappedToRuler] | v4;

  if (v17)
  {
LABEL_10:
    [(PKRulerLayer *)self getRulerCenterLineOriginAndTangent:&v27];
    *(double *)&v26[6] = v18;
    *(double *)&v26[7] = v19;
    double v20 = ((y - v19) * (v28 - v19) + (x - v18) * (v27 - v18))
        / ((v28 - v19) * (v28 - v19) + (v27 - v18) * (v27 - v18))
        * 4000.0;
    [(PKRulerLayer *)self setCurrentTValueForSnappedDrawing:v20];
    if (v4)
    {
      [(PKRulerLayer *)self setMinTValueForSnappedDrawing:v20];
      [(PKRulerLayer *)self setMaxTValueForSnappedDrawing:v20];
      [(PKRulerLayer *)self setOriginTValueForSnappedDrawing:v20];
    }
    else
    {
      [(PKRulerLayer *)self minTValueForSnappedDrawing];
      [(PKRulerLayer *)self setMinTValueForSnappedDrawing:fmin(v21, v20)];
      [(PKRulerLayer *)self maxTValueForSnappedDrawing];
      [(PKRulerLayer *)self setMaxTValueForSnappedDrawing:fmax(v22, v20)];
      double v23 = [(PKRulerLayer *)self rulerController];
      [(PKRulerController *)(uint64_t)v23 canvasTransform];
      double v24 = *(double *)v26;
      double v25 = *(double *)&v26[1];

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.0];
      [(PKRulerLayer *)self updateDistanceMarkerWithSpacing:sqrt(v25 * v25 + v24 * v24)];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (void)removeRulerMarkers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(PKRulerLayer *)self rulerLayer];
  BOOL v4 = [v3 sublayers];
  double v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) removeFromSuperlayer];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [(PKRulerLayer *)self rulerDistanceHUD];
  [(PKRulerLayer *)self addScaleAndOpacityAnimationOnLayer:v9 delegate:self fromScale:1.0 toScale:0.25 fromAlpha:1.0 toAlpha:0.0];

  [(PKRulerLayer *)self setRulerDistanceHUD:0];
  [(PKRulerLayer *)self setRulerDistanceText:0];
  double v10 = [(PKRulerLayer *)self rulerAngleMarker];
  [v10 removeFromSuperlayer];

  [(PKRulerLayer *)self setRulerAngleMarker:0];
  [(PKRulerLayer *)self setRulerDistanceText:0];
}

- (PKRulerController)rulerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerController);

  return (PKRulerController *)WeakRetained;
}

- (void)setRulerController:(id)a3
{
}

- (double)rulerAlpha
{
  return self->_rulerAlpha;
}

- (CALayer)rulerAngleMarker
{
  return self->_rulerAngleMarker;
}

- (void)setRulerAngleMarker:(id)a3
{
}

- (NSTimer)imageTransformTimer
{
  return self->_imageTransformTimer;
}

- (void)setImageTransformTimer:(id)a3
{
}

- (double)initialDrawingBoundsYOrigin
{
  return self->_initialDrawingBoundsYOrigin;
}

- (void)setInitialDrawingBoundsYOrigin:(double)a3
{
  self->_initialDrawingBoundsYOrigin = a3;
}

- (BOOL)isInlineResizing
{
  return self->_isInlineResizing;
}

- (void)setIsInlineResizing:(BOOL)a3
{
  self->_isInlineResizing = a3;
}

- (BOOL)isExpandedInline
{
  return self->_isExpandedInline;
}

- (void)setIsExpandedInline:(BOOL)a3
{
  self->_isExpandedInline = a3;
}

- (CALayer)rulerLayer
{
  return self->_rulerLayer;
}

- (void)setRulerLayer:(id)a3
{
}

- (CGAffineTransform)previousRulerTransform
{
  long long v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].b;
  return self;
}

- (void)setPreviousRulerTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_previousRulerTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_previousRulerTransform.c = v4;
  *(_OWORD *)&self->_previousRulerTransform.tdouble x = v3;
}

- (CALayer)rulerAngleTick
{
  return self->_rulerAngleTick;
}

- (void)setRulerAngleTick:(id)a3
{
}

- (CATextLayer)rulerAngleText
{
  return self->_rulerAngleText;
}

- (void)setRulerAngleText:(id)a3
{
}

- (CALayer)rulerDistanceHUD
{
  return self->_rulerDistanceHUD;
}

- (void)setRulerDistanceHUD:(id)a3
{
}

- (CATextLayer)rulerDistanceText
{
  return self->_rulerDistanceText;
}

- (void)setRulerDistanceText:(id)a3
{
}

- (BOOL)isRulerDrawingMovingToEndOfRuler
{
  return self->_isRulerDrawingMovingToEndOfRuler;
}

- (void)setIsRulerDrawingMovingToEndOfRuler:(BOOL)a3
{
  self->_isRulerDrawingMovingToEndOfRuler = a3;
}

- (double)currentTValueForSnappedDrawing
{
  return self->_currentTValueForSnappedDrawing;
}

- (void)setCurrentTValueForSnappedDrawing:(double)a3
{
  self->_currentTValueForSnappedDrawing = a3;
}

- (double)minTValueForSnappedDrawing
{
  return self->_minTValueForSnappedDrawing;
}

- (void)setMinTValueForSnappedDrawing:(double)a3
{
  self->_minTValueForSnappedDrawing = a3;
}

- (double)maxTValueForSnappedDrawing
{
  return self->_maxTValueForSnappedDrawing;
}

- (void)setMaxTValueForSnappedDrawing:(double)a3
{
  self->_maxTValueForSnappedDrawing = a3;
}

- (double)originTValueForSnappedDrawing
{
  return self->_originTValueForSnappedDrawing;
}

- (void)setOriginTValueForSnappedDrawing:(double)a3
{
  self->_originTValueForSnappedDrawing = a3;
}

- (double)rulerZoomStartCenterTValueOnScreen
{
  return self->_rulerZoomStartCenterTValueOnScreen;
}

- (void)setRulerZoomStartCenterTValueOnScreen:(double)a3
{
  self->_rulerZoomStartCenterTValueOnScreen = a3;
}

- (double)rulerZoomStartScale
{
  return self->_rulerZoomStartScale;
}

- (void)setRulerZoomStartScale:(double)a3
{
  self->_rulerZoomStartScale = a3;
}

- (CGAffineTransform)rulerZoomStartTransform
{
  long long v3 = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[5].b;
  return self;
}

- (void)setRulerZoomStartTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rulerZoomStartTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_rulerZoomStartTransform.c = v4;
  *(_OWORD *)&self->_rulerZoomStartTransform.tdouble x = v3;
}

- (BOOL)zooming
{
  return self->_zooming;
}

- (void)setZooming:(BOOL)a3
{
  self->_zooming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulerDistanceText, 0);
  objc_storeStrong((id *)&self->_rulerDistanceHUD, 0);
  objc_storeStrong((id *)&self->_rulerAngleText, 0);
  objc_storeStrong((id *)&self->_rulerAngleTick, 0);
  objc_storeStrong((id *)&self->_rulerLayer, 0);
  objc_storeStrong((id *)&self->_imageTransformTimer, 0);
  objc_storeStrong((id *)&self->_rulerAngleMarker, 0);

  objc_destroyWeak((id *)&self->_rulerController);
}

@end