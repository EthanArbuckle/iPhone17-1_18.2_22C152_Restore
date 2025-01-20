@interface APAdvertiserRapportManager
@end

@implementation APAdvertiserRapportManager

void __APAdvertiserRapportManager_startAdvertising_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -6709;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (gLogCategory_APAdvertiserRapportManager <= 50
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t active = _APAdvertiserRapportManager_lookupAndRetainActiveManagerWithKey(*(void *)(a1 + 32));
  v7 = (const void *)active;
  if (active)
  {
    v8 = *(NSObject **)(active + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __APAdvertiserRapportManager_startAdvertising_block_invoke_2;
    block[3] = &unk_264895F08;
    block[4] = &v17;
    block[5] = &v13;
    block[6] = v7;
    dispatch_sync(v8, block);
  }
  uint64_t v9 = *((int *)v18 + 6);
  if (v9) {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v9 userInfo:0];
  }
  else {
    uint64_t v10 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a4 + 16))(a4, v14[3], 0, v10);
  v11 = (const void *)v14[3];
  if (v11) {
    CFRelease(v11);
  }
  if (v7) {
    CFRelease(v7);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void __APAdvertiserRapportManager_startAdvertising_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2
    && gLogCategory_APAdvertiserRapportManager <= 90
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t active = _APAdvertiserRapportManager_lookupAndRetainActiveManagerWithKey(*(void *)(a1 + 32));
  if (active)
  {
    v5 = (const void *)active;
    v6 = *(NSObject **)(active + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __APAdvertiserRapportManager_startAdvertising_block_invoke_4;
    block[3] = &unk_264896140;
    block[4] = a2;
    block[5] = v5;
    dispatch_sync(v6, block);
    CFRelease(v5);
  }
  else
  {
    APSLogErrorAt();
  }
}

void __APAdvertiserRapportManager_startAdvertising_block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v1 + 24))
  {
    if (*(void *)(a1 + 32))
    {
      [*(id *)(v1 + 64) deregisterRequestID:@"com.apple.airplay.discovery.getinfo"];
      [*(id *)(*(void *)(a1 + 40) + 64) invalidate];

      *(void *)(*(void *)(a1 + 40) + 64) = 0;
    }
    else
    {
      *(unsigned char *)(v1 + 80) = 1;
    }
  }
}

void __APAdvertiserRapportManager_startAdvertising_block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  if (!*(unsigned char *)(v1 + 24))
  {
    if (*(void *)(v1 + 48))
    {
      uint64_t v3 = *(void *)(a1[5] + 8);
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        v5 = Mutable;
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F24998], *(const void **)(v1 + 48));
        int v6 = 0;
        *(void *)(v3 + 24) = v5;
      }
      else
      {
        APSLogErrorAt();
        int v6 = -6728;
      }
    }
    else
    {
      APSLogErrorAt();
      int v6 = -6709;
    }
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v6;
  }
}

uint64_t ___APAdvertiserRapportManager_getActiveManagers_block_invoke()
{
  uint64_t result = FigCFWeakReferenceTableCreate();
  if (result)
  {
    if (gLogCategory_APAdvertiserRapportManager <= 100)
    {
      if (gLogCategory_APAdvertiserRapportManager != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    __break(1u);
  }
  return result;
}

@end