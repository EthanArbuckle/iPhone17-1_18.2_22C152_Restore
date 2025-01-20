@interface AVOutputDeviceFrecencyManager
+ (BOOL)_migrateFrecentsFromCFPreferencesToFrecentsFilePath:(id)a3;
+ (double)frecencyScoreForDeviceID:(id)a3;
+ (id)_applicationSupportPath;
+ (id)_frecentsContainerPath;
+ (id)_frecentsFilePath;
+ (id)_frecentsReaderAfterMigrationIfNecessary;
+ (id)_frecentsWriter;
+ (void)updateFrecencyListForDeviceID:(id)a3;
@end

@implementation AVOutputDeviceFrecencyManager

+ (double)frecencyScoreForDeviceID:(id)a3
{
  v4 = (void *)[a1 _frecentsReaderAfterMigrationIfNecessary];
  if (!a3) {
    return 0.0;
  }
  if (!v4) {
    return 0.0;
  }
  v5 = (void *)[v4 frecencyInfoForDeviceWithID:a3];
  if (!v5) {
    return 0.0;
  }
  v6 = (void *)[v5 objectForKeyedSubscript:@"FrecencyScore"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0.0;
  }
  [v6 doubleValue];
  return result;
}

+ (id)_frecentsReaderAfterMigrationIfNecessary
{
  if (objc_msgSend((id)objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier"), "isEqualToString:", @"AVPlatformIdentifierMacOS"))
  {
    v3 = (AVOutputDeviceFrecentsReader *)[a1 _frecentsFilePath];
    if (v3)
    {
      v4 = v3;
      id v8 = 0;
      v3 = [[AVOutputDeviceFrecentsReader alloc] initWithFrecentsFilePath:v3 error:&v8];
      if (!v3)
      {
        id v5 = v8;
        if (v8
          && (v6 = (void *)[v8 domain],
              [v6 isEqualToString:*MEMORY[0x1E4F281F8]])
          && [v5 code] == 260
          && [a1 _migrateFrecentsFromCFPreferencesToFrecentsFilePath:v4])
        {
          v3 = [[AVOutputDeviceFrecentsReader alloc] initWithFrecentsFilePath:v4 error:&v8];
        }
        else
        {
          v3 = 0;
        }
      }
    }
    return v3;
  }
  else
  {
    if (_frecentsReaderAfterMigrationIfNecessary_loggingOnce != -1) {
      dispatch_once(&_frecentsReaderAfterMigrationIfNecessary_loggingOnce, &__block_literal_global_20);
    }
    return +[AVOutputDeviceLegacyFrecentsReader defaultFrecentsReader];
  }
}

void __73__AVOutputDeviceFrecencyManager__frecentsReaderAfterMigrationIfNecessary__block_invoke()
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

+ (void)updateFrecencyListForDeviceID:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[MEMORY[0x1E4F1C9C8] date];
  v6 = (void *)[a1 _frecentsReaderAfterMigrationIfNecessary];
  v36 = (void *)[a1 _frecentsWriter];
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(v6, "deviceIDs"));
    if (([v7 containsObject:a3] & 1) == 0) {
      [v7 addObject:a3];
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = 0;
      uint64_t v35 = *(void *)v41;
      double v11 = 0.0;
      id v33 = a3;
      id obj = v7;
      while (1)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v14 = (void *)[v6 frecencyInfoForDeviceWithID:v13];
          double v15 = 1.0;
          if (!v14) {
            goto LABEL_17;
          }
          v16 = v14;
          v17 = (void *)[v14 objectForKey:@"FrecencyScore"];
          uint64_t v18 = [v16 objectForKey:@"LastUsedTimestamp"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v17 doubleValue];
              double v20 = v19;
              [v5 timeIntervalSinceDate:v18];
              double v15 = v20 * exp2(v21 / 86400.0 * -0.5) + 1.0;
              goto LABEL_18;
            }
            if (dword_1EB2D3A40)
            {
LABEL_16:
              int v39 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              a3 = v33;
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else if (dword_1EB2D3A40)
          {
            goto LABEL_16;
          }
LABEL_17:
          uint64_t v18 = 0;
LABEL_18:
          uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v15, v29, v31);
          if (v11 == 0.0)
          {
            v10 = v13;
            double v11 = v15;
          }
          char v24 = [v13 isEqualToString:a3];
          if (v11 > v15) {
            v25 = v13;
          }
          else {
            v25 = v10;
          }
          if (v11 > v15) {
            double v26 = v15;
          }
          else {
            double v26 = v11;
          }
          if (v24) {
            v27 = v5;
          }
          else {
            v27 = (void *)v18;
          }
          if ((v24 & 1) == 0)
          {
            v10 = v25;
            double v11 = v26;
          }
          if (v27)
          {
            objc_msgSend(v36, "setFrecencyInfo:forDeviceID:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v23, v26, @"FrecencyScore", v27, @"LastUsedTimestamp", 0), v13);
          }
          else
          {
            if (dword_1EB2D3A40)
            {
              int v39 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              a3 = v33;
            }
            objc_msgSend(v36, "removeFrecencyInfoForDeviceID:", v13, v26, v30, v32);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (!v9) {
          goto LABEL_40;
        }
      }
    }
    v10 = 0;
LABEL_40:
    if ([v36 numberOfKeysToBeSet] >= 51 && (objc_msgSend(v10, "isEqualToString:", a3) & 1) == 0)
    {
      if (v10) {
        [v36 removeFrecencyInfoForDeviceID:v10];
      }
    }
    uint64_t v37 = 0;
    [v36 persistToDiskReturningError:&v37];
  }
}

+ (id)_applicationSupportPath
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t started = sysdir_start_search_path_enumeration_private();
  if (MEMORY[0x199715F60](started, v4)) {
    return (id)[NSString stringWithCString:v4 encoding:30];
  }
  else {
    return 0;
  }
}

+ (id)_frecentsContainerPath
{
  id result = (id)[a1 _applicationSupportPath];
  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend(result, "stringByAppendingPathComponent:", @"com.apple.avfoundation"), "stringByAppendingPathComponent:", @"Frecents");
    uint64_t v4 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v4))return v3; {
    else
    }
      return 0;
  }
  return result;
}

+ (id)_frecentsFilePath
{
  v2 = (void *)[a1 _frecentsContainerPath];
  if (v2)
  {
    v2 = (void *)[v2 stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"%@.plist", @"com.apple.avfoundation.frecents"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AVOutputDeviceFrecencyManager__frecentsFilePath__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = v2;
    if (_frecentsFilePath_pathLoggingOnce != -1) {
      dispatch_once(&_frecentsFilePath_pathLoggingOnce, block);
    }
  }
  return v2;
}

uint64_t __50__AVOutputDeviceFrecencyManager__frecentsFilePath__block_invoke()
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

+ (BOOL)_migrateFrecentsFromCFPreferencesToFrecentsFilePath:(id)a3
{
  v26[16] = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A40)
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v5 = +[AVOutputDeviceLegacyFrecentsReader defaultFrecentsReader];
  id v6 = +[AVOutputDeviceLegacyFrecentsWriter defaultFrecentsWriter];
  v7 = [[AVOutputDeviceFrecentsWriter alloc] initWithFrecentsFilePath:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = (void *)[v5 deviceIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        -[AVOutputDeviceFrecentsWriter setFrecencyInfo:forDeviceID:](v7, "setFrecencyInfo:forDeviceID:", [v5 frecencyInfoForDeviceWithID:v13], v13);
        [v6 removeFrecencyInfoForDeviceID:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }
  v26[0] = 0;
  if ([(AVOutputDeviceFrecentsWriter *)v7 persistToDiskReturningError:v26])
  {
    uint64_t v18 = 0;
    char v14 = [v6 persistToDiskReturningError:&v18];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)_frecentsWriter
{
  if (objc_msgSend((id)objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier"), "isEqualToString:", @"AVPlatformIdentifierMacOS"))
  {
    v3 = (AVOutputDeviceFrecentsWriter *)[a1 _frecentsFilePath];
    if (v3) {
      v3 = [[AVOutputDeviceFrecentsWriter alloc] initWithFrecentsFilePath:v3];
    }
    return v3;
  }
  else
  {
    return +[AVOutputDeviceLegacyFrecentsWriter defaultFrecentsWriter];
  }
}

@end