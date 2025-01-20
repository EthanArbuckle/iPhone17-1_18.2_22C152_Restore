@interface ENAppConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)appConfigurationForRegion:(id)a3 withInfo:(id)a4;
- (BOOL)exposureMatching;
- (ENAppConfiguration)initWithCoder:(id)a3;
- (ENAppConfiguration)initWithRegion:(id)a3 andAppConfigInfo:(id)a4;
- (NSString)appID;
- (NSString)publicKey;
- (NSString)publicKeyVersion;
- (NSString)regionID;
- (double)callbackIntervalInMin;
- (double)lastCachedEpochTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)maxMatchingAttempts;
- (int64_t)maxTtkMatchAttempt;
- (int64_t)maxTtkMatchAttemptPerDay;
- (void)encodeWithCoder:(id)a3;
- (void)setAppID:(id)a3;
- (void)setCallbackIntervalInMin:(double)a3;
- (void)setExposureMatching:(BOOL)a3;
- (void)setLastCachedEpochTimeInterval:(double)a3;
- (void)setMaxMatchingAttempts:(int64_t)a3;
- (void)setMaxTtkMatchAttempt:(int64_t)a3;
- (void)setMaxTtkMatchAttemptPerDay:(int64_t)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyVersion:(id)a3;
- (void)setRegionID:(id)a3;
@end

@implementation ENAppConfiguration

- (ENAppConfiguration)initWithRegion:(id)a3 andAppConfigInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ENAppConfiguration;
  v8 = [(ENAppConfiguration *)&v20 init];
  v9 = v8;
  if (v8)
  {
    [(ENAppConfiguration *)v8 setRegionID:v6];
    v10 = [v7 objectForKeyedSubscript:@"appBundleId"];
    [(ENAppConfiguration *)v9 setAppID:v10];

    v11 = [v7 objectForKeyedSubscript:@"publicKey"];
    [(ENAppConfiguration *)v9 setPublicKey:v11];

    v12 = [v7 objectForKeyedSubscript:@"publicKeyVersion"];
    [(ENAppConfiguration *)v9 setPublicKeyVersion:v12];

    v13 = [v7 objectForKeyedSubscript:@"exposureMatching"];
    -[ENAppConfiguration setExposureMatching:](v9, "setExposureMatching:", [v13 BOOLValue]);

    v14 = [v7 objectForKeyedSubscript:@"maxMatchingAttempts"];
    -[ENAppConfiguration setMaxMatchingAttempts:](v9, "setMaxMatchingAttempts:", [v14 integerValue]);

    v15 = [v7 objectForKeyedSubscript:@"maxTtkMatchAttempt"];
    -[ENAppConfiguration setMaxTtkMatchAttempt:](v9, "setMaxTtkMatchAttempt:", [v15 integerValue]);

    v16 = [v7 objectForKeyedSubscript:@"maxTtkMatchAttemptPerDay"];
    -[ENAppConfiguration setMaxTtkMatchAttemptPerDay:](v9, "setMaxTtkMatchAttemptPerDay:", [v16 integerValue]);

    v17 = [v7 objectForKeyedSubscript:@"callbackIntervalInMin"];
    [v17 doubleValue];
    -[ENAppConfiguration setCallbackIntervalInMin:](v9, "setCallbackIntervalInMin:");

    v18 = [MEMORY[0x1E4F1C9C0] date];
    [v18 timeIntervalSince1970];
    -[ENAppConfiguration setLastCachedEpochTimeInterval:](v9, "setLastCachedEpochTimeInterval:");
  }
  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F29020];
  v4 = [(ENAppConfiguration *)self regionID];
  v5 = [(ENAppConfiguration *)self appID];
  id v6 = [(ENAppConfiguration *)self publicKey];
  id v7 = [(ENAppConfiguration *)self publicKeyVersion];
  BOOL v8 = [(ENAppConfiguration *)self exposureMatching];
  int64_t v9 = [(ENAppConfiguration *)self maxMatchingAttempts];
  int64_t v10 = [(ENAppConfiguration *)self maxTtkMatchAttempt];
  int64_t v11 = [(ENAppConfiguration *)self maxTtkMatchAttemptPerDay];
  [(ENAppConfiguration *)self callbackIntervalInMin];
  uint64_t v13 = v12;
  [(ENAppConfiguration *)self lastCachedEpochTimeInterval];
  v15 = [v3 stringWithFormat:@"ENAppConfiguration - RegionID: %@, App ID: %@, Public Key: %@, Public Key Version: %@, exposureMatching: %i, maxMatchingAttempts: %ld, maxTtkMatchAttempt: %ld, maxTtkMatchAttemptPerDay: %ld, callbackIntervalInMin: %f, lastCachedEpochTimeInterval: %f", v4, v5, v6, v7, v8, v9, v10, v11, v13, v14];

  return v15;
}

+ (id)appConfigurationForRegion:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ENAppConfiguration alloc] initWithRegion:v6 andAppConfigInfo:v5];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ENAppConfiguration allocWithZone:a3] init];
  id v5 = [(ENAppConfiguration *)self appID];
  [(ENAppConfiguration *)v4 setAppID:v5];

  id v6 = [(ENAppConfiguration *)self regionID];
  [(ENAppConfiguration *)v4 setRegionID:v6];

  id v7 = [(ENAppConfiguration *)self publicKey];
  [(ENAppConfiguration *)v4 setPublicKey:v7];

  BOOL v8 = [(ENAppConfiguration *)self publicKeyVersion];
  [(ENAppConfiguration *)v4 setPublicKeyVersion:v8];

  [(ENAppConfiguration *)v4 setExposureMatching:[(ENAppConfiguration *)self exposureMatching]];
  [(ENAppConfiguration *)v4 setMaxMatchingAttempts:[(ENAppConfiguration *)self maxMatchingAttempts]];
  [(ENAppConfiguration *)v4 setMaxTtkMatchAttempt:[(ENAppConfiguration *)self maxTtkMatchAttempt]];
  [(ENAppConfiguration *)v4 setMaxTtkMatchAttemptPerDay:[(ENAppConfiguration *)self maxTtkMatchAttemptPerDay]];
  [(ENAppConfiguration *)self callbackIntervalInMin];
  -[ENAppConfiguration setCallbackIntervalInMin:](v4, "setCallbackIntervalInMin:");
  [(ENAppConfiguration *)self lastCachedEpochTimeInterval];
  -[ENAppConfiguration setLastCachedEpochTimeInterval:](v4, "setLastCachedEpochTimeInterval:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ENAppConfiguration *)self appID];
  id v6 = NSStringFromSelector(sel_appID);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(ENAppConfiguration *)self regionID];
  BOOL v8 = NSStringFromSelector(sel_regionID);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(ENAppConfiguration *)self publicKey];
  int64_t v10 = NSStringFromSelector(sel_publicKey);
  [v4 encodeObject:v9 forKey:v10];

  int64_t v11 = [(ENAppConfiguration *)self publicKeyVersion];
  uint64_t v12 = NSStringFromSelector(sel_publicKeyVersion);
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = [(ENAppConfiguration *)self exposureMatching];
  uint64_t v14 = NSStringFromSelector(sel_exposureMatching);
  [v4 encodeBool:v13 forKey:v14];

  int64_t v15 = [(ENAppConfiguration *)self maxMatchingAttempts];
  v16 = NSStringFromSelector(sel_maxMatchingAttempts);
  [v4 encodeInteger:v15 forKey:v16];

  int64_t v17 = [(ENAppConfiguration *)self maxTtkMatchAttempt];
  v18 = NSStringFromSelector(sel_maxTtkMatchAttempt);
  [v4 encodeInteger:v17 forKey:v18];

  int64_t v19 = [(ENAppConfiguration *)self maxTtkMatchAttemptPerDay];
  objc_super v20 = NSStringFromSelector(sel_maxTtkMatchAttemptPerDay);
  [v4 encodeInteger:v19 forKey:v20];

  [(ENAppConfiguration *)self callbackIntervalInMin];
  double v22 = v21;
  v23 = NSStringFromSelector(sel_callbackIntervalInMin);
  [v4 encodeDouble:v23 forKey:v22];

  [(ENAppConfiguration *)self lastCachedEpochTimeInterval];
  double v25 = v24;
  NSStringFromSelector(sel_lastCachedEpochTimeInterval);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeDouble:v26 forKey:v25];
}

- (ENAppConfiguration)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)ENAppConfiguration;
  id v3 = a3;
  id v4 = [(ENAppConfiguration *)&v26 init];
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_appID);
  id v7 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, v6, v26.receiver, v26.super_class);
  [(ENAppConfiguration *)v4 setAppID:v7];

  uint64_t v8 = objc_opt_class();
  int64_t v9 = NSStringFromSelector(sel_regionID);
  int64_t v10 = [v3 decodeObjectOfClass:v8 forKey:v9];
  [(ENAppConfiguration *)v4 setRegionID:v10];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = NSStringFromSelector(sel_publicKey);
  BOOL v13 = [v3 decodeObjectOfClass:v11 forKey:v12];
  [(ENAppConfiguration *)v4 setPublicKey:v13];

  uint64_t v14 = objc_opt_class();
  int64_t v15 = NSStringFromSelector(sel_publicKeyVersion);
  v16 = [v3 decodeObjectOfClass:v14 forKey:v15];
  [(ENAppConfiguration *)v4 setPublicKeyVersion:v16];

  int64_t v17 = NSStringFromSelector(sel_exposureMatching);
  -[ENAppConfiguration setExposureMatching:](v4, "setExposureMatching:", [v3 decodeBoolForKey:v17]);

  v18 = NSStringFromSelector(sel_maxMatchingAttempts);
  -[ENAppConfiguration setMaxMatchingAttempts:](v4, "setMaxMatchingAttempts:", [v3 decodeIntegerForKey:v18]);

  int64_t v19 = NSStringFromSelector(sel_maxTtkMatchAttempt);
  -[ENAppConfiguration setMaxTtkMatchAttempt:](v4, "setMaxTtkMatchAttempt:", [v3 decodeIntegerForKey:v19]);

  objc_super v20 = NSStringFromSelector(sel_maxTtkMatchAttemptPerDay);
  -[ENAppConfiguration setMaxTtkMatchAttemptPerDay:](v4, "setMaxTtkMatchAttemptPerDay:", [v3 decodeIntegerForKey:v20]);

  double v21 = NSStringFromSelector(sel_callbackIntervalInMin);
  [v3 decodeDoubleForKey:v21];
  -[ENAppConfiguration setCallbackIntervalInMin:](v4, "setCallbackIntervalInMin:");

  double v22 = NSStringFromSelector(sel_lastCachedEpochTimeInterval);
  [v3 decodeDoubleForKey:v22];
  double v24 = v23;

  [(ENAppConfiguration *)v4 setLastCachedEpochTimeInterval:v24];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)regionID
{
  return self->_regionID;
}

- (void)setRegionID:(id)a3
{
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (void)setPublicKeyVersion:(id)a3
{
}

- (BOOL)exposureMatching
{
  return self->_exposureMatching;
}

- (void)setExposureMatching:(BOOL)a3
{
  self->_exposureMatching = a3;
}

- (int64_t)maxMatchingAttempts
{
  return self->_maxMatchingAttempts;
}

- (void)setMaxMatchingAttempts:(int64_t)a3
{
  self->_maxMatchingAttempts = a3;
}

- (int64_t)maxTtkMatchAttempt
{
  return self->_maxTtkMatchAttempt;
}

- (void)setMaxTtkMatchAttempt:(int64_t)a3
{
  self->_maxTtkMatchAttempt = a3;
}

- (int64_t)maxTtkMatchAttemptPerDay
{
  return self->_maxTtkMatchAttemptPerDay;
}

- (void)setMaxTtkMatchAttemptPerDay:(int64_t)a3
{
  self->_maxTtkMatchAttemptPerDay = a3;
}

- (double)callbackIntervalInMin
{
  return self->_callbackIntervalInMin;
}

- (void)setCallbackIntervalInMin:(double)a3
{
  self->_callbackIntervalInMin = a3;
}

- (double)lastCachedEpochTimeInterval
{
  return self->_lastCachedEpochTimeInterval;
}

- (void)setLastCachedEpochTimeInterval:(double)a3
{
  self->_lastCachedEpochTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_regionID, 0);

  objc_storeStrong((id *)&self->_appID, 0);
}

@end