@interface ATStoreInfo
+ (BOOL)supportsSecureCoding;
- (ATStoreInfo)init;
- (ATStoreInfo)initWithCoder:(id)a3;
- (ICStoreMediaResponseItem)storeMediaResponseItem;
- (NSDictionary)assetDictionary;
- (NSDictionary)downloadDictionary;
- (NSNumber)DSID;
- (NSNumber)adamID;
- (NSNumber)cloudDSID;
- (NSNumber)collectionID;
- (NSNumber)drmFree;
- (NSNumber)endpointType;
- (NSNumber)matchStatus;
- (NSNumber)redownloadStatus;
- (NSNumber)sagaID;
- (NSNumber)subscriptionID;
- (NSNumber)versionID;
- (NSString)XID;
- (NSString)appleID;
- (NSString)dimensions;
- (NSString)flavor;
- (NSString)podcastEpisodeGUID;
- (NSString)redownloadParams;
- (NSString)storefrontID;
- (NSString)syncID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setCloudDSID:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDimensions:(id)a3;
- (void)setDrmFree:(id)a3;
- (void)setEndpointType:(id)a3;
- (void)setFlavor:(id)a3;
- (void)setMatchStatus:(id)a3;
- (void)setPodcastEpisodeGUID:(id)a3;
- (void)setRedownloadParams:(id)a3;
- (void)setRedownloadStatus:(id)a3;
- (void)setSagaID:(id)a3;
- (void)setStoreMediaResponseItem:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setSubscriptionID:(id)a3;
- (void)setSyncID:(id)a3;
- (void)setVersionID:(id)a3;
- (void)setXID:(id)a3;
@end

@implementation ATStoreInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMediaResponseItem, 0);
  objc_storeStrong((id *)&self->_assetDictionary, 0);
  objc_storeStrong((id *)&self->_downloadDictionary, 0);
}

- (void)setStoreMediaResponseItem:(id)a3
{
}

- (ICStoreMediaResponseItem)storeMediaResponseItem
{
  return self->_storeMediaResponseItem;
}

- (NSDictionary)assetDictionary
{
  return &self->_assetDictionary->super;
}

- (NSDictionary)downloadDictionary
{
  return &self->_downloadDictionary->super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ATStoreInfo *)self adamID];
  [v4 setAdamID:v5];

  v6 = [(ATStoreInfo *)self DSID];
  [v4 setDSID:v6];

  v7 = [(ATStoreInfo *)self cloudDSID];
  [v4 setCloudDSID:v7];

  v8 = [(ATStoreInfo *)self collectionID];
  [v4 setCollectionID:v8];

  v9 = [(ATStoreInfo *)self versionID];
  [v4 setVersionID:v9];

  v10 = [(ATStoreInfo *)self drmFree];
  [v4 setDrmFree:v10];

  v11 = [(ATStoreInfo *)self sagaID];
  [v4 setSagaID:v11];

  v12 = [(ATStoreInfo *)self subscriptionID];
  [v4 setSubscriptionID:v12];

  v13 = [(ATStoreInfo *)self matchStatus];
  [v4 setMatchStatus:v13];

  v14 = [(ATStoreInfo *)self redownloadStatus];
  [v4 setRedownloadStatus:v14];

  v15 = [(ATStoreInfo *)self endpointType];
  [v4 setEndpointType:v15];

  v16 = [(ATStoreInfo *)self appleID];
  [v4 setAppleID:v16];

  v17 = [(ATStoreInfo *)self syncID];
  [v4 setSyncID:v17];

  v18 = [(ATStoreInfo *)self storefrontID];
  [v4 setStorefrontID:v18];

  v19 = [(ATStoreInfo *)self XID];
  [v4 setXID:v19];

  v20 = [(ATStoreInfo *)self flavor];
  [v4 setFlavor:v20];

  v21 = [(ATStoreInfo *)self dimensions];
  [v4 setDimensions:v21];

  v22 = [(ATStoreInfo *)self podcastEpisodeGUID];
  [v4 setPodcastEpisodeGUID:v22];

  v23 = [(ATStoreInfo *)self redownloadParams];
  [v4 setRedownloadParams:v23];

  return v4;
}

- (ATStoreInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ATStoreInfo;
  v5 = [(ATStoreInfo *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"downloadDictionary"];
    downloadDictionary = v5->_downloadDictionary;
    v5->_downloadDictionary = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"assetDictionary"];
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = (NSMutableDictionary *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  id v5 = a3;
  [v5 encodeObject:downloadDictionary forKey:@"downloadDictionary"];
  [v5 encodeObject:self->_assetDictionary forKey:@"assetDictionary"];
}

- (ATStoreInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATStoreInfo;
  v2 = [(ATStoreInfo *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    downloadDictionary = v2->_downloadDictionary;
    v2->_downloadDictionary = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetDictionary = v2->_assetDictionary;
    v2->_assetDictionary = v5;

    storeMediaResponseItem = v2->_storeMediaResponseItem;
    v2->_storeMediaResponseItem = 0;
  }
  return v2;
}

- (NSNumber)drmFree
{
  return (NSNumber *)[(NSMutableDictionary *)self->_assetDictionary objectForKey:*MEMORY[0x263F7B510]];
}

- (void)setDrmFree:(id)a3
{
  assetDictionary = self->_assetDictionary;
  if (a3) {
    [(NSMutableDictionary *)assetDictionary setObject:a3 forKey:*MEMORY[0x263F7B510]];
  }
  else {
    [(NSMutableDictionary *)assetDictionary removeObjectForKey:*MEMORY[0x263F7B510]];
  }
}

- (NSString)dimensions
{
  return (NSString *)[(NSMutableDictionary *)self->_assetDictionary objectForKey:*MEMORY[0x263F7B520]];
}

- (void)setDimensions:(id)a3
{
  assetDictionary = self->_assetDictionary;
  if (a3) {
    [(NSMutableDictionary *)assetDictionary setObject:a3 forKey:*MEMORY[0x263F7B520]];
  }
  else {
    [(NSMutableDictionary *)assetDictionary removeObjectForKey:*MEMORY[0x263F7B520]];
  }
}

- (NSString)flavor
{
  return (NSString *)[(NSMutableDictionary *)self->_assetDictionary objectForKey:*MEMORY[0x263F7B518]];
}

- (void)setFlavor:(id)a3
{
  assetDictionary = self->_assetDictionary;
  if (a3) {
    [(NSMutableDictionary *)assetDictionary setObject:a3 forKey:*MEMORY[0x263F7B518]];
  }
  else {
    [(NSMutableDictionary *)assetDictionary removeObjectForKey:*MEMORY[0x263F7B518]];
  }
}

- (NSNumber)endpointType
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:@"ATAssetStoreInfoEndpointType"];
}

- (void)setEndpointType:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:@"ATAssetStoreInfoEndpointType"];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:@"ATAssetStoreInfoEndpointType"];
  }
}

- (NSString)redownloadParams
{
  return (NSString *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6F0]];
}

- (void)setRedownloadParams:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6F0]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6F0]];
  }
}

- (NSString)podcastEpisodeGUID
{
  return (NSString *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B678]];
}

- (void)setPodcastEpisodeGUID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B678]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B678]];
  }
}

- (NSNumber)redownloadStatus
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6F8]];
}

- (void)setRedownloadStatus:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6F8]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6F8]];
  }
}

- (NSNumber)matchStatus
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6E0]];
}

- (void)setMatchStatus:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6E0]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6E0]];
  }
}

- (NSNumber)sagaID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B700]];
}

- (void)setSagaID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B700]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B700]];
  }
}

- (NSString)appleID
{
  return (NSString *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6B0]];
}

- (void)setAppleID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6B0]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6B0]];
  }
}

- (NSString)XID
{
  return (NSString *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B718]];
}

- (void)setXID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B718]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B718]];
  }
}

- (NSString)storefrontID
{
  return (NSString *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6D0]];
}

- (void)setStorefrontID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6D0]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6D0]];
  }
}

- (NSNumber)versionID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B708]];
}

- (void)setVersionID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B708]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B708]];
  }
}

- (NSNumber)cloudDSID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:@"ATAssetStoreInfoCloudDSID"];
}

- (void)setCloudDSID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:@"ATAssetStoreInfoCloudDSID"];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:@"ATAssetStoreInfoCloudDSID"];
  }
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:@"ATAssetStoreInfoSubscriptionItemID"];
}

- (void)setSubscriptionID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:@"ATAssetStoreInfoSubscriptionItemID"];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:@"ATAssetStoreInfoSubscriptionItemID"];
  }
}

- (NSString)syncID
{
  return (NSString *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:@"ATLegacyAssetSyncID"];
}

- (void)setSyncID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:@"ATLegacyAssetSyncID"];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:@"ATLegacyAssetSyncID"];
  }
}

- (NSNumber)collectionID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6C8]];
}

- (void)setCollectionID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6C8]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6C8]];
  }
}

- (NSNumber)DSID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6B8]];
}

- (void)setDSID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6B8]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6B8]];
  }
}

- (NSNumber)adamID
{
  return (NSNumber *)[(NSMutableDictionary *)self->_downloadDictionary objectForKey:*MEMORY[0x263F7B6D8]];
}

- (void)setAdamID:(id)a3
{
  downloadDictionary = self->_downloadDictionary;
  if (a3) {
    [(NSMutableDictionary *)downloadDictionary setObject:a3 forKey:*MEMORY[0x263F7B6D8]];
  }
  else {
    [(NSMutableDictionary *)downloadDictionary removeObjectForKey:*MEMORY[0x263F7B6D8]];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end