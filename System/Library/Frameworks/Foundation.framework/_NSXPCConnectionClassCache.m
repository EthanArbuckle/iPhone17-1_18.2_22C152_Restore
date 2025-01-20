@interface _NSXPCConnectionClassCache
- (_NSXPCConnectionClassCache)init;
- (os_unfair_lock_s)containsClass:(os_unfair_lock_s *)result;
- (void)addClass:(uint64_t)a1;
- (void)clear;
- (void)dealloc;
@end

@implementation _NSXPCConnectionClassCache

- (os_unfair_lock_s)containsClass:(os_unfair_lock_s *)result
{
  if (result)
  {
    v3 = result;
    v4 = result + 4;
    os_unfair_lock_lock_with_options();
    v5 = *(void **)&v3[2]._os_unfair_lock_opaque;
    if (!v5)
    {
      v5 = objc_opt_new();
      *(void *)&v3[2]._os_unfair_lock_opaque = v5;
    }
    uint64_t v6 = [v5 containsObject:a2];
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)v6;
  }
  return result;
}

- (void)addClass:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    v5 = *(void **)(a1 + 8);
    if (!v5)
    {
      v5 = objc_opt_new();
      *(void *)(a1 + 8) = v5;
    }
    [v5 addObject:a2];
    os_unfair_lock_unlock(v4);
  }
}

- (_NSXPCConnectionClassCache)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCConnectionClassCache;
  result = [(_NSXPCConnectionClassCache *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSXPCConnectionClassCache;
  [(_NSXPCConnectionClassCache *)&v3 dealloc];
}

- (void)clear
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock_with_options();
    objc_super v3 = *(void **)(a1 + 8);
    if (!v3)
    {
      objc_super v3 = objc_opt_new();
      *(void *)(a1 + 8) = v3;
    }
    [v3 removeAllObjects];
    os_unfair_lock_unlock(v2);
  }
}

@end