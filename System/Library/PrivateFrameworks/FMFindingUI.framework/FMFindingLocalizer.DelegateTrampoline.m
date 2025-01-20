@interface FMFindingLocalizer.DelegateTrampoline
- (_TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline)init;
- (void)didFailWithError:(id)a3 onItem:(id)a4;
- (void)didFindItem:(id)a3;
- (void)didStartRangingOn:(id)a3 withError:(id)a4;
- (void)didStopRangingOn:(id)a3 withError:(id)a4;
- (void)didUpdateBTProximity:(id)a3;
- (void)invalidPoseDetected;
- (void)willIntegrateBTRSSI:(id)a3;
@end

@implementation FMFindingLocalizer.DelegateTrampoline

- (_TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline)init
{
  swift_unknownObjectWeakInit();
  *(void *)&self->owner[OBJC_IVAR____TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline_updateRangeEstimateWatchdogWorkItem) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMFindingLocalizer.DelegateTrampoline();
  return [(FMFindingLocalizer.DelegateTrampoline *)&v4 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_24D2C6E6C((uint64_t)self+ OBJC_IVAR____TtCC11FMFindingUI18FMFindingLocalizerP33_22F1FFC3BC980B33F05B7EB45077AC7718DelegateTrampoline_delegate);
  swift_release();
}

- (void)didStartRangingOn:(id)a3 withError:(id)a4
{
}

- (void)didStopRangingOn:(id)a3 withError:(id)a4
{
}

- (void)willIntegrateBTRSSI:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D2D7354(v4);
}

- (void)didUpdateBTProximity:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D2CB1CC(v4);
}

- (void)didFindItem:(id)a3
{
  uint64_t v4 = sub_24D39C8A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D39C880();
  v8 = self;
  sub_24D2CB7AC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didFailWithError:(id)a3 onItem:(id)a4
{
  uint64_t v6 = sub_24D39C8A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D39C880();
  id v10 = a3;
  v11 = self;
  sub_24D2CBBF8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)invalidPoseDetected
{
  uint64_t v2 = qword_2698602B0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24D39C950();
  sub_24D2B508C(v4, (uint64_t)qword_269869FD0);
  oslog = sub_24D39C930();
  os_log_type_t v5 = sub_24D39CDF0();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_24D2B1000, oslog, v5, "🧭 FMFindingLocalizer: Invalid pose detected", v6, 2u);
    MEMORY[0x253326010](v6, -1, -1);
  }
}

@end