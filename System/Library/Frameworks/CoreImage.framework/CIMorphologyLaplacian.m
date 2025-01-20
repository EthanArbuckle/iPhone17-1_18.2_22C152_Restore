@interface CIMorphologyLaplacian
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation CIMorphologyLaplacian

- (id)outputImage
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id result = self->super.inputImage;
  if (result)
  {
    [result extent];
    if (CGRectIsEmpty(v17))
    {
      return 0;
    }
    else
    {
      [(NSNumber *)self->super.inputRadius floatValue];
      float v5 = v4;
      v6 = +[CIFilter filterWithName:@"CICheapMorphology"];
      [(CIFilter *)v6 setValue:self->super.inputImage forKey:@"inputImage"];
      *(float *)&double v7 = v5;
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", [NSNumber numberWithFloat:v7], @"inputRadius");
      uint64_t v8 = [(CIFilter *)v6 outputImage];
      *(float *)&double v9 = -v5;
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", [NSNumber numberWithFloat:v9], @"inputRadius");
      uint64_t v10 = [(CIFilter *)v6 outputImage];
      [(CIFilter *)v6 setValue:0 forKey:@"inputImage"];
      v11 = +[CIKernel kernelWithInternalRepresentation:&CI::_laplacian];
      [(CIImage *)self->super.inputImage extent];
      v16[0] = self->super.inputImage;
      v16[1] = v10;
      v16[2] = v8;
      return -[CIColorKernel applyWithExtent:arguments:](v11, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3], v12, v13, v14, v15);
    }
  }
  return result;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"10";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.11";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A9460;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A9460;
  v4[3] = &unk_1EE4A9440;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A9450;
  v4[5] = &unk_1EE4A9460;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

@end