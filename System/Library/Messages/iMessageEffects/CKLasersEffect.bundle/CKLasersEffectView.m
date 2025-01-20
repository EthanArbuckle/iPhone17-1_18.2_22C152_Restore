@interface CKLasersEffectView
+ (id)effectedZIndexes;
- (CGPoint)_flippedFocusPoint;
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (NSURL)effectFileURL;
- (UIImage)messageImage;
- (char)messageOrientation;
- (int64_t)zIndex;
- (void)setEffectFileURL:(id)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKLasersEffectView

- (void)startAnimation
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v37 = [v3 URLForResource:@"Lasers" withExtension:@"ca"];

  v36 = +[CAPackage packageWithContentsOfURL:v37 type:kCAPackageTypeCAMLBundle options:0 error:0];
  v35 = [&off_4320 stringValue];
  v4 = [v36 publishedObjectWithName:v35];
  [v4 setAllowsGroupOpacity:0];
  [v4 setAllowsGroupBlending:0];
  v5 = [v4 sublayers];
  v6 = [v5 objectAtIndexedSubscript:0];
  haloLayer = self->_haloLayer;
  self->_haloLayer = v6;

  v8 = [v4 sublayers];
  v34 = [v8 objectAtIndexedSubscript:1];

  v9 = [v4 sublayers];
  v10 = [v9 objectAtIndexedSubscript:1];
  v11 = [v10 sublayers];
  v12 = [v11 objectAtIndexedSubscript:0];
  replicatorLayer = self->_replicatorLayer;
  self->_replicatorLayer = v12;

  v14 = [v4 sublayers];
  v15 = [v14 objectAtIndexedSubscript:2];
  spotlightLayer = self->_spotlightLayer;
  self->_spotlightLayer = v15;

  v17 = [v4 sublayers];
  v18 = [v17 objectAtIndexedSubscript:1];
  v19 = [v18 sublayers];
  v20 = [v19 objectAtIndexedSubscript:0];
  v21 = [v20 sublayers];
  v22 = [v21 objectAtIndexedSubscript:0];

  [(CKLasersEffectView *)self bounds];
  double v24 = v23;
  double v26 = v25;
  v27 = [(CKLasersEffectView *)self layer];
  [v27 convertTime:0 fromLayer:CACurrentMediaTime()];
  objc_msgSend(v4, "setBeginTime:");

  objc_msgSend(v4, "setPosition:", v24 * 0.5, v26 * 0.5);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v24, v26);
  [v4 setGeometryFlipped:1];
  objc_msgSend(v34, "setBounds:", 0.0, 0.0, v24, v26);
  objc_msgSend(v34, "setPosition:", v24 * 0.5, v26 * 0.5);
  -[CALayer setBounds:](self->_haloLayer, "setBounds:", 0.0, 0.0, v26 * 1.16, v26 * 1.16);
  [(CKLasersEffectView *)self _flippedFocusPoint];
  -[CALayer setPosition:](self->_haloLayer, "setPosition:");
  -[CALayer setBounds:](self->_replicatorLayer, "setBounds:", 0.0, 0.0, v24, v26);
  [(CKLasersEffectView *)self _flippedFocusPoint];
  -[CALayer setPosition:](self->_replicatorLayer, "setPosition:");
  objc_msgSend(v22, "setPosition:", v24 * 0.5, v26 * 0.5);
  [(CKLasersEffectView *)self _flippedFocusPoint];
  -[CALayer setPosition:](self->_spotlightLayer, "setPosition:");
  -[CALayer setBounds:](self->_spotlightLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  v28 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v28 setFrameInterval:0.0166666667];
  [v28 setFromValue:&off_4348];
  [v28 setToValue:&off_4358];
  [v28 setDuration:0.0120000001];
  [v28 setBeginTimeMode:kCAAnimationAbsolute];
  LODWORD(v29) = 2139095040;
  [v28 setRepeatCount:v29];
  v30 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  [v28 setTimingFunction:v30];

  [v34 addAnimation:v28 forKey:0];
  v31 = [(CKLasersEffectView *)self layer];
  [v31 addSublayer:v4];

  objc_storeStrong((id *)&self->_lasersLayer, v4);
  dispatch_time_t v32 = dispatch_time(0, 5700000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2924;
  block[3] = &unk_41A0;
  id v39 = v4;
  id v33 = v4;
  dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (CGPoint)_flippedFocusPoint
{
  [(CKLasersEffectView *)self focusPoint];
  double v4 = v3;
  double v6 = v5;
  [(CKLasersEffectView *)self bounds];
  double v8 = v7 - v6;
  double v9 = v4;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)setFocusPoint:(CGPoint)a3
{
  if (self->_focusPoint.x != a3.x || self->_focusPoint.y != a3.y)
  {
    self->_focusPoint = a3;
    [(CKLasersEffectView *)self _flippedFocusPoint];
    double v6 = v5;
    double v8 = v7;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    -[CALayer setPosition:](self->_haloLayer, "setPosition:", v6, v8);
    -[CALayer setPosition:](self->_spotlightLayer, "setPosition:", v6, v8);
    -[CALayer setPosition:](self->_replicatorLayer, "setPosition:", v6, v8);
    +[CATransaction commit];
  }
}

- (void)stopAnimation
{
  [(CALayer *)self->_lasersLayer removeFromSuperlayer];
  lasersLayer = self->_lasersLayer;
  self->_lasersLayer = 0;
}

+ (id)effectedZIndexes
{
  return +[NSIndexSet indexSetWithIndex:0];
}

- (int64_t)zIndex
{
  return self->zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->zIndex = a3;
}

- (CGPoint)focusPoint
{
  double x = self->_focusPoint.x;
  double y = self->_focusPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)messageRect
{
  double x = self->messageRect.origin.x;
  double y = self->messageRect.origin.y;
  double width = self->messageRect.size.width;
  double height = self->messageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMessageRect:(CGRect)a3
{
  self->messageRect = a3;
}

- (char)messageOrientation
{
  return self->messageOrientation;
}

- (void)setMessageOrientation:(char)a3
{
  self->messageOrientation = a3;
}

- (UIImage)messageImage
{
  return self->messageImage;
}

- (void)setMessageImage:(id)a3
{
}

- (NSURL)effectFileURL
{
  return self->effectFileURL;
}

- (void)setEffectFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->effectFileURL, 0);
  objc_storeStrong((id *)&self->messageImage, 0);
  objc_storeStrong((id *)&self->_spotlightLayer, 0);
  objc_storeStrong((id *)&self->_replicatorLayer, 0);
  objc_storeStrong((id *)&self->_haloLayer, 0);

  objc_storeStrong((id *)&self->_lasersLayer, 0);
}

@end