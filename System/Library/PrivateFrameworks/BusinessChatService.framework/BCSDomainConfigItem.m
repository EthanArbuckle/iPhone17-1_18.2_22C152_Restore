@interface BCSDomainConfigItem
+ (BOOL)supportsSecureCoding;
+ (id)keysRequestedForCloudKitFetch;
- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 domainShards:(int64_t)a4 filterShards:(int64_t)a5 expirationDate:(id)a6;
- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 domainShards:(int64_t)a4 filterShards:(int64_t)a5 expirationDate:(id)a6 filterMegaShardURL:(id)a7 domainMegaShardURL:(id)a8 itemTTL:(id)a9;
- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5 filterMegaShardURL:(id)a6 itemTTL:(id)a7;
- (BCSDomainConfigItem)initWithCoder:(id)a3;
- (BCSDomainConfigItem)initWithJSONObj:(id)a3;
- (BCSDomainConfigItem)initWithRecord:(id)a3;
- (NSURL)domainMegaShardURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)domainShardCount;
- (int64_t)filterShardCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSDomainConfigItem

- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 domainShards:(int64_t)a4 filterShards:(int64_t)a5 expirationDate:(id)a6
{
  return [(BCSDomainConfigItem *)self initWithBuckets:a3 domainShards:a4 filterShards:a5 expirationDate:a6 filterMegaShardURL:0 domainMegaShardURL:0 itemTTL:0];
}

- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 domainShards:(int64_t)a4 filterShards:(int64_t)a5 expirationDate:(id)a6 filterMegaShardURL:(id)a7 domainMegaShardURL:(id)a8 itemTTL:(id)a9
{
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BCSDomainConfigItem;
  v17 = [(BCSConfigItem *)&v20 initWithBuckets:a3 shards:0 expirationDate:a6 filterMegaShardURL:a7 itemTTL:a9];
  v18 = v17;
  if (v17)
  {
    v17->_domainShardCount = a4;
    v17->_filterShardCount = a5;
    objc_storeStrong((id *)&v17->_domainMegaShardURL, a8);
  }

  return v18;
}

- (int64_t)domainShardCount
{
  return self->_domainShardCount;
}

- (int64_t)filterShardCount
{
  return self->_filterShardCount;
}

- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5 filterMegaShardURL:(id)a6 itemTTL:(id)a7
{
  return [(BCSDomainConfigItem *)self initWithBuckets:a3 domainShards:0 filterShards:a4 expirationDate:a5 filterMegaShardURL:a6 domainMegaShardURL:0 itemTTL:a7];
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)BCSDomainConfigItem;
  v4 = [(BCSConfigItem *)&v12 description];
  int64_t v5 = [(BCSConfigItem *)self buckets];
  int64_t v6 = [(BCSDomainConfigItem *)self domainShardCount];
  int64_t v7 = [(BCSDomainConfigItem *)self filterShardCount];
  v8 = [(BCSConfigItem *)self expirationDate];
  v9 = [(BCSConfigItem *)self itemTTL];
  v10 = [v3 stringWithFormat:@"%@ - buckets:%lu - domainShards:%lu - filterShards:%lu - expirationDate:%@ - itemTTL:%@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BCSDomainConfigItem;
  id v4 = [(BCSConfigItem *)&v14 copyWithZone:a3];
  int64_t v5 = [(BCSConfigItem *)self buckets];
  int64_t v6 = [(BCSDomainConfigItem *)self domainShardCount];
  int64_t v7 = [(BCSDomainConfigItem *)self filterShardCount];
  v8 = [(BCSConfigItem *)self expirationDate];
  v9 = [(BCSConfigItem *)self filterMegaShardURL];
  v10 = [(BCSDomainConfigItem *)self domainMegaShardURL];
  v11 = [(BCSConfigItem *)self itemTTL];
  objc_super v12 = (void *)[v4 initWithBuckets:v5 domainShards:v6 filterShards:v7 expirationDate:v8 filterMegaShardURL:v9 domainMegaShardURL:v10 itemTTL:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BCSDomainConfigItem;
  id v4 = a3;
  [(BCSConfigItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_domainShardCount, @"BCSDomainConfigItemDomainShardsCodingKey", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_filterShardCount forKey:@"BCSDomainConfigItemFilterShardsCodingKey"];
  [v4 encodeObject:self->_domainMegaShardURL forKey:@"BCSDomainConfigItemDomainMegaShardCodingKey"];
}

- (BCSDomainConfigItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSDomainConfigItem;
  objc_super v5 = [(BCSConfigItem *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_domainShardCount = [v4 decodeIntegerForKey:@"BCSDomainConfigItemDomainShardsCodingKey"];
    v5->_filterShardCount = [v4 decodeIntegerForKey:@"BCSDomainConfigItemFilterShardsCodingKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSDomainConfigItemDomainMegaShardCodingKey"];
    domainMegaShardURL = v5->_domainMegaShardURL;
    v5->_domainMegaShardURL = (NSURL *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)domainMegaShardURL
{
  return self->_domainMegaShardURL;
}

- (void).cxx_destruct
{
}

+ (id)keysRequestedForCloudKitFetch
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"buckets";
  v4[1] = @"domainShards";
  v4[2] = @"filterShards";
  v4[3] = @"ttl";
  v4[4] = @"itemTtl";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];

  return v2;
}

- (BCSDomainConfigItem)initWithJSONObj:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"records"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [v4 firstObject];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"fields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [v6 objectForKeyedSubscript:@"buckets"];
      v8 = [v7 objectForKeyedSubscript:@"value"];

      objc_super v9 = [v6 objectForKeyedSubscript:@"domainShards"];
      v10 = [v9 objectForKeyedSubscript:@"value"];

      v11 = [v6 objectForKeyedSubscript:@"filterShards"];
      objc_super v12 = [v11 objectForKeyedSubscript:@"value"];

      v13 = [v6 objectForKeyedSubscript:@"ttl"];
      objc_super v14 = [v13 objectForKeyedSubscript:@"value"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v15 = [MEMORY[0x263EFF910] date];
        [v14 doubleValue];
        v23 = objc_msgSend(v15, "dateByAddingTimeInterval:");

        self = -[BCSDomainConfigItem initWithBuckets:domainShards:filterShards:expirationDate:](self, "initWithBuckets:domainShards:filterShards:expirationDate:", -[NSObject longLongValue](v8, "longLongValue"), [v10 longValue], objc_msgSend(v12, "longLongValue"), v23);
        id v16 = self;
      }
      else
      {
        v17 = ABSLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_2154F4000, v17, OS_LOG_TYPE_ERROR, "BCSDomainConfigItem buckets, domainShards, filterShards, or ttl is not an NSNumber", buf, 2u);
        }

        id v16 = 0;
      }
    }
    else
    {
      v8 = ABSLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 136315394;
        v25 = "-[BCSDomainConfigItem(Conversion) initWithJSONObj:]";
        __int16 v26 = 2112;
        v27 = v22;
        _os_log_error_impl(&dword_2154F4000, v8, OS_LOG_TYPE_ERROR, "%s - Expected NSDictionary fields parameter. Got %@", buf, 0x16u);
      }
      id v16 = 0;
    }
  }
  else
  {
    objc_super v5 = ABSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      objc_super v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 136315394;
      v25 = "-[BCSDomainConfigItem(Conversion) initWithJSONObj:]";
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_error_impl(&dword_2154F4000, v5, OS_LOG_TYPE_ERROR, "%s - Expected NSArray for records parameter. Got %@", buf, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

- (BCSDomainConfigItem)initWithRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"buckets"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"domainShards"];
  int64_t v7 = [v4 objectForKeyedSubscript:@"filterShards"];
  v8 = [v4 objectForKeyedSubscript:@"ttl"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v9 = [v4 objectForKeyedSubscript:@"filterArchive"];
    v10 = [v4 objectForKeyedSubscript:@"domainArchive"];
    if (!v9)
    {
      v11 = ABSLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[BCSDomainConfigItem(Conversion) initWithRecord:]";
        _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s - No Filter Megashard to download", buf, 0xCu);
      }
    }
    if (!v10)
    {
      objc_super v12 = ABSLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[BCSDomainConfigItem(Conversion) initWithRecord:]";
        _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "%s - No Domain Megashard to download", buf, 0xCu);
      }
    }
    v13 = [MEMORY[0x263EFF910] date];
    [v8 doubleValue];
    v23 = objc_msgSend(v13, "dateByAddingTimeInterval:");

    uint64_t v21 = [v5 longLongValue];
    uint64_t v20 = [v6 longLongValue];
    uint64_t v19 = [v7 longLongValue];
    objc_super v14 = [v9 fileURL];
    [v10 fileURL];
    v15 = v22 = v10;
    id v16 = [(BCSConfigItem *)self _extractItemTTLFromConfigRecord:v4];
    self = [(BCSDomainConfigItem *)self initWithBuckets:v21 domainShards:v20 filterShards:v19 expirationDate:v23 filterMegaShardURL:v14 domainMegaShardURL:v15 itemTTL:v16];

    v17 = self;
  }
  else
  {
    objc_super v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "BCSDomainConfigItem buckets, domainShards, filterShards, or ttl is not an NSNumber", buf, 2u);
    }
    v17 = 0;
  }

  return v17;
}

@end