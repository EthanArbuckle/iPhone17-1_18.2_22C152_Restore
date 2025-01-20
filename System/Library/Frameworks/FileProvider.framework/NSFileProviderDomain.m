@interface NSFileProviderDomain
+ (BOOL)supportsSecureCoding;
+ (id)_userInfoAllowedClasses;
+ (id)domainFromPlistDictionary:(id)a3 identifier:(id)a4 volumeURL:(id)a5 replicatedByDefault:(BOOL)a6;
- (BOOL)containsPhotos;
- (BOOL)isContentManaged;
- (BOOL)isDataSeparatedDomain;
- (BOOL)isDisconnected;
- (BOOL)isEjectable;
- (BOOL)isEnterpriseDomain;
- (BOOL)isErasable;
- (BOOL)isHidden;
- (BOOL)isHiddenByUser;
- (BOOL)isReplicated;
- (BOOL)owningApplicationIsHidden;
- (BOOL)readOnly;
- (BOOL)supportsRemoteVersions;
- (BOOL)supportsSearch;
- (BOOL)supportsSyncingTrash;
- (BOOL)userEnabled;
- (NSData)backingStoreIdentity;
- (NSDictionary)domainUserInfo;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSFileProviderDomain)initWithCoder:(id)a3;
- (NSFileProviderDomain)initWithDisplayName:(id)a3 userInfo:(id)a4 volumeURL:(id)a5;
- (NSFileProviderDomain)initWithIdentifier:(NSFileProviderDomainIdentifier)identifier displayName:(NSString *)displayName;
- (NSFileProviderDomain)initWithIdentifier:(NSFileProviderDomainIdentifier)identifier displayName:(NSString *)displayName pathRelativeToDocumentStorage:(NSString *)pathRelativeToDocumentStorage;
- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 pathRelativeToDocumentStorage:(id)a5 hidden:(BOOL)a6;
- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 userInfo:(id)a5 volumeURL:(id)a6;
- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 userInfo:(id)a5 volumeURL:(id)a6 pathRelativeToDocumentStorage:(id)a7 hidden:(BOOL)a8 replicated:(BOOL)a9;
- (NSFileProviderDomainIdentifier)identifier;
- (NSFileProviderDomainTestingModes)testingModes;
- (NSString)_disconnectionReason;
- (NSString)displayName;
- (NSString)pathRelativeToDocumentStorage;
- (NSString)personaIdentifier;
- (NSString)spotlightDomainIdentifier;
- (NSString)symLinkName;
- (NSUUID)volumeUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)plistDictionary;
- (unint64_t)_disconnectionOptions;
- (unint64_t)replicatedKnownFolders;
- (unint64_t)supportedKnownFolders;
- (void)_setDisconnectionOptions:(unint64_t)a3;
- (void)_setDisconnectionReason:(id)a3;
- (void)copyValuesFromExistingDomain:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)plistDictionary;
- (void)setBackingStoreIdentity:(id)a3;
- (void)setContainsPhotos:(BOOL)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setDomainUserInfo:(id)a3;
- (void)setEjectable:(BOOL)a3;
- (void)setErasable:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setHiddenByUser:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setIsDataSeparatedDomain:(BOOL)a3;
- (void)setIsEnterpriseDomain:(BOOL)a3;
- (void)setOwningApplicationIsHidden:(BOOL)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setReplicated:(BOOL)a3;
- (void)setReplicatedKnownFolders:(unint64_t)a3;
- (void)setSpotlightDomainIdentifier:(id)a3;
- (void)setSupportedKnownFolders:(unint64_t)a3;
- (void)setSupportsRemoteVersions:(BOOL)a3;
- (void)setSupportsSearch:(BOOL)a3;
- (void)setSupportsSyncingTrash:(BOOL)supportsSyncingTrash;
- (void)setSymLinkName:(id)a3;
- (void)setTestingModes:(NSFileProviderDomainTestingModes)testingModes;
- (void)setUserEnabled:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NSFileProviderDomain

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (unint64_t)supportedKnownFolders
{
  return self->_supportedKnownFolders;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_identifier forKey:@"_identifier"];
  [v10 encodeObject:self->_displayName forKey:@"_displayName"];
  [v10 encodeObject:self->_pathRelativeToDocumentStorage forKey:@"_pathRelativeToDocumentStorage"];
  [v10 encodeBool:self->_hidden forKey:@"_hidden"];
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  if (spotlightDomainIdentifier) {
    [v10 encodeObject:spotlightDomainIdentifier forKey:@"_spotlightDomainIdentifier"];
  }
  if (self->_containsPhotos) {
    [v10 encodeBool:1 forKey:@"_containsPhotos"];
  }
  v5 = v10;
  if (self->_readOnly)
  {
    [v10 encodeBool:1 forKey:@"_readOnly"];
    v5 = v10;
  }
  if (self->_erasable)
  {
    [v10 encodeBool:1 forKey:@"_erasable"];
    v5 = v10;
  }
  if (self->_isContentManaged)
  {
    [v10 encodeBool:1 forKey:@"_isContentManaged"];
    v5 = v10;
  }
  personaIdentifier = self->_personaIdentifier;
  if (personaIdentifier)
  {
    [v10 encodeObject:personaIdentifier forKey:@"personaIdentifier"];
    v5 = v10;
  }
  volumeUUID = self->_volumeUUID;
  if (volumeUUID)
  {
    [v10 encodeObject:volumeUUID forKey:@"_volumeUUID"];
    v5 = v10;
  }
  [v5 encodeBool:self->_isEnterpriseDomain forKey:@"_isEnterpriseDomain"];
  [v10 encodeBool:self->_isDataSeparatedDomain forKey:@"_isDataSeparatedDomain"];
  [v10 encodeBool:self->_disconnected forKey:@"_disconnected"];
  [v10 encodeObject:self->_disconnectionReason forKey:@"_disconnectionReason"];
  [v10 encodeInteger:self->_disconnectionOptions forKey:@"_disconnectionOptions"];
  v8 = [(NSError *)self->_error fp_strippedError];
  [v10 encodeObject:v8 forKey:@"_error"];

  [v10 encodeObject:self->_userInfo forKey:@"_userInfo"];
  [v10 encodeBool:self->_userEnabled forKey:@"_userEnabled"];
  [v10 encodeBool:self->_replicated forKey:@"_replicated"];
  [v10 encodeInteger:self->_testingModes forKey:@"_testingModes"];
  [v10 encodeBool:self->_supportsSyncingTrash forKey:@"_supportsSyncingTrash"];
  [v10 encodeBool:self->_supportsSearch forKey:@"_supportsSearch"];
  v9 = self;
  objc_sync_enter(v9);
  [v10 encodeObject:v9->_backingStoreIdentity forKey:@"_backingStoreIdentity"];
  objc_sync_exit(v9);

  [v10 encodeBool:v9->_hiddenByUser forKey:@"_hiddenByUser"];
  [v10 encodeInteger:v9->_supportedKnownFolders forKey:@"_supportedKnownFolders"];
  [v10 encodeInteger:v9->_replicatedKnownFolders forKey:@"_replicatedKnownFolders"];
  [v10 encodeBool:v9->_supportsRemoteVersions forKey:@"_supportsRemoteVersions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isReplicated
{
  return self->_replicated;
}

- (NSFileProviderDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NSFileProviderDomain;
  v5 = [(NSFileProviderDomain *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pathRelativeToDocumentStorage"];
    pathRelativeToDocumentStorage = v5->_pathRelativeToDocumentStorage;
    v5->_pathRelativeToDocumentStorage = (NSString *)v10;

    v5->_hidden = [v4 decodeBoolForKey:@"_hidden"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_spotlightDomainIdentifier"];
    spotlightDomainIdentifier = v5->_spotlightDomainIdentifier;
    v5->_spotlightDomainIdentifier = (NSString *)v12;

    v5->_containsPhotos = [v4 decodeBoolForKey:@"_containsPhotos"];
    v5->_readOnly = [v4 decodeBoolForKey:@"_readOnly"];
    v5->_erasable = [v4 decodeBoolForKey:@"_erasable"];
    v5->_isContentManaged = [v4 decodeBoolForKey:@"_isContentManaged"];
    v5->_isEnterpriseDomain = [v4 decodeBoolForKey:@"_isEnterpriseDomain"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaIdentifier"];
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v14;

    v5->_isDataSeparatedDomain = [v4 decodeBoolForKey:@"_isDataSeparatedDomain"];
    v5->_disconnected = [v4 decodeBoolForKey:@"_disconnected"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_disconnectionReason"];
    disconnectionReason = v5->_disconnectionReason;
    v5->_disconnectionReason = (NSString *)v16;

    v5->_disconnectionOptions = [v4 decodeIntegerForKey:@"_disconnectionOptions"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v18;

    v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    v21 = +[NSFileProviderDomain _userInfoAllowedClasses];
    uint64_t v22 = [v4 decodeDictionaryWithKeysOfClasses:v20 objectsOfClasses:v21 forKey:@"_userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v22;

    v5->_userEnabled = [v4 decodeBoolForKey:@"_userEnabled"];
    v5->_replicated = [v4 decodeBoolForKey:@"_replicated"];
    v5->_testingModes = [v4 decodeIntegerForKey:@"_testingModes"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStoreIdentity"];
    backingStoreIdentity = v5->_backingStoreIdentity;
    v5->_backingStoreIdentity = (NSData *)v24;

    v5->_supportsSyncingTrash = [v4 decodeBoolForKey:@"_supportsSyncingTrash"];
    v5->_supportsSearch = [v4 decodeBoolForKey:@"_supportsSearch"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_volumeUUID"];
    volumeUUID = v5->_volumeUUID;
    v5->_volumeUUID = (NSUUID *)v26;

    v5->_hiddenByUser = [v4 decodeBoolForKey:@"_hiddenByUser"];
    v5->_supportedKnownFolders = [v4 decodeIntegerForKey:@"_supportedKnownFolders"];
    v5->_replicatedKnownFolders = [v4 decodeIntegerForKey:@"_replicatedKnownFolders"];
    v5->_supportsRemoteVersions = [v4 decodeBoolForKey:@"_supportsRemoteVersions"];
  }

  return v5;
}

+ (id)_userInfoAllowedClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isEnterpriseDomain
{
  return self->_isEnterpriseDomain;
}

- (BOOL)isDataSeparatedDomain
{
  return self->_isDataSeparatedDomain;
}

- (id)description
{
  v28 = NSString;
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = [(NSString *)self->_displayName fp_obfuscatedFilename];
  v25 = [(NSString *)self->_identifier fp_obfuscatedFilename];
  uint64_t v3 = [(NSUUID *)self->_volumeUUID fp_UUID];
  if (self->_userEnabled) {
    uint64_t v4 = @"enabled";
  }
  else {
    uint64_t v4 = @"disabled";
  }
  v23 = v4;
  uint64_t v24 = (void *)v3;
  if (self->_hidden) {
    uint64_t v5 = @",hidden";
  }
  else {
    uint64_t v5 = &stru_1EF68D1F8;
  }
  if (self->_hiddenByUser) {
    uint64_t v6 = @",hiddenByUser";
  }
  else {
    uint64_t v6 = &stru_1EF68D1F8;
  }
  v21 = v6;
  uint64_t v22 = v5;
  if (self->_disconnected) {
    v7 = @",disconnected";
  }
  else {
    v7 = &stru_1EF68D1F8;
  }
  v20 = v7;
  if (self->_replicated) {
    uint64_t v8 = @",replicated";
  }
  else {
    uint64_t v8 = &stru_1EF68D1F8;
  }
  if (self->_supportsSyncingTrash) {
    v9 = @",syncTrash";
  }
  else {
    v9 = &stru_1EF68D1F8;
  }
  if (self->_supportsSearch) {
    uint64_t v10 = @",search";
  }
  else {
    uint64_t v10 = &stru_1EF68D1F8;
  }
  if (self->_supportsRemoteVersions) {
    v11 = @",remoteVersions";
  }
  else {
    v11 = &stru_1EF68D1F8;
  }
  if (self->_userInfo) {
    uint64_t v12 = @",userInfo";
  }
  else {
    uint64_t v12 = &stru_1EF68D1F8;
  }
  unint64_t testingModes = self->_testingModes;
  if (testingModes) {
    uint64_t v14 = @",test:alwaysEnabled";
  }
  else {
    uint64_t v14 = &stru_1EF68D1F8;
  }
  if ((testingModes & 2) != 0) {
    v15 = @",test:interactive";
  }
  else {
    v15 = &stru_1EF68D1F8;
  }
  uint64_t v16 = FPKnownFoldersDescription(@" supportedKF:", self->_supportedKnownFolders);
  v17 = FPKnownFoldersDescription(@" replicatedKF:", self->_replicatedKnownFolders);
  objc_msgSend(v28, "stringWithFormat:", @"<%@: %p, %@ id=%@ vid=%@ (%@%@%@%@%@%@%@%@%@%@%@)%@%@>", v27, self, v26, v25, v24, v23, v22, v21, v20, v8, v9, v10, v11, v12, v14, v15,
    v16,
  uint64_t v18 = v17);

  return v18;
}

- (NSFileProviderDomainTestingModes)testingModes
{
  return self->_testingModes;
}

- (NSData)backingStoreIdentity
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_backingStoreIdentity;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)replicatedKnownFolders
{
  return self->_replicatedKnownFolders;
}

- (BOOL)isErasable
{
  return self->_erasable;
}

- (NSFileProviderDomainIdentifier)identifier
{
  return (NSFileProviderDomainIdentifier)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)supportsSyncingTrash
{
  return self->_supportsSyncingTrash;
}

- (BOOL)supportsSearch
{
  return self->_supportsSearch;
}

- (BOOL)supportsRemoteVersions
{
  return self->_supportsRemoteVersions;
}

- (BOOL)isHiddenByUser
{
  return self->_hiddenByUser;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (NSString)pathRelativeToDocumentStorage
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIsEnterpriseDomain:(BOOL)a3
{
  self->_isEnterpriseDomain = a3;
}

- (void)setIsDataSeparatedDomain:(BOOL)a3
{
  self->_isDataSeparatedDomain = a3;
}

- (void)copyValuesFromExistingDomain:(id)a3
{
  id v4 = a3;
  self->_userEnabled = [v4 userEnabled];
  uint64_t v5 = [v4 personaIdentifier];
  personaIdentifier = self->_personaIdentifier;
  self->_personaIdentifier = v5;

  self->_isContentManaged = [v4 isContentManaged];
  self->_isEnterpriseDomain = [v4 isEnterpriseDomain];
  self->_isDataSeparatedDomain = [v4 isDataSeparatedDomain];
  v7 = [v4 volumeUUID];
  volumeUUID = self->_volumeUUID;
  self->_volumeUUID = v7;

  self->_hiddenByUser = [v4 isHiddenByUser];
  v9 = [v4 spotlightDomainIdentifier];
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  self->_spotlightDomainIdentifier = v9;

  unint64_t v11 = [v4 replicatedKnownFolders];
  self->_replicatedKnownFolders = v11;
}

- (BOOL)userEnabled
{
  return self->_userEnabled;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (NSString)spotlightDomainIdentifier
{
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  if (!spotlightDomainIdentifier) {
    spotlightDomainIdentifier = self->_identifier;
  }
  return spotlightDomainIdentifier;
}

- (id)plistDictionary
{
  v35[7] = *MEMORY[0x1E4F143B8];
  v34[0] = @"DisplayName";
  v34[1] = @"Path";
  pathRelativeToDocumentStorage = self->_pathRelativeToDocumentStorage;
  v35[0] = self->_displayName;
  v35[1] = pathRelativeToDocumentStorage;
  v34[2] = @"Hidden";
  id v4 = [NSNumber numberWithBool:self->_hidden];
  v35[2] = v4;
  v34[3] = @"Replicated";
  uint64_t v5 = [NSNumber numberWithBool:self->_replicated];
  v35[3] = v5;
  v34[4] = @"SupportsSyncingTrash";
  uint64_t v6 = [NSNumber numberWithBool:self->_supportsSyncingTrash];
  v35[4] = v6;
  v34[5] = @"SupportsSearch";
  v7 = [NSNumber numberWithBool:self->_supportsSearch];
  v35[5] = v7;
  v34[6] = @"SupportsRemoteVersions";
  uint64_t v8 = [NSNumber numberWithBool:self->_supportsRemoteVersions];
  v35[6] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:7];

  uint64_t v10 = (void *)[v9 mutableCopy];
  if (self->_containsPhotos)
  {
    unint64_t v11 = [NSNumber numberWithBool:1];
    [v10 setObject:v11 forKeyedSubscript:@"ContainsPhotos"];
  }
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  if (spotlightDomainIdentifier) {
    [v10 setObject:spotlightDomainIdentifier forKeyedSubscript:@"SpotlightDomain"];
  }
  if (self->_readOnly)
  {
    v13 = [NSNumber numberWithBool:1];
    [v10 setObject:v13 forKeyedSubscript:@"ReadOnly"];
  }
  if (self->_erasable)
  {
    uint64_t v14 = [NSNumber numberWithBool:1];
    [v10 setObject:v14 forKeyedSubscript:@"Erasable"];
  }
  if (self->_isContentManaged)
  {
    v15 = [NSNumber numberWithBool:1];
    [v10 setObject:v15 forKeyedSubscript:@"IsContentManaged"];
  }
  error = self->_error;
  if (error)
  {
    id v33 = 0;
    v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:error requiringSecureCoding:1 error:&v33];
    id v18 = v33;
    if (!v17)
    {
      v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[NSFileProviderDomain plistDictionary]();
      }
    }
    [v10 setObject:v17 forKeyedSubscript:@"Error"];
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    id v32 = 0;
    v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:userInfo requiringSecureCoding:1 error:&v32];
    id v22 = v32;
    if (!v21)
    {
      v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[NSFileProviderDomain plistDictionary]();
      }
    }
    [v10 setObject:v21 forKeyedSubscript:@"UserInfo"];
  }
  if (self->_disconnected)
  {
    uint64_t v24 = [NSNumber numberWithBool:1];
    [v10 setObject:v24 forKeyedSubscript:@"Disconnected"];
  }
  disconnectionReason = self->_disconnectionReason;
  if (disconnectionReason) {
    [v10 setObject:disconnectionReason forKeyedSubscript:@"DisconnectionReason"];
  }
  if (self->_disconnectionOptions)
  {
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v10 setObject:v26 forKeyedSubscript:@"DisconnectionOptions"];
  }
  if (self->_testingModes)
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v10 setObject:v27 forKeyedSubscript:@"TestingModes"];
  }
  if (self->_hiddenByUser)
  {
    v28 = [NSNumber numberWithBool:1];
    [v10 setObject:v28 forKeyedSubscript:@"UserHidden"];
  }
  if (self->_supportedKnownFolders)
  {
    objc_super v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v10 setObject:v29 forKeyedSubscript:@"SupportedKnownFolders"];
  }
  if (self->_replicatedKnownFolders)
  {
    v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v10 setObject:v30 forKeyedSubscript:@"ReplicatedKnownFolders"];
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_disconnectionReason, 0);
  objc_storeStrong((id *)&self->_symLinkName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_pathRelativeToDocumentStorage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);

  objc_storeStrong((id *)&self->_backingStoreIdentity, 0);
}

- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 pathRelativeToDocumentStorage:(id)a5 hidden:(BOOL)a6
{
  LOBYTE(v7) = 0;
  return [(NSFileProviderDomain *)self initWithIdentifier:a3 displayName:a4 userInfo:MEMORY[0x1E4F1CC08] volumeURL:0 pathRelativeToDocumentStorage:a5 hidden:a6 replicated:v7];
}

- (NSFileProviderDomain)initWithIdentifier:(NSFileProviderDomainIdentifier)identifier displayName:(NSString *)displayName pathRelativeToDocumentStorage:(NSString *)pathRelativeToDocumentStorage
{
  LOBYTE(v6) = 0;
  return [(NSFileProviderDomain *)self initWithIdentifier:identifier displayName:displayName userInfo:MEMORY[0x1E4F1CC08] volumeURL:0 pathRelativeToDocumentStorage:pathRelativeToDocumentStorage hidden:0 replicated:v6];
}

- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 userInfo:(id)a5 volumeURL:(id)a6 pathRelativeToDocumentStorage:(id)a7 hidden:(BOOL)a8 replicated:(BOOL)a9
{
  id v16 = a3;
  id v28 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)NSFileProviderDomain;
  v20 = [(NSFileProviderDomain *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_displayName, a4);
    objc_storeStrong((id *)&v21->_pathRelativeToDocumentStorage, a7);
    v21->_hidden = a8;
    objc_storeStrong((id *)&v21->_userInfo, a5);
    if (v18)
    {
      id v22 = objc_msgSend(v18, "fp_volumeUUID");
      v23 = v22;
      if (v22) {
        uint64_t v24 = v22;
      }
      else {
        uint64_t v24 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
      }
      volumeUUID = v21->_volumeUUID;
      v21->_volumeUUID = v24;
    }
    char v26 = 1;
    if (!a9) {
      char v26 = [v19 isEqualToString:@"FPFS_SHOULD_NOT_BE_USED"];
    }
    v21->_replicated = v26;
    v21->_supportsSyncingTrash = 1;
    *(_WORD *)&v21->_supportsSearch = 0;
  }

  return v21;
}

- (void)setBackingStoreIdentity:(id)a3
{
  id v4 = (NSData *)a3;
  obj = self;
  objc_sync_enter(obj);
  backingStoreIdentity = obj->_backingStoreIdentity;
  obj->_backingStoreIdentity = v4;

  objc_sync_exit(obj);
}

- (NSFileProviderDomain)initWithIdentifier:(NSFileProviderDomainIdentifier)identifier displayName:(NSString *)displayName
{
  LOBYTE(v5) = 1;
  return [(NSFileProviderDomain *)self initWithIdentifier:identifier displayName:displayName userInfo:MEMORY[0x1E4F1CC08] volumeURL:0 pathRelativeToDocumentStorage:@"FPFS_SHOULD_NOT_BE_USED" hidden:0 replicated:v5];
}

- (NSFileProviderDomain)initWithDisplayName:(id)a3 userInfo:(id)a4 volumeURL:(id)a5
{
  uint64_t v8 = NSString;
  v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 UUID];
  uint64_t v14 = [v13 UUIDString];
  v15 = [v8 stringWithFormat:@"%@%@", @"NSFPExternal-", v14];

  LOBYTE(v18) = 1;
  id v16 = [(NSFileProviderDomain *)self initWithIdentifier:v15 displayName:v12 userInfo:v11 volumeURL:v10 pathRelativeToDocumentStorage:@"FPFS_SHOULD_NOT_BE_USED" hidden:0 replicated:v18];

  return v16;
}

- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 userInfo:(id)a5 volumeURL:(id)a6
{
  LOBYTE(v7) = 1;
  return [(NSFileProviderDomain *)self initWithIdentifier:a3 displayName:a4 userInfo:a5 volumeURL:a6 pathRelativeToDocumentStorage:@"FPFS_SHOULD_NOT_BE_USED" hidden:0 replicated:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

+ (id)domainFromPlistDictionary:(id)a3 identifier:(id)a4 volumeURL:(id)a5 replicatedByDefault:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 isEqualToString:@"NSFileProviderDomainDefaultIdentifier"])
  {
    v13 = 0;
  }
  else
  {
    v51 = [v10 objectForKeyedSubscript:@"DisplayName"];
    uint64_t v14 = [v10 objectForKeyedSubscript:@"Path"];
    v60 = [v10 objectForKeyedSubscript:@"Hidden"];
    v15 = [v10 objectForKeyedSubscript:@"Replicated"];
    id v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [NSNumber numberWithBool:v6];
    }
    v59 = v17;

    v56 = [v10 objectForKeyedSubscript:@"ContainsPhotos"];
    v50 = [v10 objectForKeyedSubscript:@"ReadOnly"];
    v55 = [v10 objectForKeyedSubscript:@"Erasable"];
    v54 = [v10 objectForKeyedSubscript:@"IsContentManaged"];
    v58 = [v10 objectForKeyedSubscript:@"Error"];
    uint64_t v18 = [v10 objectForKeyedSubscript:@"Disconnected"];
    v46 = [v10 objectForKeyedSubscript:@"DisconnectionReason"];
    v45 = [v10 objectForKeyedSubscript:@"DisconnectionOptions"];
    v53 = [v10 objectForKeyedSubscript:@"TestingModes"];
    v49 = [v10 objectForKeyedSubscript:@"SupportsSyncingTrash"];
    v48 = [v10 objectForKeyedSubscript:@"SupportsSearch"];
    uint64_t v19 = [v10 objectForKeyedSubscript:@"UserHidden"];
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x1E4F1CC28];
    if (v19) {
      v21 = (void *)v19;
    }
    id v22 = v21;

    v52 = [v10 objectForKeyedSubscript:@"SpotlightDomain"];
    v23 = [v10 objectForKeyedSubscript:@"UserInfo"];
    v57 = [v10 objectForKeyedSubscript:@"SupportedKnownFolders"];
    uint64_t v24 = [v10 objectForKeyedSubscript:@"ReplicatedKnownFolders"];
    v47 = [v10 objectForKeyedSubscript:@"SupportsRemoteVersions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v25 = (void *)v14;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v52 = 0;
        }
        objc_opt_class();
        v44 = v18;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v56 = 0;
        }
        objc_opt_class();
        v25 = (void *)v14;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v55 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v54 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v58 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v23 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v44 = 0;
        }
        objc_opt_class();
        char v26 = v57;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v53 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          char v26 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v24 = 0;
        }
        v57 = v26;
        id v27 = objc_alloc((Class)a1);
        uint64_t v28 = [v60 BOOLValue];
        LOBYTE(v38) = [v59 BOOLValue];
        v13 = (void *)[v27 initWithIdentifier:v11 displayName:v51 userInfo:MEMORY[0x1E4F1CC08] volumeURL:v12 pathRelativeToDocumentStorage:v14 hidden:v28 replicated:v38];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v29 = [v49 BOOLValue];
        }
        else {
          uint64_t v29 = 1;
        }
        [v13 setSupportsSyncingTrash:v29];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v31 = [v48 BOOLValue];
        }
        else {
          uint64_t v31 = 0;
        }
        [v13 setSupportsSearch:v31];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v32 = [v47 BOOLValue];
        }
        else {
          uint64_t v32 = 0;
        }
        uint64_t v18 = v44;
        [v13 setSupportsRemoteVersions:v32];
        [v13 setSpotlightDomainIdentifier:v52];
        if (v56) {
          objc_msgSend(v13, "setContainsPhotos:", objc_msgSend(v56, "BOOLValue"));
        }
        if (v50) {
          objc_msgSend(v13, "setReadOnly:", objc_msgSend(v50, "BOOLValue"));
        }
        if (v55) {
          objc_msgSend(v13, "setErasable:", objc_msgSend(v55, "BOOLValue"));
        }
        if (v54) {
          objc_msgSend(v13, "setIsContentManaged:", objc_msgSend(v54, "BOOLValue"));
        }
        objc_msgSend(v13, "setHiddenByUser:", objc_msgSend(v22, "BOOLValue"));
        objc_msgSend(v13, "setSupportedKnownFolders:", objc_msgSend(v57, "unsignedIntegerValue"));
        objc_msgSend(v13, "setReplicatedKnownFolders:", objc_msgSend(v24, "unsignedIntegerValue"));
        if (v58)
        {
          v61[0] = 0;
          id v33 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v58 error:v61];
          id v41 = v61[0];
          if (!v33)
          {
            v34 = fp_current_or_default_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              +[NSFileProviderDomain domainFromPlistDictionary:identifier:volumeURL:replicatedByDefault:]((uint64_t)v41, v34);
            }

            id v33 = 0;
          }
          [v13 setError:v33];
        }
        if (v23)
        {
          v42 = (void *)MEMORY[0x1E4F28DC0];
          v39 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
          v35 = +[NSFileProviderDomain _userInfoAllowedClasses];
          uint64_t v43 = objc_msgSend(v42, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v39);
          id v40 = 0;

          v36 = (void *)v43;
          if (!v43)
          {
            v37 = fp_current_or_default_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              +[NSFileProviderDomain domainFromPlistDictionary:identifier:volumeURL:replicatedByDefault:]((uint64_t)v40, v37);
            }

            v36 = 0;
          }
          [v13 setUserInfo:v36];
        }
        if (v44)
        {
          objc_msgSend(v13, "setDisconnected:", objc_msgSend(v44, "BOOLValue"));
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v13 _setDisconnectionReason:v46];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v13, "_setDisconnectionOptions:", objc_msgSend(v45, "intValue") & 1);
          }
        }
        if (v53) {
          objc_msgSend(v13, "setTestingModes:", objc_msgSend(v53, "unsignedIntegerValue"));
        }
        if (v59) {
          objc_msgSend(v13, "setReplicated:", objc_msgSend(v59, "BOOLValue"));
        }
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      v25 = (void *)v14;
    }
  }

  return v13;
}

- (void)setUserInfo:(id)a3
{
  BOOL v6 = (NSDictionary *)a3;
  p_userInfo = &self->_userInfo;
  if (self->_userInfo != v6)
  {
    uint64_t v8 = +[NSFileProviderDomain _userInfoAllowedClasses];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__NSFileProviderDomain_setUserInfo___block_invoke;
    v10[3] = &unk_1E5AF6548;
    id v11 = v8;
    SEL v12 = a2;
    v10[4] = self;
    id v9 = v8;
    [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v10];
    objc_storeStrong((id *)p_userInfo, a3);
  }
}

void __36__NSFileProviderDomain_setUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"NSFileProviderDomain.m", 683, @"userInfo keys must be strings, key %@ is %@", v5, objc_opt_class() object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8)
  {

LABEL_13:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"NSFileProviderDomain.m", 691, @"userInfo values must be of classes %@, %@ is %@", *(void *)(a1 + 40), v6, objc_opt_class() object file lineNumber description];

    goto LABEL_14;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  uint64_t v11 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v7);
      }
      v10 |= objc_opt_isKindOfClass();
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v9);

  if ((v10 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)setSpotlightDomainIdentifier:(id)a3
{
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (void)setUserEnabled:(BOOL)a3
{
  self->_userEnabled = a3;
}

- (void)setReplicated:(BOOL)a3
{
  self->_replicated = a3;
}

- (void)setTestingModes:(NSFileProviderDomainTestingModes)testingModes
{
  self->_unint64_t testingModes = testingModes;
}

- (void)setSupportsSyncingTrash:(BOOL)supportsSyncingTrash
{
  self->_supportsSyncingTrash = supportsSyncingTrash;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setReplicatedKnownFolders:(unint64_t)a3
{
  self->_replicatedKnownFolders = a3;
}

- (void)setSupportedKnownFolders:(unint64_t)a3
{
  self->_supportedKnownFolders = a3;
}

- (NSString)symLinkName
{
  return self->_symLinkName;
}

- (void)setSymLinkName:(id)a3
{
}

- (BOOL)containsPhotos
{
  return self->_containsPhotos;
}

- (void)setContainsPhotos:(BOOL)a3
{
  self->_containsPhotos = a3;
}

- (NSString)_disconnectionReason
{
  return self->_disconnectionReason;
}

- (void)_setDisconnectionReason:(id)a3
{
}

- (unint64_t)_disconnectionOptions
{
  return self->_disconnectionOptions;
}

- (void)_setDisconnectionOptions:(unint64_t)a3
{
  self->_disconnectionOptions = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isEjectable
{
  return self->_ejectable;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (void)setDomainUserInfo:(id)a3
{
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void)setErasable:(BOOL)a3
{
  self->_erasable = a3;
}

- (void)setHiddenByUser:(BOOL)a3
{
  self->_hiddenByUser = a3;
}

- (BOOL)owningApplicationIsHidden
{
  return self->_owningApplicationIsHidden;
}

- (void)setOwningApplicationIsHidden:(BOOL)a3
{
  self->_owningApplicationIsHidden = a3;
}

- (void)setSupportsSearch:(BOOL)a3
{
  self->_supportsSearch = a3;
}

- (void)setSupportsRemoteVersions:(BOOL)a3
{
  self->_supportsRemoteVersions = a3;
}

- (void)plistDictionary
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v0, v1, "[ERROR] Failed to archive domain error %@: %@");
}

+ (void)domainFromPlistDictionary:(uint64_t)a1 identifier:(NSObject *)a2 volumeURL:replicatedByDefault:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to unarchive domain userInfo %@", (uint8_t *)&v2, 0xCu);
}

+ (void)domainFromPlistDictionary:(uint64_t)a1 identifier:(NSObject *)a2 volumeURL:replicatedByDefault:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to unarchive domain error %@", (uint8_t *)&v2, 0xCu);
}

@end