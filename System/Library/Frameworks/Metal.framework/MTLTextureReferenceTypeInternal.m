@interface MTLTextureReferenceTypeInternal
- (BOOL)isDepthTexture;
- (BOOL)isEqual:(id)a3;
- (MTLTextureReferenceTypeInternal)initWithDataType:(unint64_t)a3 textureType:(unint64_t)a4 access:(unint64_t)a5 isDepthTexture:(BOOL)a6;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (unint64_t)access;
- (unint64_t)dataType;
- (unint64_t)textureDataType;
- (unint64_t)textureType;
- (void)dealloc;
@end

@implementation MTLTextureReferenceTypeInternal

- (MTLTextureReferenceTypeInternal)initWithDataType:(unint64_t)a3 textureType:(unint64_t)a4 access:(unint64_t)a5 isDepthTexture:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MTLTextureReferenceTypeInternal;
  result = [(MTLTextureReferenceTypeInternal *)&v11 init];
  result->_dataType = 58;
  result->_textureDataType = a3;
  result->_textureType = a4;
  result->_access = a5;
  result->_isDepthTexture = a6;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLTextureReferenceTypeInternal;
  [(MTLTextureReferenceTypeInternal *)&v2 dealloc];
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)textureDataType
{
  return self->_textureDataType;
}

- (BOOL)isDepthTexture
{
  return self->_isDepthTexture;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  v10[15] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v10[0] = v5;
  v10[1] = @"DataType =";
  v10[2] = MTLDataTypeString(self->_dataType);
  v10[3] = v5;
  v10[4] = @"TextureDataType =";
  v10[5] = MTLDataTypeString(self->_textureDataType);
  v10[6] = v5;
  v10[7] = @"TextureType =";
  v10[8] = MTLTextureTypeString(self->_textureType);
  v10[9] = v5;
  v10[10] = @"Access =";
  unint64_t access = self->_access;
  if (access > 2) {
    v8 = @"Unknown";
  }
  else {
    v8 = off_1E5221D88[access];
  }
  v10[11] = v8;
  v10[12] = v5;
  v10[13] = @"IsDepthTexture =";
  v10[14] = [NSNumber numberWithBool:self->_isDepthTexture];
  return (id)[v6 stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 15), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_dataType == *((void *)a3 + 1)
      && self->_textureDataType == *((void *)a3 + 2)
      && self->_textureType == *((void *)a3 + 3)
      && self->_access == *((void *)a3 + 4)
      && self->_isDepthTexture == *((unsigned __int8 *)a3 + 40);
}

- (unint64_t)access
{
  return self->_access;
}

@end