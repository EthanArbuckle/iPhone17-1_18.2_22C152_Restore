@interface CUIHueSaturationFilter
+ (id)customAttributes;
- (CGColor)_newColorByProcessingColor:(CGColor *)a3;
- (CIColor)inputTintColor;
- (CIImage)inputImage;
- (HSV)tintColorToHSV;
- (NSNumber)inputAngleWidth;
- (NSNumber)inputCenterAngle;
- (float)angleWidthDegrees;
- (float)centerAngleDegrees;
- (id)outputImage;
- (void)setInputAngleWidth:(id)a3;
- (void)setInputCenterAngle:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTintColor:(id)a3;
@end

@implementation CUIHueSaturationFilter

- (float)centerAngleDegrees
{
  [(NSNumber *)self->inputCenterAngle floatValue];
  float result = v2 * 57.2957795;
  if (result < 0.0) {
    float result = result + 360.0;
  }
  if (result > 360.0) {
    return result + -360.0;
  }
  return result;
}

- (float)angleWidthDegrees
{
  [(NSNumber *)self->inputAngleWidth floatValue];
  float result = v2 * 57.2957795;
  if (result < 0.0) {
    float result = 0.0;
  }
  if (result > 360.0) {
    return 360.0;
  }
  return result;
}

- (HSV)tintColorToHSV
{
  [(CIColor *)self->inputTintColor red];
  double v4 = v3;
  [(CIColor *)self->inputTintColor green];
  double v6 = v5;
  [(CIColor *)self->inputTintColor blue];
  double v8 = v7;
  [(CIColor *)self->inputTintColor alpha];
  float v9 = v4;
  float v10 = v6;
  float v11 = v8;
  float v12 = fminf(v9, fminf(v10, v11));
  float v13 = fmaxf(v9, fmaxf(v10, v11));
  float v14 = v13 - v12;
  float v15 = v14 / v13;
  float v16 = 0.0;
  if (v13 == 0.0) {
    float v15 = 0.0;
  }
  if (v15 != 0.0)
  {
    double v17 = v14;
    if (v4 == v13)
    {
      double v18 = (v6 - v8) / v17;
    }
    else
    {
      double v19 = (v4 - v6) / v17 + 4.0;
      double v18 = (v8 - v4) / v17 + 2.0;
      if (v6 != v13) {
        double v18 = v19;
      }
    }
    float v20 = v18;
    float v16 = v20 / 6.0;
    if (v16 < 0.0) {
      float v16 = v16 + 1.0;
    }
  }
  float v21 = v16 * 360.0;
  if (v21 < 0.0) {
    float v21 = v21 + 360.0;
  }
  if (v21 > 360.0) {
    float v21 = v21 + -360.0;
  }
  float v22 = 1.0 - (float)(v15 + v15);
  float v23 = 1.0 - (float)(v13 + v13);
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (CGColor)_newColorByProcessingColor:(CGColor *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  [(CUIHueSaturationFilter *)self centerAngleDegrees];
  float v6 = v5;
  [(CUIHueSaturationFilter *)self angleWidthDegrees];
  float v8 = v7;
  [(CUIHueSaturationFilter *)self tintColorToHSV];
  float v10 = v9;
  float32x2_t v46 = v11;
  float32x2_t v45 = v12;
  ColorSpace = CGColorGetColorSpace(a3);
  float v14 = (uint64_t *)CGColorGetComponents(a3);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
  _Q1 = (float64x2_t)xmmword_193953170;
  float64x2_t v17 = 0uLL;
  switch(NumberOfComponents)
  {
    case 0uLL:
      break;
    case 1uLL:
      __asm { FMOV            V1.2D, #1.0 }
      *(void *)&_Q1.f64[0] = *v14;
      float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*v14, 0);
      break;
    case 2uLL:
      _Q1 = *(float64x2_t *)v14;
      float64x2_t v17 = (float64x2_t)vdupq_lane_s64(*v14, 0);
      break;
    case 3uLL:
      float64x2_t v17 = *(float64x2_t *)v14;
      __asm { FMOV            V1.2D, #1.0 }
      *(void *)&_Q1.f64[0] = v14[2];
      break;
    default:
      float64x2_t v17 = *(float64x2_t *)v14;
      _Q1 = *((float64x2_t *)v14 + 1);
      break;
  }
  float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), _Q1);
  if (v8 > 0.0)
  {
    *(float *)_Q1.f64 = fminf(v22.f32[0], fminf(v22.f32[1], v22.f32[2]));
    float v23 = fmaxf(v22.f32[0], fmaxf(v22.f32[1], v22.f32[2]));
    float v24 = v23 - *(float *)_Q1.f64;
    float v25 = (float)(v23 - *(float *)_Q1.f64) / v23;
    float v26 = 0.0;
    if (v23 == 0.0) {
      float v25 = 0.0;
    }
    if (v25 != 0.0)
    {
      float v27 = (float)((float)(v22.f32[0] - v22.f32[1]) / v24) + 4.0;
      if (v23 == v22.f32[1]) {
        float v27 = (float)((float)(v22.f32[2] - v22.f32[0]) / v24) + 2.0;
      }
      float v28 = (float)(v22.f32[1] - v22.f32[2]) / v24;
      if (v23 != v22.f32[0]) {
        float v28 = v27;
      }
      float v26 = v28 / 6.0;
      if ((float)(v28 / 6.0) < 0.0) {
        float v26 = v26 + 1.0;
      }
    }
    float v29 = (float)((float)(v26 * 360.0) - v6) / 6.0;
    float v30 = v29 + 360.0;
    if (v29 >= 0.0) {
      float v30 = (float)((float)(v26 * 360.0) - v6) / 6.0;
    }
    if (v8 * 0.5 > v30)
    {
      if (v25 == 0.0)
      {
        v31.i64[0] = 0;
        v31.i32[2] = 0;
        v31.i32[3] = v22.i32[3];
      }
      else
      {
        double v32 = v25;
        float v33 = v10 + v30;
        if (v33 < 0.0) {
          float v33 = v33 + 360.0;
        }
        if (v33 > 360.0) {
          float v33 = v33 + -360.0;
        }
        float v34 = v33 / 60.0;
        int v35 = (int)v34;
        float v36 = v34 - floorf(v34);
        v37.f64[0] = v25;
        v37.f64[1] = (float)(v25 * v36);
        __asm { FMOV            V3.2D, #1.0 }
        float64x2_t v39 = vmulq_n_f64(vsubq_f64(_Q3, v37), v23);
        *(float32x2_t *)&v39.f64[0] = vcvt_f32_f64(v39);
        float v40 = (1.0 - v32 * (1.0 - v36)) * v23;
        switch(v35)
        {
          case 0:
            v22.i64[0] = __PAIR64__(LODWORD(v40), LODWORD(v23));
            v22.i32[2] = LODWORD(v39.f64[0]);
            goto LABEL_30;
          case 1:
            int8x16_t v31 = (int8x16_t)vtrn2q_s32((int32x4_t)v39, (int32x4_t)v22);
            *(float *)&v31.i32[1] = v23;
            v31.i32[2] = LODWORD(v39.f64[0]);
            break;
          case 2:
            HIDWORD(v39.f64[1]) = vextq_s8(*(int8x16_t *)&v22, *(int8x16_t *)&v22, 8uLL).i32[1];
            *((float *)v39.f64 + 1) = v23;
            *(float *)&v39.f64[1] = v40;
            goto LABEL_33;
          case 3:
            HIDWORD(v39.f64[1]) = vextq_s8(*(int8x16_t *)&v22, *(int8x16_t *)&v22, 8uLL).i32[1];
            *(float *)&v39.f64[1] = v23;
LABEL_33:
            int8x16_t v31 = (int8x16_t)v39;
            break;
          case 4:
            v22.i64[0] = __PAIR64__(LODWORD(v39.f64[0]), LODWORD(v40));
            v22.f32[2] = v23;
            goto LABEL_30;
          default:
            v22.i64[0] = __PAIR64__(LODWORD(v39.f64[0]), LODWORD(v23));
            v22.i32[2] = HIDWORD(v39.f64[0]);
LABEL_30:
            int8x16_t v31 = (int8x16_t)v22;
            break;
        }
      }
      int32x2_t v41 = (int32x2_t)vsub_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&_Q1.f64[0], 0));
      float32x2_t v42 = vmls_lane_f32(*(float32x2_t *)v31.i8, (float32x2_t)v41, v45, 0);
      float v43 = *(float *)&v31.i32[2] - (float)((float)(*(float *)&v31.i32[2] - *(float *)_Q1.f64) * v45.f32[0]);
      *(float *)v41.i32 = (float)(v43 + vaddv_f32(v42)) / 3.0;
      *(float32x2_t *)v22.f32 = vmls_lane_f32(v42, vsub_f32(v42, (float32x2_t)vdup_lane_s32(v41, 0)), v46, 0);
      v22.i32[3] = vextq_s8(v31, v31, 8uLL).i32[1];
      v22.f32[2] = v43 - (float)((float)(v43 - *(float *)v41.i32) * v46.f32[0]);
    }
  }
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v22.f32);
  float64x2_t v48 = vcvt_hight_f64_f32(v22);
  return CGColorCreate(ColorSpace, components);
}

+ (id)customAttributes
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"inputCenterAngle";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4AA2F0;
  v8[1] = &unk_1EE4AA2F0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4AA360;
  v8[3] = &unk_1EE4AA360;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4AA390;
  v8[5] = @"CIAttributeTypeAngle";
  v10[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v9[1] = @"inputAngleWidth";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4AA2F0;
  v6[1] = &unk_1EE4AA2F0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4AA360;
  v6[3] = &unk_1EE4AA3A0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4AA370;
  v6[5] = @"CIAttributeTypeAngle";
  v10[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v9[2] = @"inputTintColor";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor redColor];
  v4[1] = @"CIAttributeTypeColor";
  v10[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
}

- (id)outputImage
{
  v28[6] = *MEMORY[0x1E4F143B8];
  [(CUIHueSaturationFilter *)self centerAngleDegrees];
  int v4 = v3;
  [(CUIHueSaturationFilter *)self angleWidthDegrees];
  float v6 = v5;
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v29)) {
    return self->inputImage;
  }
  if (v6 == 0.0) {
    return self->inputImage;
  }
  [(CUIHueSaturationFilter *)self tintColorToHSV];
  int v8 = v7;
  int v10 = v9;
  int v12 = v11;
  float v13 = +[CIKernel kernelWithInternalRepresentation:&CI::_cui_hueSaturation];
  if (!v13) {
    return self->inputImage;
  }
  float v14 = v13;
  [(CIImage *)self->inputImage extent];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v27 = v21;
  v28[0] = self->inputImage;
  LODWORD(v15) = v4;
  v28[1] = [NSNumber numberWithFloat:v15];
  *(float *)&double v22 = v6;
  v28[2] = [NSNumber numberWithFloat:v22];
  LODWORD(v23) = v8;
  v28[3] = [NSNumber numberWithFloat:v23];
  LODWORD(v24) = v10;
  v28[4] = [NSNumber numberWithFloat:v24];
  LODWORD(v25) = v12;
  v28[5] = [NSNumber numberWithFloat:v25];
  return -[CIColorKernel applyWithExtent:arguments:](v14, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6], v16, v18, v20, v27);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputCenterAngle
{
  return self->inputCenterAngle;
}

- (void)setInputCenterAngle:(id)a3
{
}

- (NSNumber)inputAngleWidth
{
  return self->inputAngleWidth;
}

- (void)setInputAngleWidth:(id)a3
{
}

- (CIColor)inputTintColor
{
  return self->inputTintColor;
}

- (void)setInputTintColor:(id)a3
{
}

@end