@interface HKSourceListDataSource
+ (id)_builtinIconFetchTransformer;
+ (id)_builtinInstallationStatusTransformer;
+ (id)_builtinPurposeStringsFetchTransformer;
+ (void)_performTransformations:(id)a3 model:(id)a4 completion:(id)a5;
+ (void)_remoteWatchAppPurposeStringsForBundleIdentifier:(id)a3 completion:(id)a4;
+ (void)fetchIconForSource:(id)a3 completion:(id)a4;
- (BOOL)deliverUpdates;
- (BOOL)shouldFetchAppIcons;
- (BOOL)shouldFetchAppInstallationStatus;
- (BOOL)shouldFetchPurposeStrings;
- (BOOL)shouldIncludeSpecialSources;
- (HKHealthStore)healthStore;
- (HKSourceListDataModel)sources;
- (HKSourceListDataSource)initWithHealthStore:(id)a3;
- (HKSourceListDataSource)initWithHealthStore:(id)a3 queue:(id)a4;
- (HKSourceListDataSource)initWithHealthStore:(id)a3 sources:(id)a4 queue:(id)a5;
- (id)_specialAppBundleIdentifiers;
- (id)fetchFilteredSourcesWithAuthorizationRecordsForSources:(id)a3;
- (void)_didFetchSources:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_fakeSourceForInstalledAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_notifyObserversForDataSourceUpdate;
- (void)_prependBuiltinTransformers;
- (void)_throttledNotificationOfDataSourceUpdate;
- (void)addFetchTransformer:(id)a3;
- (void)dealloc;
- (void)fetchModelForSources:(id)a3 completion:(id)a4;
- (void)fetchSources;
- (void)invalidate;
- (void)registerObserver:(id)a3;
- (void)setDeliverUpdates:(BOOL)a3;
- (void)setShouldFetchAppIcons:(BOOL)a3;
- (void)setShouldFetchAppInstallationStatus:(BOOL)a3;
- (void)setShouldFetchPurposeStrings:(BOOL)a3;
- (void)setShouldIncludeSpecialSources:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKSourceListDataSource

- (HKSourceListDataSource)initWithHealthStore:(id)a3
{
  return [(HKSourceListDataSource *)self initWithHealthStore:a3 queue:MEMORY[0x1E4F14428]];
}

- (HKSourceListDataSource)initWithHealthStore:(id)a3 queue:(id)a4
{
  return [(HKSourceListDataSource *)self initWithHealthStore:a3 sources:0 queue:a4];
}

- (HKSourceListDataSource)initWithHealthStore:(id)a3 sources:(id)a4 queue:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 61, @"Invalid parameter not satisfying: %@", @"healthStore != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 62, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)HKSourceListDataSource;
  v14 = [(HKSourceListDataSource *)&v32 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_healthStore, a3);
    objc_storeStrong((id *)&v15->_mainQueue, a5);
    uint64_t v16 = [v11 copy];
    rawSources = v15->_rawSources;
    v15->_rawSources = (NSArray *)v16;

    uint64_t v18 = HKCreateSerialDispatchQueueWithQOSClass();
    resultsQueue = v15->_resultsQueue;
    v15->_resultsQueue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transformers = v15->_transformers;
    v15->_transformers = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    followupTransformers = v15->_followupTransformers;
    v15->_followupTransformers = v22;

    id v24 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = [v24 initWithName:v26 loggingCategory:*MEMORY[0x1E4F29FB0]];
    observers = v15->_observers;
    v15->_observers = (HKSynchronousObserverSet *)v27;

    v15->_deliverUpdates = 0;
    v15->_notifyToken = -1;
    *(_DWORD *)&v15->_shouldFetchAppInstallationStatus = 1;
  }

  return v15;
}

- (void)dealloc
{
  [(HKSourceListDataSource *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HKSourceListDataSource;
  [(HKSourceListDataSource *)&v3 dealloc];
}

- (void)invalidate
{
  atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
  observers = self->_observers;
  self->_observers = 0;

  transformers = self->_transformers;
  self->_transformers = 0;

  followupTransformers = self->_followupTransformers;
  self->_followupTransformers = 0;

  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
  }
}

- (void)setDeliverUpdates:(BOOL)a3
{
  if (self->_hasInitiatedFetch)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 100, @"Invalid parameter not satisfying: %@", @"_hasInitiatedFetch == NO" object file lineNumber description];
  }
  self->_deliverUpdates = a3;
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)fetchSources
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to register for %s", (uint8_t *)&v2, 0xCu);
}

void __38__HKSourceListDataSource_fetchSources__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchSources];
}

void __38__HKSourceListDataSource_fetchSources__block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _didFetchSources:v6 error:v5 completion:0];
}

+ (void)fetchIconForSource:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [[HKSourceDataModel alloc] initWithSource:v7];

  v9 = [a1 _builtinIconFetchTransformer];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HKSourceListDataSource_fetchIconForSource_completion___block_invoke;
  v12[3] = &unk_1E6D56DE8;
  id v13 = v6;
  id v11 = v6;
  [a1 _performTransformations:v10 model:v8 completion:v12];
}

void __56__HKSourceListDataSource_fetchIconForSource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 icon];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fetchModelForSources:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (self->_deliverUpdates)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 157, @"Invalid parameter not satisfying: %@", @"_deliverUpdates == NO" object file lineNumber description];
  }
  if (!self->_hasInitiatedFetch)
  {
    self->_hasInitiatedFetch = 1;
    [(HKSourceListDataSource *)self _prependBuiltinTransformers];
  }
  [(HKSourceListDataSource *)self _didFetchSources:v9 error:0 completion:v7];
}

- (void)setShouldFetchAppInstallationStatus:(BOOL)a3
{
  if (self->_hasInitiatedFetch)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 168, @"Invalid parameter not satisfying: %@", @"_hasInitiatedFetch == NO" object file lineNumber description];
  }
  self->_shouldFetchAppInstallationStatus = a3;
}

- (void)setShouldFetchAppIcons:(BOOL)a3
{
  if (self->_hasInitiatedFetch)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 174, @"Invalid parameter not satisfying: %@", @"_hasInitiatedFetch == NO" object file lineNumber description];
  }
  self->_shouldFetchAppIcons = a3;
}

- (void)setShouldFetchPurposeStrings:(BOOL)a3
{
  if (self->_hasInitiatedFetch)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 180, @"Invalid parameter not satisfying: %@", @"_hasInitiatedFetch == NO" object file lineNumber description];
  }
  self->_shouldFetchPurposeStrings = a3;
}

- (void)setShouldIncludeSpecialSources:(BOOL)a3
{
  if (self->_hasInitiatedFetch)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 186, @"Invalid parameter not satisfying: %@", @"_hasInitiatedFetch == NO" object file lineNumber description];
  }
  self->_shouldIncludeSpecialSources = a3;
}

- (void)addFetchTransformer:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (self->_hasInitiatedFetch)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKSourceListDataSource.m", 192, @"Invalid parameter not satisfying: %@", @"_hasInitiatedFetch == NO" object file lineNumber description];

    id v5 = v10;
  }
  transformers = self->_transformers;
  id v7 = (void *)[v5 copy];
  v8 = _Block_copy(v7);
  [(NSMutableArray *)transformers addObject:v8];
}

+ (id)_builtinInstallationStatusTransformer
{
  return &__block_literal_global_88;
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 source];
  id v7 = [MEMORY[0x1E4F2B568] bundleIdentifierForInstallationStatusForSource:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 bundleIdentifier];
  }
  id v10 = v9;

  if ([v6 _isApplication] && (objc_msgSend(v6, "_isSiri") & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    objc_msgSend(v4, "setInstalled:", objc_msgSend(v11, "applicationIsInstalled:", v10));

    if (![v4 installed])
    {
      id v12 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2;
      v13[3] = &unk_1E6D56E30;
      id v14 = v4;
      id v15 = v10;
      id v16 = v5;
      [v12 applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:v15 completion:v13];

      goto LABEL_8;
    }
  }
  else
  {
    [v4 setInstalled:1];
  }
  (*((void (**)(id, id))v5 + 2))(v5, v4);
LABEL_8:
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [a1[4] setInstalled:a2];
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2_cold_1();
    }
  }
  if ([a1[4] installed])
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_316;
    v8[3] = &unk_1E6D56E30;
    id v7 = a1[5];
    id v9 = a1[4];
    id v10 = a1[5];
    id v11 = a1[6];
    [v6 applicationIsInstalledOnAnyPairedDeviceWithBundleID:v7 completion:v8];
  }
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_316(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setInstalled:a2];
  if (v5)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_316_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)_builtinIconFetchTransformer
{
  return &__block_literal_global_319_0;
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 source];
  if ([v6 _isSiri])
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:@"com.apple.siri"];
    v8 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
    id v9 = [v7 prepareImageForDescriptor:v8];
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", objc_msgSend(v9, "CGImage"));
    [v4 setIcon:v10];

    v5[2](v5, v4);
LABEL_3:

    goto LABEL_19;
  }
  if ([v6 _isResearchStudy])
  {
    id v11 = [v4 source];
    id v33 = 0;
    v8 = [v11 _fetchBundleWithError:&v33];
    id v7 = v33;

    if (v8)
    {
      id v12 = [MEMORY[0x1E4FB1818] imageNamed:@"Icon" inBundle:v8 compatibleWithTraitCollection:0];
      id v13 = objc_msgSend(v12, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);

      if (v13)
      {
        [v4 setIcon:v13];
        id v14 = [v4 source];
        id v15 = [v14 bundleIdentifier];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_329;
        block[3] = &unk_1E6D513B0;
        id v31 = v13;
        id v32 = v15;
        id v16 = v15;
        id v9 = v13;
        dispatch_async(MEMORY[0x1E4F14428], block);
        v5[2](v5, v4);

        goto LABEL_3;
      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_cold_1(v17, v4);
      }
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F2B568] bundleIdentifierForIconForSource:v6];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [v6 bundleIdentifier];
  }
  id v7 = v20;

  if ([v4 installed])
  {
    v21 = (void *)MEMORY[0x1E4FB1818];
    v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v22 scale];
    v23 = objc_msgSend(v21, "_applicationIconImageForBundleIdentifier:format:scale:", v7, 0);
    [v4 setIcon:v23];
  }
  id v24 = [v4 icon];

  if (v24)
  {
    v5[2](v5, v4);
  }
  else
  {
    v25 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2;
    v26[3] = &unk_1E6D56E80;
    id v27 = v7;
    id v28 = v4;
    v29 = v5;
    [v25 fetchWatchAppBundleIDForCompanionAppBundleID:v27 completion:v26];
  }
LABEL_19:
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_329(uint64_t a1)
{
  id v2 = +[HKAppImageManager sharedImageManager];
  [v2 cacheAppIcon:*(void *)(a1 + 32) forIdentifier:*(void *)(a1 + 40)];
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_cold_1();
    }
  }
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  id v10 = [MEMORY[0x1E4F79F10] sharedInstance];
  id v11 = *(void **)(a1 + 32);
  if (v5) {
    id v12 = v5;
  }
  else {
    id v12 = *(id *)(a1 + 32);
  }
  if (v9 <= 2.0) {
    uint64_t v13 = 47;
  }
  else {
    uint64_t v13 = 48;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_334;
  v14[3] = &unk_1E6D56E58;
  id v15 = v11;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  [v10 getIconForBundleID:v12 iconVariant:v13 block:v14 timeout:-1.0];
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_334(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_335;
    double v8 = &unk_1E6D513B0;
    id v9 = v3;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], &v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "setIcon:", v4, v5, v6, v7, v8);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_335(uint64_t a1)
{
  id v2 = +[HKAppImageManager sharedImageManager];
  [v2 cacheAppIcon:*(void *)(a1 + 32) forIdentifier:*(void *)(a1 + 40)];
}

+ (id)_builtinPurposeStringsFetchTransformer
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke;
  aBlock[3] = &__block_descriptor_40_e56_v24__0__HKSourceDataModel_8___v____HKSourceDataModel__16l;
  aBlock[4] = a1;
  id v2 = _Block_copy(aBlock);
  return v2;
}

void __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v41[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id v7 = [v5 source];
  if ([v7 _isApplication]) {
    int v8 = 0;
  }
  else {
    int v8 = [v7 _isResearchStudy] ^ 1;
  }
  if (![v5 installed] || v8)
  {
    v6[2](v6, v5);
  }
  else
  {
    id v35 = 0;
    id v9 = [v7 _fetchBundleWithError:&v35];
    id v10 = v35;
    id v11 = v10;
    if (v9)
    {
      id v25 = v10;
      v26 = v6;
      v41[0] = @"NSHealthUpdateUsageDescription";
      v41[1] = @"NSHealthShareUsageDescription";
      v41[2] = @"NSHealthResearchStudyUsageDescription";
      v41[3] = @"NSHealthClinicalHealthRecordsShareUsageDescription";
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            id v20 = [v9 objectForInfoDictionaryKey:v19];
            [v13 setObject:v20 forKeyedSubscript:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v16);
      }

      v21 = (void *)[v13 copy];
      [v5 setPurposeStrings:v21];

      uint64_t v6 = v26;
      v26[2](v26, v5);

      id v11 = v25;
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v7;
        __int16 v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_1E0B26000, v22, OS_LOG_TYPE_DEFAULT, "No bundle found for source %@, falling back to remote paired Watch. Bundle fetch error: %@", buf, 0x16u);
      }
      v23 = *(void **)(a1 + 32);
      id v24 = [v7 bundleIdentifier];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_339;
      v27[3] = &unk_1E6D56EA8;
      id v28 = v7;
      v30 = v6;
      id v29 = v5;
      [v23 _remoteWatchAppPurposeStringsForBundleIdentifier:v24 completion:v27];

      id v14 = v28;
    }
  }
}

void __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_339(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)[a2 copy];
    [*(id *)(a1 + 40) setPurposeStrings:v6];
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_339_cold_1(a1, (uint64_t)v5, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_prependBuiltinTransformers
{
  if (self->_shouldFetchAppInstallationStatus)
  {
    transformers = self->_transformers;
    id v4 = [(id)objc_opt_class() _builtinInstallationStatusTransformer];
    [(NSMutableArray *)transformers insertObject:v4 atIndex:0];
  }
  if (self->_shouldFetchAppIcons)
  {
    followupTransformers = self->_followupTransformers;
    uint64_t v6 = [(id)objc_opt_class() _builtinIconFetchTransformer];
    [(NSMutableArray *)followupTransformers addObject:v6];
  }
  if (self->_shouldFetchPurposeStrings)
  {
    id v7 = self->_followupTransformers;
    id v8 = [(id)objc_opt_class() _builtinPurposeStringsFetchTransformer];
    [(NSMutableArray *)v7 addObject:v8];
  }
}

+ (void)_performTransformations:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [v8 firstObject];
    id v12 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__HKSourceListDataSource__performTransformations_model_completion___block_invoke;
    v15[3] = &unk_1E6D56EF0;
    id v18 = a1;
    id v16 = v12;
    id v17 = v10;
    id v13 = (void (*)(void *, id, void *))v11[2];
    id v14 = v12;
    v13(v11, v9, v15);
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }
}

uint64_t __67__HKSourceListDataSource__performTransformations_model_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 48) _performTransformations:*(void *)(a1 + 32) model:a2 completion:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_didFetchSources:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = *MEMORY[0x1E4F29F28];
  if (v8)
  {
    long long v33 = v10;
    id v34 = v9;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      id v13 = objc_opt_class();
      id v14 = v13;
      *(_DWORD *)buf = 138543618;
      v57 = v13;
      __int16 v58 = 2048;
      uint64_t v59 = [v8 count];
      _os_log_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: successfully fetched %lu sources", buf, 0x16u);
    }
    uint64_t v15 = dispatch_group_create();
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v35 = v8;
    if (self->_shouldIncludeSpecialSources)
    {
      id v17 = [(HKSourceListDataSource *)self _specialAppBundleIdentifiers];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v51 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            dispatch_group_enter(v15);
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke;
            v47[3] = &unk_1E6D56F18;
            v47[4] = self;
            id v48 = v16;
            v49 = v15;
            [(HKSourceListDataSource *)self _fakeSourceForInstalledAppWithBundleIdentifier:v22 completion:v47];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v19);
      }

      id v8 = v35;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v8;
    uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          dispatch_group_enter(v15);
          id v28 = [[HKSourceDataModel alloc] initWithSource:v27];
          id v29 = (void *)[(NSMutableArray *)self->_transformers mutableCopy];
          v30 = objc_opt_class();
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3;
          v40[3] = &unk_1E6D56F18;
          v40[4] = self;
          id v41 = v16;
          v42 = v15;
          [v30 _performTransformations:v29 model:v28 completion:v40];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v24);
    }

    resultsQueue = self->_resultsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_5;
    block[3] = &unk_1E6D51340;
    void block[4] = self;
    id v38 = v16;
    id v10 = v33;
    id v39 = v33;
    id v32 = v16;
    dispatch_group_notify(v15, resultsQueue, block);

    id v9 = v34;
    id v8 = v35;
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    -[HKSourceListDataSource _didFetchSources:error:completion:](v11);
  }
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2;
    v5[3] = &unk_1E6D513B0;
    id v6 = *(id *)(a1 + 40);
    id v7 = v3;
    dispatch_sync(v4, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4;
    v5[3] = &unk_1E6D513B0;
    id v6 = *(id *)(a1 + 40);
    id v7 = v3;
    dispatch_sync(v4, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v2 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)buf = 138543362;
    id v40 = (id)objc_opt_class();
    id v4 = v40;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: finished transforming fetched sources", buf, 0xCu);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = *(void **)(a1 + 40);
  id v7 = (void *)MEMORY[0x1E4F28F60];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_343;
  v36[3] = &unk_1E6D56F40;
  id v24 = v5;
  id v37 = v24;
  id v8 = [v7 predicateWithBlock:v36];
  [v6 filterUsingPredicate:v8];

  id v9 = [[HKSourceListDataModel alloc] initWithSourceModels:*(void *)(a1 + 40)];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2_346;
  block[3] = &unk_1E6D51340;
  void block[4] = v10;
  id v12 = v9;
  id v34 = v12;
  id v35 = *(id *)(a1 + 48);
  dispatch_async(v11, block);
  uint64_t v23 = v12;
  id v13 = (void *)[(HKSourceListDataModel *)v12 copy];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [v13 allSources];
  uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * v17);
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3_347;
        v26[3] = &unk_1E6D56F68;
        id v21 = v13;
        uint64_t v22 = *(void *)(a1 + 32);
        id v27 = v21;
        uint64_t v28 = v22;
        [v19 _performTransformations:v20 model:v18 completion:v26];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }
}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_343(uint64_t a1, void *a2)
{
  id v3 = [a2 source];
  id v4 = [v3 bundleIdentifier];

  int v5 = [*(id *)(a1 + 32) containsObject:v4];
  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return v5 ^ 1u;
}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_2_346(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _notifyObserversForDataSourceUpdate];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_3_347(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4_348;
  v6[3] = &unk_1E6D513B0;
  v6[4] = v3;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, v6);
}

uint64_t __60__HKSourceListDataSource__didFetchSources_error_completion___block_invoke_4_348(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  return [v2 _throttledNotificationOfDataSourceUpdate];
}

- (void)_notifyObserversForDataSourceUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = objc_opt_class();
    observers = self->_observers;
    *(_DWORD *)buf = 138543618;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = observers;
    id v7 = v5;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: notifying observers via sourceListDataSourceDidUpdate: %@", buf, 0x16u);
  }
  id v8 = self->_observers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKSourceListDataSource__notifyObserversForDataSourceUpdate__block_invoke;
  v9[3] = &unk_1E6D56F90;
  v9[4] = self;
  [(HKSynchronousObserverSet *)v8 notifyObservers:v9];
}

uint64_t __61__HKSourceListDataSource__notifyObserversForDataSourceUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sourceListDataSourceDidUpdate:*(void *)(a1 + 32)];
}

- (void)_throttledNotificationOfDataSourceUpdate
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(HKSourceListDataSource *)self performSelector:sel__notifyObserversForDataSourceUpdate withObject:0 afterDelay:0.25];
}

+ (void)_remoteWatchAppPurposeStringsForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F4AC68];
  id v7 = a3;
  id v8 = [v6 sharedDeviceConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E6D56FE0;
  id v11 = v5;
  id v9 = v5;
  [v8 fetchWatchAppBundleIDForCompanionAppBundleID:v7 completion:v10];
}

void __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke_2;
    v7[3] = &unk_1E6D56FB8;
    id v8 = *(id *)(a1 + 32);
    [v6 fetchApplicationOnPairedDevice:0 withBundleID:v5 completion:v7];
  }
}

void __86__HKSourceListDataSource__remoteWatchAppPurposeStringsForBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "setWithObjects:", @"NSHealthShareUsageDescription", @"NSHealthUpdateUsageDescription", 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v9 = [v7 localizedInfoPlistStringsForKeys:v10 fetchingFirstMatchingLocalizationInList:v8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_specialAppBundleIdentifiers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2BF78];
  v5[0] = *MEMORY[0x1E4F2BCE0];
  v5[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (void)_fakeSourceForInstalledAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F2B560]) _init];
  [v8 _setBundleIdentifier:v6];
  [v8 _setOptions:5];
  id v9 = [[HKSourceDataModel alloc] initWithSource:v8];
  id v10 = objc_opt_class();
  id v11 = (void *)[(NSMutableArray *)self->_transformers copy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__HKSourceListDataSource__fakeSourceForInstalledAppWithBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6D57008;
  uint64_t v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = v9;
  [v10 _performTransformations:v11 model:v14 completion:v15];
}

void __84__HKSourceListDataSource__fakeSourceForInstalledAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) installed])
  {
    id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v3 = *(void *)(a1 + 40);
    id v9 = 0;
    id v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
    id v5 = v9;
    if (!v5)
    {
      id v7 = [*(id *)(a1 + 32) source];
      id v8 = [v4 localizedName];
      [v7 _setName:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (id)fetchFilteredSourcesWithAuthorizationRecordsForSources:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F2AC68]);
  id v6 = [(HKSourceListDataSource *)self healthStore];
  id v21 = (void *)[v5 initWithHealthStore:v6];

  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__27;
  long long v33 = __Block_byref_object_dispose__27;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = [v12 source];
        if ([v13 _isSiri])
        {
          [(id)v30[5] addObject:v12];
        }
        else
        {
          uint64_t v14 = [v13 bundleIdentifier];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke;
          v22[3] = &unk_1E6D57058;
          id v24 = &v29;
          v22[4] = self;
          v22[5] = v12;
          uint64_t v15 = v7;
          uint64_t v23 = v15;
          [v21 fetchAuthorizationRecordsForBundleIdentifier:v14 completion:v22];

          dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v9);
  }

  _HKInitializeLogging();
  uint64_t v16 = (id)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v36 = v17;
    id v18 = v17;
    _os_log_impl(&dword_1E0B26000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully returned the list of sources", buf, 0xCu);
  }
  id v19 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_2;
    v9[3] = &unk_1E6D57030;
    uint64_t v11 = *(void *)(a1 + 56);
    long long v10 = *(_OWORD *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else if (v6)
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_cold_1(a1, v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 requestedSharing] & 1) != 0 || objc_msgSend(v6, "requestedReading"))
  {
    _HKInitializeLogging();
    dispatch_semaphore_t v7 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      *(_DWORD *)long long v10 = 138543362;
      *(void *)&void v10[4] = objc_opt_class();
      id v9 = *(id *)&v10[4];
      _os_log_impl(&dword_1E0B26000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Added source to the list of sources", v10, 0xCu);
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", *(void *)(a1 + 40), *(_OWORD *)v10);
    *a4 = 1;
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSourceListDataModel)sources
{
  return self->_sources;
}

- (BOOL)shouldFetchAppInstallationStatus
{
  return self->_shouldFetchAppInstallationStatus;
}

- (BOOL)shouldFetchAppIcons
{
  return self->_shouldFetchAppIcons;
}

- (BOOL)shouldFetchPurposeStrings
{
  return self->_shouldFetchPurposeStrings;
}

- (BOOL)shouldIncludeSpecialSources
{
  return self->_shouldIncludeSpecialSources;
}

- (BOOL)deliverUpdates
{
  return self->_deliverUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rawSources, 0);
  objc_storeStrong((id *)&self->_followupTransformers, 0);
  objc_storeStrong((id *)&self->_transformers, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "Failed to fetch remote application installation status for companion bundle identifier %{public}@: %{public}@");
}

void __63__HKSourceListDataSource__builtinInstallationStatusTransformer__block_invoke_316_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "Failed to fetch remote application installation status for watch bundle identifier %{public}@: %{public}@");
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 source];
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v5, v6, "Failed to fetch research study bundle for source %{public}@: %{public}@", v7, v8, v9, v10, 2u);
}

void __54__HKSourceListDataSource__builtinIconFetchTransformer__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "Failed to fetch watch app bundle identifier for companion bundle identifier '%{public}@': %{public}@");
}

void __64__HKSourceListDataSource__builtinPurposeStringsFetchTransformer__block_invoke_339_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "Unable to fetch remote watch app purpose strings for source %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_didFetchSources:(void *)a1 error:completion:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_2(v2);
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v4, v5, "%{public}@: failed to fetch sources: %{public}@", v6, v7, v8, v9, v10);
}

void __81__HKSourceListDataSource_fetchFilteredSourcesWithAuthorizationRecordsForSources___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_3_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v5, v6, "%{public}@: failed to get authorization records: %{public}@", v7, v8, v9, v10, v11);
}

@end