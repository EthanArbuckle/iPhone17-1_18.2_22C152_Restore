@interface ABPKResultRetargeting
- (ABPKResultRetargeting)initWithModelJointTransforms:(id *)a3 localJointTransformsSRT:(const ABPKSRT *)a4 numberOfTransforms:(unint64_t)a5 liftedSkeletonData:(id)a6 identifier:(id)a7;
- (NSUUID)identifier;
- (const)jointLocalTransforms;
- (const)jointModelTransforms;
- (const)localJointTransformsSRT;
- (float)estimatedScale;
- (id).cxx_construct;
- (unint64_t)jointTransformCount;
- (void)setEstimatedScale:(float)a3;
@end

@implementation ABPKResultRetargeting

- (ABPKResultRetargeting)initWithModelJointTransforms:(id *)a3 localJointTransformsSRT:(const ABPKSRT *)a4 numberOfTransforms:(unint64_t)a5 liftedSkeletonData:(id)a6 identifier:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ABPKResultRetargeting;
  v15 = [(ABPKResultRetargeting *)&v29 init];
  if (v15)
  {
    long long v27 = 0uLL;
    v28 = 0;
    id v26 = v13;
    std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&v27, a3, (uint64_t)a3 + 64 * a5, a5);
    begin = v15->_modelTransforms.__begin_;
    if (begin)
    {
      v15->_modelTransforms.__end_ = begin;
      operator delete(begin);
      v15->_modelTransforms.__begin_ = 0;
      v15->_modelTransforms.__end_ = 0;
      v15->_modelTransforms.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v15->_modelTransforms.__begin_ = v27;
    v15->_modelTransforms.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v28;
    long long v27 = 0uLL;
    v28 = 0;
    std::vector<ABPKSRT>::__init_with_size[abi:ne180100]<ABPKSRT const*,ABPKSRT const*>(&v27, a4, (uint64_t)a4 + 48 * a5, a5);
    v17 = v15->_localTransformsSRT.__begin_;
    if (v17)
    {
      v15->_localTransformsSRT.__end_ = v17;
      operator delete(v17);
      v15->_localTransformsSRT.__begin_ = 0;
      v15->_localTransformsSRT.__end_ = 0;
      v15->_localTransformsSRT.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v15->_localTransformsSRT.__begin_ = v27;
    v15->_localTransformsSRT.__end_cap_.__value_ = v28;
    std::vector<simd_float4x4>::resize((uint64_t)&v15->_localTransforms, a5);
    if (a5)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 40;
      do
      {
        simdMatrix4x4FromRotationAndTranslation();
        v20 = (_OWORD *)((char *)v15->_localTransforms.__begin_ + v18);
        _OWORD *v20 = v21;
        v20[1] = v22;
        v20[2] = v23;
        v20[3] = v24;
        v19 += 48;
        v18 += 64;
        --a5;
      }
      while (a5);
    }
    objc_storeStrong((id *)&v15->_liftingResult, a6);
    objc_storeStrong((id *)&v15->_identifier, a7);
    id v13 = v26;
  }

  return v15;
}

- (const)jointModelTransforms
{
  return self->_modelTransforms.__begin_;
}

- (const)jointLocalTransforms
{
  return self->_localTransforms.__begin_;
}

- (const)localJointTransformsSRT
{
  return self->_localTransformsSRT.__begin_;
}

- (unint64_t)jointTransformCount
{
  return (self->_modelTransforms.__end_ - self->_modelTransforms.__begin_) >> 6;
}

- (float)estimatedScale
{
  return self->_estimatedScale;
}

- (void)setEstimatedScale:(float)a3
{
  self->_estimatedScale = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_liftingResult, 0);
  begin = self->_localTransforms.__begin_;
  if (begin)
  {
    self->_localTransforms.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_localTransformsSRT.__begin_;
  if (v4)
  {
    self->_localTransformsSRT.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_modelTransforms.__begin_;
  if (v5)
  {
    self->_modelTransforms.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end