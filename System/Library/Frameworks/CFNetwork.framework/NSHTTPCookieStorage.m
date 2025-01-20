@interface NSHTTPCookieStorage
+ (NSHTTPCookieStorage)sharedCookieStorageForGroupContainerIdentifier:(NSString *)identifier;
+ (NSHTTPCookieStorage)sharedHTTPCookieStorage;
+ (id)_csff:(id)a3;
+ (uint64_t)_groupContainerCookieStorages;
+ (void)_setSharedHTTPCookieStorage:(id)a3;
- (BOOL)_overrideSessionCookieAcceptPolicy;
- (NSArray)cookies;
- (NSArray)cookiesForURL:(NSURL *)URL;
- (NSArray)sortedCookiesUsingDescriptors:(NSArray *)sortOrder;
- (NSHTTPCookieAcceptPolicy)cookieAcceptPolicy;
- (NSHTTPCookieStorage)init;
- (OpaqueCFHTTPCookieStorage)_cookieStorage;
- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4;
- (id)_getCookiesForDomain:(id)a3;
- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4;
- (id)description;
- (uint64_t)_addDomain:(void *)a3 toSubScriberDictionary:(uint64_t)a4 forSubscriber:;
- (void)_getCookieStoragePartitionsCompletionHandler:(id)a3;
- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4;
- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6;
- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7;
- (void)_saveCookies;
- (void)_saveCookies:(id)a3;
- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6;
- (void)_setCookiesChangedHandler:(id)a3 onQueue:(id)a4;
- (void)_setCookiesRemovedHandler:(id)a3 onQueue:(id)a4;
- (void)_setPrivateBrowsingEnabled:(BOOL)a3;
- (void)_setSubscribedDomainsForCookieChanges:(id)a3;
- (void)_testingOfStoringOfCookie:(id)a3;
- (void)dealloc;
- (void)deleteCookie:(NSHTTPCookie *)cookie;
- (void)getCookiesForTask:(NSURLSessionTask *)task completionHandler:(void *)completionHandler;
- (void)removeCookiesSinceDate:(NSDate *)date;
- (void)setCookie:(NSHTTPCookie *)cookie;
- (void)setCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)cookieAcceptPolicy;
- (void)setCookies:(NSArray *)cookies forURL:(NSURL *)URL mainDocumentURL:(NSURL *)mainDocumentURL;
- (void)set_overrideSessionCookieAcceptPolicy:(BOOL)a3;
- (void)storeCookies:(NSArray *)cookies forTask:(NSURLSessionTask *)task;
@end

@implementation NSHTTPCookieStorage

+ (NSHTTPCookieStorage)sharedHTTPCookieStorage
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedCookieStorageLock);
  v2 = (NSHTTPCookieStorage *)sSharedInstance;
  if (!sSharedInstance)
  {
    if (+[NSHTTPCookieStorage sharedHTTPCookieStorage]::sOnce != -1) {
      dispatch_once(&+[NSHTTPCookieStorage sharedHTTPCookieStorage]::sOnce, &__block_literal_global_34_18035);
    }
    v2 = (NSHTTPCookieStorage *)sSharedInstance;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedCookieStorageLock);
  return v2;
}

- (BOOL)_overrideSessionCookieAcceptPolicy
{
  return self->__overrideSessionCookieAcceptPolicy;
}

- (NSHTTPCookieAcceptPolicy)cookieAcceptPolicy
{
  v2 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (!v2) {
    return 2;
  }
  uint64_t v3 = CFHTTPCookieStorageGetCookieAcceptPolicy((char *)v2) - 1;
  if (v3 <= 2) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void)setCookieAcceptPolicy:(NSHTTPCookieAcceptPolicy)cookieAcceptPolicy
{
  v4 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v4)
  {
    v5 = (char *)v4;
    CFRetain(v4);
    if (cookieAcceptPolicy <= (NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain|NSHTTPCookieAcceptPolicyNever)) {
      CFHTTPCookieStorageSetCookieAcceptPolicy(v5, cookieAcceptPolicy);
    }
    CFRelease(v5);
  }
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 policyProperties:(id)a6 completionHandler:(id)a7
{
  v12 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (!v12)
  {
    id v15 = (id)[MEMORY[0x1E4F1C978] array];
    goto LABEL_15;
  }
  v13 = v12;
  if (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EC0A5D78))
  {
    uint64_t v14 = 1;
    if (!a6) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EC0A5E90);
    if (!a6)
    {
LABEL_9:
      char v17 = 0;
      goto LABEL_10;
    }
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a6, @"_kCFHTTPCookiePolicyPropertyAllowOnlyPartitionedCookies");
  if (!Value) {
    goto LABEL_9;
  }
  char v17 = CFBooleanGetValue(Value) != 0;
LABEL_10:
  HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v19, a3, a4, (uint64_t)a5, 0, 0, (const __CFDictionary *)a6, v17);
  if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
    dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
  }
  CFArrayRef v18 = HTTPCookieStorage::copyCookiesForURLWithMainDocumentURL((HTTPCookieStorage *)((char *)v13 + 16), (const HTTPCookieStoragePolicy *)v19, (const __CFURL *)v14);
  id v15 = +[NSHTTPCookie _cf2nsCookies:v18];
  if (v18) {
    CFRelease(v18);
  }
  HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v19);
LABEL_15:
  (*((void (**)(id, id))a7 + 2))(a7, v15);
}

- (NSArray)cookiesForURL:(NSURL *)URL
{
  if (URL)
  {
    unsigned int v5 = [(NSString *)[(NSURL *)URL scheme] isEqualToString:0x1EC0A5D78]
      || [(NSString *)[(NSURL *)URL scheme] isEqualToString:0x1EC0A5E90];
    v7 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if (v7)
    {
      v8 = v7;
      CFRetain(v7);
      CFArrayRef v9 = CFHTTPCookieStorageCopyCookiesForURL(v8, URL, v5);
      CFRelease(v8);
      if (v9)
      {
        v10 = +[NSHTTPCookie _cf2nsCookies:v9];
        CFRelease(v9);
        return v10;
      }
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v6 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_184085000, v6, OS_LOG_TYPE_ERROR, "cookiesForURL called with a nil url", v12, 2u);
    }
  }
  return 0;
}

- (OpaqueCFHTTPCookieStorage)_cookieStorage
{
  internal = self->_internal;
  if (!internal) {
    return 0;
  }
  uint64_t v3 = 16;
  if (!internal->privateBrowsing) {
    uint64_t v3 = 8;
  }
  return *(OpaqueCFHTTPCookieStorage **)((char *)&internal->super.isa + v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieStorage;
  [(NSHTTPCookieStorage *)&v3 dealloc];
}

NSHTTPCookieStorageToCookie2Storage *__46__NSHTTPCookieStorage_sharedHTTPCookieStorage__block_invoke()
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v0 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_184085000, v0, OS_LOG_TYPE_DEFAULT, "Initializing NSHTTPCookieStorage singleton", v3, 2u);
  }
  if (newCookieStorageEnabled(void)::onceToken != -1) {
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
  }
  if (newCookieStorageEnabled(void)::enabled)
  {
    result = objc_alloc_init(NSHTTPCookieStorageToCookie2Storage);
    sSharedInstance = (uint64_t)result;
  }
  else
  {
    result = [[NSHTTPCookieStorage alloc] _initWithCFHTTPCookieStorage:_CFHTTPCookieStorageGetDefault()];
    sSharedInstance = (uint64_t)result;
    if (result)
    {
      v2 = result;
      result = (NSHTTPCookieStorageToCookie2Storage *)result->super._internal;
      if (result) {
        return (NSHTTPCookieStorageToCookie2Storage *)[(NSHTTPCookieStorageToCookie2Storage *)result registerForPostingNotificationsWithContext:v2];
      }
    }
  }
  return result;
}

- (id)_initWithCFHTTPCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NSHTTPCookieStorage;
  v4 = [(NSHTTPCookieStorage *)&v12 init];
  if (v4)
  {
    if (newCookieStorageEnabled(void)::onceToken != -1) {
      dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
    }
    if (newCookieStorageEnabled(void)::enabled)
    {

      return +[NSHTTPCookieStorage sharedHTTPCookieStorage];
    }
    else
    {
      unsigned int v5 = [NSHTTPCookieStorageInternal alloc];
      if (v5)
      {
        v13.receiver = v5;
        v13.super_class = (Class)NSHTTPCookieStorageInternal;
        v6 = [(NSHTTPCookieStorage *)&v13 init];
        v7 = (NSHTTPCookieStorageInternal *)v6;
        if (v6)
        {
          v6->_internal = (NSHTTPCookieStorageInternal *)a3;
          if (a3)
          {
            CFRetain(a3);
            CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          }
          else
          {
            NSLog(&cfstr_CannotGetDefau.isa);
            CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            v7->storage = (OpaqueCFHTTPCookieStorage *)_CookieStorageCreateInMemory((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v10);
          }
          v7->privateStorage = (OpaqueCFHTTPCookieStorage *)_CookieStorageCreateInMemory(v9, v8);
          v7->dataLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
          v7->privateBrowsing = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      v4->_internal = v7;
    }
  }
  return v4;
}

- (void)set_overrideSessionCookieAcceptPolicy:(BOOL)a3
{
  self->__overrideSessionCookieAcceptPolicy = a3;
}

- (void)_testingOfStoringOfCookie:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (const void *)[MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"http://%@%@", objc_msgSend(a3, "domain"), objc_msgSend(a3, "path"))];
  v6 = [(NSHTTPCookieStorage *)self _cookieStorage];
  HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v8, v5, v5, 0, 0, 1, 0, 0);
  if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
    dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
  }
  if (v6) {
    v7 = (HTTPCookieStorage *)((char *)v6 + 16);
  }
  else {
    v7 = 0;
  }
  v9[0] = [a3 _CFHTTPCookie];
  HTTPCookieStorage::setCookiesWithPolicy(v7, (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1], (const HTTPCookieStoragePolicy *)v8);
  HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v8);
}

- (id)_getCookiesForDomain:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v4 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v4)
  {
    unsigned int v5 = v4;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    v6 = (char *)v5 + 16;
  }
  else
  {
    v6 = 0;
  }
  v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFGetAllocator(v6 - 16);
  v45 = v44;
  v44[0] = 0;
  uint64_t v43 = 0;
  v41 = &unk_1ECF9C868;
  v42 = v44;
  char v46 = 0;
  CookieHostName::initializeFromString((CookieHostName *)&v41, (__CFString *)a3, v8);
  if (v43)
  {
    v38[0] = &unk_1ECF9F1A0;
    DomainAndPartition::init(v38, 0, 0, v42 + 1);
    CFAllocatorRef v9 = (void *)*((void *)v6 + 2);
    DomainAndPartition::DomainAndPartition((uint64_t)v35, (uint64_t)v38);
    v10 = (const CompactCookieArray *)PrivateHTTPCookieStorage::copyDomainCookieArray(v9, (uint64_t)v35, 1);
    v35[0] = &unk_1ECF9F1A0;
    if (v37 && v37 != &v36) {
      free(v37);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v26 = ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0l;
    v28 = v10;
    appendCompactCookieArray(v10, v7);
    if (v43) {
      objc_super v12 = (CookieUtils *)(v42 + 1);
    }
    else {
      objc_super v12 = 0;
    }
    if (CookieUtils::looksLikeIPAddress(v12, v11))
    {
      if (v43) {
        objc_super v13 = v42;
      }
      else {
        objc_super v13 = 0;
      }
      v32[0] = &unk_1ECF9F1A0;
      DomainAndPartition::init(v32, 0, 0, v13);
      uint64_t v14 = (void *)*((void *)v6 + 2);
      DomainAndPartition::DomainAndPartition((uint64_t)v29, (uint64_t)v32);
      id v15 = (const CompactCookieArray *)PrivateHTTPCookieStorage::copyDomainCookieArray(v14, (uint64_t)v29, 1);
      v29[0] = &unk_1ECF9F1A0;
      if (v31 && v31 != v30) {
        free(v31);
      }
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke_3;
      v23 = &__block_descriptor_40_e5_v8__0l;
      v24 = v15;
      appendCompactCookieArray(v15, v7);
      ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke_3((uint64_t)&v20);
      v32[0] = &unk_1ECF9F1A0;
      if (v34 && v34 != v33) {
        free(v34);
      }
    }
    else
    {
      do
      {
        if (v43) {
          v16 = v42;
        }
        else {
          v16 = 0;
        }
        v32[0] = &unk_1ECF9F1A0;
        DomainAndPartition::init(v32, 0, 0, v16);
        char v17 = (void *)*((void *)v6 + 2);
        DomainAndPartition::DomainAndPartition((uint64_t)v29, (uint64_t)v32);
        CFArrayRef v18 = (const CompactCookieArray *)PrivateHTTPCookieStorage::copyDomainCookieArray(v17, (uint64_t)v29, 1);
        v29[0] = &unk_1ECF9F1A0;
        if (v31 && v31 != v30) {
          free(v31);
        }
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        v22 = ___ZN17HTTPCookieStorage20copyCookiesForDomainEPK10__CFString_block_invoke_2;
        v23 = &__block_descriptor_40_e5_v8__0l;
        v24 = v18;
        appendCompactCookieArray(v18, v7);
        v22((uint64_t)&v20);
        v32[0] = &unk_1ECF9F1A0;
        if (v34 && v34 != v33) {
          free(v34);
        }
      }
      while (CookieHostName::trimFirstComponent((CookieHostName *)&v41));
    }
    v26((uint64_t)v25);
    v38[0] = &unk_1ECF9F1A0;
    if (v40 && v40 != &v39) {
      free(v40);
    }
  }
  if (!CFArrayGetCount(v7) && v7)
  {
    CFRelease(v7);
    v7 = 0;
  }
  v41 = &unk_1ECF9C868;
  if (v45 != v44) {
    free(v45);
  }

  return v7;
}

- (void)_getCookiesForPartition:(id)a3 completionHandler:(id)a4
{
  values = a3;
  v6 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v6)
  {
    v7 = v6;
    if (!a3) {
      values = &stru_1ECFAD558;
    }
    CFDictionaryRef v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&kCFHTTPCookieStoragePartition, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    CFAllocatorRef v9 = HTTPCookieStorage::copyCookiesMatching((HTTPCookieStorage *)((char *)v7 + 16), v8, 11, 0);
    if (v8) {
      CFRelease(v8);
    }
    id v10 = +[NSHTTPCookie _cf2nsCookies:v9];
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    id v10 = (id)[MEMORY[0x1E4F1C978] array];
  }
  (*((void (**)(id, id))a4 + 2))(a4, v10);
}

- (void)_getCookieStoragePartitionsCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = [(NSHTTPCookieStorage *)self cookies];
  unsigned int v5 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) _storagePartition];
        if (v10) {
          [v5 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, [v5 allObjects]);
}

- (void)_getCookiesForURL:(id)a3 mainDocumentURL:(id)a4 partition:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v10)
  {
    long long v11 = v10;
    if (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EC0A5D78)) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EC0A5E90);
    }
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v15, a3, a4, (uint64_t)a5, 0, 0, 0, 0);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    CFArrayRef v14 = HTTPCookieStorage::copyCookiesForURLWithMainDocumentURL((HTTPCookieStorage *)((char *)v11 + 16), (const HTTPCookieStoragePolicy *)v15, (const __CFURL *)v12);
    id v13 = +[NSHTTPCookie _cf2nsCookies:v14];
    if (v14) {
      CFRelease(v14);
    }
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v15);
  }
  else
  {
    id v13 = (id)[MEMORY[0x1E4F1C978] array];
  }
  (*((void (**)(id, id))a6 + 2))(a6, v13);
}

- (void)getCookiesForTask:(NSURLSessionTask *)task completionHandler:(void *)completionHandler
{
  v23[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(NSURLSessionTask *)task currentRequest_URL];
  uint64_t v8 = [(NSURLRequest *)[(NSURLSessionTask *)task originalRequest] mainDocumentURL];
  uint64_t v9 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v9)
  {
    uint64_t v10 = (char *)v9;
    uint64_t v11 = [(NSString *)[(NSURL *)v7 scheme] isEqualToString:0x1EC0A5D78]
       || [(NSString *)[(NSURL *)v7 scheme] isEqualToString:0x1EC0A5E90];
    if ([(NSURLSessionTask *)task _siteForCookies])
    {
      v22[0] = @"_kCFHTTPCookiePolicyPropertySiteForCookies";
      v23[0] = [(NSURLSessionTask *)task _siteForCookies];
      v22[1] = @"_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation";
      v23[1] = objc_msgSend(NSNumber, "numberWithBool:", -[NSURLSessionTask _isTopLevelNavigation](task, "_isTopLevelNavigation"));
      v22[2] = @"_kCFHTTPCookiePolicyPropertyIsSafeRequest";
      v23[2] = objc_msgSend(NSNumber, "numberWithBool:", -[NSURLRequest _isIdempotent](-[NSURLSessionTask currentRequest](task, "currentRequest"), "_isIdempotent"));
      CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    }
    else
    {
      CFDictionaryRef v15 = 0;
    }
    int CookieAcceptPolicy = [(NSURLSessionTask *)task _cookieAcceptPolicy];
    char v17 = [(NSURLSessionConfiguration *)[(NSURLSessionTask *)task _effectiveConfiguration] HTTPCookieStorage];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(NSHTTPCookieStorage *)v17 _overrideSessionCookieAcceptPolicy])
    {
      int CookieAcceptPolicy = CFHTTPCookieStorageGetCookieAcceptPolicy(v10);
    }
    CFArrayRef v18 = [(NSURLRequest(NSHTTPURLRequest) *)[(NSURLSessionTask *)task currentRequest] cookiePartitionIdentifier];
    if (!v18) {
      CFArrayRef v18 = [(NSURLSessionTask *)task _storagePartitionIdentifier];
    }
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v21, v7, v8, (uint64_t)v18, CookieAcceptPolicy, 0, v15, [(NSURLRequest *)[(NSURLSessionTask *)task currentRequest] _allowOnlyPartitionedCookies]);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    CFArrayRef v19 = HTTPCookieStorage::copyCookiesForURLWithMainDocumentURL((HTTPCookieStorage *)(v10 + 16), (const HTTPCookieStoragePolicy *)v21, (const __CFURL *)v11);
    uint64_t v20 = +[NSHTTPCookie _cf2nsCookies:v19];
    if (v19) {
      CFRelease(v19);
    }
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v21);
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();
    id v13 = [(NSURLRequest *)[(NSURLSessionTask *)task currentRequest] URL];
    if (v12) {
      CFArrayRef v14 = [(NSHTTPCookieStorage *)self _cookiesForURL:v13 mainDocumentURL:[(NSURLRequest *)[(NSURLSessionTask *)task originalRequest] mainDocumentURL]];
    }
    else {
      CFArrayRef v14 = [(NSHTTPCookieStorage *)self cookiesForURL:v13];
    }
    uint64_t v20 = v14;
  }
  (*((void (**)(void *, NSArray *))completionHandler + 2))(completionHandler, v20);
}

- (void)storeCookies:(NSArray *)cookies forTask:(NSURLSessionTask *)task
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[NSHTTPCookie _ns2cfCookies:cookies];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if ([(NSURLSessionTask *)task _siteForCookies])
    {
      v17[0] = @"_kCFHTTPCookiePolicyPropertySiteForCookies";
      v18[0] = [(NSURLSessionTask *)task _siteForCookies];
      v17[1] = @"_kCFHTTPCookiePolicyPropertyIsTopLevelNavigation";
      v18[1] = objc_msgSend(NSNumber, "numberWithBool:", -[NSURLSessionTask _isTopLevelNavigation](task, "_isTopLevelNavigation"));
      CFDictionaryRef v9 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      if (!v8) {
        goto LABEL_16;
      }
    }
    else
    {
      CFDictionaryRef v9 = 0;
      if (!v8)
      {
LABEL_16:
        CFRelease(v7);
        return;
      }
    }
    uint64_t v10 = [(NSURLRequest *)[(NSURLSessionTask *)task currentRequest] URL];
    uint64_t v11 = [(NSURLRequest *)[(NSURLSessionTask *)task originalRequest] mainDocumentURL];
    char v12 = [(NSURLRequest(NSHTTPURLRequest) *)[(NSURLSessionTask *)task currentRequest] cookiePartitionIdentifier];
    if (!v12) {
      char v12 = [(NSURLSessionTask *)task _storagePartitionIdentifier];
    }
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    id v13 = (PrivateHTTPCookieStorage *)*((void *)v8 + 4);
    if (v13) {
      int CookieAcceptPolicy = PrivateHTTPCookieStorage::getCookieAcceptPolicy(v13);
    }
    else {
      int CookieAcceptPolicy = 2;
    }
    HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v16, v10, v11, (uint64_t)v12, CookieAcceptPolicy, 2, v9, [(NSURLRequest *)[(NSURLSessionTask *)task currentRequest] _allowOnlyPartitionedCookies]);
    CFDictionaryRef v15 = (HTTPCookieStorage *)((char *)v8 + 16);
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    HTTPCookieStorage::setCookiesWithPolicy(v15, v7, (const HTTPCookieStoragePolicy *)v16);
    HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v16);
    goto LABEL_16;
  }
}

- (NSArray)sortedCookiesUsingDescriptors:(NSArray *)sortOrder
{
  objc_super v3 = sortOrder;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](sortOrder, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  obj = v3;
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v35;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 comparator] || (char *)objc_msgSend(v11, "selector") != sel_compare_)
          {
            char v7 = 1;
            goto LABEL_12;
          }
          uint64_t v12 = [v11 key];
          if ([v11 ascending]) {
            uint64_t v11 = (void *)v12;
          }
          else {
            uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v12, MEMORY[0x1E4F1CC28], 0);
          }
          objc_super v3 = obj;
        }
        else
        {
          char v8 = 1;
        }
        [v4 addObject:v11];
LABEL_12:
        ++v10;
      }
      while (v6 != v10);
      uint64_t v13 = [(NSArray *)v3 countByEnumeratingWithState:&v34 objects:v39 count:16];
      uint64_t v6 = v13;
      if (!v13) {
        goto LABEL_21;
      }
    }
  }
  char v7 = 0;
  char v8 = 0;
LABEL_21:
  CFArrayRef v14 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (!v14) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  CFDictionaryRef v15 = v14;
  if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
    dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
  }
  uint64_t v16 = HTTPCookieStorage::copyCookiesMatching((HTTPCookieStorage *)((char *)v15 + 16), 0, 32, (const __CFArray *)v4);
  if (!v16) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  char v17 = v16;
  CFArrayRef v18 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:CFArrayGetCount(v16)];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __53__NSHTTPCookieStorage_sortedCookiesUsingDescriptors___block_invoke;
  v33[3] = &unk_1E52572B8;
  v33[4] = v18;
  [(__CFArray *)v17 enumerateObjectsUsingBlock:v33];
  CFRelease(v17);
  if (v7)
  {
    if (v8)
    {
      CFArrayRef v19 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v3, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v20 = [(NSArray *)v3 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              uint64_t v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v24 ascending:1];
            }
            [(NSArray *)v19 addObject:v24];
          }
          uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v21);
      }
      objc_super v3 = v19;
    }
    return [(NSArray *)v18 sortedArrayUsingDescriptors:v3];
  }
  return v18;
}

uint64_t __53__NSHTTPCookieStorage_sortedCookiesUsingDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSHTTPCookieStorage cookies count:%ld>", -[NSArray count](-[NSHTTPCookieStorage cookies](self, "cookies"), "count"));
}

- (void)_setCookiesRemovedHandler:(id)a3 onQueue:(id)a4
{
  uint64_t v6 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v6)
  {
    char v7 = v6;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    char v8 = (char *)v7 + 16;
  }
  else
  {
    char v8 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)v8 + 30);
  uint64_t v9 = (const void *)*((void *)v8 + 14);
  if (v9)
  {
    _Block_release(v9);
    *((void *)v8 + 14) = 0;
  }
  uint64_t v10 = *((void *)v8 + 12);
  if (v10)
  {
    dispatch_release(v10);
    *((void *)v8 + 12) = 0;
  }
  if (!a3)
  {
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  *((void *)v8 + 14) = _Block_copy(a3);
  if (a4)
  {
LABEL_14:
    dispatch_retain((dispatch_object_t)a4);
    goto LABEL_15;
  }
  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  a4 = dispatch_queue_create("cookies_deleted_handler_queue_default", v11);
LABEL_15:
  *((void *)v8 + 12) = a4;
LABEL_16:

  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 30);
}

- (void)_setCookiesChangedHandler:(id)a3 onQueue:(id)a4
{
  uint64_t v6 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v6)
  {
    char v7 = v6;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    char v8 = (char *)v7 + 16;
  }
  else
  {
    char v8 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)v8 + 30);
  uint64_t v9 = (const void *)*((void *)v8 + 13);
  if (v9)
  {
    _Block_release(v9);
    *((void *)v8 + 13) = 0;
  }
  uint64_t v10 = *((void *)v8 + 11);
  if (v10)
  {
    dispatch_release(v10);
    *((void *)v8 + 11) = 0;
  }
  if (!a3)
  {
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  *((void *)v8 + 13) = _Block_copy(a3);
  if (a4)
  {
LABEL_14:
    dispatch_retain((dispatch_object_t)a4);
    goto LABEL_15;
  }
  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  a4 = dispatch_queue_create("cookies_added_handler_queue_default", v11);
LABEL_15:
  *((void *)v8 + 11) = a4;
LABEL_16:

  os_unfair_lock_unlock((os_unfair_lock_t)v8 + 30);
}

- (void)_setSubscribedDomainsForCookieChanges:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        -[NSHTTPCookieStorage _addDomain:toSubScriberDictionary:forSubscriber:]((uint64_t)self, (uint64_t)v10, v5, (uint64_t)v10);
        -[NSHTTPCookieStorage _addDomain:toSubScriberDictionary:forSubscriber:]((uint64_t)self, [@"." stringByAppendingString:v10], v5, (uint64_t)v10);
        if ([v10 length])
        {
          unint64_t v11 = 0;
          do
          {
            if ([v10 characterAtIndex:v11] == 46)
            {
              CFStringRef v12 = (const __CFString *)[v10 substringFromIndex:v11];
              if (isTopLevelDomain(v12, 1)) {
                break;
              }
              -[NSHTTPCookieStorage _addDomain:toSubScriberDictionary:forSubscriber:]((uint64_t)self, (uint64_t)v12, v5, (uint64_t)v10);
            }
            ++v11;
          }
          while (v11 < [v10 length]);
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  uint64_t v13 = [v5 count];
  CFArrayRef v14 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (v14)
  {
    CFDictionaryRef v15 = v14;
    if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
      dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
    }
    uint64_t v16 = (os_unfair_lock_s *)((char *)v15 + 16);
  }
  else
  {
    uint64_t v16 = 0;
  }
  if (v13) {
    char v17 = v5;
  }
  else {
    char v17 = 0;
  }
  os_unfair_lock_lock(v16 + 30);
  CFArrayRef v18 = *(const void **)&v16[20]._os_unfair_lock_opaque;
  if (v18) {
    CFRelease(v18);
  }
  if (v17) {
    CFTypeRef v19 = CFRetain(v17);
  }
  else {
    CFTypeRef v19 = 0;
  }
  *(void *)&v16[20]._os_unfair_lock_opaque = v19;
  os_unfair_lock_unlock(v16 + 30);
}

- (uint64_t)_addDomain:(void *)a3 toSubScriberDictionary:(uint64_t)a4 forSubscriber:
{
  if (result)
  {
    uint64_t v7 = (void *)[a3 objectForKeyedSubscript:a2];
    if (v7)
    {
      return [v7 addObject:a4];
    }
    else
    {
      uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
      [v8 addObject:a4];
      return [a3 setObject:v8 forKeyedSubscript:a2];
    }
  }
  return result;
}

- (void)_setCookies:(id)a3 forURL:(id)a4 mainDocumentURL:(id)a5 policyProperties:(id)a6
{
  uint64_t v10 = +[NSHTTPCookie _ns2cfCookies:a3];
  if (v10)
  {
    CFArrayRef v11 = v10;
    CFStringRef v12 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if (v12)
    {
      uint64_t v13 = v12;
      if (newCookieStorageEnabled(void)::onceToken != -1) {
        dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
      }
      if (newCookieStorageEnabled(void)::enabled)
      {
        [(OpaqueCFHTTPCookieStorage *)v13 _setCookies:v11 forURL:a4 mainDocumentURL:a5 policyProperties:a6];
      }
      else
      {
        if (a6
          && (CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a6, @"_kCFHTTPCookiePolicyPropertyAllowHTTPOnlyOverwrite")) != 0)
        {
          if (CFBooleanGetValue(Value)) {
            int v15 = 1;
          }
          else {
            int v15 = 2;
          }
        }
        else
        {
          int v15 = 2;
        }
        if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
          dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
        }
        uint64_t v16 = (PrivateHTTPCookieStorage *)*((void *)v13 + 4);
        if (v16) {
          int CookieAcceptPolicy = PrivateHTTPCookieStorage::getCookieAcceptPolicy(v16);
        }
        else {
          int CookieAcceptPolicy = 2;
        }
        HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v18, a4, a5, 0, CookieAcceptPolicy, v15, (const __CFDictionary *)a6, 0);
        if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
          dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
        }
        HTTPCookieStorage::setCookiesWithPolicy((HTTPCookieStorage *)((char *)v13 + 16), v11, (const HTTPCookieStoragePolicy *)v18);
        HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v18);
      }
    }
    CFRelease(v11);
  }
}

- (void)setCookies:(NSArray *)cookies forURL:(NSURL *)URL mainDocumentURL:(NSURL *)mainDocumentURL
{
  uint64_t v8 = +[NSHTTPCookie _ns2cfCookies:cookies];
  if (v8)
  {
    CFArrayRef v9 = v8;
    uint64_t v10 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if (v10) {
      CFHTTPCookieStorageSetCookies(v10, v9, URL, mainDocumentURL);
    }
    CFRelease(v9);
  }
}

- (id)_cookiesForURL:(id)a3 mainDocumentURL:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EC0A5D78)) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", 0x1EC0A5E90);
  }
  uint64_t v8 = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (!v8) {
    return 0;
  }
  CFArrayRef v9 = v8;
  CFRetain(v8);
  CFArrayRef v10 = _CFHTTPCookieStorageCopyCookiesForURLWithMainDocumentURL(v9, a3, a4, (const __CFURL *)v7);
  CFRelease(v9);
  if (!v10) {
    return 0;
  }
  id v11 = +[NSHTTPCookie _cf2nsCookies:v10];
  CFRelease(v10);
  return v11;
}

- (void)removeCookiesSinceDate:(NSDate *)date
{
  if (date)
  {
    v4 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if (v4)
    {
      uint64_t v5 = v4;
      CFRetain(v4);
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = ___ZN17HTTPCookieStorage22deleteCookiesSinceDateEPK8__CFDate_block_invoke;
      v8[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
      v8[4] = (char *)v5 + 16;
      uint64_t v6 = (void *)*((void *)v5 + 4);
      uint64_t v7 = v6[4];
      if (v7) {
        pthread_mutex_lock((pthread_mutex_t *)(v7 + 8));
      }
      (*(void (**)(void *, NSDate *, void *))(*v6 + 144))(v6, date, v8);
      if (v7) {
        pthread_mutex_unlock((pthread_mutex_t *)(v7 + 8));
      }
      HTTPCookieStorage::notifyObserversOfChanges((HTTPCookieStorage *)((char *)v5 + 16));
      CFRelease(v5);
    }
  }
}

- (void)deleteCookie:(NSHTTPCookie *)cookie
{
  if (cookie)
  {
    v4 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if (v4)
    {
      uint64_t v5 = (char *)v4;
      CFRetain(v4);
      CFHTTPCookieStorageDeleteCookie(v5, [(NSHTTPCookie *)cookie _GetInternalCFHTTPCookie]);
      CFRelease(v5);
    }
  }
}

- (void)setCookie:(NSHTTPCookie *)cookie
{
  if (cookie)
  {
    v4 = [(NSHTTPCookieStorage *)self _cookieStorage];
    if (v4)
    {
      uint64_t v5 = v4;
      CFRetain(v4);
      CFHTTPCookieStorageSetCookie(v5, [(NSHTTPCookie *)cookie _GetInternalCFHTTPCookie]);
      CFRelease(v5);
    }
  }
}

- (NSArray)cookies
{
  result = [(NSHTTPCookieStorage *)self _cookieStorage];
  if (result)
  {
    objc_super v3 = (char *)result;
    CFRetain(result);
    v4 = CFHTTPCookieStorageCopyCookies(v3);
    uint64_t v5 = +[NSHTTPCookie _cf2nsCookies:v4];
    CFRelease(v4);
    CFRelease(v3);
    return v5;
  }
  return result;
}

- (NSHTTPCookieStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieStorage;
  return [(NSHTTPCookieStorage *)&v3 init];
}

- (void)_saveCookies:(id)a3
{
  internal = self->_internal;
  if (internal)
  {
    storage = internal->storage;
    if (storage)
    {
      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1) {
        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_11813);
      }
      HTTPCookieStorage::syncStorageWithCompletion((uint64_t)storage + 16, 1, (uint64_t)a3);
    }
  }
}

- (void)_saveCookies
{
}

- (void)_setPrivateBrowsingEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal)
  {
    BOOL v4 = a3;
    [(NSRecursiveLock *)internal->dataLock lock];
    uint64_t v6 = self->_internal;
    if (v6->privateBrowsing != v4)
    {
      v6->privateBrowsing = v4;
      uint64_t v6 = self->_internal;
      if (!v4)
      {
        CFHTTPCookieStorageDeleteAllCookies((char *)v6->privateStorage);
        uint64_t v6 = self->_internal;
      }
    }
    dataLock = v6->dataLock;
    [(NSRecursiveLock *)dataLock unlock];
  }
}

- (id)_initWithIdentifier:(id)a3 private:(BOOL)a4
{
  BOOL v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NSHTTPCookieStorage;
  uint64_t v6 = [(NSHTTPCookieStorage *)&v14 init];
  if (v6)
  {
    if (newCookieStorageEnabled(void)::onceToken != -1) {
      dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
    }
    if (newCookieStorageEnabled(void)::enabled)
    {

      return +[NSHTTPCookieStorage sharedHTTPCookieStorage];
    }
    else
    {
      uint64_t v7 = [NSHTTPCookieStorageInternal alloc];
      if (v7)
      {
        v15.receiver = v7;
        v15.super_class = (Class)NSHTTPCookieStorageInternal;
        uint64_t v8 = [(NSHTTPCookieStorage *)&v15 init];
        if (v8)
        {
          CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CFArrayRef v10 = (void *)MEMORY[0x1E4F1CFD0];
          if (v4) {
            CFArrayRef v10 = (void *)MEMORY[0x1E4F1CFC8];
          }
          MutableDictionary = cfTypeCreateMutableDictionary(v9, @"ident", a3, @"persistent", *v10, 0, 0);
          v8->_internal = (NSHTTPCookieStorageInternal *)_CFHTTPCookieStorageCreateWithProperties_possiblyFromCache(v9, MutableDictionary, 1);
          CFRelease(MutableDictionary);
          *(void *)&v8->__overrideSessionint CookieAcceptPolicy = _CookieStorageCreateInMemory(v9, v12);
          v8[1].super.isa = (Class)objc_alloc_init(MEMORY[0x1E4F28FD0]);
          LOBYTE(v8[1]._internal) = 0;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
      v6->_internal = (NSHTTPCookieStorageInternal *)v8;
    }
  }
  return v6;
}

+ (id)_csff:(id)a3
{
  if (newCookieStorageEnabled(void)::onceToken != -1) {
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
  }
  int v4 = newCookieStorageEnabled(void)::enabled;
  os_unfair_lock_lock((os_unfair_lock_t)&_groupContainerStoragesLock);
  if (v4)
  {
    uint64_t v5 = [NSHTTPCookieStorageToCookie2Storage alloc];
    uint64_t v6 = -[NSHTTPCookieStorageToCookie2Storage initWithPath:](v5, (void *)[MEMORY[0x1E4F1CB10] URLWithString:a3]);
  }
  else
  {
    uint64_t v6 = (void *)[(id)+[NSHTTPCookieStorage _groupContainerCookieStorages]() objectForKey:a3];
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
      if (v7)
      {
        CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        MutableDictionary = cfTypeCreateMutableDictionary((const __CFAllocator *)*MEMORY[0x1E4F1CF80], @"ident", a3, @"persistent", *MEMORY[0x1E4F1CFD0], @"url", v7, 0, 0);
        CFArrayRef v10 = _CFHTTPCookieStorageCreateWithProperties_possiblyFromCache(v8, MutableDictionary, 1);
        CFRelease(MutableDictionary);
        uint64_t v6 = [[NSHTTPCookieStorage alloc] _initWithCFHTTPCookieStorage:v10];
        [(id)v6[1] registerForPostingNotificationsWithContext:v6];
        CFRelease(v10);
        [(id)+[NSHTTPCookieStorage _groupContainerCookieStorages]() setObject:v6 forKey:a3];
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_groupContainerStoragesLock);
  return v6;
}

+ (uint64_t)_groupContainerCookieStorages
{
  if (+[NSHTTPCookieStorage _groupContainerCookieStorages]::onceToken != -1) {
    dispatch_once(&+[NSHTTPCookieStorage _groupContainerCookieStorages]::onceToken, &__block_literal_global_18032);
  }
  return +[NSHTTPCookieStorage _groupContainerCookieStorages]::sGroupContainerCookieStorages;
}

uint64_t __52__NSHTTPCookieStorage__groupContainerCookieStorages__block_invoke()
{
  uint64_t result = objc_opt_new();
  +[NSHTTPCookieStorage _groupContainerCookieStorages]::sGroupContainerCookieStorages = result;
  return result;
}

+ (NSHTTPCookieStorage)sharedCookieStorageForGroupContainerIdentifier:(NSString *)identifier
{
  os_unfair_lock_lock((os_unfair_lock_t)&_groupContainerStoragesLock);
  int v4 = (NSHTTPCookieStorage *)[(id)+[NSHTTPCookieStorage _groupContainerCookieStorages]() objectForKey:identifier];
  if (!v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", identifier);
    if (v5)
    {
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      MutableDictionary = cfTypeCreateMutableDictionary((const __CFAllocator *)*MEMORY[0x1E4F1CF80], @"ident", identifier, @"persistent", *MEMORY[0x1E4F1CFD0], @"kCFHTTPCookieStorageGroupContainerURL", v5, 0, 0);
      CFAllocatorRef v8 = _CFHTTPCookieStorageCreateWithProperties_possiblyFromCache(v6, MutableDictionary, 1);
      CFRelease(MutableDictionary);
      int v4 = (NSHTTPCookieStorage *)[[NSHTTPCookieStorage alloc] _initWithCFHTTPCookieStorage:v8];
      [(NSHTTPCookieStorageInternal *)v4->_internal registerForPostingNotificationsWithContext:v4];
      CFRelease(v8);
      [(id)+[NSHTTPCookieStorage _groupContainerCookieStorages]() setObject:v4 forKey:identifier];
    }
    else
    {
      int v4 = (NSHTTPCookieStorage *)(id)objc_opt_new();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_groupContainerStoragesLock);
  return v4;
}

+ (void)_setSharedHTTPCookieStorage:(id)a3
{
  if (newCookieStorageEnabled(void)::onceToken != -1) {
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
  }
  int v4 = newCookieStorageEnabled(void)::enabled;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedCookieStorageLock);
  if (v4)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, "Explicitly setting cookie storage singleton", buf, 2u);
    }
    sSharedInstance = (uint64_t)a3;
    goto LABEL_26;
  }
  if (sSharedInstance) {
    goto LABEL_30;
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  CFAllocatorRef v6 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFAllocatorRef v9 = 0;
    _os_log_impl(&dword_184085000, v6, OS_LOG_TYPE_DEFAULT, "Explicitly setting cookie storage singleton", v9, 2u);
  }
  sSharedInstance = (uint64_t)a3;
  [*(id *)(sSharedInstance + 8) registerForPostingNotificationsWithContext:a3];
  if (sSharedInstance) {
    uint64_t v7 = (const void *)[(id)sSharedInstance _cookieStorage];
  }
  else {
    uint64_t v7 = 0;
  }
  if (newCookieStorageEnabled(void)::onceToken != -1) {
    dispatch_once(&newCookieStorageEnabled(void)::onceToken, &__block_literal_global_1187);
  }
  if (!newCookieStorageEnabled(void)::enabled)
  {
    pthread_mutex_lock(&gSharedCookieStorageLock);
    if (!gSharedCookieStorageInstance)
    {
      if (!v7) {
        __assert_rtn("CFHTTPCookieStorageSetSharedHTTPCookieStorage", "CFHTTPCookieStorage.c", 111, "storage");
      }
      CFRetain(v7);
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      CFAllocatorRef v8 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_184085000, v8, OS_LOG_TYPE_DEFAULT, "Explicitly setting CF cookie storage singleton", v11, 2u);
      }
      gSharedCookieStorageInstance = (uint64_t)v7;
      pthread_mutex_unlock(&gSharedCookieStorageLock);
      goto LABEL_26;
    }
LABEL_30:
    CFLog();
    abort();
  }
LABEL_26:
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedCookieStorageLock);
}

@end