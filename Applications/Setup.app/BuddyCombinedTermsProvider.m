@interface BuddyCombinedTermsProvider
- (BuddyCombinedTermsProvider)init;
- (NSData)cachedTermsData;
- (OS_dispatch_queue)termsQueue;
- (OS_dispatch_queue)termsRequestQueue;
- (void)fetchTerms:(id)a3;
- (void)fetchTermsFromServer:(id)a3;
- (void)prefetchTerms;
- (void)setCachedTermsData:(id)a3;
- (void)setTermsQueue:(id)a3;
- (void)setTermsRequestQueue:(id)a3;
@end

@implementation BuddyCombinedTermsProvider

- (BuddyCombinedTermsProvider)init
{
  SEL v9 = a2;
  id location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyCombinedTermsProvider;
  id location = [(BuddyCombinedTermsProvider *)&v8 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    dispatch_queue_t v2 = dispatch_queue_create("Combined Terms Queue", 0);
    v3 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v2;

    dispatch_queue_t v4 = dispatch_queue_create("Combined Terms Request Queue", 0);
    v5 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v4;
  }
  v6 = (BuddyCombinedTermsProvider *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)prefetchTerms
{
}

- (void)fetchTerms:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyCombinedTermsProvider *)v12 termsRequestQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10008D924;
  objc_super v8 = &unk_1002B0CD0;
  SEL v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchTermsFromServer:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = (id)MGCopyAnswer();
  id v23 = v25;
  if (![v23 length]) {
    objc_storeStrong(&v23, @"1A001a");
  }
  id v22 = &off_1002C1570;
  id v21 = &off_1002C1598;
  id v20 = &off_1002C15C0;
  id v19 = 0;
  if (+[BYWarranty shouldDisplay])
  {
    v32[0] = v22;
    v32[1] = v20;
    v32[2] = v21;
    v3 = +[NSArray arrayWithObjects:v32 count:3];
  }
  else
  {
    v31[0] = v22;
    v31[1] = v20;
    v3 = +[NSArray arrayWithObjects:v31 count:2];
  }
  id v4 = v19;
  id v19 = v3;

  v29[0] = @"terms";
  v30[0] = v19;
  v29[1] = @"format";
  v30[1] = kAAProtocolGenericTermsUIBuddyMLKey;
  id v18 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  id v17 = +[BYLicenseAgreement versionOfAcceptedAgreement];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)buf, (uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Loading generic terms, accepted version = %llu", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = objc_alloc((Class)AAGenericTermsUIRequest);
  id v14 = [v5 initWithParameters:v18];
  CFStringRef v26 = @"X-Apple-iOS-SLA-Version";
  int v6 = +[NSString stringWithFormat:@"%llu", v17];
  v27 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v14 setCustomHeaders:v7];

  objc_super v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_10008E3B0;
  v12 = &unk_1002B1E10;
  id v13 = location[0];
  [v14 performRequestWithHandler:&v8];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (NSData)cachedTermsData
{
  return self->_cachedTermsData;
}

- (void)setCachedTermsData:(id)a3
{
}

- (OS_dispatch_queue)termsQueue
{
  return self->_termsQueue;
}

- (void)setTermsQueue:(id)a3
{
}

- (OS_dispatch_queue)termsRequestQueue
{
  return self->_termsRequestQueue;
}

- (void)setTermsRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end