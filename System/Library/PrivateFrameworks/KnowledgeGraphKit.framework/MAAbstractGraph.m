@interface MAAbstractGraph
- (MAAbstractGraph)init;
- (id)insertEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 minimum:(unint64_t)a6 maximum:(unint64_t)a7 directed:(BOOL)a8;
- (id)insertNodeWithLabel:(id)a3;
@end

@implementation MAAbstractGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (id)insertEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 minimum:(unint64_t)a6 maximum:(unint64_t)a7 directed:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5384;
  v43 = __Block_byref_object_dispose__5385;
  id v44 = 0;
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __86__MAAbstractGraph_insertEdgeWithLabel_sourceNode_targetNode_minimum_maximum_directed___block_invoke;
  v35 = &unk_1E68DC798;
  id v17 = v16;
  id v36 = v17;
  id v18 = v14;
  id v37 = v18;
  v38 = &v39;
  [v15 enumerateEdgesUsingBlock:&v32];
  v19 = (void *)v40[5];
  if (!v19)
  {
    v20 = [MAAbstractEdge alloc];
    LOBYTE(v31) = a8;
    LODWORD(v21) = 1.0;
    uint64_t v22 = -[MAAbstractEdge initWithLabel:sourceNode:targetNode:domain:weight:minimum:maximum:directed:](v20, "initWithLabel:sourceNode:targetNode:domain:weight:minimum:maximum:directed:", v18, v15, v17, 1, a6, a7, v21, v31, v32, v33, v34, v35, v36);
    v23 = (void *)v40[5];
    v40[5] = v22;

    uint64_t v24 = [(NSMutableArray *)self->_edges count];
    [(id)v40[5] setIdentifier:v24 + 1];
    [(NSMutableArray *)self->_edges addObject:v40[5]];
    v25 = [(id)v40[5] sourceNode];
    v26 = [v25 implementation];

    [v26 addEdge:v40[5]];
    if (([(id)v40[5] isLoop] & 1) == 0)
    {
      v27 = [(id)v40[5] targetNode];
      v28 = [v27 implementation];

      [v28 addEdge:v40[5]];
    }

    v19 = (void *)v40[5];
  }
  id v29 = v19;

  _Block_object_dispose(&v39, 8);
  return v29;
}

void __86__MAAbstractGraph_insertEdgeWithLabel_sourceNode_targetNode_minimum_maximum_directed___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  v6 = [v9 label];
  v7 = [v9 targetNode];
  if (![v7 isSameNodeAsNode:a1[4]])
  {

    goto LABEL_8;
  }
  if (v6 == (void *)a1[5])
  {

    goto LABEL_7;
  }
  char v8 = objc_msgSend(v6, "isEqualToString:");

  if (v8)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
LABEL_8:
}

- (id)insertNodeWithLabel:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_nodes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "label", (void)v17);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v12 = v4;
LABEL_12:
          id v15 = v10;

          goto LABEL_13;
        }
        v12 = v11;
        if ([v11 isEqualToString:v4]) {
          goto LABEL_12;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v13 = [MAAbstractNode alloc];
  LODWORD(v14) = 1.0;
  id v15 = [(MAAbstractNode *)v13 initWithLabel:v4 domain:1 weight:MEMORY[0x1E4F1CC08] properties:v14];
  [(MANode *)v15 setIdentifier:[(NSMutableArray *)self->_nodes count] + 1];
  [(NSMutableArray *)self->_nodes addObject:v15];
LABEL_13:

  return v15;
}

- (MAAbstractGraph)init
{
  v8.receiver = self;
  v8.super_class = (Class)MAAbstractGraph;
  v2 = [(MAAbstractGraph *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nodes = v2->_nodes;
    v2->_nodes = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    edges = v2->_edges;
    v2->_edges = v5;
  }
  return v2;
}

@end