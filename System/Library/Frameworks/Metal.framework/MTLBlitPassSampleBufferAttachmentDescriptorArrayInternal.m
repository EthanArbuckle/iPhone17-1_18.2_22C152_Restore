@interface MTLBlitPassSampleBufferAttachmentDescriptorArrayInternal
- (id)_descriptorAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)dealloc;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLBlitPassSampleBufferAttachmentDescriptorArrayInternal

- (void)dealloc
{
  uint64_t v3 = 0;
  sampleDescriptors = self->_sampleDescriptors;
  do

  while (v3 != 4);
  v5.receiver = self;
  v5.super_class = (Class)MTLBlitPassSampleBufferAttachmentDescriptorArrayInternal;
  [(MTLBlitPassSampleBufferAttachmentDescriptorArrayInternal *)&v5 dealloc];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 >= 4) {
    MTLReportFailure(0, "-[MTLBlitPassSampleBufferAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 188, @"attachmentIndex(%lu) must be < %lu", v3, v4, v5, v6, a3);
  }
  sampleDescriptors = self->_sampleDescriptors;
  id result = sampleDescriptors[a3];
  if (!result)
  {
    id result = objc_alloc_init(MTLBlitPassSampleBufferAttachmentDescriptorInternal);
    uint64_t v11 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&sampleDescriptors[a3], (unint64_t *)&v11, (unint64_t)result);
    if (v11)
    {

      return sampleDescriptors[a3];
    }
    else
    {
      sampleDescriptors[a3] = (MTLBlitPassSampleBufferAttachmentDescriptorInternal *)result;
    }
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (a4 >= 4) {
    MTLReportFailure(0, "-[MTLBlitPassSampleBufferAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 204, @"attachmentIndex(%lu) must be < %lu", v4, v5, v6, v7, a4);
  }
  sampleDescriptors = self->_sampleDescriptors;
  if (sampleDescriptors[a4] != a3)
  {
    v12 = sampleDescriptors[a4];
    sampleDescriptors[a4] = (MTLBlitPassSampleBufferAttachmentDescriptorInternal *)[a3 copy];
  }
}

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_sampleDescriptors[a3];
}

@end