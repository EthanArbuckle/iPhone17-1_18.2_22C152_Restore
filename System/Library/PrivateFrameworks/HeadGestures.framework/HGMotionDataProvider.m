@interface HGMotionDataProvider
- (NSString)description;
- (_TtC12HeadGestures20HGMotionDataProvider)init;
@end

@implementation HGMotionDataProvider

- (NSString)description
{
  v2 = (void *)sub_250C1D6A8();
  return (NSString *)v2;
}

- (_TtC12HeadGestures20HGMotionDataProvider)init
{
  return (_TtC12HeadGestures20HGMotionDataProvider *)sub_250BF0A30();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider__isStreamingData;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
}

@end