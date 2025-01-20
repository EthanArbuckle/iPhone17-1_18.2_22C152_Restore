@interface BCSQuery
- (BCSBusinessConfig)config;
- (BCSItemIdentifying)itemIdentifier;
- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5;
- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5 cacheOnly:(BOOL)a6;
- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5 skipRegistrationCheck:(BOOL)a6;
- (BCSQuery)initWithItemIdentifier:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6;
- (BCSQuery)initWithItemIdentifier:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6 skipRegistrationCheck:(BOOL)a7;
- (BOOL)cacheOnly;
- (BOOL)skipRegistrationCheck;
- (NSString)clientBundleId;
- (int64_t)shardType;
- (void)setCacheOnly:(BOOL)a3;
- (void)setClientBundleId:(id)a3;
- (void)setConfig:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setShardType:(int64_t)a3;
- (void)setSkipRegistrationCheck:(BOOL)a3;
- (void)updateConfig:(id)a3;
@end

@implementation BCSQuery

- (BCSQuery)initWithItemIdentifier:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6 skipRegistrationCheck:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BCSQuery;
  v16 = [(BCSQuery *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_itemIdentifier, a3);
    objc_storeStrong((id *)&v17->_config, a4);
    objc_storeStrong((id *)&v17->_clientBundleId, a5);
    v17->_shardType = a6;
    v17->_skipRegistrationCheck = a7;
  }

  return v17;
}

- (BCSQuery)initWithItemIdentifier:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BCSQuery;
  id v14 = [(BCSQuery *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemIdentifier, a3);
    objc_storeStrong((id *)&v15->_config, a4);
    objc_storeStrong((id *)&v15->_clientBundleId, a5);
    v15->_shardType = a6;
  }

  return v15;
}

- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5 skipRegistrationCheck:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSQuery;
  id v13 = [(BCSQuery *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_itemIdentifier, a3);
    objc_storeStrong((id *)&v14->_clientBundleId, a4);
    v14->_shardType = a5;
    v14->_skipRegistrationCheck = a6;
  }

  return v14;
}

- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5
{
  return [(BCSQuery *)self initWithItemIdentifier:a3 clientBundleId:a4 shardType:a5 skipRegistrationCheck:0];
}

- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5 cacheOnly:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSQuery;
  id v13 = [(BCSQuery *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_itemIdentifier, a3);
    objc_storeStrong((id *)&v14->_clientBundleId, a4);
    v14->_shardType = a5;
    v14->_skipRegistrationCheck = 0;
    v14->_cacheOnly = a6;
  }

  return v14;
}

- (void)updateConfig:(id)a3
{
}

- (BCSItemIdentifying)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (BCSBusinessConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (int64_t)shardType
{
  return self->_shardType;
}

- (void)setShardType:(int64_t)a3
{
  self->_shardType = a3;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (BOOL)skipRegistrationCheck
{
  return self->_skipRegistrationCheck;
}

- (void)setSkipRegistrationCheck:(BOOL)a3
{
  self->_skipRegistrationCheck = a3;
}

- (BOOL)cacheOnly
{
  return self->_cacheOnly;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_cacheOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end