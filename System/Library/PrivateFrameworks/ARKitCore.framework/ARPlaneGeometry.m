@interface ARPlaneGeometry
+ (BOOL)supportsSecureCoding;
- (ARPlaneGeometry)initWithBoundaryVertices:(ARPlaneGeometry *)self center:(SEL)a2 extent:(const void *)a3;
- (ARPlaneGeometry)initWithCoder:(id)a3;
- (ARPlaneGeometry)initWithVertices:(vector<float)__attribute__((ext_vector_type(3 triangleIndices:boundaryVertexCount:center:extent:;
- (NSUInteger)boundaryVertexCount;
- (NSUInteger)textureCoordinateCount;
- (NSUInteger)triangleCount;
- (NSUInteger)vertexCount;
- (__n128)center;
- (__n128)extent;
- (const)boundaryVertices;
- (const)textureCoordinates;
- (const)triangleIndices;
- (const)vertices;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARPlaneGeometry

- (ARPlaneGeometry)initWithVertices:(vector<float)__attribute__((ext_vector_type(3 triangleIndices:boundaryVertexCount:center:extent:
{
  float32x4_t v19 = v5;
  float32x4_t v20 = v6;
  v23.receiver = self;
  v23.super_class = (Class)ARPlaneGeometry;
  v10 = [(ARPlaneGeometry *)&v23 init];
  v11 = v10;
  if (v10)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v10->_vertices, (__n128 *)a3.var0);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE((uint64_t)&v11->_triangleIndices, (__n128 *)a4);
    v11->_boundaryVertexCount = a5;
    *(float32x4_t *)v11->_center = v19;
    *(float32x4_t *)v11->_extent = v20;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v21, (uint64_t)(*(void *)v11->_anon_10 - (unint64_t)v11->_vertices.var0) >> 4);
    var0 = v11->_vertices.var0;
    if (*(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)v11->_anon_10 != var0)
    {
      unint64_t v13 = 0;
      v14.i64[0] = 0xBF000000BF000000;
      v14.i64[1] = 0xBF000000BF000000;
      float32x4_t v15 = vaddq_f32(v19, vmulq_f32(v20, v14));
      do
      {
        int8x16_t v16 = (int8x16_t)vdivq_f32(vsubq_f32(*(float32x4_t *)&var0[2 * v13], v15), v20);
        *(int32x2_t *)(v21 + 8 * v13++) = vzip1_s32(*(int32x2_t *)v16.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL));
        var0 = v11->_vertices.var0;
      }
      while (v13 < (uint64_t)(*(void *)v11->_anon_10 - (void)var0) >> 4);
    }
    v17 = *(void **)v11->_anon_20;
    if (v17)
    {
      *(void *)&v11->_anon_20[8] = v17;
      operator delete(v17);
      *(void *)v11->_anon_20 = 0;
      *(void *)&v11->_anon_20[8] = 0;
      *(void *)&v11->_anon_20[16] = 0;
    }
    *(_OWORD *)v11->_anon_20 = v21;
    *(void *)&v11->_anon_20[16] = v22;
  }
  return v11;
}

- (ARPlaneGeometry)initWithBoundaryVertices:(ARPlaneGeometry *)self center:(SEL)a2 extent:(const void *)a3
{
  long long v87 = v3;
  float32x4_t v88 = v4;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  long long v112 = 0uLL;
  uint64_t v113 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v112, *(const void **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  unint64_t v7 = *((void *)a3 + 1) - *(void *)a3;
  unint64_t v8 = v7 >> 4;
  __p[0] = 0;
  __p[1] = 0;
  v111[0] = 0;
  if ((v7 >> 4) < 3)
  {
    v9 = 0;
    goto LABEL_106;
  }
  if ((v7 >> 4) != 3)
  {
    v107 = 0;
    v108 = 0;
    v109 = 0;
    v86 = self;
    std::vector<__ARC3DShapeVertex>::reserve(&v107, (v7 >> 4));
    unsigned int v10 = v8 - 1;
    if ((int)v8 - 1 < 0)
    {
      v34 = v107;
    }
    else
    {
      char v11 = 0;
      v12 = (_OWORD *)MEMORY[0x1E4F1DAD8];
      int v13 = v8;
      do
      {
        int v14 = v13;
        int v13 = v10;
        float32x4_t v15 = (float32x4_t *)(v112 + 16 * v10);
        if (v10 >= (int)v8 - 1) {
          int v14 = 0;
        }
        float32x4_t v16 = vsubq_f32(*v15, *(float32x4_t *)(v112 + 16 * v14));
        float32x4_t v17 = vmulq_f32(v16, v16);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]) <= 0.00011921)
        {
          uint64_t v22 = *((void *)&v112 + 1) - (void)(v15 + 1);
          if (*((float32x4_t **)&v112 + 1) != &v15[1]) {
            memmove(v15, &v15[1], *((void *)&v112 + 1) - (void)(v15 + 1));
          }
          *((void *)&v112 + 1) = (char *)v15 + v22;
          char v11 = 1;
          LODWORD(v8) = v8 - 1;
        }
        else
        {
          float64x2_t v18 = vcvtq_f64_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v15->f32, (int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)v15, *(int8x16_t *)v15, 8uLL)));
          *(_OWORD *)buf = *v12;
          float64x2_t v100 = *(float64x2_t *)buf;
          float64x2_t v106 = *(float64x2_t *)buf;
          float32x4_t v19 = v108;
          if (v108 >= v109)
          {
            float64x2_t v89 = v18;
            unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * ((v108 - (unsigned char *)v107) >> 4);
            unint64_t v24 = v23 + 1;
            if (v23 + 1 > 0x333333333333333) {
              std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
            }
            if (0x999999999999999ALL * ((v109 - (unsigned char *)v107) >> 4) > v24) {
              unint64_t v24 = 0x999999999999999ALL * ((v109 - (unsigned char *)v107) >> 4);
            }
            if (0xCCCCCCCCCCCCCCCDLL * ((v109 - (unsigned char *)v107) >> 4) >= 0x199999999999999) {
              unint64_t v25 = 0x333333333333333;
            }
            else {
              unint64_t v25 = v24;
            }
            if (v25) {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<__ARC3DShapeVertex>>((uint64_t)&v109, v25);
            }
            else {
              v26 = 0;
            }
            v27 = (float64x2_t *)&v26[80 * v23];
            float64x2_t *v27 = v89;
            v27[1] = *(float64x2_t *)buf;
            v27[2] = v100;
            v27[3] = v106;
            v27[4].f64[0] = 0.0;
            LOBYTE(v27[4].f64[1]) = 0;
            HIDWORD(v27[4].f64[1]) = v13;
            v29 = (char *)v107;
            v28 = v108;
            v30 = v27;
            if (v108 != v107)
            {
              do
              {
                v30[-5] = *((float64x2_t *)v28 - 5);
                float64x2_t v31 = *((float64x2_t *)v28 - 4);
                float64x2_t v32 = *((float64x2_t *)v28 - 3);
                float64x2_t v33 = *((float64x2_t *)v28 - 1);
                v30[-2] = *((float64x2_t *)v28 - 2);
                v30[-1] = v33;
                v30[-4] = v31;
                v30[-3] = v32;
                v30 -= 5;
                v28 -= 80;
              }
              while (v28 != v29);
              v28 = v29;
            }
            long long v21 = (char *)&v27[5];
            v107 = v30;
            v108 = (char *)&v27[5];
            v109 = &v26[80 * v25];
            if (v28) {
              operator delete(v28);
            }
          }
          else
          {
            *(float64x2_t *)v108 = v18;
            float64x2_t v20 = v100;
            *((_OWORD *)v19 + 1) = *(_OWORD *)buf;
            *((float64x2_t *)v19 + 2) = v20;
            *((float64x2_t *)v19 + 3) = v106;
            *((void *)v19 + 8) = 0;
            v19[72] = 0;
            *((_DWORD *)v19 + 19) = v13;
            long long v21 = v19 + 80;
          }
          v108 = v21;
        }
        unsigned int v10 = v13 - 1;
      }
      while (v13 > 0);
      if (v8 <= 2)
      {
        if (v107)
        {
          v108 = (char *)v107;
          operator delete(v107);
        }
        v9 = 0;
        goto LABEL_104;
      }
      if (v8 == 3)
      {
        *(_DWORD *)buf = 65538;
        *(_WORD *)&buf[4] = 0;
        std::vector<short>::__assign_with_size[abi:ne180100]<short const*,short const*>((char *)__p, buf, (uint64_t)&buf[6], 3uLL);
        LODWORD(v8) = 3;
LABEL_97:
        if (v107)
        {
          v108 = (char *)v107;
          operator delete(v107);
        }
        goto LABEL_99;
      }
      v34 = v107;
      if (v11)
      {
        uint64_t v79 = 0;
        uint64x2_t v80 = (uint64x2_t)vdupq_n_s64((unint64_t)v8 - 1);
        v81 = (char *)v107 + 156;
        int64x2_t v82 = (int64x2_t)xmmword_1B8A56650;
        int v83 = v8 - 1;
        int64x2_t v84 = vdupq_n_s64(2uLL);
        do
        {
          int32x2_t v85 = vmovn_s64((int64x2_t)vcgeq_u64(v80, (uint64x2_t)v82));
          if (v85.i8[0]) {
            *(v81 - 20) = v83;
          }
          if (v85.i8[4]) {
            _DWORD *v81 = v8 + (v79 ^ 0xFFFFFFFE);
          }
          v79 += 2;
          int64x2_t v82 = vaddq_s64(v82, v84);
          v81 += 40;
          v83 -= 2;
        }
        while (((v8 + 1) & 0x1FFFFFFFELL) != v79);
      }
    }
    *(void *)&v100.f64[0] = v34;
    LODWORD(v100.f64[1]) = v8;
    HIDWORD(v100.f64[1]) = v8;
    float v35 = (float)(0.5 * v88.f32[0]) + 0.00011921;
    double v101 = (float)(*(float *)&v87 - v35);
    double v102 = (float)(*(float *)&v87 + v35);
    float v36 = vmuls_lane_f32(0.5, v88, 2) + 0.00011921;
    double v103 = (float)(*((float *)&v87 + 2) - v36);
    double v104 = (float)(*((float *)&v87 + 2) + v36);
    uint64_t v105 = 2;
    LODWORD(v106.f64[0]) = 0;
    int v99 = 0;
    v94 = &v100;
    int v95 = 1;
    uint64_t v97 = 0;
    uint64_t v96 = 0;
    int v98 = 0;
    v37 = (char *)ARC3DShapeConnectedComponentTriangulate((uint64_t)&v94, &v106, &v99);
    int v38 = LODWORD(v106.f64[0]);
    if (!LODWORD(v106.f64[0]))
    {
      v39 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*(void *)a3 length:*((void *)a3 + 1) - *(void *)a3 freeWhenDone:0];
      if (_ARLogTechnique(void)::onceToken != -1) {
        dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_95);
      }
      v40 = (id)_ARLogTechnique(void)::logObj;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (objc_class *)objc_opt_class();
        v42 = NSStringFromClass(v41);
        *(_DWORD *)buf = 138545154;
        *(void *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        __int16 v115 = 1024;
        int v116 = v99;
        __int16 v117 = 2048;
        double v118 = *(float *)&v87;
        __int16 v119 = 2048;
        double v120 = *((float *)&v87 + 2);
        __int16 v121 = 2048;
        double v122 = v88.f32[0];
        __int16 v123 = 2048;
        double v124 = v88.f32[2];
        __int16 v125 = 2112;
        v126 = v39;
        _os_log_impl(&dword_1B88A2000, v40, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error [%d]: Plane triangulation failed (%f %f %f %f) %@", buf, 0x4Eu);
      }
      int v38 = LODWORD(v106.f64[0]);
    }
    std::vector<short>::reserve(__p, (3 * v38));
    if (LODWORD(v106.f64[0]))
    {
      unint64_t v43 = 0;
      v44 = (char *)__p[1];
      do
      {
        v45 = &v37[56 * v43];
        int v46 = *(_DWORD *)(*(void *)v45 + 76);
        v47 = (char *)v111[0];
        if ((unint64_t)v44 >= v111[0])
        {
          v49 = (char *)__p[0];
          uint64_t v50 = v44 - (char *)__p[0];
          if (v44 - (char *)__p[0] <= -3) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v51 = v50 >> 1;
          if (v111[0] - (unint64_t)__p[0] <= (v50 >> 1) + 1) {
            unint64_t v52 = v51 + 1;
          }
          else {
            unint64_t v52 = v111[0] - (unint64_t)__p[0];
          }
          if (v111[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v53 = v52;
          }
          if (v53)
          {
            v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)v111, v53);
            v49 = (char *)__p[0];
            v44 = (char *)__p[1];
          }
          else
          {
            v54 = 0;
          }
          v55 = &v54[2 * v51];
          *(_WORD *)v55 = v46;
          v48 = v55 + 2;
          while (v44 != v49)
          {
            __int16 v56 = *((_WORD *)v44 - 1);
            v44 -= 2;
            *((_WORD *)v55 - 1) = v56;
            v55 -= 2;
          }
          v47 = &v54[2 * v53];
          __p[0] = v55;
          __p[1] = v48;
          v111[0] = v47;
          if (v49)
          {
            operator delete(v49);
            v47 = (char *)v111[0];
          }
        }
        else
        {
          *(_WORD *)v44 = v46;
          v48 = v44 + 2;
        }
        __p[1] = v48;
        int v57 = *(_DWORD *)(*((void *)v45 + 2) + 76);
        if (v48 >= v47)
        {
          v59 = (char *)__p[0];
          uint64_t v60 = v48 - (char *)__p[0];
          if (v48 - (char *)__p[0] <= -3) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v61 = v60 >> 1;
          unint64_t v62 = v47 - (char *)__p[0];
          if (v62 <= (v60 >> 1) + 1) {
            unint64_t v63 = v61 + 1;
          }
          else {
            unint64_t v63 = v62;
          }
          if (v62 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v64 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v64 = v63;
          }
          if (v64)
          {
            v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)v111, v64);
            v59 = (char *)__p[0];
            v48 = (char *)__p[1];
          }
          else
          {
            v65 = 0;
          }
          v66 = &v65[2 * v61];
          *(_WORD *)v66 = v57;
          v58 = v66 + 2;
          while (v48 != v59)
          {
            __int16 v67 = *((_WORD *)v48 - 1);
            v48 -= 2;
            *((_WORD *)v66 - 1) = v67;
            v66 -= 2;
          }
          v47 = &v65[2 * v64];
          __p[0] = v66;
          __p[1] = v58;
          v111[0] = v47;
          if (v59)
          {
            operator delete(v59);
            v47 = (char *)v111[0];
          }
        }
        else
        {
          *(_WORD *)v48 = v57;
          v58 = v48 + 2;
        }
        __p[1] = v58;
        int v68 = *(_DWORD *)(*((void *)v45 + 1) + 76);
        if (v58 >= v47)
        {
          v69 = (char *)__p[0];
          uint64_t v70 = v58 - (char *)__p[0];
          if (v58 - (char *)__p[0] <= -3) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v71 = v70 >> 1;
          unint64_t v72 = v47 - (char *)__p[0];
          if (v72 <= (v70 >> 1) + 1) {
            unint64_t v73 = v71 + 1;
          }
          else {
            unint64_t v73 = v72;
          }
          if (v72 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v74 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v74 = v73;
          }
          if (v74)
          {
            v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)v111, v74);
            v69 = (char *)__p[0];
            v58 = (char *)__p[1];
          }
          else
          {
            v75 = 0;
          }
          v76 = &v75[2 * v71];
          *(_WORD *)v76 = v68;
          v44 = v76 + 2;
          while (v58 != v69)
          {
            __int16 v77 = *((_WORD *)v58 - 1);
            v58 -= 2;
            *((_WORD *)v76 - 1) = v77;
            v76 -= 2;
          }
          __p[0] = v76;
          __p[1] = v44;
          v111[0] = &v75[2 * v74];
          if (v69) {
            operator delete(v69);
          }
        }
        else
        {
          *(_WORD *)v58 = v68;
          v44 = v58 + 2;
        }
        __p[1] = v44;
        ++v43;
      }
      while (v43 < LODWORD(v106.f64[0]));
    }
    free(v37);
    self = v86;
    goto LABEL_97;
  }
  *(_DWORD *)buf = 0x10000;
  *(_WORD *)&buf[4] = 2;
  std::vector<short>::__assign_with_size[abi:ne180100]<short const*,short const*>((char *)__p, buf, (uint64_t)&buf[6], 3uLL);
  LODWORD(v8) = 3;
LABEL_99:
  *(_OWORD *)v92 = v112;
  uint64_t v93 = v113;
  uint64_t v113 = 0;
  long long v112 = 0uLL;
  *(_OWORD *)v90 = *(_OWORD *)__p;
  uint64_t v91 = v111[0];
  __p[0] = 0;
  __p[1] = 0;
  v111[0] = 0;
  self = -[ARPlaneGeometry initWithVertices:triangleIndices:boundaryVertexCount:center:extent:](self, "initWithVertices:triangleIndices:boundaryVertexCount:center:extent:", v92, v90, v8, *(double *)&v87, *(double *)v88.i64, v86);
  if (v90[0])
  {
    v90[1] = v90[0];
    operator delete(v90[0]);
  }
  if (v92[0])
  {
    v92[1] = v92[0];
    operator delete(v92[0]);
  }
  v9 = self;
LABEL_104:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_106:
  if ((void)v112)
  {
    *((void *)&v112 + 1) = v112;
    operator delete((void *)v112);
  }

  return v9;
}

- (NSUInteger)vertexCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_vertices.var0) >> 4;
}

- (const)vertices
{
  return (const simd_float3 *)self->_vertices.var0;
}

- (NSUInteger)textureCoordinateCount
{
  return (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 3;
}

- (const)textureCoordinates
{
  return *(const simd_float2 **)self->_anon_20;
}

- (NSUInteger)triangleCount
{
  return (self->_triangleIndices.__end_ - self->_triangleIndices.__begin_) / 3uLL;
}

- (const)triangleIndices
{
  return self->_triangleIndices.__begin_;
}

- (const)boundaryVertices
{
  return (const simd_float3 *)self->_vertices.var0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  float32x4_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_vertices.var0 length:*(void *)self->_anon_10 - (unint64_t)self->_vertices.var0 freeWhenDone:0];
  [v6 encodeObject:v4 forKey:@"vertexData"];

  float32x4_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_triangleIndices.__begin_ length:(char *)self->_triangleIndices.__end_ - (char *)self->_triangleIndices.__begin_ freeWhenDone:0];
  [v6 encodeObject:v5 forKey:@"triangleData"];

  [v6 encodeInteger:self->_boundaryVertexCount forKey:@"boundaryVertexCount"];
  objc_msgSend(v6, "ar_encodeVector3:forKey:", @"center", *(double *)self->_center);
  objc_msgSend(v6, "ar_encodeVector3:forKey:", @"extent", *(double *)self->_extent);
}

- (ARPlaneGeometry)initWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float32x4_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vertexData"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triangleData"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"boundaryVertexCount"];
  objc_msgSend(v4, "ar_decodeVector3ForKey:", @"center");
  double v24 = v8;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", @"extent");
  if (v5 && v6 && v7)
  {
    double v23 = v9;
    id v10 = v5;
    char v11 = (const void *)[v10 bytes];
    id v12 = v6;
    int v13 = (const void *)[v12 bytes];
    uint64_t v14 = [v10 length];
    memset(buf, 0, sizeof(buf));
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v11, (uint64_t)v11 + (v14 & 0xFFFFFFFFFFFFFFF0), v14 >> 4);
    uint64_t v15 = [v12 length];
    v29[0] = 0;
    v29[1] = 0;
    uint64_t v30 = 0;
    std::vector<short>::__init_with_size[abi:ne180100]<short const*,short const*>(v29, v13, (uint64_t)v13 + (v15 & 0xFFFFFFFFFFFFFFFELL), v15 >> 1);
    *(_OWORD *)v27 = *(_OWORD *)buf;
    uint64_t v28 = *(void *)&buf[16];
    memset(buf, 0, sizeof(buf));
    *(_OWORD *)__p = *(_OWORD *)v29;
    uint64_t v26 = v30;
    v29[0] = 0;
    v29[1] = 0;
    uint64_t v30 = 0;
    self = [(ARPlaneGeometry *)self initWithVertices:v27 triangleIndices:__p boundaryVertexCount:v7 center:v24 extent:v23];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    if (v29[0])
    {
      v29[1] = v29[0];
      operator delete(v29[0]);
    }
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
    float32x4_t v16 = self;
  }
  else
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_77_2);
    }
    float32x4_t v17 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      float64x2_t v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      float64x2_t v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&unsigned char buf[22] = 2114;
      float64x2_t v32 = v21;
      __int16 v33 = 2048;
      id v34 = v4;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %{public}@(%p): Error decoding plane geometry", buf, 0x2Au);
    }
    float32x4_t v16 = 0;
  }

  return v16;
}

- (NSUInteger)boundaryVertexCount
{
  return self->_boundaryVertexCount;
}

- (__n128)center
{
  return a1[6];
}

- (__n128)extent
{
  return a1[7];
}

- (void).cxx_destruct
{
  begin = self->_triangleIndices.__begin_;
  if (begin)
  {
    self->_triangleIndices.__end_ = begin;
    operator delete(begin);
  }
  id v4 = *(void **)self->_anon_20;
  if (v4)
  {
    *(void *)&self->_anon_20[8] = v4;
    operator delete(v4);
  }
  var0 = self->_vertices.var0;
  if (var0)
  {
    *(void *)self->_anon_10 = var0;
    operator delete(var0);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end