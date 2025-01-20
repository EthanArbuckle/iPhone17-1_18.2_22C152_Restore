@interface CFPrefsObservationConnectionQueue
@end

@implementation CFPrefsObservationConnectionQueue

dispatch_queue_t ___CFPrefsObservationConnectionQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("Observation Connection Event Handling", 0);
  _CFPrefsObservationConnectionQueue_observationQueue = (uint64_t)result;
  return result;
}

@end