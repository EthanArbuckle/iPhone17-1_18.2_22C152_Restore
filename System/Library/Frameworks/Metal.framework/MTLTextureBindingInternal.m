@interface MTLTextureBindingInternal
- (BOOL)isDepthTexture;
- (BOOL)isEqual:(id)a3;
- (MTLTextureBindingInternal)initWithName:(id)a3 access:(unint64_t)a4 isActive:(BOOL)a5 locationIndex:(unint64_t)a6 arraySize:(unint64_t)a7 dataType:(unint64_t)a8 textureType:(unint64_t)a9 isDepthTexture:(BOOL)a10;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)textureDataType;
- (unint64_t)textureType;
@end

@implementation MTLTextureBindingInternal

- (MTLTextureBindingInternal)initWithName:(id)a3 access:(unint64_t)a4 isActive:(BOOL)a5 locationIndex:(unint64_t)a6 arraySize:(unint64_t)a7 dataType:(unint64_t)a8 textureType:(unint64_t)a9 isDepthTexture:(BOOL)a10
{
  v16.receiver = self;
  v16.super_class = (Class)MTLTextureBindingInternal;
  v12 = [(MTLBindingInternal *)&v16 initWithName:a3 type:2 access:a4 index:a6 active:a5 arrayLength:a7];
  v13 = v12;
  *((_WORD *)v12 + 84) = *((_WORD *)v12 + 84) & 0x8000 | a9 & 0x7FFF;
  if (a10) {
    char v14 = 0x80;
  }
  else {
    char v14 = 0;
  }
  *((unsigned char *)v12 + 169) = v14 & 0x80 | *((unsigned char *)v12 + 169) & 0x7F;
  v12->_textureDataType = a8;
  v12->super._typeInfo = (MTLType *)[[MTLTextureReferenceTypeInternal alloc] initWithDataType:a8 textureType:a9 access:a4 isDepthTexture:a10];
  return v13;
}

- (unint64_t)textureType
{
  return *((_WORD *)self + 84) & 0x7FFF;
}

- (unint64_t)textureDataType
{
  return self->_textureDataType;
}

- (BOOL)isDepthTexture
{
  return *((unsigned __int8 *)self + 169) >> 7;
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[9] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MTLTextureBindingInternal;
  id v7 = [(MTLBindingInternal *)&v9 formattedDescription:a3];
  v10[0] = v5;
  v10[1] = @"TextureType =";
  v10[2] = MTLTextureTypeString(*((_WORD *)self + 84) & 0x7FFF);
  v10[3] = v5;
  v10[4] = @"TextureDataType =";
  v10[5] = MTLDataTypeString(self->_textureDataType);
  v10[6] = v5;
  v10[7] = @"IsDepthTexture =";
  v10[8] = [NSNumber numberWithUnsignedShort:*((unsigned __int8 *)self + 169) >> 7];
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
    || self->_textureDataType != *((unsigned __int16 *)a3 + 85))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLTextureBindingInternal;
  return [(MTLBindingInternal *)&v6 isEqual:a3];
}

@end