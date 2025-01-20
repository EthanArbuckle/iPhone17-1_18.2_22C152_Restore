@interface GEORequestResponseLogQueue
@end

@implementation GEORequestResponseLogQueue

void ___GEORequestResponseLogQueue_block_invoke()
{
  uint64_t v0 = geo_dispatch_queue_create_with_workloop_qos();
  v1 = (void *)qword_1EB29F960;
  qword_1EB29F960 = v0;
}

@end