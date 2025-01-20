@interface _DPDediscoDonation
+ (BOOL)defaultValueForKey:(id)a3;
- (BOOL)isFeatureEnabled:(id)a3 withError:(id *)a4;
- (BOOL)isOHTTPEnabledWithError:(id *)a3;
- (BOOL)isPrivateAccessTokenEnabledWithError:(id *)a3;
- (BOOL)isTelemetryAllowed;
- (id)getHelperServerName;
- (id)getLeaderServerName;
@end

@implementation _DPDediscoDonation

+ (BOOL)defaultValueForKey:(id)a3
{
  uint64_t v3 = qword_100082B78;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100082B78, &stru_1000751C0);
  }
  v5 = [(id)qword_100082B80 objectForKeyedSubscript:v4];

  unsigned __int8 v6 = [v5 BOOLValue];
  return v6;
}

- (id)getLeaderServerName
{
  v2 = [(_DPDediscoDonation *)self metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];

  if (v3
    && ([v3 objectForKeyedSubscript:kDPMetadataDediscoServerConfiguration],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    unsigned __int8 v6 = [v4 objectForKeyedSubscript:kDPMetadataDediscoServerConfigurationLeader];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)getHelperServerName
{
  v2 = [(_DPDediscoDonation *)self metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:kDPMetadataDediscoServerConfiguration];
    v5 = v4;
    if (v4)
    {
      unsigned __int8 v6 = [v4 objectForKeyedSubscript:kDPMetadataDediscoServerConfigurationHelpers];
      v7 = v6;
      if (v6 && [v6 count])
      {
        v8 = [v7 objectAtIndexedSubscript:0];
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isOHTTPEnabledWithError:(id *)a3
{
  return [(_DPDediscoDonation *)self isFeatureEnabled:kDPMetadataDediscoTaskConfigFeaturesOHTTP withError:a3];
}

- (BOOL)isFeatureEnabled:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(_DPDediscoDonation *)self metadata];
  uint64_t v8 = kDPMetadataDediscoTaskConfig;
  uint64_t v9 = [v7 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [v7 objectForKeyedSubscript:v8];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int IsV2 = _DPMetadataIsV2();
      v14 = [v7 objectForKeyedSubscript:v8];
      uint64_t v15 = kDPMetadataDediscoTaskConfigFeatures;
      v16 = [v14 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigFeatures];

      if (v16)
      {
        v17 = [v14 objectForKeyedSubscript:v15];
        objc_opt_class();
        char v18 = objc_opt_isKindOfClass();

        if (v18)
        {
          v19 = [v14 objectForKeyedSubscript:v15];
          v20 = [v19 objectForKeyedSubscript:v6];

          if (v20)
          {
            v21 = [v19 objectForKeyedSubscript:v6];
            objc_opt_class();
            char v22 = objc_opt_isKindOfClass();

            if (v22)
            {
              v23 = [v19 objectForKeyedSubscript:v6];
              unsigned __int8 v24 = [v23 BOOLValue];

LABEL_25:
              goto LABEL_26;
            }
            v27 = +[NSString stringWithFormat:@"Incorrect data type for %@.%@.%@ - expect BOOLean", v8, v15, v6];
            if (a4)
            {
              *a4 = +[_DPDediscoError errorWithCode:400 underlyingError:0 description:v27];
            }
            v28 = +[_DPLog service];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_10005750C((uint64_t)v27, v28);
            }
          }
          else if (IsV2)
          {
            unsigned __int8 v24 = [(id)objc_opt_class() defaultValueForKey:v6];
            goto LABEL_25;
          }
          unsigned __int8 v24 = 0;
          goto LABEL_25;
        }
        v25 = +[NSString stringWithFormat:@"Incorrect data type for %@.%@ - expect dictionary", v8, v15];
        if (a4)
        {
          *a4 = +[_DPDediscoError errorWithCode:400 underlyingError:0 description:v25];
        }
        v26 = +[_DPLog service];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10005750C((uint64_t)v25, v26);
        }
      }
      else if (IsV2)
      {
        unsigned __int8 v24 = [(id)objc_opt_class() defaultValueForKey:v6];
LABEL_26:

        goto LABEL_27;
      }
      unsigned __int8 v24 = 0;
      goto LABEL_26;
    }
  }
  unsigned __int8 v24 = 0;
LABEL_27:

  return v24;
}

- (BOOL)isPrivateAccessTokenEnabledWithError:(id *)a3
{
  return [(_DPDediscoDonation *)self isFeatureEnabled:kDPMetadataDediscoTaskConfigFeaturesPAT withError:a3];
}

- (BOOL)isTelemetryAllowed
{
  v2 = [(_DPDediscoDonation *)self metadata];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"telemetryAllowed"];
  if ([v3 BOOLValue]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = +[_DPDeviceInfo isInternalBuild];
  }

  return v4;
}

@end