@interface ABPKSkeleton
- (ABPKSkeleton)init;
- (ABPKSkeleton)initWithType:(int64_t)a3;
- (ABPKSkeletonDefinition)skeletonDefinition;
- (__n128)cameraRootTransform;
- (__n128)deviceRootTransform;
- (__n128)renderingCameraRootTransform;
- (__n128)setCameraRootTransform:(__n128)a3;
- (__n128)setDeviceRootTransform:(__n128)a3;
- (__n128)setRenderingCameraRootTransform:(__n128)a3;
- (const)localPoses;
- (const)modelPoses;
- (float)computeHeight;
- (float)estimatedScale;
- (id).cxx_construct;
- (id)description;
- (id)toDictionary;
- (int64_t)skeletonType;
- (void)getGlobalJointDataForSkeletonWithPosition:(ABPKSkeleton *)self withOrientation:(SEL)a2;
- (void)getLocalJointDataForSkeletonWithPosition:(ABPKSkeleton *)self withOrientation:(SEL)a2;
- (void)scaleTransform:(id *)a3 withScale:(float)a4;
- (void)setEstimatedScale:(float)a3;
- (void)setLocalPoses:(const ABPKTransform *)a3 andUpdateModelPoses:(BOOL)a4;
- (void)setModelPoses:(id *)a3 andUpdateLocalPoses:(BOOL)a4;
- (void)setModelPosesFromDict:(id)a3 andUpdateLocalPoses:(BOOL)a4;
- (void)transformModelPoses:(int)a3 andUpdateLocalPoses:(float32x4_t)a4;
- (void)updateJointPosesAndRootTransformUsingDepthEstimatedScale;
- (void)updateLocalPosesFromModelPoses;
- (void)updateModelPosesFromLocalPoses;
@end

@implementation ABPKSkeleton

- (const)localPoses
{
  return self->_localPoses.__begin_;
}

- (const)modelPoses
{
  return self->_modelPoses.__begin_;
}

- (ABPKSkeleton)initWithType:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ABPKSkeleton;
  v4 = [(ABPKSkeleton *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_skeletonType = a3;
    switch(a3)
    {
      case 0:
        v6 = [[ABPKSkeletonDefinition alloc] initWithType:0];
        break;
      case 2:
        v6 = [[ABPKSkeletonDefinition alloc] initWithType:2];
        break;
      case 3:
        v6 = [[ABPKSkeletonDefinition alloc] initWithType:3];
        break;
      case 4:
        v6 = [[ABPKSkeletonDefinition alloc] initWithType:4];
        break;
      default:
        v13 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEFAULT, " ERROR: Unsupported ABPKSkeletonType in ABPKSkeleton:initWithType ", (uint8_t *)&v15, 2u);
        }

        goto LABEL_15;
    }
    skeletonDefinition = v5->_skeletonDefinition;
    v5->_skeletonDefinition = v6;

    v8 = [(ABPKSkeleton *)v5 skeletonDefinition];
    std::vector<ABPKTransform>::vector(&v15, [v8 jointCount]);
    begin = v5->_localPoses.__begin_;
    if (begin)
    {
      v5->_localPoses.__end_ = begin;
      operator delete(begin);
      v5->_localPoses.__begin_ = 0;
      v5->_localPoses.__end_ = 0;
      v5->_localPoses.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v5->_localPoses.__begin_ = v15;
    v5->_localPoses.__end_cap_.__value_ = v16;
    long long v15 = 0uLL;
    v16 = 0;

    v10 = [(ABPKSkeleton *)v5 skeletonDefinition];
    std::vector<simd_float4x4>::vector(&v15, [v10 jointCount]);
    v11 = v5->_modelPoses.__begin_;
    if (v11)
    {
      v5->_modelPoses.__end_ = v11;
      operator delete(v11);
      v5->_modelPoses.__begin_ = 0;
      v5->_modelPoses.__end_ = 0;
      v5->_modelPoses.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v5->_modelPoses.__begin_ = v15;
    v5->_modelPoses.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v16;
    v16 = 0;
    long long v15 = 0uLL;

    v12 = v5;
  }
  else
  {
LABEL_15:
    v12 = 0;
  }

  return v12;
}

- (ABPKSkeleton)init
{
  return [(ABPKSkeleton *)self initWithType:3];
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v4 = 0;
  for (unint64_t i = 0; i < [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount]; ++i)
  {
    v6 = [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointName:i];
    uint64_t v7 = [v3 stringByAppendingFormat:@"%@ : (%f, %f, %f)\n", v6, *(float *)((char *)self->_modelPoses.__begin_ + v4 + 48), *(float *)((char *)self->_modelPoses.__begin_ + v4 + 52), *(float *)((char *)self->_modelPoses.__begin_ + v4 + 56)];

    v4 += 64;
    v3 = (void *)v7;
  }
  return v3;
}

- (void)getLocalJointDataForSkeletonWithPosition:(ABPKSkeleton *)self withOrientation:(SEL)a2
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  if ([(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount])
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      *(_OWORD *)(v5 + 16 * v8) = *(_OWORD *)((char *)self->_localPoses.__begin_ + v7 + 16);
      *(_OWORD *)(v4 + 16 * v8++) = *(_OWORD *)((char *)self->_localPoses.__begin_ + v7);
      v7 += 32;
    }
    while ([(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount] > v8);
  }
}

- (void)getGlobalJointDataForSkeletonWithPosition:(ABPKSkeleton *)self withOrientation:(SEL)a2
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  if ([(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount])
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      simd_float4x4 v10 = *(simd_float4x4 *)((char *)self->_modelPoses.__begin_ + v7);
      *(simd_float4 *)(v5 + 16 * v8) = v10.columns[3];
      *(double *)&long long v9 = simd_quaternion(v10);
      *(_OWORD *)(v4 + 16 * v8++) = v9;
      v7 += 64;
    }
    while ([(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount] > v8);
  }
}

- (void)setModelPoses:(id *)a3 andUpdateLocalPoses:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(ABPKSkeleton *)self skeletonDefinition];
  uint64_t v8 = [v7 jointCount];
  if (v8) {
    memmove(self->_modelPoses.__begin_, a3, v8 << 6);
  }

  if (v4)
  {
    [(ABPKSkeleton *)self updateLocalPosesFromModelPoses];
  }
}

- (void)setModelPosesFromDict:(id)a3 andUpdateLocalPoses:(BOOL)a4
{
  BOOL v4 = a4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__ABPKSkeleton_setModelPosesFromDict_andUpdateLocalPoses___block_invoke;
  v6[3] = &unk_2643B6E08;
  v6[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  if (v4) {
    [(ABPKSkeleton *)self updateLocalPosesFromModelPoses];
  }
}

void __58__ABPKSkeleton_setModelPosesFromDict_andUpdateLocalPoses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  long long v22 = *MEMORY[0x263EF89A8];
  long long v23 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  long long v20 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  long long v24 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  v6 = [v5 objectForKey:@"translation"];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  [v7 floatValue];
  unsigned int v19 = v8;

  long long v9 = [v6 objectAtIndexedSubscript:1];
  [v9 floatValue];
  unsigned int v18 = v10;

  v11 = [v6 objectAtIndexedSubscript:2];
  [v11 floatValue];
  unsigned int v17 = v12;

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = [*(id *)(v13 + 72) indexOfJointWithName:v21];
  *(void *)&long long v15 = __PAIR64__(v18, v19);
  *((void *)&v15 + 1) = __PAIR64__(HIDWORD(v20), v17);
  v16 = (_OWORD *)(*(void *)(v13 + 32) + (v14 << 6));
  _OWORD *v16 = v22;
  v16[1] = v23;
  v16[2] = v24;
  v16[3] = v15;
}

- (void)setLocalPoses:(const ABPKTransform *)a3 andUpdateModelPoses:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(ABPKSkeleton *)self skeletonDefinition];
  uint64_t v8 = [v7 jointCount];
  if (v8) {
    memmove(self->_localPoses.__begin_, a3, 32 * v8);
  }

  if (v4)
  {
    [(ABPKSkeleton *)self updateModelPosesFromLocalPoses];
  }
}

- (void)updateLocalPosesFromModelPoses
{
  for (unint64_t i = 0; ; ++i)
  {
    BOOL v4 = [(ABPKSkeleton *)self skeletonDefinition];
    unint64_t v5 = [v4 jointCount];

    if (i >= v5) {
      break;
    }
    v6 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v7 = [v6 parentJoint:i];

    begin = self->_modelPoses.__begin_;
    long long v9 = (simd_float4 *)((char *)begin + 64 * i);
    if (v7 == -1)
    {
      *(double *)&long long v16 = simd_quaternion(*(simd_float4x4 *)v9->f32);
      *((_OWORD *)self->_localPoses.__begin_ + 2 * i) = v16;
      simd_float4 v15 = v9[3];
    }
    else
    {
      simd_float4x4 v23 = __invert_f4(*((simd_float4x4 *)begin + v7));
      unint64_t v10 = 0;
      simd_float4 v11 = v9[1];
      simd_float4 v12 = v9[2];
      simd_float4 v13 = v9[3];
      simd_float4 v18 = *v9;
      long long v19 = (__int128)v11;
      long long v20 = (__int128)v12;
      long long v21 = (__int128)v13;
      do
      {
        v22.columns[v10 / 4] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v23.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v18 + v10 * 4))), (float32x4_t)v23.columns[1], *(float32x2_t *)&v18.f32[v10], 1), (float32x4_t)v23.columns[2], *(float32x4_t *)((char *)&v18 + v10 * 4), 2), (float32x4_t)v23.columns[3], *(float32x4_t *)((char *)&v18 + v10 * 4), 3);
        v10 += 4;
      }
      while (v10 != 16);
      simd_float4 v17 = v22.columns[3];
      *(double *)&long long v14 = simd_quaternion(v22);
      simd_float4 v15 = v17;
      *((_OWORD *)self->_localPoses.__begin_ + 2 * i) = v14;
    }
    *((simd_float4 *)self->_localPoses.__begin_ + 2 * i + 1) = v15;
  }
}

- (void)updateModelPosesFromLocalPoses
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v3 = [(ABPKSkeleton *)self skeletonDefinition];
  BOOL v4 = [v3 parentChildOrder];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = [*(id *)(*((void *)&v31 + 1) + 8 * v7) intValue];
        long long v9 = [(ABPKSkeleton *)self skeletonDefinition];
        uint64_t v10 = [v9 parentJoint:v8];

        begin = self->_localPoses.__begin_;
        *(double *)&long long v12 = simd_matrix4x4(*((float32x4_t *)begin + 2 * v8));
        if (v10 == -1)
        {
          v28 = (_OWORD *)((char *)self->_modelPoses.__begin_ + 64 * (uint64_t)v8);
          _OWORD *v28 = v12;
          v28[1] = v13;
          v28[2] = v14;
          v28[3] = v15;
          long long v29 = *((_OWORD *)self->_localPoses.__begin_ + 2 * v8 + 1);
          v30 = (char *)self->_modelPoses.__begin_ + 64 * (uint64_t)v8;
          HIDWORD(v29) = *((_DWORD *)v30 + 15);
          *((_OWORD *)v30 + 3) = v29;
        }
        else
        {
          uint64_t v16 = 0;
          long long v17 = *((_OWORD *)begin + 2 * v8 + 1);
          HIDWORD(v17) = HIDWORD(v15);
          simd_float4 v18 = self->_modelPoses.__begin_;
          long long v19 = (float32x4_t *)((char *)v18 + 64 * v10);
          float32x4_t v20 = *v19;
          float32x4_t v21 = v19[1];
          float32x4_t v22 = v19[2];
          float32x4_t v23 = v19[3];
          v35[0] = v12;
          v35[1] = v13;
          v35[2] = v14;
          v35[3] = v17;
          do
          {
            v36[v16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v20, COERCE_FLOAT(v35[v16])), v21, *(float32x2_t *)&v35[v16], 1), v22, (float32x4_t)v35[v16], 2), v23, (float32x4_t)v35[v16], 3);
            ++v16;
          }
          while (v16 != 4);
          long long v24 = v36[1];
          long long v25 = v36[2];
          long long v26 = v36[3];
          v27 = (_OWORD *)((char *)v18 + 64 * (uint64_t)v8);
          _OWORD *v27 = v36[0];
          v27[1] = v24;
          v27[2] = v25;
          v27[3] = v26;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v5);
  }
}

- (void)scaleTransform:(id *)a3 withScale:(float)a4
{
  float32x4_t v4 = vmulq_n_f32(*((float32x4_t *)a3 + 3), a4);
  v4.i32[3] = 1.0;
  *((float32x4_t *)a3 + 3) = v4;
}

- (void)updateJointPosesAndRootTransformUsingDepthEstimatedScale
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_estimatedScale == -1.0)
  {
    uint64_t v2 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v2, OS_LOG_TYPE_DEFAULT, " Estimated scale not valid, no need to scale poses. ", buf, 2u);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    float32x4_t v4 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v5 = [v4 parentChildOrder];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = [*(id *)(*((void *)&v16 + 1) + 8 * v8) intValue];
          uint64_t v10 = (float32x4_t *)((char *)self->_modelPoses.__begin_ + 64 * (uint64_t)v9);
          float32x4_t v11 = vmulq_n_f32(v10[3], self->_estimatedScale);
          v11.i32[3] = 1.0;
          v10[3] = v11;
          long long v12 = (float32x4_t *)((char *)self->_localPoses.__begin_ + 32 * v9);
          v12[1] = vmulq_n_f32(v12[1], self->_estimatedScale);
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v6);
    }

    float estimatedScale = self->_estimatedScale;
    float32x4_t v14 = vmulq_n_f32(*(float32x4_t *)&self->_anon_50[48], estimatedScale);
    v14.i32[3] = 1.0;
    *(float32x4_t *)&self->_anon_50[48] = v14;
    float32x4_t v15 = vmulq_n_f32(*(float32x4_t *)&self->_anon_90[48], estimatedScale);
    v15.i32[3] = 1.0;
    *(float32x4_t *)&self->_anon_90[48] = v15;
  }
}

- (void)transformModelPoses:(int)a3 andUpdateLocalPoses:(float32x4_t)a4
{
  uint64_t v7 = (_OWORD *)*((void *)a1 + 4);
  for (unint64_t i = (_OWORD *)*((void *)a1 + 5); v7 != i; v7 += 4)
  {
    uint64_t v9 = 0;
    long long v10 = v7[1];
    long long v11 = v7[2];
    long long v12 = v7[3];
    v16[0] = *v7;
    v16[1] = v10;
    v16[2] = v11;
    v16[3] = v12;
    do
    {
      v17[v9] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a4, COERCE_FLOAT(v16[v9])), a5, *(float32x2_t *)&v16[v9], 1), a6, (float32x4_t)v16[v9], 2), a7, (float32x4_t)v16[v9], 3);
      ++v9;
    }
    while (v9 != 4);
    long long v13 = v17[1];
    long long v14 = v17[2];
    long long v15 = v17[3];
    *uint64_t v7 = v17[0];
    v7[1] = v13;
    v7[2] = v14;
    v7[3] = v15;
  }
  if (a3) {
    return (void *)[a1 updateLocalPosesFromModelPoses];
  }
  return a1;
}

- (id)toDictionary
{
  v40[3] = *MEMORY[0x263EF8340];
  id v31 = (id)objc_opt_new();
  long long v32 = objc_opt_new();
  uint64_t v2 = 0;
  for (unint64_t i = 0; [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount] > i; ++i)
  {
    float32x4_t v4 = objc_opt_new();
    uint64_t v5 = (simd_float4 *)((char *)self->_modelPoses.__begin_ + v2);
    simd_float4 v34 = v5[1];
    simd_float4 v35 = *v5;
    simd_float4 v33 = v5[2];
    simd_float4 v37 = v5[3];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithFloat:");
    v40[0] = v6;
    HIDWORD(v7) = v37.i32[1];
    LODWORD(v7) = v37.i32[1];
    uint64_t v8 = [NSNumber numberWithFloat:v7];
    v40[1] = v8;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(v37.u32[1], v37.u32[2])));
    v40[2] = v9;
    long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];

    [v4 setObject:v10 forKeyedSubscript:@"translation"];
    v42.columns[1] = v34;
    v42.columns[0] = v35;
    v42.columns[2] = v33;
    v42.columns[3] = v37;
    *(double *)v11.i64 = simd_quaternion(v42);
    simd_float4 v38 = v11;
    long long v12 = objc_msgSend(NSNumber, "numberWithFloat:");
    v39[0] = v12;
    HIDWORD(v13) = v38.i32[1];
    LODWORD(v13) = v38.i32[1];
    long long v14 = [NSNumber numberWithFloat:v13];
    v39[1] = v14;
    long long v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(v38.u32[1], v38.u32[3])));
    v39[2] = v15;
    long long v16 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(v38.u32[1], v38.u32[2])));
    v39[3] = v16;
    long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];

    [v4 setObject:v17 forKeyedSubscript:@"orientation"];
    long long v18 = [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointName:i];
    [v32 setObject:v4 forKeyedSubscript:v18];

    v2 += 64;
  }
  long long v19 = objc_opt_new();
  [(ABPKSkeleton *)self cameraRootTransform];
  long long v24 = simdMatrix4x4ToNSMat(v20, v21, v22, v23);
  [v19 setObject:v24 forKeyedSubscript:@"camera_root_transform"];

  [(ABPKSkeleton *)self deviceRootTransform];
  long long v29 = simdMatrix4x4ToNSMat(v25, v26, v27, v28);
  [v19 setObject:v29 forKeyedSubscript:@"device_root_transform"];

  [v31 setObject:v32 forKeyedSubscript:@"pose"];
  [v31 setObject:v19 forKeyedSubscript:@"root_transforms"];

  return v31;
}

- (float)computeHeight
{
  if ([(ABPKSkeleton *)self skeletonType] == 3)
  {
    float estimatedScale = self->_estimatedScale;
    if (estimatedScale == -1.0) {
      return 1.8;
    }
    else {
      return estimatedScale * 1.8;
    }
  }
  else
  {
    if ([(ABPKSkeleton *)self skeletonType] != 4)
    {
      uint64_t v5 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Invalid skeleton type specified. Returning height = 0 ", buf, 2u);
      }
    }
    uint64_t v6 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v7 = [v6 indexOfJointWithName:@"leftfoot"];

    uint64_t v8 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v9 = [v8 indexOfJointWithName:@"leftleg"];

    long long v10 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v11 = [v10 indexOfJointWithName:@"leftupleg"];

    long long v12 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v13 = [v12 indexOfJointWithName:@"hips"];

    long long v14 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v15 = [v14 indexOfJointWithName:@"spine7"];

    long long v16 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v17 = [v16 indexOfJointWithName:@"neck1"];

    long long v18 = [(ABPKSkeleton *)self skeletonDefinition];
    uint64_t v19 = [v18 indexOfJointWithName:@"head"];

    float32x4_t v20 = vsubq_f32(*(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v7 << 6) + 48), *(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v9 << 6) + 48));
    float32x4_t v21 = vmulq_f32(v20, v20);
    float v22 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).f32[0]);
    float32x4_t v23 = vsubq_f32(*(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v9 << 6) + 48), *(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v11 << 6) + 48));
    float32x4_t v24 = vmulq_f32(v23, v23);
    float v25 = v22
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
    v26.i32[0] = *(_DWORD *)([(ABPKSkeleton *)self modelPoses] + (v13 << 6) + 52);
    float32x4_t v39 = v26;
    v27.i32[0] = *(_DWORD *)([(ABPKSkeleton *)self modelPoses] + (v11 << 6) + 52);
    float32x4_t v28 = vsubq_f32(v39, v27);
    float32x4_t v29 = vmulq_f32(v28, v28);
    float v30 = v25
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0]);
    float32x4_t v31 = vsubq_f32(*(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v13 << 6) + 48), *(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v15 << 6) + 48));
    float32x4_t v32 = vmulq_f32(v31, v31);
    float v33 = v30
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0]);
    float32x4_t v34 = vsubq_f32(*(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v15 << 6) + 48), *(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v17 << 6) + 48));
    float32x4_t v35 = vmulq_f32(v34, v34);
    float v36 = v33
        + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0]);
    float32x4_t v37 = vsubq_f32(*(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v17 << 6) + 48), *(float32x4_t *)([(ABPKSkeleton *)self modelPoses] + (v19 << 6) + 48));
    float32x4_t v38 = vmulq_f32(v37, v37);
    return v36
         + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
  }
}

- (int64_t)skeletonType
{
  return self->_skeletonType;
}

- (ABPKSkeletonDefinition)skeletonDefinition
{
  return self->_skeletonDefinition;
}

- (float)estimatedScale
{
  return self->_estimatedScale;
}

- (void)setEstimatedScale:(float)a3
{
  self->_float estimatedScale = a3;
}

- (__n128)cameraRootTransform
{
  return a1[5];
}

- (__n128)setCameraRootTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)renderingCameraRootTransform
{
  return a1[9];
}

- (__n128)setRenderingCameraRootTransform:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (__n128)deviceRootTransform
{
  return a1[13];
}

- (__n128)setDeviceRootTransform:(__n128)a3
{
  result[13] = a2;
  result[14] = a3;
  result[15] = a4;
  result[16] = a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletonDefinition, 0);
  begin = self->_modelPoses.__begin_;
  if (begin)
  {
    self->_modelPoses.__end_ = begin;
    operator delete(begin);
  }
  float32x4_t v4 = self->_localPoses.__begin_;
  if (v4)
  {
    self->_localPoses.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end