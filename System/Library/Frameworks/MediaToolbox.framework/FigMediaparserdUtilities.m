@interface FigMediaparserdUtilities
@end

@implementation FigMediaparserdUtilities

dispatch_queue_t __FigMediaparserdUtilities_EnsureProcessLaunched_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.coremedia.mediaparserdutilityremote", 0);
  gWakeUpQueue = (uint64_t)result;
  return result;
}

uint64_t __FigMediaparserdUtilities_StartMediaparserdUtilitiesServer_block_invoke(uint64_t a1)
{
  uint64_t result = FigXPCServerStart();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end