@interface MTLFunctionStitchingInputBufferAddress
- (BOOL)dereference;
- (BOOL)isEqual:(id)a3;
- (MTLFunctionStitchingInputBufferAddress)initWithBindIndex:(unint64_t)a3;
- (MTLFunctionStitchingInputBufferAddress)initWithBindIndex:(unint64_t)a3 byteOffset:(unint64_t)a4 dereference:(BOOL)a5;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)bindIndex;
- (unint64_t)byteOffset;
- (unint64_t)hash;
- (void)setBindIndex:(unint64_t)a3;
- (void)setByteOffset:(unint64_t)a3;
- (void)setDereference:(BOOL)a3;
@end

@implementation MTLFunctionStitchingInputBufferAddress

- (void)setDereference:(BOOL)a3
{
  self->_dereference = a3;
}

- (void)setByteOffset:(unint64_t)a3
{
  self->_byteOffset = a3;
}

- (void)setBindIndex:(unint64_t)a3
{
  self->_bindIndex = a3;
}

- (BOOL)dereference
{
  return self->_dereference;
}

- (unint64_t)byteOffset
{
  return self->_byteOffset;
}

- (unint64_t)bindIndex
{
  return self->_bindIndex;
}

- (MTLFunctionStitchingInputBufferAddress)initWithBindIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingInputBufferAddress;
  result = [(MTLFunctionStitchingInputBufferAddress *)&v5 init];
  result->_bindIndex = a3;
  result->_byteOffset = 0;
  result->_dereference = 0;
  return result;
}

- (MTLFunctionStitchingInputBufferAddress)initWithBindIndex:(unint64_t)a3 byteOffset:(unint64_t)a4 dereference:(BOOL)a5
{
  self->_bindIndex = a3;
  self->_byteOffset = a4;
  self->_dereference = a5;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setBindIndex:self->_bindIndex];
  [v4 setByteOffset:self->_byteOffset];
  [v4 setDereference:self->_dereference];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  unint64_t v6 = [(MTLFunctionStitchingInputBufferAddress *)self bindIndex];
  if (v6 != [a3 bindIndex]) {
    return 0;
  }
  unint64_t v7 = [(MTLFunctionStitchingInputBufferAddress *)self byteOffset];
  if (v7 != [a3 byteOffset]) {
    return 0;
  }
  BOOL v8 = [(MTLFunctionStitchingInputBufferAddress *)self dereference];
  return v8 ^ [a3 dereference] ^ 1;
}

- (unint64_t)hash
{
  bzero(v4, 0x18uLL);
  v4[0] = [(MTLFunctionStitchingInputBufferAddress *)self bindIndex];
  v4[1] = [(MTLFunctionStitchingInputBufferAddress *)self byteOffset];
  v4[2] = [(MTLFunctionStitchingInputBufferAddress *)self dereference];
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  v9[9] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  objc_super v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingInputBufferAddress;
  unint64_t v6 = [(MTLFunctionStitchingInputBufferAddress *)&v8 description];
  v9[0] = v4;
  v9[1] = @"bind index = ";
  v9[2] = [NSNumber numberWithUnsignedInteger:self->_bindIndex];
  v9[3] = v4;
  v9[4] = @"byte offset = ";
  v9[5] = [NSNumber numberWithUnsignedInteger:self->_byteOffset];
  v9[6] = v4;
  v9[7] = @"dereference = ";
  v9[8] = [NSNumber numberWithBool:self->_dereference];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 9), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(MTLFunctionStitchingInputBufferAddress *)self formattedDescription:0];
}

@end