@interface _bmFMDatabasePool
+ (Class)databaseClass;
+ (id)databasePoolWithPath:(id)a3;
+ (id)databasePoolWithPath:(id)a3 flags:(int)a4;
+ (id)databasePoolWithURL:(id)a3;
+ (id)databasePoolWithURL:(id)a3 flags:(int)a4;
- (NSString)path;
- (NSString)vfsName;
- (_bmFMDatabasePool)init;
- (_bmFMDatabasePool)initWithPath:(id)a3;
- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4;
- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5;
- (_bmFMDatabasePool)initWithURL:(id)a3;
- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4;
- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5;
- (id)db;
- (id)delegate;
- (id)inSavePoint:(id)a3;
- (int)openFlags;
- (unint64_t)countOfCheckedInDatabases;
- (unint64_t)countOfCheckedOutDatabases;
- (unint64_t)countOfOpenDatabases;
- (unint64_t)maximumNumberOfDatabasesToCreate;
- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)executeLocked:(id)a3;
- (void)inDatabase:(id)a3;
- (void)inDeferredTransaction:(id)a3;
- (void)inExclusiveTransaction:(id)a3;
- (void)inImmediateTransaction:(id)a3;
- (void)inTransaction:(id)a3;
- (void)pushDatabaseBackInPool:(id)a3;
- (void)releaseAllDatabases;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfDatabasesToCreate:(unint64_t)a3;
- (void)setPath:(id)a3;
- (void)setVfsName:(id)a3;
@end

@implementation _bmFMDatabasePool

+ (id)databasePoolWithPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];

  return v5;
}

+ (id)databasePoolWithURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 path];

  v7 = (void *)[v5 initWithPath:v6];
  return v7;
}

+ (id)databasePoolWithPath:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithPath:v6 flags:v4];

  return v7;
}

+ (id)databasePoolWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [v6 path];

  v9 = (void *)[v7 initWithPath:v8 flags:v4];
  return v9;
}

- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4 vfs:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = [a3 path];
  v10 = [(_bmFMDatabasePool *)self initWithPath:v9 flags:v5 vfs:v8];

  return v10;
}

- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4 vfs:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_bmFMDatabasePool;
  v10 = [(_bmFMDatabasePool *)&v23 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    path = v10->_path;
    v10->_path = (NSString *)v11;

    id v13 = (id) [[NSString alloc] initWithFormat:@"fmdb.%@", v10];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    lockQueue = v10->_lockQueue;
    v10->_lockQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    databaseInPool = v10->_databaseInPool;
    v10->_databaseInPool = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    databaseOutPool = v10->_databaseOutPool;
    v10->_databaseOutPool = (NSMutableArray *)v18;

    v10->_openFlags = a4;
    uint64_t v20 = [v9 copy];
    vfsName = v10->_vfsName;
    v10->_vfsName = (NSString *)v20;
  }
  return v10;
}

- (_bmFMDatabasePool)initWithPath:(id)a3 flags:(int)a4
{
  return [(_bmFMDatabasePool *)self initWithPath:a3 flags:*(void *)&a4 vfs:0];
}

- (_bmFMDatabasePool)initWithURL:(id)a3 flags:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 path];
  id v7 = [(_bmFMDatabasePool *)self initWithPath:v6 flags:v4 vfs:0];

  return v7;
}

- (_bmFMDatabasePool)initWithPath:(id)a3
{
  return [(_bmFMDatabasePool *)self initWithPath:a3 flags:6];
}

- (_bmFMDatabasePool)initWithURL:(id)a3
{
  uint64_t v4 = [a3 path];
  uint64_t v5 = [(_bmFMDatabasePool *)self initWithPath:v4];

  return v5;
}

- (_bmFMDatabasePool)init
{
  return [(_bmFMDatabasePool *)self initWithPath:0];
}

+ (Class)databaseClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  self->_delegate = 0;
  lockQueue = self->_lockQueue;
  if (lockQueue)
  {
    self->_lockQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_bmFMDatabasePool;
  [(_bmFMDatabasePool *)&v4 dealloc];
}

- (void)executeLocked:(id)a3
{
}

- (void)pushDatabaseBackInPool:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44___bmFMDatabasePool_pushDatabaseBackInPool___block_invoke;
    v6[3] = &unk_1E617A2A0;
    v6[4] = self;
    id v7 = v4;
    [(_bmFMDatabasePool *)self executeLocked:v6];
  }
}

- (id)db
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23___bmFMDatabasePool_db__block_invoke;
  v4[3] = &unk_1E617A3A8;
  v4[4] = self;
  v4[5] = &v5;
  [(_bmFMDatabasePool *)self executeLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (unint64_t)countOfCheckedInDatabases
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___bmFMDatabasePool_countOfCheckedInDatabases__block_invoke;
  v4[3] = &unk_1E617A3A8;
  v4[4] = self;
  v4[5] = &v5;
  [(_bmFMDatabasePool *)self executeLocked:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)countOfCheckedOutDatabases
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___bmFMDatabasePool_countOfCheckedOutDatabases__block_invoke;
  v4[3] = &unk_1E617A3A8;
  v4[4] = self;
  v4[5] = &v5;
  [(_bmFMDatabasePool *)self executeLocked:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)countOfOpenDatabases
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41___bmFMDatabasePool_countOfOpenDatabases__block_invoke;
  v4[3] = &unk_1E617A3A8;
  v4[4] = self;
  v4[5] = &v5;
  [(_bmFMDatabasePool *)self executeLocked:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)releaseAllDatabases
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40___bmFMDatabasePool_releaseAllDatabases__block_invoke;
  v2[3] = &unk_1E617A278;
  v2[4] = self;
  [(_bmFMDatabasePool *)self executeLocked:v2];
}

- (void)inDatabase:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(_bmFMDatabasePool *)self db];
  v4[2](v4, v5);

  [(_bmFMDatabasePool *)self pushDatabaseBackInPool:v5];
}

- (void)beginTransaction:(int64_t)a3 withBlock:(id)a4
{
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  char v9 = 0;
  uint64_t v7 = [(_bmFMDatabasePool *)self db];
  uint64_t v8 = v7;
  switch(a3)
  {
    case 2:
      [v7 beginImmediateTransaction];
      break;
    case 1:
      [v7 beginDeferredTransaction];
      break;
    case 0:
      [v7 beginTransaction];
      break;
  }
  v6[2](v6, v8, &v9);
  if (v9) {
    [v8 rollback];
  }
  else {
    [v8 commit];
  }
  [(_bmFMDatabasePool *)self pushDatabaseBackInPool:v8];
}

- (void)inTransaction:(id)a3
{
}

- (void)inDeferredTransaction:(id)a3
{
}

- (void)inExclusiveTransaction:(id)a3
{
}

- (void)inImmediateTransaction:(id)a3
{
}

- (id)inSavePoint:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  id v5 = [NSString alloc];
  uint64_t v6 = inSavePoint__savePointIdx_0++;
  uint64_t v7 = objc_msgSend(v5, "initWithFormat:", @"savePoint%ld", v6);
  char v18 = 0;
  uint64_t v8 = [(_bmFMDatabasePool *)self db];
  id v17 = 0;
  int v9 = [v8 startSavePointWithName:v7 error:&v17];
  id v10 = v17;
  if (v9)
  {
    v4[2](v4, v8, &v18);
    if (v18)
    {
      id v16 = v10;
      [v8 rollbackToSavePointWithName:v7 error:&v16];
      id v11 = v16;

      id v10 = v11;
    }
    id v15 = v10;
    [v8 releaseSavePointWithName:v7 error:&v15];
    id v12 = v15;

    id v10 = v12;
  }
  [(_bmFMDatabasePool *)self pushDatabaseBackInPool:v8];
  id v13 = v10;

  return v13;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPath:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (unint64_t)maximumNumberOfDatabasesToCreate
{
  return self->_maximumNumberOfDatabasesToCreate;
}

- (void)setMaximumNumberOfDatabasesToCreate:(unint64_t)a3
{
  self->_maximumNumberOfDatabasesToCreate = a3;
}

- (int)openFlags
{
  return self->_openFlags;
}

- (NSString)vfsName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVfsName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfsName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_databaseOutPool, 0);
  objc_storeStrong((id *)&self->_databaseInPool, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
}

@end