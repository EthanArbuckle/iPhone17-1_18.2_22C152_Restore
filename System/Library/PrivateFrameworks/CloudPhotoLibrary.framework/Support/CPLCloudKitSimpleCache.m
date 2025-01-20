@interface CPLCloudKitSimpleCache
- (CPLCloudKitSimpleCache)initWithLeewayInterval:(double)a3 maximumCapacity:(unint64_t)a4;
- (NSString)status;
- (double)leewayInterval;
- (id)objectForKey:(id)a3 date:(id)a4 expirationDate:(id *)a5;
- (unint64_t)_expiredCountLockedWithDate:(id)a3;
- (unint64_t)count;
- (unint64_t)expiredCountWithDate:(id)a3;
- (unint64_t)hitCount;
- (unint64_t)maximumCapacity;
- (unint64_t)missCount;
- (void)_removeExpiredEntriesLockedForNow:(id)a3;
- (void)_removeFirstEntriesCount:(unint64_t)a3;
- (void)clear;
- (void)setObject:(id)a3 forKey:(id)a4 expirationDate:(id)a5 date:(id)a6;
@end

@implementation CPLCloudKitSimpleCache

- (CPLCloudKitSimpleCache)initWithLeewayInterval:(double)a3 maximumCapacity:(unint64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitSimpleCache;
  v6 = [(CPLCloudKitSimpleCache *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_leewayInterval = a3;
    v6->_maximumCapacity = a4;
    v8 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.cloudkit.simplecache", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = CFDictionaryCreateMutable(0, v7->_maximumCapacity, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    storage = v7->_storage;
    v7->_storage = (NSMutableDictionary *)v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    orderedEntries = v7->_orderedEntries;
    v7->_orderedEntries = v13;
  }
  return v7;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B7F28;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_expiredCountLockedWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  storage = self->_storage;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B804C;
  v9[3] = &unk_10027A7B8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  v12 = &v13;
  [(NSMutableDictionary *)storage enumerateKeysAndObjectsUsingBlock:v9];
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (unint64_t)expiredCountWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8164;
  block[3] = &unk_100277240;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)hitCount
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B8248;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)missCount
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B8308;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_removeExpiredEntriesLockedForNow:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(NSMutableDictionary *)self->_storage allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:v11];
        if ([v12 isExpiredForNow:v4 withLeeway:self->_leewayInterval])
        {
          [(NSMutableDictionary *)self->_storage removeObjectForKey:v11];
          char v8 = 1;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);

    if (v8)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_storage allValues];
      uint64_t v14 = (NSMutableArray *)[v13 mutableCopy];
      orderedEntries = self->_orderedEntries;
      self->_orderedEntries = v14;

      [(NSMutableArray *)self->_orderedEntries sortUsingSelector:"compare:"];
    }
  }
  else
  {
  }
}

- (void)_removeFirstEntriesCount:(unint64_t)a3
{
  orderedEntries = self->_orderedEntries;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B8534;
  v6[3] = &unk_10027A7E0;
  v6[4] = self;
  v6[5] = a3;
  [(NSMutableArray *)orderedEntries enumerateObjectsUsingBlock:v6];
  -[NSMutableArray removeObjectsInRange:](self->_orderedEntries, "removeObjectsInRange:", 0, a3);
}

- (id)objectForKey:(id)a3 date:(id)a4 expirationDate:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000B8754;
  v30 = sub_1000B8764;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000B8754;
  v24 = sub_1000B8764;
  id v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B876C;
  block[3] = &unk_10027A808;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  long long v18 = &v26;
  long long v19 = &v20;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);
  *a5 = (id) v21[5];
  id v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)setObject:(id)a3 forKey:(id)a4 expirationDate:(id)a5 date:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_maximumCapacity)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B895C;
    block[3] = &unk_100276FC8;
    id v16 = v11;
    id v17 = v10;
    id v18 = v12;
    id v19 = v13;
    uint64_t v20 = self;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
}

- (void)clear
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8B7C;
  block[3] = &unk_100275EA0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (NSString)status
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000B8754;
  id v10 = sub_1000B8764;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B8CB0;
  v5[3] = &unk_100275F88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (double)leewayInterval
{
  return self->_leewayInterval;
}

- (unint64_t)maximumCapacity
{
  return self->_maximumCapacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedEntries, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end