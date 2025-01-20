@interface APCarPlayControlServerControl
@end

@implementation APCarPlayControlServerControl

uint64_t ___APCarPlayControlServerControl_block_invoke(uint64_t a1)
{
  uint64_t result = CFDictionaryApplyBlock();
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
  return result;
}

void ___APCarPlayControlServerControl_block_invoke_2(uint64_t a1)
{
  BonjourAdvertiserSetPort();
  BonjourAdvertiserStart();
  if (*(void *)(*(void *)(a1 + 32) + 104)) {
    APSEventRecorderRecordEvent();
  }
  uint64_t v2 = LogCategoryCopyOSLogHandle();
  v3 = (void *)v2;
  if (v2) {
    v4 = v2;
  }
  else {
    v4 = MEMORY[0x1E4F14500];
  }
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D087F000, v4, OS_SIGNPOST_EVENT, 0x2B8D07DCuLL, "AP_SIGNPOST_CAR_CONTROLSERVER_STARTEDADVERTISE", "", buf, 2u);
  }
  if (v3) {
    os_release(v3);
  }
  if (gLogCategory_CarPlayControlServer <= 40
    && (gLogCategory_CarPlayControlServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t ___APCarPlayControlServerControl_block_invoke_2_33(uint64_t a1)
{
  uint64_t result = CFDictionaryApplyBlock();
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  return result;
}

uint64_t ___APCarPlayControlServerControl_block_invoke_3()
{
  uint64_t result = BonjourAdvertiserStop();
  if (gLogCategory_CarPlayControlServer <= 40)
  {
    if (gLogCategory_CarPlayControlServer != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

@end