@interface MapsSuggestionsReInjectSource
+ (BOOL)isEnabled;
+ (id)_entriesFromMultilineString:(id)a3;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (NSString)path;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)setPath:(id)a3;
@end

@implementation MapsSuggestionsReInjectSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
      __int16 v24 = 1024;
      int v25 = 84;
      __int16 v26 = 2082;
      v27 = "-[MapsSuggestionsReInjectSource initFromResourceDepot:name:]";
      __int16 v28 = 2082;
      v29 = "nil == (resourceDepot)";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_12:
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x26u);
    }
LABEL_13:

    v17 = 0;
    goto LABEL_14;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
      __int16 v24 = 1024;
      int v25 = 85;
      __int16 v26 = 2082;
      v27 = "-[MapsSuggestionsReInjectSource initFromResourceDepot:name:]";
      __int16 v28 = 2082;
      v29 = "nil == (resourceDepot.oneSourceDelegate)";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v9 = [v6 oneSourceDelegate];
  v21.receiver = self;
  v21.super_class = (Class)MapsSuggestionsReInjectSource;
  v10 = [(MapsSuggestionsBaseSource *)&v21 initWithDelegate:v9 name:v7];

  if (v10)
  {
    v11 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v12 = [v11 firstObject];
    uint64_t v13 = [v12 stringByAppendingPathComponent:@"MapsSuggestionsInjections.txt"];
    path = v10->_path;
    v10->_path = (NSString *)v13;

    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = v10->_path;
      *(_DWORD *)buf = 138412290;
      v23 = (const char *)v16;
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Using path: %@", buf, 0xCu);
    }
  }
  self = v10;
  v17 = self;
LABEL_14:

  return v17;
}

+ (unint64_t)disposition
{
  return 1;
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(MapsSuggestionsBaseSource *)self uniqueName];
    v8 = NSStringFromMapsSuggestionsCurrentBestLocation();
    *(_DWORD *)buf = 138412802;
    v94 = v7;
    __int16 v95 = 2112;
    v96 = @"ALL";
    __int16 v97 = 2112;
    v98 = v8;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
  }
  if ([v5 fileExistsAtPath:self->_path])
  {
    v9 = self->_path;
    v69 = v4;
    v10 = v9;
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v10;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Reading from: %@", buf, 0xCu);
    }

    v12 = (void *)[[NSString alloc] initWithContentsOfFile:v10 encoding:4 error:0];
    v68 = v12;
    if ([v12 length])
    {
      v66 = v5;
      id v67 = v12;
      uint64_t v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "_entriesFromMultilineString", buf, 2u);
      }

      unint64_t v14 = 0x1E4F28000uLL;
      uint64_t v65 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      v15 = objc_msgSend(v67, "componentsSeparatedByCharactersInSet:");
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v17 = v15;
      uint64_t v79 = [v17 countByEnumeratingWithState:&v88 objects:buf count:16];
      if (v79)
      {
        uint64_t v78 = *(void *)v89;
        v71 = self;
        v72 = v4;
        v70 = v10;
        v73 = v16;
        id v76 = v17;
LABEL_11:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v89 != v78) {
            objc_enumerationMutation(v17);
          }
          uint64_t v80 = v18;
          v19 = *(void **)(*((void *)&v88 + 1) + 8 * v18);
          v20 = [*(id *)(v14 + 2952) whitespaceCharacterSet];
          objc_super v21 = [v19 stringByTrimmingCharactersInSet:v20];

          if ([v21 length])
          {
            if ([v21 characterAtIndex:0] != 35) {
              break;
            }
          }
LABEL_85:

          uint64_t v18 = v80 + 1;
          if (v80 + 1 == v79)
          {
            uint64_t v79 = [v17 countByEnumeratingWithState:&v88 objects:buf count:16];
            if (!v79) {
              goto LABEL_87;
            }
            goto LABEL_11;
          }
        }
        v77 = v21;
        if (![v21 hasPrefix:@"APPLY "])
        {
          __int16 v28 = +[MapsSuggestionsEntry entryFromSerializedString:v21];
          if (v28)
          {
            v22 = v28;
            [v28 setExpires:0];
            [v16 addObject:v22];
          }
          else
          {
            v29 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v99 = 138412290;
              v100 = (const char *)v19;
              _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "Cannot deserialize '%@'", v99, 0xCu);
            }

            v22 = 0;
          }
          goto LABEL_84;
        }
        if ([v16 count])
        {
          v22 = [v16 lastObject];
          v23 = [v21 substringFromIndex:objc_msgSend(@"APPLY ", "length")];
          __int16 v24 = [v23 dataUsingEncoding:4];

          id v87 = 0;
          int v25 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v24 options:0 error:&v87];
          __int16 v26 = (char *)v87;
          if (v26)
          {
            v27 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v99 = 138412546;
              v100 = v26;
              __int16 v101 = 2112;
              *(void *)v102 = v77;
              _os_log_impl(&dword_1A70DF000, v27, OS_LOG_TYPE_ERROR, "Could not decode JSON: %@, for line: %@", v99, 0x16u);
            }
            goto LABEL_83;
          }
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          v27 = v25;
          uint64_t v30 = [v27 countByEnumeratingWithState:&v83 objects:v92 count:16];
          if (!v30)
          {
            v16 = v73;
LABEL_83:

            id v17 = v76;
LABEL_84:

            unint64_t v14 = 0x1E4F28000;
            objc_super v21 = v77;
            goto LABEL_85;
          }
          uint64_t v31 = v30;
          v74 = v25;
          v75 = v24;
          uint64_t v82 = *(void *)v84;
LABEL_28:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v84 != v82) {
              objc_enumerationMutation(v27);
            }
            v33 = *(char **)(*((void *)&v83 + 1) + 8 * v32);
            v34 = [v27 objectForKeyedSubscript:v33];
            v35 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v99 = 138412546;
              v100 = v33;
              __int16 v101 = 2112;
              *(void *)v102 = v34;
              _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_DEBUG, "Applying %@ => %@", v99, 0x16u);
            }

            id v36 = v22;
            v37 = v33;
            id v38 = v34;
            v39 = v38;
            if (!v22) {
              break;
            }
            if (!v37)
            {
              v41 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              *(_DWORD *)v99 = 136446978;
              v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
              __int16 v101 = 1024;
              *(_DWORD *)v102 = 159;
              *(_WORD *)&v102[4] = 2082;
              *(void *)&v102[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
              __int16 v103 = 2082;
              v104 = "nil == (key)";
              v42 = v41;
              v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key";
              goto LABEL_44;
            }
            if (!v38)
            {
              v41 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              *(_DWORD *)v99 = 136446978;
              v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
              __int16 v101 = 1024;
              *(_DWORD *)v102 = 160;
              *(_WORD *)&v102[4] = 2082;
              *(void *)&v102[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
              __int16 v103 = 2082;
              v104 = "nil == (value)";
              v42 = v41;
              v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a value";
              goto LABEL_44;
            }
            id v40 = v38;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {

              [v36 setString:0 forKey:v37];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v48 = qword_1EB6F08A8;
                  id v49 = v40;
                  if (v48 != -1) {
                    dispatch_once(&qword_1EB6F08A8, &__block_literal_global_39);
                  }
                  v50 = [(id)_MergedGlobals_51 dateFromString:v49];

                  id v81 = v36;
                  v51 = v37;
                  id v52 = v49;
                  if (v50)
                  {
                    if ([v51 isEqualToString:@".expires"])
                    {
                      v53 = (void *)[v52 copy];
                      [v81 setExpires:v53];
                    }
                    else
                    {

                      uint64_t v55 = qword_1EB6F08A8;
                      id v56 = v52;
                      if (v55 != -1) {
                        dispatch_once(&qword_1EB6F08A8, &__block_literal_global_39);
                      }
                      v57 = [(id)_MergedGlobals_51 dateFromString:v56];

                      [v81 setDate:v57 forKey:v51];
                    }
                    goto LABEL_67;
                  }
                  if ([v51 isEqualToString:@".title"])
                  {
                    v54 = (void *)[v52 copy];
                    [v81 setTitle:v54];
                    goto LABEL_75;
                  }
                  if ([v51 isEqualToString:@".subtitle"])
                  {
                    v54 = (void *)[v52 copy];
                    [v81 setSubtitle:v54];
                    goto LABEL_75;
                  }
                  if ([v51 isEqualToString:@".undecoratedTitle"])
                  {
                    v54 = (void *)[v52 copy];
                    [v81 setUndecoratedTitle:v54];
                    goto LABEL_75;
                  }
                  if ([v51 isEqualToString:@".undecoratedSubtitle"])
                  {
                    v54 = (void *)[v52 copy];
                    [v81 setUndecoratedSubtitle:v54];
LABEL_75:
                  }
                  else
                  {
                    if (![v51 isEqualToString:@".type"])
                    {

                      [v81 setString:v52 forKey:v51];
                      goto LABEL_67;
                    }
                    [v81 _overrideType:MapsSuggestionsEntryTypeFromString(v52)];
                  }

                  goto LABEL_67;
                }

                v41 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v99 = 138412290;
                  v100 = v37;
                  v42 = v41;
                  v43 = "Cannot apply unknown type for key %@";
                  uint32_t v44 = 12;
LABEL_45:
                  _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, v43, v99, v44);
                }
LABEL_46:

                goto LABEL_67;
              }

              id v45 = v36;
              v46 = v37;
              id v47 = v40;
              if ([v46 isEqualToString:@".type"])
              {
                objc_msgSend(v45, "_overrideType:", objc_msgSend(v47, "unsignedIntegerValue"));
              }
              else
              {
                if (![v46 isEqualToString:@".weight"])
                {

                  [v45 setNumber:v47 forKey:v46];
                  goto LABEL_67;
                }
                [v47 doubleValue];
                objc_msgSend(v45, "setWeight:");
              }
            }
LABEL_67:

            if (v31 == ++v32)
            {
              uint64_t v58 = [v27 countByEnumeratingWithState:&v83 objects:v92 count:16];
              uint64_t v31 = v58;
              if (!v58)
              {
                self = v71;
                v4 = v72;
                v10 = v70;
                v16 = v73;
                __int16 v26 = 0;
                int v25 = v74;
                __int16 v24 = v75;
                goto LABEL_83;
              }
              goto LABEL_28;
            }
          }
          v41 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)v99 = 136446978;
          v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 158;
          *(_WORD *)&v102[4] = 2082;
          *(void *)&v102[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          __int16 v103 = 2082;
          v104 = "nil == (entry)";
          v42 = v41;
          v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_44:
          uint32_t v44 = 38;
          goto LABEL_45;
        }
        v62 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v99 = 136446978;
          v100 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          __int16 v101 = 1024;
          *(_DWORD *)v102 = 222;
          *(_WORD *)&v102[4] = 2082;
          *(void *)&v102[6] = "MapsSuggestionsEntries *_entriesFromMultilineString(NSString *__strong)";
          __int16 v103 = 2082;
          v104 = "0u == entries.count";
          _os_log_impl(&dword_1A70DF000, v62, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Cannot modify a non-existing entry", v99, 0x26u);
        }

        v60 = 0;
        v59 = (void *)v65;
        v5 = v66;
      }
      else
      {
LABEL_87:

        if (![v16 count])
        {

          v16 = 0;
        }
        v59 = (void *)v65;
        v5 = v66;
        v60 = (void *)[v16 copy];
      }
    }
    else
    {
      v60 = 0;
    }

    if (v60) {
      v63 = v60;
    }
    else {
      v63 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(MapsSuggestionsBaseSource *)self addOrUpdateMySuggestionEntries:v63];
    if (v69) {
      v69[2](v69);
    }

    double v61 = 300.0;
  }
  else
  {
    double v61 = 0.0;
    if (v4) {
      v4[2](v4);
    }
  }

  return v61;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return 1;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

+ (id)_entriesFromMultilineString:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "_entriesFromMultilineString", buf, 2u);
  }

  unint64_t v4 = 0x1E4F28000uLL;
  v57 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v5 = objc_msgSend(v58, "componentsSeparatedByCharactersInSet:");
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v75 objects:buf count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v76;
    uint64_t v65 = *(void *)v76;
    id v59 = v7;
    v60 = v6;
LABEL_5:
    uint64_t v11 = 0;
    uint64_t v63 = v9;
    while (1)
    {
      if (*(void *)v76 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v67 = v11;
      v12 = *(void **)(*((void *)&v75 + 1) + 8 * v11);
      uint64_t v13 = [*(id *)(v4 + 2952) whitespaceCharacterSet];
      unint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

      if ([v14 length])
      {
        if ([v14 characterAtIndex:0] != 35) {
          break;
        }
      }
LABEL_81:

      uint64_t v11 = v67 + 1;
      if (v67 + 1 == v9)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v75 objects:buf count:16];
        if (!v9) {
          goto LABEL_83;
        }
        goto LABEL_5;
      }
    }
    if (![v14 hasPrefix:@"APPLY "])
    {
      objc_super v21 = +[MapsSuggestionsEntry entryFromSerializedString:v14];
      if (v21)
      {
        v15 = v21;
        [v21 setExpires:0];
        [v6 addObject:v15];
      }
      else
      {
        v22 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v81 = 138412290;
          uint64_t v82 = (const char *)v12;
          _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "Cannot deserialize '%@'", v81, 0xCu);
        }

        v15 = 0;
      }
      goto LABEL_80;
    }
    if ([v6 count])
    {
      v15 = [v6 lastObject];
      v16 = [v14 substringFromIndex:objc_msgSend(@"APPLY ", "length")];
      uint64_t v17 = [v16 dataUsingEncoding:4];

      uint64_t v18 = (void *)v17;
      id v74 = 0;
      v19 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v17 options:0 error:&v74];
      v66 = (char *)v74;
      v64 = v19;
      if (v66)
      {
        v20 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v81 = 138412546;
          uint64_t v82 = v66;
          __int16 v83 = 2112;
          *(void *)long long v84 = v14;
          _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "Could not decode JSON: %@, for line: %@", v81, 0x16u);
        }
        goto LABEL_79;
      }
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v20 = v19;
      uint64_t v23 = [v20 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (!v23)
      {
        unint64_t v4 = 0x1E4F28000;
LABEL_79:

        uint64_t v9 = v63;
LABEL_80:

        uint64_t v10 = v65;
        goto LABEL_81;
      }
      uint64_t v24 = v23;
      double v61 = v18;
      v62 = v14;
      uint64_t v69 = *(void *)v71;
LABEL_22:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v71 != v69) {
          objc_enumerationMutation(v20);
        }
        __int16 v26 = *(char **)(*((void *)&v70 + 1) + 8 * v25);
        v27 = [v20 objectForKeyedSubscript:v26];
        __int16 v28 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id v81 = 138412546;
          uint64_t v82 = v26;
          __int16 v83 = 2112;
          *(void *)long long v84 = v27;
          _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "Applying %@ => %@", v81, 0x16u);
        }

        id v29 = v15;
        uint64_t v30 = v26;
        id v31 = v27;
        uint64_t v32 = v31;
        if (!v15)
        {
          v37 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          *(_DWORD *)id v81 = 136446978;
          uint64_t v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          __int16 v83 = 1024;
          *(_DWORD *)long long v84 = 158;
          *(_WORD *)&v84[4] = 2082;
          *(void *)&v84[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          __int16 v85 = 2082;
          long long v86 = "nil == (entry)";
          id v38 = v37;
          v39 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_39:
          uint32_t v40 = 38;
          goto LABEL_40;
        }
        if (!v30)
        {
          v37 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          *(_DWORD *)id v81 = 136446978;
          uint64_t v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          __int16 v83 = 1024;
          *(_DWORD *)long long v84 = 159;
          *(_WORD *)&v84[4] = 2082;
          *(void *)&v84[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          __int16 v85 = 2082;
          long long v86 = "nil == (key)";
          id v38 = v37;
          v39 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key";
          goto LABEL_39;
        }
        if (!v31)
        {
          v37 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            goto LABEL_41;
          }
          *(_DWORD *)id v81 = 136446978;
          uint64_t v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
          __int16 v83 = 1024;
          *(_DWORD *)long long v84 = 160;
          *(_WORD *)&v84[4] = 2082;
          *(void *)&v84[6] = "void _applyValue(MapsSuggestionsEntry *__strong, NSString *__strong, NSObject *__strong)";
          __int16 v85 = 2082;
          long long v86 = "nil == (value)";
          id v38 = v37;
          v39 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a value";
          goto LABEL_39;
        }
        id v33 = v31;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          id v41 = v29;
          v42 = v30;
          id v43 = v33;
          if ([v42 isEqualToString:@".type"])
          {
            objc_msgSend(v41, "_overrideType:", objc_msgSend(v43, "unsignedIntegerValue"));
          }
          else
          {
            if (![v42 isEqualToString:@".weight"])
            {

              [v41 setNumber:v43 forKey:v42];
              goto LABEL_58;
            }
            [v43 doubleValue];
            objc_msgSend(v41, "setWeight:");
          }

          goto LABEL_54;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v37 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v81 = 138412290;
            uint64_t v82 = v30;
            id v38 = v37;
            v39 = "Cannot apply unknown type for key %@";
            uint32_t v40 = 12;
LABEL_40:
            _os_log_impl(&dword_1A70DF000, v38, OS_LOG_TYPE_ERROR, v39, v81, v40);
          }
LABEL_41:

          goto LABEL_58;
        }
        uint64_t v44 = qword_1EB6F08A8;
        id v45 = v33;
        if (v44 != -1) {
          dispatch_once(&qword_1EB6F08A8, &__block_literal_global_39);
        }
        v46 = [(id)_MergedGlobals_51 dateFromString:v45];

        id v68 = v29;
        id v47 = v30;
        id v48 = v45;
        if (!v46)
        {
          if ([v47 isEqualToString:@".title"])
          {
            v50 = (void *)[v48 copy];
            [v68 setTitle:v50];
LABEL_71:

LABEL_72:
            goto LABEL_58;
          }
          if ([v47 isEqualToString:@".subtitle"])
          {
            v50 = (void *)[v48 copy];
            [v68 setSubtitle:v50];
            goto LABEL_71;
          }
          if ([v47 isEqualToString:@".undecoratedTitle"])
          {
            v50 = (void *)[v48 copy];
            [v68 setUndecoratedTitle:v50];
            goto LABEL_71;
          }
          if ([v47 isEqualToString:@".undecoratedSubtitle"])
          {
            v50 = (void *)[v48 copy];
            [v68 setUndecoratedSubtitle:v50];
            goto LABEL_71;
          }
          if ([v47 isEqualToString:@".type"])
          {
            [v68 _overrideType:MapsSuggestionsEntryTypeFromString(v48)];
            goto LABEL_72;
          }

          v34 = v68;
          id v35 = v48;
          id v36 = v47;
          goto LABEL_32;
        }
        if (![v47 isEqualToString:@".expires"])
        {

          uint64_t v51 = qword_1EB6F08A8;
          id v52 = v48;
          if (v51 != -1) {
            dispatch_once(&qword_1EB6F08A8, &__block_literal_global_39);
          }
          id v41 = [(id)_MergedGlobals_51 dateFromString:v52];

          [v68 setDate:v41 forKey:v47];
LABEL_54:

          goto LABEL_58;
        }
        id v49 = (void *)[v48 copy];
        [v68 setExpires:v49];

LABEL_58:
        if (v24 == ++v25)
        {
          uint64_t v53 = [v20 countByEnumeratingWithState:&v70 objects:v79 count:16];
          uint64_t v24 = v53;
          if (!v53)
          {
            id v7 = v59;
            id v6 = v60;
            unint64_t v4 = 0x1E4F28000;
            uint64_t v18 = v61;
            unint64_t v14 = v62;
            goto LABEL_79;
          }
          goto LABEL_22;
        }
      }

      v34 = v29;
      id v35 = 0;
      id v36 = v30;
LABEL_32:
      [v34 setString:v35 forKey:v36];
      goto LABEL_58;
    }
    uint64_t v55 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v81 = 136446978;
      uint64_t v82 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReInjectSource.m";
      __int16 v83 = 1024;
      *(_DWORD *)long long v84 = 222;
      *(_WORD *)&v84[4] = 2082;
      *(void *)&v84[6] = "MapsSuggestionsEntries *_entriesFromMultilineString(NSString *__strong)";
      __int16 v85 = 2082;
      long long v86 = "0u == entries.count";
      _os_log_impl(&dword_1A70DF000, v55, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Cannot modify a non-existing entry", v81, 0x26u);
    }

    v54 = 0;
  }
  else
  {
LABEL_83:

    if (![v6 count])
    {

      id v6 = 0;
    }
    v54 = (void *)[v6 copy];
  }

  return v54;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end