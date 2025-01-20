@interface MTLComputePassDescriptorInternal
+ (id)computePassDescriptor;
- (BOOL)allowCommandEncoderCoalescing;
- (BOOL)isEqual:(id)a3;
- (MTLComputePassDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sampleBufferAttachments;
- (unint64_t)dispatchType;
- (unint64_t)hash;
- (unsigned)substreamCount;
- (void)dealloc;
- (void)setAllowCommandEncoderCoalescing:(BOOL)a3;
- (void)setDispatchType:(unint64_t)a3;
- (void)setSubstreamCount:(unsigned int)a3;
@end

@implementation MTLComputePassDescriptorInternal

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = 0;
  p_private = &self->_private;
  do
  {
    v8 = p_private->sampleBufferAttachments->_sampleDescriptors[v6];
    if (v8) {
      *(void *)(*(void *)(v5 + 16) + 8 + v6 * 8) = [(MTLComputePassSampleBufferAttachmentDescriptorInternal *)v8 copyWithZone:a3];
    }
    ++v6;
  }
  while (v6 != 4);
  *(void *)(v5 + 8) = p_private->dispatchType;
  *(_DWORD *)(v5 + 24) = p_private->substreamCount;
  *(unsigned char *)(v5 + 28) = p_private->allowCommandEncoderCoalescing;
  return (id)v5;
}

+ (id)computePassDescriptor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (MTLComputePassDescriptorInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLComputePassDescriptorInternal;
  id v2 = [(MTLComputePassDescriptorInternal *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MTLComputePassSampleBufferAttachmentDescriptorArrayInternal);
    v2->_private.dispatchType = 0;
    v2->_private.sampleBufferAttachments = v3;
    v2->_private.substreamCount = 0;
    v2->_private.allowCommandEncoderCoalescing = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLComputePassDescriptorInternal;
  [(MTLComputePassDescriptorInternal *)&v3 dealloc];
}

- (unint64_t)hash
{
  p_private = &self->_private;
  v8[0] = self->_private.dispatchType;
  v8[1] = [(MTLComputePassDescriptorInternal *)self substreamCount];
  v8[2] = [(MTLComputePassDescriptorInternal *)self allowCommandEncoderCoalescing];
  uint64_t v4 = 0;
  unint64_t v5 = _MTLHashState((int *)v8, 0x18uLL);
  do
  {
    uint64_t v6 = p_private->sampleBufferAttachments->_sampleDescriptors[v4];
    if (v6) {
      v5 ^= (unint64_t)_MTLHashState((int *)&v6->_private, 0x18uLL) << v4;
    }
    ++v4;
  }
  while (v4 != 4);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class == object_getClass(a3))
  {
    uint64_t v6 = (char *)a3 + 8;
    if (self->_private.dispatchType == *((void *)a3 + 1)
      && self->_private.substreamCount == *((_DWORD *)a3 + 6)
      && self->_private.allowCommandEncoderCoalescing == *((unsigned __int8 *)a3 + 28))
    {
      uint64_t v7 = 0;
      p_sampleBufferAttachments = &self->_private.sampleBufferAttachments;
      v9 = (MTLComputePassSampleBufferAttachmentDescriptorArrayInternal **)(v6 + 8);
      while (1)
      {
        v10 = (*p_sampleBufferAttachments)->_sampleDescriptors[v7];
        v11 = (*v9)->_sampleDescriptors[v7];
        if (v10 == v11) {
          goto LABEL_26;
        }
        if (v10 && v11 == 0) {
          break;
        }
        if (v10) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v11 == 0;
        }
        if (!v13)
        {
          v14 = objc_alloc_init(MTLComputePassSampleBufferAttachmentDescriptorInternal);
          v15 = p_sampleBufferAttachments;
          v10 = v14;
LABEL_18:
          (*v15)->_sampleDescriptors[v7] = v14;
        }
        if (v11) {
          BOOL v16 = v10 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16
          || v10->_private.sampleBuffer != v11->_private.sampleBuffer
          || v10->_private.startOfEncoderSampleIndex != v11->_private.startOfEncoderSampleIndex
          || v10->_private.endOfEncoderSampleIndex != v11->_private.endOfEncoderSampleIndex)
        {
          return 0;
        }
LABEL_26:
        ++v7;
        BOOL result = 1;
        if (v7 == 4) {
          return result;
        }
      }
      v14 = objc_alloc_init(MTLComputePassSampleBufferAttachmentDescriptorInternal);
      v15 = v9;
      v11 = v14;
      goto LABEL_18;
    }
  }
  return 0;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)sampleBufferAttachments
{
  return self->_private.sampleBufferAttachments;
}

- (unint64_t)dispatchType
{
  return self->_private.dispatchType;
}

- (void)setDispatchType:(unint64_t)a3
{
  self->_private.dispatchType = a3;
}

- (unsigned)substreamCount
{
  return self->_private.substreamCount;
}

- (void)setSubstreamCount:(unsigned int)a3
{
  self->_private.substreamCount = a3;
}

- (BOOL)allowCommandEncoderCoalescing
{
  return self->_private.allowCommandEncoderCoalescing;
}

- (void)setAllowCommandEncoderCoalescing:(BOOL)a3
{
  self->_private.allowCommandEncoderCoalescing = a3;
}

@end