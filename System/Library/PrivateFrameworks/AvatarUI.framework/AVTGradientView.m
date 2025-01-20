@interface AVTGradientView
+ (Class)layerClass;
- (AVTGradientView)initWithFrame:(CGRect)a3;
@end

@implementation AVTGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVTGradientView)initWithFrame:(CGRect)a3
{
  v19[6] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AVTGradientView;
  v3 = -[AVTGradientView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(AVTGradientView *)v3 layer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v7 = (void *)MEMORY[0x263EFF940];
      v8 = [(AVTGradientView *)v4 layer];
      [v7 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v8 format];
    }
    v9 = [(AVTGradientView *)v4 layer];
    id v10 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
    v19[0] = [v10 CGColor];
    id v11 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
    v19[1] = [v11 CGColor];
    id v12 = [MEMORY[0x263F1C550] whiteColor];
    v19[2] = [v12 CGColor];
    id v13 = [MEMORY[0x263F1C550] whiteColor];
    v19[3] = [v13 CGColor];
    id v14 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
    v19[4] = [v14 CGColor];
    id v15 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
    v19[5] = [v15 CGColor];
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:6];
    [v9 setColors:v16];

    [v9 setLocations:&unk_26BF4D5E8];
    objc_msgSend(v9, "setStartPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    objc_msgSend(v9, "setEndPoint:", 1.0, 0.0);
  }
  return v4;
}

@end