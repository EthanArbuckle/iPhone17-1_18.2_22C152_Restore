@interface DTVMTrackingService
+ (void)registerCapabilities:(id)a3;
- (id)configureLaunchEnvironment:(id)a3;
- (id)requestVMSnapshot;
- (void)messageReceived:(id)a3;
- (void)setTargetPid:(id)a3 referenceDate:(id)a4;
@end

@implementation DTVMTrackingService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.vmtracking" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.vmtracking.immediate" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.vmtracking.deferred" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.dt.services.capabilities.vmtracking" withVersion:1 forClass:a1];
}

- (void)messageReceived:(id)a3
{
  id v4 = a3;
  if ((id)*MEMORY[0x263F38CC8] == v4)
  {
    mach_port_name_t targetTask = self->_targetTask;
    if (targetTask + 1 >= 2)
    {
      id v6 = v4;
      mach_port_deallocate(*MEMORY[0x263EF8960], targetTask);
      id v4 = v6;
      self->_mach_port_name_t targetTask = 0;
    }
  }
}

- (id)configureLaunchEnvironment:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)setTargetPid:(id)a3 referenceDate:(id)a4
{
  id v6 = a3;
  unsigned int v5 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", [v6 intValue]);
  self->_mach_port_name_t targetTask = v5;
  if (v5 + 1 >= 2) {
    self->_targetPid = [v6 intValue];
  }
}

- (id)requestVMSnapshot
{
  p_currentState = &self->_currentState;
  id v3 = +[XRVMState currentStateForTask:self->_targetTask pid:self->_targetPid previousState:self->_currentState dehydratedDiffVersion:1];
  objc_storeStrong((id *)p_currentState, v3);
  return v3;
}

- (void).cxx_destruct
{
}

@end