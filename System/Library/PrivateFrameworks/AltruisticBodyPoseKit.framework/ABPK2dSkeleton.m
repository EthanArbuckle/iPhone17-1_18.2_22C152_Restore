@interface ABPK2dSkeleton
- (ABPK2dSkeleton)init;
- (ABPK2dSkeleton)initWithType:(int64_t)a3;
- (ABPKSkeletonDefinition)skeletonDefinition;
- (BOOL)hasMissingJoints;
- (CGRect)boundingBox;
- (CGSize)imageRes;
- (const)confidences;
- (const)visibility;
- (id).cxx_construct;
- (id)description;
- (id)toDictionary;
- (int)overlaySkeletonOnImage:(__CVBuffer *)a3 withResult:(__CVBuffer *)a4 withColor:;
- (int64_t)imageType;
- (int64_t)skeletonType;
- (uint64_t)keypoints2d;
- (uint64_t)normalizedKeypoints2d;
- (void)computeBoundingBox;
- (void)printData;
- (void)setHasMissingJoints:(BOOL)a3;
- (void)setJointConfidences:(const float *)a3;
- (void)setJointVisibility:(const unsigned int *)a3;
- (void)setKeypoints2d:(ABPK2dSkeleton *)self withImageRes:(SEL)a2;
- (void)setNormalizedKeypoints2d:(ABPK2dSkeleton *)self withImageRes:(SEL)a2;
@end

@implementation ABPK2dSkeleton

- (ABPK2dSkeleton)init
{
  v27.receiver = self;
  v27.super_class = (Class)ABPK2dSkeleton;
  v2 = [(ABPK2dSkeleton *)&v27 init];
  if (v2)
  {
    v3 = [[ABPKSkeletonDefinition alloc] initWithType:0];
    v4 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v3;

    v5 = [v2 skeletonDefinition];
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v26, [v5 jointCount]);
    v7 = v2 + 8;
    v6 = (void *)*((void *)v2 + 1);
    if (v6)
    {
      *((void *)v2 + 2) = v6;
      operator delete(v6);
      void *v7 = 0;
      *((void *)v2 + 2) = 0;
      *((void *)v2 + 3) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 8) = v26;
    memset(&v26, 0, sizeof(v26));

    v8 = [v2 skeletonDefinition];
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v26, [v8 jointCount]);
    v10 = v2 + 32;
    v9 = (void *)*((void *)v2 + 4);
    if (v9)
    {
      *((void *)v2 + 5) = v9;
      operator delete(v9);
      void *v10 = 0;
      *((void *)v2 + 5) = 0;
      *((void *)v2 + 6) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 32) = v26;
    memset(&v26, 0, sizeof(v26));

    unint64_t v11 = 0;
    __asm { FMOV            V8.2S, #-1.0 }
    while (1)
    {
      v17 = [v2 skeletonDefinition];
      unint64_t v18 = [v17 jointCount];

      if (v18 <= v11) {
        break;
      }
      *(void *)(*v7 + 8 * v11) = _D8;
      *(void *)(*v10 + 8 * v11++) = _D8;
    }
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 136) = _Q0;
    *((void *)v2 + 16) = 0;
    v20 = [v2 skeletonDefinition];
    std::vector<float>::vector(&v26, [v20 jointCount]);
    v21 = (void *)*((void *)v2 + 7);
    if (v21)
    {
      *((void *)v2 + 8) = v21;
      operator delete(v21);
      *((void *)v2 + 7) = 0;
      *((void *)v2 + 8) = 0;
      *((void *)v2 + 9) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 56) = v26;
    memset(&v26, 0, sizeof(v26));

    v22 = [v2 skeletonDefinition];
    std::vector<unsigned int>::vector(&v26, [v22 jointCount]);
    v23 = (void *)*((void *)v2 + 10);
    if (v23)
    {
      *((void *)v2 + 11) = v23;
      operator delete(v23);
      *((void *)v2 + 10) = 0;
      *((void *)v2 + 11) = 0;
      *((void *)v2 + 12) = 0;
    }
    *(std::vector<unsigned int> *)(v2 + 80) = v26;
    memset(&v26, 0, sizeof(v26));

    v2[104] = 0;
    v24 = v2;
  }

  return (ABPK2dSkeleton *)v2;
}

- (ABPK2dSkeleton)initWithType:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ABPK2dSkeleton;
  v4 = [(ABPK2dSkeleton *)&v19 init];
  v5 = v4;
  if (v4
    && (v4->_skeletonType = a3,
        v6 = [[ABPKSkeletonDefinition alloc] initWithType:a3], skeletonDefinition = v5->_skeletonDefinition, v5->_skeletonDefinition = v6, skeletonDefinition, v5->_skeletonDefinition))
  {
    v8 = [(ABPK2dSkeleton *)v5 skeletonDefinition];
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v18, [v8 jointCount]);
    var0 = v5->_keypoints2d.var0;
    if (var0)
    {
      *(void *)v5->_anon_10 = var0;
      operator delete(var0);
      v5->_keypoints2d.var0 = 0;
      *(void *)v5->_anon_10 = 0;
      *(void *)&v5->_anon_10[8] = 0;
    }
    *(std::vector<unsigned int> *)&v5->_keypoints2d.var0 = v18;
    memset(&v18, 0, sizeof(v18));

    v10 = [(ABPK2dSkeleton *)v5 skeletonDefinition];
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v18, [v10 jointCount]);
    unint64_t v11 = v5->_normalizedKeypoints2d.var0;
    if (v11)
    {
      *(void *)v5->_anon_28 = v11;
      operator delete(v11);
      v5->_normalizedKeypoints2d.var0 = 0;
      *(void *)v5->_anon_28 = 0;
      *(void *)&v5->_anon_28[8] = 0;
    }
    *(std::vector<unsigned int> *)&v5->_normalizedKeypoints2d.var0 = v18;
    memset(&v18, 0, sizeof(v18));

    v12 = [(ABPK2dSkeleton *)v5 skeletonDefinition];
    std::vector<float>::vector(&v18, [v12 jointCount]);
    begin = v5->_confidences.__begin_;
    if (begin)
    {
      v5->_confidences.__end_ = begin;
      operator delete(begin);
      v5->_confidences.__begin_ = 0;
      v5->_confidences.__end_ = 0;
      v5->_confidences.__end_cap_.__value_ = 0;
    }
    v5->_confidences = (vector<float, std::allocator<float>>)v18;
    memset(&v18, 0, sizeof(v18));

    v14 = [(ABPK2dSkeleton *)v5 skeletonDefinition];
    std::vector<unsigned int>::vector(&v18, [v14 jointCount]);
    v15 = v5->_visibility.__begin_;
    if (v15)
    {
      v5->_visibility.__end_ = v15;
      operator delete(v15);
      v5->_visibility.__begin_ = 0;
      v5->_visibility.__end_ = 0;
      v5->_visibility.__end_cap_.__value_ = 0;
    }
    v5->_visibility = (vector<unsigned int, std::allocator<unsigned int>>)v18;
    memset(&v18, 0, sizeof(v18));

    v16 = v5;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  v3 = objc_opt_new();
  for (unint64_t i = 0; i < [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount]; ++i)
  {
    v5 = [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointName:i];
    uint64_t v6 = [v3 stringByAppendingFormat:@"%@ : (%f, %f)\n", v5, COERCE_FLOAT(self->_keypoints2d.var0[i]), COERCE_FLOAT((unint64_t)self->_keypoints2d.var0[i] >> 32)];

    v3 = (void *)v6;
  }
  return v3;
}

- (void)setNormalizedKeypoints2d:(ABPK2dSkeleton *)self withImageRes:(SEL)a2
{
  CGFloat v21 = v3;
  CGFloat v22 = v4;
  v5 = v2;
  uint64_t v26 = *MEMORY[0x263EF8340];
  v7 = [(ABPK2dSkeleton *)self skeletonDefinition];
  uint64_t v8 = [v7 jointCount];
  if (v8) {
    memmove(self->_normalizedKeypoints2d.var0, v5, 8 * v8);
  }

  unint64_t v9 = 0;
  int v10 = 0;
  v11.f64[0] = v21;
  v11.f64[1] = v22;
  float64x2_t v23 = v11;
  __asm { FMOV            V9.2S, #-1.0 }
  while (1)
  {
    v16 = [(ABPK2dSkeleton *)self skeletonDefinition];
    unint64_t v17 = [v16 jointCount];

    if (v17 <= v9) {
      break;
    }
    std::vector<unsigned int> v18 = self->_normalizedKeypoints2d.var0[v9];
    if (*(float *)&v18 == -1.0 || COERCE_FLOAT((unint64_t)self->_normalizedKeypoints2d.var0[v9] >> 32) == -1.0)
    {
      self->_keypoints2d.var0[v9] = _D9;
      ++v10;
    }
    else
    {
      self->_keypoints2d.var0[v9] = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)vcvt_f32_f64(vmulq_f64(v23, vcvtq_f64_f32((float32x2_t)v18)));
    }
    ++v9;
  }
  v20 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v25 = v10;
    _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_DEBUG, " missingJointsCount: %d ", buf, 8u);
  }

  self->_imageRes.width = v21;
  self->_imageRes.height = v22;
  [(ABPK2dSkeleton *)self computeBoundingBox];
}

- (void)setKeypoints2d:(ABPK2dSkeleton *)self withImageRes:(SEL)a2
{
  CGFloat v20 = v3;
  CGFloat v21 = v4;
  v5 = v2;
  v7 = [(ABPK2dSkeleton *)self skeletonDefinition];
  uint64_t v8 = [v7 jointCount];
  if (v8) {
    memmove(self->_keypoints2d.var0, v5, 8 * v8);
  }

  unint64_t v9 = 0;
  v10.f64[0] = v20;
  v10.f64[1] = v21;
  float64x2_t v22 = v10;
  __asm { FMOV            V8.2S, #-1.0 }
  while (1)
  {
    v15 = [(ABPK2dSkeleton *)self skeletonDefinition];
    unint64_t v16 = [v15 jointCount];

    if (v16 <= v9) {
      break;
    }
    unint64_t v17 = self->_keypoints2d.var0[v9];
    _ZF = *(float *)&v17 == -1.0 || COERCE_FLOAT((unint64_t)self->_keypoints2d.var0[v9] >> 32) == -1.0;
    objc_super v19 = _D8;
    if (!_ZF) {
      objc_super v19 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)v17), v22));
    }
    self->_normalizedKeypoints2d.var0[v9++] = v19;
  }
  self->_imageRes.width = v20;
  self->_imageRes.height = v21;
  [(ABPK2dSkeleton *)self computeBoundingBox];
}

- (void)computeBoundingBox
{
  unint64_t v3 = 0;
  float v4 = 0.0;
  float v5 = 3.4028e38;
  float v6 = 0.0;
  float v7 = 3.4028e38;
  while (1)
  {
    uint64_t v8 = [(ABPK2dSkeleton *)self skeletonDefinition];
    unint64_t v9 = [v8 jointCount];

    if (v9 <= v3) {
      break;
    }
    var0 = self->_keypoints2d.var0;
    float64x2_t v11 = var0[v3];
    if (*(float *)&v11 != -1.0 && *((float *)&v11 + 1) != -1.0)
    {
      if (*(float *)&v11 > v6) {
        float v13 = *(float *)&v11;
      }
      else {
        float v13 = v6;
      }
      if (*(float *)&v11 < v7) {
        float v7 = *(float *)&v11;
      }
      else {
        float v6 = v13;
      }
      if (*((float *)&v11 + 1) >= v5)
      {
        if (*((float *)&v11 + 1) > v4) {
          LODWORD(v4) = HIDWORD(var0[v3]);
        }
      }
      else
      {
        LODWORD(v5) = HIDWORD(var0[v3]);
      }
    }
    ++v3;
  }
  self->_boundingBox.origin.x = v7;
  self->_boundingBox.origin.y = v5;
  self->_boundingBox.size.width = (float)((float)(v6 - v7) + 1.0);
  self->_boundingBox.size.height = (float)((float)(v4 - v5) + 1.0);
}

- (void)setJointConfidences:(const float *)a3
{
  id v6 = [(ABPK2dSkeleton *)self skeletonDefinition];
  uint64_t v5 = [v6 jointCount];
  if (v5) {
    memmove(self->_confidences.__begin_, a3, 4 * v5);
  }
}

- (void)setJointVisibility:(const unsigned int *)a3
{
  id v6 = [(ABPK2dSkeleton *)self skeletonDefinition];
  uint64_t v5 = [v6 jointCount];
  if (v5) {
    memmove(self->_visibility.__begin_, a3, 4 * v5);
  }
}

- (void)setHasMissingJoints:(BOOL)a3
{
  self->_hasMissingJoints = a3;
}

- (uint64_t)keypoints2d
{
  return *(void *)(a1 + 8);
}

- (uint64_t)normalizedKeypoints2d
{
  return *(void *)(a1 + 32);
}

- (const)confidences
{
  return self->_confidences.__begin_;
}

- (const)visibility
{
  return self->_visibility.__begin_;
}

- (BOOL)hasMissingJoints
{
  return self->_hasMissingJoints;
}

- (void)printData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    CGFloat width = self->_imageRes.width;
    CGFloat height = self->_imageRes.height;
    *(_DWORD *)buf = 134218240;
    double v18 = width;
    __int16 v19 = 2048;
    double v20 = height;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " Image res: %f,%f ", buf, 0x16u);
  }

  if ([(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount])
  {
    unint64_t v6 = 0;
    do
    {
      float v7 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointName:v6];
        *(_DWORD *)buf = 138412290;
        double v18 = *(double *)&v8;
        _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " %@ ", buf, 0xCu);
      }
      unint64_t v9 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        var0 = self->_keypoints2d.var0;
        double v11 = COERCE_FLOAT(var0[v6]);
        double v12 = COERCE_FLOAT((unint64_t)var0[v6] >> 32);
        *(_DWORD *)buf = 134218240;
        double v18 = v11;
        __int16 v19 = 2048;
        double v20 = v12;
        _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " \t Keypoint:    (%f,%f) ", buf, 0x16u);
      }

      float v13 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v14 = self->_visibility.__begin_[v6];
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v14;
        _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " \t Visibility:  %u ", buf, 8u);
      }

      v15 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        double v16 = self->_confidences.__begin_[v6];
        *(_DWORD *)buf = 134217984;
        double v18 = v16;
        _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " \t Confidence:  %f ", buf, 0xCu);
      }

      ++v6;
    }
    while (v6 < [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount]);
  }
}

- (id)toDictionary
{
  v16[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_opt_new();
  unint64_t v4 = 0;
  uint64_t v5 = 4;
  while ([(ABPKSkeletonDefinition *)self->_skeletonDefinition jointCount] > v4)
  {
    unint64_t v6 = objc_opt_new();
    float v7 = [NSNumber numberWithFloat:*(double *)&self->_keypoints2d.var0[v4]];
    v16[0] = v7;
    LODWORD(v8) = *(_DWORD *)((char *)self->_keypoints2d.var0 + v5);
    unint64_t v9 = [NSNumber numberWithFloat:v8];
    v16[1] = v9;
    float64x2_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

    [v6 setObject:v10 forKeyedSubscript:@"positions2d"];
    *(float *)&double v11 = self->_confidences.__begin_[v4];
    double v12 = [NSNumber numberWithFloat:v11];
    [v6 setObject:v12 forKeyedSubscript:@"confidence"];

    float v13 = [NSNumber numberWithUnsignedInt:self->_visibility.__begin_[v4]];
    [v6 setObject:v13 forKeyedSubscript:@"visibility"];

    unsigned int v14 = [(ABPKSkeletonDefinition *)self->_skeletonDefinition jointName:v4];
    [v3 setObject:v6 forKeyedSubscript:v14];

    ++v4;
    v5 += 8;
  }
  return v3;
}

- (int)overlaySkeletonOnImage:(__CVBuffer *)a3 withResult:(__CVBuffer *)a4 withColor:
{
  if (!a4)
  {
    double v10 = v4;
    double v8 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_ERROR, " Overlay image not initialized ", buf, 2u);
    }

    double v4 = v10;
  }
  return overlay2dResultOnImage(self, (uint64_t)a3, (uint64_t)a4, v4);
}

- (int64_t)skeletonType
{
  return self->_skeletonType;
}

- (ABPKSkeletonDefinition)skeletonDefinition
{
  return self->_skeletonDefinition;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)imageRes
{
  double width = self->_imageRes.width;
  double height = self->_imageRes.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletonDefinition, 0);
  begin = self->_visibility.__begin_;
  if (begin)
  {
    self->_visibility.__end_ = begin;
    operator delete(begin);
  }
  double v4 = self->_confidences.__begin_;
  if (v4)
  {
    self->_confidences.__end_ = v4;
    operator delete(v4);
  }
  var0 = self->_normalizedKeypoints2d.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  unint64_t v6 = self->_keypoints2d.var0;
  if (v6)
  {
    *(void *)self->_anon_10 = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end