@interface ISTemplateEffect
- (ISTemplateEffect)init;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
@end

@implementation ISTemplateEffect

- (ISTemplateEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISTemplateEffect;
  return [(ISTemplateEffect *)&v3 init];
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAreaMinimumAlpha"];
  uint64_t v6 = *MEMORY[0x1E4F1E480];
  [v5 setValue:v4 forKey:*MEMORY[0x1E4F1E480]];
  v7 = (void *)MEMORY[0x1E4F1E080];
  [v4 extent];
  v8 = objc_msgSend(v7, "vectorWithCGRect:");
  [v5 setValue:v8 forKey:*MEMORY[0x1E4F1E478]];

  int v17 = 0;
  v9 = objc_msgSend(MEMORY[0x1E4F1E018], "_IS_sharedIconCompositorContext");
  v10 = [v5 outputImage];
  objc_msgSend(v9, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v10, &v17, 4, *MEMORY[0x1E4F1E2F0], 0, 0.0, 0.0, 1.0, 1.0);

  if (HIBYTE(v17))
  {
    v14 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMaskToAlpha"];
    [v14 setValue:v4 forKey:v6];
  }
  else
  {
    v11 = [MEMORY[0x1E4F6F1C8] white];
    v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
    v13 = [v11 ciColor];
    [v12 setValue:v13 forKey:*MEMORY[0x1E4F1E448]];

    v14 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceInCompositing"];
    v15 = [v12 outputImage];
    [v14 setValue:v15 forKey:v6];

    [v14 setValue:v4 forKey:*MEMORY[0x1E4F1E418]];
  }

  return v14;
}

@end