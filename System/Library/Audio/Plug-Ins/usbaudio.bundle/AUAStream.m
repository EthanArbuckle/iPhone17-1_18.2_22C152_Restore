@interface AUAStream
- (AUAStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)deviceChangedToSamplingRate:(double)a3;
- (id)channelCategoryForChannelIndex:(unsigned int)a3;
- (id)channelNameForChannelIndex:(unsigned int)a3;
- (id)channelNumberForChannelIndex:(unsigned int)a3;
- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4;
- (void)startStream;
- (void)stopStream;
@end

@implementation AUAStream

- (void)startStream
{
  v2 = self;
  AUAStream.start()();
}

- (void)stopStream
{
  v2 = self;
  AUAStream.stop()();
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  v4 = self;
  Swift::Bool v5 = AUAStream.deviceChanged(toSamplingRate:)(a3);

  return v5;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = AUAStream.changePhysicalFormat(_:)(v3);

  return v3 & 1;
}

- (id)channelNameForChannelIndex:(unsigned int)a3
{
  v4 = self;
  object = AUAStream.channelName(forChannelIndex:)(a3).value._object;

  if (object)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

- (id)channelCategoryForChannelIndex:(unsigned int)a3
{
  id v3 = self;
  sub_10002E81C(0xD00000000000001ELL, 0x80000001000E4ED0, 0xD000000000000021, (void *)0x80000001000E4EF0, 0xD000000000000016, 0x80000001000E4E30, 680);

  return 0;
}

- (id)channelNumberForChannelIndex:(unsigned int)a3
{
  id v3 = self;
  sub_10002E81C(0xD00000000000001CLL, 0x80000001000E4F20, 0xD00000000000001FLL, (void *)0x80000001000E4F40, 0xD000000000000016, 0x80000001000E4E30, 686);

  return 0;
}

- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4
{
  NSString v6 = self;
  AUAStream.preferredChannelDescription(_:forChannelIndex:)((uint64_t)a3, a4);
}

- (AUAStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  id v4 = a4;
  result = (AUAStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_release();
  id v3 = &self->ASDStream_opaque[OBJC_IVAR___AUAStream_signpostID];
  uint64_t v4 = type metadata accessor for OSSignpostID();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_10001ABC4((uint64_t)&self->ASDStream_opaque[OBJC_IVAR___AUAStream_streamingTerminal]);
  id v5 = &self->ASDStream_opaque[OBJC_IVAR___AUAStream_otherTerminal];

  sub_10001ABC4((uint64_t)v5);
}

@end