@interface NSHTTPCookieStorageToCookie2Storage
- (NSHTTPCookie)_newCookieToNSCookie:(uint64_t)a1;
- (NSHTTPCookieStorageToCookie2Storage)init;
- (NSMutableHTTPCookie2)_nsToNewCookie:(NSMutableHTTPCookie2 *)a1;
- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4;
- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4;
- (id)cookies;
- (id)cookiesForURL:(id)a3;
- (unint64_t)cookieAcceptPolicy;
- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4;
- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6;
- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7;
- (void)_saveCookies;
- (void)_saveCookies:(id)a3;
- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6;
- (void)_setPrivateBrowsingEnabled:(BOOL)a3;
- (void)_testingOfStoringOfCookie:(id)a3;
- (void)dealloc;
- (void)deleteCookie:(id)a3;
- (void)getCookiesForTask:(id)a3 completionHandler:(id)a4;
- (void)initMemoryCookieStore;
- (void)initWithIdentifyingData:(void *)a1;
- (void)initWithPath:(void *)a1;
- (void)registerForPostingNotifications;
- (void)removeCookiesSinceDate:(id)a3;
- (void)setCookie:(id)a3;
- (void)setCookieAcceptPolicy:(unint64_t)a3;
- (void)setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5;
- (void)storeCookies:(id)a3 forTask:(id)a4;
@end

@implementation NSHTTPCookieStorageToCookie2Storage

- (void).cxx_destruct
{
}

- (void)_setPrivateBrowsingEnabled:(BOOL)a3
{
  v3 = getCookieLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_INFO, "_setPrivateBrowsingEnabled is not implemented", v4, 2u);
  }
}

- (unint64_t)cookieAcceptPolicy
{
  return self->_acceptPolicy;
}

- (void)setCookieAcceptPolicy:(unint64_t)a3
{
  self->_acceptPolicy = a3;
  v4 = cookieNotificationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NSHTTPCookieStorageToCookie2Storage_setCookieAcceptPolicy___block_invoke;
  block[3] = &unk_1E5258228;
  block[4] = self;
  dispatch_async(v4, block);
}

void __61__NSHTTPCookieStorageToCookie2Storage_setCookieAcceptPolicy___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"NSHTTPCookieManagerCookiesChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)removeCookiesSinceDate:(id)a3
{
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  store = self->_store;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NSHTTPCookieStorageToCookie2Storage_removeCookiesSinceDate___block_invoke;
  v7[3] = &unk_1E5258228;
  dispatch_semaphore_t v8 = v4;
  v6 = v4;
  [(NSHTTPCookie2Storage *)store deleteAllCookiesWithCompletionHandler:v7];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __62__NSHTTPCookieStorageToCookie2Storage_removeCookiesSinceDate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)deleteCookie:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  store = self->_store;
  v7 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__NSHTTPCookieStorageToCookie2Storage_deleteCookie___block_invoke;
  v9[3] = &unk_1E5258228;
  dispatch_semaphore_t v8 = v5;
  v10 = v8;
  [(NSHTTPCookie2Storage *)store deleteCookie:v7 withCompletionHandler:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSMutableHTTPCookie2)_nsToNewCookie:(NSMutableHTTPCookie2 *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    dispatch_semaphore_t v5 = [v3 name];
    if (v5)
    {
      a1 = [v4 value];
      if (!a1)
      {
LABEL_16:

        goto LABEL_17;
      }
      v6 = [v4 domain];

      if (v6)
      {
        v7 = [NSMutableHTTPCookie2 alloc];
        dispatch_semaphore_t v8 = [v4 name];
        id v9 = [v4 value];
        v10 = [v4 domain];
        a1 = [(NSMutableHTTPCookie2 *)v7 initWithName:v8 value:v9 domain:v10];

        v11 = [v4 path];
        [(NSMutableHTTPCookie2 *)a1 setPath:v11];

        v12 = [v4 expiresDate];
        [(NSMutableHTTPCookie2 *)a1 setExpirationDate:v12];

        id v13 = [MEMORY[0x1E4F1C9C8] date];
        v14 = v13;
        if (a1)
        {
          [v13 timeIntervalSince1970];
          a1->super._sCreationDate = vcvtad_u64_f64(v15);
        }

        v16 = [v4 domain];
        -[NSMutableHTTPCookie2 setHostOnly:](a1, "setHostOnly:", [v16 hasPrefix:@"."] ^ 1);

        -[NSMutableHTTPCookie2 setHttpOnly:](a1, "setHttpOnly:", [v4 isHTTPOnly]);
        -[NSMutableHTTPCookie2 setSecure:](a1, "setSecure:", [v4 isSecure]);
        v17 = [v4 expiresDate];
        [(NSMutableHTTPCookie2 *)a1 setExpirationDate:v17];

        v18 = [v4 _storagePartition];
        [(NSMutableHTTPCookie2 *)a1 setPartition:v18];

        dispatch_semaphore_t v5 = [v4 sameSitePolicy];
        if (v5)
        {
          id v9 = [v4 sameSitePolicy];
          if ([v9 caseInsensitiveCompare:0x1EC0A1D28]) {
            uint64_t v19 = 2 * ([v9 caseInsensitiveCompare:0x1EC0A1D98] == 0);
          }
          else {
            uint64_t v19 = 1;
          }
        }
        else
        {
          uint64_t v19 = 0;
        }
        [(NSMutableHTTPCookie2 *)a1 setSameSite:v19];
        if (v5) {

        }
        goto LABEL_16;
      }
    }
    a1 = 0;
  }
LABEL_17:

  return a1;
}

intptr_t __52__NSHTTPCookieStorageToCookie2Storage_deleteCookie___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__NSHTTPCookieStorageToCookie2Storage__getCookiesForPartition_completionHandler___block_invoke;
  v11[3] = &unk_1E5256858;
  dispatch_semaphore_t v12 = v8;
  id v13 = v6;
  id v9 = v8;
  id v10 = v6;
  [(NSHTTPCookieStorageToCookie2Storage *)self _getCookiesForURL:0 mainDocumentURL:0 partition:v7 completionHandler:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __81__NSHTTPCookieStorageToCookie2Storage__getCookiesForPartition_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7
{
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  double v15 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  v16 = [v11 host];
  [(NSHTTPCookie2LookupFilter *)v15 setDomain:v16];

  [(NSHTTPCookie2LookupFilter *)v15 setInURL:v11];
  [(NSHTTPCookie2LookupFilter *)v15 setMainDocumentURL:v12];
  v17 = [v11 scheme];
  if (v17)
  {
    id v6 = [v11 scheme];
    BOOL v18 = [v6 caseInsensitiveCompare:@"https"] == 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  [(NSHTTPCookie2LookupFilter *)v15 setSecure:v18];
  if (v17) {

  }
  uint64_t v19 = [v11 path];
  [(NSHTTPCookie2LookupFilter *)v15 setPath:v19];

  [(NSHTTPCookie2LookupFilter *)v15 setPartition:v13];
  [(NSHTTPCookie2LookupFilter *)v15 setAcceptPolicy:self->_acceptPolicy];
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  store = self->_store;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__NSHTTPCookieStorageToCookie2Storage__getCookiesForURL_mainDocumentURL_partition_completionHandler___block_invoke;
  v24[3] = &unk_1E5252D98;
  v24[4] = self;
  id v22 = v14;
  dispatch_semaphore_t v25 = v20;
  id v26 = v22;
  v23 = v20;
  [(NSHTTPCookie2Storage *)store getCookiesWithFilter:v15 completionHandler:v24];
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
}

void __101__NSHTTPCookieStorageToCookie2Storage__getCookiesForURL_mainDocumentURL_partition_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](*(void *)(a1 + 32), *(void **)(*((void *)&v10 + 1) + 8 * v8));
        objc_msgSend(v4, "addObject:", v9, (void)v10);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSHTTPCookie)_newCookieToNSCookie:(uint64_t)a1
{
  id v3 = a2;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_22;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 name];
  [v4 setObject:v5 forKeyedSubscript:@"Name"];

  uint64_t v6 = [v3 value];
  [v4 setObject:v6 forKeyedSubscript:@"Value"];

  uint64_t v7 = [v3 expirationDate];
  [v4 setObject:v7 forKeyedSubscript:@"Expires"];

  uint64_t v8 = [v3 path];
  [v4 setObject:v8 forKeyedSubscript:@"Path"];

  uint64_t v9 = [v3 sameSite];
  if (v9 == 1)
  {
    long long v10 = &_kCFHTTPCookieSameSiteLax;
  }
  else
  {
    if (v9 != 2)
    {
      id v11 = 0;
      goto LABEL_8;
    }
    long long v10 = &_kCFHTTPCookieSameSiteStrict;
  }
  id v11 = (id)*v10;
LABEL_8:
  [v4 setObject:v11 forKeyedSubscript:@"SameSite"];

  long long v12 = [v3 partition];
  int v13 = [v12 isEqualToString:@"none"];

  if (v13)
  {
    [v4 setObject:0 forKeyedSubscript:0x1EC0A1C10];
  }
  else
  {
    id v14 = [v3 partition];
    [v4 setObject:v14 forKeyedSubscript:0x1EC0A1C10];
  }
  if ([v3 secure]) {
    [v4 setObject:@"YES" forKeyedSubscript:@"Secure"];
  }
  if ([v3 httpOnly]) {
    [v4 setObject:@"YES" forKeyedSubscript:@"HttpOnly"];
  }
  uint64_t v15 = [v3 expirationDate];

  if (v15)
  {
    v16 = [v3 expirationDate];
    [v4 setObject:v16 forKeyedSubscript:@"Expires"];
  }
  if ([v3 hostOnly]
    && ([v3 domain],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 hasPrefix:@"."],
        v17,
        v18))
  {
    uint64_t v19 = [v3 domain];
    dispatch_semaphore_t v20 = [v19 substringFromIndex:1];
    [v4 setObject:v20 forKeyedSubscript:@"Domain"];
  }
  else
  {
    uint64_t v19 = [v3 domain];
    [v4 setObject:v19 forKeyedSubscript:@"Domain"];
  }

  v21 = [[NSHTTPCookie alloc] initWithProperties:v4];
LABEL_22:

  return v21;
}

- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__901;
  uint64_t v19 = __Block_byref_object_dispose__902;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__NSHTTPCookieStorageToCookie2Storage__cookiesForURL_mainDocumentURL___block_invoke;
  v12[3] = &unk_1E5255FB0;
  dispatch_semaphore_t v13 = v8;
  id v14 = &v15;
  uint64_t v9 = v8;
  [(NSHTTPCookieStorageToCookie2Storage *)self _getCookiesForURL:v7 mainDocumentURL:v6 partition:0 completionHandler:v12];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __70__NSHTTPCookieStorageToCookie2Storage__cookiesForURL_mainDocumentURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)getCookiesForTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  uint64_t v9 = [v6 currentRequest];
  id v10 = [v9 URL];
  id v11 = [v10 host];
  [(NSHTTPCookie2LookupFilter *)v8 setDomain:v11];

  long long v12 = [v6 currentRequest];
  dispatch_semaphore_t v13 = [v12 URL];
  id v14 = [v13 scheme];
  -[NSHTTPCookie2LookupFilter setSecure:](v8, "setSecure:", [v14 caseInsensitiveCompare:@"https"] == 0);

  uint64_t v15 = [v6 currentRequest];
  v16 = [v15 URL];
  uint64_t v17 = [v16 path];
  [(NSHTTPCookie2LookupFilter *)v8 setPath:v17];

  int v18 = [v6 currentRequest];
  uint64_t v19 = [v18 cookiePartitionIdentifier];
  id v20 = v19;
  if (!v19)
  {
    id v20 = [v6 _storagePartitionIdentifier];
  }
  [(NSHTTPCookie2LookupFilter *)v8 setPartition:v20];
  if (!v19) {

  }
  v21 = [v6 currentRequest];
  id v22 = [v21 URL];
  [(NSHTTPCookie2LookupFilter *)v8 setInURL:v22];

  v23 = [v6 currentRequest];
  v24 = [v23 mainDocumentURL];
  [(NSHTTPCookie2LookupFilter *)v8 setMainDocumentURL:v24];

  -[NSHTTPCookie2LookupFilter setAcceptPolicy:](v8, "setAcceptPolicy:", (int)[v6 _cookieAcceptPolicy]);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(NSHTTPCookieStorage *)self _overrideSessionCookieAcceptPolicy])
  {
    [(NSHTTPCookie2LookupFilter *)v8 setAcceptPolicy:[(NSHTTPCookieStorageToCookie2Storage *)self cookieAcceptPolicy]];
  }
  dispatch_semaphore_t v25 = [v6 _siteForCookies];

  if (v25)
  {
    id v26 = [v6 _siteForCookies];
    [(NSHTTPCookie2LookupFilter *)v8 setSiteForCookies:v26];

    v27 = [v6 currentRequest];
    -[NSHTTPCookie2LookupFilter setIsSafe:](v8, "setIsSafe:", [v27 _isIdempotent]);

    -[NSHTTPCookie2LookupFilter setIsTopLevelNavigation:](v8, "setIsTopLevelNavigation:", [v6 _isTopLevelNavigation]);
  }
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  store = self->_store;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__NSHTTPCookieStorageToCookie2Storage_getCookiesForTask_completionHandler___block_invoke;
  v32[3] = &unk_1E5252D98;
  id v33 = v28;
  v34 = self;
  id v30 = v7;
  id v35 = v30;
  id v31 = v28;
  [(NSHTTPCookie2Storage *)store getCookiesWithFilter:v8 completionHandler:v32];
}

void __75__NSHTTPCookieStorageToCookie2Storage_getCookiesForTask_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = (void *)a1[4];
        dispatch_semaphore_t v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](a1[5], *(void **)(*((void *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (void)v9);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)cookiesForURL:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  id v7 = [v5 host];
  [(NSHTTPCookie2LookupFilter *)v6 setDomain:v7];

  dispatch_semaphore_t v8 = [v5 scheme];
  uint64_t v9 = [v8 caseInsensitiveCompare:@"https"];
  if (v9)
  {
    id v3 = [v5 scheme];
    BOOL v10 = [v3 caseInsensitiveCompare:@"wss"] == 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  [(NSHTTPCookie2LookupFilter *)v6 setSecure:v10];
  if (v9) {

  }
  long long v11 = [v5 path];
  [(NSHTTPCookie2LookupFilter *)v6 setPath:v11];

  [(NSHTTPCookie2LookupFilter *)v6 setAcceptPolicy:[(NSHTTPCookieStorageToCookie2Storage *)self cookieAcceptPolicy]];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  store = self->_store;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__NSHTTPCookieStorageToCookie2Storage_cookiesForURL___block_invoke;
  v20[3] = &unk_1E5252D70;
  id v15 = v13;
  id v21 = v15;
  id v22 = self;
  v16 = v12;
  v23 = v16;
  [(NSHTTPCookie2Storage *)store getCookiesWithFilter:v6 completionHandler:v20];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v17 = v23;
  id v18 = v15;

  return v18;
}

void __53__NSHTTPCookieStorageToCookie2Storage_cookiesForURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(a1 + 32);
        dispatch_semaphore_t v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](*(void *)(a1 + 40), *(void **)(*((void *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (void)v9);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)cookies
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  store = self->_store;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__NSHTTPCookieStorageToCookie2Storage_cookies__block_invoke;
  v11[3] = &unk_1E5252D70;
  id v6 = v3;
  id v12 = v6;
  id v13 = self;
  dispatch_semaphore_t v14 = v4;
  id v7 = v4;
  [(NSHTTPCookie2Storage *)store getAllCookiesWithCompletionHandler:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v8 = v14;
  id v9 = v6;

  return v9;
}

void __46__NSHTTPCookieStorageToCookie2Storage_cookies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(a1 + 32);
        dispatch_semaphore_t v8 = -[NSHTTPCookieStorageToCookie2Storage _newCookieToNSCookie:](*(void *)(a1 + 40), *(void **)(*((void *)&v9 + 1) + 8 * v6));
        objc_msgSend(v7, "addObject:", v8, (void)v9);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_saveCookies
{
  id v2 = getCookieLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_INFO, "_saveCookies is no longer needed", v3, 2u);
  }
}

- (void)_saveCookies:(id)a3
{
  id v3 = (void (**)(void))a3;
  uint64_t v4 = getCookieLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_INFO, "_saveCookies is no longer needed", v5, 2u);
  }

  v3[2](v3);
}

- (void)storeCookies:(id)a3 forTask:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = objc_alloc_init(NSHTTPCookie2StorageFilter);
  long long v9 = [v7 currentRequest];
  long long v10 = [v9 mainDocumentURL];
  [(NSHTTPCookie2StorageFilter *)v8 setMainDocumentURL:v10];

  long long v11 = [v7 currentRequest];
  long long v12 = [v11 URL];
  [(NSHTTPCookie2StorageFilter *)v8 setUrl:v12];

  if (self->_behavesLikeNS) {
    unint64_t acceptPolicy = (int)[v7 _cookieAcceptPolicy];
  }
  else {
    unint64_t acceptPolicy = self->_acceptPolicy;
  }
  [(NSHTTPCookie2StorageFilter *)v8 setAcceptPolicy:acceptPolicy];
  uint64_t v14 = [v7 currentRequest];
  id v15 = [v14 cookiePartitionIdentifier];
  v16 = v15;
  if (!v15)
  {
    v16 = [v7 _storagePartitionIdentifier];
  }
  [(NSHTTPCookie2StorageFilter *)v8 setPartition:v16];
  if (!v15) {

  }
  [(NSHTTPCookie2StorageFilter *)v8 setOverwriteHTTPOnlyCookies:1];
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, *(void **)(*((void *)&v30 + 1) + 8 * i));
        [v18 addObject:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }

  store = self->_store;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__NSHTTPCookieStorageToCookie2Storage_storeCookies_forTask___block_invoke;
  v27[3] = &unk_1E5257FB0;
  id v25 = v19;
  id v28 = v25;
  id v26 = v17;
  v29 = v26;
  [(NSHTTPCookie2Storage *)store setCookies:v18 withFilter:v8 completionHandler:v27];
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __60__NSHTTPCookieStorageToCookie2Storage_storeCookies_forTask___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = getCookieLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_184085000, v2, OS_LOG_TYPE_DEBUG, "Cookies stored for task. %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_testingOfStoringOfCookie:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_alloc_init(NSHTTPCookie2StorageFilter);
  uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = NSString;
  dispatch_semaphore_t v8 = [v4 domain];
  long long v9 = [v4 path];
  long long v10 = [v7 stringWithFormat:@"http://%@%@", v8, v9];
  long long v11 = [v6 URLWithString:v10];
  [(NSHTTPCookie2StorageFilter *)v5 setUrl:v11];

  [(NSHTTPCookie2StorageFilter *)v5 setOverwriteHTTPOnlyCookies:1];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  id v13 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v21[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  store = self->_store;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__NSHTTPCookieStorageToCookie2Storage__testingOfStoringOfCookie___block_invoke;
  v18[3] = &unk_1E5257FB0;
  id v19 = v14;
  v16 = v12;
  uint64_t v20 = v16;
  id v17 = v14;
  [(NSHTTPCookie2Storage *)store setCookies:v17 withFilter:v5 completionHandler:v18];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __65__NSHTTPCookieStorageToCookie2Storage__testingOfStoringOfCookie___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = getCookieLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_184085000, v2, OS_LOG_TYPE_DEBUG, "Set cookie completion. Cookies = %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v27 = a4;
  id v11 = a5;
  id v12 = a6;
  id v26 = v11;
  id v13 = objc_alloc_init(NSHTTPCookie2StorageFilter);
  [(NSHTTPCookie2StorageFilter *)v13 setMainDocumentURL:v11];
  [(NSHTTPCookie2StorageFilter *)v13 setUrl:v27];
  [(NSHTTPCookie2StorageFilter *)v13 setAcceptPolicy:[(NSHTTPCookieStorageToCookie2Storage *)self cookieAcceptPolicy]];
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  if (v12)
  {
    id v15 = [v12 objectForKeyedSubscript:@"HTTPCookiePolicyPropertyCookieAcceptPolicy"];

    if (v15)
    {
      v16 = [v12 objectForKeyedSubscript:@"HTTPCookiePolicyPropertyCookieAcceptPolicy"];
      -[NSHTTPCookie2StorageFilter setAcceptPolicy:](v13, "setAcceptPolicy:", (int)[v16 intValue]);
    }
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, *(void **)(*((void *)&v31 + 1) + 8 * v21));
        [v17 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v19);
  }

  store = self->_store;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__NSHTTPCookieStorageToCookie2Storage__setCookies_forURL_mainDocumentURL_policyProperties___block_invoke;
  v28[3] = &unk_1E5257FB0;
  id v24 = v17;
  id v29 = v24;
  id v25 = v14;
  long long v30 = v25;
  [(NSHTTPCookie2Storage *)store setCookies:v24 withFilter:v13 completionHandler:v28];
  dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __91__NSHTTPCookieStorageToCookie2Storage__setCookies_forURL_mainDocumentURL_policyProperties___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = getCookieLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_184085000, v2, OS_LOG_TYPE_DEBUG, "Set cookie completion. Cookies = %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5
{
}

- (void)setCookie:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  store = self->_store;
  uint64_t v7 = -[NSHTTPCookieStorageToCookie2Storage _nsToNewCookie:]((NSMutableHTTPCookie2 *)self, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__NSHTTPCookieStorageToCookie2Storage_setCookie___block_invoke;
  v10[3] = &unk_1E5257FB0;
  id v8 = v4;
  id v11 = v8;
  long long v9 = v5;
  id v12 = v9;
  [(NSHTTPCookie2Storage *)store setCookie:v7 withFilter:0 completionHandler:v10];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __49__NSHTTPCookieStorageToCookie2Storage_setCookie___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = getCookieLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_184085000, v2, OS_LOG_TYPE_DEBUG, "Set cookie completion called. Cookie = %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  id v3 = getCookieLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_DEFAULT, "Do nothing", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  [(NSHTTPCookieStorage *)&v4 dealloc];
}

- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  self->_unint64_t acceptPolicy = 2;
  objc_super v4 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];

  return v4;
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  objc_super v4 = [(NSHTTPCookieStorage *)&v8 init];
  int v5 = v4;
  if (v4)
  {
    v4->_unint64_t acceptPolicy = 2;
    uint64_t v6 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSHTTPCookieStorageToCookie2Storage)init
{
  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  id v2 = [(NSHTTPCookieStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHTTPCookie2Storage sharedNSHTTPCookie2Storage];
    store = v2->_store;
    v2->_store = (NSHTTPCookie2Storage *)v3;

    v2->_unint64_t acceptPolicy = 2;
    v2->_behavesLikeNS = 1;
    -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](v2);
  }
  return v2;
}

- (void)registerForPostingNotifications
{
  objc_initWeak(&location, val);
  uint64_t v2 = *((void *)val + 5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke;
  v6[3] = &unk_1E5258100;
  objc_copyWeak(&v7, &location);
  uint64_t v3 = v6;
  objc_super v4 = v3;
  if (v2)
  {
    int v5 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__NSHTTPCookie2Storage__setDefaultCookieChangedNotificationHandler___block_invoke;
    block[3] = &unk_1E5258028;
    block[4] = v2;
    id v10 = v3;
    dispatch_async(v5, block);
  }
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = cookieNotificationQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke_2;
    block[3] = &unk_1E5258228;
    id v4 = WeakRetained;
    dispatch_async(v2, block);
  }
}

void __70__NSHTTPCookieStorageToCookie2Storage_registerForPostingNotifications__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.Foundation.NSHTTPCookieManagerAcceptPolicyChanged" object:*(void *)(a1 + 32)];
}

- (void)initMemoryCookieStore
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
  v1 = objc_msgSendSuper2(&v5, sel_init);
  if (v1)
  {
    id v2 = [[NSHTTPCookie2Storage alloc] initInNSMemoryHTTPCookie2Storage];
    uint64_t v3 = (void *)v1[5];
    v1[5] = v2;

    v1[3] = 2;
    -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](v1);
  }
  return v1;
}

- (void)initWithPath:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      id v4 = [[NSHTTPCookie2Storage alloc] initWithPath:v3];
      objc_super v5 = (void *)a1[5];
      a1[5] = v4;

      a1[3] = 2;
      -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](a1);
    }
  }

  return a1;
}

- (void)initWithIdentifyingData:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSHTTPCookieStorageToCookie2Storage;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      id v4 = [[NSHTTPCookie2Storage alloc] initWithIdentifyingData:v3];
      objc_super v5 = (void *)a1[5];
      a1[5] = v4;

      a1[3] = 2;
      -[NSHTTPCookieStorageToCookie2Storage registerForPostingNotifications](a1);
    }
  }

  return a1;
}

@end