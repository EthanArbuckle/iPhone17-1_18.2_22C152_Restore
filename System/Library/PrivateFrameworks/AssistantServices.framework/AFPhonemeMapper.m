@interface AFPhonemeMapper
+ (id)_buildRegexMatchingSubstrings:(id)a3;
+ (id)_mapForLanguageCode:(id)a3;
- (AFPhonemeMapper)initWithLanguageCode:(id)a3;
- (id)stringByReplacingPhonemesInString:(id)a3;
@end

@implementation AFPhonemeMapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_phonemeMap, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (id)stringByReplacingPhonemesInString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v4, "length"));
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3010000000;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    v24 = &unk_19D139ADD;
    regex = self->_regex;
    uint64_t v7 = [v4 length];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __53__AFPhonemeMapper_stringByReplacingPhonemesInString___block_invoke;
    v16 = &unk_1E59255C0;
    v20 = &v21;
    id v8 = v5;
    id v17 = v8;
    id v9 = v4;
    id v18 = v9;
    v19 = self;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](regex, "enumerateMatchesInString:options:range:usingBlock:", v9, 0, 0, v7, &v13);
    v10 = objc_msgSend(v9, "substringFromIndex:", v22[5] + v22[4], v13, v14, v15, v16);
    [v8 appendString:v10];

    id v11 = v8;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __53__AFPhonemeMapper_stringByReplacingPhonemesInString___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 range];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v3;
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
       + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
    if (v3 >= v6)
    {
      uint64_t v7 = v4;
      id v8 = *(void **)(a1 + 32);
      id v9 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v6, v3 - v6);
      [v8 appendString:v9];

      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v5, v7);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        uint64_t v10 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKey:v15];
        id v11 = v15;
        v12 = (void *)v10;
      }
      else
      {
        id v11 = 0;
        v12 = 0;
      }
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v11;
      }
      if (v13) {
        objc_msgSend(*(id *)(a1 + 32), "appendString:");
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      *(void *)(v14 + 32) = v5;
      *(void *)(v14 + 40) = v7;
    }
  }
}

- (AFPhonemeMapper)initWithLanguageCode:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFPhonemeMapper;
  unint64_t v5 = [(AFPhonemeMapper *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v6;

    uint64_t v8 = +[AFPhonemeMapper _mapForLanguageCode:v5->_languageCode];
    phonemeMap = v5->_phonemeMap;
    v5->_phonemeMap = (NSDictionary *)v8;

    uint64_t v10 = v5->_phonemeMap;
    if (v10)
    {
      id v11 = [(NSDictionary *)v10 allKeys];
      uint64_t v12 = +[AFPhonemeMapper _buildRegexMatchingSubstrings:v11];
      regex = v5->_regex;
      v5->_regex = (NSRegularExpression *)v12;
    }
    else
    {
      id v11 = v5;
      unint64_t v5 = 0;
    }
  }
  return v5;
}

+ (id)_buildRegexMatchingSubstrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28FD8], "escapedPatternForString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v4 appendString:v10];

          [v4 appendString:@"|"];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v4 replaceCharactersInRange:objc_msgSend(v4, "length") - 1, 1, @"" withString]);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v4 options:0 error:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_mapForLanguageCode:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F28B50];
    id v4 = a3;
    id v5 = [v3 bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 pathForResource:v4 ofType:@"plist" inDirectory:@"PhonemeMaps"];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

@end