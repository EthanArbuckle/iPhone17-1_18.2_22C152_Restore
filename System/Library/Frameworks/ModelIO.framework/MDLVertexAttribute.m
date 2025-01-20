@interface MDLVertexAttribute
- (BOOL)isEqual:(id)a3;
- (MDLVertexAttribute)init;
- (MDLVertexAttribute)initWithName:(NSString *)name format:(MDLVertexFormat)format offset:(NSUInteger)offset bufferIndex:(NSUInteger)bufferIndex;
- (MDLVertexFormat)format;
- (NSString)name;
- (NSTimeInterval)time;
- (NSUInteger)bufferIndex;
- (NSUInteger)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (vector_float4)initializationValue;
- (void)setBufferIndex:(NSUInteger)bufferIndex;
- (void)setFormat:(MDLVertexFormat)format;
- (void)setInitializationValue:(vector_float4)initializationValue;
- (void)setName:(NSString *)name;
- (void)setOffset:(NSUInteger)offset;
- (void)setTime:(NSTimeInterval)time;
@end

@implementation MDLVertexAttribute

- (MDLVertexAttribute)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLVertexAttribute;
  v2 = [(MDLVertexAttribute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26BF51EF0;

    v3->_offset = 0;
    v3->_bufferIndex = 0;
    v3->_format = 0;
    *(_OWORD *)v3->_initializationValue = xmmword_20B1E75C0;
  }
  return v3;
}

- (MDLVertexAttribute)initWithName:(NSString *)name format:(MDLVertexFormat)format offset:(NSUInteger)offset bufferIndex:(NSUInteger)bufferIndex
{
  v10 = name;
  v17.receiver = self;
  v17.super_class = (Class)MDLVertexAttribute;
  v11 = [(MDLVertexAttribute *)&v17 init];
  if (v11)
  {
    id v12 = [NSString alloc];
    uint64_t v14 = objc_msgSend_initWithString_(v12, v13, (uint64_t)v10);
    v15 = v11->_name;
    v11->_name = (NSString *)v14;

    v11->_bufferIndex = bufferIndex;
    v11->_format = format;
    v11->_offset = offset;
    *(_OWORD *)v11->_initializationValue = xmmword_20B1E75C0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend_allocWithZone_(MDLVertexAttribute, a2, (uint64_t)a3);
  name = self->_name;
  unint64_t offset = self->_offset;
  unint64_t bufferIndex = self->_bufferIndex;
  unint64_t format = self->_format;

  return (id)objc_msgSend_initWithName_format_offset_bufferIndex_(v4, v5, (uint64_t)name, format, offset, bufferIndex);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MDLVertexAttribute *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v7 = objc_msgSend_isEqualToString_(self->_name, v6, v5[1])
        && self->_offset == v5[2]
        && self->_bufferIndex == v5[3]
        && self->_format == v5[4];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_offset + objc_msgSend_hash(self->_name, a2, v2) + 33 * (self->_format + self->_bufferIndex);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v7 = objc_msgSend_name(self, v5, v6);
  uint64_t v10 = objc_msgSend_format(self, v8, v9);
  v11 = sub_20B15A488(v10);
  uint64_t v14 = objc_msgSend_bufferIndex(self, v12, v13);
  uint64_t v17 = objc_msgSend_offset(self, v15, v16);
  v19 = objc_msgSend_stringWithFormat_(v3, v18, @"<%@: %p name=%@ format=%s bufferIndex=%lu offset=%lu>", v4, self, v7, v11, v14, v17);

  return v19;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (MDLVertexFormat)format
{
  return self->_format;
}

- (void)setFormat:(MDLVertexFormat)format
{
  self->_unint64_t format = format;
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (void)setOffset:(NSUInteger)offset
{
  self->_unint64_t offset = offset;
}

- (NSUInteger)bufferIndex
{
  return self->_bufferIndex;
}

- (void)setBufferIndex:(NSUInteger)bufferIndex
{
  self->_unint64_t bufferIndex = bufferIndex;
}

- (NSTimeInterval)time
{
  return self->_time;
}

- (void)setTime:(NSTimeInterval)time
{
  self->_time = time;
}

- (vector_float4)initializationValue
{
  return *(vector_float4 *)self->_initializationValue;
}

- (void)setInitializationValue:(vector_float4)initializationValue
{
  *(vector_float4 *)self->_initializationValue = initializationValue;
}

- (void).cxx_destruct
{
}

@end