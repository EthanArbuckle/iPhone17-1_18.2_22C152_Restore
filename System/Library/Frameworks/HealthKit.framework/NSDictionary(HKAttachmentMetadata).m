@interface NSDictionary(HKAttachmentMetadata)
+ (id)hk_acceptedAttachmentMetadataValueClasses;
+ (id)hk_secureAttachmentCodingClasses;
- (BOOL)hk_validateAttachmentMetadataKeysAndValuesWithError:()HKAttachmentMetadata;
@end

@implementation NSDictionary(HKAttachmentMetadata)

- (BOOL)hk_validateAttachmentMetadataKeysAndValuesWithError:()HKAttachmentMetadata
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__54;
  v12 = __Block_byref_object_dispose__54;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__NSDictionary_HKAttachmentMetadata__hk_validateAttachmentMetadataKeysAndValuesWithError___block_invoke;
  v7[3] = &unk_1E58C8520;
  v7[4] = a1;
  v7[5] = &v8;
  v7[6] = a2;
  [a1 enumerateKeysAndObjectsUsingBlock:v7];
  id v4 = (id)v9[5];
  v5 = v4;
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError(v4);
    }
  }

  _Block_object_dispose(&v8, 8);
  return v5 == 0;
}

+ (id)hk_acceptedAttachmentMetadataValueClasses
{
  if (hk_acceptedAttachmentMetadataValueClasses_onceToken != -1) {
    dispatch_once(&hk_acceptedAttachmentMetadataValueClasses_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)hk_acceptedAttachmentMetadataValueClasses_valueClasses;

  return v0;
}

+ (id)hk_secureAttachmentCodingClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NSDictionary_HKAttachmentMetadata__hk_secureAttachmentCodingClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hk_secureAttachmentCodingClasses_onceToken != -1) {
    dispatch_once(&hk_secureAttachmentCodingClasses_onceToken, block);
  }
  v1 = (void *)hk_secureAttachmentCodingClasses__secureCodingClasses;

  return v1;
}

@end