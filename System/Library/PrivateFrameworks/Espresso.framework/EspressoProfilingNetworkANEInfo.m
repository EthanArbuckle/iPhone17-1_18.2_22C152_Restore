@interface EspressoProfilingNetworkANEInfo
- (unint64_t)ane_time_per_eval_ns;
- (unint64_t)total_ane_time_ns;
- (void)setAne_time_per_eval_ns:(unint64_t)a3;
- (void)setTotal_ane_time_ns:(unint64_t)a3;
@end

@implementation EspressoProfilingNetworkANEInfo

- (void)setAne_time_per_eval_ns:(unint64_t)a3
{
  self->_ane_time_per_eval_ns = a3;
}

- (unint64_t)ane_time_per_eval_ns
{
  return self->_ane_time_per_eval_ns;
}

- (void)setTotal_ane_time_ns:(unint64_t)a3
{
  self->_total_ane_time_ns = a3;
}

- (unint64_t)total_ane_time_ns
{
  return self->_total_ane_time_ns;
}

@end