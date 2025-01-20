@interface VideoUtil
+ (CGSize)compute16AlignedResolutionForNativeWidth:(unsigned int)a3 nativeHeight:(unsigned int)a4 maxScreenPixelCount:(unint64_t)a5 maxScreenEncodingSizeSupported:(unint64_t)a6;
+ (CGSize)computeResolutionForMainDisplayWithMaxScreenPixelCount:(unint64_t)a3;
+ (CGSize)computeVisibleAspectRatioWithRemoteScreenAspectRatio:(CGSize)a3 remoteExpectedAspectRatio:(CGSize)a4 encodeWidth:(int)a5 encodeHeight:(int)a6;
+ (CGSize)getBestCaptureSizeForEncodingSize:(CGSize)a3;
+ (CGSize)sizeForVideoResolution:(int64_t)a3;
+ (__CFString)typeIdentifierForImageType:(int)a3;
+ (id)convertPixelBuffer:(__CVBuffer *)a3 toImageType:(int)a4 withAssetIdentifier:(id)a5 cameraStatusBits:(unsigned __int8)a6 allowTimeMetaData:(BOOL)a7;
+ (int)setupBufferPool:(__CVPixelBufferPool *)a3 width:(double)a4 height:(double)a5;
+ (int64_t)compareVideoAspectRatioSizeA:(CGSize)a3 toSizeB:(CGSize)a4;
+ (int64_t)videoResolutionForWidth:(int)a3 height:(int)a4;
+ (unsigned)videoCodecForPayload:(int)a3;
@end

@implementation VideoUtil

+ (id)convertPixelBuffer:(__CVBuffer *)a3 toImageType:(int)a4 withAssetIdentifier:(id)a5 cameraStatusBits:(unsigned __int8)a6 allowTimeMetaData:(BOOL)a7
{
  BOOL v48 = a7;
  uint64_t v8 = *(void *)&a4;
  v64[1] = *MEMORY[0x1E4F143B8];
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Width, Height, 0x42475241u, 0, &pixelBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.9();
      }
    }
    goto LABEL_58;
  }
  if (VTPixelTransferSessionCreate(0, &pixelTransferSessionOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.8();
      }
    }
    goto LABEL_58;
  }
  if (VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a3, pixelBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.7();
      }
    }
    goto LABEL_58;
  }
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]();
      }
    }
LABEL_58:
    v19 = 0;
    v13 = 0;
LABEL_59:
    v21 = 0;
LABEL_60:
    v41 = 0;
    v27 = 0;
    goto LABEL_35;
  }
  v13 = DeviceRGB;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  CFRetain(pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
  CVPixelBufferRef v15 = pixelBufferOut;
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  size_t DataSize = CVPixelBufferGetDataSize(pixelBufferOut);
  v18 = CGDataProviderCreateWithData(v15, BaseAddress, DataSize, (CGDataProviderReleaseDataCallback)ReleaseCVPixelBuffer);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]();
      }
    }
    v19 = 0;
    goto LABEL_59;
  }
  v19 = v18;
  CGImageRef v20 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, v13, 0x2006u, v18, 0, 0, kCGRenderingIntentDefault);
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]();
      }
    }
    goto LABEL_59;
  }
  v21 = v20;
  v22 = +[VideoUtil typeIdentifierForImageType:v8];
  if (!v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.4();
      }
    }
    goto LABEL_60;
  }
  CFStringRef v23 = v22;
  v24 = (__CFData *)[MEMORY[0x1E4F1CA58] data];
  CGImageDestinationRef v25 = CGImageDestinationCreateWithData(v24, v23, 1uLL, 0);
  if (!v25)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.5();
      }
    }
    goto LABEL_60;
  }
  v26 = v25;
  int v46 = v8;
  v27 = objc_opt_new();
  size_t v45 = Height;
  if (ImageMetadataDictionary_sOnceToken != -1) {
    dispatch_once(&ImageMetadataDictionary_sOnceToken, &__block_literal_global_44);
  }
  uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v29 = [(id)ImageMetadataDictionary_sDateTimeFormatter stringFromDate:v28];
  uint64_t v30 = [(id)ImageMetadataDictionary_sSubsecTimeFormatter stringFromDate:v28];
  if ((a6 & 0x80) != 0)
  {
    uint64_t v31 = 6;
    switch(a6 & 3)
    {
      case 1:
        uint64_t v31 = 8;
        break;
      case 2:
        if ((a6 & 8) != 0) {
          uint64_t v31 = 1;
        }
        else {
          uint64_t v31 = 3;
        }
        break;
      case 3:
        if ((a6 & 8) != 0) {
          uint64_t v31 = 3;
        }
        else {
          uint64_t v31 = 1;
        }
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v31 = 0;
  }
  uint64_t v32 = [NSNumber numberWithUnsignedChar:v31];
  [v27 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  if (a5)
  {
    v64[0] = *MEMORY[0x1E4F15530];
    *(void *)buf = a5;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v64 count:1];
    [v27 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  }
  v34 = objc_opt_new();
  if (v34)
  {
    v35 = v34;
    [v34 setObject:@"Apple" forKeyedSubscript:*MEMORY[0x1E4F2FD60]];
    [v35 setObject:ImageMetadataDictionary_sMarketingNameString forKeyedSubscript:*MEMORY[0x1E4F2FD68]];
    if (v48) {
      [v35 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F2FD38]];
    }
    [v35 setObject:&unk_1F3DC4758 forKeyedSubscript:*MEMORY[0x1E4F2FDA8]];
    [v35 setObject:&unk_1F3DC4758 forKeyedSubscript:*MEMORY[0x1E4F2FDB8]];
    [v35 setObject:&unk_1F3DC4770 forKeyedSubscript:*MEMORY[0x1E4F2FD80]];
    [v27 setObject:&unk_1F3DC4758 forKeyedSubscript:*MEMORY[0x1E4F2F6B0]];
    [v27 setObject:&unk_1F3DC4758 forKeyedSubscript:*MEMORY[0x1E4F2F6A8]];
    [v27 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  }
  v36 = objc_opt_new();
  if (v36)
  {
    v37 = v36;
    if (v48)
    {
      [v36 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F2F7F0]];
      [v37 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F2F7E8]];
      [v37 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F2F950]];
      [v37 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F2F948]];
    }
    [v37 setObject:@"Apple" forKeyedSubscript:*MEMORY[0x1E4F2F888]];
    v38 = objc_opt_new();
    if (v38)
    {
      v39 = v38;
      if (ImageMetadataDictionary_sMarketingNameString)
      {
        objc_msgSend(v38, "appendString:");
        if ((a6 & 8) != 0) {
          v40 = @" back FaceTime camera";
        }
        else {
          v40 = @" front FaceTime camera";
        }
        [v39 appendString:v40];
        [v37 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F2F890]];
      }
    }
    [v37 setObject:@"FaceTime Photo" forKeyedSubscript:*MEMORY[0x1E4F2F958]];
    [v27 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F2F800]];
  }
  [v27 setObject:&unk_1F3DC8B30 forKeyedSubscript:*MEMORY[0x1E4F2F430]];
  CGImageDestinationAddImage(v26, v21, (CFDictionaryRef)v27);
  if (CGImageDestinationFinalize(v26))
  {
    v41 = v24;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        *(void *)&buf[4] = v42;
        __int16 v52 = 2080;
        v53 = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
        __int16 v54 = 1024;
        int v55 = 1472;
        __int16 v56 = 1024;
        int v57 = v46;
        __int16 v58 = 2048;
        size_t v59 = Width;
        __int16 v60 = 2048;
        size_t v61 = v45;
        __int16 v62 = 2112;
        v63 = v27;
        _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created image type:%d data with (%zux%zu) %@", buf, 0x40u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:].cold.6();
      }
    }
    v41 = 0;
  }
  CFRelease(v26);
LABEL_35:
  CGImageRelease(v21);
  CGColorSpaceRelease(v13);
  CGDataProviderRelease(v19);
  CVPixelBufferRelease(pixelBufferOut);
  if (pixelTransferSessionOut) {
    CFRelease(pixelTransferSessionOut);
  }

  return v41;
}

+ (CGSize)sizeForVideoResolution:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C)
  {
    if (a3 != 27)
    {
      double v4 = dbl_1E259FB20[a3];
      double v3 = dbl_1E259FBF8[a3];
      goto LABEL_8;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VideoUtil sizeForVideoResolution:]();
    }
  }
  double v3 = 480.0;
  double v4 = 640.0;
LABEL_8:
  result.height = v3;
  result.width = v4;
  return result;
}

+ (CGSize)getBestCaptureSizeForEncodingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v5 = (int)a3.width;
  int v6 = (int)a3.height;
  if ((int)a3.width) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (a3.width == a3.height)
    {
      +[VideoUtil getBestCaptureSizeForEncodingSize:](VideoUtil, "getBestCaptureSizeForEncodingSize:", 1280.0, 720.0);
LABEL_23:
      double width = v8;
      double height = v9;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = -1;
      uint64_t v12 = -1;
      do
      {
        +[VideoUtil sizeForVideoResolution:v10];
        double v14 = v13;
        double v16 = v15;
        int v17 = (int)v13;
        int v18 = (int)v15;
        if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "cameraSupportsWidth:height:", (int)v13, (int)v15))
        {
          if (v17 == v5 && v18 == v6)
          {
            uint64_t v12 = v10;
LABEL_21:
            uint64_t v20 = v12;
LABEL_22:
            +[VideoUtil sizeForVideoResolution:v20];
            goto LABEL_23;
          }
          if (vabdd_f64(v14 / v16, width / height) >= 0.05) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v12 = v10;
          }
        }
        ++v10;
      }
      while (v10 != 28);
      if (v12 != -1) {
        goto LABEL_21;
      }
      if (v11 != -1)
      {
        uint64_t v20 = v11;
        goto LABEL_22;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v25 = 136316162;
          uint64_t v26 = v23;
          __int16 v27 = 2080;
          uint64_t v28 = "+[VideoUtil getBestCaptureSizeForEncodingSize:]";
          __int16 v29 = 1024;
          int v30 = 1642;
          __int16 v31 = 1024;
          int v32 = v5;
          __int16 v33 = 1024;
          int v34 = v6;
          _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot find capture size for %dx%d", (uint8_t *)&v25, 0x28u);
        }
      }
    }
  }
  double v21 = width;
  double v22 = height;
  result.double height = v22;
  result.double width = v21;
  return result;
}

+ (int64_t)videoResolutionForWidth:(int)a3 height:(int)a4
{
  if (a3 == 1088 && a4 == 1088) {
    return 20;
  }
  if (a3 == 96 && a4 == 96) {
    return 0;
  }
  if (a3 == 128 && a4 == 128) {
    return 1;
  }
  if (a3 == 192 && a4 == 112) {
    return 2;
  }
  if (a3 == 192 && a4 == 192) {
    return 3;
  }
  if (a3 == 240 && a4 == 240) {
    return 4;
  }
  if (a3 == 256 && a4 == 256) {
    return 5;
  }
  if (a3 == 320 && a4 == 176) {
    return 6;
  }
  if (a3 == 320 && a4 == 240) {
    return 7;
  }
  if (a3 == 320 && a4 == 320) {
    return 8;
  }
  if (a3 == 480 && a4 == 272) {
    return 9;
  }
  if (a3 == 480 && a4 == 368) {
    return 10;
  }
  if (a3 == 480 && a4 == 480) {
    return 11;
  }
  if (a3 == 512 && a4 == 512) {
    return 12;
  }
  if (a3 == 640 && a4 == 368) {
    return 13;
  }
  if (a3 == 640 && a4 == 480) {
    return 14;
  }
  if (a3 == 640 && a4 == 640) {
    return 15;
  }
  if (a3 == 720 && a4 == 720) {
    return 16;
  }
  if (a3 == 1024 && a4 == 768) {
    return 17;
  }
  if (a3 == 1280 && a4 == 720) {
    return 18;
  }
  if (a3 == 1280 && a4 == 960) {
    return 19;
  }
  if (a3 == 1664 && a4 == 1248) {
    return 21;
  }
  if (a3 == 1920 && a4 == 1080) {
    return 22;
  }
  if (a3 == 2592 && a4 == 1936) {
    return 24;
  }
  if (a4 == 2448 && a3 == 3264) {
    return 25;
  }
  else {
    return 27;
  }
}

+ (int)setupBufferPool:(__CVPixelBufferPool *)a3 width:(double)a4 height:(double)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  double v8 = (void *)MEMORY[0x1E4E589F0](a1, a2);
  uint64_t v21 = *MEMORY[0x1E4F2F0F8];
  v22[0] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v10 = *MEMORY[0x1E4F24D88];
  v19[0] = *MEMORY[0x1E4F24D90];
  v19[1] = v10;
  v20[0] = &unk_1F3DC4710;
  v20[1] = &unk_1F3DC4728;
  CFDictionaryRef v11 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v17[0] = *MEMORY[0x1E4F24E10];
  v18[0] = [NSNumber numberWithDouble:a4];
  v17[1] = *MEMORY[0x1E4F24D08];
  uint64_t v12 = [NSNumber numberWithDouble:a5];
  uint64_t v13 = *MEMORY[0x1E4F24D70];
  v18[1] = v12;
  v18[2] = &unk_1F3DC4740;
  uint64_t v14 = *MEMORY[0x1E4F24D20];
  v17[2] = v13;
  v17[3] = v14;
  v18[3] = v9;
  CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  LODWORD(a3) = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, v15, a3);
  return (int)a3;
}

+ (int64_t)compareVideoAspectRatioSizeA:(CGSize)a3 toSizeB:(CGSize)a4
{
  double v4 = a3.width / a3.height;
  CGFloat v5 = a4.width / a4.height;
  double v6 = vabdd_f64(v4, a4.width / a4.height);
  int64_t v7 = -1;
  if (v4 >= v5) {
    int64_t v7 = 1;
  }
  if (v6 >= 0.05) {
    return v7;
  }
  else {
    return 0;
  }
}

+ (__CFString)typeIdentifierForImageType:(int)a3
{
  if (!a3) {
    return @"public.jpeg";
  }
  if (a3 == 1) {
    return @"public.heic";
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VideoUtil typeIdentifierForImageType:]();
    }
  }
  return 0;
}

+ (unsigned)videoCodecForPayload:(int)a3
{
  if (a3 == 123) {
    return 1635148593;
  }
  if (a3 == 100) {
    return 1752589105;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VideoUtil videoCodecForPayload:]();
  }
  return 0;
}

+ (CGSize)computeVisibleAspectRatioWithRemoteScreenAspectRatio:(CGSize)a3 remoteExpectedAspectRatio:(CGSize)a4 encodeWidth:(int)a5 encodeHeight:(int)a6
{
  double v6 = ComputeVisibleAspectRatioWithRemoteScreenAspectRatio(a5, a6, a3.width, a3.height, a4.width, a4.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

+ (CGSize)compute16AlignedResolutionForNativeWidth:(unsigned int)a3 nativeHeight:(unsigned int)a4 maxScreenPixelCount:(unint64_t)a5 maxScreenEncodingSizeSupported:(unint64_t)a6
{
  if (!a3)
  {
    double v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:]();
      }
    }
    goto LABEL_30;
  }
  if (!a4)
  {
    double v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:]();
      }
    }
    goto LABEL_30;
  }
  if (!a5)
  {
    double v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:]();
      }
    }
    goto LABEL_30;
  }
  if (!a6)
  {
    double v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.4();
      }
    }
    goto LABEL_30;
  }
  unint64_t v6 = a4 * a3;
  if (!v6)
  {
    double v9 = 0.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:].cold.5();
      }
    }
LABEL_30:
    double v10 = 0.0;
    goto LABEL_14;
  }
  if (v6 >= a6) {
    unint64_t v7 = a6;
  }
  else {
    unint64_t v7 = a4 * a3;
  }
  if (v7 >= a5) {
    unint64_t v7 = a5;
  }
  if (v7 >= v6)
  {
    double v9 = (double)((a3 + 15) & 0xFFFFFFF0);
    double v10 = (double)((a4 + 15) & 0xFFFFFFF0);
  }
  else
  {
    double v8 = (double)a3 / (double)a4;
    double v9 = (double)(((unint64_t)sqrt(v8 * (double)v7) + 15) & 0xFFFFFFF0);
    double v10 = (double)(((unint64_t)(v9 / v8) + 15) & 0xFFFFFFF0);
  }
LABEL_14:
  double v11 = v9;
  result.double height = v10;
  result.double width = v11;
  return result;
}

+ (CGSize)computeResolutionForMainDisplayWithMaxScreenPixelCount:(unint64_t)a3
{
  uint64_t v4 = +[VCHardwareSettings screenWidthForDisplayID:0];
  uint64_t v5 = +[VCHardwareSettings screenHeightForDisplayID:0];
  +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:](VideoUtil, "compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:", v4, v5, a3, +[VCHardwareSettings maxScreenEncodingSizeSupported]);
  if (v6 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:]();
      }
    }
    goto LABEL_12;
  }
  if (v7 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:]();
      }
    }
LABEL_12:
    double v8 = 0.0;
    double v9 = 0.0;
    goto LABEL_13;
  }

  double v8 = VideoUtil_ComputeScreenSizeClosestToNativeAspectRatio(0x10u, v6, v7, (double)v4, (double)v5);
LABEL_13:
  result.double height = v9;
  result.double width = v8;
  return result;
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create color space", v2, v3, v4, v5, v6);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CGDataProviderCreateWithData failed %d", v2, v3, v4, v5, v6);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d source image is NULL", v2, v3, v4, v5, v6);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create image with invalid type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.5()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create image with type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create destination image", v2, v3, v4, v5, v6);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.7()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTPixelTransferSessionTransferImage failed %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.8()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTPixelTransferSessionCreate failed %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
}

+ (void)convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:.cold.9()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CVPixelBufferCreate failed %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:]" >> 16, v4);
}

+ (void)sizeForVideoResolution:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil sizeForVideoResolution:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid resolution: %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil sizeForVideoResolution:]" >> 16, 1488);
}

+ (void)typeIdentifierForImageType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil typeIdentifierForImageType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid image type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil typeIdentifierForImageType:]" >> 16, v4);
}

+ (void)videoCodecForPayload:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VideoUtil videoCodecForPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported video payload type %d", v2, *(const char **)v3, (unint64_t)"+[VideoUtil videoCodecForPayload:]" >> 16, v4);
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Device width cannot be zero", v2, v3, v4, v5, v6);
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Device height cannot be zero", v2, v3, v4, v5, v6);
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Max screen pixel count cannot be zero", v2, v3, v4, v5, v6);
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d MaxScreenEncodingSizeSupported cannot be zero", v2, v3, v4, v5, v6);
}

+ (void)compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get native pixel count", v2, v3, v4, v5, v6);
}

+ (void)computeResolutionForMainDisplayWithMaxScreenPixelCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d scaled encoder resolution width cannot be zero", v2, v3, v4, v5, v6);
}

+ (void)computeResolutionForMainDisplayWithMaxScreenPixelCount:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d scaled encoder resolution height cannot be zero", v2, v3, v4, v5, v6);
}

@end