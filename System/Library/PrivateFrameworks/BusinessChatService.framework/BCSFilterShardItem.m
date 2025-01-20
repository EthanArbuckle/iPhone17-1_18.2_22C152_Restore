@interface BCSFilterShardItem
+ (BOOL)supportsSecureCoding;
- (BCSFilterShardItem)initWithBloomFilter:(id)a3 bloomFilterString:(id)a4 startIndex:(int64_t)a5 shardCount:(int64_t)a6 type:(int64_t)a7 expirationDate:(id)a8;
- (BCSFilterShardItem)initWithBloomFilterString:(id)a3 startIndex:(int64_t)a4 shardCount:(int64_t)a5 type:(int64_t)a6 expirationDate:(id)a7;
- (BCSFilterShardItem)initWithBusinessCallerShardItem:(id)a3;
- (BCSFilterShardItem)initWithBusinessEmailShardItem:(id)a3;
- (BCSFilterShardItem)initWithBusinessLinkShardItem:(id)a3;
- (BCSFilterShardItem)initWithChatSuggestShardItem:(id)a3;
- (BCSFilterShardItem)initWithCoder:(id)a3;
- (BCSFilterShardItem)initWithJSONObj:(id)a3 type:(int64_t)a4;
- (BCSFilterShardItem)initWithRecord:(id)a3 type:(int64_t)a4;
- (BCSFilterShardItem)initWithURL:(id)a3 type:(int64_t)a4;
- (BOOL)isExpired;
- (NSString)description;
- (_PASBloomFilter)bloomFilter;
- (id)containsItemMatching:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_containsValue:(void *)a1;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSFilterShardItem

- (BCSFilterShardItem)initWithBloomFilterString:(id)a3 startIndex:(int64_t)a4 shardCount:(int64_t)a5 type:(int64_t)a6 expirationDate:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
  if (v14)
  {
    v15 = [MEMORY[0x263F61E00] bloomFilterWithData:v14];
  }
  else
  {
    v15 = 0;
  }
  v16 = [(BCSFilterShardItem *)self initWithBloomFilter:v15 bloomFilterString:v12 startIndex:a4 shardCount:a5 type:a6 expirationDate:v13];

  return v16;
}

- (BCSFilterShardItem)initWithBloomFilter:(id)a3 bloomFilterString:(id)a4 startIndex:(int64_t)a5 shardCount:(int64_t)a6 type:(int64_t)a7 expirationDate:(id)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BCSFilterShardItem;
  v16 = [(BCSShardItem *)&v19 initWithBase64EncodedString:a4 shardType:a7 startIndex:a5 shardCount:a6 expirationDate:a8];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_bloomFilter, a3);
  }

  return v17;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)BCSFilterShardItem;
  v2 = [(BCSShardItem *)&v4 description];

  return (NSString *)v2;
}

- (BOOL)isExpired
{
  v2 = [(BCSShardItem *)self expirationDate];
  v3 = [MEMORY[0x263EFF910] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BCSFilterShardItem;
  BOOL v4 = [(BCSShardItem *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(BCSFilterShardItem *)self bloomFilter];
    v6 = (void *)v4[6];
    v4[6] = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BCSFilterShardItem;
  [(BCSShardItem *)&v3 encodeWithCoder:a3];
}

- (BCSFilterShardItem)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BCSFilterShardItem;
  objc_super v3 = [(BCSShardItem *)&v9 initWithCoder:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v5 = [(BCSShardItem *)v3 base64EncodedString];
    v6 = (void *)[v4 initWithBase64EncodedString:v5 options:0];

    if (v6)
    {
      v7 = [MEMORY[0x263F61E00] bloomFilterWithData:v6];
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&v3->_bloomFilter, v7);
    if (v6) {
  }
    }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_containsValue:(void *)a1
{
  v2 = a1;
  uint64_t v10 = a2;
  if (a1)
  {
    objc_super v3 = [a1 bloomFilter];
    id v4 = (void *)[v3 newHashesArray];

    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v10 length:8];
    v6 = [v2 bloomFilter];
    id v7 = (id)[v6 computeHashesWithSeed:1 forData:v5 reuse:v4];

    objc_super v8 = [v2 bloomFilter];
    v2 = (void *)[v8 getWithHashes:v4];
  }
  return v2;
}

- (id)containsItemMatching:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26C62ECA0])
  {
    id v5 = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = objc_msgSend(v5, "truncatedHashes", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (-[BCSFilterShardItem _containsValue:](self, [v11 longLongValue]))
          {
            id v12 = -[BCSFilterMatchResult initWithMatch:itemIdentifier:matchingTruncatedHash:]([BCSFilterMatchResult alloc], "initWithMatch:itemIdentifier:matchingTruncatedHash:", 1, v5, [v11 longLongValue]);

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = -[BCSFilterMatchResult initWithMatch:itemIdentifier:matchingTruncatedHash:]([BCSFilterMatchResult alloc], "initWithMatch:itemIdentifier:matchingTruncatedHash:", 0, v5, [v5 truncatedHash]);
LABEL_13:
  }
  else
  {
    id v12 = -[BCSFilterMatchResult initWithMatch:itemIdentifier:matchingTruncatedHash:]([BCSFilterMatchResult alloc], "initWithMatch:itemIdentifier:matchingTruncatedHash:", -[BCSFilterShardItem _containsValue:](self, [v4 truncatedHash]), v4, objc_msgSend(v4, "truncatedHash"));
  }

  return v12;
}

- (_PASBloomFilter)bloomFilter
{
  return self->_bloomFilter;
}

- (void).cxx_destruct
{
}

- (BCSFilterShardItem)initWithBusinessLinkShardItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 filter];
  v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));

  uint64_t v9 = [v4 filter];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F61E00] bloomFilterWithData:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, [v4 index], objc_msgSend(v4, "count"), 2, v8);

  return v11;
}

- (BCSFilterShardItem)initWithChatSuggestShardItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 filter];
  v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));

  uint64_t v9 = [v4 filter];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F61E00] bloomFilterWithData:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, [v4 index], objc_msgSend(v4, "count"), 1, v8);

  return v11;
}

- (BCSFilterShardItem)initWithBusinessCallerShardItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 filter];
  v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));

  uint64_t v9 = [v4 filter];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F61E00] bloomFilterWithData:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, [v4 index], objc_msgSend(v4, "count"), 4, v8);

  return v11;
}

- (BCSFilterShardItem)initWithBusinessEmailShardItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 filter];
  v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));

  uint64_t v9 = [v4 filter];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F61E00] bloomFilterWithData:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, [v4 index], objc_msgSend(v4, "count"), 5, v8);

  return v11;
}

- (BCSFilterShardItem)initWithJSONObj:(id)a3 type:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"records"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"fields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263F61E00]) initWithJSONObj:v6];
      v11 = [v9 objectForKeyedSubscript:@"index"];
      v22 = [v11 objectForKeyedSubscript:@"value"];

      id v12 = [v9 objectForKeyedSubscript:@"count"];
      v21 = [v12 objectForKeyedSubscript:@"value"];

      id v13 = [v9 objectForKeyedSubscript:@"ttl"];
      long long v14 = [v13 objectForKeyedSubscript:@"value"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        long long v15 = [MEMORY[0x263EFF910] date];
        [v14 doubleValue];
        v20 = objc_msgSend(v15, "dateByAddingTimeInterval:");

        long long v16 = [v10 _bloomFilterStringWithJSONObj:v6];
        self = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:](self, "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v16, [v22 longLongValue], objc_msgSend(v21, "longLongValue"), a4, v20);

        long long v17 = self;
      }
      else
      {
        v18 = ABSLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[BCSFilterShardItem(Conversion) initWithJSONObj:type:]";
          _os_log_error_impl(&dword_2154F4000, v18, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type", buf, 0xCu);
        }

        long long v17 = 0;
      }
    }
    else
    {
      uint64_t v10 = ABSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[BCSFilterShardItem(Conversion) initWithJSONObj:type:]";
        _os_log_error_impl(&dword_2154F4000, v10, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem fields parameter is not an NSDictioanry", buf, 0xCu);
      }
      long long v17 = 0;
    }
  }
  else
  {
    uint64_t v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[BCSFilterShardItem(Conversion) initWithJSONObj:type:]";
      _os_log_error_impl(&dword_2154F4000, v8, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem records parameter is not an NSArray", buf, 0xCu);
    }
    long long v17 = 0;
  }

  return v17;
}

- (BCSFilterShardItem)initWithRecord:(id)a3 type:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"filter"];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F61E00] bloomFilterWithData:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"index"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"count"];
  v11 = [v6 objectForKeyedSubscript:@"ttl"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = [MEMORY[0x263EFF910] date];
    [v11 doubleValue];
    id v13 = objc_msgSend(v12, "dateByAddingTimeInterval:");

    long long v14 = [v7 base64EncodedStringWithOptions:0];
    self = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:](self, "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v8, v14, [v9 longLongValue], objc_msgSend(v10, "longLongValue"), a4, v13);

    long long v15 = self;
  }
  else
  {
    long long v16 = ABSLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[BCSFilterShardItem(Conversion) initWithRecord:type:]";
      _os_log_error_impl(&dword_2154F4000, v16, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type", (uint8_t *)&v18, 0xCu);
    }

    long long v15 = 0;
  }

  return v15;
}

- (BCSFilterShardItem)initWithURL:(id)a3 type:(int64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithContentsOfURL:v7];

  uint64_t v9 = 0;
  switch(a4)
  {
    case 1:
      uint64_t v10 = [[BCSChatSuggestShardItem alloc] initWithData:v8];
      v11 = [[BCSFilterShardItem alloc] initWithChatSuggestShardItem:v10];
      goto LABEL_6;
    case 2:
      uint64_t v10 = [[BCSBusinessLinkShardItem alloc] initWithData:v8];
      v11 = [[BCSFilterShardItem alloc] initWithBusinessLinkShardItem:v10];
      goto LABEL_6;
    case 4:
      uint64_t v10 = [[BCSCallerIdShardItem alloc] initWithData:v8];
      v11 = [[BCSFilterShardItem alloc] initWithBusinessCallerShardItem:v10];
      goto LABEL_6;
    case 5:
      uint64_t v10 = [[BCSCallerIdShardItem alloc] initWithData:v8];
      v11 = [[BCSFilterShardItem alloc] initWithBusinessEmailShardItem:v10];
LABEL_6:
      uint64_t v9 = v11;

      break;
    default:
      break;
  }

  return v9;
}

@end