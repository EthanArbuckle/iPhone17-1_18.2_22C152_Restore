@interface CIAffineTransform
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSValue)inputTransform;
- (id)_initFromProperties:(id)a3;
- (id)_outputProperties;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTransform:(id)a3;
@end

@implementation CIAffineTransform

+ (id)customAttributes
{
  v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29238] valueWithBytes:MEMORY[0x1E4F1DAB8] objCType:"{CGAffineTransform=dddddd}"];
  v7[0] = @"CIAttributeFilterCategories";
  v6[0] = @"CICategoryGeometryAdjustment";
  v6[1] = @"CICategoryVideo";
  v6[2] = @"CICategoryStillImage";
  v6[3] = @"CICategoryBuiltIn";
  v8[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v8[1] = @"5";
  v7[1] = @"CIAttributeFilterAvailable_iOS";
  v7[2] = @"CIAttributeFilterAvailable_Mac";
  v8[2] = @"10.4";
  v7[3] = @"inputTransform";
  v4[0] = @"CIAttributeDefault";
  v4[1] = @"CIAttributeIdentity";
  v5[0] = v2;
  v5[1] = v2;
  v4[2] = @"CIAttributeType";
  v5[2] = @"CIAttributeTypeTransform";
  v8[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
}

- (id)outputImage
{
  if (self->inputImage)
  {
    if (CGAffineTransformFromObject((objc_object *)self->inputTransform, &v7))
    {
      inputImage = self->inputImage;
      CGAffineTransform v6 = v7;
      return [(CIImage *)inputImage imageByApplyingTransform:&v6];
    }
    v5 = ci_logger_filter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CIAffineClamp *)(uint64_t)self outputImage];
    }
  }
  return 0;
}

- (id)_outputProperties
{
  v4[6] = *MEMORY[0x1E4F143B8];
  if (!CGAffineTransformFromObject((objc_object *)self->inputTransform, &v3)) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  v4[0] = metadataPropertyWithDouble(v3.a);
  v4[1] = metadataPropertyWithDouble(v3.b);
  v4[2] = metadataPropertyWithDouble(v3.c);
  void v4[3] = metadataPropertyWithDouble(v3.d);
  v4[4] = metadataPropertyWithDouble(v3.tx);
  v4[5] = metadataPropertyWithDouble(v3.ty);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
}

- (id)_initFromProperties:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"AffineA", (double *)&v12)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"AffineB", (double *)&v11)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"AffineC", (double *)&v10)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"AffineD", (double *)&v9)
    && metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"AffineX", (double *)&v8)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"AffineY", (double *)&v7))
  {
    v6[0] = v12;
    v6[1] = v11;
    v6[2] = v10;
    v6[3] = v9;
    void v6[4] = v8;
    v6[5] = v7;
    -[CIAffineTransform setInputTransform:](self, "setInputTransform:", [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGAffineTransform=dddddd}"]);
  }
  else
  {

    return 0;
  }
  return self;
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