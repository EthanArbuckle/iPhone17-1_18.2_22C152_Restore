@interface NSString(TranslationAdditions)
- (BOOL)lt_isWhiteSpaceOnlyString;
- (BOOL)lt_validSubrange:()TranslationAdditions;
- (CFIndex)lt_codeUnitsRangeFromCodePointsRange:()TranslationAdditions;
- (id)lt_wordRangesWithLocale:()TranslationAdditions;
- (uint64_t)lt_codePointsRangeFromCodeUnitsRange:()TranslationAdditions;
- (uint64_t)lt_localeIdentifier;
@end

@implementation NSString(TranslationAdditions)

- (BOOL)lt_validSubrange:()TranslationAdditions
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)[a1 length];
}

- (id)lt_wordRangesWithLocale:()TranslationAdditions
{
  v18[1] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263F14038];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = *MEMORY[0x263F13FC0];
  v18[0] = *MEMORY[0x263F13FC0];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v9 = (void *)[v6 initWithTagSchemes:v8];

  [v9 setString:a1];
  uint64_t v10 = [a1 length];
  v11 = objc_msgSend(v5, "lt_nlLanguageCode");

  if (v11) {
    objc_msgSend(v9, "setLanguage:range:", v11, 0, v10);
  }
  v12 = [MEMORY[0x263EFF980] array];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__NSString_TranslationAdditions__lt_wordRangesWithLocale___block_invoke;
  v16[3] = &unk_2651DCE98;
  id v17 = v12;
  id v13 = v12;
  objc_msgSend(v9, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v10, 0, v7, 38, v16);
  v14 = (void *)[v13 copy];

  return v14;
}

- (CFIndex)lt_codeUnitsRangeFromCodePointsRange:()TranslationAdditions
{
  if (!(a3 | a4)) {
    return 0;
  }
  CFIndex result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    CFIndex Length = CFStringGetLength(theString);
    uint64_t v9 = a3 + a4;
    if (Length >= 1)
    {
      CFIndex v10 = Length;
      CFIndex v11 = 0;
      uint64_t v12 = 0;
      CFIndex v13 = 0;
      while (1)
      {
        if ((CFStringGetCharacterAtIndex(theString, v13) & 0xFC00) != 0xDC00)
        {
          if (a3 == v12) {
            CFIndex v11 = v13;
          }
          if (v9 == v12)
          {
            uint64_t v12 = v9;
            goto LABEL_15;
          }
          ++v12;
        }
        if (v10 == ++v13) {
          goto LABEL_15;
        }
      }
    }
    uint64_t v12 = 0;
    CFIndex v11 = 0;
LABEL_15:
    if (v12 == v9) {
      return v11;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (uint64_t)lt_codePointsRangeFromCodeUnitsRange:()TranslationAdditions
{
  if (!(a3 | a4)) {
    return 0;
  }
  CFIndex v5 = a3;
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 < [(__CFString *)a1 length])
  {
    CFIndex v8 = v5 + a4;
    if (v5 + a4 <= (unint64_t)[(__CFString *)a1 length])
    {
      if (v5 < 1)
      {
        CFIndex v5 = 0;
        uint64_t v4 = 0;
      }
      else
      {
        uint64_t v4 = 0;
        for (CFIndex i = 0; i != v5; ++i)
        {
          if ((CFStringGetCharacterAtIndex(a1, i) & 0xFC00) != 0xD800) {
            ++v4;
          }
        }
      }
      if ((CFStringGetCharacterAtIndex(a1, v5) & 0xFC00) == 0xDC00) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v5 < v8)
      {
        uint64_t v11 = 0;
        do
        {
          if ((CFStringGetCharacterAtIndex(a1, v5) & 0xFC00) != 0xD800) {
            ++v11;
          }
          ++v5;
        }
        while (v8 != v5);
        CFIndex v5 = v8;
      }
      if (v8 != [(__CFString *)a1 length] && (CFStringGetCharacterAtIndex(a1, v5) & 0xFC00) == 0xDC00) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v4;
}

- (uint64_t)lt_localeIdentifier
{
  return [a1 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
}

- (BOOL)lt_isWhiteSpaceOnlyString
{
  v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [v2 invertedSet];

  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] == 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

@end