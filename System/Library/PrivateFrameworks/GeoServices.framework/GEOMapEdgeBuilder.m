@interface GEOMapEdgeBuilder
- (BOOL)_edgeStart:(const void *)a3 end:(const void *)a4 connectsTo:(const void *)a5;
- (BOOL)_findEdgeAhead;
- (BOOL)_findEdgeAheadInTile:(id)a3;
- (BOOL)_findEdgeBehind;
- (BOOL)_findEdgeBehindInTile:(id)a3;
- (BOOL)_findNextEdge;
- (BOOL)_pointConnects:(const void *)a3 rect:(id *)a4 to:(id *)a5;
- (BOOL)_shouldFindEdgeAhead;
- (BOOL)_shouldFindEdgeBehind;
- (GEOMapAccess)map;
- (GEOMapEdgeBuilder)initWithMap:(id)a3;
- (Matrix<float,)_firstPoint;
- (Matrix<float,)_lastPoint;
- (id).cxx_construct;
- (id)_firstTile;
- (id)_lastTile;
- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
- (id)edgeHandler;
- (unint64_t)_maxTileCount;
- (unint64_t)buildDirection;
- (void)_buildCompleteEdge;
- (void)_findTilesAdjacentToTile:(uint64_t)a3 containingPoint:(uint64_t)a4 findAhead:(char)a5;
- (void)buildEdge:(id)a3;
- (void)cancel;
- (void)setBuildDirection:(unint64_t)a3;
- (void)setEdgeHandler:(id)a3;
@end

@implementation GEOMapEdgeBuilder

- (GEOMapEdgeBuilder)initWithMap:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEOMapEdgeBuilder;
  result = [(GEOMapRequest *)&v4 initWithManager:a3];
  if (result) {
    *(void *)&result->_searchDirection = 0;
  }
  return result;
}

- (void)cancel
{
  [*(id *)((char *)&self->_lastTilePoint + 4) cancel];
  v3 = *(void **)((char *)&self->_lastTilePoint + 4);
  *(Matrix<float, 2, 1> *)((char *)&self->_lastTilePoint + 4) = 0;

  [(GEOMapEdgeBuilder *)self setEdgeHandler:0];
  v4.receiver = self;
  v4.super_class = (Class)GEOMapEdgeBuilder;
  [(GEOMapRequest *)&v4 cancel];
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (BOOL)_findEdgeAhead
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (!*(&self->super._isFinished + 1)) {
    return 0;
  }
  if ([(GEOMapEdgeBuilder *)self _shouldFindEdgeAhead]
    && (([(GEOMapEdgeBuilder *)self _firstPoint], v3 < 0.001) || v3 > 0.999 || v4 < 0.001 || v4 > 0.999))
  {
    *((float *)&self->super._isFinished + 1) = v3;
    *(float *)&self->_buildAhead = v4;
    v6 = [(GEOMapEdgeBuilder *)self _firstTile];
    uint64_t v7 = [v6 tileKey];
    uint64_t v8 = *(void *)v7;
    uint64_t v9 = *(void *)v7 << 32;
    unint64_t v10 = BYTE4(*(void *)v7) | ((((*(void *)v7 >> 40) | (*(unsigned __int16 *)(v7 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v7 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v7 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v7 + 10) >> 4) << 52);
    *(void *)((char *)v13 + 1) = v9 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v7 >> 8) & 0x3F) << 40);
    LOBYTE(v13[0]) = v8;
    *((void *)&v11 + 1) = v10;
    *(void *)&long long v11 = v9;
    v12[0] = v13[0];
    v12[1] = v11 >> 56;
    [(GEOMapEdgeBuilder *)self _findTilesAdjacentToTile:v12 containingPoint:&self->super._isFinished + 4 findAhead:1];

    return 1;
  }
  else
  {
    BOOL result = 0;
    *(&self->super._isFinished + 1) = 0;
  }
  return result;
}

- (BOOL)_findEdgeBehind
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (!*(&self->super._isFinished + 2)) {
    return 0;
  }
  if ([(GEOMapEdgeBuilder *)self _shouldFindEdgeBehind]
    && (([(GEOMapEdgeBuilder *)self _lastPoint], v3 < 0.001) || v3 > 0.999 || v4 < 0.001 || v4 > 0.999))
  {
    self->_firstTilePoint._e[0] = v3;
    self->_firstTilePoint._e[1] = v4;
    v6 = [(GEOMapEdgeBuilder *)self _lastTile];
    uint64_t v7 = [v6 tileKey];
    uint64_t v8 = *(void *)v7;
    uint64_t v9 = *(void *)v7 << 32;
    unint64_t v10 = BYTE4(*(void *)v7) | ((((*(void *)v7 >> 40) | (*(unsigned __int16 *)(v7 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v7 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v7 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v7 + 10) >> 4) << 52);
    *(void *)((char *)v13 + 1) = v9 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v7 >> 8) & 0x3F) << 40);
    LOBYTE(v13[0]) = v8;
    *((void *)&v11 + 1) = v10;
    *(void *)&long long v11 = v9;
    v12[0] = v13[0];
    v12[1] = v11 >> 56;
    [(GEOMapEdgeBuilder *)self _findTilesAdjacentToTile:v12 containingPoint:&self->_firstTilePoint findAhead:0];

    return 1;
  }
  else
  {
    BOOL result = 0;
    *(&self->super._isFinished + 2) = 0;
  }
  return result;
}

- (BOOL)_findNextEdge
{
  if ([(GEOMapRequest *)self isFinished]) {
    return 0;
  }
  next = self->_tileKeysSeen.__table_.__p1_.__value_.__next_;
  if ((unint64_t)next < [(GEOMapEdgeBuilder *)self _maxTileCount])
  {
    uint64_t v4 = *(void *)&self->_searchDirection;
    switch(v4)
    {
      case 2:
LABEL_13:
        if ([(GEOMapEdgeBuilder *)self _findEdgeAhead]) {
          return 1;
        }
        break;
      case 1:
LABEL_11:
        if ([(GEOMapEdgeBuilder *)self _findEdgeBehind]) {
          return 1;
        }
        break;
      case 0:
        if (LOBYTE(self->_tileKeysSeen.__table_.__p3_.__value_))
        {
          if ([(GEOMapEdgeBuilder *)self _findEdgeAhead]) {
            return 1;
          }
        }
        else if ([(GEOMapEdgeBuilder *)self _findEdgeBehind])
        {
          return 1;
        }
        if (LOBYTE(self->_tileKeysSeen.__table_.__p3_.__value_)) {
          goto LABEL_11;
        }
        goto LABEL_13;
    }
  }
  [(GEOMapEdgeBuilder *)self _buildCompleteEdge];
  return 0;
}

- (void)buildEdge:(id)a3
{
  id v4 = a3;
  -[GEOMapEdgeBuilder setEdgeHandler:](self, "setEdgeHandler:");
  [(GEOMapEdgeBuilder *)self _findNextEdge];
}

- (void)_findTilesAdjacentToTile:(uint64_t)a3 containingPoint:(uint64_t)a4 findAhead:(char)a5
{
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  uint64_t v9 = [(id)a1 map];
  uint64_t v10 = objc_msgSend((id)a1, "_tileFinderForMap:center:radius:", v9, -180.0, -180.0, -1.0);
  long long v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v10;

  objc_initWeak(&location, (id)a1);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke;
  v15[3] = &unk_1E53E5640;
  objc_copyWeak(&v16, &location);
  v15[4] = v19;
  char v17 = a5;
  [*(id *)(a1 + 56) setCompletionHandler:v15];
  *(unsigned char *)(a1 + 112) ^= 1u;
  v12 = *(void **)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke_2;
  void v13[3] = &unk_1E53E5668;
  char v14 = a5;
  v13[4] = a1;
  v13[5] = v19;
  [v12 findTilesAdjacentToTile:a3 containingPoint:a4 tileHandler:v13];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);
}

void __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((id *)WeakRetained + 7) == v6)
    {
      *((void *)WeakRetained + 7) = 0;

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        v5 = &OBJC_IVAR___GEOMapEdgeBuilder__buildAhead;
        if (!*(unsigned char *)(a1 + 48)) {
          v5 = &OBJC_IVAR___GEOMapEdgeBuilder__buildBehind;
        }
        v4[*v5] = 0;
        [v4 _findNextEdge];
      }
    }
  }
}

void __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke_2(uint64_t a1, void *a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = [v3 tileKey];
    uint64_t v6 = *(void *)v5;
    uint64_t v7 = *(void *)v5 << 32;
    unint64_t v8 = BYTE4(*(void *)v5) | ((((*(void *)v5 >> 40) | (*(unsigned __int16 *)(v5 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v5 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v5 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v5 + 10) >> 4) << 52);
    *(void *)((char *)v15 + 1) = v7 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v5 >> 8) & 0x3F) << 40);
    LOBYTE(v15[0]) = v6;
    *((void *)&v9 + 1) = v8;
    *(void *)&long long v9 = v7;
    *(void *)&long long v14 = v15[0];
    *((void *)&v14 + 1) = v9 >> 56;
    uint64_t v10 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      char v11 = [v10 _findEdgeAheadInTile:v4];
    }
    else {
      char v11 = [v10 _findEdgeBehindInTile:v4];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      [*(id *)(*(void *)(a1 + 32) + 56) cancel];
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + 56);
      *(void *)(v12 + 56) = 0;

      std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey const&>(*(void *)(a1 + 32) + 72, &v14, &v14);
      [*(id *)(a1 + 32) _findNextEdge];
    }
  }
}

- (BOOL)_pointConnects:(const void *)a3 rect:(id *)a4 to:(id *)a5
{
  float v5 = *(float *)a3;
  float v6 = *((float *)a3 + 1);
  return (*(float *)a3 < 0.001 || v5 > 0.999 || v6 < 0.001 || v6 > 0.999)
      && GEOMetersBetweenMapPoints(a5->var0, a5->var1, a4->var0.var0 + v5 * a4->var1.var0, a4->var0.var1 + (float)(1.0 - v6) * a4->var1.var1) <= 5.0;
}

- (BOOL)_edgeStart:(const void *)a3 end:(const void *)a4 connectsTo:(const void *)a5
{
  if (*(float *)a3 >= 0.001 && *(float *)a3 <= 0.999)
  {
    float v5 = *((float *)a3 + 1);
    if (v5 >= 0.001 && v5 <= 0.999) {
      return 0;
    }
  }
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    float v8 = vabds_f32(*((float *)a5 + v6), *((float *)a3 + v6));
    if ((v7 & 1) == 0) {
      break;
    }
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while (v8 < 0.000001);
  return v8 < 0.000001;
}

- (unint64_t)_maxTileCount
{
  return 0;
}

- (void)_buildCompleteEdge
{
}

- (BOOL)_findEdgeAheadInTile:(id)a3
{
  return 0;
}

- (BOOL)_findEdgeBehindInTile:(id)a3
{
  return 0;
}

- (BOOL)_shouldFindEdgeAhead
{
  return 0;
}

- (BOOL)_shouldFindEdgeBehind
{
  return 0;
}

- (Matrix<float,)_firstPoint
{
  [(GEOMapEdgeBuilder *)self doesNotRecognizeSelector:a2];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (Matrix<float,)_lastPoint
{
  [(GEOMapEdgeBuilder *)self doesNotRecognizeSelector:a2];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (id)_firstTile
{
  return 0;
}

- (id)_lastTile
{
  return 0;
}

- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  return 0;
}

- (id)edgeHandler
{
  return self->_currentTileFinder;
}

- (void)setEdgeHandler:(id)a3
{
}

- (unint64_t)buildDirection
{
  return *(void *)&self->_searchDirection;
}

- (void)setBuildDirection:(unint64_t)a3
{
  *(void *)&self->_searchDirection = a3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)&self->_edgeHandler);
  objc_storeStrong((id *)&self->_currentTileFinder, 0);

  objc_storeStrong((id *)((char *)&self->_lastTilePoint + 4), 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end