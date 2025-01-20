@interface AVTImageUtilities
+ (UIEdgeInsets)_transparencyInsetsForUInt8AlphaContext:(CGContext *)a3 requiringFullOpacity:(BOOL)a4;
+ (UIEdgeInsets)transparencyInsetsForImage:(CGImage *)a3 imageRect:(CGRect)a4 requiringFullOpacity:(BOOL)a5;
+ (UIEdgeInsets)transparencyInsetsForImage:(CGImage *)a3 requiringFullOpacity:(BOOL)a4;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3;
+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4;
+ (void)cropImageWhitespace:(CGImage *)a3 outsideRect:(CGRect)a4 insideRect:(CGRect)a5 resultBlock:(id)a6;
+ (void)posterWithStickerImage:(CGImage *)a3 posterSize:(CGSize)a4 minimumHorizontalMargin:(float)a5 thumbnailRect:(CGRect)a6 allowsExtraTallContent:(BOOL)a7 expectsExtraTallContent:(BOOL)a8 resultBlock:(id)a9;
@end

@implementation AVTImageUtilities

+ (void)cropImageWhitespace:(CGImage *)a3 outsideRect:(CGRect)a4 insideRect:(CGRect)a5 resultBlock:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v10 = a4.size.height;
  CGFloat v11 = a4.size.width;
  CGFloat v12 = a4.origin.y;
  CGFloat v13 = a4.origin.x;
  v15 = (void (**)(id, CGImage *, double, double, double, double))a6;
  size_t v16 = CGImageGetWidth(a3);
  size_t v17 = CGImageGetHeight(a3);
  +[AVTImageUtilities transparencyInsetsForImage:a3 requiringFullOpacity:0];
  double v19 = v18;
  v30.origin.CGFloat x = v20;
  CGFloat v22 = (double)v16 - v20 - v21;
  v30.size.CGFloat height = (double)v17 - v19 - v23;
  v30.origin.CGFloat y = v19;
  v30.size.CGFloat width = v22;
  v33.origin.CGFloat x = v13;
  v33.origin.CGFloat y = v12;
  v33.size.CGFloat width = v11;
  v33.size.CGFloat height = v10;
  CGRect v31 = CGRectUnion(v30, v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v32 = CGRectIntersection(v31, v34);
  double v24 = v32.origin.x;
  double v25 = v32.origin.y;
  double v26 = v32.size.width;
  double v27 = v32.size.height;
  v28 = CGImageCreateWithImageInRect(a3, v32);
  v15[2](v15, v28, v24, v25, v26, v27);

  CGImageRelease(v28);
}

+ (void)posterWithStickerImage:(CGImage *)a3 posterSize:(CGSize)a4 minimumHorizontalMargin:(float)a5 thumbnailRect:(CGRect)a6 allowsExtraTallContent:(BOOL)a7 expectsExtraTallContent:(BOOL)a8 resultBlock:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v15 = a4.height;
  double v54 = a4.width;
  size_t v17 = (void (**)(id, CGImage *, double, double, double, double))a9;
  double v18 = (double)CGImageGetWidth(a3);
  double v19 = (double)CGImageGetHeight(a3);
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  double v20 = v19 - CGRectGetMaxY(v56);
  +[AVTImageUtilities transparencyInsetsForImage:a3 requiringFullOpacity:0];
  double v24 = v23;
  double v26 = v25;
  BOOL v27 = v20 > v21;
  if (v10) {
    double v28 = v21;
  }
  else {
    double v28 = v20;
  }
  int v29 = v27 && v9;
  if (v27 && v9) {
    double v30 = v28;
  }
  else {
    double v30 = v21;
  }
  if (v27 && v9) {
    double v31 = v20;
  }
  else {
    double v31 = v21;
  }
  +[AVTImageUtilities transparencyInsetsForImage:imageRect:requiringFullOpacity:](AVTImageUtilities, "transparencyInsetsForImage:imageRect:requiringFullOpacity:", a3, 0, v26, v24, v18 - v26 - v22, v19 - v24 - v31);
  double v33 = v32;
  double v35 = v18 - v32 - v34;
  double v36 = v19 - v24 - v30;
  size_t v37 = (unint64_t)v15;
  if (v29) {
    BOOL v38 = !v10;
  }
  else {
    BOOL v38 = 1;
  }
  double v53 = v35;
  if (v38)
  {
    double v44 = v54;
    double v39 = (v54 - (float)(a5 + a5)) / v35;
    double v40 = (double)v37 - v36 * v39;
    if (v15 / v36 <= v39)
    {
      double v39 = v15 / v36;
      double v40 = 0.0;
    }
    if (v9) {
      double v42 = v15 / v36;
    }
    else {
      double v42 = v39;
    }
    if (v9) {
      double v43 = 0.0;
    }
    else {
      double v43 = v40;
    }
  }
  else
  {
    float v41 = v36 / (v19 - v24 - v20);
    size_t v37 = (unint64_t)(float)((float)v37 * v41);
    double v42 = v15 / v36 * v41;
    double v43 = 0.0;
    double v44 = v54;
  }
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  size_t v46 = (CGImageGetBitsPerPixel(a3) >> 3) * (unint64_t)v44;
  v47 = malloc_type_calloc(v37, v46, 0xAEC4E404uLL);
  ColorSpace = CGImageGetColorSpace(a3);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a3);
  v50 = CGBitmapContextCreate(v47, (unint64_t)v44, v37, BitsPerComponent, v46, ColorSpace, BitmapInfo);
  v57.size.CGFloat width = v42 * v18;
  v57.size.CGFloat height = v42 * v19;
  v57.origin.CGFloat x = ((double)(unint64_t)v44 - v53 * v42) * 0.5 - v33 * v42;
  v57.origin.CGFloat y = v43 - (v19 - (v24 + v36)) * v42;
  CGContextDrawImage(v50, v57, a3);
  Image = CGBitmapContextCreateImage(v50);
  v17[2](v17, Image, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  CGImageRelease(Image);
  CGContextRelease(v50);
  free(v47);
}

+ (UIEdgeInsets)_transparencyInsetsForUInt8AlphaContext:(CGContext *)a3 requiringFullOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  size_t Width = CGBitmapContextGetWidth(a3);
  size_t Height = CGBitmapContextGetHeight(a3);
  Data = (unsigned __int8 *)CGBitmapContextGetData(a3);
  BOOL v9 = malloc_type_calloc(Height, 2uLL, 0x1000040BDFB0063uLL);
  BOOL v10 = malloc_type_calloc(Width, 2uLL, 0x1000040BDFB0063uLL);
  if (Height)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      CGFloat v12 = Data;
      size_t v13 = Width;
      v14 = v10;
      if (Width)
      {
        while (1)
        {
          int v16 = *v12++;
          int v15 = v16;
          if (v4) {
            break;
          }
          if (v15) {
            goto LABEL_8;
          }
LABEL_9:
          ++v14;
          if (!--v13) {
            goto LABEL_10;
          }
        }
        if (v15 != 255) {
          goto LABEL_9;
        }
LABEL_8:
        ++v9[i];
        ++*v14;
        goto LABEL_9;
      }
LABEL_10:
      Data += Width;
    }
    uint64_t v17 = 0;
    double v18 = *MEMORY[0x263F1D1C0];
    double v19 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v20 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v21 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    while (!v9[v17])
    {
      if (Height == ++v17) {
        goto LABEL_18;
      }
    }
    double v18 = (double)v17;
LABEL_18:
    uint64_t v22 = 0;
    while (!v9[Height - 1 + v22])
    {
      if (-(uint64_t)Height == --v22)
      {
        if (Width) {
          goto LABEL_24;
        }
        goto LABEL_34;
      }
    }
    double v20 = (double)-v22;
    if (!Width) {
      goto LABEL_34;
    }
  }
  else
  {
    double v18 = *MEMORY[0x263F1D1C0];
    double v19 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v20 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v21 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    if (!Width) {
      goto LABEL_34;
    }
  }
LABEL_24:
  uint64_t v23 = 0;
  while (!v10[v23])
  {
    if (Width == ++v23) {
      goto LABEL_29;
    }
  }
  double v19 = (double)v23;
LABEL_29:
  uint64_t v24 = 0;
  while (!v10[Width - 1 + v24])
  {
    if (-(uint64_t)Width == --v24) {
      goto LABEL_34;
    }
  }
  double v21 = (double)-v24;
LABEL_34:
  free(v10);
  free(v9);
  double v25 = v18;
  double v26 = v19;
  double v27 = v20;
  double v28 = v21;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

+ (UIEdgeInsets)transparencyInsetsForImage:(CGImage *)a3 requiringFullOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  BOOL v9 = malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  BOOL v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, Width, 0, 7u);
  v23.size.CGFloat width = (double)Width;
  v23.size.CGFloat height = (double)Height;
  v23.origin.CGFloat x = 0.0;
  v23.origin.CGFloat y = 0.0;
  CGContextDrawImage(v10, v23, a3);
  [a1 _transparencyInsetsForUInt8AlphaContext:v10 requiringFullOpacity:v4];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGContextRelease(v10);
  free(v9);
  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

+ (UIEdgeInsets)transparencyInsetsForImage:(CGImage *)a3 imageRect:(CGRect)a4 requiringFullOpacity:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  size_t v12 = CGImageGetWidth(a3);
  size_t v13 = CGImageGetHeight(a3);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v40);
  double v15 = (double)v12;
  if (v14 > (double)v12) {
    double v14 = (double)v12;
  }
  size_t v16 = (unint64_t)v14;
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v41);
  double v18 = (double)v13;
  if (v17 > (double)v13) {
    double v17 = (double)v13;
  }
  size_t v19 = (unint64_t)v17;
  double v20 = malloc_type_calloc((unint64_t)v17 * v16, 1uLL, 0x100004077774924uLL);
  double v21 = CGBitmapContextCreate(v20, v16, v19, 8uLL, v16, 0, 7u);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGFloat v22 = -CGRectGetMinX(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  v44.origin.CGFloat y = -(v18 - CGRectGetMaxY(v43));
  v44.origin.CGFloat x = v22;
  v44.size.CGFloat width = v15;
  v44.size.CGFloat height = v18;
  CGContextDrawImage(v21, v44, a3);
  [a1 _transparencyInsetsForUInt8AlphaContext:v21 requiringFullOpacity:v5];
  double v24 = v23;
  double v26 = v25;
  double v39 = v27;
  double v29 = v28;
  CGContextRelease(v21);
  free(v20);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double v30 = v26 + CGRectGetMinX(v45);
  double v31 = (double)CGImageGetWidth(a3);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v32 = v29 + v31 - CGRectGetMaxX(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v33 = v24 + CGRectGetMinY(v47);
  double v34 = (double)CGImageGetHeight(a3);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v35 = v39 + v34 - CGRectGetMaxY(v48);
  double v36 = v33;
  double v37 = v30;
  double v38 = v32;
  result.right = v38;
  result.bottom = v35;
  result.left = v37;
  result.top = v36;
  return result;
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3
{
  return (id)[a1 trimmedImageByTrimmingTransparentPixelsFromImage:a3 requiringFullOpacity:0];
}

+ (id)trimmedImageByTrimmingTransparentPixelsFromImage:(id)a3 requiringFullOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 size];
  if (v7 >= 2.0 && ([v6 size], v8 >= 2.0))
  {
    id v11 = v6;
    size_t v12 = (CGImage *)[v11 CGImage];
    size_t Width = CGImageGetWidth(v12);
    size_t Height = CGImageGetHeight(v12);
    [v11 scale];
    double v16 = v15;
    [a1 transparencyInsetsForImage:v12 requiringFullOpacity:v4];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    id v9 = v11;
    if (v18 != 0.0 || v22 != 0.0 || v20 != 0.0 || v24 != 0.0)
    {
      v29.origin.CGFloat x = v20 + 0.0;
      v29.origin.CGFloat y = v18 + 0.0;
      v29.size.CGFloat width = (double)Width - (v20 + v24);
      v29.size.CGFloat height = (double)Height - (v18 + v22);
      double v26 = CGImageCreateWithImageInRect(v12, v29);
      float v25 = v16;
      uint64_t v27 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", v26, objc_msgSend(v9, "imageOrientation"), v25);

      CGImageRelease(v26);
      id v9 = (id)v27;
    }
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

@end