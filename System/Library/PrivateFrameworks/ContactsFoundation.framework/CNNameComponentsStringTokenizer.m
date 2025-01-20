@interface CNNameComponentsStringTokenizer
+ (BOOL)isNamePrefix:(id)a3;
+ (BOOL)isNameSuffix:(id)a3;
+ (BOOL)isNobiliaryParticle:(id)a3;
+ (id)componentsFromString:(id)a3;
+ (id)nameComponentElements;
+ (id)namePrefixElements;
+ (id)nameSuffixElements;
+ (id)nobiliaryParticleElements;
+ (id)tokensByAdjustingForNobiliaryParticles:(id)a3;
+ (id)tokensFromString:(id)a3 nameOrder:(int64_t *)a4;
+ (id)uncachedNameComponentElements;
+ (id)whitespaceTokens:(id)a3;
- (CNNameComponentsStringTokenizer)initWithString:(id)a3;
- (NSArray)tokens;
- (NSPersonNameComponents)components;
- (NSString)string;
- (id)parseComponents;
- (void)adjustTokensForNobiliaryParticles;
- (void)extractGivenMiddleFamilyNamesFromWhatsLeftUsingOrder:(int64_t)a3;
- (void)extractNamePrefixFromBeginning;
- (void)extractNameSuffixFromEnd;
- (void)extractNicknameFromQuotedContent;
- (void)removeParentheticalContent;
- (void)setComponents:(id)a3;
- (void)setString:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation CNNameComponentsStringTokenizer

+ (id)componentsFromString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  v6 = [v5 parseComponents];

  return v6;
}

- (CNNameComponentsStringTokenizer)initWithString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (CNGuardOSLog_cn_once_token_0_6 != -1) {
        dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_98);
      }
      v5 = (void *)CNGuardOSLog_cn_once_object_0_6;
      if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT)) {
        -[CNNameComponentsStringTokenizer initWithString:](v5);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CNNameComponentsStringTokenizer;
  v6 = [(CNNameComponentsStringTokenizer *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    string = v6->_string;
    v6->_string = (NSString *)v7;

    v9 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x1E4F28F30]);
    components = v6->_components;
    v6->_components = v9;

    v11 = v6;
  }

  return v6;
}

- (id)parseComponents
{
  [(CNNameComponentsStringTokenizer *)self removeParentheticalContent];
  [(CNNameComponentsStringTokenizer *)self extractNicknameFromQuotedContent];
  uint64_t v8 = 0;
  v3 = objc_opt_class();
  id v4 = [(CNNameComponentsStringTokenizer *)self string];
  v5 = [v3 tokensFromString:v4 nameOrder:&v8];
  [(CNNameComponentsStringTokenizer *)self setTokens:v5];

  [(CNNameComponentsStringTokenizer *)self extractNameSuffixFromEnd];
  [(CNNameComponentsStringTokenizer *)self extractNamePrefixFromBeginning];
  [(CNNameComponentsStringTokenizer *)self adjustTokensForNobiliaryParticles];
  [(CNNameComponentsStringTokenizer *)self extractGivenMiddleFamilyNamesFromWhatsLeftUsingOrder:v8];
  v6 = [(CNNameComponentsStringTokenizer *)self components];

  return v6;
}

- (void)removeParentheticalContent
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  id v4 = [(CNNameComponentsStringTokenizer *)self string];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CNNameComponentsStringTokenizer_removeParentheticalContent__block_invoke;
  v6[3] = &unk_1E56A1EA8;
  uint64_t v8 = v11;
  v9 = v10;
  id v5 = v3;
  id v7 = v5;
  objc_msgSend(v4, "_cn_eachCharacter:", v6);

  [(CNNameComponentsStringTokenizer *)self setString:v5];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
}

uint64_t __61__CNNameComponentsStringTokenizer_removeParentheticalContent__block_invoke(uint64_t result, uint64_t a2)
{
  if ((int)a2 <= 90)
  {
    if (a2 != 40)
    {
      if (a2 == 41)
      {
        uint64_t v2 = *(void *)(result + 40);
LABEL_8:
        uint64_t v3 = *(void *)(v2 + 8);
        uint64_t v4 = *(void *)(v3 + 24);
        if (!v4) {
          return result;
        }
        uint64_t v5 = v4 - 1;
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    uint64_t v6 = *(void *)(result + 40);
LABEL_12:
    uint64_t v3 = *(void *)(v6 + 8);
    uint64_t v5 = *(void *)(v3 + 24) + 1;
LABEL_13:
    *(void *)(v3 + 24) = v5;
    return result;
  }
  if (a2 == 91)
  {
    uint64_t v6 = *(void *)(result + 48);
    goto LABEL_12;
  }
  if (a2 == 93)
  {
    uint64_t v2 = *(void *)(result + 48);
    goto LABEL_8;
  }
LABEL_15:
  if (!*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24)
    && !*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", @"%C", a2);
  }
  return result;
}

- (void)extractNicknameFromQuotedContent
{
  id v25 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\"'“”‘’«»"];
  uint64_t v3 = [(CNNameComponentsStringTokenizer *)self string];
  uint64_t v4 = [v3 rangeOfCharacterFromSet:v25];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  if (!v4
    || v4 != 0x7FFFFFFFFFFFFFFFLL
    && ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v5 - 1)),
        v8,
        v9))
  {
    uint64_t v10 = v5 + v7;
    uint64_t v11 = objc_msgSend(v3, "_cn_rangeFromIndex:", v10);
    uint64_t v13 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v25, 0, v11, v12);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = v13;
      uint64_t v16 = v13 + v14;
      if (v13 + v14 == [v3 length]
        || ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
            v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = objc_msgSend(v17, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v16)),
            v17,
            v18))
      {
        uint64_t v19 = objc_msgSend(v3, "_cn_rangeFromIndex:", v16);
        if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v25, 0, v19, v20) == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v21 = v15 - v10;
          v22 = objc_msgSend(v3, "substringWithRange:", v10, v21);
          v23 = (void *)[v3 mutableCopy];
          objc_msgSend(v23, "deleteCharactersInRange:", v10 - 1, v21 + 2);
          v24 = [(CNNameComponentsStringTokenizer *)self components];
          [v24 setNickname:v22];

          [(CNNameComponentsStringTokenizer *)self setString:v23];
        }
      }
    }
  }
}

+ (id)tokensFromString:(id)a3 nameOrder:(int64_t *)a4
{
  id v6 = a3;
  if (CNStringContainsChineseJapaneseKoreanCharacters(v6))
  {
    uint64_t v7 = objc_msgSend(v6, "_cn_nameComponentTokensUsingLocale:inferredNameOrder:", 0, a4);
    goto LABEL_15;
  }
  uint64_t v8 = [v6 componentsSeparatedByString:@","];
  if ([v8 count] != 1)
  {
    int v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [v8 lastObject];
    uint64_t v11 = [a1 whitespaceTokens:v10];
    int v12 = objc_msgSend(v11, "_cn_all:", &__block_literal_global_32);

    if (v12)
    {
      uint64_t v13 = [v8 lastObject];
      uint64_t v14 = [a1 whitespaceTokens:v13];
      [v9 addObjectsFromArray:v14];

      uint64_t v15 = objc_msgSend(v8, "_cn_skipLast:", 1);

      uint64_t v8 = (void *)v15;
    }
    if ([v8 count] == 1)
    {
      uint64_t v16 = [v8 firstObject];
    }
    else
    {
      if ([v8 count] != 2)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __62__CNNameComponentsStringTokenizer_tokensFromString_nameOrder___block_invoke;
        v24[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
        v24[4] = a1;
        uint64_t v20 = objc_msgSend(v8, "_cn_flatMap:", v24);
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v20, "count"));
        [v9 insertObjects:v20 atIndexes:v21];

        goto LABEL_13;
      }
      v17 = [v8 objectAtIndex:0];
      [v9 insertObject:v17 atIndex:0];

      uint64_t v16 = [v8 objectAtIndex:1];
    }
    int v18 = (void *)v16;
    uint64_t v19 = [a1 whitespaceTokens:v16];
    [v9 insertObject:v19 atIndex:0];

LABEL_13:
    v22 = objc_msgSend(v9, "_cn_flatten");
    uint64_t v7 = objc_msgSend(v22, "_cn_map:", &__block_literal_global_70);

    goto LABEL_14;
  }
  uint64_t v7 = [a1 whitespaceTokens:v6];
LABEL_14:

LABEL_15:

  return v7;
}

uint64_t __62__CNNameComponentsStringTokenizer_tokensFromString_nameOrder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) whitespaceTokens:a2];
}

uint64_t __62__CNNameComponentsStringTokenizer_tokensFromString_nameOrder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_trimmedString");
}

- (void)extractNameSuffixFromEnd
{
  uint64_t v3 = [(CNNameComponentsStringTokenizer *)self tokens];
  unint64_t v4 = [v3 count];

  if (v4 >= 3)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(CNNameComponentsStringTokenizer *)self tokens];
    uint64_t v7 = [v6 lastObject];
    LODWORD(v5) = [v5 isNameSuffix:v7];

    if (v5)
    {
      uint64_t v8 = [(CNNameComponentsStringTokenizer *)self tokens];
      int v9 = [v8 lastObject];
      uint64_t v10 = [(CNNameComponentsStringTokenizer *)self components];
      [v10 setNameSuffix:v9];

      id v12 = [(CNNameComponentsStringTokenizer *)self tokens];
      uint64_t v11 = objc_msgSend(v12, "_cn_skipLast:", 1);
      [(CNNameComponentsStringTokenizer *)self setTokens:v11];
    }
  }
}

- (void)extractNamePrefixFromBeginning
{
  uint64_t v3 = [(CNNameComponentsStringTokenizer *)self tokens];
  unint64_t v4 = [v3 count];

  if (v4 >= 3)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [(CNNameComponentsStringTokenizer *)self tokens];
    uint64_t v7 = [v6 firstObject];
    LODWORD(v5) = [v5 isNamePrefix:v7];

    if (v5)
    {
      uint64_t v8 = [(CNNameComponentsStringTokenizer *)self tokens];
      int v9 = [v8 firstObject];
      uint64_t v10 = [(CNNameComponentsStringTokenizer *)self components];
      [v10 setNamePrefix:v9];

      id v12 = [(CNNameComponentsStringTokenizer *)self tokens];
      uint64_t v11 = objc_msgSend(v12, "_cn_skip:", 1);
      [(CNNameComponentsStringTokenizer *)self setTokens:v11];
    }
  }
}

- (void)adjustTokensForNobiliaryParticles
{
  uint64_t v3 = [(CNNameComponentsStringTokenizer *)self tokens];
  unint64_t v4 = [v3 count];

  if (v4 >= 3)
  {
    uint64_t v5 = [(CNNameComponentsStringTokenizer *)self tokens];
    int v6 = objc_msgSend(v5, "_cn_any:", &__block_literal_global_35);

    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      id v9 = [(CNNameComponentsStringTokenizer *)self tokens];
      uint64_t v8 = [v7 tokensByAdjustingForNobiliaryParticles:v9];
      [(CNNameComponentsStringTokenizer *)self setTokens:v8];
    }
  }
}

+ (id)tokensByAdjustingForNobiliaryParticles:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  int v6 = [v4 array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CNNameComponentsStringTokenizer_tokensByAdjustingForNobiliaryParticles___block_invoke;
  v9[3] = &unk_1E56A1EF0;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  objc_msgSend(v5, "_cn_each_reverse:", v9);

  return v7;
}

void __74__CNNameComponentsStringTokenizer_tokensByAdjustingForNobiliaryParticles___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 40), "isNobiliaryParticle:") && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    uint64_t v3 = NSString;
    unint64_t v4 = [*(id *)(a1 + 32) firstObject];
    id v5 = [v3 stringWithFormat:@"%@ %@", v6, v4];

    [*(id *)(a1 + 32) replaceObjectAtIndex:0 withObject:v5];
  }
  else
  {
    [*(id *)(a1 + 32) insertObject:v6 atIndex:0];
  }
}

+ (id)whitespaceTokens:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  id v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_41);

  return v7;
}

- (void)extractGivenMiddleFamilyNamesFromWhatsLeftUsingOrder:(int64_t)a3
{
  id v5 = [(CNNameComponentsStringTokenizer *)self tokens];
  uint64_t v6 = [v5 count];

  if (v6 == 3)
  {
    uint64_t v8 = [(CNNameComponentsStringTokenizer *)self tokens];
    id v9 = [v8 objectAtIndex:0];
    id v10 = [(CNNameComponentsStringTokenizer *)self components];
    id v11 = v10;
    if (a3 == -1)
    {
      [v10 setFamilyName:v9];

      v22 = [(CNNameComponentsStringTokenizer *)self tokens];
      v23 = [v22 objectAtIndex:1];
      v24 = [(CNNameComponentsStringTokenizer *)self components];
      [v24 setGivenName:v23];

      id v25 = [(CNNameComponentsStringTokenizer *)self tokens];
      id v7 = [v25 objectAtIndex:2];
      uint64_t v21 = [(CNNameComponentsStringTokenizer *)self components];
      [v21 setMiddleName:v7];
      goto LABEL_13;
    }
    [v10 setGivenName:v9];

    id v12 = [(CNNameComponentsStringTokenizer *)self tokens];
    uint64_t v13 = [v12 objectAtIndex:1];
    uint64_t v14 = [(CNNameComponentsStringTokenizer *)self components];
    [v14 setMiddleName:v13];

    uint64_t v15 = [(CNNameComponentsStringTokenizer *)self tokens];
    id v25 = v15;
    uint64_t v16 = 2;
LABEL_9:
    id v7 = [v15 objectAtIndex:v16];
    uint64_t v21 = [(CNNameComponentsStringTokenizer *)self components];
    [v21 setFamilyName:v7];
LABEL_13:

    goto LABEL_14;
  }
  if (v6 == 2)
  {
    v17 = [(CNNameComponentsStringTokenizer *)self tokens];
    int v18 = [v17 objectAtIndex:0];
    uint64_t v19 = [(CNNameComponentsStringTokenizer *)self components];
    uint64_t v20 = v19;
    if (a3 == -1)
    {
      [v19 setFamilyName:v18];

      id v25 = [(CNNameComponentsStringTokenizer *)self tokens];
      id v7 = [v25 objectAtIndex:1];
      uint64_t v21 = [(CNNameComponentsStringTokenizer *)self components];
      [v21 setGivenName:v7];
      goto LABEL_13;
    }
    [v19 setGivenName:v18];

    uint64_t v15 = [(CNNameComponentsStringTokenizer *)self tokens];
    id v25 = v15;
    uint64_t v16 = 1;
    goto LABEL_9;
  }
  if (v6 != 1) {
    return;
  }
  id v25 = [(CNNameComponentsStringTokenizer *)self string];
  id v7 = [(CNNameComponentsStringTokenizer *)self components];
  [v7 setGivenName:v25];
LABEL_14:
}

+ (BOOL)isNamePrefix:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CNNameComponentsStringTokenizer_isNamePrefix___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = isNamePrefix__cn_once_token_2;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isNamePrefix__cn_once_token_2, block);
  }
  id v5 = (id)isNamePrefix__cn_once_object_2;
  uint64_t v6 = sNormalizeElements_block_invoke_3((uint64_t)v5, v4);

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __48__CNNameComponentsStringTokenizer_isNamePrefix___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [*(id *)(a1 + 32) namePrefixElements];
  uint64_t v2 = [v1 setWithArray:v5];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)isNamePrefix__cn_once_object_2;
  isNamePrefix__cn_once_object_2 = v3;
}

+ (id)namePrefixElements
{
  uint64_t v2 = [a1 nameComponentElements];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"prefixes"];
  id v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_38_0);

  return v4;
}

+ (BOOL)isNameSuffix:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CNNameComponentsStringTokenizer_isNameSuffix___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = isNameSuffix__cn_once_token_3;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isNameSuffix__cn_once_token_3, block);
  }
  id v5 = (id)isNameSuffix__cn_once_object_3;
  uint64_t v6 = sNormalizeElements_block_invoke_3((uint64_t)v5, v4);

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __48__CNNameComponentsStringTokenizer_isNameSuffix___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [*(id *)(a1 + 32) nameSuffixElements];
  uint64_t v2 = [v1 setWithArray:v5];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)isNameSuffix__cn_once_object_3;
  isNameSuffix__cn_once_object_3 = v3;
}

+ (id)nameSuffixElements
{
  uint64_t v2 = [a1 nameComponentElements];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"suffixes"];
  id v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_38_0);

  return v4;
}

+ (BOOL)isNobiliaryParticle:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CNNameComponentsStringTokenizer_isNobiliaryParticle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = isNobiliaryParticle__cn_once_token_4;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isNobiliaryParticle__cn_once_token_4, block);
  }
  id v5 = (id)isNobiliaryParticle__cn_once_object_4;
  uint64_t v6 = sNormalizeElements_block_invoke_3((uint64_t)v5, v4);

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __55__CNNameComponentsStringTokenizer_isNobiliaryParticle___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [*(id *)(a1 + 32) nobiliaryParticleElements];
  uint64_t v2 = [v1 setWithArray:v5];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)isNobiliaryParticle__cn_once_object_4;
  isNobiliaryParticle__cn_once_object_4 = v3;
}

+ (id)nobiliaryParticleElements
{
  uint64_t v2 = [a1 nameComponentElements];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"nobiliary particles"];
  id v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_38_0);

  return v4;
}

+ (id)nameComponentElements
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CNNameComponentsStringTokenizer_nameComponentElements__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nameComponentElements_cn_once_token_5 != -1) {
    dispatch_once(&nameComponentElements_cn_once_token_5, block);
  }
  uint64_t v2 = (void *)nameComponentElements_cn_once_object_5;

  return v2;
}

void __56__CNNameComponentsStringTokenizer_nameComponentElements__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) uncachedNameComponentElements];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)nameComponentElements_cn_once_object_5;
  nameComponentElements_cn_once_object_5 = v1;
}

+ (id)uncachedNameComponentElements
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  id v3 = [v2 URLForResource:@"NameComponentElements" withExtension:@"plist"];

  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];

  return v4;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
}

- (NSPersonNameComponents)components
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void)setComponents:(id)a3
{
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

- (void)initWithString:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_fault_impl(&dword_19091D000, v1, OS_LOG_TYPE_FAULT, "parameter ‘string’ must be of type %{public}@", (uint8_t *)&v3, 0xCu);
}

@end