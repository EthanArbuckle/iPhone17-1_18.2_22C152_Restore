@interface CIAccordionFoldTransition
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (NSNumber)inputBottomHeight;
- (NSNumber)inputFoldShadowAmount;
- (NSNumber)inputNumberOfFolds;
- (NSNumber)inputTime;
- (id)_kernel;
- (id)_kernelMix;
- (id)_kernelWarpS;
- (id)_kernelWarpT;
- (id)outputImage;
- (void)setInputBottomHeight:(id)a3;
- (void)setInputFoldShadowAmount:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputNumberOfFolds:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
@end

@implementation CIAccordionFoldTransition

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryTransition";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"8";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.10";
  v12[3] = @"inputBottomHeight";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeDefault";
  v10[0] = &unk_1EE4A7B10;
  v10[1] = &unk_1EE4A7B10;
  v9[2] = @"CIAttributeType";
  v10[2] = @"CIAttributeTypeDistance";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  v12[4] = @"inputNumberOfFolds";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4AA3D0;
  v8[1] = &unk_1EE4AA3D0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4AA3E8;
  v8[3] = &unk_1EE4AA400;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4AA418;
  v8[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputFoldShadowAmount";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7B10;
  v6[1] = &unk_1EE4A7B10;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A7B20;
  v6[3] = &unk_1EE4A7B20;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7B30;
  v6[5] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v12[6] = @"inputTime";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7B10;
  v4[1] = &unk_1EE4A7B10;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7B20;
  v4[3] = &unk_1EE4A7B10;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7B10;
  v4[5] = @"CIAttributeTypeTime";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)_kernelWarpS
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_accordianWarpS];
}

- (id)_kernelWarpT
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_accordianWarpT];
}

- (id)_kernelMix
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_accordionMix];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_accordionFoldTransition];
}

- (id)outputImage
{
  v74[2] = *MEMORY[0x1E4F143B8];
  p_inputImage = (id *)&self->inputImage;
  id result = self->inputImage;
  if (!result) {
    return result;
  }
  [result extent];
  if (CGRectIsInfinite(v76)) {
    return 0;
  }
  p_inputTargetImage = &self->inputTargetImage;
  id result = self->inputTargetImage;
  if (!result) {
    return result;
  }
  [result extent];
  if (CGRectIsInfinite(v77)) {
    return 0;
  }
  [(NSNumber *)self->inputNumberOfFolds doubleValue];
  double v7 = v6;
  [(NSNumber *)self->inputTime doubleValue];
  double v9 = fmin(fmax(v8, 0.0), 1.0);
  [(NSNumber *)self->inputFoldShadowAmount doubleValue];
  double v11 = v10;
  [(NSNumber *)self->inputBottomHeight doubleValue];
  if (v9 <= 0.0)
  {
    id v58 = *p_inputImage;
  }
  else
  {
    if (v9 < 1.0)
    {
      double v61 = fmin(fmax(round(v7), 0.0), 50.0);
      double v62 = fmin(fmax(v11, 0.0), 1.0);
      double v60 = fmax(v12, 0.0);
      [*p_inputImage extent];
      double v14 = v13;
      [(CIImage *)*p_inputTargetImage extent];
      if (v14 <= v15) {
        v16 = &self->inputTargetImage;
      }
      else {
        v16 = (CIImage **)p_inputImage;
      }
      if (v14 <= v15) {
        v17 = p_inputImage;
      }
      else {
        v17 = (id *)&self->inputTargetImage;
      }
      if (v14 <= v15) {
        double v18 = v9;
      }
      else {
        double v18 = 1.0 - v9;
      }
      id v19 = *v17;
      v20 = *v16;
      objc_msgSend(*v17, "extent", 1.0 - v9);
      double v22 = v21;
      double v66 = v21;
      [v19 extent];
      double v24 = v23;
      [v19 extent];
      double v65 = v24 + v25 * 0.5;
      [(CIImage *)v20 extent];
      double v27 = v26;
      double v64 = v26;
      [(CIImage *)v20 extent];
      double v29 = v28;
      [(CIImage *)v20 extent];
      double v63 = v29 + v30 * 0.5;
      CGAffineTransformMakeTranslation(&v71, -v65, -v22);
      v31 = (void *)[v19 imageByApplyingTransform:&v71];
      CGAffineTransformMakeTranslation(&v70, -v63, -v27);
      v32 = [(CIImage *)v20 imageByApplyingTransform:&v70];
      [v31 extent];
      double v34 = v33;
      [v31 extent];
      double v36 = v35;
      [v31 extent];
      double v38 = v37;
      [(CIImage *)v32 extent];
      double v40 = v39;
      [(CIImage *)v32 extent];
      double v42 = v41;
      [(CIImage *)v32 extent];
      double v44 = fmin(v43, v38);
      double v45 = fmax(v40, v34);
      double v46 = v42 - v36;
      double v47 = v36 + v18 * (v42 - v36);
      double v48 = (1.0 - v18) * v46;
      v49 = +[CIVector vectorWithX:v60 Y:v18 * v46 Z:1.0 / v18 W:v48];
      double v50 = v48 / (v61 * (v34 + v40));
      v51 = +[CIVector vectorWithX:v61 + v61 Y:v50 Z:v62 * (1.0 - v18)];
      id v52 = [(CIAccordionFoldTransition *)self _kernelWarpS];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __40__CIAccordionFoldTransition_outputImage__block_invoke;
      v69[3] = &unk_1E5770DE0;
      v69[4] = v49;
      *(double *)&v69[5] = v50;
      v74[0] = v51;
      v74[1] = v49;
      uint64_t v53 = objc_msgSend(v52, "applyWithExtent:roiCallback:inputImage:arguments:", v69, v31, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v74, 2), v44, 0.0, v45, v47);
      id v54 = [(CIAccordionFoldTransition *)self _kernelWarpT];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __40__CIAccordionFoldTransition_outputImage__block_invoke_2;
      v68[3] = &unk_1E5770DE0;
      v68[4] = v49;
      *(double *)&v68[5] = v50;
      v73[0] = v51;
      v73[1] = v49;
      uint64_t v55 = objc_msgSend(v54, "applyWithExtent:roiCallback:inputImage:arguments:", v68, v32, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v73, 2), v44, 0.0, v45, v47);
      id v56 = [(CIAccordionFoldTransition *)self _kernelMix];
      v72[0] = v53;
      v72[1] = v55;
      v72[2] = v51;
      v72[3] = [NSNumber numberWithDouble:v18];
      v72[4] = v49;
      v57 = objc_msgSend(v56, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v72, 5), v44, 0.0, v45, v47);
      CGAffineTransformMakeTranslation(&v67, v65 + v18 * (v63 - v65), v66 + v18 * (v64 - v66));
      return (id)[v57 imageByApplyingTransform:&v67];
    }
    id v58 = *p_inputTargetImage;
  }
  id v59 = v58;

  return v59;
}

double __40__CIAccordionFoldTransition_outputImage__block_invoke(uint64_t a1, double a2)
{
  v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  [v3 X];
  [v3 Y];
  return a2 * (v4 + 1.0);
}

double __40__CIAccordionFoldTransition_outputImage__block_invoke_2(uint64_t a1, double a2)
{
  v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  [v3 X];
  [v3 Y];
  [v3 Z];
  [v3 W];
  [v3 Z];
  [v3 W];
  return a2 * (v4 + 1.0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
}

- (NSNumber)inputBottomHeight
{
  return self->inputBottomHeight;
}

- (void)setInputBottomHeight:(id)a3
{
}

- (NSNumber)inputNumberOfFolds
{
  return self->inputNumberOfFolds;
}

- (void)setInputNumberOfFolds:(id)a3
{
}

- (NSNumber)inputFoldShadowAmount
{
  return self->inputFoldShadowAmount;
}

- (void)setInputFoldShadowAmount:(id)a3
{
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
}

@end