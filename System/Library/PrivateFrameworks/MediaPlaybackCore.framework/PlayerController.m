@interface PlayerController
- (NSDictionary)stateDictionary;
- (float)relativeVolume;
- (void)resetWithReason:(id)a3;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4;
- (void)setRelativeVolume:(float)a3;
- (void)setSpatializationFormat:(int64_t)a3;
@end

@implementation PlayerController

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_21BC56590();
  swift_release();
  v2 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)resetWithReason:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21BC587A8(v3);
  swift_release();
}

- (void)setSpatializationFormat:(int64_t)a3
{
  swift_retain();
  sub_21BC5B380(a3);

  swift_release();
}

- (float)relativeVolume
{
  swift_retain();
  sub_21BC5B4D8();
  float v3 = v2;
  swift_release();
  return v3;
}

- (void)setRelativeVolume:(float)a3
{
  swift_retain();
  sub_21BC5B5A4(a3);

  swift_release();
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4
{
}

@end