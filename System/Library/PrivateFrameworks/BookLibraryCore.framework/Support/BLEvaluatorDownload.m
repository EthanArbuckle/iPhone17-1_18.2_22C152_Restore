@interface BLEvaluatorDownload
+ (id)copyEvaluatorDownloadForDownload:(id)a3;
+ (id)copyEvaluatorDownloadForDownloadMetadataArray:(id)a3 logKey:(id)a4;
+ (id)copyEvaluatorDownloadForPurchaseResponse:(id)a3 storeIdentifiersToDownload:(id)a4;
+ (id)copyEvaluatorDownloadWithParameters:(id)a3;
+ (id)formatSize:(unint64_t)a3;
- (BOOL)isAutomatic;
- (BOOL)isRemaining;
- (NSString)kind;
- (NSString)logKey;
- (NSString)name;
- (unint64_t)bytes;
- (void)setAutomatic:(BOOL)a3;
- (void)setBytes:(unint64_t)a3;
- (void)setKind:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setName:(id)a3;
- (void)setRemaining:(BOOL)a3;
@end

@implementation BLEvaluatorDownload

+ (id)formatSize:(unint64_t)a3
{
  if (a3 - 1000001 <= 0x3B8B87BE) {
    a3 = (unint64_t)(round((double)a3 / 1000000.0) * 1000000.0);
  }
  if (a3 >= 0x3B9ACA01) {
    a3 = (unint64_t)(round((double)a3 / 100000000.0) * 100000000.0);
  }
  return +[NSByteCountFormatter stringFromByteCount:a3 countStyle:2];
}

+ (id)copyEvaluatorDownloadForPurchaseResponse:(id)a3 storeIdentifiersToDownload:(id)a4
{
  id v22 = a1;
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = v5;
  v8 = [v5 purchaseResponseItems];
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
        id v14 = objc_alloc((Class)BLDownloadMetadata);
        v15 = [v13 item];
        id v16 = [v14 initWithDictionary:v15];

        if (!v6
          || (+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 itemIdentifier]), v17 = objc_claimAutoreleasedReturnValue(), unsigned int v18 = objc_msgSend(v6, "containsObject:", v17), v17, v18))
        {
          objc_msgSend(v7, "addObject:", v16, v22);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  v19 = [v23 logUUID];
  id v20 = [v22 copyEvaluatorDownloadForDownloadMetadataArray:v7 logKey:v19];

  return v20;
}

+ (id)copyEvaluatorDownloadForDownloadMetadataArray:(id)a3 logKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 firstObject];
  unsigned int v22 = [v7 isAutomaticDownload];
  v8 = [v7 kind];
  id v9 = [v7 collectionName];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 title];
  }
  v12 = v11;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "bl_assetFileSize");
        v16 += (uint64_t)[v19 unsignedLongValue];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  id v20 = objc_alloc_init(BLEvaluatorDownload);
  [(BLEvaluatorDownload *)v20 setAutomatic:v22];
  [(BLEvaluatorDownload *)v20 setBytes:v16];
  [(BLEvaluatorDownload *)v20 setKind:v8];
  [(BLEvaluatorDownload *)v20 setLogKey:v6];
  [(BLEvaluatorDownload *)v20 setName:v12];
  [(BLEvaluatorDownload *)v20 setRemaining:0];

  return v20;
}

+ (id)copyEvaluatorDownloadForDownload:(id)a3
{
  return +[BLEvaluatorDownload copyEvaluatorDownloadWithParameters:a3];
}

+ (id)copyEvaluatorDownloadWithParameters:(id)a3
{
  id v3 = a3;
  v4 = [v3 title];
  id v5 = [v3 fileSize];
  id v6 = objc_alloc_init(BLEvaluatorDownload);
  id v7 = [v3 isAutomaticDownload];
  if ([v7 BOOLValue])
  {
    [(BLEvaluatorDownload *)v6 setAutomatic:1];
  }
  else
  {
    v8 = [v3 isRestore];
    -[BLEvaluatorDownload setAutomatic:](v6, "setAutomatic:", [v8 BOOLValue]);
  }
  [(BLEvaluatorDownload *)v6 setBytes:v5];
  id v9 = [v3 kind];
  [(BLEvaluatorDownload *)v6 setKind:v9];

  id v10 = [v3 downloadID];
  [(BLEvaluatorDownload *)v6 setLogKey:v10];

  [(BLEvaluatorDownload *)v6 setName:v4];
  [(BLEvaluatorDownload *)v6 setRemaining:0];

  return v6;
}

- (BOOL)isAutomatic
{
  return self->_automatic;
}

- (void)setAutomatic:(BOOL)a3
{
  self->_automatic = a3;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unint64_t)a3
{
  self->_bytes = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isRemaining
{
  return self->_remaining;
}

- (void)setRemaining:(BOOL)a3
{
  self->_remaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logKey, 0);

  objc_storeStrong((id *)&self->_kind, 0);
}

@end