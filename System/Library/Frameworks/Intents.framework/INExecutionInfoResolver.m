@interface INExecutionInfoResolver
+ (id)defaultResolver;
+ (void)initialize;
- (INExecutionCounterpartMapper)_counterpartMapper;
- (INExecutionFrameworkMapper)_frameworkMapper;
- (NSDictionary)_counterpartMapping;
- (id)_resolveExecutionInfo:(id)a3;
- (id)_resolveExecutionInfoByLinkingExtensionToApp:(id)a3;
- (id)_resolveExecutionInfoBySwappingIdentifiers:(id)a3;
- (id)_resolveIntentExecutionInfoByLinkingExtensionToApp:(id)a3;
- (id)_resolveIntentExecutionInfoBySwappingIdentifiers:(id)a3;
- (id)_resolveIntentExecutionInfoUsingCounterparts:(id)a3;
- (id)_resolveUserActivityExecutionInfoByLinkingFileProvidersToFilesApp:(id)a3;
- (id)_resolveUserActivityExecutionInfoBySwappingIdentifiers:(id)a3;
- (id)_resolveUserActivityExecutionInfoUsingCounterparts:(id)a3;
- (id)counterpartIdentifiersForLocalIdentifier:(id)a3;
- (id)localIdentifiersForCounterpartIdentifier:(id)a3;
- (id)resolveIntentExecutionInfo:(id)a3;
- (id)resolveUserActivityExecutionInfo:(id)a3;
@end

@implementation INExecutionInfoResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__counterpartMapping, 0);
  objc_storeStrong((id *)&self->_frameworkMapper, 0);

  objc_storeStrong((id *)&self->_counterpartMapper, 0);
}

- (NSDictionary)_counterpartMapping
{
  return self->__counterpartMapping;
}

- (INExecutionFrameworkMapper)_frameworkMapper
{
  frameworkMapper = self->_frameworkMapper;
  if (!frameworkMapper)
  {
    v4 = objc_alloc_init(INExecutionFrameworkMapper);
    v5 = self->_frameworkMapper;
    self->_frameworkMapper = v4;

    frameworkMapper = self->_frameworkMapper;
  }

  return frameworkMapper;
}

- (INExecutionCounterpartMapper)_counterpartMapper
{
  counterpartMapper = self->_counterpartMapper;
  if (!counterpartMapper)
  {
    v4 = objc_alloc_init(INExecutionCounterpartMapper);
    v5 = self->_counterpartMapper;
    self->_counterpartMapper = v4;

    counterpartMapper = self->_counterpartMapper;
  }

  return counterpartMapper;
}

- (id)_resolveUserActivityExecutionInfoUsingCounterparts:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 launchableAppBundleId];
  v6 = [v4 userActivityType];
  v7 = [(INExecutionInfoResolver *)self localIdentifiersForCounterpartIdentifier:v5];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__INExecutionInfoResolver__resolveUserActivityExecutionInfoUsingCounterparts___block_invoke;
  v22[3] = &unk_1E55183A8;
  id v8 = v6;
  id v23 = v8;
  v9 = objc_msgSend(v7, "if_compactMap:", v22);
  if ((unint64_t)[v9 count] < 2)
  {
    v12 = [v9 anyObject];
  }
  else
  {
    v10 = [v9 allObjects];
    v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_13];
    v12 = [v11 firstObject];

    v13 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v15 = [v12 bundleIdentifier];
      *(_DWORD *)buf = 136315650;
      v25 = "-[INExecutionInfoResolver _resolveUserActivityExecutionInfoUsingCounterparts:]";
      __int16 v26 = 2114;
      v27 = v5;
      __int16 v28 = 2114;
      v29 = v15;
      _os_log_error_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_ERROR, "%s Matched multiple counterpart applications for %{public}@, choosing %{public}@", buf, 0x20u);
    }
  }
  if (v12)
  {
    v16 = [INUserActivityExecutionInfo alloc];
    v17 = [v12 bundleIdentifier];
    v18 = [v12 URL];
    v19 = [v4 extensionBundleId];
    id v20 = [(INUserActivityExecutionInfo *)v16 _initWithUserActivityType:v8 launchableAppBundleId:v17 containingAppBundleURL:v18 extensionBundleId:v19];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

id __78__INExecutionInfoResolver__resolveUserActivityExecutionInfoUsingCounterparts___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  v6 = [v5 applicationState];
  int v7 = [v6 isInstalled];

  id v8 = 0;
  if (v7)
  {
    v9 = objc_msgSend(v5, "if_userActivityTypes");
    if ([v9 containsObject:*(void *)(a1 + 32)]) {
      v10 = v5;
    }
    else {
      v10 = 0;
    }
    id v8 = v10;
  }

  return v8;
}

uint64_t __78__INExecutionInfoResolver__resolveUserActivityExecutionInfoUsingCounterparts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 localizedNameWithContext:&stru_1EDA6DB28];
  v6 = [v4 localizedNameWithContext:&stru_1EDA6DB28];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_resolveUserActivityExecutionInfoByLinkingFileProvidersToFilesApp:(id)a3
{
  id v3 = a3;
  id v4 = [v3 extensionBundleId];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v4 error:0];
    v6 = [v5 extensionPointRecord];
    uint64_t v7 = [v6 name];
    int v8 = [v7 isEqualToString:@"com.apple.fileprovider-nonui"];

    id v9 = 0;
    if (v8)
    {
      v10 = [INUserActivityExecutionInfo alloc];
      v11 = [v3 userActivityType];
      v12 = [v3 containingAppBundleURL];
      v13 = [v3 extensionBundleId];
      id v9 = [(INUserActivityExecutionInfo *)v10 _initWithUserActivityType:v11 launchableAppBundleId:@"com.apple.DocumentsApp" containingAppBundleURL:v12 extensionBundleId:v13];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_resolveUserActivityExecutionInfoBySwappingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(INExecutionInfoResolver *)self _resolveExecutionInfoBySwappingIdentifiers:v4];
  if (v5)
  {
    v6 = [INUserActivityExecutionInfo alloc];
    uint64_t v7 = [v4 userActivityType];
    int v8 = [v5 launchableAppBundleId];
    id v9 = [v5 containingAppBundleURL];
    v10 = [v5 extensionBundleId];
    id v11 = [(INUserActivityExecutionInfo *)v6 _initWithUserActivityType:v7 launchableAppBundleId:v8 containingAppBundleURL:v9 extensionBundleId:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_resolveIntentExecutionInfoUsingCounterparts:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 launchableAppBundleId];
  v6 = [v4 intentClassName];
  uint64_t v7 = [(INExecutionInfoResolver *)self localIdentifiersForCounterpartIdentifier:v5];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __72__INExecutionInfoResolver__resolveIntentExecutionInfoUsingCounterparts___block_invoke;
  v43[3] = &unk_1E5518360;
  id v8 = v4;
  id v44 = v8;
  id v9 = v6;
  id v45 = v9;
  v10 = objc_msgSend(v7, "if_compactMap:", v43);
  if ((unint64_t)[v10 count] < 2)
  {
    uint64_t v13 = [v10 anyObject];
  }
  else
  {
    id v11 = [v10 allObjects];
    v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_31195];
    uint64_t v13 = [v12 firstObject];

    v14 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = [(id)v13 bundleIdentifier];
      *(_DWORD *)buf = 136315650;
      v47 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]";
      __int16 v48 = 2114;
      v49 = v5;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v16;
      _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Matched multiple launchable counterpart applications for %{public}@, choosing %{public}@", buf, 0x20u);
    }
  }
  uint64_t v17 = [v8 displayableAppBundleId];
  v18 = self;
  v19 = (void *)v17;
  id v20 = [(INExecutionInfoResolver *)v18 localIdentifiersForCounterpartIdentifier:v17];
  v42 = v20;
  if ((unint64_t)[v20 count] < 2)
  {
    uint64_t v25 = [v20 anyObject];
  }
  else
  {
    uint64_t v21 = v13;
    v22 = v10;
    id v23 = [v20 allObjects];
    v24 = [v23 sortedArrayUsingSelector:sel_compare_];
    uint64_t v25 = [v24 firstObject];

    __int16 v26 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v47 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]";
      __int16 v48 = 2114;
      v49 = v19;
      __int16 v50 = 2114;
      uint64_t v51 = v25;
      _os_log_error_impl(&dword_18CB2F000, v26, OS_LOG_TYPE_ERROR, "%s Matched multiple displayable counterpart applications for %{public}@, choosing %{public}@", buf, 0x20u);
    }
    v10 = v22;
    uint64_t v13 = v21;
  }
  if (v13 | v25)
  {
    v39 = [INIntentExecutionInfo alloc];
    uint64_t v38 = [v8 preferredCallProvider];
    v37 = [(id)v13 bundleIdentifier];
    [v8 extensionBundleId];
    __int16 v28 = v27 = v9;
    [v8 uiExtensionBundleId];
    v29 = v41 = v5;
    [(id)v13 URL];
    v40 = v19;
    uint64_t v30 = v13;
    v31 = v10;
    id v32 = v8;
    v34 = v33 = v7;
    id v35 = [(INIntentExecutionInfo *)v39 _initWithIntentClassName:v27 preferredCallProvider:v38 launchableAppBundleId:v37 displayableAppBundleId:v25 extensionBundleId:v28 uiExtensionBundleId:v29 containingAppBundleURL:v34];

    uint64_t v7 = v33;
    id v8 = v32;
    v10 = v31;
    uint64_t v13 = v30;
    v19 = v40;

    v5 = v41;
    id v9 = v27;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

id __72__INExecutionInfoResolver__resolveIntentExecutionInfoUsingCounterparts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v5 = [v4 applicationState];
  int v6 = [v5 isInstalled];

  id v7 = 0;
  if (v6)
  {
    id v8 = +[INAppInfo appInfoWithApplicationRecord:v4];
    id v9 = [v8 supportedActionsByExtensions];
    v10 = (void *)[v9 mutableCopy];

    id v11 = [*(id *)(a1 + 32) extensionBundleId];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F223A0]);
      uint64_t v13 = [*(id *)(a1 + 32) extensionBundleId];
      id v22 = 0;
      v14 = (void *)[v12 initWithBundleIdentifier:v13 error:&v22];
      id v15 = v22;

      if (v14)
      {
        v16 = objc_msgSend(v14, "if_extensionAttributesDictionary");
        uint64_t v17 = [v16 objectForKeyedSubscript:@"IntentsSupported"];

        [v10 addObjectsFromArray:v17];
      }
      else
      {
        v18 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]_block_invoke";
          __int16 v25 = 2114;
          id v26 = v15;
          _os_log_error_impl(&dword_18CB2F000, v18, OS_LOG_TYPE_ERROR, "%s Failed to create application extension record: %{public}@", buf, 0x16u);
        }
      }
    }
    if (v10)
    {
      if ([v10 containsObject:*(void *)(a1 + 40)]) {
        v19 = v4;
      }
      else {
        v19 = 0;
      }
      id v7 = v19;
    }
    else
    {
      id v20 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]_block_invoke";
        __int16 v25 = 2114;
        id v26 = v3;
        __int16 v27 = 2114;
        uint64_t v28 = 0;
        _os_log_error_impl(&dword_18CB2F000, v20, OS_LOG_TYPE_ERROR, "%s Failed to get the supported intents for %{public}@: %{public}@", buf, 0x20u);
      }
      id v7 = 0;
    }
  }

  return v7;
}

uint64_t __72__INExecutionInfoResolver__resolveIntentExecutionInfoUsingCounterparts___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 bundleIdentifier];
  int v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_resolveIntentExecutionInfoByLinkingExtensionToApp:(id)a3
{
  id v4 = a3;
  v5 = [(INExecutionInfoResolver *)self _resolveExecutionInfoByLinkingExtensionToApp:v4];
  int v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 displayableAppBundleId];
    if ([v4 preferredCallProvider] == 2)
    {

      uint64_t v7 = @"com.apple.facetime";
    }
    id v8 = [INIntentExecutionInfo alloc];
    id v9 = [v4 intentClassName];
    uint64_t v10 = [v4 preferredCallProvider];
    id v11 = [v6 launchableAppBundleId];
    id v12 = [v6 extensionBundleId];
    uint64_t v13 = [v4 uiExtensionBundleId];
    v14 = [v4 containingAppBundleURL];
    id v15 = [(INIntentExecutionInfo *)v8 _initWithIntentClassName:v9 preferredCallProvider:v10 launchableAppBundleId:v11 displayableAppBundleId:v7 extensionBundleId:v12 uiExtensionBundleId:v13 containingAppBundleURL:v14];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_resolveIntentExecutionInfoBySwappingIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(INExecutionInfoResolver *)self _resolveExecutionInfoBySwappingIdentifiers:v4];
  if (v5)
  {
    int v6 = [INIntentExecutionInfo alloc];
    uint64_t v7 = [v4 intentClassName];
    uint64_t v8 = [v4 preferredCallProvider];
    id v9 = [v5 launchableAppBundleId];
    uint64_t v10 = [v5 displayableAppBundleId];
    id v11 = [v5 extensionBundleId];
    id v12 = [v4 uiExtensionBundleId];
    uint64_t v13 = [v5 containingAppBundleURL];
    id v14 = [(INIntentExecutionInfo *)v6 _initWithIntentClassName:v7 preferredCallProvider:v8 launchableAppBundleId:v9 displayableAppBundleId:v10 extensionBundleId:v11 uiExtensionBundleId:v12 containingAppBundleURL:v13];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_resolveExecutionInfoByLinkingExtensionToApp:(id)a3
{
  id v4 = a3;
  v5 = [v4 extensionBundleId];
  if (v5)
  {
    int v6 = [(INExecutionInfoResolver *)self _frameworkMapper];
    uint64_t v7 = [v6 launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:v5];

    uint64_t v8 = [(INExecutionInfoResolver *)self _frameworkMapper];
    uint64_t v9 = [v8 displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:v5];

    if (v9 | v7)
    {
      uint64_t v10 = [INExecutionInfo alloc];
      id v11 = [v4 containingAppBundleURL];
      id v12 = [(INExecutionInfo *)v10 _initWithLaunchableAppBundleId:v7 displayableAppBundleId:v9 containingAppBundleURL:v11 extensionBundleId:v5];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_resolveExecutionInfoBySwappingIdentifiers:(id)a3
{
  id v3 = [a3 launchableAppBundleId];
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_22;
  }
  if (INThisProcessCanMapLSDatabase(0))
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v3 error:0];
    if (v4)
    {
LABEL_4:
      v5 = [v4 containingBundleRecord];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v6 = v5;
        }
        else {
          int v6 = 0;
        }
      }
      else
      {
        int v6 = 0;
      }
      id v13 = v6;

      id v14 = [INExecutionInfo alloc];
      id v15 = [v13 bundleIdentifier];
      v16 = [v13 bundleIdentifier];
      uint64_t v17 = [v13 URL];

      v18 = [v4 bundleIdentifier];
      id v7 = [(INExecutionInfo *)v14 _initWithLaunchableAppBundleId:v15 displayableAppBundleId:v16 containingAppBundleURL:v17 extensionBundleId:v18];

      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
    uint64_t v9 = [v8 bundleIdentifier];
    int v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      id v11 = v8;
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
      id v4 = v12;
    }
    else
    {
      id v4 = 0;
    }

    if (v4) {
      goto LABEL_4;
    }
  }
  id v7 = 0;
LABEL_21:

LABEL_22:

  return v7;
}

- (id)_resolveExecutionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INExecutionInfoResolver *)self _resolveExecutionInfoBySwappingIdentifiers:v4];
  int v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v9 = [(INExecutionInfoResolver *)self _resolveExecutionInfoByLinkingExtensionToApp:v8];
  int v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  return v12;
}

- (id)counterpartIdentifiersForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INExecutionInfoResolver *)self _counterpartMapper];
  int v6 = [v5 counterpartIdentifiersForLocalIdentifier:v4];

  return v6;
}

- (id)localIdentifiersForCounterpartIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INExecutionInfoResolver *)self _counterpartMapper];
  int v6 = [v5 localIdentifiersForCounterpartIdentifier:v4];

  return v6;
}

- (id)resolveUserActivityExecutionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INExecutionInfoResolver *)self _resolveUserActivityExecutionInfoBySwappingIdentifiers:v4];
  int v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v9 = [(INExecutionInfoResolver *)self _resolveUserActivityExecutionInfoByLinkingFileProvidersToFilesApp:v8];
  int v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  uint64_t v13 = [(INExecutionInfoResolver *)self _resolveUserActivityExecutionInfoUsingCounterparts:v12];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = v12;
  }
  id v16 = v15;

  return v16;
}

- (id)resolveIntentExecutionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INExecutionInfoResolver *)self _resolveIntentExecutionInfoBySwappingIdentifiers:v4];
  int v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v9 = [(INExecutionInfoResolver *)self _resolveIntentExecutionInfoByLinkingExtensionToApp:v8];
  int v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  uint64_t v13 = [(INExecutionInfoResolver *)self _resolveIntentExecutionInfoUsingCounterparts:v12];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = v12;
  }
  id v16 = v15;

  return v16;
}

+ (id)defaultResolver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__INExecutionInfoResolver_defaultResolver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultResolver_onceToken != -1) {
    dispatch_once(&defaultResolver_onceToken, block);
  }
  v2 = (void *)defaultResolver_resolver;

  return v2;
}

uint64_t __42__INExecutionInfoResolver_defaultResolver__block_invoke()
{
  defaultResolver_resolver = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end