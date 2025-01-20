@interface NSIPItemQueue
@end

@implementation NSIPItemQueue

dispatch_queue_t ___NSIPItemQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.Foundation.NSItemProvider-item-queue", 0);
  _MergedGlobals_1 = (uint64_t)result;
  return result;
}

@end