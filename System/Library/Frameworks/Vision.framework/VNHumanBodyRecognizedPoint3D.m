@interface VNHumanBodyRecognizedPoint3D
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNHumanBodyPose3DObservationJointName)parentJoint;
- (VNHumanBodyRecognizedPoint3D)initWithCoder:(id)a3;
- (__n128)initWithModelPosition:(double)a3 localPosition:(double)a4 jointName:(double)a5 parentJoint:(__n128)a6;
- (simd_float4x4)localPosition;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNHumanBodyRecognizedPoint3D

- (void).cxx_destruct
{
}

- (VNHumanBodyPose3DObservationJointName)parentJoint
{
  return (VNHumanBodyPose3DObservationJointName)objc_getProperty(self, a2, 88, 1);
}

- (simd_float4x4)localPosition
{
  objc_copyStruct(v6, &self[1], 64, 1, 0);
  simd_float4 v2 = (simd_float4)v6[0];
  simd_float4 v3 = (simd_float4)v6[1];
  simd_float4 v4 = (simd_float4)v6[2];
  simd_float4 v5 = (simd_float4)v6[3];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  if ([(VNRecognizedPoint3D *)&v13 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 parentJoint];
    if (VisionCoreEqualOrNilObjects())
    {
      [v5 localPosition];
      unsigned int v11 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v8, *(float32x4_t *)self[1].super._anon_10), (int8x16_t)vceqq_f32(v7, (float32x4_t)self[1].super.super)), vandq_s8((int8x16_t)vceqq_f32(v9, *(float32x4_t *)&self[1].super._anon_10[16]), (int8x16_t)vceqq_f32(v10, *(float32x4_t *)&self[1].super._anon_10[32])))) >> 31;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  id v4 = a3;
  [(VNRecognizedPoint3D *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentJoint, @"parentJoint", v5.receiver, v5.super_class);
  objc_msgSend(v4, "vn_encode4x4Matrix:forKey:", @"localPositionMatrix", *(double *)&self[1].super.super.super.isa, *(double *)self[1].super._anon_10, *(double *)&self[1].super._anon_10[16], *(double *)&self[1].super._anon_10[32]);
}

- (VNHumanBodyRecognizedPoint3D)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  objc_super v5 = [(VNRecognizedPoint3D *)&v15 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    float32x4_t v7 = v5 + 1;
    objc_msgSend(v4, "vn_decode4x4MatrixForKey:", @"localPositionMatrix");
    v7->super.super = v8;
    *(_OWORD *)v6[1].super._anon_10 = v9;
    *(_OWORD *)&v6[1].super._anon_10[16] = v10;
    *(_OWORD *)&v6[1].super._anon_10[32] = v11;
    uint64_t v12 = [v4 decodeObjectForKey:@"parentJoint"];
    parentJoint = v6->_parentJoint;
    v6->_parentJoint = (NSString *)v12;
  }
  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  NSUInteger v3 = [(NSString *)self->_parentJoint hash] ^ __ROR8__([(VNRecognizedPoint3D *)&v5 hash], 51);
  return VNHashMatrixFloat4x4((__n128)self[1].super.super, *(__n128 *)self[1].super._anon_10, *(__n128 *)&self[1].super._anon_10[16], *(__n128 *)&self[1].super._anon_10[32]) ^ __ROR8__(v3, 51);
}

- (__n128)initWithModelPosition:(double)a3 localPosition:(double)a4 jointName:(double)a5 parentJoint:(__n128)a6
{
  id v15 = a12;
  v28.receiver = a1;
  v28.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  v16 = -[VNRecognizedPoint3D initWithPosition:identifier:](&v28, sel_initWithPosition_identifier_, a11, a2, a3, a4, a5);
  v17 = (__n128 *)v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentJoint, a12);
    v17[6] = a6;
    v17[7] = a7;
    v17[8] = a8;
    v17[9] = a9;
    v18 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end