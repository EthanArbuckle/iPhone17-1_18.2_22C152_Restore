@interface MADTextEmbeddingThresholdMD4
+ (float)thresholdBase;
+ (id)modelName;
+ (unint64_t)embeddingLength;
+ (unint64_t)embeddingVersion;
@end

@implementation MADTextEmbeddingThresholdMD4

+ (id)modelName
{
  return @"text_threshold_md4.espresso.net";
}

+ (unint64_t)embeddingVersion
{
  return 4;
}

+ (unint64_t)embeddingLength
{
  return 512;
}

+ (float)thresholdBase
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MADTextEmbeddingThresholdMD4_thresholdBase__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MADTextEmbeddingThresholdMD4 thresholdBase]::once != -1) {
    dispatch_once(&+[MADTextEmbeddingThresholdMD4 thresholdBase]::once, block);
  }
  return *(float *)&+[MADTextEmbeddingThresholdMD4 thresholdBase]::thresholdBase;
}

uint64_t __45__MADTextEmbeddingThresholdMD4_thresholdBase__block_invoke()
{
  v0 = objc_opt_class();
  LODWORD(v1) = 1053609165;
  uint64_t result = [v0 computeThresholdBase:v1];
  +[MADTextEmbeddingThresholdMD4 thresholdBase]::thresholdBase = v3;
  return result;
}

@end