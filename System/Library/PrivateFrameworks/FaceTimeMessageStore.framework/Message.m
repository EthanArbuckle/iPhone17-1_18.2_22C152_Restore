@interface Message
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC20FaceTimeMessageStore7Message)init;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Message

+ (BOOL)supportsSecureCoding
{
  return static Message.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24DE9E09C();
}

- (NSString)description
{
  v2 = self;
  sub_24DEA1A90();

  v3 = (void *)sub_24DF1ECA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore7Message)init
{
}

- (void).cxx_destruct
{
  sub_24DF1E630();
  OUTLINED_FUNCTION_64();
  id v4 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_35_3();
  v4();
  OUTLINED_FUNCTION_35_3();
  v4();
  OUTLINED_FUNCTION_35_3();
  v4();
  sub_24DF1E400();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_8();
  v5();
  sub_24DE6EAC8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_messageThumbnail, (uint64_t *)&unk_26B1A6230);
  sub_24DE6EAC8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore7Message__transcript, (uint64_t *)&unk_26B1A6230);
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_148();
  sub_24DF1E5B0();
  OUTLINED_FUNCTION_64();
  v7 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_35_3();
  v7();
  OUTLINED_FUNCTION_35_3();
  v7();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_148();
  swift_bridgeObjectRelease();

  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20FaceTimeMessageStore7Message_sandboxTranscriptFile);
}

@end