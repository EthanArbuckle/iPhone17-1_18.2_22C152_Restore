@interface ISBlendledTintEffect
- (IFColor)color;
- (ISBlendledTintEffect)initWithColor:(id)a3;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setColor:(id)a3;
@end

@implementation ISBlendledTintEffect

- (ISBlendledTintEffect)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISBlendledTintEffect;
  v6 = [(ISBlendledTintEffect *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1E040];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v6 filterWithName:@"CIConstantColorGenerator"];
  v10 = [(ISBlendledTintEffect *)self color];
  v11 = [v10 ciColor];
  [v9 setValue:v11 forKey:*MEMORY[0x1E4F1E448]];

  v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CIBlendWithMask"];
  [v12 setValue:v7 forKey:*MEMORY[0x1E4F1E498]];

  [v12 setValue:v8 forKey:*MEMORY[0x1E4F1E418]];
  v13 = [v9 outputImage];
  [v12 setValue:v13 forKey:*MEMORY[0x1E4F1E480]];

  return v12;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end