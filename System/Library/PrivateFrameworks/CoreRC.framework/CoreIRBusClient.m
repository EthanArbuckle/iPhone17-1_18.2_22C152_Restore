@interface CoreIRBusClient
+ (BOOL)supportsSecureCoding;
- (BOOL)deleteDevice:(id)a3 error:(id *)a4;
- (BOOL)setPairState:(BOOL)a3 forAppleRemote:(id)a4 error:(id *)a5;
- (Class)classForCoder;
- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 error:(id *)a5;
- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 learningSession:(id)a5 error:(id *)a6;
@end

@implementation CoreIRBusClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Coreirbus.isa);
}

- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 error:(id *)a5
{
  id v10 = [(CoreRCBus *)self manager];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  uint64_t v21 = 0;
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRBusClient.m", 50, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 50 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__CoreIRBusClient_addDeviceWithType_matching_error___block_invoke;
  v15[3] = &unk_2652E3408;
  v15[4] = v10;
  v15[5] = self;
  v15[6] = a4;
  v15[7] = &v16;
  v15[8] = a3;
  int v11 = CoreRCWaitForAsyncOperation(a5, (uint64_t)v15);
  id v12 = (id)v17[5];
  if (v11)
  {
    id v13 = v12;
    id v12 = [(CoreRCBus *)self mergeDevice:v17[5]];
    v17[5] = (uint64_t)v12;
  }
  _Block_object_dispose(&v16, 8);
  return v12;
}

uint64_t __52__CoreIRBusClient_addDeviceWithType_matching_error___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[6];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__CoreIRBusClient_addDeviceWithType_matching_error___block_invoke_2;
  v8[3] = &unk_2652E33E0;
  uint64_t v6 = a1[7];
  uint64_t v5 = a1[8];
  v8[4] = a2;
  v8[5] = v6;
  return [v3 addDeviceOnBusAsync:v2 withType:v5 matching:v4 reply:v8];
}

uint64_t __52__CoreIRBusClient_addDeviceWithType_matching_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    if (a2) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
    }
    else {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6712 userInfo:0];
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (id)addDeviceWithType:(unint64_t)a3 matching:(id)a4 learningSession:(id)a5 error:(id *)a6
{
  id v12 = [(CoreRCBus *)self manager];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  uint64_t v23 = 0;
  if (!v12) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRBusClient.m", 88, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 50 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    [a5 owningDevice];
    LogPrintF();
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__CoreIRBusClient_addDeviceWithType_matching_learningSession_error___block_invoke;
  v17[3] = &unk_2652E3430;
  v17[4] = v12;
  v17[5] = self;
  v17[6] = a4;
  v17[7] = a5;
  v17[8] = &v18;
  v17[9] = a3;
  int v13 = CoreRCWaitForAsyncOperation(a6, (uint64_t)v17);
  id v14 = (id)v19[5];
  if (v13)
  {
    id v15 = v14;
    id v14 = [(CoreRCBus *)self mergeDevice:v19[5]];
    v19[5] = (uint64_t)v14;
  }
  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __68__CoreIRBusClient_addDeviceWithType_matching_learningSession_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 56) owningDevice];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CoreIRBusClient_addDeviceWithType_matching_learningSession_error___block_invoke_2;
  v11[3] = &unk_2652E33E0;
  uint64_t v9 = *(void *)(a1 + 64);
  v11[4] = a2;
  v11[5] = v9;
  return [v4 addDeviceOnBusAsync:v5 withType:v6 matching:v7 withSessionOwningDevice:v8 reply:v11];
}

uint64_t __68__CoreIRBusClient_addDeviceWithType_matching_learningSession_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    if (a2) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
    }
    else {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6712 userInfo:0];
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCBus *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRBusClient.m", 127, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 50 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__CoreIRBusClient_deleteDevice_error___block_invoke;
  v10[3] = &unk_2652E3480;
  v10[4] = v8;
  v10[5] = a3;
  v10[6] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __38__CoreIRBusClient_deleteDevice_error___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[6];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__CoreIRBusClient_deleteDevice_error___block_invoke_2;
  v6[3] = &unk_2652E3458;
  v6[4] = a2;
  return [v3 deleteDeviceAsync:v2 fromBus:v4 reply:v6];
}

uint64_t __38__CoreIRBusClient_deleteDevice_error___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 && (a2 & 1) == 0) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (BOOL)setPairState:(BOOL)a3 forAppleRemote:(id)a4 error:(id *)a5
{
  BOOL v7 = a3;
  id v10 = [(CoreRCBus *)self manager];
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRBusClient.m", 147, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = objc_opt_class();
    id v15 = self;
    LogPrintF();
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__CoreIRBusClient_setPairState_forAppleRemote_error___block_invoke;
  v16[3] = &unk_2652E34A8;
  BOOL v17 = v7;
  v16[4] = v10;
  v16[5] = a4;
  int v11 = CoreRCWaitForAsyncOperation(a5, (uint64_t)v16);
  if (v11)
  {
    if (v7) {
      id v12 = a4;
    }
    else {
      id v12 = 0;
    }
    LOBYTE(v11) = -[CoreIRBus setPairedAppleRemote:error:](self, "setPairedAppleRemote:error:", v12, a5, v14, v15);
  }
  return v11;
}

uint64_t __53__CoreIRBusClient_setPairState_forAppleRemote_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setPairStateAsync:*(unsigned __int8 *)(a1 + 48) forAppleRemote:*(void *)(a1 + 40) reply:a2];
}

@end