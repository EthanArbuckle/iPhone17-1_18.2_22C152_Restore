@interface AR3DSkeletonRegistrationData
- (AR3DSkeletonRegistrationData)init;
- (BOOL)isEqual:(id)a3;
- (__n128)setVisionTransform:(__n128)a3;
- (__n128)visionTransform;
- (double)timestamp;
- (float)estimatedScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEstimatedScaleFactor:(float)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation AR3DSkeletonRegistrationData

- (AR3DSkeletonRegistrationData)init
{
  v6.receiver = self;
  v6.super_class = (Class)AR3DSkeletonRegistrationData;
  result = [(AR3DSkeletonRegistrationData *)&v6 init];
  if (result)
  {
    result->_estimatedScaleFactor = 1.0;
    uint64_t v3 = MEMORY[0x1E4F149A0];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *(_OWORD *)&result[1].super.isa = *MEMORY[0x1E4F149A0];
    *(_OWORD *)&result[1]._timestamp = v4;
    long long v5 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)&result[2].super.isa = *(_OWORD *)(v3 + 32);
    *(_OWORD *)&result[2]._timestamp = v5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_estimatedScaleFactor);
  long long v5 = *(_OWORD *)&self[1].super.isa;
  long long v6 = *(_OWORD *)&self[1]._timestamp;
  long long v7 = *(_OWORD *)&self[2]._timestamp;
  *((_OWORD *)result + 4) = *(_OWORD *)&self[2].super.isa;
  *((_OWORD *)result + 5) = v7;
  *((_OWORD *)result + 2) = v5;
  *((_OWORD *)result + 3) = v6;
  *((void *)result + 2) = *(void *)&self->_timestamp;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    long long v6 = v5;
    if (vabdd_f64(*((double *)v5 + 2), self->_timestamp) >= 0.00000011920929
      || vabds_f32(*((float *)v5 + 2), self->_estimatedScaleFactor) >= 0.00000011921)
    {
      char v7 = 0;
    }
    else
    {
      char v7 = AREqualTransforms(*((float32x4_t *)v5 + 2), *((float32x4_t *)v5 + 3), *((float32x4_t *)v5 + 4), *((float32x4_t *)v5 + 5), *(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._timestamp, *(float32x4_t *)&self[2].super.isa, *(float32x4_t *)&self[2]._timestamp);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (void)setEstimatedScaleFactor:(float)a3
{
  self->_estimatedScaleFactor = a3;
}

- (__n128)visionTransform
{
  return a1[2];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

@end