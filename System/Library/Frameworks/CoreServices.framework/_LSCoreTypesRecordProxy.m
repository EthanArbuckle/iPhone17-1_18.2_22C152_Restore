@interface _LSCoreTypesRecordProxy
+ (BOOL)supportsSecureCoding;
+ (id)classFallbacksForKeyedArchiver;
+ (id)description;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeProfileValidated;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProfileValidated;
- (BOOL)isUPPValidated;
- (BOOL)supportsNowPlaying;
- (BOOL)wasBuiltWithThreadSanitizer;
- (LSBundleRecord)_realRecord;
- (char)developerType;
- (id)SDKVersion;
- (id)UIBackgroundModes;
- (id)URL;
- (id)WKBackgroundModes;
- (id)_loadRealRecord;
- (id)_personasWithAttributes;
- (id)accentColorName;
- (id)applicationIdentifier;
- (id)associatedPersonas;
- (id)bundleIdentifier;
- (id)dataContainerURL;
- (id)debugDescription;
- (id)description;
- (id)executableURL;
- (id)intentDefinitionURLs;
- (id)intentsRestrictedWhileLocked;
- (id)intentsRestrictedWhileProtectedDataUnavailable;
- (id)localizedName;
- (id)localizedNameWithPreferredLocalizations:(id)a3;
- (id)localizedShortName;
- (id)localizedShortNameWithPreferredLocalizations:(id)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4;
- (id)machOUUIDs;
- (id)managedPersonas;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)serviceRecords;
- (id)signerIdentity;
- (id)signerOrganization;
- (id)supportedIntentMediaCategories;
- (id)supportedIntents;
- (id)teamIdentifier;
- (unint64_t)hash;
- (unsigned)platform;
- (void)detach;
- (void)forwardInvocation:(id)a3;
@end

@implementation _LSCoreTypesRecordProxy

- (void)detach
{
  if (_LSCurrentProcessMayMapDatabase())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
    p_realRecord = &self->_realRecord;
    id obj = (id)[(LSBundleRecord *)*p_realRecord copy];
    if (obj) {
      objc_storeStrong((id *)p_realRecord, obj);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
    [obj detach];
  }
}

- (void).cxx_destruct
{
}

- (id)URL
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle" isDirectory:1];

  return v2;
}

- (BOOL)isKindOfClass:(Class)a3
{
  Class = object_getClass(self);
  if (Class)
  {
    while (Class != a3)
    {
      Class = class_getSuperclass(Class);
      if (!Class) {
        goto LABEL_4;
      }
    }
    return 1;
  }
  else
  {
LABEL_4:
    return +[LSBundleRecord isSubclassOfClass:a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v4 = (objc_class *)objc_opt_class();
  if (class_conformsToProtocol(v4, (Protocol *)a3)) {
    return 1;
  }
  v6 = (objc_class *)objc_opt_class();

  return class_conformsToProtocol(v6, (Protocol *)a3);
}

- (id)_loadRealRecord
{
  uint64_t v28 = 0;
  v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  v32 = __Block_byref_object_dispose__10;
  id v33 = 0;
  id WeakRetained = objc_loadWeakRetained(&LaunchServices::Record::weakCoreTypesRecord);
  if (WeakRetained)
  {
    objc_storeStrong(v29 + 5, WeakRetained);
  }
  else
  {
    MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
    if (MayMapDatabase)
    {
      CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
      id v25 = 0;
      char v26 = 0;
      id v27 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v4, 0);

      if (v5)
      {
        uint64_t v20 = 0;
        v21 = &v20;
        uint64_t v22 = 0x2020000000;
        int v23 = 0;
        uint64_t v16 = 0;
        v17 = &v16;
        uint64_t v18 = 0x2020000000;
        uint64_t v19 = 0;
        v15[5] = MEMORY[0x1E4F143A8];
        v15[6] = 3221225472;
        v15[7] = __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke;
        v15[8] = &unk_1E522DB88;
        v15[9] = &v16;
        v15[10] = &v20;
        _CSStoreEnumerateUnits();
        if (*((_DWORD *)v21 + 6))
        {
          v6 = [[FSNode alloc] initWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle" flags:8 error:0];
          v7 = [LSBundleRecord alloc];
          uint64_t v8 = [(LSBundleRecord *)v7 _initWithNode:v6 bundleIdentifier:@"com.apple.mobilecoretypes" context:v5 tableID:*(unsigned int *)(*(void *)v5 + 20) unitID:*((unsigned int *)v21 + 6) bundleBaseData:v17[3] error:0];
          id v9 = v29[5];
          v29[5] = (id)v8;
        }
        _Block_object_dispose(&v16, 8);
        _Block_object_dispose(&v20, 8);
      }
      if (CurrentContext && v26) {
        _LSContextDestroy(CurrentContext);
      }
      id v10 = v25;
      CurrentContext = 0;
      id v25 = 0;

      char v26 = 0;
      id v11 = v27;
      id v27 = 0;
    }
    else
    {
      v12 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_468);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke_3;
      v15[3] = &unk_1E522DBB0;
      v15[4] = &v28;
      [v12 getBundleRecordForCoreTypesWithCompletionHandler:v15];
    }
    LaunchServices::Record::storeWeakSharedRecord(v29[5], &LaunchServices::Record::weakCoreTypesRecord);
  }

  id v13 = v29[5];
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (LSBundleRecord)_realRecord
{
  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  realRecord = self->_realRecord;
  if (!realRecord)
  {
    v4 = [(_LSCoreTypesRecordProxy *)self _loadRealRecord];
    uint64_t v5 = self->_realRecord;
    self->_realRecord = v4;

    realRecord = self->_realRecord;
  }
  v6 = realRecord;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);

  return v6;
}

- (id)bundleIdentifier
{
  return @"com.apple.mobilecoretypes";
}

- (id)applicationIdentifier
{
  return 0;
}

- (id)teamIdentifier
{
  return @"0000000000";
}

- (id)executableURL
{
  return 0;
}

- (char)developerType
{
  return 1;
}

- (id)machOUUIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)SDKVersion
{
  return 0;
}

- (unsigned)platform
{
  return 0;
}

- (BOOL)wasBuiltWithThreadSanitizer
{
  return 0;
}

- (id)serviceRecords
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);

  return v2;
}

- (id)dataContainerURL
{
  return 0;
}

- (id)localizedName
{
  return @"CoreTypes";
}

- (id)localizedShortName
{
  return @"CoreTypes";
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  return @"CoreTypes";
}

- (id)localizedShortNameWithPreferredLocalizations:(id)a3
{
  return @"CoreTypes";
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3
{
  return 0;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4
{
  return 0;
}

- (id)signerOrganization
{
  return 0;
}

- (id)signerIdentity
{
  return 0;
}

- (BOOL)isProfileValidated
{
  return 0;
}

- (BOOL)isUPPValidated
{
  return 0;
}

- (BOOL)isFreeProfileValidated
{
  return 0;
}

- (id)managedPersonas
{
  return 0;
}

- (id)associatedPersonas
{
  return 0;
}

- (id)_personasWithAttributes
{
  return 0;
}

- (id)UIBackgroundModes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)accentColorName
{
  return 0;
}

- (id)WKBackgroundModes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsNowPlaying
{
  return 0;
}

- (id)intentDefinitionURLs
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)supportedIntents
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)intentsRestrictedWhileLocked
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)intentsRestrictedWhileProtectedDataUnavailable
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)supportedIntentMediaCategories
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)forwardInvocation:(id)a3
{
  -[_LSCoreTypesRecordProxy forwardingTargetForSelector:](self, "forwardingTargetForSelector:", [a3 selector]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "setTarget:");
  [a3 invoke];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)+[LSBundleRecord instanceMethodSignatureForSelector:a3];
}

- (unint64_t)hash
{
  id v2 = [(_LSCoreTypesRecordProxy *)self URL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self || ([a3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      LOBYTE(v5) = [a3 isEqual:self];
    }
  }
  return v5;
}

+ (id)description
{
  return @"LS(Proxied)BundleRecord";
}

- (id)description
{
  id v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p>", objc_opt_class(), self];

  return v2;
}

- (id)debugDescription
{
  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  if (self->_realRecord) {
    int v5 = @"yes";
  }
  else {
    int v5 = @"no";
  }
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> { resolved: %@ }", v4, self, v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::coreTypesProxyLock);

  return v6;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (void)a3;
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end