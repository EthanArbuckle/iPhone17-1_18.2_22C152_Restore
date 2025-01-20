@interface MTLVertexAttributeDescriptorInternal
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bufferIndex;
- (unint64_t)format;
- (unint64_t)offset;
- (void)setBufferIndex:(unint64_t)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
@end

@implementation MTLVertexAttributeDescriptorInternal

- (unint64_t)format
{
  return self->_vertexFormat;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_vertexFormat;
  *((void *)result + 2) = self->_offset;
  *((void *)result + 3) = self->_bufferIndex;
  return result;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void)setFormat:(unint64_t)a3
{
  self->_vertexFormat = a3;
}

- (void)setBufferIndex:(unint64_t)a3
{
  if (a3 >= 0x1F) {
    MTLReportFailure(0, "-[MTLVertexAttributeDescriptorInternal setBufferIndex:]", 348, @"buffer index (%lu) must be < %lu.", v3, v4, v5, v6, a3);
  }
  self->_bufferIndex = a3;
}

@end