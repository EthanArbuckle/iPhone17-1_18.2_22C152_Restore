@interface KGDegasAllInMemoryGraphStore
+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4;
+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)persistentStoreFileExtension;
- (BOOL)addEdges:(id)a3 error:(id *)a4;
- (BOOL)addNodes:(id)a3 error:(id *)a4;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5;
- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5;
- (KGDegasAllInMemoryGraphStore)initWithURL:(id)a3;
- (id)graphIdentifier;
- (id)url;
- (unint64_t)graphVersion;
- (void)close;
- (void)enumerateModelEdgesWithBlock:(id)a3;
- (void)enumerateModelNodesWithBlock:(id)a3;
- (void)setGraphVersion:(unint64_t)a3;
@end

@implementation KGDegasAllInMemoryGraphStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)url
{
  return self->_url;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDegasAllInMemoryGraphStore;
  if ([(KGMemoryGraphStore *)&v9 addEdges:v6 error:a4]) {
    BOOL v7 = [(KGDatabase *)self->_database addEdges:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDegasAllInMemoryGraphStore;
  if ([(KGMemoryGraphStore *)&v9 addNodes:v6 error:a4]) {
    BOOL v7 = [(KGDatabase *)self->_database addNodes:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(KGDatabase *)self->_database setEdgeProperties:v8 forIdentifier:a3 error:a5])
  {
    v11.receiver = self;
    v11.super_class = (Class)KGDegasAllInMemoryGraphStore;
    BOOL v9 = [(KGMemoryGraphStore *)&v11 updateEdgeForIdentifier:a3 withProperties:v8 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(KGDatabase *)self->_database setNodeProperties:v8 forIdentifier:a3 error:a5])
  {
    v11.receiver = self;
    v11.super_class = (Class)KGDegasAllInMemoryGraphStore;
    BOOL v9 = [(KGMemoryGraphStore *)&v11 updateNodeForIdentifier:a3 withProperties:v8 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)enumerateModelEdgesWithBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__KGDegasAllInMemoryGraphStore_enumerateModelEdgesWithBlock___block_invoke;
  v7[3] = &unk_1E68DBAA0;
  id v8 = v4;
  id v6 = v4;
  [(KGDatabase *)database enumerateEdgesWithIdentifiers:0 block:v7];
}

uint64_t __61__KGDegasAllInMemoryGraphStore_enumerateModelEdgesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateModelNodesWithBlock:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__KGDegasAllInMemoryGraphStore_enumerateModelNodesWithBlock___block_invoke;
  v7[3] = &unk_1E68DBA78;
  id v8 = v4;
  id v6 = v4;
  [(KGDatabase *)database enumerateNodesWithIdentifiers:0 block:v7];
}

uint64_t __61__KGDegasAllInMemoryGraphStore_enumerateModelNodesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  unint64_t v5 = self->_transactionCounter - 1;
  self->_transactionCounter = v5;
  if (v5)
  {
    id v6 = KGLoggingConnection();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_fault_impl(&dword_1D1654000, v6, OS_LOG_TYPE_FAULT, "graph database transaction rollback called at non-root level!", v8, 2u);
    }
  }
  return [(KGDatabase *)self->_database rollbackTransactionWithError:a3];
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  unint64_t v3 = self->_transactionCounter - 1;
  self->_transactionCounter = v3;
  return v3 || [(KGDatabase *)self->_database commitTransactionWithError:a3];
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  unint64_t transactionCounter = self->_transactionCounter;
  if (transactionCounter)
  {
    BOOL result = 1;
  }
  else
  {
    BOOL result = [(KGDatabase *)self->_database beginTransactionWithError:a3];
    unint64_t transactionCounter = self->_transactionCounter;
  }
  self->_unint64_t transactionCounter = transactionCounter + 1;
  return result;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  return [(KGDatabase *)self->_database copyToURL:a3 error:a4];
}

- (id)graphIdentifier
{
  return [(KGDatabase *)self->_database graphIdentifier];
}

- (void)setGraphVersion:(unint64_t)a3
{
}

- (unint64_t)graphVersion
{
  return [(KGDatabase *)self->_database graphVersion];
}

- (void)close
{
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [[KGDatabase alloc] initWithURL:self->_url];
  database = self->_database;
  self->_database = v7;

  BOOL v9 = [(KGDatabase *)self->_database openWithMode:a3 error:a4];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D25FA040]();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke;
    v19[3] = &unk_1E68DBA28;
    v19[4] = self;
    v19[5] = &buf;
    [(KGDegasAllInMemoryGraphStore *)self enumerateModelNodesWithBlock:v19];
    [(KGMemoryGraphStore *)self setNextNodeIdentifier:*(void *)(*((void *)&buf + 1) + 24) + 1];
    _Block_object_dispose(&buf, 8);
    objc_super v11 = (void *)MEMORY[0x1D25FA040]();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke_2;
    v18[3] = &unk_1E68DBA50;
    v18[4] = self;
    v18[5] = &buf;
    [(KGDegasAllInMemoryGraphStore *)self enumerateModelEdgesWithBlock:v18];
    [(KGMemoryGraphStore *)self setNextEdgeIdentifier:*(void *)(*((void *)&buf + 1) + 24) + 1];
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v12 = objc_opt_class();
    url = self->_url;
    id v20 = 0;
    char v14 = [v12 destroyAtURL:url error:&v20];
    id v15 = v20;
    if ((v14 & 1) == 0)
    {
      v16 = KGLoggingConnection();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_error_impl(&dword_1D1654000, v16, OS_LOG_TYPE_ERROR, "failed to open then failed to delete: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  return v9;
}

id __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 <= a2) {
    unint64_t v3 = a2;
  }
  *(void *)(v2 + 24) = v3;
  return (id)objc_msgSend(*(id *)(a1 + 32), "insertNodeWithIdentifier:labels:properties:error:");
}

id __51__KGDegasAllInMemoryGraphStore_openWithMode_error___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 <= a2) {
    unint64_t v3 = a2;
  }
  *(void *)(v2 + 24) = v3;
  return (id)objc_msgSend(*(id *)(a1 + 32), "insertEdgeWithIdentifier:labels:properties:sourceNodeIdentifier:targetNodeIdentifier:error:");
}

- (KGDegasAllInMemoryGraphStore)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDegasAllInMemoryGraphStore;
  id v6 = [(KGMemoryGraphStore *)&v9 initForSubclasses];
  BOOL v7 = (KGDegasAllInMemoryGraphStore *)v6;
  if (v6) {
    objc_storeStrong(v6 + 15, a3);
  }

  return v7;
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDatabase migrateFromURL:a3 toURL:a4 error:a5];
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  return +[KGDatabase destroyAtURL:a3 error:a4];
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDatabase copyFromURL:a3 toURL:a4 error:a5];
}

+ (id)persistentStoreFileExtension
{
  uint64_t v2 = @"kgdb";
  return @"kgdb";
}

@end