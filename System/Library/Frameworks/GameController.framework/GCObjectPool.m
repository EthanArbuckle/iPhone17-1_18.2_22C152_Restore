@interface GCObjectPool
- (BOOL)addObjectWith:(id)a3;
- (GCObjectPool)init;
- (id)takeObjectOrCreateWith:(id)a3;
@end

@implementation GCObjectPool

- (GCObjectPool)init
{
  v6.receiver = self;
  v6.super_class = (Class)GCObjectPool;
  v2 = [(GCObjectPool *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    objects = v2->objects;
    v2->objects = (NSMutableArray *)v3;

    v2->lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)takeObjectOrCreateWith:(id)a3
{
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->lock);
  uint64_t v5 = [(NSMutableArray *)self->objects lastObject];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    [(NSMutableArray *)self->objects removeLastObject];
    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->lock);
    objc_super v6 = v4[2](v4);
  }

  return v6;
}

- (BOOL)addObjectWith:(id)a3
{
  v4 = (void (**)(void))a3;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  unint64_t v6 = [(NSMutableArray *)self->objects count];
  if (v6 <= 9)
  {
    objects = self->objects;
    v8 = v4[2](v4);
    [(NSMutableArray *)objects addObject:v8];
  }
  os_unfair_lock_unlock(p_lock);

  return v6 < 0xA;
}

- (void).cxx_destruct
{
}

@end