@interface ISBorderEffect
- (IFColor)color;
- (ISBorderEffect)initWithLineWidth:(double)a3 color:(id)a4;
- (double)lineWidth;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setColor:(id)a3;
- (void)setLineWidth:(double)a3;
@end

@implementation ISBorderEffect

- (ISBorderEffect)initWithLineWidth:(double)a3 color:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ISBorderEffect;
  v8 = [(ISBorderEffect *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_lineWidth = a3;
    objc_storeStrong((id *)&v8->_color, a4);
  }

  return v9;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = [(IFColor *)self->_color ciColor];
  id v8 = v6;
  v25 = v8;
  id v9 = 0;
  if ((int)self->_lineWidth < 1)
  {
    v22 = v8;
  }
  else
  {
    int v10 = 0;
    uint64_t v29 = *MEMORY[0x1E4F1E448];
    v27 = self;
    uint64_t v28 = *MEMORY[0x1E4F1E4E0];
    uint64_t v11 = *MEMORY[0x1E4F1E480];
    v12 = v8;
    uint64_t v13 = *MEMORY[0x1E4F1E418];
    do
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:", @"CUIInnerGlowOrShadowFilter", v25);
      v15 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0];
      [v14 setValue:v15 forKey:@"inputOffset"];

      [v14 setValue:v7 forKey:v29];
      [v14 setValue:&unk_1F064B110 forKey:v28];
      [v14 setValue:&unk_1F064B120 forKey:@"inputRange"];
      [v14 setValue:v12 forKey:v11];
      id v16 = v14;

      v17 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
      v18 = [v16 outputImage];

      [v17 setValue:v18 forKey:v11];
      [v17 setValue:v12 forKey:v13];
      id v19 = v17;
      v20 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceInCompositing"];
      v21 = [v19 outputImage];

      [v20 setValue:v21 forKey:v11];
      [v20 setValue:v12 forKey:v13];
      id v9 = v20;
      v22 = [v9 outputImage];

      ++v10;
      v12 = v22;
    }
    while (v10 < (int)v27->_lineWidth);
  }
  if (v26)
  {
    v23 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
    [v23 setValue:v22 forKey:*MEMORY[0x1E4F1E480]];
    [v23 setValue:v26 forKey:*MEMORY[0x1E4F1E418]];

    id v9 = v23;
  }

  return v9;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
}

@end