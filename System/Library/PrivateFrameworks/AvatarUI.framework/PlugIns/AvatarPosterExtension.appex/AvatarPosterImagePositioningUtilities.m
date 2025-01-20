@interface AvatarPosterImagePositioningUtilities
+ (UIEdgeInsets)transparencyInsetsForImage:(id)a3 requiringFullOpacity:(BOOL)a4;
+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 scaleMultiplier:(double)a4;
+ (id)stickerGeneraterPosterOptionsWithSize:(CGSize)a3 minimumHorizontalMargin:(double)a4;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4;
@end

@implementation AvatarPosterImagePositioningUtilities

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
      int v29 = (CGImage *)[v28 CGImage];
      v33.origin.x = v22 + 0.0;
      v33.origin.y = v20 + 0.0;
      v33.size.width = v12 * v14 - (v22 + v26);
      v33.size.height = v16 * v18 - (v20 + v24);
      uint64_t v30 = CGImageCreateWithImageInRect(v29, v33);
      [v28 scale];
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v30, [v28 imageOrientation], v31);
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

+ (id)croppedAndCenteredAvatarImageForImage:(id)a3 scaleMultiplier:(double)a4
{
  id v6 = a3;
  double v7 = [a1 trimmedImageByTrimmingTransparentPixelsFromImage:v6];
  [v7 size];
  CGFloat v9 = v8 / a4;
  [v7 size];
  CGFloat v11 = v10 / a4;
  [v6 scale];
  CGFloat v13 = v12;

  v22.width = v9;
  v22.height = v11;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v13);
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v9;
  v23.size.height = v11;
  double MidX = CGRectGetMidX(v23);
  [v7 size];
  double v16 = MidX - v15 * 0.5;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v9;
  v24.size.height = v11;
  double MidY = CGRectGetMidY(v24);
  [v7 size];
  objc_msgSend(v7, "drawAtPoint:", v16, MidY - v18 * 0.5);
  double v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

+ (id)stickerGeneraterPosterOptionsWithSize:(CGSize)a3 minimumHorizontalMargin:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = objc_alloc_init((Class)AVTStickerGeneratorPosterOptions);
  objc_msgSend(v7, "setSize:", width, height);
  if (objc_opt_respondsToSelector()) {
    [v7 setMinimumHorizontalMargin:a4];
  }
  return v7;
}

@end