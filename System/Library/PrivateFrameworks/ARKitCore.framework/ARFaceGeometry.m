@interface ARFaceGeometry
+ (BOOL)supportsSecureCoding;
- (ARFaceGeometry)initWithBlendShapes:(NSDictionary *)blendShapes;
- (ARFaceGeometry)initWithCoder:(id)a3;
- (ARFaceGeometry)initWithCustomVertices:(ARFaceGeometry *)self verticesCount:(SEL)a2;
- (ARFaceGeometry)initWithFaceTrackingDataProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSUInteger)textureCoordinateCount;
- (NSUInteger)triangleCount;
- (NSUInteger)vertexCount;
- (__n128)positionForLabeledFacePosition:(void *)a3;
- (const)textureCoordinates;
- (const)triangleIndices;
- (const)vertices;
- (double)normalForLabeledFacePosition:(void *)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPrivate;
- (signed)closestVertexIndexToLabeledFacePosition:(id)a3;
- (uint64_t)normals;
- (unint64_t)normalCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARFaceGeometry

- (id)initPrivate
{
  if (+[ARFaceTrackingTechnique isSupported])
  {
    v8.receiver = self;
    v8.super_class = (Class)ARFaceGeometry;
    v3 = [(ARFaceGeometry *)&v8 init];
    if (v3)
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(1);
      normalsSemaphore = v3->_normalsSemaphore;
      v3->_normalsSemaphore = (OS_dispatch_semaphore *)v4;
    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ARFaceGeometry)initWithBlendShapes:(NSDictionary *)blendShapes
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = blendShapes;
  v5 = [(ARFaceGeometry *)self initPrivate];
  if (v5)
  {
    v6 = +[ARFaceAnchor blendShapeMapping];
    v7 = [v6 allKeys];
    std::vector<float>::vector(&__p, [v7 count]);

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v8 = v4;
    uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v13 = [v6 objectForKeyedSubscript:v12];
          if (v13)
          {
            v14 = [(NSDictionary *)v8 objectForKeyedSubscript:v12];
            [v14 floatValue];
            int v16 = v15;
            int v17 = [v13 intValue];
            *((_DWORD *)__p + v17) = v16;
          }
        }
        uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v9);
    }

    v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:__p length:v43 - (unsigned char *)__p freeWhenDone:0];
    uint64_t v44 = *MEMORY[0x1E4F4D6D0];
    v45 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    CVAFaceTrackingCopySemantics();
    uint64_t v37 = 0;
    v20 = [0 objectForKeyedSubscript:*MEMORY[0x1E4F4D778]];
    v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F4D790]];

    unint64_t v22 = [v21 length];
    id v23 = v21;
    uint64_t v24 = [v23 bytes];
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v34, (int)(v22 / 0xC));
    var0 = v5->_customVertices.var0;
    if (var0)
    {
      *(void *)v5->_anon_10 = var0;
      operator delete(var0);
      v5->_customVertices.var0 = 0;
      *(void *)v5->_anon_10 = 0;
      *(void *)&v5->_anon_10[8] = 0;
    }
    v27 = v34;
    v5->_customVertices.var0 = v34;
    v28 = v35;
    *(void *)v5->_anon_10 = v35;
    *(void *)&v5->_anon_10[8] = v36;
    if (v28 != v27)
    {
      unint64_t v29 = 0;
      v30 = (_DWORD *)(v24 + 8);
      float32x4_t v31 = (float32x4_t)vdupq_n_s32(0x447A0000u);
      do
      {
        v25.i64[0] = *((void *)v30 - 1);
        v25.i32[2] = *v30;
        *(float32x4_t *)&v27[2 * v29] = v25;
        v32 = v5->_customVertices.var0;
        float32x4_t v25 = vdivq_f32(*(float32x4_t *)&v32[2 * v29], v31);
        *(float32x4_t *)&v32[2 * v29++] = v25;
        v27 = v5->_customVertices.var0;
        v30 += 3;
      }
      while (v29 < (uint64_t)(*(void *)v5->_anon_10 - (void)v27) >> 4);
    }

    if (__p)
    {
      v43 = __p;
      operator delete(__p);
    }
  }
  return v5;
}

- (ARFaceGeometry)initWithFaceTrackingDataProtocol:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(ARFaceGeometry *)self initPrivate];
  uint64_t v7 = [v5 vertexCount];
  objc_super v8 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  uint64_t v9 = [v8 vertexCount];

  if (v7 == v9)
  {
    if (v6)
    {
      objc_storeStrong((id *)v6 + 7, a3);
      uint64_t v10 = (const void *)[v5 vertices];
      uint64_t v11 = [v5 vertices];
      uint64_t v12 = [v5 vertexCount];
      memset(v19, 0, sizeof(v19));
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(v19, v10, v11 + 16 * v12, (v11 + 16 * v12 - (uint64_t)v10) >> 4);
      v13 = (void *)*((void *)v6 + 1);
      if (v13)
      {
        *((void *)v6 + 2) = v13;
        operator delete(v13);
        *((void *)v6 + 1) = 0;
        *((void *)v6 + 2) = 0;
        *((void *)v6 + 3) = 0;
      }
      *(_OWORD *)(v6 + 8) = *(_OWORD *)v19;
      *((void *)v6 + 3) = *(void *)&v19[16];
    }
    v14 = v6;
  }
  else
  {
    int v15 = _ARLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = (objc_class *)objc_opt_class();
      int v17 = NSStringFromClass(v16);
      *(_DWORD *)v19 = 138543618;
      *(void *)&v19[4] = v17;
      *(_WORD *)&v19[12] = 2048;
      *(void *)&v19[14] = v6;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error: Number of vertices must be consistent with neutral geometry", v19, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

- (ARFaceGeometry)initWithCustomVertices:(ARFaceGeometry *)self verticesCount:(SEL)a2
{
  unint64_t v4 = v3;
  id v5 = v2;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = [(ARFaceGeometry *)self initPrivate];
  uint64_t v7 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  uint64_t v8 = [v7 vertexCount];

  if (v8 == v4)
  {
    if (v6)
    {
      uint64_t v9 = (void *)v6[7];
      v6[7] = 0;

      memset(v16, 0, sizeof(v16));
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(v16, v5, (uint64_t)v5 + 16 * v4, v4);
      uint64_t v10 = (void *)v6[1];
      if (v10)
      {
        v6[2] = v10;
        operator delete(v10);
        v6[1] = 0;
        v6[2] = 0;
        v6[3] = 0;
      }
      *(_OWORD *)(v6 + 1) = *(_OWORD *)v16;
      v6[3] = *(void *)&v16[16];
    }
    uint64_t v11 = v6;
  }
  else
  {
    uint64_t v12 = _ARLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)int v16 = 138543618;
      *(void *)&v16[4] = v14;
      *(_WORD *)&v16[12] = 2048;
      *(void *)&v16[14] = v6;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error: Number of vertices must be consistent with neutral geometry", v16, 0x16u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initPrivate");
  uint64_t v5 = v4;
  if (v4)
  {
    if ((ARFaceGeometry *)v4 != self)
    {
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v4 + 8), (char *)self->_customVertices.var0, *(void *)self->_anon_10, (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_customVertices.var0) >> 4);
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v5 + 32), (char *)self->_normals.var0, *(void *)self->_anon_28, (uint64_t)(*(void *)self->_anon_28 - (unint64_t)self->_normals.var0) >> 4);
    }
    objc_storeStrong((id *)(v5 + 56), self->_trackingData);
  }
  return (id)v5;
}

- (const)vertices
{
  var0 = self->_customVertices.var0;
  if (*(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10 == var0)
  {
    unint64_t v3 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
    var0 = (__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **)[v3 vertices];
  }
  return (const simd_float3 *)var0;
}

- (NSUInteger)vertexCount
{
  v2 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  NSUInteger v3 = [v2 vertexCount];

  return v3;
}

- (unint64_t)normalCount
{
  trackingData = self->_trackingData;
  if (trackingData) {
    return [(ARFaceTrackingDataProtocol *)trackingData normalCount];
  }
  else {
    return [(ARFaceGeometry *)self vertexCount];
  }
}

- (uint64_t)normals
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(a1 + 56))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    v2 = *(void **)(a1 + 56);
    return [v2 normals];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40) - *(void *)(a1 + 32);
    if ([(id)a1 vertexCount] != v4 >> 4)
    {
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(a1 + 32, [(id)a1 vertexCount]);
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40) - (void)v5;
      if (v6 >= 1) {
        bzero(v5, 16 * (((unint64_t)v6 >> 4) - ((unint64_t)v6 > 0xF)) + 16);
      }
      if ([(id)a1 triangleCount])
      {
        unsigned int v7 = 0;
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = *(__int16 *)([(id)a1 triangleIndices] + 2 * v7);
          uint64_t v10 = *(__int16 *)([(id)a1 triangleIndices] + 2 * (v7 + 1));
          uint64_t v11 = *(__int16 *)([(id)a1 triangleIndices] + 2 * (v7 + 2));
          float32x4_t v21 = *(float32x4_t *)([(id)a1 vertices] + 16 * v9);
          float32x4_t v20 = *(float32x4_t *)([(id)a1 vertices] + 16 * v10);
          uint64_t v12 = [(id)a1 vertices];
          float32x4_t v13 = vsubq_f32(v20, v21);
          float32x4_t v14 = vsubq_f32(*(float32x4_t *)(v12 + 16 * v11), v21);
          float32x4_t v15 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), (int8x16_t)v14, 0xCuLL), vnegq_f32(v13)), v14, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL));
          int32x4_t v16 = (int32x4_t)vmulq_f32(v15, v15);
          v16.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), *(float32x2_t *)v16.i8)).u32[0];
          float32x2_t v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
          float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
          float32x4_t v19 = vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL), vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]);
          *(float32x4_t *)(*(void *)(a1 + 32) + 16 * v9) = vaddq_f32(*(float32x4_t *)(*(void *)(a1 + 32) + 16 * v9), v19);
          *(float32x4_t *)(*(void *)(a1 + 32) + 16 * v10) = vaddq_f32(v19, *(float32x4_t *)(*(void *)(a1 + 32) + 16 * v10));
          ++v8;
          *(float32x4_t *)(*(void *)(a1 + 32) + 16 * v11) = vaddq_f32(v19, *(float32x4_t *)(*(void *)(a1 + 32) + 16 * v11));
          v7 += 3;
        }
        while ([(id)a1 triangleCount] > v8);
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    return *(void *)(a1 + 32);
  }
}

- (const)textureCoordinates
{
  v2 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  NSUInteger v3 = (const simd_float2 *)[v2 textureCoordinates];

  return v3;
}

- (NSUInteger)textureCoordinateCount
{
  v2 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  NSUInteger v3 = [v2 textureCoordinateCount];

  return v3;
}

- (const)triangleIndices
{
  v2 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  NSUInteger v3 = (const int16_t *)[v2 triangleIndices];

  return v3;
}

- (NSUInteger)triangleCount
{
  v2 = +[ARNeutralFaceGeometry sharedNeutralGeometry];
  NSUInteger v3 = [v2 triangleCount];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_customVertices.var0 length:*(void *)self->_anon_10 - (unint64_t)self->_customVertices.var0];
  [v6 encodeObject:v4 forKey:@"customVertices"];
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_normals.var0 length:*(void *)self->_anon_28 - (unint64_t)self->_normals.var0];
  [v6 encodeObject:v5 forKey:@"normalsData"];
  [v6 encodeObject:self->_trackingData forKey:@"trackingData"];
}

- (ARFaceGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ARFaceGeometry *)self initPrivate];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customVertices"];
    unsigned int v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 length];
      uint64_t v9 = (const void *)[v7 bytes];
      long long v19 = 0uLL;
      uint64_t v20 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v19, v9, (uint64_t)v9 + 16 * (int)((unint64_t)v8 >> 4), (int)(v8 >> 4));
      uint64_t v10 = (void *)*((void *)v5 + 1);
      if (v10)
      {
        *((void *)v5 + 2) = v10;
        operator delete(v10);
        *((void *)v5 + 1) = 0;
        *((void *)v5 + 2) = 0;
        *((void *)v5 + 3) = 0;
      }
      *(_OWORD *)(v5 + 8) = v19;
      *((void *)v5 + 3) = v20;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"normalsData"];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 length];
      float32x4_t v14 = (const void *)[v12 bytes];
      long long v19 = 0uLL;
      uint64_t v20 = 0;
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v19, v14, (uint64_t)v14 + 16 * (int)((unint64_t)v13 >> 4), (int)(v13 >> 4));
      float32x4_t v15 = (void *)*((void *)v5 + 4);
      if (v15)
      {
        *((void *)v5 + 5) = v15;
        operator delete(v15);
        *((void *)v5 + 4) = 0;
        *((void *)v5 + 5) = 0;
        *((void *)v5 + 6) = 0;
      }
      *((_OWORD *)v5 + 2) = v19;
      *((void *)v5 + 6) = v20;
    }
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingData"];
    float32x2_t v17 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v16;
  }
  return (ARFaceGeometry *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = (id *)v4;
    id v6 = v5;
    unsigned int v7 = (float32x4_t *)v5[1];
    unint64_t v8 = ((unsigned char *)v5[2] - (unsigned char *)v7) >> 4;
    var0 = self->_customVertices.var0;
    uint64_t v10 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
    if (v8 != ((char *)v10 - (char *)var0) >> 4) {
      goto LABEL_10;
    }
    if (v10 == var0) {
      goto LABEL_8;
    }
    BOOL v11 = 0;
    uint64_t v12 = 0;
    do
    {
      uint32x4_t v13 = (uint32x4_t)vceqq_f32(v7[v12], *(float32x4_t *)&var0[2 * v12]);
      v13.i32[3] = v13.i32[2];
      if ((vminvq_u32(v13) & 0x80000000) == 0) {
        break;
      }
      BOOL v11 = ++v12 >= v8;
    }
    while (v8 != v12);
    if (v11) {
LABEL_8:
    }
      char v14 = [v5[7] isEqual:self->_trackingData];
    else {
LABEL_10:
    }
      char v14 = 0;
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (__n128)positionForLabeledFacePosition:(void *)a3
{
  id v4 = a3;
  int v19 = 0;
  __int16 v18 = 0;
  uint64_t v17 = 0;
  float v16 = 0.0;
  if (ARFaceLandmarkDataFromLabeledFacePosition(v4, (__int16 *)&v19 + 1, (__int16 *)&v19, &v18, (float *)&v17 + 1, (float *)&v17, &v16))
  {
    uint64_t v5 = [a1 vertices];
    *(float32x2_t *)v6.f32 = ARVector3ScalarMultiplication(*(float32x2_t *)(v5 + 16 * SHIWORD(v19)), *((float *)&v17 + 1));
    float32x4_t v14 = v6;
    uint64_t v7 = [a1 vertices];
    *(float32x2_t *)v8.f32 = ARVector3ScalarMultiplication(*(float32x2_t *)(v7 + 16 * (__int16)v19), *(float *)&v17);
    float32x4_t v13 = v8;
    uint64_t v9 = [a1 vertices];
    *(float32x2_t *)v10.f32 = ARVector3ScalarMultiplication(*(float32x2_t *)(v9 + 16 * v18), v16);
    float32x4_t v11 = vaddq_f32(vaddq_f32(v14, v13), v10);
  }
  else
  {
    float32x4_t v11 = (float32x4_t)xmmword_1B8A53660;
  }
  float32x4_t v15 = v11;

  return (__n128)v15;
}

- (double)normalForLabeledFacePosition:(void *)a3
{
  int v21 = 0;
  __int16 v20 = 0;
  if (ARFaceLandmarkDataFromLabeledFacePosition(a3, (__int16 *)&v21 + 1, (__int16 *)&v21, &v20, &v19, &v18, &v17))
  {
    uint64_t v4 = [a1 vertices];
    float32x4_t v16 = *(float32x4_t *)(v4 + 16 * SHIWORD(v21));
    uint64_t v5 = [a1 vertices];
    float32x4_t v15 = *(float32x4_t *)(v5 + 16 * (__int16)v21);
    uint64_t v6 = [a1 vertices];
    float32x4_t v7 = vsubq_f32(v15, v16);
    float32x4_t v8 = vsubq_f32(*(float32x4_t *)(v6 + 16 * v20), v16);
    float32x4_t v9 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), vnegq_f32(v7)), v8, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), (int8x16_t)v7, 0xCuLL));
    float32x4_t v10 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL);
    int32x4_t v11 = (int32x4_t)vmulq_f32(v9, v9);
    v11.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), *(float32x2_t *)v11.i8)).u32[0];
    float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
    float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
    *(void *)&double result = vmulq_n_f32(v10, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]).u64[0];
  }
  else
  {
    *(void *)&double result = 2143289344;
  }
  return result;
}

- (signed)closestVertexIndexToLabeledFacePosition:(id)a3
{
  int v10 = 0;
  __int16 v9 = 0;
  float v8 = 0.0;
  float v6 = 0.0;
  float v7 = 0.0;
  if (!ARFaceLandmarkDataFromLabeledFacePosition(a3, (__int16 *)&v10 + 1, (__int16 *)&v10, &v9, &v8, &v7, &v6))return -1; {
  if (v8 > v7 && v8 > v6)
  }
    return HIWORD(v10);
  if (v7 <= v6) {
    return v9;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalsSemaphore, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  var0 = self->_normals.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  uint64_t v4 = self->_customVertices.var0;
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