@interface LoadInAppProductsTask
- (LoadInAppProductsTask)initWithProductIdentifiers:(id)a3 client:(id)a4 apiVersion:(int64_t)a5;
- (LoadInAppProductsTask)initWithSubscriptionGroupIdentifiers:(id)a3 client:(id)a4;
- (NSArray)identifiers;
- (NSArray)invalidIdentifiers;
- (NSArray)products;
- (NSString)serverCorrelationIdentifier;
- (_TtC9storekitd6Client)client;
- (char)_clientType;
- (id)_buildMediaAPIURLWith:(id)a3 error:(id *)a4;
- (id)_localeIdentifier;
- (id)_mediaAPIFetchWith:(id)a3 error:(id *)a4;
- (id)_mediaClientIdentifier;
- (id)_mediaPlatformString;
- (id)_newProductIdentifierAllowedCharacterSet;
- (id)_parseLegacyToMedia:(id)a3;
- (id)_parseMediaProducts:(id)a3;
- (id)_parseResponse:(id)a3 error:(id *)a4;
- (id)_processIdentifiers;
- (id)_productIdentifierAllowedCharacterSet;
- (id)_queryDictionary;
- (id)_requestBatches:(id)a3 error:(id *)a4;
- (int64_t)apiVersion;
- (int64_t)identifierKind;
- (void)main;
@end

@implementation LoadInAppProductsTask

- (LoadInAppProductsTask)initWithProductIdentifiers:(id)a3 client:(id)a4 apiVersion:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LoadInAppProductsTask;
  v11 = [(Task *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 50), a4);
    objc_storeStrong((id *)(v12 + 58), a3);
    *(void *)(v12 + 66) = 0;
    *(void *)(v12 + 74) = a5;
    uint64_t v13 = +[NSUUID lib_shortLogKeyWithAPIVersion:a5];
    v14 = *(void **)(v12 + 42);
    *(void *)(v12 + 42) = v13;
  }
  return (LoadInAppProductsTask *)v12;
}

- (LoadInAppProductsTask)initWithSubscriptionGroupIdentifiers:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LoadInAppProductsTask;
  id v9 = [(Task *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 50), a4);
    objc_storeStrong((id *)(v10 + 58), a3);
    *(void *)(v10 + 66) = 1;
    *(void *)(v10 + 74) = 2;
    uint64_t v11 = +[NSUUID lib_shortLogKeyWithAPIVersion:2];
    v12 = *(void **)(v10 + 42);
    *(void *)(v10 + 42) = v11;
  }
  return (LoadInAppProductsTask *)v10;
}

- (void)main
{
  if (qword_1003A04F0 != -1) {
    dispatch_once(&qword_1003A04F0, &stru_10035A508);
  }
  v3 = (void *)qword_1003A04B8;
  if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(LoadInAppProductsTask **)(&self->super._finished + 1);
    v5 = v3;
    *(_DWORD *)buf = 138543618;
    v90 = v4;
    __int16 v91 = 2114;
    id v92 = (id)objc_opt_class();
    id v6 = v92;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] [%{public}@]: Started task", buf, 0x16u);
  }
  id v7 = [(LoadInAppProductsTask *)self _processIdentifiers];
  id v8 = [(LoadInAppProductsTask *)self client];
  id v9 = [v8 bag];

  id v10 = +[BagKey productsBatchLimit];
  uint64_t v11 = [v9 integerForKey:v10];

  id v88 = 0;
  v12 = [v11 valueWithError:&v88];
  id v13 = v88;
  if (!v12 && ASDErrorIsEqual())
  {

    v12 = &off_100373BF0;
    goto LABEL_14;
  }
  if (!v13)
  {
LABEL_14:
    int64_t v18 = [(LoadInAppProductsTask *)self identifierKind];
    if (v18 == 1)
    {
      if (qword_1003A04F0 != -1) {
        dispatch_once(&qword_1003A04F0, &stru_10035A508);
      }
      v24 = (void *)qword_1003A04B8;
      if (!os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      v20 = v24;
      id v25 = [v7 count];
      v22 = [*(id *)((char *)&self->_logKey + 2) requestBundleID];
      *(_DWORD *)buf = 138543874;
      v90 = self;
      __int16 v91 = 2048;
      id v92 = v25;
      __int16 v93 = 2114;
      id v94 = v22;
      v23 = "%{public}@: Loading %lu subscription groups for %{public}@";
    }
    else
    {
      if (v18) {
        goto LABEL_25;
      }
      if (qword_1003A04F0 != -1) {
        dispatch_once(&qword_1003A04F0, &stru_10035A508);
      }
      v19 = (void *)qword_1003A04B8;
      if (!os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      v20 = v19;
      id v21 = [v7 count];
      v22 = [*(id *)((char *)&self->_logKey + 2) requestBundleID];
      *(_DWORD *)buf = 138543874;
      v90 = self;
      __int16 v91 = 2048;
      id v92 = v21;
      __int16 v93 = 2114;
      id v94 = v22;
      v23 = "%{public}@: Loading %lu products for %{public}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);

LABEL_25:
    v72 = v11;
    v73 = v9;
    v74 = v12;
    v75 = self;
    v26 = (char *)[v12 integerValue];
    id v78 = objc_alloc_init((Class)NSMutableArray);
    id v27 = objc_alloc_init((Class)NSMutableString);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    os_log_t log = v7;
    obj = v7;
    id v28 = [obj countByEnumeratingWithState:&v84 objects:v106 count:16];
    if (v28)
    {
      id v29 = v28;
      v30 = 0;
      uint64_t v31 = *(void *)v85;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v85 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          if (v30 == v26
            || (id v34 = [v27 length],
                (unint64_t)[v33 length] + (void)v34 + 1 >= 0x281))
          {
            [v78 addObject:v27];
            id v35 = objc_alloc_init((Class)NSMutableString);

            v30 = 0;
            id v27 = v35;
          }
          id v36 = [v27 length];
          CFStringRef v37 = @",";
          if (!v36) {
            CFStringRef v37 = &stru_10036C970;
          }
          [v27 appendFormat:@"%@%@", v37, v33];
          ++v30;
        }
        id v29 = [obj countByEnumeratingWithState:&v84 objects:v106 count:16];
      }
      while (v29);
    }

    v38 = v78;
    if ([v27 length]) {
      [v78 addObject:v27];
    }
    id v83 = 0;
    v39 = v75;
    v40 = [(LoadInAppProductsTask *)v75 _requestBatches:v78 error:&v83];
    id obja = v83;
    if (obja)
    {
      if (qword_1003A04F0 != -1) {
        dispatch_once(&qword_1003A04F0, &stru_10035A508);
      }
      id v7 = log;
      if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR)) {
        sub_1002C9ED4();
      }
      v41 = *(NSArray **)((char *)&v75->_invalidIdentifiers + 2);
      *(NSArray **)((char *)&v75->_invalidIdentifiers + 2) = (NSArray *)&__NSArray0__struct;

      v42 = [(LoadInAppProductsTask *)v75 identifiers];
      id v43 = [v42 copy];
      v44 = *(void **)((char *)&v75->_apiVersion + 2);
      *(int64_t *)((char *)&v75->_apiVersion + 2) = (int64_t)v43;

      [(AsyncTask *)v75 completeWithError:obja];
    }
    else
    {
      v45 = objc_opt_new();
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v69 = v40;
      id v46 = v40;
      id v47 = [v46 countByEnumeratingWithState:&v79 objects:v105 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v80;
        do
        {
          for (j = 0; j != v48; j = (char *)j + 1)
          {
            if (*(void *)v80 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
            if (*(int64_t *)((char *)&v39->_identifierKind + 2) == 1)
            {
              v52 = [*(id *)(*((void *)&v79 + 1) + 8 * (void)j) objectForKeyedSubscript:off_100399560[0]];
            }
            else
            {
              id v53 = [(LoadInAppProductsTask *)v39 identifierKind];
              v54 = [v51 objectForKeyedSubscript:@"attributes"];
              v55 = v54;
              if (v53 == (id)1) {
                CFStringRef v56 = @"subscriptionFamilyId";
              }
              else {
                CFStringRef v56 = @"offerName";
              }
              v52 = [v54 objectForKeyedSubscript:v56];

              v39 = v75;
            }
            [v45 addObject:v52];
          }
          id v48 = [v46 countByEnumeratingWithState:&v79 objects:v105 count:16];
        }
        while (v48);
      }

      v57 = +[NSMutableSet setWithArray:*(_TtC9storekitd6Client **)((char *)&v39->_client + 2)];
      [v57 intersectSet:v45];
      v58 = +[NSMutableSet setWithArray:*(_TtC9storekitd6Client **)((char *)&v39->_client + 2)];
      [v58 minusSet:v45];
      id v59 = [v45 mutableCopy];
      v60 = +[NSSet setWithArray:*(_TtC9storekitd6Client **)((char *)&v39->_client + 2)];
      [v59 minusSet:v60];

      if (qword_1003A04F0 != -1) {
        dispatch_once(&qword_1003A04F0, &stru_10035A508);
      }
      id v7 = log;
      v61 = (void *)qword_1003A04B8;
      if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
      {
        loga = v61;
        id v68 = [v46 count];
        v62 = v57;
        id v63 = [v58 count];
        id v64 = [v59 count];
        v65 = [*(id *)((char *)&v75->_logKey + 2) requestBundleID];
        *(_DWORD *)buf = 138545154;
        v90 = v75;
        __int16 v91 = 2048;
        id v92 = v68;
        __int16 v93 = 2048;
        id v94 = v63;
        v57 = v62;
        __int16 v95 = 2048;
        id v96 = v64;
        __int16 v97 = 2114;
        v98 = v65;
        __int16 v99 = 2114;
        v100 = v62;
        __int16 v101 = 2114;
        v102 = v58;
        __int16 v103 = 2114;
        id v104 = v59;
        _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "%{public}@: Received %lu products; %lu invalid identifiers, %lu unknown identifiers for %{public}@\n"
          "Valid identifiers: %{public}@\n"
          "Invalid identifiers: %{public}@\n"
          "Unknown identifiers: %{public}@",
          buf,
          0x52u);
      }
      objc_storeStrong((id *)((char *)&v75->_invalidIdentifiers + 2), v69);
      uint64_t v66 = [v58 allObjects];
      v67 = *(void **)((char *)&v75->_apiVersion + 2);
      *(int64_t *)((char *)&v75->_apiVersion + 2) = v66;

      [(AsyncTask *)v75 completeWithSuccess];
      v40 = v69;

      v12 = v74;
      v38 = v78;
    }

    uint64_t v11 = v72;
    id v9 = v73;
    id v13 = obja;
    goto LABEL_64;
  }
  if (qword_1003A04F0 != -1) {
    dispatch_once(&qword_1003A04F0, &stru_10035A508);
  }
  if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR)) {
    sub_1002C9ED4();
  }
  objc_super v14 = *(NSArray **)((char *)&self->_invalidIdentifiers + 2);
  *(NSArray **)((char *)&self->_invalidIdentifiers + 2) = (NSArray *)&__NSArray0__struct;

  v15 = [(LoadInAppProductsTask *)self identifiers];
  id v16 = [v15 copy];
  v17 = *(void **)((char *)&self->_apiVersion + 2);
  *(int64_t *)((char *)&self->_apiVersion + 2) = (int64_t)v16;

  [(AsyncTask *)self completeWithError:v13];
LABEL_64:
}

- (char)_clientType
{
  v2 = [(LoadInAppProductsTask *)self client];
  char v3 = objc_msgSend(v2, "objc_clientType");

  return v3;
}

- (id)_processIdentifiers
{
  char v3 = [(LoadInAppProductsTask *)self identifiers];
  id v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  v15 = [(LoadInAppProductsTask *)self _productIdentifierAllowedCharacterSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(LoadInAppProductsTask *)self identifiers];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v9 length]
          && (unint64_t)[v9 length] < 0x101)
        {
          v12 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v15];
          [v16 addObject:v12];
        }
        else
        {
          if (qword_1003A04F0 != -1) {
            dispatch_once(&qword_1003A04F0, &stru_10035A508);
          }
          id v10 = qword_1003A04B8;
          if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *(void *)(&self->super._finished + 1);
            *(_DWORD *)buf = 138543618;
            uint64_t v22 = v11;
            __int16 v23 = 2114;
            v24 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping invalid identifier \"%{public}@\"", buf, 0x16u);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }

  id v13 = [v16 sortedArrayUsingSelector:"compare:"];

  return v13;
}

- (id)_productIdentifierAllowedCharacterSet
{
  if ((id)[(LoadInAppProductsTask *)self apiVersion] == (id)1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008E4D0;
    block[3] = &unk_100358170;
    block[4] = self;
    if (qword_1003A0498 != -1) {
      dispatch_once(&qword_1003A0498, block);
    }
    char v3 = &qword_1003A0488;
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10008E508;
    v5[3] = &unk_100358170;
    v5[4] = self;
    if (qword_1003A04A0 != -1) {
      dispatch_once(&qword_1003A04A0, v5);
    }
    char v3 = &qword_1003A0490;
  }
  return (id)*v3;
}

- (id)_newProductIdentifierAllowedCharacterSet
{
  int64_t v2 = [(LoadInAppProductsTask *)self apiVersion];
  CFStringRef v3 = @"?&=,";
  if (v2 != 2) {
    CFStringRef v3 = 0;
  }
  if (v2 == 1) {
    CFStringRef v4 = @"?&=";
  }
  else {
    CFStringRef v4 = v3;
  }
  id v5 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v6 = [v5 mutableCopy];

  [v6 removeCharactersInString:v4];
  return v6;
}

- (id)_buildMediaAPIURLWith:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(LoadInAppProductsTask *)self client];
  id v8 = [v7 bag];

  if ([(LoadInAppProductsTask *)self _clientType] == 1)
  {
    id v9 = +[BagKey mediaAPIHost];
    id v10 = [v8 URLForKey:v9];
    uint64_t v11 = v10;
    uint64_t v50 = 0;
    v12 = (id *)&v50;
    id v13 = &v50;
  }
  else
  {
    id v9 = +[BagKey mediaAPISandboxHost];
    id v10 = [v8 URLForKey:v9];
    uint64_t v11 = v10;
    uint64_t v49 = 0;
    v12 = (id *)&v49;
    id v13 = &v49;
  }
  objc_super v14 = [v10 valueWithError:v13];
  id v15 = *v12;

  if (v15)
  {
    if (a4)
    {
      id v15 = v15;
      id v16 = 0;
      *a4 = v15;
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    long long v17 = +[BagKey countryCode];
    long long v18 = [v8 stringForKey:v17];
    id v48 = 0;
    long long v19 = [v18 valueWithError:&v48];
    id v15 = v48;

    if (v15)
    {
      if (a4)
      {
        id v15 = v15;
        id v16 = 0;
        *a4 = v15;
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      long long v20 = +[BagKey languageTag];
      id v21 = [v8 stringForKey:v20];
      id v47 = 0;
      uint64_t v22 = [v21 valueWithError:&v47];
      id v15 = v47;

      if (v15)
      {
        id v16 = 0;
        if (a4) {
          *a4 = v15;
        }
      }
      else
      {
        unsigned int v23 = [(LoadInAppProductsTask *)self _clientType];
        CFStringRef v24 = @"https://";
        if (v23 == 3) {
          CFStringRef v24 = @"http://";
        }
        v45 = +[NSString stringWithFormat:@"%@%@/v1/catalog/%@/in-apps", v24, v14, v19];
        id v16 = +[NSURLComponents componentsWithString:v45];
        uint64_t v25 = [(LoadInAppProductsTask *)self _mediaPlatformString];
        v42 = (void *)v25;
        int64_t v26 = [(LoadInAppProductsTask *)self apiVersion];
        CFStringRef v27 = @"kind";
        if (v26 == 1) {
          CFStringRef v27 = @"hostedContent";
        }
        CFStringRef v38 = v27;
        int64_t v28 = [(LoadInAppProductsTask *)self identifierKind];
        int64_t v29 = [(LoadInAppProductsTask *)self identifierKind];
        if (v28 == 1 || v29 == 1) {
          CFStringRef v31 = @"filter[subscriptionFamilyId]";
        }
        else {
          CFStringRef v31 = @"filter[offerName]";
        }
        id v46 = v22;
        v44 = +[NSURLQueryItem queryItemWithName:v31 value:v6];
        v51[0] = v44;
        id v43 = [(LoadInAppProductsTask *)self client];
        v41 = [v43 requestBundleID];
        v40 = +[NSURLQueryItem queryItemWithName:@"filter[appBundleId]" value:v41];
        v51[1] = v40;
        v39 = +[NSURLQueryItem queryItemWithName:@"platform" value:v25];
        v51[2] = v39;
        CFStringRef v37 = +[NSURLQueryItem queryItemWithName:@"l" value:v22];
        v51[3] = v37;
        v32 = +[NSURLQueryItem queryItemWithName:@"extend" value:v38];
        v51[4] = v32;
        v33 = +[NSURLQueryItem queryItemWithName:@"with" value:@"adHocOffers"];
        v51[5] = v33;
        id v34 = +[NSURLQueryItem queryItemWithName:@"omit[resource]" value:@"autos"];
        v51[6] = v34;
        id v35 = +[NSArray arrayWithObjects:v51 count:7];
        [v16 setQueryItems:v35];

        uint64_t v22 = v46;
      }
    }
  }

  return v16;
}

- (id)_localeIdentifier
{
  CFStringRef v3 = [(LoadInAppProductsTask *)self client];
  CFStringRef v4 = [v3 bag];

  id v5 = +[BagKey languageTag];
  id v6 = [v4 stringForKey:v5];
  id v22 = 0;
  uint64_t v7 = [v6 valueWithError:&v22];
  id v8 = v22;

  if (v8)
  {
    if (qword_1003A04F0 != -1) {
      dispatch_once(&qword_1003A04F0, &stru_10035A508);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR)) {
      sub_1002C9FBC();
    }
  }
  else
  {
    id v9 = [v7 componentsSeparatedByString:@"-"];
    uint64_t v10 = [v9 firstObject];

    uint64_t v7 = (void *)v10;
  }
  uint64_t v11 = +[BagKey countryCode];
  v12 = [v4 stringForKey:v11];
  id v21 = v8;
  id v13 = [v12 valueWithError:&v21];
  id v14 = v21;

  if (!v14) {
    goto LABEL_11;
  }
  if (qword_1003A04F0 != -1) {
    dispatch_once(&qword_1003A04F0, &stru_10035A508);
  }
  if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR))
  {
    sub_1002C9F48();
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
    if (!v7) {
      goto LABEL_15;
    }
  }
  if (v13)
  {
    id v15 = [v13 uppercaseString];
    id v16 = +[NSString stringWithFormat:@"%@_%@", v7, v15];

    goto LABEL_19;
  }
LABEL_15:
  long long v17 = +[NSLocale currentLocale];
  id v16 = [v17 localeIdentifier];

  if (qword_1003A04F0 != -1) {
    dispatch_once(&qword_1003A04F0, &stru_10035A508);
  }
  long long v18 = qword_1003A04B8;
  if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(&self->super._finished + 1);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v19;
    __int16 v25 = 2114;
    int64_t v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Defaulting media products to device locale: %{public}@", buf, 0x16u);
  }
LABEL_19:

  return v16;
}

- (id)_mediaPlatformString
{
  return +[AMSDevice sk_defaultMediaAPIPlatform];
}

- (id)_mediaClientIdentifier
{
  unsigned int v2 = [(LoadInAppProductsTask *)self _clientType];
  CFStringRef v3 = @"com.apple.storekit.prod";
  if (v2 == 2) {
    CFStringRef v3 = @"com.apple.storekit.sandbox";
  }
  if (v2 == 3) {
    return @"com.apple.storekit.xcode";
  }
  else {
    return (id)v3;
  }
}

- (id)_mediaAPIFetchWith:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)AMSMediaTokenService);
  id v8 = [(LoadInAppProductsTask *)self _mediaClientIdentifier];
  id v9 = [(LoadInAppProductsTask *)self client];
  uint64_t v10 = [v9 bag];
  id v11 = [v7 initWithClientIdentifier:v8 bag:v10];

  v12 = [(LoadInAppProductsTask *)self client];
  id v13 = [v12 processInfo];
  [v11 setClientInfo:v13];

  id v14 = objc_alloc((Class)AMSMediaRequestEncoder);
  id v15 = [(LoadInAppProductsTask *)self client];
  id v16 = [v15 bag];
  id v17 = [v14 initWithTokenService:v11 bag:v16];

  long long v18 = [(LoadInAppProductsTask *)self client];
  uint64_t v19 = [v18 processInfo];
  [v17 setClientInfo:v19];

  [v17 setLogKey:*(void *)(&self->super._finished + 1)];
  id v20 = [objc_alloc((Class)AMSMediaProtocolHandler) initWithTokenService:v11];
  id v21 = objc_opt_new();
  id v22 = [(LoadInAppProductsTask *)self client];
  unsigned int v23 = [v22 urlSession];

  [v23 setProtocolHandler:v20];
  [v23 setResponseDecoder:v21];
  [v11 setSession:v23];
  id v43 = 0;
  uint64_t v24 = [(LoadInAppProductsTask *)self _buildMediaAPIURLWith:v6 error:&v43];

  id v25 = v43;
  if (v25)
  {
    id v26 = v25;
    if (qword_1003A04F0 != -1) {
      dispatch_once(&qword_1003A04F0, &stru_10035A508);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR))
    {
      sub_1002CA108();
      if (!a4) {
        goto LABEL_7;
      }
    }
    else if (!a4)
    {
LABEL_7:
      CFStringRef v27 = &__NSArray0__struct;
      goto LABEL_31;
    }
    id v26 = v26;
    *a4 = v26;
    goto LABEL_7;
  }
  v39 = a4;
  v40 = v24;
  int64_t v28 = [v17 requestWithComponents:v24];
  id v42 = 0;
  int64_t v29 = [v28 resultWithTimeout:&v42 error:60.0];
  id v26 = v42;
  id v30 = [v29 mutableCopy];

  if (!v26)
  {
    CFStringRef v31 = sub_100047628([(LoadInAppProductsTask *)self apiVersion]);
    [v30 setValue:v31 forHTTPHeaderField:@"X-Apple-Client-StoreKit-Version"];

    v32 = [v23 dataTaskPromiseWithRequest:v30];
    id v41 = 0;
    v33 = [v32 resultWithTimeout:&v41 error:60.0];
    id v26 = v41;

    id v34 = [v33 responseCorrelationId];
    id v35 = *(NSArray **)((char *)&self->_products + 2);
    *(NSArray **)((char *)&self->_products + 2) = v34;

    id v36 = [v33 object];
    CFStringRef v37 = [v36 objectForKeyedSubscript:@"data"];

    if (v37)
    {
      CFStringRef v27 = [v36 objectForKeyedSubscript:@"data"];
LABEL_29:

      goto LABEL_30;
    }
    if (!v26)
    {
      ASDErrorWithTitleAndMessage();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (qword_1003A04F0 != -1) {
      dispatch_once(&qword_1003A04F0, &stru_10035A508);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR))
    {
      sub_1002CA030();
      if (!v39) {
        goto LABEL_28;
      }
    }
    else if (!v39)
    {
LABEL_28:
      CFStringRef v27 = &__NSArray0__struct;
      goto LABEL_29;
    }
    id v26 = v26;
    id *v39 = v26;
    goto LABEL_28;
  }
  if (qword_1003A04F0 != -1) {
    dispatch_once(&qword_1003A04F0, &stru_10035A508);
  }
  if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR))
  {
    sub_1002CA09C();
    if (!v39) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v39)
  {
LABEL_13:
    id v26 = v26;
    id *v39 = v26;
  }
LABEL_14:
  CFStringRef v27 = &__NSArray0__struct;
LABEL_30:

  uint64_t v24 = v40;
LABEL_31:

  return v27;
}

- (id)_queryDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v4 = [(LoadInAppProductsTask *)self client];
  id v5 = [v4 requestBundleID];
  id v6 = objc_msgSend(v5, "lib_stringByCopyingUTF8StringWithLength:", 256);
  [v3 setObject:v6 forKeyedSubscript:@"bid"];

  id v7 = [(LoadInAppProductsTask *)self client];
  id v8 = [v7 requestBundleVersion];
  id v9 = objc_msgSend(v8, "lib_stringByCopyingUTF8StringWithLength:", 100);
  [v3 setObject:v9 forKeyedSubscript:@"bvrs"];

  uint64_t v10 = [(LoadInAppProductsTask *)self client];
  id v11 = [v10 storeItemID];

  if (v11)
  {
    v12 = [(LoadInAppProductsTask *)self client];
    id v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 storeItemID]);
    id v14 = [v13 stringValue];
    [v3 setObject:v14 forKeyedSubscript:@"appAdamId"];
  }
  id v15 = [(LoadInAppProductsTask *)self client];
  id v16 = [v15 storeExternalVersionID];

  if (v16)
  {
    id v17 = [(LoadInAppProductsTask *)self client];
    long long v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v17 storeExternalVersionID]);
    uint64_t v19 = [v18 stringValue];
    [v3 setObject:v19 forKeyedSubscript:@"appExtVrsId"];
  }
  id v20 = +[NSLocale autoupdatingCurrentLocale];
  id v21 = v20;
  if (v20)
  {
    id v22 = [v20 localeIdentifier];
    [v3 setObject:v22 forKey:@"icuLocale"];
  }
  unsigned int v23 = [(LoadInAppProductsTask *)self client];
  uint64_t v24 = [v23 accountMediaType];

  id v25 = [(LoadInAppProductsTask *)self client];
  id v26 = [v25 account];
  CFStringRef v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    int64_t v29 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v24];
    objc_msgSend(v29, "ams_localiTunesAccount");
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v30 = objc_msgSend(v28, "ams_storefrontForMediaType:", v24);
  if (v30)
  {
    [v3 setObject:v30 forKey:@"sfId"];
  }
  else
  {
    if (qword_1003A04F0 != -1) {
      dispatch_once(&qword_1003A04F0, &stru_10035A508);
    }
    CFStringRef v31 = (void *)qword_1003A04B8;
    if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR)) {
      sub_1002CA174((uint64_t)self, v31);
    }
  }

  return v3;
}

- (id)_requestBatches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(LoadInAppProductsTask *)self client];
  id v8 = [v7 bag];

  id v9 = [(LoadInAppProductsTask *)self client];
  uint64_t v50 = [v9 urlRequestEncoder];

  uint64_t v10 = [(LoadInAppProductsTask *)self client];
  id v46 = [v10 urlSession];

  id v11 = objc_alloc_init((Class)NSMutableArray);
  v52 = self;
  if (*(int64_t *)((char *)&self->_identifierKind + 2) != 2)
  {
    int64_t v12 = [(LoadInAppProductsTask *)self identifierKind];
    if (*(int64_t *)((char *)&self->_identifierKind + 2) == 1)
    {
      id v13 = +[BagKey legacyClientMediaAPIRate];
      id v14 = [v8 integerForKey:v13];
      id v15 = [v14 valueWithError:0];

      if (v15)
      {
        [v15 doubleValue];
        double v17 = v16;
      }
      else
      {
        double v17 = 0.0;
      }
      double v19 = (double)arc4random_uniform(0x7FFFFFFFu);
      if (qword_1003A04F0 != -1) {
        dispatch_once(&qword_1003A04F0, &stru_10035A508);
      }
      id v20 = qword_1003A04B8;
      double v21 = v19 / 2147483650.0;
      if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(&v52->super._finished + 1);
        *(_DWORD *)buf = 138544130;
        uint64_t v64 = v22;
        if (v21 >= v17) {
          CFStringRef v23 = @"NO";
        }
        else {
          CFStringRef v23 = @"YES";
        }
        __int16 v65 = 2114;
        CFStringRef v66 = v23;
        __int16 v67 = 2050;
        double v68 = v17;
        __int16 v69 = 2050;
        double v70 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using Media API for legacy products request: %{public}@ (Rate: %{public}f, Rolled: %{public}f)", buf, 0x2Au);
      }

      if (v21 < v17) {
        goto LABEL_18;
      }
LABEL_8:
      uint64_t v49 = [(LoadInAppProductsTask *)v52 _queryDictionary];
      int v18 = 0;
      goto LABEL_19;
    }
    if (v12 != 1) {
      goto LABEL_8;
    }
  }
  if (os_variant_has_internal_content()
    && +[AppDefaultsManager alwaysUseLegacyAPIForStoreKitProductsRequest])
  {
    goto LABEL_8;
  }
LABEL_18:
  uint64_t v49 = 0;
  int v18 = 1;
LABEL_19:
  v44 = a4;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v6;
  id v53 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  id v24 = 0;
  if (v53)
  {
    uint64_t v25 = *(void *)v59;
    v45 = v8;
    int v48 = v18;
    uint64_t v47 = *(void *)v59;
    while (2)
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if (v18)
        {
          id v57 = v24;
          id v28 = [(LoadInAppProductsTask *)v52 _mediaAPIFetchWith:v27 error:&v57];
          id v29 = v57;

          if (v29)
          {
            id v24 = v29;
LABEL_43:

            goto LABEL_44;
          }
          if (*(int64_t *)((char *)&v52->_identifierKind + 2) == 1)
          {
            uint64_t v30 = [(LoadInAppProductsTask *)v52 _parseMediaProducts:v28];

            id v24 = 0;
            id v28 = (void *)v30;
          }
          else
          {
            id v24 = 0;
          }
        }
        else
        {
          id v31 = v11;
          id v32 = [v49 mutableCopy];
          [v32 setObject:v27 forKeyedSubscript:@"offerNames"];
          v33 = +[BagKey productsURL];
          id v34 = [v8 URLForKey:v33];
          int v35 = 2;
          id v36 = [v50 requestWithMethod:2 bagURL:v34 parameters:v32];

          id v56 = v24;
          CFStringRef v37 = [v36 resultWithError:&v56];
          id v38 = v56;

          if (v38)
          {
            id v28 = 0;
            id v24 = v38;
          }
          else
          {
            v39 = [v46 dataTaskPromiseWithRequest:v37];
            id v55 = 0;
            v40 = [v39 resultWithError:&v55];
            id v24 = v55;
            uint64_t v41 = [v40 responseCorrelationId];
            id v42 = *(NSArray **)((char *)&v52->_products + 2);
            *(NSArray **)((char *)&v52->_products + 2) = (NSArray *)v41;

            if (v24)
            {
              id v28 = 0;
              int v35 = 2;
            }
            else
            {
              if ((id)[(LoadInAppProductsTask *)v52 apiVersion] == (id)2)
              {
                id v28 = [(LoadInAppProductsTask *)v52 _parseLegacyToMedia:v40];
                id v24 = 0;
              }
              else
              {
                id v54 = 0;
                id v28 = [(LoadInAppProductsTask *)v52 _parseResponse:v40 error:&v54];
                id v24 = v54;
              }
              int v35 = 2 * (v24 != 0);
            }

            id v8 = v45;
          }

          id v11 = v31;
          int v18 = v48;
          uint64_t v25 = v47;
          if (v35) {
            goto LABEL_43;
          }
        }
        [v11 addObjectsFromArray:v28];
      }
      id v53 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v53) {
        continue;
      }
      break;
    }
  }
LABEL_44:

  if (v44) {
    id *v44 = v24;
  }

  return v11;
}

- (id)_parseResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 object];
  id v7 = &NSUbiquitousKeyValueStoreChangeReasonKey_ptr;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1003A04F0 != -1) {
      dispatch_once(&qword_1003A04F0, &stru_10035A508);
    }
    long long v58 = (void *)qword_1003A04B8;
    if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR))
    {
      sub_1002CA23C((uint64_t)self, v58, (uint64_t)v5);
      if (a4) {
        goto LABEL_51;
      }
    }
    else if (a4)
    {
LABEL_51:
      ASDErrorWithTitleAndMessage();
      id v65 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
    id v65 = 0;
    goto LABEL_54;
  }
  id v8 = [v6 objectForKeyedSubscript:@"available-subproducts"];
  id v65 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_46;
  }
  long long v61 = v6;
  id v62 = v5;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v60 = v8;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (!v9) {
    goto LABEL_45;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v81;
  uint64_t v63 = *(void *)v81;
  do
  {
    int64_t v12 = 0;
    id v66 = v10;
    do
    {
      if (*(void *)v81 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v80 + 1) + 8 * (void)v12);
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v15 = objc_msgSend(v13, "tcr_stringForKey:", @"offerName");
      if (v15)
      {
        double v16 = (void *)v15;
        v72 = v12;
        [v14 setObject:v15 forKeyedSubscript:off_100399560[0]];
        double v17 = objc_msgSend(v13, "tcr_stringForKey:", @"icu-locale");

        if (v17)
        {
          [v14 setObject:v17 forKeyedSubscript:@"loc"];
          int v18 = objc_msgSend(v13, "tcr_stringForKey:", @"description");
          [v14 setObject:v18 forKeyedSubscript:@"desc"];

          double v19 = objc_msgSend(v13, "tcr_stringForKey:", @"title");
          [v14 setObject:v19 forKeyedSubscript:off_1003993D0[0]];

          id v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "tcr_BOOLForKey:", @"is-hosted"));
          [v14 setObject:v20 forKeyedSubscript:off_1003993B0[0]];

          double v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "tcr_BOOLForKey:", @"isFamilyShareable"));
          [v14 setObject:v21 forKeyedSubscript:off_1003993A8[0]];

          uint64_t v22 = objc_msgSend(v13, "tcr_stringForKey:", @"version");
          [v14 setObject:v22 forKeyedSubscript:@"hosted-version"];

          CFStringRef v23 = objc_msgSend(v13, "tcr_stringForKey:", @"subscriptionFamilyId");
          [v14 setObject:v23 forKeyedSubscript:off_1003994A8[0]];

          id v24 = objc_msgSend(v13, "tcr_stringForKey:", @"recurringSubscriptionPeriod");
          [v14 setObject:v24 forKeyedSubscript:@"per"];

          uint64_t v25 = objc_msgSend(v13, "tcr_dictionaryForKey:", @"store-offers");
          __int16 v69 = v25;
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = objc_msgSend(v25, "tcr_dictionaryForKey:", @"STDQ");
            if (v27)
            {
              double v70 = v13;
              id v28 = v27;
              uint64_t v29 = objc_msgSend(v27, "tcr_numberForKey:", @"price");

              if (!v29)
              {
                v71 = v28;
                if (qword_1003A04F0 != -1) {
                  dispatch_once(&qword_1003A04F0, &stru_10035A508);
                }
                int64_t v12 = v72;
                id v54 = (void *)qword_1003A04B8;
                if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v75 = *(void *)(&self->super._finished + 1);
                  id v55 = v54;
                  id v26 = v69;
                  uint64_t v56 = objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  uint64_t v86 = v75;
                  __int16 v87 = 2114;
                  uint64_t v88 = v56;
                  __int16 v89 = 2114;
                  uint64_t v90 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: Received invalid price %{public}@ in product dictionary", buf, 0x20u);
                }
                goto LABEL_37;
              }
              [v14 setObject:v29 forKeyedSubscript:@"pri"];
              uint64_t v30 = objc_msgSend(v28, "tcr_numberForKey:", @"size");
              [v14 setObject:v30 forKeyedSubscript:@"hosted-content-length"];

              double v17 = (void *)v29;
              uint64_t v27 = v28;
              id v13 = v70;
            }
            double v68 = v14;
          }
          else
          {
            double v68 = v14;
          }
          v71 = v17;
          id v38 = objc_msgSend(v13, "tcr_arrayForKey:", @"discounts");
          id v39 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v38, "count"));
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v40 = v38;
          id v41 = [v40 countByEnumeratingWithState:&v76 objects:v84 count:16];
          if (v41)
          {
            id v42 = v41;
            uint64_t v43 = *(void *)v77;
            do
            {
              for (i = 0; i != v42; i = (char *)i + 1)
              {
                if (*(void *)v77 != v43) {
                  objc_enumerationMutation(v40);
                }
                v45 = *(void **)(*((void *)&v76 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v46 = v7;
                  id v47 = objc_alloc_init((Class)NSMutableDictionary);
                  int v48 = [v45 objectForKeyedSubscript:@"price"];
                  [v47 setObject:v48 forKeyedSubscript:@"pri"];

                  uint64_t v49 = [v45 objectForKeyedSubscript:@"recurringSubscriptionPeriod"];
                  [v47 setObject:v49 forKeyedSubscript:@"per"];

                  uint64_t v50 = [v45 objectForKeyedSubscript:@"numOfPeriods"];
                  [v47 setObject:v50 forKeyedSubscript:@"per-count"];

                  v51 = [v45 objectForKeyedSubscript:@"modeType"];
                  [v47 setObject:v51 forKeyedSubscript:@"mod"];

                  v52 = [v45 objectForKeyedSubscript:@"type"];
                  [v47 setObject:v52 forKeyedSubscript:off_1003994E0[0]];

                  id v53 = [v45 objectForKeyedSubscript:@"id"];
                  [v47 setObject:v53 forKeyedSubscript:off_100399388[0]];

                  [v39 addObject:v47];
                  id v7 = v46;
                }
              }
              id v42 = [v40 countByEnumeratingWithState:&v76 objects:v84 count:16];
            }
            while (v42);
          }

          id v14 = v68;
          if ([v39 count]) {
            [v68 setObject:v39 forKeyedSubscript:@"disc"];
          }
          [v65 addObject:v68];

          id v10 = v66;
          uint64_t v11 = v63;
          int64_t v12 = v72;
          id v26 = v69;
LABEL_37:

          goto LABEL_38;
        }
        if (qword_1003A04F0 != -1) {
          dispatch_once(&qword_1003A04F0, &stru_10035A508);
        }
        int64_t v12 = v72;
        id v36 = (void *)qword_1003A04B8;
        if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v74 = *(void *)(&self->super._finished + 1);
          id v32 = v36;
          uint64_t v37 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v86 = v74;
          __int16 v87 = 2114;
          uint64_t v88 = v37;
          __int16 v89 = 2114;
          uint64_t v90 = 0;
          id v34 = v32;
          int v35 = "[%{public}@] %{public}@: Received invalid locale %{public}@ in product dictionary";
          goto LABEL_23;
        }
      }
      else
      {
        if (qword_1003A04F0 != -1) {
          dispatch_once(&qword_1003A04F0, &stru_10035A508);
        }
        id v31 = (void *)qword_1003A04B8;
        if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v73 = *(void *)(&self->super._finished + 1);
          id v32 = v31;
          uint64_t v33 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v86 = v73;
          __int16 v87 = 2114;
          uint64_t v88 = v33;
          __int16 v89 = 2114;
          uint64_t v90 = 0;
          id v34 = v32;
          int v35 = "[%{public}@] %{public}@: Received invalid identifier %{public}@ in product dictionary";
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x20u);
        }
      }
LABEL_38:

      int64_t v12 = (char *)v12 + 1;
    }
    while (v12 != v10);
    id v57 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
    id v10 = v57;
  }
  while (v57);
LABEL_45:

  id v6 = v61;
  id v5 = v62;
  id v8 = v60;
LABEL_46:

LABEL_54:

  return v65;
}

- (id)_parseMediaProducts:(id)a3
{
  id v4 = a3;
  id v44 = (id)objc_opt_new();
  uint64_t v43 = [(LoadInAppProductsTask *)self _localeIdentifier];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v4;
  id v45 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v45)
  {
    uint64_t v42 = *(void *)v59;
    id v5 = &NSUbiquitousKeyValueStoreChangeReasonKey_ptr;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v58 + 1) + 8 * v6);
        id v8 = objc_opt_new();
        id v9 = objc_msgSend(v7, "tcr_dictionaryForKey:", @"attributes");
        id v10 = objc_msgSend(v9, "tcr_stringForKey:", @"offerName");
        [v8 setObject:v10 forKeyedSubscript:off_100399560[0]];

        uint64_t v11 = objc_msgSend(v9, "tcr_dictionaryForKey:", @"description");
        int64_t v12 = objc_msgSend(v11, "tcr_stringForKey:", @"standard");
        [v8 setObject:v12 forKeyedSubscript:@"desc"];

        id v13 = objc_msgSend(v9, "tcr_stringForKey:", @"name");
        [v8 setObject:v13 forKeyedSubscript:off_1003993D0[0]];

        id v14 = objc_msgSend((id)v5[111], "numberWithBool:", objc_msgSend(v9, "tcr_BOOLForKey:missingValue:", @"isFamilyShareable", 0));
        [v8 setObject:v14 forKeyedSubscript:off_1003993A8[0]];

        uint64_t v15 = objc_msgSend(v9, "tcr_stringForKey:", @"subscriptionFamilyId");
        [v8 setObject:v15 forKeyedSubscript:off_1003994A8[0]];

        double v16 = objc_msgSend(v9, "tcr_dictionaryForKey:", @"hostedContent");
        uint64_t v17 = (uint64_t)v16;
        uint64_t v53 = v6;
        uint64_t v49 = v16;
        uint64_t v50 = v11;
        if (v16)
        {
          int v18 = objc_msgSend(v16, "tcr_stringForKey:", @"version");
          double v19 = objc_msgSend((id)v17, "tcr_numberForKey:", @"size");
          [v8 setObject:v18 forKeyedSubscript:@"hosted-version"];
          [v8 setObject:v19 forKeyedSubscript:@"hosted-content-length"];
          if (v18) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          uint64_t v17 = !v20;
        }
        double v21 = [(id)v5[111] numberWithBool:v17];
        [v8 setObject:v21 forKeyedSubscript:off_1003993B0[0]];

        v51 = v9;
        int v48 = objc_msgSend(v9, "tcr_arrayForKey:", @"offers");
        uint64_t v22 = [v48 firstObject];
        CFStringRef v23 = objc_msgSend(v22, "tcr_stringForKey:", @"recurringSubscriptionPeriod");
        [v8 setObject:v23 forKeyedSubscript:@"per"];

        id v24 = objc_msgSend(v22, "tcr_numberForKey:", @"price");
        [v8 setObject:v24 forKeyedSubscript:@"pri"];

        id v46 = objc_msgSend(v22, "tcr_stringForKey:", @"currencyCode");
        uint64_t v25 = [v43 stringByAppendingFormat:@"@currency=%@", v46];
        v52 = v8;
        [v8 setObject:v25 forKeyedSubscript:@"loc"];

        id v26 = objc_opt_new();
        id v47 = v22;
        uint64_t v27 = objc_msgSend(v22, "tcr_arrayForKey:", @"discounts");
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v28 = [v27 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v55;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v55 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              uint64_t v33 = objc_opt_new();
              id v34 = objc_msgSend(v32, "tcr_numberForKey:", @"price");
              [v33 setObject:v34 forKeyedSubscript:@"pri"];

              int v35 = objc_msgSend(v32, "tcr_stringForKey:", @"recurringSubscriptionPeriod");
              [v33 setObject:v35 forKeyedSubscript:@"per"];

              id v36 = objc_msgSend(v32, "tcr_numberForKey:", @"numOfPeriods");
              [v33 setObject:v36 forKeyedSubscript:@"per-count"];

              uint64_t v37 = objc_msgSend(v32, "tcr_stringForKey:", @"modeType");
              [v33 setObject:v37 forKeyedSubscript:@"mod"];

              id v38 = objc_msgSend(v32, "tcr_stringForKey:", @"type");
              [v33 setObject:v38 forKeyedSubscript:off_1003994E0[0]];

              id v39 = objc_msgSend(v32, "tcr_stringForKey:", @"offerId");
              [v33 setObject:v39 forKeyedSubscript:off_100399388[0]];

              [v26 addObject:v33];
            }
            id v29 = [v27 countByEnumeratingWithState:&v54 objects:v62 count:16];
          }
          while (v29);
        }
        if ([v26 count]) {
          [v52 setObject:v26 forKeyedSubscript:@"disc"];
        }
        [v44 addObject:v52];

        uint64_t v6 = v53 + 1;
        id v5 = &NSUbiquitousKeyValueStoreChangeReasonKey_ptr;
      }
      while ((id)(v53 + 1) != v45);
      id v45 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v45);
  }

  return v44;
}

- (id)_parseLegacyToMedia:(id)a3
{
  id v3 = a3;
  id v4 = [v3 object];
  id v5 = objc_msgSend(v4, "tcr_arrayForKey:", @"available-subproducts");
  if (v5)
  {
    long long v60 = v4;
    id v61 = v3;
    id v64 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v59 = v5;
    id obj = v5;
    id v65 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
    if (v65)
    {
      uint64_t v63 = *(void *)v82;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v82 != v63) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v81 + 1) + 8 * v6);
          unsigned int v8 = objc_msgSend(v7, "tcr_BOOLForKey:", @"isFamilyShareable");
          uint64_t v9 = objc_msgSend(v7, "tcr_stringForKey:", @"subscriptionFamilyId");
          id v10 = (void *)v9;
          unsigned int v67 = v8;
          CFStringRef v11 = @"Consumable";
          if (v8) {
            CFStringRef v11 = @"Non-Consumable";
          }
          if (v9) {
            CFStringRef v12 = @"Auto-Renewable Subscription";
          }
          else {
            CFStringRef v12 = v11;
          }
          id v13 = objc_msgSend(v7, "tcr_dictionaryForKey:", @"store-offers");
          id v14 = objc_msgSend(v13, "tcr_dictionaryForKey:", @"STDQ");
          uint64_t v73 = v13;
          uint64_t v74 = v6;
          if (objc_msgSend(v7, "tcr_BOOLForKey:", @"is-hosted"))
          {
            id v15 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
            double v16 = objc_msgSend(v7, "tcr_stringForKey:", @"version");
            [v15 setObject:v16 forKeyedSubscript:@"version"];

            uint64_t v17 = objc_msgSend(v14, "tcr_numberForKey:", @"size");
            [v15 setObject:v17 forKeyedSubscript:@"size"];
          }
          else
          {
            id v15 = 0;
          }
          v71 = objc_msgSend(v7, "tcr_stringForKey:", @"icu-locale");
          int v18 = [v71 componentsSeparatedByString:@"@currency="];
          double v19 = v18;
          if (v18
            && ([v18 lastObject],
                BOOL v20 = objc_claimAutoreleasedReturnValue(),
                v20,
                v20))
          {
            uint64_t v75 = [v19 lastObject];
          }
          else
          {
            uint64_t v75 = 0;
          }
          double v70 = v19;
          v72 = v14;
          double v21 = objc_msgSend(v7, "tcr_arrayForKey:", @"discounts");
          long long v76 = v10;
          CFStringRef v68 = v12;
          __int16 v69 = v21;
          if (v21)
          {
            uint64_t v22 = v21;
            id v66 = v15;
            id v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v21, "count"));
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id v24 = v22;
            id v25 = [v24 countByEnumeratingWithState:&v77 objects:v88 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v78;
              do
              {
                for (i = 0; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v78 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  id v29 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                  id v30 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v29, "count"));
                  id v31 = objc_msgSend(v29, "tcr_numberForKey:", @"price");
                  [v30 setObject:v31 forKeyedSubscript:@"price"];

                  id v32 = objc_msgSend(v29, "tcr_stringForKey:", @"price-display");
                  [v30 setObject:v32 forKeyedSubscript:@"priceFormatted"];

                  uint64_t v33 = objc_msgSend(v29, "tcr_stringForKey:", @"recurringSubscriptionPeriod");
                  [v30 setObject:v33 forKeyedSubscript:@"recurringSubscriptionPeriod"];

                  id v34 = objc_msgSend(v29, "tcr_numberForKey:", @"numOfPeriods");
                  [v30 setObject:v34 forKeyedSubscript:@"numOfPeriods"];

                  int v35 = objc_msgSend(v29, "tcr_stringForKey:", @"modeType");
                  [v30 setObject:v35 forKeyedSubscript:@"modeType"];

                  id v36 = objc_msgSend(v29, "tcr_stringForKey:", @"type");
                  [v30 setObject:v36 forKeyedSubscript:@"type"];

                  uint64_t v37 = objc_msgSend(v29, "tcr_stringForKey:", @"id");
                  [v30 setObject:v37 forKeyedSubscript:@"offerId"];

                  [v23 addObject:v30];
                }
                id v26 = [v24 countByEnumeratingWithState:&v77 objects:v88 count:16];
              }
              while (v26);
            }

            id v10 = v76;
            id v15 = v66;
          }
          else
          {
            id v23 = 0;
          }
          id v38 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];
          id v39 = objc_msgSend(v7, "tcr_stringForKey:", @"offerName");
          id v40 = v38;
          [v38 setObject:v39 forKeyedSubscript:@"offerName"];

          uint64_t v41 = objc_msgSend(v7, "tcr_stringForKey:", @"description");
          uint64_t v42 = (void *)v41;
          if (v41)
          {
            CFStringRef v86 = @"standard";
            uint64_t v87 = v41;
            uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
            [v40 setObject:v43 forKeyedSubscript:@"description"];
          }
          id v44 = objc_msgSend(v7, "tcr_stringForKey:", @"title");
          [v40 setObject:v44 forKeyedSubscript:@"name"];

          id v45 = +[NSNumber numberWithBool:v67];
          [v40 setObject:v45 forKeyedSubscript:@"isFamilyShareable"];

          [v40 setObject:v10 forKeyedSubscript:@"subscriptionFamilyId"];
          [v40 setObject:v68 forKeyedSubscript:@"kind"];
          [v40 setObject:v15 forKeyedSubscript:@"hostedContent"];
          id v46 = v40;
          id v47 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
          int v48 = objc_msgSend(v7, "tcr_stringForKey:", @"recurringSubscriptionPeriod");
          [v47 setObject:v48 forKeyedSubscript:@"recurringSubscriptionPeriod"];

          uint64_t v49 = v15;
          uint64_t v50 = objc_msgSend(v72, "tcr_numberForKey:", @"price");
          [v47 setObject:v50 forKeyedSubscript:@"price"];

          v51 = objc_msgSend(v72, "tcr_stringForKey:", @"price-display");
          [v47 setObject:v51 forKeyedSubscript:@"priceFormatted"];

          v52 = (void *)v75;
          [v47 setObject:v75 forKeyedSubscript:@"currencyCode"];
          [v47 setObject:v23 forKeyedSubscript:@"discounts"];
          id v85 = v47;
          uint64_t v53 = +[NSArray arrayWithObjects:&v85 count:1];
          [v46 setObject:v53 forKeyedSubscript:@"offers"];

          id v54 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
          objc_msgSend(v7, "tcr_stringForKey:", @"item-id");
          long long v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v55)
          {
            long long v56 = objc_msgSend(v7, "tcr_numberForKey:", @"item-id");
            uint64_t v57 = [v56 stringValue];

            if (v57) {
              long long v55 = (__CFString *)v57;
            }
            else {
              long long v55 = &stru_10036C970;
            }
            v52 = (void *)v75;
          }
          [v54 setObject:v55 forKeyedSubscript:@"id"];
          [v54 setObject:v46 forKeyedSubscript:@"attributes"];
          [v64 addObject:v54];

          uint64_t v6 = v74 + 1;
        }
        while ((id)(v74 + 1) != v65);
        id v65 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      }
      while (v65);
    }

    id v4 = v60;
    id v3 = v61;
    id v5 = v59;
  }
  else
  {
    if (qword_1003A04F0 != -1) {
      dispatch_once(&qword_1003A04F0, &stru_10035A508);
    }
    if (os_log_type_enabled((os_log_t)qword_1003A04B8, OS_LOG_TYPE_ERROR)) {
      sub_1002CA310();
    }
    id v64 = &__NSArray0__struct;
  }

  return v64;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->_logKey + 2);
}

- (NSArray)identifiers
{
  return *(NSArray **)((char *)&self->_client + 2);
}

- (int64_t)identifierKind
{
  return *(int64_t *)((char *)&self->_identifiers + 2);
}

- (int64_t)apiVersion
{
  return *(int64_t *)((char *)&self->_identifierKind + 2);
}

- (NSArray)invalidIdentifiers
{
  return *(NSArray **)((char *)&self->_apiVersion + 2);
}

- (NSArray)products
{
  return *(NSArray **)((char *)&self->_invalidIdentifiers + 2);
}

- (NSString)serverCorrelationIdentifier
{
  return *(NSString **)((char *)&self->_products + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_products + 2), 0);
  objc_storeStrong((id *)((char *)&self->_invalidIdentifiers + 2), 0);
  objc_storeStrong((id *)((char *)&self->_apiVersion + 2), 0);
  objc_storeStrong((id *)((char *)&self->_client + 2), 0);
  objc_storeStrong((id *)((char *)&self->_logKey + 2), 0);

  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end