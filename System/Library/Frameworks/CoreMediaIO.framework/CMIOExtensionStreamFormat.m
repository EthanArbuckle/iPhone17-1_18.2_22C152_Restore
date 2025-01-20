@interface CMIOExtensionStreamFormat
+ (BOOL)supportsSecureCoding;
+ (CMIOExtensionStreamFormat)streamFormatWithFormatDescription:(CMFormatDescriptionRef)formatDescription maxFrameDuration:(CMTime *)maxFrameDuration minFrameDuration:(CMTime *)minFrameDuration validFrameDurations:(NSArray *)validFrameDurations;
+ (id)copyFormatsFromXPCArray:(id)a3;
+ (id)copyXPCArrayFromFormats:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CMFormatDescriptionRef)formatDescription;
- (CMIOExtensionStreamFormat)initWithCoder:(id)a3;
- (CMIOExtensionStreamFormat)initWithFormatDescription:(CMFormatDescriptionRef)formatDescription maxFrameDuration:(CMTime *)maxFrameDuration minFrameDuration:(CMTime *)minFrameDuration validFrameDurations:(NSArray *)validFrameDurations;
- (CMIOExtensionStreamFormat)initWithXPCDictionary:(id)a3;
- (CMTime)maxFrameDuration;
- (CMTime)minFrameDuration;
- (NSArray)validFrameDurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (id)description;
- (void)copyXPCDictionary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIOExtensionStreamFormat

+ (CMIOExtensionStreamFormat)streamFormatWithFormatDescription:(CMFormatDescriptionRef)formatDescription maxFrameDuration:(CMTime *)maxFrameDuration minFrameDuration:(CMTime *)minFrameDuration validFrameDurations:(NSArray *)validFrameDurations
{
  id v10 = objc_alloc((Class)objc_opt_class());
  CMTime v13 = *maxFrameDuration;
  CMTime v12 = *minFrameDuration;
  return (CMIOExtensionStreamFormat *)(id)[v10 initWithFormatDescription:formatDescription maxFrameDuration:&v13 minFrameDuration:&v12 validFrameDurations:validFrameDurations];
}

- (CMIOExtensionStreamFormat)initWithFormatDescription:(CMFormatDescriptionRef)formatDescription maxFrameDuration:(CMTime *)maxFrameDuration minFrameDuration:(CMTime *)minFrameDuration validFrameDurations:(NSArray *)validFrameDurations
{
  v22.receiver = self;
  v22.super_class = (Class)CMIOExtensionStreamFormat;
  id v10 = [(CMIOExtensionStreamFormat *)&v22 init];
  if (v10)
  {
    if (formatDescription)
    {
      *((void *)v10 + 2) = CFRetain(formatDescription);
      CMTimeEpoch epoch = minFrameDuration->epoch;
      *((_OWORD *)v10 + 2) = *(_OWORD *)&minFrameDuration->value;
      *((void *)v10 + 6) = epoch;
      long long v12 = *(_OWORD *)&maxFrameDuration->value;
      *((void *)v10 + 9) = maxFrameDuration->epoch;
      *(_OWORD *)(v10 + 56) = v12;
      *((void *)v10 + 3) = validFrameDurations;
      if ((v10[44] & 1) != 0 && *((void *)v10 + 4) && (v10[68] & 1) != 0 && *((void *)v10 + 7))
      {
        id v13 = [NSString alloc];
        uint64_t v14 = *((void *)v10 + 2);
        CMTime time = *(CMTime *)(v10 + 32);
        uint64_t v15 = (uint64_t)(CMTimeGetSeconds(&time) * 1000.0);
        CMTime time = *(CMTime *)(v10 + 56);
        uint64_t v16 = [v13 initWithFormat:@"<CMIOExtensionStreamFormat: format %@, min %ld ms, max %ld ms>", v14, v15, (uint64_t)(CMTimeGetSeconds(&time) * 1000.0)];
      }
      else
      {
        uint64_t v16 = [[NSString alloc] initWithFormat:@"<CMIOExtensionStreamFormat: format %@>", *((void *)v10 + 2), v19, v20];
      }
      *((void *)v10 + 1) = v16;
    }
    else
    {
      v17 = CMIOLog();
      if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionStreamFormat initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:]();
      }

      return 0;
    }
  }
  return (CMIOExtensionStreamFormat *)v10;
}

- (void)dealloc
{
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)CMIOExtensionStreamFormat;
  [(CMIOExtensionStreamFormat *)&v4 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      LOBYTE(v7) = 0;
      return v7;
    }
    int v7 = CMFormatDescriptionEqual(self->_formatDescription, (CMFormatDescriptionRef)[a3 formatDescription]);
    if (v7)
    {
      if (a3) {
        [a3 minFrameDuration];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      CMTime time1 = (CMTime)self->_minFrameDuration;
      if (CMTimeCompare(&time1, &time2)) {
        goto LABEL_13;
      }
      if (a3) {
        [a3 maxFrameDuration];
      }
      else {
        memset(&v10, 0, sizeof(v10));
      }
      CMTime time1 = (CMTime)self->_maxFrameDuration;
      if (CMTimeCompare(&time1, &v10)) {
        goto LABEL_13;
      }
      validFrameDurations = self->_validFrameDurations;
      if (validFrameDurations == (NSArray *)[a3 validFrameDurations]) {
        LOBYTE(v7) = 1;
      }
      else {
        LOBYTE(v7) = -[NSArray isEqual:](self->_validFrameDurations, "isEqual:", [a3 validFrameDurations]);
      }
    }
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CMIOExtensionStreamFormat allocWithZone:a3];
  formatDescription = self->_formatDescription;
  validFrameDurations = self->_validFrameDurations;
  $95D729B680665BEAEFA1D6FCA8238556 maxFrameDuration = self->_maxFrameDuration;
  $95D729B680665BEAEFA1D6FCA8238556 minFrameDuration = self->_minFrameDuration;
  return [(CMIOExtensionStreamFormat *)v4 initWithFormatDescription:formatDescription maxFrameDuration:&maxFrameDuration minFrameDuration:&minFrameDuration validFrameDurations:validFrameDurations];
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
  id v5 = [(CMIOExtensionStreamFormat *)self copyXPCDictionary];
  if (v5)
  {
    v6 = v5;
    [a3 encodeXPCObject:v5 forKey:@"streamFormat"];
    xpc_release(v6);
  }
  else
  {
    int v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionStreamFormat encodeWithCoder:]();
    }
  }
}

- (CMIOExtensionStreamFormat)initWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ can only be encoded as part of an xpc message", self format];
  }
  uint64_t v5 = [a3 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"streamFormat"];
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ nil xpc object", self format];
  }

  return [(CMIOExtensionStreamFormat *)self initWithXPCDictionary:v5];
}

- (id)copyXPCDictionary
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (CMFormatDescriptionGetMediaType(self->_formatDescription) == 1836415096)
  {
    int64_t MediaSubType = CMFormatDescriptionGetMediaSubType(self->_formatDescription);
    CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(self->_formatDescription);
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "muxtype", MediaSubType);
    if (Extensions)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x263F00EA8]);
      if (Value)
      {
        int v26 = 0;
        long long v25 = 0u;
        long long v24 = 0u;
        long long v23 = 0u;
        long long v22 = 0u;
        long long v21 = 0u;
        long long v20 = 0u;
        long long v19 = 0u;
        long long v18 = 0u;
        long long v17 = 0u;
        long long v16 = 0u;
        long long v15 = 0u;
        long long v14 = 0u;
        int v13 = 1061109567;
        CFStringGetCString(Value, (char *)&v13, 200, 0x8000100u);
        xpc_dictionary_set_string(v6, "vendor", (const char *)&v13);
      }
      CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x263F00E60]);
      if (v8)
      {
        int v26 = 0;
        long long v25 = 0u;
        long long v24 = 0u;
        long long v23 = 0u;
        long long v22 = 0u;
        long long v21 = 0u;
        long long v20 = 0u;
        long long v19 = 0u;
        long long v18 = 0u;
        long long v17 = 0u;
        long long v16 = 0u;
        long long v15 = 0u;
        long long v14 = 0u;
        int v13 = 1061109567;
        CFStringGetCString(v8, (char *)&v13, 200, 0x8000100u);
        xpc_dictionary_set_string(v6, "name", (const char *)&v13);
      }
    }
    xpc_dictionary_set_value(v3, "muxFormatDescription", v6);
    xpc_release(v6);
  }
  else if (FigXPCMessageSetFormatDescription())
  {
    v9 = CMIOLog();
    if (v9)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionStreamFormat copyXPCDictionary]();
      }
    }
  }
  xpc_dictionary_set_data(v3, "minFrameDuration", &self->_minFrameDuration, 0x18uLL);
  xpc_dictionary_set_data(v3, "maxFrameDuration", &self->_maxFrameDuration, 0x18uLL);
  validFrameDurations = self->_validFrameDurations;
  if (validFrameDurations)
  {
    if (cmio_XPCMessageSetCFArray(v3, "validFrameDurations", validFrameDurations))
    {
      v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionStreamFormat copyXPCDictionary]();
        }
      }
    }
  }
  return v3;
}

- (CMIOExtensionStreamFormat)initWithXPCDictionary:(id)a3
{
  if (!a3)
  {

    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    v11 = @"nil xpc dictionary";
LABEL_16:
    [v9 raise:v10 format:v11];
    return 0;
  }
  CMMuxedFormatDescriptionRef formatDescriptionOut = 0;
  long long v33 = *MEMORY[0x263F01090];
  uint64_t v34 = *(void *)(MEMORY[0x263F01090] + 16);
  long long v31 = v33;
  uint64_t v32 = v34;
  size_t length = 24;
  CFTypeRef cf = 0;
  data = xpc_dictionary_get_data(a3, "minFrameDuration", &length);
  if (data)
  {
    long long v33 = *(_OWORD *)data;
    uint64_t v34 = data[2];
  }
  xpc_object_t v6 = xpc_dictionary_get_data(a3, "maxFrameDuration", &length);
  if (v6)
  {
    long long v31 = *(_OWORD *)v6;
    uint64_t v32 = v6[2];
  }
  if (cmio_XPCMessageCopyCFArray(a3, "validFrameDurations", (NSObject **)&cf))
  {
    int v7 = CMIOLog();
    if (v7)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionStreamFormat initWithXPCDictionary:]();
      }
    }
  }
  if (FigXPCMessageCopyFormatDescription())
  {
    CFStringRef v8 = CMIOLog();
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionStreamFormat initWithXPCDictionary:]();
    }

    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    v11 = @"nil formatDescription";
    goto LABEL_16;
  }
  xpc_object_t value = xpc_dictionary_get_value(a3, "muxFormatDescription");
  if (value)
  {
    long long v15 = value;
    CMMuxedStreamType int64 = xpc_dictionary_get_int64(value, "muxtype");
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    string = xpc_dictionary_get_string(v15, "vendor");
    if (string) {
      long long v20 = string;
    }
    else {
      long long v20 = "?";
    }
    CFStringRef v21 = CFStringCreateWithCString(v17, v20, 0x8000100u);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F00EA8], v21);
    CFRelease(v21);
    long long v22 = xpc_dictionary_get_string(v15, "name");
    if (v22) {
      long long v23 = v22;
    }
    else {
      long long v23 = "?";
    }
    CFStringRef v24 = CFStringCreateWithCString(v17, v23, 0x8000100u);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F00E60], v24);
    CFRelease(v24);
    CMMuxedFormatDescriptionCreate(v17, int64, Mutable, &formatDescriptionOut);
    CFRelease(Mutable);
  }
  long long v27 = v31;
  uint64_t v28 = v32;
  long long v25 = v33;
  uint64_t v26 = v34;
  long long v12 = [(CMIOExtensionStreamFormat *)self initWithFormatDescription:formatDescriptionOut maxFrameDuration:&v27 minFrameDuration:&v25 validFrameDurations:cf];
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v12;
}

+ (id)copyXPCArrayFromFormats:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v12 = CMIOLog();
          if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            +[CMIOExtensionStreamFormat copyXPCArrayFromFormats:]();
          }
          return v4;
        }
        uint64_t v10 = (void *)[v9 copyXPCDictionary];
        if (!v10)
        {
          int v13 = CMIOLog();
          if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            +[CMIOExtensionStreamFormat copyXPCArrayFromFormats:]();
          }
          return v4;
        }
        v11 = v10;
        xpc_array_append_value(v4, v10);
        xpc_release(v11);
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v4;
}

+ (id)copyFormatsFromXPCArray:(id)a3
{
  if (!a3)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc array"];
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke;
  applier[3] = &unk_26517C5C0;
  applier[4] = v4;
  if (!xpc_array_apply(a3, applier))
  {

    return 0;
  }
  return v4;
}

BOOL __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [[CMIOExtensionStreamFormat alloc] initWithXPCDictionary:a3];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    uint64_t v5 = CMIOLog();
    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke_cold_1();
    }
  }
  return v4 != 0;
}

- (CMFormatDescriptionRef)formatDescription
{
  return (CMFormatDescriptionRef)objc_getProperty(self, a2, 16, 1);
}

- (CMTime)minFrameDuration
{
  objc_copyStruct(retstr, &self->_minFrameDuration, 24, 1, 0);
  return result;
}

- (CMTime)maxFrameDuration
{
  objc_copyStruct(retstr, &self->_maxFrameDuration, 24, 1, 0);
  return result;
}

- (NSArray)validFrameDurations
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid format description", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
}

- (void)copyXPCDictionary
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, FigXPCMessageSetFormatDescription", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, FigXPCMessageCopyFormatDescription", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray", v2, v3, v4, v5, v6);
}

+ (void)copyXPCArrayFromFormats:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s could not create xpc object", v2, v3, v4, v5, v6);
}

+ (void)copyXPCArrayFromFormats:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Invalid format type", v2, v3, v4, v5, v6);
}

void __53__CMIOExtensionStreamFormat_copyFormatsFromXPCArray___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s could not create object for index %d", v2, v3, v4, v5, v6);
}

@end