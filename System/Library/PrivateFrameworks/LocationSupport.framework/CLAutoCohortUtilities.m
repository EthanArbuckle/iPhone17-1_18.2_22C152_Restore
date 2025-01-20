@interface CLAutoCohortUtilities
+ (BOOL)autoCohortingEnabled;
+ (BOOL)isEdgeKnownToCauseCycle:(id)a3;
+ (id)computeAutoCohortMapWithStarterGraph:(id)a3;
+ (id)getEdgeFilesFromDirectory:(id)a3;
+ (id)getSafeEdges;
+ (id)getUnsafeEdges;
+ (id)getUnvettedEdges;
+ (id)layerAssignmentForNode:(id)a3 inGraph:(id)a4 extendingLayering:(id)a5;
+ (id)readEdges:(id)a3;
+ (void)applyEdges:(id)a3 toGraph:(id)a4;
+ (void)createDirectoryAtPath:(id)a3;
+ (void)enableAutoCohortingForProcessAtPath:(id)a3;
+ (void)markUnvetted:(id)a3;
+ (void)markUnvettedSafe;
+ (void)markUnvettedUnsafe;
+ (void)persistEdgeFrom:(id)a3 to:(id)a4;
+ (void)writeEdge:(id)a3 toDirectory:(id)a4;
@end

@implementation CLAutoCohortUtilities

+ (BOOL)autoCohortingEnabled
{
  return qword_1E964BBD0 != 0;
}

+ (void)enableAutoCohortingForProcessAtPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (qword_1EB30CE70 == -1)
    {
LABEL_11:
      v4 = qword_1EB30CE68;
      if (!os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = &unk_1A45670B7;
      __int16 v13 = 2114;
      v14 = (const char *)a3;
      v5 = "{\"msg%{public}.0s\":\"#Cohorting Process intended to sign up for auto cohorting but CoreLocation/CLAutoCohor"
           "t=off\", \"autoCohortEdgesDirectoryPath\":%{public, location:escape_only}@}";
      goto LABEL_13;
    }
LABEL_26:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
    goto LABEL_11;
  }
  if (!a3 || ![a3 length])
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
    }
    v6 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = &unk_1A45670B7;
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "path && path.length";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Invalid path while enabling auto cohorting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
      }
    }
    v7 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = &unk_1A45670B7;
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "path && path.length";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Invalid path while enabling auto cohorting", "{\"msg%{public}.0s\":\"#Cohorting Invalid path while enabling auto cohorting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
      }
    }
    a3 = (id)qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = &unk_1A45670B7;
      __int16 v13 = 2082;
      v14 = "assert";
      __int16 v15 = 2081;
      v16 = "path && path.length";
      _os_log_impl(&dword_1A4540000, (os_log_t)a3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Invalid path while enabling auto cohorting\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    goto LABEL_26;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A455CFF0;
  block[3] = &unk_1E5B3E9E0;
  block[4] = a3;
  if (qword_1E964BBC8 != -1) {
    dispatch_once(&qword_1E964BBC8, block);
  }
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
  }
  v4 = qword_1EB30CE68;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = &unk_1A45670B7;
    __int16 v13 = 2114;
    v14 = (const char *)a3;
    v5 = "{\"msg%{public}.0s\":\"#Cohorting Process successfully signed up for auto cohorting\", \"autoCohortEdgesDirecto"
         "ryPath\":%{public, location:escape_only}@}";
LABEL_13:
    _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
  }
}

+ (id)layerAssignmentForNode:(id)a3 inGraph:(id)a4 extendingLayering:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(a5, "objectForKeyedSubscript:");
  if (!v8)
  {
    [a5 setObject:&unk_1EF7F87A0 forKeyedSubscript:a3];
    v8 = (void *)[MEMORY[0x1E4F28ED0] numberWithInt:0];
    id v20 = a3;
    v9 = (void *)[a4 objectForKeyedSubscript:a3];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = +[CLAutoCohortUtilities layerAssignmentForNode:*(void *)(*((void *)&v21 + 1) + 8 * v13) inGraph:a4 extendingLayering:a5];
          if (v14 == &unk_1EF7F87A0) {
            return &unk_1EF7F87A0;
          }
          __int16 v15 = v14;
          v16 = (void *)MEMORY[0x1E4F28ED0];
          signed int v17 = [v8 intValue];
          if (v17 <= (int)([v15 intValue] + 1)) {
            uint64_t v18 = [v15 intValue] + 1;
          }
          else {
            uint64_t v18 = [v8 intValue];
          }
          v8 = (void *)[v16 numberWithInt:v18];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    [a5 setObject:v8 forKeyedSubscript:v20];
  }
  return v8;
}

+ (void)applyEdges:(id)a3 toGraph:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndex:", 0));
        if (!v11)
        {
          uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
          goto LABEL_12;
        }
        uint64_t v12 = (void *)v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (qword_1EB30CE70 != -1) {
              goto LABEL_26;
            }
            while (1)
            {
              id v14 = qword_1EB30CE68;
              if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 68289539;
                int v22 = 0;
                __int16 v23 = 2082;
                long long v24 = &unk_1A45670B7;
                __int16 v25 = 2082;
                uint64_t v26 = "assert";
                __int16 v27 = 2081;
                v28 = "[children isKindOfClass:[NSArray class]] || [children isKindOfClass:[NSSet class]]";
                _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
                if (qword_1EB30CE70 != -1) {
                  dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
                }
              }
              __int16 v15 = qword_1EB30CE68;
              if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
              {
                *(_DWORD *)buf = 68289539;
                int v22 = 0;
                __int16 v23 = 2082;
                long long v24 = &unk_1A45670B7;
                __int16 v25 = 2082;
                uint64_t v26 = "assert";
                __int16 v27 = 2081;
                v28 = "[children isKindOfClass:[NSArray class]] || [children isKindOfClass:[NSSet class]]";
                _os_signpost_emit_with_name_impl(&dword_1A4540000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}", "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
                if (qword_1EB30CE70 != -1) {
                  dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
                }
              }
              v16 = qword_1EB30CE68;
              if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 68289539;
                int v22 = 0;
                __int16 v23 = 2082;
                long long v24 = &unk_1A45670B7;
                __int16 v25 = 2082;
                uint64_t v26 = "assert";
                __int16 v27 = 2081;
                v28 = "[children isKindOfClass:[NSArray class]] || [children isKindOfClass:[NSSet class]]";
                _os_log_impl(&dword_1A4540000, v16, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph is of unexpected type. Expects {\"key\":[\"\", \"\"]}\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
              }
              abort_report_np();
LABEL_26:
              dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithArray:v12];
LABEL_12:
          uint64_t v12 = (void *)v13;
          objc_msgSend(a4, "setObject:forKeyedSubscript:", v13, objc_msgSend(v10, "objectAtIndex:", 0));
        }
        objc_msgSend(v12, "addObject:", objc_msgSend(v10, "objectAtIndex:", 1));
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v7);
  }
}

+ (void)createDirectoryAtPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, 0, &v10);
  if (v10)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
    }
    v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = [v10 localizedFailureReason];
      *(_DWORD *)buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = &unk_1A45670B7;
      __int16 v15 = 2114;
      id v16 = a3;
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      __int16 v19 = 2082;
      long long v20 = "assert";
      __int16 v21 = 2081;
      int v22 = "!error";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Cannot create directory\", \"directoryPath\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
      }
    }
    uint64_t v6 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      uint64_t v7 = [v10 localizedFailureReason];
      *(_DWORD *)buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = &unk_1A45670B7;
      __int16 v15 = 2114;
      id v16 = a3;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      __int16 v19 = 2082;
      long long v20 = "assert";
      __int16 v21 = 2081;
      int v22 = "!error";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Cannot create directory", "{\"msg%{public}.0s\":\"#Cohorting Cannot create directory\", \"directoryPath\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
      }
    }
    uint64_t v8 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v10 localizedFailureReason];
      *(_DWORD *)buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = &unk_1A45670B7;
      __int16 v15 = 2114;
      id v16 = a3;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2082;
      long long v20 = "assert";
      __int16 v21 = 2081;
      int v22 = "!error";
      _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Cannot create directory\", \"directoryPath\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }
    abort_report_np();
  }
}

+ (id)getEdgeFilesFromDirectory:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v21 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v21))BOOL v4 = v21 == 0; {
  else
  }
    BOOL v4 = 1;
  if (v4)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
    }
    uint64_t v5 = qword_1EB30CE68;
    if (!os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    uint64_t buf = 68289282;
    __int16 v24 = 2082;
    __int16 v25 = &unk_1A45670B7;
    __int16 v26 = 2114;
    id v27 = a3;
    uint64_t v6 = "{\"msg%{public}.0s\":\"#Cohorting Doesnot exist or is not a directory\", \"directoryPath\":%{public, location:escape_only}@}";
    goto LABEL_15;
  }
  uint64_t v20 = 0;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, &v20);
  if (v20)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
    }
    uint64_t v5 = qword_1EB30CE68;
    if (!os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    uint64_t buf = 68289282;
    __int16 v24 = 2082;
    __int16 v25 = &unk_1A45670B7;
    __int16 v26 = 2114;
    id v27 = a3;
    uint64_t v6 = "{\"msg%{public}.0s\":\"#Cohorting Cannot read contents of directory\", \"directoryPath\":%{public, location:escape_only}@}";
LABEL_15:
    _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&buf, 0x1Cu);
    return 0;
  }
  id v10 = (void *)v7;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v15 hasSuffix:@".plist"]) {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v12);
  }
  return v8;
}

+ (id)readEdges:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = +[CLAutoCohortUtilities getEdgeFilesFromDirectory:](CLAutoCohortUtilities, "getEdgeFilesFromDirectory:");
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 68289026;
    long long v16 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = objc_msgSend(a3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v17 + 1) + 8 * v10), v16);
        uint64_t v12 = (void *)[MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v11];
        if (v12 && (uint64_t v13 = v12, [v12 count] == 2))
        {
          [v5 addObject:v13];
        }
        else
        {
          if (qword_1EB30CE70 != -1) {
            dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
          }
          id v14 = qword_1EB30CE68;
          if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = v16;
            int v22 = 0;
            __int16 v23 = 2082;
            __int16 v24 = &unk_1A45670B7;
            _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Sync-get graph edge is of unexpected type. Expects [\"\", \"\"]\"}", buf, 0x12u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }
  return v5;
}

+ (id)getUnvettedEdges
{
  return (id)MEMORY[0x1F4181798](CLAutoCohortUtilities, sel_readEdges_);
}

+ (id)getSafeEdges
{
  [(id)qword_1E964BBD0 stringByAppendingPathComponent:@"_safe"];
  return (id)MEMORY[0x1F4181798](CLAutoCohortUtilities, sel_readEdges_);
}

+ (id)getUnsafeEdges
{
  [(id)qword_1E964BBD0 stringByAppendingPathComponent:@"_unsafe"];
  return (id)MEMORY[0x1F4181798](CLAutoCohortUtilities, sel_readEdges_);
}

+ (void)writeEdge:(id)a3 toDirectory:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  +[CLAutoCohortUtilities createDirectoryAtPath:a4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateFormat:@"yyyy_MM_dd_HH_mm_ss"];
  uint64_t v7 = [a4 stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"%@.plist", objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")))];
  uint64_t v9 = 0;
  objc_msgSend(a3, "writeToURL:error:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v7), &v9);
  if (v9)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
    }
    uint64_t v8 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      uint64_t v13 = &unk_1A45670B7;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Cannot write edge file\", \"edgeFilePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

+ (void)persistEdgeFrom:(id)a3 to:(id)a4
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  v5[1] = a4;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  +[CLAutoCohortUtilities writeEdge:v4 toDirectory:qword_1E964BBD0];
}

+ (void)markUnvetted:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = +[CLAutoCohortUtilities getEdgeFilesFromDirectory:qword_1E964BBD0];
  uint64_t v5 = (void *)[(id)qword_1E964BBD0 stringByAppendingPathComponent:a3];
  +[CLAutoCohortUtilities createDirectoryAtPath:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 68289538;
    long long v15 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend((id)qword_1E964BBD0, "stringByAppendingPathComponent:", v11, v15);
        uint64_t v13 = [v5 stringByAppendingPathComponent:v11];
        uint64_t v16 = 0;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "moveItemAtPath:toPath:error:", v12, v13, &v16);
        if (v16)
        {
          if (qword_1EB30CE70 != -1) {
            dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
          }
          __int16 v14 = qword_1EB30CE68;
          if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = v15;
            int v22 = 0;
            __int16 v23 = 2082;
            __int16 v24 = &unk_1A45670B7;
            __int16 v25 = 2114;
            uint64_t v26 = v12;
            __int16 v27 = 2114;
            uint64_t v28 = v13;
            _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Cohorting Cannot move unvetted edge\", \"srcFilePath\":%{public, location:escape_only}@, \"dstFilePath\":%{public, location:escape_only}@}", buf, 0x26u);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v8);
  }
}

+ (void)markUnvettedSafe
{
}

+ (void)markUnvettedUnsafe
{
}

+ (BOOL)isEdgeKnownToCauseCycle:(id)a3
{
  if (qword_1EB30D058 != -1) {
    dispatch_once(&qword_1EB30D058, &unk_1EF7F4FE0);
  }
  id v4 = objc_msgSend((id)qword_1EB30D050, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  if (!v4) {
    return 0;
  }
  BOOL v5 = 1;
  if ((objc_msgSend(v4, "containsObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)) & 1) == 0) {
    return 0;
  }
  return v5;
}

+ (id)computeAutoCohortMapWithStarterGraph:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA60] dictionary];
  if (!a3) {
    a3 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  +[CLAutoCohortUtilities applyEdges:toGraph:](CLAutoCohortUtilities, "applyEdges:toGraph:", +[CLAutoCohortUtilities getSafeEdges], a3);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(a3);
        }
        if ((int)objc_msgSend(+[CLAutoCohortUtilities layerAssignmentForNode:inGraph:extendingLayering:](CLAutoCohortUtilities, "layerAssignmentForNode:inGraph:extendingLayering:", *(void *)(*((void *)&v30 + 1) + 8 * i), a3, v4), "intValue") <= -2)
        {
          if (qword_1EB30CE70 != -1) {
            dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
          }
          __int16 v24 = qword_1EB30CE68;
          uint64_t v16 = &off_1A4566000;
          long long v15 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCoho"
                "rtNameToCohortMapAggregateSafe].intValue";
          if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
          {
            uint64_t buf = 68289539;
            __int16 v36 = 2082;
            v37 = &unk_1A45670B7;
            __int16 v38 = 2082;
            v39 = "assert";
            __int16 v40 = 2081;
            v41 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCo"
                  "hortNameToCohortMapAggregateSafe].intValue";
            _os_log_impl(&dword_1A4540000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Edge that was marked safe causes cycle in syncget graph\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
            if (qword_1EB30CE70 != -1) {
              dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
            }
          }
          __int16 v25 = qword_1EB30CE68;
          if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
          {
            uint64_t buf = 68289539;
            __int16 v36 = 2082;
            v37 = &unk_1A45670B7;
            __int16 v38 = 2082;
            v39 = "assert";
            __int16 v40 = 2081;
            v41 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCo"
                  "hortNameToCohortMapAggregateSafe].intValue";
            _os_signpost_emit_with_name_impl(&dword_1A4540000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Edge that was marked safe causes cycle in syncget graph", "{\"msg%{public}.0s\":\"#Cohorting Edge that was marked safe causes cycle in syncget graph\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
            if (qword_1EB30CE70 != -1) {
              dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
            }
          }
          id v4 = qword_1EB30CE68;
          if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 68289539;
            __int16 v36 = 2082;
            v37 = &unk_1A45670B7;
            __int16 v38 = 2082;
            v39 = "assert";
            __int16 v40 = 2081;
            v41 = "-1 <= [CLAutoCohortUtilities layerAssignmentForNode:node inGraph:syncgetGraph extendingLayering:autoCo"
                  "hortNameToCohortMapAggregateSafe].intValue";
            _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Cohorting Edge that was marked safe causes cycle in syncget graph\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
          }
          abort_report_np();
LABEL_39:
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
          goto LABEL_21;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v9 = +[CLAutoCohortUtilities getUnvettedEdges];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  +[CLAutoCohortUtilities applyEdges:v9 toGraph:a3];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
LABEL_13:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(a3);
      }
      if (objc_msgSend(+[CLAutoCohortUtilities layerAssignmentForNode:inGraph:extendingLayering:](CLAutoCohortUtilities, "layerAssignmentForNode:inGraph:extendingLayering:", *(void *)(*((void *)&v26 + 1) + 8 * v14), a3, v10), "intValue") == -1)break; {
      if (v12 == ++v14)
      }
      {
        uint64_t v12 = [a3 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    +[CLAutoCohortUtilities markUnvettedUnsafe];
    long long v15 = (char *)[v9 objectAtIndex:0];
    uint64_t v16 = (char **__ptr32 *)0x1EB30C000;
    if (qword_1EB30CE70 != -1) {
      goto LABEL_39;
    }
LABEL_21:
    long long v17 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = [v15 objectAtIndexedSubscript:0];
      uint64_t v19 = [v15 objectAtIndexedSubscript:1];
      uint64_t buf = 68289538;
      __int16 v36 = 2082;
      v37 = &unk_1A45670B7;
      __int16 v38 = 2114;
      v39 = (const char *)v18;
      __int16 v40 = 2114;
      v41 = (const char *)v19;
      _os_log_impl(&dword_1A4540000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Cohorting Cycle introduced in sync-get graph\", \"FromNode\":%{public, location:escape_only}@, \"ToNode\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      if (*((void *)v16 + 462) != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F51A0);
      }
    }
    long long v20 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      uint64_t v21 = [v15 objectAtIndexedSubscript:0];
      uint64_t v22 = [v15 objectAtIndexedSubscript:1];
      uint64_t buf = 68289538;
      __int16 v36 = 2082;
      v37 = &unk_1A45670B7;
      __int16 v38 = 2114;
      v39 = (const char *)v21;
      __int16 v40 = 2114;
      v41 = (const char *)v22;
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Cohorting Cycle introduced in sync-get graph", "{\"msg%{public}.0s\":\"#Cohorting Cycle introduced in sync-get graph\", \"FromNode\":%{public, location:escape_only}@, \"ToNode\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
    return v4;
  }
  else
  {
LABEL_19:
    +[CLAutoCohortUtilities markUnvettedSafe];
  }
  return v10;
}

@end