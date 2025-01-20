@interface MessageUpdate
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC20FaceTimeMessageStore13MessageUpdate)init;
- (_TtC20FaceTimeMessageStore13MessageUpdate)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MessageUpdate

+ (BOOL)supportsSecureCoding
{
  return static MessageUpdate.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC20FaceTimeMessageStore13MessageUpdate)initWithCoder:(id)a3
{
  id v3 = a3;
  MessageUpdate.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MessageUpdate.encode(with:)((NSCoder)v4);
}

- (NSString)description
{
  v2 = self;
  MessageUpdate.description.getter();

  id v3 = (void *)sub_24DF1ECA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore13MessageUpdate)init
{
}

- (void).cxx_destruct
{
  sub_24DF1E630();
  OUTLINED_FUNCTION_5_21();
  OUTLINED_FUNCTION_8();
  v3();
  sub_24DF1A6E8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_callUUID, &qword_26B1A3C30);
  sub_24DF1A6E8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_conversationID, &qword_26B1A3C30);
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_148();
  sub_24DF1A6E8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_transcriptURL, (uint64_t *)&unk_26B1A6230);
  OUTLINED_FUNCTION_148();
  sub_24DF1A6E8((uint64_t)self + OBJC_IVAR____TtC20FaceTimeMessageStore13MessageUpdate_dateCreated, (uint64_t *)&unk_26B1A3C20);
}

@end