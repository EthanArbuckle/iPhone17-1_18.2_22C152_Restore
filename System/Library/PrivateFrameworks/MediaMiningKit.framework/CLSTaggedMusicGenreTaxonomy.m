@interface CLSTaggedMusicGenreTaxonomy
+ (id)_additionalMusicGenres;
+ (id)_taggedMusicGenres;
+ (id)taggedGenreForGenre:(id)a3 isExactMatch:(BOOL *)a4;
@end

@implementation CLSTaggedMusicGenreTaxonomy

+ (id)_additionalMusicGenres
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CLSTaggedMusicGenreTaxonomy__additionalMusicGenres__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_additionalMusicGenres_onceToken != -1) {
    dispatch_once(&_additionalMusicGenres_onceToken, block);
  }
  v2 = (void *)s_additionalMusicGenres;
  return v2;
}

void __53__CLSTaggedMusicGenreTaxonomy__additionalMusicGenres__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = readGenresFromDictionaryInBundleWithKey(v2, @"additionalGenres");
  v1 = (void *)s_additionalMusicGenres;
  s_additionalMusicGenres = v0;
}

+ (id)_taggedMusicGenres
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CLSTaggedMusicGenreTaxonomy__taggedMusicGenres__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_taggedMusicGenres_onceToken != -1) {
    dispatch_once(&_taggedMusicGenres_onceToken, block);
  }
  id v2 = (void *)s_taggedMusicGenres;
  return v2;
}

void __49__CLSTaggedMusicGenreTaxonomy__taggedMusicGenres__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = readGenresFromDictionaryInBundleWithKey(v2, @"taggedGenres");
  v1 = (void *)s_taggedMusicGenres;
  s_taggedMusicGenres = v0;
}

+ (id)taggedGenreForGenre:(id)a3 isExactMatch:(BOOL *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a4) {
    v4 = a4;
  }
  else {
    v4 = (BOOL *)&v41;
  }
  BOOL *v4 = 0;
  v5 = (void *)MEMORY[0x1E4F8A9D0];
  v6 = [a3 lowercaseString];
  v7 = [v5 stringWithoutDiacriticsFromString:v6];

  v8 = [(id)objc_opt_class() _taggedMusicGenres];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  if (v9)
  {
    v10 = (void *)v9;
    BOOL *v4 = 1;
  }
  else
  {
    v11 = [(id)objc_opt_class() _additionalMusicGenres];
    uint64_t v12 = [v11 objectForKeyedSubscript:v7];
    if (v12)
    {
      v10 = (void *)v12;
      BOOL *v4 = 0;
    }
    else
    {
      v36 = v11;
      id v13 = v7;
      v14 = [MEMORY[0x1E4F28E58] whitespaceCharacterSet];
      [v14 addCharactersInString:@"-"];
      v34 = v14;
      v35 = v13;
      v15 = [v13 componentsSeparatedByCharactersInSet:v14];
      id v46 = 0;
      v16 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\W" options:1 error:&v46];
      id v33 = v46;
      v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            uint64_t v24 = [v23 length];
            if (objc_msgSend(v16, "numberOfMatchesInString:options:range:", v23, 0, 0, v24) != v24) {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v20);
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v25 = v17;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v38;
        v11 = v36;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            uint64_t v31 = [v8 objectForKeyedSubscript:v30];
            if (!v31)
            {
              uint64_t v31 = [v36 objectForKeyedSubscript:v30];
              if (!v31) {
                continue;
              }
            }
            v10 = (void *)v31;
            goto LABEL_29;
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v47 count:16];
          v10 = 0;
          if (v27) {
            continue;
          }
          break;
        }
      }
      else
      {
        v10 = 0;
        v11 = v36;
      }
LABEL_29:
    }
  }

  return v10;
}

@end