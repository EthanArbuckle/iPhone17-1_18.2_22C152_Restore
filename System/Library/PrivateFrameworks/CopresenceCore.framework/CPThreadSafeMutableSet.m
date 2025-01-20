@interface CPThreadSafeMutableSet
- (BOOL)containsObject:(id)a3;
- (CPThreadSafeMutableSet)init;
- (id)description;
- (os_unfair_lock_s)operationLock;
- (void)addObject:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation CPThreadSafeMutableSet

- (CPThreadSafeMutableSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPThreadSafeMutableSet;
  v2 = [(CPThreadSafeMutableSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    mutableSet = v2->_mutableSet;
    v2->_mutableSet = (NSMutableSet *)v3;

    v2->_operationLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CPThreadSafeMutableSet;
  v4 = [(CPThreadSafeMutableSet *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_mutableSet];

  return v5;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_operationLock);
  [(NSMutableSet *)self->_mutableSet addObject:v4];
  os_unfair_lock_unlock(&self->_operationLock);
}

- (void)unionSet:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_operationLock);
  [(NSMutableSet *)self->_mutableSet unionSet:v4];
  os_unfair_lock_unlock(&self->_operationLock);
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  LOBYTE(self) = [(NSMutableSet *)self->_mutableSet containsObject:v4];
  os_unfair_lock_unlock(p_operationLock);

  return (char)self;
}

- (os_unfair_lock_s)operationLock
{
  return self->_operationLock;
}

- (void).cxx_destruct
{
}

@end