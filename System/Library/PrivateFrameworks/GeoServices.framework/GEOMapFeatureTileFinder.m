@interface GEOMapFeatureTileFinder
- (GEOMapFeatureTileFinder)initWithZoomLevel:(unint64_t)a3 tileSize:(int)a4 tileScale:(int)a5 tileSetStyle:(int)a6 requestParameters:(id)a7;
- (id)_findTilesInList:(id)a3 preloadToDiskOnly:(BOOL)a4 tileDecoder:(id)a5 handler:(id)a6 completionHandler:(id)a7;
- (id)_tileFinderRequest;
- (id)_tileLoaderClientIdentifier;
- (id)findTileDataAround:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findTileWithKey:(uint64_t)a3 handler:(uint64_t)a4 completionHandler:(void *)a5;
- (id)findTilesAround:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)preloadTilesAround:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6;
- (unint64_t)tileKeyWithX:(uint64_t)a3 y:;
- (void)setExistingRequest:(id)a3;
@end

@implementation GEOMapFeatureTileFinder

- (GEOMapFeatureTileFinder)initWithZoomLevel:(unint64_t)a3 tileSize:(int)a4 tileScale:(int)a5 tileSetStyle:(int)a6 requestParameters:(id)a7
{
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapFeatureTileFinder;
  v14 = [(GEOMapFeatureTileFinder *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestParameters, a7);
    v15->_zoomLevel = a3;
    v15->_tileSize = a4;
    v15->_tileScale = a5;
    v15->_tileSetStyle = a6;
    uint64_t v16 = [v13 tileLoader];
    tileLoader = v15->_tileLoader;
    v15->_tileLoader = (GEOTileLoader *)v16;
  }
  return v15;
}

- (void)setExistingRequest:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_tileFinderRequest, a3);
    v6 = [(_GEOMapFeatureAccessRequest *)self->_tileFinderRequest tileLoader];
    tileLoader = self->_tileLoader;
    self->_tileLoader = v6;

    id v5 = v8;
  }
}

- (unint64_t)tileKeyWithX:(uint64_t)a3 y:
{
  unsigned int v3 = *(_DWORD *)(a1 + 32);
  unint64_t v4 = 128;
  if (v3 > 0x19 || ((1 << v3) & 0x200101C) == 0) {
    unint64_t v4 = (unint64_t)(v3 == 26) << 7;
  }
  *(void *)((char *)&v7 + 1) = (a3 << 46) | ((*(void *)(a1 + 16) & 0x3FLL) << 40);
  LOBYTE(v7) = 2;
  return v7 & 0xFFFFFFFFFFFFFF7FLL | v4;
}

- (id)findTileWithKey:(uint64_t)a3 handler:(uint64_t)a4 completionHandler:(void *)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v19[0] = a3;
  v19[1] = a4;
  id v8 = a5;
  id v9 = a6;
  v10 = objc_alloc_init(GEOTileKeyList);
  [(GEOTileKeyList *)v10 addKey:v19];
  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke;
    v17[3] = &unk_1E53E7F10;
    id v18 = v8;
    v11 = (void *)MEMORY[0x18C120660](v17);
  }
  else
  {
    v11 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke_3;
  v15[3] = &unk_1E53E7F58;
  id v16 = v9;
  id v12 = v9;
  id v13 = [a1 _findTilesInList:v10 preloadToDiskOnly:0 tileDecoder:&__block_literal_global_119 handler:v11 completionHandler:v15];

  return v13;
}

uint64_t __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 decodedRepresentation];
}

uint64_t __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)findTilesAround:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a5;
  id v12 = a6;
  id v13 = _GEOTileKeysForCoordinate(self->_zoomLevel, self->_tileSetStyle, self->_tileSize, self->_tileScale, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake, var0, var1, a4);
  if (v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke;
    v20[3] = &unk_1E53E7F10;
    id v21 = v11;
    v14 = (void *)MEMORY[0x18C120660](v20);
  }
  else
  {
    v14 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke_3;
  v18[3] = &unk_1E53E7F58;
  id v19 = v12;
  id v15 = v12;
  id v16 = [(GEOMapFeatureTileFinder *)self _findTilesInList:v13 preloadToDiskOnly:0 tileDecoder:&__block_literal_global_4_4 handler:v14 completionHandler:v18];

  return v16;
}

uint64_t __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 decodedRepresentation];
}

uint64_t __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)findTileDataAround:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a6;
  uint64_t tileScale = self->_tileScale;
  uint64_t tileSetStyle = self->_tileSetStyle;
  if (tileSetStyle == 89) {
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_GEOQuadIDTileKeyMakeWrapper;
  }
  else {
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake;
  }
  unint64_t zoomLevel = self->_zoomLevel;
  uint64_t tileSize = self->_tileSize;
  id v17 = a5;
  id v18 = _GEOTileKeysForCoordinate(zoomLevel, tileSetStyle, tileSize, tileScale, v14, var0, var1, a4);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__GEOMapFeatureTileFinder_findTileDataAround_radius_handler_completionHandler___block_invoke_2;
  v22[3] = &unk_1E53E7F58;
  id v23 = v11;
  id v19 = v11;
  v20 = [(GEOMapFeatureTileFinder *)self _findTilesInList:v18 preloadToDiskOnly:0 tileDecoder:&__block_literal_global_6_0 handler:v17 completionHandler:v22];

  return v20;
}

id __79__GEOMapFeatureTileFinder_findTileDataAround_radius_handler_completionHandler___block_invoke(int a1, id a2)
{
  return a2;
}

uint64_t __79__GEOMapFeatureTileFinder_findTileDataAround_radius_handler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)preloadTilesAround:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v11 = a6;
  id v12 = _GEOTileKeysForCoordinate(self->_zoomLevel, self->_tileSetStyle, self->_tileSize, self->_tileScale, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake, var0, var1, a4);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__GEOMapFeatureTileFinder_preloadTilesAround_radius_preloadToDiskOnly_completionHandler___block_invoke_2;
  v16[3] = &unk_1E53E7F58;
  id v17 = v11;
  id v13 = v11;
  v14 = [(GEOMapFeatureTileFinder *)self _findTilesInList:v12 preloadToDiskOnly:v6 tileDecoder:&__block_literal_global_8_2 handler:0 completionHandler:v16];

  return v14;
}

uint64_t __89__GEOMapFeatureTileFinder_preloadTilesAround_radius_preloadToDiskOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 decodedRepresentation];
}

uint64_t __89__GEOMapFeatureTileFinder_preloadTilesAround_radius_preloadToDiskOnly_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_tileFinderRequest
{
  tileFinderRequest = self->_tileFinderRequest;
  if (!tileFinderRequest)
  {
    unint64_t v4 = [[_GEOMapFeatureAccessRequest alloc] initWithTileLoader:self->_tileLoader];
    id v5 = self->_tileFinderRequest;
    self->_tileFinderRequest = v4;

    tileFinderRequest = self->_tileFinderRequest;
  }
  BOOL v6 = [(GEOMapFeatureTileFinder *)self _tileLoaderClientIdentifier];
  [(_GEOMapFeatureAccessRequest *)tileFinderRequest addTileRequest:v6];

  long long v7 = self->_tileFinderRequest;

  return v7;
}

- (id)_findTilesInList:(id)a3 preloadToDiskOnly:(BOOL)a4 tileDecoder:(id)a5 handler:(id)a6 completionHandler:(id)a7
{
  BOOL v62 = a4;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v59 = a6;
  v57 = (void (**)(id, uint64_t, uint64_t))a7;
  id v11 = a5;
  id v56 = [(GEOMapFeatureTileFinder *)self _tileFinderRequest];
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = &__block_literal_global_12;
  }
  v58 = (void *)[v12 copy];

  if ([v60 count])
  {
    if ([(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters allowNetworkTileLoad]) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 1;
    }
    if (v62)
    {
      uint64_t v14 = [v60 count];
      uint64_t v15 = [v60 firstKey];
      uint64_t v16 = [v60 keyAtIndex:v14 - 1];
      id v17 = GEOGetGEOMapFeatureAccessLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if ((*(unsigned char *)v15 & 0x7F) == 0xC)
        {
          *((void *)&v18 + 1) = *(unsigned __int16 *)(v15 + 9) | ((unint64_t)*(unsigned __int8 *)(v15 + 11) << 16);
          *(void *)&long long v18 = *(void *)(v15 + 1);
          objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v18 >> 6), v18 & 0x3F, ((*(unsigned __int16 *)(v15 + 9) | (*(unsigned __int8 *)(v15 + 11) << 16)) >> 6) & 0x3FFF);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)(v15 + 1) >> 46) | (*(_DWORD *)(v15 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(v15 + 9) | ((unint64_t)(*(unsigned __int16 *)(v15 + 13) | (*(unsigned __int8 *)(v15 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)(v15 + 1) >> 40) & 0x3FLL, *(unsigned char *)v15 & 0x7F, *(unsigned __int16 *)(v15 + 13) >> 2);
        v20 = };
        if ((*(unsigned char *)v16 & 0x7F) == 0xC)
        {
          *((void *)&v21 + 1) = *(unsigned __int16 *)(v16 + 9) | ((unint64_t)*(unsigned __int8 *)(v16 + 11) << 16);
          *(void *)&long long v21 = *(void *)(v16 + 1);
          objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v21 >> 6), v21 & 0x3F, ((*(unsigned __int16 *)(v16 + 9) | (*(unsigned __int8 *)(v16 + 11) << 16)) >> 6) & 0x3FFF);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)(v16 + 1) >> 46) | (*(_DWORD *)(v16 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(v16 + 9) | ((unint64_t)(*(unsigned __int16 *)(v16 + 13) | (*(unsigned __int8 *)(v16 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)(v16 + 1) >> 40) & 0x3FLL, *(unsigned char *)v16 & 0x7F, *(unsigned __int16 *)(v16 + 13) >> 2);
        v22 = };
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v14;
        *(_WORD *)v111 = 2112;
        *(void *)&v111[2] = v20;
        *(_WORD *)&v111[10] = 2112;
        *(void *)&v111[12] = v22;
        _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEFAULT, "Preloading %d tiles from %@ to %@", buf, 0x1Cu);
      }
      v13 |= 0x204uLL;
    }
    BOOL v23 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters cachedTilesCallbackImmediately];
    BOOL v24 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters allowOfflineData];
    if (v62)
    {
      uint64_t v25 = v13;
      uint64_t v26 = v13;
    }
    else
    {
      if ([(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters allowStaleData]) {
        uint64_t v27 = v13 | 0x40;
      }
      else {
        uint64_t v27 = v13;
      }
      BOOL v28 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters preferStaleData];
      BOOL v29 = v13 != v27;
      BOOL v30 = !v28 || !v29;
      if (v28 && v29) {
        uint64_t v31 = v13;
      }
      else {
        uint64_t v31 = v27;
      }
      if (v30) {
        uint64_t v26 = v13;
      }
      else {
        uint64_t v26 = v27;
      }
      if (v24) {
        uint64_t v25 = v13 | 0x400;
      }
      else {
        uint64_t v25 = v13;
      }
      uint64_t v13 = v31;
    }
    uint64_t v65 = v26;
    v32 = 0;
    *(void *)buf = 0;
    *(void *)v111 = buf;
    *(void *)&v111[8] = 0x3032000000;
    *(void *)&v111[16] = __Block_byref_object_copy__63;
    v112 = __Block_byref_object_dispose__63;
    id v113 = 0;
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x2020000000;
    uint64_t v108 = 0;
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x3032000000;
    v102 = __Block_byref_object_copy__63;
    v103 = __Block_byref_object_dispose__63;
    id v104 = 0;
    if (v24)
    {
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_13;
      v94[3] = &unk_1E53E7FA0;
      v97 = &v105;
      id v95 = v59;
      id v96 = v58;
      v98 = buf;
      v32 = (void *)[v94 copy];
    }
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_15;
    v86[3] = &unk_1E53E7FC8;
    id v33 = v32;
    uint64_t v92 = v25;
    uint64_t v93 = v65;
    v86[4] = self;
    id v87 = v33;
    v90 = buf;
    v91 = &v105;
    id v34 = v59;
    id v88 = v34;
    id v35 = v58;
    id v89 = v35;
    v36 = (void *)[v86 copy];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_16;
    v74[3] = &unk_1E53E7FF0;
    uint64_t v82 = v65;
    uint64_t v83 = v13;
    v79 = &v99;
    id v55 = v36;
    id v75 = v55;
    uint64_t v84 = v25;
    v80 = buf;
    id v54 = v33;
    id v76 = v54;
    v74[4] = self;
    BOOL v85 = v62;
    id v37 = v35;
    id v77 = v37;
    v81 = &v105;
    v61 = (void (**)(void))v34;
    v78 = v61;
    v64 = (void *)[v74 copy];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v60;
    uint64_t v38 = [obj countByEnumeratingWithState:&v70 objects:v109 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          if ([(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters cachedTilesCallbackImmediately])
          {
            if (v62)
            {
              v42 = 0;
            }
            else
            {
              tileLoader = self->_tileLoader;
              v44 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters auditToken];
              v42 = [(GEOTileLoader *)tileLoader cachedTileForKey:v41 auditToken:v44];
            }
            v45 = (*((void (**)(id, void *))v37 + 2))(v37, v42);
            if (v45)
            {
              ++v106[3];
              if (v61) {
                v61[2]();
              }
              goto LABEL_53;
            }
          }
          v46 = *(NSObject **)(*(void *)v111 + 40);
          if (!v46)
          {
            dispatch_group_t v47 = dispatch_group_create();
            v48 = *(void **)(*(void *)v111 + 40);
            *(void *)(*(void *)v111 + 40) = v47;

            v46 = *(NSObject **)(*(void *)v111 + 40);
          }
          dispatch_group_enter(v46);
          tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
          v49 = self->_tileLoader;
          v42 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters auditToken];
          v45 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters queue];
          [(GEOTileLoader *)v49 loadKey:v41 priority:2147483646 forClient:tileLoaderClientIdentifier options:v65 reason:4 auditToken:v42 callbackQ:v45 beginNetwork:0 callback:v64];
          BOOL v23 = 0;
LABEL_53:
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v70 objects:v109 count:16];
      }
      while (v38);
    }

    if (v23)
    {
      v57[2](v57, v106[3], v100[5]);
    }
    else
    {
      v51 = *(NSObject **)(*(void *)v111 + 40);
      v52 = [(_GEOMapFeatureAccessRequestParameters *)self->_requestParameters queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_17;
      block[3] = &unk_1E53D9928;
      v67 = v57;
      v68 = &v105;
      v69 = &v99;
      dispatch_group_notify(v51, v52, block);
    }
    _Block_object_dispose(&v99, 8);

    _Block_object_dispose(&v105, 8);
    _Block_object_dispose(buf, 8);

    id v19 = v57;
  }
  else
  {
    id v19 = v57;
    if (v57) {
      v57[2](v57, 0, 0);
    }
  }

  return v56;
}

id __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke(int a1, id a2)
{
  return a2;
}

void __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_13(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if ((*(unsigned char *)a2 & 0x7F) == 0xC)
      {
        *((void *)&v14 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
        *(void *)&long long v14 = *(void *)(a2 + 1);
        objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v14 >> 6), v14 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v18, v19);
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)(a2 + 1) >> 40) & 0x3FLL, *(unsigned char *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
      id v17 = };
      *(_DWORD *)buf = 138412546;
      long long v21 = v17;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Error while fetching offline tile %@: %@", buf, 0x16u);
    }
  }
  else
  {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v15 = a1[4];
    if (v15)
    {
      uint64_t v16 = (*(void (**)(void))(a1[5] + 16))();
      (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, a2, v16);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[7] + 8) + 40));
}

void __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_15(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if ((*(unsigned char *)a2 & 0x7F) == 0xC)
      {
        *((void *)&v14 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
        *(void *)&long long v14 = *(void *)(a2 + 1);
        objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v14 >> 6), v14 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v28, v29);
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)(a2 + 1) >> 40) & 0x3FLL, *(unsigned char *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
      id v17 = };
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v17;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Error while retrying loading tile %@: %@", buf, 0x16u);
    }
    id v18 = v11;
    uint64_t v19 = [v18 domain];
    v20 = GEOErrorDomain();
    if ([v19 isEqual:v20])
    {
      uint64_t v21 = [v18 code];

      if (v21 == -2) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (a1[5] && a1[10] != a1[11])
    {
      dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1[8] + 8) + 40));
      uint64_t v22 = a1[4];
      uint64_t v24 = *(void *)(v22 + 40);
      id v23 = *(void **)(v22 + 48);
      uint64_t v25 = a1[10];
      uint64_t v26 = [*(id *)(v22 + 8) auditToken];
      uint64_t v27 = [*(id *)(a1[4] + 8) queue];
      [v23 loadKey:a2 priority:2147483646 forClient:v24 options:v25 reason:4 auditToken:v26 callbackQ:v27 beginNetwork:0 callback:a1[5]];
    }
  }
  else
  {
    ++*(void *)(*(void *)(a1[9] + 8) + 24);
    uint64_t v15 = a1[6];
    if (v15)
    {
      uint64_t v16 = (*(void (**)(void))(a1[7] + 16))();
      (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, a2, v16);
    }
  }
LABEL_16:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[8] + 8) + 40));
}

void __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if ((*(unsigned char *)a2 & 0x7F) == 0xC)
      {
        *((void *)&v14 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
        *(void *)&long long v14 = *(void *)(a2 + 1);
        objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v14 >> 6), v14 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v41, v42);
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)(a2 + 1) >> 40) & 0x3FLL, *(unsigned char *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
      uint64_t v15 = };
      *(_DWORD *)buf = 138412546;
      id v45 = v15;
      __int16 v46 = 2112;
      id v47 = v11;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Error loading tile %@: %@", buf, 0x16u);
    }
    if ((*(unsigned char *)(a1 + 96) & 0x40) != 0)
    {
      uint64_t v16 = [v11 domain];
      id v17 = GEOErrorDomain();
      if ([v16 isEqual:v17])
      {
        uint64_t v18 = [v11 code];

        if (v18 == -8) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v22 = *(void **)(v19 + 40);
    v20 = (id *)(v19 + 40);
    uint64_t v21 = v22;
    if (v22) {
      id v23 = v21;
    }
    else {
      id v23 = v11;
    }
    objc_storeStrong(v20, v23);
LABEL_18:
    id v24 = v11;
    uint64_t v25 = [v24 domain];
    uint64_t v26 = GEOErrorDomain();
    if ([v25 isEqual:v26])
    {
      uint64_t v27 = [v24 code];

      if (v27 == -2) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    uint64_t v28 = *(void *)(a1 + 104);
    if (v28 == *(void *)(a1 + 96))
    {
      uint64_t v29 = *(void *)(a1 + 48);
      if (!v29)
      {
LABEL_25:
        BOOL v30 = 0;
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v28 = *(void *)(a1 + 112);
    }
    else
    {
      uint64_t v29 = *(void *)(a1 + 40);
    }
    BOOL v30 = (void *)MEMORY[0x18C120660](v29);
    if (v30 && v28 != *(void *)(a1 + 96))
    {
      dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
      uint64_t v31 = *(void *)(a1 + 32);
      __int16 v32 = *(void **)(v31 + 48);
      uint64_t v43 = *(void *)(v31 + 40);
      id v33 = [*(id *)(v31 + 8) auditToken];
      [*(id *)(*(void *)(a1 + 32) + 8) queue];
      id v34 = v10;
      v36 = id v35 = v12;
      [v32 loadKey:a2 priority:2147483646 forClient:v43 options:v28 reason:4 auditToken:v33 callbackQ:v36 beginNetwork:0 callback:v30];

      id v12 = v35;
      id v10 = v34;
    }
    goto LABEL_39;
  }
  if (!*(unsigned char *)(a1 + 120))
  {
    BOOL v30 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (v30)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      uint64_t v37 = *(void *)(a1 + 64);
      if (v37) {
        (*(void (**)(uint64_t, uint64_t, void *))(v37 + 16))(v37, a2, v30);
      }
    }
    else
    {
      uint64_t v38 = GEOGetGEOMapFeatureAccessLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if ((*(unsigned char *)a2 & 0x7F) == 0xC)
        {
          *((void *)&v39 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
          *(void *)&long long v39 = *(void *)(a2 + 1);
          objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v39 >> 6), v39 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v41, v42);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)(a2 + 1) >> 40) & 0x3FLL, *(unsigned char *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
        v40 = };
        *(_DWORD *)buf = 138412546;
        id v45 = v10;
        __int16 v46 = 2112;
        id v47 = v40;
        _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "Error reading tile: %@ (%@)", buf, 0x16u);
      }
    }
    goto LABEL_39;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
LABEL_40:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
}

uint64_t __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_17(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (id)_tileLoaderClientIdentifier
{
  tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  if (!tileLoaderClientIdentifier)
  {
    unint64_t v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    long long v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v4 stringWithFormat:@"%@<%p>(%@)", v6, self, v7];
    id v9 = self->_tileLoaderClientIdentifier;
    self->_tileLoaderClientIdentifier = v8;

    tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  }

  return tileLoaderClientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFinderRequest, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);

  objc_storeStrong((id *)&self->_requestParameters, 0);
}

@end