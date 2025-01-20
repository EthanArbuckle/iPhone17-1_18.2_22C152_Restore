@interface ARGeoTrackingTechniqueStatePose
- (ARGeoTrackingTechniqueStatePose)initWithTimestamp:(double)a3 transform:(uint64_t)a4 fused:(long long *)a5 heading:(BOOL)a6;
- (BOOL)fused;
- (__n128)transform;
- (double)heading;
- (double)timestamp;
@end

@implementation ARGeoTrackingTechniqueStatePose

- (ARGeoTrackingTechniqueStatePose)initWithTimestamp:(double)a3 transform:(uint64_t)a4 fused:(long long *)a5 heading:(BOOL)a6
{
  v17.receiver = a1;
  v17.super_class = (Class)ARGeoTrackingTechniqueStatePose;
  result = [(ARGeoTrackingTechniqueStatePose *)&v17 init];
  if (result)
  {
    result->_timestamp = a2;
    long long v11 = *a5;
    long long v12 = a5[1];
    long long v13 = a5[3];
    *(_OWORD *)&result[2].super.isa = a5[2];
    *(_OWORD *)&result[2]._timestamp = v13;
    *(_OWORD *)&result[1].super.isa = v11;
    *(_OWORD *)&result[1]._timestamp = v12;
    long long v14 = a5[4];
    long long v15 = a5[5];
    long long v16 = a5[7];
    *(_OWORD *)&result[4].super.isa = a5[6];
    *(_OWORD *)&result[4]._timestamp = v16;
    *(_OWORD *)&result[3].super.isa = v14;
    *(_OWORD *)&result[3]._timestamp = v15;
    result->_fused = a6;
    result->_heading = a3 + ceil(a3 / -6.28318531) * 6.28318531;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__n128)transform
{
  long long v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 80);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (BOOL)fused
{
  return self->_fused;
}

- (double)heading
{
  return self->_heading;
}

@end