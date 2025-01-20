@interface MSAssetCollection
+ (BOOL)supportsSecureCoding;
+ (id)collectionWithMasterAsset:(id)a3 fileName:(id)a4;
+ (id)collectionWithMasterAsset:(id)a3 fileName:(id)a4 derivedAssets:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeleted;
- (MSAsset)masterAsset;
- (MSAssetCollection)initWithCoder:(id)a3;
- (MSAssetCollection)initWithMasterAsset:(id)a3 fileName:(id)a4 derivedAssets:(id)a5;
- (NSArray)derivedAssets;
- (NSData)masterAssetHash;
- (NSDate)serverUploadedDate;
- (NSString)assetCollectionID;
- (NSString)ctag;
- (NSString)fileName;
- (id)description;
- (int64_t)initialFailureDate;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetCollectionID:(id)a3;
- (void)setCtag:(id)a3;
- (void)setDerivedAssets:(id)a3;
- (void)setFileName:(id)a3;
- (void)setInitialFailureDate:(int64_t)a3;
- (void)setMasterAsset:(id)a3;
- (void)setServerUploadedDate:(id)a3;
- (void)setWasDeleted:(BOOL)a3;
@end

@implementation MSAssetCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverUploadedDate, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_derivedAssets, 0);
  objc_storeStrong((id *)&self->_masterAsset, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_assetCollectionID, 0);
}

- (void)setInitialFailureDate:(int64_t)a3
{
  self->_initialFailureDate = a3;
}

- (int64_t)initialFailureDate
{
  return self->_initialFailureDate;
}

- (void)setServerUploadedDate:(id)a3
{
}

- (NSDate)serverUploadedDate
{
  return self->_serverUploadedDate;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setMasterAsset:(id)a3
{
}

- (MSAsset)masterAsset
{
  return self->_masterAsset;
}

- (void)setCtag:(id)a3
{
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setAssetCollectionID:(id)a3
{
}

- (NSString)assetCollectionID
{
  return self->_assetCollectionID;
}

- (MSAssetCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MSAssetCollection;
  v5 = [(MSAssetCollection *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetCollectionID"];
    assetCollectionID = v5->_assetCollectionID;
    v5->_assetCollectionID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctag"];
    ctag = v5->_ctag;
    v5->_ctag = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"masterAsset"];
    masterAsset = v5->_masterAsset;
    v5->_masterAsset = (MSAsset *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"derivedAssets"];
    derivedAssets = v5->_derivedAssets;
    v5->_derivedAssets = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v17;

    v5->_wasDeleted = [v4 decodeBoolForKey:@"wasDeleted"];
    v5->_initialFailureDate = [v4 decodeInt64ForKey:@"initialFailureDate"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverUploadedDate"];
    serverUploadedDate = v5->_serverUploadedDate;
    v5->_serverUploadedDate = (NSDate *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  assetCollectionID = self->_assetCollectionID;
  id v11 = v4;
  if (assetCollectionID)
  {
    [v4 encodeObject:assetCollectionID forKey:@"assetCollectionID"];
    id v4 = v11;
  }
  ctag = self->_ctag;
  if (ctag)
  {
    [v11 encodeObject:ctag forKey:@"ctag"];
    id v4 = v11;
  }
  masterAsset = self->_masterAsset;
  if (masterAsset)
  {
    [v11 encodeObject:masterAsset forKey:@"masterAsset"];
    id v4 = v11;
  }
  derivedAssets = self->_derivedAssets;
  if (derivedAssets)
  {
    [v11 encodeObject:derivedAssets forKey:@"derivedAssets"];
    id v4 = v11;
  }
  fileName = self->_fileName;
  if (fileName)
  {
    [v11 encodeObject:fileName forKey:@"fileName"];
    id v4 = v11;
  }
  if (self->_wasDeleted)
  {
    [v11 encodeBool:1 forKey:@"wasDeleted"];
    id v4 = v11;
  }
  if (self->_initialFailureDate >= 1)
  {
    objc_msgSend(v11, "encodeInt64:forKey:");
    id v4 = v11;
  }
  serverUploadedDate = self->_serverUploadedDate;
  if (serverUploadedDate)
  {
    [v11 encodeObject:serverUploadedDate forKey:@"serverUploadedDate"];
    id v4 = v11;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    masterAsset = self->_masterAsset;
    uint64_t v6 = [v4 masterAsset];
    unsigned __int8 v7 = [(MSAsset *)masterAsset isEqual:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MSAssetCollection;
    unsigned __int8 v7 = [(MSAssetCollection *)&v9 isEqual:v4];
  }

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)MSAssetCollection;
  id v4 = [(MSAssetCollection *)&v7 description];
  v5 = [v3 stringWithString:v4];

  if (self->_assetCollectionID) {
    [v5 appendFormat:@"  Asset collection ID: %@\n", self->_assetCollectionID];
  }
  if (self->_ctag) {
    [v5 appendFormat:@" ctag: %@\n", self->_ctag];
  }
  if (self->_fileName && (os_trace_get_mode() & 0x1000000) != 0) {
    [v5 appendFormat:@" File name: %@\n", self->_fileName];
  }
  if (self->_serverUploadedDate) {
    [v5 appendFormat:@" Server uploaded date: %@\n", self->_serverUploadedDate];
  }
  if (self->_masterAsset) {
    [v5 appendFormat:@"  Master asset: %@\n", self->_masterAsset];
  }
  if (self->_derivedAssets) {
    [v5 appendFormat:@"  Derived assets: %@\n", self->_derivedAssets];
  }
  return v5;
}

- (void)setDerivedAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_derivedAssets, a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_derivedAssets;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        v12 = [(MSAsset *)self->_masterAsset fileHash];
        [v11 setMasterAssetHash:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSArray)derivedAssets
{
  return self->_derivedAssets;
}

- (NSData)masterAssetHash
{
  v2 = [(MSAssetCollection *)self masterAsset];
  v3 = [v2 fileHash];

  return (NSData *)v3;
}

- (MSAssetCollection)initWithMasterAsset:(id)a3 fileName:(id)a4 derivedAssets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MSAssetCollection;
  v12 = [(MSAssetCollection *)&v15 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_masterAsset, a3);
    objc_storeStrong((id *)&v13->_fileName, a4);
    objc_storeStrong((id *)&v13->_derivedAssets, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)collectionWithMasterAsset:(id)a3 fileName:(id)a4 derivedAssets:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithMasterAsset:v10 fileName:v9 derivedAssets:v8];

  return v11;
}

+ (id)collectionWithMasterAsset:(id)a3 fileName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithMasterAsset:v7 fileName:v6 derivedAssets:0];

  return v8;
}

@end