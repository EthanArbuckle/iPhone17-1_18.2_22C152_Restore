@interface ARTrackedRaycastPostProcessor
- (ARSession)session;
- (ARTrackedRaycastPostProcessor)initWithSession:(id)a3;
- (BOOL)result:(id)a3 isCloseEnoughToInitialResultForRaycast:(id)a4;
- (NSArray)trackedRaycasts;
- (double)updatePose:(__n128)a3 referenceOriginTransform:(__n128)a4 oldRayOrigin:(simd_float4)a5 oldRayDirection:(simd_float4)a6 newRayOrigin:(simd_float4)a7 newRayDirection:(simd_float4)a8;
- (void)addTrackedRaycast:(id)a3 andProcessInitialResults:(id)a4;
- (void)dealloc;
- (void)invalidateAllRaycasts;
- (void)invalidateRaycastWithIdentifier:(id)a3;
- (void)performBlockWhileLockingRaycasts:(id)a3;
- (void)processInitialResults:(id)a3 forRaycast:(id)a4;
- (void)processUpdatedResults:(id)a3;
- (void)removeTrackedRaycastWithIdentifier:(id)a3;
- (void)setSession:(id)a3;
- (void)startUpdateTimer;
- (void)updateFromPoseGraphEventWithData:(__n128)a3 referenceOriginTransform:(__n128)a4;
- (void)updateFromTimer:(id)a3;
@end

@implementation ARTrackedRaycastPostProcessor

- (ARTrackedRaycastPostProcessor)initWithSession:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARTrackedRaycastPostProcessor;
  v5 = [(ARTrackedRaycastPostProcessor *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)_trackedRaycasts;
    _trackedRaycasts = v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    v9 = (void *)_trackedRaycastSemaphore;
    _trackedRaycastSemaphore = (uint64_t)v8;

    uint64_t v10 = objc_opt_new();
    v11 = (void *)_initialRaycastResults;
    _initialRaycastResults = v10;

    uint64_t v12 = objc_opt_new();
    v13 = (void *)_targetRaycastResultUpdates;
    _targetRaycastResultUpdates = v12;

    uint64_t v14 = objc_opt_new();
    v15 = (void *)_resultsHistory;
    _resultsHistory = v14;

    objc_storeWeak((id *)&v5->_session, v4);
  }

  return v5;
}

- (void)dealloc
{
  if (_updateTimer)
  {
    [(id)_updateTimer invalidate];
    v3 = (void *)_updateTimer;
    _updateTimer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ARTrackedRaycastPostProcessor;
  [(ARTrackedRaycastPostProcessor *)&v4 dealloc];
}

- (NSArray)trackedRaycasts
{
  dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v2 = [(id)_trackedRaycasts allValues];
  dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
  return (NSArray *)v2;
}

- (void)addTrackedRaycast:(id)a3 andProcessInitialResults:(id)a4
{
  uint64_t v6 = _trackedRaycastSemaphore;
  id v7 = a4;
  id v8 = a3;
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)_trackedRaycasts;
  uint64_t v10 = [v8 identifier];
  [v9 setObject:v8 forKeyedSubscript:v10];

  [(ARTrackedRaycastPostProcessor *)self processInitialResults:v7 forRaycast:v8];
  v11 = _trackedRaycastSemaphore;
  dispatch_semaphore_signal(v11);
}

- (void)removeTrackedRaycastWithIdentifier:(id)a3
{
  v3 = (void *)_trackedRaycasts;
  id v4 = a3;
  [v3 setObject:0 forKeyedSubscript:v4];
  [(id)_initialRaycastResults setObject:0 forKeyedSubscript:v4];
  [(id)_targetRaycastResultUpdates setObject:0 forKeyedSubscript:v4];
  [(id)_resultsHistory setObject:0 forKeyedSubscript:v4];
}

- (void)invalidateAllRaycasts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend((id)_trackedRaycasts, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(ARTrackedRaycastPostProcessor *)self invalidateRaycastWithIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)invalidateRaycastWithIdentifier:(id)a3
{
  id v4 = a3;
  p_session = &self->_session;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    uint64_t v7 = [(id)_trackedRaycasts objectForKeyedSubscript:v4];
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_session);
      long long v9 = [v8 delegateQueue];
      long long v10 = v9;
      if (!v9)
      {
        long long v10 = MEMORY[0x1E4F14428];
        id v11 = MEMORY[0x1E4F14428];
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__ARTrackedRaycastPostProcessor_invalidateRaycastWithIdentifier___block_invoke;
      v12[3] = &unk_1E6185160;
      id v13 = v7;
      id v14 = v4;
      dispatch_async(v10, v12);
      if (!v9) {
    }
      }
  }
}

void __65__ARTrackedRaycastPostProcessor_invalidateRaycastWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updateHandler];
  v2[2](v2, MEMORY[0x1E4F1CBF0]);

  [(id)_initialRaycastResults setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  [(id)_targetRaycastResultUpdates setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  v3 = (void *)_resultsHistory;
  id v4 = [*(id *)(a1 + 32) identifier];
  [v3 setObject:0 forKeyedSubscript:v4];
}

- (void)processInitialResults:(id)a3 forRaycast:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_session = &self->_session;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_session);
    id v11 = [v10 annotateAnchorToRaycastResults:v6];

    uint64_t v12 = [v7 identifier];
    id v13 = [v11 firstObject];
    [(id)_initialRaycastResults setObject:v13 forKeyedSubscript:v12];

    id v14 = [v7 query];
    uint64_t v15 = [v14 target];

    if (v15 == 2)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v17 = 10;
      do
      {
        v18 = [v11 firstObject];
        [v16 addObject:v18];

        --v17;
      }
      while (v17);
      [(id)_resultsHistory setObject:v16 forKeyedSubscript:v12];
      v19 = (void *)_targetRaycastResultUpdates;
      v20 = [v7 identifier];
      [v19 setObject:0 forKeyedSubscript:v20];
    }
    id v21 = objc_loadWeakRetained((id *)p_session);
    v22 = [v21 delegateQueue];
    v23 = v22;
    if (!v22)
    {
      v23 = MEMORY[0x1E4F14428];
      id v24 = MEMORY[0x1E4F14428];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __66__ARTrackedRaycastPostProcessor_processInitialResults_forRaycast___block_invoke;
    v25[3] = &unk_1E6185160;
    id v26 = v7;
    id v6 = v11;
    id v27 = v6;
    dispatch_async(v23, v25);
    if (!v22) {
  }
    }
}

void __66__ARTrackedRaycastPostProcessor_processInitialResults_forRaycast___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updateHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)processUpdatedResults:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke;
    v6[3] = &unk_1E6185188;
    v6[4] = self;
    v6[5] = &v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v6];
    dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
    if (*((unsigned char *)v8 + 24)) {
      [(ARTrackedRaycastPostProcessor *)self startUpdateTimer];
    }
    _Block_object_dispose(&v7, 8);
  }
}

void __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = [WeakRetained annotateAnchorToRaycastResults:v6];

  char v10 = [(id)_trackedRaycasts objectForKeyedSubscript:v7];

  id v11 = [v10 query];
  uint64_t v12 = [v11 target];

  if (v12 == 2)
  {
    id v13 = [v9 firstObject];
    if (v13)
    {
      if ([*(id *)(a1 + 32) result:v13 isCloseEnoughToInitialResultForRaycast:v10])
      {
        [v13 setTarget:2];
        id v14 = (void *)_targetRaycastResultUpdates;
        uint64_t v15 = [v10 identifier];
        [v14 setObject:v13 forKeyedSubscript:v15];

        if (!_updateTimer) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
      }
    }
  }
  else if (v10 && [v9 count])
  {
    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    int v17 = [v16 delegateQueue];
    v18 = v17;
    if (!v17)
    {
      v18 = MEMORY[0x1E4F14428];
      id v19 = MEMORY[0x1E4F14428];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke_2;
    v20[3] = &unk_1E6185160;
    id v21 = v10;
    id v22 = v9;
    dispatch_async(v18, v20);
    if (!v17) {
  }
    }
}

void __55__ARTrackedRaycastPostProcessor_processUpdatedResults___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updateHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)performBlockWhileLockingRaycasts:(id)a3
{
  v3 = _trackedRaycastSemaphore;
  id v4 = (void (**)(void))a3;
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4);

  uint64_t v5 = _trackedRaycastSemaphore;
  dispatch_semaphore_signal(v5);
}

- (void)updateFromPoseGraphEventWithData:(__n128)a3 referenceOriginTransform:(__n128)a4
{
  *(__n128 *)&v97[32] = a4;
  *(__n128 *)&v97[48] = a5;
  *(__n128 *)v97 = a2;
  *(__n128 *)&v97[16] = a3;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v68 = v8;
  id obj = [v8 updatedAnchors];
  uint64_t v72 = [obj countByEnumeratingWithState:&v98 objects:v106 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v99;
    v69 = a1;
    do
    {
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v99 != v71) {
          objc_enumerationMutation(obj);
        }
        char v10 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        id v11 = [v10 identifier];
        uint64_t v12 = [(id)_trackedRaycasts objectForKeyedSubscript:v11];
        if (v12)
        {
          *(double *)v13.i64 = ARRenderingToVisionCoordinateTransform();
          float32x4_t v90 = v14;
          float32x4_t v93 = v13;
          float32x4_t v84 = v16;
          float32x4_t v87 = v15;
          [v10 transform];
          unint64_t v17 = 0;
          float64x2_t v107 = v18;
          long long v108 = v19;
          long long v109 = v20;
          long long v110 = v21;
          memset(&v111, 0, sizeof(v111));
          do
          {
            v111.columns[v17 / 2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v93, COERCE_FLOAT(*(_OWORD *)((char *)&v107 + v17 * 8))), v90, *(float32x2_t *)&v107.f64[v17], 1), v87, *(float32x4_t *)((char *)&v107 + v17 * 8), 2), v84, *(float32x4_t *)((char *)&v107 + v17 * 8), 3);
            v17 += 2;
          }
          while (v17 != 8);
          float32x4_t v91 = (float32x4_t)v111.columns[1];
          float32x4_t v94 = (float32x4_t)v111.columns[0];
          float32x4_t v85 = (float32x4_t)v111.columns[3];
          float32x4_t v88 = (float32x4_t)v111.columns[2];
          v22.f64[0] = ARVisionToRenderingCoordinateTransform();
          unint64_t v23 = 0;
          float64x2_t v107 = v22;
          long long v108 = v24;
          long long v109 = v25;
          long long v110 = v26;
          memset(&v111, 0, sizeof(v111));
          do
          {
            v111.columns[v23 / 2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v94, COERCE_FLOAT(*(_OWORD *)((char *)&v107 + v23 * 8))), v91, *(float32x2_t *)&v107.f64[v23], 1), v88, *(float32x4_t *)((char *)&v107 + v23 * 8), 2), v85, *(float32x4_t *)((char *)&v107 + v23 * 8), 3);
            v23 += 2;
          }
          while (v23 != 8);
          simd_float4 v77 = v111.columns[3];
          simd_float4 v80 = v111.columns[2];
          simd_float4x4 v113 = __invert_f4(v111);
          simd_float4 v92 = v113.columns[1];
          simd_float4 v95 = v113.columns[0];
          simd_float4 v86 = v113.columns[3];
          simd_float4 v89 = v113.columns[2];
          v111.columns[0] = (simd_float4)vcvtq_f64_f32(*(float32x2_t *)v77.f32);
          *(double *)v111.columns[1].i64 = v77.f32[2];
          float64x2_t v107 = vcvtq_f64_f32(*(float32x2_t *)v80.f32);
          *(double *)&long long v108 = v80.f32[2];
          id v27 = [v12 query];
          [v27 direction];
          float32x4_t v81 = v28;

          simd_float4x4 v114 = __invert_f4(*(simd_float4x4 *)v97);
          float32x4_t v75 = (float32x4_t)v114.columns[0];
          float32x4_t v76 = (float32x4_t)v114.columns[1];
          float32x4_t v74 = (float32x4_t)v114.columns[3];
          float32x4_t v78 = (float32x4_t)v114.columns[2];
          float32x4_t v82 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v114.columns[0], v81.f32[0]), (float32x4_t)v114.columns[1], *(float32x2_t *)v81.f32, 1), (float32x4_t)v114.columns[2], v81, 2), (float32x4_t)0, (float32x4_t)v114.columns[3]);
          *(double *)v29.i64 = ARRenderingToVisionCoordinateTransform();
          float32x4_t v83 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, v82.f32[0]), v30, *(float32x2_t *)v82.f32, 1), v31, v82, 2), v32, v82, 3);
          v33 = [v12 query];
          [v33 origin];
          float32x4_t v73 = v34;

          float32x4_t v79 = vaddq_f32(v74, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v75, v73.f32[0]), v76, *(float32x2_t *)v73.f32, 1), v78, v73, 2));
          *(double *)v35.i64 = ARRenderingToVisionCoordinateTransform();
          float32x4_t v39 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v35, v79.f32[0]), v36, *(float32x2_t *)v79.f32, 1), v37, v79, 2), v38, v79, 3);
          float64x2_t v104 = vcvtq_f64_f32(*(float32x2_t *)v39.f32);
          double v105 = v39.f32[2];
          v115.columns[3] = v86;
          float64x2_t v102 = vcvtq_f64_f32(*(float32x2_t *)v83.f32);
          double v103 = v83.f32[2];
          v115.columns[1] = v92;
          v115.columns[0] = v95;
          v115.columns[2] = v89;
          ARWorldTransformFromVisionTransform(v115, *(float32x4_t *)v97, *(float32x4_t *)&v97[16], *(float32x4_t *)&v97[32], *(float32x4_t *)&v97[48]);
          v92.i64[0] = v41;
          v95.i64[0] = v40;
          v42 = [ARRaycastQuery alloc];
          v43 = [v12 query];
          uint64_t v44 = [v43 target];
          v45 = [v12 query];
          uint64_t v46 = -[ARRaycastQuery initWithOrigin:direction:allowingTarget:alignment:](v42, "initWithOrigin:direction:allowingTarget:alignment:", v44, [v45 targetAlignment], *(double *)v92.i64, *(double *)v95.i64);

          v96 = (void *)v46;
          [v12 setTrackedQuery:v46];
          v47 = [(id)_initialRaycastResults objectForKeyedSubscript:v11];
          v48 = v47;
          if (v47)
          {
            [v47 worldTransform];
            objc_msgSend(a1, "updatePose:referenceOriginTransform:oldRayOrigin:oldRayDirection:newRayOrigin:newRayDirection:", &v104, &v102, &v111, &v107);
            v53 = -[ARRaycastResult initWithWorldTransform:target:targetAlignment:]([ARRaycastResult alloc], "initWithWorldTransform:target:targetAlignment:", [v48 target], objc_msgSend(v48, "targetAlignment"), v49, v50, v51, v52);
            v54 = [v48 anchor];
            [(ARRaycastResult *)v53 setAnchor:v54];

            v55 = [v48 anchorIdentifier];
            [(ARRaycastResult *)v53 setAnchorIdentifier:v55];

            [(id)_initialRaycastResults setObject:v53 forKeyedSubscript:v11];
          }
          v56 = [(id)_targetRaycastResultUpdates objectForKeyedSubscript:v11];
          v57 = v56;
          if (v56)
          {
            [v56 worldTransform];
            objc_msgSend(a1, "updatePose:referenceOriginTransform:oldRayOrigin:oldRayDirection:newRayOrigin:newRayDirection:", &v104, &v102, &v111, &v107);
            v62 = -[ARRaycastResult initWithWorldTransform:target:targetAlignment:]([ARRaycastResult alloc], "initWithWorldTransform:target:targetAlignment:", [v57 target], objc_msgSend(v57, "targetAlignment"), v58, v59, v60, v61);
            v63 = [v57 anchor];
            [(ARRaycastResult *)v62 setAnchor:v63];

            v64 = [v57 anchorIdentifier];
            [(ARRaycastResult *)v62 setAnchorIdentifier:v64];

            [(id)_targetRaycastResultUpdates setObject:v62 forKeyedSubscript:v11];
            v65 = [(id)_resultsHistory objectForKeyedSubscript:v11];
            v66 = v65;
            if (v65)
            {
              [v65 removeAllObjects];
              int v67 = 10;
              do
              {
                [v66 addObject:v62];
                --v67;
              }
              while (v67);
            }

            a1 = v69;
          }
        }
      }
      uint64_t v72 = [obj countByEnumeratingWithState:&v98 objects:v106 count:16];
    }
    while (v72);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
}

- (double)updatePose:(__n128)a3 referenceOriginTransform:(__n128)a4 oldRayOrigin:(simd_float4)a5 oldRayDirection:(simd_float4)a6 newRayOrigin:(simd_float4)a7 newRayDirection:(simd_float4)a8
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(double *)v8.i64 = ARVisionTransformFromWorldTransform(a1, a2, a3, a4, a5, a6, a7, a8);
  ARMatrix4x4RowMajorRotationAndTranslation(v19, &v18, v8, v9, v10, v11);
  CV3DUpdateHitTestResultPose();
  *(double *)v21.columns[0].i64 = ARMatrix4x4MakeRowMajorTransform(v17);
  return ARWorldTransformFromVisionTransform(v21, (float32x4_t)a5, (float32x4_t)a6, (float32x4_t)a7, (float32x4_t)a8);
}

- (BOOL)result:(id)a3 isCloseEnoughToInitialResultForRaycast:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)_initialRaycastResults;
  int8x16_t v8 = [v6 identifier];
  int8x16_t v9 = [v7 objectForKeyedSubscript:v8];

  BOOL v10 = 1;
  if (v5 && v9)
  {
    [v9 worldTransform];
    float32x4_t v23 = v11;
    [v5 worldTransform];
    float32x4_t v22 = v12;
    float32x4_t v13 = [v6 query];
    [v13 origin];
    float32x4_t v15 = vsubq_f32(v14, v23);
    float32x4_t v16 = vmulq_f32(v15, v15);
    float v17 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0]);

    float v18 = v17 * 0.1;
    float32x4_t v19 = vsubq_f32(v23, v22);
    float32x4_t v20 = vmulq_f32(v19, v19);
    BOOL v10 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0]) <= v18;
  }

  return v10;
}

- (void)startUpdateTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ARTrackedRaycastPostProcessor_startUpdateTimer__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__ARTrackedRaycastPostProcessor_startUpdateTimer__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_updateFromTimer_ selector:0 userInfo:1 repeats:0.1];
  v2 = (void *)_updateTimer;
  _updateTimer = v1;

  v3 = (void *)_updateTimer;
  return [v3 fire];
}

- (void)updateFromTimer:(id)a3
{
  if ((id)_updateTimer == a3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)_trackedRaycastSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke;
    v4[3] = &unk_1E61851D8;
    v4[4] = self;
    [(id)_trackedRaycasts enumerateKeysAndObjectsUsingBlock:v4];
    dispatch_semaphore_signal((dispatch_semaphore_t)_trackedRaycastSemaphore);
  }
  else
  {
    [a3 invalidate];
  }
}

void __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 query];
  uint64_t v8 = [v7 target];

  if (v8 == 2)
  {
    int8x16_t v9 = [(id)_targetRaycastResultUpdates objectForKeyedSubscript:v5];
    BOOL v10 = v9;
    if (v9)
    {
      [v9 worldTransform];
      float32x4_t v107 = v11;
      *(double *)v125.columns[0].i64 = ARMatrix3x3FromMatrix4x4([v10 worldTransform]);
      *(double *)v12.i64 = simd_quaternion(v125);
      float32x4_t v103 = v12;
      float32x4_t v13 = [(id)_resultsHistory objectForKeyedSubscript:v5];
      float32x4_t v14 = [v13 lastObject];
      [v14 worldTransform];
      float32x4_t v109 = v15;
      *(double *)v126.columns[0].i64 = ARMatrix3x3FromMatrix4x4([v14 worldTransform]);
      *(double *)v16.i64 = simd_quaternion(v126);
      float32x4_t v17 = v16;
      float32x4_t v18 = vsubq_f32(v109, v107);
      float32x4_t v19 = vmulq_f32(v18, v18);
      float32x4_t v101 = v17;
      if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]) > 0.005)
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id v20 = v13;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v119 objects:v123 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v120;
          float32x4_t v110 = 0u;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v120 != v23) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v119 + 1) + 8 * i) worldTransform];
              float32x4_t v110 = vaddq_f32(v110, v25);
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v119 objects:v123 count:16];
          }
          while (v22);
        }

        [v20 count];
        float32x4_t v17 = v101;
      }
      float32x4_t v26 = vmulq_f32(v17, v17);
      float v27 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0]), v17.f32[3]);
      float v28 = v27 + v27;
      float32x4_t v29 = vmulq_f32(v103, v103);
      float v30 = atan2f(sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0]), v103.f32[3]);
      _Q17 = v103;
      float v32 = vabds_f32(v28, v30 + v30);
      if (v32 > 0.0087266)
      {
        float v33 = 0.0087266 / v32;
        float32x4_t v34 = vmulq_f32(v103, v101);
        float32x4_t v35 = (float32x4_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL);
        *(float32x2_t *)v34.f32 = vadd_f32(*(float32x2_t *)v34.f32, *(float32x2_t *)v35.f32);
        v34.f32[0] = vaddv_f32(*(float32x2_t *)v34.f32);
        v35.i64[0] = 0;
        float32x4_t v36 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v34, v35)), 0), (int8x16_t)vnegq_f32(v103), (int8x16_t)v103);
        float v37 = 1.0;
        float v38 = 1.0 - v33;
        float32x4_t v39 = vsubq_f32(v101, v36);
        int8x16_t v40 = (int8x16_t)vmulq_f32(v39, v39);
        float32x4_t v111 = v36;
        float32x4_t v41 = vaddq_f32(v101, v36);
        int8x16_t v42 = (int8x16_t)vmulq_f32(v41, v41);
        float v43 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL)))));
        float v44 = v43 + v43;
        _ZF = (float)(v43 + v43) == 0.0;
        float v46 = 1.0;
        if (!_ZF) {
          float v46 = sinf(v44) / v44;
        }
        float v47 = v46;
        float32x2_t v48 = vrecpe_f32((float32x2_t)LODWORD(v46));
        float32x2_t v49 = vmul_f32(v48, vrecps_f32((float32x2_t)LODWORD(v47), v48));
        LODWORD(v50) = vmul_f32(v49, vrecps_f32((float32x2_t)LODWORD(v47), v49)).u32[0];
        if ((float)(v38 * v44) != 0.0)
        {
          float v104 = v50;
          v49.f32[0] = sinf(v38 * v44);
          float v50 = v104;
          float v37 = v49.f32[0] / (float)(v38 * v44);
        }
        v49.f32[0] = v38 * (float)(v50 * v37);
        float32x4_t v51 = (float32x4_t)vdupq_lane_s32((int32x2_t)v49, 0);
        float v52 = v33 * v44;
        float v53 = 1.0;
        if (v52 != 0.0)
        {
          float v105 = v50;
          float32x4_t v100 = v51;
          float v54 = sinf(v52);
          float32x4_t v51 = v100;
          float v50 = v105;
          float v53 = v54 / v52;
        }
        float32x4_t v55 = vmlaq_f32(vmulq_n_f32(v111, v33 * (float)(v50 * v53)), v101, v51);
        int8x16_t v56 = (int8x16_t)vmulq_f32(v55, v55);
        float32x2_t v57 = vadd_f32(*(float32x2_t *)v56.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v56, v56, 8uLL));
        if (vaddv_f32(v57) == 0.0)
        {
          _Q17 = (float32x4_t)xmmword_1B8A2B050;
        }
        else
        {
          unsigned __int32 v58 = vadd_f32(v57, (float32x2_t)vdup_lane_s32((int32x2_t)v57, 1)).u32[0];
          float32x2_t v59 = vrsqrte_f32((float32x2_t)v58);
          float32x2_t v60 = vmul_f32(v59, vrsqrts_f32((float32x2_t)v58, vmul_f32(v59, v59)));
          _Q17 = vmulq_n_f32(v55, vmul_f32(v60, vrsqrts_f32((float32x2_t)v58, vmul_f32(v60, v60))).f32[0]);
        }
      }
      _S3 = _Q17.i32[1];
      _S4 = _Q17.i32[2];
      __asm { FMLS            S0, S4, V17.S[2] }
      _S5 = _Q17.i32[3];
      __asm
      {
        FMLA            S0, S5, V17.S[3]
        FMLA            S2, S3, V17.S[1]
        FMLA            S2, S5, V17.S[3]
        FMLS            S2, S17, V17.S[0]
        FMLA            S7, S4, V17.S[1]
        FMLA            S5, S4, V17.S[2]
        FMLS            S5, S17, V17.S[0]
        FMLS            S5, S3, V17.S[1]
      }
      ARMatrix4x4FromRotationAndTranslation();
      float32x4_t v108 = v77;
      float32x4_t v112 = v76;
      float32x4_t v102 = v79;
      float32x4_t v106 = v78;
      [v10 worldTransform];
      if (AREqualTransforms(v112, v108, v106, v102, v80, v81, v82, v83))
      {
        [v13 removeAllObjects];
        [v13 addObject:v10];
        [(id)_targetRaycastResultUpdates setObject:0 forKeyedSubscript:v5];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        float32x4_t v85 = [WeakRetained delegateQueue];
        simd_float4 v86 = v85;
        if (!v85)
        {
          simd_float4 v86 = MEMORY[0x1E4F14428];
          id v87 = MEMORY[0x1E4F14428];
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_3;
        block[3] = &unk_1E6185160;
        simd_float4x4 v114 = (ARRaycastResult *)v6;
        id v115 = v10;
        dispatch_async(v86, block);
        if (!v85) {

        }
        float32x4_t v88 = v114;
      }
      else
      {
        simd_float4 v89 = [ARRaycastResult alloc];
        float32x4_t v90 = [v6 query];
        uint64_t v91 = [v90 target];
        simd_float4 v92 = [v6 query];
        float32x4_t v93 = -[ARRaycastResult initWithWorldTransform:target:targetAlignment:](v89, "initWithWorldTransform:target:targetAlignment:", v91, [v92 targetAlignment], *(double *)v112.i64, *(double *)v108.i64, *(double *)v106.i64, *(double *)v102.i64);

        float32x4_t v94 = [v10 anchor];
        [(ARRaycastResult *)v93 setAnchor:v94];

        simd_float4 v95 = [v10 anchorIdentifier];
        [(ARRaycastResult *)v93 setAnchorIdentifier:v95];

        [v13 addObject:v93];
        if ((unint64_t)[v13 count] >= 0xB) {
          [v13 removeObjectAtIndex:0];
        }
        id v96 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        v97 = [v96 delegateQueue];
        long long v98 = v97;
        if (!v97)
        {
          long long v98 = MEMORY[0x1E4F14428];
          id v99 = MEMORY[0x1E4F14428];
        }
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_2;
        v116[3] = &unk_1E6185160;
        id v117 = v6;
        v118 = v93;
        float32x4_t v88 = v93;
        dispatch_async(v98, v116);
        if (!v97) {
      }
        }
      [(id)_resultsHistory setObject:v13 forKeyedSubscript:v5];
    }
  }
}

void __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) updateHandler];
  v4[0] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  ((void (**)(void, void *))v2)[2](v2, v3);
}

void __49__ARTrackedRaycastPostProcessor_updateFromTimer___block_invoke_3(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) updateHandler];
  v4[0] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  ((void (**)(void, void *))v2)[2](v2, v3);
}

- (ARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (ARSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end