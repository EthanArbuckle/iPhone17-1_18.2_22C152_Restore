@interface CSLPRFIconFetcher
- (BOOL)hasPendingRequestsForBundleID:(id)a3;
- (CSLPRFIconCache)iconCache;
- (CSLPRFIconFetcher)init;
- (CSLPRFIconFetcher)initWithIconCache:(id)a3;
- (UIImage)genericIcon;
- (id)iconFetchTaskForBundleIdentifier:(id)a3 completion:(id)a4;
- (id)iconFetchTaskForBundleIdentifier:(id)a3 isPhoneApp:(BOOL)a4 completion:(id)a5;
- (void)_completeLoadForBundleID:(id)a3 image:(id)a4 error:(id)a5;
- (void)_insertTask:(id)a3 forBundleID:(id)a4;
- (void)_loadIconForBundleIdentifier:(id)a3 isPhoneApp:(BOOL)a4;
- (void)_loadNanoIconForBundleIdentifier:(id)a3;
@end

@implementation CSLPRFIconFetcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_genericIcon, 0);
  objc_storeStrong((id *)&self->_tasksByBundleID, 0);
}

- (CSLPRFIconCache)iconCache
{
  return self->_iconCache;
}

- (void)_completeLoadForBundleID:(id)a3 image:(id)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v11 = [(NSMutableDictionary *)self->_tasksByBundleID objectForKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_tasksByBundleID setObject:0 forKeyedSubscript:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "completeWithImage:error:", v9, v10, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_insertTask:(id)a3 forBundleID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_tasksByBundleID objectForKeyedSubscript:v6];
  if (!v7)
  {
    v7 = [MEMORY[0x263EFF980] array];
    [(NSMutableDictionary *)self->_tasksByBundleID setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (BOOL)hasPendingRequestsForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_tasksByBundleID objectForKeyedSubscript:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_loadNanoIconForBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x263F82B60] mainScreen];
  id v6 = [v5 traitCollection];
  [v6 displayScale];
  double v8 = v7;

  id v9 = [MEMORY[0x263F57788] sharedInstance];
  if (v8 <= 2.0) {
    uint64_t v10 = 47;
  }
  else {
    uint64_t v10 = 48;
  }
  v11 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__CSLPRFIconFetcher__loadNanoIconForBundleIdentifier___block_invoke;
  v13[3] = &unk_264A0B548;
  objc_copyWeak(&v15, &location);
  id v12 = v4;
  id v14 = v12;
  [v9 getIconForBundleID:v12 iconVariant:v10 queue:v11 block:v13 timeout:60.0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __54__CSLPRFIconFetcher__loadNanoIconForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = [WeakRetained iconCache];
      [v6 setIcon:v3 forName:*(void *)(a1 + 32)];

      double v7 = 0;
    }
    else
    {
      double v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:-1 userInfo:0];
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__CSLPRFIconFetcher__loadNanoIconForBundleIdentifier___block_invoke_2;
    v9[3] = &unk_264A0AF70;
    v9[4] = v5;
    id v10 = *(id *)(a1 + 32);
    id v11 = v3;
    id v12 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __54__CSLPRFIconFetcher__loadNanoIconForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeLoadForBundleID:*(void *)(a1 + 40) image:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_loadIconForBundleIdentifier:(id)a3 isPhoneApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v6];
    id v8 = [MEMORY[0x263F82B60] mainScreen];
    id v9 = [v8 traitCollection];
    [v9 displayScale];
    double v11 = v10;

    if (v11 <= 2.0) {
      double v12 = 2.0;
    }
    else {
      double v12 = 3.0;
    }
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 29.0, 29.0, v12);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__CSLPRFIconFetcher__loadIconForBundleIdentifier_isPhoneApp___block_invoke;
    v14[3] = &unk_264A0AF48;
    double v16 = v12;
    v14[4] = self;
    id v15 = v6;
    [v7 getImageForImageDescriptor:v13 completion:v14];
  }
  else
  {
    [(CSLPRFIconFetcher *)self _loadNanoIconForBundleIdentifier:v6];
  }
}

void __61__CSLPRFIconFetcher__loadIconForBundleIdentifier_isPhoneApp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  BSDispatchMain();
}

void __61__CSLPRFIconFetcher__loadIconForBundleIdentifier_isPhoneApp___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) CGImage])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:scale:orientation:", objc_msgSend(*(id *)(a1 + 32), "CGImage"), 0, *(double *)(a1 + 56));
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v8 = (id)v2;
    uint64_t v5 = 0;
  }
  else
  {
    double v7 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:-1 userInfo:0];
    id v3 = v7;
    uint64_t v4 = v6;
    uint64_t v2 = 0;
    id v8 = (id)v5;
  }
  [v3 _completeLoadForBundleID:v4 image:v2 error:v5];
}

- (id)iconFetchTaskForBundleIdentifier:(id)a3 isPhoneApp:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v10 = [(CSLPRFIconFetcher *)self hasPendingRequestsForBundleID:v8];
  double v11 = objc_alloc_init(CSLPRFIconFetchTask);
  [(CSLPRFIconFetchTask *)v11 setCompletion:v9];

  [(CSLPRFIconFetcher *)self _insertTask:v11 forBundleID:v8];
  double v12 = [(CSLPRFIconFetcher *)self iconCache];
  uint64_t v13 = [v12 iconForName:v8 fallBackToPersistentStoreIfNecessary:0];

  if (v13)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__CSLPRFIconFetcher_iconFetchTaskForBundleIdentifier_isPhoneApp_completion___block_invoke;
    block[3] = &unk_264A0BAB0;
    block[4] = self;
    id v17 = v8;
    id v18 = v13;
    id v14 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if (!v10)
  {
    [(CSLPRFIconFetcher *)self _loadIconForBundleIdentifier:v8 isPhoneApp:v6];
  }

  return v11;
}

uint64_t __76__CSLPRFIconFetcher_iconFetchTaskForBundleIdentifier_isPhoneApp_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeLoadForBundleID:*(void *)(a1 + 40) image:*(void *)(a1 + 48) error:0];
}

- (id)iconFetchTaskForBundleIdentifier:(id)a3 completion:(id)a4
{
  return [(CSLPRFIconFetcher *)self iconFetchTaskForBundleIdentifier:a3 isPhoneApp:0 completion:a4];
}

- (UIImage)genericIcon
{
  genericIcon = self->_genericIcon;
  if (!genericIcon)
  {
    uint64_t v4 = [MEMORY[0x263F4B540] genericApplicationIcon];
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 29.0, 29.0, 2.0);
    uint64_t v6 = [v4 CGImageForDescriptor:v5];
    id v7 = objc_alloc(MEMORY[0x263F827E8]);
    [v5 scale];
    id v8 = (UIImage *)objc_msgSend(v7, "initWithCGImage:scale:orientation:", v6, 0);
    id v9 = self->_genericIcon;
    self->_genericIcon = v8;

    genericIcon = self->_genericIcon;
  }
  return genericIcon;
}

- (CSLPRFIconFetcher)initWithIconCache:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFIconFetcher;
  uint64_t v6 = [(CSLPRFIconFetcher *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconCache, a3);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    tasksByBundleID = v7->_tasksByBundleID;
    v7->_tasksByBundleID = v8;
  }
  return v7;
}

- (CSLPRFIconFetcher)init
{
  id v3 = +[CSLPRFIconCache sharedIconCache];
  uint64_t v4 = [(CSLPRFIconFetcher *)self initWithIconCache:v3];

  return v4;
}

@end