@interface CTAppStoreSearch
+ (NSCache)resultByBundleID;
- (CTAppStoreSearch)initWithCallingProcess:(id)a3;
- (void)handleSearchResultsWithTaskData:(id)a3 platform:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)lookupAppWithBundleIDs:(id)a3 deviceFamily:(unint64_t)a4 completionHandler:(id)a5;
- (void)performiTunesQueryWithURLComponents:(id)a3 queryItems:(id)a4 deviceFamily:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation CTAppStoreSearch

- (CTAppStoreSearch)initWithCallingProcess:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTAppStoreSearch;
  v6 = [(CTAppStoreSearch *)&v10 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.ctcategories.service", "appstorelookup");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_callingProcessBundleID, a3);
  }

  return v6;
}

+ (NSCache)resultByBundleID
{
  if (qword_100010FA0 != -1) {
    dispatch_once(&qword_100010FA0, &stru_10000C598);
  }
  v2 = (void *)qword_100010F98;
  return (NSCache *)v2;
}

- (void)lookupAppWithBundleIDs:(id)a3 deviceFamily:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v37 = a5;
  v39 = objc_opt_new();
  v8 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v38 = v7;
  v9 = [v7 componentsSeparatedByString:@","];
  id v10 = [v9 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v15 = [(id)objc_opt_class() resultByBundleID];
        v16 = [v15 objectForKey:v14];

        if (v16)
        {
          v17 = [v16 platform];
          v18 = [v8 objectForKeyedSubscript:v17];
          v19 = v18;
          if (v18) {
            id v20 = v18;
          }
          else {
            id v20 = (id)objc_opt_new();
          }
          v21 = v20;

          [v21 addObject:v16];
          [v8 setObject:v21 forKeyedSubscript:v17];
        }
        else
        {
          [v39 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v11);
  }

  id v22 = [v39 count];
  BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v23)
    {
      callingProcessBundleID = self->_callingProcessBundleID;
      *(_DWORD *)buf = 138543618;
      v51 = callingProcessBundleID;
      __int16 v52 = 2114;
      v53 = v39;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Performing iTunes lookup on behalf of %{public}@: %{public}@", buf, 0x16u);
    }
    id v25 = [objc_alloc((Class)NSURLComponents) initWithString:@"https://itunes.apple.com/lookup"];
    id v26 = objc_alloc((Class)NSURLQueryItem);
    v27 = [v39 componentsJoinedByString:@","];
    id v28 = [v26 initWithName:@"bundleId" value:v27];

    id v29 = objc_alloc((Class)NSURLQueryItem);
    v30 = +[NSLocale currentLocale];
    v31 = [v30 countryCode];
    id v32 = [v29 initWithName:@"country" value:v31];

    v49[0] = v28;
    v49[1] = v32;
    v33 = +[NSArray arrayWithObjects:v49 count:2];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100007E0C;
    v40[3] = &unk_10000C638;
    id v41 = v39;
    id v42 = v8;
    v43 = self;
    v34 = v37;
    id v44 = v37;
    [(CTAppStoreSearch *)self performiTunesQueryWithURLComponents:v25 queryItems:v33 deviceFamily:a4 completionHandler:v40];

    v35 = v38;
  }
  else
  {
    v35 = v38;
    if (v23)
    {
      *(_DWORD *)buf = 138543362;
      v51 = (NSString *)v38;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not performing iTunes lookup for cached bundle IDs: %{public}@", buf, 0xCu);
    }
    v34 = v37;
    (*((void (**)(id, void *, void))v37 + 2))(v37, v8, 0);
  }
}

- (void)performiTunesQueryWithURLComponents:(id)a3 queryItems:(id)a4 deviceFamily:(unint64_t)a5 completionHandler:(id)a6
{
  char v7 = a5;
  id v40 = a3;
  id v36 = a4;
  id v35 = a6;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_100008BBC;
  v62[4] = sub_100008BCC;
  id v63 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_100008BBC;
  v56 = sub_100008BCC;
  id v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_100008BBC;
  v50[4] = sub_100008BCC;
  id v51 = 0;
  if ((v7 & 6) != 0)
  {
    if ((v7 & 6) == 6)
    {
      v39 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@,%@", @"software", @"iPadSoftware"];
    }
    else
    {
      CFStringRef v10 = @"software";
      if ((v7 & 2) == 0) {
        CFStringRef v10 = @"iPadSoftware";
      }
      v39 = (__CFString *)v10;
    }
    id v11 = &off_10000C588;
  }
  else if (v7)
  {
    v39 = @"macSoftware";
    id v11 = &off_10000C580;
  }
  else
  {
    if ((v7 & 8) == 0)
    {
      v39 = 0;
      goto LABEL_14;
    }
    v39 = @"tvSoftware";
    id v11 = &off_10000C590;
  }
  uint64_t v12 = v53;
  v13 = *v11;
  uint64_t v14 = (void *)v12[5];
  v12[5] = (uint64_t)v13;

LABEL_14:
  id v38 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"entity" value:v39];
  id v37 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"media" value:@"software"];
  v69[0] = v38;
  v69[1] = v37;
  v15 = +[NSArray arrayWithObjects:v69 count:2];
  v16 = [v36 arrayByAddingObjectsFromArray:v15];
  [v40 setQueryItems:v16];

  v17 = [v40 URL];
  id v18 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v17];
  v19 = +[NSBundle mainBundle];
  id v20 = [v19 bundleIdentifier];

  v21 = MGCopyAnswer();
  id v22 = MGCopyAnswer();
  id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@/%@/%@", v20, self->_callingProcessBundleID, v21, v22];
  [v18 setValue:v23 forHTTPHeaderField:@"User-Agent"];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "START: %{private}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v65 = 0x3032000000;
  v66 = sub_100008BBC;
  v67 = sub_100008BCC;
  id v25 = self;
  v68 = v25;
  id v26 = +[NSURLSession sharedSession];
  callingProcessBundleID = self->_callingProcessBundleID;
  id v28 = [v26 configuration];
  objc_msgSend(v28, "set_sourceApplicationBundleIdentifier:", callingProcessBundleID);

  id v29 = [v26 configuration];
  [v29 setTimeoutIntervalForResource:10.0];

  v30 = [v26 configuration];
  [v30 setTimeoutIntervalForRequest:10.0];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100008BD4;
  v41[3] = &unk_10000C660;
  id v31 = v17;
  long long v45 = v62;
  p_long long buf = &buf;
  long long v47 = v50;
  long long v48 = &v58;
  id v42 = v31;
  v43 = v25;
  v49 = &v52;
  id v32 = v35;
  id v44 = v32;
  v33 = [v26 dataTaskWithRequest:v18 completionHandler:v41];
  ++v59[3];

  _Block_object_dispose(&buf, 8);
  if (v33) {
    [v33 resume];
  }
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v62, 8);
}

- (void)handleSearchResultsWithTaskData:(id)a3 platform:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id, id))a6;
  if (!v10)
  {
    if (v12)
    {
      id v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v12, v11, 0);
      v17 = 0;
    }
    else
    {
      v17 = 0;
      id v19 = 0;
    }
    id v18 = 0;
    goto LABEL_12;
  }
  id v21 = 0;
  v15 = +[CTAppStoreSearchResult appStoreSearchResultsWithResultData:v10 platform:v11 error:&v21];
  id v16 = v21;
  v17 = v16;
  if (!v15)
  {
    id v18 = 0;
    if (v16) {
      goto LABEL_4;
    }
LABEL_8:
    id v19 = 0;
    goto LABEL_9;
  }
  id v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v15, v11, 0);
  if (!v17) {
    goto LABEL_8;
  }
LABEL_4:
  id v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v17, v11, 0);
LABEL_9:

LABEL_12:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v23 = v18;
    __int16 v24 = 2112;
    id v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "appsByPlatform: %@ errorByPlatform: %@", buf, 0x16u);
  }
  v13[2](v13, v18, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callingProcessBundleID, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end