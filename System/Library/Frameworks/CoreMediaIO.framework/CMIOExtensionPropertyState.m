@interface CMIOExtensionPropertyState
+ (BOOL)supportsSecureCoding;
+ (CMIOExtensionPropertyState)propertyStateWithValue:(id)value;
+ (CMIOExtensionPropertyState)propertyStateWithValue:(id)value attributes:(CMIOExtensionPropertyAttributes *)attributes;
+ (id)copyPropertyStatesFromXPCDictionary:(id)a3;
+ (id)copyXPCDictionaryFromPropertyStates:(id)a3;
+ (id)copyXPCDictionaryFromPropertyValues:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CMIOExtensionPropertyAttributes)attributes;
- (CMIOExtensionPropertyState)initWithCoder:(id)a3;
- (CMIOExtensionPropertyState)initWithValue:(id)value;
- (CMIOExtensionPropertyState)initWithValue:(id)value attributes:(CMIOExtensionPropertyAttributes *)attributes;
- (CMIOExtensionPropertyState)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (id)description;
- (id)value;
- (int64_t)objectType;
- (void)copyXPCDictionary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIOExtensionPropertyState

+ (CMIOExtensionPropertyState)propertyStateWithValue:(id)value
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:value];

  return (CMIOExtensionPropertyState *)v3;
}

+ (CMIOExtensionPropertyState)propertyStateWithValue:(id)value attributes:(CMIOExtensionPropertyAttributes *)attributes
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:value attributes:attributes];

  return (CMIOExtensionPropertyState *)v4;
}

- (CMIOExtensionPropertyState)initWithValue:(id)value
{
  return [(CMIOExtensionPropertyState *)self initWithValue:value attributes:0];
}

- (CMIOExtensionPropertyState)initWithValue:(id)value attributes:(CMIOExtensionPropertyAttributes *)attributes
{
  v15.receiver = self;
  v15.super_class = (Class)CMIOExtensionPropertyState;
  v6 = [(CMIOExtensionPropertyState *)&v15 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_int64_t objectType = 0;
  if (value)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t objectType = 4;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t objectType = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t objectType = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t objectType = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int64_t objectType = 6;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int64_t objectType = 7;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int64_t objectType = 8;
                }
                else
                {
                  CFTypeID v9 = CFGetTypeID(value);
                  if (v9 != CVPixelBufferGetTypeID())
                  {

                    v12 = (void *)MEMORY[0x263EFF940];
                    uint64_t v13 = *MEMORY[0x263EFF4A0];
                    v14 = @"value argument must be a NSString or a NSData or a NSNumber or a CMIOExtensionStreamFormat";
                    goto LABEL_30;
                  }
                  int64_t objectType = 9;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int64_t objectType = 1;
  }
  v7->_int64_t objectType = objectType;
  if (attributes)
  {
    if ([(CMIOExtensionPropertyAttributes *)attributes objectType] == 1)
    {
      int64_t objectType = v7->_objectType;
      goto LABEL_24;
    }
    int64_t objectType = [(CMIOExtensionPropertyAttributes *)attributes objectType];
    if (objectType == v7->_objectType) {
      goto LABEL_24;
    }

    v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF4A0];
    v14 = @"value argument must be the same type";
LABEL_30:
    [v12 raise:v13 format:v14];
    return 0;
  }
LABEL_24:
  if (objectType == 9) {
    id v10 = value;
  }
  else {
    id v10 = (id)[value copy];
  }
  v7->_value = v10;
  v7->_attributes = attributes;
  v7->_description = (NSString *)[[NSString alloc] initWithFormat:@"<CMIOExtensionPropertyState: value %@, attributes %@>", v7->_value, v7->_attributes];
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionPropertyState;
  [(CMIOExtensionPropertyState *)&v3 dealloc];
}

- (id)description
{
  v2 = self->_description;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  id value = self->_value;
  if (value == (id)[a3 value]
    || (int v6 = objc_msgSend(self->_value, "isEqual:", objc_msgSend(a3, "value"))) != 0)
  {
    attributes = self->_attributes;
    if (attributes != (CMIOExtensionPropertyAttributes *)[a3 attributes])
    {
      v8 = self->_attributes;
      uint64_t v9 = [a3 attributes];
      LOBYTE(v6) = [(CMIOExtensionPropertyAttributes *)v8 isEqual:v9];
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CMIOExtensionPropertyState allocWithZone:a3];
  id value = self->_value;
  attributes = self->_attributes;

  return [(CMIOExtensionPropertyState *)v4 initWithValue:value attributes:attributes];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id value = self->_value;
  if (value) {
    [a3 encodeObject:value forKey:@"value"];
  }
  if (self->_attributes)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (CMIOExtensionPropertyState)initWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), @"value");
  uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"attributes"];

  return [(CMIOExtensionPropertyState *)self initWithValue:v11 attributes:v12];
}

- (id)copyXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "type", self->_objectType);
  attributes = self->_attributes;
  if (attributes)
  {
    id v5 = [(CMIOExtensionPropertyAttributes *)attributes copyXPCDictionary];
    if (v5)
    {
      uint64_t v6 = v5;
      xpc_dictionary_set_value(v3, "attributes", v5);
      xpc_release(v6);
    }
    else
    {
      uint64_t v7 = CMIOLog();
      if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CMIOExtensionPropertyState copyXPCDictionary]0();
      }
    }
  }
  switch(self->_objectType)
  {
    case 0:
    case 1:
      return v3;
    case 2:
      id value = self->_value;
      if (value)
      {
        if (cmio_XPCMessageSetCFData(v3, "value", value))
        {
          uint64_t v9 = CMIOLog();
          if (v9)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState copyXPCDictionary]();
            }
          }
        }
      }
      break;
    case 3:
      id v10 = self->_value;
      if (v10)
      {
        if (cmio_XPCMessageSetCFNumber(v3, "value", v10))
        {
          uint64_t v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState copyXPCDictionary]();
            }
          }
        }
      }
      break;
    case 4:
      id v12 = self->_value;
      if (v12)
      {
        if (cmio_XPCMessageSetCFString(v3, "value", v12))
        {
          uint64_t v13 = CMIOLog();
          if (v13)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState copyXPCDictionary]();
            }
          }
        }
      }
      break;
    case 5:
      id v14 = self->_value;
      if (v14)
      {
        uint64_t v15 = [v14 copyXPCDictionary];
        if (v15) {
          goto LABEL_42;
        }
        v16 = CMIOLog();
        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionPropertyState copyXPCDictionary].cold.4();
        }
      }
      break;
    case 6:
      id v17 = self->_value;
      if (v17)
      {
        if (cmio_XPCMessageSetCFDictionary(v3, "value", v17))
        {
          v18 = CMIOLog();
          if (v18)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.5();
            }
          }
        }
      }
      break;
    case 7:
      id v19 = self->_value;
      if (v19)
      {
        if ([v19 count])
        {
          if (cmio_XPCMessageSetCFArray(v3, "value", v19))
          {
            v20 = CMIOLog();
            if (v20)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                -[CMIOExtensionPropertyState copyXPCDictionary].cold.6();
              }
            }
          }
        }
      }
      break;
    case 8:
      id v21 = self->_value;
      if (v21)
      {
        uint64_t v15 = [v21 copyXPCDictionary];
        if (v15)
        {
LABEL_42:
          v22 = (void *)v15;
          goto LABEL_43;
        }
        v29 = CMIOLog();
        if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionPropertyState copyXPCDictionary].cold.7();
        }
      }
      break;
    case 9:
      v23 = (__CVBuffer *)self->_value;
      if (v23)
      {
        xpc_object_t empty = xpc_dictionary_create_empty();
        if (empty)
        {
          v22 = empty;
          IOSurface = CVPixelBufferGetIOSurface(v23);
          if (IOSurface)
          {
            xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
            xpc_dictionary_set_value(v22, "surface", XPCObject);
            xpc_release(XPCObject);
            CFDictionaryRef v27 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], v23, 1u);
            if (v27)
            {
              CFDictionaryRef v28 = v27;
              cmio_XPCMessageSetCFDictionary(v22, "attachments", v27);
              CFRelease(v28);
            }
LABEL_43:
            xpc_dictionary_set_value(v3, "value", v22);
          }
          else
          {
            v32 = CMIOLog();
            if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState copyXPCDictionary].cold.9();
            }
          }
          xpc_release(v22);
        }
        else
        {
          v30 = CMIOLog();
          if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionPropertyState copyXPCDictionary].cold.8();
          }
        }
      }
      break;
    default:
      xpc_release(v3);
      xpc_object_t v3 = 0;
      break;
  }
  return v3;
}

- (CMIOExtensionPropertyState)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    v33 = 0;
    uint64_t uint64 = xpc_dictionary_get_uint64(a3, "type");
    dictionary = (CMIOExtensionPropertyAttributes *)xpc_dictionary_get_dictionary(a3, "attributes");
    if (dictionary)
    {
      dictionary = [[CMIOExtensionPropertyAttributes alloc] initWithXPCDictionary:dictionary];
      if (!dictionary)
      {
        uint64_t v7 = CMIOLog();
        dictionary = (CMIOExtensionPropertyAttributes *)v7;
        if (v7)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionPropertyState initWithXPCDictionary:]2();
          }
          dictionary = 0;
        }
      }
    }
    switch(uint64)
    {
      case 2uLL:
        if (cmio_XPCMessageCopyCFData(a3, "value", &v33))
        {
          uint64_t v8 = CMIOLog();
          if (v8)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.6();
            }
          }
        }
        break;
      case 3uLL:
        if (cmio_XPCMessageCopyCFNumber(a3, "value", &v33))
        {
          id v10 = CMIOLog();
          if (v10)
          {
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.7();
            }
          }
        }
        break;
      case 4uLL:
        if (cmio_XPCMessageCopyCFString(a3, "value", &v33))
        {
          uint64_t v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.8();
            }
          }
        }
        break;
      case 5uLL:
        xpc_object_t value = xpc_dictionary_get_value(a3, "value");
        if (value)
        {
          xpc_object_t v13 = value;
          id v14 = CMIOExtensionStreamFormat;
          goto LABEL_34;
        }
        v25 = CMIOLog();
        if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.9();
        }
        break;
      case 6uLL:
        if (cmio_XPCMessageCopyCFDictionary(a3, "value", &v33))
        {
          uint64_t v15 = CMIOLog();
          if (v15)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState initWithXPCDictionary:]0();
            }
          }
        }
        break;
      case 7uLL:
        if (cmio_XPCMessageCopyCFArray(a3, "value", &v33))
        {
          v16 = CMIOLog();
          if (v16)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState initWithXPCDictionary:]1();
            }
          }
        }
        break;
      case 8uLL:
        xpc_object_t v17 = xpc_dictionary_get_value(a3, "value");
        if (v17)
        {
          xpc_object_t v13 = v17;
          id v14 = CMIOExtensionStreamCustomClockConfiguration;
LABEL_34:
          v33 = [[v14 alloc] initWithXPCDictionary:v13];
        }
        else
        {
          v26 = CMIOLog();
          if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.5();
          }
        }
        break;
      case 9uLL:
        xpc_object_t v19 = xpc_dictionary_get_value(a3, "value");
        if (v19)
        {
          v20 = v19;
          xpc_object_t v21 = xpc_dictionary_get_value(v19, "surface");
          if (v21)
          {
            v22 = IOSurfaceLookupFromXPCObject(v21);
            if (v22)
            {
              v23 = v22;
              CVPixelBufferRef pixelBufferOut = 0;
              CVReturn v24 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v22, 0, &pixelBufferOut);
              CFRelease(v23);
              if (v24 || !pixelBufferOut)
              {
                if (pixelBufferOut) {
                  CFRelease(pixelBufferOut);
                }
                v30 = CMIOLog();
                if (v30 && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  -[CMIOExtensionPropertyState initWithXPCDictionary:].cold.4();
                }
              }
              else
              {
                v33 = pixelBufferOut;
                CFDictionaryRef theAttachments = 0;
                cmio_XPCMessageCopyCFDictionary(v20, "attachments", (NSObject **)&theAttachments);
                if (theAttachments)
                {
                  CMSetAttachments(pixelBufferOut, theAttachments, 1u);
                  CFRelease(theAttachments);
                }
              }
            }
            else
            {
              v29 = CMIOLog();
              if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[CMIOExtensionPropertyState initWithXPCDictionary:]();
              }
            }
          }
          else
          {
            CFDictionaryRef v28 = CMIOLog();
            if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyState initWithXPCDictionary:]();
            }
          }
        }
        else
        {
          CFDictionaryRef v27 = CMIOLog();
          if (v27 && os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionPropertyState initWithXPCDictionary:]();
          }
        }
        break;
      default:
        break;
    }
    uint64_t v9 = [(CMIOExtensionPropertyState *)self initWithValue:v33 attributes:dictionary];
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
    return 0;
  }
  return v9;
}

+ (id)copyXPCDictionaryFromPropertyStates:(id)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke;
  v6[3] = &unk_26517C570;
  v6[4] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  return v4;
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)[a3 copyXPCDictionary];
  if (v5)
  {
    uint64_t v6 = v5;
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), (const char *)[a2 UTF8String], v5);
    xpc_release(v6);
  }
  else
  {
    uint64_t v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke_cold_1();
    }
  }
}

+ (id)copyXPCDictionaryFromPropertyValues:(id)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke;
  v6[3] = &unk_26517BE90;
  v6[4] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  return v4;
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [[CMIOExtensionPropertyState alloc] initWithValue:a3];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [(CMIOExtensionPropertyState *)v5 copyXPCDictionary];
    if (v7)
    {
      uint64_t v8 = v7;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), (const char *)[a2 UTF8String], v7);
      xpc_release(v8);
    }
    else
    {
      id v10 = CMIOLog();
      if (v10)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_2();
        }
      }
    }
  }
  else
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_1();
    }
  }
}

+ (id)copyPropertyStatesFromXPCDictionary:(id)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke;
    applier[3] = &unk_26517C598;
    applier[4] = v4;
    xpc_dictionary_apply(a3, applier);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
    return 0;
  }
  return v4;
}

uint64_t __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [[CMIOExtensionPropertyState alloc] initWithXPCDictionary:a3];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, objc_msgSend(NSString, "stringWithUTF8String:", a2));
  }
  else
  {
    id v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke_cold_1();
    }
  }
  return 1;
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (CMIOExtensionPropertyAttributes)attributes
{
  return (CMIOExtensionPropertyAttributes *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (void)copyXPCDictionary
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s could not create xpc object", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s nil xpc object", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s pixel buffer missing surface", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Could not lookup surface", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.4()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_2432B6000, v0, v1, "%s:%d:%s Could not create pixel buffer: %d", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.5()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s nil xpc object", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.6()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFData failed", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.7()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFNumber failed", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.8()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFString failed", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.9()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s nil xpc object", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.10()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFDictionary failed", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.11()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.12()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s could not create attributes", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyStates___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary error for %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s CMIOExtensionPropertyState alloc failed for %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionPropertyState_copyXPCDictionaryFromPropertyValues___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary error for %{public}@", v2, v3, v4, v5, v6);
}

void __66__CMIOExtensionPropertyState_copyPropertyStatesFromXPCDictionary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s initWithXPCDictionary failed for %{public}s", v2, v3, v4, v5, v6);
}

@end