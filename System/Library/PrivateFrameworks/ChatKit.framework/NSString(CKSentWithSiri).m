@interface NSString(CKSentWithSiri)
- (uint64_t)ck_isSiriRecognizableWithLanguageCode:()CKSentWithSiri;
@end

@implementation NSString(CKSentWithSiri)

- (uint64_t)ck_isSiriRecognizableWithLanguageCode:()CKSentWithSiri
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA20], "canonicalLocaleIdentifierFromString:");
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v2];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  if (v3)
  {
    v5 = [v3 exemplarCharacterSet];
    [v4 formUnionWithCharacterSet:v5];
  }
  v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [v4 formUnionWithCharacterSet:v6];

  v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:a1];
  uint64_t v8 = [v4 isSupersetOfSet:v7];

  return v8;
}

@end