@interface LACDTOEnvironmentProvider
- (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider)init;
- (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider)initWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6;
- (void)fetchEnvironmentForPolicy:(int64_t)a3 options:(id)a4 completion:(id)a5;
@end

@implementation LACDTOEnvironmentProvider

- (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider)initWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_locationProvider) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_featureController) = (Class)a4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_ratchetStateProvider) = (Class)a5;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_lostModeController) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LACDTOEnvironmentProvider();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(LACDTOEnvironmentProvider *)&v7 init];
}

- (void)fetchEnvironmentForPolicy:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  objc_super v7 = _Block_copy(a5);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  LACDTOEnvironmentProvider.fetchEnvironment(policy:options:completion:)(a3, v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned LACDTOEnvironment?, @unowned NSError?) -> (), v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider)init
{
  result = (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end