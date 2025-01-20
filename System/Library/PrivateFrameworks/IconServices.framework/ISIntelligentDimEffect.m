@interface ISIntelligentDimEffect
- (BOOL)flagDimming;
- (ISIntelligentDimEffect)init;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (void)setFlagDimming:(BOOL)a3;
@end

@implementation ISIntelligentDimEffect

- (ISIntelligentDimEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISIntelligentDimEffect;
  v2 = [(ISIntelligentDimEffect *)&v5 init];
  if (v2)
  {
    v3 = +[ISDefaults sharedInstance];
    v2->_flagDimming = [v3 isFlagDimmedDedicatedAssetsEnabled];
  }
  return v2;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1B3E70EF0]();
  id v9 = v7;
  v10 = +[ISDefaults sharedInstance];
  int v11 = [v10 isDarkIconDimmingEnabled];

  v12 = v9;
  if (v11)
  {
    v13 = -[ISDimmingConversion initWithCGImage:]([ISDimmingConversion alloc], "initWithCGImage:", [v9 CGImage]);
    v12 = v9;
    if ([(ISDimmingConversion *)v13 isDimmable])
    {
      uint64_t v14 = [(ISDimmingConversion *)v13 createDimmedImage];
      v12 = v9;
      if (v14)
      {
        v15 = (const void *)v14;
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:v14];

        CFRelease(v15);
        if ([(ISIntelligentDimEffect *)self flagDimming])
        {
          v16 = (void *)MEMORY[0x1E4F1E050];
          v17 = [MEMORY[0x1E4F1E008] magentaColor];
          uint64_t v18 = [v16 imageWithColor:v17];

          v12 = (void *)v18;
        }
      }
    }
  }
  v19 = [MEMORY[0x1E4F1E040] filterWithName:@"CICrop"];
  v20 = (void *)MEMORY[0x1E4F1E080];
  [v12 extent];
  v21 = objc_msgSend(v20, "vectorWithCGRect:");
  [v19 setValue:v21 forKey:@"inputRectangle"];

  [v19 setValue:v12 forKey:*MEMORY[0x1E4F1E480]];

  return v19;
}

- (BOOL)flagDimming
{
  return self->_flagDimming;
}

- (void)setFlagDimming:(BOOL)a3
{
  self->_flagDimming = a3;
}

@end