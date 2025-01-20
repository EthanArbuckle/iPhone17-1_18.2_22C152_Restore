@interface CUIKSubscribedHolidayCalendar
- (CUIKSubscribedHolidayCalendar)initWithLocale:(id)a3 languageCode:(id)a4 URL:(id)a5;
- (NSLocale)locale;
- (NSString)countryCode;
- (NSString)languageCode;
- (NSURL)URL;
- (id)descriptionInLocaleLanguage;
- (id)localizedDescription;
- (id)localizedTitle;
- (void)setCountryCode:(id)a3;
@end

@implementation CUIKSubscribedHolidayCalendar

- (CUIKSubscribedHolidayCalendar)initWithLocale:(id)a3 languageCode:(id)a4 URL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CUIKSubscribedHolidayCalendar;
  v12 = [(CUIKSubscribedHolidayCalendar *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locale, a3);
    objc_storeStrong((id *)&v13->_languageCode, a4);
    uint64_t v14 = [v9 countryCode];
    countryCode = v13->_countryCode;
    v13->_countryCode = (NSString *)v14;

    objc_storeStrong((id *)&v13->_URL, a5);
    v13->_localizedDescriptionCacheLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)localizedTitle
{
  return 0;
}

- (id)localizedDescription
{
  p_localizedDescriptionCacheLock = &self->_localizedDescriptionCacheLock;
  os_unfair_lock_lock(&self->_localizedDescriptionCacheLock);
  cachedLocalizedDescription = self->_cachedLocalizedDescription;
  if (!cachedLocalizedDescription)
  {
    v5 = CUIKBundle();
    v6 = [v5 localizedStringForKey:@"Holiday Calendar description format in user's language" value:@"%1$@ (%2$@)" table:0];

    v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    v8 = [(CUIKSubscribedHolidayCalendar *)self countryCode];
    if (v8)
    {
      id v9 = [v7 localizedStringForCountryCode:v8];
    }
    else
    {
      id v10 = [(CUIKSubscribedHolidayCalendar *)self locale];
      id v11 = [v10 countryCode];
      id v9 = [v7 localizedStringForCountryCode:v11];
    }
    v12 = [(CUIKSubscribedHolidayCalendar *)self languageCode];
    v13 = [v7 localizedStringForLanguageCode:v12];

    objc_msgSend(NSString, "stringWithFormat:", v6, v9, v13);
    uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_cachedLocalizedDescription;
    self->_cachedLocalizedDescription = v14;

    cachedLocalizedDescription = self->_cachedLocalizedDescription;
  }
  v16 = cachedLocalizedDescription;
  os_unfair_lock_unlock(p_localizedDescriptionCacheLock);

  return v16;
}

- (id)descriptionInLocaleLanguage
{
  p_localizedDescriptionCacheLock = &self->_localizedDescriptionCacheLock;
  os_unfair_lock_lock(&self->_localizedDescriptionCacheLock);
  cachedDescriptionInLocaleLanguage = self->_cachedDescriptionInLocaleLanguage;
  if (!cachedDescriptionInLocaleLanguage)
  {
    v5 = CUIKBundle();
    v6 = [v5 localizedStringForKey:@"Holiday Calendar description format in calendar's language" value:@"%1$@ (%2$@)" table:0];

    v7 = [(CUIKSubscribedHolidayCalendar *)self locale];
    v8 = [(CUIKSubscribedHolidayCalendar *)self countryCode];
    if (v8)
    {
      id v9 = [v7 localizedStringForCountryCode:v8];
    }
    else
    {
      id v10 = [(CUIKSubscribedHolidayCalendar *)self locale];
      id v11 = [v10 countryCode];
      id v9 = [v7 localizedStringForCountryCode:v11];
    }
    v12 = [(CUIKSubscribedHolidayCalendar *)self locale];
    v13 = [(CUIKSubscribedHolidayCalendar *)self languageCode];
    uint64_t v14 = [v12 localizedStringForLanguageCode:v13];

    objc_msgSend(NSString, "stringWithFormat:", v6, v9, v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = self->_cachedDescriptionInLocaleLanguage;
    self->_cachedDescriptionInLocaleLanguage = v15;

    cachedDescriptionInLocaleLanguage = self->_cachedDescriptionInLocaleLanguage;
  }
  objc_super v17 = cachedDescriptionInLocaleLanguage;
  os_unfair_lock_unlock(p_localizedDescriptionCacheLock);

  return v17;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_cachedDescriptionInLocaleLanguage, 0);

  objc_storeStrong((id *)&self->_cachedLocalizedDescription, 0);
}

@end