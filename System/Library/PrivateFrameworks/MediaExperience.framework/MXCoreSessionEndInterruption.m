@interface MXCoreSessionEndInterruption
@end

@implementation MXCoreSessionEndInterruption

void __MXCoreSessionEndInterruption_WithSecTaskAndStatus_block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = CMSMUtility_CopyActiveSessionWithPhoneCallBehaviorOrRingtone();
  id v3 = [+[MXSessionManager sharedInstance] copyActiveSessionWithAudioCategory:0 andAudioMode:@"VoicePrompt"];
  v4 = CMSMUtility_CopyActiveSiriSession();
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = v3;
  }
  if (v2) {
    v7 = v2;
  }
  else {
    v7 = v6;
  }
  if (v7)
  {
    [v7 setNeedToEndInterruption:1];
    [*(id *)(*(void *)(a1[4] + 8) + 40) setWaitingToResume:1];
    v8 = *(void **)(*(void *)(a1[4] + 8) + 40);
    v9 = v7;
LABEL_15:
    [v8 setInterruptingSession:v9];
    goto LABEL_16;
  }
  if ([*(id *)(*(void *)(a1[5] + 8) + 40) isActive])
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "setNeedToEndInterruption:", 1, v14, v15);
    [*(id *)(*(void *)(a1[4] + 8) + 40) setWaitingToResume:1];
    v8 = *(void **)(*(void *)(a1[4] + 8) + 40);
    v9 = *(void **)(*(void *)(a1[5] + 8) + 40);
    goto LABEL_15;
  }
  if (dword_1E9359ED0)
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSUtility_PostInterruptionCommandNotification(*(void **)(*(void *)(a1[4] + 8) + 40), 1u, *(__CFString **)(*(void *)(a1[7] + 8) + 24), *(const void **)(*(void *)(a1[6] + 8) + 24), 0, 0, 0, (const void *)objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "displayID", v14, v15));
  [*(id *)(*(void *)(a1[4] + 8) + 40) setActiveRoutesWhenInterrupted:0];
LABEL_16:
  [*(id *)(*(void *)(a1[5] + 8) + 40) setWaitingToSendEndInterruptionToSpokenAudioApp:0];

  v12 = *(const void **)(*(void *)(a1[7] + 8) + 24);
  if (v12) {
    CFRelease(v12);
  }
  v13 = *(const void **)(*(void *)(a1[6] + 8) + 24);
  if (v13) {
    CFRelease(v13);
  }
}

@end