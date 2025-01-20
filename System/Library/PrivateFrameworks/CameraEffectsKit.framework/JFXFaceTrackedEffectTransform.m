@interface JFXFaceTrackedEffectTransform
- (BOOL)isEqual:(id)a3 forTrackingType:(int64_t)a4;
- (JFXFaceTrackedEffectTransform)initWithCameraProjection:(__n128)a3 cameraTransform:(__n128)a4 onFaceTransform:(__n128)a5 billboardTransform:(__n128)a6;
- (NSDictionary)effectParametersForOnBillboardTracking;
- (NSDictionary)effectParametersForOnFaceTracking;
- (__n128)billboardTransform;
- (__n128)cameraProjection;
- (__n128)cameraTransform;
- (__n128)onFaceTransform;
- (id)effectParametersForTrackingType:(int64_t)a3;
- (void)transformForTrackingType:(uint64_t)a3;
@end

@implementation JFXFaceTrackedEffectTransform

- (JFXFaceTrackedEffectTransform)initWithCameraProjection:(__n128)a3 cameraTransform:(__n128)a4 onFaceTransform:(__n128)a5 billboardTransform:(__n128)a6
{
  v53[4] = *MEMORY[0x263EF8340];
  v47.receiver = a1;
  v47.super_class = (Class)JFXFaceTrackedEffectTransform;
  v24 = [(JFXFaceTrackedEffectTransform *)&v47 init];
  v25 = v24;
  if (v24)
  {
    *(__n128 *)v24->_anon_20 = a2;
    *(__n128 *)&v24->_anon_20[16] = a3;
    *(__n128 *)&v24->_anon_20[32] = a4;
    *(__n128 *)&v24->_anon_20[48] = a5;
    *(__n128 *)v24->_anon_60 = a6;
    *(__n128 *)&v24->_anon_60[16] = a7;
    *(__n128 *)&v24->_anon_60[32] = a8;
    *(__n128 *)&v24->_anon_60[48] = a9;
    *(_OWORD *)&v24[1].super.isa = a17;
    *(_OWORD *)&v24[1]._effectParametersForOnBillboardTracking = a18;
    *(_OWORD *)v24[1]._anon_20 = a19;
    *(_OWORD *)&v24[1]._anon_20[16] = a20;
    *(_OWORD *)v24->_anon_a0 = a21;
    *(_OWORD *)&v24->_anon_a0[16] = a22;
    *(_OWORD *)&v24->_anon_a0[32] = a23;
    *(_OWORD *)&v24->_anon_a0[48] = a24;
    v26 = objc_msgSend(MEMORY[0x263F612E0], "matrixWithSIMDFloat4x4:");
    v27 = objc_msgSend(MEMORY[0x263F612E0], "matrixWithSIMDFloat4x4:", a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0], a9.n128_f64[0]);
    v28 = objc_msgSend(MEMORY[0x263F612E0], "matrixWithSIMDFloat4x4:", *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20);
    v29 = objc_msgSend(MEMORY[0x263F612E0], "matrixWithSIMDFloat4x4:", *(double *)&a21, *(double *)&a22, *(double *)&a23, *(double *)&a24);
    uint64_t v31 = *MEMORY[0x263F61660];
    v50[0] = *MEMORY[0x263F61658];
    uint64_t v30 = v50[0];
    v50[1] = v31;
    v53[0] = v26;
    v53[1] = v27;
    uint64_t v33 = *MEMORY[0x263F61648];
    uint64_t v51 = *MEMORY[0x263F617C0];
    uint64_t v32 = v51;
    uint64_t v52 = v33;
    v53[2] = v28;
    v53[3] = MEMORY[0x263EFFA88];
    uint64_t v34 = [NSDictionary dictionaryWithObjects:v53 forKeys:v50 count:4];
    effectParametersForOnFaceTracking = v25->_effectParametersForOnFaceTracking;
    v25->_effectParametersForOnFaceTracking = (NSDictionary *)v34;

    v48[0] = v30;
    v48[1] = v31;
    v49[0] = v26;
    v49[1] = v27;
    v48[2] = v32;
    v48[3] = v33;
    v49[2] = v29;
    v49[3] = MEMORY[0x263EFFA88];
    uint64_t v36 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    effectParametersForOnBillboardTracking = v25->_effectParametersForOnBillboardTracking;
    v25->_effectParametersForOnBillboardTracking = (NSDictionary *)v36;
  }
  return v25;
}

- (BOOL)isEqual:(id)a3 forTrackingType:(int64_t)a4
{
  v6 = (JFXFaceTrackedEffectTransform *)a3;
  if (self == v6)
  {
    char v10 = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  if (a4 == 1)
  {
    v8 = [(JFXFaceTrackedEffectTransform *)self effectParametersForOnFaceTracking];
    uint64_t v9 = [(JFXFaceTrackedEffectTransform *)v7 effectParametersForOnFaceTracking];
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    v8 = [(JFXFaceTrackedEffectTransform *)self effectParametersForOnBillboardTracking];
    uint64_t v9 = [(JFXFaceTrackedEffectTransform *)v7 effectParametersForOnBillboardTracking];
  }
  v11 = (void *)v9;
LABEL_11:
  v12 = (void *)MEMORY[0x263F612E0];
  uint64_t v13 = *MEMORY[0x263F61658];
  v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F61658]];
  v15 = [v11 objectForKeyedSubscript:v13];
  if ([v12 isMatrix:v14 equivalentTo:v15])
  {
    v16 = (void *)MEMORY[0x263F612E0];
    uint64_t v17 = *MEMORY[0x263F61660];
    v18 = [v8 objectForKeyedSubscript:*MEMORY[0x263F61660]];
    v19 = [v11 objectForKeyedSubscript:v17];
    if ([v16 isMatrix:v18 equivalentTo:v19])
    {
      v20 = (void *)MEMORY[0x263F612E0];
      v25 = v7;
      uint64_t v21 = *MEMORY[0x263F617C0];
      v22 = [v8 objectForKeyedSubscript:*MEMORY[0x263F617C0]];
      v23 = [v11 objectForKeyedSubscript:v21];
      char v10 = [v20 isMatrix:v22 equivalentTo:v23];

      v7 = v25;
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

LABEL_18:
  return v10;
}

- (void)transformForTrackingType:(uint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      return (void *)[result onFaceTransform];
    }
    else if (a3 == 2)
    {
      return (void *)[result billboardTransform];
    }
  }
  return result;
}

- (id)effectParametersForTrackingType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(JFXFaceTrackedEffectTransform *)self effectParametersForOnFaceTracking];
  }
  else if (a3 == 2)
  {
    v3 = [(JFXFaceTrackedEffectTransform *)self effectParametersForOnBillboardTracking];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (__n128)cameraProjection
{
  return a1[2];
}

- (__n128)cameraTransform
{
  return a1[6];
}

- (__n128)billboardTransform
{
  return a1[10];
}

- (__n128)onFaceTransform
{
  return a1[14];
}

- (NSDictionary)effectParametersForOnFaceTracking
{
  return self->_effectParametersForOnFaceTracking;
}

- (NSDictionary)effectParametersForOnBillboardTracking
{
  return self->_effectParametersForOnBillboardTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectParametersForOnBillboardTracking, 0);
  objc_storeStrong((id *)&self->_effectParametersForOnFaceTracking, 0);
}

@end