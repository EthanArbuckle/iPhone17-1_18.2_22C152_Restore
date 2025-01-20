@interface AUMessageChannel_XPC
- (AUMessageChannel_XPC)initWithListenerEndpoint:(id)a3;
- (id)callAudioUnit:(id)a3;
- (id)callHostBlock;
- (void)dealloc;
- (void)setCallHostBlock:(id)a3;
@end

@implementation AUMessageChannel_XPC

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callHostBlock, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setCallHostBlock:(id)a3
{
}

- (id)callHostBlock
{
  return self->_callHostBlock;
}

- (void)dealloc
{
  v14[4] = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  v9[0] = &unk_1EDF9E488;
  v9[1] = &__block_literal_global_117;
  v9[3] = v9;
  v4 = xpcConnection;
  v10 = v4;
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEEC2B8ne180100ERKS8_((uint64_t)v11, (uint64_t)v9);

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v9);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEEC2B8ne180100ERKS8_((uint64_t)v14, (uint64_t)v11);
  v5 = v10;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33AUAudioUnitMessageChannelProtocol11objc_objectJEE11async_proxyEv_block_invoke;
  v12[3] = &__block_descriptor_64_ea8_32c50_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJEEEEEE_e17_v16__0__NSError_8l;
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEEC2B8ne180100ERKS8_((uint64_t)v13, (uint64_t)v14);
  v6 = [(NSXPCConnection *)v5 remoteObjectProxyWithErrorHandler:v12];
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v13);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v14);
  [v6 releaseChannel];

  v7 = self->_xpcConnection;
  self->_xpcConnection = 0;

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v11);
  v8.receiver = self;
  v8.super_class = (Class)AUMessageChannel_XPC;
  [(AUMessageChannel_XPC *)&v8 dealloc];
}

- (id)callAudioUnit:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(&v10, self->_xpcConnection);
  v5 = caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(&v10);
  v6 = caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)&v10);
  [v5 onCallRemoteAU:v4 reply:v6];

  id v7 = v13;
  if (v12) {
    id v8 = 0;
  }
  else {
    id v8 = v13;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::~__value_func[abi:ne180100](v11);
  return v8;
}

- (AUMessageChannel_XPC)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AUMessageChannel_XPC;
  v5 = [(AUMessageChannel_XPC *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (NSXPCConnection *)v6;

    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB43D0];
    [(NSXPCConnection *)v5->_xpcConnection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_xpcConnection setInterruptionHandler:&__block_literal_global_105];
    [(NSXPCConnection *)v5->_xpcConnection setInvalidationHandler:&__block_literal_global_110];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB43D0];
    [(NSXPCConnection *)v5->_xpcConnection setExportedInterface:v9];

    v10 = [[ExportedMessageChannel alloc] initWithMessageChannel:v5];
    [(NSXPCConnection *)v5->_xpcConnection setExportedObject:v10];

    [(NSXPCConnection *)v5->_xpcConnection resume];
    v11 = v5;
  }

  return v5;
}

@end