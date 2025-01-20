@interface IKURLBagCache
+ (id)URLBagContext;
+ (id)sharedCache;
- (BOOL)isExpired;
- (BOOL)isLoaded;
- (BOOL)isTrustedURL:(id)a3;
- (IKURLBagCache)init;
- (NSDate)expirationDate;
- (NSDictionary)existingDictionary;
- (NSString)cachePath;
- (NSString)profile;
- (NSString)profileVersion;
- (SSURLBag)urlBag;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4;
- (id)_urlForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (void)_loadWithNotification:(BOOL)a3 completion:(id)a4;
- (void)checkTrustStatusForURL:(id)a3 completion:(id)a4;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)init;
- (void)loadValueForKey:(id)a3 completion:(id)a4;
- (void)updateWithInvalidation:(BOOL)a3;
@end

@implementation IKURLBagCache

+ (id)sharedCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__IKURLBagCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, block);
  }
  v2 = (void *)sharedCache_inMemoryBagCache;
  return v2;
}

uint64_t __28__IKURLBagCache_sharedCache__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedCache_inMemoryBagCache;
  sharedCache_inMemoryBagCache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (IKURLBagCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)IKURLBagCache;
  v2 = [(IKURLBagCache *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4FA82F8];
    v4 = [(id)objc_opt_class() URLBagContext];
    uint64_t v5 = [v3 URLBagForContext:v4];
    urlBag = v2->_urlBag;
    v2->_urlBag = (SSURLBag *)v5;

    v7 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[IKURLBagCache init]();
    }

    [(IKURLBagCache *)v2 updateWithInvalidation:0];
  }
  return v2;
}

- (void)updateWithInvalidation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ITMLKitGetLogObject(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[IKURLBagCache updateWithInvalidation:]();
  }

  if (v3)
  {
    v6 = [(IKURLBagCache *)self urlBag];
    [v6 invalidate];
  }
  [(IKURLBagCache *)self _loadWithNotification:1 completion:0];
}

- (void)_loadWithNotification:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = [(IKURLBagCache *)self urlBag];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__IKURLBagCache__loadWithNotification_completion___block_invoke;
  v9[3] = &unk_1E6DE3E50;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a3;
  [v7 loadWithCompletionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__IKURLBagCache__loadWithNotification_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_19;
  }
  BOOL v9 = v5 == 0;
  if (!v5)
  {
    BOOL v12 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_2();
    }
    goto LABEL_9;
  }
  id v10 = [WeakRetained existingDictionary];
  char v11 = [v5 isEqualToDictionary:v10];

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = [v5 copy];
    v14 = (void *)v8[2];
    v8[2] = v13;

    BOOL v12 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1E2ACE000, v12, OS_LOG_TYPE_INFO, "URL Bag is different. Replacing current existing dictionary...", v20, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_10:
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15)
  {
    v16 = [v8 existingDictionary];
    (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v16, v6);
  }
  if (*(unsigned char *)(a1 + 48)) {
    char v17 = v9;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    v18 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_1(v18);
    }

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"IKURLBagCacheUpdatedNotification" object:v8];
  }
LABEL_19:
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__IKURLBagCache_valueForKey___block_invoke;
  v9[3] = &unk_1E6DE3E78;
  char v11 = &v12;
  id v6 = v5;
  id v10 = v6;
  [(IKURLBagCache *)self loadValueForKey:v4 completion:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __29__IKURLBagCache_valueForKey___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_urlForKey:(id)a3
{
  BOOL v3 = [(IKURLBagCache *)self valueForKey:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)loadValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__IKURLBagCache_loadValueForKey_completion___block_invoke;
  v10[3] = &unk_1E6DE3EA0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(IKURLBagCache *)self _loadWithNotification:1 completion:v10];
}

void __44__IKURLBagCache_loadValueForKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 valueForKey:*(void *)(a1 + 32)];
  if (!v6)
  {
    id v7 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__IKURLBagCache_loadValueForKey_completion___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v6, v5);
  }
}

- (BOOL)isTrustedURL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__IKURLBagCache_isTrustedURL___block_invoke;
  v8[3] = &unk_1E6DE3EC8;
  id v10 = &v11;
  id v6 = v5;
  id v9 = v6;
  [(IKURLBagCache *)self checkTrustStatusForURL:v4 completion:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

intptr_t __30__IKURLBagCache_isTrustedURL___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)checkTrustStatusForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IKURLBagCache *)self urlBag];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke;
  v11[3] = &unk_1E6DE3EF0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getTrustForURL:v10 completionBlock:v11];
}

void __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

+ (id)URLBagContext
{
  v2 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  BOOL v3 = [MEMORY[0x1E4FA8140] currentDevice];
  id v4 = [v3 userAgent];
  [v2 setValue:v4 forHTTPHeaderField:*MEMORY[0x1E4FA8698]];

  return v2;
}

- (NSDate)expirationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] distantFuture];
}

- (BOOL)isExpired
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)profile
{
  return (NSString *)@"IKAMSBagShim";
}

- (NSString)profileVersion
{
  return (NSString *)@"1";
}

- (id)URLForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:5];
}

- (id)arrayForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:0];
}

- (id)BOOLForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:1];
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke;
  v6[3] = &unk_1E6DE3F18;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(IKURLBagCache *)self _loadWithNotification:1 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    char v14 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_1(v14);
    }
    goto LABEL_10;
  }
  if (!v5)
  {
    char v14 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_2();
    }
LABEL_10:

    uint64_t v15 = *(void *)(a1 + 32);
    AMSError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v8);
    goto LABEL_15;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4DE28]);
  [v8 setData:v5];
  id v9 = [WeakRetained expirationDate];
  [v8 setExpirationDate:v9];

  id v10 = [WeakRetained profile];
  [v8 setProfile:v10];

  uint64_t v11 = [WeakRetained profileVersion];
  [v8 setProfileVersion:v11];

  id v19 = 0;
  id v12 = [v8 buildWithError:&v19];
  id v13 = v19;
  if (v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v16 = ITMLKitGetLogObject(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_3();
    }

    uint64_t v17 = *(void *)(a1 + 32);
    v18 = AMSError();
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
  }
LABEL_15:
}

- (id)dictionaryForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:6];
}

- (id)doubleForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:2];
}

- (id)integerForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:3];
}

- (id)stringForKey:(id)a3
{
  return [(IKURLBagCache *)self _bagValueForKey:a3 valueType:4];
}

- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 5) {
    [(IKURLBagCache *)self _urlForKey:v6];
  }
  else {
  id v7 = [(IKURLBagCache *)self valueForKey:v6];
  }
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F4DBE8] frozenBagValueWithKey:v6 value:v7 valueType:a4];
  }
  else
  {
    id v9 = AMSErrorWithFormat();
    id v8 = objc_msgSend(MEMORY[0x1E4F4DBE8], "failingBagValueWithKey:valueType:error:", v6, a4, v9, v6);
  }
  return v8;
}

- (SSURLBag)urlBag
{
  return self->_urlBag;
}

- (NSDictionary)existingDictionary
{
  return self->_existingDictionary;
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_existingDictionary, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1E2ACE000, v0, OS_LOG_TYPE_DEBUG, "Started %@ and sending first update...", v1, 0xCu);
}

- (void)updateWithInvalidation:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1E2ACE000, v1, OS_LOG_TYPE_DEBUG, "Update bag cache (%@) with invalidation: %@", v2, 0x16u);
}

void __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_DEBUG, "Posting bag update notification...", v1, 2u);
}

void __50__IKURLBagCache__loadWithNotification_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1E2ACE000, v0, v1, "Unable to fetch URL Bag: %@", v2, v3, v4, v5, v6);
}

void __44__IKURLBagCache_loadValueForKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1E2ACE000, v0, v1, "Error fetching %@ in URL Bag: %@");
}

void __51__IKURLBagCache_checkTrustStatusForURL_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1E2ACE000, v0, v1, "Error getting trust status for URL (%@): %@");
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_ERROR, "Someone called -[AMSBag createSnapshotWithCompletion:] but didn't hold onto a reference to the original AMSBag.", v1, 2u);
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1E2ACE000, v0, v1, "Failed to load the bag. Unable to create a snapshot. error = %{public}@", v2, v3, v4, v5, v6);
}

void __46__IKURLBagCache_createSnapshotWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1E2ACE000, v0, v1, "Failed to create the snapshot. error = %{public}@", v2, v3, v4, v5, v6);
}

@end