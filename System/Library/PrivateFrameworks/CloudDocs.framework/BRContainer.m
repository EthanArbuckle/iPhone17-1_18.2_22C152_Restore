@interface BRContainer
+ (BOOL)canMoveFilesWithoutDownloadingFromContainer:(id)a3 toContainer:(id)a4;
+ (BOOL)isDocumentScopePublicWithProperties:(id)a3 mangledID:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (BOOL)versionOfBundle:(id)a3 changedFromVersion:(id)a4;
+ (id)_URLForPlistOfMangledID:(id)a3;
+ (id)_bundleIDVersionsWithProperties:(id)a3 mangledID:(id)a4;
+ (id)_bundleIDsWithProperties:(id)a3;
+ (id)_containerRepositoryURLForMangledID:(id)a3;
+ (id)_documentsTypesWithProperties:(id)a3;
+ (id)_exportedTypesWithProperties:(id)a3;
+ (id)_iconGeneratorVersionWithProperties:(id)a3;
+ (id)_iconMetadataWithProperties:(id)a3;
+ (id)_iconURLsWithProperties:(id)a3 mangledID:(id)a4;
+ (id)_importedTypesWithProperties:(id)a3;
+ (id)_isDocumentScopePublicAsNumberWithProperties:(id)a3 mangledID:(id)a4;
+ (id)_localizedNameWithProperties:(id)a3 mangledID:(id)a4;
+ (id)_localizedNameWithProperties:(id)a3 mangledID:(id)a4 preferredLanguages:(id)a5;
+ (id)_pathForIconName:(id)a3 mangledID:(id)a4;
+ (id)_sanitizedContainerFallbackNameForMangledID:(id)a3;
+ (id)allContainers;
+ (id)allContainersBlockIfNeeded:(BOOL)a3;
+ (id)allContainersByContainerID;
+ (id)bundleIdentifiersEnumeratorForProperties:(id)a3;
+ (id)bundlePropertyEnumerator:(id)a3 valuesOfClass:(Class)a4 forProperties:(id)a5;
+ (id)classesForDecoding;
+ (id)containerForItemAtURL:(id)a3 error:(id *)a4;
+ (id)containerForMangledID:(id)a3;
+ (id)containerInRepositoryURL:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5;
+ (id)containerInRepositoryURL:(id)a3 error:(id *)a4;
+ (id)containersRepositoryURL;
+ (id)documentContainers;
+ (id)documentsContainersInBackupHomeAtURL:(id)a3 error:(id *)a4;
+ (id)localizedNameForDefaultCloudDocsContainer;
+ (id)localizedNameForDesktopContainer;
+ (id)localizedNameForDocumentsContainer;
+ (id)propertiesForMangledID:(id)a3 usingBundle:(__CFBundle *)a4 minimumBundleVersion:(id)a5 bundleIcons:(id *)a6;
+ (void)_generateiOSIconsForMangledID:(id)a3 usingBundle:(__CFBundle *)a4 generatedIcons:(id)a5;
+ (void)forceRefreshAllContainersWithCompletion:(id)a3;
+ (void)forceRefreshContainers:(id)a3 completion:(id)a4;
+ (void)initialize;
+ (void)postContainerListUpdateNotification;
+ (void)postContainerStatusChangeNotificationWithID:(id)a3 key:(id)a4 value:(id)a5;
+ (void)unregisterCurrentProcessAsPriorityHint;
- (BOOL)_updateMetadataOnDiskWithProperties:(id)a3;
- (BOOL)containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:(id)a3 excludedButPreservedExtensions:(id)a4 andStampUploadedAppWithXattr:(BOOL)a5;
- (BOOL)deleteAllContentsOnClientAndServer:(BOOL)a3 error:(id *)a4;
- (BOOL)deleteAllContentsOnClientAndServer:(id *)a3;
- (BOOL)hasIconWithName:(id)a3;
- (BOOL)isCloudSyncTCCDisabled;
- (BOOL)isDocumentScopePublic;
- (BOOL)isInCloudDocsZone;
- (BOOL)isInInitialState;
- (BOOL)registerCurrentProcessAsPriorityHintWithError:(id *)a3;
- (BOOL)updateMetadataWithExtractorProperties:(id)a3 iconPaths:(id)a4 bundleID:(id)a5;
- (BOOL)updateMetadataWithRecordData:(id)a3 iconPaths:(id)a4;
- (BRContainer)initWithCoder:(id)a3;
- (BRContainer)initWithDocsOrDesktopContainerID:(id)a3;
- (BRContainer)initWithMangledID:(id)a3;
- (BRContainer)initWithMangledID:(id)a3 dataRepresentation:(id)a4;
- (NSDate)lastServerUpdate;
- (NSSet)bundleIdentifiers;
- (NSSet)documentsTypes;
- (NSSet)exportedTypes;
- (NSSet)importedTypes;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)supportedFolderLevels;
- (NSURL)documentsURL;
- (NSURL)trashURL;
- (NSURL)url;
- (id)_containerRepositoryURL;
- (id)_imageDataForSize:(CGSize)a3 scale:(int64_t)a4 isiOSIcon:(BOOL *)a5 shouldTransformToAppIcon:(BOOL *)a6;
- (id)_pathForIconName:(id)a3;
- (id)_pathForPlist;
- (id)bestFittingImageDataForSize:(CGSize)a3 shouldTransformToAppIcon:(BOOL *)a4;
- (id)bundleIDVersions;
- (id)computedProperties;
- (id)copyDataRepresentation;
- (id)description;
- (id)iconGeneratorVersion;
- (id)iconMetadata;
- (id)iconURLs;
- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4;
- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4 isiOSIcon:(BOOL *)a5;
- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4 shouldTransformToAppIcon:(BOOL *)a5;
- (id)imageRepresentationsAvailable;
- (id)localizedNameWithPreferredLanguages:(id)a3;
- (id)shortDescription;
- (id)trashRestoreStringForURL:(id)a3;
- (id)versionNumberForBundleIdentifier:(id)a3;
- (unsigned)currentStatus;
- (void)_performWhileAccessingSecurityScopedContainer:(id)a3;
- (void)_replaceDataRepresentationWithData:(id)a3;
- (void)accessDataRepresentationInBlock:(id)a3;
- (void)accessPropertiesInBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)forceRefreshWithCompletion:(id)a3;
- (void)setCurrentStatus:(unsigned int)a3;
- (void)setIsCloudSyncTCCDisabled:(BOOL)a3;
- (void)setIsInCloudDocsZone:(BOOL)a3;
- (void)setIsInInitialState:(BOOL)a3;
- (void)setLastServerUpdate:(id)a3;
- (void)setUrlRoot:(id)a3;
@end

@implementation BRContainer

+ (id)classesForDecoding
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

+ (id)localizedNameForDefaultCloudDocsContainer
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = _BRLocalizedStringWithFormat(@"iCloud Drive", @"Localizable", v2, v3, v4, v5, v6, v7, v10);

  return v8;
}

+ (BOOL)versionOfBundle:(id)a3 changedFromVersion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v8 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]", 1731);
    uint64_t v10 = brc_default_log(0);
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      +[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]();
    }
    goto LABEL_12;
  }
  uint64_t v7 = [v5 infoDictionary];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];

  uint64_t v9 = [v5 bundleIdentifier];
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v12 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]", 1739);
    v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412802;
      v20 = v8;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid version '%@' or identifier '%@'%@", (uint8_t *)&v19, 0x20u);
    }

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  v15 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]", 1744);
  v16 = brc_default_log(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle %@ has version %@, minimum version is %@%@", (uint8_t *)&v19, 0x2Au);
  }

  if (v6) {
    BOOL v14 = [v6 compare:v8 options:64] == -1;
  }
  else {
    BOOL v14 = 1;
  }
LABEL_18:

  return v14;
}

+ (void)initialize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___BRContainer;
  objc_msgSendSuper2(&v4, sel_initialize);
  v2 = (void *)BRContainerFormatVersionNumberValue;
  BRContainerFormatVersionNumberValue = (uint64_t)&unk_1EF1335F8;

  uint64_t v3 = (void *)BRContainerIconGeneratorVersionNumberValue;
  BRContainerIconGeneratorVersionNumberValue = (uint64_t)&unk_1EF133610;
}

- (BRContainer)initWithMangledID:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRContainer;
  id v6 = [(BRContainer *)&v21 init];
  if (v6)
  {
    if (initWithMangledID__onceToken != -1) {
      dispatch_once(&initWithMangledID__onceToken, &__block_literal_global_27);
    }
    objc_storeStrong((id *)&v6->_mangledID, a3);
    v6->_shouldUsePurgeableData = 1;
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = containerWorkloop;
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("clouddocs.container.default", v9, v8);

    observationSetupQueueForDefaultConnection = v6->_observationSetupQueueForDefaultConnection;
    v6->_observationSetupQueueForDefaultConnection = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v13 = containerWorkloop;
    BOOL v14 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("clouddocs.container.secondary", v14, v13);

    observationSetupQueueForSecondaryConnection = v6->_observationSetupQueueForSecondaryConnection;
    v6->_observationSetupQueueForSecondaryConnection = (OS_dispatch_queue *)v15;

    v17 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v18 = objc_msgSend(v17, "br_currentPersonaID");
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v18;
  }
  return v6;
}

uint64_t __33__BRContainer_initWithMangledID___block_invoke()
{
  containerWorkloop = (uint64_t)dispatch_workloop_create("cloudocs.container.workloop");

  return MEMORY[0x1F41817F8]();
}

- (BRContainer)initWithDocsOrDesktopContainerID:(id)a3
{
  id v4 = a3;
  id v5 = [[BRMangledID alloc] initWithAppLibraryName:v4];

  id v6 = [(BRContainer *)self initWithMangledID:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    isDocumentScopePublicAsNumber = v6->_isDocumentScopePublicAsNumber;
    v6->_isDocumentScopePublicAsNumber = (NSNumber *)MEMORY[0x1E4F1CC38];

    v7->_isInCloudDocsZone = 1;
  }

  return v7;
}

- (BRContainer)initWithMangledID:(id)a3 dataRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = brc_bread_crumbs((uint64_t)"-[BRContainer initWithMangledID:dataRepresentation:]", 320);
    BOOL v14 = brc_default_log(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRContainer initWithMangledID:dataRepresentation:]();
    }
  }
  v8 = [(BRContainer *)self initWithMangledID:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_shouldUsePurgeableData = 0;
    if (!v7)
    {
      dispatch_queue_t v10 = brc_bread_crumbs((uint64_t)"-[BRContainer initWithMangledID:dataRepresentation:]", 325);
      BOOL v11 = brc_default_log(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BRContainer initWithMangledID:dataRepresentation:]((uint64_t)v6);
      }
    }
    [(BRContainer *)v9 _replaceDataRepresentationWithData:v7];
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  mangledID = self->_mangledID;
  id v6 = [(BRContainer *)self shortDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p id:%@ %@>", v4, self, mangledID, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [[BRMangledID alloc] initWithAppLibraryName:v5];
  id v7 = [(BRContainer *)self initWithMangledID:v6];
  if (v7)
  {
    v7->_isCloudSyncTCCDisabled = [v4 decodeBoolForKey:@"BRContainerIsCloudSyncTCCDisabledKey"];
    v7->_isInInitialState = [v4 decodeBoolForKey:@"BRContainerIsInInitialState"];
    v7->_isInCloudDocsZone = [v4 decodeBoolForKey:@"BRContainerIsInCloudDocsZone"];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "decodeBoolForKey:", @"BRContainerIsDocumentScopePublic"));
    isDocumentScopePublicAsNumber = v7->_isDocumentScopePublicAsNumber;
    v7->_isDocumentScopePublicAsNumber = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BRContainerDataKey"];
    dataRepresentation = v7->_dataRepresentation;
    v7->_dataRepresentation = (NSData *)v10;

    v7->_shouldUsePurgeableData = [v4 decodeBoolForKey:@"BRContainerShouldUsePurgeableDataKey"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BRContainerPersonaID"];
    personaID = v7->_personaID;
    v7->_personaID = (NSString *)v12;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BRMangledID *)self->_mangledID appLibraryOrZoneName];
  [v4 encodeObject:v5 forKey:@"identifier"];

  [v4 encodeBool:self->_isCloudSyncTCCDisabled forKey:@"BRContainerIsCloudSyncTCCDisabledKey"];
  [v4 encodeBool:self->_isInInitialState forKey:@"BRContainerIsInInitialState"];
  [v4 encodeBool:self->_isInCloudDocsZone forKey:@"BRContainerIsInCloudDocsZone"];
  objc_msgSend(v4, "encodeBool:forKey:", -[BRContainer isDocumentScopePublic](self, "isDocumentScopePublic"), @"BRContainerIsDocumentScopePublic");
  [v4 encodeObject:self->_personaID forKey:@"BRContainerPersonaID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [v6 userInfo];
    NSClassFromString((NSString *)@"BRCClientPrivilegesDescriptor");
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v6 userInfo];
    }
    else
    {
      uint64_t v8 = 0;
    }

    if (([v8 hasAuditToken] & 1) == 0) {
      goto LABEL_12;
    }
    if (v8)
    {
      [v8 auditToken];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (([0 hasAuditToken] & 1) == 0) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
LABEL_11:
  id v9 = [(BRContainer *)self _pathForPlist];
  uint64_t v11 = [v9 fileSystemRepresentation];
  int v10 = sandbox_check_by_audit_token();

  if (!v10)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, @"BRContainerShouldUsePurgeableDataKey", v11);
    goto LABEL_13;
  }
LABEL_12:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__BRContainer_encodeWithCoder___block_invoke;
  v12[3] = &unk_1E59AF278;
  id v13 = v4;
  [(BRContainer *)self accessDataRepresentationInBlock:v12];

LABEL_13:
}

uint64_t __31__BRContainer_encodeWithCoder___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) encodeObject:a2 forKey:@"BRContainerDataKey"];
  }
  return result;
}

- (NSString)identifier
{
  return [(BRMangledID *)self->_mangledID appLibraryOrZoneName];
}

- (void)accessPropertiesInBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__BRContainer_accessPropertiesInBlock___block_invoke;
  v6[3] = &unk_1E59AF2A0;
  id v7 = v4;
  id v5 = v4;
  [(BRContainer *)self accessDataRepresentationInBlock:v6];
}

void __39__BRContainer_accessPropertiesInBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v7 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a2 options:0 format:0 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      id v5 = brc_bread_crumbs((uint64_t)"-[BRContainer accessPropertiesInBlock:]_block_invoke", 456);
      id v6 = brc_default_log(0);
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
        __39__BRContainer_accessPropertiesInBlock___block_invoke_cold_1((uint64_t)v4);
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)computedProperties
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__9;
  id v9 = __Block_byref_object_dispose__9;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__BRContainer_computedProperties__block_invoke;
  v4[3] = &unk_1E59AF2C8;
  v4[4] = &v5;
  [(BRContainer *)self accessPropertiesInBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __33__BRContainer_computedProperties__block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)isDocumentScopePublic
{
  id v2 = self;
  objc_sync_enter(v2);
  isDocumentScopePublicAsNumber = v2->_isDocumentScopePublicAsNumber;
  if (!isDocumentScopePublicAsNumber)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__BRContainer_isDocumentScopePublic__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    isDocumentScopePublicAsNumber = v2->_isDocumentScopePublicAsNumber;
  }
  BOOL v4 = [(NSNumber *)isDocumentScopePublicAsNumber BOOLValue];
  objc_sync_exit(v2);

  return v4;
}

void __36__BRContainer_isDocumentScopePublic__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _isDocumentScopePublicAsNumberWithProperties:v3 mangledID:*(void *)(*(void *)(a1 + 32) + 8)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v4;
}

- (id)bundleIDVersions
{
  id v2 = self;
  objc_sync_enter(v2);
  bundleIDVersions = v2->_bundleIDVersions;
  if (!bundleIDVersions)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__BRContainer_bundleIDVersions__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    bundleIDVersions = v2->_bundleIDVersions;
  }
  uint64_t v4 = bundleIDVersions;
  objc_sync_exit(v2);

  return v4;
}

void __31__BRContainer_bundleIDVersions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _bundleIDVersionsWithProperties:v3 mangledID:*(void *)(*(void *)(a1 + 32) + 8)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

- (NSSet)bundleIdentifiers
{
  id v2 = self;
  objc_sync_enter(v2);
  bundleIDs = v2->_bundleIDs;
  if (!bundleIDs)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__BRContainer_bundleIdentifiers__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    bundleIDs = v2->_bundleIDs;
  }
  uint64_t v4 = bundleIDs;
  objc_sync_exit(v2);

  return v4;
}

void __32__BRContainer_bundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _bundleIDsWithProperties:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;
}

- (NSString)localizedName
{
  id v2 = self;
  objc_sync_enter(v2);
  localizedName = v2->_localizedName;
  if (!localizedName)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__BRContainer_localizedName__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    localizedName = v2->_localizedName;
  }
  uint64_t v4 = localizedName;
  objc_sync_exit(v2);

  return v4;
}

void __28__BRContainer_localizedName__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _localizedNameWithProperties:v3 mangledID:*(void *)(*(void *)(a1 + 32) + 8)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)localizedNameForDesktopContainer
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = _BRLocalizedStringWithFormat(@"Desktop", @"Localizable", v2, v3, v4, v5, v6, v7, v10);

  return v8;
}

+ (id)localizedNameForDocumentsContainer
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v8 = _BRLocalizedStringWithFormat(@"Documents", @"Localizable", v2, v3, v4, v5, v6, v7, v10);

  return v8;
}

- (id)localizedNameWithPreferredLanguages:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRContainer *)self computedProperties];
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (v6
    || (objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"purgeableData", 0),
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [(id)objc_opt_class() _localizedNameWithProperties:v6 mangledID:self->_mangledID preferredLanguages:v4];
  }
  else
  {
    id v9 = (void *)v8;
    uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRContainer localizedNameWithPreferredLanguages:]", 550);
    uint64_t v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      mangledID = self->_mangledID;
      int v14 = 138412802;
      long long v15 = mangledID;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_debug_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] failed parsing plist for container %@: %@%@", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)supportedFolderLevels
{
  return (NSString *)@"Any";
}

- (NSSet)documentsTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  documentsTypes = v2->_documentsTypes;
  if (!documentsTypes)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__BRContainer_documentsTypes__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    documentsTypes = v2->_documentsTypes;
  }
  id v4 = documentsTypes;
  objc_sync_exit(v2);

  return v4;
}

void __29__BRContainer_documentsTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _documentsTypesWithProperties:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;
}

- (NSSet)exportedTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  exportedTypes = v2->_exportedTypes;
  if (!exportedTypes)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__BRContainer_exportedTypes__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    exportedTypes = v2->_exportedTypes;
  }
  uint64_t v4 = exportedTypes;
  objc_sync_exit(v2);

  return v4;
}

void __28__BRContainer_exportedTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _exportedTypesWithProperties:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;
}

- (NSSet)importedTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  importedTypes = v2->_importedTypes;
  if (!importedTypes)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__BRContainer_importedTypes__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    importedTypes = v2->_importedTypes;
  }
  uint64_t v4 = importedTypes;
  objc_sync_exit(v2);

  return v4;
}

void __28__BRContainer_importedTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _importedTypesWithProperties:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;
}

- (id)iconMetadata
{
  id v2 = self;
  objc_sync_enter(v2);
  iconMetadata = v2->_iconMetadata;
  if (!iconMetadata)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__BRContainer_iconMetadata__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    iconMetadata = v2->_iconMetadata;
  }
  uint64_t v4 = iconMetadata;
  objc_sync_exit(v2);

  return v4;
}

void __27__BRContainer_iconMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _iconMetadataWithProperties:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v4;
}

- (id)iconGeneratorVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  iconGeneratorVersion = v2->_iconGeneratorVersion;
  if (!iconGeneratorVersion)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__BRContainer_iconGeneratorVersion__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    iconGeneratorVersion = v2->_iconGeneratorVersion;
  }
  uint64_t v4 = iconGeneratorVersion;
  objc_sync_exit(v2);

  return v4;
}

void __35__BRContainer_iconGeneratorVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _iconGeneratorVersionWithProperties:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v4;
}

- (id)imageRepresentationsAvailable
{
  id v2 = [(BRContainer *)self iconMetadata];
  id v3 = [v2 allValues];

  return v3;
}

- (void)setUrlRoot:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(BRMangledID *)v4->_mangledID mangledIDString];
  uint64_t v6 = [v8 URLByAppendingPathComponent:v5 isDirectory:1];
  url = v4->_url;
  v4->_url = (NSURL *)v6;

  objc_sync_exit(v4);
}

- (NSURL)url
{
  id v2 = self;
  objc_sync_enter(v2);
  url = v2->_url;
  if (!url)
  {
    personaID = v2->_personaID;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __18__BRContainer_url__block_invoke;
    v7[3] = &unk_1E59AD448;
    v7[4] = v2;
    BRPerformWithPersonaAndError(personaID, v7);
    url = v2->_url;
  }
  uint64_t v5 = url;
  objc_sync_exit(v2);

  return v5;
}

void __18__BRContainer_url__block_invoke(uint64_t a1, uint64_t a2)
{
  +[BRDaemonConnection mobileDocumentsURLForPersonaID:*(void *)(*(void *)(a1 + 32) + 184) needsPersonaSwitch:a2 != 0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) mangledIDString];
  uint64_t v4 = [v7 URLByAppendingPathComponent:v3 isDirectory:1];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

- (NSURL)documentsURL
{
  BOOL v3 = [(BRMangledID *)self->_mangledID isCloudDocsMangledID];
  uint64_t v4 = [(BRContainer *)self url];
  uint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"Documents" isDirectory:1];

    uint64_t v5 = (void *)v6;
  }

  return (NSURL *)v5;
}

- (NSURL)trashURL
{
  if (![(BRMangledID *)self->_mangledID isDesktopMangledID]) {
    [(BRMangledID *)self->_mangledID isDocumentsMangledID];
  }
  BOOL v3 = [(BRContainer *)self documentsURL];
  uint64_t v4 = [v3 URLByAppendingPathComponent:@".Trash" isDirectory:1];

  return (NSURL *)v4;
}

- (id)trashRestoreStringForURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRContainer *)self documentsURL];
  uint64_t v6 = [v5 path];

  if (v6)
  {
    id v7 = [v4 path];
    id v8 = objc_msgSend(v7, "br_realpath");
    id v9 = objc_msgSend(v6, "br_realpath");
    uint64_t v10 = objc_msgSend(v8, "br_pathRelativeToPath:", v9);

    if (v10) {
      goto LABEL_9;
    }
    uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRContainer trashRestoreStringForURL:]", 675);
    uint64_t v12 = brc_default_log(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 path];
      int v18 = 138412802;
      int v19 = v13;
      __int16 v20 = 2112;
      objc_super v21 = v6;
      __int16 v22 = 2112;
      __int16 v23 = v11;
      int v14 = "[WARNING] Can't find the put back relative URL of %@ to %@%@";
      long long v15 = v12;
      uint32_t v16 = 32;
LABEL_7:
      _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
    }
  }
  else
  {
    uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRContainer trashRestoreStringForURL:]", 670);
    uint64_t v12 = brc_default_log(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 path];
      int v18 = 138412546;
      int v19 = v13;
      __int16 v20 = 2112;
      objc_super v21 = v11;
      int v14 = "[WARNING] Can't find the put back relative URL of %@%@";
      long long v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_7;
    }
  }

  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

+ (id)containersRepositoryURL
{
  id v2 = +[BRDaemonConnection cloudDocsAppSupportURL];
  BOOL v3 = [v2 URLByAppendingPathComponent:@"session/containers" isDirectory:1];

  return v3;
}

+ (id)allContainersByContainerID
{
  id v2 = +[BRContainerCache containerCache];
  BOOL v3 = [v2 allContainersByID];

  return v3;
}

+ (id)allContainers
{
  return (id)[a1 allContainersBlockIfNeeded:1];
}

+ (id)allContainersBlockIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[BRContainerCache containerCache];
  uint64_t v5 = [v4 allContainersBlockIfNeeded:v3];

  return v5;
}

+ (id)documentContainers
{
  id v2 = +[BRContainerCache containerCache];
  BOOL v3 = [v2 documentContainers];

  return v3;
}

- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4
{
  return -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](self, "_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:", a4, 0, 0, a3.width, a3.height);
}

- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4 isiOSIcon:(BOOL *)a5
{
  return -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](self, "_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:", a4, a5, 0, a3.width, a3.height);
}

- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4 shouldTransformToAppIcon:(BOOL *)a5
{
  return -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](self, "_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:", a4, 0, a5, a3.width, a3.height);
}

- (id)_imageDataForSize:(CGSize)a3 scale:(int64_t)a4 isiOSIcon:(BOOL *)a5 shouldTransformToAppIcon:(BOOL *)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 741, v31);
  uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 741);
  uint64_t v12 = brc_default_log(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134219266;
    v33 = v31[0];
    __int16 v34 = 2112;
    v35 = mangledID;
    __int16 v36 = 2048;
    double v37 = width;
    __int16 v38 = 2048;
    double v39 = height;
    __int16 v40 = 2048;
    int64_t v41 = a4;
    __int16 v42 = 2112;
    v43 = v11;
    _os_log_debug_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx requesting image for %@ (size:%.1fx%.1f@%ld)%@", buf, 0x3Eu);
  }

  id v13 = BRContainerIconNameForSizeAndScale(width, height, (double)a4);
  if (v13)
  {
    int v14 = [(BRContainer *)self _pathForIconName:v13];
    if (!v14)
    {
      long long v15 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 751);
      int v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v13;
        __int16 v34 = 2112;
        v35 = (BRMangledID *)v15;
        _os_log_impl(&dword_19ED3F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] can't construct a path for imageName=%@%@", buf, 0x16u);
      }
      uint32_t v16 = 0;
      goto LABEL_29;
    }
    long long v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
    id v30 = 0;
    uint32_t v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v15 options:0 error:&v30];
    v17 = v30;
    int v18 = v17;
    if (v16)
    {
      char v19 = [v13 hasSuffix:@"iOS"];
      BOOL v20 = v19;
      if (a5)
      {
        *a5 = v19;
        objc_super v21 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 767);
        __int16 v22 = brc_default_log(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:].cold.4(a5);
        }
      }
      if (!a6) {
        goto LABEL_29;
      }
      __int16 v23 = [(BRContainer *)self iconGeneratorVersion];
      BOOL v24 = [v23 longLongValue] < 1 && v20;
      *a6 = v24;

      __int16 v25 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 771);
      v26 = brc_default_log(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](a6);
      }
    }
    else if (([v17 br_isCocoaErrorCode:4] & 1) != 0 {
           || [v18 br_isCocoaErrorCode:260])
    }
    {
      __int16 v25 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 759);
      v26 = brc_default_log(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]();
      }
    }
    else
    {
      __int16 v25 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 761);
      v26 = brc_default_log(1);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v33 = v15;
        __int16 v34 = 2112;
        v35 = (BRMangledID *)v18;
        __int16 v36 = 2112;
        double v37 = *(double *)&v25;
        _os_log_impl(&dword_19ED3F000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create NSData with contents of '%@'; %@%@",
          buf,
          0x20u);
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  int v14 = brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 744);
  long long v15 = brc_default_log(1);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]();
  }
  uint32_t v16 = 0;
LABEL_30:

  __brc_leave_section((uint64_t)v31);

  return v16;
}

+ (BOOL)canMoveFilesWithoutDownloadingFromContainer:(id)a3 toContainer:(id)a4
{
  uint64_t v5 = a3;
  uint64_t v6 = a4;
  id v7 = v6;
  if (!v5) {
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_9;
  }
  unint64_t v8 = v5[23];
  if (v8 | v7[23])
  {
    if (!objc_msgSend((id)v8, "isEqualToString:")) {
      goto LABEL_9;
    }
  }
  id v9 = [v5 identifier];
  uint64_t v10 = [v7 identifier];
  char v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) != 0
    || [v5 isInCloudDocsZone] && (objc_msgSend(v7, "isInCloudDocsZone") & 1) != 0)
  {
LABEL_8:
    BOOL v12 = 1;
  }
  else
  {
LABEL_9:
    BOOL v12 = 0;
  }

  return v12;
}

- (void)forceRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  personaID = self->_personaID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BRContainer_forceRefreshWithCompletion___block_invoke;
  v7[3] = &unk_1E59AE270;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  BRPerformWithPersonaAndError(personaID, v7);
}

void __42__BRContainer_forceRefreshWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    BOOL v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = +[BRDaemonConnection defaultConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__BRContainer_forceRefreshWithCompletion___block_invoke_2;
    v9[3] = &unk_1E59AD510;
    id v10 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v9];
    id v6 = [*(id *)(a1 + 32) identifier];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__BRContainer_forceRefreshWithCompletion___block_invoke_3;
    v7[3] = &unk_1E59AD510;
    id v8 = *(id *)(a1 + 40);
    [v5 forceSyncWithBarrierContainerID:v6 timeout:0 reply:v7];
  }
}

uint64_t __42__BRContainer_forceRefreshWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__BRContainer_forceRefreshWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)forceRefreshAllContainersWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BRContainer allContainersBlockIfNeeded:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke;
  v7[3] = &unk_1E59AD510;
  id v8 = v4;
  id v6 = v4;
  [a1 forceRefreshContainers:v5 completion:v7];
}

void __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs((uint64_t)"+[BRContainer forceRefreshAllContainersWithCompletion:]_block_invoke", 863);
    uint64_t v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke_cold_1((uint64_t)v3);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

+ (id)bundleIdentifiersEnumeratorForProperties:(id)a3
{
  id v3 = a3;
  id v4 = [[BRContainerBundleIdentifiersEnumerator alloc] initWithContainerPlist:v3];

  return v4;
}

+ (id)bundlePropertyEnumerator:(id)a3 valuesOfClass:(Class)a4 forProperties:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[BRContainerBundlePropertyEnumerator alloc] initWithContainerPlist:v7 propertyKey:v8 valuesOfClass:a4];

  return v9;
}

- (void)_replaceDataRepresentationWithData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRContainer _replaceDataRepresentationWithData:]", 884, v20);
  uint64_t v6 = brc_bread_crumbs((uint64_t)"-[BRContainer _replaceDataRepresentationWithData:]", 884);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134218498;
    uint64_t v22 = v20[0];
    __int16 v23 = 2112;
    BOOL v24 = mangledID;
    __int16 v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Replace data for container %@%@", buf, 0x20u);
  }

  id v8 = self;
  objc_sync_enter(v8);
  if (!v8->_shouldUsePurgeableData) {
    objc_storeStrong((id *)&v8->_dataRepresentation, a3);
  }
  purgeableDataRepresentation = v8->_purgeableDataRepresentation;
  v8->_purgeableDataRepresentation = 0;

  bundleIDs = v8->_bundleIDs;
  v8->_bundleIDs = 0;

  bundleIDVersions = v8->_bundleIDVersions;
  v8->_bundleIDVersions = 0;

  localizedName = v8->_localizedName;
  v8->_localizedName = 0;

  isDocumentScopePublicAsNumber = v8->_isDocumentScopePublicAsNumber;
  v8->_isDocumentScopePublicAsNumber = 0;

  documentsTypes = v8->_documentsTypes;
  v8->_documentsTypes = 0;

  exportedTypes = v8->_exportedTypes;
  v8->_exportedTypes = 0;

  importedTypes = v8->_importedTypes;
  v8->_importedTypes = 0;

  iconMetadata = v8->_iconMetadata;
  v8->_iconMetadata = 0;

  iconURLs = v8->_iconURLs;
  v8->_iconURLs = 0;

  objc_sync_exit(v8);
  if (+[BRContainerCache hasDaemonicParts]) {
    +[BRContainer postContainerListUpdateNotification];
  }
  __brc_leave_section((uint64_t)v20);
}

- (id)_containerRepositoryURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  personaID = self->_personaID;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__BRContainer__containerRepositoryURL__block_invoke;
  v5[3] = &unk_1E59AE9E8;
  v5[4] = self;
  v5[5] = &v6;
  BRPerformWithPersonaAndError(personaID, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__BRContainer__containerRepositoryURL__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40) = +[BRContainer _containerRepositoryURLForMangledID:*(void *)(*(void *)(result + 32) + 8)];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)_containerRepositoryURLForMangledID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 containersRepositoryURL];
  uint64_t v6 = [v4 appLibraryOrZoneName];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

- (id)_pathForPlist
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  personaID = self->_personaID;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__BRContainer__pathForPlist__block_invoke;
  v5[3] = &unk_1E59AE9E8;
  v5[4] = self;
  v5[5] = &v6;
  BRPerformWithPersonaAndError(personaID, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__BRContainer__pathForPlist__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v7 = +[BRContainer _URLForPlistOfMangledID:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v4 = [v7 path];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)_pathForIconName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRContainer *)self _containerRepositoryURL];
  uint64_t v6 = [v4 stringByAppendingPathExtension:@"png"];

  id v7 = [v5 URLByAppendingPathComponent:v6];
  uint64_t v8 = [v7 path];

  return v8;
}

+ (id)_pathForIconName:(id)a3 mangledID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _containerRepositoryURLForMangledID:a4];
  uint64_t v8 = [v6 stringByAppendingPathExtension:@"png"];

  id v9 = [v7 URLByAppendingPathComponent:v8];
  id v10 = [v9 path];

  return v10;
}

+ (id)_URLForPlistOfMangledID:(id)a3
{
  id v3 = +[BRContainer _containerRepositoryURLForMangledID:a3];
  id v4 = [v3 URLByAppendingPathExtension:@"plist"];

  return v4;
}

- (void)_performWhileAccessingSecurityScopedContainer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  imageSandboxExtension = self->_imageSandboxExtension;
  if (!imageSandboxExtension)
  {
LABEL_7:
    v4[2](v4);
    goto LABEL_8;
  }
  [(NSData *)imageSandboxExtension bytes];
  if (sandbox_extension_consume() < 0)
  {
    int v6 = *__error();
    id v7 = brc_bread_crumbs((uint64_t)"-[BRContainer _performWhileAccessingSecurityScopedContainer:]", 963);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      id v9 = self->_imageSandboxExtension;
      int v10 = 138412802;
      id v11 = v9;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 2112;
      long long v15 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", (uint8_t *)&v10, 0x1Cu);
    }

    *__error() = v6;
    goto LABEL_7;
  }
  v4[2](v4);
  sandbox_extension_release();
LABEL_8:
}

+ (id)_bundleIDsWithProperties:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v6 = objc_msgSend(a1, "bundleIdentifiersEnumeratorForProperties:", v4, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_isDocumentScopePublicAsNumberWithProperties:(id)a3 mangledID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCloudDocsMangledID])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC38];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v10 = [v9 persistentDomainForName:@"com.apple.bird"];

    id v11 = [v7 appLibraryOrZoneName];
    long long v12 = [v10 objectForKey:v11];
    long long v13 = [v12 objectForKey:@"BRContainerIsDocumentScopePublic"];
    char v14 = [v13 BOOLValue];

    if (v14)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CC38];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v15 = objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", @"BRContainerIsDocumentScopePublic", objc_opt_class(), v6, 0);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v16)
      {
        int v17 = 0;
        uint64_t v18 = *(void *)v22;
        while (2)
        {
          uint64_t v19 = 0;
          v17 += v16;
          do
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v15);
            }
            if (![*(id *)(*((void *)&v21 + 1) + 8 * v19) BOOLValue])
            {

              uint64_t v8 = (void *)MEMORY[0x1E4F1CC28];
              goto LABEL_16;
            }
            ++v19;
          }
          while (v16 != v19);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        uint64_t v16 = v17 > 0;
      }

      uint64_t v8 = [NSNumber numberWithInt:v16];
    }
LABEL_16:
  }

  return v8;
}

+ (id)_bundleIDVersionsWithProperties:(id)a3 mangledID:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v27 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = [a1 bundleIdentifiersEnumeratorForProperties:v5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (!v7) {
      goto LABEL_24;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    uint64_t v26 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        long long v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v11, v26);
        if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          long long v13 = brc_bread_crumbs((uint64_t)"+[BRContainer _bundleIDVersionsWithProperties:mangledID:]", 1032);
          char v14 = brc_default_log(1);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            uint64_t v35 = v11;
            __int16 v36 = 2112;
            double v37 = v16;
            __int16 v38 = 2112;
            double v39 = v13;
            id v17 = v16;
            _os_log_impl(&dword_19ED3F000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving bundle properties for %@: unexpected kind of class (expected: NSDictionary, actual: %@)%@", buf, 0x20u);
          }
        }
        else
        {
          long long v13 = [v12 objectForKeyedSubscript:@"BRContainerFormatVersionNumber"];
          if (!v13) {
            goto LABEL_22;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v14 = [v12 objectForKeyedSubscript:@"BRContainerVersionNumber"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v32[0] = @"BRContainerFormatVersionNumber";
              v32[1] = @"BRContainerVersionNumber";
              v33[0] = v13;
              v33[1] = v14;
              long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
              [v27 setObject:v15 forKeyedSubscript:v11];
            }
            else
            {
              id v20 = v5;
              long long v21 = v6;
              long long v15 = brc_bread_crumbs((uint64_t)"+[BRContainer _bundleIDVersionsWithProperties:mangledID:]", 1053);
              long long v22 = brc_default_log(1);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                long long v23 = objc_opt_class();
                *(_DWORD *)buf = 138412802;
                uint64_t v35 = v11;
                __int16 v36 = 2112;
                double v37 = v23;
                __int16 v38 = 2112;
                double v39 = v15;
                id v24 = v23;
                _os_log_impl(&dword_19ED3F000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving bundle version for %@: unexpected kind of class (expected: NSString, actual: %@)%@", buf, 0x20u);
              }
              id v6 = v21;
              id v5 = v20;
              uint64_t v9 = v26;
            }
          }
          else
          {
            char v14 = brc_bread_crumbs((uint64_t)"+[BRContainer _bundleIDVersionsWithProperties:mangledID:]", 1046);
            long long v15 = brc_default_log(1);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              uint64_t v35 = v11;
              __int16 v36 = 2112;
              double v37 = v18;
              __int16 v38 = 2112;
              double v39 = v14;
              id v19 = v18;
              _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving format version for %@: unexpected kind of class (expected: NSNumber, actual: %@)%@", buf, 0x20u);
            }
          }
        }
LABEL_22:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (!v8)
      {
LABEL_24:

        goto LABEL_26;
      }
    }
  }
  id v27 = 0;
LABEL_26:

  return v27;
}

+ (id)_localizedNameWithProperties:(id)a3 mangledID:(id)a4
{
  return (id)[a1 _localizedNameWithProperties:a3 mangledID:a4 preferredLanguages:0];
}

+ (id)_localizedNameWithProperties:(id)a3 mangledID:(id)a4 preferredLanguages:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isCloudDocsMangledID])
  {
    uint64_t v11 = [(id)objc_opt_class() localizedNameForDefaultCloudDocsContainer];
    goto LABEL_62;
  }
  if ([v9 isDesktopMangledID])
  {
    uint64_t v11 = [(id)objc_opt_class() localizedNameForDesktopContainer];
    goto LABEL_62;
  }
  if ([v9 isDocumentsMangledID])
  {
    uint64_t v11 = [(id)objc_opt_class() localizedNameForDocumentsContainer];
    goto LABEL_62;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v12 = [a1 bundleIdentifiersEnumeratorForProperties:v8];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (!v13)
  {

    goto LABEL_61;
  }
  uint64_t v14 = v13;
  id v52 = a1;
  id v54 = v9;
  v60 = 0;
  uint64_t v61 = *(void *)v67;
  id v57 = v10;
  id v58 = v8;
  v56 = v12;
  do
  {
    uint64_t v15 = 0;
    uint64_t v53 = v14;
    do
    {
      if (*(void *)v67 != v61) {
        objc_enumerationMutation(v12);
      }
      uint64_t v16 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v66 + 1) + 8 * v15), v52);
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __int16 v40 = v16;
          uint64_t v41 = brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1092);
          __int16 v42 = brc_default_log(1);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v72 = v43;
            __int16 v73 = 2112;
            v74 = v41;
            id v44 = v43;
            _os_log_impl(&dword_19ED3F000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] bundleProperties should be a dictionary (kind: %@)%@", buf, 0x16u);
          }
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
      }
      uint64_t v17 = [v16 objectForKeyedSubscript:@"BRContainerLocalizedNames"];
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        objc_opt_class();
        v59 = v16;
        if (objc_opt_isKindOfClass())
        {
          uint64_t v55 = v15;
          id v19 = [v16 objectForKeyedSubscript:@"BRContainerFormatVersionNumber"];
          objc_opt_class();
          id v20 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v19 intValue] <= 6)
          {
            long long v21 = [v18 objectForKeyedSubscript:@"en"];
            if (v21) {
              goto LABEL_21;
            }
            long long v22 = [v16 objectForKeyedSubscript:@"BRContainerName"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v24 = (void *)[v18 mutableCopy];
              __int16 v25 = [v16 objectForKeyedSubscript:@"BRContainerName"];
              [v24 setObject:v25 forKeyedSubscript:@"en"];

              long long v21 = v18;
              uint64_t v18 = v24;
LABEL_21:
            }
          }
          uint64_t v26 = (void *)MEMORY[0x1E4F28B50];
          id v27 = [v18 allKeys];
          long long v28 = [v26 preferredLocalizationsFromArray:v27 forPreferences:v10];

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v29 = v28;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
          long long v31 = v20;
          if (v30)
          {
            uint64_t v32 = v30;
            uint64_t v33 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v63 != v33) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v35 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * i)];
                if (v35)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if ([v35 length])
                    {

                      id v10 = v57;
                      id v8 = v58;
                      id v9 = v54;
                      goto LABEL_63;
                    }
                  }
                  else
                  {
                    __int16 v36 = brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1147);
                    double v37 = brc_default_log(1);
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      __int16 v38 = objc_opt_class();
                      *(_DWORD *)buf = 138412546;
                      v72 = v38;
                      __int16 v73 = 2112;
                      v74 = v36;
                      id v39 = v38;
                      _os_log_impl(&dword_19ED3F000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] localizedName should be a string (kind: %@)%@", buf, 0x16u);
                    }
                    long long v31 = v20;
                  }
                }
              }
              uint64_t v32 = [v29 countByEnumeratingWithState:&v62 objects:v70 count:16];
            }
            while (v32);
          }

          id v10 = v57;
          id v8 = v58;
          uint64_t v15 = v55;
          long long v12 = v56;
          uint64_t v14 = v53;
        }
        else
        {
          long long v31 = brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1152);
          long long v29 = brc_default_log(1);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v45 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v72 = v45;
            __int16 v73 = 2112;
            v74 = v31;
            id v46 = v45;
            _os_log_impl(&dword_19ED3F000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] localizedNames should be a dictionary (kind: %@)%@", buf, 0x16u);
          }
        }

        uint64_t v16 = v59;
      }
      if (v60) {
        goto LABEL_53;
      }
      __int16 v40 = v16;
      uint64_t v41 = [v16 objectForKeyedSubscript:@"BRContainerName"];
      if (v41)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __int16 v42 = brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1161);
          v47 = brc_default_log(1);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v72 = v48;
            __int16 v73 = 2112;
            v74 = v42;
            id v49 = v48;
            _os_log_impl(&dword_19ED3F000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] fallbackName should be a string (kind: %@)%@", buf, 0x16u);
          }
          v60 = 0;
          goto LABEL_50;
        }
      }
      if (![v41 length])
      {
        v60 = 0;
        goto LABEL_51;
      }
      v60 = v41;
LABEL_52:
      uint64_t v16 = v40;
LABEL_53:

      ++v15;
    }
    while (v15 != v14);
    uint64_t v50 = [v12 countByEnumeratingWithState:&v66 objects:v75 count:16];
    uint64_t v14 = v50;
  }
  while (v50);

  id v9 = v54;
  a1 = v52;
  uint64_t v35 = v60;
  if (!v60)
  {
LABEL_61:
    uint64_t v11 = [a1 _sanitizedContainerFallbackNameForMangledID:v9];
LABEL_62:
    uint64_t v35 = (void *)v11;
  }
LABEL_63:

  return v35;
}

+ (id)_sanitizedContainerFallbackNameForMangledID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 aliasTargetContainerString];
  id v5 = objc_msgSend(v4, "br_pathExtension");

  LODWORD(v4) = [v3 isPassbookMangledID];
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v12 = _BRLocalizedStringWithFormat(@"PASSBOOK_APP", @"Localizable", v6, v7, v8, v9, v10, v11, v20);
  }
  else
  {
    if ([v5 length])
    {
      unsigned int v13 = [v5 characterAtIndex:0];
      if (v13 > 0x7F) {
        int v14 = __maskrune(v13, 0x1000uLL);
      }
      else {
        int v14 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v13 + 60) & 0x1000;
      }
      if (v14)
      {
        uint64_t v17 = [v5 substringToIndex:1];
        uint64_t v18 = [v17 uppercaseString];

        uint64_t v19 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 1, v18);

        id v5 = (void *)v19;
      }
      uint64_t v15 = v5;
      id v5 = v15;
    }
    else
    {
      uint64_t v15 = @"Documents";
    }
    long long v12 = v15;
  }

  return v12;
}

+ (id)_documentsTypesWithProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", @"BRContainerDocumentTypes", objc_opt_class(), v4, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      id v11 = v5;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_exportedTypesWithProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", @"BRContainerExportedTypes", objc_opt_class(), v4, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      id v11 = v5;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_importedTypesWithProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", @"BRContainerImportedTypes", objc_opt_class(), v4, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      id v11 = v5;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_iconMetadataWithProperties:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"BRContainerIcons"];

  if (v4)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v3;
    id obj = [v3 objectForKeyedSubscript:@"BRContainerIcons"];
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          double v17 = 0.0;
          uint64_t v18 = 0;
          double v17 = BRContainerIconSizeForName(v9);
          uint64_t v18 = v10;
          v23[0] = @"size";
          id v11 = [MEMORY[0x1E4F29238] valueWithBytes:&v17 objCType:"{CGSize=dd}"];
          v23[1] = @"scale";
          v24[0] = v11;
          long long v12 = [NSNumber numberWithDouble:BRContainerIconScaleForName(v9)];
          v24[1] = v12;
          long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
          [v4 setObject:v13 forKeyedSubscript:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v6);
    }

    id v3 = v15;
  }

  return v4;
}

+ (id)_iconGeneratorVersionWithProperties:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", @"BRContainerIconGeneratorVersionNumber", objc_opt_class(), v4, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = &unk_1EF133628;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 longLongValue];
          if (v12 > [v9 longLongValue])
          {
            id v13 = v11;

            uint64_t v9 = v13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v9 = &unk_1EF133628;
    }
  }
  else
  {
    uint64_t v9 = &unk_1EF133628;
  }

  return v9;
}

+ (id)_iconURLsWithProperties:(id)a3 mangledID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"BRContainerIcons"];

  if (v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [v6 objectForKeyedSubscript:@"BRContainerIcons"];
    uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = [a1 _pathForIconName:v13 mangledID:v7];
          long long v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
          [v8 setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }

  return v8;
}

- (BOOL)isCloudSyncTCCDisabled
{
  return self->_isCloudSyncTCCDisabled;
}

- (void)setIsCloudSyncTCCDisabled:(BOOL)a3
{
  self->_isCloudSyncTCCDisabled = a3;
}

- (BOOL)isInInitialState
{
  return self->_isInInitialState;
}

- (void)setIsInInitialState:(BOOL)a3
{
  self->_isInInitialState = a3;
}

- (BOOL)isInCloudDocsZone
{
  return self->_isInCloudDocsZone;
}

- (void)setIsInCloudDocsZone:(BOOL)a3
{
  self->_isInCloudDocsZone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_observationSetupQueueForSecondaryConnection, 0);
  objc_storeStrong((id *)&self->_observationSetupQueueForDefaultConnection, 0);
  objc_storeStrong((id *)&self->_purgeableDataRepresentation, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_imageSandboxExtension, 0);
  objc_storeStrong((id *)&self->_lastServerUpdate, 0);
  objc_storeStrong((id *)&self->_isDocumentScopePublicAsNumber, 0);
  objc_storeStrong((id *)&self->_iconGeneratorVersion, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_iconMetadata, 0);
  objc_storeStrong((id *)&self->_importedTypes, 0);
  objc_storeStrong((id *)&self->_exportedTypes, 0);
  objc_storeStrong((id *)&self->_documentsTypes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleIDVersions, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_mangledID, 0);
}

- (NSDate)lastServerUpdate
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__9;
  long long v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  observationSetupQueueForSecondaryConnection = self->_observationSetupQueueForSecondaryConnection;
  p_isObservingLastServerUpdate = &self->_isObservingLastServerUpdate;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke;
  v10[3] = &unk_1E59AF340;
  v10[4] = self;
  v10[5] = &v11;
  uint64_t v5 = v10;
  uint64_t block = MEMORY[0x1E4F143A8];
  p_uint64_t block = 3221225472;
  uint64_t v19 = (uint64_t)__brc_block_perform_once_and_set_block_invoke;
  long long v20 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E59AF5B0;
  long long v21 = v5;
  long long v22 = p_isObservingLastServerUpdate;
  id v6 = observationSetupQueueForSecondaryConnection;
  dispatch_sync(v6, &block);

  if (v12[5])
  {
    -[BRContainer setLastServerUpdate:](self, "setLastServerUpdate:");
    id v7 = (id)v12[5];
  }
  else
  {
    uint64_t block = 0;
    p_uint64_t block = (uint64_t)&block;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__9;
    long long v21 = __Block_byref_object_dispose__9;
    long long v22 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_367;
    v9[3] = &unk_1E59AE180;
    void v9[4] = self;
    v9[5] = &block;
    dispatch_async_and_wait((dispatch_queue_t)containerWorkloop, v9);
    id v7 = *(id *)(p_block + 40);
    _Block_object_dispose(&block, 8);
  }
  _Block_object_dispose(&v11, 8);

  return (NSDate *)v7;
}

void __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[BRContainerCache containerCache];
  [v2 subscribeToContainerStatusUpdate];

  id v3 = +[BRDaemonConnection secondaryConnection];
  id v4 = (void *)[v3 newSyncProxy];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) aliasTargetContainerString];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_2;
  uint64_t v13 = &unk_1E59AF318;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v4;
  id v6 = v4;
  [v6 getContainerLastServerUpdateWithID:v5 reply:&v10];

  uint64_t v7 = objc_msgSend(v6, "result", v10, v11, v12, v13, v14);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRXcodeAdditions) lastServerUpdate]_block_invoke_2", 1317);
    uint64_t v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      int v10 = 138412802;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] unable to retrieve last server updated for container %@; %@%@",
        (uint8_t *)&v10,
        0x20u);
    }
  }
  [*(id *)(a1 + 40) setObjResult:v5 error:v6];
}

void __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_367(uint64_t a1)
{
}

- (unsigned)currentStatus
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9;
  uint64_t v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  observationSetupQueueForSecondaryConnection = self->_observationSetupQueueForSecondaryConnection;
  p_isObservingCurrentStatus = &self->_isObservingCurrentStatus;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke;
  v11[3] = &unk_1E59AF340;
  v11[4] = self;
  v11[5] = &v12;
  id v5 = v11;
  uint64_t block = MEMORY[0x1E4F143A8];
  p_uint64_t block = 3221225472;
  uint64_t v20 = (uint64_t)__brc_block_perform_once_and_set_block_invoke;
  long long v21 = &unk_1E59AF5B0;
  id v22 = v5;
  uint64_t v23 = p_isObservingCurrentStatus;
  id v6 = observationSetupQueueForSecondaryConnection;
  dispatch_sync(v6, &block);

  uint64_t v7 = (void *)v13[5];
  if (v7)
  {
    -[BRContainer setCurrentStatus:](self, "setCurrentStatus:", [v7 unsignedIntegerValue]);
    unsigned int v8 = [(id)v13[5] unsignedIntegerValue];
  }
  else
  {
    uint64_t block = 0;
    p_uint64_t block = (uint64_t)&block;
    uint64_t v20 = 0x2020000000;
    LODWORD(v21) = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_369;
    v10[3] = &unk_1E59AE180;
    v10[4] = self;
    v10[5] = &block;
    dispatch_async_and_wait((dispatch_queue_t)containerWorkloop, v10);
    unsigned int v8 = *(_DWORD *)(p_block + 24);
    _Block_object_dispose(&block, 8);
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[BRContainerCache containerCache];
  [v2 subscribeToContainerStatusUpdate];

  id v3 = +[BRDaemonConnection secondaryConnection];
  id v4 = (void *)[v3 newSyncProxy];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) aliasTargetContainerString];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_2;
  id v13 = &unk_1E59AF368;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v4;
  id v6 = v4;
  [v6 getContainerStatusWithID:v5 reply:&v10];

  uint64_t v7 = objc_msgSend(v6, "result", v10, v11, v12, v13, v14);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRXcodeAdditions) currentStatus]_block_invoke_2", 1351);
    uint64_t v7 = brc_default_log(0);
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_error_impl(&dword_19ED3F000, v7, (os_log_type_t)0x90u, "[ERROR] unable to retrieve status for container %@; %@%@",
        (uint8_t *)&v11,
        0x20u);
    }
  }
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [NSNumber numberWithUnsignedInt:a2];
  [v8 setObjResult:v9 error:v5];
}

uint64_t __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_369(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 132);
  return result;
}

- (void)setLastServerUpdate:(id)a3
{
  id v4 = a3;
  [(BRContainer *)self willChangeValueForKey:@"lastServerUpdate"];
  id v5 = containerWorkloop;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __61__BRContainer_BRXcodeInternalAdditions__setLastServerUpdate___block_invoke;
  uint64_t v10 = &unk_1E59AD648;
  int v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, &v7);
  [(BRContainer *)self didChangeValueForKey:@"lastServerUpdate", v7, v8, v9, v10, v11];
}

void __61__BRContainer_BRXcodeInternalAdditions__setLastServerUpdate___block_invoke(uint64_t a1)
{
}

- (void)setCurrentStatus:(unsigned int)a3
{
  [(BRContainer *)self willChangeValueForKey:@"currentStatus"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__BRContainer_BRXcodeInternalAdditions__setCurrentStatus___block_invoke;
  v5[3] = &unk_1E59AF390;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_async_and_wait((dispatch_queue_t)containerWorkloop, v5);
  [(BRContainer *)self didChangeValueForKey:@"currentStatus"];
}

uint64_t __58__BRContainer_BRXcodeInternalAdditions__setCurrentStatus___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 132) = *(_DWORD *)(result + 40);
  return result;
}

+ (id)documentsContainersInBackupHomeAtURL:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v5 = [v32 URLByAppendingPathComponent:@"Library/Application Support/CloudDocs"];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"session/containers"];

  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [MEMORY[0x1E4F28CB8] defaultManager];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v30 = v39 = 0u;
  long long v31 = (void *)v6;
  uint64_t v7 = [v30 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:5 errorHandler:0];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    int v11 = @"plist";
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v14 = [v13 pathExtension];
        int v15 = [v14 isEqualToString:v11];

        if (v15)
        {
          id v35 = 0;
          uint64_t v16 = [a1 containerInRepositoryURL:v13 createIfMissing:0 error:&v35];
          id v17 = v35;
          if (v16)
          {
            if ([v16 isDocumentScopePublic])
            {
              long long v18 = [v16 documentsURL];

              if (v18) {
                [v33 addObject:v16];
              }
            }
          }
          else
          {
            uint64_t v19 = v11;
            uint64_t v20 = v7;
            id v21 = a1;
            id v22 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) documentsContainersInBackupHomeAtURL:error:]", 1431);
            uint64_t v23 = brc_default_log(0);
            if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
            {
              id v24 = [v13 path];
              *(_DWORD *)buf = 138412802;
              uint64_t v41 = v24;
              __int16 v42 = 2112;
              id v43 = v17;
              __int16 v44 = 2112;
              v45 = v22;
              _os_log_error_impl(&dword_19ED3F000, v23, (os_log_type_t)0x90u, "[ERROR] can't extract container at %@: %@%@", buf, 0x20u);
            }
            a1 = v21;
            uint64_t v7 = v20;
            int v11 = v19;
            uint64_t v10 = v34;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v9);
  }

  __int16 v25 = BRContainerIfDirectoryInHomeURLIsSynced(v32, @"Documents", @"com.apple.Documents");
  if (v25) {
    [v33 addObject:v25];
  }
  uint64_t v26 = BRContainerIfDirectoryInHomeURLIsSynced(v32, @"Desktop", @"com.apple.Desktop");

  if (v26) {
    [v33 addObject:v26];
  }
  id v27 = [[BRMangledID alloc] initWithAppLibraryName:@"com.apple.CloudDocs"];
  long long v28 = [[BRContainer alloc] initWithMangledID:v27];
  [v33 addObject:v28];

  return v33;
}

+ (id)containerInRepositoryURL:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 lastPathComponent];
  uint64_t v9 = objc_msgSend(v8, "brc_stringByDeletingPathExtension");

  uint64_t v10 = [[BRMangledID alloc] initWithAppLibraryName:v9];
  id v23 = 0;
  int v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:&v23];
  id v12 = v23;
  __int16 v13 = v12;
  if (!v12) {
    goto LABEL_4;
  }
  if ((objc_msgSend(v12, "br_isCocoaErrorCode:", 260) & 1) == 0)
  {
    uint64_t v16 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]", 1471);
    id v17 = brc_default_log(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v22 = [v7 path];
      *(_DWORD *)buf = 138413058;
      __int16 v25 = (const char *)v10;
      __int16 v26 = 2112;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      long long v31 = v16;
      _os_log_debug_impl(&dword_19ED3F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] failed reading data for container %@ at '%@': %@%@", buf, 0x2Au);
    }
    id v18 = v13;
    uint64_t v19 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]", 1472);
    uint64_t v20 = brc_default_log(0);
    if (!os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      goto LABEL_16;
    }
    id v21 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    __int16 v25 = "+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]";
    __int16 v26 = 2080;
    if (!a5) {
      id v21 = "(ignored by caller)";
    }
    goto LABEL_22;
  }
  if (a4)
  {
LABEL_4:
    id v14 = [[BRContainer alloc] initWithMangledID:v10 dataRepresentation:v11];
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v9);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    uint64_t v19 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]", 1475);
    uint64_t v20 = brc_default_log(0);
    if (!os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
LABEL_16:

      goto LABEL_17;
    }
    id v21 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    __int16 v25 = "+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]";
    __int16 v26 = 2080;
    if (!a5) {
      id v21 = "(ignored by caller)";
    }
LABEL_22:
    id v27 = v21;
    __int16 v28 = 2112;
    id v29 = v18;
    __int16 v30 = 2112;
    long long v31 = v19;
    _os_log_error_impl(&dword_19ED3F000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_16;
  }
LABEL_17:
  if (a5) {
    *a5 = v18;
  }

  id v14 = 0;
LABEL_5:

  return v14;
}

+ (id)containerInRepositoryURL:(id)a3 error:(id *)a4
{
  return (id)[a1 containerInRepositoryURL:a3 createIfMissing:0 error:a4];
}

+ (id)containerForItemAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "br_cloudDocsContainer");
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)deleteAllContentsOnClientAndServer:(id *)a3
{
  return [(BRContainer *)self deleteAllContentsOnClientAndServer:0 error:a3];
}

- (BOOL)deleteAllContentsOnClientAndServer:(BOOL)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__9;
  id v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  personaID = self->_personaID;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke;
  v12[3] = &unk_1E59AF3B8;
  void v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  BOOL v13 = a3;
  BRPerformWithPersonaAndError(personaID, v12);
  if (*((unsigned char *)v21 + 24))
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = (id)v15[5];
    if (v7)
    {
      id v8 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]", 1539);
      uint64_t v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        int v11 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v25 = "-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]";
        __int16 v26 = 2080;
        if (!a4) {
          int v11 = "(ignored by caller)";
        }
        id v27 = v11;
        __int16 v28 = 2112;
        id v29 = v7;
        __int16 v30 = 2112;
        long long v31 = v8;
        _os_log_error_impl(&dword_19ED3F000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v7;
    }

    BOOL v6 = *((unsigned char *)v21 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v6;
}

void __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    id v5 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]_block_invoke", 1519);
    BOOL v6 = brc_default_log(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_2(a1);
    }

    if ([*(id *)(a1 + 32) isInCloudDocsZone]
      && ([*(id *)(a1 + 32) identifier],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isEqualToString:@"com.apple.CloudDocs"],
          v7,
          (v8 & 1) == 0))
    {
      id v18 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]_block_invoke", 1522);
      id v19 = brc_default_log(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v18, v19);
      }

      uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = [*(id *)(a1 + 32) documentsURL];
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v22 + 40);
      char v23 = [v20 removeItemAtURL:v21 error:&obj];
      objc_storeStrong((id *)(v22 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23;
    }
    else
    {
      uint64_t v9 = +[BRDaemonConnection defaultConnection];
      uint64_t v10 = (void *)[v9 newSyncProxy];

      int v11 = [*(id *)(*(void *)(a1 + 32) + 8) appLibraryOrZoneName];
      uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      __int16 v26 = __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_403;
      id v27 = &unk_1E59AD448;
      id v28 = v10;
      id v13 = v10;
      [v13 deleteAllContentsOfContainerID:v11 onClient:1 onServer:1 wait:v12 reply:&v24];

      id v14 = (id)objc_msgSend(v13, "result", v24, v25, v26, v27);
      uint64_t v15 = [v13 error];
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                             + 40) == 0;
    }
  }
}

uint64_t __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_403(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObjResult:0 error:a2];
}

- (id)versionNumberForBundleIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BRContainer *)self bundleIDVersions];
    BOOL v6 = [v5 objectForKeyedSubscript:v4];
    id v7 = [v6 objectForKeyedSubscript:@"BRContainerFormatVersionNumber"];

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v9 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) versionNumberForBundleIdentifier:]", 1561);
      uint64_t v10 = brc_default_log(1);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        uint64_t v12 = 0;
        goto LABEL_16;
      }
      int v16 = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2112;
      id v21 = v9;
      id v13 = v19;
      _os_log_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving format version for %@: unexpected kind of class (expected: NSNumber, actual: %@)%@", (uint8_t *)&v16, 0x20u);
    }
    else
    {
      int v8 = [v7 intValue];
      if (v8 < (int)[(id)BRContainerFormatVersionNumberValue intValue])
      {
        uint64_t v9 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) versionNumberForBundleIdentifier:]", 1565);
        uint64_t v10 = brc_default_log(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 138413058;
          id v17 = v7;
          __int16 v18 = 2112;
          id v19 = (id)BRContainerFormatVersionNumberValue;
          __int16 v20 = 2112;
          id v21 = v4;
          __int16 v22 = 2112;
          char v23 = v9;
          _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] overwriting old plist from version %@ to %@ for %@%@", (uint8_t *)&v16, 0x2Au);
        }
        goto LABEL_15;
      }
      int v11 = [v5 objectForKeyedSubscript:v4];
      uint64_t v9 = [v11 objectForKeyedSubscript:@"BRContainerVersionNumber"];

      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v9 = v9;
        uint64_t v12 = v9;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) versionNumberForBundleIdentifier:]", 1572);
      id v13 = brc_default_log(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412802;
        id v17 = v4;
        __int16 v18 = 2112;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2112;
        id v21 = v10;
        id v14 = v19;
        _os_log_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving  version for %@: unexpected kind of class (expected: NSString, actual: %@)%@", (uint8_t *)&v16, 0x20u);
      }
    }

    goto LABEL_15;
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)hasIconWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    BOOL v6 = [(BRContainer *)v5 iconMetadata];
    id v7 = [v6 objectForKeyedSubscript:v4];
    BOOL v8 = v7 != 0;

    objc_sync_exit(v5);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)iconURLs
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  iconURLs = v2->_iconURLs;
  if (!iconURLs)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__BRContainer_BRInternalAdditions__iconURLs__block_invoke;
    v6[3] = &unk_1E59AF2F0;
    void v6[4] = v2;
    [(BRContainer *)v2 accessPropertiesInBlock:v6];
    iconURLs = v2->_iconURLs;
  }
  id v4 = iconURLs;
  objc_sync_exit(v2);

  return v4;
}

void __44__BRContainer_BRInternalAdditions__iconURLs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _iconURLsWithProperties:v3 mangledID:*(void *)(*(void *)(a1 + 32) + 8)];

  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v4;
}

- (id)bestFittingImageDataForSize:(CGSize)a3 shouldTransformToAppIcon:(BOOL *)a4
{
  double width = a3.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = -[BRContainer imageDataForSize:scale:shouldTransformToAppIcon:](self, "imageDataForSize:scale:shouldTransformToAppIcon:", 1, a4, a3.width, a3.height);
  if (!v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v8 = [(BRContainer *)self imageRepresentationsAvailable];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          double v19 = 0.0;
          id v14 = objc_msgSend(v13, "objectForKey:", @"size", 0);
          [v14 getValue:&v18];

          uint64_t v15 = [v13 objectForKey:@"scale"];
          uint64_t v16 = [v15 integerValue];

          if (v18 * (double)v16 >= width)
          {
            id v7 = -[BRContainer imageDataForSize:scale:shouldTransformToAppIcon:](self, "imageDataForSize:scale:shouldTransformToAppIcon:", v16, a4, v18, v19);
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v7 = 0;
LABEL_12:
  }

  return v7;
}

- (id)copyDataRepresentation
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__9;
  uint64_t v9 = __Block_byref_object_dispose__9;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__BRContainer_BRInternalAdditions__copyDataRepresentation__block_invoke;
  v4[3] = &unk_1E59AF3E0;
  v4[4] = &v5;
  [(BRContainer *)self accessDataRepresentationInBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __58__BRContainer_BRInternalAdditions__copyDataRepresentation__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F1C9B8] dataWithData:a2];

  return MEMORY[0x1F41817F8]();
}

- (void)accessDataRepresentationInBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, id))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_shouldUsePurgeableData)
  {
    purgeableDataRepresentation = v5->_purgeableDataRepresentation;
    if (purgeableDataRepresentation)
    {
      if ([(NSPurgeableData *)purgeableDataRepresentation beginContentAccess])
      {
        id v7 = 0;
LABEL_18:
        BOOL v8 = v5->_purgeableDataRepresentation;
        uint64_t v9 = v5->_purgeableDataRepresentation;

        goto LABEL_19;
      }
      id v10 = v5->_purgeableDataRepresentation;
    }
    else
    {
      id v10 = 0;
    }
    v5->_purgeableDataRepresentation = 0;

    uint64_t v11 = [(BRContainer *)v5 _pathForPlist];
    if (v11)
    {
      id v17 = 0;
      uint64_t v12 = [MEMORY[0x1E4F28FB8] dataWithContentsOfFile:v11 options:8 error:&v17];
      id v7 = v17;
      id v13 = v5->_purgeableDataRepresentation;
      v5->_purgeableDataRepresentation = (NSPurgeableData *)v12;
    }
    else
    {
      id v7 = 0;
    }
    if (!v5->_purgeableDataRepresentation
      && (objc_msgSend(v7, "br_isCocoaErrorCode:", 4) & 1) == 0
      && (objc_msgSend(v7, "br_isCocoaErrorCode:", 260) & 1) == 0)
    {
      id v14 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) accessDataRepresentationInBlock:]", 1647);
      uint64_t v15 = brc_default_log(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        long long v21 = v14;
        _os_log_impl(&dword_19ED3F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't open plist path: %@%@", buf, 0x16u);
      }
    }
    goto LABEL_18;
  }
  BOOL v8 = v5->_dataRepresentation;
  uint64_t v9 = 0;
LABEL_19:
  objc_sync_exit(v5);

  v4[2](v4, v8);
  uint64_t v16 = v5;
  objc_sync_enter(v16);
  [(NSPurgeableData *)v9 endContentAccess];
  [(NSPurgeableData *)v9 discardContentIfPossible];
  objc_sync_exit(v16);
}

- (id)shortDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28E78] stringWithString:@"apps:{"];
  uint64_t v15 = self;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(BRContainer *)self bundleIDVersions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    id v7 = "";
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v3 objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"BRContainerVersionNumber"];
        [v16 appendFormat:@"%s%@:%@", v7, v9, v11];

        id v7 = "; ";
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v7 = "; ";
    }
    while (v5);
  }
  [v16 appendString:@"}"];
  personaID = self->_personaID;
  if (personaID && ![(NSString *)personaID isEqualToString:@"__defaultPersonaID__"]) {
    [v16 appendFormat:@"%spersona:%@", " ", self->_personaID];
  }
  id v13 = " ";
  if ([(BRContainer *)v15 isDocumentScopePublic])
  {
    objc_msgSend(v16, "appendFormat:", @"%sDocumentScopePublic", " ");
    id v13 = "|";
    if ([(BRContainer *)v15 isInInitialState]) {
      objc_msgSend(v16, "appendFormat:", @"%sInInitialState", "|");
    }
  }
  if ([(BRContainer *)v15 isInCloudDocsZone])
  {
    objc_msgSend(v16, "appendFormat:", @"%sInCloudDocsZone", v13);
    id v13 = "|";
  }
  if ([(BRContainer *)v15 isCloudSyncTCCDisabled]) {
    objc_msgSend(v16, "appendFormat:", @"%sTCCDisabled", v13);
  }

  return v16;
}

+ (id)containerForMangledID:(id)a3
{
  if (a3)
  {
    id v3 = +[BRContainer _URLForPlistOfMangledID:](BRContainer, "_URLForPlistOfMangledID:");
    if (v3)
    {
      uint64_t v4 = +[BRContainer containerInRepositoryURL:v3 createIfMissing:1 error:0];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)isDocumentScopePublicWithProperties:(id)a3 mangledID:(id)a4
{
  uint64_t v4 = [a1 _isDocumentScopePublicAsNumberWithProperties:a3 mangledID:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (void)forceRefreshContainers:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v19 = a4;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        dispatch_group_enter(v7);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke;
        v23[3] = &unk_1E59AE220;
        id v24 = v6;
        uint64_t v25 = v13;
        __int16 v26 = v7;
        [v13 forceRefreshWithCompletion:v23];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  id v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v16 = dispatch_queue_create("force-refresh-container", v15);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke_2;
  block[3] = &unk_1E59AF408;
  id v21 = v6;
  id v22 = v19;
  id v17 = v19;
  id v18 = v6;
  dispatch_group_notify(v7, v16, block);
}

void __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) identifier];
    [v4 setObject:v6 forKeyedSubscript:v5];

    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *(void *)(a1 + 32);
    id v7 = @"BRPartialErrorsByContainerIDKey";
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v5 = [v2 errorWithDomain:@"BRCloudDocsErrorDomain" code:21 userInfo:v4];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

+ (void)postContainerListUpdateNotification
{
  if (!+[BRContainerCache hasDaemonicParts])
  {
    uint64_t v4 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerListUpdateNotification]", 1786);
    id v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[BRContainer(BRInternalAdditions) postContainerListUpdateNotification]();
    }
  }
  id v2 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerListUpdateNotification]", 1788);
  uint64_t v3 = brc_default_log(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[BRContainer(BRInternalAdditions) postContainerListUpdateNotification]();
  }

  if (postContainerListUpdateNotification_once != -1) {
    dispatch_once(&postContainerListUpdateNotification_once, &__block_literal_global_443);
  }
  br_pacer_signal((void *)postContainerListUpdateNotification_pacer);
}

void __71__BRContainer_BRInternalAdditions__postContainerListUpdateNotification__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("container-update", v0);

  id v2 = (void *)postContainerListUpdateNotification_queue;
  postContainerListUpdateNotification_queue = (uint64_t)v1;

  uint64_t v3 = br_pacer_create("container-update", (void *)postContainerListUpdateNotification_queue, 1.0);
  uint64_t v4 = (void *)postContainerListUpdateNotification_pacer;
  postContainerListUpdateNotification_pacer = v3;

  br_pacer_set_event_handler((void *)postContainerListUpdateNotification_pacer, &__block_literal_global_446);
  id v5 = (unsigned __int8 *)postContainerListUpdateNotification_pacer;

  br_pacer_resume(v5);
}

void __71__BRContainer_BRInternalAdditions__postContainerListUpdateNotification__block_invoke_2()
{
  objc_msgSend(@"BRContainerCacheDidChangeDistributedNotification", "br_libnotifyPerUserNotificationName");
  id v0 = objc_claimAutoreleasedReturnValue();
  brc_notify_post((char *)[v0 UTF8String]);
}

+ (void)postContainerStatusChangeNotificationWithID:(id)a3 key:(id)a4 value:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerStatusChangeNotificationWithID:key:value:]", 1811);
  uint64_t v11 = brc_default_log(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    _os_log_debug_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] broadcasting to framework clients container %@ change %@=%@%@", buf, 0x2Au);
  }

  uint64_t v12 = [MEMORY[0x1E4F28C40] defaultCenter];
  if (v9)
  {
    id v13 = objc_msgSend(v7, "appLibraryOrZoneName", BRContainerIDKey);
    v16[1] = v8;
    v17[0] = v13;
    v17[1] = v9;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

    [v12 postNotificationName:BRContainerDidChangeStatusDistributedNotification object:0 userInfo:v14];
  }
  else
  {
    id v14 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerStatusChangeNotificationWithID:key:value:]", 1813);
    uint64_t v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      +[BRContainer(BRInternalAdditions) postContainerStatusChangeNotificationWithID:key:value:]();
    }
  }
}

- (BOOL)_updateMetadataOnDiskWithProperties:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v19];
  id v5 = v19;
  if (v5)
  {
    uint64_t v6 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1828);
    id v7 = brc_default_log(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      mangledID = self->_mangledID;
      *(_DWORD *)buf = 138412802;
      id v21 = mangledID;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v6;
      _os_log_debug_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] failed plist serialization for container %@: %@%@", buf, 0x20u);
    }

    char v8 = 0;
  }
  else
  {
    uint64_t v6 = [(BRContainer *)self _pathForPlist];
    if ([(BRMangledID *)self->_mangledID isCloudDocsMangledID])
    {
      id v17 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1835);
      id v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]();
      }
    }
    char v8 = [v4 writeToFile:v6 atomically:1];
    if (v8)
    {
      id v9 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1846);
      uint64_t v10 = brc_default_log(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = self->_mangledID;
        *(_DWORD *)buf = 138413314;
        id v21 = v15;
        __int16 v22 = 2112;
        id v23 = v6;
        __int16 v24 = 2112;
        uint64_t v25 = BRContainerFormatVersionNumberValue;
        __int16 v26 = 2112;
        uint64_t v27 = BRContainerIconGeneratorVersionNumberValue;
        __int16 v28 = 2112;
        long long v29 = v9;
        _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] wrote plist for container %@ at '%@' {\n  formatVersion = %@,\n  iconGenerationVersion = %@\n}%@", buf, 0x34u);
      }

      [(BRContainer *)self _replaceDataRepresentationWithData:v4];
    }
    else
    {
      uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1838);
      uint64_t v12 = brc_default_log(0);
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        id v16 = self->_mangledID;
        *(_DWORD *)buf = 138412802;
        id v21 = v16;
        __int16 v22 = 2112;
        id v23 = v6;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v11;
        _os_log_error_impl(&dword_19ED3F000, v12, (os_log_type_t)0x90u, "[ERROR] can't write metadata for container %@ at '%@'%@", buf, 0x20u);
      }
    }
  }

  return v8;
}

- (BOOL)updateMetadataWithExtractorProperties:(id)a3 iconPaths:(id)a4 bundleID:(id)a5
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v107 = a4;
  id v8 = a5;
  v110 = v7;
  if (!v7)
  {
    id v89 = v8;
    v90 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1853);
    v91 = brc_default_log(0);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT)) {
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.8();
    }

    id v8 = v89;
  }
  v111 = (uint64_t (*)(uint64_t, uint64_t))v8;
  if (!v8)
  {
    v92 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1854);
    v93 = brc_default_log(0);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT)) {
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.7();
    }
  }
  memset(v130, 0, sizeof(v130));
  __brc_create_section(0, (uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1856, v130);
  id v9 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1856);
  uint64_t v10 = brc_default_log(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)v140 = 134218754;
    *(void *)&v140[4] = v130[0];
    *(_WORD *)&v140[12] = 2112;
    *(void *)&v140[14] = mangledID;
    *(_WORD *)&v140[22] = 2112;
    v141 = v111;
    LOWORD(v142) = 2112;
    *(void *)((char *)&v142 + 2) = v9;
    _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Update metadata with extractor properties %@ for %@%@", v140, 0x2Au);
  }

  uint64_t v11 = [(BRContainer *)self _containerRepositoryURL];
  v103 = [v11 path];

  v104 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v111 isEqualToString:@"com.apple.bird"])
  {
    v94 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1865);
    v95 = brc_default_log(0);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT)) {
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.6();
    }
  }
  *(void *)v140 = 0;
  *(void *)&v140[8] = v140;
  *(void *)&v140[16] = 0x3032000000;
  v141 = __Block_byref_object_copy__9;
  *(void *)&long long v142 = __Block_byref_object_dispose__9;
  *((void *)&v142 + 1) = 0;
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke;
  v129[3] = &unk_1E59AF430;
  v129[4] = self;
  v129[5] = v140;
  [(BRContainer *)self accessDataRepresentationInBlock:v129];
  char v12 = 0;
  id v105 = 0;
  BOOL v100 = 1;
  if (!v111) {
    goto LABEL_100;
  }
  id v13 = *(void **)(*(void *)&v140[8] + 40);
  if (!v13) {
    goto LABEL_100;
  }
  if (v107)
  {
    id v14 = [v13 objectForKeyedSubscript:@"BRContainerIcons"];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA80] setWithArray:v14];
      id v16 = [v107 allKeys];
      [v15 addObjectsFromArray:v16];

      id v17 = [v15 allObjects];
    }
    else
    {
      id v17 = [v107 allKeys];
    }
    [*(id *)(*(void *)&v140[8] + 40) setObject:v17 forKeyedSubscript:@"BRContainerIcons"];

    id v13 = *(void **)(*(void *)&v140[8] + 40);
  }
  id v18 = [v13 objectForKeyedSubscript:v111];

  if (v18)
  {
    id v19 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v20 = [*(id *)(*(void *)&v140[8] + 40) objectForKeyedSubscript:v111];
    id v21 = [v20 allKeys];
    id v22 = [v19 setWithArray:v21];

    id v23 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v24 = [v110 allKeys];
    v101 = [v23 setWithArray:v24];

    if (([v22 isEqualToSet:v101] & 1) == 0)
    {
      uint64_t v25 = [v22 setByAddingObject:@"BRContainerIconGeneratorVersionNumber"];
      int v26 = [v25 isEqualToSet:v101];

      if (!v26) {
        goto LABEL_71;
      }
    }
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v27 = [*(id *)(*(void *)&v140[8] + 40) objectForKeyedSubscript:v111];
    int v28 = 0;
    uint64_t v29 = [v27 countByEnumeratingWithState:&v125 objects:v139 count:16];
    if (v29)
    {
      uint64_t obj = *(void *)v126;
      int v30 = 1;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v126 != obj) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v125 + 1) + 8 * v31);
          id v33 = [*(id *)(*(void *)&v140[8] + 40) objectForKeyedSubscript:v111];
          uint64_t v34 = [v33 objectForKeyedSubscript:v32];

          id v35 = [v110 objectForKeyedSubscript:v32];
          if (([v32 isEqual:@"BRContainerVersionNumber"] & 1) != 0
            || [v32 isEqual:@"BRContainerIconGeneratorVersionNumber"])
          {
            int v36 = [v35 isEqual:v34];
            v30 &= v36;
            v28 |= v36 ^ 1;
          }
          else if (v34 && !v35 || v35 && (!v34 || ([v35 isEqual:v34] & 1) == 0))
          {

            int v30 = 0;
            int v28 = 0;
            goto LABEL_37;
          }

          ++v31;
        }
        while (v29 != v31);
        uint64_t v37 = [v27 countByEnumeratingWithState:&v125 objects:v139 count:16];
        uint64_t v29 = v37;
      }
      while (v37);
    }
    else
    {
      int v30 = 1;
    }
LABEL_37:

    if (((v30 | v28) & 1) != 0 && ((v30 ^ v28) & 1) == 0)
    {
      v96 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1933);
      v97 = brc_default_log(0);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT)) {
        -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.5();
      }
    }
    if (v30)
    {
      long long v39 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1936);
      __int16 v40 = brc_default_log(1);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]();
      }

      id v105 = 0;
      char v12 = 0;
      BOOL v100 = 1;
LABEL_98:

      goto LABEL_100;
    }
    if ((v28 & 1) == 0)
    {
LABEL_71:
      int v38 = 1;
LABEL_77:

      goto LABEL_78;
    }
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obja = v107;
    uint64_t v41 = [obja countByEnumeratingWithState:&v121 objects:v138 count:16];
    if (v41)
    {
      uint64_t v102 = v41;
      id v43 = 0;
      uint64_t v106 = *(void *)v122;
      char v99 = 1;
      *(void *)&long long v42 = 138412802;
      long long v98 = v42;
LABEL_46:
      uint64_t v44 = 0;
      while (1)
      {
        if (*(void *)v122 != v106) {
          objc_enumerationMutation(obja);
        }
        uint64_t v45 = *(void *)(*((void *)&v121 + 1) + 8 * v44);
        id v46 = (void *)MEMORY[0x19F3C4670]();
        uint64_t v47 = [obja objectForKeyedSubscript:v45];
        id v120 = v43;
        v48 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v47 options:1 error:&v120];
        id v49 = v120;

        if (v48 && v49 == 0)
        {
          v51 = [(BRContainer *)self _pathForIconName:v45];
          id v119 = 0;
          id v52 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v51 options:1 error:&v119];
          id v54 = v119;
          if (!v52 || v54)
          {
            id v43 = v54;
            v56 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1954);
            id v57 = brc_default_log(1);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v98;
              id v132 = v51;
              __int16 v133 = 2112;
              id v134 = v43;
              __int16 v135 = 2112;
              v136[0] = v56;
              _os_log_impl(&dword_19ED3F000, v57, OS_LOG_TYPE_DEFAULT, "[WARNING] can't read content of file at '%@'; %@%@",
                buf,
                0x20u);
            }

            int v53 = 25;
          }
          else
          {
            id v43 = 0;
            int v55 = [v48 isEqualToData:v52];
            v99 &= v55;
            int v53 = v55 ? 0 : 25;
          }
        }
        else
        {
          v51 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1947);
          id v52 = brc_default_log(1);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v98;
            id v132 = v47;
            __int16 v133 = 2112;
            id v134 = v49;
            __int16 v135 = 2112;
            v136[0] = v51;
            _os_log_impl(&dword_19ED3F000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] can't read content of file at '%@'; %@%@",
              buf,
              0x20u);
          }
          int v53 = 25;
          id v43 = v49;
        }

        if (v53) {
          break;
        }
        if (v102 == ++v44)
        {
          uint64_t v102 = [obja countByEnumeratingWithState:&v121 objects:v138 count:16];
          if (v102) {
            goto LABEL_46;
          }
          break;
        }
      }

      if ((v99 & 1) == 0)
      {
        id v58 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1969);
        v59 = brc_default_log(1);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.4();
        }
        int v38 = 1;
LABEL_76:

        goto LABEL_77;
      }
    }
    else
    {
    }
    id v58 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1966);
    v59 = brc_default_log(1);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]();
    }
    int v38 = 0;
    goto LABEL_76;
  }
  int v38 = 1;
LABEL_78:
  objc_msgSend(*(id *)(*(void *)&v140[8] + 40), "setObject:forKeyedSubscript:", v110, v111, v98);
  id v118 = 0;
  char v61 = [v104 createDirectoryAtPath:v103 withIntermediateDirectories:1 attributes:0 error:&v118];
  id v105 = v118;
  if ((v61 & 1) == 0)
  {
    long long v62 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1978);
    long long v63 = brc_default_log(0);
    if (os_log_type_enabled(v63, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v132 = v103;
      __int16 v133 = 2112;
      id v134 = v105;
      __int16 v135 = 2112;
      v136[0] = v62;
      _os_log_error_impl(&dword_19ED3F000, v63, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@'; %@%@",
        buf,
        0x20u);
    }
  }
  BOOL v100 = v38 != 0;
  if ([(BRContainer *)self _updateMetadataOnDiskWithProperties:*(void *)(*(void *)&v140[8] + 40)])
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v22 = v107;
    uint64_t v64 = [v22 countByEnumeratingWithState:&v114 objects:v137 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v115 != v65) {
            objc_enumerationMutation(v22);
          }
          uint64_t v67 = *(void *)(*((void *)&v114 + 1) + 8 * i);
          long long v68 = [v22 objectForKeyedSubscript:v67];
          long long v69 = [(BRContainer *)self _pathForIconName:v67];
          id v70 = v68;
          v71 = (const std::__fs::filesystem::path *)[v70 fileSystemRepresentation];
          id v72 = v69;
          __int16 v73 = (const std::__fs::filesystem::path *)[v72 fileSystemRepresentation];
          rename(v71, v73, v74);
          if (v75 < 0)
          {
            int v78 = *__error();
            v79 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1989);
            v80 = brc_default_log(0);
            if (os_log_type_enabled(v80, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138413058;
              id v132 = v70;
              __int16 v133 = 2112;
              id v134 = v72;
              __int16 v135 = 1024;
              LODWORD(v136[0]) = v78;
              WORD2(v136[0]) = 2112;
              *(void *)((char *)v136 + 6) = v79;
              _os_log_error_impl(&dword_19ED3F000, v80, (os_log_type_t)0x90u, "[ERROR] failed renaming from '%@' to '%@' %{errno}d%@", buf, 0x26u);
            }

            *__error() = v78;
          }
          else
          {
            uint64_t v76 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1991);
            v77 = brc_default_log(1);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v132 = v70;
              __int16 v133 = 2112;
              id v134 = v72;
              __int16 v135 = 2112;
              v136[0] = v76;
              _os_log_debug_impl(&dword_19ED3F000, v77, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed icon from '%@' to '%@'%@", buf, 0x20u);
            }
          }
        }
        uint64_t v64 = [v22 countByEnumeratingWithState:&v114 objects:v137 count:16];
      }
      while (v64);
    }
    char v12 = 1;
    goto LABEL_98;
  }
  char v12 = 0;
LABEL_100:
  v81 = [v107 allValues];
  v82 = [v81 firstObject];
  v83 = [v82 stringByDeletingLastPathComponent];

  if (v83)
  {
    id v113 = v105;
    char v84 = [v104 removeItemAtPath:v83 error:&v113];
    id v85 = v113;

    if ((v84 & 1) == 0)
    {
      v86 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 2001);
      v87 = brc_default_log(1);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v132 = v103;
        __int16 v133 = 2112;
        id v134 = v85;
        __int16 v135 = 2112;
        v136[0] = v86;
        _os_log_impl(&dword_19ED3F000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] failed removing temporary path at '%@'; %@%@",
          buf,
          0x20u);
      }
      goto LABEL_107;
    }
  }
  else
  {
    id v85 = v105;
  }
  v86 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 2003);
  v87 = brc_default_log(1);
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
    -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]((uint64_t)v103);
  }
LABEL_107:

  _Block_object_dispose(v140, 8);
  __brc_leave_section((uint64_t)v130);

  return v100 & v12;
}

void __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v19 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:2 format:0 error:&v19];
    id v5 = v19;
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v8 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]_block_invoke", 1875);
      id v9 = brc_default_log(1);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [v3 length];
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_DWORD *)buf = 134218754;
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        uint64_t v23 = v18;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        uint64_t v27 = v8;
        _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] failed parsing %lu-byte plist for container %@: %@%@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]_block_invoke", 1882);
    uint64_t v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v3 length];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 134218498;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_debug_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] read %lu-byte plist for container %@%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v10 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]_block_invoke", 1880);
    uint64_t v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke_cold_1(a1);
    }
  }
}

- (BOOL)updateMetadataWithRecordData:(id)a3 iconPaths:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v47 = v5;
  if (!v5)
  {
    long long v42 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2011);
    id v43 = brc_default_log(0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      -[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]();
    }
  }
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2012, v56);
  id v7 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2012);
  id v8 = brc_default_log(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134218498;
    uint64_t v58 = v56[0];
    __int16 v59 = 2112;
    v60 = mangledID;
    __int16 v61 = 2112;
    *(void *)long long v62 = v7;
    _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Update metadata with record data %@%@", buf, 0x20u);
  }

  uint64_t v9 = [(BRContainer *)self _containerRepositoryURL];
  v48 = [(id)v9 path];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v55 = 0;
  LOBYTE(v9) = [v10 createDirectoryAtPath:v48 withIntermediateDirectories:1 attributes:0 error:&v55];
  uint64_t v44 = v10;
  id v46 = (BRMangledID *)v55;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2020);
    uint64_t v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v58 = (uint64_t)v48;
      __int16 v59 = 2112;
      v60 = v46;
      __int16 v61 = 2112;
      *(void *)long long v62 = v11;
      _os_log_error_impl(&dword_19ED3F000, v12, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@'; %@%@",
        buf,
        0x20u);
    }
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v13, "objectForKeyedSubscript:", v17, v44);
        id v19 = [(BRContainer *)self _pathForIconName:v17];
        id v20 = v18;
        uint64_t v21 = (const std::__fs::filesystem::path *)[v20 fileSystemRepresentation];
        __int16 v22 = v19;
        uint64_t v23 = (const std::__fs::filesystem::path *)[(BRMangledID *)v22 fileSystemRepresentation];
        rename(v21, v23, v24);
        if (v25 < 0)
        {
          int v28 = *__error();
          uint64_t v29 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2028);
          int v30 = brc_default_log(0);
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138413058;
            uint64_t v58 = (uint64_t)v20;
            __int16 v59 = 2112;
            v60 = v22;
            __int16 v61 = 1024;
            *(_DWORD *)long long v62 = v28;
            *(_WORD *)&v62[4] = 2112;
            *(void *)&v62[6] = v29;
            _os_log_error_impl(&dword_19ED3F000, v30, (os_log_type_t)0x90u, "[ERROR] failed renaming from '%@' to '%@' %{errno}d%@", buf, 0x26u);
          }

          *__error() = v28;
        }
        else
        {
          __int16 v26 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2030);
          uint64_t v27 = brc_default_log(1);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v58 = (uint64_t)v20;
            __int16 v59 = 2112;
            v60 = v22;
            __int16 v61 = 2112;
            *(void *)long long v62 = v26;
            _os_log_debug_impl(&dword_19ED3F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed icon from '%@' to '%@'%@", buf, 0x20u);
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v14);
  }

  id v50 = 0;
  uint64_t v31 = [MEMORY[0x1E4F28F98] propertyListWithData:v47 options:2 format:0 error:&v50];
  id v32 = v50;

  if (!v31)
  {
    id v33 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2036);
    uint64_t v34 = brc_default_log(1);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = [v47 length];
      uint64_t v41 = self->_mangledID;
      *(_DWORD *)buf = 134218754;
      uint64_t v58 = v40;
      __int16 v59 = 2112;
      v60 = v41;
      __int16 v61 = 2112;
      *(void *)long long v62 = v32;
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v33;
      _os_log_debug_impl(&dword_19ED3F000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] failed parsing %lu-byte plist for container %@: %@%@", buf, 0x2Au);
    }
  }
  if (!v13)
  {
    [v31 removeObjectForKey:@"BRContainerIcons"];
    id v35 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2046);
    int v36 = brc_default_log(1);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]();
    }
  }
  BOOL v37 = -[BRContainer _updateMetadataOnDiskWithProperties:](self, "_updateMetadataOnDiskWithProperties:", v31, v44);

  __brc_leave_section((uint64_t)v56);
  return v37;
}

+ (void)_generateiOSIconsForMangledID:(id)a3 usingBundle:(__CFBundle *)a4 generatedIcons:(id)a5
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v94 = a3;
  id v98 = a5;
  memset(v132, 0, sizeof(v132));
  __brc_create_section(0, (uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2146, v132);
  id v6 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2146);
  id v7 = brc_default_log(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.6(v132);
  }

  v95 = CFBundleGetInfoDictionary(a4);
  id v8 = [v95 objectForKeyedSubscript:@"CFBundleIcons"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
  v97 = [v9 objectForKeyedSubscript:@"CFBundleIconFiles"];

  if (![v97 count])
  {
    uint64_t v10 = [v95 objectForKeyedSubscript:@"CFBundleIconFiles"];

    if (![v10 count])
    {
      id v89 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2162);
      v90 = brc_default_log(1);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
        +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]();
      }

      goto LABEL_98;
    }
    v97 = v10;
  }
  v96 = [MEMORY[0x1E4F28CB8] defaultManager];
  CFURLRef v11 = CFBundleCopyResourcesDirectoryURL(a4);
  v111 = [(__CFURL *)v11 path];

  id v131 = 0;
  uint64_t v12 = [v96 contentsOfDirectoryAtPath:v111 error:&v131];
  v101 = v131;
  long long v114 = v12;
  if (![v12 count])
  {
    long long v115 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2174);
    v87 = brc_default_log(1);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v134 = (uint64_t)v111;
      __int16 v135 = 2112;
      uint64_t v136 = (uint64_t)v101;
      __int16 v137 = 2112;
      os_log_t v138 = v115;
      _os_log_impl(&dword_19ED3F000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to list contents of directory at '%@'; %@%@",
        buf,
        0x20u);
    }
    goto LABEL_97;
  }
  long long v115 = [MEMORY[0x1E4F1CA80] set];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v13 = v97;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v127 objects:v147 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v128 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v127 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x19F3C4670]();
        id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH %@ AND self ENDSWITH[c] '.png'", v17];
        id v20 = [v114 filteredArrayUsingPredicate:v19];
        [v115 addObjectsFromArray:v20];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v127 objects:v147 count:16];
    }
    while (v14);
  }

  if (![v115 count])
  {
    uint64_t v88 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2191);
    brc_default_log(1);
    v93 = v108 = v88;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
      +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]();
    }
    goto LABEL_96;
  }
  v108 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSObject count](v115, "count"));
  long long v126 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v123 = 0u;
  uint64_t obj = v115;
  uint64_t v21 = [obj countByEnumeratingWithState:&v123 objects:v146 count:16];
  if (!v21) {
    goto LABEL_39;
  }
  id v109 = *(id *)v124;
  do
  {
    __int16 v22 = 0;
    context = (void *)v21;
    do
    {
      if (*(id *)v124 != v109) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void *)(*((void *)&v123 + 1) + 8 * (void)v22);
      __int16 v24 = (void *)MEMORY[0x19F3C4670]();
      int v25 = [v111 stringByAppendingPathComponent:v23];
      uint64_t v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v25];
      uint64_t v27 = (void *)v26;
      if (!v26)
      {
        uint64_t v31 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2203);
        uint64_t v34 = brc_default_log(0);
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v134 = v23;
          __int16 v135 = 2112;
          uint64_t v136 = (uint64_t)v31;
          int v36 = v34;
          BOOL v37 = "[ERROR] can't find URL for resource %@%@";
          goto LABEL_29;
        }
LABEL_36:

        goto LABEL_37;
      }
      int v28 = (const void *)softLinkCGImageSourceCreateWithURL(v26, 0);
      if (!v28)
      {
        uint64_t v31 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2210);
        uint64_t v34 = brc_default_log(0);
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v134 = (uint64_t)v27;
          __int16 v135 = 2112;
          uint64_t v136 = (uint64_t)v31;
          int v36 = v34;
          BOOL v37 = "[ERROR] can't create image source for %@%@";
LABEL_29:
          _os_log_error_impl(&dword_19ED3F000, v36, (os_log_type_t)0x90u, v37, buf, 0x16u);
        }
        goto LABEL_36;
      }
      uint64_t v29 = getkCGImageSourceShouldCache();
      v144[0] = v29;
      v145[0] = MEMORY[0x1E4F1CC28];
      int v30 = getkCGImageSourceSkipMetadata();
      v144[1] = v30;
      v145[1] = MEMORY[0x1E4F1CC38];
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:2];

      uint64_t ImageAtIndex = softLinkCGImageSourceCreateImageAtIndex((uint64_t)v28, 0, (uint64_t)v31);
      id v33 = (const void *)ImageAtIndex;
      if (ImageAtIndex)
      {
        uint64_t v34 = [NSNumber numberWithUnsignedLong:softLinkCGImageGetWidth(ImageAtIndex)];
        if ([v34 integerValue] <= 0)
        {
          uint64_t v40 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2227);
          uint64_t v41 = brc_default_log(0);
          if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v134 = (uint64_t)v27;
            __int16 v135 = 2112;
            uint64_t v136 = (uint64_t)v40;
            _os_log_error_impl(&dword_19ED3F000, v41, (os_log_type_t)0x90u, "[ERROR] can't use image with a width smaller than 1; %@%@",
              buf,
              0x16u);
          }

          CFRelease(v33);
          CFRelease(v28);
        }
        else
        {
          v142[0] = @"BRIconURL";
          v142[1] = @"BRIconWidth";
          v143[0] = v27;
          v143[1] = v34;
          id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:2];
          -[NSObject insertObject:atIndex:](v108, "insertObject:atIndex:", v35, -[NSObject indexOfObject:inSortedRange:options:usingComparator:](v108, "indexOfObject:inSortedRange:options:usingComparator:", v35, 0, [v108 count], 1024, &__block_literal_global_463));
          CFRelease(v33);
          CFRelease(v28);
        }
        goto LABEL_36;
      }
      int v38 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2219);
      long long v39 = brc_default_log(0);
      if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v134 = (uint64_t)v27;
        __int16 v135 = 2112;
        uint64_t v136 = (uint64_t)v38;
        _os_log_error_impl(&dword_19ED3F000, v39, (os_log_type_t)0x90u, "[ERROR] can't create image for %@%@", buf, 0x16u);
      }

      CFRelease(v28);
LABEL_37:

      __int16 v22 = (char *)v22 + 1;
    }
    while (context != v22);
    uint64_t v21 = [obj countByEnumeratingWithState:&v123 objects:v146 count:16];
  }
  while (v21);
LABEL_39:

  if ([v108 count])
  {
    long long v42 = [a1 _containerRepositoryURLForMangledID:v94];
    v93 = [v42 path];

    long long v122 = v101;
    char v43 = [v96 createDirectoryAtPath:v93 withIntermediateDirectories:1 attributes:0 error:&v122];
    uint64_t v44 = v122;

    if (v43)
    {
      long long v121 = v44;
      BOOL v100 = objc_msgSend(v96, "brc_createTemporarySubdirectoryOfItem:withTemplate:error:", v93, @".XXXXXX", &v121);
      id v45 = v121;

      if (v100)
      {
        BRContainerIconCKAssetKeys();
        os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
        v91 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self ENDSWITH %@", @"iOS"];
        -[NSObject filteredSetUsingPredicate:](log, "filteredSetUsingPredicate:");
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        CFBundleRef bundlea = (CFBundleRef)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v46 = [(__CFBundle *)bundlea countByEnumeratingWithState:&v117 objects:v141 count:16];
        if (!v46) {
          goto LABEL_77;
        }
        uint64_t v105 = *(void *)v118;
        while (1)
        {
          uint64_t v47 = 0;
          id obja = (id)v46;
          do
          {
            if (*(void *)v118 != v105) {
              objc_enumerationMutation(bundlea);
            }
            v48 = *(void **)(*((void *)&v117 + 1) + 8 * (void)v47);
            contexta = (void *)MEMORY[0x19F3C4670]();
            id v49 = BRContainerIconNameForCKAssetKey(v48);
            if (v49)
            {
              id v50 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2282);
              long long v51 = brc_default_log(1);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v134 = (uint64_t)v49;
                __int16 v135 = 2112;
                uint64_t v136 = (uint64_t)v50;
                _os_log_debug_impl(&dword_19ED3F000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] generating %@%@", buf, 0x16u);
              }

              long long v52 = [@"AppIconMask" stringByAppendingString:v49];
              long long v53 = [MEMORY[0x1E4F28B50] mainBundle];
              long long v54 = [v53 pathForResource:v52 ofType:@"png"];

              id v110 = [(objc_class *)getUIImageClass() imageWithContentsOfFile:v54];
              if (v110)
              {
                double v55 = BRContainerIconSizeForName(v49);
                double v57 = v56;
                uint64_t v58 = [NSNumber numberWithInteger:(uint64_t)v55];
                uint64_t v59 = -[NSObject indexOfObject:inSortedRange:options:usingComparator:](v108, "indexOfObject:inSortedRange:options:usingComparator:", v58, 0, [v108 count], 1280, &__block_literal_global_476);

                v60 = [v108 objectAtIndexedSubscript:v59 - (v59 == [v108 count])];
                Class UIImageClass = getUIImageClass();
                long long v62 = [v60 objectForKeyedSubscript:@"BRIconURL"];
                long long v63 = [v62 path];
                uint64_t v64 = [(objc_class *)UIImageClass imageWithContentsOfFile:v63];

                if (!v64)
                {
                  long long v69 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2345);
                  id v70 = brc_default_log(0);
                  if (os_log_type_enabled(v70, (os_log_type_t)0x90u))
                  {
                    int v75 = [v60 objectForKeyedSubscript:@"BRIconURL"];
                    *(_DWORD *)buf = 138412546;
                    uint64_t v134 = (uint64_t)v75;
                    __int16 v135 = 2112;
                    uint64_t v136 = (uint64_t)v69;
                    _os_log_error_impl(&dword_19ED3F000, v70, (os_log_type_t)0x90u, "[ERROR] unable to create an image with the contents of %@.%@", buf, 0x16u);
                  }
                  goto LABEL_73;
                }
                uint64_t v65 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2350);
                long long v66 = brc_default_log(1);
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  [v64 size];
                  double v79 = v78;
                  [v64 scale];
                  double v81 = v80;
                  [v64 size];
                  double v83 = v82;
                  [v64 scale];
                  *(_DWORD *)buf = 134218498;
                  uint64_t v134 = (uint64_t)(v79 * v81);
                  __int16 v135 = 2048;
                  uint64_t v136 = (uint64_t)(v83 * v84);
                  __int16 v137 = 2112;
                  os_log_t v138 = v65;
                  _os_log_debug_impl(&dword_19ED3F000, v66, OS_LOG_TYPE_DEBUG, "[DEBUG] best candidate has a size of {%ld, %ld}%@", buf, 0x20u);
                }

                softLinkUIGraphicsBeginImageContextWithOptions(0, v55, v57, 1.0);
                uint64_t CurrentContext = softLinkUIGraphicsGetCurrentContext();
                uint64_t v68 = [v110 CGImage];
                softLinkCGContextClipToMask(CurrentContext, v68, 0.0, 0.0, v55, v57);
                objc_msgSend(v64, "drawInRect:", 0.0, 0.0, v55, v57);
                long long v69 = softLinkUIGraphicsGetImageFromCurrentImageContext();

                softLinkUIGraphicsEndImageContext();
                id v70 = softLinkUIImagePNGRepresentation(v69);
                if (v70)
                {
                  uint64_t v71 = [v49 stringByAppendingPathExtension:@"png"];
                  id v72 = [v100 stringByAppendingPathComponent:v71];

                  long long v116 = v45;
                  LOBYTE(v71) = [v70 writeToFile:v72 options:1 error:&v116];
                  uint64_t v102 = v116;

                  if (v71)
                  {
                    __int16 v73 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2366);
                    v74 = brc_default_log(1);
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412802;
                      uint64_t v134 = (uint64_t)v49;
                      __int16 v135 = 2112;
                      uint64_t v136 = (uint64_t)v72;
                      __int16 v137 = 2112;
                      os_log_t v138 = v73;
                      _os_log_debug_impl(&dword_19ED3F000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] wrote icon data for '%@' to '%@'%@", buf, 0x20u);
                    }

                    [v98 setObject:v72 forKeyedSubscript:v49];
LABEL_72:

                    id v45 = v102;
LABEL_73:

LABEL_74:
                    goto LABEL_75;
                  }
                  uint64_t v76 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2364);
                  v77 = brc_default_log(0);
                  if (os_log_type_enabled(v77, (os_log_type_t)0x90u))
                  {
                    *(_DWORD *)buf = 138413058;
                    uint64_t v134 = (uint64_t)v49;
                    __int16 v135 = 2112;
                    uint64_t v136 = (uint64_t)v72;
                    __int16 v137 = 2112;
                    os_log_t v138 = v102;
                    __int16 v139 = 2112;
                    v140 = v76;
                    _os_log_error_impl(&dword_19ED3F000, v77, (os_log_type_t)0x90u, "[ERROR] failed writing icon data for '%@' to '%@', error: '%@'%@", buf, 0x2Au);
                  }
                }
                else
                {
                  id v72 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2370);
                  uint64_t v76 = brc_default_log(1);
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v134 = (uint64_t)v69;
                    __int16 v135 = 2112;
                    uint64_t v136 = (uint64_t)v72;
                    _os_log_impl(&dword_19ED3F000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to compute the PNG representation of %@%@", buf, 0x16u);
                  }
                  uint64_t v102 = v45;
                }

                goto LABEL_72;
              }
              v60 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2288);
              long long v69 = brc_default_log(1);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v134 = (uint64_t)v52;
                __int16 v135 = 2112;
                uint64_t v136 = (uint64_t)v60;
                _os_log_debug_impl(&dword_19ED3F000, v69, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to find icon mask for %@%@", buf, 0x16u);
              }
              goto LABEL_74;
            }
            long long v52 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2279);
            long long v54 = brc_default_log(1);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v134 = (uint64_t)v48;
              __int16 v135 = 2112;
              uint64_t v136 = (uint64_t)v52;
              _os_log_debug_impl(&dword_19ED3F000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to retrieve icon name from asset key '%@'%@", buf, 0x16u);
            }
LABEL_75:

            uint64_t v47 = (char *)v47 + 1;
          }
          while (obja != v47);
          uint64_t v46 = [(__CFBundle *)bundlea countByEnumeratingWithState:&v117 objects:v141 count:16];
          if (!v46)
          {
LABEL_77:

            id v85 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2373);
            v86 = brc_default_log(1);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
              +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.4((uint64_t)v98);
            }

            goto LABEL_93;
          }
        }
      }
      brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2268);
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      v91 = brc_default_log(0);
      if (os_log_type_enabled(v91, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v134 = (uint64_t)v93;
        __int16 v135 = 2112;
        uint64_t v136 = (uint64_t)v45;
        __int16 v137 = 2112;
        os_log_t v138 = log;
        _os_log_error_impl(&dword_19ED3F000, v91, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@.XXXXXX'; %@%@",
          buf,
          0x20u);
      }
LABEL_93:

      uint64_t v44 = v45;
    }
    else
    {
      BOOL v100 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2262);
      brc_default_log(0);
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v134 = (uint64_t)v93;
        __int16 v135 = 2112;
        uint64_t v136 = (uint64_t)v44;
        __int16 v137 = 2112;
        os_log_t v138 = v100;
        _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@'; %@%@",
          buf,
          0x20u);
      }
    }

    v101 = v44;
  }
  else
  {
    v93 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2255);
    BOOL v100 = brc_default_log(0);
    if (os_log_type_enabled(v100, (os_log_type_t)0x90u)) {
      +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]((uint64_t)a4);
    }
  }

LABEL_96:
  v87 = v108;
LABEL_97:

LABEL_98:
  __brc_leave_section((uint64_t)v132);
}

uint64_t __93__BRContainer_BRInternalAdditions___generateiOSIconsForMangledID_usingBundle_generatedIcons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"BRIconWidth"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 objectForKeyedSubscript:@"BRIconWidth"];

  uint64_t v8 = [v7 integerValue];
  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 != v8;
  }
}

uint64_t __93__BRContainer_BRInternalAdditions___generateiOSIconsForMangledID_usingBundle_generatedIcons___block_invoke_473(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [v4 integerValue];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"BRIconWidth"];

    uint64_t v9 = [v8 integerValue];
  }
  else
  {
    uint64_t v10 = [v4 objectForKeyedSubscript:@"BRIconWidth"];
    uint64_t v7 = [v10 integerValue];

    uint64_t v9 = [v5 integerValue];
  }
  if (v7 < v9) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v7 != v9;
  }

  return v11;
}

+ (id)propertiesForMangledID:(id)a3 usingBundle:(__CFBundle *)a4 minimumBundleVersion:(id)a5 bundleIcons:(id *)a6
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a3;
  id v11 = a5;
  if (a4)
  {
    uint64_t v12 = CFBundleGetInfoDictionary(a4);
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
    v90 = v12;
    uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
    uint64_t v15 = (void *)v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      uint64_t v17 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2393);
      uint64_t v18 = brc_default_log(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v103 = v15;
        __int16 v104 = 2112;
        uint64_t v105 = v13;
        __int16 v106 = 2112;
        id v107 = v17;
        _os_log_impl(&dword_19ED3F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid version %@ or identifier %@%@", buf, 0x20u);
      }
      id v19 = 0;
LABEL_81:

      goto LABEL_82;
    }
    id v20 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2400);
    uint64_t v21 = brc_default_log(1);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v103 = v15;
      __int16 v104 = 2112;
      uint64_t v105 = v13;
      __int16 v106 = 2112;
      id v107 = v11;
      __int16 v108 = 2112;
      id v109 = v20;
      _os_log_debug_impl(&dword_19ED3F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle %@ has version %@, minimum version is %@%@", buf, 0x2Au);
    }

    if (v11 && [v11 compare:v13 options:64] != -1)
    {
      id v19 = 0;
LABEL_82:

      goto LABEL_83;
    }
    uint64_t v23 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2406);
    __int16 v24 = brc_default_log(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v103 = v15;
      __int16 v104 = 2112;
      uint64_t v105 = v10;
      __int16 v106 = 2112;
      id v107 = v23;
      _os_log_debug_impl(&dword_19ED3F000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] metadata for %@ client of %@ is out of date%@", buf, 0x20u);
    }

    id v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:9];
    [v19 setObject:v13 forKeyedSubscript:@"BRContainerVersionNumber"];
    [v19 setObject:BRContainerFormatVersionNumberValue forKeyedSubscript:@"BRContainerFormatVersionNumber"];
    uint64_t v25 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F1CC50]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v19 setObject:v25 forKeyedSubscript:@"BRContainerDocumentTypes"];
    }
    uint64_t v26 = [v90 objectForKeyedSubscript:@"UTExportedTypeDeclarations"];
    objc_opt_class();
    v86 = v26;
    if (objc_opt_isKindOfClass()) {
      [v19 setObject:v26 forKeyedSubscript:@"BRContainerExportedTypes"];
    }
    uint64_t v27 = [v90 objectForKeyedSubscript:@"UTImportedTypeDeclarations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v19 setObject:v27 forKeyedSubscript:@"BRContainerImportedTypes"];
    }
    uint64_t v88 = (void *)v27;
    int v28 = a6;
    uint64_t v29 = [v90 objectForKeyedSubscript:@"NSUbiquitousContainers"];
    double v82 = (void *)v25;
    if (v29)
    {
      int v30 = (void *)v29;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_30:
        uint64_t v31 = [v10 appLibraryOrZoneName];
        double v81 = v30;
        uint64_t v32 = [v30 objectForKeyedSubscript:v31];

        CFBundleRef bundle = a4;
        id v33 = (void *)v32;
        id v80 = a1;
        if (v32)
        {
          objc_opt_class();
          uint64_t v34 = v28;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v33 = 0;
          }
        }
        else
        {
          uint64_t v34 = v28;
        }
        id v35 = v88;
        int v36 = [v33 objectForKeyedSubscript:@"NSUbiquitousContainerName"];
        objc_opt_class();
        id v89 = v36;
        id v83 = v11;
        double v84 = v33;
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 length])
        {
          BOOL v37 = @"NSUbiquitousContainerName";
        }
        else
        {
          uint64_t v38 = *MEMORY[0x1E4F1D008];
          v101[0] = *MEMORY[0x1E4F1CC48];
          v101[1] = v38;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v40 = [v39 countByEnumeratingWithState:&v95 objects:v100 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            id v72 = v19;
            v74 = v34;
            uint64_t v76 = v15;
            double v78 = v13;
            uint64_t v42 = *(void *)v96;
            while (2)
            {
              uint64_t v43 = 0;
              uint64_t v44 = v89;
              do
              {
                if (*(void *)v96 != v42) {
                  objc_enumerationMutation(v39);
                }
                id v45 = *(void **)(*((void *)&v95 + 1) + 8 * v43);
                uint64_t v46 = [v90 objectForKeyedSubscript:v45];

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && [v46 length])
                {
                  id v89 = v46;
                  BOOL v37 = v45;
                  goto LABEL_48;
                }
                ++v43;
                uint64_t v44 = v46;
              }
              while (v41 != v43);
              id v89 = v46;
              uint64_t v41 = [v39 countByEnumeratingWithState:&v95 objects:v100 count:16];
              if (v41) {
                continue;
              }
              break;
            }
            BOOL v37 = 0;
LABEL_48:
            uint64_t v15 = v76;
            id v13 = v78;
            id v19 = v72;
            uint64_t v34 = v74;
          }
          else
          {
            BOOL v37 = 0;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v89 length])
          {
            uint64_t v47 = [a1 _sanitizedContainerFallbackNameForMangledID:v10];

            id v89 = (void *)v47;
          }

          id v33 = v84;
          id v35 = v88;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v89 length])
        {
          [v19 setObject:v89 forKeyedSubscript:@"BRContainerName"];
        }
        else
        {

          BOOL v37 = 0;
        }
        CFBundleRef v48 = bundle;
        CFArrayRef v87 = CFBundleCopyBundleLocalizations(bundle);
        if (v37 && [(__CFArray *)v87 count])
        {
          __int16 v73 = v19;
          int v75 = v34;
          v77 = v15;
          double v79 = v13;
          uint64_t v71 = v10;
          id v49 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[__CFArray count](v87, "count"));
          context = (void *)MEMORY[0x19F3C4670]();
          CFURLRef v69 = CFBundleCopyResourceURL(bundle, @"InfoPlist", @"loctable", 0);
          id v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v69];
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          CFArrayRef v51 = v87;
          uint64_t v52 = [(__CFArray *)v51 countByEnumeratingWithState:&v91 objects:v99 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v92;
            do
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v92 != v54) {
                  objc_enumerationMutation(v51);
                }
                double v56 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                double v57 = [v50 objectForKeyedSubscript:v56];
                uint64_t v58 = [v57 objectForKeyedSubscript:v37];

                if ([v58 length])
                {
                  uint64_t v59 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v56];
                  if (![v59 length])
                  {
                    id v60 = v56;

                    uint64_t v59 = v60;
                  }
                  [v49 setObject:v58 forKeyedSubscript:v59];
                }
              }
              uint64_t v53 = [(__CFArray *)v51 countByEnumeratingWithState:&v91 objects:v99 count:16];
            }
            while (v53);
          }

          id v19 = v73;
          if ([v49 count]) {
            [v73 setObject:v49 forKeyedSubscript:@"BRContainerLocalizedNames"];
          }

          uint64_t v10 = v71;
          uint64_t v15 = v77;
          id v13 = v79;
          uint64_t v34 = v75;
          id v33 = v84;
          CFBundleRef v48 = bundle;
          id v35 = v88;
        }
        __int16 v61 = [v33 objectForKeyedSubscript:@"NSUbiquitousContainerIsDocumentScopePublic"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v19 setObject:v61 forKeyedSubscript:@"BRContainerIsDocumentScopePublic"];
          int v62 = [v61 BOOLValue];
          if (v34)
          {
            if (v62)
            {
              long long v63 = [MEMORY[0x1E4F1CA60] dictionary];
              uint64_t v64 = v19;
              uint64_t v65 = MEMORY[0x19F3C4670]();
              [v80 _generateiOSIconsForMangledID:v10 usingBundle:v48 generatedIcons:v63];
              long long v66 = (void *)v65;
              id v19 = v64;
              id v67 = v63;
              *uint64_t v34 = v67;
              if ([v67 count]) {
                [v64 setObject:BRContainerIconGeneratorVersionNumberValue forKeyedSubscript:@"BRContainerIconGeneratorVersionNumber"];
              }

              id v35 = v88;
              id v33 = v84;
            }
          }
        }

        uint64_t v17 = v82;
        id v11 = v83;
        uint64_t v18 = v86;
        goto LABEL_81;
      }
    }
    int v30 = 0;
    goto LABEL_30;
  }
  v90 = brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2383);
  id v13 = brc_default_log(0);
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
    +[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]();
  }
  id v19 = 0;
LABEL_83:

  return v19;
}

- (BOOL)containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:(id)a3 excludedButPreservedExtensions:(id)a4 andStampUploadedAppWithXattr:(BOOL)a5
{
  BOOL v41 = a5;
  v60[1] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v42 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [(BRContainer *)self documentsURL];
  uint64_t v43 = *MEMORY[0x1E4F1C690];
  v60[0] = *MEMORY[0x1E4F1C690];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  uint64_t v10 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:v9 options:2 errorHandler:0];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    uint64_t v39 = *MEMORY[0x1E4F1C790];
    uint64_t v15 = v40;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v47 = 0;
        id v48 = 0;
        int v18 = [v17 getResourceValue:&v48 forKey:v43 error:&v47];
        id v19 = v48;
        id v20 = v47;
        if (v18 && [v19 BOOLValue])
        {
          if (v41)
          {
            uint64_t v21 = [v17 lastPathComponent];
            __int16 v22 = objc_msgSend(v21, "br_pathExtension");
            int v23 = [v22 isEqualToString:@"app"];

            if (v23)
            {
              id v45 = 0;
              id v46 = 0;
              int v24 = [v17 getResourceValue:&v46 forKey:v39 error:&v45];
              id v25 = v46;
              id v26 = v45;

              if (v24)
              {
                if ([v25 BOOLValue])
                {
                  int value = 7562617;
                  id v27 = [v17 path];
                  int v28 = setxattr((const char *)[v27 fileSystemRepresentation], "com.apple.clouddocs.app-uploaded", &value, 4uLL, 0, 0);

                  if (v28 < 0)
                  {
                    int v29 = *__error();
                    uint64_t v38 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:]", 2562);
                    int v30 = brc_default_log(0);
                    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
                    {
                      id v33 = [v17 path];
                      *(_DWORD *)buf = 138412802;
                      uint64_t v54 = v33;
                      __int16 v55 = 1024;
                      int v56 = v29;
                      __int16 v57 = 2112;
                      uint64_t v58 = v38;
                      _os_log_error_impl(&dword_19ED3F000, v30, (os_log_type_t)0x90u, "[ERROR] can't set uploaded xattr on %@ %{errno}d%@", buf, 0x1Cu);
                    }
                    *__error() = v29;
                  }
                }
              }

              id v20 = v26;
            }
            uint64_t v15 = v40;
          }
        }
        else
        {
          uint64_t v31 = [v17 path];
          int v32 = objc_msgSend(v31, "br_isExcludedButPreservedAtLogOutWithFilenames:extensions:", v15, v42);

          if (v32)
          {
            id v35 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:]", 2573);
            int v36 = brc_default_log(1);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              -[BRContainer(BRInternalAdditions) containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:]((uint64_t)v17);
            }

            BOOL v34 = 1;
            goto LABEL_27;
          }
          [v11 skipDescendants];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    BOOL v34 = 0;
  }
  else
  {
    BOOL v34 = 0;
    uint64_t v15 = v40;
  }
LABEL_27:

  return v34;
}

- (BOOL)registerCurrentProcessAsPriorityHintWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRContainer(BRPriorityHinting) registerCurrentProcessAsPriorityHintWithError:]", 2953, v20);
  id v5 = brc_bread_crumbs((uint64_t)"-[BRContainer(BRPriorityHinting) registerCurrentProcessAsPriorityHintWithError:]", 2953);
  id v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v20[0];
    uint64_t v14 = [(BRContainer *)self identifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    int v24 = v14;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_debug_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx registering current process as a priority hint for %@%@", buf, 0x20u);
  }
  uint64_t v7 = +[BRDaemonConnection defaultConnection];
  uint64_t v8 = (void *)[v7 newSyncProxy];

  uint64_t v9 = [(BRContainer *)self identifier];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __80__BRContainer_BRPriorityHinting__registerCurrentProcessAsPriorityHintWithError___block_invoke;
  int v18 = &unk_1E59AF4E8;
  id v10 = v8;
  id v19 = v10;
  [v10 getContainerURLForID:v9 reply:&v15];

  id v11 = objc_msgSend(v10, "error", v15, v16, v17, v18);

  if (a3 && v11)
  {
    *a3 = [v10 error];
  }

  __brc_leave_section((uint64_t)v20);
  return v11 == 0;
}

uint64_t __80__BRContainer_BRPriorityHinting__registerCurrentProcessAsPriorityHintWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a5];
}

+ (void)unregisterCurrentProcessAsPriorityHint
{
  id v2 = +[BRDaemonConnection defaultConnection];
  [v2 invalidate];
}

- (void)initWithMangledID:(uint64_t)a1 dataRepresentation:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] creating container metadata for %@%@", (void)v3, DWORD2(v3));
}

- (void)initWithMangledID:dataRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: mangledID%@", v2, v3, v4, v5, v6);
}

void __39__BRContainer_accessPropertiesInBlock___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v1, v2, "[ERROR] Can't read data: %@%@", (void)v3, DWORD2(v3));
}

- (void)_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] not a synced image size%@", v2, v3, v4, v5, v6);
}

- (void)_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] no image found for the given size%@", v2, v3, v4, v5, v6);
}

- (void)_imageDataForSize:(unsigned char *)a1 scale:isiOSIcon:shouldTransformToAppIcon:.cold.3(unsigned char *a1)
{
  uint64_t v1 = @"should be transformed to app icon";
  if (!*a1) {
    uint64_t v1 = @"is an app icon";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v2, v3, "[DEBUG] image returned %@%@", (void)v4, DWORD2(v4));
}

- (void)_imageDataForSize:(unsigned char *)a1 scale:isiOSIcon:shouldTransformToAppIcon:.cold.4(unsigned char *a1)
{
  uint64_t v1 = @"is";
  if (!*a1) {
    uint64_t v1 = @"isn't";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v2, v3, "[DEBUG] image returned %@ an iOS icon%@", (void)v4, DWORD2(v4));
}

void __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v1, v2, "[ERROR] error forcing refresh on all containers: %@%@", (void)v3, DWORD2(v3));
}

void __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v4 = [*a1 documentsURL];
  uint64_t v5 = [v4 path];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_19ED3F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] this container has been moved to CloudDocs, unlinking the folder at %@%@", v6, 0x16u);
}

void __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v1, v2, "[CRIT] asking to delete all contents of %@%@", (void)v3, DWORD2(v3));
}

void __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(a1 + 32) + 8);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] created plist for container %@%@", (void)v3, DWORD2(v3));
}

@end