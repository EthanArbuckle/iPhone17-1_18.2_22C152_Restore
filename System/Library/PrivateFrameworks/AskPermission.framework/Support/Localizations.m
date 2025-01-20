@interface Localizations
+ (BOOL)_useROWKeyForCountryCode:(id)a3;
+ (id)_countryCodes;
+ (id)_stringWithKey:(id)a3 localeIdentifier:(id)a4;
+ (id)stringWithKey:(id)a3;
+ (id)stringWithKey:(id)a3 bag:(id)a4;
+ (id)stringWithKey:(id)a3 countryCode:(id)a4 localeIdentifier:(id)a5;
@end

@implementation Localizations

+ (id)stringWithKey:(id)a3
{
  id v4 = a3;
  v5 = +[AMSBag sharedBag];
  v6 = [a1 stringWithKey:v4 bag:v5];

  return v6;
}

+ (id)stringWithKey:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 countryCode];
  id v27 = 0;
  v9 = [v8 valueWithError:&v27];
  id v10 = v27;

  if (v10)
  {
    v11 = +[APLogConfig sharedDaemonConfig];
    if (!v11)
    {
      v11 = +[APLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      __int16 v30 = 2114;
      id v31 = v10;
      id v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive country code bag key. Error: %{public}@", buf, 0x16u);
    }
  }
  v15 = [v7 localeIdentifier];
  id v26 = v10;
  v16 = [v15 valueWithError:&v26];
  id v17 = v26;

  if (v17)
  {
    v18 = +[APLogConfig sharedDaemonConfig];
    if (!v18)
    {
      v18 = +[APLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      __int16 v30 = 2114;
      id v31 = v17;
      id v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive language bag key. Error: %{public}@", buf, 0x16u);
    }
    v22 = +[NSLocale currentLocale];
    uint64_t v23 = [v22 localeIdentifier];

    v16 = (void *)v23;
  }
  v24 = [a1 stringWithKey:v6 countryCode:v9 localeIdentifier:v16];

  return v24;
}

+ (id)stringWithKey:(id)a3 countryCode:(id)a4 localeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 stringByAppendingString:@"_ROW"];
  unsigned int v12 = [a1 _useROWKeyForCountryCode:v10];

  if (v12)
  {
    v13 = [a1 _stringWithKey:v11 localeIdentifier:v9];
    id v14 = v13;
    if (v13)
    {
      v15 = v13;
      if (![v13 isEqualToString:v11])
      {
LABEL_7:
        if (![v15 isEqualToString:v8]) {
          goto LABEL_13;
        }
        goto LABEL_8;
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  v15 = [a1 _stringWithKey:v8 localeIdentifier:v9];

  if (v15) {
    goto LABEL_7;
  }
LABEL_8:
  v16 = +[APLogConfig sharedDaemonConfig];
  if (!v16)
  {
    v16 = +[APLogConfig sharedConfig];
  }
  id v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138543362;
    id v21 = (id)objc_opt_class();
    id v18 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive localized string", (uint8_t *)&v20, 0xCu);
  }
LABEL_13:

  return v15;
}

+ (id)_countryCodes
{
  if (qword_100042B50 != -1) {
    dispatch_once(&qword_100042B50, &stru_100038DC0);
  }
  v2 = (void *)qword_100042B58;
  return v2;
}

+ (id)_stringWithKey:(id)a3 localeIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizations];
  id v23 = v6;
  id v9 = +[NSArray arrayWithObjects:&v23 count:1];
  id v10 = +[NSBundle preferredLocalizationsFromArray:v8 forPreferences:v9];
  v11 = [v10 firstObject];

  if (!v11)
  {
    id v17 = +[APLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[APLogConfig sharedConfig];
    }
    v13 = [v17 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v19 = v22;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive language from bundle", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v18 = 0;
    goto LABEL_14;
  }
  unsigned int v12 = [v7 localizedStringForKey:v5 value:0 table:@"Localizable" localization:v11];
  v13 = v12;
  if (!v12 || [v12 isEqualToString:v5])
  {
    id v14 = +[APLogConfig sharedDaemonConfig];
    if (!v14)
    {
      id v14 = +[APLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = (id)objc_opt_class();
      id v16 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find localized string in bundle.", (uint8_t *)&v21, 0xCu);
    }
    id v17 = +[NSBundle mainBundle];
    uint64_t v18 = [v17 localizedStringForKey:v5 value:&stru_100039F08 table:@"Localizable"];
LABEL_14:

    v13 = v18;
  }

  return v13;
}

+ (BOOL)_useROWKeyForCountryCode:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 _countryCodes];
    id v6 = [v4 uppercaseString];

    unsigned int v7 = [v5 containsObject:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

@end