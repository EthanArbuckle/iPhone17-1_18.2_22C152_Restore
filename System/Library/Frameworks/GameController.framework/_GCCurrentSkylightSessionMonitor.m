@interface _GCCurrentSkylightSessionMonitor
+ (id)sharedInstance;
- (_GCCurrentSkylightSessionMonitor)init;
- (int)secureInputPid;
- (void)dealloc;
@end

@implementation _GCCurrentSkylightSessionMonitor

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v0 = (void *)sharedInstance_Shared_0;

  return v0;
}

- (_GCCurrentSkylightSessionMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCCurrentSkylightSessionMonitor;
  return [(_GCCurrentSkylightSessionMonitor *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_GCCurrentSkylightSessionMonitor;
  [(_GCCurrentSkylightSessionMonitor *)&v2 dealloc];
}

- (int)secureInputPid
{
  return self->_secureInputPid;
}

@end