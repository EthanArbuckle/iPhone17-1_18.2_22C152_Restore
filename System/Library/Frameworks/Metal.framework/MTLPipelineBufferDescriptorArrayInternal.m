@interface MTLPipelineBufferDescriptorArrayInternal
- (BOOL)isEqual:(id)a3;
- (id)_descriptorAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)dealloc;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLPipelineBufferDescriptorArrayInternal

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_descriptors[a3];
}

- (void)dealloc
{
  uint64_t v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 31);
  v5.receiver = self;
  v5.super_class = (Class)MTLPipelineBufferDescriptorArrayInternal;
  [(MTLPipelineBufferDescriptorArrayInternal *)&v5 dealloc];
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
    if (Class == object_getClass(a3))
    {
      uint64_t v7 = 0;
      descriptors = self->_descriptors;
      v9 = (char *)a3 + 8;
      do
      {
        v10 = descriptors[v7];
        v11 = *(MTLPipelineBufferDescriptorInternal **)&v9[v7 * 8];
        if (v10 != v11)
        {
          if (v10) {
            BOOL v12 = v11 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {
            if (v10)
            {
              BOOL v6 = [(MTLPipelineBufferDescriptorInternal *)v10 isDefault];
              if (!v6) {
                return v6;
              }
              v11 = *(MTLPipelineBufferDescriptorInternal **)&v9[v7 * 8];
            }
            if (v11)
            {
              BOOL v6 = [(MTLPipelineBufferDescriptorInternal *)v11 isDefault];
              if (!v6) {
                return v6;
              }
            }
          }
          else if (!-[MTLPipelineBufferDescriptorInternal isEqual:](v10, "isEqual:"))
          {
            goto LABEL_3;
          }
        }
        ++v7;
      }
      while (v7 != 31);
      LOBYTE(v6) = 1;
    }
    else
    {
LABEL_3:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 >= 0x1F) {
    MTLReportFailure(0, "-[MTLPipelineBufferDescriptorArrayInternal objectAtIndexedSubscript:]", 269, @"bufferIndex(%lu) must be < %lu", v3, v4, v5, v6, a3);
  }
  descriptors = self->_descriptors;
  id result = descriptors[a3];
  if (!result)
  {
    id result = objc_alloc_init(MTLPipelineBufferDescriptorInternal);
    uint64_t v11 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&descriptors[a3], (unint64_t *)&v11, (unint64_t)result);
    if (v11)
    {

      return descriptors[a3];
    }
    else
    {
      descriptors[a3] = (MTLPipelineBufferDescriptorInternal *)result;
    }
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLPipelineBufferDescriptorArrayInternal setObject:atIndexedSubscript:]", 286, @"buffer is not a MTLPipelineBufferDescriptor.", v4, v5, v6, v7, v12);
    }
  }
  if (a4 >= 0x1F) {
    MTLReportFailure(0, "-[MTLPipelineBufferDescriptorArrayInternal setObject:atIndexedSubscript:]", 288, @"bufferIndex(%lu) must be < %lu", v4, v5, v6, v7, a4);
  }
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLPipelineBufferDescriptorInternal *)[a3 copy];
  }
}

@end