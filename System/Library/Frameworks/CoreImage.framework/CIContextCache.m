@interface CIContextCache
+ (id)peakNonVolatileList;
@end

@implementation CIContextCache

+ (id)peakNonVolatileList
{
  v2 = (void *)CopyPeakNonVolatileList();

  return v2;
}

@end