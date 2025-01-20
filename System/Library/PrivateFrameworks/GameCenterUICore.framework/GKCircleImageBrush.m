@interface GKCircleImageBrush
- (CGSize)sizeForInput:(id)a3;
- (CGSize)sizeOverride;
- (double)scaleForInput:(id)a3;
- (id)renderedImageIdentifier;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
- (void)setSizeOverride:(CGSize)a3;
@end

@implementation GKCircleImageBrush

- (id)renderedImageIdentifier
{
  [(GKCircleImageBrush *)self sizeOverride];
  return NSStringFromCGSize(*(CGSize *)&v2);
}

- (CGSize)sizeForInput:(id)a3
{
  [(GKCircleImageBrush *)self sizeOverride];
  if (v3 == *MEMORY[0x263F001B0] && v4 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 != 1
      || ((double v3 = 57.0, *MEMORY[0x263F402F8]) ? (v8 = _GKIsRemoteUIUsingPadIdiom == 0) : (v8 = 0), v4 = 57.0, v8))
    {
      double v3 = 42.0;
      double v4 = 42.0;
    }
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)scaleForInput:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3);
  [v3 scale];
  double v5 = v4;

  return v5;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  if (!a4)
  {
    v11 = NSString;
    v12 = [NSString stringWithFormat:@"Assertion failed"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKThemeBrush.m"];
    id v14 = [v13 lastPathComponent];
    v15 = [v11 stringWithFormat:@"%@ (context != ((void *)0))\n[%s (%s:%d)]", v12, "-[GKCircleImageBrush drawInRect:withContext:input:]", objc_msgSend(v14, "UTF8String"), 499];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v15 format];
  }
  id v16 = v10;
  CGContextSaveGState(a4);
  CGContextTranslateCTM(a4, 0.0, height);
  CGContextScaleCTM(a4, 1.0, -1.0);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 scale];
  uint64_t v19 = v18;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v19;
  if (drawInRect_withContext_input__onceToken != -1) {
    dispatch_once(&drawInRect_withContext_input__onceToken, block);
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_3;
  v23[3] = &unk_264789FF8;
  v25 = v32;
  v26 = v33;
  double v27 = x;
  double v28 = y;
  CGFloat v29 = width;
  CGFloat v30 = height;
  v31 = a4;
  id v20 = v16;
  id v24 = v20;
  objc_msgSend(v20, "_gkReadAtSize:ARGBHostEndianBytes:", v23, 350.0, 350.0);
  CGContextRestoreGState(a4);
  if (annotateOnceToken != -1) {
    dispatch_once(&annotateOnceToken, &__block_literal_global_220);
  }
  if (shouldAnnotateImageUsage)
  {
    v21 = (objc_class *)objc_opt_class();
    Name = class_getName(v21);
    _annotateDrawInRectWithContextAndInput((uint64_t)Name, a4, v20, x, y, width, height);
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);
}

id __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_2;
  v3[3] = &__block_descriptor_48_e24_v16__0__GKImageContext_8l;
  int64x2_t v4 = vdupq_n_s64(0x4075E00000000000uLL);
  return +[GKImageContext imageDrawnWithSize:scale:options:usingBlock:](GKImageContext, "imageDrawnWithSize:scale:options:usingBlock:", 0, v3, 350.0, 350.0, v1);
}

void __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  double v4 = *(double *)(a1 + 32);
  double v5 = *(double *)(a1 + 40);
  v6 = (void *)MEMORY[0x263F1C478];
  id v7 = a2;
  objc_msgSend(v6, "bezierPathWithOvalInRect:", v2, v3, v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v8 = (CGContext *)[v7 CGContext];

  v12.origin.double x = v2;
  v12.origin.double y = v3;
  v12.size.CGFloat width = v4;
  v12.size.CGFloat height = v5;
  CGContextClearRect(v8, v12);
  UIGraphicsPushContext(v8);
  id v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
  CGContextSetStrokeColorWithColor(v8, (CGColorRef)[v9 CGColor]);

  [v10 setLineWidth:1.0];
  [v10 stroke];
  UIGraphicsPopContext();
  CFRetain(v8);
  drawInRect_withContext_input__sTemplateContext = (uint64_t)v8;
  drawInRect_withContext_input__sTemplatePidouble x = (uint64_t)CGBitmapContextGetData(v8);
}

void __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  if (a5 > 0.0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = drawInRect_withContext_input__sTemplatePix;
    unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      if (a4 > 0.0)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(_DWORD *)(v7 + 4 * v9))
          {
            unsigned int v10 = *(_DWORD *)(a2 + 4 * v9);
            ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
            if (!(v10 >> 28)
              || (v10 >= 0xF5u ? (BOOL v11 = (v10 & 0xFF00) >= 0xF401) : (BOOL v11 = 0),
                  v11 && (v10 & 0xFF0000) > 0xF40000))
            {
              ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            }
          }
          ++v9;
        }
        while (a4 > (double)(int)v9);
      }
      ++v6;
      a2 += v8;
      v7 += v8;
    }
    while (a5 > (double)(int)v6);
  }
  CGRect v12 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v13 = *(CGContext **)(a1 + 88);
  id v16 = v12;
  CGContextAddPath(v13, (CGPathRef)[v16 CGPath]);
  CGContextClip(*(CGContextRef *)(a1 + 88));
  CGContextDrawImage(*(CGContextRef *)(a1 + 88), *(CGRect *)(a1 + 56), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  if ((double)*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
     / (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0.2)
  {
    id v14 = *(CGContext **)(a1 + 88);
    objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0);
    id v15 = objc_claimAutoreleasedReturnValue();
    CGContextSetStrokeColorWithColor(v14, (CGColorRef)[v15 CGColor]);

    UIGraphicsPushContext(*(CGContextRef *)(a1 + 88));
    [v16 setLineWidth:1.0];
    [v16 stroke];
    UIGraphicsPopContext();
  }
}

void __51__GKCircleImageBrush_drawInRect_withContext_input___block_invoke_4()
{
  id v0 = [MEMORY[0x263F40298] shared];
  shouldAnnotateImageUsage = [v0 shouldAnnotateImageUsage];
}

- (CGSize)sizeOverride
{
  double width = self->_sizeOverride.width;
  double height = self->_sizeOverride.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSizeOverride:(CGSize)a3
{
  self->_sizeOverride = a3;
}

@end