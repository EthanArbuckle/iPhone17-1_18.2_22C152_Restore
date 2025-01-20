@interface PAMediaConversionServiceImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)standardPolicy;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  return a3;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)standardPolicy
{
  v4 = objc_opt_class();
  if (([v4 isEqual:objc_opt_class()] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 33, @"Subclasses must override %@", v8 object file lineNumber description];
  }
  if (standardPolicy_onceToken != -1) {
    dispatch_once(&standardPolicy_onceToken, &__block_literal_global_432);
  }
  v5 = (void *)standardPolicy_standardPolicy;
  return v5;
}

uint64_t __61__PAMediaConversionServiceImageMetadataPolicy_standardPolicy__block_invoke()
{
  standardPolicy_standardPolicy = objc_alloc_init(PAMediaConversionServiceImageMetadataPolicy);
  return MEMORY[0x1F41817F8]();
}

@end