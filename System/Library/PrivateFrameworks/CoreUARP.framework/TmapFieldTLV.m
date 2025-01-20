@interface TmapFieldTLV
+ (BOOL)supportsSecureCoding;
- (BOOL)createFieldType:(id)a3;
- (BOOL)expandEncodedString:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandFieldData:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandFieldData:(id)a3 withOffset:(unint64_t)a4 inCoreAnalytics:(id)a5;
- (BOOL)expandFloat:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandInteger:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandString:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandUnsignedInteger:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)getNextOffset:(unint64_t *)a3 fromStart:(unint64_t)a4;
- (TmapFieldTLV)init;
- (TmapFieldTLV)initWithCoder:(id)a3;
- (TmapFieldTLV)initWithDictionary:(id)a3 endian:(id)a4;
- (id)bigEndianSwap:(id)a3;
- (id)endianSwap:(id)a3;
- (id)littleEndianSwap:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TmapFieldTLV

- (TmapFieldTLV)init
{
  return 0;
}

- (TmapFieldTLV)initWithDictionary:(id)a3 endian:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TmapFieldTLV;
  id v8 = [(TmapFieldTLV *)&v19 init];
  if (!v8) {
    goto LABEL_8;
  }
  os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  v10 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v9;

  v11 = [v6 objectForKeyedSubscript:@"FieldName"];
  uint64_t v12 = [v11 copy];
  v13 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v12;

  if (!*((void *)v8 + 1))
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:]();
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:].cold.4();
    }
    goto LABEL_19;
  }
  v14 = [v6 objectForKeyedSubscript:@"FieldLength"];
  if (!v14)
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:]();
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:]();
    }
    goto LABEL_18;
  }
  *((void *)v8 + 2) = [v14 unsignedIntValue];
  v15 = [v6 objectForKeyedSubscript:@"FieldType"];
  v16 = (void *)[v15 copy];

  if (![v8 createFieldType:v16])
  {

LABEL_18:
LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  *((_DWORD *)v8 + 7) = [v7 isEqualToString:@"LittleEndian"];

LABEL_8:
  v17 = (TmapFieldTLV *)v8;
LABEL_20:

  return v17;
}

- (BOOL)createFieldType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Integer"])
  {
    self->_fieldType = 0;
LABEL_12:
    BOOL v5 = 1;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"UnsignedInteger"])
  {
    BOOL v5 = 1;
    self->_fieldType = 1;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"UTF8String"])
  {
    int v6 = 2;
LABEL_11:
    self->_fieldType = v6;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Base64EncodedString"])
  {
    int v6 = 3;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Float"])
  {
    int v6 = 4;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    -[TmapFieldTLV createFieldType:]();
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (TmapFieldTLV)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TmapFieldTLV;
  BOOL v5 = [(TmapFieldTLV *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FieldName"];
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v6;

    v5->_fieldLength = [v4 decodeIntegerForKey:@"FieldLength"];
    v5->_fieldType = [v4 decodeIntegerForKey:@"FieldType"];
    v5->_endian = [v4 decodeIntegerForKey:@"Endian"];
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fieldName = self->_fieldName;
  id v5 = a3;
  [v5 encodeObject:fieldName forKey:@"FieldName"];
  [v5 encodeInteger:self->_fieldLength forKey:@"FieldLength"];
  [v5 encodeInteger:self->_fieldType forKey:@"FieldType"];
  [v5 encodeInteger:self->_endian forKey:@"Endian"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)expandFieldData:(id)a3 withOffset:(unint64_t)a4 inCoreAnalytics:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  unint64_t fieldLength = self->_fieldLength;
  if (__CFADD__(a4, fieldLength))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:]();
    }
    goto LABEL_15;
  }
  if (fieldLength + a4 > [v8 length])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = log;
      uint64_t v13 = [v8 length];
      unint64_t v14 = self->_fieldLength + a4;
      int v18 = 134218240;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      unint64_t v21 = v14;
      _os_log_error_impl(&dword_21E079000, v12, OS_LOG_TYPE_ERROR, "Length of MTIC Data(%lu) and Expected TMAP Data(%lu) do not match ", (uint8_t *)&v18, 0x16u);
    }
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:]();
    }
    goto LABEL_15;
  }
  if (!self->_fieldName)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:]();
    }
    goto LABEL_15;
  }
  v15 = objc_msgSend(v8, "subdataWithRange:", a4, self->_fieldLength);
  BOOL v16 = [(TmapFieldTLV *)self expandFieldData:v15 inCoreAnalytics:v9];

LABEL_16:
  return v16;
}

- (BOOL)expandFieldData:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int fieldType = self->_fieldType;
  if (fieldType == 3)
  {
    BOOL v9 = [(TmapFieldTLV *)self expandEncodedString:v6 inCoreAnalytics:v7];
    goto LABEL_5;
  }
  if (fieldType == 2)
  {
    BOOL v9 = [(TmapFieldTLV *)self expandString:v6 inCoreAnalytics:v7];
LABEL_5:
    BOOL v10 = v9;
    goto LABEL_18;
  }
  objc_super v11 = [(TmapFieldTLV *)self endianSwap:v6];
  uint64_t v12 = v11;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:inCoreAnalytics:]();
    }
    BOOL v10 = 0;
    goto LABEL_17;
  }
  int v13 = self->_fieldType;
  switch(v13)
  {
    case 4:
      BOOL v14 = [(TmapFieldTLV *)self expandFloat:v11 inCoreAnalytics:v7];
      goto LABEL_16;
    case 1:
      BOOL v14 = [(TmapFieldTLV *)self expandUnsignedInteger:v11 inCoreAnalytics:v7];
      goto LABEL_16;
    case 0:
      BOOL v14 = [(TmapFieldTLV *)self expandInteger:v11 inCoreAnalytics:v7];
LABEL_16:
      BOOL v10 = v14;
LABEL_17:

      goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    -[TmapFieldTLV expandFieldData:inCoreAnalytics:]();
  }
  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)getNextOffset:(unint64_t *)a3 fromStart:(unint64_t)a4
{
  unint64_t fieldLength = self->_fieldLength;
  BOOL v5 = __CFADD__(a4, fieldLength);
  if (!__CFADD__(a4, fieldLength)) {
    *a3 = fieldLength + a4;
  }
  return !v5;
}

- (id)endianSwap:(id)a3
{
  if (self->_endian == 1) {
    [(TmapFieldTLV *)self littleEndianSwap:a3];
  }
  else {
  v3 = [(TmapFieldTLV *)self bigEndianSwap:a3];
  }
  return v3;
}

- (id)bigEndianSwap:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  switch(self->_fieldLength)
  {
    case 1uLL:
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithData:v4];
      goto LABEL_10;
    case 2uLL:
      LOWORD(v12) = 0;
      [v4 getBytes:&v12 length:2];
      LOWORD(v11) = bswap32((unsigned __int16)v12) >> 16;
      id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
      uint64_t v8 = 2;
      goto LABEL_9;
    case 4uLL:
      LODWORD(v12) = 0;
      [v4 getBytes:&v12 length:4];
      LODWORD(v11) = bswap32(v12);
      id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
      uint64_t v8 = 4;
      goto LABEL_9;
    case 8uLL:
      unint64_t v12 = 0;
      [v4 getBytes:&v12 length:8];
      unint64_t v11 = bswap64(v12);
      id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
      uint64_t v8 = 8;
LABEL_9:
      uint64_t v6 = objc_msgSend(v7, "initWithBytes:length:", &v11, v8, v11);
LABEL_10:
      BOOL v9 = (void *)v6;
      break;
    default:
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV bigEndianSwap:]();
      }
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (id)littleEndianSwap:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  switch(self->_fieldLength)
  {
    case 1uLL:
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithData:v4];
      goto LABEL_10;
    case 2uLL:
      LOWORD(v10) = 0;
      [v4 getBytes:&v10 length:2];
      LOWORD(v9) = v10;
      goto LABEL_9;
    case 4uLL:
      LODWORD(v10) = 0;
      [v4 getBytes:&v10 length:4];
      LODWORD(v9) = v10;
      goto LABEL_9;
    case 8uLL:
      uint64_t v10 = 0;
      [v4 getBytes:&v10 length:8];
      uint64_t v9 = v10;
LABEL_9:
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v9 length:self->_fieldLength];
LABEL_10:
      id v7 = (void *)v6;
      break;
    default:
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV bigEndianSwap:]();
      }
      id v7 = 0;
      break;
  }

  return v7;
}

- (BOOL)expandInteger:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_unint64_t fieldLength = (uint64_t *)&self->_fieldLength;
  switch(self->_fieldLength)
  {
    case 1uLL:
      char v18 = 0;
      BOOL v9 = 1;
      [v6 getBytes:&v18 length:1];
      uint64_t v10 = [NSNumber numberWithChar:v18];
      [v7 setObject:v10 forKeyedSubscript:self->_fieldName];

      break;
    case 2uLL:
      __int16 v17 = 0;
      [v6 getBytes:&v17 length:2];
      uint64_t v11 = [NSNumber numberWithShort:v17];
      goto LABEL_9;
    case 4uLL:
      unsigned int v16 = 0;
      [v6 getBytes:&v16 length:4];
      uint64_t v11 = [NSNumber numberWithInt:v16];
      goto LABEL_9;
    case 8uLL:
      uint64_t v15 = 0;
      [v6 getBytes:&v15 length:8];
      uint64_t v11 = [NSNumber numberWithLongLong:v15];
LABEL_9:
      int v13 = (void *)v11;
      [v7 setObject:v11 forKeyedSubscript:self->_fieldName];

      BOOL v9 = 1;
      break;
    default:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV expandInteger:inCoreAnalytics:](p_fieldLength, log);
      }
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)expandUnsignedInteger:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_unint64_t fieldLength = (uint64_t *)&self->_fieldLength;
  switch(self->_fieldLength)
  {
    case 1uLL:
      unsigned __int8 v18 = 0;
      BOOL v9 = 1;
      [v6 getBytes:&v18 length:1];
      uint64_t v10 = [NSNumber numberWithUnsignedChar:v18];
      [v7 setObject:v10 forKeyedSubscript:self->_fieldName];

      break;
    case 2uLL:
      unsigned __int16 v17 = 0;
      [v6 getBytes:&v17 length:2];
      uint64_t v11 = [NSNumber numberWithUnsignedShort:v17];
      goto LABEL_9;
    case 4uLL:
      unsigned int v16 = 0;
      [v6 getBytes:&v16 length:4];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v16];
      goto LABEL_9;
    case 8uLL:
      uint64_t v15 = 0;
      [v6 getBytes:&v15 length:8];
      uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v15];
LABEL_9:
      int v13 = (void *)v11;
      [v7 setObject:v11 forKeyedSubscript:self->_fieldName];

      BOOL v9 = 1;
      break;
    default:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV expandUnsignedInteger:inCoreAnalytics:](p_fieldLength, log);
      }
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)expandFloat:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t fieldLength = self->_fieldLength;
  if (fieldLength == 8)
  {
    double v14 = 0.0;
    [v6 getBytes:&v14 length:8];
    uint64_t v10 = [NSNumber numberWithDouble:v14];
    goto LABEL_5;
  }
  if (fieldLength == 4)
  {
    int v15 = 0;
    [v6 getBytes:&v15 length:4];
    LODWORD(v9) = v15;
    uint64_t v10 = [NSNumber numberWithFloat:v9];
LABEL_5:
    uint64_t v11 = (void *)v10;
    [v7 setObject:v10 forKeyedSubscript:self->_fieldName];

    BOOL v12 = 1;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    -[TmapFieldTLV expandFloat:inCoreAnalytics:]();
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)expandString:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)NSString;
  id v8 = a3;
  double v9 = (void *)[[v7 alloc] initWithData:v8 encoding:4];

  uint64_t v10 = NSString;
  id v11 = v9;
  BOOL v12 = objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "UTF8String"));
  if (v12)
  {
    [v6 setObject:v12 forKeyedSubscript:self->_fieldName];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[TmapFieldTLV expandString:inCoreAnalytics:]();
  }

  return v12 != 0;
}

- (BOOL)expandEncodedString:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a4;
  id v7 = [a3 base64EncodedStringWithOptions:0];
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:self->_fieldName];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[TmapFieldTLV expandEncodedString:inCoreAnalytics:]();
  }

  return v7 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (void)initWithDictionary:endian:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "TMAP Event must have Field Name.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:endian:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "TMAP Event must have Field Length.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:endian:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "TMAP Field Length must be Number.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:endian:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "TMAP Field Name must be String.", v2, v3, v4, v5, v6);
}

- (void)createFieldType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "TMAP Field Type not supported.", v2, v3, v4, v5, v6);
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "MTIC Event Data Offset + Field Length causes overflow.", v2, v3, v4, v5, v6);
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "CA Dictionary is not defined.", v2, v3, v4, v5, v6);
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Field Name is not defined.", v2, v3, v4, v5, v6);
}

- (void)expandFieldData:inCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Failed to Endian Swap Data.", v2, v3, v4, v5, v6);
}

- (void)expandFieldData:inCoreAnalytics:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "MTIC Field Type not defined.", v2, v3, v4, v5, v6);
}

- (void)bigEndianSwap:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Cannot Endian Flip provided Length.", v2, v3, v4, v5, v6);
}

- (void)expandInteger:(uint64_t *)a1 inCoreAnalytics:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Integer must be length: 1, 2, 4, or 8; not: %lu",
    (uint8_t *)&v3,
    0xCu);
}

- (void)expandUnsignedInteger:(uint64_t *)a1 inCoreAnalytics:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Unsigned Integer must be length: 1, 2, 4, or 8; not: %lu",
    (uint8_t *)&v3,
    0xCu);
}

- (void)expandFloat:inCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Floats can only be 4 or 8 Bytes.", v2, v3, v4, v5, v6);
}

- (void)expandString:inCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "MTIC Event Data isn't string.", v2, v3, v4, v5, v6);
}

- (void)expandEncodedString:inCoreAnalytics:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "MTIC Event Data isn't encoded string.", v2, v3, v4, v5, v6);
}

@end