@interface DYMTLIndirectCommandBufferInfo
- (DYMTLIndirectCommandBufferInfo)initWithMaxCommandCount:(unint64_t)a3 options:(unint64_t)a4 maxKernelThreadgroupMemoryBindCount:(unint64_t)a5;
- (unint64_t)maxCommandCount;
- (unint64_t)maxKernelThreadgroupMemoryBindCount;
- (unint64_t)options;
@end

@implementation DYMTLIndirectCommandBufferInfo

- (DYMTLIndirectCommandBufferInfo)initWithMaxCommandCount:(unint64_t)a3 options:(unint64_t)a4 maxKernelThreadgroupMemoryBindCount:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DYMTLIndirectCommandBufferInfo;
  result = [(DYMTLIndirectCommandBufferInfo *)&v9 init];
  if (result)
  {
    result->_maxCommandCount = a3;
    result->_options = a4;
    result->_maxKernelThreadgroupMemoryBindCount = a5;
  }
  return result;
}

- (unint64_t)maxCommandCount
{
  return self->_maxCommandCount;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)maxKernelThreadgroupMemoryBindCount
{
  return self->_maxKernelThreadgroupMemoryBindCount;
}

@end