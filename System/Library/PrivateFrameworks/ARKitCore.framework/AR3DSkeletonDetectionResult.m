@interface AR3DSkeletonDetectionResult
+ (BOOL)supportsSecureCoding;
+ (NSArray)childrenIndices;
+ (NSArray)jointNames;
+ (NSArray)parentIndices;
- (ABPK2DDetectionResult)skeletonDetectionResult2D;
- (AR3DSkeletonDetectionResult)initWithCoder:(id)a3;
- (AR3DSkeletonDetectionResult)initWithJoints:(AR3DSkeletonDetectionResult *)self numberOfJoints:(SEL)a2 referenceDetectionResult:;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJointTracked:(int64_t)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createResultScaledByFactor:(float)a3;
- (uint64_t)joints;
- (uint64_t)jointsLocalSpace;
- (unint64_t)jointCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AR3DSkeletonDetectionResult

- (AR3DSkeletonDetectionResult)initWithJoints:(AR3DSkeletonDetectionResult *)self numberOfJoints:(SEL)a2 referenceDetectionResult:
{
  v5 = v4;
  unint64_t v6 = v3;
  v7 = v2;
  id v9 = v4;
  v15.receiver = self;
  v15.super_class = (Class)AR3DSkeletonDetectionResult;
  v10 = [(AR3DSkeletonDetectionResult *)&v15 init];
  if (v10)
  {
    long long v13 = 0uLL;
    uint64_t v14 = 0;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v13, v7, (uint64_t)v7 + 16 * v6, v6);
    v11 = (void *)*((void *)v10 + 1);
    if (v11)
    {
      *((void *)v10 + 2) = v11;
      operator delete(v11);
      *((void *)v10 + 1) = 0;
      *((void *)v10 + 2) = 0;
      *((void *)v10 + 3) = 0;
    }
    *(_OWORD *)(v10 + 8) = v13;
    *((void *)v10 + 3) = v14;
    objc_storeStrong((id *)v10 + 7, v5);
  }

  return (AR3DSkeletonDetectionResult *)v10;
}

- (uint64_t)joints
{
  return *(void *)(a1 + 8);
}

- (uint64_t)jointsLocalSpace
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t result = a1[4];
  uint64_t v4 = a1[5];
  v5 = (char *)(a1 + 4);
  unint64_t v6 = (char *)*((void *)v5 - 3);
  uint64_t v7 = *((void *)v5 - 2);
  unint64_t v8 = (v7 - (uint64_t)v6) >> 4;
  if (v8 != (v4 - result) >> 4)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v5, v6, v7, v8);
    long long v33 = 0u;
    long long v31 = 0u;
    memset(v32, 0, sizeof(v32));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = +[AR3DSkeletonDetectionResult childrenIndices];
    v10 = [v9 objectAtIndexedSubscript:0];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v27 = [*(id *)(*((void *)&v28 + 1) + 8 * v13) intValue];
          std::deque<std::pair<int,int>>::push_back(v32, &v27);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v11);
    }

    while (*((void *)&v33 + 1))
    {
      uint64_t v14 = (int *)(*(void *)(*((void *)&v32[0] + 1) + (((unint64_t)v33 >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * (v33 & 0x1FF));
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      *(void *)&long long v33 = v33 + 1;
      --*((void *)&v33 + 1);
      if ((unint64_t)v33 >= 0x400)
      {
        operator delete(**((void ***)&v32[0] + 1));
        *((void *)&v32[0] + 1) += 8;
        *(void *)&long long v33 = v33 - 512;
      }
      *(float32x4_t *)(a1[4] + 16 * v16) = vsubq_f32(*(float32x4_t *)(a1[1] + 16 * v16), *(float32x4_t *)(a1[1] + 16 * v15));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v17 = +[AR3DSkeletonDetectionResult childrenIndices];
      v18 = [v17 objectAtIndexedSubscript:v16];

      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v24;
        uint64_t v21 = v16 << 32;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v27 = v21 | [*(id *)(*((void *)&v23 + 1) + 8 * v22) intValue];
            std::deque<std::pair<int,int>>::push_back(v32, &v27);
            ++v22;
          }
          while (v19 != v22);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v34 count:16];
        }
        while (v19);
      }
    }
    std::deque<std::pair<int,int>>::~deque[abi:ne180100](v32);
    return *(void *)v5;
  }
  return result;
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  if (((uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4) - 1 < (unint64_t)a3) {
    return 0;
  }
  unint64_t v4 = ARRigInputJointsDependencies[a3];
  if ((v4 & 0x80000000) != 0
    || [(ABPK2DDetectionResult *)self->_skeletonDetectionResult2D jointCount] - 1 < v4)
  {
    return 0;
  }
  return *(_DWORD *)([(ABPK2DDetectionResult *)self->_skeletonDetectionResult2D jointTrackingStates]+ 4 * v4) == 1;
}

- (id)createResultScaledByFactor:(float)a3
{
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&__p, (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4);
  var0 = self->_jointsVector.var0;
  v5 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
  if (var0 != v5)
  {
    unint64_t v6 = (float32x4_t *)__p;
    do
    {
      float32x4_t v7 = *(float32x4_t *)var0;
      var0 += 2;
      *v6++ = vmulq_n_f32(v7, a3);
    }
    while (var0 != v5);
  }
  unint64_t v8 = [AR3DSkeletonDetectionResult alloc];
  id v9 = __p;
  v10 = v16;
  uint64_t v11 = [(AR3DSkeletonDetectionResult *)self skeletonDetectionResult2D];
  uint64_t v12 = [(AR3DSkeletonDetectionResult *)v8 initWithJoints:v9 numberOfJoints:(v10 - v9) >> 4 referenceDetectionResult:v11];

  if (__p)
  {
    uint64_t v16 = __p;
    operator delete(__p);
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    var0 = self->_jointsVector.var0;
    float32x4_t v7 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
    unint64_t v8 = ((char *)v7 - (char *)var0) >> 4;
    id v9 = (float32x4_t *)v5[1];
    if (v8 == (uint64_t)(v5[2] - (void)v9) >> 4)
    {
      if (v7 == var0)
      {
LABEL_8:
        char v12 = [(ABPK2DDetectionResult *)self->_skeletonDetectionResult2D isEqual:v5[7]];
LABEL_11:

        goto LABEL_12;
      }
      if (v8 <= 1) {
        unint64_t v8 = 1;
      }
      while (1)
      {
        float32x4_t v10 = vsubq_f32(*(float32x4_t *)var0, *v9);
        float32x4_t v11 = vmulq_f32(v10, v10);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]) > 0.00000011921)break; {
        ++v9;
        }
        var0 += 2;
        if (!--v8) {
          goto LABEL_8;
        }
      }
    }
    char v12 = 0;
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if ((AR3DSkeletonDetectionResult *)v4 != self) {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v4 + 8), (char *)self->_jointsVector.var0, *(void *)self->_anon_10, (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4);
  }
  objc_storeStrong(v5 + 7, self->_skeletonDetectionResult2D);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_jointsVector.var0 length:*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0];
  [v5 encodeObject:v4 forKey:@"jointsVector"];
  [v5 encodeObject:self->_skeletonDetectionResult2D forKey:@"skeletonDetectionResult2D"];
}

- (AR3DSkeletonDetectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AR3DSkeletonDetectionResult;
  id v5 = [(AR3DSkeletonDetectionResult *)&v16 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jointsVector"];
    float32x4_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 length];
      id v9 = (const void *)[v7 bytes];
      long long v14 = 0uLL;
      uint64_t v15 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v14, v9, (uint64_t)v9 + 16 * (int)((unint64_t)v8 >> 4), (int)(v8 >> 4));
      float32x4_t v10 = (void *)*((void *)v5 + 1);
      if (v10)
      {
        *((void *)v5 + 2) = v10;
        operator delete(v10);
        *((void *)v5 + 1) = 0;
        *((void *)v5 + 2) = 0;
        *((void *)v5 + 3) = 0;
      }
      *(_OWORD *)(v5 + 8) = v14;
      *((void *)v5 + 3) = v15;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skeletonDetectionResult2D"];
    char v12 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v11;
  }
  return (AR3DSkeletonDetectionResult *)v5;
}

+ (NSArray)childrenIndices
{
  return (NSArray *)&unk_1F125BC00;
}

+ (NSArray)jointNames
{
  v2 = (void *)ARRigInputJoints();
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = 17;
  do
  {
    id v5 = [NSString stringWithUTF8String:*v2];
    [v3 addObject:v5];

    ++v2;
    --v4;
  }
  while (v4);
  return (NSArray *)v3;
}

+ (NSArray)parentIndices
{
  return (NSArray *)&unk_1F125BC18;
}

- (ABPK2DDetectionResult)skeletonDetectionResult2D
{
  return self->_skeletonDetectionResult2D;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletonDetectionResult2D, 0);
  var0 = self->_jointsVectorLocalSpace.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  uint64_t v4 = self->_jointsVector.var0;
  if (v4)
  {
    *(void *)self->_anon_10 = v4;
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