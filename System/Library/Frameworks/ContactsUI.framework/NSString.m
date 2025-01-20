@interface NSString
@end

@implementation NSString

void __49__NSString_CNUI__cnui_shouldTransliterateToLatin__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v1 = +[CNUIContactsEnvironment currentEnvironment];
  v2 = [v1 collation];
  v3 = [v2 indexSections];

  v4 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v5 = [v4 invertedSet];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) key];
        if ([v11 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "cnui_firstUTF32Character");
          int Script = uscript_getScript();
          [v0 addIndex:Script];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v13 = (void *)cnui_shouldTransliterateToLatin___supportedScripts;
  cnui_shouldTransliterateToLatin___supportedScripts = (uint64_t)v0;
}

void __59__NSString_CNUI__cnui_stringByTransliteratingToKanaAsName___block_invoke(uint64_t a1)
{
  CFLocaleRef v2 = CFLocaleCreate(0, @"ja");
  v4.length = CFStringGetLength(*(CFStringRef *)(a1 + 32));
  v4.location = 0;
  cnui_stringByTransliteratingToKanaAsName____japaneseTokenizer = (uint64_t)CFStringTokenizerCreate(0, 0, v4, 0, v2);

  CFRelease(v2);
}

@end