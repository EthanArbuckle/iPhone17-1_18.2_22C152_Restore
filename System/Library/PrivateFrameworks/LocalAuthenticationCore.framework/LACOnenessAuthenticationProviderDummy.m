@interface LACOnenessAuthenticationProviderDummy
- (BOOL)isAvailable;
- (LACOnenessAuthenticationProviderDelegate)delegate;
- (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy)init;
- (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy)initWithReplyQueue:(id)a3;
- (id)authenticateClient:(id)a3 withAcmContext:(id)a4;
- (void)cancelAuthenticationWithID:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation LACOnenessAuthenticationProviderDummy

- (LACOnenessAuthenticationProviderDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (LACOnenessAuthenticationProviderDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isAvailable
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_isCompanionSessionActive);

  if (v5) {
  return v5 != 0;
  }
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  _Block_copy(v5);
  swift_unknownObjectRetain();
  v6 = self;
  specialized LACOnenessAuthenticationProviderDummy.domainState(for:completion:)((uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_unknownObjectRelease();
}

- (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy)initWithReplyQueue:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_delegate) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_replyQueue) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(LACOnenessAuthenticationProviderDummy *)&v8 init];
}

- (id)authenticateClient:(id)a3 withAcmContext:(id)a4
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  UUID.init()();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
  $defer #1 () in LACOnenessAuthenticationProviderDummy.authenticateClient(_:withAcmContext:)((uint64_t)v16, (uint64_t)v10);
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v10, v7);
  outlined consume of Data._Representation(v17, v19);

  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    v20(v13, v7);
  }
  return isa;
}

- (void)cancelAuthenticationWithID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  LACOnenessAuthenticationProviderDummy.cancelAuthentication(with:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy)init
{
  result = (_TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore37LACOnenessAuthenticationProviderDummy_replyQueue));
  swift_unknownObjectRelease();
}

@end