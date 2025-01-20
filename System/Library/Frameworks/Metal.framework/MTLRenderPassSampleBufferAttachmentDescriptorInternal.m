@interface MTLRenderPassSampleBufferAttachmentDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (MTLRenderPassSampleBufferAttachmentDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sampleBuffer;
- (unint64_t)endOfFragmentSampleIndex;
- (unint64_t)endOfVertexSampleIndex;
- (unint64_t)hash;
- (unint64_t)startOfFragmentSampleIndex;
- (unint64_t)startOfVertexSampleIndex;
- (void)dealloc;
- (void)setEndOfFragmentSampleIndex:(unint64_t)a3;
- (void)setEndOfVertexSampleIndex:(unint64_t)a3;
- (void)setSampleBuffer:(id)a3;
- (void)setStartOfFragmentSampleIndex:(unint64_t)a3;
- (void)setStartOfVertexSampleIndex:(unint64_t)a3;
@end

@implementation MTLRenderPassSampleBufferAttachmentDescriptorInternal

- (MTLRenderPassSampleBufferAttachmentDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassSampleBufferAttachmentDescriptorInternal;
  result = [(MTLRenderPassSampleBufferAttachmentDescriptorInternal *)&v4 init];
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)&result->_private.startOfVertexSampleIndex = v3;
  *(_OWORD *)&result->_private.startOfFragmentSampleIndex = v3;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPassSampleBufferAttachmentDescriptorInternal;
  [(MTLRenderPassSampleBufferAttachmentDescriptorInternal *)&v3 dealloc];
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)setSampleBuffer:(id)a3
{
  sampleBuffer = self->_private.sampleBuffer;
  if (sampleBuffer != a3)
  {

    self->_private.sampleBuffer = (MTLCounterSampleBuffer *)a3;
  }
}

- (id)sampleBuffer
{
  return self->_private.sampleBuffer;
}

- (void)setStartOfVertexSampleIndex:(unint64_t)a3
{
  self->_private.startOfVertexSampleIndex = a3;
}

- (unint64_t)startOfVertexSampleIndex
{
  return self->_private.startOfVertexSampleIndex;
}

- (void)setEndOfVertexSampleIndex:(unint64_t)a3
{
  self->_private.endOfVertexSampleIndex = a3;
}

- (unint64_t)endOfVertexSampleIndex
{
  return self->_private.endOfVertexSampleIndex;
}

- (void)setStartOfFragmentSampleIndex:(unint64_t)a3
{
  self->_private.startOfFragmentSampleIndex = a3;
}

- (unint64_t)startOfFragmentSampleIndex
{
  return self->_private.startOfFragmentSampleIndex;
}

- (void)setEndOfFragmentSampleIndex:(unint64_t)a3
{
  self->_private.endOfFragmentSampleIndex = a3;
}

- (unint64_t)endOfFragmentSampleIndex
{
  return self->_private.endOfFragmentSampleIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorInternal);
  self = (MTLRenderPassSampleBufferAttachmentDescriptorInternal *)((char *)self + 8);
  v4->_private.sampleBuffer = self->super.super.isa;
  *(_OWORD *)&v4->_private.startOfVertexSampleIndex = *(_OWORD *)&self->_private.sampleBuffer;
  *(_OWORD *)&v4->_private.startOfFragmentSampleIndex = *(_OWORD *)&self->_private.endOfVertexSampleIndex;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    p_private = &self->_private;
    v8 = (MTLCounterSampleBuffer **)((char *)a3 + 8);
    if (p_private->sampleBuffer == *v8
      || (int v6 = -[MTLCounterSampleBuffer isEqual:](p_private->sampleBuffer, "isEqual:")) != 0)
    {
      if ((MTLCounterSampleBuffer *)p_private->startOfVertexSampleIndex != v8[1]
        || (MTLCounterSampleBuffer *)p_private->endOfVertexSampleIndex != v8[2]
        || (MTLCounterSampleBuffer *)p_private->startOfFragmentSampleIndex != v8[3])
      {
        goto LABEL_3;
      }
      LOBYTE(v6) = p_private->endOfFragmentSampleIndex == (void)v8[4];
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 0x28uLL);
}

@end