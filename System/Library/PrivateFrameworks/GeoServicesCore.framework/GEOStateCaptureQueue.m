@interface GEOStateCaptureQueue
@end

@implementation GEOStateCaptureQueue

uint64_t ___GEOStateCaptureQueue_block_invoke()
{
  qword_1EB30C658 = (uint64_t)geo_dispatch_queue_create_with_target("com.apple.GeoServices.StateCapture", 0);
  return MEMORY[0x1F41817F8]();
}

@end