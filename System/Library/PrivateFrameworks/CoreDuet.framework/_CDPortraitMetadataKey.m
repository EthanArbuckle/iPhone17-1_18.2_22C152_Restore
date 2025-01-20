@interface _CDPortraitMetadataKey
+ (id)algorithm;
+ (id)assetVersion;
+ (id)compatibilityVersion;
+ (id)decayRate;
+ (id)osBuild;
+ (id)score;
+ (id)sentimentScore;
@end

@implementation _CDPortraitMetadataKey

+ (id)algorithm
{
  return @"_CDPortraitMetadataKey-algorithm";
}

+ (id)decayRate
{
  return @"_CDPortraitMetadataKey-decayRate";
}

+ (id)score
{
  return @"_CDPortraitMetadataKey-score";
}

+ (id)sentimentScore
{
  return @"_CDPortraitMetadataKey-sentimentScore";
}

+ (id)osBuild
{
  return @"_CDPortraitMetadataKey-osBuild";
}

+ (id)assetVersion
{
  return @"_CDPortraitMetadataKey-assetVersion";
}

+ (id)compatibilityVersion
{
  return @"_CDPortraitMetadataKey-compatibilityVersion";
}

@end