@interface CoreIRLearningSessionClient
- (BOOL)startLearningCommand:(unint64_t)a3;
- (CoreRCManagerClient)manager;
- (void)endLearning;
- (void)setManager:(id)a3;
@end

@implementation CoreIRLearningSessionClient

- (BOOL)startLearningCommand:(unint64_t)a3
{
  v6 = [(CoreIRLearningSessionClient *)self manager];
  uint64_t v9 = 0;
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRLearningSessionClient.m", 36, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    CoreRCCommandString(a3);
    LogPrintF();
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__CoreIRLearningSessionClient_startLearningCommand___block_invoke;
  v8[3] = &unk_2652E4E68;
  v8[5] = self;
  v8[6] = a3;
  v8[4] = v6;
  return CoreRCWaitForAsyncOperation(&v9, (uint64_t)v8);
}

uint64_t __52__CoreIRLearningSessionClient_startLearningCommand___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 40) owningDevice];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__CoreIRLearningSessionClient_startLearningCommand___block_invoke_2;
  v7[3] = &unk_2652E3458;
  v7[4] = a2;
  return [v3 startLearningCommandAsync:v4 withDevice:v5 reply:v7];
}

uint64_t __52__CoreIRLearningSessionClient_startLearningCommand___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 && (a2 & 1) == 0) {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (void)endLearning
{
  uint64_t v4 = [(CoreIRLearningSessionClient *)self manager];
  uint64_t v9 = 0;
  if (!v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreIRLearningSessionClient.m", 56, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__CoreIRLearningSessionClient_endLearning__block_invoke;
  v8[3] = &unk_2652E3DD8;
  v8[4] = v4;
  v8[5] = self;
  CoreRCWaitForAsyncOperation(&v9, (uint64_t)v8);
  uint64_t v5 = v9;
  if (v9 && gLogCategory_CoreRCXPC <= 90)
  {
    if (gLogCategory_CoreRCXPC == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_12;
      }
      uint64_t v5 = v9;
    }
    uint64_t v6 = v5;
    LogPrintF();
  }
LABEL_12:
  v7.receiver = self;
  v7.super_class = (Class)CoreIRLearningSessionClient;
  [(CoreIRLearningSession *)&v7 endLearning];
}

uint64_t __42__CoreIRLearningSessionClient_endLearning__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) owningDevice];
  return [v3 endLearningWithDeviceAsync:v4 reply:a2];
}

- (CoreRCManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  self->_manager = (CoreRCManagerClient *)a3;
}

@end