@interface VCCamera
- ($48BDB0EB98AEC2D0F54B28454E2FA856)model;
- (BOOL)hasGeometricDistortionCalibration;
- (NSData)forwardGeometricDistortionPolynomial;
- (NSData)inverseGeometricDistortionPolynomial;
- (NSString)portType;
- (VCCamera)init;
- (VCCamera)initWithDictionary:(id)a3;
- (__n128)extrinsicMatrix;
- (__n128)intrinsicMatrix;
- (__n128)rotation;
- (__n128)rotationMatrix;
- (__n128)translation;
- (double)focalLength;
- (double)geometricDistortionCenter;
- (double)principalPoint;
- (double)sensorSize;
- (float)fov;
- (float)pixelSize;
- (float)stereographicFisheyeStrength;
- (float)zoomFOV;
- (float)zoomFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (int)geometricDistortionCalibrationMaxRadius;
- (int)sensorID;
- (int)updateWithCalibration:(id)a3;
- (void)_updateModel;
- (void)_updateModelDistortionProperties;
- (void)_updateModelExtrinsicProperties;
- (void)_updateModelFisheyeProperties;
- (void)_updateModelIntrinsicProperties;
- (void)setFocalLength:(VCCamera *)self;
- (void)setForwardGeometricDistortionPolynomial:(id)a3;
- (void)setFov:(float)a3;
- (void)setGeometricDistortionCalibrationMaxRadius:(int)a3;
- (void)setGeometricDistortionCenter:(VCCamera *)self;
- (void)setHasGeometricDistortionCalibration:(BOOL)a3;
- (void)setInverseGeometricDistortionPolynomial:(id)a3;
- (void)setPixelSize:(float)a3;
- (void)setPortType:(id)a3;
- (void)setPrincipalPoint:(VCCamera *)self;
- (void)setRotation:(VCCamera *)self;
- (void)setSensorID:(int)a3;
- (void)setSensorSize:(VCCamera *)self;
- (void)setStereographicFisheyeStrength:(float)a3;
- (void)setTranslation:(VCCamera *)self;
- (void)setZoomFOV:(float)a3;
- (void)setZoomFactor:(float)a3;
@end

@implementation VCCamera

- (VCCamera)init
{
  v7.receiver = self;
  v7.super_class = (Class)VCCamera;
  v2 = [(VCCamera *)&v7 init];
  *(void *)&v2->_sensorSize[4] = 0x453B8000457A0000;
  *(int32x2_t *)&v2->_focalLength[4] = vdup_n_s32(0x44F9FFFFu);
  *(void *)&v2->_principalPoint[4] = 0x44BB800044FA0000;
  *(void *)&v2->_pixelSize = 0x3F8000003A83126FLL;
  v2->_hasGeometricDistortionCalibration = 0;
  v2->_geometricDistortionCalibrationMaxRadius = 0;
  *(_OWORD *)v2->_rotation = 0u;
  *(_OWORD *)v2->_translation = 0u;
  forwardGeometricDistortionPolynomial = v2->_forwardGeometricDistortionPolynomial;
  *(void *)&v2->_geometricDistortionCenter[4] = 0;
  v2->_forwardGeometricDistortionPolynomial = 0;

  inverseGeometricDistortionPolynomial = v2->_inverseGeometricDistortionPolynomial;
  v2->_inverseGeometricDistortionPolynomial = 0;

  v2->_stereographicFisheyeStrength = 0.0;
  portType = v2->_portType;
  v2->_portType = 0;

  v2->_sensorID = 0;
  v2->_modelState = 15;
  return v2;
}

- (int)updateWithCalibration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_31;
  }
  v6 = [v4 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  objc_super v7 = v6;
  if (!v6) {
    goto LABEL_31;
  }
  v8 = [v6 objectForKeyedSubscript:@"Width"];
  [v8 floatValue];
  unsigned int v41 = v9;

  v10 = [v7 objectForKeyedSubscript:@"Height"];
  [v10 floatValue];
  unsigned int v40 = v11;

  *(void *)&self->_sensorSize[4] = __PAIR64__(v40, v41);
  v12 = [v5 objectForKeyedSubscript:@"IntrinsicMatrix"];
  if (!v12)
  {

LABEL_31:
    int v38 = -1;
    goto LABEL_29;
  }
  id v13 = v12;
  id v42 = v13;
  uint64_t v14 = [v13 bytes];
  long long v15 = *(_OWORD *)v14;
  long long v16 = *(_OWORD *)(v14 + 32);
  DWORD1(v15) = *(_DWORD *)(v14 + 20);
  *(void *)&self->_focalLength[4] = v15;
  *(void *)&self->_principalPoint[4] = v16;
  v17 = [v5 objectForKeyedSubscript:@"PixelSize"];
  v18 = v17;
  if (v17)
  {
    [v17 floatValue];
    self->_pixelSize = v19;
    v20 = [v5 objectForKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];
    v21 = [v5 objectForKeyedSubscript:@"LensDistortionCenter"];
    v22 = [v21 objectForKeyedSubscript:@"X"];

    v23 = [v5 objectForKeyedSubscript:@"LensDistortionCenter"];
    v24 = [v23 objectForKeyedSubscript:@"Y"];

    v25 = [v5 objectForKeyedSubscript:@"LensDistortionCoefficients"];
    uint64_t v26 = [v5 objectForKeyedSubscript:@"InverseLensDistortionCoefficients"];
    v27 = (void *)v26;
    if (v20) {
      BOOL v28 = v22 == 0;
    }
    else {
      BOOL v28 = 1;
    }
    BOOL v31 = v28 || v24 == 0 || v25 == 0 || v26 == 0;
    BOOL v32 = !v31;
    self->_hasGeometricDistortionCalibration = v32;
    if (v31)
    {
      self->_geometricDistortionCalibrationMaxRadius = 0;
      forwardGeometricDistortionPolynomial = self->_forwardGeometricDistortionPolynomial;
      *(void *)&self->_geometricDistortionCenter[4] = 0;
      self->_forwardGeometricDistortionPolynomial = 0;

      inverseGeometricDistortionPolynomial = self->_inverseGeometricDistortionPolynomial;
      self->_inverseGeometricDistortionPolynomial = 0;

      if ((([(NSString *)self->_portType isEqual:*MEMORY[0x1E4F52E10]] & 1) != 0
         || [(NSString *)self->_portType isEqual:*MEMORY[0x1E4F52DE8]])
        && !self->_hasGeometricDistortionCalibration)
      {
        int v37 = 4;
        goto LABEL_26;
      }
    }
    else
    {
      self->_geometricDistortionCalibrationMaxRadius = [v20 intValue];
      [v22 floatValue];
      *(_DWORD *)&self->_geometricDistortionCenter[4] = v33;
      [v24 floatValue];
      *(_DWORD *)&self->_geometricDistortionCenter[8] = v34;
      objc_storeStrong((id *)&self->_forwardGeometricDistortionPolynomial, v25);
      objc_storeStrong((id *)&self->_inverseGeometricDistortionPolynomial, v27);
    }
    int v37 = 0;
LABEL_26:

    int v38 = 0;
    id v13 = v42;
    goto LABEL_27;
  }
  int v37 = 4;
  int v38 = -1;
LABEL_27:

  if (!v37) {
    self->_modelState = 7;
  }
LABEL_29:

  return v38;
}

- (void)setSensorSize:(VCCamera *)self
{
  *(void *)&self->_sensorSize[4] = v2;
  self->_modelState |= 1u;
}

- (void)setFocalLength:(VCCamera *)self
{
  *(void *)&self->_focalLength[4] = v2;
  self->_modelState |= 1u;
}

- (void)setPrincipalPoint:(VCCamera *)self
{
  *(void *)&self->_principalPoint[4] = v2;
  self->_modelState |= 1u;
}

- (void)setPixelSize:(float)a3
{
  self->_pixelSize = a3;
  self->_modelState |= 1u;
}

- (void)setZoomFactor:(float)a3
{
  self->_zoomFactor = a3;
  self->_modelState |= 1u;
}

- (float)fov
{
  float32x2_t v2 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  float v7 = v2.f32[1];
  LODWORD(v8) = HIDWORD(*(void *)&self->_focalLength[4]);
  float v3 = atan2f(v2.f32[0], COERCE_FLOAT(*(void *)&self->_focalLength[4]));
  float v4 = v3 + v3;
  float v5 = atan2f(v7, v8);
  float result = v5 + v5;
  if (v4 > result) {
    return v4;
  }
  return result;
}

- (void)setFov:(float)a3
{
  float32x2_t v4 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)&self->_focalLength[4] = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], (float)(fmaxf(v4.f32[0], v4.f32[1]) / tanf(a3 * 0.5))/ fmaxf(COERCE_FLOAT(*(void *)&self->_focalLength[4]), COERCE_FLOAT(HIDWORD(*(void *)&self->_focalLength[4]))));
  self->_modelState |= 1u;
}

- (float)zoomFOV
{
  float32x2_t v2 = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], self->_zoomFactor);
  float32x2_t v3 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  float v8 = v3.f32[1];
  float v9 = v2.f32[1];
  float v4 = atan2f(v3.f32[0], v2.f32[0]);
  float v5 = v4 + v4;
  float v6 = atan2f(v8, v9);
  float result = v6 + v6;
  if (v5 > result) {
    return v5;
  }
  return result;
}

- (void)setZoomFOV:(float)a3
{
  float32x2_t v4 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  float v5 = fmaxf(v4.f32[0], v4.f32[1]);
  float v6 = tanf(a3 * 0.5);
  float zoomFactor = self->_zoomFactor;
  float32x2_t v8 = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], zoomFactor);
  self->_float zoomFactor = zoomFactor * (float)((float)(v5 / v6) / fmaxf(v8.f32[0], v8.f32[1]));
  self->_modelState |= 1u;
}

- (__n128)intrinsicMatrix
{
  return a1[2];
}

- (void)_updateModelIntrinsicProperties
{
  *(float32x2_t *)v4.i8 = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], self->_zoomFactor);
  v11.columns[0] = (simd_float3)v4.u32[0];
  int32x4_t v5 = vdupq_lane_s32(*(int32x2_t *)v4.i8, 1);
  v4.i32[1] = 0;
  v4.i64[1] = *(void *)&self->_principalPoint[4];
  __asm { FMOV            V5.4S, #1.0 }
  *(int32x2_t *)v2.i8 = vdup_lane_s32((int32x2_t)v4.u64[1], 1);
  v11.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v4, _Q5), v2);
  v11.columns[1] = (simd_float3)vzip2q_s32((int32x4_t)v4.u32[0], v5);
  v11.columns[1].i32[3] = 0;
  v11.columns[2].i32[3] = 0;
  *(void *)self->_anon_10 = *(void *)&self->_sensorSize[4];
  *(_OWORD *)&self->_anon_10[16] = v11.columns[0].u32[0];
  *(simd_float3 *)&self->_anon_10[32] = v11.columns[1];
  *(simd_float3 *)&self->_anon_10[48] = v11.columns[2];
  simd_float3x3 v12 = __invert_f3(v11);
  *(_DWORD *)&self->_anon_10[72] = v12.columns[0].i32[2];
  *(_DWORD *)&self->_anon_10[88] = v12.columns[1].i32[2];
  *(void *)&self->_anon_10[64] = v12.columns[0].i64[0];
  *(void *)&self->_anon_10[80] = v12.columns[1].i64[0];
  *(_DWORD *)&self->_anon_10[104] = v12.columns[2].i32[2];
  *(void *)&self->_anon_10[96] = v12.columns[2].i64[0];
  *(float *)&self->_anon_10[112] = self->_pixelSize * self->_pixelSize;
  self->_modelState &= ~1u;
}

- (void)setRotation:(VCCamera *)self
{
  *(_OWORD *)self->_rotation = v2;
  self->_modelState |= 2u;
}

- (void)setTranslation:(VCCamera *)self
{
  *(_OWORD *)self->_translation = v2;
  self->_modelState |= 2u;
}

- (__n128)extrinsicMatrix
{
  return a1[9];
}

- (__n128)rotationMatrix
{
  return a1[9];
}

- (void)_updateModelExtrinsicProperties
{
  float32x4_t v37 = *(float32x4_t *)self->_rotation;
  __float2 v3 = __sincosf_stret(0.5 * v37.f32[0]);
  float32x4_t v33 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF70, v3.__sinval);
  __float2 v4 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)v37.f32, 1));
  float32x4_t v5 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF80, v4.__sinval);
  v5.i32[3] = LODWORD(v4.__cosval);
  int32x4_t v6 = (int32x4_t)vnegq_f32(v5);
  int8x16_t v7 = (int8x16_t)vtrn2q_s32((int32x4_t)v5, vtrn1q_s32((int32x4_t)v5, v6));
  float32x4_t v8 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL), *(float32x2_t *)v33.f32, 1), (float32x4_t)vextq_s8(v7, v7, 8uLL), v33.f32[0]);
  float32x4_t v9 = (float32x4_t)vrev64q_s32((int32x4_t)v5);
  v9.i32[0] = v6.i32[1];
  v9.i32[3] = v6.i32[2];
  float32x4_t v35 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v5, v3.__cosval), v9, v33, 2), v8);
  __float2 v10 = __sincosf_stret(vmuls_lane_f32(0.5, v37, 2));
  float32x4_t v11 = vmulq_n_f32((float32x4_t)xmmword_1DD5ACF90, v10.__sinval);
  v11.i32[3] = LODWORD(v10.__cosval);
  _Q1 = (int32x4_t)vnegq_f32(v11);
  int8x16_t v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v11, vtrn1q_s32((int32x4_t)v11, _Q1));
  _Q3 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)_Q1, 8uLL), *(float32x2_t *)v35.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v35.f32[0]);
  v39.columns[2] = (simd_float4)vrev64q_s32((int32x4_t)v11);
  v39.columns[2].i32[0] = _Q1.i32[1];
  v39.columns[2].i32[3] = _Q1.i32[2];
  _Q0 = vaddq_f32(_Q3, vmlaq_laneq_f32(vmulq_laneq_f32(v11, v35, 3), (float32x4_t)v39.columns[2], v35, 2));
  _Q1.i32[0] = _Q0.i32[1];
  v39.columns[2].i32[0] = _Q0.i32[2];
  __asm { FMLS            S5, S2, V0.S[2] }
  _S4 = _Q0.i32[3];
  __asm { FMLA            S5, S4, V0.S[3] }
  simd_float4 v23 = _Q5;
  _Q5.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q0.f32[2], _Q0, 3), _Q0.f32[1], _Q0.f32[0]);
  v24.f32[0] = vmuls_lane_f32(_Q0.f32[1], _Q0, 3);
  float v25 = vmlas_n_f32(-(float)(_Q0.f32[1] * _Q0.f32[3]), _Q0.f32[2], _Q0.f32[0]);
  v23.f32[1] = _Q5.f32[0] + _Q5.f32[0];
  v23.f32[2] = v25 + v25;
  _Q5.f32[0] = vmlas_n_f32(-(float)(_Q0.f32[2] * _Q0.f32[3]), _Q0.f32[1], _Q0.f32[0]);
  v26.f32[0] = _Q5.f32[0] + _Q5.f32[0];
  __asm
  {
    FMLA            S3, S1, V0.S[1]
    FMLA            S3, S4, V0.S[3]
    FMLS            S3, S0, V0.S[0]
    FMLA            S5, S2, V0.S[1]
  }
  v26.i32[1] = _Q3.i32[0];
  v26.f32[2] = _Q5.f32[0] + _Q5.f32[0];
  _Q3.f32[0] = -(float)(_Q0.f32[0] * _Q0.f32[3]);
  _Q5.i64[0] = vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q0, 8uLL).u64[0];
  float32x2_t v27 = (float32x2_t)vzip1_s32(*(int32x2_t *)_Q0.f32, *(int32x2_t *)_Q5.f32);
  __asm
  {
    FMLA            S4, S2, V0.S[2]
    FMLS            S4, S0, V0.S[0]
    FMLS            S4, S1, V0.S[1]
  }
  _Q0.i32[0] = _Q5.i32[0];
  v24.i32[1] = _Q3.i32[0];
  float32x2_t v31 = vmla_f32(v24, v27, *(float32x2_t *)_Q0.f32);
  *(float32x2_t *)v39.columns[2].f32 = vadd_f32(v31, v31);
  v39.columns[2].i32[2] = _S4;
  v39.columns[3] = *(simd_float4 *)self->_translation;
  v39.columns[0] = v23;
  v39.columns[0].i32[3] = *(_DWORD *)(MEMORY[0x1E4F149A0] + 12);
  v39.columns[1] = v26;
  v39.columns[1].i32[3] = *(_DWORD *)(MEMORY[0x1E4F149A0] + 28);
  simd_float4 v36 = v39.columns[1];
  simd_float4 v38 = v39.columns[0];
  v39.columns[2].i32[3] = *(_DWORD *)(MEMORY[0x1E4F149A0] + 44);
  v39.columns[3].i32[3] = *(_DWORD *)(MEMORY[0x1E4F149A0] + 60);
  simd_float4 v32 = v39.columns[3];
  simd_float4 v34 = v39.columns[2];
  *(simd_float4x4 *)&self->_anon_10[128] = __invert_f4(v39);
  *(simd_float4 *)&self->_anon_10[192] = v38;
  *(simd_float4 *)&self->_anon_10[208] = v36;
  *(simd_float4 *)&self->_anon_10[224] = v34;
  *(simd_float4 *)&self->_anon_10[240] = v32;
  self->_modelState &= ~2u;
}

- (void)setGeometricDistortionCalibrationMaxRadius:(int)a3
{
  self->_geometricDistortionCalibrationMaxRadius = a3;
  self->_modelState |= 4u;
}

- (void)setGeometricDistortionCenter:(VCCamera *)self
{
  *(void *)&self->_geometricDistortionCenter[4] = v2;
  self->_modelState |= 4u;
}

- (void)setForwardGeometricDistortionPolynomial:(id)a3
{
  self->_modelState |= 4u;
}

- (void)setInverseGeometricDistortionPolynomial:(id)a3
{
  self->_modelState |= 4u;
}

- (void)_updateModelDistortionProperties
{
  self->_anon_10[256] = self->_hasGeometricDistortionCalibration;
  *(void *)&self->_anon_10[264] = *(void *)&self->_geometricDistortionCenter[4];
  __44__VCCamera__updateModelDistortionProperties__block_invoke((uint64_t)self, self->_forwardGeometricDistortionPolynomial, &self->_anon_10[276]);
  __44__VCCamera__updateModelDistortionProperties__block_invoke(v3, self->_inverseGeometricDistortionPolynomial, &self->_anon_10[312]);
  int geometricDistortionCalibrationMaxRadius = self->_geometricDistortionCalibrationMaxRadius;
  float v5 = *(float *)&self->_anon_10[112]
     * (float)(geometricDistortionCalibrationMaxRadius * geometricDistortionCalibrationMaxRadius);
  unsigned int v6 = vcvtms_s32_f32((float)(1.0/ (float)((float)((float)(*(float *)&self->_anon_10[276]+ (float)((float)(*(float *)&self->_anon_10[280]+ (float)((float)(*(float *)&self->_anon_10[284]+ (float)((float)(*(float *)&self->_anon_10[288]+ (float)((float)(*(float *)&self->_anon_10[292] + (float)((float)(*(float *)&self->_anon_10[296] + (float)((float)(*(float *)&self->_anon_10[300] + (float)((float)(*(float *)&self->_anon_10[304] + (float)(v5 * 0.0)) * v5)) * v5)) * v5))* v5))* v5))* v5))* v5))* 0.01)+ 1.0))* (float)geometricDistortionCalibrationMaxRadius);
  *(_DWORD *)&self->_anon_10[272] = geometricDistortionCalibrationMaxRadius;
  *(_DWORD *)&self->_anon_10[308] = v6;
  self->_modelState &= ~4u;
}

void __44__VCCamera__updateModelDistortionProperties__block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v4 = a2;
  if (v4 && [v4 length] == 32)
  {
    [v4 getBytes:a3 length:32];
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
}

- (void)setStereographicFisheyeStrength:(float)a3
{
  self->_stereographicFisheyeStrength = a3;
  self->_modelState |= 8u;
}

- (void)_updateModelFisheyeProperties
{
  *(float *)&self->_anon_10[344] = self->_stereographicFisheyeStrength;
  self->_modelState &= ~8u;
}

- (VCCamera)initWithDictionary:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)VCCamera;
  float v5 = [(VCCamera *)&v68 init];
  unsigned int v6 = [v4 objectForKeyedSubscript:@"SensorSize"];
  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 2) {
    goto LABEL_53;
  }
  float32x4_t v8 = [v7 objectAtIndexedSubscript:0];
  [v8 floatValue];
  unsigned int v64 = v9;
  __float2 v10 = [v7 objectAtIndexedSubscript:1];
  [v10 floatValue];
  *(void *)&v5->_sensorSize[4] = __PAIR64__(v11, v64);

  unsigned int v6 = [v4 objectForKeyedSubscript:@"FocalLength"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 2) {
    goto LABEL_53;
  }
  simd_float3x3 v12 = [v7 objectAtIndexedSubscript:0];
  [v12 floatValue];
  unsigned int v65 = v13;
  uint64_t v14 = [v7 objectAtIndexedSubscript:1];
  [v14 floatValue];
  *(void *)&v5->_focalLength[4] = __PAIR64__(v15, v65);

  unsigned int v6 = [v4 objectForKeyedSubscript:@"PrincipalPoint"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 2) {
    goto LABEL_53;
  }
  long long v16 = [v7 objectAtIndexedSubscript:0];
  [v16 floatValue];
  unsigned int v66 = v17;
  v18 = [v7 objectAtIndexedSubscript:1];
  [v18 floatValue];
  *(void *)&v5->_principalPoint[4] = __PAIR64__(v19, v66);

  unsigned int v6 = [v4 objectForKeyedSubscript:@"PixelSize"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  [v6 floatValue];
  v5->_pixelSize = v20;
  v21 = [v4 objectForKeyedSubscript:@"ZoomFactor"];

  if (!v21)
  {
LABEL_54:
    unsigned int v6 = 0;
LABEL_55:
    v59 = 0;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_56:
    v59 = 0;
    unsigned int v6 = v21;
    goto LABEL_52;
  }
  [v21 floatValue];
  v5->_float zoomFactor = v22;
  unsigned int v6 = [v4 objectForKeyedSubscript:@"Translation"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 3) {
    goto LABEL_53;
  }
  simd_float4 v23 = [v7 objectAtIndexedSubscript:0];
  [v23 floatValue];
  *(void *)&long long v63 = v24;
  float v25 = [v7 objectAtIndexedSubscript:1];
  [v25 floatValue];
  int v61 = v26;
  float32x2_t v27 = [v7 objectAtIndexedSubscript:2];
  [v27 floatValue];
  long long v28 = v63;
  DWORD1(v28) = v61;
  DWORD2(v28) = v29;
  *(_OWORD *)v5->_translation = v28;

  unsigned int v6 = [v4 objectForKeyedSubscript:@"Rotation"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 3) {
    goto LABEL_53;
  }
  v30 = [v7 objectAtIndexedSubscript:0];
  [v30 floatValue];
  *(void *)&long long v63 = v31;
  simd_float4 v32 = [v7 objectAtIndexedSubscript:1];
  [v32 floatValue];
  int v62 = v33;
  simd_float4 v34 = [v7 objectAtIndexedSubscript:2];
  [v34 floatValue];
  long long v35 = v63;
  DWORD1(v35) = v62;
  DWORD2(v35) = v36;
  *(_OWORD *)v5->_rotation = v35;

  float32x4_t v37 = [v4 objectForKeyedSubscript:@"GeometricDistortionCalibrationMaxRadius"];
  if (!v37)
  {
LABEL_42:
    v5->_hasGeometricDistortionCalibration = 0;
    goto LABEL_43;
  }
  simd_float4 v38 = [v4 objectForKeyedSubscript:@"GeometricDistortionCenter"];
  if (!v38)
  {
LABEL_41:

    goto LABEL_42;
  }
  simd_float4x4 v39 = [v4 objectForKeyedSubscript:@"ForwardGeometricDistortionPolynomial"];
  if (!v39)
  {

    goto LABEL_41;
  }
  unsigned int v40 = [v4 objectForKeyedSubscript:@"InverseGeometricDistortionPolynomial"];

  if (!v40) {
    goto LABEL_42;
  }
  v5->_hasGeometricDistortionCalibration = 1;
  unsigned int v6 = [v4 objectForKeyedSubscript:@"GeometricDistortionCalibrationMaxRadius"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  v5->_int geometricDistortionCalibrationMaxRadius = [v6 intValue];
  v21 = [v4 objectForKeyedSubscript:@"GeometricDistortionCenter"];

  if (!v21) {
    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_56;
  }
  id v7 = v21;
  if ([v7 count] != 2) {
    goto LABEL_53;
  }
  unsigned int v41 = [v7 objectAtIndexedSubscript:0];
  [v41 floatValue];
  unsigned int v67 = v42;
  v43 = [v7 objectAtIndexedSubscript:1];
  [v43 floatValue];
  *(void *)&v5->_geometricDistortionCenter[4] = __PAIR64__(v44, v67);

  unsigned int v6 = [v4 objectForKeyedSubscript:@"ForwardGeometricDistortionPolynomial"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 8) {
    goto LABEL_53;
  }
  v45 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  uint64_t v46 = [(NSData *)v45 mutableBytes];
  for (uint64_t i = 0; i != 8; ++i)
  {
    v48 = [v7 objectAtIndexedSubscript:i];
    [v48 floatValue];
    *(_DWORD *)(v46 + 4 * i) = v49;
  }
  forwardGeometricDistortionPolynomial = v5->_forwardGeometricDistortionPolynomial;
  v5->_forwardGeometricDistortionPolynomial = v45;

  unsigned int v6 = [v4 objectForKeyedSubscript:@"InverseGeometricDistortionPolynomial"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  id v7 = v6;
  if ([v7 count] != 8)
  {
LABEL_53:

    v59 = 0;
    unsigned int v6 = v7;
    goto LABEL_52;
  }
  v51 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  uint64_t v52 = [(NSData *)v51 mutableBytes];
  for (uint64_t j = 0; j != 8; ++j)
  {
    v54 = [v7 objectAtIndexedSubscript:j];
    [v54 floatValue];
    *(_DWORD *)(v52 + 4 * j) = v55;
  }
  inverseGeometricDistortionPolynomial = v5->_inverseGeometricDistortionPolynomial;
  v5->_inverseGeometricDistortionPolynomial = v51;

LABEL_43:
  unsigned int v6 = [v4 objectForKeyedSubscript:@"StereographicFisheyeStrength"];

  if (!v6) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
  [v6 floatValue];
  v5->_stereographicFisheyeStrength = v57;
  v58 = [v4 objectForKeyedSubscript:@"PortType"];

  if (v58)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_portType, v58);
    }
  }
  unsigned int v6 = [v4 objectForKeyedSubscript:@"SensorID"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_sensorID = [v6 intValue];
    }
  }
  v5->_modelState = 15;
  v59 = v5;
LABEL_52:

  return v59;
}

- (id)dictionaryRepresentation
{
  v61[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithFloat:*(double *)&self->_sensorSize[4]];
  v61[0] = v4;
  LODWORD(v5) = *(_DWORD *)self->_focalLength;
  unsigned int v6 = [NSNumber numberWithFloat:v5];
  v61[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  [v3 setObject:v7 forKeyedSubscript:@"SensorSize"];

  float32x4_t v8 = [NSNumber numberWithFloat:*(double *)&self->_focalLength[4]];
  v60[0] = v8;
  LODWORD(v9) = *(_DWORD *)self->_principalPoint;
  __float2 v10 = [NSNumber numberWithFloat:v9];
  v60[1] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  [v3 setObject:v11 forKeyedSubscript:@"FocalLength"];

  simd_float3x3 v12 = [NSNumber numberWithFloat:*(double *)&self->_principalPoint[4]];
  v59[0] = v12;
  LODWORD(v13) = *(_DWORD *)self->_geometricDistortionCenter;
  uint64_t v14 = [NSNumber numberWithFloat:v13];
  v59[1] = v14;
  unsigned int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  [v3 setObject:v15 forKeyedSubscript:@"PrincipalPoint"];

  *(float *)&double v16 = self->_pixelSize;
  unsigned int v17 = [NSNumber numberWithFloat:v16];
  [v3 setObject:v17 forKeyedSubscript:@"PixelSize"];

  *(float *)&double v18 = self->_zoomFactor;
  unsigned int v19 = [NSNumber numberWithFloat:v18];
  [v3 setObject:v19 forKeyedSubscript:@"ZoomFactor"];

  LODWORD(v20) = *(_DWORD *)self->_translation;
  v21 = [NSNumber numberWithFloat:v20];
  v58[0] = v21;
  LODWORD(v22) = *(_DWORD *)&self->_translation[4];
  simd_float4 v23 = [NSNumber numberWithFloat:v22];
  v58[1] = v23;
  LODWORD(v24) = *(_DWORD *)&self->_translation[8];
  float v25 = [NSNumber numberWithFloat:v24];
  v58[2] = v25;
  int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];
  [v3 setObject:v26 forKeyedSubscript:@"Translation"];

  LODWORD(v27) = *(_DWORD *)self->_rotation;
  long long v28 = [NSNumber numberWithFloat:v27];
  v57[0] = v28;
  LODWORD(v29) = *(_DWORD *)&self->_rotation[4];
  v30 = [NSNumber numberWithFloat:v29];
  v57[1] = v30;
  LODWORD(v31) = *(_DWORD *)&self->_rotation[8];
  simd_float4 v32 = [NSNumber numberWithFloat:v31];
  v57[2] = v32;
  int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
  [v3 setObject:v33 forKeyedSubscript:@"Rotation"];

  if (self->_hasGeometricDistortionCalibration)
  {
    long long v35 = [NSNumber numberWithInt:self->_geometricDistortionCalibrationMaxRadius];
    [v3 setObject:v35 forKeyedSubscript:@"GeometricDistortionCalibrationMaxRadius"];

    int v36 = [NSNumber numberWithFloat:*(double *)&self->_geometricDistortionCenter[4]];
    v56[0] = v36;
    LODWORD(v37) = *(_DWORD *)&self->_geometricDistortionCenter[8];
    simd_float4 v38 = [NSNumber numberWithFloat:v37];
    v56[1] = v38;
    simd_float4x4 v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    [v3 setObject:v39 forKeyedSubscript:@"GeometricDistortionCenter"];

    unsigned int v40 = [(NSData *)self->_forwardGeometricDistortionPolynomial bytes];
    unsigned int v41 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
    for (uint64_t i = 0; i != 8; ++i)
    {
      LODWORD(v42) = v40[i];
      unsigned int v44 = [NSNumber numberWithFloat:v42];
      [v41 setObject:v44 atIndexedSubscript:i];
    }
    [v3 setObject:v41 forKeyedSubscript:@"ForwardGeometricDistortionPolynomial"];
    v45 = [(NSData *)self->_inverseGeometricDistortionPolynomial bytes];
    uint64_t v46 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
    for (uint64_t j = 0; j != 8; ++j)
    {
      LODWORD(v47) = v45[j];
      int v49 = [NSNumber numberWithFloat:v47];
      [v46 setObject:v49 atIndexedSubscript:j];
    }
    [v3 setObject:v46 forKeyedSubscript:@"InverseGeometricDistortionPolynomial"];
  }
  *(float *)&double v34 = self->_stereographicFisheyeStrength;
  v50 = [NSNumber numberWithFloat:v34];
  [v3 setObject:v50 forKeyedSubscript:@"StereographicFisheyeStrength"];

  portType = self->_portType;
  if (portType)
  {
    uint64_t v52 = (void *)[(NSString *)portType copy];
    [v3 setObject:v52 forKeyedSubscript:@"PortType"];
  }
  if (self->_sensorID)
  {
    v53 = objc_msgSend(NSNumber, "numberWithInt:");
    [v3 setObject:v53 forKeyedSubscript:@"SensorID"];
  }
  v54 = (void *)[v3 copy];

  return v54;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(VCCamera);
  *(void *)&v4->_sensorSize[4] = *(void *)&self->_sensorSize[4];
  *(void *)&v4->_focalLength[4] = *(void *)&self->_focalLength[4];
  *(void *)&v4->_principalPoint[4] = *(void *)&self->_principalPoint[4];
  v4->_pixelSize = self->_pixelSize;
  v4->_float zoomFactor = self->_zoomFactor;
  *(_OWORD *)v4->_rotation = *(_OWORD *)self->_rotation;
  *(_OWORD *)v4->_translation = *(_OWORD *)self->_translation;
  v4->_int geometricDistortionCalibrationMaxRadius = self->_geometricDistortionCalibrationMaxRadius;
  *(void *)&v4->_geometricDistortionCenter[4] = *(void *)&self->_geometricDistortionCenter[4];
  objc_storeStrong((id *)&v4->_forwardGeometricDistortionPolynomial, self->_forwardGeometricDistortionPolynomial);
  objc_storeStrong((id *)&v4->_inverseGeometricDistortionPolynomial, self->_inverseGeometricDistortionPolynomial);
  v4->_stereographicFisheyeStrength = self->_stereographicFisheyeStrength;
  objc_storeStrong((id *)&v4->_portType, self->_portType);
  v4->_sensorID = self->_sensorID;
  memcpy(v4->_anon_10, self->_anon_10, 0x164uLL);
  return v4;
}

- ($48BDB0EB98AEC2D0F54B28454E2FA856)model
{
  return ($48BDB0EB98AEC2D0F54B28454E2FA856 *)self->_anon_10;
}

- (void)_updateModel
{
  unsigned int modelState = self->_modelState;
  if (!modelState) {
    return;
  }
  if (modelState)
  {
    [(VCCamera *)self _updateModelIntrinsicProperties];
    unsigned int modelState = self->_modelState;
    if ((modelState & 2) == 0)
    {
LABEL_4:
      if ((modelState & 4) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      [(VCCamera *)self _updateModelDistortionProperties];
      if ((self->_modelState & 8) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((modelState & 2) == 0)
  {
    goto LABEL_4;
  }
  [(VCCamera *)self _updateModelExtrinsicProperties];
  unsigned int modelState = self->_modelState;
  if ((modelState & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((modelState & 8) == 0) {
    return;
  }
LABEL_10:

  [(VCCamera *)self _updateModelFisheyeProperties];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"VCCamera<%p> {\n", self);
  objc_msgSend(v3, "appendFormat:", @"  sensorSize  : %g x %g           \n", COERCE_FLOAT(*(void *)&self->_sensorSize[4]), COERCE_FLOAT(HIDWORD(*(void *)&self->_sensorSize[4])));
  [(VCCamera *)self fov];
  objc_msgSend(v3, "appendFormat:", @"  FOV         : %g deg            \n", v4 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", @"  zoomFactor  : %g                \n", self->_zoomFactor);
  [(VCCamera *)self zoomFOV];
  objc_msgSend(v3, "appendFormat:", @"  zoomedFOV   : %g deg            \n", v5 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", @"  rotation    : %6.2f %6.2f %6.2f \n", *(float *)self->_rotation, *(float *)&self->_rotation[4], *(float *)&self->_rotation[8]);
  objc_msgSend(v3, "appendFormat:", @"  translation : %6.2f %6.2f %6.2f \n", *(float *)self->_translation, *(float *)&self->_translation[4], *(float *)&self->_translation[8]);
  [v3 appendFormat:@"  portType    : %@                \n", self->_portType];
  objc_msgSend(v3, "appendFormat:", @"  sensorID    : 0x%x              \n", self->_sensorID);
  [v3 appendFormat:@"}\n"];

  return v3;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"VCCamera<%p> {\n", self);
  objc_msgSend(v3, "appendFormat:", @"  sensorSize     : %g x %g \n", COERCE_FLOAT(*(void *)&self->_sensorSize[4]), COERCE_FLOAT(HIDWORD(*(void *)&self->_sensorSize[4])));
  [v3 appendFormat:@"  principalPoint : %g, %g \n", COERCE_FLOAT(*(void *)&self->_principalPoint[4]), COERCE_FLOAT(HIDWORD(*(void *)&self->_principalPoint[4]))];
  [v3 appendFormat:@"  focalLength    : %g, %g \n", COERCE_FLOAT(*(void *)&self->_focalLength[4]), COERCE_FLOAT(HIDWORD(*(void *)&self->_focalLength[4]))];
  objc_msgSend(v3, "appendFormat:", @"  pixelSize      : %g      \n", self->_pixelSize);
  [(VCCamera *)self fov];
  objc_msgSend(v3, "appendFormat:", @"  FOV            : %g deg  \n", v4 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", @"  zoomFactor     : %g      \n", self->_zoomFactor);
  [(VCCamera *)self zoomFOV];
  objc_msgSend(v3, "appendFormat:", @"  zoomedFOV      : %g deg  \n", v5 / 3.14159265 * 180.0);
  [v3 appendFormat:@"\n"];
  objc_msgSend(v3, "appendFormat:", @"  rotation       : %6.2f %6.2f %6.2f \n", *(float *)self->_rotation, *(float *)&self->_rotation[4], *(float *)&self->_rotation[8]);
  objc_msgSend(v3, "appendFormat:", @"  translation    : %6.2f %6.2f %6.2f \n", *(float *)self->_translation, *(float *)&self->_translation[4], *(float *)&self->_translation[8]);
  [v3 appendFormat:@"\n"];
  objc_msgSend(v3, "appendFormat:", @"  geometricDistortionCalibrationMaxRadius : %d          \n", self->_geometricDistortionCalibrationMaxRadius);
  [v3 appendFormat:@"  geometricDistortionCalibrationCenter    : <%.2f %.2f> \n", COERCE_FLOAT(*(void *)&self->_geometricDistortionCenter[4]), COERCE_FLOAT(HIDWORD(*(void *)&self->_geometricDistortionCenter[4]))];
  [v3 appendFormat:@"  forwardGeometricDistortionPolynomial    : %@          \n", self->_forwardGeometricDistortionPolynomial];
  [v3 appendFormat:@"  inverseGeometricDistortionPolynomial    : %@          \n", self->_inverseGeometricDistortionPolynomial];
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"  stereographicFisheyeStrength : %.2f \n", self->_stereographicFisheyeStrength];
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"  portType : %@   \n", self->_portType];
  objc_msgSend(v3, "appendFormat:", @"  sensorID : 0x%x \n", self->_sensorID);
  [v3 appendFormat:@"}\n"];

  return v3;
}

- (double)sensorSize
{
  return *(double *)(a1 + 400);
}

- (double)focalLength
{
  return *(double *)(a1 + 408);
}

- (double)principalPoint
{
  return *(double *)(a1 + 416);
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (float)zoomFactor
{
  return self->_zoomFactor;
}

- (__n128)rotation
{
  return a1[29];
}

- (__n128)translation
{
  return a1[30];
}

- (BOOL)hasGeometricDistortionCalibration
{
  return self->_hasGeometricDistortionCalibration;
}

- (void)setHasGeometricDistortionCalibration:(BOOL)a3
{
  self->_hasGeometricDistortionCalibration = a3;
}

- (int)geometricDistortionCalibrationMaxRadius
{
  return self->_geometricDistortionCalibrationMaxRadius;
}

- (double)geometricDistortionCenter
{
  return *(double *)(a1 + 424);
}

- (NSData)forwardGeometricDistortionPolynomial
{
  return self->_forwardGeometricDistortionPolynomial;
}

- (NSData)inverseGeometricDistortionPolynomial
{
  return self->_inverseGeometricDistortionPolynomial;
}

- (float)stereographicFisheyeStrength
{
  return self->_stereographicFisheyeStrength;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (int)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_inverseGeometricDistortionPolynomial, 0);

  objc_storeStrong((id *)&self->_forwardGeometricDistortionPolynomial, 0);
}

@end