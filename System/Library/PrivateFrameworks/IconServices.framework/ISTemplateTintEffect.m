@interface ISTemplateTintEffect
- (IFColor)color;
- (ISTemplateTintEffect)initWithColor:(id)a3;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setColor:(id)a3;
@end

@implementation ISTemplateTintEffect

- (ISTemplateTintEffect)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISTemplateTintEffect;
  v6 = [(ISTemplateTintEffect *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a4;
  v7 = [v5 filterWithName:@"CIConstantColorGenerator"];
  v8 = [(ISTemplateTintEffect *)self color];
  objc_super v9 = [v8 ciColor];
  [v7 setValue:v9 forKey:*MEMORY[0x1E4F1E448]];

  v10 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceInCompositing"];
  v11 = [v7 outputImage];
  [v10 setValue:v11 forKey:*MEMORY[0x1E4F1E480]];

  [v10 setValue:v6 forKey:*MEMORY[0x1E4F1E418]];
  return v10;
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