@interface ASDApp
+ (BOOL)supportsSecureCoding;
- (ASDApp)initWithBundleID:(id)a3;
- (ASDApp)initWithCoder:(id)a3;
- (ASDProgress)remoteProgress;
- (BOOL)autoUpdateEnabled;
- (BOOL)hasMessagesExtension;
- (BOOL)hasPostProcessing;
- (BOOL)hasUnknownDistributor;
- (BOOL)isAppClip;
- (BOOL)isArcadeOpenable;
- (BOOL)isBetaApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToApp:(id)a3;
- (BOOL)isFamilyShared;
- (BOOL)isInstalled;
- (BOOL)isLaunchProhibited;
- (BOOL)isOcelot;
- (BOOL)isOpenable;
- (BOOL)isPlaceholder;
- (BOOL)isStoreApp;
- (BOOL)isSystemApp;
- (BOOL)isUpdateAvailable;
- (BOOL)isWrapped;
- (NSData)rawUpdateData;
- (NSDate)updateInstallDate;
- (NSDictionary)updateMetadata;
- (NSError)installError;
- (NSNumber)storeFront;
- (NSProgress)downloadProgress;
- (NSProgress)installProgress;
- (NSProgress)postProcessProgress;
- (NSProgress)progress;
- (NSString)artistName;
- (NSString)bundleID;
- (NSString)bundlePath;
- (NSString)bundleShortVersion;
- (NSString)bundleVersion;
- (NSString)executablePath;
- (NSString)localizedName;
- (NSString)storeCohort;
- (NSString)updateBuyParams;
- (NSUUID)installID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)downloaderDSID;
- (int64_t)essentialBackgroundAssetDownloadEstimate;
- (int64_t)extensions;
- (int64_t)familyID;
- (int64_t)progressPhase;
- (int64_t)purchaserDSID;
- (int64_t)softwarePlatform;
- (int64_t)status;
- (int64_t)storeExternalVersionID;
- (int64_t)storeItemID;
- (int64_t)watchApplicationMode;
- (uint64_t)_cachedOpenableStatus;
- (uint64_t)_openableStatus;
- (unint64_t)hash;
- (void)_loadUpdateMetadataIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)loadUpdateMetadataIfNecessary;
- (void)setArtistName:(id)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setBundlePath:(id)a3;
- (void)setBundleShortVersion:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setDownloaderDSID:(int64_t)a3;
- (void)setEssentialBackgroundAssetDownloadEstimate:(int64_t)a3;
- (void)setExecutablePath:(id)a3;
- (void)setExtensions:(int64_t)a3;
- (void)setFamilyID:(int64_t)a3;
- (void)setHasPostProcessing:(BOOL)a3;
- (void)setInstallError:(id)a3;
- (void)setInstallProgress:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setPostProcessProgress:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressPhase:(int64_t)a3;
- (void)setPurchaserDSID:(int64_t)a3;
- (void)setRawUpdateData:(id)a3;
- (void)setRemoteProgress:(id)a3;
- (void)setSoftwarePlatform:(int64_t)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStoreCohort:(id)a3;
- (void)setStoreExternalVersionID:(int64_t)a3;
- (void)setStoreFront:(id)a3;
- (void)setStoreItemID:(int64_t)a3;
- (void)setUpdateBuyParams:(id)a3;
- (void)setUpdateInstallDate:(id)a3;
- (void)setUpdateMetadata:(id)a3;
- (void)setWatchApplicationMode:(int64_t)a3;
@end

@implementation ASDApp

- (void)setStoreFront:(id)a3
{
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setLocalizedName:(id)a3
{
}

- (void)setExtensions:(int64_t)a3
{
  self->_extensions = a3;
}

- (void)setExecutablePath:(id)a3
{
}

- (void)setBundleVersion:(id)a3
{
}

- (void)setBundleShortVersion:(id)a3
{
}

- (void)setBundlePath:(id)a3
{
}

- (void)setArtistName:(id)a3
{
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (void)setStoreExternalVersionID:(int64_t)a3
{
  self->_storeExternalVersionID = a3;
}

- (void)setStoreCohort:(id)a3
{
}

- (NSProgress)progress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__ASDApp_progress__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASDApp *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ASDApp *)self isEqualToApp:v4];
  }

  return v5;
}

- (BOOL)isFamilyShared
{
  return ((unint64_t)[(ASDApp *)self status] >> 1) & 1;
}

- (BOOL)isUpdateAvailable
{
  return ((unint64_t)[(ASDApp *)self status] >> 3) & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  v4 = [(ASDApp *)self artistName];
  [v18 encodeObject:v4 forKey:@"A"];

  BOOL v5 = [(ASDApp *)self bundleID];
  [v18 encodeObject:v5 forKey:@"B"];

  objc_msgSend(v18, "encodeInteger:forKey:", -[ASDApp extensions](self, "extensions"), @"G");
  objc_msgSend(v18, "encodeInteger:forKey:", -[ASDApp status](self, "status"), @"L");
  uint64_t v6 = [(ASDApp *)self installError];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = ASDErrorWithSafeUserInfo(v6);
    [v18 encodeObject:v8 forKey:@"S"];
  }
  v9 = [(ASDApp *)self bundlePath];
  [v18 encodeObject:v9 forKey:@"C"];

  v10 = [(ASDApp *)self bundleShortVersion];
  [v18 encodeObject:v10 forKey:@"D"];

  id v11 = [(ASDApp *)self bundleVersion];
  [v18 encodeObject:v11 forKey:@"E"];

  v12 = [(ASDApp *)self executablePath];
  [v18 encodeObject:v12 forKey:@"T"];

  v13 = [(ASDApp *)self localizedName];
  [v18 encodeObject:v13 forKey:@"I"];

  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp storeExternalVersionID](self, "storeExternalVersionID"), @"O");
  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp storeItemID](self, "storeItemID"), @"P");
  v14 = [(ASDApp *)self storeCohort];
  [v18 encodeObject:v14 forKey:@"M"];

  v15 = [(ASDApp *)self storeFront];
  [v18 encodeObject:v15 forKey:@"N"];

  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp downloaderDSID](self, "downloaderDSID"), @"F");
  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp familyID](self, "familyID"), @"H");
  objc_msgSend(v18, "encodeInt64:forKey:", -[ASDApp purchaserDSID](self, "purchaserDSID"), @"J");
  v16 = [(ASDApp *)self remoteProgress];
  [v18 encodeObject:v16 forKey:@"K"];

  v17 = [(ASDApp *)self updateBuyParams];
  [v18 encodeObject:v17 forKey:@"Q"];

  [v18 encodeObject:self->_updateInstallDate forKey:@"W"];
  [v18 encodeObject:self->_rawUpdateData forKey:@"V"];
  objc_msgSend(v18, "encodeInteger:forKey:", -[ASDApp watchApplicationMode](self, "watchApplicationMode"), @"R");
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (int64_t)storeExternalVersionID
{
  return self->_storeExternalVersionID;
}

- (BOOL)isLaunchProhibited
{
  return ((unint64_t)[(ASDApp *)self status] >> 4) & 1;
}

- (BOOL)isStoreApp
{
  return ((unint64_t)[(ASDApp *)self status] >> 8) & 1;
}

- (BOOL)isBetaApp
{
  return [(ASDApp *)self status] & 1;
}

- (BOOL)isAppClip
{
  return ((unint64_t)[(ASDApp *)self status] >> 11) & 1;
}

- (BOOL)isInstalled
{
  return ((unint64_t)[(ASDApp *)self status] >> 2) & 1;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)watchApplicationMode
{
  return self->_watchApplicationMode;
}

- (NSString)updateBuyParams
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSNumber)storeFront
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)storeCohort
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)purchaserDSID
{
  return self->_purchaserDSID;
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSError)installError
{
  return (NSError *)objc_getProperty(self, a2, 224, 1);
}

- (int64_t)familyID
{
  return self->_familyID;
}

- (NSString)executablePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (int64_t)downloaderDSID
{
  return self->_downloaderDSID;
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)bundlePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)hasMessagesExtension
{
  return [(ASDApp *)self extensions] & 1;
}

- (int64_t)extensions
{
  return self->_extensions;
}

- (ASDProgress)remoteProgress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__ASDApp_remoteProgress__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDProgress *)v3;
}

void __24__ASDApp_remoteProgress__block_invoke(uint64_t a1)
{
}

void __18__ASDApp_progress__block_invoke(uint64_t a1)
{
}

- (ASDApp)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
  uint64_t v6 = [(ASDApp *)self initWithBundleID:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    artistName = v6->_artistName;
    v6->_artistName = (NSString *)v7;

    v6->_extensions = [v4 decodeIntegerForKey:@"G"];
    v6->_status = [v4 decodeIntegerForKey:@"L"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"S"];
    installError = v6->_installError;
    v6->_installError = (NSError *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"C"];
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"D"];
    bundleShortVersion = v6->_bundleShortVersion;
    v6->_bundleShortVersion = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"E"];
    bundleVersion = v6->_bundleVersion;
    v6->_bundleVersion = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"T"];
    executablePath = v6->_executablePath;
    v6->_executablePath = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"I"];
    localizedName = v6->_localizedName;
    v6->_localizedName = (NSString *)v19;

    v6->_softwarePlatform = [v4 decodeIntegerForKey:@"U"];
    v6->_storeExternalVersionID = [v4 decodeInt64ForKey:@"O"];
    v6->_storeItemID = [v4 decodeInt64ForKey:@"P"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"M"];
    storeCohort = v6->_storeCohort;
    v6->_storeCohort = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"N"];
    storeFront = v6->_storeFront;
    v6->_storeFront = (NSNumber *)v23;

    v6->_downloaderDSID = [v4 decodeInt64ForKey:@"F"];
    v6->_familyID = [v4 decodeInt64ForKey:@"H"];
    v6->_purchaserDSID = [v4 decodeInt64ForKey:@"J"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"K"];
    remoteProgress = v6->_remoteProgress;
    v6->_remoteProgress = (ASDProgress *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Q"];
    updateBuyParams = v6->_updateBuyParams;
    v6->_updateBuyParams = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"W"];
    updateInstallDate = v6->_updateInstallDate;
    v6->_updateInstallDate = (NSDate *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"V"];
    rawUpdateData = v6->_rawUpdateData;
    v6->_rawUpdateData = (NSData *)v31;

    v6->_watchApplicationMode = [v4 decodeIntegerForKey:@"R"];
  }

  return v6;
}

- (ASDApp)initWithBundleID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDApp;
  BOOL v5 = [(ASDApp *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_openableStatus = -1;
    uint64_t v8 = objc_alloc_init(ASDUnfairLock);
    propertyLock = v5->_propertyLock;
    v5->_propertyLock = v8;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(ASDApp *)self bundleID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToApp:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASDApp *)self artistName];
  uint64_t v6 = [v4 artistName];
  if (v5 == v6 || [v5 isEqual:v6])
  {
    uint64_t v7 = [(ASDApp *)self bundleID];
    uint64_t v8 = [v4 bundleID];
    if ((v7 == v8 || [v7 isEqual:v8])
      && (int64_t v9 = -[ASDApp extensions](self, "extensions"), v9 == [v4 extensions])
      && (int64_t v10 = -[ASDApp status](self, "status"), v10 == [v4 status]))
    {
      objc_super v11 = [(ASDApp *)self installError];
      v12 = [v4 installError];
      if (v11 == v12 || [v11 isEqual:v12])
      {
        uint64_t v13 = [(ASDApp *)self bundlePath];
        v14 = [v4 bundlePath];
        if (v13 == v14 || [v13 isEqual:v14])
        {
          v49 = v11;
          v50 = v14;
          uint64_t v15 = [(ASDApp *)self bundleShortVersion];
          v16 = [v4 bundleShortVersion];
          v48 = v15;
          if (v15 == v16 || [v15 isEqual:v16])
          {
            v46 = v12;
            v47 = v16;
            uint64_t v17 = [(ASDApp *)self bundleVersion];
            id v18 = [v4 bundleVersion];
            if (v17 == v18 || [v17 isEqual:v18])
            {
              uint64_t v19 = v13;
              v45 = v18;
              v20 = [(ASDApp *)self executablePath];
              uint64_t v21 = [v4 executablePath];
              v44 = v20;
              if (v20 == v21 || [v20 isEqual:v21])
              {
                v42 = v19;
                v43 = v21;
                int64_t v22 = [(ASDApp *)self storeExternalVersionID];
                if (v22 == [v4 storeExternalVersionID])
                {
                  uint64_t v23 = [(ASDApp *)self storeCohort];
                  v24 = [v4 storeCohort];
                  if (v23 == v24 || [v23 isEqual:v24])
                  {
                    v41 = v24;
                    uint64_t v25 = [(ASDApp *)self storeFront];
                    uint64_t v26 = [v4 storeFront];
                    v40 = (void *)v26;
                    if (v25 == (void *)v26 || [v25 isEqual:v26])
                    {
                      v38 = v25;
                      v39 = v23;
                      int64_t v27 = [(ASDApp *)self storeItemID];
                      if (v27 == [v4 storeItemID]
                        && (int64_t v28 = [(ASDApp *)self downloaderDSID],
                            v28 == [v4 downloaderDSID])
                        && (int64_t v29 = -[ASDApp familyID](self, "familyID"), v29 == [v4 familyID])
                        && (int64_t v30 = [(ASDApp *)self purchaserDSID],
                            v30 == [v4 purchaserDSID]))
                      {
                        uint64_t v31 = [(ASDApp *)self updateBuyParams];
                        v32 = [v4 updateBuyParams];
                        if (v31 == v32 || [v31 isEqual:v32])
                        {
                          v33 = v32;
                          int64_t v34 = [(ASDApp *)self watchApplicationMode];
                          BOOL v35 = v34 == [v4 watchApplicationMode];
                          v32 = v33;
                          BOOL v36 = v35;
                        }
                        else
                        {
                          BOOL v36 = 0;
                        }
                      }
                      else
                      {
                        BOOL v36 = 0;
                      }
                      uint64_t v19 = v42;
                      uint64_t v25 = v38;
                      uint64_t v23 = v39;
                    }
                    else
                    {
                      BOOL v36 = 0;
                    }

                    v24 = v41;
                  }
                  else
                  {
                    BOOL v36 = 0;
                  }
                }
                else
                {
                  BOOL v36 = 0;
                }
                uint64_t v21 = v43;
              }
              else
              {
                BOOL v36 = 0;
              }

              id v18 = v45;
              uint64_t v13 = v19;
            }
            else
            {
              BOOL v36 = 0;
            }

            v12 = v46;
            v16 = v47;
          }
          else
          {
            BOOL v36 = 0;
          }

          v14 = v50;
          objc_super v11 = v49;
        }
        else
        {
          BOOL v36 = 0;
        }
      }
      else
      {
        BOOL v36 = 0;
      }
    }
    else
    {
      BOOL v36 = 0;
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)artistName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBuyParams, 0);
  objc_storeStrong((id *)&self->_installID, 0);
  objc_storeStrong((id *)&self->_installError, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_rawUpdateData, 0);
  objc_storeStrong((id *)&self->_updateMetadata, 0);
  objc_storeStrong((id *)&self->_updateInstallDate, 0);
  objc_storeStrong((id *)&self->_remoteProgress, 0);
  objc_storeStrong((id *)&self->_postProcessProgress, 0);
  objc_storeStrong((id *)&self->_installProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasUnknownDistributor
{
  return ((unint64_t)[(ASDApp *)self status] >> 15) & 1;
}

- (BOOL)isArcadeOpenable
{
  return -[ASDApp _cachedOpenableStatus](self) & 1;
}

- (uint64_t)_cachedOpenableStatus
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = [a1 executablePath];
  unint64_t v3 = v2;
  if (v2 && [v2 length])
  {
    uint64_t v4 = -[ASDApp _openableStatus]((uint64_t)a1);
    if (v4 == 255)
    {
      uint64_t v5 = +[ASDAppLibrary openableStatusForExecutableAtPath:v3];
      uint64_t v8 = (void *)a1[2];
      *(void *)int64_t v10 = MEMORY[0x1E4F143A8];
      *(void *)&v10[8] = 3221225472;
      *(void *)&v10[16] = __29__ASDApp__setOpenableStatus___block_invoke;
      objc_super v11 = &unk_1E58B3470;
      v12 = a1;
      char v13 = v5;
      ASDWithLock(v8, v10);
      uint64_t v6 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int64_t v10 = 138412546;
        *(void *)&v10[4] = v3;
        *(_WORD *)&v10[12] = 1024;
        *(_DWORD *)&v10[14] = v5;
        uint64_t v7 = "[Library] Loaded openable status for '%@': %i";
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int64_t v10 = 138412546;
        *(void *)&v10[4] = v3;
        *(_WORD *)&v10[12] = 1024;
        *(_DWORD *)&v10[14] = v5;
        uint64_t v7 = "[Library] Cached openable status for '%@': %i";
LABEL_13:
        _os_log_debug_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEBUG, v7, v10, 0x12u);
      }
    }

    goto LABEL_10;
  }
  uint64_t v5 = 255;
LABEL_10:

  return v5;
}

- (BOOL)isOpenable
{
  return (-[ASDApp _cachedOpenableStatus](self) >> 1) & 1;
}

- (BOOL)isOcelot
{
  return ((unint64_t)[(ASDApp *)self status] >> 5) & 1;
}

- (BOOL)isPlaceholder
{
  return ((unint64_t)[(ASDApp *)self status] >> 7) & 1;
}

- (BOOL)isSystemApp
{
  return ((unint64_t)[(ASDApp *)self status] >> 9) & 1;
}

- (BOOL)isWrapped
{
  return ((unint64_t)[(ASDApp *)self status] >> 12) & 1;
}

- (void)setProgress:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__ASDApp_setProgress___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __22__ASDApp_setProgress___block_invoke(uint64_t a1)
{
}

- (NSProgress)downloadProgress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = __Block_byref_object_copy__6;
  int64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__ASDApp_downloadProgress__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __26__ASDApp_downloadProgress__block_invoke(uint64_t a1)
{
}

- (void)setDownloadProgress:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ASDApp_setDownloadProgress___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __30__ASDApp_setDownloadProgress___block_invoke(uint64_t a1)
{
}

- (BOOL)hasPostProcessing
{
  return ((unint64_t)[(ASDApp *)self status] >> 13) & 1;
}

- (void)setHasPostProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(ASDApp *)self status] & 0xFFFFFFFFFFFFDFFFLL;
  uint64_t v6 = 0x2000;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(ASDApp *)self setStatus:v5 | v6];
}

- (NSProgress)installProgress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = __Block_byref_object_copy__6;
  int64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__ASDApp_installProgress__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __25__ASDApp_installProgress__block_invoke(uint64_t a1)
{
}

- (void)setInstallProgress:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__ASDApp_setInstallProgress___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __29__ASDApp_setInstallProgress___block_invoke(uint64_t a1)
{
}

- (NSProgress)postProcessProgress
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = __Block_byref_object_copy__6;
  int64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__ASDApp_postProcessProgress__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSProgress *)v3;
}

void __29__ASDApp_postProcessProgress__block_invoke(uint64_t a1)
{
}

- (void)setPostProcessProgress:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ASDApp_setPostProcessProgress___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __33__ASDApp_setPostProcessProgress___block_invoke(uint64_t a1)
{
}

- (void)setRemoteProgress:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__ASDApp_setRemoteProgress___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __28__ASDApp_setRemoteProgress___block_invoke(uint64_t a1)
{
}

- (BOOL)autoUpdateEnabled
{
  return ((unint64_t)[(ASDApp *)self status] >> 14) & 1;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(ASDApp *)self status] & 0xFFFFFFFFFFFFBFFFLL;
  uint64_t v6 = 0x4000;
  if (!v3) {
    uint64_t v6 = 0;
  }
  [(ASDApp *)self setStatus:v5 | v6];
}

- (NSDate)updateInstallDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = __Block_byref_object_copy__6;
  int64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__ASDApp_updateInstallDate__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __27__ASDApp_updateInstallDate__block_invoke(uint64_t a1)
{
}

- (void)setUpdateInstallDate:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ASDApp_setUpdateInstallDate___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __31__ASDApp_setUpdateInstallDate___block_invoke(uint64_t a1)
{
}

- (NSDictionary)updateMetadata
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = __Block_byref_object_copy__6;
  int64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__ASDApp_updateMetadata__block_invoke;
  v5[3] = &unk_1E58B4108;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __24__ASDApp_updateMetadata__block_invoke(uint64_t a1)
{
  -[ASDApp _loadUpdateMetadataIfNecessary](*(void *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)_loadUpdateMetadataIfNecessary
{
  if (a1 && !*(void *)(a1 + 80))
  {
    if ([*(id *)(a1 + 88) length])
    {
      *(void *)(a1 + 80) = [MEMORY[0x1E4F28D90] JSONObjectWithData:*(void *)(a1 + 88) options:0 error:0];
      MEMORY[0x1F41817F8]();
    }
    else if (!*(unsigned char *)(a1 + 8) && *(void *)(a1 + 104))
    {
      *(unsigned char *)(a1 + 8) = 1;
      v2 = +[ASDServiceBroker defaultBroker];
      id v3 = [v2 getUpdatesServiceWithError:0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke;
      v7[3] = &unk_1E58B2F08;
      v7[4] = a1;
      id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v7];

      uint64_t v5 = *(void *)(a1 + 104);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke_4;
      v6[3] = &unk_1E58B4130;
      v6[4] = a1;
      [v4 getUpdateMetadataForBundleID:v5 withReplyHandler:v6];
    }
  }
}

- (void)setUpdateMetadata:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__ASDApp_setUpdateMetadata___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __28__ASDApp_setUpdateMetadata___block_invoke(uint64_t a1)
{
}

- (NSData)rawUpdateData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int64_t v9 = __Block_byref_object_copy__6;
  int64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  propertyLock = self->_propertyLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__ASDApp_rawUpdateData__block_invoke;
  v5[3] = &unk_1E58B2DC8;
  v5[4] = self;
  v5[5] = &v6;
  ASDWithLock(propertyLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __23__ASDApp_rawUpdateData__block_invoke(uint64_t a1)
{
}

- (void)setRawUpdateData:(id)a3
{
  id v4 = a3;
  propertyLock = self->_propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__ASDApp_setRawUpdateData___block_invoke;
  v7[3] = &unk_1E58B2DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ASDWithLock(propertyLock, v7);
}

void __27__ASDApp_setRawUpdateData___block_invoke(uint64_t a1)
{
}

- (uint64_t)_openableStatus
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = -1;
  v1 = *(void **)(a1 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__ASDApp__openableStatus__block_invoke;
  v4[3] = &unk_1E58B2DC8;
  v4[4] = a1;
  v4[5] = &v5;
  ASDWithLock(v1, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __25__ASDApp__openableStatus__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

uint64_t __29__ASDApp__setOpenableStatus___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

- (void)loadUpdateMetadataIfNecessary
{
  propertyLock = self->_propertyLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__ASDApp_loadUpdateMetadataIfNecessary__block_invoke;
  v3[3] = &unk_1E58B2EB8;
  v3[4] = self;
  ASDWithLock(propertyLock, v3);
}

void __39__ASDApp_loadUpdateMetadataIfNecessary__block_invoke(uint64_t a1)
{
}

void __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "[%{public}@]: Error fetching updates service: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __40__ASDApp__loadUpdateMetadataIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 length])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
    uint64_t v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;
  }
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:14];
  uint64_t v4 = NSString;
  uint64_t v5 = [(ASDApp *)self bundleID];
  id v6 = [v4 stringWithFormat:@"bundleID = %@", v5];
  [v3 addObject:v6];

  if ([(ASDApp *)self hasUnknownDistributor])
  {
    id v7 = [NSString stringWithFormat:@"hasUnknownDistributor"];
    [v3 addObject:v7];
  }
  if ([(ASDApp *)self isStoreApp])
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"storeItemID = %lld", -[ASDApp storeItemID](self, "storeItemID"));
    [v3 addObject:v8];

    uint64_t v9 = [(ASDApp *)self storeCohort];

    if (v9)
    {
      int64_t v10 = NSString;
      id v11 = [(ASDApp *)self storeCohort];
      v12 = [v10 stringWithFormat:@"storeCohort = %@", v11];
      [v3 addObject:v12];
    }
    char v13 = objc_msgSend(NSString, "stringWithFormat:", @"storeExternalVersionID = %lld", -[ASDApp storeExternalVersionID](self, "storeExternalVersionID"));
    [v3 addObject:v13];

    if (![(ASDApp *)self isBetaApp] && ![(ASDApp *)self isSystemApp])
    {
      uint64_t v14 = NSString;
      BOOL v15 = [(ASDApp *)self isUpdateAvailable];
      v16 = @"NO";
      if (v15) {
        v16 = @"YES";
      }
      uint64_t v17 = [v14 stringWithFormat:@"update available = %@", v16];
      [v3 addObject:v17];
    }
  }
  id v18 = [(ASDApp *)self progress];
  uint64_t v19 = v18;
  if (v18)
  {
    v20 = NSString;
    [v18 fractionCompleted];
    int64_t v22 = [v20 stringWithFormat:@"fractionCompleted = %.2f", v21];
    [v3 addObject:v22];
  }
  else
  {
    uint64_t v23 = [(ASDApp *)self remoteProgress];
    int64_t v22 = v23;
    if (v23)
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"completedUnitCount = %lld", objc_msgSend(v23, "completedUnitCount"));
      [v3 addObject:v24];
    }
  }

  uint64_t v25 = NSString;
  uint64_t v26 = [(ASDApp *)self bundlePath];
  int64_t v27 = [v25 stringWithFormat:@"path = %@", v26];
  [v3 addObject:v27];

  int64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"installed = %d", -[ASDApp isInstalled](self, "isInstalled"));
  [v3 addObject:v28];

  if ([(ASDApp *)self isOcelot])
  {
    [v3 addObject:@"ocelot = 1"];
    int v29 = -[ASDApp _openableStatus]((uint64_t)self);
    if (v29 == 255) {
      objc_msgSend(NSString, "stringWithFormat:", @"arcadeOpenable = ?", v43);
    }
    else {
    int64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"arcadeOpenable = %d", v29 & 1);
    }
    [v3 addObject:v30];
  }
  if ([(ASDApp *)self watchApplicationMode])
  {
    uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"watch application mode = %ld", -[ASDApp watchApplicationMode](self, "watchApplicationMode"));
    [v3 addObject:v31];
  }
  v32 = [(ASDApp *)self installError];

  if (v32)
  {
    v33 = NSString;
    int64_t v34 = [(ASDApp *)self installError];
    BOOL v35 = [v33 stringWithFormat:@"installError = %@", v34];
    [v3 addObject:v35];
  }
  if (self->_updateInstallDate)
  {
    BOOL v36 = [NSString stringWithFormat:@"updateInstallDate: %@", self->_updateInstallDate];
    [v3 addObject:v36];
  }
  if (self->_updateMetadata)
  {
    v37 = [NSString stringWithFormat:@"updateMetadata: %@", self->_updateMetadata];
    [v3 addObject:v37];
  }
  v38 = NSString;
  v44.receiver = self;
  v44.super_class = (Class)ASDApp;
  v39 = [(ASDApp *)&v44 description];
  v40 = [v3 componentsJoinedByString:@"; "];
  v41 = [v38 stringWithFormat:@"%@: {%@}", v39, v40];

  return v41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = +[ASDApp allocWithZone:](ASDApp, "allocWithZone:");
  id v6 = [(ASDApp *)self bundleID];
  id v7 = [(ASDApp *)v5 initWithBundleID:v6];

  id v8 = [(ASDApp *)self artistName];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [(ASDApp *)v7 setArtistName:v9];

  [(ASDApp *)v7 setExtensions:[(ASDApp *)self extensions]];
  [(ASDApp *)v7 setStatus:[(ASDApp *)self status]];
  int64_t v10 = [(ASDApp *)self installError];
  [(ASDApp *)v7 setInstallError:v10];

  id v11 = [(ASDApp *)self bundlePath];
  v12 = (void *)[v11 copyWithZone:a3];
  [(ASDApp *)v7 setBundlePath:v12];

  char v13 = [(ASDApp *)self bundleShortVersion];
  uint64_t v14 = (void *)[v13 copyWithZone:a3];
  [(ASDApp *)v7 setBundleShortVersion:v14];

  BOOL v15 = [(ASDApp *)self bundleVersion];
  v16 = (void *)[v15 copyWithZone:a3];
  [(ASDApp *)v7 setBundleVersion:v16];

  uint64_t v17 = [(ASDApp *)self executablePath];
  id v18 = (void *)[v17 copyWithZone:a3];
  [(ASDApp *)v7 setExecutablePath:v18];

  [(ASDApp *)v7 setStoreExternalVersionID:[(ASDApp *)self storeExternalVersionID]];
  [(ASDApp *)v7 setStoreItemID:[(ASDApp *)self storeItemID]];
  uint64_t v19 = [(ASDApp *)self storeCohort];
  v20 = (void *)[v19 copyWithZone:a3];
  [(ASDApp *)v7 setStoreCohort:v20];

  uint64_t v21 = [(ASDApp *)self storeFront];
  int64_t v22 = (void *)[v21 copyWithZone:a3];
  [(ASDApp *)v7 setStoreFront:v22];

  [(ASDApp *)v7 setDownloaderDSID:[(ASDApp *)self downloaderDSID]];
  [(ASDApp *)v7 setFamilyID:[(ASDApp *)self familyID]];
  [(ASDApp *)v7 setPurchaserDSID:[(ASDApp *)self purchaserDSID]];
  uint64_t v23 = [(ASDApp *)self remoteProgress];
  v24 = (void *)[v23 copyWithZone:a3];
  [(ASDApp *)v7 setRemoteProgress:v24];

  uint64_t v25 = [(ASDApp *)self updateBuyParams];
  uint64_t v26 = (void *)[v25 copyWithZone:a3];
  [(ASDApp *)v7 setUpdateBuyParams:v26];

  [(ASDApp *)v7 setWatchApplicationMode:[(ASDApp *)self watchApplicationMode]];
  return v7;
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(int64_t)a3
{
  self->_softwarePlatform = a3;
}

- (void)setDownloaderDSID:(int64_t)a3
{
  self->_downloaderDSID = a3;
}

- (void)setFamilyID:(int64_t)a3
{
  self->_familyID = a3;
}

- (void)setPurchaserDSID:(int64_t)a3
{
  self->_purchaserDSID = a3;
}

- (int64_t)essentialBackgroundAssetDownloadEstimate
{
  return self->_essentialBackgroundAssetDownloadEstimate;
}

- (void)setEssentialBackgroundAssetDownloadEstimate:(int64_t)a3
{
  self->_essentialBackgroundAssetDownloadEstimate = a3;
}

- (void)setInstallError:(id)a3
{
}

- (NSUUID)installID
{
  return (NSUUID *)objc_getProperty(self, a2, 232, 1);
}

- (int64_t)progressPhase
{
  return self->_progressPhase;
}

- (void)setProgressPhase:(int64_t)a3
{
  self->_progressPhase = a3;
}

- (void)setUpdateBuyParams:(id)a3
{
}

- (void)setWatchApplicationMode:(int64_t)a3
{
  self->_watchApplicationMode = a3;
}

@end