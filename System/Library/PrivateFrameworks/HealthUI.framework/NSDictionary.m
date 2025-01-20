@interface NSDictionary
@end

@implementation NSDictionary

void __48__NSDictionary_HKCodingSupport__codableMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = objc_alloc_init(HKCodableMetadataKeyValuePair);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [(HKCodableMetadataKeyValuePair *)v6 setKey:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[HKCodableMetadataKeyValuePair setNumberIntValue:](v6, "setNumberIntValue:", [v5 longLongValue]);
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
LABEL_8:
    [*(id *)(a1 + 32) addKeyValuePairs:v6];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HKCodableMetadataKeyValuePair *)v6 setStringValue:v5];
    if (isKindOfClass) {
      goto LABEL_8;
    }
  }
LABEL_9:
}

@end