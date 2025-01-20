@interface BoxedCKMergeable
- (BOOL)mergeDeltas:(id)a3 error:(id *)a4;
- (NSString)description;
- (_TtC12CloudKitCode16BoxedCKMergeable)init;
- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4;
@end

@implementation BoxedCKMergeable

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_20CB6EFB0();

  sub_20CB6F858();
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  sub_20CB6F858();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  sub_20CB6F138();
  swift_bridgeObjectRelease();

  return 1;
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = sub_20CB6F2CC();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x210555430](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC12CloudKitCode16BoxedCKMergeable)init
{
}

- (void).cxx_destruct
{
}

@end