@interface NSURL
+ (uint64_t)setIOPolicy:(uint64_t)a1 type:(uint64_t)a2 scope:forBlock:;
@end

@implementation NSURL

+ (uint64_t)setIOPolicy:(uint64_t)a1 type:(uint64_t)a2 scope:forBlock:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self;
  getpid();
  if (sandbox_check())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[NSURL setIOPolicy:] sandbox_check: current process does not allow iopolicy syscalls", buf, 2u);
    }
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  int v4 = getiopolicy_np(3, 1);
  if (v4 == 1)
  {
    v6 = *(uint64_t (**)(uint64_t))(a2 + 16);
    return v6(a2);
  }
  else
  {
    int v5 = v4;
    if (v4 == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        int v8 = 1;
        __int16 v9 = 1024;
        int v10 = 3;
        __int16 v11 = 1024;
        int v12 = 1;
        _os_log_error_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[NSURL setIOPolicy:] getiopolicy_np failed when setting policy: %d, type: %d, scope: %d", buf, 0x14u);
      }
      return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    }
    setiopolicy_np(3, 1, 1);
    uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    if ((v5 & 0x80000000) == 0)
    {
      return setiopolicy_np(3, 1, v5);
    }
  }
  return result;
}

uint64_t __57__NSURL_NSURLPathUtilities__URLByAppendingPathComponent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) getResourceValue:*(void *)(*(void *)(a1 + 56) + 8) + 40 forKey:*MEMORY[0x1E4F1C628] error:0];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) BOOLValue];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) URLByAppendingPathComponent:*(void *)(a1 + 40) isDirectory:1];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __68__NSURL_NSURLPathUtilities__checkResourceIsReachableAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result = CFURLResourceIsReachable(*(CFURLRef *)(a1 + 40), *(CFErrorRef **)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

uint64_t __50__NSURL_NSURL__initFileURLWithPath_relativeToURL___block_invoke(void *a1)
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t result = [*(id *)(*(void *)(a1[6] + 8) + 24) getResourceValue:v3 forKey:*MEMORY[0x1E4F1C628] error:0];
  if (result)
  {
    uint64_t result = [v3[0] BOOLValue];
    if (result)
    {
      CFRelease(*(CFTypeRef *)(*(void *)(a1[6] + 8) + 24));
      uint64_t result = MEMORY[0x185305B90](*MEMORY[0x1E4F1CF80], a1[4], 0, 1, a1[5]);
      *(void *)(*(void *)(a1[6] + 8) + 24) = result;
    }
  }
  return result;
}

void __31__NSURL_NSURL__parameterString__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138477827;
    uint64_t v5 = v3;
    _os_log_debug_impl(&dword_181795000, v2, OS_LOG_TYPE_DEBUG, "NSURL parameterString is deprecated and now always returns nil. The path component now includes the part of the URL string which parameterString used to return.\nURL = %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __72__NSURL_NSURLPromisedItems__checkPromisedItemIsReachableAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  int v4 = *(void **)(a1 + 32);
  uint64_t result = [a2 checkResourceIsReachableAndReturnError:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (v4 != a2 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t result = [*(id *)(a1 + 32) _fixedUpSideFaultError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

void __62__NSURL_NSURLPromisedItems___valueFromFaultDictionary_forKey___block_invoke()
{
  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_96 = (uint64_t (*)(void, void, void))dlsym(v0, "UTTypeCreatePreferredIdentifierForTag");
    uint64_t v2 = *(void *)dlsym(v1, "kUTTagClassFilenameExtension");
    qword_1EB1ED1F8 = v2;
    if (_MergedGlobals_96) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3) {
      NSLog((NSString *)@"NSURL_Promises couldn't load a MobileCoreServices symbol.");
    }
  }
}

void __71__NSURL_NSURLPromisedItems__getPromisedItemResourceValue_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 40;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8) + 40;
    __int16 v11 = a2;
LABEL_11:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 getResourceValue:v8 forKey:v9 error:v10];
    return;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(&unk_1ECAB8390, "objectForKey:", *(void *)(a1 + 40)), "unsignedIntegerValue");
  switch(v4)
  {
    case 3:
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 40;
      __int16 v11 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
LABEL_10:
      uint64_t v10 = v12 + 40;
      goto LABEL_11;
    case 2:
LABEL_7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      return;
    case 1:
      uint64_t v5 = _CFURLCopyPropertiesOfPromiseAtURL();
      if (v5)
      {
        uint64_t v6 = (const void *)v5;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _valueFromFaultDictionary:v5 forKey:*(void *)(a1 + 40)];
        id v7 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        CFRelease(v6);
        goto LABEL_7;
      }
      return;
  }
  uint64_t v13 = *(void **)(a1 + 40);
  if ([v13 isEqualToString:*MEMORY[0x1E4F1C648]]) {
    v14 = (void *)*MEMORY[0x1E4F1CDB8];
  }
  else {
    v14 = v13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [a2 getResourceValue:*(void *)(*(void *)(a1 + 56) + 8) + 40 forKey:v14 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) _fixedUpSideFaultError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 40)];
    return;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void *)(v15 + 40);
  uint64_t v8 = v15 + 40;
  if (!v16)
  {
    __int16 v11 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    goto LABEL_10;
  }
}

void __69__NSURL_NSURLPromisedItems__promisedItemResourceValuesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (*(void **)(a1 + 32) == a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [a2 resourceValuesForKeys:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    return;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v47 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(&unk_1ECAB83B8, "objectForKey:", v7), "unsignedIntegerValue");
        id v9 = (id)*((void *)&v50 + v8);
        if (!v9)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          *((void *)&v50 + v8) = v9;
        }
        [v9 addObject:v7];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v45 count:16];
    }
    while (v4);
    uint64_t v10 = *((void *)&v51 + 1);
    __int16 v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (v10)
    {
      uint64_t v12 = [*(id *)(a1 + 32) resourceValuesForKeys:v10 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
      if (!v12) {
        goto LABEL_57;
      }
      [v11 addEntriesFromDictionary:v12];
    }
  }
  else
  {
    __int16 v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v13 = (void *)*((void *)&v50 + 1);
  if (*((void *)&v50 + 1))
  {
    CFTypeRef cf = 0;
    v14 = (const void *)_CFURLCopyPropertiesOfPromiseAtURL();
    if (v14)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * j);
            uint64_t v19 = [*(id *)(a1 + 32) _valueFromFaultDictionary:v14 forKey:v18];
            if (v19) {
              [v11 setObject:v19 forKey:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v40 count:16];
        }
        while (v15);
      }
      CFRelease(v14);
    }
    else
    {
      if (cf)
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_fixedUpSideFaultError:");
        CFRelease(cf);
      }
      __int16 v11 = 0;
    }
  }
  v20 = (void *)v50;
  if ((void)v50)
  {
    CFTypeRef cf = 0;
    p_CFTypeRef cf = &cf;
    uint64_t v54 = 0x3052000000;
    v55 = __Block_byref_object_copy__8;
    v56 = __Block_byref_object_dispose__8;
    uint64_t v57 = 0;
    *(void *)&long long v58 = MEMORY[0x1E4F143A8];
    *((void *)&v58 + 1) = 3221225472;
    *(void *)&long long v59 = ___virtualizeURLKeysForAccessingFault_block_invoke;
    *((void *)&v59 + 1) = &unk_1E51F8A60;
    *(void *)&long long v60 = v50;
    *((void *)&v60 + 1) = &cf;
    [(id)v50 enumerateObjectsUsingBlock:&v58];
    v21 = (void *)p_cf[5];
    id v22 = v20;
    if (v21) {
      id v22 = v21;
    }
    v38 = v20;
    _Block_object_dispose(&cf, 8);
    v23 = (void *)[a2 resourceValuesForKeys:v22 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    id v24 = v23;
    if (!v23)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _fixedUpSideFaultError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40)];
      goto LABEL_57;
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:&cf count:16];
    if (v25)
    {
      v26 = 0;
      uint64_t v27 = *(void *)v59;
      uint64_t v28 = *MEMORY[0x1E4F1CDB8];
      v29 = (void *)*MEMORY[0x1E4F1C648];
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v59 != v27) {
            objc_enumerationMutation(v24);
          }
          v31 = *(void **)(*((void *)&v58 + 1) + 8 * k);
          int v32 = [v31 isEqualToString:v28];
          if (v29 == v31) {
            int v33 = 0;
          }
          else {
            int v33 = v32;
          }
          if (v33 == 1)
          {
            if (!v26) {
              v26 = (void *)[v24 mutableCopy];
            }
            objc_msgSend(v26, "setObject:forKey:", objc_msgSend(v24, "objectForKey:", v31), v29);
            [v26 removeObjectForKey:v31];
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:&cf count:16];
      }
      while (v25);
      if (v26) {
        id v24 = v26;
      }
    }
    [v11 addEntriesFromDictionary:v24];
    unint64_t v34 = [v24 count];
    if (v34 < [v38 count])
    {
      v35 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v38];
      objc_msgSend(v35, "removeObjectsInArray:", objc_msgSend(v24, "allKeys"));
      uint64_t v36 = [*(id *)(a1 + 32) resourceValuesForKeys:v35 error:0];
      if (v36) {
        [v11 addEntriesFromDictionary:v36];
      }
      else {
        NSLog((NSString *)@"-[NSURL promisedItemResourceValuesForKeys:error:]: Unable to handle keys: %@", v35);
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v11;
LABEL_57:
  for (uint64_t m = 0; m != 32; m += 8)
}

void __20__NSURL_NSURL__init__block_invoke(uint64_t a1)
{
  NSLog((NSString *)@"[(NSURL *)initWithString: init]. This message shown only once.",
    *(void *)(a1 + 32));
}

@end