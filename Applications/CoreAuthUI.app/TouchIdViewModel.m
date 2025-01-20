@interface TouchIdViewModel
- (id)alertActionsFromOptions:(id)a3 event:(int64_t)a4;
- (id)alertTintFromOptions:(id)a3;
- (id)fallbackActionFromOptions:(id)a3;
@end

@implementation TouchIdViewModel

- (id)alertActionsFromOptions:(id)a3 event:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = [v6 objectForKeyedSubscript:&off_10008A3F0];
  v9 = v8;
  if (v8) {
    unsigned int v10 = [v8 BOOLValue];
  }
  else {
    unsigned int v10 = 1;
  }
  v11 = [v6 objectForKeyedSubscript:&off_10008A408];
  unsigned int v12 = [v11 BOOLValue];
  int v13 = v12 ^ 1 | v10;
  if ([v11 intValue] == 2 || (BOOL v14 = a4 == 1, (v13 & 1) == 0)) {
    BOOL v14 = 1;
  }
  v15 = LALogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138544130;
    v25 = self;
    __int16 v26 = 1024;
    int v27 = v13;
    __int16 v28 = 1024;
    unsigned int v29 = v12;
    __int16 v30 = 1024;
    BOOL v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ buttons - cancel:%d, fallback:%d, show fallback immediately:%d", (uint8_t *)&v24, 0x1Eu);
  }

  if ((v12 & v14) == 1)
  {
    v16 = [(TouchIdViewModel *)self fallbackActionFromOptions:v6];
    if ([v16 length])
    {
      [v7 setObject:v16 forKeyedSubscript:&off_10008A420];

      if ((v13 & 1) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
    }
LABEL_16:
    v17 = [v6 objectForKeyedSubscript:&off_10008A438];
    v18 = +[LAUtils truncateString:v17 maxLength:32];

    if (v18)
    {
      v19 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      v20 = [v18 stringByTrimmingCharactersInSet:v19];

      if (v20)
      {
        v21 = v20;
        if ([v20 length]) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      v20 = 0;
    }
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v22 localizedStringForKey:@"CANCEL" value:&stru_100088CF0 table:@"MobileUI"];

LABEL_22:
    [v7 setObject:v21 forKeyedSubscript:&off_10008A450];

    goto LABEL_23;
  }
  if (v13) {
    goto LABEL_16;
  }
LABEL_23:

  return v7;
}

- (id)fallbackActionFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:&off_10008A468];
  v4 = +[LAUtils truncateString:v3 maxLength:32];

  if (v4
    && (+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), v5 = objc_claimAutoreleasedReturnValue(), [v4 stringByTrimmingCharactersInSet:v5], id v6 = objc_claimAutoreleasedReturnValue(), v4, v5, v6))
  {
    if (![v6 isEqualToString:@"Enter Passcode"]) {
      goto LABEL_7;
    }
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"ENTER_PASSCODE_ONLY" value:&stru_100088CF0 table:@"MobileUI"];

    id v6 = (void *)v8;
  }
  else
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v7 localizedStringForKey:@"ENTER_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
  }

LABEL_7:

  return v6;
}

- (id)alertTintFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:&off_10008A480];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = v3;
      if ([v4 length])
      {
        id v11 = 0;
        v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
        id v6 = v11;
        if (v5)
        {
          id v7 = v5;
        }
        else
        {
          v9 = LALogForCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_10006158C((uint64_t)v6, v9);
          }
        }
        uint64_t v8 = v5;
      }
      else
      {
        v5 = LALogForCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_100061548(v5);
        }
        uint64_t v8 = 0;
      }
    }
    else
    {
      v4 = LALogForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100061604(v4);
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end