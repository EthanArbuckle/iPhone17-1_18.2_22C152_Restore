@interface MXBluetoothServices
@end

@implementation MXBluetoothServices

void __MXBluetoothServices_RegisterForAudioRoutingChanged_block_invoke()
{
  v0 = (void *)MEMORY[0x1997179E0]();
  mxBluetoothServices_handleAudioRoutingChanged();
}

void __MXBluetoothServices_RegisterForPreemptivePortChanged_block_invoke()
{
}

void __MXBluetoothServices_RegisterForPreemptivePortDisconnected_block_invoke()
{
}

void __MXBluetoothServices_QueryAudioRoutingActionForNewWirelessPort_block_invoke(void *a1, void *a2)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if ([a2 action] == 1)
  {
    CFStringAppend(Mutable, @"managed, route");
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    uint64_t v5 = *(void *)(a1[5] + 8);
LABEL_7:
    *(unsigned char *)(v5 + 24) = 1;
    goto LABEL_8;
  }
  if ([a2 action] == 3
    || [a2 action] == 4
    || [a2 action] == 6)
  {
    CFStringAppend(Mutable, @"managed, don't route ");
    uint64_t v5 = *(void *)(a1[4] + 8);
    goto LABEL_7;
  }
  if ([a2 action] == 2)
  {
    CFStringAppend(Mutable, @"unmanaged ");
  }
  else if (![a2 action])
  {
    CFStringAppend(Mutable, @"invalid(possibly because of timeout) ");
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
LABEL_8:
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t __MXBluetoothServices_IsPortBTManaged_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 action];
  if (result == 1
    || (uint64_t result = [a2 action], result == 3)
    || (uint64_t result = [a2 action], result == 4)
    || (uint64_t result = [a2 action], result == 6))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    uint64_t result = [a2 action];
    if (!result)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  if (dword_1E9359ED0)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end