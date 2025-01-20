@interface UTTypeRecord
+ (BOOL)_typeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4;
+ (UTTypeRecord)typeRecordWithIdentifier:(id)a3;
+ (UTTypeRecord)typeRecordWithPotentiallyUndeclaredIdentifier:(id)a3;
+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4;
+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5;
+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5;
+ (id)_propertyClasses;
+ (id)_typeRecordWithContext:(LSContext *)a3 forPromiseAtNode:(id)a4 error:(id *)a5;
+ (id)_typeRecordWithContext:(LSContext *)a3 forPromiseResourceValues:(id)a4 error:(id *)a5;
+ (id)_typeRecordWithContext:(LSContext *)a3 identifier:(id)a4 allowUndeclared:(BOOL)a5;
+ (id)_typeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4;
+ (id)enumerator;
+ (id)typeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4;
+ (id)typeRecordForPromiseAtURL:(id)a3 error:(id *)a4;
+ (id)typeRecordsWithIdentifiers:(id)a3;
+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4;
+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5;
+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)conformsToTypeRecord:(id)a3;
- (BOOL)isActive;
- (BOOL)isChildOfTypeIdentifier:(id)a3;
- (BOOL)isCoreType;
- (BOOL)isDeclared;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExported;
- (BOOL)isImported;
- (BOOL)isInPublicDomain;
- (BOOL)isWildcard;
- (LSBundleRecord)declaringBundleRecord;
- (LSPropertyList)declaration;
- (NSData)_declaringBundleBookmark;
- (NSDictionary)iconDictionary;
- (NSDictionary)localizedDescriptionDictionary;
- (NSNumber)version;
- (NSOrderedSet)parentTypeIdentifiers;
- (NSSet)childTypeIdentifiers;
- (NSSet)pedigree;
- (NSString)_delegatePath;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSURL)iconResourceBundleURL;
- (NSURL)referenceURL;
- (_LSLocalizedStringRecord)_localizedDescription;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)debugDescription;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6;
- (id)localizedDescriptionWithPreferredLocalizations:(id)a3;
- (id)preferredTagOfClass:(id)a3;
- (unint64_t)hash;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_iconResourceBundleURL;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)_enumerateRelatedTypesWithMaximumDegreeOfSeparation:(int64_t)a3 block:(id)a4;
- (void)enumerateChildTypesWithBlock:(id)a3;
- (void)enumerateDescendantsWithBlock:(id)a3;
- (void)enumerateParentTypesWithBlock:(id)a3;
- (void)enumeratePedigreeWithBlock:(id)a3;
@end

@implementation UTTypeRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  [(UTTypeRecord *)self identifier];

  id v7 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedDescription];
  if (v7) {
    [v7 detach];
  }
}

- (unint64_t)hash
{
  v2 = [(UTTypeRecord *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(UTTypeRecord *)self identifier];
  BOOL v6 = UTTypeEqual(v5, (CFStringRef)[a3 identifier]) != 0;

  return v6;
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (a6)
  {
    uint64_t var10 = a6->var10;
    if (var10)
    {
      v9 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, var10, *(void *)&a5);
      uint64_t v10 = [v9 _expensiveDictionaryRepresentation];

      v11 = (void *)v10;
    }
    else
    {
      v11 = 0;
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v13 = _UTTypeGetIconName(a3->db, (uint64_t)a6);
    if (v13) {
      [v12 setObject:v13 forKeyedSubscript:@"UTTypeIconName"];
    }
    v14 = _UTTypeGetIconNames(a3->db, (uint64_t)a6);
    if ([v14 count]) {
      [v12 setObject:v14 forKeyedSubscript:@"UTTypeIconFiles"];
    }
    v15 = _UTTypeGetGlyphName(a3->db, (uint64_t)a6);
    if (v15) {
      [v12 setObject:v15 forKeyedSubscript:@"UTTypeGlyphName"];
    }
    if ([v12 count])
    {
      [v12 addEntriesFromDictionary:v11];
      uint64_t v16 = [v12 copy];

      v11 = (void *)v16;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if (!a6)
  {
    id v17 = 0;
    goto LABEL_20;
  }
  v9 = [(UTTypeRecord *)self declaringBundleRecord];
  uint64_t v10 = [v9 URL];

  if ((a6->var2 & 0x2000) != 0 || !a6->var11)
  {
    id v17 = v10;
    v11 = 0;
    v15 = 0;
    goto LABEL_19;
  }
  v11 = (void *)_CSStringCopyCFString();
  uint64_t v12 = _LSBundleGet(a3->db, a6->var5);
  uint64_t v13 = v12;
  if (!v12 || !*(_DWORD *)(v12 + 460)) {
    goto LABEL_17;
  }
  v14 = (void *)_CSStringCopyCFString();
  if (!v14)
  {
    v18 = _LSDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[UTTypeRecord(IconServices) iconResourceBundleURLWithContext:tableID:unitID:unitBytes:]((uint64_t)self, (unsigned int *)(v13 + 460), v18);
    }

LABEL_17:
    v15 = 0;
LABEL_18:
    id v17 = 0;
    goto LABEL_19;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v14 isDirectory:1 relativeToURL:v10];

  if (v15) {
    BOOL v16 = v11 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    goto LABEL_18;
  }
  id v17 = [v15 URLByAppendingPathComponent:v11 isDirectory:1];
LABEL_19:

LABEL_20:

  return v17;
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = [(UTTypeRecord *)self iconDictionary];
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconResourceBundleURL
{
  id v2 = [(UTTypeRecord *)self iconResourceBundleURL];
}

- (NSURL)iconResourceBundleURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconResourceBundleURLWithContext_tableID_unitID_unitBytes_);
}

+ (UTTypeRecord)typeRecordWithIdentifier:(id)a3
{
  return (UTTypeRecord *)[a1 _typeRecordWithIdentifier:a3 allowUndeclared:0];
}

+ (id)_typeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__55;
  v26 = __Block_byref_object_dispose__55;
  id v27 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v19 = 0;
    char v20 = 0;
    id v21 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

    if (v9)
    {
      uint64_t v10 = [a1 _typeRecordWithContext:v9 identifier:a3 allowUndeclared:v4];
      v11 = (void *)v23[5];
      v23[5] = v10;
    }
    if (CurrentContext && v20) {
      _LSContextDestroy(CurrentContext);
    }
    id v12 = v19;
    CurrentContext = 0;
    id v19 = 0;

    char v20 = 0;
    id v13 = v21;
    id v21 = 0;
  }
  else if (_UTTypeIdentifierIsValid((CFStringRef)a3))
  {
    v14 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_84);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__UTTypeRecord__typeRecordWithIdentifier_allowUndeclared___block_invoke_2;
    v17[3] = &unk_1E5231808;
    v17[4] = &v22;
    [v14 getTypeRecordWithIdentifier:a3 allowUndeclared:v4 completionHandler:v17];
  }
  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

+ (id)_typeRecordWithContext:(LSContext *)a3 identifier:(id)a4 allowUndeclared:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v11 = 0;
  if (_UTTypeIdentifierIsDynamic((const __CFString *)a4))
  {
    id v8 = [[_UTDynamicTypeRecord alloc] _initWithContext:a3 dynamicUTI:a4];
  }
  else if (_UTGetActiveTypeForCFStringIdentifier(a3->db, (const __CFString *)a4, &v11))
  {
    uint64_t v9 = [_UTDeclaredTypeRecord alloc];
    id v8 = [(LSRecord *)v9 _initWithContext:a3 tableID:a3->db->schema.utypeTable unitID:v11];
  }
  else if (v5)
  {
    id v8 = [[_UTUndeclaredTypeRecord alloc] _initWithContext:a3 identifier:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__55;
  v36 = __Block_byref_object_dispose__55;
  id v37 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v29 = 0;
    char v30 = 0;
    id v31 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

    if (v10)
    {
      int v27 = 0;
      if (!a5 || _UTGetActiveTypeForCFStringIdentifier(v10->db, (const __CFString *)a5, &v27))
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        db = v10->db;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke;
        v23[3] = &unk_1E5231858;
        int v26 = v27;
        v25 = v10;
        id v13 = v11;
        id v24 = v13;
        _UTEnumerateTypesForTag(db, (const __CFString *)a4, (const __CFString *)a3, v23);
        if (![v13 count])
        {
          v14 = fallbackDynamicOrBaseTypeRecord(v10, (const __CFString *)a3, (__CFString *)a4, (__CFString *)a5);
          if (v14) {
            [v13 addObject:v14];
          }
        }
        uint64_t v15 = [v13 copy];
        BOOL v16 = (void *)v33[5];
        v33[5] = v15;
      }
    }
    if (CurrentContext && v30) {
      _LSContextDestroy(CurrentContext);
    }
    id v17 = v29;
    CurrentContext = 0;
    id v29 = 0;

    char v30 = 0;
    id v18 = v31;
    id v31 = 0;
  }
  else
  {
    id v19 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_12_0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke_3;
    v22[3] = &unk_1E5231880;
    v22[4] = &v32;
    [v19 getTypeRecordsWithTag:a3 ofClass:a4 conformingToIdentifier:a5 completionHandler:v22];
  }
  id v20 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v20;
}

void __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(unsigned char *)(a4 + 8))
  {
    unsigned int v6 = *(_DWORD *)(a1 + 48);
    if (!v6 || _UTTypeConformsTo(**(void ***)(a1 + 40), a3, v6))
    {
      id v7 = -[LSRecord _initWithContext:tableID:unitID:]([_UTDeclaredTypeRecord alloc], "_initWithContext:tableID:unitID:");
      if (v7)
      {
        id v8 = v7;
        [*(id *)(a1 + 32) addObject:v7];
        id v7 = v8;
      }
    }
  }
}

- (id)preferredTagOfClass:(id)a3
{
  BOOL v4 = [(UTTypeRecord *)self tagSpecification];
  uint64_t v5 = objc_opt_class();
  unsigned int v6 = [v4 objectForKey:a3 ofClass:v5 valuesOfClass:objc_opt_class()];
  id v7 = [v6 firstObject];

  return v7;
}

+ (BOOL)_typeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  unsigned int v6 = (void *)MEMORY[0x18530F680](a1, a2);
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v7 = +[UTTypeRecord typeRecordWithIdentifier:a3];
    id v8 = v7;
    if (v7)
    {
      char v9 = [v7 conformsToTypeIdentifier:a4];
      *((unsigned char *)v14 + 24) = v9;
    }
  }
  else
  {
    id v8 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_34_0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__UTTypeRecord__typeIdentifier_conformsToTypeIdentifier___block_invoke_2;
    v12[3] = &unk_1E5231920;
    v12[4] = &v13;
    [v8 getWhetherTypeIdentifier:a3 conformsToTypeIdentifier:a4 completionHandler:v12];
  }

  char v10 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __58__UTTypeRecord__typeRecordWithIdentifier_allowUndeclared___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)_propertyClasses
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  char v30 = __Block_byref_object_copy__55;
  id v31 = __Block_byref_object_dispose__55;
  id v32 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!MayMapDatabase)
  {
    id v12 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_8);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__UTTypeRecord_typeRecordWithTag_ofClass_conformingToIdentifier___block_invoke_2;
    v20[3] = &unk_1E5231808;
    v20[4] = &v27;
    [v12 getTypeRecordWithTag:a3 ofClass:a4 conformingToIdentifier:a5 completionHandler:v20];

    goto LABEL_16;
  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  id v24 = 0;
  char v25 = 0;
  id v26 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  char v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  char v10 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

  if (v10)
  {
    int v22 = 0;
    if (a5)
    {
      if (!_UTGetActiveTypeForCFStringIdentifier(v10->db, (const __CFString *)a5, &v22)) {
        goto LABEL_10;
      }
      int v11 = v22;
    }
    else
    {
      int v11 = 0;
    }
    unsigned int v21 = 0;
    if (_UTTypeGetActiveIdentifierForTag(v10->db, (const __CFString *)a4, (const __CFString *)a3, v11, (uint64_t)&v21))
    {
      uint64_t v13 = [_UTDeclaredTypeRecord alloc];
      uint64_t v14 = [(LSRecord *)v13 _initWithContext:v10 tableID:v10->db->schema.utypeTable unitID:v21];
LABEL_11:
      uint64_t v15 = (void *)v28[5];
      v28[5] = v14;

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v14 = fallbackDynamicOrBaseTypeRecord(v10, (const __CFString *)a3, (__CFString *)a4, (__CFString *)a5);
    goto LABEL_11;
  }
LABEL_12:
  if (CurrentContext && v25) {
    _LSContextDestroy(CurrentContext);
  }
  id v16 = v24;
  CurrentContext = 0;
  id v24 = 0;

  char v25 = 0;
  id v17 = v26;
  id v26 = 0;

LABEL_16:
  id v18 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return (UTTypeRecord *)v18;
}

+ (id)enumerator
{
  id v2 = [(_LSDBEnumerator *)[_LSTypeEnumerator alloc] _initWithContext:0];

  return v2;
}

+ (UTTypeRecord)typeRecordWithPotentiallyUndeclaredIdentifier:(id)a3
{
  return (UTTypeRecord *)[a1 _typeRecordWithIdentifier:a3 allowUndeclared:1];
}

+ (id)typeRecordsWithIdentifiers:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__55;
  v36 = __Block_byref_object_dispose__55;
  id v37 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v29 = 0;
    char v30 = 0;
    id v31 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    unsigned int v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v6, 0);

    if (v7)
    {
      id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = a3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v14 = [a1 _typeRecordWithContext:v7 identifier:v13 allowUndeclared:0];
            if (v14) {
              [v8 setObject:v14 forKeyedSubscript:v13];
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v38 count:16];
        }
        while (v10);
      }

      uint64_t v15 = [v8 copy];
      id v16 = (void *)v33[5];
      v33[5] = v15;
    }
    if (CurrentContext && v30) {
      _LSContextDestroy(CurrentContext);
    }
    id v17 = v29;
    CurrentContext = 0;
    id v29 = 0;

    char v30 = 0;
    id v18 = v31;
    id v31 = 0;
  }
  else
  {
    id v19 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_4_0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __43__UTTypeRecord_typeRecordsWithIdentifiers___block_invoke_2;
    v23[3] = &unk_1E5231830;
    void v23[4] = &v32;
    [v19 getTypeRecordsWithIdentifiers:a3 completionHandler:v23];
  }
  id v20 = (void *)v33[5];
  if (!v20)
  {
    v33[5] = MEMORY[0x1E4F1CC08];

    id v20 = (void *)v33[5];
  }
  id v21 = v20;
  _Block_object_dispose(&v32, 8);

  return v21;
}

void __43__UTTypeRecord_typeRecordsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5
{
  id v8 = [a5 identifier];
  id v9 = [a1 typeRecordWithTag:a3 ofClass:a4 conformingToIdentifier:v8];

  return (UTTypeRecord *)v9;
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToTypeRecord:(id)a5
{
  id v8 = [a5 identifier];
  id v9 = [a1 typeRecordsWithTag:a3 ofClass:a4 conformingToIdentifier:v8];

  return v9;
}

void __65__UTTypeRecord_typeRecordWithTag_ofClass_conformingToIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

void __66__UTTypeRecord_typeRecordsWithTag_ofClass_conformingToIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
}

+ (UTTypeRecord)typeRecordWithTag:(id)a3 ofClass:(id)a4
{
  return (UTTypeRecord *)[a1 typeRecordWithTag:a3 ofClass:a4 conformingToIdentifier:0];
}

+ (id)typeRecordsWithTag:(id)a3 ofClass:(id)a4
{
  return (id)[a1 typeRecordsWithTag:a3 ofClass:a4 conformingToIdentifier:0];
}

+ (id)typeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__55;
  uint64_t v39 = __Block_byref_object_dispose__55;
  id v40 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!MayMapDatabase)
  {
    uint64_t v11 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_15);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__UTTypeRecord_typeRecordForImportedTypeWithIdentifier_conformingToIdentifier___block_invoke_2;
    v27[3] = &unk_1E5231808;
    v27[4] = &v35;
    [v11 getTypeRecordForImportedTypeWithIdentifier:a3 conformingToIdentifier:v5 completionHandler:v27];

    goto LABEL_25;
  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  id v32 = 0;
  char v33 = 0;
  id v34 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v8 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v7, 0);

  if (v8)
  {
    unsigned int v30 = 0;
    if (!_UTGetActiveTypeForCFStringIdentifier(*v8, (const __CFString *)a3, &v30)
      || (uint64_t EntryWithClass = _LSBindingListGetEntryWithClass(*v8)) == 0
      || !*(_DWORD *)(EntryWithClass + 4)
      || !*(_DWORD *)(EntryWithClass + 8))
    {
LABEL_19:
      if (v30)
      {
        id v20 = [_UTDeclaredTypeRecord alloc];
        uint64_t v21 = [(LSRecord *)v20 _initWithContext:v8 tableID:*((unsigned int *)*v8 + 8) unitID:v30];
        int v22 = (void *)v36[5];
        v36[5] = v21;
      }
      goto LABEL_21;
    }
    int v29 = 0;
    uint64_t v10 = *v8;
    if (v5)
    {
      _UTGetActiveTypeForCFStringIdentifier(*v8, v5, &v29);
      goto LABEL_15;
    }
    int v12 = v30;
    unsigned int TypeData = _UTTypeGetTypeData((_LSDatabase *)*v8);
    int v14 = _UTTypeConformsTo(v10, v12, TypeData);
    uint64_t v15 = *v8;
    if (v14)
    {
      int v16 = _UTTypeGetTypeData((_LSDatabase *)*v8);
    }
    else
    {
      int v17 = v30;
      unsigned int TypePackage = _UTTypeGetTypePackage((_LSDatabase *)*v8);
      if (!_UTTypeConformsTo(v15, v17, TypePackage)) {
        goto LABEL_15;
      }
      int v16 = _UTTypeGetTypePackage((_LSDatabase *)*v8);
    }
    int v29 = v16;
LABEL_15:
    id v19 = (__CFString *)_CSStringCopyCFString();
    if (v19)
    {
      unsigned int v28 = 0;
      if (_UTTypeGetActiveIdentifierForTag(*v8, @"public.filename-extension", v19, v29, (uint64_t)&v28)) {
        unsigned int v30 = v28;
      }
    }

    goto LABEL_19;
  }
LABEL_21:
  if (CurrentContext && v33) {
    _LSContextDestroy(CurrentContext);
  }
  id v23 = v32;
  CurrentContext = 0;
  id v32 = 0;

  char v33 = 0;
  id v24 = v34;
  id v34 = 0;

LABEL_25:
  id v25 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v25;
}

void __79__UTTypeRecord_typeRecordForImportedTypeWithIdentifier_conformingToIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)typeRecordForPromiseAtURL:(id)a3 error:(id *)a4
{
  unsigned int v6 = [[FSNode alloc] initWithURL:a3 flags:0 error:a4];
  uint64_t v7 = v6;
  if (v6)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)v6);
    id v18 = 0;
    char v19 = 0;
    id v20 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    id v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

    if (v9)
    {
      uint64_t v10 = [a1 _typeRecordWithContext:v9 forPromiseAtNode:v7 error:a4];
    }
    else if (a4)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v11, 0);

      if (v12) {
        id v13 = 0;
      }
      else {
        id v13 = v20;
      }
      uint64_t v10 = 0;
      *a4 = v13;
    }
    else
    {
      uint64_t v10 = 0;
    }
    if (CurrentContext && v19) {
      _LSContextDestroy(CurrentContext);
    }
    id v14 = v18;
    CurrentContext = 0;
    id v18 = 0;

    char v19 = 0;
    id v15 = v20;
    id v20 = 0;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return (NSString *)&stru_1ECB1A570;
}

- (NSNumber)version
{
  return 0;
}

- (BOOL)isDynamic
{
  return 0;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isWildcard
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  return 0;
}

- (BOOL)isExported
{
  return 0;
}

- (BOOL)isImported
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isCoreType
{
  return 0;
}

- (LSBundleRecord)declaringBundleRecord
{
  return 0;
}

- (LSPropertyList)declaration
{
  return (LSPropertyList *)MEMORY[0x1E4F1CC08];
}

- (NSURL)referenceURL
{
  return 0;
}

- (BOOL)conformsToTypeRecord:(id)a3
{
  BOOL v4 = [a3 identifier];
  LOBYTE(self) = [(UTTypeRecord *)self conformsToTypeIdentifier:v4];

  return (char)self;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  return 0;
}

- (NSSet)pedigree
{
  id v4 = [(UTTypeRecord *)self identifier];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v4 count:1];

  return (NSSet *)v2;
}

- (NSOrderedSet)parentTypeIdentifiers
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);

  return (NSOrderedSet *)v2;
}

- (NSSet)childTypeIdentifiers
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);

  return (NSSet *)v2;
}

- (BOOL)isChildOfTypeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lowercaseString];

  unsigned int v6 = [(UTTypeRecord *)self parentTypeIdentifiers];
  LOBYTE(v4) = [v6 containsObject:v5];

  return (char)v4;
}

- (void)enumeratePedigreeWithBlock:(id)a3
{
}

- (void)enumerateDescendantsWithBlock:(id)a3
{
}

- (void)enumerateParentTypesWithBlock:(id)a3
{
}

- (void)enumerateChildTypesWithBlock:(id)a3
{
}

- (NSString)localizedDescription
{
  id v2 = [(UTTypeRecord *)self _localizedDescription];
  unint64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (id)localizedDescriptionWithPreferredLocalizations:(id)a3
{
  id v4 = [(UTTypeRecord *)self _localizedDescription];
  uint64_t v5 = [v4 stringValueWithPreferredLocalizations:a3];

  return v5;
}

- (NSDictionary)localizedDescriptionDictionary
{
  id v2 = [(UTTypeRecord *)self _localizedDescription];
  unint64_t v3 = [v2 allStringValues];
  id v4 = v3;
  if (!v3) {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v5 = v3;

  return v5;
}

- (_LSLocalizedStringRecord)_localizedDescription
{
  return 0;
}

- (NSData)_declaringBundleBookmark
{
  return 0;
}

- (NSString)_delegatePath
{
  return 0;
}

- (void)_enumerateRelatedTypesWithMaximumDegreeOfSeparation:(int64_t)a3 block:(id)a4
{
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__55;
  id v32 = __Block_byref_object_dispose__55;
  id v33 = 0;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x4812000000;
  id v24 = __Block_byref_object_copy__24;
  id v25 = __Block_byref_object_dispose__25;
  long long v26 = &unk_182B5933F;
  memset(v27, 0, sizeof(v27));
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke;
  v20[3] = &unk_1E52318D0;
  v20[4] = self;
  void v20[5] = &v28;
  v20[6] = &v21;
  v20[7] = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_3;
  v19[3] = &unk_1E522D0F8;
  v19[5] = a4;
  v19[6] = a3;
  v19[4] = self;
  [(LSRecord *)self _ifAttached:v20 else:v19];
  uint64_t v5 = (void *)v29[5];
  if (!v5) {
    goto LABEL_16;
  }
  unsigned int v6 = v5;
  v34[0] = v6;
  unsigned __int8 v18 = 0;
  uint64_t v7 = v22[6];
  uint64_t v8 = v22[7];
  if (v7 == v8) {
    goto LABEL_15;
  }
  uint64_t v9 = v7 + 24;
  do
  {
    uint64_t v10 = (void *)MEMORY[0x18530F680]();
    if (*(unsigned char *)(v9 - 4))
    {
      uint64_t v11 = *(unsigned int *)(v9 - 8);
      uint64_t v12 = [_UTDeclaredTypeRecord alloc];
      uint64_t v13 = [(LSRecord *)v12 _initWithContext:v34 tableID:*((unsigned int *)v34[0] + 8) unitID:v11];
      id v14 = (void *)v13;
      if (*(unsigned char *)(v9 - 4))
      {
        if (!v13) {
          goto LABEL_11;
        }
LABEL_10:
        (*((void (**)(id, void *, void, unsigned __int8 *))a4 + 2))(a4, v14, *(void *)(v9 - 16), &v18);
        goto LABEL_11;
      }
    }
    else
    {
      id v14 = 0;
    }
    id v15 = [[_UTDynamicTypeRecord alloc] _initWithContext:v34 dynamicUTI:*(void *)(v9 - 24)];

    id v14 = v15;
    if (v15) {
      goto LABEL_10;
    }
LABEL_11:
    int v16 = v18;

    if (v16) {
      break;
    }
    BOOL v17 = v9 == v8;
    v9 += 24;
  }
  while (!v17);
  unsigned int v6 = v34[0];
LABEL_15:

LABEL_16:
  _Block_object_dispose(&v21, 8);
  v34[0] = (void **)v27;
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100](v34);
  _Block_object_dispose(&v28, 8);
}

uint64_t __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke(void *a1, id *a2, uint64_t a3, uint64_t a4)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *a2);
  uint64_t v7 = (void *)a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_2;
  v10[3] = &unk_1E52318A8;
  uint64_t v8 = a1[7];
  v10[4] = a1[6];
  return [v7 _enumerateRelatedTypeUnitsOrDynamicIdsWithContext:a2 unitID:a4 maximumDegreeOfSeparation:v8 block:v10];
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_2(uint64_t a1, void **a2)
{
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::push_back[abi:nn180100]((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), (uint64_t)a2);
  unint64_t v3 = *a2;
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_3(uint64_t a1)
{
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v2 = [UTTypeRecord alloc];
    unint64_t v3 = [*(id *)(a1 + 32) persistentIdentifier];
    uint64_t v9 = [(LSRecord *)v2 initWithPersistentIdentifier:v3];

    if (v9)
    {
      [(UTTypeRecord *)v9 _enumerateRelatedTypesWithMaximumDegreeOfSeparation:*(void *)(a1 + 48) block:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      uint64_t v8 = +[UTTypeRecord typeRecordWithIdentifier:v7];

      if (v8) {
        [v8 _enumerateRelatedTypesWithMaximumDegreeOfSeparation:*(void *)(a1 + 48) block:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    id v4 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_30);
    uint64_t v5 = [*(id *)(a1 + 32) identifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_5;
    v10[3] = &unk_1E52318F8;
    uint64_t v6 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    [v4 getRelatedTypesOfTypeWithIdentifier:v5 maximumDegreeOfSeparation:v6 completionHandler:v10];
  }
}

void __74__UTTypeRecord__enumerateRelatedTypesWithMaximumDegreeOfSeparation_block___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = [a2 count];
  unint64_t v7 = [a3 count];
  if (v7 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v7;
  }
  char v13 = 0;
  if (v8)
  {
    unint64_t v9 = 1;
    do
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [a2 objectAtIndexedSubscript:v9 - 1];
      uint64_t v12 = [a3 objectAtIndexedSubscript:v9 - 1];
      (*(void (**)(uint64_t, void *, uint64_t, char *))(v10 + 16))(v10, v11, [v12 integerValue], &v13);

      if (v9 >= v8) {
        break;
      }
      ++v9;
    }
    while (!v13);
  }
}

uint64_t __57__UTTypeRecord__typeIdentifier_conformsToTypeIdentifier___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)_typeRecordWithContext:(LSContext *)a3 forPromiseAtNode:(id)a4 error:(id *)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    char v13 = [NSString stringWithUTF8String:"+[UTTypeRecord _typeRecordWithContext:forPromiseAtNode:error:]"];
    [v12 handleFailureInFunction:v13, @"UTTypeRecord.mm", 722, @"Invalid parameter not satisfying: %@", @"ctx != NULL" file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  id v15 = [NSString stringWithUTF8String:"+[UTTypeRecord _typeRecordWithContext:forPromiseAtNode:error:]"];
  [v14 handleFailureInFunction:v15, @"UTTypeRecord.mm", 723, @"Invalid parameter not satisfying: %@", @"node != nil" file lineNumber description];

LABEL_3:
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__55;
  long long v27 = __Block_byref_object_dispose__55;
  id v28 = 0;
  uint64_t v17 = 0;
  unsigned __int8 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__55;
  uint64_t v21 = __Block_byref_object_dispose__55;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__UTTypeRecord__typeRecordWithContext_forPromiseAtNode_error___block_invoke;
  v16[3] = &unk_1E522BDE0;
  v16[4] = a4;
  v16[5] = &v23;
  v16[6] = &v17;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v16);
  uint64_t v9 = v24[5];
  if (v9)
  {
    uint64_t v10 = [a1 _typeRecordWithContext:a3 forPromiseResourceValues:v9 error:a5];
  }
  else
  {
    uint64_t v10 = 0;
    if (a5) {
      *a5 = (id) v18[5];
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v10;
}

void __62__UTTypeRecord__typeRecordWithContext_forPromiseAtNode_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0;
  uint64_t v3 = [v2 sideFaultResourceValuesWithError:&v9];
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

+ (id)_typeRecordWithContext:(LSContext *)a3 forPromiseResourceValues:(id)a4 error:(id *)a5
{
  unsigned int v31 = 0;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v27 = [NSString stringWithUTF8String:"+[UTTypeRecord _typeRecordWithContext:forPromiseResourceValues:error:]"];
    [v26 handleFailureInFunction:v27, @"UTTypeRecord.mm", 751, @"Invalid parameter not satisfying: %@", @"ctx != NULL" file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  int v29 = [NSString stringWithUTF8String:"+[UTTypeRecord _typeRecordWithContext:forPromiseResourceValues:error:]"];
  [v28 handleFailureInFunction:v29, @"UTTypeRecord.mm", 752, @"Invalid parameter not satisfying: %@", @"props != nil" file lineNumber description];

LABEL_3:
  unsigned int v30 = 0;
  unint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F1C5C0]];
  id v9 = v8;
  if (!v8)
  {
LABEL_13:
    int v17 = 0;
    goto LABEL_20;
  }
  if ([v8 isEqual:*MEMORY[0x1E4F1C5D0]])
  {
    uint64_t v10 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F1C610]];
    char v11 = [v10 BOOLValue];

    db = a3->db;
    if (v11)
    {
      char v13 = (const __CFString **)&kUTTypeAliasFile;
LABEL_12:
      _UTGetActiveTypeForCFStringIdentifier(db, *v13, &v30);
      int v17 = 0;
      goto LABEL_20;
    }
    unsigned int TypeData = _UTTypeGetTypeData(db);
    goto LABEL_15;
  }
  if (![v9 isEqual:*MEMORY[0x1E4F1C5B8]])
  {
    if ([v9 isEqual:*MEMORY[0x1E4F1C5E0]])
    {
      db = a3->db;
      char v13 = (const __CFString **)&kUTTypeSymLink;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v14 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F1C658]];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    unsigned int TypeData = _UTTypeGetTypePackage(a3->db);
LABEL_15:
    unsigned int v30 = TypeData;
    int v17 = 1;
    goto LABEL_20;
  }
  unsigned __int8 v18 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F1C6A0]];
  int v19 = [v18 BOOLValue];

  id v20 = a3->db;
  if (v19) {
    unsigned int TypeVolume = _UTTypeGetTypeVolume(v20);
  }
  else {
    unsigned int TypeVolume = _UTTypeGetTypeFolder(v20);
  }
  int v17 = 0;
  unsigned int v30 = TypeVolume;
LABEL_20:

  if (v30)
  {
    if (v17)
    {
      id v22 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F1C6E8]];
      if (v22)
      {
        _CFGetPathExtensionRangesFromPathComponent();
      }
    }
    id v23 = 0;
    unsigned int v31 = v30;

    if (v31)
    {
      id v24 = [_UTDeclaredTypeRecord alloc];
      id v23 = [(LSRecord *)v24 _initWithContext:a3 tableID:a3->db->schema.utypeTable unitID:v31];
    }
  }
  else
  {
    id v23 = 0;
  }
  if (a5 && !v23)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10813, (uint64_t)"+[UTTypeRecord _typeRecordWithContext:forPromiseResourceValues:error:]", 825, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a4->var3 != a3->db->schema.utypeTable)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UTTypeRecord.mm", 846, @"Invalid parameter not satisfying: %@", @"pi->tableID == ctx->db->schema.utypeTable" object file lineNumber description];
  }
  if (a5 < 0x1D)
  {
    if (_UTTypeGet())
    {
      id v12 = [(LSRecord *)[_UTDeclaredTypeRecord alloc] _initWithContext:a3 tableID:a4->var3 unitID:a4->var2];
    }
    else
    {
      char v13 = _LSRecordLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_DEBUG, "Failed to initialize type record with persistent identifier %@ because the type could not be found.", buf, 0xCu);
      }
      return 0;
    }
  }
  else
  {
    CFStringRef v9 = (const __CFString *)[[NSString alloc] initWithBytesNoCopy:a4->var5 length:a5 - 28 encoding:4 freeWhenDone:0];
    uint64_t v10 = (__CFString *)v9;
    if (v9)
    {
      if (UTTypeIsDynamic(v9)) {
        id v11 = [[_UTDynamicTypeRecord alloc] _initWithContext:a3 dynamicUTI:v10];
      }
      else {
        id v11 = [[_UTUndeclaredTypeRecord alloc] _initWithContext:a3 identifier:v10];
      }
      id v12 = v11;
    }
    else
    {
      int v15 = _LSRecordLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v16;
        _os_log_impl(&dword_182959000, v15, OS_LOG_TYPE_DEBUG, "Failed to initialize type record with persistent identifier %@ because the stored type was not valid UTF-8.", buf, 0xCu);
      }
      id v12 = 0;
    }
  }
  return v12;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(UTTypeRecord *)self identifier];
  unint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p> { identifier: %@ }", v4, self, v5];

  return v6;
}

@end