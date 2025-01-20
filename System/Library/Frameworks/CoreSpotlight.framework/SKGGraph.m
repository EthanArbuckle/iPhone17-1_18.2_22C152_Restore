@interface SKGGraph
- (BOOL)addNodes:(id)a3 addEdges:(id)a4 cancelBlock:(id)a5;
- (BOOL)available;
- (BOOL)batchAddNodes:(id)a3 addEdges:(id)a4;
- (BOOL)clearWithCancelBlock:(id)a3;
- (BOOL)commitBatch;
- (BOOL)commitWithCancelBlock:(id)a3;
- (BOOL)flushWithCancelBlock:(id)a3;
- (BOOL)removeNodeSet:(id)a3 removeEdgeSet:(id)a4 cancelBlock:(id)a5;
- (SKGGraph)initWithResourceDirectoryPath:(id)a3;
- (id)graph;
- (id)graphURL;
- (id)nodesForNode:(id)a3;
- (id)resourceRoot;
- (int64_t)countOfNodesWithLabel:(id)a3;
- (int64_t)edgeCacheCount;
- (int64_t)edgeCount;
- (int64_t)nodeCacheCount;
- (int64_t)nodeCount;
- (void)closeGraph;
- (void)dealloc;
@end

@implementation SKGGraph

- (SKGGraph)initWithResourceDirectoryPath:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SKGGraph;
  v6 = [(SKGGraph *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourcePath, a3);
    v7->_currentAddedNodeCount = 0;
    v7->_currentAddedEdgeCount = 0;
    nodeBatch = v7->_nodeBatch;
    v7->_nodeBatch = 0;

    edgeBatch = v7->_edgeBatch;
    v7->_edgeBatch = 0;

    v11 = objc_alloc_init(SKGGraphSpecification);
    id v12 = objc_alloc((Class)MAGraph);
    v13 = [(SKGGraph *)v7 graphURL];
    v14 = +[MAProgressReporter ignoreProgress];
    v15 = (MAGraph *)[v12 initWithSpecification:v11 persistenceStoreURL:v13 progressReporter:v14];
    graph = v7->_graph;
    v7->_graph = v15;

    v17 = v7->_graph;
    if (v17 && (unsigned int v18 = [(MAGraph *)v17 noFatalError], v17 = v7->_graph, v18))
    {
      [(MAGraph *)v17 enterBatch];
    }
    else
    {
      v7->_graph = 0;
    }
  }

  return v7;
}

- (id)resourceRoot
{
  return +[NSURL URLWithString:self->_resourcePath];
}

- (id)graphURL
{
  v2 = +[NSString stringWithFormat:@"%@/%@", self->_resourcePath, @"kg"];
  v3 = +[NSURL URLWithString:v2];

  return v3;
}

- (id)graph
{
  return self->_graph;
}

- (BOOL)available
{
  graph = self->_graph;
  if (graph) {
    LOBYTE(graph) = [(MAGraph *)graph noFatalError];
  }
  return (char)graph;
}

- (BOOL)clearWithCancelBlock:(id)a3
{
  BOOL v4 = [(SKGGraph *)self available];
  if (v4)
  {
    v6 = +[SKGNodes nodesInGraph:self];
    if ([v6 count])
    {
      id v7 = objc_alloc_init((Class)MAGraphChangeRequest);
      [v7 removeNodes:v6];
      v8 = [(SKGGraph *)self graph];
      [v8 executeGraphChangeRequest:v7];
    }
  }
  return v4;
}

- (BOOL)flushWithCancelBlock:(id)a3
{
  BOOL v4 = [(SKGGraph *)self available];
  if (v4)
  {
    v6 = [(SKGGraph *)self graph];
    [v6 leaveBatch];

    id v7 = [(SKGGraph *)self graph];
    [v7 enterBatch];

    self->_currentAddedNodeCount = 0;
    self->_currentAddedEdgeCount = 0;
  }
  return v4;
}

- (BOOL)commitWithCancelBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SKGGraph *)self available];
  if (v5) {
    [(SKGGraph *)self flushWithCancelBlock:v4];
  }

  return v5;
}

- (BOOL)addNodes:(id)a3 addEdges:(id)a4 cancelBlock:(id)a5
{
  id v55 = a3;
  id v54 = a4;
  v66 = (uint64_t (**)(id, const __CFString *))a5;
  v69 = self;
  if ([(SKGGraph *)self available])
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id obj = v55;
    id v8 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v87;
      uint64_t v65 = 0;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v87 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          id v12 = +[SKGNodes nodesWithNode:v11 inGraph:v69];
          if (![v12 count])
          {
            uint8_t buf = 0;
            v13 = [(SKGGraph *)v69 graph];
            v14 = [v11 label];
            id v15 = [v11 domain];
            [v11 weight];
            int v17 = v16;
            unsigned int v18 = [v11 propertyDictionary];
            LODWORD(v19) = v17;
            id v20 = [v13 addUniqueNodeWithLabel:v14 domain:v15 weight:v18 properties:&buf didCreate:v19];

            unsigned int v21 = [(SKGGraph *)v69 available];
            if ((v21 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1000A0460();
              }
              [(SKGGraph *)v69 closeGraph];
LABEL_21:

              int v22 = v21 ^ 1;
              goto LABEL_22;
            }
            if (v66 && (v66[2](v66, @"addNodes") & 1) != 0) {
              goto LABEL_21;
            }
            v65 += buf;
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v65 = 0;
    }
    unsigned int v21 = 1;
    int v22 = 1;
LABEL_22:

    if ((v21 & v22) == 1)
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v57 = v54;
      id v23 = [v57 countByEnumeratingWithState:&v82 objects:v92 count:16];
      if (!v23)
      {
        v53 = 0;
        unsigned int v21 = 1;
        int v22 = 1;
        goto LABEL_71;
      }
      uint64_t v61 = *(void *)v83;
      v53 = 0;
      unsigned int v21 = 1;
      int v22 = 1;
      while (1)
      {
        v24 = 0;
        id v63 = v23;
        do
        {
          if (*(void *)v83 != v61) {
            objc_enumerationMutation(v57);
          }
          v25 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v24);
          id obja = +[SKGEdges edgesWithEdge:v25 inGraph:v69];
          if (![obja count])
          {
            v28 = [v25 sourceNode];
            v64 = [(SKGGraph *)v69 nodesForNode:v28];

            v29 = [v25 targetNode];
            v62 = [(SKGGraph *)v69 nodesForNode:v29];

            if ([v64 count] && objc_msgSend(v62, "count") && -[SKGGraph available](v69, "available"))
            {
              if (v66) {
                int v22 = ((uint64_t (*)(void))v66[2])() ^ 1;
              }
              else {
                int v22 = 1;
              }
              if ((v21 & v22) == 1)
              {
                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                id v30 = v64;
                v50 = v30;
                id v47 = [v30 countByEnumeratingWithState:&v76 objects:v91 count:16];
                if (v47)
                {
                  uint64_t v48 = *(void *)v77;
                  do
                  {
                    for (j = 0; j != v47; j = (char *)j + 1)
                    {
                      if (*(void *)v77 != v48) {
                        objc_enumerationMutation(v30);
                      }
                      uint64_t v60 = *(void *)(*((void *)&v76 + 1) + 8 * (void)j);
                      long long v72 = 0u;
                      long long v73 = 0u;
                      long long v74 = 0u;
                      long long v75 = 0u;
                      id v56 = v62;
                      v31 = (char *)[v56 countByEnumeratingWithState:&v72 objects:v90 count:16];
                      if (v31)
                      {
                        uint64_t v59 = *(void *)v73;
                        v32 = v53;
                        while (2)
                        {
                          v33 = 0;
                          v49 = v32;
                          v58 = v31;
                          v53 = &v31[(void)v32];
                          do
                          {
                            if (*(void *)v73 != v59) {
                              objc_enumerationMutation(v56);
                            }
                            uint64_t v34 = *(void *)(*((void *)&v72 + 1) + 8 * (void)v33);
                            v35 = [v25 score];
                            v36 = [(SKGGraph *)v69 graph];
                            v37 = [v25 label];
                            id v38 = [v25 domain];
                            [v35 doubleValue];
                            double v40 = v39;
                            v41 = [v25 propertyDictionary];
                            *(float *)&double v42 = v40;
                            id v43 = [v36 addEdgeWithLabel:v37 sourceNode:v60 targetNode:v34 domain:v38 weight:v41 properties:v42];

                            if (![(SKGGraph *)v69 available])
                            {
                              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                                sub_1000A041C(&v70, v71);
                              }
                              [(SKGGraph *)v69 closeGraph];

                              unsigned int v21 = 0;
                              id v30 = v50;
                              v53 = &v33[(void)v49];
                              goto LABEL_66;
                            }

                            ++v33;
                          }
                          while (v58 != v33);
                          v31 = (char *)[v56 countByEnumeratingWithState:&v72 objects:v90 count:16];
                          v32 = v53;
                          if (v31) {
                            continue;
                          }
                          break;
                        }
                      }

                      id v30 = v50;
                    }
                    unsigned int v21 = 1;
                    id v47 = [v50 countByEnumeratingWithState:&v76 objects:v91 count:16];
                  }
                  while (v47);
                }
                else
                {
                  unsigned int v21 = 1;
                }
LABEL_66:

                int v27 = 0;
                int v22 = 1;
                goto LABEL_39;
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1000A03D8(&buf, v81);
              }
              [(SKGGraph *)v69 closeGraph];
              unsigned int v21 = 0;
            }
            int v27 = 4;
LABEL_39:

            goto LABEL_40;
          }
          int v27 = 5;
LABEL_40:

          if (v27 != 5 && v27) {
            goto LABEL_71;
          }
          v24 = (char *)v24 + 1;
        }
        while (v24 != v63);
        id v23 = [v57 countByEnumeratingWithState:&v82 objects:v92 count:16];
        if (!v23)
        {
LABEL_71:

          goto LABEL_72;
        }
      }
    }
    v53 = 0;
LABEL_72:
    if (v21 & v22)
    {
      unint64_t v44 = v69->_currentAddedNodeCount + v65;
      unint64_t v45 = (unint64_t)&v53[v69->_currentAddedEdgeCount];
      v69->_currentAddedNodeCount = v44;
      v69->_currentAddedEdgeCount = v45;
      if (v44 > 0x3E7 || v45 >= 0x3E8) {
        LOBYTE(v21) = [(SKGGraph *)v69 flushWithCancelBlock:v66];
      }
      else {
        LOBYTE(v21) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21 & 1;
}

- (BOOL)removeNodeSet:(id)a3 removeEdgeSet:(id)a4 cancelBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(SKGGraph *)self available])
  {
    id v10 = objc_alloc_init((Class)MAGraphChangeRequest);
    v11 = v10;
    if (v7) {
      [v10 removeNodes:v7];
    }
    if (v8) {
      [v11 removeEdges:v8];
    }
    id v12 = [(SKGGraph *)self graph];
    [v12 executeGraphChangeRequest:v11];

    BOOL v13 = [(SKGGraph *)self available];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)batchAddNodes:(id)a3 addEdges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SKGGraph *)self available])
  {
    if (v6)
    {
      nodeBatch = self->_nodeBatch;
      if (!nodeBatch)
      {
        id v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v11 = self->_nodeBatch;
        self->_nodeBatch = v10;

        nodeBatch = self->_nodeBatch;
      }
      [(NSMutableSet *)nodeBatch addObjectsFromArray:v6];
    }
    if (v7)
    {
      edgeBatch = self->_edgeBatch;
      if (!edgeBatch)
      {
        BOOL v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v14 = self->_edgeBatch;
        self->_edgeBatch = v13;

        edgeBatch = self->_edgeBatch;
      }
      [(NSMutableSet *)edgeBatch addObjectsFromArray:v7];
    }
    BOOL v15 = [(SKGGraph *)self available];
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)commitBatch
{
  BOOL v3 = [(SKGGraph *)self available];
  if (v3)
  {
    if (self->_nodeBatch || self->_edgeBatch)
    {
      id v5 = objc_alloc_init((Class)MAGraphChangeRequest);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = self->_nodeBatch;
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v21;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v6);
            }
            [v5 addNode:*(void *)(*((void *)&v20 + 1) + 8 * (void)v9)];
            uint64_t v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v7);
      }

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = self->_edgeBatch;
      id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v17;
        do
        {
          BOOL v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(v5, "addEdge:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v13), (void)v16);
            BOOL v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v11);
      }

      v14 = [(SKGGraph *)self graph];
      [v14 executeGraphChangeRequest:v5];
    }
    LOBYTE(v3) = [(SKGGraph *)self available];
  }
  return v3;
}

- (id)nodesForNode:(id)a3
{
  id v4 = a3;
  if ([(SKGGraph *)self available])
  {
    uint64_t v12 = 0;
    BOOL v13 = &v12;
    uint64_t v14 = 0x3032000000;
    BOOL v15 = sub_100012644;
    long long v16 = sub_100012540;
    id v17 = 0;
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(SKGGraph *)self graph];
    id v7 = [v4 filter];
    uint64_t v8 = [v6 nodeIdentifiersMatchingFilter:v7];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100026EB0;
    v11[3] = &unk_1000D9BD8;
    v11[4] = self;
    v11[5] = &v12;
    [v8 enumerateIdentifiersWithBlock:v11];

    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = &__NSArray0__struct;
  }

  return v9;
}

- (int64_t)countOfNodesWithLabel:(id)a3
{
  id v4 = a3;
  if ([(SKGGraph *)self available])
  {
    id v5 = [(SKGGraph *)self graph];
    int64_t v6 = (int64_t)[v5 nodesCountForLabel:v4];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (int64_t)nodeCount
{
  if (![(SKGGraph *)self available]) {
    return -1;
  }
  BOOL v3 = [(SKGGraph *)self graph];
  id v4 = [v3 nodesCount];

  return (int64_t)v4;
}

- (int64_t)nodeCacheCount
{
  return 0;
}

- (int64_t)edgeCount
{
  if (![(SKGGraph *)self available]) {
    return -1;
  }
  BOOL v3 = [(SKGGraph *)self graph];
  id v4 = [v3 edgesCount];

  return (int64_t)v4;
}

- (int64_t)edgeCacheCount
{
  return 0;
}

- (void)closeGraph
{
  [(SKGGraph *)self commitWithCancelBlock:0];
  graph = self->_graph;
  if (graph)
  {
    [(MAGraph *)graph leaveBatch];
    [(MAGraph *)self->_graph closePersistentStore];
    id v4 = self->_graph;
    self->_graph = 0;
  }
}

- (void)dealloc
{
  [(SKGGraph *)self closeGraph];
  v3.receiver = self;
  v3.super_class = (Class)SKGGraph;
  [(SKGGraph *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_edgeBatch, 0);
  objc_storeStrong((id *)&self->_nodeBatch, 0);

  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end