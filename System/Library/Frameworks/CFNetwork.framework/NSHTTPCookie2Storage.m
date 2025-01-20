@interface NSHTTPCookie2Storage
+ (id)sharedNSHTTPCookie2Storage;
- (NSHTTPCookie2Storage)init;
- (NSHTTPCookie2Storage)initWithIdentifyingData:(id)a3;
- (NSHTTPCookie2Storage)initWithPath:(id)a3;
- (id)_onqueue_copyCookiesEligibleToBeSet:(void *)a3 withFilter:;
- (id)_onqueue_mungeCookies:(void *)a3 withCookies:;
- (id)_onqueue_orderCookies:(void *)a1;
- (id)identifyingData;
- (id)initInNSMemoryHTTPCookie2Storage;
- (uint64_t)_onqueue_findHTTPCookieFromArray:(void *)a1 matchingKey:(void *)a2;
- (void)_onqueue_setCookies:(void *)a3 withFilter:(void *)a4 completionHandler:;
- (void)deleteAllCookiesWithCompletionHandler:(id)a3;
- (void)deleteCookie:(id)a3 withCompletionHandler:(id)a4;
- (void)deleteCookiesWithFilter:(id)a3 completionHandler:(id)a4;
- (void)getAllCookiesWithCompletionHandler:(id)a3;
- (void)getCookiesWithFilter:(id)a3 completionHandler:(id)a4;
- (void)setCookie:(id)a3 withFilter:(id)a4 completionHandler:(id)a5;
- (void)setCookies:(id)a3 withFilter:(id)a4 completionHandler:(id)a5;
@end

@implementation NSHTTPCookie2Storage

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultNotificationHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->memoryStore, 0);

  objc_storeStrong((id *)&self->persistentStore, 0);
}

- (NSHTTPCookie2Storage)initWithIdentifyingData:(id)a3
{
  v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  v5 = [v4 objectForKeyedSubscript:@"URL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 objectForKeyedSubscript:@"sandboxExt"];
    v7 = [v4 objectForKeyedSubscript:@"sandboxExtShm"];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"sandboxExtWal"];
    v9 = (void *)v8;
    if (v6 && v7 && v8)
    {
      [v6 bytes];
      sandbox_extension_consume();
      [v7 bytes];
      sandbox_extension_consume();
      [v9 bytes];
      sandbox_extension_consume();
    }
    v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    v11 = [v10 URLByDeletingPathExtension];
    v12 = [(NSHTTPCookie2Storage *)self initWithPath:v11];
  }
  else
  {
    v12 = [(NSHTTPCookie2Storage *)self initWithPath:0];
  }

  return v12;
}

- (id)identifyingData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(NSPersistentHTTPCookie2Storage *)self->persistentStore path];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (v2)
  {
    v4 = [v2 path];
    [v3 setObject:v4 forKeyedSubscript:@"URL"];

    id v5 = v2;
    [v5 fileSystemRepresentation];
    v6 = (const char *)sandbox_extension_issue_file();
    v7 = [v5 URLByDeletingPathExtension];
    id v8 = [v7 URLByAppendingPathExtension:@"sqlite-shm"];
    [v8 fileSystemRepresentation];
    v9 = (const char *)sandbox_extension_issue_file();

    v10 = [v5 URLByDeletingPathExtension];
    id v11 = [v10 URLByAppendingPathExtension:@"sqlite-wal"];
    [v11 fileSystemRepresentation];
    v12 = (const char *)sandbox_extension_issue_file();

    if (v6 && v9 && v12)
    {
      v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v6 length:strlen(v6) + 1 freeWhenDone:1];
      [v3 setObject:v13 forKeyedSubscript:@"sandboxExt"];

      v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v9 length:strlen(v9) + 1 freeWhenDone:1];
      [v3 setObject:v14 forKeyedSubscript:@"sandboxExtShm"];

      v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:strlen(v12) + 1 freeWhenDone:1];
      [v3 setObject:v15 forKeyedSubscript:@"sandboxExtWal"];
    }
    else
    {
      v16 = getCookieLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        v20 = v6;
        __int16 v21 = 2080;
        v22 = v9;
        __int16 v23 = 2080;
        v24 = v12;
        _os_log_impl(&dword_184085000, v16, OS_LOG_TYPE_DEFAULT, "*** Sandbox extension failed %s %s %s", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];

  return v17;
}

- (void)deleteCookiesWithFilter:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__NSHTTPCookie2Storage_deleteCookiesWithFilter_completionHandler___block_invoke;
  block[3] = &unk_1E52581A0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __66__NSHTTPCookie2Storage_deleteCookiesWithFilter_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 8) beginTransaction];
  [*(id *)(a1[4] + 8) deleteCookiesWithFilter:a1[5]];
  [*(id *)(a1[4] + 8) commitTransaction];
  [*(id *)(a1[4] + 16) deleteCookiesWithFilter:a1[5]];
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  uint64_t v3 = a1[4];
  if (v3)
  {
    uint64_t result = *(void *)(v3 + 32);
    if (result)
    {
      v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)deleteAllCookiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NSHTTPCookie2Storage_deleteAllCookiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5258028;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __62__NSHTTPCookie2Storage_deleteAllCookiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) beginTransaction];
  [*(id *)(*(void *)(a1 + 32) + 8) deleteAllCookies];
  [*(id *)(*(void *)(a1 + 32) + 8) commitTransaction];
  [*(id *)(*(void *)(a1 + 32) + 16) deleteAllCookies];
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t result = *(void *)(v3 + 32);
    if (result)
    {
      id v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)deleteCookie:(id)a3 withCompletionHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  id v8 = [v12 domain];
  [(NSHTTPCookie2LookupFilter *)v7 setDomain:v8];

  id v9 = [v12 name];
  [(NSHTTPCookie2LookupFilter *)v7 setName:v9];

  id v10 = [v12 path];
  [(NSHTTPCookie2LookupFilter *)v7 setPath:v10];

  id v11 = [v12 partition];
  [(NSHTTPCookie2LookupFilter *)v7 setPartition:v11];

  [(NSHTTPCookie2LookupFilter *)v7 setSecure:1];
  if ([v12 httpOnly]) {
    [(NSHTTPCookie2LookupFilter *)v7 setIgnoreHTTPOnlyCookie:1];
  }
  else {
    [(NSHTTPCookie2LookupFilter *)v7 setHttpOnly:0];
  }
  [(NSHTTPCookie2Storage *)self deleteCookiesWithFilter:v7 completionHandler:v6];
}

- (void)getAllCookiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__NSHTTPCookie2Storage_getAllCookiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5258028;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __59__NSHTTPCookie2Storage_getAllCookiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) getAllCookies];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) getAllCookies];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = -[NSHTTPCookie2Storage _onqueue_mungeCookies:withCookies:](*(void *)(a1 + 32), v5, v2);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (id)_onqueue_mungeCookies:(void *)a3 withCookies:
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v43 = v5;
  id v44 = a3;
  uint64_t v48 = a1;
  if (a1)
  {
    uint64_t v6 = [v5 count];
    id v7 = v44;
    if (v6 && (uint64_t v8 = [v44 count], v7 = v5, v8))
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      unint64_t v10 = [v5 count];
      unint64_t v11 = [v44 count];
      if (v10 >= v11) {
        id v12 = v5;
      }
      else {
        id v12 = v44;
      }
      if (v10 >= v11) {
        id v5 = v44;
      }
      id v13 = v12;
      id v45 = v5;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      obuint64_t j = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v62 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            v18 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v17);
            [v9 setObject:v17 forKeyedSubscript:v18];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v14);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v46 = v45;
      uint64_t v19 = [v46 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v58;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(v46);
            }
            v22 = *(void **)(*((void *)&v57 + 1) + 8 * j);
            __int16 v23 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v22);
            v24 = [v9 objectForKeyedSubscript:v23];
            BOOL v25 = v24 == 0;

            if (v25)
            {
              [v9 setObject:v22 forKeyedSubscript:v23];
            }
            else
            {
              v26 = [v9 objectForKeyedSubscript:v23];
              id v27 = v22;
              v28 = [v26 creationDate];
              v29 = [v27 creationDate];
              BOOL v30 = v28 < v29;

              if (v30) {
                v31 = v27;
              }
              else {
                v31 = v26;
              }
              if (v30) {
                v32 = v26;
              }
              else {
                v32 = v27;
              }
              id v33 = v31;
              id v34 = v32;
              if ([v33 secure])
              {
                [v9 setObject:v33 forKeyedSubscript:v23];
                v35 = *(NSObject **)(v48 + 24);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke;
                block[3] = &unk_1E5257FB0;
                block[4] = v48;
                id v56 = v34;
                dispatch_async(v35, block);
                v36 = &v56;
              }
              else if ([v34 secure])
              {
                if ([v33 source] == 2)
                {
                  [v9 setObject:v33 forKeyedSubscript:v23];
                  v37 = *(NSObject **)(v48 + 24);
                  v51[0] = MEMORY[0x1E4F143A8];
                  v51[1] = 3221225472;
                  v51[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_31;
                  v51[3] = &unk_1E5257FB0;
                  v51[4] = v48;
                  id v52 = v34;
                  dispatch_async(v37, v51);
                  v36 = &v52;
                }
                else
                {
                  [v9 setObject:v34 forKeyedSubscript:v23];
                  v39 = *(NSObject **)(v48 + 24);
                  v49[0] = MEMORY[0x1E4F143A8];
                  v49[1] = 3221225472;
                  v49[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_35;
                  v49[3] = &unk_1E5257FB0;
                  v49[4] = v48;
                  id v50 = v33;
                  dispatch_async(v39, v49);
                  v36 = &v50;
                }
              }
              else
              {
                [v9 setObject:v33 forKeyedSubscript:v23];
                v38 = *(NSObject **)(v48 + 24);
                v53[0] = MEMORY[0x1E4F143A8];
                v53[1] = 3221225472;
                v53[2] = __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_27;
                v53[3] = &unk_1E5257FB0;
                v53[4] = v48;
                id v54 = v34;
                dispatch_async(v38, v53);
                v36 = &v54;
              }
            }
          }
          uint64_t v19 = [v46 countByEnumeratingWithState:&v57 objects:v65 count:16];
        }
        while (v19);
      }

      v40 = [v9 allValues];
      v41 = -[NSHTTPCookie2Storage _onqueue_orderCookies:](v40);
    }
    else
    {
      v41 = -[NSHTTPCookie2Storage _onqueue_orderCookies:](v7);
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)_onqueue_orderCookies:(void *)a1
{
  id v1 = a1;
  v2 = [v1 sortedArrayUsingComparator:&__block_literal_global_23];

  return v2;
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteCookie:*(void *)(a1 + 40) withCompletionHandler:&__block_literal_global_26];
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteCookie:*(void *)(a1 + 40) withCompletionHandler:&__block_literal_global_30_17577];
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteCookie:*(void *)(a1 + 40) withCompletionHandler:&__block_literal_global_34_17574];
}

uint64_t __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_35(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteCookie:*(void *)(a1 + 40) withCompletionHandler:&__block_literal_global_38_17571];
}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2_36()
{
  v0 = getCookieLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v1 = 0;
    _os_log_debug_impl(&dword_184085000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }
}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2_32()
{
  v0 = getCookieLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v1 = 0;
    _os_log_debug_impl(&dword_184085000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }
}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2_28()
{
  v0 = getCookieLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v1 = 0;
    _os_log_debug_impl(&dword_184085000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }
}

void __58__NSHTTPCookie2Storage__onqueue_mungeCookies_withCookies___block_invoke_2()
{
  v0 = getCookieLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v1 = 0;
    _os_log_debug_impl(&dword_184085000, v0, OS_LOG_TYPE_DEBUG, "Done deleting duplicate cookie from the store", v1, 2u);
  }
}

uint64_t __46__NSHTTPCookie2Storage__onqueue_orderCookies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 path];
  unint64_t v7 = [v6 length];
  uint64_t v8 = [v5 path];
  unint64_t v9 = [v8 length];

  if (v7 > v9) {
    goto LABEL_2;
  }
  unint64_t v11 = [v4 path];
  unint64_t v12 = [v11 length];
  id v13 = [v5 path];
  unint64_t v14 = [v13 length];

  if (v12 < v14) {
    goto LABEL_4;
  }
  v16 = [v4 creationDate];
  v17 = [v5 creationDate];

  if (v16 < v17)
  {
LABEL_2:
    uint64_t v10 = -1;
    goto LABEL_5;
  }
  v18 = [v4 creationDate];
  uint64_t v19 = [v5 creationDate];

  if (v18 > v19)
  {
LABEL_4:
    uint64_t v10 = 1;
    goto LABEL_5;
  }
  uint64_t v20 = [v4 name];
  __int16 v21 = [v5 name];
  uint64_t v22 = [v20 compare:v21];

  if (v22 == -1) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = v22 == 1;
  }
LABEL_5:

  return v10;
}

- (void)getCookiesWithFilter:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NSHTTPCookie2Storage_getCookiesWithFilter_completionHandler___block_invoke;
  block[3] = &unk_1E52581A0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __63__NSHTTPCookie2Storage_getCookiesWithFilter_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) acceptPolicy] != 3) {
    goto LABEL_4;
  }
  uint64_t v2 = [*(id *)(a1 + 32) mainDocumentURL];
  if (!v2) {
    goto LABEL_4;
  }
  id v10 = (id)v2;
  CFURLRef v3 = [*(id *)(a1 + 32) inURL];
  CFURLRef v4 = [*(id *)(a1 + 32) mainDocumentURL];
  char v5 = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v3, v4, 0);

  if ((v5 & 1) == 0)
  {
    id v9 = getCookieLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_184085000, v9, OS_LOG_TYPE_DEFAULT, "Not sending cookie since policy is NSHTTPCookieAcceptPolicyExclusivelyFromMainDocumentDomain and the inURL and mainDocumentURL are in different domains", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_4:
    id v11 = [*(id *)(*(void *)(a1 + 40) + 8) getCookiesWithFilter:*(void *)(a1 + 32)];
    id v6 = [*(id *)(*(void *)(a1 + 40) + 16) getCookiesWithFilter:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = -[NSHTTPCookie2Storage _onqueue_mungeCookies:withCookies:](*(void *)(a1 + 40), v11, v6);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)setCookies:(id)a3 withFilter:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__NSHTTPCookie2Storage_setCookies_withFilter_completionHandler___block_invoke;
  v15[3] = &unk_1E52571D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __64__NSHTTPCookie2Storage_setCookies_withFilter_completionHandler___block_invoke(uint64_t a1)
{
}

- (void)_onqueue_setCookies:(void *)a3 withFilter:(void *)a4 completionHandler:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v20 = a3;
  uint64_t v7 = a4;
  if (a1)
  {
    id v18 = -[NSHTTPCookie2Storage _onqueue_copyCookiesEligibleToBeSet:withFilter:](a1, v19, v20);
    if ([v18 count])
    {
      if (*(void *)(a1 + 8))
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v18;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v15 = [v14 expirationDate];
              if (v15) {
                id v16 = v9;
              }
              else {
                id v16 = v8;
              }
              [v16 addObject:v14];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v11);
        }

        [*(id *)(a1 + 8) beginTransaction];
        [*(id *)(a1 + 8) setCookies:v9];
        [*(id *)(a1 + 8) deleteCookies:v8];
        [*(id *)(a1 + 8) commitTransaction];
        [*(id *)(a1 + 16) setCookies:v8];
        [*(id *)(a1 + 16) deleteCookies:v9];
      }
      else
      {
        [*(id *)(a1 + 16) setCookies:v18];
      }
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        (*(void (**)(void))(v17 + 16))();
      }
    }
    v7[2](v7);
  }
}

- (id)_onqueue_copyCookiesEligibleToBeSet:(void *)a3 withFilter:
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v119 = a2;
  id v129 = a3;
  id v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFURLRef v4 = getCookieLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v149 = (uint64_t)v119;
    _os_log_debug_impl(&dword_184085000, v4, OS_LOG_TYPE_DEBUG, "Checking eligibity of cookies : %@", buf, 0xCu);
  }

  char v5 = [v129 url];
  id v6 = [v5 host];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    id v130 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(NSHTTPCookie2LookupFilter);
    id v9 = [v129 url];
    id v10 = [v9 host];
    [(NSHTTPCookie2LookupFilter *)v8 setDomain:v10];

    [(NSHTTPCookie2LookupFilter *)v8 setIgnoreHostOnlyFlag:1];
    [(NSHTTPCookie2LookupFilter *)v8 setIgnoreHTTPOnlyCookie:1];
    [(NSHTTPCookie2LookupFilter *)v8 setIgnoreSecureFlag:1];
    uint64_t v11 = [*(id *)(a1 + 16) getCookiesWithFilter:v8];
    id v130 = [*(id *)(a1 + 8) getCookiesWithFilter:v8];
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  obuint64_t j = v119;
  id v131 = (id)v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v132 objects:v146 count:16];
  if (v12)
  {
    uint64_t v126 = *(void *)v133;
    do
    {
      uint64_t v127 = v12;
      for (uint64_t i = 0; i != v127; ++i)
      {
        if (*(void *)v133 != v126) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v132 + 1) + 8 * i);
        uint64_t v15 = [v129 url];
        id v16 = [v15 host];
        BOOL v17 = v16 == 0;

        if (v17)
        {
          BOOL v25 = objc_alloc_init(NSHTTPCookie2LookupFilter);
          uint64_t v26 = [v14 domain];
          [(NSHTTPCookie2LookupFilter *)v25 setDomain:v26];

          [(NSHTTPCookie2LookupFilter *)v25 setIgnoreHostOnlyFlag:1];
          [(NSHTTPCookie2LookupFilter *)v25 setIgnoreHTTPOnlyCookie:1];
          [(NSHTTPCookie2LookupFilter *)v25 setIgnoreSecureFlag:1];
          long long v24 = [*(id *)(a1 + 16) getCookiesWithFilter:v25];

          uint64_t v27 = [*(id *)(a1 + 8) getCookiesWithFilter:v25];

          id v130 = (id)v27;
        }
        else
        {
          id v18 = v14;
          id v19 = v129;
          CFURLRef v20 = [v19 url];
          id v21 = objc_alloc_init(MEMORY[0x1E4F29088]);
          uint64_t v22 = [v18 domain];
          [v21 setHost:v22];

          CFURLRef v23 = [v21 URL];
          LOBYTE(v22) = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v23, v20, 1);

          if ((v22 & 1) == 0)
          {
            v37 = getCookieLogHandle();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_130;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v149 = (uint64_t)v18;
            v38 = v37;
            v39 = "Ignoring cookie since it's not in the domain of the inURL. Cookie ignored = %@";
            goto LABEL_66;
          }
          long long v24 = v131;
        }
        id v28 = v14;
        id v29 = v129;
        BOOL v30 = [v28 name];
        char v31 = [v30 hasPrefix:@"__Secure-"];
        if (v31 & 1) != 0 || ([v30 hasPrefix:@"__Host-"])
        {
          if (![v28 secure]) {
            goto LABEL_71;
          }
          v32 = [v29 url];
          BOOL v33 = v32 == 0;

          if (!v33)
          {
            id v34 = [v29 url];
            v35 = [v34 scheme];

            if ([v35 caseInsensitiveCompare:0x1EC0A5D78]
              && [v35 caseInsensitiveCompare:0x1EC0A5E90]
              || (v31 & 1) == 0
              && (![v28 hostOnly]
               || ([v28 path],
                   v72 = objc_claimAutoreleasedReturnValue(),
                   char v73 = [v72 isEqualToString:@"/"],
                   v72,
                   (v73 & 1) == 0)))
            {

LABEL_71:
              v37 = getCookieLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v149 = (uint64_t)v28;
                _os_log_debug_impl(&dword_184085000, v37, OS_LOG_TYPE_DEBUG, "Ignoring cookie based on Prefix rules. Cookie = %@", buf, 0xCu);
              }
              id v131 = v24;
              goto LABEL_130;
            }
          }
        }

        id v128 = v28;
        id v36 = v29;
        id v125 = v24;
        id v124 = v130;
        if ([v36 isTrusted])
        {
        }
        else
        {
          v40 = [v128 name];
          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          id v131 = v125;
          uint64_t v41 = [v131 countByEnumeratingWithState:&v141 objects:buf count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v142;
            while (2)
            {
              for (uint64_t j = 0; j != v41; ++j)
              {
                if (*(void *)v142 != v42) {
                  objc_enumerationMutation(v131);
                }
                id v44 = *(void **)(*((void *)&v141 + 1) + 8 * j);
                id v45 = [v44 name];
                int v46 = [v45 isEqualToString:v40];

                if (v46)
                {
                  id v47 = v44;
                  goto LABEL_37;
                }
              }
              uint64_t v41 = [v131 countByEnumeratingWithState:&v141 objects:buf count:16];
              if (v41) {
                continue;
              }
              break;
            }
          }
          id v47 = 0;
LABEL_37:

          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v130 = v124;
          uint64_t v48 = [v130 countByEnumeratingWithState:&v137 objects:v147 count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v138;
            while (2)
            {
              for (uint64_t k = 0; k != v48; ++k)
              {
                if (*(void *)v138 != v49) {
                  objc_enumerationMutation(v130);
                }
                v51 = *(void **)(*((void *)&v137 + 1) + 8 * k);
                id v52 = [v51 name];
                int v53 = [v52 isEqualToString:v40];

                if (v53)
                {
                  if (v47)
                  {
                    id v54 = getCookieLogHandle();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)v136 = 0;
                      _os_log_fault_impl(&dword_184085000, v54, OS_LOG_TYPE_FAULT, "cookie with the same name should not be present for the same eld+1.", v136, 2u);
                    }
                  }
                  id v55 = v51;

                  id v47 = v55;
                  goto LABEL_51;
                }
              }
              uint64_t v48 = [v130 countByEnumeratingWithState:&v137 objects:v147 count:16];
              if (v48) {
                continue;
              }
              break;
            }
          }
LABEL_51:

          int v56 = [v47 secure];
          char v57 = v56;
          if (v56)
          {
            long long v58 = getCookieLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v136 = 0;
              _os_log_debug_impl(&dword_184085000, v58, OS_LOG_TYPE_DEBUG, "Cannot overwrite a cookie with the same name from an untrusted endpoint", v136, 2u);
            }
          }
          char v145 = v57 ^ 1;

          char v59 = v145;
          if ((v59 & 1) == 0)
          {
            v37 = getCookieLogHandle();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_130;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v149 = (uint64_t)v128;
            v38 = v37;
            v39 = "Ignoring cookie based on Secure Attribute. Cookie= %@";
LABEL_66:
            uint32_t v71 = 12;
LABEL_67:
            _os_log_debug_impl(&dword_184085000, v38, OS_LOG_TYPE_DEBUG, v39, buf, v71);
            goto LABEL_130;
          }
        }
        id v60 = v128;
        id v61 = v36;
        long long v62 = [v60 domain];
        if ([v62 hasPrefix:@"."])
        {
          long long v63 = [v60 domain];
          long long v64 = [v63 substringFromIndex:1];
        }
        else
        {
          long long v64 = [v60 domain];
        }

        if (isTopLevelDomain(v64, 1))
        {
          v65 = [v61 url];
          v66 = [v65 host];

          if (!v66 || [(__CFString *)v66 caseInsensitiveCompare:v64])
          {
            uint64_t v67 = getCookieLogHandle();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v149 = (uint64_t)v60;
              __int16 v150 = 2112;
              v151 = v64;
              v68 = v67;
              v69 = "Cookie %@ is trying to be set on TLD %@ domain";
              uint32_t v70 = 22;
              goto LABEL_85;
            }
            goto LABEL_86;
          }
          v74 = getCookieLogHandle();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v149 = (uint64_t)v60;
            __int16 v150 = 2112;
            v151 = v66;
            _os_log_debug_impl(&dword_184085000, v74, OS_LOG_TYPE_DEBUG, "Allowing cookie to be set on TLD since it's an exact host match. Cookie = %@, TLD = %@", buf, 0x16u);
          }
        }
        v75 = [v61 url];
        if (v75)
        {
          v76 = [v61 url];
          v77 = [v76 host];
          int v78 = +[NSHTTPCookieStorageUtils looksLikeIPAddress:]((uint64_t)NSHTTPCookieStorageUtils, v77);

          if (v78)
          {
            v79 = [v61 url];
            v80 = [v79 host];
            if ([v80 hasPrefix:@"."])
            {
              v81 = [v61 url];
              v82 = [v81 host];
              v66 = [v82 substringFromIndex:1];
            }
            else
            {
              v81 = [v61 url];
              v66 = [v81 host];
            }

            if ([(__CFString *)v66 caseInsensitiveCompare:v64])
            {
              uint64_t v67 = getCookieLogHandle();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v149 = (uint64_t)v60;
                v68 = v67;
                v69 = "Cookie is being set with a partial IP address. cookie = %@";
                uint32_t v70 = 12;
LABEL_85:
                _os_log_debug_impl(&dword_184085000, v68, OS_LOG_TYPE_DEBUG, v69, buf, v70);
              }
LABEL_86:

              v37 = getCookieLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v149 = (uint64_t)v60;
                _os_log_fault_impl(&dword_184085000, v37, OS_LOG_TYPE_FAULT, "Ignoring cookie  based on IP or TLD rule %@", buf, 0xCu);
              }
              id v130 = v124;
              id v131 = v125;
              goto LABEL_130;
            }
          }
        }

        v83 = (__CFString *)v60;
        id v84 = v61;
        id v85 = v125;
        id v130 = v124;
        id v131 = v85;
        uint64_t v86 = [v84 acceptPolicy];
        switch(v86)
        {
          case 1:

LABEL_97:
            v37 = getCookieLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v92 = [v84 acceptPolicy];
              *(_DWORD *)buf = 134218242;
              uint64_t v149 = v92;
              __int16 v150 = 2112;
              v151 = v83;
              v38 = v37;
              v39 = "Ignoring cookie since accept policy doesn't allow the cookie to be set. AcceptPolicy = %lu. Cookie = %@";
              uint32_t v71 = 22;
              goto LABEL_67;
            }
            goto LABEL_130;
          case 2:
            v93 = [v84 partition];
            if (v93 || [v131 count])
            {

LABEL_102:
              goto LABEL_103;
            }
            if ([v130 count]) {
              goto LABEL_102;
            }
            break;
          case 3:
            break;
          default:
            goto LABEL_102;
        }
        v87 = [v84 mainDocumentURL];
        BOOL v88 = v87 == 0;

        if (v88) {
          goto LABEL_102;
        }
        CFURLRef v89 = [v84 url];
        CFURLRef v90 = [v84 mainDocumentURL];
        char v91 = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v89, v90, 0);

        if ((v91 & 1) == 0) {
          goto LABEL_97;
        }
LABEL_103:
        v94 = v83;
        id v95 = v84;
        v96 = [(__CFString *)v94 expirationDate];
        BOOL v97 = v96 == 0;

        if (v97)
        {
        }
        else
        {
          v98 = getCookieLogHandle();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v149 = (uint64_t)v94;
            _os_log_debug_impl(&dword_184085000, v98, OS_LOG_TYPE_DEBUG, "Checking expiry of cookie %@", buf, 0xCu);
          }

          v99 = [(__CFString *)v94 expirationDate];
          v100 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v101 = [v99 compare:v100];

          getCookieLogHandle();
          v102 = (NSHTTPCookie2LookupFilter *)objc_claimAutoreleasedReturnValue();
          BOOL v103 = os_log_type_enabled(&v102->super, OS_LOG_TYPE_DEBUG);
          if (v101 == -1)
          {
            if (v103)
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v149 = (uint64_t)v94;
              _os_log_debug_impl(&dword_184085000, &v102->super, OS_LOG_TYPE_DEBUG, "Cookie is expired %@", buf, 0xCu);
            }

            v102 = objc_alloc_init(NSHTTPCookie2LookupFilter);
            v104 = [(__CFString *)v94 domain];
            [(NSHTTPCookie2LookupFilter *)v102 setDomain:v104];

            v105 = [(__CFString *)v94 name];
            [(NSHTTPCookie2LookupFilter *)v102 setName:v105];

            v106 = [(__CFString *)v94 path];
            [(NSHTTPCookie2LookupFilter *)v102 setPath:v106];

            v107 = [(__CFString *)v94 partition];
            [(NSHTTPCookie2LookupFilter *)v102 setPartition:v107];

            -[NSHTTPCookie2LookupFilter setIgnoreHTTPOnlyCookie:](v102, "setIgnoreHTTPOnlyCookie:", [v95 overwriteHTTPOnlyCookies]);
            v108 = *(void **)(a1 + 8);
            if (v108)
            {
              [v108 beginTransaction];
              [*(id *)(a1 + 8) deleteCookiesWithFilter:v102];
              [*(id *)(a1 + 8) commitTransaction];
            }
            [*(id *)(a1 + 16) deleteCookiesWithFilter:v102];
          }
          else if (v103)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v149 = (uint64_t)v94;
            _os_log_debug_impl(&dword_184085000, &v102->super, OS_LOG_TYPE_DEBUG, "Cookie is not expired %@", buf, 0xCu);
          }

          if (v101 == -1)
          {
            v37 = getCookieLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v149 = (uint64_t)v94;
              v38 = v37;
              v39 = "Ignoring cookie since it's expired. Ignoring cookie and deleting from store if exists. Cookie = %@";
              goto LABEL_66;
            }
            goto LABEL_130;
          }
        }
        v109 = v94;
        id v110 = v95;
        id v111 = v131;
        id v130 = v130;
        id v131 = v111;
        if (([v110 overwriteHTTPOnlyCookies] & 1) != 0
          || ([(__CFString *)v109 httpOnly] & 1) != 0)
        {

LABEL_119:
          v37 = [(__CFString *)v109 mutableCopy];
          v112 = [(__CFString *)v109 partition];
          v113 = v112;
          if (!v112)
          {
            v120 = [v110 partition];
            v113 = v120;
          }
          [v37 setPartition:v113];
          if (!v112) {

          }
          [v121 addObject:v37];
          goto LABEL_130;
        }
        v114 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v109);
        if (-[NSHTTPCookie2Storage _onqueue_findHTTPCookieFromArray:matchingKey:](v111, v114))
        {
        }
        else
        {
          char v115 = -[NSHTTPCookie2Storage _onqueue_findHTTPCookieFromArray:matchingKey:](v130, v114);

          if ((v115 & 1) == 0) {
            goto LABEL_119;
          }
        }
        v37 = getCookieLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v149 = (uint64_t)v109;
          v38 = v37;
          v39 = "Ignoring cookie since it's trying to overwrite a httpony cookie with a non-httponly cookie. Cookie = %@";
          goto LABEL_66;
        }
LABEL_130:
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v132 objects:v146 count:16];
    }
    while (v12);
  }

  v116 = getCookieLogHandle();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v149 = (uint64_t)v121;
    _os_log_debug_impl(&dword_184085000, v116, OS_LOG_TYPE_DEBUG, "Cookies eligible to be set = %@", buf, 0xCu);
  }

  id v117 = v121;
  return v117;
}

- (uint64_t)_onqueue_findHTTPCookieFromArray:(void *)a1 matchingKey:(void *)a2
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v9);
        if (objc_msgSend(v10, "isEqual:", v4, (void)v12) && objc_msgSend(v9, "httpOnly"))
        {

          uint64_t v6 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)setCookie:(id)a3 withFilter:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__NSHTTPCookie2Storage_setCookie_withFilter_completionHandler___block_invoke;
  v15[3] = &unk_1E52571D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __63__NSHTTPCookie2Storage_setCookie_withFilter_completionHandler___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  -[NSHTTPCookie2Storage _onqueue_setCookies:withFilter:completionHandler:](v2, v3, *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (id)initInNSMemoryHTTPCookie2Storage
{
  v10.receiver = self;
  v10.super_class = (Class)NSHTTPCookie2Storage;
  uint64_t v2 = [(NSHTTPCookie2Storage *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    persistentStore = v2->persistentStore;
    v2->persistentStore = 0;

    id v5 = objc_alloc_init(NSMemoryHTTPCookie2Storage);
    memoryStore = v3->memoryStore;
    v3->memoryStore = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cfnetwork.cookiestorage", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;
  }
  return v3;
}

- (NSHTTPCookie2Storage)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSHTTPCookie2Storage;
  id v5 = [(NSHTTPCookie2Storage *)&v13 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = [[NSPersistentHTTPCookie2Storage alloc] initWithPath:v4];
    }
    else {
      uint64_t v6 = objc_alloc_init(NSPersistentHTTPCookie2Storage);
    }
    persistentStore = v5->persistentStore;
    v5->persistentStore = v6;

    id v8 = objc_alloc_init(NSMemoryHTTPCookie2Storage);
    memoryStore = v5->memoryStore;
    v5->memoryStore = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cfnetwork.cookiestorage", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

- (NSHTTPCookie2Storage)init
{
  v11.receiver = self;
  v11.super_class = (Class)NSHTTPCookie2Storage;
  uint64_t v2 = [(NSHTTPCookie2Storage *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(NSPersistentHTTPCookie2Storage);
    persistentStore = v2->persistentStore;
    v2->persistentStore = v3;

    id v5 = objc_alloc_init(NSMemoryHTTPCookie2Storage);
    memoryStore = v2->memoryStore;
    v2->memoryStore = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cfnetwork.cookiestorage", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v7;

    id defaultNotificationHandler = v2->_defaultNotificationHandler;
    v2->_id defaultNotificationHandler = 0;
  }
  return v2;
}

+ (id)sharedNSHTTPCookie2Storage
{
  if (+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::onceToken != -1) {
    dispatch_once(&+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::onceToken, &__block_literal_global_17625);
  }
  uint64_t v2 = (void *)+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::sharedCookieStorage;

  return v2;
}

void __50__NSHTTPCookie2Storage_sharedNSHTTPCookie2Storage__block_invoke()
{
  v0 = objc_alloc_init(NSHTTPCookie2Storage);
  id v1 = (void *)+[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::sharedCookieStorage;
  +[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage]::sharedCookieStorage = (uint64_t)v0;
}

void __68__NSHTTPCookie2Storage__setDefaultCookieChangedNotificationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

@end