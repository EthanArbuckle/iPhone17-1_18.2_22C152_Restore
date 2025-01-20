@interface IKJSITunesStore
+ (void)setHeadersForURL:(id)a3 inRequestProperties:(id)a4;
+ (void)setITunesStoreHeaders:(id)a3;
- (BOOL)isManagedAppleID;
- (IKJSITunesStore)initWithAppContext:(id)a3;
- (IKJSITunesStore)initWithAppContext:(id)a3 urlBagCache:(id)a4;
- (IKURLBagCache)bagCache;
- (NSDictionary)accountInfo;
- (NSString)DSID;
- (NSString)cookieURL;
- (NSString)networkConnectionType;
- (NSString)storefront;
- (NSString)userAgent;
- (id)_subscriptionStatusDictionaryWithStatus:(id)a3 isFinal:(BOOL)a4;
- (id)asPrivateIKJSITunesStore;
- (id)cookie;
- (id)eligibilityForService:(id)a3;
- (id)getBag;
- (id)makeStoreXMLHttpRequest;
- (void)_accountStoreChanged;
- (void)_bagCacheUpdated;
- (void)_subscriptionStatusDidChanged:(id)a3;
- (void)authenticate:(id)a3 :(id)a4;
- (void)clearCookies;
- (void)dealloc;
- (void)evaluateScripts:(id)a3 :(id)a4;
- (void)fetchMarketingItem:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)flushUnreportedEvents;
- (void)getServiceEligibility:(id)a3 :(id)a4;
- (void)invalidateBag;
- (void)loadStoreContent:(id)a3 :(id)a4;
- (void)openDynamicUIURL:(id)a3 :(id)a4 :(id)a5;
- (void)openMarketingItem:(id)a3 :(id)a4 :(id)a5;
- (void)recordEvent:(id)a3 :(id)a4;
- (void)setBagCache:(id)a3;
- (void)setCookie:(id)a3;
- (void)setCookieURL:(id)a3;
- (void)setStorefront:(id)a3;
- (void)signOut;
- (void)updateServiceEligibility:(id)a3;
@end

@implementation IKJSITunesStore

- (id)asPrivateIKJSITunesStore
{
  if ([(IKJSITunesStore *)self conformsToProtocol:&unk_1F3E481F8]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (void)setITunesStoreHeaders:(id)a3
{
  id v17 = a3;
  if (MGGetSInt32Answer() == 4)
  {
    v3 = [v17 HTTPHeaders];
    v4 = [v3 objectForKey:@"X-Apple-TV-Resolution"];

    if (!v4)
    {
      v5 = [MEMORY[0x1E4F42D90] mainScreen];
      [v5 bounds];
      double v7 = v6;

      if (v7 == 1080.0) {
        v8 = @"1080";
      }
      else {
        v8 = @"720";
      }
      [v17 setValue:v8 forHTTPHeaderField:@"X-Apple-TV-Resolution"];
    }
    v9 = [v17 HTTPHeaders];
    v10 = [v9 objectForKey:@"X-Apple-TV-Version"];

    if (!v10)
    {
      v11 = [MEMORY[0x1E4F28B50] mainBundle];
      v12 = [v11 infoDictionary];

      v13 = [v12 objectForKey:@"CFBundleVersion"];
      [v17 setValue:v13 forHTTPHeaderField:@"X-Apple-TV-Version"];
    }
    v14 = [v17 HTTPHeaders];
    uint64_t v15 = *MEMORY[0x1E4FA86A0];
    v16 = [v14 objectForKey:*MEMORY[0x1E4FA86A0]];

    if (!v16) {
      [v17 setValue:@"ATV" forHTTPHeaderField:v15];
    }
  }
}

+ (void)setHeadersForURL:(id)a3 inRequestProperties:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  double v6 = +[IKURLBagCache sharedCache];
  int v7 = [v6 isTrustedURL:v5];

  if (v7) {
    [(id)objc_opt_class() setITunesStoreHeaders:v8];
  }
}

- (IKJSITunesStore)initWithAppContext:(id)a3
{
  return [(IKJSITunesStore *)self initWithAppContext:a3 urlBagCache:0];
}

- (IKJSITunesStore)initWithAppContext:(id)a3 urlBagCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)IKJSITunesStore;
  id v8 = [(IKJSObject *)&v38 initWithAppContext:v6];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = (SSMetricsController *)objc_alloc_init(MEMORY[0x1E4FA8210]);
    metricsController = v8->_metricsController;
    v8->_metricsController = v9;

    v11 = [MEMORY[0x1E4FA8100] defaultStore];
    v12 = [v11 activeAccount];
    uint64_t v13 = [v12 uniqueIdentifier];
    lastAccountDSID = v8->_lastAccountDSID;
    v8->_lastAccountDSID = (NSNumber *)v13;

    uint64_t v15 = v7;
    if (!v7)
    {
      uint64_t v15 = +[IKURLBagCache sharedCache];
    }
    objc_storeStrong((id *)&v8->_bagCache, v15);
    if (!v7) {

    }
    [(IKJSITunesStore *)v8 _bagCacheUpdated];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    bagCache = v8->_bagCache;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke;
    v35[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v36, &location);
    uint64_t v18 = [v16 addObserverForName:@"IKURLBagCacheUpdatedNotification" object:bagCache queue:0 usingBlock:v35];
    id urlBagCacheUpdateToken = v8->_urlBagCacheUpdateToken;
    v8->_id urlBagCacheUpdateToken = (id)v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v21 = [MEMORY[0x1E4FA8100] defaultStore];
    uint64_t v22 = *MEMORY[0x1E4FA83B8];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_3;
    v33[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v34, &location);
    uint64_t v23 = [v20 addObserverForName:v22 object:v21 queue:0 usingBlock:v33];
    id ssAccountStoreChangedToken = v8->_ssAccountStoreChangedToken;
    v8->_id ssAccountStoreChangedToken = (id)v23;

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v26 = [MEMORY[0x1E4FA8370] sharedCoordinator];
    uint64_t v27 = *MEMORY[0x1E4FA8990];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_5;
    v31[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v32, &location);
    uint64_t v28 = [v25 addObserverForName:v27 object:v26 queue:0 usingBlock:v31];
    id subscriptionStatusDidChangeToken = v8->_subscriptionStatusDidChangeToken;
    v8->_id subscriptionStatusDidChangeToken = (id)v28;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_2;
    v8[3] = &unk_1E6DE3DE0;
    objc_copyWeak(&v9, v4);
    [v7 evaluate:v8 completionBlock:0];

    objc_destroyWeak(&v9);
  }
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _bagCacheUpdated];
    id WeakRetained = v2;
  }
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_4;
    v8[3] = &unk_1E6DE3DE0;
    objc_copyWeak(&v9, v4);
    [v7 evaluate:v8 completionBlock:0];

    objc_destroyWeak(&v9);
  }
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _accountStoreChanged];
    id WeakRetained = v2;
  }
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_6;
    v8[3] = &unk_1E6DE48E8;
    objc_copyWeak(&v10, v4);
    id v9 = v3;
    [v7 evaluate:v8 completionBlock:0];

    objc_destroyWeak(&v10);
  }
}

void __50__IKJSITunesStore_initWithAppContext_urlBagCache___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [*(id *)(a1 + 32) object];
    id v3 = [v2 lastKnownStatus];
    [WeakRetained _subscriptionStatusDidChanged:v3];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_urlBagCacheUpdateToken];
  [v3 removeObserver:self->_ssAccountStoreChangedToken];
  [v3 removeObserver:self->_subscriptionStatusDidChangeToken];

  v4.receiver = self;
  v4.super_class = (Class)IKJSITunesStore;
  [(IKJSITunesStore *)&v4 dealloc];
}

- (NSString)userAgent
{
  id v2 = [MEMORY[0x1E4FA8140] currentDevice];
  id v3 = [v2 userAgent];

  return (NSString *)v3;
}

- (NSString)networkConnectionType
{
  id v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  id v3 = [v2 connectionTypeHeader];

  return (NSString *)v3;
}

- (NSString)storefront
{
  id v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v2 activeAccount];

  objc_super v4 = SSVStoreFrontIdentifierForAccount();

  return (NSString *)v4;
}

- (void)setStorefront:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FA8140];
  id v4 = a3;
  id v5 = [v3 currentDevice];
  [v5 setStoreFrontIdentifier:v4];

  id v6 = [MEMORY[0x1E4FA8100] defaultStore];
  id v9 = [v6 activeAccount];

  id v7 = (void *)[v9 copy];
  [v7 setStoreFrontIdentifier:v4];

  id v8 = [MEMORY[0x1E4FA8100] defaultStore];
  [v8 saveAccount:v7 error:0];
}

- (id)eligibilityForService:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FA8370], "sharedCoordinator", a3);
  id v5 = [v4 lastKnownStatus];

  if (v5)
  {
    id v6 = [(IKJSITunesStore *)self _subscriptionStatusDictionaryWithStatus:v5 isFinal:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)getServiceEligibility:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F30928] managedValueWithValue:v7];
  v20 = v7;
  id v9 = [v7 context];
  id v10 = [v9 virtualMachine];

  v21 = (void *)v8;
  [v10 addManagedReference:v8 withOwner:self];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = [v6 objectForKey:@"ignoreCache"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 BOOLValue]) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FA8998]];
  }
  uint64_t v13 = [v6 objectForKey:@"reason"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isEqualToString:@"deepLink"]) {
    [v11 setObject:*MEMORY[0x1E4FA89A8] forKey:*MEMORY[0x1E4FA89A0]];
  }
  v14 = [v6 objectForKey:@"partialResults"];
  if (objc_opt_respondsToSelector()) {
    char v15 = [v14 BOOLValue];
  }
  else {
    char v15 = 0;
  }
  objc_initWeak(&location, self);
  v16 = [MEMORY[0x1E4FA8370] sharedCoordinator];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __42__IKJSITunesStore_getServiceEligibility::__block_invoke;
  v22[3] = &unk_1E6DE4938;
  objc_copyWeak(&v27, &location);
  id v17 = v12;
  char v28 = v15;
  id v23 = v17;
  v24 = self;
  id v18 = v21;
  id v25 = v18;
  id v19 = v10;
  id v26 = v19;
  [v16 getStatusWithOptions:v11 statusBlock:v22];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __42__IKJSITunesStore_getServiceEligibility::__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v8 && !*(void *)(a1 + 32))
    {
      v20 = [MEMORY[0x1E4FA8370] sharedCoordinator];
      uint64_t v21 = [v20 lastKnownStatus];

      uint64_t v10 = 1;
      id v7 = (id)v21;
      if (v21) {
        goto LABEL_9;
      }
      goto LABEL_26;
    }
    if (a3)
    {
      uint64_t v10 = 1;
      if (!v7) {
        goto LABEL_26;
      }
LABEL_9:
      uint64_t v11 = [v7 accountStatus];
      uint64_t v12 = [v7 carrierBundlingStatus];
      uint64_t v14 = v11 != 2 || v12 != 2;
      BOOL v16 = v12 == 4 || v12 == 1 || v11 == 3;
      uint64_t v17 = v14 << 63 >> 63;
      if (v16) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v17;
      }
      id v19 = [*(id *)(a1 + 40) _subscriptionStatusDictionaryWithStatus:v7 isFinal:v10];
      goto LABEL_27;
    }
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v10 = 0;
      if (v7) {
        goto LABEL_9;
      }
LABEL_26:
      id v19 = 0;
      uint64_t v18 = -1;
LABEL_27:
      uint64_t v22 = [WeakRetained appContext];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __42__IKJSITunesStore_getServiceEligibility::__block_invoke_2;
      v24[3] = &unk_1E6DE4910;
      objc_copyWeak(v28, (id *)(a1 + 64));
      id v25 = *(id *)(a1 + 48);
      v28[1] = (id)v18;
      id v23 = v19;
      id v26 = v23;
      char v29 = v10;
      id v27 = *(id *)(a1 + 56);
      [v22 evaluate:v24 completionBlock:0];

      objc_destroyWeak(v28);
    }
  }
}

void __42__IKJSITunesStore_getServiceEligibility::__block_invoke_2(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) value];
    id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
    v9[0] = v4;
    id v5 = *(void **)(a1 + 40);
    id v6 = v5;
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v9[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    id v8 = (id)[v3 callWithArguments:v7];

    if (!v5) {
    if (*(unsigned char *)(a1 + 72))
    }
      [*(id *)(a1 + 48) removeManagedReference:*(void *)(a1 + 32) withOwner:WeakRetained];
  }
}

- (id)makeStoreXMLHttpRequest
{
  id v3 = [IKJSXMLHTTPRequest alloc];
  id v4 = [(IKJSObject *)self appContext];
  id v5 = [(IKJSXMLHTTPRequest *)v3 initWithAppContext:v4 jingleRequest:1];

  return v5;
}

- (void)recordEvent:(id)a3 :(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FA8218];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setTopic:v8];

  [v9 addPropertiesWithDictionary:v7];
  [(SSMetricsController *)self->_metricsController insertEvent:v9 withCompletionHandler:0];
}

- (void)flushUnreportedEvents
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  metricsController = self->_metricsController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__IKJSITunesStore_flushUnreportedEvents__block_invoke;
  v6[3] = &unk_1E6DE4960;
  dispatch_semaphore_t v7 = v3;
  id v5 = v3;
  [(SSMetricsController *)metricsController flushUnreportedEventsWithCompletionHandler:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __40__IKJSITunesStore_flushUnreportedEvents__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setCookieURL:(id)a3
{
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F30920], "currentArguments", a3);
  uint64_t v4 = [v11 count];
  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 objectAtIndexedSubscript:0];
    p_cookieURL = (id *)&self->_cookieURL;
    id v8 = *p_cookieURL;
    id *p_cookieURL = 0;

    if ([v6 isString])
    {
      id v9 = [v6 toString];
      if ([v9 length])
      {
        uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
        if (v10) {
          objc_storeStrong(p_cookieURL, v9);
        }
      }
    }

    id v5 = v11;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (id)cookie
{
  if ([(NSString *)self->_cookieURL length]) {
    cookieURL = (__CFString *)self->_cookieURL;
  }
  else {
    cookieURL = @"http://www.apple.com/";
  }
  uint64_t v4 = cookieURL;
  id v5 = [(IKJSObject *)self appContext];
  id v6 = [v5 jsFoundation];
  dispatch_semaphore_t v7 = [v6 getCookieForURL:v4 useSSCookieStorage:1];

  return v7;
}

- (void)setCookie:(id)a3
{
  id v4 = a3;
  id v6 = [(IKJSObject *)self appContext];
  id v5 = [v6 jsFoundation];
  [v5 setCookie:v4 useSSCookieStorage:1];
}

- (void)clearCookies
{
  id v3 = [(IKJSObject *)self appContext];
  id v2 = [v3 jsFoundation];
  [v2 clearCookies];
}

- (void)loadStoreContent:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"id"];
  objc_initWeak(&location, self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 componentsSeparatedByString:@","];
LABEL_5:
    uint64_t v10 = v9;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_7:
  if ([v10 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FA8350]);
    [v11 setStoreFrontSuffix:self->_storeFrontSuffix];
    [v11 setItemIdentifiers:v10];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke;
    v24[3] = &unk_1E6DE4988;
    id v12 = v11;
    id v25 = v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v24];
    if (v7)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v12);
      [(IKJSObject *)self setJSValue:v7 forProperty:v13];
    }
    else
    {
      uint64_t v13 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke_2;
    v21[3] = &unk_1E6DE49D8;
    objc_copyWeak(&v23, &location);
    id v16 = v13;
    id v22 = v16;
    [v12 setResponseBlock:v21];
    uint64_t v17 = [MEMORY[0x1E4FB8838] mainQueue];
    [v17 addOperation:v12];

    objc_destroyWeak(&v23);
  }
  else if (v7)
  {
    uint64_t v14 = [(IKJSObject *)self appContext];

    if (v14)
    {
      char v15 = [(IKJSObject *)self appContext];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke_4;
      v18[3] = &unk_1E6DE48E8;
      objc_copyWeak(&v20, &location);
      id v19 = v7;
      [v15 evaluate:v18 completionBlock:0];

      objc_destroyWeak(&v20);
    }
  }
  objc_destroyWeak(&location);
}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 length])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v5 length]
        && ([v6 isEqualToString:@"id"] & 1) == 0)
      {
        [*(id *)(a1 + 32) setValue:v5 forRequestParameter:v6];
      }
    }
  }
}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v17 = v6;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = *MEMORY[0x1E4FA8760];
    uint64_t v10 = [v5 valueForProperty:*MEMORY[0x1E4FA8760]];
    if (v10) {
      [v8 setObject:v10 forKey:v9];
    }
    uint64_t v11 = *MEMORY[0x1E4FA87C0];
    id v12 = objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E4FA87C0], v17);
    if (v12) {
      [v8 setObject:v12 forKey:v11];
    }
    uint64_t v13 = *MEMORY[0x1E4FA8800];
    uint64_t v14 = [v5 valueForProperty:*MEMORY[0x1E4FA8800]];
    if (v14) {
      [v8 setObject:v14 forKey:v13];
    }
    char v15 = [WeakRetained appContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__IKJSITunesStore_loadStoreContent::__block_invoke_3;
    v19[3] = &unk_1E6DE49B0;
    objc_copyWeak(&v22, (id *)(a1 + 40));
    id v20 = *(id *)(a1 + 32);
    id v16 = v8;
    id v21 = v16;
    [v15 evaluate:v19 completionBlock:0];

    objc_destroyWeak(&v22);
    id v6 = v18;
  }
}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    id v5 = [v4 jsValueForProperty:*(void *)(a1 + 32)];

    v8[0] = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v7 = (id)[v5 callWithArguments:v6];

    [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 32)];
  }
}

void __37__IKJSITunesStore_loadStoreContent::__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained appContext];
    [v3 setException:0 withErrorMessage:@"loadStoreContent: Dictionary is missing required property 'id'."];

    id v4 = (id)[*(id *)(a1 + 32) callWithArguments:&unk_1F3E3DA88];
    id WeakRetained = v5;
  }
}

- (void)evaluateScripts:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [IKScriptsEvaluator alloc];
  uint64_t v9 = [(IKJSObject *)self appContext];
  uint64_t v10 = [(IKScriptsEvaluator *)v8 initWithScripts:v7 withContext:v9 callback:v6 jingleRequest:1];

  [(IKScriptsEvaluator *)v10 evaluate];
}

- (void)updateServiceEligibility:(id)a3
{
  id v3 = [a3 objectForKey:@"carrierBundle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x1E4FA8370] sharedCoordinator];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__IKJSITunesStore_updateServiceEligibility___block_invoke;
    v5[3] = &unk_1E6DE4A00;
    id v6 = v3;
    [v4 modifyLastKnownStatusUsingBlock:v5];
  }
}

uint64_t __44__IKJSITunesStore_updateServiceEligibility___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:@"eligible"])
  {
    uint64_t v3 = 1;
LABEL_9:
    id v4 = v8;
LABEL_10:
    uint64_t v5 = [v4 setCarrierBundlingStatus:v3];
    id v6 = v8;
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"needsVerification"])
  {
    uint64_t v3 = 3;
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"notEligible"])
  {
    uint64_t v3 = 2;
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"unknown"])
  {
    uint64_t v3 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 32) isEqualToString:@"unlinked"];
  id v6 = v8;
  if (v5)
  {
    uint64_t v3 = 4;
    id v4 = v8;
    goto LABEL_10;
  }
LABEL_11:
  return MEMORY[0x1F41817F8](v5, v6);
}

- (void)fetchMarketingItem:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v27 = a7;
  char v15 = [(IKJSITunesStore *)self bagCache];
  id v16 = (void *)MEMORY[0x1E4F4DBE0];
  id v17 = [MEMORY[0x1E4F4DD18] bagKeySet];
  uint64_t v18 = [v15 profile];
  id v19 = [v15 profileVersion];
  [v16 registerBagKeySet:v17 forProfile:v18 profileVersion:v19];

  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F4DD18]) initWithBag:v15 clientIdentifier:v26 clientVersion:v12 placement:v13 serviceType:v14];
  id v21 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v22 = objc_msgSend(v21, "ams_activeiTunesAccount");
  [v20 setAccount:v22];

  objc_initWeak(&location, self);
  if (v27)
  {
    id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v20);
    [(IKJSObject *)self setJSValue:v27 forProperty:v23];
  }
  else
  {
    id v23 = 0;
  }
  v24 = [v20 perform];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  id v28[2] = __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke;
  v28[3] = &unk_1E6DE4A50;
  objc_copyWeak(&v30, &location);
  id v25 = v23;
  id v29 = v25;
  [v24 addFinishBlock:v28];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    uint64_t v9 = [WeakRetained appContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke_2;
    v10[3] = &unk_1E6DE4A28;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    id v13 = v5;
    [v9 evaluate:v10 completionBlock:0];

    objc_destroyWeak(&v14);
  }
}

void __42__IKJSITunesStore_fetchMarketingItem___::__block_invoke_2(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = [MEMORY[0x1E4F1CA98] null];
      v14[0] = v5;
      id v12 = @"message";
      id v6 = [*(id *)(a1 + 40) description];
      id v13 = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v14[1] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      id v9 = (id)[v4 callWithArguments:v8];
    }
    else
    {
      id v5 = [*(id *)(a1 + 48) rawValues];
      v11[0] = v5;
      id v6 = [MEMORY[0x1E4F1CA98] null];
      v11[1] = v6;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      id v10 = (id)[v4 callWithArguments:v7];
    }

    [v3 setJSValue:0 forProperty:*(void *)(a1 + 32)];
  }
}

- (void)openMarketingItem:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [(IKJSObject *)self appContext];
    objc_initWeak(&location, self);
    if (v10)
    {
      id v12 = [MEMORY[0x1E4F29128] UUID];
      id v13 = [v12 UUIDString];

      [(IKJSObject *)self setJSValue:v10 forProperty:v13];
    }
    else
    {
      id v13 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__IKJSITunesStore_openMarketingItem_::__block_invoke;
    v16[3] = &unk_1E6DE4AA0;
    id v14 = v11;
    id v17 = v14;
    id v18 = v8;
    id v19 = v9;
    objc_copyWeak(&v21, &location);
    id v15 = v13;
    id v20 = v15;
    [v14 evaluateDelegateBlockSync:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __39__IKJSITunesStore_openMarketingItem_::__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__IKJSITunesStore_openMarketingItem_::__block_invoke_2;
    v10[3] = &unk_1E6DE4A78;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v11 = *(id *)(a1 + 56);
    [v6 appContext:v7 openMarketingItem:v8 metricsOverlay:v9 completion:v10];

    objc_destroyWeak(&v12);
  }
}

void __39__IKJSITunesStore_openMarketingItem_::__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained appContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__IKJSITunesStore_openMarketingItem_::__block_invoke_3;
    v10[3] = &unk_1E6DE4A28;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    id v13 = v5;
    [v9 evaluate:v10 completionBlock:0];

    objc_destroyWeak(&v14);
  }
}

void __39__IKJSITunesStore_openMarketingItem_::__block_invoke_3(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = [MEMORY[0x1E4F1CA98] null];
      v14[0] = v5;
      id v12 = @"message";
      id v6 = [*(id *)(a1 + 40) description];
      id v13 = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v14[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      id v9 = (id)[v4 callWithArguments:v8];
    }
    else
    {
      id v5 = [*(id *)(a1 + 48) rawResponse];
      v11[0] = v5;
      id v6 = [MEMORY[0x1E4F1CA98] null];
      v11[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      id v10 = (id)[v4 callWithArguments:v7];
    }

    [v3 setJSValue:0 forProperty:*(void *)(a1 + 32)];
  }
}

- (void)openDynamicUIURL:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    if (v11)
    {
      id v12 = (void *)v11;
      id v13 = [(IKJSObject *)self appContext];
      objc_initWeak(&location, self);
      if (v10)
      {
        id v14 = [MEMORY[0x1E4F29128] UUID];
        id v15 = [v14 UUIDString];

        [(IKJSObject *)self setJSValue:v10 forProperty:v15];
      }
      else
      {
        id v15 = 0;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke;
      v19[3] = &unk_1E6DE4AA0;
      id v16 = v13;
      id v20 = v16;
      id v17 = v12;
      id v21 = v17;
      id v22 = v9;
      objc_copyWeak(&v24, &location);
      id v18 = v15;
      id v23 = v18;
      [v16 evaluateDelegateBlockSync:v19];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

void __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_2;
    v10[3] = &unk_1E6DE4A78;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v11 = *(id *)(a1 + 56);
    [v6 appContext:v7 openDynamicUIURL:v8 metricsOverlay:v9 completion:v10];

    objc_destroyWeak(&v12);
  }
}

void __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained appContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_3;
    v10[3] = &unk_1E6DE4A28;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    id v13 = v5;
    [v9 evaluate:v10 completionBlock:0];

    objc_destroyWeak(&v14);
  }
}

void __38__IKJSITunesStore_openDynamicUIURL_::__block_invoke_3(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained jsValueForProperty:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v5 = [MEMORY[0x1E4F1CA98] null];
      v14[0] = v5;
      id v12 = @"message";
      id v6 = [*(id *)(a1 + 40) description];
      id v13 = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v14[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      id v9 = (id)[v4 callWithArguments:v8];
    }
    else
    {
      id v5 = [*(id *)(a1 + 48) rawResponse];
      v11[0] = v5;
      id v6 = [MEMORY[0x1E4F1CA98] null];
      v11[1] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      id v10 = (id)[v4 callWithArguments:v7];
    }

    [v3 setJSValue:0 forProperty:*(void *)(a1 + 32)];
  }
}

- (NSString)DSID
{
  id v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v2 activeAccount];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (BOOL)isManagedAppleID
{
  id v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v2 activeAccount];
  char v4 = [v3 isManagedAppleID];

  return v4;
}

- (NSDictionary)accountInfo
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:7];
  id v3 = [MEMORY[0x1E4FA8100] defaultStore];
  char v4 = [v3 activeAccount];

  if (!v4) {
    goto LABEL_22;
  }
  id v5 = [v4 uniqueIdentifier];
  id v6 = [v5 stringValue];

  if (v6) {
    [v2 setObject:v6 forKey:@"DSID"];
  }
  uint64_t v7 = [v4 accountName];

  if (v7)
  {
    uint64_t v8 = [v4 accountName];
    [v2 setObject:v8 forKey:@"appleId"];
  }
  id v9 = [v4 storeFrontIdentifier];

  if (v9)
  {
    id v10 = [v4 storeFrontIdentifier];
    [v2 setObject:v10 forKey:@"storefront"];
  }
  id v11 = [v4 creditsString];

  if (v11)
  {
    id v12 = [v4 creditsString];
    [v2 setObject:v12 forKey:@"creditString"];
  }
  if (![v4 accountScope])
  {
    id v13 = @"production";
    goto LABEL_14;
  }
  if ([v4 accountScope] == 1)
  {
    id v13 = @"sandbox";
LABEL_14:
    [v2 setObject:v13 forKey:@"scope"];
  }
  if ([v4 isManagedAppleID])
  {
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isManagedAppleID"));
    [v2 setObject:v14 forKey:@"managedAppleId"];
  }
  id v15 = [v4 firstName];
  if (v15) {
    [v2 setObject:v15 forKey:@"firstName"];
  }
  id v16 = [v4 lastName];

  if (v16) {
    [v2 setObject:v16 forKey:@"lastName"];
  }

LABEL_22:
  return (NSDictionary *)v2;
}

- (void)authenticate:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FA8100] defaultStore];
  id v9 = [v8 activeAccount];

  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v9];
    [v10 setPromptStyle:1];
    [v10 setShouldCreateNewSession:1];
  }
  else
  {
    id v10 = [MEMORY[0x1E4FA8260] contextForSignIn];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v6 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setReasonDescription:v11];
    }
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v10];
  objc_initWeak(&location, self);
  if (v7)
  {
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v12);
    [(IKJSObject *)self setJSValue:v7 forProperty:v13];
  }
  else
  {
    id v13 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__IKJSITunesStore_authenticate::__block_invoke;
  v15[3] = &unk_1E6DE4AC8;
  objc_copyWeak(&v17, &location);
  id v14 = v13;
  id v16 = v14;
  [v12 startWithAuthenticateResponseBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __33__IKJSITunesStore_authenticate::__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v9 = [WeakRetained appContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__IKJSITunesStore_authenticate::__block_invoke_2;
    v10[3] = &unk_1E6DE49B0;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    id v11 = v5;
    id v12 = *(id *)(a1 + 32);
    [v9 evaluate:v10 completionBlock:0];

    objc_destroyWeak(&v13);
  }
}

void __33__IKJSITunesStore_authenticate::__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v4 = [*(id *)(a1 + 32) authenticateResponseType] == 4;
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 jsValueForProperty:*(void *)(a1 + 40)];

    id v7 = [NSNumber numberWithBool:v4];
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v9 = (id)[v6 callWithArguments:v8];

    [WeakRetained setJSValue:0 forProperty:*(void *)(a1 + 40)];
  }
}

- (void)signOut
{
  id v2 = [MEMORY[0x1E4FA8100] defaultStore];
  id v4 = [v2 activeAccount];

  if (v4 && ([v4 isManagedAppleID] & 1) == 0)
  {
    [v4 setActive:0];
    id v3 = [MEMORY[0x1E4FA8100] defaultStore];
    [v3 saveAccount:v4 error:0];
  }
}

- (void)_accountStoreChanged
{
  id v3 = [MEMORY[0x1E4FA8100] defaultStore];
  id v4 = [v3 activeAccount];
  obj = [v4 uniqueIdentifier];

  id v5 = obj;
  lastAccountDSID = self->_lastAccountDSID;
  if (lastAccountDSID != obj)
  {
    lastAccountDSID = (NSNumber *)[(NSNumber *)lastAccountDSID isEqual:obj];
    id v5 = obj;
    if ((lastAccountDSID & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastAccountDSID, obj);
      id v7 = [(IKJSObject *)self invokeMethod:@"onAccountChange" withArguments:0];
      uint64_t v8 = [MEMORY[0x1E4FA8370] sharedCoordinator];
      id v9 = [v8 lastKnownStatus];
      [(IKJSITunesStore *)self _subscriptionStatusDidChanged:v9];

      id v5 = obj;
    }
  }
  MEMORY[0x1F41817F8](lastAccountDSID, v5);
}

- (id)_subscriptionStatusDictionaryWithStatus:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [v5 accountIdentifier];
  if (v7) {
    [v6 setObject:v7 forKey:@"accountId"];
  }
  uint64_t v8 = [v5 sessionIdentifier];
  if (v8) {
    [v6 setObject:v8 forKey:@"sessionId"];
  }
  uint64_t v9 = [v5 accountStatus];
  id v10 = @"subscribed";
  id v11 = @"unknown";
  if (v9 == 2) {
    id v11 = @"notSubscribed";
  }
  if (v9 == 3)
  {
    unsigned int v12 = 1;
  }
  else
  {
    id v10 = v11;
    unsigned int v12 = 0;
  }
  if (v9 == 1) {
    id v13 = @"needsAuthentication";
  }
  else {
    id v13 = v10;
  }
  if (v9 == 1) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v12;
  }
  [v6 setObject:v13 forKey:@"accountStatus"];
  id v15 = [NSNumber numberWithBool:v14];
  [v6 setObject:v15 forKey:@"subscribed"];

  unint64_t v16 = [v5 carrierBundlingStatus];
  if (v16 <= 4) {
    [v6 setObject:off_1E6DE4AE8[v16] forKey:@"carrierBundle"];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = [MEMORY[0x1E4FA8340] sharedCoordinator];
  int v19 = [v18 isCurrentUserAdmin];

  if (v19)
  {
    [v17 addObject:@"post"];
    [v17 addObject:@"admin"];
    [v6 setObject:v17 forKey:@"permissions"];
  }
  id v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isDiscoveryModeEligible"));
  [v6 setObject:v20 forKey:@"discoveryMode"];

  id v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isFamilyOrganizer"));
  [v6 setObject:v21 forKey:@"familyOrganizer"];

  id v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isFamilySubscription"));
  [v6 setObject:v22 forKey:@"familySubscription"];

  id v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "hasFamily"));
  [v6 setObject:v23 forKey:@"hasFamily"];

  id v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "hasFamilyMembers"));
  [v6 setObject:v24 forKey:@"hasFamilyMembers"];

  id v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isSubscriptionPurchaser"));
  [v6 setObject:v25 forKey:@"isSubscriptionPurchaser"];

  id v26 = [NSNumber numberWithBool:v4];
  [v6 setObject:v26 forKey:@"isFinal"];

  id v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "acceptedStoreTermsVersion"));
  [v6 setObject:v27 forKey:@"acceptedStoreTermsVersion"];

  char v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "latestStoreTermsVersion"));
  [v6 setObject:v28 forKey:@"latestStoreTermsVersion"];

  id v29 = [v5 subscriptionExpirationDate];

  if (v29)
  {
    id v30 = [v5 subscriptionExpirationDate];
    [v6 setObject:v30 forKey:@"subscriptionExpirationDate"];
  }
  v31 = [v5 rawResponseData];
  if (v31) {
    [v6 setObject:v31 forKey:@"rawResponseData"];
  }

  return v6;
}

- (void)_subscriptionStatusDidChanged:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(IKJSITunesStore *)self _subscriptionStatusDictionaryWithStatus:a3 isFinal:1];
  if (([v4 isEqualToDictionary:self->_lastKnownStatusDictionary] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastKnownStatusDictionary, v4);
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v6 = [(IKJSObject *)self invokeMethod:@"onSubscriptionStatusDidChange" withArguments:v5];
  }
}

- (id)getBag
{
  id v3 = [(IKJSObject *)self jsValueForProperty:@"StoreURLBag"];
  BOOL v4 = [(IKJSITunesStore *)self bagCache];
  [v4 _loadWithNotification:1 completion:0];

  return v3;
}

- (void)invalidateBag
{
  id v2 = [(IKJSITunesStore *)self bagCache];
  [v2 updateWithInvalidation:1];
}

- (void)_bagCacheUpdated
{
  id v3 = [(IKJSITunesStore *)self bagCache];
  id v14 = [v3 valueForKey:*MEMORY[0x1E4FA88F8]];

  if ([v14 count])
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4FA8208]) initWithGlobalConfiguration:v14];
    objc_msgSend(v4, "setDisableEventDecoration:", objc_msgSend(v4, "_decorateITMLEvents") ^ 1);
    [(SSMetricsController *)self->_metricsController setGlobalConfiguration:v4];
    [(SSMetricsController *)self->_metricsController setFlushTimerEnabled:1];
  }
  id v5 = [(IKJSITunesStore *)self bagCache];
  id v6 = [v5 existingDictionary];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"storefront-header-suffix"];
    storeFrontSuffix = self->_storeFrontSuffix;
    self->_storeFrontSuffix = v7;

    uint64_t v9 = (void *)MEMORY[0x1E4F30938];
    id v10 = [(IKJSObject *)self appContext];
    id v11 = [v10 jsContext];
    unsigned int v12 = [v9 valueWithObject:v6 inContext:v11];

    [(IKJSObject *)self setJSValue:v12 forProperty:@"StoreURLBag"];
    id v13 = [(IKJSObject *)self invokeMethod:@"onBagChange" withArguments:0];
  }
}

- (NSString)cookieURL
{
  return self->_cookieURL;
}

- (IKURLBagCache)bagCache
{
  return self->_bagCache;
}

- (void)setBagCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagCache, 0);
  objc_storeStrong((id *)&self->_cookieURL, 0);
  objc_storeStrong(&self->_urlBagCacheUpdateToken, 0);
  objc_storeStrong(&self->_subscriptionStatusDidChangeToken, 0);
  objc_storeStrong(&self->_ssAccountStoreChangedToken, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_lastKnownStatusDictionary, 0);
  objc_storeStrong((id *)&self->_lastAccountDSID, 0);
}

@end