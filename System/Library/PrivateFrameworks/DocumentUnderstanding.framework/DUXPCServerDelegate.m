@interface DUXPCServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DUXPCServerDelegate)initWithManager:(id)a3;
@end

@implementation DUXPCServerDelegate

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v8, (uint64_t)&unk_26E9E5AF8, v9, v10);
  v12 = (void *)MEMORY[0x237E079B0]();
  id v13 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v19 = objc_msgSend_initWithObjects_(v13, v16, v14, v17, v18, v15, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v11, v20, (uint64_t)v19, (uint64_t)sel_addOrUpdateSearchableItems_bundleID_completion_, 0, 0);

  v21 = [DUXPCServerRequestHandler alloc];
  v25 = objc_msgSend_initWithManager_(v21, v22, (uint64_t)self->_textUnderstandingManager, v23, v24);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_236970290;
  aBlock[3] = &unk_264CB4390;
  id v26 = v25;
  id v34 = v26;
  v27 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_236970334;
  v31[3] = &unk_264CB43B8;
  id v32 = v26;
  id v28 = v26;
  LOBYTE(v19) = objc_msgSend_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_(DUXPCServerHelper, v29, (uint64_t)v7, @"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting", (uint64_t)v11, v28, v27, v31, &unk_26E9CEA90, &unk_26E9CEAB0);

  return (char)v19;
}

- (DUXPCServerDelegate)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DUXPCServerDelegate;
  id v6 = [(DUXPCServerDelegate *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textUnderstandingManager, a3);
  }

  return v7;
}

@end