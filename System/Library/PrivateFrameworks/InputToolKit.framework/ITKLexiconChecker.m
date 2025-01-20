@interface ITKLexiconChecker
+ (BOOL)englishLexiconCheck:(id)a3;
+ (BOOL)isStringEnglish:(id)a3;
+ (id)createEnglishNormalizedString:(id)a3;
@end

@implementation ITKLexiconChecker

+ (BOOL)englishLexiconCheck:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v55 = a3;
  if (!v55
    || (long long v69 = 0u,
        long long v70 = 0u,
        long long v67 = 0u,
        long long v68 = 0u,
        (uint64_t v3 = [&unk_2702F85D8 countByEnumeratingWithState:&v67 objects:v82 count:16]) == 0))
  {
    BOOL v50 = 0;
    goto LABEL_112;
  }
  uint64_t v53 = *MEMORY[0x263F51318];
  uint64_t v54 = *(void *)v68;
  *(void *)&long long v4 = 138543618;
  long long v52 = v4;
  do
  {
    uint64_t v59 = 0;
    uint64_t v60 = v3;
    do
    {
      if (*(void *)v68 != v54) {
        objc_enumerationMutation(&unk_2702F85D8);
      }
      uint64_t v5 = *(void *)(*((void *)&v67 + 1) + 8 * v59);
      v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buffer = 138543362;
        *(void *)&buffer[4] = v5;
        _os_log_debug_impl(&dword_252A65000, v6, OS_LOG_TYPE_DEBUG, "Checking %{public}@ for token membership", buffer, 0xCu);
      }

      id v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v5];
      id v56 = v55;
      if (_lexiconCheckForLocale(NSLocale *,NSString *)::onceToken != -1) {
        dispatch_once(&_lexiconCheckForLocale(NSLocale *,NSString *)::onceToken, &__block_literal_global_1);
      }
      id v64 = v7;
      if (_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::onceToken != -1) {
        dispatch_once(&_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::onceToken, &__block_literal_global_33);
      }
      objc_msgSend((id)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::cacheAccessLock, "lock", v52);
      v8 = (void *)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::lexiconSingletonCache;
      v9 = [v64 localeIdentifier];
      v62 = [v8 objectForKeyedSubscript:v9];

      [(id)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::cacheAccessLock unlock];
      if (!v62)
      {
        uint64_t v75 = 0;
        uint64_t v87 = v53;
        v10 = [v64 localeIdentifier];
        v86.__begin_ = v10;
        v11 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v87 count:1];
        uint64_t v63 = LXLexiconCreate();

        if (!v63 || v75)
        {
          v47 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v48 = [v64 localeIdentifier];
            *(_DWORD *)buffer = v52;
            *(void *)&buffer[4] = v48;
            *(_WORD *)&buffer[12] = 2114;
            *(void *)&buffer[14] = v75;
            _os_log_error_impl(&dword_252A65000, v47, OS_LOG_TYPE_ERROR, "Failed to load lexicon for locale identifier: %{public}@: %{public}@", buffer, 0x16u);
          }
          goto LABEL_102;
        }
        [(id)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::cacheAccessLock lock];
        v12 = (void *)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::lexiconSingletonCache;
        v13 = [v64 localeIdentifier];
        [v12 setObject:v63 forKeyedSubscript:v13];

        [(id)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::cacheAccessLock unlock];
      }

      id v14 = v56;
      v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v57 = v14;
      v16 = [v14 stringByTrimmingCharactersInSet:v15];

      id v58 = v16;
      if (v58)
      {
        v17 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v18 = [v58 componentsSeparatedByCharactersInSet:v17];
      }
      else
      {
        v18 = (void *)MEMORY[0x263EFFA68];
      }

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = v18;
      uint64_t v19 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
      if (!v19)
      {

LABEL_111:
        BOOL v50 = 1;
        goto LABEL_112;
      }
      uint64_t v66 = *(void *)v79;
      char v61 = 1;
LABEL_22:
      uint64_t v20 = 0;
      while (2)
      {
        if (*(void *)v79 != v66) {
          objc_enumerationMutation(obj);
        }
        v21 = *(NSString **)(*((void *)&v78 + 1) + 8 * v20);
        uint64_t v75 = 0;
        v76[0] = &v75;
        v76[1] = 0x3032000000;
        v76[2] = __Block_byref_object_copy__0;
        v76[3] = __Block_byref_object_dispose__0;
        _tokenByNormalizingString(v21);
        id v77 = (id)objc_claimAutoreleasedReturnValue();
        if (![*(id *)(v76[0] + 40) length])
        {
LABEL_92:
          _Block_object_dispose(&v75, 8);

          goto LABEL_99;
        }
        v22 = (__CFString *)*(id *)(v76[0] + 40);
        if (_isStringEntirelyPunctuationWhitespaceOrNumeric(NSString *)::onceToken != -1) {
          dispatch_once(&_isStringEntirelyPunctuationWhitespaceOrNumeric(NSString *)::onceToken, &__block_literal_global_38);
        }
        uint64_t v23 = [(__CFString *)v22 length];
        std::vector<unsigned int>::vector(&v86, v23 + 1);
        std::vector<unsigned int>::pointer begin = v86.__begin_;
        BOOL v25 = v23 == -1 || v22 == 0;
        if (v25 || v86.__begin_ == 0) {
          goto LABEL_86;
        }
        CFIndex Length = CFStringGetLength(v22);
        CFStringRef theString = v22;
        uint64_t v93 = 0;
        CFIndex v94 = Length;
        CharactersPtr = CFStringGetCharactersPtr(v22);
        v28 = CharactersPtr ? 0 : CFStringGetCStringPtr(v22, 0x600u);
        v92 = v28;
        int64_t v95 = 0;
        int64_t v96 = 0;
        if (Length < 1)
        {
LABEL_86:
          BOOL v43 = 0;
          goto LABEL_87;
        }
        CFIndex v29 = 0;
        int64_t v30 = 0;
        int64_t v31 = 0;
        unint64_t v32 = 0;
        do
        {
          if (v31 < 0 || v94 <= v31)
          {
            UniChar v33 = 0;
LABEL_59:
            int v38 = v33;
LABEL_60:
            begin[v32++] = v38;
            CFIndex v36 = v31 + 1;
            goto LABEL_61;
          }
          if (CharactersPtr)
          {
            UniChar v33 = CharactersPtr[v93 + v31];
          }
          else if (v92)
          {
            UniChar v33 = v92[v93 + v31];
          }
          else
          {
            if (v96 <= v31 || v30 > v31)
            {
              int64_t v34 = v31 - 4;
              if ((unint64_t)v31 < 4) {
                int64_t v34 = 0;
              }
              CFIndex v35 = v34 + 64;
              if (v34 + 64 >= v94) {
                CFIndex v35 = v94;
              }
              int64_t v95 = v34;
              int64_t v96 = v35;
              v98.location = v93 + v34;
              v98.length = v35 - v34;
              CFStringGetCharacters(theString, v98, (UniChar *)buffer);
              CFIndex v29 = v95;
            }
            UniChar v33 = *(_WORD *)&buffer[2 * (v31 - v29)];
            int64_t v30 = v29;
          }
          CFIndex v36 = v31 + 1;
          BOOL v37 = v33 >> 10 == 54 && v36 < Length;
          if (!v37) {
            goto LABEL_59;
          }
          if (v94 > v36)
          {
            if (CharactersPtr)
            {
              UniChar v39 = CharactersPtr[v93 + v36];
            }
            else if (v92)
            {
              UniChar v39 = v92[v93 + v36];
            }
            else
            {
              if (v96 <= v36 || v29 > v36)
              {
                int64_t v40 = v31 - 3;
                if ((unint64_t)v31 < 3) {
                  int64_t v40 = 0;
                }
                CFIndex v41 = v40 + 64;
                if (v40 + 64 >= v94) {
                  CFIndex v41 = v94;
                }
                int64_t v95 = v40;
                int64_t v96 = v41;
                v99.location = v93 + v40;
                v99.length = v41 - v40;
                CFStringGetCharacters(theString, v99, (UniChar *)buffer);
                CFIndex v29 = v95;
              }
              UniChar v39 = *(_WORD *)&buffer[2 * (v36 - v29)];
              int64_t v30 = v29;
            }
            if (v39 >> 10 == 55)
            {
              int v38 = (v33 << 10) + v39 - 56613888;
              ++v31;
              goto LABEL_60;
            }
          }
LABEL_61:
          if (v36 >= Length) {
            break;
          }
          BOOL v25 = v31 == v23;
          int64_t v31 = v36;
        }
        while (!v25);
        BOOL v37 = v36 < Length;
        uint64_t v3 = v60;
        if (v37 || !v32) {
          goto LABEL_86;
        }
        uint64_t v42 = 0;
        BOOL v43 = 1;
        do
        {
          if (([(id)_isStringEntirelyPunctuationWhitespaceOrNumeric(NSString *)::__characterSet longCharacterIsMember:v86.__begin_[v42]] & 1) == 0)break; {
          BOOL v43 = ++v42 < v32;
          }
        }
        while (v32 != v42);
LABEL_87:
        if (v86.__begin_)
        {
          v86.__end_ = v86.__begin_;
          operator delete(v86.__begin_);
        }

        if (!v43) {
          goto LABEL_92;
        }
        *(void *)buffer = 0;
        *(void *)&buffer[8] = buffer;
        *(void *)&buffer[16] = 0x2020000000;
        char v89 = 0;
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = ___ZL22_lexiconCheckForLocaleP8NSLocaleP8NSString_block_invoke_30;
        v71[3] = &unk_26538CF08;
        v73 = &v75;
        id v72 = v64;
        v74 = buffer;
        v44 = (void *)MEMORY[0x2533C7080](v71);
        LXLexiconEnumerateEntriesForString();
        if (*(unsigned char *)(*(void *)&buffer[8] + 24))
        {
          int v45 = 0;
          char v61 = 1;
        }
        else
        {
          LXLexiconEnumerateEntriesForString();
          if (*(unsigned char *)(*(void *)&buffer[8] + 24))
          {
            int v45 = 1;
          }
          else
          {
            v46 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
              +[ITKLexiconChecker englishLexiconCheck:](buf, (uint64_t)v76, &v84, v46);
            }

            int v45 = 0;
            char v61 = 0;
          }
        }

        _Block_object_dispose(buffer, 8);
        _Block_object_dispose(&v75, 8);

        if (v45)
        {
LABEL_99:
          if (++v20 != v19) {
            continue;
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v78 objects:v85 count:16];
          if (!v19) {
            break;
          }
          goto LABEL_22;
        }
        break;
      }

      if (v61) {
        goto LABEL_111;
      }
LABEL_102:
      ++v59;
    }
    while (v59 != v3);
    uint64_t v49 = [&unk_2702F85D8 countByEnumeratingWithState:&v67 objects:v82 count:16];
    uint64_t v3 = v49;
    BOOL v50 = 0;
  }
  while (v49);
LABEL_112:

  return v50;
}

+ (BOOL)isStringEnglish:(id)a3
{
  id v4 = a3;
  if (v4) {
    char v5 = [a1 englishLexiconCheck:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)createEnglishNormalizedString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];

    id v8 = v7;
    v9 = v8;
    if (v8)
    {
      v10 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@" "];
    }
    else
    {
      v10 = &stru_2702F71A0;
    }

    _tokenByNormalizingString(&v10->isa);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_2702F71A0;
  }

  return v11;
}

+ (void)englishLexiconCheck:(void *)a3 .cold.1(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_debug_impl(&dword_252A65000, log, OS_LOG_TYPE_DEBUG, "[Lexicon Check]: '%@' failed the lexicon check", buf, 0xCu);
}

@end