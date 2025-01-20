@interface DKDiagnosticRegistry
- (Class)extensionClass;
- (Class)responseObjectClass;
- (DKDiagnosticRegistry)init;
- (NSArray)diagnostics;
- (NSMutableDictionary)diagnosticLookup;
- (id)adapterForIdentifier:(id)a3;
- (id)diagnosticForIdentifier:(id)a3;
- (void)addExtensionAdapter:(id)a3;
- (void)enumerateExtensionAdaptersWithBlock:(id)a3;
- (void)setDiagnosticLookup:(id)a3;
@end

@implementation DKDiagnosticRegistry

- (DKDiagnosticRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)DKDiagnosticRegistry;
  v2 = [(DKDiagnosticRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    diagnosticLookup = v2->_diagnosticLookup;
    v2->_diagnosticLookup = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)adapterForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DKDiagnosticRegistry *)self diagnosticLookup];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)diagnosticForIdentifier:(id)a3
{
  uint64_t v3 = [(DKDiagnosticRegistry *)self adapterForIdentifier:a3];
  id v4 = [v3 extensionAttributes];

  return v4;
}

- (NSArray)diagnostics
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(DKDiagnosticRegistry *)self diagnosticLookup];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v6 = [(DKDiagnosticRegistry *)self diagnosticLookup];
  v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) extensionAttributes];
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return (NSArray *)v5;
}

- (void)addExtensionAdapter:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 extensionAttributes];
  objc_super v6 = [(DKDiagnosticRegistry *)self diagnosticLookup];
  objc_sync_enter(v6);
  v7 = [(DKDiagnosticRegistry *)self diagnosticLookup];
  uint64_t v8 = [v5 identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [v9 extensionAttributes];
  v11 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v5 version];
    v13 = [v5 identifier];
    long long v14 = [v10 version];
    *(_DWORD *)v26 = 138413314;
    *(void *)&v26[4] = v5;
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v12;
    __int16 v27 = 2112;
    v28 = v13;
    __int16 v29 = 2112;
    v30 = v10;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_23D039000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to register a diagnostic [%@] with version [%@], but the identifier [%@] is already in use by [%@] with version [%@].", v26, 0x34u);
  }
  long long v15 = [v10 version];
  long long v16 = [v5 version];
  uint64_t v17 = [v15 compare:v16 options:64];

  v18 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v5 identifier];
    v20 = "not ";
    *(_DWORD *)v26 = 138412802;
    *(void *)&v26[4] = v19;
    *(_WORD *)&v26[12] = 2080;
    if (v17 == -1) {
      v20 = "";
    }
    *(void *)&v26[14] = v20;
    __int16 v27 = 2080;
    v28 = v20;
    _os_log_impl(&dword_23D039000, v18, OS_LOG_TYPE_DEFAULT, "New extension for ID [%@] will %sreplace the existing extension because its version is %shigher", v26, 0x20u);
  }
  if (v17 == -1)
  {
LABEL_9:
    v21 = [(DKDiagnosticRegistry *)self diagnosticLookup];
    v22 = [v5 identifier];
    [v21 setObject:v4 forKeyedSubscript:v22];

    v23 = DiagnosticsKitLogHandleForCategory(1);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v5 identifier];
      v25 = [v5 version];
      *(_DWORD *)v26 = 138412802;
      *(void *)&v26[4] = v5;
      *(_WORD *)&v26[12] = 2112;
      *(void *)&v26[14] = v24;
      __int16 v27 = 2112;
      v28 = v25;
      _os_log_impl(&dword_23D039000, v23, OS_LOG_TYPE_DEFAULT, "Registered diagnostic [%@] with Test ID [%@] and Version [%@]", v26, 0x20u);
    }
  }

  objc_sync_exit(v6);
}

- (void)enumerateExtensionAdaptersWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(DKDiagnosticRegistry *)self diagnosticLookup];
  objc_super v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (Class)extensionClass
{
  return (Class)objc_opt_class();
}

- (Class)responseObjectClass
{
  return (Class)objc_opt_class();
}

- (NSMutableDictionary)diagnosticLookup
{
  return self->_diagnosticLookup;
}

- (void)setDiagnosticLookup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end