@interface CIAreaHistogram
+ (id)customAttributes;
- (BOOL)_inputsAreOK;
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (IRect)_netExtent;
- (NSNumber)inputCount;
- (NSNumber)inputScale;
- (id)outputData;
- (id)outputImage;
- (id)outputImageMPS;
- (id)outputImageNonMPS;
- (void)setInputCount:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIAreaHistogram

- (id)outputImageMPS
{
  v43[3] = *MEMORY[0x1E4F143B8];
  long long v38 = 0uLL;
  unint64_t v39 = 0;
  if (self)
  {
    [(CIAreaHistogram *)self _netExtent];
    unint64_t v3 = *((void *)&v38 + 1);
    unint64_t v4 = v39;
  }
  else
  {
    unint64_t v4 = 0;
    unint64_t v3 = 0;
  }
  if (v3 <= v4) {
    unint64_t v3 = v4;
  }
  if (v3 > 0x1000) {
    return 0;
  }
  uint64_t v6 = [(NSNumber *)self->inputCount unsignedIntValue];
  uint64_t v7 = v6;
  inputImage = self->inputImage;
  if (v6 < 0x100)
  {
    unsigned int v9 = 256;
LABEL_13:
    v12 = +[CIKernel kernelWithInternalRepresentation:&CI::_CIAreaHistogramScaleAndClamp];
    [(CIImage *)inputImage extent];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    *(float *)&double v13 = (float)v7 / (float)v9;
    v43[0] = inputImage;
    v43[1] = [NSNumber numberWithFloat:v13];
    v43[2] = [NSNumber numberWithUnsignedInt:v9 - 1];
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v12, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3], v14, v16, v18, v20);
    goto LABEL_14;
  }
  if ((v6 & (v6 - 1)) != 0)
  {
    unsigned int v10 = (v6 - 1) | ((v6 - 1) >> 1) | (((v6 - 1) | ((v6 - 1) >> 1)) >> 2);
    unsigned int v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
    unsigned int v9 = (v11 | HIWORD(v11)) + 1;
    goto LABEL_13;
  }
  unsigned int v9 = v6;
LABEL_14:
  uint64_t v21 = *((void *)&v38 + 1);
  unint64_t v22 = v39;
  [(NSNumber *)self->inputScale floatValue];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke;
  v32[3] = &__block_descriptor_68_e62_v24__0___CIImageProcessorInput__8___CIImageProcessorOutput__16l;
  long long v33 = v38;
  unint64_t v34 = v39;
  int v35 = v7;
  unsigned int v36 = v9;
  float v37 = v23 / (float)(v22 * v21);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke_2;
  v29[3] = &__block_descriptor_56_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  unint64_t v31 = v39;
  long long v30 = v38;
  XXH64_reset(v28, 0);
  LODWORD(__src) = v38;
  XXH64_update((uint64_t)v28, (char *)&__src, 4uLL);
  LODWORD(__src) = DWORD1(v38);
  XXH64_update((uint64_t)v28, (char *)&__src, 4uLL);
  unint64_t __src = *((void *)&v38 + 1);
  XXH64_update((uint64_t)v28, (char *)&__src, 8uLL);
  unint64_t __src = v39;
  XXH64_update((uint64_t)v28, (char *)&__src, 8uLL);
  LODWORD(__src) = v7;
  XXH64_update((uint64_t)v28, (char *)&__src, 4uLL);
  v41[0] = @"kCIImageProcessorSynchronizeInputs";
  v41[1] = @"kCIImageProcessorAllowPartialOutputRegion";
  v42[0] = MEMORY[0x1E4F1CC28];
  v42[1] = MEMORY[0x1E4F1CC28];
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"CIAreaHistogramMPS_%ubins", v7);
  unint64_t v26 = XXH64_digest((uint64_t)v28);
  if (v7 <= 0x100) {
    uint64_t v27 = 266;
  }
  else {
    uint64_t v27 = 2056;
  }
  return -[CIImage imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](inputImage, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v25, v26, v27, 2056, v24, v29, 0.0, 0.0, (double)v7, 1.0, v32);
}

void __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(_DWORD *)(a1 + 36);
  uint64_t v6 = *(int *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  unsigned int v9 = *(_DWORD *)(a1 + 56);
  uint64_t v10 = *(unsigned int *)(a1 + 60);
  int v11 = *(_DWORD *)(a1 + 64);
  int v44 = *(_DWORD *)(a1 + 60);
  unsigned int v45 = v9;
  int v43 = v11;
  v12 = (void *)[a3 metalCommandBuffer];
  if (v12)
  {
    double v13 = v12;
    v41[0] = v10;
    v41[1] = 1;
    void v41[2] = 0;
    v41[3] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    long long v42 = _Q0;
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F355A0]), "initWithDevice:histogramInfo:", objc_msgSend(v12, "device"), v41);
    if (v19)
    {
      double v20 = (void *)v19;
      [a2 region];
      CGFloat x = v46.origin.x;
      CGFloat y = v46.origin.y;
      CGFloat width = v46.size.width;
      CGFloat height = v46.size.height;
      if (CGRectIsNull(v46))
      {
        LODWORD(v25) = 0;
        int v26 = 0x7FFFFFFF;
        int v27 = 0x7FFFFFFF;
      }
      else
      {
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        if (CGRectIsInfinite(v47))
        {
          LODWORD(v25) = -1;
          int v26 = -2147483647;
          int v27 = -2147483647;
        }
        else
        {
          v48.origin.CGFloat x = x;
          v48.origin.CGFloat y = y;
          v48.size.CGFloat width = width;
          v48.size.CGFloat height = height;
          CGRect v49 = CGRectInset(v48, 0.000001, 0.000001);
          CGRect v50 = CGRectIntegral(v49);
          int v26 = (int)v50.origin.x;
          int v27 = (int)v50.origin.y;
          unint64_t v25 = (unint64_t)v50.size.height;
        }
      }
      v40[0] = v26 - v6;
      v40[1] = v5 + (int)v7 - (v27 + (int)v25);
      v40[2] = 0;
      v40[3] = v8;
      v40[4] = v7;
      v40[5] = 1;
      [v20 setClipRectSource:v40];
      uint64_t v28 = objc_msgSend(v20, "histogramSizeForSourceFormat:", objc_msgSend((id)objc_msgSend(a2, "metalTexture"), "pixelFormat"));
      v29 = objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "device");
      uint64_t v30 = [v29 newBufferWithLength:v28 options:32];
      objc_msgSend(v20, "encodeToCommandBuffer:sourceTexture:histogram:histogramOffset:", v13, objc_msgSend(a2, "metalTexture"), v30, 0);
      Kernel = CI::AreaHistogram::loadKernel(v29, @"convertMPSHistogram");
      v32 = (void *)[v13 computeCommandEncoder];
      [v32 setComputePipelineState:Kernel];
      [v32 setBytes:&v45 length:4 atIndex:0];
      [v32 setBytes:&v44 length:4 atIndex:1];
      [v32 setBytes:&v43 length:4 atIndex:2];
      [v32 setBuffer:v30 offset:0 atIndex:3];
      objc_msgSend(v32, "setTexture:atIndex:", objc_msgSend(a3, "metalTexture"), 0);
      unsigned int v33 = (v45 - 1) | ((v45 - 1) >> 1) | (((v45 - 1) | ((v45 - 1) >> 1)) >> 2) | (((v45 - 1) | ((v45 - 1) >> 1) | (((v45 - 1) | ((v45 - 1) >> 1)) >> 2)) >> 4);
      unint64_t v34 = (v33 | (v33 >> 8) | ((v33 | (v33 >> 8)) >> 16)) + 1;
      if ([Kernel maxTotalThreadsPerThreadgroup] <= v34) {
        unint64_t v34 = [Kernel maxTotalThreadsPerThreadgroup];
      }
      unint64_t v38 = v34;
      int64x2_t v39 = vdupq_n_s64(1uLL);
      unint64_t v36 = (v34 + v45 - 1) / v34;
      int64x2_t v37 = v39;
      [v32 dispatchThreadgroups:&v38 threadsPerThreadgroup:&v36];
      [v32 endEncoding];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = ___ZL16mpsAreaHistogramPU32objcproto21CIImageProcessorInput11objc_objectPU33objcproto22CIImageProcessorOutput11objc_object5IRectjjf_block_invoke;
      v35[3] = &unk_1E5770F28;
      v35[4] = v30;
      [v13 addCompletedHandler:v35];
    }
  }
}

double __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke_2(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 36);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v1 == -2147483647)
  {
    if (v2 != -2147483647 || v3 != 0xFFFFFFFFLL || v4 != 0xFFFFFFFFLL) {
      return (double)v1;
    }
    uint64_t v8 = MEMORY[0x1E4F1DB10];
  }
  else
  {
    if (v1 != 0x7FFFFFFF || v2 != 0x7FFFFFFF || v3 != 0 || v4 != 0) {
      return (double)v1;
    }
    uint64_t v8 = MEMORY[0x1E4F1DB20];
  }
  return *(double *)v8;
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryReduction";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"8";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.5";
  v8[3] = @"inputCount";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7B70;
  v6[1] = &unk_1EE4A7B80;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A7B90;
  v6[3] = &unk_1EE4A7BA0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7BB0;
  v6[5] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputScale";
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
  if (self->inputImage)
  {
    if ([(NSNumber *)self->inputCount intValue] - 2049 > 0xFFFFF7FF)
    {
      [(CIAreaHistogram *)self _netExtent];
      return 1;
    }
    NSLog(&cfstr_Ciareahistogra_0.isa);
  }
  return 0;
}

- (id)outputData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(CIAreaHistogram *)self _inputsAreOK]) {
    return 0;
  }
  int v3 = [(NSNumber *)self->inputCount intValue];
  if ((v3 - 257) <= 0xFFFFFEFF)
  {
    NSLog(&cfstr_Ciareahistogra_2.isa);
    return 0;
  }
  int v6 = v3;
  if (v3 <= 0xFF) {
    -[CIImage filteredImage:keysAndValues:](self->inputImage, "filteredImage:keysAndValues:", @"CIExposureAdjust", @"inputEV", [NSNumber numberWithDouble:(double)log2((double)v3 * 0.00390625)], 0);
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  [(CIAreaHistogram *)self _netExtent];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:(16 * v6)];
  bzero((void *)[v4 mutableBytes], objc_msgSend(v4, "length"));
  return v4;
}

- (id)outputImageNonMPS
{
  v37[2] = *MEMORY[0x1E4F143B8];
  long long v34 = 0uLL;
  double v35 = 0.0;
  if (self) {
    [(CIAreaHistogram *)self _netExtent];
  }
  uint64_t v3 = [(NSNumber *)self->inputCount intValue];
  [(NSNumber *)self->inputScale doubleValue];
  double v5 = v4;
  unint64_t v6 = *((void *)&v34 + 1);
  unint64_t v7 = *(void *)&v35;
  inputImage = self->inputImage;
  double v9 = (double)(int)v3;
  if ((int)v3 <= 255)
  {
    uint64_t v10 = +[CIKernel kernelWithInternalRepresentation:&CI::_CIAreaHistogramScale];
    [(CIImage *)inputImage extent];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = v9 * 0.00390625;
    *(float *)&double v19 = v9 * 0.00390625;
    v37[0] = inputImage;
    v37[1] = [NSNumber numberWithFloat:v19];
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v10, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2], v12, v14, v16, v18);
  }
  if ((int)v3 <= 256) {
    uint64_t v20 = 266;
  }
  else {
    uint64_t v20 = 2056;
  }
  XXH64_reset(v33, 0);
  LODWORD(__src) = v34;
  XXH64_update((uint64_t)v33, (char *)&__src, 4uLL);
  LODWORD(__src) = DWORD1(v34);
  XXH64_update((uint64_t)v33, (char *)&__src, 4uLL);
  double __src = *((double *)&v34 + 1);
  XXH64_update((uint64_t)v33, (char *)&__src, 8uLL);
  double __src = v35;
  XXH64_update((uint64_t)v33, (char *)&__src, 8uLL);
  LODWORD(__src) = v3;
  XXH64_update((uint64_t)v33, (char *)&__src, 4uLL);
  double v21 = v5 / ((double)v6 * (double)v7);
  double __src = v21;
  XXH64_update((uint64_t)v33, (char *)&__src, 8uLL);
  uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"CIAreaHistogram_%dbins", v3);
  unint64_t v23 = XXH64_digest((uint64_t)v33);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __36__CIAreaHistogram_outputImageNonMPS__block_invoke;
  v30[3] = &__block_descriptor_56_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  long long v31 = v34;
  double v32 = v35;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __36__CIAreaHistogram_outputImageNonMPS__block_invoke_2;
  v25[3] = &__block_descriptor_68_e62_v24__0___CIImageProcessorInput__8___CIImageProcessorOutput__16l;
  int v29 = v3;
  long long v26 = v34;
  double v27 = v35;
  double v28 = v21;
  return -[CIImage imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](inputImage, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v22, v23, v20, 2056, 0, v30, 0.0, 0.0, (double)(int)v3, 1.0, v25);
}

double __36__CIAreaHistogram_outputImageNonMPS__block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 36);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v1 == -2147483647)
  {
    if (v2 != -2147483647 || v3 != 0xFFFFFFFFLL || v4 != 0xFFFFFFFFLL) {
      return (double)v1;
    }
    uint64_t v8 = MEMORY[0x1E4F1DB10];
  }
  else
  {
    if (v1 != 0x7FFFFFFF || v2 != 0x7FFFFFFF || v3 != 0 || v4 != 0) {
      return (double)v1;
    }
    uint64_t v8 = MEMORY[0x1E4F1DB20];
  }
  return *(double *)v8;
}

void __36__CIAreaHistogram_outputImageNonMPS__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(int *)(a1 + 64);
  int v6 = *(_DWORD *)(a1 + 32);
  unint64_t v63 = *(void *)(a1 + 40);
  v61 = *(vImagePixelCount **)(a1 + 48);
  double v64 = *(double *)(a1 + 56);
  uint64_t v58 = [a2 baseAddress];
  [a2 region];
  CGFloat x = v71.origin.x;
  CGFloat y = v71.origin.y;
  CGFloat width = v71.size.width;
  CGFloat height = v71.size.height;
  if (CGRectIsNull(v71))
  {
    int v11 = 0x7FFFFFFF;
  }
  else
  {
    v72.origin.CGFloat x = x;
    v72.origin.CGFloat y = y;
    v72.size.CGFloat width = width;
    v72.size.CGFloat height = height;
    if (CGRectIsInfinite(v72))
    {
      int v11 = -2147483647;
    }
    else
    {
      v73.origin.CGFloat x = x;
      v73.origin.CGFloat y = y;
      v73.size.CGFloat width = width;
      v73.size.CGFloat height = height;
      CGRect v74 = CGRectInset(v73, 0.000001, 0.000001);
      int v11 = (int)COERCE_DOUBLE(CGRectIntegral(v74));
    }
  }
  v60 = (vImagePixelCount *)[a2 bytesPerRow];
  if ((int)v5 <= 256) {
    uint64_t v12 = 256;
  }
  else {
    uint64_t v12 = v5;
  }
  LODWORD(v13) = 4 * v12;
  v69[0] = (vImagePixelCount *)malloc_type_calloc((4 * v12), 8uLL, 0x100004000313F17uLL);
  v69[1] = &v69[0][v12];
  uint64_t v14 = (2 * v12);
  double v15 = &v69[0][v14];
  uint64_t v16 = (3 * v12);
  v62 = v69[0];
  v69[2] = v15;
  v69[3] = &v69[0][v16];
  if ([a2 format] == 2056)
  {
    v57 = a3;
    double v17 = (vImagePixelCount *)malloc_type_calloc((4 * v12), 8uLL, 0x100004000313F17uLL);
    histogram[0] = v17;
    histogram[1] = &v17[v12];
    histogram[2] = &v17[v14];
    histogram[3] = &v17[v16];
    double v18 = malloc_type_malloc(16 * v63, 0xF7514CFuLL);
    int v19 = v6;
    uint64_t v20 = v18;
    BOOL v21 = v19 <= v11;
    int v22 = 8 * (v19 - v11);
    if (v21) {
      int v22 = 0;
    }
    if (v61)
    {
      unint64_t v23 = 0;
      uint64_t v24 = v58 + v22;
      uint64x2_t v25 = vshlq_u64((uint64x2_t)vdupq_n_s64(v63), (uint64x2_t)xmmword_19394CB90);
      if (v13 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v13;
      }
      uint64x2_t v59 = v25;
      vImagePixelCount v26 = v25.i64[0];
      do
      {
        src.data = (void *)(v24 + (void)v23 * (void)v60);
        src.CGFloat height = 1;
        *(uint64x2_t *)&src.CGFloat width = v59;
        dest.data = v20;
        dest.CGFloat height = 1;
        dest.CGFloat width = v26;
        dest.rowBytes = 16 * v63;
        vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
        v65.data = v20;
        v65.CGFloat height = 1;
        v65.CGFloat width = v63;
        v65.rowBytes = 16 * v63;
        vImageHistogramCalculation_ARGBFFFF(&v65, histogram, v12, 0.0, 1.0, 0x10u);
        double v27 = v17;
        double v28 = v62;
        uint64_t v29 = v13;
        do
        {
          uint64_t v30 = *v27++;
          *v28++ += v30;
          --v29;
        }
        while (v29);
        unint64_t v23 = (vImagePixelCount *)((char *)v23 + 1);
      }
      while (v23 != v61);
    }
    free(v17);
    if (v20) {
      free(v20);
    }
    a3 = v57;
  }
  else if ([a2 format] == 264)
  {
    int v31 = 4 * (v6 - v11);
    if (v6 <= v11) {
      int v31 = 0;
    }
    histogram[0] = (vImagePixelCount *)(v58 + v31);
    histogram[1] = v61;
    histogram[2] = (vImagePixelCount *)v63;
    histogram[3] = v60;
    vImageHistogramCalculation_ARGB8888((const vImage_Buffer *)histogram, v69, 0x10u);
  }
  else if ([a2 format] == 266)
  {
    int v32 = 4 * (v6 - v11);
    if (v6 <= v11) {
      int v32 = 0;
    }
    histogram[0] = (vImagePixelCount *)(v58 + v32);
    histogram[1] = v61;
    histogram[2] = (vImagePixelCount *)v63;
    histogram[3] = v60;
    vImageHistogramCalculation_ARGB8888((const vImage_Buffer *)histogram, v69, 0x10u);
    v69[2] = v62;
    v69[0] = v15;
  }
  if ((int)v5 <= 255)
  {
    uint64_t v33 = (int)v5 - 1;
    long long v34 = v69[0];
    double v35 = v69[1];
    unint64_t v36 = v69[2];
    int64x2_t v37 = v69[3];
    do
    {
      v34[v33] += v34[v5];
      v35[v33] += v35[v5];
      v36[v33] += v36[v5];
      v37[v33] += v37[v5++];
    }
    while (v5 != 256);
  }
  uint64_t v38 = [a3 baseAddress];
  [a3 region];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  uint64_t v45 = [a3 bytesPerRow];
  int v46 = CI_FLIP_IMAGE_PROCESSOR();
  if (v44 <= 1.0 || v46 == 0) {
    unint64_t v48 = 0;
  }
  else {
    unint64_t v48 = (v45 * (unint64_t)(v44 + -1.0)) >> 1;
  }
  int v49 = (int)(v40 + v42);
  int v50 = v49 - (int)v40;
  double v51 = v64;
  if (v49 > (int)v40)
  {
    int v52 = 0;
    unint64_t v53 = v38 + 2 * v48;
    uint64_t v54 = (int)v40;
    do
    {
      v55.i64[0] = v69[2][v54];
      v55.i64[1] = v69[3][v54];
      v56.i64[0] = v69[0][v54];
      v56.i64[1] = v69[1][v54];
      *(float32x4_t *)&dest.data = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_u64(v56), v51)), vmulq_n_f64(vcvtq_f64_u64(v55), v51));
      histogram[0] = (vImagePixelCount *)&dest;
      *(_OWORD *)&histogram[1] = xmmword_19394CBA0;
      histogram[3] = (vImagePixelCount *)16;
      src.data = (void *)(v53 + 2 * v52);
      *(_OWORD *)&src.CGFloat height = xmmword_19394CBA0;
      src.rowBytes = 8;
      vImageConvert_PlanarFtoPlanar16F((const vImage_Buffer *)histogram, &src, 0);
      double v51 = v64;
      v52 += 4;
      ++v54;
      --v50;
    }
    while (v50);
  }
  free(v62);
}

- (id)outputImage
{
  if (![(CIAreaHistogram *)self _inputsAreOK]) {
    return 0;
  }
  if (self) {
    [(CIAreaHistogram *)self _netExtent];
  }
  return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor")), "imageByCroppingToRect:", 0.0, 0.0, (double)[(NSNumber *)self->inputCount intValue], 1.0);
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

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
}

@end