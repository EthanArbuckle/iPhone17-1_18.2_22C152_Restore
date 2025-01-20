@interface MADEmbeddingSearchResult
+ (BOOL)supportsSecureCoding;
- (MADEmbeddingSearchResult)initWithAssetUUID:(id)a3 distance:(id)a4 metric:(int64_t)a5;
- (MADEmbeddingSearchResult)initWithCoder:(id)a3;
- (NSNumber)distance;
- (NSString)assetUUID;
- (id)description;
- (int64_t)metric;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADEmbeddingSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingSearchResult)initWithAssetUUID:(id)a3 distance:(id)a4 metric:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADEmbeddingSearchResult;
  v11 = [(MADEmbeddingSearchResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetUUID, a3);
    objc_storeStrong((id *)&v12->_distance, a4);
    v12->_metric = a5;
  }

  return v12;
}

- (MADEmbeddingSearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADEmbeddingSearchResult;
  v5 = [(MADEmbeddingSearchResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetUUID"];
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Distance"];
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v8;

    v5->_metric = [v4 decodeIntegerForKey:@"Metric"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  assetUUID = self->_assetUUID;
  id v5 = a3;
  [v5 encodeObject:assetUUID forKey:@"AssetUUID"];
  [v5 encodeObject:self->_distance forKey:@"Distance"];
  [v5 encodeInteger:self->_metric forKey:@"Metric"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"assetUUID: %@, ", self->_assetUUID];
  [v3 appendFormat:@"distance: %@, ", self->_distance];
  objc_msgSend(v3, "appendFormat:", @"metric: %d>", self->_metric);
  return v3;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (int64_t)metric
{
  return self->_metric;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end