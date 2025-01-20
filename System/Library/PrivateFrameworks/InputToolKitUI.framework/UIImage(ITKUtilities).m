@interface UIImage(ITKUtilities)
+ (double)itk_aspectFitImageFrameForViewWithFrame:()ITKUtilities imageSize:;
+ (id)itk_UIImageFromCIImage:()ITKUtilities;
+ (id)itk_fileIconForURL:()ITKUtilities withPreferredSize:;
+ (id)itk_imageNamed:()ITKUtilities withTint:;
+ (id)itk_imageNamed:()ITKUtilities withTint:size:;
+ (id)itk_imageWithCIImage:()ITKUtilities;
+ (id)itk_imageWithCVPixelBuffer:()ITKUtilities;
+ (id)itk_imageWithColor:()ITKUtilities size:;
+ (id)itk_imageWithContentsOfURL:()ITKUtilities;
+ (id)itk_mainScreenScaledImageWithData:()ITKUtilities;
+ (id)itk_orientationMetadataFromImageOrientation:()ITKUtilities;
+ (id)itk_orientedImageFromCGImage:()ITKUtilities scale:transform:;
+ (id)itk_orientedImageFromImage:()ITKUtilities fromOrientation:;
+ (id)itk_orientedImageFromImage:()ITKUtilities toOrientation:;
+ (uint64_t)itk_imageWithCGImage:()ITKUtilities scale:orientation:;
+ (uint64_t)itk_imageWithData:()ITKUtilities;
+ (uint64_t)itk_imageWithData:()ITKUtilities scale:;
+ (uint64_t)itk_symbolImageWithName:()ITKUtilities;
- (id)itk_HEICDataWithCompressionQuality:()ITKUtilities orientation:;
- (id)itk_JPEGDataWithOrientation:()ITKUtilities;
- (id)itk_PNGData;
- (id)itk_PNGDataWithOrientation:()ITKUtilities;
- (id)itk_decodeInBackground;
- (id)itk_imageDataWithRequirements:()ITKUtilities;
- (id)itk_imageDataWithUTType:()ITKUtilities;
- (id)itk_imageDataWithUTType:()ITKUtilities metadata:;
- (id)itk_imageFromSubrect:()ITKUtilities;
- (id)itk_imageView;
- (id)itk_imageWithTint:()ITKUtilities size:;
- (id)itk_scaledImageWithSize:()ITKUtilities scale:;
- (uint64_t)itk_HEICData;
- (uint64_t)itk_HEICDataLossless;
- (uint64_t)itk_HEICDataWithCompressionQuality:()ITKUtilities;
- (uint64_t)itk_JPEGData;
- (uint64_t)itk_cgImage;
- (uint64_t)itk_cgImageGeneratingIfNecessary;
- (uint64_t)itk_cgImagePropertyOrientation;
- (uint64_t)itk_horizontallyMirroredImage;
- (uint64_t)itk_scaledImageMaxDimension:()ITKUtilities scale:;
- (uint64_t)itk_scaledImageMinDimension:()ITKUtilities scale:;
- (uint64_t)itk_squareStickerImageWithEdgeLength:()ITKUtilities;
- (void)itk_cgImageGeneratingIfNecessary;
- (void)itk_cropRectZeroAlpha;
- (void)itk_decodeWithCompletion:()ITKUtilities;
- (void)itk_imageDataWithRequirements:()ITKUtilities completion:;
@end

@implementation UIImage(ITKUtilities)

+ (id)itk_imageWithContentsOfURL:()ITKUtilities
{
  v3 = (objc_class *)MEMORY[0x263F827E8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 path];

  v7 = (void *)[v5 initWithContentsOfFile:v6];
  return v7;
}

+ (id)itk_mainScreenScaledImageWithData:()ITKUtilities
{
  v3 = (objc_class *)MEMORY[0x263F827E8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] _initWithData:v4 preserveScale:1 cache:1];

  v6 = (void *)MEMORY[0x263F827E8];
  id v7 = v5;
  uint64_t v8 = [v7 CGImage];
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  v11 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, objc_msgSend(v7, "imageOrientation"), v10);

  return v11;
}

+ (id)itk_imageNamed:()ITKUtilities withTint:
{
  id v5 = (void *)MEMORY[0x263F827E8];
  id v6 = a4;
  id v7 = [v5 imageNamed:a3];
  [v7 size];
  uint64_t v8 = objc_msgSend(v7, "itk_imageWithTint:size:", v6);

  return v8;
}

+ (id)itk_imageNamed:()ITKUtilities withTint:size:
{
  v9 = (void *)MEMORY[0x263F827E8];
  id v10 = a6;
  v11 = [v9 imageNamed:a5];
  v12 = objc_msgSend(v11, "itk_imageWithTint:size:", v10, a1, a2);

  return v12;
}

- (id)itk_imageWithTint:()ITKUtilities size:
{
  id v8 = a5;
  v9 = [MEMORY[0x263F827B0] defaultFormat];
  id v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  objc_msgSend(v9, "setScale:");

  v11 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v9, a2, a3);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__UIImage_ITKUtilities__itk_imageWithTint_size___block_invoke;
  v15[3] = &unk_26538E1B8;
  double v18 = a2;
  double v19 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  double v22 = a2;
  double v23 = a3;
  id v16 = v8;
  uint64_t v17 = a1;
  id v12 = v8;
  v13 = [v11 imageWithActions:v15];

  return v13;
}

- (id)itk_imageView
{
  id v2 = objc_alloc(MEMORY[0x263F82828]);
  [a1 size];
  ITKRectWithSize();
  v3 = objc_msgSend(v2, "initWithFrame:");
  [v3 setImage:a1];
  return v3;
}

- (uint64_t)itk_scaledImageMinDimension:()ITKUtilities scale:
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
  return objc_msgSend(a1, "itk_scaledImageWithSize:scale:", v10, v11, a3);
}

- (uint64_t)itk_scaledImageMaxDimension:()ITKUtilities scale:
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
  return objc_msgSend(a1, "itk_scaledImageWithSize:scale:", v10, v11, a3);
}

- (id)itk_scaledImageWithSize:()ITKUtilities scale:
{
  double v8 = [a1 imageRendererFormat];
  [v8 setScale:a4];
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v8, a2, a3);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__UIImage_ITKUtilities__itk_scaledImageWithSize_scale___block_invoke;
  v12[3] = &unk_26538E1E0;
  v12[4] = a1;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  double v10 = [v9 imageWithActions:v12];

  return v10;
}

+ (uint64_t)itk_symbolImageWithName:()ITKUtilities
{
  return objc_msgSend(MEMORY[0x263F827E8], "_systemImageNamed:");
}

- (id)itk_imageFromSubrect:()ITKUtilities
{
  [a1 scale];
  if (v10 > 1.0)
  {
    [a1 scale];
    a2 = a2 * v11;
    [a1 scale];
    a3 = a3 * v12;
    [a1 scale];
    a4 = a4 * v13;
    [a1 scale];
    a5 = a5 * v14;
  }
  id v15 = a1;
  if ([v15 CGImage])
  {
    id v16 = (CGImage *)objc_msgSend(v15, "itk_cgImage");
    v26.origin.x = a2;
    v26.origin.y = a3;
    v26.size.width = a4;
    v26.size.height = a5;
    uint64_t v17 = CGImageCreateWithImageInRect(v16, v26);
    double v18 = (void *)MEMORY[0x263F827E8];
    [v15 scale];
    uint64_t v20 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v19);
    CGImageRelease(v17);
  }
  else
  {
    uint64_t v21 = [v15 CIImage];

    if (v21)
    {
      double v22 = [v15 CIImage];
      double v23 = objc_msgSend(v22, "imageByCroppingToRect:", a2, a3, a4, a5);
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCIImage:v23];
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  return v20;
}

- (uint64_t)itk_squareStickerImageWithEdgeLength:()ITKUtilities
{
  [a1 size];
  ITKRectWithSize();
  ITKFitOrFillSizeInRect();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v14 = CGBitmapContextCreate(0, (unint64_t)a2, (unint64_t)a2, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetInterpolationQuality(v14, kCGInterpolationHigh);
  id v15 = (CGImage *)objc_msgSend(a1, "itk_cgImageGeneratingIfNecessary");
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  CGContextDrawImage(v14, v20, v15);
  CGImageRef Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  uint64_t v17 = (void *)MEMORY[0x263F827E8];
  return objc_msgSend(v17, "itk_imageWithCGImage:", Image);
}

+ (id)itk_UIImageFromCIImage:()ITKUtilities
{
  id v3 = a3;
  [v3 extent];
  double v5 = v4;
  double v7 = v6;
  v14.width = v4;
  v14.height = v6;
  UIGraphicsBeginImageContext(v14);
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  double v10 = [MEMORY[0x263F827E8] imageWithCIImage:v3];

  objc_msgSend(v10, "drawInRect:", v8, v9, v5, v7);
  CGFloat v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)itk_orientedImageFromCGImage:()ITKUtilities scale:transform:
{
  CGFloat v8 = *MEMORY[0x263F00148];
  CGFloat v9 = *(double *)(MEMORY[0x263F00148] + 8);
  double Width = (double)CGImageGetWidth(image);
  double Height = (double)CGImageGetHeight(image);
  long long v12 = a5[1];
  *(_OWORD *)&v24.a = *a5;
  *(_OWORD *)&v24.c = v12;
  *(_OWORD *)&v24.tdouble x = a5[2];
  CGFloat v13 = v8;
  *(CGFloat *)&long long v12 = v9;
  double v14 = Width;
  double v15 = Height;
  CGRect v26 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &v24);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double v18 = ITKCreateRGBABitmapContext(0, v26.size.width, v26.size.height, a4);
  if (!v18) {
    goto LABEL_12;
  }
  double v19 = v18;
  CGContextTranslateCTM(v18, -x, -y);
  long long v20 = a5[1];
  *(_OWORD *)&v24.a = *a5;
  *(_OWORD *)&v24.c = v20;
  *(_OWORD *)&v24.tdouble x = a5[2];
  CGContextConcatCTM(v19, &v24);
  v27.origin.double x = v8;
  v27.origin.double y = v9;
  v27.size.width = Width;
  v27.size.height = Height;
  CGContextDrawImage(v19, v27, image);
  uint64_t v21 = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  if (!v21
    || (objc_msgSend(MEMORY[0x263F827E8], "itk_imageWithCGImage:scale:orientation:", v21, 0, a4),
        double v22 = objc_claimAutoreleasedReturnValue(),
        CGImageRelease(v21),
        !v22))
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[UIImage(ITKUtilities) itk_orientedImageFromCGImage:scale:transform:]();
    }
    double v22 = objc_msgSend(MEMORY[0x263F827E8], "itk_imageWithCGImage:", image);
  }
  return v22;
}

+ (id)itk_orientedImageFromImage:()ITKUtilities fromOrientation:
{
  uint64_t v5 = objc_msgSend(a3, "itk_cgImage");
  memset(&v10, 0, sizeof(v10));
  itk_transformToImageOrientation(a4, (uint64_t)&v10);
  CGAffineTransform v8 = v10;
  CGAffineTransformInvert(&v9, &v8);
  CGAffineTransform v10 = v9;
  CGFloat v6 = objc_msgSend(MEMORY[0x263F827E8], "itk_orientedImageFromCGImage:scale:transform:", v5, &v9, 1.0);
  return v6;
}

+ (id)itk_orientedImageFromImage:()ITKUtilities toOrientation:
{
  uint64_t v5 = objc_msgSend(a3, "itk_cgImage");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  itk_transformFromImageOrientation(a4, (uint64_t)&v9);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  CGFloat v6 = objc_msgSend(MEMORY[0x263F827E8], "itk_orientedImageFromCGImage:scale:transform:", v5, v8, 1.0);
  return v6;
}

+ (id)itk_imageWithCIImage:()ITKUtilities
{
  id v3 = (objc_class *)MEMORY[0x263F827E8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithCIImage:v4];

  return v5;
}

- (uint64_t)itk_cgImage
{
  id v1 = a1;
  return [v1 CGImage];
}

- (uint64_t)itk_cgImageGeneratingIfNecessary
{
  uint64_t v2 = objc_msgSend(a1, "itk_cgImage");
  if (!v2)
  {
    uint64_t v3 = objc_msgSend(a1, "itk_ciImage");
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F00628]) initWithOptions:0];
      [v4 extent];
      CGFloat v6 = (const void *)objc_msgSend(v5, "createCGImage:fromRect:", v4);
      if (v6)
      {
        uint64_t v2 = (uint64_t)v6;
        CFAutorelease(v6);

        return v2;
      }
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[UIImage(ITKUtilities) itk_cgImageGeneratingIfNecessary]((uint64_t)a1);
    }
    return 0;
  }
  return v2;
}

+ (uint64_t)itk_imageWithCGImage:()ITKUtilities scale:orientation:
{
  return objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:scale:orientation:");
}

+ (uint64_t)itk_imageWithData:()ITKUtilities
{
  return objc_msgSend(MEMORY[0x263F827E8], "imageWithData:");
}

+ (uint64_t)itk_imageWithData:()ITKUtilities scale:
{
  return objc_msgSend(MEMORY[0x263F827E8], "imageWithData:scale:");
}

- (uint64_t)itk_horizontallyMirroredImage
{
  uint64_t v2 = (void *)MEMORY[0x263F827E8];
  uint64_t v3 = objc_msgSend(a1, "itk_cgImage");
  [a1 scale];
  return objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v3, 4);
}

+ (id)itk_imageWithCVPixelBuffer:()ITKUtilities
{
  CGImageRef imageOut = 0;
  VTCreateCGImageFromCVPixelBuffer(pixelBuffer, 0, &imageOut);
  if (imageOut)
  {
    id v4 = objc_msgSend(a1, "itk_imageWithCGImage:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (uint64_t)itk_cgImagePropertyOrientation
{
  uint64_t v1 = objc_msgSend(a1, "itk_imageOrientation");
  return itk_cgImagePropertyOrientationFromITKOrientation(v1);
}

+ (id)itk_orientationMetadataFromImageOrientation:()ITKUtilities
{
  v8[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = dword_252AA03B0[a3 - 1];
  }
  double v7 = @"Orientation";
  id v4 = [NSNumber numberWithInt:v3];
  v8[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (uint64_t)itk_JPEGData
{
  uint64_t v2 = objc_msgSend(a1, "itk_imageOrientation");
  return objc_msgSend(a1, "itk_JPEGDataWithOrientation:", v2);
}

- (id)itk_JPEGDataWithOrientation:()ITKUtilities
{
  uint64_t v5 = [(id)*MEMORY[0x263F1DB40] identifier];
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "itk_orientationMetadataFromImageOrientation:", a3);
  double v7 = objc_msgSend(a1, "itk_imageDataWithUTType:metadata:", v5, v6);

  return v7;
}

- (id)itk_PNGData
{
  uint64_t v2 = [(id)*MEMORY[0x263F1DC08] identifier];
  uint64_t v3 = objc_msgSend(a1, "itk_imageDataWithUTType:metadata:", v2, 0);

  return v3;
}

- (id)itk_PNGDataWithOrientation:()ITKUtilities
{
  uint64_t v5 = [(id)*MEMORY[0x263F1DC08] identifier];
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "itk_orientationMetadataFromImageOrientation:", a3);
  double v7 = objc_msgSend(a1, "itk_imageDataWithUTType:metadata:", v5, v6);

  return v7;
}

- (uint64_t)itk_HEICDataWithCompressionQuality:()ITKUtilities
{
  uint64_t v4 = objc_msgSend(a1, "itk_imageOrientation");
  return objc_msgSend(a1, "itk_HEICDataWithCompressionQuality:orientation:", v4, a2);
}

- (id)itk_HEICDataWithCompressionQuality:()ITKUtilities orientation:
{
  CGFloat v6 = objc_msgSend((id)objc_opt_class(), "itk_orientationMetadataFromImageOrientation:", a4);
  double v7 = (void *)[v6 mutableCopy];

  CGAffineTransform v8 = [NSNumber numberWithDouble:a2];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F0EFE8]];

  long long v9 = [(id)*MEMORY[0x263F1DAE8] identifier];
  long long v10 = objc_msgSend(a1, "itk_imageDataWithUTType:metadata:", v9, v7);

  return v10;
}

- (uint64_t)itk_HEICData
{
  return objc_msgSend(a1, "itk_HEICDataWithCompressionQuality:", 0.7);
}

- (uint64_t)itk_HEICDataLossless
{
  return objc_msgSend(a1, "itk_HEICDataWithCompressionQuality:", 1.0);
}

- (id)itk_imageDataWithUTType:()ITKUtilities
{
  id v4 = a3;
  uint64_t v5 = [(id)*MEMORY[0x263F1DB40] identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    double v7 = objc_msgSend((id)objc_opt_class(), "itk_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "itk_imageOrientation"));
  }
  else
  {
    double v7 = 0;
  }
  CGAffineTransform v8 = objc_msgSend(a1, "itk_imageDataWithUTType:metadata:", v4, v7);

  return v8;
}

- (id)itk_imageDataWithUTType:()ITKUtilities metadata:
{
  id v6 = a4;
  id v7 = a3;
  CGAffineTransform v8 = itk_dataFromCGImage((CGImage *)objc_msgSend(a1, "itk_cgImage"), v7, v6);

  return v8;
}

- (id)itk_imageDataWithRequirements:()ITKUtilities
{
  id v4 = a3;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__0;
  long long v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__UIImage_ITKUtilities__itk_imageDataWithRequirements___block_invoke;
  v7[3] = &unk_26538E208;
  v7[4] = &v8;
  objc_msgSend(a1, "itk_imageDataWithRequirements:completion:", v4, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)itk_imageDataWithRequirements:()ITKUtilities completion:
{
  v38[6] = *MEMORY[0x263EF8340];
  id v37 = a3;
  v36 = a4;
  id v6 = [v37 uti];
  id v7 = [(id)*MEMORY[0x263F1DAE8] identifier];
  if (![v6 isEqual:v7])
  {
    uint64_t v8 = [v37 uti];
    long long v9 = [(id)*MEMORY[0x263F1DB40] identifier];
    if (([v8 isEqual:v9] & 1) == 0)
    {
      v33 = [v37 uti];
      v34 = [(id)*MEMORY[0x263F1DC08] identifier];
      char v35 = [v33 isEqual:v34];

      if ((v35 & 1) == 0) {
        [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"validUTI", "-[UIImage(ITKUtilities) itk_imageDataWithRequirements:completion:]", 0, 0, @"UTI should be HEIC, JPEG, or PNG." functionName simulateCrash showAlert format];
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (![v37 maxLength]) {
    [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"requirements.maxLength > 0" functionName:"-[UIImage(ITKUtilities) itk_imageDataWithRequirements:completion:]" simulateCrash:0 showAlert:0 format:@"The max length requirement should be greater than zero."];
  }
  if (![v37 minLength]) {
    [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"requirements.minLength > 0" functionName:"-[UIImage(ITKUtilities) itk_imageDataWithRequirements:completion:]" simulateCrash:0 showAlert:0 format:@"The min length requirement should be greater than zero."];
  }
  if (![v37 maxDataLength]) {
    [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"requirements.maxDataLength > 0" functionName:"-[UIImage(ITKUtilities) itk_imageDataWithRequirements:completion:]" simulateCrash:0 showAlert:0 format:@"The max data length requirement should be greater than zero."];
  }
  unint64_t v10 = [v37 maxLength];
  if (v10 <= [v37 minLength]) {
    [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"requirements.maxLength > requirements.minLength" functionName:"-[UIImage(ITKUtilities) itk_imageDataWithRequirements:completion:]" simulateCrash:0 showAlert:0 format:@"The max length requirement should not be less than the min length requirement."];
  }
  long long v11 = (CGImage *)objc_msgSend(a1, "itk_cgImage");
  long long v12 = objc_msgSend((id)objc_opt_class(), "itk_orientationMetadataFromImageOrientation:", objc_msgSend(a1, "itk_imageOrientation"));
  id v13 = (void *)[v12 mutableCopy];

  double Width = (double)CGImageGetWidth(v11);
  double Height = (double)CGImageGetHeight(v11);
  [v37 maxLength];
  ITKClampSizeToMaxLength();
  v38[0] = v16;
  v38[1] = v17;
  [v37 minLength];
  [v37 maxLength];
  [v37 minLength];
  ITKClampSizeToMaxLength();
  v38[2] = v18;
  v38[3] = v19;
  [v37 minLength];
  ITKClampSizeToMaxLength();
  uint64_t v20 = 0;
  v38[4] = v21;
  v38[5] = v22;
  uint64_t v23 = *MEMORY[0x263F0EFE8];
  do
  {
    CGAffineTransform v24 = (double *)&v38[2 * v20];
    double v25 = *v24;
    double v26 = v24[1];
    ResizedCGCGImageRef Image = itk_createResizedCGImage(v11, (unint64_t)*v24, (unint64_t)v26);
    uint64_t v28 = 0;
    while (1)
    {
      v29 = [NSNumber numberWithDouble:*(double *)&qword_252AA0398[v28]];
      [v13 setObject:v29 forKeyedSubscript:v23];

      v30 = [v37 uti];
      v31 = itk_dataFromCGImage(ResizedCGImage, v30, v13);

      unint64_t v32 = [v31 length];
      if (v32 <= [v37 maxDataLength]) {
        break;
      }

      if (++v28 == 3)
      {
        CGImageRelease(ResizedCGImage);
        goto LABEL_19;
      }
    }
    CGImageRelease(ResizedCGImage);
    double Height = v26;
    double Width = v25;
    if (v31) {
      goto LABEL_21;
    }
LABEL_19:
    ++v20;
  }
  while (v20 != 3);
  v31 = 0;
  double v25 = Width;
  double v26 = Height;
LABEL_21:
  v36[2](v36, v31, v25, v26);
}

+ (id)itk_fileIconForURL:()ITKUtilities withPreferredSize:
{
  if (!a5)
  {
    long long v9 = 0;
    goto LABEL_33;
  }
  id v7 = [MEMORY[0x263F018A8] documentProxyForURL:a5 isContentManaged:0 sourceAuditToken:0];
  uint64_t v8 = [MEMORY[0x263F827E8] _iconForResourceProxy:v7 format:3];
  long long v9 = v8;
  if (!v8 || ([v8 size], v10 < a1) || (objc_msgSend(v9, "size"), v11 < a2))
  {
    long long v12 = [MEMORY[0x263F827E8] _iconForResourceProxy:v7 format:6];
    if (v12)
    {
      id v13 = v12;
      if (!v9
        || ([v12 size], double v15 = v14, objc_msgSend(v9, "size"), v15 > v16)
        && ([v13 size], double v18 = v17, objc_msgSend(v9, "size"), v18 > v19))
      {
        id v20 = v13;

        long long v9 = v20;
      }
    }
    else if (!v9)
    {
      char v23 = 1;
      goto LABEL_16;
    }
  }
  [v9 size];
  if (v21 >= a1)
  {
    [v9 size];
    if (v22 >= a2) {
      goto LABEL_22;
    }
  }
  char v23 = 0;
LABEL_16:
  CGAffineTransform v24 = [MEMORY[0x263F827E8] _iconForResourceProxy:v7 format:4];
  double v25 = v24;
  if (v24
    && ((v23 & 1) != 0
     || ([v24 size], double v27 = v26, objc_msgSend(v9, "size"), v27 > v28)
     && ([v25 size], double v30 = v29, objc_msgSend(v9, "size"), v30 > v31)))
  {

    long long v9 = v25;
  }
  else
  {

    if (!v9)
    {
      char v34 = 1;
LABEL_26:
      char v35 = [MEMORY[0x263F827E8] _iconForResourceProxy:v7 format:7];
      v36 = v35;
      if (v35)
      {
        if ((v34 & 1) != 0
          || ([v35 size], double v38 = v37, objc_msgSend(v9, "size"), v38 > v39)
          && ([v36 size], double v41 = v40, objc_msgSend(v9, "size"), v41 > v42))
        {
          id v43 = v36;

          long long v9 = v43;
        }
      }

      goto LABEL_32;
    }
  }
LABEL_22:
  [v9 size];
  if (v32 < a1 || ([v9 size], v33 < a2))
  {
    char v34 = 0;
    goto LABEL_26;
  }
LABEL_32:

LABEL_33:
  return v9;
}

- (void)itk_decodeWithCompletion:()ITKUtilities
{
  uint64_t v4 = itk_decodeWithCompletion__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&itk_decodeWithCompletion__onceToken, &__block_literal_global_1);
  }
  id v6 = (void *)[v5 copy];

  id v7 = (void *)MEMORY[0x263F086D0];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  long long v12 = __50__UIImage_ITKUtilities__itk_decodeWithCompletion___block_invoke_2;
  id v13 = &unk_26538E278;
  uint64_t v14 = a1;
  id v15 = v6;
  id v8 = v6;
  long long v9 = [v7 blockOperationWithBlock:&v10];
  objc_msgSend((id)itk_decodeWithCompletion__drawingDecodingOperationQueue, "addOperation:", v9, v10, v11, v12, v13, v14);
}

- (id)itk_decodeInBackground
{
  uint64_t v2 = [a1 imageRendererFormat];
  [a1 scale];
  objc_msgSend(v2, "setScale:");
  id v3 = objc_alloc(MEMORY[0x263F827A0]);
  [a1 size];
  uint64_t v4 = objc_msgSend(v3, "initWithSize:format:", v2);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__UIImage_ITKUtilities__itk_decodeInBackground__block_invoke;
  v7[3] = &unk_26538E2A0;
  v7[4] = a1;
  id v5 = [v4 imageWithActions:v7];

  return v5;
}

+ (id)itk_imageWithColor:()ITKUtilities size:
{
  id v7 = a5;
  v14.width = a1;
  v14.height = a2;
  UIGraphicsBeginImageContext(v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v7;
  uint64_t v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.width = a1;
  v15.size.height = a2;
  CGContextFillRect(CurrentContext, v15);
  uint64_t v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

+ (double)itk_aspectFitImageFrameForViewWithFrame:()ITKUtilities imageSize:
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

- (void)itk_cropRectZeroAlpha
{
  uint64_t v2 = (CGImage *)objc_msgSend(a1, "itk_cgImage");
  id v3 = itk_newARGB8BitmapContextFromImage(v2);
  if (v3)
  {
    uint64_t v4 = v3;
    size_t Width = CGImageGetWidth(v2);
    size_t Height = CGImageGetHeight(v2);
    v21.size.height = (double)Height;
    v21.origin.double x = 0.0;
    v21.origin.double y = 0.0;
    v21.size.width = (double)Width;
    CGContextDrawImage(v4, v21, v2);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v4);
    if (Data)
    {
      if (Height)
      {
        size_t v8 = 0;
        size_t v9 = 0;
        size_t v10 = 0;
        size_t v11 = Height;
        size_t v12 = Width;
        do
        {
          if (Width)
          {
            size_t v13 = 0;
            float v14 = Data;
            do
            {
              int v16 = *v14;
              v14 += 4;
              int v15 = v16;
              if (v12 >= v13) {
                size_t v17 = v13;
              }
              else {
                size_t v17 = v12;
              }
              if (v10 <= v13) {
                size_t v18 = v13;
              }
              else {
                size_t v18 = v10;
              }
              if (v11 >= v8) {
                size_t v19 = v8;
              }
              else {
                size_t v19 = v11;
              }
              if (v9 <= v8) {
                size_t v20 = v8;
              }
              else {
                size_t v20 = v9;
              }
              if (v15)
              {
                size_t v12 = v17;
                size_t v11 = v19;
                size_t v10 = v18;
                size_t v9 = v20;
              }
              ++v13;
            }
            while (Width != v13);
            Data += 4 * Width;
          }
          ++v8;
        }
        while (v8 != Height);
      }
      CGContextRelease(v4);
      [a1 scale];
    }
    else
    {
      CGContextRelease(v4);
    }
  }
}

+ (void)itk_orientedImageFromCGImage:()ITKUtilities scale:transform:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_252A7A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create CGContext to generate oriented image. Falling back to unrotated image.", v0, 2u);
}

- (void)itk_cgImageGeneratingIfNecessary
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_252A7A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error creating CGImage from image: %@", (uint8_t *)&v1, 0xCu);
}

@end