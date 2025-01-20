@interface CLKUICurvedLayoutManager
- (CLKUICurvedLayoutManager)init;
- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9;
@end

@implementation CLKUICurvedLayoutManager

- (CLKUICurvedLayoutManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUICurvedLayoutManager;
  return [(CLKUICurvedLayoutManager *)&v3 init];
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  id v15 = a8;
  id v16 = a6;
  CGContextSetShouldSubpixelQuantizeFonts(a9, 0);
  v19.receiver = self;
  v19.super_class = (Class)CLKUICurvedLayoutManager;
  long long v17 = *(_OWORD *)&a7->c;
  v18[0] = *(_OWORD *)&a7->a;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a7->tx;
  [(CLKUICurvedLayoutManager *)&v19 showCGGlyphs:a3 positions:a4 count:a5 font:v16 textMatrix:v18 attributes:v15 inContext:a9];
}

@end