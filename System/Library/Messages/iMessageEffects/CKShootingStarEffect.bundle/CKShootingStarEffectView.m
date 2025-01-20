@interface CKShootingStarEffectView
+ (id)effectedZIndexes;
- (CAEmitterBehavior)lensBurst;
- (CAEmitterLayer)lensEmitter;
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (NSURL)effectFileURL;
- (UIImage)messageImage;
- (char)messageOrientation;
- (int64_t)zIndex;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setEffectFileURL:(id)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setLensBurst:(id)a3;
- (void)setLensEmitter:(id)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKShootingStarEffectView

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v10 = a3;
  v5 = [v10 valueForKey:@"startLensFlareBehavior"];
  if ([v5 isEqualToString:@"start"])
  {
    v6 = [(CKShootingStarEffectView *)self lensBurst];
    [v6 setEnabled:1];

    v7 = [(CKShootingStarEffectView *)self lensEmitter];
    [v7 reloadValueForKeyPath:@"emitterCells"];
  }
  else
  {
    v7 = [v10 valueForKey:@"stopLensFlareBehavior"];
    if ([v7 isEqualToString:@"stop"])
    {
      v8 = [(CKShootingStarEffectView *)self lensBurst];
      [v8 setEnabled:0];

      v9 = [(CKShootingStarEffectView *)self lensEmitter];
      [v9 reloadValueForKeyPath:@"emitterCells"];
    }
  }
}

- (void)startAnimation
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v182 = [v3 URLForResource:@"ShootingStar" withExtension:@"ca"];

  v181 = +[CAPackage packageWithContentsOfURL:v182 type:kCAPackageTypeCAMLBundle options:0 error:0];
  v180 = [&off_85E8 stringValue];
  v4 = [v181 publishedObjectWithName:v180];
  v5 = [v4 sublayers];
  v6 = [v5 objectAtIndexedSubscript:0];

  v7 = [v4 sublayers];
  v8 = [v7 objectAtIndexedSubscript:1];

  v9 = [v4 sublayers];
  id v10 = [v9 objectAtIndexedSubscript:2];

  [v8 setUpdateInterval:0.0166666667];
  [v10 setUpdateInterval:0.0166666667];
  v11 = [v4 sublayers];
  v12 = [v11 objectAtIndexedSubscript:3];
  [(CKShootingStarEffectView *)self setLensEmitter:v12];

  v13 = [(CKShootingStarEffectView *)self lensEmitter];
  v14 = [v13 emitterBehaviors];
  v15 = [v14 objectAtIndexedSubscript:0];
  [(CKShootingStarEffectView *)self setLensBurst:v15];

  [v10 setValue:kCAEmitterCellPoint forKeyPath:@"emitterCells.cell1.particleType"];
  [(CKShootingStarEffectView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  v192 = self;
  v20 = [(CKShootingStarEffectView *)self layer];
  [v20 convertTime:0 fromLayer:CACurrentMediaTime()];
  objc_msgSend(v4, "setBeginTime:");

  objc_msgSend(v4, "setPosition:", v17 * 0.5, v19 * 0.5);
  v179 = v4;
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v17, v19);
  v190 = v6;
  objc_msgSend(v6, "setPosition:", v17 * 0.5, v19 * 0.5);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v17, v19);
  [v4 setGeometryFlipped:1];
  v189 = v10;
  [v10 setTimeOffset:-0.600000024];
  v21 = [(CKShootingStarEffectView *)self lensEmitter];
  [v21 setTimeOffset:-0.600000024];

  v22 = +[NSNumber numberWithDouble:v17 + 100.0];
  [v8 setValue:v22 forKeyPath:@"emitterSize.width"];

  v23 = +[NSNumber numberWithDouble:v19 + 100.0];
  [v8 setValue:v23 forKeyPath:@"emitterSize.height"];

  v24 = +[NSNumber numberWithDouble:v17 * 0.5];
  [v8 setValue:v24 forKeyPath:@"emitterPosition.x"];

  v25 = +[NSNumber numberWithDouble:v19 * 0.5];
  [v8 setValue:v25 forKeyPath:@"emitterPosition.y"];

  [v8 setValue:&off_8600 forKeyPath:@"emitterZPosition"];
  [v8 setValue:&off_8618 forKeyPath:@"emitterDepth"];
  v26 = +[NSNumber numberWithDouble:v17 * v19 * 0.0008];
  [v8 setValue:v26 forKeyPath:@"emitterCells.cell1.birthRate"];

  objc_msgSend(v8, "setPosition:", v17 * 0.5, v19 * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v17, v19);
  [v8 setZPosition:-10000.0];
  v178 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
  [v178 setFrameInterval:0.0166666667];
  [v178 setFromValue:&off_8640];
  [v178 setToValue:&off_8650];
  [v178 setDuration:5.0];
  uint64_t v27 = kCAAnimationAbsolute;
  [v178 setBeginTimeMode:kCAAnimationAbsolute];
  v175 = v8;
  [v8 addAnimation:v178 forKey:@"transform.rotation.x"];
  v177 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
  [v177 setFrameInterval:0.0166666667];
  [v177 setFromValue:&off_8660];
  [v177 setToValue:&off_8640];
  [v177 setDuration:5.0];
  [v177 setBeginTimeMode:v27];
  [v8 addAnimation:v177 forKey:@"transform.rotation.z"];
  v28 = +[UIBezierPath bezierPath];
  objc_msgSend(v28, "moveToPoint:", -20.0, v19 * 0.5 - v19 / 10.0);
  objc_msgSend(v28, "addCurveToPoint:controlPoint1:controlPoint2:", v17 + v17 / -6.0, v19 - v19 / 3.0, -20.0, v19 - v19 * 0.5, v17 * 0.5, v19 - v19 / 10.0);
  v29 = +[CAKeyframeAnimation animation];
  [v29 setFrameInterval:0.0166666667];
  [v29 setKeyPath:@"emitterPosition"];
  id v187 = v28;
  objc_msgSend(v29, "setPath:", objc_msgSend(v187, "CGPath"));
  [v29 setDuration:3.0];
  v176 = v29;
  [v29 setBeginTimeMode:v27];
  v30 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  [v29 setTimingFunction:v30];

  [v10 addAnimation:v29 forKey:@"trailAnimation"];
  v31 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  LODWORD(v32) = 1169915904;
  v33 = +[NSNumber numberWithFloat:v32];
  v34 = +[NSNumber numberWithFloat:0.0];
  v174 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v33, v34, 0);

  LODWORD(v35) = 1061997773;
  v36 = +[NSNumber numberWithFloat:v35];
  LODWORD(v37) = 1.0;
  v38 = +[NSNumber numberWithFloat:v37];
  v173 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v36, v38, 0);

  v39 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v40 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v172 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v39, v40, 0);

  [v31 setFrameInterval:0.0166666667];
  [v31 setValues:v174];
  [v31 setKeyTimes:v173];
  [v31 setTimingFunctions:v172];
  [v31 setDuration:2.70000005];
  [v31 setBeginTimeMode:v27];
  v41 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v171 = v31;
  [v31 setTimingFunction:v41];

  v42 = +[NSNumber numberWithFloat:0.0];
  [v10 setValue:v42 forKeyPath:@"emitterCells.cell1.birthRate"];

  [v10 addAnimation:v31 forKey:0];
  v43 = +[CABasicAnimation animation];
  [v43 setFrameInterval:0.0166666667];
  [v43 setFromValue:&off_8640];
  [v43 setToValue:&off_8670];
  [v43 setDuration:2.0999999];
  v170 = v43;
  [v43 setBeginTimeMode:v27];
  v44 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  [v43 setTimingFunction:v44];

  [v43 setDelegate:self];
  [v43 setValue:@"start" forKey:@"startLensFlareBehavior"];
  v45 = [(CKShootingStarEffectView *)self lensEmitter];
  [v45 addAnimation:v43 forKey:0];

  v46 = +[CABasicAnimation animation];
  [v46 setFrameInterval:0.0166666667];
  [v46 setFromValue:&off_8640];
  [v46 setToValue:&off_8670];
  [v46 setDuration:2.4000001];
  v169 = v46;
  uint64_t v47 = v27;
  [v46 setBeginTimeMode:v27];
  v48 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  [v46 setTimingFunction:v48];

  [v46 setDelegate:self];
  [v46 setValue:@"stop" forKey:@"stopLensFlareBehavior"];
  v49 = [(CKShootingStarEffectView *)self lensEmitter];
  [v49 addAnimation:v46 forKey:0];

  v50 = +[CAKeyframeAnimation animation];
  [v50 setFrameInterval:0.0166666667];
  [v50 setKeyPath:@"position"];
  id v168 = v187;
  objc_msgSend(v50, "setPath:", objc_msgSend(v168, "CGPath"));
  [v50 setDuration:3.0];
  uint64_t v191 = v47;
  [v50 setBeginTimeMode:v47];
  v51 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v167 = v50;
  [v50 setTimingFunction:v51];

  v52 = [(CKShootingStarEffectView *)self lensEmitter];
  [v52 addAnimation:v50 forKey:@"position"];

  v53 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  LODWORD(v54) = 1125187584;
  v55 = +[NSNumber numberWithFloat:v54];
  v56 = +[NSNumber numberWithFloat:0.0];
  v166 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v55, v56, 0);

  LODWORD(v57) = 1065336439;
  v58 = +[NSNumber numberWithFloat:v57];
  LODWORD(v59) = 1.0;
  v60 = +[NSNumber numberWithFloat:v59];
  v165 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v58, v60, 0);

  v61 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v62 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v164 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v61, v62, 0);

  [v53 setFrameInterval:0.0166666667];
  [v53 setValues:v166];
  [v53 setKeyTimes:v165];
  [v53 setTimingFunctions:v164];
  [v53 setDuration:2.0999999];
  v163 = v53;
  [v53 setBeginTimeMode:v47];
  v63 = [(CKShootingStarEffectView *)self lensEmitter];
  v64 = +[NSNumber numberWithFloat:0.0];
  [v63 setValue:v64 forKeyPath:@"emitterCells.cell1.birthRate"];

  v65 = [(CKShootingStarEffectView *)self lensEmitter];
  [v65 addAnimation:v53 forKey:0];

  v184 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
  v183 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
  LODWORD(v66) = 1041865114;
  v67 = +[NSNumber numberWithFloat:v66];
  LODWORD(v68) = 1045220557;
  v69 = +[NSNumber numberWithFloat:v68];
  LODWORD(v70) = 0.5;
  v71 = +[NSNumber numberWithFloat:v70];
  LODWORD(v72) = 1051595899;
  v73 = +[NSNumber numberWithFloat:v72];
  LODWORD(v74) = 1045220557;
  v75 = +[NSNumber numberWithFloat:v74];
  LODWORD(v76) = 1050253722;
  v77 = +[NSNumber numberWithFloat:v76];
  LODWORD(v78) = 0.25;
  v79 = +[NSNumber numberWithFloat:v78];
  LODWORD(v80) = 1047233823;
  v81 = +[NSNumber numberWithFloat:v80];
  LODWORD(v82) = 1041865114;
  v83 = +[NSNumber numberWithFloat:v82];
  v84 = +[NSNumber numberWithFloat:0.0];
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v67, v69, v71, v73, v75, v77, v79, v81, v83, v84, 0);
  id v188 = (id)objc_claimAutoreleasedReturnValue();

  v161 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v85) = 1031127695;
  v158 = +[NSNumber numberWithFloat:v85];
  LODWORD(v86) = 1039516303;
  v87 = +[NSNumber numberWithFloat:v86];
  LODWORD(v88) = 1051595899;
  v89 = +[NSNumber numberWithFloat:v88];
  LODWORD(v90) = 1054951342;
  v91 = +[NSNumber numberWithFloat:v90];
  LODWORD(v92) = 1057803469;
  v93 = +[NSNumber numberWithFloat:v92];
  LODWORD(v94) = 1060655596;
  v95 = +[NSNumber numberWithFloat:v94];
  LODWORD(v96) = 1063004406;
  v97 = +[NSNumber numberWithFloat:v96];
  LODWORD(v98) = 1063675494;
  v99 = +[NSNumber numberWithFloat:v98];
  LODWORD(v100) = 1064346583;
  v101 = +[NSNumber numberWithFloat:v100];
  LODWORD(v102) = 1.0;
  v103 = +[NSNumber numberWithFloat:v102];
  v186 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v161, v158, v87, v89, v91, v93, v95, v97, v99, v101, v103, 0);

  v159 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v104 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v105 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v106 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v107 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v108 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v109 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v110 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v111 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v112 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  v185 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v159, v104, v105, v106, v107, v108, v109, v110, v111, v112, 0);

  [v184 setFrameInterval:0.0166666667];
  [v184 setValues:v188];
  [v184 setKeyTimes:v186];
  [v184 setTimingFunctions:v185];
  [v184 setDuration:3.0];
  [v184 setBeginTimeMode:v191];
  [v183 setFrameInterval:0.0166666667];
  [v183 setValues:v188];
  [v183 setKeyTimes:v186];
  [v183 setTimingFunctions:v185];
  [v183 setDuration:3.0];
  [v183 setBeginTimeMode:v191];
  v113 = [(CKShootingStarEffectView *)v192 lensEmitter];
  [v113 addAnimation:v184 forKey:@"transform.scale.x"];

  v114 = [(CKShootingStarEffectView *)v192 lensEmitter];
  [v114 addAnimation:v183 forKey:@"transform.scale.y"];

  v115 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
  v116 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v117) = 1058642330;
  v118 = +[NSNumber numberWithFloat:v117];
  LODWORD(v119) = 1058642330;
  v120 = +[NSNumber numberWithFloat:v119];
  v121 = +[NSNumber numberWithFloat:0.0];
  v162 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v116, v118, v120, v121, 0);

  v122 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v123) = 1050253722;
  v124 = +[NSNumber numberWithFloat:v123];
  LODWORD(v125) = 1061997773;
  v126 = +[NSNumber numberWithFloat:v125];
  LODWORD(v127) = 1.0;
  v128 = +[NSNumber numberWithFloat:v127];
  v160 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v122, v124, v126, v128, 0);

  v129 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v130 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v157 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v129, v130, 0);

  [v115 setFrameInterval:0.0166666667];
  [v115 setValues:v162];
  [v115 setKeyTimes:v160];
  [v115 setTimingFunctions:v157];
  [v115 setDuration:4.5999999];
  [v115 setBeginTimeMode:v191];
  [v190 addAnimation:v115 forKey:@"opacity"];
  v131 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
  v132 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v133) = 1.0;
  v134 = +[NSNumber numberWithFloat:v133];
  LODWORD(v135) = 1.0;
  v136 = +[NSNumber numberWithFloat:v135];
  v137 = +[NSNumber numberWithFloat:0.0];
  v138 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v132, v134, v136, v137, 0);

  v139 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v140) = 1050253722;
  v141 = +[NSNumber numberWithFloat:v140];
  LODWORD(v142) = 1061997773;
  v143 = +[NSNumber numberWithFloat:v142];
  LODWORD(v144) = 1.0;
  v145 = +[NSNumber numberWithFloat:v144];
  v146 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v139, v141, v143, v145, 0);

  v147 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v148 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v149 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v147, v148, 0);

  [v131 setFrameInterval:0.0166666667];
  [v131 setValues:v138];
  [v131 setKeyTimes:v146];
  [v131 setTimingFunctions:v149];
  [v131 setDuration:4.5999999];
  [v131 setBeginTimeMode:v191];
  [v175 addAnimation:v131 forKey:@"opacity"];
  long long v150 = *(_OWORD *)&CATransform3DIdentity.m23;
  v195[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v195[3] = v150;
  v195[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  CGFloat m33 = CATransform3DIdentity.m33;
  long long v151 = *(_OWORD *)&CATransform3DIdentity.m13;
  v195[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v195[1] = v151;
  long long v152 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v198 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v199 = v152;
  v153 = [(CKShootingStarEffectView *)v192 layer];
  double v197 = (v17 * v19 + -1000500.0) / 6117724.0 * 0.000298844721 + -0.000839537354;
  [v153 setSublayerTransform:v195];

  v154 = [(CKShootingStarEffectView *)v192 layer];
  [v154 addSublayer:v179];

  objc_storeStrong((id *)&v192->_shootingStarLayer, v179);
  dispatch_time_t v155 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6138;
  block[3] = &unk_81D8;
  id v194 = v179;
  id v156 = v179;
  dispatch_after(v155, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopAnimation
{
  [(CALayer *)self->_shootingStarLayer removeFromSuperlayer];
  shootingStarLayer = self->_shootingStarLayer;
  self->_shootingStarLayer = 0;
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

- (CAEmitterBehavior)lensBurst
{
  return self->_lensBurst;
}

- (void)setLensBurst:(id)a3
{
}

- (CAEmitterLayer)lensEmitter
{
  return self->_lensEmitter;
}

- (void)setLensEmitter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lensEmitter, 0);
  objc_storeStrong((id *)&self->_lensBurst, 0);
  objc_storeStrong((id *)&self->effectFileURL, 0);
  objc_storeStrong((id *)&self->messageImage, 0);

  objc_storeStrong((id *)&self->_shootingStarLayer, 0);
}

@end