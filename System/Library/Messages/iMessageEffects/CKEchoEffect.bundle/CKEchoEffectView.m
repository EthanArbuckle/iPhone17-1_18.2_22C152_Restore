@interface CKEchoEffectView
+ (id)effectedZIndexes;
- (BOOL)hasRotated;
- (CGPoint)_flippedFocusPoint;
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (NSURL)effectFileURL;
- (UIImage)messageImage;
- (char)messageOrientation;
- (id)flipImage:(id)a3;
- (id)rotateImage:(id)a3 clockwise:(BOOL)a4;
- (int64_t)zIndex;
- (void)setEffectFileURL:(id)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setHasRotated:(BOOL)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKEchoEffectView

- (void)startAnimation
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 URLForResource:@"Echo" withExtension:@"ca"];

  v5 = +[CAPackage packageWithContentsOfURL:v4 type:kCAPackageTypeCAMLBundle options:0 error:0];
  v6 = +[NSNumber numberWithInteger:[(CKEchoEffectView *)self zIndex]];
  v7 = [v6 stringValue];

  v8 = [v5 publishedObjectWithName:v7];
  [(CKEchoEffectView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  v13 = [v8 sublayers];
  v146 = [v13 objectAtIndexedSubscript:0];

  v14 = [(CKEchoEffectView *)self layer];
  [v14 convertTime:0 fromLayer:CACurrentMediaTime()];
  objc_msgSend(v8, "setBeginTime:");

  double v15 = v12 * 0.5;
  objc_msgSend(v8, "setPosition:", v10 * 0.5, v12 * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v10, v12);
  [v8 setGeometryFlipped:1];
  if ((char *)[(CKEchoEffectView *)self zIndex] != (char *)&dword_0 + 3) {
    goto LABEL_25;
  }
  v139 = v8;
  v140 = v7;
  v141 = v5;
  v142 = v4;
  v16 = [(CKEchoEffectView *)self layer];
  v17 = [v16 superlayer];
  [v17 setMasksToBounds:1];

  [v146 setGeometryFlipped:1];
  [v146 setSeed:arc4random()];
  long long v144 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v157 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v143 = v157;
  long long v158 = v144;
  long long v159 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v137 = v159;
  CGFloat m33 = CATransform3DIdentity.m33;
  double v18 = m33;
  long long v135 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v155 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v131 = v155;
  long long v156 = v135;
  long long v133 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v162 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v129 = v162;
  long long v163 = v133;
  v19 = +[CAKeyframeAnimation animationWithKeyPath:@"sublayerTransform"];
  unint64_t v161 = 0xBF2149BCF1C810D7;
  v20 = +[NSValue valueWithCATransform3D:&v155];
  long long v157 = v143;
  long long v158 = v144;
  long long v159 = v137;
  long long v155 = v131;
  long long v156 = v135;
  CGFloat m33 = v18;
  unint64_t v161 = 0xBF736177296D337ELL;
  long long v162 = v129;
  long long v163 = v133;
  v21 = +[NSValue valueWithCATransform3D:&v155];
  uint64_t v22 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v21, 0);

  v23 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:");
  uint64_t v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, 0);

  v136 = (void *)v22;
  [v19 setValues:v22];
  v134 = (void *)v24;
  [v19 setTimingFunctions:v24];
  [v19 setDuration:4.5];
  uint64_t v145 = kCAAnimationAbsolute;
  objc_msgSend(v19, "setBeginTimeMode:");
  v25 = [v146 superlayer];
  v138 = v19;
  [v25 addAnimation:v19 forKey:@"sublayerTransform"];

  v26 = +[NSNumber numberWithDouble:v10];
  [v146 setValue:v26 forKeyPath:@"emitterSize.width"];

  v27 = +[NSNumber numberWithDouble:v12 * 0.5];
  [v146 setValue:v27 forKeyPath:@"emitterSize.height"];

  v28 = +[NSNumber numberWithDouble:v10 * 0.5];
  [v146 setValue:v28 forKeyPath:@"emitterPosition.x"];

  v29 = +[NSNumber numberWithDouble:v12 * 0.5];
  [v146 setValue:v29 forKeyPath:@"emitterPosition.y"];

  [v146 setValue:&off_8468 forKeyPath:@"emitterZPosition"];
  v30 = +[NSNumber numberWithDouble:v10 + v10];
  [v146 setValue:v30 forKeyPath:@"emitterDepth"];

  double v31 = v10 * v12;
  v32 = +[NSNumber numberWithDouble:v10 * v12 * 0.0008];
  [v146 setValue:v32 forKeyPath:@"emitterCells.cell1.birthRate"];

  objc_msgSend(v146, "setPosition:", v10 * 0.5, v12 * 0.5);
  objc_msgSend(v146, "setBounds:", 0.0, 0.0, v10, v12);
  v33 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterSize.height"];
  float v34 = v15;
  *(float *)&double v35 = v34;
  v36 = +[NSNumber numberWithFloat:v35];
  double v37 = v12 / 1.14;
  *(float *)&double v37 = v12 / 1.14;
  v38 = +[NSNumber numberWithFloat:v37];
  *(float *)&double v39 = v15;
  v40 = +[NSNumber numberWithFloat:v39];
  uint64_t v41 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v36, v38, v40, 0);

  v42 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v43) = 1053609165;
  v44 = +[NSNumber numberWithFloat:v43];
  LODWORD(v45) = 1.0;
  v46 = +[NSNumber numberWithFloat:v45];
  uint64_t v47 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v42, v44, v46, 0);

  v48 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v49 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v50 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  uint64_t v51 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v48, v49, v50, 0);

  v130 = (void *)v41;
  [v33 setValues:v41];
  v128 = (void *)v47;
  [v33 setKeyTimes:v47];
  v127 = (void *)v51;
  [v33 setTimingFunctions:v51];
  [v33 setDuration:3.0];
  [v33 setBeginTimeMode:v145];
  v52 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:");
  [v33 setTimingFunction:v52];

  v132 = v33;
  [v146 addAnimation:v33 forKey:@"emitterSize.height"];
  v53 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterPosition.y"];
  double v54 = v12 + v12 * -0.25;
  float v55 = v54;
  *(float *)&double v54 = v55;
  v56 = +[NSNumber numberWithFloat:v54];
  double v57 = v12 - v15 / 1.14;
  *(float *)&double v57 = v57;
  v58 = +[NSNumber numberWithFloat:v57];
  *(float *)&double v59 = v55;
  v60 = +[NSNumber numberWithFloat:v59];
  v61 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v56, v58, v60, 0);

  v62 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v63) = 1053609165;
  v64 = +[NSNumber numberWithFloat:v63];
  LODWORD(v65) = 1.0;
  v66 = +[NSNumber numberWithFloat:v65];
  uint64_t v67 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v62, v64, v66, 0);

  v68 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v69 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v70 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  uint64_t v71 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v68, v69, v70, 0);

  [v53 setValues:v61];
  v125 = (void *)v67;
  [v53 setKeyTimes:v67];
  v124 = (void *)v71;
  [v53 setTimingFunctions:v71];
  [v53 setDuration:3.0];
  [v53 setBeginTimeMode:v145];
  v72 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  [v53 setTimingFunction:v72];

  v126 = v53;
  [v146 addAnimation:v53 forKey:@"emitterPosition.y"];
  v73 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  [v73 setFrameInterval:0.0166666667];
  CATransform3DMakeRotation(&v154, 1.57079633, 0.0, 1.0, 0.0);
  v74 = +[NSValue valueWithCATransform3D:&v154];
  CATransform3DMakeRotation(&v153, -1.57079633, 0.0, 1.0, 0.0);
  v75 = +[NSValue valueWithCATransform3D:&v153];
  v76 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v74, v75, 0);
  [v73 setValues:v76];

  v77 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v78) = 1.0;
  v79 = +[NSNumber numberWithFloat:v78];
  v80 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v77, v79, 0);
  [v73 setKeyTimes:v80];

  v81 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v82 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v81, 0);
  [v73 setTimingFunctions:v82];

  [v73 setDuration:4.5];
  [v73 setBeginTimeMode:v145];
  v123 = v73;
  [v146 addAnimation:v73 forKey:@"transform"];
  v83 = [(CKEchoEffectView *)self messageImage];
  if (!self->_hasRotated)
  {
    v84 = [(CKEchoEffectView *)self window];
    v85 = [v84 windowScene];
    v86 = [v85 screen];
    v87 = [v86 displayConfiguration];

    [v87 nativeOrientation];
    uint64_t v88 = FBSDisplayRotationFromRadians();
    v89 = [(CKEchoEffectView *)self window];
    v90 = [v89 windowScene];
    v91 = (int *)[v90 interfaceOrientation];

    if (v88 == 3)
    {
      if (v91 != &dword_4)
      {
        if (v91 != (int *)((char *)&dword_0 + 2))
        {
          if (v91 != (int *)((char *)&dword_0 + 1)) {
            goto LABEL_16;
          }
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    else
    {
      if (v91 == &dword_4)
      {
LABEL_13:
        v92 = [(CKEchoEffectView *)self messageImage];
        v94 = self;
        v95 = v92;
        uint64_t v96 = 0;
        goto LABEL_14;
      }
      if (v91 == (int *)((char *)&dword_0 + 3))
      {
LABEL_12:
        v92 = [(CKEchoEffectView *)self messageImage];
        v94 = self;
        v95 = v92;
        uint64_t v96 = 1;
LABEL_14:
        uint64_t v93 = [(CKEchoEffectView *)v94 rotateImage:v95 clockwise:v96];
        goto LABEL_15;
      }
      if (v91 != (int *)((char *)&dword_0 + 2))
      {
LABEL_16:
        self->_hasRotated = 1;

        goto LABEL_17;
      }
    }
    v92 = [(CKEchoEffectView *)self messageImage];
    uint64_t v93 = [(CKEchoEffectView *)self flipImage:v92];
LABEL_15:
    v97 = (void *)v93;

    v83 = v97;
    goto LABEL_16;
  }
LABEL_17:
  [(CKEchoEffectView *)self setMessageImage:v83];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  v98 = [v146 emitterCells];
  id v99 = [v98 countByEnumeratingWithState:&v149 objects:v164 count:16];
  if (v99)
  {
    id v100 = v99;
    uint64_t v101 = *(void *)v150;
    do
    {
      for (i = 0; i != v100; i = (char *)i + 1)
      {
        if (*(void *)v150 != v101) {
          objc_enumerationMutation(v98);
        }
        v103 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        id v104 = [(CKEchoEffectView *)self messageImage];
        objc_msgSend(v103, "setContents:", objc_msgSend(v104, "CGImage"));
      }
      id v100 = [v98 countByEnumeratingWithState:&v149 objects:v164 count:16];
    }
    while (v100);
  }

  [v146 setValue:&off_8480 forKeyPath:@"emitterCells.cell1.velocity"];
  [v146 setValue:&off_8498 forKeyPath:@"emitterCells.cell1.yAcceleration"];
  v105 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  double v106 = v31 * 0.00039999999;
  *(float *)&double v106 = v31 * 0.00039999999;
  v107 = +[NSNumber numberWithFloat:v106];
  v108 = +[NSNumber numberWithFloat:0.0];
  v122 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v107, v108, 0);

  LODWORD(v109) = 1065185444;
  v110 = +[NSNumber numberWithFloat:v109];
  LODWORD(v111) = 1.0;
  v112 = +[NSNumber numberWithFloat:v111];
  v113 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v110, v112, 0);

  v114 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v115 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v116 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v114, v115, 0);

  [v105 setValues:v122];
  [v105 setKeyTimes:v113];
  [v105 setTimingFunctions:v116];
  [v105 setDuration:1.70000005];
  [v105 setBeginTimeMode:v145];
  v117 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  [v105 setTimingFunction:v117];

  v118 = +[NSNumber numberWithFloat:0.0];
  [v146 setValue:v118 forKeyPath:@"emitterCells.cell1.birthRate"];

  [v146 addAnimation:v105 forKey:0];
  [v146 setValue:&off_84B0 forKeyPath:@"emitterCells.cell1.contentsScale"];

  v5 = v141;
  v4 = v142;
  v8 = v139;
  v7 = v140;
LABEL_25:
  v119 = [(CKEchoEffectView *)self layer];
  [v119 addSublayer:v8];

  objc_storeStrong((id *)&self->_lasersLayer, v8);
  dispatch_time_t v120 = dispatch_time(0, 4500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_62B8;
  block[3] = &unk_81E0;
  id v148 = v8;
  id v121 = v8;
  dispatch_after(v120, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)rotateImage:(id)a3 clockwise:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  double height = CGSizeZero.height;
  if (CGSizeZero.width == v6 && height == v9)
  {
    id v20 = v5;
  }
  else
  {
    objc_msgSend(v5, "scale", CGSizeZero.width, height);
    *(float *)&double v12 = v12;
    double v13 = *(float *)&v12;
    double v14 = v9 * v13;
    double v15 = v7 * v13;
    v23.width = v14;
    v23.double height = v15;
    UIGraphicsBeginImageContext(v23);
    id v16 = v5;
    id v17 = [v16 CGImage];
    [v16 scale];
    if (v4) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 2;
    }
    v19 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v17, v18);
    objc_msgSend(v19, "drawInRect:", 0.0, 0.0, v14, v15);

    UIGraphicsGetImageFromCurrentImageContext();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v20;
}

- (id)flipImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  double height = CGSizeZero.height;
  if (CGSizeZero.width == v4 && height == v7)
  {
    id v17 = v3;
  }
  else
  {
    objc_msgSend(v3, "scale", CGSizeZero.width, height);
    *(float *)&double v10 = v10;
    double v11 = *(float *)&v10;
    CGFloat v12 = v7 * v11;
    CGFloat v13 = v5 * v11;
    v20.width = v13;
    v20.double height = v12;
    UIGraphicsBeginImageContext(v20);
    id v14 = v3;
    id v15 = [v14 CGImage];
    [v14 scale];
    id v16 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v15, 1);
    objc_msgSend(v16, "drawInRect:", 0.0, 0.0, v13, v12);

    UIGraphicsGetImageFromCurrentImageContext();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v17;
}

- (CGPoint)_flippedFocusPoint
{
  [(CKEchoEffectView *)self focusPoint];
  double v4 = v3;
  double v6 = v5;
  [(CKEchoEffectView *)self bounds];
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
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
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
  return +[NSIndexSet indexSetWithIndex:3];
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
  double x = self->_messageRect.origin.x;
  double y = self->_messageRect.origin.y;
  double width = self->_messageRect.size.width;
  double height = self->_messageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMessageRect:(CGRect)a3
{
  self->_messageRect = a3;
}

- (char)messageOrientation
{
  return self->_messageOrientation;
}

- (void)setMessageOrientation:(char)a3
{
  self->_messageOrientation = a3;
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

- (BOOL)hasRotated
{
  return self->_hasRotated;
}

- (void)setHasRotated:(BOOL)a3
{
  self->_hasRotated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->effectFileURL, 0);
  objc_storeStrong((id *)&self->messageImage, 0);

  objc_storeStrong((id *)&self->_lasersLayer, 0);
}

@end