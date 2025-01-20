@interface ARFaceTrackingData
+ (BOOL)supportsSecureCoding;
+ (id)sharedNeutralGeometry;
- (ARFaceTrackingData)initWithCoder:(id)a3;
- (ARFaceTrackingData)initWithTrackingData:(id)a3 anchorIdentifier:(id)a4;
- (ARFaceTrackingData)initWithTrackingData:(id)a3 transformToMirrored:(BOOL)a4 anchorIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (NSDictionary)trackingData;
- (NSError)trackingError;
- (NSUUID)identifier;
- (__n128)gazePoint;
- (__n128)leftEyeTransform;
- (__n128)rightEyeTransform;
- (__n128)setLeftEyeTransform:(__n128)a3;
- (__n128)setRightEyeTransform:(__n128)a3;
- (__n128)transform;
- (const)blendShapeCoefficients;
- (double)timestamp;
- (float)tongueOut;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPrivate;
- (uint64_t)imageVertices;
- (uint64_t)normals;
- (uint64_t)vertices;
- (unint64_t)blendShapeCoefficientsCount;
- (unint64_t)normalCount;
- (unint64_t)vertexCount;
- (void)_extractMetaDataAndTransformToMirrored:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGazePoint:(ARFaceTrackingData *)self;
- (void)setTimestamp:(double)a3;
- (void)setTrackingData:(id)a3;
@end

@implementation ARFaceTrackingData

+ (id)sharedNeutralGeometry
{
  if (+[ARFaceTrackingData sharedNeutralGeometry]::onceToken != -1) {
    dispatch_once(&+[ARFaceTrackingData sharedNeutralGeometry]::onceToken, &__block_literal_global_17);
  }
  v2 = (void *)+[ARFaceTrackingData sharedNeutralGeometry]::neutralGeometry;
  return v2;
}

void __43__ARFaceTrackingData_sharedNeutralGeometry__block_invoke()
{
  v0 = [ARFaceGeometry alloc];
  uint64_t v1 = [(ARFaceGeometry *)v0 initWithBlendShapes:MEMORY[0x1E4F1CC08]];
  v2 = (void *)+[ARFaceTrackingData sharedNeutralGeometry]::neutralGeometry;
  +[ARFaceTrackingData sharedNeutralGeometry]::neutralGeometry = v1;
}

- (id)initPrivate
{
  v8.receiver = self;
  v8.super_class = (Class)ARFaceTrackingData;
  v2 = [(ARFaceTrackingData *)&v8 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    normalsSemaphore = v2->_normalsSemaphore;
    v2->_normalsSemaphore = (OS_dispatch_semaphore *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
    imageVerticesSemaphore = v2->_imageVerticesSemaphore;
    v2->_imageVerticesSemaphore = (OS_dispatch_semaphore *)v5;
  }
  return v2;
}

- (ARFaceTrackingData)initWithTrackingData:(id)a3 anchorIdentifier:(id)a4
{
  return [(ARFaceTrackingData *)self initWithTrackingData:a3 transformToMirrored:0 anchorIdentifier:a4];
}

- (ARFaceTrackingData)initWithTrackingData:(id)a3 transformToMirrored:(BOOL)a4 anchorIdentifier:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v11 = [(ARFaceTrackingData *)self initPrivate];
  v12 = (ARFaceTrackingData *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 28, a3);
    objc_storeStrong((id *)&v12->_anchorIdentifier, a5);
    [(ARFaceTrackingData *)v12 _extractMetaDataAndTransformToMirrored:v6];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initPrivate");
  objc_storeStrong((id *)(v4 + 224), self->_trackingData);
  objc_storeStrong((id *)(v4 + 192), self->_anchorIdentifier);
  objc_storeStrong((id *)(v4 + 208), self->_trackingError);
  long long v5 = *(_OWORD *)self->_anon_70;
  long long v6 = *(_OWORD *)&self->_anon_70[16];
  long long v7 = *(_OWORD *)&self->_anon_70[48];
  *(_OWORD *)(v4 + 144) = *(_OWORD *)&self->_anon_70[32];
  *(_OWORD *)(v4 + 160) = v7;
  *(_OWORD *)(v4 + 112) = v5;
  *(_OWORD *)(v4 + 128) = v6;
  if ((ARFaceTrackingData *)v4 != self)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v4 + 8), (char *)self->_meshVertices.var0, *(void *)self->_anon_10, (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) >> 4);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(v4 + 80), (char *)self->_blendShapeCoefficients.__begin_, (uint64_t)self->_blendShapeCoefficients.__end_, self->_blendShapeCoefficients.__end_ - self->_blendShapeCoefficients.__begin_);
  }
  long long v8 = *(_OWORD *)self->_anon_100;
  long long v9 = *(_OWORD *)&self->_anon_100[16];
  long long v10 = *(_OWORD *)&self->_anon_100[48];
  *(_OWORD *)(v4 + 288) = *(_OWORD *)&self->_anon_100[32];
  *(_OWORD *)(v4 + 304) = v10;
  *(_OWORD *)(v4 + 256) = v8;
  *(_OWORD *)(v4 + 272) = v9;
  long long v11 = *(_OWORD *)&self[1].super.isa;
  long long v12 = *(_OWORD *)self[1]._anon_10;
  long long v13 = *(_OWORD *)&self[1]._anon_20[16];
  *(_OWORD *)(v4 + 352) = *(_OWORD *)self[1]._anon_20;
  *(_OWORD *)(v4 + 368) = v13;
  *(_OWORD *)(v4 + 320) = v11;
  *(_OWORD *)(v4 + 336) = v12;
  *(_OWORD *)(v4 + 240) = *(_OWORD *)self->_gazePoint;
  *(float *)(v4 + 200) = self->_tongueOut;
  *(double *)(v4 + 216) = self->_timestamp;
  return (id)v4;
}

- (BOOL)isValid
{
  dispatch_semaphore_t v3 = [(ARFaceTrackingData *)self trackingData];
  uint64_t v4 = *MEMORY[0x1E4F4D6E8];
  long long v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4D6E8]];

  if (v5)
  {
    long long v6 = [(ARFaceTrackingData *)self trackingData];
    long long v7 = [v6 objectForKeyedSubscript:v4];
    uint64_t v8 = *MEMORY[0x1E4F4D738];
    long long v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4D738]];

    if (v9)
    {
      long long v10 = [(ARFaceTrackingData *)self trackingData];
      long long v11 = [v10 objectForKeyedSubscript:v4];
      long long v12 = [v11 objectForKeyedSubscript:v8];
      uint64_t v13 = *MEMORY[0x1E4F4D7A8];
      v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4D7A8]];

      if (v14)
      {
        v15 = [(ARFaceTrackingData *)self trackingData];
        v16 = [v15 objectForKeyedSubscript:v4];
        v17 = [v16 objectForKeyedSubscript:v8];
        uint64_t v18 = *MEMORY[0x1E4F4D7D0];
        v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F4D7D0]];

        if (v19)
        {
          v20 = [(ARFaceTrackingData *)self trackingData];
          v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F4D7B8]];

          if (!v21) {
            goto LABEL_15;
          }
          uint64_t v22 = *MEMORY[0x1E4F4D798];
          v23 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F4D798]];

          if (!v23) {
            goto LABEL_15;
          }
          v24 = [v21 objectForKeyedSubscript:v22];
          v25 = [v24 objectForKeyedSubscript:v13];

          if (!v25) {
            goto LABEL_15;
          }
          v26 = [v21 objectForKeyedSubscript:v22];
          v27 = [v26 objectForKeyedSubscript:v18];

          if (v27)
          {
            uint64_t v28 = *MEMORY[0x1E4F4D750];
            v29 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F4D750]];

            if (!v29) {
              goto LABEL_15;
            }
            v30 = [v21 objectForKeyedSubscript:v28];
            v27 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F4D768]];

            if (v27)
            {
              v27 = (void *)*MEMORY[0x1E4F4D690];
              v31 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F4D690]];

              if (v31)
              {
                v32 = [v21 objectForKeyedSubscript:v27];
                v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F4D698]];
                LOBYTE(v27) = v33 != 0;

                goto LABEL_16;
              }
LABEL_15:
              LOBYTE(v27) = 0;
            }
          }
LABEL_16:

          return (char)v27;
        }
      }
    }
  }
  LOBYTE(v27) = 0;
  return (char)v27;
}

- (void)_extractMetaDataAndTransformToMirrored:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(ARFaceTrackingData *)self trackingData];
  uint64_t v6 = *MEMORY[0x1E4F4D748];
  long long v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4D748]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v9 = [(ARFaceTrackingData *)self trackingData];
    long long v10 = [v9 objectForKeyedSubscript:v6];

    long long v11 = objc_opt_new();
    long long v12 = ARKitCoreBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"Face tracking failed." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    [v11 setObject:v10 forKeyedSubscript:v6];
    v14 = MEMORY[0x1BA9C4C60]([v10 integerValue]);
    if (v14)
    {
      [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    else
    {
      v16 = ARKitCoreBundle();
      v17 = [v16 localizedStringForKey:@"An unknown error occurred" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    }
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.arkit.error" code:1002 userInfo:v11];
    trackingError = self->_trackingError;
    self->_trackingError = v15;
  }
  v19 = [(ARFaceTrackingData *)self trackingData];
  v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F4D7B8]];

  if (v20)
  {
    uint64_t v21 = *MEMORY[0x1E4F4D798];
    v190 = v20;
    uint64_t v22 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F4D798]];
    uint64_t v23 = *MEMORY[0x1E4F4D7A8];
    v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F4D7A8]];
    ARMatrix3x3FromArray(v24);

    v25 = [v20 objectForKeyedSubscript:v21];
    uint64_t v26 = *MEMORY[0x1E4F4D7D0];
    v27 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F4D7D0]];
    float32x2_t v180 = (float32x2_t)ARVector3FromArray(v27).n128_u64[0];

    ARVector3ScalarMultiplication(v180, 0.001);
    ARMatrix4x4FromRotationAndTranslation();
    long long v187 = (__int128)v29;
    float32x4_t v191 = v31;
    if (v3)
    {
      *(double *)&long long v32 = AREulerAnglesFromMatrix(v28, v29, v30);
      long long v188 = v32;
      __float2 v33 = __sincosf_stret(-0.5 * *(float *)&v32);
      float32x4_t v34 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, v33.__sinval);
      v34.i32[3] = LODWORD(v33.__cosval);
      *(__n64 *)v35.f32 = simd_matrix3x3(v34);
      float32x4_t v181 = v36;
      float32x4_t v184 = v35;
      float32x4_t v177 = v37;
      __float2 v38 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)&v188, 1));
      float32x4_t v39 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v38.__sinval);
      v39.i32[3] = LODWORD(v38.__cosval);
      *(__n64 *)v40.f32 = simd_matrix3x3(v39);
      float32x4_t v172 = v41;
      float32x4_t v174 = v40;
      float32x4_t v170 = v42;
      __float2 v43 = __sincosf_stret((float)(*((float *)&v188 + 2) + 3.1416) * 0.5);
      float32x4_t v44 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B270, v43.__sinval);
      v44.i32[3] = LODWORD(v43.__cosval);
      *(__n64 *)v45.f32 = simd_matrix3x3(v44);
      uint64_t v46 = 0;
      v45.i32[3] = 0;
      HIDWORD(v47) = 0;
      v48.i32[3] = 0;
      float32x4_t v193 = v45;
      long long v194 = v47;
      float32x4_t v195 = v48;
      do
      {
        *(float32x4_t *)((char *)&v197 + v46 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v174, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v46 * 4))), v172, *(float32x2_t *)&v193.f32[v46], 1), v170, *(float32x4_t *)((char *)&v193 + v46 * 4), 2);
        v46 += 4;
      }
      while (v46 != 12);
      uint64_t v49 = 0;
      float32x4_t v193 = v197;
      long long v194 = v198;
      float32x4_t v195 = v199;
      do
      {
        *(float32x4_t *)((char *)&v197 + v49 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v184, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v49 * 4))), v181, *(float32x2_t *)&v193.f32[v49], 1), v177, *(float32x4_t *)((char *)&v193 + v49 * 4), 2);
        v49 += 4;
      }
      while (v49 != 12);
      ARMatrix4x4FromRotationAndTranslation();
      unint64_t v50 = 0;
      float32x4_t v51 = *(float32x4_t *)MEMORY[0x1E4F149A0];
      float32x4_t v52 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32);
      float32x4_t v53 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
      float32x4_t v193 = v54;
      long long v194 = v55;
      float32x4_t v195 = v56;
      float32x4_t v196 = v57;
      do
      {
        *(float32x4_t *)((char *)&v197 + v50) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v50))), (float32x4_t)xmmword_1B8A2B3E0, *(float32x2_t *)&v193.f32[v50 / 4], 1), v52, *(float32x4_t *)((char *)&v193 + v50), 2), v53, *(float32x4_t *)((char *)&v193 + v50), 3);
        v50 += 16;
      }
      while (v50 != 64);
      unint64_t v58 = 0;
      float32x4_t v59 = v197;
      float32x4_t v60 = (float32x4_t)v198;
      float32x4_t v61 = v199;
      float32x4_t v62 = v200;
      float32x4_t v193 = v51;
      long long v194 = xmmword_1B8A2B3E0;
      float32x4_t v195 = v52;
      float32x4_t v196 = v53;
      do
      {
        *(float32x4_t *)((char *)&v197 + v58) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v58))), v60, *(float32x2_t *)&v193.f32[v58 / 4], 1), v61, *(float32x4_t *)((char *)&v193 + v58), 2), v62, *(float32x4_t *)((char *)&v193 + v58), 3);
        v58 += 16;
      }
      while (v58 != 64);
      long long v187 = v198;
      __n128 v182 = (__n128)v197;
      __n128 v185 = (__n128)v199;
      float32x4_t v191 = v200;
    }
    else
    {
      __n128 v182 = v28;
      __n128 v185 = v30;
    }
    v63 = [(ARFaceTrackingData *)self trackingData];
    uint64_t v64 = *MEMORY[0x1E4F4D6E8];
    v65 = [v63 objectForKeyedSubscript:*MEMORY[0x1E4F4D6E8]];
    uint64_t v66 = *MEMORY[0x1E4F4D738];
    v67 = [v65 objectForKeyedSubscript:*MEMORY[0x1E4F4D738]];
    v68 = [v67 objectForKeyedSubscript:v23];
    ARMatrix3x3FromArray(v68);

    v69 = [(ARFaceTrackingData *)self trackingData];
    v70 = [v69 objectForKeyedSubscript:v64];
    v71 = [v70 objectForKeyedSubscript:v66];
    v72 = [v71 objectForKeyedSubscript:v26];
    float32x2_t v171 = (float32x2_t)ARVector3FromArray(v72).n128_u64[0];

    ARVector3ScalarMultiplication(v171, 0.001);
    ARMatrix4x4FromRotationAndTranslation();
    unint64_t v77 = 0;
    float32x4_t v193 = (float32x4_t)v182;
    long long v194 = v187;
    float32x4_t v195 = (float32x4_t)v185;
    float32x4_t v196 = v191;
    do
    {
      *(float32x4_t *)((char *)&v197 + v77) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v77))), v74, *(float32x2_t *)&v193.f32[v77 / 4], 1), v75, *(float32x4_t *)((char *)&v193 + v77), 2), v76, *(float32x4_t *)((char *)&v193 + v77), 3);
      v77 += 16;
    }
    while (v77 != 64);
    unint64_t v78 = 0;
    float32x4_t v193 = v197;
    long long v194 = v198;
    float32x4_t v195 = v199;
    float32x4_t v196 = v200;
    do
    {
      *(float32x4_t *)((char *)&v197 + v78) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v78))), (float32x4_t)xmmword_1B8A2B3E0, *(float32x2_t *)&v193.f32[v78 / 4], 1), (float32x4_t)xmmword_1B8A2B0E0, *(float32x4_t *)((char *)&v193 + v78), 2), (float32x4_t)xmmword_1B8A2B050, *(float32x4_t *)((char *)&v193 + v78), 3);
      v78 += 16;
    }
    while (v78 != 64);
    long long v79 = v198;
    float32x4_t v80 = v199;
    float32x4_t v81 = v200;
    *(float32x4_t *)self->_anon_70 = v197;
    *(_OWORD *)&self->_anon_70[16] = v79;
    *(float32x4_t *)&self->_anon_70[32] = v80;
    *(float32x4_t *)&self->_anon_70[48] = v81;
    uint64_t v82 = *MEMORY[0x1E4F4D750];
    v83 = [v190 objectForKeyedSubscript:*MEMORY[0x1E4F4D750]];
    uint64_t v192 = v82;
    v84 = self;
    v85 = [v83 objectForKeyedSubscript:*MEMORY[0x1E4F4D768]];

    unint64_t v86 = (int)[v85 length];
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_meshVertices, (int)(v86 / 0xC));
    id v189 = v85;
    uint64_t v87 = [v189 bytes];
    if ((int)(v86 / 0xC) >= 1)
    {
      uint64_t v89 = 0;
      float32x4_t v91 = *(float32x4_t *)(MEMORY[0x1E4F14998] + 16);
      float32x4_t v90 = *(float32x4_t *)(MEMORY[0x1E4F14998] + 32);
      v92 = (float *)(v87 + 4);
      do
      {
        v88.f32[0] = *(v92 - 1) / 1000.0;
        float32x4_t v93 = v88;
        v93.f32[1] = *v92 / 1000.0;
        float32x4_t v94 = v93;
        v94.f32[2] = v92[1] / 1000.0;
        if (v3)
        {
          float32x4_t v88 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B8A2B3D0, v88.f32[0]), v91, *(float32x2_t *)v93.f32, 1), v90, v94, 2);
          float32x4_t v94 = v88;
        }
        *(float32x4_t *)&self->_meshVertices.var0[v89] = v94;
        v92 += 3;
        v89 += 2;
      }
      while (2 * (v86 / 0xC) != v89);
    }
    uint64_t v95 = *MEMORY[0x1E4F4D690];
    v96 = [v190 objectForKeyedSubscript:*MEMORY[0x1E4F4D690]];
    v97 = [v96 objectForKeyedSubscript:*MEMORY[0x1E4F4D698]];

    unint64_t v98 = objc_msgSend(v97, "length", v97);
    id v186 = v97;
    v99 = (const void *)[v186 bytes];
    float32x4_t v197 = 0uLL;
    *(void *)&long long v198 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v197, v99, (uint64_t)v99 + ((uint64_t)(v98 >> 2 << 32) >> 30), (int)(v98 >> 2));
    p_blendShapeCoefficients = &v84->_blendShapeCoefficients;
    begin = v84->_blendShapeCoefficients.__begin_;
    if (begin)
    {
      v84->_blendShapeCoefficients.__end_ = begin;
      operator delete(begin);
      p_blendShapeCoefficients->__begin_ = 0;
      v84->_blendShapeCoefficients.__end_ = 0;
      v84->_blendShapeCoefficients.__end_cap_.__value_ = 0;
    }
    *(float32x4_t *)&v84->_blendShapeCoefficients.__begin_ = v197;
    v84->_blendShapeCoefficients.__end_cap_.__value_ = (float *)v198;
    if (v3)
    {
      v102 = +[ARFaceAnchor blendShapeToMirroredBlendShapeMapping];
      if ((int)(v98 >> 2) >= 1)
      {
        uint64_t v103 = 0;
        uint64_t v104 = (v98 >> 2);
        do
        {
          v105 = [NSNumber numberWithInt:v103];
          v106 = [v102 objectForKeyedSubscript:v105];
          int v107 = [v106 integerValue];

          p_blendShapeCoefficients->__begin_[v107] = *((float *)v99 + v103++);
        }
        while (v104 != v103);
      }
    }
    v20 = v190;
    v108 = [v190 objectForKeyedSubscript:v192];
    v109 = [v108 objectForKeyedSubscript:*MEMORY[0x1E4F4D758]];
    ARVector3FromArray(v109);

    v110 = [v190 objectForKeyedSubscript:v95];
    v111 = [v110 objectForKeyedSubscript:*MEMORY[0x1E4F4D6B0]];
    [v111 floatValue];
    float v113 = v112;

    v114 = [v190 objectForKeyedSubscript:v95];
    v115 = [v114 objectForKeyedSubscript:*MEMORY[0x1E4F4D6A8]];
    [v115 floatValue];
    float v117 = v116;

    __float2 v118 = __sincosf_stret(v113 * 0.5);
    float32x4_t v119 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v118.__sinval);
    v119.i32[3] = LODWORD(v118.__cosval);
    *(__n64 *)v120.f32 = simd_matrix3x3(v119);
    v120.i32[3] = 0;
    HIDWORD(v121) = 0;
    long long v173 = v121;
    float32x4_t v175 = v120;
    v122.i32[3] = 0;
    float32x4_t v178 = v122;
    __float2 v123 = __sincosf_stret(v117 * 0.5);
    float32x4_t v124 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, v123.__sinval);
    v124.i32[3] = LODWORD(v123.__cosval);
    *(__n64 *)v125.f32 = simd_matrix3x3(v124);
    uint64_t v128 = 0;
    float32x4_t v193 = v175;
    long long v194 = v173;
    float32x4_t v195 = v178;
    do
    {
      *(float32x4_t *)((char *)&v197 + v128 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v128 * 4))), v126, *(float32x2_t *)&v193.f32[v128], 1), v127, *(float32x4_t *)((char *)&v193 + v128 * 4), 2);
      v128 += 4;
    }
    while (v128 != 12);
    ARMatrix4x4FromRotationAndTranslation();
    *(_OWORD *)v84->_anon_100 = v129;
    *(_OWORD *)&v84->_anon_100[16] = v130;
    *(_OWORD *)&v84->_anon_100[32] = v131;
    *(_OWORD *)&v84->_anon_100[48] = v132;
    v133 = [v190 objectForKeyedSubscript:v192];
    v134 = [v133 objectForKeyedSubscript:*MEMORY[0x1E4F4D760]];
    ARVector3FromArray(v134);

    v135 = [v190 objectForKeyedSubscript:v95];
    v136 = [v135 objectForKeyedSubscript:*MEMORY[0x1E4F4D6C0]];
    [v136 floatValue];
    float v138 = v137;

    v139 = [v190 objectForKeyedSubscript:v95];
    v140 = [v139 objectForKeyedSubscript:*MEMORY[0x1E4F4D6B8]];
    [v140 floatValue];
    float v142 = v141;

    __float2 v143 = __sincosf_stret(v138 * 0.5);
    float32x4_t v144 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v143.__sinval);
    v144.i32[3] = LODWORD(v143.__cosval);
    *(__n64 *)v145.f32 = simd_matrix3x3(v144);
    v145.i32[3] = 0;
    HIDWORD(v146) = 0;
    long long v176 = v146;
    float32x4_t v179 = v145;
    v147.i32[3] = 0;
    float32x4_t v183 = v147;
    __float2 v148 = __sincosf_stret(v142 * 0.5);
    float32x4_t v149 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0C0, v148.__sinval);
    v149.i32[3] = LODWORD(v148.__cosval);
    *(__n64 *)v150.f32 = simd_matrix3x3(v149);
    uint64_t v153 = 0;
    float32x4_t v193 = v179;
    long long v194 = v176;
    float32x4_t v195 = v183;
    do
    {
      *(float32x4_t *)((char *)&v197 + v153 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v150, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v153 * 4))), v151, *(float32x2_t *)&v193.f32[v153], 1), v152, *(float32x4_t *)((char *)&v193 + v153 * 4), 2);
      v153 += 4;
    }
    while (v153 != 12);
    ARMatrix4x4FromRotationAndTranslation();
    *(_OWORD *)&v84[1].super.isa = v154;
    *(_OWORD *)v84[1]._anon_10 = v155;
    *(_OWORD *)v84[1]._anon_20 = v156;
    *(_OWORD *)&v84[1]._anon_20[16] = v157;
    v158 = [v190 objectForKeyedSubscript:v95];
    v159 = [v158 objectForKeyedSubscript:*MEMORY[0x1E4F4D6A0]];

    if ([v159 count]) {
      *(float32x4_t *)v84->_gazePoint = vdivq_f32((float32x4_t)ARVector3FromArray(v159), (float32x4_t)vdupq_n_s32(0x447A0000u));
    }
    v160 = [v190 objectForKeyedSubscript:v95];
    uint64_t v161 = *MEMORY[0x1E4F4D6C8];
    v162 = [v160 objectForKeyedSubscript:*MEMORY[0x1E4F4D6C8]];

    if (v162)
    {
      v163 = [v190 objectForKeyedSubscript:v95];
      v164 = [v163 objectForKeyedSubscript:v161];
      [v164 floatValue];
      v84->_tongueOut = v165;
    }
    uint64_t v166 = *MEMORY[0x1E4F4D7C0];
    v167 = [v190 objectForKeyedSubscript:*MEMORY[0x1E4F4D7C0]];

    if (v167)
    {
      v168 = [v190 objectForKeyedSubscript:v166];
      [v168 doubleValue];
      v84->_timestamp = v169;
    }
  }
}

- (NSUUID)identifier
{
  return self->_anchorIdentifier;
}

- (__n128)transform
{
  return a1[7];
}

- (unint64_t)vertexCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) >> 4;
}

- (uint64_t)vertices
{
  return *(void *)(a1 + 8);
}

- (unint64_t)blendShapeCoefficientsCount
{
  return self->_blendShapeCoefficients.__end_ - self->_blendShapeCoefficients.__begin_;
}

- (const)blendShapeCoefficients
{
  return self->_blendShapeCoefficients.__begin_;
}

- (unint64_t)normalCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) >> 4;
}

- (uint64_t)normals
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 176), 0xFFFFFFFFFFFFFFFFLL);
  v2 = (void **)(a1 + 56);
  if (*(void *)(a1 + 64) - *(void *)(a1 + 56) != *(void *)(a1 + 16) - *(void *)(a1 + 8))
  {
    kdebug_trace();
    BOOL v3 = +[ARFaceTrackingData sharedNeutralGeometry];
    uint64_t v4 = [v3 triangleIndices];
    uint64_t v5 = [(id)a1 vertices];
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v20, (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 4);
    uint64_t v6 = *v2;
    if (*v2)
    {
      *(void *)(a1 + 64) = v6;
      operator delete(v6);
      ARFaceTrackingData *v2 = 0;
      *(void *)(a1 + 64) = 0;
      *(void *)(a1 + 72) = 0;
    }
    unsigned int v7 = 0;
    unint64_t v8 = 0;
    *(_OWORD *)(a1 + 56) = v20;
    *(void *)(a1 + 72) = v21;
    while ([v3 triangleCount] > v8)
    {
      uint64_t v9 = *(__int16 *)(v4 + 2 * v7);
      uint64_t v10 = *(__int16 *)(v4 + 2 * (v7 + 1));
      uint64_t v11 = *(__int16 *)(v4 + 2 * (v7 + 2));
      float32x4_t v12 = *(float32x4_t *)(v5 + 16 * v9);
      float32x4_t v13 = vsubq_f32(*(float32x4_t *)(v5 + 16 * v10), v12);
      float32x4_t v14 = vsubq_f32(*(float32x4_t *)(v5 + 16 * v11), v12);
      float32x4_t v15 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), (int8x16_t)v14, 0xCuLL), vnegq_f32(v13)), v14, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL));
      int32x4_t v16 = (int32x4_t)vmulq_f32(v15, v15);
      v16.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), *(float32x2_t *)v16.i8)).u32[0];
      float32x4_t v17 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL);
      *(float32x2_t *)v15.f32 = vrsqrte_f32((float32x2_t)v16.u32[0]);
      *(float32x2_t *)v15.f32 = vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32)));
      float32x4_t v18 = vmulq_n_f32(v17, vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32))).f32[0]);
      *((float32x4_t *)*v2 + v9) = vaddq_f32(*((float32x4_t *)*v2 + v9), v18);
      *((float32x4_t *)*v2 + v10) = vaddq_f32(v18, *((float32x4_t *)*v2 + v10));
      *((float32x4_t *)*v2 + v11) = vaddq_f32(v18, *((float32x4_t *)*v2 + v11));
      ++v8;
      v7 += 3;
    }
    kdebug_trace();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 176));
  return *(void *)(a1 + 56);
}

- (uint64_t)imageVertices
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 184), 0xFFFFFFFFFFFFFFFFLL);
  v2 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40) - *(void *)(a1 + 32);
  if ([(id)a1 vertexCount] == v3 >> 3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 184));
    return *(void *)(a1 + 32);
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(buf, [(id)a1 vertexCount]);
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      *(void *)(a1 + 40) = v5;
      operator delete(v5);
      void *v2 = 0;
      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
    }
    *(_OWORD *)(a1 + 32) = *(_OWORD *)buf;
    *(void *)(a1 + 48) = *(void *)&buf[16];
    uint64_t v6 = [(id)a1 trackingData];
    unsigned int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4D7B8]];

    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F4D798];
      uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4D798]];
      uint64_t v10 = *MEMORY[0x1E4F4D7A8];
      uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4D7A8]];
      ARMatrix3x3FromArray(v11);

      float32x4_t v12 = [v7 objectForKeyedSubscript:v8];
      uint64_t v13 = *MEMORY[0x1E4F4D7D0];
      float32x4_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F4D7D0]];
      float32x2_t v56 = (float32x2_t)ARVector3FromArray(v14).n128_u64[0];

      ARVector3ScalarMultiplication(v56, 0.001);
      ARMatrix4x4FromRotationAndTranslation();
      long long v57 = v16;
      long long v59 = v15;
      long long v61 = v18;
      long long v63 = v17;
      v19 = [(id)a1 trackingData];
      uint64_t v20 = *MEMORY[0x1E4F4D6E8];
      uint64_t v21 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F4D6E8]];
      uint64_t v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F4D770]];
      __n128 v23 = ARMatrix3x3FromArray(v22);
      float32x4_t v54 = v24;
      float32x4_t v55 = (float32x4_t)v23;
      float32x4_t v53 = v25;

      uint64_t v26 = [(id)a1 trackingData];
      v27 = [v26 objectForKeyedSubscript:v20];
      uint64_t v28 = *MEMORY[0x1E4F4D738];
      __n128 v29 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F4D738]];
      __n128 v30 = [v29 objectForKeyedSubscript:v10];
      ARMatrix3x3FromArray(v30);

      float32x4_t v31 = [(id)a1 trackingData];
      long long v32 = [v31 objectForKeyedSubscript:v20];
      __float2 v33 = [v32 objectForKeyedSubscript:v28];
      float32x4_t v34 = [v33 objectForKeyedSubscript:v13];
      __n128 v52 = ARVector3FromArray(v34);

      ARVector3ScalarMultiplication((float32x2_t)v52.n128_u64[0], 0.001);
      ARMatrix4x4FromRotationAndTranslation();
      uint64_t v35 = 0;
      long long v65 = v36;
      long long v66 = v37;
      long long v67 = v38;
      long long v68 = v39;
      do
      {
        *(float32x4_t *)&buf[v35] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v55, COERCE_FLOAT(*(long long *)((char *)&v65 + v35))), v54, *(float32x2_t *)((char *)&v65 + v35), 1), v53, *(float32x4_t *)((char *)&v65 + v35), 2), (float32x4_t)0, *(float32x4_t *)((char *)&v65 + v35), 3);
        v35 += 16;
      }
      while (v35 != 64);
      uint64_t v40 = 0;
      float32x4_t v41 = *(float32x4_t *)buf;
      float32x4_t v42 = *(float32x4_t *)&buf[16];
      float32x4_t v43 = v70;
      float32x4_t v44 = v71;
      long long v65 = v59;
      long long v66 = v57;
      long long v67 = v63;
      long long v68 = v61;
      do
      {
        *(float32x4_t *)&buf[v40] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, COERCE_FLOAT(*(long long *)((char *)&v65 + v40))), v42, *(float32x2_t *)((char *)&v65 + v40), 1), v43, *(float32x4_t *)((char *)&v65 + v40), 2), v44, *(float32x4_t *)((char *)&v65 + v40), 3);
        v40 += 16;
      }
      while (v40 != 64);
      unint64_t v45 = 0;
      float32x4_t v62 = *(float32x4_t *)&buf[16];
      float32x4_t v64 = *(float32x4_t *)buf;
      float32x4_t v58 = v71;
      float32x4_t v60 = v70;
      while (objc_msgSend((id)a1, "vertexCount", *(_OWORD *)&v52) > v45)
      {
        uint64_t v46 = [(id)a1 vertices];
        int32x4_t v47 = (int32x4_t)vaddq_f32(v58, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)(v46 + 16 * v45))), v62, *(float32x2_t *)(v46 + 16 * v45), 1), v60, *(float32x4_t *)(v46 + 16 * v45), 2));
        *(float32x2_t *)(*v2 + 8 * v45++) = vdiv_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_laneq_s32(v47, 2));
      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 184));
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      if (_ARLogGeneral(void)::onceToken != -1) {
        dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_256);
      }
      float32x4_t v48 = (id)_ARLogGeneral(void)::logObj;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = (objc_class *)objc_opt_class();
        unint64_t v50 = NSStringFromClass(v49);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a1;
        _os_log_impl(&dword_1B88A2000, v48, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No smoothed data available in tracking data", buf, 0x16u);
      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 184));
      uint64_t v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_trackingData forKey:@"trackingData"];
  [v4 encodeObject:self->_anchorIdentifier forKey:@"anchorIdentifier"];
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
}

- (ARFaceTrackingData)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"trackingData"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"trackingData"];
    float32x4_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchorIdentifier"];
    anchorIdentifier = self->_anchorIdentifier;
    self->_anchorIdentifier = v12;

    float32x4_t v14 = [(ARFaceTrackingData *)self initWithTrackingData:v11 anchorIdentifier:self->_anchorIdentifier];
    if (v14)
    {
      [v4 decodeDoubleForKey:@"timestamp"];
      v14->_timestamp = v15;
    }
    long long v16 = v14;
  }
  else
  {
    long long v17 = [(ARFaceTrackingData *)self initPrivate];
    if (v17)
    {
      long long v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vertexData"];
      v19 = v18;
      if (v18)
      {
        uint64_t v20 = [v18 length];
        uint64_t v21 = (const void *)[v19 bytes];
        long long v53 = 0uLL;
        uint64_t v54 = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v53, v21, (uint64_t)v21 + 16 * (int)((unint64_t)v20 >> 4), (int)(v20 >> 4));
        uint64_t v22 = (void *)*((void *)v17 + 1);
        if (v22)
        {
          *((void *)v17 + 2) = v22;
          operator delete(v22);
          *((void *)v17 + 1) = 0;
          *((void *)v17 + 2) = 0;
          *((void *)v17 + 3) = 0;
        }
        *(_OWORD *)(v17 + 8) = v53;
        *((void *)v17 + 3) = v54;
      }
      __n128 v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vertexData2D"];
      float32x4_t v24 = v23;
      if (v23)
      {
        uint64_t v25 = [v23 length];
        uint64_t v26 = (const void *)[v24 bytes];
        long long v53 = 0uLL;
        uint64_t v54 = 0;
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v53, v26, (uint64_t)v26 + 8 * (int)((unint64_t)v25 >> 3), (int)(v25 >> 3));
        v27 = (void *)*((void *)v17 + 4);
        if (v27)
        {
          *((void *)v17 + 5) = v27;
          operator delete(v27);
          *((void *)v17 + 4) = 0;
          *((void *)v17 + 5) = 0;
          *((void *)v17 + 6) = 0;
        }
        *((_OWORD *)v17 + 2) = v53;
        *((void *)v17 + 6) = v54;
      }
      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"normalsData"];
      __n128 v29 = v28;
      if (v28)
      {
        uint64_t v30 = [v28 length];
        float32x4_t v31 = (const void *)[v29 bytes];
        long long v53 = 0uLL;
        uint64_t v54 = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v53, v31, (uint64_t)v31 + 16 * (int)((unint64_t)v30 >> 4), (int)(v30 >> 4));
        long long v32 = (void *)*((void *)v17 + 7);
        if (v32)
        {
          *((void *)v17 + 8) = v32;
          operator delete(v32);
          *((void *)v17 + 7) = 0;
          *((void *)v17 + 8) = 0;
          *((void *)v17 + 9) = 0;
        }
        *(_OWORD *)(v17 + 56) = v53;
        *((void *)v17 + 9) = v54;
      }
      __float2 v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendShapeCoefficientsData"];
      float32x4_t v34 = v33;
      if (v33)
      {
        uint64_t v35 = [v33 length];
        long long v36 = (const void *)[v34 bytes];
        long long v53 = 0uLL;
        uint64_t v54 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v53, v36, (uint64_t)v36 + 4 * (int)((unint64_t)v35 >> 2), (int)(v35 >> 2));
        long long v37 = (void *)*((void *)v17 + 10);
        if (v37)
        {
          *((void *)v17 + 11) = v37;
          operator delete(v37);
          *((void *)v17 + 10) = 0;
          *((void *)v17 + 11) = 0;
          *((void *)v17 + 12) = 0;
        }
        *((_OWORD *)v17 + 5) = v53;
        *((void *)v17 + 12) = v54;
      }
      objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"transform");
      *((_OWORD *)v17 + 7) = v38;
      *((_OWORD *)v17 + 8) = v39;
      *((_OWORD *)v17 + 9) = v40;
      *((_OWORD *)v17 + 10) = v41;
      objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"leftEyeTransform");
      *((_OWORD *)v17 + 16) = v42;
      *((_OWORD *)v17 + 17) = v43;
      *((_OWORD *)v17 + 18) = v44;
      *((_OWORD *)v17 + 19) = v45;
      objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"rightEyeTransform");
      *((_OWORD *)v17 + 20) = v46;
      *((_OWORD *)v17 + 21) = v47;
      *((_OWORD *)v17 + 22) = v48;
      *((_OWORD *)v17 + 23) = v49;
      objc_msgSend(v4, "ar_decodeVector3ForKey:", @"gaze");
      *((_OWORD *)v17 + 15) = v50;
      *((float *)v17 + 50) = (float)[v4 decodeBoolForKey:@"tongueOut"];
      [v4 decodeDoubleForKey:@"timestamp"];
      *((void *)v17 + 27) = v51;
    }
    long long v16 = v17;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    id v6 = v5;
    if (v5[2] - v5[1] != *(void *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) {
      goto LABEL_22;
    }
    if (v5[11] - v5[10] != (char *)self->_blendShapeCoefficients.__end_
                          - (char *)self->_blendShapeCoefficients.__begin_)
      goto LABEL_22;
    if (*((float *)v5 + 50) != self->_tongueOut) {
      goto LABEL_22;
    }
    if (*((double *)v5 + 27) != self->_timestamp) {
      goto LABEL_22;
    }
    anchorIdentifier = self->_anchorIdentifier;
    if (anchorIdentifier != *((NSUUID **)v6 + 24) && !-[NSUUID isEqual:](anchorIdentifier, "isEqual:")) {
      goto LABEL_22;
    }
    uint64_t v8 = (NSDictionary *)*((void *)v6 + 28);
    if (v8 != self->_trackingData && !-[NSDictionary isEqualToDictionary:](v8, "isEqualToDictionary:")) {
      goto LABEL_22;
    }
    uint64_t v9 = *((void *)v6 + 1);
    unint64_t v10 = (*((void *)v6 + 2) - v9) >> 4;
    var0 = self->_meshVertices.var0;
    float32x4_t v12 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
    if (v10 != ((char *)v12 - (char *)var0) >> 4) {
      goto LABEL_22;
    }
    if (v12 != var0)
    {
      BOOL v13 = 0;
      uint64_t v14 = 0;
      do
      {
        uint32x4_t v15 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v9 + 16 * v14), *(float32x4_t *)&var0[2 * v14]);
        v15.i32[3] = v15.i32[2];
        if ((vminvq_u32(v15) & 0x80000000) == 0) {
          break;
        }
        BOOL v13 = ++v14 >= v10;
      }
      while (v10 != v14);
      if (!v13) {
        goto LABEL_22;
      }
    }
    if (!memcmp(*((const void **)v6 + 10), self->_blendShapeCoefficients.__begin_, (char *)self->_blendShapeCoefficients.__end_ - (char *)self->_blendShapeCoefficients.__begin_)&& AREqualTransforms(*((float32x4_t *)v6 + 7), *((float32x4_t *)v6 + 8), *((float32x4_t *)v6 + 9), *((float32x4_t *)v6 + 10), *(float32x4_t *)self->_anon_70, *(float32x4_t *)&self->_anon_70[16], *(float32x4_t *)&self->_anon_70[32], *(float32x4_t *)&self->_anon_70[48])&& AREqualTransforms(*((float32x4_t *)v6 + 16), *((float32x4_t *)v6 + 17), *((float32x4_t *)v6 + 18), *((float32x4_t *)v6 + 19), *(float32x4_t *)self->_anon_100, *(float32x4_t *)&self->_anon_100[16],
                         *(float32x4_t *)&self->_anon_100[32],
                         *(float32x4_t *)&self->_anon_100[48])
      && AREqualTransforms(*((float32x4_t *)v6 + 20), *((float32x4_t *)v6 + 21), *((float32x4_t *)v6 + 22), *((float32x4_t *)v6 + 23), *(float32x4_t *)&self[1].super.isa, *(float32x4_t *)self[1]._anon_10, *(float32x4_t *)self[1]._anon_20, *(float32x4_t *)&self[1]._anon_20[16]))
    {
      float32x4_t v16 = vsubq_f32(*((float32x4_t *)v6 + 15), *(float32x4_t *)self->_gazePoint);
      float32x4_t v17 = vmulq_f32(v16, v16);
      BOOL v18 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]) < 0.00000011921;
    }
    else
    {
LABEL_22:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (NSError)trackingError
{
  return self->_trackingError;
}

- (float)tongueOut
{
  return self->_tongueOut;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)leftEyeTransform
{
  return a1[16];
}

- (__n128)setLeftEyeTransform:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  result[19] = a5;
  return result;
}

- (__n128)rightEyeTransform
{
  return a1[20];
}

- (__n128)setRightEyeTransform:(__n128)a3
{
  result[20] = a2;
  result[21] = a3;
  result[22] = a4;
  result[23] = a5;
  return result;
}

- (__n128)gazePoint
{
  return a1[15];
}

- (void)setGazePoint:(ARFaceTrackingData *)self
{
  *(_OWORD *)self->_gazePoint = v2;
}

- (NSDictionary)trackingData
{
  return self->_trackingData;
}

- (void)setTrackingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_trackingError, 0);
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_storeStrong((id *)&self->_imageVerticesSemaphore, 0);
  objc_storeStrong((id *)&self->_normalsSemaphore, 0);
  begin = self->_blendShapeCoefficients.__begin_;
  if (begin)
  {
    self->_blendShapeCoefficients.__end_ = begin;
    operator delete(begin);
  }
  var0 = self->_normals.var0;
  if (var0)
  {
    *(void *)self->_anon_40 = var0;
    operator delete(var0);
  }
  uint64_t v5 = *(void **)self->_anon_20;
  if (v5)
  {
    *(void *)&self->_anon_20[8] = v5;
    operator delete(v5);
  }
  id v6 = self->_meshVertices.var0;
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