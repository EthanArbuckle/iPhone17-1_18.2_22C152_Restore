@interface EMFEmojiLocaleData
+ (EMFEmojiLocaleData)emojiLocaleDataWithCEMEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3;
+ (EMFEmojiLocaleData)emojiLocaleDataWithLocaleIdentifier:(id)a3;
- (EMFAnchoredSearchManager)anchoredSearchManager;
- (EMFEmojiLocaleData)initWithCEMEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3;
- (EMFEmojiLocaleData)initWithLocaleIdentifier:(id)a3;
- (EMFEmojiSearchEngine)searchEngine;
- (NSArray)emojiTokens;
- (NSString)localeIdentifier;
- (__EmojiLocaleDataWrapper)emojiLocaleDataRef;
- (id)_rawSearchEngineReference;
- (id)description;
- (id)emojiTokensForOptions:(unint64_t)a3 presentationStyle:(int)a4;
- (id)emojiTokensForText:(id)a3 phoneticReading:(id)a4 options:(unint64_t)a5 searchType:(int)a6 includePrefixMatches:(BOOL)a7;
- (unint64_t)cfCompareFlagsFromNSOptions:(unint64_t)a3;
- (void)dealloc;
- (void)enumerateAnchoredReplacementCandidatesForContext:(id)a3 withOptions:(unsigned int)a4 usingBlock:(id)a5;
- (void)enumerateSearchResultsInText:(id)a3 range:(_NSRange)a4 options:(unint64_t)a5 searchType:(int)a6 usingBlock:(id)a7;
- (void)preheatSearchEngine;
- (void)searchEngine;
@end

@implementation EMFEmojiLocaleData

+ (EMFEmojiLocaleData)emojiLocaleDataWithCEMEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCEMEmojiLocaleData:a3];
  return (EMFEmojiLocaleData *)v3;
}

- (EMFEmojiLocaleData)initWithCEMEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)EMFEmojiLocaleData;
    v4 = [(EMFEmojiLocaleData *)&v8 init];
    if (v4)
    {
      uint64_t v5 = [(id)CEMEmojiLocaleDataGetLocaleIdentifier() copy];
      localeIdentifier = v4->_localeIdentifier;
      v4->_localeIdentifier = (NSString *)v5;

      v4->_localeDataRef = (__EmojiLocaleDataWrapper *)CFRetain(a3);
      v4->_didTryLoadingSearchEngine = 0;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

+ (EMFEmojiLocaleData)emojiLocaleDataWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithLocaleIdentifier:v4];

  return (EMFEmojiLocaleData *)v5;
}

- (EMFEmojiLocaleData)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFEmojiLocaleData;
  uint64_t v5 = [(EMFEmojiLocaleData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    v5->_localeDataRef = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
  }

  return v5;
}

- (void)dealloc
{
  localeDataRef = self->_localeDataRef;
  if (localeDataRef) {
    CFRelease(localeDataRef);
  }
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = 0;
  self->_localeDataRef = 0;

  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiLocaleData;
  [(EMFEmojiLocaleData *)&v5 dealloc];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [v3 appendFormat:@"; locale = \"%@\"", self->_localeIdentifier];
  return v3;
}

- (NSArray)emojiTokens
{
  v2 = (const void *)CEMEmojiLocaleDataCopyCommonEmojiTokens();
  v3 = +[EMFEmojiToken emojiTokensForCEMEmojiTokens:v2];
  if (v2) {
    CFRelease(v2);
  }
  return (NSArray *)v3;
}

- (unint64_t)cfCompareFlagsFromNSOptions:(unint64_t)a3
{
  return (a3 & 0x3CD | (16 * ((a3 >> 1) & 1))) ^ 0x10;
}

- (void)enumerateSearchResultsInText:(id)a3 range:(_NSRange)a4 options:(unint64_t)a5 searchType:(int)a6 usingBlock:(id)a7
{
  id v10 = a7;
  if (v10)
  {
    id v11 = a3;
    [(EMFEmojiLocaleData *)self cfCompareFlagsFromNSOptions:a5];
    id v12 = v10;
    CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();
  }
}

void __87__EMFEmojiLocaleData_enumerateSearchResultsInText_range_options_searchType_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[EMFEmojiToken emojiTokensForCEMEmojiTokens:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)emojiTokensForText:(id)a3 phoneticReading:(id)a4 options:(unint64_t)a5 searchType:(int)a6 includePrefixMatches:(BOOL)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [(EMFEmojiLocaleData *)self searchEngine];

  if (v12)
  {
    v13 = [(EMFEmojiLocaleData *)self searchEngine];
    v14 = [v13 performStringQuery:v10];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v25 = v11;
      v19 = 0;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        v22 = v19;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v16);
          }
          v19 = +[EMFEmojiToken emojiTokenWithString:*(void *)(*((void *)&v26 + 1) + 8 * v21) localeData:self];

          [v15 addObject:v19];
          ++v21;
          v22 = v19;
        }
        while (v18 != v21);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);

      id v11 = v25;
    }
  }
  else
  {
    [(EMFEmojiLocaleData *)self cfCompareFlagsFromNSOptions:a5];
    EmojiTokensForString = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
    id v15 = +[EMFEmojiToken emojiTokensForCEMEmojiTokens:EmojiTokensForString];
    if (EmojiTokensForString) {
      CFRelease(EmojiTokensForString);
    }
  }

  return v15;
}

- (id)emojiTokensForOptions:(unint64_t)a3 presentationStyle:(int)a4
{
  char v4 = a3;
  uint64_t v6 = (const void *)CEMCopyEmojiTokens();
  v7 = +[EMFEmojiToken emojiTokensForCEMEmojiTokens:v6];
  if (v6) {
    CFRelease(v6);
  }
  if ((v4 & 4) != 0)
  {
    objc_super v8 = (void *)[v7 mutableCopy];
    objc_super v9 = +[EMFEmojiCategory categoryWithIdentifier:@"EMFEmojiCategoryFlags"];
    id v10 = [v9 emojiTokensForLocaleData:self];
    [v8 removeObjectsInArray:v10];

    v7 = v8;
  }
  return v7;
}

- (EMFEmojiSearchEngine)searchEngine
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  searchEngine = self->_searchEngine;
  if (!searchEngine)
  {
    if (self->_didTryLoadingSearchEngine)
    {
      searchEngine = 0;
    }
    else
    {
      char v4 = emf_signpost_get_log();
      os_signpost_id_t v5 = os_signpost_id_generate(v4);

      uint64_t v6 = emf_signpost_get_log();
      v7 = v6;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        LOWORD(v22) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B8C45000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LoadSearchEngine", (const char *)&unk_1B8CB9A5E, (uint8_t *)&v22, 2u);
      }

      p_localeIdentifier = &self->_localeIdentifier;
      localeIdentifier = self->_localeIdentifier;
      self->_didTryLoadingSearchEngine = 1;
      id v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:localeIdentifier];
      if (+[EMFEmojiSearchEngine isLocaleSupported:v10])
      {
        id v11 = [[EMFEmojiSearchEngine alloc] initWithLocale:v10];
      }
      else
      {
        id v12 = emf_logging_get_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = *p_localeIdentifier;
          int v22 = 138412290;
          v23 = v13;
          _os_log_impl(&dword_1B8C45000, v12, OS_LOG_TYPE_INFO, "CoreEmoji disabled search engine for locale '%@'; not loading search engine resources",
            (uint8_t *)&v22,
            0xCu);
        }

        id v11 = 0;
      }
      v14 = self->_searchEngine;
      self->_searchEngine = v11;

      id v15 = self->_searchEngine;
      id v16 = emf_logging_get_default_log();
      uint64_t v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          [(EMFEmojiLocaleData *)(uint64_t *)&self->_localeIdentifier searchEngine];
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *p_localeIdentifier;
        int v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1B8C45000, v17, OS_LOG_TYPE_INFO, "Emoji search engine could not be loaded for locale '%@'", (uint8_t *)&v22, 0xCu);
      }

      v19 = emf_signpost_get_log();
      uint64_t v20 = v19;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        LOWORD(v22) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B8C45000, v20, OS_SIGNPOST_INTERVAL_END, v5, "LoadSearchEngine", (const char *)&unk_1B8CB9A5E, (uint8_t *)&v22, 2u);
      }

      searchEngine = self->_searchEngine;
    }
  }
  return searchEngine;
}

- (void)preheatSearchEngine
{
  id v3 = [(EMFEmojiLocaleData *)self searchEngine];
  id v4 = [(EMFEmojiLocaleData *)self searchEngine];
  [v4 preheat];
}

- (id)_rawSearchEngineReference
{
  return self->_searchEngine;
}

- (EMFAnchoredSearchManager)anchoredSearchManager
{
  anchoredSearchManager = self->_anchoredSearchManager;
  if (!anchoredSearchManager)
  {
    id v4 = [[EMFAnchoredSearchManager alloc] initWithLocaleData:self];
    os_signpost_id_t v5 = self->_anchoredSearchManager;
    self->_anchoredSearchManager = v4;

    anchoredSearchManager = self->_anchoredSearchManager;
  }
  return anchoredSearchManager;
}

- (void)enumerateAnchoredReplacementCandidatesForContext:(id)a3 withOptions:(unsigned int)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(EMFEmojiLocaleData *)self anchoredSearchManager];
  [v10 enumerateAnchoredReplacementCandidatesForContext:v9 withOptions:a4 usingBlock:v8];
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (__EmojiLocaleDataWrapper)emojiLocaleDataRef
{
  return self->_localeDataRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchoredSearchManager, 0);
  objc_storeStrong((id *)&self->_searchEngine, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)searchEngine
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_DEBUG, "Loaded emoji search engine for locale '%@'", (uint8_t *)&v3, 0xCu);
}

@end