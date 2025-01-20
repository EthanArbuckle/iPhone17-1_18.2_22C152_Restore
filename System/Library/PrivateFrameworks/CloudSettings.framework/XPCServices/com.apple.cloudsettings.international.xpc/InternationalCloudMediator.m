@interface InternationalCloudMediator
- (id)inflection;
- (id)liveText;
- (id)locale;
- (void)registerKeys;
- (void)setInflection:(id)a3;
- (void)setLiveText:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation InternationalCloudMediator

- (void)registerKeys
{
  [(InternationalCloudMediator *)self registerKey:@"IP_Locale" getter:"locale" setter:"setLocale:"];
  [(InternationalCloudMediator *)self registerKey:@"IP_LiveText" getter:"liveText" setter:"setLiveText:"];

  [(InternationalCloudMediator *)self registerKey:@"IP_Infection" getter:"inflection" setter:"setInflection:"];
}

- (void)setLocale:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN XPCSERVICE - Update locale", buf, 2u);
  }
  v4 = [v3 firstObject];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100002474();
  }
  v5 = +[IPLocaleCoder localePreferenceKeysAndClasses];
  v6 = [v5 allKeys];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100001C34;
  v9[3] = &unk_100004220;
  id v10 = v6;
  id v7 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleDatePreferencesChangedNotification", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleNumberPreferencesChangedNotification", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTemperatureUnitPreferencesChangedNotification", 0, 0, 1u);
}

- (void)setLiveText:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN XPCSERVICE - Update live text", v7, 2u);
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100002554();
    }
    id v4 = [v3 BOOLValue];
    v5 = +[NSUserDefaults standardUserDefaults];
    v6 = +[NSNumber numberWithBool:v4];
    [v5 setObject:v6 forKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];
  }
}

- (void)setInflection:(id)a3
{
  if (a3)
  {
    id v3 = [a3 dataUsingEncoding:4];
    id v6 = 0;
    id v4 = [objc_alloc((Class)_NSAttributedStringGrammarInflection) initWithExternalRepresentation:v3 error:&v6];
    id v5 = v6;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000025C4();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN XPCSERVICE - Update inflection: %@", buf, 0xCu);
      }
      [v4 _setAsGlobalUserInflection];
    }
  }
}

- (id)locale
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE Locale", buf, 2u);
  }
  v2 = +[NSMutableDictionary dictionary];
  id v3 = +[IPLocaleCoder localePreferenceKeysAndClasses];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000213C;
  v7[3] = &unk_100004220;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100002640();
  }
  id v10 = v4;
  id v5 = +[NSArray arrayWithObjects:&v10 count:1];

  return v5;
}

- (id)liveText
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE LiveText", (uint8_t *)&v11, 2u);
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];

  if (v3)
  {
    unint64_t v4 = (unint64_t)[v3 BOOLValue];
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      id v5 = [&off_100004928 arrayByAddingObjectsFromArray:&off_100004940];
    }
    else
    {
      id v5 = &off_100004928;
    }
    id v6 = +[NSLocale _deviceLanguage];
    v11 = v6;
    id v7 = +[NSArray arrayWithObjects:&v11 count:1];
    id v8 = +[NSLocale matchedLanguagesFromAvailableLanguages:v5 forPreferredLanguages:v7];

    unint64_t v4 = [v8 count] != 0;
  }

  v9 = +[NSNumber numberWithBool:v4];

  return v9;
}

- (id)inflection
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE Inflection", v7, 2u);
  }
  v2 = +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
  id v3 = objc_alloc((Class)NSString);
  unint64_t v4 = [v2 externalRepresentation];
  id v5 = [v3 initWithData:v4 encoding:4];

  return v5;
}

@end