@interface FSFFeatureStoreBiomeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (FSFFeatureStoreBiomeEvent)init;
- (FSFFeatureStoreBiomeEvent)initWithInteractionId:(id)a3 featureData:(id)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6;
- (NSData)featureData;
- (NSString)interactionId;
- (double)timestamp;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setDataVersion:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation FSFFeatureStoreBiomeEvent

- (NSString)interactionId
{
  uint64_t v2 = FeatureStoreBiomeEvent.interactionId.getter();
  v3 = (void *)MEMORY[0x223C0D7E0](v2);
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSData)featureData
{
  FeatureStoreBiomeEvent.featureData.getter();
  v2.super.isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v3 = OUTLINED_FUNCTION_17_2();
  outlined consume of Data._Representation(v3, v4);

  return (NSData *)v2.super.isa;
}

- (double)timestamp
{
  return FeatureStoreBiomeEvent.timestamp.getter();
}

- (void)setTimestamp:(double)a3
{
}

- (unsigned)dataVersion
{
  return FeatureStoreBiomeEvent.dataVersion.getter();
}

- (void)setDataVersion:(unsigned int)a3
{
}

- (FSFFeatureStoreBiomeEvent)initWithInteractionId:(id)a3 featureData:(id)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a4;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  return (FSFFeatureStoreBiomeEvent *)FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)(v9, v11, v13, v15, a5, a6);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  swift_getObjCClassMetadata();
  uint64_t v9 = (void *)static FeatureStoreBiomeEvent.event(with:dataVersion:)(v6, v8, a4);
  outlined consume of Data._Representation(v6, v8);

  return v9;
}

- (id)serialize
{
  NSData v2 = self;
  FeatureStoreBiomeEvent.serialize()();
  unint64_t v4 = v3;

  if (v4 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    OUTLINED_FUNCTION_17_2();
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v6 = OUTLINED_FUNCTION_17_2();
    outlined consume of Data?(v6, v7);
  }

  return isa;
}

- (FSFFeatureStoreBiomeEvent)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData);
  unint64_t v4 = *(void *)&self->interactionId[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData];

  outlined consume of Data._Representation(v3, v4);
}

@end