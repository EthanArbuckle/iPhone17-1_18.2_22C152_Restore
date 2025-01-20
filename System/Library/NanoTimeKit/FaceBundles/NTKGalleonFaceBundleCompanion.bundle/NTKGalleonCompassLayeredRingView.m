@interface NTKGalleonCompassLayeredRingView
- (BOOL)_compassDialVisible;
- (BOOL)_hourDialVisible;
- (BOOL)_minuteDialVisible;
- (NTKGalleonColorPalette)palette;
- (NTKGalleonCompassLayeredRingView)init;
- (double)_easeInCurveWithFraction:(double)a3;
- (double)_incomingAlphaForFraction:(double)result withAnimationStyle:(unint64_t)a4;
- (double)_outgoingAlphaForFraction:(double)a3 withAnimationStyle:(unint64_t)a4;
- (double)_ringScaleFactorForBounceFraction:(double)a3;
- (double)ringThickness;
- (id)_generatePrerenderedDial;
- (id)_modeViewForMode:(unint64_t)a3;
- (unint64_t)ringMode;
- (void)_applyPalette:(id)a3 toDial:(unint64_t)a4;
- (void)_applyPaletteToDegreeDial:(id)a3;
- (void)_applyPaletteToHourDial:(id)a3;
- (void)_applyPaletteToMinuteDial:(id)a3;
- (void)_setDegreePrerenderedMode:(BOOL)a3;
- (void)_setDropShadowActive:(BOOL)a3;
- (void)_updateDropShadowForPalette:(id)a3;
- (void)_updateRingRotation;
- (void)applyGPSRingEnableFraction:(double)a3;
- (void)applyGPSRingEnableFraction:(double)a3 forMode:(unint64_t)a4;
- (void)applyRingModeTransitionFraction:(double)a3 fromMode:(unint64_t)a4 toMode:(unint64_t)a5 withAnimationStyle:(unint64_t)a6;
- (void)galleon_setProgress:(double)a3;
- (void)setGPSRingDiameter:(double)a3;
- (void)setGPSRingEnabled:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setPalette:(id)a3;
- (void)setRingMode:(unint64_t)a3;
- (void)transitionToTritiumWithProgress:(float)a3;
@end

@implementation NTKGalleonCompassLayeredRingView

- (NTKGalleonCompassLayeredRingView)init
{
  double v94 = 0.0;
  long long v92 = 0u;
  long long v93 = 0u;
  memset(v91, 0, sizeof(v91));
  _NTKGalleonLayoutConstants(v91);
  double v3 = *(double *)v91;
  v90.receiver = self;
  v90.super_class = (Class)NTKGalleonCompassLayeredRingView;
  v4 = -[NTKGalleonCompassLayeredRingView initWithFrame:](&v90, sel_initWithFrame_, 0.0, 0.0, *(double *)v91, *(double *)v91);
  v8 = v4;
  if (v4)
  {
    v9 = objc_msgSend_layer(v4, v5, v6, v7);
    objc_msgSend_setShadowRadius_(v9, v10, v11, v12, *((double *)&v92 + 1));
    objc_msgSend_setShadowOffset_(v9, v13, v14, v15, *((double *)&v93 + 1), v94);
    v16 = (void *)MEMORY[0x263F1C478];
    objc_msgSend_bounds(v8, v17, v18, v19);
    objc_msgSend_bezierPathWithOvalInRect_(v16, v20, v21, v22);
    id v23 = objc_claimAutoreleasedReturnValue();
    uint64_t v27 = objc_msgSend_CGPath(v23, v24, v25, v26);
    objc_msgSend_setShadowPath_(v9, v28, v27, v29);

    uint64_t v33 = objc_msgSend_layer(MEMORY[0x263F157E8], v30, v31, v32);
    ringLayer = v8->_ringLayer;
    v8->_ringLayer = (CALayer *)v33;

    v35 = v8->_ringLayer;
    objc_msgSend_ringThickness(v8, v36, v37, v38);
    objc_msgSend_setBorderWidth_(v35, v39, v40, v41);
    objc_msgSend_setCornerCurve_(v8->_ringLayer, v42, *MEMORY[0x263F15A10], v43);
    v44 = v8->_ringLayer;
    objc_msgSend_whiteColor(MEMORY[0x263F1C550], v45, v46, v47);
    id v48 = objc_claimAutoreleasedReturnValue();
    uint64_t v52 = objc_msgSend_CGColor(v48, v49, v50, v51);
    objc_msgSend_setBorderColor_(v44, v53, v52, v54);

    v55 = v8->_ringLayer;
    uint64_t v59 = objc_msgSend_borderColor(v55, v56, v57, v58);
    objc_msgSend_setBackgroundColor_(v55, v60, v59, v61);
    objc_msgSend_galleon_disableLayerActions(v8->_ringLayer, v62, v63, v64);
    objc_msgSend_setFrame_(v8->_ringLayer, v65, v66, v67, 0.0, 0.0, v3, v3);
    objc_msgSend_setCornerRadius_(v8->_ringLayer, v68, v69, v70, v3 * 0.5);
    objc_msgSend_addSublayer_(v9, v71, (uint64_t)v8->_ringLayer, v72);
    v73 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    degreeRotateImageView = v8->_degreeRotateImageView;
    v8->_degreeRotateImageView = v73;

    uint64_t v75 = objc_opt_new();
    degreeView = v8->_degreeView;
    v8->_degreeView = (NTKGalleonDegreeDialView *)v75;

    objc_msgSend_addSubview_(v8, v77, (uint64_t)v8->_degreeView, v78);
    uint64_t v79 = objc_opt_new();
    minuteView = v8->_minuteView;
    v8->_minuteView = (NTKGalleonMinuteDialView *)v79;

    objc_msgSend_addSubview_(v8, v81, (uint64_t)v8->_minuteView, v82);
    uint64_t v83 = objc_opt_new();
    hourView = v8->_hourView;
    v8->_hourView = (NTKGalleonHourDialView *)v83;

    objc_msgSend_addSubview_(v8, v85, (uint64_t)v8->_hourView, v86);
    objc_msgSend_setRingMode_(v8, v87, 2, v88);
  }
  return v8;
}

- (void)setGPSRingDiameter:(double)a3
{
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 0, v3);
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  _NTKGalleonLayoutConstants(v9);
  objc_msgSend_setBorderWidth_(self->_ringLayer, v6, v7, v8, *(double *)v9 - a3);
}

- (void)setPalette:(id)a3
{
  id v36 = a3;
  objc_msgSend__setDegreePrerenderedMode_(self, v5, 0, v6);
  objc_storeStrong((id *)&self->_palette, a3);
  ringLayer = self->_ringLayer;
  objc_msgSend_outerRingBackgroundColor(v36, v8, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_CGColor(v11, v12, v13, v14);
  objc_msgSend_setBorderColor_(ringLayer, v16, v15, v17);

  uint64_t v18 = self->_ringLayer;
  uint64_t v22 = objc_msgSend_borderColor(v18, v19, v20, v21);
  objc_msgSend_setBackgroundColor_(v18, v23, v22, v24);
  if (objc_msgSend__compassDialVisible(self, v25, v26, v27)) {
    objc_msgSend__applyPaletteToDegreeDial_(self, v28, (uint64_t)v36, v30);
  }
  if (objc_msgSend__hourDialVisible(self, v28, v29, v30)) {
    objc_msgSend__applyPaletteToHourDial_(self, v31, (uint64_t)v36, v33);
  }
  if (objc_msgSend__minuteDialVisible(self, v31, v32, v33)) {
    objc_msgSend__applyPaletteToMinuteDial_(self, v34, (uint64_t)v36, v35);
  }
}

- (void)_applyPalette:(id)a3 toDial:(unint64_t)a4
{
  uint64_t v6 = (const char *)a3;
  uint64_t v8 = v6;
  if (a4 == 2)
  {
    uint64_t v9 = v6;
    uint64_t v6 = (const char *)objc_msgSend__applyPaletteToDegreeDial_(self, v6, (uint64_t)v6, v7);
  }
  else if (a4 == 1)
  {
    uint64_t v9 = v6;
    uint64_t v6 = (const char *)objc_msgSend__applyPaletteToMinuteDial_(self, v6, (uint64_t)v6, v7);
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    uint64_t v9 = v6;
    uint64_t v6 = (const char *)objc_msgSend__applyPaletteToHourDial_(self, v6, (uint64_t)v6, v7);
  }
  uint64_t v8 = v9;
LABEL_8:

  MEMORY[0x270F9A758](v6, v8);
}

- (void)_applyPaletteToDegreeDial:(id)a3
{
  degreeView = self->_degreeView;
  id v9 = a3;
  objc_msgSend_galleon_setPalette_(degreeView, v5, (uint64_t)v9, v6);
  objc_msgSend__updateDropShadowForPalette_(self, v7, (uint64_t)v9, v8);
}

- (void)_applyPaletteToHourDial:(id)a3
{
  hourView = self->_hourView;
  id v9 = a3;
  objc_msgSend_galleon_setPalette_(hourView, v5, (uint64_t)v9, v6);
  objc_msgSend__updateDropShadowForPalette_(self, v7, (uint64_t)v9, v8);
}

- (void)_applyPaletteToMinuteDial:(id)a3
{
  minuteView = self->_minuteView;
  id v9 = a3;
  objc_msgSend_galleon_setPalette_(minuteView, v5, (uint64_t)v9, v6);
  objc_msgSend__updateDropShadowForPalette_(self, v7, (uint64_t)v9, v8);
}

- (void)_updateDropShadowForPalette:(id)a3
{
  objc_msgSend_hasDropShadow(a3, a2, (uint64_t)a3, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_BOOLValue(v11, v5, v6, v7);
  objc_msgSend__setDropShadowActive_(self, v9, v8, v10);
}

- (void)_setDropShadowActive:(BOOL)a3
{
  if (self->_dropShadowActive != a3)
  {
    if (a3)
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      memset(v31, 0, sizeof(v31));
      _NTKGalleonLayoutConstants(v31);
      id v9 = objc_msgSend_layer(self, v6, v7, v8);
      HIDWORD(v10) = DWORD1(v33);
      *(float *)&double v10 = *(double *)&v33;
      objc_msgSend_setShadowOpacity_(v9, v11, v12, v13, v10);

      uint64_t v17 = objc_msgSend_layer(self, v14, v15, v16);
      objc_msgSend_setShadowRadius_(v17, v18, v19, v20, *((double *)&v32 + 1));
    }
    else
    {
      uint64_t v21 = objc_msgSend_layer(self, a2, a3, v3);
      objc_msgSend_setShadowOpacity_(v21, v22, v23, v24, 0.0);

      uint64_t v17 = objc_msgSend_layer(self, v25, v26, v27);
      objc_msgSend_setShadowRadius_(v17, v28, v29, v30, 0.0);
    }

    self->_dropShadowActive = a3;
  }
}

- (double)ringThickness
{
  _NTKGalleonLayoutConstants(v3);
  return v4;
}

- (void)setRingMode:(unint64_t)a3
{
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 0, v3);
  self->_ringMode = a3;
  switch(a3)
  {
    case 2uLL:
      objc_msgSend_setAlpha_(self->_hourView, v6, v7, v8, 0.0);
      objc_msgSend_setHidden_(self->_hourView, v27, 1, v28);
      objc_msgSend_setAlpha_(self->_minuteView, v29, v30, v31, 0.0);
      objc_msgSend_setHidden_(self->_minuteView, v32, 1, v33);
      objc_msgSend_setAlpha_(self->_degreeView, v34, v35, v36, 1.0);
      objc_msgSend_setHidden_(self->_degreeView, v37, 0, v38);
      degreeView = self->_degreeView;
      long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v66[0] = *MEMORY[0x263F000D0];
      v66[1] = v40;
      v66[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      objc_msgSend_setTransform_(degreeView, v41, (uint64_t)v66, v42);
      objc_msgSend__applyPaletteToDegreeDial_(self, v43, (uint64_t)self->_palette, v44);
      objc_msgSend__updateRingRotation(self, v45, v46, v47);
      break;
    case 1uLL:
      objc_msgSend_setAlpha_(self->_hourView, v6, v7, v8, 0.0);
      objc_msgSend_setHidden_(self->_hourView, v48, 1, v49);
      objc_msgSend_setAlpha_(self->_minuteView, v50, v51, v52, 1.0);
      objc_msgSend_setHidden_(self->_minuteView, v53, 0, v54);
      objc_msgSend_setAlpha_(self->_degreeView, v55, v56, v57, 0.0);
      objc_msgSend_setHidden_(self->_degreeView, v58, 1, v59);
      minuteView = self->_minuteView;
      long long v61 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v67[0] = *MEMORY[0x263F000D0];
      v67[1] = v61;
      v67[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      objc_msgSend_setTransform_(minuteView, v62, (uint64_t)v67, v63);
      objc_msgSend__applyPaletteToMinuteDial_(self, v64, (uint64_t)self->_palette, v65);
      break;
    case 0uLL:
      objc_msgSend_setAlpha_(self->_hourView, v6, v7, v8, 1.0);
      objc_msgSend_setHidden_(self->_hourView, v9, 0, v10);
      objc_msgSend_setAlpha_(self->_minuteView, v11, v12, v13, 0.0);
      objc_msgSend_setHidden_(self->_minuteView, v14, 1, v15);
      objc_msgSend_setAlpha_(self->_degreeView, v16, v17, v18, 0.0);
      objc_msgSend_setHidden_(self->_degreeView, v19, 1, v20);
      hourView = self->_hourView;
      long long v22 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v68[0] = *MEMORY[0x263F000D0];
      v68[1] = v22;
      v68[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      objc_msgSend_setTransform_(hourView, v23, (uint64_t)v68, v24);
      objc_msgSend__applyPaletteToHourDial_(self, v25, (uint64_t)self->_palette, v26);
      break;
  }
}

- (double)_easeInCurveWithFraction:(double)a3
{
  return (sin((a3 + -0.5) * 3.14159265) + 1.0) * 0.5;
}

- (void)setGPSRingEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 0, v3);
  if (v4) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  uint64_t v11 = objc_msgSend_ringMode(self, v6, v7, v8);

  objc_msgSend_applyGPSRingEnableFraction_forMode_(self, v10, v11, v12, v9);
}

- (BOOL)_compassDialVisible
{
  objc_msgSend_alpha(self->_degreeView, a2, v2, v3);
  return v4 > 0.0;
}

- (BOOL)_hourDialVisible
{
  objc_msgSend_alpha(self->_hourView, a2, v2, v3);
  return v4 > 0.0;
}

- (BOOL)_minuteDialVisible
{
  objc_msgSend_alpha(self->_minuteView, a2, v2, v3);
  return v4 > 0.0;
}

- (id)_modeViewForMode:(unint64_t)a3
{
  if (a3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.super.super.isa + *off_2651F8DF0[a3]);
  }
  return v4;
}

- (void)applyRingModeTransitionFraction:(double)a3 fromMode:(unint64_t)a4 toMode:(unint64_t)a5 withAnimationStyle:(unint64_t)a6
{
  uint64_t v11 = objc_msgSend__modeViewForMode_(self, a2, a4, a5);
  uint64_t v14 = objc_msgSend__modeViewForMode_(self, v12, a5, v13);
  objc_msgSend_alpha(v11, v15, v16, v17);
  double v19 = v18;
  objc_msgSend__outgoingAlphaForFraction_withAnimationStyle_(self, v20, a6, v21, a3);
  double v23 = v22;
  objc_msgSend_setAlpha_(v11, v24, v25, v26);
  if (v19 == 0.0 && v23 > 0.0)
  {
    objc_msgSend_setHidden_(v11, v27, 0, v29);
    objc_msgSend__applyPalette_toDial_(self, v30, (uint64_t)self->_palette, a4);
  }
  objc_msgSend_alpha(v14, v27, v28, v29);
  double v32 = v31;
  objc_msgSend__incomingAlphaForFraction_withAnimationStyle_(self, v33, a6, v34, a3);
  double v36 = v35;
  objc_msgSend_setAlpha_(v14, v37, v38, v39);
  if (v32 == 0.0 && v36 > 0.0)
  {
    objc_msgSend_setHidden_(v14, v40, 0, v42);
    objc_msgSend__applyPalette_toDial_(self, v43, (uint64_t)self->_palette, a5);
  }
  if (a6 == 3)
  {
    double v52 = 1.0 - a3;
    if (a5 == 2) {
      double v52 = a3;
    }
    objc_msgSend__ringScaleFactorForBounceFraction_(self, v40, v41, v42, v52);
    if (v55 == 1.0)
    {
      long long v56 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v62.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v62.c = v56;
      *(_OWORD *)&v62.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    }
    else
    {
      long long v58 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v67.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v67.c = v58;
      *(_OWORD *)&v67.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(&v62, &v67, v55, v55);
    }
    objc_msgSend_setTransform_(self, v53, (uint64_t)v61, v54, *(void *)&v62.a, *(void *)&v62.b, *(void *)&v62.c, *(void *)&v62.d, *(void *)&v62.tx, *(void *)&v62.ty);
  }
  else if (a6 == 2)
  {
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v45 = v44;
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v49 = v48;
    memset(&v67, 0, sizeof(v67));
    uint64_t v50 = (_OWORD *)MEMORY[0x263F000D0];
    long long v51 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    if (v45 == 1.0)
    {
      *(_OWORD *)&v67.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v67.c = v51;
      *(_OWORD *)&v67.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    }
    else
    {
      *(_OWORD *)&v66.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v66.c = v51;
      *(_OWORD *)&v66.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformScale(&v67, &v66, v45, v45);
    }
    memset(&v66, 0, sizeof(v66));
    long long v57 = v50[1];
    if (v49 == 1.0)
    {
      *(_OWORD *)&v66.a = *v50;
      *(_OWORD *)&v66.c = v57;
      *(_OWORD *)&v66.tx = v50[2];
    }
    else
    {
      *(_OWORD *)&v65.a = *v50;
      *(_OWORD *)&v65.c = v57;
      *(_OWORD *)&v65.tx = v50[2];
      CGAffineTransformScale(&v66, &v65, v49, v49);
    }
    CGAffineTransform v64 = v67;
    objc_msgSend_setTransform_(v14, v46, (uint64_t)&v64, v47);
    CGAffineTransform v63 = v66;
    objc_msgSend_setTransform_(v11, v59, (uint64_t)&v63, v60, v61[0], v61[1], v61[2]);
  }
}

- (void)applyGPSRingEnableFraction:(double)a3
{
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 0, v3);
  if (objc_msgSend__compassDialVisible(self, v6, v7, v8)) {
    objc_msgSend_applyGPSRingEnableFraction_forMode_(self, v9, 2, v11, a3);
  }
  if (objc_msgSend__hourDialVisible(self, v9, v10, v11)) {
    objc_msgSend_applyGPSRingEnableFraction_forMode_(self, v12, 0, v14, a3);
  }
  if (objc_msgSend__minuteDialVisible(self, v12, v13, v14))
  {
    objc_msgSend_applyGPSRingEnableFraction_forMode_(self, v15, 1, v16, a3);
  }
}

- (void)applyGPSRingEnableFraction:(double)a3 forMode:(unint64_t)a4
{
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 0, v4);
  if (a4 <= 2)
  {
    uint64_t v11 = *(Class *)((char *)&self->super.super.super.isa + *off_2651F8DF0[a4]);
    objc_msgSend_galleon_setProgress_(v11, v8, v9, v10, a3);
  }
}

- (double)_ringScaleFactorForBounceFraction:(double)a3
{
  if (a3 <= 0.85)
  {
    if (a3 <= 0.6)
    {
      if (a3 <= 0.0) {
        return 1.0;
      }
      objc_msgSend__easeInCurveWithFraction_(self, a2, v3, v4, a3 / 0.6);
    }
    else
    {
      objc_msgSend__easeInCurveWithFraction_(self, a2, v3, v4, (a3 + -0.6) * 4.0);
    }
  }
  else
  {
    objc_msgSend__easeInCurveWithFraction_(self, a2, v3, v4, (a3 + -0.85) / 0.15);
  }

  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (double)_outgoingAlphaForFraction:(double)a3 withAnimationStyle:(unint64_t)a4
{
  if (a4 != 3) {
    return 1.0 - a3;
  }
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (double)_incomingAlphaForFraction:(double)result withAnimationStyle:(unint64_t)a4
{
  if (a4 == 3) {
    CLKInterpolateBetweenFloatsClipped();
  }
  return result;
}

- (void)transitionToTritiumWithProgress:(float)a3
{
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 0, v3);
  degreeView = self->_degreeView;

  MEMORY[0x270F9A6D0](degreeView, sel_setChevronAndLabelOpacity_, v5, v6);
}

- (void)_setDegreePrerenderedMode:(BOOL)a3
{
  BOOL v4 = a3;
  p_degreeRotateImageView = (void **)&self->_degreeRotateImageView;
  uint64_t v7 = objc_msgSend_superview(self->_degreeRotateImageView, a2, a3, v3);
  BOOL v8 = v7 == 0;

  if (((v8 ^ v4) & 1) == 0)
  {
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() < self->_dontPrerenderBefore) {
        return;
      }
      uint64_t v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_246B32000, v9, OS_LOG_TYPE_DEFAULT, "Galleon compass switching to pre-rendered image", buf, 2u);
      }

      uint64_t v13 = objc_msgSend__generatePrerenderedDial(self, v10, v11, v12);
      objc_msgSend_setImage_(*p_degreeRotateImageView, v14, (uint64_t)v13, v15);

      objc_msgSend_sizeToFit(*p_degreeRotateImageView, v16, v17, v18);
      double v19 = *p_degreeRotateImageView;
      objc_msgSend_center(self->_degreeView, v20, v21, v22);
      objc_msgSend_setCenter_(v19, v23, v24, v25);
      p_degreeView = (uint64_t *)p_degreeRotateImageView;
      p_degreeRotateImageView = (void **)&self->_degreeView;
    }
    else
    {
      uint64_t v28 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_246B32000, v28, OS_LOG_TYPE_DEFAULT, "Galleon compass switching to layer-based view", v37, 2u);
      }

      objc_msgSend_setImage_(*p_degreeRotateImageView, v29, 0, v30);
      p_degreeView = (uint64_t *)&self->_degreeView;
    }
    objc_msgSend_insertSubview_aboveSubview_(self, v26, *p_degreeView, (uint64_t)*p_degreeRotateImageView);
    objc_msgSend_removeFromSuperview(*p_degreeRotateImageView, v31, v32, v33);
    objc_msgSend__updateRingRotation(self, v34, v35, v36);
  }
  if (!v4) {
    self->_dontPrerenderBefore = CFAbsoluteTimeGetCurrent() + 0.3;
  }
}

- (id)_generatePrerenderedDial
{
  id v3 = objc_alloc(MEMORY[0x263F1C680]);
  objc_msgSend_bounds(self->_degreeView, v4, v5, v6);
  uint64_t v10 = objc_msgSend_initWithBounds_(v3, v7, v8, v9);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_246B37374;
  v15[3] = &unk_2651F8D98;
  v15[4] = self;
  uint64_t v13 = objc_msgSend_imageWithActions_(v10, v11, (uint64_t)v15, v12);

  return v13;
}

- (void)setHeading:(double)a3
{
  objc_msgSend__setDegreePrerenderedMode_(self, a2, 1, v3);
  self->_heading = a3;

  objc_msgSend__updateRingRotation(self, v6, v7, v8);
}

- (void)_updateRingRotation
{
  double heading = self->_heading;
  uint64_t v6 = objc_msgSend_superview(self->_degreeView, a2, v2, v3);

  if (v6)
  {
    degreeView = self->_degreeView;
    objc_msgSend_galleon_setHeading_(degreeView, v7, v8, v9, heading);
  }
  else
  {
    uint64_t v11 = objc_msgSend_superview(self->_degreeRotateImageView, v7, v8, v9);

    if (v11)
    {
      memset(&v17, 0, sizeof(v17));
      CLKDegreesToRadians();
      CGAffineTransformMakeRotation(&v17, 6.28318531 - v12);
      degreeRotateImageView = self->_degreeRotateImageView;
      CGAffineTransform v16 = v17;
      objc_msgSend_setTransform_(degreeRotateImageView, v14, (uint64_t)&v16, v15);
    }
  }
}

- (void)galleon_setProgress:(double)a3
{
  uint64_t v8 = objc_msgSend_ringMode(self, a2, v3, v4);

  objc_msgSend_applyGPSRingEnableFraction_forMode_(self, v7, v8, v9, a3);
}

- (unint64_t)ringMode
{
  return self->_ringMode;
}

- (NTKGalleonColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_degreeRotateImageView, 0);
  objc_storeStrong((id *)&self->_hourView, 0);
  objc_storeStrong((id *)&self->_minuteView, 0);
  objc_storeStrong((id *)&self->_degreeView, 0);

  objc_storeStrong((id *)&self->_ringLayer, 0);
}

@end