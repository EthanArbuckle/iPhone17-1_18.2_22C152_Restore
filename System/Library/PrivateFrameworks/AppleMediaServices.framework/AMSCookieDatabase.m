@interface AMSCookieDatabase
+ (id)_dataVaultPathForIdentifier:(id)a3 error:(id *)a4;
+ (id)_databasePathForIdentifier:(id)a3 error:(id *)a4;
+ (id)_databasePathForIdentifiers:(id)a3 fileManager:(id)a4 error:(id *)a5;
+ (id)_rootDataVaultPathWithError:(id *)a3;
+ (id)cleanUpCookieDatabasesWithValidIdentifiers:(id)a3 fileManager:(id)a4;
+ (id)cookieDatabaseForIdentifier:(id)a3 error:(id *)a4;
+ (id)cookieDatabaseForIdentifiers:(id)a3 error:(id *)a4;
+ (id)cookieDatabaseForIdentifiers:(id)a3 error:(id *)a4 fileManager:(id)a5;
+ (id)databasePathForIdentifiers:(id)a3 error:(id *)a4;
+ (void)_cleanUpProtectionClassAtPath:(id)a3 fileManager:(id)a4;
- (AMSCookieDatabase)initWithConnection:(id)a3 path:(id)a4;
- (AMSSQLiteConnection)connection;
- (BOOL)_addCookieProperties:(id)a3 error:(id *)a4;
- (BOOL)_executeStatement:(id)a3 columns:(id)a4 forCookieProperties:(id)a5 error:(id *)a6;
- (BOOL)_removeCookieProperties:(id)a3 error:(id *)a4;
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 error:(id *)a5;
- (NSString)dbPath;
- (id)_cookieDictionaryForCursor:(id)a3;
- (id)cookiePropertiesWithError:(id *)a3;
- (void)_bindCookieProperties:(id)a3 column:(unint64_t)a4 position:(int)a5 using:(id)a6;
- (void)close;
- (void)dealloc;
@end

@implementation AMSCookieDatabase

- (id)_cookieDictionaryForCursor:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = AMSNameForAMSCookieDatabaseColumn(6uLL);
  v5 = [v3 stringForColumnName:v4];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = (id)*MEMORY[0x1E4F18C28];
    v18 = v5;
    [v6 setObject:v5 forKeyedSubscript:v7];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [&unk_1EDD01948 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(&unk_1EDD01948);
          }
          unint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) unsignedIntegerValue];
          v13 = NSHTTPCookiePropertyKeyForAMSCookieDatabaseColumn(v12);
          v14 = AMSNameForAMSCookieDatabaseColumn(v12);
          v15 = [v3 stringForColumnName:v14];

          if ([v15 isEqualToString:&stru_1EDCA7308])
          {

            v15 = 0;
          }
          [v6 setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v9 = [&unk_1EDD01948 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
    v16 = (void *)[v6 copy];

    v5 = v18;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_bindCookieProperties:(id)a3 column:(unint64_t)a4 position:(int)a5 using:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  v11 = NSHTTPCookiePropertyKeyForAMSCookieDatabaseColumn(a4);
  if (v11)
  {
    switch(a4)
    {
      case 0uLL:
      case 2uLL:
      case 5uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        unint64_t v12 = [v9 objectForKeyedSubscript:v11];
        v13 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v13)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        v14 = [v13 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = objc_opt_class();
          AMSLogKey();
          id v51 = v10;
          id v16 = v9;
          v18 = uint64_t v17 = v7;
          long long v19 = AMSHashIfNeeded(v11);
          long long v20 = AMSHashIfNeeded(v12);
          *(_DWORD *)buf = 138544386;
          uint64_t v54 = v15;
          __int16 v55 = 2114;
          v56 = v18;
          __int16 v57 = 2114;
          v58 = v19;
          __int16 v59 = 2114;
          v60 = v20;
          __int16 v61 = 1026;
          int v62 = v17;
          _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Binding a nullable key. key = %{public}@ | value = %{public}@ | position = %{public}d", buf, 0x30u);

          uint64_t v7 = v17;
          id v9 = v16;
          id v10 = v51;
        }

        [v10 bindNullableString:v12 atPosition:v7];
        goto LABEL_33;
      case 1uLL:
      case 7uLL:
        v26 = [v9 objectForKeyedSubscript:v11];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_24;
        }
        v27 = [v26 absoluteString];
        goto LABEL_23;
      case 3uLL:
      case 8uLL:
        uint64_t v28 = [v9 objectForKeyedSubscript:v11];
        v29 = (void *)v28;
        v30 = &stru_1EDCA7308;
        if (v28) {
          v30 = (__CFString *)v28;
        }
        unint64_t v12 = v30;

        v31 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v31)
        {
          v31 = +[AMSLogConfig sharedConfig];
        }
        v32 = [v31 OSLogObject];
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        uint64_t v33 = objc_opt_class();
        v34 = AMSLogKey();
        v35 = AMSHashIfNeeded(v11);
        AMSHashIfNeeded(v12);
        id v52 = v10;
        id v36 = v9;
        v38 = uint64_t v37 = v7;
        *(_DWORD *)buf = 138544386;
        uint64_t v54 = v33;
        __int16 v55 = 2114;
        v56 = v34;
        __int16 v57 = 2114;
        v58 = v35;
        __int16 v59 = 2114;
        v60 = v38;
        __int16 v61 = 1026;
        int v62 = v37;
        v39 = "%{public}@ [%{public}@]: Binding a nullable key that we can't store as NULL. key = %{public}@ | value = %{"
              "public}@ | position = %{public}d";
        goto LABEL_31;
      case 4uLL:
        v26 = [v9 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v40 = (void *)MEMORY[0x1E4F28D48];
          v41 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
          v27 = [v40 stringFromDate:v26 timeZone:v41 formatOptions:1907];

LABEL_23:
          [v10 bindNullableString:v27 atPosition:v7];
        }
        else
        {
LABEL_24:
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 bindString:v26 atPosition:v7];
          }
          else {
            [v10 bindNullAtPosition:v7];
          }
        }

        break;
      case 6uLL:
        unint64_t v12 = [v9 objectForKeyedSubscript:v11];
        uint64_t v42 = +[AMSLogConfig sharedAccountsCookiesConfig];
        v31 = (void *)v42;
        if (v12)
        {
          if (!v42)
          {
            v31 = +[AMSLogConfig sharedConfig];
          }
          v32 = [v31 OSLogObject];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v43 = objc_opt_class();
            v34 = AMSLogKey();
            v35 = AMSHashIfNeeded(v11);
            AMSHashIfNeeded(v12);
            id v52 = v10;
            id v36 = v9;
            v38 = uint64_t v37 = v7;
            *(_DWORD *)buf = 138544386;
            uint64_t v54 = v43;
            __int16 v55 = 2114;
            v56 = v34;
            __int16 v57 = 2114;
            v58 = v35;
            __int16 v59 = 2114;
            v60 = v38;
            __int16 v61 = 1026;
            int v62 = v37;
            v39 = "%{public}@ [%{public}@]: Binding a non-null key. key = %{public}@ | value = %{public}@ | position = %{public}d";
LABEL_31:
            _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_INFO, v39, buf, 0x30u);

            uint64_t v7 = v37;
            id v9 = v36;
            id v10 = v52;
          }
LABEL_32:

          [v10 bindString:v12 atPosition:v7];
        }
        else
        {
          if (!v42)
          {
            v31 = +[AMSLogConfig sharedConfig];
          }
          v44 = [v31 OSLogObject];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = objc_opt_class();
            AMSLogKey();
            id v46 = v10;
            id v47 = v9;
            v49 = int v48 = v7;
            v50 = AMSHashIfNeeded(v11);
            *(_DWORD *)buf = 138544130;
            uint64_t v54 = v45;
            __int16 v55 = 2114;
            v56 = v49;
            __int16 v57 = 2114;
            v58 = v50;
            __int16 v59 = 1026;
            LODWORD(v60) = v48;
            id v9 = v47;
            id v10 = v46;
            _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Attempting to store a NULL name. key = %{public}@ | position = %{public}d", buf, 0x26u);
          }
        }
LABEL_33:

        break;
      case 0xEuLL:
        [v10 bindNullAtPosition:v7];
        break;
      default:
        break;
    }
  }
  else
  {
    long long v21 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v21)
    {
      long long v21 = +[AMSLogConfig sharedConfig];
    }
    long long v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = AMSLogKey();
      v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v23;
      __int16 v55 = 2114;
      v56 = v24;
      __int16 v57 = 2114;
      v58 = v25;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Attempting to bind a key for an invalid column. column = %{public}@", buf, 0x20u);
    }
  }
}

uint64_t __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fileExistsAtPath:a2];
}

void __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
    uint64_t v8 = (void *)v9;
    if (v6)
    {
      if (!v9)
      {
        uint64_t v8 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v8 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v11 = objc_opt_class();
      unint64_t v12 = AMSLogKey();
      v13 = AMSLogableError(v6);
      int v20 = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      v25 = v13;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Error enumerating row: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    else
    {
      if (!v9)
      {
        uint64_t v8 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v8 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v19 = objc_opt_class();
      unint64_t v12 = AMSLogKey();
      int v20 = 138543618;
      uint64_t v21 = v19;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Enumerated row and got neither a cursor nor an error.", (uint8_t *)&v20, 0x16u);
    }

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v7 = [*(id *)(a1 + 32) _cookieDictionaryForCursor:v5];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    [*(id *)(a1 + 40) addObject:v7];
  }
  else
  {
    v14 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      v18 = AMSHashIfNeeded(v5);
      int v20 = 138543874;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Could not create cookie properties for cursor: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v8 = 0;
  }
LABEL_20:
}

void __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke_2;
  v7[3] = &unk_1E55A1310;
  v4 = (void *)a1[4];
  id v5 = (void *)a1[6];
  v7[4] = a1[5];
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

uint64_t __91__AMSCookieDatabase_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    id v14 = 0;
    char v4 = [v2 _removeCookieProperties:v3 error:&v14];
    id v5 = v14;
    id v6 = v5;
    if ((v4 & 1) == 0 && v5) {
      [*(id *)(a1 + 48) addObject:v5];
    }
  }
  else
  {
    char v4 = 1;
  }
  if ([*(id *)(a1 + 56) count])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v13 = 0;
    char v9 = [v7 _addCookieProperties:v8 error:&v13];
    id v10 = v13;
    uint64_t v11 = v10;
    if ((v9 & 1) == 0 && v10) {
      [*(id *)(a1 + 48) addObject:v10];
    }

    v4 &= v9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v4;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

uint64_t __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke_2(void *a1, void *a2, int a3)
{
  uint64_t v5 = [a2 unsignedIntegerValue];
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  return [v6 _bindCookieProperties:v7 column:v5 position:(a3 + 1) using:v8];
}

__CFString *__48__AMSCookieDatabase__addCookieProperties_error___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  return AMSNameForAMSCookieDatabaseColumn(v2);
}

+ (id)databasePathForIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  uint64_t v8 = [v6 defaultManager];
  char v9 = [a1 _databasePathForIdentifiers:v7 fileManager:v8 error:a4];

  return v9;
}

+ (id)_databasePathForIdentifiers:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  uint64_t v11 = objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke;
  v23[3] = &unk_1E55A12E8;
  id v25 = a1;
  id v12 = v11;
  id v24 = v12;
  id v13 = objc_msgSend(v10, "ams_mapWithTransformIgnoresNil:", v23);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke_2;
  v21[3] = &unk_1E559E2C0;
  id v22 = v8;
  id v14 = v8;
  uint64_t v15 = objc_msgSend(v13, "ams_firstObjectPassingTest:", v21);
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
LABEL_5:
    v18 = v17;
    goto LABEL_6;
  }
  if ([v13 count])
  {
    id v17 = [v13 firstObject];
    goto LABEL_5;
  }
  if ((unint64_t)[v12 count] < 2)
  {
    if ([v12 count] == 1)
    {
      if (a5)
      {
        int v20 = [v12 objectAtIndexedSubscript:0];
        goto LABEL_17;
      }
    }
    else if (a5)
    {
      int v20 = AMSError(0, @"Error creating database path", 0, 0);
      goto LABEL_17;
    }
  }
  else if (a5)
  {
    int v20 = AMSErrorWithMultipleUnderlyingErrors(16, @"Error creating database path", 0, v12);
LABEL_17:
    v18 = 0;
    *a5 = v20;
    goto LABEL_6;
  }
  v18 = 0;
LABEL_6:

  return v18;
}

id __67__AMSCookieDatabase__databasePathForIdentifiers_fileManager_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v9 = 0;
  char v4 = [v3 _databasePathForIdentifier:a2 error:&v9];
  id v5 = v9;
  id v6 = v5;
  if (v4)
  {
    id v7 = v4;
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return v4;
}

+ (id)_databasePathForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [a1 _dataVaultPathForIdentifier:v7 error:a4];
  if (v8)
  {
    id v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      id v13 = NSStringFromSelector(a2);
      id v14 = AMSHashIfNeeded(v13);
      uint64_t v15 = AMSHashIfNeeded(v7);
      uint64_t v16 = AMSHashIfNeeded(v8);
      int v19 = 138544386;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v12;
      __int16 v23 = 2114;
      id v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      uint64_t v28 = v16;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: %{public}@ | identifier = %{public}@ | dataVaultPath = %{public}@", (uint8_t *)&v19, 0x34u);
    }
    id v17 = +[AMSDatabaseHelper databasePathForDataVaultPath:v8 type:2];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)_dataVaultPathForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 _rootDataVaultPathWithError:a4];
  id v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

+ (id)_rootDataVaultPathWithError:(id *)a3
{
  uint64_t v4 = +[AMSDatabaseHelper databaseFolderNameForType:2];
  id v5 = (void *)v4;
  if (a3 && !v4)
  {
    AMSError(7, @"Database Path Not Found", @"Could not find path for database", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)updateCookiesWithCookiePropertiesToAdd:(id)a3 cookiePropertiesToRemove:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v11 = [(AMSCookieDatabase *)self connection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__AMSCookieDatabase_updateCookiesWithCookiePropertiesToAdd_cookiePropertiesToRemove_error___block_invoke;
  v23[3] = &unk_1E55A1400;
  id v12 = v9;
  id v24 = v12;
  __int16 v25 = self;
  id v13 = v10;
  id v26 = v13;
  id v14 = v8;
  id v27 = v14;
  uint64_t v28 = &v29;
  [v11 performTransaction:v23];

  if ([v13 count] == 1)
  {
    if (a5)
    {
      *a5 = [v13 objectAtIndexedSubscript:0];
    }
  }
  else if ((unint64_t)[v13 count] < 2)
  {
    uint64_t v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      int v19 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v18;
      __int16 v35 = 2114;
      id v36 = v19;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting a CookiesChanged notification.", buf, 0x16u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.AppleMediaServices.cookieschanged", 0, 0, 0);
  }
  else if (a5)
  {
    uint64_t v15 = (void *)[v13 copy];
    AMSErrorWithMultipleUnderlyingErrors(16, @"Multiple Database Errors", @"Encountered multiple errors modifying the cookie database.", v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v21 = *((unsigned char *)v30 + 24) != 0;

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (id)cookiePropertiesWithError:(id *)a3
{
  id v5 = +[AMSKeepAlive keepAliveWithName:@"AMSCookies"];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__21;
  uint64_t v18 = __Block_byref_object_dispose__21;
  id v19 = 0;
  id v6 = [(AMSCookieDatabase *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke;
  v10[3] = &unk_1E55A13D8;
  id v12 = &v14;
  id v13 = a3;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  [v6 executeQuery:@"SELECT * FROM cookies" withResults:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
    {
      id v13 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = AMSLogKey();
        id v17 = AMSLogableError(v7);
        *(_DWORD *)buf = 138543874;
        uint64_t v41 = v15;
        __int16 v42 = 2114;
        uint64_t v43 = v16;
        __int16 v44 = 2114;
        uint64_t v45 = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Cookie query returned error: %{public}@", buf, 0x20u);
      }
      if (*(void *)(a1 + 56))
      {
        id v12 = v7;
        goto LABEL_15;
      }
    }
    else
    {
      int v18 = [(id)v5 hasRows];
      uint64_t v19 = +[AMSLogConfig sharedAccountsCookiesConfig];
      uint64_t v20 = (void *)v19;
      if (v18)
      {
        if (!v19)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        BOOL v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = objc_opt_class();
          __int16 v23 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v41 = v22;
          __int16 v42 = 2114;
          uint64_t v43 = v23;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: Cookie query returned row(s), enumerating.", buf, 0x16u);
        }
        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        id v36 = __47__AMSCookieDatabase_cookiePropertiesWithError___block_invoke_143;
        uint64_t v37 = &unk_1E55A13B0;
        uint64_t v38 = *(void *)(a1 + 32);
        id v39 = v24;
        id v25 = v24;
        [(id)v5 enumerateRowsUsingBlock:&v34];
        uint64_t v26 = objc_msgSend(v25, "copy", v34, v35, v36, v37, v38);
        uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;
      }
      else
      {
        if (!v19)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v29 = [v20 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = objc_opt_class();
          uint64_t v31 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v41 = v30;
          __int16 v42 = 2114;
          uint64_t v43 = v31;
          _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: Cookie query returned no rows, returning empty array.", buf, 0x16u);
        }
        uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v33 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    id v8 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v10;
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Cookie query returned with neither results nor an error.", buf, 0x16u);
    }
    if (*(void *)(a1 + 56))
    {
      AMSError(16, @"Unknown Database Error", @"A query returned with neither results nor an error.", 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      **(void **)(a1 + 56) = v12;
    }
  }
  [*(id *)(a1 + 40) invalidate];
}

- (BOOL)_addCookieProperties:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    id v11 = AMSHashIfNeeded(v6);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    id v36 = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Adding cookie properties. cookieProperties = %{public}@", buf, 0x20u);
  }
  id v12 = +[AMSKeepAlive keepAliveWithName:@"AMSCookies"];
  id v13 = AMSCookieDatabaseColumnAllCases();
  uint64_t v14 = objc_msgSend(v13, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_32);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v36) = 1;
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"REPLACE INTO cookies(");
  uint64_t v16 = [v14 componentsJoinedByString:@","];
  [v15 appendString:v16];

  [v15 appendString:@") VALUES ("];
  id v17 = objc_msgSend(MEMORY[0x1E4F1C978], "ams_arrayWithItem:count:", @"?", objc_msgSend(v13, "count"));
  int v18 = [v17 componentsJoinedByString:@","];
  [v15 appendString:v18];

  [v15 appendString:@";"]);
  uint64_t v19 = [(AMSCookieDatabase *)self connection];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __48__AMSCookieDatabase__addCookieProperties_error___block_invoke_2;
  uint64_t v28 = &unk_1E55A12C0;
  id v20 = v6;
  id v29 = v20;
  uint64_t v30 = self;
  id v21 = v15;
  id v31 = v21;
  id v22 = v13;
  id v32 = v22;
  uint64_t v33 = buf;
  uint64_t v34 = a4;
  [v19 performTransaction:&v25];

  objc_msgSend(v12, "invalidate", v25, v26, v27, v28);
  BOOL v23 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v23;
}

uint64_t __48__AMSCookieDatabase__addCookieProperties_error___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v32;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * v6);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        id v30 = 0;
        char v11 = [v8 _executeStatement:v9 columns:v10 forCookieProperties:v7 error:&v30];
        id v12 = v30;
        id v13 = v12;
        if ((v11 & 1) == 0)
        {
          uint64_t v15 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v15)
          {
            uint64_t v15 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v16 = [v15 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = objc_opt_class();
            int v18 = AMSLogKey();
            uint64_t v19 = AMSLogableError(v13);
            *(_DWORD *)buf = 138543874;
            uint64_t v36 = v17;
            __int16 v37 = 2114;
            uint64_t v38 = v18;
            __int16 v39 = 2114;
            v40 = v19;
            _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Failed to add cookies. error = %{public}@", buf, 0x20u);
          }
          if (*(void *)(a1 + 72)) {
            **(void **)(a1 + 72) = v13;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          if ([v13 code] == 8)
          {
            BOOL v20 = +[AMSUnitTests isRunningUnitTests];
            uint64_t v21 = +[AMSLogConfig sharedAccountsCookiesConfig];
            id v22 = (void *)v21;
            if (v20)
            {
              if (!v21)
              {
                id v22 = +[AMSLogConfig sharedConfig];
              }
              BOOL v23 = [v22 OSLogObject];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = objc_opt_class();
                uint64_t v25 = AMSLogKey();
                *(_DWORD *)buf = 138543618;
                uint64_t v36 = v24;
                __int16 v37 = 2114;
                uint64_t v38 = v25;
                _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Failed to add cookies with read-only error", buf, 0x16u);
              }
              id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
              uint64_t v26 = +[AMSLogConfig sharedAccountsCookiesConfig];
              [v22 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v26 userInfo:0];
            }
            else
            {
              if (!v21)
              {
                id v22 = +[AMSLogConfig sharedConfig];
              }
              uint64_t v26 = [v22 OSLogObject];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                uint64_t v27 = objc_opt_class();
                uint64_t v28 = AMSLogKey();
                *(_DWORD *)buf = 138543618;
                uint64_t v36 = v27;
                __int16 v37 = 2114;
                uint64_t v38 = v28;
                _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_FAULT, "%{public}@ [%{public}@]: Failed to add cookies with read-only error", buf, 0x16u);
              }
            }
          }
          uint64_t v14 = 0;
          goto LABEL_29;
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_29:

  return v14;
}

- (BOOL)_executeStatement:(id)a3 columns:(id)a4 forCookieProperties:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(AMSCookieDatabase *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__AMSCookieDatabase__executeStatement_columns_forCookieProperties_error___block_invoke;
  v17[3] = &unk_1E55A1338;
  id v18 = v10;
  uint64_t v19 = self;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  LOBYTE(a6) = [v13 executeStatement:v12 error:a6 bindings:v17];

  return (char)a6;
}

- (AMSSQLiteConnection)connection
{
  return self->_connection;
}

+ (void)_cleanUpProtectionClassAtPath:(id)a3 fileManager:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 fileExistsAtPath:v6])
  {
    id v84 = 0;
    id v8 = [v7 attributesOfItemAtPath:v6 error:&v84];
    id v9 = v84;
    if (v8)
    {
      id v10 = (void *)*MEMORY[0x1E4F28370];
      id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v12 = 0;

LABEL_59:
        goto LABEL_60;
      }
      id v12 = v11;

      if (!v12) {
        goto LABEL_59;
      }
      uint64_t v13 = *MEMORY[0x1E4F28358];
      if ([v12 isEqualToString:*MEMORY[0x1E4F28358]]) {
        goto LABEL_59;
      }
      v66 = v8;
      v67 = v12;
      id v14 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      id v15 = [v14 OSLogObject];
      v77 = v7;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = AMSLogKey();
        uint64_t v17 = NSString;
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = v18;
        if (v16)
        {
          AMSLogKey();
          id obj = (id)objc_claimAutoreleasedReturnValue();
          [v17 stringWithFormat:@"%@: [%@] ", v19, obj];
        }
        else
        {
          [v17 stringWithFormat:@"%@: ", v18];
        id v20 = };
        uint64_t v28 = AMSHashIfNeeded(v6);
        id v29 = AMSHashIfNeeded(v67);
        *(_DWORD *)buf = 138543874;
        uint64_t v89 = (uint64_t)v20;
        __int16 v90 = 2114;
        v91 = v28;
        __int16 v92 = 2114;
        v93 = v29;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Correcting file protection type of cookie database. path = %{public}@ | protectionType = %{public}@", buf, 0x20u);
        if (v16)
        {

          id v20 = obj;
        }

        id v7 = v77;
      }

      uint64_t v30 = [v6 stringByDeletingLastPathComponent];
      long long v31 = v7;
      long long v32 = v30;
      id v83 = v9;
      long long v33 = [v31 contentsOfDirectoryAtPath:v30 error:&v83];
      id v34 = v83;

      log = v32;
      if (v33)
      {
        id v65 = v6;
        v86 = v10;
        uint64_t v87 = v13;
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        obja = v33;
        uint64_t v36 = [obja countByEnumeratingWithState:&v79 objects:v85 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          v64 = v33;
          uint64_t v38 = *(void *)v80;
          uint64_t v71 = *(void *)v80;
          v72 = v35;
          do
          {
            uint64_t v39 = 0;
            v40 = v34;
            uint64_t v74 = v37;
            do
            {
              uint64_t v41 = v10;
              if (*(void *)v80 != v38) {
                objc_enumerationMutation(obja);
              }
              uint64_t v42 = [v32 stringByAppendingPathComponent:*(void *)(*((void *)&v79 + 1) + 8 * v39)];
              id v78 = v40;
              char v43 = [v77 setAttributes:v35 ofItemAtPath:v42 error:&v78];
              id v34 = v78;

              if (v43)
              {
                id v10 = v41;
              }
              else
              {
                __int16 v44 = v34;
                uint64_t v45 = +[AMSLogConfig sharedAccountsCookiesConfig];
                if (!v45)
                {
                  uint64_t v45 = +[AMSLogConfig sharedConfig];
                }
                uint64_t v46 = [v45 OSLogObject];
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  id v47 = AMSLogKey();
                  int v48 = NSString;
                  uint64_t v49 = objc_opt_class();
                  uint64_t v50 = v49;
                  if (v47)
                  {
                    uint64_t v70 = AMSLogKey();
                    uint64_t v51 = [v48 stringWithFormat:@"%@: [%@] ", v50, v70];
                    v69 = (void *)v51;
                    id v52 = v41;
                  }
                  else
                  {
                    uint64_t v51 = [v48 stringWithFormat:@"%@: ", v49];
                    id v52 = (void *)v51;
                  }
                  v53 = AMSHashIfNeeded(v42);
                  uint64_t v54 = AMSLogableError(v44);
                  *(_DWORD *)buf = 138543874;
                  uint64_t v89 = v51;
                  __int16 v90 = 2114;
                  v91 = v53;
                  __int16 v92 = 2114;
                  v93 = v54;
                  _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to alter file protection class. path = %{public}@ | error = %{public}@", buf, 0x20u);
                  __int16 v55 = v52;
                  id v10 = v52;
                  if (v47)
                  {

                    __int16 v55 = (void *)v70;
                  }

                  long long v32 = log;
                }
                else
                {
                  id v10 = v41;
                }

                uint64_t v38 = v71;
                uint64_t v35 = v72;
                id v34 = v44;
                uint64_t v37 = v74;
              }

              ++v39;
              v40 = v34;
            }
            while (v37 != v39);
            uint64_t v37 = [obja countByEnumeratingWithState:&v79 objects:v85 count:16];
          }
          while (v37);
          long long v33 = v64;
          id v6 = v65;
        }
      }
      else
      {
        uint64_t v35 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v35)
        {
          uint64_t v35 = +[AMSLogConfig sharedConfig];
        }
        obja = [v35 OSLogObject];
        if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
        {
          v73 = v35;
          v56 = AMSLogKey();
          __int16 v57 = NSString;
          uint64_t v58 = objc_opt_class();
          uint64_t v59 = v58;
          v60 = v34;
          if (v56)
          {
            uint64_t v35 = AMSLogKey();
            [v57 stringWithFormat:@"%@: [%@] ", v59, v35];
          }
          else
          {
            [v57 stringWithFormat:@"%@: ", v58];
          __int16 v61 = };
          int v62 = AMSHashIfNeeded(v32);
          uint64_t v63 = AMSLogableError(v60);
          *(_DWORD *)buf = 138543874;
          uint64_t v89 = (uint64_t)v61;
          __int16 v90 = 2114;
          v91 = v62;
          __int16 v92 = 2114;
          v93 = v63;
          _os_log_impl(&dword_18D554000, obja, OS_LOG_TYPE_ERROR, "%{public}@Cannot enumerate database parent directory. path = %{public}@ | error = %{public}@", buf, 0x20u);
          if (v56)
          {

            __int16 v61 = v35;
          }

          long long v33 = 0;
          uint64_t v35 = v73;
          id v34 = v60;
        }
      }
      id v7 = v77;

      id v9 = v34;
      id v8 = v66;
      id v12 = v67;
    }
    else
    {
      id v12 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v12)
      {
        id v12 = +[AMSLogConfig sharedConfig];
      }
      log = [v12 OSLogObject];
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = AMSLogKey();
        id v22 = NSString;
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = v23;
        if (v21)
        {
          uint64_t v4 = AMSLogKey();
          [v22 stringWithFormat:@"%@: [%@] ", v24, v4];
        }
        else
        {
          [v22 stringWithFormat:@"%@: ", v23];
        uint64_t v25 = };
        uint64_t v26 = AMSHashIfNeeded(v6);
        uint64_t v27 = AMSLogableError(v9);
        *(_DWORD *)buf = 138543874;
        uint64_t v89 = (uint64_t)v25;
        __int16 v90 = 2114;
        v91 = v26;
        __int16 v92 = 2114;
        v93 = v27;
        _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_ERROR, "%{public}@Cannot inspect attributes of database. path = %{public}@ | error = %{public}@", buf, 0x20u);
        if (v21)
        {

          uint64_t v25 = (void *)v4;
        }
      }
    }

    goto LABEL_59;
  }
LABEL_60:
}

- (BOOL)_removeCookieProperties:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    id v11 = AMSHashIfNeeded(v6);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v35 = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Removing cookie properties. cookieProperties = %{public}@", buf, 0x20u);
  }
  id v12 = +[AMSKeepAlive keepAliveWithName:@"AMSCookies"];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"DELETE FROM cookies WHERE "];
  id v14 = AMSCookieDatabaseColumnAllCases();
  id v15 = objc_msgSend(v14, "ams_filterUsingTest:", &__block_literal_global_86);

  uint64_t v16 = objc_msgSend(v15, "ams_mapWithTransform:", &__block_literal_global_88);
  uint64_t v17 = [v16 componentsJoinedByString:@" AND "];
  [v13 appendString:v17];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v35) = 1;
  uint64_t v18 = [(AMSCookieDatabase *)self connection];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke_3;
  uint64_t v27 = &unk_1E55A12C0;
  id v19 = v6;
  id v28 = v19;
  id v29 = self;
  id v20 = v13;
  id v30 = v20;
  id v21 = v15;
  long long v32 = buf;
  long long v33 = a4;
  id v31 = v21;
  [v18 performTransaction:&v24];

  objc_msgSend(v12, "invalidate", v24, v25, v26, v27);
  BOOL v22 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v22;
}

uint64_t __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  return (v2 < 9) & (0x148u >> v2);
}

id __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = NSString;
  uint64_t v3 = AMSNameForAMSCookieDatabaseColumn([a2 unsignedIntegerValue]);
  uint64_t v4 = [v2 stringWithFormat:@"%@ IS ?", v3];

  return v4;
}

uint64_t __51__AMSCookieDatabase__removeCookieProperties_error___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * v6);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        id v21 = 0;
        char v11 = [v8 _executeStatement:v9 columns:v10 forCookieProperties:v7 error:&v21];
        id v12 = v21;
        uint64_t v13 = v12;
        if ((v11 & 1) == 0)
        {
          id v15 = +[AMSLogConfig sharedAccountsCookiesConfig];
          if (!v15)
          {
            id v15 = +[AMSLogConfig sharedConfig];
          }
          uint64_t v16 = [v15 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = objc_opt_class();
            uint64_t v18 = AMSLogKey();
            id v19 = AMSLogableError(v13);
            *(_DWORD *)buf = 138543874;
            uint64_t v27 = v17;
            __int16 v28 = 2114;
            id v29 = v18;
            __int16 v30 = 2114;
            id v31 = v19;
            _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Failed to remove cookies. error = %{public}@", buf, 0x20u);
          }
          if (*(void *)(a1 + 72)) {
            **(void **)(a1 + 72) = v13;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;

          uint64_t v14 = 0;
          goto LABEL_17;
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_17:

  return v14;
}

+ (id)cleanUpCookieDatabasesWithValidIdentifiers:(id)a3 fileManager:(id)a4
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  id v127 = a4;
  uint64_t v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = AMSLogKey();
    id v8 = NSString;
    uint64_t v9 = objc_opt_class();
    if (v7)
    {
      uint64_t v10 = AMSLogKey();
      char v11 = NSStringFromSelector(a2);
      id v12 = [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v11];
    }
    else
    {
      uint64_t v10 = NSStringFromSelector(a2);
      id v12 = [v8 stringWithFormat:@"%@: %@ ", v9, v10];
      char v11 = v12;
    }
    uint64_t v13 = AMSHashIfNeededNonnull(v113);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@| validIdentifiers = %{public}@", buf, 0x16u);
    if (v7) {
  }
    }
  id v154 = 0;
  v112 = [a1 _rootDataVaultPathWithError:&v154];
  id v14 = v154;
  v107 = v14;
  if (!v112)
  {
    id v118 = +[AMSBinaryPromise promiseWithError:v14];
    goto LABEL_107;
  }
  id v15 = +[AMSDatabaseHelper dataVaultURLForDataVaultPath:](AMSDatabaseHelper, "dataVaultURLForDataVaultPath:");
  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = __76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke;
  v149[3] = &unk_1E55A1360;
  id v104 = v15;
  id v150 = v104;
  id v152 = a1;
  SEL v153 = a2;
  id v151 = v107;
  v129 = objc_msgSend(v113, "ams_mapWithTransformIgnoresNil:", v149);
  uint64_t v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v16)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = AMSLogKey();
    id v19 = NSString;
    uint64_t v20 = objc_opt_class();
    if (v18)
    {
      id v21 = AMSLogKey();
      long long v22 = NSStringFromSelector(a2);
      long long v23 = [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, v22];
    }
    else
    {
      id v21 = NSStringFromSelector(a2);
      long long v23 = [v19 stringWithFormat:@"%@: %@ ", v20, v21];
      long long v22 = v23;
    }
    long long v24 = AMSLogableURL(v104);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v24;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@| enumerating contents of %{public}@", buf, 0x16u);
    if (v18) {
  }
    }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v164 = __Block_byref_object_copy__21;
  v165 = __Block_byref_object_dispose__21;
  id v166 = 0;
  uint64_t v138 = *MEMORY[0x1E4F1C5A0];
  uint64_t v162 = *MEMORY[0x1E4F1C5A0];
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v162 count:1];
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke_105;
  v148[3] = &unk_1E55A1388;
  v148[6] = a2;
  v148[5] = a1;
  v148[4] = buf;
  uint64_t v26 = [v127 enumeratorAtURL:v104 includingPropertiesForKeys:v25 options:17 errorHandler:v148];

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id obj = v26;
  uint64_t v27 = [obj countByEnumeratingWithState:&v144 objects:v161 count:16];
  if (!v27) {
    goto LABEL_93;
  }
  uint64_t v137 = *(void *)v145;
  do
  {
    uint64_t v28 = 0;
    uint64_t v139 = v27;
    do
    {
      if (*(void *)v145 != v137) {
        objc_enumerationMutation(obj);
      }
      id v29 = *(void **)(*((void *)&v144 + 1) + 8 * v28);
      __int16 v30 = (void *)MEMORY[0x192FA47D0]();
      id v31 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v31)
      {
        id v31 = +[AMSLogConfig sharedConfig];
      }
      long long v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = AMSLogKey();
        id v34 = NSString;
        uint64_t v35 = objc_opt_class();
        if (v33)
        {
          uint64_t v135 = AMSLogKey();
          uint64_t v134 = NSStringFromSelector(a2);
          uint64_t v36 = [v34 stringWithFormat:@"%@: [%@] %@ ", v35, v135, v134];
          v131 = (void *)v36;
        }
        else
        {
          uint64_t v133 = NSStringFromSelector(a2);
          uint64_t v36 = [v34 stringWithFormat:@"%@: %@ ", v35, v133];
          v132 = (void *)v36;
        }
        uint64_t v37 = AMSLogableURL(v29);
        *(_DWORD *)v155 = 138543618;
        uint64_t v156 = v36;
        __int16 v157 = 2114;
        id v158 = v37;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ | Processing URL: %{public}@", v155, 0x16u);
        uint64_t v38 = v132;
        uint64_t v39 = (void *)v133;
        if (v33)
        {

          uint64_t v38 = (void *)v134;
          uint64_t v39 = (void *)v135;
        }
      }
      id v142 = 0;
      id v143 = 0;
      char v40 = [v29 getResourceValue:&v143 forKey:v138 error:&v142];
      id v41 = v143;
      id v42 = v142;
      if ((v40 & 1) == 0)
      {
        char v43 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v43)
        {
          char v43 = +[AMSLogConfig sharedConfig];
        }
        __int16 v44 = [v43 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v49 = AMSLogKey();
          uint64_t v50 = NSString;
          if (v49)
          {
            uint64_t v51 = objc_opt_class();
            uint64_t v128 = AMSLogKey();
            uint64_t v52 = [v50 stringWithFormat:@"%@: [%@] ", v51, v128];
            v125 = (void *)v52;
          }
          else
          {
            uint64_t v52 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
            v126 = (void *)v52;
          }
          AMSLogableURL(v29);
          id v59 = (id)objc_claimAutoreleasedReturnValue();
          v60 = AMSLogableError(v42);
          *(_DWORD *)v155 = 138543874;
          uint64_t v156 = v52;
          __int16 v157 = 2114;
          id v158 = v59;
          __int16 v159 = 2114;
          v160 = v60;
          _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@Error getting file resource identifier. URL = %{public}@ | error = %{public}@", v155, 0x20u);

          __int16 v61 = v126;
          if (v49)
          {

            __int16 v61 = (void *)v128;
          }
        }
        int v62 = 3;
        goto LABEL_82;
      }
      if ([v129 containsObject:v41])
      {
        char v43 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v43)
        {
          char v43 = +[AMSLogConfig sharedConfig];
        }
        __int16 v44 = [v43 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v45 = AMSLogKey();
          uint64_t v46 = NSString;
          uint64_t v47 = objc_opt_class();
          if (v45)
          {
            uint64_t v122 = AMSLogKey();
            uint64_t v121 = NSStringFromSelector(a2);
            uint64_t v48 = [v46 stringWithFormat:@"%@: [%@] %@ ", v47, v122, v121];
            v114 = (void *)v48;
          }
          else
          {
            uint64_t v119 = NSStringFromSelector(a2);
            uint64_t v48 = [v46 stringWithFormat:@"%@: %@ ", v47, v119];
            v116 = (void *)v48;
          }
          AMSLogableURL(v29);
          id v63 = (id)objc_claimAutoreleasedReturnValue();
          v64 = AMSHashIfNeeded(v41);
          *(_DWORD *)v155 = 138543874;
          uint64_t v156 = v48;
          __int16 v157 = 2114;
          id v158 = v63;
          __int16 v159 = 2114;
          v160 = v64;
          _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEBUG, "%{public}@| URL has expected identifier, skipping. URL = %{public}@ | identifier = %{public}@", v155, 0x20u);

          id v65 = v116;
          v66 = (void *)v119;
          if (v45)
          {

            id v65 = (void *)v121;
            v66 = (void *)v122;
          }
        }
        int v62 = 0;
LABEL_82:

        id v71 = v42;
        goto LABEL_83;
      }
      v53 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v53)
      {
        v53 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v54 = [v53 OSLogObject];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v55 = AMSLogKey();
        v56 = NSString;
        uint64_t v57 = objc_opt_class();
        if (v55)
        {
          uint64_t v124 = AMSLogKey();
          uint64_t v123 = NSStringFromSelector(a2);
          uint64_t v58 = [v56 stringWithFormat:@"%@: [%@] %@ ", v57, v124, v123];
          v115 = (void *)v58;
        }
        else
        {
          uint64_t v120 = NSStringFromSelector(a2);
          uint64_t v58 = [v56 stringWithFormat:@"%@: %@ ", v57, v120];
          v117 = (void *)v58;
        }
        v67 = AMSLogableURL(v29);
        *(_DWORD *)v155 = 138543618;
        uint64_t v156 = v58;
        __int16 v157 = 2114;
        id v158 = v67;
        _os_log_impl(&dword_18D554000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@| Deleting file at URL: %{public}@", v155, 0x16u);
        v68 = v117;
        v69 = (void *)v120;
        if (v55)
        {

          v68 = (void *)v123;
          v69 = (void *)v124;
        }
      }
      id v141 = v42;
      int v70 = [v127 removeItemAtURL:v29 error:&v141];
      id v71 = v141;

      if (v70)
      {
        char v43 = +[AMSLogConfig sharedAccountsCookiesConfig];
        if (!v43)
        {
          char v43 = +[AMSLogConfig sharedConfig];
        }
        __int16 v44 = [v43 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v72 = AMSLogKey();
          v73 = NSString;
          uint64_t v74 = objc_opt_class();
          if (v72)
          {
            uint64_t v111 = AMSLogKey();
            uint64_t v110 = NSStringFromSelector(a2);
            uint64_t v75 = [v73 stringWithFormat:@"%@: [%@] %@ ", v74, v111, v110];
            v101 = (void *)v75;
          }
          else
          {
            uint64_t v106 = NSStringFromSelector(a2);
            uint64_t v75 = [v73 stringWithFormat:@"%@: %@ ", v74, v106];
            v103 = (void *)v75;
          }
          long long v82 = AMSLogableURL(v29);
          *(_DWORD *)v155 = 138543618;
          uint64_t v156 = v75;
          __int16 v157 = 2114;
          id v158 = v82;
          _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEBUG, "%{public}@| Deleted file. URL = %{public}@", v155, 0x16u);
          id v83 = v103;
          id v84 = (void *)v106;
          if (v72)
          {

            id v83 = (void *)v110;
            id v84 = (void *)v111;
          }
        }
        int v62 = 0;
        id v42 = v71;
        goto LABEL_82;
      }
      v76 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v76)
      {
        v76 = +[AMSLogConfig sharedConfig];
      }
      v77 = [v76 OSLogObject];
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        id v78 = AMSLogKey();
        long long v79 = NSString;
        uint64_t v80 = objc_opt_class();
        if (v78)
        {
          uint64_t v109 = AMSLogKey();
          uint64_t v108 = NSStringFromSelector(a2);
          uint64_t v81 = [v79 stringWithFormat:@"%@: [%@] %@ ", v80, v109, v108];
          v100 = (void *)v81;
        }
        else
        {
          uint64_t v105 = NSStringFromSelector(a2);
          uint64_t v81 = [v79 stringWithFormat:@"%@: %@ ", v80, v105];
          v102 = (void *)v81;
        }
        AMSLogableURL(v29);
        id v85 = (id)objc_claimAutoreleasedReturnValue();
        v86 = AMSLogableError(v71);
        *(_DWORD *)v155 = 138543874;
        uint64_t v156 = v81;
        __int16 v157 = 2114;
        id v158 = v85;
        __int16 v159 = 2114;
        v160 = v86;
        _os_log_impl(&dword_18D554000, v77, OS_LOG_TYPE_ERROR, "%{public}@| Error deleting file. URL = %{public}@ | error = %{public}@", v155, 0x20u);

        uint64_t v87 = v102;
        v88 = (void *)v105;
        if (v78)
        {

          uint64_t v87 = (void *)v108;
          v88 = (void *)v109;
        }
      }
      char v43 = AMSError(14, @"Filesystem Error", @"Unable to delete the file.", v71);
      id v118 = +[AMSBinaryPromise promiseWithError:v43];
      int v62 = 1;
LABEL_83:

      if (v62 != 3 && v62)
      {

        goto LABEL_106;
      }
      ++v28;
    }
    while (v139 != v28);
    uint64_t v27 = [obj countByEnumeratingWithState:&v144 objects:v161 count:16];
  }
  while (v27);
LABEL_93:

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:");
    id v118 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v89 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v89)
    {
      uint64_t v89 = +[AMSLogConfig sharedConfig];
    }
    __int16 v90 = [v89 OSLogObject];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      v91 = AMSLogKey();
      __int16 v92 = NSString;
      if (v91)
      {
        uint64_t v93 = objc_opt_class();
        uint64_t v94 = AMSLogKey();
        v95 = NSStringFromSelector(a2);
        v96 = [v92 stringWithFormat:@"%@: [%@] %@ ", v93, v94, v95];
      }
      else
      {
        uint64_t v97 = objc_opt_class();
        uint64_t v94 = NSStringFromSelector(a2);
        v96 = [v92 stringWithFormat:@"%@: %@ ", v97, v94];
        v95 = v96;
      }
      v98 = AMSLogableURL(v104);
      *(_DWORD *)v155 = 138543618;
      uint64_t v156 = (uint64_t)v96;
      __int16 v157 = 2114;
      id v158 = v98;
      _os_log_impl(&dword_18D554000, v90, OS_LOG_TYPE_DEBUG, "%{public}@| Finished enumeration contents of %{public}@", v155, 0x16u);
      if (v91) {
    }
      }
    id v118 = +[AMSBinaryPromise promiseWithSuccess];
  }
LABEL_106:

  _Block_object_dispose(buf, 8);
LABEL_107:

  return v118;
}

NSObject *__76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v3 isDirectory:1];
  uint64_t v5 = v4;
  if (v4)
  {
    id v36 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1C5A0];
    id v35 = 0;
    char v7 = [v4 getResourceValue:&v36 forKey:v6 error:&v35];
    id v8 = v36;
    id v9 = v35;
    if (v7)
    {
      id v8 = v8;
      uint64_t v10 = v8;
      goto LABEL_24;
    }
    uint64_t v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = AMSLogKey();
      id v19 = NSString;
      uint64_t v20 = objc_opt_class();
      if (v18)
      {
        AMSLogKey();
        id v31 = v19;
        v22 = id v21 = v18;
        uint64_t v32 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v34 = (void *)v22;
        uint64_t v30 = v22;
        uint64_t v18 = v21;
        [v31 stringWithFormat:@"%@: [%@] %@ ", v20, v30, v32];
      }
      else
      {
        id v34 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v19 stringWithFormat:@"%@: %@ ", v20, v34];
      long long v23 = };
      uint64_t v27 = AMSLogableURL(v5);
      uint64_t v28 = AMSLogableError(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v23;
      __int16 v39 = 2114;
      char v40 = v27;
      __int16 v41 = 2114;
      id v42 = v28;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@| Error getting file resource identifier. URL = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v18)
      {

        long long v23 = (void *)v32;
      }
    }
  }
  else
  {
    id v9 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v9 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v11 = AMSLogKey();
      id v12 = NSString;
      uint64_t v13 = objc_opt_class();
      if (v11)
      {
        id v14 = AMSLogKey();
        uint64_t v33 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v12 stringWithFormat:@"%@: [%@] %@ ", v13, v14, v33];
      }
      else
      {
        id v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v12 stringWithFormat:@"%@: %@ ", v13, v14];
      id v15 = };
      long long v24 = AMSLogableURL(*(void **)(a1 + 32));
      long long v25 = AMSHashIfNeeded(v3);
      uint64_t v26 = AMSLogableError(*(void **)(a1 + 40));
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v15;
      __int16 v39 = 2114;
      char v40 = v24;
      __int16 v41 = 2114;
      id v42 = v25;
      __int16 v43 = 2114;
      __int16 v44 = v26;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@| Error creating URL. dataVaultURL = %{public}@ | identifier = %{public}@ | error = %{public}@", buf, 0x2Au);
      if (v11)
      {

        id v15 = (void *)v33;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_24:

  return v10;
}

uint64_t __76__AMSCookieDatabase_cleanUpCookieDatabasesWithValidIdentifiers_fileManager___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v7)
  {
    char v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = AMSLogKey();
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    if (v9)
    {
      id v12 = AMSLogKey();
      uint64_t v20 = NSStringFromSelector(*(SEL *)(a1 + 48));
      [v10 stringWithFormat:@"%@: [%@] %@ ", v11, v12, v20];
    }
    else
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      [v10 stringWithFormat:@"%@: %@ ", v11, v12];
    uint64_t v13 = };
    id v14 = AMSLogableURL(v5);
    id v15 = AMSLogableError(v6);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    long long v24 = v14;
    __int16 v25 = 2114;
    uint64_t v26 = v15;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@| Error enumerating file. URL = %{public}@ | error = %{public}@", buf, 0x20u);
    if (v9)
    {

      uint64_t v13 = (void *)v20;
    }
  }
  uint64_t v16 = AMSError(14, @"Error enumerating directory", 0, v6);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  return 1;
}

- (void)close
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSKeepAlive keepAliveWithName:@"AMSCookies"];
  uint64_t v4 = [(AMSCookieDatabase *)self connection];
  int v5 = [v4 close];

  if (v5)
  {
    connection = self->_connection;
    self->_connection = 0;
  }
  else
  {
    char v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v7)
    {
      char v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v10 = 138543362;
      *(void *)&v10[4] = objc_opt_class();
      id v9 = *(id *)&v10[4];
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to close the AMS Cookie Storage database connection", v10, 0xCu);
    }
  }
  objc_msgSend(v3, "invalidate", *(_OWORD *)v10);
}

+ (id)cookieDatabaseForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v7)
  {
    char v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    uint64_t v11 = AMSHashIfNeeded(v6);
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Getting cookie database. accountIdentifier = %{public}@", buf, 0x20u);
  }
  id v15 = v6;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  uint64_t v13 = [a1 cookieDatabaseForIdentifiers:v12 error:a4];

  return v13;
}

+ (id)cookieDatabaseForIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  uint64_t v9 = [a1 cookieDatabaseForIdentifiers:v7 error:a4 fileManager:v8];

  return v9;
}

+ (id)cookieDatabaseForIdentifiers:(id)a3 error:(id *)a4 fileManager:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v62 = a5;
  id v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    uint64_t v11 = AMSHashIfNeeded(v61);
    *(_DWORD *)buf = 138543874;
    uint64_t v68 = v9;
    __int16 v69 = 2114;
    int v70 = v10;
    __int16 v71 = 2114;
    v72 = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@]: Getting cookie database. accountIdentifiers = %{public}@", buf, 0x20u);
  }
  id v12 = +[AMSKeepAlive keepAliveWithName:@"AMSCookies"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__AMSCookieDatabase_cookieDatabaseForIdentifiers_error_fileManager___block_invoke;
  aBlock[3] = &unk_1E559EA90;
  id v58 = v12;
  id v66 = v58;
  uint64_t v13 = (void (**)(void))_Block_copy(aBlock);
  id v14 = [a1 _databasePathForIdentifiers:v61 fileManager:v62 error:a4];
  if (!v14)
  {
    uint64_t v22 = 0;
    goto LABEL_53;
  }
  id v15 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v15)
  {
    id v15 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = AMSLogKey();
    __int16 v18 = NSString;
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      __int16 v20 = AMSLogKey();
      id v21 = [v18 stringWithFormat:@"%@: [%@] ", v19, v20];
    }
    else
    {
      id v21 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      __int16 v20 = v21;
    }
    __int16 v23 = AMSHashIfNeeded(v14);
    *(_DWORD *)buf = 138543618;
    uint64_t v68 = (uint64_t)v21;
    __int16 v69 = 2114;
    int v70 = v23;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_INFO, "%{public}@Cookie database path is %{public}@", buf, 0x16u);
    if (v17) {
  }
    }
  id v59 = [[AMSSQLiteConnectionOptions alloc] initWithDatabasePath:v14];
  [(AMSSQLiteConnectionOptions *)v59 setProtectionType:*MEMORY[0x1E4F28358]];
  [a1 _cleanUpProtectionClassAtPath:v14 fileManager:v62];
  long long v24 = [[AMSSQLiteConnection alloc] initWithOptions:v59];
  id v64 = 0;
  BOOL v25 = [(AMSSQLiteConnection *)v24 openWithError:&v64];
  id v57 = v64;
  if (v25 || !objc_msgSend(v57, "ams_hasDomain:code:", 0x1EDCC2228, -7700))
  {
    id v63 = 0;
    BOOL v32 = +[AMSCookieDatabaseSchema createOrUpdateSchemaUsingConnection:v24 error:&v63];
    id v33 = v63;
    id v55 = v33;
    if (v32)
    {
      id v34 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v34)
      {
        id v34 = +[AMSLogConfig sharedConfig];
      }
      id v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = objc_opt_class();
        uint64_t v37 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v68 = v36;
        __int16 v69 = 2114;
        int v70 = v37;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_INFO, "%{public}@ [%{public}@]: Finished creating or updating schema. Initializing database.", buf, 0x16u);
      }
      uint64_t v22 = [[AMSCookieDatabase alloc] initWithConnection:v24 path:v14];
      id v38 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v38)
      {
        id v38 = +[AMSLogConfig sharedConfig];
      }
      __int16 v39 = [v38 OSLogObject];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        char v40 = AMSLogKey();
        __int16 v41 = NSString;
        if (v40)
        {
          uint64_t v42 = objc_opt_class();
          __int16 v43 = AMSLogKey();
          __int16 v44 = [v41 stringWithFormat:@"%@: [%@] ", v42, v43, v55];
        }
        else
        {
          __int16 v44 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          __int16 v43 = v44;
        }
        v53 = AMSHashIfNeeded(v22);
        *(_DWORD *)buf = 138543618;
        uint64_t v68 = (uint64_t)v44;
        __int16 v69 = 2114;
        int v70 = v53;
        _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_INFO, "%{public}@Created cookie database. %{public}@", buf, 0x16u);
        if (v40) {
      }
        }
    }
    else
    {
      AMSError(16, @"Error Creating Schema", @"Failed to create the AMSCookie database schema.", v33);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v45 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v45)
      {
        uint64_t v45 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = AMSLogKey();
        uint64_t v48 = NSString;
        if (v47)
        {
          uint64_t v49 = objc_opt_class();
          uint64_t v50 = AMSLogKey();
          uint64_t v51 = [v48 stringWithFormat:@"%@: [%@] ", v49, v50, v55];
        }
        else
        {
          uint64_t v51 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          uint64_t v50 = v51;
        }
        uint64_t v52 = AMSLogableError(v55);
        *(_DWORD *)buf = 138543618;
        uint64_t v68 = (uint64_t)v51;
        __int16 v69 = 2114;
        int v70 = v52;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to create the AMSCookie database schema. error = %{public}@", buf, 0x16u);
        if (v47) {
      }
        }
      if (a4)
      {
        id v38 = v38;
        uint64_t v22 = 0;
        *a4 = v38;
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
  }
  else
  {
    AMSError(16, @"Error Opening Database", @"Failed to open cookie database", v57);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v26)
    {
      uint64_t v26 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = AMSLogKey();
      id v29 = NSString;
      if (v28)
      {
        uint64_t v30 = objc_opt_class();
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v29 stringWithFormat:@"%@: [%@] ", v30, a1];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      id v31 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = (uint64_t)v31;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to open the AMS cookie database.", buf, 0xCu);
      if (v28)
      {

        id v31 = a1;
      }
    }
    if (a4)
    {
      id v56 = v55;
      uint64_t v22 = 0;
      *a4 = v56;

      goto LABEL_52;
    }
    uint64_t v22 = 0;
  }

LABEL_52:
LABEL_53:

  v13[2](v13);
  return v22;
}

uint64_t __68__AMSCookieDatabase_cookieDatabaseForIdentifiers_error_fileManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)dealloc
{
  [(AMSCookieDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)AMSCookieDatabase;
  [(AMSCookieDatabase *)&v3 dealloc];
}

- (AMSCookieDatabase)initWithConnection:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSCookieDatabase;
  uint64_t v9 = [(AMSCookieDatabase *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    [v7 setDelegate:v10];
    uint64_t v11 = [v8 copy];
    dbPath = v10->_dbPath;
    v10->_dbPath = (NSString *)v11;
  }
  return v10;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v5)
  {
    int v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    int v20 = 138543618;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    __int16 v23 = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resetting connection for corruption is called.", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v9 = +[AMSKeepAlive keepAliveWithName:@"AMSCookies"];
  if (([v4 truncate] & 1) == 0)
  {
    [v4 close];
    uint64_t v10 = [(AMSCookieDatabase *)self dbPath];

    if (!v10) {
      goto LABEL_10;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = [(AMSCookieDatabase *)self dbPath];
    uint64_t v13 = [v11 fileURLWithPath:v12];
    BOOL v14 = +[AMSDatabaseHelper removeDatabaseAtURL:v13];

    if (!v14) {
      goto LABEL_10;
    }
  }
  if (+[AMSCookieDatabaseSchema createOrUpdateSchemaUsingConnection:v4])
  {
    BOOL v15 = 1;
  }
  else
  {
LABEL_10:
    uint64_t v16 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      int v20 = 138543362;
      uint64_t v21 = v18;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset AMS cookie database after corruption. This is bad!", (uint8_t *)&v20, 0xCu);
    }

    BOOL v15 = 0;
  }
  [v9 invalidate];

  return v15;
}

- (NSString)dbPath
{
  return self->_dbPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbPath, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end