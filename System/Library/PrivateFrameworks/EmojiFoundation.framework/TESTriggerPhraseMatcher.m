@interface TESTriggerPhraseMatcher
- (NSLocale)locale;
- (TESTriggerPhraseCollection)phrases;
- (TESTriggerPhraseMatcher)initWithLocale:(id)a3;
- (id)createMatchResultForMatchRange:(_NSRange)a3 sourceString:(id)a4 effectType:(int64_t)a5;
- (id)matchesForString:(id)a3 searchRange:(_NSRange)a4;
- (void)setPhrases:(id)a3;
@end

@implementation TESTriggerPhraseMatcher

- (TESTriggerPhraseMatcher)initWithLocale:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TESTriggerPhraseMatcher;
  v5 = [(TESTriggerPhraseMatcher *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = [TESTriggerPhraseCollection alloc];
    v9 = [(TESTriggerPhraseMatcher *)v5 locale];
    uint64_t v10 = [(TESTriggerPhraseCollection *)v8 initWithLocale:v9];
    phrases = v5->_phrases;
    v5->_phrases = (TESTriggerPhraseCollection *)v10;
  }
  return v5;
}

- (id)createMatchResultForMatchRange:(_NSRange)a3 sourceString:(id)a4 effectType:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v9 = objc_alloc_init(TESMatchResult);
  [(TESMatchResult *)v9 setMatchType:0];
  [(TESMatchResult *)v9 setEffectType:a5];
  -[TESMatchResult setMatchRange:](v9, "setMatchRange:", location, length);
  [(TESMatchResult *)v9 setSourceString:v8];

  uint64_t v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [(TESMatchResult *)v9 setMatcherClass:v11];

  return v9;
}

- (id)matchesForString:(id)a3 searchRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  phrases = self->_phrases;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke;
  v15[3] = &unk_1E61A9A00;
  v15[4] = self;
  id v16 = v7;
  id v10 = v8;
  id v17 = v10;
  id v11 = v7;
  -[TESTriggerPhraseCollection enumerateMatchStringsInString:searchRange:usingBlock:](phrases, "enumerateMatchStringsInString:searchRange:usingBlock:", v11, location, length, v15);
  v12 = v17;
  id v13 = v10;

  return v13;
}

void __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5 = objc_msgSend(*(id *)(a1 + 32), "createMatchResultForMatchRange:sourceString:effectType:", a2, a3, *(void *)(a1 + 40), a4);
  if ([v5 effectType] == 1)
  {
    uint64_t v6 = [v5 matchingSubString];
    id v7 = [v6 uppercaseString];
    id v8 = [v5 matchingSubString];
    int v9 = [v7 isEqualToString:v8];

    if (v9) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v5 setSuggestionBehavior:v10];
  }
  id v11 = emf_logging_get_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke_cold_1(v5, v11);
  }

  [*(id *)(a1 + 48) addObject:v5];
}

- (TESTriggerPhraseCollection)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

void __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 matchingSubString];
  v5 = [a1 matcherClass];
  int v6 = 138478083;
  id v7 = v4;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_debug_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_DEBUG, "[TESPhraseMatcher]: found result '%{private}@' (matcher class: %{public}@)", (uint8_t *)&v6, 0x16u);
}

@end