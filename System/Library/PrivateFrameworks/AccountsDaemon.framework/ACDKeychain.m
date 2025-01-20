@interface ACDKeychain
+ (BOOL)_isKnownMigratedKeychainItem:(id)a3;
+ (BOOL)addSyncItemWithServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 extension:(id)a7 error:(id *)a8;
+ (BOOL)canAccessPasswordsWithPolicy:(id)a3;
+ (BOOL)removeItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7;
+ (BOOL)removeTombstoneForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 extension:(id)a6 error:(id *)a7;
+ (BOOL)updateSyncItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 newValues:(id)a6 extension:(id)a7 error:(id *)a8;
+ (id)_knownMigratedKeychainItems;
+ (id)_passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 checkInKeybag:(BOOL)a6 options:(id)a7 error:(id *)a8;
+ (id)cache;
+ (id)keychainDeletedAccounts;
+ (id)passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7;
+ (unint64_t)_syncStateForKeychainDictionary:(id)a3;
+ (void)_addKnownMigratedKeychainItem:(id)a3;
+ (void)_migrateKeychainItemIfNecessary:(id)a3;
+ (void)addItemWithServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 passwordData:(id)a6 options:(id)a7 error:(id *)a8;
+ (void)keychainDeletedAccounts;
+ (void)updateItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 newValues:(id)a6 options:(id)a7 error:(id *)a8;
@end

@implementation ACDKeychain

+ (id)cache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__ACDKeychain_cache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cache_onceToken != -1) {
    dispatch_once(&cache_onceToken, block);
  }
  v2 = (void *)cache__keychainCache;

  return v2;
}

void __20__ACDKeychain_cache__block_invoke(uint64_t a1)
{
  v2 = [[ACDKeychainCache alloc] initWithValidityDuration:30];
  v3 = (void *)cache__keychainCache;
  cache__keychainCache = (uint64_t)v2;

  int out_token = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __20__ACDKeychain_cache__block_invoke_2;
  v5[3] = &__block_descriptor_40_e8_v12__0i8l;
  v5[4] = *(void *)(a1 + 32);
  notify_register_dispatch("com.apple.security.keychainchanged", &out_token, MEMORY[0x263EF83A0], v5);
  v4 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __20__ACDKeychain_cache__block_invoke_cold_1(v4);
  }
}

void __20__ACDKeychain_cache__block_invoke_2(uint64_t a1)
{
  v2 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __20__ACDKeychain_cache__block_invoke_2_cold_1(v2);
  }

  v3 = [*(id *)(a1 + 32) cache];
  [v3 clearCacheForSyncState:1];
}

+ (unint64_t)_syncStateForKeychainDictionary:(id)a3
{
  v3 = [a3 objectForKey:*MEMORY[0x263F170B0]];
  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v3 isEqualToString:*MEMORY[0x263F170B8]] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue])
    {
      unint64_t v4 = 1;
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v4 = 0;
    goto LABEL_9;
  }
  unint64_t v4 = 2;
LABEL_9:

  return v4;
}

+ (BOOL)canAccessPasswordsWithPolicy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F16E98]])
  {
    BOOL v4 = MKBDeviceUnlockedSinceBoot() != 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F16EC8]])
  {
    BOOL v4 = MKBGetDeviceLockState() == 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (id)passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  if (a7) {
    *a7 = 0;
  }
  id v12 = 0;
  v8 = [a1 _passwordForServiceName:a3 username:a4 accessGroup:a5 checkInKeybag:1 options:a6 error:&v12];
  id v9 = v12;
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return v8;
}

+ (id)_passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 checkInKeybag:(BOOL)a6 options:(id)a7 error:(id *)a8
{
  BOOL v47 = a6;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id value = a5;
  id v16 = a7;
  if (a8) {
    *a8 = 0;
  }
  v48 = a8;
  if (!v14 || !v15)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:125 description:@"Must pass service and username"];
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  id v18 = v15;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v15);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v14);
  v19 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17518], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17520], v19);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17528], v19);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v20);
        }
        CFDictionaryAddValue(Mutable, *(const void **)(*((void *)&v52 + 1) + 8 * i), (const void *)[v20 valueForKey:*(void *)(*((void *)&v52 + 1) + 8 * i)]);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v22);
  }

  if (v47) {
    v25 = v19;
  }
  else {
    v25 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17580], v25);
  if (value) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], value);
  }
  id v26 = v14;
  uint64_t v27 = [a1 _syncStateForKeychainDictionary:v20];
  v28 = [a1 cache];
  v29 = v18;
  v30 = [v28 dataForService:v26 username:v18 syncState:v27];

  if (v30)
  {
    v31 = [MEMORY[0x263EFF9D0] null];
    int v32 = [v30 isEqual:v31];

    if (v32)
    {
      if (v48)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:-25300 userInfo:0];
        id v33 = 0;
        id *v48 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = 0;
      }
    }
    else
    {
      id v33 = v30;
    }
    v41 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v57 = v27;
      __int16 v58 = 2112;
      id v59 = v26;
      __int16 v60 = 2112;
      v61 = v18;
      __int16 v62 = 1024;
      BOOL v63 = v33 != 0;
      v42 = "ACDKeychainCache(syncState:%ld) hit for %@.%@: itemExist:%d";
LABEL_45:
      _os_log_debug_impl(&dword_2183AD000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0x26u);
    }
  }
  else
  {
    CFTypeRef result = 0;
    OSStatus v34 = SecItemCopyMatching(Mutable, &result);
    OSStatus v35 = v34;
    if (v34 || (v36 = (void *)result) == 0)
    {
      if (v34 == -25300)
      {
        v39 = [a1 cache];
        v40 = [MEMORY[0x263EFF9D0] null];
        [v39 cacheData:v40 forService:v26 username:v18 syncState:v27];
      }
      if (v48)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v35 userInfo:0];
        id v33 = 0;
        id *v48 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = 0;
      }
    }
    else
    {
      uint64_t v37 = [(id)result objectForKeyedSubscript:*MEMORY[0x263F175A8]];
      v49 = (void *)v37;
      if (v37)
      {
        id v33 = (id)[objc_alloc(MEMORY[0x263EFB298]) initWithData:v37 encoding:4];
        v38 = [a1 cache];
        [v38 cacheData:v33 forService:v26 username:v29 syncState:v27];
      }
      else
      {
        id v33 = 0;
      }
      v43 = [v36 objectForKeyedSubscript:*MEMORY[0x263F175B0]];

      if (v43)
      {
        v44 = [[ACDKeychainItem alloc] initWithPersistentRef:v43 properties:v36];
        [a1 _migrateKeychainItemIfNecessary:v44];
      }
    }
    v41 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v57 = v27;
      __int16 v58 = 2112;
      id v59 = v26;
      __int16 v60 = 2112;
      v61 = v29;
      __int16 v62 = 1024;
      BOOL v63 = v33 != 0;
      v42 = "ACDKeychainCache(syncState:%ld) miss for %@.%@: itemExist:%d";
      goto LABEL_45;
    }
  }

  if (Mutable) {
    CFRelease(Mutable);
  }

  return v33;
}

+ (void)updateItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 newValues:(id)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  CFDictionaryRef v18 = (const __CFDictionary *)a6;
  id v19 = a7;
  if (v15 && v16)
  {
    if (!a8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  OSStatus v35 = [MEMORY[0x263F08690] currentHandler];
  [v35 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:206 description:@"Must pass service and username"];

  if (a8) {
LABEL_4:
  }
    *a8 = 0;
LABEL_5:
  CFDictionaryRef attributesToUpdate = v18;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v15);
  if (v17) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], v17);
  }
  id v37 = v17;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        CFDictionaryAddValue(Mutable, *(const void **)(*((void *)&v38 + 1) + 8 * i), (const void *)objc_msgSend(v21, "valueForKey:", *(void *)(*((void *)&v38 + 1) + 8 * i), attributesToUpdate));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v23);
  }

  id v26 = [a1 cache];
  [v26 clearDataForService:v15 username:v16 syncState:2];

  OSStatus v27 = SecItemUpdate(Mutable, attributesToUpdate);
  v28 = [a1 cache];
  [v28 clearDataForService:v15 username:v16 syncState:2];

  if (v27)
  {
    v29 = v37;
    if (a8)
    {
      *a8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v27 userInfo:0];
    }
  }
  else
  {
    v30 = [(__CFDictionary *)attributesToUpdate objectForKeyedSubscript:*MEMORY[0x263F175A8]];
    uint64_t v31 = [a1 _syncStateForKeychainDictionary:v21];
    v29 = v37;
    if (v30)
    {
      int v32 = [objc_alloc(MEMORY[0x263EFB298]) initWithData:v30 encoding:4];
      id v33 = [a1 cache];
      [v33 cacheData:v32 forService:v15 username:v16 syncState:v31];

      OSStatus v34 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v43 = v31;
        __int16 v44 = 2112;
        id v45 = v15;
        __int16 v46 = 2112;
        id v47 = v16;
        _os_log_debug_impl(&dword_2183AD000, v34, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) update for %@.%@", buf, 0x20u);
      }
    }
    else
    {
      int v32 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v43 = v31;
        __int16 v44 = 2112;
        id v45 = v15;
        __int16 v46 = 2112;
        id v47 = v16;
        _os_log_debug_impl(&dword_2183AD000, v32, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) update for %@.%@ has no data, ignoring", buf, 0x20u);
      }
    }
  }
  CFRelease(Mutable);
}

+ (void)addItemWithServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 passwordData:(id)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (v15 && v16)
  {
    if (!a8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  OSStatus v35 = [MEMORY[0x263F08690] currentHandler];
  [v35 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:255 description:@"Must pass service and username"];

  if (a8) {
LABEL_4:
  }
    *a8 = 0;
LABEL_5:
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v15);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17580], (const void *)*MEMORY[0x263EFFB40]);
  if (v17) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], v17);
  }
  id v37 = v17;
  id v36 = v18;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F175A8], v18);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v40;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v21);
        }
        CFDictionaryAddValue(Mutable, *(const void **)(*((void *)&v39 + 1) + 8 * v25), (const void *)[v21 valueForKey:*(void *)(*((void *)&v39 + 1) + 8 * v25)]);
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v23);
  }

  id v26 = [a1 cache];
  [v26 clearDataForService:v15 username:v16 syncState:2];

  CFTypeRef result = 0;
  OSStatus v27 = SecItemAdd(Mutable, &result);
  v28 = [a1 cache];
  [v28 clearDataForService:v15 username:v16 syncState:2];

  if (v27)
  {
    v30 = v36;
    v29 = v37;
    if (a8)
    {
      *a8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v27 userInfo:0];
    }
  }
  else
  {
    uint64_t v31 = [a1 _syncStateForKeychainDictionary:v21];
    v30 = v36;
    int v32 = (void *)[objc_alloc(MEMORY[0x263EFB298]) initWithData:v36 encoding:4];
    id v33 = [a1 cache];
    [v33 cacheData:v32 forService:v15 username:v16 syncState:v31];

    OSStatus v34 = _ACDKeychainLogSystem();
    v29 = v37;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v44 = v31;
      __int16 v45 = 2112;
      id v46 = v15;
      __int16 v47 = 2112;
      id v48 = v16;
      _os_log_debug_impl(&dword_2183AD000, v34, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) add for %@.%@", buf, 0x20u);
    }
  }
  CFRelease(Mutable);
}

+ (BOOL)addSyncItemWithServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 extension:(id)a7 error:(id *)a8
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = v19;
  if (v15 && v16 && v19)
  {
    if (!a8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:301 description:@"Must pass service and username"];

  if (a8) {
LABEL_5:
  }
    *a8 = 0;
LABEL_6:
  OSStatus v34 = v15;
  id v21 = [NSString stringWithFormat:@"%@%@", v15, v20];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  id v33 = v16;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v21);
  uint64_t v23 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16F38], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17580], v23);
  if (v17) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], v17);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v24 = v18;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        CFDictionaryAddValue(Mutable, *(const void **)(*((void *)&v36 + 1) + 8 * i), (const void *)[v24 valueForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)]);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v26);
  }

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F170B0], v23);
  CFTypeRef result = 0;
  OSStatus v29 = SecItemAdd(Mutable, &result);
  OSStatus v30 = v29;
  if (a8 && v29)
  {
    *a8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v29 userInfo:0];
  }
  CFRelease(Mutable);

  return v30 == 0;
}

+ (BOOL)updateSyncItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 newValues:(id)a6 extension:(id)a7 error:(id *)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  CFDictionaryRef v18 = (const __CFDictionary *)a6;
  id v19 = a7;
  id v20 = v19;
  if (v15 && v16 && v19)
  {
    if (!a8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  OSStatus v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:338 description:@"Must pass service and username"];

  if (a8) {
LABEL_5:
  }
    *a8 = 0;
LABEL_6:
  id v21 = [NSString stringWithFormat:@"%@%@", v15, v20];
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v21);
  id v24 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F170B0], (const void *)*MEMORY[0x263EFFB40]);
  if (v17) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], v17);
  }
  MutableCopy = CFDictionaryCreateMutableCopy(v22, 0, v18);
  CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x263F16F38], v24);
  OSStatus v26 = SecItemUpdate(Mutable, MutableCopy);
  OSStatus v27 = v26;
  if (a8 && v26)
  {
    *a8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v26 userInfo:0];
  }
  CFRelease(MutableCopy);
  CFRelease(Mutable);

  return v27 == 0;
}

+ (BOOL)removeItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13 && v14)
  {
    if (!a7) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  OSStatus v35 = [MEMORY[0x263F08690] currentHandler];
  [v35 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:372 description:@"Must pass service and username"];

  if (a7) {
LABEL_4:
  }
    *a7 = 0;
LABEL_5:
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  if ([v14 length]) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v14);
  }
  if ([v13 length]) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v13);
  }
  if (v15) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], v15);
  }
  id v36 = v15;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        CFDictionaryAddValue(Mutable, *(const void **)(*((void *)&v37 + 1) + 8 * i), (const void *)[v18 valueForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)]);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [a1 cache];
  [v23 clearDataForService:v13 username:v14 syncState:2];

  uint64_t v24 = SecItemDelete(Mutable);
  uint64_t v25 = [a1 cache];
  [v25 clearDataForService:v13 username:v14 syncState:2];

  OSStatus v26 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychain removeItemForServiceName:username:accessGroup:options:error:]((uint64_t)Mutable, v24, v26);
  }

  if (v24 != -25300 && v24)
  {
    uint64_t v31 = v36;
    if (a7)
    {
      *a7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:(int)v24 userInfo:0];
    }
  }
  else
  {
    uint64_t v27 = [a1 _syncStateForKeychainDictionary:v18];
    v28 = [a1 cache];
    OSStatus v29 = [MEMORY[0x263EFF9D0] null];
    [v28 cacheData:v29 forService:v13 username:v14 syncState:v27];

    OSStatus v30 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      id v44 = v13;
      __int16 v45 = 2112;
      id v46 = v14;
      _os_log_debug_impl(&dword_2183AD000, v30, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) delete for %@.%@", buf, 0x20u);
    }

    uint64_t v31 = v36;
  }
  if (v24) {
    BOOL v32 = v24 == -25300;
  }
  else {
    BOOL v32 = 1;
  }
  BOOL v33 = v32;
  CFRelease(Mutable);

  return v33;
}

+ (BOOL)removeTombstoneForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 extension:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  if (v13 && v14 && v16)
  {
    if (!a7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2 object:a1 file:@"ACDKeychain.m" lineNumber:420 description:@"Must pass service and username"];

  if (a7) {
LABEL_5:
  }
    *a7 = 0;
LABEL_6:
  id v18 = [NSString stringWithFormat:@"%@%@", v13, v17];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v14);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v18);
  if (v15) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], v15);
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F170B0], (const void *)*MEMORY[0x263EFFB40]);
  CFTypeRef result = 0;
  OSStatus v20 = SecItemAdd(Mutable, &result);
  OSStatus v21 = v20;
  if (a7 && v20)
  {
    *a7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v20 userInfo:0];
  }
  CFRelease(Mutable);

  return v21 == 0;
}

+ (id)keychainDeletedAccounts
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  id v3 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17518], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17530], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17400], (const void *)*MEMORY[0x263F17408]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F170B0], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17100], v3);
  CFTypeRef result = 0;
  if (SecItemCopyMatching(Mutable, &result) || !result)
  {
    CFRelease(Mutable);
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = (id)result;
    CFRelease(result);
    CFRelease(Mutable);
    v5 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychain keychainDeletedAccounts]();
    }
  }

  return v4;
}

+ (id)_knownMigratedKeychainItems
{
  if (_knownMigratedKeychainItems_onceToken != -1) {
    dispatch_once(&_knownMigratedKeychainItems_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_knownMigratedKeychainItems_migratedKeychainItems;

  return v2;
}

uint64_t __42__ACDKeychain__knownMigratedKeychainItems__block_invoke()
{
  _knownMigratedKeychainItems_migratedKeychainItems = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9C0]);

  return MEMORY[0x270F9A758]();
}

+ (BOOL)_isKnownMigratedKeychainItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 persistentRef];
  if (v5)
  {
    id v6 = a1;
    objc_sync_enter(v6);
    v7 = [v6 _knownMigratedKeychainItems];
    char v8 = [v7 containsObject:v5];

    objc_sync_exit(v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (void)_addKnownMigratedKeychainItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 persistentRef];
  if (v4)
  {
    id v5 = a1;
    objc_sync_enter(v5);
    id v6 = [v5 _knownMigratedKeychainItems];
    [v6 addObject:v4];

    objc_sync_exit(v5);
  }
}

+ (void)_migrateKeychainItemIfNecessary:(id)a3
{
  id v4 = a3;
  if ([v4 hasCustomAccessControl])
  {
    id v5 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychain _migrateKeychainItemIfNecessary:]();
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([a1 _isKnownMigratedKeychainItem:v4])
  {
    id v5 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychain _migrateKeychainItemIfNecessary:]();
    }
    goto LABEL_11;
  }
  id v6 = +[ACDKeychainMigrator sharedInstance];
  char v7 = [v6 migrateKeychainItem:v4 toKeybag:0];

  if ((v7 & 1) == 0)
  {
    id v5 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ACDKeychain _migrateKeychainItemIfNecessary:]();
    }
    goto LABEL_11;
  }
  [a1 _addKnownMigratedKeychainItem:v4];
LABEL_12:
}

void __20__ACDKeychain_cache__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "ACDKeychain created cache", v1, 2u);
}

void __20__ACDKeychain_cache__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "ACDKeychain received com.apple.security.keychainchanged notification, clearing synced item cache", v1, 2u);
}

+ (void)removeItemForServiceName:(NSObject *)a3 username:accessGroup:options:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithInt:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_2183AD000, a3, OS_LOG_TYPE_DEBUG, "Keychain query - %@ with result - %@", (uint8_t *)&v6, 0x16u);
}

+ (void)keychainDeletedAccounts
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Account Sync - Found Tombstones %@ ", v2, v3, v4, v5, v6);
}

+ (void)_migrateKeychainItemIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Keychain item (%@) has custom access control, skipping...", v2, v3, v4, v5, v6);
}

+ (void)_migrateKeychainItemIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Keychain item (%@) known to be migrated, skipping...", v2, v3, v4, v5, v6);
}

+ (void)_migrateKeychainItemIfNecessary:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "Failed to migrate keychain item %@.", v1, 0xCu);
}

@end