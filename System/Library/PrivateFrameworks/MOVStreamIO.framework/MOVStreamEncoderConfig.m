@interface MOVStreamEncoderConfig
+ (BOOL)isEncoderAvailableOfType:(unsigned int)a3 withId:(id)a4;
+ (BOOL)isProResCodec:(unsigned int)a3;
+ (id)encoderIdsForType:(unsigned int)a3;
+ (id)monochrome10BitEncoderConfigUsingAVEWithBitrate:(unint64_t)a3;
+ (id)monochrome10BitEncoderConfigUsingAVEWithQuality:(double)a3;
+ (id)supportedProfileLevelsForHEVC;
- (BOOL)applySessionProperties:(OpaqueVTCompressionSession *)a3;
- (BOOL)writeToFile:(id)a3 error:(id *)a4;
- (MOVStreamEncoderConfig)initWithCodecType:(unsigned int)a3 encoderSpecification:(id)a4 sessionProperties:(id)a5;
- (MOVStreamEncoderConfig)initWithContentsOfFile:(id)a3 error:(id *)a4;
- (MOVStreamEncoderConfig)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)encoderSpecification;
- (NSDictionary)sessionProperties;
- (unsigned)codecType;
- (void)enableAVEHighPerformanceProfile;
- (void)setCodecType:(unsigned int)a3;
- (void)setEncoderSpecification:(id)a3;
- (void)setSessionProperties:(id)a3;
@end

@implementation MOVStreamEncoderConfig

+ (BOOL)isProResCodec:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 <= 1634755431)
  {
    if (a3 == 1634743400) {
      return result;
    }
    unsigned __int16 v4 = 13432;
    goto LABEL_8;
  }
  if ((a3 - 1634755432 > 0xB || ((1 << (a3 - 104)) & 0x8C1) == 0) && a3 != 1634759272)
  {
    unsigned __int16 v4 = 29294;
LABEL_8:
    if (a3 != (v4 | 0x61700000)) {
      return 0;
    }
  }
  return result;
}

+ (BOOL)isEncoderAvailableOfType:(unsigned int)a3 withId:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v7 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F1ED40], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F1ED48], v7);
  CFArrayRef listOfVideoEncodersOut = 0;
  uint64_t v8 = VTCopyVideoEncoderList(Mutable, &listOfVideoEncodersOut);
  CFRelease(Mutable);
  if (v8)
  {
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"⛔️⛔️⛔️ ERROR: Cannot get encoder list. Error:'%d'. ⛔️⛔️⛔️", v8);
    v20 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v19;
      _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    id v21 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v19 userInfo:0];
    objc_exception_throw(v21);
  }
  CFIndex Count = CFArrayGetCount(listOfVideoEncodersOut);
  if (Count < 1)
  {
    BOOL v13 = 0;
LABEL_12:
    CFArrayRef v17 = listOfVideoEncodersOut;
    if (listOfVideoEncodersOut) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  CFIndex v10 = 0;
  v11 = (const void *)*MEMORY[0x263F1ED30];
  v12 = (const void *)*MEMORY[0x263F1ED38];
  BOOL v13 = 1;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(listOfVideoEncodersOut, v10);
    CFTypeID v15 = CFGetTypeID(ValueAtIndex);
    if (v15 != CFDictionaryGetTypeID()
      || objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11), "intValue") != a3)
    {
      goto LABEL_9;
    }
    if (!v5) {
      break;
    }
    v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v12);
    if ([v16 isEqualToString:v5])
    {
      if (listOfVideoEncodersOut) {
        CFRelease(listOfVideoEncodersOut);
      }

      goto LABEL_14;
    }

LABEL_9:
    BOOL v13 = ++v10 < Count;
    if (Count == v10) {
      goto LABEL_12;
    }
  }
  CFArrayRef v17 = listOfVideoEncodersOut;
  if (!listOfVideoEncodersOut) {
    goto LABEL_14;
  }
LABEL_13:
  CFRelease(v17);
LABEL_14:

  return v13;
}

+ (id)encoderIdsForType:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  id v5 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F1ED40], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F1ED48], v5);
  CFArrayRef listOfVideoEncodersOut = 0;
  uint64_t v6 = VTCopyVideoEncoderList(Mutable, &listOfVideoEncodersOut);
  if (v6)
  {
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"⛔️⛔️⛔️ ERROR: Cannot get encoder list. Error:'%d'. ⛔️⛔️⛔️", v6);
    CFArrayRef v17 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v16;
      _os_log_impl(&dword_21B5ED000, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v16 userInfo:0];
    objc_exception_throw(v18);
  }
  CFIndex Count = CFArrayGetCount(listOfVideoEncodersOut);
  uint64_t v8 = objc_opt_new();
  if (Count >= 1)
  {
    CFIndex v9 = 0;
    CFIndex v10 = (const void *)*MEMORY[0x263F1ED30];
    v11 = (const void *)*MEMORY[0x263F1ED38];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(listOfVideoEncodersOut, v9);
      CFTypeID v13 = CFGetTypeID(ValueAtIndex);
      if (v13 == CFDictionaryGetTypeID()
        && objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v10), "intValue") == a3)
      {
        v14 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11);
        [v8 addObject:v14];
      }
      ++v9;
    }
    while (Count != v9);
  }

  return v8;
}

+ (id)monochrome10BitEncoderConfigUsingAVEWithQuality:(double)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  unsigned __int16 v4 = +[MOVStreamIOUtility AVEProfileLevel10BitMonochrome];
  id v5 = [MOVStreamEncoderConfig alloc];
  uint64_t v18 = *MEMORY[0x263F1ED58];
  uint64_t v6 = MEMORY[0x263EFFA88];
  v19[0] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v8 = *MEMORY[0x263F1E4C8];
  v16[0] = *MEMORY[0x263F1E638];
  v16[1] = v8;
  v17[0] = v4;
  v17[1] = MEMORY[0x263EFFA80];
  uint64_t v9 = *MEMORY[0x263F1E650];
  v17[2] = v6;
  uint64_t v10 = *MEMORY[0x263F1E640];
  v16[2] = v9;
  v16[3] = v10;
  v11 = NSNumber;
  +[MOVStreamIOUtility clampedQuality:a3];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v17[3] = v12;
  CFTypeID v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  v14 = [(MOVStreamEncoderConfig *)v5 initWithCodecType:1752589105 encoderSpecification:v7 sessionProperties:v13];

  return v14;
}

+ (id)monochrome10BitEncoderConfigUsingAVEWithBitrate:(unint64_t)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  unsigned __int16 v4 = +[MOVStreamIOUtility AVEProfileLevel10BitMonochrome];
  id v5 = [MOVStreamEncoderConfig alloc];
  uint64_t v16 = *MEMORY[0x263F1ED58];
  uint64_t v6 = MEMORY[0x263EFFA88];
  v17[0] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v8 = *MEMORY[0x263F1E4C8];
  v14[0] = *MEMORY[0x263F1E638];
  v14[1] = v8;
  v15[0] = v4;
  v15[1] = MEMORY[0x263EFFA80];
  v15[2] = v6;
  uint64_t v9 = *MEMORY[0x263F1E4E8];
  v14[2] = *MEMORY[0x263F1E650];
  v14[3] = v9;
  uint64_t v10 = [NSNumber numberWithUnsignedLong:a3];
  v15[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v12 = [(MOVStreamEncoderConfig *)v5 initWithCodecType:1752589105 encoderSpecification:v7 sessionProperties:v11];

  return v12;
}

+ (id)supportedProfileLevelsForHEVC
{
  VTSessionRef session = 0;
  uint64_t v2 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 640, 480, 0x68766331u, MEMORY[0x263EFFA78], 0, 0, 0, 0, (VTCompressionSessionRef *)&session);
  if (v2)
  {
    NSLog(&cfstr_AssertDSFSLD.isa, v2, "VTCompressionSessionCreate failed\n", "/Library/Caches/com.apple.xbs/Sources/MOVStreamIO/MOVStreamIO/VTEncoder/MOVStreamEncoderConfig.mm", 421);
    v3 = 0;
  }
  else
  {
    CFDictionaryRef supportedPropertyDictionaryOut = 0;
    VTSessionCopySupportedPropertyDictionary(session, &supportedPropertyDictionaryOut);
    unsigned __int16 v4 = [(__CFDictionary *)supportedPropertyDictionaryOut objectForKey:@"ProfileLevel"];
    v3 = [v4 objectForKey:@"SupportedValueList"];

    if (supportedPropertyDictionaryOut) {
      CFRelease(supportedPropertyDictionaryOut);
    }
    VTCompressionSessionInvalidate((VTCompressionSessionRef)session);
    CFRelease(session);
  }

  return v3;
}

- (MOVStreamEncoderConfig)initWithCodecType:(unsigned int)a3 encoderSpecification:(id)a4 sessionProperties:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOVStreamEncoderConfig;
  uint64_t v10 = [(MOVStreamEncoderConfig *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_codecType = a3;
    uint64_t v12 = [v8 copy];
    encoderSpecification = v11->_encoderSpecification;
    v11->_encoderSpecification = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    sessionProperties = v11->_sessionProperties;
    v11->_sessionProperties = (NSDictionary *)v14;
  }
  return v11;
}

- (MOVStreamEncoderConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOVStreamEncoderConfig;
  id v5 = [(MOVStreamEncoderConfig *)&v17 init];
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"codecType"];
    v5->_codecType = [v6 unsignedIntValue];

    v7 = [v4 objectForKey:@"encoderSpecification"];
    uint64_t v8 = [v7 copy];
    encoderSpecification = v5->_encoderSpecification;
    v5->_encoderSpecification = (NSDictionary *)v8;

    uint64_t v10 = [v4 objectForKey:@"sessionProperties"];
    uint64_t v11 = [v10 copy];
    sessionProperties = v5->_sessionProperties;
    v5->_sessionProperties = (NSDictionary *)v11;

LABEL_4:
    CFTypeID v13 = v5;
    goto LABEL_8;
  }
  uint64_t v14 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot read config from nil dictionary", v16, 2u);
  }

  CFTypeID v13 = 0;
LABEL_8:

  return v13;
}

- (MOVStreamEncoderConfig)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:a4];
    if (v8)
    {
      self = [(MOVStreamEncoderConfig *)self initWithDictionary:v8];
      id v9 = self;
    }
    else
    {
      CFTypeID v13 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = *a4;
        *(_DWORD *)buf = 138543362;
        id v17 = v14;
        _os_log_impl(&dword_21B5ED000, v13, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Cannot read config from file '%{public}@'. ⛔️⛔️⛔️", buf, 0xCu);
      }

      id v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"Cannot read config from file '%@'.", v6];
    uint64_t v11 = [MEMORY[0x263F087E8] streamErrorWithMessage:v10 code:24];
    uint64_t v12 = v11;
    if (a4) {
      *a4 = v11;
    }

    id v9 = 0;
  }

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"codecType";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MOVStreamEncoderConfig codecType](self, "codecType"));
  v9[0] = v3;
  v8[1] = @"encoderSpecification";
  id v4 = [(MOVStreamEncoderConfig *)self encoderSpecification];
  v9[1] = v4;
  v8[2] = @"sessionProperties";
  id v5 = [(MOVStreamEncoderConfig *)self sessionProperties];
  v9[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F08AC0];
  uint64_t v8 = [(MOVStreamEncoderConfig *)self dictionaryRepresentation];
  id v9 = [v7 dataWithPropertyList:v8 format:100 options:0 error:a4];

  if (a4 && *a4)
  {
    uint64_t v10 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = *a4;
      *(_DWORD *)buf = 138543362;
      id v18 = v11;
      _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: %{public}@. ⛔️⛔️⛔️", buf, 0xCu);
    }

LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  if (([v9 writeToFile:v6 atomically:1] & 1) == 0)
  {
    CFTypeID v13 = [NSString stringWithFormat:@"Cannot write to file %@.", v6];
    id v14 = [MEMORY[0x263F087E8] streamErrorWithMessage:v13 code:24];
    CFTypeID v15 = v14;
    if (a4) {
      *a4 = v14;
    }

    goto LABEL_11;
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (void)enableAVEHighPerformanceProfile
{
  id v5 = (id)[(NSDictionary *)self->_sessionProperties mutableCopy];
  [v5 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E650]];
  [v5 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E5D0]];
  [v5 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F1E4C8]];
  v3 = (NSDictionary *)[v5 copy];
  sessionProperties = self->_sessionProperties;
  self->_sessionProperties = v3;
}

- (unsigned)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(unsigned int)a3
{
  self->_codecType = a3;
}

- (NSDictionary)encoderSpecification
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEncoderSpecification:(id)a3
{
}

- (NSDictionary)sessionProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProperties, 0);

  objc_storeStrong((id *)&self->_encoderSpecification, 0);
}

- (BOOL)applySessionProperties:(OpaqueVTCompressionSession *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(MOVStreamEncoderConfig *)self sessionProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(MOVStreamEncoderConfig *)self sessionProperties];
        BOOL v12 = [v11 valueForKey:v10];

        OSStatus v13 = VTSessionSetProperty(a3, v10, v12);
        if (v13)
        {
          OSStatus v15 = v13;
          uint64_t v16 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            CFStringRef v23 = v10;
            __int16 v24 = 2114;
            uint64_t v25 = v12;
            __int16 v26 = 1024;
            OSStatus v27 = v15;
            _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: Set '%{public}@' to '%{public}@' in encoder config (Err: %d). ⛔️⛔️⛔️", buf, 0x1Cu);
          }

          BOOL v14 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

@end