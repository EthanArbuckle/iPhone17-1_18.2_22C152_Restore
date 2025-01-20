@interface UIImage(deepColor)
- (id)jfx_deepColorSafeImageDrawnInRect:()deepColor;
- (id)jfx_imageWithoutDeepColor;
- (id)jfx_renderedImageWithUpOrientation;
@end

@implementation UIImage(deepColor)

- (id)jfx_renderedImageWithUpOrientation
{
  if ([a1 imageOrientation])
  {
    double v2 = *MEMORY[0x263F001A8];
    double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
    [a1 size];
    objc_msgSend(a1, "jfx_deepColorSafeImageDrawnInRect:", v2, v3, v4, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }
  return v6;
}

- (id)jfx_deepColorSafeImageDrawnInRect:()deepColor
{
  [a1 scale];
  float v11 = v10;
  return jfx_drawInRect(a1, 1, a2, a3, a4, a5, v11);
}

- (id)jfx_imageWithoutDeepColor
{
  if (a1
    && (id v2 = a1,
        (ColorSpace = CGImageGetColorSpace((CGImageRef)[v2 CGImage])) != 0)
    && CGColorSpaceIsWideGamutRGB(ColorSpace))
  {
    double v4 = *MEMORY[0x263F001A8];
    double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
    [v2 size];
    double v7 = v6;
    double v9 = v8;
    [v2 scale];
    float v11 = v10;
    jfx_drawInRect(v2, 0, v4, v5, v7, v9, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = a1;
  }
  return v12;
}

@end