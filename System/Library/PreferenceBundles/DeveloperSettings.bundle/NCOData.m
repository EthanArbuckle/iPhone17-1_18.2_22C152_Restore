@interface NCOData
- (AnalyticsWorkspace)symptomsWorkspace;
- (BOOL)isCellularInexpensive;
- (BOOL)isHighDataModeSupported;
- (CoreTelephonyClient)ctClient;
- (NCOData)init;
- (NetworkPerformanceFeed)symptomsFeed;
- (OS_dispatch_queue)symptomsReplyQueue;
- (OS_dispatch_queue)wifiPrefsQueue;
- (double)expirationTimeInterval;
- (unsigned)wifiOverride;
- (void)enablePrefer5G:(BOOL)a3 completion:(id)a4;
- (void)fetchNCOStatusWithCompletion:(id)a3;
- (void)fetchPrefer5GEnabledWithCompletion:(id)a3;
- (void)setCellularInexpensive:(BOOL)a3;
- (void)setCtClient:(id)a3;
- (void)setIsHighDataModeSupported:(BOOL)a3;
- (void)setSymptomsFeed:(id)a3;
- (void)setSymptomsReplyQueue:(id)a3;
- (void)setSymptomsWorkspace:(id)a3;
- (void)setWifiOverride:(unsigned int)a3 completion:(id)a4;
- (void)setWifiPrefsQueue:(id)a3;
@end

@implementation NCOData

- (void)fetchNCOStatusWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCOData *)self isCellularInexpensive]
    || [(NCOData *)self wifiOverride] != 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_FFAC;
  v7[3] = &unk_35038;
  id v8 = v4;
  BOOL v9 = v5;
  id v6 = v4;
  [(NCOData *)self fetchPrefer5GEnabledWithCompletion:v7];
}

- (NCOData)init
{
  v26.receiver = self;
  v26.super_class = (Class)NCOData;
  v2 = [(NCOData *)&v26 init];
  if (v2)
  {
    v3 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    ctClient = v2->_ctClient;
    v2->_ctClient = v3;

    BOOL v5 = v2->_ctClient;
    if (!v5)
    {
      NSLog(@"NCO Cellular: CoreTelephonyClient is nil");
      goto LABEL_10;
    }
    uint64_t v25 = 0;
    id v6 = [(CoreTelephonyClient *)v5 getCurrentDataServiceDescriptorSync:&v25];
    if (v6)
    {
      v7 = v2->_ctClient;
      id v24 = 0;
      unsigned __int8 v8 = [(CoreTelephonyClient *)v7 isHighDataModeSupported:v6 error:&v24];
      id v9 = v24;
      v2->_isHighDataModeSupported = v8;
      if (!v9)
      {
LABEL_9:

LABEL_10:
        if (v2->_isHighDataModeSupported)
        {
          id v12 = objc_alloc((Class)AnalyticsWorkspace);
          v13 = (AnalyticsWorkspace *)[v12 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
          symptomsWorkspace = v2->_symptomsWorkspace;
          v2->_symptomsWorkspace = v13;

          v15 = (NetworkPerformanceFeed *)[objc_alloc((Class)NetworkPerformanceFeed) initWithWorkspace:v2->_symptomsWorkspace];
          symptomsFeed = v2->_symptomsFeed;
          v2->_symptomsFeed = v15;

          v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v18 = dispatch_queue_create("com.apple.DeveloperSettings.symptomsReplyQueue", v17);
          symptomsReplyQueue = v2->_symptomsReplyQueue;
          v2->_symptomsReplyQueue = (OS_dispatch_queue *)v18;

          [(NetworkPerformanceFeed *)v2->_symptomsFeed setQueue:v2->_symptomsReplyQueue];
          v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v21 = dispatch_queue_create("com.apple.DeveloperSettings.wifiPrefsQueue", v20);
          wifiPrefsQueue = v2->_wifiPrefsQueue;
          v2->_wifiPrefsQueue = (OS_dispatch_queue *)v21;
        }
        else
        {
          NSLog(@"NCO High Data Mode is Not Supported");
        }
        return v2;
      }
      v10 = v9;
      v11 = [v9 localizedDescription];
      NSLog(@"NCO Cellular: Error getting isHighDataModeSupported: %@", v11);
    }
    else
    {
      v10 = [0 localizedDescription];
      NSLog(@"NCO Cellular: Unable to get CurrentDataServiceDescriptorSync: %@", v10);
    }

    goto LABEL_9;
  }
  return v2;
}

- (double)expirationTimeInterval
{
  v2 = CFCalendarCopyCurrent();
  CFAbsoluteTime at = CFAbsoluteTimeGetCurrent();
  CFCalendarAddComponents(v2, &at, 0, "d", 1);
  uint64_t v5 = 0;
  unsigned int v4 = 0;
  CFCalendarDecomposeAbsoluteTime(v2, at, "yMd", (char *)&v5 + 4, &v5, &v4);
  CFCalendarComposeAbsoluteTime(v2, &at, "yMdHms", HIDWORD(v5), v5, v4, 5, 0, 0);
  return at;
}

- (BOOL)isCellularInexpensive
{
  v3 = [(NCOData *)self ctClient];

  if (v3)
  {
    unsigned int v4 = [(NCOData *)self ctClient];
    id v9 = 0;
    unsigned __int8 v5 = [v4 overriddenInterfaceCostInexpensive:&v9];
    id v6 = v9;

    if (v6)
    {
      v7 = [v6 localizedDescription];
      NSLog(@"NCO Cellular: Error getting override %@", v7);
    }
  }
  else
  {
    NSLog(@"NCO Cellular: ctClient is nil");
    return 0;
  }
  return v5;
}

- (void)setCellularInexpensive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(NCOData *)self ctClient];

  if (v5)
  {
    id v6 = [(NCOData *)self ctClient];
    id v9 = [v6 setOverriddenInterfaceCostInexpensive:v3];

    v7 = v9;
    if (v9)
    {
      unsigned __int8 v8 = [v9 localizedDescription];
      NSLog(@"NCO Cellular: Error setting override %@", v8);

      v7 = v9;
    }
  }
  else
  {
    NSLog(@"NCO Cellular: ctClient is nil");
  }
}

- (void)fetchPrefer5GEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = kSymptomForcePreferCellOverWiFiEnableKey;
  unsigned __int8 v5 = +[NSNull null];
  v14 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  symptomsReplyQueue = self->_symptomsReplyQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10530;
  v10[3] = &unk_35088;
  v10[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(symptomsReplyQueue, v10);
}

- (void)enablePrefer5G:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v16[0] = kSymptomForcePreferCellOverWiFiEnableKey;
  v7 = +[NSNumber numberWithBool:v4];
  v17[0] = v7;
  v16[1] = kSymptomForcePreferCellOverWiFiAutoDisableTimestampKey;
  [(NCOData *)self expirationTimeInterval];
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v17[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  NSLog(@"NCO Prefer5G (set) sent %@", v9);
  symptomsReplyQueue = self->_symptomsReplyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1081C;
  block[3] = &unk_35088;
  block[4] = self;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v9;
  dispatch_async(symptomsReplyQueue, block);
}

- (unsigned)wifiOverride
{
  SCPreferencesRef v2 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, @"com.apple.Preferences", 0, 0);
  if (v2)
  {
    SCPreferencesRef v3 = v2;
    unsigned int TemporaryOverrideCost = SCNetworkInterfaceTypeGetTemporaryOverrideCost();
    CFRelease(v3);
    return TemporaryOverrideCost;
  }
  else
  {
    NSLog(@"NCO WiFi: Error - Unable to create SCPreferencesRef");
    return 0;
  }
}

- (void)setWifiOverride:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  SCPreferencesRef v7 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, @"com.apple.Preferences", 0, 0);
  if (v7)
  {
    wifiPrefsQueue = self->_wifiPrefsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10AA0;
    block[3] = &unk_350B0;
    SCPreferencesRef v11 = v7;
    id v10 = v6;
    unsigned int v12 = a3;
    dispatch_async(wifiPrefsQueue, block);
  }
  else
  {
    NSLog(@"NCO WiFi: Error - Unable to create SCPreferencesRef");
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (BOOL)isHighDataModeSupported
{
  return self->_isHighDataModeSupported;
}

- (void)setIsHighDataModeSupported:(BOOL)a3
{
  self->_isHighDataModeSupported = a3;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (NetworkPerformanceFeed)symptomsFeed
{
  return self->_symptomsFeed;
}

- (void)setSymptomsFeed:(id)a3
{
}

- (AnalyticsWorkspace)symptomsWorkspace
{
  return self->_symptomsWorkspace;
}

- (void)setSymptomsWorkspace:(id)a3
{
}

- (OS_dispatch_queue)symptomsReplyQueue
{
  return self->_symptomsReplyQueue;
}

- (void)setSymptomsReplyQueue:(id)a3
{
}

- (OS_dispatch_queue)wifiPrefsQueue
{
  return self->_wifiPrefsQueue;
}

- (void)setWifiPrefsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiPrefsQueue, 0);
  objc_storeStrong((id *)&self->_symptomsReplyQueue, 0);
  objc_storeStrong((id *)&self->_symptomsWorkspace, 0);
  objc_storeStrong((id *)&self->_symptomsFeed, 0);

  objc_storeStrong((id *)&self->_ctClient, 0);
}

@end