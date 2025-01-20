@interface FPItem(CSSearchableItem)
+ (void)fp_queryFetchAttributes;
- (void)toSearchableItem;
@end

@implementation FPItem(CSSearchableItem)

- (void)toSearchableItem
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Item %@ has formerIdentifier, but itemIdentifier is not an on-disk identifier.", (uint8_t *)&v2, 0xCu);
}

+ (void)fp_queryFetchAttributes
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getMDItemAttributeChangeDate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 63, @"%s", dlerror());

  __break(1u);
}

@end