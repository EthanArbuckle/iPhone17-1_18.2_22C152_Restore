@interface StoreAsset
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation StoreAsset

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[StoreAsset allocWithZone:](StoreAsset, "allocWithZone:") init];
  v5->_archiveType = self->_archiveType;
  v5->_assetType = self->_assetType;
  v6 = (NSDictionary *)[(NSDictionary *)self->_backgroundAssetMetadata copyWithZone:a3];
  backgroundAssetMetadata = v5->_backgroundAssetMetadata;
  v5->_backgroundAssetMetadata = v6;

  v8 = (NSNumber *)[(NSNumber *)self->_bytesTotal copyWithZone:a3];
  bytesTotal = v5->_bytesTotal;
  v5->_bytesTotal = v8;

  v10 = (NSArray *)[(NSArray *)self->_clearHashes copyWithZone:a3];
  clearHashes = v5->_clearHashes;
  v5->_clearHashes = v10;

  v12 = (NSData *)[(NSData *)self->_dpInfo copyWithZone:a3];
  dpInfo = v5->_dpInfo;
  v5->_dpInfo = v12;

  v14 = (NSNumber *)[(NSNumber *)self->_expectedDiskspace copyWithZone:a3];
  expectedDiskspace = v5->_expectedDiskspace;
  v5->_expectedDiskspace = v14;

  v16 = (NSArray *)[(NSArray *)self->_hashes copyWithZone:a3];
  hashes = v5->_hashes;
  v5->_hashes = v16;

  v18 = (NSNumber *)[(NSNumber *)self->_hashType copyWithZone:a3];
  hashType = v5->_hashType;
  v5->_hashType = v18;

  v20 = (NSNumber *)[(NSNumber *)self->_initialODRSize copyWithZone:a3];
  initialODRSize = v5->_initialODRSize;
  v5->_initialODRSize = v20;

  v5->_locallyCacheable = self->_locallyCacheable;
  v22 = (NSString *)[(NSString *)self->_md5 copyWithZone:a3];
  md5 = v5->_md5;
  v5->_md5 = v22;

  v24 = (NSNumber *)[(NSNumber *)self->_numberOfBytesToHash copyWithZone:a3];
  numberOfBytesToHash = v5->_numberOfBytesToHash;
  v5->_numberOfBytesToHash = v24;

  v26 = (NSArray *)[(NSArray *)self->_priorVariantIdentifiers copyWithZone:a3];
  priorVariantIdentifiers = v5->_priorVariantIdentifiers;
  v5->_priorVariantIdentifiers = v26;

  v28 = (NSNumber *)[(NSNumber *)self->_priorVersionEvid copyWithZone:a3];
  priorVersionEvid = v5->_priorVersionEvid;
  v5->_priorVersionEvid = v28;

  v30 = (NSData *)[(NSData *)self->_sinf copyWithZone:a3];
  sinf = v5->_sinf;
  v5->_sinf = v30;

  v32 = (NSString *)[(NSString *)self->_variantID copyWithZone:a3];
  variantID = v5->_variantID;
  v5->_variantID = v32;

  v5->_zipStreamable = self->_zipStreamable;
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)StoreAsset;
  v3 = [(StoreAsset *)&v6 description];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: {URL = %@; variant = %@; delta = %d}",
    v3,
    self->_assetURL,
    self->_variantDescriptor,
  v4 = self->_assetType == 3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantDescriptor, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_sinf, 0);
  objc_storeStrong((id *)&self->_priorVersionEvid, 0);
  objc_storeStrong((id *)&self->_priorVariantIdentifiers, 0);
  objc_storeStrong((id *)&self->_numberOfBytesToHash, 0);
  objc_storeStrong((id *)&self->_md5, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_hashType, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_expectedDiskspace, 0);
  objc_storeStrong((id *)&self->_dpInfo, 0);
  objc_storeStrong((id *)&self->_deltaAlgorithm, 0);
  objc_storeStrong((id *)&self->_clearHashes, 0);
  objc_storeStrong((id *)&self->_bytesTotal, 0);
  objc_storeStrong((id *)&self->_backgroundAssetMetadata, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end