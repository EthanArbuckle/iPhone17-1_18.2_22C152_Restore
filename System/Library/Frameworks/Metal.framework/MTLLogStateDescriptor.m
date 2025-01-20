@interface MTLLogStateDescriptor
- (BOOL)isEqual:(id)a3;
- (MTLLogStateDescriptor)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bufferSize;
- (int64_t)level;
- (unint64_t)hash;
- (void)setBufferSize:(int64_t)a3;
- (void)setLevel:(int64_t)a3;
@end

@implementation MTLLogStateDescriptor

- (MTLLogStateDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLogStateDescriptor;
  result = [(MTLLogStateDescriptor *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_level = xmmword_1828D4A20;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setLevel:self->_level];
    [v5 setBufferSize:self->_bufferSize];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && [a3 level] == self->_level
      && [a3 bufferSize] == self->_bufferSize;
}

- (unint64_t)hash
{
  bzero(&v4, 0x10uLL);
  long long v4 = *(_OWORD *)&self->_level;
  return _MTLHashState((int *)&v4, 0x10uLL);
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (int64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int64_t)a3
{
  self->_bufferSize = a3;
}

@end