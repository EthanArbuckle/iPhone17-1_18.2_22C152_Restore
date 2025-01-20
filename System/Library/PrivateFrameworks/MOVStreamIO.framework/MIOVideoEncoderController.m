@interface MIOVideoEncoderController
- (BOOL)closeEncoderError:(id *)a3;
- (BOOL)closed;
- (BOOL)encodeFrame:(__CVBuffer *)a3 pts:(id *)a4 properties:(__CFDictionary *)a5 context:(void *)a6 error:(id *)a7;
- (BOOL)frameReorderingEnabled;
- (BOOL)openEncoderWithContext:(id)a3 error:(id *)a4;
- (MIOVideoEncoderController)initWithEncoderConfig:(id)a3 formtDescription:(opaqueCMFormatDescription *)a4 inProcessEncoding:(BOOL)a5 frameRate:(double)a6 aveHighPerfMode:(BOOL)a7 outputCallback:(void *)a8 delegate:(id)a9;
- (id)encoderSpecification;
- (int)applyDefaultSessionProperties;
- (int)enableAVEHighPerformanceProfile;
- (int)propagateColorAttachments;
- (unsigned)codecType;
- (void)dealloc;
@end

@implementation MIOVideoEncoderController

- (MIOVideoEncoderController)initWithEncoderConfig:(id)a3 formtDescription:(opaqueCMFormatDescription *)a4 inProcessEncoding:(BOOL)a5 frameRate:(double)a6 aveHighPerfMode:(BOOL)a7 outputCallback:(void *)a8 delegate:(id)a9
{
  id v17 = a3;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MIOVideoEncoderController;
  v19 = [(MIOVideoEncoderController *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_delegate, v18);
    v20->_enableInProcessEncoding = a5;
    v20->_frameRate = a6;
    v20->_aveHighPerfMode = a7;
    objc_storeStrong((id *)&v20->_config, a3);
    v20->_formatDesc = a4;
    CFRetain(a4);
    v20->_callbackFunc = a8;
  }

  return v20;
}

- (void)dealloc
{
  formatDesc = self->_formatDesc;
  if (formatDesc) {
    CFRelease(formatDesc);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIOVideoEncoderController;
  [(MIOVideoEncoderController *)&v4 dealloc];
}

- (unsigned)codecType
{
  config = self->_config;
  if (config)
  {
    return [(MOVStreamEncoderConfig *)config codecType];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v6 = [WeakRetained codecTypeOverride];

    if (v6) {
      return v6;
    }
    else {
      return 1752589105;
    }
  }
}

- (id)encoderSpecification
{
  v8[2] = *MEMORY[0x263EF8340];
  if (self->_config)
  {
    uint64_t v2 = [(MOVStreamEncoderConfig *)self->_config encoderSpecification];
LABEL_3:
    v3 = (void *)v2;
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained overrideVideoEncoderSpecification];

  if (!v3)
  {
    uint64_t v6 = *MEMORY[0x263F1ED58];
    v7[0] = *MEMORY[0x263F1ED50];
    v7[1] = v6;
    v8[0] = MEMORY[0x263EFFA88];
    v8[1] = MEMORY[0x263EFFA88];
    uint64_t v2 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    goto LABEL_3;
  }
LABEL_5:

  return v3;
}

- (int)applyDefaultSessionProperties
{
  int result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E640], &unk_26CB7D4B0);
  if (!result)
  {
    int result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E4C8], (CFTypeRef)*MEMORY[0x263EFFB38]);
    if (!result)
    {
      int result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E548], (CFTypeRef)[NSNumber numberWithDouble:self->_frameRate]);
      if (!result)
      {
        int result = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E650], (CFTypeRef)*MEMORY[0x263EFFB40]);
        if (!result)
        {
          FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(self->_formatDesc);
          v5 = @"HEVC_Monochrome10_AutoLevel";
          if (MediaSubType != 1278226742 && MediaSubType != 1278226736)
          {
            if (MediaSubType == 1278226488) {
              v5 = @"HEVC_Monochrome_AutoLevel";
            }
            else {
              v5 = @"HEVC_Main_AutoLevel";
            }
          }
          compressionSession = self->_compressionSession;
          CFStringRef v7 = (const __CFString *)*MEMORY[0x263F1E638];
          return VTSessionSetProperty(compressionSession, v7, v5);
        }
      }
    }
  }
  return result;
}

- (BOOL)openEncoderWithContext:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(self->_formatDesc);
  int32_t v8 = Dimensions;
  unint64_t v9 = HIDWORD(Dimensions);
  CFDictionaryRef v10 = [(MIOVideoEncoderController *)self encoderSpecification];
  CMVideoCodecType v11 = [(MIOVideoEncoderController *)self codecType];
  if (self->_enableInProcessEncoding)
  {
    v12 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_INFO, "VTCompressionSession: Enabling kVTCompressionSessionOption_AllowClientProcessEncode", buf, 2u);
    }

    uint64_t v33 = *MEMORY[0x263F1E6C0];
    v34[0] = MEMORY[0x263EFFA88];
    v28 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    p_compressionSession = &self->_compressionSession;
    outputCallbackRefCon = v6;
    uint64_t v13 = VTCompressionSessionCreateWithOptions();

    if (self->_enableInProcessEncoding)
    {
      if (v13) {
        goto LABEL_6;
      }
LABEL_9:
      config = self->_config;
      if (config)
      {
        if (![(MOVStreamEncoderConfig *)config applySessionProperties:self->_compressionSession])
        {
          v14 = [NSString stringWithFormat:@"Error VTCompressionSession set properties failed."];
          if (a4) {
            goto LABEL_7;
          }
          v16 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v14;
LABEL_16:
            _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v20 = [WeakRetained configureSessionOverride:self->_compressionSession];

        if ((v20 & 1) == 0)
        {
          uint64_t v21 = [(MIOVideoEncoderController *)self applyDefaultSessionProperties];
          if (v21)
          {
            v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error applying default settings errNo: %d", v21);
            if (a4) {
              goto LABEL_7;
            }
            v16 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v14;
              goto LABEL_16;
            }
            goto LABEL_17;
          }
        }
      }
      CFTypeRef propertyValueOut = (CFTypeRef)*MEMORY[0x263EFFB38];
      if (VTSessionCopyProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E4C8], (CFAllocatorRef)*MEMORY[0x263EFFB08], &propertyValueOut))
      {
        id v22 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"Cannot check AllowFrameReordering status of encoding session. Assuming disabled." code:0];
      }
      else
      {
        self->_BOOL frameReorderingEnabled = propertyValueOut == (CFTypeRef)*MEMORY[0x263EFFB40];
        if (+[MIOLog debugEnabled])
        {
          v23 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            BOOL frameReorderingEnabled = self->_frameReorderingEnabled;
            *(_DWORD *)buf = 67109120;
            LODWORD(v32) = frameReorderingEnabled;
            _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_DEBUG, "AllowFrameReordering: %d", buf, 8u);
          }
        }
        CFRelease(propertyValueOut);
      }
      uint64_t v25 = [(MIOVideoEncoderController *)self propagateColorAttachments];
      if (v25)
      {
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error propagateColorAttachments errNo: %d", v25);
        if (a4) {
          goto LABEL_7;
        }
        v16 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          goto LABEL_16;
        }
      }
      else
      {
        if (!self->_aveHighPerfMode)
        {
          BOOL v17 = 1;
          goto LABEL_19;
        }
        uint64_t v26 = [(MIOVideoEncoderController *)self enableAVEHighPerformanceProfile];
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error enabling AVE High Performance Mode errNo: %d", v26);
        if (a4) {
          goto LABEL_7;
        }
        v16 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v14;
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
  }
  uint64_t v13 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, v9, v11, v10, 0, 0, (VTCompressionOutputCallback)self->_callbackFunc, v6, &self->_compressionSession);
  if (!v13) {
    goto LABEL_9;
  }
LABEL_6:
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error VTCompressionSessionCreate errNo: %d", v13, v28, p_compressionSession);
  if (!a4)
  {
    v16 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v14;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x263F087E8], "internalErrorWithMessage:code:", v14, 14, outputCallbackRefCon);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  BOOL v17 = 0;
LABEL_19:

  return v17;
}

- (int)enableAVEHighPerformanceProfile
{
  v3 = (const void *)*MEMORY[0x263EFFB38];
  OSStatus v4 = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E650], (CFTypeRef)*MEMORY[0x263EFFB38]);
  if (v4)
  {
    OSStatus v5 = v4;
    id v6 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      CFStringRef v7 = "Setting kVTCompressionPropertyKey_RealTime failed.";
      int32_t v8 = (uint8_t *)&v13;
LABEL_10:
      _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  OSStatus v9 = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E5D0], v3);
  if (v9)
  {
    OSStatus v5 = v9;
    id v6 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = 0;
      CFStringRef v7 = "Setting kVTCompressionPropertyKey_MaximizePowerEfficiency failed.";
      int32_t v8 = (uint8_t *)&v12;
      goto LABEL_10;
    }
LABEL_11:

    return v5;
  }
  OSStatus v5 = VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E4C8], v3);
  if (v5)
  {
    id v6 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = 0;
      CFStringRef v7 = "Setting kVTCompressionPropertyKey_AllowFrameReordering failed.";
      int32_t v8 = (uint8_t *)&v11;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  return v5;
}

- (int)propagateColorAttachments
{
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(self->_formatDesc);
  if (Extensions)
  {
    CFDictionaryRef v4 = Extensions;
    Value = CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x263F04020]);
    if (Value) {
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E6A8], Value);
    }
    id v6 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F03ED8]);
    if (v6) {
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E508], v6);
    }
    CFStringRef v7 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F03FC0]);
    if (v7)
    {
      int32_t v8 = v7;
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E670], v7);
      if (CFEqual(v8, (CFTypeRef)*MEMORY[0x263F04008]))
      {
        OSStatus v9 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F03F48]);
        if (v9) {
          VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E568], v9);
        }
      }
    }
    CFDictionaryRef v10 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F00E70]);
    if (v10) {
      VTSessionSetProperty(self->_compressionSession, (CFStringRef)*MEMORY[0x263F1E580], v10);
    }
  }
  return 0;
}

- (BOOL)encodeFrame:(__CVBuffer *)a3 pts:(id *)a4 properties:(__CFDictionary *)a5 context:(void *)a6 error:(id *)a7
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  VTEncodeInfoFlags infoFlagsOut = 0;
  compressionSession = self->_compressionSession;
  CMTime presentationTimeStamp = *(CMTime *)a4;
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
  uint64_t v9 = VTCompressionSessionEncodeFrame(compressionSession, a3, &presentationTimeStamp, &duration, a5, a6, &infoFlagsOut);
  if (v9)
  {
    CFDictionaryRef v10 = objc_msgSend(NSString, "stringWithFormat:", @"Error VTCompressionSessionEncodeFrame errNo: %d infoFlags: %d", v9, infoFlagsOut);
    if (a7)
    {
      *a7 = [MEMORY[0x263F087E8] internalErrorWithMessage:v10 code:14];
    }
    else
    {
      __int16 v11 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LODWORD(presentationTimeStamp.value) = 138412290;
        *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = (CMTimeValue)v10;
        _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&presentationTimeStamp, 0xCu);
      }
    }
  }
  return v9 == 0;
}

- (BOOL)closeEncoderError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    CMTime completeUntilPresentationTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    uint64_t v6 = VTCompressionSessionCompleteFrames(compressionSession, &completeUntilPresentationTimeStamp);
    if (!v6)
    {
      CFRelease(self->_compressionSession);
      self->_compressionSession = 0;
      BOOL result = 1;
      self->_closed = 1;
      return result;
    }
    CFStringRef v7 = objc_msgSend(NSString, "stringWithFormat:", @"Error VTCompressionSessionCompleteFrames errNo: %d", v6);
    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] internalErrorWithMessage:v7 code:14];
    }
    else
    {
      CFDictionaryRef v10 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(completeUntilPresentationTimeStamp.value) = 138412290;
        *(CMTimeValue *)((char *)&completeUntilPresentationTimeStamp.value + 4) = (CMTimeValue)v7;
        _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&completeUntilPresentationTimeStamp, 0xCu);
      }
    }
  }
  else
  {
    if (a3)
    {
      id v8 = [MEMORY[0x263F087E8] internalErrorWithMessage:@"Error closeEncoder: no VTCompressionSession" code:14];
      BOOL result = 0;
      *a3 = v8;
      return result;
    }
    __int16 v11 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(completeUntilPresentationTimeStamp.value) = 138412290;
      *(CMTimeValue *)((char *)&completeUntilPresentationTimeStamp.value + 4) = (CMTimeValue)@"Error closeEncoder: no VTCompressionSession";
      _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&completeUntilPresentationTimeStamp, 0xCu);
    }
  }
  return 0;
}

- (BOOL)frameReorderingEnabled
{
  return self->_frameReorderingEnabled;
}

- (BOOL)closed
{
  return self->_closed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_config, 0);
}

@end