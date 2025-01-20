@interface _MKPuckAccuracyLayer
- (BOOL)isFaux3DEnabled;
- (BOOL)isStale;
- (CGRect)significantBounds;
- (UIColor)tintColor;
- (UITraitCollection)traitCollection;
- (_MKPuckAccuracyLayer)init;
- (double)accuracy;
- (double)currentAccuracy;
- (double)mapCameraDistance;
- (double)mapPitchRadians;
- (double)minimumRadius;
- (double)presentationFillOpacity;
- (unint64_t)mapType;
- (void)_createFaux3DRings;
- (void)_updateColors;
- (void)_updateFaux3DRingsIfNecessary;
- (void)setAccuracy:(double)a3 duration:(double)a4;
- (void)setFaux3DEnabled:(BOOL)a3;
- (void)setFillOpacity:(double)a3 duration:(double)a4;
- (void)setHidden:(BOOL)a3;
- (void)setMapCameraDistance:(double)a3;
- (void)setMapPitchRadians:(double)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setMinimumRadius:(double)a3;
- (void)setStale:(BOOL)a3;
- (void)setStrokeOpacity:(double)a3 duration:(double)a4;
- (void)setTintColor:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)startAnimationsIfNecessary;
- (void)stopAnimations;
- (void)updateLegacyConfiguration;
@end

@implementation _MKPuckAccuracyLayer

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (double)accuracy
{
  [(CALayer *)self->_ring bounds];
  return v2 * 0.5;
}

- (void)setMapCameraDistance:(double)a3
{
  if (vabdd_f64(a3, self->_mapCameraDistance) >= 0.00000011920929)
  {
    self->_mapCameraDistance = a3;
    [(_MKPuckAccuracyLayer *)self _updateFaux3DRingsIfNecessary];
  }
}

- (void)_createFaux3DRings
{
  if (self->_faux3DEnabled)
  {
    uint64_t v3 = 6;
    v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      v7 = [MEMORY[0x1E4F39BE8] layer];
      objc_msgSend(v7, "setAnchorPoint:", v5, v6);
      v8 = [(CALayer *)self->_ring actions];
      [v7 setActions:v8];

      [v7 setHidden:1];
      [(NSArray *)v4 addObject:v7];
      [(CALayer *)self->_faux3DHighlightMask insertSublayer:v7 atIndex:0];

      --v3;
    }
    while (v3);
    faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
    self->_faux3DHighlightMaskRings = v4;
    v13 = v4;

    v10 = [MEMORY[0x1E4F39BE8] layer];
    faux3DShadow = self->_faux3DShadow;
    self->_faux3DShadow = v10;

    -[CALayer setAnchorPoint:](self->_faux3DShadow, "setAnchorPoint:", 0.5, 0.5);
    v12 = [(CALayer *)self->_ring actions];
    [(CALayer *)self->_faux3DShadow setActions:v12];

    [(CALayer *)self->_faux3DShadow setHidden:1];
    [(_MKPuckAccuracyLayer *)self insertSublayer:self->_faux3DShadow atIndex:0];
  }
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);

  [(_MKPuckAccuracyLayer *)self _updateColors];
}

- (void)_updateColors
{
  v47[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F42000uLL;
  v4 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:self->_traitCollection];
  if (self->_stale)
  {
    _MKPuckAnnotationViewInnerStaleColor();
    double v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v5 = self->_tintColor;
  }
  double v6 = v5;
  unint64_t mapType = self->_mapType;
  if (mapType - 1 < 4 || (float v8 = 1.0, mapType == 107)) {
    float v8 = 2.0;
  }
  double v9 = (float)(v8 * flt_18BD1C2E0[!self->_stale]);
  objc_storeStrong((id *)&self->_fullOpacityFillColor, v5);
  self->_baseOpacity = v9;
  id v10 = [(UIColor *)self->_fullOpacityFillColor colorWithAlphaComponent:self->_additionalOpacityMultiplier * v9];
  -[CALayer setBackgroundColor:](self->_ring, "setBackgroundColor:", [v10 CGColor]);

  if (_MKModernPuckDesignEnabled())
  {
    _MKPuckAnnotationViewBaseColor(self->_mapType, 1);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    fullOpacityStrokeColor = self->_fullOpacityStrokeColor;
    self->_fullOpacityStrokeColor = v11;

    p_baseStrokeOpacity = &self->_baseStrokeOpacity;
    if (![(UIColor *)self->_fullOpacityStrokeColor getRed:0 green:0 blue:0 alpha:&self->_baseStrokeOpacity])double *p_baseStrokeOpacity = 1.0; {
    -[UIColor colorWithAlphaComponent:](self->_fullOpacityStrokeColor, "colorWithAlphaComponent:", self->_additionalStrokeOpacityMultiplier, v6, v4);
    }
    id v14 = objc_claimAutoreleasedReturnValue();
    -[CALayer setBorderColor:](self->_ring, "setBorderColor:", [v14 CGColor]);

    [(CALayer *)self->_ring setBorderWidth:3.0];
    v15 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    BOOL v16 = [v15 userInterfaceStyle] == 2;

    self->_useDarkAppearance = v16;
    [(CALayer *)self->_ring setShadowRadius:4.0];
    -[CALayer setShadowOffset:](self->_ring, "setShadowOffset:", 0.0, 1.0);
    _MKUserLocationViewBaseShadowColor();
    id v17 = objc_claimAutoreleasedReturnValue();
    -[CALayer setShadowColor:](self->_ring, "setShadowColor:", [v17 CGColor]);

    double mapPitchRadians = self->_mapPitchRadians;
    if (!self->_faux3DEnabled || (float v19 = 0.0, mapPitchRadians <= 0.0))
    {
      double v20 = dbl_18BD1C2D0[!self->_useDarkAppearance];
      if (self->_useDarkAppearance) {
        double v21 = 0.300000012;
      }
      else {
        double v21 = 0.5;
      }
      long double v22 = 1.0 - cos(mapPitchRadians);
      double mapPitchRadians = v22 * v21 + (1.0 - v22) * v20;
      float v19 = mapPitchRadians;
    }
    *(float *)&double mapPitchRadians = v19;
    [(CALayer *)self->_ring setShadowOpacity:mapPitchRadians];
    if (self->_faux3DHighlight)
    {
      v23 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckFaux3DFaceHighlight");
      v24 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckFaux3DFaceDark");
      objc_msgSend(v23, "_mapkit_blendedColorWithFraction:ofColor:", v24, 0.200000003);
      id v25 = objc_claimAutoreleasedReturnValue();
      v47[0] = [v25 CGColor];
      id v26 = v23;
      v47[1] = [v26 CGColor];
      id v27 = v24;
      v47[2] = [v27 CGColor];
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
      [(CAGradientLayer *)self->_faux3DHighlight setColors:v28];
      [(CAGradientLayer *)self->_faux3DHighlight setLocations:&unk_1ED97F5D8];
      double v29 = *p_baseStrokeOpacity * self->_additionalStrokeOpacityMultiplier;
      *(float *)&double v29 = v29;
      [(CAGradientLayer *)self->_faux3DHighlight setOpacity:v29];
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v30 = self->_faux3DHighlightMaskRings;
    uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckFaux3DFaceDark");
          id v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setBorderColor:", objc_msgSend(v36, "CGColor"));

          [(CALayer *)self->_ring borderWidth];
          objc_msgSend(v35, "setBorderWidth:");
        }
        uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v32);
    }

    id v37 = [MEMORY[0x1E4F428B8] clearColor];
    -[CALayer setBorderColor:](self->_faux3DShadow, "setBorderColor:", [v37 CGColor]);

    [(CALayer *)self->_ring borderWidth];
    -[CALayer setBorderWidth:](self->_faux3DShadow, "setBorderWidth:");
    [(CALayer *)self->_faux3DShadow setShadowRadius:4.0];
    _MKUserLocationViewBaseShadowColor();
    id v38 = objc_claimAutoreleasedReturnValue();
    -[CALayer setShadowColor:](self->_faux3DShadow, "setShadowColor:", [v38 CGColor]);

    -[CALayer setShadowOffset:](self->_faux3DShadow, "setShadowOffset:", 0.0, 1.0);
    [(CALayer *)self->_faux3DShadow setShadowOpacity:0.0];
    [(_MKPuckAccuracyLayer *)self _updateFaux3DRingsIfNecessary];
    double v6 = v40;
    v4 = v41;
    unint64_t v3 = 0x1E4F42000;
  }
  else
  {
    v39 = self->_fullOpacityStrokeColor;
    self->_fullOpacityStrokeColor = 0;

    [(CALayer *)self->_ring setBorderColor:0];
    [(CALayer *)self->_ring setBorderWidth:0.0];
    [(CALayer *)self->_ring setShadowOpacity:0.0];
  }
  [*(id *)(v3 + 3968) setCurrentTraitCollection:v4];
}

- (void)_updateFaux3DRingsIfNecessary
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (self->_faux3DEnabled)
  {
    double mapPitchRadians = self->_mapPitchRadians;
    double v4 = dbl_18BD1C2D0[!self->_useDarkAppearance];
    if (self->_useDarkAppearance) {
      double v5 = 0.300000012;
    }
    else {
      double v5 = 0.5;
    }
    double v6 = 1.0 - cos(self->_mapPitchRadians);
    double v7 = v6 * v5 + (1.0 - v6) * v4;
    if (fabs(mapPitchRadians) >= 0.000001)
    {
      double mapCameraDistance = self->_mapCameraDistance;
      if (mapCameraDistance > 23000.0) {
        double mapCameraDistance = 23000.0;
      }
      if (mapCameraDistance <= 1440.0) {
        double v16 = 1.0;
      }
      else {
        double v16 = (mapCameraDistance + -1440.0) / -21560.0 + 1.0;
      }
      double v17 = v6 * (v16 * 12.0 + (1.0 - v16) * 0.0);
      CATransform3DMakeTranslation(&v60, 0.0, -v17, 0.0);
      ring = self->_ring;
      CATransform3D v59 = v60;
      [(CALayer *)ring setTransform:&v59];
      [(CALayer *)self->_ring setShadowOpacity:0.0];
      [(CALayer *)self->_ring bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v17 + v25;
      -[CAGradientLayer setBounds:](self->_faux3DHighlight, "setBounds:");
      -[CAGradientLayer setPosition:](self->_faux3DHighlight, "setPosition:", 0.0, v17 * -0.5 + 2.0);
      -[CALayer setFrame:](self->_faux3DHighlightMask, "setFrame:", v20, v22, v24, v26);
      [(CAGradientLayer *)self->_faux3DHighlight setHidden:0];
      [(CALayer *)self->_ring bounds];
      double v28 = v27;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      double v29 = self->_faux3DHighlightMaskRings;
      uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        char v32 = 0;
        double v33 = v26 - v28 + -1.0;
        double v34 = v33 - v17;
        uint64_t v35 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v56 != v35) {
              objc_enumerationMutation(v29);
            }
            id v37 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            double v34 = v34 + 2.0;
            if (v34 >= v33)
            {
              if (v32)
              {
                char v32 = 1;
                [*(id *)(*((void *)&v55 + 1) + 8 * i) setHidden:1];
              }
              else
              {
                [*(id *)(*((void *)&v55 + 1) + 8 * i) setHidden:0];
                CATransform3DMakeTranslation(&v54, 0.0, v33, 0.0);
                CATransform3D v53 = v54;
                [v37 setTransform:&v53];
                char v32 = 1;
              }
            }
            else
            {
              [*(id *)(*((void *)&v55 + 1) + 8 * i) setHidden:0];
              CATransform3DMakeTranslation(&v52, 0.0, v34, 0.0);
              CATransform3D v51 = v52;
              [v37 setTransform:&v51];
            }
          }
          uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v31);
      }

      [(CALayer *)self->_faux3DShadow setHidden:0];
      id v38 = self->_ring;
      if (v38)
      {
        [(CALayer *)v38 transform];
      }
      else
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
      }
      faux3DShadow = self->_faux3DShadow;
      v42[4] = v47;
      v42[5] = v48;
      v42[6] = v49;
      v42[7] = v50;
      v42[0] = v43;
      v42[1] = v44;
      v42[2] = v45;
      v42[3] = v46;
      [(CALayer *)faux3DShadow setTransform:v42];
      *(float *)&double v40 = v7;
      [(CALayer *)self->_faux3DShadow setShadowOpacity:v40];
      long double v41 = cos(self->_mapPitchRadians);
      -[CALayer setShadowOffset:](self->_faux3DShadow, "setShadowOffset:", 0.0, (double)(v17 + 1.0 + 1.0 - v41 + 1.0 - v41));
    }
    else
    {
      double v8 = v7 * self->_additionalStrokeOpacityMultiplier;
      *(float *)&double v8 = v8;
      [(CALayer *)self->_ring setShadowOpacity:v8];
      long long v64 = 0u;
      long long v63 = 0u;
      long long v62 = 0u;
      long long v61 = 0u;
      double v9 = self->_faux3DHighlightMaskRings;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v62;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v62 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v61 + 1) + 8 * j);
            [v14 setHidden:1];
            [v14 setShadowOpacity:0.0];
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v11);
      }

      [(CAGradientLayer *)self->_faux3DHighlight setHidden:1];
      [(CALayer *)self->_faux3DShadow setHidden:1];
    }
  }
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);

  [(_MKPuckAccuracyLayer *)self _updateColors];
}

- (void)setMinimumRadius:(double)a3
{
  self->_minimumRadius = a3;
  [(CALayer *)self->_ring bounds];
  if (CGRectGetWidth(v5) * 0.5 < self->_minimumRadius)
  {
    self->_internallyHidden = 1;
    v4.receiver = self;
    v4.super_class = (Class)_MKPuckAccuracyLayer;
    [(_MKPuckAccuracyLayer *)&v4 setHidden:1];
  }
}

- (void)setMapType:(unint64_t)a3
{
  self->_unint64_t mapType = a3;
  [(_MKPuckAccuracyLayer *)self _updateColors];
}

- (void)startAnimationsIfNecessary
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  self->_shouldShowAnimationsIfAvailable = 1;
  char v3 = _MKModernPuckDesignEnabled();
  ring = self->_ring;
  if (v3)
  {
    CGRect v5 = [(CALayer *)ring animationForKey:@"pulse"];

    if (!v5) {
      goto LABEL_12;
    }
    faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
    if (!faux3DHighlightMaskRings) {
      return;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v7 = faux3DHighlightMaskRings;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (!v8) {
      goto LABEL_20;
    }
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = [*(id *)(*((void *)&v29 + 1) + 8 * i) animationForKey:@"pulse"];
        v10 |= v13 == 0;
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v9);

    if (v10)
    {
LABEL_12:
      double v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"borderWidth"];
      [(NSArray *)v7 setFromValue:&unk_1ED97E110];
      [(NSArray *)v7 setToValue:&unk_1ED97E120];
      [(NSArray *)v7 setDuration:1.5];
      [(NSArray *)v7 setRemovedOnCompletion:0];
      [(NSArray *)v7 setFillMode:*MEMORY[0x1E4F39FA0]];
      [(NSArray *)v7 setAutoreverses:1];
      LODWORD(v14) = 2139095039;
      [(NSArray *)v7 setRepeatCount:v14];
      [(NSArray *)v7 setFrameInterval:0.0250000004];
      [(CALayer *)self->_ring addAnimation:v7 forKey:@"pulse"];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v15 = self->_faux3DHighlightMaskRings;
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "addAnimation:forKey:", v7, @"pulse", (void)v25);
          }
          uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
        }
        while (v17);
      }

      [(CALayer *)self->_faux3DShadow addAnimation:v7 forKey:@"pulse"];
LABEL_20:
    }
  }
  else
  {
    [(CALayer *)ring removeAnimationForKey:@"pulse"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v20 = self->_faux3DHighlightMaskRings;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * k) removeAnimationForKey:@"pulse"];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v22);
    }

    [(CALayer *)self->_faux3DShadow removeAnimationForKey:@"pulse"];
  }
}

- (_MKPuckAccuracyLayer)init
{
  v11.receiver = self;
  v11.super_class = (Class)_MKPuckAccuracyLayer;
  double v2 = [(_MKPuckAccuracyLayer *)&v11 init];
  char v3 = v2;
  if (v2)
  {
    v2->_additionalOpacityMultiplier = 1.0;
    v2->_additionalStrokeOpacityMultiplier = 1.0;
    uint64_t v4 = [MEMORY[0x1E4F39BE8] layer];
    ring = v3->_ring;
    v3->_ring = (CALayer *)v4;

    [(_MKPuckAccuracyLayer *)v3 bounds];
    -[CALayer setFrame:](v3->_ring, "setFrame:");
    [(_MKPuckAccuracyLayer *)v3 bounds];
    [(CALayer *)v3->_ring setCornerRadius:v6 * 0.5];
    [(CALayer *)v3->_ring _mapkit_setActionsToRemoveDefaultImplicitActions];
    [(_MKPuckAccuracyLayer *)v3 bounds];
    double v7 = CGPathCreateWithEllipseInRect(v12, 0);
    CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v7, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
    [(CALayer *)v3->_ring setShadowPath:CopyByStrokingPath];
    CGPathRelease(v7);
    CGPathRelease(CopyByStrokingPath);
    [(_MKPuckAccuracyLayer *)v3 addSublayer:v3->_ring];
    [(_MKPuckAccuracyLayer *)v3 updateLegacyConfiguration];
    uint64_t v9 = v3;
  }

  return v3;
}

- (void)updateLegacyConfiguration
{
  [(_MKPuckAccuracyLayer *)self _updateColors];

  [(_MKPuckAccuracyLayer *)self startAnimationsIfNecessary];
}

- (void)setFaux3DEnabled:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_faux3DEnabled != a3)
  {
    self->_faux3DEnabled = a3;
    if (a3)
    {
      uint64_t v4 = [MEMORY[0x1E4F39BD0] layer];
      faux3DHighlight = self->_faux3DHighlight;
      self->_faux3DHighlight = v4;

      [(CAGradientLayer *)self->_faux3DHighlight _mapkit_setActionsToRemoveDefaultImplicitActions];
      -[CAGradientLayer setStartPoint:](self->_faux3DHighlight, "setStartPoint:", 0.0, 0.5);
      -[CAGradientLayer setEndPoint:](self->_faux3DHighlight, "setEndPoint:", 1.0, 0.5);
      double v6 = [MEMORY[0x1E4F39BE8] layer];
      faux3DHighlightMasuint64_t k = self->_faux3DHighlightMask;
      self->_faux3DHighlightMasuint64_t k = v6;

      [(CALayer *)self->_faux3DHighlightMask _mapkit_setActionsToRemoveDefaultImplicitActions];
      [(CAGradientLayer *)self->_faux3DHighlight setMask:self->_faux3DHighlightMask];
      [(_MKPuckAccuracyLayer *)self _createFaux3DRings];
      [(_MKPuckAccuracyLayer *)self insertSublayer:self->_faux3DHighlight atIndex:0];
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v8 = self->_faux3DHighlightMaskRings;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperlayer];
          }
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
      self->_faux3DHighlightMaskRings = 0;

      [(CAGradientLayer *)self->_faux3DHighlight removeFromSuperlayer];
      double v14 = self->_faux3DHighlight;
      self->_faux3DHighlight = 0;

      ring = self->_ring;
      long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v24[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v24[5] = v16;
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v24[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v24[7] = v17;
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v24[0] = *MEMORY[0x1E4F39B10];
      v24[1] = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v24[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v24[3] = v19;
      [(CALayer *)ring setTransform:v24];
      double v20 = dbl_18BD1C2D0[!self->_useDarkAppearance];
      if (self->_useDarkAppearance) {
        double v21 = 0.300000012;
      }
      else {
        double v21 = 0.5;
      }
      long double v22 = cos(self->_mapPitchRadians);
      long double v23 = (1.0 - v22) * v21 + (1.0 - (1.0 - v22)) * v20;
      *(float *)&long double v23 = v23;
      [(CALayer *)self->_ring setShadowOpacity:(double)v23];
    }
    [(_MKPuckAccuracyLayer *)self _updateColors];
    [(_MKPuckAccuracyLayer *)self _updateFaux3DRingsIfNecessary];
    if (self->_shouldShowAnimationsIfAvailable) {
      [(_MKPuckAccuracyLayer *)self startAnimationsIfNecessary];
    }
  }
}

- (void)setAccuracy:(double)a3 duration:(double)a4
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  if (self->_minimumRadius >= a3) {
    double minimumRadius = self->_minimumRadius;
  }
  else {
    double minimumRadius = a3;
  }
  long double mapPitchRadians = self->_mapPitchRadians;
  double v8 = 0.0;
  if (mapPitchRadians > 0.0)
  {
    double mapCameraDistance = self->_mapCameraDistance;
    double v10 = 1.0 - cos(mapPitchRadians);
    double v11 = 23000.0;
    if (mapCameraDistance <= 23000.0) {
      double v11 = mapCameraDistance;
    }
    if (v11 <= 1440.0) {
      double v12 = 1.0;
    }
    else {
      double v12 = (v11 + -1440.0) / -21560.0 + 1.0;
    }
    double v8 = v10 * (v12 * 12.0 + (1.0 - v12) * 0.0);
  }
  v13 = [(CALayer *)self->_ring currentLayer];
  [v13 bounds];
  CGFloat v95 = v14;
  CGFloat v16 = v15;
  CGFloat v102 = v18;
  CGFloat v104 = v17;

  long long v19 = [(CAGradientLayer *)self->_faux3DHighlight currentLayer];
  [v19 bounds];
  uint64_t v97 = v21;
  uint64_t v98 = v20;
  uint64_t v100 = v23;
  uint64_t v101 = v22;

  double v24 = [(CAGradientLayer *)self->_faux3DHighlight currentLayer];
  [v24 position];
  uint64_t v91 = v26;
  uint64_t v93 = v25;

  if (a4 <= 0.0)
  {
    long long v29 = [(CALayer *)self->_ring animationForKey:@"radius"];
    uint64_t v30 = v29;
    BOOL v27 = v29 != 0;
    if (v29)
    {
      [v29 beginTime];
      double v99 = v31;
      [(_MKPuckAccuracyLayer *)self convertTime:0 fromLayer:CACurrentMediaTime()];
      double v33 = v32;
      [v30 beginTime];
      double v28 = 0.0;
      if (v33 - v34 > 0.0)
      {
        [v30 beginTime];
        double v28 = v33 - v35;
      }
      objc_msgSend(v30, "duration", v91, v93);
      a4 = v36;
    }
    else
    {
      double v99 = 0.0;
      double v28 = 0.0;
    }
  }
  else
  {
    double v99 = 0.0;
    BOOL v27 = 1;
    double v28 = 0.0;
  }
  double v37 = v8 * -0.5;
  [(CALayer *)self->_ring removeAnimationForKey:@"radius", v91, v93];
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v38 = self->_faux3DHighlightMaskRings;
  uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v124 objects:v133 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v125 != v41) {
          objc_enumerationMutation(v38);
        }
        [*(id *)(*((void *)&v124 + 1) + 8 * i) removeAnimationForKey:@"radius"];
      }
      uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v124 objects:v133 count:16];
    }
    while (v40);
  }
  double v43 = minimumRadius + minimumRadius + v8;

  [(CAGradientLayer *)self->_faux3DHighlight removeAnimationForKey:@"radius"];
  [(CALayer *)self->_faux3DHighlightMask removeAnimationForKey:@"radius"];
  [(CALayer *)self->_faux3DShadow removeAnimationForKey:@"radius"];
  v135.origin.x = 0.0;
  v135.origin.y = 0.0;
  v135.size.width = minimumRadius + minimumRadius;
  v135.size.height = minimumRadius + minimumRadius;
  long long v44 = CGPathCreateWithEllipseInRect(v135, 0);
  CGPathRef CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v44, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
  CGPathRelease(v44);
  if (v27)
  {
    v136.origin.x = v95;
    v136.origin.y = v16;
    v136.size.height = v102;
    v136.size.width = v104;
    double Width = CGRectGetWidth(v136);
    if (self->_internallyHidden)
    {
      double v47 = Width * 0.5;
      double v48 = self->_minimumRadius;
      if (v47 > v48 || minimumRadius > v48)
      {
        self->_internallyHidden = 0;
        BOOL externallyHidden = self->_externallyHidden;
        v123.receiver = self;
        v123.super_class = (Class)_MKPuckAccuracyLayer;
        [(_MKPuckAccuracyLayer *)&v123 setHidden:externallyHidden];
      }
    }
    v132[0] = &unk_1ED97EF70;
    long long v50 = [NSNumber numberWithDouble:v28 / a4];
    v132[1] = v50;
    v132[2] = &unk_1ED97EF88;
    CATransform3D v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:3];

    *(CGFloat *)v122 = v95;
    *(CGFloat *)&v122[1] = v16;
    *(CGFloat *)&v122[2] = v104;
    *(CGFloat *)&v122[3] = v102;
    CATransform3D v52 = [MEMORY[0x1E4F29238] valueWithBytes:v122 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v121[0] = 0;
    v121[1] = 0;
    *(double *)&v121[2] = minimumRadius + minimumRadius;
    *(double *)&v121[3] = minimumRadius + minimumRadius;
    CATransform3D v53 = [MEMORY[0x1E4F29238] valueWithBytes:v121 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    CATransform3D v54 = _accuracyRadiusAnimation(@"bounds", v52, v53, v51);

    long long v55 = NSNumber;
    long long v56 = [(CALayer *)self->_ring currentLayer];
    [v56 cornerRadius];
    long long v57 = objc_msgSend(v55, "numberWithDouble:");
    long long v58 = [NSNumber numberWithDouble:minimumRadius];
    uint64_t v59 = _accuracyRadiusAnimation(@"cornerRadius", v57, v58, v51);

    CATransform3D v60 = [(CALayer *)self->_ring currentLayer];
    uint64_t v61 = _accuracyRadiusAnimation(@"shadowPath", (void *)[v60 shadowPath], CopyByStrokingPath, v51);

    long long v62 = [MEMORY[0x1E4F39B38] animation];
    v131[0] = v54;
    v103 = (void *)v59;
    v131[1] = v59;
    v96 = (void *)v61;
    v131[2] = v61;
    long long v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:3];
    [v62 setAnimations:v63];

    [v62 setDuration:a4];
    if (v99 > 0.0) {
      [v62 setBeginTime:v99];
    }
    ring = self->_ring;
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __45___MKPuckAccuracyLayer_setAccuracy_duration___block_invoke;
    v120[3] = &unk_1E54BEE60;
    v120[4] = self;
    *(double *)&v120[5] = minimumRadius;
    [(CALayer *)ring _mapkit_addAnimation:v62 forKey:@"radius" completion:v120];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    v65 = self->_faux3DHighlightMaskRings;
    uint64_t v66 = [(NSArray *)v65 countByEnumeratingWithState:&v116 objects:v130 count:16];
    double v67 = v43;
    if (v66)
    {
      uint64_t v68 = v66;
      uint64_t v69 = *(void *)v117;
      do
      {
        for (uint64_t j = 0; j != v68; ++j)
        {
          if (*(void *)v117 != v69) {
            objc_enumerationMutation(v65);
          }
          [*(id *)(*((void *)&v116 + 1) + 8 * j) addAnimation:v62 forKey:@"radius"];
        }
        uint64_t v68 = [(NSArray *)v65 countByEnumeratingWithState:&v116 objects:v130 count:16];
      }
      while (v68);
    }

    [(CALayer *)self->_faux3DShadow addAnimation:v62 forKey:@"radius"];
    if (self->_faux3DHighlight)
    {
      v115[0] = v98;
      v115[1] = v97;
      v115[2] = v101;
      v115[3] = v100;
      v71 = [MEMORY[0x1E4F29238] valueWithBytes:v115 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v114[0] = 0;
      v114[1] = 0;
      *(double *)&v114[2] = minimumRadius + minimumRadius;
      *(double *)&v114[3] = v43;
      v72 = [MEMORY[0x1E4F29238] valueWithBytes:v114 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      uint64_t v73 = _accuracyRadiusAnimation(@"bounds", v71, v72, v51);

      v113[0] = v94;
      v113[1] = v92;
      v74 = [MEMORY[0x1E4F29238] valueWithBytes:v113 objCType:"{CGPoint=dd}"];
      v112[0] = 0;
      *(double *)&v112[1] = v37 + 2.0;
      v75 = [MEMORY[0x1E4F29238] valueWithBytes:v112 objCType:"{CGPoint=dd}"];
      v76 = _accuracyRadiusAnimation(@"position", v74, v75, v51);

      v77 = [MEMORY[0x1E4F39B38] animation];

      v129[0] = v73;
      v129[1] = v76;
      v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:2];
      [v77 setAnimations:v78];

      [v77 setDuration:a4];
      if (v99 > 0.0) {
        [v77 setBeginTime:v99];
      }
      [(CAGradientLayer *)self->_faux3DHighlight addAnimation:v77 forKey:@"radius"];
      v111[0] = v98;
      v111[1] = v97;
      v111[2] = v101;
      v111[3] = v100;
      v79 = [MEMORY[0x1E4F29238] valueWithBytes:v111 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v110[0] = 0;
      v110[1] = 0;
      *(double *)&v110[2] = minimumRadius + minimumRadius;
      *(double *)&v110[3] = v43;
      v80 = [MEMORY[0x1E4F29238] valueWithBytes:v110 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v81 = _accuracyRadiusAnimation(@"frame", v79, v80, v51);

      [v81 setDuration:a4];
      if (v99 > 0.0) {
        [v81 setBeginTime:v99];
      }
      [(CALayer *)self->_faux3DHighlightMask addAnimation:v81 forKey:@"radius"];

      CATransform3D v54 = (void *)v73;
    }
    else
    {
      v77 = v62;
    }
  }
  else
  {
    double v82 = self->_minimumRadius;
    BOOL v83 = minimumRadius < v82;
    if (vabdd_f64(minimumRadius, v82) < 0.01) {
      BOOL v83 = 1;
    }
    self->_internallyHidden = v83;
    uint64_t v84 = self->_externallyHidden || v83;
    v109.receiver = self;
    v109.super_class = (Class)_MKPuckAccuracyLayer;
    [(_MKPuckAccuracyLayer *)&v109 setHidden:v84];
    double v67 = v43;
  }
  -[CALayer setBounds:](self->_ring, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, minimumRadius + minimumRadius);
  [(CALayer *)self->_ring setCornerRadius:minimumRadius];
  [(CALayer *)self->_ring setShadowPath:CopyByStrokingPath];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v85 = self->_faux3DHighlightMaskRings;
  uint64_t v86 = [(NSArray *)v85 countByEnumeratingWithState:&v105 objects:v128 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v106;
    do
    {
      for (uint64_t k = 0; k != v87; ++k)
      {
        if (*(void *)v106 != v88) {
          objc_enumerationMutation(v85);
        }
        v90 = *(void **)(*((void *)&v105 + 1) + 8 * k);
        objc_msgSend(v90, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, minimumRadius + minimumRadius);
        [v90 setCornerRadius:minimumRadius];
        [v90 setShadowPath:CopyByStrokingPath];
      }
      uint64_t v87 = [(NSArray *)v85 countByEnumeratingWithState:&v105 objects:v128 count:16];
    }
    while (v87);
  }

  -[CALayer setBounds:](self->_faux3DShadow, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, minimumRadius + minimumRadius);
  [(CALayer *)self->_faux3DShadow setCornerRadius:minimumRadius];
  [(CALayer *)self->_faux3DShadow setShadowPath:CopyByStrokingPath];
  -[CAGradientLayer setBounds:](self->_faux3DHighlight, "setBounds:", 0.0, 0.0, minimumRadius + minimumRadius, v67);
  -[CAGradientLayer setPosition:](self->_faux3DHighlight, "setPosition:", 0.0, v37 + 2.0);
  -[CALayer setFrame:](self->_faux3DHighlightMask, "setFrame:", 0.0, 0.0, minimumRadius + minimumRadius, v67);
  CGPathRelease(CopyByStrokingPath);
}

- (void)setMapPitchRadians:(double)a3
{
  if (vabdd_f64(a3, self->_mapPitchRadians) >= 0.000001)
  {
    self->_long double mapPitchRadians = a3;
    [(_MKPuckAccuracyLayer *)self _updateFaux3DRingsIfNecessary];
  }
}

- (void)setStale:(BOOL)a3
{
  self->_stale = a3;
  [(_MKPuckAccuracyLayer *)self _updateColors];
}

- (double)currentAccuracy
{
  double v2 = [(CALayer *)self->_ring currentLayer];
  [v2 bounds];
  double v4 = v3 * 0.5;

  return v4;
}

- (CGRect)significantBounds
{
  ring = self->_ring;
  [(CALayer *)ring bounds];

  -[CALayer convertRect:toLayer:](ring, "convertRect:toLayer:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)presentationFillOpacity
{
  return self->_baseOpacity * self->_additionalOpacityMultiplier;
}

- (void)setFillOpacity:(double)a3 duration:(double)a4
{
  if (vabdd_f64(a3, self->_additionalOpacityMultiplier) >= 0.000001)
  {
    self->_additionalOpacityMultiplier = a3;
    double v6 = [(UIColor *)self->_fullOpacityFillColor colorWithAlphaComponent:self->_baseOpacity * a3];
    if (a4 <= 0.0)
    {
      [(CALayer *)self->_ring removeAnimationForKey:@"opacity"];
    }
    else
    {
      double v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"backgroundColor"];
      double v8 = [(CALayer *)self currentLayer];
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v8, "backgroundColor"));

      objc_msgSend(v7, "setToValue:", objc_msgSend(v6, "CGColor"));
      [v7 setDuration:a4];
      uint64_t v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v7 setTimingFunction:v9];

      [(CALayer *)self->_ring addAnimation:v7 forKey:@"opacity"];
    }
    double v10 = +[MKThreadContext currentContext];
    objc_msgSend(v10, "_CA_setDisableActions:", 1);

    id v12 = v6;
    -[CALayer setBackgroundColor:](self->_ring, "setBackgroundColor:", [v12 CGColor]);
    double v11 = +[MKThreadContext currentContext];
    objc_msgSend(v11, "_CA_setDisableActions:", 0);
  }
}

- (void)setStrokeOpacity:(double)a3 duration:(double)a4
{
  if (vabdd_f64(a3, self->_additionalStrokeOpacityMultiplier) >= 0.000001)
  {
    self->_double additionalStrokeOpacityMultiplier = a3;
    double v7 = dbl_18BD1C2D0[!self->_useDarkAppearance];
    if (self->_useDarkAppearance) {
      double v8 = 0.300000012;
    }
    else {
      double v8 = 0.5;
    }
    long double v9 = cos(self->_mapPitchRadians);
    double v10 = ((1.0 - v9) * v8 + (1.0 - (1.0 - v9)) * v7) * a3;
    double v11 = [(UIColor *)self->_fullOpacityStrokeColor colorWithAlphaComponent:a3];
    if (a4 <= 0.0)
    {
      [(CALayer *)self->_ring removeAnimationForKey:@"strokeOpacity"];
      [(CAGradientLayer *)self->_faux3DHighlight removeAnimationForKey:@"strokeOpacity"];
      [(CALayer *)self->_faux3DShadow removeAnimationForKey:@"strokeOpacity"];
      [(CALayer *)self->_ring removeAnimationForKey:@"shadowOpacity"];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      v13 = NSNumber;
      [(CALayer *)self->_ring currentLayer];
      double v14 = v27 = v11;
      [v14 opacity];
      double v15 = objc_msgSend(v13, "numberWithFloat:");
      [v12 setFromValue:v15];

      CGFloat v16 = [NSNumber numberWithDouble:a3];
      [v12 setToValue:v16];

      [v12 setDuration:a4];
      [v12 setRemovedOnCompletion:1];
      [(CALayer *)self->_ring addAnimation:v12 forKey:@"strokeOpacity"];
      [(CAGradientLayer *)self->_faux3DHighlight addAnimation:v12 forKey:@"strokeOpacity"];
      [(CALayer *)self->_faux3DShadow addAnimation:v12 forKey:@"strokeOpacity"];
      double v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowOpacity"];
      double v18 = NSNumber;
      long long v19 = [(CALayer *)self->_ring currentLayer];
      [v19 shadowOpacity];
      uint64_t v20 = objc_msgSend(v18, "numberWithFloat:");
      [v17 setFromValue:v20];

      uint64_t v21 = [NSNumber numberWithDouble:v10];
      [v17 setToValue:v21];

      [v17 setDuration:a4];
      [v17 setRemovedOnCompletion:1];
      double v11 = v27;
      [(CALayer *)self->_ring addAnimation:v17 forKey:@"shadowOpacity"];
    }
    uint64_t v22 = +[MKThreadContext currentContext];
    objc_msgSend(v22, "_CA_setDisableActions:", 1);

    id v28 = v11;
    -[CALayer setBorderColor:](self->_ring, "setBorderColor:", [v28 CGColor]);
    *(float *)&double v23 = v10;
    [(CALayer *)self->_ring setShadowOpacity:v23];
    double v24 = self->_additionalStrokeOpacityMultiplier * self->_baseStrokeOpacity;
    *(float *)&double v24 = v24;
    [(CAGradientLayer *)self->_faux3DHighlight setOpacity:v24];
    double additionalStrokeOpacityMultiplier = self->_additionalStrokeOpacityMultiplier;
    *(float *)&double additionalStrokeOpacityMultiplier = additionalStrokeOpacityMultiplier;
    [(CALayer *)self->_faux3DShadow setOpacity:additionalStrokeOpacityMultiplier];
    uint64_t v26 = +[MKThreadContext currentContext];
    objc_msgSend(v26, "_CA_setDisableActions:", 0);
  }
}

- (void)setHidden:(BOOL)a3
{
  self->_BOOL externallyHidden = a3;
  BOOL v3 = a3 || self->_internallyHidden;
  v4.receiver = self;
  v4.super_class = (Class)_MKPuckAccuracyLayer;
  [(_MKPuckAccuracyLayer *)&v4 setHidden:v3];
}

- (void)stopAnimations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_shouldShowAnimationsIfAvailable = 0;
  [(CALayer *)self->_ring removeAnimationForKey:@"pulse"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = self->_faux3DHighlightMaskRings;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeAnimationForKey:", @"pulse", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CALayer *)self->_faux3DShadow removeAnimationForKey:@"pulse"];
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (BOOL)isFaux3DEnabled
{
  return self->_faux3DEnabled;
}

- (double)mapPitchRadians
{
  return self->_mapPitchRadians;
}

- (double)mapCameraDistance
{
  return self->_mapCameraDistance;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faux3DShadow, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMaskRings, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMask, 0);
  objc_storeStrong((id *)&self->_faux3DHighlight, 0);
  objc_storeStrong((id *)&self->_ring, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_fullOpacityStrokeColor, 0);
  objc_storeStrong((id *)&self->_fullOpacityFillColor, 0);

  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end