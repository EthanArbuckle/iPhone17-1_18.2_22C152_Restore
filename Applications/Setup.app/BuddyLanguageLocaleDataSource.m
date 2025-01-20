@interface BuddyLanguageLocaleDataSource
- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyLanguageComposite)backingLanguageComposite;
- (BuddyLanguageComposite)languageComposite;
- (BuddyLanguageLocaleDataSource)init;
- (BuddyLanguageLocaleDataSourceDelegate)delegate;
- (BuddyLocaleComposite)backingLocaleComposite;
- (BuddyLocaleComposite)localeComposite;
- (NSString)language;
- (void)_countryScanCompleted;
- (void)_didBecomeActive:(id)a3;
- (void)dealloc;
- (void)setBackingLanguageComposite:(id)a3;
- (void)setBackingLocaleComposite:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLanguage:(id)a3;
- (void)updateLanguageCompositer;
- (void)userSelectedLanguage:(id)a3;
@end

@implementation BuddyLanguageLocaleDataSource

- (BuddyLanguageLocaleDataSource)init
{
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyLanguageLocaleDataSource;
  id location = [(BuddyLanguageLocaleDataSource *)&v7 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init(BuddyLanguageComposite);
    [location setBackingLanguageComposite:v2];

    v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:location selector:"_countryScanCompleted" name:BYCountryScanCompletedNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v4 addObserver:location selector:"_didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    [location updateLanguageCompositer];
  }
  v5 = (BuddyLanguageLocaleDataSource *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyLanguageLocaleDataSource;
  [(BuddyLanguageLocaleDataSource *)&v3 dealloc];
}

- (NSString)language
{
  if (self->_language)
  {
    SEL v4 = self->_language;
  }
  else
  {
    v2 = +[NSLocale preferredLanguages];
    SEL v4 = (NSString *)[(NSArray *)v2 firstObject];
  }

  return v4;
}

- (BuddyLanguageComposite)languageComposite
{
  return [(BuddyLanguageLocaleDataSource *)self backingLanguageComposite];
}

- (BuddyLocaleComposite)localeComposite
{
  v2 = [(BuddyLanguageLocaleDataSource *)self backingLocaleComposite];

  if (!v2)
  {
    objc_super v3 = objc_alloc_init(BuddyLocaleComposite);
    [(BuddyLanguageLocaleDataSource *)self setBackingLocaleComposite:v3];

    SEL v4 = [(BuddyLanguageLocaleDataSource *)self buddyPreferencesExcludedFromBackup];
    id v5 = [(BYPreferencesController *)v4 objectForKey:@"localeScrollOffset"];
    [v5 floatValue];
    double v7 = v6;
    SEL v8 = [(BuddyLanguageLocaleDataSource *)self backingLocaleComposite];
    [(BuddyLocaleComposite *)v8 setScrollOffset:v7];

    v9 = [(BuddyLanguageLocaleDataSource *)self buddyPreferencesExcludedFromBackup];
    [(BYPreferencesController *)v9 removeObjectForKey:@"localeScrollOffset"];
  }
  v10 = [(BuddyLanguageLocaleDataSource *)self language];
  v11 = [(BuddyLanguageLocaleDataSource *)self backingLocaleComposite];
  [(BuddyLocaleComposite *)v11 setLanguage:v10];

  return [(BuddyLanguageLocaleDataSource *)self backingLocaleComposite];
}

- (void)_didBecomeActive:(id)a3
{
  SEL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BYLocationController sharedBuddyLocationController];
  id v4 = [v3 guessedCountryFromTelephony];

  if (!v4)
  {
    id v5 = +[BYLocationController sharedBuddyLocationController];
    uint64_t v6 = [v5 getCountryFromTelephony];

    if (v6) {
      [(BuddyLanguageLocaleDataSource *)v8 updateLanguageCompositer];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_countryScanCompleted
{
}

- (void)updateLanguageCompositer
{
  v28 = self;
  v27[1] = (id)a2;
  v27[0] = +[IntlUtility baseSystemLanguages];
  id v26 = objc_alloc_init((Class)NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  id v2 = v27[0];
  id v3 = [v2 countByEnumeratingWithState:__b objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(v2);
        }
        obunint64_t j = *(id *)(__b[1] + 8 * i);
        uint64_t v6 = +[NSLocale localeWithLocaleIdentifier:obj];
        id location = [(NSLocale *)v6 localizedStringForLanguage:obj context:4];

        if (!location) {
          objc_storeStrong(&location, obj);
        }
        [v26 setValue:location forKey:obj];
        objc_storeStrong(&location, 0);
      }
      id v3 = [v2 countByEnumeratingWithState:__b objects:v30 count:16];
    }
    while (v3);
  }

  id v7 = +[BYLocationController sharedBuddyLocationController];
  id v22 = [v7 guessedLanguages];

  id v21 = +[NSMutableOrderedSet orderedSet];
  memset(v19, 0, sizeof(v19));
  id v8 = v22;
  id v9 = [v8 countByEnumeratingWithState:v19 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19[2];
    do
    {
      for (unint64_t j = 0; j < (unint64_t)v9; ++j)
      {
        if (*(void *)v19[2] != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v20 = *(void *)(v19[1] + 8 * j);
        id v12 = v21;
        id v13 = +[IntlUtility baseLanguageIdentifierFromIdentifier:v20];
        [v12 addObject:v13];
      }
      id v9 = [v8 countByEnumeratingWithState:v19 objects:v29 count:16];
    }
    while (v9);
  }

  [v21 addObjectsFromArray:v27[0]];
  id v14 = [v21 array];
  v15 = [(BuddyLanguageLocaleDataSource *)v28 backingLanguageComposite];
  [(BuddyLanguageComposite *)v15 setLanguageCodes:v14];

  id v16 = v26;
  v17 = [(BuddyLanguageLocaleDataSource *)v28 backingLanguageComposite];
  [(BuddyLanguageComposite *)v17 setLanguageStrings:v16];

  v18 = [(BuddyLanguageLocaleDataSource *)v28 delegate];
  [(BuddyLanguageLocaleDataSourceDelegate *)v18 languageCompositeUpdated];

  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
}

- (void)userSelectedLanguage:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyLanguageLocaleDataSource *)v4 setLanguage:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (BuddyLanguageLocaleDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyLanguageLocaleDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (void)setLanguage:(id)a3
{
}

- (BuddyLanguageComposite)backingLanguageComposite
{
  return self->_backingLanguageComposite;
}

- (void)setBackingLanguageComposite:(id)a3
{
}

- (BuddyLocaleComposite)backingLocaleComposite
{
  return self->_backingLocaleComposite;
}

- (void)setBackingLocaleComposite:(id)a3
{
}

- (void).cxx_destruct
{
}

@end