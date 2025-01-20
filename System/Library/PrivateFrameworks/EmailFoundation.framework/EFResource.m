@interface EFResource
- (BOOL)returnResource;
- (EFResource)init;
- (void)holdResource;
- (void)lock;
- (void)unlock;
@end

@implementation EFResource

- (void)unlock
{
}

- (BOOL)returnResource
{
  uint64_t add = atomic_fetch_add(&self->_lockCount, 0xFFFFFFFFFFFFFFFFLL);
  if (add <= 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"EFResource.m" lineNumber:130 description:@"returnResource called too many times"];
  }
  return add == 1;
}

- (void)lock
{
}

- (void)holdResource
{
}

- (EFResource)init
{
  v3.receiver = self;
  v3.super_class = (Class)EFResource;
  result = [(EFResource *)&v3 init];
  if (result)
  {
    result->_unfair_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unint64_t *)&result->_lockCount);
  }
  return result;
}

@end