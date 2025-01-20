@interface CIAreaHoughTransform
+ (id)customAttributes;
- (BOOL)_inputsAreOK;
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (IRect)_netExtent;
- (NSNumber)inputGradientMax;
- (NSNumber)inputGradientMin;
- (id)outputImage;
- (void)setInputExtent:(id)a3;
- (void)setInputGradientMax:(id)a3;
- (void)setInputGradientMin:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIAreaHoughTransform

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryReduction";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v9[1] = @"18";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"15.0";
  v8[3] = @"inputGradientMin";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7BC0;
  v6[1] = &unk_1EE4A7BC0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A7B70;
  v6[3] = &unk_1EE4A7BE0;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputGradientMax";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7BC0;
  v4[1] = &unk_1EE4A7BC0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7B70;
  v4[3] = &unk_1EE4A7B70;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (IRect)_netExtent
{
  [(CIImage *)self->inputImage extent];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CIVector *)self->inputExtent CGRectValue];
  v34.origin.CGFloat x = v13;
  v34.origin.CGFloat y = v14;
  v34.size.CGFloat width = v15;
  v34.size.CGFloat height = v16;
  v26.origin.CGFloat x = v6;
  v26.origin.CGFloat y = v8;
  v26.size.CGFloat width = v10;
  v26.size.CGFloat height = v12;
  CGRect v27 = CGRectIntersection(v26, v34);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  result = (IRect *)CGRectIsEmpty(v27);
  if (result) {
    goto LABEL_3;
  }
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRect v29 = CGRectIntegral(v28);
  CGFloat v22 = v29.origin.x;
  CGFloat v23 = v29.origin.y;
  CGFloat v24 = v29.size.width;
  CGFloat v25 = v29.size.height;
  result = (IRect *)CGRectIsNull(v29);
  if (result)
  {
LABEL_3:
    retstr->var1.var1 = 0;
    *(_OWORD *)&retstr->var0.var0 = IRectNull;
  }
  else
  {
    v30.origin.CGFloat x = v22;
    v30.origin.CGFloat y = v23;
    v30.size.CGFloat width = v24;
    v30.size.CGFloat height = v25;
    result = (IRect *)CGRectIsInfinite(v30);
    if (result)
    {
      *(_OWORD *)&retstr->var0.var0 = IRectInfinite;
      retstr->var1.var1 = 0xFFFFFFFFLL;
    }
    else
    {
      v31.origin.CGFloat x = v22;
      v31.origin.CGFloat y = v23;
      v31.size.CGFloat width = v24;
      v31.size.CGFloat height = v25;
      CGRect v32 = CGRectInset(v31, 0.000001, 0.000001);
      CGRect v33 = CGRectIntegral(v32);
      retstr->var0.var0 = (int)v33.origin.x;
      retstr->var0.var1 = (int)v33.origin.y;
      retstr->var1.var0 = (unint64_t)v33.size.width;
      retstr->var1.var1 = (unint64_t)v33.size.height;
    }
  }
  return result;
}

- (BOOL)_inputsAreOK
{
  if (!self->inputImage) {
    return 0;
  }
  [(CIAreaHoughTransform *)self _netExtent];
  return 1;
}

- (id)outputImage
{
  v40[4] = *MEMORY[0x1E4F143B8];
  if (![(CIAreaHoughTransform *)self _inputsAreOK]) {
    return 0;
  }
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  unint64_t v35 = 0;
  if (!self) {
    return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor")), "imageByCroppingToRect:", 0.0, 0.0, 256.0, 180.0);
  }
  [(CIAreaHoughTransform *)self _netExtent];
  unint64_t v3 = v34;
  if (!v34) {
    return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor")), "imageByCroppingToRect:", 0.0, 0.0, 256.0, 180.0);
  }
  unint64_t v4 = v35;
  if (!v35) {
    return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor")), "imageByCroppingToRect:", 0.0, 0.0, 256.0, 180.0);
  }
  double v5 = [(CIImage *)self->inputImage imageBySettingProperties:MEMORY[0x1E4F1CC08]];
  CGAffineTransformMakeTranslation(&v32, (double)-(int)v33, (double)-HIDWORD(v33));
  CGFloat v6 = -[CIImage imageByApplyingFilter:](-[CIImage imageByCroppingToRect:]([(CIImage *)v5 imageByApplyingTransform:&v32], "imageByCroppingToRect:", 0.0, 0.0, (double)v3, (double)v4), "imageByApplyingFilter:", @"CIGaborGradients");
  double v7 = +[CIKernel kernelWithInternalRepresentation:&CI::_prepHoughTransform];
  float v8 = hypotf((float)v3, (float)v4);
  [(NSNumber *)self->inputGradientMin floatValue];
  float v10 = fmaxf(v9, 0.0);
  [(NSNumber *)self->inputGradientMax floatValue];
  float v12 = v10 + 0.00001;
  float v13 = fmaxf(fmaxf(v11, 0.0), v12);
  [(CIImage *)v6 extent];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v40[0] = v6;
  *(float *)&double v14 = v8;
  v40[1] = [NSNumber numberWithFloat:v14];
  *(float *)&double v22 = v10;
  v40[2] = [NSNumber numberWithFloat:v22];
  *(float *)&double v23 = v13;
  v40[3] = [NSNumber numberWithFloat:v23];
  CGFloat v24 = -[CIColorKernel applyWithExtent:arguments:](v7, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4], v15, v17, v19, v21);
  v38[0] = @"kCIImageProcessorSynchronizeInputs";
  v38[1] = @"kCIImageProcessorAllowPartialOutputRegion";
  uint64_t v25 = MEMORY[0x1E4F1CC28];
  v39[0] = MEMORY[0x1E4F1CC38];
  v39[1] = MEMORY[0x1E4F1CC28];
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __35__CIAreaHoughTransform_outputImage__block_invoke_2;
  v31[3] = &__block_descriptor_48_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v31[4] = v3;
  v31[5] = v4;
  uint64_t v27 = [(CIImage *)v24 imageWithExtent:@"CIAreaHoughTransform", v4 | (v3 << 32), 266, 2309, v26, v31, 0.0, 0.0, 256.0, 180.0, &__block_literal_global_1 processorDescription argumentDigest inputFormat outputFormat options roiCallback processor];
  v36[0] = @"kCIImageProcessorSynchronizeInputs";
  v36[1] = @"kCIImageProcessorAllowPartialOutputRegion";
  v37[0] = v25;
  v37[1] = v25;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __35__CIAreaHoughTransform_outputImage__block_invoke_5;
  v30[3] = &__block_descriptor_48_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v30[4] = v3;
  v30[5] = v4;
  return +[CIImage imageForRenderingWithMetal:[(CIImage *)v24 imageWithExtent:@"CIAreaHoughTransformMetal", v4 | (v3 << 32), 266, 2053, v28, v30, 0.0, 0.0, 256.0, 180.0, &__block_literal_global_249 processorDescription argumentDigest inputFormat outputFormat options roiCallback processor], v27 orNonMetal];
}

uint64_t __35__CIAreaHoughTransform_outputImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [a2 region];
  double v6 = v5;
  unint64_t v8 = (unint64_t)v7;
  uint64_t v9 = [a2 bytesPerRow];
  uint64_t v10 = [a2 baseAddress];
  bzero(v24, 0x2D000uLL);
  if (v8)
  {
    uint64_t v11 = 0;
    float v12 = (unsigned __int8 *)(v10 + 1);
    do
    {
      unint64_t v13 = (unint64_t)v6;
      for (i = v12; v13; --v13)
      {
        unsigned int v15 = *i;
        BOOL v16 = v15 <= 0xB3;
        LODWORD(v17) = 179 - v15;
        if (v16) {
          uint64_t v17 = v17;
        }
        else {
          uint64_t v17 = 0;
        }
        *(_DWORD *)&v24[1024 * v17 + 4 * i[1]] += *(i - 1);
        i += 4;
      }
      ++v11;
      v12 += v9;
    }
    while (v11 != v8);
  }
  uint64_t v18 = [a3 baseAddress];
  uint64_t result = [a3 bytesPerRow];
  uint64_t v20 = 0;
  double v21 = v24;
  float32x4_t v22 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    for (uint64_t j = 0; j != 1024; j += 16)
      *(float32x4_t *)(v18 + j) = vdivq_f32(vcvtq_f32_u32(*(uint32x4_t *)&v21[j]), v22);
    ++v20;
    v21 += 1024;
    v18 += result;
  }
  while (v20 != 180);
  return result;
}

double __35__CIAreaHoughTransform_outputImage__block_invoke_2()
{
  return 0.0;
}

uint64_t __35__CIAreaHoughTransform_outputImage__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  [a2 region];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = (void *)[a3 metalCommandBuffer];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "commandQueue"), "device");
  uint64_t v11 = [v10 newBufferWithLength:184320 options:32];
  Kernel = CI::AreaHistogram::loadKernel(v10, @"computeHoughHistogram");
  unint64_t v13 = (void *)[v9 computeCommandEncoder];
  [v13 setComputePipelineState:Kernel];
  [v13 setBuffer:v11 offset:0 atIndex:0];
  [v13 setBytes:&HoughBins_h length:4 atIndex:1];
  [v13 setBytes:&HoughBins_v length:4 atIndex:2];
  objc_msgSend(v13, "setTexture:atIndex:", objc_msgSend(a2, "metalTexture"), 0);
  v25[0] = (v6 + 15) & 0xFFFFFFF0;
  v25[1] = (v8 + 15) & 0xFFFFFFF0;
  v25[2] = 1;
  int64x2_t v17 = vdupq_n_s64(0x10uLL);
  int64x2_t v23 = v17;
  uint64_t v24 = 1;
  [v13 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v13 endEncoding];
  double v14 = CI::AreaHistogram::loadKernel(v10, @"convertHoughHistogram");
  unsigned int v15 = (void *)[v9 computeCommandEncoder];
  [v15 setComputePipelineState:v14];
  objc_msgSend(v15, "setTexture:atIndex:", objc_msgSend(a3, "metalTexture"), 0);
  [v15 setBuffer:v11 offset:0 atIndex:0];
  [v15 setBytes:&HoughBins_h length:4 atIndex:1];
  [v15 setBytes:&HoughBins_v length:4 atIndex:2];
  long long v21 = xmmword_19394CBB0;
  uint64_t v22 = 1;
  int64x2_t v19 = v17;
  uint64_t v20 = 1;
  [v15 dispatchThreads:&v21 threadsPerThreadgroup:&v19];
  [v15 endEncoding];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__CIAreaHoughTransform_outputImage__block_invoke_4;
  v18[3] = &unk_1E5770F28;
  v18[4] = v11;
  return [v9 addCompletedHandler:v18];
}

void __35__CIAreaHoughTransform_outputImage__block_invoke_4(uint64_t a1)
{
}

double __35__CIAreaHoughTransform_outputImage__block_invoke_5()
{
  return 0.0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

- (NSNumber)inputGradientMin
{
  return self->inputGradientMin;
}

- (void)setInputGradientMin:(id)a3
{
}

- (NSNumber)inputGradientMax
{
  return self->inputGradientMax;
}

- (void)setInputGradientMax:(id)a3
{
}

@end