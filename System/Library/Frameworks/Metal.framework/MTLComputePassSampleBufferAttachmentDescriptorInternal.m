@interface MTLComputePassSampleBufferAttachmentDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (MTLComputePassSampleBufferAttachmentDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sampleBuffer;
- (unint64_t)endOfEncoderSampleIndex;
- (unint64_t)hash;
- (unint64_t)startOfEncoderSampleIndex;
- (void)dealloc;
- (void)setEndOfEncoderSampleIndex:(unint64_t)a3;
- (void)setSampleBuffer:(id)a3;
- (void)setStartOfEncoderSampleIndex:(unint64_t)a3;
@end

@implementation MTLComputePassSampleBufferAttachmentDescriptorInternal

- (MTLComputePassSampleBufferAttachmentDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLComputePassSampleBufferAttachmentDescriptorInternal;
  result = [(MTLComputePassSampleBufferAttachmentDescriptorInternal *)&v3 init];
  result->_private.startOfEncoderSampleIndex = -1;
  result->_private.endOfEncoderSampleIndex = -1;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLComputePassSampleBufferAttachmentDescriptorInternal;
  [(MTLComputePassSampleBufferAttachmentDescriptorInternal *)&v3 dealloc];
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

- (void)setStartOfEncoderSampleIndex:(unint64_t)a3
{
  self->_private.startOfEncoderSampleIndex = a3;
}

- (unint64_t)startOfEncoderSampleIndex
{
  return self->_private.startOfEncoderSampleIndex;
}

- (void)setEndOfEncoderSampleIndex:(unint64_t)a3
{
  self->_private.endOfEncoderSampleIndex = a3;
}

- (unint64_t)endOfEncoderSampleIndex
{
  return self->_private.endOfEncoderSampleIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTLComputePassSampleBufferAttachmentDescriptorInternal);
  self = (MTLComputePassSampleBufferAttachmentDescriptorInternal *)((char *)self + 8);
  v4->_private.sampleBuffer = self->super.super.isa;
  *(_OWORD *)&v4->_private.startOfEncoderSampleIndex = *(_OWORD *)&self->_private.sampleBuffer;
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
      if ((MTLCounterSampleBuffer *)p_private->startOfEncoderSampleIndex != v8[1]) {
        goto LABEL_3;
      }
      LOBYTE(v6) = p_private->endOfEncoderSampleIndex == (void)v8[2];
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 0x18uLL);
}

@end