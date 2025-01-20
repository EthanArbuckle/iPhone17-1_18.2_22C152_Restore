@interface CIAffineTile
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSValue)inputTransform;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTransform:(id)a3;
@end

@implementation CIAffineTile

+ (id)customAttributes
{
  v9[4] = *MEMORY[0x1E4F143B8];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeScale(&v4, 0.4, 0.4);
  uint64_t v2 = [MEMORY[0x1E4F29238] valueWithBytes:MEMORY[0x1E4F1DAB8] objCType:"{CGAffineTransform=dddddd}"];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryTileEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"6";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputTransform";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeTransform";
  v6[1] = v2;
  v5[2] = @"CIAttributeIdentity";
  v6[2] = v2;
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_lowq_affine];
}

- (id)outputImage
{
  v28[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  inputTransform = self->inputTransform;
  if (!inputTransform)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v26.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v26.c = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
LABEL_10:
    *(_OWORD *)&v26.tx = v6;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGAffineTransform v4 = [(NSValue *)inputTransform objCType];
    if (!strcmp(v4, "{CGAffineTransform=dddddd}") || !strcmp(v4, "{?=dddddd}"))
    {
      [(NSValue *)inputTransform getValue:&v26 size:48];
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(&v27, 0, sizeof(v27));
    [(NSValue *)inputTransform transformStruct];
    memset(&v26, 0, 32);
    long long v6 = 0u;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [(NSValue *)inputTransform count] != 6)
  {
LABEL_17:
    v22 = ci_logger_filter();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(CIAffineClamp *)(uint64_t)self outputImage];
    }
    return 0;
  }
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 0), "doubleValue");
  v26.a = v16;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 1), "doubleValue");
  v26.b = v17;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 2), "doubleValue");
  v26.c = v18;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 3), "doubleValue");
  v26.d = v19;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 4), "doubleValue");
  v26.tx = v20;
  objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 5), "doubleValue");
  v26.ty = v21;
LABEL_11:
  [(CIImage *)self->inputImage extent];
  BOOL IsInfinite = CGRectIsInfinite(v29);
  inputImage = self->inputImage;
  if (IsInfinite)
  {
    CGAffineTransform v25 = v26;
    return [(CIImage *)inputImage imageByApplyingTransform:&v25];
  }
  else
  {
    uint64_t v10 = [(CIImage *)inputImage filteredImage:@"CISimpleTile" keysAndValues:0];
    CGAffineTransform v24 = v26;
    CGAffineTransformInvert(&v27, &v24);
    CGAffineTransform v26 = v27;
    id v11 = [(CIAffineTile *)self _kernel];
    double v12 = *MEMORY[0x1E4F1DB10];
    double v13 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v28[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(_OWORD *)&v26.tx, MEMORY[0x1E4F143A8], 3221225472, __27__CIAffineTile_outputImage__block_invoke, &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(_OWORD *)&v26.a, *(_OWORD *)&v26.c, *(_OWORD *)&v26.tx);
    v28[1] = +[CIVector vectorWithX:v26.a Y:v26.c];
    v28[2] = +[CIVector vectorWithX:v26.b Y:v26.d];
    return (id)objc_msgSend(v11, "applyWithExtent:roiCallback:inputImage:arguments:", &v23, v10, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 3), v12, v13, v14, v15);
  }
}

double __27__CIAffineTile_outputImage__block_invoke(_OWORD *a1, double a2, double a3, double a4, double a5)
{
  long long v5 = a1[3];
  *(_OWORD *)&v7.a = a1[2];
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = a1[4];
  *(void *)&double result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a2, &v7);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSValue)inputTransform
{
  return self->inputTransform;
}

- (void)setInputTransform:(id)a3
{
}

@end