@interface MDLVertexBufferLayout
- (BOOL)isEqual:(id)a3;
- (MDLVertexBufferLayout)initWithStride:(NSUInteger)stride;
- (NSUInteger)stride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setStride:(NSUInteger)stride;
@end

@implementation MDLVertexBufferLayout

- (MDLVertexBufferLayout)initWithStride:(NSUInteger)stride
{
  v8.receiver = self;
  v8.super_class = (Class)MDLVertexBufferLayout;
  v4 = [(MDLVertexBufferLayout *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_stride = stride;
    v6 = v4;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend_allocWithZone_(MDLVertexBufferLayout, a2, (uint64_t)a3);
  unint64_t stride = self->_stride;

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithStride_, stride);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MDLVertexBufferLayout *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_stride == v4->_stride;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_stride;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_stride(self, v5, v6);
  return (id)objc_msgSend_stringWithFormat_(v3, v8, @"<%@: %p stride=%lu>", v4, self, v7);
}

- (NSUInteger)stride
{
  return self->_stride;
}

- (void)setStride:(NSUInteger)stride
{
  self->_unint64_t stride = stride;
}

@end