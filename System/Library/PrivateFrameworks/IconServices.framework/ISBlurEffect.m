@interface ISBlurEffect
- (ISBlurEffect)initWithRadius:(double)a3;
- (double)radius;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setRadius:(double)a3;
@end

@implementation ISBlurEffect

- (ISBlurEffect)initWithRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISBlurEffect;
  result = [(ISBlurEffect *)&v5 init];
  if (result) {
    result->_radius = a3;
  }
  return result;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a4;
  v7 = [v5 filterWithName:@"CIAffineClamp"];
  uint64_t v8 = *MEMORY[0x1E4F1E480];
  [v7 setValue:v6 forKey:*MEMORY[0x1E4F1E480]];

  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v15[0] = *MEMORY[0x1E4F1DAB8];
  v15[1] = v9;
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v10 = [MEMORY[0x1E4F29238] valueWithBytes:v15 objCType:"{CGAffineTransform=dddddd}"];
  [v7 setValue:v10 forKey:@"inputTransform"];

  v11 = [MEMORY[0x1E4F1E040] filterWithName:@"CIDiscBlur"];
  v12 = [v7 outputImage];
  [v11 setValue:v12 forKey:v8];

  v13 = [NSNumber numberWithDouble:self->_radius];
  [v11 setValue:v13 forKey:*MEMORY[0x1E4F1E4E0]];

  return v11;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

@end