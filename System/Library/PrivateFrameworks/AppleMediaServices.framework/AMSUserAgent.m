@interface AMSUserAgent
+ (id)_sharedCache;
+ (id)cachedUserAgentForBundleIdentifier:(id)a3;
+ (id)userAgentForProcessInfo:(id)a3;
+ (void)cacheUserAgent:(id)a3 forBundleIdentifier:(id)a4;
- (AMSDeviceInfo)deviceInfoProvider;
- (AMSMappedBundleInfo)bundleInfo;
- (AMSProcessInfo)processInfo;
- (AMSUserAgent)initWithProcessInfo:(id)a3;
- (NSString)clientName;
- (NSString)clientVersion;
- (id)_compileAndShouldCache:(BOOL *)a3;
- (id)_compiledAMSCoreUserAgent;
- (id)_compiledAMSUserAgentShouldCache:(BOOL *)a3;
- (id)_iOSComponentBuildVersion;
- (id)_iOSComponentClientInfo;
- (id)_iOSComponentDeviceModel;
- (id)_iOSComponentHardwarePlatform;
- (id)_iOSComponentProductVersion;
- (id)_initWithProcessInfo:(id)a3 deviceInfoProvider:(id)a4;
- (id)_sharedComponentFairPlayDeviceType;
- (id)_sharedComponentFrameworkVersion;
- (id)_sharedComponentParentheticalWithFairPlayDeviceType:(id)a3;
- (id)_sharedComponentParentheticalWithFairPlayDeviceType:(id)a3 productType:(id)a4;
- (id)_userAgentSuffix;
- (id)compile;
- (void)setClientName:(id)a3;
- (void)setClientVersion:(id)a3;
@end

@implementation AMSUserAgent

+ (id)userAgentForProcessInfo:(id)a3
{
  id v5 = a3;
  v6 = NSString;
  v7 = [v5 bundleIdentifier];
  v8 = v7;
  if (!v7)
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    v8 = [v3 processName];
  }
  v9 = [v5 accountMediaType];
  v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];

  if (!v7)
  {
  }
  v11 = [v5 userAgentSuffix];

  if (v11)
  {
    v12 = NSString;
    v13 = [v5 userAgentSuffix];
    uint64_t v14 = [v12 stringWithFormat:@"%@-%@", v10, v13];

    v10 = (void *)v14;
  }
  v15 = [a1 cachedUserAgentForBundleIdentifier:v10];
  v16 = (__CFString *)[v15 mutableCopy];

  if ([(__CFString *)v16 length])
  {
    v17 = v16;
  }
  else
  {
    char v22 = 0;
    v18 = [[AMSUserAgent alloc] initWithProcessInfo:v5];
    v17 = [(AMSUserAgent *)v18 _compileAndShouldCache:&v22];

    if (v22) {
      [a1 cacheUserAgent:v17 forBundleIdentifier:v10];
    }
  }
  if (v17) {
    v19 = v17;
  }
  else {
    v19 = &stru_1EDCA7308;
  }
  v20 = v19;

  return v20;
}

+ (id)cachedUserAgentForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)_sharedCache
{
  if (qword_1EB38E0C8 != -1) {
    dispatch_once(&qword_1EB38E0C8, &__block_literal_global_139);
  }
  v2 = (void *)qword_1EB38E0D0;
  return v2;
}

+ (void)cacheUserAgent:(id)a3 forBundleIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [a1 _sharedCache];
  [v7 setObject:v8 forKey:v6];
}

BOOL __50__AMSUserAgent__sharedComponentFairPlayDeviceType__block_invoke()
{
  _MergedGlobals_156 = 0;
  dword_1EB38E0C4 = 0;
  BOOL result = AMSFairPlayGetDeviceType(&dword_1EB38E0C4);
  _MergedGlobals_156 = result;
  return result;
}

- (id)_sharedComponentParentheticalWithFairPlayDeviceType:(id)a3 productType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v6 hasPrefix:@"iPad"])
  {
    id v8 = @"5";
  }
  else if (([v6 hasPrefix:@"iPhone"] & 1) != 0 {
         || ([v6 hasPrefix:@"Watch"] & 1) != 0)
  }
  {
    id v8 = @"6";
  }
  else if ([v6 hasPrefix:@"RealityDevice"])
  {
    id v8 = @"7";
  }
  else if ([v6 hasPrefix:@"iPod"])
  {
    id v8 = @"4";
  }
  else if (([v6 hasPrefix:@"AppleTV"] & 1) != 0 {
         || [v6 hasPrefix:@"iProd"])
  }
  {
    id v8 = @"3";
  }
  else
  {
    id v8 = &stru_1EDCA7308;
  }
  if ([(__CFString *)v8 length]) {
    [v7 addObject:v8];
  }
  if ([v5 length]) {
    [v7 addObject:v5];
  }
  if ([v7 count])
  {
    v9 = NSString;
    v10 = [v7 componentsJoinedByString:@"; "];
    v11 = [v9 stringWithFormat:@"(%@)", v10];
  }
  else
  {
    v11 = 0;
  }
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = &stru_1EDCA7308;
  }
  v13 = v12;

  return v13;
}

- (id)_compileAndShouldCache:(BOOL *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = [(AMSUserAgent *)self _compiledAMSUserAgentShouldCache:a3];
  if (_os_feature_enabled_impl())
  {
    id v6 = +[AMSLogConfig sharedBagConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = AMSLogKey();
      v9 = NSString;
      if (v8)
      {
        uint64_t v10 = objc_opt_class();
        uint64_t v3 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v10, v3];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      v11 = };
      *(_DWORD *)buf = 138543362;
      v33 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@Using AMSCore to generate user agent", buf, 0xCu);
      if (v8)
      {

        v11 = (void *)v3;
      }
    }
    v12 = [(AMSUserAgent *)self _compiledAMSCoreUserAgent];
    if (([v5 isEqualToString:v12] & 1) == 0)
    {
      if (+[AMSUnitTests isRunningUnitTests])
      {
        v13 = +[AMSLogConfig sharedBagConfig];
        if (!v13)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v14 = [v13 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = AMSLogKey();
          v16 = NSString;
          if (v15)
          {
            uint64_t v17 = objc_opt_class();
            v18 = AMSLogKey();
            v19 = [v16 stringWithFormat:@"%@: [%@] ", v17, v18];
          }
          else
          {
            v19 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
            v18 = v19;
          }
          v27 = AMSHashIfNeeded(v12);
          v28 = AMSHashIfNeeded(v5);
          *(_DWORD *)buf = 138543874;
          v33 = v19;
          __int16 v34 = 2114;
          v35 = v27;
          __int16 v36 = 2114;
          v37 = v28;
          _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@AMSCore-produced user agent string differs from AMS-produced user agent string:\n amsCoreUserAgent='%{public}@'\namsUserAgent='%{public}@'", buf, 0x20u);
          if (v15) {
        }
          }
        v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v21 = +[AMSLogConfig sharedBagConfig];
        [v20 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v21 userInfo:0];
      }
      else
      {
        v20 = +[AMSLogConfig sharedBagConfig];
        if (!v20)
        {
          v20 = +[AMSLogConfig sharedConfig];
        }
        v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          char v22 = AMSLogKey();
          v23 = NSString;
          if (v22)
          {
            uint64_t v24 = objc_opt_class();
            v25 = AMSLogKey();
            v26 = [v23 stringWithFormat:@"%@: [%@] ", v24, v25];
          }
          else
          {
            v26 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
            v25 = v26;
          }
          v29 = AMSHashIfNeeded(v12);
          v30 = AMSHashIfNeeded(v5);
          *(_DWORD *)buf = 138543874;
          v33 = v26;
          __int16 v34 = 2114;
          v35 = v29;
          __int16 v36 = 2114;
          v37 = v30;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_FAULT, "%{public}@AMSCore-produced user agent string differs from AMS-produced user agent string:\n amsCoreUserAgent='%{public}@'\namsUserAgent='%{public}@'", buf, 0x20u);
          if (v22) {
        }
          }
      }
    }
  }
  else
  {
    v12 = v5;
  }
  return v12;
}

- (id)_compiledAMSCoreUserAgent
{
  if (AMS::initAMSCoreOnce(void)::onceToken != -1) {
    dispatch_once(&AMS::initAMSCoreOnce(void)::onceToken, &__block_literal_global_35);
  }
  bundleInfo = self->_bundleInfo;
  id v4 = self->_processInfo;
  v9 = &unk_1EDC818E0;
  uint64_t v10 = v4;
  v11 = bundleInfo;
  AMSCore::UserAgent::create((AMSCore::UserAgent *)&v9, &__p);
  id v5 = [NSString alloc];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  id v7 = (void *)[v5 initWithCString:p_p encoding:4];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v7;
}

- (id)_compiledAMSUserAgentShouldCache:(BOOL *)a3
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v16 = [(AMSUserAgent *)self _sharedComponentFairPlayDeviceType];
  id v5 = [(AMSUserAgent *)self _iOSComponentClientInfo];
  v17[0] = v5;
  id v6 = [(AMSUserAgent *)self _iOSComponentProductVersion];
  v17[1] = v6;
  id v7 = [(AMSUserAgent *)self _iOSComponentDeviceModel];
  v17[2] = v7;
  id v8 = [(AMSUserAgent *)self _iOSComponentHardwarePlatform];
  v17[3] = v8;
  v9 = [(AMSUserAgent *)self _iOSComponentBuildVersion];
  v17[4] = v9;
  uint64_t v10 = [(AMSUserAgent *)self _sharedComponentParentheticalWithFairPlayDeviceType:v16];
  v17[5] = v10;
  v11 = [(AMSUserAgent *)self _sharedComponentFrameworkVersion];
  v17[6] = v11;
  v12 = [(AMSUserAgent *)self _userAgentSuffix];
  v17[7] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];

  if (a3) {
    *a3 = v16 != 0;
  }
  uint64_t v14 = objc_msgSend(v13, "ams_nonEmptyComponentsJoinedByString:", @" ");

  return v14;
}

- (id)_userAgentSuffix
{
  uint64_t v3 = [(AMSUserAgent *)self processInfo];
  id v4 = [v3 userAgentSuffix];
  if (v4)
  {
    id v5 = [(AMSUserAgent *)self processInfo];
    id v6 = [v5 userAgentSuffix];
  }
  else
  {
    id v6 = &stru_1EDCA7308;
  }

  return v6;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (id)_sharedComponentParentheticalWithFairPlayDeviceType:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUserAgent *)self deviceInfoProvider];
  id v6 = [v5 productType];

  id v7 = [(AMSUserAgent *)self _sharedComponentParentheticalWithFairPlayDeviceType:v4 productType:v6];

  return v7;
}

- (id)_sharedComponentFrameworkVersion
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
  uint64_t v3 = [v2 infoDictionary];
  id v4 = [v3 objectForKey:@"CFBundleVersion"];

  if (![(__CFString *)v4 length])
  {

    id v4 = @"1";
  }
  id v5 = [NSString stringWithFormat:@"AMS/%@", v4];

  return v5;
}

- (id)_sharedComponentFairPlayDeviceType
{
  if (qword_1EB38E0D8 != -1) {
    dispatch_once(&qword_1EB38E0D8, &__block_literal_global_52_0);
  }
  if (_MergedGlobals_156)
  {
    v2 = objc_msgSend(NSString, "stringWithFormat:", @"dt:%lu", dword_1EB38E0C4);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_iOSComponentProductVersion
{
  uint64_t v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(AMSUserAgent *)self deviceInfoProvider];
  id v5 = [v4 productVersion];

  if ([v5 length])
  {
    id v6 = [(AMSUserAgent *)self deviceInfoProvider];
    int v7 = [v6 deviceIsAppleWatch];

    id v8 = v7 ? @"watchOS/%@" : @"iOS/%@";
    -[__CFString appendFormat:](v3, "appendFormat:", v8, v5);
    v9 = [(AMSUserAgent *)self deviceInfoProvider];
    int v10 = [v9 deviceIsAppleTV];

    if (v10) {
      [(__CFString *)v3 appendFormat:@" AppleTV/%@", v5];
    }
  }
  if (v3) {
    v11 = v3;
  }
  else {
    v11 = &stru_1EDCA7308;
  }
  v12 = v11;

  return v12;
}

- (AMSDeviceInfo)deviceInfoProvider
{
  return self->_deviceInfoProvider;
}

- (id)_iOSComponentHardwarePlatform
{
  v2 = [(AMSUserAgent *)self deviceInfoProvider];
  uint64_t v3 = [v2 hardwarePlatform];

  if ([v3 length])
  {
    id v4 = [NSString stringWithFormat:@"hwp/%@", v3];
  }
  else
  {
    id v4 = &stru_1EDCA7308;
  }

  return v4;
}

- (id)_iOSComponentDeviceModel
{
  v2 = [(AMSUserAgent *)self deviceInfoProvider];
  uint64_t v3 = [v2 productType];

  if ([v3 length])
  {
    id v4 = [NSString stringWithFormat:@"model/%@", v3];
  }
  else
  {
    id v4 = 0;
  }
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_1EDCA7308;
  }
  id v6 = v5;

  return v6;
}

- (id)_iOSComponentClientInfo
{
  uint64_t v3 = NSString;
  id v4 = [(AMSUserAgent *)self bundleInfo];
  id v5 = [v4 clientName];
  id v6 = [(AMSUserAgent *)self bundleInfo];
  int v7 = [v6 clientVersion];
  id v8 = [v3 stringWithFormat:@"%@/%@", v5, v7];

  return v8;
}

- (AMSMappedBundleInfo)bundleInfo
{
  return self->_bundleInfo;
}

- (id)_iOSComponentBuildVersion
{
  v2 = [(AMSUserAgent *)self deviceInfoProvider];
  uint64_t v3 = [v2 buildVersion];

  if ([v3 length])
  {
    id v4 = [NSString stringWithFormat:@"build/%@", v3];
  }
  else
  {
    id v4 = &stru_1EDCA7308;
  }

  return v4;
}

uint64_t __28__AMSUserAgent__sharedCache__block_invoke()
{
  qword_1EB38E0D0 = [[AMSLRUCache alloc] initWithMaxSize:20];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfoProvider, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_bundleInfo, 0);
}

- (AMSUserAgent)initWithProcessInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v5 = +[AMSProcessInfo currentProcess];
  }
  id v6 = objc_opt_new();
  int v7 = [(AMSUserAgent *)self _initWithProcessInfo:v5 deviceInfoProvider:v6];

  if (!v4) {
  return v7;
  }
}

- (id)_initWithProcessInfo:(id)a3 deviceInfoProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUserAgent;
  v9 = [(AMSUserAgent *)&v13 init];
  if (v9)
  {
    uint64_t v10 = +[AMSMappedBundleInfo bundleInfoForProcessInfo:v7];
    bundleInfo = v9->_bundleInfo;
    v9->_bundleInfo = (AMSMappedBundleInfo *)v10;

    objc_storeStrong((id *)&v9->_processInfo, a3);
    objc_storeStrong((id *)&v9->_deviceInfoProvider, a4);
  }

  return v9;
}

- (NSString)clientName
{
  v2 = [(AMSUserAgent *)self bundleInfo];
  uint64_t v3 = [v2 clientName];

  return (NSString *)v3;
}

- (NSString)clientVersion
{
  v2 = [(AMSUserAgent *)self bundleInfo];
  uint64_t v3 = [v2 clientVersion];

  return (NSString *)v3;
}

- (void)setClientName:(id)a3
{
  id v5 = a3;
  id v4 = [(AMSUserAgent *)self bundleInfo];
  [v4 setClientName:v5];
}

- (void)setClientVersion:(id)a3
{
  id v5 = a3;
  id v4 = [(AMSUserAgent *)self bundleInfo];
  [v4 setClientVersion:v5];
}

- (id)compile
{
  return [(AMSUserAgent *)self _compileAndShouldCache:0];
}

@end