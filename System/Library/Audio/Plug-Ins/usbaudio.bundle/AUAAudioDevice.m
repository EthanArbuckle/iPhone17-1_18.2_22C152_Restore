@interface AUAAudioDevice
- (AUAAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4;
- (BOOL)changeClientDescription:(id)a3;
- (BOOL)changeSamplingRate:(double)a3;
- (int)performStartIO;
- (int)performStopIO;
- (void)requestConfigurationChange:(id)a3;
@end

@implementation AUAAudioDevice

- (void)requestConfigurationChange:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10001AA9C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  AUAAudioDevice.requestConfigurationChangeWithTrace(function:file:line:_:)(0xD00000000000001ELL, 0x80000001000E1210, 0xD00000000000001BLL, 0x80000001000E1230, 724, (uint64_t)v4, v5);
  sub_10001AA54((uint64_t)v4);
}

- (int)performStartIO
{
  v2 = self;
  Swift::Int32 started = AUAAudioDevice.performStartIO()();

  return started;
}

- (int)performStopIO
{
  v2 = self;
  Swift::Int32 v3 = AUAAudioDevice.performStopIO()();

  return v3;
}

- (BOOL)changeSamplingRate:(double)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(double *)(v5 + 24) = a3;
  v6 = self;
  AUAAudioDevice.requestConfigurationChangeWithTrace(function:file:line:_:)(0xD000000000000016, 0x80000001000E12B0, 0xD00000000000001BLL, 0x80000001000E1230, 848, (uint64_t)sub_10001AD8C, v5);

  swift_release();
  return 1;
}

- (BOOL)changeClientDescription:(id)a3
{
  if (a3) {
    v4 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    v4 = 0;
  }
  uint64_t v5 = self;
  v8.value._rawValue = v4;
  Swift::Bool v6 = AUAAudioDevice.changeClientDescription(_:)(v8);

  swift_bridgeObjectRelease();
  return v6;
}

- (AUAAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  id v4 = a4;
  result = (AUAAudioDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  Swift::Int32 v3 = &self->ASDAudioDevice_opaque[OBJC_IVAR___AUAAudioDevice_signpostID];
  uint64_t v4 = type metadata accessor for OSSignpostID();
  uint64_t v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end