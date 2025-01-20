@interface GPAppleConnectTokenProvider_Swift
- (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift)init;
- (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift)initWithAuthenticatingProtocol:(id)a3;
- (void)setupTokenWithCompletion:(id)a3;
@end

@implementation GPAppleConnectTokenProvider_Swift

- (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift)initWithAuthenticatingProtocol:(id)a3
{
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift__token);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t ObjectType = swift_getObjectType();
  *(void *)&long long v8 = a3;
  sub_243EA6E2C(&v8, (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *)((char *)self+ OBJC_IVAR____TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift__authenticatingProtocol));
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for GPAppleConnectTokenProvider_Swift();
  swift_unknownObjectRetain();
  return [(GPAppleConnectTokenProvider_Swift *)&v7 init];
}

- (void)setupTokenWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_243F79548((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift)init
{
  result = (_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift__authenticatingProtocol;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end