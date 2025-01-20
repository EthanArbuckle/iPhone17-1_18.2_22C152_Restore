@interface GEOMapAssetMetadata
- (GEOMapAssetMetadata)initWithVectorTiles:(id)a3 enableASTCTextures:(BOOL)a4;
- (id)keysForMetroAvailability:(BOOL)a3;
@end

@implementation GEOMapAssetMetadata

- (GEOMapAssetMetadata)initWithVectorTiles:(id)a3 enableASTCTextures:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapAssetMetadata;
  v8 = [(GEOMapAssetMetadata *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tiles, a3);
    v9->_enableASTCTextures = a4;
    v10 = v9;
  }

  return v9;
}

- (id)keysForMetroAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(GEOTileKeyList);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_tiles;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    if (v3) {
      unsigned __int8 v8 = 2;
    }
    else {
      unsigned __int8 v8 = 1;
    }
    unsigned int v9 = v8;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        BOOL enableASTCTextures = self->_enableASTCTextures;
        v13 = v5;
        id v14 = v11;
        v15 = v14;
        if (v14)
        {
          [v14 vectorTilePtr];
          if (v23)
          {
            uint64_t v16 = *(void *)(v23 + 2240);
            if (v16)
            {
              _addAssetsForMarketMask(v13, *(void *)(v23 + 2240), 3u, enableASTCTextures);
              _addAssetsForMarketMask(v13, v16, v9, enableASTCTextures);
            }
          }
        }
        else
        {
          uint64_t v23 = 0;
          v24 = 0;
        }
        if (v24) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end