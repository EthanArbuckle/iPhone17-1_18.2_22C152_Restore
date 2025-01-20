@interface CUIShapeEffectBlur1
+ (id)customAttributes;
- (CIColor)inputGlowColorInner;
- (CIColor)inputGlowColorOuter;
- (CIColor)inputShadowColorInner;
- (CIColor)inputShadowColorOuter;
- (CIImage)inputFill;
- (CIImage)inputImage;
- (CIVector)inputOffset;
- (NSNumber)inputRadius;
- (NSNumber)inputShadowBlurInner;
- (NSNumber)inputShadowBlurOuter;
- (id)_kernel;
- (id)outputImage;
- (void)setInputFill:(id)a3;
- (void)setInputGlowColorInner:(id)a3;
- (void)setInputGlowColorOuter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOffset:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputShadowBlurInner:(id)a3;
- (void)setInputShadowBlurOuter:(id)a3;
- (void)setInputShadowColorInner:(id)a3;
- (void)setInputShadowColorOuter:(id)a3;
@end

@implementation CUIShapeEffectBlur1

+ (id)customAttributes
{
  v22[8] = *MEMORY[0x1E4F143B8];
  v21[0] = @"inputOffset";
  v19[0] = @"CIAttributeDefault";
  v19[1] = @"CIAttributeType";
  v20[0] = +[CIVector vectorWithX:0.0 Y:0.0];
  v20[1] = @"CIAttributeTypeOffset";
  v22[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = @"inputRadius";
  v17[0] = @"CIAttributeMin";
  v17[1] = @"CIAttributeSliderMin";
  v18[0] = &unk_1EE4AA2F0;
  v18[1] = &unk_1EE4AA2F0;
  v17[2] = @"CIAttributeSliderMax";
  v17[3] = @"CIAttributeMax";
  v18[2] = &unk_1EE4AA300;
  v18[3] = &unk_1EE4AA330;
  v17[4] = @"CIAttributeDefault";
  v17[5] = @"CIAttributeType";
  v18[4] = &unk_1EE4AA340;
  v18[5] = @"CIAttributeTypeScalar";
  v22[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];
  v21[2] = @"inputGlowColorInner";
  v15[0] = @"CIAttributeDefault";
  v15[1] = @"CIAttributeType";
  v16[0] = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v16[1] = @"CIAttributeTypeColor";
  v22[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v21[3] = @"inputGlowOuterOuter";
  v13[0] = @"CIAttributeDefault";
  v13[1] = @"CIAttributeType";
  v14[0] = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v14[1] = @"CIAttributeTypeColor";
  v22[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v21[4] = @"inputShadowColorInner";
  v11[0] = @"CIAttributeDefault";
  v11[1] = @"CIAttributeType";
  v12[0] = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v12[1] = @"CIAttributeTypeColor";
  v22[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v21[5] = @"inputShadowOuterOuter";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v10[1] = @"CIAttributeTypeColor";
  v22[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v21[6] = @"inputShadowBlurInner";
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeMin";
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  v8[0] = MEMORY[0x1E4F1CC38];
  v8[1] = MEMORY[0x1E4F1CC28];
  v7[2] = @"CIAttributeMax";
  v7[3] = @"CIAttributeType";
  v8[2] = MEMORY[0x1E4F1CC38];
  v8[3] = @"CIAttributeTypeBoolean";
  v22[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  v21[7] = @"inputShadowBlurOuter";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeMin";
  v6[0] = v2;
  v6[1] = v3;
  v5[2] = @"CIAttributeMax";
  v5[3] = @"CIAttributeType";
  v6[2] = v2;
  v6[3] = @"CIAttributeTypeBoolean";
  v22[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:8];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_shapeEffectBlur_1];
}

- (id)outputImage
{
  v34[10] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius doubleValue];
  id result = self->inputImage;
  if (result)
  {
    if (self->inputFill)
    {
      float v5 = fmin(fmax(v3, 0.0), 50.0);
      v6 = _CUIMappedBlurImageWithSize((CIImage *)result, vcvtms_u32_f32(v5 / 2.853), 0);
      inputImage = self->inputImage;
      [(CIVector *)self->inputOffset X];
      if (v8 == 0.0 && ([(CIVector *)self->inputOffset Y], v9 == 0.0))
      {
        v13 = v6;
      }
      else
      {
        memset(&v33, 0, sizeof(v33));
        [(CIVector *)self->inputOffset X];
        CGFloat v11 = -v10;
        [(CIVector *)self->inputOffset Y];
        CGAffineTransformMakeTranslation(&v33, v11, -v12);
        CGAffineTransform v32 = v33;
        v13 = [(CIImage *)v6 imageByApplyingTransform:&v32];
        v14 = self->inputImage;
        CGAffineTransform v31 = v33;
        inputImage = [(CIImage *)v14 imageByApplyingTransform:&v31];
      }
      v15 = +[CIVector vectorWithX:(double)[(NSNumber *)self->inputShadowBlurInner intValue] Y:(double)[(NSNumber *)self->inputShadowBlurOuter intValue]];
      id v16 = [(CUIShapeEffectBlur1 *)self _kernel];
      [(CIImage *)v6 extent];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      [(CIImage *)v13 extent];
      v37.origin.x = v25;
      v37.origin.y = v26;
      v37.size.width = v27;
      v37.size.height = v28;
      v35.origin.x = v18;
      v35.origin.y = v20;
      v35.size.width = v22;
      v35.size.height = v24;
      CGRect v36 = CGRectUnion(v35, v37);
      v34[0] = self->inputImage;
      v34[1] = inputImage;
      v34[2] = v6;
      v34[3] = v13;
      inputGlowColorInner = self->inputGlowColorInner;
      v34[4] = self->inputFill;
      v34[5] = inputGlowColorInner;
      inputShadowColorInner = self->inputShadowColorInner;
      v34[6] = self->inputGlowColorOuter;
      v34[7] = inputShadowColorInner;
      v34[8] = self->inputShadowColorOuter;
      v34[9] = v15;
      return (id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 10), v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputFill
{
  return self->inputFill;
}

- (void)setInputFill:(id)a3
{
}

- (CIVector)inputOffset
{
  return self->inputOffset;
}

- (void)setInputOffset:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (CIColor)inputGlowColorInner
{
  return self->inputGlowColorInner;
}

- (void)setInputGlowColorInner:(id)a3
{
}

- (CIColor)inputGlowColorOuter
{
  return self->inputGlowColorOuter;
}

- (void)setInputGlowColorOuter:(id)a3
{
}

- (CIColor)inputShadowColorInner
{
  return self->inputShadowColorInner;
}

- (void)setInputShadowColorInner:(id)a3
{
}

- (CIColor)inputShadowColorOuter
{
  return self->inputShadowColorOuter;
}

- (void)setInputShadowColorOuter:(id)a3
{
}

- (NSNumber)inputShadowBlurInner
{
  return self->inputShadowBlurInner;
}

- (void)setInputShadowBlurInner:(id)a3
{
}

- (NSNumber)inputShadowBlurOuter
{
  return self->inputShadowBlurOuter;
}

- (void)setInputShadowBlurOuter:(id)a3
{
}

@end