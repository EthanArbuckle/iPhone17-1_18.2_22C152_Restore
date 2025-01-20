void sub_4F9C(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = objc_alloc_init((Class)AMSMutableBagKeySet);
  [v3 addBagKey:@"app-clips-report-problem" valueType:6];
  +[AMSBagKeySet registerBagKeySet:v3 forProfile:@"clipserviced" profileVersion:@"1"];
  v1 = +[AMSBag bagForProfile:@"clipserviced" profileVersion:@"1"];
  v2 = (void *)qword_1A1F8;
  qword_1A1F8 = v1;
}

void sub_5204(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_521C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_522C(uint64_t a1)
{
}

void sub_5234(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_533C;
  block[3] = &unk_145B0;
  block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

void sub_533C(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(void *)(a1 + 32) + 24);

  objc_storeStrong(v3, v2);
}

void sub_5384(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_542C;
  v5[3] = &unk_14600;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

void sub_542C(uint64_t a1)
{
}

uint64_t sub_5438(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void sub_5674(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[NSUserDefaults cps_clipServicesDefaults];
  unsigned int v8 = objc_msgSend(v7, "cps_forceReportProblemErrorNoDeveloperSupportURL");

  if (v8)
  {
    uint64_t v9 = CPSErrorDomain;
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"Unable to obtain developer support URL (forced for testing).";
    id v10 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v11 = +[NSError errorWithDomain:v9 code:1 userInfo:v10];

    id v6 = (id)v11;
  }
  if (v6)
  {
    v12 = sub_8C68();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_CAD0();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v13 = [v5 responseDataItems];
    id v14 = [v13 firstObject];

    v15 = objc_msgSend(v14, "safari_dictionaryForKey:", @"attributes");
    v16 = objc_msgSend(v15, "safari_dictionaryForKey:", @"platformAttributes");
    v17 = objc_msgSend(v16, "safari_dictionaryForKey:", @"ios");

    v18 = objc_msgSend(v17, "safari_stringForKey:", @"supportURLForLanguage");
    v19 = +[NSURL URLWithString:v18];
    v20 = sub_8C68();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "RAP: Obtained developer support URL: %@", (uint8_t *)&v21, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_5A14(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  unsigned int v8 = +[NSUserDefaults cps_clipServicesDefaults];
  unsigned int v9 = objc_msgSend(v8, "cps_forceReportProblemErrorFetchProblemTypes");

  if (v9)
  {
    uint64_t v10 = CPSErrorDomain;
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"Unable to obtain bag values (forced for testing).";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v12 = +[NSError errorWithDomain:v10 code:1 userInfo:v11];

    id v7 = (id)v12;
  }
  id v13 = sub_8C68();
  id v14 = v13;
  if (v7)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_CB38();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v35 = a1;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "RAP: Obtained problem types: %@", buf, 0xCu);
    }
    v34 = v6;
    objc_msgSend(v6, "safari_arrayForKey:", @"types", 0);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "safari_stringForKey:", @"name");
          int v21 = objc_msgSend(v19, "safari_stringForKey:", @"nameUpperCase");
          v22 = objc_msgSend(v19, "safari_stringForKey:", @"label");
          NSErrorUserInfoKey v23 = objc_msgSend(v19, "safari_numberForKey:", @"id");
          id v24 = objc_msgSend(v19, "safari_BOOLForKey:", @"offerDeveloperWebsite");
          if (v20) {
            BOOL v25 = v21 == 0;
          }
          else {
            BOOL v25 = 1;
          }
          if (!v25 && v22 != 0 && v23 != 0)
          {
            v28 = [[CPSReportProblemProblemType alloc] initWithLocalizedTitle:v20 localizedUpperCaseTitle:v21 label:v22 identifier:v23 offerDeveloperWebsite:v24];
            if (v28) {
              [*(id *)(v35 + 32) addObject:v28];
            }
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }
    id v6 = v34;
    v29 = objc_msgSend(v34, "safari_stringForKey:", @"url");
    v30 = +[NSURL URLWithString:v29];
    uint64_t v31 = *(void *)(v35 + 40);
    if (v31)
    {
      id v32 = [*(id *)(v35 + 32) copy];
      (*(void (**)(uint64_t, id, void *, void))(v31 + 16))(v31, v32, v30, 0);
    }
    id v7 = v33;
  }
}

void sub_5ED4(uint64_t a1, void *a2)
{
  id v3 = [a2 lastObject];
  id v4 = [v3 pageURL];

  id v5 = objc_alloc_init((Class)AMSMetricsIdentifier);
  id v6 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.ClipServices.clipserviced"];
  [v5 setClientInfo:v6];

  [v5 setDuration:2592000.0];
  v54[0] = @"contentid";
  id v7 = +[NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 16)];
  unsigned int v8 = [v7 stringValue];
  v54[1] = @"bundleid";
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v55[0] = v8;
  v55[1] = v9;
  v54[2] = @"metricsidentifier";
  v42 = v5;
  uint64_t v10 = [v5 generateIdentifier];
  v55[2] = v10;
  v54[3] = @"invocationurl";
  id v43 = v4;
  uint64_t v11 = [v4 absoluteString];
  uint64_t v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_14D30;
  }
  v55[3] = v13;
  v54[4] = @"concernid";
  id v14 = [*(id *)(a1 + 40) identifier];
  uint64_t v15 = [v14 stringValue];
  id v16 = (void *)v15;
  uint64_t v44 = a1;
  CFStringRef v17 = *(const __CFString **)(a1 + 48);
  if (!v17) {
    CFStringRef v17 = &stru_14D30;
  }
  v55[4] = v15;
  v55[5] = v17;
  v54[5] = @"usernote";
  v54[6] = @"version";
  v55[6] = @"report";
  v18 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:7];

  v19 = sub_8C68();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v18;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "RAP: Asked to submit problem with parameters: %@", buf, 0xCu);
  }
  v20 = +[NSMutableURLRequest requestWithURL:*(void *)(*(void *)(a1 + 32) + 24)];
  [v20 setHTTPMethod:@"POST"];
  [v20 setCachePolicy:0];
  [v20 setTimeoutInterval:10.0];
  v41 = v20;
  [v20 setAllHTTPHeaderFields:&off_157E0];
  int v21 = [v18 allKeys];
  id v22 = [v21 mutableCopy];

  id v23 = objc_alloc_init((Class)NSMutableString);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v24 = v18;
  id v25 = [v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v48;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        [v22 removeObject:v29];
        v30 = [v24 objectForKeyedSubscript:v29];
        uint64_t v31 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        id v32 = [v30 stringByAddingPercentEncodingWithAllowedCharacters:v31];
        [v23 appendFormat:@"%@=%@", v29, v32];

        if ([v22 count]) {
          [v23 appendString:@"&"];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v26);
  }

  v33 = [v23 dataUsingEncoding:4];
  [v41 setHTTPBody:v33];

  id v34 = objc_alloc((Class)AMSURLRequestEncoder);
  uint64_t v35 = [(id)objc_opt_class() sharedAMSBag];
  id v36 = [v34 initWithBag:v35];

  [v36 setAnisetteType:2];
  [v36 setMescalType:0];
  [v36 setIncludeClientVersions:0];
  long long v37 = +[ACAccountStore ams_sharedAccountStore];
  long long v38 = objc_msgSend(v37, "ams_activeiTunesAccount");
  [v36 setAccount:v38];

  long long v39 = [v36 requestByEncodingRequest:v41 parameters:0];
  long long v40 = sub_8C68();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v41;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "RAP: Encoding request: %@", buf, 0xCu);
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_6474;
  v45[3] = &unk_14718;
  id v46 = *(id *)(v44 + 56);
  [v39 addFinishBlock:v45];
}

void sub_6474(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_8C68();
  unsigned int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_CBA0();
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6664;
    block[3] = &unk_146C8;
    id v15 = *(id *)(a1 + 32);
    id v14 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    uint64_t v9 = v15;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "RAP: Submitting encoded request: %@", buf, 0xCu);
    }
    uint64_t v9 = +[AMSURLSession defaultSession];
    uint64_t v10 = [v9 dataTaskPromiseWithRequest:v5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_6684;
    v11[3] = &unk_146F0;
    id v12 = *(id *)(a1 + 32);
    [v10 addFinishBlock:v11];
  }
}

uint64_t sub_6664(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_6684(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[NSUserDefaults cps_clipServicesDefaults];
  unsigned int v8 = objc_msgSend(v7, "cps_forceReportProblemErrorUnableToSubmitResponse");

  if (v8)
  {
    uint64_t v9 = CPSErrorDomain;
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"Unable to submit response (forced for testing).";
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v11 = +[NSError errorWithDomain:v9 code:1 userInfo:v10];

    id v6 = (id)v11;
  }
  id v12 = sub_8C68();
  CFStringRef v13 = v12;
  if (v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_CC08();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [v5 response];
    *(_DWORD *)buf = 138412290;
    id v22 = v15;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "RAP: Submitted request. Result response: %@", buf, 0xCu);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_68A0;
  v18[3] = &unk_146C8;
  id v16 = *(id *)(a1 + 32);
  id v19 = v6;
  id v20 = v16;
  id v17 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
}

uint64_t sub_68A0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_6AB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_6DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_6FEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)ASCLockup);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = ASCLockupKindApp;
  id v7 = objc_alloc((Class)ASCArtwork);
  id v12 = [v7 initWithImage:v3 decoration:ASCArtworkDecorationNone];

  unsigned int v8 = objc_msgSend(*(id *)(a1 + 48), "cps_appClipApplicationRecord");
  uint64_t v9 = [v8 localizedName];
  uint64_t v10 = _CPSLocalizedString();
  id v11 = [v4 initWithID:v5 kind:v6 metrics:0 icon:v12 heading:0 title:v9 subtitle:v10 ageRating:0 offer:0];
  [*(id *)(*(void *)(a1 + 32) + 120) setLockup:v11];
}

Class sub_7330(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1A210)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_745C;
    v3[4] = &unk_147C8;
    v3[5] = v3;
    long long v4 = off_147B0;
    uint64_t v5 = 0;
    qword_1A210 = _sl_dlopen();
  }
  if (!qword_1A210) {
    sub_CD70(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("ISImageDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_CDF0();
  }
  qword_1A208 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_745C()
{
  uint64_t result = _sl_dlopen();
  qword_1A210 = result;
  return result;
}

void sub_7940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_796C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(*(void *)(a1 + 32) + 16) problemTypes];
  [*(id *)(*(void *)(a1 + 32) + 8) setProblemTypes:v4];

  [*(id *)(a1 + 40) stopAnimating];
  if (v3)
  {
    uint64_t v5 = _CPSLocalizedString();
    uint64_t v6 = _CPSLocalizedString();
    id v7 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7AA4;
    v8[3] = &unk_147F0;
    v8[4] = v7;
    [v7 showAlertForError:v3 withTitle:v5 message:v6 completion:v8];
  }
}

uint64_t sub_7AA4(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_7AC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7B70;
    v5[3] = &unk_14818;
    id v6 = v3;
    id v7 = WeakRetained;
    [WeakRetained signInToAppStoreIfNeededWithCompletion:v5];
  }
}

void sub_7B70(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7C24;
  block[3] = &unk_145B0;
  id v7 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_7C24(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    if ([*(id *)(a1 + 40) offerDeveloperWebsite]
      && ([*(id *)(*(void *)(a1 + 48) + 16) developerSupportURL],
          v2 = objc_claimAutoreleasedReturnValue(),
          v2,
          v2))
    {
      id v3 = *(id **)(a1 + 48);
      id v6 = [v3[2] developerSupportURL];
      [v3 showVisitAppSupportForDeveloperURL:v6 problemType:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v4 = *(void **)(a1 + 48);
      [v4 showConcernDetailVCWithProblemType:v5];
    }
  }
}

void sub_7D00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained finishAction];

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = [v4 finishAction];
      v3[2]();

      id WeakRetained = v4;
    }
  }
}

void sub_7ED0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_8C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_CE6C((uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

void sub_80A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_80C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained navigationItem];
  id v7 = [v6 rightBarButtonItem];

  id v8 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v4];
  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = [v9 navigationItem];
  [v10 setRightBarButtonItem:v8];

  [v4 startAnimating];
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(*(void *)(a1 + 32) + 16);
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  int v21 = sub_82BC;
  id v22 = &unk_148B8;
  id v13 = v4;
  id v23 = v13;
  objc_copyWeak(&v26, (id *)(a1 + 48));
  id v14 = v7;
  uint64_t v15 = *(void *)(a1 + 32);
  id v24 = v14;
  uint64_t v25 = v15;
  [v12 submitResponseForProblemType:v11 userNote:v3 completion:&v19];
  id v16 = +[CPSAnalyticsLogger sharedLogger];
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
  v18 = [*(id *)(a1 + 40) label];
  [v16 recordReportProblemStepCompletedWithBundleID:v17 problemLabel:v18 event:5];

  objc_destroyWeak(&v26);
}

void sub_82A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_82BC(uint64_t a1, void *a2)
{
  id v9 = a2;
  [*(id *)(a1 + 32) stopAnimating];
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained navigationItem];
  [v5 setRightBarButtonItem:v3];

  if (v9)
  {
    id v6 = _CPSLocalizedString();
    [*(id *)(a1 + 48) showAlertForError:v9 withTitle:v6 message:0 completion:0];
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }

  return _objc_release_x1();
}

void sub_8518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8538(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 2) submitResponseForProblemType:*(void *)(a1 + 32) userNote:0 completion:0];
    if (a2)
    {
      id v6 = +[CPSAnalyticsLogger sharedLogger];
      uint64_t v7 = v5[3];
      id v8 = [*(id *)(a1 + 32) label];
      [v6 recordReportProblemStepCompletedWithBundleID:v7 problemLabel:v8 event:3];

      id v9 = +[UIApplication sharedApplication];
      uint64_t v10 = *(void *)(a1 + 40);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_8688;
      v12[3] = &unk_14908;
      v12[4] = v5;
      [v9 openURL:v10 options:&__NSDictionary0__struct completionHandler:v12];
    }
    else
    {
      uint64_t v11 = v5[4];
      if (v11) {
        (*(void (**)(void))(v11 + 16))();
      }
    }
  }
}

uint64_t sub_8688(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_87E4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_8C68()
{
  if (qword_1A220 != -1) {
    dispatch_once(&qword_1A220, &stru_14978);
  }
  return qword_1A218;
}

void sub_8CAC(id a1)
{
  qword_1A218 = (uint64_t)os_log_create("com.apple.ClipServices.settings", "ClipServicesSettings");

  _objc_release_x1();
}

uint64_t sub_92F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9300(uint64_t a1)
{
}

void sub_9308(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__specifier), "cps_isAppClipInstalled") & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "_popAndShowAllAppClips"); {
  v2 = +[NSNotificationCenter defaultCenter];
  }
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_94A0(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    block[7] = v2;
    block[8] = v3;
    id v5 = +[CPSAnalyticsLogger sharedLogger];
    [v5 didManuallyDeleteClip:*(void *)(a1 + 32) withEvent:1];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9554;
    block[3] = &unk_147F0;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_9554(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popAndShowAllAppClips];
}

id sub_9704(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_9F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_9F38(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"ClipServicesSettings"];

  return v3;
}

Class sub_A060(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1A230)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_A18C;
    v3[4] = &unk_147C8;
    v3[5] = v3;
    long long v4 = off_149C0;
    uint64_t v5 = 0;
    qword_1A230 = _sl_dlopen();
  }
  if (!qword_1A230) {
    sub_CEE4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("OBTextWelcomeController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_CF64();
  }
  qword_1A228 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_A18C()
{
  uint64_t result = _sl_dlopen();
  qword_1A230 = result;
  return result;
}

uint64_t sub_AB54(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    long long v4 = [v3 bundleIdentifier];
    if ([*(id *)(a1 + 32) _isDimSumApp:v4])
    {
      id v5 = [objc_alloc((Class)PSThirdPartyApp) initWithApplicationProxy:v3];
      [v5 load];
      [*(id *)(a1 + 40) addObject:v5];
    }
  }

  return _objc_release_x1();
}

id sub_B0A0(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _didClearAllAppClips];
}

void sub_B378(id *a1)
{
  if (!objc_msgSend(a1[4], "numberOfRowsInSection:", objc_msgSend(a1[5], "section")))
  {
    uint64_t v2 = [a1[6] specifiers];
    id v3 = [v2 specifierForID:@"CLEAR_CLIP_HISTORY"];

    [v3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    [a1[6] reloadSpecifier:v3];
  }
}

void sub_B608(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v6), "bundleIdentifier", (void)v9);
        [v7 reloadSpecifierID:v8];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_CAD0()
{
  sub_6ACC();
  sub_6AB0(&dword_0, v0, v1, "RAP: Error obtaining developer support URL: %@", v2, v3, v4, v5, v6);
}

void sub_CB38()
{
  sub_6ACC();
  sub_6AB0(&dword_0, v0, v1, "RAP: Error obtaining problem types; %@", v2, v3, v4, v5, v6);
}

void sub_CBA0()
{
  sub_6ACC();
  sub_6AB0(&dword_0, v0, v1, "RAP: Error encoding request: %@", v2, v3, v4, v5, v6);
}

void sub_CC08()
{
  sub_6ACC();
  sub_6AB0(&dword_0, v0, v1, "RAP: Error submitting request: %@", v2, v3, v4, v5, v6);
}

void sub_CC70(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to initialize a CPSClipStoreTableViewCell without a valid bundle identifier", v1, 2u);
}

void sub_CCB4(uint64_t a1, NSObject *a2)
{
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "The app clip %{sensitive}@ does not have a store item identifier and is not a TestFight app", (uint8_t *)&v2, 0xCu);
}

void sub_CD2C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to refresh the App Store cell without a valid bundle identifier", v1, 2u);
}

void sub_CD70(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *IconServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CPSClipStoreTableViewCell.m", 14, @"%s", *a1);

  __break(1u);
}

void sub_CDF0()
{
  v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getISImageDescriptorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSClipStoreTableViewCell.m", 15, @"Unable to find class %s", "ISImageDescriptor");

  __break(1u);
}

void sub_CE6C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "RAP: Unable to sign in to app store: %@", (uint8_t *)&v2, 0xCu);
}

void sub_CEE4(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *OnBoardingKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CPSAboutViewController.m", 10, @"%s", *a1);

  __break(1u);
}

void sub_CF64()
{
  v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getOBTextWelcomeControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSAboutViewController.m", 11, @"Unable to find class %s", "OBTextWelcomeController");

  __break(1u);
}

void sub_CFE0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  uint8_t v6 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v7 = 138740227;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  long long v10 = v6;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Unable to obtain the application record for %{sensitive}@ with error %{public}@", (uint8_t *)&v7, 0x16u);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CPSLocalizedString()
{
  return __CPSLocalizedString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend__allDimSumApps(void *a1, const char *a2, ...)
{
  return [a1 _allDimSumApps];
}

id objc_msgSend__popAndShowAllAppClips(void *a1, const char *a2, ...)
{
  return [a1 _popAndShowAllAppClips];
}

id objc_msgSend__specifiersForDimSumAppsIfExists(void *a1, const char *a2, ...)
{
  return [a1 _specifiersForDimSumAppsIfExists];
}

id objc_msgSend__willClearAllAppClips(void *a1, const char *a2, ...)
{
  return [a1 _willClearAllAppClips];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return [a1 appClipMetadata];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 contentLayoutGuide];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correspondingApplicationRecord(void *a1, const char *a2, ...)
{
  return [a1 correspondingApplicationRecord];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_customerInput(void *a1, const char *a2, ...)
{
  return [a1 customerInput];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultSession(void *a1, const char *a2, ...)
{
  return [a1 defaultSession];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_developerSupportURL(void *a1, const char *a2, ...)
{
  return [a1 developerSupportURL];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_finishAction(void *a1, const char *a2, ...)
{
  return [a1 finishAction];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 frameLayoutGuide];
}

id objc_msgSend_generateIdentifier(void *a1, const char *a2, ...)
{
  return [a1 generateIdentifier];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return [a1 isBeta];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return [a1 isSupported];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return [a1 itemName];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localizedDeviceName(void *a1, const char *a2, ...)
{
  return [a1 localizedDeviceName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_offerDeveloperWebsite(void *a1, const char *a2, ...)
{
  return [a1 offerDeveloperWebsite];
}

id objc_msgSend_pageURL(void *a1, const char *a2, ...)
{
  return [a1 pageURL];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return [a1 performAuthentication];
}

id objc_msgSend_preferredImageDescriptor(void *a1, const char *a2, ...)
{
  return [a1 preferredImageDescriptor];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_problemTypes(void *a1, const char *a2, ...)
{
  return [a1 problemTypes];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseDataItems(void *a1, const char *a2, ...)
{
  return [a1 responseDataItems];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_setUpConcernsViewController(void *a1, const char *a2, ...)
{
  return [a1 setUpConcernsViewController];
}

id objc_msgSend_setupContentStackView(void *a1, const char *a2, ...)
{
  return [a1 setupContentStackView];
}

id objc_msgSend_sharedAMSBag(void *a1, const char *a2, ...)
{
  return [a1 sharedAMSBag];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeItemIdentifier];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemMidGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemMidGrayColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textController(void *a1, const char *a2, ...)
{
  return [a1 textController];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}