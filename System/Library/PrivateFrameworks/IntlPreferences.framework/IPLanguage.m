@interface IPLanguage
+ (id)IPLanguagesWithLanguages:(id)a3 normalize:(BOOL)a4;
+ (id)languageWithIdentifier:(id)a3;
+ (id)languageWithIdentifier:(id)a3 normalize:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (IPLanguage)minimizedLanguage;
- (NSString)identifier;
- (NSString)localizedStringForName;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedStringForName:(id)a3;
- (void)setName:(id)a3;
@end

@implementation IPLanguage

+ (id)languageWithIdentifier:(id)a3
{
  return (id)[a1 languageWithIdentifier:a3 normalize:1];
}

+ (id)languageWithIdentifier:(id)a3 normalize:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = v6;
  if (v4)
  {
    v8 = +[IntlUtility normalizedLanguageIDFromString:v5];
    [v7 setIdentifier:v8];
  }
  else
  {
    [v6 setIdentifier:v5];
  }
  if (+[IntlUtility forceCapitalizationInLanguageLists])
  {
    if (+[IntlUtility canCapitalizeAutonymForLanguage:v5])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 3;
    }
    uint64_t v10 = 4;
  }
  else
  {
    uint64_t v10 = 3;
    uint64_t v9 = 3;
  }
  v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  v12 = [v11 localizedStringForLanguage:v5 context:v9];
  [v7 setName:v12];

  v13 = (void *)MEMORY[0x1E4F1CA20];
  v14 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v15 = [v13 localeWithLocaleIdentifier:v14];
  v16 = [v15 localizedStringForLanguage:v5 context:v10];
  [v7 setLocalizedStringForName:v16];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(IPLanguage *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(IPLanguage *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(IPLanguage *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return v7;
}

- (IPLanguage)minimizedLanguage
{
  unint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v3 countryCode];

  id v5 = (void *)MEMORY[0x1E4F1CA20];
  v6 = [(IPLanguage *)self identifier];
  v7 = [v5 componentsFromLocaleIdentifier:v6];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];

  if ([v4 isEqualToString:v8])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v10 = [(IPLanguage *)self identifier];
    v11 = [v9 baseLanguageFromLanguage:v10];
    v12 = +[IPLanguage languageWithIdentifier:v11];
  }
  else
  {
    v12 = self;
  }

  return v12;
}

+ (id)IPLanguagesWithLanguages:(id)a3 normalize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = +[IPLanguage languageWithIdentifier:normalize:](IPLanguage, "languageWithIdentifier:normalize:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)localizedStringForName
{
  return self->_localizedStringForName;
}

- (void)setLocalizedStringForName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStringForName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end