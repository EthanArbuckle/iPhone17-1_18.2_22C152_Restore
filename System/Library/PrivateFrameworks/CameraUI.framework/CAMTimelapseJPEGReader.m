@interface CAMTimelapseJPEGReader
+ (BOOL)_hasExifRotation:(id)a3;
+ (CGImage)createCGImageFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6;
+ (__CVBuffer)createPixelBufferFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6;
+ (__CVBuffer)createPixelBufferFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6 cleanApertureSize:(CGSize)a7;
+ (id)_decodeOptionsWithMaxPixelSize:(int64_t)a3 applyTransform:(BOOL)a4 useBGRA:(BOOL)a5;
+ (id)newDataFromFilePath:(id)a3;
@end

@implementation CAMTimelapseJPEGReader

+ (BOOL)_hasExifRotation:(id)a3
{
  v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
  CFDictionaryRef v6 = v5;
  if (v5)
  {
    v7 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F0F4C8]];
    BOOL v8 = v7
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [v7 intValue] - 5 < 4;
  }
  else
  {
    BOOL v8 = 0;
    v7 = 0;
  }
  CFRelease(v4);

  return v8;
}

+ (id)newDataFromFilePath:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v3 options:0 error:&v10];
  id v5 = v10;
  CFDictionaryRef v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    BOOL v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CAMTimelapseJPEGReader newDataFromFilePath:v8];
    }
  }
  return v4;
}

+ (id)_decodeOptionsWithMaxPixelSize:(int64_t)a3 applyTransform:(BOOL)a4 useBGRA:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v8 = [MEMORY[0x263EFF9A0] dictionary];
  v9 = v8;
  if (v5) {
    [v8 setObject:&unk_26BDDE100 forKey:*MEMORY[0x263F2F950]];
  }
  if (v6) {
    [v9 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F2F940]];
  }
  if (a3 >= 1)
  {
    id v10 = [NSNumber numberWithInteger:a3];
    [v9 setObject:v10 forKey:*MEMORY[0x263F2F948]];
  }
  return v9;
}

+ (__CVBuffer)createPixelBufferFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6 cleanApertureSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  BOOL v9 = a6;
  BOOL v11 = a4;
  v59[4] = *MEMORY[0x263EF8340];
  id v14 = a3;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CVBufferRef buffer = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  if (!v14) {
    goto LABEL_42;
  }
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v17 = [a1 _decodeOptionsWithMaxPixelSize:a5 applyTransform:v11 useBGRA:v9];
    OSStatus CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
  }
  else
  {
    if (v9) {
      OSType v16 = 1111970369;
    }
    else {
      OSType v16 = 875704422;
    }
    v17 = [a1 _decodeOptionsWithMaxPixelSize:0 applyTransform:v11 useBGRA:0];
    OSStatus CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
    if (!CVPixelBufferFromImageData)
    {
      if (a5 < 1)
      {
        double v20 = 1.0;
      }
      else
      {
        if (width <= height) {
          double v19 = height;
        }
        else {
          double v19 = width;
        }
        double v20 = fmin((double)a5 / v19, 1.0);
      }
      float v22 = width * v20;
      size_t v23 = vcvtas_u32_f32(v22);
      float v24 = height * v20;
      size_t v25 = vcvtas_u32_f32(v24);
      if (v11)
      {
        int v26 = [a1 _hasExifRotation:v14];
        if (v26) {
          size_t v27 = v23;
        }
        else {
          size_t v27 = v25;
        }
        if (v26)
        {
          size_t v23 = v25;
          double v28 = height;
        }
        else
        {
          double v28 = width;
        }
        if (v26) {
          double height = width;
        }
        size_t v25 = v27;
        double width = v28;
      }
      v58[0] = *MEMORY[0x263F03ED0];
      v29 = [NSNumber numberWithDouble:width];
      v59[0] = v29;
      v58[1] = *MEMORY[0x263F03EB0];
      v30 = [NSNumber numberWithDouble:height];
      uint64_t v31 = *MEMORY[0x263F03EB8];
      v59[1] = v30;
      v59[2] = &unk_26BDDE118;
      uint64_t v32 = *MEMORY[0x263F03EC8];
      v58[2] = v31;
      v58[3] = v32;
      v59[3] = &unk_26BDDE118;
      v33 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];

      CVBufferSetAttachment(buffer, (CFStringRef)*MEMORY[0x263F03EC0], v33, kCVAttachmentMode_ShouldNotPropagate);
      uint64_t v56 = *MEMORY[0x263F04130];
      uint64_t v57 = MEMORY[0x263EFFA78];
      CFDictionaryRef v34 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CVReturn v36 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v23, v25, v16, v34, &pixelBufferOut);
      if (v36
        || (CVReturn v36 = VTPixelTransferSessionCreate(v35, &pixelTransferSessionOut)) != 0
        || (VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1E9F0], (CFTypeRef)*MEMORY[0x263EFFB40]), (CVReturn v36 = VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC68])) != 0))
      {
        OSStatus v21 = v36;
      }
      else
      {
        OSStatus v21 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, buffer, pixelBufferOut);
        if (!v21)
        {
          CFRelease(buffer);
          CVBufferRef buffer = pixelBufferOut;
          CVPixelBufferRef pixelBufferOut = 0;
        }
      }

      if (pixelTransferSessionOut) {
        CFRelease(pixelTransferSessionOut);
      }
      goto LABEL_35;
    }
  }
  OSStatus v21 = CVPixelBufferFromImageData;

LABEL_35:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (!v21)
  {
    v38 = buffer;
    goto LABEL_44;
  }
  v37 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v40 = NSStringFromSelector(a2);
    uint64_t v41 = [v14 length];
    v60.double width = width;
    v60.double height = height;
    v42 = NSStringFromCGSize(v60);
    *(_DWORD *)buf = 138544386;
    v47 = v40;
    __int16 v48 = 2048;
    uint64_t v49 = v21;
    __int16 v50 = 1024;
    OSStatus v51 = v21;
    __int16 v52 = 2048;
    uint64_t v53 = v41;
    __int16 v54 = 2114;
    v55 = v42;
    _os_log_error_impl(&dword_2099F8000, v37, OS_LOG_TYPE_ERROR, "Error decoding JPEG to PixelBuffer from %{public}@, err %ld (0x%x), JPEG size %lu, clapSize %{public}@", buf, 0x30u);
  }
  if (buffer) {
    CFRelease(buffer);
  }
LABEL_42:
  v38 = 0;
LABEL_44:

  return v38;
}

+ (__CVBuffer)createPixelBufferFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6
{
  return (__CVBuffer *)objc_msgSend(a1, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:cleanApertureSize:", a3, a4, a5, a6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

+ (CGImage)createCGImageFromData:(id)a3 applyTransform:(BOOL)a4 maxPixelSize:(int64_t)a5 useBGRA:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (v11)
  {
    v12 = [a1 _decodeOptionsWithMaxPixelSize:a5 applyTransform:v8 useBGRA:v6];
    int CGImageFromImageData = PFFigCreateCGImageFromImageData();
    if (CGImageFromImageData)
    {
      int v14 = CGImageFromImageData;
      v15 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        double v19 = v17;
        __int16 v20 = 2048;
        uint64_t v21 = v14;
        __int16 v22 = 2048;
        uint64_t v23 = [v11 length];
        _os_log_error_impl(&dword_2099F8000, v15, OS_LOG_TYPE_ERROR, "PFFigCreateCGImageFromImageData %{public}@ returned %ld from %lu", buf, 0x20u);
      }
    }
  }
  return 0;
}

+ (void)newDataFromFilePath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Error creating data from file %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end