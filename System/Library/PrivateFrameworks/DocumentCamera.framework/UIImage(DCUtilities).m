@interface UIImage(DCUtilities)
+ (double)dc_aspectFitImageFrameForViewWithFrame:()DCUtilities imageSize:;
+ (id)dc_orientationMetadataFromImageOrientation:()DCUtilities;
+ (id)dc_orientedImageFromCGImage:()DCUtilities scale:transform:;
+ (id)dc_orientedImageFromImage:()DCUtilities fromOrientation:;
+ (id)dc_orientedImageFromImage:()DCUtilities toOrientation:;
+ (id)dc_systemImageNamed:()DCUtilities fromFont:;
+ (id)dc_systemImageNamed:()DCUtilities fromFont:scale:;
+ (id)dc_systemImageNamed:()DCUtilities scale:;
+ (id)dc_systemImageNamed:()DCUtilities textStyle:;
+ (id)dc_systemImageNamed:()DCUtilities textStyle:scale:;
+ (uint64_t)dc_largeSystemImageNamed:()DCUtilities;
- (id)dc_JPEGDataWithOrientation:()DCUtilities;
- (id)dc_imageDataWithUTType:()DCUtilities;
- (id)dc_imageDataWithUTType:()DCUtilities metadata:;
- (id)dc_imageWithFont:()DCUtilities;
- (id)dc_imageWithFont:()DCUtilities scale:;
- (id)dc_imageWithScale:()DCUtilities;
- (id)dc_imageWithTextStyle:()DCUtilities;
- (id)dc_imageWithTextStyle:()DCUtilities scale:;
- (id)dc_scaledImageWithSize:()DCUtilities scale:;
- (uint64_t)dc_CGImage;
- (uint64_t)dc_JPEGData;
- (uint64_t)dc_scaledImageMaxDimension:()DCUtilities scale:;
- (uint64_t)dc_scaledImageMinDimension:()DCUtilities scale:;
@end

@implementation UIImage(DCUtilities)

- (uint64_t)dc_CGImage
{
  id v1 = a1;

  return [v1 CGImage];
}

- (uint64_t)dc_scaledImageMinDimension:()DCUtilities scale:
{
  [a1 size];
  if (v6 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  double v9 = a2 / v8;
  double v10 = round(v6 * v9);
  double v11 = round(v7 * v9);

  return objc_msgSend(a1, "dc_scaledImageWithSize:scale:", v10, v11, a3);
}

- (uint64_t)dc_scaledImageMaxDimension:()DCUtilities scale:
{
  [a1 size];
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  double v9 = a2 / v8;
  double v10 = round(v6 * v9);
  double v11 = round(v7 * v9);

  return objc_msgSend(a1, "dc_scaledImageWithSize:scale:", v10, v11, a3);
}

- (id)dc_scaledImageWithSize:()DCUtilities scale:
{
  double v8 = [a1 imageRendererFormat];
  [v8 setScale:a4];
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v8, a2, a3);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__UIImage_DCUtilities__dc_scaledImageWithSize_scale___block_invoke;
  v12[3] = &unk_2642A9628;
  v12[4] = a1;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  double v10 = [v9 imageWithActions:v12];

  return v10;
}

+ (id)dc_orientedImageFromCGImage:()DCUtilities scale:transform:
{
  long long v8 = a5[1];
  *(_OWORD *)&v27.a = *a5;
  *(_OWORD *)&v27.c = v8;
  *(_OWORD *)&v27.tdouble x = a5[2];
  CGAffineTransformInvert(&transform, &v27);
  long long v9 = *(_OWORD *)&transform.c;
  *a5 = *(_OWORD *)&transform.a;
  a5[1] = v9;
  a5[2] = *(_OWORD *)&transform.tx;
  CGFloat v10 = *MEMORY[0x263F00148];
  CGFloat v11 = *(double *)(MEMORY[0x263F00148] + 8);
  double Width = (double)CGImageGetWidth(a4);
  double Height = (double)CGImageGetHeight(a4);
  long long v14 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v14;
  *(_OWORD *)&transform.tdouble x = a5[2];
  CGFloat v15 = v10;
  *(CGFloat *)&long long v14 = v11;
  double v16 = Width;
  double v17 = Height;
  CGRect v30 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v14 - 8), &transform);
  double x = v30.origin.x;
  double y = v30.origin.y;
  v20 = DCTSUCreateRGBABitmapContext(0, v30.size.width, v30.size.height, a1);
  if (!v20) {
    goto LABEL_4;
  }
  v21 = v20;
  CGContextTranslateCTM(v20, -x, -y);
  long long v22 = a5[1];
  *(_OWORD *)&transform.a = *a5;
  *(_OWORD *)&transform.c = v22;
  *(_OWORD *)&transform.tdouble x = a5[2];
  CGContextConcatCTM(v21, &transform);
  v31.origin.double x = v10;
  v31.origin.double y = v11;
  v31.size.width = Width;
  v31.size.height = Height;
  CGContextDrawImage(v21, v31, a4);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  if (!Image
    || (objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:scale:orientation:", Image, 0, a1),
        v24 = objc_claimAutoreleasedReturnValue(),
        CGImageRelease(Image),
        !v24))
  {
LABEL_4:
    v25 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[UIImage(DCUtilities) dc_orientedImageFromCGImage:scale:transform:](v25);
    }

    v24 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:", a4);
  }

  return v24;
}

+ (id)dc_orientedImageFromImage:()DCUtilities fromOrientation:
{
  v5 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  double Width = (double)CGImageGetWidth(v5);
  size_t Height = CGImageGetHeight(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  DCTransformFromImageOrientation(a4, (uint64_t)&v11, Width, (double)Height);
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  long long v8 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_orientedImageFromCGImage:scale:transform:", v5, v10, 1.0);

  return v8;
}

+ (id)dc_orientedImageFromImage:()DCUtilities toOrientation:
{
  v5 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  double Width = (double)CGImageGetWidth(v5);
  size_t Height = CGImageGetHeight(v5);
  memset(&v13, 0, sizeof(v13));
  DCTransformFromImageOrientation(a4, (uint64_t)&v13, Width, (double)Height);
  long long v8 = (void *)MEMORY[0x263F1C6B0];
  CGAffineTransform v11 = v13;
  CGAffineTransformInvert(&v12, &v11);
  long long v9 = objc_msgSend(v8, "dc_orientedImageFromCGImage:scale:transform:", v5, &v12, 1.0);

  return v9;
}

+ (id)dc_orientationMetadataFromImageOrientation:()DCUtilities
{
  v8[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = dword_21791A8D0[a3 - 1];
  }
  double v7 = @"Orientation";
  v4 = [NSNumber numberWithInt:v3];
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (uint64_t)dc_JPEGData
{
  uint64_t v2 = [a1 imageOrientation];

  return objc_msgSend(a1, "dc_JPEGDataWithOrientation:", v2);
}

- (id)dc_JPEGDataWithOrientation:()DCUtilities
{
  uint64_t v4 = *MEMORY[0x263F01A80];
  v5 = objc_msgSend((id)objc_opt_class(), "dc_orientationMetadataFromImageOrientation:", a3);
  double v6 = objc_msgSend(a1, "dc_imageDataWithUTType:metadata:", v4, v5);

  return v6;
}

- (id)dc_imageDataWithUTType:()DCUtilities
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F01A80]])
  {
    v5 = objc_msgSend((id)objc_opt_class(), "dc_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "imageOrientation"));
  }
  else
  {
    v5 = 0;
  }
  double v6 = objc_msgSend(a1, "dc_imageDataWithUTType:metadata:", v4, v5);

  return v6;
}

- (id)dc_imageDataWithUTType:()DCUtilities metadata:
{
  double v6 = a3;
  CFDictionaryRef v7 = a4;
  long long v8 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  long long v9 = CGImageDestinationCreateWithData(v8, v6, 1uLL, 0);
  if (v9)
  {
    CGFloat v10 = v9;
    CGImageDestinationAddImage(v9, (CGImageRef)[a1 CGImage], v7);
    if (CGImageDestinationFinalize(v10))
    {
      CFRelease(v10);
      CGAffineTransform v11 = (void *)[(__CFData *)v8 copy];
      goto LABEL_11;
    }
    CGAffineTransform v13 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[UIImage(DCUtilities) dc_imageDataWithUTType:metadata:]((uint64_t)v6, v13);
    }

    CFRelease(v10);
  }
  else
  {
    CGAffineTransform v12 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[UIImage(DCUtilities) dc_imageDataWithUTType:metadata:](v12);
    }
  }
  CGAffineTransform v11 = 0;
LABEL_11:

  return v11;
}

+ (double)dc_aspectFitImageFrameForViewWithFrame:()DCUtilities imageSize:
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  float v13 = CGRectGetWidth(*(CGRect *)(&a3 - 2)) / a5;
  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  v19.size.width = a3;
  v19.size.height = a4;
  float v14 = CGRectGetHeight(v19) / a6;
  double v15 = a5 * fminf(v13, v14);
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.width = a3;
  v20.size.height = a4;
  float v16 = (CGRectGetWidth(v20) - v15) * 0.5;
  double v17 = roundf(v16);
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectGetHeight(v21);
  return a1 + v17;
}

+ (uint64_t)dc_largeSystemImageNamed:()DCUtilities
{
  return objc_msgSend(a1, "dc_systemImageNamed:scale:", a3, 3);
}

+ (id)dc_systemImageNamed:()DCUtilities textStyle:
{
  id v6 = a4;
  CFDictionaryRef v7 = [a1 systemImageNamed:a3];
  long long v8 = objc_msgSend(v7, "dc_imageWithTextStyle:", v6);

  if (!v8)
  {
    long long v9 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return v8;
}

+ (id)dc_systemImageNamed:()DCUtilities textStyle:scale:
{
  id v8 = a4;
  long long v9 = [a1 systemImageNamed:a3];
  uint64_t v10 = objc_msgSend(v9, "dc_imageWithTextStyle:scale:", v8, a5);

  if (!v10)
  {
    uint64_t v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  return v10;
}

+ (id)dc_systemImageNamed:()DCUtilities fromFont:
{
  id v6 = a4;
  CFDictionaryRef v7 = [a1 systemImageNamed:a3];
  id v8 = objc_msgSend(v7, "dc_imageWithFont:", v6);

  if (!v8)
  {
    long long v9 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return v8;
}

+ (id)dc_systemImageNamed:()DCUtilities scale:
{
  v5 = objc_msgSend(a1, "systemImageNamed:");
  id v6 = objc_msgSend(v5, "dc_imageWithScale:", a4);

  if (!v6)
  {
    CFDictionaryRef v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  return v6;
}

+ (id)dc_systemImageNamed:()DCUtilities fromFont:scale:
{
  id v8 = a4;
  uint64_t v9 = [a1 systemImageNamed:a3];
  uint64_t v10 = objc_msgSend(v9, "dc_imageWithFont:scale:", v8, a5);

  if (!v10)
  {
    uint64_t v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[UIImage(DCUtilities) dc_systemImageNamed:textStyle:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  return v10;
}

- (id)dc_imageWithScale:()DCUtilities
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithScale:");
  uint64_t v3 = [a1 imageWithSymbolConfiguration:v2];

  return v3;
}

- (id)dc_imageWithFont:()DCUtilities
{
  id v4 = a1;
  if (a3)
  {
    v5 = [MEMORY[0x263F1C6C8] configurationWithFont:a3];
    uint64_t v6 = [v4 imageWithSymbolConfiguration:v5];

    id v4 = (id)v6;
  }
  else
  {
    CFDictionaryRef v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[UIImage(DCUtilities) dc_imageWithFont:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  return v4;
}

- (id)dc_imageWithFont:()DCUtilities scale:
{
  id v6 = a1;
  if (a3)
  {
    CFDictionaryRef v7 = [MEMORY[0x263F1C6C8] configurationWithFont:a3 scale:a4];
    uint64_t v8 = [v6 imageWithSymbolConfiguration:v7];

    id v6 = (id)v8;
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[UIImage(DCUtilities) dc_imageWithFont:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return v6;
}

- (id)dc_imageWithTextStyle:()DCUtilities
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithTextStyle:");
  uint64_t v3 = [a1 imageWithSymbolConfiguration:v2];

  return v3;
}

- (id)dc_imageWithTextStyle:()DCUtilities scale:
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithTextStyle:scale:");
  uint64_t v3 = [a1 imageWithSymbolConfiguration:v2];

  return v3;
}

+ (void)dc_orientedImageFromCGImage:()DCUtilities scale:transform:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", v1, 2u);
}

- (void)dc_imageDataWithUTType:()DCUtilities metadata:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestinationRef", v1, 2u);
}

- (void)dc_imageDataWithUTType:()DCUtilities metadata:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[UIImage(DCUtilities) dc_imageDataWithUTType:metadata:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
}

+ (void)dc_systemImageNamed:()DCUtilities textStyle:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dc_imageWithFont:()DCUtilities .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end