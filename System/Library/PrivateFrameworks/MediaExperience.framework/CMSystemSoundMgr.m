@interface CMSystemSoundMgr
@end

@implementation CMSystemSoundMgr

void __CMSystemSoundMgr_Initialize_block_invoke()
{
  v0 = MXGetSerialQueue();
  MXDispatchAsyncAndWait((uint64_t)"CMSystemSoundMgr_Initialize_block_invoke", (uint64_t)"CMSessionManager_SystemSounds.m", 324, 0, 0, v0, (uint64_t)&__block_literal_global_4_6);
}

uint64_t __CMSystemSoundMgr_Initialize_block_invoke_2()
{
  MEMORY[0x199716E90](gCMSS_12);
  v0 = (void *)gCMSS_0;
  if (gCMSS_0)
  {
    int v1 = dword_1E9359ED0;
    do
    {
      if (v1)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v1 = dword_1E9359ED0;
      }
      v0 = (void *)*v0;
    }
    while (v0);
  }
  return MEMORY[0x199716EA0](gCMSS_12);
}

@end