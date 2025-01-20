@interface AVPlayerInterstitialEventController
+ (AVPlayerInterstitialEventController)interstitialEventControllerWithPrimaryPlayer:(AVPlayer *)primaryPlayer;
- (AVPlayerInterstitialEventController)initWithPrimaryPlayer:(AVPlayer *)primaryPlayer;
- (void)cancelCurrentEventWithResumptionOffset:(CMTime *)resumptionOffset;
- (void)dealloc;
- (void)setEvents:(NSArray *)events;
@end

@implementation AVPlayerInterstitialEventController

+ (AVPlayerInterstitialEventController)interstitialEventControllerWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPrimaryPlayer:primaryPlayer];
  return (AVPlayerInterstitialEventController *)v3;
}

- (AVPlayerInterstitialEventController)initWithPrimaryPlayer:(AVPlayer *)primaryPlayer
{
  v5 = [(AVPlayer *)primaryPlayer _copyInterstitialCoordinator];
  if (v5)
  {
    CFRelease(v5);
    v9.receiver = self;
    v9.super_class = (Class)AVPlayerInterstitialEventController;
    v6 = [(AVPlayerInterstitialEventMonitor *)&v9 initWithPrimaryPlayer:primaryPlayer];
    if (v6)
    {
      v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6->_ivarQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayerinterstitialeventcontroller", v7);
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  ivarQueue = self->_ivarQueue;
  if (ivarQueue) {
    dispatch_release(ivarQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerInterstitialEventController;
  [(AVPlayerInterstitialEventMonitor *)&v4 dealloc];
}

- (void)setEvents:(NSArray *)events
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSArray *)events countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(events);
        }
        objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        unsigned int v15 = 0;
        if (([v9 validate:&v15] & 1) == 0) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"invalid event %@ (%d)", v9, v15), 0 reason userInfo]);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)events countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  v10 = [[(AVPlayerInterstitialEventMonitor *)self primaryPlayer] _copyInterstitialCoordinator];
  id v11 = [(AVPlayerInterstitialEventMonitor *)self makeCopyOf:events immutable:0];
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, id))(v13 + 24);
  if (v14) {
    v14(v10, v11);
  }
  if (v10) {
    CFRelease(v10);
  }
}

- (void)cancelCurrentEventWithResumptionOffset:(CMTime *)resumptionOffset
{
  uint64_t v5 = [[(AVPlayerInterstitialEventMonitor *)self primaryPlayer] _copyInterstitialCoordinator];
  id v6 = [[(AVPlayerInterstitialEventMonitor *)self primaryPlayer] _playbackCoordinatorWithoutTriggeringFullSetup];
  if (v6)
  {
    uint64_t v7 = v6;
    if ([[(AVPlayerInterstitialEventMonitor *)self currentEvent] _participatesInCoordinatedPlayback])
    {
      [v7 _resetGroupTimelineExpectations];
    }
  }
  long long v11 = *(_OWORD *)&resumptionOffset->value;
  CMTimeEpoch epoch = resumptionOffset->epoch;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, long long *))(v9 + 40);
  if (v10)
  {
    long long v13 = v11;
    CMTimeEpoch v14 = epoch;
    v10(v5, &v13);
  }
  if (v5) {
    CFRelease(v5);
  }
}

@end