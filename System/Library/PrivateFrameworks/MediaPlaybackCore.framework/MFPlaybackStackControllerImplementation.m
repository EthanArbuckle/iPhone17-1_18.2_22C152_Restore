@interface MFPlaybackStackControllerImplementation
- (AVPlayerViewController)videoViewController;
- (BOOL)isModeManagedSession;
- (BOOL)isModeShared;
- (BOOL)isModeSolo;
- (BOOL)shouldSkipJumpToItemStart:(int64_t)a3;
- (MFPlaybackStackControllerDelegate)delegate;
- (MFPlaybackStackControllerImplementation)init;
- (MFPlaybackStackControllerImplementation)initWithPlayerID:(id)a3 engineID:(id)a4 queueController:(id)a5 assetLoader:(id)a6 errorController:(id)a7 externalPlaybackController:(id)a8 leaseController:(id)a9 defaults:(id)a10 behavior:(int64_t)a11 queue:(id)a12;
- (MFQueuePlayerItem)currentItem;
- (MFQueuePlayerItem)currentQueueItem;
- (NSArray)nextItems;
- (NSDictionary)stateDictionary;
- (NSNumber)targetTime;
- (NSString)modeDescription;
- (double)currentTime;
- (float)effectiveRate;
- (float)rate;
- (float)relativeVolume;
- (float)targetRate;
- (int64_t)currentItemTransition;
- (int64_t)currentState;
- (int64_t)interruptedState;
- (int64_t)renderingMode;
- (int64_t)timeControlStatus;
- (void)activateAudioSessionWithCompletion:(id)a3;
- (void)beginScanningWithDirection:(int64_t)a3 identifier:(id)a4 completion:(id)a5;
- (void)beginSeekingWithIdentifier:(id)a3 completion:(id)a4;
- (void)clearPlaybackQueue;
- (void)deactivateAudioSessionIfIdle:(int64_t)a3;
- (void)endScanningWithIdentifier:(id)a3 completion:(id)a4;
- (void)endSeekingWithIdentifier:(id)a3 completion:(id)a4;
- (void)jumpTo:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)pauseForLeasePreventionWithIdentifier:(id)a3 completion:(id)a4;
- (void)pauseForSleepTimerWithFadeOut:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)pauseWithFadeOut:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)pauseWithIdentifier:(id)a3 completion:(id)a4;
- (void)playWithRate:(float)a3 identifier:(id)a4 completion:(id)a5;
- (void)reloadCurrentItemWithReason:(int64_t)a3 completion:(id)a4;
- (void)reloadItemsKeepingCurrentItem:(BOOL)a3 allowReuse:(BOOL)a4;
- (void)resetWithReason:(id)a3;
- (void)restoreQueue:(id)a3;
- (void)seekTo:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setInhibitSpeechDetection:(BOOL)a3;
- (void)setQueueWithInitialItem:(id)a3 andPlay:(BOOL)a4 identifier:(id)a5 completion:(id)a6;
- (void)setRate:(float)a3 identifier:(id)a4 completion:(id)a5;
- (void)setRelativeVolume:(float)a3;
- (void)setSpatializationFormat:(int64_t)a3;
- (void)setupForManagedSessionWithAudioSession:(id)a3;
- (void)setupForNewQueueWithSessionID:(id)a3;
- (void)setupForShared;
- (void)setupForSolo;
- (void)teardownForQueueWithSessionID:(id)a3;
- (void)updateAudioSessionWithConfiguration:(id)a3;
@end

@implementation MFPlaybackStackControllerImplementation

- (MFPlaybackStackControllerDelegate)delegate
{
  v2 = (void *)sub_21BC44B10();

  return (MFPlaybackStackControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_21BC44BB4();
}

- (MFPlaybackStackControllerImplementation)initWithPlayerID:(id)a3 engineID:(id)a4 queueController:(id)a5 assetLoader:(id)a6 errorController:(id)a7 externalPlaybackController:(id)a8 leaseController:(id)a9 defaults:(id)a10 behavior:(int64_t)a11 queue:(id)a12
{
  uint64_t v22 = sub_21BEAA178();
  uint64_t v17 = v16;
  uint64_t v18 = sub_21BEAA178();
  uint64_t v20 = v19;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (MFPlaybackStackControllerImplementation *)MFPlaybackStackControllerImplementation.init(playerID:engineID:queueController:assetLoader:errorController:externalPlaybackController:leaseController:defaults:behavior:queue:)(v22, v17, v18, v20, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, a11, a12);
}

- (int64_t)currentState
{
  v2 = self;
  int64_t v3 = sub_21BC45178();

  return v3;
}

- (int64_t)interruptedState
{
  v2 = self;
  int64_t v3 = sub_21BC451EC();

  return v3;
}

- (int64_t)currentItemTransition
{
  return sub_21BC4526C();
}

- (double)currentTime
{
  v2 = self;
  sub_21BC452D4();
  double v4 = v3;

  return v4;
}

- (float)rate
{
  v2 = self;
  sub_21BC4533C();
  float v4 = v3;

  return v4;
}

- (float)effectiveRate
{
  v2 = self;
  sub_21BC453A8();
  float v4 = v3;

  return v4;
}

- (float)targetRate
{
  v2 = self;
  sub_21BC45410();
  float v4 = v3;

  return v4;
}

- (NSNumber)targetTime
{
  v2 = self;
  id v3 = sub_21BC45480();

  return (NSNumber *)v3;
}

- (MFQueuePlayerItem)currentItem
{
  v2 = (void *)sub_21BC45514();

  return (MFQueuePlayerItem *)v2;
}

- (NSArray)nextItems
{
  v2 = self;
  sub_21BC4558C();

  sub_21BC330F8(0, (unint64_t *)&qword_26AAF1430);
  id v3 = (void *)sub_21BEAA2F8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (MFQueuePlayerItem)currentQueueItem
{
  v2 = (void *)sub_21BC455F0();

  return (MFQueuePlayerItem *)v2;
}

- (void)restoreQueue:(id)a3
{
  float v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_21BC45608((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)reloadItemsKeepingCurrentItem:(BOOL)a3 allowReuse:(BOOL)a4
{
  v6 = self;
  sub_21BC45734(a3, a4);
}

- (void)clearPlaybackQueue
{
  v2 = self;
  sub_21BC457BC();
}

- (void)reloadCurrentItemWithReason:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_21BC4D084;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_21BC45830(a3, (uint64_t)v6, v7);
  sub_21BC020B8((uint64_t)v6);
}

- (void)resetWithReason:(id)a3
{
  id v5 = a3;
  float v4 = self;
  sub_21BC459E0();
}

- (void)teardownForQueueWithSessionID:(id)a3
{
}

- (void)setupForNewQueueWithSessionID:(id)a3
{
}

- (void)setQueueWithInitialItem:(id)a3 andPlay:(BOOL)a4 identifier:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_21BC45B98((uint64_t)a3, v7, (uint64_t)v12, (uint64_t)sub_21BC4D218, v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)playWithRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
}

- (void)pauseWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)pauseWithFadeOut:(double)a3 identifier:(id)a4 completion:(id)a5
{
}

- (void)pauseForSleepTimerWithFadeOut:(double)a3 identifier:(id)a4 completion:(id)a5
{
}

- (void)pauseForLeasePreventionWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)setRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
}

- (void)beginScanningWithDirection:(int64_t)a3 identifier:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a4;
  uint64_t v11 = self;
  sub_21BC46314(a3, (uint64_t)v10, (uint64_t)sub_21BC4D218, v9);

  swift_release();
}

- (void)endScanningWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)beginSeekingWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)seekTo:(double)a3 identifier:(id)a4 completion:(id)a5
{
}

- (void)endSeekingWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)jumpTo:(double)a3 identifier:(id)a4 completion:(id)a5
{
}

- (BOOL)shouldSkipJumpToItemStart:(int64_t)a3
{
  float v4 = self;
  LOBYTE(a3) = sub_21BC4688C(a3);

  return a3 & 1;
}

- (AVPlayerViewController)videoViewController
{
  id v2 = sub_21BC46930();

  return (AVPlayerViewController *)v2;
}

- (int64_t)timeControlStatus
{
  id v2 = self;
  int64_t v3 = sub_21BC46990();

  return v3;
}

- (NSDictionary)stateDictionary
{
  id v2 = self;
  sub_21BC46A30();

  int64_t v3 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3;
}

- (int64_t)renderingMode
{
  id v2 = self;
  id v3 = sub_21BC46CF0();

  return (int64_t)v3;
}

- (void)updateAudioSessionWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21BC46D08((uint64_t)v4);
}

- (void)activateAudioSessionWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_21BC46D8C((uint64_t)sub_21BC4D064, v5);

  swift_release();
}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  id v4 = self;
  sub_21BC46F50(a3);
}

- (void)setInhibitSpeechDetection:(BOOL)a3
{
  id v4 = self;
  sub_21BC46FC0(a3);
}

- (NSString)modeDescription
{
  id v2 = self;
  sub_21BC4709C();

  id v3 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isModeSolo
{
  id v2 = self;
  unsigned __int8 v3 = sub_21BC47130();

  return v3 & 1;
}

- (BOOL)isModeShared
{
  id v2 = self;
  unsigned __int8 v3 = sub_21BC47190();

  return v3 & 1;
}

- (BOOL)isModeManagedSession
{
  id v2 = self;
  unsigned __int8 v3 = sub_21BC471F0();

  return v3 & 1;
}

- (void)setupForSolo
{
  id v2 = self;
  sub_21BC4721C();
}

- (void)setupForShared
{
  id v2 = self;
  sub_21BC4727C();
}

- (void)setupForManagedSessionWithAudioSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_21BC472DC((uint64_t)v4);
}

- (void)setSpatializationFormat:(int64_t)a3
{
  id v4 = self;
  sub_21BC47360(a3);
}

- (float)relativeVolume
{
  id v2 = self;
  sub_21BC4740C();
  float v4 = v3;

  return v4;
}

- (void)setRelativeVolume:(float)a3
{
  float v3 = self;
  sub_21BC4747C();
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4
{
  uint64_t v5 = self;
  sub_21BC47508(a3);
}

- (MFPlaybackStackControllerImplementation)init
{
}

- (void).cxx_destruct
{
  sub_21BC332AC((uint64_t)self + OBJC_IVAR___MFPlaybackStackControllerImplementation_delegate);
  swift_release();

  swift_release();
}

@end