@interface LSApplicationExtensionRecord
+ (BOOL)supportsSecureCoding;
+ (id)_propertyClasses;
+ (id)appexRecordsForUnitIDsWithContext:(LSContext *)a3 unitIDs:(const void *)a4;
+ (id)applicationExtensionRecordsForUUIDs:(id)a3 outContainingBundleRecords:(id *)a4 error:(id *)a5;
+ (id)enumeratorWithExtensionPointRecord:(id)a3 options:(unint64_t)a4;
+ (id)enumeratorWithOptions:(unint64_t)a3;
+ (id)redactedAppexRecordWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 error:(id *)a7;
- (BOOL)_containerized;
- (BOOL)_usesSystemPersona;
- (BOOL)appProtectionHidden;
- (BOOL)appProtectionLocked;
- (BOOL)optsOutOfAppProtectionShield;
- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 error:(id *)a4;
- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 error:(id *)a5;
- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 platform:(unsigned int)a5 error:(id *)a6;
- (LSApplicationExtensionRecord)initWithURL:(id)a3 error:(id *)a4;
- (LSApplicationExtensionRecord)initWithURL:(id)a3 requireValid:(BOOL)a4 error:(id *)a5;
- (LSApplicationExtensionRecord)initWithUUID:(id)a3 error:(id *)a4;
- (LSApplicationExtensionRecord)initWithUUID:(id)a3 requireValid:(BOOL)a4 error:(id *)a5;
- (LSBundleRecord)_containingBundleRecord;
- (LSBundleRecord)containingBundleRecord;
- (LSExtensionPointRecord)extensionPointRecord;
- (NSDictionary)iconDictionary;
- (NSString)appProtectionEffectiveContainer;
- (NSString)effectiveBundleIdentifier;
- (NSUUID)uniqueIdentifier;
- (char)developerType;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_containingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 error:(id *)a6;
- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 extensionPointRecord:(id)a6 error:(id *)a7;
- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 context:(LSContext *)a6 requireValid:(BOOL)a7 error:(id *)a8;
- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 context:(LSContext *)CurrentContext requireValid:(BOOL)a8 allowRedacted:(BOOL)a9 error:(id *)a10;
- (id)_intentsArrayForKey:(id)a3;
- (id)_personasWithAttributes;
- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5;
- (id)appProtectionEffectiveContainerWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)associatedPersonas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectiveBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)extensionPointRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (id)intentsRestrictedWhileLocked;
- (id)intentsRestrictedWhileProtectedDataUnavailable;
- (id)managedPersonas;
- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4;
- (id)supportedIntentMediaCategories;
- (id)supportedIntents;
- (id)uniqueIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (unint64_t)_containerClass;
- (unint64_t)compatibilityState;
- (unsigned)pluginFlags;
- (unsigned)pluginFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6;
- (void)_LSRecord_resolve__containingBundleRecord;
- (void)_LSRecord_resolve_appProtectionEffectiveContainer;
- (void)_LSRecord_resolve_effectiveBundleIdentifier;
- (void)_LSRecord_resolve_extensionPointRecord;
- (void)_LSRecord_resolve_iconDictionary;
- (void)_LSRecord_resolve_uniqueIdentifier;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
@end

@implementation LSApplicationExtensionRecord

- (void).cxx_destruct
{
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(LSApplicationExtensionRecord *)self uniqueIdentifier];

  v15.receiver = self;
  v15.super_class = (Class)LSApplicationExtensionRecord;
  [(LSBundleRecord *)&v15 _detachFromContext:a3 tableID:v8 unitID:v7 unitBytes:a6];
  v11 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__containingBundleRecord];
  v12 = v11;
  if (v11) {
    [v11 detach];
  }

  v13 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel_extensionPointRecord];
  v14 = v13;
  if (v13) {
    [v13 detach];
  }
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_uniqueIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)uniqueIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  v6 = (void *)_CSStringCopyCFString();
  if (v6) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)effectiveBundleIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  v6 = (void *)_CSStringCopyCFString();
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)_CSStringCopyCFString();
  }
  v9 = v8;

  return v9;
}

- (id)_containingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);

  if (WeakRetained) {
    goto LABEL_2;
  }
  v9 = (_DWORD *)_LSBundleGet(a3->db, a6->var8);
  if (v9)
  {
    if (v9[42] != 2)
    {
LABEL_2:
      v9 = 0;
      goto LABEL_3;
    }
    v9 = [[LSApplicationRecord alloc] _initWithContext:a3 bundleID:a6->var8 bundleData:v9 error:0];
  }
LABEL_3:

  return v9;
}

- (id)appProtectionEffectiveContainerWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  if (a6->var9)
  {
    v6 = (void *)_CSStringCopyCFString();
  }
  else
  {
    uint64_t v7 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
    v6 = [v7 bundleIdentifier];
  }

  return v6;
}

- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 error:(id *)a6
{
  uint64_t v7 = (uint64_t)a5;
  uint64_t v8 = *(void *)&a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a5 || (uint64_t v7 = _LSGetPlugin((uint64_t)a3->db, a4)) != 0)
  {
    if (self) {
      return [(LSBundleRecord *)self _initWithNode:0 bundleIdentifier:0 context:a3 tableID:a3->db->schema.pluginTable unitID:v8 bundleBaseData:v7 error:a6];
    }
  }
  else
  {
    if (a6)
    {
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v14[0] = @"Unable to find this application extension record in the Launch Services database.";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]", 243, v12);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return 0;
}

- (id)extensionPointRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  unsigned int v12 = 0;
  uint64_t v11 = 0;
  int v7 = _LSExtensionPointFindWithStringID(a3->db, a6->var4, a6->var0.platform, 0, &v12, &v11);
  id v8 = 0;
  if (!v7)
  {
    v9 = [LSExtensionPointRecord alloc];
    id v8 = [(LSRecord *)v9 _initWithContext:a3 tableID:a3->db->schema.extensionPointTable unitID:v12];
  }

  return v8;
}

- (unsigned)pluginFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_pluginFlagsWithContext_tableID_unitID_unitBytes_);
}

- (char)developerType
{
  v3 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 developerType];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LSApplicationExtensionRecord;
    unsigned __int8 v5 = [(LSBundleRecord *)&v8 developerType];
  }
  char v6 = v5;

  return v6;
}

- (void)_LSRecord_resolve_uniqueIdentifier
{
  id v2 = [(LSApplicationExtensionRecord *)self uniqueIdentifier];
}

- (unsigned)pluginFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  return a6->var1;
}

- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 context:(LSContext *)a6 requireValid:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  LOBYTE(v16) = _LSCurrentProcessMayMapDatabase() == 0;
  return [(LSApplicationExtensionRecord *)self _initWithUUID:a3 node:a4 bundleIdentifier:a5 platform:0 context:a6 requireValid:v9 allowRedacted:v16 error:a8];
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 platform:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  LOBYTE(v12) = _LSCurrentProcessMayMapDatabase() == 0;
  return (LSApplicationExtensionRecord *)[(LSApplicationExtensionRecord *)self _initWithUUID:0 node:0 bundleIdentifier:a3 platform:v7 context:0 requireValid:v8 allowRedacted:v12 error:a6];
}

- (id)_initWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 context:(LSContext *)CurrentContext requireValid:(BOOL)a8 allowRedacted:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a8;
  uint64_t v12 = *(void *)&a6;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (!MayMapDatabase && a9)
  {
    uint64_t v18 = +[LSApplicationExtensionRecord redactedAppexRecordWithUUID:a3 node:a4 bundleIdentifier:a5 platform:v12 error:a10];

    id v19 = (id)v18;
    if (!a3) {
      return v19;
    }
    goto LABEL_20;
  }
  if (!CurrentContext) {
    CurrentContext = (LSContext *)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
  }
  v29 = CurrentContext;
  id v30 = 0;
  char v31 = 0;
  id v32 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v20, 0);

  if (!v21)
  {
    if (a10)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v22 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v29, v22, 0);

      if (v23) {
        id v24 = 0;
      }
      else {
        id v24 = v32;
      }
      *a10 = v24;
    }
    goto LABEL_15;
  }
  int v28 = 0;
  findPluginDataInContext(v21, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v10, v12, (uint64_t)&v28, a10);
  if (!v28)
  {
LABEL_15:

    id v19 = 0;
    goto LABEL_16;
  }
  id v19 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](self, "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", a4, a5, v21, *(unsigned int *)(*(void *)v21 + 1604), a10);
LABEL_16:
  if (v29 && v31) {
    _LSContextDestroy((void **)&v29->db);
  }
  id v25 = v30;
  v29 = 0;
  id v30 = 0;

  char v31 = 0;
  id v26 = v32;
  id v32 = 0;

  if (a3)
  {
LABEL_20:
    if (v19) {
      [v19 _setResolvedPropertyValue:a3 forGetter:sel_uniqueIdentifier];
    }
  }
  return v19;
}

- (void)_LSRecord_resolve_effectiveBundleIdentifier
{
  id v2 = [(LSApplicationExtensionRecord *)self effectiveBundleIdentifier];
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_effectiveBundleIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_appProtectionEffectiveContainer
{
  id v2 = [(LSApplicationExtensionRecord *)self appProtectionEffectiveContainer];
}

- (NSString)appProtectionEffectiveContainer
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_appProtectionEffectiveContainerWithContext_tableID_unitID_unitBytes_);
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSPluginData *)a6
{
  uint64_t infoDictionary = a6->var0.infoDictionary;
  if (infoDictionary)
  {
    uint64_t v7 = +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, infoDictionary, *(void *)&a5);
  }
  else
  {
    uint64_t v7 = 0;
  }
  BOOL v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  BOOL v9 = [v7 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];
  BOOL v10 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v11 = [v9 objectForKey:@"CFBundlePrimaryIcon"];
  if (_NSIsNSDictionary()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = [v10 objectForKey:@"ISGraphicIconConfiguration"];

  if (_NSIsNSDictionary()) {
    [v8 setObject:v13 forKeyedSubscript:@"ISGraphicIconConfiguration"];
  }

  if (v12)
  {
    [v8 addEntriesFromDictionary:v12];
  }
  else
  {
LABEL_12:
    v14 = [v7 objectForKey:@"CFBundleIconFile" ofClass:objc_opt_class()];
    if (v14) {
      [v8 setObject:v14 forKeyedSubscript:@"CFBundleIconFile"];
    }
    objc_super v15 = [v7 objectForKey:@"CFBundleIconName" ofClass:objc_opt_class()];
    if (v15) {
      [v8 setObject:v15 forKeyedSubscript:@"CFBundleIconName"];
    }

    id v12 = 0;
  }
  uint64_t v16 = (void *)[v8 copy];

  return v16;
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2 = [(LSApplicationExtensionRecord *)self iconDictionary];
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  return [(LSApplicationExtensionRecord *)self initWithBundleIdentifier:a3 requireValid:0 platform:0 error:a4];
}

- (void)_LSRecord_resolve__containingBundleRecord
{
  id v2 = [(LSApplicationExtensionRecord *)self _containingBundleRecord];
}

- (LSBundleRecord)containingBundleRecord
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);
  if (!WeakRetained)
  {
    id WeakRetained = [(LSApplicationExtensionRecord *)self _containingBundleRecord];
  }

  return (LSBundleRecord *)WeakRetained;
}

- (LSBundleRecord)_containingBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__containingBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (id)_initWithContext:(LSContext *)a3 pluginID:(unsigned int)a4 pluginData:(const LSPluginData *)a5 extensionPointRecord:(id)a6 error:(id *)a7
{
  id v8 = [(LSApplicationExtensionRecord *)self _initWithContext:a3 pluginID:*(void *)&a4 pluginData:a5 error:a7];
  [v8 _setResolvedPropertyValue:a6 forGetter:sel_extensionPointRecord];

  return v8;
}

- (LSApplicationExtensionRecord)initWithUUID:(id)a3 error:(id *)a4
{
  return [(LSApplicationExtensionRecord *)self initWithUUID:a3 requireValid:0 error:a4];
}

- (void)_LSRecord_resolve_extensionPointRecord
{
  id v2 = [(LSApplicationExtensionRecord *)self extensionPointRecord];
}

- (LSExtensionPointRecord)extensionPointRecord
{
  return (LSExtensionPointRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_extensionPointRecordWithContext_tableID_unitID_unitBytes_);
}

- (LSApplicationExtensionRecord)initWithURL:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = [[FSNode alloc] initWithURL:a3 flags:32 error:0];
  BOOL v9 = [(LSApplicationExtensionRecord *)self _initWithUUID:0 node:v8 bundleIdentifier:0 context:0 requireValid:v6 error:a5];

  return v9;
}

- (LSApplicationExtensionRecord)initWithURL:(id)a3 error:(id *)a4
{
  return [(LSApplicationExtensionRecord *)self initWithURL:a3 requireValid:0 error:a4];
}

+ (id)enumeratorWithExtensionPointRecord:(id)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LSRecord+Enumeration.mm", 266, @"Invalid parameter not satisfying: %@", @"extensionPointRecord != nil" object file lineNumber description];
  }
  BOOL v6 = [[_LSApplicationExtensionRecordEnumerator alloc] initWithExtensionPoint:a3 options:a4];

  return v6;
}

- (LSApplicationExtensionRecord)initWithUUID:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  return (LSApplicationExtensionRecord *)[(LSApplicationExtensionRecord *)self _initWithUUID:a3 node:0 bundleIdentifier:0 context:0 requireValid:a4 error:a5];
}

- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5
{
  if (sel__containingBundleRecord == a4)
  {
    id v5 = a3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LSApplicationExtensionRecord;
    -[LSRecord _replacementObjectForResolvedPropertyValue:forGetter:encoder:](&v7, sel__replacementObjectForResolvedPropertyValue_forGetter_encoder_, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_propertyClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (LSApplicationExtensionRecord)initWithBundleIdentifier:(id)a3 requireValid:(BOOL)a4 error:(id *)a5
{
  return [(LSApplicationExtensionRecord *)self initWithBundleIdentifier:a3 requireValid:a4 platform:0 error:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)appProtectionLocked
{
  id v2 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  char v3 = [v2 appProtectionLocked];

  return v3;
}

- (BOOL)appProtectionHidden
{
  id v2 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  char v3 = [v2 appProtectionHidden];

  return v3;
}

+ (id)applicationExtensionRecordsForUUIDs:(id)a3 outContainingBundleRecords:(id *)a4 error:(id *)a5
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v100 = 0;
  v97 = 0;
  id v98 = 0;
  char v99 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  objc_super v7 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v97, v6, 0);

  if (v7)
  {
    v94 = 0;
    v95 = 0;
    v96 = 0;
    context = (void *)MEMORY[0x18530F680]();
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v8 = a3;
    id v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v90 objects:v109 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v91 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          *(_DWORD *)buf = 0;
          id v89 = v9;
          uint64_t PluginDataInContext = findPluginDataInContext((uint64_t)v7, (uint64_t)v13, 0, 0, 0, 0, (uint64_t)buf, &v89);
          id v15 = v89;

          id v9 = v15;
          int v16 = *(_DWORD *)buf;
          if (PluginDataInContext) {
            BOOL v17 = *(_DWORD *)buf == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            id v18 = v13;
            id v19 = v18;
            v20 = v95;
            if (v95 >= v96)
            {
              uint64_t v22 = (v95 - v94) >> 4;
              unint64_t v23 = v22 + 1;
              if ((unint64_t)(v22 + 1) >> 60) {
                abort();
              }
              uint64_t v24 = v96 - v94;
              if ((v96 - v94) >> 3 > v23) {
                unint64_t v23 = v24 >> 3;
              }
              if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v25 = v23;
              }
              v103 = &v96;
              id v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)&v96, v25);
              int v28 = &v26[16 * v22];
              *(_DWORD *)int v28 = v16;
              *((void *)v28 + 1) = v19;
              id v30 = v94;
              v29 = v95;
              if (v95 == v94)
              {
                id v32 = &v26[16 * v22];
              }
              else
              {
                char v31 = v95;
                id v32 = &v26[16 * v22];
                do
                {
                  int v33 = *((_DWORD *)v31 - 4);
                  v31 -= 16;
                  *((_DWORD *)v32 - 4) = v33;
                  v32 -= 16;
                  uint64_t v34 = *((void *)v31 + 1);
                  *((void *)v31 + 1) = 0;
                  *((void *)v32 + 1) = v34;
                }
                while (v31 != v30);
              }
              uint64_t v21 = v28 + 16;
              v94 = v32;
              v95 = v28 + 16;
              v35 = v96;
              v96 = &v26[16 * v27];
              *(void *)&long long v102 = v29;
              *((void *)&v102 + 1) = v35;
              *(void *)&long long v101 = v30;
              *((void *)&v101 + 1) = v30;
              std::__split_buffer<std::pair<unsigned int,NSUUID * {__strong}>>::~__split_buffer((uint64_t)&v101);
            }
            else
            {
              *(_DWORD *)v95 = v16;
              *((void *)v20 + 1) = v18;
              uint64_t v21 = v20 + 16;
            }
            v95 = v21;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v90 objects:v109 count:16];
      }
      while (v10);
    }

    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v101 = 0u;
    long long v102 = 0u;
    LODWORD(v103) = 1065353216;
    v36 = (int *)v94;
    v79 = (unsigned int *)v95;
    if (v94 != v95)
    {
      v74 = (void *)*MEMORY[0x1E4F28760];
      uint64_t v75 = *MEMORY[0x1E4F28228];
      do
      {
        unint64_t contexta = *v36;
        uint64_t v37 = _LSGetPlugin(*v7, *v36);
        uint64_t v38 = v37;
        if (v37)
        {
          unsigned int v88 = *(_DWORD *)(v37 + 224);
          if (v88)
          {
            uint64_t v77 = v37;
            v39 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>(&v101, &v88);
            if (v39)
            {
              id v40 = (id)v39[3];
              if (!v40)
              {
                v41 = [MEMORY[0x1E4F28B00] currentHandler];
                [v41 handleFailureInMethod:a2 object:a1 file:@"LSApplicationExtensionRecord.mm" lineNumber:315 description:@"why don't we have a container in the map?"];

                id v40 = 0;
              }
            }
            else
            {
              v47 = [LSApplicationRecord alloc];
              id v87 = v9;
              id v48 = [(LSApplicationRecord *)v47 _initWithContext:v7 bundleID:v88 bundleData:0 error:&v87];
              id v49 = v87;

              if (v48)
              {
                *(_DWORD *)buf = v88;
                id v50 = v48;
                *(void *)&v108[4] = v50;
                std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,LSApplicationRecord * {__strong}>>((uint64_t)&v101, (unsigned int *)buf, (uint64_t)buf);

                id v9 = v49;
                id v40 = v50;
              }
              else
              {
                id v40 = 0;
                id v9 = v49;
              }
            }
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            v78 = v40;
            v51 = [v40 applicationExtensionRecords];
            uint64_t v52 = [v51 countByEnumeratingWithState:&v83 objects:v106 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v84;
LABEL_43:
              uint64_t v54 = 0;
              while (1)
              {
                if (*(void *)v84 != v53) {
                  objc_enumerationMutation(v51);
                }
                v55 = *(void **)(*((void *)&v83 + 1) + 8 * v54);
                v56 = [v55 uniqueIdentifier];
                char v57 = [v56 isEqual:*((void *)v36 + 1)];

                if (v57) {
                  break;
                }
                if (v52 == ++v54)
                {
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v83 objects:v106 count:16];
                  if (v52) {
                    goto LABEL_43;
                  }
                  goto LABEL_49;
                }
              }
              id v46 = v55;

              uint64_t v38 = v77;
              if (v46) {
                goto LABEL_52;
              }
            }
            else
            {
LABEL_49:

              uint64_t v38 = v77;
            }
          }
          v58 = [LSApplicationExtensionRecord alloc];
          id v82 = v9;
          id v46 = [(LSApplicationExtensionRecord *)v58 _initWithContext:v7 pluginID:contexta pluginData:v38 error:&v82];
          id v59 = v82;

          id v9 = v59;
          if (v46) {
LABEL_52:
          }
            [v76 addObject:v46];
        }
        else
        {
          v42 = _LSDefaultLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v108 = contexta;
            _os_log_error_impl(&dword_182959000, v42, OS_LOG_TYPE_ERROR, "unexpected error finding plugin with unit %lu", buf, 0xCu);
          }

          uint64_t v104 = v75;
          v43 = objc_msgSend(NSString, "stringWithFormat:", @"Could not find plugin for unit %lu", contexta);
          v105 = v43;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
          uint64_t v45 = _LSMakeNSErrorImpl(v74, -10810, (uint64_t)"+[LSApplicationExtensionRecord applicationExtensionRecordsForUUIDs:outContainingBundleRecords:error:]", 340, v44);

          id v46 = 0;
          id v9 = (id)v45;
        }

        v36 += 4;
      }
      while (v36 != (int *)v79);
    }
    if ([v76 count])
    {
      id v60 = v76;
      if (a4)
      {
        id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        for (j = (void *)v102; j; j = (void *)*j)
          [v61 addObject:j[3]];
        id v63 = *a4;
        *a4 = v61;
      }
    }
    else
    {
      id v60 = 0;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)&v101);

    *(void *)&long long v101 = &v94;
    std::vector<std::pair<unsigned int,NSUUID * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v101);
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v64 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v65 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v97, v64, 0);

    if (v65) {
      id v9 = 0;
    }
    else {
      id v9 = v100;
    }
    id v60 = 0;
  }
  if (a5 && !v60) {
    *a5 = v9;
  }
  id v66 = v60;
  if (v97 && v99) {
    _LSContextDestroy(v97);
  }
  id v67 = v98;
  v97 = 0;
  id v98 = 0;

  char v99 = 0;
  id v68 = v100;
  id v100 = 0;

  return v66;
}

- (unint64_t)compatibilityState
{
  char v3 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 compatibilityState];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LSApplicationExtensionRecord;
    id v5 = [(LSBundleRecord *)&v8 compatibilityState];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (id)managedPersonas
{
  id v2 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  char v3 = [v2 managedPersonas];

  return v3;
}

- (id)associatedPersonas
{
  id v2 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  char v3 = [v2 associatedPersonas];

  return v3;
}

- (id)_personasWithAttributes
{
  id v2 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  char v3 = [v2 _personasWithAttributes];

  return v3;
}

- (BOOL)_usesSystemPersona
{
  id v2 = [(LSApplicationExtensionRecord *)self containingBundleRecord];
  char v3 = [v2 _usesSystemPersona];

  return v3;
}

- (BOOL)_containerized
{
  return 1;
}

- (unint64_t)_containerClass
{
  return 4;
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return +[LSPlugInKitProxy plugInKitProxyForPlugin:*(void *)&a5 withContext:a3 applicationExtensionRecord:self resolveAndDetach:0];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  if (a4->var3 != a3->db->schema.pluginTable)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LSApplicationExtensionRecord.mm", 479, @"Invalid parameter not satisfying: %@", @"pi->tableID == ctx->db->schema.pluginTable" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LSApplicationExtensionRecord;
  return [(LSBundleRecord *)&v12 _initWithContext:a3 persistentIdentifierData:a4 length:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LSApplicationExtensionRecord;
  v4 = [(LSBundleRecord *)&v7 copyWithZone:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakContainingBundleRecord);
    objc_storeWeak(v4 + 10, WeakRetained);
  }
  return v4;
}

- (id)_intentsArrayForKey:(id)a3
{
  v4 = [(LSBundleRecord *)self infoDictionary];
  id v5 = [v4 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  if (!v5)
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_13;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v5 objectForKey:@"NSExtensionAttributes"];
  objc_super v8 = (void *)v7;
  if (v6 && v7)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = v8;
      objc_super v8 = 0;
LABEL_10:

      goto LABEL_11;
    }
  }
  else if (!v7)
  {
LABEL_11:
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  id v9 = [v8 objectForKeyedSubscript:a3];
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v10 = objc_opt_class();
  if ((_LSIsArrayWithValuesOfClass(v9, v10) & 1) == 0) {
    goto LABEL_10;
  }
LABEL_12:

LABEL_13:

  return v9;
}

- (id)supportedIntents
{
  return [(LSApplicationExtensionRecord *)self _intentsArrayForKey:@"IntentsSupported"];
}

- (id)intentsRestrictedWhileLocked
{
  return [(LSApplicationExtensionRecord *)self _intentsArrayForKey:@"IntentsRestrictedWhileLocked"];
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  return [(LSApplicationExtensionRecord *)self _intentsArrayForKey:@"IntentsRestrictedWhileProtectedDataUnavailable"];
}

- (id)supportedIntentMediaCategories
{
  return [(LSApplicationExtensionRecord *)self _intentsArrayForKey:@"SupportedMediaCategories"];
}

+ (id)redactedAppexRecordWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__0;
  int v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v17[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v17[1] = (void (*)(void, void))3221225472;
  v17[2] = (void (*)(void, void))__108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke;
  v17[3] = (void (*)(void, void))&unk_1E522BA78;
  v17[4] = (void (*)(void, void))&v24;
  objc_super v12 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v17);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke_2;
  v16[3] = &unk_1E522BAA0;
  v16[4] = &v18;
  v16[5] = &v24;
  [v12 getRedactedAppexRecordForSystemAppexWithUUID:a3 node:a4 bundleIdentifier:a5 platform:v8 completionHandler:v16];

  uint64_t v13 = (void *)v19[5];
  if (a7 && !v13)
  {
    *a7 = (id) v25[5];
    uint64_t v13 = (void *)v19[5];
  }
  id v14 = v13;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v14;
}

void __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke(uint64_t a1, void *a2)
{
}

void __108__LSApplicationExtensionRecord_Redaction__redactedAppexRecordWithUUID_node_bundleIdentifier_platform_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v5, a3);
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v7 = [LSApplicationExtensionRecord alloc];
  uint64_t v8 = [(LSBundleRecord *)self _node];
  id v9 = [(LSBundleRecord *)self bundleIdentifier];
  LOBYTE(v12) = 0;
  id v10 = [(LSApplicationExtensionRecord *)v7 _initWithUUID:0 node:v8 bundleIdentifier:v9 platform:[(LSBundleRecord *)self platform] context:a3 requireValid:1 allowRedacted:v12 error:a4];

  return v10;
}

- (BOOL)optsOutOfAppProtectionShield
{
  return ([(LSApplicationExtensionRecord *)self pluginFlags] >> 4) & 1;
}

+ (id)appexRecordsForUnitIDsWithContext:(LSContext *)a3 unitIDs:(const void *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*((void *)a4 + 1) == *(void *)a4)
  {
    id v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 2];
    uint64_t v8 = *(unsigned int **)a4;
    id v9 = (unsigned int *)*((void *)a4 + 1);
    if (*(unsigned int **)a4 != v9)
    {
      *(void *)&long long v7 = 134218242;
      long long v17 = v7;
      do
      {
        uint64_t v10 = *v8;
        uint64_t v11 = [LSApplicationExtensionRecord alloc];
        id v18 = 0;
        id v12 = [(LSApplicationExtensionRecord *)v11 _initWithContext:a3 pluginID:v10 pluginData:0 error:&v18];
        id v13 = v18;
        if (v12)
        {
          [v6 addObject:v12];
        }
        else
        {
          id v14 = _LSDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v20 = v10;
            __int16 v21 = 2112;
            id v22 = v13;
            _os_log_error_impl(&dword_182959000, v14, OS_LOG_TYPE_ERROR, "Unable to create appex record for unit ID 0x%llx: %@", buf, 0x16u);
          }
        }
        ++v8;
      }
      while (v8 != v9);
    }
    id v15 = objc_msgSend(v6, "copy", v17);
  }

  return v15;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  char v3 = [[_LSApplicationExtensionRecordEnumerator alloc] initWithExtensionPointIdentifier:0 options:a3];

  return v3;
}

@end