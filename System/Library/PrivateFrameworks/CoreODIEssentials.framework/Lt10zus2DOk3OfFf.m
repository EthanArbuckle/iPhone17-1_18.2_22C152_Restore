@interface Lt10zus2DOk3OfFf
+ (id)sharedInstance;
- (BOOL)l7UrdRfCzeduYqtA:(id)a3;
- (Lt10zus2DOk3OfFf)initWithServiceName:(id)a3;
- (id)BFzukpKGO3cStNGp:(id)a3;
- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4;
- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8;
- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14;
- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4;
- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4;
- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4;
- (void)fetchConfigThrowingWithCompletion:(id)a3;
- (void)fetchConfigWithCompletion:(id)a3;
- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7;
- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)registerICloudLoginWithCompletion:(id)a3;
- (void)uTtwJoGUgL3N0GVz;
- (void)unregisterICloudLoginWithCompletion:(id)a3;
- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4;
- (void)updateRavioliWithCompletion:(id)a3;
- (void)vffg4lwI2HftPvpO:(id)a3;
@end

@implementation Lt10zus2DOk3OfFf

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_reference;
  return v2;
}

uint64_t __34__Lt10zus2DOk3OfFf_sharedInstance__block_invoke()
{
  sharedInstance_reference = [[Lt10zus2DOk3OfFf alloc] initWithServiceName:@"com.apple.asd.scoring"];
  return MEMORY[0x270F9A758]();
}

- (Lt10zus2DOk3OfFf)initWithServiceName:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)Lt10zus2DOk3OfFf;
  v5 = [(Lt10zus2DOk3OfFf *)&v20 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v4 options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v10;

    v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5BCFB0];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v12];

    objc_initWeak(&location, v5);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __40__Lt10zus2DOk3OfFf_initWithServiceName___block_invoke;
    v17 = &unk_26422BA98;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:&v14];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__Lt10zus2DOk3OfFf_initWithServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained uTtwJoGUgL3N0GVz];
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_42];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v9 = v7;
  id v22 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_3;
  v16[3] = &unk_26422BB08;
  objc_copyWeak(&v19, &location);
  id v12 = v11;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  uint64_t v14 = _Block_copy(v16);
  uint64_t v15 = [v6 toDictionary];
  [v8 k0p7Rchr49btq6wB:v15 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v26 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_45];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v19 = v17;
  id v33 = v19;
  objc_super v20 = _Block_copy(aBlock);
  v21 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v20];
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3;
  v27[3] = &unk_26422BB30;
  objc_copyWeak(&v30, &location);
  id v22 = v21;
  id v28 = v22;
  id v23 = v19;
  id v29 = v23;
  v24 = _Block_copy(v27);
  [v18 VE7BAlWGDSKrO5xc:v14 hostChallenge:v26 challengeResponse:v15 seid:v25 nonce:v16 HY6FXG20397zwmVg:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

uint64_t __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_48];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v9 = v7;
  id v21 = v9;
  id v10 = _Block_copy(aBlock);
  v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_3;
  v15[3] = &unk_26422BB58;
  objc_copyWeak(&v18, &location);
  id v12 = v11;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = _Block_copy(v15);
  [v8 f9MGfLOgnHPuKTrU:v6 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_51];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v6 = v4;
  id v18 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_3;
  v12[3] = &unk_26422BB30;
  objc_copyWeak(&v15, &location);
  id v9 = v8;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  v11 = _Block_copy(v12);
  [v5 xs00laTiKIpDUzDP:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v36 = a3;
  id v35 = a4;
  id v32 = a5;
  id v34 = a6;
  id v33 = a7;
  id v31 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v24 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_53];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v25 = v23;
  id v43 = v25;
  id v26 = _Block_copy(aBlock);
  v27 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v26];
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3;
  v37[3] = &unk_26422BB80;
  objc_copyWeak(&v40, &location);
  id v28 = v27;
  id v38 = v28;
  id v29 = v25;
  id v39 = v29;
  id v30 = _Block_copy(v37);
  objc_msgSend(v24, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:", v36, v35, v32, v34, v33, a9, a10, v20, v21, v22, v30);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

uint64_t __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v14 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_56];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v6 = v4;
  id v16 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_3;
  v11[3] = &unk_26422BBA8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 k4eQYhyzyebbQqys:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  id v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  connection = self->_connection;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke;
  v23[3] = &unk_26422BBD0;
  v23[4] = &v24;
  uint64_t v6 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v23];
  uint64_t v7 = v25[5];
  if (!(v7 | v6))
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    id v9 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
    uint64_t v10 = [v8 errorWithDomain:v9 code:-32 userInfo:0];
    id v11 = (void *)v25[5];
    v25[5] = v10;

    uint64_t v7 = v25[5];
  }
  if (v7)
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_2;
    aBlock[3] = &unk_26422BAE0;
    id v12 = v4;
    id v21 = v12;
    id v13 = _Block_copy(aBlock);
    id v14 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v13];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_3;
    v16[3] = &unk_26422BBF8;
    objc_copyWeak(&v19, &location);
    id v15 = v14;
    id v17 = v15;
    id v18 = v12;
    [(id)v6 fetchConfigWithCompletionXPC:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v24, 8);
}

void __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_61];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_3;
  v11[3] = &unk_26422BBF8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 fetchConfigWithCompletionXPC:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_63];
  if (v6 && v7)
  {
    id v9 = (void *)MEMORY[0x263F08910];
    v13[0] = @"addresses";
    v13[1] = @"locations";
    v14[0] = v6;
    v14[1] = v7;
    id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    uint64_t v12 = 0;
    id v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v12];

    [v8 updateGeoCodingsXPC:v11 completion:&__block_literal_global_73];
  }
}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_75];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v9 = v7;
  id v22 = v9;
  id v10 = _Block_copy(aBlock);
  id v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  id v20 = 0;
  uint64_t v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v20];
  id v13 = v20;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_3;
  v16[3] = &unk_26422BB30;
  objc_copyWeak(&v19, &location);
  id v14 = v11;
  id v17 = v14;
  id v15 = v9;
  id v18 = v15;
  [v8 fetchGeoCodingsForAddressesXPC:v12 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)])
  {
    if (a3 || !v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v7 = self;
      id v21 = 0;
      id v8 = +[ASGeoCodingKeyedUnarchiver unarchivedObjectOfClass:v7 fromData:v5 error:&v21];
      id v9 = v21;

      if (v9 || !v8)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = self;
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                goto LABEL_18;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_18:
        id v9 = 0;
      }
    }
  }
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_80];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v15 = v13;
  id v26 = v15;
  id v16 = _Block_copy(aBlock);
  long long v17 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v16];
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_3;
  v20[3] = &unk_26422BBA8;
  objc_copyWeak(&v23, &location);
  id v18 = v17;
  id v21 = v18;
  id v19 = v15;
  id v22 = v19;
  [v14 llNEghuIdfPH7O8I:v10 all:v9 pregeneration:v8 workflowID:v12 completion:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

uint64_t __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  connection = self->_connection;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_82];
  BOOL v9 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:&__block_literal_global_84];
  [v10 djoNSwl5j57W5mfl:v8 eqF2XJh3hHBJQf2K:v7];

  [(Lt10zus2DOk3OfFf *)self l7UrdRfCzeduYqtA:v9];
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_86];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v9 = v7;
  id v20 = v9;
  id v10 = _Block_copy(aBlock);
  uint64_t v11 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_3;
  void v14[3] = &unk_26422BC20;
  objc_copyWeak(&v17, &location);
  id v12 = v11;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v8 rGvculjlqIwBJaoX:v6 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

uint64_t __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_89];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v6 = v4;
  id v16 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_3;
  v11[3] = &unk_26422BBA8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 registerICloudLoginWithCompletionXPC:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_91];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v6 = v4;
  id v16 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_3;
  v11[3] = &unk_26422BBA8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 unregisterICloudLoginWithCompletionXPC:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_93];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_2;
  aBlock[3] = &unk_26422BAE0;
  id v12 = v10;
  id v23 = v12;
  id v13 = _Block_copy(aBlock);
  id v14 = [(Lt10zus2DOk3OfFf *)self BFzukpKGO3cStNGp:v13];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_3;
  v17[3] = &unk_26422BB30;
  objc_copyWeak(&v20, &location);
  id v15 = v14;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [v11 pRo6qBDnfEL0sBNs:v8 i7D0Lridvo8oYoNd:v9 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [v5 UUIDString];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__Lt10zus2DOk3OfFf_BFzukpKGO3cStNGp___block_invoke;
  block[3] = &unk_26422BC48;
  block[4] = self;
  id v15 = v4;
  id v8 = v6;
  id v14 = v8;
  id v9 = v4;
  dispatch_sync(syncQueue, block);
  id v10 = v14;
  id v11 = v8;

  return v11;
}

void __37__Lt10zus2DOk3OfFf_BFzukpKGO3cStNGp___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = _Block_copy(*(const void **)(a1 + 48));
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__Lt10zus2DOk3OfFf_l7UrdRfCzeduYqtA___block_invoke;
  block[3] = &unk_26422BC70;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

uint64_t __37__Lt10zus2DOk3OfFf_l7UrdRfCzeduYqtA___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 16);
  return [v4 removeObjectForKey:v3];
}

- (void)uTtwJoGUgL3N0GVz
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__Lt10zus2DOk3OfFf_uTtwJoGUgL3N0GVz__block_invoke;
  block[3] = &unk_26422BC98;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __36__Lt10zus2DOk3OfFf_uTtwJoGUgL3N0GVz__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
  id v4 = [v2 errorWithDomain:v3 code:-31 userInfo:0];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end