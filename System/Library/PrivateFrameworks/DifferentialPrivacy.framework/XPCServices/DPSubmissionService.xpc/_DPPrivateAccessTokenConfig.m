@interface _DPPrivateAccessTokenConfig
+ (id)createAndPersist;
- (NSArray)aggregators;
- (NSString)issuerURL;
- (_DPPrivateAccessTokenConfig)initWithData:(id)a3;
- (id)description;
- (id)getPreferredIssuerFromPlist:(id)a3;
- (int64_t)maxDailyOnDemand;
- (int64_t)tokenRefreshHours;
- (int64_t)tokensPerRefresh;
- (void)persistTokenRefreshHours;
@end

@implementation _DPPrivateAccessTokenConfig

+ (id)createAndPersist
{
  v2 = +[NSURL URLWithString:@"https://unlinkability.apple.com/config/global-dap-ppm-config.plist"];
  v4 = [[_DPDediscoBackgroundDownloaderService alloc] initWithURL:v2];
  v5 = [(_DPDediscoBackgroundDownloaderService *)v4 downloadConfigSynchronously];

  if ([v5 length])
  {
    v6 = [[_DPPrivateAccessTokenConfig alloc] initWithData:v5];
    if (v6)
    {
      v7 = +[_DPLog service];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        v11 = v2;
        __int16 v12 = 2112;
        v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Private access token configuration from %@: %@", (uint8_t *)&v10, 0x16u);
      }

      [(_DPPrivateAccessTokenConfig *)v6 persistTokenRefreshHours];
    }
  }
  else
  {
    v8 = +[_DPLog service];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000589B0((uint64_t)v2, v8);
    }

    v6 = 0;
  }

  return v6;
}

- (_DPPrivateAccessTokenConfig)initWithData:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_DPPrivateAccessTokenConfig;
  v5 = [(_DPPrivateAccessTokenConfig *)&v21 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v20 = 0;
  v6 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v20];
  id v7 = v20;
  if (!v6)
  {
    v6 = +[_DPLog service];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100058A28((uint64_t)v7, v6);
    }
    goto LABEL_11;
  }
  v8 = [v6 objectForKeyedSubscript:@"leaders"];
  v9 = [v8 allKeys];
  int v10 = (NSArray *)[v9 mutableCopy];
  aggregators = v5->_aggregators;
  v5->_aggregators = v10;

  __int16 v12 = [(_DPPrivateAccessTokenConfig *)v5 getPreferredIssuerFromPlist:v6];
  v13 = v12;
  if (!v12)
  {
    v18 = +[_DPLog service];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100058AA0(v18);
    }

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v14 = [v12 objectForKeyedSubscript:@"issuer-url"];
  v15 = (NSString *)[v14 copy];
  issuerURL = v5->_issuerURL;
  v5->_issuerURL = v15;

  v5->_tokenRefreshHours = (int64_t)[v13 integerForKey:@"token-refresh-hours" minValue:2 maxValue:72 defaultValue:4];
  v5->_tokensPerRefresh = (int64_t)[v13 integerForKey:@"tokens-per-refresh" minValue:0 maxValue:30 defaultValue:16];
  v5->_maxDailyOnDemand = (int64_t)[v13 integerForKey:@"max-daily-on-demand" minValue:0 maxValue:5 defaultValue:2];

LABEL_5:
  v17 = v5;
LABEL_12:

  return v17;
}

- (id)getPreferredIssuerFromPlist:(id)a3
{
  id v25 = a3;
  [v25 objectForKeyedSubscript:@"private-access-token-issuers"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v3)
  {
    id v4 = v3;
    id v28 = 0;
    id v26 = 0;
    CFStringRef v5 = @"issuer-url";
    CFStringRef v6 = @"enabled";
    uint64_t v7 = *(void *)v31;
    do
    {
      v8 = 0;
      id v27 = v4;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v8);
        int v10 = [v9 objectForKeyedSubscript:v5];
        if ([v10 length])
        {
          v11 = [v9 objectForKeyedSubscript:v6];
          __int16 v12 = v11;
          if (!v11 || [v11 BOOLValue])
          {
            v13 = [v9 objectForKeyedSubscript:@"not-before"];
            if (!v13
              || (+[NSDate date],
                  v14 = objc_claimAutoreleasedReturnValue(),
                  [v14 timeIntervalSince1970],
                  double v16 = v15,
                  v14,
                  [v13 doubleValue],
                  v16 > v17))
            {
              uint64_t v18 = v7;
              CFStringRef v19 = v5;
              CFStringRef v20 = v6;
              objc_super v21 = [v9 objectForKeyedSubscript:@"version"];
              id v22 = [v21 unsignedIntegerValue];

              if (v22 > v28)
              {
                id v23 = v9;

                id v28 = v22;
                id v26 = v23;
              }
              CFStringRef v6 = v20;
              CFStringRef v5 = v19;
              uint64_t v7 = v18;
              id v4 = v27;
            }
          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v4 != v8);
      id v4 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v4);
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)persistTokenRefreshHours
{
  id v3 = +[_DPStrings tokenRefreshHoursKeyName];
  id v4 = +[NSUserDefaults standardUserDefaults];
  if (v4)
  {
    int64_t v5 = [(_DPPrivateAccessTokenConfig *)self tokenRefreshHours];
    if (v5 == kSecondsIn4Hours)
    {
      [v4 removeObjectForKey:v3];
    }
    else if ([(_DPPrivateAccessTokenConfig *)self tokenRefreshHours] >= 1)
    {
      objc_msgSend(v4, "setInteger:forKey:", -[_DPPrivateAccessTokenConfig tokenRefreshHours](self, "tokenRefreshHours"), v3);
    }
    [v4 synchronize];
  }
  else
  {
    CFStringRef v6 = +[_DPLog service];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100058AE4(v6);
    }
  }
}

- (id)description
{
  id v3 = +[NSMutableString stringWithFormat:@"TokenConfig: {\n"];
  id v4 = [(_DPPrivateAccessTokenConfig *)self issuerURL];
  [v3 appendFormat:@"  issuerURL: %@\n", v4];

  objc_msgSend(v3, "appendFormat:", @"  tokenRefreshHours: %ld\n", -[_DPPrivateAccessTokenConfig tokenRefreshHours](self, "tokenRefreshHours"));
  objc_msgSend(v3, "appendFormat:", @"  tokensPerRefresh: %ld\n", -[_DPPrivateAccessTokenConfig tokensPerRefresh](self, "tokensPerRefresh"));
  objc_msgSend(v3, "appendFormat:", @"  maxDailyOnDemand: %ld\n", -[_DPPrivateAccessTokenConfig maxDailyOnDemand](self, "maxDailyOnDemand"));
  int64_t v5 = [(_DPPrivateAccessTokenConfig *)self aggregators];
  [v3 appendFormat:@"  aggregators: %@\n", v5];

  [v3 appendString:@"}"];
  return v3;
}

- (NSString)issuerURL
{
  return self->_issuerURL;
}

- (int64_t)tokenRefreshHours
{
  return self->_tokenRefreshHours;
}

- (int64_t)tokensPerRefresh
{
  return self->_tokensPerRefresh;
}

- (int64_t)maxDailyOnDemand
{
  return self->_maxDailyOnDemand;
}

- (NSArray)aggregators
{
  return self->_aggregators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregators, 0);
  objc_storeStrong((id *)&self->_issuerURL, 0);
}

@end