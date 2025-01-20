@interface CalDatabaseWriteLock
+ (id)canonicalizePath:(id)a3;
+ (id)writeLockForDatabasePath:(id)a3;
- (CalDatabaseWriteLock)init;
- (void)lock;
- (void)performWithWriteLock:(id)a3;
- (void)unlock;
@end

@implementation CalDatabaseWriteLock

+ (id)writeLockForDatabasePath:(id)a3
{
  v3 = [a1 canonicalizePath:a3];
  os_unfair_lock_lock((os_unfair_lock_t)&writeLockForDatabasePath___global_lock);
  v4 = (void *)writeLockForDatabasePath___writeLocks;
  if (!writeLockForDatabasePath___writeLocks)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v6 = (void *)writeLockForDatabasePath___writeLocks;
    writeLockForDatabasePath___writeLocks = v5;

    v4 = (void *)writeLockForDatabasePath___writeLocks;
  }
  v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    v7 = objc_alloc_init(CalDatabaseWriteLock);
    [(id)writeLockForDatabasePath___writeLocks setObject:v7 forKey:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&writeLockForDatabasePath___global_lock);

  return v7;
}

+ (id)canonicalizePath:(id)a3
{
  id v3 = a3;
  if (([v3 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v4 = [v3 stringByAppendingString:@"/"];

    id v3 = (id)v4;
  }
  return v3;
}

- (CalDatabaseWriteLock)init
{
  v3.receiver = self;
  v3.super_class = (Class)CalDatabaseWriteLock;
  result = [(CalDatabaseWriteLock *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)performWithWriteLock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  self = (CalDatabaseWriteLock *)((char *)self + 8);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)self);
}

@end