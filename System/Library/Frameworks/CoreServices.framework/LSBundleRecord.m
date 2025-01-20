@interface LSBundleRecord
+ (BOOL)supportsSecureCoding;
+ (LSBundleRecord)bundleRecordForCurrentProcess;
+ (LSBundleRecord)bundleRecordWithApplicationIdentifier:(id)a3 error:(id *)a4;
+ (LSBundleRecord)bundleRecordWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5;
+ (LSBundleRecord)coreTypesBundleRecord;
+ (id)_bundleRecordForAuditToken:(id *)a3 checkNSBundleMainBundle:(unsigned __int8)a4 error:(id *)a5;
+ (id)_propertyClasses;
+ (id)bundleRecordForAuditToken:(id *)a3 error:(id *)a4;
+ (id)redactedProperties;
+ (void)bundleRecordForCurrentProcess;
- (BOOL)_containerized;
- (BOOL)_usesSystemPersona;
- (BOOL)appProtectionHidden;
- (BOOL)appProtectionLocked;
- (BOOL)eligibleForRedaction;
- (BOOL)getDataContainerURL:(id *)a3 error:(id *)a4;
- (BOOL)isAppleInternal;
- (BOOL)isAppleInternalWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeProfileValidated;
- (BOOL)isLinkEnabled;
- (BOOL)isLinkEnabledWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (BOOL)isProfileValidated;
- (BOOL)isRedacted;
- (BOOL)isUPPValidated;
- (BOOL)personaIsApplicable:(id)a3;
- (BOOL)supportsNowPlaying;
- (BOOL)unredactWithError:(id *)a3;
- (BOOL)wasBuiltWithThreadSanitizer;
- (FSNode)_node;
- (LSBundleBaseFlags)_baseFlags;
- (LSBundleBaseFlags)_baseFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (LSBundleRecord)initWithCoder:(id)a3;
- (LSPropertyList)entitlements;
- (LSPropertyList)infoDictionary;
- (LSVersionNumber)_bundleVersion;
- (LSVersionNumber)_bundleVersionWithContext:(SEL)a3 tableID:(LSContext *)a4 unitID:(unsigned int)a5 unitBytes:(unsigned int)a6;
- (NSArray)UIBackgroundModes;
- (NSArray)WKBackgroundModes;
- (NSArray)_personasWithAttributes;
- (NSArray)associatedPersonas;
- (NSArray)intentsRestrictedWhileLocked;
- (NSArray)intentsRestrictedWhileProtectedDataUnavailable;
- (NSArray)machOUUIDs;
- (NSArray)managedPersonas;
- (NSArray)privacyTrackingDomains;
- (NSArray)supportedIntentMediaCategories;
- (NSArray)supportedIntents;
- (NSDate)registrationDate;
- (NSDictionary)groupContainerURLs;
- (NSDictionary)intentDefinitionURLs;
- (NSSet)claimRecords;
- (NSSet)exportedTypeRecords;
- (NSSet)importedTypeRecords;
- (NSSet)serviceRecords;
- (NSString)SDKVersion;
- (NSString)_fallbackLocalizedName;
- (NSString)accentColorName;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)teamIdentifier;
- (NSURL)URL;
- (NSURL)_dataContainerURLFromDatabase;
- (NSURL)dataContainerURL;
- (NSURL)executableURL;
- (_LSLazyPropertyList)_rawGroupContainerURLs;
- (_LSLocalizedStringRecord)_localizedIdentityUsageDescription;
- (_LSLocalizedStringRecord)_localizedMicrophoneUsageDescription;
- (_LSLocalizedStringRecord)_localizedName;
- (_LSLocalizedStringRecord)_localizedShortName;
- (char)developerType;
- (char)developerTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (const)_auditToken;
- (id)SDKVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_cachedDataContainerURL;
- (id)_dataContainerURLFromDatabaseWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_getGroupContainersCreatingIfNecessary:(BOOL)a3 checkNonContainerizedBundles:(BOOL)a4;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9;
- (id)_localizedIdentityUsageDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_localizedMicrophoneUsageDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_localizedShort:(BOOL)a3 nameWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 bundleData:(const LSBundleBaseData *)a7;
- (id)_localizedShortNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)_rawGroupContainerURLsCheckingRedaction;
- (id)_rawGroupContainerURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)claimRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)entitlementsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)executableURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)exported:(BOOL)a3 typesWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 unitBytes:(const LSBundleData *)a7;
- (id)exportedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)getGroupContainersCreatingIfNecessary:(BOOL)a3;
- (id)groupContainerIdentifiers;
- (id)importedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6;
- (id)infoDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)intentDefinitionURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)localizedNameWithPreferredLocalizations:(id)a3;
- (id)localizedShortNameWithPreferredLocalizations:(id)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3;
- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4;
- (id)machOUUIDsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4;
- (id)registrationDateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)signerIdentityWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)signerOrganizationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (id)teamIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (unint64_t)_containerClass;
- (unint64_t)compatibilityState;
- (unint64_t)hash;
- (unsigned)_profileValidationState;
- (unsigned)_profileValidationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (unsigned)codeSignatureVersion;
- (unsigned)codeSignatureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (unsigned)platform;
- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6;
- (void)_LSRecord_resolve_SDKVersion;
- (void)_LSRecord_resolve__bundleVersion;
- (void)_LSRecord_resolve__dataContainerURLFromDatabase;
- (void)_LSRecord_resolve__localizedIdentityUsageDescription;
- (void)_LSRecord_resolve__localizedMicrophoneUsageDescription;
- (void)_LSRecord_resolve__localizedName;
- (void)_LSRecord_resolve__localizedShortName;
- (void)_LSRecord_resolve__rawGroupContainerURLs;
- (void)_LSRecord_resolve_claimRecords;
- (void)_LSRecord_resolve_entitlements;
- (void)_LSRecord_resolve_executableURL;
- (void)_LSRecord_resolve_exportedTypeRecords;
- (void)_LSRecord_resolve_importedTypeRecords;
- (void)_LSRecord_resolve_infoDictionary;
- (void)_LSRecord_resolve_intentDefinitionURLs;
- (void)_LSRecord_resolve_machOUUIDs;
- (void)_LSRecord_resolve_registrationDate;
- (void)_LSRecord_resolve_signerIdentity;
- (void)_LSRecord_resolve_signerOrganization;
- (void)_LSRecord_resolve_teamIdentifier;
- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (void)_fallbackLocalizedName;
- (void)_rawGroupContainerURLsCheckingRedaction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)redact;
@end

@implementation LSBundleRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v7 = -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_infoDictionary, *(void *)&a4, *(void *)&a5, a6);
  v8 = v7;
  if (v7) {
    [v7 detach];
  }

  v9 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel_entitlements];
  v10 = v9;
  if (v9) {
    [v9 detach];
  }

  v11 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedName];
  v12 = v11;
  if (v11) {
    [v11 detach];
  }

  v13 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedShortName];
  v14 = v13;
  if (v13) {
    [v13 detach];
  }

  v15 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedMicrophoneUsageDescription];
  v16 = v15;
  if (v15) {
    [v15 detach];
  }

  v17 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__localizedIdentityUsageDescription];
  v18 = v17;
  if (v17) {
    [v17 detach];
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v19 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel_claimRecords];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v42;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * v22++) detach];
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v20);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v23 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel_exportedTypeRecords];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * v26++) detach];
      }
      while (v24 != v26);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v24);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v27 = -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel_importedTypeRecords, 0);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v34;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v30++) detach];
      }
      while (v28 != v30);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v28);
  }

  v31 = [(LSRecord *)self _resolvedPropertyValueForGetter:sel__rawGroupContainerURLs];
  v32 = v31;
  if (v31) {
    [v31 detach];
  }
}

- (id)_localizedShort:(BOOL)a3 nameWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 bundleData:(const LSBundleBaseData *)a7
{
  if (a3 || (p_localizedShortDisplayName = &a7->localizedDisplayName, !a7->localizedDisplayName))
  {
    v10 = [_LSLocalizedStringRecord alloc];
    p_localizedShortDisplayName = &a7->localizedShortDisplayName;
  }
  else
  {
    v10 = [_LSLocalizedStringRecord alloc];
  }
  id v11 = [(_LSLocalizedStringRecord *)v10 _initWithContext:a4 unitID:*p_localizedShortDisplayName];

  return v11;
}

- (void)dealloc
{
  auditToken = self->_auditToken;
  if (auditToken) {
    MEMORY[0x18530EAF0](auditToken, 0x1000C40E0EAB150);
  }
  v4.receiver = self;
  v4.super_class = (Class)LSBundleRecord;
  [(LSRecord *)&v4 dealloc];
}

- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return [(LSBundleRecord *)self _localizedShort:0 nameWithContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 bundleData:a6];
}

- (id)entitlementsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v9 = (void *)MEMORY[0x18530F680](self, a2, a3, *(void *)&a4, *(void *)&a5);
  if (!self->_auditToken
    || (__LAUNCH_SERVICES_IS_GETTING_ENTITLEMENTS_FROM_THE_KERNEL__((uint64_t)self),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = +[_LSLazyPropertyList lazyPropertyListWithContext:a3 unit:a6->entitlements];
  }

  return v10;
}

- (id)exported:(BOOL)a3 typesWithContext:(LSContext *)a4 tableID:(unsigned int)a5 unitID:(unsigned int)a6 unitBytes:(const LSBundleData *)a7
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = v10;
  if (a4->db->schema.bundleTable == a5)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __69__LSBundleRecord_exported_typesWithContext_tableID_unitID_unitBytes___block_invoke;
    v17 = &unk_1E522DAA8;
    v18 = self;
    id v19 = v10;
    _CSArrayEnumerateAllValues();
  }
  v12 = objc_msgSend(v11, "copy", v14, v15, v16, v17, v18);

  return v12;
}

- (id)infoDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->infoDictionary, *(void *)&a5);
}

- (id)_dataContainerURLFromDatabaseWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v6 = _LSAliasCopyResolvedNode(a3->db, a6->dataContainerAlias, 0, 0, 0);
  v7 = v6;
  if (v6)
  {
    v8 = [v6 URL];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)executableURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v6 = [(LSBundleRecord *)self URL];
  if (v6)
  {
    v7 = _CSStringCopyCFString();
    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v7 isDirectory:0 relativeToURL:v6];
      goto LABEL_10;
    }
    v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[LSBundleRecord executableURLWithContext:tableID:unitID:unitBytes:]();
    }
  }
  else
  {
    v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LSBundleRecord executableURLWithContext:tableID:unitID:unitBytes:]();
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(LSBundleRecord *)self URL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = a3;
  v6 = [(LSBundleRecord *)self URL];
  v7 = [v5 URL];
  char v8 = [v6 isEqual:v7];

  return v8;
}

- (NSURL)URL
{
  return (NSURL *)[(FSNode *)self->_node URL];
}

- (id)teamIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)_localizedShortNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return [(LSBundleRecord *)self _localizedShort:1 nameWithContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 bundleData:a6];
}

- (id)claimRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v10 = v9;
  if (a3->db->schema.bundleTable == a4)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __67__LSBundleRecord_claimRecordsWithContext_tableID_unitID_unitBytes___block_invoke;
    v16 = &unk_1E522DA80;
    v17 = self;
    id v18 = v9;
    _CSArrayEnumerateAllValues();
  }
  id v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16, v17);

  return v11;
}

- (id)signerOrganizationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)_rawGroupContainerURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, a6->groupContainers, *(void *)&a5);
}

- (id)SDKVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)&a6->execSDKVersion._opaque[16];
  v9[0] = *(_OWORD *)a6->execSDKVersion._opaque;
  v9[1] = v6;
  v7 = _LSVersionNumberGetStringRepresentation(v9);

  return v7;
}

- (id)machOUUIDsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v8 = _LSDatabaseGetStringArray(a3->db);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
        if (v13)
        {
          [v7 addObject:v13];
        }
        else
        {
          uint64_t v14 = _LSDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v22 = v12;
            _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "Launch Services: Failed to create a UUID from invalid string %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v15 = (void *)[v7 copy];

  return v15;
}

- (id)signerIdentityWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  long long v6 = (void *)_CSStringCopyCFString();

  return v6;
}

- (id)importedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return [(LSBundleRecord *)self exported:0 typesWithContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 unitBytes:a6];
}

- (id)exportedTypeRecordsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return [(LSBundleRecord *)self exported:1 typesWithContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 unitBytes:a6];
}

- (id)_localizedMicrophoneUsageDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v6 = [[_LSLocalizedStringRecord alloc] _initWithContext:a3 unitID:a6->localizedMicrophoneUsageDescription];

  return v6;
}

- (id)_localizedIdentityUsageDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v6 = [[_LSLocalizedStringRecord alloc] _initWithContext:a3 unitID:a6->localizedIdentityUsageDescription];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__personasWithAttributes, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_node, 0);

  objc_storeStrong(&self->_cachedDataContainerURL, 0);
}

- (id)_initWithNode:(id)a3 bundleIdentifier:(id)a4 context:(LSContext *)a5 tableID:(unsigned int)a6 unitID:(unsigned int)a7 bundleBaseData:(const LSBundleBaseData *)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  id v32 = a3;
  if (!v28[5])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000;
    long long v35 = __Block_byref_object_copy__10;
    long long v36 = __Block_byref_object_dispose__10;
    id v37 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__LSBundleRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke;
    v26[3] = &unk_1E522DAD0;
    v26[6] = a5;
    v26[7] = a8;
    v26[4] = &v27;
    v26[5] = &buf;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v26);
    if (a9 && !v28[5]) {
      *a9 = *(id *)(*((void *)&buf + 1) + 40);
    }
    _Block_object_dispose(&buf, 8);

    if (!v28[5])
    {
      v23 = _LSDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:](v23);
      }

      long long v17 = 0;
      p_super = &self->super.super;
      goto LABEL_19;
    }
  }
  if (!v15) {
    id v15 = (id)_CSStringCopyCFString();
  }
  v25.receiver = self;
  v25.super_class = (Class)LSBundleRecord;
  v16 = [(LSRecord *)&v25 _initWithContext:a5 tableID:v11 unitID:v10];
  long long v17 = v16;
  if (v16)
  {
    objc_storeStrong(v16 + 7, (id)v28[5]);
    uint64_t v18 = [v15 copy];
    id v19 = v17[8];
    v17[8] = (id)v18;

    long long v20 = (void *)v28[5];
    if (_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::onceToken != -1) {
      dispatch_once(&_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::onceToken, &__block_literal_global_520);
    }
    if (_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::myBundleIDIfEnabledAndFirstParty
      && ([v15 isEqualToString:@"com.apple.mobilecoretypes"] & 1) == 0
      && ([v15 isEqualToString:_LSBundleRecordMaybeLogInit(FSNode *,NSString *)::myBundleIDIfEnabledAndFirstParty] & 1) == 0)
    {
      p_super = _LSPrivacyLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = [v20 URL];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_182959000, p_super, OS_LOG_TYPE_INFO, "constructing bundle record for %@", (uint8_t *)&buf, 0xCu);
      }
LABEL_19:
    }
  }
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __93__LSBundleRecord__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = **(void ***)(a1 + 48);
  int v4 = **(_DWORD **)(a1 + 56);
  uint64_t v5 = *(void *)(v2 + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = _LSAliasCopyResolvedNode(v3, v4, 0, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = _LSGetBundleClassForNode(0, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __67__LSBundleRecord_claimRecordsWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_LSClaimGet())
  {
    uint64_t v5 = [(LSRecord *)[LSClaimRecord alloc] _initWithContext:*(void *)(a1 + 48) tableID:*(unsigned int *)(a1 + 56) unitID:a3];
    if (v5)
    {
      objc_storeWeak(v5 + 4, *(id *)(a1 + 32));
      [*(id *)(a1 + 40) addObject:v5];
    }
  }
}

- (id)registrationDateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)a6->registrationTime];

  return v6;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)platformWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->platform;
}

- (unsigned)platform
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_platformWithContext_tableID_unitID_unitBytes_);
}

- (LSBundleBaseFlags)_baseFlags
{
  return (LSBundleBaseFlags)__LSRECORD_GETTER__<LSBundleBaseFlags>(self, (LSRecord *)a2, sel__baseFlagsWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_profileValidationState
{
  return __LSRECORD_GETTER__<unsigned char>(self, (LSRecord *)a2, sel__profileValidationStateWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)_profileValidationStateWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->profileValidationState;
}

- (BOOL)isLinkEnabled
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isLinkEnabledWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)codeSignatureVersion
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_codeSignatureVersionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_signerOrganization
{
  id v2 = [(LSBundleRecord *)self signerOrganization];
}

- (NSString)signerOrganization
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_signerOrganizationWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_signerIdentity
{
  id v2 = [(LSBundleRecord *)self signerIdentity];
}

- (NSString)signerIdentity
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_signerIdentityWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_intentDefinitionURLs
{
  id v2 = [(LSBundleRecord *)self intentDefinitionURLs];
}

- (NSDictionary)intentDefinitionURLs
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_intentDefinitionURLsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_infoDictionary
{
  id v2 = [(LSBundleRecord *)self infoDictionary];
}

- (void)_LSRecord_resolve_entitlements
{
  id v2 = [(LSBundleRecord *)self entitlements];
}

- (LSPropertyList)entitlements
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_entitlementsWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isAppleInternal
{
  return __LSRECORD_GETTER__<BOOL>(self, (LSRecord *)a2, sel_isAppleInternalWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_teamIdentifier
{
  id v2 = [(LSBundleRecord *)self teamIdentifier];
}

- (NSString)teamIdentifier
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_teamIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_registrationDate
{
  id v2 = [(LSBundleRecord *)self registrationDate];
}

- (NSDate)registrationDate
{
  return (NSDate *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_registrationDateWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_machOUUIDs
{
  id v2 = [(LSBundleRecord *)self machOUUIDs];
}

- (NSArray)machOUUIDs
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_machOUUIDsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_importedTypeRecords
{
  id v2 = [(LSBundleRecord *)self importedTypeRecords];
}

- (NSSet)importedTypeRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_importedTypeRecordsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_exportedTypeRecords
{
  id v2 = [(LSBundleRecord *)self exportedTypeRecords];
}

- (NSSet)exportedTypeRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_exportedTypeRecordsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_executableURL
{
  id v2 = [(LSBundleRecord *)self executableURL];
}

- (NSURL)executableURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_executableURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_claimRecords
{
  id v2 = [(LSBundleRecord *)self claimRecords];
}

- (NSSet)claimRecords
{
  return (NSSet *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_claimRecordsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__rawGroupContainerURLs
{
  id v2 = [(LSBundleRecord *)self _rawGroupContainerURLs];
}

- (_LSLazyPropertyList)_rawGroupContainerURLs
{
  return (_LSLazyPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__rawGroupContainerURLsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedShortName
{
  id v2 = [(LSBundleRecord *)self _localizedShortName];
}

- (_LSLocalizedStringRecord)_localizedShortName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedShortNameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedName
{
  id v2 = [(LSBundleRecord *)self _localizedName];
}

- (NSString)localizedName
{
  unint64_t v3 = [(LSBundleRecord *)self _localizedName];
  int v4 = [v3 stringValue];
  uint64_t v5 = postprocessLocalizedNameishStringFromStringRecord(self, v4);

  return (NSString *)v5;
}

- (_LSLocalizedStringRecord)_localizedName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedNameWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedMicrophoneUsageDescription
{
  id v2 = [(LSBundleRecord *)self _localizedMicrophoneUsageDescription];
}

- (_LSLocalizedStringRecord)_localizedMicrophoneUsageDescription
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedMicrophoneUsageDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedIdentityUsageDescription
{
  id v2 = [(LSBundleRecord *)self _localizedIdentityUsageDescription];
}

- (void)_LSRecord_resolve__dataContainerURLFromDatabase
{
  id v2 = [(LSBundleRecord *)self _dataContainerURLFromDatabase];
}

- (NSURL)_dataContainerURLFromDatabase
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__dataContainerURLFromDatabaseWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__bundleVersion
{
}

- (LSVersionNumber)_bundleVersion
{
  __LSRECORD_GETTER__<LSVersionNumber>(self, (LSRecord *)a3, sel__bundleVersionWithContext_tableID_unitID_unitBytes_, retstr);
  return result;
}

- (void)_LSRecord_resolve_SDKVersion
{
  id v2 = [(LSBundleRecord *)self SDKVersion];
}

- (NSString)SDKVersion
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_SDKVersionWithContext_tableID_unitID_unitBytes_);
}

- (_LSLocalizedStringRecord)_localizedIdentityUsageDescription
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedIdentityUsageDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (char)developerType
{
  return __LSRECORD_GETTER__<unsigned char>(self, (LSRecord *)a2, sel_developerTypeWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isLinkEnabledWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return (*(unsigned char *)&a6->base.flags >> 3) & 1;
}

- (LSVersionNumber)_bundleVersionWithContext:(SEL)a3 tableID:(LSContext *)a4 unitID:(unsigned int)a5 unitBytes:(unsigned int)a6
{
  long long v7 = *(_OWORD *)&a7->version._opaque[16];
  *(_OWORD *)retstr->_opaque = *(_OWORD *)a7->version._opaque;
  *(_OWORD *)&retstr->_opaque[16] = v7;
  return self;
}

- (unsigned)codeSignatureVersionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return a6->signatureVersion;
}

- (BOOL)isAppleInternalWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  return *(unsigned char *)&a6->base.flags & 1;
}

- (LSBundleBaseFlags)_baseFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  return (LSBundleBaseFlags)*(unsigned char *)&a6->flags;
}

- (char)developerTypeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleData *)a6
{
  if (a3->db->schema.bundleTable != a4) {
    return -1;
  }
  if (a6->_clas == 14) {
    return 1;
  }
  char v8 = (void *)_CSStringCopyCFString();
  if (v8)
  {
    if (-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::once != -1) {
      dispatch_once(&-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::once, &__block_literal_global_37);
    }
    if ([(id)-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes containsObject:v8])
    {

      return 1;
    }
  }

  int containingDirectoryClass = a6->base.containingDirectoryClass;
  char v9 = 1;
  if (containingDirectoryClass != 1 && containingDirectoryClass != 4)
  {
    if ((*(unsigned char *)&a6->base.flags & 1) == 0) {
      return 3;
    }
    auditToken = self->_auditToken;
    if (auditToken)
    {
      if (_LSIsAuditTokenPlatformBinary(auditToken)) {
        return 1;
      }
      else {
        return -1;
      }
    }
    return -1;
  }
  return v9;
}

- (NSString)_fallbackLocalizedName
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__10;
  uint64_t v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__LSBundleRecord__fallbackLocalizedName__block_invoke;
  v7[3] = &unk_1E522DAF8;
  v7[4] = self;
  v7[5] = &v8;
  __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v7);
  if (v9[5])
  {
    uint64_t v2 = +[_LSLocalizedStringRecord sanitizeString:](_LSLocalizedStringRecord, "sanitizeString:");
    unint64_t v3 = (void *)v9[5];
    v9[5] = v2;
  }
  else
  {
    int v4 = _LSDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[LSBundleRecord _fallbackLocalizedName]();
    }

    unint64_t v3 = (void *)v9[5];
    v9[5] = @"(no path)";
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (NSArray)privacyTrackingDomains
{
  uint64_t v2 = [(LSBundleRecord *)self infoDictionary];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 objectForKey:@"NSPrivacyTrackingDomains" ofClass:v3 valuesOfClass:objc_opt_class()];

  if (v4) {
    id v5 = (void *)v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (NSString)applicationIdentifier
{
  uint64_t v2 = [(LSBundleRecord *)self entitlements];
  uint64_t v3 = [v2 _applicationIdentifier];

  return (NSString *)v3;
}

- (id)groupContainerIdentifiers
{
  uint64_t v3 = [(LSBundleRecord *)self bundleIdentifier];
  if (!v3) {
    goto LABEL_3;
  }
  uint64_t v4 = (void *)v3;
  id v5 = [(LSBundleRecord *)self bundleIdentifier];
  id v6 = [(LSBundleRecord *)self entitlements];
  id v7 = _LSCopyGroupContainerIdentifiersFromEntitlements(v5, v6);

  if (!v7) {
LABEL_3:
  }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);

  return v7;
}

- (NSArray)UIBackgroundModes
{
  uint64_t v2 = [(LSBundleRecord *)self infoDictionary];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 objectForKey:@"UIBackgroundModes" ofClass:v3 valuesOfClass:objc_opt_class()];

  if (v4) {
    id v5 = (void *)v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (LSPropertyList)infoDictionary
{
  return (LSPropertyList *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_infoDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (id)intentDefinitionURLsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LSBundleBaseData *)a6
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v9 = +[_LSLazyPropertyList lazyPropertyListWithContext:a3 unit:a6->intentDefinitionURLs];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = -[_LSLazyPropertyList propertyList](v9);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__LSBundleRecord_Intents__intentDefinitionURLsWithContext_tableID_unitID_unitBytes___block_invoke;
    v14[3] = &unk_1E522DB20;
    id v15 = v8;
    [v11 enumerateKeysAndObjectsUsingBlock:v14];
  }
  uint64_t v12 = (void *)[v8 copy];

  return v12;
}

+ (LSBundleRecord)coreTypesBundleRecord
{
  uint64_t v2 = objc_alloc_init(_LSCoreTypesRecordProxy);

  return (LSBundleRecord *)v2;
}

+ (LSBundleRecord)bundleRecordWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = [[LSApplicationRecord alloc] initWithBundleIdentifier:a3 allowPlaceholder:a4 error:0];
  if (v7)
  {
    id v8 = (LSApplicationExtensionRecord *)v7;
LABEL_3:
    char v9 = 0;
    goto LABEL_4;
  }
  uint64_t v11 = [LSApplicationExtensionRecord alloc];
  if (a5) {
    uint64_t v12 = &v16;
  }
  else {
    uint64_t v12 = 0;
  }
  if (a5) {
    id v16 = 0;
  }
  id v8 = -[LSApplicationExtensionRecord initWithBundleIdentifier:error:](v11, "initWithBundleIdentifier:error:", a3, v12, v16);
  if (!a5) {
    goto LABEL_3;
  }
  id v13 = v16;
  char v9 = v13;
  if (!v8)
  {
    uint64_t v14 = (void *)*MEMORY[0x1E4F28760];
    if (v13)
    {
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      v18[0] = v13;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      _LSMakeNSErrorImpl(v14, -10814, (uint64_t)"+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]", 163, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      id v8 = 0;
    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]", 165, 0);
      id v8 = 0;
      char v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_4:

  return (LSBundleRecord *)v8;
}

void __84__LSBundleRecord_Intents__intentDefinitionURLsWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a3 isDirectory:0];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
  }
}

- (NSDictionary)groupContainerURLs
{
  return (NSDictionary *)[(LSBundleRecord *)self _getGroupContainersCreatingIfNecessary:1 checkNonContainerizedBundles:0];
}

+ (id)bundleRecordForAuditToken:(id *)a3 error:(id *)a4
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v4;
  id v5 = [a1 _bundleRecordForAuditToken:v7 checkNSBundleMainBundle:0 error:a4];

  return v5;
}

+ (LSBundleRecord)bundleRecordForCurrentProcess
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_LSCurrentProcessMayMapDatabase())
  {
    uint64_t v3 = (_OWORD *)_LSGetAuditTokenForSelf();
    if (v3)
    {
      long long v4 = v3[1];
      v18[0] = *v3;
      v18[1] = v4;
      id v17 = 0;
      id v5 = [a1 _bundleRecordForAuditToken:v18 checkNSBundleMainBundle:1 error:&v17];
      id v6 = v17;
      if (!v5)
      {
        id v7 = _LSDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v20 = v6;
          _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "failure to find bundle record for our audit token: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
    id WeakRetained = (id)+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord;
    if (!WeakRetained)
    {
      id WeakRetained = objc_loadWeakRetained(&LaunchServices::Record::weakCurrentProcessRecord);
      if (!WeakRetained)
      {
        char v9 = (_OWORD *)_LSGetAuditTokenForSelf();
        if (v9)
        {
          long long v10 = v9[1];
          v16[0] = *v9;
          v16[1] = v10;
          id v15 = 0;
          id WeakRetained = [a1 _bundleRecordForAuditToken:v16 checkNSBundleMainBundle:1 error:&v15];
          id v11 = v15;
          if (v11)
          {
            uint64_t v12 = _LSDefaultLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              +[LSBundleRecord bundleRecordForCurrentProcess]();
            }
          }
          LaunchServices::Record::storeWeakSharedRecord(WeakRetained, &LaunchServices::Record::weakCurrentProcessRecord);
        }
        else
        {
          id WeakRetained = 0;
        }
      }
      objc_storeStrong((id *)&+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord, WeakRetained);
      dispatch_time_t v13 = dispatch_time(0, 5000000000);
      dispatch_after(v13, MEMORY[0x1E4F14428], &__block_literal_global_18);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
    id v5 = WeakRetained;
  }

  return (LSBundleRecord *)v5;
}

+ (id)_bundleRecordForAuditToken:(id *)a3 checkNSBundleMainBundle:(unsigned __int8)a4 error:(id *)a5
{
  v70[1] = *MEMORY[0x1E4F143B8];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__10;
  v60 = __Block_byref_object_dispose__10;
  id v61 = 0;
  MayMapDatabase = (LaunchServices::DatabaseContext *)_LSCurrentProcessMayMapDatabase();
  if (MayMapDatabase)
  {
    CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(MayMapDatabase);
    id v53 = 0;
    char v54 = 0;
    id v55 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    char v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

    if (!v10)
    {
      if (a5)
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        v23 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v23, 0);

        if (v24) {
          id v25 = 0;
        }
        else {
          id v25 = v55;
        }
        *a5 = v25;
      }
      goto LABEL_36;
    }
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__10;
    v50 = __Block_byref_object_dispose__10;
    id v51 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    long long v11 = *(_OWORD *)&a3->var0[4];
    long long v43 = *(_OWORD *)a3->var0;
    v42[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke;
    v42[3] = &unk_1E522D9E0;
    long long v44 = v11;
    unsigned __int8 v45 = a4;
    v42[4] = &v46;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v42);
    if (!v47[5])
    {
      if (a5)
      {
        uint64_t v65 = *MEMORY[0x1E4F28228];
        v66 = @"The file system path for this process could not be determined. It may not be running, or it may have been deleted or moved while running.";
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -600, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 371, v27);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_35;
    }
    uint64_t v38 = 0;
    long long v39 = &v38;
    uint64_t v40 = 0x2020000000;
    int v41 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_2;
    v37[3] = &unk_1E522DA08;
    v37[4] = &v38;
    v37[5] = &v46;
    __LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__((uint64_t)v37);
    int v12 = *((_DWORD *)v39 + 6);
    if (v12 == 2)
    {
      uint64_t v28 = [LSApplicationRecord alloc];
      uint64_t v29 = [(LSApplicationRecord *)v28 _initWithNode:v47[5] bundleIdentifier:0 placeholderBehavior:0 systemPlaceholder:0 itemID:0 forceInBundleContainer:0 context:v10 error:a5];
      uint64_t v18 = (void *)v57[5];
      v57[5] = v29;
LABEL_33:

      goto LABEL_34;
    }
    if (v12 == 12)
    {
      uint64_t v13 = v47[5];
      uint64_t v14 = [LSApplicationExtensionRecord alloc];
      id v62 = 0;
      uint64_t v15 = [(LSApplicationExtensionRecord *)v14 _initWithUUID:0 node:v13 bundleIdentifier:0 context:v10 requireValid:0 error:&v62];
      id v16 = v62;
      id v17 = v16;
      if (a5 && !v15) {
        *a5 = v16;
      }

      uint64_t v18 = (void *)v57[5];
      v57[5] = v15;
      goto LABEL_33;
    }
    if ([(id)v47[5] isDirectory])
    {
      if (a5)
      {
        uint64_t v69 = *MEMORY[0x1E4F28228];
        v70[0] = @"This process' bundle type is not something Launch Services registers.";
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 363, v18);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        *a5 = v30;
        goto LABEL_33;
      }
    }
    else if (a5)
    {
      uint64_t v67 = *MEMORY[0x1E4F28228];
      v68 = @"This process is not the executable of a bundle.";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 365, v18);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_34:
    _Block_object_dispose(&v38, 8);
LABEL_35:
    _Block_object_dispose(&v46, 8);

LABEL_36:
    if (CurrentContext && v54) {
      _LSContextDestroy(CurrentContext);
    }
    id v31 = v53;
    CurrentContext = 0;
    id v53 = 0;

    char v54 = 0;
    id v32 = v55;
    id v55 = 0;

    goto LABEL_40;
  }
  int v19 = _LSGetPIDFromToken(a3);
  if (v19 == getpid())
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_3;
    v36[3] = &unk_1E522DA58;
    v36[4] = &v56;
    id v20 = _LSRetryForConnectionInterrupted(v36);
    uint64_t v21 = v20;
    if (v57[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [(id)v57[5] extensionPointRecord];
        +[LSExtensionPointRecord setExtensionPointRecordForCurrentProcess:v22];
      }
    }
    else if (a5)
    {
      *a5 = v20;
    }
  }
  else if (a5)
  {
    uint64_t v63 = *MEMORY[0x1E4F28228];
    v64 = @"unknown entitlement";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"+[LSBundleRecord _bundleRecordForAuditToken:checkNSBundleMainBundle:error:]", 407, v26);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_40:
  long long v33 = (void *)v57[5];
  if (v33 && !v33[4]) {
    operator new();
  }
  uint64_t v34 = v33;
  _Block_object_dispose(&v56, 8);

  return v34;
}

id __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  long long v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  v6[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v6[1] = (void (*)(void, void))3221225472;
  v6[2] = (void (*)(void, void))__75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_4;
  v6[3] = (void (*)(void, void))&unk_1E522BA78;
  v6[4] = (void (*)(void, void))&v7;
  uint64_t v2 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v6);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_5;
  v5[3] = &unk_1E522DA30;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = &v7;
  [v2 getBundleRecordForCurrentProcessWithCompletionHandler:v5];
  id v3 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v3;
}

void __69__LSBundleRecord_exported_typesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = _UTTypeGet();
  if (v5 && ((*(_DWORD *)(v5 + 8) >> 4) & 1) == *(unsigned char *)(a1 + 60))
  {
    id v6 = [(LSRecord *)[_UTDeclaredTypeRecord alloc] _initWithContext:*(void *)(a1 + 48) tableID:*(unsigned int *)(a1 + 56) unitID:a3];
    if (v6)
    {
      objc_storeWeak(v6 + 4, *(id *)(a1 + 32));
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

+ (id)_propertyClasses
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];

  return v2;
}

void __40__LSBundleRecord__fallbackLocalizedName__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) URL];
  uint64_t v2 = [v6 lastPathComponent];
  uint64_t v3 = [v2 stringByDeletingPathExtension];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)_LSCopyBundleURLForAuditToken((_OWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [[FSNode alloc] initWithURL:v2 flags:0 error:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = v6;
  }
}

- (NSURL)dataContainerURL
{
  id v4 = 0;
  [(LSBundleRecord *)self getDataContainerURL:&v4 error:0];
  id v2 = v4;

  return (NSURL *)v2;
}

- (id)_getGroupContainersCreatingIfNecessary:(BOOL)a3 checkNonContainerizedBundles:(BOOL)a4
{
  BOOL v12 = 0;
  uint64_t v5 = [(LSBundleRecord(Personas) *)self _personasWithAttributes];
  id v6 = _LSShouldFetchContainersFromContainermanagerForPersona(v5, [(LSBundleRecord *)self _usesSystemPersona], &v12);

  if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) != 0 || !v6 && v12)
  {
    uint64_t v7 = [(LSBundleRecord *)self bundleIdentifier];
    dyld_get_active_platform();
    uint64_t v8 = (uint64_t)_LSCopyGroupContainerURLSFromContainermanager(v7);
  }
  else
  {
    uint64_t v9 = [(LSBundleRecord *)self _rawGroupContainerURLsCheckingRedaction];
    uint64_t v7 = -[_LSLazyPropertyList propertyList](v9);

    uint64_t v8 = _LSCopyRationalizedGroupContainerURLDict(v7);
  }
  uint64_t v10 = (void *)v8;

  if (!v10 || v6)
  {

    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

- (BOOL)getDataContainerURL:(id *)a3 error:(id *)a4
{
  if (![(LSBundleRecord *)self isRedacted])
  {
LABEL_4:
    uint64_t v10 = [(LSBundleRecord *)self _cachedDataContainerURL];
    BOOL v23 = 0;
    long long v11 = [(LSBundleRecord(Personas) *)self _personasWithAttributes];
    _LSShouldFetchContainersFromContainermanagerForPersona(v11, [(LSBundleRecord *)self _usesSystemPersona], &v23);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v13 = [(LSBundleRecord *)self _containerized];
    BOOL v14 = v12 == 0;
    if (v12) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = v13;
    }
    if (v15 && (v23 || !v10))
    {
      if (!v23)
      {
        id v16 = _LSDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[LSBundleRecord(Containers) getDataContainerURL:error:](v16);
        }
      }
      id v17 = [(LSBundleRecord *)self bundleIdentifier];
      uint64_t v18 = [(LSBundleRecord *)self _containerClass];
      unsigned int active_platform = dyld_get_active_platform();
      uint64_t v20 = _LSCopyDataContainerURLFromContainermanager(v17, v18, active_platform);

      uint64_t v10 = (void *)v20;
    }
    if (a4) {
      *a4 = v12;
    }
    if (a3) {
      *a3 = v10;
    }

    goto LABEL_20;
  }
  id v24 = 0;
  BOOL v7 = [(LSBundleRecord *)self unredactWithError:&v24];
  id v8 = v24;
  uint64_t v9 = v8;
  if (v7)
  {

    goto LABEL_4;
  }
  uint64_t v22 = _LSDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction]();
  }

  if (a4)
  {
    id v12 = v9;
    BOOL v14 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v14 = 0;
    id v12 = v9;
  }
LABEL_20:

  return v14;
}

- (BOOL)isRedacted
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)_cachedDataContainerURL
{
  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  id v3 = self->_cachedDataContainerURL;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  if (v3)
  {
    id v4 = (id)*MEMORY[0x1E4F1D260];
  }
  else
  {
    if (![(LSBundleRecord *)self _containerized]
      || ![(id)__LSDefaultsGetSharedInstance() isInEducationMode]
      || ([(LSBundleRecord *)self bundleIdentifier],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [(LSBundleRecord *)self _containerClass],
          unsigned int active_platform = dyld_get_active_platform(),
          id v3 = (id)_LSCopyDataContainerURLFromContainermanager(v5, v6, active_platform),
          v5,
          !v3))
    {
      id v3 = [(LSBundleRecord *)self _dataContainerURLFromDatabase];
    }
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    id v4 = (id)*MEMORY[0x1E4F1D260];
    if (v3) {
      id v8 = v3;
    }
    else {
      id v8 = (void *)*MEMORY[0x1E4F1D260];
    }
    objc_storeStrong(&self->_cachedDataContainerURL, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  }
  if (v3 == v4) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v3;
  }
  id v10 = v9;

  return v10;
}

- (id)_rawGroupContainerURLsCheckingRedaction
{
  if (![(LSBundleRecord *)self isRedacted]) {
    goto LABEL_4;
  }
  id v9 = 0;
  BOOL v3 = [(LSBundleRecord *)self unredactWithError:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3)
  {

LABEL_4:
    uint64_t v6 = [(LSBundleRecord *)self _rawGroupContainerURLs];
    goto LABEL_8;
  }
  BOOL v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LSBundleRecord _rawGroupContainerURLsCheckingRedaction]();
  }

  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)wasBuiltWithThreadSanitizer
{
  return ([(LSBundleRecord *)self _baseFlags] >> 2) & 1;
}

- (BOOL)isProfileValidated
{
  return [(LSBundleRecord *)self _profileValidationState] != 0;
}

- (NSString)localizedShortName
{
  BOOL v3 = [(LSBundleRecord *)self _localizedShortName];
  id v4 = [v3 stringValue];
  uint64_t v5 = postprocessLocalizedNameishStringFromStringRecord(self, v4);

  return (NSString *)v5;
}

+ (LSBundleRecord)bundleRecordWithApplicationIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"LSBundleRecord.mm", 176, @"Invalid parameter not satisfying: %@", @"appID != nil" object file lineNumber description];
  }
  uint64_t v6 = (LaunchServices::DatabaseContext *)_LSLogAppRecordInitsForDataSeparation();
  if (v6)
  {
    BOOL v7 = _LSDataSeparationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = a3;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_INFO, "bundle record search with app ID: %@", buf, 0xCu);
    }
  }
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext(v6);
  id v26 = 0;
  char v27 = 0;
  id v28 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v8, 0);

  if (v9)
  {
    LaunchServices::BindingEvaluator::CreateWithApplicationIdentifier((LaunchServices::BindingEvaluator *)a3, 0, (uint64_t)buf);
    int Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)buf);
    LaunchServices::BindingEvaluator::setOptions((uint64_t)buf, Options | 0x80);
    LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)buf, v23);
    if (v24)
    {
      long long v11 = [LSApplicationRecord alloc];
      id v12 = [(LSApplicationRecord *)v11 _initWithContext:v9 bundleID:LODWORD(v23[0]) bundleData:v23[1] error:a4];
      if (v24)
      {
      }
    }
    else
    {
      id v12 = 0;
    }
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)buf);
  }
  else if (a4)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    BOOL v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v13, 0);

    if (v14) {
      id v15 = 0;
    }
    else {
      id v15 = v28;
    }
    id v12 = 0;
    *a4 = v15;
  }
  else
  {
    id v12 = 0;
  }
  id v16 = v12;
  if (CurrentContext && v27) {
    _LSContextDestroy(CurrentContext);
  }
  id v17 = v26;
  CurrentContext = 0;
  id v26 = 0;

  char v27 = 0;
  id v18 = v28;
  id v28 = 0;

  return (LSBundleRecord *)v16;
}

- (NSString)bundleVersion
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(LSBundleRecord *)self _bundleVersion];
  id v2 = _LSVersionNumberGetStringRepresentation(&v4);

  return (NSString *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LSBundleRecord;
  -[LSRecord encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [a3 encodeObject:self->_node forKey:@"node"];
  [a3 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  if (self->_auditToken)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:self->_auditToken objCType:"{?=[8I]}"];
    [a3 encodeObject:v5 forKey:@"auditToken"];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  id v6 = self->_cachedDataContainerURL;
  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
  [a3 encodeObject:v6 forKey:@"cachedDataContainerURL"];
  [a3 encodeBool:*(unsigned char *)&self->_flags & 1 forKey:@"redacted"];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int var3 = a4->var3;
  db = a3->db;
  if (var3 == a3->db->schema.bundleTable)
  {
    uint64_t v11 = _LSBundleGet(db, a4->var2);
    if (v11)
    {
      if (*(_DWORD *)(v11 + 168) == 11) {
        id v12 = objc_alloc_init(_LSCoreTypesRecordProxy);
      }
      else {
        id v12 = [[LSApplicationRecord alloc] _initWithContext:a3 persistentIdentifierData:a4 length:a5];
      }
      goto LABEL_15;
    }
    uint64_t v14 = _LSRecordLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
      *(_DWORD *)long long buf = 138412290;
      id v26 = v15;
      _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEBUG, "Failed to initialize application/bundle record with persistent identifier %@ because it was not found in the database.", buf, 0xCu);
    }
  }
  else
  {
    if (var3 != a3->db->schema.pluginTable)
    {

      int v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", a4, a5, @"LSPersistentIdentifier");
      char v24 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v22 = [v19 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"The persistent identifier passed to -[LSBundleRecord initWithPersistentIdentifier:] was for a different type of record." userInfo:v21];

      objc_exception_throw(v22);
    }
    uint64_t v13 = _LSGetPlugin((uint64_t)db, a4->var2);
    if (v13)
    {
      id v12 = [[LSApplicationExtensionRecord alloc] _initWithContext:a3 pluginID:a4->var2 pluginData:v13 error:0];
LABEL_15:
      id v17 = v12;

      return v17;
    }
    uint64_t v14 = _LSRecordLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
      *(_DWORD *)long long buf = 138412290;
      id v26 = v16;
      _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEBUG, "Failed to initialize application extension record with persistent identifier %@ because it was not found in the database.", buf, 0xCu);
    }
  }

  return 0;
}

- (LSBundleRecord)initWithCoder:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)LSBundleRecord;
  long long v4 = -[LSRecord initWithCoder:](&v43, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"node");
    node = v4->_node;
    v4->_node = (FSNode *)v5;

    uint64_t v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
    bundleIdentifier = v4->_bundleIdentifier;
    v4->_bundleIdentifier = (NSString *)v7;

    if (!v4->_auditToken)
    {
      uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"auditToken");
      id v10 = v9;
      if (v9 && !strcmp((const char *)[objc_retainAutorelease(v9) objCType], "{?=[8I]}")) {
        operator new();
      }
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = objc_msgSend(a3, "ls_decodeObjectOfClasses:forKey:", v13, @"cachedDataContainerURL");
    id cachedDataContainerURL = v4->_cachedDataContainerURL;
    v4->_id cachedDataContainerURL = (id)v14;

    *(unsigned char *)&v4->_flags = *(unsigned char *)&v4->_flags & 0xFE | [a3 decodeBoolForKey:@"redacted"];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = [(LSRecord *)v4 _resolvedPropertyValueForGetter:sel_claimRecords];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v16);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v39 + 1) + 8 * i) + 32), v4);
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v17);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v20 = [(LSRecord *)v4 _resolvedPropertyValueForGetter:sel_exportedTypeRecords];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v20);
          }
          char v24 = *(id **)(*((void *)&v35 + 1) + 8 * j);
          if ([v24 isDeclared]) {
            objc_storeWeak(v24 + 4, v4);
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v21);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v25 = [(LSRecord *)v4 _resolvedPropertyValueForGetter:sel_importedTypeRecords];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(id **)(*((void *)&v31 + 1) + 8 * k);
          if ([v29 isDeclared]) {
            objc_storeWeak(v29 + 4, v4);
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v26);
    }
  }
  return v4;
}

void __68__LSBundleRecord_developerTypeWithContext_tableID_unitID_unitBytes___block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = @"System";
  v4[1] = @"SystemAppPlaceholder";
  v4[2] = @"Internal";
  v4[3] = @"Hidden";
  v4[4] = @"CoreServices";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 initWithArray:v1];
  BOOL v3 = (void *)-[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes;
  -[LSBundleRecord developerTypeWithContext:tableID:unitID:unitBytes:]::systemTypes = v2;
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v5, a3);
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    long long v4 = [(LSBundleRecord *)self _localizedIdentityUsageDescription];
    uint64_t v5 = [v4 stringValue];
    goto LABEL_5;
  }
  if (!a3)
  {
    long long v4 = [(LSBundleRecord *)self _localizedMicrophoneUsageDescription];
    uint64_t v5 = [v4 stringValue];
LABEL_5:
    id v6 = (void *)v5;

    goto LABEL_9;
  }
  uint64_t v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Unknown usage description feature %lu", (uint8_t *)&v9, 0xCu);
  }

  id v6 = 0;
LABEL_9:

  return v6;
}

void __47__LSBundleRecord_bundleRecordForCurrentProcess__block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
  id v0 = (void *)+[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord;
  +[LSBundleRecord bundleRecordForCurrentProcess]::strongCurrentProcessRecord = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::currentProcessLock);
}

void __75__LSBundleRecord__bundleRecordForAuditToken_checkNSBundleMainBundle_error___block_invoke_4(uint64_t a1, void *a2)
{
}

- (NSSet)serviceRecords
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (const)_auditToken
{
  return self->_auditToken;
}

- (BOOL)_usesSystemPersona
{
  return 0;
}

- (BOOL)_containerized
{
  return 0;
}

- (unint64_t)_containerClass
{
  return 0;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v4 = [(LSBundleRecord *)self bundleIdentifier];
  uint64_t v5 = [(LSBundleRecord *)self URL];
  id v6 = (void *)[v3 initWithFormat:@"{ bundleID: %@, URL: %@ }", v4, v5];

  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(LSBundleRecord *)self bundleIdentifier];
  id v6 = [(LSBundleRecord *)self URL];
  v10.receiver = self;
  v10.super_class = (Class)LSBundleRecord;
  uint64_t v7 = [(LSRecord *)&v10 debugDescription];
  id v8 = (void *)[v3 initWithFormat:@"<%@ %p> { bundleID: %@, URL: %@, super: %@ }", v4, self, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LSBundleRecord;
  uint64_t v4 = [(LSRecord *)&v7 copyWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_node);
    objc_storeStrong(v5 + 8, self->_bundleIdentifier);
    os_unfair_lock_lock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    objc_storeStrong(v5 + 5, self->_cachedDataContainerURL);
    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::Record::cachedDataContainerURLLock);
    if (self->_auditToken)
    {
      if (!v5[4]) {
        operator new();
      }
    }
  }
  return v5;
}

- (FSNode)_node
{
  return self->_node;
}

- (NSArray)_personasWithAttributes
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (id)getGroupContainersCreatingIfNecessary:(BOOL)a3
{
  return [(LSBundleRecord *)self _getGroupContainersCreatingIfNecessary:a3 checkNonContainerizedBundles:1];
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  uint64_t v5 = [(LSBundleRecord *)self _localizedName];
  id v6 = [v5 stringValueWithPreferredLocalizations:a3];
  objc_super v7 = postprocessLocalizedNameishStringFromStringRecord(self, v6);

  return v7;
}

- (id)localizedShortNameWithPreferredLocalizations:(id)a3
{
  uint64_t v5 = [(LSBundleRecord *)self _localizedShortName];
  id v6 = [v5 stringValueWithPreferredLocalizations:a3];
  objc_super v7 = postprocessLocalizedNameishStringFromStringRecord(self, v6);

  return v7;
}

- (id)localizedUsageDescriptionForFeature:(unint64_t)a3 preferredLocalizations:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v6 = [(LSBundleRecord *)self _localizedIdentityUsageDescription];
    uint64_t v7 = [v6 stringValueWithPreferredLocalizations:a4];
    goto LABEL_5;
  }
  if (!a3)
  {
    id v6 = [(LSBundleRecord *)self _localizedMicrophoneUsageDescription];
    uint64_t v7 = [v6 stringValueWithPreferredLocalizations:a4];
LABEL_5:
    id v8 = (void *)v7;

    goto LABEL_9;
  }
  int v9 = _LSDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = a3;
    _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "Unknown usage description feature %lu", (uint8_t *)&v11, 0xCu);
  }

  id v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)isUPPValidated
{
  return [(LSBundleRecord *)self _profileValidationState] == 2;
}

- (BOOL)isFreeProfileValidated
{
  return [(LSBundleRecord *)self _profileValidationState] == 3;
}

- (unint64_t)compatibilityState
{
  return 0;
}

- (NSArray)managedPersonas
{
  return 0;
}

- (NSArray)associatedPersonas
{
  return 0;
}

- (BOOL)personaIsApplicable:(id)a3
{
  if ([(LSBundleRecord *)self _usesSystemPersona]) {
    return 1;
  }
  id v6 = [(LSBundleRecord *)self associatedPersonas];
  char v5 = [v6 containsObject:a3];

  return v5;
}

- (NSString)accentColorName
{
  uint64_t v2 = [(LSBundleRecord *)self infoDictionary];
  id v3 = [v2 objectForKey:@"NSAccentColorName" ofClass:objc_opt_class()];

  return (NSString *)v3;
}

- (NSArray)WKBackgroundModes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsNowPlaying
{
  return 0;
}

- (NSArray)supportedIntents
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)intentsRestrictedWhileLocked
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)intentsRestrictedWhileProtectedDataUnavailable
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)supportedIntentMediaCategories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (id)redactedProperties
{
  if (+[LSBundleRecord(Redaction) redactedProperties]::once != -1) {
    dispatch_once(&+[LSBundleRecord(Redaction) redactedProperties]::once, &__block_literal_global_436);
  }
  uint64_t v2 = (void *)+[LSBundleRecord(Redaction) redactedProperties]::properties;

  return v2;
}

void __47__LSBundleRecord_Redaction__redactedProperties__block_invoke()
{
  id v0 = (void *)+[LSBundleRecord(Redaction) redactedProperties]::properties;
  +[LSBundleRecord(Redaction) redactedProperties]::properties = (uint64_t)&unk_1ECB43B70;
}

- (BOOL)eligibleForRedaction
{
  return ([(LSBundleRecord *)self _baseFlags] >> 5) & 1;
}

- (void)redact
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    if ([(LSBundleRecord *)self eligibleForRedaction])
    {
      [(LSRecord *)self _resolveAllProperties];
      [(LSRecord *)self detach];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      id v3 = objc_msgSend((id)objc_opt_class(), "redactedProperties", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v9;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v3);
            }
            [(LSRecord *)self _removeResolvedPropertyValueForGetter:NSSelectorFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * v6++))];
          }
          while (v4 != v6);
          uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v4);
      }

      *(unsigned char *)&self->_flags |= 1u;
    }
    else
    {
      uint64_t v7 = _LSDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[LSBundleRecord(Redaction) redact]();
      }
    }
  }
}

- (id)recordForUnredactingWithContext:(LSContext *)a3 error:(id *)a4
{
}

- (BOOL)unredactWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return 1;
  }
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v34 = 0;
    long long v31 = 0;
    id v32 = 0;
    char v33 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v6, 0);

    if (v7)
    {
      id v30 = 0;
      long long v8 = [(LSBundleRecord *)self recordForUnredactingWithContext:v7 error:&v30];
      id v23 = v30;
      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v10 = [(id)objc_opt_class() redactedProperties];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = NSSelectorFromString(*(NSString **)(*((void *)&v26 + 1) + 8 * i));
              id v15 = [v8 v14];
              [(LSRecord *)self _setResolvedPropertyValue:v15 forGetter:v14];
              if (objc_opt_respondsToSelector()) {
                [v9 addObject:v15];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
          }
          while (v11);
        }

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_2;
        v24[3] = &unk_1E522D3E8;
        id v16 = v9;
        id v25 = v16;
        [(LSRecord *)self _ifAttached:&__block_literal_global_447 else:v24];
        *(unsigned char *)&self->_flags &= ~1u;

        BOOL v3 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v18, 0);

      if (!v19)
      {
        id v23 = v34;
        if (a3) {
          goto LABEL_23;
        }
        goto LABEL_26;
      }
      id v23 = 0;
    }
    if (a3)
    {
LABEL_23:
      id v23 = v23;
      BOOL v3 = 0;
      long long v8 = 0;
      *a3 = v23;
      goto LABEL_27;
    }
LABEL_26:
    BOOL v3 = 0;
    long long v8 = 0;
LABEL_27:
    if (v31 && v33) {
      _LSContextDestroy(v31);
    }
    id v20 = v32;
    long long v31 = 0;
    id v32 = 0;

    char v33 = 0;
    id v21 = v34;
    id v34 = 0;

    return v3;
  }
  uint64_t v17 = _LSDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[LSBundleRecord(Redaction) unredactWithError:](v17);
  }

  if (!a3) {
    return 0;
  }
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[LSBundleRecord(Redaction) unredactWithError:]", 1788, 0);
  BOOL v3 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v3;
}

uint64_t __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_450];
}

uint64_t __47__LSBundleRecord_Redaction__unredactWithError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 detach];
}

- (BOOL)appProtectionHidden
{
  return 0;
}

- (BOOL)appProtectionLocked
{
  return 0;
}

+ (void)bundleRecordForCurrentProcess
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_182959000, v0, OS_LOG_TYPE_ERROR, "failure to find bundle record for our audit token: %@", v1, 0xCu);
}

- (void)executableURLWithContext:tableID:unitID:unitBytes:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_182959000, v0, OS_LOG_TYPE_ERROR, "Cannot generate executableURL for app %@ because it has no resolvable bundle URL", v1, 0xCu);
}

- (void)executableURLWithContext:tableID:unitID:unitBytes:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_182959000, v1, OS_LOG_TYPE_DEBUG, "Cannot generate executableURL for app %@ because it has no executable path stored (%llx)", v2, 0x16u);
}

- (void)_initWithNode:(os_log_t)log bundleIdentifier:context:tableID:unitID:bundleBaseData:error:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "could not resolve URL while initializing a bundle record!", v1, 2u);
}

- (void)_rawGroupContainerURLsCheckingRedaction
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2(&dword_182959000, v0, v1, "could not unredact record %@: %@");
}

- (void)_fallbackLocalizedName
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_182959000, v0, OS_LOG_TYPE_FAULT, "Asked for fallback localized name for a bundle for which we could not determine the last path component of its URL: %@", v1, 0xCu);
}

@end