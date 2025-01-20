@interface NTKCharacterTexture
- (MTLTexture)mtlTexture;
- (NTKCharacterTexture)initWithData:(const void *)a3 length:(int)a4;
- (const)data;
- (int)length;
- (unsigned)gid;
- (void)setGid:(unsigned int)a3;
- (void)setMtlTexture:(id)a3;
@end

@implementation NTKCharacterTexture

- (NTKCharacterTexture)initWithData:(const void *)a3 length:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCharacterTexture;
  result = [(NTKCharacterTexture *)&v7 init];
  if (result)
  {
    result->_data = a3;
    result->_length = a4;
  }
  return result;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (const)data
{
  return self->_data;
}

- (int)length
{
  return self->_length;
}

- (MTLTexture)mtlTexture
{
  return self->_mtlTexture;
}

- (void)setMtlTexture:(id)a3
{
}

- (void).cxx_destruct
{
}

@end