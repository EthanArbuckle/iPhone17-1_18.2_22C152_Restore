@interface ICSPillStateMonitor
- (ICSPillStateMonitor)init;
- (id)hasCurrentCalls;
- (id)hasOutstandingPillAssertions;
- (id)isActiveAndHiddenPictureInPicture;
- (id)isDismissedWithoutPictureInPicture;
- (void)setHasCurrentCalls:(id)a3;
- (void)setHasOutstandingPillAssertions:(id)a3;
- (void)setIsActiveAndHiddenPictureInPicture:(id)a3;
- (void)setIsDismissedWithoutPictureInPicture:(id)a3;
@end

@implementation ICSPillStateMonitor

- (id)hasCurrentCalls
{
  return sub_1001D4A00((uint64_t)self, (uint64_t)a2, sub_1001D3434, (uint64_t)&unk_1002D5D00);
}

- (void)setHasCurrentCalls:(id)a3
{
}

- (ICSPillStateMonitor)init
{
  return (ICSPillStateMonitor *)sub_1001D3488();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1001D6F2C((uint64_t)self + OBJC_IVAR___ICSPillStateMonitor_timerState);
  sub_1001D6F5C((uint64_t)self + OBJC_IVAR___ICSPillStateMonitor_state, (void (*)(void))type metadata accessor for PillStateMonitor.State);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSPillStateMonitor_queue);
}

- (id)hasOutstandingPillAssertions
{
  return sub_1001D4A00((uint64_t)self, (uint64_t)a2, sub_1001D4804, (uint64_t)&unk_1002D5C88);
}

- (void)setHasOutstandingPillAssertions:(id)a3
{
}

- (id)isDismissedWithoutPictureInPicture
{
  return sub_1001D4A00((uint64_t)self, (uint64_t)a2, sub_1001D48F4, (uint64_t)&unk_1002D5C38);
}

- (void)setIsDismissedWithoutPictureInPicture:(id)a3
{
}

- (id)isActiveAndHiddenPictureInPicture
{
  return sub_1001D4A00((uint64_t)self, (uint64_t)a2, sub_1001D4A9C, (uint64_t)&unk_1002D5BE8);
}

- (void)setIsActiveAndHiddenPictureInPicture:(id)a3
{
}

@end