@interface BiomeHelper
+ (BOOL)donateToBiomeWithRequestIdentifier:(id)a3 withError:(id *)a4;
+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4;
+ (int)_mapRequestStatusToBiomeStatus:(int64_t)a3;
+ (void)donateToBiomeWithRequest:(id)a3;
+ (void)donateToBiomeWithRequests:(id)a3;
@end

@implementation BiomeHelper

+ (void)donateToBiomeWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    v5 = +[APLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [v4 uniqueIdentifier];
    *(_DWORD *)buf = 138543618;
    v38 = v7;
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Donating to Biome Stream - Identifier: %@", buf, 0x16u);
  }
  v10 = [v4 modifiedDate];
  if (v10) {
    [v4 modifiedDate];
  }
  else {
  v11 = [v4 createdDate];
  }
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v36 = +[NSNumber numberWithDouble:v13];
  id v35 = objc_alloc((Class)BMFamilyAskToBuy);
  v34 = [v4 uniqueIdentifier];
  v30 = [v4 requesterDSID];
  v33 = [v4 approverDSID];
  unsigned int v32 = objc_msgSend(a1, "_mapRequestStatusToBiomeStatus:", objc_msgSend(v4, "status"));
  v31 = [v4 itemTitle];
  v29 = [v4 itemDescription];
  v28 = [v4 localizedPrice];
  v27 = [v4 thumbnailURLString];
  v14 = [v4 ageRating];
  v15 = [v4 starRating];
  v16 = [v4 productType];
  v17 = [v4 productURL];
  v18 = [v17 absoluteString];
  id v19 = [v35 initWithRequestID:v34 eventTime:v36 userID:v30 actionUserID:v33 status:v32 itemTitle:v31 itemDescription:v29 itemLocalizedPrice:v28 thumbnailPath:v27 ageRating:v14 starRating:v15 productType:v16 isActionUserDevice:&__kCFBooleanFalse storeLink:v18];

  if (v19)
  {
    v20 = BiomeLibrary();
    v21 = [v20 Family];
    v22 = [v21 AskToBuy];
    v23 = [v22 source];
    [v23 sendEvent:v19];
  }
  else
  {
    v20 = +[APLogConfig sharedDaemonConfig];
    if (!v20)
    {
      v20 = +[APLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_opt_class();
      id v25 = v24;
      v26 = [v4 compile];
      *(_DWORD *)buf = 138543618;
      v38 = v24;
      __int16 v39 = 2112;
      v40 = v26;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@: Biome Event failed to create from Request: %@", buf, 0x16u);
    }
  }
}

+ (void)donateToBiomeWithRequests:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 donateToBiomeWithRequest:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (BOOL)donateToBiomeWithRequestIdentifier:(id)a3 withError:(id *)a4
{
  id v22 = 0;
  id v6 = [a1 _requestInfoForIndentifier:a3 withError:&v22];
  id v7 = v22;
  id v8 = [v6 object];
  objc_opt_class();
  id v9 = 0;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }

  long long v10 = +[APLogConfig sharedDaemonConfig];
  if (!v10)
  {
    long long v10 = +[APLogConfig sharedConfig];
  }
  long long v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = objc_opt_class();
    double v13 = a4;
    id v14 = v12;
    v15 = [v6 object];
    *(_DWORD *)buf = 138543618;
    v24 = v12;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Request Info: %@.", buf, 0x16u);

    a4 = v13;
  }

  v16 = [[ApprovalRequest alloc] initWithCloudPushDictionary:v9];
  [a1 donateToBiomeWithRequest:v16];
  if (v7)
  {
    v17 = +[APLogConfig sharedDaemonConfig];
    if (!v17)
    {
      v17 = +[APLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      __int16 v25 = 2112;
      id v26 = v7;
      id v20 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: Error requesting info for Biome donation - %@", buf, 0x16u);
    }
  }
  if (a4) {
    *a4 = v7;
  }

  return v7 == 0;
}

+ (int)_mapRequestStatusToBiomeStatus:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 3) {
    return a3 + 2;
  }
  else {
    return 0;
  }
}

+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = +[AMSBag sharedBag];
  id v7 = [v6 retrieveRequestURL];

  CFStringRef v33 = @"requestId";
  id v34 = v5;
  id v8 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v9 = objc_alloc_init(URLRequestEncoder);
  long long v10 = [(URLRequestEncoder *)v9 requestWithMethod:4 bagURL:v7 parameters:v8];
  id v30 = 0;
  long long v11 = [v10 resultWithTimeout:&v30 error:60.0];
  id v12 = v30;
  if (v11)
  {
    id v26 = v7;
    v27 = a4;
    id v28 = v5;
    double v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      double v13 = +[APLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      unsigned int v32 = v15;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", buf, 0xCu);
    }
    v17 = +[URLSession sharedSession];
    v18 = [v17 dataTaskPromiseWithRequest:v11];

    id v29 = v12;
    id v19 = [v18 resultWithTimeout:&v29 error:60.0];
    id v20 = v29;

    if (v19)
    {
      v21 = +[APLogConfig sharedDaemonConfig];
      if (!v21)
      {
        v21 = +[APLogConfig sharedConfig];
      }
      id v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        unsigned int v32 = v23;
        id v24 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", buf, 0xCu);
      }
    }

    id v12 = v20;
    a4 = v27;
    id v5 = v28;
    id v7 = v26;
    if (v27) {
      goto LABEL_13;
    }
  }
  else
  {
    id v19 = 0;
    if (a4) {
LABEL_13:
    }
      *a4 = v12;
  }

  return v19;
}

@end