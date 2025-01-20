@interface UARPAssetID
+ (BOOL)supportsSecureCoding;
- (BOOL)analyticsIsEqual:(id)a3;
- (BOOL)deploymentAllowed;
- (BOOL)isDeploymentAllowed;
- (BOOL)isDynamicAsset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStagingInProgressOnAccessoryID:(id)a3;
- (BOOL)isUrgentUpdate;
- (BOOL)reportProgressToDelegates;
- (BOOL)signatureValidationNeeded;
- (NSArray)deploymentRules;
- (NSDate)assetReleaseDate;
- (NSNumber)firmwareFileSize;
- (NSNumber)releaseNotesFileSize;
- (NSString)assetVersion;
- (NSString)firmwareHash;
- (NSString)localPath;
- (NSString)modelNumber;
- (NSString)releaseDate;
- (NSString)releaseNotesLocalPath;
- (NSString)releaseNotesRemotePath;
- (NSString)remotePath;
- (NSURL)localURL;
- (NSURL)releaseNotesLocalURL;
- (NSURL)releaseNotesRemoteURL;
- (NSURL)remoteURL;
- (NSURL)tatsuServerURL;
- (UARPAssetID)initWithCoder:(id)a3;
- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 filePath:(id)a5;
- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 url:(id)a5;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4 releaseNotesRemotePath:(id)a5;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4;
- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4 releaseNotesRemoteURL:(id)a5;
- (UARPAssetTag)tag;
- (const)typeString;
- (id)_createUARPDeploymentRules:(id)a3;
- (id)assetVersionNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deploymentDay;
- (id)deploymentPercent;
- (id)description;
- (id)downstreamAssetIDs;
- (id)rawDescription;
- (id)remoteBuildManifestPlistPath;
- (int64_t)downloadStatus;
- (int64_t)releaseNotesAvailabilityStatus;
- (int64_t)releaseNotesDownloadStatus;
- (int64_t)type;
- (int64_t)updateAvailabilityStatus;
- (int64_t)validationStatus;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)processUARPDeploymentRules:(id)a3;
- (void)restoreDefaultStatus;
- (void)setAssetReleaseDate:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setAssetVersionNumber:(id)a3;
- (void)setDeploymentAllowed:(BOOL)a3;
- (void)setDeploymentDay:(id)a3;
- (void)setDeploymentPercent:(id)a3;
- (void)setDeploymentRules:(id)a3;
- (void)setDownloadStatus:(int64_t)a3;
- (void)setFirmwareFileSize:(id)a3;
- (void)setFirmwareHash:(id)a3;
- (void)setIsUrgentUpdate:(BOOL)a3;
- (void)setLocalPath:(id)a3;
- (void)setLocalURL:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseNotesAvailabilityStatus:(int64_t)a3;
- (void)setReleaseNotesDownloadStatus:(int64_t)a3;
- (void)setReleaseNotesFileSize:(id)a3;
- (void)setReleaseNotesLocalPath:(id)a3;
- (void)setReleaseNotesLocalURL:(id)a3;
- (void)setReleaseNotesRemotePath:(id)a3;
- (void)setReleaseNotesRemoteURL:(id)a3;
- (void)setRemoteBuildManifestPlistPath:(id)a3;
- (void)setRemotePath:(id)a3;
- (void)setRemoteURL:(id)a3;
- (void)setReportProgressToDelegates:(BOOL)a3;
- (void)setSignatureValidationNeeded:(BOOL)a3;
- (void)setTag:(id)a3;
- (void)setTatsuServerURL:(id)a3;
- (void)setUpdateAvailabilityStatus:(int64_t)a3;
- (void)setValidationStatus:(int64_t)a3;
- (void)stagingCompleteOnAccessoryID:(id)a3;
- (void)stagingStartedOnAccessoryID:(id)a3;
@end

@implementation UARPAssetID

- (BOOL)analyticsIsEqual:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UARPAssetID *)self type];
  if (v5 == [v4 type])
  {
    v6 = [(UARPAssetID *)self remoteURL];
    v7 = [v4 remoteURL];
    if ([v6 isEqual:v7])
    {
      v8 = [(UARPAssetID *)self assetVersion];
      v9 = [v4 assetVersion];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4
{
  v6 = [NSURL URLWithString:a4];
  v7 = [(UARPAssetID *)self initWithLocationType:a3 remoteURL:v6];

  return v7;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 filePath:(id)a5
{
  v8 = NSURL;
  id v9 = a4;
  char v10 = [v8 URLWithString:a5];
  v11 = [(UARPAssetID *)self initWithLocationType:a3 assetTag:v9 url:v10];

  return v11;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 assetTag:(id)a4 url:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = [(UARPAssetID *)self initWithLocationType:a3 remoteURL:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tag, a4);
    uint64_t v13 = [v10 copy];
    localURL = v12->_localURL;
    v12->_localURL = (NSURL *)v13;
  }
  return v12;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UARPAssetID;
  v7 = [(UARPAssetID *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_downloadStatus = 0;
    v7->_updateAvailabilityStatus = 0;
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "assetID");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    v8->_signatureValidationNeeded = 1;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeAccessoriesForStaging = v8->_activeAccessoriesForStaging;
    v8->_activeAccessoriesForStaging = v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    downstreamAssetIDs = v8->_downstreamAssetIDs;
    v8->_downstreamAssetIDs = v13;

    v8->_reportProgressToDelegates = 1;
    v8->_deploymentAllowed = 1;
    uint64_t v15 = [v6 copy];
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = (NSURL *)v15;

    if (!v6)
    {
      uint64_t v17 = UARPAssetLocationTypeToURL(v8->_type);
      v18 = v8->_remoteURL;
      v8->_remoteURL = (NSURL *)v17;
    }
  }

  return v8;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remotePath:(id)a4 releaseNotesRemotePath:(id)a5
{
  id v8 = a5;
  os_log_t v9 = [(UARPAssetID *)self initWithLocationType:a3 remotePath:a4];
  id v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [NSURL URLWithString:v8];
    releaseNotesRemoteURL = v10->_releaseNotesRemoteURL;
    v10->_releaseNotesRemoteURL = (NSURL *)v11;
  }
  return v10;
}

- (UARPAssetID)initWithLocationType:(int64_t)a3 remoteURL:(id)a4 releaseNotesRemoteURL:(id)a5
{
  id v8 = a5;
  os_log_t v9 = [(UARPAssetID *)self initWithLocationType:a3 remoteURL:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    releaseNotesRemoteURL = v9->_releaseNotesRemoteURL;
    v9->_releaseNotesRemoteURL = (NSURL *)v10;
  }
  return v9;
}

- (UARPAssetID)initWithCoder:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)UARPAssetID;
  int64_t v5 = [(UARPAssetID *)&v50 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteURL"];
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersionNumber"];
    assetVersionNumber = v5->_assetVersionNumber;
    v5->_assetVersionNumber = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteBuildManifestPlistPath"];
    remoteBuildManifestPlistPath = v5->_remoteBuildManifestPlistPath;
    v5->_remoteBuildManifestPlistPath = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localURL"];
    localURL = v5->_localURL;
    v5->_localURL = (NSURL *)v14;

    v5->_downloadStatus = [v4 decodeIntegerForKey:@"downloadStatus"];
    v5->_updateAvailabilityStatus = [v4 decodeIntegerForKey:@"updateAvailabilityStatus"];
    v5->_releaseNotesDownloadStatus = [v4 decodeIntegerForKey:@"releaseNotesDownloadStatus"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesRemoteURL"];
    releaseNotesRemoteURL = v5->_releaseNotesRemoteURL;
    v5->_releaseNotesRemoteURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesLocalURL"];
    releaseNotesLocalURL = v5->_releaseNotesLocalURL;
    v5->_releaseNotesLocalURL = (NSURL *)v18;

    v5->_releaseNotesAvailabilityStatus = [v4 decodeIntegerForKey:@"releaseNotesAvailabilityStatus"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesFileSize"];
    releaseNotesFileSize = v5->_releaseNotesFileSize;
    v5->_releaseNotesFileSize = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareFileSize"];
    firmwareFileSize = v5->_firmwareFileSize;
    v5->_firmwareFileSize = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetReleaseDate"];
    assetReleaseDate = v5->_assetReleaseDate;
    v5->_assetReleaseDate = (NSDate *)v24;

    v5->_deploymentAllowed = [v4 decodeBoolForKey:@"deploymentAllowed"];
    v5->_signatureValidationNeeded = [v4 decodeBoolForKey:@"signatureValidationNeeded"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (UARPAssetTag *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firmwareHash"];
    firmwareHash = v5->_firmwareHash;
    v5->_firmwareHash = (NSString *)v28;

    v5->_reportProgressToDelegates = [v4 decodeBoolForKey:@"reportProgressToDelegates"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelNumber"];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
    v34 = [v32 setWithArray:v33];

    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"downstreamAssetIDs"];
    downstreamAssetIDs = v5->_downstreamAssetIDs;
    v5->_downstreamAssetIDs = (NSMutableArray *)v35;

    if (!v5->_downstreamAssetIDs)
    {
      v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v38 = v5->_downstreamAssetIDs;
      v5->_downstreamAssetIDs = v37;
    }
    v39 = (void *)MEMORY[0x263EFFA08];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    v41 = [v39 setWithArray:v40];

    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"activeAccessoriesForStaging"];
    activeAccessoriesForStaging = v5->_activeAccessoriesForStaging;
    v5->_activeAccessoriesForStaging = (NSMutableArray *)v42;

    v44 = (void *)MEMORY[0x263EFFA08];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
    v46 = [v44 setWithArray:v45];

    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"deploymentRules"];
    deploymentRules = v5->_deploymentRules;
    v5->_deploymentRules = (NSArray *)v47;

    v5->_isUrgentUpdate = [v4 decodeBoolForKey:@"isUrgentUpdate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_remoteURL forKey:@"remoteURL"];
  [v5 encodeObject:self->_assetVersion forKey:@"assetVersion"];
  [v5 encodeObject:self->_assetVersionNumber forKey:@"assetVersionNumber"];
  [v5 encodeObject:self->_remoteBuildManifestPlistPath forKey:@"remoteBuildManifestPlistPath"];
  [v5 encodeObject:self->_localURL forKey:@"localURL"];
  [v5 encodeInteger:self->_downloadStatus forKey:@"downloadStatus"];
  [v5 encodeInteger:self->_updateAvailabilityStatus forKey:@"updateAvailabilityStatus"];
  [v5 encodeInteger:self->_releaseNotesDownloadStatus forKey:@"releaseNotesDownloadStatus"];
  [v5 encodeObject:self->_releaseNotesRemoteURL forKey:@"releaseNotesRemoteURL"];
  [v5 encodeObject:self->_releaseNotesLocalURL forKey:@"releaseNotesLocalURL"];
  [v5 encodeInteger:self->_releaseNotesAvailabilityStatus forKey:@"releaseNotesAvailabilityStatus"];
  [v5 encodeObject:self->_releaseNotesFileSize forKey:@"releaseNotesFileSize"];
  [v5 encodeObject:self->_firmwareFileSize forKey:@"firmwareFileSize"];
  [v5 encodeObject:self->_assetReleaseDate forKey:@"assetReleaseDate"];
  [v5 encodeObject:self->_deploymentRules forKey:@"deploymentRules"];
  [v5 encodeBool:self->_deploymentAllowed forKey:@"deploymentAllowed"];
  [v5 encodeBool:self->_signatureValidationNeeded forKey:@"signatureValidationNeeded"];
  [v5 encodeObject:self->_tag forKey:@"tag"];
  [v5 encodeObject:self->_firmwareHash forKey:@"firmwareHash"];
  [v5 encodeObject:self->_activeAccessoriesForStaging forKey:@"activeAccessoriesForStaging"];
  [v5 encodeBool:self->_reportProgressToDelegates forKey:@"reportProgressToDelegates"];
  [v5 encodeBool:self->_isUrgentUpdate forKey:@"isUrgentUpdate"];
  [v5 encodeObject:self->_modelNumber forKey:@"modelNumber"];
  [v5 encodeObject:self->_downstreamAssetIDs forKey:@"downstreamAssetIDs"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[UARPAssetID alloc] initWithLocationType:self->_type remoteURL:self->_remoteURL];
  [(UARPAssetID *)v4 setRemoteBuildManifestPlistPath:self->_remoteBuildManifestPlistPath];
  [(UARPAssetID *)v4 setLocalURL:self->_localURL];
  [(UARPAssetID *)v4 setDownloadStatus:self->_downloadStatus];
  [(UARPAssetID *)v4 setUpdateAvailabilityStatus:self->_updateAvailabilityStatus];
  [(UARPAssetID *)v4 setAssetVersion:self->_assetVersion];
  [(UARPAssetID *)v4 setAssetVersionNumber:self->_assetVersionNumber];
  [(UARPAssetID *)v4 setReleaseNotesLocalURL:self->_releaseNotesLocalURL];
  [(UARPAssetID *)v4 setReleaseNotesRemoteURL:self->_releaseNotesRemoteURL];
  [(UARPAssetID *)v4 setReleaseNotesDownloadStatus:self->_releaseNotesDownloadStatus];
  [(UARPAssetID *)v4 setReleaseNotesAvailabilityStatus:self->_releaseNotesAvailabilityStatus];
  [(UARPAssetID *)v4 setReleaseNotesFileSize:self->_releaseNotesFileSize];
  [(UARPAssetID *)v4 setFirmwareFileSize:self->_firmwareFileSize];
  [(UARPAssetID *)v4 setAssetReleaseDate:self->_assetReleaseDate];
  [(UARPAssetID *)v4 setDeploymentRules:self->_deploymentRules];
  [(UARPAssetID *)v4 setDeploymentAllowed:self->_deploymentAllowed];
  [(UARPAssetID *)v4 setSignatureValidationNeeded:self->_signatureValidationNeeded];
  [(UARPAssetID *)v4 setTag:self->_tag];
  [(UARPAssetID *)v4 setFirmwareHash:self->_firmwareHash];
  objc_storeStrong((id *)&v4->_activeAccessoriesForStaging, self->_activeAccessoriesForStaging);
  [(UARPAssetID *)v4 setIsUrgentUpdate:self->_isUrgentUpdate];
  [(UARPAssetID *)v4 setModelNumber:self->_modelNumber];
  uint64_t v5 = [(NSMutableArray *)self->_downstreamAssetIDs mutableCopy];
  downstreamAssetIDs = v4->_downstreamAssetIDs;
  v4->_downstreamAssetIDs = (NSMutableArray *)v5;

  return v4;
}

- (void)setRemoteBuildManifestPlistPath:(id)a3
{
  self->_remoteBuildManifestPlistPath = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)remoteBuildManifestPlistPath
{
  return self->_remoteBuildManifestPlistPath;
}

- (id)downstreamAssetIDs
{
  return self->_downstreamAssetIDs;
}

- (void)restoreDefaultStatus
{
  [(NSMutableArray *)self->_downstreamAssetIDs removeAllObjects];
  self->_releaseNotesAvailabilityStatus = 0;
  self->_updateAvailabilityStatus = 0;
  self->_releaseNotesDownloadStatus = 0;
  self->_downloadStatus = 0;
  modelNumber = self->_modelNumber;
  self->_modelNumber = 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAssetID *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v37 = 1;
    }
    else
    {
      uint64_t v5 = v4;
      int64_t type = self->_type;
      if (type == [(UARPAssetID *)v5 type])
      {
        remoteURL = self->_remoteURL;
        uint64_t v8 = [(UARPAssetID *)v5 remoteURL];
        if (nullableObjectsEqual(remoteURL, (uint64_t)v8))
        {
          assetVersion = self->_assetVersion;
          uint64_t v10 = [(UARPAssetID *)v5 assetVersion];
          if (nullableObjectsEqual(assetVersion, (uint64_t)v10))
          {
            assetVersionNumber = self->_assetVersionNumber;
            uint64_t v12 = [(UARPAssetID *)v5 assetVersionNumber];
            if (nullableObjectsEqual(assetVersionNumber, (uint64_t)v12))
            {
              localURL = self->_localURL;
              uint64_t v14 = [(UARPAssetID *)v5 localURL];
              if (nullableObjectsEqual(localURL, (uint64_t)v14)
                && (int64_t downloadStatus = self->_downloadStatus,
                    downloadStatus == [(UARPAssetID *)v5 downloadStatus])
                && (int64_t updateAvailabilityStatus = self->_updateAvailabilityStatus,
                    updateAvailabilityStatus == [(UARPAssetID *)v5 updateAvailabilityStatus])
                && (int64_t releaseNotesDownloadStatus = self->_releaseNotesDownloadStatus,
                    releaseNotesDownloadStatus == [(UARPAssetID *)v5 releaseNotesDownloadStatus]))
              {
                releaseNotesRemoteURL = self->_releaseNotesRemoteURL;
                v19 = [(UARPAssetID *)v5 releaseNotesRemoteURL];
                if (nullableObjectsEqual(releaseNotesRemoteURL, (uint64_t)v19))
                {
                  releaseNotesLocalURL = self->_releaseNotesLocalURL;
                  v21 = [(UARPAssetID *)v5 releaseNotesLocalURL];
                  if (nullableObjectsEqual(releaseNotesLocalURL, (uint64_t)v21)
                    && (int64_t releaseNotesAvailabilityStatus = self->_releaseNotesAvailabilityStatus,
                        releaseNotesAvailabilityStatus == [(UARPAssetID *)v5 releaseNotesAvailabilityStatus]))
                  {
                    remoteBuildManifestPlistPath = self->_remoteBuildManifestPlistPath;
                    uint64_t v24 = [(UARPAssetID *)v5 remoteBuildManifestPlistPath];
                    v25 = remoteBuildManifestPlistPath;
                    uint64_t v26 = (void *)v24;
                    if (nullableObjectsEqual(v25, v24))
                    {
                      v46 = v26;
                      assetReleaseDate = self->_assetReleaseDate;
                      v45 = [(UARPAssetID *)v5 assetReleaseDate];
                      if (nullableObjectsEqual(assetReleaseDate, (uint64_t)v45))
                      {
                        releaseNotesFileSize = self->_releaseNotesFileSize;
                        v44 = [(UARPAssetID *)v5 releaseNotesFileSize];
                        if (nullableObjectsEqual(releaseNotesFileSize, (uint64_t)v44))
                        {
                          firmwareFileSize = self->_firmwareFileSize;
                          v43 = [(UARPAssetID *)v5 firmwareFileSize];
                          if (nullableObjectsEqual(firmwareFileSize, (uint64_t)v43))
                          {
                            deploymentRules = self->_deploymentRules;
                            uint64_t v42 = [(UARPAssetID *)v5 deploymentRules];
                            if (nullableObjectsEqual(deploymentRules, (uint64_t)v42)
                              && (BOOL deploymentAllowed = self->_deploymentAllowed,
                                  deploymentAllowed == [(UARPAssetID *)v5 deploymentAllowed]))
                            {
                              tag = self->_tag;
                              v41 = [(UARPAssetID *)v5 tag];
                              if (nullableObjectsEqual(tag, (uint64_t)v41))
                              {
                                firmwareHash = self->_firmwareHash;
                                v40 = [(UARPAssetID *)v5 firmwareHash];
                                if (nullableObjectsEqual(firmwareHash, (uint64_t)v40))
                                {
                                  modelNumber = self->_modelNumber;
                                  v39 = [(UARPAssetID *)v5 modelNumber];
                                  if (nullableObjectsEqual(modelNumber, (uint64_t)v39))
                                  {
                                    downstreamAssetIDs = self->_downstreamAssetIDs;
                                    v36 = [(UARPAssetID *)v5 downstreamAssetIDs];
                                    char v37 = nullableObjectsEqual(downstreamAssetIDs, (uint64_t)v36);
                                  }
                                  else
                                  {
                                    char v37 = 0;
                                  }
                                }
                                else
                                {
                                  char v37 = 0;
                                }
                              }
                              else
                              {
                                char v37 = 0;
                              }
                            }
                            else
                            {
                              char v37 = 0;
                            }
                          }
                          else
                          {
                            char v37 = 0;
                          }
                        }
                        else
                        {
                          char v37 = 0;
                        }
                      }
                      else
                      {
                        char v37 = 0;
                      }

                      uint64_t v26 = v46;
                    }
                    else
                    {
                      char v37 = 0;
                    }
                  }
                  else
                  {
                    char v37 = 0;
                  }
                }
                else
                {
                  char v37 = 0;
                }
              }
              else
              {
                char v37 = 0;
              }
            }
            else
            {
              char v37 = 0;
            }
          }
          else
          {
            char v37 = 0;
          }
        }
        else
        {
          char v37 = 0;
        }
      }
      else
      {
        char v37 = 0;
      }
    }
  }
  else
  {
    char v37 = 0;
  }

  return v37;
}

- (void)setReleaseNotesAvailabilityStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t releaseNotesAvailabilityStatus = a3;
  objc_sync_exit(obj);
}

- (void)setReleaseNotesRemotePath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [NSURL URLWithString:v6];
  [(UARPAssetID *)v4 setReleaseNotesRemoteURL:v5];

  objc_sync_exit(v4);
}

- (void)setReleaseNotesLocalPath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [NSURL URLWithString:v6];
  [(UARPAssetID *)v4 setReleaseNotesLocalURL:v5];

  objc_sync_exit(v4);
}

- (NSString)releaseNotesLocalPath
{
  return [(NSURL *)self->_releaseNotesLocalURL path];
}

- (void)setReleaseNotesRemoteURL:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  releaseNotesRemoteURL = v4->_releaseNotesRemoteURL;
  v4->_releaseNotesRemoteURL = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesLocalURL:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  releaseNotesLocalURL = v4->_releaseNotesLocalURL;
  v4->_releaseNotesLocalURL = (NSURL *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesDownloadStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t releaseNotesDownloadStatus = a3;
  objc_sync_exit(obj);
}

- (void)setReleaseDate:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v8)
  {
    uint64_t v5 = (NSDate *)objc_alloc_init(MEMORY[0x263F08790]);
    [(NSDate *)v5 setDateFormat:@"MM/dd/yyyy"];
    uint64_t v6 = [(NSDate *)v5 dateFromString:v8];
    assetReleaseDate = v4->_assetReleaseDate;
    v4->_assetReleaseDate = (NSDate *)v6;
  }
  else
  {
    uint64_t v5 = v4->_assetReleaseDate;
    v4->_assetReleaseDate = 0;
  }

  objc_sync_exit(v4);
}

- (NSString)releaseDate
{
  if (self->_assetReleaseDate)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08790]);
    [v3 setDateFormat:@"MM/dd/yyyy"];
    id v4 = [v3 stringFromDate:self->_assetReleaseDate];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setAssetReleaseDate:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  assetReleaseDate = v4->_assetReleaseDate;
  v4->_assetReleaseDate = (NSDate *)v5;

  objc_sync_exit(v4);
}

- (void)setReleaseNotesFileSize:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  releaseNotesFileSize = obj->_releaseNotesFileSize;
  obj->_releaseNotesFileSize = v4;

  objc_sync_exit(obj);
}

- (void)setFirmwareFileSize:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  firmwareFileSize = obj->_firmwareFileSize;
  obj->_firmwareFileSize = v4;

  objc_sync_exit(obj);
}

- (void)setAssetVersion:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  assetVersion = v4->_assetVersion;
  v4->_assetVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)assetVersionNumber
{
  return self->_assetVersionNumber;
}

- (void)setAssetVersionNumber:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  assetVersionNumber = v4->_assetVersionNumber;
  v4->_assetVersionNumber = (NSNumber *)v5;

  objc_sync_exit(v4);
}

- (void)setLocalPath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [NSURL URLWithString:v6];
  [(UARPAssetID *)v4 setLocalURL:v5];

  objc_sync_exit(v4);
}

- (NSString)localPath
{
  return [(NSURL *)self->_localURL path];
}

- (void)setLocalURL:(id)a3
{
  id v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  localURL = obj->_localURL;
  obj->_localURL = v4;

  objc_sync_exit(obj);
}

- (void)setIsUrgentUpdate:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isUrgentUpdate = a3;
  objc_sync_exit(obj);
}

- (void)setDownloadStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t downloadStatus = a3;
  objc_sync_exit(obj);
}

- (void)setUpdateAvailabilityStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t updateAvailabilityStatus = a3;
  objc_sync_exit(obj);
}

- (void)setSignatureValidationNeeded:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_signatureValidationNeeded = a3;
  objc_sync_exit(obj);
}

- (BOOL)signatureValidationNeeded
{
  return self->_signatureValidationNeeded;
}

- (void)setValidationStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_validationStatus = a3;
  objc_sync_exit(obj);
}

- (int64_t)validationStatus
{
  return self->_validationStatus;
}

- (void)setDeploymentDay:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  deploymentDay = obj->_deploymentDay;
  obj->_deploymentDay = v4;

  objc_sync_exit(obj);
}

- (id)deploymentDay
{
  return self->_deploymentDay;
}

- (void)setDeploymentPercent:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  deploymentPercent = obj->_deploymentPercent;
  obj->_deploymentPercent = v4;

  objc_sync_exit(obj);
}

- (id)deploymentPercent
{
  return self->_deploymentPercent;
}

- (void)setDeploymentAllowed:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL deploymentAllowed = a3;
  objc_sync_exit(obj);
}

- (void)setDeploymentRules:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  deploymentRules = v4->_deploymentRules;
  v4->_deploymentRules = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  tag = v4->_tag;
  v4->_tag = (UARPAssetTag *)v5;

  objc_sync_exit(v4);
}

- (void)setFirmwareHash:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  firmwareHash = v4->_firmwareHash;
  v4->_firmwareHash = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setTatsuServerURL:(id)a3
{
  id v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  tatsuServerURL = obj->_tatsuServerURL;
  obj->_tatsuServerURL = v4;

  objc_sync_exit(obj);
}

- (void)setModelNumber:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  modelNumber = obj->_modelNumber;
  obj->_modelNumber = v4;

  objc_sync_exit(obj);
}

- (NSString)firmwareHash
{
  return self->_firmwareHash;
}

- (void)stagingStartedOnAccessoryID:(id)a3
{
}

- (void)stagingCompleteOnAccessoryID:(id)a3
{
}

- (BOOL)isStagingInProgressOnAccessoryID:(id)a3
{
  return [(NSMutableArray *)self->_activeAccessoriesForStaging containsObject:a3];
}

- (void)processUARPDeploymentRules:(id)a3
{
  id v4 = [(UARPAssetID *)self _createUARPDeploymentRules:a3];
  deploymentRules = self->_deploymentRules;
  self->_deploymentRules = v4;

  self->_BOOL deploymentAllowed = [(UARPAssetID *)self isDeploymentAllowed];
}

- (void)setReportProgressToDelegates:(BOOL)a3
{
  self->_reportProgressToDelegates = a3;
}

- (BOOL)reportProgressToDelegates
{
  return self->_reportProgressToDelegates;
}

- (const)typeString
{
  unint64_t type = self->_type;
  if (type > 0x10) {
    return "unrecognized";
  }
  else {
    return off_264492DE8[type];
  }
}

- (id)rawDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"type=%s, assetVersion=%@/%@", -[UARPAssetID typeString](self, "typeString"), self->_assetVersion, self->_assetVersionNumber];
  if (self->_modelNumber) {
    [v3 appendFormat:@", downstream=%@", self->_modelNumber];
  }
  if (self->_remoteURL) {
    [v3 appendFormat:@", remoteURL=%@", self->_remoteURL];
  }
  if (self->_localURL) {
    [v3 appendFormat:@", localURL=%@", self->_localURL];
  }
  if (self->_releaseNotesRemoteURL) {
    [v3 appendFormat:@", releaseNotesRemotePath=%@", self->_releaseNotesRemoteURL];
  }
  if ([(NSMutableArray *)self->_downstreamAssetIDs count]) {
    [v3 appendFormat:@", downstreamAssetIDs=%lu", -[NSMutableArray count](self->_downstreamAssetIDs, "count")];
  }
  updated = UARPFirmwareUpdateAvailabilityStatusToString(self->_updateAvailabilityStatus);
  [v3 appendFormat:@", updateAvailablity=%s, releaseNotesAvailability=%s, ", updated, UARPFirmwareUpdateAvailabilityStatusToString(self->_releaseNotesAvailabilityStatus)];
  if (self->_tag) {
    [v3 appendFormat:@", tag=%@", self->_tag];
  }
  uint64_t v5 = [NSString stringWithString:v3];

  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(UARPAssetID *)self rawDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)_createUARPDeploymentRules:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v20 = objc_alloc_init(MEMORY[0x263F08790]);
    [v20 setDateFormat:@"MM/dd/yyyy"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v3;
    id obj = v3;
    uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v6 = [v5 objectForKey:@"rampPeriod"];
          id v7 = [v5 objectForKey:@"deploymentLimit"];
          id v8 = [v5 objectForKey:@"countryList"];
          os_log_t v9 = [v5 objectForKey:@"goLiveDate"];
          uint64_t v10 = [v20 dateFromString:v9];
          uint64_t v11 = objc_alloc_init(UARPDeploymentRuleConfig);
          [(UARPDeploymentRuleConfig *)v11 setGoLiveDate:v10];
          [(UARPDeploymentRuleConfig *)v11 setCountryList:v8];
          [(UARPDeploymentRuleConfig *)v11 setRampPeriod:v6];
          [(UARPDeploymentRuleConfig *)v11 setDeploymentLimit:v7];
          uint64_t v12 = [[UARPDeploymentRule alloc] initWithConfig:v11];
          if (v12)
          {
            [v18 addObject:v12];
          }
          else
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v5;
              _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Error: Invalid rule combination not allowed %@", buf, 0xCu);
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v21);
    }

    id v3 = v15;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)isDeploymentAllowed
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (![(NSArray *)self->_deploymentRules count]) {
    return 1;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = self->_deploymentRules;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0;
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v5 = 138412290;
    long long v22 = v5;
LABEL_4:
    uint64_t v9 = 0;
    uint64_t v10 = v7;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v3);
      }
      uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v22;
        uint64_t v29 = v11;
        _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Checking Rule %@", buf, 0xCu);
      }
      id v23 = v10;
      char v13 = objc_msgSend(v11, "isDeploymentAllowed:", &v23, v22);
      id v7 = v23;

      uint64_t v14 = [v11 deploymentDay];

      if (v14)
      {
        id v15 = [v11 deploymentDay];
        deploymentDay = self->_deploymentDay;
        self->_deploymentDay = v15;
      }
      uint64_t v17 = [v11 deploymentPercent];

      if (v17)
      {
        id v18 = [v11 deploymentPercent];
        deploymentPercent = self->_deploymentPercent;
        self->_deploymentPercent = v18;
      }
      if (v13) {
        break;
      }
      ++v9;
      uint64_t v10 = v7;
      if (v6 == v9)
      {
        uint64_t v6 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v6) {
          goto LABEL_4;
        }
        BOOL v20 = 0;
        goto LABEL_20;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (BOOL)isDynamicAsset
{
  return self->_tag != 0;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [v6 appendWithTabDepth:a3 format:@"Asset ID:\n"];
  unint64_t v7 = a3 + 1;
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, @"Type: %s\n", UARPAssetLocationTypeToString(self->_type));
  if (self->_remoteURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Remote URL: %@\n", self->_remoteURL format];
  }
  if (self->_assetVersion) {
    [v6 appendWithTabDepth:a3 + 1, @"Asset Version: %@\n", self->_assetVersion format];
  }
  if (self->_assetVersionNumber) {
    [v6 appendWithTabDepth:a3 + 1, @"Asset Version Number: %@\n", self->_assetVersionNumber format];
  }
  if (self->_localURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Local URL: %@\n", self->_localURL format];
  }
  if (self->_tag) {
    [v6 appendWithTabDepth:a3 + 1, @"Asset Tag: %@\n", self->_tag format];
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, @"Download Status: %s\n", UARPAssetDownloadStatusToString(self->_downloadStatus));
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, @"Update Availability Status: %s\n", UARPFirmwareUpdateAvailabilityStatusToString(self->_updateAvailabilityStatus));
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, @"Release Notes Download Status: %s\n", UARPAssetDownloadStatusToString(self->_releaseNotesDownloadStatus));
  if (self->_releaseNotesRemoteURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Notes Remote URL: %@\n", self->_releaseNotesRemoteURL format];
  }
  if (self->_releaseNotesLocalURL) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Notes Local URL: %@\n", self->_releaseNotesLocalURL format];
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, @"Release Notes Availability Status: %s\n", UARPFirmwareUpdateAvailabilityStatusToString(self->_releaseNotesAvailabilityStatus));
  if (self->_assetReleaseDate) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Date: %@\n", self->_assetReleaseDate format];
  }
  if (self->_releaseNotesFileSize) {
    [v6 appendWithTabDepth:a3 + 1, @"Release Notes File Size: %@\n", self->_releaseNotesFileSize format];
  }
  if (self->_firmwareFileSize) {
    [v6 appendWithTabDepth:a3 + 1, @"Firmware File Size: %@\n", self->_firmwareFileSize format];
  }
  if ([(NSArray *)self->_deploymentRules count])
  {
    [v6 appendWithTabDepth:a3 + 1 format:@"Deployment Rules:\n"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = self->_deploymentRules;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      unint64_t v12 = a3 + 2;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v13++) dumpWithTabDepth:v12 dumpString:v6];
        }
        while (v10 != v13);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  if (self->_deploymentAllowed) {
    uint64_t v14 = "yes";
  }
  else {
    uint64_t v14 = "no";
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, @"Deployment allowed: %s\n", v14);
  if (self->_signatureValidationNeeded) {
    id v15 = "yes";
  }
  else {
    id v15 = "no";
  }
  objc_msgSend(v6, "appendWithTabDepth:format:", v7, @"Signature Validation Needed: %s\n", v15);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)remotePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRemotePath:(id)a3
{
}

- (NSString)assetVersion
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (int64_t)downloadStatus
{
  return self->_downloadStatus;
}

- (int64_t)updateAvailabilityStatus
{
  return self->_updateAvailabilityStatus;
}

- (int64_t)releaseNotesDownloadStatus
{
  return self->_releaseNotesDownloadStatus;
}

- (NSString)releaseNotesRemotePath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (int64_t)releaseNotesAvailabilityStatus
{
  return self->_releaseNotesAvailabilityStatus;
}

- (NSDate)assetReleaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSNumber)releaseNotesFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (NSNumber)firmwareFileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)deploymentRules
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)deploymentAllowed
{
  return self->_deploymentAllowed;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 200, 1);
}

- (NSURL)remoteURL
{
  return (NSURL *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRemoteURL:(id)a3
{
}

- (NSURL)localURL
{
  return (NSURL *)objc_getProperty(self, a2, 216, 1);
}

- (NSURL)releaseNotesRemoteURL
{
  return (NSURL *)objc_getProperty(self, a2, 224, 1);
}

- (NSURL)releaseNotesLocalURL
{
  return (NSURL *)objc_getProperty(self, a2, 232, 1);
}

- (NSURL)tatsuServerURL
{
  return (NSURL *)objc_getProperty(self, a2, 240, 1);
}

- (BOOL)isUrgentUpdate
{
  return self->_isUrgentUpdate;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_tatsuServerURL, 0);
  objc_storeStrong((id *)&self->_releaseNotesLocalURL, 0);
  objc_storeStrong((id *)&self->_releaseNotesRemoteURL, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_deploymentRules, 0);
  objc_storeStrong((id *)&self->_firmwareFileSize, 0);
  objc_storeStrong((id *)&self->_releaseNotesFileSize, 0);
  objc_storeStrong((id *)&self->_assetReleaseDate, 0);
  objc_storeStrong((id *)&self->_releaseNotesRemotePath, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_remotePath, 0);
  objc_storeStrong((id *)&self->_assetVersionNumber, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_downstreamAssetIDs, 0);
  objc_storeStrong((id *)&self->_activeAccessoriesForStaging, 0);
  objc_storeStrong((id *)&self->_firmwareHash, 0);
  objc_storeStrong((id *)&self->_deploymentPercent, 0);
  objc_storeStrong((id *)&self->_deploymentDay, 0);
  objc_storeStrong((id *)&self->_remoteBuildManifestPlistPath, 0);
}

@end