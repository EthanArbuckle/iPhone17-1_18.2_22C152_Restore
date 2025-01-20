@interface MTLRenderPassColorAttachmentDescriptorArrayInternal
- (id)_descriptorAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)dealloc;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLRenderPassColorAttachmentDescriptorArrayInternal

- (id)_descriptorAtIndex:(unint64_t)a3
{
  if (a3 <= 7)
  {
    v3 = (id *)&self->_color_descriptors[a3];
    return *v3;
  }
  if (a3 == 9)
  {
    uint64_t v4 = 80;
    goto LABEL_7;
  }
  if (a3 == 8)
  {
    uint64_t v4 = 72;
LABEL_7:
    v3 = (id *)((char *)&self->super.super.isa + v4);
    return *v3;
  }
  return 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 >= 8) {
    MTLReportFailure(0, "-[MTLRenderPassColorAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 1008, @"attachmentIndex(%lu) must be < %lu", v3, v4, v5, v6, a3);
  }
  color_descriptors = self->_color_descriptors;
  id result = color_descriptors[a3];
  if (!result)
  {
    id result = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorInternal);
    uint64_t v11 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&color_descriptors[a3], (unint64_t *)&v11, (unint64_t)result);
    if (v11)
    {

      return color_descriptors[a3];
    }
    else
    {
      color_descriptors[a3] = (MTLRenderPassColorAttachmentDescriptorInternal *)result;
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  color_descriptors = self->_color_descriptors;
  do

  while (v3 != 8);
  v5.receiver = self;
  v5.super_class = (Class)MTLRenderPassColorAttachmentDescriptorArrayInternal;
  [(MTLRenderPassColorAttachmentDescriptorArrayInternal *)&v5 dealloc];
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPassColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1025, @"attachment is not a MTLRenderPassColorAttachmentDescriptor.", v4, v5, v6, v7, v12);
    }
  }
  if (a4 >= 8) {
    MTLReportFailure(0, "-[MTLRenderPassColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1028, @"attachmentIndex(%lu) must be < %lu", v4, v5, v6, v7, a4);
  }
  color_descriptors = self->_color_descriptors;
  if (color_descriptors[a4] != a3)
  {
    v13 = color_descriptors[a4];
    color_descriptors[a4] = (MTLRenderPassColorAttachmentDescriptorInternal *)[a3 copy];
  }
}

@end