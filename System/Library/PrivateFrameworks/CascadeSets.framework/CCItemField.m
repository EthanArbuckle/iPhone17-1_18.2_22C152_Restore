@interface CCItemField
+ (id)_selectorNameForDataType:(unsigned __int8)a3;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasFloatValue;
- (BOOL)hasInt32Value;
- (BOOL)hasInt64Value;
- (BOOL)hasRawEnumValue;
- (BOOL)hasUInt32Value;
- (BOOL)hasUInt64Value;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 BOOLValue:(BOOL)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 bytesValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 dataType:(unsigned __int8)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 doubleValue:(double)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 enumValue:(unsigned int)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 floatValue:(float)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 int32Value:(int)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 int64Value:(int64_t)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedBoolValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedBytesValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedDoubleValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedEnumValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedFloatValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedInt32Value:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedInt64Value:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedStringValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedSubMessageValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedUInt32Value:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedUInt64Value:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 stringValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 subMessageValue:(id)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 uint32Value:(unsigned int)a4;
- (CCItemField)initWithFieldType:(unsigned __int16)a3 uint64Value:(unint64_t)a4;
- (CCItemField)parentMessageField;
- (CCItemFieldValueStorage)valueStorage;
- (NSError)error;
- (NSObject)boxedJSONValue;
- (double)doubleValue;
- (float)floatValue;
- (id)bytesValue;
- (id)bytesValueNoCopy;
- (id)description;
- (id)repeatedBoolValue;
- (id)repeatedBytesValue;
- (id)repeatedBytesValueNoCopy;
- (id)repeatedDoubleValue;
- (id)repeatedFloatValue;
- (id)repeatedInt32Value;
- (id)repeatedInt64Value;
- (id)repeatedRawEnumValue;
- (id)repeatedStringValue;
- (id)repeatedStringValueNoCopy;
- (id)repeatedSubMessageValue;
- (id)repeatedSubMessageValueNoCopy;
- (id)repeatedUInt32Value;
- (id)repeatedUInt64Value;
- (id)stringValue;
- (id)stringValueNoCopy;
- (id)subMessageValue;
- (id)subMessageValueNoCopy;
- (int)int32Value;
- (int64_t)int64Value;
- (unint64_t)uint64Value;
- (unsigned)dataType;
- (unsigned)fieldType;
- (unsigned)rawEnumValue;
- (unsigned)repeatedSubMessageIndex;
- (unsigned)uint32Value;
- (void)appendInvalidFieldAccessErrorForAccessedDataType:(unsigned __int8)a3;
- (void)setParentMessageField:(id)a3;
- (void)setRepeatedSubMessageIndex:(unsigned int)a3;
@end

@implementation CCItemField

+ (id)_selectorNameForDataType:(unsigned __int8)a3
{
  switch(a3)
  {
    case 0u:
      v3 = sel_stringValue;
      goto LABEL_25;
    case 1u:
      v3 = sel_repeatedStringValue;
      goto LABEL_25;
    case 2u:
      v3 = sel_uint32Value;
      goto LABEL_25;
    case 3u:
      v3 = sel_repeatedUInt32Value;
      goto LABEL_25;
    case 4u:
      v3 = sel_uint64Value;
      goto LABEL_25;
    case 5u:
      v3 = sel_repeatedUInt64Value;
      goto LABEL_25;
    case 6u:
      v3 = sel_int32Value;
      goto LABEL_25;
    case 7u:
      v3 = sel_repeatedInt32Value;
      goto LABEL_25;
    case 8u:
      v3 = sel_int64Value;
      goto LABEL_25;
    case 9u:
      v3 = sel_repeatedInt64Value;
      goto LABEL_25;
    case 0xAu:
      v3 = sel_floatValue;
      goto LABEL_25;
    case 0xBu:
      v3 = sel_repeatedFloatValue;
      goto LABEL_25;
    case 0xCu:
      v3 = sel_doubleValue;
      goto LABEL_25;
    case 0xDu:
      v3 = sel_repeatedDoubleValue;
      goto LABEL_25;
    case 0xEu:
      v3 = sel_BOOLValue;
      goto LABEL_25;
    case 0xFu:
      v3 = sel_repeatedBoolValue;
      goto LABEL_25;
    case 0x10u:
      v3 = sel_bytesValue;
      goto LABEL_25;
    case 0x11u:
      v3 = sel_repeatedBytesValue;
      goto LABEL_25;
    case 0x12u:
      v3 = sel_subMessageValue;
      goto LABEL_25;
    case 0x13u:
      v3 = sel_repeatedSubMessageValue;
LABEL_25:
      NSStringFromSelector(v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x14u:
      v4 = @"[your-enum-type-name]EnumValue";
      break;
    case 0x15u:
      v4 = @"repeated[your-enum-type-name]EnumValue";
      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 dataType:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CCItemField;
  result = [(CCItemField *)&v7 init];
  if (result)
  {
    result->_fieldType = a3;
    result->_dataType = a4;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 stringValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:0];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedStringValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:1];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 uint32Value:(unsigned int)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:2];
  if (result)
  {
    result->_valueStorage.value.uint32Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedUInt32Value:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:3];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 uint64Value:(unint64_t)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:4];
  if (result)
  {
    result->_valueStorage.value.uint64Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedUInt64Value:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:5];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 int32Value:(int)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:6];
  if (result)
  {
    result->_valueStorage.value.uint32Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedInt32Value:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:7];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 int64Value:(int64_t)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:8];
  if (result)
  {
    result->_valueStorage.value.uint64Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedInt64Value:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:9];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 floatValue:(float)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:10];
  if (result)
  {
    result->_valueStorage.value.floatValue = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedFloatValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:11];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 doubleValue:(double)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:12];
  if (result)
  {
    result->_valueStorage.value.doubleValue = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedDoubleValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:13];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 BOOLValue:(BOOL)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:14];
  if (result)
  {
    result->_valueStorage.value.BOOLValue = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedBoolValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:15];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 bytesValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:16];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedBytesValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:17];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 subMessageValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:18];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedSubMessageValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:19];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 enumValue:(unsigned int)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:20];
  if (result)
  {
    result->_valueStorage.value.uint32Value = a4;
    result->_valueStorage.hasValue = 1;
  }
  return result;
}

- (CCItemField)initWithFieldType:(unsigned __int16)a3 repeatedEnumValue:(id)a4
{
  result = [(CCItemField *)self initWithFieldType:a3 dataType:21];
  if (a4)
  {
    if (result)
    {
      result->_valueStorage.value.uint64Value = (unint64_t)a4;
      result->_valueStorage.hasValue = 1;
    }
  }
  return result;
}

- (void)setParentMessageField:(id)a3
{
}

- (void)setRepeatedSubMessageIndex:(unsigned int)a3
{
  self->_repeatedSubMessageIndex = a3;
}

- (void)appendInvalidFieldAccessErrorForAccessedDataType:(unsigned __int8)a3
{
  id v11 = [(id)objc_opt_class() _selectorNameForDataType:a3];
  v4 = CCStringFromItemFieldDataType([(CCItemField *)self dataType]);
  v5 = objc_msgSend((id)objc_opt_class(), "_selectorNameForDataType:", -[CCItemField dataType](self, "dataType"));
  v6 = CCTypeIdentifierRegistryBridge();
  objc_super v7 = objc_msgSend(v6, "descriptionForTypeIdentifier:", -[CCItemField fieldType](self, "fieldType"));

  v8 = CCMismatchedFieldAccessorErrorForField(v7, v11, v4, v5);
  CCErrorByJoiningMismatchedFieldAccessorErrorUnderlyingErrors(self->_error, v8);
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  self->_error = v9;
}

- (NSObject)boxedJSONValue
{
  if (self->_valueStorage.hasValue)
  {
    v3 = 0;
    switch([(CCItemField *)self dataType])
    {
      case 0u:
      case 1u:
      case 0x10u:
      case 0x11u:
        v4 = self->_valueStorage.value.stringValue;
        goto LABEL_18;
      case 2u:
      case 0x14u:
        v4 = (NSString *)[objc_alloc(NSNumber) initWithUnsignedInt:self->_valueStorage.value.uint32Value];
        goto LABEL_18;
      case 3u:
        v5 = objc_opt_new();
        stringValue = self->_valueStorage.value.stringValue;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __29__CCItemField_boxedJSONValue__block_invoke;
        v39[3] = &unk_265279D98;
        v3 = v5;
        v40 = v3;
        [stringValue enumerateUInt32ValuesWithBlock:v39];
        objc_super v7 = v40;
        goto LABEL_21;
      case 4u:
        v4 = (NSString *)[objc_alloc(NSNumber) initWithUnsignedLongLong:self->_valueStorage.value.uint64Value];
        goto LABEL_18;
      case 5u:
        v8 = objc_opt_new();
        v9 = self->_valueStorage.value.stringValue;
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __29__CCItemField_boxedJSONValue__block_invoke_2;
        v37[3] = &unk_265279DC0;
        v3 = v8;
        v38 = v3;
        [v9 enumerateUInt64ValuesWithBlock:v37];
        objc_super v7 = v38;
        goto LABEL_21;
      case 6u:
        v4 = (NSString *)[objc_alloc(NSNumber) initWithInt:self->_valueStorage.value.uint32Value];
        goto LABEL_18;
      case 7u:
        v10 = objc_opt_new();
        id v11 = self->_valueStorage.value.stringValue;
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __29__CCItemField_boxedJSONValue__block_invoke_3;
        v35[3] = &unk_265279DE8;
        v3 = v10;
        v36 = v3;
        [v11 enumerateInt32ValuesWithBlock:v35];
        objc_super v7 = v36;
        goto LABEL_21;
      case 8u:
        v4 = (NSString *)[objc_alloc(NSNumber) initWithLongLong:self->_valueStorage.value.uint64Value];
        goto LABEL_18;
      case 9u:
        v12 = objc_opt_new();
        v13 = self->_valueStorage.value.stringValue;
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __29__CCItemField_boxedJSONValue__block_invoke_4;
        v33[3] = &unk_265279E10;
        v3 = v12;
        v34 = v3;
        [v13 enumerateInt64ValuesWithBlock:v33];
        objc_super v7 = v34;
        goto LABEL_21;
      case 0xAu:
        id v14 = objc_alloc(NSNumber);
        LODWORD(v15) = self->_valueStorage.value.uint32Value;
        v4 = (NSString *)[v14 initWithFloat:v15];
        goto LABEL_18;
      case 0xBu:
        v16 = objc_opt_new();
        v17 = self->_valueStorage.value.stringValue;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __29__CCItemField_boxedJSONValue__block_invoke_5;
        v31[3] = &unk_265279E38;
        v3 = v16;
        v32 = v3;
        [v17 enumerateFloatValuesWithBlock:v31];
        objc_super v7 = v32;
        goto LABEL_21;
      case 0xCu:
        v4 = (NSString *)[objc_alloc(NSNumber) initWithDouble:self->_valueStorage.value.doubleValue];
        goto LABEL_18;
      case 0xDu:
        v18 = objc_opt_new();
        v19 = self->_valueStorage.value.stringValue;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __29__CCItemField_boxedJSONValue__block_invoke_6;
        v29[3] = &unk_265279E60;
        v3 = v18;
        v30 = v3;
        [v19 enumerateDoubleValuesWithBlock:v29];
        objc_super v7 = v30;
        goto LABEL_21;
      case 0xEu:
        v4 = (NSString *)[objc_alloc(NSNumber) initWithBool:self->_valueStorage.value.BOOLValue];
LABEL_18:
        v3 = v4;
        break;
      case 0xFu:
        v20 = objc_opt_new();
        v21 = self->_valueStorage.value.stringValue;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __29__CCItemField_boxedJSONValue__block_invoke_7;
        v27[3] = &unk_265279E88;
        v3 = v20;
        v28 = v3;
        [v21 enumerateBoolValuesWithBlock:v27];
        objc_super v7 = v28;
        goto LABEL_21;
      case 0x15u:
        v22 = objc_opt_new();
        v23 = self->_valueStorage.value.stringValue;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __29__CCItemField_boxedJSONValue__block_invoke_8;
        v25[3] = &unk_265279D98;
        v3 = v22;
        v26 = v3;
        [v23 enumerateUInt32ValuesWithBlock:v25];
        objc_super v7 = v26;
LABEL_21:

        break;
      default:
        break;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __29__CCItemField_boxedJSONValue__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:a2];
  [v2 addObject:v3];
}

void __29__CCItemField_boxedJSONValue__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:a2];
  [v2 addObject:v3];
}

void __29__CCItemField_boxedJSONValue__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[objc_alloc(NSNumber) initWithInt:a2];
  [v2 addObject:v3];
}

void __29__CCItemField_boxedJSONValue__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[objc_alloc(NSNumber) initWithLongLong:a2];
  [v2 addObject:v3];
}

void __29__CCItemField_boxedJSONValue__block_invoke_5(uint64_t a1, float a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = a2;
  id v6 = (id)[v4 initWithFloat:v5];
  [v3 addObject:v6];
}

void __29__CCItemField_boxedJSONValue__block_invoke_6(uint64_t a1, double a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[objc_alloc(NSNumber) initWithDouble:a2];
  [v2 addObject:v3];
}

void __29__CCItemField_boxedJSONValue__block_invoke_7(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 addObject:v3];
}

void __29__CCItemField_boxedJSONValue__block_invoke_8(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (id)stringValue
{
  if ([(CCItemField *)self dataType])
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:0];
    id v3 = 0;
  }
  else
  {
    id v3 = (void *)[(NSString *)self->_valueStorage.value.stringValue copy];
  }

  return v3;
}

- (id)repeatedStringValue
{
  if ([(CCItemField *)self dataType] == 1)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_valueStorage.value.uint64Value copyItems:1];
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:1];
    id v3 = 0;
  }

  return v3;
}

- (id)stringValueNoCopy
{
  if ([(CCItemField *)self dataType])
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:0];
    id v3 = 0;
  }
  else
  {
    id v3 = self->_valueStorage.value.stringValue;
  }

  return v3;
}

- (id)repeatedStringValueNoCopy
{
  if ([(CCItemField *)self dataType] == 1)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:1];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasUInt32Value
{
  if ([(CCItemField *)self dataType] == 2) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:2];
  return 0;
}

- (unsigned)uint32Value
{
  if ([(CCItemField *)self dataType] == 2) {
    return self->_valueStorage.value.uint32Value;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:2];
  return 0;
}

- (id)repeatedUInt32Value
{
  if ([(CCItemField *)self dataType] == 3)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:3];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasUInt64Value
{
  if ([(CCItemField *)self dataType] == 4) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:4];
  return 0;
}

- (unint64_t)uint64Value
{
  if ([(CCItemField *)self dataType] == 4) {
    return self->_valueStorage.value.uint64Value;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:4];
  return 0;
}

- (id)repeatedUInt64Value
{
  if ([(CCItemField *)self dataType] == 5)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:5];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasInt32Value
{
  if ([(CCItemField *)self dataType] == 6) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:6];
  return 0;
}

- (int)int32Value
{
  if ([(CCItemField *)self dataType] == 6) {
    return self->_valueStorage.value.int32Value;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:6];
  return 0;
}

- (id)repeatedInt32Value
{
  if ([(CCItemField *)self dataType] == 7)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:7];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasInt64Value
{
  if ([(CCItemField *)self dataType] == 8) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:8];
  return 0;
}

- (int64_t)int64Value
{
  if ([(CCItemField *)self dataType] == 8) {
    return self->_valueStorage.value.int64Value;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:8];
  return 0;
}

- (id)repeatedInt64Value
{
  if ([(CCItemField *)self dataType] == 9)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:9];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasFloatValue
{
  if ([(CCItemField *)self dataType] == 10) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:10];
  return 0;
}

- (float)floatValue
{
  if ([(CCItemField *)self dataType] == 10) {
    return self->_valueStorage.value.floatValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:10];
  return 0.0;
}

- (id)repeatedFloatValue
{
  if ([(CCItemField *)self dataType] == 11)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:11];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasDoubleValue
{
  if ([(CCItemField *)self dataType] == 12) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:12];
  return 0;
}

- (double)doubleValue
{
  if ([(CCItemField *)self dataType] == 12) {
    return self->_valueStorage.value.doubleValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:12];
  return 0.0;
}

- (id)repeatedDoubleValue
{
  if ([(CCItemField *)self dataType] == 13)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:13];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasBoolValue
{
  if ([(CCItemField *)self dataType] == 14) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:14];
  return 0;
}

- (BOOL)BOOLValue
{
  if ([(CCItemField *)self dataType] == 14) {
    return self->_valueStorage.value.BOOLValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:14];
  return 0;
}

- (id)repeatedBoolValue
{
  if ([(CCItemField *)self dataType] == 15)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:14];
    id v3 = 0;
  }

  return v3;
}

- (id)bytesValue
{
  if ([(CCItemField *)self dataType] == 16)
  {
    id v3 = (void *)[(NSString *)self->_valueStorage.value.stringValue copy];
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:16];
    id v3 = 0;
  }

  return v3;
}

- (id)repeatedBytesValue
{
  if ([(CCItemField *)self dataType] == 17)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_valueStorage.value.uint64Value copyItems:1];
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:17];
    id v3 = 0;
  }

  return v3;
}

- (id)bytesValueNoCopy
{
  if ([(CCItemField *)self dataType] == 16)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:16];
    id v3 = 0;
  }

  return v3;
}

- (id)repeatedBytesValueNoCopy
{
  if ([(CCItemField *)self dataType] == 17)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:17];
    id v3 = 0;
  }

  return v3;
}

- (id)subMessageValue
{
  if ([(CCItemField *)self dataType] == 18)
  {
    id v3 = (void *)[(NSString *)self->_valueStorage.value.stringValue copy];
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:18];
    id v3 = 0;
  }

  return v3;
}

- (id)repeatedSubMessageValue
{
  if ([(CCItemField *)self dataType] == 19)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_valueStorage.value.uint64Value copyItems:1];
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:19];
    id v3 = 0;
  }

  return v3;
}

- (id)subMessageValueNoCopy
{
  if ([(CCItemField *)self dataType] == 18)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:18];
    id v3 = 0;
  }

  return v3;
}

- (id)repeatedSubMessageValueNoCopy
{
  if ([(CCItemField *)self dataType] == 19)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:19];
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasRawEnumValue
{
  if ([(CCItemField *)self dataType] == 20) {
    return self->_valueStorage.hasValue;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:20];
  return 0;
}

- (unsigned)rawEnumValue
{
  if ([(CCItemField *)self dataType] == 20) {
    return self->_valueStorage.value.uint32Value;
  }
  [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:20];
  return 0;
}

- (id)repeatedRawEnumValue
{
  if ([(CCItemField *)self dataType] == 21)
  {
    id v3 = self->_valueStorage.value.stringValue;
  }
  else
  {
    [(CCItemField *)self appendInvalidFieldAccessErrorForAccessedDataType:21];
    id v3 = 0;
  }

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = CCTypeIdentifierRegistryBridge();
  objc_super v7 = objc_msgSend(v6, "descriptionForTypeIdentifier:", -[CCItemField fieldType](self, "fieldType"));
  unsigned int v8 = [(CCItemField *)self fieldType];
  v9 = CCStringFromItemFieldDataType([(CCItemField *)self dataType]);
  v10 = [(CCItemField *)self boxedJSONValue];
  id v11 = [(CCItemField *)self parentMessageField];
  v12 = (void *)[v3 initWithFormat:@"%@ - name: %@ fieldType: %hu dataType: %@, value: %@, parentField: %@", v5, v7, v8, v9, v10, v11];

  return v12;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (CCItemField)parentMessageField
{
  return self->_parentMessageField;
}

- (unsigned)repeatedSubMessageIndex
{
  return self->_repeatedSubMessageIndex;
}

- (CCItemFieldValueStorage)valueStorage
{
  v2.stringValue = (NSString *)self->_valueStorage.value;
  uint64_t v3 = *(void *)&self->_valueStorage.hasValue;
  result.value = v2;
  result.hasValue = v3;
  return result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_parentMessageField, 0);
}

@end