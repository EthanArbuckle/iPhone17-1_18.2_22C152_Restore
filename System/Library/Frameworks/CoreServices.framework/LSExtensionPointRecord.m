@interface LSExtensionPointRecord
+ (BOOL)isCurrentProcessAnApplicationExtension;
+ (BOOL)supportsSecureCoding;
+ (LSExtensionPointRecord)extensionPointRecordForCurrentProcess;
+ (NSString)identifierForCurrentProcess;
+ (id)_propertyClasses;
+ (id)enumerator;
+ (id)enumeratorForExtensionPointIdentifier:(id)a3;
+ (id)enumeratorWithParentApplicationRecord:(id)a3;
+ (void)identifierForCurrentProcess;
+ (void)setExtensionPointRecordForCurrentProcess:(id)a3;
- (LSApplicationRecord)parentAppRecord;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 error:(id *)a4;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 parentAppRecord:(id)a4 error:(id *)a5;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5;
- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 parentAppRecord:(id)a5 error:(id *)a6;
- (LSPropertyList)SDKDictionary;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (id)SDKDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)nameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)parentAppRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (unsigned)TCCPolicy;
- (unsigned)TCCPolicyWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (unsigned)extensionPointType;
- (unsigned)extensionPointTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (unsigned)platform;
- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6;
- (void)_LSRecord_resolve_SDKDictionary;
- (void)_LSRecord_resolve_identifier;
- (void)_LSRecord_resolve_name;
- (void)_LSRecord_resolve_parentAppRecord;
- (void)_LSRecord_resolve_version;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation LSExtensionPointRecord

- (id)nameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_SDKDictionary, *(void *)&a4, *(void *)&a5, a6);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v6 detach];
  }
}

- (id)SDKDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->var5, *(void *)&a5);
}

- (id)parentAppRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  if (a6->var7)
  {
    v8 = [LSApplicationRecord alloc];
    uint64_t var7 = a6->var7;
    id v12 = 0;
    id v10 = [(LSApplicationRecord *)v8 _initWithContext:a3 bundleID:var7 bundleData:0 error:&v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)&a6->var2._opaque[16];
  v9[0] = *(_OWORD *)a6->var2._opaque;
  v9[1] = v6;
  v7 = _LSVersionNumberGetStringRepresentation(v9);

  return v7;
}

- (void)_LSRecord_resolve_name
{
  id v2 = [(LSExtensionPointRecord *)self name];
}

- (NSString)name
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_nameWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var4;
}

- (unsigned)extensionPointType
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_extensionPointTypeWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_identifier
{
  id v2 = [(LSExtensionPointRecord *)self identifier];
}

- (unsigned)TCCPolicy
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_TCCPolicyWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)extensionPointTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var8;
}

- (unsigned)TCCPolicyWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSExtensionPointData *)a6
{
  return a6->var9;
}

+ (BOOL)isCurrentProcessAnApplicationExtension
{
  id v2 = [a1 identifierForCurrentProcess];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (NSString)identifierForCurrentProcess
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = v2;
  if (!v2)
  {
    v8 = 0;
    goto LABEL_24;
  }
  v4 = [v2 infoDictionary];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 objectForKey:@"NSExtension"];
  v7 = (void *)v6;
  if (v5 && v6)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v7 = 0;
      goto LABEL_22;
    }
  }
  else
  {

    if (!v7)
    {
LABEL_22:
      v8 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v7 objectForKey:@"NSExtensionPointIdentifier"];
  v8 = (void *)v10;
  if (v9 && v10)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_22;
    }
LABEL_13:
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[LSExtensionPointRecord identifierForCurrentProcess];
    }

    id v12 = [v3 bundlePath];
    v13 = [v12 pathExtension];

    if (!v13 || [v13 caseInsensitiveCompare:@"appex"])
    {
      v14 = _LSDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        +[LSExtensionPointRecord identifierForCurrentProcess];
      }

      v8 = 0;
    }

    goto LABEL_23;
  }
  if (v10) {
    goto LABEL_13;
  }
LABEL_23:

LABEL_24:

  return (NSString *)v8;
}

- (void)_LSRecord_resolve_SDKDictionary
{
  id v2 = [(LSExtensionPointRecord *)self SDKDictionary];
}

- (LSPropertyList)SDKDictionary
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_SDKDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (NSString)identifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_identifierWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)platform
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_platformWithContext_tableID_unitID_unitBytes_);
}

+ (id)enumeratorForExtensionPointIdentifier:(id)a3
{
  BOOL v3 = [[_LSExtensionPointRecordEnumerator alloc] initWithExtensionPointIdentifier:a3];

  return v3;
}

- (void)_LSRecord_resolve_version
{
  id v2 = [(LSExtensionPointRecord *)self version];
}

- (NSString)version
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_versionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_parentAppRecord
{
  id v2 = [(LSExtensionPointRecord *)self parentAppRecord];
}

- (LSApplicationRecord)parentAppRecord
{
  return (LSApplicationRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_parentAppRecordWithContext_tableID_unitID_unitBytes_);
}

+ (id)_propertyClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LSExtensionPointRecord)extensionPointRecordForCurrentProcess
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11 = (id *)&v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__28;
  v14 = __Block_byref_object_dispose__28;
  id v15 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  objc_storeStrong(v11 + 5, (id)currentExtensionPointRecord);
  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
  id v2 = v11[5];
  if (!v2)
  {
    if (_LSCurrentProcessMayMapDatabase())
    {
      BOOL v3 = +[LSBundleRecord bundleRecordForCurrentProcess];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v3 extensionPointRecord];
        uint64_t v5 = v11[5];
        v11[5] = (id)v4;
      }
      else
      {
        uint64_t v5 = _LSExtensionsLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          pid_t v6 = getpid();
          *(_DWORD *)buf = 67109120;
          pid_t v17 = v6;
          _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_INFO, "Bundle record not found for current process %d", buf, 8u);
        }
      }
    }
    else
    {
      BOOL v3 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_41);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      _OWORD v9[2] = __63__LSExtensionPointRecord_extensionPointRecordForCurrentProcess__block_invoke_2;
      v9[3] = &unk_1E522F7E8;
      v9[4] = &v10;
      [v3 getExtensionPointRecordForCurrentProcessWithCompletionHandler:v9];
    }

    id v2 = v11[5];
    if (v2)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
      objc_storeStrong((id *)&currentExtensionPointRecord, v11[5]);
      os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
      id v2 = v11[5];
    }
  }
  id v7 = v2;
  _Block_object_dispose(&v10, 8);

  return (LSExtensionPointRecord *)v7;
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 error:(id *)a4
{
  return [(LSExtensionPointRecord *)self initWithIdentifier:a3 parentAppRecord:0 error:a4];
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 parentAppRecord:(id)a4 error:(id *)a5
{
  return [(LSExtensionPointRecord *)self initWithIdentifier:a3 platform:dyld_get_active_platform() parentAppRecord:a4 error:a5];
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 error:(id *)a5
{
  return [(LSExtensionPointRecord *)self initWithIdentifier:a3 platform:*(void *)&a4 parentAppRecord:0 error:a5];
}

- (LSExtensionPointRecord)initWithIdentifier:(id)a3 platform:(unsigned int)a4 parentAppRecord:(id)a5 error:(id *)a6
{
  if (!a3)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"LSExtensionPointRecord.mm", 76, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier != nil" object file lineNumber description];
  }
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    p_CurrentContext = 0;
    LOBYTE(v44) = 0;
    v45 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v11, 0);

    if (v12)
    {
      LODWORD(v34[0]) = 0;
      uint64_t v36 = 0;
      if (a5) {
        uint64_t v13 = [a5 unitID];
      }
      else {
        uint64_t v13 = 0;
      }
      int v22 = _LSExtensionPointFindWithIdentifier(*v12, (const __CFString *)a3, a4, v13, v34, &v36);
      if (_LSGetNSErrorFromOSStatusImpl(v22, a6, (uint64_t)"-[LSExtensionPointRecord initWithIdentifier:platform:parentAppRecord:error:]", 85))
      {
        uint64_t v23 = *((unsigned int *)*v12 + 402);
        v33.receiver = self;
        v33.super_class = (Class)LSExtensionPointRecord;
        v24 = [(LSRecord *)&v33 _initWithContext:v12 tableID:v23 unitID:LODWORD(v34[0])];
        goto LABEL_29;
      }
    }
    else if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v19 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v19, 0);

      if (v20) {
        v21 = 0;
      }
      else {
        v21 = v45;
      }
      *a6 = v21;
    }

    v24 = 0;
LABEL_29:
    if (CurrentContext && (_BYTE)v44) {
      _LSContextDestroy(CurrentContext);
    }
    v26 = p_CurrentContext;
    CurrentContext = 0;
    p_CurrentContext = 0;

    LOBYTE(v44) = 0;
    v27 = v45;
    v45 = 0;

    return v24;
  }
  v31 = self;
  CurrentContext = 0;
  p_CurrentContext = (void **)&CurrentContext;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__28;
  v46 = __Block_byref_object_dispose__28;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__28;
  v40 = __Block_byref_object_dispose__28;
  id v41 = 0;
  v14 = (void (*)(void, void))MEMORY[0x1E4F143A8];
  int v15 = 11;
  while (1)
  {
    v35[0] = v14;
    v35[1] = (void (*)(void, void))3221225472;
    v35[2] = (void (*)(void, void))___ZL12getEPFromLSDP8NSStringjPU15__autoreleasingP7NSError_block_invoke;
    v35[3] = (void (*)(void, void))&unk_1E522BA78;
    v35[4] = (void (*)(void, void))&CurrentContext;
    v16 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v35);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = ___ZL12getEPFromLSDP8NSStringjPU15__autoreleasingP7NSError_block_invoke_2;
    v34[3] = &unk_1E522F810;
    v34[4] = &v36;
    v34[5] = &CurrentContext;
    [v16 getExtensionPointRecordWithIdentifier:a3 platform:a4 completionHandler:v34];
    if (v37[5] || !_LSNSErrorIsXPCConnectionInterrupted(p_CurrentContext[5])) {
      break;
    }

    if (--v15 <= 1) {
      goto LABEL_13;
    }
  }

LABEL_13:
  pid_t v17 = (void *)v37[5];
  if (v17)
  {
    id v18 = 0;
  }
  else
  {
    id v18 = p_CurrentContext[5];
    pid_t v17 = (void *)v37[5];
  }
  v24 = v17;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&CurrentContext, 8);
  id v25 = v18;

  if (a6 && !v24) {
    *a6 = v25;
  }

  return v24;
}

void __63__LSExtensionPointRecord_extensionPointRecordForCurrentProcess__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)setExtensionPointRecordForCurrentProcess:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&currentLock);
  objc_storeStrong((id *)&currentExtensionPointRecord, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&currentLock);
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  id v6 = [[LSExtensionPoint alloc] _initWithRecord:self resolveAndDetach:0];

  return v6;
}

+ (id)enumerator
{
  id v2 = [(_LSDBEnumerator *)[_LSExtensionPointRecordEnumerator alloc] _initWithContext:0];

  return v2;
}

+ (id)enumeratorWithParentApplicationRecord:(id)a3
{
  id v4 = [(_LSDBEnumerator *)[_LSExtensionPointRecordEnumerator alloc] _initWithContext:0];
  [v4 setParentApplicationRecord:a3];

  return v4;
}

+ (void)identifierForCurrentProcess
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Found extension point identifier %{public}@ for the current process", (uint8_t *)&v2, 0xCu);
}

@end