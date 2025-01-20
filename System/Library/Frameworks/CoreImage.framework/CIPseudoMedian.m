@interface CIPseudoMedian
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (NSNumber)inputWeights;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputWeights:(id)a3;
@end

@implementation CIPseudoMedian

- (id)outputImage
{
  v31[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  if (CGRectIsEmpty(v33)) {
    return 0;
  }
  [(NSNumber *)self->inputRadius floatValue];
  float v7 = v6;
  [(NSNumber *)self->inputWeights floatValue];
  if (v7 > 0.0)
  {
    float v9 = v8;
    v10 = +[CIFilter filterWithName:@"CICheapMorphology"];
    [(CIFilter *)v10 setValue:self->inputImage forKey:@"inputImage"];
    *(float *)&double v11 = v7 + -1.0;
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", [NSNumber numberWithFloat:v11], @"inputRadius");
    uint64_t v12 = [(CIFilter *)v10 outputImage];
    *(float *)&double v13 = -(float)(v7 + -1.0);
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", [NSNumber numberWithFloat:v13], @"inputRadius");
    [(CIFilter *)v10 setValue:[(CIFilter *)v10 outputImage] forKey:@"inputImage"];
    [(CIFilter *)v10 setValue:self->inputRadius forKey:@"inputRadius"];
    v14 = [(CIFilter *)v10 outputImage];
    [(CIFilter *)v10 setValue:v12 forKey:@"inputImage"];
    *(float *)&double v15 = -v7;
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", [NSNumber numberWithFloat:v15], @"inputRadius");
    v4 = [(CIFilter *)v10 outputImage];
    [(CIFilter *)v10 setValue:0 forKey:@"inputImage"];
    if (v9 != 0.0)
    {
      if (v9 == 1.0)
      {
        return v14;
      }
      else
      {
        v17 = +[CIKernel kernelWithInternalRepresentation:&CI::_average];
        [(CIImage *)v4 extent];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        [(CIImage *)v14 extent];
        v36.origin.x = v26;
        v36.origin.y = v27;
        v36.size.width = v28;
        v36.size.height = v29;
        v34.origin.x = v19;
        v34.origin.y = v21;
        v34.size.width = v23;
        v34.size.height = v25;
        CGRect v35 = CGRectUnion(v34, v36);
        v31[0] = v4;
        v31[1] = v14;
        v31[2] = self->inputWeights;
        v30 = -[CIColorKernel applyWithExtent:arguments:](v17, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3], v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
        [(CIImage *)self->inputImage extent];
        return -[CIImage imageByCroppingToRect:](v30, "imageByCroppingToRect:");
      }
    }
    return v4;
  }
  v16 = self->inputImage;

  return v16;
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryBlur";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v9[1] = @"10";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.11";
  v8[3] = @"inputRadius";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeDistance";
  v6[1] = &unk_1EE4A9460;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A9460;
  v6[3] = &unk_1EE4A9440;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4A9450;
  v6[5] = &unk_1EE4A9460;
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputWeights";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A9460;
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9470;
  v4[3] = &unk_1EE4A9480;
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputWeights
{
  return self->inputWeights;
}

- (void)setInputWeights:(id)a3
{
}

@end