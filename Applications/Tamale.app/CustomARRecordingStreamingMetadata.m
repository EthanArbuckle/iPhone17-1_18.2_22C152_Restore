@interface CustomARRecordingStreamingMetadata
+ (BOOL)supportsSecureCoding;
- (_TtC6Tamale34CustomARRecordingStreamingMetadata)init;
- (_TtC6Tamale34CustomARRecordingStreamingMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CustomARRecordingStreamingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC6Tamale34CustomARRecordingStreamingMetadata)initWithCoder:(id)a3
{
  return (_TtC6Tamale34CustomARRecordingStreamingMetadata *)sub_1001450A4(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10014540C(v4);
}

- (_TtC6Tamale34CustomARRecordingStreamingMetadata)init
{
  result = (_TtC6Tamale34CustomARRecordingStreamingMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->wrappedMetadata[OBJC_IVAR____TtC6Tamale34CustomARRecordingStreamingMetadata_wrappedMetadata
                                       + 16];
  unint64_t v3 = *(void *)&self->wrappedMetadata[OBJC_IVAR____TtC6Tamale34CustomARRecordingStreamingMetadata_wrappedMetadata
                                       + 24];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100094760(v2, v3);
}

@end