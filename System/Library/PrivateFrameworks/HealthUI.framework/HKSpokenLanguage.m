@interface HKSpokenLanguage
- (BOOL)isEqual:(id)a3;
- (HKSpokenLanguage)initWithLanguageIdentifier:(id)a3 forCategory:(unint64_t)a4;
- (NSString)identifier;
- (NSString)languageInCurrentLocale;
- (NSString)languageInLanguageLocale;
- (id)localizedStringForDisplay;
- (unint64_t)hash;
- (unint64_t)languageCategoryType;
- (void)setIdentifier:(id)a3;
- (void)setLanguageCategoryType:(unint64_t)a3;
- (void)setLanguageInCurrentLocale:(id)a3;
- (void)setLanguageInLanguageLocale:(id)a3;
@end

@implementation HKSpokenLanguage

- (HKSpokenLanguage)initWithLanguageIdentifier:(id)a3 forCategory:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSpokenLanguage;
  v8 = [(HKSpokenLanguage *)&v16 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v10 = [v9 localizedStringForLanguage:v7 context:3];
    languageInCurrentLocale = v8->_languageInCurrentLocale;
    v8->_languageInCurrentLocale = (NSString *)v10;

    v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];
    uint64_t v13 = [v12 localizedStringForLanguage:v7 context:3];
    languageInLanguageLocale = v8->_languageInLanguageLocale;
    v8->_languageInLanguageLocale = (NSString *)v13;

    objc_storeStrong((id *)&v8->_identifier, a3);
    v8->_languageCategoryType = a4;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t languageCategoryType = self->_languageCategoryType,
        languageCategoryType == [v4 languageCategoryType]))
  {
    identifier = self->_identifier;
    id v7 = [v4 identifier];
    if ([(NSString *)identifier isEqualToString:v7])
    {
      languageInCurrentLocale = self->_languageInCurrentLocale;
      v9 = [v4 languageInCurrentLocale];
      if ([(NSString *)languageInCurrentLocale isEqualToString:v9])
      {
        languageInLanguageLocale = self->_languageInLanguageLocale;
        v11 = [v4 languageInLanguageLocale];
        BOOL v12 = [(NSString *)languageInLanguageLocale isEqualToString:v11];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_languageCategoryType + [(NSString *)self->_identifier hash];
}

- (id)localizedStringForDisplay
{
  v3 = [(HKSpokenLanguage *)self languageInCurrentLocale];
  id v4 = [(HKSpokenLanguage *)self languageInLanguageLocale];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    v6 = [(HKSpokenLanguage *)self languageInCurrentLocale];
  }
  else
  {
    id v7 = NSString;
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v9 = [v8 localizedStringForKey:@"%1$@ - %2$@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    uint64_t v10 = [(HKSpokenLanguage *)self languageInCurrentLocale];
    v11 = [(HKSpokenLanguage *)self languageInLanguageLocale];
    v6 = objc_msgSend(v7, "stringWithFormat:", v9, v10, v11);
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

- (NSString)languageInCurrentLocale
{
  return self->_languageInCurrentLocale;
}

- (void)setLanguageInCurrentLocale:(id)a3
{
}

- (NSString)languageInLanguageLocale
{
  return self->_languageInLanguageLocale;
}

- (void)setLanguageInLanguageLocale:(id)a3
{
}

- (unint64_t)languageCategoryType
{
  return self->_languageCategoryType;
}

- (void)setLanguageCategoryType:(unint64_t)a3
{
  self->_unint64_t languageCategoryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageInLanguageLocale, 0);
  objc_storeStrong((id *)&self->_languageInCurrentLocale, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end