@interface DYShaderProfilerTimingWrapper
- (DYShaderProfilerTiming)timing;
- (DYShaderProfilerTimingWrapper)init;
- (id).cxx_construct;
- (void)setTiming:(DYShaderProfilerTiming *)a3;
@end

@implementation DYShaderProfilerTimingWrapper

- (DYShaderProfilerTimingWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)DYShaderProfilerTimingWrapper;
  v2 = [(DYShaderProfilerTimingWrapper *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (DYShaderProfilerTiming)timing
{
  long long v3 = *(_OWORD *)&self->_time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self->_time.max;
  return self;
}

- (void)setTiming:(DYShaderProfilerTiming *)a3
{
  long long v3 = *(_OWORD *)&a3->_cycle.average;
  long long v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_timing._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_timing._cycle.max = v4;
  *(_OWORD *)&self->_timing._cycle.average = v3;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end