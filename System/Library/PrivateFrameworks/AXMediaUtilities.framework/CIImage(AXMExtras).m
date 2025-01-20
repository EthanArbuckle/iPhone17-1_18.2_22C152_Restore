@interface CIImage(AXMExtras)
- (id)addBorderWithBorderSize:()AXMExtras;
- (id)mergeWithImage:()AXMExtras withSize:withMetrics:;
- (uint64_t)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:;
- (uint64_t)_imageOrientationForInterfaceOrientation:()AXMExtras isMirrored:;
- (uint64_t)rotatedImageWithInterfaceOrientation:()AXMExtras displayOrientation:appliedImageOrientation:;
- (uint64_t)rotatedImageWithInterfaceOrientation:()AXMExtras isMirrored:appliedImageOrientation:;
- (void)saveToURL:()AXMExtras withOrientation:metrics:;
- (void)writeImageInAllOrientationsToDirectoryAtURL:()AXMExtras metrics:;
@end

@implementation CIImage(AXMExtras)

- (uint64_t)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:
{
  switch(a4)
  {
    case 1:
      switch(a3)
      {
        case 0:
          v5 = AXMediaLogCommon();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
            goto LABEL_20;
          }
          goto LABEL_21;
        case 1:
          goto LABEL_25;
        case 2:
          goto LABEL_23;
        case 3:
          return 8;
        case 4:
          goto LABEL_22;
        default:
          goto LABEL_8;
      }
    case 2:
      v8 = AXMediaLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:].cold.4();
      }

      switch(a3)
      {
        case 0:
          v9 = AXMediaLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:]();
          }

          goto LABEL_23;
        case 1:
          goto LABEL_23;
        case 2:
          goto LABEL_25;
        case 3:
          goto LABEL_22;
        case 4:
          return 8;
        default:
          goto LABEL_8;
      }
    case 3:
      switch(a3)
      {
        case 0:
          v5 = AXMediaLogCommon();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
            goto LABEL_20;
          }
          goto LABEL_21;
        case 1:
          goto LABEL_22;
        case 2:
          return 8;
        case 3:
          goto LABEL_25;
        case 4:
          goto LABEL_23;
        default:
          goto LABEL_8;
      }
    case 4:
      switch(a3)
      {
        case 0:
          v5 = AXMediaLogCommon();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
LABEL_20:
          }
            -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:]();
LABEL_21:

          goto LABEL_22;
        case 1:
          return 8;
        case 2:
LABEL_22:
          uint64_t result = 6;
          break;
        case 3:
LABEL_23:
          uint64_t result = 3;
          break;
        case 4:
LABEL_25:
          uint64_t result = 1;
          break;
        default:
          goto LABEL_8;
      }
      break;
    default:
      v6 = AXMediaLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:displayOrientation:]();
      }

LABEL_8:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (uint64_t)_imageOrientationForInterfaceOrientation:()AXMExtras isMirrored:
{
  switch(a3)
  {
    case 1:
      goto LABEL_8;
    case 2:
      if (a4) {
        return 5;
      }
      else {
        return 8;
      }
    case 3:
      BOOL v7 = a4 == 0;
      unsigned int v8 = 1;
      goto LABEL_11;
    case 4:
      BOOL v7 = a4 == 0;
      unsigned int v8 = 3;
      goto LABEL_11;
    default:
      v6 = AXMediaLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CIImage(AXMExtras) _imageOrientationForInterfaceOrientation:isMirrored:]();
      }

LABEL_8:
      BOOL v7 = a4 == 0;
      unsigned int v8 = 6;
LABEL_11:
      if (v7) {
        return v8;
      }
      else {
        return v8 + 1;
      }
  }
}

- (uint64_t)rotatedImageWithInterfaceOrientation:()AXMExtras displayOrientation:appliedImageOrientation:
{
  uint64_t v7 = objc_msgSend(a1, "_imageOrientationForInterfaceOrientation:displayOrientation:");
  uint64_t result = [a1 imageByApplyingOrientation:v7];
  if (a5) {
    *a5 = v7;
  }
  return result;
}

- (uint64_t)rotatedImageWithInterfaceOrientation:()AXMExtras isMirrored:appliedImageOrientation:
{
  uint64_t v7 = objc_msgSend(a1, "_imageOrientationForInterfaceOrientation:isMirrored:");
  uint64_t result = [a1 imageByApplyingOrientation:v7];
  if (a5) {
    *a5 = v7;
  }
  return result;
}

- (id)mergeWithImage:()AXMExtras withSize:withMetrics:
{
  unsigned int v8 = (objc_class *)MEMORY[0x1E4F1E018];
  id v9 = a5;
  v10 = (void *)[[v8 alloc] initWithOptions:0];
  [v9 extent];
  v11 = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:", v9);

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
  [a1 extent];
  v13 = (CGImage *)objc_msgSend(v12, "createCGImage:fromRect:", a1);

  size_t BitsPerComponent = CGImageGetBitsPerComponent(v11);
  size_t BytesPerRow = CGImageGetBytesPerRow(v11);
  ColorSpace = CGImageGetColorSpace(v11);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(v11);
  v18 = CGBitmapContextCreate(0, (unint64_t)a2, (unint64_t)a3, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGContextSetInterpolationQuality(v18, kCGInterpolationHigh);
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = a2;
  v23.size.height = a3;
  CGContextDrawImage(v18, v23, v13);
  CGContextSetAlpha(v18, 0.5);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = a2;
  v24.size.height = a3;
  CGContextDrawImage(v18, v24, v11);
  CGImageRef Image = CGBitmapContextCreateImage(v18);
  v20 = [MEMORY[0x1E4F1E050] imageWithCGImage:Image];
  if (Image) {
    CFRelease(Image);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v18) {
    CFRelease(v18);
  }

  return v20;
}

- (id)addBorderWithBorderSize:()AXMExtras
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
  [a1 extent];
  v5 = (CGImage *)objc_msgSend(v4, "createCGImage:fromRect:", a1);

  [a1 extent];
  double v7 = v6;
  double v9 = v8;
  size_t v10 = (unint64_t)v6;
  size_t v11 = (unint64_t)v8;
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v5);
  size_t BytesPerRow = CGImageGetBytesPerRow(v5);
  ColorSpace = CGImageGetColorSpace(v5);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(v5);
  v16 = CGBitmapContextCreate(0, v10, v11, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  long long v20 = xmmword_1B58ACFC0;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v7;
  v23.size.height = v9;
  CGContextDrawImage(v16, v23, v5);
  CGContextSetStrokeColor(v16, (const CGFloat *)&v20);
  CGContextSetLineWidth(v16, a2);
  v24.origin.x = a2 * 0.5;
  v24.origin.y = a2 * 0.5;
  v24.size.width = v7 - a2;
  v24.size.height = v9 - a2;
  CGContextAddRect(v16, v24);
  CGContextDrawPath(v16, kCGPathStroke);
  CGImageRef Image = CGBitmapContextCreateImage(v16);
  v18 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:", Image, v20);
  if (Image) {
    CFRelease(Image);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v16) {
    CFRelease(v16);
  }

  return v18;
}

- (void)writeImageInAllOrientationsToDirectoryAtURL:()AXMExtras metrics:
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = 1;
  do
  {
    double v8 = [a1 imageByApplyingOrientation:v7];
    [v8 saveToURL:v9 withOrientation:v7 metrics:v6];

    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 9);
}

- (void)saveToURL:()AXMExtras withOrientation:metrics:
{
  id v8 = a3;
  id v9 = a5;
  size_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  size_t v11 = [v8 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) != 0
    || (id v23 = 0,
        [v10 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v23],
        (id v13 = v23) == 0))
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v14 setDateFormat:@"MM-dd-HH-mm-ss"];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    v15 = [v14 stringFromDate:v16];

    v17 = NSString;
    [a1 extent];
    uint64_t v19 = (int)v18;
    [a1 extent];
    uint64_t v21 = [v17 stringWithFormat:@"image_%dx%d_%ld_%@.jpg", v19, (int)v20, a4, v15];
    v22 = [v8 URLByAppendingPathComponent:v21];
    AXMWriteImageToURL(a1, v22, v9);
  }
  else
  {
    id v14 = v13;
    v15 = AXMediaLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v14, v15);
    }
  }
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "unhandled display orientation. AXMPhysicalDisplayOrientationUnknown / default", v2, v3, v4, v5, v6);
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "unknown interface orienation", v2, v3, v4, v5, v6);
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras displayOrientation:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Orientation unexpected: AXMPhysicalDisplayOrientationPortraitUpsideDown. If you see this assert, please file a bug with PEP Accessibility and your device type. ", v2, v3, v4, v5, v6);
}

- (void)_imageOrientationForInterfaceOrientation:()AXMExtras isMirrored:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_ERROR, "Unknown interface orientation. assuming portrait", v1, 2u);
}

@end