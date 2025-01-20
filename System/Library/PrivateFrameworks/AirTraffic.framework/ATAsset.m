@interface ATAsset
+ (BOOL)supportsSecureCoding;
+ (id)assetWithSerializedAsset:(id)a3;
+ (id)downloadAssetWithIdentifier:(id)a3 dataclass:(id)a4 prettyName:(id)a5;
+ (id)iCloudRestoreAssetWithIdentifier:(id)a3 dataclass:(id)a4 assetType:(id)a5 restorePath:(id)a6 displayName:(id)a7;
+ (id)uploadAssetWithIdentifier:(id)a3 dataclass:(id)a4 sourcePath:(id)a5 prettyName:(id)a6;
- (ATAsset)init;
- (ATAsset)initWithCoder:(id)a3;
- (ATAsset)initWithIdentifier:(id)a3 dataclass:(id)a4 prettyName:(id)a5;
- (ATStoreInfo)storeInfo;
- (BOOL)allowDownloadOnConstrainedNetwork;
- (BOOL)bypassStore;
- (BOOL)canProxyUseCellularData;
- (BOOL)canUseCellularData;
- (BOOL)deviceWasChargingWhenEnqueued;
- (BOOL)downloadOnly;
- (BOOL)installOnly;
- (BOOL)installStarted;
- (BOOL)isDownload;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)isInstalled;
- (BOOL)isLegacy;
- (BOOL)isPrioritized;
- (BOOL)isRestore;
- (BOOL)isRetry;
- (BOOL)lyricsEmbeddedInAsset;
- (BOOL)powerRequired;
- (BOOL)readyForStore;
- (NMSDownloadableItem)mediaItemDownloadInfo;
- (NSData)resumeData;
- (NSDictionary)clientParams;
- (NSDictionary)variantOptions;
- (NSError)error;
- (NSNumber)downloadSourceContainerId;
- (NSString)assetType;
- (NSString)dataclass;
- (NSString)identifier;
- (NSString)infoPlist;
- (NSString)path;
- (NSString)prettyName;
- (NSString)storePlist;
- (NSURL)icon;
- (double)queueDuration;
- (double)queueStartTime;
- (double)transferDuration;
- (double)transferStartTime;
- (float)downloadProgress;
- (float)installProgress;
- (id)_ATAssetTypeFromDataClass:(id)a3;
- (id)_variantDescription;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)progressBlock;
- (id)serializedAsset;
- (id)shortDescription;
- (int)protectionType;
- (int64_t)assetState;
- (int64_t)enqueueSource;
- (int64_t)storePID;
- (unint64_t)assetParts;
- (unint64_t)bytesRemaining;
- (unint64_t)completedAssetParts;
- (unint64_t)downloadPauseReason;
- (unint64_t)hash;
- (unint64_t)totalBytes;
- (unsigned)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowDownloadOnConstrainedNetwork:(BOOL)a3;
- (void)setAssetState:(int64_t)a3;
- (void)setAssetType:(id)a3;
- (void)setBypassStore:(BOOL)a3;
- (void)setBytesRemaining:(unint64_t)a3;
- (void)setCanProxyUseCellularData:(BOOL)a3;
- (void)setCanUseCellularData:(BOOL)a3;
- (void)setClientParams:(id)a3;
- (void)setCompletedAssetParts:(unint64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDataclass:(id)a3;
- (void)setDeviceWasChargingWhenEnqueued:(BOOL)a3;
- (void)setDownloadOnly:(BOOL)a3;
- (void)setDownloadPauseReason:(unint64_t)a3;
- (void)setDownloadProgress:(float)a3;
- (void)setDownloadSourceContainerId:(id)a3;
- (void)setEnqueueSource:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfoPlist:(id)a3;
- (void)setInstallOnly:(BOOL)a3;
- (void)setInstallProgress:(float)a3;
- (void)setInstallStarted:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setIsDownload:(BOOL)a3;
- (void)setIsForeground:(BOOL)a3;
- (void)setIsPrioritized:(BOOL)a3;
- (void)setIsRestore:(BOOL)a3;
- (void)setIsRetry:(BOOL)a3;
- (void)setLegacy:(BOOL)a3;
- (void)setLyricsEmbeddedInAsset:(BOOL)a3;
- (void)setMediaItemDownloadInfo:(id)a3;
- (void)setPath:(id)a3;
- (void)setPowerRequired:(BOOL)a3;
- (void)setPrettyName:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setProgressBlock:(id)a3;
- (void)setProtectionType:(int)a3;
- (void)setQueueDuration:(double)a3;
- (void)setQueueStartTime:(double)a3;
- (void)setReadyForStore:(BOOL)a3;
- (void)setResumeData:(id)a3;
- (void)setStoreInfo:(id)a3;
- (void)setStorePID:(int64_t)a3;
- (void)setStorePlist:(id)a3;
- (void)setTotalBytes:(unint64_t)a3;
- (void)setTransferDuration:(double)a3;
- (void)setTransferStartTime:(double)a3;
- (void)setVariantOptions:(id)a3;
@end

@implementation ATAsset

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_mediaItemDownloadInfo, 0);
  objc_storeStrong((id *)&self->_downloadSourceContainerId, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_clientParams, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
  objc_storeStrong((id *)&self->_storePlist, 0);
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_prettyName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localPath, 0);
  objc_storeStrong((id *)&self->_variantOptions, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)isInstalled
{
  return self->_installed;
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
}

- (BOOL)isLegacy
{
  return self->_legacy;
}

- (void)setProgressBlock:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletedAssetParts:(unint64_t)a3
{
  self->_completedAssetParts = a3;
}

- (unint64_t)completedAssetParts
{
  return self->_completedAssetParts;
}

- (void)setDeviceWasChargingWhenEnqueued:(BOOL)a3
{
  self->_deviceWasChargingWhenEnqueued = a3;
}

- (BOOL)deviceWasChargingWhenEnqueued
{
  return self->_deviceWasChargingWhenEnqueued;
}

- (void)setBytesRemaining:(unint64_t)a3
{
  self->_bytesRemaining = a3;
}

- (unint64_t)bytesRemaining
{
  return self->_bytesRemaining;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_totalBytes = a3;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setCanProxyUseCellularData:(BOOL)a3
{
  self->_canProxyUseCellularData = a3;
}

- (BOOL)canProxyUseCellularData
{
  return self->_canProxyUseCellularData;
}

- (void)setIsRetry:(BOOL)a3
{
  self->_isRetry = a3;
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (void)setMediaItemDownloadInfo:(id)a3
{
}

- (NMSDownloadableItem)mediaItemDownloadInfo
{
  return self->_mediaItemDownloadInfo;
}

- (void)setInstallStarted:(BOOL)a3
{
  self->_installStarted = a3;
}

- (BOOL)installStarted
{
  return self->_installStarted;
}

- (void)setDownloadOnly:(BOOL)a3
{
  self->_downloadOnly = a3;
}

- (BOOL)downloadOnly
{
  return self->_downloadOnly;
}

- (void)setDownloadSourceContainerId:(id)a3
{
}

- (NSNumber)downloadSourceContainerId
{
  return self->_downloadSourceContainerId;
}

- (void)setDownloadPauseReason:(unint64_t)a3
{
  self->_downloadPauseReason = a3;
}

- (unint64_t)downloadPauseReason
{
  return self->_downloadPauseReason;
}

- (void)setAllowDownloadOnConstrainedNetwork:(BOOL)a3
{
  self->_allowDownloadOnConstrainedNetwork = a3;
}

- (BOOL)allowDownloadOnConstrainedNetwork
{
  return self->_allowDownloadOnConstrainedNetwork;
}

- (void)setEnqueueSource:(int64_t)a3
{
  self->_enqueueSource = a3;
}

- (int64_t)enqueueSource
{
  return self->_enqueueSource;
}

- (void)setResumeData:(id)a3
{
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setProtectionType:(int)a3
{
  self->_protectionType = a3;
}

- (int)protectionType
{
  return self->_protectionType;
}

- (void)setCanUseCellularData:(BOOL)a3
{
  self->_canUseCellularData = a3;
}

- (BOOL)canUseCellularData
{
  return self->_canUseCellularData;
}

- (void)setPowerRequired:(BOOL)a3
{
  self->_powerRequired = a3;
}

- (BOOL)powerRequired
{
  return self->_powerRequired;
}

- (void)setLyricsEmbeddedInAsset:(BOOL)a3
{
  self->_lyricsEmbeddedInAsset = a3;
}

- (BOOL)lyricsEmbeddedInAsset
{
  return self->_lyricsEmbeddedInAsset;
}

- (void)setQueueDuration:(double)a3
{
  self->_queueDuration = a3;
}

- (double)queueDuration
{
  return self->_queueDuration;
}

- (void)setQueueStartTime:(double)a3
{
  self->_queueStartTime = a3;
}

- (double)queueStartTime
{
  return self->_queueStartTime;
}

- (void)setTransferDuration:(double)a3
{
  self->_transferDuration = a3;
}

- (double)transferDuration
{
  return self->_transferDuration;
}

- (void)setTransferStartTime:(double)a3
{
  self->_transferStartTime = a3;
}

- (double)transferStartTime
{
  return self->_transferStartTime;
}

- (void)setAssetState:(int64_t)a3
{
  self->_assetState = a3;
}

- (int64_t)assetState
{
  return self->_assetState;
}

- (void)setClientParams:(id)a3
{
}

- (NSDictionary)clientParams
{
  return self->_clientParams;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setInfoPlist:(id)a3
{
}

- (NSString)infoPlist
{
  return self->_infoPlist;
}

- (void)setStorePlist:(id)a3
{
}

- (NSString)storePlist
{
  return self->_storePlist;
}

- (void)setStoreInfo:(id)a3
{
}

- (ATStoreInfo)storeInfo
{
  return self->_storeInfo;
}

- (void)setIcon:(id)a3
{
}

- (NSURL)icon
{
  return self->_icon;
}

- (void)setInstallProgress:(float)a3
{
  self->_installProgress = a3;
}

- (float)installProgress
{
  return self->_installProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setStorePID:(int64_t)a3
{
  self->_storePID = a3;
}

- (int64_t)storePID
{
  return self->_storePID;
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setIsPrioritized:(BOOL)a3
{
  self->_isPrioritized = a3;
}

- (BOOL)isPrioritized
{
  return self->_isPrioritized;
}

- (void)setReadyForStore:(BOOL)a3
{
  self->_readyForStore = a3;
}

- (BOOL)readyForStore
{
  return self->_readyForStore;
}

- (void)setInstallOnly:(BOOL)a3
{
  self->_installOnly = a3;
}

- (BOOL)installOnly
{
  return self->_installOnly;
}

- (void)setBypassStore:(BOOL)a3
{
  self->_bypassStore = a3;
}

- (BOOL)bypassStore
{
  return self->_bypassStore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsDownload:(BOOL)a3
{
  self->_isDownload = a3;
}

- (BOOL)isDownload
{
  return self->_isDownload;
}

- (void)setPrettyName:(id)a3
{
}

- (NSString)prettyName
{
  return self->_prettyName;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_localPath;
}

- (void)setVariantOptions:(id)a3
{
}

- (NSDictionary)variantOptions
{
  return self->_variantOptions;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setDataclass:(id)a3
{
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_ATAssetTypeFromDataClass:(id)a3
{
  id v3 = a3;
  if (_ATAssetTypeFromDataClass__onceToken != -1) {
    dispatch_once(&_ATAssetTypeFromDataClass__onceToken, &__block_literal_global_601);
  }
  uint64_t v4 = [(id)_ATAssetTypeFromDataClass__dataClassByKind objectForKeyedSubscript:v3];
  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"Unknown";
  }

  return v5;
}

uint64_t __37__ATAsset__ATAssetTypeFromDataClass___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)_ATAssetTypeFromDataClass__dataClassByKind;
  _ATAssetTypeFromDataClass__dataClassByKind = (uint64_t)v0;

  [(id)_ATAssetTypeFromDataClass__dataClassByKind setObject:@"Application" forKeyedSubscript:@"Application"];
  [(id)_ATAssetTypeFromDataClass__dataClassByKind setObject:@"EBook" forKeyedSubscript:@"Book"];
  [(id)_ATAssetTypeFromDataClass__dataClassByKind setObject:@"Media" forKeyedSubscript:@"Media"];
  [(id)_ATAssetTypeFromDataClass__dataClassByKind setObject:@"Photo" forKeyedSubscript:@"Photo"];
  v2 = (void *)_ATAssetTypeFromDataClass__dataClassByKind;
  return [v2 setObject:@"Podcast" forKeyedSubscript:@"Podcasts"];
}

- (id)_variantDescription
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089D8] string];
  uint64_t v4 = v3;
  if (self->_variantOptions)
  {
    [v3 appendString:@"{"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [(NSDictionary *)self->_variantOptions allKeys];
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((unint64_t)[v4 length] >= 2) {
            [v4 appendString:@", "];
          }
          int v10 = [v9 isEqualToString:@"Dimensions"];
          v11 = [(NSDictionary *)self->_variantOptions valueForKey:v9];
          v12 = v11;
          if (v10)
          {
            v13 = [v11 objectAtIndexedSubscript:0];
            v14 = [v12 objectAtIndexedSubscript:1];
            [v4 appendFormat:@"%@=[%@x%@]", v9, v13, v14];
          }
          else
          {
            [v4 appendFormat:@"%@=%@", v9, v11];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    v15 = @"}";
  }
  else
  {
    v15 = @"(null)";
  }
  [v4 appendString:v15];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(ATAsset *)self storeInfo];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setStoreInfo:v6];

  uint64_t v7 = [(ATAsset *)self identifier];
  [v4 setIdentifier:v7];

  v8 = [(ATAsset *)self dataclass];
  [v4 setDataclass:v8];

  v9 = [(ATAsset *)self assetType];
  [v4 setAssetType:v9];

  int v10 = [(ATAsset *)self variantOptions];
  [v4 setVariantOptions:v10];

  v11 = [(ATAsset *)self path];
  [v4 setPath:v11];

  v12 = [(ATAsset *)self icon];
  [v4 setIcon:v12];

  v13 = [(ATAsset *)self prettyName];
  [v4 setPrettyName:v13];

  objc_msgSend(v4, "setIsDownload:", -[ATAsset isDownload](self, "isDownload"));
  objc_msgSend(v4, "setIsRestore:", -[ATAsset isRestore](self, "isRestore"));
  objc_msgSend(v4, "setBypassStore:", -[ATAsset bypassStore](self, "bypassStore"));
  objc_msgSend(v4, "setInstallOnly:", -[ATAsset installOnly](self, "installOnly"));
  objc_msgSend(v4, "setReadyForStore:", -[ATAsset readyForStore](self, "readyForStore"));
  objc_msgSend(v4, "setIsPrioritized:", -[ATAsset isPrioritized](self, "isPrioritized"));
  objc_msgSend(v4, "setIsForeground:", -[ATAsset isForeground](self, "isForeground"));
  objc_msgSend(v4, "setLyricsEmbeddedInAsset:", -[ATAsset lyricsEmbeddedInAsset](self, "lyricsEmbeddedInAsset"));
  objc_msgSend(v4, "setStorePID:", -[ATAsset storePID](self, "storePID"));
  objc_msgSend(v4, "setPriority:", -[ATAsset priority](self, "priority"));
  [(ATAsset *)self downloadProgress];
  objc_msgSend(v4, "setDownloadProgress:");
  [(ATAsset *)self installProgress];
  objc_msgSend(v4, "setInstallProgress:");
  v14 = [(ATAsset *)self storePlist];
  [v4 setStorePlist:v14];

  v15 = [(ATAsset *)self infoPlist];
  [v4 setInfoPlist:v15];

  v16 = [(ATAsset *)self error];
  [v4 setError:v16];

  v17 = [(ATAsset *)self clientParams];
  [v4 setClientParams:v17];

  [(ATAsset *)self transferStartTime];
  objc_msgSend(v4, "setTransferStartTime:");
  [(ATAsset *)self transferDuration];
  objc_msgSend(v4, "setTransferDuration:");
  [(ATAsset *)self queueStartTime];
  objc_msgSend(v4, "setQueueStartTime:");
  [(ATAsset *)self queueDuration];
  objc_msgSend(v4, "setQueueDuration:");
  objc_msgSend(v4, "setLegacy:", -[ATAsset isLegacy](self, "isLegacy"));
  objc_msgSend(v4, "setCompletedAssetParts:", -[ATAsset completedAssetParts](self, "completedAssetParts"));
  objc_msgSend(v4, "setInstalled:", -[ATAsset isInstalled](self, "isInstalled"));
  objc_msgSend(v4, "setPowerRequired:", -[ATAsset powerRequired](self, "powerRequired"));
  objc_msgSend(v4, "setCanUseCellularData:", -[ATAsset canUseCellularData](self, "canUseCellularData"));
  objc_msgSend(v4, "setProtectionType:", -[ATAsset protectionType](self, "protectionType"));
  objc_msgSend(v4, "setEnqueueSource:", -[ATAsset enqueueSource](self, "enqueueSource"));
  objc_msgSend(v4, "setAllowDownloadOnConstrainedNetwork:", -[ATAsset allowDownloadOnConstrainedNetwork](self, "allowDownloadOnConstrainedNetwork"));
  objc_msgSend(v4, "setDownloadPauseReason:", -[ATAsset downloadPauseReason](self, "downloadPauseReason"));
  long long v18 = [(ATAsset *)self downloadSourceContainerId];
  [v4 setDownloadSourceContainerId:v18];

  return v4;
}

- (ATAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ATAsset;
  uint64_t v5 = [(ATAsset *)&v44 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataclass"];
    dataclass = v5->_dataclass;
    v5->_dataclass = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"variantOptions"];
    variantOptions = v5->_variantOptions;
    v5->_variantOptions = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    localPath = v5->_localPath;
    v5->_localPath = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prettyName"];
    prettyName = v5->_prettyName;
    v5->_prettyName = (NSString *)v21;

    v5->_isDownload = [v4 decodeBoolForKey:@"isDownload"];
    v5->_downloadOnly = [v4 decodeBoolForKey:@"downloadOnly"];
    v5->_isRestore = [v4 decodeBoolForKey:@"isRestore"];
    v5->_bypassStore = [v4 decodeBoolForKey:@"bypassStore"];
    v5->_isPrioritized = [v4 decodeBoolForKey:@"prioritize"];
    v5->_isForeground = [v4 decodeBoolForKey:@"isForeground"];
    v5->_lyricsEmbeddedInAsset = [v4 decodeBoolForKey:@"lyricsEmbeddedInAsset"];
    [v4 decodeFloatForKey:@"downloadProgress"];
    v5->_downloadProgress = v23;
    [v4 decodeFloatForKey:@"installProgress"];
    v5->_installProgress = v24;
    v25 = NSURL;
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    uint64_t v27 = [v25 URLWithString:v26];
    icon = v5->_icon;
    v5->_icon = (NSURL *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeInfo"];
    storeInfo = v5->_storeInfo;
    v5->_storeInfo = (ATStoreInfo *)v29;

    v31 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"clientParams"];
    clientParams = v5->_clientParams;
    v5->_clientParams = (NSDictionary *)v36;

    v5->_assetState = [v4 decodeIntegerForKey:@"assetState"];
    v5->_powerRequired = [v4 decodeBoolForKey:@"powerRequired"];
    v5->_canUseCellularData = [v4 decodeBoolForKey:@"canUseCellularData"];
    v5->_protectionType = [v4 decodeIntForKey:@"protectionType"];
    v5->_enqueueSource = (int)[v4 decodeIntForKey:@"enqueueSource"];
    v5->_allowDownloadOnConstrainedNetwork = [v4 decodeBoolForKey:@"allowDownloadOnConstrainedNetwork"];
    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadPausedReason"];
    v5->_downloadPauseReason = [v38 unsignedIntegerValue];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadSourceContainerId"];
    downloadSourceContainerId = v5->_downloadSourceContainerId;
    v5->_downloadSourceContainerId = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v41;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  uint64_t v6 = (void *)[(NSString *)identifier copy];
  [v5 encodeObject:v6 forKey:@"identifier"];

  uint64_t v7 = (void *)[(NSString *)self->_dataclass copy];
  [v5 encodeObject:v7 forKey:@"dataclass"];

  uint64_t v8 = (void *)[(NSString *)self->_assetType copy];
  [v5 encodeObject:v8 forKey:@"assetType"];

  v9 = (void *)[(NSDictionary *)self->_variantOptions copy];
  [v5 encodeObject:v9 forKey:@"variantOptions"];

  uint64_t v10 = (void *)[(NSString *)self->_localPath copy];
  [v5 encodeObject:v10 forKey:@"path"];

  v11 = (void *)[(NSString *)self->_prettyName copy];
  [v5 encodeObject:v11 forKey:@"prettyName"];

  [v5 encodeBool:self->_isDownload forKey:@"isDownload"];
  [v5 encodeBool:self->_downloadOnly forKey:@"downloadOnly"];
  [v5 encodeBool:self->_isRestore forKey:@"isRestore"];
  [v5 encodeBool:self->_bypassStore forKey:@"bypassStore"];
  [v5 encodeBool:self->_isPrioritized forKey:@"prioritize"];
  [v5 encodeBool:self->_isForeground forKey:@"isForeground"];
  [v5 encodeBool:self->_lyricsEmbeddedInAsset forKey:@"lyricsEmbeddedInAsset"];
  *(float *)&double v12 = self->_downloadProgress;
  [v5 encodeFloat:@"downloadProgress" forKey:v12];
  *(float *)&double v13 = self->_installProgress;
  [v5 encodeFloat:@"installProgress" forKey:v13];
  uint64_t v14 = [(NSURL *)self->_icon path];
  uint64_t v15 = (void *)[v14 copy];
  [v5 encodeObject:v15 forKey:@"icon"];

  v16 = (void *)[(ATStoreInfo *)self->_storeInfo copy];
  [v5 encodeObject:v16 forKey:@"storeInfo"];

  uint64_t v17 = (void *)[(NSDictionary *)self->_clientParams copy];
  [v5 encodeObject:v17 forKey:@"clientParams"];

  [v5 encodeInteger:self->_assetState forKey:@"assetState"];
  [v5 encodeBool:self->_powerRequired forKey:@"powerRequired"];
  [v5 encodeBool:self->_canUseCellularData forKey:@"canUseCellularData"];
  [v5 encodeInteger:self->_protectionType forKey:@"protectionType"];
  [v5 encodeInteger:self->_enqueueSource forKey:@"enqueueSource"];
  [v5 encodeBool:self->_allowDownloadOnConstrainedNetwork forKey:@"allowDownloadOnConstrainedNetwork"];
  long long v18 = [NSNumber numberWithUnsignedInteger:self->_downloadPauseReason];
  [v5 encodeObject:v18 forKey:@"downloadPausedReason"];

  uint64_t v19 = (void *)[(NSNumber *)self->_downloadSourceContainerId copy];
  [v5 encodeObject:v19 forKey:@"downloadSourceContainerId"];

  id v21 = (id)[(NSError *)self->_error copy];
  long long v20 = objc_msgSend(v21, "msv_errorByRemovingUnsafeUserInfo");
  [v5 encodeObject:v20 forKey:@"error"];
}

- (unint64_t)assetParts
{
  v2 = [(ATAsset *)self variantOptions];
  id v3 = [v2 objectForKey:@"AssetParts"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)serializedAsset
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  identifier = self->_identifier;
  if (identifier)
  {
    id v5 = (void *)[(NSString *)identifier copy];
    [v3 setObject:v5 forKey:@"identifier"];
  }
  dataclass = self->_dataclass;
  if (dataclass)
  {
    uint64_t v7 = (void *)[(NSString *)dataclass copy];
    [v3 setObject:v7 forKey:@"dataclass"];
  }
  assetType = self->_assetType;
  if (assetType)
  {
    v9 = (void *)[(NSString *)assetType copy];
    [v3 setObject:v9 forKey:@"assetType"];
  }
  variantOptions = self->_variantOptions;
  if (variantOptions)
  {
    v11 = (void *)[(NSDictionary *)variantOptions copy];
    [v3 setObject:v11 forKey:@"variantOptions"];
  }
  localPath = self->_localPath;
  if (localPath)
  {
    double v13 = (void *)[(NSString *)localPath copy];
    [v3 setObject:v13 forKey:@"path"];
  }
  prettyName = self->_prettyName;
  if (prettyName)
  {
    uint64_t v15 = (void *)[(NSString *)prettyName copy];
    [v3 setObject:v15 forKey:@"prettyName"];
  }
  clientParams = self->_clientParams;
  if (clientParams)
  {
    uint64_t v17 = (void *)[(NSDictionary *)clientParams copy];
    [v3 setObject:v17 forKey:@"clientParams"];
  }
  downloadSourceContainerId = self->_downloadSourceContainerId;
  if (downloadSourceContainerId)
  {
    uint64_t v19 = (void *)[(NSNumber *)downloadSourceContainerId copy];
    [v3 setObject:v19 forKey:@"downloadSourceContainerId"];
  }
  error = self->_error;
  if (error)
  {
    id v21 = (void *)[(NSError *)error copy];
    [v3 setObject:v21 forKey:@"error"];
  }
  v22 = [NSNumber numberWithBool:self->_isDownload];
  [v3 setObject:v22 forKey:@"isDownload"];

  float v23 = [NSNumber numberWithBool:self->_isRestore];
  [v3 setObject:v23 forKey:@"isRestore"];

  float v24 = [NSNumber numberWithBool:self->_bypassStore];
  [v3 setObject:v24 forKey:@"bypassStore"];

  v25 = [NSNumber numberWithBool:self->_isPrioritized];
  [v3 setObject:v25 forKey:@"prioritize"];

  v26 = [NSNumber numberWithBool:self->_isForeground];
  [v3 setObject:v26 forKey:@"isForeground"];

  *(float *)&double v27 = self->_downloadProgress;
  v28 = [NSNumber numberWithFloat:v27];
  [v3 setObject:v28 forKey:@"downloadProgress"];

  *(float *)&double v29 = self->_installProgress;
  v30 = [NSNumber numberWithFloat:v29];
  [v3 setObject:v30 forKey:@"installProgress"];

  v31 = [NSNumber numberWithInteger:self->_assetState];
  [v3 setObject:v31 forKey:@"assetState"];

  uint64_t v32 = [NSNumber numberWithBool:self->_downloadOnly];
  [v3 setObject:v32 forKey:@"downloadOnly"];

  uint64_t v33 = [NSNumber numberWithBool:self->_lyricsEmbeddedInAsset];
  [v3 setObject:v33 forKey:@"lyricsEmbeddedInAsset"];

  uint64_t v34 = [NSNumber numberWithBool:self->_powerRequired];
  [v3 setObject:v34 forKey:@"powerRequired"];

  v35 = [NSNumber numberWithBool:self->_canUseCellularData];
  [v3 setObject:v35 forKey:@"canUseCellularData"];

  uint64_t v36 = [NSNumber numberWithInteger:self->_protectionType];
  [v3 setObject:v36 forKey:@"protectionType"];

  v37 = [NSNumber numberWithInteger:self->_enqueueSource];
  [v3 setObject:v37 forKey:@"enqueueSource"];

  v38 = [NSNumber numberWithBool:self->_allowDownloadOnConstrainedNetwork];
  [v3 setObject:v38 forKey:@"allowDownloadOnConstrainedNetwork"];

  uint64_t v39 = [NSNumber numberWithUnsignedInteger:self->_downloadPauseReason];
  [v3 setObject:v39 forKey:@"downloadPausedReason"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dataclass hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  return v4 ^ [(ATAsset *)self assetParts];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATAsset *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      dataclass = self->_dataclass;
      uint64_t v7 = [(ATAsset *)v5 dataclass];
      if ([(NSString *)dataclass isEqualToString:v7])
      {
        identifier = self->_identifier;
        v9 = [(ATAsset *)v5 identifier];
        if ([(NSString *)identifier isEqualToString:v9])
        {
          unint64_t v10 = [(ATAsset *)self assetParts];
          BOOL v11 = v10 == [(ATAsset *)v5 assetParts];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (ATAsset)initWithIdentifier:(id)a3 dataclass:(id)a4 prettyName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(ATAsset *)self init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_dataclass, a4);
    objc_storeStrong((id *)&v13->_prettyName, a5);
    v13->_downloadPauseReason = 0;
    uint64_t v14 = [(ATAsset *)v13 _ATAssetTypeFromDataClass:v10];
    assetType = v13->_assetType;
    v13->_assetType = (NSString *)v14;
  }
  return v13;
}

- (ATAsset)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATAsset;
  v2 = [(ATAsset *)&v7 init];
  NSUInteger v3 = (ATAsset *)v2;
  if (v2)
  {
    v2[64] = 1;
    v2[221] = 0;
    *(_WORD *)(v2 + 69) = 0;
    v2[216] = 0;
    *((void *)v2 + 28) = 0;
    v2[71] = 0;
    *((_WORD *)v2 + 46) = 256;
    *((_DWORD *)v2 + 24) = 0;
    *((void *)v2 + 23) = 0;
    v2[192] = 0;
    NSUInteger v4 = (void *)*((void *)v2 + 26);
    *((void *)v2 + 25) = 0;
    *((void *)v2 + 26) = &unk_26C7137D0;

    assetType = v3->_assetType;
    v3->_assetType = (NSString *)@"Unknown";
  }
  return v3;
}

- (id)shortDescription
{
  if (MSVDeviceIsWatch() && (MSVDeviceOSIsInternalInstall() & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)ATAsset;
    objc_super v7 = [(ATAsset *)&v10 description];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ATAsset;
    NSUInteger v3 = [(ATAsset *)&v9 description];
    NSUInteger v4 = v3;
    if (self->_isRestore) {
      id v5 = @"Restore ";
    }
    else {
      id v5 = @"Sync ";
    }
    uint64_t v6 = @"Download";
    if (!self->_isDownload) {
      uint64_t v6 = @"Upload";
    }
    objc_super v7 = [v3 stringByAppendingFormat:@"[%@%@, %@, id=%@, \"%@\"]", v5, v6, self->_dataclass, self->_identifier, self->_prettyName];
  }
  return v7;
}

- (id)description
{
  if (MSVDeviceIsWatch() && (MSVDeviceOSIsInternalInstall() & 1) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)ATAsset;
    double v13 = [(ATAsset *)&v18 description];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ATAsset;
    NSUInteger v3 = [(ATAsset *)&v17 description];
    if (self->_isRestore) {
      NSUInteger v4 = @"Restore ";
    }
    else {
      NSUInteger v4 = @"Sync ";
    }
    v16 = v4;
    if (self->_isDownload) {
      id v5 = @"Download";
    }
    else {
      id v5 = @"Upload";
    }
    long long v15 = *(_OWORD *)&self->_dataclass;
    identifier = self->_identifier;
    objc_super v7 = [(ATStoreInfo *)self->_storeInfo syncID];
    uint64_t v8 = [(ATStoreInfo *)self->_storeInfo adamID];
    objc_super v9 = [(ATStoreInfo *)self->_storeInfo sagaID];
    uint64_t v10 = [(NSNumber *)self->_downloadSourceContainerId longLongValue];
    id v11 = [(ATStoreInfo *)self->_storeInfo endpointType];
    double v12 = [(ATAsset *)self _variantDescription];
    objc_msgSend(v3, "stringByAppendingFormat:", @"[%@%@, %@, %@, id=%@, syncid=%@, adamID=%@, sagaID=%@, downloadSourceContainerId=%lld, endpointType=%@, var=%@, path=%@, pid=%lld, bypassStore=%d, prioritized=%d, foreground=%d, installOnly=%d, allowDownloadOnConstrainedNetwork=%d, downloadPauseReason=%d, \"%@\"]", v16, v5, v15, identifier, v7, v8, v9, v10, v11, v12, self->_localPath, self->_storePID, self->_bypassStore, self->_isPrioritized, self->_isForeground, self->_installOnly,
      self->_allowDownloadOnConstrainedNetwork,
      self->_downloadPauseReason,
    double v13 = self->_prettyName);
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)assetWithSerializedAsset:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = objc_alloc_init(ATAsset);
  uint64_t v5 = [v3 objectForKey:@"identifier"];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [v3 objectForKey:@"dataclass"];
  dataclass = v4->_dataclass;
  v4->_dataclass = (NSString *)v7;

  uint64_t v9 = [v3 objectForKey:@"assetType"];
  assetType = v4->_assetType;
  v4->_assetType = (NSString *)v9;

  uint64_t v11 = [v3 objectForKey:@"variantOptions"];
  variantOptions = v4->_variantOptions;
  v4->_variantOptions = (NSDictionary *)v11;

  uint64_t v13 = [v3 objectForKey:@"path"];
  localPath = v4->_localPath;
  v4->_localPath = (NSString *)v13;

  uint64_t v15 = [v3 objectForKey:@"prettyName"];
  prettyName = v4->_prettyName;
  v4->_prettyName = (NSString *)v15;

  objc_super v17 = [v3 objectForKey:@"isDownload"];
  v4->_isDownload = [v17 BOOLValue];

  objc_super v18 = [v3 objectForKey:@"isRestore"];
  v4->_isRestore = [v18 BOOLValue];

  uint64_t v19 = [v3 objectForKey:@"bypassStore"];
  v4->_bypassStore = [v19 BOOLValue];

  long long v20 = [v3 objectForKey:@"prioritize"];
  v4->_isPrioritized = [v20 BOOLValue];

  id v21 = [v3 objectForKey:@"isForeground"];
  v4->_isForeground = [v21 BOOLValue];

  v22 = [v3 objectForKey:@"downloadProgress"];
  [v22 floatValue];
  v4->_downloadProgress = v23;

  float v24 = [v3 objectForKey:@"installProgress"];
  [v24 floatValue];
  v4->_installProgress = v25;

  uint64_t v26 = [v3 objectForKey:@"clientParams"];
  clientParams = v4->_clientParams;
  v4->_clientParams = (NSDictionary *)v26;

  v28 = [v3 objectForKey:@"assetState"];
  v4->_assetState = [v28 integerValue];

  double v29 = [v3 objectForKey:@"downloadOnly"];
  v4->_downloadOnly = [v29 BOOLValue];

  v30 = [v3 objectForKey:@"lyricsEmbeddedInAsset"];
  v4->_lyricsEmbeddedInAsset = [v30 BOOLValue];

  v31 = [v3 objectForKey:@"powerRequired"];
  v4->_powerRequired = [v31 BOOLValue];

  uint64_t v32 = [v3 objectForKey:@"canUseCellularData"];
  v4->_canUseCellularData = [v32 BOOLValue];

  uint64_t v33 = [v3 objectForKey:@"protectionType"];
  v4->_protectionType = [v33 intValue];

  uint64_t v34 = [v3 objectForKey:@"enqueueSource"];
  v4->_enqueueSource = (int)[v34 intValue];

  v35 = [v3 objectForKey:@"allowDownloadOnConstrainedNetwork"];
  v4->_allowDownloadOnConstrainedNetwork = [v35 BOOLValue];

  uint64_t v36 = [v3 objectForKey:@"downloadPausedReason"];
  v4->_downloadPauseReason = [v36 unsignedIntegerValue];

  uint64_t v37 = [v3 objectForKey:@"downloadSourceContainerId"];
  downloadSourceContainerId = v4->_downloadSourceContainerId;
  v4->_downloadSourceContainerId = (NSNumber *)v37;

  uint64_t v39 = [v3 objectForKey:@"error"];

  error = v4->_error;
  v4->_error = (NSError *)v39;

  return v4;
}

+ (id)iCloudRestoreAssetWithIdentifier:(id)a3 dataclass:(id)a4 assetType:(id)a5 restorePath:(id)a6 displayName:(id)a7
{
  uint64_t v11 = (NSString *)a5;
  double v12 = (NSString *)a6;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  v16 = [[ATAsset alloc] initWithIdentifier:v15 dataclass:v14 prettyName:v13];

  assetType = v16->_assetType;
  v16->_assetType = v11;
  objc_super v18 = v11;

  localPath = v16->_localPath;
  v16->_localPath = v12;

  *(_WORD *)&v16->_isRestore = 257;
  v16->_legacy = 1;
  return v16;
}

+ (id)uploadAssetWithIdentifier:(id)a3 dataclass:(id)a4 sourcePath:(id)a5 prettyName:(id)a6
{
  uint64_t v9 = (NSString *)a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[ATAsset alloc] initWithIdentifier:v12 dataclass:v11 prettyName:v10];

  localPath = v13->_localPath;
  v13->_localPath = v9;

  v13->_isDownload = 0;
  v13->_legacy = 1;
  return v13;
}

+ (id)downloadAssetWithIdentifier:(id)a3 dataclass:(id)a4 prettyName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[ATAsset alloc] initWithIdentifier:v9 dataclass:v8 prettyName:v7];

  v10->_legacy = 1;
  return v10;
}

@end