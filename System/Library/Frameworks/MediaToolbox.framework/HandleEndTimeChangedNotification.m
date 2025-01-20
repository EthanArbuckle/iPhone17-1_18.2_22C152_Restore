@interface HandleEndTimeChangedNotification
@end

@implementation HandleEndTimeChangedNotification

uint64_t __fpic_HandleEndTimeChangedNotification_block_invoke(uint64_t result)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 48);
  if (*(void *)(result + 40) == *(void *)(v1 + 152))
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 88) || *(unsigned char *)(result + 89))
    {
      *(void *)&time[16] = *(void *)(v1 + 376);
      *(_OWORD *)time = *(_OWORD *)(v1 + 360);
      *(_OWORD *)rhs = *(_OWORD *)(result + 104);
      *(void *)&rhs[16] = *(void *)(result + 120);
      result = fpic_TimesAreClose((CMTime *)time, (CMTime *)rhs);
      if (!result)
      {
        if (dword_1E9351550)
        {
          LOBYTE(type.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v4 = *(void *)(v2 + 48);
        long long v5 = *(_OWORD *)(v2 + 104);
        *(void *)(v4 + 376) = *(void *)(v2 + 120);
        *(_OWORD *)(v4 + 360) = v5;
        uint64_t v6 = *(void *)(v2 + 96);
        long long v23 = *(_OWORD *)(v2 + 56);
        long long v24 = *(_OWORD *)(v2 + 72);
        int v7 = *(unsigned __int8 *)(v2 + 88);
        int v8 = *(unsigned __int8 *)(v2 + 89);
        int v21 = *(_DWORD *)(v2 + 90);
        __int16 v22 = *(_WORD *)(v2 + 94);
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
        *(_OWORD *)time = v23;
        *(void *)&time[16] = v24;
        memset(&type, 0, sizeof(type));
        *(_OWORD *)rhs = *(_OWORD *)&kPostRollTimeToPausePlaybackBuffer.value;
        *(void *)&rhs[16] = 0;
        CMTimeAdd(&type, (CMTime *)time, (CMTime *)rhs);
        uint64_t v10 = CMBaseObjectGetDerivedStorage();
        if (*(unsigned char *)(v10 + 978))
        {
          uint64_t v11 = v10;
          if (!*(unsigned char *)(v10 + 232) || !v7)
          {
            result = 0;
            if (!*(unsigned char *)(v11 + 233) || !v8) {
              goto LABEL_28;
            }
          }
          uint64_t v12 = v11 + 200;
          long long v13 = *(_OWORD *)(v12 + 16);
          *(_OWORD *)time = *(_OWORD *)v12;
          *(_OWORD *)&time[16] = v13;
          uint64_t v32 = *(void *)(v12 + 32);
          *(_OWORD *)rhs = v23;
          *(_OWORD *)&rhs[16] = v24;
          char v27 = v7;
          char v28 = v8;
          int v29 = v21;
          __int16 v30 = v22;
          if (!fpic_MomentsAreClose((uint64_t)time, (uint64_t)rhs))
          {
            uint64_t v14 = FigCFWeakReferenceHolderCopyReferencedObject();
            if (!v14)
            {
              result = FigSignalErrorAt();
              goto LABEL_28;
            }
            v15 = (const void *)v14;
            if (!*(unsigned char *)(DerivedStorage + 977))
            {
              v16 = (_OWORD *)(DerivedStorage + 200);
              *(_OWORD *)time = *(_OWORD *)(DerivedStorage + 200);
              *(_OWORD *)&time[16] = *(_OWORD *)(DerivedStorage + 216);
              uint64_t v32 = *(void *)(DerivedStorage + 232);
              CFStringRef MomentDesc = fpic_CreateMomentDesc((uint64_t)time);
              *(_OWORD *)time = v23;
              *(_OWORD *)&time[16] = v24;
              LOBYTE(v32) = v7;
              BYTE1(v32) = v8;
              *(_DWORD *)((char *)&v32 + 2) = v21;
              HIWORD(v32) = v22;
              CFStringRef v18 = fpic_CreateMomentDesc((uint64_t)time);
              if (dword_1E9351550)
              {
                v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v16 = (_OWORD *)(DerivedStorage + 200);
              }
              _OWORD *v16 = v23;
              v16[1] = v24;
              *(unsigned char *)(DerivedStorage + 232) = v7;
              *(unsigned char *)(DerivedStorage + 233) = v8;
              *(_DWORD *)(DerivedStorage + 234) = v21;
              *(_WORD *)(DerivedStorage + 238) = v22;
              if (MomentDesc) {
                CFRelease(MomentDesc);
              }
              if (v18) {
                CFRelease(v18);
              }
            }
            if (*(unsigned char *)(DerivedStorage + 908))
            {
              *(_OWORD *)time = *(_OWORD *)(DerivedStorage + 896);
              *(void *)&time[16] = *(void *)(DerivedStorage + 912);
              *(CMTime *)rhs = type;
              if (!fpic_TimesAreClose((CMTime *)time, (CMTime *)rhs))
              {
                if (dword_1E9351550)
                {
                  v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                fpic_GatePrimaryPlaybackAtCurrentEvent(v6, (uint64_t)v15);
              }
            }
            fpic_updateCurrentResumptionTimeIfPlayingPostroll();
            CFRelease(v15);
          }
        }
        result = 0;
LABEL_28:
        *(_DWORD *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
      }
    }
  }
  return result;
}

@end