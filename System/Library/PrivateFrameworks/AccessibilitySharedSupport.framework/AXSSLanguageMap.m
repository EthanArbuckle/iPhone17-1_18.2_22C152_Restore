@interface AXSSLanguageMap
- (AXSSDialectMap)userLocaleDialect;
- (AXSSLanguageMap)initWithLanguageID:(id)a3 isWestern:(BOOL)a4 isAmbiguous:(BOOL)a5 isRTL:(BOOL)a6 dialects:(id)a7 alternateLanguageIDs:(id)a8 associatedAmbiguousLanguages:(id)a9;
- (BOOL)isAmbiguous;
- (BOOL)isRTL;
- (BOOL)isWestern;
- (NSArray)alternateLanguageIDs;
- (NSArray)associatedAmbiguousLanguages;
- (NSArray)dialects;
- (NSString)generalLanguageID;
- (id)description;
- (id)dialectWithLocaleIdentifier:(id)a3;
- (void)setAlternateLanguageIDs:(id)a3;
- (void)setAmbiguous:(BOOL)a3;
- (void)setAssociatedAmbiguousLanguages:(id)a3;
- (void)setDefaultDialect:(id)a3;
- (void)setDialects:(id)a3;
- (void)setGeneralLanguageID:(id)a3;
- (void)setRtl:(BOOL)a3;
- (void)setUserLocaleDialect:(id)a3;
- (void)setWestern:(BOOL)a3;
@end

@implementation AXSSLanguageMap

- (AXSSLanguageMap)initWithLanguageID:(id)a3 isWestern:(BOOL)a4 isAmbiguous:(BOOL)a5 isRTL:(BOOL)a6 dialects:(id)a7 alternateLanguageIDs:(id)a8 associatedAmbiguousLanguages:(id)a9
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  v33.receiver = self;
  v33.super_class = (Class)AXSSLanguageMap;
  v18 = [(AXSSLanguageMap *)&v33 init];
  v19 = v18;
  if (v18)
  {
    v18->_western = a4;
    v18->_ambiguous = a5;
    v18->_rtl = a6;
    objc_storeStrong((id *)&v18->_generalLanguageID, a3);
    objc_storeStrong((id *)&v19->_alternateLanguageIDs, a8);
    objc_storeStrong((id *)&v19->_dialects, a7);
    objc_storeStrong((id *)&v19->_associatedAmbiguousLanguages, a9);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v20 = [(AXSSLanguageMap *)v19 dialects];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) setValue:v19 forKey:@"languageMap"];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v22);
    }

    v25 = v19;
  }

  return v19;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(AXSSLanguageMap *)self alternateLanguageIDs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(AXSSLanguageMap *)self alternateLanguageIDs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      v9 = @" AltLangs:";
      do
      {
        uint64_t v10 = 0;
        v11 = v9;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v9 = [(__CFString *)v11 stringByAppendingFormat:@"%@ ", *(void *)(*((void *)&v18 + 1) + 8 * v10)];

          ++v10;
          v11 = v9;
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
    v9 = &stru_1F0C5BA58;
  }
  v12 = NSString;
  v13 = [(AXSSLanguageMap *)self generalLanguageID];
  if ([(AXSSLanguageMap *)self isWestern]) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  if ([(AXSSLanguageMap *)self isAmbiguous]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  id v16 = [v12 stringWithFormat:@"AXSSLanguage <%p>. LangID:%@%@ western:%@ ambiguous:%@", self, v13, v9, v14, v15];

  return v16;
}

- (AXSSDialectMap)userLocaleDialect
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = +[AXSSLanguageManager shared];
  uint64_t v4 = [v3 userLocale];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = self;
  v5 = [(AXSSLanguageMap *)self dialects];
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
        v11 = [v10 locale];
        v12 = [v11 localeIdentifier];
        v13 = [v4 localeIdentifier];
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

  v5 = [(AXSSLanguageMap *)v18 dialects];
  id v15 = [v5 firstObject];
LABEL_11:
  id v16 = v15;

  return (AXSSDialectMap *)v16;
}

- (id)dialectWithLocaleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(AXSSLanguageMap *)self dialects];
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
        v11 = [v10 localeIdentifier];
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

- (BOOL)isWestern
{
  return self->_western;
}

- (void)setWestern:(BOOL)a3
{
  self->_western = a3;
}

- (BOOL)isRTL
{
  return self->_rtl;
}

- (void)setRtl:(BOOL)a3
{
  self->_rtl = a3;
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

- (NSArray)alternateLanguageIDs
{
  return self->_alternateLanguageIDs;
}

- (void)setAlternateLanguageIDs:(id)a3
{
}

- (NSArray)dialects
{
  return self->_dialects;
}

- (void)setDialects:(id)a3
{
}

- (NSArray)associatedAmbiguousLanguages
{
  return self->_associatedAmbiguousLanguages;
}

- (void)setAssociatedAmbiguousLanguages:(id)a3
{
}

- (void)setDefaultDialect:(id)a3
{
}

- (void)setUserLocaleDialect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocaleDialect, 0);
  objc_storeStrong((id *)&self->_defaultDialect, 0);
  objc_storeStrong((id *)&self->_associatedAmbiguousLanguages, 0);
  objc_storeStrong((id *)&self->_dialects, 0);
  objc_storeStrong((id *)&self->_alternateLanguageIDs, 0);

  objc_storeStrong((id *)&self->_generalLanguageID, 0);
}

@end