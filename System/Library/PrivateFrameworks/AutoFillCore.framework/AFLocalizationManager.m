@interface AFLocalizationManager
- (AFLocalizationManager)init;
- (AFLocalizationManager)initWithLocaleIdentifier:(id)a3;
- (NSString)localeIdentifier;
- (id)_truncationSentinel;
- (id)accessibilityLabelForAFTextContentType:(id)a3;
- (id)accessibilityLabelsForSecureHeaders:(id)a3 secureContents:(id)a4 truncationSentinel:(id)a5;
- (id)initForLocalizedStrings;
- (id)localizedStringForKey:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
@end

@implementation AFLocalizationManager

- (AFLocalizationManager)init
{
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 localeIdentifier];
  v5 = [(AFLocalizationManager *)self initWithLocaleIdentifier:v4];

  return v5;
}

- (id)initForLocalizedStrings
{
  v7.receiver = self;
  v7.super_class = (Class)AFLocalizationManager;
  v2 = [(AFLocalizationManager *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v4 = [v3 localeIdentifier];
    localeIdentifier = v2->_localeIdentifier;
    v2->_localeIdentifier = (NSString *)v4;
  }
  return v2;
}

- (AFLocalizationManager)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFLocalizationManager;
  v6 = [(AFLocalizationManager *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
  }

  return v7;
}

- (void)setLocaleIdentifier:(id)a3
{
  id v5 = a3;
  localeIdentifier = self->_localeIdentifier;
  p_localeIdentifier = &self->_localeIdentifier;
  id v8 = v5;
  if (([v5 isEqualToString:localeIdentifier] & 1) == 0) {
    objc_storeStrong((id *)p_localeIdentifier, a3);
  }
}

- (id)localizedStringForKey:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [MEMORY[0x263EFF960] _deviceLanguage];
  v6 = [v4 preferredLocalizations];
  objc_super v7 = (void *)MEMORY[0x263F086E0];
  v15[0] = v5;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  objc_super v9 = [v7 preferredLocalizationsFromArray:v6 forPreferences:v8];

  v10 = [v9 firstObject];
  v11 = [v4 localizedStringForKey:v3 value:0 table:@"SuggestionContent" localization:v10];
  if ([v11 isEqual:v3])
  {
    id v12 = [v4 localizedStringForKey:v3 value:&stru_26FCB48F0 table:@"SuggestionContent"];
  }
  else
  {
    id v12 = v11;
  }
  v13 = v12;

  return v13;
}

- (id)_truncationSentinel
{
  __buf[2] = *MEMORY[0x263EF8340];
  __buf[0] = 0;
  __buf[1] = 0;
  arc4random_buf(__buf, 0x10uLL);
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:__buf];
  id v3 = NSString;
  uint64_t v4 = [v2 UUIDString];
  id v5 = [v3 stringWithFormat:@"*%@*", v4];

  return v5;
}

- (id)accessibilityLabelsForSecureHeaders:(id)a3 secureContents:(id)a4 truncationSentinel:(id)a5
{
  *(void *)&v29[5] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  if ([v7 count])
  {
    unint64_t v11 = 0;
    id v25 = v9;
    do
    {
      id v12 = [v7 objectAtIndex:v11];
      v13 = [v12 stringByReplacingOccurrencesOfString:v9 withString:&stru_26FCB48F0];

      v14 = [v8 objectAtIndex:v11];
      if ([v13 length] && objc_msgSend(v14, "length"))
      {
        v15 = v10;
        id v16 = v8;
        v17 = [(AFLocalizationManager *)self localizedStringForKey:@"PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL"];
        id v27 = 0;
        v18 = [NSString stringWithValidatedFormat:v17, @"%@%@", &v27, v13, v14 validFormatSpecifiers error];
        id v19 = v27;
        v20 = &stru_26FCB48F0;
        if (v18) {
          v20 = v18;
        }
        v21 = v20;

        if (v19)
        {
          v22 = AFLocalizationManagerOSLogFacility();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[AFLocalizationManager accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:](v28, (uint64_t)v19, v29, v22);
          }
        }
        id v8 = v16;
        v10 = v15;
        id v9 = v25;
        goto LABEL_17;
      }
      if ([v13 length])
      {
        v23 = v13;
      }
      else
      {
        if (![v14 length])
        {
          v21 = &stru_26FCB48F0;
          goto LABEL_17;
        }
        v23 = v14;
      }
      v21 = v23;
LABEL_17:
      [v10 addObject:v21];

      ++v11;
    }
    while (v11 < [v7 count]);
  }

  return v10;
}

- (id)accessibilityLabelForAFTextContentType:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [MEMORY[0x263EFF960] _deviceLanguage];
  v6 = [v4 preferredLocalizations];
  id v7 = (void *)MEMORY[0x263F086E0];
  v15[0] = v5;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v9 = [v7 preferredLocalizationsFromArray:v6 forPreferences:v8];

  v10 = [v9 firstObject];
  unint64_t v11 = [v4 localizedStringForKey:v3 value:0 table:@"AXAFTextContentType" localization:v10];
  if ([v11 isEqual:v3])
  {
    id v12 = [v4 localizedStringForKey:v3 value:&stru_26FCB48F0 table:@"AXAFTextContentType"];
  }
  else
  {
    id v12 = v11;
  }
  v13 = v12;

  return v13;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
}

- (void)accessibilityLabelsForSecureHeaders:(void *)a3 secureContents:(NSObject *)a4 truncationSentinel:.cold.1(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  id v7 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL: %@", "-[AFLocalizationManager accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:]", a2];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_248A7F000, a4, OS_LOG_TYPE_ERROR, "%@", a1, 0xCu);
}

@end