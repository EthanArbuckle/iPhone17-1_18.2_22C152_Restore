@interface EnsurePrimaryWillResumeBuffering
@end

@implementation EnsurePrimaryWillResumeBuffering

void __fpic_EnsurePrimaryWillResumeBuffering_block_invoke(void *a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(a1[5] + 884) & 1) == 0) {
    return;
  }
  uint64_t v1 = a1[6];
  uint64_t v2 = a1[7];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 600));
  if (Count >= 1)
  {
    CFIndex v4 = 0;
    BOOL IsItemBufferedToEnd = 1;
    while (1)
    {
      CFIndex PerEventTrackingCount = fpic_GetPerEventTrackingCount(DerivedStorage, v4);
      if (PerEventTrackingCount < 1) {
        break;
      }
      CFIndex v7 = PerEventTrackingCount;
      uint64_t v8 = 1;
      do
      {
        PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(DerivedStorage, v4, v8 - 1, @"PlaybackItem");
        uint64_t v10 = fpic_UnwrapPlaybackItem(v1, PerAssetPerEventTrackedObject, v2);
        if (PerAssetPerEventTrackedObject != @"DummyItem")
        {
          if (v10) {
            BOOL IsItemBufferedToEnd = fpic_IsItemBufferedToEnd(v1, v10);
          }
          else {
            BOOL IsItemBufferedToEnd = 0;
          }
        }
        if (v8 >= v7) {
          break;
        }
        ++v8;
      }
      while (IsItemBufferedToEnd);
      if (++v4 >= Count || !IsItemBufferedToEnd)
      {
        if (!IsItemBufferedToEnd) {
          break;
        }
        goto LABEL_16;
      }
    }
  }
  uint64_t v21 = a1[5];
  if (*(unsigned char *)(v21 + 232) || *(unsigned char *)(v21 + 233)) {
    return;
  }
LABEL_16:
  v11 = a1;
  int v12 = *(unsigned __int8 *)(CMBaseObjectGetDerivedStorage() + 976);
  memset(&v56, 0, sizeof(v56));
  fpic_CurrentResumptionOffset(v11[6], 1, v11[7], 0, &v56);
  *(CMTime *)time1 = v56;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v13 = CMTimeCompare((CMTime *)time1, &time2);
  uint64_t v14 = CMBaseObjectGetDerivedStorage();
  int v15 = *(unsigned __int8 *)(v14 + 974);
  if (*(unsigned char *)(v14 + 974))
  {
    int v15 = *(unsigned __int8 *)(v14 + 973);
    if (*(unsigned char *)(v14 + 973))
    {
      uint64_t v16 = CMBaseObjectGetDerivedStorage();
      uint64_t v17 = v16 + 240;
      if (!*(unsigned char *)(v16 + 272) && !*(unsigned char *)(v16 + 273)) {
        uint64_t v17 = v16 + 200;
      }
      double v18 = *(double *)(v17 + 24);
      int v19 = *(unsigned __int8 *)(v17 + 32);
      int v20 = *(unsigned __int8 *)(v17 + 33);
      long long v54 = 0uLL;
      uint64_t v55 = 0;
      if (!v19)
      {
        if (v20)
        {
          uint64_t v22 = a1[5] + 280;
          long long v23 = *(_OWORD *)(a1[5] + 296);
          *(_OWORD *)time1 = *(_OWORD *)v22;
          *(_OWORD *)&time1[16] = v23;
          uint64_t v70 = *(void *)(v22 + 32);
          FigCreateTimeWithDateAndMoment((uint64_t)time1, (uint64_t)&v54, v18);
          if ((BYTE12(v54) & 1) == 0 || (v56.flags & 1) == 0 || !*(void *)(a1[5] + 152)) {
            goto LABEL_48;
          }
LABEL_28:
          memset(&v53, 0, sizeof(v53));
          *(_OWORD *)time1 = v54;
          *(void *)&time1[16] = v55;
          CMTime time2 = v56;
          CMTimeAdd(&v53, (CMTime *)time1, &time2);
          uint64_t v24 = *(void *)(a1[5] + 152);
          CMTime v52 = v53;
          memset(&v60, 0, sizeof(v60));
          memset(&v59, 0, sizeof(v59));
          fpic_GetSeekableRange(v24, 1, &v60, &v59);
          if ((v60.flags & 0x1D) == 1
            && (v59.flags & 0x1D) == 1
            && (*(CMTime *)time1 = v60, CMTime time2 = v52, CMTimeCompare((CMTime *)time1, &time2) <= 0))
          {
            *(CMTime *)time1 = v59;
            CMTime time2 = v52;
            BOOL v25 = CMTimeCompare((CMTime *)time1, &time2) >= 0;
          }
          else
          {
            BOOL v25 = 0;
          }
          if (dword_1E9351550 >= 7)
          {
            unsigned int v58 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v27 = v58;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
              unsigned int v28 = v27;
            }
            else {
              unsigned int v28 = v27 & 0xFFFFFFFE;
            }
            if (v28)
            {
              *(CMTime *)time1 = v52;
              Float64 Seconds = CMTimeGetSeconds((CMTime *)time1);
              if (v25) {
                v30 = "";
              }
              else {
                v30 = " not";
              }
              *(CMTime *)time1 = v60;
              Float64 v31 = CMTimeGetSeconds((CMTime *)time1);
              *(CMTime *)time1 = v59;
              Float64 v32 = CMTimeGetSeconds((CMTime *)time1);
              LODWORD(time2.value) = 136316418;
              *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_SeekableRangeIncludesTime";
              LOWORD(time2.flags) = 2048;
              *(Float64 *)((char *)&time2.flags + 2) = Seconds;
              HIWORD(time2.epoch) = 2048;
              uint64_t v62 = v24;
              __int16 v63 = 2080;
              v64 = v30;
              __int16 v65 = 2048;
              Float64 v66 = v31;
              __int16 v67 = 2048;
              Float64 v68 = v32;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v11 = a1;
          }
          if (v25)
          {
            int v15 = 0;
          }
          else
          {
LABEL_48:
            uint64_t v33 = CMBaseObjectGetDerivedStorage();
            int v15 = (*(unsigned char *)(v33 + 516) & 1) == 0 || *(_DWORD *)(v33 + 716) || fpic_GetCurrentlyPlayingEvent() == 0;
          }
          goto LABEL_51;
        }
        uint64_t v17 = MEMORY[0x1E4F1F9F8];
      }
      long long v54 = *(_OWORD *)v17;
      uint64_t v55 = *(void *)(v17 + 16);
      goto LABEL_28;
    }
  }
LABEL_51:
  if (v13) {
    BOOL v34 = v12 == 0;
  }
  else {
    BOOL v34 = 0;
  }
  int v35 = !v34;
  if (!v15 && v35)
  {
    if (dword_1E9351550)
    {
      LODWORD(v60.value) = 0;
      LOBYTE(v59.value) = 0;
      v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int value = v60.value;
      if (os_log_type_enabled(v36, v59.value)) {
        unsigned int v38 = value;
      }
      else {
        unsigned int v38 = value & 0xFFFFFFFE;
      }
      if (v38)
      {
        uint64_t v39 = v11[6];
        uint64_t v40 = *(void *)(v11[5] + 152);
        LODWORD(time2.value) = 136315650;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"fpic_EnsurePrimaryWillResumeBuffering_block_invoke";
        LOWORD(time2.flags) = 2048;
        *(void *)((char *)&time2.flags + 2) = v39;
        HIWORD(time2.epoch) = 2048;
        uint64_t v62 = v40;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v41 = *(void *)(v11[5] + 152);
    if (!v41)
    {
      int v49 = FigSignalErrorAt();
      goto LABEL_74;
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(v41);
    uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v43) {
      uint64_t v44 = v43;
    }
    else {
      uint64_t v44 = 0;
    }
    v45 = *(void (**)(uint64_t, __CFString *, void))(v44 + 56);
    if (v45) {
      v45(FigBaseObject, @"TimeToPauseBuffering", 0);
    }
    uint64_t v46 = v11[5];
    v47 = (_OWORD *)MEMORY[0x1E4F1F9F8];
    *(void *)(v46 + 888) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v46 + 872) = *v47;
    uint64_t v48 = CMBaseObjectGetDerivedStorage();
    StopAndReleaseTimer((dispatch_object_t *)(v48 + 648));
    *(_WORD *)(v48 + 704) = 0;
    if (v12)
    {
      int v49 = fpic_ApplyResumptionOffset(v11[6], 1, 0, v11[7], 0);
LABEL_74:
      *(_DWORD *)(*(void *)(v11[4] + 8) + 24) = v49;
    }
  }
}

@end