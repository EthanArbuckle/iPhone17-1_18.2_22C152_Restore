@interface CLSGraph
- (BOOL)containsVertex:(id)a3;
- (BOOL)containsVertexWithVertexID:(id)a3;
- (BOOL)hasEdgeFromVertex:(id)a3 toVertex:(id)a4;
- (CLSGraph)init;
- (CLSGraph)initWithMemoryOptions:(unint64_t)a3;
- (CLSGraphVertex)anyVertex;
- (id)inNeighboursOfVertex:(id)a3;
- (id)neighboursOfVertex:(id)a3;
- (id)outNeighboursOfVertex:(id)a3;
- (id)vertexWithVertexID:(id)a3;
- (unint64_t)_degreeOfVertex:(id)a3 inEdgeMap:(id)a4;
- (unint64_t)degree:(id)a3;
- (unint64_t)edgeCount;
- (unint64_t)inDegree:(id)a3;
- (unint64_t)outDegree:(id)a3;
- (unint64_t)vertexCount;
- (void)_enumerateVerticesInEdges:(id)a3 skipingEdges:(id)a4 enumerationBlock:(id)a5;
- (void)_removeEdgeFromVertexWithID:(id)a3 toVertexWithID:(id)a4;
- (void)_traverseStartingAtVertex:(id)a3 previousVertex:(id)a4 visitedVertices:(id)a5 enumerationBlock:(id)a6;
- (void)addEdgeFromVertex:(id)a3 toVertex:(id)a4;
- (void)addVertex:(id)a3;
- (void)enumerate:(id)a3;
- (void)enumerateInNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4;
- (void)enumerateNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4;
- (void)enumerateOutNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4;
- (void)removeEdgeFromVertex:(id)a3 toVertex:(id)a4;
- (void)removeSubtreeStartingAtVertex:(id)a3;
- (void)removeVertex:(id)a3;
- (void)reset;
- (void)traverse:(id)a3;
- (void)traverseStartingAtVertex:(id)a3 enumerationBlock:(id)a4;
- (void)traverseVerticesPassingTest:(id)a3 enumerationBlock:(id)a4;
@end

@implementation CLSGraph

- (CLSGraph)init
{
  return (CLSGraph *)MEMORY[0x1F4181798](self, sel_initWithMemoryOptions_, 0);
}

- (CLSGraph)initWithMemoryOptions:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CLSGraph;
  v4 = [(CLSGraph *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    id v6 = objc_alloc(MEMORY[0x1E4F28E10]);
    uint64_t v8 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v6, v7, a3, v5->_options, 50);
    verticesMap = v5->_verticesMap;
    v5->_verticesMap = (NSMapTable *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F28E10]);
    uint64_t v12 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v10, v11, a3, v5->_options, 50);
    inEdgesMap = v5->_inEdgesMap;
    v5->_inEdgesMap = (NSMapTable *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F28E10]);
    uint64_t v16 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v14, v15, a3, v5->_options, 50);
    outEdgesMap = v5->_outEdgesMap;
    v5->_outEdgesMap = (NSMapTable *)v16;
  }
  return v5;
}

- (unint64_t)vertexCount
{
  return objc_msgSend_count(self->_verticesMap, a2, v2);
}

- (unint64_t)edgeCount
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_outEdgesMap;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v18, v22, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1E01A0360](v5);
        v13 = objc_msgSend_objectForKey_(self->_outEdgesMap, v12, v10, (void)v18);
        v7 += objc_msgSend_count(v13, v14, v15);

        ++v9;
      }
      while (v6 != v9);
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v16, (uint64_t)&v18, v22, 16);
      uint64_t v6 = v5;
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)reset
{
  objc_msgSend_removeAllObjects(self->_inEdgesMap, a2, v2);
  objc_msgSend_removeAllObjects(self->_outEdgesMap, v4, v5);
  verticesMap = self->_verticesMap;

  objc_msgSend_removeAllObjects(verticesMap, v6, v7);
}

- (CLSGraphVertex)anyVertex
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, sizeof(v11));
  v3 = self->_verticesMap;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)v11, v12, 16);
  if (v5)
  {
    uint64_t v6 = **((void **)&v11[0] + 1);
    uint64_t v7 = (void *)MEMORY[0x1E01A0360](v5);
    uint64_t v9 = objc_msgSend_objectForKey_(self->_verticesMap, v8, v6, *(void *)&v11[0]);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (CLSGraphVertex *)v9;
}

- (unint64_t)degree:(id)a3
{
  inEdgesMap = self->_inEdgesMap;
  id v5 = a3;
  uint64_t v7 = objc_msgSend__degreeOfVertex_inEdgeMap_(self, v6, (uint64_t)v5, inEdgesMap);
  uint64_t v9 = objc_msgSend__degreeOfVertex_inEdgeMap_(self, v8, (uint64_t)v5, self->_outEdgesMap);

  return v9 + v7;
}

- (unint64_t)inDegree:(id)a3
{
  return objc_msgSend__degreeOfVertex_inEdgeMap_(self, a2, (uint64_t)a3, self->_inEdgesMap);
}

- (unint64_t)outDegree:(id)a3
{
  return objc_msgSend__degreeOfVertex_inEdgeMap_(self, a2, (uint64_t)a3, self->_outEdgesMap);
}

- (unint64_t)_degreeOfVertex:(id)a3 inEdgeMap:(id)a4
{
  id v5 = a4;
  uint64_t v8 = objc_msgSend_vertexID(a3, v6, v7);
  uint64_t v10 = objc_msgSend_objectForKey_(v5, v9, (uint64_t)v8);

  unint64_t v13 = objc_msgSend_count(v10, v11, v12);
  return v13;
}

- (id)vertexWithVertexID:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_verticesMap, a2, (uint64_t)a3);
}

- (BOOL)containsVertexWithVertexID:(id)a3
{
  v3 = objc_msgSend_objectForKey_(self->_verticesMap, a2, (uint64_t)a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)containsVertex:(id)a3
{
  BOOL v4 = objc_msgSend_vertexID(a3, a2, (uint64_t)a3);
  LOBYTE(self) = objc_msgSend_containsVertexWithVertexID_(self, v5, (uint64_t)v4);

  return (char)self;
}

- (BOOL)hasEdgeFromVertex:(id)a3 toVertex:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend_vertexID(a3, v7, v8);
  v11 = objc_msgSend_objectForKey_(self->_outEdgesMap, v10, (uint64_t)v9);
  id v14 = objc_msgSend_vertexID(v6, v12, v13);

  LOBYTE(v9) = objc_msgSend_containsObject_(v11, v15, (uint64_t)v14);
  return (char)v9;
}

- (void)addVertex:(id)a3
{
  id v17 = a3;
  id v6 = objc_msgSend_vertexID(v17, v4, v5);
  objc_msgSend_objectForKey_(self->_verticesMap, v7, (uint64_t)v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v17)
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    uint64_t v12 = objc_msgSend_objectForKey_(v9->_inEdgesMap, v10, (uint64_t)v6);
    if (!v12)
    {
      uint64_t v12 = objc_msgSend_hashTableWithOptions_(MEMORY[0x1E4F28D30], v11, 0);
    }
    objc_msgSend_setObject_forKey_(v9->_inEdgesMap, v11, (uint64_t)v12, v6);
    uint64_t v15 = objc_msgSend_objectForKey_(v9->_outEdgesMap, v13, (uint64_t)v6);
    if (!v15)
    {
      uint64_t v15 = objc_msgSend_hashTableWithOptions_(MEMORY[0x1E4F28D30], v14, 0);
    }
    objc_msgSend_setObject_forKey_(v9->_outEdgesMap, v14, (uint64_t)v15, v6);
    objc_msgSend_setObject_forKey_(self->_verticesMap, v16, (uint64_t)v17, v6);

    objc_sync_exit(v9);
  }
}

- (void)addEdgeFromVertex:(id)a3 toVertex:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  objc_msgSend_addVertex_(self, v7, (uint64_t)v22);
  objc_msgSend_addVertex_(self, v8, (uint64_t)v6);
  v11 = objc_msgSend_vertexID(v22, v9, v10);
  id v14 = objc_msgSend_vertexID(v6, v12, v13);
  uint64_t v15 = self;
  objc_sync_enter(v15);
  id v17 = objc_msgSend_objectForKey_(v15->_outEdgesMap, v16, (uint64_t)v11);
  objc_msgSend_addObject_(v17, v18, (uint64_t)v14);
  long long v20 = objc_msgSend_objectForKey_(v15->_inEdgesMap, v19, (uint64_t)v14);

  objc_msgSend_addObject_(v20, v21, (uint64_t)v11);
  objc_sync_exit(v15);
}

- (void)removeVertex:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_vertexID(v4, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(self->_outEdgesMap, v8, (uint64_t)v7);
  objc_msgSend_removeObjectForKey_(self->_outEdgesMap, v10, (uint64_t)v7);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v9;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v39, v44, 16);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * v16);
        long long v18 = (void *)MEMORY[0x1E01A0360]();
        objc_msgSend__removeEdgeFromVertexWithID_toVertexWithID_(self, v19, (uint64_t)v7, v17);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v20, (uint64_t)&v39, v44, 16);
    }
    while (v14);
  }

  id v22 = objc_msgSend_objectForKey_(self->_inEdgesMap, v21, (uint64_t)v7);
  objc_msgSend_removeObjectForKey_(self->_inEdgesMap, v23, (uint64_t)v7);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v24 = v22;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v35, v43, 16);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v35 + 1) + 8 * v29);
        v31 = (void *)MEMORY[0x1E01A0360](v26);
        objc_msgSend__removeEdgeFromVertexWithID_toVertexWithID_(self, v32, v30, v7, (void)v35);
        ++v29;
      }
      while (v27 != v29);
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v33, (uint64_t)&v35, v43, 16);
      uint64_t v27 = v26;
    }
    while (v26);
  }

  objc_msgSend_removeObjectForKey_(self->_verticesMap, v34, (uint64_t)v7);
}

- (void)removeEdgeFromVertex:(id)a3 toVertex:(id)a4
{
  id v6 = a4;
  objc_msgSend_vertexID(a3, v7, v8);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = objc_msgSend_vertexID(v6, v9, v10);

  objc_msgSend__removeEdgeFromVertexWithID_toVertexWithID_(self, v12, (uint64_t)v13, v11);
}

- (void)_removeEdgeFromVertexWithID:(id)a3 toVertexWithID:(id)a4
{
  outEdgesMap = self->_outEdgesMap;
  id v7 = a4;
  id v8 = a3;
  uint64_t v10 = objc_msgSend_objectForKey_(outEdgesMap, v9, (uint64_t)v8);
  objc_msgSend_removeObject_(v10, v11, (uint64_t)v7);
  objc_msgSend_objectForKey_(self->_inEdgesMap, v12, (uint64_t)v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeObject_(v14, v13, (uint64_t)v8);
}

- (void)removeSubtreeStartingAtVertex:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = objc_msgSend_outNeighboursOfVertex_(self, v5, (uint64_t)v4);
  objc_msgSend_removeVertex_(self, v7, (uint64_t)v4);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, v20, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!objc_msgSend_inDegree_(self, v11, v15, (void)v16)) {
          objc_msgSend_removeSubtreeStartingAtVertex_(self, v11, v15);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, v20, 16);
    }
    while (v12);
  }
}

- (id)neighboursOfVertex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC624074;
  v9[3] = &unk_1E6C95C98;
  id v6 = v5;
  id v10 = v6;
  objc_msgSend_enumerateNeighboursOfVertex_enumerationBlock_(self, v7, (uint64_t)v4, v9);

  return v6;
}

- (void)enumerateNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  inEdgesMap = v7->_inEdgesMap;
  id v11 = objc_msgSend_vertexID(v22, v9, v10);
  uint64_t v13 = objc_msgSend_objectForKey_(inEdgesMap, v12, (uint64_t)v11);

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v14, (uint64_t)v13, 0, v6);
  outEdgesMap = v7->_outEdgesMap;
  long long v18 = objc_msgSend_vertexID(v22, v16, v17);
  long long v20 = objc_msgSend_objectForKey_(outEdgesMap, v19, (uint64_t)v18);

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v21, (uint64_t)v20, v13, v6);
  objc_sync_exit(v7);
}

- (id)inNeighboursOfVertex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC624264;
  v9[3] = &unk_1E6C95C98;
  id v6 = v5;
  id v10 = v6;
  objc_msgSend_enumerateInNeighboursOfVertex_enumerationBlock_(self, v7, (uint64_t)v4, v9);

  return v6;
}

- (void)enumerateInNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  inEdgesMap = v7->_inEdgesMap;
  id v11 = objc_msgSend_vertexID(v15, v9, v10);
  uint64_t v13 = objc_msgSend_objectForKey_(inEdgesMap, v12, (uint64_t)v11);

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v14, (uint64_t)v13, 0, v6);
  objc_sync_exit(v7);
}

- (id)outNeighboursOfVertex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC624404;
  v9[3] = &unk_1E6C95C98;
  id v6 = v5;
  id v10 = v6;
  objc_msgSend_enumerateOutNeighboursOfVertex_enumerationBlock_(self, v7, (uint64_t)v4, v9);

  return v6;
}

- (void)enumerateOutNeighboursOfVertex:(id)a3 enumerationBlock:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  outEdgesMap = v7->_outEdgesMap;
  id v11 = objc_msgSend_vertexID(v15, v9, v10);
  uint64_t v13 = objc_msgSend_objectForKey_(outEdgesMap, v12, (uint64_t)v11);

  objc_msgSend__enumerateVerticesInEdges_skipingEdges_enumerationBlock_(v7, v14, (uint64_t)v13, 0, v6);
  objc_sync_exit(v7);
}

- (void)_enumerateVerticesInEdges:(id)a3 skipingEdges:(id)a4 enumerationBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, unsigned char *))a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v7;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, v29, 16);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x1E01A0360]();
        if ((objc_msgSend_containsObject_(v8, v18, v16) & 1) == 0)
        {
          long long v20 = objc_msgSend_objectForKey_(self->_verticesMap, v19, v16);
          unsigned __int8 v24 = 0;
          v9[2](v9, v20, &v24);
          int v21 = v24;

          if (v21)
          {
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v22, (uint64_t)&v25, v29, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)enumerate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_verticesMap;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, v22, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x1E01A0360]();
      uint64_t v14 = objc_msgSend_objectForKey_(self->_verticesMap, v13, v11);
      unsigned __int8 v17 = 0;
      v4[2](v4, v14, &v17);
      int v15 = v17;

      if (v15) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v18, v22, 16);
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)traverse:(id)a3
{
}

- (void)traverseVerticesPassingTest:(id)a3 enumerationBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (unsigned int (**)(id, void *))a3;
  id v22 = a4;
  id v8 = (id)objc_msgSend_hashTableWithOptions_(MEMORY[0x1E4F28D30], v7, 517);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_verticesMap;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v23, v27, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1E01A0360]();
        long long v18 = objc_msgSend_objectForKey_(self->_verticesMap, v17, v15);
        if ((objc_msgSend_containsObject_(v8, v19, (uint64_t)v18) & 1) == 0 && v6[2](v6, v18)) {
          objc_msgSend__traverseStartingAtVertex_previousVertex_visitedVertices_enumerationBlock_(self, v20, (uint64_t)v18, 0, v8, v22);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v21, (uint64_t)&v23, v27, 16);
    }
    while (v12);
  }
}

- (void)traverseStartingAtVertex:(id)a3 enumerationBlock:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28D30];
  id v7 = a4;
  id v11 = a3;
  uint64_t v9 = objc_msgSend_hashTableWithOptions_(v6, v8, 517);
  objc_msgSend__traverseStartingAtVertex_previousVertex_visitedVertices_enumerationBlock_(self, v10, (uint64_t)v11, 0, v9, v7);
}

- (void)_traverseStartingAtVertex:(id)a3 previousVertex:(id)a4 visitedVertices:(id)a5 enumerationBlock:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, id, id, unsigned char *))a6;
  objc_msgSend_addObject_(v12, v14, (uint64_t)v10);
  char v37 = 0;
  v13[2](v13, v10, v11, &v37);
  if (!v37)
  {
    id v32 = v11;
    v31 = objc_msgSend_vertexID(v10, v15, v16);
    objc_msgSend_objectForKey_(self->_outEdgesMap, v17, (uint64_t)v31);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v38, 16);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          long long v25 = (void *)MEMORY[0x1E01A0360]();
          long long v27 = objc_msgSend_objectForKey_(self->_verticesMap, v26, v24);
          if ((objc_msgSend_containsObject_(v12, v28, (uint64_t)v27) & 1) == 0) {
            objc_msgSend__traverseStartingAtVertex_previousVertex_visitedVertices_enumerationBlock_(self, v29, (uint64_t)v27, v10, v12, v13);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v30, (uint64_t)&v33, v38, 16);
      }
      while (v21);
    }

    id v11 = v32;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outEdgesMap, 0);
  objc_storeStrong((id *)&self->_inEdgesMap, 0);

  objc_storeStrong((id *)&self->_verticesMap, 0);
}

@end