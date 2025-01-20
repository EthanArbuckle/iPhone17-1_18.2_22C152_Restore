@interface AMSThreadSafeObject
- (AMSThreadSafeObject)init;
- (AMSThreadSafeObject)initWithObject:(id)a3;
- (id)accessAndSetObjectWithBlock:(id)a3;
- (id)object;
- (id)underlyingObject;
- (os_unfair_lock_s)lock;
- (void)read:(id)a3;
- (void)readWrite:(id)a3;
- (void)setObject:(id)a3;
- (void)setUnderlyingObject:(id)a3;
@end

@implementation AMSThreadSafeObject

- (void)read:(id)a3
{
  p_lock = &self->_lock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = [(AMSThreadSafeObject *)self underlyingObject];
  v5[2](v5, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)readWrite:(id)a3
{
  p_lock = &self->_lock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = [(AMSThreadSafeObject *)self underlyingObject];
  v7 = v5[2](v5, v6);

  [(AMSThreadSafeObject *)self setUnderlyingObject:v7];
  os_unfair_lock_unlock(p_lock);
}

- (id)underlyingObject
{
  os_unfair_lock_assert_owner(&self->_lock);
  id underlyingObject = self->_underlyingObject;
  return underlyingObject;
}

- (void)setUnderlyingObject:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id underlyingObject = self->_underlyingObject;
  self->_id underlyingObject = v4;
}

- (AMSThreadSafeObject)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSThreadSafeObject;
  v6 = [(AMSThreadSafeObject *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v6->_underlyingObject, a3);
  }

  return v7;
}

- (AMSThreadSafeObject)init
{
  return [(AMSThreadSafeObject *)self initWithObject:0];
}

- (id)accessAndSetObjectWithBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = [(AMSThreadSafeObject *)self underlyingObject];
  v7 = v5[2](v5, v6);

  [(AMSThreadSafeObject *)self setUnderlyingObject:v7];
  os_unfair_lock_lock(p_lock);
  return v7;
}

- (id)object
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock_with_options();
  id v4 = [(AMSThreadSafeObject *)self underlyingObject];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock_with_options();
  [(AMSThreadSafeObject *)self setUnderlyingObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end