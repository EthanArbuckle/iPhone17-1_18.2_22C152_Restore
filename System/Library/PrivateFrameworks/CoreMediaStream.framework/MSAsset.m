@interface MSAsset
+ (BOOL)supportsSecureCoding;
+ (id)MSASPAssetFromProtocolDictionary:(id)a3;
+ (id)asset;
+ (id)assetWithAsset:(id)a3;
- (BOOL)assetDataAvailableOnServer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhoto;
- (BOOL)isVideo;
- (MSAsset)init;
- (MSAsset)initWithCoder:(id)a3;
- (MSAsset)initWithGUID:(id)a3;
- (NSData)MMCSHash;
- (NSData)fileData;
- (NSData)masterAssetHash;
- (NSDate)MMCSAccessHeaderTimeStamp;
- (NSDate)batchCreationDate;
- (NSDate)photoCreationDate;
- (NSDictionary)metadata;
- (NSError)error;
- (NSString)GUID;
- (NSString)MMCSAccessHeader;
- (NSString)MMCSReceipt;
- (NSString)MMCSUTI;
- (NSString)assetCollectionGUID;
- (NSString)description;
- (NSString)path;
- (NSURL)MMCSURL;
- (id)MMCSItemType;
- (id)MSASPProtocolDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)metadataValueForKey:(id)a3;
- (id)userInfo;
- (int)MMCSOpenNewFileDescriptor;
- (unint64_t)MMCSItemID;
- (unint64_t)MMCSItemSize;
- (unint64_t)_fileSize;
- (unint64_t)_fileSizeOnDisk;
- (unint64_t)hash;
- (unint64_t)mediaAssetType;
- (unsigned)MMCSItemFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetCollectionGUID:(id)a3;
- (void)setAssetDataAvailableOnServer:(BOOL)a3;
- (void)setBatchCreationDate:(id)a3;
- (void)setError:(id)a3;
- (void)setFileData:(id)a3;
- (void)setGUID:(id)a3;
- (void)setMMCSAccessHeader:(id)a3;
- (void)setMMCSAccessHeader:(id)a3 andTimeStamp:(id)a4;
- (void)setMMCSAccessHeaderTimeStamp:(id)a3;
- (void)setMMCSHash:(id)a3;
- (void)setMMCSItemFlags:(unsigned int)a3;
- (void)setMMCSItemID:(unint64_t)a3;
- (void)setMMCSItemSize:(unint64_t)a3;
- (void)setMMCSReceipt:(id)a3;
- (void)setMMCSURL:(id)a3;
- (void)setMMCSUTI:(id)a3;
- (void)setMasterAssetHash:(id)a3;
- (void)setMediaAssetType:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setPath:(id)a3;
- (void)setPhotoCreationDate:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MSAsset

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_photoCreationDate, 0);
  objc_storeStrong((id *)&self->_batchCreationDate, 0);
  objc_storeStrong((id *)&self->_assetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_MMCSReceipt, 0);
  objc_storeStrong((id *)&self->_MMCSAccessHeaderTimeStamp, 0);
  objc_storeStrong((id *)&self->_MMCSAccessHeader, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_MMCSURL, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_masterAssetHash, 0);
}

- (void)setAssetDataAvailableOnServer:(BOOL)a3
{
  self->_assetDataAvailableOnServer = a3;
}

- (BOOL)assetDataAvailableOnServer
{
  return self->_assetDataAvailableOnServer;
}

- (void)setMediaAssetType:(unint64_t)a3
{
  self->_mediaAssetType = a3;
}

- (unint64_t)mediaAssetType
{
  return self->_mediaAssetType;
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setPhotoCreationDate:(id)a3
{
}

- (NSDate)photoCreationDate
{
  return self->_photoCreationDate;
}

- (void)setBatchCreationDate:(id)a3
{
}

- (NSDate)batchCreationDate
{
  return self->_batchCreationDate;
}

- (void)setAssetCollectionGUID:(id)a3
{
}

- (NSString)assetCollectionGUID
{
  return self->_assetCollectionGUID;
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setMMCSReceipt:(id)a3
{
}

- (NSString)MMCSReceipt
{
  return self->_MMCSReceipt;
}

- (void)setMMCSAccessHeaderTimeStamp:(id)a3
{
}

- (NSDate)MMCSAccessHeaderTimeStamp
{
  return self->_MMCSAccessHeaderTimeStamp;
}

- (NSString)MMCSAccessHeader
{
  return self->_MMCSAccessHeader;
}

- (void)setMMCSItemSize:(unint64_t)a3
{
  self->_protocolFileSize = a3;
}

- (unint64_t)MMCSItemSize
{
  return self->_protocolFileSize;
}

- (void)setMMCSHash:(id)a3
{
}

- (NSData)MMCSHash
{
  return self->_fileHash;
}

- (void)setMMCSUTI:(id)a3
{
}

- (NSString)MMCSUTI
{
  return self->_type;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setFileData:(id)a3
{
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setMMCSURL:(id)a3
{
}

- (NSURL)MMCSURL
{
  return self->_MMCSURL;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMasterAssetHash:(id)a3
{
}

- (NSData)masterAssetHash
{
  return self->_masterAssetHash;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v11];
  id v4 = v11;
  v5 = v4;
  if (!v3)
  {
    v6 = NSString;
    v7 = [v4 userInfo];
    v8 = [v6 stringWithFormat:@"Failed to archive an MSAsset object. Error: %@ Info: %@", v5, v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  v9 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v3 outError:0];

  return v9;
}

- (id)metadataValueForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSDictionary *)v5->_metadata objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  metadata = v7->_metadata;
  if (metadata) {
    v9 = (NSDictionary *)[(NSDictionary *)metadata mutableCopy];
  }
  else {
    v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v10 = v9;
  if (v12) {
    [(NSDictionary *)v9 setObject:v12 forKey:v6];
  }
  else {
    [(NSDictionary *)v9 removeObjectForKey:v6];
  }
  id v11 = v7->_metadata;
  v7->_metadata = v10;

  objc_sync_exit(v7);
}

- (MSAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MSAsset;
  v5 = [(MSAsset *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"masterAssetHash"];
    masterAssetHash = v5->_masterAssetHash;
    v5->_masterAssetHash = (NSData *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileHash"];
    fileHash = v5->_fileHash;
    v5->_fileHash = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileData"];
    fileData = v5->_fileData;
    v5->_fileData = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MMCSAccessHeader"];
    MMCSAccessHeader = v5->_MMCSAccessHeader;
    v5->_MMCSAccessHeader = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MMCSAccessHeaderTimeStamp"];
    MMCSAccessHeaderTimeStamp = v5->_MMCSAccessHeaderTimeStamp;
    v5->_MMCSAccessHeaderTimeStamp = (NSDate *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MMCSReceipt"];
    MMCSReceipt = v5->_MMCSReceipt;
    v5->_MMCSReceipt = (NSString *)v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MMCSURL"];
    if (v32)
    {
      uint64_t v33 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v32];
      MMCSURL = v5->_MMCSURL;
      v5->_MMCSURL = (NSURL *)v33;
    }
    v5->_protocolFileSize = [v4 decodeInt64ForKey:@"protocolFileSize"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetCollectionGUID"];
    assetCollectionGUID = v5->_assetCollectionGUID;
    v5->_assetCollectionGUID = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batchCreationDate"];
    batchCreationDate = v5->_batchCreationDate;
    v5->_batchCreationDate = (NSDate *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoCreationDate"];
    photoCreationDate = v5->_photoCreationDate;
    v5->_photoCreationDate = (NSDate *)v41;

    v43 = [v4 decodePropertyListForKey:@"userInfo"];
    [(MSAsset *)v5 setUserInfo:v43];

    v5->_mediaAssetType = [v4 decodeIntegerForKey:@"mediaAssetType"];
    v5->_assetDataAvailableOnServer = [v4 decodeBoolForKey:@"assetDataAvailableOnServer"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  masterAssetHash = self->_masterAssetHash;
  id v24 = v4;
  if (masterAssetHash) {
    [v4 encodeObject:masterAssetHash forKey:@"masterAssetHash"];
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  metadata = v6->_metadata;
  if (metadata) {
    [v24 encodeObject:metadata forKey:@"metadata"];
  }
  objc_sync_exit(v6);

  fileHash = v6->_fileHash;
  if (fileHash) {
    [v24 encodeObject:fileHash forKey:@"fileHash"];
  }
  path = v6->_path;
  if (path) {
    [v24 encodeObject:path forKey:@"path"];
  }
  fileData = v6->_fileData;
  if (fileData) {
    [v24 encodeObject:fileData forKey:@"fileData"];
  }
  type = v6->_type;
  if (type) {
    [v24 encodeObject:type forKey:@"type"];
  }
  MMCSAccessHeader = v6->_MMCSAccessHeader;
  if (MMCSAccessHeader) {
    [v24 encodeObject:MMCSAccessHeader forKey:@"MMCSAccessHeader"];
  }
  MMCSAccessHeaderTimeStamp = v6->_MMCSAccessHeaderTimeStamp;
  if (MMCSAccessHeaderTimeStamp) {
    [v24 encodeObject:MMCSAccessHeaderTimeStamp forKey:@"MMCSAccessHeaderTimeStamp"];
  }
  MMCSURL = v6->_MMCSURL;
  if (MMCSURL)
  {
    v15 = [(NSURL *)MMCSURL absoluteString];
    [v24 encodeObject:v15 forKey:@"MMCSURL"];
  }
  MMCSReceipt = v6->_MMCSReceipt;
  v17 = v24;
  if (MMCSReceipt)
  {
    [v24 encodeObject:MMCSReceipt forKey:@"MMCSReceipt"];
    v17 = v24;
  }
  [v17 encodeInt64:v6->_protocolFileSize forKey:@"protocolFileSize"];
  GUID = v6->_GUID;
  if (GUID) {
    [v24 encodeObject:GUID forKey:@"GUID"];
  }
  assetCollectionGUID = v6->_assetCollectionGUID;
  if (assetCollectionGUID) {
    [v24 encodeObject:assetCollectionGUID forKey:@"assetCollectionGUID"];
  }
  batchCreationDate = v6->_batchCreationDate;
  if (batchCreationDate) {
    [v24 encodeObject:batchCreationDate forKey:@"batchCreationDate"];
  }
  photoCreationDate = v6->_photoCreationDate;
  if (photoCreationDate) {
    [v24 encodeObject:photoCreationDate forKey:@"photoCreationDate"];
  }
  uint64_t v22 = [(MSAsset *)v6 userInfo];

  if (v22)
  {
    v23 = [(MSAsset *)v6 userInfo];
    [v24 encodeObject:v23 forKey:@"userInfo"];
  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[MSAsset mediaAssetType](v6, "mediaAssetType"), @"mediaAssetType");
  objc_msgSend(v24, "encodeBool:forKey:", -[MSAsset assetDataAvailableOnServer](v6, "assetDataAvailableOnServer"), @"assetDataAvailableOnServer");
}

- (unint64_t)hash
{
  GUID = self->_GUID;
  if (GUID)
  {
    return [(NSString *)GUID hash];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MSAsset;
    return [(MSAsset *)&v5 hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MSAsset *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      GUID = self->_GUID;
      v7 = [(MSAsset *)v5 GUID];
      LOBYTE(GUID) = [(NSString *)GUID isEqualToString:v7];

      if (GUID)
      {
        unsigned __int8 v8 = 1;
      }
      else
      {
        uint64_t v9 = [(MSAsset *)self assetCollectionGUID];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          unsigned __int8 v8 = 0;
        }
        else
        {
          uint64_t v11 = [(MSAsset *)v5 assetCollectionGUID];

          if (v11)
          {
            unsigned __int8 v8 = 0;
            goto LABEL_12;
          }
          uint64_t v10 = [(NSDictionary *)self->_metadata objectForKey:@"MSAssetMetadataAssetFileTransferUUID"];
          uint64_t v13 = [(MSAsset *)v5 metadataValueForKey:@"MSAssetMetadataAssetFileTransferUUID"];
          uint64_t v14 = (void *)v13;
          if (v10 && v13)
          {
            unsigned __int8 v8 = [v10 isEqualToString:v13];
          }
          else
          {
            fileHash = self->_fileHash;
            uint64_t v16 = [(MSAsset *)v5 fileHash];
            unsigned __int8 v8 = [(NSData *)fileHash isEqual:v16];
          }
        }
      }
LABEL_12:

      goto LABEL_13;
    }
    v17.receiver = self;
    v17.super_class = (Class)MSAsset;
    unsigned __int8 v8 = [(MSAsset *)&v17 isEqual:v4];
  }
LABEL_13:

  return v8;
}

- (unint64_t)_fileSizeOnDisk
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = v3;
  if (self->_path && objc_msgSend(v3, "fileExistsAtPath:"))
  {
    path = self->_path;
    id v13 = 0;
    uint64_t v6 = [v4 attributesOfItemAtPath:path error:&v13];
    id v7 = v13;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = self->_path;
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        __int16 v16 = 2114;
        id v17 = v7;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can't query for file size at path %@. Error: %{public}@", buf, 0x16u);
      }
      unsigned __int8 v8 = [(NSDictionary *)self->_metadata objectForKey:@"MSAssetMetadataFileSize"];
      unint64_t v9 = [v8 unsignedLongLongValue];
    }
    else
    {
      unint64_t v9 = [v6 fileSize];
    }
  }
  else
  {
    uint64_t v10 = [(NSDictionary *)self->_metadata objectForKey:@"MSAssetMetadataFileSize"];
    unint64_t v9 = [v10 unsignedLongLongValue];
  }
  return v9;
}

- (void)setMMCSAccessHeader:(id)a3 andTimeStamp:(id)a4
{
  uint64_t v6 = (NSString *)a3;
  id v7 = (NSDate *)a4;
  MMCSAccessHeader = self->_MMCSAccessHeader;
  self->_MMCSAccessHeader = v6;
  uint64_t v10 = v6;

  MMCSAccessHeaderTimeStamp = self->_MMCSAccessHeaderTimeStamp;
  self->_MMCSAccessHeaderTimeStamp = v7;
}

- (void)setMMCSAccessHeader:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [(MSAsset *)self setMMCSAccessHeader:v5 andTimeStamp:v6];
}

- (id)MMCSItemType
{
  v3 = [(MSAsset *)self path];
  id v4 = [v3 pathExtension];

  if (!v4 || ![v4 length])
  {
    id v5 = [(MSAsset *)self MMCSUTI];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = [v6 preferredFilenameExtension];

        id v4 = (void *)v8;
      }
    }
  }
  return v4;
}

- (int)MMCSOpenNewFileDescriptor
{
  v3 = [(MSAsset *)self path];

  if (!v3) {
    return -1;
  }
  id v4 = [(MSAsset *)self path];
  int v5 = open((const char *)[v4 fileSystemRepresentation], 0);

  return v5;
}

- (void)setMMCSItemID:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    unint64_t v7 = a3;
    __int16 v8 = 2114;
    unint64_t v9 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Setting MMCS Item ID to %lld for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  int v5 = [NSNumber numberWithUnsignedLongLong:a3];
  [(MSAsset *)self addMetadataValue:v5 forKey:@"MSAssetMetadataItemID"];
}

- (unint64_t)MMCSItemID
{
  v2 = [(MSAsset *)self metadataValueForKey:@"MSAssetMetadataItemID"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (void)setMMCSItemFlags:(unsigned int)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Ignoring attempt to set MMCS Item Flags on an MSAsset.", v3, 2u);
  }
}

- (unsigned)MMCSItemFlags
{
  return 1;
}

- (unint64_t)_fileSize
{
  v2 = [(NSDictionary *)self->_metadata objectForKey:@"MSAssetMetadataFileSize"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (BOOL)isVideo
{
  return (self->_mediaAssetType & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

- (BOOL)isPhoto
{
  return self->_mediaAssetType - 1 < 3;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)MSAsset;
  unint64_t v3 = [(MSAsset *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_GUID) {
    [v4 appendFormat:@" GUID: %@ ", self->_GUID];
  }
  if (self->_assetCollectionGUID) {
    [v4 appendFormat:@"Asset collection GUID: %@ ", self->_assetCollectionGUID];
  }
  int v5 = self->_path;
  if (v5 && (os_trace_get_mode() & 0x1000000) != 0) {
    [v4 appendFormat:@"Path: %@ ", v5];
  }
  if (_thePlatform && [(id)_thePlatform shouldLogAtLevel:7])
  {
    if ([(NSDictionary *)self->_metadata count]) {
      [v4 appendFormat:@"\nmetadata: %@", self->_metadata];
    }
    if (self->_type) {
      [v4 appendFormat:@"  type: %@\n", self->_type];
    }
    if (self->_masterAssetHash) {
      [v4 appendFormat:@"  master asset hash: %@\n", self->_masterAssetHash];
    }
    if (self->_fileHash) {
      [v4 appendFormat:@"  file hash: %@\n", self->_fileHash];
    }
    if (self->_MMCSAccessHeader) {
      [v4 appendFormat:@"  MMCS header:%@\n", self->_MMCSAccessHeader];
    }
    if (self->_MMCSAccessHeaderTimeStamp) {
      [v4 appendFormat:@"  MMCS Header set on: %@", self->_MMCSAccessHeaderTimeStamp];
    }
    if (self->_MMCSURL) {
      [v4 appendFormat:@"  MMCS URL: %@\n", self->_MMCSURL];
    }
    if (self->_MMCSReceipt) {
      [v4 appendFormat:@"  MMCS Receipt: %@\n", self->_MMCSReceipt];
    }
    if (self->_fileData) {
      [v4 appendFormat:@"  File data present.\n"];
    }
    if (self->_batchCreationDate) {
      [v4 appendFormat:@"  Batch creation date: %@\n", self->_batchCreationDate];
    }
    if (self->_photoCreationDate) {
      [v4 appendFormat:@"  Asset creation date: %@\n", self->_photoCreationDate];
    }
    if ([(MSAsset *)self isPhoto])
    {
      [v4 appendFormat:@"  Asset is photo\n"];
      objc_msgSend(v4, "appendFormat:", @"  Media Asset Type %ld\n", -[MSAsset mediaAssetType](self, "mediaAssetType"));
    }
    if ([(MSAsset *)self isVideo])
    {
      [v4 appendFormat:@"  Asset is video\n"];
      objc_msgSend(v4, "appendFormat:", @"  Media Asset Type %ld\n", -[MSAsset mediaAssetType](self, "mediaAssetType"));
    }
    if (self->_assetDataAvailableOnServer) {
      int v6 = &stru_1F366BFB8;
    }
    else {
      int v6 = @"not";
    }
    [v4 appendFormat:@"  Asset data is %@ available on server\n", v6];
    objc_msgSend(v4, "appendFormat:", @"  protocol file size:%lld\n", self->_protocolFileSize);
  }

  return (NSString *)v4;
}

- (MSAsset)init
{
  unint64_t v3 = [NSString MSMakeUUID];
  id v4 = [(MSAsset *)self initWithGUID:v3];

  return v4;
}

- (MSAsset)initWithGUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSAsset;
  int v6 = [(MSAsset *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_GUID, a3);
    v7->_mediaAssetType = 0;
    v7->_assetDataAvailableOnServer = 1;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)assetWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  int v6 = [v4 GUID];
  unint64_t v7 = (void *)[v5 initWithGUID:v6];

  objc_super v8 = [v4 masterAssetHash];
  [v7 setMasterAssetHash:v8];

  objc_super v9 = [v4 metadata];
  [v7 setMetadata:v9];

  uint64_t v10 = [v4 path];
  [v7 setPath:v10];

  uint64_t v11 = [v4 MMCSURL];
  [v7 setMMCSURL:v11];

  uint64_t v12 = [v4 fileData];
  [v7 setFileData:v12];

  id v13 = [v4 error];
  [v7 setError:v13];

  uint64_t v14 = [v4 MMCSUTI];
  [v7 setMMCSUTI:v14];

  v15 = [v4 MMCSHash];
  [v7 setMMCSHash:v15];

  __int16 v16 = [v4 MMCSURL];
  [v7 setMMCSURL:v16];

  objc_msgSend(v7, "setMMCSItemSize:", objc_msgSend(v4, "MMCSItemSize"));
  id v17 = [v4 MMCSAccessHeader];
  uint64_t v18 = [v4 MMCSAccessHeaderTimeStamp];
  [v7 setMMCSAccessHeader:v17 andTimeStamp:v18];

  v19 = [v4 MMCSReceipt];
  [v7 setMMCSReceipt:v19];

  uint64_t v20 = [v4 assetCollectionGUID];
  [v7 setAssetCollectionGUID:v20];

  v21 = [v4 batchCreationDate];
  [v7 setBatchCreationDate:v21];

  uint64_t v22 = [v4 photoCreationDate];
  [v7 setPhotoCreationDate:v22];

  v23 = [v4 userInfo];
  id v24 = (void *)[v23 copy];
  [v7 setUserInfo:v24];

  objc_msgSend(v7, "setMediaAssetType:", objc_msgSend(v4, "mediaAssetType"));
  uint64_t v25 = [v4 assetDataAvailableOnServer];

  [v7 setAssetDataAvailableOnServer:v25];
  return v7;
}

+ (id)asset
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)MSASPProtocolDictionary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(MSAsset *)self metadata];
  id v5 = (void *)[v4 mutableCopy];

  int v6 = [(MSAsset *)self type];

  if (v6)
  {
    unint64_t v7 = [(MSAsset *)self type];
    [v3 setObject:v7 forKey:@"type"];
  }
  if ([(MSAsset *)self isVideo])
  {
    unint64_t v8 = [(MSAsset *)self mediaAssetType] - 4;
    if (v8 >= 4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v23 = self;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found an unknown video asset type", buf, 0xCu);
      }
    }
    else
    {
      [v3 setObject:off_1E6C3D890[v8] forKey:@"videoType"];
    }
  }
  objc_super v9 = [(MSAsset *)self MMCSHash];

  if (v9)
  {
    uint64_t v10 = [(MSAsset *)self MMCSHash];
    uint64_t v11 = [v10 MSHexString];
    [v3 setObject:v11 forKey:@"checksum"];
  }
  uint64_t v12 = [v5 objectForKey:@"MSAssetMetadataFileSize"];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v12, "unsignedLongLongValue"));
    [v3 setObject:v14 forKey:@"size"];

    [v5 removeObjectForKey:@"MSAssetMetadataFileSize"];
  }
  v15 = [v5 objectForKey:@"MSAssetMetadataPixelWidth"];
  __int16 v16 = v15;
  if (v15)
  {
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v15, "unsignedLongValue"));
    [v3 setObject:v17 forKey:@"width"];

    [v5 removeObjectForKey:@"MSAssetMetadataPixelWidth"];
  }
  uint64_t v18 = [v5 objectForKey:@"MSAssetMetadataPixelHeight"];
  v19 = v18;
  if (v18)
  {
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v18, "unsignedLongValue"));
    [v3 setObject:v20 forKey:@"height"];

    [v5 removeObjectForKey:@"MSAssetMetadataPixelHeight"];
  }
  [v5 removeObjectForKey:@"MSAssetMetadataItemID"];
  if ([v5 count]) {
    [v3 setObject:v5 forKey:@"metadata"];
  }

  return v3;
}

+ (id)MSASPAssetFromProtocolDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[MSAsset asset];
  id v5 = (void *)[v3 mutableCopy];

  int v6 = [v5 objectForKey:@"metadata"];
  unint64_t v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    [v5 removeObjectForKey:@"metadata"];
  }
  else
  {
    unint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  unint64_t v8 = [v5 objectForKey:@"height"];
  if (v8)
  {
    [v5 removeObjectForKey:@"height"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", strtoul((const char *)objc_msgSend(v8, "UTF8String"), 0, 10));
      [v7 setObject:v9 forKey:@"MSAssetMetadataPixelHeight"];
    }
  }
  uint64_t v10 = [v5 objectForKey:@"width"];
  if (v10)
  {
    [v5 removeObjectForKey:@"width"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", strtoul((const char *)objc_msgSend(v10, "UTF8String"), 0, 10));
      [v7 setObject:v11 forKey:@"MSAssetMetadataPixelWidth"];
    }
  }
  uint64_t v12 = [v5 objectForKey:@"size"];
  if (v12)
  {
    [v5 removeObjectForKey:@"size"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v12, "UTF8String"), 0, 10));
      [v7 setObject:v13 forKey:@"MSAssetMetadataFileSize"];
    }
  }
  uint64_t v14 = [v5 objectForKey:@"checksum"];
  if (v14)
  {
    [v5 removeObjectForKey:@"checksum"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [v14 MSHexData];
      [v4 setMMCSHash:v15];
    }
  }
  __int16 v16 = [v5 objectForKey:@"type"];
  if (v16)
  {
    [v5 removeObjectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setType:v16];
    }
  }
  id v17 = [v5 objectForKey:@"videoType"];
  if (!v17)
  {
    uint64_t v20 = [v7 objectForKey:@"MSAssetMetadataAssetType"];
    v21 = v20;
    if (v20)
    {
      if ([v20 isEqualToString:@"thumbnail"])
      {
        uint64_t v22 = v4;
        uint64_t v23 = 2;
      }
      else
      {
        if (![v21 isEqualToString:@"derivative"])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v28 = a1;
            __int16 v29 = 2114;
            uint64_t v30 = v21;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found an unsupported photoType %{public}@", buf, 0x16u);
          }
          goto LABEL_36;
        }
        uint64_t v22 = v4;
        uint64_t v23 = 3;
      }
      [v22 setMediaAssetType:v23];
    }
LABEL_36:

    goto LABEL_37;
  }
  [v5 removeObjectForKey:@"videoType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  if ([v17 isEqualToString:@"PosterFrame"])
  {
    uint64_t v18 = v4;
    uint64_t v19 = 5;
LABEL_33:
    [v18 setMediaAssetType:v19];
    goto LABEL_37;
  }
  if ([v17 isEqualToString:@"360p"])
  {
    uint64_t v18 = v4;
    uint64_t v19 = 6;
    goto LABEL_33;
  }
  if ([v17 isEqualToString:@"720p"])
  {
    uint64_t v18 = v4;
    uint64_t v19 = 7;
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = a1;
    __int16 v29 = 2114;
    uint64_t v30 = v17;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found an unsupported videoType %{public}@", buf, 0x16u);
  }
LABEL_37:
  uint64_t v24 = [v5 objectForKey:@"uploadpending"];
  if (v24)
  {
    [v5 removeObjectForKey:@"uploadpending"];
    if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = a1;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found uploadpending flag for non-video asset", buf, 0xCu);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v24 isEqualToString:@"1"]) {
      [v4 setAssetDataAvailableOnServer:0];
    }
  }
  [v4 setMetadata:v7];

  return v4;
}

@end