@interface CoreCECBusClient
+ (BOOL)supportsSecureCoding;
- (BOOL)setOSDName:(id)a3 error:(id *)a4;
- (BOOL)setTvLanguageCode:(id)a3 error:(id *)a4;
- (Class)classForCoder;
- (id)addDeviceWithAttributes:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeDeviceWithType:(unint64_t)a3;
@end

@implementation CoreCECBusClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Corececbus.isa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECBusClient;
  return [(CoreRCBus *)&v4 copyWithZone:a3];
}

- (id)addDeviceWithAttributes:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCBus *)self manager];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  uint64_t v19 = 0;
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECBusClient.m", 93, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__CoreCECBusClient_addDeviceWithAttributes_error___block_invoke;
  v13[3] = &unk_2652E3F98;
  v13[4] = v8;
  v13[5] = a3;
  v13[6] = self;
  v13[7] = &v14;
  int v9 = CoreRCWaitForAsyncOperation(a4, (uint64_t)v13);
  id v10 = (id)v15[5];
  if (v9)
  {
    id v11 = v10;
    id v10 = [(CoreRCBus *)self mergeDevice:v15[5]];
    v15[5] = (uint64_t)v10;
  }
  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __50__CoreCECBusClient_addDeviceWithAttributes_error___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CoreCECBusClient_addDeviceWithAttributes_error___block_invoke_2;
  v7[3] = &unk_2652E4FA8;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  v7[4] = a2;
  v7[5] = v5;
  return [v3 queryLocalInstanceAsync:v2 bus:v4 reply:v7];
}

uint64_t __50__CoreCECBusClient_addDeviceWithAttributes_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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

- (void)removeDeviceWithType:(unint64_t)a3
{
  id v6 = [(CoreRCBus *)self manager];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECBusClient.m", 133, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CoreCECBusClient_removeDeviceWithType___block_invoke;
  v7[3] = &unk_2652E4E68;
  v7[5] = self;
  void v7[6] = a3;
  v7[4] = v6;
  if ((CoreRCWaitForAsyncOperation(0, (uint64_t)v7) & 1) == 0
    && gLogCategory_CoreRCXPC <= 40
    && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __41__CoreCECBusClient_removeDeviceWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRemoveDeviceWithTypeAsync:*(void *)(a1 + 48) bus:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)setOSDName:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCBus *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECBusClient.m", 150, @"manager must not be nil: %@", self);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__CoreCECBusClient_setOSDName_error___block_invoke;
  v12[3] = &unk_2652E3480;
  v12[4] = v8;
  v12[5] = a3;
  v12[6] = self;
  int v9 = CoreRCWaitForAsyncOperation(a4, (uint64_t)v12);
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)CoreCECBusClient;
    LOBYTE(v9) = [(CoreCECBus *)&v11 setOSDName:a3 error:a4];
  }
  return v9;
}

uint64_t __37__CoreCECBusClient_setOSDName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setOsdNameAsync:*(void *)(a1 + 40) forBus:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)setTvLanguageCode:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCBus *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECBusClient.m", 173, @"manager must not be nil: %@", self);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__CoreCECBusClient_setTvLanguageCode_error___block_invoke;
  v10[3] = &unk_2652E3480;
  v10[4] = v8;
  v10[5] = a3;
  v10[6] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __44__CoreCECBusClient_setTvLanguageCode_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setTvLanguageCodeAsync:*(void *)(a1 + 40) forBus:*(void *)(a1 + 48) reply:a2];
}

@end