@interface CoreIRDeviceClient
+ (BOOL)supportsSecureCoding;
- (BOOL)changeButtonCombination:(id)a3 delay:(double)a4 enabled:(BOOL)a5 error:(id *)a6;
- (BOOL)clearAllStoredCommands:(id *)a3;
- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)sendCommand:(id)a3 error:(id *)a4;
- (BOOL)setCommand:(unint64_t)a3 target:(id)a4 forButtonCombination:(id)a5 delay:(double)a6 error:(id *)a7;
- (BOOL)setOSDName:(id)a3 error:(id *)a4;
- (BOOL)updateMappingWithSession:(id)a3 error:(id *)a4;
- (Class)classForCoder;
- (id)startLearningSessionWithReason:(unint64_t)a3 error:(id *)a4;
@end

@implementation CoreIRDeviceClient

- (BOOL)setOSDName:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 39, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__CoreIRDeviceClient_setOSDName_error___block_invoke;
  v12[3] = &unk_2652E3480;
  v12[4] = v8;
  v12[5] = a3;
  v12[6] = self;
  int v9 = CoreRCWaitForAsyncOperation(a4, (uint64_t)v12);
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)CoreIRDeviceClient;
    LOBYTE(v9) = [(CoreIRDevice *)&v11 setOSDName:a3 error:a4];
  }
  return v9;
}

uint64_t __39__CoreIRDeviceClient_setOSDName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setOSDNameAsync:*(void *)(a1 + 40) forDevice:*(void *)(a1 + 48) reply:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Coreirdevice.isa);
}

- (BOOL)sendCommand:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 70, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__CoreIRDeviceClient_sendCommand_error___block_invoke;
  v10[3] = &unk_2652E3480;
  v10[4] = v8;
  v10[5] = a3;
  v10[6] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __40__CoreIRDeviceClient_sendCommand_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCommandAsync:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)clearAllStoredCommands:(id *)a3
{
  id v6 = [(CoreRCDevice *)self manager];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 83, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__CoreIRDeviceClient_clearAllStoredCommands___block_invoke;
  v8[3] = &unk_2652E3DD8;
  v8[4] = v6;
  v8[5] = self;
  return CoreRCWaitForAsyncOperation(a3, (uint64_t)v8);
}

uint64_t __45__CoreIRDeviceClient_clearAllStoredCommands___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__CoreIRDeviceClient_clearAllStoredCommands___block_invoke_2;
  v5[3] = &unk_2652E3458;
  v5[4] = a2;
  return [v3 clearAllStoredCommandsFromDeviceAsync:v2 reply:v5];
}

uint64_t __45__CoreIRDeviceClient_clearAllStoredCommands___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 && (a2 & 1) == 0) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (BOOL)setCommand:(unint64_t)a3 target:(id)a4 forButtonCombination:(id)a5 delay:(double)a6 error:(id *)a7
{
  id v14 = [(CoreRCDevice *)self manager];
  if (!v14) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 102, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__CoreIRDeviceClient_setCommand_target_forButtonCombination_delay_error___block_invoke;
  v16[3] = &unk_2652E3E00;
  v16[7] = a5;
  v16[8] = a3;
  v16[4] = v14;
  v16[5] = a4;
  v16[6] = self;
  *(double *)&v16[9] = a6;
  return CoreRCWaitForAsyncOperation(a7, (uint64_t)v16);
}

uint64_t __73__CoreIRDeviceClient_setCommand_target_forButtonCombination_delay_error___block_invoke(double *a1, uint64_t a2)
{
  uint64_t v3 = *((void *)a1 + 7);
  uint64_t v2 = *((void *)a1 + 8);
  v5 = (void *)*((void *)a1 + 4);
  uint64_t v4 = *((void *)a1 + 5);
  uint64_t v6 = *((void *)a1 + 6);
  double v7 = a1[9];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__CoreIRDeviceClient_setCommand_target_forButtonCombination_delay_error___block_invoke_2;
  v9[3] = &unk_2652E3458;
  v9[4] = a2;
  return [v5 setCommandAsync:v2 target:v4 source:v6 forButtonCombination:v3 delay:v9 reply:v7];
}

uint64_t __73__CoreIRDeviceClient_setCommand_target_forButtonCombination_delay_error___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 && (a2 & 1) == 0) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  return [(CoreIRDeviceClient *)self changeButtonCombination:a3 delay:1 enabled:a5 error:a4];
}

- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  return [(CoreIRDeviceClient *)self changeButtonCombination:a3 delay:0 enabled:a5 error:a4];
}

- (BOOL)changeButtonCombination:(id)a3 delay:(double)a4 enabled:(BOOL)a5 error:(id *)a6
{
  id v12 = [(CoreRCDevice *)self manager];
  if (!v12) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 136, @"manager must not be nil: %@", self);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__CoreIRDeviceClient_changeButtonCombination_delay_enabled_error___block_invoke;
  v14[3] = &unk_2652E3E28;
  v14[4] = v12;
  v14[5] = a3;
  *(double *)&v14[7] = a4;
  BOOL v15 = a5;
  v14[6] = self;
  return CoreRCWaitForAsyncOperation(a6, (uint64_t)v14);
}

uint64_t __66__CoreIRDeviceClient_changeButtonCombination_delay_enabled_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 56);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__CoreIRDeviceClient_changeButtonCombination_delay_enabled_error___block_invoke_2;
  v8[3] = &unk_2652E3458;
  v8[4] = a2;
  return [v3 changeButtonCombinationAsync:v2 delay:v5 enabled:v6 forDevice:v8 reply:v4];
}

uint64_t __66__CoreIRDeviceClient_changeButtonCombination_delay_enabled_error___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 && (a2 & 1) == 0) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  double v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (id)startLearningSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  uint64_t v18 = 0;
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 155, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 50 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__CoreIRDeviceClient_startLearningSessionWithReason_error___block_invoke;
  v12[3] = &unk_2652E3E78;
  v12[4] = v8;
  v12[5] = self;
  v12[6] = &v13;
  void v12[7] = a3;
  if (CoreRCWaitForAsyncOperation(a4, (uint64_t)v12))
  {
    id v9 = [(CoreRCDevice *)self manager];
    [(id)v14[5] setManager:v9];
    [(CoreIRDevice *)self setLearningSession:v14[5]];
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __59__CoreIRDeviceClient_startLearningSessionWithReason_error___block_invoke(void *a1, uint64_t a2)
{
  double v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__CoreIRDeviceClient_startLearningSessionWithReason_error___block_invoke_2;
  v9[3] = &unk_2652E3E50;
  uint64_t v7 = a1[6];
  v9[4] = a2;
  void v9[5] = v7;
  return [v4 startLearningSessionWithDeviceAsync:v5 forReason:v6 reply:v9];
}

uint64_t __59__CoreIRDeviceClient_startLearningSessionWithReason_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
  double v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (BOOL)updateMappingWithSession:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRDeviceClient.m", 187, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 50 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__CoreIRDeviceClient_updateMappingWithSession_error___block_invoke;
  v10[3] = &unk_2652E3480;
  v10[4] = v8;
  v10[5] = a3;
  v10[6] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __53__CoreIRDeviceClient_updateMappingWithSession_error___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) owningDevice];
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__CoreIRDeviceClient_updateMappingWithSession_error___block_invoke_2;
  v8[3] = &unk_2652E3458;
  v8[4] = a2;
  return [v4 updateMappingWithSessionOwningDeviceAsync:v5 forTargetDevice:v6 reply:v8];
}

uint64_t __53__CoreIRDeviceClient_updateMappingWithSession_error___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 && (a2 & 1) == 0) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  double v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

@end