@interface ICSCameraStateMonitor
- (ICSCameraStateMonitor)init;
- (id)isDismissed;
- (id)isDisplayedInBanner;
- (id)isDisplayedInMiniWindow;
- (void)setIsDismissed:(id)a3;
- (void)setIsDisplayedInBanner:(id)a3;
- (void)setIsDisplayedInMiniWindow:(id)a3;
@end

@implementation ICSCameraStateMonitor

- (ICSCameraStateMonitor)init
{
  return (ICSCameraStateMonitor *)sub_100184CE0();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  sub_100189D4C((uint64_t)self + OBJC_IVAR___ICSCameraStateMonitor_timerState);
  sub_100189D7C((uint64_t)self + OBJC_IVAR___ICSCameraStateMonitor_state, (void (*)(void))type metadata accessor for CameraStateMonitor.State);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSCameraStateMonitor_queue);
}

- (id)isDisplayedInBanner
{
  return sub_100186790((uint64_t)self, (uint64_t)a2, sub_100186648, (uint64_t)&unk_1002D39F8);
}

- (void)setIsDisplayedInBanner:(id)a3
{
}

- (id)isDisplayedInMiniWindow
{
  return sub_100186790((uint64_t)self, (uint64_t)a2, sub_1001866EC, (uint64_t)&unk_1002D39A8);
}

- (void)setIsDisplayedInMiniWindow:(id)a3
{
}

- (id)isDismissed
{
  return sub_100186790((uint64_t)self, (uint64_t)a2, sub_10018682C, (uint64_t)&unk_1002D3958);
}

- (void)setIsDismissed:(id)a3
{
}

@end