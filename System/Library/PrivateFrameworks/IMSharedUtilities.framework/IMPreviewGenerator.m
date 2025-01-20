@interface IMPreviewGenerator
+ (BOOL)generatesMetadata;
+ (BOOL)generatesPreview;
+ (BOOL)shouldScaleUpPreview;
+ (BOOL)shouldShadePreview;
+ (BOOL)writesToDisk;
+ (CGImage)newCroppedAndRescaledImageFromImage:(CGImage *)a3 constraints:(IMPreviewConstraints *)a4 targetPxSize:(CGSize)a5;
+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (CGRect)_scaledTargetRectForSize:(CGSize)a3 andThumbnailSize:(CGSize)a4;
+ (CGSize)thumbnailFillSizeForWidth:(double)a3 imageSize:(CGSize)a4 scale:(double)a5;
+ (double)maxUpScale;
+ (id)UTITypes;
+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
+ (id)metadataExtension;
@end

@implementation IMPreviewGenerator

+ (id)UTITypes
{
  return 0;
}

+ (id)metadataExtension
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = (id)objc_opt_class();
      id v3 = v6;
      _os_log_impl(&dword_1A0772000, v2, OS_LOG_TYPE_INFO, "%@ Tried to get metadata extension for an unsupported object", (uint8_t *)&v5, 0xCu);
    }
  }
  return 0;
}

+ (BOOL)generatesPreview
{
  return 1;
}

+ (BOOL)writesToDisk
{
  return 0;
}

+ (BOOL)generatesMetadata
{
  return 0;
}

+ (BOOL)shouldScaleUpPreview
{
  return 1;
}

+ (BOOL)shouldShadePreview
{
  return 1;
}

+ (double)maxUpScale
{
  return 2.0;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "%@ Tried to generate preview for an unsupported object", (uint8_t *)&v13, 0xCu);
    }
  }
  if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:2 userInfo:0];
  }

  return 0;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = (id)objc_opt_class();
      id v15 = v18;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "%@ Tried to generate preview for an unsupported object", (uint8_t *)&v17, 0xCu);
    }
  }
  if (a8)
  {
    *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:2 userInfo:0];
  }

  return 0;
}

+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "%@ Tried to generate metadata for an unsupported object", (uint8_t *)&v13, 0xCu);
    }
  }
  if (a6)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:2 userInfo:0];
  }

  return 0;
}

+ (CGImage)newCroppedAndRescaledImageFromImage:(CGImage *)a3 constraints:(IMPreviewConstraints *)a4 targetPxSize:(CGSize)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  double height = a5.height;
  double width = a5.width;
  +[IMImageUtilities imageRefPxSize:](IMImageUtilities, "imageRefPxSize:");
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(id)objc_opt_class() shouldScaleUpPreview];
  [(id)objc_opt_class() maxUpScale];
  long long v15 = *(_OWORD *)&a4->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(_OWORD *)&buf[16] = v15;
  uint64_t v32 = *(void *)&a4->var3;
  +[IMImageUtilities scaleFactorForThumbnailWithSize:constraints:targetPxSize:shouldScaleUpPreview:maxUpScale:](IMImageUtilities, "scaleFactorForThumbnailWithSize:constraints:targetPxSize:shouldScaleUpPreview:maxUpScale:", buf, v14, v11, v13, width, height, v16);
  size_t v18 = (unint64_t)fmin(v11 * v17, width);
  size_t v19 = (unint64_t)fmin(v13 * v17, height);
  v20 = malloc_type_calloc(1uLL, 4 * v18 * v19, 0xEB22610AuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CGBitmapContextCreate(v20, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
  if (v22)
  {
    objc_msgSend(a1, "_scaledTargetRectForSize:andThumbnailSize:", (double)v18, (double)v19, v11, v13);
    CGContextDrawImage(v22, v34, a3);
    if ([a1 shouldShadePreview])
    {
      uint64_t v29 = 0;
      unint64_t v30 = 0;
      +[IMImageUtilities sampleImageEdges:usingRect:forMostlyWhitePixels:otherPixels:bytesPerRow:](IMImageUtilities, "sampleImageEdges:usingRect:forMostlyWhitePixels:otherPixels:bytesPerRow:", v20, &v30, &v29, 4 * v18, 0.0, 0.0, (double)v18, (double)v19);
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v29;
          _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Sampled edges: white %tu other: %tu", buf, 0x16u);
        }
      }
      if ((double)(v29 + v30) / 5.0 < (double)v30)
      {
        CGContextSetBlendMode(v22, kCGBlendModeSourceAtop);
        *(_OWORD *)buf = xmmword_1A0A07908;
        *(_OWORD *)&buf[16] = unk_1A0A07918;
        v24 = CGColorCreate(DeviceRGB, (const CGFloat *)buf);
        CGContextSetFillColorWithColor(v22, v24);
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        v35.size.double width = (double)v18;
        v35.size.double height = (double)v19;
        CGContextFillRect(v22, v35);
        if (v24) {
          CFRelease(v24);
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Crop image if necessary", buf, 2u);
      }
    }
    Image = CGBitmapContextCreateImage(v22);
    if (!v20) {
      goto LABEL_17;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "+[IMPreviewGenerator newCroppedAndRescaledImageFromImage:constraints:targetPxSize:]";
        _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - %s Failed to generate image context", buf, 0xCu);
      }
    }
    Image = 0;
    if (!v20) {
      goto LABEL_17;
    }
  }
  free(v20);
LABEL_17:
  if (v22) {
    CFRelease(v22);
  }
  if (DeviceRGB) {
    CFRelease(DeviceRGB);
  }
  return Image;
}

+ (CGSize)thumbnailFillSizeForWidth:(double)a3 imageSize:(CGSize)a4 scale:(double)a5
{
  double v5 = fmax(a4.width / a4.height, 0.75);
  if (v5 > 1.77777778) {
    double v5 = 1.77777778;
  }
  double v6 = a3 / v5;
  double v7 = ceil(a3);
  double v8 = ceil(v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

+ (CGRect)_scaledTargetRectForSize:(CGSize)a3 andThumbnailSize:(CGSize)a4
{
  double width = a3.width;
  BOOL v5 = a3.width / a4.width <= a3.height / a4.height;
  double v6 = a4.width / a4.height;
  if (v5)
  {
    CGFloat v10 = a3.height * v6;
    double v9 = (a3.height * v6 - width) * -0.5;
    double v8 = 0.0;
    double height = a3.height;
    double width = v10;
  }
  else
  {
    double height = width / v6;
    double v8 = (width / v6 - a3.height) * -0.5;
    double v9 = 0.0;
  }
  double v11 = v8;
  double v12 = width;
  result.size.double height = height;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

@end