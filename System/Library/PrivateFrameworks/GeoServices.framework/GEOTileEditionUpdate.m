@interface GEOTileEditionUpdate
- (BOOL)flushEverything;
- (BOOL)invalidateEverything;
- (GEOTileEditionUpdate)init;
- (GEOTileEditionUpdate)initWithActiveTileGroup:(id)a3 oldActiveTileGroup:(id)a4 dataSetDiffers:(BOOL)a5 flushEverything:(BOOL)a6;
- (unint64_t)tilesetCount;
- (void)addTileset:(id)a3 edition:(unsigned int)a4 provider:(unsigned int)a5 invalidateOnly:(BOOL)a6;
- (void)setFlushEverything:(BOOL)a3;
- (void)setInvalidateEverything:(BOOL)a3;
- (void)tileset:(id *)a3 edition:(unsigned int *)a4 provider:(unsigned int *)a5 invalidateOnly:(BOOL *)a6 atIndex:(unint64_t)a7;
@end

@implementation GEOTileEditionUpdate

- (GEOTileEditionUpdate)initWithActiveTileGroup:(id)a3 oldActiveTileGroup:(id)a4 dataSetDiffers:(BOOL)a5 flushEverything:(BOOL)a6
{
  uint64_t BOOL = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [(GEOTileEditionUpdate *)self init];
  if (v12)
  {
    if (BOOL)
    {
      uint64_t BOOL = GEOConfigGetBOOL(GeoServicesConfig_TileCacheFlushInvalidates, (uint64_t)off_1E91140E8);
      uint64_t v13 = BOOL ^ 1;
      if (!v7) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = 0;
      if (!v7)
      {
LABEL_10:
        [(GEOTileEditionUpdate *)v12 setFlushEverything:v13];
        [(GEOTileEditionUpdate *)v12 setInvalidateEverything:BOOL];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __114__GEOTileEditionUpdate_ManifestExtras__initWithActiveTileGroup_oldActiveTileGroup_dataSetDiffers_flushEverything___block_invoke;
        v18[3] = &unk_1E53E2E70;
        v15 = v12;
        v19 = v15;
        id v20 = v11;
        [v10 iterateActiveTileSets:v18];
        v16 = v15;

        goto LABEL_11;
      }
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_DataSetChangeFlushesTileCache, (uint64_t)off_1E9113D48))
    {
      v14 = GEOGetResourceManifestLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Flushing tile cache due to DataSet change", buf, 2u);
      }

      uint64_t BOOL = 0;
      uint64_t v13 = 1;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

void __114__GEOTileEditionUpdate_ManifestExtras__initWithActiveTileGroup_oldActiveTileGroup_dataSetDiffers_flushEverything___block_invoke(uint64_t a1, void *a2, int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  id v18 = v11;
  if (a3)
  {
    [*(id *)(a1 + 32) addTileset:a4 edition:a5 provider:a6 invalidateOnly:0];
  }
  else
  {
    v12 = objc_msgSend(*(id *)(a1 + 40), "activeTileSetForTileType:scale:", objc_msgSend(v11, "style"), objc_msgSend(v11, "scale"));
    int v13 = [v12 size];
    if (v13 != [v18 size]
      || (int v14 = [v12 version], v14 != objc_msgSend(v18, "version")))
    {
      int v15 = [v12 size];
      if (v15 == [v18 size])
      {
        int v16 = [v12 updateBehavior];
        BOOL v17 = v16 == [v18 updateBehavior];
      }
      else
      {
        BOOL v17 = 0;
      }
      if ([v18 updateBehavior] != 1) {
        BOOL v17 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "addTileset:edition:provider:invalidateOnly:", a4, a5, a6, v17 & (GEOConfigGetBOOL(GeoServicesConfig_ForceFlushTileCacheOnVersionChange, (uint64_t)off_1E9113DB8) ^ 1));
    }
  }
}

- (GEOTileEditionUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTileEditionUpdate;
  v2 = [(GEOTileEditionUpdate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entries = v2->_entries;
    v2->_entries = v3;
  }
  return v2;
}

- (void)addTileset:(id)a3 edition:(unsigned int)a4 provider:(unsigned int)a5 invalidateOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  unsigned int var0 = a3.var0;
  id v11 = objc_alloc_init(GEOEditionEntry);
  [(GEOEditionEntry *)v11 setTileset:var0];
  [(GEOEditionEntry *)v11 setEdition:v8];
  [(GEOEditionEntry *)v11 setProvider:v7];
  [(GEOEditionEntry *)v11 setInvalidateOnly:v6];
  [(NSMutableArray *)self->_entries addObject:v11];
}

- (unint64_t)tilesetCount
{
  return [(NSMutableArray *)self->_entries count];
}

- (void)tileset:(id *)a3 edition:(unsigned int *)a4 provider:(unsigned int *)a5 invalidateOnly:(BOOL *)a6 atIndex:(unint64_t)a7
{
  id v11 = [(NSMutableArray *)self->_entries objectAtIndex:a7];
  a3->unsigned int var0 = [v11 tileset];
  *a4 = [v11 edition];
  *a5 = [v11 provider];
  *a6 = [v11 invalidateOnly];
}

- (BOOL)flushEverything
{
  return self->_flushEverything;
}

- (void)setFlushEverything:(BOOL)a3
{
  self->_flushEverything = a3;
}

- (BOOL)invalidateEverything
{
  return self->_invalidateEverything;
}

- (void)setInvalidateEverything:(BOOL)a3
{
  self->_invalidateEverything = a3;
}

- (void).cxx_destruct
{
}

@end