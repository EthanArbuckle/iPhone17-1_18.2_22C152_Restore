@interface ServerOneTimeInitialization
@end

@implementation ServerOneTimeInitialization

pthread_mutex_t *__figXPC_ServerOneTimeInitialization_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  gCommonServerListenerQueue = (uint64_t)FigDispatchQueueCreateWithPriority("FigXPCServerCommonListenerQueue", 0, 0x2Cu);
  gCommonServerTimeoutQueue = (uint64_t)dispatch_queue_create("FigXPCServerCommonTimeoutQueue", 0);
  gCommonServerProcessCleanupQueue = (uint64_t)dispatch_queue_create("FigXPCServerCommonProcessCleanupQueue", v0);
  if (FigServer_IsMediaserverd() && !audiomxd_enabled()
    || (in_audio_mx_server_process() & 1) != 0
    || !FigServer_IsServerProcess()
    || FigServer_IsAirplayd()
    || FigServer_IsCameracaptured())
  {
    gCommonServerCapabilities |= 1uLL;
  }
  if (FigServer_IsMediaplaybackd()) {
    gCommonServerCapabilities |= 2uLL;
  }
  result = FigSimpleMutexCreate();
  gSelfTerminationLock = (uint64_t)result;
  return result;
}

@end