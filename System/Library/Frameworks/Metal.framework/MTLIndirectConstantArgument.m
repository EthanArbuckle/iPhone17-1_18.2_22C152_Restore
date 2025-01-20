@interface MTLIndirectConstantArgument
- (BOOL)isEqual:(id)a3;
- (MTLIndirectConstantArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 dataType:(unint64_t)a8 pixelFormat:(unint64_t)a9 aluType:(unint64_t)a10 dataSize:(unint64_t)a11 alignment:(unint64_t)a12;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (unint64_t)bufferALUType;
- (unint64_t)bufferPixelFormat;
- (unint64_t)indirectConstantAlignment;
- (unint64_t)indirectConstantDataSize;
- (unint64_t)indirectConstantDataType;
- (void)dealloc;
@end

@implementation MTLIndirectConstantArgument

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLIndirectConstantArgument;
  [(MTLBindingInternal *)&v2 dealloc];
}

- (unint64_t)indirectConstantDataType
{
  return self->_dataType;
}

- (unint64_t)indirectConstantDataSize
{
  return self->_dataSize;
}

- (unint64_t)indirectConstantAlignment
{
  return self->_alignment;
}

- (MTLIndirectConstantArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 dataType:(unint64_t)a8 pixelFormat:(unint64_t)a9 aluType:(unint64_t)a10 dataSize:(unint64_t)a11 alignment:(unint64_t)a12
{
  unsigned __int16 v12 = a8;
  v14.receiver = self;
  v14.super_class = (Class)MTLIndirectConstantArgument;
  result = [(MTLBindingInternal *)&v14 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  result->_alignment = a12;
  result->_dataSize = a11;
  result->_dataType = v12;
  result->_pixelFormat = a9;
  result->_aluType = a10;
  return result;
}

- (unint64_t)bufferPixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)bufferALUType
{
  return self->_aluType;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  v11[9] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v7 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MTLIndirectConstantArgument;
  id v8 = [(MTLBindingInternal *)&v10 formattedDescription:a3];
  v11[0] = v6;
  v11[1] = @"Alignment =";
  v11[2] = [NSNumber numberWithUnsignedShort:self->_alignment];
  v11[3] = v6;
  v11[4] = @"DataSize =";
  v11[5] = [NSNumber numberWithUnsignedShort:self->_dataSize];
  v11[6] = v6;
  v11[7] = @"DataType =";
  v11[8] = MTLDataTypeString(self->_dataType);
  return (id)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 9), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_dataType != *((unsigned __int16 *)a3 + 84)
    || self->_alignment != *((unsigned __int16 *)a3 + 85)
    || self->_dataSize != *((unsigned __int16 *)a3 + 86)
    || self->_pixelFormat != *((void *)a3 + 22)
    || self->_aluType != *((void *)a3 + 23))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLIndirectConstantArgument;
  return [(MTLBindingInternal *)&v6 isEqual:a3];
}

@end