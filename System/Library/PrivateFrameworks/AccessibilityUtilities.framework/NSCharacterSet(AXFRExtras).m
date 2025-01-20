@interface NSCharacterSet(AXFRExtras)
+ (id)whitespaceNewlineAndSpecialCharacterSet;
+ (id)wordBreakCharacterSet;
@end

@implementation NSCharacterSet(AXFRExtras)

+ (id)whitespaceNewlineAndSpecialCharacterSet
{
  if (whitespaceNewlineAndSpecialCharacterSet_CharacterSet)
  {
    id v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  else
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    for (int i = 0; i != 15; ++i)
      objc_msgSend(v1, "appendFormat:", @"%C", (i + 65520));
    v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v4 = (void *)[v3 mutableCopy];

    [v4 addCharactersInString:v1];
    uint64_t v5 = [v4 copy];
    v6 = (void *)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
    whitespaceNewlineAndSpecialCharacterSet_CharacterSet = v5;

    id v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }

  return v0;
}

+ (id)wordBreakCharacterSet
{
  if (wordBreakCharacterSet_CharacterSetIncludesPunctuation)
  {
    id v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  else
  {
    id v1 = [MEMORY[0x1E4F28B88] whitespaceNewlineAndSpecialCharacterSet];
    v2 = (void *)[v1 mutableCopy];

    [v2 addCharactersInString:@"\x05"];
    v3 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [v2 formUnionWithCharacterSet:v3];
    uint64_t v4 = [v2 copy];
    uint64_t v5 = (void *)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
    wordBreakCharacterSet_CharacterSetIncludesPunctuation = v4;

    id v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }

  return v0;
}

@end