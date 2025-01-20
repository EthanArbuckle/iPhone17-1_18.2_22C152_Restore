@interface DTXBlockCompressorFactory
+ (id)createBlockCompressor;
@end

@implementation DTXBlockCompressorFactory

+ (id)createBlockCompressor
{
  return (id)objc_opt_new();
}

@end