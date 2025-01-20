@interface TESMatcher
- (NSLocale)locale;
- (NSMutableArray)matchers;
- (TESMatcher)initWithLocale:(id)a3;
- (TESTriggerPhraseMatcher)phraseMatcher;
- (void)_loadPatternMatchers;
- (void)asynchronouslyEnumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)setMatchers:(id)a3;
- (void)setPhraseMatcher:(id)a3;
@end

@implementation TESMatcher

- (TESMatcher)initWithLocale:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TESMatcher;
  v5 = [(TESMatcher *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    [(TESMatcher *)v5 _loadPatternMatchers];
  }

  return v5;
}

- (void)enumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = (void (**)(id, void, char *))a6;
  char v30 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_matchers;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(obj);
      }
      if (v30) {
        break;
      }
      v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v13), "matchesForString:searchRange:", v8, a4.location, a4.length);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
LABEL_9:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          if (v30) {
            break;
          }
          v9[2](v9, *(void *)(*((void *)&v22 + 1) + 8 * v19++), &v30);
          if (v17 == v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v31 count:16];
            if (v17) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      if (++v13 == v11)
      {
        uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)asynchronouslyEnumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = (void (**)(id, void, char *))a6;
  char v30 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_matchers;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(obj);
      }
      if (v30) {
        break;
      }
      v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v13), "matchesForString:searchRange:", v8, a4.location, a4.length);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
LABEL_9:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          if (v30) {
            break;
          }
          v9[2](v9, *(void *)(*((void *)&v22 + 1) + 8 * v19++), &v30);
          if (v17 == v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v31 count:16];
            if (v17) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      if (++v13 == v11)
      {
        uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_loadPatternMatchers
{
  v3 = [TESTriggerPhraseMatcher alloc];
  id v4 = [(TESMatcher *)self locale];
  v5 = [(TESTriggerPhraseMatcher *)v3 initWithLocale:v4];
  phraseMatcher = self->_phraseMatcher;
  self->_phraseMatcher = v5;

  matchers = self->_matchers;
  if (!matchers || ![(NSMutableArray *)matchers count])
  {
    id v8 = [TESPatternMatcherLoader alloc];
    objc_super v9 = [(TESMatcher *)self locale];
    uint64_t v12 = [(TESPatternMatcherLoader *)v8 initWithLocale:v9];

    uint64_t v10 = [(TESPatternMatcherLoader *)v12 matchers];
    uint64_t v11 = self->_matchers;
    self->_matchers = v10;
  }
}

- (NSMutableArray)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(id)a3
{
}

- (TESTriggerPhraseMatcher)phraseMatcher
{
  return self->_phraseMatcher;
}

- (void)setPhraseMatcher:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_phraseMatcher, 0);
  objc_storeStrong((id *)&self->_matchers, 0);
}

@end