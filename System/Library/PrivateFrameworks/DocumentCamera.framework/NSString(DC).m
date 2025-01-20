@interface NSString(DC)
- (id)dc_sanitizedFilenameString;
- (id)dc_stringByReplacingCharactersInSet:()DC withString:;
- (id)dc_stringByReplacingCharactersInStringMap:()DC;
- (id)dc_stringByReplacingNewlineCharactersWithWhiteSpace;
- (id)dc_substringToIndex:()DC;
- (id)dc_trimmedString;
- (uint64_t)dc_lengthOfLongestLine;
- (uint64_t)dc_numberOfLines;
- (uint64_t)dc_paragraphRangeForRange:()DC contentEnd:;
- (uint64_t)dc_stringReplacingUnsafeHTMLCharacters;
- (uint64_t)dc_substringFromIndex:()DC;
- (uint64_t)dc_substringWithRange:()DC;
- (uint64_t)dc_whitespaceAndNewlineCoalescedString;
- (void)dc_enumerateContentLineRangesInRange:()DC usingBlock:;
- (void)dc_enumerateParagraphsInRange:()DC usingBlock:;
@end

@implementation NSString(DC)

- (id)dc_trimmedString
{
  v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (uint64_t)dc_whitespaceAndNewlineCoalescedString
{
  if (dc_whitespaceAndNewlineCoalescedString_onceToken != -1) {
    dispatch_once(&dc_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)dc_whitespaceAndNewlineCoalescedString_regex;
  uint64_t v3 = [a1 length];

  return objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, v3, @" ");
}

- (id)dc_sanitizedFilenameString
{
  id v1 = a1;
  if ([v1 length])
  {
    if ((unint64_t)[v1 length] >= 0x81)
    {
      uint64_t v2 = objc_msgSend(v1, "dc_substringToIndex:", 128);

      id v1 = (id)v2;
    }
    uint64_t v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"///\\?%*|\"<>:"];
    v4 = objc_msgSend(v1, "dc_stringByReplacingCharactersInSet:withString:", v3, &stru_26C7D5180);

    v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"."];
    v6 = (void *)[v5 mutableCopy];

    v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    [v6 formUnionWithCharacterSet:v7];

    id v1 = [v4 stringByTrimmingCharactersInSet:v6];
  }

  return v1;
}

- (uint64_t)dc_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "dc_stringByReplacingCharactersInStringMap:", &unk_26C7EDA58);
}

- (uint64_t)dc_numberOfLines
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 0;
  }
  unint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = objc_msgSend(a1, "lineRangeForRange:", v5, 0);
    uint64_t v5 = v6 + v7;
    ++v4;
  }
  while (v6 + v7 < v3);
  return v4;
}

- (void)dc_enumerateParagraphsInRange:()DC usingBlock:
{
  v8 = a5;
  unint64_t v9 = a3 + a4;
  unint64_t v10 = [a1 length];
  if (v9 >= v10) {
    unint64_t v9 = v10;
  }
  char v14 = 0;
  do
  {
    if (a3 >= v9) {
      break;
    }
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v13, &v12, &v11, a3, 0);
    v8[2](v8, v13, v12, v11, &v14);
    a3 = v12;
  }
  while (!v14);
}

- (void)dc_enumerateContentLineRangesInRange:()DC usingBlock:
{
  v8 = a5;
  unint64_t v9 = a3 + a4;
  unint64_t v10 = [a1 length];
  unint64_t v14 = 0;
  unint64_t v15 = a3;
  if (v9 >= v10) {
    unint64_t v9 = v10;
  }
  uint64_t v13 = 0;
  char v12 = 0;
  do
  {
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, a3, 0);
    v8[2](v8, v15, v13 - v15, &v12);
    a3 = v14;
    unint64_t v15 = v14;
  }
  while (v14 < v9 && v12 == 0);
}

- (uint64_t)dc_substringFromIndex:()DC
{
  uint64_t v2 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");

  return [a1 substringFromIndex:v2];
}

- (id)dc_substringToIndex:()DC
{
  if ([a1 length])
  {
    uint64_t v5 = [a1 length];
    if (v5 - 1 >= a3) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = v5 - 1;
    }
    uint64_t v7 = [a1 rangeOfComposedCharacterSequenceAtIndex:v6];
    unint64_t v9 = [a1 substringToIndex:v7 + v8];
  }
  else
  {
    unint64_t v9 = (void *)[a1 copy];
  }

  return v9;
}

- (uint64_t)dc_substringWithRange:()DC
{
  uint64_t v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");

  return objc_msgSend(a1, "substringWithRange:", v3, v2);
}

- (id)dc_stringByReplacingNewlineCharactersWithWhiteSpace
{
  uint64_t v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v3 = objc_msgSend(a1, "dc_stringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)dc_stringByReplacingCharactersInSet:()DC withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  uint64_t v9 = [v8 rangeOfCharacterFromSet:v6];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    uint64_t v11 = 0;
    do
    {
      if (!v11) {
        uint64_t v11 = (void *)[v8 mutableCopy];
      }
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v12, v13, v7);
      uint64_t v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 2, v12, objc_msgSend(v11, "length") - v12);
      uint64_t v13 = v14;
    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    if (v11)
    {
      uint64_t v15 = [v11 copy];

      id v8 = (id)v15;
    }
  }

  return v8;
}

- (id)dc_stringByReplacingCharactersInStringMap:()DC
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v27 = a1;
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v5 appendString:@"()"];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v26 = v4;
  id v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [MEMORY[0x263F08AE8] escapedPatternForString:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        [v5 appendString:v10];

        [v5 appendString:@"|"];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }

  if ([v5 length]) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_26C7D5180);
  }
  [v5 appendString:@""]);
  v25 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v5 options:0 error:0];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5;
  v39 = __Block_byref_object_dispose__5;
  id v40 = 0;
  uint64_t v11 = [v27 length];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __58__NSString_DC__dc_stringByReplacingCharactersInStringMap___block_invoke;
  v34[3] = &unk_2642AA5B0;
  v34[4] = &v35;
  objc_msgSend(v25, "enumerateMatchesInString:options:range:usingBlock:", v27, 0, 0, v11, v34);
  if ([(id)v36[5] count]) {
    uint64_t v12 = (void *)[v27 mutableCopy];
  }
  else {
    uint64_t v12 = 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v13 = [(id)v36[5] reverseObjectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = [*(id *)(*((void *)&v30 + 1) + 8 * j) rangeValue];
        uint64_t v19 = v18;
        v20 = objc_msgSend(v27, "substringWithRange:", v17, v18);
        v21 = [v26 objectForKeyedSubscript:v20];
        if (v21)
        {
          objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v19, v21);
        }
        else
        {
          v22 = os_log_create("com.apple.documentcamera", "");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            [(NSString(DC) *)&buf dc_stringByReplacingCharactersInStringMap:v22];
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v45 count:16];
    }
    while (v14);
  }

  if (v12)
  {
    uint64_t v23 = [v12 copy];

    id v27 = (id)v23;
  }

  _Block_object_dispose(&v35, 8);

  return v27;
}

- (uint64_t)dc_paragraphRangeForRange:()DC contentEnd:
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v9, &v8, &v7, a3, a4);
  if (a5) {
    *a5 = v7;
  }
  return v9;
}

- (uint64_t)dc_lengthOfLongestLine
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__NSString_DC__dc_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_2642AA5D8;
  v3[4] = &v4;
  [a1 enumerateLinesUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)dc_stringByReplacingCharactersInStringMap:()DC .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "nil replacement string replacestring map", buf, 2u);
}

@end