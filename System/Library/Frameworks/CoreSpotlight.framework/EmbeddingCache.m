@interface EmbeddingCache
+ (id)embeddingCaches;
+ (id)initInstanceWithType:(int)a3 name:(id)a4;
+ (id)sharedInstanceWithType:(int)a3;
- ($0F75B35099F22A4CE81B1DFE1715ED8E)fifo;
- (BOOL)dbWriteValueWithKey:(int64_t)a3 data:(const void *)a4 dataLen:(int)a5;
- (BOOL)put:(const char *)a3 value:(id)a4;
- (EmbeddingCache)initWithParentFd:(int)a3 indexType:(int)a4 dbName:(id)a5;
- (id)dbFetchValueWithKey:(int64_t)a3;
- (id)get:(const char *)a3;
- (unsigned)hitRate;
- (unsigned)itemCount;
- (void)closeAndDeleteStore:(id)a3;
- (void)deleteFromDb:(unsigned int)a3;
- (void)flush;
- (void)populateFifoStore;
- (void)setFifo:(id *)a3;
- (void)setProtectionClassForFolder:(int)a3 protectionClass:(int)a4;
@end

@implementation EmbeddingCache

+ (id)embeddingCaches
{
  if (qword_1000F8820 != -1) {
    dispatch_once(&qword_1000F8820, &stru_1000D9940);
  }
  v2 = (void *)qword_1000F8818;

  return v2;
}

- (BOOL)dbWriteValueWithKey:(int64_t)a3 data:(const void *)a4 dataLen:(int)a5
{
  obj = (void *)db_create_obj();
  if (obj)
  {
    void *obj = a3;
    if (db_add_field())
    {
      v7 = sub_10000BE40();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10009F7FC();
      }
    }
    else
    {
      if (!db_store_obj())
      {
        BOOL v8 = 1;
        goto LABEL_10;
      }
      v7 = sub_10000BE40();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10009F790();
      }
    }

    BOOL v8 = 0;
LABEL_10:
    db_release_obj();
    return v8;
  }
  return 0;
}

- (id)dbFetchValueWithKey:(int64_t)a3
{
  db_get_obj();
  v3 = +[NSData data];

  return v3;
}

- (void)setProtectionClassForFolder:(int)a3 protectionClass:(int)a4
{
}

- (void)populateFifoStore
{
  self->_fifo.index = 0;
  db_iterate_objects_in_range();
}

- (EmbeddingCache)initWithParentFd:(int)a3 indexType:(int)a4 dbName:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  si_init_indexing_zone();
  [(EmbeddingCache *)self setProtectionClassForFolder:v6 protectionClass:3];
  id v9 = v8;
  [v9 UTF8String];
  datastore = (datastore_info *)db_get_datastore();
  if (datastore) {
    goto LABEL_5;
  }
  v11 = sub_10000BE40();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10009F918(v11);
  }

  datastore = (datastore_info *)db_create_datastore();
  if (datastore)
  {
LABEL_5:
    self->_parentDirFd = v6;
    self->_indexType = a4;
    self->_dsi = datastore;
    objc_storeStrong((id *)&self->_dbName, v9);
    self->_stats = 0;
    [(EmbeddingCache *)self populateFifoStore];
    v12 = self;
  }
  else
  {
    v14 = sub_10000BE40();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009F8D4(v14);
    }

    v12 = 0;
  }

  return v12;
}

- (void)closeAndDeleteStore:(id)a3
{
  id v4 = a3;
  db_release_datastore();
  uint64_t parentDirFd = self->_parentDirFd;
  id v6 = v4;
  id v7 = [v6 UTF8String];

  _db_delete_datastore(parentDirFd, v7, 270336);
}

- (void)flush
{
  int v4 = 0;
  db_lock_datastore();
  if (db_flush_datastore())
  {
    v2 = sub_10000BE40();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10009FB64();
    }
  }
  else
  {
    db_downgrade_datastore();
    v2 = sub_10000BE40();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Embedding Cache #flushAndCommit success", v3, 2u);
    }
  }

  db_unlock_datastore();
}

+ (id)sharedInstanceWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v4 = [a1 embeddingCaches];
  v5 = +[NSNumber numberWithUnsignedInt:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

+ (id)initInstanceWithType:(int)a3 name:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [a1 embeddingCaches];
  id v8 = +[NSNumber numberWithUnsignedInt:v4];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
    goto LABEL_20;
  }
  v11 = sub_100035610(v4);
  v12 = +[NSFileManager defaultManager];
  unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

  if ((v13 & 1) == 0)
  {
    v14 = sub_10000BE40();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009FD88(v11);
    }

    v15 = +[NSFileManager defaultManager];
    id v26 = 0;
    unsigned __int8 v16 = [v15 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v17 = v26;

    v18 = sub_10000BE40();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if ((v16 & 1) == 0)
    {
      if (v19) {
        sub_10009FD00((uint64_t)v17, (uint64_t)v11, v18);
      }

      goto LABEL_18;
    }
    if (v19) {
      sub_10009FC80(v11);
    }
  }
  id v20 = v11;
  uint64_t v21 = open((const char *)[v20 fileSystemRepresentation], 0x100000);
  if (v21 == -1)
  {
    v24 = sub_10000BE40();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10009FBCC(v20, v24);
    }

LABEL_18:
    id v10 = 0;
    goto LABEL_19;
  }
  id v22 = [objc_alloc((Class)a1) initWithParentFd:v21 indexType:v4 dbName:v6];
  v23 = +[NSNumber numberWithUnsignedInt:v4];
  [v7 setObject:v22 forKeyedSubscript:v23];

  id v10 = v22;
LABEL_19:

LABEL_20:

  return v10;
}

- (void)deleteFromDb:(unsigned int)a3
{
}

- (BOOL)put:(const char *)a3 value:(id)a4
{
  id v6 = a4;
  if (a3
    && (int v7 = strlen(a3),
        unsigned int v8 = sub_10001E700((uint64_t)a3, v7),
        id v9 = v6,
        -[EmbeddingCache dbWriteValueWithKey:data:dataLen:](self, "dbWriteValueWithKey:data:dataLen:", v8, [v9 bytes], objc_msgSend(v9, "length"))))
  {
    p_fifo = &self->_fifo;
    p_index = &self->_fifo.index;
    self->_fifo.index %= 100000;
    if ([(EmbeddingCache *)self itemCount] >> 5 >= 0xC35) {
      [(EmbeddingCache *)self deleteFromDb:p_fifo->_data[*p_index]];
    }
    p_fifo->_data[(*p_index)++] = v8;
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)get:(const char *)a3
{
  if (a3)
  {
    int v5 = strlen(a3);
    id v6 = [(EmbeddingCache *)self dbFetchValueWithKey:sub_10001E700((uint64_t)a3, v5)];
    id v7 = [v6 length];
    uint64_t v8 = 32;
    if (!v7) {
      uint64_t v8 = 36;
    }
    ++*(_DWORD *)((char *)&self->super.isa + v8);
  }
  else
  {
    id v6 = +[NSData data];
  }

  return v6;
}

- (unsigned)hitRate
{
  unsigned int hitCount = self->_stats.hitCount;
  unsigned int v3 = self->_stats.missCount + hitCount;
  if (v3) {
    return hitCount / v3;
  }
  else {
    return 0;
  }
}

- (unsigned)itemCount
{
  return db_get_object_count();
}

- ($0F75B35099F22A4CE81B1DFE1715ED8E)fifo
{
  objc_copyStruct(retstr, &self->_fifo, 400004, 1, 0);
  return result;
}

- (void)setFifo:(id *)a3
{
}

- (void).cxx_destruct
{
}

@end