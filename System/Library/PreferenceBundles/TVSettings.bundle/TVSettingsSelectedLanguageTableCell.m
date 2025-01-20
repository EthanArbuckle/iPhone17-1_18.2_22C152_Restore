@interface TVSettingsSelectedLanguageTableCell
- (BOOL)canBeDeleted;
- (NSString)languageCode;
- (TVSettingsSelectedLanguageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)title;
- (void)setLanguageCode:(id)a3;
@end

@implementation TVSettingsSelectedLanguageTableCell

- (TVSettingsSelectedLanguageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TVSettingsSelectedLanguageTableCell;
  v9 = [(TVSettingsSelectedLanguageTableCell *)&v13 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:PSIDKey];
    [(TVSettingsSelectedLanguageTableCell *)v9 setLanguageCode:v10];

    v11 = [(TVSettingsSelectedLanguageTableCell *)v9 title];
    [v8 setName:v11];
  }
  return v9;
}

- (id)title
{
  v3 = [(TVSettingsSelectedLanguageTableCell *)self languageCode];
  unsigned int v4 = [v3 isEqualToString:@"ORIGINAL_AUDIO_LANGUAGE"];

  if (v4)
  {
    v5 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    uint64_t v6 = [v5 localizedStringForKey:@"ORIGINAL_AUDIO_LANGUAGE" value:&stru_18968 table:@"TVSettings"];
    v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = &stru_18968;
    }
    v9 = v8;
  }
  else
  {
    v10 = [(TVSettingsSelectedLanguageTableCell *)self languageCode];
    unsigned int v11 = [v10 isEqualToString:@"DEVICE_AUDIO_LANGUAGE"];

    if (v11)
    {
      v12 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      objc_super v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DEVICE_AUDIO_LANGUAGE_FORMAT"];
      v5 = [v12 localizedStringForKey:v13 value:&stru_18968 table:@"TVSettings"];

      v14 = +[NSLocale preferredLanguages];
      v15 = [v14 firstObject];
      v16 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v15];

      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v16);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = [(TVSettingsSelectedLanguageTableCell *)self languageCode];
      v9 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v5];
    }
  }

  return v9;
}

- (BOOL)canBeDeleted
{
  v2 = [(TVSettingsSelectedLanguageTableCell *)self languageCode];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end