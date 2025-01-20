@interface _MXExtensionProvider
+ (id)sharedProvider;
- (BOOL)_disableExtension:(id)a3 error:(id *)a4;
- (BOOL)_enableExtension:(id)a3 error:(id *)a4;
- (_MXAssetStorage)assetStorage;
- (_MXExtensionDispatchCenter)dispatchCenter;
- (_MXExtensionMatchingMerger)merger;
- (_MXExtensionProvider)init;
- (_MXExtensionServiceCenter)serviceCenter;
- (id)_currentExtensions;
- (id)_extensionWithIdentifier:(id)a3;
- (id)_extensionsByFilteringBlacklistedExtensionsFromArray:(id)a3;
- (id)_intentClassFilter:(id)a3;
- (id)addExtensionsUpdateHandler:(id)a3;
- (id)siblingExtensionsWithContainingAppIdentifer:(id)a3;
- (void)_beginMatchingExtensionsIfNeeded;
- (void)_endMatchingExtensionsIfNeeded;
- (void)_restartMatchingExtensionsForDefaultsChange;
- (void)dealloc;
- (void)imageForKey:(id)a3 completion:(id)a4;
- (void)imageForKey:(id)a3 extension:(id)a4 completion:(id)a5;
- (void)loadImageForKey:(id)a3 withBlock:(id)a4;
- (void)removeExtensionUpdateHandler:(id)a3;
- (void)setAssetStorage:(id)a3;
- (void)setDispatchCenter:(id)a3;
- (void)setMerger:(id)a3;
- (void)setServiceCenter:(id)a3;
@end

@implementation _MXExtensionProvider

- (id)_currentExtensions
{
  return [(_MXExtensionServiceCenter *)self->_serviceCenter allExtensions];
}

- (_MXExtensionServiceCenter)serviceCenter
{
  return self->_serviceCenter;
}

- (_MXExtensionMatchingMerger)merger
{
  return self->_merger;
}

- (_MXExtensionDispatchCenter)dispatchCenter
{
  return self->_dispatchCenter;
}

- (id)_extensionsByFilteringBlacklistedExtensionsFromArray:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  blacklistedExtensions = v5->_blacklistedExtensions;
  if (!blacklistedExtensions)
  {
    v7 = GEOConfigGetDictionary();
    uint64_t v8 = +[_MXBundleBlacklistEntry blacklistEntriesFromDefaultsValue:v7];
    v9 = v5->_blacklistedExtensions;
    v5->_blacklistedExtensions = (NSArray *)v8;

    blacklistedExtensions = v5->_blacklistedExtensions;
  }
  v38 = (void *)[(NSArray *)blacklistedExtensions copy];
  blacklistedContainingApplications = v5->_blacklistedContainingApplications;
  if (!blacklistedContainingApplications)
  {
    v11 = GEOConfigGetDictionary();
    uint64_t v12 = +[_MXBundleBlacklistEntry blacklistEntriesFromDefaultsValue:v11];
    v13 = v5->_blacklistedContainingApplications;
    v5->_blacklistedContainingApplications = (NSArray *)v12;

    blacklistedContainingApplications = v5->_blacklistedContainingApplications;
  }
  v36 = (void *)[(NSArray *)blacklistedContainingApplications copy];
  objc_sync_exit(v5);

  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v4;
  uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v14)
  {
    uint64_t v37 = *(void *)v48;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v17 = v38;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(v17);
              }
              if (([*(id *)(*((void *)&v43 + 1) + 8 * i) isExtensionAllowed:v16] & 1) == 0)
              {

                goto LABEL_30;
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        if ([v36 count])
        {
          id v21 = objc_alloc(MEMORY[0x1E4F223A0]);
          v22 = [v16 _plugIn];
          v23 = [v22 valueForKey:@"uuid"];
          v24 = (void *)[v21 initWithUUID:v23 error:0];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v25 = v36;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v40;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v40 != v27) {
                  objc_enumerationMutation(v25);
                }
                v29 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                v30 = [v24 containingBundleRecord];
                LODWORD(v29) = [v29 isBundleRecordAllowed:v30];

                if (!v29)
                {

                  goto LABEL_30;
                }
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v51 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }
        }
        [v34 addObject:v16];
LABEL_30:
        ++v15;
      }
      while (v15 != v14);
      uint64_t v31 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      uint64_t v14 = v31;
    }
    while (v31);
  }

  v32 = (void *)[v34 copy];

  return v32;
}

- (id)addExtensionsUpdateHandler:(id)a3
{
  id v4 = [(_MXExtensionDispatchCenter *)self->_dispatchCenter addExtensionsUpdateHandler:a3];
  [(_MXExtensionProvider *)self _beginMatchingExtensionsIfNeeded];

  return v4;
}

- (void)_beginMatchingExtensionsIfNeeded
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (!self->_matchingContext)
  {
    if (!self->_extensionMatchingClass) {
      self->_Class extensionMatchingClass = (Class)objc_opt_class();
    }
    uint64_t v29 = *MEMORY[0x1E4F282B0];
    v28[0] = @"com.apple.maps.ui-services";
    v28[1] = @"com.apple.maps.services";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v30[0] = v3;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

    objc_initWeak(&location, self);
    Class extensionMatchingClass = self->_extensionMatchingClass;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke;
    v25[3] = &unk_1E54B8830;
    objc_copyWeak(&v26, &location);
    v5 = [(objc_class *)extensionMatchingClass beginMatchingExtensionsWithAttributes:v20 completion:v25];
    id matchingContext = self->_matchingContext;
    self->_id matchingContext = v5;

    v7 = +[_MXExtensionManager restaurantQueueingIntentClassNames];
    uint64_t v8 = +[_MXExtensionManager restaurantReservationIntentClassNames];
    v9 = [MEMORY[0x1E4F1CA48] array];
    [v9 addObjectsFromArray:v7];
    [v9 addObjectsFromArray:v8];
    [v9 addObjectsFromArray:&unk_1ED97F410];
    v10 = (void *)[v9 copy];
    v11 = [(_MXExtensionProvider *)self _intentClassFilter:v10];

    uint64_t v12 = [(objc_class *)self->_extensionMatchingClass _intents_extensionMatchingAttributesForIntents:v11];
    Class v13 = self->_extensionMatchingClass;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke_2;
    v23[3] = &unk_1E54B8830;
    objc_copyWeak(&v24, &location);
    uint64_t v14 = [(objc_class *)v13 beginMatchingExtensionsWithAttributes:v12 completion:v23];
    id intentNonUIMatchingContext = self->_intentNonUIMatchingContext;
    self->_id intentNonUIMatchingContext = v14;

    v16 = [(objc_class *)self->_extensionMatchingClass _intents_uiExtensionMatchingAttributesForIntents:v11];
    Class v17 = self->_extensionMatchingClass;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke_3;
    v21[3] = &unk_1E54B8830;
    objc_copyWeak(&v22, &location);
    uint64_t v18 = [(objc_class *)v17 beginMatchingExtensionsWithAttributes:v16 completion:v21];
    id intentUIMatchingContext = self->_intentUIMatchingContext;
    self->_id intentUIMatchingContext = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (id)_intentClassFilter:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43___MXExtensionProvider__intentClassFilter___block_invoke;
  v8[3] = &unk_1E54BB910;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (_MXExtensionProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)_MXExtensionProvider;
  v2 = [(_MXExtensionProvider *)&v13 init];
  if (v2)
  {
    v3 = [[_MXExtensionServiceCenter alloc] initWithExtensionProvider:v2];
    serviceCenter = v2->_serviceCenter;
    v2->_serviceCenter = v3;

    v5 = [[_MXExtensionDispatchCenter alloc] initWithExtensionProvider:v2];
    dispatchCenter = v2->_dispatchCenter;
    v2->_dispatchCenter = v5;

    v7 = objc_alloc_init(_MXExtensionMatchingMerger);
    merger = v2->_merger;
    v2->_merger = v7;

    id v9 = objc_alloc_init(_MXAssetStorage);
    assetStorage = v2->_assetStorage;
    v2->_assetStorage = v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel__restartMatchingExtensionsForDefaultsChange name:*MEMORY[0x1E4F63F18] object:0];
  }
  return v2;
}

+ (id)sharedProvider
{
  if (_MergedGlobals_152 != -1) {
    dispatch_once(&_MergedGlobals_152, &__block_literal_global_57);
  }
  v2 = (void *)qword_1EB315E60;

  return v2;
}

- (void)dealloc
{
  dispatchCenter = self->_dispatchCenter;
  self->_dispatchCenter = 0;

  [(_MXExtensionProvider *)self _endMatchingExtensionsIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)_MXExtensionProvider;
  [(_MXExtensionProvider *)&v4 dealloc];
}

- (void)_endMatchingExtensionsIfNeeded
{
  id matchingContext = self->_matchingContext;
  self->_id matchingContext = 0;
  id v8 = matchingContext;

  [(objc_class *)self->_extensionMatchingClass endMatchingExtensions:v8];
  id intentNonUIMatchingContext = self->_intentNonUIMatchingContext;
  self->_id intentNonUIMatchingContext = 0;
  id v5 = intentNonUIMatchingContext;

  [(objc_class *)self->_extensionMatchingClass endMatchingExtensions:v5];
  id intentUIMatchingContext = self->_intentUIMatchingContext;
  self->_id intentUIMatchingContext = 0;
  id v7 = intentUIMatchingContext;

  [(objc_class *)self->_extensionMatchingClass endMatchingExtensions:v7];
}

- (void)_restartMatchingExtensionsForDefaultsChange
{
  if (self->_matchingContext)
  {
    [(_MXExtensionProvider *)self _endMatchingExtensionsIfNeeded];
    v3 = [(_MXExtensionProvider *)self serviceCenter];
    [v3 _clearExtensions];

    objc_super v4 = [(_MXExtensionProvider *)self merger];
    [v4 clearExtensions];

    id v5 = self;
    objc_sync_enter(v5);
    blacklistedExtensions = v5->_blacklistedExtensions;
    v5->_blacklistedExtensions = 0;

    blacklistedContainingApplications = v5->_blacklistedContainingApplications;
    v5->_blacklistedContainingApplications = 0;

    objc_sync_exit(v5);
    [(_MXExtensionProvider *)v5 _beginMatchingExtensionsIfNeeded];
  }
}

- (void)removeExtensionUpdateHandler:(id)a3
{
}

- (id)_extensionWithIdentifier:(id)a3
{
  return [(_MXExtensionServiceCenter *)self->_serviceCenter _extensionWithIdentifier:a3];
}

- (id)siblingExtensionsWithContainingAppIdentifer:(id)a3
{
  return [(_MXExtensionServiceCenter *)self->_serviceCenter _siblingExtensionsWithContainingAppIdentifer:a3];
}

- (BOOL)_enableExtension:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [v6 isEnabled];
  if (v6)
  {
    if (([v6 isEnabled] & 1) == 0)
    {
      id v8 = [v6 extension];
      int v9 = [v8 attemptOptIn:a4];

      if (v9)
      {
        dispatchCenter = self->_dispatchCenter;
        v11 = [(_MXExtensionProvider *)self _currentExtensions];
        [(_MXExtensionDispatchCenter *)dispatchCenter dispatchExtensions:v11 error:0];

        char v7 = 1;
      }
    }
  }

  return v7;
}

- (BOOL)_disableExtension:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LODWORD(dispatchCenter) = [v6 isEnabled] ^ 1;
  if (v6)
  {
    if ([v6 isEnabled])
    {
      id v8 = [v6 extension];
      int v9 = [v8 attemptOptOut:a4];

      if (v9)
      {
        dispatchCenter = self->_dispatchCenter;
        v10 = [(_MXExtensionProvider *)self _currentExtensions];
        [(_MXExtensionDispatchCenter *)dispatchCenter dispatchExtensions:v10 error:0];

        LOBYTE(dispatchCenter) = 1;
      }
    }
  }

  return (char)dispatchCenter;
}

- (void)imageForKey:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MXExtensionProvider *)self assetStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___MXExtensionProvider_imageForKey_completion___block_invoke;
  v10[3] = &unk_1E54BB938;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchAssetForKey:v7 completion:v10];
}

- (void)loadImageForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(_MXExtensionProvider *)self assetStorage];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50___MXExtensionProvider_loadImageForKey_withBlock___block_invoke;
    v9[3] = &unk_1E54B8338;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    [v8 loadAssetForKey:v10 withBlock:v9];
  }
}

- (void)imageForKey:(id)a3 extension:(id)a4 completion:(id)a5
{
}

- (void)setMerger:(id)a3
{
}

- (void)setDispatchCenter:(id)a3
{
}

- (void)setServiceCenter:(id)a3
{
}

- (_MXAssetStorage)assetStorage
{
  return self->_assetStorage;
}

- (void)setAssetStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetStorage, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_dispatchCenter, 0);
  objc_storeStrong((id *)&self->_merger, 0);
  objc_storeStrong((id *)&self->_blacklistedContainingApplications, 0);
  objc_storeStrong((id *)&self->_blacklistedExtensions, 0);
  objc_storeStrong(&self->_intentUIMatchingContext, 0);
  objc_storeStrong(&self->_intentNonUIMatchingContext, 0);

  objc_storeStrong(&self->_matchingContext, 0);
}

@end