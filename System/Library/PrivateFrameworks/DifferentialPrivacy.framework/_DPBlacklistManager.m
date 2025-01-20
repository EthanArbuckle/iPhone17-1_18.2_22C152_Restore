@interface _DPBlacklistManager
+ (BOOL)createRuntimeBlacklistDirectory:(id)a3;
+ (BOOL)removeAllFilesFromDirectory:(id)a3;
+ (BOOL)removeBlacklistFileWithKey:(id)a3 fromDirectory:(id)a4;
+ (BOOL)saveBlacklist:(id)a3 forKey:(id)a4 runtimeDirectory:(id)a5;
+ (BOOL)saveBlacklist:(id)a3 knownVersionByKey:(id)a4 systemDirectory:(id)a5 runtimeDirectory:(id)a6;
+ (BOOL)saveBlacklist:(id)a3 systemDirectory:(id)a4 runtimeDirectory:(id)a5 memoryLimit:(unint64_t)a6;
+ (BOOL)validateBlacklist:(id)a3;
+ (id)keepLatestRuntimeBlacklistInDirectory:(id)a3 compareToSystemBlacklistInDirectory:(id)a4;
+ (unint64_t)memoryRequiredBySystemBlacklistInDirectory:(id)a3 runtimeBlacklistInDirectory:(id)a4 blacklist:(id)a5;
+ (unint64_t)memorySizeWithDirectory:(id)a3;
+ (void)processRuntimeBlacklist;
+ (void)processRuntimeBlacklist:(id)a3 systemDirectory:(id)a4 runtimeDirectory:(id)a5 blacklistLengthLimit:(unint64_t)a6;
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
@end

@implementation _DPBlacklistManager

+ (void)processRuntimeBlacklist:(id)a3 systemDirectory:(id)a4 runtimeDirectory:(id)a5 blacklistLengthLimit:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (![(id)objc_opt_class() createRuntimeBlacklistDirectory:v13]
    || ![v11 length])
  {
    goto LABEL_23;
  }
  if (![v11 isEqualToString:@"DifferentialPrivacyDARemoveAllBlacklistCommand"])
  {
    if ([v11 lengthOfBytesUsingEncoding:4] > a6)
    {
      v15 = +[_DPLog daemon];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[_DPBlacklistManager processRuntimeBlacklist:systemDirectory:runtimeDirectory:blacklistLengthLimit:]((uint64_t)a1, a2);
      }
      goto LABEL_22;
    }
    v16 = v11;
    v15 = v16;
    if ((unint64_t)[v16 length] >= 0x65)
    {
      v17 = NSString;
      v18 = [v16 substringToIndex:100];
      v15 = [v17 stringWithFormat:@"%@ ...", v18];
    }
    if (+[_DPBlacklistManager validateBlacklist:v16])
    {
      int v19 = [(id)objc_opt_class() saveBlacklist:v16 systemDirectory:v12 runtimeDirectory:v13 memoryLimit:512000];
      v20 = +[_DPLog daemon];
      v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          v24 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v32 = v23;
          __int16 v33 = 2112;
          v34 = v24;
          __int16 v35 = 2112;
          v36 = v15;
          _os_log_debug_impl(&dword_1DC55E000, v21, OS_LOG_TYPE_DEBUG, "%@, %@: Successfully loaded blacklist string to runtime blacklist directory : %@", buf, 0x20u);
LABEL_26:
        }
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      v30 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v30);
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v32 = v23;
      __int16 v33 = 2112;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v15;
      v26 = "%@, %@: Failed loading blacklist string to runtime blacklist directory : %@";
    }
    else
    {
      v21 = +[_DPLog daemon];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      v25 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v25);
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v32 = v23;
      __int16 v33 = 2112;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v15;
      v26 = "%@, %@: ill-formatted blacklist string : %@";
    }
    _os_log_error_impl(&dword_1DC55E000, v21, OS_LOG_TYPE_ERROR, v26, buf, 0x20u);
    goto LABEL_26;
  }
  +[_DPBlacklist resetAllBlacklists];
  v14 = +[_DPLog daemon];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v32 = v28;
    __int16 v33 = 2112;
    v34 = v29;
    __int16 v35 = 2112;
    v36 = v11;
    _os_log_debug_impl(&dword_1DC55E000, v14, OS_LOG_TYPE_DEBUG, "%@, %@: Received removing all runtime blacklist files command: %@", buf, 0x20u);
  }
  if (!+[_DPBlacklistManager removeAllFilesFromDirectory:v13])
  {
    v15 = +[_DPLog daemon];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[_DPBlacklistManager processRuntimeBlacklist:systemDirectory:runtimeDirectory:blacklistLengthLimit:]((uint64_t)a1, a2);
    }
    goto LABEL_22;
  }
LABEL_23:
}

+ (id)keepLatestRuntimeBlacklistInDirectory:(id)a3 compareToSystemBlacklistInDirectory:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v25 = (id)[MEMORY[0x1E4F1CC08] mutableCopy];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v32 = 0;
  v27 = v5;
  v8 = [v7 contentsOfDirectoryAtPath:v5 error:&v32];
  id v24 = v32;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = +[_DPBlacklist extractKeyFromFileName:*(void *)(*((void *)&v28 + 1) + 8 * v12)];
        if ([v13 length])
        {
          v14 = (void *)MEMORY[0x1E019F810]();
          v15 = +[_DPBlacklist blacklistForKey:v13 fromConfigurationsFile:v27];
          if (+[_DPBlacklist blacklistExistsWithKey:v13 inDirectory:v6])
          {
            goto LABEL_10;
          }
          v16 = +[_DPKeyNames keyPropertiesForKey:v13];
          if (v16)
          {

LABEL_10:
            v17 = +[_DPBlacklist blacklistForKey:v13 fromConfigurationsFile:v6];
            uint64_t v18 = [v15 version];
            uint64_t v19 = [v17 version];
            v20 = v15;
            if (v18 <= v19)
            {
              [(id)objc_opt_class() removeBlacklistFileWithKey:v13 fromDirectory:v27];
              v20 = v17;
            }
            v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "version"));
            [v25 setObject:v21 forKeyedSubscript:v13];
          }
          else
          {
            [(id)objc_opt_class() removeBlacklistFileWithKey:v13 fromDirectory:v27];
          }
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }

  return v25;
}

+ (BOOL)removeAllFilesFromDirectory:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1E019F810]();
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v27 = 0;
  id v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v27];
  id v6 = v27;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    char v23 = 1;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v6;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        id v13 = [NSString stringWithFormat:@"%@/%@", v3, v12];
        id v26 = v11;
        char v14 = [v4 removeItemAtPath:v13 error:&v26];
        id v6 = v26;

        if ((v14 & 1) == 0)
        {
          v15 = +[_DPLog daemon];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (objc_class *)objc_opt_class();
            id v24 = NSStringFromClass(v16);
            v17 = NSStringFromSelector(a2);
            uint64_t v18 = [v6 description];
            *(_DWORD *)buf = 138413058;
            __int16 v33 = v24;
            __int16 v34 = 2112;
            __int16 v35 = v17;
            __int16 v36 = 2112;
            uint64_t v37 = v12;
            __int16 v38 = 2112;
            uint64_t v39 = v18;
            uint64_t v19 = (void *)v18;
            _os_log_error_impl(&dword_1DC55E000, v15, OS_LOG_TYPE_ERROR, "%@, %@: Failed to delete a file named as %@ from runtime blacklist directory: %@", buf, 0x2Au);
          }
          char v23 = 0;
        }

        ++v10;
        uint64_t v11 = v6;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v8);
  }
  else
  {
    char v23 = 1;
  }

  return v23 & 1;
}

+ (BOOL)validateBlacklist:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v16 = 0;
    objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"^[\\._a-zA-Z0-9]+:[0-9]+,[[^,:;]+,]*[^,:;]+$",
      0,
    v4 = &v16);
    id v5 = v16;
    if (v5)
    {
      BOOL v6 = 0;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v7 = 0;
    if ([v3 length])
    {
      unint64_t v8 = 0;
      while (2)
      {
        uint64_t v9 = (void *)MEMORY[0x1E019F810]();
        if (!v7) {
          uint64_t v7 = (void *)[&stru_1F3681BE0 mutableCopy];
        }
        while (1)
        {
          if (v8 >= [v3 length]) {
            goto LABEL_19;
          }
          unsigned int v10 = [v3 characterAtIndex:v8];
          uint64_t v11 = v10 <= 0x7F ? v10 : 97;
          if (v11 == 59) {
            break;
          }
          objc_msgSend(v7, "appendFormat:", @"%c", v11);
          ++v8;
        }
        if ([v7 length])
        {
          uint64_t v12 = objc_msgSend(v4, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
          if (![v12 range])
          {
            uint64_t v13 = [v7 length];
            [v12 range];
            if (v13 == v14)
            {

              ++v8;
              uint64_t v7 = 0;
LABEL_19:
              if (v8 < [v3 length]) {
                continue;
              }
              goto LABEL_20;
            }
          }
        }
        break;
      }
      BOOL v6 = 0;
      goto LABEL_23;
    }
LABEL_20:
    BOOL v6 = [v7 length] == 0;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v6 = 0;
LABEL_25:

  return v6;
}

+ (BOOL)saveBlacklist:(id)a3 systemDirectory:(id)a4 runtimeDirectory:(id)a5 memoryLimit:(unint64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  +[_DPBlacklist resetAllBlacklists];
  uint64_t v13 = [(id)objc_opt_class() keepLatestRuntimeBlacklistInDirectory:v12 compareToSystemBlacklistInDirectory:v11];
  unint64_t v14 = [(id)objc_opt_class() memoryRequiredBySystemBlacklistInDirectory:v11 runtimeBlacklistInDirectory:v12 blacklist:v10];
  if (v14 <= a6)
  {
    char v17 = [(id)objc_opt_class() saveBlacklist:v10 knownVersionByKey:v13 systemDirectory:v11 runtimeDirectory:v12];
  }
  else
  {
    unint64_t v15 = v14;
    id v16 = +[_DPLog daemon];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = NSStringFromSelector(a2);
      int v22 = 138413058;
      char v23 = v20;
      __int16 v24 = 2112;
      id v25 = v21;
      __int16 v26 = 2048;
      unint64_t v27 = v15;
      __int16 v28 = 2048;
      unint64_t v29 = a6;
      _os_log_error_impl(&dword_1DC55E000, v16, OS_LOG_TYPE_ERROR, "%@, %@: total required memory(%llu) exceeds limit : %llu", (uint8_t *)&v22, 0x2Au);
    }
    char v17 = 0;
  }

  return v17;
}

+ (unint64_t)memoryRequiredBySystemBlacklistInDirectory:(id)a3 runtimeBlacklistInDirectory:(id)a4 blacklist:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() memorySizeWithDirectory:v9];

  uint64_t v11 = [(id)objc_opt_class() memorySizeWithDirectory:v8];
  uint64_t v12 = [v7 lengthOfBytesUsingEncoding:4];

  return v11 + v10 + v12;
}

+ (unint64_t)memorySizeWithDirectory:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v4 contentsOfDirectoryAtPath:v3 error:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = +[_DPBlacklist extractKeyFromFileName:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        if ([v11 length])
        {
          uint64_t v12 = +[_DPBlacklist filePathWithKey:v11 inDirectory:v3];
          uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
          unint64_t v14 = [v13 attributesOfItemAtPath:v12 error:0];
          uint64_t v15 = [v14 fileSize];

          v8 += v15;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)saveBlacklist:(id)a3 knownVersionByKey:(id)a4 systemDirectory:(id)a5 runtimeDirectory:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v39 = a5;
  id v40 = a6;
  context = (void *)MEMORY[0x1E019F810]();
  if ([v9 length])
  {
    unint64_t v11 = 0;
    BOOL v12 = 1;
    unint64_t v13 = -1;
    unint64_t v14 = -1;
    uint64_t v41 = v10;
    while (1)
    {
      if (v13 == -1)
      {
        unint64_t v14 = v11;
        unint64_t v13 = v11;
      }
      if ([v9 characterAtIndex:v11] == 59)
      {
        if (v14 - v13 < 3) {
          goto LABEL_38;
        }
        uint64_t v15 = (void *)MEMORY[0x1E019F810]();
        unint64_t v16 = v13;
        if (v14 >= v13)
        {
          unint64_t v16 = v13;
          if ([v9 characterAtIndex:v13] != 58)
          {
            unint64_t v17 = v13;
            do
              unint64_t v16 = v17++;
            while (v17 <= v14 && [v9 characterAtIndex:v17] != 58);
          }
        }
        long long v18 = objc_msgSend(v9, "substringWithRange:", v13, v16 - v13 + 1);
        long long v19 = +[_DPKeyNames keyPropertiesForKey:v18];
        if (v19)
        {
          v43 = v19;
          v44 = v15;
          BOOL v42 = v12;
          unint64_t v20 = v16 + 2;
          unint64_t v21 = v16 + 2;
          if (v16 + 2 <= v14)
          {
            unint64_t v21 = v16 + 2;
            if ([v9 characterAtIndex:v16 + 2] != 44)
            {
              unint64_t v22 = v16 + 2;
              do
                unint64_t v21 = v22++;
              while (v22 <= v14 && [v9 characterAtIndex:v22] != 44);
            }
          }
          unint64_t v23 = ~v16;
          __int16 v24 = objc_msgSend(v9, "substringWithRange:", v16 + 2, v21 + ~v16);
          uint64_t v45 = -1;
          id v25 = [MEMORY[0x1E4F28FE8] scannerWithString:v24];
          if (([v25 scanInteger:&v45] & 1) != 0 || (objc_msgSend(v25, "isAtEnd") & 1) == 0)
          {
            unint64_t v27 = objc_msgSend(v9, "substringWithRange:", v20, v14 + v23);
            id v10 = v41;
            __int16 v28 = [v41 objectForKeyedSubscript:v18];

            if (v28)
            {
              unint64_t v29 = [v41 objectForKeyedSubscript:v18];
              int v30 = [v29 intValue];
              uint64_t v31 = v45;

              int v32 = v31 > v30
                 && v42 & [(id)objc_opt_class() saveBlacklist:v27 forKey:v18 runtimeDirectory:v40];
            }
            else
            {
              BOOL v33 = +[_DPBlacklist blacklistExistsWithKey:v18 inDirectory:v39];
              __int16 v34 = +[_DPBlacklist blacklistForKey:v18 fromConfigurationsFile:v39];
              __int16 v35 = v34;
              if (v33 && (uint64_t v36 = [v34 version], v36 >= v45)) {
                int v32 = 0;
              }
              else {
                int v32 = v42 & [(id)objc_opt_class() saveBlacklist:v27 forKey:v18 runtimeDirectory:v40];
              }
            }
            int v26 = 0;
            BOOL v12 = v32 != 0;
            unint64_t v14 = -1;
            unint64_t v13 = -1;
          }
          else
          {
            int v26 = 1;
            id v10 = v41;
            BOOL v12 = v42;
          }

          long long v19 = v43;
          uint64_t v15 = v44;
        }
        else
        {
          int v26 = 1;
        }

        if (v26)
        {
LABEL_38:
          LOBYTE(v12) = 0;
          goto LABEL_39;
        }
      }
      else
      {
        unint64_t v14 = v11;
      }
      if (++v11 >= [v9 length]) {
        goto LABEL_39;
      }
    }
  }
  LOBYTE(v12) = 1;
LABEL_39:

  return v12;
}

+ (BOOL)saveBlacklist:(id)a3 forKey:(id)a4 runtimeDirectory:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[_DPBlacklist filePathWithKey:v8 inDirectory:v9];
  unint64_t v11 = (void *)MEMORY[0x1E019F810]();
  BOOL v12 = [v7 stringByReplacingOccurrencesOfString:@"," withString:@"\n"];
  unint64_t v13 = [NSString stringWithFormat:@"%@%@", v12, @"\n"];

  id v24 = 0;
  char v14 = [v13 writeToFile:v10 atomically:1 encoding:4 error:&v24];
  id v15 = v24;
  if ((v14 & 1) == 0)
  {
    unint64_t v16 = +[_DPLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = objc_opt_class();
      id v21 = v20;
      NSStringFromSelector(a2);
      aSelectora = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v15 description];
      *(_DWORD *)buf = 138413058;
      int v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = aSelectora;
      __int16 v29 = 2112;
      int v30 = v10;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      long long v19 = (void *)v18;
      _os_log_error_impl(&dword_1DC55E000, v16, OS_LOG_TYPE_ERROR, "%@ : %@ : Saving runtime blacklists failed! '%@' : %@", buf, 0x2Au);
    }
  }

  return v14;
}

+ (BOOL)removeBlacklistFileWithKey:(id)a3 fromDirectory:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E019F810]();
  id v9 = +[_DPBlacklist filePathWithKey:v6 inDirectory:v7];
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  char v11 = [v10 removeItemAtPath:v9 error:&v19];
  id v12 = v19;

  if ((v11 & 1) == 0)
  {
    unint64_t v13 = +[_DPLog daemon];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = (objc_class *)objc_opt_class();
      unint64_t v16 = NSStringFromClass(v15);
      unint64_t v17 = NSStringFromSelector(a2);
      uint64_t v18 = [v12 description];
      *(_DWORD *)buf = 138413058;
      id v21 = v16;
      __int16 v22 = 2112;
      unint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      __int16 v27 = v18;
      _os_log_error_impl(&dword_1DC55E000, v13, OS_LOG_TYPE_ERROR, "%@, %@: Failed to delete a runtime blacklist with the key of %@ : %@", buf, 0x2Au);
    }
  }

  return v11;
}

+ (BOOL)createRuntimeBlacklistDirectory:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___DPBlacklistManager_createRuntimeBlacklistDirectory___block_invoke;
  block[3] = &unk_1E6C43BB8;
  id v9 = v3;
  uint64_t v4 = createRuntimeBlacklistDirectory__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&createRuntimeBlacklistDirectory__onceToken, block);
  }
  char v6 = createRuntimeBlacklistDirectory__created;

  return v6;
}

+ (void)processRuntimeBlacklist
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(v2, v3, v4, 5.778e-34);
  _os_log_error_impl(&dword_1DC55E000, v6, OS_LOG_TYPE_ERROR, "%@, %@: DA String is not successfully removed.", v5, 0x16u);
}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___DPBlacklistManager_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E6C43BE0;
  v7[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E019FA60](v7);
  os_log_t v6 = +[_DPPeriodicTask taskWithName:v4 period:kSecondsIn24Hours handler:v5];

  +[_DPPeriodicTaskManager registerTask:v6];
}

+ (void)processRuntimeBlacklist:(uint64_t)a1 systemDirectory:(const char *)a2 runtimeDirectory:blacklistLengthLimit:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v6, v7, "%@, %@: Failed cleaning runtime blacklist directory", v8, v9, v10, v11, v12);
}

+ (void)processRuntimeBlacklist:(uint64_t)a1 systemDirectory:(const char *)a2 runtimeDirectory:blacklistLengthLimit:.cold.2(uint64_t a1, const char *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v6, v7, "%@, %@: blacklist string is too long, unable to process.", v8, v9, v10, v11, v12);
}

@end