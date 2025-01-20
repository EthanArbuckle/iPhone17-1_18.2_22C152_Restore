@interface ATXBehavioralPredictionsFeatureCacheGuardedData
- (id).cxx_construct;
@end

@implementation ATXBehavioralPredictionsFeatureCacheGuardedData

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end