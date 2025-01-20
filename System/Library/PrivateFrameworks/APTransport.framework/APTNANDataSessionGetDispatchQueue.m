@interface APTNANDataSessionGetDispatchQueue
@end

@implementation APTNANDataSessionGetDispatchQueue

dispatch_queue_t ___APTNANDataSessionGetDispatchQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.airplay.APTNANDataSession", 0);
  _APTNANDataSessionGetDispatchQueue_sAPTNANDataSessionDispatchQueue = (uint64_t)result;
  return result;
}

@end