@interface SRRawPayload
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (SRRawPayload)init;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation SRRawPayload

- (id)serialize
{
  uint64_t v2 = RawPayload.data.getter();
  if (v3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000A330(v5, v6);
  }

  return isa;
}

- (void).cxx_destruct
{
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  swift_getObjCClassMetadata();
  id v8 = static RawPayload.event(with:dataVersion:)(v5, v7);
  sub_1000291B4(v5, v7);

  return v8;
}

- (SRRawPayload)init
{
}

@end