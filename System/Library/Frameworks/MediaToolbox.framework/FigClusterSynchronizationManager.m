@interface FigClusterSynchronizationManager
@end

@implementation FigClusterSynchronizationManager

void __FigClusterSynchronizationManager_ClientIsPlaying_block_invoke(uint64_t a1)
{
  if (figClusterSynchManager_shouldDisableOdeonStereoClockLink())
  {
    if (dword_1E9351000)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    figClusterSynchManager_ensureStopped();
  }
  else
  {
    int v3 = gIsPlaying;
    if (*(unsigned __int8 *)(a1 + 40) != gIsPlaying)
    {
      gIsPlaying = 1;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = figClusterSynchManager_ensureStarted();
      BOOL v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) || gClusterClock == 0;
      if (!v4 && *(unsigned __int8 *)(a1 + 40) != v3)
      {
        CFSetRef v5 = (const __CFSet *)gAddedIPs;
        CFSetApplyFunction(v5, (CFSetApplierFunction)figClusterSynchManager_AddPort, 0);
      }
    }
  }
}

@end