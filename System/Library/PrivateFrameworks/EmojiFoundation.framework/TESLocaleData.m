@interface TESLocaleData
+ (id)animationNameForTextEffectType:(int64_t)a3;
+ (id)localeDataWithLocale:(id)a3;
+ (id)localeDataWithLocaleIdentifier:(id)a3;
+ (int64_t)textEffectTypeForAnimationName:(id)a3;
- (NSLocale)locale;
- (NSString)localeIdentifier;
- (TESLocaleData)initWithLocale:(id)a3;
- (TESLocaleData)initWithLocaleIdentifier:(id)a3;
- (id)textEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5;
- (void)enumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6;
@end

@implementation TESLocaleData

+ (id)animationNameForTextEffectType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB) {
    return 0;
  }
  else {
    return off_1E61A9998[a3 - 1];
  }
}

+ (int64_t)textEffectTypeForAnimationName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"big"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"small"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"jitter"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"explode"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"shakeVertical"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"shakeHorizontal"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"bloom"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"bounce"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"bold"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"underline"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"italic"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"strikeThrough"])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)localeDataWithLocaleIdentifier:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[TESLocaleData alloc] initWithLocaleIdentifier:v3];

  return v4;
}

+ (id)localeDataWithLocale:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[TESLocaleData alloc] initWithLocale:v3];

  return v4;
}

- (TESLocaleData)initWithLocaleIdentifier:(id)a3
{
  int64_t v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  if (v4)
  {
    self = [(TESLocaleData *)self initWithLocale:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TESLocaleData)initWithLocale:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TESLocaleData;
  v5 = [(TESLocaleData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;
  }
  return v5;
}

- (void)enumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  v11 = +[TESMatcherManager sharedManager];
  v12 = [(TESLocaleData *)self locale];
  v13 = [v11 matcherForLocale:v12];

  if ((a5 & 2) != 0)
  {
    v18 = [v13 phraseMatcher];
    objc_msgSend(v18, "matchesForString:searchRange:", v9, a4.location, a4.length);
    LOBYTE(v23[0]) = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v14);
          }
          if (v10) {
            (*((void (**)(id, void, void *))v10 + 2))(v10, *(void *)(*((void *)&v25 + 1) + 8 * i), v23);
          }
          if (LOBYTE(v23[0]))
          {

            goto LABEL_15;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__TESLocaleData_enumerateTextEffectCandidatesInString_searchRange_options_usingBlock___block_invoke;
  v20[3] = &unk_1E61A9950;
  v22 = v23;
  id v21 = v10;
  objc_msgSend(v13, "enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:", v9, a4.location, a4.length, a5, v20);

  _Block_object_dispose(v23, 8);
LABEL_15:
}

uint64_t __86__TESLocaleData_enumerateTextEffectCandidatesInString_searchRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)textEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__TESLocaleData_textEffectCandidatesInString_searchRange_options___block_invoke;
  v15[3] = &unk_1E61A9978;
  id v16 = v11;
  id v12 = v11;
  -[TESLocaleData enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:](self, "enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:", v10, location, length, a5, v15);

  v13 = (void *)[v12 copy];
  return v13;
}

uint64_t __66__TESLocaleData_textEffectCandidatesInString_searchRange_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end