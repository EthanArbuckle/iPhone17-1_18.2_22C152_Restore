@interface ARUIRing
+ (id)randomRing;
- (ARUICelebration)celebration;
- (ARUIRing)init;
- (ARUIRing)initWithRing:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UIColor)bottomColor;
- (UIColor)topColor;
- (__n128)bottomColorPremultipliedVector;
- (__n128)bottomColorVector;
- (__n128)topColorPremultipliedVector;
- (__n128)topColorVector;
- (double)translation;
- (float)diameter;
- (float)emptyOpacity;
- (float)opacity;
- (float)percentage;
- (float)scale;
- (float)thickness;
- (float)trackOpacity;
- (float)zRotation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_updatePremultipliedBottomColor;
- (void)_updatePremultipliedTopColor;
- (void)setBottomColor:(id)a3;
- (void)setCelebration:(id)a3;
- (void)setDiameter:(float)a3;
- (void)setEmptyOpacity:(float)a3;
- (void)setOpacity:(float)a3;
- (void)setPercentage:(float)a3;
- (void)setScale:(float)a3;
- (void)setThickness:(float)a3;
- (void)setTopColor:(id)a3;
- (void)setTrackOpacity:(float)a3;
- (void)setTranslation:(ARUIRing *)self;
- (void)setZRotation:(float)a3;
@end

@implementation ARUIRing

- (ARUICelebration)celebration
{
  return self->_celebration;
}

- (unint64_t)hash
{
  v3 = +[ARUIHashBuilder builder];
  [v3 appendObject:self->_topColor];
  [v3 appendObject:self->_bottomColor];
  *(float *)&double v4 = self->_diameter;
  [v3 appendFloat:v4];
  *(float *)&double v5 = self->_thickness;
  [v3 appendFloat:v5];
  *(float *)&double v6 = self->_percentage;
  [v3 appendFloat:v6];
  *(float *)&double v7 = self->_opacity;
  [v3 appendFloat:v7];
  *(float *)&double v8 = self->_emptyOpacity;
  [v3 appendFloat:v8];
  *(float *)&double v9 = self->_trackOpacity;
  [v3 appendFloat:v9];
  *(float *)&double v10 = self->_scale;
  [v3 appendFloat:v10];
  *(float *)&double v11 = self->_zRotation;
  [v3 appendFloat:v11];
  [v3 appendFloat2:*(double *)self->_translation];
  [v3 appendObject:self->_celebration];
  unint64_t v12 = [v3 hash];

  return v12;
}

- (float)percentage
{
  return self->_percentage;
}

- (float)opacity
{
  return self->_opacity;
}

- (float)thickness
{
  return self->_thickness;
}

- (void)setDiameter:(float)a3
{
  self->_diameter = a3;
}

- (ARUIRing)initWithRing:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ARUIRing;
  double v5 = [(ARUIRing *)&v26 init];
  if (v5)
  {
    double v6 = [v4 topColor];
    uint64_t v7 = [v6 copy];
    topColor = v5->_topColor;
    v5->_topColor = (UIColor *)v7;

    double v9 = [v4 bottomColor];
    uint64_t v10 = [v9 copy];
    bottomColor = v5->_bottomColor;
    v5->_bottomColor = (UIColor *)v10;

    [v4 topColorVector];
    *(_OWORD *)v5->_topColorVector = v12;
    [v4 topColorPremultipliedVector];
    *(_OWORD *)v5->_topColorPremultipliedVector = v13;
    [v4 bottomColorVector];
    *(_OWORD *)v5->_bottomColorVector = v14;
    [v4 bottomColorPremultipliedVector];
    *(_OWORD *)v5->_bottomColorPremultipliedVector = v15;
    [v4 diameter];
    v5->_diameter = v16;
    [v4 thickness];
    v5->_thickness = v17;
    [v4 percentage];
    v5->_percentage = v18;
    [v4 opacity];
    v5->_opacity = v19;
    [v4 emptyOpacity];
    v5->_emptyOpacity = v20;
    [v4 trackOpacity];
    v5->_trackOpacity = v21;
    [v4 scale];
    v5->_scale = v22;
    [v4 zRotation];
    v5->_zRotation = v23;
    [v4 translation];
    *(void *)v5->_translation = v24;
  }

  return v5;
}

- (__n128)topColorPremultipliedVector
{
  return a1[6];
}

- (__n128)bottomColorPremultipliedVector
{
  return a1[8];
}

- (float)zRotation
{
  return self->_zRotation;
}

- (UIColor)topColor
{
  return self->_topColor;
}

- (__n128)topColorVector
{
  return a1[5];
}

- (UIColor)bottomColor
{
  return self->_bottomColor;
}

- (__n128)bottomColorVector
{
  return a1[7];
}

- (void)setThickness:(float)a3
{
  self->_thickness = a3;
}

- (float)trackOpacity
{
  return self->_trackOpacity;
}

- (float)emptyOpacity
{
  return self->_emptyOpacity;
}

- (void)setEmptyOpacity:(float)a3
{
  self->_emptyOpacity = a3;
}

- (void)setTrackOpacity:(float)a3
{
  self->_trackOpacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_celebration, 0);
  objc_storeStrong((id *)&self->_bottomColor, 0);

  objc_storeStrong((id *)&self->_topColor, 0);
}

- (float)diameter
{
  return self->_diameter;
}

- (void)setOpacity:(float)a3
{
  if (!ARUIFloatEqual(a3, self->_opacity))
  {
    self->_opacity = a3;
    [(ARUIRing *)self _updatePremultipliedTopColor];
    [(ARUIRing *)self _updatePremultipliedBottomColor];
  }
}

- (void)setPercentage:(float)a3
{
  if (a3 == INFINITY) {
    a3 = *(float *)&ARUIRingPercentageValueNoRing;
  }
  float v4 = a3;
  if (!ARUIFloatEqual(a3, self->_percentage)) {
    self->_percentage = v4;
  }
}

- (void)setTopColor:(id)a3
{
  objc_storeStrong((id *)&self->_topColor, a3);
  id v5 = a3;
  float64_t v10 = 0.0;
  float64_t v11 = 0.0;
  float64_t v8 = 0.0;
  float64_t v9 = 0.0;
  [v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];

  v6.f64[0] = v11;
  v6.f64[1] = v10;
  v7.f64[0] = v9;
  v7.f64[1] = v8;
  *(float32x4_t *)self->_topColorVector = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v7);
  [(ARUIRing *)self _updatePremultipliedTopColor];
}

- (void)_updatePremultipliedTopColor
{
  *(float32x4_t *)self->_topColorPremultipliedVector = vmulq_n_f32(*(float32x4_t *)self->_topColorVector, self->_opacity);
}

- (void)setBottomColor:(id)a3
{
  objc_storeStrong((id *)&self->_bottomColor, a3);
  id v5 = a3;
  float64_t v10 = 0.0;
  float64_t v11 = 0.0;
  float64_t v8 = 0.0;
  float64_t v9 = 0.0;
  [v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];

  v6.f64[0] = v11;
  v6.f64[1] = v10;
  v7.f64[0] = v9;
  v7.f64[1] = v8;
  *(float32x4_t *)self->_bottomColorVector = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v7);
  [(ARUIRing *)self _updatePremultipliedBottomColor];
}

- (void)_updatePremultipliedBottomColor
{
  *(float32x4_t *)self->_bottomColorPremultipliedVector = vmulq_n_f32(*(float32x4_t *)self->_bottomColorVector, self->_opacity);
}

- (float)scale
{
  return self->_scale;
}

- (double)translation
{
  return *(double *)(a1 + 56);
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = +[ARUIRing allocWithZone:a3];

  return [(ARUIRing *)v4 initWithRing:self];
}

- (ARUIRing)init
{
  v4.receiver = self;
  v4.super_class = (Class)ARUIRing;
  result = [(ARUIRing *)&v4 init];
  if (result)
  {
    result->_percentage = 0.0;
    float v3 = *(float *)&ARUIRingEmptyOpacityValueDefault;
    LODWORD(result->_opacity) = ARUIRingOpacityValueDefault;
    result->_emptyOpacity = v3;
    LODWORD(result->_trackOpacity) = ARUIRingTrackOpacityValueDefault;
    *(void *)&result->_scale = 1065353216;
    *(void *)result->_translation = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    float64x2_t v6 = [MEMORY[0x263F29C58] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
    topColor = self->_topColor;
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __20__ARUIRing_isEqual___block_invoke;
    v81[3] = &unk_264498E68;
    id v8 = v5;
    id v82 = v8;
    id v9 = (id)[v6 appendObject:topColor counterpart:v81];
    bottomColor = self->_bottomColor;
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __20__ARUIRing_isEqual___block_invoke_2;
    v79[3] = &unk_264498E68;
    id v11 = v8;
    id v80 = v11;
    id v12 = (id)[v6 appendObject:bottomColor counterpart:v79];
    float diameter = self->_diameter;
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __20__ARUIRing_isEqual___block_invoke_3;
    v77[3] = &unk_264498E90;
    id v14 = v11;
    id v78 = v14;
    *(float *)&double v15 = diameter;
    id v16 = (id)[v6 appendFloat:v77 counterpart:v15];
    float thickness = self->_thickness;
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __20__ARUIRing_isEqual___block_invoke_4;
    v75[3] = &unk_264498E90;
    id v18 = v14;
    id v76 = v18;
    *(float *)&double v19 = thickness;
    id v20 = (id)[v6 appendFloat:v75 counterpart:v19];
    float percentage = self->_percentage;
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __20__ARUIRing_isEqual___block_invoke_5;
    v73[3] = &unk_264498E90;
    id v22 = v18;
    id v74 = v22;
    *(float *)&double v23 = percentage;
    id v24 = (id)[v6 appendFloat:v73 counterpart:v23];
    float opacity = self->_opacity;
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __20__ARUIRing_isEqual___block_invoke_6;
    v71[3] = &unk_264498E90;
    id v26 = v22;
    id v72 = v26;
    *(float *)&double v27 = opacity;
    id v28 = (id)[v6 appendFloat:v71 counterpart:v27];
    float emptyOpacity = self->_emptyOpacity;
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __20__ARUIRing_isEqual___block_invoke_7;
    v69[3] = &unk_264498E90;
    id v30 = v26;
    id v70 = v30;
    *(float *)&double v31 = emptyOpacity;
    id v32 = (id)[v6 appendFloat:v69 counterpart:v31];
    float trackOpacity = self->_trackOpacity;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __20__ARUIRing_isEqual___block_invoke_8;
    v67[3] = &unk_264498E90;
    id v34 = v30;
    id v68 = v34;
    *(float *)&double v35 = trackOpacity;
    id v36 = (id)[v6 appendFloat:v67 counterpart:v35];
    float scale = self->_scale;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __20__ARUIRing_isEqual___block_invoke_9;
    v65[3] = &unk_264498E90;
    id v38 = v34;
    id v66 = v38;
    *(float *)&double v39 = scale;
    id v40 = (id)[v6 appendFloat:v65 counterpart:v39];
    float zRotation = self->_zRotation;
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __20__ARUIRing_isEqual___block_invoke_10;
    v63[3] = &unk_264498E90;
    id v42 = v38;
    id v64 = v42;
    *(float *)&double v43 = zRotation;
    id v44 = (id)[v6 appendFloat:v63 counterpart:v43];
    double v56 = *(double *)self->_translation;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __20__ARUIRing_isEqual___block_invoke_11;
    v61[3] = &unk_264498E90;
    id v45 = v42;
    id v62 = v45;
    id v46 = (id)[v6 appendFloat:v61 counterpart:v56];
    int v47 = *(_DWORD *)&self->_translation[4];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __20__ARUIRing_isEqual___block_invoke_12;
    v59[3] = &unk_264498E90;
    id v48 = v45;
    id v60 = v48;
    LODWORD(v49) = v47;
    id v50 = (id)[v6 appendFloat:v59 counterpart:v49];
    celebration = self->_celebration;
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __20__ARUIRing_isEqual___block_invoke_13;
    v57[3] = &unk_264498E68;
    id v58 = v48;
    id v52 = v48;
    id v53 = (id)[v6 appendObject:celebration counterpart:v57];
    char v54 = [v6 isEqual];
  }
  else
  {
    char v54 = 0;
  }

  return v54;
}

id __20__ARUIRing_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

id __20__ARUIRing_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

float __20__ARUIRing_isEqual___block_invoke_3(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 8);
}

float __20__ARUIRing_isEqual___block_invoke_4(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 12);
}

float __20__ARUIRing_isEqual___block_invoke_5(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 16);
}

float __20__ARUIRing_isEqual___block_invoke_6(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 20);
}

float __20__ARUIRing_isEqual___block_invoke_7(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 24);
}

float __20__ARUIRing_isEqual___block_invoke_8(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 28);
}

float __20__ARUIRing_isEqual___block_invoke_9(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 32);
}

float __20__ARUIRing_isEqual___block_invoke_10(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 36);
}

double __20__ARUIRing_isEqual___block_invoke_11(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 56);
}

float __20__ARUIRing_isEqual___block_invoke_12(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 32) + 60);
}

id __20__ARUIRing_isEqual___block_invoke_13(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

- (id)description
{
  float v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendFloat:@"percentage" withName:self->_percentage];
  id v5 = (id)[v3 appendFloat:@"diameter" withName:self->_diameter];
  id v6 = (id)[v3 appendFloat:@"thickness" withName:self->_thickness];
  id v7 = (id)[v3 appendFloat:@"opacity" withName:self->_opacity];
  id v8 = (id)[v3 appendFloat:@"scale" withName:self->_scale];
  id v9 = (id)[v3 appendFloat:@"translation.x" withName:COERCE_FLOAT(*(void *)self->_translation)];
  id v10 = (id)[v3 appendFloat:@"translation.y" withName:*(float *)&self->_translation[4]];
  id v11 = [v3 build];

  return v11;
}

+ (id)randomRing
{
  v2 = objc_alloc_init(ARUIRing);
  float v3 = (void *)MEMORY[0x263F825C8];
  double v4 = ARUIRandomFloat(0.0, 1.0);
  double v5 = ARUIRandomFloat(0.0, 1.0);
  double v6 = ARUIRandomFloat(0.0, 1.0);
  id v7 = objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v5, v6, ARUIRandomFloat(0.0, 1.0));
  [(ARUIRing *)v2 setTopColor:v7];

  id v8 = (void *)MEMORY[0x263F825C8];
  double v9 = ARUIRandomFloat(0.0, 1.0);
  double v10 = ARUIRandomFloat(0.0, 1.0);
  double v11 = ARUIRandomFloat(0.0, 1.0);
  id v12 = objc_msgSend(v8, "colorWithRed:green:blue:alpha:", v9, v10, v11, ARUIRandomFloat(0.0, 1.0));
  [(ARUIRing *)v2 setBottomColor:v12];

  *(float *)&double v13 = ARUIRandomFloat(0.0, 1000.0);
  [(ARUIRing *)v2 setDiameter:v13];
  *(float *)&double v14 = ARUIRandomFloat(0.0, 1000.0);
  [(ARUIRing *)v2 setThickness:v14];
  *(float *)&double v15 = ARUIRandomFloat(0.0, 1000.0);
  [(ARUIRing *)v2 setPercentage:v15];
  *(float *)&double v16 = ARUIRandomFloat(0.0, 1.0);
  [(ARUIRing *)v2 setOpacity:v16];
  *(float *)&double v17 = ARUIRandomFloat(0.0, 1.0);
  [(ARUIRing *)v2 setEmptyOpacity:v17];
  *(float *)&double v18 = ARUIRandomFloat(0.0, 1.0);
  [(ARUIRing *)v2 setTrackOpacity:v18];
  *(float *)&double v19 = ARUIRandomFloat(0.1, 10.0);
  [(ARUIRing *)v2 setScale:v19];
  *(float *)&double v20 = ARUIRandomFloat(0.0, 6.2832);
  [(ARUIRing *)v2 setZRotation:v20];
  [(ARUIRing *)v2 setTranslation:COERCE_DOUBLE(ARUIRandomFloat2(0.0, 1000.0))];

  return v2;
}

- (void)setScale:(float)a3
{
  self->_float scale = a3;
}

- (void)setZRotation:(float)a3
{
  self->_float zRotation = a3;
}

- (void)setTranslation:(ARUIRing *)self
{
  *(void *)self->_translation = v2;
}

- (void)setCelebration:(id)a3
{
}

@end