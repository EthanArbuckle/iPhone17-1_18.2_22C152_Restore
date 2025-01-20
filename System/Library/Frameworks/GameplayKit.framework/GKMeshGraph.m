@interface GKMeshGraph
+ (BOOL)supportsSecureCoding;
+ (GKMeshGraph)graphWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max;
+ (GKMeshGraph)graphWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max nodeClass:(Class)nodeClass;
- (BOOL)makeNodesFromTriangleCenters;
- (BOOL)makeNodesFromTriangleEdgeMidpoints;
- (BOOL)makeNodesFromTriangleVertices;
- (Class)nodeClass;
- (GKMeshGraph)initWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max;
- (GKMeshGraph)initWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max nodeClass:(Class)nodeClass;
- (GKMeshGraph)initWithCoder:(id)a3;
- (GKMeshGraphTriangulationMode)triangulationMode;
- (GKTriangle)triangleAtIndex:(SEL)a3;
- (NSArray)obstacles;
- (NSUInteger)triangleCount;
- (float)bufferRadius;
- (void)addObstacles:(NSArray *)obstacles;
- (void)cMeshGraph;
- (void)connectNodeUsingObstacles:(id)node;
- (void)encodeWithCoder:(id)a3;
- (void)makeCGraph;
- (void)removeObstacles:(NSArray *)obstacles;
- (void)setMakeNodesFromTriangleCenters:(BOOL)a3;
- (void)setMakeNodesFromTriangleEdgeMidpoints:(BOOL)a3;
- (void)setMakeNodesFromTriangleVertices:(BOOL)a3;
- (void)setTriangulationMode:(GKMeshGraphTriangulationMode)triangulationMode;
- (void)triangulate;
@end

@implementation GKMeshGraph

- (void)makeCGraph
{
}

- (void)cMeshGraph
{
  return self->_cMeshGraph;
}

- (NSArray)obstacles
{
  return (NSArray *)self->_sourceObstacles;
}

- (void)setTriangulationMode:(GKMeshGraphTriangulationMode)triangulationMode
{
  cMeshGraph = self->_cMeshGraph;
  cMeshGraph[657] = (triangulationMode & 2) != 0;
  cMeshGraph[656] = triangulationMode & 1;
  cMeshGraph[658] = (triangulationMode & 4) != 0;
}

- (GKMeshGraphTriangulationMode)triangulationMode
{
  cMeshGraph = (unsigned __int8 *)self->_cMeshGraph;
  if (cMeshGraph[658]) {
    return cMeshGraph[656] | (2 * cMeshGraph[657]) | 4;
  }
  else {
    return cMeshGraph[656] | (2 * cMeshGraph[657]);
  }
}

- (void)setMakeNodesFromTriangleCenters:(BOOL)a3
{
  *((unsigned char *)self->_cMeshGraph + 657) = a3;
}

- (BOOL)makeNodesFromTriangleCenters
{
  return *((unsigned char *)self->_cMeshGraph + 657);
}

- (void)setMakeNodesFromTriangleVertices:(BOOL)a3
{
  *((unsigned char *)self->_cMeshGraph + 656) = a3;
}

- (BOOL)makeNodesFromTriangleVertices
{
  return *((unsigned char *)self->_cMeshGraph + 656);
}

- (void)setMakeNodesFromTriangleEdgeMidpoints:(BOOL)a3
{
  *((unsigned char *)self->_cMeshGraph + 658) = a3;
}

- (BOOL)makeNodesFromTriangleEdgeMidpoints
{
  return *((unsigned char *)self->_cMeshGraph + 658);
}

- (Class)nodeClass
{
  return self->_nodeClass;
}

- (float)bufferRadius
{
  return *((float *)self->_cMeshGraph + 168);
}

+ (GKMeshGraph)graphWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max nodeClass:(Class)nodeClass
{
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = bufferRadius;
  v12 = (void *)[v10 initWithBufferRadius:nodeClass minCoordinate:v11 maxCoordinate:*(double *)&min nodeClass:*(double *)&max];

  return (GKMeshGraph *)v12;
}

- (GKMeshGraph)initWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max nodeClass:(Class)nodeClass
{
  v16.receiver = self;
  v16.super_class = (Class)GKMeshGraph;
  id v10 = [(GKGraph *)&v16 init];
  double v11 = v10;
  if (v10)
  {
    v10->_nodeClass = nodeClass;
    uint64_t v12 = [MEMORY[0x263EFF980] array];
    sourceObstacles = v11->_sourceObstacles;
    v11->_sourceObstacles = (NSMutableArray *)v12;

    cMeshGraph = (vector_float2 *)v11->_cMeshGraph;
    cMeshGraph[84].f32[0] = fmaxf(bufferRadius, 0.0);
    cMeshGraph[85] = min;
    *((vector_float2 *)v11->_cMeshGraph + 86) = max;
  }
  return v11;
}

+ (GKMeshGraph)graphWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max
{
  uint64_t v9 = objc_opt_class();
  *(float *)&double v10 = bufferRadius;

  return (GKMeshGraph *)[a1 graphWithBufferRadius:v9 minCoordinate:v10 maxCoordinate:*(double *)&min nodeClass:*(double *)&max];
}

- (GKMeshGraph)initWithBufferRadius:(float)bufferRadius minCoordinate:(vector_float2)min maxCoordinate:(vector_float2)max
{
  uint64_t v9 = objc_opt_class();
  *(float *)&double v10 = bufferRadius;
  return [(GKMeshGraph *)self initWithBufferRadius:v9 minCoordinate:v10 maxCoordinate:*(double *)&min nodeClass:*(double *)&max];
}

- (void)addObstacles:(NSArray *)obstacles
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = obstacles;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_sourceObstacles, "containsObject:", v8, (void)v9) & 1) == 0)
        {
          [(NSMutableArray *)self->_sourceObstacles addObject:v8];
          GKCMeshGraph::AddObstacle((GKCMeshGraph *)self->_cMeshGraph, (id *)[v8 cPolygonObstacle]);
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)removeObstacles:(NSArray *)obstacles
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = obstacles;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](self->_sourceObstacles, "containsObject:", v8, (void)v9))
        {
          [(NSMutableArray *)self->_sourceObstacles removeObject:v8];
          GKCMeshGraph::RemoveObstacle((GKCMeshGraph *)self->_cMeshGraph, (GKCPolygonObstacle *)[v8 cPolygonObstacle]);
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)connectNodeUsingObstacles:(id)node
{
  id v4 = node;
  GKCMeshGraph::ConnectNodeUsingObstacles((p2t::CDT **)self->_cMeshGraph, (float32x2_t *)[v4 cGraphNode2D]);
}

- (void)triangulate
{
}

- (NSUInteger)triangleCount
{
  return (int)GKCMeshGraph::GetNumTriangles((p2t::CDT **)self->_cMeshGraph);
}

- (GKTriangle)triangleAtIndex:(SEL)a3
{
  return (GKTriangle *)GKCMeshGraph::TriangleAtIndex((p2t::CDT **)self->_cMeshGraph, index);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKMeshGraph)initWithCoder:(id)a3
{
  v107[11] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v105.receiver = self;
  v105.super_class = (Class)GKMeshGraph;
  uint64_t v5 = [(GKGraph *)&v105 initWithCoder:v4];
  if (!v5) {
    goto LABEL_73;
  }
  id v92 = v4;
  id v91 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v107[0] = objc_opt_class();
  v107[1] = objc_opt_class();
  v107[2] = objc_opt_class();
  v107[3] = objc_opt_class();
  v107[4] = objc_opt_class();
  v107[5] = objc_opt_class();
  v107[6] = objc_opt_class();
  v107[7] = objc_opt_class();
  v107[8] = objc_opt_class();
  v107[9] = objc_opt_class();
  v107[10] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:11];
  [v91 addObjectsFromArray:v6];

  v7 = [v4 allowedClasses];
  [v91 unionSet:v7];

  id obj = [v4 decodeObjectOfClasses:v91 forKey:@"_sourceObstacles"];
  v90 = [v4 decodeObjectOfClasses:v91 forKey:@"extrudedObstacles"];
  [v4 decodeFloatForKey:@"bufferRadius"];
  float v9 = v8;
  long long v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"class"];
  v5->_nodeClass = NSClassFromString(v10);

  *((float *)v5->_cMeshGraph + 168) = fmaxf(v9, 0.0);
  objc_storeStrong((id *)&v5->_sourceObstacles, obj);
  [v4 decodeFloatForKey:@"minX"];
  unsigned int v97 = v11;
  [v4 decodeFloatForKey:@"minY"];
  *((void *)v5->_cMeshGraph + 85) = __PAIR64__(v12, v97);
  [v4 decodeFloatForKey:@"maxX"];
  unsigned int v98 = v13;
  [v4 decodeFloatForKey:@"maxY"];
  *((void *)v5->_cMeshGraph + 86) = __PAIR64__(v14, v98);
  std::vector<NSObject * {__strong}>::reserve((uint64_t)v5->_cMeshGraph + 424, [v90 count]);
  cMeshGraph = v5->_cMeshGraph;
  unint64_t v16 = [v90 count];
  unint64_t v17 = v16;
  v18 = (unsigned char *)cMeshGraph[50];
  if (v16 <= (uint64_t)(cMeshGraph[52] - (void)v18) >> 3) {
    goto LABEL_14;
  }
  if (v16 >> 61) {
    _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
  }
  v19 = (unsigned char *)cMeshGraph[51];
  v20 = (char *)operator new(8 * v16);
  uint64_t v21 = v19 - v18;
  v22 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
  v23 = v22;
  if (v19 != v18)
  {
    if ((unint64_t)(v21 - 8) < 0x58)
    {
      v23 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_11:
        uint64_t v32 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v23 - 1) = v32;
        v23 -= 8;
      }
      while (v19 != v18);
      goto LABEL_12;
    }
    v23 = &v20[(v19 - v18) & 0xFFFFFFFFFFFFFFF8];
    if (v19 - v20 - (v21 & 0xFFFFFFFFFFFFFFF8) < 0x20) {
      goto LABEL_11;
    }
    uint64_t v24 = v21 >> 3;
    unint64_t v25 = ((unint64_t)(v21 - 8) >> 3) + 1;
    uint64_t v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
    v27 = &v19[-v26];
    v23 = &v22[-v26];
    v28 = &v20[8 * v24 - 16];
    v29 = (long long *)(v19 - 16);
    uint64_t v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v31 = *v29;
      *((_OWORD *)v28 - 1) = *(v29 - 1);
      *(_OWORD *)v28 = v31;
      v28 -= 32;
      v29 -= 2;
      v30 -= 4;
    }
    while (v30);
    v19 = v27;
    if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_11;
    }
  }
LABEL_12:
  cMeshGraph[50] = v23;
  cMeshGraph[51] = v22;
  cMeshGraph[52] = &v20[8 * v17];
  if (v18) {
    operator delete(v18);
  }
LABEL_14:
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v94 = v90;
  uint64_t v33 = [v94 countByEnumeratingWithState:&v100 objects:v106 count:16];
  v99 = v5;
  if (!v33) {
    goto LABEL_47;
  }
  uint64_t v95 = *(void *)v101;
  do
  {
    uint64_t v96 = v33;
    uint64_t v34 = 0;
    do
    {
      if (*(void *)v101 != v95) {
        objc_enumerationMutation(v94);
      }
      v37 = *(void **)(*((void *)&v100 + 1) + 8 * v34);
      id v104 = v37;
      v38 = v5->_cMeshGraph;
      v39 = (void *)v38[54];
      if ((unint64_t)v39 >= v38[55])
      {
        v40 = std::vector<NSObject * {__strong}>::__push_back_slow_path<NSObject * const {__strong}&>(v38 + 53, &v104);
      }
      else
      {
        void *v39 = v37;
        v40 = v39 + 1;
      }
      v38[54] = v40;
      v41 = v5->_cMeshGraph;
      uint64_t v42 = [v104 cPolygonObstacle];
      uint64_t v43 = v42;
      v45 = (uint64_t *)v41[51];
      unint64_t v44 = v41[52];
      if ((unint64_t)v45 < v44)
      {
        uint64_t *v45 = v42;
        uint64_t v35 = (uint64_t)(v45 + 1);
        uint64_t v36 = v96;
        uint64_t v5 = v99;
        goto LABEL_18;
      }
      v46 = (char *)v41[50];
      uint64_t v47 = ((char *)v45 - v46) >> 3;
      unint64_t v48 = v47 + 1;
      if ((unint64_t)(v47 + 1) >> 61) {
        _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v49 = v44 - (void)v46;
      if (v49 >> 2 > v48) {
        unint64_t v48 = v49 >> 2;
      }
      if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v50 = v48;
      }
      if (v50)
      {
        if (v50 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v51 = (char *)operator new(8 * v50);
        v52 = (uint64_t *)&v51[8 * v47];
        uint64_t *v52 = v43;
        uint64_t v35 = (uint64_t)(v52 + 1);
        if (v45 != (uint64_t *)v46)
        {
LABEL_34:
          unint64_t v53 = (char *)(v45 - 1) - v46;
          uint64_t v5 = v99;
          if (v53 < 0x58)
          {
            uint64_t v36 = v96;
            goto LABEL_43;
          }
          uint64_t v36 = v96;
          if ((unint64_t)(v46 - v51) < 0x20) {
            goto LABEL_79;
          }
          uint64_t v54 = (v53 >> 3) + 1;
          uint64_t v55 = 8 * (v54 & 0x3FFFFFFFFFFFFFFCLL);
          v56 = &v45[v55 / 0xFFFFFFFFFFFFFFF8];
          v52 = (uint64_t *)((char *)v52 - v55);
          v57 = &v51[8 * v47 - 16];
          v58 = v45 - 2;
          uint64_t v59 = v54 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v60 = *(_OWORD *)v58;
            *((_OWORD *)v57 - 1) = *((_OWORD *)v58 - 1);
            *(_OWORD *)v57 = v60;
            v57 -= 32;
            v58 -= 4;
            v59 -= 4;
          }
          while (v59);
          v45 = v56;
          if (v54 != (v54 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_79:
            do
            {
LABEL_43:
              uint64_t v61 = *--v45;
              *--v52 = v61;
            }
            while (v45 != (uint64_t *)v46);
          }
          v45 = (uint64_t *)v41[50];
          v41[50] = v52;
          v41[51] = v35;
          v41[52] = &v51[8 * v50];
          if (!v45) {
            goto LABEL_18;
          }
LABEL_45:
          operator delete(v45);
          goto LABEL_18;
        }
      }
      else
      {
        v51 = 0;
        v52 = (uint64_t *)(8 * v47);
        *(void *)(8 * v47) = v43;
        uint64_t v35 = 8 * v47 + 8;
        if (v45 != (uint64_t *)v46) {
          goto LABEL_34;
        }
      }
      uint64_t v36 = v96;
      uint64_t v5 = v99;
      v41[50] = v52;
      v41[51] = v35;
      v41[52] = &v51[8 * v50];
      if (v45) {
        goto LABEL_45;
      }
LABEL_18:
      v41[51] = v35;
      ++v34;
    }
    while (v34 != v36);
    uint64_t v33 = [v94 countByEnumeratingWithState:&v100 objects:v106 count:16];
  }
  while (v33);
LABEL_47:

  int v62 = [obj count];
  if (v62 >= 1)
  {
    uint64_t v63 = 0;
    uint64_t v64 = v62;
    do
    {
      v65 = [obj objectAtIndexedSubscript:v63];
      v66 = [v94 objectAtIndexedSubscript:v63];
      uint64_t v67 = [v66 cPolygonObstacle];
      v68 = (char *)v5->_cMeshGraph;
      unint64_t v69 = [v65 cPolygonObstacle];
      unint64_t v70 = v69;
      v71 = (uint64_t *)*((void *)v68 + 57);
      if (v71)
      {
        while (1)
        {
          while (1)
          {
            v73 = (uint64_t **)v71;
            unint64_t v74 = v71[4];
            if (v69 >= v74) {
              break;
            }
            v71 = *v73;
            v72 = v73;
            if (!*v73) {
              goto LABEL_56;
            }
          }
          if (v74 >= v69) {
            break;
          }
          v71 = v73[1];
          if (!v71)
          {
            v72 = v73 + 1;
            goto LABEL_56;
          }
        }
        v75 = (uint64_t *)v73;
      }
      else
      {
        v72 = (uint64_t **)(v68 + 456);
        v73 = (uint64_t **)(v68 + 456);
LABEL_56:
        v75 = (uint64_t *)operator new(0x30uLL);
        v75[4] = v70;
        v75[5] = 0;
        uint64_t *v75 = 0;
        v75[1] = 0;
        v75[2] = (uint64_t)v73;
        *v72 = v75;
        uint64_t v76 = **((void **)v68 + 56);
        v77 = v75;
        if (v76)
        {
          *((void *)v68 + 56) = v76;
          v77 = *v72;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v68 + 57), v77);
        ++*((void *)v68 + 58);
      }
      v75[5] = v67;
      uint64_t v78 = [v65 cPolygonObstacle];
      v79 = (char *)v99->_cMeshGraph;
      unint64_t v80 = [v66 cPolygonObstacle];
      unint64_t v81 = v80;
      v82 = (uint64_t *)*((void *)v79 + 60);
      if (v82)
      {
        while (1)
        {
          while (1)
          {
            v84 = (uint64_t **)v82;
            unint64_t v85 = v82[4];
            if (v80 >= v85) {
              break;
            }
            v82 = *v84;
            v83 = v84;
            if (!*v84) {
              goto LABEL_67;
            }
          }
          if (v85 >= v80) {
            break;
          }
          v82 = v84[1];
          if (!v82)
          {
            v83 = v84 + 1;
            goto LABEL_67;
          }
        }
        v86 = (uint64_t *)v84;
      }
      else
      {
        v83 = (uint64_t **)(v79 + 480);
        v84 = (uint64_t **)(v79 + 480);
LABEL_67:
        v86 = (uint64_t *)operator new(0x30uLL);
        v86[4] = v81;
        v86[5] = 0;
        uint64_t *v86 = 0;
        v86[1] = 0;
        v86[2] = (uint64_t)v84;
        *v83 = v86;
        uint64_t v87 = **((void **)v79 + 59);
        v88 = v86;
        if (v87)
        {
          *((void *)v79 + 59) = v87;
          v88 = *v83;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v79 + 60), v88);
        ++*((void *)v79 + 61);
      }
      uint64_t v5 = v99;
      v86[5] = v78;

      ++v63;
    }
    while (v63 != v64);
  }

  id v4 = v92;
LABEL_73:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKMeshGraph;
  [(GKGraph *)&v9 encodeWithCoder:v4];
  [v4 encodeObject:self->_sourceObstacles forKey:@"_sourceObstacles"];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:count:");
  [v4 encodeObject:v5 forKey:@"extrudedObstacles"];
  [(GKMeshGraph *)self bufferRadius];
  objc_msgSend(v4, "encodeFloat:forKey:", @"bufferRadius");
  [v4 encodeFloat:@"minX" forKey:*((double *)self->_cMeshGraph + 85)];
  LODWORD(v6) = *((_DWORD *)self->_cMeshGraph + 171);
  [v4 encodeFloat:@"minY" forKey:v6];
  [v4 encodeFloat:@"maxX" forKey:*((double *)self->_cMeshGraph + 86)];
  LODWORD(v7) = *((_DWORD *)self->_cMeshGraph + 173);
  [v4 encodeFloat:@"maxY" forKey:v7];
  float v8 = NSStringFromClass([(GKMeshGraph *)self nodeClass]);
  [v4 encodeObject:v8 forKey:@"class"];
}

- (void).cxx_destruct
{
}

@end