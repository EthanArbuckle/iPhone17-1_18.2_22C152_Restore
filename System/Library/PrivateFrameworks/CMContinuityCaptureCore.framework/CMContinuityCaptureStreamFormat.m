@interface CMContinuityCaptureStreamFormat
+ (BOOL)supportsSecureCoding;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedVersion;
- (CMContinuityCaptureStreamFormat)initWithCoder:(id)a3;
- (CMContinuityCaptureStreamFormat)initWithDictionaryRepresentation:(id)a3;
- (CMContinuityCaptureStreamFormat)initWithName:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6 minFrameRate:(unsigned int)a7 maxFrameRate:(unsigned int)a8 entity:(int64_t)a9 minimumSupportedVersion:(id *)a10;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (id)dictionaryRepresentation;
- (int64_t)entity;
- (opaqueCMFormatDescription)formatDescription;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)maxFrameRate;
- (unsigned)minFrameRate;
- (unsigned)pixelFormat;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMContinuityCaptureStreamFormat

- (CMContinuityCaptureStreamFormat)initWithName:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6 minFrameRate:(unsigned int)a7 maxFrameRate:(unsigned int)a8 entity:(int64_t)a9 minimumSupportedVersion:(id *)a10
{
  v31[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CMContinuityCaptureStreamFormat;
  v18 = [(CMContinuityCaptureStreamFormat *)&v29 init];
  uint64_t v19 = (uint64_t)v18;
  CMVideoFormatDescriptionRef v28 = 0;
  if (v18)
  {
    v18->_entity = a9;
    objc_storeStrong((id *)&v18->_name, a3);
    *(void *)(v19 + 40) = a4;
    *(void *)(v19 + 48) = a5;
    *(_DWORD *)(v19 + 16) = a6;
    *(_DWORD *)(v19 + 20) = a7;
    *(_DWORD *)(v19 + 24) = a8;
    long long v20 = *(_OWORD *)&a10->var0;
    *(void *)(v19 + 80) = a10->var2;
    *(_OWORD *)(v19 + 64) = v20;
    uint64_t v21 = *(void *)(v19 + 32);
    uint64_t v30 = *MEMORY[0x263F00E60];
    v31[0] = v21;
    CFDictionaryRef v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    OSStatus v23 = CMVideoFormatDescriptionCreate(0, *(_DWORD *)(v19 + 16), *(_DWORD *)(v19 + 40), *(_DWORD *)(v19 + 48), v22, &v28);
    if (v23 || !v28)
    {
      v27 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureStreamFormat initWithName:width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:](v19, v23, v27);
      }

      v25 = 0;
    }
    else
    {
      v24 = *(void **)(v19 + 8);
      *(void *)(v19 + 8) = v28;

      v25 = (CMContinuityCaptureStreamFormat *)(id)v19;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (CMContinuityCaptureStreamFormat)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v15 = [v3 decodeInt64ForKey:@"entity"];
  uint64_t v5 = [v3 decodeInt64ForKey:@"width"];
  uint64_t v6 = [v3 decodeInt64ForKey:@"height"];
  uint64_t v7 = [v3 decodeInt32ForKey:@"pixelFormat"];
  uint64_t v8 = [v3 decodeInt32ForKey:@"minFrameRate"];
  uint64_t v9 = [v3 decodeInt32ForKey:@"maxFrameRate"];
  uint64_t v10 = [v3 decodeInt64ForKey:@"minimumSupportedVersionMajor"];
  uint64_t v11 = [v3 decodeInt64ForKey:@"minimumSupportedVersionMinor"];
  uint64_t v12 = [v3 decodeInt64ForKey:@"minimumSupportedVersionPatch"];

  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  v13 = [(CMContinuityCaptureStreamFormat *)self initWithName:v4 width:v5 height:v6 pixelFormat:v7 minFrameRate:v8 maxFrameRate:v9 entity:v15 minimumSupportedVersion:v17];

  return v13;
}

- (CMContinuityCaptureStreamFormat)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"name"];
  if (!v5)
  {
    uint64_t v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:]();
    }
    goto LABEL_38;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"entity"];
  if (!v6)
  {
    uint64_t v7 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:]();
    }
    goto LABEL_38;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 integerValue];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"width"];
  if (!v9)
  {
    v35 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:]();
    }

    goto LABEL_38;
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v9 integerValue];
  uint64_t v12 = [v4 objectForKeyedSubscript:@"height"];
  if (!v12)
  {
    v36 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.4();
    }

    goto LABEL_37;
  }
  v13 = v12;
  uint64_t v14 = [v12 integerValue];
  uint64_t v15 = [v4 objectForKeyedSubscript:@"pixelFormat"];
  if (!v15)
  {
    v37 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.5();
    }

    goto LABEL_36;
  }
  v16 = v15;
  uint64_t v50 = v14;
  unsigned int v49 = [v15 intValue];
  id v17 = [v4 objectForKeyedSubscript:@"minFrameRate"];
  if (!v17)
  {
    v38 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.6();
    }

    goto LABEL_35;
  }
  v18 = v17;
  uint64_t v44 = v11;
  unsigned int v43 = [v17 intValue];
  uint64_t v19 = [v4 objectForKeyedSubscript:@"maxFrameRate"];
  if (!v19)
  {
    v39 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.7();
    }

LABEL_35:
LABEL_36:

LABEL_37:
LABEL_38:
    v33 = 0;
    goto LABEL_15;
  }
  long long v20 = v19;
  v45 = v16;
  v46 = v13;
  v47 = v10;
  v48 = v7;
  uint64_t v21 = [v19 intValue];
  CFDictionaryRef v22 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionMajor"];

  v42 = v5;
  if (!v22)
  {
    v26 = self;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v29 = 1;
    goto LABEL_13;
  }
  OSStatus v23 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionMajor"];
  int v24 = [v23 intValue];
  v25 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionMinor"];

  if (!v25)
  {
    v40 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.8();
    }

    v33 = 0;
    goto LABEL_14;
  }
  v26 = self;
  int v27 = [v25 intValue];
  CMVideoFormatDescriptionRef v28 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionPatch"];

  if (v28)
  {
    uint64_t v29 = v24;
    uint64_t v30 = v27;
    uint64_t v31 = (int)[v28 intValue];

LABEL_13:
    v51[0] = v29;
    v51[1] = v30;
    v51[2] = v31;
    v32 = v26;
    uint64_t v5 = v42;
    self = [(CMContinuityCaptureStreamFormat *)v32 initWithName:v42 width:v44 height:v50 pixelFormat:v49 minFrameRate:v43 maxFrameRate:v21 entity:v8 minimumSupportedVersion:v51];

    v33 = self;
LABEL_14:
    uint64_t v7 = v48;
    goto LABEL_15;
  }
  v41 = CMContinuityCaptureLog(2);
  uint64_t v7 = v48;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    -[CMContinuityCaptureStreamFormat initWithDictionaryRepresentation:].cold.9();
  }

  v33 = 0;
  self = v26;
  uint64_t v5 = v42;
LABEL_15:

  return v33;
}

- (id)dictionaryRepresentation
{
  v15[10] = *MEMORY[0x263EF8340];
  v15[0] = self->_name;
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", self->_entity, @"name", @"entity");
  v15[1] = v3;
  v14[2] = @"width";
  id v4 = [NSNumber numberWithUnsignedInteger:self->_width];
  v15[2] = v4;
  v14[3] = @"height";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_height];
  v15[3] = v5;
  v14[4] = @"pixelFormat";
  uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_pixelFormat];
  v15[4] = v6;
  v14[5] = @"minFrameRate";
  uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_minFrameRate];
  v15[5] = v7;
  v14[6] = @"maxFrameRate";
  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_maxFrameRate];
  v15[6] = v8;
  v14[7] = @"minimumSupportedVersionMajor";
  uint64_t v9 = [NSNumber numberWithInteger:self->_minimumSupportedVersion.major];
  v15[7] = v9;
  v14[8] = @"minimumSupportedVersionMinor";
  uint64_t v10 = [NSNumber numberWithInteger:self->_minimumSupportedVersion.minor];
  v15[8] = v10;
  v14[9] = @"minimumSupportedVersionPatch";
  uint64_t v11 = [NSNumber numberWithInteger:self->_minimumSupportedVersion.patch];
  v15[9] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:10];

  return v12;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  id v4 = CMContinuityCaptureStringFromOSType(self->_pixelFormat);
  unint64_t width = self->_width;
  unint64_t height = self->_height;
  int64_t entity = self->_entity;
  uint64_t minFrameRate = self->_minFrameRate;
  uint64_t maxFrameRate = self->_maxFrameRate;
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld.%ld.%ld]", self->_minimumSupportedVersion.major, self->_minimumSupportedVersion.minor, self->_minimumSupportedVersion.patch);
  uint64_t v11 = [v3 stringWithFormat:@"%@ %lu * %lu [%d-%d] entity:%u minimumSupportedVersion:%@", v4, width, height, minFrameRate, maxFrameRate, entity, v10];

  return (NSString *)v11;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureStreamFormat *)self debugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v6];

  return (NSString *)v7;
}

- (opaqueCMFormatDescription)formatDescription
{
  return (opaqueCMFormatDescription *)self->_formatDescription;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CMContinuityCaptureStreamFormat *)self name];
  [v5 encodeObject:v4 forKey:@"name"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[CMContinuityCaptureStreamFormat entity](self, "entity"), @"entity");
  objc_msgSend(v5, "encodeInt64:forKey:", -[CMContinuityCaptureStreamFormat width](self, "width"), @"width");
  objc_msgSend(v5, "encodeInt64:forKey:", -[CMContinuityCaptureStreamFormat height](self, "height"), @"height");
  objc_msgSend(v5, "encodeInt32:forKey:", -[CMContinuityCaptureStreamFormat pixelFormat](self, "pixelFormat"), @"pixelFormat");
  objc_msgSend(v5, "encodeInt32:forKey:", -[CMContinuityCaptureStreamFormat minFrameRate](self, "minFrameRate"), @"minFrameRate");
  objc_msgSend(v5, "encodeInt32:forKey:", -[CMContinuityCaptureStreamFormat maxFrameRate](self, "maxFrameRate"), @"maxFrameRate");
  [v5 encodeInt64:self->_minimumSupportedVersion.major forKey:@"minimumSupportedVersionMajor"];
  [v5 encodeInt64:self->_minimumSupportedVersion.minor forKey:@"minimumSupportedVersionMinor"];
  [v5 encodeInt64:self->_minimumSupportedVersion.patch forKey:@"minimumSupportedVersionPatch"];
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (unsigned)minFrameRate
{
  return self->_minFrameRate;
}

- (unsigned)maxFrameRate
{
  return self->_maxFrameRate;
}

- (int64_t)entity
{
  return self->_entity;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedVersion
{
  objc_copyStruct(retstr, &self->_minimumSupportedVersion, 24, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_formatDescription, 0);
}

- (void)initWithName:(os_log_t)log width:height:pixelFormat:minFrameRate:maxFrameRate:entity:minimumSupportedVersion:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_235FC2000, log, OS_LOG_TYPE_ERROR, "%@ CMVideoFormatDescriptionCreate error %x", (uint8_t *)&v3, 0x12u);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Name", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Entity", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Width", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.4()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_Height", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.5()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_PixelFormat", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.6()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MinFrameRate", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.7()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MaxFrameRate", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.8()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MinimumSupportedVersionMinor", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.9()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "missing CMContinuityCaptureStreamFormatKey_MinimumSupportedVersionPatch", v2, v3, v4, v5, v6);
}

@end