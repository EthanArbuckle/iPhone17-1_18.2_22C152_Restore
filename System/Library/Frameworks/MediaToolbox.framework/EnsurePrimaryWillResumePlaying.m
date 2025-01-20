@interface EnsurePrimaryWillResumePlaying
@end

@implementation EnsurePrimaryWillResumePlaying

void __fpic_EnsurePrimaryWillResumePlaying_block_invoke(void *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!(*(unsigned __int8 *)(DerivedStorage + 352) | *(unsigned __int8 *)(DerivedStorage + 353))
    || *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724)
    || *(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
  {
    goto LABEL_4;
  }
  if (!CFArrayGetCount(*(CFArrayRef *)(a1[6] + 600))) {
    goto LABEL_18;
  }
  uint64_t v12 = a1[6] + 320;
  uint64_t v13 = CMBaseObjectGetDerivedStorage();
  uint64_t v14 = v13 + 240;
  if (!*(unsigned char *)(v13 + 272) && !*(unsigned char *)(v13 + 273)) {
    uint64_t v14 = v13 + 200;
  }
  long long v15 = *(_OWORD *)(v14 + 16);
  v35[0] = *(_OWORD *)v14;
  v35[1] = v15;
  uint64_t v36 = *(void *)(v14 + 32);
  long long v16 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)time = *(_OWORD *)v12;
  *(_OWORD *)&time[16] = v16;
  uint64_t v45 = *(void *)(v12 + 32);
  if (fpic_MomentsAreClose((uint64_t)time, (uint64_t)v35))
  {
LABEL_4:
    uint64_t v3 = a1[6];
    if ((*(unsigned char *)(v3 + 908) & 1) != 0 && !*(unsigned char *)(v3 + 920))
    {
      memset(&v39, 0, sizeof(v39));
      fpic_TimeToGatePrimaryPlaybackAtCurrentEvent(0, (uint64_t)&v39);
      uint64_t v4 = a1[6];
      *(_OWORD *)time = *(_OWORD *)(v4 + 896);
      *(void *)&time[16] = *(void *)(v4 + 912);
      CMTime time2 = v39;
      if (!fpic_TimesAreClose((CMTime *)time, &time2))
      {
        if (dword_1E9351550)
        {
          *(_DWORD *)v38 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v6 = *(_DWORD *)v38;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
            unsigned int v7 = v6;
          }
          else {
            unsigned int v7 = v6 & 0xFFFFFFFE;
          }
          if (v7)
          {
            uint64_t v9 = a1[5];
            uint64_t v8 = a1[6];
            *(_OWORD *)time = *(_OWORD *)(v8 + 896);
            *(void *)&time[16] = *(void *)(v8 + 912);
            Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
            *(CMTime *)time = v39;
            Float64 v11 = CMTimeGetSeconds((CMTime *)time);
            LODWORD(time2.value) = 136315906;
            *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EnsurePrimaryWillResumePlaying_block_invoke";
            LOWORD(time2.flags) = 2048;
            *(void *)((char *)&time2.flags + 2) = v9;
            HIWORD(time2.epoch) = 2048;
            Float64 v41 = Seconds;
            __int16 v42 = 2048;
            Float64 v43 = v11;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_UngatePrimaryPlayback(a1[5]);
      }
    }
  }
  else
  {
LABEL_18:
    uint64_t v17 = a1[6];
    if (!*(void *)(v17 + 1008))
    {
      if (CMTimebaseGetRate(*(CMTimebaseRef *)(v17 + 1048)) == 0.0)
      {
        uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
        uint64_t v17 = a1[6];
        *(void *)(v17 + 1008) = UpTimeNanoseconds;
      }
      else
      {
        uint64_t v17 = a1[6];
      }
    }
    if (!*(_DWORD *)(v17 + 716))
    {
      if (dword_1E9351550)
      {
        LODWORD(v39.value) = 0;
        v38[0] = OS_LOG_TYPE_DEFAULT;
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int value = v39.value;
        if (os_log_type_enabled(v19, v38[0])) {
          unsigned int v21 = value;
        }
        else {
          unsigned int v21 = value & 0xFFFFFFFE;
        }
        if (v21)
        {
          uint64_t v23 = a1[5];
          uint64_t v22 = a1[6];
          double v24 = *(double *)(v22 + 152);
          *(_OWORD *)time = *(_OWORD *)(v22 + 504);
          *(void *)&time[16] = *(void *)(v22 + 520);
          Float64 v25 = CMTimeGetSeconds((CMTime *)time);
          LODWORD(time2.value) = 136315906;
          *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EnsurePrimaryWillResumePlaying_block_invoke";
          LOWORD(time2.flags) = 2048;
          *(void *)((char *)&time2.flags + 2) = v23;
          HIWORD(time2.epoch) = 2048;
          Float64 v41 = v24;
          __int16 v42 = 2048;
          Float64 v43 = v25;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = fpic_TransitionPlayback(a1[5], a1[7], 1, a1[8]);
      if (!*(_DWORD *)(*(void *)(a1[4] + 8) + 24))
      {
        uint64_t v26 = CMBaseObjectGetDerivedStorage();
        if (*(void *)(v26 + 152))
        {
          uint64_t v27 = v26;
          uint64_t v28 = CMBaseObjectGetDerivedStorage();
          if (*(unsigned char *)(v28 + 974))
          {
            if (!*(unsigned char *)(v28 + 973) && (*(unsigned char *)(v27 + 516) & 1) != 0)
            {
              v29 = (_OWORD *)(v27 + 504);
              memset(&v39, 0, sizeof(v39));
              fpic_GetItemEndTime(*(void *)(v27 + 152), (uint64_t)&v39);
              if (dword_1E9351550)
              {
                *(_DWORD *)v38 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v31 = *(_DWORD *)v38;
                if (os_log_type_enabled(v30, type)) {
                  unsigned int v32 = v31;
                }
                else {
                  unsigned int v32 = v31 & 0xFFFFFFFE;
                }
                if (v32)
                {
                  *(_OWORD *)time = *v29;
                  *(void *)&time[16] = *(void *)(v27 + 520);
                  Float64 v33 = CMTimeGetSeconds((CMTime *)time);
                  *(CMTime *)time = v39;
                  Float64 v34 = CMTimeGetSeconds((CMTime *)time);
                  LODWORD(time2.value) = 136315650;
                  *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EndPrimaryItemIfResumePastEnd";
                  LOWORD(time2.flags) = 2048;
                  *(Float64 *)((char *)&time2.flags + 2) = v33;
                  HIWORD(time2.epoch) = 2048;
                  Float64 v41 = v34;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              *(_OWORD *)time = *v29;
              *(void *)&time[16] = *(void *)(v27 + 520);
              CMTime time2 = v39;
              if (CMTimeCompare((CMTime *)time, &time2) >= 1)
              {
                *(_OWORD *)time = *MEMORY[0x1E4F1F9F8];
                *(void *)&time[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
                FigCFCopyPropertyAsTime();
                CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
                FigCFSetPropertyToTime();
                CMTime time2 = *(CMTime *)time;
                FigCFSetPropertyToTime();
              }
            }
          }
        }
      }
    }
  }
}

@end