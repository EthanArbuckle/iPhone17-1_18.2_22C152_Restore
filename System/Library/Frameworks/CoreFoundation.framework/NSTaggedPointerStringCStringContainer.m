@interface NSTaggedPointerStringCStringContainer
+ (id)taggedPointerStringCStringContainer;
- (NSTaggedPointerStringCStringContainer)retain;
- (void)release;
@end

@implementation NSTaggedPointerStringCStringContainer

- (void)release
{
  os_unfair_lock_lock_with_options();
  uint64_t v3 = nextAvailableCacheSlot;
  if (nextAvailableCacheSlot > 63)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
    [(NSTaggedPointerStringCStringContainer *)self dealloc];
  }
  else
  {
    ++nextAvailableCacheSlot;
    cache[v3] = self;
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }
}

+ (id)taggedPointerStringCStringContainer
{
  os_unfair_lock_lock_with_options();
  int v2 = nextAvailableCacheSlot;
  if (nextAvailableCacheSlot <= 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }
  else
  {
    --nextAvailableCacheSlot;
    uint64_t v3 = (NSTaggedPointerStringCStringContainer *)cache[v2 - 1];
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
    if (v3) {
      goto LABEL_6;
    }
  }
  uint64_t v3 = objc_alloc_init(NSTaggedPointerStringCStringContainer);
LABEL_6:

  return v3;
}

- (NSTaggedPointerStringCStringContainer)retain
{
  return self;
}

@end