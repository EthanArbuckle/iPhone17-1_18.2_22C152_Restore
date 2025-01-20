@interface MTLResourceStatePassDescriptorInternal
+ (id)resourceStatePassDescriptor;
- (BOOL)isEqual:(id)a3;
- (MTLResourceStatePassDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sampleBufferAttachments;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation MTLResourceStatePassDescriptorInternal

+ (id)resourceStatePassDescriptor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (MTLResourceStatePassDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLResourceStatePassDescriptorInternal;
  id v2 = [(MTLResourceStatePassDescriptorInternal *)&v4 init];
  if (v2) {
    v2->_private.sampleBufferAttachments = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLResourceStatePassDescriptorInternal;
  [(MTLResourceStatePassDescriptorInternal *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  do
  {
    v5 = self->_private.sampleBufferAttachments->_sampleDescriptors[v3];
    if (v5) {
      v4 ^= (unint64_t)_MTLHashState((int *)&v5->_private, 0x18uLL) << v3;
    }
    ++v3;
  }
  while (v3 != 4);
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
  uint64_t v7 = 0;
  p_private = &self->_private;
  v9 = (MTLResourceStatePassDescriptorPrivate *)((char *)a3 + 8);
  do
  {
    v10 = p_private->sampleBufferAttachments->_sampleDescriptors[v7];
    v11 = v9->sampleBufferAttachments->_sampleDescriptors[v7];
    if (v10 == v11) {
      goto LABEL_25;
    }
    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      v14 = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorInternal);
      v15 = v9;
      v11 = v14;
      goto LABEL_17;
    }
    if (v10) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (!v13)
    {
      v14 = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorInternal);
      v15 = p_private;
      v10 = v14;
LABEL_17:
      v15->sampleBufferAttachments->_sampleDescriptors[v7] = v14;
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
LABEL_25:
    ++v7;
  }
  while (v7 != 4);
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v7 = self->_private.sampleBufferAttachments->_sampleDescriptors[i];
    if (v7) {
      *(void *)(v5[1] + 8 + i * 8) = [(MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *)v7 copyWithZone:a3];
    }
  }
  return v5;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)sampleBufferAttachments
{
  return self->_private.sampleBufferAttachments;
}

@end