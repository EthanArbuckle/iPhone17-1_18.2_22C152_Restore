@interface ARGeoTrackingConsensusAndAverageFilter
- (BOOL)getCurrentENUFromVIO:(double)a3 ENUFromVIO:(id *)a4;
- (double)score;
- (uint64_t)initWithENUFromECEF:(void *)a1 maxHistory:minInlierScore:;
- (uint64_t)updateWithVIOPose:(const simd_double4x4 *)a3 VLPose:(const simd_double4x4 *)a4;
- (void)dealloc;
@end

@implementation ARGeoTrackingConsensusAndAverageFilter

- (uint64_t)initWithENUFromECEF:(void *)a1 maxHistory:minInlierScore:
{
  v2.receiver = a1;
  v2.super_class = (Class)ARGeoTrackingConsensusAndAverageFilter;
  if ([(ARGeoTrackingConsensusAndAverageFilter *)&v2 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl)
  {
    v4 = (void *)impl[34];
    if (v4)
    {
      impl[35] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9C56C0](impl, 0x1020C40627BD049);
  }
  self->_impl = 0;
  v5.receiver = self;
  v5.super_class = (Class)ARGeoTrackingConsensusAndAverageFilter;
  [(ARGeoTrackingConsensusAndAverageFilter *)&v5 dealloc];
}

- (double)score
{
  return *((double *)self->_impl + 39);
}

- (BOOL)getCurrentENUFromVIO:(double)a3 ENUFromVIO:(id *)a4
{
  impl = (unsigned __int8 *)self->_impl;
  int v5 = impl[128];
  if (impl[128]) {
    memmove(a4, impl, 0x80uLL);
  }
  return v5 != 0;
}

- (uint64_t)updateWithVIOPose:(const simd_double4x4 *)a3 VLPose:(const simd_double4x4 *)a4
{
  return ARConsensusAndAverageFilterImpl::Update(*(ARConsensusAndAverageFilterImpl **)(a1 + 8), a3, a4);
}

@end