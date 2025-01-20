@interface CPSAnalytics
+ (id)sharedInstance;
- (BOOL)shouldRecordAnalyticsEvents;
- (void)_sendCoreAnalyticsEvent:(id)a3 withDictionary:(id)a4;
- (void)audioAppMetadataThrottledWithBundleIdentifier:(id)a3;
- (void)navigationStartedWithBundleIdentifier:(id)a3;
@end

@implementation CPSAnalytics

+ (id)sharedInstance
{
  id v11 = a1;
  SEL v10 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __30__CPSAnalytics_sharedInstance__block_invoke;
  v8 = &__block_descriptor_40_e5_v8__0l;
  id v9 = a1;
  v13 = (dispatch_once_t *)&sharedInstance_onceToken;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance___sharedAnalytics;

  return v2;
}

void __30__CPSAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedAnalytics;
  sharedInstance___sharedAnalytics = (uint64_t)v1;
}

- (BOOL)shouldRecordAnalyticsEvents
{
  return NSClassFromString(&cfstr_Xctestcase.isa) == 0;
}

- (void)_sendCoreAnalyticsEvent:(id)a3 withDictionary:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if ([(CPSAnalytics *)v9 shouldRecordAnalyticsEvents])
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
      _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_INFO, "Sending CA event %@", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    AnalyticsSendEvent();
    int v6 = 0;
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationStartedWithBundleIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  id v7 = @"bundleID";
  v8[0] = location[0];
  id v4 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  -[CPSAnalytics _sendCoreAnalyticsEvent:withDictionary:](v3, "_sendCoreAnalyticsEvent:withDictionary:", @"com.apple.carexperience.navigationstarted");

  objc_storeStrong(location, 0);
}

- (void)audioAppMetadataThrottledWithBundleIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  id v7 = @"bundleID";
  v8[0] = location[0];
  id v4 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  -[CPSAnalytics _sendCoreAnalyticsEvent:withDictionary:](v3, "_sendCoreAnalyticsEvent:withDictionary:", @"com.apple.carexperience.audioTemplateThrottled");

  objc_storeStrong(location, 0);
}

@end