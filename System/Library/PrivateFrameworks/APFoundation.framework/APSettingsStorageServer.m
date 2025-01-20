@interface APSettingsStorageServer
+ (id)baseServerURL;
- (APSettingsStorageServer)initWithDefaultValues:(id)a3;
- (APSettingsStorageServer)initWithURL:(id)a3 headers:(id)a4 defaultValues:(id)a5;
- (APUnfairLock)lock;
- (BOOL)didFetchFromServer;
- (NSDate)lastUpdate;
- (NSDictionary)defaults;
- (NSDictionary)headers;
- (NSDictionary)serverData;
- (NSURL)url;
- (id)valueForKey:(id)a3;
- (id)valueForKey:(id)a3 error:(id *)a4;
- (void)fetchNewServerData;
- (void)retrieveServerData;
- (void)setDidFetchFromServer:(BOOL)a3;
- (void)setLastUpdate:(id)a3;
- (void)setLock:(id)a3;
- (void)setServerData:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
@end

@implementation APSettingsStorageServer

+ (id)baseServerURL
{
  if (!+[APSystemInternal isAppleInternalInstall])
  {
    v4 = @"https://iadsdk.apple.com/adserver/";
    v3 = 0;
    goto LABEL_14;
  }
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AdPlatforms"];
  v3 = [v2 stringForKey:@"ServerEnvironment"];

  v4 = @"https://iadsdk.apple.com/adserver/";
  if (v3 && ([v3 isEqualToString:@"Production"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"QE1"])
    {
      v5 = kAPServerEnvironmentQE1BaseURL;
    }
    else if ([v3 isEqualToString:@"QE2"])
    {
      v5 = kAPServerEnvironmentQE2BaseURL;
    }
    else if ([v3 isEqualToString:@"QE3"])
    {
      v5 = kAPServerEnvironmentQE3BaseURL;
    }
    else
    {
      if (![v3 isEqualToString:@"QE4"]) {
        goto LABEL_14;
      }
      v5 = kAPServerEnvironmentQE4BaseURL;
    }
    v6 = *v5;

    v4 = v6;
  }
LABEL_14:
  v7 = [NSString stringWithFormat:@"%@%@", v4, @"2/client/configuration"];
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v8;
}

- (APSettingsStorageServer)initWithDefaultValues:(id)a3
{
  v4 = APLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_INFO, "This is a no-op. Please use initWithURL:headers:defaultValues: instead.", v6, 2u);
  }

  return self;
}

- (void)fetchNewServerData
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(APSettingsStorageServer *)self url];
  v4 = [v3 absoluteString];
  v5 = [v4 sha256hash];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [(APSettingsStorageServer *)self lastUpdate];
  if (v7) {
    goto LABEL_2;
  }
  v9 = [[APStorageManager alloc] initWithPathPrefix:@"s/s"];
  id v27 = 0;
  uint64_t v10 = [(APStorageManager *)v9 fileExistsAtPath:v5 error:&v27];
  id v11 = v27;
  v12 = v11;
  if ((v10 & 1) == 0)
  {

    v7 = 0;
    goto LABEL_12;
  }
  id v26 = v11;
  v7 = [(APStorageManager *)v9 lastModifiedDateForFileAtPath:v5 error:&v26];
  id v13 = v26;

  if (v13)
  {
    v14 = APLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_ERROR, "Error getting timestamp of file %{private}@. Error: %{public}@", buf, 0x16u);
    }
  }
  if (!v7)
  {
LABEL_12:
    v15 = objc_opt_class();
    objc_sync_enter(v15);
    if (qword_1EB7897B0)
    {
      if ([(id)qword_1EB7897B0 containsObject:v3])
      {
        objc_sync_exit(v15);

        goto LABEL_18;
      }
      [(id)qword_1EB7897B0 addObject:v3];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithObject:v3];
      v17 = (void *)qword_1EB7897B0;
      qword_1EB7897B0 = v16;
    }
    objc_sync_exit(v15);

    v18 = [(APSettingsStorageServer *)self headers];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v29 = sub_1D70BCCC0;
    v30 = sub_1D70BCCD0;
    v19 = +[APNetworkClient sharedAPNetworkClient];
    id v31 = [v19 temporarySessionForDaemon];

    v20 = *(void **)(*(void *)&buf[8] + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1D70BCCD8;
    v22[3] = &unk_1E6A6B3E8;
    v22[4] = self;
    id v23 = v5;
    id v24 = v3;
    v25 = buf;
    id v21 = (id)[v20 GET:v24 headers:v18 withCompletionHandler:v22];

    _Block_object_dispose(buf, 8);
    goto LABEL_18;
  }
LABEL_2:
  [v6 timeIntervalSinceDate:v7];
  if (v8 > 3600.0) {
    goto LABEL_12;
  }
  [(APSettingsStorageServer *)self setDidFetchFromServer:0];
LABEL_18:
}

- (void)retrieveServerData
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [[APStorageManager alloc] initWithPathPrefix:@"s/s"];
  v4 = [(APSettingsStorageServer *)self url];
  v5 = [v4 absoluteString];
  v6 = [v5 sha256hash];
  id v13 = 0;
  BOOL v7 = [(APStorageManager *)v3 fileExistsAtPath:v6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = APLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v15 = v6;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "Error determining status of file %{private}@. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if (v7)
  {
    uint64_t v10 = [(APSettingsStorageServer *)self lock];
    [v10 lock];
    id v12 = 0;
    id v11 = [(APStorageManager *)v3 objectStoredAtPath:v6 error:&v12];
    id v9 = v12;
    [(APSettingsStorageServer *)self setServerData:v11];

    [v10 unlock];
LABEL_6:
  }
  [(APSettingsStorageServer *)self fetchNewServerData];
}

- (APSettingsStorageServer)initWithURL:(id)a3 headers:(id)a4 defaultValues:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APSettingsStorageServer;
  id v12 = [(APSettingsStorageServer *)&v19 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_headers, a4);
    uint64_t v14 = [v11 copy];
    defaults = v13->_defaults;
    v13->_defaults = (NSDictionary *)v14;

    v13->_didFetchFromServer = 1;
    __int16 v16 = [[APUnfairLock alloc] initWithOptions:1];
    lock = v13->_lock;
    v13->_lock = v16;

    [(APSettingsStorageServer *)v13 retrieveServerData];
  }

  return v13;
}

- (id)valueForKey:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_valueForKey_error_);
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  v5 = [a3 lastNamespacedComponent];
  v6 = [(APSettingsStorageServer *)self lock];
  [v6 lock];
  BOOL v7 = [(APSettingsStorageServer *)self serverData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(APSettingsStorageServer *)self serverData];
    id v10 = [v9 objectForKey:v5];

    [v6 unlock];
    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {
    [v6 unlock];
  }
  id v11 = [(APSettingsStorageServer *)self defaults];
  id v10 = [v11 objectForKey:v5];

  if (!v10)
  {
    id v12 = APLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "Request for server data not complete and no default values provided. Try again later.", v14, 2u);
    }

    id v10 = 0;
  }
LABEL_9:

  return v10;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (void)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  objc_msgSend(NSString, "stringWithFormat:", @"Settings with server storage is read only. You should not be trying to overwrite server provided data. Now generating simulated crash.", a4, a5);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  APSimulateCrash(5, v5, 0);
}

- (BOOL)didFetchFromServer
{
  return self->_didFetchFromServer;
}

- (void)setDidFetchFromServer:(BOOL)a3
{
  self->_didFetchFromServer = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
}

- (NSDictionary)defaults
{
  return self->_defaults;
}

- (NSDictionary)serverData
{
  return self->_serverData;
}

- (void)setServerData:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_serverData, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end