@interface UIImage
@end

@implementation UIImage

void __63__UIImage_AppleAccountUI__circularImageFromCGImage_size_scale___block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", *MEMORY[0x263F00148], v5, v6, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v3, (CGPathRef)[v8 CGPath]);
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v4, v5, v6, v7);
}

uint64_t __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (CGContext *)[v3 CGContext];
  [*(id *)(a1 + 32) setFill];
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  CGFloat v5 = *(double *)(a1 + 80);
  v7.b = 0.0;
  v7.c = 0.0;
  v7.a = 1.0;
  *(_OWORD *)&v7.d = xmmword_2098C9010;
  v7.ty = v5;
  CGContextConcatCTM(v4, &v7);
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 5.0);
  id v4 = objc_claimAutoreleasedReturnValue();
  CGFloat v5 = (const CGPath *)[v4 CGPath];

  CGContextAddPath(v3, v5);
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGContextRestoreGState(v3);
}

@end