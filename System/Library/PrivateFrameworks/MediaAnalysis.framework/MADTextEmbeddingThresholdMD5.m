@interface MADTextEmbeddingThresholdMD5
+ (float)thresholdBase;
+ (id)modelName;
+ (unint64_t)embeddingLength;
+ (unint64_t)embeddingVersion;
@end

@implementation MADTextEmbeddingThresholdMD5

+ (id)modelName
{
  if (_os_feature_enabled_impl()) {
    v2 = @"text_threshold_md5_v2.espresso.net";
  }
  else {
    v2 = @"text_threshold_md5.espresso.net";
  }
  return v2;
}

+ (unint64_t)embeddingVersion
{
  return 5;
}

+ (unint64_t)embeddingLength
{
  return 512;
}

+ (float)thresholdBase
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MADTextEmbeddingThresholdMD5_thresholdBase__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MADTextEmbeddingThresholdMD5 thresholdBase]::once != -1) {
    dispatch_once(&+[MADTextEmbeddingThresholdMD5 thresholdBase]::once, block);
  }
  return *(float *)&+[MADTextEmbeddingThresholdMD5 thresholdBase]::thresholdBase;
}

uint64_t __45__MADTextEmbeddingThresholdMD5_thresholdBase__block_invoke()
{
  if (_os_feature_enabled_impl()) {
    float v0 = 0.41;
  }
  else {
    float v0 = 0.39;
  }
  v1 = objc_opt_class();
  *(float *)&double v2 = v0;
  uint64_t result = [v1 computeThresholdBase:v2];
  +[MADTextEmbeddingThresholdMD5 thresholdBase]::thresholdBase = v4;
  return result;
}

@end