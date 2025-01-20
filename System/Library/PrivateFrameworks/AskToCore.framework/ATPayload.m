@interface ATPayload
+ (BOOL)supportsSecureCoding;
+ (signed)currentVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForFamily;
- (NSArray)allResponses;
- (NSDictionary)dictionaryRepresentation;
- (NSString)clientBundleIdentifier;
- (NSString)description;
- (NSString)messageGUID;
- (_TtC5AskTo10ATQuestion)question;
- (_TtC9AskToCore10ATResponse)response;
- (_TtC9AskToCore9ATPayload)init;
- (_TtC9AskToCore9ATPayload)initWithCoder:(id)a3;
- (_TtC9AskToCore9ATPayload)initWithCopying:(id)a3;
- (_TtC9AskToCore9ATPayload)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (_TtC9AskToCore9ATPayload)initWithOriginalPayload:(id)a3 newResponse:(id)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (signed)rawRecipientGroup;
- (signed)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATPayload

+ (signed)currentVersion
{
  return 3;
}

- (signed)version
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_version);
}

- (NSString)clientBundleIdentifier
{
  if (*(void *)&self->version[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_248766008();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)messageGUID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (signed)rawRecipientGroup
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup);
}

- (BOOL)isForFamily
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily);
}

- (_TtC5AskTo10ATQuestion)question
{
  return (_TtC5AskTo10ATQuestion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC9AskToCore9ATPayload_question));
}

- (_TtC9AskToCore10ATResponse)response
{
  return (_TtC9AskToCore10ATResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC9AskToCore9ATPayload_response));
}

- (NSArray)allResponses
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses))
  {
    type metadata accessor for ATResponse();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_248766108();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = self;
  unint64_t v3 = ATPayload.dictionaryRepresentation.getter();

  if (v3)
  {
    v4 = (void *)sub_248765FB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (_TtC9AskToCore9ATPayload)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_248765FC8();
  swift_getObjectType();
  v5 = (_TtC9AskToCore9ATPayload *)sub_24874F04C(v4);
  swift_deallocPartialClassInstance();
  return v5;
}

- (_TtC9AskToCore9ATPayload)initWithOriginalPayload:(id)a3 newResponse:(id)a4
{
  return (_TtC9AskToCore9ATPayload *)ATPayload.init(originalPayload:newResponse:)(a3, a4);
}

- (_TtC9AskToCore9ATPayload)initWithCopying:(id)a3
{
  return (_TtC9AskToCore9ATPayload *)sub_24874FD5C(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9AskToCore9ATPayload)initWithCoder:(id)a3
{
  return (_TtC9AskToCore9ATPayload *)ATPayload.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ATPayload.encode(with:)((NSCoder)v4);
}

- (id)copyWithZone:(void *)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjectType());
  id v7 = sub_24874FD5C(self);
  v5 = (void *)sub_248766488();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_248766278();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = ATPayload.isEqual(_:)((uint64_t)v8);

  sub_248752308((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = ATPayload.hash.getter();

  return v3;
}

- (NSString)description
{
  v2 = self;
  ATPayload.description.getter();

  int64_t v3 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC9AskToCore9ATPayload)init
{
  result = (_TtC9AskToCore9ATPayload *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end