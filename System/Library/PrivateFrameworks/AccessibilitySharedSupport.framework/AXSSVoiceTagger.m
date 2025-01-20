@interface AXSSVoiceTagger
+ (id)_createVoiceTagWithDialect:(id)a3 range:(_NSRange)a4 content:(id)a5 createdFromNewline:(BOOL)a6;
+ (id)_currentLineContentForTag:(id)a3 inTags:(id)a4;
+ (id)_primaryDialectForTag:(id)a3 inTags:(id)a4;
+ (id)markupVoiceTagForAttributedString:(id)a3 preferredLangauge:(id)a4;
+ (id)voiceTagsForContent:(id)a3 preferredLangauge:(id)a4;
@end

@implementation AXSSVoiceTagger

+ (id)voiceTagsForContent:(id)a3 preferredLangauge:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v43 = (id)objc_opt_new();
  v44 = v6;
  v8 = +[AXSSLanguageTagger languageTagsForContent:v6];
  v9 = +[AXSSLanguageManager shared];
  v41 = v7;
  id v10 = v7;
  v11 = v8;
  uint64_t v12 = [v9 dialectForLanguageID:v10];

  v45 = (void *)v12;
  if ([v8 count])
  {
    uint64_t location = 0;
    NSUInteger length = 0;
    v15 = 0;
    uint64_t v16 = 0;
    char v17 = v12 != 0;
    id v46 = a1;
    v42 = v11;
    while (1)
    {
      v18 = [v11 objectAtIndexedSubscript:v16];
      if (v17)
      {
        v19 = [a1 _currentLineContentForTag:v18 inTags:v11];
        int v20 = [v45 canSpeakString:v19];
        if (v20)
        {
          if (v15)
          {
            v21 = objc_msgSend(a1, "_createVoiceTagWithDialect:range:content:createdFromNewline:", v15, location, length, v44, 0);
            [v43 addObject:v21];
          }
          id v22 = v45;

          uint64_t location = [v18 taggedRange];
          NSUInteger length = v23;
          v15 = v22;
          a1 = v46;
        }
        char v17 = v20 ^ 1;
      }
      else
      {
        char v17 = 0;
      }
      v24 = [a1 _primaryDialectForTag:v18 inTags:v11];
      if ([v15 isEqual:v24] & 1) != 0 || (objc_msgSend(v15, "isEqual:", v45))
      {
        int v25 = 1;
      }
      else
      {
        v26 = [v18 dialect];
        int v25 = [v15 isEqual:v26];
      }
      v27 = [v18 taggedString];
      int v28 = [v15 canSpeakString:v27];

      if (!v15) {
        break;
      }
      if ((v28 & v25) == 1)
      {
        a1 = v46;
LABEL_22:
        v48.uint64_t location = [v18 taggedRange];
        v48.NSUInteger length = v36;
        v47.uint64_t location = location;
        v47.NSUInteger length = length;
        NSRange v37 = NSUnionRange(v47, v48);
        uint64_t location = v37.location;
        NSUInteger length = v37.length;
        goto LABEL_23;
      }
      a1 = v46;
      v32 = objc_msgSend(v46, "_createVoiceTagWithDialect:range:content:createdFromNewline:", v15, location, length, v44, 0);
      [v43 addObject:v32];

      uint64_t v33 = [v18 dialect];

      uint64_t location = [v18 taggedRange];
      NSUInteger length = v34;
      char v17 = 1;
      v15 = (void *)v33;
LABEL_23:
      if ([v18 createdFromNewline])
      {
        char v17 = 1;
        v38 = objc_msgSend(a1, "_createVoiceTagWithDialect:range:content:createdFromNewline:", v15, location, length, v44, 1);
        [v43 addObject:v38];

        v15 = 0;
      }
      v11 = v42;

      if (++v16 >= (unint64_t)[v42 count]) {
        goto LABEL_28;
      }
    }
    v29 = [v18 content];
    int v30 = [v24 canSpeakString:v29];

    if (v30)
    {
      id v31 = v24;
    }
    else
    {
      id v31 = [v18 dialect];
    }
    v15 = v31;
    a1 = v46;
    uint64_t location = [v18 taggedRange];
    NSUInteger length = v35;
    goto LABEL_22;
  }
  v15 = 0;
LABEL_28:
  id v39 = v43;

  return v39;
}

+ (id)_createVoiceTagWithDialect:(id)a3 range:(_NSRange)a4 content:(id)a5 createdFromNewline:(BOOL)a6
{
  uint64_t v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = +[AXSSLanguageManager shared];
  v13 = [v12 systemLanguageID];
  int v14 = [v13 hasPrefix:@"en"];

  v15 = objc_msgSend(v11, "substringWithRange:", location, length);
  uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  char v17 = [v15 stringByTrimmingCharactersInSet:v16];

  v18 = [v10 specificLanguageID];
  if (![v18 hasPrefix:@"el"]) {
    goto LABEL_11;
  }
  unint64_t v19 = [v17 length];

  if (v19 < 0xA) {
    int v20 = v14;
  }
  else {
    int v20 = 0;
  }
  if (v20 != 1) {
    goto LABEL_12;
  }
  NSUInteger v30 = length;
  if (![v17 length]) {
    goto LABEL_10;
  }
  unsigned int v29 = v6;
  unint64_t v21 = 0;
  int v22 = 1;
  do
  {
    uint64_t v23 = [v17 characterAtIndex:0];
    v24 = +[AXSSLanguageManager shared];
    int v25 = [v24 dialectForSystemLanguage];
    v22 &= [v25 canSpeakCharacter:v23];

    ++v21;
  }
  while (v21 < [v17 length]);
  uint64_t v6 = v29;
  if (v22)
  {
LABEL_10:
    v18 = +[AXSSLanguageManager shared];
    uint64_t v26 = [v18 dialectForSystemLanguage];

    id v10 = (id)v26;
    NSUInteger length = v30;
LABEL_11:

    goto LABEL_12;
  }
  NSUInteger length = v30;
LABEL_12:
  v27 = -[AXSSLanguageTag initWithDialect:range:content:createdFromNewline:]([AXSSLanguageTag alloc], "initWithDialect:range:content:createdFromNewline:", v10, location, length, v11, v6);

  return v27;
}

+ (id)markupVoiceTagForAttributedString:(id)a3 preferredLangauge:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v6];
  v9 = [v6 string];
  uint64_t v23 = v7;
  id v10 = [a1 voiceTagsForContent:v9 preferredLangauge:v7];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        char v17 = [v16 dialect];
        v18 = [v17 voiceIdentifier];
        uint64_t v19 = [v16 taggedRange];
        objc_msgSend(v8, "addAttribute:value:range:", @"AXVoiceIdentifier", v18, v19, v20);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  unint64_t v21 = (void *)[v8 copy];

  return v21;
}

+ (id)_currentLineContentForTag:(id)a3 inTags:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = [v5 taggedString];
  id v7 = [v5 content];
  v8 = [v5 content];
  uint64_t v9 = [v8 length];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__AXSSVoiceTagger__currentLineContentForTag_inTags___block_invoke;
  v13[3] = &unk_1E606CFC0;
  id v10 = v5;
  id v14 = v10;
  v15 = &v16;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 4, v13);

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __52__AXSSVoiceTagger__currentLineContentForTag_inTags___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v16 = a2;
  v19.NSUInteger location = [*(id *)(a1 + 32) taggedRange];
  v19.NSUInteger length = v12;
  v18.NSUInteger location = a3;
  v18.NSUInteger length = a4;
  NSRange v13 = NSIntersectionRange(v18, v19);
  if (v13.location == [*(id *)(a1 + 32) taggedRange] && v13.length == v14)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a7 = 1;
  }
}

+ (id)_primaryDialectForTag:(id)a3 inTags:(id)a4
{
  v4 = [a1 _currentLineContentForTag:a3 inTags:a4];
  id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  id v7 = +[AXSSLanguageTagger primaryLanguageForContent:v6];
  v8 = +[AXSSLanguageManager shared];
  uint64_t v9 = [v8 dialectForLanguageID:v7];

  return v9;
}

@end