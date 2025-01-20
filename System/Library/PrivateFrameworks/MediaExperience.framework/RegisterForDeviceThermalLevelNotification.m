@interface RegisterForDeviceThermalLevelNotification
@end

@implementation RegisterForDeviceThermalLevelNotification

uint64_t __cmsmdevicestate_RegisterForDeviceThermalLevelNotification_block_invoke()
{
  v0 = (const char *)*MEMORY[0x1E4F14918];
  global_queue = dispatch_get_global_queue(0, 0);
  return notify_register_dispatch(v0, (int *)&cmsmdevicestate_RegisterForDeviceThermalLevelNotification_thermalPressureToken, global_queue, &__block_literal_global_176);
}

void __cmsmdevicestate_RegisterForDeviceThermalLevelNotification_block_invoke_2(int a1, int token)
{
  state64[20] = *MEMORY[0x1E4F143B8];
  state64[0] = 0;
  notify_get_state(token, state64);
  if (state64[0] < 0x28)
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDeviceState_DeactivateHardwareSafetySession(@"non-resumable.thermalLevelDisengaged");
  }
  else
  {
    if (dword_1E9359ED0)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDeviceState_InterruptAllActiveSessionsAndSystemSounds();
  }
}

@end