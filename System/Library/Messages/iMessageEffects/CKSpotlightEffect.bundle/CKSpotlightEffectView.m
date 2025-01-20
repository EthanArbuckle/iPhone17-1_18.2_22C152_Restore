@interface CKSpotlightEffectView
+ (id)effectedZIndexes;
- (CADisplayLink)displayLink;
- (CGPoint)_flippedFocusPoint;
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (CKElasticFunction)elasticFunctionPositionX;
- (CKElasticFunction)elasticFunctionPositionY;
- (NSURL)effectFileURL;
- (UIImage)messageImage;
- (char)messageOrientation;
- (double)elasticLastTime;
- (double)elasticRemainingTime;
- (int64_t)zIndex;
- (void)_displayLinkCallback:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setEffectFileURL:(id)a3;
- (void)setElasticFunctionPositionX:(id)a3;
- (void)setElasticFunctionPositionY:(id)a3;
- (void)setElasticLastTime:(double)a3;
- (void)setElasticRemainingTime:(double)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKSpotlightEffectView

- (void)startAnimation
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 URLForResource:@"Spotlight" withExtension:@"ca"];

  v5 = +[CAPackage packageWithContentsOfURL:v4 type:kCAPackageTypeCAMLBundle options:0 error:0];
  v6 = +[NSNumber numberWithInteger:[(CKSpotlightEffectView *)self zIndex]];
  v7 = [v6 stringValue];

  v8 = [v5 publishedObjectWithName:v7];
  [(CKSpotlightEffectView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  v13 = [(CKSpotlightEffectView *)self layer];
  [v13 convertTime:0 fromLayer:CACurrentMediaTime()];
  objc_msgSend(v8, "setBeginTime:");

  objc_msgSend(v8, "setPosition:", v10 * 0.5, v12 * 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v10, v12);
  [v8 setGeometryFlipped:1];
  [v8 setAllowsGroupOpacity:0];
  [v8 setAllowsGroupBlending:0];
  if ((char *)[(CKSpotlightEffectView *)self zIndex] == (char *)&dword_0 + 3)
  {
    v370 = v7;
    v371 = v5;
    v372 = v4;
    [(CKSpotlightEffectView *)self _flippedFocusPoint];
    v15 = +[CKElasticFunction functionWithTension:90.0 friction:18.0 initialValue:v14];
    elasticFunctionPositionY = self->_elasticFunctionPositionY;
    self->_elasticFunctionPositionY = v15;

    v17 = +[CKElasticFunction functionWithTension:60.0 friction:10.0 initialValue:0.0];
    elasticFunctionPositionX = self->_elasticFunctionPositionX;
    self->_elasticFunctionPositionX = v17;

    v19 = self->_elasticFunctionPositionY;
    [(CKSpotlightEffectView *)self _flippedFocusPoint];
    [(CKElasticFunction *)v19 setInput:v20];
    [(CKElasticFunction *)self->_elasticFunctionPositionX setInput:0.0];
    if (!self->_displayLink)
    {
      v21 = +[UIScreen mainScreen];
      v22 = [v21 displayLinkWithTarget:self selector:"_displayLinkCallback:"];
      displayLink = self->_displayLink;
      self->_displayLink = v22;

      v24 = self->_displayLink;
      v25 = +[NSRunLoop currentRunLoop];
      [(CADisplayLink *)v24 addToRunLoop:v25 forMode:NSRunLoopCommonModes];

      self->_elasticLastTime = CACurrentMediaTime();
      self->_elasticRemainingTime = 0.0;
    }
    v26 = [v8 sublayers];
    v27 = [v26 objectAtIndexedSubscript:0];
    darken = self->_darken;
    self->_darken = v27;

    v29 = [v8 sublayers];
    v30 = [v29 objectAtIndexedSubscript:0];
    v31 = [v30 sublayers];
    v32 = [v31 objectAtIndexedSubscript:0];
    circleParent = self->_circleParent;
    self->_circleParent = v32;

    v34 = [v8 sublayers];
    v35 = [v34 objectAtIndexedSubscript:0];
    v36 = [v35 sublayers];
    [v36 objectAtIndexedSubscript:0];
    v37 = v378 = self;
    v38 = [v37 sublayers];
    uint64_t v39 = [v38 objectAtIndexedSubscript:0];
    ringParent = v378->_ringParent;
    v378->_ringParent = (CALayer *)v39;

    v41 = [v8 sublayers];
    v42 = [v41 objectAtIndexedSubscript:0];
    v43 = [v42 sublayers];
    v44 = [v43 objectAtIndexedSubscript:0];
    v45 = [v44 sublayers];
    [v45 objectAtIndexedSubscript:0];
    v47 = v46 = v8;
    v48 = [v47 sublayers];
    uint64_t v49 = [v48 objectAtIndexedSubscript:0];
    ring0Parent = v378->_ring0Parent;
    v378->_ring0Parent = (CALayer *)v49;

    v51 = [v46 sublayers];
    v52 = [v51 objectAtIndexedSubscript:0];
    v53 = [v52 sublayers];
    v54 = [v53 objectAtIndexedSubscript:0];
    v55 = [v54 sublayers];
    v56 = [v55 objectAtIndexedSubscript:0];
    v57 = [v56 sublayers];
    v58 = [v57 objectAtIndexedSubscript:0];
    v59 = [v58 sublayers];
    uint64_t v60 = [v59 objectAtIndexedSubscript:0];
    ring0 = v378->_ring0;
    v378->_ring0 = (CALayer *)v60;

    v62 = [v46 sublayers];
    v63 = [v62 objectAtIndexedSubscript:0];
    v64 = [v63 sublayers];
    v65 = [v64 objectAtIndexedSubscript:0];
    v66 = [v65 sublayers];
    v67 = [v66 objectAtIndexedSubscript:0];
    v68 = [v67 sublayers];
    uint64_t v69 = [v68 objectAtIndexedSubscript:1];
    ring1 = v378->_ring1;
    v378->_ring1 = (CALayer *)v69;

    v71 = [v46 sublayers];
    uint64_t v72 = [v71 objectAtIndexedSubscript:1];
    dustEmitter = v378->_dustEmitter;
    v378->_dustEmitter = (CAEmitterLayer *)v72;

    v74 = [v46 sublayers];
    v75 = [v74 objectAtIndexedSubscript:1];
    v76 = [v75 sublayers];
    uint64_t v77 = [v76 objectAtIndexedSubscript:0];
    beamParent1 = v378->_beamParent1;
    v378->_beamParent1 = (CALayer *)v77;

    v79 = [v46 sublayers];
    v80 = [v79 objectAtIndexedSubscript:1];
    v81 = [v80 sublayers];
    v82 = [v81 objectAtIndexedSubscript:0];
    v83 = [v82 sublayers];
    uint64_t v84 = [v83 objectAtIndexedSubscript:0];
    beamPos1 = v378->_beamPos1;
    v378->_beamPos1 = (CALayer *)v84;

    v86 = [v46 sublayers];
    v87 = [v86 objectAtIndexedSubscript:1];
    v88 = [v87 sublayers];
    v89 = [v88 objectAtIndexedSubscript:0];
    v90 = [v89 sublayers];
    v91 = [v90 objectAtIndexedSubscript:0];
    v92 = [v91 sublayers];
    uint64_t v93 = [v92 objectAtIndexedSubscript:0];
    beam1 = v378->_beam1;
    v378->_beam1 = (CALayer *)v93;

    v95 = [v46 sublayers];
    uint64_t v96 = [v95 objectAtIndexedSubscript:2];
    beamParent0 = v378->_beamParent0;
    v378->_beamParent0 = (CALayer *)v96;

    v98 = [v46 sublayers];
    v99 = [v98 objectAtIndexedSubscript:2];
    v100 = [v99 sublayers];
    uint64_t v101 = [v100 objectAtIndexedSubscript:0];
    beamPos0 = v378->_beamPos0;
    v378->_beamPos0 = (CALayer *)v101;

    v369 = v46;
    v103 = [v46 sublayers];
    v104 = [v103 objectAtIndexedSubscript:2];
    v105 = [v104 sublayers];
    v106 = [v105 objectAtIndexedSubscript:0];
    v107 = [v106 sublayers];
    uint64_t v108 = [v107 objectAtIndexedSubscript:0];
    beam0 = v378->_beam0;
    v378->_beam0 = (CALayer *)v108;

    [(CKSpotlightEffectView *)v378 bounds];
    v378->_screenBounds.width = v110;
    v378->_screenBounds.height = v111;
    -[CALayer setPosition:](v378->_darken, "setPosition:", v10 * 0.5, v12 * 0.5);
    -[CALayer setBounds:](v378->_darken, "setBounds:", 0.0, 0.0, v10, v12);
    -[CALayer setPosition:](v378->_circleParent, "setPosition:", v10 * 0.5, v12 * 0.5);
    -[CALayer setBounds:](v378->_circleParent, "setBounds:", 0.0, 0.0, v10, v12);
    unsigned int v112 = [(CKSpotlightEffectView *)v378 messageOrientation];
    v378->_leftToRight = v112 == 0;
    if (v112)
    {
      CATransform3DMakeScale(&v384, 0.65, 0.65, 0.65);
      v113 = v378->_beamPos0;
      CATransform3D v383 = v384;
      [(CALayer *)v113 setTransform:&v383];
      CATransform3DMakeScale(&v382, 0.65, 0.65, 0.65);
      v114 = v378->_beamPos1;
      CATransform3D v381 = v382;
      v115 = &v381;
    }
    else
    {
      CATransform3DMakeScale(&v388, -0.65, 0.65, 0.65);
      v116 = v378->_beamPos0;
      CATransform3D v387 = v388;
      [(CALayer *)v116 setTransform:&v387];
      CATransform3DMakeScale(&v386, -0.65, 0.65, 0.65);
      v114 = v378->_beamPos1;
      CATransform3D v385 = v386;
      v115 = &v385;
    }
    [(CALayer *)v114 setTransform:v115];
    [(CKSpotlightEffectView *)v378 _flippedFocusPoint];
    -[CALayer setPosition:](v378->_ringParent, "setPosition:");
    [(CKSpotlightEffectView *)v378 _flippedFocusPoint];
    -[CALayer setPosition:](v378->_beamParent0, "setPosition:");
    [(CKSpotlightEffectView *)v378 _flippedFocusPoint];
    -[CALayer setPosition:](v378->_beamParent1, "setPosition:");
    v117 = v378->_dustEmitter;
    v118 = +[NSNumber numberWithDouble:v10];
    [(CAEmitterLayer *)v117 setValue:v118 forKeyPath:@"emitterSize.width"];

    v119 = v378->_dustEmitter;
    v120 = +[NSNumber numberWithDouble:v12];
    [(CAEmitterLayer *)v119 setValue:v120 forKeyPath:@"emitterSize.height"];

    v121 = v378->_dustEmitter;
    v122 = +[NSNumber numberWithDouble:v10 * 0.5];
    [(CAEmitterLayer *)v121 setValue:v122 forKeyPath:@"emitterPosition.x"];

    v123 = v378->_dustEmitter;
    v124 = +[NSNumber numberWithDouble:v12 * 0.5];
    [(CAEmitterLayer *)v123 setValue:v124 forKeyPath:@"emitterPosition.y"];

    float v125 = v10 * v12 * 0.00056;
    v126 = [(CAEmitterLayer *)v378->_dustEmitter emitterCells];
    v127 = [v126 objectAtIndexedSubscript:0];
    *(float *)&double v128 = v125;
    [v127 setBirthRate:v128];

    v129 = [(CAEmitterLayer *)v378->_dustEmitter emitterCells];
    v130 = [v129 objectAtIndexedSubscript:0];
    [v130 setContentsScale:10.0];

    -[CAEmitterLayer setPosition:](v378->_dustEmitter, "setPosition:", v10 * 0.5, v12 * 0.5);
    -[CAEmitterLayer setBounds:](v378->_dustEmitter, "setBounds:", 0.0, 0.0, v10, v12);
    [(CAEmitterLayer *)v378->_dustEmitter setSeed:arc4random()];
    v131 = +[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    id v132 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    id v133 = [v132 CGColor];
    id v134 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.94];
    id v135 = [v134 CGColor];
    id v136 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.94];
    id v137 = [v136 CGColor];
    id v138 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v139 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v133, v135, v137, [v138 CGColor], 0);
    [v131 setValues:v139];

    [v131 setKeyTimes:&off_8768];
    LODWORD(v140) = 1051361018;
    LODWORD(v141) = 1062551421;
    LODWORD(v142) = 1062551421;
    v143 = +[CAMediaTimingFunction functionWithControlPoints:v140 :0.0 :v141 :v142];
    v404[0] = v143;
    LODWORD(v144) = 1.0;
    LODWORD(v145) = 1043005964;
    LODWORD(v146) = 1059766403;
    v147 = +[CAMediaTimingFunction functionWithControlPoints:v145 :0.0 :v146 :v144];
    v404[1] = v147;
    LODWORD(v148) = 1.0;
    LODWORD(v149) = 1051361018;
    LODWORD(v150) = 1059766403;
    v151 = +[CAMediaTimingFunction functionWithControlPoints:v149 :0.0 :v150 :v148];
    v404[2] = v151;
    v152 = +[NSArray arrayWithObjects:v404 count:3];
    [v131 setTimingFunctions:v152];

    v368 = v131;
    [v131 setDuration:4.6];
    [v131 setFrameInterval:0.0166666667];
    uint64_t v153 = kCAAnimationAbsolute;
    uint64_t v377 = kCAAnimationAbsolute;
    [v131 setBeginTimeMode:kCAAnimationAbsolute];
    [v131 setFillMode:kCAFillModeForwards];
    [v131 setRemovedOnCompletion:0];
    [(CALayer *)v378->_darken addAnimation:v131 forKey:@"backgroundColor"];
    v154 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    LODWORD(v155) = 1.0;
    v156 = +[NSNumber numberWithFloat:v155];
    LODWORD(v157) = 1051931443;
    v158 = +[NSNumber numberWithFloat:v157];
    LODWORD(v159) = 1051931443;
    v160 = +[NSNumber numberWithFloat:v159];
    LODWORD(v161) = 1.0;
    v162 = +[NSNumber numberWithFloat:v161];
    v163 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v156, v158, v160, v162, 0);
    [v154 setValues:v163];

    [v154 setKeyTimes:&off_8780];
    LODWORD(v164) = 1051361018;
    LODWORD(v165) = 1062551421;
    LODWORD(v166) = 1062551421;
    v167 = +[CAMediaTimingFunction functionWithControlPoints:v164 :0.0 :v165 :v166];
    v403[0] = v167;
    LODWORD(v168) = 1.0;
    LODWORD(v169) = 1043005964;
    LODWORD(v170) = 1059766403;
    v171 = +[CAMediaTimingFunction functionWithControlPoints:v169 :0.0 :v170 :v168];
    v403[1] = v171;
    LODWORD(v172) = 1.0;
    LODWORD(v173) = 1051361018;
    LODWORD(v174) = 1059766403;
    v175 = +[CAMediaTimingFunction functionWithControlPoints:v173 :0.0 :v174 :v172];
    v403[2] = v175;
    v176 = +[NSArray arrayWithObjects:v403 count:3];
    [v154 setTimingFunctions:v176];

    v367 = v154;
    [v154 setDuration:4.6];
    [v154 setFrameInterval:0.0166666667];
    [v154 setBeginTimeMode:v153];
    [v154 setFillMode:kCAFillModeForwards];
    [v154 setRemovedOnCompletion:0];
    [(CALayer *)v378->_ring1 addAnimation:v154 forKey:@"opacity"];
    v373 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    [v373 setKeyTimes:&off_8798];
    LODWORD(v177) = 1.0;
    LODWORD(v178) = 1043005964;
    LODWORD(v179) = 1062551421;
    v180 = +[CAMediaTimingFunction functionWithControlPoints:v178 :0.0 :v179 :v177];
    v402[0] = v180;
    LODWORD(v181) = 1051361018;
    LODWORD(v182) = 1062551421;
    LODWORD(v183) = 1062551421;
    v184 = +[CAMediaTimingFunction functionWithControlPoints:v181 :0.0 :v182 :v183];
    v402[1] = v184;
    LODWORD(v185) = 1058642330;
    LODWORD(v186) = 1.0;
    LODWORD(v187) = 1043005964;
    LODWORD(v188) = 1043005964;
    v189 = +[CAMediaTimingFunction functionWithControlPoints:v187 :v188 :v185 :v186];
    v402[2] = v189;
    LODWORD(v190) = 1056159302;
    LODWORD(v191) = 1061796446;
    LODWORD(v192) = 1073993482;
    v193 = +[CAMediaTimingFunction functionWithControlPoints:v190 :0.0 :v191 :v192];
    v402[3] = v193;
    LODWORD(v194) = 1060252942;
    LODWORD(v195) = 1055253332;
    LODWORD(v196) = 1.0;
    LODWORD(v197) = 1059766403;
    v198 = +[CAMediaTimingFunction functionWithControlPoints:v194 :v195 :v197 :v196];
    v402[4] = v198;
    LODWORD(v199) = 1043542835;
    LODWORD(v200) = 1008981770;
    LODWORD(v201) = 1053407838;
    LODWORD(v202) = 1057266598;
    v203 = +[CAMediaTimingFunction functionWithControlPoints:v199 :v200 :v201 :v202];
    v402[5] = v203;
    LODWORD(v204) = 1063306396;
    LODWORD(v205) = 1024416809;
    LODWORD(v206) = 1053005185;
    LODWORD(v207) = 1066317906;
    v208 = +[CAMediaTimingFunction functionWithControlPoints:v204 :v205 :v206 :v207];
    v402[6] = v208;
    v209 = +[NSArray arrayWithObjects:v402 count:7];
    [v373 setTimingFunctions:v209];

    v364 = +[NSNumber numberWithDouble:1.4];
    v400[0] = v364;
    v362 = +[NSNumber numberWithDouble:1.4];
    v400[1] = v362;
    v400[2] = &off_83C0;
    v361 = +[NSArray arrayWithObjects:v400 count:3];
    v401[0] = v361;
    v360 = +[NSNumber numberWithDouble:1.4];
    v399[0] = v360;
    v359 = +[NSNumber numberWithDouble:1.4];
    v399[1] = v359;
    v399[2] = &off_83C0;
    v358 = +[NSArray arrayWithObjects:v399 count:3];
    v401[1] = v358;
    v357 = +[NSNumber numberWithDouble:1.06];
    v398[0] = v357;
    v356 = +[NSNumber numberWithDouble:1.06];
    v398[1] = v356;
    v398[2] = &off_83C0;
    v355 = +[NSArray arrayWithObjects:v398 count:3];
    v401[2] = v355;
    LODWORD(v210) = 1.0;
    v354 = +[NSNumber numberWithFloat:v210];
    v397[0] = v354;
    LODWORD(v211) = 1.0;
    v353 = +[NSNumber numberWithFloat:v211];
    v397[1] = v353;
    v397[2] = &off_83C0;
    v352 = +[NSArray arrayWithObjects:v397 count:3];
    v401[3] = v352;
    LODWORD(v212) = 1.0;
    v351 = +[NSNumber numberWithFloat:v212];
    v396[0] = v351;
    LODWORD(v213) = 1.0;
    v350 = +[NSNumber numberWithFloat:v213];
    v396[1] = v350;
    v396[2] = &off_83C0;
    v349 = +[NSArray arrayWithObjects:v396 count:3];
    v401[4] = v349;
    v348 = +[NSNumber numberWithDouble:0.95];
    v395[0] = v348;
    v214 = +[NSNumber numberWithDouble:0.95];
    v395[1] = v214;
    v395[2] = &off_83C0;
    v215 = +[NSArray arrayWithObjects:v395 count:3];
    v401[5] = v215;
    LODWORD(v216) = 1.0;
    v217 = +[NSNumber numberWithFloat:v216];
    v394[0] = v217;
    LODWORD(v218) = 1.0;
    v219 = +[NSNumber numberWithFloat:v218];
    v394[1] = v219;
    v394[2] = &off_83C0;
    v220 = +[NSArray arrayWithObjects:v394 count:3];
    v401[6] = v220;
    v221 = +[NSNumber numberWithDouble:8.66];
    v393[0] = v221;
    v222 = +[NSNumber numberWithDouble:8.66];
    v393[1] = v222;
    v393[2] = &off_83C0;
    v223 = +[NSArray arrayWithObjects:v393 count:3];
    v401[7] = v223;
    v224 = +[NSArray arrayWithObjects:v401 count:8];
    [v373 setValues:v224];

    [v373 setDuration:4.15];
    [v373 setFrameInterval:0.0166666667];
    [v373 setBeginTimeMode:v377];
    [v373 setFillMode:kCAFillModeForwards];
    [v373 setRemovedOnCompletion:0];
    [(CALayer *)v378->_ring0 addAnimation:v373 forKey:@"transform.scale"];
    [(CALayer *)v378->_beam0 addAnimation:v373 forKey:@"transform.scale"];
    [(CALayer *)v378->_beam1 addAnimation:v373 forKey:@"transform.scale"];
    v225 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [v225 setKeyTimes:&off_87B0];
    LODWORD(v226) = 1.0;
    LODWORD(v227) = 1043005964;
    LODWORD(v228) = 1062551421;
    v229 = +[CAMediaTimingFunction functionWithControlPoints:v227 :0.0 :v228 :v226];
    v392[0] = v229;
    LODWORD(v230) = 1043005964;
    LODWORD(v231) = 1043005964;
    LODWORD(v232) = 1062551421;
    LODWORD(v233) = 1062551421;
    v234 = +[CAMediaTimingFunction functionWithControlPoints:v230 :v231 :v232 :v233];
    v392[1] = v234;
    LODWORD(v235) = 1.0;
    LODWORD(v236) = 1043005964;
    LODWORD(v237) = 1059766403;
    v238 = +[CAMediaTimingFunction functionWithControlPoints:v236 :0.0 :v237 :v235];
    v392[2] = v238;
    LODWORD(v239) = 1051361018;
    LODWORD(v240) = 1062551421;
    LODWORD(v241) = 1062551421;
    v242 = +[CAMediaTimingFunction functionWithControlPoints:v239 :0.0 :v240 :v241];
    v392[3] = v242;
    v243 = +[NSArray arrayWithObjects:v392 count:4];
    [v225 setTimingFunctions:v243];

    v365 = v225;
    [v225 setValues:&off_87C8];
    [v225 setDuration:4.267];
    [v225 setFrameInterval:0.0166666667];
    [v225 setBeginTimeMode:v377];
    [v225 setFillMode:kCAFillModeForwards];
    [v225 setRemovedOnCompletion:0];
    [(CALayer *)v378->_ring0 addAnimation:v225 forKey:@"opacity"];
    [(CALayer *)v378->_beam0 addAnimation:v225 forKey:@"opacity"];
    [(CALayer *)v378->_beam1 addAnimation:v225 forKey:@"opacity"];
    v244 = +[CAKeyframeAnimation animationWithKeyPath:@"contentsMultiplyColor"];
    [v244 setKeyTimes:&off_87E0];
    LODWORD(v245) = 1.0;
    LODWORD(v246) = 1043005964;
    LODWORD(v247) = 1062551421;
    v248 = +[CAMediaTimingFunction functionWithControlPoints:v246 :0.0 :v247 :v245];
    v391[0] = v248;
    LODWORD(v249) = 1043005964;
    LODWORD(v250) = 1043005964;
    LODWORD(v251) = 1062551421;
    LODWORD(v252) = 1062551421;
    v253 = +[CAMediaTimingFunction functionWithControlPoints:v249 :v250 :v251 :v252];
    v391[1] = v253;
    LODWORD(v254) = 1.0;
    LODWORD(v255) = 1043005964;
    LODWORD(v256) = 1059766403;
    v257 = +[CAMediaTimingFunction functionWithControlPoints:v255 :0.0 :v256 :v254];
    v391[2] = v257;
    LODWORD(v258) = 1051361018;
    LODWORD(v259) = 1062551421;
    LODWORD(v260) = 1062551421;
    v261 = +[CAMediaTimingFunction functionWithControlPoints:v258 :0.0 :v259 :v260];
    v391[3] = v261;
    v262 = +[NSArray arrayWithObjects:v391 count:4];
    [v244 setTimingFunctions:v262];

    id v263 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    id v264 = [v263 CGColor];
    id v265 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    id v266 = [v265 CGColor];
    id v267 = +[UIColor colorWithRed:0.654901961 green:0.82745098 blue:0.996078431 alpha:1.0];
    id v268 = [v267 CGColor];
    id v269 = +[UIColor colorWithRed:0.654901961 green:0.82745098 blue:0.996078431 alpha:1.0];
    id v270 = [v269 CGColor];
    id v271 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    v272 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v264, v266, v268, v270, [v271 CGColor], 0);
    [v244 setValues:v272];

    v366 = v244;
    [v244 setDuration:4.267];
    [v244 setFrameInterval:0.0166666667];
    [v244 setBeginTimeMode:v377];
    [v244 setFillMode:kCAFillModeForwards];
    [v244 setRemovedOnCompletion:0];
    [(CALayer *)v378->_beam0 addAnimation:v244 forKey:@"contentsMultiplyColor"];
    v273 = +[UIBezierPath bezierPath];
    objc_msgSend(v273, "moveToPoint:", -20.501, -10.522);
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:", -20.501, -10.522, -20.501, -10.522, -20.501, -10.522);
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:", 5.499, -0.522, -20.501, -10.522, 5.499, -0.522);
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:");
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:", -0.501, -0.522, 3.499, -2.522, -0.501, -0.522);
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:", 1.63, -0.522, -0.501, -0.522, 1.63, -0.522);
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:", -1.094, 1.478, 1.63, -0.522, -1.094, 1.478);
    objc_msgSend(v273, "addCurveToPoint:controlPoint1:controlPoint2:", 2.381, 8.636, -1.094, 1.478, 2.381, 8.636);
    v274 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
    [v274 setKeyTimes:&off_87F8];
    LODWORD(v275) = 1.0;
    LODWORD(v276) = 1062551421;
    LODWORD(v277) = 1051361018;
    v375 = +[CAMediaTimingFunction functionWithControlPoints:v277 :0.0 :v276 :v275];
    v390[0] = v375;
    LODWORD(v278) = 1057233043;
    LODWORD(v279) = 1.0;
    LODWORD(v280) = 1051361018;
    v281 = +[CAMediaTimingFunction functionWithControlPoints:v280 :0.0 :v278 :v279];
    v390[1] = v281;
    LODWORD(v282) = 1044348142;
    LODWORD(v283) = 1058189345;
    LODWORD(v284) = 1.0;
    v285 = +[CAMediaTimingFunction functionWithControlPoints:v282 :0.0 :v283 :v284];
    v390[2] = v285;
    LODWORD(v286) = 1051226800;
    LODWORD(v287) = 1059716071;
    LODWORD(v288) = 1.0;
    v289 = +[CAMediaTimingFunction functionWithControlPoints:v286 :0.0 :v287 :v288];
    v390[3] = v289;
    LODWORD(v290) = 1051394572;
    LODWORD(v291) = 1042133549;
    LODWORD(v292) = 1059816735;
    v293 = +[CAMediaTimingFunction functionWithControlPoints:v290 :0.0 :v292 :v291];
    v390[4] = v293;
    LODWORD(v294) = 1051461681;
    LODWORD(v295) = 1049179980;
    LODWORD(v296) = 1060269720;
    LODWORD(v297) = 1059816735;
    v298 = +[CAMediaTimingFunction functionWithControlPoints:v294 :v295 :v297 :v296];
    v390[5] = v298;
    LODWORD(v299) = 1051964998;
    LODWORD(v300) = 1040388719;
    LODWORD(v301) = 1058524889;
    LODWORD(v302) = -1072298983;
    v303 = +[CAMediaTimingFunction functionWithControlPoints:v299 :v300 :v301 :v302];
    v390[6] = v303;
    v304 = +[NSArray arrayWithObjects:v390 count:7];
    v305 = v274;
    [v274 setTimingFunctions:v304];

    id v376 = v273;
    objc_msgSend(v274, "setPath:", objc_msgSend(v376, "CGPath"));
    v306 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -20.501, -10.522);
    v389[0] = v306;
    v307 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -20.501, -10.522);
    v389[1] = v307;
    v308 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 5.499, -0.522);
    v389[2] = v308;
    v309 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 3.499, -2.522);
    v389[3] = v309;
    v310 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -0.501, -0.522);
    v389[4] = v310;
    v311 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 1.63, -0.522);
    v389[5] = v311;
    v312 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", -1.094, 1.478);
    v389[6] = v312;
    v313 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", 2.381, 8.636);
    v389[7] = v313;
    v314 = +[NSArray arrayWithObjects:v389 count:8];
    [v305 setValues:v314];

    v363 = v305;
    [v305 setDuration:4.266];
    [v305 setFrameInterval:0.0166666667];
    [v305 setBeginTimeMode:v377];
    [v305 setFillMode:kCAFillModeForwards];
    [v305 setRemovedOnCompletion:0];
    [(CALayer *)v378->_ring0 addAnimation:v305 forKey:@"position"];
    [(CALayer *)v378->_beamPos0 addAnimation:v305 forKey:@"position"];
    [(CALayer *)v378->_beamPos1 addAnimation:v305 forKey:@"position"];
    v315 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    [v315 setFrameInterval:0.0166666667];
    [v315 setKeyTimes:&off_8810];
    v316 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v317 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v316, 0);
    v374 = v315;
    [v315 setTimingFunctions:v317];

    [v315 setValues:&off_88A0];
    [v315 setDuration:4.2];
    [v315 setBeginTimeMode:v377];
    [v315 setFillMode:kCAFillModeForwards];
    [v315 setRemovedOnCompletion:0];
    v318 = +[CAKeyframeAnimation animationWithKeyPath:@"shadowRadius"];
    [v318 setFrameInterval:0.0166666667];
    v319 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v320 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v321 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v322 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v323 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v324 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v325 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v326 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v319, v320, v321, v322, v323, v324, v325, 0);
    [v318 setTimingFunctions:v326];

    LODWORD(v327) = 3.75;
    uint64_t v328 = +[NSNumber numberWithFloat:v327];
    LODWORD(v329) = 4.0;
    v330 = +[NSNumber numberWithFloat:v329];
    LODWORD(v331) = 2.25;
    v332 = +[NSNumber numberWithFloat:v331];
    LODWORD(v333) = 4.0;
    v334 = +[NSNumber numberWithFloat:v333];
    LODWORD(v335) = 3.75;
    v336 = +[NSNumber numberWithFloat:v335];
    LODWORD(v337) = 4.0;
    v338 = +[NSNumber numberWithFloat:v337];
    LODWORD(v339) = 2.25;
    v340 = +[NSNumber numberWithFloat:v339];
    LODWORD(v341) = 1101398016;
    v342 = +[NSNumber numberWithFloat:v341];
    v343 = (void *)v328;
    v344 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v328, v330, v332, v334, v336, v338, v340, v342, 0);
    [v318 setValues:v344];

    self = v378;
    [v318 setDuration:4.2];
    [v318 setBeginTimeMode:v377];
    [v318 setFillMode:kCAFillModeForwards];
    [v318 setRemovedOnCompletion:0];
    [(CALayer *)v378->_ring0 addAnimation:v318 forKey:@"shadowRadius"];

    v5 = v371;
    v4 = v372;
    v8 = v369;
    v7 = v370;
  }
  v345 = [(CKSpotlightEffectView *)self layer];
  [v345 addSublayer:v8];

  objc_storeStrong((id *)&self->_SpotlightLayer, v8);
  dispatch_time_t v346 = dispatch_time(0, 5700000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_58B4;
  block[3] = &unk_81B0;
  id v380 = v8;
  id v347 = v8;
  dispatch_after(v346, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (CGPoint)_flippedFocusPoint
{
  [(CKSpotlightEffectView *)self focusPoint];
  double v4 = v3;
  double v6 = v5;
  [(CKSpotlightEffectView *)self bounds];
  double v8 = v7 - v6;
  double v9 = v4;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)_displayLinkCallback:(id)a3
{
  double v4 = CACurrentMediaTime();
  double v5 = v4 - self->_elasticLastTime;
  self->_elasticLastTime = v4;
  self->_elasticRemainingTime = v5 + self->_elasticRemainingTime;
  self->_double randomNumber = arc4random() % 0xC8 - 100;
  elasticFunctionPositionY = self->_elasticFunctionPositionY;
  [(CKSpotlightEffectView *)self _flippedFocusPoint];
  [(CKElasticFunction *)elasticFunctionPositionY setInput:v7];
  elasticFunctionPositionX = self->_elasticFunctionPositionX;
  [(CKElasticFunction *)self->_elasticFunctionPositionY velocity];
  double v10 = (v9 + 1000.0) / 2000.0 * 2.0 + -1.0;
  double randomNumber = (double)self->_randomNumber;
  [(CKElasticFunction *)self->_elasticFunctionPositionY velocity];
  [(CKElasticFunction *)elasticFunctionPositionX setInput:(v12 + 1000.0) / 2000.0 * 40.0 + -20.0 + v10 * randomNumber];
  for (double i = self->_elasticRemainingTime; i >= 0.001; self->_elasticRemainingTime = i)
  {
    [(CKElasticFunction *)self->_elasticFunctionPositionY step];
    [(CKElasticFunction *)self->_elasticFunctionPositionX step];
    double i = self->_elasticRemainingTime - 0.001;
  }
  [(CKSpotlightEffectView *)self _flippedFocusPoint];
  double v15 = v14;
  [(CKElasticFunction *)self->_elasticFunctionPositionX output];
  double v17 = v15 + v16;
  [(CKElasticFunction *)self->_elasticFunctionPositionY output];
  double v19 = v18;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  -[CALayer setPosition:](self->_ringParent, "setPosition:", v17, v19);
  -[CALayer setPosition:](self->_beamParent0, "setPosition:", v17, v19);
  -[CALayer setPosition:](self->_beamParent1, "setPosition:", v17, v19);
  double v20 = v19 / self->_screenBounds.height * -16.0 + 164.0 + -150.0;
  if (self->_leftToRight)
  {
    CATransform3DMakeRotation(&v32, (360.0 - v20) * 0.0174532925, 0.0, 0.0, 1.0);
    beamParent0 = self->_beamParent0;
    CATransform3D v31 = v32;
    [(CALayer *)beamParent0 setTransform:&v31];
    CATransform3DMakeRotation(&v30, (360.0 - (v19 / self->_screenBounds.height * -16.0 + 164.0 + -150.0)) * 0.0174532925, 0.0, 0.0, 1.0);
    beamParent1 = self->_beamParent1;
    CATransform3D v29 = v30;
    v23 = &v29;
  }
  else
  {
    CATransform3DMakeRotation(&v28, v20 * 0.0174532925, 0.0, 0.0, 1.0);
    v24 = self->_beamParent0;
    CATransform3D v27 = v28;
    [(CALayer *)v24 setTransform:&v27];
    CATransform3DMakeRotation(&v26, (v19 / self->_screenBounds.height * -16.0 + 164.0 + -150.0) * 0.0174532925, 0.0, 0.0, 1.0);
    beamParent1 = self->_beamParent1;
    CATransform3D v25 = v26;
    v23 = &v25;
  }
  -[CALayer setTransform:](beamParent1, "setTransform:", v23, *(_OWORD *)&v25.m11, *(_OWORD *)&v25.m13, *(_OWORD *)&v25.m21, *(_OWORD *)&v25.m23, *(_OWORD *)&v25.m31, *(_OWORD *)&v25.m33, *(_OWORD *)&v25.m41, *(_OWORD *)&v25.m43);
  +[CATransaction commit];
}

- (void)setFocusPoint:(CGPoint)a3
{
  if (self->_focusPoint.x != a3.x || self->_focusPoint.y != a3.y) {
    self->_focusPoint = a3;
  }
}

- (void)stopAnimation
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  elasticFunctionPositionY = self->_elasticFunctionPositionY;
  self->_elasticFunctionPositionY = 0;

  [(CALayer *)self->_SpotlightLayer removeFromSuperlayer];
  SpotlightLayer = self->_SpotlightLayer;
  self->_SpotlightLayer = 0;
}

+ (id)effectedZIndexes
{
  v2 = +[NSMutableIndexSet indexSetWithIndex:0];
  [v2 addIndex:3];
  id v3 = [v2 copy];

  return v3;
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

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (double)elasticLastTime
{
  return self->_elasticLastTime;
}

- (void)setElasticLastTime:(double)a3
{
  self->_elasticLastTime = a3;
}

- (double)elasticRemainingTime
{
  return self->_elasticRemainingTime;
}

- (void)setElasticRemainingTime:(double)a3
{
  self->_elasticRemainingTime = a3;
}

- (CKElasticFunction)elasticFunctionPositionY
{
  return self->_elasticFunctionPositionY;
}

- (void)setElasticFunctionPositionY:(id)a3
{
}

- (CKElasticFunction)elasticFunctionPositionX
{
  return self->_elasticFunctionPositionX;
}

- (void)setElasticFunctionPositionX:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elasticFunctionPositionX, 0);
  objc_storeStrong((id *)&self->_elasticFunctionPositionY, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->effectFileURL, 0);
  objc_storeStrong((id *)&self->messageImage, 0);
  objc_storeStrong((id *)&self->_ring1, 0);
  objc_storeStrong((id *)&self->_ring0, 0);
  objc_storeStrong((id *)&self->_ring0Parent, 0);
  objc_storeStrong((id *)&self->_ringParent, 0);
  objc_storeStrong((id *)&self->_circleParent, 0);
  objc_storeStrong((id *)&self->_darken, 0);
  objc_storeStrong((id *)&self->_watchParent, 0);
  objc_storeStrong((id *)&self->_watchRing, 0);
  objc_storeStrong((id *)&self->_beamPos0, 0);
  objc_storeStrong((id *)&self->_beamPos1, 0);
  objc_storeStrong((id *)&self->_beam0, 0);
  objc_storeStrong((id *)&self->_beamParent0, 0);
  objc_storeStrong((id *)&self->_beam1, 0);
  objc_storeStrong((id *)&self->_beamParent1, 0);
  objc_storeStrong((id *)&self->_dustCell, 0);
  objc_storeStrong((id *)&self->_dustEmitter, 0);

  objc_storeStrong((id *)&self->_SpotlightLayer, 0);
}

@end