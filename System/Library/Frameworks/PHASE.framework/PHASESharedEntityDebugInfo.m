@interface PHASESharedEntityDebugInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PHASESharedEntityDebugInfo)initWithCoder:(id)a3;
- (__n128)setTransform:(__n128)a3;
- (__n128)transform;
- (id)description;
- (int)referenceCount;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceCount:(int)a3;
@end

@implementation PHASESharedEntityDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [(PHASESharedEntityDebugInfo *)self transform];
  float32x4_t v15 = v6;
  float32x4_t v16 = v5;
  float32x4_t v18 = v7;
  float32x4_t v17 = v8;
  [v4 transform];
  LODWORD(self) = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v16, v9), (int8x16_t)vceqq_f32(v15, v10)), vandq_s8((int8x16_t)vceqq_f32(v18, v11), (int8x16_t)vceqq_f32(v17, v12))));

  return self >> 31;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&self[1] length:64];
  [v5 encodeObject:v4 forKey:@"transform"];

  [v5 encodeInt:self->_referenceCount forKey:@"referenceCount"];
}

- (PHASESharedEntityDebugInfo)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHASESharedEntityDebugInfo;
  id v5 = [(PHASESharedEntityDebugInfo *)&v13 init];
  if (v5)
  {
    float32x4_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transform"];
    float32x4_t v7 = v6;
    if (v6)
    {
      [v6 getBytes:&v5[1] length:64];
    }
    else
    {
      float32x4_t v8 = **(id **)(Phase::Logger::GetInstance(0) + 1024);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        float32x4_t v15 = "PHASESharedEntityDebug.mm";
        __int16 v16 = 1024;
        int v17 = 32;
        _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PHASESharedEntityDebugInfo does not have transform object", buf, 0x12u);
      }
      PHASESharedEntityDebugInfo v10 = *(PHASESharedEntityDebugInfo *)(MEMORY[0x263EF89A8] + 32);
      PHASESharedEntityDebugInfo v9 = *(PHASESharedEntityDebugInfo *)(MEMORY[0x263EF89A8] + 48);
      PHASESharedEntityDebugInfo v11 = *(PHASESharedEntityDebugInfo *)(MEMORY[0x263EF89A8] + 16);
      v5[1] = *(PHASESharedEntityDebugInfo *)MEMORY[0x263EF89A8];
      v5[2] = v11;
      v5[3] = v10;
      v5[4] = v9;
    }
    v5->_referenceCount = [v4 decodeIntForKey:@"referenceCount"];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<PHASESharedEntityDebugInfo:%p position=[%0.1f, %0.1f, %0.1f], referenceCount=%d>", self, *(float *)&self[4].super.isa, *((float *)&self[4].super.isa + 1), *(float *)&self[4]._referenceCount, self->_referenceCount];
}

- (__n128)setTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (void)setReferenceCount:(int)a3
{
  self->_referenceCount = a3;
}

- (__n128)transform
{
  return a1[1];
}

- (int)referenceCount
{
  return self->_referenceCount;
}

@end