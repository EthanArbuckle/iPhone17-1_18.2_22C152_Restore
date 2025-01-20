@interface Application
- (BOOL)isEqual:(id)a3;
- (_TtC12ClarityBoard11Application)init;
- (int64_t)hash;
- (void)dealloc;
- (void)didUpdateBadgeStringForApplicationInfo:(id)a3;
- (void)didUpdateIconImageForApplicationInfo:(id)a3;
@end

@implementation Application

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC12ClarityBoard11Application_applicationInfo;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ClarityBoard11Application_applicationInfo);
  v5 = self;
  [v4 removeIconImageObserver:v5];
  [*(id *)((char *)&self->super.isa + v3) removeBadgeStringObserver:v5];
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for Application(0);
  [(Application *)&v6 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC12ClarityBoard11Application__badgeString;
  uint64_t v4 = sub_100029F90((uint64_t *)&unk_10017EF20);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (int64_t)hash
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ClarityBoard11Application_applicationInfo);
  uint64_t v3 = self;
  id v4 = [v2 bundleIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10002D088();
  int64_t v5 = StringProtocol.hash.getter();

  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    int64_t v5 = self;
  }
  char v6 = sub_100094F9C((uint64_t)v8);

  sub_10009706C((uint64_t)v8);
  return v6 & 1;
}

- (void)didUpdateBadgeStringForApplicationInfo:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  id v6 = [v4 badgeString];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_getKeyPath();
  swift_getKeyPath();
  v7 = v5;
  static Published.subscript.setter();
  type metadata accessor for Application(0);
  sub_10009701C(&qword_10017DDD8, (void (*)(uint64_t))type metadata accessor for Application);
  ObservableObject<>.objectWillChange.getter();
  ObservableObjectPublisher.send()();

  swift_release();
}

- (void)didUpdateIconImageForApplicationInfo:(id)a3
{
  type metadata accessor for Application(0);
  sub_10009701C(&qword_10017DDD8, (void (*)(uint64_t))type metadata accessor for Application);
  id v5 = a3;
  id v6 = self;
  ObservableObject<>.objectWillChange.getter();
  ObservableObjectPublisher.send()();

  swift_release();
}

- (_TtC12ClarityBoard11Application)init
{
  result = (_TtC12ClarityBoard11Application *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end