@interface ZWLensZoomView
- (BOOL)_effectRequiresQuartzFilter:(id)a3;
- (BOOL)lensResizingHandlesShowing;
- (BOOL)offsetZoomWindowFromFinger;
- (BOOL)roundedLensCorners;
- (CABackdropLayer)effectBackdropLayer;
- (CABackdropLayer)zoomBackdropLayer;
- (CAPortalLayer)islandPortalLayer;
- (CAReplicatorLayer)effectReplicatorLayer;
- (CAReplicatorLayer)zoomReplicatorLayer;
- (CAShapeLayer)maskLayer;
- (CGPoint)updateZoomPanOffset:(CGPoint)a3 zoomFactor:(double)a4 roundedLensCorners:(BOOL)a5 animated:(BOOL)a6 animationDuration:(double)a7 completion:(id)a8;
- (CGPoint)zoomPanOffset;
- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5;
- (CGRect)effectiveZoomViewFrame;
- (CGRect)sampleRect;
- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 zoomFactor:(double)a4;
- (CGSize)sampledContentSizeWithZoomFactor:(double)a3;
- (UIView)effectView;
- (UIView)zoomView;
- (ZWLensZoomView)initWithFrame:(CGRect)a3;
- (double)zoomFactor;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)makePortalVisible:(BOOL)a3 withGrayScaleFilter:(BOOL)a4;
- (void)requestPortalInfo;
- (void)setEffectBackdropLayer:(id)a3;
- (void)setEffectReplicatorLayer:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setIslandPortalLayer:(id)a3;
- (void)setLensResizingHandlesShowing:(BOOL)a3;
- (void)setMaskLayer:(id)a3;
- (void)setOffsetZoomWindowFromFinger:(BOOL)a3;
- (void)setRoundedLensCorners:(BOOL)a3;
- (void)setZoomBackdropLayer:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)setZoomReplicatorLayer:(id)a3;
- (void)setZoomView:(id)a3;
- (void)showLensResizingHandlesShowing:(BOOL)a3;
- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation ZWLensZoomView

- (ZWLensZoomView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)ZWLensZoomView;
  v3 = -[ZWLensZoomView initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ZWLensZoomView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = +[UIColor clearColor];
    [(ZWLensZoomView *)v4 setBackgroundColor:v5];

    [(ZWLensZoomView *)v4 setClipsToBounds:1];
    [(ZWLensZoomView *)v4 setZoomFactor:AXZoomMinimumZoomLevel];
    -[ZWLensZoomView setZoomPanOffset:](v4, "setZoomPanOffset:", CGPointZero.x, CGPointZero.y);
    id v6 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v10 = objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(ZWLensZoomView *)v4 setZoomView:v10];
    [(ZWLensZoomView *)v4 addSubview:v10];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = objc_msgSend(v10, "ax_pinConstraintsInAllDimensionsToView:", v4);
    id v12 = objc_alloc_init((Class)CAReplicatorLayer);
    [v12 setAllowsHitTesting:0];
    [v12 setInstanceCount:2];
    [(ZWLensZoomView *)v4 setZoomReplicatorLayer:v12];
    v13 = [v10 layer];
    [v13 addSublayer:v12];

    id v14 = objc_alloc_init((Class)CABackdropLayer);
    [v14 setEnabled:1];
    [v14 setAllowsHitTesting:1];
    [(ZWLensZoomView *)v4 setZoomBackdropLayer:v14];
    if (ZWEnableLensEyeCandy([v12 addSublayer:v14]) && ZWUseVibrantBlendModes())
    {
      v15 = +[CAShapeLayer layer];
      v16 = [(ZWLensZoomView *)v4 zoomBackdropLayer];
      [v16 setMask:v15];

      [(ZWLensZoomView *)v4 setMaskLayer:v15];
    }
    id v17 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(ZWLensZoomView *)v4 setEffectView:v17];
    [(ZWLensZoomView *)v4 addSubview:v17];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v18 = objc_msgSend(v17, "ax_pinConstraintsInAllDimensionsToView:", v4);
    id v19 = objc_alloc_init((Class)CAReplicatorLayer);

    [v19 setAllowsHitTesting:0];
    [v19 setInstanceCount:2];
    [(ZWLensZoomView *)v4 setEffectReplicatorLayer:v19];
    v20 = [v17 layer];
    [v20 addSublayer:v19];

    v21 = [v17 layer];
    [v21 setAllowsHitTesting:0];

    id v22 = objc_alloc_init((Class)CABackdropLayer);
    [v22 setEnabled:1];
    [v22 setAllowsHitTesting:0];
    v23 = +[CAFilter filterWithType:kCAFilterColorInvert];
    v29 = v23;
    v24 = +[NSArray arrayWithObjects:&v29 count:1];
    [v22 setFilters:v24];

    [(ZWLensZoomView *)v4 setEffectBackdropLayer:v22];
    [v19 addSublayer:v22];
    v25 = [(ZWLensZoomView *)v4 effectView];
    [(ZWLensZoomView *)v4 sendSubviewToBack:v25];

    id v26 = objc_alloc_init((Class)CAPortalLayer);
    [(ZWLensZoomView *)v4 setIslandPortalLayer:v26];

    [(ZWLensZoomView *)v4 requestPortalInfo];
    [(ZWLensZoomView *)v4 makePortalVisible:0 withGrayScaleFilter:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ZWLensZoomView;
  [(ZWLensZoomView *)&v8 layoutSubviews];
  [(ZWLensZoomView *)self zoomPanOffset];
  double v4 = v3;
  double v6 = v5;
  [(ZWLensZoomView *)self zoomFactor];
  -[ZWLensZoomView updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:](self, "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:", [(ZWLensZoomView *)self roundedLensCorners], 0, 0, v4, v6, v7, -1.0);
}

- (CGSize)sampledContentSizeWithZoomFactor:(double)a3
{
  [(ZWLensZoomView *)self bounds];

  -[ZWLensZoomView _prescaledSizeForFinalSize:zoomFactor:](self, "_prescaledSizeForFinalSize:zoomFactor:", v5, v6, a3);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)showLensResizingHandlesShowing:(BOOL)a3
{
  [(ZWLensZoomView *)self setLensResizingHandlesShowing:a3];

  [(ZWLensZoomView *)self setNeedsLayout];
}

- (CGRect)effectiveZoomViewFrame
{
  double v3 = [(ZWLensZoomView *)self zoomReplicatorLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(ZWLensZoomView *)self zoomReplicatorLayer];
  [v12 position];
  double v14 = v13;
  double v16 = v15;

  -[ZWLensZoomView _effectiveRectForBounds:position:scaleFactor:](self, "_effectiveRectForBounds:position:scaleFactor:", v5, v7, v9, v11, v14, v16, 1.0);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.x = v17;
  return result;
}

- (void)animationDidStart:(id)a3
{
  ZOTMainScreenSize();
  double v5 = v4;
  ZOTMainScreenSize();
  if (v5 < v6) {
    double v5 = v6;
  }
  double v7 = [(ZWLensZoomView *)self zoomBackdropLayer];
  [v7 setMarginWidth:v5];

  ZOTMainScreenSize();
  double v9 = v8;
  ZOTMainScreenSize();
  if (v9 < v10) {
    double v9 = v10;
  }
  id v11 = [(ZWLensZoomView *)self effectBackdropLayer];
  [v11 setMarginWidth:v9];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  double v5 = [(ZWLensZoomView *)self zoomBackdropLayer];
  [v5 setMarginWidth:0.0];

  double v6 = [(ZWLensZoomView *)self effectBackdropLayer];
  [v6 setMarginWidth:0.0];

  if ([(ZWLensZoomView *)self roundedLensCorners])
  {
    [(ZWLensZoomView *)self zoomFactor];
    CGFloat v8 = 1.0 / v7;
    [(ZWLensZoomView *)self zoomFactor];
    CGAffineTransformMakeScale(&m, v8, 1.0 / v9);
    CATransform3DMakeAffineTransform(&v14, &m);
    double v10 = [(ZWLensZoomView *)self maskLayer];
    CATransform3D v12 = v14;
    [v10 setTransform:&v12];
  }
  else
  {
    id v11 = [(ZWLensZoomView *)self layer];
    [v11 setCornerRadius:0.0];
  }
}

- (CGPoint)updateZoomPanOffset:(CGPoint)a3 zoomFactor:(double)a4 roundedLensCorners:(BOOL)a5 animated:(BOOL)a6 animationDuration:(double)a7 completion:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  double y = a3.y;
  double x = a3.x;
  double v15 = (void (**)(void))a8;
  [(ZWLensZoomView *)self zoomFactor];
  double v17 = v16;
  [(ZWLensZoomView *)self setZoomFactor:a4];
  -[ZWLensZoomView setZoomPanOffset:](self, "setZoomPanOffset:", x, y);
  [(ZWLensZoomView *)self setRoundedLensCorners:v10];
  [(ZWLensZoomView *)self bounds];
  if (CGRectIsEmpty(v233))
  {
    if (v15) {
      v15[2](v15);
    }
    CGFloat v18 = CGPointZero.x;
    CGFloat v19 = CGPointZero.y;
    goto LABEL_65;
  }
  BOOL v20 = vabdd_f64(a4, AXZoomMinimumZoomLevel) <= 0.0001;
  v229[0] = _NSConcreteStackBlock;
  v229[1] = 3221225472;
  v229[2] = __106__ZWLensZoomView_updateZoomPanOffset_zoomFactor_roundedLensCorners_animated_animationDuration_completion___block_invoke;
  v229[3] = &unk_78F28;
  char v21 = AXZoomMinimumZoomLevel >= a4 || v20;
  v229[4] = self;
  char v231 = v21;
  v230 = v15;
  id v22 = objc_retainBlock(v229);
  v23 = v22;
  if (!v9)
  {
    v24 = [(ZWLensZoomView *)self zoomReplicatorLayer];
    [v24 removeAllAnimations];

    v23 = 0;
  }
  double v200 = v17;
  double v201 = a7;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  +[CATransaction setCompletionBlock:v23];
  if ((v21 & 1) == 0)
  {
    v25 = [(ZWLensZoomView *)self zoomBackdropLayer];
    [v25 setEnabled:1];
  }
  [(ZWLensZoomView *)self zoomPanOffset];
  double v213 = v26;
  double v28 = v27;
  [(ZWLensZoomView *)self bounds];
  double v217 = v30;
  double v218 = v29;
  double v32 = v31;
  double v216 = v33;
  [(ZWLensZoomView *)self zw_boundsCenter];
  double v35 = v34;
  double v37 = v36;
  [(ZWLensZoomView *)self bounds];
  double v39 = v38;
  double v41 = v40;
  [(ZWLensZoomView *)self zoomFactor];
  -[ZWLensZoomView _prescaledSizeForFinalSize:zoomFactor:](self, "_prescaledSizeForFinalSize:zoomFactor:", v39, v41, v42);
  double v44 = v43;
  double v46 = v45;
  double v205 = v37;
  double v47 = v28 + v37;
  [(ZWLensZoomView *)self bounds];
  double v49 = v48 * 0.5 - ZWZoomEdgeSlackAmount();
  if ([(ZWLensZoomView *)self offsetZoomWindowFromFinger]) {
    double v50 = v49;
  }
  else {
    double v50 = -0.0;
  }
  double v51 = v47 + v50;
  double v52 = 0.0;
  double v203 = v46;
  double v204 = v44;
  -[ZWLensZoomView _effectiveRectForBounds:position:scaleFactor:](self, "_effectiveRectForBounds:position:scaleFactor:", 0.0, 0.0, v44, v46, v213 + v35, v51, 1.0);
  double v57 = fabs(v53);
  if (v53 >= v218) {
    double v57 = -0.0;
  }
  double v58 = v213 + v57;
  double v59 = v53 + v55;
  CGFloat v202 = v32;
  if (v59 <= v32) {
    double v60 = 0.0;
  }
  else {
    double v60 = v59 - v32;
  }
  double v61 = v58 - v60;
  double v62 = fabs(v54);
  if (v54 >= v217) {
    double v62 = -0.0;
  }
  double v63 = v28 + v62;
  double v64 = v54 + v56;
  if (v64 <= v216) {
    double v65 = 0.0;
  }
  else {
    double v65 = v64 - v216;
  }
  double v66 = v63 - v65;
  if ([(ZWLensZoomView *)self offsetZoomWindowFromFinger]) {
    double v67 = v49;
  }
  else {
    double v67 = -0.0;
  }
  long long v214 = *(_OWORD *)&CATransform3DIdentity.m33;
  long long v215 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v228.m31 = v215;
  *(_OWORD *)&v228.m33 = v214;
  long long v211 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v212 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v228.m41 = v212;
  *(_OWORD *)&v228.m43 = v211;
  long long v209 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v210 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v228.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v228.m13 = v209;
  long long v207 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v208 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v228.m21 = v208;
  *(_OWORD *)&v228.m23 = v207;
  if ([(ZWLensZoomView *)self offsetZoomWindowFromFinger]) {
    double v68 = v49;
  }
  else {
    double v68 = -0.0;
  }
  double v69 = v66;
  *(_OWORD *)&v227.m31 = v215;
  *(_OWORD *)&v227.m33 = v214;
  *(_OWORD *)&v227.m41 = v212;
  *(_OWORD *)&v227.m43 = v211;
  *(_OWORD *)&v227.m11 = v210;
  *(_OWORD *)&v227.m13 = v209;
  *(_OWORD *)&v227.m21 = v208;
  *(_OWORD *)&v227.m23 = v207;
  CATransform3DTranslate(&v228, &v227, -v61, -(v66 + v68), 0.0);
  [(ZWLensZoomView *)self zoomFactor];
  CGFloat v71 = v70;
  [(ZWLensZoomView *)self zoomFactor];
  CATransform3D v226 = v228;
  CATransform3DScale(&v227, &v226, v71, v72, 1.0);
  CATransform3D v228 = v227;
  if (v10) {
    double v52 = ZWLensCornerRadius();
  }
  if (!v9 || v52 != 0.0)
  {
    v73 = [(ZWLensZoomView *)self layer];
    [v73 setCornerRadius:v52];
  }
  double v74 = v35 + v61;
  double v75 = v67 + v205 + v69;
  if (v9)
  {
    double v76 = v201;
    if (v201 <= 0.0) {
      double v76 = ZWDefaultZoomAnimationDuration();
    }
    v77 = +[CABasicAnimation animationWithKeyPath:@"instanceTransform"];
    v78 = [(ZWLensZoomView *)self zoomReplicatorLayer];
    v79 = v78;
    if (v78) {
      [v78 instanceTransform];
    }
    else {
      memset(v225, 0, sizeof(v225));
    }
    v80 = +[NSValue valueWithCATransform3D:v225];
    [v77 setFromValue:v80];

    CATransform3D v227 = v228;
    v81 = +[NSValue valueWithCATransform3D:&v227];
    [v77 setToValue:v81];

    [v77 setDuration:v76];
    [v77 setDelegate:self];
    [v77 setCumulative:1];
    v82 = [(ZWLensZoomView *)self zoomReplicatorLayer];
    [v82 addAnimation:v77 forKey:@"RepInstanceTransform"];

    [(ZWLensZoomView *)self zoomFactor];
    if (v83 >= v200)
    {
      [(ZWLensZoomView *)self zoomFactor];
      if (v90 != v200) {
        goto LABEL_49;
      }
      v91 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v91 position];
      double v93 = v92;
      double v95 = v94;

      if (v93 == v74 && v95 == v75) {
        goto LABEL_49;
      }
      usleep(0x3E8u);
      v84 = +[CABasicAnimation animationWithKeyPath:@"position"];
      [(ZWLensZoomView *)self zoomReplicatorLayer];
      v96 = v206 = v22;
      [v96 position];
      v97 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
      [v84 setFromValue:v97];

      v98 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v74, v75);
      [v84 setToValue:v98];

      [v84 setDuration:v76];
      v99 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v99 addAnimation:v84 forKey:@"RepPosition"];

      v89 = +[CABasicAnimation animationWithKeyPath:@"position"];
      v100 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v100 position];
      v101 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
      [v89 setFromValue:v101];

      id v22 = v206;
      v102 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v74, v75);
      [v89 setToValue:v102];

      [v89 setDuration:v76];
      v103 = [(ZWLensZoomView *)self effectReplicatorLayer];
      [v103 addAnimation:v89 forKey:@"FilterPosition"];
    }
    else
    {
      v84 = +[CABasicAnimation animationWithKeyPath:@"position"];
      v85 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v85 position];
      v86 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
      [v84 setFromValue:v86];

      v87 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v87 position];
      v88 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
      [v84 setToValue:v88];

      [v84 setDuration:v76];
      v89 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v89 addAnimation:v84 forKey:@"RepPosition"];
    }

LABEL_49:
  }
  double v104 = fabs(v75);
  if (fabs(v74) != INFINITY && v104 != INFINITY)
  {
    v234.origin.double x = 0.0;
    v234.origin.double y = 0.0;
    v234.size.double height = v203;
    v234.size.double width = v204;
    if (!CGRectIsEmpty(v234))
    {
      v106 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      objc_msgSend(v106, "setPosition:", v74, v75);

      v107 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      objc_msgSend(v107, "setBounds:", 0.0, 0.0, v204, v203);

      v108 = [(ZWLensZoomView *)self zoomBackdropLayer];
      objc_msgSend(v108, "setBounds:", 0.0, 0.0, v204, v203);

      v235.origin.double x = 0.0;
      v235.origin.double y = 0.0;
      v235.size.double width = v204;
      v235.size.double height = v203;
      double MidX = CGRectGetMidX(v235);
      v236.origin.double x = 0.0;
      v236.origin.double y = 0.0;
      v236.size.double width = v204;
      v236.size.double height = v203;
      double MidY = CGRectGetMidY(v236);
      v111 = [(ZWLensZoomView *)self zoomBackdropLayer];
      objc_msgSend(v111, "setPosition:", MidX, MidY);

      CATransform3D v224 = v228;
      v112 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      CATransform3D v223 = v224;
      [v112 setInstanceTransform:&v223];

      v113 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v113 bounds];
      double v115 = v114;
      double v117 = v116;
      double v119 = v118;
      double v121 = v120;
      v122 = [(ZWLensZoomView *)self effectReplicatorLayer];
      objc_msgSend(v122, "setBounds:", v115, v117, v119, v121);

      v123 = [(ZWLensZoomView *)self zoomReplicatorLayer];
      [v123 position];
      double v125 = v124;
      double v127 = v126;
      v128 = [(ZWLensZoomView *)self effectReplicatorLayer];
      objc_msgSend(v128, "setPosition:", v125, v127);

      v129 = [(ZWLensZoomView *)self zoomBackdropLayer];
      [v129 bounds];
      double v131 = v130;
      double v133 = v132;
      double v135 = v134;
      double v137 = v136;
      v138 = [(ZWLensZoomView *)self effectBackdropLayer];
      objc_msgSend(v138, "setBounds:", v131, v133, v135, v137);

      v139 = [(ZWLensZoomView *)self zoomBackdropLayer];
      [v139 position];
      double v141 = v140;
      double v143 = v142;
      v144 = [(ZWLensZoomView *)self effectBackdropLayer];
      objc_msgSend(v144, "setPosition:", v141, v143);
    }
  }
  if (v10)
  {
    v145 = [(ZWLensZoomView *)self maskLayer];
    v146 = [(ZWLensZoomView *)self zoomBackdropLayer];
    [v146 setMask:v145];

    ZWInnerLensBorderForBounds([(ZWLensZoomView *)self lensResizingHandlesShowing], v218, v217, v202, v216);
    id v147 = objc_claimAutoreleasedReturnValue();
    id v148 = [v147 CGPath];
    v149 = [(ZWLensZoomView *)self maskLayer];
    [v149 setPath:v148];

    id v150 = +[UIColor whiteColor];
    id v151 = [v150 CGColor];
    v152 = [(ZWLensZoomView *)self maskLayer];
    [v152 setFillColor:v151];

    id v153 = +[UIColor whiteColor];
    id v154 = [v153 CGColor];
    v155 = [(ZWLensZoomView *)self maskLayer];
    [v155 setStrokeColor:v154];

    double v156 = ZWLensInnerBorderWidth();
    v157 = [(ZWLensZoomView *)self maskLayer];
    [v157 setLineWidth:v156];

    id v158 = +[UIColor clearColor];
    id v159 = [v158 CGColor];
    v160 = [(ZWLensZoomView *)self maskLayer];
    [v160 setBackgroundColor:v159];

    v161 = [(ZWLensZoomView *)self zoomBackdropLayer];
    [v161 position];
    double v163 = v162;
    double v165 = v164;
    v166 = [(ZWLensZoomView *)self maskLayer];
    objc_msgSend(v166, "setPosition:", v163, v165);

    v167 = [(ZWLensZoomView *)self layer];
    [v167 bounds];
    double v169 = v168;
    double v171 = v170;
    double v173 = v172;
    double v175 = v174;
    v176 = [(ZWLensZoomView *)self maskLayer];
    objc_msgSend(v176, "setBounds:", v169, v171, v173, v175);

    if (v9)
    {
      v177 = [(ZWLensZoomView *)self maskLayer];
      id v178 = v177;
      v222[4] = v215;
      v222[5] = v214;
      v222[6] = v212;
      v222[7] = v211;
      v222[0] = v210;
      v222[1] = v209;
      v222[2] = v208;
      v222[3] = v207;
      v179 = (CATransform3D *)v222;
    }
    else
    {
      [(ZWLensZoomView *)self zoomFactor];
      CGFloat v194 = 1.0 / v193;
      [(ZWLensZoomView *)self zoomFactor];
      CGAffineTransformMakeScale(&m, v194, 1.0 / v195);
      CATransform3DMakeAffineTransform(&v221, &m);
      v177 = [(ZWLensZoomView *)self maskLayer];
      id v178 = v177;
      CATransform3D v219 = v221;
      v179 = &v219;
    }
    [v177 setTransform:v179];
  }
  else
  {
    v180 = [(ZWLensZoomView *)self zoomBackdropLayer];
    [v180 setMask:0];

    v181 = [(ZWLensZoomView *)self layer];
    [v181 bounds];
    double v183 = v182;
    double v185 = v184;
    double v187 = v186;
    double v189 = v188;
    v190 = [(ZWLensZoomView *)self maskLayer];
    objc_msgSend(v190, "setFrame:", v183, v185, v187, v189);

    id v178 = +[UIColor whiteColor];
    id v191 = [v178 CGColor];
    v192 = [(ZWLensZoomView *)self maskLayer];
    [v192 setBackgroundColor:v191];
  }
  -[ZWLensZoomView setZoomPanOffset:](self, "setZoomPanOffset:", v61, v69);
  +[CATransaction commit];
  if (!v9) {
    ((void (*)(void *))v22[2])(v22);
  }
  [(ZWLensZoomView *)self zoomPanOffset];
  CGFloat v18 = v196;
  CGFloat v19 = v197;

LABEL_65:
  double v198 = v18;
  double v199 = v19;
  result.double y = v199;
  result.double x = v198;
  return result;
}

uint64_t __106__ZWLensZoomView_updateZoomPanOffset_zoomFactor_roundedLensCorners_animated_animationDuration_completion___block_invoke(uint64_t a1)
{
  BOOL v2 = *(unsigned char *)(a1 + 48) == 0;
  double v3 = [*(id *)(a1 + 32) zoomBackdropLayer];
  [v3 setEnabled:v2];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (CGRect)sampleRect
{
  BOOL v2 = [(ZWLensZoomView *)self zoomReplicatorLayer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  [v2 position];
  double v8 = v7;
  [v2 bounds];
  double v10 = v8 - v9 * 0.5;
  [v2 position];
  double v12 = v11;
  [v2 bounds];
  double v14 = v12 - v13 * 0.5;

  double v15 = v10;
  double v16 = v14;
  double v17 = v4;
  double v18 = v6;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)_effectRequiresQuartzFilter:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:AXZoomLensEffectInvertColors] & 1) != 0
    || ([v3 isEqualToString:AXZoomLensEffectBlackAndWhite] & 1) != 0
    || ([v3 isEqualToString:AXZoomLensEffectBlackAndWhiteInverted] & 1) != 0
    || ([v3 isEqualToString:AXZoomLensEffectHueAdjust] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    if (([v3 isEqualToString:AXZoomLensEffectLowLight] & 1) == 0
      && ([v3 isEqualToString:AXZoomLensEffectNone] & 1) == 0)
    {
      _AXAssert();
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = (void (**)(void))a5;
  double v10 = &AXColorizeFormatLog_ptr;
  +[CATransaction begin];
  +[CATransaction setDisableActions:v6];
  if (v6) {
    double v11 = v9;
  }
  else {
    double v11 = 0;
  }
  +[CATransaction setCompletionBlock:v11];
  unsigned int v12 = [(ZWLensZoomView *)self _effectRequiresQuartzFilter:v8];
  double v13 = [(ZWLensZoomView *)self effectReplicatorLayer];
  double v14 = v13;
  if (v12)
  {
    double v15 = [v13 superlayer];

    if (v15) {
      goto LABEL_9;
    }
    double v14 = [(ZWLensZoomView *)self effectView];
    double v16 = [v14 layer];
    double v17 = [(ZWLensZoomView *)self effectReplicatorLayer];
    [v16 addSublayer:v17];
  }
  else
  {
    [v13 removeFromSuperlayer];
  }

LABEL_9:
  double v18 = [(ZWLensZoomView *)self effectBackdropLayer];
  CGFloat v19 = +[UIColor clearColor];
  BOOL v20 = [(ZWLensZoomView *)self effectView];
  [v20 setAccessibilityIgnoresInvertColors:0];

  if (![v8 isEqualToString:AXZoomLensEffectLowLight])
  {
    if ([v8 isEqualToString:AXZoomLensEffectInvertColors])
    {
      double v30 = +[CAFilter filterWithType:kCAFilterColorInvert];
      double v44 = v30;
      double v31 = &v44;
    }
    else if ([v8 isEqualToString:AXZoomLensEffectBlackAndWhite])
    {
      double v30 = +[CAFilter filterWithType:kCAFilterColorSaturate];
      [v30 setValue:&off_7B3A0 forKey:@"inputAmount"];
      double v43 = v30;
      double v31 = &v43;
    }
    else
    {
      if ([v8 isEqualToString:AXZoomLensEffectBlackAndWhiteInverted])
      {
        double v30 = +[CAFilter filterWithType:kCAFilterColorSaturate];
        [v30 setValue:&off_7B3A0 forKey:@"inputAmount"];
        v42[0] = v30;
        double v32 = +[CAFilter filterWithType:kCAFilterColorInvert];
        v42[1] = v32;
        double v33 = +[NSArray arrayWithObjects:v42 count:2];
        [v18 setFilters:v33];

LABEL_26:
        goto LABEL_27;
      }
      if (![v8 isEqualToString:AXZoomLensEffectHueAdjust])
      {
        if ([v8 isEqualToString:AXZoomLensEffectNone])
        {
          [v18 setFilters:0];
        }
        else
        {
          id v40 = v8;
          _AXAssert();
        }
        goto LABEL_27;
      }
      double v30 = +[CAFilter filterWithType:kCAFilterColorHueRotate];
      [v30 setValue:&off_7B660 forKey:@"inputAngle"];
      double v41 = v30;
      double v31 = &v41;
    }
    double v32 = +[NSArray arrayWithObjects:v31 count:1];
    [v18 setFilters:v32];
    goto LABEL_26;
  }
  [v18 setFilters:0];
  uint64_t v21 = +[UIColor blackColor];
  uint64_t v22 = [(id)v21 colorWithAlphaComponent:0.6];

  v23 = +[AXSubsystemZoom sharedInstance];
  LOBYTE(v21) = [v23 ignoreLogging];

  if ((v21 & 1) == 0)
  {
    v24 = +[AXSubsystemZoom identifier];
    v25 = AXLoggerForFacility();

    os_log_type_t v26 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v25, v26))
    {
      double v27 = AXColorizeFormatLog();
      double v28 = _AXStringForArgs();
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138543362;
        double v46 = v28;
        _os_log_impl(&dword_0, v25, v26, "%{public}@", buf, 0xCu);
      }

      double v10 = &AXColorizeFormatLog_ptr;
    }
  }
  PLLogRegisteredEvent();
  double v29 = [(ZWLensZoomView *)self effectView];
  [v29 setAccessibilityIgnoresInvertColors:1];

  CGFloat v19 = (void *)v22;
LABEL_27:
  double v34 = [(ZWLensZoomView *)self effectView];
  [v34 setBackgroundColor:v19];

  id v35 = [v8 isEqualToString:AXZoomLensEffectNone];
  uint64_t v36 = v35 ^ 1;
  [v18 setHidden:v35];
  [v18 setEnabled:v36];
  if ([v8 isEqualToString:AXZoomLensEffectInvertColors])
  {
    double v37 = self;
    uint64_t v38 = 1;
LABEL_32:
    uint64_t v39 = 0;
    goto LABEL_33;
  }
  if (![v8 isEqualToString:AXZoomLensEffectBlackAndWhiteInverted])
  {
    double v37 = self;
    uint64_t v38 = 0;
    goto LABEL_32;
  }
  double v37 = self;
  uint64_t v38 = 1;
  uint64_t v39 = 1;
LABEL_33:
  [(ZWLensZoomView *)v37 makePortalVisible:v38 withGrayScaleFilter:v39];
  [v10[273] commit];
  if (v9 && !v6) {
    v9[2](v9);
  }
}

- (void)requestPortalInfo
{
}

id __35__ZWLensZoomView_requestPortalInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setSourceLayerRenderId:", objc_msgSend(v3, "sourceLayerRenderID"));
  id v4 = [v3 sourceContextID];

  double v5 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v5 setSourceContextId:v4];
}

- (void)makePortalVisible:(BOOL)a3 withGrayScaleFilter:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    BOOL v6 = +[CAFilter filterWithType:kCAFilterColorSaturate];
    [v6 setValue:&off_7B3A0 forKey:@"inputAmount"];
    double v14 = v6;
    double v7 = +[NSArray arrayWithObjects:&v14 count:1];
    [(CAPortalLayer *)self->_islandPortalLayer setFilters:v7];
  }
  else
  {
    [(CAPortalLayer *)self->_islandPortalLayer setFilters:&__NSArray0__struct];
  }
  [(CAPortalLayer *)self->_islandPortalLayer setMatchesPosition:v4];
  [(CAPortalLayer *)self->_islandPortalLayer setMatchesTransform:v4];
  [(CAPortalLayer *)self->_islandPortalLayer setHidden:v4 ^ 1];
  [(CAPortalLayer *)self->_islandPortalLayer setAllowsHitTesting:v4];
  if (!v4)
  {
    id v8 = [(ZWLensZoomView *)self islandPortalLayer];
    [v8 removeFromSuperlayer];
  }
  else
  {
    id v8 = [(ZWLensZoomView *)self effectView];
    double v9 = [v8 layer];
    double v10 = [(ZWLensZoomView *)self islandPortalLayer];
    double v11 = [(ZWLensZoomView *)self effectView];
    unsigned int v12 = [v11 layer];
    double v13 = [v12 sublayers];
    objc_msgSend(v9, "insertSublayer:atIndex:", v10, objc_msgSend(v13, "count"));
  }
}

- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 zoomFactor:(double)a4
{
  double v4 = a3.width / a4;
  double v5 = a3.height / a4;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5
{
  double v5 = a3.size.width * a5;
  double v6 = a3.size.height * a5;
  double v7 = a4.x - v5 * 0.5;
  double v8 = a4.y - v6 * 0.5;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (UIView)zoomView
{
  return self->_zoomView;
}

- (void)setZoomView:(id)a3
{
}

- (CAReplicatorLayer)zoomReplicatorLayer
{
  return self->_zoomReplicatorLayer;
}

- (void)setZoomReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)zoomBackdropLayer
{
  return self->_zoomBackdropLayer;
}

- (void)setZoomBackdropLayer:(id)a3
{
}

- (CGPoint)zoomPanOffset
{
  double x = self->_zoomPanOffset.x;
  double y = self->_zoomPanOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  self->_zoomPanOffset = a3;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (CAReplicatorLayer)effectReplicatorLayer
{
  return self->_effectReplicatorLayer;
}

- (void)setEffectReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)effectBackdropLayer
{
  return self->_effectBackdropLayer;
}

- (void)setEffectBackdropLayer:(id)a3
{
}

- (BOOL)offsetZoomWindowFromFinger
{
  return self->_offsetZoomWindowFromFinger;
}

- (void)setOffsetZoomWindowFromFinger:(BOOL)a3
{
  self->_offsetZoomWindowFromFinger = a3;
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (CAPortalLayer)islandPortalLayer
{
  return self->_islandPortalLayer;
}

- (void)setIslandPortalLayer:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (BOOL)roundedLensCorners
{
  return self->_roundedLensCorners;
}

- (void)setRoundedLensCorners:(BOOL)a3
{
  self->_roundedLensCorners = a3;
}

- (BOOL)lensResizingHandlesShowing
{
  return self->_lensResizingHandlesShowing;
}

- (void)setLensResizingHandlesShowing:(BOOL)a3
{
  self->_lensResizingHandlesShowing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_islandPortalLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_effectBackdropLayer, 0);
  objc_storeStrong((id *)&self->_effectReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_zoomBackdropLayer, 0);
  objc_storeStrong((id *)&self->_zoomReplicatorLayer, 0);

  objc_storeStrong((id *)&self->_zoomView, 0);
}

@end