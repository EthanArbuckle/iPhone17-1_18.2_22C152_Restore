@interface HMMManagedEphemeralContainer
- (BOOL)isActive;
- (HMMManagedEphemeralContainer)initWithContainerName:(id)a3;
- (NSString)containerName;
- (double)activeDuration;
- (double)startTime;
- (void)setActive:(BOOL)a3;
- (void)setStartTime:(double)a3;
@end

@implementation HMMManagedEphemeralContainer

- (void).cxx_destruct
{
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setActive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_active)
  {
    HMFUptime();
    self->_activeDuration = v5 - self->_startTime;
    self->_active = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)activeDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_active)
  {
    HMFUptime();
    double activeDuration = v4 - self->_startTime;
  }
  else
  {
    double activeDuration = self->_activeDuration;
  }
  os_unfair_lock_unlock(p_lock);
  return activeDuration;
}

- (HMMManagedEphemeralContainer)initWithContainerName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMManagedEphemeralContainer;
  v6 = [(HMMManagedEphemeralContainer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerName, a3);
    HMFUptime();
    v7->_startTime = v8;
    v7->_active = 1;
  }

  return v7;
}

@end