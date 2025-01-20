@interface AirPlayReceiverContext
- (void)handleMRCommand:(unsigned int)a3 translatedAPCommand:(unsigned int)a4 withOptions:(__CFDictionary *)a5;
@end

@implementation AirPlayReceiverContext

- (void)handleMRCommand:(unsigned int)a3 translatedAPCommand:(unsigned int)a4 withOptions:(__CFDictionary *)a5
{
  v9 = self;
  if (a5) {
    CFRetain(a5);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AirPlayReceiverContext_handleMRCommand_translatedAPCommand_withOptions___block_invoke;
  block[3] = &unk_264895260;
  unsigned int v12 = a3;
  unsigned int v13 = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(queue, block);
}

void __74__AirPlayReceiverContext_handleMRCommand_translatedAPCommand_withOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50)
    {
      if (gLogCategory_AirPlayReceiverPlatform != -1 || (v3 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v3))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    if (AirPlayReceiverSessionSendMediaRemoteCommand(*(void **)(v2 + 8), *(unsigned int *)(a1 + 48), *(_DWORD *)(a1 + 52), *(const void **)(a1 + 40)))APSLogErrorAt(); {
  }
    }

  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
  }
}

@end