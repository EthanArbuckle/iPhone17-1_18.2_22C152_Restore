@interface HandleNewClientConnection
@end

@implementation HandleNewClientConnection

void __figXPC_HandleNewClientConnection_block_invoke(void *a1, void *a2)
{
  uint64_t v4 = MEMORY[0x192FC6B30](a2);
  if ((isFirstTime & 1) == 0)
  {
    if (FigServer_GetEnvironment())
    {
      int64_t int64 = xpc_dictionary_get_int64(a2, ".Date");
      if (int64 >= 1)
      {
        double v6 = (double)((FigGetUpTimeNanoseconds() - int64) / 0xF4240);
        EnvironmentName = FigServer_GetEnvironmentName();
        FigCAStatsReportingSubmitData(EnvironmentName, @"com.apple.coremedia.serverstartup", @"startupTime", v6);
      }
    }
  }
  if (v4 == MEMORY[0x1E4F14590])
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    v10 = (_xpc_connection_s *)a1[6];
    figXPC_HandleMessage(v8, v9, v10, a2);
  }
  else if (v4 == MEMORY[0x1E4F145A8] && a2 == (void *)MEMORY[0x1E4F14528])
  {
    uint64_t v11 = a1[4];
    v12 = (_xpc_connection_s *)a1[6];
    v13 = (void *)xpc_connection_copy_invalidation_reason();
    pid_t pid = xpc_connection_get_pid(v12);
    context = xpc_connection_get_context(v12);
    if (context) {
      CFTypeRef v16 = CFRetain(context);
    }
    else {
      CFTypeRef v16 = 0;
    }
    FigApplicationStateMonitorRemovePIDToIgnore(*((_DWORD *)v16 + 40));
    FigSimpleMutexLock(*(pthread_mutex_t **)(v11 + 112));
    FigServer_RememberProcessInfoForAFewSeconds(*((CFTypeRef *)v16 + 3));
    figXPC_ForgetProcessInfo(v11, pid);
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v11 + 112));
    CFRelease(v16);
    free(v13);
  }
}

@end