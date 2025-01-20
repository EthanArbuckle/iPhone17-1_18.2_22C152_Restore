@interface DIDeviceStateUpdateThrottler
- (DIDeviceStateUpdateThrottler)init;
- (DIDeviceStateUpdateThrottler)initWithThrottleTimeInterval:(double)a3;
- (void)dealloc;
- (void)handleState:(int64_t)a3 reason:(id)a4 handler:(id)a5;
@end

@implementation DIDeviceStateUpdateThrottler

- (DIDeviceStateUpdateThrottler)initWithThrottleTimeInterval:(double)a3
{
  return (DIDeviceStateUpdateThrottler *)DeviceStateUpdateThrottler.init(throttleTimeInterval:)(a3);
}

- (void)dealloc
{
  v2 = self;
  DeviceStateUpdateThrottler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DIDeviceStateUpdateThrottler_queue);
}

- (void)handleState:(int64_t)a3 reason:(id)a4 handler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_24D044428();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_24D02633C(a3, v8, v10, (uint64_t)sub_24D026CA8, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (DIDeviceStateUpdateThrottler)init
{
}

@end