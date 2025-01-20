@interface MTLBufferBindingInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertexDescriptorBuffer;
- (MTLBufferBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 arraySize:(unint64_t)a8 dataType:(unint64_t)a9 pixelFormat:(unint64_t)a10 aluType:(unint64_t)a11 isConstantBuffer:(BOOL)a12 dataSize:(unint64_t)a13 alignment:(unint64_t)a14;
- (MTLPointerType)bufferPointerType;
- (MTLStructType)bufferStructType;
- (id)bufferIndirectArgumentType;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)bufferALUType;
- (unint64_t)bufferAlignment;
- (unint64_t)bufferDataSize;
- (unint64_t)bufferDataType;
- (unint64_t)bufferPixelFormat;
- (void)dealloc;
- (void)setAlignment:(unint64_t)a3;
- (void)setDataSize:(unint64_t)a3;
- (void)setStructType:(id)a3;
- (void)setStructType:(id)a3 doRetain:(BOOL)a4;
- (void)setVertexDescriptorBuffer:(BOOL)a3;
@end

@implementation MTLBufferBindingInternal

- (MTLBufferBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 arraySize:(unint64_t)a8 dataType:(unint64_t)a9 pixelFormat:(unint64_t)a10 aluType:(unint64_t)a11 isConstantBuffer:(BOOL)a12 dataSize:(unint64_t)a13 alignment:(unint64_t)a14
{
  v18.receiver = self;
  v18.super_class = (Class)MTLBufferBindingInternal;
  v15 = [(MTLBindingInternal *)&v18 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  v15->_alignment = a14;
  v15->_dataSize = a13;
  *((_WORD *)v15 + 84) = *((_WORD *)v15 + 84) & 0x8000 | a9 & 0x7FFF;
  v15->_pixelFormat = a10;
  v15->_aluType = a11;
  *((unsigned char *)v15 + 169) &= ~0x80u;
  LOBYTE(v17) = a12;
  v15->super._typeInfo = (MTLType *)[[MTLPointerTypeInternal alloc] initWithElementType:a9 elementTypeDescription:0 access:a5 alignment:a14 dataSize:a13 elementIsIndirectArgumentBuffer:0 isConstantBuffer:v17];
  return v15;
}

- (void)setStructType:(id)a3 doRetain:(BOOL)a4
{
  if (a3)
  {
    uint64_t IsIndirectArgumentBuffer = structIsIndirectArgumentBuffer((uint64_t)a3);
    char v8 = [(MTLType *)self->super._typeInfo isConstantBuffer];

    BYTE1(v9) = a4;
    LOBYTE(v9) = v8;
    self->super._typeInfo = (MTLType *)-[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:]([MTLPointerTypeInternal alloc], "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:", 1, a3, self->super._access, self->_alignment, self->_dataSize, IsIndirectArgumentBuffer, v9);
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLBufferBindingInternal;
  [(MTLBindingInternal *)&v2 dealloc];
}

- (MTLStructType)bufferStructType
{
  return (MTLStructType *)[(MTLType *)self->super._typeInfo elementStructType];
}

- (unint64_t)bufferDataType
{
  return *((_WORD *)self + 84) & 0x7FFF;
}

- (unint64_t)bufferDataSize
{
  if (self->_dataSize == -1) {
    return -1;
  }
  else {
    return self->_dataSize;
  }
}

- (MTLPointerType)bufferPointerType
{
  result = (MTLPointerType *)self->super._typeInfo;
  if (result)
  {
    if ([(MTLPointerType *)result dataType] == 60) {
      return (MTLPointerType *)self->super._typeInfo;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setVertexDescriptorBuffer:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 169) = v3 & 0x80 | *((unsigned char *)self + 169) & 0x7F;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (BOOL)isVertexDescriptorBuffer
{
  return *((unsigned __int8 *)self + 169) >> 7;
}

- (void)setStructType:(id)a3
{
}

- (unint64_t)bufferAlignment
{
  return self->_alignment;
}

- (unint64_t)bufferPixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)bufferALUType
{
  return self->_aluType;
}

- (id)bufferIndirectArgumentType
{
  MTLReportFailure(0, "-[MTLBufferBindingInternal bufferIndirectArgumentType]", 212, @"Not supported at this point", v2, v3, v4, v5, vars0);
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[9] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MTLBufferBindingInternal;
  id v7 = [(MTLBindingInternal *)&v9 formattedDescription:a3];
  v10[0] = v5;
  v10[1] = @"Alignment =";
  v10[2] = [NSNumber numberWithUnsignedShort:self->_alignment];
  v10[3] = v5;
  v10[4] = @"DataSize =";
  v10[5] = [NSNumber numberWithUnsignedInt:self->_dataSize];
  v10[6] = v5;
  v10[7] = @"DataType =";
  v10[8] = MTLDataTypeString(*((_WORD *)self + 84) & 0x7FFF);
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 9), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((*((_WORD *)a3 + 84) ^ *((_WORD *)self + 84)) & 0x7FFF) != 0
    || ((*((unsigned __int8 *)a3 + 169) ^ *((unsigned __int8 *)self + 169)) & 0x80) != 0
    || self->_alignment != *((unsigned __int16 *)a3 + 85)
    || self->_dataSize != *((_DWORD *)a3 + 43)
    || self->_pixelFormat != *((void *)a3 + 22)
    || self->_aluType != *((void *)a3 + 23))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLBufferBindingInternal;
  return [(MTLBindingInternal *)&v6 isEqual:a3];
}

@end