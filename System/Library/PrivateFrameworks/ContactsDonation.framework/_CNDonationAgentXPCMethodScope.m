@interface _CNDonationAgentXPCMethodScope
- (CNPromise)promise;
- (DonationAgentProtocol)proxy;
- (_CNDonationAgentXPCMethodScope)init;
- (_CNDonationAgentXPCMethodScope)initWithConnection:(id)a3 promise:(id)a4 proxy:(id)a5;
- (_CNDonationAgentXPCMethodScope)initWithPromise:(id)a3 proxy:(id)a4;
@end

@implementation _CNDonationAgentXPCMethodScope

- (_CNDonationAgentXPCMethodScope)init
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F33630]);
  objc_initWeak(&location, v3);
  id v4 = +[CNDonationAgentXPCAdapter newXPCConnection];
  v5 = (void *)MEMORY[0x263F336A8];
  v21[0] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v7 = [v4 remoteObjectInterface];
  [v5 addAllowedClasses:v6 toInterface:v7 forSelector:sel_meCardDonations_ argumentIndex:0 ofReply:1];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __38___CNDonationAgentXPCMethodScope_init__block_invoke;
  v18[3] = &unk_2641FC4A0;
  objc_copyWeak(&v19, &location);
  [v4 setInterruptionHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38___CNDonationAgentXPCMethodScope_init__block_invoke_2;
  v16[3] = &unk_2641FC4A0;
  objc_copyWeak(&v17, &location);
  [v4 setInvalidationHandler:v16];
  [v4 resume];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __38___CNDonationAgentXPCMethodScope_init__block_invoke_3;
  v14 = &unk_2641FC4C8;
  objc_copyWeak(&v15, &location);
  v8 = [v4 remoteObjectProxyWithErrorHandler:&v11];
  v9 = -[_CNDonationAgentXPCMethodScope initWithConnection:promise:proxy:](self, "initWithConnection:promise:proxy:", v4, v3, v8, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v9;
}

- (_CNDonationAgentXPCMethodScope)initWithConnection:(id)a3 promise:(id)a4 proxy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_CNDonationAgentXPCMethodScope;
  uint64_t v11 = [(_CNDonationAgentXPCMethodScope *)&v22 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_promise, a4);
    objc_storeStrong((id *)&v12->_proxy, a5);
    v13 = [(CNPromise *)v12->_promise future];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67___CNDonationAgentXPCMethodScope_initWithConnection_promise_proxy___block_invoke;
    v20[3] = &unk_2641FC4F0;
    id v14 = v8;
    id v21 = v14;
    [v13 addSuccessBlock:v20];

    id v15 = [(CNPromise *)v12->_promise future];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67___CNDonationAgentXPCMethodScope_initWithConnection_promise_proxy___block_invoke_2;
    v18[3] = &unk_2641FC518;
    id v19 = v14;
    [v15 addFailureBlock:v18];

    v16 = v12;
  }

  return v12;
}

- (_CNDonationAgentXPCMethodScope)initWithPromise:(id)a3 proxy:(id)a4
{
  return [(_CNDonationAgentXPCMethodScope *)self initWithConnection:0 promise:a3 proxy:a4];
}

- (DonationAgentProtocol)proxy
{
  return self->_proxy;
}

- (CNPromise)promise
{
  return self->_promise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

@end