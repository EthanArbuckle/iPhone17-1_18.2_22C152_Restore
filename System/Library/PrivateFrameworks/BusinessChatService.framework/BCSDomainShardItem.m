@interface BCSDomainShardItem
+ (id)shardItemWithFileURL:(id)a3;
- (BCSDomainShardItem)initWithCoder:(id)a3;
- (BCSDomainShardItem)initWithFileURL:(id)a3 startIndex:(int64_t)a4 shardCount:(int64_t)a5 type:(int64_t)a6 expirationDate:(id)a7;
- (BCSDomainShardItem)initWithJSONObj:(id)a3 type:(int64_t)a4;
- (BCSDomainShardItem)initWithRecord:(id)a3 type:(int64_t)a4;
- (BCSDomainShardItem)initWithURL:(id)a3;
- (NSString)description;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation BCSDomainShardItem

- (BCSDomainShardItem)initWithJSONObj:(id)a3 type:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", @"records", a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 firstObject];
    v7 = [v6 objectForKeyedSubscript:@"fields"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 136315394;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        __int16 v33 = 2112;
        v34 = v26;
        _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "%s - Expected NSDictionary fields parameter. Got %@", buf, 0x16u);
      }
      v19 = 0;
      goto LABEL_24;
    }
    v8 = [v7 objectForKeyedSubscript:@"filter"];
    v9 = [v8 objectForKeyedSubscript:@"value"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = ABSLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 136315394;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        __int16 v33 = 2112;
        v34 = v28;
        _os_log_error_impl(&dword_2154F4000, v11, OS_LOG_TYPE_ERROR, "%s - Expected NSString domainShardString parameter. Got %@", buf, 0x16u);
      }
      v19 = 0;
      goto LABEL_23;
    }
    v10 = [v7 objectForKeyedSubscript:@"shard"];
    v11 = [v10 objectForKeyedSubscript:@"value"];

    v12 = [v7 objectForKeyedSubscript:@"index"];
    v13 = [v12 objectForKeyedSubscript:@"value"];

    v14 = [v7 objectForKeyedSubscript:@"count"];
    v15 = [v14 objectForKeyedSubscript:@"value"];

    v16 = [v7 objectForKeyedSubscript:@"ttl"];
    v17 = [v16 objectForKeyedSubscript:@"value"];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [MEMORY[0x263EFF910] date];
            [v17 doubleValue];
            v30 = objc_msgSend(v18, "dateByAddingTimeInterval:");

            v29 = [v11 fileURL];
            self = -[BCSDomainShardItem initWithFileURL:startIndex:shardCount:type:expirationDate:](self, "initWithFileURL:startIndex:shardCount:type:expirationDate:", v29, [v13 longLongValue], objc_msgSend(v15, "longLongValue"), 3, v30);

            v19 = self;
LABEL_22:

LABEL_23:
LABEL_24:

            goto LABEL_25;
          }
        }
      }
      v20 = ABSLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        v21 = "%s - BCSDomainShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type";
LABEL_27:
        _os_log_error_impl(&dword_2154F4000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
      }
    }
    else
    {
      v20 = ABSLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        v21 = "%s - No asset found in record to download Domain Shard";
        goto LABEL_27;
      }
    }

    v19 = 0;
    goto LABEL_22;
  }
  v6 = ABSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 136315394;
    v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_error_impl(&dword_2154F4000, v6, OS_LOG_TYPE_ERROR, "%s - Expected NSArray for records parameter. Got %@", buf, 0x16u);
  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (BCSDomainShardItem)initWithRecord:(id)a3 type:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"shard"];
  v7 = [v5 objectForKeyedSubscript:@"index"];
  v8 = [v5 objectForKeyedSubscript:@"count"];
  v9 = [v5 objectForKeyedSubscript:@"ttl"];

  v10 = [MEMORY[0x263EFF910] date];
  [v9 doubleValue];
  v11 = objc_msgSend(v10, "dateByAddingTimeInterval:");

  if (!v6)
  {
    v14 = ABSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "-[BCSDomainShardItem(Conversion) initWithRecord:type:]";
      v15 = "%s - No asset found in record to download Domain Shard";
      goto LABEL_12;
    }
LABEL_9:

    v13 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = ABSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "-[BCSDomainShardItem(Conversion) initWithRecord:type:]";
      v15 = "%s - BCSShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type";
LABEL_12:
      _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v12 = [v6 fileURL];
  self = -[BCSDomainShardItem initWithFileURL:startIndex:shardCount:type:expirationDate:](self, "initWithFileURL:startIndex:shardCount:type:expirationDate:", v12, [v7 longLongValue], objc_msgSend(v8, "longLongValue"), 3, v11);

  v13 = self;
LABEL_10:

  return v13;
}

- (BCSDomainShardItem)initWithURL:(id)a3
{
  v4 = +[BCSDomainShardItem shardItemWithFileURL:a3];

  return v4;
}

+ (id)shardItemWithFileURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[BCSLineReader alloc] initWithFileURL:v3];
  id v5 = [(BCSLineReader *)v4 readLine];
  if ([v5 length])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v5 options:0];
    if ([v6 length])
    {
      v7 = [[BCSDomainShardItemMetadata alloc] initWithData:v6];
      if (v7)
      {
        v8 = v7;
        v9 = [MEMORY[0x263EFF910] date];
        v10 = objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-[BCSDomainShardItemMetadata ttl](v8, "ttl"));

        v11 = [[BCSDomainShardItem alloc] initWithFileURL:v3 startIndex:[(BCSDomainShardItemMetadata *)v8 index] shardCount:[(BCSDomainShardItemMetadata *)v8 count] type:3 expirationDate:v10];
        goto LABEL_8;
      }
    }
  }
  else
  {
    v6 = ABSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "+[BCSDomainShardItem shardItemWithFileURL:]";
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_error_impl(&dword_2154F4000, v6, OS_LOG_TYPE_ERROR, "%s Cannot create BCSDomainShardItem. Got nil metadata while reading file %@", (uint8_t *)&v13, 0x16u);
    }
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (BCSDomainShardItem)initWithFileURL:(id)a3 startIndex:(int64_t)a4 shardCount:(int64_t)a5 type:(int64_t)a6 expirationDate:(id)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCSDomainShardItem;
  v14 = [(BCSShardItem *)&v17 initWithBase64EncodedString:@"DS" shardType:a6 startIndex:a4 shardCount:a5 expirationDate:a7];
  __int16 v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_fileURL, a3);
  }

  return v15;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSDomainShardItem;
  v4 = [(BCSShardItem *)&v8 description];
  id v5 = [(BCSDomainShardItem *)self fileURL];
  v6 = [v3 stringWithFormat:@"%@ - File URL %@", v4, v5];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BCSDomainShardItem;
  v4 = [(BCSShardItem *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(BCSDomainShardItem *)self fileURL];
    v6 = (void *)v4[6];
    v4[6] = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BCSDomainShardItem;
  id v4 = a3;
  [(BCSShardItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileURL, @"BCSDomainShardItemFileURLCoding", v5.receiver, v5.super_class);
}

- (BCSDomainShardItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSDomainShardItem;
  objc_super v5 = [(BCSShardItem *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSDomainShardItemFileURLCoding"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end