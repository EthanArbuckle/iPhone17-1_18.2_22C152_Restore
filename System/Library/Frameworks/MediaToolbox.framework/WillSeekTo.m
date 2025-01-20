@interface WillSeekTo
@end

@implementation WillSeekTo

void __fpic_WillSeekTo_block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(int *)(*(void *)(a1 + 32) + 1040) >= 1 && dword_1E9351550 != 0)
  {
    LODWORD(v27.value) = 0;
    LOBYTE(type.value) = 0;
    os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((*(unsigned char *)(a1 + 72) & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (v4)
    {
      *(_DWORD *)(DerivedStorage + 1040) = -1;
      fpic_flipInterstitialAndPrimaryVisibility(v5, 0, v4, NAN);
    }
    return;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 56);
  long long v24 = *(_OWORD *)(a1 + 60);
  uint64_t v25 = *(void *)(a1 + 76);
  uint64_t v9 = CMBaseObjectGetDerivedStorage();
  v10 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v9 + 184));
  if (!v10)
  {
    FigSignalErrorAt();
    return;
  }
  int v23 = v8;
  if (!*(unsigned char *)(v9 + 312)) {
    goto LABEL_32;
  }
  CFIndex v12 = Count;
  if (!*(unsigned char *)(v9 + 313) || Count < 1) {
    goto LABEL_32;
  }
  CFIndex v14 = 0;
  uint64_t v15 = MEMORY[0x1E4F1F9F8];
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v9 + 184), v14);
    uint64_t v17 = (*(uint64_t (**)(uint64_t, const void *, const void *))(v9 + 80))(v7, v10, ValueAtIndex);
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    fpic_EventDateTimeMoment(v17, (uint64_t)&v30);
    memset(&type, 0, sizeof(type));
    if ((_BYTE)v32)
    {
      *(_OWORD *)&type.value = v30;
      CMTimeEpoch v18 = v31;
LABEL_18:
      type.epoch = v18;
      goto LABEL_21;
    }
    if (!BYTE1(v32))
    {
      *(_OWORD *)&type.value = *(_OWORD *)v15;
      CMTimeEpoch v18 = *(void *)(v15 + 16);
      goto LABEL_18;
    }
    long long v19 = *(_OWORD *)(v9 + 296);
    *(_OWORD *)time = *(_OWORD *)(v9 + 280);
    *(_OWORD *)&time[16] = v19;
    uint64_t v29 = *(void *)(v9 + 312);
    FigCreateTimeWithDateAndMoment((uint64_t)time, (uint64_t)&type, *((double *)&v31 + 1));
LABEL_21:
    unsigned int v20 = FigPlayerInterstitialEventCueOnce(v17);
    v21 = FigPlayerInterstitialEventCopyIdentifier(v17);
    if (!v20 || (*(_DWORD *)time = 0, FigCFDictionaryGetInt32IfPresent(), *(int *)time <= 0))
    {
      *(_OWORD *)time = v24;
      *(void *)&time[16] = v25;
      CMTime v27 = type;
      if (fpic_TimesAreClose((CMTime *)time, &v27)) {
        break;
      }
    }
    if (v21) {
      CFRelease(v21);
    }
    if (v12 == ++v14) {
      goto LABEL_32;
    }
  }
  if (dword_1E9351550)
  {
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 1040) = v23;
  fpic_flipInterstitialAndPrimaryVisibility(v7, 1, (uint64_t)v10, NAN);
LABEL_32:
  CFRelease(v10);
}

@end