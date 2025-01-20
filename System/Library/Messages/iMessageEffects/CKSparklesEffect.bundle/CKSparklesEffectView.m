@interface CKSparklesEffectView
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

@implementation CKSparklesEffectView

- (void)startAnimation
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v179 = [v3 URLForResource:@"Sparkles" withExtension:@"ca"];

  v178 = +[CAPackage packageWithContentsOfURL:v179 type:kCAPackageTypeCAMLBundle options:0 error:0];
  v177 = [&off_84C0 stringValue];
  v4 = [v178 publishedObjectWithName:v177];
  v5 = [v4 sublayers];
  v6 = [v5 objectAtIndexedSubscript:0];

  [v6 setOpacity:0.0];
  v7 = [v4 sublayers];
  v8 = [v7 objectAtIndexedSubscript:1];

  v9 = [v4 sublayers];
  v10 = [v9 objectAtIndexedSubscript:1];
  v11 = [v10 sublayers];
  v12 = [v11 objectAtIndexedSubscript:0];

  v13 = [v4 sublayers];
  v14 = [v13 objectAtIndexedSubscript:1];
  v15 = [v14 sublayers];
  v16 = [v15 objectAtIndexedSubscript:1];

  v17 = [v4 sublayers];
  v18 = [v17 objectAtIndexedSubscript:1];
  v19 = [v18 sublayers];
  v20 = [v19 objectAtIndexedSubscript:2];

  v175 = self;
  [(CKSparklesEffectView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  v25 = [(CKSparklesEffectView *)self layer];
  [v25 convertTime:0 fromLayer:CACurrentMediaTime()];
  v174 = v4;
  objc_msgSend(v4, "setBeginTime:");

  objc_msgSend(v4, "setPosition:", v22 * 0.5, v24 * 0.5);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v22, v24);
  [v4 setGeometryFlipped:1];
  v192 = v6;
  objc_msgSend(v6, "setPosition:", v22 * 0.5, v24 * 0.5);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v22, v24);
  v176 = v8;
  objc_msgSend(v8, "setPosition:", v22 * 0.5, v24 * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v22, v24);
  [v12 setSeed:arc4random()];
  [v12 setBirthRate:0.0];
  objc_msgSend(v12, "setPosition:", v22 * 0.5, v24 * 0.5);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v22, v24);
  v26 = [v12 emitterCells];
  v27 = [v26 objectAtIndexedSubscript:0];
  [v27 setScale:0.5];

  double v28 = (v22 * v24 + -1000500.0) / 6117724.0;
  v29 = [v12 emitterCells];
  v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setContentsScale:v28 * -2.4 + 3.2];

  [v16 setSeed:arc4random()];
  [v16 setBirthRate:0.0];
  objc_msgSend(v16, "setPosition:", v22 * 0.5, v24 * 0.5);
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, v22, v24);
  v31 = [v16 emitterCells];
  v32 = [v31 objectAtIndexedSubscript:0];
  [v32 setScale:1.0];

  v33 = [v16 emitterCells];
  v34 = [v33 objectAtIndexedSubscript:1];
  [v34 setScale:1.0];

  v35 = [v16 emitterCells];
  v36 = [v35 objectAtIndexedSubscript:0];
  [v36 setContentsScale:v28 * -1.275 + 1.7];

  v37 = [v16 emitterCells];
  v38 = [v37 objectAtIndexedSubscript:1];
  [v38 setContentsScale:v28 * -1.2 + 1.6];

  [v20 setSeed:arc4random()];
  [v20 setBirthRate:0.0];
  objc_msgSend(v20, "setPosition:", v22 * 0.5, v24 * 0.5);
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v22, v24);
  v39 = [v20 emitterCells];
  v40 = [v39 objectAtIndexedSubscript:0];
  [v40 setScale:0.5];

  v41 = [v20 emitterCells];
  v42 = [v41 objectAtIndexedSubscript:1];
  [v42 setScale:0.5];

  v43 = [v20 emitterCells];
  v44 = [v43 objectAtIndexedSubscript:0];
  [v44 setContentsScale:v28 * -0.6 + 0.8];

  v45 = [v20 emitterCells];
  v46 = [v45 objectAtIndexedSubscript:1];
  [v46 setContentsScale:v28 * -0.525 + 0.7];

  v191 = +[CABasicAnimation animationWithKeyPath:@"birthRate"];
  [v191 setFromValue:&off_84D8];
  [v191 setToValue:&off_84D8];
  [v191 setDuration:2.0];
  uint64_t v180 = kCAAnimationAbsolute;
  objc_msgSend(v191, "setBeginTimeMode:");
  [v191 setFrameInterval:0.0166666667];
  double v47 = v24 + 70.0;
  v48 = +[NSNumber numberWithFloat:70.0000159];
  [v12 setValue:v48 forKeyPath:@"emitterSize.width"];

  LODWORD(v49) = 1117782016;
  v50 = +[NSNumber numberWithFloat:v49];
  [v12 setValue:v50 forKeyPath:@"emitterSize.height"];

  *(float *)&double v24 = v22 + 40.0;
  LODWORD(v51) = LODWORD(v24);
  v52 = +[NSNumber numberWithFloat:v51];
  v185 = v12;
  [v12 setValue:v52 forKeyPath:@"emitterPosition.x"];

  *(float *)&double v22 = v47;
  LODWORD(v53) = LODWORD(v22);
  v54 = +[NSNumber numberWithFloat:v53];
  [v12 setValue:v54 forKeyPath:@"emitterPosition.y"];

  [v12 setTimeOffset:0.0];
  LODWORD(v55) = 1117782016;
  v56 = +[NSNumber numberWithFloat:v55];
  [v16 setValue:v56 forKeyPath:@"emitterSize.width"];

  LODWORD(v57) = 1117782016;
  v58 = +[NSNumber numberWithFloat:v57];
  v183 = v16;
  [v16 setValue:v58 forKeyPath:@"emitterSize.height"];

  LODWORD(v59) = LODWORD(v24);
  v60 = +[NSNumber numberWithFloat:v59];
  [v16 setValue:v60 forKeyPath:@"emitterPosition.x"];

  *(float *)&double v61 = v47;
  v62 = +[NSNumber numberWithFloat:v61];
  [v16 setValue:v62 forKeyPath:@"emitterPosition.y"];

  [v16 setTimeOffset:0.0];
  LODWORD(v63) = 1117782016;
  v64 = +[NSNumber numberWithFloat:v63];
  [v20 setValue:v64 forKeyPath:@"emitterSize.width"];

  LODWORD(v65) = 1117782016;
  v66 = +[NSNumber numberWithFloat:v65];
  [v20 setValue:v66 forKeyPath:@"emitterSize.height"];

  LODWORD(v67) = -1028390912;
  v68 = +[NSNumber numberWithFloat:v67];
  v171 = v20;
  [v20 setValue:v68 forKeyPath:@"emitterPosition.x"];

  LODWORD(v69) = -1028390912;
  v70 = +[NSNumber numberWithFloat:v69];
  [v20 setValue:v70 forKeyPath:@"emitterPosition.y"];

  [v20 setTimeOffset:0.0];
  v190 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  [v190 setFrameInterval:0.0166666667];
  v71 = +[NSNumber numberWithDouble:v28 * 600.0 + 2400.0];
  [v190 setFromValue:v71];

  [v190 setToValue:&off_84F0];
  [v190 setDuration:1.0];
  [v190 setBeginTimeMode:v180];
  v189 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  [v189 setFrameInterval:0.0166666667];
  v72 = +[NSNumber numberWithDouble:v28 * 100.0 + 200.0];
  [v189 setFromValue:v72];

  [v189 setToValue:&off_84F0];
  [v189 setDuration:2.0];
  [v189 setBeginTimeMode:v180];
  v188 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell2.birthRate"];
  [v188 setFrameInterval:0.0166666667];
  v73 = +[NSNumber numberWithDouble:v28 * 100.0 + 200.0];
  [v188 setFromValue:v73];

  [v188 setToValue:&off_84F0];
  [v188 setDuration:2.0];
  [v188 setBeginTimeMode:v180];
  v187 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell1.birthRate"];
  [v187 setFrameInterval:0.0166666667];
  v74 = +[NSNumber numberWithDouble:v28 * 400.0 + 800.0];
  [v187 setFromValue:v74];

  [v187 setToValue:&off_84F0];
  [v187 setDuration:1.0];
  [v187 setBeginTimeMode:v180];
  v186 = +[CABasicAnimation animationWithKeyPath:@"emitterCells.cell2.birthRate"];
  [v186 setFrameInterval:0.0166666667];
  v75 = +[NSNumber numberWithDouble:v28 * 400.0 + 800.0];
  [v186 setFromValue:v75];

  [v186 setToValue:&off_84F0];
  [v186 setDuration:1.0];
  [v186 setBeginTimeMode:v180];
  v76 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterBehaviors.attractor.stiffness"];
  [v76 setFrameInterval:0.0166666667];
  LODWORD(v77) = 1056293519;
  v78 = +[NSNumber numberWithFloat:v77];
  v79 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v80) = 1054280253;
  v81 = +[NSNumber numberWithFloat:v80];
  v82 = +[NSNumber numberWithFloat:0.0];
  v173 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v78, v79, v81, v82, 0);

  LODWORD(v83) = 1041194025;
  v84 = +[NSNumber numberWithFloat:v83];
  LODWORD(v85) = 1043207291;
  v86 = +[NSNumber numberWithFloat:v85];
  LODWORD(v87) = 1043878380;
  v88 = +[NSNumber numberWithFloat:v87];
  v89 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v172 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v84, v86, v88, v89, 0);

  v184 = v76;
  [v76 setValues:v173];
  [v76 setKeyTimes:v172];
  [v76 setDuration:5.0];
  [v76 setBeginTimeMode:v180];
  v90 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterBehaviors.attractor.stiffness"];
  [v90 setFrameInterval:0.0166666667];
  LODWORD(v91) = 2.0;
  v92 = +[NSNumber numberWithFloat:v91];
  v93 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v94) = 1058642330;
  v95 = +[NSNumber numberWithFloat:v94];
  v96 = +[NSNumber numberWithFloat:0.0];
  v170 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v92, v93, v95, v96, 0);

  LODWORD(v97) = 1041194025;
  v98 = +[NSNumber numberWithFloat:v97];
  LODWORD(v99) = 1043207291;
  v100 = +[NSNumber numberWithFloat:v99];
  LODWORD(v101) = 1043878380;
  v102 = +[NSNumber numberWithFloat:v101];
  LODWORD(v103) = 1058642330;
  v104 = +[NSNumber numberWithFloat:v103];
  v169 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v98, v100, v102, v104, 0);

  v182 = v90;
  [v90 setValues:v170];
  [v90 setKeyTimes:v169];
  [v90 setDuration:5.0];
  [v90 setBeginTimeMode:v180];
  v105 = +[CAKeyframeAnimation animationWithKeyPath:@"emitterBehaviors.attractor.stiffness"];
  [v105 setFrameInterval:0.0166666667];
  v106 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v107) = 1067869798;
  v108 = +[NSNumber numberWithFloat:v107];
  v109 = +[NSNumber numberWithFloat:0.0];
  v168 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v106, v108, v109, 0);

  LODWORD(v110) = 1036831949;
  v111 = +[NSNumber numberWithFloat:v110];
  LODWORD(v112) = 1037503037;
  v113 = +[NSNumber numberWithFloat:v112];
  LODWORD(v114) = 1045220557;
  v115 = +[NSNumber numberWithFloat:v114];
  v167 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v111, v113, v115, 0);

  v181 = v105;
  [v105 setValues:v168];
  [v105 setKeyTimes:v167];
  [v105 setDuration:5.0];
  [v105 setBeginTimeMode:v180];
  v116 = +[CAKeyframeAnimation animation];
  [v116 setFrameInterval:0.0166666667];
  v117 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v118) = -1019346944;
  v119 = +[NSNumber numberWithFloat:v118];
  v166 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v117, v119, 0);

  v120 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v121) = 1.0;
  v122 = +[NSNumber numberWithFloat:v121];
  v165 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v120, v122, 0);

  v123 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  v164 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v123, 0);

  [v116 setValues:v166];
  [v116 setKeyTimes:v165];
  [v116 setTimingFunctions:v164];
  [v116 setDuration:5.0];
  v163 = v116;
  [v116 setBeginTimeMode:v180];
  v124 = +[NSNumber numberWithFloat:0.0];
  [v12 setValue:v124 forKeyPath:@"emitterCells.cell1.birthRate"];

  [v12 addAnimation:v190 forKey:0];
  v125 = +[NSNumber numberWithFloat:0.0];
  [v16 setValue:v125 forKeyPath:@"emitterCells.cell1.birthRate"];

  [v16 addAnimation:v189 forKey:0];
  v126 = +[NSNumber numberWithFloat:0.0];
  [v16 setValue:v126 forKeyPath:@"emitterCells.cell2.birthRate"];

  [v16 addAnimation:v188 forKey:0];
  v127 = +[NSNumber numberWithFloat:0.0];
  [v171 setValue:v127 forKeyPath:@"emitterCells.cell1.birthRate"];

  [v171 addAnimation:v187 forKey:0];
  v128 = +[NSNumber numberWithFloat:0.0];
  [v171 setValue:v128 forKeyPath:@"emitterCells.cell2.birthRate"];

  [v171 addAnimation:v186 forKey:0];
  LODWORD(v129) = LODWORD(v24);
  v130 = +[NSNumber numberWithFloat:v129];
  [v12 setValue:v130 forKeyPath:@"emitterBehaviors.attractor.position.x"];

  LODWORD(v131) = LODWORD(v22);
  v132 = +[NSNumber numberWithFloat:v131];
  [v12 setValue:v132 forKeyPath:@"emitterBehaviors.attractor.position.y"];

  LODWORD(v133) = LODWORD(v24);
  v134 = +[NSNumber numberWithFloat:v133];
  [v16 setValue:v134 forKeyPath:@"emitterBehaviors.attractor.position.x"];

  LODWORD(v135) = LODWORD(v22);
  v136 = +[NSNumber numberWithFloat:v135];
  [v16 setValue:v136 forKeyPath:@"emitterBehaviors.attractor.position.y"];

  LODWORD(v137) = -1028390912;
  v138 = +[NSNumber numberWithFloat:v137];
  [v171 setValue:v138 forKeyPath:@"emitterBehaviors.attractor.position.x"];

  LODWORD(v139) = -1028390912;
  v140 = +[NSNumber numberWithFloat:v139];
  [v171 setValue:v140 forKeyPath:@"emitterBehaviors.attractor.position.y"];

  [v12 addAnimation:v184 forKey:0];
  [v16 addAnimation:v90 forKey:0];
  [v171 addAnimation:v181 forKey:0];
  [v12 addAnimation:v116 forKey:@"emitterCells.cell1.yAcceleration"];
  v141 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
  [v141 setFrameInterval:0.0166666667];
  v142 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v143) = 1.0;
  v144 = +[NSNumber numberWithFloat:v143];
  LODWORD(v145) = 1.0;
  v146 = +[NSNumber numberWithFloat:v145];
  v147 = +[NSNumber numberWithFloat:0.0];
  v148 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v142, v144, v146, v147, 0);

  v149 = +[NSNumber numberWithFloat:0.0];
  LODWORD(v150) = 1050253722;
  v151 = +[NSNumber numberWithFloat:v150];
  LODWORD(v152) = 1059313418;
  v153 = +[NSNumber numberWithFloat:v152];
  LODWORD(v154) = 1.0;
  v155 = +[NSNumber numberWithFloat:v154];
  v156 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v149, v151, v153, v155, 0);

  v157 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v158 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  v159 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v157, v158, 0);

  [v141 setValues:v148];
  [v141 setKeyTimes:v156];
  [v141 setTimingFunctions:v159];
  [v141 setDuration:5.5];
  [v141 setBeginTimeMode:v180];
  [v192 addAnimation:v141 forKey:@"opacity"];
  [v185 addAnimation:v191 forKey:@"fall"];
  [v183 addAnimation:v191 forKey:@"fall"];
  [v171 addAnimation:v191 forKey:@"fall"];
  v160 = [(CKSparklesEffectView *)v175 layer];
  [v160 addSublayer:v174];

  objc_storeStrong((id *)&v175->_sparklesLayer, v174);
  dispatch_time_t v161 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6704;
  block[3] = &unk_81C0;
  id v194 = v174;
  id v162 = v174;
  dispatch_after(v161, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopAnimation
{
  [(CALayer *)self->_sparklesLayer removeFromSuperlayer];
  sparklesLayer = self->_sparklesLayer;
  self->_sparklesLayer = 0;
}

+ (id)effectedZIndexes
{
  return +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, 1);
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

  objc_storeStrong((id *)&self->_sparklesLayer, 0);
}

@end