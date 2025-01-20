@interface CMIOExtensionPropertyAttributes
+ (BOOL)supportsSecureCoding;
+ (CMIOExtensionPropertyAttributes)propertyAttributesWithMinValue:(id)minValue maxValue:(id)maxValue validValues:(NSArray *)validValues readOnly:(BOOL)readOnly;
+ (CMIOExtensionPropertyAttributes)propertyAttributesWithSharedStreamDefaultValue:(id)a3 minValue:(id)a4 maxValue:(id)a5 validValues:(id)a6;
+ (CMIOExtensionPropertyAttributes)readOnlyPropertyAttribute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (CMIOExtensionPropertyAttributes)initWithCoder:(id)a3;
- (CMIOExtensionPropertyAttributes)initWithMinValue:(id)a3 maxValue:(id)a4 validValues:(id)a5 sharedStreamDefaultValue:(id)a6;
- (CMIOExtensionPropertyAttributes)initWithMinValue:(id)minValue maxValue:(id)maxValue validValues:(NSArray *)validValues readOnly:(BOOL)readOnly;
- (CMIOExtensionPropertyAttributes)initWithXPCDictionary:(id)a3;
- (NSArray)validValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (id)description;
- (id)maxValue;
- (id)minValue;
- (id)sharedStreamDefaultValue;
- (int64_t)objectType;
- (void)copyXPCDictionary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIOExtensionPropertyAttributes

+ (CMIOExtensionPropertyAttributes)propertyAttributesWithMinValue:(id)minValue maxValue:(id)maxValue validValues:(NSArray *)validValues readOnly:(BOOL)readOnly
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMinValue:minValue maxValue:maxValue validValues:validValues readOnly:readOnly];

  return (CMIOExtensionPropertyAttributes *)v6;
}

+ (CMIOExtensionPropertyAttributes)propertyAttributesWithSharedStreamDefaultValue:(id)a3 minValue:(id)a4 maxValue:(id)a5 validValues:(id)a6
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMinValue:a4 maxValue:a5 validValues:a6 sharedStreamDefaultValue:a3];

  return (CMIOExtensionPropertyAttributes *)v6;
}

- (CMIOExtensionPropertyAttributes)initWithMinValue:(id)a3 maxValue:(id)a4 validValues:(id)a5 sharedStreamDefaultValue:(id)a6
{
  result = [(CMIOExtensionPropertyAttributes *)self initWithMinValue:a3 maxValue:a4 validValues:a5 readOnly:0];
  if (result) {
    result->_sharedStreamDefaultValue = a6;
  }
  return result;
}

- (CMIOExtensionPropertyAttributes)initWithMinValue:(id)minValue maxValue:(id)maxValue validValues:(NSArray *)validValues readOnly:(BOOL)readOnly
{
  v24.receiver = self;
  v24.super_class = (Class)CMIOExtensionPropertyAttributes;
  v10 = [(CMIOExtensionPropertyAttributes *)&v24 init];
  v11 = v10;
  if (!v10) {
    return v11;
  }
  v10->_sharedStreamDefaultValue = 0;
  if (minValue)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = 4;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v12 = 6;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_64;
              }
              uint64_t v12 = 7;
            }
          }
        }
      }
    }
    int64_t objectType = v11->_objectType;
    if (objectType)
    {
      if (objectType != v12) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ value argument must be the same type", v11 format];
      }
    }
    else
    {
      v11->_int64_t objectType = v12;
    }
    v11->_minValue = (id)[minValue copy];
  }
  if (maxValue)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = 4;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v14 = 6;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_64;
              }
              uint64_t v14 = 7;
            }
          }
        }
      }
    }
    int64_t v15 = v11->_objectType;
    if (v15)
    {
      if (v15 != v14) {
        goto LABEL_54;
      }
    }
    else
    {
      v11->_int64_t objectType = v14;
    }
    v11->_maxValue = (id)[maxValue copy];
  }
  if (validValues)
  {
    if (![(NSArray *)validValues count])
    {
LABEL_57:
      v11->_validValues = (NSArray *)[(NSArray *)validValues copy];
      goto LABEL_58;
    }
    [(NSArray *)validValues objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 4;
      goto LABEL_52;
    }
    [(NSArray *)validValues objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 2;
      goto LABEL_52;
    }
    [(NSArray *)validValues objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 3;
      goto LABEL_52;
    }
    [(NSArray *)validValues objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 5;
      goto LABEL_52;
    }
    [(NSArray *)validValues objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 6;
      goto LABEL_52;
    }
    [(NSArray *)validValues objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = 7;
LABEL_52:
      int64_t v17 = v11->_objectType;
      if (v17)
      {
        if (v17 != v16)
        {
LABEL_54:

          v18 = (void *)MEMORY[0x263EFF940];
          uint64_t v19 = *MEMORY[0x263EFF4A0];
          v20 = @"value argument must be the same type";
LABEL_55:
          [v18 raise:v19 format:v20];
          return 0;
        }
      }
      else
      {
        v11->_int64_t objectType = v16;
      }
      goto LABEL_57;
    }
LABEL_64:

    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF4A0];
    v20 = @"value argument must be a NSString or a NSData or a NSNumber or a CMIOExtensionStreamFormat or a NSDictionary or a NSArray";
    goto LABEL_55;
  }
LABEL_58:
  if (!v11->_objectType) {
    v11->_int64_t objectType = 1;
  }
  v11->_readOnly = readOnly;
  id v21 = [NSString alloc];
  uint64_t v22 = 89;
  if (!v11->_readOnly) {
    uint64_t v22 = 78;
  }
  v11->_description = (NSString *)[v21 initWithFormat:@"<CMIOExtensionPropertyAttributes: %@:%@:%@:(%c)>", *(_OWORD *)&v11->_minValue, v11->_validValues, v22];
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionPropertyAttributes;
  [(CMIOExtensionPropertyAttributes *)&v3 dealloc];
}

+ (CMIOExtensionPropertyAttributes)readOnlyPropertyAttribute
{
  if (readOnlyPropertyAttribute_onceToken != -1) {
    dispatch_once(&readOnlyPropertyAttribute_onceToken, &__block_literal_global_0);
  }
  return (CMIOExtensionPropertyAttributes *)readOnlyPropertyAttribute_gReadOnlyAttribute;
}

CMIOExtensionPropertyAttributes *__60__CMIOExtensionPropertyAttributes_readOnlyPropertyAttribute__block_invoke()
{
  result = [[CMIOExtensionPropertyAttributes alloc] initWithMinValue:0 maxValue:0 validValues:0 readOnly:1];
  readOnlyPropertyAttribute_gReadOnlyAttribute = (uint64_t)result;
  return result;
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
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v17 = v5;
    uint64_t v18 = v4;
    uint64_t v19 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id minValue = self->_minValue;
      if (minValue == (id)[a3 minValue]
        || (int v12 = objc_msgSend(self->_minValue, "isEqual:", objc_msgSend(a3, "minValue"))) != 0)
      {
        id maxValue = self->_maxValue;
        if (maxValue == (id)objc_msgSend(a3, "maxValue", v6, v17, v18, v19, v7, v8)
          || (int v12 = objc_msgSend(self->_maxValue, "isEqual:", objc_msgSend(a3, "maxValue"))) != 0)
        {
          validValues = self->_validValues;
          if (validValues == (NSArray *)[a3 validValues]
            || (int v12 = -[NSArray isEqual:](self->_validValues, "isEqual:", [a3 validValues])) != 0)
          {
            int readOnly = self->_readOnly;
            LOBYTE(v12) = readOnly == [a3 isReadOnly];
          }
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CMIOExtensionPropertyAttributes allocWithZone:a3];
  id minValue = self->_minValue;
  id maxValue = self->_maxValue;
  validValues = self->_validValues;
  BOOL readOnly = self->_readOnly;

  return [(CMIOExtensionPropertyAttributes *)v4 initWithMinValue:minValue maxValue:maxValue validValues:validValues readOnly:readOnly];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id minValue = self->_minValue;
  if (minValue) {
    [a3 encodeObject:minValue forKey:@"min"];
  }
  id maxValue = self->_maxValue;
  if (maxValue) {
    [a3 encodeObject:maxValue forKey:@"max"];
  }
  validValues = self->_validValues;
  if (validValues) {
    [a3 encodeObject:validValues forKey:@"validValues"];
  }
  BOOL readOnly = self->_readOnly;

  [a3 encodeBool:readOnly forKey:@"readonly"];
}

- (CMIOExtensionPropertyAttributes)initWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  uint64_t v12 = [a3 decodeObjectOfClasses:v11 forKey:@"min"];
  uint64_t v13 = [a3 decodeObjectOfClasses:v11 forKey:@"max"];
  uint64_t v14 = [a3 decodeObjectOfClasses:v11 forKey:@"validValues"];
  uint64_t v15 = [a3 decodeBoolForKey:@"readonly"];

  return [(CMIOExtensionPropertyAttributes *)self initWithMinValue:v12 maxValue:v13 validValues:v14 readOnly:v15];
}

- (id)copyXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "type", self->_objectType);
  xpc_dictionary_set_BOOL(v3, "readonly", self->_readOnly);
  switch(self->_objectType)
  {
    case 0:
    case 1:
      return v3;
    case 2:
      id minValue = self->_minValue;
      if (minValue)
      {
        if (cmio_XPCMessageSetCFData(v3, "min", minValue))
        {
          uint64_t v5 = CMIOLog();
          if (v5)
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]();
            }
          }
        }
      }
      id maxValue = self->_maxValue;
      if (maxValue)
      {
        if (cmio_XPCMessageSetCFData(v3, "max", maxValue))
        {
          uint64_t v7 = CMIOLog();
          if (v7)
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]();
            }
          }
        }
      }
      validValues = self->_validValues;
      if (validValues)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", validValues))
        {
          uint64_t v9 = CMIOLog();
          if (v9)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]();
            }
          }
        }
      }
      break;
    case 3:
      id v10 = self->_minValue;
      if (v10)
      {
        if (cmio_XPCMessageSetCFNumber(v3, "min", v10))
        {
          uint64_t v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.6();
            }
          }
        }
      }
      id v12 = self->_maxValue;
      if (v12)
      {
        if (cmio_XPCMessageSetCFNumber(v3, "max", v12))
        {
          uint64_t v13 = CMIOLog();
          if (v13)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.5();
            }
          }
        }
      }
      uint64_t v14 = self->_validValues;
      if (v14)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v14))
        {
          uint64_t v15 = CMIOLog();
          if (v15)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.4();
            }
          }
        }
      }
      break;
    case 4:
      id v16 = self->_minValue;
      if (v16)
      {
        if (cmio_XPCMessageSetCFString(v3, "min", v16))
        {
          uint64_t v17 = CMIOLog();
          if (v17)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.9();
            }
          }
        }
      }
      id v18 = self->_maxValue;
      if (v18)
      {
        if (cmio_XPCMessageSetCFString(v3, "max", v18))
        {
          uint64_t v19 = CMIOLog();
          if (v19)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.8();
            }
          }
        }
      }
      v20 = self->_validValues;
      if (v20)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v20))
        {
          id v21 = CMIOLog();
          if (v21)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary].cold.7();
            }
          }
        }
      }
      break;
    case 5:
      id v22 = self->_minValue;
      if (v22)
      {
        v23 = (void *)[v22 copyXPCDictionary];
        if (v23)
        {
          objc_super v24 = v23;
          xpc_dictionary_set_value(v3, "min", v23);
          xpc_release(v24);
        }
        else
        {
          v37 = CMIOLog();
          if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionPropertyAttributes copyXPCDictionary]1();
          }
        }
      }
      id v38 = self->_maxValue;
      if (v38)
      {
        v39 = (void *)[v38 copyXPCDictionary];
        if (v39)
        {
          v40 = v39;
          xpc_dictionary_set_value(v3, "max", v39);
          xpc_release(v40);
        }
        else
        {
          v41 = CMIOLog();
          if (v41 && os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[CMIOExtensionPropertyAttributes copyXPCDictionary]0();
          }
        }
      }
      if (self->_validValues)
      {
        id v42 = +[CMIOExtensionStreamFormat copyXPCArrayFromFormats:](CMIOExtensionStreamFormat, "copyXPCArrayFromFormats:");
        if (v42)
        {
          v43 = v42;
          xpc_dictionary_set_value(v3, "validValues", v42);
          xpc_release(v43);
        }
      }
      break;
    case 6:
      id v25 = self->_minValue;
      if (v25)
      {
        if (cmio_XPCMessageSetCFDictionary(v3, "min", v25))
        {
          v26 = CMIOLog();
          if (v26)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]4();
            }
          }
        }
      }
      id v27 = self->_maxValue;
      if (v27)
      {
        if (cmio_XPCMessageSetCFDictionary(v3, "max", v27))
        {
          v28 = CMIOLog();
          if (v28)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]3();
            }
          }
        }
      }
      v29 = self->_validValues;
      if (v29)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v29))
        {
          v30 = CMIOLog();
          if (v30)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]2();
            }
          }
        }
      }
      break;
    case 7:
      id v31 = self->_minValue;
      if (v31)
      {
        if (cmio_XPCMessageSetCFArray(v3, "min", v31))
        {
          v32 = CMIOLog();
          if (v32)
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]7();
            }
          }
        }
      }
      id v33 = self->_maxValue;
      if (v33)
      {
        if (cmio_XPCMessageSetCFArray(v3, "max", v33))
        {
          v34 = CMIOLog();
          if (v34)
          {
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]6();
            }
          }
        }
      }
      v35 = self->_validValues;
      if (v35)
      {
        if (cmio_XPCMessageSetCFArray(v3, "validValues", v35))
        {
          v36 = CMIOLog();
          if (v36)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes copyXPCDictionary]5();
            }
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

- (CMIOExtensionPropertyAttributes)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    v28 = 0;
    v29 = 0;
    id v27 = 0;
    uint64_t uint64 = xpc_dictionary_get_uint64(a3, "type");
    BOOL v6 = xpc_dictionary_get_BOOL(a3, "readonly");
    switch(uint64)
    {
      case 2uLL:
        if (cmio_XPCMessageCopyCFData(a3, "min", (NSObject **)&v29))
        {
          uint64_t v7 = CMIOLog();
          if (v7)
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.9();
            }
          }
        }
        if (cmio_XPCMessageCopyCFData(a3, "max", (NSObject **)&v28))
        {
          uint64_t v8 = CMIOLog();
          if (v8)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.8();
            }
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          uint64_t v9 = CMIOLog();
          if (v9)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.7();
            }
          }
        }
        break;
      case 3uLL:
        if (cmio_XPCMessageCopyCFNumber(a3, "min", (NSObject **)&v29))
        {
          uint64_t v11 = CMIOLog();
          if (v11)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]2();
            }
          }
        }
        if (cmio_XPCMessageCopyCFNumber(a3, "max", (NSObject **)&v28))
        {
          id v12 = CMIOLog();
          if (v12)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]1();
            }
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          uint64_t v13 = CMIOLog();
          if (v13)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]0();
            }
          }
        }
        break;
      case 4uLL:
        if (cmio_XPCMessageCopyCFString(a3, "min", (NSObject **)&v29))
        {
          uint64_t v14 = CMIOLog();
          if (v14)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]5();
            }
          }
        }
        if (cmio_XPCMessageCopyCFString(a3, "max", (NSObject **)&v28))
        {
          uint64_t v15 = CMIOLog();
          if (v15)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]4();
            }
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          id v16 = CMIOLog();
          if (v16)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]3();
            }
          }
        }
        break;
      case 5uLL:
        xpc_object_t value = xpc_dictionary_get_value(a3, "min");
        if (value) {
          v29 = [[CMIOExtensionStreamFormat alloc] initWithXPCDictionary:value];
        }
        xpc_object_t v18 = xpc_dictionary_get_value(a3, "max");
        if (v18) {
          v28 = [[CMIOExtensionStreamFormat alloc] initWithXPCDictionary:v18];
        }
        xpc_object_t v19 = xpc_dictionary_get_value(a3, "validValues");
        if (v19) {
          id v27 = +[CMIOExtensionStreamFormat copyFormatsFromXPCArray:v19];
        }
        break;
      case 6uLL:
        if (cmio_XPCMessageCopyCFDictionary(a3, "min", (NSObject **)&v29))
        {
          v20 = CMIOLog();
          if (v20)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.6();
            }
          }
        }
        if (cmio_XPCMessageCopyCFDictionary(a3, "max", (NSObject **)&v28))
        {
          id v21 = CMIOLog();
          if (v21)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.5();
            }
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          id v22 = CMIOLog();
          if (v22)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:].cold.4();
            }
          }
        }
        break;
      case 7uLL:
        if (cmio_XPCMessageCopyCFArray(a3, "min", (NSObject **)&v29))
        {
          v23 = CMIOLog();
          if (v23)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]();
            }
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "max", (NSObject **)&v28))
        {
          objc_super v24 = CMIOLog();
          if (v24)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]();
            }
          }
        }
        if (cmio_XPCMessageCopyCFArray(a3, "validValues", &v27))
        {
          id v25 = CMIOLog();
          if (v25)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[CMIOExtensionPropertyAttributes initWithXPCDictionary:]();
            }
          }
        }
        break;
      default:
        break;
    }
    id v10 = [(CMIOExtensionPropertyAttributes *)self initWithMinValue:v29 maxValue:v28 validValues:v27 readOnly:v6];
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
    return 0;
  }
  return v10;
}

- (id)sharedStreamDefaultValue
{
  return self->_sharedStreamDefaultValue;
}

- (id)minValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)maxValue
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSArray)validValues
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (void)copyXPCDictionary
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageSetCFArray failed for min", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for max", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.3()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for min", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.4()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.5()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFDictionary failed for max", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.6()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFDictionary failed for min", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.7()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.8()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFData failed for max", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.9()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFData failed for min", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.10()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.11()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFNumber failed for max", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.12()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFNumber failed for min", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.13()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFArray failed for validValues", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.14()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFString failed for max", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.15()
{
  OUTLINED_FUNCTION_15();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s Error: %ld, cmio_XPCMessageCopyCFString failed for min", v2, v3, v4, v5, v6);
}

@end