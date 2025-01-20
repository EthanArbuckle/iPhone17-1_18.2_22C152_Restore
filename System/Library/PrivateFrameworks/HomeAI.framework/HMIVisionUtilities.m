@interface HMIVisionUtilities
+ (CGRect)applyPadding:(CGRect)a3 withOriginalSize:(CGSize)a4 padding:(CGSize)a5;
+ (CGRect)imposeMinSizeFor:(CGRect)a3 withOriginalSize:(CGSize)a4 minCrop:(CGSize)a5;
+ (CGRect)maintainAspectRatio:(CGRect)a3 originalSize:(CGSize)a4 ratioThreshold:(float)a5;
+ (__CVBuffer)createPixelBufferFromImageData:(id)a3 error:(id *)a4;
+ (__CVBuffer)createPixelBufferFromJPEGData:(id)a3 error:(id *)a4;
+ (__CVBuffer)createPixelBufferFromJPEGDataProvider:(CGDataProvider *)a3 error:(id *)a4;
+ (__CVBuffer)createPixelBufferFromJPEGPath:(id)a3 error:(id *)a4;
+ (__CVBuffer)createPixelBufferWithSize:(CGSize)a3 pixelFormat:(unsigned int)a4 useIOSurface:(BOOL)a5;
+ (__CVBuffer)cropPixelBuffer:(__CVBuffer *)a3 crop:(CGRect)a4 error:(id *)a5;
+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 size:(CGSize)a4 error:(id *)a5;
+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 size:(CGSize)a4 pixelFormat:(unsigned int)a5 options:(int64_t)a6 error:(id *)a7;
+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 crop:(CGRect)a4 size:(CGSize)a5 pixelFormat:(unsigned int)a6 options:(int64_t)a7 error:(id *)a8;
+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 pixelFormat:(unsigned int)a4 options:(int64_t)a5 error:(id *)a6;
+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 rotationAngle:(float)a4 crop:(CGRect)a5 size:(CGSize)a6 precision:(unint64_t)a7 error:(id *)a8;
+ (id)createJPEGDataFromPixelBuffer:(__CVBuffer *)a3 scale:(float)a4 encodeQuality:(float)a5 error:(id *)a6;
+ (void)releaseCachedVisionResources;
@end

@implementation HMIVisionUtilities

+ (__CVBuffer)cropPixelBuffer:(__CVBuffer *)a3 crop:(CGRect)a4 error:(id *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, PixelFormatType, 0, a5, x, y, width, height, width, height);
}

+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 size:(CGSize)a4 error:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  double v11 = *MEMORY[0x263F001A0];
  double v12 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A0] + 24);
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, PixelFormatType, 0, a5, v11, v12, v13, v14, width, height);
}

+ (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 size:(CGSize)a4 pixelFormat:(unsigned int)a5 options:(int64_t)a6 error:(id *)a7
{
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, *(void *)&a5, a6, a7, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24), a4.width, a4.height);
}

+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 pixelFormat:(unsigned int)a4 options:(int64_t)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  double Size = HMICVPixelBufferGetSize(a3);
  double v13 = v12;
  double v14 = *MEMORY[0x263F001A0];
  double v15 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v16 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v17 = *(double *)(MEMORY[0x263F001A0] + 24);
  return (__CVBuffer *)objc_msgSend(a1, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, v8, a5, a6, v14, v15, v16, v17, Size, v13);
}

+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 crop:(CGRect)a4 size:(CGSize)a5 pixelFormat:(unsigned int)a6 options:(int64_t)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  double height = a5.height;
  double width = a5.width;
  double v13 = a4.size.height;
  double v14 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v17 = a3;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  double Size = HMICVPixelBufferGetSize(v17);
  double v22 = v21;
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = v14;
  v55.size.double height = v13;
  if (CGRectIsNull(v55))
  {
    BOOL v23 = 1;
  }
  else
  {
    v58.origin.double x = HMICGRectMakeWithSize();
    v58.origin.double y = v24;
    v58.size.double width = v25;
    v58.size.double height = v26;
    v56.origin.double x = x;
    v56.origin.double y = y;
    v56.size.double width = v14;
    v56.size.double height = v13;
    BOOL v23 = CGRectEqualToRect(v56, v58);
  }
  int v27 = !v23;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v17);
  uint64_t v29 = PixelFormatType;
  if (!v23
    || PixelFormatType != v10
    || Size != width
    || v22 != height
    || (IOSurface != 0) != (a7 & 1))
  {
    VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    v54 = [[HMISignpost alloc] initWithName:@"transferPixelBuffer"];
    if ((a7 & 8) != 0)
    {
      double v30 = width * 2.1;
      double v31 = height * 2.1;
      if (!v23)
      {
        if (v14 <= v30 || v13 <= v31)
        {
          int v33 = 0;
          int v27 = 1;
          goto LABEL_19;
        }
        goto LABEL_42;
      }
      if (Size > v30 && v22 > v31)
      {
LABEL_42:
        v43 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", v17, v29, a7 & 0xFFFFFFFFFFFFFFF7 | (IOSurface != 0), a8, x, y, v14, v13, width + width, height + height);
        int v27 = 0;
        if (!v43)
        {
          v34 = 0;
          goto LABEL_28;
        }
        int v33 = 1;
        double v17 = v43;
LABEL_19:
        v34 = (__CVBuffer *)objc_msgSend(a1, "createPixelBufferWithSize:pixelFormat:useIOSurface:", v10, a7 & 1, width, height);
        if (v34)
        {
          uint64_t v35 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
          if (v35)
          {
            v36 = objc_msgSend(NSString, "stringWithFormat:", @"VTPixelTransferSessionCreate failed. Error %d", v35);
            v37 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1022 description:v36];
            v38 = v37;
            if (a8) {
              *a8 = v37;
            }
          }
          else
          {
            if (!v27) {
              goto LABEL_72;
            }
            v57.origin.double x = x;
            v57.origin.double y = y;
            v57.size.double width = v14;
            v57.size.double height = v13;
            CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v57);
            uint64_t v45 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1EA10], DictionaryRepresentation);
            if (DictionaryRepresentation) {
              CFRelease(DictionaryRepresentation);
            }
            if (v45)
            {
              v36 = objc_msgSend(NSString, "stringWithFormat:", @"VTSessionSetProperty failed. Error %d", v45);
              v46 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1022 description:v36];
              v38 = v46;
              if (a8) {
                *a8 = v46;
              }
            }
            else
            {
LABEL_72:
              if ((a7 & 2) != 0
                && (uint64_t v47 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1E9F0], (CFTypeRef)*MEMORY[0x263EFFB40]), v47))
              {
                v36 = objc_msgSend(NSString, "stringWithFormat:", @"VTSessionSetProperty failed. Error %d", v47);
                v48 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1022 description:v36];
                v38 = v48;
                if (a8) {
                  *a8 = v48;
                }
              }
              else if ((a7 & 4) != 0 {
                     && (uint64_t v49 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1E9F8], (CFTypeRef)*MEMORY[0x263EFFB40]), v49))
              }
              {
                v36 = objc_msgSend(NSString, "stringWithFormat:", @"VTSessionSetProperty failed. Error %d", v49);
                v50 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1022 description:v36];
                v38 = v50;
                if (a8) {
                  *a8 = v50;
                }
              }
              else
              {
                CVPixelBufferLockBaseAddress(v17, 1uLL);
                uint64_t v51 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, v17, v34);
                CVPixelBufferUnlockBaseAddress(v17, 1uLL);
                if (!v51)
                {
                  VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
                  if (pixelTransferSessionOut) {
                    CFRelease(pixelTransferSessionOut);
                  }
                  if (v33) {
                    CVPixelBufferRelease(v17);
                  }
                  goto LABEL_34;
                }
                v36 = objc_msgSend(NSString, "stringWithFormat:", @"VTPixelTransferSessionTransferImage failed. Error %d", v51);
                v52 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1022 description:v36];
                v38 = v52;
                if (a8) {
                  *a8 = v52;
                }
              }
            }
          }
          HMIErrorLogC(v38);
        }
        else
        {
          v39 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1001];
          v40 = v39;
          if (a8) {
            *a8 = v39;
          }
          HMIErrorLogC(v40);

          v34 = 0;
        }
        int v27 = v33;
LABEL_28:
        CVPixelBufferRelease(v34);
        if (v27) {
          CVPixelBufferRelease(v17);
        }
        if (pixelTransferSessionOut)
        {
          VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
          if (pixelTransferSessionOut) {
            CFRelease(pixelTransferSessionOut);
          }
        }
        v34 = 0;
LABEL_34:
        __HMISignpostScopeLeave(&v54);

        return v34;
      }
      int v27 = 0;
    }
    int v33 = 0;
    goto LABEL_19;
  }
  CVPixelBufferRetain(v17);
  return v17;
}

+ (id)createJPEGDataFromPixelBuffer:(__CVBuffer *)a3 scale:(float)a4 encodeQuality:(float)a5 error:(id *)a6
{
  v46[2] = *MEMORY[0x263EF8340];
  CMBlockBufferRef theBuffer = 0;
  v38 = [[HMISignpost alloc] initWithName:@"JPEGDataFromPixelBuffer"];
  CFTypeRef cf = 0;
  v9 = [MEMORY[0x263EFF990] data];
  uint64_t v10 = MEMORY[0x263EFFA88];
  uint64_t v11 = *MEMORY[0x263F2F900];
  v45[0] = *MEMORY[0x263F2F908];
  v45[1] = v11;
  v46[0] = MEMORY[0x263EFFA88];
  v46[1] = MEMORY[0x263EFFA88];
  double v12 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  if (CMPhotoCompressionSessionCreate())
  {
    double v13 = 0;
LABEL_4:
    double v15 = 0;
    goto LABEL_5;
  }
  uint64_t v14 = *MEMORY[0x263F2F868];
  v43[0] = *MEMORY[0x263F2F870];
  v43[1] = v14;
  v44[0] = &unk_26D9A9120;
  v44[1] = &unk_26D9A9138;
  double v13 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  if (CMPhotoCompressionSessionOpenEmptyContainer()) {
    goto LABEL_4;
  }
  double Size = HMICVPixelBufferGetSize(a3);
  double v19 = v18;
  if (a4 > 0.0 && a4 < 1.0)
  {
    CGAffineTransformMakeScale(&v35, a4, a4);
    double v20 = v19 * v35.c;
    double v19 = v19 * v35.d + v35.b * Size;
    double Size = v20 + v35.a * Size;
  }
  if (Size <= v19) {
    double v21 = v19;
  }
  else {
    double v21 = Size;
  }
  double v22 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v23 = *MEMORY[0x263F2F8A0];
  v41[0] = *MEMORY[0x263F2F888];
  v41[1] = v23;
  v42[0] = &unk_26D9A9150;
  v42[1] = v10;
  v41[2] = *MEMORY[0x263F2F8B8];
  CGFloat v24 = [NSNumber numberWithUnsignedLong:(unint64_t)v21];
  v42[2] = v24;
  CGFloat v25 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  double v15 = [v22 dictionaryWithDictionary:v25];

  uint64_t v26 = *MEMORY[0x263F2F8D0];
  if (a5 <= 0.0 || a5 > 1.0)
  {
    [v15 setObject:&unk_26D9A9180 forKeyedSubscript:v26];
    [v15 setObject:&unk_26D9A9120 forKeyedSubscript:*MEMORY[0x263F2F8C8]];
  }
  else
  {
    [v15 setObject:&unk_26D9A9168 forKeyedSubscript:v26];
    uint64_t v39 = *MEMORY[0x263F2F980];
    *(float *)&double v27 = a5;
    v28 = [NSNumber numberWithFloat:v27];
    v40 = v28;
    uint64_t v29 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v15 setObject:v29 forKeyedSubscript:*MEMORY[0x263F2F8C8]];
  }
  if (!CMPhotoCompressionSessionAddImage()
    || (objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", v15, 0),
        double v30 = objc_claimAutoreleasedReturnValue(),
        [v30 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F2F8C0]],
        int v31 = CMPhotoCompressionSessionAddImage(),
        v30,
        !v31))
  {
    if (!CMPhotoCompressionSessionCloseContainerAndCopyBacking())
    {
      v32 = theBuffer;
      size_t DataLength = CMBlockBufferGetDataLength(theBuffer);
      v34 = malloc_type_malloc(DataLength, 0xD1CBE15uLL);
      CMBlockBufferCopyDataBytes(v32, 0, DataLength, v34);
      CFRelease(v32);
      [v9 appendBytes:v34 length:DataLength];
      free(v34);
    }
  }
LABEL_5:
  CMPhotoCompressionSessionDiscardCaches();
  CMPhotoCompressionSessionReleaseHardwareResources();
  CMPhotoCompressionSessionInvalidate();
  if (cf) {
    CFRelease(cf);
  }

  __HMISignpostScopeLeave(&v38);
  return v9;
}

+ (__CVBuffer)createPixelBufferFromJPEGDataProvider:(CGDataProvider *)a3 error:(id *)a4
{
  if (!a3 || (v6 = CGImageCreateWithJPEGDataProvider(a3, 0, 0, kCGRenderingIntentDefault)) == 0)
  {
    double v19 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000];
    double v20 = v19;
    if (a4) {
      *a4 = v19;
    }
    HMIErrorLogC(v20);

    double v18 = 0;
    uint64_t v11 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  unint64_t Width = CGImageGetWidth(v6);
  unint64_t Height = CGImageGetHeight(v7);
  ColorSpace = CGImageGetColorSpace(v7);
  uint64_t v11 = CGColorSpaceRetain(ColorSpace);
  double v12 = (double)Width;
  double v13 = (__CVBuffer *)objc_msgSend(a1, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 0, (double)Width, (double)Height);
  if (!v13)
  {
    double v22 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000];
    uint64_t v23 = v22;
    if (a4) {
      *a4 = v22;
    }
    HMIErrorLogC(v23);

    double v18 = 0;
LABEL_9:
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  uint64_t v14 = v13;
  CVPixelBufferLockBaseAddress(v13, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(v14);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  double v17 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, v11, 0x2002u);
  if (v17)
  {
    double v18 = v17;
    v26.origin.double x = 0.0;
    v26.origin.double y = 0.0;
    v26.size.double width = v12;
    v26.size.double height = (double)Height;
    CGContextDrawImage(v17, v26, v7);
    CVPixelBufferUnlockBaseAddress(v14, 0);
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(v14, 0);
    CGFloat v24 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000];
    CGFloat v25 = v24;
    if (a4) {
      *a4 = v24;
    }
    HMIErrorLogC(v25);

    double v18 = 0;
  }
LABEL_10:
  CGColorSpaceRelease(v11);
  CGContextRelease(v18);
  CGImageRelease(v7);
  return v14;
}

+ (__CVBuffer)createPixelBufferFromJPEGPath:(id)a3 error:(id *)a4
{
  v6 = CGDataProviderCreateWithFilename((const char *)[a3 UTF8String]);
  if (v6)
  {
    v7 = (__CVBuffer *)[a1 createPixelBufferFromJPEGDataProvider:v6 error:a4];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000];
    v9 = v8;
    if (a4) {
      *a4 = v8;
    }
    HMIErrorLogC(v9);

    v7 = 0;
  }
  CGDataProviderRelease(v6);
  return v7;
}

+ (__CVBuffer)createPixelBufferFromJPEGData:(id)a3 error:(id *)a4
{
  v6 = CGDataProviderCreateWithCFData((CFDataRef)a3);
  if (v6)
  {
    v7 = (__CVBuffer *)[a1 createPixelBufferFromJPEGDataProvider:v6 error:a4];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000];
    v9 = v8;
    if (a4) {
      *a4 = v8;
    }
    HMIErrorLogC(v9);

    v7 = 0;
  }
  CGDataProviderRelease(v6);
  return v7;
}

+ (__CVBuffer)createPixelBufferFromImageData:(id)a3 error:(id *)a4
{
  v5 = [MEMORY[0x263F00650] imageWithData:a3];
  [v5 extent];
  uint64_t v8 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 0, v6, v7);
  v9 = v8;
  if (v8)
  {
    CVPixelBufferLockBaseAddress(v8, 0);
    uint64_t v10 = [MEMORY[0x263F00628] contextWithOptions:0];
    [v10 render:v5 toCVPixelBuffer:v9];
    CVPixelBufferUnlockBaseAddress(v9, 0);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1001];
    uint64_t v10 = v11;
    if (a4) {
      *a4 = v11;
    }
    HMIErrorLogC(v10);
  }

  return v9;
}

+ (__CVBuffer)createPixelBufferWithSize:(CGSize)a3 pixelFormat:(unsigned int)a4 useIOSurface:(BOOL)a5
{
  double height = a3.height;
  double width = a3.width;
  v13[1] = *MEMORY[0x263EF8340];
  if (a5)
  {
    uint64_t v12 = *MEMORY[0x263F04130];
    v13[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    CFDictionaryRef v8 = 0;
  }
  CVPixelBufferRef v11 = 0;
  if (CVPixelBufferCreate(0, (unint64_t)width, (unint64_t)height, a4, v8, &v11)) {
    v9 = 0;
  }
  else {
    v9 = v11;
  }

  return v9;
}

+ (CGRect)applyPadding:(CGRect)a3 withOriginalSize:(CGSize)a4 padding:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, a4.width, a4.height);
  CGAffineTransform v30 = v31;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.double width = v10;
  v32.size.double height = v9;
  CGRect v33 = CGRectApplyAffineTransform(v32, &v30);
  int v13 = (int)v33.origin.y;
  int v14 = (int)v33.origin.x;
  int v15 = (int)v33.origin.x + (int)v33.size.width;
  int v16 = (int)v33.origin.y + (int)v33.size.height;
  int v17 = (int)width / 2;
  if (v17 >= (int)v33.origin.x) {
    int v17 = (int)v33.origin.x;
  }
  int v18 = (int)height / 2;
  if (v18 >= v13) {
    int v18 = (int)v33.origin.y;
  }
  double v19 = width + (double)v15 - (double)v17;
  if (v8 < v19) {
    double v19 = v8;
  }
  int v20 = (int)v19;
  if (v7 >= height + (double)v16 - (double)v18) {
    double v21 = height + (double)v16 - (double)v18;
  }
  else {
    double v21 = v7;
  }
  int v22 = (int)(width - (double)(v20 - v15));
  int v23 = (int)(height - (double)((int)v21 - v16));
  if (v17 > v22) {
    int v22 = v17;
  }
  if (v18 > v23) {
    int v23 = v18;
  }
  int v24 = (v14 - v22) & ~((v14 - v22) >> 31);
  CGFloat v25 = (double)v24;
  int v26 = (v13 - v23) & ~((v13 - v23) >> 31);
  CGFloat v27 = (double)v26;
  CGFloat v28 = (double)(v20 - v24);
  CGFloat v29 = (double)((int)v21 - v26);
  CGAffineTransformMakeScale(&v30, 1.0 / v8, 1.0 / v7);
  CGAffineTransform v31 = v30;
  v34.origin.CGFloat x = v25;
  v34.origin.CGFloat y = v27;
  v34.size.double width = v28;
  v34.size.double height = v29;
  return CGRectApplyAffineTransform(v34, &v30);
}

+ (CGRect)imposeMinSizeFor:(CGRect)a3 withOriginalSize:(CGSize)a4 minCrop:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, a4.width, a4.height);
  CGAffineTransform v25 = v26;
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = v10;
  v27.size.double height = v9;
  CGRect v28 = CGRectApplyAffineTransform(v27, &v25);
  int v14 = (int)v28.size.height;
  if (width <= (double)(int)v28.size.width) {
    double v15 = *MEMORY[0x263F001B0];
  }
  else {
    double v15 = width - (double)(int)v28.size.width;
  }
  if (height <= (double)v14) {
    double v16 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else {
    double v16 = height - (double)v14;
  }
  if (v16 >= 0.0 || v15 >= 0.0)
  {
    objc_msgSend(a1, "applyPadding:withOriginalSize:padding:", x, y, v10, v9, v8, v7, v15);
    double x = v17;
    double y = v18;
    double v10 = v19;
    double v9 = v20;
  }
  double v21 = x;
  double v22 = y;
  double v23 = v10;
  double v24 = v9;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

+ (CGRect)maintainAspectRatio:(CGRect)a3 originalSize:(CGSize)a4 ratioThreshold:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, a4.width, a4.height);
  CGAffineTransform v27 = v28;
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = v9;
  v29.size.double height = v8;
  CGRect v30 = CGRectApplyAffineTransform(v29, &v27);
  float v13 = v30.size.width;
  float v14 = v30.size.height;
  if (v13 <= v14)
  {
    float v18 = v14 / v13;
    if (v18 > a5)
    {
      double v17 = (float)((float)((float)(v18 / a5) + -1.0) * v13);
      double v16 = 0.0;
      goto LABEL_6;
    }
  }
  else
  {
    float v15 = v13 / v14;
    if (v15 > a5)
    {
      double v16 = (float)((float)((float)(v15 / a5) + -1.0) * v14);
      double v17 = 0.0;
LABEL_6:
      objc_msgSend(a1, "applyPadding:withOriginalSize:padding:", x, y, v9, v8, width, height, v17, v16);
      double x = v19;
      double y = v20;
      double v9 = v21;
      double v8 = v22;
    }
  }
  double v23 = x;
  double v24 = y;
  double v25 = v9;
  double v26 = v8;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (__CVBuffer)transferPixelBuffer:(__CVBuffer *)a3 rotationAngle:(float)a4 crop:(CGRect)a5 size:(CGSize)a6 precision:(unint64_t)a7 error:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  CGFloat v12 = a5.size.height;
  CGFloat v13 = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  if (CGRectIsNull(a5)) {
    goto LABEL_4;
  }
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.double width = v13;
  v48.size.double height = v12;
  if (CGRectIsInfinite(v48)
    || (v49.origin.x = x, v49.origin.y = y, v49.size.width = v13, v49.size.double height = v12, CGRectIsEmpty(v49)))
  {
LABEL_4:
    double v19 = NSString;
    double v20 = @"Invalid crop for affine transform";
LABEL_5:
    double v21 = [v19 stringWithFormat:v20];
    double v22 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:v21];
    double v23 = v22;
    if (a8) {
      *a8 = v22;
    }
    HMIErrorLogC(v23);

    return 0;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
    double v19 = NSString;
    double v20 = @"Error in pixelbuffer format for affine transform";
    goto LABEL_5;
  }
  uint64_t v26 = objc_msgSend(a1, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 1, width, height);
  if (!v26)
  {
    double v19 = NSString;
    double v20 = @"Error generating pixelbuffer for affine transform";
    goto LABEL_5;
  }
  double v24 = (__CVBuffer *)v26;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(v24, 0);
  v47[0] = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v47[1] = CVPixelBufferGetHeight(a3);
  v47[2] = CVPixelBufferGetWidth(a3);
  v47[3] = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v46[0] = CVPixelBufferGetBaseAddressOfPlane(v24, 0);
  v46[1] = CVPixelBufferGetHeight(v24);
  v46[2] = CVPixelBufferGetWidth(v24);
  v46[3] = CVPixelBufferGetBytesPerRowOfPlane(v24, 0);
  float v36 = (float)CVPixelBufferGetHeight(a3);
  memset(&v45, 0, sizeof(v45));
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.double width = v13;
  v50.size.double height = v12;
  CGFloat v27 = -CGRectGetMidX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.double width = v13;
  v51.size.double height = v12;
  CGFloat MidY = CGRectGetMidY(v51);
  CGAffineTransformMakeTranslation(&v45, v27, MidY - v36);
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeRotation(&v44, a4);
  memset(&v43, 0, sizeof(v43));
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.double width = v13;
  v52.size.double height = v12;
  CGFloat v29 = width / CGRectGetWidth(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.double width = v13;
  v53.size.double height = v12;
  CGFloat v30 = CGRectGetHeight(v53);
  CGAffineTransformMakeScale(&v43, v29, height / v30);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeTranslation(&v42, width * 0.5, height * 0.5);
  memset(&v41, 0, sizeof(v41));
  CGAffineTransform t1 = v43;
  CGAffineTransform t2 = v42;
  CGAffineTransformConcat(&v39, &t1, &t2);
  CGAffineTransform t1 = v44;
  CGAffineTransformConcat(&v40, &t1, &v39);
  CGAffineTransform t1 = v45;
  CGAffineTransformConcat(&v41, &t1, &v40);
  LODWORD(t1.a) = 0;
  if (a7 == 1) {
    uint64_t v31 = 36;
  }
  else {
    uint64_t v31 = 4;
  }
  uint64_t v32 = MEMORY[0x22A6422B0](v47, v46, 0, &v41, &t1, v31);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(v24, 0);
  if (v32)
  {
    CGRect v33 = [NSString stringWithFormat:@"Error applying affine transform"];
    CGRect v34 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:v33];
    CGAffineTransform v35 = v34;
    if (a8) {
      *a8 = v34;
    }
    HMIErrorLogC(v35);

    CVPixelBufferRelease(v24);
    return 0;
  }
  return v24;
}

+ (void)releaseCachedVisionResources
{
  id v2 = [MEMORY[0x263F1F000] globalSession];
  [v2 releaseCachedResources];
}

@end