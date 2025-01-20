@interface ASDJobAsset
+ (BOOL)supportsSecureCoding;
- (ASDJobAsset)initWithCoder:(id)a3;
- (BOOL)isExternal;
- (BOOL)isLocallyCacheable;
- (BOOL)isZipStreamable;
- (NSData)dPInfo;
- (NSData)hashArrayData;
- (NSData)sinfs;
- (NSNumber)bytesTotal;
- (NSNumber)expectedDiskspace;
- (NSNumber)hashType;
- (NSNumber)initialODRSize;
- (NSNumber)numberOfBytesToHash;
- (NSString)assetType;
- (NSString)assetURL;
- (NSString)storeDownloadKey;
- (NSString)variantID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetType:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setBytesTotal:(id)a3;
- (void)setDPInfo:(id)a3;
- (void)setExpectedDiskspace:(id)a3;
- (void)setHashArrayData:(id)a3;
- (void)setHashType:(id)a3;
- (void)setInitialODRSize:(id)a3;
- (void)setIsExternal:(BOOL)a3;
- (void)setIsLocallyCacheable:(BOOL)a3;
- (void)setIsZipStreamable:(BOOL)a3;
- (void)setNumberOfBytesToHash:(id)a3;
- (void)setSinfs:(id)a3;
- (void)setStoreDownloadKey:(id)a3;
- (void)setVariantID:(id)a3;
@end

@implementation ASDJobAsset

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDJobAsset allocWithZone:](ASDJobAsset, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_assetType copyWithZone:a3];
  assetType = v5->_assetType;
  v5->_assetType = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_assetURL copyWithZone:a3];
  assetURL = v5->_assetURL;
  v5->_assetURL = (NSString *)v8;

  uint64_t v10 = [(NSNumber *)self->_bytesTotal copyWithZone:a3];
  bytesTotal = v5->_bytesTotal;
  v5->_bytesTotal = (NSNumber *)v10;

  uint64_t v12 = [(NSData *)self->_dPInfo copyWithZone:a3];
  dPInfo = v5->_dPInfo;
  v5->_dPInfo = (NSData *)v12;

  uint64_t v14 = [(NSNumber *)self->_expectedDiskspace copyWithZone:a3];
  expectedDiskspace = v5->_expectedDiskspace;
  v5->_expectedDiskspace = (NSNumber *)v14;

  uint64_t v16 = [(NSData *)self->_hashArrayData copyWithZone:a3];
  hashArrayData = v5->_hashArrayData;
  v5->_hashArrayData = (NSData *)v16;

  uint64_t v18 = [(NSNumber *)self->_hashType copyWithZone:a3];
  hashType = v5->_hashType;
  v5->_hashType = (NSNumber *)v18;

  uint64_t v20 = [(NSNumber *)self->_initialODRSize copyWithZone:a3];
  initialODRSize = v5->_initialODRSize;
  v5->_initialODRSize = (NSNumber *)v20;

  v5->_isExternal = self->_isExternal;
  v5->_isLocallyCacheable = self->_isLocallyCacheable;
  v5->_isZipStreamable = self->_isZipStreamable;
  uint64_t v22 = [(NSNumber *)self->_numberOfBytesToHash copyWithZone:a3];
  numberOfBytesToHash = v5->_numberOfBytesToHash;
  v5->_numberOfBytesToHash = (NSNumber *)v22;

  uint64_t v24 = [(NSData *)self->_sinfs copyWithZone:a3];
  sinfs = v5->_sinfs;
  v5->_sinfs = (NSData *)v24;

  uint64_t v26 = [(NSString *)self->_storeDownloadKey copyWithZone:a3];
  storeDownloadKey = v5->_storeDownloadKey;
  v5->_storeDownloadKey = (NSString *)v26;

  uint64_t v28 = [(NSString *)self->_variantID copyWithZone:a3];
  variantID = v5->_variantID;
  v5->_variantID = (NSString *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASDJobAsset;
  v5 = [(ASDJobAsset *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetURL"];
    assetURL = v5->_assetURL;
    v5->_assetURL = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bytesTotal"];
    bytesTotal = v5->_bytesTotal;
    v5->_bytesTotal = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetDPInfo"];
    dPInfo = v5->_dPInfo;
    v5->_dPInfo = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedDiskspace"];
    expectedDiskspace = v5->_expectedDiskspace;
    v5->_expectedDiskspace = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashArrayData"];
    hashArrayData = v5->_hashArrayData;
    v5->_hashArrayData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashType"];
    hashType = v5->_hashType;
    v5->_hashType = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialODRSize"];
    initialODRSize = v5->_initialODRSize;
    v5->_initialODRSize = (NSNumber *)v20;

    v5->_isExternal = [v4 decodeBoolForKey:@"isExternal"];
    v5->_isLocallyCacheable = [v4 decodeBoolForKey:@"isZipStreamable"];
    v5->_isZipStreamable = [v4 decodeBoolForKey:@"isZipStreamable"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfBytesToHash"];
    numberOfBytesToHash = v5->_numberOfBytesToHash;
    v5->_numberOfBytesToHash = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfs"];
    sinfs = v5->_sinfs;
    v5->_sinfs = (NSData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeDownloadKey"];
    storeDownloadKey = v5->_storeDownloadKey;
    v5->_storeDownloadKey = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"variantID"];
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDJobAsset *)self assetType];
  [v4 encodeObject:v5 forKey:@"assetType"];

  uint64_t v6 = [(ASDJobAsset *)self assetURL];
  [v4 encodeObject:v6 forKey:@"assetURL"];

  v7 = [(ASDJobAsset *)self bytesTotal];
  [v4 encodeObject:v7 forKey:@"bytesTotal"];

  uint64_t v8 = [(ASDJobAsset *)self dPInfo];
  [v4 encodeObject:v8 forKey:@"assetDPInfo"];

  v9 = [(ASDJobAsset *)self expectedDiskspace];
  [v4 encodeObject:v9 forKey:@"expectedDiskspace"];

  uint64_t v10 = [(ASDJobAsset *)self hashArrayData];
  [v4 encodeObject:v10 forKey:@"hashArrayData"];

  v11 = [(ASDJobAsset *)self hashType];
  [v4 encodeObject:v11 forKey:@"hashType"];

  uint64_t v12 = [(ASDJobAsset *)self initialODRSize];
  [v4 encodeObject:v12 forKey:@"initialODRSize"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDJobAsset isExternal](self, "isExternal"), @"isExternal");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDJobAsset isLocallyCacheable](self, "isLocallyCacheable"), @"isLocallyCacheable");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDJobAsset isZipStreamable](self, "isZipStreamable"), @"isZipStreamable");
  v13 = [(ASDJobAsset *)self numberOfBytesToHash];
  [v4 encodeObject:v13 forKey:@"numberOfBytesToHash"];

  uint64_t v14 = [(ASDJobAsset *)self sinfs];
  [v4 encodeObject:v14 forKey:@"sinfs"];

  v15 = [(ASDJobAsset *)self storeDownloadKey];
  [v4 encodeObject:v15 forKey:@"storeDownloadKey"];

  id v16 = [(ASDJobAsset *)self variantID];
  [v4 encodeObject:v16 forKey:@"variantID"];
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSString)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (NSNumber)bytesTotal
{
  return self->_bytesTotal;
}

- (void)setBytesTotal:(id)a3
{
}

- (NSData)dPInfo
{
  return self->_dPInfo;
}

- (void)setDPInfo:(id)a3
{
}

- (NSNumber)expectedDiskspace
{
  return self->_expectedDiskspace;
}

- (void)setExpectedDiskspace:(id)a3
{
}

- (NSData)hashArrayData
{
  return self->_hashArrayData;
}

- (void)setHashArrayData:(id)a3
{
}

- (NSNumber)hashType
{
  return self->_hashType;
}

- (void)setHashType:(id)a3
{
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
{
}

- (BOOL)isExternal
{
  return self->_isExternal;
}

- (void)setIsExternal:(BOOL)a3
{
  self->_isExternal = a3;
}

- (BOOL)isLocallyCacheable
{
  return self->_isLocallyCacheable;
}

- (void)setIsLocallyCacheable:(BOOL)a3
{
  self->_isLocallyCacheable = a3;
}

- (BOOL)isZipStreamable
{
  return self->_isZipStreamable;
}

- (void)setIsZipStreamable:(BOOL)a3
{
  self->_isZipStreamable = a3;
}

- (NSNumber)numberOfBytesToHash
{
  return self->_numberOfBytesToHash;
}

- (void)setNumberOfBytesToHash:(id)a3
{
}

- (NSData)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
}

- (NSString)storeDownloadKey
{
  return self->_storeDownloadKey;
}

- (void)setStoreDownloadKey:(id)a3
{
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_storeDownloadKey, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_numberOfBytesToHash, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_hashType, 0);
  objc_storeStrong((id *)&self->_hashArrayData, 0);
  objc_storeStrong((id *)&self->_expectedDiskspace, 0);
  objc_storeStrong((id *)&self->_dPInfo, 0);
  objc_storeStrong((id *)&self->_bytesTotal, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end