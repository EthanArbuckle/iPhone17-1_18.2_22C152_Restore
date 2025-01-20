@interface CPLConfigurationDictionary
- (BOOL)isStale;
- (BOOL)matchesConfigurationDictionary:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (CPLConfigurationDictionary)initWithConfiguration:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 lastUpdateDate:(id)a6;
- (CPLConfigurationDictionary)initWithConfigurationName:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5;
- (CPLConfigurationDictionary)initWithContentsOfURL:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 error:(id *)a6;
- (CPLConfigurationDictionary)initWithData:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 error:(id *)a6;
- (NSDate)lastUpdateDate;
- (NSString)refreshIntervalKey;
- (double)minRefreshInterval;
- (double)refreshInterval;
- (id)copyConfigurationDictionaryWithUpdatedDate;
- (id)copyConfigurationDictionaryWithUpdatedKey:(id)a3 value:(id)a4;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation CPLConfigurationDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_refreshIntervalKey, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (double)minRefreshInterval
{
  return self->_minRefreshInterval;
}

- (NSString)refreshIntervalKey
{
  return self->_refreshIntervalKey;
}

- (id)copyConfigurationDictionaryWithUpdatedKey:(id)a3 value:(id)a4
{
  configuration = self->_configuration;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[(NSDictionary *)configuration mutableCopy];
  [v9 setObject:v7 forKeyedSubscript:v8];

  v10 = [CPLConfigurationDictionary alloc];
  refreshIntervalKey = self->_refreshIntervalKey;
  double minRefreshInterval = self->_minRefreshInterval;
  v13 = [MEMORY[0x1E4F1C9C8] date];
  v14 = [(CPLConfigurationDictionary *)v10 initWithConfiguration:v9 refreshIntervalKey:refreshIntervalKey minRefreshInterval:v13 lastUpdateDate:minRefreshInterval];

  return v14;
}

- (id)copyConfigurationDictionaryWithUpdatedDate
{
  v3 = [CPLConfigurationDictionary alloc];
  configuration = self->_configuration;
  refreshIntervalKey = self->_refreshIntervalKey;
  double minRefreshInterval = self->_minRefreshInterval;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [(CPLConfigurationDictionary *)v3 initWithConfiguration:configuration refreshIntervalKey:refreshIntervalKey minRefreshInterval:v7 lastUpdateDate:minRefreshInterval];

  return v8;
}

- (BOOL)matchesConfigurationDictionary:(id)a3
{
  return [(NSDictionary *)self->_configuration isEqualToDictionary:*((void *)a3 + 1)];
}

- (int64_t)compare:(id)a3
{
  lastUpdateDate = self->_lastUpdateDate;
  uint64_t v4 = *((void *)a3 + 4);
  if (lastUpdateDate)
  {
    if (v4) {
      return -[NSDate compare:](lastUpdateDate, "compare:");
    }
    else {
      return 1;
    }
  }
  else if (v4)
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)isStale
{
  if (!self->_lastUpdateDate) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  if ([(NSDate *)self->_lastUpdateDate compare:v3] == NSOrderedDescending)
  {
    BOOL v4 = 1;
  }
  else
  {
    [v3 timeIntervalSinceDate:self->_lastUpdateDate];
    double v6 = v5;
    [(CPLConfigurationDictionary *)self refreshInterval];
    BOOL v4 = v6 > v7;
  }

  return v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_configuration objectForKeyedSubscript:a3];
}

- (double)refreshInterval
{
  v3 = [(NSDictionary *)self->_configuration objectForKeyedSubscript:self->_refreshIntervalKey];
  [v3 doubleValue];
  double minRefreshInterval = self->_minRefreshInterval;
  if (v4 >= minRefreshInterval)
  {
    double minRefreshInterval = v4;
    if (v4 > 86400.0) {
      double minRefreshInterval = 86400.0;
    }
  }

  return minRefreshInterval;
}

- (unint64_t)hash
{
  return [(NSDate *)self->_lastUpdateDate hash];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  lastUpdateDate = self->_lastUpdateDate;
  if (lastUpdateDate)
  {
    configuration = self->_configuration;
    v26[0] = @"configuration";
    v26[1] = @"lastUpdate";
    v27[0] = configuration;
    v27[1] = lastUpdateDate;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = (NSDictionary **)v27;
    v11 = (__CFString **)v26;
    uint64_t v12 = 2;
  }
  else
  {
    v13 = self->_configuration;
    v24 = @"configuration";
    v25 = v13;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = &v25;
    v11 = &v24;
    uint64_t v12 = 1;
  }
  v14 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
  v15 = (void *)MEMORY[0x1BA993DF0]();
  id v23 = 0;
  v16 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:&v23];
  id v17 = v23;
  id v18 = v17;
  if (v16)
  {
    id v22 = v17;
    int v19 = [v16 writeToURL:v6 options:1 error:&v22];
    id v20 = v22;

    if (a4 && v19)
    {
      id v18 = v20;
      *a4 = v18;
      LOBYTE(v19) = 1;
    }
    else
    {
      id v18 = v20;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (CPLConfigurationDictionary)initWithContentsOfURL:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v10 error:a6];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 objectForKeyedSubscript:@"configuration"];
    if (v14)
    {
      v15 = [v13 objectForKeyedSubscript:@"lastUpdate"];
      v16 = [(CPLConfigurationDictionary *)self initWithConfiguration:v14 refreshIntervalKey:v11 minRefreshInterval:v15 lastUpdateDate:a5];
    }
    else
    {
      v15 = [v10 lastPathComponent];
      v16 = [(CPLConfigurationDictionary *)self initWithConfigurationName:v15 refreshIntervalKey:v11 minRefreshInterval:a5];
    }
    self = v16;

    id v17 = self;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (CPLConfigurationDictionary)initWithData:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:a6];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    self = [(CPLConfigurationDictionary *)self initWithConfiguration:v11 refreshIntervalKey:v10 minRefreshInterval:v12 lastUpdateDate:a5];

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CPLConfigurationDictionary)initWithConfigurationName:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 URLForResource:v9 withExtension:0];

  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      id v17 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        *(_DWORD *)buf = 138412546;
        v30 = v18;
        __int16 v31 = 2112;
        id v32 = (id)objc_opt_class();
        id v19 = v32;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Can't find configuration in %@ for %@", buf, 0x16u);
      }
    }
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfigurationDictionary.m"];
    id v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v20 handleFailureInMethod:a2, self, v21, 52, @"Can't find configuration in %@ for %@", v22, objc_opt_class() object file lineNumber description];

    abort();
  }
  id v28 = 0;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v12 error:&v28];
  id v14 = v28;
  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      id v23 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [v12 path];
        *(_DWORD *)buf = 138412546;
        v30 = v24;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Unable to load configuration from %@: %@", buf, 0x16u);
      }
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfigurationDictionary.m"];
    v27 = [v12 path];
    [v25 handleFailureInMethod:a2, self, v26, 55, @"Unable to load configuration from %@: %@", v27, v14 object file lineNumber description];

    abort();
  }
  v15 = [(CPLConfigurationDictionary *)self initWithConfiguration:v13 refreshIntervalKey:v10 minRefreshInterval:0 lastUpdateDate:a5];

  return v15;
}

- (CPLConfigurationDictionary)initWithConfiguration:(id)a3 refreshIntervalKey:(id)a4 minRefreshInterval:(double)a5 lastUpdateDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CPLConfigurationDictionary;
  v13 = [(CPLConfigurationDictionary *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    configuration = v13->_configuration;
    v13->_configuration = (NSDictionary *)v14;

    uint64_t v16 = [v11 copy];
    refreshIntervalKey = v13->_refreshIntervalKey;
    v13->_refreshIntervalKey = (NSString *)v16;

    v13->_double minRefreshInterval = a5;
    [(NSDate *)v13->_lastUpdateDate timeIntervalSinceNow];
    if (v18 <= 0.0) {
      uint64_t v19 = [v12 copy];
    }
    else {
      uint64_t v19 = 0;
    }
    lastUpdateDate = v13->_lastUpdateDate;
    v13->_lastUpdateDate = (NSDate *)v19;
  }
  return v13;
}

@end