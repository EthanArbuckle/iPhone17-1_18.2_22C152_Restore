@interface MASubGraph
+ (id)subGraphIntersectionsWithSubGraphs:(id)a3;
+ (id)subGraphWithGraph:(id)a3;
- (MAGraph)graph;
- (MASubGraph)init;
- (id)allEdges;
- (id)allNamedEdges;
- (id)allNamedNodes;
- (id)allNodes;
- (id)description;
- (id)edgeForIdentifier:(unint64_t)a3;
- (id)edgesForLabel:(id)a3;
- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)edgesForName:(id)a3;
- (id)edgesLabels;
- (id)edgesNames;
- (id)graphRepresentation;
- (id)nodeForIdentifier:(unint64_t)a3;
- (id)nodesForLabel:(id)a3;
- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (id)nodesForName:(id)a3;
- (id)nodesForName:(id)a3 fromNode:(id)a4;
- (id)nodesForNames:(id)a3;
- (id)nodesLabels;
- (id)nodesNames;
- (unint64_t)edgesCount;
- (unint64_t)edgesCountForLabel:(id)a3;
- (unint64_t)edgesCountForName:(id)a3;
- (unint64_t)nodesCount;
- (unint64_t)nodesCountForLabel:(id)a3;
- (unint64_t)nodesCountForName:(id)a3;
- (unint64_t)nodesCountForName:(id)a3 fromNode:(id)a4;
- (void)_addEdge:(id)a3 withName:(id)a4;
- (void)_addNode:(id)a3 withName:(id)a4;
- (void)_addNode:(id)a3 withName:(id)a4 forKeyNode:(id)a5;
- (void)addEdges:(id)a3 withName:(id)a4;
- (void)addNodes:(id)a3 withName:(id)a4;
- (void)enumerateEdgesByNameUsingBlock:(id)a3;
- (void)enumerateEdgesWithBlock:(id)a3;
- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateEdgesWithName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesByNameUsingBlock:(id)a3;
- (void)enumerateNodesWithBlock:(id)a3;
- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5;
- (void)enumerateNodesWithName:(id)a3 fromNode:(id)a4 usingBlock:(id)a5;
- (void)enumerateNodesWithName:(id)a3 usingBlock:(id)a4;
- (void)mergeWithSubGraph:(id)a3;
@end

@implementation MASubGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByNameGroupByNodes, 0);
  objc_storeStrong((id *)&self->_edgesByName, 0);
  objc_storeStrong((id *)&self->_edgesByLabel, 0);
  objc_storeStrong((id *)&self->_edgesByIdentifier, 0);
  objc_storeStrong((id *)&self->_nodesByName, 0);
  objc_storeStrong((id *)&self->_nodesByLabel, 0);
  objc_storeStrong((id *)&self->_nodesByIdentifier, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (MAGraph)graph
{
  return self->_graph;
}

- (id)graphRepresentation
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = +[MAGraph graph];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v44 = self;
  obuint64_t j = [(NSMutableDictionary *)self->_nodesByName objectEnumerator];
  uint64_t v50 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v67;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v5;
        v6 = *(void **)(*((void *)&v66 + 1) + 8 * v5);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v63 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              v13 = [v12 label];
              uint64_t v14 = [v12 domain];
              v15 = [v12 propertyDictionary];
              LODWORD(v16) = 1.0;
              v17 = [v4 addUniqueNodeWithLabel:v13 domain:v14 weight:v15 properties:0 didCreate:v16];

              v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
              [v3 setObject:v17 forKey:v18];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v62 objects:v72 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v52 + 1;
      }
      while (v52 + 1 != v50);
      uint64_t v50 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v50);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v19 = [(NSMutableDictionary *)v44->_edgesByName objectEnumerator];
  id obja = (id)[v19 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (obja)
  {
    uint64_t v20 = *(void *)v59;
    uint64_t v45 = *(void *)v59;
    v51 = v19;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v19);
        }
        uint64_t v49 = v21;
        v22 = *(void **)(*((void *)&v58 + 1) + 8 * v21);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v70 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v53 = *(void *)v55;
          while (2)
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v55 != v53) {
                objc_enumerationMutation(v23);
              }
              v27 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              v28 = NSNumber;
              v29 = [v27 sourceNode];
              v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "identifier"));
              v31 = [v3 objectForKey:v30];

              v32 = NSNumber;
              v33 = [v27 targetNode];
              v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "identifier"));
              v35 = [v3 objectForKey:v34];

              if (v31) {
                BOOL v36 = v35 == 0;
              }
              else {
                BOOL v36 = 1;
              }
              if (v36)
              {
                [MEMORY[0x1E4F1CA00] raise:@"MASubGraphInvalidGraph", @"Graph invalid for edge \"%@\"", v27 format];

                id v42 = 0;
                goto LABEL_35;
              }
              v37 = [v27 label];
              uint64_t v38 = [v27 domain];
              v39 = [v27 propertyDictionary];
              LODWORD(v40) = 1.0;
              id v41 = (id)[v4 addUniqueEdgeWithLabel:v37 sourceNode:v31 targetNode:v35 domain:v38 weight:v39 properties:v40];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v70 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        uint64_t v21 = v49 + 1;
        uint64_t v20 = v45;
        v19 = v51;
      }
      while ((id)(v49 + 1) != obja);
      id obja = (id)[v51 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (obja);
  }

  id v42 = v4;
LABEL_35:

  return v42;
}

- (void)enumerateEdgesWithBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, char *))a3;
  char v27 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_edgesByLabel objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    unint64_t v9 = 0x1E4F1C000uLL;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = v9;
        v12 = [*(id *)(v9 + 2720) orderedSetWithOrderedSet:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v13);
              }
              v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * j), &v27);
              if (v27)
              {

                goto LABEL_18;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        unint64_t v9 = v11;
        uint64_t v8 = v18;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }
LABEL_18:
}

- (void)enumerateEdgesWithName:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void, char *))a4;
  char v19 = 0;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v8 = [(NSMutableDictionary *)self->_edgesByName objectForKey:a3];
  unint64_t v9 = [v7 orderedSetWithOrderedSet:v8];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v16 != v13) {
        objc_enumerationMutation(v10);
      }
      v6[2](v6, *(void *)(*((void *)&v15 + 1) + 8 * v14), &v19);
      if (v19) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateEdgesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  int v5 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, uint64_t, char *))a5;
  char v22 = 0;
  unint64_t v9 = (void *)MEMORY[0x1E4F1CAA0];
  id v10 = [(NSMutableDictionary *)self->_edgesByLabel objectForKey:a3];
  uint64_t v11 = [v9 orderedSetWithOrderedSet:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v19 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
      if (!v5 || objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "domain", (void)v18) == v5)
      {
        v8[2](v8, v17, &v22);
        if (v22) {
          break;
        }
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateEdgesByNameUsingBlock:(id)a3
{
  id v4 = a3;
  edgesByName = self->_edgesByName;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MASubGraph_enumerateEdgesByNameUsingBlock___block_invoke;
  v7[3] = &unk_1E68DC088;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)edgesByName enumerateKeysAndObjectsUsingBlock:v7];
}

void __45__MASubGraph_enumerateEdgesByNameUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [a3 set];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (id)allNamedEdges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(MASubGraph *)v2 edgesNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [(NSMutableDictionary *)v2->_edgesByName objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 unionOrderedSet:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  unint64_t v9 = [v3 set];

  objc_sync_exit(v2);
  return v9;
}

- (id)allEdges
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = [(NSMutableDictionary *)v2->_edgesByIdentifier allValues];
  uint64_t v5 = [v3 orderedSetWithArray:v4];

  uint64_t v6 = [v5 set];

  objc_sync_exit(v2);
  return v6;
}

- (id)edgesNames
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_edgesByName keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 hasPrefix:@"#"] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];

  return v10;
}

- (id)edgesLabels
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_edgesByLabel allKeys];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (unint64_t)edgesCountForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_edgesByName objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)edgesCountForLabel:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_edgesByLabel objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)edgesCount
{
  return [(NSMutableDictionary *)self->_edgesByIdentifier count];
}

- (id)edgesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  int v5 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  unint64_t v9 = [(NSMutableDictionary *)self->_edgesByLabel objectForKey:a3];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  if (v8) {
    BOOL v11 = [v8 count] == 0;
  }
  else {
    BOOL v11 = 1;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((!v5 || objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "domain", (void)v20) == v5)
          && (v11 || [v17 hasProperties:v8]))
        {
          objc_msgSend(v10, "addObject:", v17, (void)v20);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  long long v18 = [MEMORY[0x1E4F1CAD0] setWithSet:v10];

  return v18;
}

- (id)edgesForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_edgesByName objectForKey:a3];
  unint64_t v4 = [v3 set];

  return v4;
}

- (id)edgesForLabel:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_edgesByLabel objectForKey:a3];
  unint64_t v4 = [v3 set];

  return v4;
}

- (id)edgeForIdentifier:(unint64_t)a3
{
  edgesByIdentifier = self->_edgesByIdentifier;
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  int v5 = [(NSMutableDictionary *)edgesByIdentifier objectForKey:v4];

  return v5;
}

- (void)_addEdge:(id)a3 withName:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  edgesByIdentifier = v7->_edgesByIdentifier;
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
  [(NSMutableDictionary *)edgesByIdentifier setObject:v16 forKey:v9];

  edgesByLabel = v7->_edgesByLabel;
  BOOL v11 = [v16 label];
  id v12 = [(NSMutableDictionary *)edgesByLabel objectForKey:v11];

  if (!v12)
  {
    id v12 = [MEMORY[0x1E4F1CA70] orderedSet];
    uint64_t v13 = v7->_edgesByLabel;
    uint64_t v14 = [v16 label];
    [(NSMutableDictionary *)v13 setObject:v12 forKey:v14];
  }
  [v12 addObject:v16];
  uint64_t v15 = [(NSMutableDictionary *)v7->_edgesByName objectForKey:v6];
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA70] orderedSet];
    [(NSMutableDictionary *)v7->_edgesByName setObject:v15 forKey:v6];
  }
  [v15 addObject:v16];

  objc_sync_exit(v7);
}

- (void)addEdges:(id)a3 withName:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        -[MASubGraph _addEdge:withName:](v8, "_addEdge:withName:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)enumerateNodesWithName:(id)a3 fromNode:(id)a4 usingBlock:(id)a5
{
  if (a5)
  {
    nodesByNameGroupByNodes = self->_nodesByNameGroupByNodes;
    id v8 = a5;
    id v9 = a4;
    id v11 = [(NSMutableDictionary *)nodesByNameGroupByNodes objectForKey:a3];
    uint64_t v10 = [v11 objectForKey:v9];

    [v10 enumerateObjectsUsingBlock:v8];
  }
}

- (void)enumerateNodesWithBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    char v27 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    int v5 = [(NSMutableDictionary *)self->_nodesByLabel objectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      unint64_t v9 = 0x1E4F1C000uLL;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v11 = v9;
          uint64_t v12 = [*(id *)(v9 + 2720) orderedSetWithOrderedSet:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v20;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v20 != v16) {
                  objc_enumerationMutation(v13);
                }
                v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * j), &v27);
                if (v27)
                {

                  goto LABEL_19;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          unint64_t v9 = v11;
          uint64_t v8 = v18;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v7);
    }
LABEL_19:
  }
}

- (void)enumerateNodesWithName:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void, char *))a4;
  if (v6)
  {
    char v19 = 0;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAA0];
    uint64_t v8 = [(NSMutableDictionary *)self->_nodesByName objectForKey:a3];
    unint64_t v9 = [v7 orderedSetWithOrderedSet:v8];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        v6[2](v6, *(void *)(*((void *)&v15 + 1) + 8 * v14), &v19);
        if (v19) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateNodesWithLabel:(id)a3 domain:(unsigned __int16)a4 usingBlock:(id)a5
{
  int v5 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, uint64_t, char *))a5;
  if (v8)
  {
    char v22 = 0;
    unint64_t v9 = (void *)MEMORY[0x1E4F1CAA0];
    id v10 = [(NSMutableDictionary *)self->_nodesByLabel objectForKey:a3];
    uint64_t v11 = [v9 orderedSetWithOrderedSet:v10];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
        if (!v5 || objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "domain", (void)v18) == v5)
        {
          v8[2](v8, v17, &v22);
          if (v22) {
            break;
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateNodesByNameUsingBlock:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    nodesByName = self->_nodesByName;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MASubGraph_enumerateNodesByNameUsingBlock___block_invoke;
    v7[3] = &unk_1E68DC088;
    id v8 = v4;
    [(NSMutableDictionary *)nodesByName enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __45__MASubGraph_enumerateNodesByNameUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [a3 set];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (id)allNamedNodes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(MASubGraph *)v2 nodesNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [(NSMutableDictionary *)v2->_nodesByName objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 unionOrderedSet:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  unint64_t v9 = [v3 set];

  objc_sync_exit(v2);
  return v9;
}

- (id)allNodes
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = [(NSMutableDictionary *)v2->_nodesByIdentifier allValues];
  uint64_t v5 = [v3 orderedSetWithArray:v4];

  uint64_t v6 = [v5 set];

  objc_sync_exit(v2);
  return v6;
}

- (id)nodesNames
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_nodesByName keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 hasPrefix:@"#"] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];

  return v10;
}

- (id)nodesLabels
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_nodesByLabel allKeys];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (unint64_t)nodesCount
{
  return [(NSMutableDictionary *)self->_nodesByIdentifier count];
}

- (id)nodesForLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  int v5 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  unint64_t v9 = [(NSMutableDictionary *)self->_nodesByLabel objectForKey:a3];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  if (v8) {
    BOOL v11 = [v8 count] == 0;
  }
  else {
    BOOL v11 = 1;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((!v5 || objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "domain", (void)v20) == v5)
          && (v11 || [v17 hasProperties:v8]))
        {
          objc_msgSend(v10, "addObject:", v17, (void)v20);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  long long v18 = [MEMORY[0x1E4F1CAD0] setWithSet:v10];

  return v18;
}

- (unint64_t)nodesCountForName:(id)a3 fromNode:(id)a4
{
  nodesByNameGroupByNodes = self->_nodesByNameGroupByNodes;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)nodesByNameGroupByNodes objectForKey:a3];
  id v8 = [v7 objectForKey:v6];

  unint64_t v9 = [v8 count];
  return v9;
}

- (unint64_t)nodesCountForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_nodesByName objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)nodesCountForLabel:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_nodesByLabel objectForKey:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)nodesForName:(id)a3 fromNode:(id)a4
{
  nodesByNameGroupByNodes = self->_nodesByNameGroupByNodes;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)nodesByNameGroupByNodes objectForKey:a3];
  id v8 = [v7 objectForKey:v6];

  unint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithSet:v8];

  return v9;
}

- (id)nodesForNames:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = -[NSMutableDictionary objectForKey:](self->_nodesByName, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        id v12 = [v11 set];
        [v5 unionSet:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)nodesForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_nodesByName objectForKey:a3];
  id v4 = [v3 set];

  return v4;
}

- (id)nodesForLabel:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_nodesByLabel objectForKey:a3];
  id v4 = [v3 set];

  return v4;
}

- (id)nodeForIdentifier:(unint64_t)a3
{
  nodesByIdentifier = self->_nodesByIdentifier;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  int v5 = [(NSMutableDictionary *)nodesByIdentifier objectForKey:v4];

  return v5;
}

- (void)_addNode:(id)a3 withName:(id)a4 forKeyNode:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  BOOL v11 = [(NSMutableDictionary *)v10->_nodesByNameGroupByNodes objectForKey:v8];
  if (!v11)
  {
    BOOL v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    [(NSMutableDictionary *)v10->_nodesByNameGroupByNodes setObject:v11 forKey:v8];
  }
  id v12 = [v11 objectForKey:v9];
  if (!v12)
  {
    id v12 = [MEMORY[0x1E4F1CA80] set];
    [v11 setObject:v12 forKey:v9];
  }
  [v12 addObject:v13];

  objc_sync_exit(v10);
}

- (void)_addNode:(id)a3 withName:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  nodesByIdentifier = v7->_nodesByIdentifier;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
  [(NSMutableDictionary *)nodesByIdentifier setObject:v16 forKey:v9];

  nodesByLabel = v7->_nodesByLabel;
  BOOL v11 = [v16 label];
  id v12 = [(NSMutableDictionary *)nodesByLabel objectForKey:v11];

  if (!v12)
  {
    id v12 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v13 = v7->_nodesByLabel;
    long long v14 = [v16 label];
    [(NSMutableDictionary *)v13 setObject:v12 forKey:v14];
  }
  [v12 addObject:v16];
  long long v15 = [(NSMutableDictionary *)v7->_nodesByName objectForKey:v6];
  if (!v15)
  {
    long long v15 = [MEMORY[0x1E4F1CA70] orderedSet];
    [(NSMutableDictionary *)v7->_nodesByName setObject:v15 forKey:v6];
  }
  [v15 addObject:v16];

  objc_sync_exit(v7);
}

- (void)addNodes:(id)a3 withName:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        -[MASubGraph _addNode:withName:](v8, "_addNode:withName:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)mergeWithSubGraph:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  id v6 = (id *)v4;
  objc_sync_enter(v6);
  long long v26 = v6;
  p_isa = (id *)&v5->super.isa;
  id v7 = [(MASubGraph *)v5 graph];
  id v8 = [v6 graph];

  if (v7 == v8)
  {
    context = (void *)MEMORY[0x1D25FA040]();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __32__MASubGraph_mergeWithSubGraph___block_invoke;
    v37[3] = &unk_1E68DC060;
    v37[4] = v5;
    [v6 enumerateNodesByNameUsingBlock:v37];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __32__MASubGraph_mergeWithSubGraph___block_invoke_2;
    v36[3] = &unk_1E68DC060;
    v36[4] = v5;
    [v6 enumerateEdgesByNameUsingBlock:v36];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = [v6[8] keyEnumerator];
    uint64_t v25 = [v9 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v25)
    {
      obuint64_t j = v9;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v12 = [v26[8] objectForKey:v11];
          long long v13 = [p_isa[8] objectForKey:v11];
          if (v13)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v14 = [v12 keyEnumerator];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v29;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v29 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * j);
                  uint64_t v19 = [v12 objectForKey:v18];
                  long long v20 = [v13 objectForKey:v18];
                  long long v21 = v20;
                  if (v20) {
                    [v20 unionSet:v19];
                  }
                  else {
                    [v13 setObject:v19 forKey:v18];
                  }
                }
                uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
              }
              while (v15);
            }
          }
          else
          {
            [p_isa[8] setObject:v12 forKey:v11];
          }
        }
        id v9 = obj;
        uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v25);
    }

    id v6 = v26;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:@"MASubGraphInvalidGraph", @"SubGraph invalid for graph \"%@\"", v5->_graph format];
  }
  objc_sync_exit(v6);

  objc_sync_exit(p_isa);
}

uint64_t __32__MASubGraph_mergeWithSubGraph___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addNodes:a3 withName:a2];
}

uint64_t __32__MASubGraph_mergeWithSubGraph___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addEdges:a3 withName:a2];
}

- (id)description
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v4 = [(MASubGraph *)self nodesLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"[%@](%ld), ", *(void *)(*((void *)&v56 + 1) + 8 * i), -[MASubGraph nodesCountForLabel:](self, "nodesCountForLabel:", *(void *)(*((void *)&v56 + 1) + 8 * i))];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v6);
  }

  id v9 = [(MASubGraph *)self nodesLabels];
  uint64_t v10 = [v9 count];

  if (v10) {
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v12 = [(MASubGraph *)self edgesLabels];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(v12);
        }
        [v11 appendFormat:@"[%@](%ld), ", *(void *)(*((void *)&v52 + 1) + 8 * j), -[MASubGraph edgesCountForLabel:](self, "edgesCountForLabel:", *(void *)(*((void *)&v52 + 1) + 8 * j))];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v14);
  }

  long long v17 = [(MASubGraph *)self edgesLabels];
  uint64_t v18 = [v17 count];

  if (v18) {
    objc_msgSend(v11, "deleteCharactersInRange:", objc_msgSend(v11, "length") - 2, 2);
  }
  v43 = v3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v20 = [(MASubGraph *)self nodesNames];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v49 != v23) {
          objc_enumerationMutation(v20);
        }
        [v19 appendFormat:@"[%@](%ld), ", *(void *)(*((void *)&v48 + 1) + 8 * k), -[MASubGraph nodesCountForName:](self, "nodesCountForName:", *(void *)(*((void *)&v48 + 1) + 8 * k))];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v22);
  }

  uint64_t v25 = [(MASubGraph *)self nodesNames];
  uint64_t v26 = [v25 count];

  if (v26) {
    objc_msgSend(v19, "deleteCharactersInRange:", objc_msgSend(v19, "length") - 2, 2);
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v28 = [(MASubGraph *)self edgesNames];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        [v27 appendFormat:@"[%@](%ld), ", *(void *)(*((void *)&v44 + 1) + 8 * m), -[MASubGraph edgesCountForName:](self, "edgesCountForName:", *(void *)(*((void *)&v44 + 1) + 8 * m))];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v30);
  }

  long long v33 = [(MASubGraph *)self edgesNames];
  uint64_t v34 = [v33 count];

  if (v34) {
    objc_msgSend(v27, "deleteCharactersInRange:", objc_msgSend(v27, "length") - 2, 2);
  }
  id v42 = NSString;
  long long v35 = (objc_class *)objc_opt_class();
  BOOL v36 = NSStringFromClass(v35);
  v37 = [(MASubGraph *)self graph];
  uint64_t v38 = [v37 identifier];
  v39 = [v38 UUIDString];
  uint64_t v40 = [v42 stringWithFormat:@"[%@] id:[%@] nodesCount:[%ld] edgesCount:[%ld]\n\tnodesLabels:[%@]\n\tedgesLabels:[%@]\n\tnodesNames:[%@]\n\tedgesNames:[%@]", v36, v39, -[MASubGraph nodesCount](self, "nodesCount"), -[MASubGraph edgesCount](self, "edgesCount"), v43, v11, v19, v27];

  return v40;
}

- (MASubGraph)init
{
  v20.receiver = self;
  v20.super_class = (Class)MASubGraph;
  v2 = [(MASubGraph *)&v20 init];
  id v3 = v2;
  if (v2)
  {
    graph = v2->_graph;
    v2->_graph = 0;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nodesByIdentifier = v3->_nodesByIdentifier;
    v3->_nodesByIdentifier = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nodesByLabel = v3->_nodesByLabel;
    v3->_nodesByLabel = v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nodesByName = v3->_nodesByName;
    v3->_nodesByName = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    edgesByIdentifier = v3->_edgesByIdentifier;
    v3->_edgesByIdentifier = v11;

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    edgesByLabel = v3->_edgesByLabel;
    v3->_edgesByLabel = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    edgesByName = v3->_edgesByName;
    v3->_edgesByName = v15;

    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nodesByNameGroupByNodes = v3->_nodesByNameGroupByNodes;
    v3->_nodesByNameGroupByNodes = v17;
  }
  return v3;
}

+ (id)subGraphIntersectionsWithSubGraphs:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 graph];
  uint64_t v7 = [a1 subGraphWithGraph:v6];

  id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v10 = v4;
  uint64_t v54 = [v10 countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v90;
    long long v57 = v7;
    long long v51 = v10;
    long long v52 = v8;
    long long v50 = v9;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v90 != v53) {
          objc_enumerationMutation(v10);
        }
        uint64_t v12 = *(id **)(*((void *)&v89 + 1) + 8 * v11);
        uint64_t v13 = [v7 graph];
        uint64_t v14 = [v12 graph];

        if (v13 != v14)
        {
          long long v47 = (void *)MEMORY[0x1E4F1CA00];
          long long v48 = [v7 graph];
          [v47 raise:@"MASubGraphInvalidGraph", @"SubGraph invalid for graph \"%@\"", v48, v84, v87 format];

          long long v46 = 0;
          goto LABEL_48;
        }
        uint64_t v55 = v11;
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v87[0] = __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke;
        v87[1] = &unk_1E68DC060;
        id v60 = v8;
        id v88 = v60;
        [v12 enumerateNodesByNameUsingBlock:v86];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v84[0] = __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_2;
        v84[1] = &unk_1E68DC060;
        id v85 = v9;
        [v12 enumerateEdgesByNameUsingBlock:v83];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        obuint64_t j = [v12[8] keyEnumerator];
        uint64_t v61 = [obj countByEnumeratingWithState:&v79 objects:v96 count:16];
        if (v61)
        {
          uint64_t v58 = *(void *)v80;
          long long v59 = v12;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v80 != v58) {
                objc_enumerationMutation(obj);
              }
              uint64_t v62 = v15;
              uint64_t v16 = *(void *)(*((void *)&v79 + 1) + 8 * v15);
              long long v17 = [v60 objectForKey:v16];
              uint64_t v18 = [v12[8] objectForKey:v16];
              uint64_t v19 = [v7[8] objectForKey:v16];
              [MEMORY[0x1E4F1CA80] set];
              v64 = uint64_t v63 = v19;
              id v20 = (id)v19;
              if (!v19)
              {
                id v20 = v18;
                [v7[8] setObject:v20 forKey:v16];
              }
              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              uint64_t v21 = [v18 keyEnumerator];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v75 objects:v95 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v76;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v76 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v75 + 1) + 8 * i);
                    if ([v17 containsObject:v26])
                    {
                      if (v63)
                      {
                        id v27 = v18;
                        long long v28 = [v18 objectForKey:v26];
                        uint64_t v29 = [v20 objectForKey:v26];
                        uint64_t v30 = v29;
                        if (v29) {
                          [v29 unionSet:v28];
                        }
                        else {
                          [v20 setObject:v28 forKey:v26];
                        }

                        uint64_t v18 = v27;
                      }
                    }
                    else
                    {
                      [v64 addObject:v26];
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v75 objects:v95 count:16];
                }
                while (v23);
              }

              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_3;
              v73[3] = &unk_1E68DC550;
              id v74 = v20;
              id v31 = v20;
              [v64 enumerateObjectsUsingBlock:v73];

              uint64_t v15 = v62 + 1;
              uint64_t v7 = v57;
              uint64_t v12 = v59;
            }
            while (v62 + 1 != v61);
            uint64_t v61 = [obj countByEnumeratingWithState:&v79 objects:v96 count:16];
          }
          while (v61);
        }

        uint64_t v11 = v55 + 1;
        id v10 = v51;
        id v8 = v52;
        id v9 = v50;
      }
      while (v55 + 1 != v54);
      uint64_t v54 = [v51 countByEnumeratingWithState:&v89 objects:v97 count:16];
      if (v54) {
        continue;
      }
      break;
    }
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v32 = [v8 keyEnumerator];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v69 objects:v94 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v70 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v69 + 1) + 8 * j);
        uint64_t v38 = [v8 objectForKey:v37];
        [v7 addNodes:v38 withName:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v69 objects:v94 count:16];
    }
    while (v34);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v39 = [v9 keyEnumerator];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v93 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v65 + 1) + 8 * k);
        long long v45 = [v9 objectForKey:v44];
        [v7 addNodes:v45 withName:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v93 count:16];
    }
    while (v41);
  }

  long long v46 = v7;
LABEL_48:

  return v46;
}

void __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:v9];
  if (v7)
  {
    id v8 = v7;
    [v7 intersectSet:v6];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v6];

    [*(id *)(a1 + 32) setObject:v8 forKey:v9];
  }
}

void __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:v9];
  if (v7)
  {
    id v8 = v7;
    [v7 intersectSet:v6];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v6];

    [*(id *)(a1 + 32) setObject:v8 forKey:v9];
  }
}

void __49__MASubGraph_subGraphIntersectionsWithSubGraphs___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 32));
  for (uint64_t i = 0; NSNextMapEnumeratorPair(&enumerator, 0, &i); [i removeObject:v3])
    ;
  NSEndMapTableEnumeration(&enumerator);
}

+ (id)subGraphWithGraph:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

@end