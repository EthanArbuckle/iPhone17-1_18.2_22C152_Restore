@interface MADTextEmbeddingSafetyMD5
+ (float)threshold;
+ (id)modelName;
+ (unint64_t)embeddingLength;
+ (unint64_t)embeddingVersion;
@end

@implementation MADTextEmbeddingSafetyMD5

+ (id)modelName
{
  return @"text_safety_md5.espresso.net";
}

+ (unint64_t)embeddingVersion
{
  return 5;
}

+ (unint64_t)embeddingLength
{
  return 512;
}

+ (float)threshold
{
  return 0.66434;
}

@end