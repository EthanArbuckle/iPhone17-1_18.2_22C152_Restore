@interface LakituResponse
- (LakituResponse)initWithError:(id)a3;
- (LakituResponse)initWithResponseDictionary:(id)a3;
- (LakituResponse)initWithURLResponse:(id)a3 data:(id)a4;
- (NSDictionary)responseDictionary;
- (NSError)error;
- (NSHTTPURLResponse)httpResponse;
- (NSString)requestUUID;
- (id)_parsePlistFromData:(id)a3 error:(id *)a4;
- (void)setError:(id)a3;
@end

@implementation LakituResponse

- (id)_parsePlistFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5)
  {
    v6 = 0;
    goto LABEL_15;
  }
  id v12 = 0;
  v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v12];
  id v7 = v12;
  v8 = v7;
  if (!v6)
  {
    if (a4) {
      *a4 = v7;
    }
    v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100049908();
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100049970();
    }

    v10 = objc_alloc_init((Class)NSMutableDictionary);
    [v10 setObject:@"Escrow response not a dictionary" forKeyedSubscript:NSLocalizedDescriptionKey];
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"EscrowProxyErrorDomain" code:500 userInfo:v10];
    }
LABEL_13:

    v6 = 0;
  }

LABEL_15:

  return v6;
}

- (LakituResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)LakituResponse;
  v9 = [(LakituResponse *)&v36 init];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v9->_httpResponse, a3);
      id v10 = [(NSHTTPURLResponse *)v9->_httpResponse statusCode];
      if (v10 != (id)200)
      {
        uint64_t v11 = (uint64_t)v10;
        id v12 = +[NSHTTPURLResponse localizedStringForStatusCode:v10];
        v13 = CloudServicesLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100049BB4((uint64_t)v12, v11, v13);
        }

        v14 = +[NSMutableDictionary dictionary];
        [v14 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];
        if (v11 == 503 || v11 == 429)
        {
          v15 = [(NSHTTPURLResponse *)v9->_httpResponse allHeaderFields];
          v16 = [v15 objectForKeyedSubscript:@"Retry-After"];

          if (v16)
          {
            v17 = CloudServicesLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100049B4C();
            }

            id v18 = objc_alloc_init((Class)NSDateFormatter);
            id v19 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
            [v18 setLocale:v19];

            [v18 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
            v20 = [v18 dateFromString:v16];
            if (v20
              || (uint64_t v33 = (uint64_t)[v16 longLongValue], v33 >= 1)
              && (+[NSDate dateWithTimeIntervalSinceNow:(double)v33], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v21 = CloudServicesLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                sub_100049AAC((uint64_t)v20, v21);
              }

              [v14 setObject:v20 forKeyedSubscript:@"retryAfterDate"];
            }
          }
        }
        uint64_t v22 = +[NSError errorWithDomain:@"EscrowProxyErrorDomain" code:v11 userInfo:v14];
        error = v9->_error;
        v9->_error = (NSError *)v22;
      }
    }
    id v35 = 0;
    uint64_t v24 = [(LakituResponse *)v9 _parsePlistFromData:v8 error:&v35];
    id v25 = v35;
    id v26 = v35;
    responseDictionary = v9->_responseDictionary;
    v9->_responseDictionary = (NSDictionary *)v24;

    if (!v9->_responseDictionary)
    {
      p_error = (id *)&v9->_error;
      if ((id)-[NSError code](v9->_error, "code") != (id)503 && [*p_error code] != (id)429)
      {
        id v29 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
        v30 = CloudServicesLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000499D8((uint64_t)v9, (uint64_t)v29, v30);
        }

        if (sub_100004254())
        {
          v31 = +[CloudServicesAnalytics logger];
          v32 = v31;
          if (v26) {
            [v31 logUnrecoverableError:v26 forEvent:CloudServicesAnalyticsLakituResponse withAttributes:0];
          }
          else {
            [v31 logSuccessForEvent:CloudServicesAnalyticsLakituResponse];
          }
        }
        if (!*p_error) {
          objc_storeStrong((id *)&v9->_error, v25);
        }
      }
    }
  }
  return v9;
}

- (LakituResponse)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LakituResponse;
  v6 = [(LakituResponse *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (LakituResponse)initWithResponseDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LakituResponse;
  v6 = [(LakituResponse *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_responseDictionary, a3);
  }

  return v7;
}

- (NSString)requestUUID
{
  v2 = [(LakituResponse *)self httpResponse];
  v3 = [v2 allHeaderFields];
  v4 = [v3 objectForKeyedSubscript:@"X-Apple-Request-UUID"];

  return (NSString *)v4;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end