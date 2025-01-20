@interface AVRatingProviders
+ (id)ratingProvidersWithName:(id)a3;
+ (id)shared;
- (AVRatingProviders)init;
- (AVRatingProviders)initWithFileURL:(id)a3;
- (NSDictionary)mapForMovies;
- (NSDictionary)mapForTVShows;
- (NSDictionary)plist;
- (id)_movieMapForRating:(id)a3;
- (id)_tvShowsMapForRating:(id)a3;
- (id)findRatingString:(id)a3;
- (id)findRatingString:(id)a3 domain:(int64_t)a4 country:(id)a5 shouldPreferTVDomain:(BOOL)a6;
- (void)_loadRatingMapsIfNeeded;
- (void)_loadRatingsMaps;
- (void)setPlist:(id)a3;
@end

@implementation AVRatingProviders

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapForTVShows, 0);
  objc_storeStrong((id *)&self->_mapForMovies, 0);

  objc_storeStrong((id *)&self->_plist, 0);
}

- (NSDictionary)mapForTVShows
{
  return self->_mapForTVShows;
}

- (NSDictionary)mapForMovies
{
  return self->_mapForMovies;
}

- (void)setPlist:(id)a3
{
}

- (NSDictionary)plist
{
  return self->_plist;
}

- (id)findRatingString:(id)a3
{
  return [(AVRatingProviders *)self findRatingString:a3 domain:0 country:0 shouldPreferTVDomain:0];
}

- (id)findRatingString:(id)a3 domain:(int64_t)a4 country:(id)a5 shouldPreferTVDomain:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (__CFString *)a5;
  uint64_t v12 = [(AVRatingProviders *)self _movieMapForRating:v10];
  uint64_t v13 = [(AVRatingProviders *)self _tvShowsMapForRating:v10];
  if (v12 | v13)
  {
    id v41 = v10;
    v14 = +[AVMediaContentRating contentRestrictionsCountryCode];
    v15 = [MEMORY[0x1E4F1CA20] systemLocale];
    uint64_t v16 = [v15 countryCode];

    v17 = &stru_1F09185C8;
    v39 = (void *)v16;
    v40 = v11;
    if (v11) {
      v18 = v11;
    }
    else {
      v18 = &stru_1F09185C8;
    }
    if (v14) {
      v19 = (__CFString *)v14;
    }
    else {
      v19 = &stru_1F09185C8;
    }
    v47[0] = v18;
    v47[1] = v19;
    if (v16) {
      v17 = (__CFString *)v16;
    }
    v47[2] = v17;
    v47[3] = @"US";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v43 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v25 length])
          {
            v26 = _bestMatch((void *)v12, (void *)v13, v25, a4, v6);
            if (v26)
            {
              id v30 = v26;
              v33 = v20;
              v35 = v30;
              goto LABEL_33;
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v27 = (void *)MEMORY[0x1E4F1CA80];
    if (v12) {
      v28 = (void *)v12;
    }
    else {
      v28 = (void *)MEMORY[0x1E4F1CC08];
    }
    v29 = [v28 allKeys];
    id v30 = [v27 setWithArray:v29];

    if (v13)
    {
      v31 = [(id)v13 allKeys];
      [v30 addObjectsFromArray:v31];
    }
    [v30 removeObject:@"ratingString"];
    v32 = [v30 allObjects];
    v33 = (void *)[v32 mutableCopy];

    [v33 sortUsingSelector:sel_compare_];
    v34 = [v33 firstObject];
    v35 = _bestMatch((void *)v12, (void *)v13, v34, a4, v6);

LABEL_33:
    v11 = v40;
    id v10 = v41;
  }
  else
  {
    v14 = _AVLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v36 = @"Unknown";
      if (a4 == 1) {
        v36 = @"Movies";
      }
      if (a4 == 2) {
        v36 = @"TVShows";
      }
      v37 = v36;
      *(_DWORD *)buf = 136315906;
      v49 = "-[AVRatingProviders findRatingString:domain:country:shouldPreferTVDomain:]";
      __int16 v50 = 2114;
      id v51 = v10;
      __int16 v52 = 2114;
      v53 = v37;
      __int16 v54 = 2114;
      v55 = v11;
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s * There is no rating that matches '%{public}@' (%{public}@, %{public}@)", buf, 0x2Au);
    }
    v35 = 0;
  }

  return v35;
}

- (id)_tvShowsMapForRating:(id)a3
{
  id v4 = a3;
  [(AVRatingProviders *)self _loadRatingMapsIfNeeded];
  v5 = [(AVRatingProviders *)self mapForTVShows];
  BOOL v6 = _KeyForRating(v4);

  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)_movieMapForRating:(id)a3
{
  id v4 = a3;
  [(AVRatingProviders *)self _loadRatingMapsIfNeeded];
  v5 = [(AVRatingProviders *)self mapForMovies];
  BOOL v6 = _KeyForRating(v4);

  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)_loadRatingMapsIfNeeded
{
  if (!self->_mapForTVShows) {
    [(AVRatingProviders *)self _loadRatingsMaps];
  }
}

- (void)_loadRatingsMaps
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"Movies" forKeyedSubscript:@"domain"];
  [v4 setObject:@"TVShows" forKeyedSubscript:@"domain"];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v27 = self;
  v5 = [(AVRatingProviders *)self plist];
  BOOL v6 = [v5 allKeys];

  id obj = v6;
  uint64_t v28 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        v9 = [(AVRatingProviders *)v27 plist];
        id v10 = [v9 objectForKeyedSubscript:v8];

        v11 = [v10 objectForKeyedSubscript:@"ratingMovies"];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v34;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v34 != v14) {
                objc_enumerationMutation(v11);
              }
              _MakeReverseDictionaryForRatingDictionary(v8, *(void **)(*((void *)&v33 + 1) + 8 * v15++), v3);
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v13);
        }
        uint64_t v16 = [v10 objectForKeyedSubscript:@"ratingTVShows"];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              _MakeReverseDictionaryForRatingDictionary(v8, *(void **)(*((void *)&v29 + 1) + 8 * v20++), v4);
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v18);
        }

        ++v7;
      }
      while (v7 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v28);
  }

  uint64_t v21 = [v3 copy];
  mapForMovies = v27->_mapForMovies;
  v27->_mapForMovies = (NSDictionary *)v21;

  uint64_t v23 = [v4 copy];
  mapForTVShows = v27->_mapForTVShows;
  v27->_mapForTVShows = (NSDictionary *)v23;
}

- (AVRatingProviders)initWithFileURL:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AVRatingProviders;
  v5 = [(AVRatingProviders *)&v34 init];
  if (!v5) {
    goto LABEL_24;
  }
  if (!v4)
  {
    BOOL v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "expected fileURL", buf, 2u);
    }
  }
  uint64_t v7 = [v4 path];
  id v33 = 0;
  v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v33];
  }
  else
  {
    v9 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  v11 = v10;

  id v12 = v33;
  if (!v11)
  {
    uint64_t v13 = _AVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v36 = "-[AVRatingProviders initWithFileURL:]";
      __int16 v37 = 2114;
      id v38 = v4;
      __int16 v39 = 2114;
      id v40 = v12;
      _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to read %{public}@: %{public}@", buf, 0x20u);
    }
    goto LABEL_44;
  }
  if (MGGetBoolAnswer())
  {
    uint64_t v13 = [(NSDictionary *)v11 allKeys];
    if (![v13 count]
      || ([v13 objectAtIndexedSubscript:0],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 length],
          v14,
          v15 != 2))
    {
      uint64_t v17 = _AVLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v36 = "-[AVRatingProviders initWithFileURL:]";
        _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "%s error: keys of root dictionary should be country codes", buf, 0xCu);
      }
      goto LABEL_43;
    }
    uint64_t v16 = [v13 objectAtIndexedSubscript:0];
    uint64_t v17 = [(NSDictionary *)v11 objectForKeyedSubscript:v16];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 objectForKeyedSubscript:@"ratingMovies"];

      if (v18)
      {
        uint64_t v19 = [v17 objectForKeyedSubscript:@"ratingMovies"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v21 = [v17 objectForKeyedSubscript:@"ratingMovies"];
          uint64_t v22 = [v21 firstObject];
          objc_opt_class();
          char v23 = objc_opt_isKindOfClass();

          if (v23)
          {
            v24 = [v21 firstObject];
            uint64_t v25 = [v24 objectForKeyedSubscript:@"rank"];
            if (v25)
            {
              uint64_t v26 = (void *)v25;
              v27 = [v24 objectForKeyedSubscript:@"rating"];

              if (v27)
              {

                goto LABEL_23;
              }
            }
            long long v31 = _AVLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              long long v36 = "-[AVRatingProviders initWithFileURL:]";
              _os_log_impl(&dword_1B05B7000, v31, OS_LOG_TYPE_DEFAULT, "%s error: expect ratingMovies elements to have 'rank' and 'rating' keys", buf, 0xCu);
            }
          }
          else
          {
            v24 = _AVLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              long long v36 = "-[AVRatingProviders initWithFileURL:]";
              _os_log_impl(&dword_1B05B7000, v24, OS_LOG_TYPE_DEFAULT, "%s error: expect ratingMovies elements to be dictionaries", buf, 0xCu);
            }
          }

          goto LABEL_42;
        }
        uint64_t v21 = _AVLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          long long v36 = "-[AVRatingProviders initWithFileURL:]";
          long long v30 = "%s error: expect ratingMovies to be an array";
          goto LABEL_35;
        }
LABEL_42:

LABEL_43:
LABEL_44:

        long long v29 = 0;
        goto LABEL_45;
      }
      uint64_t v21 = _AVLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 136315138;
      long long v36 = "-[AVRatingProviders initWithFileURL:]";
      long long v30 = "%s error: expect value dictionaries to have 'ratingMovies' at least";
    }
    else
    {
      uint64_t v21 = _AVLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      *(_DWORD *)buf = 136315138;
      long long v36 = "-[AVRatingProviders initWithFileURL:]";
      long long v30 = "%s error: expect root values to be dictionaries";
    }
LABEL_35:
    _os_log_impl(&dword_1B05B7000, v21, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
    goto LABEL_42;
  }
LABEL_23:
  plist = v5->_plist;
  v5->_plist = v11;

LABEL_24:
  long long v29 = v5;
LABEL_45:

  return v29;
}

- (AVRatingProviders)init
{
  return 0;
}

+ (id)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AVRatingProviders_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken_14619 != -1) {
    dispatch_once(&shared_onceToken_14619, block);
  }
  v2 = (void *)shared__providers;

  return v2;
}

uint64_t __27__AVRatingProviders_shared__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ratingProvidersWithName:@"RatingProviders.plist"];
  uint64_t v2 = shared__providers;
  shared__providers = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)ratingProvidersWithName:(id)a3
{
  id v4 = a3;
  v5 = AVBundle();
  BOOL v6 = [v5 URLForResource:v4 withExtension:0];

  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithFileURL:v6];

  return v7;
}

@end