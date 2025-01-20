@interface KGMemoryGraphStore
+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4;
+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (NSString)persistentStoreFileExtension;
- (BOOL)_removeEdgesForMemoryNode:(id)a3 error:(id *)a4;
- (BOOL)_removeMemoryEdge:(id)a3 error:(id *)a4;
- (BOOL)_removeNode:(unint64_t)a3 error:(id *)a4;
- (BOOL)addEdges:(id)a3 error:(id *)a4;
- (BOOL)addNodes:(id)a3 error:(id *)a4;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)noFatalError;
- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeEdgeForIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeEdgesForIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)removeNodeForIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeNodesForIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5;
- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5;
- (KGMemoryGraphStore)init;
- (KGMutableDirectedBinaryAdjacency)edgeIdentifiersBySourceNodeIdentifier;
- (KGMutableDirectedBinaryAdjacency)edgeIdentifiersByTargetNodeIdentifier;
- (NSMutableDictionary)edgeIdentifiersByLabel;
- (NSMutableDictionary)memoryEdgeByIdentifier;
- (NSMutableDictionary)memoryNodeByIdentifier;
- (NSMutableDictionary)nodeIdentifiersByLabel;
- (NSURL)url;
- (NSUUID)graphIdentifier;
- (id)_edgeIdentifiersForNodeIdentifier:(unint64_t)a3;
- (id)_lock_allEdgeIdentifiers;
- (id)_lock_allNodeIdentifiers;
- (id)_lock_arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)_lock_arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)_lock_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5;
- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)_lock_intersectionOfEdgesWithLabels:(id)a3;
- (id)_lock_intersectionOfNodesWithLabels:(id)a3;
- (id)_lock_nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)_lock_snapshotEdgeForIdentifier:(unint64_t)a3 reusableNode:(id)a4 entityFactory:(id)a5;
- (id)_lock_snapshotNodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4;
- (id)_lock_sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4;
- (id)_lock_targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4;
- (id)_lock_unionOfEdgesWithLabels:(id)a3;
- (id)_lock_unionOfNodesWithLabels:(id)a3;
- (id)arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5;
- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6;
- (id)edgeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5;
- (id)edgeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)edgeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)edgeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7;
- (id)edgeIdentifiersBetween:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6 error:(id *)a7;
- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 error:(id *)a4;
- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5;
- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5;
- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6;
- (id)edgeLabels;
- (id)initForSubclasses;
- (id)insertEdgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNodeIdentifier:(unint64_t)a6 targetNodeIdentifier:(unint64_t)a7 error:(id *)a8;
- (id)insertNodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 error:(id *)a6;
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
- (os_unfair_lock_s)lock;
- (unint64_t)graphVersion;
- (unint64_t)nextEdgeIdentifier;
- (unint64_t)nextNodeIdentifier;
- (void)setGraphVersion:(unint64_t)a3;
- (void)setNextEdgeIdentifier:(unint64_t)a3;
- (void)setNextNodeIdentifier:(unint64_t)a3;
@end

@implementation KGMemoryGraphStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeIdentifiersByTargetNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_edgeIdentifiersBySourceNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_edgeIdentifiersByLabel, 0);
  objc_storeStrong((id *)&self->_memoryEdgeByIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersByLabel, 0);
  objc_storeStrong((id *)&self->_memoryNodeByIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_graphIdentifier, 0);
}

- (KGMutableDirectedBinaryAdjacency)edgeIdentifiersByTargetNodeIdentifier
{
  return self->_edgeIdentifiersByTargetNodeIdentifier;
}

- (KGMutableDirectedBinaryAdjacency)edgeIdentifiersBySourceNodeIdentifier
{
  return self->_edgeIdentifiersBySourceNodeIdentifier;
}

- (NSMutableDictionary)edgeIdentifiersByLabel
{
  return self->_edgeIdentifiersByLabel;
}

- (NSMutableDictionary)memoryEdgeByIdentifier
{
  return self->_memoryEdgeByIdentifier;
}

- (void)setNextEdgeIdentifier:(unint64_t)a3
{
  self->_nextEdgeIdentifier = a3;
}

- (unint64_t)nextEdgeIdentifier
{
  return self->_nextEdgeIdentifier;
}

- (NSMutableDictionary)nodeIdentifiersByLabel
{
  return self->_nodeIdentifiersByLabel;
}

- (NSMutableDictionary)memoryNodeByIdentifier
{
  return self->_memoryNodeByIdentifier;
}

- (void)setNextNodeIdentifier:(unint64_t)a3
{
  self->_nextNodeIdentifier = a3;
}

- (unint64_t)nextNodeIdentifier
{
  return self->_nextNodeIdentifier;
}

- (NSURL)url
{
  return self->_url;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setGraphVersion:(unint64_t)a3
{
  self->_graphVersion = a3;
}

- (unint64_t)graphVersion
{
  return self->_graphVersion;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return 1;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return 1;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return 1;
}

- (BOOL)_removeNode:(unint64_t)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v8 = [(NSMutableDictionary *)self->_memoryNodeByIdentifier objectForKeyedSubscript:v7];
  if (!v8)
  {
LABEL_18:
    BOOL v16 = 0;
    goto LABEL_19;
  }
  [(NSMutableDictionary *)self->_memoryNodeByIdentifier removeObjectForKey:v7];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = objc_msgSend(v8, "labels", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(NSMutableDictionary *)self->_nodeIdentifiersByLabel objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        if (!v14)
        {
          v17 = KGLoggingConnection();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1654000, v17, OS_LOG_TYPE_ERROR, "Node has a label and it's not in _nodeIdentifiersByLabel", buf, 2u);
          }

          goto LABEL_17;
        }
        v15 = v14;
        [v14 removeIdentifier:a3];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (![(KGMemoryGraphStore *)self _removeEdgesForMemoryNode:v8 error:a4])
  {
    v9 = KGLoggingConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v24 = a3;
      _os_log_error_impl(&dword_1D1654000, v9, OS_LOG_TYPE_ERROR, "Cannot delete edges for node: %lu", buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v16 = 1;
LABEL_19:

  return v16;
}

- (BOOL)removeNodeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(a4) = [(KGMemoryGraphStore *)self _removeNode:a3 error:a4];
  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeNodesForIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = [v6 indexArray];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v18 = a4;
    id v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      v13 = v10;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v12), "unsignedIntegerValue", v18);
        id v19 = v13;
        BOOL v15 = [(KGMemoryGraphStore *)self _removeNode:v14 error:&v19];
        id v10 = v19;

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);

    if (v18) {
      char v16 = v15;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      id v10 = v10;
      id *v18 = v10;
    }
  }
  else
  {

    id v10 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (BOOL)_removeEdgesForMemoryNode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v7 = -[KGMemoryGraphStore _edgeIdentifiersForNodeIdentifier:](self, "_edgeIdentifiersForNodeIdentifier:", [v6 identifier]);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3521;
  BOOL v15 = __Block_byref_object_dispose__3522;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__KGMemoryGraphStore__removeEdgesForMemoryNode_error___block_invoke;
  v10[3] = &unk_1E68DBEF8;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  [v7 enumerateIdentifiersWithBlock:v10];
  if (a4) {
    *a4 = (id) v12[5];
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __54__KGMemoryGraphStore__removeEdgesForMemoryNode_error___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v4 = a1;
  v5 = *(void **)(a1[4] + 72);
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  v7 = [v5 objectForKeyedSubscript:v6];

  char v8 = (void *)v4[4];
  id v13 = 0;
  LOBYTE(v6) = [v8 _removeMemoryEdge:v7 error:&v13];
  id v9 = v13;
  *(unsigned char *)(*(void *)(v4[5] + 8) + 24) = (_BYTE)v6;
  uint64_t v10 = *(void *)(v4[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  LODWORD(v4) = *(unsigned __int8 *)(*(void *)(v4[5] + 8) + 24);
  if (!v4) {
    *a3 = 1;
  }
}

- (BOOL)_removeMemoryEdge:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 identifier];
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  char v8 = [NSNumber numberWithUnsignedInteger:v6];
  [(NSMutableDictionary *)memoryEdgeByIdentifier removeObjectForKey:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v5 labels];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(NSMutableDictionary *)self->_edgeIdentifiersByLabel objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (!v14)
        {
          char v20 = KGLoggingConnection();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v22 = 0;
            _os_log_error_impl(&dword_1D1654000, v20, OS_LOG_TYPE_ERROR, "Edge has a label and it's not in _edgeIdentifiersByLabel", v22, 2u);
          }

          BOOL v19 = 0;
          goto LABEL_13;
        }
        BOOL v15 = v14;
        [v14 removeIdentifier:v6];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersBySourceNodeIdentifier;
  uint64_t v17 = [v5 sourceNode];
  -[KGMutableDirectedBinaryAdjacency removeSource:target:](edgeIdentifiersBySourceNodeIdentifier, "removeSource:target:", [v17 identifier], v6);

  edgeIdentifiersByTargetNodeIdentifier = self->_edgeIdentifiersByTargetNodeIdentifier;
  id v9 = [v5 targetNode];
  -[KGMutableDirectedBinaryAdjacency removeSource:target:](edgeIdentifiersByTargetNodeIdentifier, "removeSource:target:", [v9 identifier], v6);
  BOOL v19 = 1;
LABEL_13:

  return v19;
}

- (BOOL)removeEdgeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v10 = [(NSMutableDictionary *)memoryEdgeByIdentifier objectForKeyedSubscript:v9];

  if (v10) {
    BOOL v11 = [(KGMemoryGraphStore *)self _removeMemoryEdge:v10 error:a4];
  }
  else {
    BOOL v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (BOOL)removeEdgesForIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = objc_msgSend(v6, "indexArray", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = [(NSMutableDictionary *)self->_memoryEdgeByIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
      if (!v12) {
        break;
      }
      BOOL v13 = [(KGMemoryGraphStore *)self _removeMemoryEdge:v12 error:a4];

      if (!v13)
      {
        LOBYTE(v12) = 0;
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        LOBYTE(v12) = 1;
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  os_unfair_lock_unlock(&self->_lock);
  return (char)v12;
}

- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v11 = [(NSMutableDictionary *)memoryEdgeByIdentifier objectForKeyedSubscript:v10];

  if (v11) {
    [v11 setProperties:v7];
  }
  os_unfair_lock_unlock(p_lock);

  return v11 != 0;
}

- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v11 = [(NSMutableDictionary *)memoryNodeByIdentifier objectForKeyedSubscript:v10];

  if (v11) {
    [v11 setProperties:v7];
  }
  os_unfair_lock_unlock(p_lock);

  return v11 != 0;
}

- (id)orderedArrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)orderedArrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = [(KGMemoryGraphStore *)self _lock_sourcesByTargetWithEdgeIdentifiers:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = [(KGMemoryGraphStore *)self _lock_targetsBySourceWithEdgeIdentifiers:v7 error:a4];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)_lock_sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__KGMemoryGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke;
  v21[3] = &unk_1E68DBED0;
  v21[4] = self;
  id v7 = v6;
  id v22 = v7;
  [v5 enumerateIdentifiersWithBlock:v21];
  uint64_t v8 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = objc_msgSend(v9, "objectForKeyedSubscript:", v14, (void)v17);
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v8, "setTargets:forSource:", v15, [v14 unsignedIntegerValue]);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

void __69__KGMemoryGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 72);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v11 = [v3 objectForKeyedSubscript:v4];

  id v5 = [v11 targetNode];
  uint64_t v6 = [v5 identifier];

  id v7 = [v11 sourceNode];
  uint64_t v8 = [v7 identifier];

  id v9 = [NSNumber numberWithUnsignedInteger:v6];
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  if (!v10)
  {
    uint64_t v10 = objc_alloc_init(KGMutableElementIdentifierSet);
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
  }
  [(KGMutableElementIdentifierSet *)v10 addIdentifier:v8];
}

- (id)_lock_targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__KGMemoryGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke;
  v21[3] = &unk_1E68DBED0;
  v21[4] = self;
  id v7 = v6;
  id v22 = v7;
  [v5 enumerateIdentifiersWithBlock:v21];
  uint64_t v8 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = objc_msgSend(v9, "objectForKeyedSubscript:", v14, (void)v17);
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v8, "setTargets:forSource:", v15, [v14 unsignedIntegerValue]);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

void __69__KGMemoryGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 72);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v11 = [v3 objectForKeyedSubscript:v4];

  id v5 = [v11 sourceNode];
  uint64_t v6 = [v5 identifier];

  id v7 = [v11 targetNode];
  uint64_t v8 = [v7 identifier];

  id v9 = [NSNumber numberWithUnsignedInteger:v6];
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  if (!v10)
  {
    uint64_t v10 = objc_alloc_init(KGMutableElementIdentifierSet);
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
  }
  [(KGMutableElementIdentifierSet *)v10 addIdentifier:v8];
}

- (id)edgeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)edgeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)edgeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)nodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  return 0;
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [v4 indexArray];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_memoryEdgeByIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        uint64_t v12 = v11;
        if (v11)
        {
          BOOL v13 = [v11 labels];
          [v5 unionSet:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [v4 indexArray];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_memoryNodeByIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        uint64_t v12 = v11;
        if (v11)
        {
          BOOL v13 = [v11 labels];
          [v5 unionSet:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)edgeLabels
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(NSMutableDictionary *)self->_edgeIdentifiersByLabel allKeys];
  uint64_t v6 = [v4 setWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)nodeLabels
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(NSMutableDictionary *)self->_nodeIdentifiersByLabel allKeys];
  uint64_t v6 = [v4 setWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)propertiesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__3521;
  uint64_t v20 = __Block_byref_object_dispose__3522;
  long long v21 = objc_alloc_init(KGMutablePropertyValueArray);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__KGMemoryGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke;
  v13[3] = &unk_1E68DBEA8;
  v13[4] = self;
  long long v15 = &v16;
  id v10 = v8;
  id v14 = v10;
  [v7 enumerateIdentifiersWithBlock:v13];
  os_unfair_lock_unlock(p_lock);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __75__KGMemoryGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void **)(a1[4] + 72);
  id v7 = [NSNumber numberWithUnsignedInteger:a2];
  id v13 = [v6 objectForKeyedSubscript:v7];

  id v8 = v13;
  if (!v13)
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    id v8 = 0;
    *a3 = 1;
  }
  id v11 = [v8 properties];
  uint64_t v12 = [v11 objectForKeyedSubscript:a1[5]];

  if (v12) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) appendValue:v12 forIdentifier:a2];
  }
}

- (id)propertiesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__3521;
  uint64_t v20 = __Block_byref_object_dispose__3522;
  long long v21 = objc_alloc_init(KGMutablePropertyValueArray);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__KGMemoryGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke;
  v13[3] = &unk_1E68DBEA8;
  v13[4] = self;
  long long v15 = &v16;
  id v10 = v8;
  id v14 = v10;
  [v7 enumerateIdentifiersWithBlock:v13];
  os_unfair_lock_unlock(p_lock);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __75__KGMemoryGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void **)(a1[4] + 48);
  id v7 = [NSNumber numberWithUnsignedInteger:a2];
  id v13 = [v6 objectForKeyedSubscript:v7];

  id v8 = v13;
  if (!v13)
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    id v8 = 0;
    *a3 = 1;
  }
  id v11 = [v8 properties];
  uint64_t v12 = [v11 objectForKeyedSubscript:a1[5]];

  if (v12) {
    [*(id *)(*(void *)(a1[6] + 8) + 40) appendValue:v12 forIdentifier:a2];
  }
}

- (id)nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = [(KGMemoryGraphStore *)self _lock_nodeIdentifiersOfEdgesWithIdentifiers:v9 edgeDirection:a4 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(KGMutableElementIdentifierSet);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__KGMemoryGraphStore__lock_nodeIdentifiersOfEdgesWithIdentifiers_edgeDirection_error___block_invoke;
  v13[3] = &unk_1E68DBE80;
  v13[4] = self;
  unint64_t v15 = a4;
  id v9 = v8;
  id v14 = v9;
  [v7 enumerateIdentifiersWithBlock:v13];

  id v10 = v14;
  id v11 = v9;

  return v11;
}

void __86__KGMemoryGraphStore__lock_nodeIdentifiersOfEdgesWithIdentifiers_edgeDirection_error___block_invoke(void *a1, uint64_t a2)
{
  v3 = *(void **)(a1[4] + 72);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v10 = [v3 objectForKeyedSubscript:v4];

  uint64_t v5 = a1[6];
  if (v5)
  {
    uint64_t v6 = (void *)a1[5];
    id v7 = [v10 targetNode];
    objc_msgSend(v6, "addIdentifier:", objc_msgSend(v7, "identifier"));

    uint64_t v5 = a1[6];
  }
  if ((v5 & 2) != 0)
  {
    id v8 = (void *)a1[5];
    id v9 = [v10 sourceNode];
    objc_msgSend(v8, "addIdentifier:", objc_msgSend(v9, "identifier"));
  }
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void *)[v10 copy];
  id v13 = objc_alloc_init(KGMutableElementIdentifierSet);
  uint64_t v14 = [(KGMemoryGraphStore *)self neighborNodeIdentifiersWithStartNodeIdentifiers:v12 edgeDirection:a4 edgeFilter:v11 error:a6];
  if (v14)
  {
    while (1)
    {
      unint64_t v15 = (void *)v14;
      id v16 = [(KGElementIdentifierSet *)v13 mutableCopy];
      [v16 unionWithIdentifierSet:v15];
      if ([v16 isEqual:v13]) {
        break;
      }
      [(KGMutableElementIdentifierSet *)v13 unionWithIdentifierSet:v15];

      uint64_t v14 = [(KGMemoryGraphStore *)self neighborNodeIdentifiersWithStartNodeIdentifiers:v15 edgeDirection:a4 edgeFilter:v11 error:a6];
      uint64_t v12 = v15;
      if (!v14)
      {
        long long v17 = 0;
        uint64_t v12 = v15;
        goto LABEL_7;
      }
    }

    long long v17 = v13;
  }
  else
  {
    long long v17 = 0;
  }
LABEL_7:

  return v17;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  char v8 = a4;
  id v10 = a3;
  id v11 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((v8 & 2) != 0)
  {
    uint64_t v14 = [(KGMemoryGraphStore *)self _lock_edgeIdentifiersWithStartNodeIdentifiers:v10 edgeDirection:2 error:a6];
    unint64_t v15 = [(KGMemoryGraphStore *)self _lock_edgeIdentifiersMatchingFilter:v11 intersectingIdentifiers:v14 error:a6];

    id v13 = [(KGMemoryGraphStore *)self _lock_nodeIdentifiersOfEdgesWithIdentifiers:v15 edgeDirection:1 error:a6];

    if ((v8 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_5:
    id v16 = [(KGMemoryGraphStore *)self _lock_edgeIdentifiersWithStartNodeIdentifiers:v10 edgeDirection:1 error:a6];
    long long v17 = [(KGMemoryGraphStore *)self _lock_edgeIdentifiersMatchingFilter:v11 intersectingIdentifiers:v16 error:a6];

    uint64_t v18 = [(KGMemoryGraphStore *)self _lock_nodeIdentifiersOfEdgesWithIdentifiers:v17 edgeDirection:2 error:a6];
    long long v19 = v18;
    if (v13)
    {
      uint64_t v20 = [v13 identifierSetByFormingUnion:v18];

      id v13 = (id)v20;
    }
    else
    {
      id v13 = v18;
    }

    goto LABEL_9;
  }
  id v13 = 0;
  if (v8) {
    goto LABEL_5;
  }
LABEL_9:
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (id)edgeIdentifiersBetween:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [(KGMemoryGraphStore *)self edgeIdentifiersWithStartNodeIdentifiers:a3 edgeDirection:a6 error:a7];
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    if (a6 - 1 > 2) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = qword_1D17CE7C0[a6 - 1];
    }
    uint64_t v18 = [(KGMemoryGraphStore *)self edgeIdentifiersWithStartNodeIdentifiers:v12 intersectingEdgeIdentifiers:v14 edgeDirection:v16 error:a7];

    long long v17 = [(KGMemoryGraphStore *)self edgeIdentifiersMatchingFilter:v13 intersectingIdentifiers:v18 error:a7];
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(KGMemoryGraphStore *)self edgeIdentifiersWithStartNodeIdentifiers:a3 edgeDirection:a5 error:a6];
  id v12 = [v11 identifierSetByIntersectingIdentifierSet:v10];

  return v12;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = [(KGMemoryGraphStore *)self _lock_edgeIdentifiersWithStartNodeIdentifiers:v9 edgeDirection:a4 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  switch(a4)
  {
    case 3uLL:
      id v10 = [(KGDirectedBinaryAdjacency *)self->_edgeIdentifiersBySourceNodeIdentifier targetsForSources:v7];
      id v11 = [(KGDirectedBinaryAdjacency *)self->_edgeIdentifiersByTargetNodeIdentifier targetsForSources:v7];
      if ([v10 isEmpty])
      {
        id v12 = v11;
      }
      else if ([v11 isEmpty])
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [v11 identifierSetByFormingUnion:v10];
      }
      id v9 = v12;

      goto LABEL_14;
    case 2uLL:
      edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersBySourceNodeIdentifier;
      goto LABEL_6;
    case 1uLL:
      edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersByTargetNodeIdentifier;
LABEL_6:
      id v9 = [(KGDirectedBinaryAdjacency *)edgeIdentifiersBySourceNodeIdentifier targetsForSources:v7];
      goto LABEL_14;
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

- (id)_edgeIdentifiersForNodeIdentifier:(unint64_t)a3
{
  uint64_t v5 = -[KGDirectedBinaryAdjacency targetsForSourceIdentifier:](self->_edgeIdentifiersBySourceNodeIdentifier, "targetsForSourceIdentifier:");
  uint64_t v6 = [(KGDirectedBinaryAdjacency *)self->_edgeIdentifiersByTargetNodeIdentifier targetsForSourceIdentifier:a3];
  if ([v5 isEmpty])
  {
    id v7 = v6;
  }
  else if ([v6 isEmpty])
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v6 identifierSetByFormingUnion:v5];
  }
  char v8 = v7;

  return v8;
}

- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(KGMemoryGraphStore *)self _edgeIdentifiersForNodeIdentifier:a3];
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [v7 requiredLabels];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = [v7 requiredLabels];
    id v13 = [(KGMemoryGraphStore *)self _lock_intersectionOfNodesWithLabels:v12];

    if (v8)
    {
LABEL_3:
      uint64_t v14 = [v13 identifierSetByIntersectingIdentifierSet:v8];
      unint64_t v15 = (void *)v14;
      if (v14) {
        uint64_t v16 = (void *)v14;
      }
      else {
        uint64_t v16 = v8;
      }
      id v17 = v16;

      id v13 = v17;
    }
  }
  else
  {
    id v13 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  if (!v13)
  {
    id v13 = [(KGMemoryGraphStore *)self _lock_allNodeIdentifiers];
  }
  uint64_t v18 = objc_alloc_init(KGMutableElementIdentifierSet);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__KGMemoryGraphStore_nodeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke;
  v24[3] = &unk_1E68DBE58;
  v24[4] = self;
  id v25 = v7;
  long long v19 = v18;
  long long v26 = v19;
  id v20 = v7;
  [v13 enumerateIdentifiersWithBlock:v24];
  os_unfair_lock_unlock(p_lock);
  long long v21 = v26;
  id v22 = v19;

  return v22;
}

void __82__KGMemoryGraphStore_nodeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke(id *a1, uint64_t a2)
{
  id v4 = [a1[4] memoryNodeByIdentifier];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if ([a1[5] matchesNode:v6]) {
    objc_msgSend(a1[6], "addIdentifier:", objc_msgSend(v6, "identifier"));
  }
}

- (id)_lock_allNodeIdentifiers
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(NSMutableDictionary *)self->_nodeIdentifiersByLabel allKeys];
  id v4 = [(KGMemoryGraphStore *)self _lock_unionOfNodesWithLabels:v3];

  return v4;
}

- (id)_lock_unionOfNodesWithLabels:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = objc_alloc_init(KGMutableElementIdentifierSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [(KGMutableElementIdentifierSet *)v5 unionWithIdentifierSet:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_lock_intersectionOfNodesWithLabels:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6)
  {
LABEL_15:

LABEL_16:
    uint64_t v8 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v15;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      if (!v11)
      {

        goto LABEL_15;
      }
      id v12 = v11;
      if (v8) {
        [(KGElementIdentifierSet *)v8 intersectWithIdentifierSet:v11];
      }
      else {
        uint64_t v8 = (KGElementIdentifierSet *)[v11 mutableCopy];
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7) {
      continue;
    }
    break;
  }

  if (!v8) {
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (id)arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v11 = [(KGMemoryGraphStore *)self _lock_arrayOfNodesWithIdentifiers:v10 entityFactory:v9 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v8 = a4;
  os_unfair_lock_lock(p_lock);
  id v9 = [(KGMemoryGraphStore *)self _lock_snapshotNodeForIdentifier:a3 entityFactory:v8];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)_lock_snapshotNodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4
{
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)memoryNodeByIdentifier objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [v9 identifier];
    uint64_t v11 = [v9 labels];
    id v12 = [v9 properties];
    long long v13 = [v6 nodeWithIdentifier:v10 labels:v11 properties:v12];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v11 = [(KGMemoryGraphStore *)self _lock_edgeIdentifiersMatchingFilter:v10 intersectingIdentifiers:v9 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  id v9 = [v7 requiredLabels];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [v7 requiredLabels];
    id v12 = [(KGMemoryGraphStore *)self _lock_intersectionOfEdgesWithLabels:v11];

    if (v8)
    {
LABEL_3:
      uint64_t v13 = [v12 identifierSetByIntersectingIdentifierSet:v8];
      long long v14 = (void *)v13;
      if (v13) {
        long long v15 = (void *)v13;
      }
      else {
        long long v15 = v8;
      }
      id v16 = v15;

      id v12 = v16;
    }
  }
  else
  {
    id v12 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  if (!v12)
  {
    id v12 = [(KGMemoryGraphStore *)self _lock_allEdgeIdentifiers];
  }
  long long v17 = objc_alloc_init(KGMutableElementIdentifierSet);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __88__KGMemoryGraphStore__lock_edgeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke;
  v23[3] = &unk_1E68DBE58;
  v23[4] = self;
  id v24 = v7;
  uint64_t v18 = v17;
  id v25 = v18;
  id v19 = v7;
  [v12 enumerateIdentifiersWithBlock:v23];
  id v20 = v25;
  long long v21 = v18;

  return v21;
}

void __88__KGMemoryGraphStore__lock_edgeIdentifiersMatchingFilter_intersectingIdentifiers_error___block_invoke(id *a1, uint64_t a2)
{
  id v4 = [a1[4] memoryEdgeByIdentifier];
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if ([a1[5] matchesEdge:v6]) {
    objc_msgSend(a1[6], "addIdentifier:", objc_msgSend(v6, "identifier"));
  }
}

- (id)_lock_allEdgeIdentifiers
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(NSMutableDictionary *)self->_edgeIdentifiersByLabel allKeys];
  id v4 = [(KGMemoryGraphStore *)self _lock_unionOfEdgesWithLabels:v3];

  return v4;
}

- (id)_lock_unionOfEdgesWithLabels:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = objc_alloc_init(KGMutableElementIdentifierSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [(KGMutableElementIdentifierSet *)v5 unionWithIdentifierSet:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_lock_intersectionOfEdgesWithLabels:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6)
  {
LABEL_15:

LABEL_16:
    uint64_t v8 = objc_alloc_init(KGElementIdentifierSet);
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v15;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_edgeIdentifiersByLabel, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      if (!v11)
      {

        goto LABEL_15;
      }
      id v12 = v11;
      if (v8) {
        [(KGElementIdentifierSet *)v8 intersectWithIdentifierSet:v11];
      }
      else {
        uint64_t v8 = (KGElementIdentifierSet *)[v11 mutableCopy];
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7) {
      continue;
    }
    break;
  }

  if (!v8) {
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (id)arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v11 = [(KGMemoryGraphStore *)self _lock_arrayOfEdgesWithIdentifiers:v10 entityFactory:v9 error:a5];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3521;
  uint64_t v19 = __Block_byref_object_dispose__3522;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__KGMemoryGraphStore__lock_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke;
  v12[3] = &unk_1E68DBEA8;
  v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  long long v14 = &v15;
  [v7 enumerateIdentifiersWithBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __76__KGMemoryGraphStore__lock_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_lock_snapshotEdgeForIdentifier:reusableNode:entityFactory:", a2, 0, *(void *)(a1 + 40));
  id v8 = (id)v5;
  if (!v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    uint64_t v5 = 0;
    *a3 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v5];
}

- (id)_lock_arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3521;
  uint64_t v19 = __Block_byref_object_dispose__3522;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__KGMemoryGraphStore__lock_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke;
  v12[3] = &unk_1E68DBEA8;
  v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  long long v14 = &v15;
  [v7 enumerateIdentifiersWithBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __76__KGMemoryGraphStore__lock_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_lock_snapshotNodeForIdentifier:entityFactory:", a2, *(void *)(a1 + 40));
  id v8 = (id)v5;
  if (!v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    uint64_t v5 = 0;
    *a3 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v5];
}

- (id)edgeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  id v8 = a4;
  os_unfair_lock_lock(p_lock);
  id v9 = [(KGMemoryGraphStore *)self _lock_snapshotEdgeForIdentifier:a3 reusableNode:0 entityFactory:v8];

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)_lock_snapshotEdgeForIdentifier:(unint64_t)a3 reusableNode:(id)a4 entityFactory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
  id v12 = [(NSMutableDictionary *)memoryEdgeByIdentifier objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = [v12 sourceNode];
    long long v14 = [v12 targetNode];
    uint64_t v15 = [v8 identifier];
    if (v15 != [v13 identifier] || (id v16 = v8) == 0)
    {
      uint64_t v17 = [v13 identifier];
      uint64_t v18 = [v13 labels];
      uint64_t v19 = [v13 properties];
      id v16 = [v9 nodeWithIdentifier:v17 labels:v18 properties:v19];
    }
    if (v15 != [v14 identifier] || (id v20 = v8) == 0)
    {
      uint64_t v21 = [v14 identifier];
      id v22 = [v14 labels];
      long long v23 = [v14 properties];
      id v20 = [v9 nodeWithIdentifier:v21 labels:v22 properties:v23];
    }
    uint64_t v24 = [v12 identifier];
    id v25 = [v12 labels];
    long long v26 = [v12 properties];
    v27 = [v9 edgeWithIdentifier:v24 labels:v25 properties:v26 sourceNode:v16 targetNode:v20];
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)insertNodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = [[KGMemoryNode alloc] initWithIdentifier:a3 labels:v9 properties:v10];
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  id v13 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)memoryNodeByIdentifier setObject:v11 forKeyedSubscript:v13];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nodeIdentifiersByLabel, "objectForKeyedSubscript:", v19, lock);
        id v20 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          id v20 = objc_alloc_init(KGMutableElementIdentifierSet);
          [(NSMutableDictionary *)self->_nodeIdentifiersByLabel setObject:v20 forKeyedSubscript:v19];
        }
        [(KGMutableElementIdentifierSet *)v20 addIdentifier:a3];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  self->_nextNodeIdentifier = a3 + 1;
  os_unfair_lock_unlock(lock);

  return v11;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v5;
  uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        unint64_t nextNodeIdentifier = self->_nextNodeIdentifier;
        self->_unint64_t nextNodeIdentifier = nextNodeIdentifier + 1;
        id v9 = objc_msgSend(v7, "labels", lock);
        id v10 = [KGMemoryNode alloc];
        uint64_t v28 = v7;
        uint64_t v11 = [v7 properties];
        uint64_t v12 = [(KGMemoryNode *)v10 initWithIdentifier:nextNodeIdentifier labels:v9 properties:v11];

        memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
        id v14 = [NSNumber numberWithUnsignedInteger:nextNodeIdentifier];
        v27 = (void *)v12;
        [(NSMutableDictionary *)memoryNodeByIdentifier setObject:v12 forKeyedSubscript:v14];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v15 = v9;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * j);
              uint64_t v21 = [(NSMutableDictionary *)self->_nodeIdentifiersByLabel objectForKeyedSubscript:v20];
              if (!v21)
              {
                uint64_t v21 = objc_alloc_init(KGMutableElementIdentifierSet);
                [(NSMutableDictionary *)self->_nodeIdentifiersByLabel setObject:v21 forKeyedSubscript:v20];
              }
              [(KGMutableElementIdentifierSet *)v21 addIdentifier:nextNodeIdentifier];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v17);
        }

        [v28 resolveIdentifier:nextNodeIdentifier];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }

  os_unfair_lock_unlock(lock);
  return 1;
}

- (id)insertEdgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNodeIdentifier:(unint64_t)a6 targetNodeIdentifier:(unint64_t)a7 error:(id *)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  os_unfair_lock_lock(&self->_lock);
  memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:a6];
  uint64_t v17 = [(NSMutableDictionary *)memoryNodeByIdentifier objectForKeyedSubscript:v16];

  uint64_t v18 = self->_memoryNodeByIdentifier;
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a7];
  uint64_t v20 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v19];

  long long v32 = (void *)v20;
  long long v33 = (void *)v17;
  uint64_t v21 = [[KGMemoryEdge alloc] initWithIdentifier:a3 labels:v13 properties:v14 sourceNode:v17 targetNode:v20];
  [(KGMutableDirectedBinaryAdjacency *)self->_edgeIdentifiersBySourceNodeIdentifier insertSource:a6 target:a3];
  [(KGMutableDirectedBinaryAdjacency *)self->_edgeIdentifiersByTargetNodeIdentifier insertSource:a7 target:a3];
  memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
  long long v23 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)memoryEdgeByIdentifier setObject:v21 forKeyedSubscript:v23];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v13;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        long long v30 = [(NSMutableDictionary *)self->_edgeIdentifiersByLabel objectForKeyedSubscript:v29];
        if (!v30)
        {
          long long v30 = objc_alloc_init(KGMutableElementIdentifierSet);
          [(NSMutableDictionary *)self->_edgeIdentifiersByLabel setObject:v30 forKeyedSubscript:v29];
        }
        [(KGMutableElementIdentifierSet *)v30 addIdentifier:a3];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v26);
  }

  self->_nextEdgeIdentifier = a3 + 1;
  os_unfair_lock_unlock(&self->_lock);

  return v21;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v5;
  uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v49;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v6;
        id v7 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
        unint64_t nextEdgeIdentifier = self->_nextEdgeIdentifier;
        self->_unint64_t nextEdgeIdentifier = nextEdgeIdentifier + 1;
        uint64_t v39 = [v7 labels];
        memoryNodeByIdentifier = self->_memoryNodeByIdentifier;
        id v10 = NSNumber;
        uint64_t v11 = [v7 sourceNode];
        uint64_t v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier"));
        uint64_t v13 = [(NSMutableDictionary *)memoryNodeByIdentifier objectForKeyedSubscript:v12];

        id v14 = self->_memoryNodeByIdentifier;
        id v15 = NSNumber;
        uint64_t v16 = [v7 targetNode];
        uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
        uint64_t v18 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v17];

        uint64_t v19 = [KGMemoryEdge alloc];
        v42 = v7;
        uint64_t v20 = [v7 properties];
        v40 = (void *)v18;
        v41 = (void *)v13;
        uint64_t v21 = [(KGMemoryEdge *)v19 initWithIdentifier:nextEdgeIdentifier labels:v39 properties:v20 sourceNode:v13 targetNode:v18];

        memoryEdgeByIdentifier = self->_memoryEdgeByIdentifier;
        long long v23 = [NSNumber numberWithUnsignedInteger:nextEdgeIdentifier];
        [(NSMutableDictionary *)memoryEdgeByIdentifier setObject:v21 forKeyedSubscript:v23];

        edgeIdentifiersBySourceNodeIdentifier = self->_edgeIdentifiersBySourceNodeIdentifier;
        uint64_t v25 = [(KGMemoryEdge *)v21 sourceNode];
        -[KGMutableDirectedBinaryAdjacency insertSource:target:](edgeIdentifiersBySourceNodeIdentifier, "insertSource:target:", [v25 identifier], nextEdgeIdentifier);

        edgeIdentifiersByTargetNodeIdentifier = self->_edgeIdentifiersByTargetNodeIdentifier;
        uint64_t v27 = [(KGMemoryEdge *)v21 targetNode];
        -[KGMutableDirectedBinaryAdjacency insertSource:target:](edgeIdentifiersByTargetNodeIdentifier, "insertSource:target:", [v27 identifier], nextEdgeIdentifier);

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v28 = v39;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              long long v34 = [(NSMutableDictionary *)self->_edgeIdentifiersByLabel objectForKeyedSubscript:v33];
              if (!v34)
              {
                long long v34 = objc_alloc_init(KGMutableElementIdentifierSet);
                [(NSMutableDictionary *)self->_edgeIdentifiersByLabel setObject:v34 forKeyedSubscript:v33];
              }
              [(KGMutableElementIdentifierSet *)v34 addIdentifier:nextEdgeIdentifier];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v30);
        }

        objc_msgSend(v42, "resolveIdentifier:", -[KGMemoryEdge identifier](v21, "identifier"));
        uint64_t v6 = v43 + 1;
      }
      while (v43 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v38);
  }

  os_unfair_lock_unlock(&self->_lock);
  return 1;
}

- (BOOL)noFatalError
{
  return 1;
}

- (NSUUID)graphIdentifier
{
  graphIdentifier = self->_graphIdentifier;
  if (!graphIdentifier)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = self->_graphIdentifier;
    self->_graphIdentifier = v4;

    graphIdentifier = self->_graphIdentifier;
  }
  return graphIdentifier;
}

- (KGMemoryGraphStore)init
{
  v2 = [(KGMemoryGraphStore *)self initForSubclasses];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    graphIdentifier = v2->_graphIdentifier;
    v2->_graphIdentifier = (NSUUID *)v3;
  }
  return v2;
}

- (id)initForSubclasses
{
  v16.receiver = self;
  v16.super_class = (Class)KGMemoryGraphStore;
  v2 = [(KGMemoryGraphStore *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    memoryNodeByIdentifier = v2->_memoryNodeByIdentifier;
    v2->_memoryNodeByIdentifier = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    nodeIdentifiersByLabel = v2->_nodeIdentifiersByLabel;
    v2->_nodeIdentifiersByLabel = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    memoryEdgeByIdentifier = v2->_memoryEdgeByIdentifier;
    v2->_memoryEdgeByIdentifier = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    edgeIdentifiersByLabel = v2->_edgeIdentifiersByLabel;
    v2->_edgeIdentifiersByLabel = (NSMutableDictionary *)v9;

    v2->_unint64_t nextNodeIdentifier = 1;
    v2->_unint64_t nextEdgeIdentifier = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
    edgeIdentifiersBySourceNodeIdentifier = v2->_edgeIdentifiersBySourceNodeIdentifier;
    v2->_edgeIdentifiersBySourceNodeIdentifier = v11;

    uint64_t v13 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
    edgeIdentifiersByTargetNodeIdentifier = v2->_edgeIdentifiersByTargetNodeIdentifier;
    v2->_edgeIdentifiersByTargetNodeIdentifier = v13;
  }
  return v2;
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return 1;
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return 1;
}

+ (NSString)persistentStoreFileExtension
{
  return 0;
}

@end