@interface CKHeartEffectView
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (CKHeartEffectView)initWithFrame:(CGRect)a3;
- (NSURL)effectFileURL;
- (SCNVector3)calculateHandlePosition;
- (UIImage)messageImage;
- (char)messageOrientation;
- (id)_snapshotImage;
- (id)effectedZIndexes;
- (int64_t)zIndex;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForegroundNotification;
- (void)applicationWillResignActive;
- (void)setEffectFileURL:(id)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKHeartEffectView

- (CKHeartEffectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)CKHeartEffectView;
  v7 = -[CKHeartEffectView initWithFrame:](&v29, "initWithFrame:");
  if (v7)
  {
    v8 = -[CKHeartEffectSCNView initWithFrame:]([CKHeartEffectSCNView alloc], "initWithFrame:", x, y, width, height);
    heartView = v7->_heartView;
    v7->_heartView = v8;

    v10 = +[UIColor clearColor];
    [(CKHeartEffectSCNView *)v7->_heartView setBackgroundColor:v10];

    [(CKHeartEffectSCNView *)v7->_heartView setPreferredFramesPerSecond:60];
    [(CKHeartEffectView *)v7 addSubview:v7->_heartView];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 pathForResource:@"heart" ofType:@"scn"];
    v13 = +[NSURL fileURLWithPath:v12];
    v14 = +[SCNScene sceneWithURL:v13 options:0 error:0];

    v15 = [v14 rootNode];
    v16 = [v15 childNodeWithName:@"heart" recursively:1];

    *(float *)&double v17 = SCNVector3Zero.x;
    *(float *)&double v18 = SCNVector3Zero.y;
    *(float *)&double v19 = SCNVector3Zero.z;
    objc_msgSend(v16, "setScale:", v17, v18, v19);
    [(CKHeartEffectSCNView *)v7->_heartView setScene:v14];
    v20 = [(CKHeartEffectSCNView *)v7->_heartView scene];
    v21 = [v20 rootNode];
    uint64_t v22 = [v21 childNodeWithName:@"heart" recursively:1];
    heart = v7->_heart;
    v7->_heart = (SCNNode *)v22;

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v7 selector:"applicationWillResignActive" name:UIApplicationWillResignActiveNotification object:0];

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v7 selector:"applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v7 selector:"applicationDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v7 selector:"applicationWillEnterForegroundNotification" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v7;
}

- (void)startAnimation
{
  heartView = self->_heartView;
  [(CKHeartEffectView *)self bounds];
  -[CKHeartEffectSCNView setFrame:](heartView, "setFrame:");
  v4 = [(CKHeartEffectSCNView *)self->_heartView scene];
  [v4 setPaused:0];

  v5 = +[NSDate date];
  [v5 timeIntervalSinceReferenceDate];
  self->_startTime = v6;

  v7 = [(SCNNode *)self->_heart parentNode];
  self->_leftToRight = [(CKHeartEffectView *)self messageOrientation] == 0;
  [(CKHeartEffectView *)self calculateHandlePosition];
  v140 = v7;
  objc_msgSend(v7, "setPosition:");
  v8 = [(CKHeartEffectView *)self _snapshotImage];
  v9 = [(SCNNode *)self->_heart childNodes];
  v10 = [v9 firstObject];
  v11 = [v10 geometry];
  v12 = [v11 firstMaterial];
  v13 = [v12 reflective];
  [v13 setContents:v8];

  v14 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
  [v14 setKeyTimes:&off_46D0];
  if (self->_leftToRight) {
    *(float *)&double v15 = 0.000000017578;
  }
  else {
    *(float *)&double v15 = -0.000000017578;
  }
  LODWORD(v16) = -1286627784;
  LODWORD(v17) = -1321913946;
  double v18 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v15, v16, v17);
  v146[0] = v18;
  if (self->_leftToRight) {
    *(float *)&double v19 = 0.000000017578;
  }
  else {
    *(float *)&double v19 = -0.000000017578;
  }
  LODWORD(v20) = -1286627784;
  LODWORD(v21) = -1321913946;
  uint64_t v22 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v19, v20, v21);
  v146[1] = v22;
  LODWORD(v23) = dword_3348[!self->_leftToRight];
  LODWORD(v24) = 1040436901;
  LODWORD(v25) = -1116224567;
  v26 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v23, v24, v25);
  v146[2] = v26;
  LODWORD(v27) = dword_3350[!self->_leftToRight];
  LODWORD(v28) = 1060975150;
  LODWORD(v29) = -1103204065;
  v30 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v27, v28, v29);
  v146[3] = v30;
  LODWORD(v31) = dword_3358[!self->_leftToRight];
  LODWORD(v32) = 1074987537;
  LODWORD(v33) = -1111963033;
  v34 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v31, v32, v33);
  v146[4] = v34;
  v35 = +[NSArray arrayWithObjects:v146 count:5];
  [v14 setValues:v35];

  [v14 setDuration:6.65];
  [v14 setCalculationMode:kCAAnimationCubic];
  v139 = v14;
  [(SCNNode *)self->_heart addAnimation:v14 forKey:0];
  v36 = +[UIScreen mainScreen];
  [v36 bounds];
  double v38 = v37;
  double v40 = v39;

  if (+[UIDevice __ck_currentDeviceIsPadOrMac])
  {
    v41 = +[UIScreen mainScreen];
    [v41 bounds];
    double v44 = fmax(v42, v43) / 5000.0;
  }
  else
  {
    double v44 = fmax(v38, v40) / 1500.0;
  }
  v45 = +[CAKeyframeAnimation animationWithKeyPath:@"scale"];
  [v45 setKeyTimes:&off_46E8];
  v46 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", 0.0, 0.0, 0.0);
  v145[0] = v46;
  *(float *)&double v47 = v44;
  LODWORD(v48) = LODWORD(v47);
  LODWORD(v49) = LODWORD(v47);
  v50 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v47, v48, v49);
  v145[1] = v50;
  double v51 = v44 * 1.1375;
  *(float *)&double v51 = v44 * 1.1375;
  LODWORD(v52) = LODWORD(v51);
  LODWORD(v53) = LODWORD(v51);
  v54 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", v51, v52, v53);
  v145[2] = v54;
  v55 = +[NSValue valueWithSCNVector3:](NSValue, "valueWithSCNVector3:", 0.0, 0.0, 0.0);
  v145[3] = v55;
  v56 = +[NSArray arrayWithObjects:v145 count:4];
  [v45 setValues:v56];

  v138 = v45;
  [v45 setDuration:6.65];
  [v45 setCalculationMode:kCAAnimationCubic];
  [(SCNNode *)self->_heart addAnimation:v45 forKey:0];
  v57 = +[CAKeyframeAnimation animationWithKeyPath:@"eulerAngles.x"];
  [v57 setKeyTimes:&off_4700];
  v134 = +[NSNumber numberWithFloat:0.0];
  v144[0] = v134;
  LODWORD(v58) = -1118406832;
  v59 = +[NSNumber numberWithFloat:v58];
  v144[1] = v59;
  LODWORD(v60) = -1137685620;
  v61 = +[NSNumber numberWithFloat:v60];
  v144[2] = v61;
  LODWORD(v62) = 1039807965;
  v63 = +[NSNumber numberWithFloat:v62];
  v144[3] = v63;
  LODWORD(v64) = -1107675683;
  v65 = +[NSNumber numberWithFloat:v64];
  v144[4] = v65;
  LODWORD(v66) = -1099403851;
  v67 = +[NSNumber numberWithFloat:v66];
  v144[5] = v67;
  v68 = +[NSArray arrayWithObjects:v144 count:6];
  [v57 setValues:v68];

  v136 = v57;
  [v57 setDuration:6.65];
  [v57 setCalculationMode:kCAAnimationCubic];
  [(SCNNode *)self->_heart addAnimation:v57 forKey:0];
  v69 = +[CAKeyframeAnimation animationWithKeyPath:@"eulerAngles.y"];
  [v69 setKeyTimes:&off_4718];
  *(void *)&double v70 = 0x8000000080000000;
  if (self->_leftToRight) {
    *(float *)&double v70 = 0.0;
  }
  v71 = +[NSNumber numberWithFloat:v70];
  v143[0] = v71;
  LODWORD(v72) = dword_3380[!self->_leftToRight];
  v73 = +[NSNumber numberWithFloat:v72];
  v143[1] = v73;
  LODWORD(v74) = dword_3388[!self->_leftToRight];
  v75 = +[NSNumber numberWithFloat:v74];
  v143[2] = v75;
  LODWORD(v76) = dword_3390[!self->_leftToRight];
  v77 = +[NSNumber numberWithFloat:v76];
  v143[3] = v77;
  LODWORD(v78) = dword_3398[!self->_leftToRight];
  v79 = +[NSNumber numberWithFloat:v78];
  v143[4] = v79;
  v80 = +[NSArray arrayWithObjects:v143 count:5];
  [v69 setValues:v80];

  v135 = v69;
  [v69 setDuration:6.65];
  [v69 setCalculationMode:kCAAnimationCubic];
  [(SCNNode *)self->_heart addAnimation:v69 forKey:0];
  v81 = +[CAKeyframeAnimation animationWithKeyPath:@"eulerAngles.z"];
  [v81 setKeyTimes:&off_4730];
  LODWORD(v82) = 1061259575;
  LODWORD(v83) = 1000593162;
  LODWORD(v84) = 1062551421;
  LODWORD(v85) = 1.0;
  v141 = +[CAMediaTimingFunction functionWithControlPoints:v82 :v83 :v84 :v85];
  v142[0] = v141;
  LODWORD(v86) = 1050488603;
  LODWORD(v87) = 1036563513;
  LODWORD(v88) = 1063541277;
  v137 = +[CAMediaTimingFunction functionWithControlPoints:v86 :0.0 :v87 :v88];
  v142[1] = v137;
  LODWORD(v89) = 1048106238;
  LODWORD(v90) = -1105417208;
  LODWORD(v91) = 1058306785;
  LODWORD(v92) = 1061276353;
  v133 = +[CAMediaTimingFunction functionWithControlPoints:v89 :v90 :v91 :v92];
  v142[2] = v133;
  LODWORD(v93) = 1050220167;
  LODWORD(v94) = 1059195978;
  LODWORD(v95) = 1065529377;
  LODWORD(v96) = -0.25;
  v132 = +[CAMediaTimingFunction functionWithControlPoints:v93 :v96 :v94 :v95];
  v142[3] = v132;
  LODWORD(v97) = 1038979432;
  LODWORD(v98) = 1058088681;
  LODWORD(v99) = 1061930664;
  LODWORD(v100) = 1056058638;
  v101 = +[CAMediaTimingFunction functionWithControlPoints:v100 :v97 :v98 :v99];
  v142[4] = v101;
  LODWORD(v102) = 1055320441;
  LODWORD(v103) = -1109846393;
  LODWORD(v104) = 1065755869;
  LODWORD(v105) = 1057333707;
  v106 = +[CAMediaTimingFunction functionWithControlPoints:v102 :v103 :v105 :v104];
  v142[5] = v106;
  LODWORD(v107) = 1037771473;
  LODWORD(v108) = 1058742993;
  LODWORD(v109) = 1061695783;
  LODWORD(v110) = 1054078927;
  v111 = +[CAMediaTimingFunction functionWithControlPoints:v110 :v107 :v108 :v109];
  v142[6] = v111;
  LODWORD(v112) = 1052401205;
  LODWORD(v113) = -1095820640;
  LODWORD(v114) = 1066292740;
  LODWORD(v115) = 1057333707;
  v116 = +[CAMediaTimingFunction functionWithControlPoints:v112 :v113 :v115 :v114];
  v142[7] = v116;
  LODWORD(v117) = 1051226800;
  LODWORD(v118) = 1060370383;
  LODWORD(v119) = 1054078927;
  LODWORD(v120) = 1056058638;
  v121 = +[CAMediaTimingFunction functionWithControlPoints:v119 :v117 :v120 :v118];
  v142[8] = v121;
  LODWORD(v122) = 1051495236;
  LODWORD(v123) = -1094411354;
  LODWORD(v124) = 1059531522;
  LODWORD(v125) = 1.0;
  v126 = +[CAMediaTimingFunction functionWithControlPoints:v122 :v123 :v124 :v125];
  v142[9] = v126;
  LODWORD(v127) = 1051897889;
  LODWORD(v128) = 1059128869;
  LODWORD(v129) = 1066905108;
  v130 = +[CAMediaTimingFunction functionWithControlPoints:v127 :0.0 :v128 :v129];
  v142[10] = v130;
  v131 = +[NSArray arrayWithObjects:v142 count:11];
  [v81 setTimingFunctions:v131];

  [v81 setValues:&off_4748];
  [v81 setDuration:7.0];
  [(SCNNode *)self->_heart addAnimation:v81 forKey:0];
}

- (SCNVector3)calculateHandlePosition
{
  v3 = [(SCNNode *)self->_heart parentNode];
  heartView = self->_heartView;
  [v3 position];
  -[CKHeartEffectSCNView projectPoint:](heartView, "projectPoint:");
  int v6 = v5;
  LODWORD(heartView) = self->_leftToRight;
  [(CKHeartEffectView *)self messageRect];
  if (heartView)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v7);
    [(CKHeartEffectView *)self messageRect];
    double v13 = -0.25;
  }
  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v7);
    [(CKHeartEffectView *)self messageRect];
    double v13 = 0.25;
  }
  float v14 = MaxX + v12 * v13;
  [(CKHeartEffectView *)self messageRect];
  CGFloat MinY = CGRectGetMinY(v29);
  HIDWORD(v16) = 1076985856;
  CGFloat v17 = MinY + 17.5;
  *(float *)&double v16 = v17;
  *(float *)&CGFloat v17 = v14;
  LODWORD(v18) = v6;
  -[CKHeartEffectSCNView unprojectPoint:](self->_heartView, "unprojectPoint:", v17, v16, v18);
  float v20 = v19;
  float v22 = v21;
  float v24 = v23;

  float v25 = v20;
  float v26 = v22;
  float v27 = v24;
  result.z = v27;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (void)stopAnimation
{
  id v2 = [(CKHeartEffectSCNView *)self->_heartView scene];
  [v2 setPaused:1];
}

- (void)applicationWillResignActive
{
  v3 = [(CKHeartEffectSCNView *)self->_heartView scene];
  [v3 setPaused:0];

  heartView = self->_heartView;

  [(CKHeartEffectSCNView *)heartView setEnableBackgroundRendering:1];
}

- (void)applicationDidBecomeActive
{
  v3 = [(CKHeartEffectSCNView *)self->_heartView scene];
  [v3 setPaused:0];

  heartView = self->_heartView;

  [(CKHeartEffectSCNView *)heartView setEnableBackgroundRendering:1];
}

- (void)applicationDidEnterBackground
{
  v3 = [(CKHeartEffectSCNView *)self->_heartView scene];
  [v3 setPaused:1];

  heartView = self->_heartView;

  [(CKHeartEffectSCNView *)heartView setEnableBackgroundRendering:0];
}

- (void)applicationWillEnterForegroundNotification
{
  v3 = [(CKHeartEffectSCNView *)self->_heartView scene];
  [v3 setPaused:0];

  heartView = self->_heartView;

  [(CKHeartEffectSCNView *)heartView setEnableBackgroundRendering:1];
}

- (void)setMessageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_messageRect = &self->_messageRect;
  if (!CGRectEqualToRect(self->_messageRect, a3))
  {
    p_messageRect->origin.CGFloat x = x;
    p_messageRect->origin.CGFloat y = y;
    p_messageRect->size.CGFloat width = width;
    p_messageRect->size.CGFloat height = height;
    if (self->_startTime == 0.0
      || (+[NSDate date],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v9 timeIntervalSinceReferenceDate],
          double v11 = v10 - self->_startTime,
          v9,
          v11 < 2.0))
    {
      [(CKHeartEffectView *)self calculateHandlePosition];
      int v13 = v12;
      int v15 = v14;
      int v17 = v16;
      id v21 = [(SCNNode *)self->_heart parentNode];
      LODWORD(v18) = v13;
      LODWORD(v19) = v15;
      LODWORD(v20) = v17;
      objc_msgSend(v21, "setPosition:", v18, v19, v20);
    }
  }
}

- (id)_snapshotImage
{
  v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4 * 0.5;

  int v6 = [(CKHeartEffectView *)self window];
  uint64_t v7 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v7 setScale:v5];
  id v8 = objc_alloc((Class)UIGraphicsImageRenderer);
  [v6 frame];
  id v11 = objc_msgSend(v8, "initWithSize:format:", v7, v9, v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_25D0;
  v15[3] = &unk_41E0;
  id v16 = v6;
  id v12 = v6;
  int v13 = [v11 imageWithActions:v15];

  return v13;
}

- (id)effectedZIndexes
{
  return +[NSIndexSet indexSetWithIndex:3];
}

- (int64_t)zIndex
{
  return self->zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->zIndeCGFloat x = a3;
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
  objc_storeStrong((id *)&self->_heart, 0);

  objc_storeStrong((id *)&self->_heartView, 0);
}

@end