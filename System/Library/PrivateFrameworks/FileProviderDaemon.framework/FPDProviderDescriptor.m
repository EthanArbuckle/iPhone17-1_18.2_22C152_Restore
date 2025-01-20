@interface FPDProviderDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)personaFromExtensionRecord:(id)a3 managedPersona:(BOOL *)a4;
- (BOOL)allowsContextualMenuDownloadEntry;
- (BOOL)allowsExternalVolumes;
- (BOOL)allowsSystemDeleteAlerts;
- (BOOL)allowsUserControlledEviction;
- (BOOL)appliesChangesAtomically;
- (BOOL)canToggleDomainVisibility;
- (BOOL)defaultDomainVisible;
- (BOOL)disallowedByMDM;
- (BOOL)enabledByDefault;
- (BOOL)hasExplicitExtensionStorageURLs;
- (BOOL)isAvailableSystemWide;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonaLegit;
- (BOOL)managedPersona;
- (BOOL)owningApplicationIsHidden;
- (BOOL)owningApplicationIsManaged;
- (BOOL)readonly;
- (BOOL)shouldHideExtensionName;
- (BOOL)supportsEnumeration;
- (BOOL)supportsPickingFolders;
- (BOOL)supportsUnzippedPackages;
- (BOOL)usesUniqueItemIdentifiersAcrossDevices;
- (BOOL)wantsBundleBitOnlyPackageDetection;
- (BOOL)wantsFlattenedPackages;
- (FPDProviderDescriptor)initWithCoder:(id)a3;
- (FPDProviderDescriptor)initWithExtension:(id)a3;
- (FPDProviderDescriptor)initWithExtensionRecord:(id)a3;
- (NSArray)extensionStorageURLs;
- (NSArray)requestedExtendedAttributes;
- (NSArray)supportedFileTypes;
- (NSArray)supportedSearchFilters;
- (NSNumber)downloadPipelineDepth;
- (NSNumber)metadataOnlyUploadPipelineDepth;
- (NSNumber)uploadPipelineDepth;
- (NSString)bundleIdentifierForPushes;
- (NSString)bundleVersion;
- (NSString)documentGroupName;
- (NSString)extensionPointVersion;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)personaIdentifier;
- (NSString)purposeIdentifier;
- (NSString)topLevelBundleIdentifier;
- (NSURL)extensionBundleURL;
- (NSURL)topLevelBundleURL;
- (NSUUID)extensionUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3;
- (void)setAllowsExternalVolumes:(BOOL)a3;
- (void)setAllowsSystemDeleteAlerts:(BOOL)a3;
- (void)setAllowsUserControlledEviction:(BOOL)a3;
- (void)setAppliesChangesAtomically:(BOOL)a3;
- (void)setBundleIdentifierForPushes:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCanToggleDomainVisibility:(BOOL)a3;
- (void)setDefaultDomainVisible:(BOOL)a3;
- (void)setDisallowedByMDM:(BOOL)a3;
- (void)setDocumentGroupName:(id)a3;
- (void)setDownloadPipelineDepth:(id)a3;
- (void)setEnabledByDefault:(BOOL)a3;
- (void)setExtensionBundleURL:(id)a3;
- (void)setExtensionPointVersion:(id)a3;
- (void)setExtensionStorageURLs:(id)a3;
- (void)setExtensionUUID:(id)a3;
- (void)setHasExplicitExtensionStorageURLs:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAvailableSystemWide:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
- (void)setManagedPersona:(BOOL)a3;
- (void)setMetadataOnlyUploadPipelineDepth:(id)a3;
- (void)setOwningApplicationIsHidden:(BOOL)a3;
- (void)setOwningApplicationIsManaged:(BOOL)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setPurposeIdentifier:(id)a3;
- (void)setReadonly:(BOOL)a3;
- (void)setRequestedExtendedAttributes:(id)a3;
- (void)setShouldHideExtensionName:(BOOL)a3;
- (void)setSupportedFileTypes:(id)a3;
- (void)setSupportedSearchFilters:(id)a3;
- (void)setSupportsEnumeration:(BOOL)a3;
- (void)setSupportsPickingFolders:(BOOL)a3;
- (void)setSupportsUnzippedPackages:(BOOL)a3;
- (void)setTopLevelBundleIdentifier:(id)a3;
- (void)setTopLevelBundleURL:(id)a3;
- (void)setUploadPipelineDepth:(id)a3;
- (void)setUsesUniqueItemIdentifiersAcrossDevices:(BOOL)a3;
- (void)setWantsBundleBitOnlyPackageDetection:(BOOL)a3;
- (void)setWantsFlattenedPackages:(BOOL)a3;
@end

@implementation FPDProviderDescriptor

- (BOOL)defaultDomainVisible
{
  return self->_defaultDomainVisible;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)topLevelBundleIdentifier
{
  return self->_topLevelBundleIdentifier;
}

- (BOOL)allowsUserControlledEviction
{
  return self->_allowsUserControlledEviction;
}

- (BOOL)allowsContextualMenuDownloadEntry
{
  return self->_allowsContextualMenuDownloadEntry;
}

- (BOOL)disallowedByMDM
{
  return self->_disallowedByMDM;
}

- (BOOL)usesUniqueItemIdentifiersAcrossDevices
{
  return self->_usesUniqueItemIdentifiersAcrossDevices;
}

- (NSURL)topLevelBundleURL
{
  return self->_topLevelBundleURL;
}

- (BOOL)supportsEnumeration
{
  return self->_supportsEnumeration;
}

- (NSArray)supportedSearchFilters
{
  return self->_supportedSearchFilters;
}

- (NSArray)supportedFileTypes
{
  return self->_supportedFileTypes;
}

- (BOOL)shouldHideExtensionName
{
  return self->_shouldHideExtensionName;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (BOOL)owningApplicationIsHidden
{
  return self->_owningApplicationIsHidden;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isAvailableSystemWide
{
  return self->_isAvailableSystemWide;
}

- (NSString)extensionPointVersion
{
  return self->_extensionPointVersion;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (BOOL)canToggleDomainVisibility
{
  return self->_canToggleDomainVisibility;
}

- (BOOL)appliesChangesAtomically
{
  return self->_appliesChangesAtomically;
}

- (BOOL)allowsSystemDeleteAlerts
{
  return self->_allowsSystemDeleteAlerts;
}

- (BOOL)supportsPickingFolders
{
  return self->_supportsPickingFolders;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)owningApplicationIsManaged
{
  return self->_owningApplicationIsManaged;
}

- (BOOL)enabledByDefault
{
  return self->_enabledByDefault;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPDProviderDescriptor)initWithCoder:(id)a3
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)FPDProviderDescriptor;
  v5 = [(FPDProviderDescriptor *)&v68 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_topLevelBundleIdentifier"];
    topLevelBundleIdentifier = v5->_topLevelBundleIdentifier;
    v5->_topLevelBundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_topLevelBundleURL"];
    topLevelBundleURL = v5->_topLevelBundleURL;
    v5->_topLevelBundleURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionPointVersion"];
    extensionPointVersion = v5->_extensionPointVersion;
    v5->_extensionPointVersion = (NSString *)v16;

    v5->_readonly = [v4 decodeBoolForKey:@"_readonly"];
    v5->_enabledByDefault = [v4 decodeBoolForKey:@"_enabledByDefault"];
    v5->_supportsEnumeration = [v4 decodeBoolForKey:@"_supportsEnumeration"];
    v5->_defaultDomainVisible = [v4 decodeBoolForKey:@"_defaultDomainVisible"];
    v5->_shouldHideExtensionName = [v4 decodeBoolForKey:@"_shouldHideExtensionName"];
    v5->_canToggleDomainVisibility = [v4 decodeBoolForKey:@"_canToggleDomainVisibility"];
    v5->_isAvailableSystemWide = [v4 decodeBoolForKey:@"_isAvailableSystemWide"];
    v5->_supportsUnzippedPackages = [v4 decodeBoolForKey:@"_supportsUnzippedPackages"];
    v5->_supportsPickingFolders = [v4 decodeBoolForKey:@"_supportsPickingFolders"];
    v5->_wantsFlattenedPackages = [v4 decodeBoolForKey:@"_wantsFlattenedPackages"];
    v5->_allowsUserControlledEviction = [v4 decodeBoolForKey:@"_allowsUserControlledEviction"];
    v5->_allowsSystemDeleteAlerts = [v4 decodeBoolForKey:@"_allowsSystemDeleteAlerts"];
    v5->_allowsContextualMenuDownloadEntry = [v4 decodeBoolForKey:@"_allowsContextualMenuDownloadEntry"];
    v5->_appliesChangesAtomically = [v4 decodeBoolForKey:@"_appliesChangesAtomically"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_downloadPipelineDepth"];
    downloadPipelineDepth = v5->_downloadPipelineDepth;
    v5->_downloadPipelineDepth = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uploadPipelineDepth"];
    uploadPipelineDepth = v5->_uploadPipelineDepth;
    v5->_uploadPipelineDepth = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_metadataOnlyUploadPipelineDepth"];
    metadataOnlyUploadPipelineDepth = v5->_metadataOnlyUploadPipelineDepth;
    v5->_metadataOnlyUploadPipelineDepth = (NSNumber *)v22;

    v5->_owningApplicationIsManaged = [v4 decodeBoolForKey:@"_owningApplicationIsManaged"];
    v5->_owningApplicationIsHidden = [v4 decodeBoolForKey:@"_owningApplicationIsHidden"];
    v5->_usesUniqueItemIdentifiersAcrossDevices = [v4 decodeBoolForKey:@"_usesUniqueItemIdentifiersAcrossDevices"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionBundleURL"];
    extensionBundleURL = v5->_extensionBundleURL;
    v5->_extensionBundleURL = (NSURL *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_purposeIdentifier"];
    purposeIdentifier = v5->_purposeIdentifier;
    v5->_purposeIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifierForPushes"];
    bundleIdentifierForPushes = v5->_bundleIdentifierForPushes;
    v5->_bundleIdentifierForPushes = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    v32 = [v30 setWithArray:v31];
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"_supportedFileTypes"];
    supportedFileTypes = v5->_supportedFileTypes;
    v5->_supportedFileTypes = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
    v37 = [v35 setWithArray:v36];
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"_supportedSearchFilters"];
    supportedSearchFilters = v5->_supportedSearchFilters;
    v5->_supportedSearchFilters = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    v42 = [v40 setWithArray:v41];
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"_requestedExtendedAttributes"];
    requestedExtendedAttributes = v5->_requestedExtendedAttributes;
    v5->_requestedExtendedAttributes = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    v69[0] = objc_opt_class();
    v69[1] = objc_opt_class();
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    v47 = [v45 setWithArray:v46];
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"_extensionStorageURLs"];
    extensionStorageURLs = v5->_extensionStorageURLs;
    v5->_extensionStorageURLs = (NSArray *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionUUID"];
    extensionUUID = v5->_extensionUUID;
    v5->_extensionUUID = (NSUUID *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_documentGroupName"];
    documentGroupName = v5->_documentGroupName;
    v5->_documentGroupName = (NSString *)v52;

    v5->_managedPersona = [v4 decodeBoolForKey:@"_managedPersona"];
    if ([(NSString *)v5->_identifier isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"]|| [(NSString *)v5->_identifier isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"]|| v5->_managedPersona)
    {
      v54 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
      uint64_t v55 = [v54 userPersonaUniqueString];
      personaIdentifier = v5->_personaIdentifier;
      v5->_personaIdentifier = (NSString *)v55;

      v5->_managedPersona = 1;
    }
    else
    {
      v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personaIdentifier"];
      if (v59)
      {
        v60 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaUniqueString:v59];
        v61 = v60;
        if (v60 && [v60 isEnterprisePersona])
        {
          v62 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
          uint64_t v63 = [v62 userPersonaUniqueString];
          v64 = v5->_personaIdentifier;
          v5->_personaIdentifier = (NSString *)v63;

          v5->_managedPersona = 1;
        }
      }
      if (!v5->_managedPersona)
      {
        v65 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
        uint64_t v66 = [v65 userPersonaUniqueString];
        v67 = v5->_personaIdentifier;
        v5->_personaIdentifier = (NSString *)v66;
      }
    }
    if (![(FPDProviderDescriptor *)v5 isPersonaLegit])
    {
      v57 = 0;
      goto LABEL_10;
    }
    v5->_wantsBundleBitOnlyPackageDetection = [v4 decodeBoolForKey:@"_wantsBundleBitOnlyPackageDetection"];
    v5->_allowsExternalVolumes = [v4 decodeBoolForKey:@"_allowsExternalVolumes"];
  }
  v57 = v5;
LABEL_10:

  return v57;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_localizedName forKey:@"_localizedName"];
  [v5 encodeObject:self->_topLevelBundleIdentifier forKey:@"_topLevelBundleIdentifier"];
  [v5 encodeObject:self->_topLevelBundleURL forKey:@"_topLevelBundleURL"];
  [v5 encodeObject:self->_bundleVersion forKey:@"_bundleVersion"];
  [v5 encodeObject:self->_extensionPointVersion forKey:@"_extensionPointVersion"];
  [v5 encodeBool:self->_readonly forKey:@"_readonly"];
  [v5 encodeBool:self->_enabledByDefault forKey:@"_enabledByDefault"];
  [v5 encodeBool:self->_supportsEnumeration forKey:@"_supportsEnumeration"];
  [v5 encodeBool:self->_defaultDomainVisible forKey:@"_defaultDomainVisible"];
  [v5 encodeBool:self->_shouldHideExtensionName forKey:@"_shouldHideExtensionName"];
  [v5 encodeBool:self->_canToggleDomainVisibility forKey:@"_canToggleDomainVisibility"];
  [v5 encodeBool:self->_isAvailableSystemWide forKey:@"_isAvailableSystemWide"];
  [v5 encodeBool:self->_supportsUnzippedPackages forKey:@"_supportsUnzippedPackages"];
  [v5 encodeBool:self->_usesUniqueItemIdentifiersAcrossDevices forKey:@"_usesUniqueItemIdentifiersAcrossDevices"];
  [v5 encodeBool:self->_supportsPickingFolders forKey:@"_supportsPickingFolders"];
  [v5 encodeBool:self->_wantsFlattenedPackages forKey:@"_wantsFlattenedPackages"];
  [v5 encodeBool:self->_allowsUserControlledEviction forKey:@"_allowsUserControlledEviction"];
  [v5 encodeBool:self->_allowsSystemDeleteAlerts forKey:@"_allowsSystemDeleteAlerts"];
  [v5 encodeBool:self->_allowsContextualMenuDownloadEntry forKey:@"_allowsContextualMenuDownloadEntry"];
  [v5 encodeBool:self->_appliesChangesAtomically forKey:@"_appliesChangesAtomically"];
  [v5 encodeObject:self->_downloadPipelineDepth forKey:@"_downloadPipelineDepth"];
  [v5 encodeObject:self->_uploadPipelineDepth forKey:@"_uploadPipelineDepth"];
  [v5 encodeObject:self->_metadataOnlyUploadPipelineDepth forKey:@"_metadataOnlyUploadPipelineDepth"];
  [v5 encodeBool:self->_owningApplicationIsManaged forKey:@"_owningApplicationIsManaged"];
  [v5 encodeBool:self->_owningApplicationIsHidden forKey:@"_owningApplicationIsHidden"];
  [v5 encodeObject:self->_extensionBundleURL forKey:@"_extensionBundleURL"];
  [v5 encodeObject:self->_purposeIdentifier forKey:@"_purposeIdentifier"];
  [v5 encodeObject:self->_bundleIdentifierForPushes forKey:@"_bundleIdentifierForPushes"];
  [v5 encodeObject:self->_supportedFileTypes forKey:@"_supportedFileTypes"];
  [v5 encodeObject:self->_supportedSearchFilters forKey:@"_supportedSearchFilters"];
  [v5 encodeObject:self->_requestedExtendedAttributes forKey:@"_requestedExtendedAttributes"];
  [v5 encodeObject:self->_extensionStorageURLs forKey:@"_extensionStorageURLs"];
  [v5 encodeObject:self->_extensionUUID forKey:@"_extensionUUID"];
  [v5 encodeObject:self->_documentGroupName forKey:@"_documentGroupName"];
  [v5 encodeBool:self->_managedPersona forKey:@"_managedPersona"];
  [v5 encodeBool:self->_wantsBundleBitOnlyPackageDetection forKey:@"_wantsBundleBitOnlyPackageDetection"];
  [v5 encodeBool:self->_allowsExternalVolumes forKey:@"_allowsExternalVolumes"];
}

- (FPDProviderDescriptor)initWithExtension:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F223A0]);
  uint64_t v6 = [v4 _extensionBundle];
  v7 = [v6 bundleURL];
  id v13 = 0;
  uint64_t v8 = (void *)[v5 initWithURL:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    self = [(FPDProviderDescriptor *)self initWithExtensionRecord:v8];
    uint64_t v10 = self;
  }
  else
  {
    v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FPDProviderDescriptor initWithExtension:]();
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (FPDProviderDescriptor)initWithExtensionRecord:(id)a3
{
  v186[3] = *MEMORY[0x1E4F143B8];
  id v160 = a3;
  v178.receiver = self;
  v178.super_class = (Class)FPDProviderDescriptor;
  v161 = [(FPDProviderDescriptor *)&v178 init];

  if (!v161) {
    goto LABEL_204;
  }
  id v4 = [v160 URL];
  [(FPDProviderDescriptor *)v161 setExtensionBundleURL:v4];

  v159 = [v160 uniqueIdentifier];
  if (!v159)
  {
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FPDProviderDescriptor initWithExtensionRecord:](v161, v14);
    }

    goto LABEL_203;
  }
  id v5 = [v160 bundleVersion];
  [(FPDProviderDescriptor *)v161 setBundleVersion:v5];

  [(FPDProviderDescriptor *)v161 setExtensionUUID:v159];
  uint64_t v6 = [v160 bundleIdentifier];
  [(FPDProviderDescriptor *)v161 setIdentifier:v6];

  v7 = [(FPDProviderDescriptor *)v161 identifier];
  int v8 = [v7 hasPrefix:@"com.apple."];

  uint64_t v9 = *MEMORY[0x1E4F25BC0];
  uint64_t v10 = (void *)MEMORY[0x1E4F25BC8];
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v186[0] = *MEMORY[0x1E4F25BE8];
    v186[1] = v9;
    v186[2] = *MEMORY[0x1E4F25BC8];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:3];
    id v13 = [v11 setWithArray:v12];

    v156 = [v160 entitlements];
  }
  else
  {
    v156 = 0;
  }
  v15 = [v156 objectForKey:v9 ofClass:objc_opt_class()];
  if (v15)
  {
    [(FPDProviderDescriptor *)v161 setPurposeIdentifier:v15];
  }
  else
  {
    uint64_t v16 = [(FPDProviderDescriptor *)v161 identifier];
    [(FPDProviderDescriptor *)v161 setPurposeIdentifier:v16];
  }
  v17 = [v160 containingBundleRecord];
  v157 = v17;
  if (v17)
  {
    uint64_t v18 = [v17 bundleIdentifier];
    [(FPDProviderDescriptor *)v161 setTopLevelBundleIdentifier:v18];

    v19 = [v157 URL];
    [(FPDProviderDescriptor *)v161 setTopLevelBundleURL:v19];

    if (v8)
    {
      uint64_t v20 = [v160 infoDictionary];
      v21 = [v20 objectForKey:@"CFBundleDisplayName" ofClass:objc_opt_class()];

      if (v21)
      {
        [(FPDProviderDescriptor *)v161 setLocalizedName:v21];
      }
      else
      {
        uint64_t v28 = [v157 localizedName];
        [(FPDProviderDescriptor *)v161 setLocalizedName:v28];
      }
    }
    else
    {
      v21 = [v157 localizedName];
      [(FPDProviderDescriptor *)v161 setLocalizedName:v21];
    }

    v29 = [(FPDProviderDescriptor *)v161 localizedName];
    BOOL v30 = [v29 length] == 0;

    if (v30)
    {
      v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        [(FPDProviderDescriptor *)(uint64_t)v157 initWithExtensionRecord:v31];
      }
    }
    v32 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v33 = [(FPDProviderDescriptor *)v161 topLevelBundleIdentifier];
    v161->_owningApplicationIsManaged = [v32 isAppManaged:v33];

    v34 = (void *)MEMORY[0x1E4F4B7E0];
    v27 = [(FPDProviderDescriptor *)v161 topLevelBundleIdentifier];
    v35 = [v34 applicationWithBundleIdentifier:v27];
    v161->_owningApplicationIsHidden = [v35 isHidden];
  }
  else
  {
    uint64_t v22 = [v160 localizedName];
    [(FPDProviderDescriptor *)v161 setLocalizedName:v22];

    v23 = [(FPDProviderDescriptor *)v161 localizedName];
    BOOL v24 = v23 == 0;

    if (v24)
    {
      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[FPDProviderDescriptor initWithExtensionRecord:]6(v161, v25);
      }
    }
    uint64_t v26 = [(FPDProviderDescriptor *)v161 identifier];
    [(FPDProviderDescriptor *)v161 setTopLevelBundleIdentifier:v26];

    v27 = [(FPDProviderDescriptor *)v161 extensionBundleURL];
    [(FPDProviderDescriptor *)v161 setTopLevelBundleURL:v27];
  }

  v36 = [v156 objectForKey:*v10 ofClass:objc_opt_class()];
  if (v36)
  {
    [(FPDProviderDescriptor *)v161 setBundleIdentifierForPushes:v36];
  }
  else
  {
    v37 = [(FPDProviderDescriptor *)v161 topLevelBundleIdentifier];
    [(FPDProviderDescriptor *)v161 setBundleIdentifierForPushes:v37];
  }
  unsigned __int8 v177 = 0;
  uint64_t v38 = +[FPDProviderDescriptor personaFromExtensionRecord:v160 managedPersona:&v177];
  [(FPDProviderDescriptor *)v161 setPersonaIdentifier:v38];

  [(FPDProviderDescriptor *)v161 setManagedPersona:v177];
  v39 = fp_current_or_default_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    -[FPDProviderDescriptor initWithExtensionRecord:]5(v161, v39);
  }

  if (v8)
  {
    v40 = [(FPDProviderDescriptor *)v161 personaIdentifier];
    BOOL v41 = v40 == 0;

    if (v41)
    {
      uint64_t v50 = [v160 bundleIdentifier];
      if ([v50 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
      {
      }
      else
      {
        v53 = [v160 bundleIdentifier];
        int v54 = [v53 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

        if (!v54) {
          goto LABEL_35;
        }
      }
      oslog = fp_current_or_default_log();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [(FPDProviderDescriptor *)v161 identifier];
        *(_DWORD *)buf = 138543362;
        v181 = v55;
        _os_log_impl(&dword_1D744C000, oslog, OS_LOG_TYPE_DEFAULT, "[NOTICE] No enterprise enrolment, dropping %{public}@ registration", buf, 0xCu);
      }
      int v49 = 1;
      goto LABEL_201;
    }
  }
LABEL_35:
  if (![(FPDProviderDescriptor *)v161 isPersonaLegit])
  {
    int v49 = 1;
    goto LABEL_202;
  }
  oslog = [MEMORY[0x1E4F28CB8] defaultManager];
  v42 = [v160 infoDictionary];
  v158 = [v42 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  if (v158)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v153 = [v158 objectForKeyedSubscript:@"NSExtensionAttributes"];
      if (v153)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_44;
        }
        uint64_t v43 = fp_current_or_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[FPDProviderDescriptor initWithExtensionRecord:]3((uint64_t)v153, v43);
        }
      }
      v153 = 0;
LABEL_44:
      objc_opt_class();
      v44 = objectForKeyOfClass(v158, @"NSExtensionFileProviderSupportsEnumeration");
      -[FPDProviderDescriptor setSupportsEnumeration:](v161, "setSupportsEnumeration:", [v44 BOOLValue]);

      objc_opt_class();
      v45 = objectForKeyOfClass(v158, @"NSExtensionFileProviderOnlyVisibleInParentApplication");
      -[FPDProviderDescriptor setIsAvailableSystemWide:](v161, "setIsAvailableSystemWide:", [v45 BOOLValue] ^ 1);

      objc_opt_class();
      v46 = objectForKeyOfClass(v158, @"NSExtensionFileProviderReadOnly");
      -[FPDProviderDescriptor setReadonly:](v161, "setReadonly:", [v46 BOOLValue]);

      objc_opt_class();
      v47 = objectForKeyOfClass(v158, @"NSExtensionFileProviderEnabledByDefault");
      v149 = v47;
      if (v47) {
        uint64_t v48 = [v47 BOOLValue];
      }
      else {
        uint64_t v48 = 0;
      }
      [(FPDProviderDescriptor *)v161 setEnabledByDefault:v48];
      objc_opt_class();
      v56 = objectForKeyOfClass(v158, @"NSExtensionFileProviderWantsFlattenedPackages");
      v148 = v56;
      if (v56) {
        uint64_t v57 = [v56 BOOLValue];
      }
      else {
        uint64_t v57 = 0;
      }
      [(FPDProviderDescriptor *)v161 setWantsFlattenedPackages:v57];
      objc_opt_class();
      v58 = objectForKeyOfClass(v158, @"NSExtensionFileProviderAllowsUserControlledEviction");
      v147 = v58;
      if (v58) {
        uint64_t v59 = [v58 BOOLValue];
      }
      else {
        uint64_t v59 = 1;
      }
      [(FPDProviderDescriptor *)v161 setAllowsUserControlledEviction:v59];
      objc_opt_class();
      v60 = objectForKeyOfClass(v158, @"NSExtensionFileProviderAllowsSystemDeleteAlerts");
      v146 = v60;
      if (v60) {
        uint64_t v61 = [v60 BOOLValue];
      }
      else {
        uint64_t v61 = 1;
      }
      [(FPDProviderDescriptor *)v161 setAllowsSystemDeleteAlerts:v61];
      objc_opt_class();
      v62 = objectForKeyOfClass(v158, @"NSExtensionFileProviderAllowsContextualMenuDownloadEntry");
      v145 = v62;
      if (v62) {
        uint64_t v63 = [v62 BOOLValue];
      }
      else {
        uint64_t v63 = 1;
      }
      [(FPDProviderDescriptor *)v161 setAllowsContextualMenuDownloadEntry:v63];
      objc_opt_class();
      v144 = objectForKeyOfClass(v158, @"NSExtensionFileProviderAppliesChangesAtomically");
      -[FPDProviderDescriptor setAppliesChangesAtomically:](v161, "setAppliesChangesAtomically:", [v144 BOOLValue]);
      objc_opt_class();
      v151 = objectForKeyOfClass(v158, @"NSFileProviderDefaultDomainVisible");
      if (!v151)
      {
        objc_opt_class();
        v151 = objectForKeyOfClass(v158, @"NSFileProviderDefaultDomainEnabled");
      }
      v64 = [(FPDProviderDescriptor *)v161 identifier];
      int v65 = [v64 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

      if (v65)
      {
        uint64_t v66 = [NSNumber numberWithInt:FPIsCloudDocsWithFPFSEnabled() ^ 1];
      }
      else
      {
        v67 = [(FPDProviderDescriptor *)v161 identifier];
        int v68 = [v67 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"];

        if (!v68)
        {
LABEL_79:
          v69 = 0;
          uint64_t v66 = v151;
          if (!v151)
          {
            -[FPDProviderDescriptor setDefaultDomainVisible:](v161, "setDefaultDomainVisible:", 1, 0);
LABEL_81:
            objc_opt_class();
            v71 = objectForKeyOfClass(v158, @"NSFileProviderHideExtensionName");
            -[FPDProviderDescriptor setShouldHideExtensionName:](v161, "setShouldHideExtensionName:", [v71 BOOLValue]);

            objc_opt_class();
            v72 = objectForKeyOfClass(v158, @"NSFileProviderCanToggleDomainVisibility");
            v143 = v72;
            if (v72) {
              uint64_t v73 = [v72 BOOLValue];
            }
            else {
              uint64_t v73 = 1;
            }
            [(FPDProviderDescriptor *)v161 setCanToggleDomainVisibility:v73];
            objc_opt_class();
            v142 = objectForKeyOfClass(v158, @"NSExtensionPointVersion");
            if ([v142 isEqualToString:@"2.0"])
            {
              [(FPDProviderDescriptor *)v161 setSupportsEnumeration:1];
              [(FPDProviderDescriptor *)v161 setIsAvailableSystemWide:1];
            }
            objc_opt_class();
            v74 = objectForKeyOfClass(v158, @"NSExtensionFileProviderSupportsUnzippedPackages");
            v141 = v74;
            if (v74) {
              uint64_t v75 = [v74 BOOLValue];
            }
            else {
              uint64_t v75 = 0;
            }
            [(FPDProviderDescriptor *)v161 setSupportsUnzippedPackages:v75];
            objc_opt_class();
            v76 = objectForKeyOfClass(v158, @"NSExtensionFileProviderSupportsPickingFolders");
            v140 = v76;
            if (v76) {
              uint64_t v77 = [v76 BOOLValue];
            }
            else {
              uint64_t v77 = 0;
            }
            [(FPDProviderDescriptor *)v161 setSupportsPickingFolders:v77];
            objc_opt_class();
            v150 = objectForKeyOfClass(v158, @"NSExtensionWantsBundleBitOnlyPackageDetection");
            if (v150
              && ([v160 bundleIdentifier],
                  v78 = objc_claimAutoreleasedReturnValue(),
                  int v79 = [v78 hasPrefix:@"com.apple."],
                  v78,
                  v79))
            {
              uint64_t v80 = [v150 BOOLValue];
            }
            else
            {
              uint64_t v80 = 0;
            }
            [(FPDProviderDescriptor *)v161 setWantsBundleBitOnlyPackageDetection:v80];
            objc_opt_class();
            v81 = objectForKeyOfClass(v158, @"NSExtensionFileProviderAllowsExternalVolumes");
            v139 = v81;
            if (v81) {
              uint64_t v82 = [v81 BOOLValue];
            }
            else {
              uint64_t v82 = 0;
            }
            [(FPDProviderDescriptor *)v161 setAllowsExternalVolumes:v82];
            objc_opt_class();
            v83 = objectForKeyOfClass(v158, @"NSExtensionFileProviderAdditionalSyncableExtendedAttributes");
            [(FPDProviderDescriptor *)v161 setRequestedExtendedAttributes:v83];

            v84 = [(FPDProviderDescriptor *)v161 requestedExtendedAttributes];

            if (v84)
            {
              long long v175 = 0u;
              long long v176 = 0u;
              long long v173 = 0u;
              long long v174 = 0u;
              v85 = [(FPDProviderDescriptor *)v161 requestedExtendedAttributes];
              uint64_t v86 = [v85 countByEnumeratingWithState:&v173 objects:v185 count:16];
              if (v86)
              {
                uint64_t v87 = *(void *)v174;
                while (2)
                {
                  for (uint64_t i = 0; i != v86; ++i)
                  {
                    if (*(void *)v174 != v87) {
                      objc_enumerationMutation(v85);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v89 = fp_current_or_default_log();
                      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
                        -[FPDProviderDescriptor initWithExtensionRecord:]2();
                      }

                      [(FPDProviderDescriptor *)v161 setRequestedExtendedAttributes:0];
                      goto LABEL_112;
                    }
                  }
                  uint64_t v86 = [v85 countByEnumeratingWithState:&v173 objects:v185 count:16];
                  if (v86) {
                    continue;
                  }
                  break;
                }
              }
LABEL_112:
            }
            obuint64_t j = [v153 objectForKeyedSubscript:@"NSFileProviderSupportedFileTypes"];
            if (obj)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v171 = 0u;
                long long v172 = 0u;
                long long v169 = 0u;
                long long v170 = 0u;
                obuint64_t j = obj;
                uint64_t v90 = [obj countByEnumeratingWithState:&v169 objects:v184 count:16];
                if (v90)
                {
                  uint64_t v91 = *(void *)v170;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v90; ++j)
                    {
                      if (*(void *)v170 != v91) {
                        objc_enumerationMutation(obj);
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v94 = fp_current_or_default_log();
                        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
                          -[FPDProviderDescriptor initWithExtensionRecord:]0();
                        }

                        v95 = [(id)*MEMORY[0x1E4F44408] identifier];
                        v183 = v95;
                        v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v183 count:1];
                        [(FPDProviderDescriptor *)v161 setSupportedFileTypes:v96];

                        goto LABEL_131;
                      }
                    }
                    uint64_t v90 = [obj countByEnumeratingWithState:&v169 objects:v184 count:16];
                    if (v90) {
                      continue;
                    }
                    break;
                  }
                }

                [(FPDProviderDescriptor *)v161 setSupportedFileTypes:obj];
              }
              else
              {
                v93 = fp_current_or_default_log();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
                  -[FPDProviderDescriptor initWithExtensionRecord:]1((uint64_t)obj, v161);
                }
              }
            }
            else
            {
LABEL_131:
              obuint64_t j = 0;
            }
            v137 = objc_opt_new();
            v97 = [v156 objectForKey:*MEMORY[0x1E4F25BE8] ofClass:objc_opt_class()];
            v138 = v97;
            if (v97)
            {
              memset(v168, 0, sizeof(v168));
              id v152 = v97;
              if (![v152 countByEnumeratingWithState:v168 objects:v182 count:16])
              {
LABEL_138:

                [(FPDProviderDescriptor *)v161 setHasExplicitExtensionStorageURLs:1];
                goto LABEL_158;
              }
              id v98 = **((id **)&v168[0] + 1);
              if ([v98 hasPrefix:@"/"])
              {
                uint64_t v99 = [v98 substringFromIndex:1];

                id v98 = (id)v99;
              }
              v100 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
              v101 = [v100 URLByAppendingPathComponent:v98 isDirectory:1];

              if (v101)
              {
                [v137 addObject:v101];

                goto LABEL_138;
              }
              v103 = fp_current_or_default_log();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT)) {
                -[FPDProviderDescriptor initWithExtensionRecord:].cold.9();
              }
LABEL_198:
              int v49 = 1;
LABEL_199:

              uint64_t v52 = v153;
              goto LABEL_200;
            }
            id v152 = [v158 objectForKeyedSubscript:@"NSExtensionFileProviderDocumentGroup"];
            v102 = [MEMORY[0x1E4FB36F8] sharedManager];
            v103 = [v102 currentPersona];

            id v167 = 0;
            v104 = [v103 userPersonaUniqueString];
            v105 = v104;
            p_personaIdentifier = &v161->_personaIdentifier;
            if (v104 == v161->_personaIdentifier
              || -[NSString isEqualToString:](v104, "isEqualToString:")
              || !voucher_process_can_use_arbitrary_personas())
            {
              id v98 = 0;
            }
            else
            {
              id v166 = 0;
              v107 = (void *)[v103 copyCurrentPersonaContextWithError:&v166];
              id v108 = v166;
              id v109 = v167;
              id v167 = v107;

              if (v108)
              {
                v110 = fp_current_or_default_log();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
                  -[FPDProviderDescriptor initWithExtensionRecord:].cold.8();
                }
              }
              id v98 = [v103 generateAndRestorePersonaContextWithPersonaUniqueString:*p_personaIdentifier];

              if (v98)
              {
                v111 = fp_current_or_default_log();
                if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
                  [(FPDProviderDescriptor *)p_personaIdentifier initWithExtensionRecord:v111];
                }
              }
            }
            if (v152)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v112 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:", v152);
                if (v112)
                {
                  v113 = [v160 groupContainerURLs];
                  v114 = [v113 objectForKeyedSubscript:v152];

                  if (v114)
                  {
                    v115 = [v112 URLByAppendingPathComponent:@"File Provider Storage" isDirectory:1];
                    if (v115)
                    {
                      [v137 addObject:v115];
                      [(FPDProviderDescriptor *)v161 setDocumentGroupName:v152];

                      goto LABEL_157;
                    }
                    v132 = fp_current_or_default_log();
                    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
                      -[FPDProviderDescriptor initWithExtensionRecord:].cold.5();
                    }
                  }
                  else
                  {
                    v131 = fp_current_or_default_log();
                    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
                      -[FPDProviderDescriptor initWithExtensionRecord:].cold.4();
                    }
                  }
                }
                else
                {
                  v112 = fp_current_or_default_log();
                  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
                    -[FPDProviderDescriptor initWithExtensionRecord:]();
                  }
                }
              }
              else
              {
                v112 = fp_current_or_default_log();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  id v129 = (id)objc_opt_class();
                  v130 = [(FPDProviderDescriptor *)v161 identifier];
                  -[FPDProviderDescriptor initWithExtensionRecord:].cold.6(v129, v130, buf, v112);
                }
              }

              _FPRestorePersona();
              goto LABEL_198;
            }
LABEL_157:

            _FPRestorePersona();
LABEL_158:
            [(FPDProviderDescriptor *)v161 setExtensionStorageURLs:v137];
            id v152 = [v158 objectForKeyedSubscript:@"NSExtensionFileProviderSupportedSearchCapabilities"];
            if (v152)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v116 = [MEMORY[0x1E4F1CA48] array];
                [v116 addObject:*MEMORY[0x1E4F25C80]];
                long long v164 = 0u;
                long long v165 = 0u;
                long long v162 = 0u;
                long long v163 = 0u;
                id v117 = v152;
                uint64_t v118 = [v117 countByEnumeratingWithState:&v162 objects:v179 count:16];
                if (v118)
                {
                  uint64_t v119 = *(void *)v163;
                  v120 = (void *)MEMORY[0x1E4F25C78];
                  v121 = (void *)MEMORY[0x1E4F25C88];
                  do
                  {
                    for (uint64_t k = 0; k != v118; ++k)
                    {
                      if (*(void *)v163 != v119) {
                        objc_enumerationMutation(v117);
                      }
                      v123 = *(void **)(*((void *)&v162 + 1) + 8 * k);
                      char v124 = [v123 isEqualToString:@"NSExtensionFileProviderSearchByContentType"];
                      v125 = v120;
                      if ((v124 & 1) == 0)
                      {
                        int v126 = [v123 isEqualToString:@"NSExtensionFileProviderSearchScopedToDirectory"];
                        v125 = v121;
                        if (!v126) {
                          continue;
                        }
                      }
                      [v116 addObject:*v125];
                    }
                    uint64_t v118 = [v117 countByEnumeratingWithState:&v162 objects:v179 count:16];
                  }
                  while (v118);
                }

                [(FPDProviderDescriptor *)v161 setSupportedSearchFilters:v116];
              }
            }
            id v98 = [v158 objectForKeyedSubscript:@"NSFileProviderUsesUniqueItemIdentifiersAcrossDevices"];
            if (v98)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                -[FPDProviderDescriptor setUsesUniqueItemIdentifiersAcrossDevices:](v161, "setUsesUniqueItemIdentifiersAcrossDevices:", [v98 BOOLValue]);
              }
            }
            v103 = [v158 objectForKeyedSubscript:@"NSExtensionFileProviderDownloadPipelineDepth"];
            if (v103)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(FPDProviderDescriptor *)v161 setDownloadPipelineDepth:v103];
              }
            }
            v127 = [v158 objectForKeyedSubscript:@"NSExtensionFileProviderUploadPipelineDepth"];
            if (v127)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(FPDProviderDescriptor *)v161 setUploadPipelineDepth:v127];
              }
            }
            v128 = [v158 objectForKeyedSubscript:@"NSExtensionFileProviderMetadataOnlyUploadPipelineDepth"];
            if (v128)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [(FPDProviderDescriptor *)v161 setMetadataOnlyUploadPipelineDepth:v128];
              }
            }

            int v49 = 0;
            goto LABEL_199;
          }
LABEL_80:
          uint64_t v70 = objc_msgSend(v66, "BOOLValue", v69);
          -[FPDProviderDescriptor setDefaultDomainVisible:](v161, "setDefaultDomainVisible:", v70, v135);
          goto LABEL_81;
        }
        uint64_t v66 = [NSNumber numberWithBool:FPIsCloudDocsWithFPFSEnabled()];
      }
      v69 = v66;
      if (v66) {
        goto LABEL_80;
      }
      goto LABEL_79;
    }
    v51 = fp_current_or_default_log();
    uint64_t v52 = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      -[FPDProviderDescriptor initWithExtensionRecord:]4((uint64_t)v158, v161);
      goto LABEL_53;
    }
LABEL_54:
    int v49 = 1;
    goto LABEL_200;
  }
  v51 = fp_current_or_default_log();
  uint64_t v52 = v51;
  if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    goto LABEL_54;
  }
  -[FPDProviderDescriptor initWithExtensionRecord:](v161, v51);
LABEL_53:
  int v49 = 1;
  uint64_t v52 = v51;
LABEL_200:

LABEL_201:
LABEL_202:

  if (!v49)
  {
LABEL_204:
    v133 = v161;
    goto LABEL_205;
  }
LABEL_203:
  v133 = 0;
LABEL_205:

  return v133;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FPDProviderDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_14;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    extensionUUID = self->_extensionUUID;
    uint64_t v9 = [(FPDProviderDescriptor *)v7 extensionUUID];
    LODWORD(extensionUUID) = [(NSUUID *)extensionUUID isEqual:v9];

    if (extensionUUID)
    {
      uint64_t v10 = [(FPDProviderDescriptor *)self personaIdentifier];
      if (!v10)
      {
        uint64_t v9 = [(FPDProviderDescriptor *)v7 personaIdentifier];
        if (!v9) {
          goto LABEL_10;
        }
      }
      v11 = [(FPDProviderDescriptor *)self personaIdentifier];
      uint64_t v12 = [(FPDProviderDescriptor *)v7 personaIdentifier];
      int v13 = [v11 isEqual:v12];

      if (v10)
      {

        if (v13)
        {
LABEL_10:
          BOOL owningApplicationIsHidden = self->_owningApplicationIsHidden;
          BOOL v6 = owningApplicationIsHidden == [(FPDProviderDescriptor *)v7 owningApplicationIsHidden];
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {

        if (v13) {
          goto LABEL_10;
        }
      }
    }
    BOOL v6 = 0;
    goto LABEL_13;
  }
  BOOL v6 = 0;
LABEL_14:

  return v6;
}

+ (id)personaFromExtensionRecord:(id)a3 managedPersona:(BOOL *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *a4 = 0;
  BOOL v6 = [v5 bundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
  {

LABEL_4:
    uint64_t v9 = (void *)MEMORY[0x1E4FB3710];
    uint64_t v10 = 2;
LABEL_5:
    v11 = [v9 personaAttributesForPersonaType:v10];
    uint64_t v12 = [v11 userPersonaUniqueString];

    goto LABEL_6;
  }
  v7 = [v5 bundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

  if (v8) {
    goto LABEL_4;
  }
  uint64_t v14 = [v5 managedPersonas];
  uint64_t v15 = [v14 count];

  uint64_t v9 = (void *)MEMORY[0x1E4FB3710];
  if (!v15)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  uint64_t v16 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
  v17 = [v16 userPersonaUniqueString];

  uint64_t v18 = [v5 managedPersonas];
  uint64_t v12 = [v18 firstObject];

  v19 = [v5 managedPersonas];
  unint64_t v20 = [v19 count];

  if (v20 >= 2)
  {
    v21 = fp_current_or_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      +[FPDProviderDescriptor personaFromExtensionRecord:managedPersona:](v5, v21);
    }
  }
  if (([v12 isEqualToString:v17] & 1) == 0)
  {
    uint64_t v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      int v23 = 138412802;
      id v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_fault_impl(&dword_1D744C000, v22, OS_LOG_TYPE_FAULT, "[CRIT] extension record %@ has a persona %@ not matching the managed persona %@", (uint8_t *)&v23, 0x20u);
    }
  }
  *a4 = 1;

LABEL_6:
  return v12;
}

- (BOOL)isPersonaLegit
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(FPDProviderDescriptor *)self personaIdentifier];
  if (v3)
  {

    return 1;
  }
  id v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v5 = [v4 isSharedIPad];

  if (v5) {
    return 1;
  }
  v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(FPDProviderDescriptor *)self identifier];
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D744C000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Extension without persona out of the EDU case, dropping %{public}@ registration", (uint8_t *)&v9, 0xCu);
  }
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  char v5 = [(FPDProviderDescriptor *)self identifier];
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p, %@>", v4, self, v5];

  return v6;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setTopLevelBundleIdentifier:(id)a3
{
}

- (void)setTopLevelBundleURL:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setExtensionPointVersion:(id)a3
{
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (void)setEnabledByDefault:(BOOL)a3
{
  self->_enabledByDefault = a3;
}

- (void)setSupportsEnumeration:(BOOL)a3
{
  self->_supportsEnumeration = a3;
}

- (void)setDefaultDomainVisible:(BOOL)a3
{
  self->_defaultDomainVisible = a3;
}

- (void)setShouldHideExtensionName:(BOOL)a3
{
  self->_shouldHideExtensionName = a3;
}

- (void)setCanToggleDomainVisibility:(BOOL)a3
{
  self->_canToggleDomainVisibility = a3;
}

- (void)setIsAvailableSystemWide:(BOOL)a3
{
  self->_isAvailableSystemWide = a3;
}

- (void)setUsesUniqueItemIdentifiersAcrossDevices:(BOOL)a3
{
  self->_usesUniqueItemIdentifiersAcrossDevices = a3;
}

- (BOOL)supportsUnzippedPackages
{
  return self->_supportsUnzippedPackages;
}

- (void)setSupportsUnzippedPackages:(BOOL)a3
{
  self->_supportsUnzippedPackages = a3;
}

- (BOOL)hasExplicitExtensionStorageURLs
{
  return self->_hasExplicitExtensionStorageURLs;
}

- (void)setHasExplicitExtensionStorageURLs:(BOOL)a3
{
  self->_hasExplicitExtensionStorageURLs = a3;
}

- (void)setSupportsPickingFolders:(BOOL)a3
{
  self->_supportsPickingFolders = a3;
}

- (BOOL)wantsFlattenedPackages
{
  return self->_wantsFlattenedPackages;
}

- (void)setWantsFlattenedPackages:(BOOL)a3
{
  self->_wantsFlattenedPackages = a3;
}

- (void)setAllowsUserControlledEviction:(BOOL)a3
{
  self->_allowsUserControlledEviction = a3;
}

- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3
{
  self->_allowsContextualMenuDownloadEntry = a3;
}

- (void)setAllowsSystemDeleteAlerts:(BOOL)a3
{
  self->_allowsSystemDeleteAlerts = a3;
}

- (void)setAppliesChangesAtomically:(BOOL)a3
{
  self->_appliesChangesAtomically = a3;
}

- (NSNumber)downloadPipelineDepth
{
  return self->_downloadPipelineDepth;
}

- (void)setDownloadPipelineDepth:(id)a3
{
}

- (NSNumber)uploadPipelineDepth
{
  return self->_uploadPipelineDepth;
}

- (void)setUploadPipelineDepth:(id)a3
{
}

- (NSNumber)metadataOnlyUploadPipelineDepth
{
  return self->_metadataOnlyUploadPipelineDepth;
}

- (void)setMetadataOnlyUploadPipelineDepth:(id)a3
{
}

- (void)setOwningApplicationIsManaged:(BOOL)a3
{
  self->_owningApplicationIsManaged = a3;
}

- (void)setDisallowedByMDM:(BOOL)a3
{
  self->_disallowedByMDM = a3;
}

- (void)setOwningApplicationIsHidden:(BOOL)a3
{
  self->_BOOL owningApplicationIsHidden = a3;
}

- (NSString)purposeIdentifier
{
  return self->_purposeIdentifier;
}

- (void)setPurposeIdentifier:(id)a3
{
}

- (NSString)bundleIdentifierForPushes
{
  return self->_bundleIdentifierForPushes;
}

- (void)setBundleIdentifierForPushes:(id)a3
{
}

- (void)setExtensionBundleURL:(id)a3
{
}

- (NSUUID)extensionUUID
{
  return self->_extensionUUID;
}

- (void)setExtensionUUID:(id)a3
{
}

- (void)setSupportedFileTypes:(id)a3
{
}

- (void)setSupportedSearchFilters:(id)a3
{
}

- (NSArray)extensionStorageURLs
{
  return self->_extensionStorageURLs;
}

- (void)setExtensionStorageURLs:(id)a3
{
}

- (NSString)documentGroupName
{
  return self->_documentGroupName;
}

- (void)setDocumentGroupName:(id)a3
{
}

- (NSArray)requestedExtendedAttributes
{
  return self->_requestedExtendedAttributes;
}

- (void)setRequestedExtendedAttributes:(id)a3
{
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (BOOL)wantsBundleBitOnlyPackageDetection
{
  return self->_wantsBundleBitOnlyPackageDetection;
}

- (void)setWantsBundleBitOnlyPackageDetection:(BOOL)a3
{
  self->_wantsBundleBitOnlyPackageDetection = a3;
}

- (BOOL)allowsExternalVolumes
{
  return self->_allowsExternalVolumes;
}

- (void)setAllowsExternalVolumes:(BOOL)a3
{
  self->_allowsExternalVolumes = a3;
}

- (BOOL)managedPersona
{
  return self->_managedPersona;
}

- (void)setManagedPersona:(BOOL)a3
{
  self->_managedPersona = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedExtendedAttributes, 0);
  objc_storeStrong((id *)&self->_documentGroupName, 0);
  objc_storeStrong((id *)&self->_extensionStorageURLs, 0);
  objc_storeStrong((id *)&self->_supportedSearchFilters, 0);
  objc_storeStrong((id *)&self->_supportedFileTypes, 0);
  objc_storeStrong((id *)&self->_extensionUUID, 0);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForPushes, 0);
  objc_storeStrong((id *)&self->_purposeIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataOnlyUploadPipelineDepth, 0);
  objc_storeStrong((id *)&self->_uploadPipelineDepth, 0);
  objc_storeStrong((id *)&self->_downloadPipelineDepth, 0);
  objc_storeStrong((id *)&self->_extensionPointVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_topLevelBundleURL, 0);
  objc_storeStrong((id *)&self->_topLevelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithExtension:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] extension %@ doesn't have a record (%@)");
}

- (void)initWithExtensionRecord:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 extensionBundleURL];
  uint64_t v4 = objc_msgSend(v3, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a2, v5, "[ERROR] extension at %@ has no uuid", v6);
}

- (void)initWithExtensionRecord:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a2, v4, "[ERROR] \"NSExtension\" does not exist -- extension identifier: %@", v5);
}

- (void)initWithExtensionRecord:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] Cannot deduce the provided items URL for %@", v2);
}

- (void)initWithExtensionRecord:.cold.4()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  __int16 v5 = 2114;
  uint64_t v6 = @"NSExtensionFileProviderDocumentGroup";
  _os_log_error_impl(&dword_1D744C000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Extension %@ doesn't have a group container for document group %{public}@ specified via %{public}@. Ignoring the extension.", v2, 0x20u);
}

- (void)initWithExtensionRecord:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] Cannot deduce the provider storage URL for %@", v2);
}

- (void)initWithExtensionRecord:(uint8_t *)buf .cold.6(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543874;
  *(void *)(buf + 4) = @"NSExtensionFileProviderDocumentGroup";
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] invalid type for key \"%{public}@\" (expected: NSString, actual: %{public}@) -- extension identifier: %{public}@", buf, 0x20u);
}

- (void)initWithExtensionRecord:(NSObject *)a3 .cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_18(&dword_1D744C000, a2, a3, "[ERROR] Can't adopt persona %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)initWithExtensionRecord:.cold.8()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, v0, v1, "[ERROR] won't restore persona: %@", v2);
}

- (void)initWithExtensionRecord:.cold.9()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1D744C000, v0, OS_LOG_TYPE_FAULT, "[CRIT] got nil URL for directory at path %@", v1, 0xCu);
}

- (void)initWithExtensionRecord:.cold.10()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] %@ contains supported file type that's not of type NSString: %@");
}

- (void)initWithExtensionRecord:(uint64_t)a1 .cold.11(uint64_t a1, void *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v5, v6, "[ERROR] invalid type for key \"NSFileProviderSupportedFileTypes\" (expected: NSArray, actual: %@) -- extension identifier: %@", v7, v8, v9, v10, 2u);
}

- (void)initWithExtensionRecord:.cold.12()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_18(&dword_1D744C000, v0, v1, "[ERROR] %@ contains an interesting extended attribute that is not a string: %@");
}

- (void)initWithExtensionRecord:(uint64_t)a1 .cold.13(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a2, v4, "[ERROR] extension attributes of bad type %@", v5);
}

- (void)initWithExtensionRecord:(uint64_t)a1 .cold.14(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v3, v4, "[ERROR] invalid type for key \"NSExtension\" (expected: NSDictionary, actual: %@) -- extension identifier: %@", v5, v6, v7, v8, 2u);
}

- (void)initWithExtensionRecord:(void *)a1 .cold.15(void *a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 identifier];
  uint64_t v5 = [a1 personaIdentifier];
  int v6 = [a1 managedPersona];
  uint64_t v7 = @"FP deduced";
  int v8 = 138543874;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  if (v6) {
    uint64_t v7 = @"LS provided";
  }
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  int v13 = v7;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Extension %{public}@ has persona %@ (%@)", (uint8_t *)&v8, 0x20u);
}

- (void)initWithExtensionRecord:(void *)a1 .cold.16(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 extensionBundleURL];
  uint64_t v4 = objc_msgSend(v3, "fp_shortDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_2(&dword_1D744C000, a2, v5, "[ERROR] embedded extension at %{public}@ has no display name", v6);
}

- (void)initWithExtensionRecord:(NSObject *)a3 .cold.17(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 extensionBundleURL];
  int v6 = objc_msgSend(v5, "fp_shortDescription");
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  __int16 v10 = v6;
  _os_log_fault_impl(&dword_1D744C000, a3, OS_LOG_TYPE_FAULT, "[CRIT] containing bundle %{public}@ for extension at %{public}@ has empty display name", (uint8_t *)&v7, 0x16u);
}

+ (void)personaFromExtensionRecord:(void *)a1 managedPersona:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 managedPersonas];
  int v5 = 138412546;
  int v6 = a1;
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1D744C000, a2, OS_LOG_TYPE_FAULT, "[CRIT] extension record %@ has more than one persona associated (%@)", (uint8_t *)&v5, 0x16u);
}

@end