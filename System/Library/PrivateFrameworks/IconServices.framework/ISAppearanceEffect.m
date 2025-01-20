@interface ISAppearanceEffect
- (ISAppearanceEffect)initWithAppearance:(int64_t)a3;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (int64_t)appearance;
- (void)setAppearance:(int64_t)a3;
@end

@implementation ISAppearanceEffect

- (ISAppearanceEffect)initWithAppearance:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISAppearanceEffect;
  result = [(ISAppearanceEffect *)&v5 init];
  if (result) {
    result->_appearance = a3;
  }
  return result;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v5 = a4;
  if ([(ISAppearanceEffect *)self appearance] == 1)
  {
    v6 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorControls"];
    [v6 setValue:v5 forKey:@"inputImage"];
    v7 = &unk_1F064B130;
    v8 = @"inputBrightness";
    v9 = v6;
LABEL_5:
    [v9 setValue:v7 forKey:v8];
    goto LABEL_7;
  }
  if ([(ISAppearanceEffect *)self appearance] == 2)
  {
    v9 = [MEMORY[0x1E4F1E040] filterWithName:@"CIPhotoEffectNoir"];
    v6 = v9;
    v8 = @"inputImage";
    v7 = v5;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

@end