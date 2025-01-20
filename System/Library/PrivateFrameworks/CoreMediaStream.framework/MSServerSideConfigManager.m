@interface MSServerSideConfigManager
+ (double)doubleValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(double)a5;
+ (id)configManagerForPersonID:(id)a3;
+ (id)existingConfigManagerForPersonID:(id)a3;
+ (id)objectForKey:(id)a3 forPersonID:(id)a4 defaultValue:(id)a5;
+ (int)intValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int)a5;
+ (int64_t)longLongValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int64_t)a5;
+ (int64_t)longValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int64_t)a5;
+ (void)abortAllActivities;
+ (void)forgetPersonID:(id)a3;
- (MSMediaStreamDaemon)daemon;
- (MSServerSideConfigManager)initWithPersonID:(id)a3 baseURL:(id)a4;
- (NSDictionary)config;
- (NSString)personID;
- (void)abort;
- (void)dealloc;
- (void)refreshConfiguration;
- (void)serverSideConfigProtocol:(id)a3 didFinishWithConfiguration:(id)a4 error:(id)a5;
- (void)serverSideConfigProtocol:(id)a3 didReceiveAuthenticationError:(id)a4;
- (void)setConfig:(id)a3;
- (void)setDaemon:(id)a3;
@end

@implementation MSServerSideConfigManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)serverSideConfigProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = [a4 MSVerboseDescription];
    int v9 = 138543362;
    v10 = v8;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to retrieve configuration due to authentication error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  daemon = self->_daemon;
  v7 = [(MSServerSideConfigManager *)self personID];
  [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v7];

  [(MSDaemon *)self->_daemon releaseBusy];
  self->_state = 0;
}

- (void)serverSideConfigProtocol:(id)a3 didFinishWithConfiguration:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v10 MSVerboseDescription];
    int v14 = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Finished retrieving server-side configuration: %{public}@, error: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (!v10)
  {
    daemon = self->_daemon;
    v13 = [(MSServerSideConfigManager *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v13];

    [(MSServerSideConfigManager *)self setConfig:v9];
  }
  [(MSDaemon *)self->_daemon releaseBusy];
  self->_state = 0;
}

- (void)abort
{
  if (self->_state == 2)
  {
    [(MSServerSideConfigProtocol *)self->_protocol abort];
    [(MSDaemon *)self->_daemon releaseBusy];
  }
  self->_state = 0;
}

- (void)refreshConfiguration
{
  int state = self->_state;
  if (state != 1)
  {
    if (state) {
      return;
    }
    [(MSDaemon *)self->_daemon retainBusy];
    self->_int state = 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Refreshing server-side configuration.", v4, 2u);
  }
  self->_int state = 2;
  [(MSServerSideConfigProtocol *)self->_protocol queryConfiguration];
}

- (void)setConfig:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  config = self->_config;
  if (!config || ![(NSDictionary *)config isEqualToDictionary:v5])
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = v7;
    if (v5)
    {
      id v9 = [(NSString *)self->_configPath stringByDeletingLastPathComponent];
      [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

      id v18 = 0;
      id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v18];
      id v11 = v18;
      if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to archive config, error: %@", buf, 0xCu);
      }
      if (([v10 writeToFile:self->_configPath atomically:1] & 1) == 0
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Cannot save config.", buf, 2u);
      }
    }
    else
    {
      [v7 removeItemAtPath:self->_configPath error:0];
    }
    objc_storeStrong((id *)&self->_config, a3);
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    int v14 = [(MSServerSideConfigManager *)self personID];
    id v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"personID", 0);
    [v12 postNotificationName:@"MSServerSideConfigChanged" object:self userInfo:v15];

    daemon = self->_daemon;
    v17 = [(MSServerSideConfigManager *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveNewServerSideConfigurationForPersonID:v17];
  }
}

- (NSDictionary)config
{
  config = self->_config;
  if (config
    || ([MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithFile:self->_configPath outError:0],
        v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
        id v5 = self->_config,
        self->_config = v4,
        v5,
        (config = self->_config) != 0))
  {
    v6 = config;
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v6;
}

- (void)dealloc
{
  [(MSServerSideConfigManager *)self abort];
  v3.receiver = self;
  v3.super_class = (Class)MSServerSideConfigManager;
  [(MSServerSideConfigManager *)&v3 dealloc];
}

- (MSServerSideConfigManager)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSServerSideConfigManager;
  id v9 = [(MSServerSideConfigManager *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personID, a3);
    id v11 = [[MSServerSideConfigProtocol alloc] initWithPersonID:v7 baseURL:v8];
    protocol = v10->_protocol;
    v10->_protocol = v11;

    [(MSServerSideConfigProtocol *)v10->_protocol setDelegate:v10];
    uint64_t v13 = MSPathServerSideConfigPathForPersonID(v7);
    configPath = v10->_configPath;
    v10->_configPath = (NSString *)v13;
  }
  return v10;
}

+ (id)objectForKey:(id)a3 forPersonID:(id)a4 defaultValue:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = MSPlatform();
  id v11 = [v10 theDaemon];
  v12 = [v11 serverSideConfigurationForPersonID:v8];
  uint64_t v13 = [v12 objectForKey:v7];

  int v14 = v9;
  if (v13)
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    int v14 = v13;
    if (v15)
    {
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v7;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for key %{public}@. Value: %{public}@", (uint8_t *)&v18, 0x20u);
      int v14 = v13;
    }
  }
  id v16 = v14;

  return v16;
}

+ (int64_t)longLongValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = MSPlatform();
  id v10 = [v9 theDaemon];
  id v11 = [v10 serverSideConfigurationForPersonID:v8];
  v12 = [v11 objectForKey:v7];

  if (v12)
  {
    if (objc_opt_respondsToSelector())
    {
      a5 = [v12 longLongValue];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412802;
        id v15 = v8;
        __int16 v16 = 2114;
        id v17 = v7;
        __int16 v18 = 2048;
        int64_t v19 = a5;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %lld", (uint8_t *)&v14, 0x20u);
      }
    }
  }

  return a5;
}

+ (int64_t)longValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = MSPlatform();
  id v10 = [v9 theDaemon];
  id v11 = [v10 serverSideConfigurationForPersonID:v8];
  v12 = [v11 objectForKey:v7];

  if (v12)
  {
    if (objc_opt_respondsToSelector())
    {
      a5 = [v12 longValue];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412802;
        id v15 = v8;
        __int16 v16 = 2114;
        id v17 = v7;
        __int16 v18 = 2048;
        int64_t v19 = a5;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %ld", (uint8_t *)&v14, 0x20u);
      }
    }
  }

  return a5;
}

+ (double)doubleValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(double)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = MSPlatform();
  id v10 = [v9 theDaemon];
  id v11 = [v10 serverSideConfigurationForPersonID:v8];
  v12 = [v11 objectForKey:v7];

  if (v12)
  {
    if (objc_opt_respondsToSelector())
    {
      [v12 doubleValue];
      a5 = v13;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412802;
        id v16 = v8;
        __int16 v17 = 2114;
        id v18 = v7;
        __int16 v19 = 2048;
        double v20 = a5;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %f", (uint8_t *)&v15, 0x20u);
      }
    }
  }

  return a5;
}

+ (int)intValueForParameter:(id)a3 forPersonID:(id)a4 defaultValue:(int)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = MSPlatform();
  id v10 = [v9 theDaemon];
  id v11 = [v10 serverSideConfigurationForPersonID:v8];
  v12 = [v11 objectForKey:v7];

  if (v12)
  {
    if (objc_opt_respondsToSelector())
    {
      a5 = [v12 intValue];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412802;
        id v15 = v8;
        __int16 v16 = 2114;
        id v17 = v7;
        __int16 v18 = 1024;
        int v19 = a5;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PersonID %@ using server-side value for parameter %{public}@. Value: %d", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }

  return a5;
}

+ (void)forgetPersonID:(id)a3
{
  id v5 = a3;
  objc_super v3 = objc_msgSend((id)_configManagerByID, "objectForKey:");
  v4 = v3;
  if (v3)
  {
    [v3 abort];
    [(id)_configManagerByID removeObjectForKey:v5];
  }
}

+ (void)abortAllActivities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_configManagerByID, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) abort];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)existingConfigManagerForPersonID:(id)a3
{
  return (id)[(id)_configManagerByID objectForKey:a3];
}

+ (id)configManagerForPersonID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)_configManagerByID;
    if (!_configManagerByID)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v6 = (void *)_configManagerByID;
      _configManagerByID = (uint64_t)v5;

      uint64_t v4 = (void *)_configManagerByID;
    }
    long long v7 = [v4 objectForKey:v3];
    if (!v7)
    {
      long long v8 = [MSServerSideConfigManager alloc];
      long long v9 = MSPlatform();
      long long v10 = [v9 baseURLForPersonID:v3];
      long long v7 = [(MSServerSideConfigManager *)v8 initWithPersonID:v3 baseURL:v10];

      [(id)_configManagerByID setObject:v7 forKey:v3];
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

@end