@interface AURemoteMessageChannel
- (AURemoteMessageChannel)initWithMessageChannel:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)endpoint;
- (void)onCallRemoteAU:(id)a3 reply:(id)a4;
- (void)releaseChannel;
- (void)retainSelfIfRequired;
@end

@implementation AURemoteMessageChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfRetained, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_messageChannel, 0);
}

- (void)releaseChannel
{
  messageChannel = self->_messageChannel;
  self->_messageChannel = 0;

  selfRetained = self->_selfRetained;
  self->_selfRetained = 0;
}

- (void)retainSelfIfRequired
{
  if (self->_messageChannel)
  {
    if (self->_listener) {
      objc_storeStrong((id *)&self->_selfRetained, self);
    }
  }
}

- (void)onCallRemoteAU:(id)a3 reply:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, void, void *))a4;
  messageChannel = self->_messageChannel;
  if (messageChannel)
  {
    v8 = [(AUMessageChannel *)messageChannel callAudioUnit:v9];
    v6[2](v6, 0, v8);
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_xpcConnection, a4);
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB43D0];
  [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v7];

  [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
  v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB43D0];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v8];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c47_ZTSN5caulk8weak_refI22AURemoteMessageChannelEE_e5_v8__0l;
  objc_copyWeak(&v16, &location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_233;
  v13[3] = &__block_descriptor_40_ea8_32c47_ZTSN5caulk8weak_refI22AURemoteMessageChannelEE_e5_v8__0l;
  objc_copyWeak(&v14, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v13];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_initWeak(&from, self->_xpcConnection);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_2;
  v10[3] = &__block_descriptor_40_ea8_32c40_ZTSN5caulk8weak_refI15NSXPCConnectionEE_e36___NSDictionary_16__0__NSDictionary_8l;
  objc_copyWeak(&v11, &from);
  [(AUMessageChannel *)self->_messageChannel setCallHostBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return 1;
}

void __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_ClientConnecti.isa);
  v2 = caulk::strong<AURemoteMessageChannel>((id *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)v2[3];
    v2[3] = 0;
    v7 = v2;

    v4 = (void *)v7[2];
    v7[2] = 0;

    v5 = (void *)v7[1];
    v7[1] = 0;

    id v6 = (void *)v7[4];
    v7[4] = 0;

    v2 = v7;
  }
}

void __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_233(uint64_t a1)
{
  NSLog(&cfstr_ClientConnecti_0.isa);
  v2 = caulk::strong<AURemoteMessageChannel>((id *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)v2[3];
    v2[3] = 0;
    v7 = v2;

    v4 = (void *)v7[2];
    v7[2] = 0;

    v5 = (void *)v7[1];
    v7[1] = 0;

    id v6 = (void *)v7[4];
    v7[4] = 0;

    v2 = v7;
  }
}

id __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    caulk::xpc::sync_message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(&v10, WeakRetained);
    v5 = caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(&v10);
    id v6 = caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)&v10);
    [v5 onCallRemoteAU:v3 reply:v6];

    id v7 = v13;
    if (v12) {
      id v8 = 0;
    }
    else {
      id v8 = v13;
    }

    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v11);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (AURemoteMessageChannel)initWithMessageChannel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AURemoteMessageChannel;
  id v6 = [(AURemoteMessageChannel *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageChannel, a3);
    uint64_t v8 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v8;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
    [(NSXPCListener *)v7->_listener resume];
    v10 = v7;
  }

  return v7;
}

@end