@interface ADCameraCalibration
+ (id)cameraCalibrationFromFile:(id)a3;
+ (uint64_t)createIntrinsicsMatrixWithEFL:(double)a3 principalPointX:(double)a4 principalPointY:(double)a5;
+ (void)createIntrinsicsMatrixWithEflX:eflY:principalPointX:principalPointY:;
+ (void)transform:(unint64_t)a3 points:with:outPoints:;
- (ADCameraCalibration)initWithDictionary:(id)a3;
- (ADCameraCalibration)initWithFile:(id)a3;
- (ADLensDistortionModel)distortionModel;
- (ADNilDistortionModel)initWithIntrinsics:(__n128)a3 cameraToPlatformTransform:(__n128)a4 pixelSize:(__n128)a5 referenceDimensions:(__n128)a6 distortionModel:(__n128)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (CGSize)referenceDimensions;
- (__n128)cameraToPlatformTransform;
- (__n128)intrinsicMatrix;
- (double)getTransformationTo:(int32x4_t *)a3;
- (float)pixelSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDictionaryRepresentationWithHumanReadable:(BOOL)a3;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (uint64_t)initWithIntrinsics:(double)a3 cameraToPlatformTransform:(double)a4 pixelSize:(double)a5 forReferenceDimensions:(double)a6 withDistortionModel:(double)a7;
- (unint64_t)hash;
- (void)backProject:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withR:(const float *)a5 outPoints:;
- (void)backProject:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withZ:(const float *)a5 outPoints:;
- (void)distort:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 outDistorted:(CGPoint *)a5;
- (void)project:(ADCameraCalibration *)self points:(SEL)a2 outUndistortedPixels:(unint64_t)a3;
- (void)project:(unint64_t)a3 points:outUndistortedPixels:outR:;
- (void)transform:(unint64_t)a3 points:toCamera:outPoints:;
- (void)undistort:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 outUndistorted:(CGPoint *)a5;
@end

@implementation ADCameraCalibration

- (void)undistort:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 outUndistorted:(CGPoint *)a5
{
}

- (void)distort:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 outDistorted:(CGPoint *)a5
{
}

- (__n128)intrinsicMatrix
{
  return a1[1];
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (ADLensDistortionModel)distortionModel
{
  return self->_distortionModel;
}

- (CGSize)referenceDimensions
{
  double width = self->_referenceDimensions.width;
  double height = self->_referenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)backProject:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withR:(const float *)a5 outPoints:
{
  if (a3)
  {
    float pixelSize = self->_pixelSize;
    float v7 = *(float *)self->_anon_10;
    float v8 = pixelSize * v7;
    double v9 = COERCE_FLOAT(*(_OWORD *)&self->_anon_10[32]);
    double v10 = COERCE_FLOAT(HIDWORD(*(void *)&self->_anon_10[32]));
    double v11 = pixelSize;
    double v12 = (float)(v7 / *(float *)&self->_anon_10[20]);
    p_y = &a4->y;
    do
    {
      CGFloat v14 = (*(p_y - 1) - v9) * v11;
      CGFloat v15 = (*p_y - v10) * v11 * v12;
      float v16 = *a5++;
      float v17 = v14;
      float v18 = v15;
      float v19 = v16 / sqrtf((float)((float)(v8 * v8) + (float)(v17 * v17)) + (float)(v18 * v18));
      *(float *)&CGFloat v14 = v14 * v19;
      *(float *)&CGFloat v15 = v15 * v19;
      HIDWORD(v14) = LODWORD(v15);
      *(float *)(v5 + 8) = v8 * v19;
      *(CGFloat *)uint64_t v5 = v14;
      v5 += 16;
      p_y += 2;
      --a3;
    }
    while (a3);
  }
}

- (uint64_t)initWithIntrinsics:(double)a3 cameraToPlatformTransform:(double)a4 pixelSize:(double)a5 forReferenceDimensions:(double)a6 withDistortionModel:(double)a7
{
  *(float *)&a10 = a10;
  return objc_msgSend(a1, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", a3, a4, a5, a6, a7, a8, a9, a10);
}

- (id)dictionaryRepresentation
{
  return [(ADCameraCalibration *)self createDictionaryRepresentationWithHumanReadable:0];
}

- (ADCameraCalibration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ADCameraCalibration;
  uint64_t v5 = [(ADCameraCalibration *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"intrinsicMatrix"];
    float v7 = v6;
    if (v6 && [v6 count] == 9)
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        uint64_t v9 = 0;
        uint64_t v10 = i;
        do
        {
          double v11 = [v7 objectAtIndexedSubscript:v10];
          double v12 = v11;
          if (!v11) {
            goto LABEL_24;
          }
          [v11 floatValue];
          *(_DWORD *)&v5->_anon_10[16 * i + 4 * v9] = v13;

          ++v9;
          v10 += 3;
        }
        while (v9 != 3);
      }
      CFDictionaryRef v14 = [v4 objectForKeyedSubscript:@"referenceDimensions"];
      CFDictionaryRef v15 = v14;
      if (v14 && CGSizeMakeWithDictionaryRepresentation(v14, &v5->_referenceDimensions))
      {
        float v16 = [v4 objectForKeyedSubscript:@"cameraToPlatformTransform"];
        if (v16
          || ([v4 objectForKeyedSubscript:@"extrinsicMatrix"],
              (float v16 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          if ([v16 count] == 12)
          {
            uint64_t v17 = 0;
            anon_50 = v5->_anon_50;
            while (2)
            {
              uint64_t v19 = 0;
              v20 = (char *)&anon_50[16 * v17];
              uint64_t v21 = v17;
              do
              {
                v22 = [v16 objectAtIndexedSubscript:v21];
                v23 = v22;
                if (!v22) {
                  goto LABEL_29;
                }
                [v22 floatValue];
                *(_DWORD *)&v20[4 * v19] = v24;

                ++v19;
                v21 += 4;
              }
              while (v19 != 3);
              ++v17;
              anon_50 = v5->_anon_50;
              if (v17 != 4) {
                continue;
              }
              break;
            }
            v25 = [v4 objectForKeyedSubscript:@"pixelSize"];
            v26 = v25;
            if (!v25)
            {
              v33 = 0;
              goto LABEL_37;
            }
            [v25 floatValue];
            v5->_float pixelSize = v27;
            v28 = [v4 objectForKeyedSubscript:@"distortionType"];
            uint64_t v29 = allocateDistortionModelWithName(v28);
            distortionModel = v5->_distortionModel;
            v5->_distortionModel = (ADLensDistortionModel *)v29;

            if (v5->_distortionModel && (objc_opt_respondsToSelector() & 1) != 0)
            {
              uint64_t v31 = [(ADLensDistortionModel *)v5->_distortionModel initWithDictionary:v4];
              v32 = v5->_distortionModel;
              v5->_distortionModel = (ADLensDistortionModel *)v31;

              if (v5->_distortionModel)
              {
                v33 = v5;
LABEL_35:

LABEL_37:
                goto LABEL_30;
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unknown distortion model or distortion model does not support loading from dictionary", buf, 2u);
            }
            v33 = 0;
            goto LABEL_35;
          }
        }
LABEL_29:
        v33 = 0;
LABEL_30:
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
LABEL_24:
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)createDictionaryRepresentationWithHumanReadable:(BOOL)a3
{
  BOOL v48 = a3;
  v59[9] = *MEMORY[0x263EF8340];
  id v56 = (id)objc_opt_new();
  [v56 setObject:&unk_26FC28760 forKeyedSubscript:@"Version"];
  LODWORD(v4) = *(_DWORD *)self->_anon_10;
  v54 = [NSNumber numberWithFloat:v4];
  v59[0] = v54;
  LODWORD(v5) = *(_DWORD *)&self->_anon_10[16];
  v52 = [NSNumber numberWithFloat:v5];
  v59[1] = v52;
  LODWORD(v6) = *(_DWORD *)&self->_anon_10[32];
  float v7 = [NSNumber numberWithFloat:v6];
  v59[2] = v7;
  LODWORD(v8) = *(_DWORD *)&self->_anon_10[4];
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  v59[3] = v9;
  LODWORD(v10) = *(_DWORD *)&self->_anon_10[20];
  double v11 = [NSNumber numberWithFloat:v10];
  v59[4] = v11;
  LODWORD(v12) = *(_DWORD *)&self->_anon_10[36];
  int v13 = [NSNumber numberWithFloat:v12];
  v59[5] = v13;
  LODWORD(v14) = *(_DWORD *)&self->_anon_10[8];
  CFDictionaryRef v15 = [NSNumber numberWithFloat:v14];
  v59[6] = v15;
  LODWORD(v16) = *(_DWORD *)&self->_anon_10[24];
  uint64_t v17 = [NSNumber numberWithFloat:v16];
  v59[7] = v17;
  LODWORD(v18) = *(_DWORD *)&self->_anon_10[40];
  uint64_t v19 = [NSNumber numberWithFloat:v18];
  v59[8] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:9];
  [v56 setObject:v20 forKeyedSubscript:@"intrinsicMatrix"];

  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_referenceDimensions);
  [v56 setObject:DictionaryRepresentation forKeyedSubscript:@"referenceDimensions"];

  LODWORD(v22) = *(_DWORD *)self->_anon_50;
  v55 = [NSNumber numberWithFloat:v22];
  v58[0] = v55;
  LODWORD(v23) = *(_DWORD *)&self->_anon_50[16];
  v53 = [NSNumber numberWithFloat:v23];
  v58[1] = v53;
  LODWORD(v24) = *(_DWORD *)&self->_anon_50[32];
  v51 = [NSNumber numberWithFloat:v24];
  v58[2] = v51;
  LODWORD(v25) = *(_DWORD *)&self->_anon_50[48];
  v50 = [NSNumber numberWithFloat:v25];
  v58[3] = v50;
  LODWORD(v26) = *(_DWORD *)&self->_anon_50[4];
  v49 = [NSNumber numberWithFloat:v26];
  v58[4] = v49;
  LODWORD(v27) = *(_DWORD *)&self->_anon_50[20];
  v28 = [NSNumber numberWithFloat:v27];
  v58[5] = v28;
  LODWORD(v29) = *(_DWORD *)&self->_anon_50[36];
  v30 = [NSNumber numberWithFloat:v29];
  v58[6] = v30;
  LODWORD(v31) = *(_DWORD *)&self->_anon_50[52];
  v32 = [NSNumber numberWithFloat:v31];
  v58[7] = v32;
  LODWORD(v33) = *(_DWORD *)&self->_anon_50[8];
  v34 = [NSNumber numberWithFloat:v33];
  v58[8] = v34;
  LODWORD(v35) = *(_DWORD *)&self->_anon_50[24];
  objc_super v36 = [NSNumber numberWithFloat:v35];
  v58[9] = v36;
  LODWORD(v37) = *(_DWORD *)&self->_anon_50[40];
  v38 = [NSNumber numberWithFloat:v37];
  v58[10] = v38;
  LODWORD(v39) = *(_DWORD *)&self->_anon_50[56];
  v40 = [NSNumber numberWithFloat:v39];
  v58[11] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:12];
  [v56 setObject:v41 forKeyedSubscript:@"cameraToPlatformTransform"];

  *(float *)&double v42 = self->_pixelSize;
  v43 = [NSNumber numberWithFloat:v42];
  [v56 setObject:v43 forKeyedSubscript:@"pixelSize"];

  if (objc_opt_respondsToSelector())
  {
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    [v56 setObject:v45 forKeyedSubscript:@"distortionType"];

    v46 = [(ADLensDistortionModel *)self->_distortionModel dictionaryRepresentation:v48];
    [v56 addEntriesFromDictionary:v46];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "distortion model cannot be converted to dictionary. calibration will be missing distortion and won't be able to load from dictionary.", buf, 2u);
    }
    [v56 setObject:@"Unknown" forKeyedSubscript:@"distortionType"];
  }

  return v56;
}

- (__n128)cameraToPlatformTransform
{
  return a1[5];
}

- (void).cxx_destruct
{
}

- (ADNilDistortionModel)initWithIntrinsics:(__n128)a3 cameraToPlatformTransform:(__n128)a4 pixelSize:(__n128)a5 referenceDimensions:(__n128)a6 distortionModel:(__n128)a7
{
  v20 = a11;
  if (v20 || (v20 = objc_alloc_init(ADNilDistortionModel)) != 0)
  {
    v38.receiver = a1;
    v38.super_class = (Class)ADCameraCalibration;
    uint64_t v21 = [(ADCameraCalibration *)&v38 init];
    double v22 = v21;
    if (v21)
    {
      *(_OWORD *)v21->_anon_10 = v25;
      *(_OWORD *)&v21->_anon_10[16] = v27;
      *(_OWORD *)&v21->_anon_10[32] = v29;
      *(_OWORD *)v21->_anon_50 = v31;
      *(_OWORD *)&v21->_anon_50[16] = v33;
      *(_OWORD *)&v21->_anon_50[32] = v35;
      *(_OWORD *)&v21->_anon_50[48] = v37;
      v21->_float pixelSize = a9;
      v21->_referenceDimensions.double width = a12;
      v21->_referenceDimensions.double height = a13;
      objc_storeStrong((id *)&v21->_distortionModel, v20);
    }
    a1 = v22;

    v20 = a1;
  }

  return v20;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  float v7 = [(ADCameraCalibration *)self createDictionaryRepresentationWithHumanReadable:1];
  double v8 = [v6 lowercaseString];
  int v9 = [v8 hasSuffix:@".json"];

  if (v9)
  {
    id v15 = 0;
    double v10 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:1 error:&v15];
    id v11 = v15;
    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        double v14 = [v11 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v14;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed create camera calibration with error:%@", buf, 0xCu);
      }
      char v12 = 0;
    }
    else
    {
      char v12 = [v10 writeToFile:v6 atomically:v4];
    }
  }
  else
  {
    char v12 = [v7 writeToFile:v6 atomically:v4];
  }

  return v12;
}

- (ADCameraCalibration)initWithFile:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    id v6 = [v4 lowercaseString];
    int v7 = [v6 hasSuffix:@".json"];

    if (v7)
    {
      id v17 = 0;
      double v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:1 error:&v17];
      id v9 = v17;
      double v10 = v9;
      if (v8)
      {
        id v16 = v9;
        id v11 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:4 error:&v16];
        id v12 = v16;

        double v10 = v12;
        if (v12)
        {
LABEL_5:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            id v15 = [v10 description];
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v15;
            _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed create camera calibration with error:%@", buf, 0xCu);
          }
          int v13 = 0;
          goto LABEL_13;
        }
      }
      else
      {
        id v11 = 0;
        if (v9) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      id v11 = [NSDictionary dictionaryWithContentsOfFile:v5];
    }
    self = [(ADCameraCalibration *)self initWithDictionary:v11];
    int v13 = self;
LABEL_13:

    goto LABEL_14;
  }
  int v13 = 0;
LABEL_14:

  return v13;
}

- (void)backProject:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withZ:(const float *)a5 outPoints:
{
  ADReprojectionOptimizations::backProjectUndistortedPixels(a3, (uint64_t)a4, (float32x4_t *)a5, v5, COERCE_FLOAT(*(_OWORD *)self->_anon_10), *(double *)&self->_anon_10[16], *(double *)&self->_anon_10[32]);
}

- (void)project:(unint64_t)a3 points:outUndistortedPixels:outR:
{
  for (; a3; --a3)
  {
    int32x4_t v6 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)self->_anon_10, COERCE_FLOAT(*(_OWORD *)v3->f32)), *(float32x4_t *)&self->_anon_10[16], *v3, 1), *(float32x4_t *)&self->_anon_10[32], *(float32x4_t *)v3->f32, 2);
    if (*(float *)&v6.i32[2] <= 0.0)
    {
      v4->f64[0] = 0.0;
      v4->f64[1] = 0.0;
      float v8 = 0.0;
    }
    else
    {
      *id v4 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v6.i8, (float32x2_t)vdup_laneq_s32(v6, 2)));
      float32x4_t v7 = vmulq_f32(*(float32x4_t *)v3->f32, *(float32x4_t *)v3->f32);
      float v8 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
    }
    *v5++ = v8;
    ++v4;
    v3 += 2;
  }
}

- (void)project:(ADCameraCalibration *)self points:(SEL)a2 outUndistortedPixels:(unint64_t)a3
{
  ADReprojectionOptimizations::projectPoints(a3, v3, v4, *(float32x4_t *)self->_anon_10, *(float32x4_t *)&self->_anon_10[16], *(float32x4_t *)&self->_anon_10[32]);
}

- (void)transform:(unint64_t)a3 points:toCamera:outPoints:
{
  uint64_t v6 = v5;
  uint64_t v7 = v3;
  id v10 = v4;
  -[ADCameraCalibration getTransformationTo:](self, "getTransformationTo:");
  +[ADCameraCalibration transform:points:with:outPoints:](ADCameraCalibration, "transform:points:with:outPoints:", a3, v7, v6);
}

- (double)getTransformationTo:(int32x4_t *)a3
{
  uint64_t v3 = 0;
  int32x4_t v4 = a3[5];
  int32x4_t v5 = a3[6];
  int32x4_t v6 = vdupq_lane_s32(*(int32x2_t *)v5.i8, 1);
  float32x4_t v7 = (float32x4_t)vzip1q_s32(v4, v5);
  v7.i32[2] = (__int32)a3[7];
  float32x4_t v8 = (float32x4_t)vzip2q_s32(v4, v5);
  v8.i32[2] = a3[7].i64[1];
  float32x4_t v9 = (float32x4_t)vzip2q_s32(vzip1q_s32(v4, a3[7]), v6);
  v11[2] = *(_OWORD *)(a1 + 112);
  do
  {
    *(long long *)((char *)&v12 + v3 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(v11[v3])), v9, *(float32x2_t *)&v11[v3], 1), v8, (float32x4_t)v11[v3], 2);
    ++v3;
  }
  while (v3 != 3);
  return *(double *)&v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  float pixelSize = self->_pixelSize;
  CGFloat width = self->_referenceDimensions.width;
  CGFloat height = self->_referenceDimensions.height;
  long long v18 = *(_OWORD *)&self->_anon_10[32];
  long long v16 = *(_OWORD *)&self->_anon_10[16];
  long long v14 = *(_OWORD *)self->_anon_10;
  long long v19 = *(_OWORD *)&self->_anon_50[48];
  long long v17 = *(_OWORD *)&self->_anon_50[32];
  long long v15 = *(_OWORD *)&self->_anon_50[16];
  long long v13 = *(_OWORD *)self->_anon_50;
  float32x4_t v9 = (void *)[(ADLensDistortionModel *)self->_distortionModel copyWithZone:a3];
  *(float *)&double v10 = pixelSize;
  id v11 = objc_msgSend(v5, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v9, *(double *)&v14, *(double *)&v16, *(double *)&v18, *(double *)&v13, *(double *)&v15, *(double *)&v17, *(double *)&v19, v10, *(void *)&width, *(void *)&height);

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [ADMutableCameraCalibration alloc];
  float pixelSize = self->_pixelSize;
  CGFloat width = self->_referenceDimensions.width;
  CGFloat height = self->_referenceDimensions.height;
  long long v18 = *(_OWORD *)&self->_anon_10[32];
  long long v16 = *(_OWORD *)&self->_anon_10[16];
  long long v14 = *(_OWORD *)self->_anon_10;
  long long v19 = *(_OWORD *)&self->_anon_50[48];
  long long v17 = *(_OWORD *)&self->_anon_50[32];
  long long v15 = *(_OWORD *)&self->_anon_50[16];
  long long v13 = *(_OWORD *)self->_anon_50;
  float32x4_t v9 = (void *)[(ADLensDistortionModel *)self->_distortionModel copyWithZone:a3];
  *(float *)&double v10 = pixelSize;
  id v11 = -[ADCameraCalibration initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:](v5, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", v9, *(double *)&v14, *(double *)&v16, *(double *)&v18, *(double *)&v13, *(double *)&v15, *(double *)&v17, *(double *)&v19, v10, *(void *)&width, *(void *)&height);

  return v11;
}

+ (id)cameraCalibrationFromFile:(id)a3
{
  id v3 = a3;
  int32x4_t v4 = [[ADCameraCalibration alloc] initWithFile:v3];

  return v4;
}

+ (void)transform:(unint64_t)a3 points:with:outPoints:
{
  if (a3)
  {
    float32x4_t v9 = (float *)(v3 + 8);
    int32x4_t v10 = vdupq_n_s32(0x7FC00000u);
    do
    {
      float32x4_t v11 = (float32x4_t)v10;
      if (*v9 != 0.0) {
        float32x4_t v11 = vaddq_f32(v8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_OWORD *)(v9 - 2))), v6, *(float32x2_t *)(v9 - 2), 1), v7, *(float32x4_t *)(v9 - 2), 2));
      }
      *v4++ = v11;
      v9 += 4;
      --a3;
    }
    while (a3);
  }
}

+ (uint64_t)createIntrinsicsMatrixWithEFL:(double)a3 principalPointX:(double)a4 principalPointY:(double)a5
{
  LODWORD(a6) = LODWORD(a5);
  LODWORD(a5) = LODWORD(a4);
  LODWORD(a4) = LODWORD(a3);
  return [a1 createIntrinsicsMatrixWithEflX:a3 eflY:a4 principalPointX:a5 principalPointY:a6];
}

+ (void)createIntrinsicsMatrixWithEflX:eflY:principalPointX:principalPointY:
{
  __asm { FMOV            V4.4S, #1.0 }
}

- (unint64_t)hash
{
  anon_10 = self->_anon_10;
  int32x4_t v4 = objc_opt_new();
  for (uint64_t i = 0; i != 3; ++i)
  {
    for (uint64_t j = 0; j != 3; ++j)
    {
      LODWORD(v5) = *(_DWORD *)&anon_10[16 * i + 4 * (j & 3)];
      float32x4_t v8 = [NSNumber numberWithFloat:v5];
      [v4 addObject:v8];
    }
  }
  uint64_t v10 = ADCommonUtils::hashArray((ADCommonUtils *)v4, v9);

  float32x4_t v11 = objc_opt_new();
  for (uint64_t k = 0; k != 4; ++k)
  {
    for (uint64_t m = 0; m != 3; ++m)
    {
      LODWORD(v12) = *(_DWORD *)&self->_anon_50[16 * k + 4 * (m & 3)];
      long long v15 = [NSNumber numberWithFloat:v12];
      [v11 addObject:v15];
    }
  }
  uint64_t v17 = ADCommonUtils::hashArray((ADCommonUtils *)v11, v16);

  long long v18 = [NSNumber numberWithDouble:self->_referenceDimensions.width];
  uint64_t v19 = [v18 hash];

  uint64_t v20 = [NSNumber numberWithDouble:self->_referenceDimensions.height];
  uint64_t v21 = [v20 hash];

  *(float *)&double v22 = self->_pixelSize;
  double v23 = [NSNumber numberWithFloat:v22];
  uint64_t v24 = v10 ^ (2 * v17) ^ (3 * v19) ^ (4 * v21) ^ (5 * [v23 hash]);

  return v24 ^ (6 * [(ADLensDistortionModel *)self->_distortionModel hash]);
}

- (BOOL)isEqual:(id)a3
{
  int32x4_t v4 = (ADCameraCalibration *)a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
    char v16 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    char v16 = 0;
    goto LABEL_10;
  }
  float32x4_t v6 = v5;
  float32x4_t v27 = *(float32x4_t *)&self->_anon_10[16];
  float32x4_t v29 = *(float32x4_t *)self->_anon_10;
  float32x4_t v31 = *(float32x4_t *)&self->_anon_10[32];
  [(ADCameraCalibration *)v6 intrinsicMatrix];
  uint32x4_t v10 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v29, v7), (int8x16_t)vceqq_f32(v27, v8)), (int8x16_t)vceqq_f32(v31, v9));
  v10.i32[3] = v10.i32[2];
  if ((vminvq_u32(v10) & 0x80000000) == 0) {
    goto LABEL_6;
  }
  float32x4_t v26 = *(float32x4_t *)&self->_anon_50[16];
  float32x4_t v28 = *(float32x4_t *)self->_anon_50;
  float32x4_t v30 = *(float32x4_t *)&self->_anon_50[48];
  float32x4_t v32 = *(float32x4_t *)&self->_anon_50[32];
  [(ADCameraCalibration *)v6 cameraToPlatformTransform];
  uint32x4_t v15 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v28, v11), (int8x16_t)vceqq_f32(v26, v12)), vandq_s8((int8x16_t)vceqq_f32(v32, v13), (int8x16_t)vceqq_f32(v30, v14)));
  v15.i32[3] = v15.i32[2];
  if ((vminvq_u32(v15) & 0x80000000) == 0) {
    goto LABEL_6;
  }
  double width = self->_referenceDimensions.width;
  double height = self->_referenceDimensions.height;
  [(ADCameraCalibration *)v6 referenceDimensions];
  char v16 = 0;
  if (width != v21 || height != v20) {
    goto LABEL_7;
  }
  float pixelSize = self->_pixelSize;
  [(ADCameraCalibration *)v6 pixelSize];
  if (pixelSize == v23)
  {
    distortionModel = self->_distortionModel;
    long long v25 = [(ADCameraCalibration *)v6 distortionModel];
    char v16 = [(ADLensDistortionModel *)distortionModel isEqual:v25];
  }
  else
  {
LABEL_6:
    char v16 = 0;
  }
LABEL_7:

LABEL_10:
  return v16;
}

@end