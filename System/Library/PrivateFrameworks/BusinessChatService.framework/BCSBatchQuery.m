@interface BCSBatchQuery
- (BCSBatchQuery)initWithItemIdentifiers:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6 skipRegistrationCheck:(BOOL)a7;
- (NSArray)itemIdentifiers;
- (NSArray)shardIdentifiers;
- (void)setItemIdentifiers:(id)a3;
- (void)setShardIdentifiers:(id)a3;
@end

@implementation BCSBatchQuery

- (BCSBatchQuery)initWithItemIdentifiers:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6 skipRegistrationCheck:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a5;
  id v15 = a4;
  v16 = [v13 firstObject];
  v19.receiver = self;
  v19.super_class = (Class)BCSBatchQuery;
  v17 = [(BCSQuery *)&v19 initWithItemIdentifier:v16 config:v15 clientBundleId:v14 shardType:a6 skipRegistrationCheck:v7];

  if (v17) {
    objc_storeStrong((id *)&v17->_itemIdentifiers, a3);
  }

  return v17;
}

- (void)setShardIdentifiers:(id)a3
{
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (NSArray)shardIdentifiers
{
  return self->_shardIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shardIdentifiers, 0);

  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

@end