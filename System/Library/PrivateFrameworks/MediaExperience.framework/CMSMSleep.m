@interface CMSMSleep
@end

@implementation CMSMSleep

void __CMSMSleep_ExtendPlaybackProcessAssertion_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = CMSMUtility_CopyMXCoreSessionWithID(*(void *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    if ([v1 extendBackgroundAppAssertionTimer])
    {
      dispatch_source_cancel((dispatch_source_t)[v2 extendBackgroundAppAssertionTimer]);
      [v2 setExtendBackgroundAppAssertionTimer:0];
    }
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((objc_msgSend(v2, "isPlaying", v4, v5) & 1) == 0) {
      CMSMSleep_ReleasePlaybackProcessAssertion(v2);
    }
  }
}

void __CMSMSleep_FetchTemporaryPlaybackProcessAssertion_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = CMSMUtility_CopyMXCoreSessionWithID(*(void *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(v2, "resumeBackgroundAppUpdaterTimer", v4, v5))
    {
      dispatch_source_cancel((dispatch_source_t)[v2 resumeBackgroundAppUpdaterTimer]);
      [v2 setResumeBackgroundAppUpdaterTimer:0];
    }
    MX_RunningBoardServices_InvalidateAssertion((void *)[v2 resumeAssertionRef]);
    [v2 setResumeAssertionRef:0];
    [v2 setIsTemporaryAssertionEnabled:0];
  }
}

@end