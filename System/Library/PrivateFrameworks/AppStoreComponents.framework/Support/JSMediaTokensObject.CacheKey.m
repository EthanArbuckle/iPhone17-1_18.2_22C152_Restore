@interface JSMediaTokensObject.CacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey)init;
- (int64_t)hash;
@end

@implementation JSMediaTokensObject.CacheKey

- (int64_t)hash
{
  Hasher.init(_seed:)();
  v3 = self;
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v4 = Hasher._finalize()();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    Swift::Int v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1000EAAB8((uint64_t)v8);

  sub_1000709E0((uint64_t)v8);
  return v6 & 1;
}

- (_TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey)init
{
  result = (_TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end