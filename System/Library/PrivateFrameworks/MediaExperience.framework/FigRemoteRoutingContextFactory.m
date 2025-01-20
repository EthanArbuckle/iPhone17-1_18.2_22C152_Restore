@interface FigRemoteRoutingContextFactory
- (int)copyAllAudioContexts:(const __CFArray *)a3;
- (int)copyContextForUUIDWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copyDisplayMenuVideoContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copySidePlayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copySystemAudioContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copySystemMirroringContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copySystemMusicContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copySystemRemoteDisplayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copySystemRemotePoolContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)createAudioContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)createControlChannelOnlyContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)createPerAppSecondDisplayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)createRemoteMusicControllerContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)createVideoContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
@end

@implementation FigRemoteRoutingContextFactory

- (int)copySystemAudioContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCopySystemAudioContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)copyContextForUUIDWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCopyContextForUUID((uint64_t)a3, a4, a5);
}

- (int)copySystemMusicContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCopySystemMusicContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)copyDisplayMenuVideoContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingRemoteCopyDisplayMenuVideoContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)copySystemRemoteDisplayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCopySystemRemoteDisplayContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)copySystemMirroringContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  if (FigRoutingContextIsSystemContextAllowed_onceToken != -1) {
    dispatch_once(&FigRoutingContextIsSystemContextAllowed_onceToken, &__block_literal_global_39);
  }
  if (FigRoutingContextIsSystemContextAllowed_isAllowed)
  {
    return FigRoutingContextRemoteCopySystemMirroringContext((uint64_t)a3, a4, (CFTypeRef *)a5);
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)copySidePlayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  if (FigRoutingContextIsSystemContextAllowed_onceToken != -1) {
    dispatch_once(&FigRoutingContextIsSystemContextAllowed_onceToken, &__block_literal_global_39);
  }
  if (FigRoutingContextIsSystemContextAllowed_isAllowed)
  {
    return FigRoutingContextRemoteCopySidePlayContext((uint64_t)a3, a4, (CFTypeRef *)a5);
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)createAudioContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCreateAudioContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)createControlChannelOnlyContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCreateControlChannelOnlyContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)createPerAppSecondDisplayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCreatePerAppSecondDisplayContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)createRemoteMusicControllerContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCreateRemoteMusicControllerContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)createVideoContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCreateVideoContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)copySystemRemotePoolContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextRemoteCopySystemRemotePoolContext((uint64_t)a3, a4, (CFTypeRef *)a5);
}

- (int)copyAllAudioContexts:(const __CFArray *)a3
{
  return FigRoutingContextRemoteCopyAllAudioContexts(a3);
}

@end