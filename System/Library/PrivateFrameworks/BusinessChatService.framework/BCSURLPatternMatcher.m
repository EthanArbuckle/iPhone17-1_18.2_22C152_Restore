@interface BCSURLPatternMatcher
- (BOOL)isAnyMatchFoundForPathPattern:(id)a3 countOfPathComponents:(int64_t *)a4 error:(id *)a5;
- (BOOL)isValidDomainForURL:(id)a3 domainBundleIDPatterns:(id)a4;
- (id)dictionaryFromQueryString:(id)a3 orderedKeys:(id *)a4;
- (id)extractedPathForAnyMatchUsingScanner:(id)a3 delimiter:(id)a4 extractedPath:(id)a5 countOfPathComponentsToMatch:(unint64_t)a6;
- (id)extractedPathForExactMatchUsingScanner:(id)a3 delimiter:(id)a4 extractedPath:(id)a5 patternPathComponent:(id)a6;
- (id)extractedQueryByAddingKey:(id)a3 value:(id)a4 toExtractedQuery:(id)a5;
- (id)extractedURLForOriginalURL:(id)a3 originalURLPathComponents:(id)a4 extractedPath:(id)a5 extractedQuery:(id)a6;
- (id)matchPattern:(id)a3 withURL:(id)a4 forBundleID:(id)a5 expirationDate:(id)a6 error:(id *)a7;
- (id)orderedKeysForPatternQuery:(id)a3 originalURLQuery:(id)a4 orderedOriginalURLQueryKeys:(id)a5;
@end

@implementation BCSURLPatternMatcher

- (BOOL)isValidDomainForURL:(id)a3 domainBundleIDPatterns:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5) {
    goto LABEL_5;
  }
  v8 = [v6 domain];
  uint64_t v9 = [v8 length];

  if (!v9) {
    goto LABEL_5;
  }
  v10 = [v7 bundleIdPatterns];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [MEMORY[0x263F08BA0] componentsWithURL:v5 resolvingAgainstBaseURL:1];
    v13 = [v12 host];
    v14 = [v7 domain];
    char v15 = [v13 isEqualToString:v14];
  }
  else
  {
LABEL_5:
    char v15 = 0;
  }

  return v15;
}

- (id)matchPattern:(id)a3 withURL:(id)a4 forBundleID:(id)a5 expirationDate:(id)a6 error:(id *)a7
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12 && v13)
  {
    v16 = [v12 path];
    v17 = [v12 query];
    v18 = v17;
    if (!v16 && ![v17 length])
    {
      v38 = ABSLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[BCSURLPatternMatcher matchPattern:withURL:forBundleID:expirationDate:error:]";
        _os_log_impl(&dword_2154F4000, v38, OS_LOG_TYPE_DEFAULT, "%s No match since no path or query pattern provided", buf, 0xCu);
      }
      v37 = 0;
      goto LABEL_70;
    }
    v19 = [MEMORY[0x263F08BA0] componentsWithURL:v13 resolvingAgainstBaseURL:1];
    v20 = [v19 percentEncodedPath];
    v70 = [v19 percentEncodedQuery];
    v66 = v18;
    v67 = v20;
    if ([v16 length])
    {
      v58 = a7;
      v21 = v16;
      v22 = &stru_26C611188;
      if (*(unsigned char *)[v21 UTF8String] != 47)
      {
        v37 = 0;
        v38 = &stru_26C611188;
        goto LABEL_65;
      }
      v65 = v19;
      id v60 = v14;
      id v23 = v20;
      if (*(unsigned char *)[v23 UTF8String] == 47) {
        v24 = @"/";
      }
      else {
        v24 = &stru_26C611188;
      }
      v73 = v24;
      v25 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:");
      v26 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v21];
      [v26 setCharactersToBeSkipped:v25];
      id obj = (id)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v23];
      [obj setCharactersToBeSkipped:v25];
      id v82 = 0;
      v68 = v26;
      LODWORD(v26) = [v26 scanUpToCharactersFromSet:v25 intoString:&v82];
      id v27 = v82;
      v63 = v16;
      if (v26)
      {
        uint64_t v74 = 0;
        uint64_t v75 = 0;
        uint64_t v28 = 0;
        while (1)
        {
          *(void *)buf = 0;
          id v81 = 0;
          BOOL v29 = [(BCSURLPatternMatcher *)self isAnyMatchFoundForPathPattern:v27 countOfPathComponents:buf error:&v81];
          id v30 = v81;
          v31 = v30;
          if (v30) {
            break;
          }
          if (v29)
          {
            uint64_t v32 = [(BCSURLPatternMatcher *)self extractedPathForAnyMatchUsingScanner:obj delimiter:v25 extractedPath:v73 countOfPathComponentsToMatch:*(void *)buf];

            if (!v32) {
              goto LABEL_31;
            }
            uint64_t v28 = 0;
            ++v75;
          }
          else
          {
            uint64_t v32 = [(BCSURLPatternMatcher *)self extractedPathForExactMatchUsingScanner:obj delimiter:v25 extractedPath:v73 patternPathComponent:v27];

            if (!v32)
            {
LABEL_31:
              id v35 = v13;
              v73 = 0;
              goto LABEL_32;
            }
            ++v74;
            ++v28;
          }
          v73 = (__CFString *)v32;
          id v82 = v27;
          char v33 = [v68 scanUpToCharactersFromSet:v25 intoString:&v82];
          id v34 = v82;

          id v27 = v34;
          if ((v33 & 1) == 0)
          {
            id v35 = v13;
            char v36 = 0;
            id v27 = v34;
            goto LABEL_33;
          }
        }
        id v35 = v13;
        if (v58) {
          id *v58 = v30;
        }
LABEL_32:

        char v36 = 1;
      }
      else
      {
        id v35 = v13;
        uint64_t v28 = 0;
        uint64_t v74 = 0;
        uint64_t v75 = 0;
        char v36 = 0;
      }
LABEL_33:

      v18 = v66;
      if (v36)
      {
        v37 = 0;
        v22 = &stru_26C611188;
        id v13 = v35;
        id v14 = v60;
        v16 = v63;
LABEL_67:
        v19 = v65;
        goto LABEL_68;
      }
      uint64_t v69 = v28;
      id v13 = v35;
      id v14 = v60;
      v16 = v63;
      v19 = v65;
      v20 = v67;
    }
    else
    {
      uint64_t v69 = 0;
      uint64_t v74 = 0;
      uint64_t v75 = 0;
      v73 = &stru_26C611188;
    }
    if ([v16 length]
      && [v18 length]
      && ![(__CFString *)v73 isEqualToString:v20]
      || !v16
      && [v18 length]
      && [v20 length]
      && ![v20 isEqualToString:@"/"])
    {
      v37 = 0;
      v22 = &stru_26C611188;
LABEL_68:
      v38 = v73;
      goto LABEL_69;
    }
    id v62 = v15;
    v64 = v16;
    v65 = v19;
    if ([v18 length])
    {
      id v59 = v12;
      v39 = [(BCSURLPatternMatcher *)self dictionaryFromQueryString:v18 orderedKeys:0];
      id v80 = 0;
      v40 = [(BCSURLPatternMatcher *)self dictionaryFromQueryString:v70 orderedKeys:&v80];
      id v57 = v80;
      -[BCSURLPatternMatcher orderedKeysForPatternQuery:originalURLQuery:orderedOriginalURLQueryKeys:](self, "orderedKeysForPatternQuery:originalURLQuery:orderedOriginalURLQueryKeys:", v39, v40);
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obja = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [obja countByEnumeratingWithState:&v76 objects:v83 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        id v61 = v14;
        id v56 = v13;
        uint64_t v43 = *(void *)v77;
        v44 = &stru_26C611188;
        while (2)
        {
          uint64_t v45 = 0;
          v22 = v44;
          do
          {
            if (*(void *)v77 != v43) {
              objc_enumerationMutation(obja);
            }
            uint64_t v46 = *(void *)(*((void *)&v76 + 1) + 8 * v45);
            v47 = [v39 objectForKeyedSubscript:v46];
            v48 = [v40 valueForKey:v46];
            if (![v48 length])
            {
LABEL_58:

              int v49 = 0;
              goto LABEL_59;
            }
            if ([v47 isEqualToString:@"*"])
            {
              ++v75;
            }
            else
            {
              if (![v47 isEqualToString:v48]) {
                goto LABEL_58;
              }
              ++v74;
            }
            v44 = [(BCSURLPatternMatcher *)self extractedQueryByAddingKey:v46 value:v48 toExtractedQuery:v22];

            ++v45;
            v22 = v44;
          }
          while (v42 != v45);
          uint64_t v42 = [obja countByEnumeratingWithState:&v76 objects:v83 count:16];
          if (v42) {
            continue;
          }
          break;
        }
        int v49 = 1;
        v22 = v44;
LABEL_59:
        id v13 = v56;
        id v14 = v61;
        v16 = v64;
      }
      else
      {
        int v49 = 1;
        v22 = &stru_26C611188;
      }

      id v12 = v59;
      if (!v49)
      {
        v37 = 0;
        id v15 = v62;
        v18 = v66;
        goto LABEL_67;
      }
      v19 = v65;
    }
    else
    {
      v22 = &stru_26C611188;
    }
    v50 = [(BCSURLPatternMatcher *)self extractedURLForOriginalURL:v13 originalURLPathComponents:v19 extractedPath:v73 extractedQuery:v22];
    v51 = +[BCSURLNormalizer normalizedURLForURL:v50];
    v52 = [BCSURLPatternMatchResult alloc];
    v53 = [v12 description];
    v54 = objc_alloc_init(BCSDateHelper);
    v37 = [(BCSURLPatternMatchResult *)v52 initWithOriginalURL:v13 extractedURL:v51 totalConsecutivePrefixMatches:v69 totalExactMatches:v74 totalAnyMatches:v75 bundleID:v14 pattern:v53 expirationDate:v62 dateHelper:v54];

    v19 = v65;
    id v15 = v62;
    v38 = v73;

    v16 = v64;
LABEL_65:
    v18 = v66;
LABEL_69:

LABEL_70:
    goto LABEL_71;
  }
  v16 = ABSLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[BCSURLPatternMatcher matchPattern:withURL:forBundleID:expirationDate:error:]";
    _os_log_impl(&dword_2154F4000, v16, OS_LOG_TYPE_DEFAULT, "%s Aborting parsing due to nil argument", buf, 0xCu);
  }
  v37 = 0;
LABEL_71:

  return v37;
}

- (id)extractedPathForAnyMatchUsingScanner:(id)a3 delimiter:(id)a4 extractedPath:(id)a5 countOfPathComponentsToMatch:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (a6)
  {
    while (1)
    {
      id v16 = 0;
      [v9 scanUpToCharactersFromSet:v10 intoString:&v16];
      id v13 = v16;
      if (![v13 length]) {
        break;
      }
      id v14 = [v12 stringByAppendingPathComponent:v13];

      id v12 = v14;
      if (!--a6) {
        goto LABEL_7;
      }
    }

    id v14 = 0;
  }
  else
  {
    id v14 = v11;
  }
LABEL_7:

  return v14;
}

- (id)extractedPathForExactMatchUsingScanner:(id)a3 delimiter:(id)a4 extractedPath:(id)a5 patternPathComponent:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v14 = 0;
  [a3 scanUpToCharactersFromSet:a4 intoString:&v14];
  id v11 = v14;
  if ([v11 length] && !objc_msgSend(v11, "caseInsensitiveCompare:", v10))
  {
    id v12 = [v9 stringByAppendingPathComponent:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)extractedURLForOriginalURL:(id)a3 originalURLPathComponents:(id)a4 extractedPath:(id)a5 extractedQuery:(id)a6
{
  id v9 = a3;
  id v10 = (__CFString *)a5;
  id v11 = (__CFString *)a6;
  id v12 = [a4 percentEncodedQuery];
  id v13 = [v9 scheme];
  if (![v13 length])
  {
    id v23 = 0;
LABEL_13:

    goto LABEL_15;
  }
  id v14 = [v9 host];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    id v16 = NSString;
    v17 = [v9 scheme];
    v18 = [v9 host];
    if ([(__CFString *)v10 length]) {
      v19 = v10;
    }
    else {
      v19 = &stru_26C611188;
    }
    id v13 = [v16 stringWithFormat:@"%@://%@%@", v17, v18, v19];

    if ([v12 length])
    {
      v20 = NSString;
      if ([(__CFString *)v11 length]) {
        v21 = v11;
      }
      else {
        v21 = &stru_26C611188;
      }
      uint64_t v22 = [v20 stringWithFormat:@"%@%@", v13, v21];

      id v13 = (void *)v22;
    }
    id v23 = [NSURL URLWithString:v13];
    goto LABEL_13;
  }
  id v23 = 0;
LABEL_15:

  return v23;
}

- (BOOL)isAnyMatchFoundForPathPattern:(id)a3 countOfPathComponents:(int64_t *)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ((unint64_t)[v7 length] < 3)
  {
    BOOL v18 = 0;
  }
  else
  {
    [v7 length];
    MEMORY[0x270FA5388]();
    id v9 = (_WORD *)((char *)v21 - v8);
    [v7 length];
    MEMORY[0x270FA5388]();
    id v11 = (char *)v21 - v10;
    objc_msgSend(v7, "getCharacters:range:", v9, 0, objc_msgSend(v7, "length"));
    if (*v9 != 91 || v9[[v7 length] - 1] != 93) {
      goto LABEL_16;
    }
    if ((unint64_t)([v7 length] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v12 = 0;
      id v13 = v9 + 1;
      while (1)
      {
        int v14 = (unsigned __int16)v13[v12];
        if ((v14 - 58) <= 0xFFFFFFF5) {
          break;
        }
        uint64_t v15 = v12 + 1;
        *(_WORD *)&v11[2 * v12] = v14;
        uint64_t v16 = [v7 length];
        unint64_t v17 = v12 + 2;
        ++v12;
        if (v17 >= v16 - 1) {
          goto LABEL_11;
        }
      }
      if (a5)
      {
        +[BCSError errorWithDomain:@"com.apple.businessservices" code:41 userInfo:0];
        BOOL v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
LABEL_16:
      BOOL v18 = 0;
      goto LABEL_17;
    }
    uint64_t v15 = 0;
LABEL_11:
    *(_WORD *)&v11[2 * v15] = 0;
    int64_t v19 = strtol(v11, 0, 10);
    if (a4) {
      *a4 = v19;
    }
    BOOL v18 = 1;
  }
LABEL_17:

  return v18;
}

- (id)dictionaryFromQueryString:(id)a3 orderedKeys:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = [a3 componentsSeparatedByString:@"&"];
  [MEMORY[0x263EFF9A0] dictionary];
  v21 = a4;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  }
  else
  {
    id v6 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = @"=";
    do
    {
      uint64_t v11 = 0;
      uint64_t v23 = v8;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v11), "componentsSeparatedByString:", v10, v21);
        if ((unint64_t)[v12 count] >= 2)
        {
          id v13 = [v12 objectAtIndexedSubscript:0];
          [v6 addObject:v13];
          int v14 = [v12 objectAtIndexedSubscript:1];
          [MEMORY[0x263F08708] characterSetWithCharactersInString:@"#"];
          v16 = uint64_t v15 = v10;
          unint64_t v17 = [v14 componentsSeparatedByCharactersInSet:v16];
          [v17 firstObject];
          v19 = BOOL v18 = v6;

          uint64_t v10 = v15;
          [v22 setObject:v19 forKeyedSubscript:v13];

          id v6 = v18;
          uint64_t v8 = v23;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  if (v21) {
    id *v21 = (id)[v6 copy];
  }

  return v22;
}

- (id)extractedQueryByAddingKey:(id)a3 value:(id)a4 toExtractedQuery:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (__CFString *)a5;
  if (![(__CFString *)v9 length])
  {

    uint64_t v9 = @"?";
  }
  if ((unint64_t)[(__CFString *)v9 length] >= 2)
  {
    uint64_t v10 = [(__CFString *)v9 stringByAppendingString:@"&"];

    uint64_t v9 = (__CFString *)v10;
  }
  uint64_t v11 = [(__CFString *)v9 stringByAppendingFormat:@"%@=%@", v7, v8];

  return v11;
}

- (id)orderedKeysForPatternQuery:(id)a3 originalURLQuery:(id)a4 orderedOriginalURLQueryKeys:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        unint64_t v17 = [v7 objectForKeyedSubscript:v16];

        if (v17) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v13);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v18 = objc_msgSend(v7, "allKeys", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        v24 = [v8 objectForKeyedSubscript:v23];

        if (!v24) {
          [v10 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  long long v25 = (void *)[v10 copy];

  return v25;
}

@end