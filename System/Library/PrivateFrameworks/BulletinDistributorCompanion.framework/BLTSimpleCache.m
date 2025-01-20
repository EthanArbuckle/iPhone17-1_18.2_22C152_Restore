@interface BLTSimpleCache
- (BLTSimpleCache)initWithCapacity:(unint64_t)a3;
- (id)description;
- (id)objects;
- (void)cacheObject:(id)a3;
@end

@implementation BLTSimpleCache

- (BLTSimpleCache)initWithCapacity:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BLTSimpleCache;
  v4 = [(BLTSimpleCache *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_capacity = a3;
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    objects = v5->_objects;
    v5->_objects = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)cacheObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_objects removeObject:v5];
  [(NSMutableArray *)self->_objects insertObject:v5 atIndex:0];

  if ([(NSMutableArray *)self->_objects count] > self->_capacity) {
    -[NSMutableArray removeObjectAtIndex:](self->_objects, "removeObjectAtIndex:");
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)objects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableArray *)self->_objects copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(BLTSimpleCache *)self objects];
  id v5 = (id)[v3 appendObject:v4 withName:@"objects" skipIfNil:0];

  uint64_t v6 = [v3 build];

  return v6;
}

- (void).cxx_destruct
{
}

@end