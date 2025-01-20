@interface EspressoProfilingLayerRuntime
- (double)end_t;
- (double)start_t;
- (void)setEnd_t:(double)a3;
- (void)setStart_t:(double)a3;
@end

@implementation EspressoProfilingLayerRuntime

- (void)setEnd_t:(double)a3
{
  self->_end_t = a3;
}

- (double)end_t
{
  return self->_end_t;
}

- (void)setStart_t:(double)a3
{
  self->_start_t = a3;
}

- (double)start_t
{
  return self->_start_t;
}

@end