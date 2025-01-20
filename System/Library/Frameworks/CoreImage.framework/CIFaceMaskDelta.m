@interface CIFaceMaskDelta
- (BOOL)_isValidFace:(unsigned int)a3;
- (CIImage)inputParameterImage;
- (CIVector)inputFacesCenterX;
- (CIVector)inputFacesCenterY;
- (CIVector)inputFacesChinX;
- (CIVector)inputFacesChinY;
- (CIVector)inputFacesLeftEyeX;
- (CIVector)inputFacesLeftEyeY;
- (CIVector)inputFacesRightEyeX;
- (CIVector)inputFacesRightEyeY;
- (CIVector)inputFocusRect;
- (CIVector)inputImageSize;
- (CIVector)inputK0;
- (CIVector)inputK1;
- (CIVector)inputK2;
- (CIVector)inputK3;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputAdditiveMaxBlur;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputDistanceAdd;
- (NSNumber)inputMaxBlur;
- (NSNumber)inputSubjectDistanceMaximumFocusDistance;
- (NSNumber)inputSubjectDistanceMinimumFocusDistance;
- (NSNumber)inputSubjectDistanceOffset;
- (NSNumber)inputSubjectDistanceScalingFactor;
- (NSNumber)inputSubtractiveMaxBlur;
- (double)_landmarksToDist:(unsigned int)a3 minimumDistance:(float)a4 maximumDistance:(float)a5 scalingFactor:(float)a6 offset:(float)a7;
- (float)distanceToAdd;
- (id)outputImage;
- (unsigned)findMostProminentFace;
- (void)setInputAdditiveMaxBlur:(id)a3;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputDistanceAdd:(id)a3;
- (void)setInputFacesCenterX:(id)a3;
- (void)setInputFacesCenterY:(id)a3;
- (void)setInputFacesChinX:(id)a3;
- (void)setInputFacesChinY:(id)a3;
- (void)setInputFacesLeftEyeX:(id)a3;
- (void)setInputFacesLeftEyeY:(id)a3;
- (void)setInputFacesRightEyeX:(id)a3;
- (void)setInputFacesRightEyeY:(id)a3;
- (void)setInputFocusRect:(id)a3;
- (void)setInputImageSize:(id)a3;
- (void)setInputK0:(id)a3;
- (void)setInputK1:(id)a3;
- (void)setInputK2:(id)a3;
- (void)setInputK3:(id)a3;
- (void)setInputMaxBlur:(id)a3;
- (void)setInputParameterImage:(id)a3;
- (void)setInputSubjectDistanceMaximumFocusDistance:(id)a3;
- (void)setInputSubjectDistanceMinimumFocusDistance:(id)a3;
- (void)setInputSubjectDistanceOffset:(id)a3;
- (void)setInputSubjectDistanceScalingFactor:(id)a3;
- (void)setInputSubtractiveMaxBlur:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIFaceMaskDelta

- (double)_landmarksToDist:(unsigned int)a3 minimumDistance:(float)a4 maximumDistance:(float)a5 scalingFactor:(float)a6 offset:(float)a7
{
  uint64_t v12 = a3;
  [(CIVector *)self->inputFacesLeftEyeX valueAtIndex:a3];
  float64_t v36 = v13;
  [(CIVector *)self->inputFacesLeftEyeY valueAtIndex:v12];
  v14.f64[0] = v36;
  v14.f64[1] = v15;
  float32x2_t v16 = vcvt_f32_f64(v14);
  [(CIVector *)self->inputFacesRightEyeX valueAtIndex:v12];
  float64_t v37 = v17;
  [(CIVector *)self->inputFacesRightEyeY valueAtIndex:v12];
  v18.f64[0] = v37;
  v18.f64[1] = v19;
  float32x2_t v20 = vcvt_f32_f64(v18);
  [(CIVector *)self->inputFacesCenterX valueAtIndex:v12];
  float64_t v38 = v21;
  [(CIVector *)self->inputFacesCenterY valueAtIndex:v12];
  v22.f64[0] = v38;
  v22.f64[1] = v23;
  float32x2_t v24 = vcvt_f32_f64(v22);
  [(CIVector *)self->inputFacesChinX valueAtIndex:v12];
  float64_t v39 = v25;
  [(CIVector *)self->inputFacesChinY valueAtIndex:v12];
  v26.f64[0] = v39;
  v26.f64[1] = v27;
  float32x2_t v28 = vcvt_f32_f64(v26);
  *(float32x2_t *)&v26.f64[0] = vsub_f32(v16, v20);
  *(float32x2_t *)&v26.f64[0] = vmul_f32(*(float32x2_t *)&v26.f64[0], *(float32x2_t *)&v26.f64[0]);
  float32x2_t v29 = vsub_f32(v16, v24);
  float32x2_t v30 = vsub_f32(v20, v24);
  float32x2_t v31 = vsub_f32(v24, v28);
  int32x2_t v32 = (int32x2_t)vmul_f32(v31, v31);
  *(float32x2_t *)&v26.f64[0] = vmaxnm_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)&v26.f64[0], v32), (float32x2_t)vzip2_s32(*(int32x2_t *)&v26.f64[0], v32))), (float32x2_t)vdup_n_s32(0x3A83126Fu));
  float32x2_t v33 = vsub_f32(v16, v28);
  float32x2_t v34 = vsub_f32(v20, v28);
  double result = a7
         + (fmaxf(sqrtf(vaddv_f32(vmul_f32(v29, v29))), 0.001) * -3.3737
          + *(float *)v26.f64 * -12.1925
          + fmaxf(sqrtf(vaddv_f32(vmul_f32(v30, v30))), 0.001) * -3.025
          + *((float *)v26.f64 + 1) * -11.9485
          + fmaxf(sqrtf(vaddv_f32(vmul_f32(v33, v33))), 0.001) * 1.6734
          + fmaxf(sqrtf(vaddv_f32(vmul_f32(v34, v34))), 0.001) * 1.8423
          + vmuls_lane_f32(*(float *)v26.f64, *(float32x2_t *)&v26.f64[0], 1) * 47.7061
          + 3.1214)
         * a6;
  if (result >= a5) {
    double result = a5;
  }
  if (result <= a4) {
    return a4;
  }
  return result;
}

- (BOOL)_isValidFace:(unsigned int)a3
{
  inputFacesCenterX = self->inputFacesCenterX;
  if (inputFacesCenterX)
  {
    if ([(CIVector *)inputFacesCenterX count] <= a3) {
      goto LABEL_25;
    }
    inputFacesCenterX = self->inputFacesCenterY;
    if (inputFacesCenterX)
    {
      if ([(CIVector *)inputFacesCenterX count] <= a3) {
        goto LABEL_25;
      }
      inputFacesCenterX = self->inputFacesChinX;
      if (inputFacesCenterX)
      {
        if ([(CIVector *)inputFacesCenterX count] <= a3) {
          goto LABEL_25;
        }
        inputFacesCenterX = self->inputFacesChinY;
        if (inputFacesCenterX)
        {
          if ([(CIVector *)inputFacesCenterX count] <= a3) {
            goto LABEL_25;
          }
          inputFacesCenterX = self->inputFacesLeftEyeX;
          if (inputFacesCenterX)
          {
            if ([(CIVector *)inputFacesCenterX count] <= a3) {
              goto LABEL_25;
            }
            inputFacesCenterX = self->inputFacesLeftEyeY;
            if (inputFacesCenterX)
            {
              if ([(CIVector *)inputFacesCenterX count] <= a3) {
                goto LABEL_25;
              }
              inputFacesCenterX = self->inputFacesRightEyeX;
              if (inputFacesCenterX)
              {
                if ([(CIVector *)inputFacesCenterX count] <= a3) {
                  goto LABEL_25;
                }
                inputFacesCenterX = self->inputFacesRightEyeY;
                if (inputFacesCenterX)
                {
                  if ([(CIVector *)inputFacesCenterX count] > a3)
                  {
                    [(CIVector *)self->inputFacesCenterX valueAtIndex:a3];
                    if (v6 != -1.0)
                    {
                      [(CIVector *)self->inputFacesCenterY valueAtIndex:a3];
                      if (v7 != -1.0)
                      {
                        [(CIVector *)self->inputFacesChinX valueAtIndex:a3];
                        if (v8 != -1.0)
                        {
                          [(CIVector *)self->inputFacesChinY valueAtIndex:a3];
                          if (v9 != -1.0)
                          {
                            [(CIVector *)self->inputFacesLeftEyeX valueAtIndex:a3];
                            if (v10 != -1.0)
                            {
                              [(CIVector *)self->inputFacesLeftEyeY valueAtIndex:a3];
                              if (v11 != -1.0)
                              {
                                [(CIVector *)self->inputFacesRightEyeX valueAtIndex:a3];
                                if (v12 != -1.0)
                                {
                                  [(CIVector *)self->inputFacesRightEyeY valueAtIndex:a3];
                                  LOBYTE(inputFacesCenterX) = v13 != -1.0;
                                  return (char)inputFacesCenterX;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
LABEL_25:
                  LOBYTE(inputFacesCenterX) = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return (char)inputFacesCenterX;
}

- (unsigned)findMostProminentFace
{
  [(CIVector *)self->inputFocusRect CGRectValue];
  r1.origin.x = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  BOOL v10 = [(CIFaceMaskDelta *)self _isValidFace:0];
  BYTE4(r1.origin.y) = v10;
  BOOL v11 = [(CIFaceMaskDelta *)self _isValidFace:1];
  BYTE5(r1.origin.y) = v11;
  BOOL v12 = [(CIFaceMaskDelta *)self _isValidFace:2];
  BYTE6(r1.origin.y) = v12;
  BOOL v13 = [(CIFaceMaskDelta *)self _isValidFace:3];
  uint64_t v14 = 0;
  HIBYTE(r1.origin.y) = v13;
  while (!*((unsigned char *)&r1.origin.y + v14 + 4))
  {
    if (++v14 == 4)
    {
      LODWORD(v14) = 0;
      break;
    }
  }
  if ((v11 + v10 + v12 + v13) >= 2)
  {
    uint64_t v15 = 0;
    double v16 = 0.0;
    do
    {
      if (*((unsigned char *)&r1.origin.y + v15 + 4))
      {
        [(CIVector *)self->inputFacesChinX valueAtIndex:v15];
        [(CIVector *)self->inputFacesChinY valueAtIndex:v15];
        double v18 = v17;
        [(CIVector *)self->inputFacesLeftEyeX valueAtIndex:v15];
        double v20 = v19;
        [(CIVector *)self->inputFacesLeftEyeY valueAtIndex:v15];
        double v22 = v21;
        [(CIVector *)self->inputFacesRightEyeX valueAtIndex:v15];
        double v24 = v23;
        [(CIVector *)self->inputFacesRightEyeY valueAtIndex:v15];
        if (v25 <= v22) {
          double v25 = v22;
        }
        v32.size.double height = v25 - v18;
        v30.origin.x = r1.origin.x;
        v30.origin.y = v5;
        v30.size.double width = v7;
        v30.size.double height = v9;
        v32.origin.x = v20;
        v32.origin.y = v18;
        v32.size.double width = v24 - v20;
        CGRect v31 = CGRectIntersection(v30, v32);
        double width = v31.size.width;
        double height = v31.size.height;
        if (!CGRectIsNull(v31) && width * height > v16)
        {
          double v16 = width * height;
          LODWORD(v14) = v15;
        }
      }
      ++v15;
    }
    while (v15 != 4);
  }
  return v14;
}

- (float)distanceToAdd
{
  uint64_t v3 = [(CIFaceMaskDelta *)self findMostProminentFace];
  [(NSNumber *)self->inputSubjectDistanceMinimumFocusDistance floatValue];
  int v5 = v4;
  [(NSNumber *)self->inputSubjectDistanceMaximumFocusDistance floatValue];
  int v7 = v6;
  [(NSNumber *)self->inputSubjectDistanceScalingFactor floatValue];
  int v9 = v8;
  [(NSNumber *)self->inputSubjectDistanceOffset floatValue];
  LODWORD(v11) = v10;
  LODWORD(v12) = v5;
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  [(CIFaceMaskDelta *)self _landmarksToDist:v3 minimumDistance:v12 maximumDistance:v13 scalingFactor:v14 offset:v11];
  float v16 = v15;
  [(NSNumber *)self->inputDistanceAdd floatValue];
  float v18 = v17;
  [(NSNumber *)self->inputSubjectDistanceMinimumFocusDistance floatValue];
  float v20 = fmaxf(fmaxf(v19, v16), 0.00001);
  return (float)(1.0 / v20) - (float)(1.0 / (float)(v18 + v20));
}

- (id)outputImage
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id result = +[CIImage emptyImage];
  if (self->inputParameterImage)
  {
    [(CIVector *)self->inputImageSize X];
    double v5 = v4;
    [(CIVector *)self->inputImageSize Y];
    double v7 = v6;
    if (-[CIFaceMaskDelta outputImage]::onceToken != -1) {
      dispatch_once(&-[CIFaceMaskDelta outputImage]::onceToken, &__block_literal_global_25);
    }
    unint64_t v8 = [(CIVector *)self->inputFacesChinX count];
    if (v8 >= [(CIVector *)self->inputFacesCenterX count]) {
      uint64_t v9 = 96;
    }
    else {
      uint64_t v9 = 112;
    }
    unint64_t v10 = [*(id *)((char *)&self->super.super.isa + v9) count];
    unint64_t v11 = [(CIVector *)self->inputFacesChinY count];
    if (v11 >= [(CIVector *)self->inputFacesCenterY count]) {
      uint64_t v12 = 104;
    }
    else {
      uint64_t v12 = 120;
    }
    unint64_t v13 = [*(id *)((char *)&self->super.super.isa + v12) count];
    long long v52 = xmmword_193953200;
    long long v53 = xmmword_193953200;
    if (v10 <= v13) {
      unint64_t v15 = v13;
    }
    else {
      unint64_t v15 = v10;
    }
    if (v15)
    {
      unint64_t v16 = v13;
      for (unint64_t i = 0; i != v15; ++i)
      {
        if (i < v10)
        {
          [(CIVector *)self->inputFacesChinX valueAtIndex:i];
          double v19 = v18;
          [(CIVector *)self->inputFacesCenterX valueAtIndex:i];
          *(float *)&double v20 = v19 - v20;
          *((_DWORD *)&v53 + i) = LODWORD(v20);
        }
        if (i < v16)
        {
          [(CIVector *)self->inputFacesChinY valueAtIndex:i];
          double v22 = v21;
          [(CIVector *)self->inputFacesCenterY valueAtIndex:i];
          float v14 = v7 / v5;
          *(float *)&double v23 = (v22 - v23) * v14;
          *((_DWORD *)&v52 + i) = LODWORD(v23);
        }
      }
      double v24 = *(float *)&v53;
      double v25 = *((float *)&v53 + 1);
      double v26 = *((float *)&v53 + 2);
      double v27 = *((float *)&v53 + 3);
      double v28 = *(float *)&v52;
      double v29 = *((float *)&v52 + 1);
      double v30 = *((float *)&v52 + 2);
      double v31 = *((float *)&v52 + 3);
    }
    else
    {
      double v31 = -1.0;
      double v30 = -1.0;
      double v29 = -1.0;
      double v28 = -1.0;
      double v27 = -1.0;
      double v26 = -1.0;
      double v25 = -1.0;
      double v24 = -1.0;
    }
    CGRect v32 = +[CIVector vectorWithX:v24 Y:v25 Z:v26 W:v27];
    float32x2_t v33 = +[CIVector vectorWithX:v28 Y:v29 Z:v30 W:v31];
    inputFacesCenterX = self->inputFacesCenterX;
    v51[0] = self->inputParameterImage;
    v51[1] = inputFacesCenterX;
    v51[2] = self->inputFacesCenterY;
    *(float *)&double v35 = v7 / v5;
    v51[3] = [NSNumber numberWithFloat:v35];
    v51[4] = v32;
    v51[5] = v33;
    float64_t v36 = NSNumber;
    SDOFFaceMaskValue(@"chinThetaLimit", self->inputTuningParameters);
    v51[6] = objc_msgSend(v36, "numberWithFloat:");
    float64_t v37 = NSNumber;
    SDOFFaceMaskValue(@"chinThetaMultip", self->inputTuningParameters);
    v51[7] = objc_msgSend(v37, "numberWithFloat:");
    float64_t v38 = +[CIVector vectorWithX:v5 Y:v7];
    inputSubtractiveMaxBlur = self->inputSubtractiveMaxBlur;
    v51[8] = v38;
    v51[9] = inputSubtractiveMaxBlur;
    inputDistanceAdd = self->inputDistanceAdd;
    v51[10] = self->inputAdditiveMaxBlur;
    v51[11] = inputDistanceAdd;
    inputMaxBlur = self->inputMaxBlur;
    v51[12] = self->inputApertureScaling;
    v51[13] = inputMaxBlur;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:14];
    [(CIImage *)self->inputParameterImage extent];
    v43 = (void *)-[CIFaceMaskDelta outputImage]::ck;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __30__CIFaceMaskDelta_outputImage__block_invoke_2;
    v48[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v48[4] = v44;
    v48[5] = v45;
    v48[6] = v46;
    v48[7] = v47;
    v49[0] = @"kCIKernelOutputFormat";
    v49[1] = @"kCIImageAlphaOne";
    v50[0] = [NSNumber numberWithInt:2053];
    v50[1] = MEMORY[0x1E4F1CC38];
    return (id)objc_msgSend(v43, "applyWithExtent:roiCallback:arguments:options:", v48, v42, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v50, v49, 2), 0.0, 0.0, v5, v7);
  }
  return result;
}

id __30__CIFaceMaskDelta_outputImage__block_invoke()
{
  id result = +[CIKernel SDOFV2MetalKernelNamed:@"_modifyFaceMask"];
  -[CIFaceMaskDelta outputImage]::ck = (uint64_t)result;
  return result;
}

double __30__CIFaceMaskDelta_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (CIVector)inputImageSize
{
  return self->inputImageSize;
}

- (void)setInputImageSize:(id)a3
{
}

- (CIImage)inputParameterImage
{
  return self->inputParameterImage;
}

- (void)setInputParameterImage:(id)a3
{
}

- (CIVector)inputFacesCenterX
{
  return self->inputFacesCenterX;
}

- (void)setInputFacesCenterX:(id)a3
{
}

- (CIVector)inputFacesCenterY
{
  return self->inputFacesCenterY;
}

- (void)setInputFacesCenterY:(id)a3
{
}

- (CIVector)inputFacesChinX
{
  return self->inputFacesChinX;
}

- (void)setInputFacesChinX:(id)a3
{
}

- (CIVector)inputFacesChinY
{
  return self->inputFacesChinY;
}

- (void)setInputFacesChinY:(id)a3
{
}

- (CIVector)inputFacesLeftEyeX
{
  return self->inputFacesLeftEyeX;
}

- (void)setInputFacesLeftEyeX:(id)a3
{
}

- (CIVector)inputFacesLeftEyeY
{
  return self->inputFacesLeftEyeY;
}

- (void)setInputFacesLeftEyeY:(id)a3
{
}

- (CIVector)inputFacesRightEyeX
{
  return self->inputFacesRightEyeX;
}

- (void)setInputFacesRightEyeX:(id)a3
{
}

- (CIVector)inputFacesRightEyeY
{
  return self->inputFacesRightEyeY;
}

- (void)setInputFacesRightEyeY:(id)a3
{
}

- (CIVector)inputK0
{
  return self->inputK0;
}

- (void)setInputK0:(id)a3
{
}

- (CIVector)inputK1
{
  return self->inputK1;
}

- (void)setInputK1:(id)a3
{
}

- (CIVector)inputK2
{
  return self->inputK2;
}

- (void)setInputK2:(id)a3
{
}

- (CIVector)inputK3
{
  return self->inputK3;
}

- (void)setInputK3:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputDistanceAdd
{
  return self->inputDistanceAdd;
}

- (void)setInputDistanceAdd:(id)a3
{
}

- (NSNumber)inputAdditiveMaxBlur
{
  return self->inputAdditiveMaxBlur;
}

- (void)setInputAdditiveMaxBlur:(id)a3
{
}

- (NSNumber)inputSubtractiveMaxBlur
{
  return self->inputSubtractiveMaxBlur;
}

- (void)setInputSubtractiveMaxBlur:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return self->inputApertureScaling;
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSNumber)inputMaxBlur
{
  return self->inputMaxBlur;
}

- (void)setInputMaxBlur:(id)a3
{
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
}

- (NSNumber)inputSubjectDistanceMinimumFocusDistance
{
  return self->inputSubjectDistanceMinimumFocusDistance;
}

- (void)setInputSubjectDistanceMinimumFocusDistance:(id)a3
{
}

- (NSNumber)inputSubjectDistanceMaximumFocusDistance
{
  return self->inputSubjectDistanceMaximumFocusDistance;
}

- (void)setInputSubjectDistanceMaximumFocusDistance:(id)a3
{
}

- (NSNumber)inputSubjectDistanceScalingFactor
{
  return self->inputSubjectDistanceScalingFactor;
}

- (void)setInputSubjectDistanceScalingFactor:(id)a3
{
}

- (NSNumber)inputSubjectDistanceOffset
{
  return self->inputSubjectDistanceOffset;
}

- (void)setInputSubjectDistanceOffset:(id)a3
{
}

@end