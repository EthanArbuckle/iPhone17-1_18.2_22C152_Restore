@interface FMNHttpClient
- (_TtC12FMNetworking13FMNHttpClient)init;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
@end

@implementation FMNHttpClient

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1BBC06B4C(v10, (uint64_t)v11, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)dealloc
{
  v2 = self;
  swift_retain();
  sub_1BBC37D18();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FMNHttpClient();
  [(FMNHttpClient *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1BBBFA06C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_authenticationChallengeHandler));
  swift_bridgeObjectRelease();
  sub_1BBBFDF14((uint64_t)self + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_credential, &qword_1EB9F6628);
  swift_release();
  swift_bridgeObjectRelease();

  sub_1BBBFDF14((uint64_t)self + OBJC_IVAR____TtC12FMNetworking13FMNHttpClient_session, &qword_1EB9F6578);

  swift_release();
}

- (_TtC12FMNetworking13FMNHttpClient)init
{
  result = (_TtC12FMNetworking13FMNHttpClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end