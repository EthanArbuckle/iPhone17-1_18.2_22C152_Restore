@interface UIImage
@end

@implementation UIImage

uint64_t __56__UIImage_MPUtilities__imageWithRoundedCornersOfRadius___block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [*(id *)(a1 + 32) size];
  double v5 = v4;
  double v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v2, v3, v4, v6, *(double *)(a1 + 40));
  [v8 addClip];

  v9 = *(void **)(a1 + 32);

  return objc_msgSend(v9, "drawInRect:", v2, v3, v5, v7);
}

void __40__UIImage_MPUtilities__imageWithShadow___block_invoke(uint64_t a1, CGContext *a2)
{
  double v4 = [*(id *)(a1 + 32) shadowColor];
  if (v4)
  {
    double v5 = [MEMORY[0x1E4FB1618] clearColor];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      double v7 = *(double *)(a1 + 56);
      CGFloat v8 = *(double *)(a1 + 48) * v7;
      CGAffineTransformMakeScale(&v24, v7, v7);
      double v9 = *(double *)(a1 + 64);
      double v10 = *(double *)(a1 + 72);
      CGFloat v11 = v10 * v24.c + v24.a * v9;
      CGFloat v12 = v10 * v24.d + v24.b * v9;
      v13 = (CGColor *)[v4 CGColor];
      v25.width = v11;
      v25.height = v12;
      CGContextSetShadowWithColor(a2, v25, v8, v13);
    }
  }
  v14 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  CGImageGetWidth(v14);
  CGImageGetHeight(v14);
  UIRectCenteredIntegralRect();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  v23 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  CGContextDrawImage(a2, v26, v23);
}

void __60__UIImage_MPUtilities__imageWithEtchedBorderOfColor_radius___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGFloat v12 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  CGImageGetWidth(v12);
  CGImageGetHeight(v12);
  UIRectCenteredIntegralRect();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGContextSaveGState(a2);
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  CGContextDrawImage(a2, v23, v12);
  v24.origin.x = v14;
  v24.origin.y = v16;
  v24.size.width = v18;
  v24.size.height = v20;
  CGContextClipToMask(a2, v24, v12);
  v25.origin.x = a3;
  v25.origin.y = a4;
  v25.size.width = a5;
  v25.size.height = a6;
  CGContextClearRect(a2, v25);
  CGContextRestoreGState(a2);
  Image = CGBitmapContextCreateImage(a2);
  v26.origin.x = a3;
  v26.origin.y = a4;
  v26.size.width = a5;
  v26.size.height = a6;
  CGContextClearRect(a2, v26);
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  CGContextDrawImage(a2, v27, v12);
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  CGContextClipToMask(a2, v28, Image);
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 40) CGColor]);
  v29.origin.x = a3;
  v29.origin.y = a4;
  v29.size.width = a5;
  v29.size.height = a6;
  CGContextFillRect(a2, v29);

  CGImageRelease(Image);
}

uint64_t __56__UIImage_MPUtilities__initWithContentsOfExactFilePath___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F79AF8] deviceSupportsASTC];
  initWithContentsOfExactFilePath__deviceSupportsASTC = result;
  return result;
}

@end