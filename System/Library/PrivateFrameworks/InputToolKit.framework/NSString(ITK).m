@interface NSString(ITK)
- (BOOL)itk_containsAlphanumericCharacters;
- (BOOL)itk_containsNonWhitespaceCharacters;
- (BOOL)itk_isLastCharacterInRangeANewlineForRange:()ITK;
- (BOOL)itk_rangeIsValid:()ITK;
- (NSUInteger)itk_safeCharacterRangeForRange:()ITK;
- (__CFString)itk_checkedSubstringWithRange:()ITK;
- (__CFString)itk_stringByTrimmingLeadingCharactersInSet:()ITK;
- (__CFString)itk_substringWithRange:()ITK;
- (__CFString)itk_trailingTrimmedString;
- (id)itk_hexCodes;
- (id)itk_htmlStringEscapingQuotesAndLineBreaks;
- (id)itk_leadingTrimmedString;
- (id)itk_md5;
- (id)itk_sanitizedFilenameString;
- (id)itk_stringByReplacingCharactersInSet:()ITK withString:;
- (id)itk_stringByReplacingCharactersInStringMap:()ITK;
- (id)itk_stringByReplacingNewlineCharactersWithWhiteSpace;
- (id)itk_substringToIndex:()ITK;
- (id)itk_trimmedString;
- (id)itk_truncatedStringWithMaxLength:()ITK truncated:;
- (id)itk_uniqueWordsWithMinLength:()ITK;
- (uint64_t)itk_countOfCharactersInSet:()ITK;
- (uint64_t)itk_isLastCharacterANewline;
- (uint64_t)itk_lengthOfLongestLine;
- (uint64_t)itk_lineRangeIgnoringLineBreakCharactersForIndex:()ITK;
- (uint64_t)itk_numberOfLines;
- (uint64_t)itk_paragraphRangeForRange:()ITK contentEnd:;
- (uint64_t)itk_range;
- (uint64_t)itk_stringReplacingUnsafeHTMLCharacters;
- (uint64_t)itk_stringReplacingUnsafeXMLCharacters;
- (uint64_t)itk_substringFromIndex:()ITK;
- (uint64_t)itk_whitespaceAndNewlineCoalescedString;
- (uint64_t)itk_wordCount;
- (void)itk_enumerateContentLineRangesInRange:()ITK usingBlock:;
- (void)itk_enumerateParagraphsInRange:()ITK usingBlock:;
@end

@implementation NSString(ITK)

- (uint64_t)itk_range
{
  return 0;
}

- (id)itk_hexCodes
{
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([a1 length])
  {
    unint64_t v3 = 0;
    uint64_t v4 = *MEMORY[0x263EFF5C0];
    do
    {
      unsigned int v5 = [a1 characterAtIndex:v3];
      v6 = objc_msgSend(a1, "itk_substringWithRange:", v3, 1);
      v7 = [v6 stringByApplyingTransform:v4 reverse:0];
      [v2 appendFormat:@"%lu: U+%04x %@\n", v3, v5, v7];

      ++v3;
    }
    while (v3 < [a1 length]);
  }
  v8 = (void *)[v2 copy];

  return v8;
}

- (id)itk_md5
{
  v1 = [a1 dataUsingEncoding:4];
  id v2 = objc_msgSend(v1, "itk_md5");

  return v2;
}

- (id)itk_htmlStringEscapingQuotesAndLineBreaks
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [&unk_2702F85C0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      v6 = v1;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(&unk_2702F85C0);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
        v8 = [v7 objectAtIndexedSubscript:0];
        v9 = [v7 objectAtIndexedSubscript:1];
        id v1 = [v6 stringByReplacingOccurrencesOfString:v8 withString:v9];

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_2702F85C0 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  return v1;
}

- (id)itk_trimmedString
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (__CFString)itk_trailingTrimmedString
{
  if ([a1 length])
  {
    uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v3 = [a1 length] + 1;
    uint64_t v4 = &stru_2702F71A0;
    while (v3 - 2 >= 1)
    {
      --v3;
      if ((objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:")) & 1) == 0)
      {
        uint64_t v4 = [a1 substringToIndex:v3];
        break;
      }
    }
  }
  else
  {
    uint64_t v4 = &stru_2702F71A0;
  }

  return v4;
}

- (id)itk_leadingTrimmedString
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = objc_msgSend(a1, "itk_stringByTrimmingLeadingCharactersInSet:", v2);

  return v3;
}

- (uint64_t)itk_whitespaceAndNewlineCoalescedString
{
  if (itk_whitespaceAndNewlineCoalescedString_onceToken != -1) {
    dispatch_once(&itk_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = (void *)itk_whitespaceAndNewlineCoalescedString_regex;
  uint64_t v3 = [a1 length];

  return objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, v3, @" ");
}

- (id)itk_sanitizedFilenameString
{
  id v1 = a1;
  if ([v1 length])
  {
    if ((unint64_t)[v1 length] >= 0x81)
    {
      uint64_t v2 = objc_msgSend(v1, "itk_substringToIndex:", 128);

      id v1 = (id)v2;
    }
    uint64_t v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"///\\?%*|\"<>:"];
    uint64_t v4 = objc_msgSend(v1, "itk_stringByReplacingCharactersInSet:withString:", v3, &stru_2702F71A0);

    uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"."];
    v6 = (void *)[v5 mutableCopy];

    v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    [v6 formUnionWithCharacterSet:v7];

    id v1 = [v4 stringByTrimmingCharactersInSet:v6];
  }
  v8 = [v1 lastPathComponent];

  return v8;
}

- (BOOL)itk_rangeIsValid:()ITK
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)[a1 length];
}

- (uint64_t)itk_lineRangeIgnoringLineBreakCharactersForIndex:()ITK
{
  uint64_t location = objc_msgSend(a1, "lineRangeForRange:", a3, 0);
  NSUInteger length = v5;
  int v7 = [@"\u2028" characterAtIndex:0];
  NSUInteger v8 = location - 1;
  if (location - 1 >= 1)
  {
    do
    {
      if ([a1 characterAtIndex:v8] != v7) {
        break;
      }
      v16.uint64_t location = objc_msgSend(a1, "lineRangeForRange:", v8, 0);
      v16.NSUInteger length = v9;
      v14.uint64_t location = location;
      v14.NSUInteger length = length;
      NSRange v10 = NSUnionRange(v14, v16);
      uint64_t location = v10.location;
      NSUInteger length = v10.length;
      NSUInteger v8 = v10.location - 1;
    }
    while ((int64_t)(v10.location - 1) > 0);
  }
  for (NSUInteger i = location + length;
        (uint64_t)(i - 1) >= 0
     && i < [a1 length]
     && [a1 characterAtIndex:i - 1] == v7;
        NSUInteger i = v12.location + v12.length)
  {
    v15.uint64_t location = objc_msgSend(a1, "lineRangeForRange:", i, 0);
    v17.uint64_t location = location;
    v17.NSUInteger length = length;
    NSRange v12 = NSUnionRange(v15, v17);
    uint64_t location = v12.location;
    NSUInteger length = v12.length;
  }
  return location;
}

- (uint64_t)itk_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "itk_stringByReplacingCharactersInStringMap:", &unk_2702F8608);
}

- (uint64_t)itk_stringReplacingUnsafeXMLCharacters
{
  return objc_msgSend(a1, "itk_stringByReplacingCharactersInStringMap:", &unk_2702F8630);
}

- (uint64_t)itk_isLastCharacterANewline
{
  uint64_t v2 = [a1 length];

  return objc_msgSend(a1, "itk_isLastCharacterInRangeANewlineForRange:", 0, v2);
}

- (uint64_t)itk_numberOfLines
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

- (uint64_t)itk_wordCount
{
  uint64_t v7 = 0;
  NSUInteger v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = objc_msgSend(a1, "itk_range");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__NSString_ITK__itk_wordCount__block_invoke;
  v6[3] = &unk_26538CDF8;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", v2, v3, 1539, v6);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)itk_uniqueWordsWithMinLength:()ITK
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc(MEMORY[0x263F08948]);
  v25[0] = *MEMORY[0x263F082D8];
  uint64_t v7 = v25[0];
  NSUInteger v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  uint64_t v9 = (void *)[v6 initWithTagSchemes:v8 options:0];

  [v9 setString:a1];
  uint64_t v10 = [a1 length];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __46__NSString_ITK__itk_uniqueWordsWithMinLength___block_invoke;
  v21[3] = &unk_26538CE20;
  uint64_t v24 = a3;
  id v11 = v5;
  id v22 = v11;
  v23 = a1;
  objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v7, 6, v21);
  uint64_t v15 = 0;
  NSRange v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = objc_alloc_init(MEMORY[0x263F089D8]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__NSString_ITK__itk_uniqueWordsWithMinLength___block_invoke_95;
  v14[3] = &unk_26538CE48;
  v14[4] = &v15;
  [v11 enumerateObjectsUsingBlock:v14];
  NSRange v12 = (void *)[(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)itk_containsNonWhitespaceCharacters
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [v2 invertedSet];

  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] != 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

- (BOOL)itk_containsAlphanumericCharacters
{
  uint64_t v2 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (void)itk_enumerateParagraphsInRange:()ITK usingBlock:
{
  NSUInteger v8 = a5;
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

- (void)itk_enumerateContentLineRangesInRange:()ITK usingBlock:
{
  NSUInteger v8 = a5;
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

- (uint64_t)itk_substringFromIndex:()ITK
{
  uint64_t v2 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");

  return [a1 substringFromIndex:v2];
}

- (id)itk_substringToIndex:()ITK
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

- (__CFString)itk_substringWithRange:()ITK
{
  uint64_t v7 = objc_msgSend(a1, "itk_range");
  uint64_t v9 = ITKClampRange(a3, a4, v7, v8);
  if (v10)
  {
    uint64_t v11 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", v9, v10);
    objc_msgSend(a1, "substringWithRange:", v11, v12);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = &stru_2702F71A0;
  }

  return v13;
}

- (__CFString)itk_checkedSubstringWithRange:()ITK
{
  if (objc_msgSend(a1, "itk_rangeIsValid:"))
  {
    objc_msgSend(a1, "itk_substringWithRange:", a3, a4);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = &stru_2702F71A0;
  }

  return v7;
}

- (id)itk_stringByReplacingNewlineCharactersWithWhiteSpace
{
  uint64_t v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  BOOL v3 = objc_msgSend(a1, "itk_stringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)itk_stringByReplacingCharactersInSet:()ITK withString:
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

- (id)itk_stringByReplacingCharactersInStringMap:()ITK
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v26 = a1;
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v5, "appendString:", @"(");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v25 = v4;
  id v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [MEMORY[0x263F08AE8] escapedPatternForString:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        [v5 appendString:v10];

        [v5 appendString:@"|"];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v7);
  }

  if ([v5 length]) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_2702F71A0);
  }
  [v5 appendString:@""]);
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v5 options:0 error:0];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v11 = [v26 length];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __60__NSString_ITK__itk_stringByReplacingCharactersInStringMap___block_invoke;
  v31[3] = &unk_26538CE70;
  v31[4] = &v32;
  objc_msgSend(v24, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v11, v31);
  if ([(id)v33[5] count]) {
    uint64_t v12 = (void *)[v26 mutableCopy];
  }
  else {
    uint64_t v12 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [(id)v33[5] reverseObjectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * j) rangeValue];
        uint64_t v19 = v18;
        id v20 = objc_msgSend(v26, "substringWithRange:", v17, v18);
        v21 = [v25 objectForKeyedSubscript:v20];
        if (v21) {
          objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v19, v21);
        }
        else {
          +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ITKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSString(ITK) itk_stringByReplacingCharactersInStringMap:]", 0, 0, @"nil replacement string replacestring map");
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v42 count:16];
    }
    while (v14);
  }

  if (v12)
  {
    uint64_t v22 = [v12 copy];

    id v26 = (id)v22;
  }

  _Block_object_dispose(&v32, 8);

  return v26;
}

- (uint64_t)itk_paragraphRangeForRange:()ITK contentEnd:
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

- (uint64_t)itk_lengthOfLongestLine
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__NSString_ITK__itk_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_26538CE48;
  v3[4] = &v4;
  [a1 enumerateLinesUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (BOOL)itk_isLastCharacterInRangeANewlineForRange:()ITK
{
  uint64_t v7 = objc_msgSend(a1, "itk_safeCharacterRangeForRange:");
  BOOL v9 = 0;
  if (a3 == v7 && a4 == v8)
  {
    uint64_t v10 = objc_msgSend(a1, "itk_substringWithRange:", v7, v8);
    if ([v10 length]) {
      BOOL v9 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1) == 10;
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (NSUInteger)itk_safeCharacterRangeForRange:()ITK
{
  NSUInteger v6 = [a1 length];
  if (v6 == a3) {
    return a3;
  }
  v7.NSUInteger length = v6;
  if (v6 < a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v9.uint64_t location = a3;
  v9.NSUInteger length = a4;
  v7.uint64_t location = 0;

  return NSIntersectionRange(v9, v7).location;
}

- (uint64_t)itk_countOfCharactersInSet:()ITK
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, objc_msgSend(a1, "length"));
  uint64_t v6 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    uint64_t v6 = 0;
    do
    {
      ++v6;
      uint64_t v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, v7 + 1, objc_msgSend(a1, "length") + ~v7);
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (__CFString)itk_stringByTrimmingLeadingCharactersInSet:()ITK
{
  id v4 = [a3 invertedSet];
  uint64_t v5 = [a1 rangeOfCharacterFromSet:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = &stru_2702F71A0;
  }
  else if (v5)
  {
    objc_msgSend(a1, "itk_substringFromIndex:", v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = a1;
  }

  return v6;
}

- (id)itk_truncatedStringWithMaxLength:()ITK truncated:
{
  if (a4) {
    *a4 = 0;
  }
  if ([a1 length] <= a3)
  {
    id v9 = a1;
  }
  else
  {
    uint64_t v7 = objc_msgSend(a1, "itk_substringWithRange:", 0, a3);
    uint64_t v8 = [v7 length];
    if (v8 == [a1 length])
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = objc_msgSend(v7, "itk_trailingTrimmedString");
      id v9 = [v10 stringByAppendingString:@"…"];

      if (a4) {
        *a4 = 1;
      }
    }
  }

  return v9;
}

@end