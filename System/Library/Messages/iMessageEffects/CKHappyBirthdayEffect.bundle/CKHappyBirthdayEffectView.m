@interface CKHappyBirthdayEffectView
+ (id)effectedZIndexes;
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (NSURL)effectFileURL;
- (UIImage)messageImage;
- (char)messageOrientation;
- (int64_t)zIndex;
- (void)animateBalloonLayer:(id)a3 withIndex:(unint64_t)a4;
- (void)setEffectFileURL:(id)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKHappyBirthdayEffectView

- (void)animateBalloonLayer:(id)a3 withIndex:(unint64_t)a4
{
  id v6 = a3;
  if (a4 >= 6) {
    unint64_t v7 = 6;
  }
  else {
    unint64_t v7 = a4;
  }
  CGFloat sx = dbl_70A8[v7];
  CGFloat v87 = dbl_70E0[v7];
  v8 = (double *)((char *)&unk_72A0 + 16 * v7);
  double v10 = *v8;
  double v9 = v8[1];
  v11 = (double *)((char *)&unk_7310 + 16 * v7);
  double v12 = *v11;
  double v13 = v11[1];
  [(CKHappyBirthdayEffectView *)self bounds];
  double v15 = v14;
  [(CKHappyBirthdayEffectView *)self bounds];
  double v17 = v16;
  [(CKHappyBirthdayEffectView *)self bounds];
  double v19 = v18;
  [(CKHappyBirthdayEffectView *)self bounds];
  double v21 = v20;
  double v80 = dbl_7268[v7];
  v22 = (double *)((char *)&unk_7118 + 16 * v7);
  double v85 = v22[1];
  double v86 = *v22;
  v23 = (double *)((char *)&unk_7188 + 16 * v7);
  double v89 = *v23;
  double v24 = v23[1];
  v25 = (double *)((char *)&unk_71F8 + 16 * v7);
  double v82 = *v25;
  double v83 = v24;
  double v81 = v25[1];
  [v6 bounds];
  double v27 = -0.5;
  if (a4 > 5) {
    double v27 = 0.5;
  }
  double ty = v26 * v27;
  double v28 = v13 * v21;
  double v29 = v12 * v19;
  double v30 = v9 * v17;
  CGFloat angle = fmax(fmin((atan2(v28 - v30, v29 - v10 * v15) + 1.57079633) * 0.3, 0.15), -0.15);
  objc_msgSend(v6, "setPosition:", CGPointZero.x, CGPointZero.y);
  [v6 setHidden:1];
  v92 = +[CABasicAnimation animationWithKeyPath:@"hidden"];
  [v92 setFrameInterval:0.0166666667];
  [v92 setFromValue:&__kCFBooleanFalse];
  [v92 setToValue:&__kCFBooleanFalse];
  [v92 setDuration:v80];
  v31 = +[CABasicAnimation animationWithKeyPath:@"position"];
  [v31 setFrameInterval:0.0166666667];
  v32 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v10 * v15, v30);
  [v31 setFromValue:v32];

  v33 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v29, v28);
  [v31 setToValue:v33];

  [v31 setDuration:v80];
  HIDWORD(v34) = HIDWORD(v89);
  *(float *)&double v34 = v89;
  HIDWORD(v36) = HIDWORD(v82);
  HIDWORD(v35) = HIDWORD(v83);
  *(float *)&double v35 = v83;
  *(float *)&double v36 = v82;
  HIDWORD(v37) = HIDWORD(v81);
  *(float *)&double v37 = v81;
  v38 = +[CAMediaTimingFunction functionWithControlPoints:v34 :v35 :v36 :v37];
  [v31 setTimingFunction:v38];

  v90 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [v90 setFrameInterval:0.0166666667];
  CATransform3DMakeTranslation(&v104, 0.0, ty, 1.0);
  v39 = +[NSValue valueWithCATransform3D:&v104];
  [v90 setFromValue:v39];

  v40 = [v90 fromValue];
  [v90 setToValue:v40];

  [v90 setDuration:v80];
  [v90 setAdditive:1];
  v41 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [v41 setFrameInterval:0.0166666667];
  CATransform3DMakeScale(&v103, sx, sx, 1.0);
  v42 = +[NSValue valueWithCATransform3D:&v103];
  [v41 setFromValue:v42];

  CATransform3DMakeScale(&v102, v87, v87, 1.0);
  v43 = +[NSValue valueWithCATransform3D:&v102];
  [v41 setToValue:v43];

  [v41 setDuration:v80];
  [v41 setAdditive:1];
  HIDWORD(v45) = HIDWORD(v85);
  HIDWORD(v44) = HIDWORD(v86);
  *(float *)&double v44 = v86;
  *(float *)&double v45 = v85;
  LODWORD(v46) = 1.0;
  LODWORD(v47) = 1.0;
  v48 = +[CAMediaTimingFunction functionWithControlPoints:v44 :v45 :v46 :v47];
  [v41 setTimingFunction:v48];

  v49 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [v49 setFrameInterval:0.0166666667];
  CATransform3DMakeScale(&v101, 0.996, 1.004, 1.0);
  v50 = +[NSValue valueWithCATransform3D:&v101];
  [v49 setFromValue:v50];

  CATransform3DMakeScale(&v100, 1.004, 0.996, 1.0);
  v51 = +[NSValue valueWithCATransform3D:&v100];
  [v49 setToValue:v51];

  [v49 setDuration:0.3];
  double v52 = drand48();
  [v49 duration];
  [v49 setTimeOffset:v52 * v53];
  [v49 setAdditive:1];
  [v49 setAutoreverses:1];
  LODWORD(v54) = 2139095040;
  [v49 setRepeatCount:v54];
  v55 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v49 setTimingFunction:v55];

  double v56 = drand48();
  double v57 = drand48();
  v58 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [v58 setFrameInterval:0.0166666667];
  CATransform3DMakeRotation(&v99, v56 * -0.17, 0.0, 0.0, 1.0);
  v59 = +[NSValue valueWithCATransform3D:&v99];
  [v58 setFromValue:v59];

  CATransform3DMakeRotation(&v98, v57 * 0.17, 0.0, 0.0, 1.0);
  v60 = +[NSValue valueWithCATransform3D:&v98];
  [v58 setToValue:v60];

  [v58 setDuration:2.0];
  double v61 = drand48();
  [v58 duration];
  [v58 setTimeOffset:v61 * v62];
  [v58 setAutoreverses:1];
  LODWORD(v63) = 2139095040;
  [v58 setRepeatCount:v63];
  [v58 setAdditive:1];
  v64 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v58 setTimingFunction:v64];

  v65 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [v65 setFrameInterval:0.0166666667];
  CATransform3DMakeRotation(&v97, angle, 0.0, 0.0, 1.0);
  v66 = +[NSValue valueWithCATransform3D:&v97];
  [v65 setFromValue:v66];

  v67 = [v65 fromValue];
  [v65 setToValue:v67];

  [v65 setDuration:v80];
  [v65 setAdditive:1];
  v68 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  [v68 setFrameInterval:0.0166666667];
  double v69 = drand48();
  CATransform3DMakeTranslation(&v96, v69 * -50.0 + 5.0, 0.0, 0.0);
  v70 = +[NSValue valueWithCATransform3D:&v96];
  [v68 setFromValue:v70];

  double v71 = drand48();
  CATransform3DMakeTranslation(&v95, v71 * 10.0 + 5.0, 0.0, 0.0);
  v72 = +[NSValue valueWithCATransform3D:&v95];
  [v68 setToValue:v72];

  [v68 setDuration:3.0];
  double v73 = drand48();
  [v68 duration];
  [v68 setTimeOffset:v73 * v74];
  [v68 setAdditive:1];
  [v68 setAutoreverses:1];
  LODWORD(v75) = 2139095040;
  [v68 setRepeatCount:v75];
  v76 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v68 setTimingFunction:v76];

  [v6 addAnimation:v31 forKey:@"position"];
  [v6 addAnimation:v92 forKey:@"unhide"];
  [v6 addAnimation:v90 forKey:@"toAttachment"];
  [v6 addAnimation:v49 forKey:@"wobble"];
  [v6 addAnimation:v58 forKey:@"rotation"];
  [v6 addAnimation:v65 forKey:@"direction"];
  [v6 addAnimation:v41 forKey:@"size"];
  [v6 addAnimation:v68 forKey:@"sideWiggle"];
  CATransform3DMakeRotation(&v94, -(v56 * -0.17), 0.0, 0.0, 1.0);
  v77 = +[NSValue valueWithCATransform3D:&v94];
  [v58 setFromValue:v77];

  CATransform3DMakeRotation(&v93, -(v57 * 0.17), 0.0, 0.0, 1.0);
  v78 = +[NSValue valueWithCATransform3D:&v93];
  [v58 setToValue:v78];

  v79 = [v6 stringLayer];
  [v79 addAnimation:v58 forKey:@"rotation"];
}

- (void)startAnimation
{
  if ((char *)[(CKHappyBirthdayEffectView *)self zIndex] == (char *)&dword_0 + 3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  if (!self->_balloons)
  {
    v4 = +[NSMutableArray arrayWithCapacity:2];
    balloons = self->_balloons;
    self->_balloons = v4;

    int v6 = v3;
    do
    {
      unint64_t v7 = objc_opt_new();
      v8 = [(CKHappyBirthdayEffectView *)self layer];
      [v8 addSublayer:v7];

      [(NSMutableArray *)self->_balloons addObject:v7];
      --v6;
    }
    while (v6);
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    double v10 = [(NSMutableArray *)self->_balloons objectAtIndexedSubscript:i];
    [(CKHappyBirthdayEffectView *)self animateBalloonLayer:v10 withIndex:i + 2 * self->_zIndex];
  }
}

- (void)stopAnimation
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_balloons;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      unint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "removeFromSuperlayer", (void)v9);
        unint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  balloons = self->_balloons;
  self->_balloons = 0;
}

+ (id)effectedZIndexes
{
  return +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, 3);
}

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->_zIndex = a3;
}

- (CGPoint)focusPoint
{
  double x = self->focusPoint.x;
  double y = self->focusPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFocusPoint:(CGPoint)a3
{
  self->focusPoint = a3;
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

  objc_storeStrong((id *)&self->_balloons, 0);
}

@end