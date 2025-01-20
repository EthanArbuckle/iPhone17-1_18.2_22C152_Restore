@interface PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy
+ (id)standardPolicy;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F8CC48];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithImageProperties:v5 contentType:0 timeZoneLookup:0];
  v7 = [v6 livePhotoPairingIdentifier];
  v14.receiver = self;
  v14.super_class = (Class)PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy;
  v8 = [(PAMediaConversionServiceDefaultImageMetadataPolicy *)&v14 processMetadata:v5];

  if (v7)
  {
    v9 = (void *)[v8 mutableCopy];
    v10 = (void *)MEMORY[0x1E4F8CC50];
    v11 = [v6 livePhotoPairingIdentifierMetadataKey];
    LODWORD(v10) = [v10 addMakerApplePropertyWithKey:v11 value:v7 toProperties:v9];

    if (v10)
    {
      id v12 = v9;

      v8 = v12;
    }
  }
  return v8;
}

+ (id)standardPolicy
{
  v4 = objc_opt_class();
  if (([v4 isEqual:objc_opt_class()] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 297, @"Subclasses must override %@", v8 object file lineNumber description];
  }
  if (standardPolicy_onceToken_86 != -1) {
    dispatch_once(&standardPolicy_onceToken_86, &__block_literal_global_88);
  }
  id v5 = (void *)standardPolicy_standardPolicy_85;
  return v5;
}

uint64_t __79__PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy_standardPolicy__block_invoke()
{
  standardPolicy_standardPolicy_85 = objc_alloc_init(PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy);
  return MEMORY[0x1F41817F8]();
}

@end