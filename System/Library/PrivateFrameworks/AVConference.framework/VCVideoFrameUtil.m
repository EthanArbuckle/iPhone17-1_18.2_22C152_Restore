@interface VCVideoFrameUtil
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)CMTimeFromXPCDictionary:(SEL)a3;
+ (__CVBuffer)newCVPixelBufferFromXPCDictionary:(id)a3 isDepth:(BOOL)a4;
+ (id)newXPCDictionaryWithCVPixelBuffer:(__CVBuffer *)a3 depthPixelBuffer:(__CVBuffer *)a4 time:(id *)a5;
@end

@implementation VCVideoFrameUtil

+ (id)newXPCDictionaryWithCVPixelBuffer:(__CVBuffer *)a3 depthPixelBuffer:(__CVBuffer *)a4 time:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoFrameUtil newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:]();
      }
    }
    return 0;
  }
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoFrameUtil newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:]();
      }
    }
    return 0;
  }
  xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
  if (!XPCObject)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoFrameUtil newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:]();
      }
    }
    return 0;
  }
  v9 = XPCObject;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a5;
  CFDictionaryRef v11 = CMTimeCopyAsDictionary((CMTime *)&v17, v10);
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v13, "vcEffectsXPCIOSurface", v9);
  xpc_dictionary_set_value(v13, "vcEffectsXPCCMTime", v12);
  if (a4)
  {
    v14 = CVPixelBufferGetIOSurface(a4);
    xpc_object_t v15 = IOSurfaceCreateXPCObject(v14);
    xpc_dictionary_set_value(v13, "vcEffectsXPCDepthIOSurface", v15);
    xpc_release(v15);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    xpc_release(v12);
  }
  xpc_release(v9);
  return v13;
}

+ (__CVBuffer)newCVPixelBufferFromXPCDictionary:(id)a3 isDepth:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  if (a4) {
    v4 = "vcEffectsXPCDepthIOSurface";
  }
  else {
    v4 = "vcEffectsXPCIOSurface";
  }
  xpc_object_t value = xpc_dictionary_get_value(a3, v4);
  result = IOSurfaceLookupFromXPCObject(value);
  if (result)
  {
    v7 = result;
    CVReturn v8 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], result, 0, &pixelBufferOut);
    if (v8)
    {
      CVReturn v9 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        CFDictionaryRef v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v14 = v10;
          __int16 v15 = 2080;
          v16 = "+[VCVideoFrameUtil newCVPixelBufferFromXPCDictionary:isDepth:]";
          __int16 v17 = 1024;
          int v18 = 67;
          __int16 v19 = 1024;
          CVReturn v20 = v9;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Could not recreate pixel buffer from surface: %d", buf, 0x22u);
        }
      }
    }
    CFRelease(v7);
    return pixelBufferOut;
  }
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)CMTimeFromXPCDictionary:(SEL)a3
{
  xpc_dictionary_get_value(a4, "vcEffectsXPCCMTime");
  CFDictionaryRef v5 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
  memset(retstr, 170, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  CMTimeMakeFromDictionary((CMTime *)retstr, v5);

  CFRelease(v5);
  return result;
}

+ (void)newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d pixelBuffer is NULL", v2, v3, v4, v5, v6);
}

+ (void)newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CVPixelBufferGetIOSurface returned NULL", v2, v3, v4, v5, v6);
}

+ (void)newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d IOSurfaceCreateXPCObject returned NULL", v2, v3, v4, v5, v6);
}

@end