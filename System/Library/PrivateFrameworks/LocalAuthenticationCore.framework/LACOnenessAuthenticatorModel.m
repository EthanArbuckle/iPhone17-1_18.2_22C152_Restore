@interface LACOnenessAuthenticatorModel
- (BOOL)isAvailable;
- (_TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel)init;
- (void)authenticateRequest:(id)a3 completion:(id)a4;
- (void)authenticationProvider:(id)a3 didCompleteAuthenticationWithID:(id)a4;
- (void)authenticationProvider:(id)a3 didFailAuthenticationWithID:(id)a4 error:(id)a5;
- (void)authenticationProvider:(id)a3 didStartAuthenticationWithID:(id)a4;
- (void)cancelAuthenticationForRequest:(id)a3;
- (void)dealloc;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)notificationCenter:(id)a3 didReceiveNotification:(const __CFString *)a4;
@end

@implementation LACOnenessAuthenticatorModel

- (BOOL)isAvailable
{
  v2 = self;
  char v3 = LACOnenessAuthenticatorModel.isAvailable.getter();

  return v3 & 1;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sharedInstance);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(LACOnenessAuthenticatorModel *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel_replyQueue));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  LACOnenessAuthenticatorModel.domainState(for:completion:)((uint64_t)a3, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ()partial apply, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)authenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  specialized LACOnenessAuthenticatorModel.authenticateRequest(_:completion:)(a3, (char *)v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)cancelAuthenticationForRequest:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  LACOnenessAuthenticatorModel.cancelAuthentication(for:)(a3);
  swift_unknownObjectRelease();
}

- (_TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel)init
{
  result = (_TtC23LocalAuthenticationCore28LACOnenessAuthenticatorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(const __CFString *)a4
{
  swift_unknownObjectRetain();
  id v6 = (id)a4;
  uint64_t v7 = self;
  if (LACDarwinNotificationsEqual(v6, @"com.apple.LocalAuthentication.GlobalDomainDidChange")) {
    LACOnenessAuthenticatorModel.simulateAuthenticationSuccess()();
  }

  swift_unknownObjectRelease();
}

- (void)authenticationProvider:(id)a3 didStartAuthenticationWithID:(id)a4
{
}

- (void)authenticationProvider:(id)a3 didCompleteAuthenticationWithID:(id)a4
{
}

- (void)authenticationProvider:(id)a3 didFailAuthenticationWithID:(id)a4 error:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  id v11 = a5;
  v12 = self;
  specialized LACOnenessAuthenticatorModel.authenticationProvider(_:didFailAuthenticationWith:error:)((uint64_t)v10, (uint64_t)v11);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end