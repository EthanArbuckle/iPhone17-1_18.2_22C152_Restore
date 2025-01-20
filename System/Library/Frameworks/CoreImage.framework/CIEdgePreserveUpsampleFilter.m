@interface CIEdgePreserveUpsampleFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputSmallImage;
- (NSNumber)inputLumaSigma;
- (NSNumber)inputSpatialSigma;
- (id)_kernelGuideCombine;
- (id)_kernelGuideCombine4;
- (id)_kernelGuideMono;
- (id)_kernelJointUpsamp;
- (id)_kernelJointUpsampRG;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputLumaSigma:(id)a3;
- (void)setInputSmallImage:(id)a3;
- (void)setInputSpatialSigma:(id)a3;
@end

@implementation CIEdgePreserveUpsampleFilter

+ (id)customAttributes
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryGeometryAdjustment";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryInterlaced";
  v9[4] = @"CICategoryNonSquarePixels";
  v9[5] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  v11[1] = @"10";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.12";
  v10[3] = @"inputSpatialSigma";
  v7[0] = @"CIAttributeClass";
  v2 = (objc_class *)objc_opt_class();
  v8[0] = NSStringFromClass(v2);
  v8[1] = &unk_1EE4A89E0;
  v7[1] = @"CIAttributeDefault";
  v7[2] = @"CIAttributeMin";
  v8[2] = &unk_1EE4A89F0;
  v8[3] = &unk_1EE4A8A00;
  v7[3] = @"CIAttributeMax";
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeScalar";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[4] = @"inputLumaSigma";
  v5[0] = @"CIAttributeClass";
  v3 = (objc_class *)objc_opt_class();
  v6[0] = NSStringFromClass(v3);
  v6[1] = &unk_1EE4A8A10;
  v5[1] = @"CIAttributeDefault";
  v5[2] = @"CIAttributeMin";
  v6[2] = &unk_1EE4A89F0;
  v6[3] = &unk_1EE4A8A20;
  v5[3] = @"CIAttributeMax";
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
}

- (id)_kernelJointUpsamp
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_jointBilateral];
}

- (id)_kernelJointUpsampRG
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_jointBilateralRG];
}

- (id)_kernelGuideCombine
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_guideCombine];
}

- (id)_kernelGuideCombine4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_guideCombine4];
}

- (id)_kernelGuideMono
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_guideMono];
}

- (id)outputImage
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (!self->inputSmallImage) {
      return 0;
    }
    [result extent];
    if (CGRectIsInfinite(v52)) {
      return 0;
    }
    [(CIImage *)self->inputSmallImage extent];
    if (CGRectIsInfinite(v53))
    {
      return 0;
    }
    else
    {
      [(CIImage *)self->inputSmallImage extent];
      float v5 = v4;
      [(CIImage *)self->inputSmallImage extent];
      float v7 = v6;
      [(CIImage *)self->inputImage extent];
      float v9 = v8;
      [(CIImage *)self->inputImage extent];
      float v11 = v10;
      *(float *)&unsigned int v12 = v9 / v5;
      *(float *)&unsigned int v13 = v11 / v7;
      v14 = [(CIImage *)self->inputSmallImage imageByClampingToExtent];
      CGAffineTransformMakeScale(&v46, (float)(v9 / v5), *(float *)&v13);
      uint64_t v15 = [(CIImage *)v14 imageByApplyingTransform:&v46];
      [(NSNumber *)self->inputSpatialSigma floatValue];
      float v17 = fmaxf(v16, 0.0);
      [(NSNumber *)self->inputLumaSigma floatValue];
      float v19 = fmaxf(v18, 0.0);
      v20 = +[CIVector vectorWithX:1.0 / ((v19 + v19) * v19) Y:1.0 / ((v17 + v17) * v17) Z:(float)(v9 / v5) * 0.6666667 W:*(float *)&v13 * 0.6666667];
      v21 = [[(CIImage *)self->inputImage imageByApplyingFilter:@"CILinearToSRGBToneCurve" withInputParameters:0] imageByClampingToExtent];
      id v22 = [(CIEdgePreserveUpsampleFilter *)self _kernelGuideMono];
      v23 = (double *)MEMORY[0x1E4F1DB10];
      double v24 = *MEMORY[0x1E4F1DB10];
      double v25 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double v26 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double v27 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
      v51[0] = v21;
      v28 = objc_msgSend(v22, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v51, 1), v24, v25, v26, v27);
      *(float *)&double v29 = *(float *)&v12 * 0.4;
      v49[0] = @"inputSigmaX";
      uint64_t v30 = [NSNumber numberWithFloat:v29];
      v49[1] = @"inputSigmaY";
      v50[0] = v30;
      *(float *)&double v31 = *(float *)&v13 * 0.4;
      v50[1] = [NSNumber numberWithFloat:v31];
      uint64_t v32 = objc_msgSend(v28, "imageByApplyingFilter:withInputParameters:", @"CIGaussianBlurXY", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
      id v33 = [(CIEdgePreserveUpsampleFilter *)self _kernelGuideCombine];
      double v34 = *v23;
      double v35 = v23[1];
      double v36 = v23[2];
      double v37 = v23[3];
      v48[0] = v28;
      v48[1] = v32;
      uint64_t v38 = objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 2), v34, v35, v36, v37);
      id v39 = [(CIEdgePreserveUpsampleFilter *)self _kernelJointUpsamp];
      [(CIImage *)self->inputImage extent];
      v47[0] = v15;
      v47[1] = v38;
      v47[2] = v20;
      v44 = objc_msgSend(v39, "applyWithExtent:roiCallback:arguments:", &v45, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 3, MEMORY[0x1E4F143A8], 3221225472, __43__CIEdgePreserveUpsampleFilter_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, __PAIR64__(v13, v12)), v40, v41, v42, v43);
      [(CIImage *)self->inputImage extent];
      return (id)objc_msgSend(v44, "imageByCroppingToRect:");
    }
  }
  return result;
}

double __43__CIEdgePreserveUpsampleFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, *(float *)(a1 + 32) * -1.34, *(float *)(a1 + 36) * -1.34);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputSmallImage
{
  return self->inputSmallImage;
}

- (void)setInputSmallImage:(id)a3
{
}

- (NSNumber)inputSpatialSigma
{
  return self->inputSpatialSigma;
}

- (void)setInputSpatialSigma:(id)a3
{
}

- (NSNumber)inputLumaSigma
{
  return self->inputLumaSigma;
}

- (void)setInputLumaSigma:(id)a3
{
}

@end