@interface ARSCNPlaneGeometry
+ (ARSCNPlaneGeometry)planeGeometryWithDevice:(id)device;
- (void)updateFromPlaneGeometry:(ARPlaneGeometry *)planeGeometry;
@end

@implementation ARSCNPlaneGeometry

+ (ARSCNPlaneGeometry)planeGeometryWithDevice:(id)device
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = device;
  v5 = (void *)[v4 newBufferWithLength:96000 options:0];
  uint64_t v6 = [v4 newBufferWithLength:48000 options:0];
  v7 = (void *)v6;
  if (v5 && v6)
  {
    v8 = [MEMORY[0x263F16A30] geometrySourceWithBuffer:v5 vertexFormat:30 semantic:*MEMORY[0x263F16B50] vertexCount:6000 dataOffset:0 dataStride:16];
    v9 = [MEMORY[0x263F16A30] geometrySourceWithBuffer:v7 vertexFormat:29 semantic:*MEMORY[0x263F16B40] vertexCount:6000 dataOffset:0 dataStride:8];
    v10 = [MEMORY[0x263F16A28] geometryElementWithData:0 primitiveType:0 primitiveCount:2000 bytesPerIndex:2];
    objc_msgSend(v10, "setPrimitiveRange:", 0, 0);
    v18[0] = v8;
    v18[1] = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v17 = v10;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v13 = +[SCNGeometry geometryWithSources:v11 elements:v12];

    if (v13)
    {
      objc_storeStrong(v13 + 21, v5);
      objc_storeStrong(v13 + 22, v7);
    }
  }
  else
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_0);
    }
    v8 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      __int16 v21 = 2048;
      id v22 = a1;
      __int16 v23 = 2114;
      id v24 = v4;
      _os_log_impl(&dword_20B202000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating new Metal buffer with device %{public}@", buf, 0x20u);
    }
    v13 = 0;
  }

  return (ARSCNPlaneGeometry *)v13;
}

- (void)updateFromPlaneGeometry:(ARPlaneGeometry *)planeGeometry
{
  v3 = planeGeometry;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm(&v52, 3 * [(ARPlaneGeometry *)v3 triangleCount]);
  __p = 0;
  v50 = 0;
  v51 = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__p, 3 * [(ARPlaneGeometry *)v3 triangleCount]);
  for (unint64_t i = 0; i < 3 * [(ARPlaneGeometry *)v3 triangleCount]; ++i)
  {
    uint64_t v5 = [(ARPlaneGeometry *)v3 vertices];
    uint64_t v6 = [(ARPlaneGeometry *)v3 triangleIndices][2 * i];
    v7 = v53;
    if (v53 >= v54)
    {
      uint64_t v9 = (v53 - (unsigned char *)v52) >> 4;
      if ((unint64_t)(v9 + 1) >> 60) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      unint64_t v10 = (v54 - (unsigned char *)v52) >> 3;
      if (v10 <= v9 + 1) {
        unint64_t v10 = v9 + 1;
      }
      if ((unint64_t)(v54 - (unsigned char *)v52) >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v10;
      }
      if (v11) {
        v12 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v54, v11);
      }
      else {
        v12 = 0;
      }
      v13 = &v12[16 * v9];
      *(_OWORD *)v13 = *(_OWORD *)(v5 + 16 * v6);
      v8 = v13 + 16;
      v15 = (char *)v52;
      v14 = v53;
      if (v53 != v52)
      {
        do
        {
          long long v16 = *((_OWORD *)v14 - 1);
          v14 -= 16;
          *((_OWORD *)v13 - 1) = v16;
          v13 -= 16;
        }
        while (v14 != v15);
        v14 = (char *)v52;
      }
      v52 = v13;
      v53 = v8;
      v54 = &v12[16 * v11];
      if (v14) {
        operator delete(v14);
      }
    }
    else
    {
      *(_OWORD *)v53 = *(_OWORD *)(v5 + 16 * v6);
      v8 = v7 + 16;
    }
    v53 = v8;
    uint64_t v17 = [(ARPlaneGeometry *)v3 textureCoordinates];
    uint64_t v18 = [(ARPlaneGeometry *)v3 triangleIndices][2 * i];
    v19 = v50;
    if (v50 >= v51)
    {
      uint64_t v21 = (v50 - (unsigned char *)__p) >> 3;
      if ((unint64_t)(v21 + 1) >> 61) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      unint64_t v22 = (v51 - (unsigned char *)__p) >> 2;
      if (v22 <= v21 + 1) {
        unint64_t v22 = v21 + 1;
      }
      if ((unint64_t)(v51 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v23 = v22;
      }
      if (v23) {
        id v24 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v51, v23);
      }
      else {
        id v24 = 0;
      }
      uint64_t v25 = &v24[8 * v21];
      *(void *)uint64_t v25 = *(void *)(v17 + 8 * v18);
      v20 = v25 + 8;
      v27 = (char *)__p;
      v26 = v50;
      if (v50 != __p)
      {
        do
        {
          uint64_t v28 = *((void *)v26 - 1);
          v26 -= 8;
          *((void *)v25 - 1) = v28;
          v25 -= 8;
        }
        while (v26 != v27);
        v26 = (char *)__p;
      }
      __p = v25;
      v50 = v20;
      v51 = &v24[8 * v23];
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      *(void *)v50 = *(void *)(v17 + 8 * v18);
      v20 = v19 + 8;
    }
    v50 = v20;
  }
  v29 = (void *)[(MTLBuffer *)self->_vertexBuffer contents];
  memcpy(v29, v52, v53 - (unsigned char *)v52);
  v30 = (void *)[(MTLBuffer *)self->_textureCoordinateBuffer contents];
  memcpy(v30, __p, v50 - (unsigned char *)__p);
  uint64_t v31 = [(ARPlaneGeometry *)v3 triangleCount];
  v32 = [(SCNGeometry *)self geometryElements];
  v33 = [v32 firstObject];
  objc_msgSend(v33, "setPrimitiveRange:", 0, v31);

  [(ARPlaneGeometry *)v3 center];
  float32x4_t v42 = v34;
  [(ARPlaneGeometry *)v3 extent];
  v35.i64[0] = 0xBF000000BF000000;
  v35.i64[1] = 0xBF000000BF000000;
  float32x4_t v37 = vaddq_f32(v42, vmulq_f32(v36, v35));
  uint64_t v47 = v37.i64[0];
  __int32 v48 = v37.i32[2];
  [(ARPlaneGeometry *)v3 center];
  float32x4_t v43 = v38;
  [(ARPlaneGeometry *)v3 extent];
  v39.i64[0] = 0x3F0000003F000000;
  v39.i64[1] = 0x3F0000003F000000;
  float32x4_t v41 = vaddq_f32(v43, vmulq_f32(v40, v39));
  uint64_t v45 = v41.i64[0];
  __int32 v46 = v41.i32[2];
  [(SCNGeometry *)self setBoundingBoxMin:&v47 max:&v45];
  if (__p)
  {
    v50 = (char *)__p;
    operator delete(__p);
  }
  if (v52)
  {
    v53 = (char *)v52;
    operator delete(v52);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureCoordinateBuffer, 0);

  objc_storeStrong((id *)&self->_vertexBuffer, 0);
}

@end