@interface EnsureNextEventWillPlay
@end

@implementation EnsureNextEventWillPlay

void __fpic_EnsureNextEventWillPlay_block_invoke(void *a1)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 978)) {
    BOOL v3 = *(unsigned char *)(v2 + 977) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!*(void *)(v2 + 152)) {
    return;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v5 = DerivedStorage + 240;
  if (!*(unsigned char *)(DerivedStorage + 272) && !*(unsigned char *)(DerivedStorage + 273)) {
    uint64_t v5 = DerivedStorage + 200;
  }
  *(_OWORD *)&v86.CMTimeValue value = *(_OWORD *)v5;
  v86.CMTimeEpoch epoch = *(void *)(v5 + 16);
  int v6 = *(unsigned __int8 *)(v5 + 32);
  int v7 = *(unsigned __int8 *)(v5 + 33);
  if (!(v6 | v7)) {
    return;
  }
  double v8 = *(double *)(v5 + 24);
  uint64_t v9 = CMBaseObjectGetDerivedStorage();
  if (*(unsigned char *)(v9 + 974))
  {
    if (*(unsigned char *)(v9 + 973))
    {
      uint64_t v10 = CMBaseObjectGetDerivedStorage();
      if (!(*(unsigned __int8 *)(v10 + 352) | *(unsigned __int8 *)(v10 + 353)))
      {
        memset(&v97, 0, sizeof(v97));
        if (v6)
        {
          CMTime lhs = v86;
          *(void *)rhs = 10;
          *(void *)&rhs[8] = 0x100000001;
          *(void *)&rhs[16] = 0;
          CMTimeSubtract(&v97, &lhs, (CMTime *)rhs);
          char v11 = 1;
          if (v7)
          {
LABEL_14:
            lhs.CMTimeValue value = 10;
            *(void *)&lhs.timescale = 0x100000001;
            lhs.CMTimeEpoch epoch = 0;
            double v12 = v8 - CMTimeGetSeconds(&lhs);
            char v13 = 1;
LABEL_17:
            uint64_t v14 = a1[6];
            uint64_t v15 = *(void *)(a1[5] + 152);
            CMTime v96 = v97;
            uint64_t v16 = CMBaseObjectGetDerivedStorage();
            CMTime lhs = v96;
            double v105 = v12;
            char v106 = v11;
            char v107 = v13;
            int v108 = 0;
            __int16 v109 = 0;
            long long v17 = *(_OWORD *)(v16 + 688);
            *(_OWORD *)rhs = *(_OWORD *)(v16 + 672);
            *(_OWORD *)&rhs[16] = v17;
            *(void *)v99 = *(void *)(v16 + 704);
            if (!fpic_MomentsAreClose((uint64_t)&lhs, (uint64_t)rhs))
            {
              uint64_t v18 = CMBaseObjectGetDerivedStorage();
              StopAndReleaseTimer((dispatch_object_t *)(v18 + 648));
              *(_WORD *)(v18 + 704) = 0;
              CMTime lhs = v96;
              double v105 = v12;
              char v106 = v11;
              char v107 = v13;
              int v108 = 0;
              __int16 v109 = 0;
              if (!fpic_CreateAndPrimeItemTimer(v14, v15, (uint64_t)&lhs, (void (__cdecl *)(void *))fpic_ServiceCurrentEventTimerProc, (NSObject **)(v16 + 648)))
              {
                long long v19 = *(_OWORD *)&v96.value;
                *(_OWORD *)(v16 + 672) = *(_OWORD *)&v96.value;
                CMTimeEpoch epoch = v96.epoch;
                *(void *)(v16 + 688) = v96.epoch;
                *(double *)(v16 + 696) = v12;
                *(unsigned char *)(v16 + 704) = v11;
                *(unsigned char *)(v16 + 705) = v13;
                *(_WORD *)(v16 + 710) = 0;
                *(_DWORD *)(v16 + 706) = 0;
                *(_OWORD *)&lhs.CMTimeValue value = v19;
                lhs.CMTimeEpoch epoch = epoch;
                double v105 = v12;
                char v106 = v11;
                char v107 = v13;
                int v108 = 0;
                __int16 v109 = 0;
                CFStringRef MomentDesc = fpic_CreateMomentDesc((uint64_t)&lhs);
                if (dword_1E9351550)
                {
                  v94.n128_u32[0] = 0;
                  LOBYTE(type.value) = 0;
                  os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                if (MomentDesc) {
                  CFRelease(MomentDesc);
                }
              }
            }
            goto LABEL_23;
          }
        }
        else
        {
          char v11 = 0;
          if (v7) {
            goto LABEL_14;
          }
        }
        char v13 = 0;
        double v12 = 0.0;
        goto LABEL_17;
      }
    }
  }
LABEL_23:
  int v23 = *(unsigned __int8 *)(CMBaseObjectGetDerivedStorage() + 976);
  uint64_t v24 = a1[5];
  if (v23 || *(unsigned char *)(v24 + 977) && *(unsigned char *)(v24 + 978))
  {
    if (fpic_GetPerAssetPerEventTrackedObject(v24, 0, 0, @"PlaybackItem"))
    {
      if (!v3)
      {
        uint64_t v25 = CMBaseObjectGetDerivedStorage();
        if (!(*(unsigned __int8 *)(v25 + 352) | *(unsigned __int8 *)(v25 + 353))
          && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
        {
          *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = fpic_TransitionPlayback(a1[6], a1[7], 0, a1[8]);
          if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24)) {
            return;
          }
          fpic_SignalCurrentEvent((const void *)a1[6], a1[8]);
        }
      }
    }
  }
  if (fpic_GetCurrentlyPlayingEvent()
    && (*(_DWORD *)(a1[5] + 492) & 0x1D) != 1
    && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
  {
    uint64_t v26 = (*(uint64_t (**)(void, void, void))(a1[5] + 64))(a1[6], a1[8], *(void *)(a1[5] + 40));
    if (!v26)
    {
LABEL_97:
      fpic_PruneCurrentEventsToQueue((const void *)a1[6], a1[8], 0, 0);
      return;
    }
    uint64_t v27 = v26;
    uint64_t v28 = a1[6];
    uint64_t v29 = a1[8];
    uint64_t v30 = CMBaseObjectGetDerivedStorage();
    CFTypeRef v87 = 0;
    fpic_CopyNextItem(v27, &v87);
    CFTypeRef v31 = v87;
    if ((*(_DWORD *)(v30 + 492) & 0x1D) == 1 || !v87)
    {
      if (!v87)
      {
LABEL_77:
        if ((*(_DWORD *)(a1[5] + 492) & 0x1D) == 1)
        {
          uint64_t v59 = a1[6];
          uint64_t v60 = a1[8];
          uint64_t v61 = CMBaseObjectGetDerivedStorage();
          if (CFArrayGetCount(*(CFArrayRef *)(v61 + 600)))
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(v61 + 600), 0);
            if (ValueAtIndex)
            {
              uint64_t v63 = (*(uint64_t (**)(uint64_t, uint64_t, const void *))(v61 + 80))(v59, v60, ValueAtIndex);
              v64 = FigPlayerInterstitialEventCopyIdentifier(v63);
              LODWORD(lhs.value) = 0;
              FigCFDictionaryGetInt32IfPresent();
              FigCFDictionarySetInt32();
              if (v64) {
                CFRelease(v64);
              }
            }
          }
          fpic_SetInterstitialActionAtEnd(a1[6], a1[8], @"StopAtEndOfQueue");
          fpic_UnpauseInterstitialPlayer(a1[6], v27, a1[8]);
          CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1[5] + 600));
          if (Count >= 1)
          {
            CFIndex v65 = 0;
            uint64_t v85 = *MEMORY[0x1E4F1CF80];
            do
            {
              CFIndex PerEventTrackingCount = fpic_GetPerEventTrackingCount(a1[5], v65);
              if (PerEventTrackingCount >= 1)
              {
                CFIndex v67 = PerEventTrackingCount;
                for (CFIndex i = 0; i != v67; ++i)
                {
                  PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(a1[5], v65, i, @"PlaybackItem");
                  uint64_t v70 = fpic_UnwrapPlaybackItem(a1[6], PerAssetPerEventTrackedObject, a1[8]);
                  if (v70)
                  {
                    uint64_t v71 = v70;
                    uint64_t v72 = a1[6];
                    lhs.CMTimeValue value = 0;
                    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(v70);
                    uint64_t v74 = *(void *)(CMBaseObjectGetVTable() + 8);
                    if (v74) {
                      uint64_t v75 = v74;
                    }
                    else {
                      uint64_t v75 = 0;
                    }
                    v76 = *(void (**)(uint64_t, __CFString *, uint64_t, CMTime *))(v75 + 48);
                    if (v76)
                    {
                      v76(FigBaseObject, @"Timebase", v85, &lhs);
                      CMTimeValue value = lhs.value;
                    }
                    else
                    {
                      CMTimeValue value = 0;
                    }
                    fpic_UnregisterInterstitialItemNotifications(v72, v71, value);
                    CMNotificationCenterGetDefaultLocalCenter();
                    FigNotificationCenterAddWeakListener();
                    if (lhs.value)
                    {
                      CMNotificationCenterGetDefaultLocalCenter();
                      FigNotificationCenterAddWeakListener();
                      CMNotificationCenterGetDefaultLocalCenter();
                      FigNotificationCenterAddWeakListener();
                      CFRelease((CFTypeRef)lhs.value);
                    }
                  }
                }
              }
              ++v65;
            }
            while (v65 != Count);
          }
        }
        goto LABEL_97;
      }
    }
    else
    {
      if (v31 == (CFTypeRef)fpic_GetFirstCurrentItem(v28, v29))
      {
        uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v37) {
          uint64_t v38 = v37;
        }
        else {
          uint64_t v38 = 0;
        }
        v43 = (CMTime *)(v30 + 480);
        v44 = *(void (**)(CFTypeRef, CMTime *))(v38 + 32);
        if (v44) {
          v44(v31, v43);
        }
        if (dword_1E9351550)
        {
          LODWORD(v97.value) = 0;
          LOBYTE(v96.value) = 0;
          v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v46 = v97.value;
          if (os_log_type_enabled(v45, v96.value)) {
            unsigned int v47 = v46;
          }
          else {
            unsigned int v47 = v46 & 0xFFFFFFFE;
          }
          if (v47)
          {
            CMTime lhs = *v43;
            Float64 Seconds = CMTimeGetSeconds(&lhs);
            *(_DWORD *)rhs = 136315650;
            *(void *)&rhs[4] = "fpic_StartRecordingActiveInterstitialItemPlayoutTime";
            *(_WORD *)&rhs[12] = 2112;
            *(void *)&rhs[14] = v31;
            *(_WORD *)&rhs[22] = 2048;
            *(Float64 *)&rhs[24] = Seconds;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v49 = CMBaseObjectGetDerivedStorage();
        if (*(unsigned char *)(v49 + 974) && *(unsigned char *)(v49 + 973))
        {
          uint64_t v50 = CMBaseObjectGetDerivedStorage();
          memset(&v97, 0, sizeof(v97));
          memset(&v96, 0, sizeof(v96));
          fpic_GetSeekableRange(*(void *)(v50 + 152), 0, &v97, &v96);
          __n128 v94 = 0uLL;
          uint64_t v95 = 0;
          fpic_GetCurrentDepartureTime(&v94);
          memset(&type, 0, sizeof(type));
          CMTime lhs = v96;
          *(__n128 *)rhs = v94;
          *(void *)&rhs[16] = v95;
          CMTimeSubtract(&type, &lhs, (CMTime *)rhs);
          memset(&v92, 0, sizeof(v92));
          CMTime lhs = *(CMTime *)(v50 + 384);
          *(_OWORD *)rhs = *(_OWORD *)(v50 + 408);
          *(void *)&rhs[16] = *(void *)(v50 + 424);
          CMTimeAdd(&v92, &lhs, (CMTime *)rhs);
          *(CMTime *)rhs = v92;
          CMTime v91 = *(CMTime *)(v50 + 456);
          CMTimeAdd(&lhs, (CMTime *)rhs, &v91);
          CMTime v92 = lhs;
          memset(&v91, 0, sizeof(v91));
          CMTime lhs = type;
          *(CMTime *)rhs = v92;
          CMTimeSubtract(&v91, &lhs, (CMTime *)rhs);
          *(CMTime *)rhs = v91;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          CMTimeMaximum(&lhs, (CMTime *)rhs, &time2);
          CMTime v91 = lhs;
          if (dword_1E9351550 >= 2)
          {
            unsigned int v89 = 0;
            os_log_type_t v88 = OS_LOG_TYPE_DEFAULT;
            v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v52 = v89;
            if (os_log_type_enabled(v51, v88)) {
              unsigned int v53 = v52;
            }
            else {
              unsigned int v53 = v52 & 0xFFFFFFFE;
            }
            if (v53)
            {
              CMTime lhs = v97;
              Float64 v54 = CMTimeGetSeconds(&lhs);
              CMTime lhs = v96;
              Float64 v55 = CMTimeGetSeconds(&lhs);
              fpic_GetCurrentDepartureTime((__n128 *)&time2);
              Float64 v56 = CMTimeGetSeconds(&time2);
              CMTime lhs = v92;
              Float64 v57 = CMTimeGetSeconds(&lhs);
              CMTime lhs = v91;
              Float64 v58 = CMTimeGetSeconds(&lhs);
              *(_DWORD *)rhs = 136316418;
              *(void *)&rhs[4] = "fpic_SetLiveHorizonOnInterstitialItem";
              *(_WORD *)&rhs[12] = 2048;
              *(Float64 *)&rhs[14] = v54;
              *(_WORD *)&rhs[22] = 2048;
              *(Float64 *)&rhs[24] = v55;
              *(_WORD *)v99 = 2048;
              *(Float64 *)&v99[2] = v56;
              __int16 v100 = 2048;
              Float64 v101 = v57;
              __int16 v102 = 2048;
              Float64 v103 = v58;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CFAllocatorRef v78 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CMTime lhs = v91;
          CFDictionaryRef v79 = CMTimeCopyAsDictionary(&lhs, v78);
          uint64_t v80 = FigPlaybackItemGetFigBaseObject(v31);
          uint64_t v81 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v81) {
            uint64_t v82 = v81;
          }
          else {
            uint64_t v82 = 0;
          }
          v83 = *(void (**)(uint64_t, __CFString *, CFDictionaryRef))(v82 + 56);
          if (v83) {
            v83(v80, @"interstitialLiveHorizon", v79);
          }
          if (v79) {
            CFRelease(v79);
          }
        }
        goto LABEL_76;
      }
      CFTypeRef v32 = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 864);
      if (!v32 || v32 != v31)
      {
        LODWORD(v97.value) = 0;
        LOBYTE(v96.value) = 0;
        v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v40 = v97.value;
        if (os_log_type_enabled(v39, v96.value)) {
          unsigned int v41 = v40;
        }
        else {
          unsigned int v41 = v40 & 0xFFFFFFFE;
        }
        if (v41)
        {
          uint64_t FirstCurrentItem = fpic_GetFirstCurrentItem(v28, v29);
          *(_DWORD *)rhs = 136315650;
          *(void *)&rhs[4] = "fpic_StartRecordingActiveInterstitialItemPlayoutTime";
          *(_WORD *)&rhs[12] = 2112;
          *(void *)&rhs[14] = v31;
          *(_WORD *)&rhs[22] = 2112;
          *(void *)&rhs[24] = FirstCurrentItem;
          _os_log_send_and_compose_impl();
        }
        goto LABEL_75;
      }
      if (dword_1E9351550)
      {
        LODWORD(v97.value) = 0;
        LOBYTE(v96.value) = 0;
        v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v34 = v97.value;
        if (os_log_type_enabled(v33, v96.value)) {
          unsigned int v35 = v34;
        }
        else {
          unsigned int v35 = v34 & 0xFFFFFFFE;
        }
        if (v35)
        {
          uint64_t v36 = *(void *)(v30 + 864);
          *(_DWORD *)rhs = 136315650;
          *(void *)&rhs[4] = "fpic_StartRecordingActiveInterstitialItemPlayoutTime";
          *(_WORD *)&rhs[12] = 2048;
          *(void *)&rhs[14] = v28;
          *(_WORD *)&rhs[22] = 2048;
          *(void *)&rhs[24] = v36;
          _os_log_send_and_compose_impl();
        }
LABEL_75:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
LABEL_76:
    CFRelease(v31);
    goto LABEL_77;
  }
}

@end