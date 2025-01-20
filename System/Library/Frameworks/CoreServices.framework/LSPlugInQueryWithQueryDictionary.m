@interface LSPlugInQueryWithQueryDictionary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPlugin:(unsigned int)a3 pluginData:(const LSPluginData *)a4 withDatabase:(id)a5;
- (LSPlugInQueryWithQueryDictionary)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)_initWithQueryDictionary:(id)a3 applyFilter:(id)a4;
- (id)_queryDictionary;
- (id)systemMode;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithQueryDictionary

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (([v7 hasPrefix:@"ENTITLEMENT:"] & 1) != 0
    || ([v7 hasPrefix:@"NSUserElection"] & 1) != 0
    || _NSIsNSString() && ([v8 hasPrefix:@"?CODEREQUIREMENT"] & 1) != 0
    || (_NSIsNSDictionary() & 1) != 0
    || ([v7 isEqualToString:@"LS:ExtensionPlatforms"] & 1) != 0
    || ([v7 isEqualToString:@"LS:IncludeUnsupportedArchitectures"] & 1) != 0
    || [v7 isEqualToString:@"LS:IncludeRestricted"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_10;
  }
  v9 = getValueForKeyFromPlugin((NSString *)v7, *(const LSPluginData **)(a1 + 64), *(_LSDatabase **)(a1 + 32));
  if (!v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v9 = getValueForKeyFromPlist((NSString *)v7, *(NSDictionary **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  if ([v8 isEqual:MEMORY[0x1E4F1CC28]])
  {
    if (v9) {
      char v10 = [v9 isEqual:MEMORY[0x1E4F1CC28]];
    }
    else {
      char v10 = 1;
    }
    goto LABEL_24;
  }
  if (!v9)
  {
LABEL_27:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_28;
  }
  if (![v8 isEqual:MEMORY[0x1E4F1CC38]])
  {
    if (_NSIsNSString())
    {
      char v10 = objc_msgSend(v9, "ls_matchesForPluginQuery:", v8);
LABEL_24:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
      goto LABEL_28;
    }
    if (_NSIsNSArray())
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_3;
      v11[3] = &unk_1E5230150;
      uint64_t v13 = *(void *)(a1 + 48);
      id v12 = v8;
      [v9 enumerateObjectsUsingBlock:v11];

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 isEqual:MEMORY[0x1E4F1CC28]] ^ 1;
LABEL_28:

LABEL_10:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (_NSIsNSString()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "ls_matchesForPluginQuery:", *(void *)(a1 + 32));
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_60(uint64_t a1, uint64_t a2, _LSPlistHint *a3)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    _LSPlistGetDictionary(*(_LSDatabase **)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 48) + 136), a3);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_LSDatabase **)(a1 + 32);
    unsigned int SDKDictionaryDataUnit = _LSPluginGetSDKDictionaryDataUnit(v4, 0, *(void *)(a1 + 48));
    id v7 = _LSPlistGetDictionary(v4, SDKDictionaryDataUnit, v6);
    id v8 = objc_msgSend(v12, "ls_resolvePlugInKitInfoPlistWithDictionary:", v7);
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (v6)
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[LSPlugInQueryWithQueryDictionary _enumerateWithXPCConnection:block:](v8);
    }
  }
  id v35 = 0;
  v36 = 0;
  int inited = _LSContextInitReturningError(&v36, &v35);
  id v10 = v35;
  if (inited)
  {
    v11 = [MEMORY[0x1E4F1CA80] set];
    if ([(NSArray *)self->_extensionIdentifiers count]
      || [(NSArray *)self->_extensionPointIdentifiers count])
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3321888768;
      v31[2] = __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke;
      v31[3] = &unk_1ECB17920;
      id v32 = v11;
      v33 = self;
      id v34 = v36;
      id v12 = (void *)MEMORY[0x18530F950](v31);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      uint64_t v13 = self->_extensionIdentifiers;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v13);
            }
            _LSDatabaseGetStringForCFString(v36, *(const __CFString **)(*((void *)&v27 + 1) + 8 * i), 0);
            _LSDatabaseEnumeratingBindingMap();
          }
          uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v38 count:16];
        }
        while (v14);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v17 = self->_extensionPointIdentifiers;
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v17);
            }
            _LSDatabaseGetStringForCFString(v36, *(const __CFString **)(*((void *)&v23 + 1) + 8 * j), 0);
            _LSDatabaseEnumeratingBindingMap();
          }
          uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v23 objects:v37 count:16];
        }
        while (v18);
      }
    }
    else
    {
      v22 = v36;
      id v21 = v11;
      _CSStoreEnumerateUnits();
    }
    [(LSPlugInQuery *)self sort:1 pluginIDs:v11 andYield:v7 context:&v36];
    _LSContextDestroy(&v36);
  }
  else
  {
    v7[2](v7, 0, v10);
  }
}

void __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:");

  if ((v5 & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "matchesPlugin:pluginData:withDatabase:", a3, _LSGetPlugin(*(void *)(a1 + 48), a3), *(void *)(a1 + 48)))
  {
    id v6 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInt:a3];
    objc_msgSend(v6, "addObject:");
  }
}

- (BOOL)matchesPlugin:(unsigned int)a3 pluginData:(const LSPluginData *)a4 withDatabase:(id)a5
{
  id v8 = a5;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  uint64_t active_platform = dyld_get_active_platform();
  if (_LSPluginIsValid(v8, a3, (uint64_t)a4, self->_filterBlock, 0, 0))
  {
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    if (getkMISMinSupportedSignatureVersion_ptr(void)::onceToken != -1) {
      dispatch_once(&getkMISMinSupportedSignatureVersion_ptr(void)::onceToken, &__block_literal_global_122_0);
    }
    if (getkMISMinSupportedSignatureVersion_ptr(void)::ptr) {
      unsigned int v10 = *(_DWORD *)getkMISMinSupportedSignatureVersion_ptr(void)::ptr;
    }
    else {
      unsigned int v10 = 0;
    }
    queryDict = self->_queryDict;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(NSDictionary *)queryDict objectForKey:@"LS:IncludeUnsupportedCodeSignatures"];
    uint64_t v14 = (void *)v13;
    if (v12 && v13 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v14 = 0;
    }
    int v15 = [v14 BOOLValue];

    if (a4->var0.signatureVersion >= v10) {
      int v16 = 1;
    }
    else {
      int v16 = v15;
    }
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke;
    v61[3] = &unk_1E522D750;
    v61[4] = &v62;
    _LSEnumerateSliceMask(a4->var0._sliceMask, v61);
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__40;
    v59 = __Block_byref_object_dispose__40;
    id v60 = 0;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_60;
    v51[3] = &unk_1E5230128;
    v53 = &v55;
    id v17 = v8;
    id v52 = v17;
    v54 = a4;
    uint64_t v18 = (void (**)(void))MEMORY[0x18530F950](v51);
    uint64_t v19 = self->_queryDict;
    if (!v19
      && (*((unsigned char *)v63 + 24) ? (int v20 = v16) : (int v20 = 0), v20 == 1 && a4->var0.platform == active_platform))
    {
      *((unsigned char *)v67 + 24) = 1;
    }
    else if (v16)
    {
      id v21 = [(NSDictionary *)v19 objectForKeyedSubscript:@"LS:ExtensionPlatforms"];
      v43 = v21;
      uint64_t v22 = [v21 count];
      long long v23 = (void *)MEMORY[0x1E4F1CAD0];
      if (v22)
      {
        long long v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
      }
      else
      {
        long long v25 = [NSNumber numberWithUnsignedInt:active_platform];
        long long v24 = [v23 setWithObject:v25];
      }
      v44 = [(LSPlugInQueryWithQueryDictionary *)self systemMode];
      long long v26 = self->_queryDict;
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = [(NSDictionary *)v26 objectForKey:@"LS:IncludeRestricted"];
      long long v29 = (void *)v28;
      if (v27 && v28 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        long long v29 = 0;
      }
      char v30 = [v29 BOOLValue];

      if (v44) {
        char v31 = v30;
      }
      else {
        char v31 = 1;
      }
      if (v31)
      {
        unsigned __int8 v32 = 0;
      }
      else
      {
        v18[2](v18);
        v33 = (void *)v56[5];
        uint64_t v34 = objc_opt_class();
        uint64_t v35 = [v33 objectForKey:@"LSExtensionRestrictedSystemModes"];
        v36 = (void *)v35;
        if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v36 = 0;
        }
        unsigned __int8 v32 = [v36 containsObject:v44];
      }
      v37 = [NSNumber numberWithUnsignedInt:a4->var0.platform];
      v38 = v24;
      unsigned __int8 v39 = [v24 containsObject:v37];

      if (((v39 ^ 1 | v32) & 1) == 0)
      {
        v40 = self->_queryDict;
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke_2;
        v45[3] = &unk_1E5230178;
        v48 = &v66;
        v50 = a4;
        id v46 = v17;
        v47 = v18;
        v49 = &v55;
        [(NSDictionary *)v40 enumerateKeysAndObjectsUsingBlock:v45];
      }
    }
    else
    {
      *((unsigned char *)v67 + 24) = 0;
    }

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v62, 8);
  }
  char v41 = *((unsigned char *)v67 + 24);
  _Block_object_dispose(&v66, 8);

  return v41;
}

- (id)systemMode
{
  p_systemModeMutex = (os_unfair_lock_s *)&self->_systemModeMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_systemModeMutex);
  p_cachedSystemMode = &self->_cachedSystemMode;
  if (self->_cachedSystemMode.__engaged_) {
    goto LABEL_6;
  }
  v5 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v6 = [v5 systemMode];
  if (p_cachedSystemMode->__engaged_)
  {
    val = p_cachedSystemMode->var0.__val_;
    p_cachedSystemMode->var0.__val_ = (NSString *)v6;
  }
  else
  {
    p_cachedSystemMode->var0.__val_ = (NSString *)v6;
    p_cachedSystemMode->__engaged_ = 1;
  }

  if (p_cachedSystemMode->__engaged_)
  {
LABEL_6:
    id v8 = p_cachedSystemMode->var0.__val_;
    os_unfair_lock_unlock(p_systemModeMutex);
    return v8;
  }
  else
  {
    std::__throw_bad_optional_access[abi:nn180100]();
    __break(1u);
  }
  return result;
}

BOOL __74__LSPlugInQueryWithQueryDictionary_matchesPlugin_pluginData_withDatabase___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  BOOL result = _LSIsCPUTypeSubtypeRunnable(a2, SHIDWORD(a2));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 48) = 0;
  *((unsigned char *)self + 56) = 0;
  *((_DWORD *)self + 16) = 0;
  return self;
}

- (id)_initWithQueryDictionary:(id)a3 applyFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)LSPlugInQueryWithQueryDictionary;
  id v8 = [(LSPlugInQuery *)&v22 _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    unsigned int v10 = (void *)v8[2];
    v8[2] = v9;

    v11 = objc_msgSend(v6, "ls_parseQueryForIdentifiers:", @"NSExtensionIdentifier");
    uint64_t v12 = [v11 copy];
    uint64_t v13 = (void *)v8[3];
    v8[3] = v12;

    uint64_t v14 = objc_msgSend(v6, "ls_parseQueryForIdentifiers:", @"NSExtensionPointName");
    uint64_t v15 = [v14 copy];
    int v16 = (void *)v8[4];
    v8[4] = v15;

    uint64_t v17 = [v7 copy];
    uint64_t v18 = (void *)v8[5];
    v8[5] = v17;

    uint64_t v19 = [v6 objectForKey:@"LSShouldORIdentifiers"];

    if (v19)
    {
      int v20 = (void *)v8[2];
      v8[2] = 0;
    }
  }
  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault(void)::onceToken != -1) {
    dispatch_once(&pluginQueryFault(void)::onceToken, &__block_literal_global_61);
  }

  return v8;
}

- (void).cxx_destruct
{
  if (self->_cachedSystemMode.__engaged_) {

  }
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifiers, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);

  objc_storeStrong((id *)&self->_queryDict, 0);
}

- (id)_queryDictionary
{
  return self->_queryDict;
}

void __70__LSPlugInQueryWithQueryDictionary__enumerateWithXPCConnection_block___block_invoke_79(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3
    && [*(id *)(a1 + 32) matchesPlugin:a2 pluginData:a3 withDatabase:*(void *)(a1 + 48)])
  {
    v5 = *(void **)(a1 + 40);
    id v6 = [NSNumber numberWithUnsignedInt:a2];
    objc_msgSend(v5, "addObject:");
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithQueryDictionary;
  if (![(LSPlugInQuery *)&v12 isEqual:v4] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v10 = 0;
    goto LABEL_9;
  }
  id v5 = v4;
  id v6 = v5;
  queryDict = self->_queryDict;
  if (!queryDict)
  {
    id v8 = [v5 _queryDictionary];

    if (!v8)
    {
      char v10 = 1;
      goto LABEL_7;
    }
    queryDict = self->_queryDict;
  }
  uint64_t v9 = [v6 _queryDictionary];
  char v10 = [(NSDictionary *)queryDict isEqual:v9];

LABEL_7:
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSDictionary *)self->_queryDict ls_hashQuery];
  v5.receiver = self;
  v5.super_class = (Class)LSPlugInQueryWithQueryDictionary;
  return [(LSPlugInQuery *)&v5 hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSPlugInQueryWithQueryDictionary)initWithCoder:(id)a3
{
  id v4 = [a3 decodePropertyListForKey:@"query"];
  objc_super v5 = [(LSPlugInQueryWithQueryDictionary *)self _initWithQueryDictionary:v4 applyFilter:0];

  return v5;
}

- (void)_enumerateWithXPCConnection:(os_log_t)log block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "LSPlugInQuery for plugin search called from a processs that cannot map the database", v1, 2u);
}

@end