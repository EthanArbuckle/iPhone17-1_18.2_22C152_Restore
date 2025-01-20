@interface SGLanguageDetection
+ (_NSRange)tokenRangeForText:(id)a3 maxTruncatedLength:(unint64_t)a4 tagger:(id)a5 taggerOptions:(unint64_t)a6 prevTextTokenMaxRange:(unint64_t)a7 originalLengthShortfall:(unint64_t)a8 lowercaseText:(id)a9 lowercaseRange:(_NSRange)a10;
+ (id)defaultLanguage;
+ (id)detectLanguageFromLanguageTags:(id)a3;
+ (id)detectLanguageFromLanguageTags:(id)a3 withMinimumCount:(unint64_t)a4 withMinimumAgreement:(double)a5;
+ (id)detectLanguageFromText:(id)a3;
+ (id)detectLanguageFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5 withMinimumCount:(unint64_t)a6 withMinimumAgreement:(double)a7;
+ (id)dominantLanguageTagFromLanguageTags:(id)a3;
+ (id)dominantLanguageTagFromLanguageTags:(id)a3 withMinimumCount:(unint64_t)a4 withMinimumAgreement:(double)a5;
+ (id)dominantLanguageTagFromText:(id)a3;
+ (id)dominantLanguageTagFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5 withMinimumCount:(unint64_t)a6 withMinimumAgreement:(double)a7;
+ (id)languageForLocaleIdentifier:(id)a3;
+ (id)languageTagsFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5;
+ (void)logMatchingForRange:(_NSRange)a3 lowercaseRange:(_NSRange)a4 text:(id)a5 lowercaseText:(id)a6;
@end

@implementation SGLanguageDetection

+ (id)languageForLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x22A66BDC0]();
  if ((unint64_t)[v5 length] <= 1)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"SGLanguageDetection.m", 28, @"Invalid parameter not satisfying: %@", @"localeIdentifier.length >= 2" object file lineNumber description];
  }
  v7 = [MEMORY[0x263F08708] letterCharacterSet];
  v8 = +[SGStringSplitter splitString:v5 withCharacterSet:v7];

  v9 = [v8 firstObject];
  v10 = [v9 lowercaseString];

  v11 = [v8 lastObject];
  uint64_t v12 = [v8 count];
  int v13 = [v10 isEqualToString:@"zh"];
  if (v12 == 1)
  {
    if (v13)
    {
      v14 = @"zh-Hans";
      goto LABEL_33;
    }
LABEL_32:
    v14 = v10;
    goto LABEL_33;
  }
  if (v13)
  {
    v15 = [v8 objectAtIndexedSubscript:1];
    char v16 = [v15 isEqualToString:@"Hans"];

    v14 = @"zh-Hans";
    if ((v16 & 1) == 0)
    {
      v17 = [v8 objectAtIndexedSubscript:1];
      char v18 = [v17 isEqualToString:@"Hant"];

      if (v18 & 1) != 0 || ([v11 isEqualToString:@"HK"])
      {
        v14 = @"zh-Hant";
      }
      else
      {
        v14 = @"zh-Hant";
        if (([v11 isEqualToString:@"MO"] & 1) == 0
          && ![v11 isEqualToString:@"TW"])
        {
          v14 = @"zh-Hans";
        }
      }
    }
  }
  else
  {
    v14 = @"hi";
    if (![v10 isEqualToString:@"hi"])
    {
      if ([v10 isEqualToString:@"uz"])
      {
        v21 = [v8 objectAtIndexedSubscript:1];
        char v22 = [v21 isEqualToString:@"Cyrl"];

        if (v22)
        {
          v14 = @"uz";
          goto LABEL_33;
        }
        v23 = [v8 objectAtIndexedSubscript:1];
        char v24 = [v23 isEqualToString:@"Arab"];

        if (v24) {
          goto LABEL_23;
        }
        v25 = [v8 objectAtIndexedSubscript:1];
        char v26 = [v25 isEqualToString:@"Latn"];

        if ((v26 & 1) != 0
          || ([v11 isEqualToString:@"UZ"] & 1) != 0
          || ([v11 isEqualToString:@"AZ"] & 1) != 0)
        {
          v14 = @"uz-Latn";
          goto LABEL_33;
        }
        if ([v11 isEqualToString:@"AF"])
        {
LABEL_23:
          v14 = @"uz-Arab";
          goto LABEL_33;
        }
      }
      if ([v10 isEqualToString:@"sr"])
      {
        v27 = [v8 objectAtIndexedSubscript:1];
        char v28 = [v27 isEqualToString:@"Latn"];

        if (v28)
        {
          v14 = @"sr-Latn";
          goto LABEL_33;
        }
      }
      goto LABEL_32;
    }
    v19 = [v8 objectAtIndexedSubscript:1];
    int v20 = [v19 isEqualToString:@"Latn"];

    if (v20) {
      v14 = @"hi-Latn";
    }
  }
LABEL_33:

  return v14;
}

+ (void)logMatchingForRange:(_NSRange)a3 lowercaseRange:(_NSRange)a4 text:(id)a5 lowercaseText:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = location + length != [v13 length];
  if (((v14 ^ (v10 + v9 == [v12 length])) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x22A66BDC0]();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)char v28 = location + length;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = [v13 length];
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = v10 + v9;
      *(_WORD *)&v29[6] = 1024;
      *(_DWORD *)&v29[8] = [v12 length];
      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGLanguageDetection: mismatched lowercase rangeEnd %d, stringEnd %d / original rangeEnd %d, stringEnd %d", buf, 0x1Au);
    }
  }
  if (location == v10 && length != v9)
  {
    char v16 = (void *)MEMORY[0x22A66BDC0]();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)char v28 = v10;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = length;
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = v10;
      *(_WORD *)&v29[6] = 1024;
      *(_DWORD *)&v29[8] = v9;
      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGLanguageDetection: lowercase tokenRange is loc %d, len %d but original range is loc %d, len %d", buf, 0x1Au);
    }
    unsigned int v17 = length - v9;
    if ((int)length - (int)v9 < 0) {
      unsigned int v17 = v9 - length;
    }
    if (v17 >= 3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)char v28 = v10;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = length;
        *(_WORD *)v29 = 1024;
        *(_DWORD *)&v29[2] = v10;
        *(_WORD *)&v29[6] = 1024;
        *(_DWORD *)&v29[8] = v9;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGLanguageDetection: strange! lowercase is loc %d, len %d but original is loc %d, len %d", buf, 0x1Au);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(v13, "substringWithRange:", location, length);
        int v20 = [v13 length];
        v21 = objc_msgSend(v12, "substringWithRange:", v10, v9);
        int v22 = [v12 length];
        *(_DWORD *)buf = 138413058;
        *(void *)char v28 = v19;
        *(_WORD *)&v28[8] = 1024;
        *(_DWORD *)v29 = v20;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v21;
        *(_WORD *)&v29[14] = 1024;
        *(_DWORD *)&v29[16] = v22;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGLanguageDetection: possible problem! lowercase '%@' strlen %d and original '%@' strlen %d", buf, 0x22u);
      }
    }
    unint64_t v18 = [v12 length];
    if (v18 > [v13 length] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v23 = [v12 length];
      int v24 = [v13 length];
      v25 = [a1 defaultLanguage];
      char v26 = [MEMORY[0x263F08948] dominantLanguageForString:v12];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)char v28 = v23;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v24;
      *(_WORD *)v29 = 2112;
      *(void *)&v29[2] = v25;
      *(_WORD *)&v29[10] = 2112;
      *(void *)&v29[12] = v26;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGLanguageDetection: original len %d is longer than the lowercased len %d in locale %@, detected %@", buf, 0x22u);
    }
  }
}

+ (_NSRange)tokenRangeForText:(id)a3 maxTruncatedLength:(unint64_t)a4 tagger:(id)a5 taggerOptions:(unint64_t)a6 prevTextTokenMaxRange:(unint64_t)a7 originalLengthShortfall:(unint64_t)a8 lowercaseText:(id)a9 lowercaseRange:(_NSRange)a10
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a9;
  [v15 setString:v14];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3010000000;
  v46 = &unk_226E72DEA;
  long long v47 = xmmword_226E68EF0;
  unint64_t v17 = [v14 length];
  if (v17 >= a4) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = v17;
  }
  unint64_t v19 = v18 - a7;
  uint64_t v20 = *MEMORY[0x263F082D8];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __156__SGLanguageDetection_tokenRangeForText_maxTruncatedLength_tagger_taggerOptions_prevTextTokenMaxRange_originalLengthShortfall_lowercaseText_lowercaseRange___block_invoke;
  v35[3] = &unk_2647EB088;
  id v21 = v14;
  id v36 = v21;
  SEL v39 = a2;
  id v40 = a1;
  unint64_t v41 = a8;
  _NSRange v42 = a10;
  id v22 = v16;
  id v37 = v22;
  v38 = &v43;
  objc_msgSend(v15, "enumerateTagsInRange:unit:scheme:options:usingBlock:", a7, v19, 0, v20, a6, v35);
  int v23 = v44;
  NSUInteger v24 = v44[4];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = &_os_log_internal;
    id v26 = &_os_log_internal;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      int v30 = [v22 length];
      int v31 = [v21 length];
      *(_DWORD *)buf = 67109888;
      int v49 = v30;
      __int16 v50 = 1024;
      int location = a10.location;
      __int16 v52 = 1024;
      int length = a10.length;
      __int16 v54 = 1024;
      int v55 = v31;
      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGLanguageDetection: lowercase len %d, range loc %d / len %d found no range in original len %d", buf, 0x1Au);
    }

    int v23 = v44;
    NSUInteger v24 = v44[4];
  }
  NSUInteger v27 = v23[5];

  _Block_object_dispose(&v43, 8);
  NSUInteger v28 = v24;
  NSUInteger v29 = v27;
  result.int length = v29;
  result.int location = v28;
  return result;
}

void __156__SGLanguageDetection_tokenRangeForText_maxTruncatedLength_tagger_taggerOptions_prevTextTokenMaxRange_originalLengthShortfall_lowercaseText_lowercaseRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = a3 + a4;
  if (a3 + a4 > (unint64_t)[*(id *)(a1 + 32) length])
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 64), @"SGLanguageDetection.m", 304, @"Invalid parameter not satisfying: %@", @"NSMaxRange(textTagRange) <= text.length" object file lineNumber description];
  }
  if ((unint64_t)(*(void *)(a1 + 72) + v9) > *(void *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 64), "logMatchingForRange:lowercaseRange:text:lowercaseText:", a3, a4);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    *a5 = 1;
  }
}

+ (id)languageTagsFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v9 = a3;
  unint64_t v10 = [v9 length];
  if (v10)
  {
    SEL v42 = a2;
    unint64_t v43 = a5;
    if (v10 > 2 * a4)
    {
      v11 = (void *)MEMORY[0x22A66BDC0]();
      uint64_t v12 = [v9 substringToIndex:2 * a4];

      id v9 = (id)v12;
    }
    id v13 = objc_opt_new();
    id v14 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v15 = [v14 objectForKey:*MEMORY[0x263EFF508]];

    if (v15)
    {
      id v16 = [a1 languageForLocaleIdentifier:v15];
      [v13 addObject:v16];
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    unint64_t v17 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v73 objects:v79 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v74;
LABEL_8:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v74 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = [a1 languageForLocaleIdentifier:*(void *)(*((void *)&v73 + 1) + 8 * v20)];
        [v13 addObject:v21];

        if ((unint64_t)[v13 count] > 2) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v17 countByEnumeratingWithState:&v73 objects:v79 count:16];
          if (v18) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    id v22 = objc_alloc(MEMORY[0x263F08948]);
    uint64_t v78 = *MEMORY[0x263F082A8];
    uint64_t v44 = v78;
    int v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
    uint64_t v45 = (void *)[v22 initWithTagSchemes:v23 options:0];

    id v24 = objc_alloc(MEMORY[0x263F08948]);
    v77[0] = *MEMORY[0x263F082D8];
    v77[1] = v44;
    v77[2] = *MEMORY[0x263F082C0];
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
    uint64_t v26 = [v24 initWithTagSchemes:v25 options:0];

    NSUInteger v27 = [v9 localizedLowercaseString];
    [v45 setString:v27];
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = __Block_byref_object_copy__1435;
    v71[4] = __Block_byref_object_dispose__1436;
    id v72 = 0;
    id v72 = (id)objc_opt_new();
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__1435;
    v69 = __Block_byref_object_dispose__1436;
    id v70 = 0;
    unint64_t v41 = (void *)v26;
    id v70 = (id)objc_opt_new();
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    v64[3] = 0;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v63[3] = 0;
    uint64_t v28 = [v27 length];
    BOOL v29 = v28 == [v9 length];
    int v30 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    int v31 = (void *)v15;
    unint64_t v32 = [v27 length];
    unint64_t v33 = a4 + 20;
    if (a4 + 20 >= v32) {
      unint64_t v34 = v32;
    }
    else {
      unint64_t v34 = a4 + 20;
    }
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __70__SGLanguageDetection_languageTagsFromText_withMaxLength_withMaxTags___block_invoke;
    v46[3] = &unk_2647EB060;
    id v35 = v27;
    id v47 = v35;
    SEL v56 = v42;
    id v57 = a1;
    unint64_t v58 = a4;
    id v36 = v13;
    id v48 = v36;
    __int16 v52 = &v65;
    v53 = v71;
    BOOL v62 = v29;
    id v9 = v9;
    id v49 = v9;
    unint64_t v59 = v33;
    id v37 = v41;
    id v50 = v37;
    __int16 v54 = v64;
    uint64_t v60 = 536870926;
    int v55 = v63;
    id v38 = v30;
    id v51 = v38;
    unint64_t v61 = v43;
    objc_msgSend(v45, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v34, 0, v44, 536870926, v46);
    id v39 = (id)v66[5];

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(v64, 8);
    _Block_object_dispose(&v65, 8);

    _Block_object_dispose(v71, 8);
  }
  else
  {
    id v39 = (id)MEMORY[0x263EFFA68];
  }

  return v39;
}

void __70__SGLanguageDetection_languageTagsFromText_withMaxLength_withMaxTags___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (a3 + a4 > (unint64_t)[*(id *)(a1 + 32) length])
  {
    int v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:*(void *)(a1 + 104), *(void *)(a1 + 112), @"SGLanguageDetection.m", 217, @"Invalid parameter not satisfying: %@", @"NSMaxRange(lowercaseRange) <= lowercaseText.length" object file lineNumber description];
  }
  if ((unint64_t)(a3 + a4) >= *(void *)(a1 + 120)) {
    *a5 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = 0;
    goto LABEL_37;
  }
  if ([v9 isEqualToString:@"und"])
  {
    unint64_t v10 = v9;
    goto LABEL_37;
  }
  unint64_t v10 = [*(id *)(a1 + 112) languageForLocaleIdentifier:v9];

  if (!v10)
  {
    v11 = (void *)MEMORY[0x22A66BDC0]();
    goto LABEL_14;
  }
  if (![*(id *)(a1 + 40) containsObject:v10])
  {
    v11 = (void *)MEMORY[0x22A66BDC0]();
    if (([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) containsObject:v10] & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v10];
LABEL_24:
      goto LABEL_37;
    }
LABEL_14:
    int v12 = *(unsigned __int8 *)(a1 + 152);
    id v13 = (void *)MEMORY[0x22A66BDC0]();
    if (!v12)
    {
      uint64_t v14 = objc_msgSend(*(id *)(a1 + 112), "tokenRangeForText:maxTruncatedLength:tagger:taggerOptions:prevTextTokenMaxRange:originalLengthShortfall:lowercaseText:lowercaseRange:", *(void *)(a1 + 48), *(void *)(a1 + 128), *(void *)(a1 + 56), *(void *)(a1 + 136), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), *(void *)(a1 + 32), a3, a4);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v16 = 0;
LABEL_23:

        goto LABEL_24;
      }
      a4 = v15;
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v14 + v15;
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = (a3 - v14) & ~((a3 - v14) >> 63);
      a3 = v14;
    }
    id v16 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a3, a4);
    if ([v16 rangeOfCharacterFromSet:*(void *)(a1 + 64)] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 56) setString:v16];
      unint64_t v17 = [*(id *)(a1 + 56) string];
      v24[0] = 0;
      v24[1] = [v17 length];

      uint64_t v18 = [*(id *)(a1 + 56) tagAtIndex:0 unit:0 scheme:*MEMORY[0x263F082A8] tokenRange:v24];
      if (v18)
      {
        uint64_t v19 = v18;
        if ([v18 isEqualToString:@"und"])
        {
          uint64_t v20 = v19;
        }
        else
        {
          uint64_t v20 = [*(id *)(a1 + 112) languageForLocaleIdentifier:v19];

          if ([*(id *)(a1 + 40) containsObject:v20])
          {
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v20];
          }
          else
          {
            id v21 = [*(id *)(a1 + 56) tagAtIndex:0 unit:0 scheme:*MEMORY[0x263F082C0] tokenRange:v24];
            id v22 = v21;
            if (v10
              && (!v21
               || ([v21 isEqualToString:*MEMORY[0x263F08260]] & 1) != 0
               || [v22 isEqualToString:*MEMORY[0x263F08270]]))
            {
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v10];
            }
          }
        }
      }
      else
      {
        uint64_t v20 = 0;
      }

      goto LABEL_35;
    }
    goto LABEL_23;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v10];
LABEL_35:
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count] >= *(void *)(a1 + 144)) {
    *a5 = 1;
  }
LABEL_37:
}

+ (id)dominantLanguageTagFromLanguageTags:(id)a3 withMinimumCount:(unint64_t)a4 withMinimumAgreement:(double)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 count] >= a4 && objc_msgSend(v7, "count"))
  {
    if ([v7 count] == 1)
    {
      id v8 = [v7 firstObject];
    }
    else
    {
      unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v7];
      if ([v10 count] == 1)
      {
        id v8 = [v7 firstObject];
      }
      else if ((unint64_t)[v10 count] <= 2)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        int v23 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = 0;
          unint64_t v15 = 0;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v11);
              }
              uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              unint64_t v19 = [v11 countForObject:v18];
              if (v19 >= v15)
              {
                unint64_t v20 = v19;
                id v21 = v18;

                uint64_t v14 = v21;
                unint64_t v15 = v20;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v13);
        }
        else
        {
          uint64_t v14 = 0;
          unint64_t v15 = 0;
        }

        unint64_t v22 = [v7 count];
        if (v15 >= a4 && (double)v15 / (double)v22 >= a5) {
          id v8 = v14;
        }
        else {
          id v8 = 0;
        }
        unint64_t v10 = v23;
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)dominantLanguageTagFromLanguageTags:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() dominantLanguageTagFromLanguageTags:v3 withMinimumCount:0 withMinimumAgreement:0.6];

  return v4;
}

+ (id)dominantLanguageTagFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5 withMinimumCount:(unint64_t)a6 withMinimumAgreement:(double)a7
{
  id v11 = a3;
  uint64_t v12 = [(id)objc_opt_class() languageTagsFromText:v11 withMaxLength:a4 withMaxTags:a5];

  uint64_t v13 = [(id)objc_opt_class() dominantLanguageTagFromLanguageTags:v12 withMinimumCount:a6 withMinimumAgreement:a7];

  return v13;
}

+ (id)dominantLanguageTagFromText:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() dominantLanguageTagFromText:v3 withMaxLength:30 withMaxTags:8 withMinimumCount:0 withMinimumAgreement:0.6];

  return v4;
}

+ (id)detectLanguageFromLanguageTags:(id)a3 withMinimumCount:(unint64_t)a4 withMinimumAgreement:(double)a5
{
  id v8 = a3;
  if ([v8 count]) {
    [a1 dominantLanguageTagFromLanguageTags:v8 withMinimumCount:a4 withMinimumAgreement:a5];
  }
  else {
  id v9 = [(id)objc_opt_class() defaultLanguage];
  }

  return v9;
}

+ (id)detectLanguageFromLanguageTags:(id)a3
{
  id v3 = [a1 dominantLanguageTagFromLanguageTags:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() defaultLanguage];
  }
  v6 = v5;

  return v6;
}

+ (id)detectLanguageFromText:(id)a3 withMaxLength:(unint64_t)a4 withMaxTags:(unint64_t)a5 withMinimumCount:(unint64_t)a6 withMinimumAgreement:(double)a7
{
  id v11 = a3;
  uint64_t v12 = [(id)objc_opt_class() dominantLanguageTagFromText:v11 withMaxLength:a4 withMaxTags:a5 withMinimumCount:a6 withMinimumAgreement:a7];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [(id)objc_opt_class() defaultLanguage];
  }
  uint64_t v14 = v13;

  return v14;
}

+ (id)detectLanguageFromText:(id)a3
{
  id v3 = [a1 dominantLanguageTagFromText:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() defaultLanguage];
  }
  v6 = v5;

  return v6;
}

+ (id)defaultLanguage
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 objectForKey:*MEMORY[0x263EFF500]];

  if (v3 && (unint64_t)[v3 length] >= 2)
  {
    v4 = +[SGLanguageDetection languageForLocaleIdentifier:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end