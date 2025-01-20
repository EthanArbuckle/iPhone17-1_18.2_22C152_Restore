@interface CPMemoryOwner
- (CPMemoryOwner)initWithAllocatedMemory:(void *)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
@end

@implementation CPMemoryOwner

- (void)dealloc
{
  [(CPMemoryOwner *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPMemoryOwner;
  [(CPMemoryOwner *)&v3 dealloc];
}

- (void)finalize
{
  [(CPMemoryOwner *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPMemoryOwner;
  [(CPMemoryOwner *)&v3 finalize];
}

- (void)dispose
{
  self->memory = 0;
}

- (CPMemoryOwner)initWithAllocatedMemory:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPMemoryOwner;
  result = [(CPMemoryOwner *)&v5 init];
  if (result) {
    result->memory = a3;
  }
  return result;
}

@end