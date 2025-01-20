@interface FigRoutingSessionManager
@end

@implementation FigRoutingSessionManager

uint64_t __FigRoutingSessionManager_ensureConfigurationInitialized_block_invoke()
{
  gConfigurationMutex = FigSimpleMutexCreate();
  LOWORD(gConfiguration) = 257;
  *(void *)((char *)&gConfiguration + 4) = 0x3F0000003F4CCCCDLL;
  xmmword_1E9359490 = xmmword_194EDFFA0;
  xmmword_1E93594A0 = xmmword_194EDFFB0;
  xmmword_1E93594B0 = xmmword_194EDFFC0;
  xmmword_1E93594C0 = xmmword_194EDFFD0;
  return FigMobileAsset_RegisterForAssetUpdates();
}

@end