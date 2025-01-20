@interface GEOMapEdgeTransitBuilder
- (BOOL)_findEdgeAheadInTile:(id)a3;
- (BOOL)_findEdgeBehindInTile:(id)a3;
- (BOOL)_shouldFindEdgeAhead;
- (BOOL)_shouldFindEdgeBehind;
- (GEOMapEdgeTransitBuilder)initWithMap:(id)a3 firstPiece:(const TransitEdgePiece *)a4;
- (Matrix<float,)_firstPoint;
- (Matrix<float,)_lastPoint;
- (id).cxx_construct;
- (id)_firstTile;
- (id)_lastTile;
- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
- (unint64_t)_maxTileCount;
- (void)_buildCompleteEdge;
@end

@implementation GEOMapEdgeTransitBuilder

- (GEOMapEdgeTransitBuilder)initWithMap:(id)a3 firstPiece:(const TransitEdgePiece *)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)GEOMapEdgeTransitBuilder;
  v7 = [(GEOMapEdgeBuilder *)&v32 initWithMap:v6];
  v8 = v7;
  if (v7)
  {
    std::deque<geo::TransitEdgePiece>::push_back(&v7->super._buildDirection, (uint64_t)a4);
    id v31 = a4->var0;
    v30 = [v31 containingTile];
    uint64_t v9 = [v30 tileKey];
    uint64_t v10 = *(void *)v9;
    uint64_t v11 = *(void *)v9 << 32;
    unint64_t v12 = BYTE4(*(void *)v9) | ((((*(void *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v9 + 10) >> 4) << 52);
    *(void *)((char *)v34 + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v9 >> 8) & 0x3F) << 40);
    LOBYTE(v34[0]) = v10;
    *((void *)&v13 + 1) = v12;
    *(void *)&long long v13 = v11;
    *(void *)&long long v33 = v34[0];
    *((void *)&v33 + 1) = v13 >> 56;
    std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v8->super._edgeHandler, &v33, &v33);
    v14 = geo::codec::transitLinkGetFromNodeID([a4->var0 get], a4->var1);
    id v15 = v30;
    unint64_t v16 = -1;
    uint64_t v17 = 40;
    do
    {
      unint64_t v18 = [v15 transitNodeCount];
      if (++v16 >= v18) {
        break;
      }
      v19 = *(void **)([v15 transitNodes] + v17);
      v17 += 344;
    }
    while (v19 != v14);

    v20 = geo::codec::transitLinkGetToNodeID([a4->var0 get], a4->var1);
    id v21 = v15;
    unint64_t v22 = -1;
    uint64_t v23 = 40;
    do
    {
      unint64_t v24 = [v21 transitNodeCount];
      if (++v22 >= v24) {
        break;
      }
      v25 = *(void **)([v21 transitNodes] + v23);
      v23 += 344;
    }
    while (v25 != v20);
    BOOL v26 = v22 >= v24;

    if (a4->var4) {
      BOOL v27 = v26;
    }
    else {
      BOOL v27 = v16 >= v18;
    }
    *(&v8->super.super._isFinished + 1) = v27;
    if (a4->var4) {
      BOOL v28 = v16 >= v18;
    }
    else {
      BOOL v28 = v26;
    }
    *(&v8->super.super._isFinished + 2) = v28;
  }
  return v8;
}

- (unint64_t)_maxTileCount
{
  return 10;
}

- (void)_buildCompleteEdge
{
  std::allocate_shared[abi:ne180100]<geo::MapEdgeTransit,std::allocator<geo::MapEdgeTransit>,std::deque<geo::TransitEdgePiece> &,void>(&self->super._buildDirection, &v7);
  v3 = v8;
  currentTileFinder = self->super._currentTileFinder;
  if (currentTileFinder)
  {
    uint64_t v5 = v7;
    id v6 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ((void (*)(GEOMapTileFinder *, uint64_t *))currentTileFinder->super._completionHandler)(currentTileFinder, &v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
  [(GEOMapRequest *)self complete];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

- (BOOL)_findEdgeAheadInTile:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v62 = (float *)self;
  p_buildDirection = &self->super._buildDirection;
  value = self->_pieces.__map_.__end_cap_.__value_;
  uint64_t v7 = *(uint64_t *)((char *)self->_pieces.__map_.__first_ + (((unint64_t)value >> 4) & 0xFFFFFFFFFFFFFF8));
  uint64_t v8 = value & 0x7F;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v9 = [*(id *)(v7 + 32 * v8) containingTile];
  uint64_t v10 = [v9 tileKey];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(void *)v10 << 32;
  unint64_t v13 = BYTE4(*(void *)v10) | ((((*(void *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) >> 4) << 52);
  *(void *)((char *)&v69 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v11;
  *((void *)&v14 + 1) = v13;
  *(void *)&long long v14 = v12;
  uint64_t v74 = v69;
  uint64_t v75 = v14 >> 56;

  double v15 = GEOMapRectForGEOTileKey((uint64_t)&v74);
  double v19 = v17 + (float)(1.0 - v62[10]) * v18;
  v68[0] = v15 + v62[9] * v16;
  v68[1] = v19;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v20 = [v4 tileKey];
  v60 = (int64x2_t *)p_buildDirection;
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *(void *)v20 << 32;
  unint64_t v23 = BYTE4(*(void *)v20) | ((((*(void *)v20 >> 40) | (*(unsigned __int16 *)(v20 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v20 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v20 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v20 + 10) >> 4) << 52);
  *(void *)((char *)&v69 + 1) = v22 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v20 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v21;
  *((void *)&v14 + 1) = v23;
  *(void *)&long long v14 = v22;
  uint64_t v72 = v69;
  uint64_t v73 = v14 >> 56;
  unint64_t v24 = 0;
  *(void *)&long long v69 = GEOMapRectForGEOTileKey((uint64_t)&v72);
  *((void *)&v69 + 1) = v25;
  uint64_t v70 = v26;
  uint64_t v71 = v27;
  v61 = (id *)(v7 + 32 * v8 + 16);
  while (1)
  {
    unint64_t v28 = [v4 transitLinkCount];
    if (v24 >= v28) {
      break;
    }
    v29 = [v4 transitLinks];
    v30 = [v29 objectAtIndex:v24];

    id v31 = v30;
    objc_super v32 = v31;
    if (v31)
    {
      id v33 = v31;
      if ([v31 sectionCount])
      {
        v34 = [v32 containingTile];
        uint64_t v35 = [v34 transitVertices];
        uint64_t v36 = *(void *)(v35 + 32);
        unint64_t v37 = *(void *)(v36 + 16 * [v32 sectionOffset]);
        uint64_t v38 = *(void *)(v35 + 32);
        LODWORD(v35) = [v32 sectionOffset];
        v39 = (void *)(v38 + 16 * (v35 + [v32 sectionCount] - 1));
        LOBYTE(v35) = v37 < *v39 + v39[1] - 1;

        if ((v35 & 1) == 0) {
          goto LABEL_20;
        }
        id v40 = v32;
        if (*v61)
        {
          v41 = [*v61 feature];
          uint64_t v42 = [v41 featureID];
        }
        else
        {
          uint64_t v42 = 0;
        }
        for (unint64_t i = 0; ; ++i)
        {
          if (i >= *(void *)([v40 transitIndexRange] + 8))
          {
            unint64_t i = 0;
            id v47 = 0;
            goto LABEL_16;
          }
          v44 = GEOVectorTransitLineAlongLink(v40, i);
          v45 = [v44 feature];
          BOOL v46 = v42 == [v45 featureID];

          if (v46) {
            break;
          }
        }
        id v47 = v44;

LABEL_16:
        id v33 = v47;
        if (v33)
        {
          id v48 = v40;
          id v63 = 0;
          uint64_t v49 = GEOTransitLinkPoints(v48, 0, &v63);

          if ([v62 _pointConnects:v49 rect:&v69 to:v68])
          {
            int v53 = geo::codec::transitTravelTimeForLineAlongLink((void *)[v48 get], i);
            id v54 = v48;
            id v55 = v33;
            id v63 = v54;
            unint64_t v64 = i;
            id v65 = v55;
            int v66 = v53;
            char v67 = 1;
            std::deque<geo::TransitEdgePiece>::push_front(v60, (uint64_t)&v63);

LABEL_23:
            break;
          }
          id v50 = v48;
          id v63 = 0;
          uint64_t v51 = GEOTransitLinkPoints(v50, [v50 sectionCount] - 1, &v63);
          id v52 = v63;

          if ([v62 _pointConnects:v51 + 8 * (void)v52 - 8 rect:&v69 to:v68])
          {
            int v56 = geo::codec::transitTravelTimeForLineAlongLink((void *)[v50 get], i);
            id v57 = v50;
            id v58 = v33;
            id v63 = v57;
            unint64_t v64 = i;
            id v65 = v58;
            int v66 = v56;
            char v67 = 0;
            std::deque<geo::TransitEdgePiece>::push_front(v60, (uint64_t)&v63);

            goto LABEL_23;
          }
        }
      }
    }
    else
    {
      id v33 = 0;
    }

LABEL_20:
    ++v24;
  }

  return v24 < v28;
}

- (BOOL)_findEdgeBehindInTile:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v62 = self;
  p_buildDirection = &self->super._buildDirection;
  unint64_t v6 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  uint64_t v7 = *(uint64_t *)((char *)self->_pieces.__map_.__first_ + ((v6 >> 4) & 0xFFFFFFFFFFFFFF8));
  unint64_t v8 = v6 & 0x7F;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v9 = [*(id *)(v7 + 32 * v8) containingTile];
  uint64_t v10 = [v9 tileKey];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *(void *)v10 << 32;
  unint64_t v13 = BYTE4(*(void *)v10) | ((((*(void *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v10 + 10) >> 4) << 52);
  *(void *)((char *)&v69 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v11;
  *((void *)&v14 + 1) = v13;
  *(void *)&long long v14 = v12;
  uint64_t v74 = v69;
  uint64_t v75 = v14 >> 56;

  double v15 = GEOMapRectForGEOTileKey((uint64_t)&v74);
  double v19 = v17 + (float)(1.0 - v62->super._firstTilePoint._e[1]) * v18;
  v68[0] = v15 + v62->super._firstTilePoint._e[0] * v16;
  v68[1] = v19;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v20 = [v4 tileKey];
  v60 = p_buildDirection;
  uint64_t v21 = *(void *)v20;
  uint64_t v22 = *(void *)v20 << 32;
  unint64_t v23 = BYTE4(*(void *)v20) | ((((*(void *)v20 >> 40) | (*(unsigned __int16 *)(v20 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v20 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v20 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v20 + 10) >> 4) << 52);
  *(void *)((char *)&v69 + 1) = v22 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v20 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v21;
  *((void *)&v14 + 1) = v23;
  *(void *)&long long v14 = v22;
  uint64_t v72 = v69;
  uint64_t v73 = v14 >> 56;
  unint64_t v24 = 0;
  *(void *)&long long v69 = GEOMapRectForGEOTileKey((uint64_t)&v72);
  *((void *)&v69 + 1) = v25;
  uint64_t v70 = v26;
  uint64_t v71 = v27;
  v61 = (id *)(v7 + 32 * v8 + 16);
  while (1)
  {
    unint64_t v28 = [v4 transitLinkCount];
    if (v24 >= v28) {
      break;
    }
    v29 = [v4 transitLinks];
    v30 = [v29 objectAtIndex:v24];

    id v31 = v30;
    objc_super v32 = v31;
    if (v31)
    {
      id v33 = v31;
      if ([v31 sectionCount])
      {
        v34 = [v32 containingTile];
        uint64_t v35 = [v34 transitVertices];
        uint64_t v36 = *(void *)(v35 + 32);
        unint64_t v37 = *(void *)(v36 + 16 * [v32 sectionOffset]);
        uint64_t v38 = *(void *)(v35 + 32);
        LODWORD(v35) = [v32 sectionOffset];
        v39 = (void *)(v38 + 16 * (v35 + [v32 sectionCount] - 1));
        LOBYTE(v35) = v37 < *v39 + v39[1] - 1;

        if ((v35 & 1) == 0) {
          goto LABEL_20;
        }
        id v40 = v32;
        if (*v61)
        {
          v41 = [*v61 feature];
          uint64_t v42 = [v41 featureID];
        }
        else
        {
          uint64_t v42 = 0;
        }
        for (unint64_t i = 0; ; ++i)
        {
          if (i >= *(void *)([v40 transitIndexRange] + 8))
          {
            unint64_t i = 0;
            id v47 = 0;
            goto LABEL_16;
          }
          v44 = GEOVectorTransitLineAlongLink(v40, i);
          v45 = [v44 feature];
          BOOL v46 = v42 == [v45 featureID];

          if (v46) {
            break;
          }
        }
        id v47 = v44;

LABEL_16:
        id v33 = v47;
        if (v33)
        {
          id v48 = v40;
          id v63 = 0;
          uint64_t v49 = GEOTransitLinkPoints(v48, 0, &v63);

          if ([(GEOMapEdgeBuilder *)v62 _pointConnects:v49 rect:&v69 to:v68])
          {
            int v53 = geo::codec::transitTravelTimeForLineAlongLink((void *)[v48 get], i);
            id v54 = v48;
            id v55 = v33;
            id v63 = v54;
            unint64_t v64 = i;
            id v65 = v55;
            int v66 = v53;
            char v67 = 0;
            std::deque<geo::TransitEdgePiece>::push_back(v60, (uint64_t)&v63);

LABEL_23:
            break;
          }
          id v50 = v48;
          id v63 = 0;
          uint64_t v51 = GEOTransitLinkPoints(v50, [v50 sectionCount] - 1, &v63);
          id v52 = v63;

          if ([(GEOMapEdgeBuilder *)v62 _pointConnects:v51 + 8 * (void)v52 - 8 rect:&v69 to:v68])
          {
            int v56 = geo::codec::transitTravelTimeForLineAlongLink((void *)[v50 get], i);
            id v57 = v50;
            id v58 = v33;
            id v63 = v57;
            unint64_t v64 = i;
            id v65 = v58;
            int v66 = v56;
            char v67 = 1;
            std::deque<geo::TransitEdgePiece>::push_back(v60, (uint64_t)&v63);

            goto LABEL_23;
          }
        }
      }
    }
    else
    {
      id v33 = 0;
    }

LABEL_20:
    ++v24;
  }

  return v24 < v28;
}

- (BOOL)_shouldFindEdgeAhead
{
  v2 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_
                              + (((unint64_t)self->_pieces.__map_.__end_cap_.__value_ >> 4) & 0xFFFFFFFFFFFFFF8)))[(uint64_t)self->_pieces.__map_.__end_cap_.__value_ & 0x7F];
  BOOL var4 = v2->var4;
  uint64_t v4 = [v2->var0 get];
  uint64_t var1 = v2->var1;
  if (var4) {
    unint64_t v6 = geo::codec::transitLinkGetToNodeID(v4, var1);
  }
  else {
    unint64_t v6 = geo::codec::transitLinkGetFromNodeID(v4, var1);
  }
  uint64_t v7 = v6;
  id v8 = [v2->var0 containingTile];
  unint64_t v9 = -1;
  uint64_t v10 = 40;
  do
  {
    unint64_t v11 = [v8 transitNodeCount];
    if (++v9 >= v11) {
      break;
    }
    uint64_t v12 = *(void **)([v8 transitNodes] + v10);
    v10 += 344;
  }
  while (v12 != v7);

  return v9 >= v11;
}

- (BOOL)_shouldFindEdgeBehind
{
  unint64_t v2 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  v3 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_ + ((v2 >> 4) & 0xFFFFFFFFFFFFFF8)))[v2 & 0x7F];
  BOOL var4 = v3->var4;
  uint64_t v5 = [v3->var0 get];
  uint64_t var1 = v3->var1;
  if (var4) {
    uint64_t v7 = geo::codec::transitLinkGetFromNodeID(v5, var1);
  }
  else {
    uint64_t v7 = geo::codec::transitLinkGetToNodeID(v5, var1);
  }
  id v8 = v7;
  id v9 = [v3->var0 containingTile];
  unint64_t v10 = -1;
  uint64_t v11 = 40;
  do
  {
    unint64_t v12 = [v9 transitNodeCount];
    if (++v10 >= v12) {
      break;
    }
    unint64_t v13 = *(void **)([v9 transitNodes] + v11);
    v11 += 344;
  }
  while (v13 != v8);

  return v10 >= v12;
}

- (Matrix<float,)_firstPoint
{
  unint64_t v2 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_
                              + (((unint64_t)self->_pieces.__map_.__end_cap_.__value_ >> 4) & 0xFFFFFFFFFFFFFF8)))[(uint64_t)self->_pieces.__map_.__end_cap_.__value_ & 0x7F];
  id var0 = v2->var0;
  if (v2->var4)
  {
    id v4 = var0;
    uint64_t v9 = 0;
    uint64_t v5 = GEOTransitLinkPoints(v4, [v4 sectionCount] - 1, &v9);
    unint64_t v6 = (float *)(v5 + 8 * v9 - 8);
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v6 = (float *)GEOTransitLinkPoints(var0, 0, &v9);
  }
  float v7 = *v6;
  float v8 = v6[1];
  result._e[1] = v8;
  result._e[0] = v7;
  return result;
}

- (Matrix<float,)_lastPoint
{
  unint64_t v2 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  v3 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_ + ((v2 >> 4) & 0xFFFFFFFFFFFFFF8)))[v2 & 0x7F];
  id var0 = v3->var0;
  if (v3->var4)
  {
    uint64_t v10 = 0;
    uint64_t v5 = (float *)GEOTransitLinkPoints(var0, 0, &v10);
  }
  else
  {
    id v6 = var0;
    uint64_t v10 = 0;
    uint64_t v7 = GEOTransitLinkPoints(v6, [v6 sectionCount] - 1, &v10);
    uint64_t v5 = (float *)(v7 + 8 * v10 - 8);
  }
  float v8 = *v5;
  float v9 = v5[1];
  result._e[1] = v9;
  result._e[0] = v8;
  return result;
}

- (id)_firstTile
{
  return (id)[(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_+ (((unint64_t)self->_pieces.__map_.__end_cap_.__value_ >> 4) & 0xFFFFFFFFFFFFFF8)))[(uint64_t)self->_pieces.__map_.__end_cap_.__value_ & 0x7F].var0 containingTile];
}

- (id)_lastTile
{
  unint64_t v2 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  return (id)[(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_ + ((v2 >> 4) & 0xFFFFFFFFFFFFFF8)))[v2 & 0x7F].var0 containingTile];
}

- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  uint64_t v5 = +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", a3, a4.var0, a4.var1, a5);

  return v5;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  return self;
}

@end