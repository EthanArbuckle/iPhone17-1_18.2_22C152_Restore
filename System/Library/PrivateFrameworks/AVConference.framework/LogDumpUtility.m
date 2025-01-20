@interface LogDumpUtility
+ (BOOL)shouldCleanupFiles;
+ (id)createFileListSortedByTimestamp:(id)a3;
+ (id)logFilename:(int)a3 dumpID:(id)a4 logNameType:(int)a5 prefix:(id)a6 suffix:(id)a7;
+ (int64_t)fileCleanupDispatchQueuePriority;
+ (void)removeFilesInDirectory:(id)a3 olderThan:(id)a4;
+ (void)removeOldFilesInDefaultLogDumpPath;
@end

@implementation LogDumpUtility

+ (id)logFilename:(int)a3 dumpID:(id)a4 logNameType:(int)a5 prefix:(id)a6 suffix:(id)a7
{
  v18[3] = *(id *)MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v12 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    v18[0] = (id)0xAAAAAAAAAAAAAAAALL;
    v11 = @"/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/";
    if (([v12 fileExistsAtPath:@"/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/"] & 1) == 0
      && ([v12 createDirectoryAtPath:@"/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/" withIntermediateDirectories:1 attributes:0 error:v18] & 1) == 0&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[LogDumpUtility logFilename:dumpID:logNameType:prefix:suffix:](v13, v18, v14);
      }
      v11 = @"/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/";
    }
  }
  else if (a3)
  {
    v11 = &stru_1F3D3E450;
  }
  else
  {
    v11 = (__CFString *)[MEMORY[0x1E4F47A28] getDefaultLogDumpPath];
  }
  if (a5 == 1)
  {
    memset(v18, 170, 20);
    VRLogfile_CreateTimeAndDateString((char *)v18, 20);
    uint64_t v15 = [NSString stringWithFormat:@"%s-%@-%@%@", v18, a4, a6, a7];
  }
  else
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@-%@%@", a4, a6, a7, v17];
  }
  return (id)[(__CFString *)v11 stringByAppendingString:v15];
}

+ (id)createFileListSortedByTimestamp:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, &v21);
  if (v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v21 localizedDescription];
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v5;
        __int16 v29 = 2080;
        v30 = "+[LogDumpUtility createFileListSortedByTimestamp:]";
        __int16 v31 = 1024;
        int v32 = 401;
        __int16 v33 = 2112;
        id v34 = a3;
        __int16 v35 = 2112;
        uint64_t v36 = v17;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed to read directory %@ (%@)", buf, 0x30u);
      }
    }
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    uint64_t v19 = *MEMORY[0x1E4F283C8];
    uint64_t v20 = *MEMORY[0x1E4F283B8];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        if (v11)
        {
          v12 = (void *)[[NSString alloc] initWithFormat:@"%@%@", a3, v11];
          uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", v12, &v21);
          if (!v21)
          {
            v14 = v13;
            if ([v13 objectForKeyedSubscript:v20] == v19)
            {
              uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v11, v14, 0);
              [v18 addObject:v15];
            }
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v8);
  }
  [v18 sortUsingComparator:&__block_literal_global_97];
  return v18;
}

uint64_t __50__LogDumpUtility_createFileListSortedByTimestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)[a2 objectAtIndexedSubscript:1];
  uint64_t v5 = (void *)[a3 objectAtIndexedSubscript:1];
  uint64_t v6 = *MEMORY[0x1E4F28310];
  uint64_t v7 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
  uint64_t v8 = [v5 objectForKeyedSubscript:v6];

  return [v7 compare:v8];
}

+ (void)removeFilesInDirectory:(id)a3 olderThan:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v6 = [(id)objc_opt_class() createFileListSortedByTimestamp:a3];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v55 = v8;
          __int16 v56 = 2080;
          v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
          __int16 v58 = 1024;
          int v59 = 433;
          __int16 v60 = 2112;
          unint64_t v61 = (unint64_t)a3;
          __int16 v62 = 2048;
          uint64_t v63 = [v7 count];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d directory=%@, fileList.count=%lu", buf, 0x30u);
        }
      }
      id v47 = a3;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v10 = [v7 countByEnumeratingWithState:&v76 objects:v75 count:16];
      uint64_t v11 = (uint64_t *)MEMORY[0x1E4F28390];
      if (v10)
      {
        uint64_t v12 = v10;
        unint64_t v13 = 0;
        uint64_t v14 = *(void *)v77;
        uint64_t v15 = *MEMORY[0x1E4F28390];
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v77 != v14) {
              objc_enumerationMutation(v7);
            }
            v13 += objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * i), "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", v15), "integerValue");
          }
          uint64_t v12 = [v7 countByEnumeratingWithState:&v76 objects:v75 count:16];
        }
        while (v12);
      }
      else
      {
        unint64_t v13 = 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v55 = v17;
          __int16 v56 = 2080;
          v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
          __int16 v58 = 1024;
          int v59 = 439;
          __int16 v60 = 2048;
          unint64_t v61 = v13;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Total size: %llu", buf, 0x26u);
        }
      }
      id v53 = 0;
      v49 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"(.*)(\\d{10})(-.*)$" options:0 error:&v53];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      uint64_t v52 = [v7 countByEnumeratingWithState:&v71 objects:v70 count:16];
      if (v52)
      {
        int v19 = 0;
        uint64_t v50 = *MEMORY[0x1E4F28310];
        uint64_t v51 = *(void *)v72;
        uint64_t v48 = *v11;
        id v46 = a4;
        do
        {
          for (uint64_t j = 0; j != v52; ++j)
          {
            int v21 = v19;
            if (*(void *)v72 != v51) {
              objc_enumerationMutation(v7);
            }
            v22 = *(void **)(*((void *)&v71 + 1) + 8 * j);
            long long v23 = (void *)[v22 objectAtIndexedSubscript:0];
            long long v24 = objc_msgSend((id)objc_msgSend(v22, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", v50);
            uint64_t v25 = (uint64_t)v24;
            if (!a4 || [v24 compare:a4] == -1)
            {
              uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", v48), "integerValue");
              v30 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v23];
              objc_msgSend(v49, "replaceMatchesInString:options:range:withTemplate:", v30, 0, 0, objc_msgSend(v23, "length"), @"$2");
              if (v30) {
                int v19 = [v30 integerValue];
              }
              else {
                int v19 = 0;
              }

              if (v13 <= 0xF4240 && v19 && (!v21 || v19 != v21)) {
                goto LABEL_53;
              }
              __int16 v31 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v47, v23];
              if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v31))
              {
                int v32 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v31, &v53);
                int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
                if (v32)
                {
                  if (ErrorLogLevelForModule >= 7)
                  {
                    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
                    __int16 v35 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316930;
                      uint64_t v55 = v34;
                      __int16 v56 = 2080;
                      v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                      __int16 v58 = 1024;
                      int v59 = 462;
                      __int16 v60 = 2112;
                      unint64_t v61 = (unint64_t)v23;
                      __int16 v62 = 2112;
                      uint64_t v63 = v25;
                      __int16 v64 = 2048;
                      uint64_t v65 = v29;
                      __int16 v66 = 1024;
                      int v67 = v19;
                      __int16 v68 = 2048;
                      unint64_t v69 = v13;
                      uint64_t v36 = v35;
                      uint64_t v37 = " [%s] %s:%d removed %@ (%@, %llu bytes, dumpID %u) - %llu bytes remaining";
                      uint32_t v38 = 74;
                      goto LABEL_44;
                    }
                  }
                }
                else if (ErrorLogLevelForModule >= 3)
                {
                  uint64_t v41 = VRTraceErrorLogLevelToCSTR();
                  v42 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v43 = [v53 localizedDescription];
                    *(_DWORD *)buf = 136316162;
                    uint64_t v55 = v41;
                    __int16 v56 = 2080;
                    v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                    __int16 v58 = 1024;
                    int v59 = 464;
                    __int16 v60 = 2112;
                    unint64_t v61 = (unint64_t)v31;
                    __int16 v62 = 2112;
                    uint64_t v63 = v43;
                    _os_log_error_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed to remove %@ (%@)", buf, 0x30u);
                  }
                }
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v39 = VRTraceErrorLogLevelToCSTR();
                v40 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  uint64_t v55 = v39;
                  __int16 v56 = 2080;
                  v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                  __int16 v58 = 1024;
                  int v59 = 460;
                  __int16 v60 = 2112;
                  unint64_t v61 = (unint64_t)v31;
                  uint64_t v36 = v40;
                  uint64_t v37 = " [%s] %s:%d file no longer exists at %@";
                  uint32_t v38 = 38;
LABEL_44:
                  _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);
                }
              }

              v13 -= v29;
              a4 = v46;
              continue;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v26 = VRTraceErrorLogLevelToCSTR();
              v27 = *MEMORY[0x1E4F47A50];
              uint64_t v28 = *MEMORY[0x1E4F47A50];
              if (*MEMORY[0x1E4F47A40])
              {
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v55 = v26;
                  __int16 v56 = 2080;
                  v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                  __int16 v58 = 1024;
                  int v59 = 473;
                  __int16 v60 = 2112;
                  unint64_t v61 = (unint64_t)v23;
                  __int16 v62 = 2112;
                  uint64_t v63 = v25;
                  _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping filename=%@, date=%@", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v55 = v26;
                __int16 v56 = 2080;
                v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
                __int16 v58 = 1024;
                int v59 = 473;
                __int16 v60 = 2112;
                unint64_t v61 = (unint64_t)v23;
                __int16 v62 = 2112;
                uint64_t v63 = v25;
                _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Skipping filename=%@, date=%@", buf, 0x30u);
              }
            }
          }
          uint64_t v52 = [v7 countByEnumeratingWithState:&v71 objects:v70 count:16];
        }
        while (v52);
      }
LABEL_53:

      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v44 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v55 = v44;
          __int16 v56 = 2080;
          v57 = "+[LogDumpUtility removeFilesInDirectory:olderThan:]";
          __int16 v58 = 1024;
          int v59 = 478;
          __int16 v60 = 2048;
          unint64_t v61 = v13;
          _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Completed: Total size: %llu", buf, 0x26u);
        }
      }
    }
  }
}

+ (BOOL)shouldCleanupFiles
{
  if (shouldCleanupFiles_initOnce != -1) {
    dispatch_once(&shouldCleanupFiles_initOnce, &__block_literal_global_44_0);
  }
  unint64_t v2 = atomic_load((unint64_t *)&shouldCleanupFiles__lastCleanupTimeCache);
  double v3 = micro();
  if ((uint64_t)((uint64_t)v3 - v2) < 15) {
    return 0;
  }
  unint64_t v5 = v2;
  atomic_compare_exchange_strong(&shouldCleanupFiles__lastCleanupTimeCache, &v5, (uint64_t)v3);
  return v5 == v2;
}

void __36__LogDumpUtility_shouldCleanupFiles__block_invoke()
{
  shouldCleanupFiles__lastCleanupTimeCache = 0;
}

+ (int64_t)fileCleanupDispatchQueuePriority
{
  return -32768;
}

+ (void)removeOldFilesInDefaultLogDumpPath
{
  global_queue = dispatch_get_global_queue(+[LogDumpUtility fileCleanupDispatchQueuePriority], 0);

  dispatch_async(global_queue, &__block_literal_global_46);
}

uint64_t __52__LogDumpUtility_removeOldFilesInDefaultLogDumpPath__block_invoke()
{
  uint64_t result = +[LogDumpUtility shouldCleanupFiles];
  if (result)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v2 setDay:-1];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "dateByAddingComponents:toDate:options:", v2, v1, 0);

    uint64_t v4 = [MEMORY[0x1E4F47A28] getDefaultLogDumpPath];
    return +[LogDumpUtility removeFilesInDirectory:v4 olderThan:v3];
  }
  return result;
}

+ (void)logFilename:(NSObject *)a3 dumpID:logNameType:prefix:suffix:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [@"/var/mobile/tmp/com.apple.audiomxd/AudioCapture/AVC/" UTF8String];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  int v8 = 136316162;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  uint64_t v11 = "+[LogDumpUtility logFilename:dumpID:logNameType:prefix:suffix:]";
  __int16 v12 = 1024;
  int v13 = 371;
  __int16 v14 = 2080;
  uint64_t v15 = v6;
  __int16 v16 = 2080;
  uint64_t v17 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error in creating directory path=%s error=%s ", (uint8_t *)&v8, 0x30u);
}

@end