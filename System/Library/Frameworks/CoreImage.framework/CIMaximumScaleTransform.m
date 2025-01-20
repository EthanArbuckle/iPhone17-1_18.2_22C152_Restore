@interface CIMaximumScaleTransform
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputAspectRatio;
- (NSNumber)inputScale;
- (id)outputImage;
- (void)setInputAspectRatio:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIMaximumScaleTransform

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputScale doubleValue];
  if (v3 != 1.0) {
    return 0;
  }
  [(NSNumber *)self->inputAspectRatio doubleValue];
  return v4 == 1.0;
}

- (id)outputImage
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if (![(CIMaximumScaleTransform *)self _isIdentity])
  {
    [(NSNumber *)self->inputScale doubleValue];
    double v7 = v6;
    [(NSNumber *)self->inputAspectRatio doubleValue];
    double v9 = v8;
    [(NSNumber *)self->inputScale doubleValue];
    double v11 = v10;
    inputImage = self->inputImage;
    [(CIImage *)inputImage extent];
    double x = v80.origin.x;
    double y = v80.origin.y;
    double width = v80.size.width;
    double height = v80.size.height;
    if (CGRectIsInfinite(v80))
    {
      double y = -8.98846567e307;
      double width = 1.79769313e308;
      double height = 1.79769313e308;
    }
    else
    {
      v81.origin.double x = x;
      v81.origin.double y = y;
      v81.size.double width = width;
      v81.size.double height = height;
      if (!CGRectIsNull(v81)) {
        goto LABEL_12;
      }
      double width = 0.0;
      double y = INFINITY;
      double height = 0.0;
    }
    double x = y;
LABEL_12:
    double v16 = v7 * v9;
    if (fabs(x) == INFINITY || fabs(y) == INFINITY)
    {
      *(int64x2_t *)&v75.double var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v75.double var2 = 0.0;
      v75.double var3 = 0.0;
    }
    else if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
    {
      *(int64x2_t *)&v75.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v75.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v75.double var0 = v16 * x;
      v75.double var1 = v11 * y;
      v75.double var2 = v16 * width;
      v75.double var3 = v11 * height;
    }
    Rectangle::integralize(&v75, 0.0001, (uint64_t)&v76);
    Rectangle v75 = v76;
    if (v16 < 0.50001 && v11 < 0.50001)
    {
      int64x2_t v72 = vdupq_n_s64(0x7FF0000000000000uLL);
      v17 = (double *)MEMORY[0x1E4F1DB10];
      do
      {
        [(CIImage *)inputImage extent];
        double v18 = v82.origin.x;
        double v19 = v82.origin.y;
        double v20 = v82.size.width;
        double v21 = v82.size.height;
        if (CGRectIsInfinite(v82))
        {
          double v22 = -8.98846567e307;
          double v23 = 1.79769313e308;
          double v24 = 1.79769313e308;
          double v25 = -8.98846567e307;
        }
        else
        {
          v83.origin.double x = v18;
          v83.origin.double y = v19;
          v83.size.double width = v20;
          v83.size.double height = v21;
          BOOL IsNull = CGRectIsNull(v83);
          double v25 = INFINITY;
          if (IsNull) {
            double v23 = 0.0;
          }
          else {
            double v23 = v20;
          }
          if (IsNull) {
            double v24 = 0.0;
          }
          else {
            double v24 = v21;
          }
          if (IsNull) {
            double v22 = INFINITY;
          }
          else {
            double v22 = v19;
          }
          if (!IsNull) {
            double v25 = v18;
          }
        }
        double v27 = fabs(v22);
        if (fabs(v25) == INFINITY || v27 == INFINITY)
        {
          *(int64x2_t *)&v77.double var0 = v72;
          v77.double var2 = 0.0;
          v77.double var3 = 0.0;
        }
        else if (v25 == -8.98846567e307 && v22 == -8.98846567e307 && v23 == 1.79769313e308 && v24 == 1.79769313e308)
        {
          *(int64x2_t *)&v77.double var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v77.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v77.double var0 = v25 * 0.5;
          v77.double var1 = v22 * 0.5;
          v77.double var2 = v23 * 0.5;
          v77.double var3 = v24 * 0.5;
        }
        v29 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxScaleDown2x2, Rectangle::integralize(&v77, 0.0001, (uint64_t)&v76).f64[0]);
        double var1 = v76.var1;
        double var0 = v76.var0;
        double var3 = v76.var3;
        double var2 = v76.var2;
        if (v76.var0 == -8.98846567e307
          && v76.var1 == -8.98846567e307
          && v76.var2 == 1.79769313e308
          && v76.var3 == 1.79769313e308)
        {
          double var0 = *v17;
          double var1 = v17[1];
          double var2 = v17[2];
          double var3 = v17[3];
        }
        *(void *)&v77.double var0 = inputImage;
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v29, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_44, [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1], var0, var1, var2, var3);
        double v16 = v16 + v16;
        double v11 = v11 + v11;
      }
      while (v16 < 0.50001 && v11 < 0.50001);
    }
    if (v16 < 0.50001)
    {
      int64x2_t v73 = vdupq_n_s64(0x7FF0000000000000uLL);
      v34 = (double *)MEMORY[0x1E4F1DB10];
      int64x2_t v70 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      do
      {
        v35 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 0.0, *(_OWORD *)&v70);
        [(CIImage *)inputImage extent];
        double v36 = v84.origin.x;
        double v37 = v84.origin.y;
        double v38 = v84.size.width;
        double v39 = v84.size.height;
        if (CGRectIsInfinite(v84))
        {
          double v40 = -8.98846567e307;
          double v41 = 1.79769313e308;
          double v42 = 1.79769313e308;
          double v43 = -8.98846567e307;
        }
        else
        {
          v85.origin.double x = v36;
          v85.origin.double y = v37;
          v85.size.double width = v38;
          v85.size.double height = v39;
          BOOL v44 = CGRectIsNull(v85);
          double v43 = INFINITY;
          if (v44) {
            double v41 = 0.0;
          }
          else {
            double v41 = v38;
          }
          if (v44) {
            double v42 = 0.0;
          }
          else {
            double v42 = v39;
          }
          if (v44) {
            double v40 = INFINITY;
          }
          else {
            double v40 = v37;
          }
          if (!v44) {
            double v43 = v36;
          }
        }
        double v45 = fabs(v40);
        if (fabs(v43) == INFINITY || v45 == INFINITY)
        {
          *(int64x2_t *)&v77.double var0 = v73;
          v77.double var2 = 0.0;
          v77.double var3 = 0.0;
        }
        else if (v43 == -8.98846567e307 && v40 == -8.98846567e307 && v41 == 1.79769313e308 && v42 == 1.79769313e308)
        {
          *(int64x2_t *)&v77.double var0 = v70;
          *(int64x2_t *)&v77.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v77.double var0 = v43 * 0.5;
          v77.double var1 = v40;
          v77.double var2 = v41 * 0.5;
          v77.double var3 = v42;
        }
        v47 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxScaleDown2, Rectangle::integralize(&v77, 0.0001, (uint64_t)&v76).f64[0]);
        double v49 = v76.var1;
        double v48 = v76.var0;
        double v50 = v76.var3;
        double v51 = v76.var2;
        if (v76.var0 == -8.98846567e307
          && v76.var1 == -8.98846567e307
          && v76.var2 == 1.79769313e308
          && v76.var3 == 1.79769313e308)
        {
          double v48 = *v34;
          double v49 = v34[1];
          double v51 = v34[2];
          double v50 = v34[3];
        }
        *(void *)&v77.double var0 = inputImage;
        *(void *)&v77.double var1 = v35;
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v47, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_47, [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:2], v48, v49, v51, v50);
        double v16 = v16 + v16;
      }
      while (v16 < 0.50001);
    }
    if (v11 < 0.50001)
    {
      int64x2_t v74 = vdupq_n_s64(0x7FF0000000000000uLL);
      v52 = (double *)MEMORY[0x1E4F1DB10];
      int64x2_t v71 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      do
      {
        v53 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 1.0, *(_OWORD *)&v71);
        [(CIImage *)inputImage extent];
        double v54 = v86.origin.x;
        double v55 = v86.origin.y;
        double v56 = v86.size.width;
        double v57 = v86.size.height;
        if (CGRectIsInfinite(v86))
        {
          double v58 = -8.98846567e307;
          double v59 = 1.79769313e308;
          double v60 = 1.79769313e308;
          double v61 = -8.98846567e307;
        }
        else
        {
          v87.origin.double x = v54;
          v87.origin.double y = v55;
          v87.size.double width = v56;
          v87.size.double height = v57;
          BOOL v62 = CGRectIsNull(v87);
          double v61 = INFINITY;
          if (v62) {
            double v59 = 0.0;
          }
          else {
            double v59 = v56;
          }
          if (v62) {
            double v60 = 0.0;
          }
          else {
            double v60 = v57;
          }
          if (v62) {
            double v58 = INFINITY;
          }
          else {
            double v58 = v55;
          }
          if (!v62) {
            double v61 = v54;
          }
        }
        double v63 = fabs(v58);
        if (fabs(v61) == INFINITY || v63 == INFINITY)
        {
          *(int64x2_t *)&v77.double var0 = v74;
          v77.double var2 = 0.0;
          v77.double var3 = 0.0;
        }
        else if (v61 == -8.98846567e307 && v58 == -8.98846567e307 && v59 == 1.79769313e308 && v60 == 1.79769313e308)
        {
          *(int64x2_t *)&v77.double var0 = v71;
          *(int64x2_t *)&v77.double var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v77.double var0 = v61;
          v77.double var1 = v58 * 0.5;
          v77.double var2 = v59;
          v77.double var3 = v60 * 0.5;
        }
        v65 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxScaleDown2, Rectangle::integralize(&v77, 0.0001, (uint64_t)&v76).f64[0]);
        double v67 = v76.var1;
        double v66 = v76.var0;
        double v68 = v76.var3;
        double v69 = v76.var2;
        if (v76.var0 == -8.98846567e307
          && v76.var1 == -8.98846567e307
          && v76.var2 == 1.79769313e308
          && v76.var3 == 1.79769313e308)
        {
          double v66 = *v52;
          double v67 = v52[1];
          double v69 = v52[2];
          double v68 = v52[3];
        }
        *(void *)&v77.double var0 = inputImage;
        *(void *)&v77.double var1 = v53;
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v65, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_52, [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:2], v66, v67, v69, v68);
        double v11 = v11 + v11;
      }
      while (v11 < 0.50001);
    }
    if (v16 < 0.99999)
    {
      inputImage = scaleH(inputImage, v16);
      double v16 = 1.0;
    }
    if (v11 < 0.99999)
    {
      inputImage = scaleV(inputImage, v11);
      double v11 = 1.0;
    }
    if (v16 > 1.00001) {
      inputImage = scaleH(inputImage, v16);
    }
    if (v11 > 1.00001) {
      return scaleV(inputImage, v11);
    }
    return inputImage;
  }
  double v3 = self->inputImage;

  return v3;
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryGeometryAdjustment";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"18";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"15.0";
  v8[3] = @"inputScale";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9240;
  v6[1] = &unk_1EE4A9250;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9260;
  v6[3] = &unk_1EE4A9270;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A9270;
  v6[5] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputAspectRatio";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9240;
  v4[1] = &unk_1EE4A9280;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9290;
  v4[3] = &unk_1EE4A9270;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9270;
  v4[5] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputAspectRatio
{
  return self->inputAspectRatio;
}

- (void)setInputAspectRatio:(id)a3
{
}

@end