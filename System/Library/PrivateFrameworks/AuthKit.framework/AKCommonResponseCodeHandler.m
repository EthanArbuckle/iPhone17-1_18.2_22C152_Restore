@interface AKCommonResponseCodeHandler
+ (void)handleResponseCode:(int64_t)a3 altDSID:(id)a4;
@end

@implementation AKCommonResponseCodeHandler

+ (void)handleResponseCode:(int64_t)a3 altDSID:(id)a4
{
  id v5 = a4;
  if (a3 == 437)
  {
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received status code to sign out. Checking for altDSID.", buf, 2u);
    }

    v7 = _AKLogSystem();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Marking account for sign out.", v9, 2u);
      }

      v8 = +[AKSignOutManager sharedManager];
      [v8 markAccountForSignOutForAltDSID:v5];
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_10019513C(v8);
    }
  }
}

@end