@interface GEOMapTileFinder
+ (id)buildingsTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
+ (id)detailedTransitTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
+ (id)realisticTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
+ (id)transitGeometryTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5;
- (GEOMapAccess)map;
- (id)_initWithMap:(id)a3 zoomLevel:(unint64_t)a4 tileSize:(int)a5 tileScale:(int)a6 tileStyle:(int)a7 center:(id)a8 radius:(double)a9;
- (id)tileHandler;
- (int)tileScale;
- (int)tileSize;
- (int)tileStyle;
- (uint64_t)findTiles:(uint64_t)a3 excludingKey:(uint64_t)a4;
- (uint64_t)findTilesAdjacentToTile:(uint64_t)a3 containingPoint:(float *)a4 tileHandler:(uint64_t)a5;
- (unint64_t)_adjacentTileKey:(uint64_t)a3 dirX:(int)a4 dirY:;
- (unint64_t)zoomLevel;
- (void)_fetchDataForKeys:(const void *)a3;
- (void)cancel;
- (void)dealloc;
- (void)findTiles:(id)a3;
- (void)setTileHandler:(id)a3;
@end

@implementation GEOMapTileFinder

- (id)_initWithMap:(id)a3 zoomLevel:(unint64_t)a4 tileSize:(int)a5 tileScale:(int)a6 tileStyle:(int)a7 center:(id)a8 radius:(double)a9
{
  double var1 = a8.var1;
  double var0 = a8.var0;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapTileFinder;
  id result = [(GEOMapRequest *)&v17 initWithManager:a3];
  if (result)
  {
    *((void *)result + 5) = a4;
    *((_DWORD *)result + 12) = a5;
    *((_DWORD *)result + 13) = a6;
    *((_DWORD *)result + 14) = a7;
    *((double *)result + 8) = var0;
    *((double *)result + 9) = var1;
    *((double *)result + 10) = a9;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOMapTileFinder;
  [(GEOMapRequest *)&v2 dealloc];
}

+ (id)realisticTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  if (+[GEOMapAccess supportsRoadMapAccess])
  {
    if ([v9 useMapMatchingTilesetForRoads]) {
      uint64_t v10 = 53;
    }
    else {
      uint64_t v10 = 18;
    }
    v11 = objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "roadsZoomLevel"), 2, 0, v10, var0, var1, a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)detailedTransitTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "transitZoomLevel"), 2, 0, 37, var0, var1, a5);

  return v10;
}

+ (id)transitGeometryTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "transitZoomLevel"), 2, 0, 1, var0, var1, a5);

  return v10;
}

+ (id)buildingsTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "buildingsZoomLevel"), 2, 0, 11, var0, var1, a5);

  return v10;
}

- (void)cancel
{
  v3 = [(GEOMapTileFinder *)self map];
  v4 = [v3 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__GEOMapTileFinder_cancel__block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(v4, block);
}

id __26__GEOMapTileFinder_cancel__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  objc_super v2 = +[GEOTileLoader modernLoader];
  v3 = GEOTileLoaderClientIdentifier(*(void **)(a1 + 32));
  [v2 cancelAllForClient:v3];

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOMapTileFinder;
  return objc_msgSendSuper2(&v5, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)_fetchDataForKeys:(const void *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (![(GEOMapRequest *)self isFinished])
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    if (*((void *)a3 + 3))
    {
      objc_super v5 = [(GEOMapTileFinder *)self map];
      int v6 = [v5 allowsNetworkTileLoad];

      if (v6) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 1;
      }
      for (i = (uint64_t *)*((void *)a3 + 2); i; i = (uint64_t *)*i)
      {
        long long v24 = *((_OWORD *)i + 1);
        if (self->_isCanceling) {
          break;
        }
        if (self->super._isFinished) {
          break;
        }
        id v9 = [(GEOMapTileFinder *)self map];
        BOOL v10 = v9 == 0;

        if (v10) {
          break;
        }
        v11 = +[GEOTileLoader modernLoader];
        v12 = GEOTileLoaderClientIdentifier(self);
        v13 = [(GEOMapTileFinder *)self map];
        v14 = [v13 callbackQueue];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __38__GEOMapTileFinder__fetchDataForKeys___block_invoke_2;
        v20[3] = &unk_1E53E4D80;
        v20[4] = self;
        v20[5] = v22;
        [v11 loadKey:&v24 priority:2147483646 forClient:v12 options:v7 reason:4 callbackQ:v14 beginNetwork:0 callback:v20];
      }
    }
    else if ([MEMORY[0x1E4F29060] isMainThread] {
           && ([(GEOMapTileFinder *)self map],
    }
               v15 = objc_claimAutoreleasedReturnValue(),
               [v15 callbackQueue],
               v16 = objc_claimAutoreleasedReturnValue(),
               BOOL v17 = v16 == (void *)MEMORY[0x1E4F14428],
               v16,
               v15,
               v17))
    {
      [(GEOMapRequest *)self complete];
    }
    else
    {
      v18 = [(GEOMapTileFinder *)self map];
      v19 = [v18 callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__GEOMapTileFinder__fetchDataForKeys___block_invoke;
      block[3] = &unk_1E53D8418;
      block[4] = self;
      dispatch_async(v19, block);
    }
    _Block_object_dispose(v22, 8);
  }
}

uint64_t __38__GEOMapTileFinder__fetchDataForKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

void __38__GEOMapTileFinder__fetchDataForKeys___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v20 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v12 + 96) || *(unsigned char *)(v12 + 32)) {
    goto LABEL_11;
  }
  if (v10)
  {
    v13 = [(id)v12 map];
    v14 = [v13 tileErrorHandler];

    if (!v14) {
      goto LABEL_9;
    }
    v15 = [*(id *)(a1 + 32) map];
    v16 = [v15 tileErrorHandler];
    ((void (**)(void, uint64_t, id))v16)[2](v16, a2, v10);
  }
  else
  {
    uint64_t v17 = *(void *)(v12 + 88);
    if (!v17) {
      goto LABEL_9;
    }
    v15 = [v20 decodedRepresentation];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v15);
  }

LABEL_9:
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void *)(v18 + 24) - 1;
  *(void *)(v18 + 24) = v19;
  if (!v19) {
    [*(id *)(a1 + 32) complete];
  }
LABEL_11:
}

- (uint64_t)findTiles:(uint64_t)a3 excludingKey:(uint64_t)a4
{
  objc_msgSend((id)a1, "setTileHandler:");
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x5812000000;
  uint64_t v18 = __Block_byref_object_copy__53;
  uint64_t v19 = __Block_byref_object_dispose__53;
  memset(v20, 0, sizeof(v20));
  uint64_t v21 = 0;
  int v22 = 1065353216;
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  int v9 = *(_DWORD *)(a1 + 40);
  unsigned int v10 = *(_DWORD *)(a1 + 56);
  int v11 = *(_DWORD *)(a1 + 48);
  uint64_t v12 = *(unsigned int *)(a1 + 52);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__GEOMapTileFinder_findTiles_excludingKey___block_invoke;
  v14[3] = &unk_1E53E4DA8;
  v14[4] = &v15;
  v14[5] = a4;
  GEOTileKeysForCoordinate(v9, v10, v11, v12, v14, v6, v7, v8);
  [(id)a1 _fetchDataForKeys:v16 + 6];
  _Block_object_dispose(&v15, 8);
  return std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)v20 + 8);
}

void *__43__GEOMapTileFinder_findTiles_excludingKey___block_invoke(void *result, void *a2)
{
  objc_super v2 = (uint64_t *)result[5];
  if (!v2) {
    return std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey const&>(*(void *)(result[4] + 8) + 48, a2, a2);
  }
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  if (*a2 != v4 || a2[1] != v3) {
    return std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey const&>(*(void *)(result[4] + 8) + 48, a2, a2);
  }
  return result;
}

- (uint64_t)findTilesAdjacentToTile:(uint64_t)a3 containingPoint:(float *)a4 tileHandler:(uint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a1 setTileHandler:a5];
  if (*a4 >= 0.00000011921)
  {
    if ((float)(1.0 - *a4) >= 0.00000011921)
    {
      int v9 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      int v9 = 1;
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    int v9 = 1;
  }
  float v10 = a4[1];
  if (v10 >= 0.00000011921)
  {
    if ((float)(1.0 - v10) >= 0.00000011921)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      LODWORD(v19) = 1065353216;
      if (!v9) {
        goto LABEL_15;
      }
      uint64_t v11 = 0;
LABEL_14:
      *(void *)&long long v20 = objc_msgSend(a1, "_adjacentTileKey:dirX:dirY:", a3, v8, v11, v17, v18, v19);
      *((void *)&v20 + 1) = v15;
      std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
      goto LABEL_15;
    }
    uint64_t v11 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v11 = 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  LODWORD(v19) = 1065353216;
  if ((v9 & 1) == 0) {
    goto LABEL_14;
  }
  *(void *)&long long v20 = objc_msgSend(a1, "_adjacentTileKey:dirX:dirY:", a3, v8, 0, v17, v18, v19);
  *((void *)&v20 + 1) = v12;
  std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
  *(void *)&long long v20 = [a1 _adjacentTileKey:a3 dirX:0 dirY:v11];
  *((void *)&v20 + 1) = v13;
  std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
  *(void *)&long long v20 = [a1 _adjacentTileKey:a3 dirX:v8 dirY:v11];
  *((void *)&v20 + 1) = v14;
  std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
LABEL_15:
  [a1 _fetchDataForKeys:&v17];
  return std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)&v17);
}

- (void)findTiles:(id)a3
{
}

- (unint64_t)_adjacentTileKey:(uint64_t)a3 dirX:(int)a4 dirY:
{
  GEOTileKeyAssertIsStandard(a3);
  unsigned int v7 = *(_DWORD *)(a1 + 56);
  unint64_t v8 = 128;
  if (v7 > 0x19 || ((1 << v7) & 0x200101C) == 0) {
    unint64_t v8 = (unint64_t)(v7 == 26) << 7;
  }
  *(void *)((char *)&v11 + 1) = *(void *)(a3 + 1) & 0x3F0000000000 | ((unint64_t)((int)((((*(void *)(a3 + 1) >> 46) | (*(_DWORD *)(a3 + 9) << 18)) & 0x3FFFFFF) + a4 + (1 << ((unsigned __int16)WORD2(*(void *)(a3 + 1)) >> 8))) % (1 << ((unsigned __int16)WORD2(*(void *)(a3 + 1)) >> 8))) << 46);
  LOBYTE(v11) = 2;
  return v11 & 0xFFFFFFFFFFFFFF7FLL | v8;
}

- (id)tileHandler
{
  return self->_tileHandler;
}

- (void)setTileHandler:(id)a3
{
}

- (unint64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (int)tileSize
{
  return self->_tileSize;
}

- (int)tileScale
{
  return self->_tileScale;
}

- (int)tileStyle
{
  return self->_tileStyle;
}

- (void).cxx_destruct
{
}

@end