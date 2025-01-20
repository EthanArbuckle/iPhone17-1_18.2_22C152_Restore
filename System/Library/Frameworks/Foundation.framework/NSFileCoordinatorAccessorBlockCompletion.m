@interface NSFileCoordinatorAccessorBlockCompletion
+ (id)completionWithBlock:(id)a3;
- (void)dealloc;
- (void)decrement;
- (void)increment;
@end

@implementation NSFileCoordinatorAccessorBlockCompletion

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = atomic_load((unsigned int *)&self->count);
  if (v3 >= 1) {
    (*((void (**)(void))self->block + 2))();
  }

  v4.receiver = self;
  v4.super_class = (Class)NSFileCoordinatorAccessorBlockCompletion;
  [(NSFileCoordinatorAccessorBlockCompletion *)&v4 dealloc];
}

- (void)decrement
{
  unsigned int add = atomic_fetch_add(&self->count, 0xFFFFFFFF);
  if (add == 1)
  {
    (*((void (**)(void))self->block + 2))();

    self->block = 0;
  }
  else if (!add)
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Accessor completion counter over-decremented" userInfo:0]);
  }
}

+ (id)completionWithBlock:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (id)objc_opt_new();
  *((void *)v4 + 1) = [a3 copy];
  atomic_store(1u, (unsigned int *)v4 + 4);
  return v4;
}

- (void)increment
{
  if (!atomic_fetch_add(&self->count, 1u)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Accessor completion counter should never be incremented from 0 to 1" userInfo:0]);
  }
}

@end