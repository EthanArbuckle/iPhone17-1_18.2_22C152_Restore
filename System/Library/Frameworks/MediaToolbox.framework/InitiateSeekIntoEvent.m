@interface InitiateSeekIntoEvent
@end

@implementation InitiateSeekIntoEvent

void __fpic_InitiateSeekIntoEvent_block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = fpic_UnwrapEvent(*(void *)(a1 + 56), *(void *)(a1 + 64));
  v3 = FigPlayerInterstitialEventCopyIdentifier(v2);
  CMBaseObjectGetDerivedStorage();
  uint64_t FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
  CMBaseObjectGetDerivedStorage();
  CFIndex v5 = FigCFArrayGetFirstIndexOfValue();
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v69 = 0;
  fpic_GetEventStartMoment(v2, (uint64_t)&v67);
  if ((_BYTE)v69)
  {
    if (BYTE1(v69)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v20 = BYTE1(v69);
  if (BYTE1(v69))
  {
    long long v21 = *(_OWORD *)(DerivedStorage + 296);
    *(_OWORD *)lhs = *(_OWORD *)(DerivedStorage + 280);
    *(_OWORD *)&lhs[16] = v21;
    uint64_t v73 = *(void *)(DerivedStorage + 312);
    FigCreateTimeWithDateAndMoment((uint64_t)lhs, (uint64_t)rhs, *((double *)&v68 + 1));
  }
  else
  {
    *(_OWORD *)rhs = *MEMORY[0x1E4F1F9F8];
    *(void *)&rhs[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  long long v67 = *(_OWORD *)rhs;
  *(void *)&long long v68 = *(void *)&rhs[16];
  LOBYTE(v69) = 1;
  if (!v20)
  {
LABEL_3:
    *(_OWORD *)rhs = v67;
    *(void *)&rhs[16] = v68;
    long long v7 = *(_OWORD *)(DerivedStorage + 296);
    *(_OWORD *)lhs = *(_OWORD *)(DerivedStorage + 280);
    *(_OWORD *)&lhs[16] = v7;
    uint64_t v73 = *(void *)(DerivedStorage + 312);
    fpic_MakeMomentFromTime((uint64_t)rhs, (uint64_t)lhs, (uint64_t)&v67);
  }
LABEL_4:
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v9 = v68;
  *(_OWORD *)(v8 + 32) = v67;
  *(_OWORD *)(v8 + 48) = v9;
  *(void *)(v8 + 64) = v69;
  if (v5 != -1)
  {
    CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
    BOOL isEventInSameGroupAsAnotherEvent = fpic_isEventInSameGroupAsAnotherEvent(*(void *)(a1 + 56), *(void *)(a1 + 64), (uint64_t)CurrentlyPlayingEvent);
    memset(&v66, 0, sizeof(v66));
    uint64_t v11 = *(void *)(a1 + 72);
    *(_OWORD *)lhs = *(_OWORD *)(v11 + 408);
    *(void *)&lhs[16] = *(void *)(v11 + 424);
    *(_OWORD *)rhs = *(_OWORD *)(v11 + 456);
    *(void *)&rhs[16] = *(void *)(v11 + 472);
    CMTimeAdd(&v66, (CMTime *)lhs, (CMTime *)rhs);
    fpic_FinishInitiatedSeek(*(const void **)(a1 + 56), 1);
    *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728) = 0;
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 104);
    *(_OWORD *)(v12 + 744) = *(_OWORD *)(a1 + 88);
    *(void *)(v12 + 760) = v13;
    *(void *)(*(void *)(a1 + 72) + 736) = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 72) + 184), v5);
    uint64_t v14 = *(void *)(a1 + 72);
    long long v15 = *(_OWORD *)(a1 + 112);
    *(void *)(v14 + 824) = *(void *)(a1 + 128);
    *(_OWORD *)(v14 + 808) = v15;
    uint64_t v16 = *(void *)(a1 + 72);
    long long v17 = *(_OWORD *)(a1 + 136);
    *(void *)(v16 + 848) = *(void *)(a1 + 152);
    *(_OWORD *)(v16 + 832) = v17;
    uint64_t v18 = *(void *)(a1 + 72);
    *(_DWORD *)(v18 + 856) = *(_DWORD *)(a1 + 160);
    *(unsigned char *)(v18 + 860) = 1;
    if (dword_1E9351550)
    {
      LODWORD(v62.value) = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v18 = *(void *)(a1 + 72);
    }
    v23 = (_OWORD *)(a1 + 88);
    v24 = *(const void **)(v18 + 736);
    if (CurrentlyPlayingEvent != v24)
    {
      if (!CurrentlyPlayingEvent)
      {
        int v26 = 0;
        BOOL v25 = 0;
        int v27 = 0;
        if (FirstIndexOfValue != -1) {
          goto LABEL_31;
        }
        goto LABEL_38;
      }
      BOOL v25 = 0;
      goto LABEL_14;
    }
    memset(lhs, 0, 24);
    fpic_GetCurrentlyPlayingEventPlayoutDuration(*(void *)(a1 + 56), 0, *(void *)(a1 + 80), (CMTime *)lhs);
    FigPlayerInterstitialEventGetFirstItemStartOffset(v2, (uint64_t)&v64);
    *(_OWORD *)rhs = *(_OWORD *)lhs;
    *(void *)&rhs[16] = *(void *)&lhs[16];
    CMTimeAdd((CMTime *)lhs, (CMTime *)rhs, &v64);
    *(_OWORD *)rhs = *v23;
    *(void *)&rhs[16] = *(void *)(a1 + 104);
    CMTime v62 = *(CMTime *)lhs;
    CMTimeSubtract(&time1, (CMTime *)rhs, &v62);
    *(_OWORD *)rhs = *MEMORY[0x1E4F1FA48];
    *(void *)&rhs[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    BOOL v25 = CMTimeCompare(&time1, (CMTime *)rhs) >= 0;
    if (CurrentlyPlayingEvent)
    {
      *(_OWORD *)lhs = *v23;
      *(void *)&lhs[16] = *(void *)(a1 + 104);
      *(CMTime *)rhs = v66;
      if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 0)
      {
LABEL_14:
        fpic_StopInterstitialPlayerAtCurrentItem(*(void *)(a1 + 56), *(void *)(a1 + 80));
        if (FirstIndexOfValue != -1)
        {
          int v26 = 1;
          int v27 = 1;
          if (CurrentlyPlayingEvent != v24) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        int v27 = 1;
LABEL_38:
        CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFArrayRef *)(*(void *)(a1 + 72) + 600));
        if (dword_1E9351550)
        {
          LODWORD(v62.value) = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int value = v62.value;
          if (os_log_type_enabled(v33, type)) {
            unsigned int v35 = value;
          }
          else {
            unsigned int v35 = value & 0xFFFFFFFE;
          }
          if (v35)
          {
            uint64_t v36 = *(void *)(a1 + 56);
            *(_DWORD *)rhs = 136315394;
            *(void *)&rhs[4] = "fpic_InitiateSeekIntoEvent_block_invoke";
            *(_WORD *)&rhs[12] = 2048;
            *(void *)&rhs[14] = v36;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_removeAllCurrentEvents(*(const void **)(a1 + 56), *(__CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v27);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          goto LABEL_76;
        }
        uint64_t v41 = *(void *)(a1 + 72);
        uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 8);
        long long v43 = *(_OWORD *)(v41 + 216);
        *(_OWORD *)lhs = *(_OWORD *)(v41 + 200);
        *(_OWORD *)&lhs[16] = v43;
        uint64_t v73 = *(void *)(v41 + 232);
        long long v44 = *(_OWORD *)(v42 + 48);
        *(_OWORD *)rhs = *(_OWORD *)(v42 + 32);
        *(_OWORD *)&rhs[16] = v44;
        uint64_t v71 = *(void *)(v42 + 64);
        BOOL v45 = fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs);
        v46 = *(const void **)(a1 + 56);
        if (v45)
        {
          CFIndex v47 = 0;
          if (!Copy) {
            goto LABEL_56;
          }
LABEL_55:
          for (CFIndex i = CFArrayGetCount(Copy); v47 < i; CFIndex i = 0)
          {
            ValueAtIndex = (const void *)FigCFArrayGetValueAtIndex();
            fpic_ForgetPastEvent((uint64_t)v46, ValueAtIndex);
            ++v47;
            if (Copy) {
              goto LABEL_55;
            }
LABEL_56:
            ;
          }
          v46 = *(const void **)(a1 + 56);
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fpic_RemoveEventsAtSameMomentUpToIntendedEventToSeekInto(v46, v27, (CFTypeRef *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 24));
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
LABEL_76:
          if (!v3) {
            goto LABEL_78;
          }
          goto LABEL_77;
        }
        fpic_AllowIntendedEventToSeekIntoToBeBeRescheduled(*(void *)(a1 + 56));
        goto LABEL_69;
      }
      int v27 = 0;
      if (FirstIndexOfValue == -1) {
        goto LABEL_38;
      }
      int v26 = 1;
    }
    else
    {
      int v26 = 0;
      int v27 = 0;
      if (FirstIndexOfValue == -1) {
        goto LABEL_38;
      }
    }
LABEL_30:
    *(_OWORD *)lhs = *v23;
    *(void *)&lhs[16] = *(void *)(a1 + 104);
    *(CMTime *)rhs = v66;
    if ((CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) & 0x80000000) == 0)
    {
LABEL_31:
      if (FirstIndexOfValue < 1)
      {
        CFArrayRef Copy = 0;
        goto LABEL_70;
      }
      if (dword_1E9351550)
      {
        LODWORD(v62.value) = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v30 = v62.value;
        if (os_log_type_enabled(v29, type)) {
          unsigned int v31 = v30;
        }
        else {
          unsigned int v31 = v30 & 0xFFFFFFFE;
        }
        if (v31)
        {
          uint64_t v32 = *(void *)(a1 + 56);
          *(_DWORD *)rhs = 136315394;
          *(void *)&rhs[4] = "fpic_InitiateSeekIntoEvent_block_invoke";
          *(_WORD *)&rhs[12] = 2048;
          *(void *)&rhs[14] = v32;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = fpic_RemoveEventsAtSameMomentUpToIntendedEventToSeekInto(*(const void **)(a1 + 56), v27, (CFTypeRef *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 24));
      if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        CFArrayRef Copy = 0;
        BOOL v25 = v26;
        goto LABEL_70;
      }
LABEL_81:
      CFArrayRef Copy = 0;
      if (!v3) {
        goto LABEL_78;
      }
LABEL_77:
      CFRelease(v3);
      goto LABEL_78;
    }
    if (dword_1E9351550)
    {
      LODWORD(v62.value) = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v38 = v62.value;
      if (os_log_type_enabled(v37, type)) {
        unsigned int v39 = v38;
      }
      else {
        unsigned int v39 = v38 & 0xFFFFFFFE;
      }
      if (v39)
      {
        uint64_t v40 = *(void *)(a1 + 56);
        *(_DWORD *)rhs = 136315394;
        *(void *)&rhs[4] = "fpic_InitiateSeekIntoEvent_block_invoke";
        *(_WORD *)&rhs[12] = 2048;
        *(void *)&rhs[14] = v40;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    fpic_removeAllCurrentEvents(*(const void **)(a1 + 56), *(__CFArray **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v27);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      goto LABEL_81;
    }
    fpic_AllowIntendedEventToSeekIntoToBeBeRescheduled(*(void *)(a1 + 56));
    CFArrayRef Copy = 0;
LABEL_69:
    *(unsigned char *)(*(void *)(a1 + 72) + 861) = 1;
LABEL_70:
    uint64_t v50 = *(void *)(a1 + 72);
    uint64_t v51 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v52 = *(_OWORD *)(v50 + 216);
    *(_OWORD *)lhs = *(_OWORD *)(v50 + 200);
    *(_OWORD *)&lhs[16] = v52;
    uint64_t v73 = *(void *)(v50 + 232);
    long long v53 = *(_OWORD *)(v51 + 48);
    *(_OWORD *)rhs = *(_OWORD *)(v51 + 32);
    *(_OWORD *)&rhs[16] = v53;
    uint64_t v71 = *(void *)(v51 + 64);
    if (!fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)rhs)
      || (fpic_CurrentItemMoment(*(void *)(*(void *)(a1 + 72) + 152), (uint64_t)v61),
          uint64_t v54 = *(void *)(*(void *)(a1 + 32) + 8),
          long long v55 = *(_OWORD *)(v54 + 48),
          *(_OWORD *)lhs = *(_OWORD *)(v54 + 32),
          *(_OWORD *)&lhs[16] = v55,
          uint64_t v73 = *(void *)(v54 + 64),
          !fpic_MomentsAreClose((uint64_t)v61, (uint64_t)lhs) && !isEventInSameGroupAsAnotherEvent))
    {
      uint64_t v56 = *(void *)(a1 + 72);
      uint64_t v57 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v58 = *(_OWORD *)(v57 + 32);
      long long v59 = *(_OWORD *)(v57 + 48);
      *(void *)(v56 + 800) = *(void *)(v57 + 64);
      *(_OWORD *)(v56 + 768) = v58;
      *(_OWORD *)(v56 + 784) = v59;
    }
    if (!v25) {
      fpic_GatePrimaryBufferingAtCurrentEvent(*(void *)(a1 + 56), 0);
    }
    fpic_GatePrimaryPlaybackAtCurrentEvent(*(void *)(a1 + 56), *(void *)(a1 + 80));
    *(_DWORD *)(*(void *)(a1 + 72) + 724) = *(_DWORD *)(a1 + 164);
    goto LABEL_76;
  }
  if (dword_1E9351550)
  {
    LODWORD(v66.value) = 0;
    LOBYTE(v62.value) = 0;
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFArrayRef Copy = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = FigSignalErrorAt();
  if (v3) {
    goto LABEL_77;
  }
LABEL_78:
  if (Copy) {
    CFRelease(Copy);
  }
}

void __fpic_InitiateSeekIntoEvent_block_invoke_139(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
  {
    uint64_t v2 = fpic_UnwrapEvent(a1[5], a1[6]);
    uint64_t v3 = a1[7];
    if (*(unsigned char *)(v3 + 860)) {
      goto LABEL_12;
    }
    uint64_t v6 = *(void *)(a1[4] + 8);
    long long v7 = *(_OWORD *)(v6 + 48);
    v9[0] = *(_OWORD *)(v6 + 32);
    v9[1] = v7;
    uint64_t v10 = *(void *)(v6 + 64);
    long long v8 = *(_OWORD *)(v3 + 216);
    v11[0] = *(_OWORD *)(v3 + 200);
    v11[1] = v8;
    uint64_t v12 = *(void *)(v3 + 232);
    if (!fpic_MomentsAreClose((uint64_t)v9, (uint64_t)v11))
    {
LABEL_12:
      if (fpic_isEventResolvableOnPrimaryTimeline(a1[5], a1[6]))
      {
        v4 = FigPlayerInterstitialEventCopyIdentifier(v2);
        if (dword_1E9351550)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_ForceCancelInitiatedSeek((const void *)a1[5]);
        if (v4) {
          CFRelease(v4);
        }
      }
    }
  }
}

@end