@interface _HDFTMProducerMetricTracker
@end

@implementation _HDFTMProducerMetricTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end