@interface ISDropShaddowEffect
- (CGSize)offset;
- (IFColor)color;
- (ISDropShaddowEffect)init;
- (double)blur;
- (double)scale;
- (double)spread;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setBlur:(double)a3;
- (void)setColor:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setSpread:(double)a3;
@end

@implementation ISDropShaddowEffect

- (ISDropShaddowEffect)init
{
  v7.receiver = self;
  v7.super_class = (Class)ISDropShaddowEffect;
  v2 = [(ISDropShaddowEffect *)&v7 init];
  v3 = (ISDropShaddowEffect *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1AE7C0F20;
    *(_OWORD *)(v2 + 8) = xmmword_1AE7C0F30;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:0.5];
    color = v3->_color;
    v3->_color = (IFColor *)v4;

    v3->_spread = 0.0;
  }
  return v3;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  double scale = self->_scale;
  color = self->_color;
  id v7 = a4;
  v8 = [(IFColor *)color ciColor];
  v9 = [MEMORY[0x1E4F1E040] filterWithName:@"CUIOuterGlowOrShadowFilter"];
  v10 = [NSNumber numberWithDouble:scale];
  [v9 setValue:v10 forKey:*MEMORY[0x1E4F1E4E0]];

  v11 = (void *)MEMORY[0x1E4F1E080];
  [(ISDropShaddowEffect *)self offset];
  double v13 = scale * v12;
  [(ISDropShaddowEffect *)self offset];
  v15 = [v11 vectorWithX:v13 Y:scale * v14];
  [v9 setValue:v15 forKey:@"inputOffset"];

  [v9 setValue:v8 forKey:*MEMORY[0x1E4F1E448]];
  v16 = NSNumber;
  [(ISDropShaddowEffect *)self blur];
  v18 = [v16 numberWithDouble:scale * v17];
  [v9 setValue:v18 forKey:@"inputSize"];

  v19 = [NSNumber numberWithDouble:scale];
  [v9 setValue:v19 forKey:@"inputRange"];

  v20 = [NSNumber numberWithDouble:scale * self->_spread];
  [v9 setValue:v20 forKey:@"inputSpread"];

  uint64_t v21 = *MEMORY[0x1E4F1E480];
  [v9 setValue:v7 forKey:*MEMORY[0x1E4F1E480]];
  v22 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
  [v22 setValue:v7 forKey:v21];

  v23 = [v9 outputImage];
  [v22 setValue:v23 forKey:*MEMORY[0x1E4F1E418]];

  return v22;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (CGSize)offset
{
  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

- (double)blur
{
  return self->_blur;
}

- (void)setBlur:(double)a3
{
  self->_blur = a3;
}

- (double)spread
{
  return self->_spread;
}

- (void)setSpread:(double)a3
{
  self->_spread = a3;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end