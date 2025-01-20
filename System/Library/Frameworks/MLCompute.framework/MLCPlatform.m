@interface MLCPlatform
+ (NSNumber)getRNGseed;
+ (void)setRNGSeedTo:(NSNumber *)seed;
@end

@implementation MLCPlatform

+ (void)setRNGSeedTo:(NSNumber *)seed
{
}

+ (NSNumber)getRNGseed
{
  return (NSNumber *)+[MLCPlatformInfo getRandomSeed];
}

@end