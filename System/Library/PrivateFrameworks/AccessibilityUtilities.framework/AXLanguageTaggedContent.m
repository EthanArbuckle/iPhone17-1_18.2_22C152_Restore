@interface AXLanguageTaggedContent
- ($1230CF39250A084FEEB876D19862D23B)_languageHintsEvenlyDistributedWithProbability:(float)a3 excludingHints:(id)a4;
- (AXLanguageTaggedContent)initWithContent:(id)a3;
- (BOOL)_addLanguageTagForCurrentChunk;
- (BOOL)_addLanguageTagForDateIfNecessary;
- (BOOL)_isNamedEntity:(id)a3;
- (BOOL)_isStringCombinationOfCommonAndEmoji:(id)a3;
- (BOOL)hasOnlyNonWesternLangMaps;
- (BOOL)hasOnlyWesternLangMaps;
- (BOOL)isTagged;
- (BOOL)langMapIsSignificant:(id)a3;
- (NSArray)currentDialects;
- (NSArray)shorthandDateMatches;
- (NSMutableArray)tags;
- (NSMutableOrderedSet)predictedSecondaryLangMaps;
- (NSMutableOrderedSet)unpredictedAmbiguousLangMaps;
- (NSMutableString)contentString;
- (NSString)userPreferredLangID;
- (id)_allLangIDs;
- (id)_overrideLanguageDetection:(id)a3;
- (id)_preferredLanguagesForTagging;
- (id)ambiguousLangMaps;
- (id)description;
- (id)langCodeForlangId:(int)a3;
- (id)primaryAmbiguousDialect;
- (id)primaryUnambiguousDialect;
- (id)significantAmbiguousLangMapsForUserKeyboards;
- (id)unambiguousLangMaps;
- (int)langIDforLangCode:(id)a3;
- (unint64_t)nextShorthandDateIndex;
- (void)_addLanguageTagForCurrentChunk;
- (void)_addTag;
- (void)_debugLog:(id)a3 token:(id)a4 range:(_NSRange)a5 script:(id)a6 dialects:(id)a7;
- (void)_manuallyProcessContentWithRange:(_NSRange)a3;
- (void)_searchForShorthandDates;
- (void)appendLanguageTaggedContent:(id)a3;
- (void)dealloc;
- (void)enumeratePredictedTags:(id)a3;
- (void)enumerateUnpredictedTags:(id)a3;
- (void)setContentString:(id)a3;
- (void)setCurrentDialects:(id)a3;
- (void)setNextShorthandDateIndex:(unint64_t)a3;
- (void)setPredictedSecondaryLangMaps:(id)a3;
- (void)setShorthandDateMatches:(id)a3;
- (void)setTagged:(BOOL)a3;
- (void)setTags:(id)a3;
- (void)setUnpredictedAmbiguousLangMaps:(id)a3;
- (void)setUserPreferredLangID:(id)a3;
- (void)tagContent;
- (void)updateTagsForLocalePrefChange;
@end

@implementation AXLanguageTaggedContent

- (AXLanguageTaggedContent)initWithContent:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && (v8.receiver = self,
        v8.super_class = (Class)AXLanguageTaggedContent,
        (self = [(AXLanguageTaggedContent *)&v8 init]) != 0))
  {
    v5 = (void *)[v4 mutableCopy];
    [(AXLanguageTaggedContent *)self setContentString:v5];

    v10[0] = *MEMORY[0x1E4F5C918];
    [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    self->_nlTagger = (void *)NLTaggerCreate();
    uint64_t v9 = *MEMORY[0x1E4F5C908];
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    self->_namedEntityTagger = (void *)NLTaggerCreate();
    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  CFRelease(self->_nlTagger);
  CFRelease(self->_namedEntityTagger);
  v3.receiver = self;
  v3.super_class = (Class)AXLanguageTaggedContent;
  [(AXLanguageTaggedContent *)&v3 dealloc];
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXTaggedContent:<%p>. tags:\n", self);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)appendLanguageTaggedContent:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AXLogSpokenContentTextProcessing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Will append new tagged content to current tagged content", buf, 2u);
  }

  uint64_t v6 = [(AXLanguageTaggedContent *)self contentString];
  uint64_t v7 = [v4 contentString];
  [v6 appendString:v7];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_super v8 = objc_msgSend(v4, "tags", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        v14 = [(AXLanguageTaggedContent *)self content];
        [v13 setContent:v14];

        uint64_t v15 = [v13 range];
        v16 = [(AXLanguageTaggedContent *)self contentString];
        uint64_t v17 = [v16 length] + v15;
        v18 = [v4 contentString];
        uint64_t v19 = v17 - [v18 length];
        [v13 range];
        objc_msgSend(v13, "setRange:", v19, v20);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v10);
  }

  v21 = [(AXLanguageTaggedContent *)self tags];
  v22 = [v4 tags];
  [v21 addObjectsFromArray:v22];

  v23 = [(AXLanguageTaggedContent *)self unpredictedAmbiguousLangMaps];
  v24 = [v4 unpredictedAmbiguousLangMaps];
  [v23 unionOrderedSet:v24];

  v25 = [(AXLanguageTaggedContent *)self predictedSecondaryLangMaps];
  v26 = [v4 predictedSecondaryLangMaps];
  [v25 unionOrderedSet:v26];

  v27 = AXLogSpokenContentTextProcessing();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = [(AXLanguageTaggedContent *)self currentDialects];
    v29 = [v4 currentDialects];
    *(_DWORD *)buf = 138412546;
    v39 = v28;
    __int16 v40 = 2112;
    v41 = v29;
    _os_log_impl(&dword_18D308000, v27, OS_LOG_TYPE_INFO, "Combining currentDialects. old: %@. new: %@", buf, 0x16u);
  }
  v30 = [(AXLanguageTaggedContent *)self currentDialects];
  v31 = [v4 currentDialects];
  v32 = [v30 arrayByAddingObjectsFromArray:v31];
  [(AXLanguageTaggedContent *)self setCurrentDialects:v32];

  if ([(AXLanguageTaggedContent *)self isTagged]) {
    uint64_t v33 = [v4 isTagged];
  }
  else {
    uint64_t v33 = 0;
  }
  [(AXLanguageTaggedContent *)self setTagged:v33];
}

- (void)enumerateUnpredictedTags:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
      if (([v10 wasPredicted] & 1) == 0)
      {
        v4[2](v4, v10, &v15);
        if (v15) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumeratePredictedTags:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
      if ([v10 wasPredicted])
      {
        v4[2](v4, v10, &v15);
        if (v15) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)langCodeForlangId:(int)a3
{
  if ((a3 - 2) > 0x38) {
    return @"und";
  }
  else {
    return off_1E5587DF0[a3 - 2];
  }
}

- (int)langIDforLangCode:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"ar"])
  {
    int v4 = 2;
  }
  else if ([v3 hasPrefix:@"bg"])
  {
    int v4 = 3;
  }
  else if ([v3 hasPrefix:@"zh-Hans"])
  {
    int v4 = 4;
  }
  else if ([v3 hasPrefix:@"zh-Hant"])
  {
    int v4 = 5;
  }
  else if ([v3 hasPrefix:@"hr"])
  {
    int v4 = 6;
  }
  else if ([v3 hasPrefix:@"cs"])
  {
    int v4 = 7;
  }
  else if ([v3 hasPrefix:@"da"])
  {
    int v4 = 8;
  }
  else if ([v3 hasPrefix:@"nl"])
  {
    int v4 = 9;
  }
  else if ([v3 hasPrefix:@"en"])
  {
    int v4 = 10;
  }
  else if ([v3 hasPrefix:@"fi"])
  {
    int v4 = 11;
  }
  else if ([v3 hasPrefix:@"fr"])
  {
    int v4 = 12;
  }
  else if ([v3 hasPrefix:@"de"])
  {
    int v4 = 13;
  }
  else if ([v3 hasPrefix:@"el"])
  {
    int v4 = 14;
  }
  else if ([v3 hasPrefix:@"he"])
  {
    int v4 = 15;
  }
  else if ([v3 hasPrefix:@"hi"])
  {
    int v4 = 16;
  }
  else if ([v3 hasPrefix:@"hu"])
  {
    int v4 = 17;
  }
  else if ([v3 hasPrefix:@"is"])
  {
    int v4 = 18;
  }
  else if ([v3 hasPrefix:@"it"])
  {
    int v4 = 19;
  }
  else if ([v3 hasPrefix:@"ja"])
  {
    int v4 = 20;
  }
  else if ([v3 hasPrefix:@"ko"])
  {
    int v4 = 21;
  }
  else if ([v3 hasPrefix:@"mr"])
  {
    int v4 = 22;
  }
  else if ([v3 hasPrefix:@"nb"])
  {
    int v4 = 23;
  }
  else if ([v3 hasPrefix:@"pl"])
  {
    int v4 = 24;
  }
  else if ([v3 hasPrefix:@"pt"])
  {
    int v4 = 25;
  }
  else if ([v3 hasPrefix:@"ro"])
  {
    int v4 = 26;
  }
  else if ([v3 hasPrefix:@"ru"])
  {
    int v4 = 27;
  }
  else if ([v3 hasPrefix:@"sk"])
  {
    int v4 = 28;
  }
  else if ([v3 hasPrefix:@"es"])
  {
    int v4 = 29;
  }
  else if ([v3 hasPrefix:@"sv"])
  {
    int v4 = 30;
  }
  else if ([v3 hasPrefix:@"th"])
  {
    int v4 = 31;
  }
  else if ([v3 hasPrefix:@"tr"])
  {
    int v4 = 32;
  }
  else if ([v3 hasPrefix:@"uk"])
  {
    int v4 = 33;
  }
  else if ([v3 hasPrefix:@"ur"])
  {
    int v4 = 34;
  }
  else if ([v3 hasPrefix:@"hy"])
  {
    int v4 = 35;
  }
  else if ([v3 hasPrefix:@"bn"])
  {
    int v4 = 36;
  }
  else if ([v3 hasPrefix:@"pa"])
  {
    int v4 = 37;
  }
  else if ([v3 hasPrefix:@"gu"])
  {
    int v4 = 38;
  }
  else if ([v3 hasPrefix:@"or"])
  {
    int v4 = 39;
  }
  else if ([v3 hasPrefix:@"ta"])
  {
    int v4 = 40;
  }
  else if ([v3 hasPrefix:@"te"])
  {
    int v4 = 41;
  }
  else if ([v3 hasPrefix:@"kn"])
  {
    int v4 = 42;
  }
  else if ([v3 hasPrefix:@"ml"])
  {
    int v4 = 43;
  }
  else if ([v3 hasPrefix:@"si"])
  {
    int v4 = 44;
  }
  else if ([v3 hasPrefix:@"lo"])
  {
    int v4 = 45;
  }
  else if ([v3 hasPrefix:@"bo"])
  {
    int v4 = 46;
  }
  else if ([v3 hasPrefix:@"my"])
  {
    int v4 = 47;
  }
  else if ([v3 hasPrefix:@"ka"])
  {
    int v4 = 48;
  }
  else if ([v3 hasPrefix:@"am"])
  {
    int v4 = 49;
  }
  else if ([v3 hasPrefix:@"chr"])
  {
    int v4 = 50;
  }
  else if ([v3 hasPrefix:@"iu"])
  {
    int v4 = 51;
  }
  else if ([v3 hasPrefix:@"km"])
  {
    int v4 = 52;
  }
  else if ([v3 hasPrefix:@"mn"])
  {
    int v4 = 53;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)_allLangIDs
{
  return &unk_1EDC63270;
}

- ($1230CF39250A084FEEB876D19862D23B)_languageHintsEvenlyDistributedWithProbability:(float)a3 excludingHints:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(AXLanguageTaggedContent *)self _allLangIDs];
  uint64_t v8 = ($1230CF39250A084FEEB876D19862D23B *)malloc_type_malloc(8 * [v7 count], 0x100004000313F17uLL);
  uint64_t v9 = [v7 count];
  uint64_t v10 = [v6 count];
  float v11 = 0.0;
  if (v9 != v10) {
    float v11 = a3 / (float)(unint64_t)(v9 - v10);
  }
  if ([v7 count])
  {
    unint64_t v12 = 0;
    p_var1 = &v8->var1;
    do
    {
      long long v14 = [v7 objectAtIndexedSubscript:v12];
      *((_DWORD *)p_var1 - 1) = [v14 intValue];

      char v15 = [v7 objectAtIndexedSubscript:v12];
      v16 = [v6 objectForKey:v15];

      if (v16)
      {
        uint64_t v17 = [v7 objectAtIndexedSubscript:v12];
        v18 = [v6 objectForKey:v17];
        [v18 floatValue];
        *(_DWORD *)p_var1 = v19;
      }
      else
      {
        float *p_var1 = v11;
      }
      ++v12;
      p_var1 += 2;
    }
    while ([v7 count] > v12);
  }

  return v8;
}

- (id)_overrideLanguageDetection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = +[AXLanguageManager sharedInstance];
  uint64_t v5 = [v4 dialectForSystemLanguage];
  id v6 = [v5 specificLanguageID];

  if ([v3 hasPrefix:@"zh"]
    && ([v6 hasPrefix:@"ja"] & 1) != 0
    || [v3 hasPrefix:@"ja"]
    && [v6 hasPrefix:@"zh"])
  {
    uint64_t v7 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_INFO, "Override language {%@} detection to be ja-JP", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v8 = +[AXLanguageManager sharedInstance];
    uint64_t v9 = [v8 dialectForSystemLanguage];
    id v10 = [v9 specificLanguageID];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

- (void)_searchForShorthandDates
{
  id v3 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:8 error:0];
  int v4 = [(AXLanguageTaggedContent *)self contentString];
  uint64_t v5 = [v4 length];

  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v8 = +[AXLanguageManager sharedInstance];
  uint64_t v9 = [v8 dialectForSystemLanguage];

  id v10 = (void *)MEMORY[0x1E4F1CA20];
  float v11 = [v9 specificLanguageID];
  int v12 = [v10 localeWithLocaleIdentifier:v11];
  [v7 setLocale:v12];

  id v13 = [v7 shortMonthSymbols];
  [v6 addObjectsFromArray:v13];

  uint64_t v14 = [v7 shortWeekdaySymbols];
  [v6 addObjectsFromArray:v14];

  char v15 = [(AXLanguageTaggedContent *)self contentString];
  v16 = objc_msgSend(v3, "matchesInString:options:range:", v15, 0, 0, v5);
  [(AXLanguageTaggedContent *)self setShorthandDateMatches:v16];

  uint64_t v17 = [(AXLanguageTaggedContent *)self shorthandDateMatches];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __51__AXLanguageTaggedContent__searchForShorthandDates__block_invoke;
  v23 = &unk_1E5587D30;
  v24 = self;
  id v25 = v6;
  id v18 = v6;
  int v19 = objc_msgSend(v17, "ax_filteredArrayUsingBlock:", &v20);
  -[AXLanguageTaggedContent setShorthandDateMatches:](self, "setShorthandDateMatches:", v19, v20, v21, v22, v23, v24);
}

uint64_t __51__AXLanguageTaggedContent__searchForShorthandDates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 resultType] == 8)
  {
    int v4 = [*(id *)(a1 + 32) contentString];
    uint64_t v5 = [v3 range];
    id v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(v7, "containsString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            uint64_t v9 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_isNamedEntity:(id)a3
{
  id v3 = a3;
  NLTaggerSetString();
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  [v3 length];
  NLTaggerEnumerateTokens();
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__AXLanguageTaggedContent__isNamedEntity___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = NLTaggerCopyTagForCurrentToken();
  uint64_t v6 = v5;
  if (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 2uLL)
  {
    id v8 = (void *)v5;
    uint64_t v5 = [(id)v5 isEqualToString:*MEMORY[0x1E4F5C738]];
    uint64_t v6 = (uint64_t)v8;
    if ((v5 & 1) != 0
      || (uint64_t v5 = [v8 isEqualToString:*MEMORY[0x1E4F5C740]], v6 = (uint64_t)v8, (v5 & 1) != 0)
      || (uint64_t v5 = [v8 isEqualToString:*MEMORY[0x1E4F5C730]], v6 = (uint64_t)v8, v5))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)_addLanguageTagForDateIfNecessary
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(AXLanguageTaggedContent *)self shorthandDateMatches];
  if (![v3 count])
  {
LABEL_10:

    return 0;
  }
  unint64_t v4 = [(AXLanguageTaggedContent *)self nextShorthandDateIndex];
  uint64_t v5 = [(AXLanguageTaggedContent *)self shorthandDateMatches];
  unint64_t v6 = [v5 count];

  if (v4 >= v6) {
    return 0;
  }
  uint64_t v7 = [(AXLanguageTaggedContent *)self shorthandDateMatches];
  id v3 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[AXLanguageTaggedContent nextShorthandDateIndex](self, "nextShorthandDateIndex"));

  uint64_t v8 = [v3 range];
  NSUInteger location = self->_currentChunk.location;
  NSUInteger length = self->_currentChunk.length;
  if (location != v8 || length != v9)
  {
    NSUInteger v18 = length + location;
    uint64_t v19 = [v3 range];
    if (v18 > v19 + v20) {
      [(AXLanguageTaggedContent *)self setNextShorthandDateIndex:[(AXLanguageTaggedContent *)self nextShorthandDateIndex] + 1];
    }
    goto LABEL_10;
  }
  [(AXLanguageTaggedContent *)self setNextShorthandDateIndex:[(AXLanguageTaggedContent *)self nextShorthandDateIndex] + 1];
  int v12 = +[AXLanguageManager sharedInstance];
  long long v13 = [v12 dialectForSystemLanguage];
  v23[0] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [(AXLanguageTaggedContent *)self setCurrentDialects:v14];

  long long v15 = AXLogSpokenContentTextProcessing();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    long long v16 = [(AXLanguageTaggedContent *)self currentDialects];
    int v21 = 138412290;
    v22 = v16;
    _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Setting currentDialetcs to dialectForSystemLanguage: %@", (uint8_t *)&v21, 0xCu);
  }
  [(AXLanguageTaggedContent *)self _addTag];

  return 1;
}

- (BOOL)_addLanguageTagForCurrentChunk
{
  v81[3] = *MEMORY[0x1E4F143B8];
  id v3 = +[AXLanguageManager sharedInstance];
  NSUInteger v4 = self->_currentChunk.length + self->_currentChunk.location;
  uint64_t v5 = [(AXLanguageTaggedContent *)self contentString];
  unint64_t v6 = [v5 length];

  if (v4 > v6)
  {
    uint64_t v7 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[AXLanguageTaggedContent _addLanguageTagForCurrentChunk](v7);
    }

    uint64_t v8 = [(AXLanguageTaggedContent *)self contentString];
    self->_currentChunk.NSUInteger length = [v8 length] - self->_currentChunk.location;
  }
  uint64_t v9 = +[AXSettings sharedInstance];
  char v10 = [v9 spokenContentShouldUseLanguageDetection];

  if (v10)
  {
    float v11 = [(AXLanguageTaggedContent *)self contentString];
    int v12 = objc_msgSend(v11, "substringWithRange:", self->_currentChunk.location, self->_currentChunk.length);

    if ([(AXLanguageTaggedContent *)self _addLanguageTagForDateIfNecessary])
    {
      BOOL v13 = 0;
    }
    else
    {
      v68 = v3;
      NLLanguageIdentifierCreate();
      [v12 length];
      NLLanguageIdentifierConsumeString();
      long long v14 = AXLogSpokenContentTextProcessing();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@"<newline>"];
        *(_DWORD *)buf = 138412290;
        uint64_t v75 = (uint64_t)v15;
        _os_log_impl(&dword_18D308000, v14, OS_LOG_TYPE_INFO, "Running language detection on chunk: '%@'", buf, 0xCu);
      }
      v66 = v12;

      long long v16 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      unint64_t v17 = [v16 count];
      if (v17 >= 3) {
        unint64_t v18 = 3;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v19 = objc_opt_new();
      if (v18)
      {
        uint64_t v21 = 0;
        double v22 = (double)((v18 + v18 * v18) >> 1);
        do
        {
          v23 = [NSNumber numberWithDouble:(double)v18 * 0.6 / v22];
          v24 = NSNumber;
          id v25 = [v16 objectAtIndexedSubscript:v21];
          v26 = objc_msgSend(v24, "numberWithUnsignedInt:", -[AXLanguageTaggedContent langIDforLangCode:](self, "langIDforLangCode:", v25));
          [v19 setObject:v23 forKeyedSubscript:v26];

          ++v21;
          --v18;
        }
        while (v18);
      }
      LODWORD(v20) = 1053609165;
      v27 = [(AXLanguageTaggedContent *)self _languageHintsEvenlyDistributedWithProbability:v19 excludingHints:v20];
      v28 = [(AXLanguageTaggedContent *)self _allLangIDs];
      [v28 count];
      v65 = v27;
      NLLanguageIdentifierSetLanguageHints();

      memset(v81, 0, 24);
      NLLanguageIdentifierGetTopHypotheses();
      uint64_t v29 = [MEMORY[0x1E4F1CA70] orderedSet];
      v30 = 0;
      int v12 = v66;
      if (LODWORD(v81[0]) > 1)
      {
        if (*((float *)v81 + 1) <= 0.9)
        {
          v30 = 0;
        }
        else
        {
          v62 = (void *)v29;
          uint64_t v61 = [(AXLanguageTaggedContent *)self langCodeForlangId:*((float *)v81 + 1)];
          uint64_t v31 = 1;
          *(void *)&long long v32 = 138412802;
          long long v60 = v32;
          do
          {
            if (LODWORD(v81[v31]) < 2) {
              break;
            }
            unint64_t v33 = (unint64_t)&v81[v31];
            if (*(float *)(v33 + 4) > 0.2)
            {
              long long v34 = -[AXLanguageTaggedContent langCodeForlangId:](self, "langCodeForlangId:");
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v35 = [MEMORY[0x1E4F1CA20] preferredLanguages];
              uint64_t v36 = [v35 countByEnumeratingWithState:&v69 objects:v80 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                v63 = (float *)(v33 | 4);
                uint64_t v38 = *(void *)v70;
                while (2)
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v70 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    if (objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * i), "hasPrefix:", v34, v60))
                    {
                      __int16 v40 = [v68 dialectForLanguageID:v34];
                      if (v40)
                      {
                        [v62 addObject:v40];
                        v41 = AXLogSpokenContentTextProcessing();
                        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                        {
                          double v42 = *v63;
                          *(_DWORD *)buf = v60;
                          uint64_t v75 = v61;
                          __int16 v76 = 2048;
                          double v77 = v42;
                          __int16 v78 = 2112;
                          v79 = v66;
                          _os_log_impl(&dword_18D308000, v41, OS_LOG_TYPE_INFO, "Adding secondary tag %@ with probability %f for chunk: %@", buf, 0x20u);
                        }
                      }
                      goto LABEL_38;
                    }
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v69 objects:v80 count:16];
                  if (v37) {
                    continue;
                  }
                  break;
                }
              }
LABEL_38:
            }
            ++v31;
          }
          while (v31 != 3);
          int v12 = v66;
          v30 = (void *)v61;
          uint64_t v29 = (uint64_t)v62;
        }
      }
      uint64_t v43 = (void *)v29;
      v44 = AXLogSpokenContentTextProcessing();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v75 = (uint64_t)v30;
        __int16 v76 = 2048;
        double v77 = *((float *)v81 + 1);
        __int16 v78 = 2112;
        v79 = v12;
        _os_log_impl(&dword_18D308000, v44, OS_LOG_TYPE_INFO, "Tagger chose tag '%@' with probability %f for chunk: %@", buf, 0x20u);
      }

      if (v30)
      {
        v45 = [v68 dialectForLanguageID:v30];
        v46 = [(AXLanguageTaggedContent *)self _overrideLanguageDetection:v30];

        double v47 = [v68 dialectForLanguageID:v46];
        v48 = v43;
        if (v47 != 0.0 && [v43 containsObject:*(void *)&v47]) {
          [v43 removeObject:*(void *)&v47];
        }
        if (v45 && ([v45 isEqual:*(void *)&v47] & 1) == 0) {
          [v43 addObject:v45];
        }
        v67 = v45;
        v49 = +[AXLanguageManager sharedInstance];
        v50 = [v49 dialectForSystemLanguage];
        v51 = [v50 specificLanguageID];

        v52 = [*(id *)&v47 specificLanguageID];
        BOOL v53 = ([v51 isEqualToString:v52] & 1) == 0
           && [(AXLanguageTaggedContent *)self _isNamedEntity:v12];

        BOOL v13 = v47 == 0.0 || v53;
        if (v13)
        {
          v54 = AXLogSpokenContentTextProcessing();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v75 = (uint64_t)v46;
            _os_log_impl(&dword_18D308000, v54, OS_LOG_TYPE_INFO, "Couldn't find dialect for tag %@, manually tagging", buf, 0xCu);
          }
        }
        else
        {
          v64 = v51;
          self->_predictedByTagger = 1;
          double v73 = v47;
          v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          [(AXLanguageTaggedContent *)self setCurrentDialects:v55];

          v56 = AXLogSpokenContentTextProcessing();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v75 = (uint64_t)v46;
            __int16 v76 = 2112;
            double v77 = v47;
            _os_log_impl(&dword_18D308000, v56, OS_LOG_TYPE_INFO, "Setting currentDialects to dialectForLanguageID: %@. %@", buf, 0x16u);
          }

          [(AXLanguageTaggedContent *)self _addTag];
          v57 = [(AXLanguageTaggedContent *)self tags];
          v58 = [(AXLanguageTaggedContent *)self tags];
          v54 = objc_msgSend(v57, "objectAtIndex:", objc_msgSend(v58, "count") - 1);

          if ([v48 count]) {
            [v54 addPredictedSecondaryDialects:v48];
          }
          v51 = v64;
        }
      }
      else
      {
        v46 = AXLogSpokenContentTextProcessing();
        BOOL v13 = 1;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18D308000, v46, OS_LOG_TYPE_INFO, "Tagger couldn't find a language for current chunk. Manually tagging.", buf, 2u);
        }
        v48 = v43;
      }

      NLLanguageIdentifierRelease();
      free(v65);

      id v3 = v68;
    }
  }
  else
  {
    int v12 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v12, OS_LOG_TYPE_DEFAULT, "Language detection is disabled. will manually tag", buf, 2u);
    }
    BOOL v13 = 1;
  }

  return v13;
}

- (void)_debugLog:(id)a3 token:(id)a4 range:(_NSRange)a5 script:(id)a6 dialects:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v14 = (__CFString *)a6;
  id v15 = a7;
  long long v16 = AXLogSpokenContentTextProcessing();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v17 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"<newline>"];
    v33.NSUInteger location = location;
    v33.NSUInteger length = length;
    unint64_t v18 = NSStringFromRange(v33);
    uint64_t v19 = &stru_1EDC3DEF8;
    if ([(__CFString *)v14 length]) {
      double v20 = v14;
    }
    else {
      double v20 = &stru_1EDC3DEF8;
    }
    uint64_t v21 = [v15 count];
    if (v21)
    {
      uint64_t v19 = [v15 description];
    }
    int v22 = 138413315;
    id v23 = v12;
    __int16 v24 = 2113;
    id v25 = v17;
    __int16 v26 = 2112;
    v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v20;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    _os_log_debug_impl(&dword_18D308000, v16, OS_LOG_TYPE_DEBUG, "%@ '%{private}@' %@ %@ %@", (uint8_t *)&v22, 0x34u);
    if (v21) {
  }
    }
}

- (void)tagContent
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D308000, log, OS_LOG_TYPE_DEBUG, "Will begin tagging by enumerating words", v1, 2u);
}

void __37__AXLanguageTaggedContent_tagContent__block_invoke(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *a2, v4);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)NLTaggerCopyTagForCurrentToken();
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
     + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  BOOL v7 = v3 >= v6;
  unint64_t v8 = v3 - v6;
  if (!v7)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(v9 + 24);
    if (v10) {
      *(void *)(v9 + 24) = v8 + v10;
    }
  }
  float v11 = AXLogSpokenContentTextProcessing();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12) {
    objc_msgSend(*(id *)(a1 + 40), "_debugLog:token:range:script:dialects:", @"Enumerate token:", v33, *(void *)(*(void *)(a1 + 40) + 16), *(void *)(*(void *)(a1 + 40) + 24), v5, *(void *)(*(void *)(a1 + 40) + 8));
  }
  id v13 = *(void **)(a1 + 40);
  if (v3 > v13[3] + v13[2]) {
    objc_msgSend(v13, "_manuallyProcessContentWithRange:");
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void *)(v14 + 40);
  id v15 = (id *)(v14 + 40);
  if (!v16) {
    objc_storeStrong(v15, v5);
  }
  if (v4 == 1 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v29 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(v29, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", 0));

    if (v5) {
      goto LABEL_13;
    }
LABEL_25:
    objc_msgSend(*(id *)(a1 + 40), "_manuallyProcessContentWithRange:", v3, v4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    goto LABEL_26;
  }
  if (!v5) {
    goto LABEL_25;
  }
LABEL_13:
  if (v5 != *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if ([*(id *)(a1 + 40) _addLanguageTagForCurrentChunk])
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(v17 + 16);
      uint64_t v19 = *(void *)(v17 + 24);
      *(void *)(v17 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 40), "_manuallyProcessContentWithRange:", v18, v19);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(v20 + 24);
    if (!v21)
    {
      *(void *)(v20 + 24) = v4;
      uint64_t v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      id v23 = [*(id *)(a1 + 40) tags];
      __int16 v24 = [v23 lastObject];
      [v24 setCreatedFromNewline:v22];

LABEL_23:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_26;
    }
LABEL_22:
    *(void *)(v20 + 24) = v21 + v4;
    goto LABEL_23;
  }
  id v25 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if ([v25 _addLanguageTagForCurrentChunk])
    {
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = *(void *)(v26 + 16);
      uint64_t v28 = *(void *)(v26 + 24);
      *(void *)(v26 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 40), "_manuallyProcessContentWithRange:", v27, v28);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(v20 + 24);
    if (!v21)
    {
      *(void *)(v20 + 24) = v4;
      uint64_t v31 = [*(id *)(a1 + 40) tags];
      uint64_t v32 = [v31 lastObject];
      [v32 setCreatedFromNewline:1];

      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v25[3] += v4;
LABEL_26:
  uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v30 + 32) = v3;
  *(void *)(v30 + 40) = v4;
}

- (BOOL)_isStringCombinationOfCommonAndEmoji:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AXLanguageManager sharedInstance];
  unint64_t v5 = 0;
  while (v5 < [v3 length])
  {
    unint64_t v6 = [v3 length] - v5;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3010000000;
    uint64_t v16 = &unk_18D441ED1;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    BOOL v7 = [v4 commonCharacters];
    uint64_t v17 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v7, 0, v5, v6);
    uint64_t v18 = v8;

    uint64_t v9 = v14;
    unint64_t v10 = v14[4];
    if (v10 <= v5)
    {
      if (v10 != v5)
      {
LABEL_8:
        _Block_object_dispose(&v13, 8);
        BOOL v11 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      [v3 length];
      CEMEnumerateEmojiTokensInStringWithBlock();
      uint64_t v9 = v14;
      if (v14[4] > v5) {
        goto LABEL_8;
      }
    }
    v5 += v9[5];
    _Block_object_dispose(&v13, 8);
  }
  BOOL v11 = v5 == [v3 length];
LABEL_9:

  return v11;
}

uint64_t __64__AXLanguageTaggedContent__isStringCombinationOfCommonAndEmoji___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a3 >= *(void *)(result + 40))
  {
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (BOOL)langMapIsSignificant:(id)a3
{
  return 1;
}

- (id)significantAmbiguousLangMapsForUserKeyboards
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[AXLanguageManager sharedInstance];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(v2, "ambiguousDialectsFromUserKeyboardPreferences", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) langMap];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)unambiguousLangMaps
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        unint64_t v10 = objc_msgSend(v9, "unambiguousDialects", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) langMap];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)ambiguousLangMaps
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        unint64_t v10 = objc_msgSend(v9, "ambiguousDialects", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) langMap];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)hasOnlyWesternLangMaps
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v3)
  {
    BOOL v21 = 1;
    goto LABEL_27;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v33;
  uint64_t v23 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v33 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v8 = [v7 unambiguousDialects];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
LABEL_8:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) langMap];
          int v14 = [v13 isWestern];

          if (!v14) {
            goto LABEL_25;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v10) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v8 = [v7 ambiguousDialects];
      uint64_t v15 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
LABEL_16:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v8);
          }
          long long v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v18) langMap];
          int v20 = [v19 isWestern];

          if (!v20) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
            if (v16) {
              goto LABEL_16;
            }
            goto LABEL_22;
          }
        }
LABEL_25:

        BOOL v21 = 0;
        goto LABEL_27;
      }
LABEL_22:

      uint64_t v5 = v23;
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
    BOOL v21 = 1;
    if (v4) {
      continue;
    }
    break;
  }
LABEL_27:

  return v21;
}

- (BOOL)hasOnlyNonWesternLangMaps
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = [(AXLanguageTaggedContent *)self tags];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v3)
  {
    BOOL v21 = 1;
    goto LABEL_27;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v33;
  uint64_t v23 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v33 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v8 = [v7 unambiguousDialects];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
LABEL_8:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) langMap];
          char v14 = [v13 isWestern];

          if (v14) {
            goto LABEL_25;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v10) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v8 = [v7 ambiguousDialects];
      uint64_t v15 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
LABEL_16:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v8);
          }
          long long v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v18) langMap];
          char v20 = [v19 isWestern];

          if (v20) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
            if (v16) {
              goto LABEL_16;
            }
            goto LABEL_22;
          }
        }
LABEL_25:

        BOOL v21 = 0;
        goto LABEL_27;
      }
LABEL_22:

      uint64_t v5 = v23;
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v32 objects:v38 count:16];
    BOOL v21 = 1;
    if (v4) {
      continue;
    }
    break;
  }
LABEL_27:

  return v21;
}

- (id)_preferredLanguagesForTagging
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = +[AXSettings sharedInstance];
  uint64_t v3 = [v2 spokenContentDefaultFallbackLanguage];

  if (v3)
  {
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_manuallyProcessContentWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AXLogSpokenContentTextProcessing();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    uint64_t v7 = [(AXLanguageTaggedContent *)self contentString];
    uint64_t v8 = objc_msgSend(v7, "substringWithRange:", location, length);
    [(AXLanguageTaggedContent *)self _debugLog:@"Manual process:", v8, location, length, 0, self->_currentDialects token range script dialects];
  }
  v67 = +[AXLanguageManager sharedInstance];
  if (length)
  {
    uint64_t v10 = 0;
    *(void *)&long long v9 = 138413315;
    long long v66 = v9;
    do
    {
      uint64_t v11 = [(AXLanguageTaggedContent *)self contentString];
      uint64_t v12 = [v11 rangeOfComposedCharacterSequenceAtIndex:location + v10];
      uint64_t v14 = v13;

      uint64_t v15 = [(AXLanguageTaggedContent *)self contentString];
      uint64_t v16 = objc_msgSend(v15, "substringWithRange:", v12, v14);

      uint64_t v17 = AXLogSpokenContentTextProcessing();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        long long v31 = [NSNumber numberWithInteger:v10];
        long long v32 = [NSNumber numberWithUnsignedInteger:length];
        long long v33 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"<newline>"];
        if (self->_currentDialects) {
          currentDialects = self->_currentDialects;
        }
        else {
          currentDialects = (NSArray *)&stru_1EDC3DEF8;
        }
        long long v35 = NSStringFromRange(self->_currentChunk);
        *(_DWORD *)double v77 = v66;
        *(void *)&v77[4] = v31;
        *(_WORD *)&v77[12] = 2112;
        *(void *)&v77[14] = v32;
        *(_WORD *)&v77[22] = 2113;
        __int16 v78 = v33;
        __int16 v79 = 2112;
        v80 = currentDialects;
        __int16 v81 = 2112;
        v82 = v35;
        _os_log_debug_impl(&dword_18D308000, v17, OS_LOG_TYPE_DEBUG, "Iterate char %@/%@: '%{private}@' %@ %@", v77, 0x34u);
      }
      uint64_t v18 = [v16 characterAtIndex:0];
      if ([v16 length] == 1 && objc_msgSend(v67, "isCharacterCommon:", v18))
      {
        long long v19 = AXLogSpokenContentTextProcessing();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          if (self->_currentDialects) {
            v48 = self->_currentDialects;
          }
          else {
            v48 = (NSArray *)&stru_1EDC3DEF8;
          }
          v49 = NSStringFromRange(self->_currentChunk);
          *(_DWORD *)double v77 = 138412546;
          *(void *)&v77[4] = v48;
          *(_WORD *)&v77[12] = 2112;
          *(void *)&v77[14] = v49;
          _os_log_debug_impl(&dword_18D308000, v19, OS_LOG_TYPE_DEBUG, "Skipping common char. %@ %@", v77, 0x16u);
        }
      }
      else
      {
        if ([(NSArray *)self->_currentDialects count])
        {
          *(void *)double v77 = 0;
          *(void *)&v77[8] = v77;
          *(void *)&v77[16] = 0x2020000000;
          LOBYTE(v78) = 0;
          if (AXLanguageIsSpeakableEmojiString())
          {
            *(unsigned char *)(*(void *)&v77[8] + 24) = 1;
LABEL_23:
            long long v22 = AXLogSpokenContentTextProcessing();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v44 = self->_currentDialects;
              v45 = NSStringFromRange(self->_currentChunk);
              *(_DWORD *)buf = 138412546;
              v74 = v44;
              __int16 v75 = 2112;
              __int16 v76 = v45;
              _os_log_debug_impl(&dword_18D308000, v22, OS_LOG_TYPE_DEBUG, "Add to exisiting %@ %@", buf, 0x16u);
            }
          }
          else
          {
            BOOL v21 = self->_currentDialects;
            v69[0] = MEMORY[0x1E4F143A8];
            v69[1] = 3221225472;
            v69[2] = __60__AXLanguageTaggedContent__manuallyProcessContentWithRange___block_invoke;
            v69[3] = &unk_1E5587DD0;
            id v70 = v16;
            long long v71 = v77;
            [(NSArray *)v21 enumerateObjectsUsingBlock:v69];

            if (*(unsigned char *)(*(void *)&v77[8] + 24)) {
              goto LABEL_23;
            }
            uint64_t v23 = [(AXLanguageTaggedContent *)self _preferredLanguagesForTagging];
            long long v22 = [v67 dialectsThatCanSpeakCharacter:v18 overridePreferredLanguages:v23 allowTransliteration:0 preferOverrides:1];

            if ([v22 count])
            {
              if (self->_currentDialects) {
                [(AXLanguageTaggedContent *)self _addTag];
              }
              [(AXLanguageTaggedContent *)self setCurrentDialects:v22];
              long long v24 = AXLogSpokenContentTextProcessing();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                long long v25 = [(AXLanguageTaggedContent *)self _preferredLanguagesForTagging];
                *(_DWORD *)buf = 138412290;
                v74 = v25;
                _os_log_impl(&dword_18D308000, v24, OS_LOG_TYPE_INFO, "OverridePreferredLanguages: %@", buf, 0xCu);
              }
              long long v26 = AXLogSpokenContentTextProcessing();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                long long v27 = [(AXLanguageTaggedContent *)self currentDialects];
                *(_DWORD *)buf = 138412290;
                v74 = v27;
                _os_log_impl(&dword_18D308000, v26, OS_LOG_TYPE_INFO, "Setting currentDialects to dialectsThatCanSpeakCharacter: %@", buf, 0xCu);
              }
              long long v28 = AXLogSpokenContentTextProcessing();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                long long v29 = self->_currentDialects;
                long long v30 = NSStringFromRange(self->_currentChunk);
                *(_DWORD *)buf = 138412546;
                v74 = v29;
                __int16 v75 = 2112;
                __int16 v76 = v30;
                _os_log_impl(&dword_18D308000, v28, OS_LOG_TYPE_INFO, "Start new chunk %@ %@", buf, 0x16u);
              }
            }
            else
            {
              long long v28 = AXLogSpokenContentTextProcessing();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                double v42 = self->_currentDialects;
                uint64_t v43 = NSStringFromRange(self->_currentChunk);
                *(_DWORD *)buf = 138412546;
                v74 = v42;
                __int16 v75 = 2112;
                __int16 v76 = v43;
                _os_log_impl(&dword_18D308000, v28, OS_LOG_TYPE_INFO, "Char is unspeakable. %@ %@", buf, 0x16u);
              }
            }
          }
          _Block_object_dispose(v77, 8);
          goto LABEL_26;
        }
        char v20 = AXLogSpokenContentTextProcessing();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          if (self->_currentDialects) {
            v46 = self->_currentDialects;
          }
          else {
            v46 = (NSArray *)&stru_1EDC3DEF8;
          }
          double v47 = NSStringFromRange(self->_currentChunk);
          *(_DWORD *)double v77 = 138412546;
          *(void *)&v77[4] = v46;
          *(_WORD *)&v77[12] = 2112;
          *(void *)&v77[14] = v47;
          _os_log_debug_impl(&dword_18D308000, v20, OS_LOG_TYPE_DEBUG, "No current dialects. %@ %@", v77, 0x16u);
        }
        if ((AXLanguageIsSpeakableEmojiString() & 1) != 0 || [v16 length] != 1) {
          goto LABEL_26;
        }
        if (v18 == 8722) {
          uint64_t v18 = 45;
        }
        else {
          uint64_t v18 = v18;
        }
        if (![v67 isCharacterCommon:v18])
        {
          uint64_t v36 = [(AXLanguageTaggedContent *)self _preferredLanguagesForTagging];
          uint64_t v37 = [v67 dialectsThatCanSpeakCharacter:v18 overridePreferredLanguages:v36 allowTransliteration:0 preferOverrides:1];
          [(AXLanguageTaggedContent *)self setCurrentDialects:v37];

          uint64_t v38 = AXLogSpokenContentTextProcessing();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            uint64_t v39 = [(AXLanguageTaggedContent *)self _preferredLanguagesForTagging];
            *(_DWORD *)double v77 = 138412290;
            *(void *)&v77[4] = v39;
            _os_log_impl(&dword_18D308000, v38, OS_LOG_TYPE_INFO, "OverridePreferredLanguages: %@", v77, 0xCu);
          }
          __int16 v40 = AXLogSpokenContentTextProcessing();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = [(AXLanguageTaggedContent *)self currentDialects];
            *(_DWORD *)double v77 = 138412290;
            *(void *)&v77[4] = v41;
            _os_log_impl(&dword_18D308000, v40, OS_LOG_TYPE_INFO, "Setting currentDialects to dialectsThatCanSpeakCharacter: %@", v77, 0xCu);
          }
          goto LABEL_26;
        }
        long long v19 = AXLogSpokenContentTextProcessing();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          if (self->_currentDialects) {
            v50 = self->_currentDialects;
          }
          else {
            v50 = (NSArray *)&stru_1EDC3DEF8;
          }
          v51 = NSStringFromRange(self->_currentChunk);
          *(_DWORD *)double v77 = 138412546;
          *(void *)&v77[4] = v50;
          *(_WORD *)&v77[12] = 2112;
          *(void *)&v77[14] = v51;
          _os_log_debug_impl(&dword_18D308000, v19, OS_LOG_TYPE_DEBUG, "Skipping first common char. %@ %@", v77, 0x16u);
        }
      }

LABEL_26:
      ++self->_currentChunk.length;

      ++v10;
    }
    while (length != v10);
  }
  v52 = +[AXLanguageManager sharedInstance];
  BOOL v53 = [v52 dialectForCurrentLocale];

  if (!v53)
  {
    v54 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      uint64_t v61 = [v67 systemLanguageID];
      v62 = [v67 userLocale];
      v63 = [v62 objectForKey:*MEMORY[0x1E4F1C438]];
      v64 = [v67 userLocale];
      v65 = [v64 objectForKey:*MEMORY[0x1E4F1C400]];
      *(_DWORD *)double v77 = 138412802;
      *(void *)&v77[4] = v61;
      *(_WORD *)&v77[12] = 2112;
      *(void *)&v77[14] = v63;
      *(_WORD *)&v77[22] = 2112;
      __int16 v78 = v65;
      _os_log_impl(&dword_18D308000, v54, OS_LOG_TYPE_INFO, "Failed to find dialect map for system language: %@, locale language: %@, locale region: %@", v77, 0x20u);
    }
    goto LABEL_68;
  }
  v54 = [(AXLanguageTaggedContent *)self currentDialects];
  if ([v54 containsObject:v53])
  {
LABEL_68:

    goto LABEL_69;
  }
  v55 = [v53 speakableCharacters];
  BOOL v56 = v55 == 0;

  if (v56)
  {
    long long v72 = v53;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    v58 = [(AXLanguageTaggedContent *)self currentDialects];
    v59 = [v57 arrayByAddingObjectsFromArray:v58];
    [(AXLanguageTaggedContent *)self setCurrentDialects:v59];

    v54 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      long long v60 = [v53 specificLanguageID];
      *(_DWORD *)double v77 = 138412290;
      *(void *)&v77[4] = v60;
      _os_log_impl(&dword_18D308000, v54, OS_LOG_TYPE_INFO, "Adding language %@ to content because we don't have spoken range", v77, 0xCu);
    }
    goto LABEL_68;
  }
LABEL_69:
}

uint64_t __60__AXLanguageTaggedContent__manuallyProcessContentWithRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 canSpeakString:*(void *)(a1 + 32) allowsTransliteration:0];
  if (result)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_addTag
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D308000, log, OS_LOG_TYPE_FAULT, "Current dialects unexpectedly nil", v1, 2u);
}

- (id)primaryAmbiguousDialect
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [(AXLanguageTaggedContent *)self ambiguousLangMaps];
  uint64_t v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 spokenContentDefaultFallbackLanguage];

  if (v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v11 = [v10 generalLanguageID];
          char v12 = [v11 isEqual:v4];

          if (v12)
          {
            long long v22 = [v10 defaultDialect];
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v13 = +[AXLanguageManager sharedInstance];
  id v5 = [v13 systemLanguageID];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v2;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
LABEL_13:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v25 != v17) {
        objc_enumerationMutation(v14);
      }
      long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
      char v20 = objc_msgSend(v19, "generalLanguageID", (void)v24);
      char v21 = [v20 isEqual:v5];

      if (v21) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v16) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:

    long long v19 = [v14 firstObject];
    id v14 = v19;
  }
  long long v22 = objc_msgSend(v19, "defaultDialect", (void)v24);

LABEL_22:

  return v22;
}

- (id)primaryUnambiguousDialect
{
  v2 = [(AXLanguageTaggedContent *)self unambiguousLangMaps];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [v3 defaultDialect];

  return v4;
}

- (void)updateTagsForLocalePrefChange
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(AXLanguageTaggedContent *)self tags];
  uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v33;
    unint64_t v2 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v32 + 1) + 8 * v3);
        id v5 = [*(id *)(v2 + 2672) orderedSet];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v6 = [v4 ambiguousDialects];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v29;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v29 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * v10) langMap];
              char v12 = [v11 defaultDialect];
              [v5 addObject:v12];

              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v8);
        }

        uint64_t v13 = [*(id *)(v2 + 2672) orderedSet];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v14 = [v4 unambiguousDialects];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v18) langMap];
              char v20 = [v19 defaultDialect];
              [v13 addObject:v20];

              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
          }
          while (v16);
        }

        [v4 setAmbiguousDialects:v5];
        [v4 setUnambiguousDialects:v13];

        ++v3;
        unint64_t v2 = 0x1E4F1C000;
      }
      while (v3 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v23);
  }
}

- (NSMutableArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (BOOL)isTagged
{
  return self->_tagged;
}

- (void)setTagged:(BOOL)a3
{
  self->_tagged = a3;
}

- (NSMutableOrderedSet)unpredictedAmbiguousLangMaps
{
  return self->_unpredictedAmbiguousLangMaps;
}

- (void)setUnpredictedAmbiguousLangMaps:(id)a3
{
}

- (NSString)userPreferredLangID
{
  return self->_userPreferredLangID;
}

- (void)setUserPreferredLangID:(id)a3
{
}

- (NSMutableOrderedSet)predictedSecondaryLangMaps
{
  return self->_predictedSecondaryLangMaps;
}

- (void)setPredictedSecondaryLangMaps:(id)a3
{
}

- (NSMutableString)contentString
{
  return self->_contentString;
}

- (void)setContentString:(id)a3
{
}

- (NSArray)currentDialects
{
  return self->_currentDialects;
}

- (void)setCurrentDialects:(id)a3
{
}

- (NSArray)shorthandDateMatches
{
  return self->_shorthandDateMatches;
}

- (void)setShorthandDateMatches:(id)a3
{
}

- (unint64_t)nextShorthandDateIndex
{
  return self->_nextShorthandDateIndex;
}

- (void)setNextShorthandDateIndex:(unint64_t)a3
{
  self->_nextShorthandDateIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shorthandDateMatches, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
  objc_storeStrong((id *)&self->_predictedSecondaryLangMaps, 0);
  objc_storeStrong((id *)&self->_userPreferredLangID, 0);
  objc_storeStrong((id *)&self->_unpredictedAmbiguousLangMaps, 0);
  objc_storeStrong((id *)&self->_tags, 0);

  objc_storeStrong((id *)&self->_currentDialects, 0);
}

- (void)_addLanguageTagForCurrentChunk
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D308000, log, OS_LOG_TYPE_FAULT, "The current chunk is too long, we are out of bounds. Our bookkeeping got out of sync somewhere. Please file a radar with the exact text you tried to speak.", v1, 2u);
}

@end