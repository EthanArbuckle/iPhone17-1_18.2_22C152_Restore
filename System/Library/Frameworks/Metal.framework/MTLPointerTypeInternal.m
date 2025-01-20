@interface MTLPointerTypeInternal
- (BOOL)elementIsArgumentBuffer;
- (BOOL)elementIsIndirectArgumentBuffer;
- (BOOL)isConstantBuffer;
- (BOOL)isEqual:(id)a3;
- (MTLPointerTypeInternal)initWithElementType:(unint64_t)a3 elementTypeDescription:(id)a4 access:(unint64_t)a5 alignment:(unint64_t)a6 dataSize:(unint64_t)a7 elementIsIndirectArgumentBuffer:(BOOL)a8 isConstantBuffer:(BOOL)a9;
- (MTLPointerTypeInternal)initWithElementType:(unint64_t)a3 elementTypeDescription:(id)a4 access:(unint64_t)a5 alignment:(unint64_t)a6 dataSize:(unint64_t)a7 elementIsIndirectArgumentBuffer:(BOOL)a8 isConstantBuffer:(BOOL)a9 doRetain:(BOOL)a10;
- (id)elementArrayType;
- (id)elementStructType;
- (id)elementTypeDescription;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (unint64_t)access;
- (unint64_t)alignment;
- (unint64_t)dataSize;
- (unint64_t)dataType;
- (unint64_t)elementType;
- (void)dealloc;
- (void)setAlignment:(unint64_t)a3 dataSize:(unint64_t)a4;
@end

@implementation MTLPointerTypeInternal

- (BOOL)elementIsIndirectArgumentBuffer
{
  return self->_elementIsArgumentBuffer;
}

- (MTLPointerTypeInternal)initWithElementType:(unint64_t)a3 elementTypeDescription:(id)a4 access:(unint64_t)a5 alignment:(unint64_t)a6 dataSize:(unint64_t)a7 elementIsIndirectArgumentBuffer:(BOOL)a8 isConstantBuffer:(BOOL)a9
{
  BYTE1(v10) = 1;
  LOBYTE(v10) = a9;
  return -[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:](self, "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:", a3, a4, a5, a6, a7, a8, v10);
}

- (MTLPointerTypeInternal)initWithElementType:(unint64_t)a3 elementTypeDescription:(id)a4 access:(unint64_t)a5 alignment:(unint64_t)a6 dataSize:(unint64_t)a7 elementIsIndirectArgumentBuffer:(BOOL)a8 isConstantBuffer:(BOOL)a9 doRetain:(BOOL)a10
{
  v18.receiver = self;
  v18.super_class = (Class)MTLPointerTypeInternal;
  v16 = [(MTLPointerTypeInternal *)&v18 init];
  v16->_dataType = 60;
  v16->_elementType = a3;
  v16->_doRetain = a10;
  if (a10) {
    a4 = a4;
  }
  v16->_elementTypeInfo = (MTLType *)a4;
  v16->_access = a5;
  v16->_alignment = a6;
  v16->_dataSize = a7;
  v16->_elementIsArgumentBuffer = a8;
  v16->_isConstantBuffer = a9;
  return v16;
}

- (void)dealloc
{
  if (self->_doRetain) {

  }
  v3.receiver = self;
  v3.super_class = (Class)MTLPointerTypeInternal;
  [(MTLPointerTypeInternal *)&v3 dealloc];
}

- (BOOL)isConstantBuffer
{
  return self->_isConstantBuffer;
}

- (id)elementStructType
{
  id result = self->_elementTypeInfo;
  if (result)
  {
    if ([result dataType] == 1) {
      return self->_elementTypeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)elementIsArgumentBuffer
{
  return self->_elementIsArgumentBuffer;
}

- (id)elementTypeDescription
{
  return self->_elementTypeInfo;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setAlignment:(unint64_t)a3 dataSize:(unint64_t)a4
{
  self->_alignment = a3;
  self->_dataSize = a4;
}

- (id)elementArrayType
{
  id result = self->_elementTypeInfo;
  if (result)
  {
    if ([result dataType] == 2) {
      return self->_elementTypeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 + 4;
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v8 = NSString;
  uint64_t v14 = v7;
  v15 = @"DataType =";
  v16 = MTLDataTypeString(self->_dataType);
  uint64_t v17 = v7;
  objc_super v18 = @"ElementType =";
  v19 = MTLDataTypeString(self->_elementType);
  elementTypeInfo = self->_elementTypeInfo;
  if (elementTypeInfo) {
    uint64_t v10 = (__CFString *)[v8 stringWithFormat:@"%@ ElementTypeDescription = %@", v7, -[MTLType formattedDescription:withPrintedTypes:](elementTypeInfo, "formattedDescription:withPrintedTypes:", v6, a4), v14, v15, v16, v17, v18, v19];
  }
  else {
    uint64_t v10 = &stru_1ECAC84A8;
  }
  v20 = v10;
  uint64_t v21 = v7;
  v22 = @"Access =";
  unint64_t access = self->_access;
  if (access > 2) {
    v12 = @"Unknown";
  }
  else {
    v12 = off_1E5221D88[access];
  }
  v23 = v12;
  uint64_t v24 = v7;
  v25 = @"Alignment =";
  uint64_t v26 = [NSNumber numberWithUnsignedInteger:self->_alignment];
  uint64_t v27 = v7;
  v28 = @"DataSize =";
  uint64_t v29 = [NSNumber numberWithUnsignedInteger:self->_dataSize];
  uint64_t v30 = v7;
  v31 = @"ConstantBuffer = ";
  uint64_t v32 = [NSNumber numberWithBool:self->_isConstantBuffer];
  return (id)[v8 stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v14, 19), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_dataType != *((void *)a3 + 1)
    || self->_elementType != *((void *)a3 + 2))
  {
    goto LABEL_12;
  }
  elementTypeInfo = self->_elementTypeInfo;
  if (!((unint64_t)elementTypeInfo | *((void *)a3 + 3))
    || (int v6 = -[MTLType isEqual:](elementTypeInfo, "isEqual:")) != 0)
  {
    if (self->_access == *((void *)a3 + 4)
      && self->_alignment == *((void *)a3 + 5)
      && self->_dataSize == *((void *)a3 + 6)
      && self->_elementIsArgumentBuffer == *((unsigned __int8 *)a3 + 56))
    {
      LOBYTE(v6) = self->_isConstantBuffer == *((unsigned __int8 *)a3 + 57);
      return v6;
    }
LABEL_12:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (unint64_t)access
{
  return self->_access;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

@end