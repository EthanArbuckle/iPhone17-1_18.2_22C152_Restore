@interface DIXPCDispatcher
- (DIAudioPowerDelegate)audioPowerDelegate;
- (DIAudioStatusDelegate)audioStatusDelegate;
- (DIDeviceListDelegate)deviceListDelegate;
- (DIDeviceStatusDelegate)deviceStatusDelegate;
- (DISessionStatusDelegate)sessionStatusDelegate;
- (DIXPCDispatcher)init;
- (DIXPCDispatcher)initWithClientContext:(id)a3;
- (void)didAddDevice:(id)a3;
- (void)didAddSession:(id)a3;
- (void)didLoadDevices:(id)a3;
- (void)didRemoveDevice:(id)a3;
- (void)didRemoveSession:(id)a3;
- (void)didUpdateAudioPower:(float)a3;
- (void)didUpdateDevice:(id)a3;
- (void)didUpdateDownlinkMuteStatus:(BOOL)a3;
- (void)didUpdateSession:(id)a3;
- (void)didUpdateUplinkMuteStatus:(BOOL)a3;
- (void)fetchClientContextWithCompletionHandler:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4;
- (void)setAudioPowerDelegate:(id)a3;
- (void)setAudioStatusDelegate:(id)a3;
- (void)setDeviceListDelegate:(id)a3;
- (void)setDeviceStatusDelegate:(id)a3;
- (void)setSessionStatusDelegate:(id)a3;
@end

@implementation DIXPCDispatcher

- (DIDeviceListDelegate)deviceListDelegate
{
  v2 = (void *)sub_24D039B24();
  return (DIDeviceListDelegate *)v2;
}

- (void)setDeviceListDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_24D039B90();
}

- (DIDeviceStatusDelegate)deviceStatusDelegate
{
  v2 = (void *)sub_24D039C60();
  return (DIDeviceStatusDelegate *)v2;
}

- (void)setDeviceStatusDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_24D039CCC();
}

- (DISessionStatusDelegate)sessionStatusDelegate
{
  v2 = (void *)sub_24D039D98();
  return (DISessionStatusDelegate *)v2;
}

- (void)setSessionStatusDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_24D039E04();
}

- (DIAudioPowerDelegate)audioPowerDelegate
{
  v2 = (void *)sub_24D039ED0();
  return (DIAudioPowerDelegate *)v2;
}

- (void)setAudioPowerDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_24D039F3C();
}

- (DIAudioStatusDelegate)audioStatusDelegate
{
  v2 = (void *)sub_24D03A008();
  return (DIAudioStatusDelegate *)v2;
}

- (void)setAudioStatusDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_24D03A0B4();
}

- (DIXPCDispatcher)initWithClientContext:(id)a3
{
  return (DIXPCDispatcher *)XPCDispatcher.init(clientContext:)(a3);
}

- (void)fetchClientContextWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_24D03A694((uint64_t)&unk_26984FE10, v5);
}

- (void)didLoadDevices:(id)a3
{
  sub_24D03A980();
  sub_24D044498();
  v4 = self;
  sub_24D03A798();

  swift_bridgeObjectRelease();
}

- (void)didAddDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D03AA24(v4);
}

- (void)didRemoveDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D03AAA8(v4);
}

- (void)didUpdateDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D03AB2C(v4);
}

- (void)didAddSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D03ABB0(v4);
}

- (void)didRemoveSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D03AC34(v4);
}

- (void)didUpdateSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D03ACB8(v4);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_24D03AEE4(v6, v8);
}

- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_24D03B1BC(v6, a4);
}

- (void)didUpdateAudioPower:(float)a3
{
  id v4 = self;
  sub_24D03B3E0(a3);
}

- (void)didUpdateUplinkMuteStatus:(BOOL)a3
{
  id v4 = self;
  sub_24D03B54C(a3);
}

- (void)didUpdateDownlinkMuteStatus:(BOOL)a3
{
  id v4 = self;
  sub_24D03B5B4(a3);
}

- (DIXPCDispatcher)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___DIXPCDispatcher_logger;
  uint64_t v4 = sub_24D044298();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24D02A190((uint64_t)self + OBJC_IVAR___DIXPCDispatcher_deviceListDelegate);
  sub_24D02A190((uint64_t)self + OBJC_IVAR___DIXPCDispatcher_deviceStatusDelegate);
  sub_24D02A190((uint64_t)self + OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate);
  sub_24D02A190((uint64_t)self + OBJC_IVAR___DIXPCDispatcher_audioPowerDelegate);
  uint64_t v5 = (char *)self + OBJC_IVAR___DIXPCDispatcher_audioStatusDelegate;
  sub_24D02A190((uint64_t)v5);
}

@end