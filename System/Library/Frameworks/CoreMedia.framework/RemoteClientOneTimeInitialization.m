@interface RemoteClientOneTimeInitialization
@end

@implementation RemoteClientOneTimeInitialization

dispatch_queue_t __figXPC_RemoteClientOneTimeInitialization_block_invoke()
{
  FigKTraceInit();
  dispatch_queue_t result = dispatch_queue_create("FigXPCRemoteClientCommonCleanupQueue", 0);
  gCommonRemoteClientCleanupQueue = (uint64_t)result;
  return result;
}

@end