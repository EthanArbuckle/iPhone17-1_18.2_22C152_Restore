@interface CKConfettiEffectView
+ (id)effectedZIndexes;
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

@implementation CKConfettiEffectView

- (void)startAnimation
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 URLForResource:@"Confetti" withExtension:@"ca"];

  v130 = (void *)v4;
  v5 = +[CAPackage packageWithContentsOfURL:v4 type:kCAPackageTypeCAMLBundle options:0 error:0];
  v6 = +[NSNumber numberWithInteger:[(CKConfettiEffectView *)self zIndex]];
  uint64_t v7 = [v6 stringValue];

  v128 = (void *)v7;
  v129 = v5;
  v8 = [v5 publishedObjectWithName:v7];
  v121 = self;
  [(CKConfettiEffectView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  CATransform3DMakeScale(&v141, 0.5, -0.5, 1.0);
  CATransform3D v140 = v141;
  [v8 setTransform:&v140];
  v13 = [(CKConfettiEffectView *)self layer];
  [v13 convertTime:0 fromLayer:CACurrentMediaTime()];
  objc_msgSend(v8, "setBeginTime:");

  [v8 setSeed:arc4random()];
  [v8 setBirthRate:0.0];
  v14 = +[CABasicAnimation animationWithKeyPath:@"birthRate"];
  objc_msgSend(v14, "setFrameInterval:");
  [v14 setFromValue:&off_4468];
  [v14 setToValue:&off_4468];
  [v14 setDuration:2.0];
  uint64_t v15 = kCAAnimationAbsolute;
  v127 = v14;
  [v14 setBeginTimeMode:kCAAnimationAbsolute];
  double v16 = v10 + v10;
  double v17 = v12 + v12;
  double v18 = (v10 + v10) * 0.5;
  objc_msgSend(v8, "setPosition:", v18, v17 * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v16, v17);
  LODWORD(v19) = 1117782016;
  v20 = +[NSNumber numberWithFloat:v19];
  [v8 setValue:v20 forKeyPath:@"emitterSize.width"];

  LODWORD(v21) = 1117782016;
  v22 = +[NSNumber numberWithFloat:v21];
  [v8 setValue:v22 forKeyPath:@"emitterSize.height"];

  float v23 = v18;
  *(float *)&double v24 = v23;
  v25 = +[NSNumber numberWithFloat:v24];
  [v8 setValue:v25 forKeyPath:@"emitterPosition.x"];

  double v116 = v17 + (v16 + -750.0) / 1500.0 * 400.0 + 200.0;
  *(float *)&double v26 = v116;
  double v27 = v16;
  v28 = +[NSNumber numberWithFloat:v26];
  [v8 setValue:v28 forKeyPath:@"emitterPosition.y"];

  [v8 setTimeOffset:-1.0];
  v29 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  [v29 setFrameInterval:0.0166666667];
  double v30 = (v16 * v17 + -1000500.0) / 6117724.0;
  v31 = +[NSNumber numberWithDouble:v30 * 0.0 + 1100.0];
  [v29 setFromValue:v31];

  [v29 setToValue:&off_4480];
  [v29 setDuration:1.0];
  v126 = v29;
  [v29 setBeginTimeMode:v15];
  v32 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell2.birthRate"];
  [v32 setFrameInterval:0.0166666667];
  v33 = +[NSNumber numberWithDouble:v30 * 200.0 + 1300.0];
  [v32 setFromValue:v33];

  [v32 setToValue:&off_4480];
  [v32 setDuration:1.0];
  v125 = v32;
  [v32 setBeginTimeMode:v15];
  v34 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterBehaviors.attractor.stiffness"];
  [v34 setFrameInterval:0.0166666667];
  double v35 = (v16 + -750.0) / 1298.0;
  double v36 = v35 * 400.0 + 400.0;
  *(float *)&double v36 = v36;
  v37 = +[NSNumber numberWithFloat:v36];
  v38 = +[NSNumber numberWithFloat:0.0];
  uint64_t v39 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v37, v38, 0);

  v40 = +[NSNumber numberWithFloat:0.0];
  double v41 = v35 * 0.2 + 0.4;
  *(float *)&double v41 = v41;
  v42 = +[NSNumber numberWithFloat:v41];
  uint64_t v43 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v40, v42, 0);

  v44 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v45 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  uint64_t v46 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v44, v45, 0);

  v124 = (void *)v39;
  [v34 setValues:v39];
  v123 = (void *)v43;
  [v34 setKeyTimes:v43];
  v122 = (void *)v46;
  [v34 setTimingFunctions:v46];
  [v34 setDuration:3.0];
  v132 = v34;
  [v34 setBeginTimeMode:v15];
  v47 = +[CAKeyframeAnimation animation];
  [v47 setFrameInterval:0.0166666667];
  v48 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v49) = 2.0;
  v50 = +[NSNumber numberWithFloat:v49];
  LODWORD(v51) = 2.0;
  v52 = +[NSNumber numberWithFloat:v51];
  uint64_t v53 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v48, v50, v52, 0);

  LODWORD(v54) = 1025758986;
  v55 = +[NSNumber numberWithFloat:v54];
  LODWORD(v56) = 1031127695;
  v57 = +[NSNumber numberWithFloat:v56];
  LODWORD(v58) = 1.0;
  v59 = +[NSNumber numberWithFloat:v58];
  uint64_t v60 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v55, v57, v59, 0);

  v61 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v62 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v63 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  uint64_t v64 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v61, v62, v63, 0);

  v120 = (void *)v53;
  [v47 setValues:v53];
  v119 = (void *)v60;
  [v47 setKeyTimes:v60];
  v118 = (void *)v64;
  [v47 setTimingFunctions:v64];
  [v47 setDuration:6.0];
  v131 = v47;
  [v47 setBeginTimeMode:v15];
  v65 = +[CAKeyframeAnimation animation];
  [v65 setFrameInterval:0.0166666667];
  v66 = +[NSNumber numberWithFloat:0.0];
  double v67 = (v17 + -1334.0) / 714.0;
  double v68 = v67 * -1200.0 + -2400.0;
  *(float *)&double v68 = v68;
  v69 = +[NSNumber numberWithFloat:v68];
  double v70 = v67 * -1800.0 + -4000.0;
  *(float *)&double v70 = v70;
  v71 = +[NSNumber numberWithFloat:v70];
  uint64_t v72 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v66, v69, v71, 0);

  LODWORD(v73) = 1028443341;
  v74 = +[NSNumber numberWithFloat:v73];
  LODWORD(v75) = 0.5;
  v76 = +[NSNumber numberWithFloat:v75];
  LODWORD(v77) = 1.0;
  v78 = +[NSNumber numberWithFloat:v77];
  v79 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v74, v76, v78, 0);

  v80 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v81 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v82 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v83 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v80, v81, v82, 0);

  v117 = (void *)v72;
  [v65 setValues:v72];
  [v65 setKeyTimes:v79];
  [v65 setTimingFunctions:v83];
  [v65 setDuration:6.0];
  [v65 setBeginTimeMode:v15];
  v84 = [(CKConfettiEffectView *)v121 zIndex];
  if (v84 == (unsigned char *)&dword_0 + 3)
  {
    v93 = +[NSNumber numberWithFloat:0.0];
    [v8 setValue:v93 forKeyPath:@"cullRect.origin.x"];

    float v94 = v17;
    *(float *)&double v95 = -v94;
    v96 = +[NSNumber numberWithFloat:v95];
    [v8 setValue:v96 forKeyPath:@"cullRect.origin.y"];

    v87 = v125;
    v86 = v126;
    goto LABEL_5;
  }
  v87 = v125;
  v86 = v126;
  if (!v84)
  {
    LODWORD(v85) = -1022623744;
    v88 = +[NSNumber numberWithFloat:v85];
    [v8 setValue:v88 forKeyPath:@"cullRect.origin.x"];

    float v89 = v17;
    *(float *)&double v90 = -v89;
    v91 = +[NSNumber numberWithFloat:v90];
    [v8 setValue:v91 forKeyPath:@"cullRect.origin.y"];

    HIDWORD(v92) = 1081180160;
    double v27 = v27 + 280.0;
LABEL_5:
    *(float *)&double v92 = v27;
    v97 = +[NSNumber numberWithFloat:v92];
    [v8 setValue:v97 forKeyPath:@"cullRect.size.width"];

    double v98 = v17 + v17 * 2.0;
    *(float *)&double v98 = v98;
    v99 = +[NSNumber numberWithFloat:v98];
    [v8 setValue:v99 forKeyPath:@"cullRect.size.height"];

    v100 = +[NSNumber numberWithFloat:0.0];
    [v8 setValue:v100 forKeyPath:@"emitterCells.cell1.birthRate"];

    [v8 addAnimation:v86 forKey:0];
    v101 = +[NSNumber numberWithFloat:0.0];
    [v8 setValue:v101 forKeyPath:@"emitterCells.cell2.birthRate"];

    [v8 addAnimation:v87 forKey:0];
    [v8 addAnimation:v132 forKey:0];
    [v8 addAnimation:v131 forKey:@"emitterBehaviors.drag.drag"];
    [v8 addAnimation:v65 forKey:@"emitterCells.cell1.yAcceleration"];
    [v8 addAnimation:v65 forKey:@"emitterCells.cell2.yAcceleration"];
    *(float *)&double v102 = v23;
    v103 = +[NSNumber numberWithFloat:v102];
    [v8 setValue:v103 forKeyPath:@"emitterBehaviors.attractor.position.x"];

    double v104 = v116 + -18.0;
    *(float *)&double v104 = v116 + -18.0;
    v105 = +[NSNumber numberWithFloat:v104];
    [v8 setValue:v105 forKeyPath:@"emitterBehaviors.attractor.position.y"];
  }
  v106 = [(CKConfettiEffectView *)v121 layer];
  long long v107 = *(_OWORD *)&CATransform3DIdentity.m23;
  v135[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v135[3] = v107;
  v135[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  CGFloat m33 = CATransform3DIdentity.m33;
  long long v108 = *(_OWORD *)&CATransform3DIdentity.m13;
  v135[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v135[1] = v108;
  double v137 = v35 * -0.000003 + -0.000097;
  long long v109 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v138 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v139 = v109;
  [v106 setSublayerTransform:v135];

  [v8 position];
  double v111 = v110 * 0.5;
  [v8 position];
  objc_msgSend(v8, "setPosition:", v111, v112 * 0.5);
  [v8 addAnimation:v127 forKey:@"fall"];
  v113 = [(CKConfettiEffectView *)v121 layer];
  [v113 addSublayer:v8];

  objc_storeStrong((id *)&v121->_confettiLayer, v8);
  dispatch_time_t v114 = dispatch_time(0, 6000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B78;
  block[3] = &unk_4160;
  id v134 = v8;
  id v115 = v8;
  dispatch_after(v114, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopAnimation
{
  [(CALayer *)self->_confettiLayer removeFromSuperlayer];
  confettiLayer = self->_confettiLayer;
  self->_confettiLayer = 0;
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

  objc_storeStrong((id *)&self->_confettiLayer, 0);
}

@end