@interface APKeychainServices
+ (id)_keychainQuery:(id)a3;
+ (id)_readDataFromKeychain:(id)a3 error:(id *)a4;
+ (id)_readDataFromKeychain:(id)a3 settings:(id)a4 error:(id *)a5;
+ (id)objectForKey:(id)a3 error:(id *)a4;
+ (id)objectForKey:(id)a3 settings:(id)a4 error:(id *)a5;
+ (id)objectForPropertyListKey:(id)a3 error:(id *)a4;
+ (void)_removeObjectForKey:(id)a3 error:(id *)a4;
+ (void)_removeObjectForKey:(id)a3 settings:(id)a4 error:(id *)a5;
+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4 error:(id *)a5;
+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4 settings:(id)a5 error:(id *)a6;
+ (void)setObject:(id)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4 error:(id *)a5;
+ (void)setObject:(id)a3 forKey:(id)a4 settings:(id)a5 error:(id *)a6;
+ (void)setPropertyListObject:(id)a3 forKey:(id)a4;
+ (void)setPropertyListObject:(id)a3 forKey:(id)a4 error:(id *)a5;
@end

@implementation APKeychainServices

+ (id)objectForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 _keychainQuery:v6];
  v8 = [a1 objectForKey:v6 settings:v7 error:a4];

  return v8;
}

+ (id)objectForKey:(id)a3 settings:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v28 = 0;
  v9 = [a1 _readDataFromKeychain:v8 settings:a4 error:&v28];
  id v10 = v28;
  v11 = APLogForCategory(0x15uLL);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138478083;
      v30 = v13;
      __int16 v31 = 2114;
      id v32 = v8;
      id v14 = v13;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_INFO, "[%{private}@]: Successfully read key: %{public}@", buf, 0x16u);
    }
    v15 = +[APSupportedSecureEncodedClass classes];
    id v27 = 0;
    v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v15 fromData:v9 error:&v27];
    id v17 = v27;
    v18 = v17;
    if (!v16 || v17)
    {
      v22 = APLogForCategory(0x15uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        id v26 = v23;
        v24 = [v18 description];
        *(_DWORD *)buf = 138412802;
        v30 = v23;
        __int16 v31 = 2112;
        id v32 = v9;
        __int16 v33 = 2112;
        v34 = v24;
        _os_log_impl(&dword_1D70B2000, v22, OS_LOG_TYPE_ERROR, "[%@]: Error unarchiving data: %@. Error: %@", buf, 0x20u);
      }
      id v19 = 0;
      if (a5) {
        *a5 = v18;
      }
    }
    else
    {
      id v19 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138478083;
      v30 = v20;
      __int16 v31 = 2114;
      id v32 = v8;
      id v21 = v20;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to find key: %{public}@", buf, 0x16u);
    }
    id v19 = 0;
    if (a5) {
      *a5 = v10;
    }
  }

  return v19;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
}

+ (void)setObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 _keychainQuery:v8];
  +[APKeychainServices setObject:v9 forKey:v8 settings:v10 error:a5];
}

+ (void)setObject:(id)a3 forKey:(id)a4 settings:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v20 = 0;
    v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v20];
    id v14 = v20;
    v15 = v14;
    if (v14)
    {
      if (a6) {
        *a6 = v14;
      }
      v16 = APLogForCategory(0x15uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = objc_opt_class();
        id v18 = v17;
        id v19 = [v15 description];
        *(_DWORD *)buf = 138478595;
        v22 = v17;
        __int16 v23 = 2114;
        id v24 = v11;
        __int16 v25 = 2113;
        id v26 = v10;
        __int16 v27 = 2114;
        id v28 = v19;
        _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "[%{private}@]: Error archiving data for key: %{public}@ and value: %{private}@. Error: %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      v16 = a1;
      objc_sync_enter(v16);
      +[APKeychainServices _writeDataToKeychain:v11 andData:v13 settings:v12 error:a6];
      objc_sync_exit(v16);
    }
  }
  else
  {
    +[APKeychainServices _removeObjectForKey:v11 settings:v12 error:a6];
  }
}

+ (void)setPropertyListObject:(id)a3 forKey:(id)a4
{
}

+ (void)setPropertyListObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v10 = a3;
  id v8 = a4;
  if (v10)
  {
    id v9 = a1;
    objc_sync_enter(v9);
    +[APKeychainServices _writeDataToKeychain:v8 andData:v10 error:a5];
    objc_sync_exit(v9);
  }
  else
  {
    +[APKeychainServices _removeObjectForKey:v8 error:a5];
  }
}

+ (id)objectForPropertyListKey:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 _readDataFromKeychain:v6 error:a4];
  id v8 = APLogForCategory(0x15uLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v14 = 138478083;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v6;
      id v10 = v15;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "[%{private}@]: Successfully read key: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    id v11 = v7;
  }
  else
  {
    if (v9)
    {
      int v14 = 138478083;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v6;
      id v12 = v15;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "[%{private}@]: Unable to find key: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }

  return v7;
}

+ (id)_readDataFromKeychain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 _keychainQuery:v6];
  id v8 = [a1 _readDataFromKeychain:v6 settings:v7 error:a4];

  return v8;
}

+ (id)_readDataFromKeychain:(id)a3 settings:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F1CFD0];
  uint64_t v9 = *MEMORY[0x1E4F3BC70];
  id v10 = a4;
  [v10 setObject:v8 forKeyedSubscript:v9];
  CFTypeRef result = 0;
  uint64_t v11 = SecItemCopyMatching((CFDictionaryRef)v10, &result);

  if (!v11 && result)
  {
    id v12 = sub_1D70BAEE0();
    [v12 lock];

    ++dword_1EB7897D8;
    v13 = sub_1D70BAEE0();
    [v13 unlock];

    a5 = (id *)result;
    goto LABEL_13;
  }
  int v14 = APLogForCategory(0x15uLL);
  id v15 = v14;
  if (v11 == -25300)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_log_impl(&dword_1D70B2000, v15, OS_LOG_TYPE_INFO, "No previous keychain records found for key %{public}@.", buf, 0xCu);
    }

    __int16 v16 = sub_1D70BAEE0();
    [v16 lock];

    ++dword_1EB7897D8;
    id v17 = sub_1D70BAEE0();
    [v17 unlock];
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = (id)(int)v11;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_1D70B2000, v15, OS_LOG_TYPE_ERROR, "Error %ld retrieving secure data for key %{public}@", buf, 0x16u);
  }

  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"APPCControllerRequesterErrorDomain" code:(int)v11 userInfo:0];
    uint64_t v18 = [MEMORY[0x1E4F28B50] mainBundle];
    id v17 = [v18 bundleIdentifier];

    +[APKeychainAnalytics sendKeychainAnalytics:v11 keyName:v7 readCount:dword_1EB7897D8 writeCount:dword_1EB789904 bundleID:v17];
    id v19 = sub_1D70BAEE0();
    [v19 lock];

    dword_1EB7897D8 = 0;
    id v20 = sub_1D70BAEE0();
    [v20 unlock];

LABEL_12:
    a5 = 0;
  }
LABEL_13:

  return a5;
}

+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 _keychainQuery:v9];
  [a1 _writeDataToKeychain:v9 andData:v8 settings:v10 error:a5];
}

+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4 settings:(id)a5 error:(id *)a6
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
  [v12 removeObjectForKey:*MEMORY[0x1E4F3B558]];
  OSStatus v13 = SecItemDelete((CFDictionaryRef)v12);
  if (v10)
  {
    OSStatus v14 = v13;
    id v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
    uint64_t v16 = *MEMORY[0x1E4F3BD38];
    [v15 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    uint64_t v17 = SecItemAdd((CFDictionaryRef)v15, 0);
    if (v17)
    {
      uint64_t v18 = v17;
      if (v17 != -25299)
      {
        if (a6)
        {
          id v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v44 = *MEMORY[0x1E4F28568];
          v45 = @"Error adding to keychain in write";
          __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          *a6 = [v24 errorWithDomain:@"APPCControllerRequesterErrorDomain" code:(int)v18 userInfo:v25];
        }
        id v26 = APLogForCategory(0x15uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v47 = v18;
          *(_WORD *)&v47[4] = 2114;
          *(void *)&v47[6] = v9;
          _os_log_impl(&dword_1D70B2000, v26, OS_LOG_TYPE_ERROR, "Error %d checking for existence of keychain item %{public}@", buf, 0x12u);
        }

        uint64_t v27 = [MEMORY[0x1E4F28B50] mainBundle];
        id v28 = [v27 bundleIdentifier];

        +[APKeychainAnalytics sendKeychainAnalytics:v18 keyName:v9 readCount:dword_1EB7897D8 writeCount:dword_1EB789904 bundleID:v28];
        uint64_t v29 = sub_1D70BAEE0();
        [v29 lock];

        dword_1EB789904 = 0;
        v30 = sub_1D70BAEE0();
        [v30 unlock];

        goto LABEL_23;
      }
      id v19 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      [v19 removeObjectForKey:*MEMORY[0x1E4F3B978]];
      [v19 setObject:v10 forKeyedSubscript:v16];
      CFDictionaryRef v43 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      uint64_t v20 = SecItemUpdate(v43, (CFDictionaryRef)v19);
      if (v20)
      {
        uint64_t v21 = v20;
        if (a6)
        {
          if (v14 != -25300 && v14)
          {
            __int16 v33 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v41 = v14;
            uint64_t v52 = *MEMORY[0x1E4F28568];
            uint64_t v42 = v52;
            v53[0] = @"Error deleting keychain item";
            v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
            uint64_t v35 = [v33 errorWithDomain:@"APPCControllerRequesterErrorDomain" code:v41 userInfo:v34];

            uint64_t v36 = *MEMORY[0x1E4F28A50];
            v50[0] = v42;
            v50[1] = v36;
            v51[0] = @"Error updating keychain in write";
            v51[1] = v35;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
          }
          else
          {
            uint64_t v48 = *MEMORY[0x1E4F28568];
            v49 = @"Error updating keychain in write";
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          }
          *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"APPCControllerRequesterErrorDomain" code:(int)v21 userInfo:v22];
        }
        v37 = APLogForCategory(0x15uLL);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)v47 = v9;
          *(_WORD *)&v47[8] = 1024;
          *(_DWORD *)&v47[10] = v21;
          _os_log_impl(&dword_1D70B2000, v37, OS_LOG_TYPE_ERROR, "Failed to update keychain item %{public}@. Error %d", buf, 0x12u);
        }

        v38 = [MEMORY[0x1E4F28B50] mainBundle];
        id v32 = [v38 bundleIdentifier];

        +[APKeychainAnalytics sendKeychainAnalytics:v21 keyName:v9 readCount:dword_1EB7897D8 writeCount:dword_1EB789904 bundleID:v32];
        v39 = sub_1D70BAEE0();
        [v39 lock];

        dword_1EB789904 = 0;
        v40 = sub_1D70BAEE0();
        [v40 unlock];
      }
      else
      {
        __int16 v31 = sub_1D70BAEE0();
        [v31 lock];

        ++dword_1EB789904;
        id v32 = sub_1D70BAEE0();
        [v32 unlock];
      }
    }
    else
    {
      __int16 v23 = sub_1D70BAEE0();
      [v23 lock];

      ++dword_1EB789904;
      id v19 = sub_1D70BAEE0();
      [v19 unlock];
    }

LABEL_23:
  }
}

+ (void)_removeObjectForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 _keychainQuery:v6];
  [a1 _removeObjectForKey:v6 settings:v7 error:a4];
}

+ (void)_removeObjectForKey:(id)a3 settings:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F3B558];
  id v9 = a4;
  [v9 removeObjectForKey:v8];
  OSStatus v10 = SecItemDelete((CFDictionaryRef)v9);

  if (a5 && v10)
  {
    id v11 = APLogForCategory(0x15uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109378;
      v12[1] = v10;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, "Error %d removing object from keychain item %{public}@", (uint8_t *)v12, 0x12u);
    }

    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"APPCControllerRequesterErrorDomain" code:v10 userInfo:0];
  }
}

+ (id)_keychainQuery:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  [v5 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v5 setObject:@"com.apple.iAdIDRecords" forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v5 setObject:*MEMORY[0x1E4F3B570] forKeyedSubscript:*MEMORY[0x1E4F3B558]];
  id v6 = [v4 dataUsingEncoding:4];

  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B688]];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];

  return v5;
}

@end