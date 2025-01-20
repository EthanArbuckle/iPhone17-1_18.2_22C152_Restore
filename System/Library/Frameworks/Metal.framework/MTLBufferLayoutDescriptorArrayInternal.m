@interface MTLBufferLayoutDescriptorArrayInternal
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)dealloc;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLBufferLayoutDescriptorArrayInternal

- (void)dealloc
{
  uint64_t v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 31);
  v5.receiver = self;
  v5.super_class = (Class)MTLBufferLayoutDescriptorArrayInternal;
  [(MTLBufferLayoutDescriptorArrayInternal *)&v5 dealloc];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 >= 0x1F) {
    MTLReportFailure(0, "-[MTLBufferLayoutDescriptorArrayInternal objectAtIndexedSubscript:]", 250, @"bufferIndex(%lu) must be < %lu.", v3, v4, v5, v6, a3);
  }
  descriptors = self->_descriptors;
  id result = descriptors[a3];
  if (!result)
  {
    id result = objc_alloc_init(MTLBufferLayoutDescriptorInternal);
    descriptors[a3] = (MTLBufferLayoutDescriptorInternal *)result;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLBufferLayoutDescriptorArrayInternal setObject:atIndexedSubscript:]", 260, @"bufferDesc is not a MTLVertexBufferLayoutDescriptor.", v4, v5, v6, v7, v12);
    }
  }
  if (a4 >= 0x1F) {
    MTLReportFailure(0, "-[MTLBufferLayoutDescriptorArrayInternal setObject:atIndexedSubscript:]", 262, @"bufferIndex(%lu) must be < %lu.", v4, v5, v6, v7, a4);
  }
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLBufferLayoutDescriptorInternal *)[a3 copy];
  }
}

@end