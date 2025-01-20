@interface CIAreaBoundsRed
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation CIAreaBoundsRed

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryReduction";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"18";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"15.0";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(CIReductionFilter *)self offsetAndCrop];
  if (v2 && (v3 = v2, [v2 extent], !CGRectIsEmpty(v76)))
  {
    v5 = +[CIKernel kernelWithInternalRepresentation:&CI::_redThreshold];
    [v3 extent];
    v74[0] = v3;
    v10 = -[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1], v6, v7, v8, v9);
    [(CIImage *)v10 extent];
    double v12 = v11;
    [(CIImage *)v10 extent];
    float v14 = v12;
    float v16 = v15;
    if (v14 > 1024.0 || v16 > 1024.0)
    {
      float v18 = fminf(1024.0 / v16, 1.0);
      v72[0] = @"inputScale";
      *(float *)&double v13 = v18;
      v72[1] = @"inputAspectRatio";
      v73[0] = [NSNumber numberWithFloat:v13];
      *(float *)&double v19 = fminf(1024.0 / v14, 1.0) / v18;
      v73[1] = [NSNumber numberWithFloat:v19];
      v10 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", @"CIMaximumScaleTransform", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2]), "imageByCroppingToRect:", 0.0, 0.0, fminf(v14, 1024.0), fminf(v16, 1024.0));
    }
    [(CIImage *)v10 extent];
    double v21 = v20;
    double v23 = v22;
    v24 = +[CIKernel kernelWithInternalRepresentation:&CI::_maskBoundsInit];
    [(CIImage *)v10 extent];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    v71[0] = v10;
    v71[1] = +[CIVector vectorWithX:1.0 / v21 Y:1.0 / v23];
    v33 = -[CIColorKernel applyWithExtent:arguments:](v24, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2], v26, v28, v30, v32);
    v34 = +[CIKernel kernelWithInternalRepresentation:&CI::_maskBoundsReduce];
    if (v21 > 1.001 || v23 > 1.001)
    {
      int64x2_t v63 = vdupq_n_s64(0x7FF0000000000000uLL);
      v40 = (double *)MEMORY[0x1E4F1DB10];
      int64x2_t v61 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      int64x2_t v62 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      do
      {
        [(CIImage *)v33 extent];
        double x = v77.origin.x;
        double y = v77.origin.y;
        double width = v77.size.width;
        double height = v77.size.height;
        if (CGRectIsInfinite(v77))
        {
          double v45 = -8.98846567e307;
          double v46 = 1.79769313e308;
          double v47 = 1.79769313e308;
          double v48 = -8.98846567e307;
        }
        else
        {
          v78.origin.double x = x;
          v78.origin.double y = y;
          v78.size.double width = width;
          v78.size.double height = height;
          BOOL IsNull = CGRectIsNull(v78);
          double v48 = INFINITY;
          if (IsNull) {
            double v46 = 0.0;
          }
          else {
            double v46 = width;
          }
          if (IsNull) {
            double v47 = 0.0;
          }
          else {
            double v47 = height;
          }
          if (IsNull) {
            double v45 = INFINITY;
          }
          else {
            double v45 = y;
          }
          if (!IsNull) {
            double v48 = x;
          }
        }
        double v50 = fabs(v45);
        if (fabs(v48) == INFINITY || v50 == INFINITY)
        {
          *(int64x2_t *)&v64.var0 = v63;
          v64.var2 = 0.0;
          v64.var3 = 0.0;
        }
        else if (v48 == -8.98846567e307 && v45 == -8.98846567e307 && v46 == 1.79769313e308 && v47 == 1.79769313e308)
        {
          *(int64x2_t *)&v64.var0 = v62;
          *(int64x2_t *)&v64.var2 = v61;
        }
        else
        {
          v64.var0 = v48 * 0.5;
          v64.var1 = v45 * 0.5;
          v64.var2 = v46 * 0.5;
          v64.var3 = v47 * 0.5;
        }
        Rectangle::integralize(&v64, 0.0001, (uint64_t)&v65);
        double v52 = v65;
        double v53 = v66;
        double v55 = v67;
        double v54 = v68;
        if (v65 == -8.98846567e307 && v66 == -8.98846567e307 && v67 == 1.79769313e308 && v68 == 1.79769313e308)
        {
          double v52 = *v40;
          double v53 = v40[1];
          double v55 = v40[2];
          double v54 = v40[3];
        }
        v70 = v33;
        v33 = -[CIColorKernel applyWithExtent:roiCallback:arguments:](v34, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_210, [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1], v52, v53, v55, v54);
        [(CIImage *)v33 extent];
      }
      while (v60 > 1.001 || v59 > 1.001);
    }
    v35 = +[CIKernel kernelWithInternalRepresentation:&CI::_maskBoundsPost];
    [(CIImage *)v33 extent];
    v69 = v33;
    return -[CIColorKernel applyWithExtent:arguments:](v35, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1], v36, v37, v38, v39);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

void __30__CIAreaBoundsRed_outputImage__block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsInfinite(*(CGRect *)&a1))
  {
    double v8 = -8.98846567e307;
    double v9 = 1.79769313e308;
    double v10 = 1.79769313e308;
    double v11 = -8.98846567e307;
  }
  else
  {
    v20.origin.double x = a1;
    v20.origin.double y = a2;
    v20.size.double width = a3;
    v20.size.double height = a4;
    BOOL IsNull = CGRectIsNull(v20);
    double v11 = INFINITY;
    if (IsNull) {
      double v9 = 0.0;
    }
    else {
      double v9 = a3;
    }
    if (IsNull) {
      double v10 = 0.0;
    }
    else {
      double v10 = a4;
    }
    if (IsNull) {
      double v8 = INFINITY;
    }
    else {
      double v8 = a2;
    }
    if (!IsNull) {
      double v11 = a1;
    }
  }
  double v13 = fabs(v8);
  if (fabs(v11) == INFINITY || v13 == INFINITY)
  {
    *(int64x2_t *)&v18.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(_OWORD *)&v18.var2 = 0uLL;
  }
  else if (v11 == -8.98846567e307 && v8 == -8.98846567e307 && v9 == 1.79769313e308 && v10 == 1.79769313e308)
  {
    *(int64x2_t *)&v18.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v18.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v18.var0 = v11 + v11;
    v18.var1 = v8 + v8;
    v18.var2 = v9 + v9;
    v18.var3 = v10 + v10;
  }
  Rectangle::integralize(&v18, 0.0001, (uint64_t)&v19);
}

@end