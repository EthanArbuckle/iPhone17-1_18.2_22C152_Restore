@interface FAChildAccountCutOffAgeRequest.Request
+ (Class)responseClass;
- (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request)init;
- (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request)initWithURLString:(id)a3;
- (id)urlString;
@end

@implementation FAChildAccountCutOffAgeRequest.Request

+ (Class)responseClass
{
  type metadata accessor for FAChildAccountCutOffAgeResponse();
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)urlString
{
  v2 = self;
  sub_1D25AA4B0();

  v3 = (void *)sub_1D25AA980();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request)initWithURLString:(id)a3
{
  result = (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request)init
{
  result = (_TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request_url;
  uint64_t v3 = sub_1D25AA520();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end