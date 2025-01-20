@interface ICQLinkHandler
+ (id)urlFromUserActivity:(id)a3;
+ (int64_t)resultFromURL:(id)a3;
+ (int64_t)resultFromURL:(id)a3 store:(id)a4;
@end

@implementation ICQLinkHandler

+ (id)urlFromUserActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 activityType];
  unsigned __int8 v5 = [v4 isEqual:NSUserActivityTypeBrowsingWeb];

  if (v5)
  {
    v6 = [v3 webpageURL];
    v7 = v6;
    if (v6)
    {
      v7 = v6;
      v8 = v7;
    }
    else
    {
      v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No url found exiting", v11, 2u);
      }

      v8 = 0;
    }
  }
  else
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "url activity of type NSUserActivityTypeBrowsingWeb exiting", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

+ (int64_t)resultFromURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[ACAccountStore defaultStore];
  id v6 = [a1 resultFromURL:v4 store:v5];

  return (int64_t)v6;
}

+ (int64_t)resultFromURL:(id)a3 store:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [objc_alloc((Class)NSURLComponents) initWithURL:v5 resolvingAgainstBaseURL:1];
    v8 = v7;
    if (!v7)
    {
      v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "missing urlComponents", (uint8_t *)&v31, 2u);
      }
      goto LABEL_34;
    }
    v9 = [v7 queryItems];
    v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "queryItems = %@", (uint8_t *)&v31, 0xCu);
    }

    v11 = [v9 firstObject];
    v12 = [v11 name];
    if ([v12 isEqualToString:@"context"])
    {
      v13 = [v8 host];
      if (([v13 isEqualToString:@"icq.icloud.com"] & 1) == 0)
      {
        v14 = [v8 scheme];
        if ([v14 caseInsensitiveCompare:@"icq"])
        {
          v15 = [v8 host];
          unsigned __int8 v16 = [v15 isEqualToString:@"launch"];

          if (v16)
          {
LABEL_25:
            v25 = [v9 firstObject];
            v26 = [v25 value];
            unsigned __int8 v27 = [v26 isEqualToString:ICQActionParameterSkipCFUKey];

            if (v27)
            {
              int64_t v17 = 4;
            }
            else
            {
              v28 = [v6 aa_primaryAppleAccount];

              if (v28) {
                int64_t v17 = 1;
              }
              else {
                int64_t v17 = 3;
              }
            }
            goto LABEL_35;
          }
          goto LABEL_16;
        }
      }
      goto LABEL_25;
    }

LABEL_16:
    v18 = [v8 host];
    unsigned __int8 v19 = [v18 isEqualToString:@"link.icloud.com"];

    if (v19)
    {
      int64_t v17 = 5;
LABEL_35:

      goto LABEL_36;
    }
    v20 = [v8 host];
    unsigned __int8 v21 = [v20 isEqualToString:@"icq.icloud.success.com"];

    if (v21)
    {
      int64_t v17 = 2;
      goto LABEL_35;
    }
    v22 = [v8 host];
    if ([v22 isEqualToString:@"c.apple.com"])
    {
      v23 = [v8 path];
      unsigned __int8 v24 = [v23 hasSuffix:@"icq"];

      if (v24)
      {
        int64_t v17 = 6;
        goto LABEL_35;
      }
    }
    else
    {
    }
    v29 = _ICQGetLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "url format not valid exiting", (uint8_t *)&v31, 2u);
    }

LABEL_34:
    int64_t v17 = 0;
    goto LABEL_35;
  }
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "missing url", (uint8_t *)&v31, 2u);
  }
  int64_t v17 = 0;
LABEL_36:

  return v17;
}

@end