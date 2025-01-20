@interface AR3DSkeletonRetargetingTechnique
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
- (AR3DSkeletonRetargetingTechnique)init;
- (ARCoreRESkeletonResults)latestResults;
- (BOOL)isEqual:(id)a3;
- (OS_dispatch_semaphore)resultSemaphore;
- (id)_retargetSkeleton:(id)a3;
- (id)processData:(id)a3;
- (void)prepare:(BOOL)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setLatestResults:(id)a3;
- (void)setResultSemaphore:(id)a3;
@end

@implementation AR3DSkeletonRetargetingTechnique

- (AR3DSkeletonRetargetingTechnique)init
{
  v6.receiver = self;
  v6.super_class = (Class)AR3DSkeletonRetargetingTechnique;
  v2 = [(ARTechnique *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    resultSemaphore = v2->_resultSemaphore;
    v2->_resultSemaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (void)prepare:(BOOL)a3
{
  if (!self->_abpkRetargeting)
  {
    v4 = (ABPKRetargeting *)objc_alloc_init(MEMORY[0x1E4F4A448]);
    abpkRetargeting = self->_abpkRetargeting;
    self->_abpkRetargeting = v4;
  }
}

- (id)processData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ARLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    __int16 v30 = 2048;
    v31 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Process Data", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v10 = [v8 detectedSkeletons];
    v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    BOOL v12 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.bodytracking.multipleBodyAnchors"];
    [v8 timestamp];
    kdebug_trace();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = objc_msgSend(v8, "detectedSkeletons", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_6:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [(AR3DSkeletonRetargetingTechnique *)self _retargetSkeleton:*(void *)(*((void *)&v23 + 1) + 8 * v17)];
        if (v18)
        {
          v19 = (void *)v18;
          [v11 addObject:v18];

          if (!v12) {
            break;
          }
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v15) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    [v8 timestamp];
    kdebug_trace();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v20 = objc_opt_new();
    [(AR3DSkeletonRetargetingTechnique *)self setLatestResults:v20];

    v21 = [(AR3DSkeletonRetargetingTechnique *)self latestResults];
    [v21 setRetargetedSkeletons:v11];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v7 = [(AR3DSkeletonRetargetingTechnique *)self latestResults];

  if (v7)
  {
    id v8 = [v6 imageData];
    [v8 cameraIntrinsics];
    double v32 = v10;
    double v33 = v9;
    double v31 = v11;
    BOOL v12 = [(AR3DSkeletonRetargetingTechnique *)self latestResults];
    objc_msgSend(v12, "setCameraIntrinsics:", v33, v32, v31);

    v13 = [v6 imageData];
    [v13 imageResolution];
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = [(AR3DSkeletonRetargetingTechnique *)self latestResults];
    objc_msgSend(v18, "setImageResolution:", v15, v17);

    v19 = [(AR3DSkeletonRetargetingTechnique *)self latestResults];
    v20 = [v19 retargetedSkeletons];
    v21 = [v20 firstObject];

    v22 = [v6 resultDataOfClass:objc_opt_class()];
    long long v23 = [v22 firstObject];

    if (v23 && ([v23 estimatedScaleFactor], v24 > 0.0))
    {
      [v23 estimatedScaleFactor];
      [v21 setEstimatedScaleFactor:v25];
      [v23 visionTransform];
      objc_msgSend(v21, "setVisionTransform:");
      long long v26 = [(ARTechnique *)self delegate];
      v27 = [(AR3DSkeletonRetargetingTechnique *)self latestResults];
      v36[0] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      v29 = v26;
    }
    else
    {
      long long v26 = objc_opt_new();
      [v26 setTimestamp:a3];
      [v26 setRetargetedSkeletons:MEMORY[0x1E4F1CBF0]];
      v27 = [(ARTechnique *)self delegate];
      v35 = v26;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      v29 = v27;
    }
    [v29 technique:self didOutputResultData:v28 timestamp:v6 context:a3];

    [(AR3DSkeletonRetargetingTechnique *)self setLatestResults:0];
  }
  else
  {
    v21 = objc_opt_new();
    long long v23 = [(ARTechnique *)self delegate];
    v34 = v21;
    __int16 v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v23 technique:self didOutputResultData:v30 timestamp:v6 context:a3];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
}

- (id)_retargetSkeleton:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F4A418]);
  uint64_t v6 = [v4 joints];
  uint64_t v7 = [v4 jointCount];
  id v8 = [v4 skeletonDetectionResult2D];
  double v9 = (void *)[v5 initWithJoints:v6 numberOfJoints:v7 referenceDetectionResult:v8];

  double v10 = [(ABPKRetargeting *)self->_abpkRetargeting processData:v9];
  [v10 jointTransformCount];
  MEMORY[0x1F4188790]();
  BOOL v12 = &buf[-16 * v11 - 16];
  if ([v10 jointTransformCount])
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    long long v33 = _Q0;
    do
    {
      v20 = &v12[v13];
      *(_OWORD *)&v12[v13 + 32] = *(_OWORD *)(objc_msgSend(v10, "localJointTransformsSRT", v33) + v13 + 32);
      long long v21 = *(_OWORD *)([v10 localJointTransformsSRT] + v13 + 16);
      *(_OWORD *)v20 = v33;
      *((_OWORD *)v20 + 1) = v21;
      ++v14;
      v13 += 48;
    }
    while (v14 < [v10 jointTransformCount]);
  }
  v22 = _ARLogGeneral();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    long long v23 = (objc_class *)objc_opt_class();
    float v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2048;
    v37 = self;
    _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating result", buf, 0x16u);
  }
  float v25 = [ARCoreRESkeletonResult alloc];
  uint64_t v26 = [v10 jointModelTransforms];
  uint64_t v27 = [v10 jointTransformCount];
  LODWORD(v28) = 981668463;
  v29 = [v4 createResultScaledByFactor:v28];
  __int16 v30 = [v10 identifier];
  double v31 = [(ARCoreRESkeletonResult *)v25 initWithModelJointTransforms:v26 localJointTransformsSRT:v12 numberOfTransforms:v27 liftedSkeletonData:v29 identifier:v30];

  return v31;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (ARCoreRESkeletonResults)latestResults
{
  return self->_latestResults;
}

- (void)setLatestResults:(id)a3
{
}

- (OS_dispatch_semaphore)resultSemaphore
{
  return self->_resultSemaphore;
}

- (void)setResultSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultSemaphore, 0);
  objc_storeStrong((id *)&self->_latestResults, 0);
  objc_storeStrong((id *)&self->_abpkRetargeting, 0);
}

@end