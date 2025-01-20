@interface ATAssetLinkPowerLoggerAggregationKey
- (ATAssetLinkPowerLoggerAggregationKey)initWithLinkType:(int64_t)a3 dataclass:(id)a4 assetType:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)assetType;
- (NSString)dataclass;
- (int64_t)linkType;
- (unint64_t)hash;
@end

@implementation ATAssetLinkPowerLoggerAggregationKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);

  objc_storeStrong((id *)&self->_dataclass, 0);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATAssetLinkPowerLoggerAggregationKey *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(ATAssetLinkPowerLoggerAggregationKey *)v5 linkType];
      if (v6 == [(ATAssetLinkPowerLoggerAggregationKey *)self linkType])
      {
        v7 = [(ATAssetLinkPowerLoggerAggregationKey *)v5 dataclass];
        v8 = [(ATAssetLinkPowerLoggerAggregationKey *)self dataclass];
        if ([v7 isEqualToString:v8])
        {
          v9 = [(ATAssetLinkPowerLoggerAggregationKey *)v5 assetType];
          v10 = [(ATAssetLinkPowerLoggerAggregationKey *)self assetType];
          if (v9 == v10)
          {
            char v13 = 1;
          }
          else
          {
            v11 = [(ATAssetLinkPowerLoggerAggregationKey *)v5 assetType];
            v12 = [(ATAssetLinkPowerLoggerAggregationKey *)self assetType];
            char v13 = [v11 isEqualToString:v12];
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(ATAssetLinkPowerLoggerAggregationKey *)self linkType];
  v4 = [(ATAssetLinkPowerLoggerAggregationKey *)self dataclass];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(ATAssetLinkPowerLoggerAggregationKey *)self assetType];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (ATAssetLinkPowerLoggerAggregationKey)initWithLinkType:(int64_t)a3 dataclass:(id)a4 assetType:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATAssetLinkPowerLoggerAggregationKey;
  v11 = [(ATAssetLinkPowerLoggerAggregationKey *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_linkType = a3;
    objc_storeStrong((id *)&v11->_dataclass, a4);
    objc_storeStrong((id *)&v12->_assetType, a5);
  }

  return v12;
}

@end