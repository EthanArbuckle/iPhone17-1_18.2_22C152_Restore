@interface FMIPBeaconRefreshingController
- (void)handleBeaconsChanged;
- (void)handleUnknownBeaconsChanged;
- (void)refreshTimerFired;
@end

@implementation FMIPBeaconRefreshingController

- (void)refreshTimerFired
{
}

- (void)handleBeaconsChanged
{
  uint64_t v2 = qword_1EBD80068;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D4469928();
  sub_1D42D7FAC(v3, (uint64_t)qword_1EBD83228);
  v4 = sub_1D44698F8();
  os_log_type_t v5 = sub_1D446A038();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D4271000, v4, v5, "FMIPBeaconRefreshingController: Beacons changed notification received", v6, 2u);
    MEMORY[0x1D9447730](v6, -1, -1);
  }

  sub_1D42BE33C(0, 0);
  swift_release();
}

- (void)handleUnknownBeaconsChanged
{
}

@end