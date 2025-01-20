@interface TESPatternMatcherLoader
+ (id)_loadPatternMatcherForKey:(id)a3;
- (NSLocale)locale;
- (NSMutableArray)matchers;
- (TESPatternMatcherLoader)initWithLocale:(id)a3;
- (void)_loadPatternMatchers;
- (void)setMatchers:(id)a3;
@end

@implementation TESPatternMatcherLoader

- (TESPatternMatcherLoader)initWithLocale:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TESPatternMatcherLoader;
  v5 = [(TESPatternMatcherLoader *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    matchers = v5->_matchers;
    v5->_matchers = v8;

    [(TESPatternMatcherLoader *)v5 _loadPatternMatchers];
  }

  return v5;
}

+ (id)_loadPatternMatcherForKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"capitalLetter"])
  {
    id v4 = off_1E6196C18;
LABEL_15:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_16;
  }
  if ([v3 isEqualToString:@"repeatedCharacter"])
  {
    id v4 = off_1E6196C30;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"asterisk"])
  {
    id v4 = off_1E6196C10;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"underScore"])
  {
    id v4 = off_1E6196C48;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"slash"])
  {
    id v4 = off_1E6196C38;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"hyphen"])
  {
    id v4 = off_1E6196C20;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"tilde"])
  {
    id v4 = off_1E6196C40;
    goto LABEL_15;
  }
  id v5 = 0;
LABEL_16:

  return v5;
}

- (void)_loadPatternMatchers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_matchers count])
  {
    id v3 = [(TESPatternMatcherLoader *)self locale];
    uint64_t v4 = [v3 languageIdentifier];

    v14 = (void *)v4;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v13 = [[TESStylePatternLoader alloc] initWithLocaleIdentifier:v4];
    id v5 = [(TESLocalizedPListLoader *)v13 items];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_super v11 = +[TESPatternMatcherLoader _loadPatternMatcherForKey:v10];
          if (v11)
          {
            [(NSMutableArray *)self->_matchers addObject:v11];
          }
          else
          {
            v12 = emf_logging_get_default_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v20 = v10;
              _os_log_error_impl(&dword_1B8C45000, v12, OS_LOG_TYPE_ERROR, "Pattern matcher key '%{public}@' is not supported.", buf, 0xCu);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v7);
    }
  }
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSMutableArray)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchers, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end