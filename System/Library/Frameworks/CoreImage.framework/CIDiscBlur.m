@interface CIDiscBlur
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (id)outputImage;
- (void)dealloc;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CIDiscBlur

- (void)dealloc
{
  recipe = self->_recipe;
  if (recipe) {

  }
  self->_recipe = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIDiscBlur;
  [(CIFilter *)&v4 dealloc];
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.5";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A83F0;
  v4[2] = &unk_1EE4A83F0;
  v4[3] = &unk_1EE4A8400;
  v3[4] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4A8480;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (([a4 isEqualToString:@"inputImage"] & 1) == 0)
  {

    self->_recipe = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CIDiscBlur;
  [(CIDiscBlur *)&v7 setValue:a3 forKey:a4];
}

- (id)outputImage
{
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v10))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    [(NSNumber *)self->inputRadius floatValue];
    if (v4 <= 0.0001)
    {
      v8 = self->inputImage;
      return v8;
    }
    else
    {
      recipe = self->_recipe;
      if (!recipe)
      {
        if (v4 > 500.0) {
          float v4 = 500.0;
        }
        recipe = (NSMutableArray *)makeRecipe(v4, 0.0, 0.0, 1.0, v5);
        self->_recipe = recipe;
      }
      inputImage = self->inputImage;
      return applyRecipe(&recipe->super, inputImage);
    }
  }
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

@end