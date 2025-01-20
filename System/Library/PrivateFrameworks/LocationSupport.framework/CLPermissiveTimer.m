@interface CLPermissiveTimer
- (void)invalidate;
- (void)shouldFire;
@end

@implementation CLPermissiveTimer

- (void)invalidate
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB30CE98);
  v3.receiver = self;
  v3.super_class = (Class)CLPermissiveTimer;
  [(CLTimer *)&v3 invalidate];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB30CE98);
}

- (void)shouldFire
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB30CE98);
  [(CLPermissiveTimer *)self dbgAssertInside];
  objc_super v3 = [(CLTimer *)self handler];

  if (v3)
  {
    v4 = [(CLTimer *)self handler];
    v5 = (void (**)(void))[v4 copy];

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB30CE98);
    v5[2]();
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB30CE98);
  }
}

@end