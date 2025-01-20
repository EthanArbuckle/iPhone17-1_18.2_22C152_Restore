@interface NTKExplorerDialView
- (CALayer)subdialLayer;
- (NTKExplorerDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (id)_hourNumeralHideAnimation;
- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4;
- (id)_minuteClusterExpandAnimation;
- (id)_minuteTickBreakAnimation;
- (id)_minuteTickShowAnimation;
- (id)_minuteTickShrinkAndGrow;
- (id)_numeralShowAnimation;
- (id)_secondTickBrightenAnimation;
- (id)_secondTickDimAnimation;
- (unint64_t)density;
- (void)_addOrRemoveChildLayers;
- (void)_applyDensity:(unint64_t)a3;
- (void)applyTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toDensity:(unint64_t)a5;
- (void)cleanupAfterEditing;
- (void)prepareForEditing;
- (void)setDensity:(unint64_t)a3;
@end

@implementation NTKExplorerDialView

- (NTKExplorerDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  CATransform3D *(__cdecl **v85)(CATransform3D *__return_ptr __struct_ptr, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v86;
  double v87;
  double v88;
  CATransform3D *(__cdecl **v89)(CATransform3D *__return_ptr __struct_ptr, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  id v101;
  double v102;
  double v103;
  double v104;
  CATransform3D *(__cdecl **v105)(CATransform3D *__return_ptr __struct_ptr, CGFloat, CGFloat, CGFloat, CGFloat);
  NSArray *v106;
  NSArray *hourNumerals;
  void *v108;
  double v109;
  double *v110;
  uint64_t v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  id v126;
  double v127;
  double v128;
  NSArray *v129;
  NSArray *minuteNumerals;
  void *v132;
  id v133;
  NTKExplorerDialView *v134;
  double v135;
  double v136;
  void *v137;
  double v138;
  double v139;
  CATransform3D v140;
  _OWORD v141[8];
  CATransform3D v142;
  CATransform3D v143;
  CATransform3D v144;
  double __dst[72];
  objc_super v146;
  NSAttributedStringKey v147;
  void *v148;
  NSAttributedStringKey v149;
  void *v150;

  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v146.receiver = self;
  v146.super_class = (Class)NTKExplorerDialView;
  v11 = -[NTKExplorerDialView initWithFrame:](&v146, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (!v11) {
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v11->_device, a4);
  v13 = +[UIColor blackColor];
  [(NTKExplorerDialView *)v12 setBackgroundColor:v13];

  v14 = v12->_device;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16A68);
  id WeakRetained = objc_loadWeakRetained(&qword_16A70);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v16 = WeakRetained;
  v17 = (CLKDevice *)objc_loadWeakRetained(&qword_16A70);
  if (v17 != v14)
  {

LABEL_6:
    id v20 = objc_storeWeak(&qword_16A70, v14);
    qword_16A78 = (uint64_t)[(CLKDevice *)v14 version];

    sub_A908(v21, v14);
    goto LABEL_7;
  }
  id v18 = [(CLKDevice *)v14 version];
  uint64_t v19 = qword_16A78;

  if (v18 != (id)v19) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16A68);
  memcpy(__dst, &qword_16828, sizeof(__dst));

  v22 = [(NTKExplorerDialView *)v12 layer];
  [v22 bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v31 = v27 * 0.5;
  double v32 = v29 * 0.5;
  v133 = v10;
  if (qword_16A88 != -1) {
    dispatch_once(&qword_16A88, &stru_105C8);
  }
  id v33 = (id)qword_16A80;
  uint64_t v34 = objc_opt_new();
  ringLayer = v12->_ringLayer;
  v12->_ringLayer = (CALayer *)v34;

  v139 = v31;
  -[CALayer setPosition:](v12->_ringLayer, "setPosition:", v31, v32);
  -[CALayer setBounds:](v12->_ringLayer, "setBounds:", v24, v26, v28, v30);
  [(CALayer *)v12->_ringLayer setCornerRadius:width * 0.5];
  v36 = v12->_ringLayer;
  _ringColor();
  id v37 = objc_claimAutoreleasedReturnValue();
  -[CALayer setBorderColor:](v36, "setBorderColor:", [v37 CGColor]);

  double v38 = __dst[0];
  [(CALayer *)v12->_ringLayer setBorderWidth:__dst[0]];
  [v22 addSublayer:v12->_ringLayer];
  uint64_t v39 = objc_opt_new();
  hourReplicatorLayer = v12->_hourReplicatorLayer;
  v12->_hourReplicatorLayer = (CAReplicatorLayer *)v39;

  [(CAReplicatorLayer *)v12->_hourReplicatorLayer setFillMode:kCAFillModeBoth];
  -[CAReplicatorLayer setPosition:](v12->_hourReplicatorLayer, "setPosition:", v31, v32);
  -[CAReplicatorLayer setBounds:](v12->_hourReplicatorLayer, "setBounds:", v24, v26, v28, v30);
  [(CAReplicatorLayer *)v12->_hourReplicatorLayer setInstanceCount:12];
  v41 = v12->_hourReplicatorLayer;
  CATransform3DMakeRotation(&v144, 0.523598776, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)v41 setInstanceTransform:&v144];
  [v22 addSublayer:v12->_hourReplicatorLayer];
  uint64_t v42 = objc_opt_new();
  hourTickLayer = v12->_hourTickLayer;
  v12->_hourTickLayer = (CALayer *)v42;

  v136 = CGPointZero.y;
  double v44 = v24;
  double v45 = v32;
  double v46 = __dst[62];
  -[CALayer setBounds:](v12->_hourTickLayer, "setBounds:");
  [(CALayer *)v12->_hourTickLayer setCornerRadius:v46 * 0.5];
  v47 = v12->_hourTickLayer;
  id v48 = +[UIColor whiteColor];
  -[CALayer setBackgroundColor:](v47, "setBackgroundColor:", [v48 CGColor]);

  [(CALayer *)v12->_hourTickLayer setPosition:v139];
  [(CALayer *)v12->_hourTickLayer setActions:v33];
  [(CAReplicatorLayer *)v12->_hourReplicatorLayer addSublayer:v12->_hourTickLayer];
  uint64_t v49 = objc_opt_new();
  minuteReplicatorLayer = v12->_minuteReplicatorLayer;
  v12->_minuteReplicatorLayer = (CAReplicatorLayer *)v49;

  [(CAReplicatorLayer *)v12->_minuteReplicatorLayer setFillMode:kCAFillModeBoth];
  -[CAReplicatorLayer setPosition:](v12->_minuteReplicatorLayer, "setPosition:", v139, v45);
  -[CAReplicatorLayer setBounds:](v12->_minuteReplicatorLayer, "setBounds:", v44, v26, v28, v30);
  [(CAReplicatorLayer *)v12->_minuteReplicatorLayer setInstanceCount:12];
  v51 = v12->_minuteReplicatorLayer;
  CATransform3DMakeRotation(&v143, 0.523598776, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)v51 setInstanceTransform:&v143];
  [(CAReplicatorLayer *)v12->_minuteReplicatorLayer setInstanceDelay:5.0];
  [v22 addSublayer:v12->_minuteReplicatorLayer];
  uint64_t v52 = objc_opt_new();
  minuteCollectionLayer = v12->_minuteCollectionLayer;
  v12->_minuteCollectionLayer = (CAReplicatorLayer *)v52;

  [(CAReplicatorLayer *)v12->_minuteCollectionLayer setFillMode:kCAFillModeBoth];
  -[CAReplicatorLayer setPosition:](v12->_minuteCollectionLayer, "setPosition:", v139, v45);
  -[CAReplicatorLayer setBounds:](v12->_minuteCollectionLayer, "setBounds:", v44, v26, v28, v30);
  v54 = v12->_minuteCollectionLayer;
  CATransform3DMakeRotation(&v142, 0.261799388, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)v54 setTransform:&v142];
  v55 = v12->_minuteCollectionLayer;
  long long v56 = *(_OWORD *)&CATransform3DIdentity.m33;
  v141[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v141[5] = v56;
  long long v57 = *(_OWORD *)&CATransform3DIdentity.m43;
  v141[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v141[7] = v57;
  long long v58 = *(_OWORD *)&CATransform3DIdentity.m13;
  v141[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v141[1] = v58;
  long long v59 = *(_OWORD *)&CATransform3DIdentity.m23;
  v141[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v141[3] = v59;
  [(CAReplicatorLayer *)v55 setInstanceTransform:v141];
  [(CAReplicatorLayer *)v12->_minuteCollectionLayer setActions:v33];
  [(CAReplicatorLayer *)v12->_minuteReplicatorLayer addSublayer:v12->_minuteCollectionLayer];
  uint64_t v60 = objc_opt_new();
  minuteTickLayer = v12->_minuteTickLayer;
  v12->_minuteTickLayer = (CALayer *)v60;

  double v62 = __dst[64];
  -[CALayer setBounds:](v12->_minuteTickLayer, "setBounds:", CGPointZero.x, v136, __dst[64], __dst[65]);
  [(CALayer *)v12->_minuteTickLayer setCornerRadius:v62 * 0.5];
  -[CALayer setPosition:](v12->_minuteTickLayer, "setPosition:", v139, v38 * 0.5);
  v63 = v12->_minuteTickLayer;
  _minuteTickColor();
  id v64 = objc_claimAutoreleasedReturnValue();
  -[CALayer setBackgroundColor:](v63, "setBackgroundColor:", [v64 CGColor]);

  [(CALayer *)v12->_minuteTickLayer setActions:v33];
  v65 = v22;
  [(CAReplicatorLayer *)v12->_minuteCollectionLayer addSublayer:v12->_minuteTickLayer];
  uint64_t v66 = objc_opt_new();
  subdialReplicatorLayer = v12->_subdialReplicatorLayer;
  v12->_subdialReplicatorLayer = (CAReplicatorLayer *)v66;

  [(CAReplicatorLayer *)v12->_subdialReplicatorLayer setFillMode:kCAFillModeBoth];
  -[CAReplicatorLayer setBounds:](v12->_subdialReplicatorLayer, "setBounds:", CGPointZero.x, v136, __dst[1], __dst[1]);
  v138 = v45;
  -[CAReplicatorLayer setPosition:](v12->_subdialReplicatorLayer, "setPosition:", v139, v45);
  [(CAReplicatorLayer *)v12->_subdialReplicatorLayer setActions:v33];
  [v22 addSublayer:v12->_subdialReplicatorLayer];
  uint64_t v68 = objc_opt_new();
  secondTickLayer = v12->_secondTickLayer;
  v12->_secondTickLayer = (CALayer *)v68;

  double v70 = __dst[66];
  double v71 = __dst[67];
  -[CALayer setBounds:](v12->_secondTickLayer, "setBounds:", CGPointZero.x, v136, __dst[66], __dst[67]);
  [(CALayer *)v12->_secondTickLayer setCornerRadius:v70 * 0.5];
  v72 = v12->_secondTickLayer;
  [(CAReplicatorLayer *)v12->_subdialReplicatorLayer bounds];
  -[CALayer setPosition:](v72, "setPosition:", v73 * 0.5, v71 * 0.5);
  [(CALayer *)v12->_secondTickLayer setActions:v33];
  v74 = v12->_secondTickLayer;
  id v75 = +[UIColor whiteColor];
  -[CALayer setBackgroundColor:](v74, "setBackgroundColor:", [v75 CGColor]);

  [(CAReplicatorLayer *)v12->_subdialReplicatorLayer addSublayer:v12->_secondTickLayer];
  [(CAReplicatorLayer *)v12->_subdialReplicatorLayer setInstanceCount:12];
  v134 = v12;
  v76 = v12->_subdialReplicatorLayer;
  v77 = v33;
  CATransform3DMakeRotation(&v140, 0.523598776, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)v76 setInstanceTransform:&v140];
  v78 = +[NSMutableArray arrayWithCapacity:3];
  uint64_t v79 = 0;
  double v80 = __dst[70];
  double v81 = UIFontWeightBold;
  double v83 = CGSizeZero.width;
  double v82 = CGSizeZero.height;
  v84 = &__dst[3];
  v85 = &CATransform3DMakeRotation_ptr;
  do
  {
    v86 = +[NSString localizedStringWithFormat:@"%i", dword_F9B0[v79]];
    v87 = *(v84 - 1);
    v88 = *v84;
    v89 = v85;
    v90 = [v85[96] systemFontOfSize:CLKRoundedFontDesignName weight:v80 design:v81];
    v149 = NSFontAttributeName;
    v150 = v90;
    v91 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
    v92 = v83;
    objc_msgSend(v86, "boundingRectWithSize:options:attributes:context:", 3, v91, 0, v83, v82);
    v94 = v93;

    v95 = CLKLocaleCurrentNumberSystem();
    [v90 capHeight];
    v97 = v96;
    if (v95 == 2)
    {
      [v90 descender];
      v99 = v97 - v98;
    }
    else
    {
      v99 = v96 + 1.0;
    }
    v100 = +[CATextLayer layer];
    [v100 setString:v86];
    _numeralsGreyColor();
    v101 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setForegroundColor:", objc_msgSend(v101, "CGColor"));

    [v90 ascender];
    v103 = v102;
    [v90 capHeight];
    objc_msgSend(v100, "setBounds:", 0.0, v103 - v104 + -1.0, v94, ceil(v99));
    [v100 setFont:v90];
    [v100 setFontSize:v80];
    objc_msgSend(v100, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(v100, "setPosition:", v139 + v87, v138 + v88);
    [v100 setActions:v77];
    [v100 setContentsScale:2.0];
    [v65 addSublayer:v100];
    [v78 addObject:v100];

    ++v79;
    v84 += 2;
    double v81 = UIFontWeightBold;
    double v83 = v92;
    v105 = &CATransform3DMakeRotation_ptr;
    v85 = v89;
  }
  while (v79 != 3);
  v132 = v78;
  v106 = (NSArray *)[v78 copy];
  hourNumerals = v134->_hourNumerals;
  v134->_hourNumerals = v106;

  v108 = +[NSMutableArray arrayWithCapacity:12];
  v109 = __dst[68];
  v110 = &__dst[39];
  v137 = v65;
  v111 = -60;
  v135 = v82;
  do
  {
    v112 = objc_msgSend(v105[105], "localizedStringWithFormat:", @"%02i", v111 + 65);
    v113 = *(v110 - 25);
    v114 = *(v110 - 24);
    v115 = [v85[96] systemFontOfSize:CLKRoundedFontDesignName weight:v109 design:v81];
    v147 = NSFontAttributeName;
    v148 = v115;
    v116 = +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    objc_msgSend(v112, "boundingRectWithSize:options:attributes:context:", 3, v116, 0, v83, v135);
    v118 = v117;
    v120 = v119;
    v122 = v121;
    v124 = v123;

    v125 = +[CATextLayer layer];
    [v125 setString:v112];
    _numeralsGreyColor();
    v126 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setForegroundColor:", objc_msgSend(v126, "CGColor"));

    v127 = v118;
    double v81 = UIFontWeightBold;
    v128 = v120;
    double v83 = v92;
    objc_msgSend(v125, "setBounds:", v127, v128, v122, v124);
    [v125 setFont:v115];
    [v125 setFontSize:v109];
    objc_msgSend(v125, "setAnchorPoint:", *(v110 - 1), *v110);
    objc_msgSend(v125, "setPosition:", v139 + v113, v138 + v114);
    [v125 setActions:v77];
    [v125 setContentsScale:2.0];
    [v137 addSublayer:v125];
    [v108 addObject:v125];

    v105 = &CATransform3DMakeRotation_ptr;
    v85 = v89;

    v110 += 2;
    v111 += 5;
  }
  while (v111);
  v129 = (NSArray *)[v108 copy];
  v12 = v134;
  minuteNumerals = v134->_minuteNumerals;
  v134->_minuteNumerals = v129;

  v134->_currentDensityTransition = 0x7FFFFFFFFFFFFFFFLL;
  v134->_densitdouble y = 0x7FFFFFFFFFFFFFFFLL;

  id v10 = v133;
LABEL_17:

  return v12;
}

- (void)setDensity:(unint64_t)a3
{
  if (self->_density != a3)
  {
    self->_densitdouble y = a3;
    self->_currentDensityTransition = 0x7FFFFFFFFFFFFFFFLL;
    [(NTKExplorerDialView *)self _applyDensity:self->_density];
  }
}

- (void)prepareForEditing
{
  self->_editing = 1;
  [(NTKExplorerDialView *)self _addOrRemoveChildLayers];
}

- (void)cleanupAfterEditing
{
  self->_editing = 0;
  self->_currentDensityTransition = 0x7FFFFFFFFFFFFFFFLL;
  [(NTKExplorerDialView *)self _addOrRemoveChildLayers];
}

- (void)_applyDensity:(unint64_t)a3
{
  [(NTKExplorerDialView *)self _addOrRemoveChildLayers];
  v5 = [(NTKExplorerDialView *)self layer];
  LODWORD(v6) = 1.0;
  [v5 setSpeed:v6];
  [v5 setTimeOffset:0.0];
  [(CALayer *)self->_secondTickLayer removeAllAnimations];
  [(CAReplicatorLayer *)self->_minuteCollectionLayer removeAllAnimations];
  [(CALayer *)self->_minuteTickLayer removeAllAnimations];
  if (a3 == 2) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  hourNumerals = self->_hourNumerals;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_8760;
  v20[3] = &unk_10458;
  *(double *)&v20[4] = v7;
  [(NSArray *)hourNumerals enumerateObjectsUsingBlock:v20];
  minuteNumerals = self->_minuteNumerals;
  if (a3 == 3) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_881C;
  v19[3] = &unk_10458;
  *(double *)&v19[4] = v10;
  if (a3 == 3) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 1;
  }
  [(NSArray *)minuteNumerals enumerateObjectsUsingBlock:v19];
  secondTickLayer = self->_secondTickLayer;
  _secondTickColor(a3);
  id v13 = objc_claimAutoreleasedReturnValue();
  -[CALayer setBackgroundColor:](secondTickLayer, "setBackgroundColor:", [v13 CGColor]);

  hourTickLayer = self->_hourTickLayer;
  _hourTickColor(a3);
  id v15 = objc_claimAutoreleasedReturnValue();
  -[CALayer setBackgroundColor:](hourTickLayer, "setBackgroundColor:", [v15 CGColor]);

  -[CAReplicatorLayer setTransform:](self->_minuteCollectionLayer, "setTransform:", v18, _minuteClusterTransform(a3, (uint64_t)v18).n128_f64[0]);
  -[CAReplicatorLayer setInstanceTransform:](self->_minuteCollectionLayer, "setInstanceTransform:", v17, _minuteInstanceTransform(a3, (uint64_t)v17).n128_f64[0]);
  [(CAReplicatorLayer *)self->_minuteCollectionLayer setInstanceCount:v11];
  double v16 = 0.0;
  if (a3) {
    *(float *)&double v16 = 1.0;
  }
  [(CAReplicatorLayer *)self->_minuteCollectionLayer setOpacity:v16];
}

- (void)applyTransitionFraction:(double)a3 fromDensity:(unint64_t)a4 toDensity:(unint64_t)a5
{
  unint64_t currentDensityTransition = self->_currentDensityTransition;
  if (a4 != a5)
  {
    if (currentDensityTransition != a4)
    {
      self->_unint64_t currentDensityTransition = a4;
      [(NTKExplorerDialView *)self _applyDensity:a4];
      unint64_t v9 = self->_currentDensityTransition;
      switch(v9)
      {
        case 2uLL:
          [(CAReplicatorLayer *)self->_subdialReplicatorLayer setInstanceDelay:3.0];
          double v10 = [(NTKExplorerDialView *)self _secondTickDimAnimation];
          [(CALayer *)self->_secondTickLayer addAnimation:v10 forKey:@"secondTickDim"];
          uint64_t v11 = [(NTKExplorerDialView *)self _hourNumeralHideAnimation];
          hourNumerals = self->_hourNumerals;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_8F24;
          v25[3] = &unk_10480;
          id v26 = v11;
          id v13 = v11;
          [(NSArray *)hourNumerals enumerateObjectsUsingBlock:v25];
          v14 = [(NTKExplorerDialView *)self _numeralShowAnimation];
          minuteNumerals = self->_minuteNumerals;
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_8FA0;
          v23[3] = &unk_10480;
          id v24 = v14;
          id v16 = v14;
          [(NSArray *)minuteNumerals enumerateObjectsUsingBlock:v23];
          v17 = [(NTKExplorerDialView *)self _minuteClusterExpandAnimation];
          [(CAReplicatorLayer *)self->_minuteCollectionLayer addAnimation:v17 forKey:@"minuteClusterExpand"];
          id v18 = [(NTKExplorerDialView *)self _minuteTickShrinkAndGrow];
          [(CALayer *)self->_minuteTickLayer addAnimation:v18 forKey:@"minuteScale"];

          goto LABEL_13;
        case 1uLL:
          [(CAReplicatorLayer *)self->_subdialReplicatorLayer setInstanceDelay:1.0];
          double v10 = [(NTKExplorerDialView *)self _secondTickBrightenAnimation];
          [(CALayer *)self->_secondTickLayer addAnimation:v10 forKey:@"secondTickBrighten"];
          uint64_t v19 = [(NTKExplorerDialView *)self _numeralShowAnimation];
          id v20 = self->_hourNumerals;
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_8EA8;
          v27[3] = &unk_10480;
          id v28 = v19;
          id v21 = v19;
          [(NSArray *)v20 enumerateObjectsUsingBlock:v27];

          goto LABEL_13;
        case 0uLL:
          double v10 = [(NTKExplorerDialView *)self _minuteTickShowAnimation];
          [(CAReplicatorLayer *)self->_minuteCollectionLayer addAnimation:v10 forKey:@"minuteTickShow"];
LABEL_13:

          break;
      }
    }
    v22 = [(NTKExplorerDialView *)self layer];
    [v22 setSpeed:0.0];
    [v22 setTimeOffset:dbl_F9F0[a4] * a3];

    return;
  }
  if (currentDensityTransition != a4)
  {
    self->_unint64_t currentDensityTransition = a4;
    [(NTKExplorerDialView *)self _applyDensity:a3];
  }
}

- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4
{
  id v4 = a4;
  v5 = +[CABasicAnimation animationWithKeyPath:@"instanceDelay"];
  [v5 setFromValue:v4];
  [v5 setToValue:v4];

  [v5 setBeginTime:0.00000011920929];
  [v5 setDuration:0.00001];
  [v5 setFillMode:kCAFillModeForwards];

  return v5;
}

- (CALayer)subdialLayer
{
  return (CALayer *)self->_subdialReplicatorLayer;
}

- (void)_addOrRemoveChildLayers
{
  if (self->_editing)
  {
    char v3 = 1;
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = self->_density - 1;
    if (v5 >= 3)
    {
      double v6 = [(NTKExplorerDialView *)self layer];
      [(CAReplicatorLayer *)self->_minuteReplicatorLayer removeFromSuperlayer];
      char v3 = 0;
      BOOL v4 = 0;
      goto LABEL_8;
    }
    BOOL v4 = (v5 & 7) == 2;
    char v3 = v5 & 1;
  }
  double v6 = [(NTKExplorerDialView *)self layer];
  double v7 = [(CAReplicatorLayer *)self->_minuteReplicatorLayer superlayer];

  if (!v7) {
    [v6 insertSublayer:self->_minuteReplicatorLayer above:self->_ringLayer];
  }
LABEL_8:
  v8 = [(NSArray *)self->_hourNumerals firstObject];
  unint64_t v9 = [v8 superlayer];
  BOOL v10 = v9 != 0;

  hourNumerals = self->_hourNumerals;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_930C;
  v23[3] = &unk_104A8;
  char v26 = v3;
  BOOL v27 = v10;
  id v12 = v6;
  id v24 = v12;
  double v25 = self;
  [(NSArray *)hourNumerals enumerateObjectsUsingBlock:v23];
  id v13 = [(NSArray *)self->_minuteNumerals firstObject];
  v14 = [v13 superlayer];
  BOOL v15 = v14 != 0;

  minuteNumerals = self->_minuteNumerals;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_938C;
  v18[3] = &unk_104A8;
  BOOL v21 = v4;
  BOOL v22 = v15;
  id v19 = v12;
  id v20 = self;
  id v17 = v12;
  [(NSArray *)minuteNumerals enumerateObjectsUsingBlock:v18];
}

- (id)_minuteTickShowAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v2 setFromValue:&off_10E88];
  [v2 setToValue:&off_10EA0];
  [v2 setDuration:13.0];
  [v2 setBeginTime:7.0];
  [v2 setFillMode:kCAFillModeBoth];
  char v3 = +[CABasicAnimation animationWithKeyPath:@"instanceTransform"];
  if (qword_16820 != -1) {
    dispatch_once(&qword_16820, &stru_105A8);
  }
  v17[4] = xmmword_167E0;
  v17[5] = unk_167F0;
  v17[6] = xmmword_16800;
  v17[7] = unk_16810;
  v17[0] = xmmword_167A0;
  v17[1] = *(_OWORD *)algn_167B0;
  v17[2] = xmmword_167C0;
  v17[3] = unk_167D0;
  BOOL v4 = +[NSValue valueWithCATransform3D:v17];
  [v3 setFromValue:v4];

  if (qword_16820 != -1) {
    dispatch_once(&qword_16820, &stru_105A8);
  }
  v16[4] = xmmword_166E0;
  v16[5] = unk_166F0;
  v16[6] = xmmword_16700;
  v16[7] = unk_16710;
  v16[0] = xmmword_166A0;
  v16[1] = *(_OWORD *)algn_166B0;
  v16[2] = xmmword_166C0;
  v16[3] = unk_166D0;
  unint64_t v5 = +[NSValue valueWithCATransform3D:v16];
  [v3 setToValue:v5];

  [v3 setDuration:20.0];
  [v3 setFillMode:kCAFillModeBoth];
  double v6 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  if (qword_16698 != -1) {
    dispatch_once(&qword_16698, &stru_10588);
  }
  v15[4] = xmmword_16658;
  v15[5] = unk_16668;
  v15[6] = xmmword_16678;
  v15[7] = unk_16688;
  v15[0] = xmmword_16618;
  v15[1] = unk_16628;
  v15[2] = xmmword_16638;
  v15[3] = unk_16648;
  double v7 = +[NSValue valueWithCATransform3D:v15];
  [v6 setFromValue:v7];

  if (qword_16698 != -1) {
    dispatch_once(&qword_16698, &stru_10588);
  }
  v14[4] = xmmword_16558;
  v14[5] = unk_16568;
  v14[6] = xmmword_16578;
  v14[7] = unk_16588;
  v14[0] = xmmword_16518;
  v14[1] = unk_16528;
  v14[2] = xmmword_16538;
  v14[3] = unk_16548;
  v8 = +[NSValue valueWithCATransform3D:v14];
  [v6 setToValue:v8];

  [v6 setDuration:20.0];
  [v6 setFillMode:kCAFillModeBoth];
  unint64_t v9 = +[CABasicAnimation animationWithKeyPath:@"instanceCount"];
  [v9 setFromValue:&off_10EB8];
  [v9 setToValue:&off_10EB8];
  [v9 setDuration:0.0];
  [v9 setFillMode:kCAFillModeBoth];
  BOOL v10 = +[CABasicAnimation animationWithKeyPath:@"instanceCount"];
  [v10 setFromValue:&off_10EB8];
  [v10 setToValue:&off_10E88];
  [v10 setDuration:5.0];
  [v10 setBeginTime:15.0];
  [v10 setFillMode:kCAFillModeBoth];
  uint64_t v11 = objc_opt_new();
  [v11 setBeginTime:0.00000011920929];
  [v11 setDuration:20.0];
  [v11 setFillMode:kCAFillModeBoth];
  v18[0] = v9;
  v18[1] = v6;
  v18[2] = v2;
  v18[3] = v3;
  void v18[4] = v10;
  id v12 = +[NSArray arrayWithObjects:v18 count:5];
  [v11 setAnimations:v12];

  return v11;
}

- (id)_secondTickDimAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
  _secondTickColor(2);
  id v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", objc_msgSend(v3, "CGColor"));

  _secondTickColor(1);
  id v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", objc_msgSend(v4, "CGColor"));

  [v2 setDuration:19.0];
  [v2 setBeginTime:5.0];
  [v2 setFillMode:kCAFillModeBoth];

  return v2;
}

- (id)_secondTickBrightenAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
  _secondTickColor(1);
  id v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", objc_msgSend(v3, "CGColor"));

  _secondTickColor(2);
  id v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", objc_msgSend(v4, "CGColor"));

  [v2 setDuration:6.0];
  [v2 setBeginTime:5.0];
  [v2 setFillMode:kCAFillModeBoth];

  return v2;
}

- (id)_numeralShowAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v2 setFromValue:&off_10EA0];
  [v2 setToValue:&off_10EA0];
  [v2 setDuration:0.0];
  [v2 setFillMode:kCAFillModeBoth];
  id v3 = +[CASpringAnimation animationWithKeyPath:@"transform.scale.xy"];
  [v3 setMass:0.45];
  [v3 setStiffness:200.0];
  [v3 setDamping:11.0];
  [v3 setFromValue:&off_10E88];
  [v3 setToValue:&off_10EA0];
  [v3 setDuration:13.0];
  [v3 duration];
  double v5 = 0.6 / v4;
  *(float *)&double v5 = v5;
  [v3 setSpeed:v5];
  [v3 setFillMode:kCAFillModeBoth];
  double v6 = objc_opt_new();
  [v6 setBeginTime:0.00000011920929];
  [v6 setDuration:13.0];
  [v6 setFillMode:kCAFillModeBoth];
  v9[0] = v2;
  v9[1] = v3;
  double v7 = +[NSArray arrayWithObjects:v9 count:2];
  [v6 setAnimations:v7];

  return v6;
}

- (id)_hourNumeralHideAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
  [v2 setFromValue:&off_10EA0];
  [v2 setToValue:&off_10E88];
  [v2 setDuration:13.0];
  [v2 setFillMode:kCAFillModeBoth];
  id v3 = objc_opt_new();
  [v3 setBeginTime:0.00000011920929];
  [v3 setDuration:13.0];
  [v3 setFillMode:kCAFillModeBoth];
  double v6 = v2;
  double v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 setAnimations:v4];

  return v2;
}

- (id)_minuteTickBreakAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  if (qword_16698 != -1) {
    dispatch_once(&qword_16698, &stru_10588);
  }
  v16[4] = xmmword_16558;
  v16[5] = unk_16568;
  v16[6] = xmmword_16578;
  v16[7] = unk_16588;
  v16[0] = xmmword_16518;
  v16[1] = unk_16528;
  v16[2] = xmmword_16538;
  v16[3] = unk_16548;
  id v3 = +[NSValue valueWithCATransform3D:v16];
  [v2 setFromValue:v3];

  if (qword_16698 != -1) {
    dispatch_once(&qword_16698, &stru_10588);
  }
  v15[4] = xmmword_165D8;
  v15[5] = unk_165E8;
  v15[6] = xmmword_165F8;
  v15[7] = unk_16608;
  v15[0] = xmmword_16598;
  v15[1] = unk_165A8;
  v15[2] = xmmword_165B8;
  v15[3] = unk_165C8;
  double v4 = +[NSValue valueWithCATransform3D:v15];
  [v2 setToValue:v4];

  [v2 setDuration:10.0];
  [v2 setFillMode:kCAFillModeBoth];
  double v5 = +[CABasicAnimation animationWithKeyPath:@"instanceCount"];
  double v6 = +[NSNumber numberWithInteger:4];
  [v5 setFromValue:v6];
  [v5 setToValue:v6];
  [v5 setDuration:0.0];
  [v5 setFillMode:kCAFillModeBoth];
  double v7 = +[CABasicAnimation animationWithKeyPath:@"instanceTransform"];
  if (qword_16820 != -1) {
    dispatch_once(&qword_16820, &stru_105A8);
  }
  v14[4] = xmmword_166E0;
  v14[5] = unk_166F0;
  v14[6] = xmmword_16700;
  v14[7] = unk_16710;
  v14[0] = xmmword_166A0;
  v14[1] = *(_OWORD *)algn_166B0;
  v14[2] = xmmword_166C0;
  v14[3] = unk_166D0;
  v8 = +[NSValue valueWithCATransform3D:v14];
  [v7 setFromValue:v8];

  if (qword_16820 != -1) {
    dispatch_once(&qword_16820, &stru_105A8);
  }
  v13[4] = xmmword_16760;
  v13[5] = unk_16770;
  v13[6] = xmmword_16780;
  v13[7] = unk_16790;
  v13[0] = xmmword_16720;
  v13[1] = *(_OWORD *)algn_16730;
  v13[2] = xmmword_16740;
  v13[3] = unk_16750;
  unint64_t v9 = +[NSValue valueWithCATransform3D:v13];
  [v7 setToValue:v9];

  [v7 setDuration:10.0];
  [v7 setFillMode:kCAFillModeBoth];
  BOOL v10 = objc_opt_new();
  [v10 setBeginTime:0.00000011920929];
  [v10 setDuration:10.0];
  [v10 setFillMode:kCAFillModeBoth];
  v17[0] = v5;
  v17[1] = v2;
  v17[2] = v7;
  uint64_t v11 = +[NSArray arrayWithObjects:v17 count:3];
  [v10 setAnimations:v11];

  return v10;
}

- (id)_minuteClusterExpandAnimation
{
  v2 = +[CABasicAnimation animationWithKeyPath:@"instanceCount"];
  [v2 setFromValue:&off_10EA0];
  [v2 setToValue:&off_10ED0];
  [v2 setDuration:5.0];
  [v2 setFillMode:kCAFillModeForwards];
  id v3 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
  [v3 setFromValue:&off_11248];
  [v3 setToValue:&off_11248];
  [v3 setDuration:0.00000011920929];
  [v3 setFillMode:kCAFillModeForwards];
  double v4 = +[CABasicAnimation animationWithKeyPath:@"instanceDelay"];
  [v4 setFromValue:&off_11258];
  [v4 setToValue:&off_11258];
  [v4 setDuration:0.00000011920929];
  [v4 setFillMode:kCAFillModeForwards];
  double v5 = +[CABasicAnimation animationWithKeyPath:@"instanceTransform.rotation.z"];
  [v5 setFromValue:&off_11248];
  [v5 setToValue:&off_11248];
  [v5 setDuration:0.00000011920929];
  [v5 setFillMode:kCAFillModeForwards];
  double v6 = objc_opt_new();
  [v6 setBeginTime:1.5];
  [v6 setDuration:5.0];
  [v6 setFillMode:kCAFillModeForwards];
  v9[0] = v3;
  v9[1] = v2;
  void v9[2] = v5;
  v9[3] = v4;
  double v7 = +[NSArray arrayWithObjects:v9 count:4];
  [v6 setAnimations:v7];

  return v6;
}

- (id)_minuteTickShrinkAndGrow
{
  v2 = +[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.xy"];
  [v2 setBeginTime:0.00000011920929];
  [v2 setDuration:6.5];
  [v2 setKeyTimes:&off_11128];
  [v2 setValues:&off_11140];

  return v2;
}

- (unint64_t)density
{
  return self->_density;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minuteNumerals, 0);
  objc_storeStrong((id *)&self->_hourNumerals, 0);
  objc_storeStrong((id *)&self->_secondTickLayer, 0);
  objc_storeStrong((id *)&self->_subdialReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickLayer, 0);
  objc_storeStrong((id *)&self->_minuteCollectionLayer, 0);
  objc_storeStrong((id *)&self->_minuteReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_hourTickLayer, 0);
  objc_storeStrong((id *)&self->_hourReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_ringLayer, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end