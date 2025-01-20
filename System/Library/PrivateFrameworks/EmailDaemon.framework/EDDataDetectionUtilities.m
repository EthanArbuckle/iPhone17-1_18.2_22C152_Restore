@interface EDDataDetectionUtilities
+ (BOOL)_isRealWord:(id)a3 locale:(id)a4;
+ (BOOL)isRealWord:(id)a3;
+ (id)detectOneTimeCodeWithDataDetectors:(id)a3;
+ (id)extractOneTimeCode:(id)a3 withSubject:(id)a4;
+ (id)log;
+ (void)_lexiconEnumerateEntries:(_LXLexicon *)a3 forString:(id)a4 completionHandler:(id)a5;
@end

@implementation EDDataDetectionUtilities

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDDataDetectionUtilities_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_31 != -1) {
    dispatch_once(&log_onceToken_31, block);
  }
  v2 = (void *)log_log_31;

  return v2;
}

void __31__EDDataDetectionUtilities_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_31;
  log_log_31 = (uint64_t)v1;
}

+ (void)_lexiconEnumerateEntries:(_LXLexicon *)a3 forString:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  LXLexiconEnumerateEntriesForString();
}

uint64_t __81__EDDataDetectionUtilities__lexiconEnumerateEntries_forString_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = LXEntryCopyString();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

+ (BOOL)_isRealWord:(id)a3 locale:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDDataDetectionUtilities__isRealWord_locale___block_invoke;
  aBlock[3] = &unk_1E6C00E50;
  id v8 = v6;
  id v18 = v8;
  v19 = &v20;
  v9 = _Block_copy(aBlock);
  id v10 = v7;
  uint64_t v26 = *MEMORY[0x1E4F72458];
  v27[0] = v10;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v24 = 0;
  v11 = (const void *)LXLexiconCreate();
  if (v11)
  {

    [a1 _lexiconEnumerateEntries:v11 forString:v8 completionHandler:v9];
    CFRelease(v11);
  }
  else
  {
    v12 = v24;
    v13 = +[EDDataDetectionUtilities log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(v12, "ef_publicDescription");
      +[EDDataDetectionUtilities _isRealWord:buf locale:v13];
    }
  }
  BOOL v15 = *((unsigned char *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v15;
}

uint64_t __47__EDDataDetectionUtilities__isRealWord_locale___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  *a3 = 1;
  return result;
}

+ (BOOL)isRealWord:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = [v5 localeIdentifier];

  int v7 = [(__CFString *)v6 hasPrefix:@"en"];
  char v8 = v7;
  if (v7) {
    v9 = v6;
  }
  else {
    v9 = @"en";
  }
  id v10 = v9;
  if ([a1 _isRealWord:v4 locale:v10])
  {
    v11 = +[EDDataDetectionUtilities log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      v12 = "This current paragraph does not contain a valid code since %@ is a real English word";
      v13 = v11;
      uint32_t v14 = 12;
LABEL_7:
      _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    if ((v8 & 1) != 0 || ![a1 _isRealWord:v4 locale:v6])
    {
      BOOL v15 = 0;
      goto LABEL_14;
    }
    v11 = +[EDDataDetectionUtilities log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      v12 = "This current paragraph does not contain a valid code since %@ is a real word in this language: %@";
      v13 = v11;
      uint32_t v14 = 22;
      goto LABEL_7;
    }
  }

  BOOL v15 = 1;
LABEL_14:

  return v15;
}

+ (id)detectOneTimeCodeWithDataDetectors:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v36 = v5;
  unint64_t v6 = [v5 length];
  if (v6 >= 0x1F4) {
    uint64_t v7 = 500;
  }
  else {
    uint64_t v7 = v6;
  }
  if (v7)
  {
    v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F5F160]) initWithScannerType:0 passiveIntent:1];
    [MEMORY[0x1E4F5F158] scanString:v5 range:0 configuration:v7];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v39;
      uint64_t v11 = *MEMORY[0x1E4F5EF80];
      id v3 = "Skipping one-time code with length %ld";
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v4 = [v13 type];
          int v14 = [v4 isEqualToString:v11];

          if (v14)
          {
            BOOL v15 = [v13 value];
            BOOL v16 = (unint64_t)[v15 length] < 0xA;

            if (v16)
            {
              id v4 = [v13 value];
              [v37 addObject:v4];
            }
            else
            {
              id v4 = +[EDDataDetectionUtilities log];
              if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
              {
                int v17 = [v13 value];
                uint64_t v18 = [v17 length];
                *(_DWORD *)buf = 134217984;
                uint64_t v43 = v18;
                _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Skipping one-time code with length %ld", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v9);
    }

    if (![v37 count])
    {
      v33 = +[EDDataDetectionUtilities log];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v33, OS_LOG_TYPE_DEFAULT, "No one-time codes detected using data detectors", buf, 2u);
      }
      v29 = 0;
      goto LABEL_38;
    }
    __int16 v19 = [v37 ef_filter:&__block_literal_global_19];
    if ([v19 count])
    {
      unint64_t v20 = [v19 count];
      if (v20 < [v37 count])
      {
        uint64_t v21 = +[EDDataDetectionUtilities log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v37 count];
          uint64_t v23 = [v19 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v43 = v22;
          __int16 v44 = 2048;
          uint64_t v45 = v23;
          _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu potential codes, filtered down to %lu codes.", buf, 0x16u);
        }

        uint64_t v24 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v19];
        v37 = v24;
      }
    }
    unint64_t v25 = [v37 count];
    if (v25 < 2
      || ([v37 firstObject],
          id v3 = (char *)objc_claimAutoreleasedReturnValue(),
          unint64_t v26 = [v3 length],
          [v37 objectAtIndexedSubscript:1],
          id v4 = objc_claimAutoreleasedReturnValue(),
          v26 >= [v4 length]))
    {
      v27 = [v37 firstObject];
      if (v25 < 2)
      {
LABEL_32:
        v30 = +[EDDataDetectionUtilities log];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = [v37 count];
          v32 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v27];
          *(_DWORD *)buf = 134218242;
          uint64_t v43 = v31;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v32;
          _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "We found %lu potential One-Time Code(s) in this email, the One-Time Code to use is : %@", buf, 0x16u);
        }
        v33 = v27;

        v29 = v33;
LABEL_38:

        v28 = v37;
        goto LABEL_39;
      }
    }
    else
    {
      v27 = [v37 objectAtIndexedSubscript:1];
    }

    goto LABEL_32;
  }
  v28 = +[EDDataDetectionUtilities log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "No valid string sent to data detectors", buf, 2u);
  }
  v29 = 0;
LABEL_39:

  return v29;
}

BOOL __63__EDDataDetectionUtilities_detectOneTimeCodeWithDataDetectors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] == 8 || objc_msgSend(v2, "length") == 6;

  return v3;
}

+ (id)extractOneTimeCode:(id)a3 withSubject:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v43 = v5;
  long long v40 = v6;
  if (v5)
  {
    uint64_t v7 = v5;
    if (v6)
    {
      id v8 = [NSString stringWithFormat:@"%@\n%@", v6, v5];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = +[EDDataDetectionUtilities log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[EDDataDetectionUtilities extractOneTimeCode:withSubject:](v9);
    }

    uint64_t v7 = v40;
  }
  id v8 = v7;
LABEL_8:
  long long v39 = v8;
  uint64_t v10 = +[EDDataDetectionUtilities detectOneTimeCodeWithDataDetectors:](EDDataDetectionUtilities, "detectOneTimeCodeWithDataDetectors:");
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v34 = +[EDOTCKeywords localizedExpressionStrings];
    if ([v34 count])
    {
      v37 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      v32 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"-"];
      v13 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
      [v32 formUnionWithCharacterSet:v13];

      long long v41 = [MEMORY[0x1E4F28FE8] scannerWithString:v5];
      uint64_t v38 = 0;
      int v14 = 0;
      BOOL v15 = 0;
      char v33 = 0;
      v36 = 0;
      while (([v41 isAtEnd] & 1) == 0)
      {
        id v48 = v15;
        [v41 scanUpToCharactersFromSet:v37 intoString:&v48];
        id v42 = v48;

        BOOL v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        int v17 = [v42 stringByTrimmingCharactersInSet:v16];

        if ([v17 length])
        {
          if (v33)
          {
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v18 = v34;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v51 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v45;
              while (2)
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v45 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                  uint64_t v23 = [NSString stringWithFormat:@"%@,%@", v14, v17];
                  if ([v23 rangeOfString:v22 options:1025] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v28 = +[EDDataDetectionUtilities log];
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v50 = v22;
                      _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "Mail detected a one-time code with keyword: %@", buf, 0xCu);
                    }

                    id v5 = v43;
                    v36 = v36;

                    v12 = v36;
                    goto LABEL_45;
                  }

                  id v5 = v43;
                }
                uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v51 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }
          }
          if ((unint64_t)([v17 length] - 4) > 5
            || ([a1 isRealWord:v17] & 1) != 0)
          {
            uint64_t v24 = v14;
            int v14 = v17;
          }
          else
          {
            unint64_t v25 = [v17 stringByTrimmingCharactersInSet:v32];
            char v33 = [v25 isEqualToString:&stru_1F3583658];

            uint64_t v24 = v36;
            v36 = v17;
          }
          unint64_t v26 = v17;

          ++v38;
        }

        id v27 = v42;
        BOOL v15 = v42;
        if (v38 == 10) {
          goto LABEL_38;
        }
      }
      id v27 = v15;
LABEL_38:
      id v42 = v27;
      if (([v41 isAtEnd] & 1) == 0)
      {
        v30 = +[EDDataDetectionUtilities log];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v50 = 10;
          _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "Mail stopped scanning the message after line %lu", buf, 0xCu);
        }
      }
      int v17 = +[EDDataDetectionUtilities log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "No one-time code detected using our heuristics", buf, 2u);
      }
      v12 = 0;
LABEL_45:
    }
    else
    {
      v29 = +[EDDataDetectionUtilities log];
      v37 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        +[EDDataDetectionUtilities extractOneTimeCode:withSubject:](v29);
      }
      v12 = 0;
      v36 = 0;
    }

    uint64_t v11 = 0;
  }

  return v12;
}

+ (void)_isRealWord:(uint8_t *)buf locale:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ LXLexiconRef: %{public}@", buf, 0x16u);
}

+ (void)extractOneTimeCode:(os_log_t)log withSubject:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "We could not load the OTC keywords json file. See Previous logs for more info.", v1, 2u);
}

+ (void)extractOneTimeCode:(os_log_t)log withSubject:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "We are unable to read plain text from the email", v1, 2u);
}

@end