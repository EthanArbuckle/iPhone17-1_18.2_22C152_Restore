@interface ARPatchGrid
+ (BOOL)supportsSecureCoding;
- (ARPatchGrid)initWithCoder:(id)a3;
- (ARPatchGrid)initWithPatchesVector:()vector<ARPatch pivotAngle:(std:(float)a4 :allocator<ARPatch>> *)a3;
- (BOOL)isEqual:(id)a3;
- (const)patches;
- (float)pivot;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARPatchGrid

- (ARPatchGrid)initWithPatchesVector:()vector<ARPatch pivotAngle:(std:(float)a4 :allocator<ARPatch>> *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ARPatchGrid;
  v6 = [(ARPatchGrid *)&v9 init];
  v7 = v6;
  if (v6)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v6->_patchesVector, (__n128 *)a3);
    v7->_angle = a4;
  }
  return v7;
}

- (unint64_t)size
{
  return (self->_patchesVector.__end_ - self->_patchesVector.__begin_) >> 4;
}

- (const)patches
{
  return self->_patchesVector.__begin_;
}

- (float)pivot
{
  return self->_angle;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = (float32x2_t **)v4;
    uint64_t v6 = [v5 size];
    if (v6 == [(ARPatchGrid *)self size])
    {
      v7 = v5[1];
      v8 = v5[2];
      if (v7 == v8)
      {
LABEL_8:
        BOOL v12 = *((float *)v5 + 8) == self->_angle;
LABEL_11:

        goto LABEL_12;
      }
      begin = self->_patchesVector.__begin_;
      while (1)
      {
        float32x2_t v10 = vsub_f32(*v7, *(float32x2_t *)begin);
        if (fabsf(sqrtf(vaddv_f32(vmul_f32(v10, v10)))) >= 0.00000011921) {
          break;
        }
        float32x2_t v11 = vsub_f32(v7[1], *(float32x2_t *)((char *)begin + 8));
        if (fabsf(sqrtf(vaddv_f32(vmul_f32(v11, v11)))) >= 0.00000011921) {
          break;
        }
        v7 += 2;
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
        if (v7 == v8) {
          goto LABEL_8;
        }
      }
    }
    BOOL v12 = 0;
    goto LABEL_11;
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_super v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  std::vector<ARPatch>::__init_with_size[abi:ne180100]<ARPatch*,ARPatch*>(&__p, self->_patchesVector.__begin_, (uint64_t)self->_patchesVector.__end_, (self->_patchesVector.__end_ - self->_patchesVector.__begin_) >> 4);
  *(float *)&double v5 = self->_angle;
  uint64_t v6 = (void *)[v4 initWithPatchesVector:&__p pivotAngle:v5];
  if (__p)
  {
    objc_super v9 = __p;
    operator delete(__p);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_angle;
  id v6 = v4;
  [v4 encodeFloat:@"angle" forKey:v5];
  [v6 encodeBytes:self->_patchesVector.__begin_ length:self->_patchesVector.__end_ - self->_patchesVector.__begin_ forKey:@"patchesVector"];
}

- (ARPatchGrid)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"angle"];
  int v6 = v5;
  uint64_t v16 = 0;
  id v7 = v4;
  v8 = (const void *)[v7 decodeBytesForKey:@"patchesVector" returnedLength:&v16];
  v14[1] = 0;
  uint64_t v15 = 0;
  v14[0] = 0;
  std::vector<ARPatch>::__init_with_size[abi:ne180100]<ARPatch*,ARPatch*>(v14, v8, (uint64_t)v8 + (v16 & 0xFFFFFFFFFFFFFFF0), v16 >> 4);
  HIDWORD(v9) = HIDWORD(v14[0]);
  *(_OWORD *)__p = *(_OWORD *)v14;
  uint64_t v13 = v15;
  v14[1] = 0;
  uint64_t v15 = 0;
  v14[0] = 0;
  LODWORD(v9) = v6;
  uint64_t v10 = [(ARPatchGrid *)self initWithPatchesVector:__p pivotAngle:v9];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v14[0])
  {
    v14[1] = v14[0];
    operator delete(v14[0]);
  }

  return v10;
}

- (void).cxx_destruct
{
  begin = self->_patchesVector.__begin_;
  if (begin)
  {
    self->_patchesVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end