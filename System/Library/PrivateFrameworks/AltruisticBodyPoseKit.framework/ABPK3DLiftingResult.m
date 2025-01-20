@interface ABPK3DLiftingResult
- (ABPK2DDetectionResult)skeletonDetectionResult2D;
- (ABPK3DLiftingResult)init;
- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2;
- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2 rawNetworkOutputs:referenceDetectionResult:;
- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2 referenceDetectionResult:;
- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self rawNetworkOutputs:(SEL)a2 referenceDetectionResult:(vector<float)__attribute__((ext_vector_type(3;
- (BOOL)isJointTracked:(int64_t)a3;
- (float)estimatedScale;
- (id).cxx_construct;
- (id)createResultScaledByFactor:(float)a3;
- (uint64_t)joints;
- (uint64_t)rawNetworkOutputJoints;
- (unint64_t)jointCount;
- (void)init;
- (void)setEstimatedScale:(float)a3;
@end

@implementation ABPK3DLiftingResult

- (ABPK3DLiftingResult)init
{
  v7 = 0;
  v8 = 0;
  uint64_t v9 = 0;
  v5 = 0;
  uint64_t v6 = 0;
  __p = 0;
  v2 = [(ABPK3DLiftingResult *)self initWithJoints:&v7 rawNetworkOutputs:&__p referenceDetectionResult:0];
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
  if (v7)
  {
    v8 = v7;
    operator delete(v7);
  }

  return v2;
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self rawNetworkOutputs:(SEL)a2 referenceDetectionResult:(vector<float)__attribute__((ext_vector_type(3
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ABPK3DLiftingResult;
  v10 = [(ABPK3DLiftingResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    std::vector<float>::__move_assign((uint64_t)&v10->_jointsVector, (__n128 *)a3.var0);
    objc_storeStrong((id *)&v11->_skeletonDetectionResult2D, a5);
    std::vector<float>::__move_assign((uint64_t)&v11->_rawNetworkOutputJointsVector, (__n128 *)a4.var0);
  }

  return v11;
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2 referenceDetectionResult:
{
  return -[ABPK3DLiftingResult initWithJoints:numberOfJoints:rawNetworkOutputs:referenceDetectionResult:](self, "initWithJoints:numberOfJoints:rawNetworkOutputs:referenceDetectionResult:");
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2 rawNetworkOutputs:referenceDetectionResult:
{
  uint64_t v6 = v4;
  unint64_t v7 = v3;
  v8 = v2;
  id v10 = v5;
  v17 = 0;
  uint64_t v18 = 0;
  v16 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v16, v8, (uint64_t)v8 + 16 * v7, v7);
  __p = 0;
  v14 = 0;
  uint64_t v15 = 0;
  if (v6) {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&__p, v6, (uint64_t)v6 + 16 * v7, v7);
  }
  v11 = [(ABPK3DLiftingResult *)self initWithJoints:&v16 rawNetworkOutputs:&__p referenceDetectionResult:v10];
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  if (v16)
  {
    v17 = v16;
    operator delete(v16);
  }

  return v11;
}

- (ABPK3DLiftingResult)initWithJoints:(ABPK3DLiftingResult *)self numberOfJoints:(SEL)a2
{
  return -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:](self, "initWithJoints:numberOfJoints:referenceDetectionResult:");
}

- (uint64_t)joints
{
  return *(void *)(a1 + 8);
}

- (uint64_t)rawNetworkOutputJoints
{
  return *(void *)(a1 + 32);
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4;
}

- (id)createResultScaledByFactor:(float)a3
{
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&__p, (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4);
  var0 = self->_jointsVector.var0;
  v5 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
  if (var0 != v5)
  {
    uint64_t v6 = (float32x4_t *)__p;
    do
    {
      float32x4_t v7 = *(float32x4_t *)var0;
      var0 += 2;
      *v6++ = vmulq_n_f32(v7, a3);
    }
    while (var0 != v5);
  }
  v8 = [ABPK3DLiftingResult alloc];
  id v9 = __p;
  id v10 = v16;
  v11 = [(ABPK3DLiftingResult *)self skeletonDetectionResult2D];
  v12 = [(ABPK3DLiftingResult *)v8 initWithJoints:v9 numberOfJoints:(v10 - v9) >> 4 referenceDetectionResult:v11];

  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
  return v12;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  if (((uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_jointsVector.var0) >> 4) - 1 >= (unint64_t)a3)
  {
    unint64_t v4 = ARRigInputJointsDependencies[a3];
    if ([(ABPK2DDetectionResult *)self->_skeletonDetectionResult2D jointCount] - 1 >= v4) {
      return [(ABPK2DDetectionResult *)self->_skeletonDetectionResult2D jointTrackingStates][4 * v4] == 1;
    }
  }
  return 0;
}

- (ABPK2DDetectionResult)skeletonDetectionResult2D
{
  return self->_skeletonDetectionResult2D;
}

- (float)estimatedScale
{
  return self->_estimatedScale;
}

- (void)setEstimatedScale:(float)a3
{
  self->_estimatedScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletonDetectionResult2D, 0);
  var0 = self->_rawNetworkOutputJointsVector.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  unint64_t v4 = self->_jointsVector.var0;
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

- (void)init
{
  v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

@end