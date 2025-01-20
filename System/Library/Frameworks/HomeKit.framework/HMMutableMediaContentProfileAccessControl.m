@interface HMMutableMediaContentProfileAccessControl
- (void)addAccessory:(id)a3;
- (void)removeAccessory:(id)a3;
- (void)setAccessories:(id)a3;
@end

@implementation HMMutableMediaContentProfileAccessControl

- (void)removeAccessory:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v5 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v5);
  }
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->super._internalAccessories removeObject:v6];
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)addAccessory:(id)a3
{
  id v6 = a3;
  if (!+[HMMediaContentProfileAccessControl isAccessorySupported:](HMMediaContentProfileAccessControl, "isAccessorySupported:"))
  {
    v5 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v5);
  }
  os_unfair_lock_lock_with_options();
  [(NSMutableSet *)self->super._internalAccessories addObject:v6];
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)setAccessories:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1E4F1CA80];
  v5 = (void *)[v8 copy];
  id v6 = [v4 setWithArray:v5];
  internalAccessories = self->super._internalAccessories;
  self->super._internalAccessories = v6;

  os_unfair_lock_unlock(&self->super.super._lock);
}

@end