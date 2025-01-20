@interface CIAffineClamp
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSValue)inputTransform;
- (id)outputImage;
- (void)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTransform:(id)a3;
@end

@implementation CIAffineClamp

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

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  inputTransform = self->inputTransform;
  if (!inputTransform)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v25 = *MEMORY[0x1E4F1DAB8];
    long long v26 = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [(NSValue *)inputTransform count] == 6)
      {
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 0), "doubleValue");
        *(void *)&long long v25 = v12;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 1), "doubleValue");
        *((void *)&v25 + 1) = v13;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 2), "doubleValue");
        *(void *)&long long v26 = v14;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 3), "doubleValue");
        *((void *)&v26 + 1) = v15;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 4), "doubleValue");
        *(void *)&long long v27 = v16;
        objc_msgSend((id)-[NSValue objectAtIndex:](inputTransform, "objectAtIndex:", 5), "doubleValue");
        *((void *)&v27 + 1) = v17;
        goto LABEL_11;
      }
      goto LABEL_20;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    [(NSValue *)inputTransform transformStruct];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v6 = 0u;
LABEL_10:
    long long v27 = v6;
    goto LABEL_11;
  }
  CGAffineTransform v4 = [(NSValue *)inputTransform objCType];
  if (strcmp(v4, "{CGAffineTransform=dddddd}") && strcmp(v4, "{?=dddddd}"))
  {
LABEL_20:
    v18 = ci_logger_filter();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(CIAffineClamp *)(uint64_t)self outputImage];
    }
    return 0;
  }
  [(NSValue *)inputTransform getValue:&v25 size:48];
LABEL_11:
  if (fabs(*(double *)&v25 * *((double *)&v26 + 1) - *((double *)&v25 + 1) * *(double *)&v26) < 0.0016)
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  [(CIImage *)self->inputImage extent];
  BOOL IsInfinite = CGRectIsInfinite(v31);
  inputImage = self->inputImage;
  if (IsInfinite)
  {
    long long v22 = v25;
    long long v23 = v26;
    long long v24 = v27;
    v9 = &v22;
    v10 = inputImage;
  }
  else
  {
    [(CIImage *)inputImage extent];
    v10 = -[CIImage imageByClampingToRect:](inputImage, "imageByClampingToRect:");
    long long v19 = v25;
    long long v20 = v26;
    long long v21 = v27;
    v9 = &v19;
  }
  return -[CIImage imageByApplyingTransform:](v10, "imageByApplyingTransform:", v9, v19, v20, v21, v22, v23, v24);
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

- (void)outputImage
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = [(id)objc_opt_class() description];
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}@: inputTransfom is not a valid object.", (uint8_t *)&v3, 0xCu);
}

@end