@interface NSUserActivity
- (NSString)callProviderIdentifier;
- (TUHandle)handle;
- (int)callService;
@end

@implementation NSUserActivity

- (NSString)callProviderIdentifier
{
  v2 = [(NSUserActivity *)self userInfo];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKeyedSubscript:TUCallUserActivityProviderIdentifierKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = [v4 copy];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (int)callService
{
  v2 = [(NSUserActivity *)self userInfo];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKeyedSubscript:@"TUCallUserActivityServiceKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v5 = [v4 intValue];
    }
    else {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (TUHandle)handle
{
  v2 = [(NSUserActivity *)self userInfo];
  v3 = v2;
  if (!v2)
  {
    int v5 = 0;
    goto LABEL_16;
  }
  v4 = [v2 objectForKeyedSubscript:TUCallUserActivityHandleKey];
  if (!v4)
  {
    v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User activity is missing the required key TUCallUserActivityHandleKey.", buf, 2u);
    }

    goto LABEL_9;
  }
  int v5 = +[TUHandle handleWithDictionaryRepresentation:v4];
  if (!v5)
  {
LABEL_9:
    v7 = [v3 objectForKeyedSubscript:TUCallUserActivityDestinationIDKey];
    if (v7)
    {
      int v5 = +[TUHandle handleWithDestinationID:v7];
    }
    else
    {
      v8 = PHDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User activity is missing the required key TUCallUserActivityDestinationIDKey.", v10, 2u);
      }

      int v5 = 0;
    }
  }
LABEL_16:

  return (TUHandle *)v5;
}

@end