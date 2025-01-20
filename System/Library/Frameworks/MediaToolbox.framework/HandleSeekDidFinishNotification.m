@interface HandleSeekDidFinishNotification
@end

@implementation HandleSeekDidFinishNotification

void __fpic_HandleSeekDidFinishNotification_block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(_DWORD *)(v3 + 716))
  {
    if ((*(_DWORD *)(a1 + 80) & 0x1D) == 1)
    {
      CMTime lhs = *(CMTime *)(a1 + 68);
      long long v4 = *(_OWORD *)(v3 + 296);
      *(_OWORD *)v31 = *(_OWORD *)(v3 + 280);
      *(_OWORD *)&v31[16] = v4;
      uint64_t v32 = *(void *)(v3 + 312);
      fpic_MakeMomentFromTime((uint64_t)&lhs, (uint64_t)v31, (uint64_t)time1);
      long long v5 = *(_OWORD *)&time1[16];
      *(_OWORD *)(v3 + 280) = *(_OWORD *)time1;
      *(_OWORD *)(v3 + 296) = v5;
      *(void *)(v3 + 312) = v30;
      uint64_t v3 = *(void *)(a1 + 40);
    }
    uint64_t v6 = *(void *)(v3 + 152);
    if (v6)
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v9 = *(void (**)(uint64_t, uint64_t))(v8 + 32);
      if (v9) {
        v9(v6, v3 + 504);
      }
      fpic_updateCurrentResumptionTimeIfPlayingPostroll();
      fpic_EnsureCurrentEventsHaveResolvedProperties(*(const void **)(a1 + 48));
      uint64_t v3 = *(void *)(a1 + 40);
    }
    *(_DWORD *)(v3 + 716) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    fpic_clearIntendedCurrentItemMoment();
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    uint64_t LastCurrentItem = fpic_GetLastCurrentItem(v10, v11);
    if (LastCurrentItem)
    {
      uint64_t v14 = LastCurrentItem;
      memset(v31, 0, 24);
      fpic_GetItemEndTime(LastCurrentItem, (uint64_t)time1);
      CMTimeValue v34 = *(void *)time1;
      unsigned int v15 = *(_DWORD *)&time1[12];
      CMTimeScale v35 = *(_DWORD *)&time1[8];
      if (time1[12])
      {
        uint64_t v16 = *(void *)&time1[16];
        lhs.unsigned int value = v34;
        lhs.timescale = v35;
        lhs.flags = *(_DWORD *)&time1[12];
        lhs.epoch = *(void *)&time1[16];
        CMTime rhs = *(CMTime *)gAudioTransitionScheduleAdvance;
        CMTimeSubtract((CMTime *)time1, &lhs, &rhs);
        rhs.unsigned int value = *(void *)time1;
        unsigned int v17 = *(_DWORD *)&time1[12];
        rhs.timescale = *(_DWORD *)&time1[8];
        unint64_t v18 = *(void *)&time1[16];
        uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v19) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        v21 = *(void (**)(uint64_t, unsigned char *))(v20 + 32);
        if (v21) {
          v21(v14, v31);
        }
        *(void *)time1 = rhs.value;
        *(void *)&time1[8] = __PAIR64__(v17, rhs.timescale);
        *(void *)&time1[16] = v18;
        CMTime lhs = *(CMTime *)v31;
        if (CMTimeCompare((CMTime *)time1, &lhs) < 1)
        {
          *(void *)time1 = v34;
          *(void *)&time1[8] = __PAIR64__(v15, v35);
          *(void *)&time1[16] = v16;
          fpic_scheduleInterstitialAudioTransition(v10, (long long *)time1, 0);
        }
        else
        {
          v22 = (dispatch_object_t *)(DerivedStorage + 664);
          StopAndReleaseTimer(v22);
          *(void *)time1 = rhs.value;
          *(void *)&time1[8] = __PAIR64__(v17, rhs.timescale);
          *(_OWORD *)&time1[16] = v18;
          uint64_t v30 = v17 & 1;
          fpic_CreateAndPrimeItemTimer(v10, v14, (uint64_t)time1, (void (__cdecl *)(void *))fpic_SchedulePrimaryTransitionTimerProc, v22);
        }
      }
    }
    int v2 = *(_DWORD *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (v2 == *(_DWORD *)(v3 + 1040))
  {
    fpic_recordSeekIDAndShowInterstitialLayer(*(void *)(a1 + 48), *(void *)(a1 + 56), -1, *(unsigned char *)(a1 + 92) == 0, *(unsigned __int8 *)(a1 + 92));
    int v2 = *(_DWORD *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (v2 == *(_DWORD *)(v3 + 724))
  {
    fpic_FinishInitiatedSeek(*(const void **)(a1 + 48), *(unsigned __int8 *)(a1 + 92));
    int v2 = *(_DWORD *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (v2 == *(_DWORD *)(v3 + 728))
  {
    if (dword_1E9351550)
    {
      LODWORD(lhs.value) = 0;
      LOBYTE(rhs.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int value = lhs.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, rhs.value)) {
        unsigned int v25 = value;
      }
      else {
        unsigned int v25 = value & 0xFFFFFFFE;
      }
      if (v25)
      {
        uint64_t v26 = *(void *)(a1 + 48);
        int v27 = *(_DWORD *)(*(void *)(a1 + 40) + 728);
        *(_DWORD *)v31 = 136315650;
        *(void *)&v31[4] = "fpic_HandleSeekDidFinishNotification_block_invoke";
        *(_WORD *)&v31[12] = 2048;
        *(void *)&v31[14] = v26;
        *(_WORD *)&v31[22] = 1024;
        *(_DWORD *)&v31[24] = v27;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728) = 0;
  }
}

@end