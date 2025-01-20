@interface _DPPrivateAccessTokenManager
- (BOOL)allowOnDemandFetchingForDate:(id)a3 maxDailyOnDemand:(unint64_t)a4 withError:(id *)a5;
- (BOOL)updateTokenFileWithTokenArray:(id)a3 inPath:(id)a4;
- (NSString)tokensDirectoryPath;
- (_DPPrivateAccessTokenManager)init;
- (_DPPrivateAccessTokenManager)initWithTokenPath:(id)a3;
- (id)onDemandReportAuthForAggregator:(id)a3;
- (id)randomFileForAggregator:(id)a3;
- (id)randomTokenForAggregator:(id)a3;
- (id)reportAuthForAggregator:(id)a3 withError:(id *)a4;
- (void)setTokensDirectoryPath:(id)a3;
@end

@implementation _DPPrivateAccessTokenManager

- (_DPPrivateAccessTokenManager)init
{
  v3 = +[_DPStrings tokensDirectoryPath];
  v4 = [(_DPPrivateAccessTokenManager *)self initWithTokenPath:v3];

  return v4;
}

- (_DPPrivateAccessTokenManager)initWithTokenPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPPrivateAccessTokenManager;
  v6 = [(_DPPrivateAccessTokenManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tokensDirectoryPath, a3);
  }

  return v7;
}

- (id)randomTokenForAggregator:(id)a3
{
  v4 = [(_DPPrivateAccessTokenManager *)self randomFileForAggregator:a3];
  if (!v4)
  {
    v10 = 0;
    goto LABEL_26;
  }
  id v5 = +[NSData dataWithContentsOfURL:v4];
  if (![v5 length])
  {
    v7 = +[_DPLog service];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100057584(v4);
    }
    v10 = 0;
    goto LABEL_25;
  }
  id v21 = 0;
  v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:1 error:&v21];
  v7 = v21;
  if ([v6 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    objc_super v9 = +[_DPLog service];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100057608(v7);
    }
    v10 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = arc4random_uniform((uint32_t)[v6 count]);
  id v12 = objc_alloc((Class)NSData);
  v13 = [v6 objectAtIndexedSubscript:v11];
  v14 = [v13 objectForKeyedSubscript:@"challenge"];
  objc_super v9 = [v12 initWithBase64EncodedString:v14 options:0];

  if (![v9 length])
  {
    v18 = +[_DPLog service];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10005768C();
    }
    goto LABEL_22;
  }
  id v15 = objc_alloc((Class)NSData);
  v16 = [v6 objectAtIndexedSubscript:v11];
  v17 = [v16 objectForKeyedSubscript:@"token"];
  v18 = [v15 initWithBase64EncodedString:v17 options:0];

  if (![v18 length])
  {
    v19 = +[_DPLog service];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000576F4();
    }

LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  [v6 removeObjectAtIndex:v11];
  [(_DPPrivateAccessTokenManager *)self updateTokenFileWithTokenArray:v6 inPath:v4];
  v10 = [[TokenChallengePair alloc] initWithChallenge:v9 token:v18];
LABEL_23:

LABEL_24:
LABEL_25:

LABEL_26:
  return v10;
}

- (id)randomFileForAggregator:(id)a3
{
  id v4 = a3;
  v25 = +[NSDate date];
  id v5 = [&__NSArray0__struct mutableCopy];
  v6 = +[NSFileManager defaultManager];
  v7 = [(_DPPrivateAccessTokenManager *)self tokensDirectoryPath];
  BOOL v8 = [v6 enumeratorAtPath:v7];

  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      if ([v10 hasPrefix:v4])
      {
        uint64_t v11 = [(_DPPrivateAccessTokenManager *)self tokensDirectoryPath];
        id v12 = [v11 stringByAppendingPathComponent:v10];

        v13 = [v6 attributesOfItemAtPath:v12 error:0];
        v14 = [v13 fileCreationDate];

        id v15 = [v14 dateByAddingTimeInterval:86400.0];
        if ([v15 compare:v25] == (id)1)
        {
          v16 = +[NSURL fileURLWithPath:v12];
          [v5 addObject:v16];
        }
      }
      uint64_t v17 = [v8 nextObject];

      v10 = (void *)v17;
    }
    while (v17);
  }
  if ([v5 count])
  {
    if ([v5 count])
    {
      while (1)
      {
        uint64_t v18 = arc4random_uniform((uint32_t)[v5 count]);
        v19 = [v5 objectAtIndexedSubscript:v18];
        v20 = [v19 path];
        id v21 = [v6 attributesOfItemAtPath:v20 error:0];

        if ([v21 fileSize]) {
          break;
        }
        [v5 removeObjectAtIndex:v18];

        if (![v5 count]) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
LABEL_17:
    if ([v5 count])
    {
      v23 = [v5 objectAtIndexedSubscript:v18];
      goto LABEL_22;
    }
    v22 = +[_DPLog service];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000577FC(self);
    }
  }
  else
  {
    v22 = +[_DPLog service];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10005775C(self);
    }
  }

  v23 = 0;
LABEL_22:

  return v23;
}

- (BOOL)updateTokenFileWithTokenArray:(id)a3 inPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v14 = 0;
    id v7 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:&v14];
    id v8 = v14;
    if (v8)
    {
      uint64_t v9 = +[_DPLog service];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005798C();
      }
LABEL_11:
      unsigned __int8 v10 = 0;
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v11 = [v6 path];
    unsigned __int8 v10 = 1;
    unsigned __int8 v12 = [v7 writeToFile:v11 atomically:1];

    if ((v12 & 1) == 0)
    {
      uint64_t v9 = +[_DPLog service];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100057924();
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = +[NSFileManager defaultManager];
    id v15 = 0;
    unsigned __int8 v10 = [v8 removeItemAtURL:v6 error:&v15];
    id v7 = v15;
    if ((v10 & 1) == 0)
    {
      uint64_t v9 = +[_DPLog service];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100057880((uint64_t)v6, v7);
      }
      goto LABEL_12;
    }
  }
LABEL_13:

  return v10;
}

- (id)reportAuthForAggregator:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_class();
  objc_sync_enter(v7);
  id v8 = [(_DPPrivateAccessTokenManager *)self randomTokenForAggregator:v6];
  if (!v8)
  {
    id v8 = [(_DPPrivateAccessTokenManager *)self onDemandReportAuthForAggregator:v6];
  }
  objc_sync_exit(v7);

  if (v8)
  {
    uint64_t v9 = [v8 challenge];
    unsigned __int8 v10 = [v8 token];
    uint64_t v11 = [[_DPReportAuth alloc] initWithToken:v10 withChallenge:v9];
  }
  else
  {
    unsigned __int8 v12 = +[NSString stringWithFormat:@"Failed to fetch token-challenge pair for aggregator %@", v6];
    v13 = +[_DPLog service];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000579F4();
    }

    if (a4)
    {
      *a4 = +[_DPDediscoError errorWithCode:801 description:v12];
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)allowOnDemandFetchingForDate:(id)a3 maxDailyOnDemand:(unint64_t)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSDateFormatter);
  [v8 setDateFormat:@"YYYY_MM_dd"];
  uint64_t v9 = [v8 stringFromDate:v7];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v11 = [(_DPPrivateAccessTokenManager *)self tokensDirectoryPath];
  unsigned __int8 v12 = [(_DPPrivateAccessTokenManager *)self tokensDirectoryPath];
  unsigned int v13 = [v12 hasSuffix:@"/"];
  CFStringRef v14 = &stru_1000780C8;
  if (!v13) {
    CFStringRef v14 = @"/";
  }
  id v15 = +[NSString stringWithFormat:@"%@%@records_%@.json", v11, v14, v9];

  id v68 = 0;
  v16 = +[NSData dataWithContentsOfFile:v15 options:0 error:&v68];
  id v17 = v68;
  uint64_t v18 = v17;
  if (v16)
  {
    id v67 = v17;
    v19 = +[NSJSONSerialization JSONObjectWithData:v16 options:1 error:&v67];
    id v20 = v67;

    if (v20)
    {
      id v21 = +[_DPLog service];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100057B2C();
      }

      if (a5)
      {
        id v20 = v20;
        v22 = a5;
        LOBYTE(a5) = 0;
        id *v22 = v20;
      }
      id v10 = v19;
      goto LABEL_71;
    }
    v57 = a5;
    v55 = v7;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v25 = v19;
    id v30 = [v25 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v30)
    {
      id v31 = v30;
      v58 = v15;
      unint64_t v28 = 0;
      uint64_t v32 = *(void *)v64;
      double v29 = 0.0;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v64 != v32) {
            objc_enumerationMutation(v25);
          }
          v34 = [*(id *)(*((void *)&v63 + 1) + 8 * i) objectForKeyedSubscript:@"on-demand-tokens"];
          if (v34)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              ++v28;
              [v34 doubleValue];
              if (v35 > v29) {
                double v29 = v35;
              }
            }
          }
        }
        id v31 = [v25 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v31);
      id v20 = 0;
      id v10 = v25;
      id v15 = v58;
    }
    else
    {
      id v20 = 0;
      unint64_t v28 = 0;
      double v29 = 0.0;
      id v10 = v25;
    }
    goto LABEL_38;
  }
  if (!v17)
  {
    v36 = +[NSString stringWithFormat:@"Unexpected error while checking on-demand token fetching. The record file at %@ appears to be empty", v15];
    v37 = +[_DPLog service];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1000579F4();
    }

    if (a5)
    {
      *a5 = +[_DPDediscoError errorWithCode:103 description:v36];
    }

    id v20 = 0;
    goto LABEL_50;
  }
  v23 = [v17 domain];
  if ([v23 isEqualToString:NSCocoaErrorDomain])
  {
    id v24 = [v18 code];

    if (v24 == (id)260)
    {
      v57 = a5;

      id v25 = +[NSFileManager defaultManager];
      v26 = [v15 stringByDeletingLastPathComponent];
      id v62 = 0;
      unsigned __int8 v27 = [v25 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v62];
      id v20 = v62;
      if ((v27 & 1) == 0)
      {
        v53 = +[_DPLog service];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_100056898();
        }

        if (v57) {
          id *v57 = v20;
        }

        goto LABEL_50;
      }
      v55 = v7;

      unint64_t v28 = 0;
      double v29 = 0.0;
LABEL_38:

      if (v28 < a4)
      {
        v56 = v9;
        v40 = +[NSDate dateWithTimeIntervalSince1970:v29 + 300.0];
        id v7 = v55;
        if ([v55 compare:v40] == (id)-1)
        {
          v43 = +[NSString stringWithFormat:@"On-demand fetching occurring too frequently: disabled until %@", v40];
          v49 = +[_DPLog service];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_1000579F4();
          }

          if (v57)
          {
            id v50 = +[_DPDediscoError errorWithCode:104 description:v43];
LABEL_62:
            LOBYTE(a5) = 0;
            id *v57 = v50;
            goto LABEL_70;
          }
        }
        else
        {
          CFStringRef v69 = @"on-demand-tokens";
          [v55 timeIntervalSince1970];
          v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v70 = v41;
          v42 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          [v10 addObject:v42];

          id v61 = v20;
          v43 = +[NSJSONSerialization dataWithJSONObject:v10 options:1 error:&v61];
          id v44 = v61;

          if (v44)
          {
            v45 = +[_DPLog service];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              sub_10005798C();
            }

            if (!v57)
            {
              LOBYTE(a5) = 0;
              id v20 = v44;
              goto LABEL_70;
            }
            v46 = v44;
            goto LABEL_61;
          }
          id v60 = 0;
          LOBYTE(a5) = 1;
          uint64_t v51 = [v43 writeToFile:v15 options:1 error:&v60];
          id v20 = v60;
          if (v51)
          {
LABEL_70:

            uint64_t v9 = v56;
            goto LABEL_71;
          }
          v52 = +[_DPLog service];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_100057A5C();
          }

          if (v57)
          {
            v46 = v20;
LABEL_61:
            id v50 = v46;
            id v20 = v50;
            goto LABEL_62;
          }
        }
        LOBYTE(a5) = 0;
        goto LABEL_70;
      }
      v47 = +[NSString stringWithFormat:@"On-demand token fetching exceeded daily allowed times of %ld", a4];
      v48 = +[_DPLog service];
      id v7 = v55;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_1000579F4();
      }

      if (v57)
      {
        id *v57 = +[_DPDediscoError errorWithCode:104 description:v47];
      }

LABEL_50:
      LOBYTE(a5) = 0;
      goto LABEL_71;
    }
  }
  else
  {
  }
  v38 = +[_DPLog service];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_100057AC4();
  }

  if (a5)
  {
    id v20 = v18;
    v39 = a5;
    LOBYTE(a5) = 0;
    id *v39 = v20;
  }
  else
  {
    id v20 = v18;
  }
LABEL_71:

  return (char)a5;
}

- (id)onDemandReportAuthForAggregator:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  id v6 = +[_DPLog service];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to fetch PAT on demand for %@", buf, 0xCu);
  }

  id v7 = +[_DPPrivateAccessTokenConfig createAndPersist];
  id v8 = v7;
  if (!v7)
  {
    id v10 = +[_DPLog service];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100057B94(v10);
    }
    goto LABEL_12;
  }
  id v17 = 0;
  unsigned __int8 v9 = -[_DPPrivateAccessTokenManager allowOnDemandFetchingForDate:maxDailyOnDemand:withError:](self, "allowOnDemandFetchingForDate:maxDailyOnDemand:withError:", v5, [v7 maxDailyOnDemand], &v17);
  id v10 = v17;
  if ((v9 & 1) == 0)
  {
    CFStringRef v14 = +[_DPLog service];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100057C1C();
    }

LABEL_12:
    unsigned int v13 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = [[_DPTokenFetcherService alloc] initWithTokenConfig:v8];
  unsigned __int8 v12 = v11;
  if (v11)
  {
    [(_DPTokenFetcherService *)v11 fetchTokens];
    unsigned int v13 = [(_DPPrivateAccessTokenManager *)self randomTokenForAggregator:v4];
  }
  else
  {
    id v15 = +[_DPLog service];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100057BD8(v15);
    }

    unsigned int v13 = 0;
  }

LABEL_17:
  return v13;
}

- (NSString)tokensDirectoryPath
{
  return self->_tokensDirectoryPath;
}

- (void)setTokensDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end