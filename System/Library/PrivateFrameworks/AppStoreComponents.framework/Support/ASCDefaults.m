@interface ASCDefaults
+ (ASCDefaults)daemonDefaults;
- (ASCDefaults)initWithBundleID:(id)a3;
- (BOOL)disableShutdownTimer;
- (BOOL)enableWebInspector;
- (BOOL)forceRightToLeftLayout;
- (BOOL)forceStandaloneWatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferInternalJS;
- (NSCache)cachedValues;
- (NSNumber)overlaysLoadTimeout;
- (NSNumber)overlaysRateLimitRequestsPerSecond;
- (NSNumber)overlaysRateLimitTimeWindow;
- (NSString)bundleID;
- (NSString)debugPackageURL;
- (NSString)jsVersion;
- (NSString)storefrontLocaleID;
- (NSUserDefaults)userDefaults;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCachedValues:(id)a3;
- (void)setDebugPackageURL:(id)a3;
- (void)setDisableShutdownTimer:(BOOL)a3;
- (void)setEnableWebInspector:(BOOL)a3;
- (void)setForceRightToLeftLayout:(BOOL)a3;
- (void)setForceStandaloneWatch:(BOOL)a3;
- (void)setJsVersion:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOverlaysLoadTimeout:(id)a3;
- (void)setOverlaysRateLimitRequestsPerSecond:(id)a3;
- (void)setOverlaysRateLimitTimeWindow:(id)a3;
- (void)setPreferInternalJS:(BOOL)a3;
- (void)setStorefrontLocaleID:(id)a3;
@end

@implementation ASCDefaults

+ (ASCDefaults)daemonDefaults
{
  if (qword_1001A6020 != -1) {
    dispatch_once(&qword_1001A6020, &stru_100183F98);
  }
  v2 = (void *)qword_1001A6028;

  return (ASCDefaults *)v2;
}

- (ASCDefaults)initWithBundleID:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASCDefaults;
  v5 = [(ASCDefaults *)&v14 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;

    v8 = (NSCache *)objc_alloc_init((Class)NSCache);
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = v8;

    v10 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:v5->_bundleID];
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v10;

    for (uint64_t i = 0; i != 88; i += 8)
      [(NSUserDefaults *)v5->_userDefaults addObserver:v5 forKeyPath:*(__CFString **)((char *)&off_100183F40 + i) options:1 context:off_1001A0C60];
  }

  return v5;
}

- (void)dealloc
{
  for (uint64_t i = 0; i != 88; i += 8)
    [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:*(__CFString **)((char *)&off_100183F40 + i) context:off_1001A0C60];
  v4.receiver = self;
  v4.super_class = (Class)ASCDefaults;
  [(ASCDefaults *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001A0C60 == a6)
  {
    id v11 = a3;
    id v14 = [a5 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    v12 = [[ASCCacheValue alloc] initWithValue:v14];
    v13 = [(ASCDefaults *)self cachedValues];
    [v13 setObject:v12 forKey:v11];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ASCDefaults;
    id v10 = a3;
    [(ASCDefaults *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = a3;
  v8 = [(ASCDefaults *)self bundleID];
  CFPreferencesSetAppValue(v6, v7, v8);
}

- (id)objectForKey:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  v5 = [(ASCDefaults *)self cachedValues];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [v6 value];
  }
  else
  {
    v8 = [(ASCDefaults *)self bundleID];
    id v7 = (void *)CFPreferencesCopyAppValue(v4, v8);

    v9 = [[ASCCacheValue alloc] initWithValue:v7];
    id v10 = [(ASCDefaults *)self cachedValues];
    [v10 setObject:v9 forKey:v4];
  }

  return v7;
}

- (NSString)storefrontLocaleID
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCLocaleID"];
  objc_super v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  v5 = v3;

  return v5;
}

- (void)setStorefrontLocaleID:(id)a3
{
}

- (BOOL)forceRightToLeftLayout
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCForceRightToLeftLayout"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v3;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)setForceRightToLeftLayout:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(ASCDefaults *)self setObject:v4 forKey:@"ASCForceRightToLeftLayout"];
}

- (BOOL)disableShutdownTimer
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCDisableShutdownTimer"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)setDisableShutdownTimer:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(ASCDefaults *)self setObject:v4 forKey:@"ASCDisableShutdownTimer"];
}

- (NSNumber)overlaysRateLimitRequestsPerSecond
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCPreferenceKeyOverlaysRateLimitRequestsPerSecond"];
  id v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (void)setOverlaysRateLimitRequestsPerSecond:(id)a3
{
}

- (NSNumber)overlaysRateLimitTimeWindow
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCPreferenceKeyOverlaysRateLimitTimeWindow"];
  id v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (void)setOverlaysRateLimitTimeWindow:(id)a3
{
}

- (NSNumber)overlaysLoadTimeout
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCPreferenceKeyOverlaysLoadTimeout"];
  id v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (void)setOverlaysLoadTimeout:(id)a3
{
}

- (BOOL)enableWebInspector
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCEnableWebInspector"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)setEnableWebInspector:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(ASCDefaults *)self setObject:v4 forKey:@"ASCEnableWebInspector"];
}

- (BOOL)forceStandaloneWatch
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCForceStandaloneWatch"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)setForceStandaloneWatch:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(ASCDefaults *)self setObject:v4 forKey:@"ASCForceStandaloneWatch"];
}

- (NSString)debugPackageURL
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCDebugJavaScriptPackageURL"];
  id v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (void)setDebugPackageURL:(id)a3
{
}

- (BOOL)preferInternalJS
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCPreferInternalJS"];
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)setPreferInternalJS:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(ASCDefaults *)self setObject:v4 forKey:@"ASCPreferInternalJS"];
}

- (NSString)jsVersion
{
  objc_opt_class();
  v3 = [(ASCDefaults *)self objectForKey:@"ASCJavaScriptVersion"];
  id v4 = v3;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (void)setJsVersion:(id)a3
{
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCDefaults *)self bundleID];
  [(ASCHasher *)v3 combineObject:v4];

  unint64_t v5 = [(ASCHasher *)v3 finalizeHash];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v6 = v5;
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCDefaults *)self bundleID];
    uint64_t v9 = [v7 bundleID];
    id v10 = (void *)v9;
    if (v8 && v9) {
      unsigned __int8 v11 = [v8 isEqual:v9];
    }
    else {
      unsigned __int8 v11 = v8 == (void *)v9;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCDefaults *)self bundleID];
  [(ASCDescriber *)v3 addObject:v4 withName:@"bundleID"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSCache)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_cachedValues, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end