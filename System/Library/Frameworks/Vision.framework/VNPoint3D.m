@interface VNPoint3D
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNPoint3D)initWithCoder:(id)a3;
- (VNPoint3D)initWithPosition:(simd_float4x4)position;
- (id)description;
- (simd_float4x4)position;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNPoint3D

- (simd_float4x4)position
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

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"4x4:|%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g|", *(float *)&self[1].super.isa, *((float *)&self[1].super.isa + 1), *(float *)self[1]._anon_8, *(float *)&self[1]._anon_8[4], *(float *)&self[2].super.isa, *((float *)&self[2].super.isa + 1), *(float *)self[2]._anon_8, *(float *)&self[2]._anon_8[4], *(float *)&self[3].super.isa, *((float *)&self[3].super.isa + 1), *(float *)self[3]._anon_8, *(float *)&self[3]._anon_8[4], *(float *)&self[4].super.isa, *((float *)&self[4].super.isa + 1), *(float *)self[4]._anon_8, *(float *)&self[4]._anon_8[4]);
}

- (unint64_t)hash
{
  return VNHashMatrixFloat4x4((__n128)self[1], (__n128)self[2], (__n128)self[3], (__n128)self[4]);
}

- (BOOL)isEqual:(id)a3
{
  simd_float4 v4 = (VNPoint3D *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNPoint3D *)v4 position];
      unsigned int v9 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v5, (float32x4_t)self[1]), (int8x16_t)vceqq_f32(v6, (float32x4_t)self[2])), vandq_s8((int8x16_t)vceqq_f32(v7, (float32x4_t)self[3]), (int8x16_t)vceqq_f32(v8, (float32x4_t)self[4])))) >> 31;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VNPoint3D)initWithCoder:(id)a3
{
  objc_msgSend(a3, "vn_decode4x4MatrixForKey:", @"positionMatrix");

  return -[VNPoint3D initWithPosition:](self, "initWithPosition:");
}

- (VNPoint3D)initWithPosition:(simd_float4x4)position
{
  v8.receiver = self;
  v8.super_class = (Class)VNPoint3D;
  simd_float4 v3 = [(VNPoint3D *)&v8 init];
  simd_float4 v4 = (VNPoint3D *)v3;
  if (v3)
  {
    *(simd_float4x4 *)(v3 + 16) = position;
    float32x4_t v5 = v3;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end