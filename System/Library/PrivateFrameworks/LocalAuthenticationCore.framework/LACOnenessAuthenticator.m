@interface LACOnenessAuthenticator
- (BOOL)isAvailable;
- (LACOnenessAuthenticator)initWithClientInfoProvider:(id)a3 replyQueue:(id)a4;
- (id)authenticationProvider;
- (id)makeModelWithClientInfoProvider:(id)a3;
- (id)model;
- (id)replyQueue;
- (void)authenticateRequest:(id)a3 completion:(id)a4;
- (void)cancelAuthenticationForRequest:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
@end

@implementation LACOnenessAuthenticator

- (BOOL)isAvailable
{
  v2 = self;
  unsigned __int8 v3 = objc_msgSend(-[LACOnenessAuthenticator model](v2, sel_model), sel_isAvailable);

  swift_unknownObjectRelease();
  return v3;
}

- (id)model
{
  return self->_model;
}

- (LACOnenessAuthenticator)initWithClientInfoProvider:(id)a3 replyQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACOnenessAuthenticator;
  v8 = [(LACOnenessAuthenticator *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replyQueue, a4);
    v10 = [[LACOnenessAuthenticationProviderSharing alloc] initWithReplyQueue:v7];
    authenticationProvider = v9->_authenticationProvider;
    v9->_authenticationProvider = (LACOnenessAuthenticationProviding *)v10;

    uint64_t v12 = [(LACOnenessAuthenticator *)v9 makeModelWithClientInfoProvider:v6];
    model = v9->_model;
    v9->_model = (LACOnenessAuthenticating *)v12;
  }
  return v9;
}

- (id)authenticationProvider
{
  return self->_authenticationProvider;
}

- (id)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_authenticationProvider, 0);
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  id v9 = [(LACOnenessAuthenticator *)v8 model];
  v11[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ()partial apply;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_13;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_domainStateForRequest_completion_, a3, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
}

- (void)authenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  id v9 = [(LACOnenessAuthenticator *)v8 model];
  v11[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ();
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_6;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_authenticateRequest_completion_, a3, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
}

- (void)cancelAuthenticationForRequest:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  objc_msgSend(-[LACOnenessAuthenticator model](v5, sel_model), sel_cancelAuthenticationForRequest_, a3);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (id)makeModelWithClientInfoProvider:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = [(LACOnenessAuthenticator *)v5 authenticationProvider];
  swift_unknownObjectRetain();
  id v7 = [(LACOnenessAuthenticator *)v5 replyQueue];
  id v8 = objc_allocWithZone((Class)type metadata accessor for LACOnenessAuthenticatorModel());
  id v9 = LACOnenessAuthenticatorModel.init(authenticationProvider:clientInfoProvider:replyQueue:)((uint64_t)v6, (uint64_t)a3, v7);
  swift_unknownObjectRelease();

  return v9;
}

@end