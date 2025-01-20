@interface PowerManager
@end

@implementation PowerManager

id __PowerManager_InitializeCPMSForHaptics_block_invoke()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  uint64_t v9 = 0;
  v0 = MXGetSerialQueue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __PowerManager_InitializeCPMSForHaptics_block_invoke_2;
  v3[3] = &unk_1E57C5B30;
  v3[4] = &v4;
  MXDispatchAsyncAndWait((uint64_t)"PowerManager_InitializeCPMSForHaptics_block_invoke", (uint64_t)"PowerManager_Haptics.m", 244, 0, 0, v0, (uint64_t)v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __PowerManager_InitializeCPMSForHaptics_block_invoke_2(uint64_t a1)
{
  uint64_t result = vaemCopyCPMSPowerBudget(6);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __PowerManager_InitializeCPMSForHaptics_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    int v8 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v4 = a2;
  v5 = MXGetSerialQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PowerManager_InitializeCPMSForHaptics_block_invoke_2_6;
  v6[3] = &unk_1E57C6368;
  v6[4] = a2;
  MXDispatchAsync((uint64_t)"PowerManager_InitializeCPMSForHaptics_block_invoke", (uint64_t)"PowerManager_Haptics.m", 276, 0, 0, v5, (uint64_t)v6);
}

void __PowerManager_InitializeCPMSForHaptics_block_invoke_2_6(uint64_t a1)
{
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    if (sCMSMPowerManagerForHaptics_6
      && (CFRelease((CFTypeRef)sCMSMPowerManagerForHaptics_6),
          sCMSMPowerManagerForHaptics_6 = 0,
          (v2 = *(const void **)(a1 + 32)) == 0))
    {
      CFTypeRef v3 = 0;
    }
    else
    {
      CFTypeRef v3 = CFRetain(v2);
    }
    sCMSMPowerManagerForHaptics_6 = (uint64_t)v3;
    PowerManager_SetPowerBudgetOnVAAndSendAcknowledgementToCPMSForResource(6, (void *)sCMSMPowerManagerForHaptics_2, (uint64_t)v3);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

id __PowerManager_InitializeCPMSForAudio_block_invoke()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__13;
  int v8 = __Block_byref_object_dispose__13;
  uint64_t v9 = 0;
  v0 = MXGetSerialQueue();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __PowerManager_InitializeCPMSForAudio_block_invoke_2;
  v3[3] = &unk_1E57C5B30;
  v3[4] = &v4;
  MXDispatchAsyncAndWait((uint64_t)"PowerManager_InitializeCPMSForAudio_block_invoke", (uint64_t)"PowerManager_Audio.m", 176, 0, 0, v0, (uint64_t)v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __PowerManager_InitializeCPMSForAudio_block_invoke_2(uint64_t a1)
{
  uint64_t result = vaemCopyCPMSPowerBudget(5);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __PowerManager_InitializeCPMSForAudio_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    int v8 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v4 = a2;
  v5 = MXGetSerialQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __PowerManager_InitializeCPMSForAudio_block_invoke_2_6;
  v6[3] = &unk_1E57C6368;
  v6[4] = a2;
  MXDispatchAsync((uint64_t)"PowerManager_InitializeCPMSForAudio_block_invoke", (uint64_t)"PowerManager_Audio.m", 201, 0, 0, v5, (uint64_t)v6);
}

void __PowerManager_InitializeCPMSForAudio_block_invoke_2_6(uint64_t a1)
{
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    if (sCMSMPowerManagerForAudio_6
      && (CFRelease((CFTypeRef)sCMSMPowerManagerForAudio_6),
          sCMSMPowerManagerForAudio_6 = 0,
          (v2 = *(const void **)(a1 + 32)) == 0))
    {
      CFTypeRef v3 = 0;
    }
    else
    {
      CFTypeRef v3 = CFRetain(v2);
    }
    sCMSMPowerManagerForAudio_6 = (uint64_t)v3;
    PowerManager_SetPowerBudgetOnVAAndSendAcknowledgementToCPMSForResource(5, (void *)sCMSMPowerManagerForAudio_2, (uint64_t)v3);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end