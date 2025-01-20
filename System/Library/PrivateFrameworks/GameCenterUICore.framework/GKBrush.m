@interface GKBrush
+ (id)brush;
- (CGSize)sizeForInput:(id)a3;
- (double)scaleForInput:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)drawnImageForSize:(CGSize)a3 opaque:(BOOL)a4 input:(id)a5;
@end

@implementation GKBrush

+ (id)brush
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (CGSize)sizeForInput:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)scaleForInput:(id)a3
{
  if (scaleForInput__onceToken != -1) {
    dispatch_once(&scaleForInput__onceToken, &__block_literal_global_1);
  }
  return *(double *)&scaleForInput__defaultScale;
}

void __25__GKBrush_scaleForInput___block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  scaleForInput__defaultScale = v0;
}

- (id)drawnImageForSize:(CGSize)a3 opaque:(BOOL)a4 input:(id)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  [(GKBrush *)self scaleForInput:v9];
  v11 = -[GKImageContext initWithSize:scale:options:]([GKImageContext alloc], "initWithSize:scale:options:", v5, width, height, v10);
  v12 = [(GKImageContext *)v11 CGContext];
  UIGraphicsPushContext(v12);
  -[GKBrush drawInRect:withContext:input:](self, "drawInRect:withContext:input:", v12, v9, 0.0, 0.0, width, height);

  UIGraphicsPopContext();
  v13 = [(GKImageContext *)v11 image];

  return v13;
}

@end