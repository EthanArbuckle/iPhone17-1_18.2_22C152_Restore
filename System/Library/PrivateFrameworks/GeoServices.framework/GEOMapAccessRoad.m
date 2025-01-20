@interface GEOMapAccessRoad
+ (double)estimatedWidthForRoad:(id)a3;
- (BOOL)isBridge;
- (BOOL)isRail;
- (BOOL)isTunnel;
- (BOOL)speedLimitIsMPH;
- (GEOMapAccessRoad)initWithMap:(id)a3 roadEdge:(shared_ptr<geo::MapEdgeRoad>)a4;
- (NSString)description;
- (NSString)internalRoadName;
- (double)roadWidth;
- (id).cxx_construct;
- (id)findRoadsFrom:(id)a3 completionHandler:(id)a4;
- (id)findRoadsFromNextIntersection:(id)a3 completionHandler:(id)a4;
- (id)findRoadsFromPreviousIntersection:(id)a3 completionHandler:(id)a4;
- (id)findRoadsToNextIntersection:(id)a3 completionHandler:(id)a4;
- (id)findRoadsToPreviousIntersection:(id)a3 completionHandler:(id)a4;
- (id)tileKeys;
- (int)formOfWay;
- (int)rampType;
- (int)roadClass;
- (int)travelDirection;
- (unint64_t)roadID;
- (unint64_t)speedLimit;
- (void)roadEdgesWithHandler:(id)a3;
- (void)roadFeaturesWithHandler:(id)a3;
@end

@implementation GEOMapAccessRoad

- (GEOMapAccessRoad)initWithMap:(id)a3 roadEdge:(shared_ptr<geo::MapEdgeRoad>)a4
{
  ptr = a4.__ptr_;
  id v6 = a3;
  v7 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v14 = *(MapEdgeRoad **)ptr;
  v15 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13.receiver = self;
  v13.super_class = (Class)GEOMapAccessRoad;
  v8 = [(GEOMapAccessLine *)&v13 initWithMap:v6 edge:&v14];
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (v8)
  {
    v10 = *(MapEdgeRoad **)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v8->_roadEdge.__cntrl_;
    v8->_roadEdge.__ptr_ = v10;
    v8->_roadEdge.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v8->_roadID = 0;
  }

  return v8;
}

- (int)roadClass
{
  return (*(uint64_t (**)(void))(*(void *)self->_roadEdge.__ptr_ + 72))();
}

- (int)formOfWay
{
  return (*(uint64_t (**)(void))(*(void *)self->_roadEdge.__ptr_ + 80))();
}

- (int)travelDirection
{
  return (*(uint64_t (**)(void))(*(void *)self->_roadEdge.__ptr_ + 120))();
}

- (double)roadWidth
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  +[GEOMapAccessRoad estimatedWidthForRoad:v2];
  double v4 = v3;

  return v4;
}

- (unint64_t)speedLimit
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  unint64_t v3 = [v2 displaySpeedLimit];

  return v3;
}

- (BOOL)speedLimitIsMPH
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  char v3 = [v2 displaySpeedLimitIsMPH];

  return v3;
}

- (BOOL)isTunnel
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  char v3 = [v2 feature];
  double v4 = [v3 attributes];
  char v5 = [v4 isTunnel];

  return v5;
}

- (BOOL)isBridge
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  char v3 = [v2 feature];
  double v4 = [v3 attributes];
  char v5 = [v4 isBridge];

  return v5;
}

- (BOOL)isRail
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  char v3 = [v2 feature];
  double v4 = [v3 attributes];
  char v5 = [v4 isRailway];

  return v5;
}

- (int)rampType
{
  v2 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  char v3 = [v2 feature];
  double v4 = [v3 attributes];
  int v5 = [v4 rampType];

  return v5;
}

- (void)roadFeaturesWithHandler:(id)a3
{
  uint64_t v9 = (void (**)(id, void *))a3;
  if (v9)
  {
    ptr = self->_roadEdge.__ptr_;
    int v5 = (id *)*((void *)ptr + 5);
    for (i = (id *)*((void *)ptr + 6); v5 != i; ++v5)
    {
      id v7 = *v5;
      v8 = [v7 road];
      v9[2](v9, v8);
    }
  }
}

- (void)roadEdgesWithHandler:(id)a3
{
  v8 = (void (**)(id, id))a3;
  if (v8)
  {
    ptr = self->_roadEdge.__ptr_;
    int v5 = (id *)*((void *)ptr + 5);
    for (i = (id *)*((void *)ptr + 6); v5 != i; ++v5)
    {
      id v7 = *v5;
      v8[2](v8, v7);
    }
  }
}

- (id)findRoadsFrom:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__GEOMapAccessRoad_findRoadsFrom_completionHandler___block_invoke;
  v13[3] = &unk_1E53DAC28;
  v13[4] = self;
  id v14 = v6;
  uint64_t v9 = *(void (**)(MapEdgeRoad *, GEOMapAccess *, void *, id))(*(void *)ptr + 96);
  id v10 = v6;
  v11 = v9(ptr, map, v13, a4);

  return v11;
}

void __52__GEOMapAccessRoad_findRoadsFrom_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  double v4 = [GEOMapAccessRoad alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  uint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessRoad *)v4 initWithMap:v5 roadEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findRoadsFromPreviousIntersection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__GEOMapAccessRoad_findRoadsFromPreviousIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E53DAC28;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = geo::MapEdgeRoad::findEdgesFromStartNode((uint64_t)ptr, map, v12, a4);

  return v10;
}

void __72__GEOMapAccessRoad_findRoadsFromPreviousIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  double v4 = [GEOMapAccessRoad alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessRoad *)v4 initWithMap:v5 roadEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findRoadsToPreviousIntersection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__GEOMapAccessRoad_findRoadsToPreviousIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E53DAC28;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = geo::MapEdgeRoad::findEdgesToStartNode((uint64_t)ptr, map, v12, a4);

  return v10;
}

void __70__GEOMapAccessRoad_findRoadsToPreviousIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  double v4 = [GEOMapAccessRoad alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessRoad *)v4 initWithMap:v5 roadEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findRoadsFromNextIntersection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__GEOMapAccessRoad_findRoadsFromNextIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E53DAC28;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = geo::MapEdgeRoad::findEdgesFromEndNode((uint64_t)ptr, map, v12, a4);

  return v10;
}

void __68__GEOMapAccessRoad_findRoadsFromNextIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  double v4 = [GEOMapAccessRoad alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessRoad *)v4 initWithMap:v5 roadEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findRoadsToNextIntersection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__GEOMapAccessRoad_findRoadsToNextIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E53DAC28;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = geo::MapEdgeRoad::findEdgesToEndNode((uint64_t)ptr, map, v12, a4);

  return v10;
}

void __66__GEOMapAccessRoad_findRoadsToNextIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  double v4 = [GEOMapAccessRoad alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  id v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessRoad *)v4 initWithMap:v5 roadEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (NSString)internalRoadName
{
  v2 = (*(void (**)(MapEdgeRoad *, SEL))(*(void *)self->_roadEdge.__ptr_ + 64))(self->_roadEdge.__ptr_, a2);
  char v3 = v2;
  if (v2 && [v2 name])
  {
    double v4 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v3, "name"));
  }
  else
  {
    double v4 = 0;
  }

  return (NSString *)v4;
}

- (unint64_t)roadID
{
  v43[2] = *MEMORY[0x1E4F143B8];
  unint64_t roadID = self->_roadID;
  if (!roadID)
  {
    p_roadEdge = &self->_roadEdge;
    v41 = geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
    double v4 = (id *)*((void *)p_roadEdge->__ptr_ + 5);
    uint64_t v5 = (id *)*((void *)p_roadEdge->__ptr_ + 6);
    if (v4 != v5)
    {
      unsigned int v6 = -1;
      unsigned int v7 = -1;
      do
      {
        id v8 = *v4;
        id v9 = [v8 road];
        id v10 = [v9 feature];
        v11 = [v10 containingTile];

        long long v42 = 0uLL;
        uint64_t v12 = [v11 tileKey];
        uint64_t v13 = *(void *)v12;
        uint64_t v14 = *(void *)v12 << 32;
        unint64_t v15 = BYTE4(*(void *)v12) | ((((*(void *)v12 >> 40) | (*(unsigned __int16 *)(v12 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v12 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v12 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v12 + 10) >> 4) << 52);
        *(void *)((char *)v43 + 1) = v14 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v12 >> 8) & 0x3F) << 40);
        LOBYTE(v43[0]) = v13;
        *((void *)&v16 + 1) = v15;
        *(void *)&long long v16 = v14;
        *(void *)&long long v42 = v43[0];
        *((void *)&v42 + 1) = v16 >> 56;
        GEOTileKeyAssertIsStandard((uint64_t)&v42);
        unint64_t v17 = *(unsigned int *)((char *)&v42 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v42 + 13) | (HIBYTE(v42) << 16)) << 32);
        unsigned int v18 = ((*(void *)((char *)&v42 + 1) >> 46) | (*(_DWORD *)((char *)&v42 + 9) << 18)) & 0x3FFFFFF;
        if (v18 >= v6)
        {
          if (v18 != v6) {
            goto LABEL_9;
          }
          uint64_t v19 = (v17 >> 8) & 0x3FFFFFF;
          if (v19 >= v7) {
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v19 = (v17 >> 8) & 0x3FFFFFF;
        }
        id v20 = v9;

        unsigned int v7 = v19;
        unsigned int v6 = v18;
        v41 = v20;
LABEL_9:

        ++v4;
      }
      while (v4 != v5);
    }
    v21 = objc_msgSend(v41, "feature", 72, self);
    v22 = [v21 containingTile];

    uint64_t v23 = [v22 tileKey];
    uint64_t v24 = *(void *)v23;
    uint64_t v25 = *(void *)v23 << 32;
    unint64_t v26 = BYTE4(*(void *)v23) | ((((*(void *)v23 >> 40) | (*(unsigned __int16 *)(v23 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v23 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v23 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v23 + 10) >> 4) << 52);
    *(void *)((char *)v43 + 1) = v25 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v23 >> 8) & 0x3F) << 40);
    LOBYTE(v43[0]) = v24;
    *((void *)&v27 + 1) = v26;
    *(void *)&long long v27 = v25;
    *(void *)&long long v42 = v43[0];
    *((void *)&v42 + 1) = v27 >> 56;
    GEOTileKeyAssertIsStandard((uint64_t)&v42);
    int v28 = HIBYTE(v42);
    int v29 = *(unsigned __int16 *)((char *)&v42 + 13);
    uint64_t v30 = *(unsigned int *)((char *)&v42 + 9);
    uint64_t v31 = *(void *)((char *)&v42 + 1);
    uint64_t v32 = [v41 get];
    v33 = [v22 lines];
    v34 = [v33 objectAtIndex:0];
    uint64_t v35 = [v34 get];

    *((void *)&v27 + 1) = v30 | ((unint64_t)(v29 | (v28 << 16)) << 32);
    *(void *)&long long v27 = v31;
    uint64_t v36 = (v27 >> 8) & 0xFFFFFFC000000000;
    *(void *)&long long v27 = v31;
    unint64_t roadID = v36 | (v27 >> 60) & 0x3FFFFFF000 | (0x4EC4EC4EC4EC4EC5 * ((v32 - v35) >> 3));
    *(void *)(v40 + v38) = roadID;
  }
  return roadID;
}

- (id)tileKeys
{
  v19[2] = *MEMORY[0x1E4F143B8];
  char v3 = [[GEOTileKeyList alloc] initWithCapacity:(uint64_t)(*((void *)self->_roadEdge.__ptr_ + 6) - *((void *)self->_roadEdge.__ptr_ + 5)) >> 3];
  ptr = self->_roadEdge.__ptr_;
  uint64_t v5 = (id *)*((void *)ptr + 5);
  unsigned int v6 = (id *)*((void *)ptr + 6);
  while (v5 != v6)
  {
    id v7 = *v5;
    id v8 = [v7 road];
    id v9 = [v8 feature];
    id v10 = [v9 containingTile];

    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v11 = [v10 tileKey];
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *(void *)v11 << 32;
    unint64_t v14 = BYTE4(*(void *)v11) | ((((*(void *)v11 >> 40) | (*(unsigned __int16 *)(v11 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v11 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v11 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v11 + 10) >> 4) << 52);
    *(void *)((char *)v19 + 1) = v13 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v11 >> 8) & 0x3F) << 40);
    LOBYTE(v19[0]) = v12;
    *((void *)&v15 + 1) = v14;
    *(void *)&long long v15 = v13;
    uint64_t v17 = v19[0];
    uint64_t v18 = v15 >> 56;
    [(GEOTileKeyList *)v3 addKey:&v17];

    ++v5;
  }

  return v3;
}

- (NSString)description
{
  v2 = NSString;
  (*(void (**)(void **__return_ptr))(*(void *)self->_roadEdge.__ptr_ + 88))(__p);
  if (v7 >= 0) {
    char v3 = __p;
  }
  else {
    char v3 = (void **)__p[0];
  }
  double v4 = [v2 stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }

  return (NSString *)v4;
}

- (void).cxx_destruct
{
  cntrl = self->_roadEdge.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

+ (double)estimatedWidthForRoad:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  double v5 = 7.4;
  if (v3)
  {
    if ([v3 travelDirection])
    {
      unsigned int v6 = [v4 roadClass];
      if (v6 >= 7)
      {
        double v5 = 5.55;
        goto LABEL_9;
      }
      char v7 = (double *)&unk_18A63B390;
      goto LABEL_7;
    }
    unsigned int v6 = [v4 roadClass];
    if (v6 < 8)
    {
      char v7 = (double *)&unk_18A63B350;
LABEL_7:
      double v5 = v7[v6];
    }
  }
LABEL_9:

  return v5;
}

@end