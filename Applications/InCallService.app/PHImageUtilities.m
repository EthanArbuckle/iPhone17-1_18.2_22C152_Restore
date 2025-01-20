@interface PHImageUtilities
+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4;
+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 usingTransparencyInsets:(UIEdgeInsets)a4 widthMultiplier:(double)a5;
+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 widthMultiplier:(double)a4;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4;
@end

@implementation PHImageUtilities

+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t Width = CGImageGetWidth((CGImageRef)[v5 CGImage]);
  id v7 = v5;
  uint64_t Height = CGImageGetHeight((CGImageRef)[v7 CGImage]);
  v9 = (unsigned __int8 *)malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, Width, 0, 7u);
  id v11 = v7;
  v12 = (CGImage *)[v11 CGImage];
  v37.size.width = (double)Width;
  v37.size.height = (double)Height;
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  CGContextDrawImage(v10, v37, v12);
  v13 = malloc_type_calloc(Height, 2uLL, 0x1000040BDFB0063uLL);
  v14 = (unsigned __int16 *)malloc_type_calloc(Width, 2uLL, 0x1000040BDFB0063uLL);
  v15 = v14;
  if (Height <= 0)
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = v9;
    do
    {
      v18 = v17;
      uint64_t v19 = Width;
      v20 = v14;
      if (Width >= 1)
      {
        while (1)
        {
          int v22 = *v18++;
          int v21 = v22;
          if (v4) {
            break;
          }
          if (v21) {
            goto LABEL_8;
          }
LABEL_9:
          ++v20;
          if (!--v19) {
            goto LABEL_10;
          }
        }
        if (v21 != 255) {
          goto LABEL_9;
        }
LABEL_8:
        ++v13[v16];
        ++*v20;
        goto LABEL_9;
      }
LABEL_10:
      ++v16;
      v17 += Width;
    }
    while (v16 != Height);
    uint64_t v23 = 0;
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    while (!v13[v23])
    {
      if (Height == ++v23) {
        goto LABEL_17;
      }
    }
    double top = (double)v23;
  }
LABEL_17:
  uint64_t v28 = -1;
  while (Height >= 1)
  {
    int v29 = (unsigned __int16)v13[Height - 1];
    ++v28;
    --Height;
    if (v29)
    {
      double bottom = (double)v28;
      break;
    }
  }
  if (Width >= 1)
  {
    uint64_t v30 = 0;
    while (!v14[v30])
    {
      if (Width == ++v30) {
        goto LABEL_27;
      }
    }
    double left = (double)v30;
  }
LABEL_27:
  uint64_t v31 = -1;
  while (Width >= 1)
  {
    int v32 = v14[Width - 1];
    ++v31;
    --Width;
    if (v32)
    {
      double right = (double)v31;
      break;
    }
  }
  free(v9);
  free(v15);
  free(v13);
  CGContextRelease(v10);

  double v33 = top;
  double v34 = left;
  double v35 = bottom;
  double v36 = right;
  result.double right = v36;
  result.double bottom = v35;
  result.double left = v34;
  result.double top = v33;
  return result;
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3
{
  return _[a1 trimmedImageByTrimmingTransparentPixelsFromImage:a3 requiringFullOpacity:0];
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
    [v6 size];
    double v14 = v13;
    v15 = [v6 pbui_CGImageBackedImage];
    [a1 transparencyInsetsForImage:v15 requiringFullOpacity:v4];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    id v24 = v6;
    id v9 = v24;
    if (v17 != 0.0 || v21 != 0.0 || v19 != 0.0 || v23 != 0.0)
    {
      [v24 scale];
      double v26 = v19 / v25 + 0.0;
      [v9 scale];
      double v28 = v17 / v27 + 0.0;
      [v9 scale];
      double v30 = v12 - (v19 + v23) / v29;
      [v9 scale];
      uint64_t v32 = [v9 pbui_cropImageWithRect:v26 outputSize:v28 v30, v14 - (v17 + v21) / v31, v30, v14 - (v17 + v21) / v31];

      id v9 = (id)v32;
    }
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 widthMultiplier:(double)a4
{
  id v5 = a3;
  [a1 transparencyInsetsForImage:v5 requiringFullOpacity:0];
  id v6 = [a1 croppedAndCenteredAvatarImageForImage:v5];

  return v6;
}

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 usingTransparencyInsets:(UIEdgeInsets)a4 widthMultiplier:(double)a5
{
  double bottom = a4.bottom;
  double top = a4.top;
  id v9 = a3;
  [v9 size];
  double v11 = v10 * a5;
  [v9 size];
  CGFloat v13 = v12;
  [v9 scale];
  CGFloat v15 = v14;
  v26.width = v11;
  v26.height = v13;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v15);
  if (bottom == 0.0 || top == 0.0)
  {
    id v16 = v9;
  }
  else
  {
    id v16 = [a1 trimmedImageByTrimmingTransparentPixelsFromImage:v9];
  }
  double v17 = v16;
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = v11;
  v27.size.height = v13;
  double MidX = CGRectGetMidX(v27);
  [v17 size];
  double v20 = MidX - v19 * 0.5;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = v11;
  v28.size.height = v13;
  double MidY = CGRectGetMidY(v28);
  [v17 size];
  [v17 drawAtPoint:v20 MidY - v22 * 0.5];
  double v23 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v23;
}

@end