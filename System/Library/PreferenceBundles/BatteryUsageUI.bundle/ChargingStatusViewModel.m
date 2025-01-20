@interface ChargingStatusViewModel
- (void)handleLPMChangedNotification;
- (void)handlePercentChangedNotification;
- (void)handlePowerSourceChangedNotification;
@end

@implementation ChargingStatusViewModel

- (void)handlePowerSourceChangedNotification
{
  sub_3ED90(&qword_D52A8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_901B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v5;
  swift_retain();
  sub_3F5C4((uint64_t)v3, (uint64_t)&unk_D53E8, (uint64_t)v6);
  swift_release();
  swift_release();
}

- (void)handlePercentChangedNotification
{
}

- (void)handleLPMChangedNotification
{
}

@end