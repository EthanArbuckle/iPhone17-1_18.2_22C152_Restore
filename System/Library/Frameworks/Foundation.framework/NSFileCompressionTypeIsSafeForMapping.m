@interface NSFileCompressionTypeIsSafeForMapping
@end

@implementation NSFileCompressionTypeIsSafeForMapping

void *___NSFileCompressionTypeIsSafeForMapping_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/AppleFSCompression.framework/AppleFSCompression", 256);
  if (result)
  {
    result = dlsym(result, "queryCompressionInfo");
    _MergedGlobals_145 = (uint64_t (*)(void, void))result;
  }
  return result;
}

@end