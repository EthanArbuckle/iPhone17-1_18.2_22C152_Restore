@interface HMMutableAssistantAccessControl
- (BOOL)allowUnauthenticatedRequests;
- (BOOL)areActivityNotificationsEnabledForPersonalRequests;
- (BOOL)isEnabled;
- (NSArray)accessories;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)options;
- (void)addAccessory:(id)a3;
- (void)removeAccessory:(id)a3;
- (void)setAccessories:(id)a3;
- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3;
- (void)setAllowUnauthenticatedRequests:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation HMMutableAssistantAccessControl

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[HMAssistantAccessControl allocWithZone:](HMAssistantAccessControl, "allocWithZone:");
  v6 = [(HMAccessControl *)self user];
  uint64_t v7 = [(HMAssistantAccessControl *)v5 initWithUser:v6];

  *(unsigned char *)(v7 + 36) = [(HMMutableAssistantAccessControl *)self isEnabled];
  *(void *)(v7 + 40) = [(HMMutableAssistantAccessControl *)self options];
  *(unsigned char *)(v7 + 56) = [(HMMutableAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests];
  uint64_t v8 = [(NSSet *)self->super._accessories copyWithZone:a3];
  v9 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v8;

  return (id)v7;
}

- (void)removeAccessory:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v9);
  }
  id v10 = v5;
  os_unfair_lock_lock_with_options();
  if ([(NSSet *)self->super._accessories containsObject:v10])
  {
    v6 = (void *)[(NSSet *)self->super._accessories mutableCopy];
    [v6 removeObject:v10];
    uint64_t v7 = (NSSet *)[v6 copy];
    accessories = self->super._accessories;
    self->super._accessories = v7;
  }
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)addAccessory:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  char v6 = __validateAccessories(v5);

  if ((v6 & 1) == 0)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v7 = [(NSSet *)self->super._accessories setByAddingObject:v4];
  accessories = self->super._accessories;
  self->super._accessories = v7;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)setAccessories:(id)a3
{
  id v8 = a3;
  if (__validateAccessories(v8))
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    os_unfair_lock_lock_with_options();
    accessories = self->super._accessories;
    self->super._accessories = v4;

    os_unfair_lock_unlock(&self->super.super._lock);
  }
  else
  {
    char v6 = (HMMutableAssistantAccessControl *)_HMFPreconditionFailure();
    [(HMMutableAssistantAccessControl *)v6 accessories];
  }
}

- (NSArray)accessories
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSSet *)self->super._accessories allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)setAllowUnauthenticatedRequests:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFELL | v3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowUnauthenticatedRequests
{
  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->super._options & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOptions:(unint64_t)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->super._options = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)options
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t options = self->super._options;
  os_unfair_lock_unlock(p_lock);
  return options;
}

- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->super._activityNotificationsEnabledForPersonalRequests = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->super._activityNotificationsEnabledForPersonalRequests;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->super._enabled + 4) = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEnabled
{
  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->super._enabled + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

@end