@interface SSUInstalledAppProviderSandbox
- (NSString)locale;
- (NSURL)directory;
- (SSUInstalledAppProviderSandbox)initWithDirectory:(id)a3 locale:(id)a4;
- (id)lookupAllSSUEnabledApps;
- (id)lookupSSUEnabledAppByBundleId:(id)a3;
@end

@implementation SSUInstalledAppProviderSandbox

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (NSString)locale
{
  return self->_locale;
}

- (NSURL)directory
{
  return self->_directory;
}

- (id)lookupAllSSUEnabledApps
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    directory = self->_directory;
    *(_DWORD *)buf = 136315394;
    v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)directory;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Looking up all installed SSU-enabled apps in sandbox directory: %@.", buf, 0x16u);
  }

  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [(NSURL *)self->_directory path];
  id v31 = 0;
  v6 = [v4 contentsOfDirectoryAtPath:v5 error:&v31];
  id v7 = v31;

  if (v6)
  {
    id v24 = v7;
    v8 = [MEMORY[0x263EFF980] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v25 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(SSUInstalledAppProviderSandbox *)self lookupSSUEnabledAppByBundleId:*(void *)(*((void *)&v27 + 1) + 8 * v13)];
          if (v14)
          {
            v15 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v16 = [v14 bundleIdentifier];
              v26 = [v14 assetURL];
              v17 = [v26 path];
              *(_DWORD *)buf = 136315650;
              v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
              __int16 v35 = 2112;
              uint64_t v36 = (uint64_t)v16;
              __int16 v37 = 2112;
              v38 = v17;
              _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found SSU app %@ with asset URL %@", buf, 0x20u);
            }
            [v8 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = [v8 count];
      *(_DWORD *)buf = 136315394;
      v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
      __int16 v35 = 2048;
      uint64_t v36 = v21;
      _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Found %lu SSU-enabled apps in total in sandbox.", buf, 0x16u);
    }
    id v7 = v24;
    v6 = v25;
  }
  else
  {
    v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = self->_directory;
      v23 = +[CDMPlatformUtils prettyPrintError:v7];
      *(_DWORD *)buf = 136315650;
      v34 = "-[SSUInstalledAppProviderSandbox lookupAllSSUEnabledApps]";
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v22;
      __int16 v37 = 2112;
      v38 = v23;
      _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to list contents of directory %@ due to error: %@. Returning no installed apps.", buf, 0x20u);
    }
    v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)lookupSSUEnabledAppByBundleId:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v4 = (NSURL *)a3;
  v5 = [(NSURL *)self->_directory URLByAppendingPathComponent:v4];
  char v22 = 0;
  v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [(NSURL *)v5 path];
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:&v22];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      directory = self->_directory;
      *(_DWORD *)buf = 136315650;
      id v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
      __int16 v25 = 2112;
      v26 = directory;
      __int16 v27 = 2112;
      long long v28 = v4;
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s The installed app sandbox directory %@ not contain a subdirectory: %@. Reporting app as not available.", buf, 0x20u);
    }
    goto LABEL_12;
  }
  if (!v22)
  {
    uint64_t v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
      __int16 v25 = 2112;
      v26 = v5;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: The installed app sandbox directory has a non-directory file: %@. Reporting app as not available.", buf, 0x16u);
    }
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263F086E0]) _initUniqueWithURL:v5];
  uint64_t v10 = [v9 SSUAssetPathForLocale:self->_locale];

  if (v10)
  {
    locale = self->_locale;
    id v21 = 0;
    uint64_t v12 = [MEMORY[0x263F71FC0] applicationInfoWithBundleIdentifier:v4 assetURL:v10 forLocale:locale error:&v21];
    uint64_t v13 = v21;
    v14 = CDMOSLoggerForCategory(0);
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v19 = [v12 bundleIdentifier];
        *(_DWORD *)buf = 136315394;
        id v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
        __int16 v25 = 2112;
        v26 = v19;
        _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s Found SSU-enabled app in sandbox: %@", buf, 0x16u);
      }
      id v16 = v12;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v20 = +[CDMPlatformUtils prettyPrintError:v13];
        *(_DWORD *)buf = 136315906;
        id v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
        __int16 v25 = 2112;
        v26 = v4;
        __int16 v27 = 2112;
        long long v28 = v5;
        __int16 v29 = 2112;
        long long v30 = v20;
        _os_log_error_impl(&dword_2263A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to build SNLPSSUApplicationInfo instance for bundle ID=%@ and app asset URL=%@: %@. Ignoring app.", buf, 0x2Au);
      }
    }
  }
  else
  {
    uint64_t v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[SSUInstalledAppProviderSandbox lookupSSUEnabledAppByBundleId:]";
      __int16 v25 = 2112;
      v26 = v5;
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s The installed app sandbox directory app is not SSU-enabled: %@ (no asset subdirectory found). Reporting app as not available.", buf, 0x16u);
    }
    uint64_t v12 = 0;
  }

LABEL_21:
  return v12;
}

- (SSUInstalledAppProviderSandbox)initWithDirectory:(id)a3 locale:(id)a4
{
  v6 = (NSURL *)a3;
  id v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SSUInstalledAppProviderSandbox;
  char v8 = [(SSUInstalledAppProviderSandbox *)&v13 init];
  directory = v8->_directory;
  v8->_directory = v6;
  uint64_t v10 = v6;

  locale = v8->_locale;
  v8->_locale = v7;

  return v8;
}

@end