@interface MKUserLocationHeadingConeLayer
- (BOOL)_shouldShowHeadingForAccuracy:(double)a3;
- (MKUserLocationHeadingConeLayer)initWithUserLocationView:(id)a3 shouldMatchAccuracyRadius:(BOOL)a4 minimumPresentationAngle:(double)a5;
- (UITraitCollection)traitCollection;
- (double)_opacityForAccuracy:(double)a3 locationAccuracy:(double)a4;
- (double)minimumAccuracyRadius;
- (id)_accuracyGradientLocationsForAccuracyRadius:(double)a3;
- (id)_colorsForAccuracyRadius:(double)a3;
- (unint64_t)mapType;
- (void)_animateToOpacity:(double)a3 completion:(id)a4;
- (void)_createMaskLayer;
- (void)_updateColors;
- (void)_updateHeadingMaskForAccuracy:(double)halfMinAngle previousAccuracy:(double)a4;
- (void)_updateShowHeadingForAccuracy:(double)a3;
- (void)animateToSetVisible:(BOOL)a3 completion:(id)a4;
- (void)setAccuracyRadius:(double)a3 duration:(double)a4;
- (void)setMapType:(unint64_t)a3;
- (void)setMinimumAccuracyRadius:(double)a3;
- (void)setTraitCollection:(id)a3;
- (void)updateHeading:(double)a3;
- (void)updateHeadingAccuracy:(double)a3 previousAccuracy:(double)a4;
- (void)updateTintColor:(id)a3;
@end

@implementation MKUserLocationHeadingConeLayer

- (void)setAccuracyRadius:(double)a3 duration:(double)a4
{
  v124[3] = *MEMORY[0x1E4F143B8];
  if (!self->_shouldMatchAccuracyRadius) {
    return;
  }
  double lastAccuracyRadius = self->_lastAccuracyRadius;
  double minimumAccuracyRadius = self->_minimumAccuracyRadius;
  if (minimumAccuracyRadius <= a3) {
    double v8 = a3;
  }
  else {
    double v8 = self->_minimumAccuracyRadius;
  }
  if (lastAccuracyRadius <= minimumAccuracyRadius && minimumAccuracyRadius >= a3)
  {
    self->_double lastAccuracyRadius = v8;
    return;
  }
  if (minimumAccuracyRadius < a3)
  {
    double v108 = v8 + 18.0;
    double v14 = v108 + v108;
    double v15 = (v8 + 18.0) * 0.5 + (v8 + 18.0) * 0.5;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
    [(id)objc_opt_class() baseDiameter];
    double v13 = v12;

    double v14 = v13 + 66.0;
    double v108 = 33.0;
    double v15 = v13 + 33.0;
  }
  double v16 = 0.0;
  v125.origin.x = 0.0;
  v125.origin.y = 0.0;
  v125.size.width = v14;
  v125.size.height = v14;
  double MidX = CGRectGetMidX(v125);
  v126.origin.x = 0.0;
  v126.origin.y = 0.0;
  v126.size.width = v14;
  v126.size.height = v14;
  double MidY = CGRectGetMidY(v126);
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithOvalInRect:", 0.0, 0.0, v15, v15);
  id v17 = objc_claimAutoreleasedReturnValue();
  v18 = CGPathRetain((CGPathRef)[v17 CGPath]);

  if (a4 <= 0.0)
  {
    v19 = [(MKUserLocationHeadingConeLayer *)self animationForKey:@"accuracy"];
    v20 = v19;
    double v107 = 0.0;
    if (v19)
    {
      [v19 beginTime];
      double v107 = v21;
      [(MKUserLocationHeadingConeLayer *)self convertTime:0 fromLayer:CACurrentMediaTime()];
      double v23 = v22;
      [v20 beginTime];
      double v25 = v23 - v24;
      [v20 timeOffset];
      double v16 = v25 - v26;
      [v20 duration];
      a4 = v27;
    }
  }
  else
  {
    double v107 = 0.0;
  }
  [(MKUserLocationHeadingConeLayer *)self removeAnimationForKey:@"accuracy"];
  [(CAShapeLayer *)self->_maskLayer removeAnimationForKey:@"accuracy"];
  v28 = [(MKUserLocationHeadingConeLayer *)self _accuracyGradientLocationsForAccuracyRadius:v8];
  v29 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:self->_traitCollection];
  if (lastAccuracyRadius <= minimumAccuracyRadius == minimumAccuracyRadius >= a3)
  {
    v30 = 0;
  }
  else
  {
    v30 = [(MKUserLocationHeadingConeLayer *)self _colorsForAccuracyRadius:v8];
  }
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v29];
  if (a4 > 0.0)
  {
    v104 = v30;
    v105 = v28;
    v103 = v29;
    v106 = v18;
    v124[0] = &unk_1ED97EF40;
    double v31 = v16 / a4;
    v32 = [NSNumber numberWithDouble:v31];
    v124[1] = v32;
    v124[2] = &unk_1ED97EF28;
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:3];

    v34 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds"];
    v35 = (void *)MEMORY[0x1E4F29238];
    v36 = [(CALayer *)self currentLayer];
    [v36 bounds];
    v37 = objc_msgSend(v35, "valueWithCGRect:");
    v123[0] = v37;
    v38 = (void *)MEMORY[0x1E4F29238];
    v39 = [(CALayer *)self currentLayer];
    [v39 bounds];
    v40 = objc_msgSend(v38, "valueWithCGRect:");
    v123[1] = v40;
    v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v14, v14);
    v123[2] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:3];
    [v34 setValues:v42];

    v111 = (void *)v33;
    [v34 setKeyTimes:v33];
    id v43 = v34;
    v44 = v43;
    if (!self->_shouldMatchAccuracyRadius)
    {
LABEL_39:
      [v44 setRemovedOnCompletion:1];
      [v44 setDuration:a4];
      if (v107 > 0.0) {
        [v44 setBeginTime:v107];
      }
      [(MKUserLocationHeadingConeLayer *)self addAnimation:v44 forKey:@"accuracy"];

      v69 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds"];
      v70 = (void *)MEMORY[0x1E4F29238];
      v71 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      [v71 bounds];
      v72 = objc_msgSend(v70, "valueWithCGRect:");
      v116[0] = v72;
      v73 = (void *)MEMORY[0x1E4F29238];
      v74 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      [v74 bounds];
      v75 = objc_msgSend(v73, "valueWithCGRect:");
      v116[1] = v75;
      v76 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v15, v15);
      v116[2] = v76;
      v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:3];
      v102 = v69;
      [v69 setValues:v77];

      [v69 setKeyTimes:v111];
      v78 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
      v79 = (void *)MEMORY[0x1E4F29238];
      v80 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      [v80 position];
      v81 = objc_msgSend(v79, "valueWithCGPoint:");
      v115[0] = v81;
      v82 = (void *)MEMORY[0x1E4F29238];
      v83 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      [v83 position];
      v84 = objc_msgSend(v82, "valueWithCGPoint:");
      v115[1] = v84;
      double v61 = MidY;
      double v62 = MidX;
      v85 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX, MidY);
      v115[2] = v85;
      v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:3];
      [v78 setValues:v86];

      [v78 setKeyTimes:v111];
      v87 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"path"];
      v88 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      v114[0] = [v88 path];
      v89 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      v114[1] = [v89 path];
      v114[2] = v106;
      v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:3];
      [v87 setValues:v90];

      [v87 setKeyTimes:v111];
      v91 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
      v92 = NSNumber;
      v93 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      [v93 lineWidth];
      v94 = objc_msgSend(v92, "numberWithDouble:");
      v113[0] = v94;
      v95 = NSNumber;
      v96 = [(CAShapeLayer *)self->_maskLayer currentLayer];
      [v96 lineWidth];
      v97 = objc_msgSend(v95, "numberWithDouble:");
      v113[1] = v97;
      double v60 = v108;
      v98 = [NSNumber numberWithDouble:v108];
      v113[2] = v98;
      v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:3];
      [v91 setValues:v99];

      [v91 setKeyTimes:v111];
      v100 = [MEMORY[0x1E4F39B38] animation];
      v112[0] = v102;
      v112[1] = v78;
      v112[2] = v87;
      v112[3] = v91;
      v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:4];
      [v100 setAnimations:v101];

      [v100 setRemovedOnCompletion:1];
      [v100 setDuration:a4];
      if (v107 > 0.0) {
        [v100 setBeginTime:v107];
      }
      [(CAShapeLayer *)self->_maskLayer addAnimation:v100 forKey:@"accuracy"];

      v28 = v105;
      v18 = v106;
      v29 = v103;
      v30 = v104;
      goto LABEL_44;
    }
    v45 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"locations"];
    v46 = [(CALayer *)self currentLayer];
    v47 = [v46 locations];
    v122[0] = v47;
    v48 = [(CALayer *)self currentLayer];
    v49 = [v48 locations];
    v122[1] = v49;
    v122[2] = v105;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:3];
    [v45 setValues:v50];

    [v45 setKeyTimes:v33];
    if (v30)
    {
      v51 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"colors"];
      v52 = [(CALayer *)self currentLayer];
      v53 = [v52 colors];
      v121[0] = v53;
      v54 = [(CALayer *)self currentLayer];
      v55 = [v54 colors];
      v121[1] = v55;
      v121[2] = v30;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:3];
      [v51 setValues:v56];

      if (minimumAccuracyRadius >= a3)
      {
        v120[0] = &unk_1ED97EF40;
        double v57 = 0.6;
        if (v31 >= 0.6) {
          double v57 = v31;
        }
        v58 = [NSNumber numberWithDouble:v57];
        v120[1] = v58;
        v120[2] = &unk_1ED97EF28;
        v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:3];
        [v51 setKeyTimes:v59];
LABEL_34:

        goto LABEL_35;
      }
      if (lastAccuracyRadius <= minimumAccuracyRadius)
      {
        v119[0] = &unk_1ED97EF40;
        v58 = [NSNumber numberWithDouble:v31];
        v119[1] = v58;
        double v63 = 0.4;
        if (v31 >= 0.4) {
          double v63 = v31;
        }
        v59 = [NSNumber numberWithDouble:v63];
        v119[2] = v59;
        v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:3];
        [v51 setKeyTimes:v64];

        goto LABEL_34;
      }
    }
    else
    {
      v51 = 0;
    }
LABEL_35:
    v44 = [MEMORY[0x1E4F39B38] animation];
    if (v51)
    {
      v118[0] = v43;
      v118[1] = v45;
      v118[2] = v51;
      v65 = (void *)MEMORY[0x1E4F1C978];
      v66 = v118;
      uint64_t v67 = 3;
    }
    else
    {
      v117[0] = v43;
      v117[1] = v45;
      v65 = (void *)MEMORY[0x1E4F1C978];
      v66 = v117;
      uint64_t v67 = 2;
    }
    v68 = [v65 arrayWithObjects:v66 count:v67];
    [v44 setAnimations:v68];

    goto LABEL_39;
  }
  double v60 = v108;
  double v61 = MidY;
  double v62 = MidX;
LABEL_44:
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  -[MKUserLocationHeadingConeLayer setBounds:](self, "setBounds:", 0.0, 0.0, v14, v14);
  -[CAShapeLayer setBounds:](self->_maskLayer, "setBounds:", 0.0, 0.0, v15, v15);
  -[CAShapeLayer setPosition:](self->_maskLayer, "setPosition:", v62, v61);
  [(CAShapeLayer *)self->_maskLayer setPath:v18];
  [(CAShapeLayer *)self->_maskLayer setLineWidth:v60];
  self->_double lastAccuracyRadius = v8;
  if (self->_shouldMatchAccuracyRadius)
  {
    [(CAGradientLayer *)self setLocations:v28];
    if (v30) {
      [(CAGradientLayer *)self setColors:v30];
    }
  }
  [MEMORY[0x1E4F39CF8] commit];
  CGPathRelease(v18);
}

- (void)updateTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);

  [(MKUserLocationHeadingConeLayer *)self _updateColors];
}

- (void)updateHeadingAccuracy:(double)a3 previousAccuracy:(double)a4
{
  self->_headingAccuracy = a3;
  -[MKUserLocationHeadingConeLayer _updateHeadingMaskForAccuracy:previousAccuracy:](self, "_updateHeadingMaskForAccuracy:previousAccuracy:");

  [(MKUserLocationHeadingConeLayer *)self _updateShowHeadingForAccuracy:a3];
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);

  [(MKUserLocationHeadingConeLayer *)self _updateColors];
}

- (void)setMinimumAccuracyRadius:(double)a3
{
  self->_double minimumAccuracyRadius = a3;
}

- (void)_updateHeadingMaskForAccuracy:(double)halfMinAngle previousAccuracy:(double)a4
{
  if (halfMinAngle < 0.0) {
    halfMinAngle = 180.0;
  }
  if (halfMinAngle <= self->_halfMinAngle) {
    halfMinAngle = self->_halfMinAngle;
  }
  double v5 = fmin(halfMinAngle, 90.0);
  [(CAShapeLayer *)self->_maskLayer setStrokeStart:(270.0 - v5) / 360.0];
  maskLayer = self->_maskLayer;

  [(CAShapeLayer *)maskLayer setStrokeEnd:(v5 + 270.0) / 360.0];
}

- (void)updateHeading:(double)a3
{
  memset(&v5, 0, sizeof(v5));
  CATransform3DMakeRotation(&v5, a3 * 0.0174532925, 0.0, 0.0, 1.0);
  CATransform3D v4 = v5;
  [(MKUserLocationHeadingConeLayer *)self setTransform:&v4];
}

- (void)setMapType:(unint64_t)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    [(MKUserLocationHeadingConeLayer *)self _updateColors];
  }
}

- (void)_updateColors
{
  id v5 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:self->_traitCollection];
  v3 = [(MKUserLocationHeadingConeLayer *)self _colorsForAccuracyRadius:self->_lastAccuracyRadius];
  [(CAGradientLayer *)self setColors:v3];

  CATransform3D v4 = [(MKUserLocationHeadingConeLayer *)self _accuracyGradientLocationsForAccuracyRadius:self->_lastAccuracyRadius];
  [(CAGradientLayer *)self setLocations:v4];

  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v5];
}

- (id)_colorsForAccuracyRadius:(double)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  if (self->_shouldMatchAccuracyRadius && self->_minimumAccuracyRadius < a3)
  {
    float v4 = flt_18BD1C1C0[[(UITraitCollection *)self->_traitCollection userInterfaceStyle] == UIUserInterfaceStyleDark];
    unint64_t mapType = self->_mapType;
    if (mapType - 1 < 4 || (float v6 = 1.0, mapType == 107)) {
      float v6 = 2.0;
    }
    double v7 = (float)(v4 * v6);
    p_tintColor = &self->_tintColor;
    id v9 = [(UIColor *)self->_tintColor colorWithAlphaComponent:0.0];
    v22[0] = [v9 CGColor];
    v10 = [(UIColor *)self->_tintColor colorWithAlphaComponent:v7];
    v11 = v22;
  }
  else
  {
    UIUserInterfaceStyle v12 = [(UITraitCollection *)self->_traitCollection userInterfaceStyle];
    p_tintColor = &self->_tintColor;
    tintColor = self->_tintColor;
    if (v12 == UIUserInterfaceStyleDark)
    {
      id v9 = [(UIColor *)tintColor colorWithAlphaComponent:1.0];
      uint64_t v21 = [v9 CGColor];
      unint64_t v14 = self->_mapType;
      if (v14 - 1 < 4 || v14 == 107) {
        double v15 = 0.600000024;
      }
      else {
        double v15 = 0.400000006;
      }
      v10 = [(UIColor *)*p_tintColor colorWithAlphaComponent:v15];
      v11 = &v21;
    }
    else
    {
      id v9 = [(UIColor *)tintColor colorWithAlphaComponent:0.800000012];
      v10 = -[UIColor colorWithAlphaComponent:](*p_tintColor, "colorWithAlphaComponent:", 0.25, [v9 CGColor]);
      v11 = &v20;
    }
  }
  id v16 = v10;
  v11[1] = [v16 CGColor];
  id v17 = [(UIColor *)*p_tintColor colorWithAlphaComponent:0.0];
  v11[2] = [v17 CGColor];
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  return v18;
}

- (id)_accuracyGradientLocationsForAccuracyRadius:(double)a3
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (self->_shouldMatchAccuracyRadius && self->_minimumAccuracyRadius < a3)
  {
    double v3 = a3 / (a3 + 18.0);
    float v4 = [NSNumber numberWithDouble:v3 * 0.45];
    id v5 = objc_msgSend(NSNumber, "numberWithDouble:", v3, v4);
    v8[1] = v5;
    v8[2] = &unk_1ED97EF28;
    float v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  }
  else
  {
    float v6 = &unk_1ED97F5C0;
  }

  return v6;
}

- (void)_updateShowHeadingForAccuracy:(double)a3
{
  [(MKUserLocationHeadingConeLayer *)self _opacityForAccuracy:a3 locationAccuracy:self->_lastAccuracyRadius];
  double v5 = v4;
  [(MKUserLocationHeadingConeLayer *)self opacity];
  if (vabdd_f64(v5, v6) >= 0.01)
  {
    double v7 = [(MKUserLocationHeadingConeLayer *)self superlayer];

    if (v7)
    {
      [(MKUserLocationHeadingConeLayer *)self _animateToOpacity:0 completion:v5];
    }
    else
    {
      double v8 = +[MKThreadContext currentContext];
      objc_msgSend(v8, "_CA_setDisableActions:", 1);

      *(float *)&double v9 = v5;
      [(MKUserLocationHeadingConeLayer *)self setOpacity:v9];
      id v10 = +[MKThreadContext currentContext];
      objc_msgSend(v10, "_CA_setDisableActions:", 0);
    }
  }
}

- (void)animateToSetVisible:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = v6;
    [(MKUserLocationHeadingConeLayer *)self _opacityForAccuracy:self->_headingAccuracy locationAccuracy:self->_lastAccuracyRadius];
    -[MKUserLocationHeadingConeLayer _animateToOpacity:completion:](self, "_animateToOpacity:completion:", v7);
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v7 = v6;
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
  id v6 = v7;
LABEL_6:
}

- (double)_opacityForAccuracy:(double)a3 locationAccuracy:(double)a4
{
  BOOL v4 = -[MKUserLocationHeadingConeLayer _shouldShowHeadingForAccuracy:](self, "_shouldShowHeadingForAccuracy:", self->_headingAccuracy, a4);
  double result = 0.0;
  if (v4) {
    return 1.0;
  }
  return result;
}

- (BOOL)_shouldShowHeadingForAccuracy:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  char v6 = [WeakRetained shouldDisplayInaccurateHeading];
  if (a3 < 90.0) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v6;
  }

  return v3;
}

- (void)_animateToOpacity:(double)a3 completion:(id)a4
{
  char v6 = (void *)MEMORY[0x1E4F39B48];
  id v7 = a4;
  id v16 = [v6 animationWithKeyPath:@"opacity"];
  double v8 = NSNumber;
  double v9 = [(CALayer *)self currentLayer];
  [v9 opacity];
  id v10 = objc_msgSend(v8, "numberWithFloat:");
  [v16 setFromValue:v10];

  v11 = [NSNumber numberWithDouble:a3];
  [v16 setToValue:v11];

  [v16 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v16 setDuration:0.5];
  UIUserInterfaceStyle v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v16 setTimingFunction:v12];

  [v16 setRemovedOnCompletion:1];
  [(CALayer *)self _mapkit_addAnimation:v16 forKey:@"fadeAnimation" completion:v7];

  double v13 = +[MKThreadContext currentContext];
  objc_msgSend(v13, "_CA_setDisableActions:", 1);

  *(float *)&double v14 = a3;
  [(MKUserLocationHeadingConeLayer *)self setOpacity:v14];
  double v15 = +[MKThreadContext currentContext];
  objc_msgSend(v15, "_CA_setDisableActions:", 0);
}

- (MKUserLocationHeadingConeLayer)initWithUserLocationView:(id)a3 shouldMatchAccuracyRadius:(BOOL)a4 minimumPresentationAngle:(double)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKUserLocationHeadingConeLayer;
  double v9 = [(MKUserLocationHeadingConeLayer *)&v19 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_userLocationView, v8);
    v10->_shouldMatchAccuracyRadius = a4;
    v10->_halfMinAngle = a5 * 0.5;
    uint64_t v11 = [MEMORY[0x1E4F428B8] systemBlueColor];
    tintColor = v10->_tintColor;
    v10->_tintColor = (UIColor *)v11;

    v20[0] = @"locations";
    double v13 = [MEMORY[0x1E4F1CA98] null];
    v20[1] = @"colors";
    v21[0] = v13;
    double v14 = [MEMORY[0x1E4F1CA98] null];
    v21[1] = v14;
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    [(MKUserLocationHeadingConeLayer *)v10 setActions:v15];

    [(MKUserLocationHeadingConeLayer *)v10 setName:@"heading"];
    -[MKUserLocationHeadingConeLayer setAnchorPoint:](v10, "setAnchorPoint:", 0.5, 0.5);
    [(CAGradientLayer *)v10 setType:*MEMORY[0x1E4F3A3A0]];
    -[CAGradientLayer setStartPoint:](v10, "setStartPoint:", 0.5, 0.5);
    -[CAGradientLayer setEndPoint:](v10, "setEndPoint:", 1.0, 1.0);
    [(id)objc_opt_class() baseDiameter];
    -[MKUserLocationHeadingConeLayer setBounds:](v10, "setBounds:", 0.0, 0.0, v16 + 66.0, v16 + 66.0);
    [(MKUserLocationHeadingConeLayer *)v10 _createMaskLayer];
    id v17 = v10;
  }

  return v10;
}

- (void)_createMaskLayer
{
  BOOL v3 = [MEMORY[0x1E4F39C88] layer];
  maskLayer = self->_maskLayer;
  self->_maskLayer = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  [(id)objc_opt_class() baseDiameter];
  double v7 = v6;

  -[CAShapeLayer setBounds:](self->_maskLayer, "setBounds:", 0.0, 0.0, v7 + 33.0, v7 + 33.0);
  [(MKUserLocationHeadingConeLayer *)self bounds];
  double MidX = CGRectGetMidX(v14);
  [(MKUserLocationHeadingConeLayer *)self bounds];
  -[CAShapeLayer setPosition:](self->_maskLayer, "setPosition:", MidX, CGRectGetMidY(v15));
  -[CAShapeLayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", 0.5, 0.5);
  [(CAShapeLayer *)self->_maskLayer setFillColor:0];
  id v9 = [MEMORY[0x1E4F428B8] blackColor];
  -[CAShapeLayer setStrokeColor:](self->_maskLayer, "setStrokeColor:", [v9 CGColor]);

  [(CAShapeLayer *)self->_maskLayer setLineWidth:33.0];
  id v10 = (void *)MEMORY[0x1E4F427D0];
  [(CAShapeLayer *)self->_maskLayer bounds];
  objc_msgSend(v10, "bezierPathWithOvalInRect:");
  id v11 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", [v11 CGPath]);

  UIUserInterfaceStyle v12 = self->_maskLayer;

  [(MKUserLocationHeadingConeLayer *)self setMask:v12];
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)minimumAccuracyRadius
{
  return self->_minimumAccuracyRadius;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);

  objc_destroyWeak((id *)&self->_userLocationView);
}

@end