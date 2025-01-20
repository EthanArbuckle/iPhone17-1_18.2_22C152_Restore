@interface MTLAccelerationStructurePassSampleBufferAttachmentDescriptor
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor)init;
- (NSUInteger)endOfEncoderSampleIndex;
- (NSUInteger)startOfEncoderSampleIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sampleBuffer;
- (unint64_t)hash;
- (void)dealloc;
- (void)setEndOfEncoderSampleIndex:(NSUInteger)endOfEncoderSampleIndex;
- (void)setSampleBuffer:(id)sampleBuffer;
- (void)setStartOfEncoderSampleIndex:(NSUInteger)startOfEncoderSampleIndex;
@end

@implementation MTLAccelerationStructurePassSampleBufferAttachmentDescriptor

- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructurePassSampleBufferAttachmentDescriptor;
  result = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)&v3 init];
  if (result)
  {
    result->_startOfEncoderSampleIndex = -1;
    result->_endOfEncoderSampleIndex = -1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructurePassSampleBufferAttachmentDescriptor;
  [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSampleBuffer:self->_sampleBuffer];
  [v4 setStartOfEncoderSampleIndex:self->_startOfEncoderSampleIndex];
  [v4 setEndOfEncoderSampleIndex:self->_endOfEncoderSampleIndex];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v17 = v5;
    uint64_t v18 = v4;
    uint64_t v19 = v3;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v12) = 0;
      return v12;
    }
    id v13 = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)self sampleBuffer];
    if (v13 == (id)[a3 sampleBuffer]
      || (int v12 = objc_msgSend(-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor sampleBuffer](self, "sampleBuffer"), "isEqual:", objc_msgSend(a3, "sampleBuffer"))) != 0)
    {
      NSUInteger v14 = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)self startOfEncoderSampleIndex];
      if (v14 != [a3 startOfEncoderSampleIndex]) {
        goto LABEL_3;
      }
      NSUInteger v15 = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)self endOfEncoderSampleIndex];
      LOBYTE(v12) = v15 == [a3 endOfEncoderSampleIndex];
    }
  }
  return v12;
}

- (unint64_t)hash
{
  bzero(v4, 0x18uLL);
  v4[0] = objc_msgSend(-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor sampleBuffer](self, "sampleBuffer"), "hash");
  v4[1] = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)self startOfEncoderSampleIndex];
  v4[2] = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)self endOfEncoderSampleIndex];
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (id)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(id)sampleBuffer
{
}

- (NSUInteger)startOfEncoderSampleIndex
{
  return self->_startOfEncoderSampleIndex;
}

- (void)setStartOfEncoderSampleIndex:(NSUInteger)startOfEncoderSampleIndex
{
  self->_startOfEncoderSampleIndex = startOfEncoderSampleIndex;
}

- (NSUInteger)endOfEncoderSampleIndex
{
  return self->_endOfEncoderSampleIndex;
}

- (void)setEndOfEncoderSampleIndex:(NSUInteger)endOfEncoderSampleIndex
{
  self->_endOfEncoderSampleIndex = endOfEncoderSampleIndex;
}

@end