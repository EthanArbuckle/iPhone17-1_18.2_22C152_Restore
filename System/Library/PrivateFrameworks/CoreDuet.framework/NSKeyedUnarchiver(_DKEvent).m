@interface NSKeyedUnarchiver(_DKEvent)
- (uint64_t)dk_shouldSkipDecodingMetadata;
- (void)setDk_shouldSkipDecodingMetadata:()_DKEvent;
@end

@implementation NSKeyedUnarchiver(_DKEvent)

- (void)setDk_shouldSkipDecodingMetadata:()_DKEvent
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_dk_shouldSkipDecodingMetadata, v2, (void *)1);
}

- (uint64_t)dk_shouldSkipDecodingMetadata
{
  v1 = objc_getAssociatedObject(a1, sel_dk_shouldSkipDecodingMetadata);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end