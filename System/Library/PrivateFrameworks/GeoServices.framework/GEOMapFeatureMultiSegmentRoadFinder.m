@interface GEOMapFeatureMultiSegmentRoadFinder
- (id)_roadForRoadSegments:(id)a3;
- (id)findConnectedSegmentsForRoad:(id)a3 directionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findConnectedSegmentsForRoads:(id)a3 directionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6;
- (void)_recursivelyFindRoadSegmentsWithMuid:(unint64_t)a3 segments:(id)a4 directionality:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation GEOMapFeatureMultiSegmentRoadFinder

- (id)findConnectedSegmentsForRoads:(id)a3 directionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  id v10 = a6;
  v26 = v8;
  if (v9)
  {
    v25 = v10;
    v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__51;
    v40[4] = __Block_byref_object_dispose__51;
    id v41 = 0;
    group = dispatch_group_create();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v16 muid])
          {
            v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "muid"));
            char v18 = [v11 containsObject:v17];

            if ((v18 & 1) == 0)
            {
              v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "muid"));
              [v11 addObject:v19];

              dispatch_group_enter(group);
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke;
              v33[3] = &unk_1E53DFE48;
              v35 = v40;
              v34 = group;
              id v20 = [(GEOMapFeatureMultiSegmentRoadFinder *)self findConnectedSegmentsForRoad:v16 directionality:a4 handler:v9 completionHandler:v33];
            }
          }
          else
          {
            v9[2](v9, v16);
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v13);
    }

    v21 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    v22 = [v21 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke_2;
    block[3] = &unk_1E53DBFB0;
    id v31 = v25;
    v32 = v40;
    dispatch_group_notify(group, v22, block);

    v23 = self->super.super._existingRequest;
    _Block_object_dispose(v40, 8);

    id v10 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __110__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoads_directionality_handler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (id)findConnectedSegmentsForRoad:(id)a3 directionality:(unint64_t)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = [(GEOMapFeatureAccessFinder *)self requestParameters];
    uint64_t v14 = [v13 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke;
    block[3] = &unk_1E53E4CB0;
    id v18 = v10;
    id v20 = v11;
    id v21 = v12;
    unint64_t v22 = a4;
    v19 = self;
    dispatch_async(v14, block);

    v15 = self->super.super._existingRequest;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) muid])
  {
    v2 = [MEMORY[0x1E4F1CA48] array];
    [v2 addObject:*(void *)(a1 + 32)];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__51;
    v28[4] = __Block_byref_object_dispose__51;
    id v29 = 0;
    v3 = dispatch_group_create();
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5)
    {
      dispatch_group_enter(v3);
      v6 = *(void **)(a1 + 40);
      uint64_t v7 = [*(id *)(a1 + 32) muid];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_2;
      v25[3] = &unk_1E53DFE48;
      v27 = v28;
      v26 = v4;
      [v6 _recursivelyFindRoadSegmentsWithMuid:v7 segments:v2 directionality:1 completionHandler:v25];

      uint64_t v5 = *(void *)(a1 + 64);
    }
    if ((v5 & 2) != 0)
    {
      dispatch_group_enter(v4);
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 32) muid];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_3;
      v22[3] = &unk_1E53DFE48;
      v24 = v28;
      v23 = v4;
      [v8 _recursivelyFindRoadSegmentsWithMuid:v9 segments:v2 directionality:2 completionHandler:v22];
    }
    id v10 = [*(id *)(a1 + 40) requestParameters];
    id v11 = [v10 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_4;
    block[3] = &unk_1E53DE960;
    id v21 = v28;
    id v12 = *(id *)(a1 + 56);
    id v18 = v2;
    id v19 = v12;
    uint64_t v13 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v20 = v13;
    id v14 = v2;
    dispatch_group_notify(v4, v11, block);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15)
    {
      v16 = *(void (**)(void))(v15 + 16);
      v16();
    }
  }
}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7) {
    a2 = v6;
  }
  objc_storeStrong(v5, a2);
  id v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __109__GEOMapFeatureMultiSegmentRoadFinder_findConnectedSegmentsForRoad_directionality_handler_completionHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _roadForRoadSegments:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
}

- (id)_roadForRoadSegments:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = [[GEOMapFeatureMultiSegmentRoad alloc] initWithRoadSegments:v3];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_recursivelyFindRoadSegmentsWithMuid:(unint64_t)a3 segments:(id)a4 directionality:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v10 = a6;
  id v11 = [(GEOMapFeatureAccessFinder *)self requestParameters];
  id v12 = [v11 queue];
  dispatch_assert_queue_V2(v12);

  if (a3)
  {
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    char v44 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke;
    v38[3] = &unk_1E53E4CD8;
    v38[4] = self;
    unint64_t v41 = a3;
    BOOL v42 = a5 == 2;
    id v13 = v27;
    id v39 = v13;
    v40 = v43;
    v25 = (void *)MEMORY[0x18C120660](v38);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke_2;
    v32[3] = &unk_1E53E4D00;
    v32[4] = self;
    v35 = v43;
    id v34 = v10;
    unint64_t v36 = a3;
    id v14 = v13;
    id v33 = v14;
    unint64_t v37 = a5;
    v26 = (void *)MEMORY[0x18C120660](v32);
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v14, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v29;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = [*(id *)(*((void *)&v28 + 1) + 8 * v19) feature];
          [v15 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v45 count:16];
      }
      while (v17);
    }

    if (a5 == 2)
    {
      id v21 = [v16 firstObject];
      unint64_t v22 = [v21 startJunction];
      id v23 = [(GEOMapFeatureIntersectedRoadFinder *)self findUnjoinedRoadsAtJunction:v22 desiredRoadDirectionality:3 muid:a3 requireExactMuidMatch:1 featuresToIgnore:v15 handler:v25 completionHandler:v26];
    }
    else
    {
      id v21 = [v16 lastObject];
      unint64_t v22 = [v21 endJunction];
      id v24 = [(GEOMapFeatureIntersectedRoadFinder *)self findUnjoinedRoadsAtJunction:v22 desiredRoadDirectionality:2 muid:a3 requireExactMuidMatch:1 featuresToIgnore:v15 handler:v25 completionHandler:v26];
    }

    _Block_object_dispose(v43, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) requestParameters];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  if ([v6 muid] == *(void *)(a1 + 56))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 64)) {
      [v5 insertObject:v6 atIndex:0];
    }
    else {
      [v5 addObject:v6];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __118__GEOMapFeatureMultiSegmentRoadFinder__recursivelyFindRoadSegmentsWithMuid_segments_directionality_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) requestParameters];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = v7;
  if (v7 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      goto LABEL_7;
    }
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
  else
  {
    [*(id *)(a1 + 32) _recursivelyFindRoadSegmentsWithMuid:*(void *)(a1 + 64) segments:*(void *)(a1 + 40) directionality:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 48)];
  }
  uint64_t v5 = v7;
LABEL_7:
}

@end