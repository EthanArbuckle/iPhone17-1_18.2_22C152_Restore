@interface NSArray(NSKeyValueObserverRegistration)
- (uint64_t)addObserver:()NSKeyValueObserverRegistration toObjectsAtIndexes:forKeyPath:options:context:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:;
- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:context:;
- (void)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:;
- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:;
- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:;
@end

@implementation NSArray(NSKeyValueObserverRegistration)

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:context:
{
  uint64_t v11 = _CFGetTSD();
  if (!v11)
  {
    v12 = malloc_default_zone();
    uint64_t v11 = (uint64_t)malloc_type_zone_calloc(v12, 1uLL, 0x58uLL, 0xC2E5A2B2uLL);
    _CFSetTSD();
  }
  uint64_t v21 = *(void *)(v11 + 32);
  uint64_t v22 = *(void *)(v11 + 40);
  uint64_t v23 = *(void *)(v11 + 48);
  uint64_t v24 = *(void *)(v11 + 56);
  uint64_t v25 = *(void *)(v11 + 64);
  char v26 = *(unsigned char *)(v11 + 72);
  os_unfair_recursive_lock_lock_with_options();
  *(void *)(v11 + 40) = a3;
  *(void *)(v11 + 48) = a5;
  v13 = a5;
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = a6;
  *(unsigned char *)(v11 + 72) = 1;
  uint64_t v14 = [a4 firstIndex];
  v15 = 0;
  v16 = 0;
  while (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)[a1 objectAtIndex:v14];
    Class = object_getClass(v17);
    v19 = Class;
    if (Class != v15)
    {
      v16 = NSKeyValuePropertyForIsaAndKeyPath(Class, v13);
      v15 = v19;
    }
    *(void *)(v11 + 32) = v17;
    objc_msgSend(v17, "_removeObserver:forProperty:", a3, v16, v21, v22, v23, v24, v25);
    uint64_t v14 = [a4 indexGreaterThanIndex:v14];
  }
  uint64_t result = os_unfair_recursive_lock_unlock();
  *(void *)(v11 + 32) = v21;
  *(void *)(v11 + 40) = v22;
  *(void *)(v11 + 48) = v23;
  *(void *)(v11 + 56) = v24;
  *(void *)(v11 + 64) = v25;
  *(unsigned char *)(v11 + 72) = v26;
  return result;
}

- (uint64_t)addObserver:()NSKeyValueObserverRegistration toObjectsAtIndexes:forKeyPath:options:context:
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v13 = [a4 firstIndex];
  uint64_t v14 = 0;
  v15 = 0;
  while (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    Class = object_getClass((id)[a1 objectAtIndex:v13]);
    v17 = Class;
    if (Class != v14)
    {
      v15 = NSKeyValuePropertyForIsaAndKeyPath(Class, a5);
      uint64_t v14 = v17;
    }
    objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v13), "_addObserver:forProperty:options:context:", a3, v15, a6, a7);
    uint64_t v13 = [a4 indexGreaterThanIndex:v13];
  }

  return os_unfair_recursive_lock_unlock();
}

- (uint64_t)removeObserver:()NSKeyValueObserverRegistration fromObjectsAtIndexes:forKeyPath:
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v9 = [a4 firstIndex];
  v10 = 0;
  uint64_t v11 = 0;
  while (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)[a1 objectAtIndex:v9];
    Class = object_getClass(v12);
    uint64_t v14 = Class;
    if (Class != v10)
    {
      uint64_t v11 = NSKeyValuePropertyForIsaAndKeyPath(Class, a5);
      v10 = v14;
    }
    [v12 _removeObserver:a3 forProperty:v11];
    uint64_t v9 = [a4 indexGreaterThanIndex:v9];
  }

  return os_unfair_recursive_lock_unlock();
}

- (void)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:
{
  v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> addObserver:forKeyPath:options:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:
{
  v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:context:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:
{
  v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[<%@ %p> removeObserver:forKeyPath:] is not supported. Key path: %@", objc_opt_class(), a1, a4), 0 reason userInfo];
  objc_exception_throw(v4);
}

@end