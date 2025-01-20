@interface GKObstacleGraph
+ (BOOL)supportsSecureCoding;
+ (GKObstacleGraph)graphWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius;
+ (GKObstacleGraph)graphWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius nodeClass:(Class)nodeClass;
- (BOOL)isConnectionLockedFromNode:(id)startNode toNode:(id)endNode;
- (Class)nodeClass;
- (GKObstacleGraph)initWithCoder:(id)a3;
- (GKObstacleGraph)initWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius;
- (GKObstacleGraph)initWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius nodeClass:(Class)nodeClass;
- (NSArray)nodesForObstacle:(GKPolygonObstacle *)obstacle;
- (NSArray)obstacles;
- (float)bufferRadius;
- (id)mutObstacles;
- (void)addObstacles:(NSArray *)obstacles;
- (void)cObstacleGraph;
- (void)connectNodeUsingObstacles:(id)node;
- (void)connectNodeUsingObstacles:(id)node ignoringBufferRadiusOfObstacles:(NSArray *)obstaclesBufferRadiusToIgnore;
- (void)connectNodeUsingObstacles:(id)node ignoringObstacles:(NSArray *)obstaclesToIgnore;
- (void)encodeWithCoder:(id)a3;
- (void)lockConnectionFromNode:(id)startNode toNode:(id)endNode;
- (void)makeCGraph;
- (void)removeAllObstacles;
- (void)removeObstacles:(NSArray *)obstacles;
- (void)unlockConnectionFromNode:(id)startNode toNode:(id)endNode;
@end

@implementation GKObstacleGraph

- (void)makeCGraph
{
}

- (void)cObstacleGraph
{
  return self->_cObstacleGraph;
}

- (NSArray)obstacles
{
  return (NSArray *)self->_sourceObstacles;
}

- (id)mutObstacles
{
  return self->_sourceObstacles;
}

- (float)bufferRadius
{
  return *((float *)self->_cObstacleGraph + 28);
}

+ (GKObstacleGraph)graphWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius
{
  v5 = obstacles;
  v6 = [GKObstacleGraph alloc];
  *(float *)&double v7 = bufferRadius;
  v8 = [(GKObstacleGraph *)v6 initWithObstacles:v5 bufferRadius:v7];

  return v8;
}

- (GKObstacleGraph)initWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius
{
  v6 = obstacles;
  uint64_t v7 = objc_opt_class();
  *(float *)&double v8 = bufferRadius;
  v9 = [(GKObstacleGraph *)self initWithObstacles:v6 bufferRadius:v7 nodeClass:v8];

  return v9;
}

+ (GKObstacleGraph)graphWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius nodeClass:(Class)nodeClass
{
  uint64_t v7 = obstacles;
  double v8 = [GKObstacleGraph alloc];
  *(float *)&double v9 = bufferRadius;
  v10 = [(GKObstacleGraph *)v8 initWithObstacles:v7 bufferRadius:nodeClass nodeClass:v9];

  return v10;
}

- (GKObstacleGraph)initWithObstacles:(NSArray *)obstacles bufferRadius:(float)bufferRadius nodeClass:(Class)nodeClass
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v8 = obstacles;
  if (([(objc_class *)nodeClass isSubclassOfClass:objc_opt_class()] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"initWithObstacles: nodeClass does not descend from GKGraphNode2D"];
  }
  v22.receiver = self;
  v22.super_class = (Class)GKObstacleGraph;
  double v9 = [(GKGraph *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_nodeClass = nodeClass;
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    sourceObstacles = v10->_sourceObstacles;
    v10->_sourceObstacles = (NSMutableArray *)v11;

    *((float *)v10->_cObstacleGraph + 28) = fmaxf(bufferRadius, 0.0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = v8;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          GKCObstacleGraph::addObstacle((GKCObstacleGraph *)v10->_cObstacleGraph, (GKCPolygonObstacle *)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16++), "cPolygonObstacle", (void)v18), 1);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v14);
    }
  }
  return v10;
}

- (void)connectNodeUsingObstacles:(id)node
{
  id v4 = node;
  GKCObstacleGraph::connectNodeUsingObstacles((GKCObstacleGraph *)self->_cObstacleGraph, (GKCGraphNode2D *)[v4 cGraphNode2D]);
}

- (void)connectNodeUsingObstacles:(id)node ignoringObstacles:(NSArray *)obstaclesToIgnore
{
  id v7 = node;
  v6 = obstaclesToIgnore;
  GKCObstacleGraph::connectNodeUsingObstaclesIgnoringObstacles((uint64_t)self->_cObstacleGraph, (GKCGraphNode *)[v7 cGraphNode2D], v6);
}

- (void)connectNodeUsingObstacles:(id)node ignoringBufferRadiusOfObstacles:(NSArray *)obstaclesBufferRadiusToIgnore
{
  id v7 = node;
  v6 = obstaclesBufferRadiusToIgnore;
  GKCObstacleGraph::connectNodeUsingObstaclesIgnoringBufferRadiusOfObstacles((GKCGraph *)self->_cObstacleGraph, (float32x2_t *)[v7 cGraphNode2D], v6);
}

- (void)addObstacles:(NSArray *)obstacles
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = obstacles;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        GKCObstacleGraph::addObstacle((GKCObstacleGraph *)self->_cObstacleGraph, (GKCPolygonObstacle *)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cPolygonObstacle", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeAllObstacles
{
}

- (void)removeObstacles:(NSArray *)obstacles
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = obstacles;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        GKCObstacleGraph::removeObstacle((GKCObstacleGraph *)self->_cObstacleGraph, (GKCPolygonObstacle *)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cPolygonObstacle", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSArray)nodesForObstacle:(GKPolygonObstacle *)obstacle
{
  id v4 = obstacle;
  uint64_t v5 = GKCObstacleGraph::nodesForObstacle((GKCObstacleGraph *)self->_cObstacleGraph, (GKCPolygonObstacle *)[(GKPolygonObstacle *)v4 cPolygonObstacle]);

  return (NSArray *)v5;
}

- (void)lockConnectionFromNode:(id)startNode toNode:(id)endNode
{
  id v7 = startNode;
  id v6 = endNode;
  GKCObstacleGraph::lockConnectionFromNode((GKCObstacleGraph *)self->_cObstacleGraph, (GKCGraphNode2D *)[v7 cGraphNode2D], (GKCGraphNode2D *)objc_msgSend(v6, "cGraphNode2D"));
}

- (void)unlockConnectionFromNode:(id)startNode toNode:(id)endNode
{
  id v7 = startNode;
  id v6 = endNode;
  GKCObstacleGraph::unlockConnectionFromNode((uint64_t)self->_cObstacleGraph, [v7 cGraphNode2D], objc_msgSend(v6, "cGraphNode2D"));
}

- (BOOL)isConnectionLockedFromNode:(id)startNode toNode:(id)endNode
{
  id v6 = startNode;
  id v7 = endNode;
  LOBYTE(self) = GKCObstacleGraph::isConnectedLockedFromNode((uint64_t)self->_cObstacleGraph, [v6 cGraphNode2D], objc_msgSend(v7, "cGraphNode2D"));

  return (char)self;
}

- (Class)nodeClass
{
  return self->_nodeClass;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKObstacleGraph)initWithCoder:(id)a3
{
  v98[11] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)GKObstacleGraph;
  uint64_t v5 = [(GKGraph *)&v96 initWithCoder:v4];
  if (!v5) {
    goto LABEL_73;
  }
  id v83 = v4;
  id v85 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v98[0] = objc_opt_class();
  v98[1] = objc_opt_class();
  v98[2] = objc_opt_class();
  v98[3] = objc_opt_class();
  v98[4] = objc_opt_class();
  v98[5] = objc_opt_class();
  v98[6] = objc_opt_class();
  v98[7] = objc_opt_class();
  v98[8] = objc_opt_class();
  v98[9] = objc_opt_class();
  v98[10] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:11];
  [v85 addObjectsFromArray:v6];

  id v7 = [v4 allowedClasses];
  [v85 unionSet:v7];

  id obj = [v4 decodeObjectOfClasses:v85 forKey:@"_sourceObstacles"];
  v84 = [v4 decodeObjectOfClasses:v85 forKey:@"extrudedObstacles"];
  [v4 decodeFloatForKey:@"bufferRadius"];
  *((_DWORD *)v5->_cObstacleGraph + 28) = v8;
  objc_storeStrong((id *)&v5->_sourceObstacles, obj);
  std::vector<NSObject * {__strong}>::reserve((uint64_t)v5->_cObstacleGraph + 88, [v84 count]);
  cObstacleGraph = v5->_cObstacleGraph;
  unint64_t v10 = [v84 count];
  long long v11 = (unsigned char *)cObstacleGraph[8];
  if (v10 <= (uint64_t)(cObstacleGraph[10] - (void)v11) >> 3) {
    goto LABEL_14;
  }
  if (v10 >> 61) {
    _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
  }
  v12 = (unsigned char *)cObstacleGraph[9];
  uint64_t v13 = (char *)operator new(8 * v10);
  uint64_t v14 = v12 - v11;
  uint64_t v15 = &v13[(v12 - v11) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v16 = v15;
  if (v12 != v11)
  {
    if ((unint64_t)(v14 - 8) < 0x58)
    {
      uint64_t v16 = &v13[(v12 - v11) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_11:
        uint64_t v25 = *((void *)v12 - 1);
        v12 -= 8;
        *((void *)v16 - 1) = v25;
        v16 -= 8;
      }
      while (v12 != v11);
      goto LABEL_12;
    }
    uint64_t v16 = &v13[(v12 - v11) & 0xFFFFFFFFFFFFFFF8];
    if (v12 - v13 - (v14 & 0xFFFFFFFFFFFFFFF8) < 0x20) {
      goto LABEL_11;
    }
    uint64_t v17 = v14 >> 3;
    unint64_t v18 = ((unint64_t)(v14 - 8) >> 3) + 1;
    uint64_t v19 = 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
    long long v20 = &v12[-v19];
    uint64_t v16 = &v15[-v19];
    long long v21 = &v13[8 * v17 - 16];
    objc_super v22 = (long long *)(v12 - 16);
    uint64_t v23 = v18 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v24 = *v22;
      *((_OWORD *)v21 - 1) = *(v22 - 1);
      *(_OWORD *)long long v21 = v24;
      v21 -= 32;
      v22 -= 2;
      v23 -= 4;
    }
    while (v23);
    v12 = v20;
    if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_11;
    }
  }
LABEL_12:
  cObstacleGraph[8] = v16;
  cObstacleGraph[9] = v15;
  cObstacleGraph[10] = &v13[8 * v10];
  if (v11) {
    operator delete(v11);
  }
LABEL_14:
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v87 = v84;
  uint64_t v26 = [v87 countByEnumeratingWithState:&v91 objects:v97 count:16];
  v90 = v5;
  if (!v26) {
    goto LABEL_47;
  }
  uint64_t v88 = *(void *)v92;
  do
  {
    uint64_t v89 = v26;
    uint64_t v27 = 0;
    do
    {
      if (*(void *)v92 != v88) {
        objc_enumerationMutation(v87);
      }
      v30 = *(void **)(*((void *)&v91 + 1) + 8 * v27);
      id v95 = v30;
      v31 = v5->_cObstacleGraph;
      v32 = (void *)v31[12];
      if ((unint64_t)v32 >= v31[13])
      {
        v33 = std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(v31 + 11, &v95);
      }
      else
      {
        void *v32 = v30;
        v33 = v32 + 1;
      }
      v31[12] = v33;
      v34 = v5->_cObstacleGraph;
      uint64_t v35 = [v95 cPolygonObstacle];
      uint64_t v36 = v35;
      v38 = (uint64_t *)v34[9];
      unint64_t v37 = v34[10];
      if ((unint64_t)v38 < v37)
      {
        uint64_t *v38 = v35;
        uint64_t v28 = (uint64_t)(v38 + 1);
        uint64_t v29 = v89;
        uint64_t v5 = v90;
        goto LABEL_18;
      }
      v39 = (char *)v34[8];
      uint64_t v40 = ((char *)v38 - v39) >> 3;
      unint64_t v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 61) {
        _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v42 = v37 - (void)v39;
      if (v42 >> 2 > v41) {
        unint64_t v41 = v42 >> 2;
      }
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v41;
      }
      if (v43)
      {
        if (v43 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v44 = (char *)operator new(8 * v43);
        v45 = (uint64_t *)&v44[8 * v40];
        uint64_t *v45 = v36;
        uint64_t v28 = (uint64_t)(v45 + 1);
        if (v38 != (uint64_t *)v39)
        {
LABEL_34:
          unint64_t v46 = (char *)(v38 - 1) - v39;
          uint64_t v5 = v90;
          if (v46 < 0x58)
          {
            uint64_t v29 = v89;
            goto LABEL_43;
          }
          uint64_t v29 = v89;
          if ((unint64_t)(v39 - v44) < 0x20) {
            goto LABEL_79;
          }
          uint64_t v47 = (v46 >> 3) + 1;
          uint64_t v48 = 8 * (v47 & 0x3FFFFFFFFFFFFFFCLL);
          v49 = &v38[v48 / 0xFFFFFFFFFFFFFFF8];
          v45 = (uint64_t *)((char *)v45 - v48);
          v50 = &v44[8 * v40 - 16];
          v51 = v38 - 2;
          uint64_t v52 = v47 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v53 = *(_OWORD *)v51;
            *((_OWORD *)v50 - 1) = *((_OWORD *)v51 - 1);
            *(_OWORD *)v50 = v53;
            v50 -= 32;
            v51 -= 4;
            v52 -= 4;
          }
          while (v52);
          v38 = v49;
          if (v47 != (v47 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_79:
            do
            {
LABEL_43:
              uint64_t v54 = *--v38;
              *--v45 = v54;
            }
            while (v38 != (uint64_t *)v39);
          }
          v38 = (uint64_t *)v34[8];
          v34[8] = v45;
          v34[9] = v28;
          v34[10] = &v44[8 * v43];
          if (!v38) {
            goto LABEL_18;
          }
LABEL_45:
          operator delete(v38);
          goto LABEL_18;
        }
      }
      else
      {
        v44 = 0;
        v45 = (uint64_t *)(8 * v40);
        *(void *)(8 * v40) = v36;
        uint64_t v28 = 8 * v40 + 8;
        if (v38 != (uint64_t *)v39) {
          goto LABEL_34;
        }
      }
      uint64_t v29 = v89;
      uint64_t v5 = v90;
      v34[8] = v45;
      v34[9] = v28;
      v34[10] = &v44[8 * v43];
      if (v38) {
        goto LABEL_45;
      }
LABEL_18:
      v34[9] = v28;
      ++v27;
    }
    while (v27 != v29);
    uint64_t v26 = [v87 countByEnumeratingWithState:&v91 objects:v97 count:16];
  }
  while (v26);
LABEL_47:

  int v55 = [obj count];
  if (v55 >= 1)
  {
    uint64_t v56 = 0;
    uint64_t v57 = v55;
    do
    {
      v58 = [obj objectAtIndexedSubscript:v56];
      v59 = [v87 objectAtIndexedSubscript:v56];
      uint64_t v60 = [v59 cPolygonObstacle];
      v61 = (char *)v5->_cObstacleGraph;
      unint64_t v62 = [v58 cPolygonObstacle];
      unint64_t v63 = v62;
      v65 = (uint64_t **)(v61 + 152);
      v64 = (uint64_t *)*((void *)v61 + 19);
      if (v64)
      {
        while (1)
        {
          while (1)
          {
            v66 = (uint64_t **)v64;
            unint64_t v67 = v64[4];
            if (v62 >= v67) {
              break;
            }
            v64 = *v66;
            v65 = v66;
            if (!*v66) {
              goto LABEL_56;
            }
          }
          if (v67 >= v62) {
            break;
          }
          v64 = v66[1];
          if (!v64)
          {
            v65 = v66 + 1;
            goto LABEL_56;
          }
        }
        v68 = (uint64_t *)v66;
      }
      else
      {
        v66 = (uint64_t **)(v61 + 152);
LABEL_56:
        v68 = (uint64_t *)operator new(0x30uLL);
        v68[4] = v63;
        v68[5] = 0;
        uint64_t *v68 = 0;
        v68[1] = 0;
        v68[2] = (uint64_t)v66;
        *v65 = v68;
        uint64_t v69 = **((void **)v61 + 18);
        v70 = v68;
        if (v69)
        {
          *((void *)v61 + 18) = v69;
          v70 = *v65;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v61 + 19), v70);
        ++*((void *)v61 + 20);
      }
      v68[5] = v60;
      uint64_t v71 = [v58 cPolygonObstacle];
      v72 = (char *)v90->_cObstacleGraph;
      unint64_t v73 = [v59 cPolygonObstacle];
      unint64_t v74 = v73;
      v76 = (uint64_t **)(v72 + 176);
      v75 = (uint64_t *)*((void *)v72 + 22);
      if (v75)
      {
        while (1)
        {
          while (1)
          {
            v77 = (uint64_t **)v75;
            unint64_t v78 = v75[4];
            if (v73 >= v78) {
              break;
            }
            v75 = *v77;
            v76 = v77;
            if (!*v77) {
              goto LABEL_67;
            }
          }
          if (v78 >= v73) {
            break;
          }
          v75 = v77[1];
          if (!v75)
          {
            v76 = v77 + 1;
            goto LABEL_67;
          }
        }
        v79 = (uint64_t *)v77;
      }
      else
      {
        v77 = (uint64_t **)(v72 + 176);
LABEL_67:
        v79 = (uint64_t *)operator new(0x30uLL);
        v79[4] = v74;
        v79[5] = 0;
        uint64_t *v79 = 0;
        v79[1] = 0;
        v79[2] = (uint64_t)v77;
        *v76 = v79;
        uint64_t v80 = **((void **)v72 + 21);
        v81 = v79;
        if (v80)
        {
          *((void *)v72 + 21) = v80;
          v81 = *v76;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v72 + 22), v81);
        ++*((void *)v72 + 23);
      }
      uint64_t v5 = v90;
      v79[5] = v71;

      ++v56;
    }
    while (v56 != v57);
  }

  id v4 = v83;
LABEL_73:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GKObstacleGraph;
  [(GKGraph *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_sourceObstacles forKey:@"_sourceObstacles"];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:count:");
  [v4 encodeObject:v5 forKey:@"extrudedObstacles"];
  [(GKObstacleGraph *)self bufferRadius];
  objc_msgSend(v4, "encodeFloat:forKey:", @"bufferRadius");
}

- (void).cxx_destruct
{
}

@end