@interface GEOMapFeatureIntersectedRoadFinder
- (id)_findRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 muid:(unint64_t)a5 featuresToIgnore:(id)a6 handler:(id)a7 completionHandler:(id)a8;
- (id)_intersectedRoadsInAdjacentTile:(id)a3 tileBorderPoint:(GeoCodecsVectorTilePoint)a4 junction:(id)a5 desiredRoadDirectionality:(unint64_t)a6 muid:(unint64_t)a7 requireExactMuidMatch:(BOOL)a8 featuresToIgnore:(id)a9 shouldStop:(BOOL *)a10;
- (id)_old_intersectedRoadsInAdjacentTile:(id)a3 tileBorderPoint:(GeoCodecsVectorTilePoint)a4 junction:(id)a5 desiredRoadDirectionality:(unint64_t)a6 featuresToIgnore:(id)a7;
- (id)findRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRoadsAtNextIntersectionOf:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findRoadsAtPreviousIntersectionOf:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findUnjoinedRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 muid:(unint64_t)a5 requireExactMuidMatch:(BOOL)a6 featuresToIgnore:(id)a7 handler:(id)a8 completionHandler:(id)a9;
- (void)_tilesBorderingTile:(uint64_t)a3 atPoint:(uint64_t)a4 withHandler:(uint64_t)a5;
@end

@implementation GEOMapFeatureIntersectedRoadFinder

- (id)findRoadsAtPreviousIntersectionOf:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 endFeature];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = [v10 endFeature];
    v16 = [v14 setWithObject:v15];
  }
  else
  {
    v17 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v21 = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_FAULT, "Road has no underlying feature: %@", (uint8_t *)&v21, 0xCu);
    }

    v16 = 0;
  }
  v18 = [v10 startJunction];
  v19 = -[GEOMapFeatureIntersectedRoadFinder _findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:](self, "_findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:", v18, a4, [v10 muid], v16, v11, v12);

  return v19;
}

- (id)findRoadsAtNextIntersectionOf:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 endFeature];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = [v10 endFeature];
    v16 = [v14 setWithObject:v15];
  }
  else
  {
    v17 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v21 = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_FAULT, "Road has no underlying feature: %@", (uint8_t *)&v21, 0xCu);
    }

    v16 = 0;
  }
  v18 = [v10 endJunction];
  v19 = -[GEOMapFeatureIntersectedRoadFinder _findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:](self, "_findRoadsAtJunction:desiredRoadDirectionality:muid:featuresToIgnore:handler:completionHandler:", v18, a4, [v10 muid], v16, v11, v12);

  return v19;
}

- (id)findRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  v6 = [(GEOMapFeatureIntersectedRoadFinder *)self _findRoadsAtJunction:a3 desiredRoadDirectionality:a4 muid:0 featuresToIgnore:0 handler:a5 completionHandler:a6];

  return v6;
}

- (id)_findRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 muid:(unint64_t)a5 featuresToIgnore:(id)a6 handler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = v17;
  if (!v14)
  {
    if (v17) {
      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }
    v29 = objc_alloc_init(_GEOMapFeatureAccessRequest);
    goto LABEL_10;
  }
  v19 = [(GEOMapFeatureAccessFinder *)self requestParameters];
  char v20 = [v19 joinAllRoadsByMuid];

  if ((v20 & 1) == 0)
  {
    v29 = [(GEOMapFeatureIntersectedRoadFinder *)self findUnjoinedRoadsAtJunction:v14 desiredRoadDirectionality:a4 muid:a5 requireExactMuidMatch:0 featuresToIgnore:v15 handler:v16 completionHandler:v18];
LABEL_10:
    v28 = v29;
    goto LABEL_11;
  }
  if (!self->super._existingRequest)
  {
    int v21 = [_GEOMapFeatureAccessRequest alloc];
    id v22 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    uint64_t v23 = [v22 tileLoader];
    v24 = [(_GEOMapFeatureAccessRequest *)v21 initWithTileLoader:v23];
    existingRequest = self->super._existingRequest;
    self->super._existingRequest = v24;
  }
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__20;
  v37[4] = __Block_byref_object_dispose__20;
  id v38 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke;
  v36[3] = &unk_1E53DED30;
  v36[4] = v37;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_2;
  v31[3] = &unk_1E53DED80;
  v31[4] = self;
  v34 = v37;
  id v32 = v18;
  unint64_t v35 = a4;
  id v33 = v16;
  v26 = [(GEOMapFeatureIntersectedRoadFinder *)self findUnjoinedRoadsAtJunction:v14 desiredRoadDirectionality:a4 muid:a5 requireExactMuidMatch:0 featuresToIgnore:v15 handler:v36 completionHandler:v31];
  v27 = self->super._existingRequest;
  self->super._existingRequest = v26;

  v28 = self->super._existingRequest;
  _Block_object_dispose(v37, 8);

LABEL_11:

  return v28;
}

void __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v3 = v8;
  }
  [v4 addObject:v3];
}

void __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requestParameters];
  id v3 = [v2 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_3;
  block[3] = &unk_1E53DED58;
  uint64_t v8 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  uint64_t v9 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

id __133__GEOMapFeatureIntersectedRoadFinder__findRoadsAtJunction_desiredRoadDirectionality_muid_featuresToIgnore_handler_completionHandler___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    v2 = [GEOMapFeatureMultiSegmentRoadFinder alloc];
    id v3 = [*(id *)(a1 + 32) requestParameters];
    uint64_t v4 = [(GEOMapFeatureAccessFinder *)v2 initWithRequestParameters:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    [*(id *)(*(void *)(a1 + 32) + 24) setExistingRequest:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = 3;
    if (v7 == 2) {
      uint64_t v8 = 1;
    }
    if (v7 == 3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8;
    }
    return (id)[*(id *)(*(void *)(a1 + 32) + 24) findConnectedSegmentsForRoads:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) directionality:v9 handler:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id result = *(id *)(a1 + 40);
    if (result)
    {
      id v11 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v11();
    }
  }
  return result;
}

- (id)findUnjoinedRoadsAtJunction:(id)a3 desiredRoadDirectionality:(unint64_t)a4 muid:(unint64_t)a5 requireExactMuidMatch:(BOOL)a6 featuresToIgnore:(id)a7 handler:(id)a8 completionHandler:(id)a9
{
  BOOL v12 = a6;
  v105[2] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v59 = a7;
  id v60 = a8;
  id v61 = a9;
  uint64_t v99 = 0;
  v100 = (id *)&v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__20;
  v103 = __Block_byref_object_dispose__20;
  id v104 = 0;
  if (a5 || !v12)
  {
    group = dispatch_group_create();
    char v20 = [MEMORY[0x1E4F1CA48] array];
    *(void *)buf = 0;
    v94 = buf;
    uint64_t v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__20;
    v97 = __Block_byref_object_dispose__20;
    id v98 = 0;
    v56 = v20;
    v57 = [v16 tile];
    uint64_t v21 = [v16 connectivityJunction];
    if (v21)
    {
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke;
      v83[3] = &unk_1E53DEDD0;
      id v84 = v57;
      uint64_t v89 = v21;
      BOOL v92 = v12;
      id v85 = v59;
      unint64_t v90 = a5;
      id v86 = v16;
      unint64_t v91 = a4;
      id v87 = v20;
      id v22 = group;
      v88 = v22;
      uint64_t v23 = (void *)MEMORY[0x18C120660](v83);
      dispatch_group_enter(v22);
      v24 = [(GEOMapFeatureAccessFinder *)self requestParameters];
      v25 = [v24 queue];
      dispatch_async(v25, v23);

      existingRequest = self->super._existingRequest;
      if (existingRequest)
      {
        v27 = self->super._existingRequest;
      }
      else
      {
        v28 = [_GEOMapFeatureAccessRequest alloc];
        uint64_t v9 = [(GEOMapFeatureAccessFinder *)self requestParameters];
        v24 = [v9 tileLoader];
        v27 = [(_GEOMapFeatureAccessRequest *)v28 initWithTileLoader:v24];
      }
      objc_storeStrong(v100 + 5, v27);
      if (!existingRequest)
      {
      }
      char v20 = v56;
    }
    if ([v16 isOnTileBorder]
      && [v16 primaryID]
      && [v16 secondaryID])
    {
      v81[0] = 0;
      v81[1] = v81;
      v81[2] = 0x2020000000;
      char v82 = 0;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_3;
      v73[3] = &unk_1E53DEDF8;
      v77 = v81;
      v73[4] = self;
      id v29 = v16;
      id v74 = v29;
      unint64_t v78 = a4;
      unint64_t v79 = a5;
      BOOL v80 = v12;
      id v75 = v59;
      id v76 = v20;
      v30 = (void *)MEMORY[0x18C120660](v73);
      $7E3FC3C8846FD6918BD0D88F3AA609C8 v31 = +[GEOMapFeatureAccess tileSetInfoForStyle:53 scale:0];
      id v32 = [GEOMapFeatureTileFinder alloc];
      id v33 = [(GEOMapFeatureAccessFinder *)self requestParameters];
      v34 = [(GEOMapFeatureTileFinder *)v32 initWithZoomLevel:HIDWORD(*(unint64_t *)&v31) tileSize:v31 tileScale:0 tileSetStyle:53 requestParameters:v33];

      [(GEOMapFeatureTileFinder *)v34 setExistingRequest:self->super._existingRequest];
      uint64_t v35 = [v57 tileKey];
      LOBYTE(v32) = *(unsigned char *)(v35 + 10);
      LODWORD(v33) = *(unsigned __int16 *)(v35 + 8);
      unint64_t v36 = *(void *)v35;
      *(void *)((char *)v105 + 1) = (*(void *)v35 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v35 >> 8) & 0x3F) << 40);
      uint64_t v37 = *(void *)((char *)v105 + 1);
      LOBYTE(v105[0]) = v36;
      uint64_t v38 = v105[0];
      [v29 tilePoint];
      int v40 = v39;
      int v42 = v41;
      *((void *)&v43 + 1) = BYTE4(v36) | ((((v36 >> 40) | (v33 << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v33 >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v32 & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(v32 >> 4) << 52);
      *(void *)&long long v43 = v37;
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_4;
      v67[3] = &unk_1E53DEE70;
      v68 = group;
      v71 = &v99;
      v44 = v34;
      v69 = v44;
      id v45 = v30;
      id v70 = v45;
      v72 = buf;
      LODWORD(v46) = v40;
      LODWORD(v47) = v42;
      -[GEOMapFeatureIntersectedRoadFinder _tilesBorderingTile:atPoint:withHandler:](self, "_tilesBorderingTile:atPoint:withHandler:", v38, (unint64_t)(v43 >> 56), v67, v46, v47);

      _Block_object_dispose(v81, 8);
      char v20 = v56;
    }
    v48 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v49 = [v48 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_7;
    block[3] = &unk_1E53DEE98;
    id v50 = v20;
    id v63 = v50;
    id v64 = v60;
    id v65 = v61;
    v66 = buf;
    dispatch_group_notify(group, v49, block);

    v51 = (_GEOMapFeatureAccessRequest *)v100[5];
    if (v51 || (v51 = self->super._existingRequest) != 0)
    {
      v19 = v51;
    }
    else
    {
      v53 = [_GEOMapFeatureAccessRequest alloc];
      v54 = [(GEOMapFeatureAccessFinder *)self requestParameters];
      v55 = [v54 tileLoader];
      v19 = [(_GEOMapFeatureAccessRequest *)v53 initWithTileLoader:v55];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v17 = GEOGetGEOMapFeatureAccessLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Error calling GEOMapFeatureIntersectedRoadFinder findUnjoinedRoadsAtJunction. requireExactMuidMatch is YES but muid is 0.", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: (requireExactMuidMatch && muid == 0) == NO", buf, 2u);
    }
    if (v61)
    {
      v18 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"requireExactMuidMatch is YES but muid is 0"];
      (*((void (**)(id, void *))v61 + 2))(v61, v18);
    }
    v19 = objc_alloc_init(_GEOMapFeatureAccessRequest);
  }
  _Block_object_dispose(&v99, 8);

  return v19;
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_2;
  v8[3] = &unk_1E53DEDA8;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 80);
  id v9 = v4;
  uint64_t v12 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 88);
  id v10 = v6;
  uint64_t v13 = v7;
  id v11 = *(id *)(a1 + 56);
  [v3 forEachEdgeOnJunction:v2 visitor:v8];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v15 = v3;
  uint64_t v5 = [v3 road];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    if (!*(unsigned char *)(a1 + 72)
      || (uint64_t v6 = *(void *)(a1 + 56)) == 0
      || ([v15 road],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 muid],
          v7,
          v6 == v8))
    {
      id v9 = [GEOMapFeatureRoad alloc];
      id v10 = [v15 road];
      id v11 = [(GEOMapFeatureRoad *)v9 initWithFeature:v10];

      uint64_t v12 = [(GEOMapFeatureRoad *)v11 startJunction];
      uint64_t v13 = [v12 connectivityJunction];
      BOOL v14 = v13 == [*(id *)(a1 + 40) connectivityJunction];

      [(GEOMapFeatureRoad *)v11 updateForDesiredRoadDirectionality:*(void *)(a1 + 64) isOutboundRoad:v14];
      [*(id *)(a1 + 48) addObject:v11];
    }
  }
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_3(uint64_t a1, void *a2, float a3, float a4)
{
  id v7 = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  int v12 = *(unsigned __int8 *)(v10 + 24);
  uint64_t v11 = v10 + 24;
  if (!v12)
  {
    id v14 = v7;
    *(float *)&double v8 = a3;
    *(float *)&double v9 = a4;
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "_intersectedRoadsInAdjacentTile:tileBorderPoint:junction:desiredRoadDirectionality:muid:requireExactMuidMatch:featuresToIgnore:shouldStop:", v7, *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 48), v8, v9, v11);
    if ([v13 count]) {
      [*(id *)(a1 + 56) addObjectsFromArray:v13];
    }

    id v7 = v14;
  }
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, float a4, float a5)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_5;
  v17[3] = &unk_1E53DEE20;
  uint64_t v10 = *(void **)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  float v19 = a4;
  float v20 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_6;
  v14[3] = &unk_1E53DEE48;
  uint64_t v16 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  uint64_t v11 = objc_msgSend(v10, "findTileWithKey:handler:completionHandler:", a2, a3, v17, v14);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

uint64_t __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, float, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40), *(float *)(a1 + 44));
}

void __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  uint64_t v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __162__GEOMapFeatureIntersectedRoadFinder_findUnjoinedRoadsAtJunction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_handler_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  return result;
}

- (id)_intersectedRoadsInAdjacentTile:(id)a3 tileBorderPoint:(GeoCodecsVectorTilePoint)a4 junction:(id)a5 desiredRoadDirectionality:(unint64_t)a6 muid:(unint64_t)a7 requireExactMuidMatch:(BOOL)a8 featuresToIgnore:(id)a9 shouldStop:(BOOL *)a10
{
  float var1 = a4.var1;
  float var0 = a4.var0;
  id v18 = a3;
  id v19 = a5;
  id v20 = a9;
  if (*a10)
  {
    id v21 = 0;
  }
  else
  {
    BOOL v33 = a8;
    id v22 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    uint64_t v23 = [v22 queue];
    dispatch_assert_queue_V2(v23);

    v24 = [v18 lines];
    v25 = [v24 firstObject];

    v34 = v25;
    if ([v25 muid])
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      for (unint64_t i = 0; i < [v18 junctionsCount]; ++i)
      {
        uint64_t v31 = [v18 junctions];
        if ([v19 primaryID]
          && [v19 primaryID] == *(void *)(v31 + v28 + 16)
          && [v19 secondaryID]
          && [v19 secondaryID] == *(void *)(v31 + v28 + 24))
        {
          uint64_t v29 = v31 + v28;
        }
        v28 += 32;
      }
      if (v29)
      {
        uint64_t v43 = 0;
        v44 = &v43;
        uint64_t v45 = 0x3032000000;
        double v46 = __Block_byref_object_copy__20;
        double v47 = __Block_byref_object_dispose__20;
        id v48 = 0;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __176__GEOMapFeatureIntersectedRoadFinder__intersectedRoadsInAdjacentTile_tileBorderPoint_junction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_shouldStop___block_invoke;
        v35[3] = &unk_1E53DEEC0;
        uint64_t v38 = a10;
        BOOL v42 = v33;
        unint64_t v39 = a7;
        uint64_t v40 = v29;
        unint64_t v41 = a6;
        id v36 = v20;
        uint64_t v37 = &v43;
        [v18 forEachEdgeOnJunction:v29 visitor:v35];
        id v21 = (id)v44[5];

        _Block_object_dispose(&v43, 8);
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      *(float *)&double v26 = var0;
      *(float *)&double v27 = var1;
      -[GEOMapFeatureIntersectedRoadFinder _old_intersectedRoadsInAdjacentTile:tileBorderPoint:junction:desiredRoadDirectionality:featuresToIgnore:](self, "_old_intersectedRoadsInAdjacentTile:tileBorderPoint:junction:desiredRoadDirectionality:featuresToIgnore:", v18, v19, a6, v20, v26, v27);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v21;
}

void __176__GEOMapFeatureIntersectedRoadFinder__intersectedRoadsInAdjacentTile_tileBorderPoint_junction_desiredRoadDirectionality_muid_requireExactMuidMatch_featuresToIgnore_shouldStop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!**(unsigned char **)(a1 + 48))
  {
    id v24 = v3;
    uint64_t v4 = [v3 road];
    int v5 = [v4 type];

    id v3 = v24;
    if (v5 == 1)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      long long v7 = [v24 road];
      LOBYTE(v6) = [v6 containsObject:v7];

      id v3 = v24;
      if ((v6 & 1) == 0)
      {
        if (!*(unsigned char *)(a1 + 80)
          || (uint64_t v8 = *(void *)(a1 + 56)) == 0
          || ([v24 road],
              long long v9 = objc_claimAutoreleasedReturnValue(),
              uint64_t v10 = [v9 muid],
              v9,
              id v3 = v24,
              v8 == v10))
        {
          if ([v3 junctionA] == *(void *)(a1 + 64)
            || (BOOL v11 = [v24 junctionB] == *(void *)(a1 + 64), v3 = v24, v11))
          {
            uint64_t v12 = [GEOMapFeatureRoad alloc];
            uint64_t v13 = [v24 road];
            id v14 = [(GEOMapFeatureRoad *)v12 initWithFeature:v13];

            id v15 = [(GEOMapFeatureRoad *)v14 startJunction];
            BOOL v16 = [v15 connectivityJunction] == *(void *)(a1 + 64);

            [(GEOMapFeatureRoad *)v14 updateForDesiredRoadDirectionality:*(void *)(a1 + 72) isOutboundRoad:v16];
            id v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            if (!v17)
            {
              uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
              id v20 = *(void **)(v19 + 40);
              *(void *)(v19 + 40) = v18;

              id v17 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            }
            [v17 addObject:v14];
            uint64_t v21 = *(void *)(a1 + 56);
            if (v21)
            {
              id v22 = [v24 road];
              uint64_t v23 = [v22 muid];

              if (v21 == v23) {
                **(unsigned char **)(a1 + 48) = 1;
              }
            }

            id v3 = v24;
          }
        }
      }
    }
  }
}

- (id)_old_intersectedRoadsInAdjacentTile:(id)a3 tileBorderPoint:(GeoCodecsVectorTilePoint)a4 junction:(id)a5 desiredRoadDirectionality:(unint64_t)a6 featuresToIgnore:(id)a7
{
  float var1 = a4.var1;
  float var0 = a4.var0;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v32 = a5;
  id v35 = a7;
  *(float *)BOOL v42 = var0;
  *(float *)&v42[1] = var1;
  uint64_t v31 = v11;
  [v11 lines];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v13)
  {
    id v34 = 0;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v12);
        }
        BOOL v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v16 type] == 1 && (objc_msgSend(v35, "containsObject:", v16) & 1) == 0)
        {
          unint64_t v37 = 0;
          id v17 = GEOMultiSectionFeaturePoints(v16, 0, &v37);
          if (v37 > 1)
          {
            uint64_t v22 = 0;
            *(void *)buf = *v17;
            uint64_t v36 = v17[v37 - 1];
            char v23 = 1;
            do
            {
              float v24 = vabds_f32(*(float *)&v42[v22], *(float *)&buf[4 * v22]);
              if ((v23 & 1) == 0) {
                break;
              }
              char v23 = 0;
              uint64_t v22 = 1;
            }
            while (v24 < 0.0001);
            uint64_t v25 = 0;
            char v26 = 1;
            do
            {
              float v27 = vabds_f32(*(float *)&v42[v25], *((float *)&v36 + v25));
              if ((v26 & 1) == 0) {
                break;
              }
              char v26 = 0;
              uint64_t v25 = 1;
            }
            while (v27 < 0.0001);
            if (v24 < 0.0001 || v27 < 0.0001)
            {
              uint64_t v28 = [[GEOMapFeatureRoad alloc] initWithFeature:v16];
              [(GEOMapFeatureRoad *)v28 updateForDesiredRoadDirectionality:a6 isOutboundRoad:(v24 < 0.0001) ^ [(GEOMapFeatureRoad *)v28 isFlipped]];
              uint64_t v29 = v34;
              if (!v34)
              {
                uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
              }
              id v34 = v29;
              [v29 addObject:v28];
            }
          }
          else
          {
            uint64_t v18 = [[GEOMapFeatureRoad alloc] initWithFeature:v16];
            uint64_t v19 = GEOGetGEOMapFeatureAccessLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              id v20 = [(GEOMapFeatureRoad *)v18 debugDescription];
              int v21 = [(GEOMapFeatureLine *)v18 coordinateCount];
              *(_DWORD *)buf = 138478083;
              *(void *)&buf[4] = v20;
              __int16 v44 = 1024;
              int v45 = v21;
              _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Feature in tile has invalid geometry. Road: %{private}@ | Coordinate count: %d", buf, 0x12u);
            }
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v13);
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

- (void)_tilesBorderingTile:(uint64_t)a3 atPoint:(uint64_t)a4 withHandler:(uint64_t)a5
{
  float v9 = fabsf(a1);
  float v10 = fabsf(a2);
  float v11 = fabsf(a2 + -1.0);
  if (v10 > 0.0001) {
    float v12 = 0.0;
  }
  else {
    float v12 = 1.0;
  }
  if (v9 > 0.0001) {
    float v13 = 0.0;
  }
  else {
    float v13 = 1.0;
  }
  BOOL v14 = v11 <= 0.0001 || v10 <= 0.0001;
  if (v11 > 0.0001) {
    int v15 = 0;
  }
  else {
    int v15 = -1;
  }
  if (v10 <= 0.0001) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  float v17 = fabsf(a1 + -1.0);
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v18 = v17 <= 0.0001 || v9 <= 0.0001;
  *(void *)&unsigned long long v43 = a5;
  *((void *)&v43 + 1) = a6;
  if (v9 <= 0.0001) {
    int v19 = -1;
  }
  else {
    int v19 = v17 <= 0.0001;
  }
  id v20 = a7;
  int v21 = HIBYTE(v43);
  int v22 = *(unsigned __int16 *)((char *)&v43 + 13);
  uint64_t v23 = *(unsigned int *)((char *)&v43 + 9);
  unint64_t v24 = (((*(void *)((char *)&v43 + 1) >> 46) | (*(_DWORD *)((char *)&v43 + 9) << 18)) & 0x3FFFFFF) + v19;
  id v41 = v20;
  if (v18)
  {
    unsigned long long v42 = v43;
    int v26 = *(unsigned __int16 *)(((unint64_t)&v42 | 9) + 4);
    unint64_t v25 = ((unint64_t)&v42 | 9) + 4;
    int v27 = *(unsigned __int8 *)(((unint64_t)&v42 | 9) + 6);
    unint64_t v28 = v24 & 0x3FFFFFF;
    *((void *)&v29 + 1) = (*((void *)&v43 + 1) >> 8) & 0xFFFFFF00 | ((unint64_t)(v26 | (v27 << 16)) << 32) | (v28 >> 18);
    *(void *)&long long v29 = v28 << 46;
    uint64_t v30 = (v28 << 46) | (v43 >> 8) & 0x3FFFFFFFFFFFLL;
    *(unsigned char *)(v25 + 2) = v27;
    *(_WORD *)unint64_t v25 = v26;
    *(void *)((char *)&v42 + 1) = v30;
    *(_DWORD *)((char *)&v42 + 9) = DWORD2(v29);
    (*((void (**)(id, void, void, float, float))v20 + 2))(v20, v42, v29 >> 56, v13, a2);
    id v20 = v41;
  }
  if (v14)
  {
    unsigned long long v42 = v43;
    unint64_t v31 = ((unint64_t)&v42 | 9) + 4;
    int v32 = *(unsigned __int8 *)(((unint64_t)&v42 | 9) + 6);
    uint64_t v33 = v43 >> 8;
    unint64_t v34 = BYTE9(v43) | ((unint64_t)(*(unsigned __int16 *)(((unint64_t)&v42 | 9) + 4) | (v32 << 16)) << 32) & 0xFFFFFFFC000000FFLL | ((unint64_t)((v16 + ((v23 | ((unint64_t)(v22 | (v21 << 16)) << 32)) >> 8)) & 0x3FFFFFF) << 8);
    *(unsigned char *)(v31 + 2) = v32;
    *(_WORD *)unint64_t v31 = WORD2(v34);
    *(_DWORD *)((char *)&v42 + 9) = v34;
    *((void *)&v35 + 1) = v34;
    *(void *)&long long v35 = v33;
    (*((void (**)(id, void, void, float, float))v20 + 2))(v20, v42, v35 >> 56, a1, v12);
    id v20 = v41;
    if (v18)
    {
      unsigned long long v42 = v43;
      unint64_t v36 = ((unint64_t)&v42 | 9) + 4;
      int v37 = *(unsigned __int8 *)(((unint64_t)&v42 | 9) + 6);
      unint64_t v38 = (v43 >> 8) & 0x3FFFFFFFFFFFLL | ((unint64_t)v24 << 46);
      unint64_t v39 = ((unint64_t)(*(unsigned __int16 *)(((unint64_t)&v42 | 9) + 4) | (v37 << 16)) << 32) & 0xFFFFFFFC00000000 | (v24 >> 18) | ((unint64_t)((v16 + ((v23 | ((unint64_t)(v22 | (v21 << 16)) << 32)) >> 8)) & 0x3FFFFFF) << 8);
      *(unsigned char *)(v36 + 2) = v37;
      *(_WORD *)unint64_t v36 = WORD2(v39);
      *(void *)((char *)&v42 + 1) = v38;
      *(_DWORD *)((char *)&v42 + 9) = (v24 >> 18) | ((v16
                                                                     + ((v23 | ((unint64_t)(v22 | (v21 << 16)) << 32)) >> 8)) << 8);
      *((void *)&v40 + 1) = v39;
      *(void *)&long long v40 = v24 << 46;
      (*((void (**)(id, void, void, float, float))v41 + 2))(v41, v42, v40 >> 56, v13, v12);
      id v20 = v41;
    }
  }
}

- (void).cxx_destruct
{
}

@end