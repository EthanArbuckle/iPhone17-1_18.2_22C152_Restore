@interface ARKeyFrame
- (ARKeyFrame)initWithKeyframeData:(float32x4_t)a3 featurePoints:(float32x4_t)a4 referenceOriginTransform:(float32x4_t)a5;
- (ARPointCloud)featurePoints;
- (__n128)cameraIntrinsics;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (__n128)transform;
- (id)description;
@end

@implementation ARKeyFrame

- (ARKeyFrame)initWithKeyframeData:(float32x4_t)a3 featurePoints:(float32x4_t)a4 referenceOriginTransform:(float32x4_t)a5
{
  id v10 = a8;
  v63.receiver = a1;
  v63.super_class = (Class)ARKeyFrame;
  v11 = [(ARKeyFrame *)&v63 init];
  if (v11)
  {
    v62[0] = 0;
    v62[1] = 0;
    v61 = (uint64_t *)v62;
    if (*(void *)(a7 + 168))
    {
      unint64_t v12 = 0;
      do
      {
        v65.columns[0].i64[0] = *(unsigned int *)(*(void *)(a7 + 176) + 4 * v12);
        std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long>(&v61, (unint64_t *)&v65, (uint64_t *)&v65);
        ++v12;
      }
      while (v12 < *(void *)(a7 + 168));
    }
    std::set<unsigned long long>::set[abi:ne180100](v60, (uint64_t)&v61);
    uint64_t v13 = [v10 filterPointCloudWithIdentifiers:v60];
    featurePoints = v11->_featurePoints;
    v11->_featurePoints = (ARPointCloud *)v13;

    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)v60, (void *)v60[1]);
    *(double *)v15.i64 = ARMatrix4x4MakeRowMajorTransform((double *)a7);
    simd_float4 v54 = v16;
    simd_float4 v55 = v15;
    simd_float4 v52 = v18;
    simd_float4 v53 = v17;
    *(double *)v19.i64 = ARVisionToRenderingCoordinateTransform();
    float32x4_t v50 = v20;
    float32x4_t v51 = v19;
    float32x4_t v48 = v22;
    float32x4_t v49 = v21;
    *(double *)v23.i64 = ARRenderingToVisionCameraCoordinateTransform();
    simd_float4 v44 = v24;
    simd_float4 v45 = v23;
    simd_float4 v46 = v26;
    simd_float4 v47 = v25;
    v66.columns[1] = v54;
    v66.columns[0] = v55;
    v66.columns[3] = v52;
    v66.columns[2] = v53;
    simd_float4x4 v67 = __invert_f4(v66);
    uint64_t v27 = 0;
    simd_float4x4 v64 = v67;
    do
    {
      v65.columns[v27] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, COERCE_FLOAT(*(_OWORD *)&v64.columns[v27])), v50, *(float32x2_t *)v64.columns[v27].f32, 1), v49, (float32x4_t)v64.columns[v27], 2), v48, (float32x4_t)v64.columns[v27], 3);
      ++v27;
    }
    while (v27 != 4);
    uint64_t v28 = 0;
    float32x4_t v29 = (float32x4_t)v65.columns[0];
    float32x4_t v30 = (float32x4_t)v65.columns[1];
    float32x4_t v31 = (float32x4_t)v65.columns[2];
    float32x4_t v32 = (float32x4_t)v65.columns[3];
    v64.columns[0] = v45;
    v64.columns[1] = v44;
    v64.columns[2] = v47;
    v64.columns[3] = v46;
    do
    {
      v65.columns[v28] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)&v64.columns[v28])), v30, *(float32x2_t *)v64.columns[v28].f32, 1), v31, (float32x4_t)v64.columns[v28], 2), v32, (float32x4_t)v64.columns[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    uint64_t v33 = 0;
    simd_float4x4 v64 = v65;
    do
    {
      v65.columns[v33] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)&v64.columns[v33])), a3, *(float32x2_t *)v64.columns[v33].f32, 1), a4, (float32x4_t)v64.columns[v33], 2), a5, (float32x4_t)v64.columns[v33], 3);
      ++v33;
    }
    while (v33 != 4);
    simd_float4 v34 = v65.columns[1];
    simd_float4 v35 = v65.columns[2];
    simd_float4 v36 = v65.columns[3];
    *(simd_float4 *)&v11[1].super.isa = v65.columns[0];
    *(simd_float4 *)v11[1]._anon_10 = v34;
    *(simd_float4 *)&v11[1]._anon_10[16] = v35;
    *(simd_float4 *)&v11[1]._anon_10[32] = v36;
    float32x2_t RowMajorTransform = ARMatrix3x3MakeRowMajorTransform((float64_t *)(a7 + 96));
    *(_DWORD *)&v11->_anon_10[8] = v38;
    *(float32x2_t *)v11->_anon_10 = RowMajorTransform;
    *(_DWORD *)&v11->_anon_10[24] = v39;
    *(void *)&v11->_anon_10[16] = v40;
    *(_DWORD *)&v11->_anon_10[40] = v41;
    *(void *)&v11->_anon_10[32] = v42;
    std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&v61, v62[0]);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(ARKeyFrame *)self transform];
  id v10 = ARMatrix4x4Description(0, v6, v7, v8, v9);
  v11 = [(ARKeyFrame *)self featurePoints];
  unint64_t v12 = [v11 description];
  uint64_t v13 = [v3 stringWithFormat:@"<%@: %p transform=%@ featurePoints=%@>", v5, self, v10, v12];

  return v13;
}

- (__n128)transform
{
  return a1[4];
}

- (ARPointCloud)featurePoints
{
  return self->_featurePoints;
}

- (__n128)cameraIntrinsics
{
  return a1[1];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

- (void).cxx_destruct
{
}

@end