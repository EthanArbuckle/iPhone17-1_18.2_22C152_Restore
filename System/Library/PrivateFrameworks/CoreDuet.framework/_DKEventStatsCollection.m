@interface _DKEventStatsCollection
+ (id)collectionWithName:(uint64_t)a1;
+ (id)counterWithClass:(void *)a3 collectionName:(void *)a4 eventName:(void *)a5 eventType:(void *)a6 eventTypePossibleValues:(char)a7 hasResult:(int)a8 scalar:;
- (void)initWithName:(void *)a1;
@end

@implementation _DKEventStatsCollection

+ (id)collectionWithName:(uint64_t)a1
{
  id v2 = a2;
  v3 = (objc_class *)self;
  if (collectionWithName__initialized != -1) {
    dispatch_once(&collectionWithName__initialized, &__block_literal_global_53);
  }
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  id v5 = v2;
  v6 = [(id)_DKEventStatsCollections objectForKeyedSubscript:v5];
  if (!v6)
  {
    v6 = -[_DKEventStatsCollection initWithName:]([v3 alloc], v5);
    [(id)_DKEventStatsCollections setObject:v6 forKeyedSubscript:v5];
  }

  objc_sync_exit(v4);
  return v6;
}

- (void)initWithName:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_DKEventStatsCollection;
    id v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      uint64_t v6 = objc_opt_new();
      v7 = (void *)a1[1];
      a1[1] = v6;
    }
  }

  return a1;
}

+ (id)counterWithClass:(void *)a3 collectionName:(void *)a4 eventName:(void *)a5 eventType:(void *)a6 eventTypePossibleValues:(char)a7 hasResult:(int)a8 scalar:
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = self;
  +[_DKEventStatsCollection collectionWithName:](v17, v13);
  v18 = (id *)(id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v18);
  if (v15)
  {
    v24[0] = v14;
    v24[1] = v15;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  }
  else
  {
    id v19 = v14;
  }
  v20 = v19;
  v21 = -[_DKSyncDeletedEventIDs deletedEventIDsForSourceDeviceID:](v18, (uint64_t)v19);
  if (!v21)
  {
    v21 = objc_opt_new();
    v22 = -[_DKEventStatsCounterInternal initWithCollectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((id *)[_DKEventStatsCounterInternal alloc], v13, v14, v15, v16, a7, a8);
    [v21 setInternal:v22];
    if (v18) {
      [v18[1] setObject:v21 forKeyedSubscript:v20];
    }
  }
  objc_sync_exit(v18);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventCounterStats, 0);
}

@end