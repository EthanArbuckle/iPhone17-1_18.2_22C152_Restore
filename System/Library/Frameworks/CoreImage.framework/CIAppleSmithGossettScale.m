@interface CIAppleSmithGossettScale
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation CIAppleSmithGossettScale

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryGeometryAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"12";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.14";
  v6[3] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7B40;
  v4[1] = &unk_1EE4A7B50;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A7B60;
  v4[3] = &unk_1EE4A7B60;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A7B60;
  v4[5] = &unk_1EE4A7B60;
  v3[6] = @"CIAttributeType";
  v4[6] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputScale floatValue];
  inputImage = self->inputImage;
  if (v3 >= 1.0 || v3 < 0.5)
  {
    inputScale = self->inputScale;
    v51[0] = @"inputScale";
    v51[1] = @"inputAspectRatio";
    v52[0] = inputScale;
    v52[1] = &unk_1EE4A7B60;
    return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CILanczosScaleTransform", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2]);
  }
  double v8 = v3;
  v9 = [(CIImage *)self->inputImage imageByClampingToExtent];
  double v10 = 0.0;
  v11 = +[CIVector vectorWithX:1.0 / v8 Y:1.0 Z:1.0 W:0.0];
  [(CIImage *)v9 extent];
  double v16 = v12;
  double v17 = v13;
  CGFloat v18 = v14;
  double v19 = v15;
  if (CGRectIsInfinite(*(CGRect *)&v12))
  {
    double v10 = 1.79769313e308;
    double v17 = -8.98846567e307;
    double v19 = 1.79769313e308;
  }
  else
  {
    v55.origin.double x = v16;
    v55.origin.double y = v17;
    v55.size.double width = v18;
    v55.size.double height = v19;
    if (!CGRectIsNull(v55))
    {
      double v10 = v18;
      goto LABEL_13;
    }
    double v17 = INFINITY;
    double v19 = 0.0;
  }
  double v16 = v17;
LABEL_13:
  if (fabs(v16) == INFINITY || fabs(v17) == INFINITY)
  {
    *(int64x2_t *)&v50.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v50.var2 = 0.0;
    v50.var3 = 0.0;
  }
  else if (v16 == -8.98846567e307 && v17 == -8.98846567e307 && v10 == 1.79769313e308 && v19 == 1.79769313e308)
  {
    *(int64x2_t *)&v50.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v50.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v50.var0 = v16 * v8;
    v50.var1 = v17;
    v50.var2 = v10 * v8;
    v50.var3 = v19;
  }
  Rectangle::inset(&v50, -3.0, -0.0, (uint64_t)&v53);
  *(void *)&double v20 = *(_OWORD *)&Rectangle::integralize(&v53, 0.0001, (uint64_t)&v46);
  double v21 = v46;
  double v22 = v47;
  double v24 = v48;
  double v23 = v49;
  double v25 = COERCE_DOUBLE((uint64_t)[(CIImage *)v9 imageBySamplingNearest]);
  v26 = +[CIKernel kernelWithInternalRepresentation:&CI::_asgDownH];
  if (v21 == -8.98846567e307 && v22 == -8.98846567e307 && v24 == 1.79769313e308 && v23 == 1.79769313e308)
  {
    double v21 = *MEMORY[0x1E4F1DB10];
    double v22 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  v53.var0 = v25;
  *(void *)&v53.var1 = v11;
  *(void *)&v53.var2 = objc_msgSend(NSNumber, "numberWithDouble:", 0.0, MEMORY[0x1E4F143A8], 3221225472, ___ZL5downHP7CIImagedd_block_invoke, &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, 0x4012C985F06F6944, *(void *)&v8, *(void *)&v50.var0, *(void *)&v50.var1, *(void *)&v50.var2, *(void *)&v50.var3);
  v27 = -[CIKernel applyWithExtent:roiCallback:arguments:](v26, "applyWithExtent:roiCallback:arguments:", &v46, [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:3], v21, v22, v24, v23);
  v28 = +[CIVector vectorWithX:1.0 Y:1.0 / v8 Z:0.0 W:1.0];
  [(CIImage *)v27 extent];
  double x = v56.origin.x;
  double y = v56.origin.y;
  double width = v56.size.width;
  double height = v56.size.height;
  if (CGRectIsInfinite(v56))
  {
    double width = 1.79769313e308;
    double y = -8.98846567e307;
    double height = 1.79769313e308;
LABEL_25:
    double x = y;
    goto LABEL_26;
  }
  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  if (CGRectIsNull(v57))
  {
    double width = 0.0;
    double y = INFINITY;
    double height = 0.0;
    goto LABEL_25;
  }
LABEL_26:
  if (fabs(x) == INFINITY || fabs(y) == INFINITY)
  {
    *(int64x2_t *)&v50.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v50.var2 = 0.0;
    v50.var3 = 0.0;
  }
  else if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
  {
    *(int64x2_t *)&v50.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v50.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v50.var0 = x;
    v50.var1 = y * v8;
    v50.var2 = width;
    v50.var3 = height * v8;
  }
  Rectangle::inset(&v50, -0.0, -3.0, (uint64_t)&v53);
  *(void *)&double v33 = *(_OWORD *)&Rectangle::integralize(&v53, 0.0001, (uint64_t)&v46);
  double v34 = v46;
  double v35 = v47;
  double v37 = v48;
  double v36 = v49;
  double v38 = COERCE_DOUBLE((uint64_t)[(CIImage *)v27 imageBySamplingNearest]);
  v39 = +[CIKernel kernelWithInternalRepresentation:&CI::_asgDownV];
  if (v34 == -8.98846567e307 && v35 == -8.98846567e307 && v37 == 1.79769313e308 && v36 == 1.79769313e308)
  {
    double v34 = *MEMORY[0x1E4F1DB10];
    double v35 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v37 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  }
  v53.var0 = v38;
  *(void *)&v53.var1 = v28;
  *(void *)&v53.var2 = objc_msgSend(NSNumber, "numberWithDouble:", 0.0, MEMORY[0x1E4F143A8], 3221225472, ___ZL5downVP7CIImagedd_block_invoke, &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, 0x4012C985F06F6944, *(void *)&v8, *(void *)&v50.var0, *(void *)&v50.var1, *(void *)&v50.var2, *(void *)&v50.var3);
  v40 = -[CIKernel applyWithExtent:roiCallback:arguments:](v39, "applyWithExtent:roiCallback:arguments:", &v46, [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:3], v34, v35, v37, v36);
  [(CIImage *)self->inputImage extent];
  if (!CGRectIsInfinite(v58))
  {
    [(CIImage *)self->inputImage extent];
    v59.origin.double x = v41 * v8;
    v59.origin.double y = v42 * v8;
    v59.size.double width = v43 * v8;
    v59.size.double height = v44 * v8;
    CGRect v60 = CGRectIntegral(v59);
    return -[CIImage imageByCroppingToRect:](v40, "imageByCroppingToRect:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
  }
  return v40;
}

@end