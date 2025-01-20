@interface FigResilientRemoteRoutingContextFactory
- (int)copyAllAudioContexts:(const __CFArray *)a3;
- (int)copyContextForUUIDWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
- (int)copyDefaultContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5;
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

@implementation FigResilientRemoteRoutingContextFactory

- (int)copyContextForUUIDWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopyContextForUUID(a3, a4, a5);
}

- (int)copySystemMusicContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopySystemMusicContext(a3, a4, a5);
}

- (int)copyDisplayMenuVideoContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopyDisplayMenuVideoContext(a3, a4, a5);
}

- (int)copySystemAudioContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopySystemAudioContext(a3, a4, a5);
}

- (int)copySystemRemoteDisplayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopySystemRemoteDisplay(a3, a4, a5);
}

- (int)copySystemMirroringContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopySystemMirroringContext(a3, a4, a5);
}

- (int)copySidePlayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopySidePlayContext(a3, a4, a5);
}

- (int)createAudioContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCreateAudioContext(a3, (uint64_t)a4, a5);
}

- (int)createPerAppSecondDisplayContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCreatePerAppSecondDisplayContext(a3, (uint64_t)a4, a5);
}

- (int)createRemoteMusicControllerContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCreateRemoteMusicControllerContext(a3, a4, a5);
}

- (int)createControlChannelOnlyContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCreateControlChannelOnlyContext(a3, a4, a5);
}

- (int)createVideoContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCreateVideoContext(a3, (uint64_t)a4, a5);
}

- (int)copySystemRemotePoolContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopySystemRemotePoolContext(a3, a4, a5);
}

- (int)copyDefaultContextWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 context:(OpaqueFigRoutingContext *)a5
{
  return FigRoutingContextResilientRemoteCopyDefaultContext((uint64_t)a3, (uint64_t)a2, a5);
}

- (int)copyAllAudioContexts:(const __CFArray *)a3
{
  Current = FigRemoteRoutingContextFactoryGetCurrent();
  return [(FigRemoteRoutingContextFactory *)Current copyAllAudioContexts:a3];
}

@end