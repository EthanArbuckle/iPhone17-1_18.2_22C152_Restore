@interface ASCAppLaunchTrampoline
+ (OS_os_log)log;
- (ASCAppLaunchTrampoline)init;
- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3;
- (ASCAppLaunchTrampolineWorkspace)workspace;
- (id)handleURL:(id)a3;
- (id)handleURL:(id)a3 workspace:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5;
- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6;
@end

@implementation ASCAppLaunchTrampoline

+ (OS_os_log)log
{
  if (qword_1001A6000 != -1) {
    dispatch_once(&qword_1001A6000, &stru_100183DD8);
  }
  v2 = (void *)qword_1001A6008;

  return (OS_os_log *)v2;
}

- (ASCAppLaunchTrampoline)init
{
  v3 = +[ASCWorkspace sharedWorkspace];
  v4 = [(ASCAppLaunchTrampoline *)self initWithWorkspace:v3];

  return v4;
}

- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3
{
  id v5 = a3;
  sub_10000F3C4();
  v9.receiver = self;
  v9.super_class = (Class)ASCAppLaunchTrampoline;
  v6 = [(ASCAppLaunchTrampoline *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workspace, a3);
  }

  return v7;
}

- (id)handleURL:(id)a3
{
  return [(ASCAppLaunchTrampoline *)self handleURL:a3 workspace:self->_workspace];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return [(ASCAppLaunchTrampoline *)self openApplicationWithBundleIdentifier:a3 payloadURL:a4 workspace:self->_workspace];
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  return [(ASCAppLaunchTrampoline *)self openApplicationWithBundleIdentifier:a3 payloadURL:a4 universalLinkRequired:a5 workspace:self->_workspace];
}

- (id)handleURL:(id)a3 workspace:(id)a4
{
  id v6 = a3;
  id v66 = a4;
  id v7 = objc_alloc_init((Class)AMSMutablePromise);
  id v8 = [objc_alloc((Class)NSURLComponents) initWithURL:v6 resolvingAgainstBaseURL:1];
  v65 = v8;
  if (!v8
    || (objc_super v9 = v8,
        [v8 queryItems],
        v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 count],
        v10,
        !v11))
  {
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    CFStringRef v92 = @"Failed while parsing input URL, URL components was nil or empty.";
    v52 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    uint64_t v53 = 0;
LABEL_47:
    id v18 = +[NSError errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:v53 userInfo:v52];

    [v7 finishWithError:v18];
    id v54 = v7;
    goto LABEL_48;
  }
  v64 = self;
  v12 = [v6 host];
  v13 = [v12 lowercaseString];
  unsigned __int8 v14 = [v13 isEqualToString:@"launchapp"];

  if ((v14 & 1) == 0)
  {
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    CFStringRef v90 = @"Received URL unsuitable for app launch trampoline.";
    v52 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    uint64_t v53 = 1;
    goto LABEL_47;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v15 = [v9 queryItems];
  id v16 = [v15 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (!v16)
  {

    id v18 = 0;
    id v67 = 0;
    id v68 = 0;
    id v69 = 0;
    id v70 = 0;
    v71 = 0;
LABEL_52:
    NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
    CFStringRef v87 = @"Missing required parameters for app launch.";
    v56 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v49 = +[NSError errorWithDomain:@"ASCAppLaunchTrampolineErrorDomain" code:2 userInfo:v56];

    [v7 finishWithError:v49];
    id v57 = v7;
    goto LABEL_56;
  }
  id v17 = v16;
  v63 = v7;
  id v70 = 0;
  v71 = 0;
  id v68 = 0;
  id v69 = 0;
  id v67 = 0;
  id v18 = 0;
  uint64_t v19 = *(void *)v83;
  do
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v83 != v19) {
        objc_enumerationMutation(v15);
      }
      v21 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      v22 = [v21 name];
      v23 = [v22 lowercaseString];
      if ([v23 isEqualToString:@"appid"])
      {
        v24 = [v21 value];

        if (v24)
        {
          id v25 = v21;

          id v18 = v25;
          continue;
        }
      }
      else
      {
      }
      v26 = [v21 name];
      v27 = [v26 lowercaseString];
      if ([v27 isEqualToString:@"bundleid"])
      {
        v28 = [v21 value];

        if (v28)
        {
          id v29 = v21;

          v71 = v29;
          continue;
        }
      }
      else
      {
      }
      v30 = [v21 name];
      v31 = [v30 lowercaseString];
      if ([v31 isEqualToString:@"deeplink"])
      {
        v32 = [v21 value];

        if (v32)
        {
          id v33 = v21;

          id v70 = v33;
          continue;
        }
      }
      else
      {
      }
      v34 = [v21 name];
      v35 = [v34 lowercaseString];
      if ([v35 isEqualToString:@"eventid"])
      {
        v36 = [v21 value];

        if (v36)
        {
          id v37 = v21;

          id v68 = v37;
          continue;
        }
      }
      else
      {
      }
      v38 = [v21 name];
      v39 = [v38 lowercaseString];
      if ([v39 isEqualToString:@"trampolinemetrics"])
      {
        v40 = [v21 value];

        if (v40)
        {
          id v41 = v21;

          id v69 = v41;
          continue;
        }
      }
      else
      {
      }
      v42 = [v21 name];
      v43 = [v42 lowercaseString];
      if ([v43 isEqualToString:@"sourceapplication"])
      {
        v44 = [v21 value];

        if (v44)
        {
          id v45 = v21;

          id v67 = v45;
          continue;
        }
      }
      else
      {
      }
      v46 = [v21 name];
      v47 = [v46 lowercaseString];
      if ([v47 isEqualToString:@"metrics"])
      {
        v48 = [v21 value];

        if (v48 && !v69) {
          id v69 = v21;
        }
      }
      else
      {
      }
    }
    id v17 = [v15 countByEnumeratingWithState:&v82 objects:v88 count:16];
  }
  while (v17);

  id v7 = v63;
  if (!v18 || !v71) {
    goto LABEL_52;
  }
  v49 = [v70 value];

  if (v49)
  {
    v50 = [v70 value];
    v51 = [v50 stringByRemovingPercentEncoding];

    if (v51)
    {
      v49 = +[NSURL URLWithString:v51];
    }
    else
    {
      v49 = 0;
    }
  }
  v58 = [v71 value];
  v59 = [v66 openApplicationWithBundleIdentifier:v58 payloadURL:v49];

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100007FA4;
  v80[3] = &unk_100183E00;
  id v60 = v63;
  id v81 = v60;
  [v59 addSuccessBlock:v80];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100008004;
  v72[3] = &unk_100183E50;
  v72[4] = v64;
  id v18 = v18;
  id v73 = v18;
  id v70 = v70;
  id v74 = v70;
  id v68 = v68;
  id v75 = v68;
  id v69 = v69;
  id v76 = v69;
  id v67 = v67;
  id v77 = v67;
  id v61 = v60;
  id v78 = v61;
  id v79 = v66;
  [v59 addErrorBlock:v72];
  id v62 = v61;

LABEL_56:
LABEL_48:

  return v7;
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)AMSMutablePromise);
  id v11 = [v7 openApplicationWithBundleIdentifier:v9 payloadURL:v8];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100008518;
  v19[3] = &unk_100183E00;
  id v12 = v10;
  id v20 = v12;
  [v11 addSuccessBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008578;
  v17[3] = &unk_100183E78;
  id v13 = v12;
  id v18 = v13;
  [v11 addErrorBlock:v17];
  unsigned __int8 v14 = v18;
  id v15 = v13;

  return v15;
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)AMSMutablePromise);
  id v13 = [v9 openApplicationWithBundleIdentifier:v11 payloadURL:v10 universalLinkRequired:v6];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000087C4;
  v21[3] = &unk_100183E00;
  id v14 = v12;
  id v22 = v14;
  [v13 addSuccessBlock:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100008824;
  v19[3] = &unk_100183E78;
  id v15 = v14;
  id v20 = v15;
  [v13 addErrorBlock:v19];
  id v16 = v20;
  id v17 = v15;

  return v17;
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4
{
  return [(ASCAppLaunchTrampoline *)self productPageURLForAdamId:a3 eventId:a4 encodedMetrics:0];
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5
{
  return [(ASCAppLaunchTrampoline *)self productPageURLForAdamId:a3 eventId:a4 encodedMetrics:a5 sourceApplication:0];
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6
{
  return [(ASCAppLaunchTrampoline *)self productPageURLForAdamId:a3 deeplink:0 eventId:a4 encodedMetrics:a5 sourceApplication:a6];
}

- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [[ASCAdamID alloc] initWithStringValue:v15];

  id v17 = +[ASCLockupProductDetails URLForLockupID:v16 ofKind:@"app" withOfferFlags:0];
  if (v17 && (v11 || v12 || v13))
  {
    id v18 = [objc_alloc((Class)NSURLComponents) initWithURL:v17 resolvingAgainstBaseURL:0];
    uint64_t v19 = [v18 queryItems];
    id v20 = [v19 mutableCopy];

    if (!v20) {
      id v20 = objc_alloc_init((Class)NSMutableArray);
    }
    if (v11)
    {
      id v21 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"deeplink" value:v11];
      [v20 addObject:v21];
    }
    if (v12)
    {
      id v22 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"eventid" value:v12];
      [v20 addObject:v22];
    }
    if (v13)
    {
      id v23 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"trampolineMetrics" value:v13];
      [v20 addObject:v23];
    }
    if (v14)
    {
      id v24 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"sourceApplication" value:v14];
      [v20 addObject:v24];
    }
    [v18 setQueryItems:v20];
    uint64_t v25 = [v18 URL];

    id v17 = (void *)v25;
  }

  return v17;
}

- (ASCAppLaunchTrampolineWorkspace)workspace
{
  return self->_workspace;
}

- (void).cxx_destruct
{
}

@end