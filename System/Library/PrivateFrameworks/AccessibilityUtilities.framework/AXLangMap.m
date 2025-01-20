@interface AXLangMap
- (AXDialectMap)defaultDialect;
- (AXDialectMap)userLocaleDialect;
- (AXDialectMap)userPreferredDialect;
- (AXLangMap)initWithLanguageID:(id)a3 isWestern:(BOOL)a4 isAmbiguous:(BOOL)a5 isRTL:(BOOL)a6 dialects:(id)a7 alternateLanguageIDs:(id)a8 associatedAmbiguousLanguages:(id)a9;
- (BOOL)isAmbiguous;
- (BOOL)isRTL;
- (BOOL)isWestern;
- (NSArray)alternateLanguageIDs;
- (NSArray)associatedAmbiguousLanguages;
- (NSArray)dialects;
- (NSString)generalLanguageID;
- (id)basicDescription;
- (id)debugDescription;
- (id)dialectWithLocaleIdentifier:(id)a3;
- (void)setAlternateLanguageIDs:(id)a3;
- (void)setAmbiguous:(BOOL)a3;
- (void)setAssociatedAmbiguousLanguages:(id)a3;
- (void)setDialects:(id)a3;
- (void)setGeneralLanguageID:(id)a3;
- (void)setRtl:(BOOL)a3;
- (void)setUserPreferredDialect:(id)a3;
- (void)setWestern:(BOOL)a3;
@end

@implementation AXLangMap

- (AXLangMap)initWithLanguageID:(id)a3 isWestern:(BOOL)a4 isAmbiguous:(BOOL)a5 isRTL:(BOOL)a6 dialects:(id)a7 alternateLanguageIDs:(id)a8 associatedAmbiguousLanguages:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v49.receiver = self;
  v49.super_class = (Class)AXLangMap;
  v19 = [(AXLangMap *)&v49 init];
  v20 = v19;
  if (v19)
  {
    [(AXLangMap *)v19 setWestern:v13];
    [(AXLangMap *)v20 setAmbiguous:v12];
    [(AXLangMap *)v20 setRtl:v11];
    id v42 = v15;
    [(AXLangMap *)v20 setGeneralLanguageID:v15];
    id v40 = v17;
    [(AXLangMap *)v20 setAlternateLanguageIDs:v17];
    id v41 = v16;
    [(AXLangMap *)v20 setDialects:v16];
    id v39 = v18;
    [(AXLangMap *)v20 setAssociatedAmbiguousLanguages:v18];
    v21 = (void *)_AXSQuickSpeakCopyPreferredLocalesForLanguages();
    v22 = [(AXLangMap *)v20 generalLanguageID];
    v38 = v21;
    v23 = [v21 objectForKey:v22];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [(AXLangMap *)v20 dialects];
    uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (!v24) {
      goto LABEL_13;
    }
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v46;
    v27 = @"langMap";
    uint64_t v43 = *(void *)v46;
    while (1)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v29 setValue:v20 forKey:v27];
        v30 = [v29 specificLanguageID];
        if ([v30 isEqualToString:v23])
        {
        }
        else
        {
          v31 = [v29 locale];
          [v31 localeIdentifier];
          v32 = v20;
          v34 = v33 = v27;
          int v35 = [v34 isEqualToString:v23];

          v27 = v33;
          v20 = v32;

          uint64_t v26 = v43;
          if (!v35) {
            continue;
          }
        }
        [(AXLangMap *)v20 setUserPreferredDialect:v29];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (!v25)
      {
LABEL_13:

        v36 = v20;
        id v16 = v41;
        id v15 = v42;
        id v18 = v39;
        id v17 = v40;
        break;
      }
    }
  }

  return v20;
}

- (id)basicDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(AXLangMap *)self alternateLanguageIDs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(AXLangMap *)self alternateLanguageIDs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      v9 = @" AltLangs:";
      do
      {
        uint64_t v10 = 0;
        BOOL v11 = v9;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v9 = [(__CFString *)v11 stringByAppendingFormat:@"%@ ", *(void *)(*((void *)&v18 + 1) + 8 * v10)];

          ++v10;
          BOOL v11 = v9;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    else
    {
      v9 = @" AltLangs:";
    }
  }
  else
  {
    v9 = &stru_1EDC3DEF8;
  }
  BOOL v12 = NSString;
  BOOL v13 = [(AXLangMap *)self generalLanguageID];
  if ([(AXLangMap *)self isWestern]) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  if ([(AXLangMap *)self isAmbiguous]) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  id v16 = [v12 stringWithFormat:@"AXLang <%p>. LangID:%@%@ western:%@ ambiguous:%@", self, v13, v9, v14, v15];

  return v16;
}

- (id)debugDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"\nDialects:\n"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(AXLangMap *)self dialects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"\t%@\n", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v9 = [(AXLangMap *)self userPreferredDialect];
  [v3 appendFormat:@"Preferred Dialect:%@\n", v9];

  uint64_t v10 = [(AXLangMap *)self basicDescription];
  BOOL v11 = [v10 stringByAppendingString:v3];

  return v11;
}

- (AXDialectMap)userLocaleDialect
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = +[AXLanguageManager sharedInstance];
  uint64_t v4 = [v3 userLocale];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v18 = self;
  uint64_t v5 = [(AXLangMap *)self dialects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        BOOL v11 = [v10 locale];
        BOOL v12 = [v11 localeIdentifier];
        long long v13 = [v4 localeIdentifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v15 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = [(AXLangMap *)v18 dialects];
  id v15 = [v5 firstObject];
LABEL_11:
  long long v16 = v15;

  return (AXDialectMap *)v16;
}

- (AXDialectMap)defaultDialect
{
  v3 = [(AXLangMap *)self userPreferredDialect];

  if (v3) {
    [(AXLangMap *)self userPreferredDialect];
  }
  else {
  uint64_t v4 = [(AXLangMap *)self userLocaleDialect];
  }

  return (AXDialectMap *)v4;
}

- (id)dialectWithLocaleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(AXLangMap *)self dialects];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 locale];
        BOOL v11 = [v10 localeIdentifier];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)dialects
{
  return self->_dialects;
}

- (void)setDialects:(id)a3
{
}

- (BOOL)isWestern
{
  return self->_western;
}

- (void)setWestern:(BOOL)a3
{
  self->_western = a3;
}

- (BOOL)isAmbiguous
{
  return self->_ambiguous;
}

- (void)setAmbiguous:(BOOL)a3
{
  self->_ambiguous = a3;
}

- (NSString)generalLanguageID
{
  return self->_generalLanguageID;
}

- (void)setGeneralLanguageID:(id)a3
{
}

- (AXDialectMap)userPreferredDialect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userPreferredDialect);

  return (AXDialectMap *)WeakRetained;
}

- (void)setUserPreferredDialect:(id)a3
{
}

- (NSArray)alternateLanguageIDs
{
  return self->_alternateLanguageIDs;
}

- (void)setAlternateLanguageIDs:(id)a3
{
}

- (NSArray)associatedAmbiguousLanguages
{
  return self->_associatedAmbiguousLanguages;
}

- (void)setAssociatedAmbiguousLanguages:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_rtl;
}

- (void)setRtl:(BOOL)a3
{
  self->_rtl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAmbiguousLanguages, 0);
  objc_storeStrong((id *)&self->_alternateLanguageIDs, 0);
  objc_destroyWeak((id *)&self->_userPreferredDialect);
  objc_storeStrong((id *)&self->_generalLanguageID, 0);
  objc_storeStrong((id *)&self->_dialects, 0);

  objc_storeStrong((id *)&self->userLocaleDialect, 0);
}

@end