@interface EstablishCurrentEventForCurrentItem
@end

@implementation EstablishCurrentEventForCurrentItem

void __fpic_EstablishCurrentEventForCurrentItem_block_invoke(void *a1)
{
  v1 = a1;
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  v2 = (const void *)a1[5];
  uint64_t v3 = a1[6];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = DerivedStorage;
  uint64_t v6 = *(void *)(DerivedStorage + 152);
  v190 = v1;
  if (v6 && !*(unsigned char *)(DerivedStorage + 975))
  {
    *(_OWORD *)time = *MEMORY[0x1E4F1FA48];
    *(void *)&time[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = *(void (**)(uint64_t, unsigned char *))(v8 + 32);
    if (v9) {
      v9(v6, time);
    }
    uint64_t v10 = CMBaseObjectGetDerivedStorage();
    if (*(unsigned char *)(v10 + 974) && !*(unsigned char *)(v10 + 973))
    {
      *(unsigned char *)(v5 + 975) = 1;
    }
    else
    {
      uint64_t v11 = *(void *)(v5 + 152);
      *(_OWORD *)lhs = *(_OWORD *)time;
      *(void *)&lhs[16] = *(void *)&time[16];
      *(_OWORD *)rhs = kMomentsAreCloseThreshold;
      *(void *)&rhs[16] = 0;
      CMTimeAdd((CMTime *)v202, (CMTime *)lhs, (CMTime *)rhs);
      BOOL v12 = fpic_BufferIncludesTime(v11, (CMTime *)v202, MEMORY[0x1E4F1FA48]);
      *(unsigned char *)(v5 + 975) = v12;
      if (!v12) {
        goto LABEL_29;
      }
    }
    uint64_t v13 = CMBaseObjectGetDerivedStorage();
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v13 + 184));
    if (*(unsigned char *)(v13 + 975))
    {
      uint64_t v15 = Count;
      if ((*(unsigned char *)(v13 + 564) & 1) == 0)
      {
        uint64_t v16 = *(void *)(v13 + 152);
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v18 = v17 ? v17 : 0;
        v19 = *(void (**)(uint64_t, uint64_t))(v18 + 32);
        if (v19) {
          v19(v16, v13 + 552);
        }
      }
      if (v15 >= 1)
      {
        CFIndex v20 = 0;
        int v21 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v13 + 184), v20);
          uint64_t v23 = (*(uint64_t (**)(const void *, uint64_t, const void *))(v13 + 80))(v2, v3, ValueAtIndex);
          if (FigPlayerInterstitialEventIsPreRoll(v23))
          {
            *(_OWORD *)lhs = *(_OWORD *)(v13 + 552);
            *(void *)&lhs[16] = *(void *)(v13 + 568);
            FigPlayerInterstitialEventSetStartTime(v23, (uint64_t)lhs);
            int v21 = 1;
            fpic_EnsureEventHasResolvedProperties(v2, v3, ValueAtIndex, 1);
          }
          ++v20;
        }
        while (v15 != v20);
        if (v21 && dword_1E9351550)
        {
          LODWORD(v198) = 0;
          LOBYTE(v217.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v217.value);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
    fpic_PostNotification(v5, @"fpiResolvePropertiesChange", v2, 0);
    v1 = v190;
  }
LABEL_29:
  if (!*(unsigned char *)(v5 + 975)) {
    return;
  }
  uint64_t v200 = 0;
  long long v198 = 0u;
  long long v199 = 0u;
  fpic_GetEffectiveCurrentItemMoment(*(void *)(v1[7] + 152), (uint64_t)&v198);
  __int16 v195 = 0;
  int v194 = 0;
  long long v191 = *MEMORY[0x1E4F1F9F8];
  long long v196 = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v189 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  CMTimeEpoch v197 = v189;
  v217.unsigned int value = v198;
  unsigned int v25 = HIDWORD(v198);
  v217.timescale = DWORD2(v198);
  double v27 = *((double *)&v199 + 1);
  CMTimeEpoch v26 = v199;
  int v28 = v200;
  LODWORD(v206.value) = *(_DWORD *)((char *)&v200 + 2);
  WORD2(v206.value) = HIWORD(v200);
  v29 = v1 + 8;
  v216.unsigned int value = v1[8];
  unsigned int v30 = *((_DWORD *)v1 + 19);
  v216.timescale = *((_DWORD *)v1 + 18);
  int v31 = BYTE1(v200);
  if (v30)
  {
    v32 = v190;
    if (!(_BYTE)v200) {
      goto LABEL_34;
    }
    CMTimeEpoch v33 = v29[2];
    *(_OWORD *)lhs = v198;
    *(void *)&lhs[16] = v199;
    *(void *)rhs = *v29;
    *(_DWORD *)&rhs[8] = *((_DWORD *)v29 + 2);
    *(_DWORD *)&rhs[12] = v30;
    *(void *)&rhs[16] = v33;
    if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 1) {
      goto LABEL_34;
    }
    *(void *)rhs = v217.value;
    *(_DWORD *)&rhs[8] = v217.timescale;
    *(_DWORD *)&rhs[12] = v25;
    *(void *)&rhs[16] = v26;
    *(void *)time = v216.value;
    *(void *)&time[8] = __PAIR64__(v30, v216.timescale);
    *(void *)&time[16] = v33;
    CMTimeSubtract((CMTime *)lhs, (CMTime *)rhs, (CMTime *)time);
    *(_OWORD *)rhs = kMaxNotificationDelay;
    *(void *)&rhs[16] = 0;
    if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 0)
    {
      memset(rhs, 0, 24);
      *(void *)time = v217.value;
      *(void *)&time[8] = __PAIR64__(v25, v217.timescale);
      *(void *)&time[16] = v26;
      *(void *)v202 = v216.value;
      *(void *)&v202[8] = __PAIR64__(v30, v216.timescale);
      *(void *)&v202[16] = v33;
      CMTimeSubtract((CMTime *)rhs, (CMTime *)time, (CMTime *)v202);
      v217.unsigned int value = v216.value;
      v217.timescale = v216.timescale;
      if (v31)
      {
        *(_OWORD *)time = *(_OWORD *)rhs;
        *(void *)&time[16] = *(void *)&rhs[16];
        double v27 = v27 - CMTimeGetSeconds((CMTime *)time);
      }
    }
    else
    {
LABEL_34:
      unsigned int v30 = v25;
      CMTimeEpoch v33 = v26;
    }
  }
  else
  {
    unsigned int v30 = HIDWORD(v198);
    CMTimeEpoch v33 = v199;
    v32 = v190;
  }
  *(void *)&long long v198 = v217.value;
  *(_DWORD *)((char *)&v200 + 2) = v206.value;
  HIWORD(v200) = WORD2(v206.value);
  *((void *)&v198 + 1) = __PAIR64__(v30, v217.timescale);
  *(void *)&long long v199 = v33;
  *((double *)&v199 + 1) = v27;
  LOBYTE(v200) = v28;
  BYTE1(v200) = v31;
  *(_OWORD *)&v206.unsigned int value = v198;
  v206.CMTimeEpoch epoch = v33;
  int v192 = *(_DWORD *)((char *)&v200 + 2);
  __int16 v193 = HIWORD(v200);
  uint64_t v34 = CMBaseObjectGetDerivedStorage();
  uint64_t v205 = 0;
  memset(time, 0, sizeof(time));
  if ((*(unsigned char *)(v34 + 908) & 1) == 0 || *(unsigned char *)(v34 + 920)) {
    goto LABEL_57;
  }
  v35 = (CMTime *)(v34 + 896);
  uint64_t v36 = CMBaseObjectGetDerivedStorage();
  uint64_t v37 = v36 + 240;
  if (!*(unsigned char *)(v36 + 272) && !*(unsigned char *)(v36 + 273)) {
    uint64_t v37 = v36 + 200;
  }
  CMTime v217 = *(CMTime *)v37;
  double v38 = *(double *)(v37 + 24);
  int v39 = *(unsigned __int8 *)(v37 + 32);
  int v40 = *(unsigned __int8 *)(v37 + 33);
  *(_DWORD *)((char *)&v203 + 2) = *(_DWORD *)(v37 + 34);
  HIWORD(v203) = *(_WORD *)(v37 + 38);
  CMTime v216 = *v35;
  *(CMTime *)rhs = v206;
  *(double *)&rhs[24] = v27;
  v209[0] = v28;
  v209[1] = v31;
  *(_DWORD *)&v209[2] = v192;
  *(_WORD *)&v209[6] = v193;
  fpic_MakeMomentFromTime((uint64_t)&v216, (uint64_t)rhs, (uint64_t)lhs);
  CMTime v216 = *(CMTime *)lhs;
  double v41 = *(double *)&lhs[24];
  int v42 = v215;
  int v43 = BYTE1(v215);
  *(_DWORD *)v207 = *(_DWORD *)((char *)&v215 + 2);
  *(_WORD *)&v207[4] = HIWORD(v215);
  fpic_AddTimeToMoment((uint64_t)lhs, (CMTime *)&kJumpForwardTolerance, (uint64_t)time);
  *(CMTime *)lhs = v216;
  *(double *)&lhs[24] = v41;
  LOBYTE(v215) = v42;
  BYTE1(v215) = v43;
  *(_DWORD *)((char *)&v215 + 2) = *(_DWORD *)v207;
  HIWORD(v215) = *(_WORD *)&v207[4];
  *(CMTime *)v202 = v217;
  *(double *)&v202[24] = v38;
  LOBYTE(v203) = v39;
  BYTE1(v203) = v40;
  if (!fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)v202))
  {
    double v38 = v41;
    int v40 = v43;
    v32 = v190;
    if (v28) {
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  v32 = v190;
  if (v39)
  {
    *(_OWORD *)rhs = *(_OWORD *)&v217.value;
    CMTimeEpoch epoch = v217.epoch;
LABEL_46:
    *(void *)&rhs[16] = epoch;
    goto LABEL_51;
  }
  if (!v40)
  {
    *(_OWORD *)rhs = v191;
    CMTimeEpoch epoch = v189;
    goto LABEL_46;
  }
  *(CMTime *)lhs = v216;
  *(double *)&lhs[24] = v41;
  LOBYTE(v215) = v42;
  BYTE1(v215) = v43;
  *(_DWORD *)((char *)&v215 + 2) = *(_DWORD *)v207;
  HIWORD(v215) = *(_WORD *)&v207[4];
  FigCreateTimeWithDateAndMoment((uint64_t)lhs, (uint64_t)rhs, v38);
LABEL_51:
  CMTime v216 = *(CMTime *)rhs;
  if (v28)
  {
LABEL_52:
    if (v42) {
      goto LABEL_55;
    }
  }
LABEL_53:
  if (!v31 || !v40) {
    goto LABEL_57;
  }
LABEL_55:
  *(CMTime *)lhs = v206;
  *(double *)&lhs[24] = v27;
  LOBYTE(v215) = v28;
  BYTE1(v215) = v31;
  *(_DWORD *)((char *)&v215 + 2) = v192;
  HIWORD(v215) = v193;
  *(CMTime *)rhs = v216;
  *(double *)&rhs[24] = v38;
  v209[0] = v42;
  v209[1] = v40;
  *(_DWORD *)&v209[2] = *(_DWORD *)v207;
  *(_WORD *)&v209[6] = *(_WORD *)&v207[4];
  if (!fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs)) {
    goto LABEL_57;
  }
  *(CMTime *)lhs = v206;
  *(double *)&lhs[24] = v27;
  LOBYTE(v215) = v28;
  BYTE1(v215) = v31;
  *(_DWORD *)((char *)&v215 + 2) = v192;
  HIWORD(v215) = v193;
  *(_OWORD *)rhs = *(_OWORD *)time;
  *(_OWORD *)&rhs[16] = *(_OWORD *)&time[16];
  *(void *)v209 = v205;
  if (fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs))
  {
LABEL_57:
    LOBYTE(v40) = v31;
    LOBYTE(v42) = v28;
    double v38 = v27;
    goto LABEL_58;
  }
  if (dword_1E9351550 >= 3)
  {
    *(_DWORD *)v202 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v57 = *(_DWORD *)v202;
    if (os_log_type_enabled(v56, type)) {
      unsigned int v58 = v57;
    }
    else {
      unsigned int v58 = v57 & 0xFFFFFFFE;
    }
    if (v58)
    {
      *(CMTime *)lhs = v206;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)lhs);
      *(CMTime *)lhs = v216;
      Float64 v60 = CMTimeGetSeconds((CMTime *)lhs);
      *(_DWORD *)rhs = 136316162;
      *(void *)&rhs[4] = "fpic_ClampItemMomentToGateMoment";
      *(_WORD *)&rhs[12] = 2048;
      *(Float64 *)&rhs[14] = Seconds;
      *(_WORD *)&rhs[22] = 2048;
      *(double *)&rhs[24] = v27;
      *(_WORD *)v209 = 2048;
      *(Float64 *)&v209[2] = v60;
      __int16 v210 = 2048;
      *(double *)v211 = v38;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMTime v206 = v216;
  int v192 = *(_DWORD *)v207;
  __int16 v193 = *(_WORD *)&v207[4];
LABEL_58:
  long long v198 = *(_OWORD *)&v206.value;
  *(void *)&long long v199 = v206.epoch;
  *(_DWORD *)((char *)&v200 + 2) = v192;
  HIWORD(v200) = v193;
  *((double *)&v199 + 1) = v38;
  LOBYTE(v200) = v42;
  BYTE1(v200) = v40;
  v45 = (const void *)v32[5];
  uint64_t v187 = v32[6];
  uint64_t v46 = *(void *)(v32[4] + 8);
  uint64_t v203 = v200;
  *(_OWORD *)v202 = *(_OWORD *)&v206.value;
  *(_OWORD *)&v202[16] = v199;
  uint64_t v47 = CMBaseObjectGetDerivedStorage();
  v48 = (_OWORD *)(v47 + 280);
  long long v49 = *(_OWORD *)(v47 + 296);
  *(_OWORD *)lhs = *(_OWORD *)(v47 + 280);
  *(_OWORD *)&lhs[16] = v49;
  uint64_t v215 = *(void *)(v47 + 312);
  *(_OWORD *)rhs = *(_OWORD *)v202;
  *(_OWORD *)&rhs[16] = *(_OWORD *)&v202[16];
  *(void *)v209 = v203;
  if (fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs) && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
  {
    memset(&v217, 0, sizeof(v217));
    long long v50 = *(_OWORD *)(v47 + 296);
    *(_OWORD *)lhs = *v48;
    *(_OWORD *)&lhs[16] = v50;
    uint64_t v215 = *(void *)(v47 + 312);
    *(_OWORD *)rhs = *(_OWORD *)v202;
    *(_OWORD *)&rhs[16] = *(_OWORD *)&v202[16];
    *(void *)v209 = v203;
    fpic_SubtractMomentFromMoment((uint64_t)lhs, (uint64_t)rhs, (uint64_t)&v217);
    *(CMTime *)lhs = v217;
    *(_OWORD *)rhs = kJumpForwardTolerance;
    *(void *)&rhs[16] = 0;
    if (CMTimeCompare((CMTime *)lhs, (CMTime *)rhs) < 1 || *(_DWORD *)(v47 + 716))
    {
      v32 = v190;
      if (dword_1E9351550)
      {
        *(_DWORD *)time = 0;
        LOBYTE(v216.value) = 0;
        v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v52 = *(_DWORD *)time;
        if (os_log_type_enabled(v51, v216.value)) {
          unsigned int v53 = v52;
        }
        else {
          unsigned int v53 = v52 & 0xFFFFFFFE;
        }
        if (v53)
        {
          *(_OWORD *)lhs = *(_OWORD *)v202;
          *(void *)&lhs[16] = *(void *)&v202[16];
          Float64 v54 = CMTimeGetSeconds((CMTime *)lhs);
          int v55 = *(_DWORD *)(v47 + 716);
          *(_DWORD *)rhs = 136315906;
          *(void *)&rhs[4] = "fpic_CheckTimeJumpedBackward";
          *(_WORD *)&rhs[12] = 2048;
          *(void *)&rhs[14] = v45;
          *(_WORD *)&rhs[22] = 2048;
          *(Float64 *)&rhs[24] = v54;
          *(_WORD *)v209 = 1024;
          *(_DWORD *)&v209[2] = v55;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      long long v80 = *(_OWORD *)&v202[16];
      _OWORD *v48 = *(_OWORD *)v202;
      *(_OWORD *)(v47 + 296) = v80;
      *(void *)(v47 + 312) = v203;
    }
    else
    {
      CFIndex v183 = CFArrayGetCount(*(CFArrayRef *)(v47 + 184));
      v32 = v190;
      if (v183 >= 1)
      {
        CFIndex v61 = 0;
        v179 = (CFTypeRef *)(v46 + 24);
        do
        {
          v62 = CFArrayGetValueAtIndex(*(CFArrayRef *)(v47 + 184), v61);
          uint64_t v63 = (*(uint64_t (**)(const void *, uint64_t, const void *))(v47 + 80))(v45, v187, v62);
          uint64_t v205 = 0;
          memset(time, 0, sizeof(time));
          fpic_EventDateTimeMoment(v63, (uint64_t)time);
          memset(&v216, 0, sizeof(v216));
          BOOL v64 = 1;
          fpic_PredictEventGroupDurationOnPrimary((uint64_t)v45, v62, v187, 1, 0, &v216);
          *(_OWORD *)lhs = *(_OWORD *)v202;
          *(_OWORD *)&lhs[16] = *(_OWORD *)&v202[16];
          uint64_t v215 = v203;
          *(_OWORD *)rhs = *(_OWORD *)time;
          *(_OWORD *)&rhs[16] = *(_OWORD *)&time[16];
          *(void *)v209 = v205;
          CMTime v206 = v216;
          if (!fpic_MomentCanBeCurrent((long long *)lhs, (long long *)rhs, (long long *)&v206.value)) {
            BOOL v64 = FigPlayerInterstitialEventIsPostRoll(v63) != 0;
          }
          int v65 = CFSetContainsValue(*(CFSetRef *)(v47 + 632), v62);
          CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
          v66 = FigPlayerInterstitialEventCopyIdentifier(v63);
          if (v64 && (v65 || v62 == CurrentlyPlayingEvent))
          {
            if (FigPlayerInterstitialEventCueOnce(v63))
            {
              *(_DWORD *)lhs = 0;
              FigCFDictionaryGetInt32IfPresent();
              BOOL v67 = *(_DWORD *)lhs > 0;
            }
            else
            {
              BOOL v67 = 0;
            }
            if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724)
              && fpic_isEventInSameGroupAsAnotherEvent((uint64_t)v45, (uint64_t)v62, *(void *)(v47 + 736)))
            {
              CMBaseObjectGetDerivedStorage();
              uint64_t FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
              CMBaseObjectGetDerivedStorage();
              uint64_t v68 = FigCFArrayGetFirstIndexOfValue();
              BOOL v69 = FirstIndexOfValue < v68;
              BOOL v70 = FirstIndexOfValue >= v68;
            }
            else
            {
              BOOL v69 = 0;
              BOOL v70 = 1;
            }
            if (dword_1E9351550)
            {
              BOOL v180 = v69;
              BOOL v182 = v70;
              LODWORD(v206.value) = 0;
              v207[0] = OS_LOG_TYPE_DEFAULT;
              v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int value = v206.value;
              if (os_log_type_enabled(v71, v207[0])) {
                unsigned int v73 = value;
              }
              else {
                unsigned int v73 = value & 0xFFFFFFFE;
              }
              if (v73)
              {
                *(_OWORD *)lhs = *v48;
                *(void *)&lhs[16] = *(void *)(v47 + 296);
                Float64 v74 = CMTimeGetSeconds((CMTime *)lhs);
                *(_OWORD *)lhs = *(_OWORD *)v202;
                *(void *)&lhs[16] = *(void *)&v202[16];
                double v75 = CMTimeGetSeconds((CMTime *)lhs);
                *(_DWORD *)rhs = 136316674;
                int v76 = v180;
                if (v67) {
                  int v76 = 1;
                }
                *(void *)&rhs[4] = "fpic_CheckTimeJumpedBackward";
                BOOL v77 = v76 == 0;
                v78 = "";
                if (!v77) {
                  v78 = " do not";
                }
                *(_WORD *)&rhs[12] = 2048;
                *(void *)&rhs[14] = v45;
                *(_WORD *)&rhs[22] = 2048;
                *(Float64 *)&rhs[24] = v74;
                *(_WORD *)v209 = 2048;
                *(double *)&v209[2] = v75;
                __int16 v210 = 1024;
                *(_DWORD *)v211 = v67;
                *(_WORD *)&v211[4] = 2080;
                *(void *)&v211[6] = v78;
                __int16 v212 = 2112;
                uint64_t v213 = v63;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              BOOL v70 = v182;
            }
            if (!v67 || v62 == CurrentlyPlayingEvent)
            {
              fpic_ResetCurrentEventList(v45, v187, v179);
              char v79 = !v70;
              if (v67) {
                char v79 = 1;
              }
              if ((v79 & 1) == 0) {
                fpic_ForgetPastEvent((uint64_t)v45, v62);
              }
            }
          }
          if (v66) {
            CFRelease(v66);
          }
          ++v61;
        }
        while (v183 != v61);
      }
      *(unsigned char *)(v47 + 977) = 0;
    }
  }
  v81 = (const void *)v32[5];
  uint64_t v82 = v32[6];
  uint64_t v83 = *(void *)(v32[4] + 8);
  *(_OWORD *)v202 = v198;
  *(_OWORD *)&v202[16] = v199;
  uint64_t v203 = v200;
  uint64_t v84 = CMBaseObjectGetDerivedStorage();
  if (!*(unsigned char *)(CMBaseObjectGetDerivedStorage() + 976))
  {
    uint64_t v85 = CMBaseObjectGetDerivedStorage();
    uint64_t v86 = v85 + 240;
    if (!*(unsigned char *)(v85 + 272) && !*(unsigned char *)(v85 + 273)) {
      uint64_t v86 = v85 + 200;
    }
    long long v87 = *(_OWORD *)(v86 + 16);
    *(_OWORD *)time = *(_OWORD *)v86;
    *(_OWORD *)&time[16] = v87;
    uint64_t v205 = *(void *)(v86 + 32);
    if (!*(unsigned char *)(v84 + 978) && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728) && !*(_DWORD *)(v84 + 716))
    {
      *(_OWORD *)lhs = *(_OWORD *)v202;
      *(_OWORD *)&lhs[16] = *(_OWORD *)&v202[16];
      uint64_t v215 = v203;
      *(_OWORD *)rhs = *(_OWORD *)time;
      *(_OWORD *)&rhs[16] = *(_OWORD *)&time[16];
      *(void *)v209 = v205;
      if (fpic_MomentGreaterThan((uint64_t)lhs, (uint64_t)rhs))
      {
        if (!*(unsigned char *)(v84 + 352) && !*(unsigned char *)(v84 + 353)
          || (*(_OWORD *)lhs = *(_OWORD *)v202,
              *(_OWORD *)&lhs[16] = *(_OWORD *)&v202[16],
              uint64_t v215 = v203,
              long long v171 = *(_OWORD *)(v84 + 336),
              *(_OWORD *)rhs = *(_OWORD *)(v84 + 320),
              *(_OWORD *)&rhs[16] = v171,
              *(void *)v209 = *(void *)(v84 + 352),
              !fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)rhs)))
        {
          v172 = (CFTypeRef *)(v83 + 24);
          fpic_ResetCurrentEventList(v81, v82, v172);
          *(_OWORD *)lhs = *(_OWORD *)v202;
          *(_OWORD *)&lhs[16] = *(_OWORD *)&v202[16];
          uint64_t v215 = v203;
          CFStringRef MomentDesc = fpic_CreateMomentDesc((uint64_t)lhs);
          *(_OWORD *)lhs = *(_OWORD *)time;
          *(_OWORD *)&lhs[16] = *(_OWORD *)&time[16];
          uint64_t v215 = v205;
          CFStringRef v174 = fpic_CreateMomentDesc((uint64_t)lhs);
          if (dword_1E9351550)
          {
            LODWORD(v217.value) = 0;
            LOBYTE(v216.value) = 0;
            v175 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v176 = v217.value;
            if (os_log_type_enabled(v175, v216.value)) {
              unsigned int v177 = v176;
            }
            else {
              unsigned int v177 = v176 & 0xFFFFFFFE;
            }
            if (v177)
            {
              CFArrayRef v178 = (const __CFArray *)*v172;
              if (*v172) {
                LODWORD(v178) = CFArrayGetCount(v178);
              }
              *(_DWORD *)rhs = 136316162;
              *(void *)&rhs[4] = "fpic_CheckTimeJumpedForward";
              *(_WORD *)&rhs[12] = 2048;
              *(void *)&rhs[14] = v81;
              *(_WORD *)&rhs[22] = 2112;
              *(void *)&rhs[24] = v174;
              *(_WORD *)v209 = 2112;
              *(void *)&v209[2] = MomentDesc;
              __int16 v210 = 1024;
              *(_DWORD *)v211 = v178;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (MomentDesc) {
            CFRelease(MomentDesc);
          }
          if (v174) {
            CFRelease(v174);
          }
        }
      }
    }
  }
  if (!*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
  {
    uint64_t v88 = v32[7];
    *(void *)(v88 + 312) = v200;
    long long v89 = v199;
    *(_OWORD *)(v88 + 280) = v198;
    *(_OWORD *)(v88 + 296) = v89;
  }
  uint64_t v90 = v32[5];
  uint64_t v91 = CMBaseObjectGetDerivedStorage();
  CMTimeEpoch v92 = v189;
  if (*(unsigned char *)(v91 + 860))
  {
    uint64_t v93 = v91;
    if (fpic_isEventResolvableOnPrimaryTimeline(v90, *(void *)(v91 + 736)))
    {
      if (*(unsigned char *)(v93 + 861))
      {
        uint64_t v94 = CMBaseObjectGetDerivedStorage();
        if (*(unsigned __int8 *)(v94 + 352) | *(unsigned __int8 *)(v94 + 353))
        {
          if (dword_1E9351550)
          {
            *(_DWORD *)time = 0;
            v202[0] = 0;
            v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v96 = *(_DWORD *)time;
            if (os_log_type_enabled(v95, (os_log_type_t)v202[0])) {
              unsigned int v97 = v96;
            }
            else {
              unsigned int v97 = v96 & 0xFFFFFFFE;
            }
            if (v97)
            {
              fpic_GetCurrentDepartureTime((__n128 *)&v206);
              Float64 v98 = CMTimeGetSeconds(&v206);
              *(_DWORD *)rhs = 136315650;
              *(void *)&rhs[4] = "fpic_establishIntendedEventToSeekInto";
              *(_WORD *)&rhs[12] = 2048;
              *(void *)&rhs[14] = v90;
              *(_WORD *)&rhs[22] = 2048;
              *(Float64 *)&rhs[24] = v98;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            CMTimeEpoch v92 = v189;
          }
          *(_WORD *)(v93 + 352) = 0;
          *(unsigned char *)(v93 + 861) = 0;
        }
      }
      uint64_t v99 = fpic_UnwrapEvent(v90, *(void *)(v93 + 736));
      v185 = FigPlayerInterstitialEventCopyIdentifier(v99);
      uint64_t v100 = CMBaseObjectGetDerivedStorage();
      *(void *)v207 = 0;
      *(_OWORD *)time = v191;
      *(void *)&time[16] = v92;
      *(_OWORD *)v202 = *MEMORY[0x1E4F1FA48];
      *(void *)&v202[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      if (*(void *)(v100 + 736))
      {
        uint64_t v101 = v100;
        uint64_t v102 = FigCFWeakReferenceHolderCopyReferencedObject();
        if (v102)
        {
          v103 = (const void *)v102;
          uint64_t v104 = fpic_UnwrapEvent(v90, *(void *)(v101 + 736));
          int v105 = fpic_copyEventsScheduledAtSameMomentAsEvent(v90, v104, (__CFArray **)v207);
          if (v105)
          {
            int v117 = v105;
          }
          else
          {
            uint64_t v188 = v99;
            for (CFIndex i = 0; ; ++i)
            {
              CFIndex v107 = *(void *)v207;
              if (*(void *)v207) {
                CFIndex v107 = CFArrayGetCount(*(CFArrayRef *)v207);
              }
              if (i >= v107) {
                break;
              }
              v108 = CFArrayGetValueAtIndex(*(CFArrayRef *)v207, i);
              uint64_t v109 = fpic_UnwrapEvent(v90, (uint64_t)v108);
              *(_OWORD *)lhs = v191;
              *(void *)&lhs[16] = v92;
              if (*(const void **)(v101 + 736) == v108) {
                break;
              }
              memset(rhs, 0, 24);
              FigPlayerInterstitialEventGetResumptionOffset(v109, (uint64_t)rhs);
              if (CFDictionaryContainsKey(*(CFDictionaryRef *)(v101 + 616), v108))
              {
                CFDictionaryRef v110 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(v101 + 616), v108);
                CMTimeMakeFromDictionary((CMTime *)lhs, v110);
              }
              else
              {
                fpic_GetEventDuration(v90, v108, (uint64_t)v103, &v217);
                *(CMTime *)lhs = v217;
              }
              if (rhs[12]) {
                v111 = (CMTime *)rhs;
              }
              else {
                v111 = (CMTime *)lhs;
              }
              CMTime v216 = *v111;
              CMTime v217 = *(CMTime *)lhs;
              fpic_AccumulateDuration((CMTime *)v202, &v217);
              fpic_AccumulateDuration((CMTime *)time, &v216);
            }
            *(_OWORD *)(v101 + 384) = *(_OWORD *)time;
            *(void *)(v101 + 400) = *(void *)&time[16];
            *(_OWORD *)(v101 + 432) = *(_OWORD *)v202;
            *(void *)(v101 + 448) = *(void *)&v202[16];
            if (dword_1E9351550)
            {
              LODWORD(v217.value) = 0;
              LOBYTE(v216.value) = 0;
              v112 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v113 = v217.value;
              if (os_log_type_enabled(v112, v216.value)) {
                unsigned int v114 = v113;
              }
              else {
                unsigned int v114 = v113 & 0xFFFFFFFE;
              }
              if (v114)
              {
                *(_OWORD *)lhs = *(_OWORD *)(v101 + 384);
                *(void *)&lhs[16] = *(void *)(v101 + 400);
                Float64 v115 = CMTimeGetSeconds((CMTime *)lhs);
                *(_OWORD *)lhs = *(_OWORD *)(v101 + 432);
                v32 = v190;
                *(void *)&lhs[16] = *(void *)(v101 + 448);
                Float64 v116 = CMTimeGetSeconds((CMTime *)lhs);
                *(_DWORD *)rhs = 136315906;
                *(void *)&rhs[4] = "fpic_recalculatePlayedOutResumptionOffsetUpToIntendedEventToSeekInto";
                *(_WORD *)&rhs[12] = 2048;
                *(void *)&rhs[14] = v90;
                *(_WORD *)&rhs[22] = 2048;
                *(Float64 *)&rhs[24] = v115;
                *(_WORD *)v209 = 2048;
                *(Float64 *)&v209[2] = v116;
                _os_log_send_and_compose_impl();
              }
              uint64_t v99 = v188;
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              int v117 = 0;
            }
            else
            {
              int v117 = 0;
              uint64_t v99 = v188;
            }
          }
          CFRelease(v103);
          if (*(void *)v207) {
            CFRelease(*(CFTypeRef *)v207);
          }
          if (!v117) {
            goto LABEL_159;
          }
        }
        else if (!FigSignalErrorAt())
        {
          goto LABEL_159;
        }
        uint64_t v99 = 0;
        char v120 = 1;
        uint64_t v118 = 0x7FEFFFFFFFFFFFFFLL;
        int v119 = 1;
        goto LABEL_255;
      }
LABEL_159:
      fpic_GetEventStartMoment(v99, (uint64_t)lhs);
      long long v196 = *(_OWORD *)lhs;
      uint64_t v118 = *(void *)&lhs[24];
      CMTimeEpoch v197 = *(void *)&lhs[16];
      int v119 = v215;
      char v120 = BYTE1(v215);
      int v194 = *(_DWORD *)((char *)&v215 + 2);
      __int16 v195 = HIWORD(v215);
      *(unsigned char *)(v93 + 860) = 0;
      if (dword_1E9351550)
      {
        *(_DWORD *)time = 0;
        v202[0] = 0;
        v121 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v122 = *(_DWORD *)time;
        if (os_log_type_enabled(v121, (os_log_type_t)v202[0])) {
          unsigned int v123 = v122;
        }
        else {
          unsigned int v123 = v122 & 0xFFFFFFFE;
        }
        if (v123)
        {
          *(_DWORD *)rhs = 136315650;
          *(void *)&rhs[4] = "fpic_establishIntendedEventToSeekInto";
          *(_WORD *)&rhs[12] = 2048;
          *(void *)&rhs[14] = v90;
          *(_WORD *)&rhs[22] = 2112;
          v124 = v185;
          *(void *)&rhs[24] = v185;
          _os_log_send_and_compose_impl();
        }
        else
        {
          v124 = v185;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (!v124) {
          goto LABEL_168;
        }
LABEL_167:
        CFRelease(v124);
LABEL_168:
        CMTimeEpoch v92 = v189;
        goto LABEL_169;
      }
LABEL_255:
      v124 = v185;
      if (!v185) {
        goto LABEL_168;
      }
      goto LABEL_167;
    }
  }
  uint64_t v99 = 0;
  char v120 = 1;
  uint64_t v118 = 0x7FEFFFFFFFFFFFFFLL;
  int v119 = 1;
LABEL_169:
  if (CFArrayGetCount(*(CFArrayRef *)(v32[7] + 600))) {
    return;
  }
  if (fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(v32[5])) {
    return;
  }
  uint64_t v125 = CMBaseObjectGetDerivedStorage();
  if (*(unsigned __int8 *)(v125 + 352) | *(unsigned __int8 *)(v125 + 353)
    || *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724) && (!v99 || *(unsigned char *)(v32[7] + 860)))
  {
    return;
  }
  if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728)) {
    return;
  }
  uint64_t v126 = v32[7];
  long long v127 = *(_OWORD *)(v126 + 216);
  *(_OWORD *)time = *(_OWORD *)(v126 + 200);
  *(_OWORD *)&time[16] = v127;
  uint64_t v205 = *(void *)(v126 + 232);
  CFIndex v128 = CFArrayGetCount(*(CFArrayRef *)(v126 + 184));
  if (v99)
  {
    uint64_t v129 = v99;
LABEL_178:
    if (v119 || (_BYTE)v200 && BYTE1(v200))
    {
      unsigned __int8 SnapOptions = FigPlayerInterstitialEventGetSnapOptions(v129);
      uint64_t v131 = CMBaseObjectGetDerivedStorage();
      *(_WORD *)(v131 + 232) = 0;
      *(_WORD *)(v131 + 272) = 0;
      *(_OWORD *)(v131 + 408) = v191;
      *(void *)(v131 + 424) = v92;
      *(_OWORD *)(v131 + 456) = v191;
      *(void *)(v131 + 472) = v92;
      *(unsigned char *)(v131 + 976) = 0;
      *(void *)(v131 + 592) = v92;
      *(_OWORD *)(v131 + 576) = v191;
      *(unsigned char *)(v131 + 979) = 0;
      uint64_t v132 = v32[7];
      *(void *)(v132 + 216) = v197;
      *(_OWORD *)(v132 + 200) = v196;
      *(void *)(v132 + 224) = v118;
      *(unsigned char *)(v132 + 232) = v119;
      *(unsigned char *)(v132 + 233) = v120;
      *(_WORD *)(v132 + 238) = v195;
      *(_DWORD *)(v132 + 234) = v194;
      uint64_t v133 = v32[7];
      uint64_t v134 = MEMORY[0x1E4F1FA48];
      long long v135 = *MEMORY[0x1E4F1FA48];
      *(_OWORD *)(v133 + 408) = *MEMORY[0x1E4F1FA48];
      uint64_t v136 = *(void *)(v134 + 16);
      *(void *)(v133 + 424) = v136;
      uint64_t v137 = v32[7];
      *(void *)(v137 + 472) = v136;
      *(_OWORD *)(v137 + 456) = v135;
      fpic_GatePrimaryBufferingAtCurrentEvent(v32[5], SnapOptions & 1);
    }
    goto LABEL_205;
  }
  CFIndex v138 = v128;
  if (v128 >= 1)
  {
    char v186 = v120;
    CFIndex v139 = 0;
    uint64_t v140 = 0;
    uint64_t v129 = 0;
    do
    {
      v141 = CFArrayGetValueAtIndex(*(CFArrayRef *)(v32[7] + 184), v139);
      uint64_t v142 = (*(uint64_t (**)(void, void, const void *))(v32[7] + 80))(v32[5], v32[6], v141);
      uint64_t v143 = (*(uint64_t (**)(void, void, const void *))(v32[7] + 88))(v32[5], v32[6], v141);
      uint64_t v144 = v32[7];
      if (*(void *)(v144 + 152) == v143 && !CFSetContainsValue(*(CFSetRef *)(v144 + 632), v141))
      {
        uint64_t v215 = 0;
        memset(lhs, 0, sizeof(lhs));
        fpic_EventDateTimeMoment(v142, (uint64_t)lhs);
        if (FigPlayerInterstitialEventIsPostRoll(v142))
        {
          if (!v140) {
            uint64_t v140 = v142;
          }
        }
        else
        {
          int v145 = v215;
          char v146 = BYTE1(v215);
          if ((_BYTE)v215 && (_BYTE)v200 || BYTE1(v215) && BYTE1(v200))
          {
            memset(&v217, 0, sizeof(v217));
            fpic_PredictEventGroupDurationOnPrimary(v32[5], v141, v32[6], 0, 0, &v217);
            *(_OWORD *)rhs = v198;
            *(_OWORD *)&rhs[16] = v199;
            *(void *)v209 = v200;
            *(_OWORD *)v202 = *(_OWORD *)lhs;
            *(_OWORD *)&v202[16] = *(_OWORD *)&lhs[16];
            uint64_t v203 = v215;
            CMTime v216 = v217;
            if (fpic_MomentCanBeCurrent((long long *)rhs, (long long *)v202, (long long *)&v216.value))
            {
              *(_OWORD *)rhs = v196;
              *(void *)&rhs[16] = v197;
              *(void *)&rhs[24] = v118;
              v209[0] = v119;
              v209[1] = v186;
              *(_DWORD *)&v209[2] = v194;
              *(_WORD *)&v209[6] = v195;
              *(_OWORD *)v202 = *(_OWORD *)lhs;
              *(_OWORD *)&v202[16] = *(_OWORD *)&lhs[16];
              uint64_t v203 = v215;
              if (fpic_MomentGreaterThan((uint64_t)rhs, (uint64_t)v202))
              {
                long long v196 = *(_OWORD *)lhs;
                uint64_t v118 = *(void *)&lhs[24];
                CMTimeEpoch v197 = *(void *)&lhs[16];
                int v194 = *(_DWORD *)((char *)&v215 + 2);
                __int16 v195 = HIWORD(v215);
                uint64_t v129 = v142;
                char v186 = v146;
                int v119 = v145;
              }
            }
            else
            {
              CFSetSetValue(*(CFMutableSetRef *)(v32[7] + 632), v141);
            }
          }
          uint64_t v99 = 0;
          CMTimeEpoch v92 = v189;
        }
      }
      ++v139;
    }
    while (v138 != v139);
    if (!v129 && v140)
    {
      fpic_GetEarliestStartForPostroll((uint64_t)lhs);
      long long v196 = *(_OWORD *)lhs;
      uint64_t v118 = *(void *)&lhs[24];
      CMTimeEpoch v197 = *(void *)&lhs[16];
      int v119 = v215;
      char v120 = BYTE1(v215);
      int v194 = *(_DWORD *)((char *)&v215 + 2);
      uint64_t v129 = v140;
      __int16 v195 = HIWORD(v215);
      goto LABEL_178;
    }
    char v120 = v186;
    if (v129) {
      goto LABEL_178;
    }
  }
  uint64_t v147 = CMBaseObjectGetDerivedStorage();
  *(_WORD *)(v147 + 232) = 0;
  *(_WORD *)(v147 + 272) = 0;
  *(_OWORD *)(v147 + 408) = v191;
  *(void *)(v147 + 424) = v92;
  *(_OWORD *)(v147 + 456) = v191;
  *(void *)(v147 + 472) = v92;
  *(unsigned char *)(v147 + 976) = 0;
  *(_OWORD *)(v147 + 576) = v191;
  *(void *)(v147 + 592) = v92;
  *(unsigned char *)(v147 + 979) = 0;
LABEL_205:
  uint64_t v148 = v32[7];
  if (!v99)
  {
    *(_OWORD *)(v148 + 384) = v191;
    *(void *)(v148 + 400) = v92;
    uint64_t v149 = v32[7];
    *(_OWORD *)(v149 + 432) = v191;
    *(void *)(v149 + 448) = v92;
    uint64_t v148 = v32[7];
  }
  *(_OWORD *)lhs = *(_OWORD *)time;
  *(_OWORD *)&lhs[16] = *(_OWORD *)&time[16];
  uint64_t v215 = v205;
  long long v150 = *(_OWORD *)(v148 + 216);
  *(_OWORD *)rhs = *(_OWORD *)(v148 + 200);
  *(_OWORD *)&rhs[16] = v150;
  *(void *)v209 = *(void *)(v148 + 232);
  if (!fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)rhs))
  {
    uint64_t v151 = v32[7];
    long long v152 = *(_OWORD *)(v151 + 216);
    *(_OWORD *)lhs = *(_OWORD *)(v151 + 200);
    *(_OWORD *)&lhs[16] = v152;
    uint64_t v215 = *(void *)(v151 + 232);
    CFStringRef v153 = fpic_CreateMomentDesc((uint64_t)lhs);
    *(_OWORD *)lhs = v198;
    *(_OWORD *)&lhs[16] = v199;
    uint64_t v215 = v200;
    CFStringRef v154 = fpic_CreateMomentDesc((uint64_t)lhs);
    if (dword_1E9351550)
    {
      *(_DWORD *)v202 = 0;
      LOBYTE(v217.value) = 0;
      v155 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v156 = *(_DWORD *)v202;
      if (os_log_type_enabled(v155, v217.value)) {
        unsigned int v157 = v156;
      }
      else {
        unsigned int v157 = v156 & 0xFFFFFFFE;
      }
      if (v157)
      {
        uint64_t v158 = v32[5];
        *(_DWORD *)rhs = 136315906;
        *(void *)&rhs[4] = "fpic_EstablishCurrentEventForCurrentItem_block_invoke";
        *(_WORD *)&rhs[12] = 2048;
        *(void *)&rhs[14] = v158;
        *(_WORD *)&rhs[22] = 2112;
        *(void *)&rhs[24] = v154;
        *(_WORD *)v209 = 2112;
        *(void *)&v209[2] = v153;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v32 = v190;
      if (dword_1E9351550 >= 2)
      {
        *(_DWORD *)v202 = 0;
        LOBYTE(v217.value) = 0;
        v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v160 = *(_DWORD *)v202;
        if (os_log_type_enabled(v159, v217.value)) {
          unsigned int v161 = v160;
        }
        else {
          unsigned int v161 = v160 & 0xFFFFFFFE;
        }
        if (v161)
        {
          *(_DWORD *)rhs = 136315138;
          *(void *)&rhs[4] = "fpic_EstablishCurrentEventForCurrentItem_block_invoke";
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    uint64_t v162 = v32[5];
    uint64_t v163 = v32[7];
    long long v164 = *(_OWORD *)(v163 + 216);
    *(_OWORD *)v202 = *(_OWORD *)(v163 + 200);
    *(_OWORD *)&v202[16] = v164;
    uint64_t v203 = *(void *)(v163 + 232);
    CMBaseObjectGetDerivedStorage();
    CFArrayRef v165 = (const __CFArray *)FigCFDictionaryCopyArrayOfKeys();
    if (v165)
    {
      CFArrayRef v166 = v165;
      if (CFArrayGetCount(v165) >= 1)
      {
        CFIndex v167 = 0;
        do
        {
          v168 = (const void *)FigCFArrayGetValueAtIndex();
          uint64_t v169 = fpic_UnwrapEvent(v162, (uint64_t)v168);
          fpic_EventDateTimeMoment(v169, (uint64_t)lhs);
          *(_OWORD *)rhs = *(_OWORD *)v202;
          *(_OWORD *)&rhs[16] = *(_OWORD *)&v202[16];
          *(void *)v209 = v203;
          if (!fpic_MomentsAreClose((uint64_t)rhs, (uint64_t)lhs))
          {
            uint64_t v170 = CMBaseObjectGetDerivedStorage();
            CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v170 + 616), v168);
          }
          ++v167;
        }
        while (v167 < CFArrayGetCount(v166));
      }
      CFRelease(v166);
    }
    if (v153) {
      CFRelease(v153);
    }
    if (v154) {
      CFRelease(v154);
    }
  }
}

@end