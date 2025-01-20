@interface MTLThreadgroupMemoryBindingInternal
- (BOOL)isEqual:(id)a3;
- (MTLThreadgroupMemoryBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 arraySize:(unint64_t)a8 dataType:(unint64_t)a9 dataSize:(unint64_t)a10 alignment:(unint64_t)a11;
- (id)formattedDescription:(unint64_t)a3;
- (id)threadgroupMemoryStructType;
- (unint64_t)threadgroupMemoryAlignment;
- (unint64_t)threadgroupMemoryDataSize;
- (unint64_t)threadgroupMemoryDataType;
- (void)setStructType:(id)a3;
- (void)setStructType:(id)a3 doRetain:(BOOL)a4;
@end

@implementation MTLThreadgroupMemoryBindingInternal

- (void)setStructType:(id)a3 doRetain:(BOOL)a4
{
  if (a3)
  {

    BYTE1(v7) = a4;
    LOBYTE(v7) = 0;
    self->super._typeInfo = (MTLType *)-[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:]([MTLPointerTypeInternal alloc], "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:", 1, a3, self->super._access, self->_alignment, self->_dataSize, 0, v7);
  }
}

- (MTLThreadgroupMemoryBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 arraySize:(unint64_t)a8 dataType:(unint64_t)a9 dataSize:(unint64_t)a10 alignment:(unint64_t)a11
{
  v15.receiver = self;
  v15.super_class = (Class)MTLThreadgroupMemoryBindingInternal;
  v12 = [(MTLBindingInternal *)&v15 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  v12->_alignment = a11;
  v12->_dataSize = a10;
  v12->_dataType = a9;
  LOBYTE(v14) = 0;
  v12->super._typeInfo = (MTLType *)[[MTLPointerTypeInternal alloc] initWithElementType:a9 elementTypeDescription:0 access:a5 alignment:a11 dataSize:a10 elementIsIndirectArgumentBuffer:0 isConstantBuffer:v14];
  return v12;
}

- (unint64_t)threadgroupMemoryAlignment
{
  return self->_alignment;
}

- (unint64_t)threadgroupMemoryDataSize
{
  return self->_dataSize;
}

- (unint64_t)threadgroupMemoryDataType
{
  return self->_dataType;
}

- (id)threadgroupMemoryStructType
{
  if (self->_dataType == 1) {
    return (id)[(MTLType *)self->super._typeInfo elementStructType];
  }
  else {
    return 0;
  }
}

- (void)setStructType:(id)a3
{
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MTLThreadgroupMemoryBindingInternal;
  id v7 = [(MTLBindingInternal *)&v9 formattedDescription:a3];
  v10[0] = v5;
  v10[1] = @"Alignment =";
  v10[2] = [NSNumber numberWithUnsignedShort:self->_alignment];
  v10[3] = v5;
  v10[4] = @"DataSize =";
  v10[5] = [NSNumber numberWithUnsignedInt:self->_dataSize];
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 6), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_alignment != *((unsigned __int16 *)a3 + 84)
    || self->_dataSize != *((_DWORD *)a3 + 43)
    || self->_dataType != *((void *)a3 + 22))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLThreadgroupMemoryBindingInternal;
  return [(MTLBindingInternal *)&v6 isEqual:a3];
}

@end