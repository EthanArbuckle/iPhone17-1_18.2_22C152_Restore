@interface MTLRenderPipelineColorAttachmentDescriptorArrayInternal
- (id)_descriptorAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)dealloc;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLRenderPipelineColorAttachmentDescriptorArrayInternal

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 >= 8) {
    MTLReportFailure(0, "-[MTLRenderPipelineColorAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 1952, @"attachmentIndex(%lu) must be < %lu", v3, v4, v5, v6, a3);
  }
  descriptors = self->_descriptors;
  id result = descriptors[a3];
  if (!result)
  {
    id result = objc_alloc_init(MTLRenderPipelineColorAttachmentDescriptorInternal);
    uint64_t v11 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&descriptors[a3], (unint64_t *)&v11, (unint64_t)result);
    if (v11)
    {

      return descriptors[a3];
    }
    else
    {
      descriptors[a3] = (MTLRenderPipelineColorAttachmentDescriptorInternal *)result;
    }
  }
  return result;
}

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_descriptors[a3];
}

- (void)dealloc
{
  uint64_t v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 8);
  v5.receiver = self;
  v5.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorArrayInternal;
  [(MTLRenderPipelineColorAttachmentDescriptorArrayInternal *)&v5 dealloc];
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1969, @"attachment is not a MTLRenderPipelineColorAttachmentDescriptor.", v4, v5, v6, v7, v12);
    }
  }
  if (a4 >= 8) {
    MTLReportFailure(0, "-[MTLRenderPipelineColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1971, @"attachmentIndex(%lu) must be < %lu", v4, v5, v6, v7, a4);
  }
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLRenderPipelineColorAttachmentDescriptorInternal *)[a3 copy];
  }
}

@end