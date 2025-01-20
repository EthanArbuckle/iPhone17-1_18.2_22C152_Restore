@interface GEOMapEdgeRoadBuilder
- (BOOL)_findEdgeAheadInTile:(id)a3;
- (BOOL)_findEdgeBehindInTile:(id)a3;
- (BOOL)_shouldFindEdgeAhead;
- (BOOL)_shouldFindEdgeBehind;
- (GEOMapEdgeRoadBuilder)initWithMap:(id)a3 roadFeature:(id)a4 shouldFlip:(BOOL)a5;
- (Matrix<float,)_firstPoint;
- (Matrix<float,)_lastPoint;
- (id).cxx_construct;
- (id)_firstTile;
- (id)_lastTile;
- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
- (unint64_t)_connectionTypeForEdge:(id)a3 points:(GeoCodecsVectorTilePoint *)a4 connectingTilePoint:()Matrix<float;
- (unint64_t)_maxTileCount;
- (void)_buildCompleteEdge;
- (void)dealloc;
@end

@implementation GEOMapEdgeRoadBuilder

- (GEOMapEdgeRoadBuilder)initWithMap:(id)a3 roadFeature:(id)a4 shouldFlip:(BOOL)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)GEOMapEdgeRoadBuilder;
  id v10 = [(GEOMapEdgeBuilder *)&v27 initWithMap:v8];
  if (v10)
  {
    v11 = [v9 feature];
    v12 = [v11 containingTile];
    uint64_t v13 = GEOVectorTileRetain(v12);
    v14 = (void *)*((void *)v10 + 22);
    *((void *)v10 + 22) = v13;

    v15 = (void *)*((void *)v10 + 22);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__GEOMapEdgeRoadBuilder_initWithMap_roadFeature_shouldFlip___block_invoke;
    v24[3] = &unk_1E53F5878;
    BOOL v26 = a5;
    v16 = v10;
    id v25 = v16;
    [v15 forEachEdgeInRoad:v9 visitTwice:0 visitor:v24];
    v16[33] = [v16 _shouldFindEdgeAhead];
    v16[34] = [v16 _shouldFindEdgeBehind];
    uint64_t v17 = [*((id *)v10 + 22) tileKey];
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)v17 << 32;
    unint64_t v20 = BYTE4(*(void *)v17) | ((((*(void *)v17 >> 40) | (*(unsigned __int16 *)(v17 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v17 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v17 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v17 + 10) >> 4) << 52);
    *(void *)((char *)v29 + 1) = v19 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v17 >> 8) & 0x3F) << 40);
    LOBYTE(v29[0]) = v18;
    *((void *)&v21 + 1) = v20;
    *(void *)&long long v21 = v19;
    *(void *)&long long v28 = v29[0];
    *((void *)&v28 + 1) = v21 >> 56;
    std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)(v16 + 72), &v28, &v28);
    v22 = v16;
  }
  return (GEOMapEdgeRoadBuilder *)v10;
}

void __60__GEOMapEdgeRoadBuilder_initWithMap_roadFeature_shouldFlip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    v4 = (void *)[v3 copy];
    GEORoadEdgeFlip(v4);
    uint64_t v5 = *(void *)(a1 + 32) + 128;
    unint64_t v6 = *(void *)(v5 + 32);
    if (!v6)
    {
      std::deque<GEORoadEdge * {__strong}>::__add_front_capacity((char **)v5);
      unint64_t v6 = *(void *)(v5 + 32);
    }
    uint64_t v7 = *(void *)(v5 + 8);
    id v8 = (void *)(v7 + 8 * (v6 >> 9));
    uint64_t v9 = *v8 + 8 * (v6 & 0x1FF);
    if (*(void *)(v5 + 16) == v7) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v10 == *v8) {
      uint64_t v10 = *(v8 - 1) + 4096;
    }
    id v11 = v4;
    *(void *)(v10 - 8) = v11;
    *(int64x2_t *)(v5 + 32) = vaddq_s64(*(int64x2_t *)(v5 + 32), (int64x2_t)xmmword_18A62C080);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = (id)[v3 copy];
    std::deque<GEORoadEdge * {__strong}>::push_back((void *)(v12 + 128), (uint64_t *)&v14);
    id v11 = v14;
  }
}

- (void)dealloc
{
  GEOVectorTileRelease((void *)self->_edges.__size_.__value_);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapEdgeRoadBuilder;
  [(GEOMapRequest *)&v3 dealloc];
}

- (unint64_t)_maxTileCount
{
  return 4;
}

- (void)_buildCompleteEdge
{
  value = self->_edges.__map_.var2.__value_;
  first = self->_edges.__map_.__first_;
  uint64_t v5 = (char *)&first[(unint64_t)value >> 9];
  if (self->_edges.__map_.var0 == first)
  {
    unint64_t v6 = 0;
    uint64_t v9 = 0;
    id v8 = &first[((unint64_t)value + self->_edges.__start_) >> 9];
  }
  else
  {
    unint64_t v6 = (void **)(*(void *)v5 + 8 * ((uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF));
    unint64_t v7 = (unint64_t)value + self->_edges.__start_;
    id v8 = &first[v7 >> 9];
    uint64_t v9 = (uint64_t)&(*v8)[v7 & 0x1FF];
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if ((void **)v9 != v6)
  {
    uint64_t v10 = ((v9 - (uint64_t)*v8) >> 3) + (((char *)v8 - v5) << 6);
    uint64_t v11 = (uint64_t)v6 - *(void *)v5;
    v24 = (void **)&v21;
    LOBYTE(v25) = 0;
    if (v10 != v11 >> 3)
    {
      std::vector<unsigned long long>::__vallocate[abi:ne180100](&v21, v10 - (v11 >> 3));
      uint64_t v12 = 0;
      uint64_t v13 = v22;
      do
      {
        id v14 = *v6++;
        *(void *)(v13 + v12) = v14;
        if ((void **)((char *)v6 - *(void *)v5) == (void **)4096)
        {
          v15 = (void **)*((void *)v5 + 1);
          v5 += 8;
          unint64_t v6 = v15;
        }
        v12 += 8;
      }
      while (v6 != (void **)v9);
      uint64_t v22 = v13 + v12;
    }
  }
  std::allocate_shared[abi:ne180100]<geo::MapEdgeRoad,std::allocator<geo::MapEdgeRoad>,std::vector<GEORoadEdge * {__strong}> &,void>(&v21, &v24);
  v16 = v25;
  currentTileFinder = self->super._currentTileFinder;
  if (currentTileFinder)
  {
    uint64_t v19 = v24;
    unint64_t v20 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ((void (*)(GEOMapTileFinder *, void ***))currentTileFinder->super._completionHandler)(currentTileFinder, &v19);
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    uint64_t v18 = self->super._currentTileFinder;
    self->super._currentTileFinder = 0;
  }
  [(GEOMapRequest *)self complete];
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  v24 = (void **)&v21;
  std::vector<GEORoadEdge * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v24);
}

- (BOOL)_findEdgeAheadInTile:(id)a3
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_retain((*(__begin_ ***)((char *)self->_edges.__map_.__first_
                                  + (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF]);
  unint64_t v6 = [(__begin_ *)v5 road];
  unint64_t v7 = [v6 feature];
  id v8 = [v7 containingTile];
  uint64_t v9 = [v8 tileKey];
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)v9 << 32;
  unint64_t v12 = BYTE4(*(void *)v9) | ((((*(void *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v9 + 10) >> 4) << 52);
  *(void *)((char *)&v42 + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v9 >> 8) & 0x3F) << 40);
  LOBYTE(v42) = v10;
  *((void *)&v13 + 1) = v12;
  *(void *)&long long v13 = v11;
  v46[0] = v42;
  v46[1] = v13 >> 56;

  double v14 = GEOMapRectForGEOTileKey((uint64_t)v46);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  float v22 = *((float *)&self->super.super._isFinished + 1);
  float v21 = *(float *)&self->super._buildAhead;
  uint64_t v23 = [v4 tileKey];
  uint64_t v24 = *(void *)v23;
  uint64_t v25 = *(void *)v23 << 32;
  unint64_t v26 = BYTE4(*(void *)v23) | ((((*(void *)v23 >> 40) | (*(unsigned __int16 *)(v23 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v23 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v23 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v23 + 10) >> 4) << 52);
  *(void *)((char *)&v42 + 1) = v25 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v23 >> 8) & 0x3F) << 40);
  LOBYTE(v42) = v24;
  *((void *)&v13 + 1) = v26;
  *(void *)&long long v13 = v25;
  v45[0] = v42;
  v45[1] = v13 >> 56;
  double v27 = GEOMapRectForGEOTileKey((uint64_t)v45);
  double v28 = v16 + (float)(1.0 - v21) * v20;
  *(float *)&double v16 = (v14 + v22 * v18 - v27) / v29;
  *(float *)&double v20 = (v31 - (v28 - v30)) / v31;
  *(void *)&long long v42 = 0;
  *((void *)&v42 + 1) = &v42;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke;
  v35[3] = &unk_1E53F58F0;
  v39 = &v42;
  v32 = v5;
  v36 = v32;
  id v33 = v4;
  id v37 = v33;
  v38 = self;
  int v40 = LODWORD(v16);
  int v41 = LODWORD(v20);
  [v33 forEachRoad:v35];
  LOBYTE(v4) = *(unsigned char *)(*((void *)&v42 + 1) + 24) != 0;

  _Block_object_dispose(&v42, 8);
  return (char)v4;
}

void __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v5 = (geo::codec *)[v3 getRoad];
    unint64_t v6 = [*(id *)(a1 + 32) road];
    unint64_t v7 = (const GeoCodecsRoadFeature *)[v6 getRoad];
    LODWORD(v5) = geo::codec::multiSectionFeatureIsSameRoad(v5, v7, v8);

    if (v5)
    {
      uint64_t v9 = geo::codec::multiSectionFeaturePoints((void *)[v4 get], 0, &v23);
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      char v22 = 0;
      uint64_t v10 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_2;
      v16[3] = &unk_1E53F58A0;
      long long v17 = *(_OWORD *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 64);
      double v19 = v9;
      uint64_t v20 = v11;
      double v18 = v21;
      [v10 forEachEdgeInRoad:v4 visitTwice:0 visitor:v16];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        unint64_t v12 = *(void **)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(v13 + 168);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_3;
        v15[3] = &unk_1E53F58C8;
        v15[4] = v13;
        v15[5] = v21;
        v15[6] = v14;
        [v12 forEachEdgeInRoad:v4 visitTwice:0 visitor:v15];
      }
      _Block_object_dispose(v21, 8);
    }
  }
}

void __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 64);
    LODWORD(v5) = *(_DWORD *)(a1 + 68);
    id v7 = v3;
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_connectionTypeForEdge:points:connectingTilePoint:", v3, *(void *)(a1 + 56), v4, v5);
    id v3 = v7;
    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 == 1;
    }
  }
}

void __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v19 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = v3;
    GEORoadEdgeFlip(v4);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v4 copy];
    uint64_t v7 = v5 + 128;
    unint64_t v8 = *(void *)(v7 + 32);
    if (!v8)
    {
      std::deque<GEORoadEdge * {__strong}>::__add_front_capacity((char **)v7);
      unint64_t v8 = *(void *)(v7 + 32);
    }
    uint64_t v9 = *(void *)(v7 + 8);
    uint64_t v10 = (void *)(v9 + 8 * (v8 >> 9));
    uint64_t v11 = *v10 + 8 * (v8 & 0x1FF);
    if (*(void *)(v7 + 16) == v9) {
      uint64_t v11 = 0;
    }
    if (v11 == *v10) {
      uint64_t v11 = *(v10 - 1) + 4096;
    }
    *(void *)(v11 - 8) = v6;
    *(int64x2_t *)(v7 + 32) = vaddq_s64(*(int64x2_t *)(v7 + 32), (int64x2_t)xmmword_18A62C080);
  }
  else
  {
    unint64_t v12 = (int64x2_t *)(*(void *)(a1 + 32) + 128);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 136);
    uint64_t v14 = (void *)(v13 + 8 * (*(void *)(*(void *)(a1 + 32) + 160) >> 9));
    if (*(void *)(*(void *)(a1 + 32) + 144) == v13) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = *v14 + 8 * (*(void *)(*(void *)(a1 + 32) + 160) & 0x1FFLL);
    }
    double v16 = (char *)std::__deque_iterator<GEORoadEdge * {__strong},GEORoadEdge * {__strong}*,GEORoadEdge * {__strong}&,GEORoadEdge * {__strong}**,long,512l>::operator+[abi:ne180100](v14, v15, *(_DWORD *)(*(void *)(a1 + 32) + 168) - *(_DWORD *)(a1 + 48));
    uint64_t v18 = v17;
    uint64_t v20 = [v19 copy];
    std::deque<GEORoadEdge * {__strong}>::insert(v12, v16, v18, (void **)&v20);
    id v4 = (id)v20;
  }
}

- (BOOL)_findEdgeBehindInTile:(id)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  uint64_t v6 = (*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v5 >> 6) & 0x3FFFFFFFFFFFFF8)))[v5 & 0x1FF];
  uint64_t v7 = [(__begin_ *)v6 road];
  unint64_t v8 = [v7 feature];
  uint64_t v9 = [v8 containingTile];
  uint64_t v10 = [v9 tileKey];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(void *)v10 << 32;
  unint64_t v13 = BYTE4(*(void *)v10) | ((((*(void *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) >> 4) << 52);
  *(void *)((char *)&v43 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v43) = v11;
  *((void *)&v14 + 1) = v13;
  *(void *)&long long v14 = v12;
  v47[0] = v43;
  v47[1] = v14 >> 56;

  double v15 = GEOMapRectForGEOTileKey((uint64_t)v47);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  float v23 = self->super._firstTilePoint._e[0];
  float v22 = self->super._firstTilePoint._e[1];
  uint64_t v24 = [v4 tileKey];
  uint64_t v25 = *(void *)v24;
  uint64_t v26 = *(void *)v24 << 32;
  unint64_t v27 = BYTE4(*(void *)v24) | ((((*(void *)v24 >> 40) | (*(unsigned __int16 *)(v24 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v24 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v24 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v24 + 10) >> 4) << 52);
  *(void *)((char *)&v43 + 1) = v26 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v24 >> 8) & 0x3F) << 40);
  LOBYTE(v43) = v25;
  *((void *)&v14 + 1) = v27;
  *(void *)&long long v14 = v26;
  v46[0] = v43;
  v46[1] = v14 >> 56;
  double v28 = GEOMapRectForGEOTileKey((uint64_t)v46);
  double v29 = v17 + (float)(1.0 - v22) * v21;
  *(float *)&double v17 = (v15 + v23 * v19 - v28) / v30;
  *(float *)&double v21 = (v32 - (v29 - v31)) / v32;
  *(void *)&long long v43 = 0;
  *((void *)&v43 + 1) = &v43;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke;
  v36[3] = &unk_1E53F58F0;
  int v40 = &v43;
  id v33 = v6;
  id v37 = v33;
  id v34 = v4;
  id v38 = v34;
  v39 = self;
  int v41 = LODWORD(v17);
  int v42 = LODWORD(v21);
  [v34 forEachRoad:v36];
  LOBYTE(v4) = *(unsigned char *)(*((void *)&v43 + 1) + 24) != 0;

  _Block_object_dispose(&v43, 8);
  return (char)v4;
}

void __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    unint64_t v5 = (geo::codec *)[v3 getRoad];
    uint64_t v6 = [*(id *)(a1 + 32) road];
    uint64_t v7 = (const GeoCodecsRoadFeature *)[v6 getRoad];
    LODWORD(v5) = geo::codec::multiSectionFeatureIsSameRoad(v5, v7, v8);

    if (v5)
    {
      uint64_t v9 = geo::codec::multiSectionFeaturePoints((void *)[v4 get], 0, &v23);
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      char v22 = 0;
      uint64_t v10 = *(void **)(a1 + 40);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_2;
      v16[3] = &unk_1E53F58A0;
      long long v17 = *(_OWORD *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 64);
      double v19 = v9;
      uint64_t v20 = v11;
      double v18 = v21;
      [v10 forEachEdgeInRoad:v4 visitTwice:0 visitor:v16];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        uint64_t v12 = *(void **)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(v13 + 168);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_3;
        v15[3] = &unk_1E53F58C8;
        v15[4] = v13;
        v15[5] = v21;
        v15[6] = v14;
        [v12 forEachEdgeInRoad:v4 visitTwice:0 visitor:v15];
      }
      _Block_object_dispose(v21, 8);
    }
  }
}

void __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 64);
    LODWORD(v5) = *(_DWORD *)(a1 + 68);
    id v7 = v3;
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_connectionTypeForEdge:points:connectingTilePoint:", v3, *(void *)(a1 + 56), v4, v5);
    id v3 = v7;
    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 == 2;
    }
  }
}

void __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = v3;
    GEORoadEdgeFlip(v4);
    double v5 = (int64x2_t *)(*(void *)(a1 + 32) + 128);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 168);
    unint64_t v7 = *(void *)(*(void *)(a1 + 32) + 160) + v6;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 136);
    uint64_t v9 = (void *)(v8 + 8 * (v7 >> 9));
    if (*(void *)(*(void *)(a1 + 32) + 144) == v8) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = *v9 + 8 * (v7 & 0x1FF);
    }
    uint64_t v12 = (char *)std::__deque_iterator<GEORoadEdge * {__strong},GEORoadEdge * {__strong}*,GEORoadEdge * {__strong}&,GEORoadEdge * {__strong}**,long,512l>::operator-[abi:ne180100](v9, v10, (int)v6 - *(_DWORD *)(a1 + 48));
    uint64_t v14 = v13;
    double v16 = (void *)[v4 copy];
    std::deque<GEORoadEdge * {__strong}>::insert(v5, v12, v14, &v16);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    long long v17 = (void *)[v3 copy];
    std::deque<GEORoadEdge * {__strong}>::push_back((void *)(v11 + 128), (uint64_t *)&v17);
    id v4 = v17;
  }
}

- (BOOL)_shouldFindEdgeAhead
{
  return [(*(__begin_ ***)((char *)self->_edges.__map_.__first_+ (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF] junctionA] == 0;
}

- (BOOL)_shouldFindEdgeBehind
{
  unint64_t v2 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  return [(*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v2 >> 6) & 0x3FFFFFFFFFFFFF8)))[v2 & 0x1FF] junctionB] == 0;
}

- (unint64_t)_connectionTypeForEdge:(id)a3 points:(GeoCodecsVectorTilePoint *)a4 connectingTilePoint:()Matrix<float
{
  Matrix<float, 2, 1> v12 = a5;
  id v7 = a3;
  uint64_t v8 = &a4[[v7 vertexIndexA]];
  uint64_t v9 = &a4[[v7 vertexIndexB]];
  if ([v7 junctionA]
    || ![(GEOMapEdgeBuilder *)self _edgeStart:v8 end:v9 connectsTo:&v12])
  {
    if ([v7 junctionB]
      || ![(GEOMapEdgeBuilder *)self _edgeStart:v9 end:v8 connectsTo:&v12])
    {
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v10 = 2;
    }
  }
  else
  {
    unint64_t v10 = 1;
  }

  return v10;
}

- (Matrix<float,)_firstPoint
{
  unint64_t v2 = objc_retain((*(__begin_ ***)((char *)self->_edges.__map_.__first_
                                  + (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF]);
  id v3 = [(__begin_ *)v2 road];
  id v4 = geo::codec::multiSectionFeaturePoints((void *)[v3 get], 0, &v10);

  double v5 = (float *)&v4[[(__begin_ *)v2 vertexIndexA]];
  float v6 = *v5;
  float v7 = v5[1];

  float v8 = v6;
  float v9 = v7;
  result._e[1] = v9;
  result._e[0] = v8;
  return result;
}

- (Matrix<float,)_lastPoint
{
  unint64_t v2 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  id v3 = (*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v2 >> 6) & 0x3FFFFFFFFFFFFF8)))[v2 & 0x1FF];
  id v4 = [(__begin_ *)v3 road];
  double v5 = geo::codec::multiSectionFeaturePoints((void *)[v4 get], 0, &v11);

  float v6 = (float *)&v5[[(__begin_ *)v3 vertexIndexB]];
  float v7 = *v6;
  float v8 = v6[1];

  float v9 = v7;
  float v10 = v8;
  result._e[1] = v10;
  result._e[0] = v9;
  return result;
}

- (id)_firstTile
{
  unint64_t v2 = [(*(__begin_ ***)((char *)self->_edges.__map_.__first_+ (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF] road];
  id v3 = [v2 feature];
  id v4 = [v3 containingTile];

  return v4;
}

- (id)_lastTile
{
  unint64_t v2 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  id v3 = [(*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v2 >> 6) & 0x3FFFFFFFFFFFFF8)))[v2 & 0x1FF] road];
  id v4 = [v3 feature];
  double v5 = [v4 containingTile];

  return v5;
}

- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double v5 = +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", a3, a4.var0, a4.var1, a5);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges.__size_, 0);
  p_buildDirection = &self->super._buildDirection;
  id v4 = (void **)p_buildDirection[1];
  double v5 = (void **)p_buildDirection[2];
  if (v5 == v4)
  {
    float v6 = p_buildDirection + 5;
    double v5 = (void **)p_buildDirection[1];
  }
  else
  {
    float v6 = p_buildDirection + 5;
    unint64_t v7 = p_buildDirection[4];
    float v8 = &v4[v7 >> 9];
    float v9 = (void **)((char *)*v8 + 8 * (v7 & 0x1FF));
    uint64_t v10 = *(uint64_t *)((char *)v4 + (((p_buildDirection[5] + v7) >> 6) & 0x3FFFFFFFFFFFFF8))
        + 8 * ((p_buildDirection[5] + v7) & 0x1FF);
    if (v9 != (void **)v10)
    {
      do
      {
        uint64_t v11 = *v9++;

        if ((char *)v9 - (unsigned char *)*v8 == 4096)
        {
          Matrix<float, 2, 1> v12 = (void **)v8[1];
          ++v8;
          float v9 = v12;
        }
      }
      while (v9 != (void **)v10);
      id v4 = (void **)p_buildDirection[1];
      double v5 = (void **)p_buildDirection[2];
    }
  }
  *float v6 = 0;
  unint64_t v13 = (char *)v5 - (char *)v4;
  if ((unint64_t)((char *)v5 - (char *)v4) >= 0x11)
  {
    do
    {
      operator delete(*v4);
      double v5 = (void **)p_buildDirection[2];
      id v4 = (void **)(p_buildDirection[1] + 8);
      p_buildDirection[1] = (unint64_t)v4;
      unint64_t v13 = (char *)v5 - (char *)v4;
    }
    while ((unint64_t)((char *)v5 - (char *)v4) > 0x10);
  }
  unint64_t v14 = v13 >> 3;
  if (v14 == 1)
  {
    uint64_t v15 = 256;
    goto LABEL_14;
  }
  if (v14 == 2)
  {
    uint64_t v15 = 512;
LABEL_14:
    p_buildDirection[4] = v15;
  }
  if (v4 != v5)
  {
    do
    {
      double v16 = *v4++;
      operator delete(v16);
    }
    while (v4 != v5);
    unint64_t v18 = p_buildDirection[1];
    unint64_t v17 = p_buildDirection[2];
    if (v17 != v18) {
      p_buildDirection[2] = v17 + ((v18 - v17 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  double v19 = (void *)*p_buildDirection;
  if (*p_buildDirection)
  {
    operator delete(v19);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  return self;
}

@end