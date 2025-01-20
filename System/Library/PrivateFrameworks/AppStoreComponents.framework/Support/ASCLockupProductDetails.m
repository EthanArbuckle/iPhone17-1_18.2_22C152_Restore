@interface ASCLockupProductDetails
+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6;
+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5;
+ (id)queryParametersForLockup:(id)a3;
- (ASCLockup)lockup;
- (ASCLockupProductDetails)initWithLockup:(id)a3;
- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5;
- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6;
- (ASCLockupProductDetailsObserver)observer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpenAppCallbackEnabled;
- (BOOL)isWebBrowser;
- (NSDictionary)parameters;
- (NSString)storeSheetHostBundleID;
- (NSString)storeSheetUsageContext;
- (id)description;
- (unint64_t)hash;
- (void)present:(id)a3;
- (void)setObserver:(id)a3;
- (void)setOpenAppCallbackEnabled:(BOOL)a3;
- (void)setWebBrowser:(BOOL)a3;
@end

@implementation ASCLockupProductDetails

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 withOfferFlags:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  sub_10000F3C4();
  v10 = [a1 URLForLockupID:v9 ofKind:v8 offerFlags:a5 queryParameters:0];

  return v10;
}

+ (id)URLForLockupID:(id)a3 ofKind:(id)a4 offerFlags:(int64_t)a5 queryParameters:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  sub_10000F3C4();
  v11 = [v8 stringValue];
  v12 = +[NSCharacterSet URLPathAllowedCharacterSet];
  v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];
  id v14 = objc_alloc_init((Class)NSURLComponents);
  [v14 setScheme:@"itms-apps"];
  if (![v9 isEqualToString:@"app"]) {
    sub_1000240F4(@"ASCLockupKind", v9);
  }
  [v14 setPercentEncodedHost:@"apps.apple.com"];
  v24[0] = @"/";
  v24[1] = @"app";
  v15 = [@"id" stringByAppendingString:v13];
  v24[2] = v15;
  v16 = +[NSArray arrayWithObjects:v24 count:3];
  v17 = +[NSString pathWithComponents:v16];
  [v14 setPercentEncodedPath:v17];

  if (v10)
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100018E80;
    v22[3] = &unk_100183EF8;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v23;
    [v10 enumerateKeysAndObjectsUsingBlock:v22];
    [v14 setQueryItems:v18];
  }
  uint64_t v19 = [v14 URL];
  if (!v19) {
    objc_exception_throw([objc_alloc((Class)NSException) initWithName:NSInvalidArgumentException, objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Lockup id %@ of kind %@ is invalid", v8, v9), 0 reason userInfo]);
  }
  v20 = (void *)v19;

  return v20;
}

+ (id)queryParametersForLockup:(id)a3
{
  id v3 = a3;
  sub_10000F3C4();
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 productVariantID];

  if (v5)
  {
    v6 = [v3 productVariantID];
    [v4 setObject:v6 forKeyedSubscript:@"ppid"];
  }
  v7 = [v3 offer];
  unsigned __int16 v8 = (unsigned __int16)[v7 flags];

  if ((v8 & 0x200) != 0) {
    [v4 setObject:@"1" forKeyedSubscript:@"isViewOnly"];
  }
  if ([v4 count]) {
    id v9 = [v4 copy];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (ASCLockupProductDetails)initWithLockup:(id)a3
{
  return [(ASCLockupProductDetails *)self initWithLockup:a3 storeSheetHostBundleID:0 storeSheetUsageContext:0 parameters:0];
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5
{
  return [(ASCLockupProductDetails *)self initWithLockup:a3 storeSheetHostBundleID:a4 storeSheetUsageContext:a5 parameters:0];
}

- (ASCLockupProductDetails)initWithLockup:(id)a3 storeSheetHostBundleID:(id)a4 storeSheetUsageContext:(id)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  sub_10000F3C4();
  v24.receiver = self;
  v24.super_class = (Class)ASCLockupProductDetails;
  id v14 = [(ASCLockupProductDetails *)&v24 init];
  if (v14)
  {
    v15 = (ASCLockup *)[v10 copy];
    lockup = v14->_lockup;
    v14->_lockup = v15;

    v17 = (NSString *)[v11 copy];
    storeSheetHostBundleID = v14->_storeSheetHostBundleID;
    v14->_storeSheetHostBundleID = v17;

    uint64_t v19 = (NSString *)[v12 copy];
    storeSheetUsageContext = v14->_storeSheetUsageContext;
    v14->_storeSheetUsageContext = v19;

    v21 = (NSDictionary *)[v13 copy];
    parameters = v14->_parameters;
    v14->_parameters = v21;
  }
  return v14;
}

- (void)present:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = [(ASCLockupProductDetails *)self lockup];
  v6 = [v5 id];
  v7 = +[ASCAdamID invalidAdamID];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v9 = [(ASCLockupProductDetails *)self lockup];
      id v10 = [v9 id];
      *(_DWORD *)buf = 138543362;
      v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Not presenting product details for lockup %{public}@ because ID is invalid.", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    id v11 = [(ASCLockupProductDetails *)self lockup];
    id v12 = +[ASCLockupProductDetails queryParametersForLockup:v11];

    id v13 = [(ASCLockupProductDetails *)self parameters];

    if (v13)
    {
      id v14 = [(ASCLockupProductDetails *)self parameters];
      id v15 = [v14 mutableCopy];

      if (v12) {
        [v15 addEntriesFromDictionary:v12];
      }
    }
    else
    {
      id v15 = [v12 mutableCopy];
    }
    v27 = v12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v16 = [(ASCLockupProductDetails *)self lockup];
      v17 = [v16 id];
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Presenting product details for lockup %{public}@", buf, 0xCu);
    }
    id v18 = [(ASCLockupProductDetails *)self lockup];
    uint64_t v19 = [v18 id];
    v20 = [(ASCLockupProductDetails *)self lockup];
    v21 = [v20 kind];
    v22 = [(ASCLockupProductDetails *)self lockup];
    id v23 = [v22 offer];
    objc_super v24 = +[ASCLockupProductDetails URLForLockupID:ofKind:offerFlags:queryParameters:](ASCLockupProductDetails, "URLForLockupID:ofKind:offerFlags:queryParameters:", v19, v21, [v23 flags], v15);

    v25 = +[ASCWorkspace sharedWorkspace];
    v26 = [v25 openURL:v24];

    if (v4)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100019478;
      v29[3] = &unk_100184160;
      v30 = v4;
      [v26 addFinishBlock:v29];
    }
  }
}

- (unint64_t)hash
{
  v2 = [(ASCLockupProductDetails *)self lockup];
  id v3 = (char *)[v2 hash] + 2;

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  id v4 = self;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = [(ASCLockupProductDetails *)v4 lockup];
    uint64_t v8 = [(ASCLockupProductDetails *)v6 lockup];
    id v9 = (void *)v8;
    if (v7 && v8) {
      unsigned __int8 v10 = [v7 isEqual:v8];
    }
    else {
      unsigned __int8 v10 = v7 == (void *)v8;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupProductDetails *)self lockup];
  [(ASCDescriber *)v3 addObject:v4 withName:@"lockup"];

  v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (ASCLockupProductDetailsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (ASCLockupProductDetailsObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)isOpenAppCallbackEnabled
{
  return self->_openAppCallbackEnabled;
}

- (void)setOpenAppCallbackEnabled:(BOOL)a3
{
  self->_openAppCallbackEnabled = a3;
}

- (BOOL)isWebBrowser
{
  return self->_webBrowser;
}

- (void)setWebBrowser:(BOOL)a3
{
  self->_webBrowser = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);

  objc_storeStrong((id *)&self->_lockup, 0);
}

@end