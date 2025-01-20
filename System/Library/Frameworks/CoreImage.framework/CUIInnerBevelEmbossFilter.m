@interface CUIInnerBevelEmbossFilter
- (id)_kernelInvertMask;
- (id)_kernelMultiplyByMask;
- (id)outputImage;
@end

@implementation CUIInnerBevelEmbossFilter

- (id)_kernelInvertMask
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_invertedMask];
}

- (id)_kernelMultiplyByMask
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_multiplyByMask];
}

- (id)outputImage
{
  v55[1] = *MEMORY[0x1E4F143B8];
  if ([(NSNumber *)self->super.inputSize unsignedIntValue] > 0x31) {
    unsigned int v3 = 50;
  }
  else {
    unsigned int v3 = [(NSNumber *)self->super.inputSize unsignedIntValue];
  }
  [(NSNumber *)self->super.inputSoften doubleValue];
  inputImage = self->super.inputImage;
  if (!inputImage) {
    return 0;
  }
  double v6 = fmax(v4, 0.0);
  double v7 = fmin(v6, 50.0);
  float v8 = fmax((double)v3 * 0.21, 0.5);
  id v9 = [(CUIInnerBevelEmbossFilter *)self _kernelInvertMask];
  double v10 = *MEMORY[0x1E4F1DB10];
  double v11 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v55[0] = inputImage;
  v14 = (CIImage *)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v55, 1), v10, v11, v12, v13);
  v15 = v14;
  if (v8 != 0.5 || v7 > 4.0)
  {
    v17 = _CUIMappedBlurImageWithSize(v14, fmin(v6, 2.0), 0);
    v18 = _CUIMappedBlurImageWithSize(v17, v3, 0);
    if (v8 == 0.5)
    {
      long long v52 = xmmword_1939575E8;
      long long v53 = unk_1939575F8;
      unint64_t v54 = 0xBFC4CCCCCCCCCCCDLL;
      long long v50 = xmmword_1939575C8;
      long long v51 = unk_1939575D8;
      uint64_t v19 = [(CIImage *)v18 filteredImage:@"CIConvolution3X3", @"inputWeights", +[CIVector vectorWithValues:&v50 count:9], @"inputBias", &unk_1EE4AA380, 0 keysAndValues];
    }
    else
    {
      v37 = +[CIVector vectorWithX:(float)-v8 Y:v8];
      id v38 = [(CUIOuterBevelEmbossFilter *)self _kernel];
      [(CIImage *)v18 extent];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __40__CUIInnerBevelEmbossFilter_outputImage__block_invoke;
      v43[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      float v44 = v8;
      v47[0] = v18;
      v47[1] = v37;
      uint64_t v19 = objc_msgSend(v38, "applyWithExtent:roiCallback:arguments:", v43, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 2), v39, v40, v41, v42);
    }
  }
  else
  {
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    unint64_t v54 = 0;
    long long v52 = 0x3FF0000000000000uLL;
    v48[3] = 0u;
    memset(v48, 0, 32);
    uint64_t v49 = 0;
    v48[2] = 0x3FF0000000000000uLL;
    if (v7 > 0.0)
    {
      int v21 = 1;
      do
      {
        convolve((double *)&v50, dbl_1939575B0);
        convolve((double *)v48, dbl_1939575B0);
        double v22 = (double)v21++;
      }
      while (v7 > v22);
    }
    convolve((double *)&v50, dbl_1939575B0);
    convolve((double *)v48, dbl_1939575B0);
    convolve((double *)&v50, dbl_1939575B0);
    uint64_t v19 = objc_msgSend(-[CIImage filteredImage:keysAndValues:](v15, "filteredImage:keysAndValues:", @"CIConvolution9Horizontal", @"inputWeights", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v50, 9, convolve((double *)v48, dbl_193957598).n128_f64[0]), @"inputBias", &unk_1EE4AA2F0, 0), "filteredImage:keysAndValues:", @"CIConvolution9Vertical", @"inputWeights", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v48, 9), @"inputBias",
            &unk_1EE4AA380,
            0);
  }
  v23 = (void *)v19;
  id v24 = [(CUIOuterBevelEmbossFilter *)self _kernelC];
  [v23 extent];
  inputHighlightColor = self->super.inputHighlightColor;
  v46[0] = v23;
  v46[1] = inputHighlightColor;
  v46[2] = self->super.inputShadowColor;
  uint64_t v30 = objc_msgSend(v24, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v46, 3), v26, v27, v28, v29);
  id v31 = [(CUIInnerBevelEmbossFilter *)self _kernelMultiplyByMask];
  [(CIImage *)self->super.inputImage extent];
  v32 = self->super.inputImage;
  v45[0] = v30;
  v45[1] = v32;
  return (id)objc_msgSend(v31, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v45, 2), v33, v34, v35, v36);
}

double __40__CUIInnerBevelEmbossFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5 = (float)-ceilf(fabsf(*(float *)(a1 + 32)) + 0.5);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

@end