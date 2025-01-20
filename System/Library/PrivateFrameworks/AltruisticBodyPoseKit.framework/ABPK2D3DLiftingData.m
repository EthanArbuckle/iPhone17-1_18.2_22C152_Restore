@interface ABPK2D3DLiftingData
+ (BOOL)supportsSecureCoding;
- (ABPK2D3DLiftingData)initWithCoder:(id)a3;
- (ABPK2D3DLiftingData)initWithHumanForLifting:(const void *)a3 imageSize:(CGSize)a4 rotation:(int64_t)a5 croppedRect:(CGRect)a6;
- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2;
- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 imageSize:;
- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 liftingData3D:liftingData3DElementCount:;
- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 rotation:croppedRect:liftingData3D:liftingData3DElementCount:;
- (BOOL)isEqual:(id)a3;
- (const)liftingData3D;
- (const)unnormalizedLiftingData3D;
- (id).cxx_construct;
- (uint64_t)joints;
- (uint64_t)rotatedJoints;
- (unint64_t)hash;
- (unint64_t)jointCount;
- (unint64_t)liftingData3DElementCount;
- (void)_rotateAndUndoCroppingFromRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)prepareLiftingInput:(ABPK2D3DLiftingData *)self imageSize:(SEL)a2 pUnnormalizedMultiArray:pMultiArray:;
@end

@implementation ABPK2D3DLiftingData

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 liftingData3D:liftingData3DElementCount:
{
  uint64_t v6 = v5;
  v7 = v4;
  unint64_t v8 = v3;
  v9 = v2;
  v22.receiver = self;
  v22.super_class = (Class)ABPK2D3DLiftingData;
  v10 = [(ABPK2D3DLiftingData *)&v22 init];
  if (v10)
  {
    if (v6 != 32)
    {
      v18 = 0;
      goto LABEL_8;
    }
    long long v20 = 0uLL;
    uint64_t v21 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v20, v9, (uint64_t)v9 + 8 * v8, v8);
    v11 = (void *)*((void *)v10 + 1);
    if (v11)
    {
      *((void *)v10 + 2) = v11;
      operator delete(v11);
      *((void *)v10 + 1) = 0;
      *((void *)v10 + 2) = 0;
      *((void *)v10 + 3) = 0;
    }
    *(_OWORD *)(v10 + 8) = v20;
    *((void *)v10 + 3) = v21;
    long long v12 = *v7;
    long long v13 = v7[1];
    long long v14 = v7[2];
    *(_OWORD *)(v10 + 104) = v7[3];
    *(_OWORD *)(v10 + 88) = v14;
    *(_OWORD *)(v10 + 72) = v13;
    *(_OWORD *)(v10 + 56) = v12;
    long long v15 = v7[4];
    long long v16 = v7[5];
    long long v17 = v7[6];
    *(_OWORD *)(v10 + 168) = v7[7];
    *(_OWORD *)(v10 + 152) = v17;
    *(_OWORD *)(v10 + 136) = v16;
    *(_OWORD *)(v10 + 120) = v15;
  }
  v18 = v10;
LABEL_8:

  return v18;
}

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 rotation:croppedRect:liftingData3D:liftingData3DElementCount:
{
  uint64_t v11 = v6;
  long long v12 = v5;
  uint64_t v13 = v4;
  unint64_t v14 = v3;
  double v15 = v10;
  double v16 = v9;
  double v17 = v8;
  double v18 = v7;
  v19 = v2;
  v36.receiver = self;
  v36.super_class = (Class)ABPK2D3DLiftingData;
  long long v20 = [(ABPK2D3DLiftingData *)&v36 init];
  if (v20)
  {
    if (v11 != 32)
    {
      v32 = 0;
      goto LABEL_22;
    }
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v34, v19, (uint64_t)v19 + 8 * v14, v14);
    uint64_t v21 = (void *)*((void *)v20 + 1);
    if (v21)
    {
      *((void *)v20 + 2) = v21;
      operator delete(v21);
      *((void *)v20 + 1) = 0;
      *((void *)v20 + 2) = 0;
      *((void *)v20 + 3) = 0;
    }
    *(_OWORD *)(v20 + 8) = v34;
    *((void *)v20 + 3) = v35;
    long long v22 = *v12;
    long long v23 = v12[1];
    long long v24 = v12[2];
    *(_OWORD *)(v20 + 104) = v12[3];
    *(_OWORD *)(v20 + 88) = v24;
    *(_OWORD *)(v20 + 72) = v23;
    *(_OWORD *)(v20 + 56) = v22;
    long long v25 = v12[4];
    long long v26 = v12[5];
    long long v27 = v12[6];
    *(_OWORD *)(v20 + 168) = v12[7];
    *(_OWORD *)(v20 + 152) = v27;
    *(_OWORD *)(v20 + 136) = v26;
    *(_OWORD *)(v20 + 120) = v25;
    *((void *)v20 + 39) = v13;
    if (v13 == -90) {
      double v28 = v17;
    }
    else {
      double v28 = v18;
    }
    if (v13 == -90) {
      double v29 = v18;
    }
    else {
      double v29 = v17;
    }
    if (v13 == -90) {
      double v30 = v15;
    }
    else {
      double v30 = v16;
    }
    if (v13 == -90) {
      double v31 = v16;
    }
    else {
      double v31 = v15;
    }
    if (v13 == 90)
    {
      double v28 = v17;
      double v29 = v18;
      double v30 = v15;
      double v31 = v16;
    }
    objc_msgSend(v20, "_rotateAndUndoCroppingFromRect:", v28, v29, v30, v31);
  }
  v32 = v20;
LABEL_22:

  return v32;
}

- (ABPK2D3DLiftingData)initWithHumanForLifting:(const void *)a3 imageSize:(CGSize)a4 rotation:(int64_t)a5 croppedRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a4.height;
  double v12 = a4.width;
  v21.receiver = self;
  v21.super_class = (Class)ABPK2D3DLiftingData;
  unint64_t v14 = [(ABPK2D3DLiftingData *)&v21 init];
  if (v14)
  {
    double v15 = abpk::Human::jointVector((abpk::Human *)a3);
    if (v14 + 8 != (char *)v15) {
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v14 + 8, *(char **)v15, *((void *)v15 + 1), (uint64_t)(*((void *)v15 + 1) - *(void *)v15) >> 3);
    }
    *((void *)v14 + 39) = a5;
    if (a5 == -90) {
      double v16 = y;
    }
    else {
      double v16 = x;
    }
    if (a5 == -90) {
      double v17 = x;
    }
    else {
      double v17 = y;
    }
    if (a5 == -90) {
      double v18 = height;
    }
    else {
      double v18 = width;
    }
    if (a5 == -90) {
      double v19 = width;
    }
    else {
      double v19 = height;
    }
    if (a5 == 90)
    {
      double v16 = y;
      double v17 = x;
      double v18 = height;
      double v19 = width;
    }
    objc_msgSend(v14, "_rotateAndUndoCroppingFromRect:", v16, v17, v18, v19);
    objc_msgSend(v14, "prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:", *((void *)v14 + 1), v14 + 184, v14 + 56, v12, v11);
  }
  return (ABPK2D3DLiftingData *)v14;
}

- (void)_rotateAndUndoCroppingFromRect:(CGRect)a3
{
  var0 = (char *)self->_rawJointsUsedForLifting.var0;
  uint64_t v5 = *(void *)self->_anon_10;
  if ((char *)v5 == var0)
  {
    unint64_t v9 = (v5 - (uint64_t)var0) >> 3;
    var0 = *(char **)self->_anon_10;
  }
  else
  {
    unint64_t v6 = 0;
    CGFloat height = a3.size.height;
    CGFloat y = a3.origin.y;
    do
    {
      *(float32x2_t *)&var0[8 * v6] = vcvt_f32_f64(vmlaq_f64((float64x2_t)a3.origin, (float64x2_t)a3.size, vcvtq_f64_f32(*(float32x2_t *)&var0[8 * v6])));
      ++v6;
      var0 = (char *)self->_rawJointsUsedForLifting.var0;
      uint64_t v5 = *(void *)self->_anon_10;
      unint64_t v9 = (v5 - (uint64_t)var0) >> 3;
    }
    while (v9 > v6);
  }
  int64_t rotationNeeded = self->_rotationNeeded;
  if (rotationNeeded)
  {
    float v11 = (double)rotationNeeded * 3.14159265 / 180.0;
    __float2 v12 = __sincosf_stret(v11);
    p_rotatedJointsUsedForLifting = &self->_rotatedJointsUsedForLifting;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)&self->_rotatedJointsUsedForLifting.var0, v9);
    unint64_t v14 = self->_rawJointsUsedForLifting.var0;
    if (*(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_10 != v14)
    {
      unint64_t v15 = 0;
      float32x2_t v16 = (float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval));
      v17.f32[0] = -v12.__sinval;
      v17.i32[1] = LODWORD(v12.__cosval);
      double v18 = &self->_anon_28[8];
      double v19 = *(float32x2_t **)self->_anon_28;
      float32x2_t v31 = v17;
      do
      {
        float32x2_t v20 = vadd_f32(vmla_n_f32(vmul_n_f32(v16, COERCE_FLOAT(v14[v15]) + -0.5), v17, COERCE_FLOAT((unint64_t)v14[v15] >> 32) + -0.5), (float32x2_t)0x3F0000003F000000);
        if ((unint64_t)v19 >= *(void *)v18)
        {
          uint64_t v21 = ((char *)v19 - (char *)p_rotatedJointsUsedForLifting->var0) >> 3;
          if ((unint64_t)(v21 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v22 = *(void *)v18 - (unint64_t)p_rotatedJointsUsedForLifting->var0;
          uint64_t v23 = v22 >> 2;
          if (v22 >> 2 <= (unint64_t)(v21 + 1)) {
            uint64_t v23 = v21 + 1;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v23;
          }
          if (v24) {
            long long v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&self->_anon_28[8], v24);
          }
          else {
            long long v25 = 0;
          }
          long long v26 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v25[8 * v21];
          *long long v26 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v20;
          double v19 = (float32x2_t *)(v26 + 1);
          double v28 = self->_rotatedJointsUsedForLifting.var0;
          long long v27 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_28;
          if (v27 != v28)
          {
            do
            {
              double v29 = *--v27;
              *--long long v26 = v29;
            }
            while (v27 != v28);
            long long v27 = p_rotatedJointsUsedForLifting->var0;
          }
          self->_rotatedJointsUsedForLifting.var0 = v26;
          *(void *)self->_anon_28 = v19;
          *(void *)&self->_anon_28[8] = &v25[8 * v24];
          if (v27) {
            operator delete(v27);
          }
          float32x2_t v17 = v31;
          float32x2_t v16 = (float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval));
        }
        else
        {
          *v19++ = v20;
        }
        *(void *)self->_anon_28 = v19;
        ++v15;
        unint64_t v14 = self->_rawJointsUsedForLifting.var0;
      }
      while (v15 < (uint64_t)(*(void *)self->_anon_10 - (void)v14) >> 3);
    }
  }
  else
  {
    double v30 = (char *)&self->_rotatedJointsUsedForLifting;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v30, var0, v5, v9);
  }
}

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2
{
  return -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:imageSize:](self, "initWithJoints:numberOfJoints:imageSize:", 1000.0, 1000.0);
}

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 imageSize:
{
  double v6 = v5;
  double v7 = v4;
  unint64_t v8 = v3;
  unint64_t v9 = v2;
  v16.receiver = self;
  v16.super_class = (Class)ABPK2D3DLiftingData;
  double v10 = [(ABPK2D3DLiftingData *)&v16 init];
  if (v10)
  {
    long long v14 = 0uLL;
    uint64_t v15 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v14, v9, (uint64_t)v9 + 8 * v8, v8);
    float v11 = (void *)*((void *)v10 + 1);
    if (v11)
    {
      *((void *)v10 + 2) = v11;
      operator delete(v11);
      *((void *)v10 + 1) = 0;
      *((void *)v10 + 2) = 0;
      *((void *)v10 + 3) = 0;
    }
    uint64_t v12 = v14;
    *(_OWORD *)(v10 + 8) = v14;
    *((void *)v10 + 3) = v15;
    objc_msgSend(v10, "prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:", v12, v10 + 184, v10 + 56, v7, v6);
  }
  return (ABPK2D3DLiftingData *)v10;
}

- (uint64_t)joints
{
  return *(void *)(a1 + 8);
}

- (uint64_t)rotatedJoints
{
  return *(void *)(a1 + 32);
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(void *)self->_anon_28 - (unint64_t)self->_rotatedJointsUsedForLifting.var0) >> 3;
}

- (const)unnormalizedLiftingData3D
{
  return self->_unnormalizedMultiArray.__elems_;
}

- (const)liftingData3D
{
  return self->_multiArray.__elems_;
}

- (unint64_t)liftingData3DElementCount
{
  return 32;
}

- (void)prepareLiftingInput:(ABPK2D3DLiftingData *)self imageSize:(SEL)a2 pUnnormalizedMultiArray:pMultiArray:
{
  uint64_t v7 = v4;
  unint64_t v8 = v3;
  unint64_t v9 = v2;
  for (uint64_t i = 0; i != 14; ++i)
  {
    float32x2_t v11 = v2[i];
    uint64_t v13 = *(int *)((char *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::mapping
                 + i * 8);
    uint64_t v12 = *(int *)((char *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::mapping
                 + i * 8
                 + 4);
    if (v11.f32[0] < 0.0 || v11.f32[1] < 0.0)
    {
      v3->i32[v13] = -1082130432;
      float v14 = -1.0;
    }
    else
    {
      v11.f32[0] = v5 * v11.f32[0];
      v3->i32[v13] = v11.i32[0];
      float v14 = v6 * v11.f32[1];
    }
    v3->f32[v12] = v14;
  }
  float64_t v32 = v5;
  float64_t v33 = v6;
  if (determineDeviceANEVersionPriorOrEqualToH12())
  {
    *unint64_t v8 = vmul_f32(vadd_f32(v8[4], v8[1]), (float32x2_t)0x3F0000003F000000);
    float32x2_t v15 = v8[8];
    float32x2_t v16 = vmul_f32(vadd_f32(v15, v8[7]), (float32x2_t)0x3F0000003F000000);
    v8[8] = v16;
    float v17 = vmlas_n_f32(-v16.f32[0], 2.0, v15.f32[0]);
    float v18 = v16.f32[1] * -0.6 + v15.f32[1] * 1.6;
    v8[9].f32[0] = v17;
  }
  else
  {
    float32x2_t v19 = v9[16];
    if (v19.f32[0] < 0.0 || v19.f32[1] < 0.0)
    {
      __asm { FMOV            V0.2S, #-1.0 }
    }
    else
    {
      v24.f64[0] = v32;
      v24.f64[1] = v33;
      _D0 = vcvt_f32_f64(vmulq_f64(v24, vcvtq_f64_f32(v19)));
    }
    *unint64_t v8 = _D0;
    float v26 = v8[7].f32[0];
    if (v26 >= 0.0
      && (float v27 = v8[7].f32[1], v27 >= 0.0)
      && (float v28 = v8[8].f32[0], v28 >= 0.0)
      && (float v29 = v8[8].f32[1], v29 >= 0.0))
    {
      float v31 = sqrt((float)(v26 - v28) * (float)(v26 - v28) + (float)(v27 - v29) * (float)(v27 - v29));
      v8[9].f32[0] = v28;
      float v18 = v29 + v31 * -0.5;
    }
    else
    {
      float v18 = v8[8].f32[1];
      v8[9].i32[0] = v8[8].i32[0];
    }
  }
  uint64_t v30 = 0;
  v8[9].f32[1] = v18;
  do
  {
    *(float *)(v7 + v30 * 4) = (float)(v8->f32[v30]
                                     - *(float *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::means[v30])
                             / *(float *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::stdDevs[v30];
    ++v30;
  }
  while (v30 != 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ABPK2D3DLiftingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ABPK2D3DLiftingData;
  double v5 = [(ABPK2D3DLiftingData *)&v27 init];
  if (v5)
  {
    *((void *)v5 + 39) = [v4 decodeIntegerForKey:@"rotationNeeded"];
    uint64_t v26 = 0;
    id v6 = v4;
    uint64_t v7 = (const void *)[v6 decodeBytesForKey:@"rawJointsUsedForLifting" returnedLength:&v26];
    unint64_t v8 = (unint64_t)v26 >> 3;
    long long v24 = 0uLL;
    uint64_t v25 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v24, v7, (uint64_t)v7 + 8 * ((unint64_t)v26 >> 3), v26 >> 3);
    unint64_t v9 = (void *)*((void *)v5 + 1);
    if (v9)
    {
      *((void *)v5 + 2) = v9;
      operator delete(v9);
      *((void *)v5 + 1) = 0;
      *((void *)v5 + 2) = 0;
      *((void *)v5 + 3) = 0;
    }
    *(_OWORD *)(v5 + 8) = v24;
    *((void *)v5 + 3) = v25;
    uint64_t v23 = 0;
    id v10 = v6;
    float32x2_t v11 = (const void *)[v10 decodeBytesForKey:@"rotatedJointsUsedForLifting" returnedLength:&v23];
    unint64_t v12 = (unint64_t)v23 >> 3;
    long long v24 = 0uLL;
    uint64_t v25 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v24, v11, (uint64_t)v11 + 8 * ((unint64_t)v23 >> 3), v23 >> 3);
    uint64_t v13 = (void *)*((void *)v5 + 4);
    if (v13)
    {
      *((void *)v5 + 5) = v13;
      operator delete(v13);
      *((void *)v5 + 4) = 0;
      *((void *)v5 + 5) = 0;
      *((void *)v5 + 6) = 0;
    }
    *((_OWORD *)v5 + 2) = v24;
    *((void *)v5 + 6) = v25;
    if (v8 != v12) {
      NSLog(&cfstr_InconsistentJo_0.isa);
    }
    *(void *)&long long v24 = 0;
    float v14 = (long long *)[v10 decodeBytesForKey:@"multiArray" returnedLength:&v24];
    if ((unint64_t)v24 >> 2 != 32)
    {
      NSLog(&cfstr_InconsistentMu.isa, (unint64_t)v24 >> 2);
      uint64_t v21 = 0;
      goto LABEL_12;
    }
    long long v15 = *v14;
    long long v16 = v14[1];
    long long v17 = v14[2];
    *(_OWORD *)(v5 + 104) = v14[3];
    *(_OWORD *)(v5 + 88) = v17;
    *(_OWORD *)(v5 + 72) = v16;
    *(_OWORD *)(v5 + 56) = v15;
    long long v18 = v14[4];
    long long v19 = v14[5];
    long long v20 = v14[6];
    *(_OWORD *)(v5 + 168) = v14[7];
    *(_OWORD *)(v5 + 152) = v20;
    *(_OWORD *)(v5 + 136) = v19;
    *(_OWORD *)(v5 + 120) = v18;
  }
  uint64_t v21 = v5;
LABEL_12:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_rotationNeeded forKey:@"rotationNeeded"];
  [v4 encodeBytes:self->_rawJointsUsedForLifting.var0 length:*(void *)self->_anon_10 - (unint64_t)self->_rawJointsUsedForLifting.var0 forKey:@"rawJointsUsedForLifting"];
  [v4 encodeBytes:self->_rotatedJointsUsedForLifting.var0 length:*(void *)self->_anon_28 - (unint64_t)self->_rotatedJointsUsedForLifting.var0 forKey:@"rotatedJointsUsedForLifting"];
  [v4 encodeBytes:&self->_multiArray length:128 forKey:@"multiArray"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = (char *)v4;
    unint64_t v6 = [(ABPK2D3DLiftingData *)self jointCount];
    if (v6 == [v5 jointCount])
    {
      var0 = self->_rawJointsUsedForLifting.var0;
      unint64_t v8 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_10;
      unint64_t v9 = v8 - var0;
      id v10 = self->_rotatedJointsUsedForLifting.var0;
      float32x2_t v11 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_28;
      if (v9 == v11 - v10)
      {
        if (v8 == var0)
        {
LABEL_10:
          if (v11 == v10)
          {
LABEL_15:
            if (self->_rotationNeeded == *((void *)v5 + 39))
            {
              uint64_t v17 = 0;
              while (vabds_f32(self->_multiArray.__elems_[v17], *(float *)&v5[v17 * 4 + 56]) <= 0.00000011921)
              {
                if (++v17 == 32)
                {
                  if (vabds_f32(self->_unnormalizedMultiArray.__elems_[0], *((float *)v5 + 46)) > 0.00000011921) {
                    break;
                  }
                  unint64_t v20 = 0;
                  do
                  {
                    unint64_t v21 = v20;
                    if (v20 == 31) {
                      break;
                    }
                    float v22 = vabds_f32(self->_unnormalizedMultiArray.__elems_[v20 + 1], *(float *)&v5[4 * v20 + 188]);
                    ++v20;
                  }
                  while (v22 <= 0.00000011921);
                  BOOL v18 = v21 > 0x1E;
                  goto LABEL_21;
                }
              }
            }
          }
          else
          {
            long long v15 = (float32x2_t *)*((void *)v5 + 4);
            if (v9 <= 1) {
              unint64_t v9 = 1;
            }
            while (1)
            {
              float32x2_t v16 = vsub_f32(*v15, *(float32x2_t *)v10);
              if (sqrtf(vaddv_f32(vmul_f32(v16, v16))) > 0.00000011921) {
                break;
              }
              ++v10;
              ++v15;
              if (!--v9) {
                goto LABEL_15;
              }
            }
          }
        }
        else
        {
          unint64_t v12 = (float32x2_t *)*((void *)v5 + 1);
          if (v9 <= 1) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = v9;
          }
          while (1)
          {
            float32x2_t v14 = vsub_f32(*v12, *(float32x2_t *)var0);
            if (sqrtf(vaddv_f32(vmul_f32(v14, v14))) > 0.00000011921) {
              break;
            }
            ++var0;
            ++v12;
            if (!--v13) {
              goto LABEL_10;
            }
          }
        }
      }
    }
    BOOL v18 = 0;
LABEL_21:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t result = [(ABPK2D3DLiftingData *)self jointCount];
  if (result)
  {
    float v4 = COERCE_FLOAT(*self->_rotatedJointsUsedForLifting.var0);
    LODWORD(v5) = HIDWORD(*(void *)(*(void *)self->_anon_28 - 8));
    return [(ABPK2D3DLiftingData *)self jointCount] ^ (unint64_t)v4 ^ (unint64_t)v5;
  }
  return result;
}

- (void).cxx_destruct
{
  var0 = self->_rotatedJointsUsedForLifting.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  float v4 = self->_rawJointsUsedForLifting.var0;
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