@interface RTCoreRoutineAccountNotificationPlugin
- (RTCoreRoutineAccountNotificationPlugin)init;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation RTCoreRoutineAccountNotificationPlugin

- (RTCoreRoutineAccountNotificationPlugin)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTCoreRoutineAccountNotificationPlugin;
  v2 = [(RTCoreRoutineAccountNotificationPlugin *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F37F08] defaultManager];
    routineManager = v2->_routineManager;
    v2->_routineManager = (RTRoutineManager *)v3;
  }
  return v2;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a6;
  uint64_t v9 = [a3 coreRoutineDataclassEnabled];
  int v10 = [v8 coreRoutineDataclassEnabled];

  if (v9 != v10)
  {
    v11 = sub_2405886F4(qword_268C88B60);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_240587000, v11, OS_LOG_TYPE_INFO, "Setting the routine cloud sync auth state, %d", (uint8_t *)v12, 8u);
    }

    [(RTRoutineManager *)self->_routineManager updateCloudSyncProvisionedForAccount:v9 handler:&unk_26F4A8CA8];
  }
}

- (void).cxx_destruct
{
}

@end