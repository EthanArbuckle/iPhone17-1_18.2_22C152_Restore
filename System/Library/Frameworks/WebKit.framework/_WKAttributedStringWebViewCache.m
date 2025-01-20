@interface _WKAttributedStringWebViewCache
+ (RetainPtr<WKWebView>)retrieveOrCreateWebView;
+ (id)cache;
+ (id)configuration;
+ (void)cacheWebView:(id)a3;
+ (void)clearConfiguration;
+ (void)clearConfigurationAndRaiseExceptionIfNecessary:(id)a3;
+ (void)invalidateGlobalConfigurationIfNeeded:(id)a3;
+ (void)maybeConsumeBundlePaths:(id)a3;
+ (void)maybeUpdateShouldAllowNetworkLoads:(id)a3;
+ (void)maybeUpdateSourceApplicationBundleIdentifier:(id)a3;
+ (void)purgeAllWebViews;
+ (void)purgeSingleWebView;
+ (void)resetPurgeDelay;
+ (void)validateEntry:(id)a3;
@end

@implementation _WKAttributedStringWebViewCache

+ (id)cache
{
  if (byte_1EB359781 == 1) {
    return (id)qword_1EB359798;
  }
  id result = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  qword_1EB359798 = (uint64_t)result;
  byte_1EB359781 = 1;
  return result;
}

+ (id)configuration
{
  if (byte_1EB359783)
  {
    if (qword_1EB3597A8) {
      return (id)qword_1EB3597A8;
    }
  }
  else
  {
    qword_1EB3597A8 = 0;
    byte_1EB359783 = 1;
  }
  v2 = objc_alloc_init(WKWebViewConfiguration);
  v3 = (const void *)qword_1EB3597A8;
  qword_1EB3597A8 = (uint64_t)v2;
  if (v3) {
    CFRelease(v3);
  }
  if (![(id)readOnlyAccessPaths() count])
  {
    v6 = objc_alloc_init(WKProcessPool);
    v5 = v6;
    if (!v6) {
      goto LABEL_12;
    }
    CFRetain(v6);
    v4 = (_WKProcessPoolConfiguration *)v5;
    goto LABEL_11;
  }
  if ((unint64_t)[(id)readOnlyAccessPaths() count] >= 3)
  {
    __break(0xC471u);
    JUMPOUT(0x198B224B4);
  }
  v4 = objc_alloc_init(_WKProcessPoolConfiguration);
  [(_WKProcessPoolConfiguration *)v4 setAdditionalReadAccessAllowedURLs:readOnlyAccessPaths()];
  v5 = [[WKProcessPool alloc] _initWithConfiguration:v4];
  if (v4) {
LABEL_11:
  }
    CFRelease(v4);
LABEL_12:
  if ((byte_1EB359785 & 1) == 0)
  {
    qword_1EB3597B8 = 0;
    byte_1EB359785 = 1;
LABEL_27:
    v11 = +[WKWebsiteDataStore nonPersistentDataStore];
    v9 = v11;
    if (v11) {
      CFRetain(v11);
    }
    goto LABEL_17;
  }
  v7 = (const void *)qword_1EB3597B8;
  if (!qword_1EB3597B8) {
    goto LABEL_27;
  }
  CFRetain((CFTypeRef)qword_1EB3597B8);
  id v8 = [[_WKWebsiteDataStoreConfiguration alloc] initNonPersistentConfiguration];
  [v8 setSourceApplicationBundleIdentifier:v7];
  v9 = [[WKWebsiteDataStore alloc] _initWithConfiguration:v8];
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v7);
LABEL_17:
  [(id)qword_1EB3597A8 setProcessPool:v5];
  [(id)qword_1EB3597A8 setWebsiteDataStore:v9];
  [(id)qword_1EB3597A8 setMediaTypesRequiringUserActionForPlayback:-1];
  [(id)qword_1EB3597A8 _setAllowsJavaScriptMarkup:0];
  [(id)qword_1EB3597A8 _setAllowsMetaRefresh:0];
  [(id)qword_1EB3597A8 _setAttachmentElementEnabled:1];
  objc_msgSend((id)objc_msgSend((id)qword_1EB3597A8, "preferences"), "_setExtensibleSSOEnabled:", 0);
  [(id)qword_1EB3597A8 _setInvisibleAutoplayNotPermitted:1];
  [(id)qword_1EB3597A8 _setMediaDataLoadsAutomatically:0];
  [(id)qword_1EB3597A8 _setNeedsStorageAccessFromFileURLsQuirk:0];
  [(id)qword_1EB3597A8 setAllowsInlineMediaPlayback:0];
  [(id)qword_1EB3597A8 _setClientNavigationsRunAtForegroundPriority:1];
  objc_msgSend((id)objc_msgSend((id)qword_1EB3597A8, "preferences"), "_setDefaultFontSize:", 12);
  if (!shouldAllowNetworkLoads) {
    objc_msgSend((id)qword_1EB3597A8, "_setAllowedNetworkHosts:", objc_msgSend(MEMORY[0x1E4F1CAD0], "set"));
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v5) {
    CFRelease(v5);
  }
  return (id)qword_1EB3597A8;
}

+ (void)clearConfiguration
{
  if (byte_1EB359783)
  {
    v2 = (const void *)qword_1EB3597A8;
    qword_1EB3597A8 = 0;
    if (v2) {
      CFRelease(v2);
    }
  }
  else
  {
    byte_1EB359783 = 1;
    qword_1EB3597A8 = 0;
  }
}

+ (void)clearConfigurationAndRaiseExceptionIfNecessary:(id)a3
{
  if (a3)
  {
    if ([(id)readOnlyAccessPaths() count])
    {
      [(id)readOnlyAccessPaths() removeAllObjects];
      [a1 clearConfiguration];
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", a3 format];
  }
}

+ (void)validateEntry:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = @"The NSArray associated with _WKReadAccessFileURLsOption may only contain NSURL objects.";
  if (a3 && (isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(a3, "isFileURL", @"The NSArray associated with _WKReadAccessFileURLsOption may only contain NSURL objects."))v6 = 0; {
    else
    }
      v6 = @"_WKReadAccessFileURLsOption requires its NSURL objects to be file URLs.";
  }

  [a1 clearConfigurationAndRaiseExceptionIfNecessary:v6];
}

+ (void)maybeUpdateShouldAllowNetworkLoads:(id)a3
{
  if (!a3)
  {
    if (shouldAllowNetworkLoads) {
      return;
    }
    char v6 = 1;
    goto LABEL_11;
  }
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v4 = 0;
  }
  if (!v4) {
    [a1 clearConfigurationAndRaiseExceptionIfNecessary:@"The value associated with _WKAllowNetworkLoadsOption must be an NSNumber."];
  }
  int v5 = [v4 BOOLValue];
  if (shouldAllowNetworkLoads != v5)
  {
    char v6 = [v4 BOOLValue];
LABEL_11:
    shouldAllowNetworkLoads = v6;
    [a1 clearConfiguration];
  }
}

+ (void)maybeUpdateSourceApplicationBundleIdentifier:(id)a3
{
  if (!a3)
  {
    if ((byte_1EB359785 & 1) == 0)
    {
      qword_1EB3597B8 = 0;
      byte_1EB359785 = 1;
      return;
    }
    char v6 = (const void *)qword_1EB3597B8;
    if (!qword_1EB3597B8) {
      return;
    }
    qword_1EB3597B8 = 0;
LABEL_17:
    CFRelease(v6);
LABEL_18:
    [a1 clearConfiguration];
    return;
  }
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v4 = 0;
  }
  if (!v4) {
    [a1 clearConfigurationAndRaiseExceptionIfNecessary:@"The value associated with _WKSourceApplicationBundleIdentifierOption must be an NSString."];
  }
  if (byte_1EB359785 == 1)
  {
    int v5 = (void *)qword_1EB3597B8;
  }
  else
  {
    int v5 = 0;
    qword_1EB3597B8 = 0;
    byte_1EB359785 = 1;
  }
  if (([v5 isEqualToString:v4] & 1) == 0)
  {
    if (byte_1EB359785)
    {
      if (!v4) {
        goto LABEL_12;
      }
    }
    else
    {
      qword_1EB3597B8 = 0;
      byte_1EB359785 = 1;
      if (!v4)
      {
LABEL_12:
        char v6 = (const void *)qword_1EB3597B8;
        qword_1EB3597B8 = (uint64_t)v4;
        if (!v6) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    CFRetain(v4);
    goto LABEL_12;
  }
}

+ (void)maybeConsumeBundlePaths:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a3 = 0;
  }
  if (a3)
  {
    if ((unint64_t)[a3 count] <= 2) {
      int v5 = 0;
    }
    else {
      int v5 = @"_WKReadAccessFileURLsOption may have at most two additional directories.";
    }
  }
  else
  {
    int v5 = @"The value associated with _WKReadAccessFileURLsOption must be an NSArray of NSURL objects.";
  }
  [a1 clearConfigurationAndRaiseExceptionIfNecessary:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(a3);
        }
        [a1 validateEntry:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if (([a3 isEqualToArray:readOnlyAccessPaths()] & 1) == 0)
  {
    OnlyAccessPaths = (void *)readOnlyAccessPaths();
    if (a3) {
      [OnlyAccessPaths setArray:a3];
    }
    else {
      [OnlyAccessPaths removeAllObjects];
    }
    [a1 clearConfiguration];
  }
}

+ (void)invalidateGlobalConfigurationIfNeeded:(id)a3
{
  uint64_t v5 = [a3 objectForKeyedSubscript:@"_WKReadAccessFileURLsOption"];
  if (v5) {
    [a1 maybeConsumeBundlePaths:v5];
  }
  objc_msgSend(a1, "maybeUpdateShouldAllowNetworkLoads:", objc_msgSend(a3, "objectForKeyedSubscript:", @"_WKAllowNetworkLoadsOption"));
  uint64_t v6 = [a3 objectForKeyedSubscript:@"_WKSourceApplicationBundleIdentifierOption"];

  [a1 maybeUpdateSourceApplicationBundleIdentifier:v6];
}

+ (RetainPtr<WKWebView>)retrieveOrCreateWebView
{
  id v4 = v2;
  [a1 resetPurgeDelay];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___WKAttributedStringWebViewCache_retrieveOrCreateWebView__block_invoke;
  block[3] = &unk_1E5812158;
  block[4] = a1;
  if (+[_WKAttributedStringWebViewCache retrieveOrCreateWebView]::onceToken != -1) {
    dispatch_once(&+[_WKAttributedStringWebViewCache retrieveOrCreateWebView]::onceToken, block);
  }
  uint64_t v5 = (void *)[a1 cache];
  if ([v5 count])
  {
    uint64_t v6 = (WKWebView *)[v5 lastObject];
    _WKProcessPoolConfiguration *v4 = v6;
    if (v6) {
      CFRetain(v6);
    }
    return (RetainPtr<WKWebView>)[v5 removeLastObject];
  }
  else
  {
    uint64_t v7 = -[WKWebView initWithFrame:configuration:]([WKWebView alloc], "initWithFrame:configuration:", [a1 configuration], 0.0, 0.0, 800.0, 600.0);
    _WKProcessPoolConfiguration *v4 = v7;
  }
  return (RetainPtr<WKWebView>)v7;
}

+ (void)cacheWebView:(id)a3
{
  id v4 = (void *)[a1 cache];
  if ((unint64_t)[v4 count] <= 2)
  {
    [v4 addObject:a3];
  }
}

+ (void)resetPurgeDelay
{
  if (byte_1EB359782 == 1)
  {
    v3 = (char *)qword_1EB3597A0;
  }
  else
  {
    v3 = sel_purgeSingleWebView;
    qword_1EB3597A0 = (uint64_t)sel_purgeSingleWebView;
    byte_1EB359782 = 1;
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:v3 object:0];
  uint64_t v4 = qword_1EB3597A0;

  [a1 performSelector:v4 withObject:0 afterDelay:15.0];
}

+ (void)purgeSingleWebView
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:a2 object:0];
  uint64_t v4 = (void *)[a1 cache];
  if ([v4 count])
  {
    objc_msgSend((id)objc_msgSend(v4, "lastObject"), "_close");
    [v4 removeLastObject];
    if ([v4 count])
    {
      [a1 performSelector:a2 withObject:0 afterDelay:15.0];
    }
    else
    {
      [a1 clearConfiguration];
    }
  }
}

+ (void)purgeAllWebViews
{
  v3 = (void *)[a1 cache];
  if ([v3 count])
  {
    [v3 makeObjectsPerformSelector:sel__close];
    [v3 removeAllObjects];
    [a1 clearConfiguration];
  }
}

@end