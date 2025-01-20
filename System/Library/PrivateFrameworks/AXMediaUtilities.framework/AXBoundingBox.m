@interface AXBoundingBox
+ (id)postComputeClickabilityWithDecoded:(id)a3 nmsThreshold:(float)a4 filterThresholds:(id)a5;
+ (id)postComputeWithDecoded:(id)a3 nmsThreshold:(float)a4 filterThresholds:(id)a5;
- (NSString)description;
- (_TtC16AXMediaUtilities13AXBoundingBox)init;
@end

@implementation AXBoundingBox

- (NSString)description
{
  v2 = self;
  sub_1B588B7A8();

  v3 = (void *)sub_1B589FB18();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (id)postComputeWithDecoded:(id)a3 nmsThreshold:(float)a4 filterThresholds:(id)a5
{
  return sub_1B588CC38(a4, (uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(float))sub_1B5894A94, (void (*)(uint64_t))type metadata accessor for AXMElementDetectorResult);
}

+ (id)postComputeClickabilityWithDecoded:(id)a3 nmsThreshold:(float)a4 filterThresholds:(id)a5
{
  return sub_1B588CC38(a4, (uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, (void (*)(float))sub_1B5895CA0, (void (*)(uint64_t))type metadata accessor for AXMClickabilityDetectorResult);
}

- (_TtC16AXMediaUtilities13AXBoundingBox)init
{
  result = (_TtC16AXMediaUtilities13AXBoundingBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  uint64_t v3 = sub_1B589FA88();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end