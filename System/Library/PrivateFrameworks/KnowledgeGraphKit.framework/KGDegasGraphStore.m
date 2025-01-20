@interface KGDegasGraphStore
+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4;
+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (NSString)persistentStoreFileExtension;
- (BOOL)_lock_enumerateEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)_lock_filterEdgesWithOptionalLabels:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6;
- (BOOL)_lock_filterEdgesWithProperties:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6;
- (BOOL)_lock_filterEdgesWithRequiredLabels:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6;
- (BOOL)_lock_filterNodesWithOptionalLabels:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6;
- (BOOL)_lock_filterNodesWithProperties:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6;
- (BOOL)_lock_filterNodesWithRequiredLabels:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6;
- (BOOL)addEdges:(id)a3 error:(id *)a4;
- (BOOL)addNodes:(id)a3 error:(id *)a4;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)isReadOnly;
- (BOOL)noFatalError;
- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeEdgeForIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeEdgesForIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)removeNodeForIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeNodesForIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5;
- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5;
- (KGDatabase)database;
- (KGDegasGraphStore)initWithURL:(id)a3;
- (NSURL)url;
- (NSUUID)graphIdentifier;
- (id)_lock_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5;
- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6;
- (id)_lock_graphIdentifier;
- (id)_lock_neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)_lock_nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)_lock_nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5;
- (id)_lock_nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)_lock_sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4;
- (id)_lock_targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4;
- (id)_resolvedPropertyValue:(id)a3 isScalar:(BOOL *)a4;
- (id)arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5;
- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)edgeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)edgeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)edgeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)edgeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)edgeIdentifiersBetween:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6 error:(id *)a7;
- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 withLabels:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6;
- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5;
- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6;
- (id)edgeLabels;
- (id)labelsOfEdgesForIdentifiers:(id)a3;
- (id)labelsOfNodesForIdentifiers:(id)a3;
- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6;
- (id)nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)nodeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)nodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)nodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)nodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5;
- (id)nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)nodeLabels;
- (id)orderedArrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)orderedArrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)propertiesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5;
- (id)propertiesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5;
- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4;
- (id)targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4;
- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (int64_t)transactionCounter;
- (os_unfair_lock_s)lock;
- (unint64_t)graphVersion;
- (void)_lock_enumerateNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 block:(id)a5;
- (void)close;
- (void)enableInTransactionCheck;
- (void)setGraphVersion:(unint64_t)a3;
- (void)setTransactionCounter:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation KGDegasGraphStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setTransactionCounter:(int64_t)a3
{
  self->_transactionCounter = a3;
}

- (int64_t)transactionCounter
{
  return self->_transactionCounter;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (KGDatabase)database
{
  return self->_database;
}

- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10 = a5;
  p_lock = &self->_lock;
  id v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  uint64_t v13 = [v12 transactionSequenceNumber];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v10 setIncludeTombstones:1];
  v15 = [(KGDegasGraphStore *)self edgeIdentifiersMatchingFilter:v10 intersectingIdentifiers:0 error:a6];
  if (v15)
  {
    [v10 setIncludeTombstones:0];
    database = self->_database;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__KGDegasGraphStore_edgeChangesAfterToken_transactionLimit_edgeFilter_error___block_invoke;
    v20[3] = &unk_1E68DACA0;
    v20[4] = self;
    id v21 = v15;
    id v17 = v14;
    id v22 = v17;
    [(KGDatabase *)database transactionChangesAfterTransactionId:v13 limit:a4 block:v20];
    os_unfair_lock_unlock(p_lock);
    id v18 = v17;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v18 = 0;
  }

  return v18;
}

void __77__KGDegasGraphStore_edgeChangesAfterToken_transactionLimit_edgeFilter_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8)
{
  id v12 = a8;
  id v13 = a6;
  id v14 = a4;
  v15 = [KGTransactionToken alloc];
  v16 = objc_msgSend(*(id *)(a1 + 32), "_lock_graphIdentifier");
  id v21 = [(KGTransactionToken *)v15 initForGraphIdentifier:v16 transactionSequence:a2];

  id v17 = [v14 identifierSetByIntersectingIdentifierSet:*(void *)(a1 + 40)];

  id v18 = [v13 identifierSetByIntersectingIdentifierSet:*(void *)(a1 + 40)];

  v19 = [v12 identifierSetByIntersectingIdentifierSet:*(void *)(a1 + 40)];

  v20 = [[KGGraphChange alloc] initWithTransactionToken:v21 edgesInserted:v17 edgesUpdated:v18 edgesDeleted:v19];
  [*(id *)(a1 + 48) addObject:v20];
}

- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6
{
  id v10 = a5;
  p_lock = &self->_lock;
  id v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  uint64_t v13 = [v12 transactionSequenceNumber];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v10 setIncludeTombstones:1];
  v15 = [(KGDegasGraphStore *)self nodeIdentifiersMatchingFilter:v10 intersectingIdentifiers:0 error:a6];
  if (v15)
  {
    [v10 setIncludeTombstones:0];
    database = self->_database;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__KGDegasGraphStore_nodeChangesAfterToken_transactionLimit_nodeFilter_error___block_invoke;
    v20[3] = &unk_1E68DACA0;
    v20[4] = self;
    id v21 = v15;
    id v17 = v14;
    id v22 = v17;
    [(KGDatabase *)database transactionChangesAfterTransactionId:v13 limit:a4 block:v20];
    os_unfair_lock_unlock(p_lock);
    id v18 = v17;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v18 = 0;
  }

  return v18;
}

void __77__KGDegasGraphStore_nodeChangesAfterToken_transactionLimit_nodeFilter_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = [KGTransactionToken alloc];
  v15 = objc_msgSend(*(id *)(a1 + 32), "_lock_graphIdentifier");
  id v20 = [(KGTransactionToken *)v14 initForGraphIdentifier:v15 transactionSequence:a2];

  v16 = [v13 identifierSetByIntersectingIdentifierSet:*(void *)(a1 + 40)];

  id v17 = [v12 identifierSetByIntersectingIdentifierSet:*(void *)(a1 + 40)];

  id v18 = [v11 identifierSetByIntersectingIdentifierSet:*(void *)(a1 + 40)];

  v19 = [[KGGraphChange alloc] initWithTransactionToken:v20 nodesInserted:v16 nodesUpdated:v17 nodesDeleted:v18];
  [*(id *)(a1 + 48) addObject:v19];
}

- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  uint64_t v9 = [v8 transactionSequenceNumber];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  database = self->_database;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__KGDegasGraphStore_changesAfterToken_transactionLimit_error___block_invoke;
  v16[3] = &unk_1E68DAC78;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  [(KGDatabase *)database transactionChangesAfterTransactionId:v9 limit:a4 block:v16];
  os_unfair_lock_unlock(p_lock);
  id v13 = v17;
  id v14 = v12;

  return v14;
}

void __62__KGDegasGraphStore_changesAfterToken_transactionLimit_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [KGTransactionToken alloc];
  id v22 = objc_msgSend(*(id *)(a1 + 32), "_lock_graphIdentifier");
  id v24 = [(KGTransactionToken *)v21 initForGraphIdentifier:v22 transactionSequence:a2];

  v23 = [[KGGraphChange alloc] initWithTransactionToken:v24 nodesInserted:v20 edgesInserted:v19 nodesUpdated:v18 edgesUpdated:v17 nodesDeleted:v16 edgesDeleted:v15];
  [*(id *)(a1 + 40) addObject:v23];
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database copyToURL:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (void)close
{
  [(KGDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  if (self->_url)
  {
    id v7 = [[KGDatabase alloc] initWithURL:self->_url];
    database = self->_database;
    self->_database = v7;

    if (a3) {
      char v9 = a3;
    }
    else {
      char v9 = 6;
    }
    if (v9) {
      self->_isReadOnly = 1;
    }
    if (-[KGDatabase openWithMode:error:](self->_database, "openWithMode:error:")) {
      return 1;
    }
    id v12 = self->_database;
    self->_database = 0;
  }
  else if (a4)
  {
    kg_errorWithCode(5004);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a4 = v11;
    return result;
  }
  return 0;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v6 = self->_transactionCounter - 1;
  self->_transactionCounter = v6;
  if (v6)
  {
    id v7 = KGLoggingConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_fault_impl(&dword_1D1654000, v7, OS_LOG_TYPE_FAULT, "graph database transaction rollback called at non-root level!", v10, 2u);
    }
  }
  BOOL v8 = [(KGDatabase *)self->_database rollbackTransactionWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t transactionCounter = self->_transactionCounter;
  self->_int64_t transactionCounter = transactionCounter - 1;
  if (transactionCounter <= 0) {
    __assert_rtn("-[KGDegasGraphStore commitTransactionWithError:]", "KGDegasGraphStore.m", 1349, "_transactionCounter >= 0");
  }
  BOOL v7 = transactionCounter != 1
    || [(KGDatabase *)self->_database commitTransactionWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t transactionCounter = self->_transactionCounter;
  if (transactionCounter)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = [(KGDatabase *)self->_database beginTransactionWithError:a3];
    int64_t transactionCounter = self->_transactionCounter;
  }
  self->_int64_t transactionCounter = transactionCounter + 1;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  BOOL v10 = [(KGDatabase *)self->_database setEdgeProperties:v9 forIdentifier:a3 error:a5];

  if (!v10)
  {
    id v11 = KGLoggingConnection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a5;
      int v14 = 138412290;
      id v15 = v13;
      _os_log_error_impl(&dword_1D1654000, v11, OS_LOG_TYPE_ERROR, "edge update failed: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  BOOL v10 = [(KGDatabase *)self->_database setNodeProperties:v9 forIdentifier:a3 error:a5];

  if (!v10)
  {
    id v11 = KGLoggingConnection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a5;
      int v14 = 138412290;
      id v15 = v13;
      _os_log_error_impl(&dword_1D1654000, v11, OS_LOG_TYPE_ERROR, "node update failed: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)removeEdgesForIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database removeEdges:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeNodesForIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database removeNodes:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeEdgeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database removeEdge:a3 error:a4];
  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeNodeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database removeNode:a3 error:a4];
  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  int64_t v6 = [(KGDatabase *)self->_database labelsOfEdgesForIdentifiers:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  int64_t v6 = [(KGDatabase *)self->_database labelsOfNodesForIdentifiers:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)edgeLabels
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v4 = [(KGDatabase *)self->_database edgeLabels];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)nodeLabels
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v4 = [(KGDatabase *)self->_database nodeLabels];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)propertiesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v8 = a4;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  BOOL v10 = objc_alloc_init(KGMutablePropertyValueArray);
  database = self->_database;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__KGDegasGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke;
  v14[3] = &unk_1E68DAC50;
  id v12 = v10;
  id v15 = v12;
  [(KGDatabase *)database enumeratePropertyValuesForEdgesWithIdentifiers:v9 propertyName:v8 withBlock:v14];

  os_unfair_lock_unlock(p_lock);
  return v12;
}

uint64_t __74__KGDegasGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendValue:a3 forIdentifier:a2];
}

- (id)propertiesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v8 = a4;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  BOOL v10 = objc_alloc_init(KGMutablePropertyValueArray);
  database = self->_database;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__KGDegasGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke;
  v14[3] = &unk_1E68DAC50;
  id v12 = v10;
  id v15 = v12;
  [(KGDatabase *)database enumeratePropertyValuesForNodesWithIdentifiers:v9 propertyName:v8 withBlock:v14];

  os_unfair_lock_unlock(p_lock);
  return v12;
}

uint64_t __74__KGDegasGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendValue:a3 forIdentifier:a2];
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = [(KGDegasGraphStore *)self _lock_sourcesByTargetWithEdgeIdentifiers:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = [(KGDegasGraphStore *)self _lock_targetsBySourceWithEdgeIdentifiers:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)_lock_sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  database = self->_database;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__KGDegasGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke;
  v22[3] = &unk_1E68DAC28;
  id v8 = v6;
  id v23 = v8;
  [(KGDatabase *)database enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:v5 block:v22];
  id v9 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v18);
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v9, "setTargets:forSource:", v16, [v15 unsignedIntegerValue]);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v12);
  }

  return v9;
}

void __68__KGDegasGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v6 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v6 = objc_alloc_init(KGMutableElementIdentifierSet);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  [(KGMutableElementIdentifierSet *)v6 addIdentifier:a3];
}

- (id)_lock_targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  database = self->_database;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__KGDegasGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke;
  v22[3] = &unk_1E68DAC28;
  id v8 = v6;
  id v23 = v8;
  [(KGDatabase *)database enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:v5 block:v22];
  id v9 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v18);
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v9, "setTargets:forSource:", v16, [v15 unsignedIntegerValue]);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v12);
  }

  return v9;
}

void __68__KGDegasGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v6 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v6 = objc_alloc_init(KGMutableElementIdentifierSet);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  [(KGMutableElementIdentifierSet *)v6 addIdentifier:a4];
}

- (id)edgeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database edgeIdentifiersSortedByPropertyForName:v13 dataType:2 ascending:v9 limit:a6 edgeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)edgeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database edgeIdentifiersSortedByPropertyForName:v13 dataType:1 ascending:v9 limit:a6 edgeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)edgeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database edgeIdentifiersSortedByPropertyForName:v13 dataType:3 ascending:v9 limit:a6 edgeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database nodeIdentifiersSortedByPropertyForName:v13 dataType:4 ascending:v9 limit:a6 nodeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database nodeIdentifiersSortedByPropertyForName:v13 dataType:2 ascending:v9 limit:a6 nodeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database nodeIdentifiersSortedByPropertyForName:v13 dataType:1 ascending:v9 limit:a6 nodeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  p_lock = &self->_lock;
  id v13 = a4;
  id v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v15 = [(KGDatabase *)self->_database nodeIdentifiersSortedByPropertyForName:v13 dataType:3 ascending:v9 limit:a6 nodeIdentifiers:v14 error:a7];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = [(KGDegasGraphStore *)self _lock_nodeIdentifiersOfEdgesWithIdentifiers:v9 edgeDirection:a4 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (![v8 count])
  {
    id v10 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_14;
  }
  id v9 = objc_alloc_init(KGMutableElementIdentifierSet);
  if (v6)
  {
    BOOL v11 = [(KGDatabase *)self->_database appendNodeIdentifiersOfEdgesWithIdentifiers:v8 sourceNodeIdentifiers:0 targetNodeIdentifiers:v9 error:a5];
    if ((v6 & 2) != 0)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else if (v11)
    {
LABEL_11:
      id v10 = v9;
      goto LABEL_13;
    }
    id v10 = 0;
    goto LABEL_13;
  }
  if ((v6 & 2) == 0) {
    goto LABEL_11;
  }
LABEL_10:
  BOOL v12 = [(KGDatabase *)self->_database appendNodeIdentifiersOfEdgesWithIdentifiers:v8 sourceNodeIdentifiers:v9 targetNodeIdentifiers:0 error:a5];
  id v10 = 0;
  if (v12) {
    goto LABEL_11;
  }
LABEL_13:

LABEL_14:
  return v10;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if ([v10 count])
  {
    os_unfair_lock_lock(&self->_lock);
    CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
    BOOL v12 = [(KGDatabase *)self->_database transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:v10 edgeDirection:a4 edgeFilter:v11 error:a6];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL v12 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v12;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  p_lock = &self->_lock;
  id v11 = a5;
  id v12 = a3;
  os_unfair_lock_lock(p_lock);
  id v13 = [(KGDegasGraphStore *)self _lock_neighborNodeIdentifiersWithStartNodeIdentifiers:v12 edgeDirection:a4 edgeFilter:v11 error:a6];

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (id)_lock_neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ([v10 count])
  {
    id v12 = [(KGDatabase *)self->_database neighborNodeIdentifiersWithStartNodeIdentifiers:v10 edgeDirection:a4 edgeFilter:v11 error:a6];
  }
  else
  {
    id v12 = objc_alloc_init(KGElementIdentifierSet);
  }
  id v13 = v12;

  return v13;
}

- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 withLabels:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  p_lock = &self->_lock;
  id v11 = a4;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v12 = [(KGDatabase *)self->_database edgeIdentifiersWithLabels:v11 direction:a5 forNodeIdentifier:a3 error:a6];

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)edgeIdentifiersBetween:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6 error:(id *)a7
{
  char v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ((v8 & 2) != 0)
  {
    id v15 = [(KGDatabase *)self->_database filterEdgeIdentifiersBetween:v12 targetNodeIdentifiers:v13 filterEdgeIdentifiers:0 error:a7];
    if (!v15)
    {
      os_unfair_lock_unlock(&self->_lock);
LABEL_13:
      long long v19 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    id v15 = 0;
  }
  if ((v8 & 1) == 0)
  {
    id v16 = 0;
    if (!v15) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  id v17 = [(KGDatabase *)self->_database filterEdgeIdentifiersBetween:v13 targetNodeIdentifiers:v12 filterEdgeIdentifiers:0 error:a7];
  if (!v17)
  {
    os_unfair_lock_unlock(&self->_lock);

    goto LABEL_13;
  }
  id v16 = v17;
  if (!v15)
  {
    id v16 = v17;
    id v15 = v16;
    goto LABEL_15;
  }
  uint64_t v18 = [v15 identifierSetByFormingUnion:v17];

  id v15 = (void *)v18;
  if (v18)
  {
LABEL_15:
    long long v19 = [(KGDegasGraphStore *)self _lock_edgeIdentifiersMatchingFilter:v14 intersectingIdentifiers:v15 error:a7];
    goto LABEL_16;
  }
LABEL_10:
  long long v19 = 0;
LABEL_16:
  os_unfair_lock_unlock(&self->_lock);

LABEL_17:
  return v19;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  p_lock = &self->_lock;
  id v11 = a4;
  id v12 = a3;
  os_unfair_lock_lock(p_lock);
  id v13 = [(KGDegasGraphStore *)self _lock_edgeIdentifiersWithStartNodeIdentifiers:v12 intersectingEdgeIdentifiers:v11 edgeDirection:a5 error:a6];

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  id v10 = a3;
  id v11 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v12 = objc_alloc_init(KGElementIdentifierSet);
  id v13 = objc_alloc_init(KGElementIdentifierSet);
  id v14 = v11;
  id v15 = v14;
  if ((v7 & 1) == 0)
  {
    id v16 = v14;
    if ((v7 & 2) != 0) {
      goto LABEL_10;
    }
LABEL_7:
    id v16 = v15;
    goto LABEL_12;
  }
  id v17 = [(KGDatabase *)self->_database filterInEdgeIdentifiersOfNodesWithIdentifiers:v10 filterEdgeIdentifiers:v14 error:a6];

  if (!v17)
  {
    uint64_t v18 = 0;
    id v12 = 0;
    id v16 = v15;
    goto LABEL_18;
  }
  if ((v7 & 2) == 0)
  {
    id v12 = v17;
    goto LABEL_7;
  }
  id v16 = [(KGElementIdentifierSet *)v17 identifierSetByIntersectingIdentifierSet:v15];

  id v12 = v17;
LABEL_10:
  uint64_t v18 = [(KGDatabase *)self->_database filterOutEdgeIdentifiersOfNodesWithIdentifiers:v10 filterEdgeIdentifiers:v16 error:a6];

  if (!v18)
  {
    id v13 = 0;
    goto LABEL_18;
  }
  id v13 = v18;
LABEL_12:
  if ([(KGElementIdentifierSet *)v12 isEmpty])
  {
    uint64_t v18 = v13;
    id v13 = v18;
  }
  else if ([(KGElementIdentifierSet *)v13 isEmpty])
  {
    uint64_t v18 = v12;
    id v12 = v18;
  }
  else
  {
    uint64_t v18 = [(KGElementIdentifierSet *)v12 identifierSetByFormingUnion:v13];
  }
LABEL_18:

  return v18;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = [(KGDegasGraphStore *)self _lock_edgeIdentifiersWithStartNodeIdentifiers:v9 edgeDirection:a4 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v9 = objc_alloc_init(KGElementIdentifierSet);
  id v10 = objc_alloc_init(KGElementIdentifierSet);
  if ((v6 & 1) != 0
    && ([(KGDatabase *)self->_database inEdgeIdentifiersOfNodesWithIdentifiers:v8 error:a5], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v9, (v9 = (KGElementIdentifierSet *)v11) == 0))
  {
    id v12 = 0;
  }
  else if ((v6 & 2) == 0 {
         || ([(KGDatabase *)self->_database outEdgeIdentifiersOfNodesWithIdentifiers:v8 error:a5], v12 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue(), v10, (id v10 = v12) != 0))
  }
  {
    if ([(KGElementIdentifierSet *)v9 isEmpty])
    {
      id v12 = v10;
      id v10 = v12;
    }
    else if ([(KGElementIdentifierSet *)v10 isEmpty])
    {
      id v12 = v9;
      id v9 = v12;
    }
    else
    {
      id v12 = [(KGElementIdentifierSet *)v9 identifierSetByFormingUnion:v10];
    }
  }

  return v12;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v11 = [(KGDegasGraphStore *)self _lock_edgeIdentifiersMatchingFilter:v10 intersectingIdentifiers:v9 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v10 = v9;
  id v29 = v10;
  uint64_t v11 = (void *)MEMORY[0x1D25FA040]();
  if ([v8 noLabelsOrProperties])
  {
    if (v10)
    {
      id v12 = 0;
LABEL_9:

      id v12 = 0;
      goto LABEL_13;
    }
    database = self->_database;
    id v28 = 0;
    long long v21 = [(KGDatabase *)database allEdgesWithError:&v28];
    id v12 = v28;
    id v29 = v21;
    if (v21) {
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = [v8 requiredLabels];
    id v27 = 0;
    BOOL v14 = -[KGDegasGraphStore _lock_filterEdgesWithRequiredLabels:includeTombstones:edgeIdentifiers:error:](self, "_lock_filterEdgesWithRequiredLabels:includeTombstones:edgeIdentifiers:error:", v13, [v8 includeTombstones], &v29, &v27);
    id v12 = v27;

    if (v14)
    {
      id v15 = [v8 optionalLabels];
      id v26 = v12;
      BOOL v16 = -[KGDegasGraphStore _lock_filterEdgesWithOptionalLabels:includeTombstones:edgeIdentifiers:error:](self, "_lock_filterEdgesWithOptionalLabels:includeTombstones:edgeIdentifiers:error:", v15, [v8 includeTombstones], &v29, &v26);
      id v17 = v26;

      if (v16)
      {
        uint64_t v18 = [v8 properties];
        id v25 = v17;
        BOOL v19 = -[KGDegasGraphStore _lock_filterEdgesWithProperties:includeTombstones:edgeIdentifiers:error:](self, "_lock_filterEdgesWithProperties:includeTombstones:edgeIdentifiers:error:", v18, [v8 includeTombstones], &v29, &v25);
        id v12 = v25;

        if (v19) {
          goto LABEL_9;
        }
      }
      else
      {
        id v12 = v17;
      }
    }
  }
  id v22 = v29;
  id v29 = 0;

  if (a5)
  {
    id v12 = v12;
    *a5 = v12;
  }
LABEL_13:
  id v23 = v29;

  return v23;
}

- (BOOL)_lock_filterEdgesWithProperties:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6
{
  BOOL v44 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v9 count])
  {
    id v10 = (id *)*a5;
    uint64_t v11 = v10;
    if (v10 && ([v10 isEmpty] & 1) != 0)
    {
      LOBYTE(a5) = 1;
LABEL_44:

      goto LABEL_45;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v9;
    uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v43)
    {
LABEL_40:

      if (v11)
      {
        uint64_t v11 = v11;
        id obj = *a5;
        *a5 = v11;
        LOBYTE(a5) = 1;
LABEL_42:
      }
      else
      {
        LOBYTE(a5) = 0;
      }
      goto LABEL_44;
    }
    uint64_t v12 = *(void *)v48;
    uint64_t v41 = *(void *)v48;
    v42 = a6;
    v39 = a5;
    id v40 = v9;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v48 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * v13);
      id v15 = [obj objectForKeyedSubscript:v14];
      char v46 = 1;
      BOOL v16 = [(KGDegasGraphStore *)self _resolvedPropertyValue:v15 isScalar:&v46];

      if (!v16)
      {
        v34 = objc_alloc_init(KGMutableElementIdentifierSet);
        id v35 = *v39;
        id *v39 = v34;

        LOBYTE(a5) = 1;
LABEL_38:
        id v9 = v40;
        goto LABEL_42;
      }
      if (!v46) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        database = self->_database;
        BOOL v19 = [v17 value];
        -[KGDatabase filterEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:](database, "filterEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:", v14, v19, [v17 comparator], v11, a6);
        long long v21 = v20 = a6;

        if (v44)
        {
          id v22 = self->_database;
          id v23 = [v17 value];
          -[KGDatabase filterTombstoneEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:](v22, "filterTombstoneEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:", v14, v23, [v17 comparator], v11, v20);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          a5 = [(KGDatabase *)self->_database filterEdgeIdentifiersForPropertyName:v14 value:v16 comparator:1 edgeIdentifiers:v11 error:a6];
          if (!v44) {
            goto LABEL_27;
          }
          uint64_t v24 = [(KGDatabase *)self->_database filterTombstoneEdgeIdentifiersForPropertyName:v14 value:v16 comparator:1 edgeIdentifiers:v11 error:a6];
          goto LABEL_24;
        }
        id v17 = v16;
        id v25 = self->_database;
        id v26 = [v17 value1];
        id v27 = [v17 value2];
        -[KGDatabase filterEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:](v25, "filterEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:", v14, v26, v27, [v17 comparator], v11, a6);
        long long v21 = v28 = a6;

        if (v44)
        {
          v38 = self->_database;
          id v29 = [v17 value1];
          v30 = [v17 value2];
          -[KGDatabase filterTombstoneEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:](v38, "filterTombstoneEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:", v14, v29, v30, [v17 comparator], v11, v28);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_20:
          uint64_t v31 = [v21 identifierSetByFormingUnion:a5];

          long long v21 = (void *)v31;
          uint64_t v12 = v41;
LABEL_25:

          goto LABEL_26;
        }
      }
      uint64_t v12 = v41;
LABEL_26:

      a5 = (id *)v21;
      a6 = v42;
LABEL_27:
      if (!a5)
      {
        id v36 = *v39;
        id *v39 = 0;

        goto LABEL_38;
      }
      if (v11)
      {
        uint64_t v32 = [v11 identifierSetByIntersectingIdentifierSet:a5];

        uint64_t v11 = (id *)v32;
      }
      else
      {
        uint64_t v11 = a5;
      }
      char v33 = [v11 isEmpty];

      if (v33)
      {
        a5 = v39;
        id v9 = v40;
        goto LABEL_40;
      }
      if (v43 == ++v13)
      {
        a5 = v39;
        id v9 = v40;
        uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v43) {
          goto LABEL_7;
        }
        goto LABEL_40;
      }
    }
    a5 = [(KGDatabase *)self->_database filterEdgeIdentifiersForPropertyName:v14 values:v16 comparator:1 edgeIdentifiers:v11 error:a6];
    if (!v44) {
      goto LABEL_27;
    }
    uint64_t v24 = [(KGDatabase *)self->_database filterTombstoneEdgeIdentifiersForPropertyName:v14 values:v16 comparator:1 edgeIdentifiers:v11 error:a6];
LABEL_24:
    id v17 = (id)v24;
    long long v21 = [a5 identifierSetByFormingUnion:v24];
    goto LABEL_25;
  }
  LOBYTE(a5) = 1;
LABEL_45:

  return (char)a5;
}

- (BOOL)_lock_filterEdgesWithOptionalLabels:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ([v10 count])
  {
    id v11 = *a5;
    uint64_t v12 = v11;
    if (v11 && ![v11 count])
    {
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v13 = [(KGDatabase *)self->_database unionOfEdgesWithLabels:v10 filterEdgeIdentifiers:v12 error:a6];
      if (v8)
      {
        uint64_t v14 = [(KGDatabase *)self->_database unionOfTombstoneEdgesWithLabels:v10 filterEdgeIdentifiers:v12 error:a6];
        uint64_t v15 = [v13 identifierSetByFormingUnion:v14];

        uint64_t v13 = (void *)v15;
      }
      BOOL v16 = v13 != 0;
      if (v13) {
        objc_storeStrong(a5, v13);
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)_lock_filterEdgesWithRequiredLabels:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ([v10 count])
  {
    id v11 = *a5;
    uint64_t v12 = v11;
    if (v11 && ![v11 count])
    {
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v13 = [(KGDatabase *)self->_database intersectionOfEdgesWithLabels:v10 filterEdgeIdentifiers:v12 error:a6];
      if (v8)
      {
        uint64_t v14 = [(KGDatabase *)self->_database intersectionOfTombstoneEdgesWithLabels:v10 filterEdgeIdentifiers:v12 error:a6];
        uint64_t v15 = [v13 identifierSetByFormingUnion:v14];

        uint64_t v13 = (void *)v15;
      }
      BOOL v16 = v13 != 0;
      if (v13) {
        objc_storeStrong(a5, v13);
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  id v11 = [(KGDegasGraphStore *)self _lock_nodeIdentifiersMatchingFilter:v10 intersectingIdentifiers:v9 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v10 = v9;
  id v47 = v10;
  id v11 = (void *)MEMORY[0x1D25FA040]();
  if (![v8 whereNoInAndOutEdges])
  {
    if ([v8 whereNoInEdges])
    {
      database = self->_database;
      id v45 = 0;
      id v17 = [(KGDatabase *)database nodeIdentifiersWhereNoInEdgesWithError:&v45];
      id v14 = v45;
      if (v17)
      {
        if (v10)
        {
          id v18 = [v10 identifierSetByIntersectingIdentifierSet:v17];
          id v47 = v18;
        }
        else
        {
          id v18 = v17;
          id v47 = v18;
        }

        if (([v8 whereNoOutEdges] & 1) == 0)
        {
          id v15 = v18;
          goto LABEL_26;
        }
        int v19 = 1;
        goto LABEL_20;
      }
      if (([v8 whereNoOutEdges] & 1) == 0) {
        goto LABEL_37;
      }
      int v19 = 0;
    }
    else
    {
      id v14 = 0;
      if (![v8 whereNoOutEdges])
      {
        id v15 = v10;
        goto LABEL_26;
      }
      int v19 = 1;
    }
    id v18 = v10;
LABEL_20:
    long long v20 = v14;
    long long v21 = self->_database;
    id v44 = v14;
    id v15 = [(KGDatabase *)v21 nodeIdentifiersWhereNoOutEdgesWithError:&v44];
    id v14 = v44;

    if (!v15) {
      goto LABEL_37;
    }
    if (v18)
    {
      id v22 = [v18 identifierSetByIntersectingIdentifierSet:v15];
      id v23 = v47;
      id v47 = v22;

      id v15 = v22;
      if (!v19) {
        goto LABEL_37;
      }
    }
    else
    {
      id v47 = v15;
      if ((v19 & 1) == 0) {
        goto LABEL_37;
      }
    }
    goto LABEL_26;
  }
  uint64_t v12 = self->_database;
  id v46 = 0;
  uint64_t v13 = [(KGDatabase *)v12 nodeIdentifiersWhereNoEdgesWithError:&v46];
  id v14 = v46;
  if (!v13) {
    goto LABEL_37;
  }
  if (v10)
  {
    id v15 = [v10 identifierSetByIntersectingIdentifierSet:v13];
    id v47 = v15;
  }
  else
  {
    id v15 = v13;
    id v47 = v15;
  }

LABEL_26:
  if (![v8 noLabelsOrProperties])
  {
    id v25 = [v8 requiredLabels];
    id v42 = v14;
    BOOL v26 = -[KGDegasGraphStore _lock_filterNodesWithRequiredLabels:includeTombstones:nodeIdentifiers:error:](self, "_lock_filterNodesWithRequiredLabels:includeTombstones:nodeIdentifiers:error:", v25, [v8 includeTombstones], &v47, &v42);
    id v27 = v42;

    if (v26)
    {
      id v28 = [v8 optionalLabels];
      id v41 = v27;
      BOOL v29 = -[KGDegasGraphStore _lock_filterNodesWithOptionalLabels:includeTombstones:nodeIdentifiers:error:](self, "_lock_filterNodesWithOptionalLabels:includeTombstones:nodeIdentifiers:error:", v28, [v8 includeTombstones], &v47, &v41);
      id v30 = v41;

      if (v29)
      {
        uint64_t v31 = [v8 properties];
        id v40 = v30;
        BOOL v32 = -[KGDegasGraphStore _lock_filterNodesWithProperties:includeTombstones:nodeIdentifiers:error:](self, "_lock_filterNodesWithProperties:includeTombstones:nodeIdentifiers:error:", v31, [v8 includeTombstones], &v47, &v40);
        id v14 = v40;

        if (v32) {
          goto LABEL_28;
        }
      }
      else
      {
        id v14 = v30;
      }
    }
    else
    {
      id v14 = v27;
    }
LABEL_37:
    id v14 = v14;
    id v36 = v47;
    id v47 = 0;

    uint64_t v24 = v14;
    goto LABEL_38;
  }
  if (!v15)
  {
    char v33 = self->_database;
    id v43 = v14;
    v34 = [(KGDatabase *)v33 allNodesWithError:&v43];
    id v35 = v43;

    id v47 = v34;
    uint64_t v24 = 0;
    id v14 = v35;
    if (v34) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_28:
  uint64_t v24 = 0;
LABEL_38:

  id v37 = v47;
  if (a5 && !v47)
  {
    *a5 = v24;
    id v37 = v47;
  }
  id v38 = v37;

  return v38;
}

- (BOOL)_lock_filterNodesWithProperties:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6
{
  BOOL v44 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ([v9 count])
  {
    id v10 = (id *)*a5;
    id v11 = v10;
    if (v10 && ([v10 isEmpty] & 1) != 0)
    {
      LOBYTE(a5) = 1;
LABEL_44:

      goto LABEL_45;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v9;
    uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v43)
    {
LABEL_40:

      if (v11)
      {
        id v11 = v11;
        id obj = *a5;
        *a5 = v11;
        LOBYTE(a5) = 1;
LABEL_42:
      }
      else
      {
        LOBYTE(a5) = 0;
      }
      goto LABEL_44;
    }
    uint64_t v12 = *(void *)v48;
    uint64_t v41 = *(void *)v48;
    id v42 = a6;
    v39 = a5;
    id v40 = v9;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v48 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * v13);
      id v15 = [obj objectForKeyedSubscript:v14];
      char v46 = 1;
      BOOL v16 = [(KGDegasGraphStore *)self _resolvedPropertyValue:v15 isScalar:&v46];

      if (!v16)
      {
        v34 = objc_alloc_init(KGMutableElementIdentifierSet);
        id v35 = *v39;
        id *v39 = v34;

        LOBYTE(a5) = 1;
LABEL_38:
        id v9 = v40;
        goto LABEL_42;
      }
      if (!v46) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        database = self->_database;
        int v19 = [v17 value];
        -[KGDatabase filterNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:](database, "filterNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:", v14, v19, [v17 comparator], v11, a6);
        long long v21 = v20 = a6;

        if (v44)
        {
          id v22 = self->_database;
          id v23 = [v17 value];
          -[KGDatabase filterTombstoneNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:](v22, "filterTombstoneNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:", v14, v23, [v17 comparator], v11, v20);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          a5 = [(KGDatabase *)self->_database filterNodeIdentifiersForPropertyName:v14 value:v16 comparator:1 nodeIdentifiers:v11 error:a6];
          if (!v44) {
            goto LABEL_27;
          }
          uint64_t v24 = [(KGDatabase *)self->_database filterTombstoneNodeIdentifiersForPropertyName:v14 value:v16 comparator:1 nodeIdentifiers:v11 error:a6];
          goto LABEL_24;
        }
        id v17 = v16;
        id v25 = self->_database;
        BOOL v26 = [v17 value1];
        id v27 = [v17 value2];
        -[KGDatabase filterNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:](v25, "filterNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:", v14, v26, v27, [v17 comparator], v11, a6);
        long long v21 = v28 = a6;

        if (v44)
        {
          id v38 = self->_database;
          BOOL v29 = [v17 value1];
          id v30 = [v17 value2];
          -[KGDatabase filterTombstoneNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:](v38, "filterTombstoneNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:", v14, v29, v30, [v17 comparator], v11, v28);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_20:
          uint64_t v31 = [v21 identifierSetByFormingUnion:a5];

          long long v21 = (void *)v31;
          uint64_t v12 = v41;
LABEL_25:

          goto LABEL_26;
        }
      }
      uint64_t v12 = v41;
LABEL_26:

      a5 = (id *)v21;
      a6 = v42;
LABEL_27:
      if (!a5)
      {
        id v36 = *v39;
        id *v39 = 0;

        goto LABEL_38;
      }
      if (v11)
      {
        uint64_t v32 = [v11 identifierSetByIntersectingIdentifierSet:a5];

        id v11 = (id *)v32;
      }
      else
      {
        id v11 = a5;
      }
      uint64_t v33 = [v11 count];

      if (!v33)
      {
        a5 = v39;
        id v9 = v40;
        goto LABEL_40;
      }
      if (v43 == ++v13)
      {
        a5 = v39;
        id v9 = v40;
        uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v43) {
          goto LABEL_7;
        }
        goto LABEL_40;
      }
    }
    a5 = [(KGDatabase *)self->_database filterNodeIdentifiersForPropertyName:v14 values:v16 comparator:1 nodeIdentifiers:v11 error:a6];
    if (!v44) {
      goto LABEL_27;
    }
    uint64_t v24 = [(KGDatabase *)self->_database filterTombstoneNodeIdentifiersForPropertyName:v14 values:v16 comparator:1 nodeIdentifiers:v11 error:a6];
LABEL_24:
    id v17 = (id)v24;
    long long v21 = [a5 identifierSetByFormingUnion:v24];
    goto LABEL_25;
  }
  LOBYTE(a5) = 1;
LABEL_45:

  return (char)a5;
}

- (id)_resolvedPropertyValue:(id)a3 isScalar:(BOOL *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 count];
    if (v6)
    {
      if (v6 == 1)
      {
        uint64_t v7 = [v5 firstObject];
LABEL_9:
        id v9 = (void *)v7;
        goto LABEL_13;
      }
      goto LABEL_18;
    }
LABEL_12:
    id v9 = 0;
LABEL_13:

    BOOL v10 = 1;
    id v5 = v9;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = 1;
    if (!a4) {
      goto LABEL_15;
    }
LABEL_14:
    *a4 = v10;
    goto LABEL_15;
  }
  uint64_t v8 = [v5 count];
  if (!v8) {
    goto LABEL_12;
  }
  if (v8 == 1)
  {
    uint64_t v7 = [v5 anyObject];
    goto LABEL_9;
  }
LABEL_18:
  BOOL v10 = 0;
  if (a4) {
    goto LABEL_14;
  }
LABEL_15:
  return v5;
}

- (BOOL)_lock_filterNodesWithOptionalLabels:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ([v10 count])
  {
    id v11 = *a5;
    uint64_t v12 = v11;
    if (v11 && ![v11 count])
    {
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v13 = [(KGDatabase *)self->_database unionOfNodesWithLabels:v10 filterNodeIdentifiers:v12 error:a6];
      if (v8)
      {
        uint64_t v14 = [(KGDatabase *)self->_database unionOfTombstoneNodesWithLabels:v10 filterNodeIdentifiers:v12 error:a6];
        uint64_t v15 = [v13 identifierSetByFormingUnion:v14];

        uint64_t v13 = (void *)v15;
      }
      BOOL v16 = v13 != 0;
      if (v13) {
        objc_storeStrong(a5, v13);
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)_lock_filterNodesWithRequiredLabels:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ([v10 count])
  {
    id v11 = *a5;
    uint64_t v12 = v11;
    if (v11 && ![v11 count])
    {
      BOOL v16 = 1;
    }
    else
    {
      uint64_t v13 = [(KGDatabase *)self->_database intersectionOfNodesWithLabels:v10 filterNodeIdentifiers:v12 error:a6];
      if (v8)
      {
        uint64_t v14 = [(KGDatabase *)self->_database intersectionOfTombstoneNodesWithLabels:v10 filterNodeIdentifiers:v12 error:a6];
        uint64_t v15 = [v13 identifierSetByFormingUnion:v14];

        uint64_t v13 = (void *)v15;
      }
      BOOL v16 = v13 != 0;
      if (v13) {
        objc_storeStrong(a5, v13);
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (id)edgeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__685;
  id v17 = __Block_byref_object_dispose__686;
  id v18 = 0;
  id v9 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__KGDegasGraphStore_edgeForIdentifier_entityFactory_error___block_invoke;
  v12[3] = &unk_1E68DAC00;
  v12[4] = &v13;
  [(KGDegasGraphStore *)self _lock_enumerateEdgesWithIdentifiers:v9 entityFactory:v8 error:a5 block:v12];
  os_unfair_lock_unlock(&self->_lock);
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __59__KGDegasGraphStore_edgeForIdentifier_entityFactory_error___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)orderedArrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [[KGElementIdentifierSet alloc] initWithIndexArray:v8];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[KGElementIdentifierSet count](v10, "count"));
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __76__KGDegasGraphStore_orderedArrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke;
  v39[3] = &unk_1E68DABD8;
  id v13 = v12;
  id v40 = v13;
  id v30 = v9;
  [(KGDegasGraphStore *)self _lock_enumerateEdgesWithIdentifiers:v10 entityFactory:v9 error:a5 block:v39];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        int v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier", lock));
        [v11 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v16);
  }

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v8;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = objc_msgSend(v11, "objectForKeyedSubscript:", *(void *)(*((void *)&v31 + 1) + 8 * j), lock);
        if (v27) {
          [v21 addObject:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v24);
  }

  os_unfair_lock_unlock(lock);
  return v21;
}

uint64_t __76__KGDegasGraphStore_orderedArrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__KGDegasGraphStore_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke;
  v14[3] = &unk_1E68DABD8;
  id v12 = v11;
  id v15 = v12;
  [(KGDegasGraphStore *)self _lock_enumerateEdgesWithIdentifiers:v10 entityFactory:v9 error:a5 block:v14];

  os_unfair_lock_unlock(p_lock);
  return v12;
}

uint64_t __69__KGDegasGraphStore_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (BOOL)_lock_enumerateEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  id v13 = [(KGDatabase *)self->_database allNodeIdentifiersOfEdgesWithIdentifiers:v10 error:a5];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke;
    v29[3] = &unk_1E68DAB60;
    id v15 = v14;
    id v30 = v15;
    [(KGDegasGraphStore *)self _lock_enumerateNodesWithIdentifiers:v13 entityFactory:v11 block:v29];
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 1;
    database = self->_database;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke_2;
    v20[3] = &unk_1E68DABB0;
    id v17 = v15;
    id v21 = v17;
    id v22 = v11;
    uint64_t v24 = &v25;
    id v23 = v12;
    [(KGDatabase *)database enumerateEdgesWithIdentifiers:v10 block:v20];
    BOOL v18 = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "identifier"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v5 forKeyedSubscript:v6];
}

void __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, unsigned char *a7)
{
  id v23 = a3;
  id v13 = a6;
  id v14 = *(void **)(a1 + 32);
  id v15 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];

  id v17 = *(void **)(a1 + 32);
  BOOL v18 = [NSNumber numberWithUnsignedInteger:a5];
  int v19 = [v17 objectForKeyedSubscript:v18];

  if (v16) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    *a7 = 1;
  }
  else
  {
    uint64_t v21 = [*(id *)(a1 + 40) edgeWithIdentifier:a2 labels:v23 properties:v13 sourceNode:v16 targetNode:v19];
    id v22 = (void *)v21;
    if (v21)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a7 = 1;
    }
  }
}

- (id)nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_lock(p_lock);
  id v10 = [(KGDegasGraphStore *)self _lock_nodeForIdentifier:a3 entityFactory:v9 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__685;
  uint64_t v16 = __Block_byref_object_dispose__686;
  id v17 = 0;
  id v8 = [[KGElementIdentifierSet alloc] initWithElementIdentifier:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__KGDegasGraphStore__lock_nodeForIdentifier_entityFactory_error___block_invoke;
  v11[3] = &unk_1E68DAB88;
  v11[4] = &v12;
  [(KGDegasGraphStore *)self _lock_enumerateNodesWithIdentifiers:v8 entityFactory:v7 block:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __65__KGDegasGraphStore__lock_nodeForIdentifier_entityFactory_error___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)orderedArrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [[KGElementIdentifierSet alloc] initWithIndexArray:v7];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[KGElementIdentifierSet count](v9, "count"));
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76__KGDegasGraphStore_orderedArrayOfNodesWithIdentifiers_entityFactory_error___block_invoke;
  v38[3] = &unk_1E68DAB60;
  id v12 = v11;
  id v39 = v12;
  BOOL v29 = v8;
  [(KGDegasGraphStore *)self _lock_enumerateNodesWithIdentifiers:v9 entityFactory:v8 block:v38];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        BOOL v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        int v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "identifier", lock));
        [v10 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v15);
  }

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = v7;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        BOOL v26 = objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * j), lock);
        if (v26) {
          [v20 addObject:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v23);
  }

  os_unfair_lock_unlock(lock);
  return v20;
}

uint64_t __76__KGDegasGraphStore_orderedArrayOfNodesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v8 = a4;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__KGDegasGraphStore_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke;
  v13[3] = &unk_1E68DAB60;
  id v11 = v10;
  id v14 = v11;
  [(KGDegasGraphStore *)self _lock_enumerateNodesWithIdentifiers:v9 entityFactory:v8 block:v13];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

uint64_t __69__KGDegasGraphStore_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)_lock_enumerateNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  database = self->_database;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__KGDegasGraphStore__lock_enumerateNodesWithIdentifiers_entityFactory_block___block_invoke;
  v14[3] = &unk_1E68DAB38;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(KGDatabase *)database enumerateNodesWithIdentifiers:v10 block:v14];
}

uint64_t __77__KGDegasGraphStore__lock_enumerateNodesWithIdentifiers_entityFactory_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) nodeWithIdentifier:a2 labels:a3 properties:a4];
  if (objc_claimAutoreleasedReturnValue()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return MEMORY[0x1F4181820]();
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database addEdges:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = [(KGDatabase *)self->_database addNodes:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (void)enableInTransactionCheck
{
  self->_inTransactionCheckIsEnabled = 1;
}

- (BOOL)noFatalError
{
  return [(KGDatabase *)self->_database noFatalError];
}

- (NSUUID)graphIdentifier
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v4 = [(KGDegasGraphStore *)self _lock_graphIdentifier];
  os_unfair_lock_unlock(p_lock);
  return (NSUUID *)v4;
}

- (id)_lock_graphIdentifier
{
  os_unfair_lock_assert_owner(&self->_lock);
  database = self->_database;
  return [(KGDatabase *)database graphIdentifier];
}

- (void)setGraphVersion:(unint64_t)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  [(KGDatabase *)self->_database setGraphVersion:a3];
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)graphVersion
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(KGDatabase *)self->_database graphVersion];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (KGDegasGraphStore)initWithURL:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KGDegasGraphStore;
  id v6 = [(KGDegasGraphStore *)&v12 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_url, a3);
LABEL_4:
    id v8 = v7;
    goto LABEL_8;
  }
  id v9 = KGLoggingConnection();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_error_impl(&dword_1D1654000, v9, OS_LOG_TYPE_ERROR, "Failed to instantiate graph store, url is nil", v11, 2u);
  }

  id v8 = 0;
LABEL_8:

  return v8;
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

+ (NSString)persistentStoreFileExtension
{
  v2 = @"kgdb";
  return (NSString *)@"kgdb";
}

@end