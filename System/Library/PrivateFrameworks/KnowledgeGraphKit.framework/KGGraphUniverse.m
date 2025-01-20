@interface KGGraphUniverse
+ (BOOL)hasManagerForGraphStoreAtURL:(id)a3;
+ (BOOL)swapDatabaseFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)instance;
+ (id)managerForGraphStoreAtURL:(id)a3 entityFactory:(id)a4;
+ (void)closeDatabaseAtURL:(id)a3 completion:(id)a4;
+ (void)initialize;
+ (void)releaseManagerForGraphStoreAtURL:(id)a3;
- (BOOL)hasManagerForGraphStoreAtURL:(id)a3;
- (BOOL)swapDatabaseFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (KGGraphUniverse)init;
- (NSMutableDictionary)graphManagerByURL;
- (id)managerForGraphStoreAtURL:(id)a3 entityFactory:(id)a4;
- (void)closeDatabaseAtURL:(id)a3 completion:(id)a4;
- (void)releaseManagerForGraphStoreAtURL:(id)a3;
- (void)removeDatabaseByURL:(id)a3;
- (void)setGraphManagerByURL:(id)a3;
@end

@implementation KGGraphUniverse

- (void).cxx_destruct
{
}

- (void)setGraphManagerByURL:(id)a3
{
}

- (NSMutableDictionary)graphManagerByURL
{
  return self->_graphManagerByURL;
}

- (void)closeDatabaseAtURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(KGGraphUniverse *)self managerForGraphStoreAtURL:v7 entityFactory:0];
  [v8 asyncClose:v6];

  [(KGGraphUniverse *)self removeDatabaseByURL:v7];
}

- (void)removeDatabaseByURL:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_graphManagerByURL removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)swapDatabaseFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqual:v9])
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(KGGraphUniverse *)self managerForGraphStoreAtURL:v8 entityFactory:0];
    v12 = [(KGGraphUniverse *)self managerForGraphStoreAtURL:v9 entityFactory:0];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1491;
    v24 = __Block_byref_object_dispose__1492;
    id v25 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__KGGraphUniverse_swapDatabaseFromURL_toURL_error___block_invoke;
    v16[3] = &unk_1E68DB3D0;
    v18 = &v26;
    id v13 = v12;
    id v17 = v13;
    v19 = &v20;
    [v11 performReadBlock:v16];
    int v14 = *((unsigned __int8 *)v27 + 24);
    if (a5 && !*((unsigned char *)v27 + 24))
    {
      *a5 = (id) v21[5];
      int v14 = *((unsigned __int8 *)v27 + 24);
    }
    BOOL v10 = v14 != 0;

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  return v10;
}

BOOL __51__KGGraphUniverse_swapDatabaseFromURL_toURL_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = (void *)a1[4];
    id v12 = 0;
    char v8 = [v7 replaceFromGraph:v5 error:&v12];
    id v9 = v12;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v8;
  }
  else if (v6)
  {
    id v9 = v6;
  }
  else
  {
    id v9 = 0;
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v9);
    BOOL v10 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24) != 0;
  }

  return v10;
}

- (BOOL)hasManagerForGraphStoreAtURL:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_graphManagerByURL objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  return v6 != 0;
}

- (void)releaseManagerForGraphStoreAtURL:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_graphManagerByURL objectForKeyedSubscript:v7];
  id v5 = v4;
  if (v4 && [v4 decrementUseCount])
  {
    id v6 = [v5 graphManager];
    [v6 close];

    [(NSMutableDictionary *)self->_graphManagerByURL removeObjectForKey:v7];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)managerForGraphStoreAtURL:(id)a3 entityFactory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  char v8 = [(NSMutableDictionary *)self->_graphManagerByURL objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = v8;
    [(KGGraphManagerRecord *)v8 incrementUseCount];
    if (!v7) {
      goto LABEL_6;
    }
    BOOL v10 = [(KGGraphManagerRecord *)v9 graphManager];
    [(KGGraphManager *)v10 setEntityFactory:v7];
  }
  else
  {
    BOOL v10 = [[KGGraphManager alloc] initWithURL:v6 entityFactory:v7];
    id v9 = [[KGGraphManagerRecord alloc] initWithGraphManager:v10];
    [(NSMutableDictionary *)self->_graphManagerByURL setObject:v9 forKeyedSubscript:v6];
  }

LABEL_6:
  os_unfair_lock_unlock(&self->_lock);
  v11 = [(KGGraphManagerRecord *)v9 graphManager];

  return v11;
}

- (KGGraphUniverse)init
{
  v6.receiver = self;
  v6.super_class = (Class)KGGraphUniverse;
  v2 = [(KGGraphUniverse *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    graphManagerByURL = v2->_graphManagerByURL;
    v2->_graphManagerByURL = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (void)closeDatabaseAtURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 instance];
  [v8 closeDatabaseAtURL:v7 completion:v6];
}

+ (BOOL)swapDatabaseFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [a1 instance];
  LOBYTE(a5) = [v10 swapDatabaseFromURL:v9 toURL:v8 error:a5];

  return (char)a5;
}

+ (BOOL)hasManagerForGraphStoreAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 instance];
  char v6 = [v5 hasManagerForGraphStoreAtURL:v4];

  return v6;
}

+ (void)releaseManagerForGraphStoreAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [a1 instance];
  [v5 releaseManagerForGraphStoreAtURL:v4];
}

+ (id)managerForGraphStoreAtURL:(id)a3 entityFactory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 instance];
  id v9 = [v8 managerForGraphStoreAtURL:v7 entityFactory:v6];

  return v9;
}

+ (id)instance
{
  return (id)_sInstance;
}

+ (void)initialize
{
  _sInstance = objc_alloc_init(KGGraphUniverse);
  MEMORY[0x1F41817F8]();
}

@end