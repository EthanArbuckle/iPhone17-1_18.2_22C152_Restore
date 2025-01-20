@interface BCSConfigItem
+ (BOOL)supportsSecureCoding;
+ (id)keysRequestedForCloudKitFetch;
- (BCSConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5;
- (BCSConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5 filterMegaShardURL:(id)a6 itemTTL:(id)a7;
- (BCSConfigItem)initWithCoder:(id)a3;
- (BCSConfigItem)initWithJSONObj:(id)a3;
- (BCSConfigItem)initWithRecord:(id)a3;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSNumber)itemTTL;
- (NSString)description;
- (NSURL)filterMegaShardURL;
- (id)_extractItemTTLFromConfigRecord:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)buckets;
- (int64_t)filterShardCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBuckets:(int64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFilterMegaShardURL:(id)a3;
- (void)setFilterShardCount:(int64_t)a3;
- (void)setItemTTL:(id)a3;
@end

@implementation BCSConfigItem

+ (id)keysRequestedForCloudKitFetch
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = @"buckets";
  v4[1] = @"shards";
  v4[2] = @"ttl";
  v4[3] = @"itemTtl";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];

  return v2;
}

- (BCSConfigItem)initWithJSONObj:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"records"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 firstObject];
    v6 = [v5 objectForKeyedSubscript:@"fields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 objectForKeyedSubscript:@"buckets"];
      v8 = [v7 objectForKeyedSubscript:@"value"];

      v9 = [v6 objectForKeyedSubscript:@"shards"];
      v10 = [v9 objectForKeyedSubscript:@"value"];

      v11 = [v6 objectForKeyedSubscript:@"ttl"];
      v12 = [v11 objectForKeyedSubscript:@"value"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = [MEMORY[0x263EFF910] date];
        [v12 doubleValue];
        v14 = objc_msgSend(v13, "dateByAddingTimeInterval:");

        self = -[BCSConfigItem initWithBuckets:shards:expirationDate:](self, "initWithBuckets:shards:expirationDate:", -[NSObject longLongValue](v8, "longLongValue"), [v10 longLongValue], v14);
        v15 = self;
      }
      else
      {
        v16 = ABSLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "BCSConfigItem buckets, shards, or ttl is not an NSNumber", v18, 2u);
        }

        v15 = 0;
      }
    }
    else
    {
      v8 = ABSLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_2154F4000, v8, OS_LOG_TYPE_ERROR, "BCSConfigItem fields parameter is not an NSDictionary", v19, 2u);
      }
      v15 = 0;
    }
  }
  else
  {
    v5 = ABSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v5, OS_LOG_TYPE_ERROR, "BCSConfigItem records parameter is not an NSArray", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BCSConfigItem)initWithRecord:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"buckets"];
  v6 = [v4 objectForKeyedSubscript:@"shards"];
  v7 = [v4 objectForKeyedSubscript:@"ttl"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v4 objectForKeyedSubscript:@"filterArchive"];
    if (!v8)
    {
      v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[BCSConfigItem(Conversion) initWithRecord:]";
        _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s - No Chat Suggest Filter Megashard to download", buf, 0xCu);
      }
    }
    v10 = [MEMORY[0x263EFF910] date];
    [v7 doubleValue];
    v17 = objc_msgSend(v10, "dateByAddingTimeInterval:");

    uint64_t v11 = [v5 longLongValue];
    uint64_t v12 = [v6 longLongValue];
    v13 = [v8 fileURL];
    v14 = [(BCSConfigItem *)self _extractItemTTLFromConfigRecord:v4];
    self = [(BCSConfigItem *)self initWithBuckets:v11 shards:v12 expirationDate:v17 filterMegaShardURL:v13 itemTTL:v14];

    v15 = self;
  }
  else
  {
    v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v8, OS_LOG_TYPE_ERROR, "BCSConfigItem buckets, shards, or ttl is not an NSNumber", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)_extractItemTTLFromConfigRecord:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"itemTtl"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = ABSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_2154F4000, v5, OS_LOG_TYPE_ERROR, "itemTTL exists but is not an NSNumber", v7, 2u);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (BCSConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5
{
  return [(BCSConfigItem *)self initWithBuckets:a3 shards:a4 expirationDate:a5 filterMegaShardURL:0 itemTTL:0];
}

- (BCSConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5 filterMegaShardURL:(id)a6 itemTTL:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BCSConfigItem;
  v16 = [(BCSConfigItem *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_buckets = a3;
    v16->_filterShardCount = a4;
    objc_storeStrong((id *)&v16->_expirationDate, a5);
    objc_storeStrong((id *)&v17->_filterMegaShardURL, a6);
    objc_storeStrong((id *)&v17->_itemTTL, a7);
  }

  return v17;
}

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)BCSConfigItem;
  id v4 = [(BCSConfigItem *)&v11 description];
  int64_t v5 = [(BCSConfigItem *)self buckets];
  int64_t v6 = [(BCSConfigItem *)self filterShardCount];
  v7 = [(BCSConfigItem *)self expirationDate];
  v8 = [(BCSConfigItem *)self itemTTL];
  v9 = [v3 stringWithFormat:@"%@ - buckets:%lu - shards:%lu - expirationDate:%@ - itemTTL:%@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isExpired
{
  v2 = [(BCSConfigItem *)self expirationDate];
  v3 = [MEMORY[0x263EFF910] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = [(BCSConfigItem *)self buckets];
    v4[2] = [(BCSConfigItem *)self filterShardCount];
    uint64_t v5 = [(BCSConfigItem *)self expirationDate];
    int64_t v6 = (void *)v4[5];
    void v4[5] = v5;

    uint64_t v7 = [(BCSConfigItem *)self filterMegaShardURL];
    v8 = (void *)v4[4];
    v4[4] = v7;

    uint64_t v9 = [(BCSConfigItem *)self itemTTL];
    v10 = (void *)v4[3];
    v4[3] = v9;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t buckets = self->_buckets;
  id v5 = a3;
  [v5 encodeInteger:buckets forKey:@"BCSConfigItemBucketsCodingKey"];
  [v5 encodeInteger:self->_filterShardCount forKey:@"BCSConfigItemShardsCodingKey"];
  [v5 encodeObject:self->_expirationDate forKey:@"BCSConfigItemExpirationDateCodingKey"];
  [v5 encodeObject:self->_filterMegaShardURL forKey:@"BCSConfigItemFilterMegaShardCoding"];
  [v5 encodeObject:self->_itemTTL forKey:@"BCSConfigItemItemTTLCodingKey"];
}

- (BCSConfigItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSConfigItem;
  id v5 = [(BCSConfigItem *)&v13 init];
  if (v5)
  {
    v5->_int64_t buckets = [v4 decodeIntegerForKey:@"BCSConfigItemBucketsCodingKey"];
    v5->_filterShardCount = [v4 decodeIntegerForKey:@"BCSConfigItemShardsCodingKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSConfigItemExpirationDateCodingKey"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSConfigItemFilterMegaShardCoding"];
    filterMegaShardURL = v5->_filterMegaShardURL;
    v5->_filterMegaShardURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSConfigItemItemTTLCodingKey"];
    itemTTL = v5->_itemTTL;
    v5->_itemTTL = (NSNumber *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)buckets
{
  return self->_buckets;
}

- (void)setBuckets:(int64_t)a3
{
  self->_int64_t buckets = a3;
}

- (int64_t)filterShardCount
{
  return self->_filterShardCount;
}

- (void)setFilterShardCount:(int64_t)a3
{
  self->_filterShardCount = a3;
}

- (NSNumber)itemTTL
{
  return self->_itemTTL;
}

- (void)setItemTTL:(id)a3
{
}

- (NSURL)filterMegaShardURL
{
  return self->_filterMegaShardURL;
}

- (void)setFilterMegaShardURL:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_filterMegaShardURL, 0);

  objc_storeStrong((id *)&self->_itemTTL, 0);
}

@end