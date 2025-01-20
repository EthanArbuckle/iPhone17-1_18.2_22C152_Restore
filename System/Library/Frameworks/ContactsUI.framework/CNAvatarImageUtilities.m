@interface CNAvatarImageUtilities
+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4;
+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 usingTransparencyInsets:(UIEdgeInsets)a4 widthMultiplier:(double)a5;
+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 widthMultiplier:(double)a4;
+ (id)paddedImage:(id)a3 withPadding:(double)a4;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4;
@end

@implementation CNAvatarImageUtilities

+ (id)paddedImage:(id)a3 withPadding:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB17E0]);
  [v6 setOpaque:0];
  [v5 scale];
  objc_msgSend(v6, "setScale:");
  [v5 size];
  double v8 = v7 + a4 * 2.0;
  [v5 size];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v6, v8, v9 + a4 * 2.0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__CNAvatarImageUtilities_paddedImage_withPadding___block_invoke;
  v14[3] = &unk_1E5497590;
  id v15 = v5;
  id v11 = v5;
  v12 = [v10 imageWithActions:v14];

  return v12;
}

void __50__CNAvatarImageUtilities_paddedImage_withPadding___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v11 = [v4 format];
  [v11 bounds];
  double MidX = CGRectGetMidX(v13);
  [*(id *)(a1 + 32) size];
  double v7 = MidX - v6 * 0.5;
  double v8 = [v4 format];

  [v8 bounds];
  double MidY = CGRectGetMidY(v14);
  [*(id *)(a1 + 32) size];
  objc_msgSend(v3, "drawAtPoint:", v7, MidY - v10 * 0.5);
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 usingTransparencyInsets:(UIEdgeInsets)a4 widthMultiplier:(double)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v11 = a3;
  [v11 size];
  double v13 = v12 * a5;
  [v11 size];
  double v15 = v14;
  id v16 = objc_alloc_init(MEMORY[0x1E4FB17E0]);
  [v16 setOpaque:0];
  [v11 scale];
  objc_msgSend(v16, "setScale:");
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v16, v13, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __104__CNAvatarImageUtilities_croppedAndCenteredAvatarImageForImage_usingTransparencyInsets_widthMultiplier___block_invoke;
  v21[3] = &unk_1E5496E18;
  CGFloat v23 = top;
  CGFloat v24 = left;
  CGFloat v25 = bottom;
  CGFloat v26 = right;
  id v22 = v11;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  id v27 = a1;
  double v30 = v13;
  double v31 = v15;
  id v18 = v11;
  v19 = [v17 imageWithActions:v21];

  return v19;
}

void __104__CNAvatarImageUtilities_croppedAndCenteredAvatarImageForImage_usingTransparencyInsets_widthMultiplier___block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 56) == 0.0)
  {
    id v2 = *(id *)(a1 + 32);
  }
  else
  {
    id v2 = [*(id *)(a1 + 72) trimmedImageByTrimmingTransparentPixelsFromImage:*(void *)(a1 + 32)];
  }
  id v8 = v2;
  double MidX = CGRectGetMidX(*(CGRect *)(a1 + 80));
  [v8 size];
  double v5 = MidX - v4 * 0.5;
  double MidY = CGRectGetMidY(*(CGRect *)(a1 + 80));
  [v8 size];
  objc_msgSend(v8, "drawAtPoint:", v5, MidY - v7 * 0.5);
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 widthMultiplier:(double)a4
{
  id v5 = a3;
  [a1 transparencyInsetsForImage:v5 requiringFullOpacity:0];
  double v6 = objc_msgSend(a1, "croppedAndCenteredAvatarImageForImage:usingTransparencyInsets:widthMultiplier:", v5);

  return v6;
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 size];
  if (v7 >= 2.0 && ([v6 size], v8 >= 2.0))
  {
    [v6 size];
    double v12 = v11;
    [v6 scale];
    double v14 = v13;
    [v6 size];
    double v16 = v15;
    [v6 scale];
    double v18 = v17;
    [a1 transparencyInsetsForImage:v6 requiringFullOpacity:v4];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    id v27 = v6;
    id v9 = v27;
    if (v20 != 0.0 || v24 != 0.0 || v22 != 0.0 || v26 != 0.0)
    {
      id v28 = v27;
      uint64_t v29 = (CGImage *)[v28 CGImage];
      v34.origin.x = v22 + 0.0;
      v34.origin.y = v20 + 0.0;
      v34.size.width = v12 * v14 - (v22 + v26);
      v34.size.height = v16 * v18 - (v20 + v24);
      double v30 = CGImageCreateWithImageInRect(v29, v34);
      double v31 = (void *)MEMORY[0x1E4FB1818];
      [v28 scale];
      objc_msgSend(v31, "imageWithCGImage:scale:orientation:", v30, objc_msgSend(v28, "imageOrientation"), v32);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      CGImageRelease(v30);
    }
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3
{
  return (id)[a1 trimmedImageByTrimmingTransparentPixelsFromImage:a3 requiringFullOpacity:0];
}

+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t Width = CGImageGetWidth((CGImageRef)[v5 CGImage]);
  uint64_t v7 = Width;
  id v8 = v5;
  uint64_t Height = CGImageGetHeight((CGImageRef)[v8 CGImage]);
  double v10 = (unsigned __int8 *)malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  double v11 = CGBitmapContextCreate(v10, Width, Height, 8uLL, Width, 0, 7u);
  id v12 = v8;
  double v13 = (CGImage *)[v12 CGImage];
  v38.size.width = (double)Width;
  v38.size.height = (double)Height;
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  CGContextDrawImage(v11, v38, v13);
  double v14 = malloc_type_calloc(Height, 2uLL, 0x1000040BDFB0063uLL);
  double v15 = malloc_type_calloc(Width, 2uLL, 0x1000040BDFB0063uLL);
  double v16 = v15;
  if (Height <= 0)
  {
    double v25 = *MEMORY[0x1E4FB2848];
    double v26 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v28 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    uint64_t v17 = 0;
    double v18 = v10;
    do
    {
      double v19 = v18;
      double v20 = v15;
      uint64_t v21 = Width;
      if (Width >= 1)
      {
        while (1)
        {
          int v23 = *v19++;
          int v22 = v23;
          if (v4) {
            break;
          }
          if (v22) {
            goto LABEL_8;
          }
LABEL_9:
          ++v20;
          if (!--v21) {
            goto LABEL_10;
          }
        }
        if (v22 != 255) {
          goto LABEL_9;
        }
LABEL_8:
        ++v14[v17];
        ++*v20;
        goto LABEL_9;
      }
LABEL_10:
      ++v17;
      v18 += Width;
    }
    while (v17 != Height);
    uint64_t v24 = 0;
    double v25 = *MEMORY[0x1E4FB2848];
    double v26 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v28 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    while (!v14[v24])
    {
      if (Height == ++v24) {
        goto LABEL_17;
      }
    }
    double v25 = (double)v24;
  }
LABEL_17:
  uint64_t v29 = Height;
  while (1)
  {
    uint64_t v30 = v29;
    BOOL v31 = v29-- < 1;
    if (v31) {
      break;
    }
    if (v14[v30 - 1])
    {
      double v27 = (double)((Height - v30) & ~((Height - v30) >> 63));
      break;
    }
  }
  if (Width < 1) {
    goto LABEL_27;
  }
  for (uint64_t i = 0; i != Width; ++i)
  {
    if (*((_WORD *)v15 + i))
    {
      double v26 = (double)i;
      break;
    }
  }
LABEL_27:
  while (1)
  {
    uint64_t v33 = v7;
    BOOL v31 = v7-- < 1;
    if (v31) {
      break;
    }
    if (*((_WORD *)v15 + v33 - 1))
    {
      double v28 = (double)((Width - v33) & ~((Width - v33) >> 63));
      break;
    }
  }
  free(v10);
  free(v16);
  free(v14);
  CGContextRelease(v11);

  double v34 = v25;
  double v35 = v26;
  double v36 = v27;
  double v37 = v28;
  result.CGFloat right = v37;
  result.CGFloat bottom = v36;
  result.CGFloat left = v35;
  result.CGFloat top = v34;
  return result;
}

@end