@interface TachycardiaFeatureStatusAvailability
- (void)heartRhythmAvailabilityDidUpdate;
- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3;
@end

@implementation TachycardiaFeatureStatusAvailability

- (void)heartRhythmAvailabilityDidUpdate
{
  sub_240A5C434(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v7 = (char *)&v8 - v6;
  swift_retain();
  sub_240A7D6C8((uint64_t)v7);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240A7E064((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_240BB62A0();
  sub_240A7E0C8((uint64_t)v7);
  swift_release();
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  sub_240A5C434(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v9 = (char *)&v11 - v8;
  id v10 = a3;
  swift_retain();
  sub_240A7D6C8((uint64_t)v9);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_240A7E064((uint64_t)v9, (uint64_t)v7);
  swift_retain();
  sub_240BB62A0();
  sub_240A7E0C8((uint64_t)v9);

  swift_release();
}

@end