@interface CMIOExtensionSample
+ (BOOL)supportsSecureCoding;
+ (id)sampleWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)isEqual:(id)a3;
- (CMIOExtensionSample)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (CMIOExtensionSample)initWithCoder:(id)a3;
- (CMIOExtensionSample)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (id)description;
- (opaqueCMSampleBuffer)sampleBuffer;
- (unsigned)mediaType;
- (void)copyXPCDictionary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIOExtensionSample

+ (id)sampleWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCMSampleBuffer:a3];

  return v3;
}

- (CMIOExtensionSample)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionSample;
  v4 = [(CMIOExtensionSample *)&v9 init];
  if (v4)
  {
    if (a3)
    {
      v5 = (opaqueCMSampleBuffer *)CFRetain(a3);
      v4->_sampleBuffer = v5;
      FormatDescription = CMSampleBufferGetFormatDescription(v5);
      CMMediaType MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
    }
    else
    {
      CMMediaType MediaType = 0;
      v4->_sampleBuffer = 0;
    }
    v4->_mediaType = MediaType;
  }
  return v4;
}

- (void)dealloc
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer) {
    CFRelease(sampleBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionSample;
  [(CMIOExtensionSample *)&v4 dealloc];
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (id)description
{
  description = self->_description;
  if (!description)
  {
    sampleBuffer = self->_sampleBuffer;
    id v5 = [NSString alloc];
    if (sampleBuffer) {
      description = (NSString *)[v5 initWithFormat:@"<sample: %p, %c%c%c%c>", self->_sampleBuffer, HIBYTE(self->_mediaType), BYTE2(self->_mediaType), BYTE1(self->_mediaType), self->_mediaType];
    }
    else {
      description = (NSString *)objc_msgSend(v5, "initWithFormat:", @"<sample: NULL>", v8, v9, v10, v11, v12);
    }
    self->_description = description;
  }
  v6 = description;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  sampleBuffer = self->_sampleBuffer;
  return sampleBuffer == (opaqueCMSampleBuffer *)[a3 sampleBuffer];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[CMIOExtensionSample allocWithZone:a3];
  sampleBuffer = self->_sampleBuffer;

  return [(CMIOExtensionSample *)v4 initWithCMSampleBuffer:sampleBuffer];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ can only be encoded as part of an xpc message", self format];
  }
  id v5 = [(CMIOExtensionSample *)self copyXPCDictionary];
  if (v5)
  {
    v6 = v5;
    [a3 encodeXPCObject:v5 forKey:@"sampleBuffer"];
    xpc_release(v6);
  }
}

- (CMIOExtensionSample)initWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ can only be encoded as part of an xpc message", self format];
  }
  uint64_t v5 = [a3 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"sampleBuffer"];
  if (v5)
  {
    return [(CMIOExtensionSample *)self initWithXPCDictionary:v5];
  }
  else
  {
    return [(CMIOExtensionSample *)self initWithCMSampleBuffer:0];
  }
}

- (id)copyXPCDictionary
{
  if (!self->_sampleBuffer) {
    return 0;
  }
  dataPointerOut = 0;
  CMBlockBufferRef theBuffer = 0;
  size_t totalLengthOut = 0;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_sampleBuffer);
  uint64_t v5 = ImageBuffer;
  if (ImageBuffer)
  {
    CFTypeRef v6 = CVBufferCopyAttachment(ImageBuffer, @"MetadataDictionary", 0);
    if (v6)
    {
      v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFDictionaryGetTypeID() && !CMGetAttachment(self->_sampleBuffer, @"MetadataDictionary", 0)) {
        CMSetAttachment(self->_sampleBuffer, @"MetadataDictionary", v7, 1u);
      }
      CFRelease(v7);
    }
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer())
  {
    uint64_t v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionSample copyXPCDictionary].cold.4();
    }
  }
  else
  {
    int IsRangeContiguous = CMBlockBufferIsRangeContiguous(theBuffer, 0, 0);
    uint64_t v12 = theBuffer;
    if (!IsRangeContiguous)
    {
      CMBlockBufferRef v20 = 0;
      if (CMBlockBufferCreateContiguous(v9, theBuffer, v9, 0, 0, 0, 0, &v20))
      {
        v19 = CMIOLog();
        if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionSample copyXPCDictionary]();
        }
        goto LABEL_25;
      }
      if (theBuffer) {
        CFRelease(theBuffer);
      }
      uint64_t v12 = v20;
      CMBlockBufferRef theBuffer = v20;
    }
    if (CMBlockBufferGetDataPointer(v12, 0, 0, &totalLengthOut, &dataPointerOut))
    {
      v18 = CMIOLog();
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSample copyXPCDictionary]();
      }
    }
    else
    {
      xpc_object_t v13 = xpc_data_create(dataPointerOut, totalLengthOut);
      xpc_dictionary_set_value(v3, "buffer", v13);
      xpc_release(v13);
      if (v5)
      {
        IOSurface = CVPixelBufferGetIOSurface(v5);
        if (IOSurface)
        {
          xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
          xpc_dictionary_set_value(v3, "iosurface", XPCObject);
          xpc_release(XPCObject);
        }
        else
        {
          v16 = CMIOLog();
          if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionSample copyXPCDictionary]();
          }
        }
      }
    }
  }
LABEL_25:
  if (theBuffer) {
    CFRelease(theBuffer);
  }
  return v3;
}

- (CMIOExtensionSample)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    CMSampleBufferRef v36 = 0;
    CMBlockBufferRef blockBufferOut = 0;
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    CVPixelBufferRef pixelBufferOut = 0;
    xpc_object_t value = xpc_dictionary_get_value(a3, "buffer");
    if (!value)
    {
      uint64_t v12 = CMIOLog();
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSample initWithXPCDictionary:]();
      }
      goto LABEL_19;
    }
    CFTypeRef v6 = value;
    bytes_ptr = (void *)xpc_data_get_bytes_ptr(value);
    if (!bytes_ptr)
    {
      xpc_object_t v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSample initWithXPCDictionary:]();
      }
      goto LABEL_19;
    }
    CFTypeID v8 = bytes_ptr;
    size_t length = xpc_data_get_length(v6);
    HIDWORD(customBlockSource.AllocateBlock) = 0;
    *(void *)&customBlockSource.version = 0;
    customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))cmio_bbufUtilXPCObjectReleaser;
    customBlockSource.refCon = v6;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, length, 0, &customBlockSource, 0, length, 0, &blockBufferOut))
    {
      uint64_t v11 = CMIOLog();
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSample initWithXPCDictionary:].cold.9();
      }
    }
    else
    {
      xpc_retain(v6);
      int SampleBufferFromSerializedAtomDataBlockBuffer = FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer();
      CFRelease(blockBufferOut);
      CMBlockBufferRef blockBufferOut = 0;
      if (!SampleBufferFromSerializedAtomDataBlockBuffer)
      {
        CFTypeRef v18 = CMGetAttachment(v36, @"MetadataDictionary", 0);
        v19 = v18;
        if (v18)
        {
          CFTypeID v20 = CFGetTypeID(v18);
          if (v20 != CFDictionaryGetTypeID()) {
            v19 = 0;
          }
        }
        xpc_object_t v21 = xpc_dictionary_get_value(a3, "iosurface");
        if (v21)
        {
          v22 = IOSurfaceLookupFromXPCObject(v21);
          if (!v22)
          {
            v27 = CMIOLog();
            if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionSample initWithXPCDictionary:]();
            }
            goto LABEL_19;
          }
          v23 = v22;
          CVReturn v24 = CVPixelBufferCreateWithIOSurface(v10, v22, 0, &pixelBufferOut);
          CFRelease(v23);
          if (v24)
          {
            v25 = CMIOLog();
            if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionSample initWithXPCDictionary:].cold.7();
            }
            goto LABEL_19;
          }
          if (v19 && !CVBufferHasAttachment(pixelBufferOut, @"MetadataDictionary")) {
            CVBufferSetAttachment(pixelBufferOut, @"MetadataDictionary", v19, kCVAttachmentMode_ShouldPropagate);
          }
          if (CMVideoFormatDescriptionCreateForImageBuffer(v10, pixelBufferOut, &formatDescriptionOut))
          {
            v28 = CMIOLog();
            if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionSample initWithXPCDictionary:].cold.6();
            }
            goto LABEL_19;
          }
          memset(&timingArrayOut, 0, sizeof(timingArrayOut));
          if (CMSampleBufferGetSampleTimingInfoArray(v36, 1, &timingArrayOut, 0))
          {
            v29 = CMIOLog();
            if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionSample initWithXPCDictionary:].cold.5();
            }
            goto LABEL_19;
          }
          CMSampleBufferRef sampleBufferOut = 0;
          if (CMSampleBufferCreateForImageBuffer(v10, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, &timingArrayOut, &sampleBufferOut))
          {
            v30 = CMIOLog();
            if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionSample initWithXPCDictionary:].cold.4();
            }
            goto LABEL_19;
          }
          CFRelease(pixelBufferOut);
          CVPixelBufferRef pixelBufferOut = 0;
          CFRelease(formatDescriptionOut);
          CMVideoFormatDescriptionRef formatDescriptionOut = 0;
          CMPropagateAttachments(v36, sampleBufferOut);
          CFRelease(v36);
          CMSampleBufferRef v26 = sampleBufferOut;
          CMSampleBufferRef v36 = sampleBufferOut;
        }
        else
        {
          CMSampleBufferRef v26 = v36;
        }
        v16 = [(CMIOExtensionSample *)self initWithCMSampleBuffer:v26];
        CFRelease(v36);
        return v16;
      }
      v15 = CMIOLog();
      if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionSample initWithXPCDictionary:].cold.8();
      }
    }
LABEL_19:
    if (blockBufferOut) {
      CFRelease(blockBufferOut);
    }
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
    if (v36) {
      CFRelease(v36);
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }

    return 0;
  }

  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
  return 0;
}

- (void)copyXPCDictionary
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s xpcData == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s dataPointer == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s ioSurface == NULL == true ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.4()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.5()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.6()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.7()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.8()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.9()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

@end