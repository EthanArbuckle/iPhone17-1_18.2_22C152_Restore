@interface BMDSLJSONCoder
+ (BOOL)hasNativeSupportForClass:(Class)a3;
- (BMDSLJSONCoder)init;
- (BMDSLJSONCoder)initWithOptions:(unint64_t)a3;
- (BOOL)_jsonDecodeArray:(id *)a3 forKey:(id *)a4;
- (BOOL)_jsonDecodeDictionary:(id *)a3 asClass:(Class)a4;
- (BOOL)_jsonDecodeDictionary:(id *)a3 forKey:(id *)a4;
- (BOOL)_jsonDecodeObject:(id *)a3 encodingDescriptor:(id)a4;
- (BOOL)_jsonDecodeObject:(id *)a3 forKey:(id *)a4;
- (BOOL)_jsonEncodeArray:(id *)a3 forKey:(id *)a4;
- (BOOL)_jsonEncodeDictionary:(id *)a3 forKey:(id *)a4;
- (BOOL)_jsonEncodeObject:(id *)a3 forKey:(id *)a4;
- (BOOL)allowsKeyedCoding;
- (BOOL)decodeBoolForKey:(id)a3;
- (Class)classFromEncodingDescriptor:(id)a3;
- (NSDictionary)userInfo;
- (_NSRange)encodingDescriptorRangeInKey:(id)a3;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)buildKeyFromClass:(Class)a3 originalKey:(id)a4;
- (id)buildKeyFromEncodingDescriptor:(id)a3 originalKey:(id)a4;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeRootObjectFromData:(id)a3;
- (id)encodeDataFromRootObject:(id)a3;
- (id)encodingCompatibleObjectFromRootObject:(id)a3;
- (id)encodingDescriptorFromKey:(id)a3;
- (id)keyWithoutEncodingDescriptor:(id)a3;
- (id)pop;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)push:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation BMDSLJSONCoder

- (BMDSLJSONCoder)init
{
  return [(BMDSLJSONCoder *)self initWithOptions:0];
}

- (BMDSLJSONCoder)initWithOptions:(unint64_t)a3
{
  char v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMDSLJSONCoder;
  v4 = [(BMDSLJSONCoder *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    stack = v4->_stack;
    v4->_stack = (NSMutableArray *)v5;

    v4->_allowSecureCodingObjects = (v3 & 1) == 0;
    v4->_allowKeyModifications = (v3 & 2) == 0;
    +[BMDSLJSONArchiver registerJSONTransformers];
  }
  return v4;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)push:(id)a3
{
  v4 = (NSMutableDictionary *)a3;
  [(NSMutableArray *)self->_stack addObject:v4];
  currentDictionary = self->_currentDictionary;
  self->_currentDictionary = v4;
}

- (id)pop
{
  char v3 = self->_currentDictionary;
  [(NSMutableArray *)self->_stack removeObjectAtIndex:[(NSMutableArray *)self->_stack count] - 1];
  v4 = [(NSMutableArray *)self->_stack lastObject];
  currentDictionary = self->_currentDictionary;
  self->_currentDictionary = v4;

  return v3;
}

- (id)decodeRootObjectFromData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1B3EB4FF0]();
  id v10 = 0;
  id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:1 error:&v10];
  id v7 = v10;
  id v11 = v6;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BMDSLJSONCoder decodeRootObjectFromData:]();
    }
  }
  else
  {
    [(BMDSLJSONCoder *)self _jsonDecodeObject:&v11 forKey:0];
    id v6 = v11;
  }
  id v8 = v6;

  return v8;
}

- (id)encodingCompatibleObjectFromRootObject:(id)a3
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1B3EB4FF0]();
  v12 = &stru_1F0B32A50;
  id v7 = v5;
  id v11 = v7;
  [(BMDSLJSONCoder *)self _jsonEncodeObject:&v11 forKey:&v12];
  if ([(__CFString *)v12 length])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"BMDSLJSONArchiver.m" lineNumber:199 description:@"Top-level objects requiring type-encoding are not currently supported."];
  }
  id v8 = v11;

  return v8;
}

- (id)encodeDataFromRootObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1B3EB4FF0]();
  id v6 = [(BMDSLJSONCoder *)self encodingCompatibleObjectFromRootObject:v4];
  id v10 = 0;
  id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:2 error:&v10];
  id v8 = v10;
  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[BMDSLJSONCoder encodeDataFromRootObject:]();
  }

  return v7;
}

- (BOOL)_jsonEncodeDictionary:(id *)a3 forKey:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4);
    [v23 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 226, @"Invalid parameter not satisfying: %@", @"dictionaryRef" object file lineNumber description];
  }
  id v6 = *a3;
  id v7 = (void *)[v6 mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  BOOL v10 = v9 != 0;
  if (v9)
  {
    uint64_t v11 = v9;
    v24 = a3;
    char v12 = 0;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v20 = *v24;
          id *v24 = 0;

          BOOL v10 = 1;
          goto LABEL_18;
        }
        id v16 = [v8 objectForKeyedSubscript:v15];
        id v26 = v16;
        id v17 = v15;
        id v25 = v17;
        if ([(BMDSLJSONCoder *)self _jsonEncodeObject:&v26 forKey:&v25])
        {
          if (v17 != v25)
          {
            [v7 setObject:0 forKeyedSubscript:v17];
            id v17 = v25;
          }
          [v7 setObject:v26 forKeyedSubscript:v17];
          char v12 = 1;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    if (v12)
    {
      id v18 = v7;
      id v19 = *v24;
      id *v24 = v18;
      BOOL v10 = 1;
      goto LABEL_19;
    }
    BOOL v10 = 0;
  }
  else
  {
LABEL_18:
    id v19 = v8;
LABEL_19:
  }
  return v10;
}

+ (BOOL)hasNativeSupportForClass:(Class)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (BOOL)_jsonEncodeArray:(id *)a3 forKey:(id *)a4
{
  if (!a3)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 265, @"Invalid parameter not satisfying: %@", @"arrayRef" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_25:
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 266, @"Invalid parameter not satisfying: %@", @"keyRef" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_25;
  }
LABEL_3:
  id v8 = *a4;
  id v9 = *a3;
  BOOL v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = [v9 count];
  if (!v11)
  {
LABEL_16:
    BOOL v16 = 0;
    goto LABEL_23;
  }
  uint64_t v12 = v11;
  char v13 = 0;
  for (uint64_t i = 0; i != v12; ++i)
  {
    id v22 = [v9 objectAtIndexedSubscript:i];
    id v21 = *a4;
    if (![(BMDSLJSONCoder *)self _jsonEncodeObject:&v22 forKey:&v21]) {
      goto LABEL_12;
    }
    if (v21 != *a4 && ([v21 isEqualToString:v8] & 1) == 0)
    {
      if (v8 != *a4)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[BMDSLJSONCoder _jsonEncodeArray:forKey:]();
        }
        goto LABEL_21;
      }
      id v15 = v21;

      id v8 = v15;
    }
    if (!v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BMDSLJSONCoder _jsonEncodeArray:forKey:]();
      }
LABEL_21:
      id v17 = *a3;
      *a3 = 0;

      goto LABEL_22;
    }
    [v10 setObject:v22 atIndexedSubscript:i];
    char v13 = 1;
LABEL_12:
  }
  if ((v13 & 1) == 0) {
    goto LABEL_16;
  }
  objc_storeStrong(a3, v10);
  if (self->_allowKeyModifications) {
    objc_storeStrong(a4, v8);
  }
LABEL_22:
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (BOOL)_jsonEncodeObject:(id *)a3 forKey:(id *)a4
{
  if (!a3)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 313, @"Invalid parameter not satisfying: %@", @"objectRef" object file lineNumber description];
  }
  id v7 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = [(BMDSLJSONCoder *)self _jsonEncodeArray:a3 forKey:a4];
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = objc_msgSend(v7, "bmdsl_replacementObjectForArchivingWithUserInfo:", self->_userInfo);

      id v7 = (id)v10;
    }
    uint64_t v11 = objc_opt_class();
    char v12 = [(id)objc_opt_class() hasNativeSupportForClass:v11];
    if (v12)
    {
LABEL_32:
      char v9 = v12 ^ 1;
      goto LABEL_33;
    }
    if (objc_opt_respondsToSelector())
    {
      char v13 = objc_msgSend(v11, "bmdsl_jsonEncodingDescriptor");
      if (v13)
      {
        v14 = [(id)JSONTransformerNamesByEncodingDescriptor objectForKeyedSubscript:v13];
        id v15 = [MEMORY[0x1E4F29248] valueTransformerForName:v14];
        BOOL v16 = [v15 transformedValue:v7];
        id v17 = *a3;
        *a3 = v16;

        if (a4 && self->_allowKeyModifications)
        {
          id v18 = [(BMDSLJSONCoder *)self buildKeyFromEncodingDescriptor:v13 originalKey:*a4];
          id v19 = *a4;
          *a4 = v18;
        }
        [(BMDSLJSONCoder *)self _jsonEncodeObject:a3 forKey:0];

        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BMDSLJSONCoder _jsonEncodeObject:forKey:]();
      }
    }
    else
    {
      if (!self->_allowSecureCodingObjects
        || (objc_opt_respondsToSelector() & 1) == 0
        || ![v11 supportsSecureCoding])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[BMDSLJSONCoder _jsonEncodeObject:forKey:]((uint64_t)a4, (uint64_t)v7, v25, v26, v27, v28, v29, v30);
        }
        char v13 = *a3;
        *a3 = 0;
        goto LABEL_31;
      }
      char v13 = NSStringFromClass((Class)v11);
      if (+[BMDSLJSONAllowedClasses classFromString:v13])
      {
        id v20 = [MEMORY[0x1E4F1CA60] dictionary];
        [(BMDSLJSONCoder *)self push:v20];

        [v7 encodeWithCoder:self];
        id v21 = [(BMDSLJSONCoder *)self pop];
        id v22 = *a3;
        *a3 = v21;

        if (a4 && self->_allowKeyModifications)
        {
          v23 = -[BMDSLJSONCoder buildKeyFromClass:originalKey:](self, "buildKeyFromClass:originalKey:", [v7 classForCoder], *a4);
          id v24 = *a4;
          *a4 = v23;
        }
        [(BMDSLJSONCoder *)self _jsonEncodeDictionary:a3 forKey:0];
        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BMDSLJSONCoder _jsonEncodeObject:forKey:]();
      }
    }
    id v31 = *a3;
    *a3 = 0;

LABEL_31:
    goto LABEL_32;
  }
  BOOL v8 = [(BMDSLJSONCoder *)self _jsonEncodeDictionary:a3 forKey:a4];
LABEL_7:
  char v9 = v8;
LABEL_33:

  return v9;
}

- (id)buildKeyFromEncodingDescriptor:(id)a3 originalKey:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@", a4, @"<", a3, @">"];
}

- (id)buildKeyFromClass:(Class)a3 originalKey:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@%@%@%@%@", a4, @"<", @"@", a3, @">"];
}

- (_NSRange)encodingDescriptorRangeInKey:(id)a3
{
  id v3 = a3;
  if (![v3 hasSuffix:@">"]
    || (uint64_t v4 = [v3 rangeOfString:@"<"], v4 == 0x7FFFFFFFFFFFFFFFLL)
    || (uint64_t v5 = v4, v6 = [v3 length], v7 = v6 + ~v5 - objc_msgSend(@">", "length"), v7 <= 0))
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = v5 + 1;
  }

  NSUInteger v9 = v8;
  NSUInteger v10 = v7;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)encodingDescriptorFromKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasSuffix:@">"]
    && (uint64_t v5 = [(BMDSLJSONCoder *)self encodingDescriptorRangeInKey:v4],
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)keyWithoutEncodingDescriptor:(id)a3
{
  id v4 = a3;
  if (([v4 hasSuffix:@">"] & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v5 = [(BMDSLJSONCoder *)self encodingDescriptorRangeInKey:v4];
  if (!v5)
  {
    uint64_t v7 = &stru_1F0B32A50;
    goto LABEL_8;
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [v4 substringToIndex:v5 - 1];
  }
  else
  {
LABEL_4:
    uint64_t v6 = (__CFString *)v4;
  }
  uint64_t v7 = v6;
LABEL_8:

  return v7;
}

- (Class)classFromEncodingDescriptor:(id)a3
{
  id v3 = a3;
  if (![v3 hasPrefix:@"@"])
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  id v4 = [v3 substringFromIndex:1];
  uint64_t v5 = +[BMDSLJSONAllowedClasses classFromString:v4];
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BMDSLJSONCoder classFromEncodingDescriptor:]();
    }
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(objc_class *)v6 supportsSecureCoding])
  {
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = v6;
LABEL_10:

LABEL_11:
  return v7;
}

- (BOOL)_jsonDecodeDictionary:(id *)a3 asClass:(Class)a4
{
  if (!a3)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 464, @"Invalid parameter not satisfying: %@", @"dictionaryRef" object file lineNumber description];
  }
  id v8 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 466, @"Invalid parameter not satisfying: %@", @"[dictionary isKindOfClass:NSMutableDictionary.class]" object file lineNumber description];

    if (a4) {
      goto LABEL_5;
    }
LABEL_7:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 467, @"Invalid parameter not satisfying: %@", @"class" object file lineNumber description];

    goto LABEL_5;
  }
  if (!a4) {
    goto LABEL_7;
  }
LABEL_5:
  [(BMDSLJSONCoder *)self push:v8];
  NSUInteger v9 = (void *)[[a4 alloc] initWithCoder:self];
  id v10 = *a3;
  *a3 = v9;

  id v11 = [(BMDSLJSONCoder *)self pop];
  return 1;
}

- (BOOL)_jsonDecodeObject:(id *)a3 encodingDescriptor:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(BMDSLJSONCoder *)self classFromEncodingDescriptor:v6];
  if (!v7)
  {
    id v9 = [(id)JSONTransformerNamesByEncodingDescriptor objectForKeyedSubscript:v6];
    id v11 = [MEMORY[0x1E4F29248] valueTransformerForName:v9];
    if (v11)
    {
      id v12 = *a3;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(BMDSLJSONCoder *)self _jsonDecodeDictionary:a3 forKey:0];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(BMDSLJSONCoder *)self _jsonDecodeArray:a3 forKey:0];
        }
      }
      id v15 = [v11 reverseTransformedValue:*a3];
      id v16 = *a3;
      *a3 = v15;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:]();
      }
      id v14 = *a3;
      *a3 = 0;
    }
    goto LABEL_21;
  }
  if (!self->_allowSecureCodingObjects)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:]();
    }
    id v9 = *a3;
    *a3 = 0;
    goto LABEL_21;
  }
  id v8 = v7;
  id v9 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:]();
    }
    id v13 = *a3;
    *a3 = 0;

LABEL_21:
    BOOL v10 = 1;
    goto LABEL_22;
  }
  [(BMDSLJSONCoder *)self _jsonDecodeDictionary:a3 forKey:0];
  BOOL v10 = [(BMDSLJSONCoder *)self _jsonDecodeDictionary:a3 asClass:v8];
LABEL_22:

  return v10;
}

- (BOOL)_jsonDecodeObject:(id *)a3 forKey:(id *)a4
{
  if (!a3)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 529, @"Invalid parameter not satisfying: %@", @"objectRef" object file lineNumber description];
  }
  id v7 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4) {
      id v9 = *a4;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    id v11 = [(BMDSLJSONCoder *)self encodingDescriptorFromKey:v10];
    if (v11)
    {
      if (a4 && self->_allowKeyModifications)
      {
        id v12 = [(BMDSLJSONCoder *)self keyWithoutEncodingDescriptor:v10];
        id v13 = *a4;
        *a4 = v12;
      }
      BOOL v14 = [(BMDSLJSONCoder *)self _jsonDecodeObject:a3 encodingDescriptor:v11];
    }
    else
    {
      id v15 = objc_opt_class();
      if ([v15 hasNativeSupportForClass:objc_opt_class()])
      {
        BOOL v8 = 0;
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[BMDSLJSONCoder _jsonDecodeObject:forKey:]();
        }
        id v16 = *a3;
        *a3 = 0;

        BOOL v8 = 1;
        goto LABEL_21;
      }
      BOOL v14 = [(BMDSLJSONCoder *)self _jsonDecodeDictionary:a3 forKey:a4];
    }
    BOOL v8 = v14;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v8 = [(BMDSLJSONCoder *)self _jsonDecodeArray:a3 forKey:a4];
LABEL_22:

  return v8;
}

- (BOOL)_jsonDecodeDictionary:(id *)a3 forKey:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4);
    [v23 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 564, @"Invalid parameter not satisfying: %@", @"dictionaryRef" object file lineNumber description];
  }
  id v7 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 566, @"Invalid parameter not satisfying: %@", @"[dictionary isKindOfClass:NSMutableDictionary.class]" object file lineNumber description];
  }
  BOOL v8 = [v7 allKeys];
  uint64_t v9 = [v8 count];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v25 = v9;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v17 = [v7 objectForKeyedSubscript:v16];
          id v18 = v16;
          id v27 = v18;
          id v19 = v17;
          id v26 = v19;
          if ([(BMDSLJSONCoder *)self _jsonDecodeObject:&v26 forKey:&v27])
          {
            if (v27 != v18)
            {
              [v7 setObject:0 forKeyedSubscript:v18];
              id v18 = v27;
            }
            [v7 setObject:v26 forKeyedSubscript:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    uint64_t v10 = v25;
  }
  else
  {
    id v20 = objc_opt_new();
    id v21 = *a3;
    *a3 = v20;
  }
  return v10 == 0;
}

- (BOOL)_jsonDecodeArray:(id *)a3 forKey:(id *)a4
{
  if (!a3)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 593, @"Invalid parameter not satisfying: %@", @"arrayRef" object file lineNumber description];
  }
  id v8 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BMDSLJSONArchiver.m", 595, @"Invalid parameter not satisfying: %@", @"[array isKindOfClass:NSMutableArray.class]" object file lineNumber description];
  }
  if ([v8 count])
  {
    if (a4) {
      id v9 = *a4;
    }
    else {
      id v9 = 0;
    }
    id v13 = v9;
    uint64_t v14 = [v8 count];
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0; v15 != i; ++i)
      {
        id v24 = [v8 objectAtIndexedSubscript:i];
        id v23 = v13;
        if ([(BMDSLJSONCoder *)self _jsonDecodeObject:&v24 forKey:&v23])
        {
          if (!v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[BMDSLJSONCoder _jsonDecodeArray:forKey:]();
            }
            id v19 = *a3;
            *a3 = 0;

            id v18 = v24;
LABEL_25:

            BOOL v12 = 1;
            goto LABEL_26;
          }
          [v8 setObject:v24 atIndexedSubscript:i];
        }
      }
    }
    if (v13)
    {
      id v17 = [(BMDSLJSONCoder *)self keyWithoutEncodingDescriptor:v13];
      if (v17 != v13 && self->_allowKeyModifications)
      {
        id v18 = *a4;
        *a4 = v17;
        goto LABEL_25;
      }
    }
    BOOL v12 = 0;
LABEL_26:
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    id v11 = *a3;
    *a3 = v10;

    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  int valuePtr = 0;
  CFNumberRef v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr);

  return valuePtr;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t valuePtr = 0;
  CFNumberRef v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);

  return valuePtr;
}

- (float)decodeFloatForKey:(id)a3
{
  CFNumberRef v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (double)decodeDoubleForKey:(id)a3
{
  CFNumberRef v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  CFNumberRef v3 = [(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_currentDictionary objectForKeyedSubscript:a3];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)self->_currentDictionary setObject:v8 forKeyedSubscript:v7];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(NSMutableDictionary *)self->_currentDictionary setObject:v8 forKeyedSubscript:v7];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  int valuePtr = a3;
  id v5 = a4;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  [(NSMutableDictionary *)self->_currentDictionary setObject:v6 forKeyedSubscript:v5];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  int64_t valuePtr = a3;
  id v5 = a4;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  [(NSMutableDictionary *)self->_currentDictionary setObject:v6 forKeyedSubscript:v5];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  CFNumberRef v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NSMutableDictionary *)self->_currentDictionary setObject:v8 forKeyedSubscript:v7];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  CFNumberRef v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(NSMutableDictionary *)self->_currentDictionary setObject:v9 forKeyedSubscript:v7];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  CFNumberRef v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(NSMutableDictionary *)self->_currentDictionary setObject:v8 forKeyedSubscript:v7];
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_currentDictionary, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (void)decodeRootObjectFromData:(void *)a1 .cold.1(void *a1)
{
  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_1_1(&dword_1B3086000, MEMORY[0x1E4F14500], v1, "Failed to decode json from data, %@, exception, %@", v2, v3, v4, v5, 2u);
  }
  objc_end_catch();
}

- (void)decodeRootObjectFromData:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Failed to decode json from data, %@, error, %@", v1, v2, v3, v4, v5);
}

- (void)encodeDataFromRootObject:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_1B3086000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to json encode object, %@, intermediate, %@, error, %@", v2, 0x20u);
}

- (void)_jsonEncodeArray:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Failed to encode array, %@, reason, one or more elements were encoded as nil", v1, v2, v3, v4, v5);
}

- (void)_jsonEncodeArray:forKey:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Failed to encode array, %@, reason, contained multiple non-json-native types", v1, v2, v3, v4, v5);
}

- (void)_jsonEncodeObject:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Class %@ conforming to BMDSLCustomJSONArchiving must have a non-nil json encoding descriptor.", v1, v2, v3, v4, v5);
}

- (void)_jsonEncodeObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_jsonEncodeObject:forKey:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Encoding non-BiomeDSL class (%@) is not allowed.", v1, v2, v3, v4, v5);
}

- (void)classFromEncodingDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Decoding non-BiomeDSL class (%@) is not allowed.", v1, v2, v3, v4, v5);
}

- (void)_jsonDecodeObject:encodingDescriptor:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_1B3086000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to find transformer for encoding descriptor, %@, object, %@, transformer name, %@", v2, 0x20u);
}

- (void)_jsonDecodeObject:encodingDescriptor:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Secure coding is disabled. Unable to decode encoding descriptor, %@, object, %@", v1, v2, v3, v4, v5);
}

- (void)_jsonDecodeObject:encodingDescriptor:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Encoundered incorrect type when expecting mutable dictionary, encoding descriptor, %@, object, %@", v1, v2, v3, v4, v5);
}

- (void)_jsonDecodeObject:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Key object pair didn't match known decoding strategy, key, %@, object, %@", v1, v2, v3, v4, v5);
}

- (void)_jsonDecodeArray:forKey:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1B3086000, MEMORY[0x1E4F14500], v0, "Failed to decode array, %@, reason, one or more elements were decoded as nil", v1, v2, v3, v4, v5);
}

@end