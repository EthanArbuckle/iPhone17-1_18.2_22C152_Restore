@interface SSUInstalledAppProviderDevice
- (NSString)locale;
- (SSUInstalledAppProviderDevice)initWithLocale:(id)a3;
- (id)applicationInfoFromAppRecord:(id)a3;
- (id)lookupAllSSUEnabledApps;
- (id)lookupSSUEnabledAppByBundleId:(id)a3;
@end

@implementation SSUInstalledAppProviderDevice

- (void).cxx_destruct
{
}

- (NSString)locale
{
  return self->_locale;
}

- (id)applicationInfoFromAppRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  if (v5 && ([v4 isPlaceholder] & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x263F086E0]);
    v8 = [v4 URL];
    v9 = (void *)[v7 _initUniqueWithURL:v8];
    v10 = [v9 SSUAssetPathForLocale:self->_locale];

    if (v10)
    {
      locale = self->_locale;
      id v19 = 0;
      v6 = [MEMORY[0x263F71FC0] applicationInfoWithBundleIdentifier:v5 assetURL:v10 forLocale:locale error:&v19];
      id v12 = v19;
      v13 = CDMOSLoggerForCategory(0);
      v14 = v13;
      if (v6)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v17 = [v6 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          v21 = "-[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:]";
          __int16 v22 = 2112;
          v23 = v17;
          _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s Found SSU-enabled app: %@", buf, 0x16u);
        }
        id v15 = v6;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v18 = +[CDMPlatformUtils prettyPrintError:v12];
          *(_DWORD *)buf = 136315906;
          v21 = "-[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:]";
          __int16 v22 = 2112;
          v23 = v5;
          __int16 v24 = 2112;
          v25 = v10;
          __int16 v26 = 2112;
          v27 = v18;
          _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to build SNLPSSUApplicationInfo instance for bundle ID=%@ and app asset URL=%@: %@. Ignoring app.", buf, 0x2Au);
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)lookupAllSSUEnabledApps
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SSUInstalledAppProviderDevice lookupAllSSUEnabledApps]";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Looking up all installed SSU-enabled apps.", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 136315650;
    long long v18 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = -[SSUInstalledAppProviderDevice applicationInfoFromAppRecord:](self, "applicationInfoFromAppRecord:", *(void *)(*((void *)&v20 + 1) + 8 * v10), v18);
        if (v11)
        {
          id v12 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v13 = [v11 bundleIdentifier];
            id v19 = [v11 assetURL];
            v14 = [v19 path];
            *(_DWORD *)buf = v18;
            v25 = "-[SSUInstalledAppProviderDevice lookupAllSSUEnabledApps]";
            __int16 v26 = 2112;
            uint64_t v27 = (uint64_t)v13;
            __int16 v28 = 2112;
            v29 = v14;
            _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Found SSU app %@ with asset URL %@", buf, 0x20u);
          }
          [v4 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v8);
  }
  id v15 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = [v4 count];
    *(_DWORD *)buf = 136315394;
    v25 = "-[SSUInstalledAppProviderDevice lookupAllSSUEnabledApps]";
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps in total.", buf, 0x16u);
  }

  return v4;
}

- (id)lookupSSUEnabledAppByBundleId:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v11 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v11];
  id v6 = v11;
  if (v5)
  {
    long long v7 = [(SSUInstalledAppProviderDevice *)self applicationInfoFromAppRecord:v5];
  }
  else
  {
    uint64_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v13 = "-[SSUInstalledAppProviderDevice lookupSSUEnabledAppByBundleId:]";
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Could not lookup app with bundle ID: %@. Error: %@", buf, 0x20u);
    }
    long long v7 = 0;
  }

  return v7;
}

- (SSUInstalledAppProviderDevice)initWithLocale:(id)a3
{
  id v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSUInstalledAppProviderDevice;
  v5 = [(SSUInstalledAppProviderDevice *)&v8 init];
  locale = v5->_locale;
  v5->_locale = v4;

  return v5;
}

@end