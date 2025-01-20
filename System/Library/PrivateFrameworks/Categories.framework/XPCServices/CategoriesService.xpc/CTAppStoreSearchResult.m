@interface CTAppStoreSearchResult
+ (id)appStoreSearchResultsWithResultData:(id)a3 platform:(id)a4 error:(id *)a5;
- (CTAppStoreSearchResult)initWithBundleID:(id)a3 platform:(id)a4;
- (CTAppStoreSearchResult)initWithSearchResultRecord:(id)a3 platform:(id)a4;
- (NSArray)genreIDs;
- (NSString)bundleID;
- (NSString)platform;
- (id)description;
@end

@implementation CTAppStoreSearchResult

+ (id)appStoreSearchResultsWithResultData:(id)a3 platform:(id)a4 error:(id *)a5
{
  id v28 = a4;
  v8 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:a5];
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000072EC((uint64_t)a5, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      *a5 = +[NSError errorWithDomain:CTErrorDomain code:2002 userInfo:0];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000074B8();
    }
LABEL_31:
    v10 = 0;
    goto LABEL_38;
  }
  v9 = [v8 objectForKeyedSubscript:@"results"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "CTAppStoreSearchResult results: %{private}@", buf, 0xCu);
    }
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v26 = v9;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [objc_alloc((Class)a1) initWithSearchResultRecord:v16 platform:v28];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              id v41 = v17;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "CTAppStoreSearchResult searchResult: %{private}@", buf, 0xCu);
            }
            if (v17)
            {
              [v10 addObject:v17];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_1000073B0(v37, (uint64_t)v17, &v38);
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              sub_100007364(v35, v16, &v36);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_1000073FC(v33, v16, &v34);
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v13);
    }

    v9 = v26;
    v8 = v27;
  }
  else
  {
    if (a5)
    {
      *a5 = +[NSError errorWithDomain:CTErrorDomain code:2002 userInfo:0];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007448();
    }
    v10 = 0;
  }

LABEL_38:
  return v10;
}

- (CTAppStoreSearchResult)initWithSearchResultRecord:(id)a3 platform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"bundleId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v6 objectForKeyedSubscript:@"genreIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = v9;
      id v23 = v7;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v9;
      id v11 = (char *)[v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v26;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100007528();
              }

              uint64_t v20 = 0;
              goto LABEL_21;
            }
            ++v14;
          }
          while (v12 != v14);
          id v12 = (char *)[v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v24.receiver = self;
      v24.super_class = (Class)CTAppStoreSearchResult;
      v15 = [(CTAppStoreSearchResult *)&v24 init];
      uint64_t v16 = (NSString *)[v8 copy];
      bundleID = v15->_bundleID;
      v15->_bundleID = v16;

      uint64_t v18 = (NSArray *)[v10 copy];
      genreIDs = v15->_genreIDs;
      v15->_genreIDs = v18;

      objc_storeStrong((id *)&v15->_platform, a4);
      self = v15;
      uint64_t v20 = self;
LABEL_21:
      v9 = v22;
      id v7 = v23;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100007598();
      }
      uint64_t v20 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007608();
    }
    uint64_t v20 = 0;
  }

  return v20;
}

- (CTAppStoreSearchResult)initWithBundleID:(id)a3 platform:(id)a4
{
  id v6 = (NSString *)a4;
  v14.receiver = self;
  v14.super_class = (Class)CTAppStoreSearchResult;
  id v7 = a3;
  v8 = [(CTAppStoreSearchResult *)&v14 init];
  v9 = (NSString *)objc_msgSend(v7, "copy", v14.receiver, v14.super_class);

  bundleID = v8->_bundleID;
  v8->_bundleID = v9;

  genreIDs = v8->_genreIDs;
  v8->_genreIDs = (NSArray *)&__NSArray0__struct;

  platform = v8->_platform;
  v8->_platform = v6;

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@, %@", self->_bundleID, self->_genreIDs];
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)genreIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genreIDs, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end