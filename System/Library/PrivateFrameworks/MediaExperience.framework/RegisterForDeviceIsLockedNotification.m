@interface RegisterForDeviceIsLockedNotification
@end

@implementation RegisterForDeviceIsLockedNotification

uint64_t __cmsmdevicestate_RegisterForDeviceIsLockedNotification_block_invoke()
{
  if (sMKBGetLockStatus) {
    BOOL v0 = sMKBGetLockStatus(0) != 0;
  }
  else {
    BOOL v0 = 0;
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x199716E90](qword_1E93589D0);
  byte_1E935893C = v0;
  return MEMORY[0x199716EA0](qword_1E93589D0);
}

@end