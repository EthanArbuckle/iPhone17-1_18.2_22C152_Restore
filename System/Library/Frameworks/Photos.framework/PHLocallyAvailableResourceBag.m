@interface PHLocallyAvailableResourceBag
- (BOOL)isDegraded;
- (BOOL)isDerivedFromDeferredPreview;
- (BOOL)isPrimaryFormat;
- (BOOL)keyIsHintBased;
- (NSString)description;
- (PLAssetID)assetID;
- (PLResourceDataStore)dataStore;
- (PLResourceDataStoreKey)dataStoreKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resourceData;
- (id)resourceURL;
- (void)prepareForReuse;
- (void)setAssetID:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDataStoreKey:(id)a3;
- (void)setIsDegraded:(BOOL)a3;
- (void)setIsDerivedFromDeferredPreview:(BOOL)a3;
- (void)setIsPrimaryFormat:(BOOL)a3;
- (void)setKeyIsHintBased:(BOOL)a3;
@end

@implementation PHLocallyAvailableResourceBag

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)setKeyIsHintBased:(BOOL)a3
{
  self->_keyIsHintBased = a3;
}

- (void)setIsPrimaryFormat:(BOOL)a3
{
  self->_isPrimaryFormat = a3;
}

- (void)setIsDerivedFromDeferredPreview:(BOOL)a3
{
  self->_isDerivedFromDeferredPreview = a3;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (void)setDataStoreKey:(id)a3
{
}

- (void)setDataStore:(id)a3
{
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)keyIsHintBased
{
  return self->_keyIsHintBased;
}

- (BOOL)isPrimaryFormat
{
  return self->_isPrimaryFormat;
}

- (BOOL)isDerivedFromDeferredPreview
{
  return self->_isDerivedFromDeferredPreview;
}

- (PLResourceDataStore)dataStore
{
  return self->_dataStore;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  return self->_dataStoreKey;
}

- (void)prepareForReuse
{
  self->_isDegraded = 0;
  dataStore = self->_dataStore;
  self->_dataStore = 0;

  dataStoreKey = self->_dataStoreKey;
  self->_dataStoreKey = 0;

  *(_WORD *)&self->_isPrimaryFormat = 0;
  self->_keyIsHintBased = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStoreKey, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

- (PLAssetID)assetID
{
  return self->_assetID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PHLocallyAvailableResourceBag);
  v5 = [(PHLocallyAvailableResourceBag *)self assetID];
  [(PHLocallyAvailableResourceBag *)v4 setAssetID:v5];

  v6 = [(PHLocallyAvailableResourceBag *)self dataStore];
  [(PHLocallyAvailableResourceBag *)v4 setDataStore:v6];

  v7 = [(PHLocallyAvailableResourceBag *)self dataStoreKey];
  [(PHLocallyAvailableResourceBag *)v4 setDataStoreKey:v7];

  [(PHLocallyAvailableResourceBag *)v4 setKeyIsHintBased:[(PHLocallyAvailableResourceBag *)self keyIsHintBased]];
  [(PHLocallyAvailableResourceBag *)v4 setIsDegraded:[(PHLocallyAvailableResourceBag *)self isDegraded]];
  [(PHLocallyAvailableResourceBag *)v4 setIsPrimaryFormat:[(PHLocallyAvailableResourceBag *)self isPrimaryFormat]];
  [(PHLocallyAvailableResourceBag *)v4 setIsDerivedFromDeferredPreview:[(PHLocallyAvailableResourceBag *)self isDerivedFromDeferredPreview]];
  return v4;
}

- (id)resourceData
{
  return (id)[(PLResourceDataStore *)self->_dataStore resourceDataForKey:self->_dataStoreKey assetID:self->_assetID];
}

- (id)resourceURL
{
  return (id)[(PLResourceDataStore *)self->_dataStore resourceURLForKey:self->_dataStoreKey assetID:self->_assetID];
}

- (NSString)description
{
  if ([(id)objc_opt_class() storeClassID] == 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(PHLocallyAvailableResourceBag *)self resourceURL];
  }
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if ([(PHLocallyAvailableResourceBag *)self keyIsHintBased]) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  if ([(PHLocallyAvailableResourceBag *)self isDegraded]) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if ([(PHLocallyAvailableResourceBag *)self isPrimaryFormat]) {
    v9 = @"Y";
  }
  else {
    v9 = @"N";
  }
  v10 = [v4 stringWithFormat:@"<%@ %p> url: %@, hint-based: %@, degraded: %@, primary: %@", v6, self, v3, v7, v8, v9];

  if (self->_isDerivedFromDeferredPreview)
  {
    uint64_t v11 = [v10 stringByAppendingString:@", derived-from-deferred: Y"];

    v10 = (void *)v11;
  }

  return (NSString *)v10;
}

@end