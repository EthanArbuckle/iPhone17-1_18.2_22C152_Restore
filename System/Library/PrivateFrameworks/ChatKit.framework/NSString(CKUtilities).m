@interface NSString(CKUtilities)
- (BOOL)__ck_containsOnlyCharactersFromSet:()CKUtilities;
- (BOOL)__ck_shouldUseBigEmoji;
- (id)__ck_stringByRedactingQuotedSubstrings;
- (uint64_t)__ck_rangeOfSequenceOfCharactersFromSet:()CKUtilities options:range:;
@end

@implementation NSString(CKUtilities)

- (BOOL)__ck_shouldUseBigEmoji
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a1];
  BOOL v2 = (unint64_t)(objc_msgSend(v1, "__ck_bigEmojiStyle") - 1) < 3;

  return v2;
}

- (BOOL)__ck_containsOnlyCharactersFromSet:()CKUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  uint64_t v6 = objc_msgSend(a1, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", v4, 0, 0, v5);
  uint64_t v8 = v7;

  return !v6 && v5 == v8;
}

- (uint64_t)__ck_rangeOfSequenceOfCharactersFromSet:()CKUtilities options:range:
{
  id v10 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3010000000;
  v22 = "";
  long long v23 = xmmword_18F81B060;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__NSString_CKUtilities____ck_rangeOfSequenceOfCharactersFromSet_options_range___block_invoke;
  v14[3] = &unk_1E5623FC8;
  v14[4] = a1;
  id v11 = v10;
  v16 = &v19;
  uint64_t v17 = a4;
  id v15 = v11;
  BOOL v18 = (a4 & 4) != 0;
  CKEnumerateSearchRange(a5, a6, (a4 & 4) >> 1, (uint64_t)v14);
  uint64_t v12 = v20[4];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)__ck_stringByRedactingQuotedSubstrings
{
  BOOL v2 = [MEMORY[0x1E4F28E78] string];
  uint64_t v3 = [a1 length];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    char v6 = 0;
    do
    {
      int v7 = [a1 characterAtIndex:v5];
      if (v7 << 24 == 570425344)
      {
        if (v6) {
          goto LABEL_9;
        }
        [v2 appendString:@"\"<redacted>\""];
      }
      else if ((v6 & 1) == 0)
      {
        objc_msgSend(v2, "appendFormat:", @"%c", (char)v7);
LABEL_9:
        char v6 = 0;
        goto LABEL_10;
      }
      char v6 = 1;
LABEL_10:
      ++v5;
    }
    while (v4 != v5);
  }
  uint64_t v8 = (void *)[v2 copy];

  return v8;
}

@end