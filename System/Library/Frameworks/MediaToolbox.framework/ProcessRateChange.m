@interface ProcessRateChange
@end

@implementation ProcessRateChange

uint64_t __audioRendererCentral_ProcessRateChange_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 52);
  float v3 = *(float *)(a1 + 48);
  CMBaseObjectGetDerivedStorage();
  if (v3 == 0.0)
  {
    if (!v2)
    {
      uint64_t result = audioRendererCentral_maybeSetAudioSessionStateToNotPlaying();
      if (result) {
        goto LABEL_23;
      }
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (*(unsigned char *)(DerivedStorage + 81) == 1)
      {
        uint64_t v16 = DerivedStorage;
        if (*(void *)(DerivedStorage + 64))
        {
          uint64_t result = 0;
          *(unsigned char *)(v16 + 81) = 0;
          goto LABEL_23;
        }
      }
    }
    goto LABEL_16;
  }
  if (!v2) {
    goto LABEL_16;
  }
  uint64_t v4 = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(v4 + 81))
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(v4 + 64);
    if (v6)
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (!v7)
      {
LABEL_17:
        uint64_t result = 4294948075;
        goto LABEL_23;
      }
      v8 = *(uint64_t (**)(uint64_t, void))(v7 + 80);
      if (!v8)
      {
LABEL_22:
        uint64_t result = 4294948071;
        goto LABEL_23;
      }
      uint64_t result = v8(v6, 0);
      if (result) {
        goto LABEL_23;
      }
      *(unsigned char *)(v5 + 81) = 1;
    }
  }
  uint64_t v10 = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(v10 + 80) || (uint64_t v11 = v10, (v12 = *(void *)(v10 + 64)) == 0))
  {
LABEL_16:
    uint64_t result = 0;
    goto LABEL_23;
  }
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (!v13) {
    goto LABEL_17;
  }
  v14 = *(uint64_t (**)(uint64_t, void, void))(v13 + 56);
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t result = v14(v12, *MEMORY[0x1E4F762D8], *MEMORY[0x1E4F1CFD0]);
  if (!result) {
    *(unsigned char *)(v11 + 80) = 1;
  }
LABEL_23:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end