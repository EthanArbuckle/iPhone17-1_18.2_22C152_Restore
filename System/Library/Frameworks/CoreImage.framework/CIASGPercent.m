@interface CIASGPercent
+ (id)customAttributes;
- (id)outputImage;
- (id)outputImageScale:(double)a3 outset:(int)a4 hKernel:(id)a5 vKernel:(id)a6;
@end

@implementation CIASGPercent

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryGeometryAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImageScale:(double)a3 outset:(int)a4 hKernel:(id)a5 vKernel:(id)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v11 = [[(CIImage *)self->inputImage imageByClampingToExtent] imageBySamplingNearest];
  v12 = (double *)MEMORY[0x1E4F1DB10];
  double v13 = *MEMORY[0x1E4F1DB10];
  double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke;
  v30[3] = &__block_descriptor_44_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v30[4] = a3;
  int v31 = a4;
  v33[0] = v11;
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a5, "applyWithExtent:roiCallback:arguments:", v30, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1), v13, v14, v15, v16), "imageBySamplingNearest");
  double v18 = *v12;
  double v19 = v12[1];
  double v20 = v12[2];
  double v21 = v12[3];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke_2;
  v28[3] = &__block_descriptor_44_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v28[4] = a3;
  int v29 = a4;
  uint64_t v32 = v17;
  v22 = objc_msgSend(a6, "applyWithExtent:roiCallback:arguments:", v28, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v32, 1), v18, v19, v20, v21);
  [(CIImage *)self->inputImage extent];
  if (!CGRectIsInfinite(v34))
  {
    [(CIImage *)self->inputImage extent];
    v35.origin.x = v23 * a3;
    v35.origin.y = v24 * a3;
    v35.size.width = v25 * a3;
    v35.size.height = v26 * a3;
    CGRect v36 = CGRectIntegral(v35);
    return (id)objc_msgSend(v22, "imageByCroppingToRect:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  }
  return v22;
}

double __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = *(double *)(a1 + 32);
  float v6 = a2;
  float v7 = a4 + v6;
  float v8 = floor((float)(floorf(v6) / v5) + 0.499);
  float v9 = floor((float)(floorf(v7) / v5) + 0.499);
  double v10 = v8;
  double v11 = (float)(v9 - v8);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)(&a3 - 1), (double)-*(_DWORD *)(a1 + 40), 0.0);
  return result;
}

double __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = *(double *)(a1 + 32);
  float v6 = a3;
  float v7 = a5 + v6;
  float v8 = floor((float)(floorf(v6) / v5) + 0.499);
  float v9 = floor((float)(floorf(v7) / v5) + 0.499);
  double v10 = v8;
  double v11 = (float)(v9 - v8);
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 40));
  return result;
}

- (id)outputImage
{
  return 0;
}

@end