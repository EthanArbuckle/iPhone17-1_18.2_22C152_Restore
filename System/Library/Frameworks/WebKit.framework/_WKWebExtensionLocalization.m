@interface _WKWebExtensionLocalization
+ (BOOL)supportsSecureCoding;
- (NSDictionary)localizationDictionary;
- (NSString)uniqueIdentifier;
- (_WKWebExtensionLocalization)initWithLocalizedDictionary:(id)a3 uniqueIdentifier:(id)a4;
- (_WKWebExtensionLocalization)initWithRegionalLocalization:(id)a3 languageLocalization:(id)a4 defaultLocalization:(id)a5 withBestLocale:(id)a6 uniqueIdentifier:(id)a7;
- (_WKWebExtensionLocalization)initWithWebExtension:(void *)a3;
- (id)_localizationDictionaryForWebExtension:(void *)a3 withLocale:(id)a4;
- (id)_localizedArrayForArray:(id)a3;
- (id)_predefinedMessages;
- (id)_stringByReplacingNamedPlaceholdersInString:(id)a3 withNamedPlaceholders:(id)a4;
- (id)_stringByReplacingPositionalPlaceholdersInString:(id)a3 withValues:(id)a4;
- (id)localizedDictionaryForDictionary:(id)a3;
- (id)localizedStringForKey:(id)a3 withPlaceholders:(id)a4;
- (id)localizedStringForString:(id)a3;
- (void)setLocalizationDictionary:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation _WKWebExtensionLocalization

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKWebExtensionLocalization)initWithWebExtension:(void *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = WebKit::WebExtension::defaultLocale((id *)a3);
  v6 = [v5 localeIdentifier];

  if ([(__CFString *)v6 length])
  {
    v24 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    v7 = [v24 languageCode];
    v25 = [v24 countryCode];
    v8 = [NSString stringWithFormat:@"%@_%@", v7, v25];
    v9 = [(_WKWebExtensionLocalization *)self _localizationDictionaryForWebExtension:a3 withLocale:v6];
    if (v9)
    {
      v10 = qword_1EB357DF8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v6;
        _os_log_debug_impl(&dword_1985F2000, v10, OS_LOG_TYPE_DEBUG, "Default locale available for %{public}@", buf, 0xCu);
      }
      v11 = v6;
    }
    else
    {
      v11 = 0;
    }
    if ([(__CFString *)v7 isEqualToString:v6])
    {
      v14 = 0;
    }
    else
    {
      v14 = [(_WKWebExtensionLocalization *)self _localizationDictionaryForWebExtension:a3 withLocale:v7];
      if (v14)
      {
        v15 = qword_1EB357DF8;
        if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v7;
          _os_log_debug_impl(&dword_1985F2000, v15, OS_LOG_TYPE_DEBUG, "Language locale available for %{public}@", buf, 0xCu);
        }
        v16 = v7;

        v11 = v16;
      }
    }
    if (([(__CFString *)v8 isEqualToString:v6] & 1) != 0
      || ([(_WKWebExtensionLocalization *)self _localizationDictionaryForWebExtension:a3 withLocale:v8], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v20 = 0;
    }
    else
    {
      v18 = qword_1EB357DF8;
      if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v8;
        _os_log_debug_impl(&dword_1985F2000, v18, OS_LOG_TYPE_DEBUG, "Regional locale available for %{public}@", buf, 0xCu);
      }
      v19 = v8;

      v11 = v19;
      v20 = (void *)v17;
    }
    v21 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_DEBUG))
    {
      v23 = @"undefined";
      if (v11) {
        v23 = v11;
      }
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_debug_impl(&dword_1985F2000, v21, OS_LOG_TYPE_DEBUG, "Best locale is %{public}@", buf, 0xCu);
    }
    v13 = [(_WKWebExtensionLocalization *)self initWithRegionalLocalization:v20 languageLocalization:v14 defaultLocalization:v9 withBestLocale:v11 uniqueIdentifier:0];
  }
  else
  {
    v12 = qword_1EB357DF8;
    if (os_log_type_enabled((os_log_t)qword_1EB357DF8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1985F2000, v12, OS_LOG_TYPE_DEBUG, "No default locale provided", buf, 2u);
    }
    v13 = [(_WKWebExtensionLocalization *)self initWithRegionalLocalization:0 languageLocalization:0 defaultLocalization:0 withBestLocale:0 uniqueIdentifier:0];
  }

  return v13;
}

- (_WKWebExtensionLocalization)initWithLocalizedDictionary:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"@@ui_locale"];
  v9 = [v8 objectForKeyedSubscript:@"message"];

  v10 = [(_WKWebExtensionLocalization *)self initWithRegionalLocalization:v6 languageLocalization:0 defaultLocalization:0 withBestLocale:v9 uniqueIdentifier:v7];
  return v10;
}

- (_WKWebExtensionLocalization)initWithRegionalLocalization:(id)a3 languageLocalization:(id)a4 defaultLocalization:(id)a5 withBestLocale:(id)a6 uniqueIdentifier:(id)a7
{
  v12 = (WebKit *)a3;
  v13 = (WebKit *)a4;
  v14 = (WebKit *)a5;
  id v15 = a6;
  id v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)_WKWebExtensionLocalization;
  uint64_t v17 = [(_WKWebExtensionLocalization *)&v38 init];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v15];
    locale = v17->_locale;
    v17->_locale = (NSLocale *)v18;

    objc_storeStrong((id *)&v17->_localeString, a6);
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a7);
    v20 = [(_WKWebExtensionLocalization *)v17 _predefinedMessages];
    WebKit::dictionaryWithLowercaseKeys(v20, v21);
    v22 = (WebKit *)objc_claimAutoreleasedReturnValue();

    WebKit::dictionaryWithLowercaseKeys(v12, v23);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    WebKit::mergeDictionaries(v22, v24, v25);
    v26 = (WebKit *)objc_claimAutoreleasedReturnValue();

    WebKit::dictionaryWithLowercaseKeys(v13, v27);
    uint64_t v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    WebKit::mergeDictionaries(v26, v28, v29);
    v30 = (WebKit *)objc_claimAutoreleasedReturnValue();

    WebKit::dictionaryWithLowercaseKeys(v14, v31);
    v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = WebKit::mergeDictionaries(v30, v32, v33);

    localizationDictionary = v17->_localizationDictionary;
    v17->_localizationDictionary = (NSDictionary *)v34;

    v36 = v17;
  }

  return v17;
}

- (id)localizedDictionaryForDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSDictionary *)self->_localizationDictionary count])
  {
    v13 = v4;
    id v4 = (id)[v4 mutableCopy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [v4 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (!v6) {
      goto LABEL_16;
    }
    uint64_t v7 = *(void *)v15;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [(_WKWebExtensionLocalization *)self localizedStringForString:v10];
          [v4 setObject:v11 forKeyedSubscript:v9];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [(_WKWebExtensionLocalization *)self _localizedArrayForArray:v10];
            [v4 setObject:v11 forKeyedSubscript:v9];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_14;
            }
            v11 = [(_WKWebExtensionLocalization *)self localizedDictionaryForDictionary:v10];
            [v4 setObject:v11 forKeyedSubscript:v9];
          }
        }

LABEL_14:
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v6)
      {
LABEL_16:

        break;
      }
    }
  }

  return v4;
}

- (id)localizedStringForKey:(id)a3 withPlaceholders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] <= 9)
  {
    if ([(NSDictionary *)self->_localizationDictionary count])
    {
      localizationDictionary = self->_localizationDictionary;
      v10 = [v6 lowercaseString];
      v11 = WebKit::objectForKey<NSDictionary>(localizationDictionary, (uint64_t)v10, 1, 0);

      v12 = WebKit::objectForKey<NSString>(v11, @"message", 1);
      if ([v12 length])
      {
        WebKit::objectForKey<NSDictionary>(v11, @"placeholders", 1, 0);
        v13 = (WebKit *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = WebKit::dictionaryWithLowercaseKeys(v13, v14);

        long long v16 = [(_WKWebExtensionLocalization *)self _stringByReplacingNamedPlaceholdersInString:v12 withNamedPlaceholders:v15];

        long long v17 = [(_WKWebExtensionLocalization *)self _stringByReplacingPositionalPlaceholdersInString:v16 withValues:v7];

        v8 = [v17 stringByReplacingOccurrencesOfString:@"$$" withString:@"$"];

        v12 = (void *)v15;
      }
      else
      {
        v8 = &stru_1EEA10550;
      }
    }
    else
    {
      v8 = &stru_1EEA10550;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_localizedArrayForArray:(id)a3
{
  id v4 = a3;
  if ([(NSDictionary *)self->_localizationDictionary count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55___WKWebExtensionLocalization__localizedArrayForArray___block_invoke;
    v7[3] = &unk_1E5811070;
    v7[4] = self;
    uint64_t v5 = WebKit::mapObjects<NSArray>(v4, v7);

    id v4 = (id)v5;
  }

  return v4;
}

- (id)localizedStringForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"__MSG_([A-Za-z0-9_@]+)__" options:0 error:0];
  id v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  id v7 = v4;
  if (v6)
  {
    v8 = v4;
    do
    {
      uint64_t v9 = [v6 rangeAtIndex:1];
      v11 = objc_msgSend(v8, "substringWithRange:", v9, v10);
      v12 = [(_WKWebExtensionLocalization *)self localizedStringForKey:v11 withPlaceholders:0];
      uint64_t v13 = [v6 range];
      uint64_t v15 = objc_msgSend(v8, "substringWithRange:", v13, v14);
      id v7 = [v8 stringByReplacingOccurrencesOfString:v15 withString:v12];

      uint64_t v16 = objc_msgSend(v5, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));

      v8 = v7;
      id v6 = (void *)v16;
    }
    while (v16);
  }

  return v7;
}

- (id)_localizationDictionaryForWebExtension:(void *)a3 withLocale:(id)a4
{
  uint64_t v5 = [NSString stringWithFormat:@"_locales/%@/messages.json", a4];
  id v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v13 = 0;
  id v7 = WebKit::WebExtension::resourceDataForPath((uint64_t)a3, v5, &v13, 0, 1);
  id v8 = v13;
  uint64_t v9 = [v6 dataWithData:v7];

  uint64_t v10 = (NSError *)v8;
  if (v10) {
    WebKit::WebExtension::recordError((const void **)a3, v10);
  }

  v11 = WebKit::parseJSON(v9, 0, 0);

  return v11;
}

- (id)_predefinedMessages
{
  v43[4] = *MEMORY[0x1E4F143B8];
  locale = self->_locale;
  if (!locale) {
    goto LABEL_5;
  }
  id v4 = (void *)MEMORY[0x1E4F42678];
  uint64_t v5 = [(NSLocale *)locale languageCode];
  uint64_t v6 = [v4 defaultWritingDirectionForLanguage:v5];

  if (!v6)
  {
    v40 = @"message";
    v41 = @"ltr";
    v42[0] = @"@@bidi_dir";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v43[0] = v7;
    v42[1] = @"@@bidi_reversed_dir";
    objc_super v38 = @"message";
    v39 = @"rtl";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v43[1] = v8;
    v42[2] = @"@@bidi_start_edge";
    v36 = @"message";
    v37 = @"left";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v43[2] = v9;
    v42[3] = @"@@bidi_end_edge";
    uint64_t v34 = @"message";
    v35 = @"right";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v43[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
    uint64_t v12 = [v11 mutableCopy];
    goto LABEL_7;
  }
  if (!self->_locale)
  {
LABEL_5:
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    goto LABEL_8;
  }
  v30 = @"message";
  v31 = @"rtl";
  v32[0] = @"@@bidi_dir";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v33[0] = v7;
  v32[1] = @"@@bidi_reversed_dir";
  uint64_t v28 = @"message";
  v29 = @"ltr";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v33[1] = v8;
  v32[2] = @"@@bidi_start_edge";
  v26 = @"message";
  v27 = @"right";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v33[2] = v9;
  v32[3] = @"@@bidi_end_edge";
  v24 = @"message";
  v25 = @"left";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v33[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
  uint64_t v12 = [v11 mutableCopy];
LABEL_7:
  id v13 = (void *)v12;

LABEL_8:
  localeString = self->_localeString;
  if (localeString)
  {
    v22 = @"message";
    v23 = localeString;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v13 setObject:v15 forKeyedSubscript:@"@@ui_locale"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v20 = @"message";
    v21 = uniqueIdentifier;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    [v13 setObject:v17 forKeyedSubscript:@"@@extension_id"];
  }
  uint64_t v18 = (void *)[v13 copy];

  return v18;
}

- (id)_stringByReplacingNamedPlaceholdersInString:(id)a3 withNamedPlaceholders:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:[^$]|^)(\\$([A-Za-z0-9_@]+)\\$)" options:0 error:0];
  id v8 = objc_msgSend(v7, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if (v8)
  {
    do
    {
      uint64_t v9 = [v8 rangeAtIndex:2];
      v11 = objc_msgSend(v5, "substringWithRange:", v9, v10);
      uint64_t v12 = [v11 lowercaseString];

      id v13 = WebKit::objectForKey<NSDictionary>(v6, (uint64_t)v12, 1, 0);
      uint64_t v14 = WebKit::objectForKey<NSString>(v13, @"content", 1);
      uint64_t v15 = (void *)v14;
      uint64_t v16 = &stru_1EEA10550;
      if (v14) {
        uint64_t v16 = (__CFString *)v14;
      }
      long long v17 = v16;

      uint64_t v18 = [v8 rangeAtIndex:1];
      v20 = objc_msgSend(v5, "substringWithRange:", v18, v19);
      v21 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v20, v17, 1, 0, objc_msgSend(v5, "length"));

      uint64_t v22 = objc_msgSend(v7, "firstMatchInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length"));

      id v5 = v21;
      id v8 = (void *)v22;
    }
    while (v22);
  }
  else
  {
    v21 = v5;
  }

  return v21;
}

- (id)_stringByReplacingPositionalPlaceholdersInString:(id)a3 withValues:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  id v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:[^$]|^)(\\$([0-9]))" options:0 error:0];
  uint64_t v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if (v9)
  {
    do
    {
      uint64_t v10 = [v9 rangeAtIndex:2];
      uint64_t v12 = objc_msgSend(v5, "substringWithRange:", v10, v11);
      uint64_t v13 = [v12 integerValue];

      uint64_t v14 = &stru_1EEA10550;
      if (v13 >= 1 && v13 <= v7)
      {
        uint64_t v14 = [v6 objectAtIndexedSubscript:v13 - 1];
      }
      uint64_t v15 = [v9 rangeAtIndex:1];
      long long v17 = objc_msgSend(v5, "substringWithRange:", v15, v16);
      uint64_t v18 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v17, v14, 1, 0, objc_msgSend(v5, "length"));

      uint64_t v19 = objc_msgSend(v8, "firstMatchInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length"));

      id v5 = v18;
      uint64_t v9 = (void *)v19;
    }
    while (v19);
  }
  else
  {
    uint64_t v18 = v5;
  }

  return v18;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSDictionary)localizationDictionary
{
  return self->_localizationDictionary;
}

- (void)setLocalizationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationDictionary, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_localeString, 0);
}

@end