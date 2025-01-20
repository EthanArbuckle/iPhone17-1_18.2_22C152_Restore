@interface NSString(CNUI)
- (id)cnui_stringByTransliteratingToKanaAsName:()CNUI;
- (id)cnui_stringByTransliteratingToPhoneticCharactersForProperty:()CNUI;
- (uint64_t)cnui_containsEmojiCharacters;
- (uint64_t)cnui_containsNonLatinCharacters;
- (uint64_t)cnui_firstUTF32Character;
- (uint64_t)cnui_shouldTransliterateToLatin;
- (uint64_t)cnui_shouldUseJapaneseTransliteration;
- (uint64_t)cnui_shouldUseZhuyinTransliteration;
@end

@implementation NSString(CNUI)

- (uint64_t)cnui_containsEmojiCharacters
{
  return MEMORY[0x1F4112CD8]();
}

- (uint64_t)cnui_containsNonLatinCharacters
{
  return MEMORY[0x1F4112CE8]();
}

- (id)cnui_stringByTransliteratingToPhoneticCharactersForProperty:()CNUI
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F1AF00];
  v14 = (void *)*MEMORY[0x1E4F1AEF0];
  v4 = v14;
  uint64_t v15 = v5;
  uint64_t v16 = *MEMORY[0x1E4F1AEF8];
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v14 count:3];
  int v9 = objc_msgSend(v4, "isEqualToString:", v7, v14, v15, v16, v17);
  uint64_t v10 = [v8 containsObject:v7];

  if (objc_msgSend(a1, "cnui_shouldUseJapaneseTransliteration"))
  {
    objc_msgSend(a1, "cnui_stringByTransliteratingToKanaAsName:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ([a1 _isOnlyIdeographs])
  {
    if (objc_msgSend(a1, "cnui_shouldUseZhuyinTransliteration"))
    {
      if (v9) {
        [a1 _stringByTransliteratingToZhuyinAsFamilyName];
      }
      else {
        [a1 _stringByTransliteratingToZhuyin];
      }
LABEL_7:
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(a1, "cnui_shouldTransliterateToLatin"))
    {
      if (v9) {
        [a1 _stringByTransliteratingToPinyinAsFamilyName];
      }
      else {
        [a1 _stringByTransliteratingToPinyin];
      }
      goto LABEL_7;
    }
  }
  else if (objc_msgSend(a1, "cnui_shouldTransliterateToLatin"))
  {
    id v11 = [a1 _stringByApplyingTransform:@"Any-Latin; Any-Title; NFD"];
    goto LABEL_16;
  }
  id v11 = a1;
LABEL_16:
  v12 = v11;

  return v12;
}

- (uint64_t)cnui_shouldTransliterateToLatin
{
  if (cnui_shouldTransliterateToLatin___onceToken != -1) {
    dispatch_once(&cnui_shouldTransliterateToLatin___onceToken, &__block_literal_global_61270);
  }
  uint64_t result = [(id)cnui_shouldTransliterateToLatin___supportedScripts containsIndex:25];
  if (result)
  {
    objc_msgSend(a1, "cnui_firstUTF32Character");
    return [(id)cnui_shouldTransliterateToLatin___supportedScripts containsIndex:(int)uscript_getScript()] ^ 1;
  }
  return result;
}

- (uint64_t)cnui_shouldUseZhuyinTransliteration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v0 = UIKeyboardGetCurrentInputMode();
  v1 = MEMORY[0x18C1370C0]();
  char v2 = [v1 isEqualToString:@"Zhuyin"];

  if (v2)
  {
    char v3 = 1;
    return v3 & 1;
  }
  UIKeyboardGetActiveInputModes();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {
    char v7 = 0;
    char v8 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
      v12 = MEMORY[0x18C1370C0](v11);
      char v13 = objc_msgSend(v12, "isEqualToString:", @"Zhuyin", (void)v17);

      if (v13)
      {
        char v8 = 1;
      }
      else
      {
        v14 = MEMORY[0x18C1370C0](v11);
        char v15 = [v14 isEqualToString:@"Pinyin"];

        v7 |= v15;
        if ((v8 & 1) == 0) {
          continue;
        }
      }
      if (v7)
      {
        char v7 = 1;
        char v8 = 1;
        goto LABEL_17;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_17:

  char v3 = v8 & (v7 ^ 1);
  return v3 & 1;
}

- (uint64_t)cnui_shouldUseJapaneseTransliteration
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v0 = objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages", 0);
  uint64_t v1 = [v0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v12;
    uint64_t v4 = *MEMORY[0x1E4F1C438];
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(v0);
        }
        uint64_t v6 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        char v7 = [v6 objectForKeyedSubscript:v4];

        if ([v7 isEqualToString:@"ja"])
        {

          uint64_t v9 = 1;
          goto LABEL_13;
        }
        char v8 = [v7 isEqualToString:@"zh"];

        if (v8) {
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v9 = 0;
      if (v2) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_11:
    uint64_t v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)cnui_stringByTransliteratingToKanaAsName:()CNUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NSString_CNUI__cnui_stringByTransliteratingToKanaAsName___block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = a1;
  if (cnui_stringByTransliteratingToKanaAsName____onceToken != -1) {
    dispatch_once(&cnui_stringByTransliteratingToKanaAsName____onceToken, block);
  }
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = (__CFStringTokenizer *)cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer;
  v14.length = [(__CFString *)a1 length];
  v14.location = 0;
  CFStringTokenizerSetString(v6, a1, v14);
  if (a3) {
    CFOptionFlags v7 = 0x1000000;
  }
  else {
    CFOptionFlags v7 = 0x400000;
  }
  while (CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer))
  {
    CFStringRef v8 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute((CFStringTokenizerRef)cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer, v7);
    if (v8)
    {
      CFStringRef v9 = v8;
      if (CFStringGetLength(v8) >= 1) {
        CFStringAppend(v5, v9);
      }
      CFRelease(v9);
    }
  }
  uint64_t v10 = [(__CFString *)v5 stringByApplyingTransform:@"Hiragana-Katakana" reverse:0];

  return v10;
}

- (uint64_t)cnui_firstUTF32Character
{
  uint64_t result = [a1 length];
  if (result)
  {
    if (result != 1
      && (int v3 = [a1 characterAtIndex:0],
          int v4 = [a1 characterAtIndex:1],
          (v3 & 0xFC00) == 0xD800)
      && (v4 & 0xFC00) == 0xDC00)
    {
      return (v4 + (v3 << 10) - 56613888);
    }
    else
    {
      return [a1 characterAtIndex:0];
    }
  }
  return result;
}

@end