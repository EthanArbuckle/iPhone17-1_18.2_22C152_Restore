@interface DDRTaskResetInternationalSettings
- (NSArray)keyboards;
- (NSArray)languages;
- (NSString)locale;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)configure;
- (void)run;
- (void)setKeyboards:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation DDRTaskResetInternationalSettings

- (void)configure
{
  _locale();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  _languages();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _keyboards();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  v9 = DDRLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Backedup International Settings, locale: %@, languages: %@, keyboards: %@", (uint8_t *)&v14, 0x20u);
  }

  [(DDRTaskResetInternationalSettings *)self setLocale:v6];
  [(DDRTaskResetInternationalSettings *)self setLanguages:v7];
  [(DDRTaskResetInternationalSettings *)self setKeyboards:v8];
  v10 = DDRLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(DDRTaskResetInternationalSettings *)self locale];
    v12 = [(DDRTaskResetInternationalSettings *)self languages];
    v13 = [(DDRTaskResetInternationalSettings *)self keyboards];
    int v14 = 138412802;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Assigning to self property, locale: %@, languages: %@, keyboards: %@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)run
{
  id v3 = DDRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DDRTaskResetInternationalSettings *)self locale];
    id v5 = [(DDRTaskResetInternationalSettings *)self languages];
    id v6 = [(DDRTaskResetInternationalSettings *)self keyboards];
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = (uint64_t)v4;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v5;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restoring previously saved international settings, locale: %@, languages: %@, keyboards: %@", buf, 0x20u);
  }
  id v7 = [(DDRTaskResetInternationalSettings *)self locale];
  id v8 = [(DDRTaskResetInternationalSettings *)self languages];
  v9 = [(DDRTaskResetInternationalSettings *)self keyboards];
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  uint64_t v13 = _locale();
  uint64_t v14 = _languages();
  uint64_t v15 = _keyboards();
  __int16 v16 = DDRLogForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = v13;
    __int16 v42 = 2112;
    uint64_t v43 = v14;
    __int16 v44 = 2112;
    uint64_t v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Prior to restore, preLocale: %@, preLanguages: %@, preKeyboards: %@", buf, 0x20u);
  }
  v35 = (void *)v13;
  v36 = (void *)v14;

  id v17 = DDRLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = (uint64_t)v10;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v11;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ready to restore previously saved international settings, locale: %@, languages: %@, keyboards: %@", buf, 0x20u);
  }
  v37 = (void *)v15;

  _CFPreferencesFlushCachesForIdentifier();
  __int16 v18 = +[NSBundle mainBundle];
  id v19 = [v18 pathForResource:@"GlobalPreferences" ofType:@"plist"];

  v20 = DDRLogForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = (uint64_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "In restore international settings, from path = %@", buf, 0xCu);
  }

  id v21 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v19];
  v22 = [@"~/Library/Preferences/.GlobalPreferences.plist" stringByExpandingTildeInPath];
  [v21 writeToFile:v22 atomically:0];
  v23 = +[NSFileManager defaultManager];
  NSFileAttributeKey v38 = NSFileProtectionKey;
  NSFileProtectionType v39 = NSFileProtectionNone;
  v24 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [v23 setAttributes:v24 ofItemAtPath:v22 error:0];

  sub_100004C20();
  v25 = DDRLogForCategory(0);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "We got backed up locale, resetting it: %@", buf, 0xCu);
    }

    CFPreferencesSetValue(@"AppleLocale", v10, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
  else
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Backedup locale became nil", buf, 2u);
    }
  }
  v27 = DDRLogForCategory(0);
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = (uint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "We got backed up languages, resetting it: %@", buf, 0xCu);
    }

    CFPreferencesSetValue(@"AppleLanguages", v11, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
  else
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Backedup language became nil", buf, 2u);
    }
  }
  v29 = DDRLogForCategory(0);
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v30)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "We got backed up keyboards, resetting it: %@", buf, 0xCu);
    }

    CFPreferencesSetValue(@"AppleKeyboards", v12, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
  else
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Backedup keyboards became nil", buf, 2u);
    }
  }
  sub_100004C20();
  _CFPreferencesFlushCachesForIdentifier();
  v31 = _locale();

  v32 = _languages();

  v33 = _keyboards();

  v34 = DDRLogForCategory(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v41 = (uint64_t)v31;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v32;
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v33;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "After restore, Locale: %@, Languages: %@, Keyboards: %@", buf, 0x20u);
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.3;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetInternationalSettings";
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (NSArray)keyboards
{
  return self->_keyboards;
}

- (void)setKeyboards:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end