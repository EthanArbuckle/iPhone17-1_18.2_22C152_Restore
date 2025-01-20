@interface CNMemojiPosterConfigurationReader
+ (BOOL)canReadConfiguration;
+ (id)memojiPosterConfigurationDataFromUserInfo:(id)a3;
- (NSData)avatarImageData;
- (NSData)avatarPoseData;
- (NSData)avatarRecordData;
- (UIColor)backgroundColor;
- (_TtC10ContactsUI33CNMemojiPosterConfigurationReader)init;
- (_TtC10ContactsUI33CNMemojiPosterConfigurationReader)initWithPosterConfigurationUserInfo:(id)a3;
@end

@implementation CNMemojiPosterConfigurationReader

+ (BOOL)canReadConfiguration
{
  return 1;
}

- (UIColor)backgroundColor
{
  sub_18B64AE5C();
  uint64_t v2 = sub_18B984478();
  v3.super.isa = UIColor.init(avatarColorDescription:)((Swift::OpaquePointer)v2).super.isa;

  return (UIColor *)v3.super.isa;
}

- (NSData)avatarImageData
{
  if (*(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 48] >> 60 == 15)
  {
    uint64_t v2 = 0;
  }
  else
  {
    UIColor v3 = self;
    uint64_t v2 = (void *)sub_18B983BB8();
  }

  return (NSData *)v2;
}

- (NSData)avatarRecordData
{
  if (*(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 8] >> 60 == 15)
  {
    uint64_t v2 = 0;
  }
  else
  {
    UIColor v3 = self;
    uint64_t v2 = (void *)sub_18B983BB8();
  }

  return (NSData *)v2;
}

- (NSData)avatarPoseData
{
  if (*(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 24] >> 60 == 15)
  {
    uint64_t v2 = 0;
  }
  else
  {
    UIColor v3 = self;
    uint64_t v2 = (void *)sub_18B983BB8();
  }

  return (NSData *)v2;
}

- (_TtC10ContactsUI33CNMemojiPosterConfigurationReader)initWithPosterConfigurationUserInfo:(id)a3
{
  uint64_t v3 = sub_18B985D78();
  return (_TtC10ContactsUI33CNMemojiPosterConfigurationReader *)CNMemojiPosterConfigurationReader.init(posterConfigurationUserInfo:)(v3);
}

+ (id)memojiPosterConfigurationDataFromUserInfo:(id)a3
{
  uint64_t v3 = sub_18B985D78();
  uint64_t v4 = sub_18B64B714(v3);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6 >> 60 == 15)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)sub_18B983BB8();
    sub_18B64B8DC(v4, v6);
  }

  return v7;
}

- (_TtC10ContactsUI33CNMemojiPosterConfigurationReader)init
{
  result = (_TtC10ContactsUI33CNMemojiPosterConfigurationReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration];
  unint64_t v3 = *(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 8];
  uint64_t v4 = *(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 16];
  unint64_t v5 = *(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 24];
  uint64_t v6 = *(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 40];
  unint64_t v7 = *(void *)&self->memojiPosterConfiguration[OBJC_IVAR____TtC10ContactsUI33CNMemojiPosterConfigurationReader_memojiPosterConfiguration
                                                 + 48];
  swift_bridgeObjectRelease();
  sub_18B64B8DC(v2, v3);
  sub_18B64B8DC(v4, v5);

  sub_18B64B8DC(v6, v7);
}

@end