@interface DEDDiagnosticCollector
- (BOOL)isDiagnosticExtensionAvailable;
- (DEDDiagnosticCollector)init;
- (NSArray)cachedExtensions;
- (OS_os_log)log;
- (id)_combineParametersWithParameters:(id)a3 extension:(id)a4 identifier:(id)a5;
- (id)availableDiagnosticExtensions;
- (id)collectAnnotatedGroupWithIdentifier:(id)a3 parameters:(id)a4;
- (id)collectItemsWithIdentifier:(id)a3 parameters:(id)a4;
- (id)extensionForIdentifier:(id)a3;
- (id)extensionManager;
- (unint64_t)collectionTimeout;
- (void)cleanupItemsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)loadExtensionTextDataInExtension:(id)a3 localization:(id)a4;
- (void)prepareItemsWithDeferredExtensionInfo:(id)a3;
- (void)prepareItemsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)setCachedExtensions:(id)a3;
- (void)setCollectionTimeout:(unint64_t)a3;
- (void)setLog:(id)a3;
@end

@implementation DEDDiagnosticCollector

- (DEDDiagnosticCollector)init
{
  v5.receiver = self;
  v5.super_class = (Class)DEDDiagnosticCollector;
  v2 = [(DEDDiagnosticCollector *)&v5 init];
  if (v2)
  {
    if (Log_onceToken2 != -1) {
      dispatch_once(&Log_onceToken2, &__block_literal_global_11);
    }
    [(DEDDiagnosticCollector *)v2 setLog:Log_handle];
    v3 = [(DEDDiagnosticCollector *)v2 extensionManager];
    [v3 loadExtensions];

    [(DEDDiagnosticCollector *)v2 setCollectionTimeout:2100];
  }
  return v2;
}

- (id)collectAnnotatedGroupWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DEDDiagnosticCollector *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDDiagnosticCollector collectAnnotatedGroupWithIdentifier:parameters:]();
  }

  v9 = [(DEDDiagnosticCollector *)self extensionManager];
  v10 = [v9 extensionForIdentifier:v6];

  if (v10)
  {
    v11 = [(DEDDiagnosticCollector *)self _combineParametersWithParameters:v7 extension:v10 identifier:v6];
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    id v31 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __73__DEDDiagnosticCollector_collectAnnotatedGroupWithIdentifier_parameters___block_invoke;
    v21 = &unk_26453B190;
    v22 = self;
    id v23 = v6;
    v25 = &v26;
    v13 = v12;
    v24 = v13;
    [v10 annotatedAttachmentsForParameters:v11 andHandler:&v18];
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * [(DEDDiagnosticCollector *)self collectionTimeout]);
    dispatch_group_wait(v13, v14);
    id v15 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v16 = [(DEDDiagnosticCollector *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DEDDiagnosticCollector collectAnnotatedGroupWithIdentifier:parameters:]();
    }

    +[DEDAnalytics extensionWithIdentifier:v6 didCompleteWithFileCount:0 bytesCollected:0 duration:0 errorCode:2];
    id v15 = 0;
  }

  return v15;
}

void __73__DEDDiagnosticCollector_collectAnnotatedGroupWithIdentifier_parameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "finished collecting annotated attachments for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __73__DEDDiagnosticCollector_collectAnnotatedGroupWithIdentifier_parameters___block_invoke_cold_1(v3, v6);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
  id v9 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)collectItemsWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DEDDiagnosticCollector *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDDiagnosticCollector collectItemsWithIdentifier:parameters:]();
  }

  id v9 = [(DEDDiagnosticCollector *)self extensionManager];
  int v10 = [v9 extensionForIdentifier:v6];

  if (v10)
  {
    uint64_t v11 = [(DEDDiagnosticCollector *)self _combineParametersWithParameters:v7 extension:v10 identifier:v6];
    uint64_t v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    id v31 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke;
    v21 = &unk_26453B1B8;
    v22 = self;
    id v23 = v6;
    v25 = &v26;
    v13 = v12;
    v24 = v13;
    [v10 attachmentsForParameters:v11 andHandler:&v18];
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * [(DEDDiagnosticCollector *)self collectionTimeout]);
    dispatch_group_wait(v13, v14);
    id v15 = [MEMORY[0x263EFF8C0] arrayWithArray:v27[5]];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v16 = [(DEDDiagnosticCollector *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DEDDiagnosticCollector collectAnnotatedGroupWithIdentifier:parameters:]();
    }

    +[DEDAnalytics extensionWithIdentifier:v6 didCompleteWithFileCount:0 bytesCollected:0 duration:0 errorCode:2];
    id v15 = (void *)MEMORY[0x263EFFA68];
  }

  return v15;
}

void __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v10 = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_INFO, "finished collecting attachments for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke_cold_1();
  }

  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)_combineParametersWithParameters:(id)a3 extension:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x263EFF9A0];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  v13 = (void *)MEMORY[0x263EFFA78];
  if (v11) {
    v13 = v11;
  }
  id v14 = v13;

  [v12 addEntriesFromDictionary:v14];
  id v15 = [v14 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if (v15)
  {
    v16 = [v14 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
    [v12 setObject:v16 forKeyedSubscript:@"DEExtensionHostAppKey"];
  }
  else
  {
    v16 = +[DEDConfiguration sharedInstance];
    v17 = [v16 identifier];
    [v12 setObject:v17 forKeyedSubscript:@"DEExtensionHostAppKey"];
  }
  uint64_t v18 = [v10 identifier];

  if ([v18 isEqualToString:@"com.apple.DiagnosticExtensions.sysdiagnose"])
  {
    uint64_t v19 = [v12 objectForKey:@"coSysdiagnose"];

    if (!v19) {
      [v12 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"coSysdiagnose"];
    }
  }
  else
  {
  }
  v20 = [(DEDDiagnosticCollector *)self log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[DEDDiagnosticCollector _combineParametersWithParameters:extension:identifier:]();
  }

  return v12;
}

- (void)prepareItemsWithDeferredExtensionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDDiagnosticCollector *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDDiagnosticCollector prepareItemsWithDeferredExtensionInfo:]((uint64_t)v4, v5);
  }

  id v6 = [v4 dedIdentifier];
  uint64_t v7 = [v6 extensionIdentifier];

  id v8 = [(DEDDiagnosticCollector *)self extensionManager];
  id v9 = [v8 extensionForIdentifier:v7];

  id v10 = [v4 parameters];
  id v11 = [v4 bugSessionIdentifier];
  id v12 = [v4 triggerDate];
  [v9 setupWithParameters:v10 session:v11 expirationDate:v12];
}

- (void)prepareItemsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDDiagnosticCollector *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315906;
    id v15 = "-[DEDDiagnosticCollector prepareItemsWithIdentifier:parameters:session:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_debug_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v14, 0x2Au);
  }

  id v12 = [(DEDDiagnosticCollector *)self extensionManager];
  v13 = [v12 extensionForIdentifier:v8];

  [v13 setupWithParameters:v9 session:v10];
}

- (void)cleanupItemsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DEDDiagnosticCollector *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315906;
    id v15 = "-[DEDDiagnosticCollector cleanupItemsWithIdentifier:parameters:session:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_debug_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v14, 0x2Au);
  }

  id v12 = [(DEDDiagnosticCollector *)self extensionManager];
  v13 = [v12 extensionForIdentifier:v8];

  [v13 teardownWithParameters:v9 session:v10];
}

- (BOOL)isDiagnosticExtensionAvailable
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = (void *)MEMORY[0x263F08800];
  uint64_t v15 = *MEMORY[0x263F07FF8];
  v16[0] = @"com.apple.diagnosticextensions-service";
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke;
  v8[3] = &unk_26453B1E0;
  v8[4] = self;
  id v10 = &v11;
  id v6 = v3;
  id v9 = v6;
  [v4 extensionsWithMatchingAttributes:v5 completion:v8];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v12 + 24) != 0;

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)extensionForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDDiagnosticCollector *)self cachedExtensions];

  if (!v5) {
    id v6 = [(DEDDiagnosticCollector *)self availableDiagnosticExtensions];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(DEDDiagnosticCollector *)self cachedExtensions];
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 identifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_13;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

- (id)availableDiagnosticExtensions
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = [(DEDDiagnosticCollector *)self extensionManager];
  id v4 = [v3 extensionsWithFilter:0];

  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[DEDExtension extensionWithDEExtension:](DEDExtension, "extensionWithDEExtension:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v5 copy];
  char v13 = (void *)v12;
  char v14 = (void *)MEMORY[0x263EFFA68];
  if (v12) {
    char v14 = (void *)v12;
  }
  id v15 = v14;

  [(DEDDiagnosticCollector *)self setCachedExtensions:v15];
  return v15;
}

- (void)loadExtensionTextDataInExtension:(id)a3 localization:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DEDDiagnosticCollector *)self extensionManager];
  uint64_t v9 = [v7 identifier];
  id v13 = [v8 extensionForIdentifier:v9];

  id v10 = [v13 localizedConsentTextWithLocalization:v6];
  [v7 setLocalizedConsentText:v10];

  uint64_t v11 = [v13 localizedDataCollectedSummaryWithLocalization:v6];
  [v7 setLocalizedDataCollectedSummary:v11];

  uint64_t v12 = [v13 localizedDataCollectedExplanationWithLocalization:v6];

  [v7 setLocalizedDataCollectedExplanation:v12];
}

- (id)extensionManager
{
  return (id)[MEMORY[0x263F3A090] sharedInstance];
}

- (unint64_t)collectionTimeout
{
  return self->_collectionTimeout;
}

- (void)setCollectionTimeout:(unint64_t)a3
{
  self->_collectionTimeout = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (NSArray)cachedExtensions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedExtensions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)collectAnnotatedGroupWithIdentifier:parameters:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Could not find extension with identifier %@", v2, v3, v4, v5, v6);
}

- (void)collectAnnotatedGroupWithIdentifier:parameters:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_1(&dword_21FE04000, v0, v1, "%s %@ %@", v2);
}

void __73__DEDDiagnosticCollector_collectAnnotatedGroupWithIdentifier_parameters___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "collected annotated group %@", v4, 0xCu);
}

- (void)collectItemsWithIdentifier:parameters:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_1(&dword_21FE04000, v0, v1, "%s %@ %@", v2);
}

void __64__DEDDiagnosticCollector_collectItemsWithIdentifier_parameters___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "collected attachments %@", v1, 0xCu);
}

- (void)_combineParametersWithParameters:extension:identifier:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_21FE04000, v1, OS_LOG_TYPE_DEBUG, "Combined parameters for %@: %@", v2, 0x16u);
}

- (void)prepareItemsWithDeferredExtensionInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  __int16 v3 = "-[DEDDiagnosticCollector prepareItemsWithDeferredExtensionInfo:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v2, 0x16u);
}

void __56__DEDDiagnosticCollector_isDiagnosticExtensionAvailable__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "Error finding diagnostic extension [%@]", v2, v3, v4, v5, v6);
}

@end