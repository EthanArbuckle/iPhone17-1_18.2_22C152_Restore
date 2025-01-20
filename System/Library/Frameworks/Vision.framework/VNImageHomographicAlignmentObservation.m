@interface VNImageHomographicAlignmentObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (VNImageHomographicAlignmentObservation)init;
- (VNImageHomographicAlignmentObservation)initWithCoder:(id)a3;
- (__n128)setWarpTransform:(__n128)a3;
- (id)vn_cloneObject;
- (matrix_float3x3)warpTransform;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNImageHomographicAlignmentObservation

- (__n128)setWarpTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (matrix_float3x3)warpTransform
{
  simd_float3 v2 = *(simd_float3 *)&self[1].super.super.super.isa;
  simd_float3 v3 = *(simd_float3 *)&self[1].super.super._confidence;
  simd_float3 v4 = *(simd_float3 *)&self[1].super.super._requestImageBuffers;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  simd_float3 v4 = (VNImageHomographicAlignmentObservation *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VNImageHomographicAlignmentObservation;
    if ([(VNImageAlignmentObservation *)&v18 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      [(VNImageHomographicAlignmentObservation *)self warpTransform];
      float32x4_t v15 = v7;
      float32x4_t v16 = v6;
      float32x4_t v17 = v8;
      [(VNImageHomographicAlignmentObservation *)v5 warpTransform];
      uint32x4_t v12 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v16, v9), (int8x16_t)vceqq_f32(v15, v10)), (int8x16_t)vceqq_f32(v17, v11));
      v12.i32[3] = v12.i32[2];
      unsigned int v13 = vminvq_u32(v12) >> 31;
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v30.receiver = self;
  v30.super_class = (Class)VNImageHomographicAlignmentObservation;
  id v3 = [(VNImageAlignmentObservation *)&v30 hash];
  [(VNImageHomographicAlignmentObservation *)self warpTransform];
  unint64_t v13 = (unint64_t)LODWORD(v12) << 13;
  if (v12 == 0.0) {
    unint64_t v13 = 0;
  }
  uint64_t v14 = LODWORD(v4);
  if (v4 == 0.0) {
    uint64_t v14 = 0;
  }
  unint64_t v15 = v13 ^ v14;
  uint64_t v16 = LODWORD(v5);
  if (v5 == 0.0) {
    uint64_t v16 = 0;
  }
  unint64_t v17 = v16 ^ (v15 << 13);
  uint64_t v18 = LODWORD(v6);
  if (v6 == 0.0) {
    uint64_t v18 = 0;
  }
  uint64_t v19 = v18 ^ __ROR8__(v17, 51);
  uint64_t v20 = LODWORD(v7);
  if (v7 == 0.0) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v20 ^ __ROR8__(v19, 51);
  uint64_t v22 = LODWORD(v8);
  if (v8 == 0.0) {
    uint64_t v22 = 0;
  }
  uint64_t v23 = v22 ^ __ROR8__(v21, 51);
  uint64_t v24 = LODWORD(v9);
  if (v9 == 0.0) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = v24 ^ __ROR8__(v23, 51);
  uint64_t v26 = LODWORD(v10);
  if (v10 == 0.0) {
    uint64_t v26 = 0;
  }
  uint64_t v27 = v26 ^ __ROR8__(v25, 51);
  uint64_t v28 = LODWORD(v11);
  if (v11 == 0.0) {
    uint64_t v28 = 0;
  }
  return v28 ^ __ROR8__(v27, 51) ^ __ROR8__(v3, 51);
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageHomographicAlignmentObservation;
  id v3 = [(VNImageAlignmentObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    long long v5 = *(_OWORD *)&self[1].super.super._confidence;
    long long v4 = *(_OWORD *)&self[1].super.super._requestImageBuffers;
    v3[7] = *(_OWORD *)&self[1].super.super.super.isa;
    v3[8] = v5;
    v3[9] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageHomographicAlignmentObservation;
  [(VNImageAlignmentObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encode3x3Matrix:forKey:", @"warpTransform", *(double *)&self[1].super.super.super.isa, *(double *)&self[1].super.super._confidence, *(double *)&self[1].super.super._requestImageBuffers);
}

- (VNImageHomographicAlignmentObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNImageHomographicAlignmentObservation;
  objc_super v5 = [(VNImageAlignmentObservation *)&v14 initWithCoder:v4];
  if (v5)
  {
    objc_msgSend(v4, "vn_decode3x3MatrixForKey:", @"warpTransform");
    v5[1].super.super.super.isa = v6;
    LODWORD(v5[1].super.super._originatingRequestSpecifier) = v7;
    *(void *)&v5[1].super.super._confidence = v8;
    LODWORD(v5[1].super.super._uuid) = v9;
    LODWORD(v5[1].super.super._requestImageBuffersCacheKeys) = v10;
    v5[1].super.super._requestImageBuffers = v11;
    float v12 = v5;
  }

  return v5;
}

- (VNImageHomographicAlignmentObservation)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNImageHomographicAlignmentObservation;
  simd_float3 v2 = [(VNObservation *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    *(_OWORD *)&v2[1].super.super.super.isa = *MEMORY[0x1E4F14998];
    *(_OWORD *)&v2[1].super.super._confidence = v5;
    *(_OWORD *)&v2[1].super.super._requestImageBuffers = v4;
    float v6 = v2;
  }

  return v3;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNHomographicImageRegistrationRequest";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end