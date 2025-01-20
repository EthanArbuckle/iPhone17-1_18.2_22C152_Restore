@interface MTLIOCommandQueueDescriptor
- (BOOL)isEqual:(id)a3;
- (MTLIOCommandQueueDescriptor)init;
- (MTLIOCommandQueueType)type;
- (MTLIOPriority)priority;
- (NSUInteger)maxCommandBufferCount;
- (NSUInteger)maxCommandsInFlight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)scratchBufferAllocator;
- (unint64_t)hash;
- (unint64_t)maxWorkerThreads;
- (void)dealloc;
- (void)setMaxCommandBufferCount:(NSUInteger)maxCommandBufferCount;
- (void)setMaxCommandsInFlight:(NSUInteger)maxCommandsInFlight;
- (void)setMaxWorkerThreads:(unint64_t)a3;
- (void)setPriority:(MTLIOPriority)priority;
- (void)setScratchBufferAllocator:(id)scratchBufferAllocator;
- (void)setType:(MTLIOCommandQueueType)type;
@end

@implementation MTLIOCommandQueueDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMaxCommandBufferCount:", -[MTLIOCommandQueueDescriptor maxCommandBufferCount](self, "maxCommandBufferCount"));
  objc_msgSend(v4, "setPriority:", -[MTLIOCommandQueueDescriptor priority](self, "priority"));
  objc_msgSend(v4, "setScratchBufferAllocator:", -[MTLIOCommandQueueDescriptor scratchBufferAllocator](self, "scratchBufferAllocator"));
  objc_msgSend(v4, "setType:", -[MTLIOCommandQueueDescriptor type](self, "type"));
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
  NSUInteger v6 = [(MTLIOCommandQueueDescriptor *)self maxCommandBufferCount];
  if (v6 != [a3 maxCommandBufferCount]) {
    return 0;
  }
  MTLIOPriority v7 = [(MTLIOCommandQueueDescriptor *)self priority];
  if (v7 != [a3 priority]
    || (objc_msgSend(-[MTLIOCommandQueueDescriptor scratchBufferAllocator](self, "scratchBufferAllocator"), "isEqual:", objc_msgSend(a3, "scratchBufferAllocator")) & 1) != 0)
  {
    return 0;
  }
  MTLIOCommandQueueType v9 = [(MTLIOCommandQueueDescriptor *)self type];
  return v9 == [a3 type];
}

- (unint64_t)hash
{
  bzero(&v4, 0x28uLL);
  NSUInteger v5 = [(MTLIOCommandQueueDescriptor *)self maxCommandBufferCount];
  MTLIOPriority v6 = [(MTLIOCommandQueueDescriptor *)self priority];
  uint64_t v7 = objc_msgSend(-[MTLIOCommandQueueDescriptor scratchBufferAllocator](self, "scratchBufferAllocator"), "hash");
  MTLIOCommandQueueType v8 = [(MTLIOCommandQueueDescriptor *)self type];
  return _MTLHashState(&v4, 0x28uLL);
}

- (MTLIOCommandQueueDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIOCommandQueueDescriptor;
  result = [(MTLIOCommandQueueDescriptor *)&v3 init];
  if (result)
  {
    result->_type = 0;
    result->_maxWorkerThreads = 4;
    *(_OWORD *)&result->_maxCommandBufferCount = xmmword_1828F0FB0;
    result->_scratchBufferAllocator = 0;
  }
  return result;
}

- (id)formattedDescription:(unint64_t)a3
{
  v14[12] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  NSUInteger v5 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)MTLIOCommandQueueDescriptor;
  id v6 = [(MTLIOCommandQueueDescriptor *)&v13 description];
  v14[0] = v4;
  v14[1] = @"maxCommandBufferCount =";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_maxCommandBufferCount];
  MTLIOCommandQueueType v8 = 0;
  v14[2] = v7;
  v14[3] = v4;
  v14[4] = @"priority =";
  unint64_t priority = self->_priority;
  if (priority <= 2) {
    MTLIOCommandQueueType v8 = off_1E5221068[priority];
  }
  v14[5] = v8;
  v14[6] = v4;
  scratchBufferAllocator = self->_scratchBufferAllocator;
  int64_t type = self->_type;
  v14[7] = @"scratchBufferAllocator =";
  v14[8] = scratchBufferAllocator;
  v14[9] = v4;
  v14[10] = @"type =";
  v14[11] = [NSNumber numberWithInteger:type];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 12), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLIOCommandQueueDescriptor *)self formattedDescription:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIOCommandQueueDescriptor;
  [(MTLIOCommandQueueDescriptor *)&v3 dealloc];
}

- (NSUInteger)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (void)setMaxCommandBufferCount:(NSUInteger)maxCommandBufferCount
{
  self->_maxCommandBufferCount = maxCommandBufferCount;
}

- (MTLIOPriority)priority
{
  return self->_priority;
}

- (void)setPriority:(MTLIOPriority)priority
{
  self->_unint64_t priority = priority;
}

- (id)scratchBufferAllocator
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setScratchBufferAllocator:(id)scratchBufferAllocator
{
}

- (MTLIOCommandQueueType)type
{
  return self->_type;
}

- (void)setType:(MTLIOCommandQueueType)type
{
  self->_int64_t type = type;
}

- (NSUInteger)maxCommandsInFlight
{
  return self->_maxCommandsInFlight;
}

- (void)setMaxCommandsInFlight:(NSUInteger)maxCommandsInFlight
{
  self->_maxCommandsInFlight = maxCommandsInFlight;
}

- (unint64_t)maxWorkerThreads
{
  return self->_maxCommandsInFlight;
}

- (void)setMaxWorkerThreads:(unint64_t)a3
{
  self->_maxCommandsInFlight = a3;
}

@end