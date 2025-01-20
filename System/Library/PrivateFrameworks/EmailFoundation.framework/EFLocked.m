@interface EFLocked
- (EFLocked)initWithObject:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)getObject;
- (id)replaceObject:(id)a3;
- (os_unfair_lock_s)unfairLockForTesting;
- (void)performWhileLocked:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation EFLocked

- (void).cxx_destruct
{
}

- (void)performWhileLocked:(id)a3
{
  p_lock = &self->_lock;
  v5 = (void (**)(id, id))a3;
  os_unfair_lock_lock(p_lock);
  v5[2](v5, self->_object);

  os_unfair_lock_unlock(p_lock);
}

- (EFLocked)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFLocked;
  v6 = [(EFLocked *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (id)getObject
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v4 = objc_opt_respondsToSelector();
  id object = self->_object;
  if (v4) {
    id v6 = (id)[object copyWithZone:0];
  }
  else {
    id v6 = object;
  }
  v7 = v6;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)replaceObject:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_object;
  id object = self->_object;
  self->_id object = v4;
  id v8 = v4;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EFLocked;
  id v4 = [(EFLocked *)&v8 description];
  id v5 = [self->_object description];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EFLocked;
  id v4 = [(EFLocked *)&v8 description];
  id v5 = [self->_object debugDescription];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id object = self->_object;
  self->_id object = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (os_unfair_lock_s)unfairLockForTesting
{
  return &self->_lock;
}

@end