@interface LSDatabaseDisposeStringArray
@end

@implementation LSDatabaseDisposeStringArray

uint64_t ___LSDatabaseDisposeStringArray_block_invoke()
{
  return _CSStringRelease();
}

@end