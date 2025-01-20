@interface ABPKRetargeting
- (ABPKRetargeting)init;
- (id)_retargetSkeleton:(id)a3;
- (id)processData:(id)a3;
- (void)dealloc;
@end

@implementation ABPKRetargeting

- (ABPKRetargeting)init
{
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPKRetargeting: Initializing ", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)ABPKRetargeting;
  v4 = [(ABPKRetargeting *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    skeletonIdentifier = v4->_skeletonIdentifier;
    v4->_skeletonIdentifier = (NSUUID *)v5;

    v4->_coreIKSolver = (CoreIKSolver *)CoreIKCreateAltruisticSolverInstance();
  }
  return v4;
}

- (void)dealloc
{
  MEMORY[0x21D494AF0](self->_coreIKSolver, a2);
  v3.receiver = self;
  v3.super_class = (Class)ABPKRetargeting;
  [(ABPKRetargeting *)&v3 dealloc];
}

- (id)processData:(id)a3
{
  objc_super v3 = [(ABPKRetargeting *)self _retargetSkeleton:a3];
  return v3;
}

- (id)_retargetSkeleton:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " ABPKRetargeting: Retargeting skeleton ", buf, 2u);
  }

  uint64_t SourceBufferSize = CoreIKSolverGetSourceBufferSize();
  uint64_t TargetBufferSize = CoreIKSolverGetTargetBufferSize();
  ((void (*)(void))MEMORY[0x270FA5388])();
  if (SourceBufferSize)
  {
    uint64_t v8 = 0;
    v9 = (long long *)&v56[-4 * SourceBufferSize + 2];
    __asm { FMOV            V0.4S, #10.0 }
    float32x4_t v60 = _Q0;
    long long v61 = xmmword_21B813530;
    do
    {
      uint64_t v15 = [v4 joints];
      long long v16 = v61;
      *(v9 - 1) = (__int128)vdivq_f32(*(float32x4_t *)(v15 + 16 * v8), v60);
      long long *v9 = v16;
      ++v8;
      v9 += 2;
    }
    while (SourceBufferSize != v8);
  }
  v17 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_DEBUG, " \t Run CoreIK solver ", buf, 2u);
  }

  uint64_t v18 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = CoreIKSolveModelSpaceSource();
  int v20 = v19;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  int v22 = MEMORY[0x270FA5388](v21);
  v24 = (float32x4_t *)&v56[-2 * v23];
  if (v22)
  {
    v25 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v63 = v20;
      _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_ERROR, " Could not solve skeleton: %i ", buf, 8u);
    }
    v26 = 0;
  }
  else
  {
    v27 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_DEBUG, " \t Create result type ", buf, 2u);
    }

    v56[1] = v56;
    if (TargetBufferSize)
    {
      v30 = v24 + 1;
      v31 = (float32x4_t *)&v56[-4 * TargetBufferSize + 2];
      v32 = (float *)&v56[-4 * TargetBufferSize + 3] + 1;
      v33 = &v56[-8 * TargetBufferSize + 4];
      __int32 v34 = 0;
      long long v57 = xmmword_21B813540;
      float32x4_t v58 = (float32x4_t)vdupq_n_s32(0x3C23D70Au);
      uint64_t v35 = TargetBufferSize;
      do
      {
        __int32 v36 = v34;
        int v37 = v28;
        float v38 = *(v32 - 3);
        float v39 = *(v32 - 2);
        float v40 = *(v32 - 1);
        float v41 = *v32;
        *(float *)&long long v42 = (float)((float)((float)(v38 * v38) - (float)(v39 * v39)) - (float)(v40 * v40))
                       + (float)(v41 * v41);
        float v43 = v40 * *v32;
        float v44 = v39 * *v32;
        *((float *)&v42 + 1) = (float)(v43 + (float)(v38 * v39)) + (float)(v43 + (float)(v38 * v39));
        *((float *)&v42 + 2) = (float)-(float)(v44 - (float)(v38 * v40)) - (float)(v44 - (float)(v38 * v40));
        v45.f32[0] = (float)-(float)(v43 - (float)(v38 * v39)) - (float)(v43 - (float)(v38 * v39));
        float v46 = v38 * *v32;
        v45.f32[1] = (float)((float)((float)(v39 * v39) - (float)(v40 * v40)) + (float)(v41 * v41)) - (float)(v38 * v38);
        v45.f32[2] = (float)(v46 + (float)(v39 * v40)) + (float)(v46 + (float)(v39 * v40));
        *(float *)&long long v47 = (float)(v44 + (float)(v40 * v38)) + (float)(v44 + (float)(v40 * v38));
        *((float *)&v47 + 1) = (float)-(float)(v46 - (float)(v39 * v40)) - (float)(v46 - (float)(v39 * v40));
        *((void *)&v47 + 1) = __PAIR64__(v29, (float)((float)((float)(v41 * v41) + (float)(v40 * v40)) - (float)(v38 * v38))- (float)(v39 * v39));
        HIDWORD(v42) = v37;
        v45.i32[3] = v36;
        float32x4_t v60 = v45;
        long long v61 = v42;
        long long v59 = v47;
        simdMatrix4x4FromRotationAndTranslation();
        *(v33 - 2) = v48;
        *(v33 - 1) = v49;
        unsigned int v29 = HIDWORD(v59);
        float32x4_t v50 = vmulq_f32(v31[-1], v58);
        float32x4_t *v30 = *v31;
        v30[1] = v50;
        v30[-1] = (float32x4_t)v57;
        v30 += 3;
        _OWORD *v33 = v51;
        v33[1] = v52;
        v33 += 4;
        v31 += 2;
        v32 += 8;
        --v35;
        __int32 v34 = v60.i32[3];
        int v28 = HIDWORD(v61);
      }
      while (v35);
    }
    v53 = [ABPKResultRetargeting alloc];
    LODWORD(v54) = 981668463;
    v25 = [v4 createResultScaledByFactor:v54];
    v26 = [(ABPKResultRetargeting *)v53 initWithModelJointTransforms:&v56[-8 * TargetBufferSize] localJointTransformsSRT:v24 numberOfTransforms:TargetBufferSize liftedSkeletonData:v25 identifier:self->_skeletonIdentifier];
  }

  return v26;
}

- (void).cxx_destruct
{
}

@end