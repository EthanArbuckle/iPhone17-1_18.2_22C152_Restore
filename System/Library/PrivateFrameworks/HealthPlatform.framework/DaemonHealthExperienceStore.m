@interface DaemonHealthExperienceStore
- (void)debuggingInfoRequestedWithNote:(id)a3;
@end

@implementation DaemonHealthExperienceStore

- (void)debuggingInfoRequestedWithNote:(id)a3
{
  uint64_t v3 = sub_1C277A580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277A530();
  swift_retain();
  DaemonHealthExperienceStore.debuggingInfoRequested(note:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end