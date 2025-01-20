@interface NSBundle(SSUAssetPath)
- (id)SSUAssetPathForLocale:()SSUAssetPath;
@end

@implementation NSBundle(SSUAssetPath)

- (id)SSUAssetPathForLocale:()SSUAssetPath
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F086E0];
  v6 = [a1 localizations];
  v30[0] = v4;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  v8 = [v5 preferredLocalizationsFromArray:v6 forPreferences:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(a1, "URLForResource:withExtension:subdirectory:localization:", @"nlu.appintents", 0, 0, v14, (void)v21);
        if (v15)
        {
          v18 = (void *)v15;
          v19 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v26 = "-[NSBundle(SSUAssetPath) SSUAssetPathForLocale:]";
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s [NSBundle] Found lproj SSU asset for localization=%@.", buf, 0x16u);
          }

          v17 = v18;
          v16 = v17;
          goto LABEL_15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v16 = [a1 URLForResource:@"Metadata.appintents/nlu" withExtension:0];
  if (v16)
  {
    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NSBundle(SSUAssetPath) SSUAssetPathForLocale:]";
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s [NSBundle] Found non-lproj SSU asset.", buf, 0xCu);
    }
LABEL_15:
  }
  return v16;
}

@end