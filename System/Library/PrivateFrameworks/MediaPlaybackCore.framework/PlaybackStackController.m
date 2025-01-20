@interface PlaybackStackController
- (BOOL)isModeManagedSession;
- (BOOL)isModeShared;
- (BOOL)isModeSolo;
- (NSDictionary)stateDictionary;
- (NSString)modeDescription;
- (float)relativeVolume;
- (int64_t)renderingMode;
- (void)activateAudioSessionWithCompletion:(id)a3;
- (void)deactivateAudioSessionIfIdle:(int64_t)a3;
- (void)resetWithReason:(id)a3;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4;
- (void)setInhibitSpeechDetection:(BOOL)a3;
- (void)setRelativeVolume:(float)a3;
- (void)setSpatializationFormat:(int64_t)a3;
- (void)setupForManagedSessionWithAudioSession:(id)a3;
- (void)setupForShared;
- (void)setupForSolo;
- (void)updateAudioSessionWithConfiguration:(id)a3;
@end

@implementation PlaybackStackController

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_21BD27518();
  swift_release();
  v2 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BD27810(v3);
  swift_release();
}

- (int64_t)renderingMode
{
  swift_retain();
  int64_t v2 = sub_21BD27A78();
  swift_release();
  return v2;
}

- (void)updateAudioSessionWithConfiguration:(id)a3
{
}

- (void)activateAudioSessionWithCompletion:(id)a3
{
  id v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_21BD27B64((uint64_t (*)(uint64_t, void *))sub_21BC4D064, v4);
  swift_release();

  swift_release();
}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  swift_retain();
  sub_21BD27C50();

  swift_release();
}

- (void)setInhibitSpeechDetection:(BOOL)a3
{
  swift_retain();
  sub_21BD27D04();

  swift_release();
}

- (NSString)modeDescription
{
  swift_retain();
  sub_21BD27E08();
  swift_release();
  int64_t v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)isModeSolo
{
  return sub_21BD27F4C();
}

- (BOOL)isModeShared
{
  return sub_21BD27F88();
}

- (BOOL)isModeManagedSession
{
  return sub_21BD27FC4();
}

- (void)setupForSolo
{
}

- (void)setupForShared
{
}

- (void)setupForManagedSessionWithAudioSession:(id)a3
{
}

- (void)setSpatializationFormat:(int64_t)a3
{
  swift_retain();
  sub_21BD28174(a3);

  swift_release();
}

- (float)relativeVolume
{
  swift_retain();
  sub_21BD2821C();
  float v3 = v2;
  swift_release();
  return v3;
}

- (void)setRelativeVolume:(float)a3
{
  swift_retain();
  sub_21BD2828C(a3);

  swift_release();
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4
{
}

@end