@interface AppleIDPasskeyRequestProvider
- (_TtC3akd29AppleIDPasskeyRequestProvider)init;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 url:(id)a4;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithUrlBagKey:(id)a3;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
@end

@implementation AppleIDPasskeyRequestProvider

- (unint64_t)expectedResponseType
{
  return 1;
}

- (unint64_t)requestBodyType
{
  return 1;
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithUrlBagKey:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return [(AKURLRequestProviderImpl *)&v5 initWithUrlBagKey:a3];
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return [(AKURLRequestProviderImpl *)&v7 initWithContext:a3 urlBagKey:a4];
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5
{
  BOOL v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return [(AKURLRequestProviderImpl *)&v9 initWithContext:a3 urlBagKey:a4 shouldCacheResource:v5];
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6
{
  BOOL v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return [(AKURLRequestProviderImpl *)&v11 initWithContext:a3 urlBagKey:a4 shouldCacheResource:v7 accountManager:a6];
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 url:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  URL._bridgeToObjectiveC()(v10);
  v12 = v11;
  v13 = (objc_class *)type metadata accessor for AppleIDPasskeyRequestProvider();
  v16.receiver = self;
  v16.super_class = v13;
  v14 = [(AKURLRequestProviderImpl *)&v16 initWithContext:a3 url:v12];
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return [(AppleIDPasskeyRequestProvider *)&v3 init];
}

@end