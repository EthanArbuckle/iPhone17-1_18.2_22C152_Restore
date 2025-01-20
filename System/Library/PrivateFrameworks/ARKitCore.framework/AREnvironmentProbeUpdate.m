@interface AREnvironmentProbeUpdate
- (AREnvironmentProbeManager)manager;
- (AREnvironmentProbeUpdate)init;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
- (void)setManager:(id)a3;
- (void)updateAddedProbeAnchors:(id)a3 updatedProbeAnchors:(id)a4 removedProbeAnchors:(id)a5;
@end

@implementation AREnvironmentProbeUpdate

- (AREnvironmentProbeUpdate)init
{
  v3.receiver = self;
  v3.super_class = (Class)AREnvironmentProbeUpdate;
  result = [(AREnvironmentProbeUpdate *)&v3 init];
  if (result) {
    result->_probeAnchorsLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)updateAddedProbeAnchors:(id)a3 updatedProbeAnchors:(id)a4 removedProbeAnchors:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock_with_options();
  addedProbeAnchors = self->_addedProbeAnchors;
  if (addedProbeAnchors)
  {
    v11 = [(NSArray *)addedProbeAnchors arrayByAddingObjectsFromArray:v19];
  }
  else
  {
    v11 = (NSArray *)[v19 copy];
  }
  v12 = self->_addedProbeAnchors;
  self->_addedProbeAnchors = v11;

  updatedProbeAnchors = self->_updatedProbeAnchors;
  if (updatedProbeAnchors)
  {
    v14 = [(NSArray *)updatedProbeAnchors arrayByAddingObjectsFromArray:v8];
  }
  else
  {
    v14 = (NSArray *)[v8 copy];
  }
  v15 = self->_updatedProbeAnchors;
  self->_updatedProbeAnchors = v14;

  removedProbeAnchors = self->_removedProbeAnchors;
  if (removedProbeAnchors)
  {
    v17 = [(NSArray *)removedProbeAnchors arrayByAddingObjectsFromArray:v9];
  }
  else
  {
    v17 = (NSArray *)[v9 copy];
  }
  v18 = self->_removedProbeAnchors;
  self->_removedProbeAnchors = v17;

  os_unfair_lock_unlock(&self->_probeAnchorsLock);
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v51 = a11;
  id v14 = a12;
  os_unfair_lock_lock_with_options();
  id v15 = *(id *)(a1 + 16);
  v16 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  id v50 = *(id *)(a1 + 24);
  v17 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;

  id v18 = *(id *)(a1 + 32);
  id v19 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v47 = v14;
  v48 = v18;
  objc_msgSend(v14, "addObjectsFromArray:", v18, v15);
  v20 = +[ARProbeFilter filter:v14];
  v21 = (void *)[v20 mutableCopy];

  v49 = v21;
  v22 = +[ARProbeFilter filter:v51];
  v23 = (void *)[v22 mutableCopy];

  if ([v21 count]) {
    [v23 removeObjectsInArray:v21];
  }
  if ([v15 count]) {
    [v23 addObjectsFromArray:v15];
  }
  v24 = [(id)a1 manager];
  [v24 _updateProbesFromExistingAnchors:v23];

  v25 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v26 = v15;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v61 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        [v30 referenceTransform];
        uint64_t v31 = 0;
        long long v64 = v32;
        long long v65 = v33;
        long long v66 = v34;
        long long v67 = v35;
        do
        {
          *(long long *)((char *)&v68 + v31) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(long long *)((char *)&v64 + v31))), a7, *(float32x2_t *)((char *)&v64 + v31), 1), a8, *(float32x4_t *)((char *)&v64 + v31), 2), a9, *(float32x4_t *)((char *)&v64 + v31), 3);
          v31 += 16;
        }
        while (v31 != 64);
        objc_msgSend(v30, "setTransform:", *(double *)&v68, *(double *)&v69, *(double *)&v70, *(double *)&v71);
        [v25 addObject:v30];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v27);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v36 = v50;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v57 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        [v40 referenceTransform];
        uint64_t v41 = 0;
        long long v64 = v42;
        long long v65 = v43;
        long long v66 = v44;
        long long v67 = v45;
        do
        {
          *(long long *)((char *)&v68 + v41) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(long long *)((char *)&v64 + v41))), a7, *(float32x2_t *)((char *)&v64 + v41), 1), a8, *(float32x4_t *)((char *)&v64 + v41), 2), a9, *(float32x4_t *)((char *)&v64 + v41), 3);
          v41 += 16;
        }
        while (v41 != 64);
        objc_msgSend(v40, "setTransform:", *(double *)&v68, *(double *)&v69, *(double *)&v70, *(double *)&v71);
        [v25 addObject:v40];
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v72 count:16];
    }
    while (v37);
  }

  return v25;
}

- (AREnvironmentProbeManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (AREnvironmentProbeManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_removedProbeAnchors, 0);
  objc_storeStrong((id *)&self->_updatedProbeAnchors, 0);
  objc_storeStrong((id *)&self->_addedProbeAnchors, 0);
}

@end