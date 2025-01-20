@interface ARCoreRESkeletonResults
- (BOOL)isEqual:(id)a3;
- (CGSize)imageResolution;
- (NSArray)retargetedSkeletons;
- (__n128)cameraIntrinsics;
- (__n128)setCameraIntrinsics:(__n128)a3;
- (double)timestamp;
- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(uint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setImageResolution:(CGSize)a3;
- (void)setRetargetedSkeletons:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARCoreRESkeletonResults

- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(uint64_t)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v48 = a7;
  v65 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v48;
  uint64_t v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v88, 16, v48);
  if (v8)
  {
    uint64_t v9 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 identifier];
          [v65 setObject:v11 forKey:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
    }
    while (v8);
  }

  id v56 = (id)objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v49 = [a1 retargetedSkeletons];
  uint64_t v13 = [v49 countByEnumeratingWithState:&v70 objects:v87 count:16];
  if (v13)
  {
    uint64_t v51 = *(void *)v71;
    v14 = (float32x4_t *)MEMORY[0x1E4F149A0];
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v71 != v51) {
          objc_enumerationMutation(v49);
        }
        v16 = *(void **)(*((void *)&v70 + 1) + 8 * j);
        *(double *)v17.i64 = ARVisionCameraToRenderingCoordinateTransform();
        float32x4_t v61 = v18;
        float32x4_t v63 = v17;
        float32x4_t v57 = v20;
        float32x4_t v59 = v19;
        [v16 visionTransform];
        unint64_t v21 = 0;
        float32x4_t v78 = v22;
        float32x4_t v79 = v23;
        float32x4_t v80 = v24;
        float32x4_t v81 = v25;
        do
        {
          *(float32x4_t *)((char *)&v82 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(_OWORD *)((char *)&v78 + v21))), v61, *(float32x2_t *)&v78.f32[v21 / 4], 1), v59, *(float32x4_t *)((char *)&v78 + v21), 2), v57, *(float32x4_t *)((char *)&v78 + v21), 3);
          v21 += 16;
        }
        while (v21 != 64);
        unint64_t v26 = 0;
        float32x4_t v27 = v82;
        float32x4_t v28 = v83;
        float32x4_t v29 = v84;
        float32x4_t v30 = v85;
        float32x4_t v31 = v14[1];
        float32x4_t v32 = v14[2];
        float32x4_t v33 = v14[3];
        float32x4_t v78 = *v14;
        float32x4_t v79 = v31;
        float32x4_t v80 = v32;
        float32x4_t v81 = v33;
        do
        {
          *(float32x4_t *)((char *)&v82 + v26) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)((char *)&v78 + v26))), v28, *(float32x2_t *)&v78.f32[v26 / 4], 1), v29, *(float32x4_t *)((char *)&v78 + v26), 2), v30, *(float32x4_t *)((char *)&v78 + v26), 3);
          v26 += 16;
        }
        while (v26 != 64);
        unint64_t v34 = 0;
        float32x4_t v78 = v82;
        float32x4_t v79 = v83;
        float32x4_t v80 = v84;
        float32x4_t v81 = v85;
        do
        {
          *(float32x4_t *)((char *)&v82 + v34) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)((char *)&v78 + v34))), a3, *(float32x2_t *)&v78.f32[v34 / 4], 1), a4, *(float32x4_t *)((char *)&v78 + v34), 2), a5, *(float32x4_t *)((char *)&v78 + v34), 3);
          v34 += 16;
        }
        while (v34 != 64);
        double v58 = *(double *)v82.i64;
        double v60 = *(double *)v83.i64;
        double v62 = *(double *)v84.i64;
        double v64 = *(double *)v85.i64;
        v35 = [v16 identifier];
        v36 = [v65 objectForKeyedSubscript:v35];

        v37 = [ARBodyAnchor alloc];
        if (v36)
        {
          v38 = [v36 identifier];
          v39 = -[ARBodyAnchor initWithIdentifier:transform:tracked:skeletonData:](v37, "initWithIdentifier:transform:tracked:skeletonData:", v38, 1, v16, v58, v60, v62, v64);

          v40 = [v16 identifier];
          [v65 removeObjectForKey:v40];
        }
        else
        {
          v40 = [v16 identifier];
          v39 = -[ARBodyAnchor initWithIdentifier:transform:tracked:skeletonData:](v37, "initWithIdentifier:transform:tracked:skeletonData:", v40, 1, v16, v58, v60, v62, v64);
        }

        [v56 addObject:v39];
      }
      uint64_t v13 = [v49 countByEnumeratingWithState:&v70 objects:v87 count:16];
    }
    while (v13);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v41 = [v65 allValues];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v86 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v67 != v43) {
          objc_enumerationMutation(v41);
        }
        v45 = *(void **)(*((void *)&v66 + 1) + 8 * k);
        if ([v45 isTracked])
        {
          v46 = (void *)[v45 copyWithTrackedState:0];
          [v56 addObject:v46];
        }
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v86 count:16];
    }
    while (v42);
  }

  return v56;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  uint64_t v6 = [(NSArray *)self->_retargetedSkeletons copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v8 = *(_OWORD *)&self[1].super.isa;
  long long v9 = *(_OWORD *)&self[1]._imageResolution.height;
  *(_OWORD *)(v5 + 64) = *(_OWORD *)&self[1]._timestamp;
  *(_OWORD *)(v5 + 80) = v9;
  *(_OWORD *)(v5 + 48) = v8;
  *(CGSize *)(v5 + 24) = self->_imageResolution;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = (id *)v4;
    uint64_t v6 = (float32x4_t *)v5;
    BOOL v9 = *((double *)v5 + 2) == self->_timestamp
      && ([v5[1] isEqual:self->_retargetedSkeletons] & 1) == 0
      && (float32x4_t v7 = (float32x4_t)vdupq_n_s32(0x38FA0000u),
          uint32x4_t v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v7, vabdq_f32(v6[4], *(float32x4_t *)&self[1]._timestamp)), (int8x16_t)vcgeq_f32(v7, vabdq_f32(v6[3], *(float32x4_t *)&self[1].super.isa))), (int8x16_t)vcgeq_f32(v7, vabdq_f32(v6[5], *(float32x4_t *)&self[1]._imageResolution.height))), v8.i32[3] = v8.i32[2], (vminvq_u32(v8) & 0x80000000) != 0)&& *(double *)v6[2].i64 == self->_imageResolution.height&& *(double *)&v6[1].i64[1] == self->_imageResolution.width;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (__n128)cameraIntrinsics
{
  return a1[3];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (NSArray)retargetedSkeletons
{
  return self->_retargetedSkeletons;
}

- (void)setRetargetedSkeletons:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end