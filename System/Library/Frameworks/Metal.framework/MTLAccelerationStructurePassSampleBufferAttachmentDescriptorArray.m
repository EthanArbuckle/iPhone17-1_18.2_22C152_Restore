@interface MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
- (id)_descriptorAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)copyFrom:(id)a3 withZone:(_NSZone *)a4;
- (void)dealloc;
- (void)setObject:(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)attachment atIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    uint64_t v23 = v8;
    uint64_t v24 = v7;
    uint64_t v25 = v6;
    uint64_t v26 = v5;
    uint64_t v27 = v4;
    uint64_t v28 = v3;
    uint64_t v29 = v9;
    uint64_t v30 = v10;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      uint64_t v15 = 0;
      sampleDescriptors = self->_sampleDescriptors;
      do
      {
        v17 = sampleDescriptors[v15];
        uint64_t v18 = objc_msgSend(a3, "objectAtIndexedSubscript:", v15, v23, v24, v25, v26, v27, v28, v29, v30);
        if (v17 != (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v18)
        {
          v19 = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v18;
          if (v17) {
            BOOL v20 = v18 == 0;
          }
          else {
            BOOL v20 = 0;
          }
          if (v20)
          {
            v19 = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
            *((void *)a3 + v15 + 1) = v19;
          }
          else if (v18 && !v17)
          {
            v17 = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
            sampleDescriptors[v15] = v17;
          }
          if (v19) {
            BOOL v21 = v17 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21) {
            goto LABEL_3;
          }
          BOOL v14 = [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v17 isEqual:v19];
          if (!v14) {
            return v14;
          }
        }
        ++v15;
      }
      while (v15 != 4);
      LOBYTE(v14) = 1;
    }
    else
    {
LABEL_3:
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (void)dealloc
{
  for (uint64_t i = 8; i != 40; i += 8)

  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray;
  [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray *)&v4 dealloc];
}

- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  if (attachmentIndex >= 4) {
    MTLReportFailure(0, "-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]", 756, @"attachmentIndex(%lu) must be < %lu", v3, v4, v5, v6, attachmentIndex);
  }
  sampleDescriptors = self->_sampleDescriptors;
  result = sampleDescriptors[attachmentIndex];
  if (!result)
  {
    result = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
    uint64_t v11 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&sampleDescriptors[attachmentIndex], (unint64_t *)&v11, (unint64_t)result);
    if (v11)
    {

      return sampleDescriptors[attachmentIndex];
    }
    else
    {
      sampleDescriptors[attachmentIndex] = result;
    }
  }
  return result;
}

- (void)setObject:(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)attachment atIndexedSubscript:(NSUInteger)attachmentIndex
{
  if (attachmentIndex >= 4) {
    MTLReportFailure(0, "-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]", 772, @"attachmentIndex(%lu) must be < %lu", v4, v5, v6, v7, attachmentIndex);
  }
  sampleDescriptors = self->_sampleDescriptors;
  if (sampleDescriptors[attachmentIndex] != attachment)
  {
    v12 = sampleDescriptors[attachmentIndex];
    sampleDescriptors[attachmentIndex] = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)[(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)attachment copy];
  }
}

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_sampleDescriptors[a3];
}

- (void)copyFrom:(id)a3 withZone:(_NSZone *)a4
{
  uint64_t v6 = 0;
  sampleDescriptors = self->_sampleDescriptors;
  do
  {
    sampleDescriptors[v6] = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)objc_msgSend((id)objc_msgSend(a3, "_descriptorAtIndex:", v6), "copyWithZone:", a4);
    ++v6;
  }
  while (v6 != 4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  [v5 copyFrom:self withZone:a3];
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  sampleDescriptors = self->_sampleDescriptors;
  do
  {
    id v5 = sampleDescriptors[v2];
    if (v5) {
      v3 ^= [(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v5 hash] << v2;
    }
    ++v2;
  }
  while (v2 != 4);
  return v3;
}

@end