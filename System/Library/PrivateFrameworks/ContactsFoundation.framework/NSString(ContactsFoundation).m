@interface NSString(ContactsFoundation)
+ (uint64_t)_cn_isBlank:()ContactsFoundation;
- (BOOL)_cn_caseInsensitiveIsEqual:()ContactsFoundation;
- (BOOL)_cn_containsCharacterInSet:()ContactsFoundation;
- (BOOL)_cn_containsSubstring:()ContactsFoundation;
- (BOOL)_cn_containsSubstring:()ContactsFoundation options:;
- (__CFString)_cn_truncateAtLength:()ContactsFoundation addEllipsisIfTrunctated:;
- (id)_cn_SHA256HashStringWithSalt:()ContactsFoundation;
- (id)_cn_flatMap:()ContactsFoundation;
- (id)_cn_nameComponentTokens;
- (id)_cn_nameComponentTokensUsingLocale:()ContactsFoundation inferredNameOrder:;
- (id)_cn_resultWithAllCharacters:()ContactsFoundation;
- (id)_cn_stringByAddingPercentEscapesIfNecessary;
- (id)_cn_stringByAddingPercentEscapesToEntireURL;
- (id)_cn_stringByDeletingCharactersInSet:()ContactsFoundation;
- (id)_cn_stringByDeletingNumberOfPathComponents:()ContactsFoundation;
- (id)_cn_stringByNormalizingCase;
- (id)_cn_tokens;
- (id)_cn_trimmedString;
- (uint64_t)_cn_hasPrefix:()ContactsFoundation;
- (uint64_t)_cn_hasPrefix:()ContactsFoundation options:;
- (uint64_t)_cn_hasSuffix:()ContactsFoundation;
- (uint64_t)_cn_hasSuffix:()ContactsFoundation options:;
- (uint64_t)_cn_isBlank;
- (uint64_t)_cn_rangeFromIndex:()ContactsFoundation;
- (uint64_t)_cn_rangeOfAnchoredCharacters:()ContactsFoundation options:;
- (uint64_t)_cn_rangeOfCommonPrefixWithString:()ContactsFoundation;
- (uint64_t)_cn_rangeOfCommonPrefixWithString:()ContactsFoundation options:;
- (uint64_t)_cn_skip:()ContactsFoundation;
- (uint64_t)_cn_skipLast:()ContactsFoundation;
- (uint64_t)_cn_take:()ContactsFoundation;
- (uint64_t)_cn_takeLast:()ContactsFoundation;
- (void)_cn_eachCharacter:()ContactsFoundation;
@end

@implementation NSString(ContactsFoundation)

- (id)_cn_trimmedString
{
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (BOOL)_cn_containsCharacterInSet:()ContactsFoundation
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_resultWithAllCharacters:()ContactsFoundation
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(__CFString *)a1 length];
  if (!a1 || (unint64_t v6 = v5, ![(__CFString *)a1 length]))
  {
LABEL_9:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_10;
  }
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (!CharactersPtr)
  {
    if (v6 <= 0xFE)
    {
      MEMORY[0x1F4188790]();
      v9 = (char *)v14 - ((v8 + 17) & 0xFFFFFFFFFFFFFFF0);
      -[__CFString getCharacters:range:](a1, "getCharacters:range:", v9, 0, v6);
      *(_WORD *)&v9[2 * v6] = 0;
      v10 = (*((void (**)(id, char *, unint64_t))v4 + 2))(v4, v9, v6);
      goto LABEL_11;
    }
    v11 = malloc_type_malloc(2 * v6 + 2, 0x1000040BDFB0063uLL);
    if (v11)
    {
      v12 = v11;
      -[__CFString getCharacters:range:](a1, "getCharacters:range:", v11, 0, v6);
      v12[v6] = 0;
      v10 = (*((void (**)(id, _WORD *, unint64_t))v4 + 2))(v4, v12, v6);
      free(v12);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  (*((void (**)(id, const UniChar *, unint64_t))v4 + 2))(v4, CharactersPtr, v6);
  v10 = LABEL_10:;
LABEL_11:

  return v10;
}

- (BOOL)_cn_containsSubstring:()ContactsFoundation
{
  return objc_msgSend(a1, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_cn_take:()ContactsFoundation
{
  uint64_t v5 = objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 0);

  return objc_msgSend(a1, "substringWithRange:", v5, v4);
}

- (uint64_t)_cn_rangeOfAnchoredCharacters:()ContactsFoundation options:
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke;
  aBlock[3] = &unk_1E56A27A8;
  aBlock[4] = a1;
  aBlock[5] = a4;
  v7 = (uint64_t (**)(void))_Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__NSString_ContactsFoundation___cn_rangeOfAnchoredCharacters_options___block_invoke_2;
  v15[3] = &__block_descriptor_40_e20_Q24__0__NSRange_QQ_8l;
  v15[4] = a4;
  uint64_t v8 = (uint64_t (**)(void *, uint64_t, unint64_t))_Block_copy(v15);
  uint64_t location = v7[2](v7);
  for (unint64_t i = v10; a3; --a3)
  {
    if (i >= [a1 length]) {
      break;
    }
    v18.uint64_t location = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v8[2](v8, location, i));
    v18.length = v12;
    v17.uint64_t location = location;
    v17.length = i;
    NSRange v13 = NSUnionRange(v17, v18);
    uint64_t location = v13.location;
    unint64_t i = v13.length;
  }

  return location;
}

+ (uint64_t)_cn_isBlank:()ContactsFoundation
{
  if (a3) {
    return objc_msgSend(a3, "_cn_isBlank");
  }
  else {
    return 1;
  }
}

- (uint64_t)_cn_isBlank
{
  return [a1 isEqualToString:&stru_1EE0267A8];
}

- (BOOL)_cn_caseInsensitiveIsEqual:()ContactsFoundation
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

- (uint64_t)_cn_hasPrefix:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_hasPrefix:options:", a3, 385);
}

- (uint64_t)_cn_hasPrefix:()ContactsFoundation options:
{
  if (a3) {
    return objc_msgSend(a1, "_cn_containsSubstring:options:", a3, a4 | 8);
  }
  else {
    return 0;
  }
}

- (uint64_t)_cn_hasSuffix:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_hasSuffix:options:", a3, 385);
}

- (uint64_t)_cn_hasSuffix:()ContactsFoundation options:
{
  if (a3) {
    return objc_msgSend(a1, "_cn_containsSubstring:options:", a3, a4 | 0xC);
  }
  else {
    return 0;
  }
}

- (id)_cn_stringByDeletingCharactersInSet:()ContactsFoundation
{
  id v4 = a3;
  if (objc_msgSend(a1, "_cn_containsCharacterInSet:", v4))
  {
    uint64_t v5 = (void *)[a1 mutableCopy];
    objc_msgSend(v5, "_cn_deleteCharactersInSet:", v4);
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (BOOL)_cn_containsSubstring:()ContactsFoundation options:
{
  return objc_msgSend(a1, "rangeOfString:options:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_cn_rangeOfCommonPrefixWithString:()ContactsFoundation
{
  return objc_msgSend(a1, "_cn_rangeOfCommonPrefixWithString:options:", a3, 0);
}

- (uint64_t)_cn_rangeOfCommonPrefixWithString:()ContactsFoundation options:
{
  id v6 = a3;
  uint64_t v16 = 0;
  NSRange v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v7 = [a1 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__NSString_ContactsFoundation___cn_rangeOfCommonPrefixWithString_options___block_invoke;
  v11[3] = &unk_1E56A2780;
  id v8 = v6;
  id v12 = v8;
  NSRange v13 = a1;
  v14 = &v16;
  uint64_t v15 = a4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, v11);
  if (v17[3]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)_cn_stringByAddingPercentEscapesIfNecessary
{
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:a1];

  if (v2)
  {
    id v3 = a1;
  }
  else
  {
    id v4 = [a1 stringByRemovingPercentEncoding];
    if (!v4) {
      id v4 = a1;
    }
    objc_msgSend(v4, "_cn_stringByAddingPercentEscapesToEntireURL");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_cn_stringByAddingPercentEscapesToEntireURL
{
  v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = [a1 dataUsingEncoding:4];
  id v3 = [v1 URLWithDataRepresentation:v2 relativeToURL:0];

  id v4 = [v3 absoluteString];

  return v4;
}

- (id)_cn_stringByDeletingNumberOfPathComponents:()ContactsFoundation
{
  id v4 = a1;
  uint64_t v5 = v4;
  if (a3)
  {
    do
    {
      id v6 = [v5 stringByDeletingLastPathComponent];

      uint64_t v5 = v6;
      --a3;
    }
    while (a3);
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)_cn_stringByNormalizingCase
{
  v1 = (void *)[MEMORY[0x1E4F28F60] newStringFrom:a1 usingUnicodeTransforms:3];

  return v1;
}

- (id)_cn_tokens
{
  return +[CNStringTokenizer tokenizeString:a1];
}

- (id)_cn_nameComponentTokens
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = objc_msgSend(a1, "_cn_nameComponentTokensUsingLocale:inferredNameOrder:", v2, 0);

  return v3;
}

- (id)_cn_nameComponentTokensUsingLocale:()ContactsFoundation inferredNameOrder:
{
  uint64_t v8 = 0;
  uint64_t v5 = +[CNNameStringTokenizer tokenizeNameString:a1 usingLocale:a3 inferredNameOrder:&v8];
  if (a4)
  {
    if (v8 == -1) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = v8 == 1;
    }
    *a4 = v6;
  }

  return v5;
}

- (id)_cn_SHA256HashStringWithSalt:()ContactsFoundation
{
  id v4 = a3;
  uint64_t v5 = [a1 dataUsingEncoding:4];
  uint64_t v6 = objc_msgSend(v5, "_cn_SHA256HashDataWithSalt:", v4);

  uint64_t v7 = (void *)[[NSString alloc] initWithData:v6 encoding:1];

  return v7;
}

- (uint64_t)_cn_rangeFromIndex:()ContactsFoundation
{
  unint64_t v3 = a3;
  if ([a1 length] < a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  [a1 length];
  return v3;
}

- (void)_cn_eachCharacter:()ContactsFoundation
{
  uint64_t v5 = a3;
  if ([a1 length])
  {
    unint64_t v4 = 0;
    do
      v5[2](v5, [a1 characterAtIndex:v4++]);
    while (v4 < [a1 length]);
  }
}

- (uint64_t)_cn_skip:()ContactsFoundation
{
  objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 0);

  return [a1 substringFromIndex:v4];
}

- (uint64_t)_cn_skipLast:()ContactsFoundation
{
  uint64_t v4 = objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 4);

  return [a1 substringToIndex:v4];
}

- (uint64_t)_cn_takeLast:()ContactsFoundation
{
  uint64_t v5 = objc_msgSend(a1, "_cn_rangeOfAnchoredCharacters:options:", a3, 4);

  return objc_msgSend(a1, "substringWithRange:", v5, v4);
}

- (__CFString)_cn_truncateAtLength:()ContactsFoundation addEllipsisIfTrunctated:
{
  if (a3)
  {
    if ([a1 length] <= a3)
    {
      v11 = a1;
    }
    else
    {
      uint64_t v7 = [a1 rangeOfComposedCharacterSequenceAtIndex:a3 - 1];
      if (v7 + v8 <= a3) {
        unint64_t v9 = a3;
      }
      else {
        unint64_t v9 = v7;
      }
      unint64_t v10 = [a1 substringToIndex:v9];
      v11 = v10;
      if (a4)
      {
        uint64_t v12 = [(__CFString *)v10 stringByAppendingString:@"…"];

        v11 = (__CFString *)v12;
      }
    }
  }
  else
  {
    v11 = &stru_1EE0267A8;
  }

  return v11;
}

- (id)_cn_flatMap:()ContactsFoundation
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = [a1 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NSString_ContactsFoundation___cn_flatMap___block_invoke;
  v12[3] = &unk_1E56A27F8;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 2, v12);
  unint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

@end