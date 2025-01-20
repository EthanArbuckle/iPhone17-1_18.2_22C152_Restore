@interface _MUVariableBlurView
+ (Class)layerClass;
- (_MUVariableBlurView)initWithRadius:(double)a3 maskImage:(CGImage *)a4;
@end

@implementation _MUVariableBlurView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_MUVariableBlurView)initWithRadius:(double)a3 maskImage:(CGImage *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_MUVariableBlurView;
  v6 = -[_MUVariableBlurView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(_MUVariableBlurView *)v6 setBackgroundColor:v7];

    v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A348]];
    [v8 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputDither"];
    [v8 setValue:a4 forKey:@"inputMaskImage"];
    [v8 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    v9 = [NSNumber numberWithDouble:a3];
    [v8 setValue:v9 forKey:@"inputRadius"];

    [v8 setName:@"variableBlur"];
    v10 = [(_MUVariableBlurView *)v6 backdropLayer];
    [v10 setAllowsHitTesting:0];
    v14[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v10 setFilters:v11];

    [v10 setMasksToBounds:1];
  }
  return v6;
}

@end