@interface ItemCache
- (FATVolume)volume;
- (ItemCache)initWithVolume:(id)a3;
- (NSMutableDictionary)itemsHash;
- (void)calculateKeyForItem:(id)a3 replyHandler:(id)a4;
- (void)insertItem:(id)a3 replyHandler:(id)a4;
- (void)removeItem:(id)a3;
- (void)setItemsHash:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation ItemCache

- (ItemCache)initWithVolume:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ItemCache;
  v6 = [(ItemCache *)&v12 init];
  if (!v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  itemsHash = v6->_itemsHash;
  v6->_itemsHash = v7;

  if (!v6->_itemsHash)
  {
    v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100030810(v10);
    }

    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_volume, a3);
  v9 = v6;
LABEL_8:

  return v9;
}

- (void)calculateKeyForItem:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  id v29 = 0;
  v8 = [v6 entryData];
  id v9 = [v8 firstEntryOffsetInDir];

  id v29 = v9;
  v10 = [(FATVolume *)self->_volume systemInfo];
  unsigned int v11 = [v10 bytesPerCluster];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10001FD44;
  v21 = sub_10001FD54;
  id v22 = 0;
  objc_super v12 = [v6 parentDir];

  if (v12)
  {
    v13 = [(FATVolume *)self->_volume fatManager];
    v14 = [v6 parentDir];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001FD5C;
    v15[3] = &unk_10004D078;
    v15[4] = &v17;
    v15[5] = v28;
    unsigned int v16 = v11;
    v15[6] = v23;
    v15[7] = &v24;
    [v13 iterateClusterChainOfItem:v14 replyHandler:v15];
  }
  if (v18[5]) {
    v7[2](v7, 0);
  }
  else {
    v7[2](v7, v25[3]);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);
}

- (void)insertItem:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([v6 isDeleted])
  {
    v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100030894(v8);
    }

    id v9 = fs_errorForPOSIXError();
    v7[2](v7, 0, v9);
  }
  else
  {
    v10 = [v6 entryData];
    unsigned int v11 = [v6 volume];
    objc_super v12 = [v11 systemInfo];
    id v13 = [v10 calcFirstEntryOffsetInVolume:v12];

    id v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%llu", v13);
    v15 = self->_itemsHash;
    objc_sync_enter(v15);
    unsigned int v16 = [(NSMutableDictionary *)self->_itemsHash objectForKey:v14];
    id v9 = v16;
    if (v16)
    {
      if ([v16 isDeleted])
      {
        [(NSMutableDictionary *)self->_itemsHash setObject:v6 forKey:v14];
        id v17 = v6;
      }
      else
      {
        id v17 = v9;
        v18 = fskit_std_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_100030918(v18);
        }
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_itemsHash setObject:v6 forKey:v14];
      id v17 = 0;
    }
    objc_sync_exit(v15);

    if (v17) {
      id v19 = v17;
    }
    else {
      id v19 = v6;
    }
    ((void (**)(id, id, void *))v7)[2](v7, v19, 0);
  }
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 entryData];
  id v6 = [v4 volume];
  v7 = [v6 systemInfo];
  id v8 = [v5 calcFirstEntryOffsetInVolume:v7];

  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%llu", v8);
  v10 = self->_itemsHash;
  objc_sync_enter(v10);
  unsigned int v11 = [(NSMutableDictionary *)self->_itemsHash objectForKey:v9];
  if (v11)
  {
    [(NSMutableDictionary *)self->_itemsHash removeObjectForKey:v9];
  }
  else
  {
    objc_super v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10003099C((uint64_t)v9, v12);
    }
  }
  objc_sync_exit(v10);
}

- (NSMutableDictionary)itemsHash
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItemsHash:(id)a3
{
}

- (FATVolume)volume
{
  return (FATVolume *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVolume:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);

  objc_storeStrong((id *)&self->_itemsHash, 0);
}

@end