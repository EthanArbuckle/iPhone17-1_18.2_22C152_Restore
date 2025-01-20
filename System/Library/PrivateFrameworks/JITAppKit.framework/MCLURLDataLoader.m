@interface MCLURLDataLoader
+ (BOOL)isValidResumeData:(id)a3;
+ (BOOL)task:(id)a3 equalsToTask:(id)a4;
+ (id)dateFromRFC1123:(id)a3;
+ (id)downloadData;
+ (id)duplicateResponse:(id)a3 withContentLength:(int64_t)a4;
+ (id)fileExtensionForMimeType:(id)a3;
+ (id)mimeTypeForFileExtension:(id)a3;
+ (id)shared;
+ (id)uniqueImageKeyForURL:(id)a3;
+ (id)uniqueKeyForURL:(id)a3;
+ (void)addSessionConfigurator:(id)a3;
+ (void)applyDefaultRequestHeaders:(id)a3;
+ (void)removeFilesOlderThan:(id)a3 inDirectory:(id)a4;
+ (void)restart:(id)a3;
- (BOOL)deleteCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5;
- (MCLURLDataLoader)init;
- (NSArray)rewriteRules;
- (NSHTTPCookieStorage)cookieStorage;
- (NSOperationQueue)operationQueue;
- (NSSet)cacheLocations;
- (NSURLCache)cache;
- (NSURLSession)session;
- (id)_cachedResponseForRequest:(id)a3;
- (id)allCookies;
- (id)cachableFileAttributes:(id)a3;
- (id)configuredURLRequestForTask:(id)a3 download:(BOOL *)a4 resumeData:(id *)a5;
- (id)cookiesForURL:(id)a3;
- (id)defaultSessionConfiguration;
- (id)downloadCachedResponse:(id)a3;
- (id)downloadCachesDirectory;
- (id)downloadImageFromURL:(id)a3 category:(id)a4 completionHandler:(id)a5;
- (id)downloadImageWithRequest:(id)a3 category:(id)a4 completionHandler:(id)a5;
- (id)downloadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5;
- (id)downloadRequest:(id)a3 toPath:(id)a4 category:(id)a5 completionHandler:(id)a6;
- (id)downloadURL:(id)a3 category:(id)a4 completionHandler:(id)a5;
- (id)downloadURL:(id)a3 toPath:(id)a4 category:(id)a5 completionHandler:(id)a6;
- (id)duplicateTasksForTask:(id)a3;
- (id)findCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5;
- (id)findCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5 cookies:(id)a6;
- (id)findMatchingCookies:(id)a3 inDomain:(id)a4 secure:(BOOL)a5;
- (id)imagesDownloadDirectory;
- (id)loadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5;
- (id)loadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5 receiveData:(id)a6;
- (id)loadURL:(id)a3 category:(id)a4 completionHandler:(id)a5;
- (id)loaderTaskForSessionTask:(id)a3;
- (int64_t)priorityForCategory:(id)a3;
- (unint64_t)connectionsLimitForPriorityOfTask:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)_removeCachedResponseForRequest:(id)a3;
- (void)_removeCachedResponseForRequest:(id)a3 force:(BOOL)a4;
- (void)addCacheLocation:(id)a3;
- (void)addRewriteRule:(id)a3;
- (void)applicationDidBecomeActiveNotification:(id)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)applyRewriteRules:(id)a3;
- (void)backgroundClearOldCaches:(id)a3;
- (void)backgroundRemoveCachedResponseForRequest:(id)a3;
- (void)cancelTask:(id)a3;
- (void)cancelTasks:(id)a3;
- (void)clearCache;
- (void)clearOldCaches:(id)a3;
- (void)configureSession;
- (void)configureSession:(id)a3;
- (void)deleteCookiesMatchingPredicate:(id)a3;
- (void)dispose;
- (void)enqueueTask:(id)a3 reschedule:(BOOL)a4;
- (void)enumerateCookies:(id)a3 inDomain:(id)a4 secure:(BOOL)a5 withBlock:(id)a6;
- (void)enumerateCookies:(id)a3 secure:(BOOL)a4 cookies:(id)a5 withBlock:(id)a6;
- (void)flushCache;
- (void)internalRestart:(id)a3;
- (void)notifyBackgroundStopped;
- (void)notifyEmptyQueue;
- (void)notifyEnqueue;
- (void)operationCancelTask:(id)a3;
- (void)operationReschedule;
- (void)operationRestartSession;
- (void)operationResumeSession;
- (void)operationSuspendSession;
- (void)processURLRequestRewrite:(id)a3;
- (void)removeAllRewriteRules;
- (void)removeCachedResponseForRequest:(id)a3;
- (void)removeRewriteRule:(id)a3;
- (void)removeRewriteRules:(id)a3;
- (void)removeRewriteRulesWithName:(id)a3;
- (void)resume;
- (void)setCategory:(id)a3 forTask:(id)a4;
- (void)setCategory:(id)a3 forTasks:(id)a4;
- (void)setCookie:(id)a3;
- (void)setPriority:(int64_t)a3 forCategory:(id)a4;
- (void)setupCache:(BOOL)a3;
- (void)storeResumeData:(id)a3 forTask:(id)a4;
- (void)suspend;
- (void)task:(id)a3 completedWithError:(id)a4;
- (void)updateDownloadCacheEntry:(id)a3;
@end

@implementation MCLURLDataLoader

+ (id)dateFromRFC1123:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v17 = (const char *)[location[0] UTF8String];
    id v15 = 0;
    v14 = 0;
    v16 = "%a, %d %b %Y %H:%M:%S %Z";
    memset(&__b, 0, sizeof(__b));
    v14 = strptime_l(v17, "%a, %d %b %Y %H:%M:%S %Z", &__b, 0);
    if (v14
      && (time_t v12 = mktime(&__b),
          id v3 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v12], v4 = v15, v15 = v3, v4, v15))
    {
      id v20 = v15;
      int v18 = 1;
    }
    else
    {
      v16 = "%A, %d-%b-%y %H:%M:%S %Z";
      memset(&v11, 0, sizeof(v11));
      v14 = strptime_l(v17, "%A, %d-%b-%y %H:%M:%S %Z", &v11, 0);
      if (v14
        && (time_t v10 = mktime(&v11),
            id v5 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v10], v6 = v15, v15 = v5, v6, v15))
      {
        id v20 = v15;
        int v18 = 1;
      }
      else
      {
        v16 = "%a %b %e %H:%M:%S %Y";
        memset(&v9, 0, sizeof(v9));
        v14 = strptime_l(v17, "%a %b %e %H:%M:%S %Y", &v9, 0);
        if (v14) {
          id v20 = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)mktime(&v9)];
        }
        else {
          id v20 = 0;
        }
        int v18 = 1;
      }
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v20 = 0;
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
  v7 = v20;
  return v7;
}

+ (id)fileExtensionForMimeType:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  CFStringRef PreferredIdentifierForTag = 0;
  CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01918], (CFStringRef)location[0], 0);
  id v7 = 0;
  if (PreferredIdentifierForTag)
  {
    obj = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x263F01910]);
    CFRelease(PreferredIdentifierForTag);
    if (obj)
    {
      objc_storeStrong(&v7, obj);
      CFRelease(obj);
    }
  }
  if (v7) {
    id v3 = (__CFString *)v7;
  }
  else {
    id v3 = &stru_26DD585A8;
  }
  id v5 = v3;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)mimeTypeForFileExtension:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  CFStringRef PreferredIdentifierForTag = 0;
  CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], (CFStringRef)location[0], 0);
  id v6 = 0;
  if (PreferredIdentifierForTag)
  {
    obj = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x263F01918]);
    CFRelease(PreferredIdentifierForTag);
    if (obj)
    {
      objc_storeStrong(&v6, obj);
      CFRelease(obj);
    }
  }
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)setCookie:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(MCLURLDataLoader *)v5 cookieStorage];
  [(NSHTTPCookieStorage *)v3 setCookie:location[0]];

  objc_storeStrong(location, 0);
}

- (id)findCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  BOOL v20 = a5;
  v19 = 0;
  if ([v21 length])
  {
    v13 = NSURL;
    if (v20) {
      id v5 = @"https";
    }
    else {
      id v5 = @"http";
    }
    id v14 = (id)[NSString stringWithFormat:@"%@://%@", v5, v21];
    id v18 = (id)objc_msgSend(v13, "URLWithString:");

    id v15 = [(MCLURLDataLoader *)v23 cookieStorage];
    id v6 = [(NSHTTPCookieStorage *)v15 cookiesForURL:v18];
    id v7 = v19;
    v19 = v6;

    objc_storeStrong(&v18, 0);
  }
  else
  {
    time_t v12 = [(MCLURLDataLoader *)v23 cookieStorage];
    v8 = [(NSHTTPCookieStorage *)v12 cookies];
    tm v9 = v19;
    v19 = v8;
  }
  id v11 = -[MCLURLDataLoader findCookie:inDomain:secure:cookies:](v23, "findCookie:inDomain:secure:cookies:", location[0]);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)findCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5 cookies:(id)a6
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  BOOL v31 = a5;
  id v30 = 0;
  objc_storeStrong(&v30, a6);
  uint64_t v23 = 0;
  v24 = &v23;
  int v25 = 838860800;
  int v26 = 48;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  id v22 = (id)[MEMORY[0x263EFF910] date];
  id v11 = v34;
  id v8 = location[0];
  BOOL v9 = v31;
  id v10 = v30;
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = __63__MCLURLDataLoader_Cookie__findCookie_inDomain_secure_cookies___block_invoke;
  v19 = &unk_26485AF28;
  id v20 = v32;
  v21[0] = v22;
  v21[1] = &v23;
  [(MCLURLDataLoader *)v11 enumerateCookies:v8 secure:v9 cookies:v10 withBlock:&v15];
  id v7 = (id)v24[5];
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __63__MCLURLDataLoader_Cookie__findCookie_inDomain_secure_cookies___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v10 = 0;
  LOBYTE(v7) = 0;
  if (a1[4])
  {
    id v11 = (id)[location[0] domain];
    char v10 = 1;
    int v7 = [v11 isEqualToString:a1[4]] ^ 1;
  }
  if (v10) {

  }
  if ((v7 & 1) == 0)
  {
    id v3 = (id)[location[0] expiresDate];
    char v8 = 0;
    BOOL v4 = 1;
    if (v3)
    {
      id v9 = (id)[location[0] expiresDate];
      char v8 = 1;
      BOOL v4 = [v9 compare:a1[5]] != -1;
    }
    if (v8) {

    }
    if (v4)
    {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), location[0]);
      *a3 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

- (id)findMatchingCookies:(id)a3 inDomain:(id)a4 secure:(BOOL)a5
{
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  BOOL v36 = a5;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v34 = 0;
  char v30 = 0;
  if ([location[0] length])
  {
    id v32 = v34;
    id v12 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:location[0] options:0 error:&v32];
    objc_storeStrong(&v34, v32);
    id v31 = v12;
    char v30 = 1;
    id v5 = v12;
  }
  else
  {
    id v5 = 0;
  }
  id v33 = v5;
  if (v30) {

  }
  if (v34)
  {
    NSLog(&cfstr_UnableToProces.isa, location[0], v34);
    id v40 = v35;
    int v29 = 1;
  }
  else
  {
    char v25 = 0;
    if ([v37 length])
    {
      id v27 = v34;
      id v11 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:v37 options:0 error:&v27];
      objc_storeStrong(&v34, v27);
      id v26 = v11;
      char v25 = 1;
      id v6 = v11;
    }
    else
    {
      id v6 = 0;
    }
    id v28 = v6;
    if (v25) {

    }
    if (v34)
    {
      NSLog(&cfstr_UnableToProces.isa, v37, v34);
      id v40 = v35;
      int v29 = 1;
    }
    else
    {
      id v24 = (id)[MEMORY[0x263EFF910] date];
      char v10 = [(MCLURLDataLoader *)v39 cookieStorage];
      id v9 = [(NSHTTPCookieStorage *)v10 cookies];
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      id v18 = __64__MCLURLDataLoader_Cookie__findMatchingCookies_inDomain_secure___block_invoke;
      v19 = &unk_26485AF50;
      id v20 = v33;
      id v21 = v28;
      id v22 = v24;
      id v23 = v35;
      [(NSArray *)v9 enumerateObjectsUsingBlock:&v15];

      id v40 = v35;
      int v29 = 1;
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  int v7 = v40;
  return v7;
}

void __64__MCLURLDataLoader_Cookie__findMatchingCookies_inDomain_secure___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v21[3] = a3;
  v21[2] = a4;
  v21[1] = (id)a1;
  uint64_t v15 = *(void **)(a1 + 32);
  id v17 = (id)[location[0] name];
  id v16 = (id)[location[0] name];
  BOOL v4 = (void *)[v16 length];
  location[7] = 0;
  location[6] = v4;
  location[8] = 0;
  location[9] = v4;
  v21[0] = (id)objc_msgSend(v15, "firstMatchInString:options:range:", v17, 0, 0, v4);

  if (!*(void *)(a1 + 32) || v21[0] && [v21[0] range] != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v10 = *(void **)(a1 + 40);
    id v12 = (id)[location[0] domain];
    id v11 = (id)[location[0] domain];
    id v5 = (void *)[v11 length];
    id location[3] = 0;
    id location[2] = v5;
    location[4] = 0;
    location[5] = v5;
    id v6 = (id)objc_msgSend(v10, "firstMatchInString:options:range:", v12, 0, 0, v5);
    id v7 = v21[0];
    v21[0] = v6;

    if (!*(void *)(a1 + 40) || v21[0] && [v21[0] range] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = (id)[location[0] expiresDate];
      char v19 = 0;
      BOOL v9 = 1;
      if (v8)
      {
        id v20 = (id)[location[0] expiresDate];
        char v19 = 1;
        BOOL v9 = [v20 compare:*(void *)(a1 + 48)] != -1;
      }
      if (v19) {

      }
      if (v9) {
        [*(id *)(a1 + 56) addObject:location[0]];
      }
    }
  }
  objc_storeStrong(v21, 0);
  objc_storeStrong(location, 0);
}

- (id)allCookies
{
  id v3 = [(MCLURLDataLoader *)self cookieStorage];
  BOOL v4 = [(NSHTTPCookieStorage *)v3 cookies];

  return v4;
}

- (BOOL)deleteCookie:(id)a3 inDomain:(id)a4 secure:(BOOL)a5
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  BOOL v25 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  int v22 = 0x20000000;
  int v23 = 32;
  char v24 = 0;
  id v19 = [(MCLURLDataLoader *)v28 cookieStorage];
  char v10 = v28;
  id v7 = location[0];
  id v8 = v26;
  BOOL v9 = v25;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = __57__MCLURLDataLoader_Cookie__deleteCookie_inDomain_secure___block_invoke;
  id v17 = &unk_26485AF78;
  v18[0] = v19;
  v18[1] = &v20;
  [(MCLURLDataLoader *)v10 enumerateCookies:v7 inDomain:v8 secure:v9 withBlock:&v13];
  char v6 = *((unsigned char *)v21 + 24);
  objc_storeStrong(v18, 0);
  objc_storeStrong(&v19, 0);
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

void __57__MCLURLDataLoader_Cookie__deleteCookie_inDomain_secure___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) deleteCookie:location[0]];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong(location, 0);
}

- (void)deleteCookiesMatchingPredicate:(id)a3
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = [(MCLURLDataLoader *)v13 cookieStorage];
  id v3 = [(NSHTTPCookieStorage *)v11 cookies];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __59__MCLURLDataLoader_Cookie__deleteCookiesMatchingPredicate___block_invoke;
  id v8 = &unk_26485AFA0;
  id v9 = location[0];
  char v10 = v11;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:");

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __59__MCLURLDataLoader_Cookie__deleteCookiesMatchingPredicate___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([a1[4] evaluateWithObject:location[0]]) {
    [a1[5] deleteCookie:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)enumerateCookies:(id)a3 inDomain:(id)a4 secure:(BOOL)a5 withBlock:(id)a6
{
  char v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  BOOL v21 = a5;
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  if ([v22 length])
  {
    id v12 = NSURL;
    if (v21) {
      int v6 = @"https";
    }
    else {
      int v6 = @"http";
    }
    id v13 = (id)[NSString stringWithFormat:@"%@://%@", v6, v22];
    id v18 = (id)objc_msgSend(v12, "URLWithString:");

    int v14 = [(MCLURLDataLoader *)v24 cookieStorage];
    id v7 = [(NSHTTPCookieStorage *)v14 cookiesForURL:v18];
    id v8 = v19;
    id v19 = v7;

    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v11 = [(MCLURLDataLoader *)v24 cookieStorage];
    id v9 = [(NSHTTPCookieStorage *)v11 cookies];
    char v10 = v19;
    id v19 = v9;
  }
  [(MCLURLDataLoader *)v24 enumerateCookies:location[0] secure:v21 cookies:v19 withBlock:v20];
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)enumerateCookies:(id)a3 secure:(BOOL)a4 cookies:(id)a5 withBlock:(id)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  id v9 = v14;
  id v10 = location[0];
  BOOL v12 = v15;
  id v11 = v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __70__MCLURLDataLoader_Cookie__enumerateCookies_secure_cookies_withBlock___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v5 = 0;
  if (!*(void *)(a1 + 32)
    || (id v6 = (id)[location[0] name],
        char v5 = 1,
        BOOL v3 = 0,
        ([v6 isEqualToString:*(void *)(a1 + 32)] & 1) != 0))
  {
    BOOL v2 = 1;
    if (*(unsigned char *)(a1 + 48)) {
      BOOL v2 = ([location[0] isSecure] & 1) == (*(unsigned char *)(a1 + 48) & 1);
    }
    BOOL v3 = v2;
  }
  if (v5) {

  }
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(location, 0);
}

- (id)cookiesForURL:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = [(MCLURLDataLoader *)v7 cookieStorage];
  char v5 = [(NSHTTPCookieStorage *)v4 cookiesForURL:location[0]];

  objc_storeStrong(location, 0);
  return v5;
}

- (id)downloadImageFromURL:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v8 = v14;
  id v9 = (id)[MEMORY[0x263F08BD8] requestWithURL:location[0]];
  id v10 = -[MCLURLDataLoader downloadImageWithRequest:category:completionHandler:](v8, "downloadImageWithRequest:category:completionHandler:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)downloadImageWithRequest:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = 0;
  objc_storeStrong(&v44, a4);
  id v43 = 0;
  objc_storeStrong(&v43, a5);
  id v42 = (id)[location[0] URL];
  id v11 = [(MCLURLDataLoader *)v46 imagesDownloadDirectory];
  id v10 = +[MCLURLDataLoader uniqueImageKeyForURL:v42];
  id v41 = (id)objc_msgSend(v11, "stringByAppendingPathComponent:");

  v37[0] = 0;
  v37[1] = v37;
  int v38 = 0x20000000;
  int v39 = 32;
  char v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  int v34 = 0x20000000;
  int v35 = 32;
  char v36 = 0;
  id v14 = v46;
  id v12 = location[0];
  id v13 = v41;
  uint64_t v25 = MEMORY[0x263EF8330];
  int v26 = -1073741824;
  int v27 = 0;
  id v28 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke;
  int v29 = &unk_26485B040;
  v31[1] = v37;
  id v30 = v41;
  v31[2] = v33;
  v31[0] = v43;
  id v32 = [(MCLURLDataLoader *)v14 downloadRequest:v12 toPath:v13 category:@"low" completionHandler:&v25];
  queue = dispatch_get_global_queue(2, 0);
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_4;
  id v19 = &unk_26485B090;
  id v20 = v41;
  v24[1] = v37;
  v24[2] = v33;
  v24[0] = v43;
  BOOL v21 = v46;
  id v22 = v44;
  id v23 = v32;
  dispatch_async(queue, &v15);

  id v7 = v32;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(v31, 0);
  objc_storeStrong(&v30, 0);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v37, 8);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v24 = 0;
  objc_storeStrong(&v24, a3);
  v23[1] = (id)a1;
  if (v24 || ([location[0] responseOk] & 1) == 0)
  {
    BOOL v3 = MEMORY[0x263EF83A0];
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_3;
    id v11 = &unk_26485B018;
    v14[1] = *(id *)(a1 + 56);
    v14[0] = *(id *)(a1 + 40);
    id v12 = v24;
    id v13 = location[0];
    dispatch_async(v3, &v7);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(v14, 0);
  }
  else if (([location[0] cachedResponse] & 1) == 0 {
         || (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) & 1) == 0)
  }
  {
    v23[0] = UIImageWithContentsOfFile(*(void **)(a1 + 32), 1);
    queue = MEMORY[0x263EF83A0];
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    id v18 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_2;
    id v19 = &unk_26485B018;
    v22[1] = *(id *)(a1 + 56);
    v22[0] = *(id *)(a1 + 40);
    id v20 = v23[0];
    id v21 = location[0];
    dispatch_async(queue, &v15);

    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(v22, 0);
    objc_storeStrong(v23, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

uint64_t __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void))(a1[6] + 16))(a1[6], a1[4]);
}

uint64_t __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
}

void __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  char v14 = 0;
  id v4 = (id)[MEMORY[0x263F08850] defaultManager];
  char v5 = 0;
  if ([v4 fileExistsAtPath:*(void *)(a1 + 32) isDirectory:&v14]) {
    char v5 = v14 ^ 1;
  }

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    id v13 = UIImageWithContentsOfFile(*(void **)(a1 + 32), 0);
    if (v13)
    {
      queue = MEMORY[0x263EF83A0];
      uint64_t v6 = MEMORY[0x263EF8330];
      int v7 = -1073741824;
      int v8 = 0;
      int v9 = __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_5;
      id v10 = &unk_26485B068;
      v12[1] = *(id *)(a1 + 80);
      v12[0] = *(id *)(a1 + 64);
      id v11 = v13;
      dispatch_async(queue, &v6);

      objc_storeStrong(&v11, 0);
      objc_storeStrong(v12, 0);
    }
    else
    {
      id v1 = (id)[MEMORY[0x263F08850] defaultManager];
      [v1 removeItemAtPath:*(void *)(a1 + 32) error:0];
    }
    objc_storeStrong(&v13, 0);
  }
  else
  {
    [*(id *)(a1 + 40) setCategory:*(void *)(a1 + 48) forTask:*(void *)(a1 + 56)];
  }
}

uint64_t __79__MCLURLDataLoader_Image__downloadImageWithRequest_category_completionHandler___block_invoke_5(uint64_t result)
{
  if ((*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

- (id)imagesDownloadDirectory
{
  char v5 = (dispatch_once_t *)&imagesDownloadDirectory_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_11);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  BOOL v2 = (void *)imagesDownloadDirectory_imagesDownloadDirectory;
  return v2;
}

void __50__MCLURLDataLoader_Image__imagesDownloadDirectory__block_invoke()
{
  BOOL v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v2 = [(NSArray *)v3 objectAtIndex:0];
  id v0 = (id)[v2 stringByAppendingPathComponent:@"MCLURLDataLoaderImages"];
  id v1 = (void *)imagesDownloadDirectory_imagesDownloadDirectory;
  imagesDownloadDirectory_imagesDownloadDirectory = (uint64_t)v0;

  id v4 = +[MCLURLDataLoader shared];
  [v4 addCacheLocation:imagesDownloadDirectory_imagesDownloadDirectory];
}

+ (id)uniqueImageKeyForURL:(id)a3
{
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = (dispatch_once_t *)&uniqueImageKeyForURL__onceToken;
  id v23 = 0;
  objc_storeStrong(&v23, &__block_literal_global_6);
  if (*v24 != -1) {
    dispatch_once(v24, v23);
  }
  objc_storeStrong(&v23, 0);
  id v20 = (id)[v22 uniqueKeyForURL:location[0]];
  uint64_t v13 = 0;
  char v14 = (id *)&v13;
  int v15 = 838860800;
  int v16 = 48;
  int v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = (id)[v20 pathExtension];
  id v11 = (id)[v20 stringByDeletingPathExtension];
  id v3 = (id)[v11 stringByAppendingString:uniqueImageKeyForURL__screenScale];
  id v4 = v20;
  id v20 = v3;

  if (![v14[5] length])
  {
    objc_storeStrong(v14 + 5, @"image");
    id v10 = objc_alloc(MEMORY[0x263F08BA0]);
    id v12 = (id)[v10 initWithURL:location[0] resolvingAgainstBaseURL:0];
    id v9 = (id)[v12 queryItems];
    objc_msgSend(v9, "enumerateObjectsUsingBlock:");

    objc_storeStrong(&v12, 0);
  }
  if ([v14[5] length])
  {
    id v5 = (id)[v20 stringByAppendingPathExtension:v14[5]];
    id v6 = v20;
    id v20 = v5;
  }
  id v8 = v20;
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v8;
}

void __48__MCLURLDataLoader_Image__uniqueImageKeyForURL___block_invoke()
{
  id v1 = (id)[MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  unint64_t v2 = (unint64_t)v0;

  char v3 = 0;
  if (v2 <= 1)
  {
    objc_storeStrong((id *)&uniqueImageKeyForURL__screenScale, &stru_26DD585A8);
  }
  else
  {
    id v4 = (id)objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v2);
    char v3 = 1;
    objc_storeStrong((id *)&uniqueImageKeyForURL__screenScale, v4);
  }
  if (v3) {
}
  }

void __48__MCLURLDataLoader_Image__uniqueImageKeyForURL___block_invoke_19(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = (id)[location[0] value];
  char v9 = [v8 hasPrefix:@"png"];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), @"png");
    *a4 = 1;
  }
  else
  {
    id v4 = (id)[location[0] value];
    char v10 = 0;
    char v5 = 1;
    if (([v4 hasPrefix:@"jpeg"] & 1) == 0)
    {
      id v11 = (id)[location[0] value];
      char v10 = 1;
      char v5 = [v11 hasPrefix:@"jpg"];
    }
    if (v10) {

    }
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), @"jpeg");
      *a4 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

+ (void)addSessionConfigurator:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v7 = (dispatch_once_t *)&addSessionConfigurator__onceToken;
  id v6 = 0;
  objc_storeStrong(&v6, &__block_literal_global_12);
  if (*v7 != -1) {
    dispatch_once(v7, v6);
  }
  objc_storeStrong(&v6, 0);
  char v3 = (void *)_sessionConfigurators;
  id v4 = _Block_copy(location[0]);
  objc_msgSend(v3, "addObject:");

  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_addSessionConfigurator___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v1 = (void *)_sessionConfigurators;
  _sessionConfigurators = (uint64_t)v0;
}

+ (id)shared
{
  id v11 = a1;
  SEL v10 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __26__MCLURLDataLoader_shared__block_invoke;
  id v8 = &__block_descriptor_40_e5_v8__0l;
  id v9 = a1;
  uint64_t v13 = (dispatch_once_t *)&shared_onceToken_1;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  unint64_t v2 = (void *)shared;
  return v2;
}

uint64_t __26__MCLURLDataLoader_shared__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  unint64_t v2 = (void *)shared;
  shared = (uint64_t)v1;

  return [(id)shared configureSession];
}

- (MCLURLDataLoader)init
{
  v34[6] = *MEMORY[0x263EF8340];
  SEL v31 = a2;
  id v32 = 0;
  v30.receiver = self;
  v30.super_class = (Class)MCLURLDataLoader;
  id v32 = [(MCLURLDataLoader *)&v30 init];
  objc_storeStrong((id *)&v32, v32);
  if (v32)
  {
    v32->_backgroundTaskIdentifier = *MEMORY[0x263F833E0];
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:8];
    priorities = v32->_priorities;
    v32->_priorities = (NSMutableDictionary *)v2;

    id v22 = v32->_priorities;
    v33[0] = @"suspended";
    v34[0] = &unk_26DD5EEA8;
    v33[1] = @"lowest";
    v34[1] = &unk_26DD5EEC0;
    void v33[2] = @"low";
    v34[2] = &unk_26DD5EED8;
    v33[3] = @"normal";
    v34[3] = &unk_26DD5EEF0;
    v33[4] = @"high";
    v34[4] = &unk_26DD5EF08;
    v33[5] = @"highest";
    v34[5] = &unk_26DD5EF20;
    id v23 = (id)[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];
    -[NSMutableDictionary addEntriesFromDictionary:](v22, "addEntriesFromDictionary:");

    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:128];
    taskQueue = v32->_taskQueue;
    v32->_taskQueue = (NSMutableArray *)v4;

    int v6 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    taskQueueLock = v32->_taskQueueLock;
    v32->_taskQueueLock = v6;

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:");
    activeTasks = v32->_activeTasks;
    v32->_activeTasks = (NSMutableDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:20];
    sessionTasks = v32->_sessionTasks;
    v32->_sessionTasks = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:20];
    duplicateTasks = v32->_duplicateTasks;
    v32->_duplicateTasks = (NSMutableOrderedSet *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:4];
    rewriteRules = v32->_rewriteRules;
    v32->_rewriteRules = (NSMutableOrderedSet *)v14;

    int v26 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    id v25 = [(NSArray *)v26 objectAtIndex:0];
    id v24 = (id)[(id)objc_opt_class() description];
    int v16 = (NSString *)(id)objc_msgSend(v25, "stringByAppendingPathComponent:");
    downloadCacheDirectory = v32->_downloadCacheDirectory;
    v32->_downloadCacheDirectory = v16;

    id v18 = (NSHTTPCookieStorage *)(id)[MEMORY[0x263F08890] sharedHTTPCookieStorage];
    cookieStorage = v32->_cookieStorage;
    v32->_cookieStorage = v18;

    [(MCLURLDataLoader *)v32 setupCache:0];
    id v27 = (id)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v27, "addObserver:selector:name:object:", v32, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x263F83330]);

    id v28 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v32 selector:sel_applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F833B8] object:0];

    id v29 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v32 selector:sel_applicationDidBecomeActiveNotification_ name:*MEMORY[0x263F83318] object:0];
  }
  id v21 = v32;
  objc_storeStrong((id *)&v32, 0);
  return v21;
}

- (void)dispose
{
  uint64_t v4 = self;
  v3[1] = (id)a2;
  v3[0] = self->_session;
  objc_storeStrong((id *)&v4->_session, 0);
  [v3[0] invalidateAndCancel];
  uint64_t v2 = v4->_operationQueue;
  objc_storeStrong((id *)&v4->_operationQueue, 0);
  [(NSOperationQueue *)v2 cancelAllOperations];
  [MEMORY[0x263F08B88] sleepForTimeInterval:0.01];
  [(NSRecursiveLock *)v4->_taskQueueLock lock];
  [(NSMutableArray *)v4->_taskQueue removeAllObjects];
  [(NSMutableDictionary *)v4->_activeTasks removeAllObjects];
  [(NSMutableArray *)v4->_sessionTasks removeAllObjects];
  [(NSMutableOrderedSet *)v4->_duplicateTasks removeAllObjects];
  [(NSRecursiveLock *)v4->_taskQueueLock unlock];
  [(NSOperationQueue *)v2 waitUntilAllOperationsAreFinished];
  objc_storeStrong((id *)&v4->_cache, 0);
  objc_storeStrong((id *)&v2, 0);
  objc_storeStrong(v3, 0);
}

- (NSURLCache)cache
{
  id v22 = self;
  SEL v21 = a2;
  if (!self->_cache)
  {
    id v11 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v12 = [v11 integerForKey:@"MCLURLDataLoader.cacheVersion"];

    uint64_t v20 = v12;
    if (!v12)
    {
      id v9 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
      [v9 setInteger:0 forKey:@"MCLURLDataLoader.cacheVersion"];

      id v10 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
      [v10 synchronize];
    }
    id v19 = (id)[(id)objc_opt_class() description];
    uint64_t v2 = (NSString *)(id)[NSString stringWithFormat:@"%@%ld", v19, v20];
    cachePath = v22->_cachePath;
    v22->_cachePath = v2;

    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = __25__MCLURLDataLoader_cache__block_invoke;
    int v17 = &unk_26485A9F0;
    id v18 = v22;
    id v24 = (dispatch_once_t *)&cache_onceToken;
    id location = 0;
    objc_storeStrong(&location, &v13);
    if (*v24 != -1) {
      dispatch_once(v24, location);
    }
    objc_storeStrong(&location, 0);
    id v4 = objc_alloc(MEMORY[0x263F08B98]);
    uint64_t v5 = [v4 initWithMemoryCapacity:0 diskCapacity:1000000000 diskPath:v22->_cachePath];
    cache = v22->_cache;
    v22->_cache = (NSURLCache *)v5;

    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  int v7 = v22->_cache;
  return v7;
}

uint64_t __25__MCLURLDataLoader_cache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearOldCaches:", *(void *)(*(void *)(a1 + 32) + 8), a1, a1);
}

- (void)setupCache:(BOOL)a3
{
  int v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id v14 = (id)[MEMORY[0x263F08850] defaultManager];
  id v13 = 0;
  downloadCacheDirectory = v17->_downloadCacheDirectory;
  id v12 = 0;
  char v5 = [v14 createDirectoryAtPath:downloadCacheDirectory withIntermediateDirectories:1 attributes:0 error:&v12];
  objc_storeStrong(&v13, v12);
  if ((v5 & 1) == 0) {
    NSLog(&cfstr_ErrorCreatingD.isa, v13);
  }
  if (v15)
  {
    id v4 = [(MCLURLDataLoader *)v17 cacheLocations];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __31__MCLURLDataLoader_setupCache___block_invoke;
    id v10 = &unk_26485A788;
    id v11 = v14;
    [(NSSet *)v4 enumerateObjectsUsingBlock:&v6];

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
}

void __31__MCLURLDataLoader_setupCache___block_invoke(void *a1, void *a2, uint64_t a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v14 = a3;
  id v13 = a1;
  int v7 = (void *)a1[4];
  id v8 = (id)[location[0] stringByDeletingLastPathComponent];
  char v9 = objc_msgSend(v7, "isWritableFileAtPath:");

  if (v9)
  {
    id v11 = 0;
    char v3 = (void *)a1[4];
    id v10 = 0;
    char v4 = [v3 createDirectoryAtPath:location[0] withIntermediateDirectories:1 attributes:0 error:&v10];
    objc_storeStrong(&v11, v10);
    if ((v4 & 1) == 0) {
      NSLog(&cfstr_ErrorCreatingC.isa, v11);
    }
    objc_storeStrong(&v11, 0);
    int v12 = 0;
  }
  else
  {
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)clearOldCaches:(id)a3
{
  BOOL v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = [v3 beginBackgroundTaskWithName:@"Clear Cache" expirationHandler:0];

  id v13 = (void *)v4;
  queue = dispatch_get_global_queue(2, 0);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = __35__MCLURLDataLoader_clearOldCaches___block_invoke;
  id v10 = &unk_26485B138;
  id v11 = v15;
  v12[0] = location[0];
  v12[1] = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __35__MCLURLDataLoader_clearOldCaches___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) backgroundClearOldCaches:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48) != *MEMORY[0x263F833E0])
  {
    id v1 = (id)[MEMORY[0x263F82438] sharedApplication];
    [v1 endBackgroundTask:*(void *)(a1 + 48)];
  }
}

- (void)backgroundClearOldCaches:(id)a3
{
  SEL v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v6 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v5 = [(NSArray *)v6 objectAtIndex:0];
  id v4 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v3 = (id)[v4 bundleIdentifier];
  id v29 = (id)objc_msgSend(v5, "stringByAppendingPathComponent:");

  id v28 = (id)[(id)objc_opt_class() description];
  id v27 = (id)[MEMORY[0x263F08850] defaultManager];
  id v7 = (id)[v27 contentsOfDirectoryAtPath:v29 error:0];
  v18[1] = (id)MEMORY[0x263EF8330];
  int v19 = -1073741824;
  int v20 = 0;
  SEL v21 = __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke;
  id v22 = &unk_26485B160;
  id v23 = location[0];
  id v24 = v28;
  id v25 = v29;
  id v26 = v27;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:");

  v18[0] = (id)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-604800.0];
  id v17 = (id)[v29 stringByAppendingPathComponent:location[0]];
  [(id)objc_opt_class() removeFilesOlderThan:v18[0] inDirectory:v17];
  int v8 = [(MCLURLDataLoader *)v31 cacheLocations];
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  int v12 = __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke_2;
  id v13 = &unk_26485B188;
  id v14 = v27;
  BOOL v15 = v31;
  id v16 = v18[0];
  -[NSSet enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

void __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[3] = a3;
  v11[2] = a4;
  v11[1] = (id)a1;
  if (([*(id *)(a1 + 32) isEqualToString:location[0]] & 1) == 0
    && ([location[0] hasPrefix:*(void *)(a1 + 40)] & 1) != 0)
  {
    v11[0] = 0;
    id v10 = (id)[*(id *)(a1 + 48) stringByAppendingPathComponent:location[0]];
    id v4 = *(void **)(a1 + 56);
    id obj = v11[0];
    char v5 = [v4 removeItemAtPath:v10 error:&obj];
    objc_storeStrong(v11, obj);
    if ((v5 & 1) == 0) {
      NSLog(&cfstr_ErrorDeletingC.isa, v11[0]);
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
  objc_storeStrong(location, 0);
}

void __45__MCLURLDataLoader_backgroundClearOldCaches___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([*(id *)(a1 + 32) isDeletableFileAtPath:location[0]]) {
    [(id)objc_opt_class() removeFilesOlderThan:*(void *)(a1 + 48) inDirectory:location[0]];
  }
  objc_storeStrong(location, 0);
}

+ (void)removeFilesOlderThan:(id)a3 inDirectory:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = (id)[MEMORY[0x263F08850] defaultManager];
  id v5 = (id)[v14 contentsOfDirectoryAtPath:v15 error:0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __53__MCLURLDataLoader_removeFilesOlderThan_inDirectory___block_invoke;
  id v10 = &unk_26485B1B0;
  id v11 = v15;
  id v12 = v14;
  id v13 = location[0];
  objc_msgSend(v5, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __53__MCLURLDataLoader_removeFilesOlderThan_inDirectory___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[3] = a3;
  id v14[2] = a4;
  v14[1] = (id)a1;
  v14[0] = (id)[*(id *)(a1 + 32) stringByAppendingPathComponent:location[0]];
  id v13 = (id)[*(id *)(a1 + 40) attributesOfItemAtPath:v14[0] error:0];
  id v9 = (id)[v13 fileModificationDate];
  LOBYTE(v10) = 0;
  if ([v9 compare:*(void *)(a1 + 48)] == -1) {
    int v10 = [location[0] hasPrefix:@"Cache.db"] ^ 1;
  }

  if (v10)
  {
    id v12 = 0;
    id v4 = *(void **)(a1 + 40);
    id v11 = 0;
    char v5 = [v4 removeItemAtPath:v14[0] error:&v11];
    objc_storeStrong(&v12, v11);
    if ((v5 & 1) == 0) {
      NSLog(&cfstr_ErrorDeletingC_0.isa, v12);
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (void)clearCache
{
  id v24 = self;
  v23[1] = (id)a2;
  id v6 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"MCLURLDataLoaderWillClearCache" object:v24];

  v23[0] = v24->_cache;
  [(MCLURLDataLoader *)v24 dispose];
  id v7 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v8 = objc_msgSend(v7, "integerForKey:");

  id v9 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
  v22[1] = (id)(v8 + 1);
  objc_msgSend(v9, "setInteger:forKey:");

  id v10 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
  [v10 synchronize];

  [v23[0] removeAllCachedResponses];
  v22[0] = (id)[MEMORY[0x263F08850] defaultManager];
  id v21 = 0;
  id v20 = [(NSString *)v24->_downloadCacheDirectory stringByAppendingPathExtension:@"0"];
  downloadCacheDirectory = v24->_downloadCacheDirectory;
  id v19 = v21;
  char v11 = [v22[0] moveItemAtPath:downloadCacheDirectory toPath:v20 error:&v19];
  objc_storeStrong(&v21, v19);
  if ((v11 & 1) == 0
    || (id v18 = v21,
        char v5 = [v22[0] removeItemAtPath:v20 error:&v18],
        objc_storeStrong(&v21, v18),
        (v5 & 1) == 0))
  {
    NSLog(&cfstr_ErrorDeletingD.isa, v21);
  }
  id v3 = [(MCLURLDataLoader *)v24 cacheLocations];
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __30__MCLURLDataLoader_clearCache__block_invoke;
  id v16 = &unk_26485A788;
  id v17 = v22[0];
  [(NSSet *)v3 enumerateObjectsUsingBlock:&v12];

  [(MCLURLDataLoader *)v24 setupCache:1];
  [(MCLURLDataLoader *)v24 configureSession];
  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"MCLURLDataLoaderDidClearCache" object:v24];

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong(v23, 0);
}

void __30__MCLURLDataLoader_clearCache__block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v18[2] = a3;
  v18[1] = a1;
  v18[0] = 0;
  id v17 = (id)[location[0] stringByAppendingPathExtension:@"0"];
  if ([a1[4] fileExistsAtPath:location[0]])
  {
    id v3 = a1[4];
    id v15 = v18[0];
    char v5 = [v3 moveItemAtPath:location[0] toPath:v17 error:&v15];
    objc_storeStrong(v18, v15);
    if (v5)
    {
      queue = dispatch_get_global_queue(-32768, 0);
      uint64_t v8 = MEMORY[0x263EF8330];
      int v9 = -1073741824;
      int v10 = 0;
      char v11 = __30__MCLURLDataLoader_clearCache__block_invoke_2;
      uint64_t v12 = &unk_26485AA40;
      id v13 = a1[4];
      id v14 = v17;
      dispatch_async(queue, &v8);

      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      NSLog(&cfstr_ErrorMovingCac.isa, v18[0]);
    }
    int v16 = 0;
  }
  else
  {
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  if (!v16) {
    int v16 = 0;
  }
  objc_storeStrong(location, 0);
}

void __30__MCLURLDataLoader_clearCache__block_invoke_2(void *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  v6[0] = 0;
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  char v4 = [v2 removeItemAtPath:v3 error:&obj];
  objc_storeStrong(v6, obj);
  if ((v4 & 1) == 0) {
    NSLog(&cfstr_ErrorDeletingC_1.isa, v6[0]);
  }
  objc_storeStrong(v6, 0);
}

- (void)removeCachedResponseForRequest:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = (id)[location[0] mutableCopy];
  [(id)objc_opt_class() applyDefaultRequestHeaders:v12];
  [(MCLURLDataLoader *)v14 processURLRequestRewrite:v12];
  objc_initWeak(&v11, v14);
  operationQueue = v14->_operationQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __51__MCLURLDataLoader_removeCachedResponseForRequest___block_invoke;
  uint64_t v8 = &unk_26485B1D8;
  objc_copyWeak(&v10, &v11);
  id v9 = v12;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:&v4];
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __51__MCLURLDataLoader_removeCachedResponseForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained backgroundRemoveCachedResponseForRequest:*(void *)(a1 + 32)];
}

- (void)backgroundRemoveCachedResponseForRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(MCLURLDataLoader *)v28 _removeCachedResponseForRequest:location[0] force:1];
  downloadCacheDirectory = v28->_downloadCacheDirectory;
  id v19 = (id)[location[0] URL];
  id v18 = +[MCLURLDataLoader uniqueKeyForURL:](MCLURLDataLoader, "uniqueKeyForURL:");
  id v26 = -[NSString stringByAppendingPathComponent:](downloadCacheDirectory, "stringByAppendingPathComponent:");

  id v25 = (id)[MEMORY[0x263F08850] defaultManager];
  id v20 = (id)[v26 pathExtension];
  BOOL v21 = [v20 length] != 0;

  if (v21)
  {
    [v25 removeItemAtPath:v26 error:0];
  }
  else
  {
    id v24 = (id)[v26 lastPathComponent];
    memset(__b, 0, sizeof(__b));
    id v13 = v25;
    id v14 = (id)[v26 stringByDeletingLastPathComponent];
    id obj = (id)objc_msgSend(v13, "enumeratorAtPath:");

    uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
    if (v16)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v16;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(id *)(__b[1] + 8 * v11);
        id v7 = (id)[v23 stringByDeletingPathExtension];
        char v8 = [v7 isEqualToString:v24];

        if (v8)
        {
          id v4 = v25;
          id v3 = v26;
          id v6 = (id)[v23 pathExtension];
          id v5 = (id)objc_msgSend(v3, "stringByAppendingPathExtension:");
          objc_msgSend(v4, "removeItemAtPath:error:");
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)flushCache
{
}

- (void)addCacheLocation:(id)a3
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  id v9 = (id)[MEMORY[0x263F08850] defaultManager];
  id v19 = v20;
  char v10 = [v9 createDirectoryAtPath:location[0] withIntermediateDirectories:1 attributes:0 error:&v19];
  objc_storeStrong(&v20, v19);

  if ((v10 & 1) == 0) {
    NSLog(&cfstr_ErrorCreatingC.isa, v20);
  }
  id v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [(NSArray *)v4 firstObject];
  id v18 = (id)[v3 stringByDeletingLastPathComponent];

  id v6 = [(MCLURLDataLoader *)v22 cacheLocations];
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = __37__MCLURLDataLoader_addCacheLocation___block_invoke;
  id v15 = &unk_26485B200;
  id v16 = v18;
  id v5 = [(NSSet *)v6 objectsPassingTest:&v11];
  id v17 = (id)[(NSSet *)v5 mutableCopy];

  [v17 addObject:location[0]];
  id v8 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
  id v7 = (id)[v17 allObjects];
  objc_msgSend(v8, "setObject:forKey:");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

uint64_t __37__MCLURLDataLoader_addCacheLocation___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v4 = [location[0] hasPrefix:a1[4]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (NSArray)rewriteRules
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_rewriteRules array];
}

- (void)addRewriteRule:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(NSMutableOrderedSet *)v4->_rewriteRules addObject:location[0]];
  [(NSMutableOrderedSet *)v4->_rewriteRules sortWithOptions:16 usingComparator:&__block_literal_global_104];
  objc_storeStrong(location, 0);
}

uint64_t __35__MCLURLDataLoader_addRewriteRule___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  [location[0] priority];
  float v7 = v3;
  [v8 priority];
  if ((float)(v7 - v4) == 0.0)
  {
    uint64_t v10 = 0;
  }
  else if ((float)(v7 - v4) <= 0.0)
  {
    uint64_t v10 = -1;
  }
  else
  {
    uint64_t v10 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)removeRewriteRule:(id)a3
{
  float v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(NSMutableOrderedSet *)v4->_rewriteRules removeObject:location[0]];
  objc_storeStrong(location, 0);
}

- (void)removeRewriteRulesWithName:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  rewriteRules = v12->_rewriteRules;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  float v7 = __47__MCLURLDataLoader_removeRewriteRulesWithName___block_invoke;
  id v8 = &unk_26485B248;
  id v9 = location[0];
  id v10 = (id)-[NSMutableOrderedSet indexesOfObjectsPassingTest:](rewriteRules, "indexesOfObjectsPassingTest:");
  [(NSMutableOrderedSet *)v12->_rewriteRules removeObjectsAtIndexes:v10];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __47__MCLURLDataLoader_removeRewriteRulesWithName___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] name];
  char v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)removeRewriteRules:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(NSMutableOrderedSet *)v4->_rewriteRules removeObjectsInArray:location[0]];
  objc_storeStrong(location, 0);
}

- (void)removeAllRewriteRules
{
}

- (void)applyRewriteRules:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(MCLURLDataLoader *)v4 processURLRequestRewrite:location[0]];
  objc_storeStrong(location, 0);
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v15->_backgroundTaskIdentifier == *MEMORY[0x263F833E0])
  {
    BOOL v13 = 0;
    [(NSRecursiveLock *)v15->_taskQueueLock lock];
    uint64_t v6 = [(NSMutableDictionary *)v15->_activeTasks count];
    BOOL v13 = v6 + [(NSMutableArray *)v15->_taskQueue count] != 0;
    [(NSRecursiveLock *)v15->_taskQueueLock unlock];
    if (v13)
    {
      id v5 = (id)[MEMORY[0x263F82438] sharedApplication];
      id v4 = (id)[(id)objc_opt_class() description];
      uint64_t v7 = MEMORY[0x263EF8330];
      int v8 = -1073741824;
      int v9 = 0;
      id v10 = __62__MCLURLDataLoader_applicationDidEnterBackgroundNotification___block_invoke;
      uint64_t v11 = &unk_26485A9F0;
      int v12 = v15;
      uint64_t v3 = [v5 beginBackgroundTaskWithName:v4 expirationHandler:&v7];
      v15->_backgroundTaskIdentifier = v3;

      objc_storeStrong((id *)&v12, 0);
    }
    if (v15->_backgroundTaskIdentifier == *MEMORY[0x263F833E0]) {
      [(MCLURLDataLoader *)v15 suspend];
    }
  }
  objc_storeStrong(location, 0);
}

uint64_t __62__MCLURLDataLoader_applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suspend", a1, a1);
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(MCLURLDataLoader *)v4 notifyBackgroundStopped];
  v4->_resuming = 1;
  [(MCLURLDataLoader *)v4 resume];
  objc_storeStrong(location, 0);
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_resuming = 0;
  [(MCLURLDataLoader *)v4 resume];
  objc_storeStrong(location, 0);
}

- (void)suspend
{
  id v10 = self;
  location[1] = (id)a2;
  if (!self->_suspended)
  {
    v10->_suspended = 1;
    objc_initWeak(location, v10);
    operationQueue = v10->_operationQueue;
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __27__MCLURLDataLoader_suspend__block_invoke;
    uint64_t v7 = &unk_26485AC20;
    objc_copyWeak(&v8, location);
    [(NSOperationQueue *)operationQueue addOperationWithBlock:&v3];
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __27__MCLURLDataLoader_suspend__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained operationSuspendSession];
}

- (void)resume
{
  id v10 = self;
  location[1] = (id)a2;
  if (self->_suspended)
  {
    objc_initWeak(location, v10);
    operationQueue = v10->_operationQueue;
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __26__MCLURLDataLoader_resume__block_invoke;
    uint64_t v7 = &unk_26485AC20;
    objc_copyWeak(&v8, location);
    [(NSOperationQueue *)operationQueue addOperationWithBlock:&v3];
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
}

void __26__MCLURLDataLoader_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained operationResumeSession];
}

+ (void)restart:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(id)shared internalRestart:location[0]];
  objc_storeStrong(location, 0);
}

- (void)internalRestart:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)[MEMORY[0x263F08A48] currentQueue];
  v15->_suspended = 1;
  objc_initWeak(&v12, v15);
  operationQueue = v15->_operationQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __36__MCLURLDataLoader_internalRestart___block_invoke;
  id v8 = &unk_26485B270;
  objc_copyWeak(&v11, &v12);
  id v9 = v13;
  id v10 = location[0];
  [(NSOperationQueue *)operationQueue addOperationWithBlock:&v4];
  [(NSOperationQueue *)v15->_operationQueue waitUntilAllOperationsAreFinished];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v12);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

uint64_t __36__MCLURLDataLoader_internalRestart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained operationRestartSession];

  return [*(id *)(a1 + 32) addOperationWithBlock:*(void *)(a1 + 40)];
}

- (void)notifyBackgroundStopped
{
  if (self->_backgroundTaskIdentifier != *MEMORY[0x263F833E0])
  {
    id v2 = (id)[MEMORY[0x263F82438] sharedApplication];
    [v2 endBackgroundTask:self->_backgroundTaskIdentifier];

    self->_backgroundTaskIdentifier = *MEMORY[0x263F833E0];
  }
}

- (void)notifyEmptyQueue
{
  if (!self->_resuming)
  {
    id v2 = (id)[MEMORY[0x263F82438] sharedApplication];
    BOOL v3 = [v2 applicationState] != 2;

    if (!v3) {
      [(MCLURLDataLoader *)self suspend];
    }
  }
}

- (void)notifyEnqueue
{
  id v3 = (id)[MEMORY[0x263F82438] sharedApplication];
  char v5 = 0;
  BOOL v4 = 0;
  if ([v3 applicationState] == 2)
  {
    id v6 = (id)[MEMORY[0x263F82438] sharedApplication];
    char v5 = 1;
    [v6 backgroundTimeRemaining];
    BOOL v4 = v2 > 5.0;
  }
  if (v5) {

  }
  if (v4) {
    [(MCLURLDataLoader *)self resume];
  }
}

- (int64_t)priorityForCategory:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(NSMutableDictionary *)v7->_priorities objectForKeyedSubscript:location[0]];
  int64_t v5 = [v4 integerValue];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)setPriority:(int64_t)a3 forCategory:(id)a4
{
  id v28 = self;
  SEL v27 = a2;
  int64_t v26 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  uint64_t v24 = 0;
  id v8 = (id)[(NSMutableDictionary *)v28->_priorities objectForKeyedSubscript:location];
  uint64_t v9 = [v8 integerValue];

  uint64_t v24 = v9;
  if (v9 != v26)
  {
    id v4 = (id)[NSNumber numberWithInteger:v26];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28->_priorities, "setObject:forKeyedSubscript:");

    [(NSRecursiveLock *)v28->_taskQueueLock lock];
    id v5 = objc_alloc(MEMORY[0x263EFF980]);
    id v23 = (id)objc_msgSend(v5, "initWithCapacity:", -[NSMutableArray count](v28->_taskQueue, "count"));
    taskQueue = v28->_taskQueue;
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    id v19 = __44__MCLURLDataLoader_setPriority_forCategory___block_invoke;
    id v20 = &unk_26485B298;
    id v21 = location;
    id v22 = v23;
    [(NSMutableArray *)taskQueue enumerateObjectsUsingBlock:&v16];
    [(NSRecursiveLock *)v28->_taskQueueLock unlock];
    id v7 = v23;
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __44__MCLURLDataLoader_setPriority_forCategory___block_invoke_2;
    id v14 = &unk_26485B2C0;
    id v15 = v28;
    [v7 enumerateObjectsUsingBlock:&v10];
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&location, 0);
}

void __44__MCLURLDataLoader_setPriority_forCategory___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] category];
  char v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

void __44__MCLURLDataLoader_setPriority_forCategory___block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] enqueueTask:location[0] reschedule:1];
  objc_storeStrong(location, 0);
}

- (id)loadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v8 = [(MCLURLDataLoader *)v12 loadRequest:location[0] category:v10 completionHandler:v9 receiveData:0];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)loadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5 receiveData:(id)a6
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  if (v16) {
    id v9 = (__CFString *)v16;
  }
  else {
    id v9 = &stru_26DD585A8;
  }
  objc_storeStrong(&v16, v9);
  id v6 = [MCLURLDataLoaderTask alloc];
  id v13 = -[MCLURLDataLoaderTask initWithURLRequest:targetPath:category:completionHandler:receiveData:](v6, "initWithURLRequest:targetPath:category:completionHandler:receiveData:", location[0]);
  [(MCLURLDataLoader *)v18 enqueueTask:v13 reschedule:0];
  id v8 = v13;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)loadURL:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v8 = v14;
  id v9 = (id)[MEMORY[0x263F08BD8] requestWithURL:location[0]];
  id v10 = -[MCLURLDataLoader loadRequest:category:completionHandler:](v8, "loadRequest:category:completionHandler:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)downloadRequest:(id)a3 toPath:(id)a4 category:(id)a5 completionHandler:(id)a6
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  if (v15) {
    id v9 = (__CFString *)v15;
  }
  else {
    id v9 = &stru_26DD585A8;
  }
  objc_storeStrong(&v15, v9);
  id v6 = [MCLURLDataLoaderTask alloc];
  id v13 = -[MCLURLDataLoaderTask initWithURLRequest:targetPath:category:completionHandler:receiveData:](v6, "initWithURLRequest:targetPath:category:completionHandler:receiveData:", location[0], v16, v15, v14);
  [(MCLURLDataLoader *)v18 enqueueTask:v13 reschedule:0];
  id v8 = v13;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)downloadURL:(id)a3 toPath:(id)a4 category:(id)a5 completionHandler:(id)a6
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  id v10 = v17;
  id v11 = (id)[MEMORY[0x263F08BD8] requestWithURL:location[0]];
  id v12 = -[MCLURLDataLoader downloadRequest:toPath:category:completionHandler:](v10, "downloadRequest:toPath:category:completionHandler:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (id)downloadRequest:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  downloadCacheDirectory = v20->_downloadCacheDirectory;
  id v13 = (id)[location[0] URL];
  id v12 = +[MCLURLDataLoader uniqueKeyForURL:](MCLURLDataLoader, "uniqueKeyForURL:");
  id v16 = -[NSString stringByAppendingPathComponent:](downloadCacheDirectory, "stringByAppendingPathComponent:");

  id v14 = [(NSString *)v16 pathExtension];
  BOOL v15 = [(NSString *)v14 length] != 0;

  if (!v15)
  {
    id v5 = [(NSString *)v16 stringByAppendingPathExtension:@"[content_type]"];
    id v6 = v16;
    id v16 = v5;
  }
  id v8 = [(MCLURLDataLoader *)v20 downloadRequest:location[0] toPath:v16 category:v18 completionHandler:v17];
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)downloadURL:(id)a3 category:(id)a4 completionHandler:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v8 = v14;
  id v9 = (id)[MEMORY[0x263F08BD8] requestWithURL:location[0]];
  id v10 = -[MCLURLDataLoader downloadRequest:category:completionHandler:](v8, "downloadRequest:category:completionHandler:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)cancelTask:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] setCancelled:1];
  objc_initWeak(&v11, v13);
  operationQueue = v13->_operationQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __31__MCLURLDataLoader_cancelTask___block_invoke;
  id v8 = &unk_26485B1D8;
  objc_copyWeak(&v10, &v11);
  id v9 = location[0];
  [(NSOperationQueue *)operationQueue addOperationWithBlock:&v4];
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __31__MCLURLDataLoader_cancelTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained operationCancelTask:*(void *)(a1 + 32)];
}

- (void)cancelTasks:(id)a3
{
  BOOL v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] enumerateObjectsUsingBlock:&__block_literal_global_112];
  objc_initWeak(&from, v15);
  int v5 = (void *)[location[0] copy];
  id v3 = location[0];
  location[0] = v5;

  operationQueue = v15->_operationQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __32__MCLURLDataLoader_cancelTasks___block_invoke_2;
  id v10 = &unk_26485B330;
  id v11 = location[0];
  objc_copyWeak(v12, &from);
  [(NSOperationQueue *)operationQueue addOperationWithBlock:&v6];
  objc_destroyWeak(v12);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __32__MCLURLDataLoader_cancelTasks___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setCancelled:1];
  objc_storeStrong(location, 0);
}

void __32__MCLURLDataLoader_cancelTasks___block_invoke_2(uint64_t a1)
{
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  int v5 = __32__MCLURLDataLoader_cancelTasks___block_invoke_3;
  uint64_t v6 = &unk_26485B308;
  objc_copyWeak(v7, (id *)(a1 + 40));
  [v1 enumerateObjectsUsingBlock:&v2];
  objc_destroyWeak(v7);
}

void __32__MCLURLDataLoader_cancelTasks___block_invoke_3(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained operationCancelTask:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setCategory:(id)a3 forTask:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v5 = (id)[v7 category];
  char v6 = [v5 isEqualToString:location[0]];

  if ((v6 & 1) == 0)
  {
    [v7 setCategory:location[0]];
    [(MCLURLDataLoader *)v9 enqueueTask:v7 reschedule:1];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setCategory:(id)a3 forTasks:(id)a4
{
  BOOL v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = v13;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __41__MCLURLDataLoader_setCategory_forTasks___block_invoke;
  id v10 = &unk_26485B298;
  id v11 = location[0];
  id v12 = v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:");
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __41__MCLURLDataLoader_setCategory_forTasks___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] category];
  char v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if ((v4 & 1) == 0)
  {
    [location[0] setCategory:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) enqueueTask:location[0] reschedule:1];
  }
  objc_storeStrong(location, 0);
}

+ (id)uniqueKeyForURL:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = (id)[location[0] absoluteString];

  id v20 = (char *)[v21 UTF8String];
  if (v20)
  {
    size_t v3 = strlen(v20);
    unint64_t v18 = XXH64((unsigned int *)v20, v3, 0);
    id v12 = (id)[location[0] path];
    char v15 = 0;
    if (v12)
    {
      id v4 = v12;
    }
    else
    {
      id v16 = (id)[location[0] resourceSpecifier];
      char v15 = 1;
      id v4 = v16;
    }
    id v17 = v4;
    if (v15) {

    }
    id v14 = (id)[v17 lastPathComponent];
    id v13 = (id)[v14 pathExtension];
    id v11 = (id)[v14 stringByDeletingPathExtension];
    id v5 = (id)objc_msgSend(v11, "stringByAppendingFormat:", @"-%llX", v18);
    id v6 = v14;
    id v14 = v5;

    if ([v13 length])
    {
      id v7 = (id)[v14 stringByAppendingPathExtension:v13];
      id v8 = v14;
      id v14 = v7;
    }
    id v23 = v14;
    int v19 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v23 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v9 = v23;
  return v9;
}

- (id)downloadCachesDirectory
{
  return self->_downloadCacheDirectory;
}

- (NSSet)cacheLocations
{
  size_t v3 = (void *)MEMORY[0x263EFFA08];
  id v5 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = (id)[v5 arrayForKey:@"MCLURLDataLoader.cacheLocations"];
  id v6 = (id)objc_msgSend(v3, "setWithArray:");

  return (NSSet *)v6;
}

- (void)configureSession
{
  if (!self->_session)
  {
    id v4 = (void *)MEMORY[0x263F08BF8];
    id v6 = [(MCLURLDataLoader *)self defaultSessionConfiguration];
    id v5 = [(MCLURLDataLoader *)self operationQueue];
    uint64_t v2 = (NSURLSession *)(id)objc_msgSend(v4, "sessionWithConfiguration:delegate:delegateQueue:", v6, self);
    session = self->_session;
    self->_session = v2;

    id v7 = (id)[(id)objc_opt_class() description];
    -[NSURLSession setSessionDescription:](self->_session, "setSessionDescription:");
  }
}

- (id)defaultSessionConfiguration
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)[MEMORY[0x263F08C00] defaultSessionConfiguration];
  [(MCLURLDataLoader *)v7 configureSession:v6[0]];
  size_t v3 = (void *)_sessionConfigurators;
  id v5 = v6[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");
  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

void __47__MCLURLDataLoader_defaultSessionConfiguration__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*((void (**)(id, void))location[0] + 2))(location[0], a1[4]);
  objc_storeStrong(location, 0);
}

- (void)configureSession:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] setTimeoutIntervalForRequest:15.0];
  [location[0] setTimeoutIntervalForResource:36000.0];
  objc_msgSend(location[0], "setNetworkServiceType:");
  [location[0] setAllowsCellularAccess:1];
  [location[0] setHTTPShouldUsePipelining:1];
  [location[0] setHTTPShouldSetCookies:1];
  [location[0] setHTTPCookieStorage:v5->_cookieStorage];
  [location[0] setHTTPCookieAcceptPolicy:1];
  [location[0] setHTTPAdditionalHeaders:0];
  [location[0] setHTTPMaximumConnectionsPerHost:10];
  size_t v3 = [(MCLURLDataLoader *)v5 cache];
  objc_msgSend(location[0], "setURLCache:");

  [location[0] setRequestCachePolicy:0];
  objc_storeStrong(location, 0);
}

- (NSOperationQueue)operationQueue
{
  if (!self->_operationQueue)
  {
    uint64_t v2 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = self->_operationQueue;
    self->_operationQueue = v2;

    id v6 = self->_operationQueue;
    id v7 = (id)[(id)objc_opt_class() description];
    -[NSOperationQueue setName:](v6, "setName:");

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    id v8 = dispatch_get_global_queue(2, 0);
    -[NSOperationQueue setUnderlyingQueue:](self->_operationQueue, "setUnderlyingQueue:");

    [(NSOperationQueue *)self->_operationQueue setQualityOfService:25];
  }
  id v4 = self->_operationQueue;
  return v4;
}

- (void)operationCancelTask:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(NSRecursiveLock *)v12->_taskQueueLock lock];
  [(NSMutableArray *)v12->_taskQueue removeObject:location[0]];
  [(NSMutableOrderedSet *)v12->_duplicateTasks removeObject:location[0]];
  [(NSRecursiveLock *)v12->_taskQueueLock unlock];
  sessionTasks = v12->_sessionTasks;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __40__MCLURLDataLoader_operationCancelTask___block_invoke;
  id v8 = &unk_26485B3A8;
  id v9 = v12;
  id v10 = location[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionTasks, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __40__MCLURLDataLoader_operationCancelTask___block_invoke(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v17 = a3;
  id v16 = a4;
  v15[1] = a1;
  v15[0] = (id)[a1[4] loaderTaskForSessionTask:location[0]];
  if (v15[0] == a1[5])
  {
    if (([a1[5] download] & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v4 = location[0];
      uint64_t v8 = MEMORY[0x263EF8330];
      int v9 = -1073741824;
      int v10 = 0;
      id v11 = __40__MCLURLDataLoader_operationCancelTask___block_invoke_2;
      id v12 = &unk_26485B380;
      id v13 = a1[4];
      id v14 = a1[5];
      [v4 cancelByProducingResumeData:&v8];
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      [location[0] cancel];
    }
    unsigned char *v16 = 1;
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

void __40__MCLURLDataLoader_operationCancelTask___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) storeResumeData:location[0] forTask:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0);
}

- (void)enqueueTask:(id)a3 reschedule:(BOOL)a4
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v27 = a4;
  [(NSRecursiveLock *)v29->_taskQueueLock lock];
  if (a4)
  {
    if (([(NSMutableArray *)v29->_taskQueue containsObject:location[0]] & 1) == 0)
    {
      [(NSRecursiveLock *)v29->_taskQueueLock unlock];
      int v26 = 1;
      goto LABEL_8;
    }
    [(NSMutableArray *)v29->_taskQueue removeObject:location[0]];
  }
  uint64_t v25 = 0;
  taskQueue = v29->_taskQueue;
  id v6 = location[0];
  uint64_t v4 = [(NSMutableArray *)taskQueue count];
  uint64_t v31 = 0;
  uint64_t v30 = v4;
  uint64_t v32 = 0;
  uint64_t v33 = v4;
  uint64_t v23 = 0;
  uint64_t v24 = v4;
  uint64_t v17 = MEMORY[0x263EF8330];
  int v18 = -1073741824;
  int v19 = 0;
  id v20 = __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke;
  id v21 = &unk_26485B3D0;
  id v22 = v29;
  uint64_t v25 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](taskQueue, "indexOfObject:inSortedRange:options:usingComparator:", v6, v23, v24, 1536, &v17);
  [(NSMutableArray *)v29->_taskQueue insertObject:location[0] atIndex:v25];
  uint64_t v8 = v25;
  BOOL v27 = v8 == [(NSMutableArray *)v29->_taskQueue count] - 1;
  [(NSRecursiveLock *)v29->_taskQueueLock unlock];
  [(MCLURLDataLoader *)v29 notifyEnqueue];
  if (v27)
  {
    objc_initWeak(&v16, v29);
    operationQueue = v29->_operationQueue;
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke_2;
    id v14 = &unk_26485AC20;
    objc_copyWeak(&v15, &v16);
    [(NSOperationQueue *)operationQueue addOperationWithBlock:&v10];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v16);
  }
  objc_storeStrong((id *)&v22, 0);
  int v26 = 0;
LABEL_8:
  objc_storeStrong(location, 0);
}

uint64_t __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v13 = 0;
  objc_storeStrong(&v13, a3);
  id v6 = (void *)a1[4];
  id v11 = (id)[location[0] category];
  uint64_t v9 = objc_msgSend(v6, "priorityForCategory:");
  uint64_t v8 = (void *)a1[4];
  id v10 = (id)[v13 category];
  uint64_t v12 = v9 - objc_msgSend(v8, "priorityForCategory:");

  if (v12)
  {
    uint64_t v3 = -1;
    if (v12 > 0) {
      uint64_t v3 = 1;
    }
    uint64_t v15 = v3;
  }
  else
  {
    uint64_t v15 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v15;
}

void __43__MCLURLDataLoader_enqueueTask_reschedule___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained operationReschedule];
}

- (void)operationReschedule
{
  id v37 = self;
  v36[1] = (id)a2;
  if (!self->_suspended && (unint64_t)[(NSMutableDictionary *)v37->_activeTasks count] < 0x14)
  {
    [(NSRecursiveLock *)v37->_taskQueueLock lock];
    v36[0] = (id)[(NSMutableArray *)v37->_taskQueue lastObject];
    if (v37->_session
      && v36[0]
      && (unint64_t v16 = [(NSMutableDictionary *)v37->_activeTasks count],
          v16 < [(MCLURLDataLoader *)v37 connectionsLimitForPriorityOfTask:v36[0]]))
    {
      [(NSMutableArray *)v37->_taskQueue removeLastObject];
      [(NSRecursiveLock *)v37->_taskQueueLock unlock];
      uint64_t v30 = 0;
      uint64_t v31 = &v30;
      int v32 = 0x20000000;
      int v33 = 32;
      char v34 = 0;
      activeTasks = v37->_activeTasks;
      uint64_t v24 = MEMORY[0x263EF8330];
      int v25 = -1073741824;
      int v26 = 0;
      BOOL v27 = __39__MCLURLDataLoader_operationReschedule__block_invoke;
      id v28 = &unk_26485B3F8;
      v29[0] = v36[0];
      v29[1] = &v30;
      [(NSMutableDictionary *)activeTasks enumerateKeysAndObjectsUsingBlock:&v24];
      if (v31[3])
      {
        [(NSMutableOrderedSet *)v37->_duplicateTasks addObject:v36[0]];
        int v35 = 1;
      }
      else if (v37->_session)
      {
        BOOL v23 = 0;
        id location = 0;
        id v20 = 0;
        id v13 = [(MCLURLDataLoader *)v37 configuredURLRequestForTask:v36[0] download:&v23 resumeData:&v20];
        objc_storeStrong(&location, v20);
        id v21 = v13;
        char v18 = 0;
        BOOL v14 = 0;
        if (v23)
        {
          id v19 = (id)[v36[0] receiveDataHandler];
          char v18 = 1;
          BOOL v14 = v19 == 0;
        }
        BOOL v23 = v14;
        if (v18) {

        }
        [v36[0] setRequest:v21];
        id v17 = 0;
        if (location)
        {
          uint64_t v2 = [(NSURLSession *)v37->_session downloadTaskWithResumeData:location];
          id v3 = v17;
          id v17 = v2;
        }
        else
        {
          if (v23) {
            uint64_t v4 = [(NSURLSession *)v37->_session downloadTaskWithRequest:v21];
          }
          else {
            uint64_t v4 = [(NSURLSession *)v37->_session dataTaskWithRequest:v21];
          }
          id v5 = v17;
          id v17 = v4;
        }
        if (v17)
        {
          id v11 = v36[0];
          uint64_t v12 = v37->_activeTasks;
          id v10 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "taskIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11);

          uint64_t v9 = v37;
          id v8 = (id)[v36[0] category];
          if (-[MCLURLDataLoader priorityForCategory:](v9, "priorityForCategory:") <= 0) {
            int v7 = *MEMORY[0x263F085B8];
          }
          else {
            int v7 = *MEMORY[0x263F085C0];
          }
          LODWORD(v6) = v7;
          [v17 setPriority:v6];

          [(NSMutableArray *)v37->_sessionTasks addObject:v17];
          [v17 resume];
        }
        [(MCLURLDataLoader *)v37 operationReschedule];
        objc_storeStrong(&v17, 0);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&location, 0);
        int v35 = 0;
      }
      else
      {
        int v35 = 1;
      }
      objc_storeStrong(v29, 0);
      _Block_object_dispose(&v30, 8);
    }
    else
    {
      [(NSRecursiveLock *)v37->_taskQueueLock unlock];
      if (!v36[0] && ![(NSMutableDictionary *)v37->_activeTasks count]) {
        [(MCLURLDataLoader *)v37 notifyEmptyQueue];
      }
      int v35 = 1;
    }
    objc_storeStrong(v36, 0);
  }
}

void __39__MCLURLDataLoader_operationReschedule__block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  if (+[MCLURLDataLoader task:v7 equalsToTask:a1[4]])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)operationSuspendSession
{
  id v21 = self;
  v20[1] = (id)a2;
  [(NSRecursiveLock *)self->_taskQueueLock lock];
  id v2 = (id)[(NSMutableDictionary *)v21->_activeTasks allValues];
  v15[1] = (id)MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  char v18 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke;
  id v19 = &unk_26485B2C0;
  v20[0] = v21;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:");

  duplicateTasks = v21->_duplicateTasks;
  v10[1] = (id)MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke_2;
  BOOL v14 = &unk_26485B2C0;
  v15[0] = v21;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](duplicateTasks, "enumerateObjectsUsingBlock:");
  [(NSRecursiveLock *)v21->_taskQueueLock unlock];
  [(NSMutableOrderedSet *)v21->_duplicateTasks removeAllObjects];
  sessionTasks = v21->_sessionTasks;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke_3;
  uint64_t v9 = &unk_26485B420;
  v10[0] = v21;
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionTasks, "enumerateObjectsUsingBlock:");
  [(NSMutableDictionary *)v21->_activeTasks removeAllObjects];
  [(MCLURLDataLoader *)v21 notifyBackgroundStopped];
  objc_storeStrong(v10, 0);
  objc_storeStrong(v15, 0);
  objc_storeStrong(v20, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] enqueueTask:location[0] reschedule:0];
  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] enqueueTask:location[0] reschedule:0];
  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[3] = a3;
  id v15[2] = a4;
  v15[1] = a1;
  v15[0] = (id)[a1[4] loaderTaskForSessionTask:location[0]];
  if (([v15[0] download] & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = location[0];
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    int v11 = __43__MCLURLDataLoader_operationSuspendSession__block_invoke_4;
    int v12 = &unk_26485B380;
    id v13 = a1[4];
    id v14 = v15[0];
    [v4 cancelByProducingResumeData:&v8];
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    [location[0] cancel];
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

void __43__MCLURLDataLoader_operationSuspendSession__block_invoke_4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) storeResumeData:location[0] forTask:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0);
}

- (void)operationResumeSession
{
  self->_suspended = 0;
  [(MCLURLDataLoader *)self operationReschedule];
}

- (void)operationRestartSession
{
  id v3 = self;
  v2[1] = (id)a2;
  [(MCLURLDataLoader *)self operationSuspendSession];
  v2[0] = v3->_session;
  objc_storeStrong((id *)&v3->_session, 0);
  [v2[0] invalidateAndCancel];
  [(MCLURLDataLoader *)v3 configureSession];
  [(MCLURLDataLoader *)v3 operationResumeSession];
  objc_storeStrong(v2, 0);
}

+ (BOOL)task:(id)a3 equalsToTask:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v7 = (id)[location[0] URL];
  id v8 = (id)[v22 URL];
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v9 = 0;
  if (objc_msgSend(v7, "isEqual:"))
  {
    id v21 = (id)[location[0] targetPath];
    char v20 = 1;
    id v19 = (id)[v22 targetPath];
    char v18 = 1;
    char v5 = 1;
    if (v21 != v19)
    {
      id v17 = (id)[location[0] targetPath];
      char v16 = 1;
      id v15 = (id)[v17 stringByDeletingPathExtension];
      char v14 = 1;
      id v13 = (id)[v22 targetPath];
      char v12 = 1;
      id v11 = (id)[v13 stringByDeletingPathExtension];
      char v10 = 1;
      char v5 = objc_msgSend(v15, "isEqualToString:");
    }
    char v9 = v5;
  }
  char v24 = v9 & 1;
  if (v10) {

  }
  if (v12) {
  if (v14)
  }

  if (v16) {
  if (v18)
  }

  if (v20) {
  objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(location, 0);
  return v24 & 1;
}

- (id)duplicateTasksForTask:(id)a3
{
  uint64_t v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  duplicateTasks = v30->_duplicateTasks;
  uint64_t v21 = MEMORY[0x263EF8330];
  int v22 = -1073741824;
  int v23 = 0;
  char v24 = __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke;
  int v25 = &unk_26485B298;
  id v26 = location[0];
  id v27 = v28;
  [(NSMutableOrderedSet *)duplicateTasks enumerateObjectsUsingBlock:&v21];
  [(NSRecursiveLock *)v30->_taskQueueLock lock];
  uint64_t v14 = 0;
  id v15 = &v14;
  int v16 = 838860800;
  int v17 = 48;
  char v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  taskQueue = v30->_taskQueue;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke_127;
  id v11 = &unk_26485B448;
  id v12 = location[0];
  v13[1] = &v14;
  v13[0] = v28;
  [(NSMutableArray *)taskQueue enumerateObjectsUsingBlock:&v7];
  if (v15[5]) {
    [(NSMutableArray *)v30->_taskQueue removeObjectsAtIndexes:v15[5]];
  }
  [(NSRecursiveLock *)v30->_taskQueueLock unlock];
  id v4 = v28;
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
  _Block_object_dispose(&v14, 8);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (+[MCLURLDataLoader task:*(void *)(a1 + 32) equalsToTask:location[0]])
  {
    [*(id *)(a1 + 40) addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

void __42__MCLURLDataLoader_duplicateTasksForTask___block_invoke_127(uint64_t a1, void *a2, uint64_t a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (+[MCLURLDataLoader task:*(void *)(a1 + 32) equalsToTask:location[0]])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      char v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addIndex:a3];
    [*(id *)(a1 + 40) addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (id)loaderTaskForSessionTask:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  activeTasks = v8->_activeTasks;
  id v5 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(location[0], "taskIdentifier"));
  id v6 = (id)-[NSMutableDictionary objectForKeyedSubscript:](activeTasks, "objectForKeyedSubscript:");

  objc_storeStrong(location, 0);
  return v6;
}

+ (void)applyDefaultRequestHeaders:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
  id v7 = (id)[v6 stringForKey:@"UserAgentApp"];
  char v10 = 0;
  char v8 = 0;
  if (v7)
  {
    id v3 = v7;
  }
  else
  {
    id v11 = (id)[MEMORY[0x263EFFA40] standardUserDefaults];
    char v10 = 1;
    id v9 = (id)[v11 stringForKey:@"UserAgent"];
    char v8 = 1;
    id v3 = v9;
  }
  id v12 = v3;
  if (v8) {

  }
  if (v10) {
  [location[0] setValue:v12 forHTTPHeaderField:@"User-Agent"];
  }
  id v4 = (id)[location[0] HTTPMethod];
  char v5 = [v4 isEqualToString:@"GET"];

  if (v5) {
    [location[0] setHTTPMethod:@"GET"];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)configuredURLRequestForTask:(id)a3 download:(BOOL *)a4 resumeData:(id *)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  v93 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v91 = a4;
  v90 = a5;
  id v50 = (id)[location[0] request];
  id v89 = (id)[v50 mutableCopy];

  id v51 = (id)[location[0] request];
  [v51 timeoutInterval];
  objc_msgSend(v89, "setTimeoutInterval:");

  [(id)objc_opt_class() applyDefaultRequestHeaders:v89];
  [(MCLURLDataLoader *)v93 processURLRequestRewrite:v89];
  v52 = v93;
  id v53 = (id)[location[0] category];
  uint64_t v54 = -[MCLURLDataLoader priorityForCategory:](v52, "priorityForCategory:");

  uint64_t v88 = v54;
  if (v54 >= 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 3;
  }
  [v89 setNetworkServiceType:v5];
  [v89 setAllowsCellularAccess:v88 != -2];
  id v55 = (id)[v89 HTTPMethod];
  char v56 = [v55 isEqualToString:@"GET"];

  if (v56)
  {
    id v6 = (id)[location[0] receiveDataHandler];
    BOOL v47 = v6 == 0;

    if (v47)
    {
      id v86 = (id)[MEMORY[0x263F08850] defaultManager];
      if ([location[0] download])
      {
        id v85 = (id)[location[0] targetPath];
        if ([v85 hasSuffix:@"[content_type]"])
        {
          id v7 = (id)[v85 stringByDeletingPathExtension];
          id v8 = v85;
          id v85 = v7;

          id v84 = (id)[v85 lastPathComponent];
          memset(__b, 0, sizeof(__b));
          id v43 = v86;
          id v44 = (id)[v85 stringByDeletingLastPathComponent];
          id obj = (id)objc_msgSend(v43, "enumeratorAtPath:");

          uint64_t v46 = [obj countByEnumeratingWithState:__b objects:v95 count:16];
          if (v46)
          {
            uint64_t v40 = *(void *)__b[2];
            uint64_t v41 = 0;
            unint64_t v42 = v46;
            while (1)
            {
              uint64_t v39 = v41;
              if (*(void *)__b[2] != v40) {
                objc_enumerationMutation(obj);
              }
              id v83 = *(id *)(__b[1] + 8 * v41);
              id v37 = (id)[v83 stringByDeletingPathExtension];
              char v38 = [v37 isEqualToString:v84];

              if (v38) {
                break;
              }
              ++v41;
              if (v39 + 1 >= v42)
              {
                uint64_t v41 = 0;
                unint64_t v42 = [obj countByEnumeratingWithState:__b objects:v95 count:16];
                if (!v42) {
                  goto LABEL_18;
                }
              }
            }
            id v35 = location[0];
            id v36 = (id)[v83 pathExtension];
            objc_msgSend(v35, "applyFileExtension:");

            int v87 = 2;
          }
          else
          {
LABEL_18:
            int v87 = 0;
          }

          objc_storeStrong(&v84, 0);
        }
        objc_storeStrong(&v85, 0);
      }
      id v81 = [(MCLURLDataLoader *)v93 _cachedResponseForRequest:v89];
      if (v81)
      {
        char v80 = 1;
        if ([v89 cachePolicy])
        {
          [(MCLURLDataLoader *)v93 _removeCachedResponseForRequest:v89];
          char v80 = 0;
        }
        else if ([location[0] download])
        {
          id v79 = 0;
          id v31 = v86;
          id v33 = (id)[location[0] targetPath];
          id v77 = v79;
          id v32 = (id)objc_msgSend(v31, "attributesOfItemAtPath:error:");
          objc_storeStrong(&v79, v77);
          id v78 = v32;

          char v75 = 0;
          char v34 = 0;
          if (!v32)
          {
            id v30 = v86;
            id v76 = (id)[location[0] targetPath];
            char v75 = 1;
            char v34 = objc_msgSend(v30, "fileExistsAtPath:");
          }
          if (v75) {

          }
          if (v34) {
            NSLog(&cfstr_ErrorGettingFi.isa, v79);
          }
          id v9 = [(MCLURLDataLoader *)v93 cachableFileAttributes:v78];
          id v10 = v78;
          id v78 = v9;

          char v73 = 0;
          char v29 = 0;
          if (v78)
          {
            id v74 = (id)[v81 userInfo];
            char v73 = 1;
            char v29 = objc_msgSend(v78, "isEqualToDictionary:");
          }
          char v80 = v29 & 1;
          if (v73) {

          }
          if ((v80 & 1) == 0)
          {
            [(MCLURLDataLoader *)v93 _removeCachedResponseForRequest:v89];
            BOOL *v91 = 1;
            [v89 setCachePolicy:1];
          }
          objc_storeStrong(&v78, 0);
          objc_storeStrong(&v79, 0);
        }
        else
        {
          id v11 = (id)[v81 userInfo];
          BOOL v28 = v11 == 0;

          if (!v28)
          {
            [(MCLURLDataLoader *)v93 _removeCachedResponseForRequest:v89];
            [v89 setCachePolicy:1];
            char v80 = 0;
          }
        }
        if (v80)
        {
          id v25 = (id)[v81 response];
          id v72 = (id)[v25 allHeaderFields];

          id v26 = (id)[v72 objectForKeyedSubscript:@"Cache-Control"];
          char v27 = [v26 containsString:@"private"];

          char v71 = v27 & 1;
          if ((v27 & 1) == 0)
          {
            id v24 = (id)[v72 objectForKeyedSubscript:@"Etag"];
            char v68 = 0;
            if (v24)
            {
              id v12 = v24;
            }
            else
            {
              id v69 = (id)[v72 objectForKeyedSubscript:@"ETag"];
              char v68 = 1;
              id v12 = v69;
            }
            id v70 = v12;
            if (v68) {

            }
            id v23 = (id)[v72 objectForKeyedSubscript:@"Last-Modified"];
            char v65 = 0;
            if (v23)
            {
              id v13 = v23;
            }
            else
            {
              id v66 = (id)[v72 objectForKeyedSubscript:@"Date"];
              char v65 = 1;
              id v13 = v66;
            }
            id v67 = v13;
            if (v65) {

            }
            if ([v70 length]) {
              [v89 setValue:v70 forHTTPHeaderField:@"If-None-Match"];
            }
            BOOL v64 = 0;
            id v21 = (id)[v72 objectForKeyedSubscript:@"Expires"];
            char v62 = 0;
            BOOL v22 = 1;
            if (![v21 length])
            {
              id v63 = (id)[v72 objectForKeyedSubscript:@"Cache-Control"];
              char v62 = 1;
              BOOL v22 = [v63 length] != 0;
            }
            if (v62) {

            }
            BOOL v64 = v22;
            if ([v67 length] && (!v64 || !objc_msgSend(v70, "length"))) {
              [v89 setValue:v67 forHTTPHeaderField:@"If-Modified-Since"];
            }
            objc_storeStrong(&v67, 0);
            objc_storeStrong(&v70, 0);
          }
          objc_storeStrong(&v72, 0);
        }
      }
      else if ([location[0] download])
      {
        [v89 setCachePolicy:1];
        BOOL *v91 = 1;
        if (v90)
        {
          id v20 = (id)[location[0] targetPath];
          id v61 = (id)[v20 stringByAppendingPathExtension:@"partial"];

          if ([v86 fileExistsAtPath:v61])
          {
            id v60 = 0;
            id v14 = objc_alloc(MEMORY[0x263EFF8F8]);
            id v58 = v60;
            id v19 = (void *)[v14 initWithContentsOfFile:v61 options:2 error:&v58];
            objc_storeStrong(&v60, v58);
            id v59 = v19;
            if (v60)
            {
              NSLog(&cfstr_ErrorReadingRe.isa, v60);
            }
            else if ([(id)objc_opt_class() isValidResumeData:v59])
            {
              id v15 = v59;
              id *v90 = v15;
            }
            else
            {
              NSLog(&cfstr_CorruptedResum.isa);
            }
            objc_storeStrong(&v59, 0);
            objc_storeStrong(&v60, 0);
          }
          objc_storeStrong(&v61, 0);
        }
      }
      if ([location[0] download])
      {
        id v18 = (id)[location[0] targetPath];
        id v57 = (id)[v18 stringByAppendingPathExtension:@"partial"];

        objc_msgSend(v86, "removeItemAtPath:error:", v57);
        objc_storeStrong(&v57, 0);
      }
      id v94 = v89;
      int v87 = 1;
      objc_storeStrong(&v81, 0);
      objc_storeStrong(&v86, 0);
    }
    else
    {
      id v94 = v89;
      int v87 = 1;
    }
  }
  else
  {
    [v89 setCachePolicy:1];
    id v94 = v89;
    int v87 = 1;
  }
  objc_storeStrong(&v89, 0);
  objc_storeStrong(location, 0);
  int v16 = v94;
  return v16;
}

- (void)processURLRequestRewrite:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  rewriteRules = v11->_rewriteRules;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __45__MCLURLDataLoader_processURLRequestRewrite___block_invoke;
  id v8 = &unk_26485B470;
  id v9 = location[0];
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](rewriteRules, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__MCLURLDataLoader_processURLRequestRewrite___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12[3] = a3;
  id v12[2] = a4;
  v12[1] = a1;
  id v8 = (id)[a1[4] URL];
  v12[0] = (id)[v8 absoluteString];

  uint64_t v4 = (void *)[v12[0] length];
  id location[3] = 0;
  id location[2] = v4;
  location[4] = 0;
  location[5] = v4;
  v10[1] = 0;
  id v11 = v4;
  id v9 = (id)[location[0] matchPattern];
  v10[0] = (id)objc_msgSend(v9, "firstMatchInString:options:range:", v12[0], 0, 0, v11);

  if (v10[0] && [v10[0] range] != 0x7FFFFFFFFFFFFFFFLL) {
    [location[0] rewriteURLRequest:a1[4]];
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)connectionsLimitForPriorityOfTask:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = v8;
  id v5 = (id)[location[0] category];
  uint64_t v6 = -[MCLURLDataLoader priorityForCategory:](v4, "priorityForCategory:");

  switch(v6)
  {
    case -9223372036854775808:
      unint64_t v9 = 0;
      break;
    case -2:
      unint64_t v9 = 1;
      break;
    case -1:
      unint64_t v9 = 5;
      break;
    default:
      if (v6 && (unint64_t)(v6 - 1) <= 1) {
        unint64_t v9 = 20;
      }
      else {
        unint64_t v9 = 10;
      }
      break;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)cachableFileAttributes:(id)a3
{
  id v15[2] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (location[0])
  {
    v14[0] = *MEMORY[0x263F080B8];
    id v11 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(location[0], "fileSize"));
    char v10 = 1;
    v15[0] = v11;
    v14[1] = *MEMORY[0x263F08048];
    id v9 = (id)[location[0] fileModificationDate];
    char v8 = 1;
    v15[1] = v9;
    id v7 = (id)[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    char v6 = 1;
    id v3 = v7;
  }
  else
  {
    id v3 = 0;
  }
  id v13 = v3;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  objc_storeStrong(location, 0);
  uint64_t v4 = v13;
  return v4;
}

- (void)task:(id)a3 completedWithError:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v8 = (id)[v18 domain];
  BOOL v9 = 0;
  if ([v8 isEqualToString:*MEMORY[0x263F08570]]) {
    BOOL v9 = [v18 code] == -999;
  }

  if (v9)
  {
    objc_storeStrong(&v18, 0);
    [location[0] setCancelled:1];
  }
  [location[0] applyMimeType];
  [location[0] dispatchCompletion:v18];
  activeTasks = v20->_activeTasks;
  id v5 = (id)[(NSMutableDictionary *)activeTasks allKeysForObject:location[0]];
  -[NSMutableDictionary removeObjectsForKeys:](activeTasks, "removeObjectsForKeys:");

  id v6 = [(MCLURLDataLoader *)v20 duplicateTasksForTask:location[0]];
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __44__MCLURLDataLoader_task_completedWithError___block_invoke;
  id v14 = &unk_26485B498;
  id v15 = v20;
  id v16 = location[0];
  id v17 = v18;
  [v6 enumerateObjectsUsingBlock:&v10];

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __44__MCLURLDataLoader_task_completedWithError___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(*(void *)(a1 + 32) + 96) removeObject:location[0]];
  if ([*(id *)(a1 + 40) cancelled])
  {
    [*(id *)(a1 + 32) enqueueTask:location[0] reschedule:0];
  }
  else
  {
    id v3 = (id)[*(id *)(a1 + 40) request];
    objc_msgSend(location[0], "setRequest:");

    id v4 = (id)[*(id *)(a1 + 40) response];
    objc_msgSend(location[0], "setResponse:");

    id v5 = (id)[*(id *)(a1 + 40) responseData];
    objc_msgSend(location[0], "setResponseData:");

    char v2 = [*(id *)(a1 + 40) cachedResponse];
    [location[0] setCachedResponse:v2 & 1];
    [location[0] applyMimeType];
    [location[0] dispatchCompletion:*(void *)(a1 + 48)];
  }
  objc_storeStrong(location, 0);
}

- (id)downloadCachedResponse:(id)a3
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = (id)[location[0] targetPath];
  id v20 = 0;
  id v14 = (id)[MEMORY[0x263F08850] defaultManager];
  id v18 = v20;
  id v13 = (id)[v14 attributesOfItemAtPath:v21 error:&v18];
  objc_storeStrong(&v20, v18);
  id v19 = v13;

  if (v19)
  {
    uint64_t v10 = [v19 fileSize];
    id v11 = (id)[location[0] response];
    BOOL v12 = v10 == [v11 expectedContentLength];

    if (v12)
    {
      id v3 = [(MCLURLDataLoader *)v23 cachableFileAttributes:v19];
      id v4 = v19;
      id v19 = v3;

      id v16 = (id)[(id)objc_opt_class() downloadData];
      id v8 = objc_opt_class();
      id v9 = (id)[location[0] response];
      id v15 = (id)objc_msgSend(v8, "duplicateResponse:withContentLength:", v9, objc_msgSend(v16, "length"));

      id v5 = objc_alloc(MEMORY[0x263F086F8]);
      uint64_t v24 = [v5 initWithResponse:v15 data:v16 userInfo:v19 storagePolicy:0];
      int v17 = 1;
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
    else
    {
      uint64_t v24 = 0;
      int v17 = 1;
    }
  }
  else
  {
    if (v20) {
      NSLog(&cfstr_ErrorGettingFi.isa, v20);
    }
    uint64_t v24 = 0;
    int v17 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  id v6 = (void *)v24;
  return v6;
}

+ (id)downloadData
{
  id v5 = (dispatch_once_t *)&downloadData_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_184);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  char v2 = (void *)downloadData_staticData;
  return v2;
}

void __32__MCLURLDataLoader_downloadData__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(@"DOWNLOAD", "dataUsingEncoding:", 4, a1, a1);
  char v2 = (void *)downloadData_staticData;
  downloadData_staticData = (uint64_t)v1;
}

+ (id)duplicateResponse:(id)a3 withContentLength:(int64_t)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v13 = a4;
  id v7 = (id)[location[0] allHeaderFields];
  id v12 = (id)[v7 mutableCopy];

  id v8 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", v13);
  objc_msgSend(v12, "setObject:forKeyedSubscript:");

  id v9 = objc_alloc(MEMORY[0x263F088A0]);
  id v10 = (id)[location[0] URL];
  uint64_t v4 = [location[0] statusCode];
  id v11 = (void *)[v9 initWithURL:v10 statusCode:v4 HTTPVersion:@"HTTP/1.1" headerFields:v12];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)updateDownloadCacheEntry:(id)a3
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = (id)[location[0] request];
  char v22 = 0;
  char v13 = 0;
  if ([location[0] responseOk])
  {
    id v23 = (id)[v24 HTTPMethod];
    char v22 = 1;
    char v13 = [v23 isEqualToString:@"GET"];
  }
  if (v22) {

  }
  if ((v13 & 1) == 0) {
    goto LABEL_20;
  }
  id v9 = (id)[location[0] response];
  id v10 = (id)[v9 allHeaderFields];
  id v11 = (id)[v10 objectForKeyedSubscript:@"Cache-Control"];
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  char v12 = 1;
  if (([v11 containsString:@"no-cache"] & 1) == 0)
  {
    id v21 = (id)[location[0] response];
    char v20 = 1;
    id v19 = (id)[v21 allHeaderFields];
    char v18 = 1;
    id v17 = (id)[v19 objectForKeyedSubscript:@"Pragma"];
    char v16 = 1;
    char v12 = [v17 containsString:@"no-cache"];
  }
  if (v16) {

  }
  if (v18) {
  if (v20)
  }

  if ((v12 & 1) == 0)
  {
    id v14 = [(MCLURLDataLoader *)v26 downloadCachedResponse:location[0]];
    if (v14)
    {
      cache = v26->_cache;
      id v6 = (id)[location[0] request];
      -[NSURLCache storeCachedResponse:forRequest:](cache, "storeCachedResponse:forRequest:", v14);
    }
    else
    {
      id v3 = v26;
      id v4 = (id)[location[0] request];
      -[MCLURLDataLoader _removeCachedResponseForRequest:](v3, "_removeCachedResponseForRequest:");
    }
    objc_storeStrong(&v14, 0);
LABEL_20:
    int v15 = 0;
    goto LABEL_21;
  }
  id v7 = v26;
  id v8 = (id)[location[0] request];
  -[MCLURLDataLoader _removeCachedResponseForRequest:](v7, "_removeCachedResponseForRequest:");

  int v15 = 1;
LABEL_21:
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)storeResumeData:(id)a3 forTask:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  if (location[0])
  {
    id v4 = (id)[v10 targetPath];
    id v9 = (id)[v4 stringByAppendingPathExtension:@"partial"];

    id v8 = 0;
    id v7 = 0;
    char v5 = [location[0] writeToFile:v9 options:1 error:&v7];
    objc_storeStrong(&v8, v7);
    if ((v5 & 1) == 0) {
      NSLog(&cfstr_ErrorWritingRe.isa, v8);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)isValidResumeData:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![location[0] length]) {
    goto LABEL_9;
  }
  id v10 = 0;
  id v8 = 0;
  id v5 = (id)[MEMORY[0x263F08AC0] propertyListWithData:location[0] options:0 format:0 error:&v8];
  objc_storeStrong(&v10, v8);
  id v9 = v5;
  if (!v5
    || ((v7 = (id)[v9 objectForKey:@"NSURLSessionResumeInfoLocalPath"], !objc_msgSend(v7, "length"))? (v6 = 0): (id v4 = (id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), v12 = objc_msgSend(v4, "fileExistsAtPath:", v7) & 1, v4, v6 = 1), objc_storeStrong(&v7, 0), !v6))
  {
    int v6 = 0;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  if (!v6) {
LABEL_9:
  }
    char v12 = 0;
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  [(NSRecursiveLock *)v14->_taskQueueLock lock];
  activeTasks = v14->_activeTasks;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __57__MCLURLDataLoader_URLSession_didBecomeInvalidWithError___block_invoke;
  id v10 = &unk_26485B4C0;
  id v11 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeTasks, "enumerateKeysAndObjectsUsingBlock:");
  [(NSMutableDictionary *)v14->_activeTasks removeAllObjects];
  [(NSMutableArray *)v14->_sessionTasks removeAllObjects];
  [(NSRecursiveLock *)v14->_taskQueueLock unlock];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __57__MCLURLDataLoader_URLSession_didBecomeInvalidWithError___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  [v5 dispatchCompletion:a1[4]];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F08A48] mainQueue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __69__MCLURLDataLoader_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke;
  int v8 = &unk_26485A9F0;
  id v9 = location[0];
  objc_msgSend(v3, "addOperationWithBlock:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __69__MCLURLDataLoader_URLSessionDidFinishEventsForBackgroundURLSession___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_getAssociatedObject(a1[4], &BACKGROUND_SESSION_COMPLETION_HANDLER_KEY);
  objc_setAssociatedObject(a1[4], &BACKGROUND_SESSION_COMPLETION_HANDLER_KEY, 0, 0);
  if (location[0]) {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  id v19 = [(MCLURLDataLoader *)v23 loaderTaskForSessionTask:v21];
  id v5 = (id)[v19 response];
  BOOL v12 = v5 != 0;

  if (!v12)
  {
    id v9 = (id)[v21 response];
    objc_msgSend(v19, "setResponse:");
  }
  [(NSMutableArray *)v23->_sessionTasks removeObject:v21];
  BOOL v18 = 0;
  char v16 = 0;
  BOOL v8 = 0;
  if (v20)
  {
    id v17 = (id)[v20 domain];
    char v16 = 1;
    BOOL v8 = 0;
    if ([v17 isEqualToString:*MEMORY[0x263F08570]]) {
      BOOL v8 = [v20 code] == -999;
    }
  }
  if (v16) {

  }
  BOOL v18 = v8;
  char v14 = 0;
  BOOL v7 = 0;
  if (!v8)
  {
    objc_opt_class();
    BOOL v7 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v15 = (id)[v21 response];
      char v14 = 1;
      BOOL v7 = [v15 expectedContentLength] >= 500000;
    }
  }
  if (v14) {

  }
  if (v7)
  {
    id v6 = (id)[v20 userInfo];
    id v13 = (id)[v6 objectForKeyedSubscript:*MEMORY[0x263F085B0]];

    [(MCLURLDataLoader *)v23 storeResumeData:v13 forTask:v19];
    objc_storeStrong(&v13, 0);
  }
  if (!v18 || !v23->_suspended)
  {
    [(MCLURLDataLoader *)v23 task:v19 completedWithError:v20];
    [(MCLURLDataLoader *)v23 operationReschedule];
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = 0;
  objc_storeStrong(&v47, a4);
  id v46 = 0;
  objc_storeStrong(&v46, a5);
  id v45 = 0;
  objc_storeStrong(&v45, a6);
  id v44 = [(MCLURLDataLoader *)v49 loaderTaskForSessionTask:v47];
  [v44 setResponse:v46];
  if ([v44 cancelled])
  {
    (*((void (**)(id, void))v45 + 2))(v45, 0);
  }
  else if ([v44 download])
  {
    id v24 = v49;
    id v25 = (id)[v44 request];
    id v43 = -[MCLURLDataLoader _cachedResponseForRequest:](v24, "_cachedResponseForRequest:");

    id v26 = (id)[v44 originalRequest];
    char v41 = 0;
    BOOL v27 = 0;
    if (![v26 cachePolicy])
    {
      id v42 = (id)[v43 userInfo];
      char v41 = 1;
      BOOL v27 = v42 != 0;
    }
    if (v41) {

    }
    if (v27)
    {
      id v19 = (id)[v44 response];
      id v18 = (id)[v19 allHeaderFields];
      id v40 = (id)[v18 mutableCopy];

      id v21 = (id)[v43 response];
      id v20 = (id)[v21 allHeaderFields];
      id v39 = (id)[v20 mutableCopy];

      objc_msgSend(v40, "removeObjectForKey:");
      [v39 removeObjectForKey:@"Date"];
      id v22 = (id)[MEMORY[0x263EFF9D0] null];
      id v38 = (id)objc_msgSend(v40, "objectsForKeys:notFoundMarker:", &unk_26DD5EE30);

      id v23 = (id)[MEMORY[0x263EFF9D0] null];
      id v37 = (id)objc_msgSend(v39, "objectsForKeys:notFoundMarker:", &unk_26DD5EE48);

      if ([v44 responseOk] & 1) == 0 || (objc_msgSend(v38, "isEqualToArray:", v37))
      {
        if (([v44 responseOk] & 1) != 0 && (objc_msgSend(v40, "isEqualToDictionary:", v39) & 1) == 0) {
          [(MCLURLDataLoader *)v49 updateDownloadCacheEntry:v44];
        }
        [v44 setCachedResponse:1];
        (*((void (**)(id, void))v45 + 2))(v45, 0);
      }
      else
      {
        (*((void (**)(id, uint64_t))v45 + 2))(v45, 2);
      }
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t))v45 + 2))(v45, 2);
    }
    objc_storeStrong(&v43, 0);
  }
  else
  {
    char v16 = v49;
    id v17 = (id)[v44 request];
    id v36 = -[MCLURLDataLoader _cachedResponseForRequest:](v16, "_cachedResponseForRequest:");

    if (v36)
    {
      id v11 = (id)[v44 response];
      id v10 = (id)[v11 allHeaderFields];
      id v35 = (id)[v10 mutableCopy];

      id v13 = (id)[v36 response];
      id v12 = (id)[v13 allHeaderFields];
      id v34 = (id)[v12 mutableCopy];

      objc_msgSend(v35, "removeObjectForKey:");
      [v34 removeObjectForKey:@"Date"];
      id v14 = (id)[MEMORY[0x263EFF9D0] null];
      id v33 = (id)objc_msgSend(v35, "objectsForKeys:notFoundMarker:", &unk_26DD5EE60);

      id v15 = (id)[MEMORY[0x263EFF9D0] null];
      id v32 = (id)objc_msgSend(v34, "objectsForKeys:notFoundMarker:", &unk_26DD5EE78);

      if ([v44 responseOk] & 1) != 0 && (objc_msgSend(v33, "isEqualToArray:", v32)) {
        [v44 setCachedResponse:1];
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    id v31 = (id)[v44 receiveDataHandler];
    if (v31)
    {
      (*((void (**)(id, id, void))v31 + 2))(v31, v44, 0);
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x263EFF990]);
      if ([v46 expectedContentLength])
      {
        if ((unint64_t)[v46 expectedContentLength] >= 0xF4240) {
          uint64_t v8 = 1000000;
        }
        else {
          uint64_t v8 = [v46 expectedContentLength];
        }
        uint64_t v7 = v8;
      }
      else
      {
        uint64_t v7 = 100000;
      }
      id v6 = (id)[v9 initWithCapacity:v7];
      objc_msgSend(v44, "setResponseData:");
    }
    (*((void (**)(id, uint64_t))v45 + 2))(v45, 1);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = [(MCLURLDataLoader *)v15 loaderTaskForSessionTask:v13];
  activeTasks = v15->_activeTasks;
  id v10 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "taskIdentifier"));
  -[NSMutableDictionary removeObjectForKey:](activeTasks, "removeObjectForKey:");

  if (v11)
  {
    id v5 = v15->_activeTasks;
    id v6 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "taskIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11);
  }
  [(NSMutableArray *)v15->_sessionTasks removeObject:v13];
  [(NSMutableArray *)v15->_sessionTasks addObject:v12];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v10 = [(MCLURLDataLoader *)v14 loaderTaskForSessionTask:v12];
  if ([v10 cancelled])
  {
    [v12 cancel];
    int v9 = 1;
  }
  else
  {
    id v8 = (id)[v10 receiveDataHandler];
    if (v8)
    {
      (*((void (**)(id, id, id))v8 + 2))(v8, v10, v11);
    }
    else
    {
      id v5 = (id)[v10 responseData];
      [v5 appendData:v11];
    }
    objc_storeStrong(&v8, 0);
    int v9 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  id v22 = 0;
  objc_storeStrong(&v22, a6);
  id v21 = [(MCLURLDataLoader *)v26 loaderTaskForSessionTask:v24];
  char v19 = 0;
  BOOL v13 = 1;
  if (v21)
  {
    BOOL v13 = 1;
    if (([v21 download] & 1) == 0)
    {
      id v20 = (id)[v21 receiveDataHandler];
      char v19 = 1;
      BOOL v13 = v20 != 0;
    }
  }
  if (v19) {

  }
  if (v13)
  {
    (*((void (**)(id, void))v22 + 2))(v22, 0);
  }
  else
  {
    id v7 = (id)[v23 response];
    id v18 = (id)[v7 allHeaderFields];

    id v8 = (id)[v24 originalRequest];
    char v16 = 0;
    char v14 = 0;
    char v9 = 1;
    if ([v8 cachePolicy] != 1)
    {
      id v17 = (id)[v18 objectForKeyedSubscript:@"Cache-Control"];
      char v16 = 1;
      BOOL v6 = 0;
      if (!v17)
      {
        id v15 = (id)[v18 objectForKeyedSubscript:@"Expires"];
        char v14 = 1;
        BOOL v6 = v15 == 0;
      }
      char v9 = v6;
    }
    if (v14) {

    }
    if (v16) {
    if (v9)
    }
      (*((void (**)(id, void))v22 + 2))(v22, 0);
    else {
      (*((void (**)(id, id))v22 + 2))(v22, v23);
    }
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  id v18 = [(MCLURLDataLoader *)v24 loaderTaskForSessionTask:v22];
  if ([v18 cancelled])
  {
    [v22 cancel];
    int v17 = 1;
  }
  else
  {
    id v16 = (id)[v18 redirectHandler];
    if (v16)
    {
      id v15 = (id)(*((uint64_t (**)(id, id, id, id))v16 + 2))(v16, v18, v21, v20);
      if (v15)
      {
        [v18 setRequest:v15];
        id v14 = (id)[v15 mutableCopy];
        id v8 = v14;
        [v15 timeoutInterval];
        objc_msgSend(v8, "setTimeoutInterval:");
        [(id)objc_opt_class() applyDefaultRequestHeaders:v14];
        [(MCLURLDataLoader *)v24 processURLRequestRewrite:v14];
        objc_storeStrong(&v15, v14);
        objc_storeStrong(&v14, 0);
      }
      (*((void (**)(id, id))v19 + 2))(v19, v15);
      if (!v15 && [v21 statusCode] == 301)
      {
        [v18 setResponse:v21];
        [v22 cancel];
      }
      objc_storeStrong(&v15, 0);
    }
    else
    {
      [v18 setRequest:v20];
      id v13 = (id)[v20 mutableCopy];
      id v7 = v13;
      [v20 timeoutInterval];
      objc_msgSend(v7, "setTimeoutInterval:");
      [(id)objc_opt_class() applyDefaultRequestHeaders:v13];
      [(MCLURLDataLoader *)v24 processURLRequestRewrite:v13];
      (*((void (**)(id, id))v19 + 2))(v19, v13);
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v16, 0);
    int v17 = 0;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = [(MCLURLDataLoader *)v31 loaderTaskForSessionTask:v29];
  id v16 = (id)[v29 response];
  objc_msgSend(v27, "setResponse:");

  if ([v27 responseOk])
  {
    id v25 = 0;
    [v27 applyMimeType];
    id v24 = (id)[v27 targetPath];
    id v23 = (id)[MEMORY[0x263F08850] defaultManager];
    if ([v23 fileExistsAtPath:v24])
    {
      id v12 = (id)[v27 response];
      uint64_t v13 = [v12 expectedContentLength];

      unint64_t v22 = v13;
      if (v13 >= 0)
      {
        id v10 = (id)[v28 path];
        id v20 = v25;
        id v9 = (id)objc_msgSend(v23, "attributesOfItemAtPath:error:");
        objc_storeStrong(&v25, v20);
        id v21 = v9;

        char v18 = 0;
        BOOL v11 = 1;
        if (v9)
        {
          BOOL v11 = 1;
          if ([v21 fileSize] >= v22)
          {
            id v19 = (id)[(id)objc_opt_class() downloadData];
            char v18 = 1;
            BOOL v11 = v22 == [v19 length];
          }
        }
        if (v18) {

        }
        if (v11)
        {
          [v27 setCachedResponse:1];
          int v26 = 1;
        }
        else
        {
          int v26 = 0;
        }
        objc_storeStrong(&v21, 0);
        if (v26) {
          goto LABEL_19;
        }
      }
      [v23 removeItemAtPath:v24 error:0];
    }
    id v6 = v23;
    id v5 = v28;
    id v7 = (id)[NSURL fileURLWithPath:v24];
    id v17 = v25;
    char v8 = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v5);
    objc_storeStrong(&v25, v17);

    if (v8) {
      [(MCLURLDataLoader *)v31 updateDownloadCacheEntry:v27];
    }
    else {
      [(MCLURLDataLoader *)v31 task:v27 completedWithError:v25];
    }
    int v26 = 0;
LABEL_19:
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    goto LABEL_20;
  }
  int v26 = 1;
LABEL_20:
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12[3] = (id)a5;
  id v12[2] = (id)a6;
  v12[1] = (id)a7;
  v12[0] = [(MCLURLDataLoader *)v15 loaderTaskForSessionTask:v13];
  HIDWORD(v7) = HIDWORD(a6);
  *(float *)&double v7 = (float)((float)a6 * 1.0) / (float)a7;
  [v12[0] setProgress:v7];
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_removeCachedResponseForRequest:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(MCLURLDataLoader *)v4 _removeCachedResponseForRequest:location[0] force:0];
  objc_storeStrong(location, 0);
}

- (void)_removeCachedResponseForRequest:(id)a3 force:(BOOL)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  if (a4)
  {
    id v13 = &unk_26DD5EF38;
    id v12 = &unk_26DD5EF60;
    id v4 = objc_alloc(MEMORY[0x263F088A0]);
    id v5 = (id)[location[0] URL];
    uint64_t v11 = objc_msgSend(v4, "initWithURL:statusCode:HTTPVersion:headerFields:");

    id v7 = objc_alloc(MEMORY[0x263F086F8]);
    id v6 = (id)v11;
    id v8 = (id)[MEMORY[0x263EFF8F8] data];
    id v10 = (id)objc_msgSend(v7, "initWithResponse:data:userInfo:storagePolicy:", v6);

    [(NSURLCache *)v16->_cache storeCachedResponse:v10 forRequest:location[0]];
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  [(NSURLCache *)v16->_cache removeCachedResponseForRequest:location[0]];
  objc_storeStrong(location, 0);
}

- (id)_cachedResponseForRequest:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = [(NSURLCache *)v11->_cache cachedResponseForRequest:location[0]];
  if (v9
    && (id v6 = (id)[v9 userInfo],
        id v5 = (id)[v6 objectForKeyedSubscript:@"IGNORE"],
        char v7 = [v5 BOOLValue],
        v5,
        v6,
        (v7 & 1) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = location[0];
      [v8 setCachePolicy:1];
      objc_storeStrong(&v8, 0);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v9;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  id v3 = v12;
  return v3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSHTTPCookieStorage)cookieStorage
{
  return self->_cookieStorage;
}

- (void).cxx_destruct
{
}

@end