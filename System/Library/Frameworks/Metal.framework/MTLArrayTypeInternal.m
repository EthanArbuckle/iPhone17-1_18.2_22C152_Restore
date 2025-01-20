@interface MTLArrayTypeInternal
- (BOOL)isArrayLayoutThreadSafeWith:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndirectArgumentBuffer;
- (MTLArrayTypeInternal)initWithArrayLength:(unint64_t)a3 elementType:(unint64_t)a4 stride:(unint64_t)a5 pixelFormat:(unint64_t)a6 aluType:(unint64_t)a7 details:(id)a8;
- (id)elementArrayType;
- (id)elementIndirectArgumentType;
- (id)elementPointerType;
- (id)elementStructType;
- (id)elementTextureReferenceType;
- (id)elementTypeDescription;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (unint64_t)aluType;
- (unint64_t)argumentIndexStride;
- (unint64_t)arrayLength;
- (unint64_t)dataType;
- (unint64_t)elementType;
- (unint64_t)indirectArgumentIndexStride;
- (unint64_t)pixelFormat;
- (unint64_t)stride;
- (void)dealloc;
- (void)setArgumentIndexStride:(unint64_t)a3;
- (void)setIndirectArgumentIndexStride:(unint64_t)a3;
- (void)setIsIndirectArgumentBuffer:(BOOL)a3;
- (void)setStride:(unint64_t)a3;
@end

@implementation MTLArrayTypeInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLArrayTypeInternal;
  [(MTLArrayTypeInternal *)&v3 dealloc];
}

- (void)setIsIndirectArgumentBuffer:(BOOL)a3
{
  self->_isIndirectArgumentBuffer = a3;
}

- (MTLArrayTypeInternal)initWithArrayLength:(unint64_t)a3 elementType:(unint64_t)a4 stride:(unint64_t)a5 pixelFormat:(unint64_t)a6 aluType:(unint64_t)a7 details:(id)a8
{
  int v11 = a5;
  int v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTLArrayTypeInternal;
  unint64_t v18 = a4;
  v14 = [(MTLArrayTypeInternal *)&v17 init];
  v14->_dataType = 2;
  *((_DWORD *)v14 + 4) = v13;
  v14->_elementType = a4;
  *((_DWORD *)v14 + 5) = v11;
  v14->_pixelFormat = a6;
  v14->_aluType = a7;
  if (a4 == 57)
  {
    v14->_elementTypeInfo = (MTLType *)newDataTypeDescriptionForIndirectArgument(a8, (uint64_t *)&v18);
    v14->_elementType = v18;
    v15 = &OBJC_IVAR___MTLArrayTypeInternal__details;
  }
  else
  {
    v15 = &OBJC_IVAR___MTLArrayTypeInternal__elementTypeInfo;
  }
  *(Class *)((char *)&v14->super.super.super.isa + *v15) = (Class)a8;
  return v14;
}

- (unint64_t)stride
{
  return *((unsigned int *)self + 5);
}

- (unint64_t)arrayLength
{
  return *((unsigned int *)self + 4);
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (id)elementStructType
{
  if (self->_elementType == 1) {
    return self->_elementTypeInfo;
  }
  else {
    return 0;
  }
}

- (BOOL)isArrayLayoutThreadSafeWith:(id)a3
{
  uint64_t v5 = [a3 aluType];
  unint64_t aluType = self->_aluType;
  uint64_t v7 = [a3 dataType];
  unint64_t dataType = self->_dataType;
  uint64_t v9 = [a3 arrayLength];
  uint64_t v10 = *((unsigned int *)self + 4);
  return [a3 pixelFormat] == self->_pixelFormat && v9 == v10 && v7 == dataType && v5 == aluType;
}

- (void)setStride:(unint64_t)a3
{
  *((_DWORD *)self + 5) = a3;
}

- (id)elementArrayType
{
  if (self->_elementType == 2) {
    return self->_elementTypeInfo;
  }
  else {
    return 0;
  }
}

- (id)elementTextureReferenceType
{
  id result = self->_elementTypeInfo;
  if (result)
  {
    if ([result dataType] == 58) {
      return self->_elementTypeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)elementPointerType
{
  id result = self->_elementTypeInfo;
  if (result)
  {
    if ([result dataType] == 60) {
      return self->_elementTypeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unint64_t)indirectArgumentIndexStride
{
  return self->_argumentIndexStride;
}

- (void)setIndirectArgumentIndexStride:(unint64_t)a3
{
  self->_argumentIndexStride = a3;
}

- (id)elementIndirectArgumentType
{
  return self->_details;
}

- (id)elementTypeDescription
{
  return self->_elementTypeInfo;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 + 4;
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v8 = NSString;
  uint64_t v12 = v7;
  int v13 = @"DataType =";
  v14 = MTLDataTypeString(self->_dataType);
  uint64_t v15 = v7;
  v16 = @"ArrayLength =";
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 4)];
  uint64_t v18 = v7;
  v19 = @"Stride =";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 5)];
  uint64_t v21 = v7;
  v22 = @"ArgumentIndexStride =";
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:self->_argumentIndexStride];
  uint64_t v24 = v7;
  elementTypeInfo = self->_elementTypeInfo;
  if (elementTypeInfo) {
    uint64_t v10 = (__CFString *)[NSString stringWithFormat:@"ElementTypeInfo = %@", -[MTLType formattedDescription:withPrintedTypes:](elementTypeInfo, "formattedDescription:withPrintedTypes:", v6, a4), v12, v13];
  }
  else {
    uint64_t v10 = MTLDataTypeString(self->_elementType);
  }
  v25 = v10;
  return (id)[v8 stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v12, 14), "componentsJoinedByString:", @" "];
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
    || *((_DWORD *)self + 4) != *((_DWORD *)a3 + 4)
    || *((_DWORD *)self + 5) != *((_DWORD *)a3 + 5))
  {
    goto LABEL_15;
  }
  unint64_t details = (unint64_t)self->_details;
  if (!(details | *((void *)a3 + 3)) || (int v6 = objc_msgSend((id)details, "isEqual:")) != 0)
  {
    if (self->_elementType != *((void *)a3 + 4)
      || self->_pixelFormat != *((void *)a3 + 5)
      || self->_aluType != *((void *)a3 + 6))
    {
      goto LABEL_15;
    }
    elementTypeInfo = self->_elementTypeInfo;
    if (!((unint64_t)elementTypeInfo | *((void *)a3 + 7))
      || (int v6 = -[MTLType isEqual:](elementTypeInfo, "isEqual:")) != 0)
    {
      if (self->_isIndirectArgumentBuffer == *((unsigned __int8 *)a3 + 64))
      {
        LOBYTE(v6) = self->_argumentIndexStride == *((void *)a3 + 9);
        return v6;
      }
LABEL_15:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (unint64_t)argumentIndexStride
{
  return self->_argumentIndexStride;
}

- (void)setArgumentIndexStride:(unint64_t)a3
{
  self->_argumentIndexStride = a3;
}

- (BOOL)isIndirectArgumentBuffer
{
  return self->_isIndirectArgumentBuffer;
}

@end