@interface PLBatteryUIBackendModel
+ (BOOL)shouldShowChargingController;
+ (BOOL)shouldShowModifiedHealthController;
+ (BOOL)supportsChargingFixedLimit;
+ (int)_getBatteryHealthServiceState;
+ (int)_getCurrentStateOfCharge;
+ (int)_getMaximumCapacity;
+ (int)getBatteryHealthServiceState;
+ (int)getCurrentStateOfCharge;
+ (int)getMaximumCapacity;
- (BOOL)isSmartChargingTempDisabled;
- (NSDate)endOfDay;
- (NSDate)endOfHour;
- (NSDictionary)queryResult;
- (NSMutableDictionary)queryPayload;
- (PLBatteryUIBackendModel)init;
- (PowerUISmartChargeClient)smartChargingClient;
- (id)addQueryType:(int64_t)a3 withEndDate:(id)a4 withRange:(double)a5 withBucketSize:(double)a6;
- (id)convertResultToLegacyFormat:(id)a3;
- (id)getSmartChargingSwitchState;
- (unint64_t)smartChargingState;
- (void)addSkipPlistWriteKey;
- (void)disableSmartCharging;
- (void)enableSmartCharging;
- (void)getOBCEngagedState:(BOOL *)a3 andDesktopMode:(BOOL *)a4;
- (void)resetQuery;
- (void)runQuery;
- (void)setEndOfDay:(id)a3;
- (void)setEndOfHour:(id)a3;
- (void)setQueryPayload:(id)a3;
- (void)setQueryResult:(id)a3;
- (void)setSmartChargingClient:(id)a3;
- (void)setSmartChargingState:(unint64_t)a3;
- (void)tempDisableSmartCharging;
- (void)updateSmartChargingState;
@end

@implementation PLBatteryUIBackendModel

- (PLBatteryUIBackendModel)init
{
  v16.receiver = self;
  v16.super_class = (Class)PLBatteryUIBackendModel;
  v2 = [(PLBatteryUIBackendModel *)&v16 init];
  if (v2)
  {
    uint64_t v3 = PLCalculateEndOfHour();
    endOfHour = v2->_endOfHour;
    v2->_endOfHour = (NSDate *)v3;

    uint64_t v5 = PLCalculateEndOfDay();
    endOfDay = v2->_endOfDay;
    v2->_endOfDay = (NSDate *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    queryPayload = v2->_queryPayload;
    v2->_queryPayload = (NSMutableDictionary *)v7;

    queryResult = v2->_queryResult;
    v2->_queryResult = 0;

    id v10 = objc_alloc((Class)PowerUISmartChargeClient);
    v11 = (PowerUISmartChargeClient *)[v10 initWithClientName:PowerUISmartChargeClientSettings];
    smartChargingClient = v2->_smartChargingClient;
    v2->_smartChargingClient = v11;

    v13 = v2;
  }
  else
  {
    v14 = BUILogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_8A810(v14);
    }
  }
  return v2;
}

- (id)addQueryType:(int64_t)a3 withEndDate:(id)a4 withRange:(double)a5 withBucketSize:(double)a6
{
  id v10 = PLBatteryUsageUIConfiguration();
  v11 = PLBatteryUsageUIKeyForRequest();
  v12 = BUILogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v17 = 134218498;
    int64_t v18 = a3;
    __int16 v19 = 2112;
    double v20 = *(double *)&v11;
    __int16 v21 = 2048;
    double v22 = a5;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Requesting response type: %ld, key: %@, query range: %f", (uint8_t *)&v17, 0x20u);
  }

  if (v11)
  {
    v13 = [(PLBatteryUIBackendModel *)self queryPayload];
    [v13 setObject:v10 forKeyedSubscript:v11];

    id v14 = v11;
  }
  else
  {
    v15 = BUILogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218496;
      int64_t v18 = a3;
      __int16 v19 = 2048;
      double v20 = a5;
      __int16 v21 = 2048;
      double v22 = a6;
      _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to add response type:%ld range:%f bucket:%f", (uint8_t *)&v17, 0x20u);
    }
  }

  return v11;
}

- (void)runQuery
{
  uint64_t v3 = [(PLBatteryUIBackendModel *)self queryPayload];
  id v4 = [v3 count];

  uint64_t v5 = BUILogCommon();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(PLBatteryUIBackendModel *)self queryPayload];
      int v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "querying with %@", (uint8_t *)&v14, 0xCu);
    }
    v8 = [(PLBatteryUIBackendModel *)self queryPayload];
    v6 = PLQueryRegistered();

    v9 = BUILogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "response %@", (uint8_t *)&v14, 0xCu);
    }

    if (!v6)
    {
      id v10 = BUILogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(PLBatteryUIBackendModel *)self queryPayload];
        int v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "no response: retrying query with %@", (uint8_t *)&v14, 0xCu);
      }
      v12 = [(PLBatteryUIBackendModel *)self queryPayload];
      v6 = PLQueryRegistered();

      v13 = BUILogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "after retry: response %@", (uint8_t *)&v14, 0xCu);
      }
    }
    [(PLBatteryUIBackendModel *)self setQueryResult:v6];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_8A8AC();
  }
}

- (void)resetQuery
{
  uint64_t v3 = [(PLBatteryUIBackendModel *)self queryPayload];
  [v3 removeAllObjects];

  PLCalculateEndOfHour();
  id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endOfHour = self->_endOfHour;
  self->_endOfHour = v4;

  PLCalculateEndOfDay();
  self->_endOfDay = (NSDate *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

- (id)convertResultToLegacyFormat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableDictionary dictionary];
  v6 = +[NSMutableDictionary dictionary];
  [v5 setObject:v6 forKeyedSubscript:@"Graph"];
  uint64_t v7 = +[NSMutableDictionary dictionary];
  v8 = +[NSMutableArray array];
  int v9 = 10;
  do
  {
    id v10 = +[NSMutableDictionary dictionary];
    [v8 addObject:v10];

    --v9;
  }
  while (v9);
  v11 = BUILogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_8A8E0(v8);
  }

  [v6 setObject:v7 forKeyedSubscript:@"PLBatteryUIGraph24hrs"];
  [v6 setObject:v8 forKeyedSubscript:@"PLBatteryUIGraphDays"];
  v12 = [(PLBatteryUIBackendModel *)self endOfHour];
  [v12 timeIntervalSince1970];
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v5 setObject:v13 forKeyedSubscript:@"endOfHour"];

  int v14 = BUILogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(PLBatteryUIBackendModel *)self endOfHour];
    [v15 timeIntervalSince1970];
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = v16;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "setting end of hour:%f", buf, 0xCu);
  }
  int v17 = [(PLBatteryUIBackendModel *)self endOfDay];
  [v17 timeIntervalSince1970];
  int64_t v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v5 setObject:v18 forKeyedSubscript:@"endOfDay"];

  __int16 v19 = BUILogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    double v20 = [(PLBatteryUIBackendModel *)self endOfDay];
    [v20 timeIntervalSince1970];
    *(_DWORD *)buf = 134217984;
    uint64_t v33 = v21;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "setting end of day:%f", buf, 0xCu);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_A924;
  v28[3] = &unk_BE768;
  v28[4] = self;
  id v22 = v5;
  id v29 = v22;
  id v30 = v7;
  v31 = v8;
  id v23 = v8;
  id v24 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v28];
  v25 = v31;
  id v26 = v22;

  return v26;
}

+ (int)getBatteryHealthServiceState
{
  int v2 = [a1 _getBatteryHealthServiceState];
  if (+[PLBatteryUIUtilities inDemoMode])
  {
    uint64_t v3 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUI_DEMO_SVC"];
    id v4 = BUILogCommon();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "demo  mode: overriding svc", (uint8_t *)v8, 2u);
      }

      int v2 = [v3 intValue];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_8AC7C();
      }
    }
  }
  v6 = BUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v2;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Svc State: %d", (uint8_t *)v8, 8u);
  }

  return v2;
}

+ (int)getMaximumCapacity
{
  int v2 = [a1 _getMaximumCapacity];
  if (+[PLBatteryUIUtilities inDemoMode])
  {
    uint64_t v3 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUI_DEMO_NCC"];
    id v4 = BUILogCommon();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "demo mode: overriding ncc", (uint8_t *)&v11, 2u);
      }

      int v2 = [v3 intValue];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_8ACB0();
      }
    }
  }
  v6 = BUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    int v12 = v2;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "ncc: %d", (uint8_t *)&v11, 8u);
  }

  if (v2 == -1)
  {
    int v9 = BUILogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "missing NCC", (uint8_t *)&v11, 2u);
    }
    int v8 = -1;
  }
  else
  {
    if (v2 >= 100) {
      int v7 = 100;
    }
    else {
      int v7 = v2;
    }
    int v8 = v7 & ~(v7 >> 31);
    int v9 = BUILogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      int v12 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Maximum capacity: %d%%", (uint8_t *)&v11, 8u);
    }
  }

  return v8;
}

+ (int)getCurrentStateOfCharge
{
  int v2 = [a1 _getCurrentStateOfCharge];
  if (+[PLBatteryUIUtilities inDemoMode])
  {
    uint64_t v3 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUI_DEMO_SOC"];
    id v4 = BUILogCommon();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "demo mode: overriding uisoc", (uint8_t *)v8, 2u);
      }

      int v2 = [v3 intValue];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_8ACE4();
      }
    }
  }
  v6 = BUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v2;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "UISoC: %d", (uint8_t *)v8, 8u);
  }

  return v2;
}

- (void)updateSmartChargingState
{
  uint64_t v3 = [(PLBatteryUIBackendModel *)self smartChargingClient];
  id v8 = 0;
  id v4 = [v3 isSmartChargingCurrentlyEnabled:&v8];
  id v5 = v8;

  v6 = BUILogCommon();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_8AD84();
    }
    id v4 = &dword_0 + 1;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_8AD18();
  }

  [(PLBatteryUIBackendModel *)self setSmartChargingState:v4];
}

- (BOOL)isSmartChargingTempDisabled
{
  uint64_t v3 = BUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8AE64();
  }

  id v4 = BUILogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8ADEC(self);
  }

  return (char *)[(PLBatteryUIBackendModel *)self smartChargingState] == (char *)&dword_0 + 3;
}

- (void)enableSmartCharging
{
  int v2 = [(PLBatteryUIBackendModel *)self smartChargingClient];
  id v8 = 0;
  unsigned int v3 = [v2 enableSmartCharging:&v8];
  id v4 = v8;

  id v5 = BUILogCommon();
  v6 = v5;
  if (!v3 || v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_8AE98();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Smart charging enabled", v7, 2u);
  }
}

- (void)tempDisableSmartCharging
{
  int v2 = [(PLBatteryUIBackendModel *)self smartChargingClient];
  id v8 = 0;
  unsigned int v3 = [v2 temporarilyDisableSmartCharging:&v8];
  id v4 = v8;

  id v5 = BUILogCommon();
  v6 = v5;
  if (!v3 || v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_8AF00();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Smart charging temporarily disabled", v7, 2u);
  }
}

- (void)disableSmartCharging
{
  int v2 = [(PLBatteryUIBackendModel *)self smartChargingClient];
  id v8 = 0;
  unsigned int v3 = [v2 disableSmartCharging:&v8];
  id v4 = v8;

  id v5 = BUILogCommon();
  v6 = v5;
  if (!v3 || v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_8AF68();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Smart charging disabled", v7, 2u);
  }
}

- (id)getSmartChargingSwitchState
{
  if ((char *)[(PLBatteryUIBackendModel *)self smartChargingState] == (char *)&dword_0 + 1) {
    return &off_C9458;
  }
  else {
    return &off_C9470;
  }
}

- (void)getOBCEngagedState:(BOOL *)a3 andDesktopMode:(BOOL *)a4
{
  v6 = [(PLBatteryUIBackendModel *)self smartChargingClient];
  id v10 = 0;
  unsigned __int8 v7 = [v6 isOBCEngagedAsDesktopDevice:a4 chargingOverrideAllowed:0 withError:&v10];
  id v8 = v10;

  if (v8)
  {
    int v9 = BUILogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_8AFD0();
    }

    *a3 = 0;
    *a4 = 0;
  }
  else
  {
    *a3 = v7;
  }
}

+ (BOOL)shouldShowModifiedHealthController
{
  if (_os_feature_enabled_impl()) {
    unsigned __int8 v3 = [a1 supportsChargingFixedLimit];
  }
  else {
    unsigned __int8 v3 = 0;
  }
  unsigned __int8 v4 = +[PLModelingUtilities isiPad];
  id v5 = BUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8B0A0();
  }

  v6 = BUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8B038();
  }

  return v3 & v4;
}

+ (BOOL)supportsChargingFixedLimit
{
  id v2 = objc_alloc((Class)PowerUISmartChargeClient);
  id v3 = [v2 initWithClientName:PowerUISmartChargeClientSettings];
  unsigned __int8 v4 = [v3 isMCLSupported];
  id v5 = BUILogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8B108();
  }

  return v4;
}

+ (BOOL)shouldShowChargingController
{
  if (_os_feature_enabled_impl()) {
    unsigned __int8 v3 = [a1 supportsChargingFixedLimit];
  }
  else {
    unsigned __int8 v3 = 0;
  }
  unsigned __int8 v4 = BUILogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8B170();
  }

  return v3 & +[PLModelingUtilities isiPhone];
}

- (void)addSkipPlistWriteKey
{
  id v2 = [(PLBatteryUIBackendModel *)self queryPayload];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"skipPlistWriteKey"];
}

+ (int)_getCurrentStateOfCharge
{
  int v2 = IOPSGetPercentRemaining();
  if (v2)
  {
    int v3 = v2;
    unsigned __int8 v4 = BUILogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_8B1D8(v3, v4);
    }
  }
  return -1;
}

+ (int)_getMaximumCapacity
{
  int v2 = BUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Querying NCC from IOPS", v11, 2u);
  }

  int v3 = (void *)IOPSCopyPowerSourcesByType();
  unsigned __int8 v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 objectForKeyedSubscript:@"Maximum Capacity Percent"];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      int v8 = [v6 intValue];
    }
    else
    {
      int v9 = BUILogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_8B284();
      }

      int v8 = -1;
    }
  }
  else
  {
    id v5 = BUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_8B250();
    }
    int v8 = -1;
  }

  return v8;
}

+ (int)_getBatteryHealthServiceState
{
  int v2 = BUILogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Querying svc from IOPS", v11, 2u);
  }

  int v3 = (void *)IOPSCopyPowerSourcesByType();
  unsigned __int8 v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 objectForKeyedSubscript:@"Battery Service State"];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      int v8 = [v6 intValue];
    }
    else
    {
      int v9 = BUILogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_8B2B8();
      }

      int v8 = -1;
    }
  }
  else
  {
    id v5 = BUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_8B250();
    }
    int v8 = -1;
  }

  return v8;
}

- (NSDate)endOfHour
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEndOfHour:(id)a3
{
}

- (NSDate)endOfDay
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndOfDay:(id)a3
{
}

- (NSMutableDictionary)queryPayload
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueryPayload:(id)a3
{
}

- (NSDictionary)queryResult
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueryResult:(id)a3
{
}

- (PowerUISmartChargeClient)smartChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSmartChargingClient:(id)a3
{
}

- (unint64_t)smartChargingState
{
  return self->_smartChargingState;
}

- (void)setSmartChargingState:(unint64_t)a3
{
  self->_smartChargingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartChargingClient, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_queryPayload, 0);
  objc_storeStrong((id *)&self->_endOfDay, 0);

  objc_storeStrong((id *)&self->_endOfHour, 0);
}

@end