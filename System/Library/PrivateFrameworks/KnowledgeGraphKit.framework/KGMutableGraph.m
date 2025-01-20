@interface KGMutableGraph
- (BOOL)_applyEdgeChangeRequests:(id)a3 error:(id *)a4;
- (BOOL)_applyNodeChangeRequests:(id)a3 error:(id *)a4;
- (BOOL)_performChangesAndWait:(id)a3 error:(id *)a4;
- (BOOL)performChangesAndWait:(id)a3 error:(id *)a4;
- (KGMutableGraph)initWithMutableImplementation:(id)a3 entityFactory:(id)a4;
- (OS_dispatch_queue)transactionQueue;
- (void)setTransactionQueue:(id)a3;
@end

@implementation KGMutableGraph

- (void).cxx_destruct
{
}

- (void)setTransactionQueue:(id)a3
{
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (BOOL)performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6469;
  v20 = __Block_byref_object_dispose__6470;
  id v21 = 0;
  transactionQueue = self->_transactionQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__KGMutableGraph_performChangesAndWait_error___block_invoke;
  v12[3] = &unk_1E68DCA48;
  v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  v15 = &v16;
  dispatch_sync(transactionQueue, v12);
  v9 = v23;
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    v9 = v23;
  }
  char v10 = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __46__KGMutableGraph_performChangesAndWait_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _performChangesAndWait:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_performChangesAndWait:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(KGMutableGraph *)self mutableImplementation];
  id v8 = [v6 nodesToInsert];
  int v9 = [v7 addNodes:v8 error:a4];

  if (!v9) {
    goto LABEL_8;
  }
  char v10 = [(KGMutableGraph *)self mutableImplementation];
  v11 = [v6 edgesToInsert];
  int v12 = [v10 addEdges:v11 error:a4];

  if (!v12) {
    goto LABEL_8;
  }
  id v13 = [v6 nodeUpdates];
  BOOL v14 = [(KGMutableGraph *)self _applyNodeChangeRequests:v13 error:a4];

  if (!v14) {
    goto LABEL_8;
  }
  v15 = [v6 edgeUpdates];
  BOOL v16 = [(KGMutableGraph *)self _applyEdgeChangeRequests:v15 error:a4];

  if (!v16) {
    goto LABEL_8;
  }
  v17 = [(KGMutableGraph *)self mutableImplementation];
  uint64_t v18 = [v6 edgeIdentifiersToRemove];
  int v19 = [v17 removeEdgesForIdentifiers:v18 error:a4];

  if (!v19) {
    goto LABEL_8;
  }
  v20 = [(KGMutableGraph *)self mutableImplementation];
  id v21 = [v6 nodeIdentifiersToRemove];
  char v22 = [v20 removeNodesForIdentifiers:v21 error:a4];

  if (v22)
  {
    BOOL v23 = 1;
  }
  else
  {
LABEL_8:
    uint64_t v24 = KGLoggingConnection();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v26 = *a4;
      int v27 = 138412290;
      id v28 = v26;
      _os_log_error_impl(&dword_1D1654000, v24, OS_LOG_TYPE_ERROR, "Error with applying mutations (%@)", (uint8_t *)&v27, 0xCu);
    }

    BOOL v23 = 0;
  }
  [v6 setResolved];

  return v23;
}

- (BOOL)_applyEdgeChangeRequests:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "edge", (void)v20);
        uint64_t v13 = [v12 identifier];

        uint64_t v14 = [v11 properties];
        if (v14)
        {
          v15 = (void *)v14;
          BOOL v16 = [(KGMutableGraph *)self mutableImplementation];
          int v17 = [v16 updateEdgeForIdentifier:v13 withProperties:v15 error:a4];

          if (!v17)
          {
            BOOL v18 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_12:

  return v18;
}

- (BOOL)_applyNodeChangeRequests:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "node", (void)v20);
        uint64_t v13 = [v12 identifier];

        uint64_t v14 = [v11 properties];
        if (v14)
        {
          v15 = (void *)v14;
          BOOL v16 = [(KGMutableGraph *)self mutableImplementation];
          int v17 = [v16 updateNodeForIdentifier:v13 withProperties:v15 error:a4];

          if (!v17)
          {
            BOOL v18 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_12:

  return v18;
}

- (KGMutableGraph)initWithMutableImplementation:(id)a3 entityFactory:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)KGMutableGraph;
  uint64_t v4 = [(KGGraph *)&v8 initWithImplementation:a3 entityFactory:a4];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.kgdb.changes", 0);
    transactionQueue = v4->_transactionQueue;
    v4->_transactionQueue = (OS_dispatch_queue *)v5;
  }
  return v4;
}

@end