@interface _DPTokenFetcherService
- (BOOL)saveTokens:(id)a3 toFileInPath:(id)a4 forAggregator:(id)a5;
- (NSDictionary)tokenFields;
- (NSString)tokensDirectoryPath;
- (OS_dispatch_queue)queue;
- (_DPPrivateAccessTokenConfig)config;
- (_DPTokenFetcherService)init;
- (_DPTokenFetcherService)initWithTokenConfig:(id)a3;
- (id)extractTokenFieldsFromConfig:(id)a3;
- (id)fetchMultipleChallengeTokenPairForAggregator:(id)a3;
- (unint64_t)donateTokenCountToBitacoraForAggregator:(id)a3 dirPath:(id)a4;
- (void)fetchTokens;
- (void)setTokenFields:(id)a3;
- (void)setTokensDirectoryPath:(id)a3;
@end

@implementation _DPTokenFetcherService

- (_DPTokenFetcherService)init
{
  v3 = +[_DPPrivateAccessTokenConfig createAndPersist];
  if (v3)
  {
    self = [(_DPTokenFetcherService *)self initWithTokenConfig:v3];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_DPTokenFetcherService)initWithTokenConfig:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPTokenFetcherService;
  v6 = [(_DPTokenFetcherService *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.DifferentialPrivacy.tokens", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[_DPStrings tokensDirectoryPath];
    tokensDirectoryPath = v7->_tokensDirectoryPath;
    v7->_tokensDirectoryPath = (NSString *)v11;
  }
  return v7;
}

- (id)fetchMultipleChallengeTokenPairForAggregator:(id)a3
{
  id v50 = a3;
  v56 = self;
  v52 = [(_DPTokenFetcherService *)self tokenFields];
  v49 = [v52 objectForKeyedSubscript:@"tokenKey"];
  v48 = [v52 objectForKeyedSubscript:@"originNameKey"];
  v4 = [(_DPTokenFetcherService *)self config];
  id v5 = [v4 issuerURL];
  v6 = +[NSURL URLWithString:v5];
  v47 = [v6 host];

  v46 = [[_DPPrivateAccessTokenChallenge alloc] initWithIssuer:v47 origin:v50 redemptionContext:0];
  v7 = [v52 objectForKeyedSubscript:@"tokenType"];
  if ([v7 unsignedIntegerValue] == (id)2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 3;
  }
  v51 = [(_DPPrivateAccessTokenChallenge *)v46 synthesizeWithTokenType:v8];

  id v9 = [objc_alloc((Class)NSPPrivateAccessTokenFetcher) initWithChallenge:v51 tokenKey:v49 originNameKey:v48];
  v55 = v9;
  if (v9)
  {
    v10 = v9;
    [v9 setSystemClient:1];
    [v10 setBundleID:@"com.apple.DPSubmissionService"];
    uint64_t v11 = [(_DPTokenFetcherService *)v56 config];
    id v12 = [v11 tokensPerRefresh];

    v53 = [&__NSArray0__struct mutableCopy];
    unint64_t v54 = (unint64_t)v12;
    if (v12)
    {
      int v13 = 0;
      int v14 = 0;
      v15 = &stru_1000780C8;
      while (1)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v69 = sub_100008E98;
        v70 = sub_100008EA8;
        id v71 = 0;
        uint64_t v61 = 0;
        v62[0] = &v61;
        v62[1] = 0x3032000000;
        v62[2] = sub_100008E98;
        v62[3] = sub_100008EA8;
        id v63 = 0;
        dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
        v17 = +[NSProcessInfo processInfo];
        [v17 systemUptime];

        v18 = [(_DPTokenFetcherService *)v56 queue];
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100008EB0;
        v57[3] = &unk_100075128;
        v59 = &v61;
        v60 = buf;
        v19 = v16;
        v58 = v19;
        [v55 fetchTokenWithQueue:v18 completionHandler:v57];

        dispatch_time_t v20 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v19, v20) && !*(void *)(v62[0] + 40))
        {
          v21 = +[NSString stringWithFormat:@"Token fetching timeout after %lld sec.", 30];
          uint64_t v22 = +[_DPDediscoError errorWithCode:200 description:v21];
          v23 = *(void **)(v62[0] + 40);
          *(void *)(v62[0] + 40) = v22;
        }
        reportCoreAnalyticsUploadEvent();
        if (*(void *)(v62[0] + 40) || !*(void *)(*(void *)&buf[8] + 40))
        {
          -[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", @"%@;",
            *(void *)(v62[0] + 40));
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v25 = +[_DPLog service];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_100056674(v66, (uint64_t)v62, &v67, v25);
          }

          int v26 = v13 + 1;
          if (v13 < 1)
          {
            int v27 = 3;
            ++v13;
            v15 = v24;
            goto LABEL_19;
          }
          v15 = [(__CFString *)v24 stringByAppendingFormat:@"Abort after %d consecutive errors", (v13 + 1)];
          int v27 = 2;
        }
        else
        {
          v24 = [v51 base64EncodedStringWithOptions:0];
          v28 = [*(id *)(*(void *)&buf[8] + 40) base64EncodedStringWithOptions:0];
          v64[0] = @"challenge";
          v64[1] = @"token";
          v65[0] = v24;
          v65[1] = v28;
          v29 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
          [v53 addObject:v29];

          int v26 = 0;
          int v27 = 0;
          ++v14;
        }

        int v13 = v26;
LABEL_19:

        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(buf, 8);

        if (v27 != 3 && v27 || v54 <= v14) {
          goto LABEL_26;
        }
      }
    }
    v15 = &stru_1000780C8;
LABEL_26:
    v40 = +[_DPLog service];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = [v53 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v50;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Fetched %lu tokens for aggregator %@.", buf, 0x16u);
    }

    if ((unint64_t)[v53 count] < v54)
    {
      v42 = +[NSString stringWithFormat:@"Failed to fetch %ld tokens out of %ld with errors: %@", v54 - (void)[v53 count], v54, v15];
      LOBYTE(v45) = 1;
      LODWORD(v44) = 3;
      HIDWORD(v44) = [v53 count];
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", @"fedstats:com.apple.Bitacora.TokenFetcher:000:000:iOS", 1, 0, 0, 105, v42, v44, v45);
    }
    id v39 = [v53 copy];

    v31 = v53;
  }
  else
  {
    v30 = +[_DPLog service];
    v31 = v30;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      sub_10005663C(v30, v32, v33, v34, v35, v36, v37, v38);
      id v39 = 0;
      v31 = v30;
    }
    else
    {
      id v39 = 0;
    }
  }

  return v39;
}

- (id)extractTokenFieldsFromConfig:(id)a3
{
  id v38 = 0;
  v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v38];
  id v5 = v38;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v30 = self;
    id v31 = v5;
    uint64_t v32 = v4;
    v10 = [v4 objectForKeyedSubscript:@"token-keys"];
    id v33 = [&__NSDictionary0__struct mutableCopy];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v8 = v10;
    id v11 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v35;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          dispatch_semaphore_t v16 = [v15 objectForKeyedSubscript:@"token-key"];
          if ([v16 length])
          {
            v17 = [v15 objectForKeyedSubscript:@"not-before"];
            if (!v17
              || (+[NSDate date],
                  v18 = objc_claimAutoreleasedReturnValue(),
                  [v18 timeIntervalSince1970],
                  double v20 = v19,
                  v18,
                  [v17 doubleValue],
                  v20 > v21))
            {
              uint64_t v22 = [v15 objectForKeyedSubscript:@"version"];
              if (v22) {
                v23 = (__CFString *)v22;
              }
              else {
                v23 = @"unspecified";
              }
              v24 = [v16 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
              v25 = [v24 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

              id v26 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v25 options:1];
              if (v26)
              {
                [v33 setObject:v26 forKeyedSubscript:@"tokenKey"];
                [v33 setObject:v23 forKeyedSubscript:@"version"];
                int v27 = [v15 objectForKeyedSubscript:@"token-type"];
                [v33 setObject:v27 forKeyedSubscript:@"tokenType"];
              }
              else
              {
                int v27 = +[_DPLog service];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  sub_100056750((uint64_t)v25, v27, v28);
                }
              }

              goto LABEL_28;
            }
          }
        }
        id v12 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    id v9 = v33;
    [(_DPTokenFetcherService *)v30 setTokenFields:v33];
    v6 = v31;
    v4 = v32;
  }
  else
  {
    uint64_t v8 = +[_DPLog service];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000566C0(v6, v8);
    }
    id v9 = 0;
  }

  return v9;
}

- (BOOL)saveTokens:(id)a3 toFileInPath:(id)a4 forAggregator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(_DPTokenFetcherService *)self tokensDirectoryPath];
  }
  id v12 = v11;
  uint64_t v13 = +[NSFileManager defaultManager];
  id v38 = 0;
  unsigned __int8 v14 = [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v38];
  id v15 = v38;
  dispatch_semaphore_t v16 = v15;
  if (v14)
  {
    id v33 = v15;
    v17 = objc_opt_new();
    [v17 setDateFormat:@"dd_MM_yyyy_HH_mm_ss"];
    v18 = +[NSDate date];
    uint64_t v19 = [v17 stringFromDate:v18];

    double v20 = +[NSString stringWithFormat:@"%@Tokens_%@.pat", v10, v19];
    double v21 = [v12 stringByAppendingPathComponent:v20];
    id v37 = 0;
    id v34 = v8;
    uint64_t v22 = +[NSJSONSerialization dataWithJSONObject:v8 options:1 error:&v37];
    id v23 = v37;
    id v31 = v22;
    uint64_t v32 = (void *)v19;
    if (v23)
    {
      id v24 = v23;
      v25 = +[_DPLog service];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100056828((uint64_t)v24, v25, v26);
      }
    }
    else
    {
      id v36 = 0;
      unsigned __int8 v28 = [v22 writeToFile:v21 options:268435457 error:&v36];
      id v24 = v36;
      v29 = +[_DPLog service];
      v25 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully saved tokens to file.", buf, 2u);
        }
        BOOL v27 = 1;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1000567C0();
      }
    }
    BOOL v27 = 0;
LABEL_18:

    dispatch_semaphore_t v16 = v33;
    id v8 = v34;
    goto LABEL_19;
  }
  v17 = +[_DPLog service];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100056898();
  }
  BOOL v27 = 0;
LABEL_19:

  return v27;
}

- (void)fetchTokens
{
  v3 = +[_DPLog service];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(_DPTokenFetcherService *)self config];
    *(_DWORD *)buf = 138412290;
    v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching tokens as per configuration: %@", buf, 0xCu);
  }
  id v5 = [(_DPTokenFetcherService *)self config];
  v6 = [v5 aggregators];

  BOOL v7 = [(_DPTokenFetcherService *)self config];
  id v8 = [v7 issuerURL];

  if (v6 && v8)
  {
    id v10 = [_DPDediscoBackgroundDownloaderService alloc];
    id v11 = +[NSURL URLWithString:v8];
    id v12 = [(_DPDediscoBackgroundDownloaderService *)v10 initWithURL:v11];

    uint64_t v13 = [(_DPDediscoBackgroundDownloaderService *)v12 downloadConfigSynchronously];

    if ([v13 length])
    {
      uint64_t v14 = [(_DPTokenFetcherService *)self extractTokenFieldsFromConfig:v13];
      id v15 = v14;
      if (v14)
      {
        id v39 = v14;
        v40 = v6;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v16 = v6;
        id v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v42;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v42 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              [(_DPTokenFetcherService *)self donateTokenCountToBitacoraForAggregator:v21 dirPath:0];
              id v23 = [(_DPTokenFetcherService *)self fetchMultipleChallengeTokenPairForAggregator:v21];
              if ([v23 count]) {
                [(_DPTokenFetcherService *)self saveTokens:v23 toFileInPath:0 forAggregator:v21];
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v18);
        }

        id v15 = v39;
        v6 = v40;
      }
      else
      {
        id v31 = +[_DPLog service];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_100056938(v31, v32, v33, v34, v35, v36, v37, v38);
        }
      }
    }
    else
    {
      id v15 = +[_DPLog service];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100056900(v15, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
  else
  {
    uint64_t v13 = +[_DPLog service];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Missing aggregator list or issue URL. Skipping token fetching", buf, 2u);
    }
  }
}

- (unint64_t)donateTokenCountToBitacoraForAggregator:(id)a3 dirPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = v7;
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [(_DPTokenFetcherService *)self tokensDirectoryPath];
  }
  uint64_t v24 = v8;
  uint64_t v26 = v6;
  +[_DPTokenFetcherHelper filesInDirectory:v8 withPrefix:v6];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v30;
    uint64_t v13 = &stru_1000780C8;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        id v15 = +[NSData dataWithContentsOfURL:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        if ([v15 length])
        {
          id v28 = 0;
          id v16 = +[NSJSONSerialization JSONObjectWithData:v15 options:1 error:&v28];
          id v17 = v28;
          id v18 = v17;
          if (v17)
          {
            uint64_t v19 = [(__CFString *)v13 stringByAppendingFormat:@"%@; ", v17];

            uint64_t v13 = (__CFString *)v19;
          }
          else
          {
            v11 += (unint64_t)[v16 count];
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
    uint64_t v13 = &stru_1000780C8;
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Token count for %@: %lu; %@",
    v26,
    v11,
  double v20 = v13);

  LOBYTE(v23) = 1;
  LODWORD(v22) = 3;
  HIDWORD(v22) = v11;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", @"fedstats:com.apple.Bitacora.TokenFetcher:000:000:iOS", 1, 0, 0, 107, v20, v22, v23);

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)tokensDirectoryPath
{
  return self->_tokensDirectoryPath;
}

- (void)setTokensDirectoryPath:(id)a3
{
}

- (NSDictionary)tokenFields
{
  return self->_tokenFields;
}

- (void)setTokenFields:(id)a3
{
}

- (_DPPrivateAccessTokenConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_tokenFields, 0);
  objc_storeStrong((id *)&self->_tokensDirectoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end