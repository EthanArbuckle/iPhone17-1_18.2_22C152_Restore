@interface CIEdgePreserveUpsampleRGFilter
- (id)outputImage;
@end

@implementation CIEdgePreserveUpsampleRGFilter

- (id)outputImage
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id result = self->super.inputImage;
  if (result)
  {
    if (!self->super.inputSmallImage) {
      return 0;
    }
    [result extent];
    if (CGRectIsInfinite(v52)) {
      return 0;
    }
    [(CIImage *)self->super.inputSmallImage extent];
    if (CGRectIsInfinite(v53))
    {
      return 0;
    }
    else
    {
      [(CIImage *)self->super.inputSmallImage extent];
      float v5 = v4;
      [(CIImage *)self->super.inputSmallImage extent];
      float v7 = v6;
      [(CIImage *)self->super.inputImage extent];
      float v9 = v8;
      [(CIImage *)self->super.inputImage extent];
      float v11 = v10;
      *(float *)&unsigned int v12 = v9 / v5;
      *(float *)&unsigned int v13 = v11 / v7;
      v14 = [(CIImage *)self->super.inputSmallImage imageByClampingToExtent];
      CGAffineTransformMakeScale(&v46, (float)(v9 / v5), *(float *)&v13);
      uint64_t v15 = [(CIImage *)v14 imageByApplyingTransform:&v46];
      [(NSNumber *)self->super.inputSpatialSigma floatValue];
      float v17 = fmaxf(v16, 0.0);
      [(NSNumber *)self->super.inputLumaSigma floatValue];
      float v19 = fmaxf(v18, 0.0);
      v20 = +[CIVector vectorWithX:1.0 / ((v19 + v19) * v19) Y:1.0 / ((v17 + v17) * v17) Z:(float)(v9 / v5) * 0.6666667 W:*(float *)&v13 * 0.6666667];
      v21 = [[(CIImage *)self->super.inputImage imageByApplyingFilter:@"CILinearToSRGBToneCurve" withInputParameters:0] imageByClampingToExtent];
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
      id v33 = [(CIEdgePreserveUpsampleFilter *)self _kernelGuideCombine4];
      double v34 = *v23;
      double v35 = v23[1];
      double v36 = v23[2];
      double v37 = v23[3];
      v48[0] = v28;
      v48[1] = v32;
      v48[2] = v15;
      uint64_t v38 = objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 3), v34, v35, v36, v37);
      id v39 = [(CIEdgePreserveUpsampleFilter *)self _kernelJointUpsampRG];
      double v40 = *v23;
      double v41 = v23[1];
      double v42 = v23[2];
      double v43 = v23[3];
      v47[0] = v38;
      v47[1] = v20;
      v44 = objc_msgSend(v39, "applyWithExtent:roiCallback:arguments:", &v45, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 2, MEMORY[0x1E4F143A8], 3221225472, __45__CIEdgePreserveUpsampleRGFilter_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, __PAIR64__(v13, v12)), v40, v41, v42, v43);
      [(CIImage *)self->super.inputImage extent];
      return (id)objc_msgSend(v44, "imageByCroppingToRect:");
    }
  }
  return result;
}

double __45__CIEdgePreserveUpsampleRGFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, *(float *)(a1 + 32) * -1.34, *(float *)(a1 + 36) * -1.34);
  return result;
}

@end