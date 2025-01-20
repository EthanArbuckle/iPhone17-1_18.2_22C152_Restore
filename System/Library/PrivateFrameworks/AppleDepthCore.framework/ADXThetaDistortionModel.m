@interface ADXThetaDistortionModel
- (ADXThetaDistortionModel)initWithDictionary:(id)a3;
- (ADXThetaDistortionModel)initWithDistortionCenter:(CGPoint)a3 XThetaType:(unint64_t)a4;
- (ADXThetaDistortionModel)initWithDistortionCenter:(CGPoint)a3 XThetaType:(unint64_t)a4 distortionCoefficients:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CGPoint)distortionCenter;
- (NSArray)distortionCoefficients;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation:(BOOL)a3;
- (unint64_t)XThetaType;
- (unint64_t)hash;
- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4;
- (void)applyDistortionModelToPixels:(double)a3 inPixels:(float32x2_t)a4 intrinsicsMatrix:(uint64_t)a5 distort:(uint64_t)a6 outPixels:(float64x2_t *)a7;
- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4;
- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6;
- (void)scale:(float)a3;
- (void)setDistortionCenter:(CGPoint)a3;
- (void)setDistortionCoefficients:(id)a3;
- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6;
@end

@implementation ADXThetaDistortionModel

- (void).cxx_destruct
{
}

- (void)setDistortionCoefficients:(id)a3
{
}

- (NSArray)distortionCoefficients
{
  return self->_distortionCoefficients;
}

- (unint64_t)XThetaType
{
  return self->_XThetaType;
}

- (void)setDistortionCenter:(CGPoint)a3
{
  self->_distortionCenter = a3;
}

- (CGPoint)distortionCenter
{
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->_distortionCenter);
  [v4 setObject:DictionaryRepresentation forKeyedSubscript:@"lensDistortionCenter"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_XThetaType];
  [v4 setObject:v6 forKeyedSubscript:@"typeXTheta"];

  [v4 setObject:self->_distortionCoefficients forKeyedSubscript:@"distortionCoefficients"];
  v7 = (void *)[v4 copy];

  return v7;
}

- (ADXThetaDistortionModel)initWithDictionary:(id)a3
{
  v4 = (NSDictionary *)a3;
  if (getDistortionCenterFromDictionary(v4, &self->_distortionCenter))
  {
    v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"typeXTheta"];

    if (v5)
    {
      v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"distortionCoefficients"];
      distortionCoefficients = self->_distortionCoefficients;
      self->_distortionCoefficients = v6;

      v8 = [(NSDictionary *)v4 objectForKeyedSubscript:@"typeXTheta"];
      uint64_t v9 = [v8 unsignedIntegerValue];

      self = -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:distortionCoefficients:](self, "initWithDistortionCenter:XThetaType:distortionCoefficients:", v9, self->_distortionCoefficients, self->_distortionCenter.x, self->_distortionCenter.y);
      v5 = self;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ADXThetaDistortionModel)initWithDistortionCenter:(CGPoint)a3 XThetaType:(unint64_t)a4 distortionCoefficients:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ADXThetaDistortionModel;
  v11 = [(ADXThetaDistortionModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_distortionCenter.CGFloat x = x;
    v11->_distortionCenter.CGFloat y = y;
    v11->_XThetaType = a4;
    objc_storeStrong((id *)&v11->_distortionCoefficients, a5);
  }

  return v12;
}

- (ADXThetaDistortionModel)initWithDistortionCenter:(CGPoint)a3 XThetaType:(unint64_t)a4
{
  return -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:distortionCoefficients:](self, "initWithDistortionCenter:XThetaType:distortionCoefficients:", a4, 0, a3.x, a3.y);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ADXThetaDistortionModel alloc];
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  unint64_t XThetaType = self->_XThetaType;
  distortionCoefficients = self->_distortionCoefficients;

  return -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:distortionCoefficients:](v4, "initWithDistortionCenter:XThetaType:distortionCoefficients:", XThetaType, distortionCoefficients, x, y);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v10 = a5;
  [v10 intrinsicMatrix];
  -[ADXThetaDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:", a3, a4, 0, a6);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v10 = a5;
  [v10 intrinsicMatrix];
  -[ADXThetaDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:", a3, a4, 1, a6);
}

- (void)applyDistortionModelToPixels:(double)a3 inPixels:(float32x2_t)a4 intrinsicsMatrix:(uint64_t)a5 distort:(uint64_t)a6 outPixels:(float64x2_t *)a7
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v10 = *(void *)(a1 + 8);
  switch(v10)
  {
    case 0:
      if (!a6) {
        return;
      }
      float32x2_t v13 = (float32x2_t)__PAIR64__(HIDWORD(a3), LODWORD(a2));
      uint64_t v14 = 0;
      __asm { FMOV            V0.2S, #1.0 }
      float32x2_t v52 = v13;
      float32x2_t v56 = vcvt_f32_f64(*(float64x2_t *)(a1 + 24));
      float32x2_t v57 = vdiv_f32(_D0, v13);
      int32x2_t v54 = vdup_n_s32(0x7FC00000u);
      while (1)
      {
        float32x2_t v19 = vcvt_f32_f64(a7[v14]);
        if (!a8) {
          break;
        }
        float32x2_t v20 = vmul_f32(v57, vsub_f32(v19, a4));
        float v21 = sqrtf(vaddv_f32(vmul_f32(v20, v20)));
        float v22 = atanf(v21);
        if (v22 > 0.0000001)
        {
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v23 = *(id *)(a1 + 16);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v73 count:16];
          if (v24)
          {
            float v25 = v22 * v22;
            uint64_t v26 = *(void *)v68;
            float v27 = v22;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v68 != v26) {
                  objc_enumerationMutation(v23);
                }
                [*(id *)(*((void *)&v67 + 1) + 8 * i) floatValue];
                float v22 = v25 * v22;
                float v27 = v27 + (float)(v29 * v22);
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v73 count:16];
            }
            while (v24);
          }
          else
          {
            float v27 = v22;
          }

          float v49 = v27 / v21;
          float32x2_t v50 = vmul_f32(v52, v20);
          float32x2_t v51 = v56;
LABEL_44:
          float32x2_t v19 = vmla_n_f32(v51, v50, v49);
        }
LABEL_45:
        a9[v14++] = vcvtq_f64_f32(v19);
        if (v14 == a6) {
          return;
        }
      }
      float32x2_t v53 = vmul_f32(v57, vsub_f32(v19, v56));
      float v62 = sqrtf(vaddv_f32(vmul_f32(v53, v53)));
      if (v62 < 0.00000001) {
        goto LABEL_45;
      }
      unint64_t v30 = 0;
      float v31 = 3.4028e38;
      float v32 = v62;
      while (1)
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v33 = *(id *)(a1 + 16);
        uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v72 count:16];
        float v61 = v31;
        if (v34)
        {
          float v35 = v32 * v32;
          uint64_t v36 = *(void *)v64;
          float v37 = 1.0;
          float v38 = v32;
          float v39 = v32;
          float v40 = 1.0;
          do
          {
            uint64_t v41 = 0;
            float v42 = v39;
            do
            {
              if (*(void *)v64 != v36) {
                objc_enumerationMutation(v33);
              }
              v43 = *(void **)(*((void *)&v63 + 1) + 8 * v41);
              [v43 floatValue];
              float v45 = v44;
              [v43 floatValue];
              float v40 = v40 + 2.0;
              float v39 = v35 * v42;
              float v37 = v37 + (float)((float)(v40 * v45) * (float)(v32 * v42));
              float v38 = v38 + (float)(v46 * (float)(v35 * v42));
              ++v41;
              float v42 = v35 * v42;
            }
            while (v34 != v41);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v72 count:16];
          }
          while (v34);
        }
        else
        {
          float v37 = 1.0;
          float v38 = v32;
        }

        if (fabsf(v37) < 0.001) {
          break;
        }
        float v31 = (float)(v38 - v62) / v37;
        float v32 = v32 - v31;
        float v47 = fabsf(v31);
        if (v47 <= 0.0000011921 || v30++ >= 0x13) {
          goto LABEL_38;
        }
      }
      float v47 = fabsf(v61);
LABEL_38:
      float32x2_t v19 = (float32x2_t)v54;
      if (v47 > 0.001) {
        goto LABEL_45;
      }
      float32x2_t v19 = (float32x2_t)v54;
      if (v32 < 0.0) {
        goto LABEL_45;
      }
      float32x2_t v19 = (float32x2_t)v54;
      if (v32 > 1.57079633) {
        goto LABEL_45;
      }
      float v49 = tanf(v32) / v62;
      float32x2_t v50 = vmul_f32(v52, v53);
      float32x2_t v51 = a4;
      goto LABEL_44;
    case 1:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "FSinTheta distort/undistort not supported", buf, 2u);
      }
      break;
    case 2:
      size_t v11 = 16 * a6;
      memcpy(a9, a7, v11);
      break;
  }
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_distortionCenter.x];
  uint64_t v4 = [v3 hash];

  v5 = [NSNumber numberWithDouble:self->_distortionCenter.y];
  uint64_t v6 = [v5 hash];

  v7 = [NSNumber numberWithUnsignedInteger:self->_XThetaType];
  uint64_t v8 = v4 ^ (2 * v6) ^ (3 * [v7 hash]);

  return v8 ^ (4 * ADCommonUtils::hashArray((ADCommonUtils *)self->_distortionCoefficients, v9));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADXThetaDistortionModel *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (self == v4)
  {
    char v16 = 1;
    goto LABEL_15;
  }
  if ([(ADXThetaDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    double x = self->_distortionCenter.x;
    double y = self->_distortionCenter.y;
    [(ADXThetaDistortionModel *)v6 distortionCenter];
    LOBYTE(v10) = 1;
    if (x == v11 && y == v9)
    {
      unint64_t XThetaType = self->_XThetaType;
      if (XThetaType == [(ADXThetaDistortionModel *)v6 XThetaType])
      {
        distortionCoefficients = self->_distortionCoefficients;
        uint64_t v14 = [(ADXThetaDistortionModel *)v6 distortionCoefficients];
        if ((distortionCoefficients != 0) == (v14 == 0))
        {
          LOBYTE(v10) = 1;
        }
        else
        {
          uint64_t v10 = self->_distortionCoefficients;
          if (v10)
          {
            v15 = [(ADXThetaDistortionModel *)v6 distortionCoefficients];
            LODWORD(v10) = ![(NSArray *)v10 isEqualToArray:v15];
          }
        }
      }
    }
    char v16 = v10 ^ 1;
  }
  else
  {
LABEL_10:
    char v16 = 0;
  }
LABEL_15:

  return v16;
}

- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4
{
  self->_distortionCenter.double x = rotateUVPoint(a3, self->_distortionCenter.x, self->_distortionCenter.y, a4.width, a4.height);
  self->_distortionCenter.double y = v5;
}

- (void)scale:(float)a3
{
  self->_distortionCenter = (CGPoint)vmulq_n_f64((float64x2_t)self->_distortionCenter, a3);
}

- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4
{
  CGFloat v4 = self->_distortionCenter.y - a3.origin.y;
  self->_distortionCenter.double x = self->_distortionCenter.x - a3.origin.x;
  self->_distortionCenter.double y = v4;
}

@end