@interface AXMLocSupport
+ (id)sharedInstance;
- (BOOL)localeBaseLanguageIsEnglish:(id)a3;
- (NSLocale)en_USLocale;
- (id)baseLanguageForLocale:(id)a3;
- (id)localeForLanguageCode:(id)a3;
- (id)localeMatchingBaseLanguageOfLocale:(id)a3 fromLocales:(id)a4;
- (void)setEn_USLocale:(id)a3;
@end

@implementation AXMLocSupport

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance__Shared_0;

  return v2;
}

void __31__AXMLocSupport_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXMLocSupport);
  v1 = (void *)sharedInstance__Shared_0;
  sharedInstance__Shared_0 = (uint64_t)v0;
}

- (NSLocale)en_USLocale
{
  en_USLocale = self->_en_USLocale;
  if (!en_USLocale)
  {
    v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    v5 = self->_en_USLocale;
    self->_en_USLocale = v4;

    en_USLocale = self->_en_USLocale;
  }

  return en_USLocale;
}

- (id)localeForLanguageCode:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA20];
  v4 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v5 = [v3 localeWithLocaleIdentifier:v4];

  return v5;
}

- (id)baseLanguageForLocale:(id)a3
{
  return (id)[a3 languageCode];
}

- (BOOL)localeBaseLanguageIsEnglish:(id)a3
{
  v3 = [a3 languageCode];
  char v4 = [v3 isEqual:@"en"];

  return v4;
}

- (id)localeMatchingBaseLanguageOfLocale:(id)a3 fromLocales:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "languageCode", (void)v15);
        v12 = [v10 languageCode];
        char v13 = [v11 isEqual:v12];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)setEn_USLocale:(id)a3
{
}

- (void).cxx_destruct
{
}

@end