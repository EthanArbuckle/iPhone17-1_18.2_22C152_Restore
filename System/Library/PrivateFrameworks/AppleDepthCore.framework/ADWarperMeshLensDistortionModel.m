@interface ADWarperMeshLensDistortionModel
- (ADWarperMeshLensDistortionModel)initWithDictionary:(id)a3;
- (ADWarperMeshLensDistortionModel)initWithWarperMesh:(id)a3 type:(unint64_t)a4 width:(int64_t)a5 height:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSData)warperMesh;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation:(BOOL)a3;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
- (unint64_t)type;
- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4;
- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)x3_0 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)x3_0 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
@end

@implementation ADWarperMeshLensDistortionModel

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
  warperMesh = self->_distortMesh._warperMesh;
  self->_distortMesh._warperMesh = 0;

  v4 = self->_undistortMesh._warperMesh;
  self->_undistortMesh._warperMesh = 0;

  v5 = self->_undistortMesh._warperMesh;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  v10[0] = @"meshType";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ADWarperMeshLensDistortionModel type](self, "type", a3));
  v11[0] = v4;
  v10[1] = @"meshWidth";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[ADWarperMeshLensDistortionModel width](self, "width"));
  v11[1] = v5;
  v10[2] = @"meshHeight";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[ADWarperMeshLensDistortionModel height](self, "height"));
  v11[2] = v6;
  v10[3] = @"mesh";
  v7 = [(ADWarperMeshLensDistortionModel *)self warperMesh];
  v11[3] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (ADWarperMeshLensDistortionModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"meshType"];
  v6 = [v4 objectForKeyedSubscript:@"meshWidth"];
  v7 = [v4 objectForKeyedSubscript:@"meshHeight"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"mesh"];
  v9 = (void *)v8;
  v10 = 0;
  if (v5 && v6 && v7 && v8)
  {
    self = -[ADWarperMeshLensDistortionModel initWithWarperMesh:type:width:height:](self, "initWithWarperMesh:type:width:height:", v8, [v5 unsignedIntValue], objc_msgSend(v6, "integerValue"), objc_msgSend(v7, "integerValue"));
    v10 = self;
  }

  return v10;
}

- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4
{
  objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF488], @"warper mesh distortion model does not support rotation", 0, a4.width, a4.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4
{
  CGSize refDimensions = self->_undistortMesh._refDimensions;
  CGFloat y = a3.origin.y;
  CGFloat v6 = a3.size.width / a4.width;
  CGFloat height = a4.height;
  *(float32x2_t *)self->_anon_38 = vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_f64((float64x2_t)a3.origin, (float64x2_t)refDimensions), (float64x2_t)a4), vcvtq_f64_f32(*(float32x2_t *)self->_anon_38)));
  double v8 = a3.size.height / a4.height;
  self->_undistortMesh._refDimensions.width = v6 * refDimensions.width;
  self->_undistortMesh._refDimensions.CGFloat height = vmuld_lane_f64(v8, (float64x2_t)refDimensions, 1);
  CGSize v9 = self->_distortMesh._refDimensions;
  self[1].super.isa = (Class)vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_f64((float64x2_t)a3.origin, (float64x2_t)v9), (float64x2_t)a4), vcvtq_f64_f32((float32x2_t)self[1].super.isa)));
  self->_distortMesh._refDimensions.width = v6 * v9.width;
  self->_distortMesh._refDimensions.CGFloat height = vmuld_lane_f64(v8, (float64x2_t)v9, 1);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)x3_0 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v10 = a5;
  [v10 referenceDimensions];
  ADWarperMesh::apply(&self->_undistortMesh, a3, (float64x2_t *)x3_0, v12, (float64x2_t *)a6);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)x3_0 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v10 = a5;
  [v10 referenceDimensions];
  ADWarperMesh::apply(&self->_distortMesh, a3, (float64x2_t *)x3_0, v12, (float64x2_t *)a6);
}

- (NSData)warperMesh
{
  return self->_undistortMesh._warperMesh;
}

- (int64_t)height
{
  return *(int *)&self->_anon_38[12];
}

- (int64_t)width
{
  return *(int *)&self->_anon_38[8];
}

- (unint64_t)type
{
  return self->_undistortMesh._type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ADWarperMeshLensDistortionModel alloc];
  v5 = (void *)[(NSData *)self->_undistortMesh._warperMesh copy];
  CGFloat v6 = [(ADWarperMeshLensDistortionModel *)v4 initWithWarperMesh:v5 type:self->_undistortMesh._type width:*(int *)&self->_anon_38[8] height:*(int *)&self->_anon_38[12]];

  return v6;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ADWarperMeshLensDistortionModel type](self, "type"));
  uint64_t v4 = [v3 hash];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[ADWarperMeshLensDistortionModel width](self, "width"));
  uint64_t v6 = [v5 hash];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[ADWarperMeshLensDistortionModel height](self, "height"));
  uint64_t v8 = [v7 hash];

  CGSize v9 = [(ADWarperMeshLensDistortionModel *)self warperMesh];
  unint64_t v10 = v4 ^ (2 * v6) ^ (3 * v8) ^ (4 * [v9 hash]);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADWarperMeshLensDistortionModel *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_12;
  }
  if ([(ADWarperMeshLensDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(ADWarperMeshLensDistortionModel *)self type];
    if (v7 == [(ADWarperMeshLensDistortionModel *)v6 type]
      && (int64_t v8 = [(ADWarperMeshLensDistortionModel *)self width],
          v8 == [(ADWarperMeshLensDistortionModel *)v6 width])
      && (int64_t v9 = [(ADWarperMeshLensDistortionModel *)self height],
          v9 == [(ADWarperMeshLensDistortionModel *)v6 height]))
    {
      unint64_t v10 = [(ADWarperMeshLensDistortionModel *)self warperMesh];
      v11 = [(ADWarperMeshLensDistortionModel *)v6 warperMesh];
      char v12 = [v10 isEqualToData:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
LABEL_8:
    char v12 = 0;
  }
LABEL_12:

  return v12;
}

- (ADWarperMeshLensDistortionModel)initWithWarperMesh:(id)a3 type:(unint64_t)a4 width:(int64_t)a5 height:(int64_t)a6
{
  v108[8] = *MEMORY[0x263EF8340];
  id v11 = a3;
  char v12 = v11;
  if (!v11)
  {
    v102 = @"warperMesh cannot be nil";
    goto LABEL_63;
  }
  if ([v11 length] != 8 * a5 * a6)
  {
    v102 = @"warperMesh length should be width * height * 2 floats";
LABEL_63:
    id v103 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v102 userInfo:0];
    objc_exception_throw(v103);
  }
  v107.receiver = self;
  v107.super_class = (Class)ADWarperMeshLensDistortionModel;
  v13 = [(ADWarperMeshLensDistortionModel *)&v107 init];
  if (v13)
  {
    id v14 = v12;
    *((void *)v13 + 1) = a4;
    objc_storeStrong((id *)v13 + 4, a3);
    *((_DWORD *)v13 + 16) = a5;
    *((_DWORD *)v13 + 17) = a6;
    *((_DWORD *)v13 + 11) = 0;
    *((_DWORD *)v13 + 12) = 0;
    if (a4 == 1)
    {
      *((_DWORD *)v13 + 10) = 0;
      LODWORD(a5) = a5 - 1;
      LODWORD(a6) = a6 - 1;
    }
    else
    {
      if (a4)
      {
        id v104 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"unknown warper mesh type" userInfo:0];
        objc_exception_throw(v104);
      }
      *((_DWORD *)v13 + 10) = 1056964608;
    }
    *((double *)v13 + 2) = (double)(int)a5;
    *((double *)v13 + 3) = (double)(int)a6;

    v108[0] = 0;
    *(void *)&long long v15 = *((void *)v13 + 8);
    if ((int)v15 >= 0) {
      int v16 = *((void *)v13 + 8);
    }
    else {
      int v16 = v15 + 1;
    }
    LODWORD(v17) = v16 >> 1;
    LODWORD(v18) = v15 - 1;
    long long v105 = v15;
    int v19 = HIDWORD(*((void *)v13 + 8));
    v108[1] = (v16 >> 1);
    v108[2] = (v15 - 1);
    if ((SDWORD1(v15) & 0x80000000) == 0) {
      int v20 = DWORD1(v15);
    }
    else {
      int v20 = DWORD1(v15) + 1;
    }
    LODWORD(v21) = 0;
    LODWORD(v22) = 0;
    *(void *)((char *)&v22 + 4) = (v20 >> 1);
    LODWORD(v23) = v15 - 1;
    HIDWORD(v23) = v20 >> 1;
    v108[3] = v22;
    v108[4] = v23;
    HIDWORD(v21) = v19 - 1;
    HIDWORD(v17) = v19 - 1;
    v108[5] = v21;
    v108[6] = v17;
    HIDWORD(v18) = v19 - 1;
    v108[7] = v18;
    uint64_t v24 = objc_msgSend(*((id *)v13 + 4), "bytes", v105);
    uint64_t v25 = v24;
    uint64_t v26 = 0;
    float32x2_t v27 = vcvt_f32_s32(v106);
    float32x2_t v28 = 0;
    do
    {
      float32x2_t v29 = *(float32x2_t *)(v24 + 8 * (int)(v108[v26] + HIDWORD(v108[v26]) * *((_DWORD *)v13 + 16)));
      float32x2_t v27 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, v29), (int8x8_t)v29, (int8x8_t)v27);
      float32x2_t v28 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v29, v28), (int8x8_t)v29, (int8x8_t)v28);
      ++v26;
    }
    while (v26 != 8);
    *((void *)v13 + 9) = *((void *)v13 + 1);
    *((_OWORD *)v13 + 5) = *((_OWORD *)v13 + 1);
    *((_DWORD *)v13 + 26) = *((_DWORD *)v13 + 10);
    int32x2_t v30 = vcvt_s32_f32(vneg_f32(vrndp_f32(v27)));
    *(int32x2_t *)(v13 + 108) = v30;
    __asm { FMOV            V8.2S, #1.0 }
    int32x2_t v36 = vcvt_s32_f32(vadd_f32(vadd_f32(vrndm_f32(v28), vcvt_f32_s32(v30)), _D8));
    *((int32x2_t *)v13 + 16) = v36;
    v37 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 8 * vmul_lane_s32(v36, v36, 1).i32[0]);
    objc_storeStrong((id *)v13 + 12, v37);
    id v38 = v37;
    uint64_t v39 = [v38 mutableBytes];
    int v42 = *((_DWORD *)v13 + 33);
    if (v42 >= 1)
    {
      int v43 = 0;
      int v44 = *((_DWORD *)v13 + 32);
      int32x2_t v45 = vdup_n_s32(0x7FC00000u);
      v46 = (int32x2_t *)v39;
      do
      {
        if (v44 >= 1)
        {
          for (int i = 0; i < v44; ++i)
          {
            *v46++ = v45;
            int v44 = *((_DWORD *)v13 + 32);
          }
          int v42 = *((_DWORD *)v13 + 33);
        }
        ++v43;
      }
      while (v43 < v42);
    }
    int v48 = *((_DWORD *)v13 + 17);
    if (v48 > 1)
    {
      int v49 = 0;
      int v50 = *((_DWORD *)v13 + 16);
      do
      {
        if (v50 >= 2)
        {
          int v51 = 0;
          v52 = (float32x2_t *)(v25 + 8 * v50 * v49);
          v53 = v52;
          do
          {
            float32x2_t v54 = v53[1];
            ++v53;
            float32x2_t v55 = v54;
            uint64_t v56 = v50;
            uint64_t v57 = v50 + 1;
            float32x2_t v58 = *v52;
            float32x2_t v59 = v52[v50];
            if (vcgt_f32(*v52, v59).u8[0]) {
              LODWORD(v60) = v52[v50];
            }
            else {
              LODWORD(v60) = *(float32x2_t *)v52->f32;
            }
            float32x2_t v61 = v52[v57];
            v58.i32[0] = HIDWORD(*(unint64_t *)v52);
            if (v55.f32[1] < v58.f32[1]) {
              v58.f32[0] = v55.f32[1];
            }
            int v62 = vcvtps_s32_f32(v58.f32[0]);
            LODWORD(v63) = HIDWORD(*(void *)&v52[v57]);
            if (v59.f32[1] >= v61.f32[1]) {
              LODWORD(v63) = HIDWORD(*(void *)&v52[v50]);
            }
            signed int v64 = vcvtms_s32_f32(v63);
            if (v62 <= v64)
            {
              signed int v65 = vcvtps_s32_f32(v60);
              if (vcgt_f32(v61, v55).u8[0]) {
                v55.i32[0] = (__int32)v52[v57];
              }
              signed int v66 = vcvtms_s32_f32(v55.f32[0]);
              v55.f32[0] = (float)v51;
              v67.f32[0] = (float)v51;
              v67.f32[1] = (float)v49;
              int32x2_t v68 = (int32x2_t)vadd_f32(v67, (float32x2_t)0x3F80000000000000);
              int32x2_t v69 = (int32x2_t)vadd_f32(v67, (float32x2_t)1065353216);
              *(int32x2_t *)v71.f32 = vzip1_s32((int32x2_t)v55, v69);
              v70.i32[1] = v69.i32[1];
              v70.f32[0] = (float)v49;
              *(int32x2_t *)&v70.u32[2] = vdup_lane_s32(v68, 1);
              *(int32x2_t *)v72.f32 = vzip1_s32(v69, v68);
              *(int32x2_t *)&v71.u32[2] = v68;
              *(float32x2_t *)&v72.u32[2] = vadd_f32(v67, _D8);
              *(int32x2_t *)v73.f32 = vzip2_s32(v69, v68);
              *(int32x2_t *)&v73.u32[2] = vdup_lane_s32(*(int32x2_t *)&v72.u32[2], 1);
              do
              {
                if (v65 <= v66)
                {
                  float v74 = (float)v62;
                  int v75 = v65;
                  do
                  {
                    int v76 = *((_DWORD *)v13 + 27);
                    if (v75 + v76 >= 0)
                    {
                      int v77 = *((_DWORD *)v13 + 28);
                      if (((v77 + v62) & 0x80000000) == 0)
                      {
                        int v78 = *((_DWORD *)v13 + 32);
                        if (v75 + v76 < v78 && v77 + v62 < *((_DWORD *)v13 + 33))
                        {
                          uint64_t v79 = v75 + v76 + v78 * (v62 + v77);
                          float32x2_t v80 = v52[v56];
                          float32x2_t v81 = v52[1];
                          float v82 = v81.f32[1];
                          float v83 = v80.f32[1];
                          LODWORD(v84) = vsub_f32(*v52, v80).u32[0];
                          float v85 = vsub_f32(v80, v81).f32[0];
                          LODWORD(v86) = HIDWORD(*(unint64_t *)v52);
                          float v87 = 1.0 / vmlas_n_f32((float)(v86 - v83) * v85, v81.f32[1] - v83, v84);
                          float v88 = (float)v75 - v80.f32[0];
                          v41.f32[0] = (float)((float)((float)(v74 - v83) * v85)
                                             + (float)((float)(v81.f32[1] - v83) * v88))
                                     * v87;
                          if (v41.f32[0] >= -0.00001)
                          {
                            float v89 = (float)((float)((float)(v74 - v80.f32[1]) * v84)
                                        + (float)((float)(v80.f32[1] - v86) * v88))
                                * v87;
                            if (v89 >= -0.00001)
                            {
                              float v90 = 1.0 - v41.f32[0] - v89;
                              if (v90 >= -0.00001)
                              {
                                v41.f32[1] = v89;
                                v41.f32[2] = 1.0 - v41.f32[0] - v89;
                                int32x4_t v91 = (int32x4_t)vmulq_f32(v71, v41);
                                int32x4_t v92 = (int32x4_t)vmulq_f32(v70, v41);
                                *(int32x2_t *)(v39 + 8 * v79) = vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v91, 2), vadd_f32(*(float32x2_t *)v91.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v91.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2), vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v92.i8, 1))));
                                float32x2_t v81 = v52[1];
                                float32x2_t v80 = v52[v56];
                                float v83 = v80.f32[1];
                                float v82 = v81.f32[1];
                              }
                            }
                          }
                          float32x2_t v97 = v52[v57];
                          float v93 = v83 - v97.f32[1];
                          float v94 = v81.f32[0] - v97.f32[0];
                          float v95 = v97.f32[0] - v80.f32[0];
                          float v96 = 1.0
                              / (float)((float)((float)(v97.f32[0] - v80.f32[0]) * (float)(v82 - v97.f32[1]))
                                      + (float)(v93 * v94));
                          v97.f32[0] = (float)v75 - v97.f32[0];
                          v40.f32[0] = (float)((float)(v95 * (float)(v74 - v97.f32[1])) + (float)(v93 * v97.f32[0]))
                                     * v96;
                          if (v40.f32[0] >= -0.00001)
                          {
                            float v98 = (float)((float)(v94 * (float)(v74 - v97.f32[1]))
                                        + (float)((float)(v97.f32[1] - v82) * v97.f32[0]))
                                * v96;
                            if (v98 >= -0.00001)
                            {
                              float v99 = 1.0 - v40.f32[0] - v98;
                              if (v99 >= -0.00001)
                              {
                                v40.f32[1] = v98;
                                v40.f32[2] = 1.0 - v40.f32[0] - v98;
                                int32x4_t v100 = (int32x4_t)vmulq_f32(v72, v40);
                                float32x4_t v40 = vmulq_f32(v73, v40);
                                *(int32x2_t *)(v39 + 8 * v79) = vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v100, 2), vadd_f32(*(float32x2_t *)v100.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v100.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v40, 2), vadd_f32(*(float32x2_t *)v40.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.f32, 1))));
                              }
                            }
                          }
                        }
                      }
                    }
                    ++v75;
                  }
                  while (v66 + 1 != v75);
                }
              }
              while (v62++ != v64);
              int v50 = *((_DWORD *)v13 + 16);
            }
            ++v51;
            v52 = v53;
          }
          while (v51 < v50 - 1);
          int v48 = *((_DWORD *)v13 + 17);
        }
        ++v49;
      }
      while (v49 < v48 - 1);
    }
  }
  return (ADWarperMeshLensDistortionModel *)v13;
}

@end