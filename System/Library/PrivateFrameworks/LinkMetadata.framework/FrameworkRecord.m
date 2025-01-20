@interface FrameworkRecord
- (_TtC12LinkMetadata15FrameworkRecord)init;
@end

@implementation FrameworkRecord

- (_TtC12LinkMetadata15FrameworkRecord)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_frameworkURL;
  uint64_t v4 = sub_19CBBF280();
  OUTLINED_FUNCTION_5();
  v7 = *(void (**)(char *, uint64_t))(v5 + 8);
  v7(v3, v4);
  v7((char *)self + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleURL, v4);
  v6 = (char *)self + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_metadataURL;
  v7(v6, v4);
}

@end