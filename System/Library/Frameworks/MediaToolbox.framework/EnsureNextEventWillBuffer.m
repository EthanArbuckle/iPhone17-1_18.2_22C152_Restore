@interface EnsureNextEventWillBuffer
@end

@implementation EnsureNextEventWillBuffer

void __fpic_EnsureNextEventWillBuffer_block_invoke(void *a1)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1[8] + 600)) < 1) {
    return;
  }
  uint64_t v2 = a1[8];
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 600));
  if (Count < 1)
  {
LABEL_7:
    CFIndex v6 = CFArrayGetCount(*(CFArrayRef *)(a1[8] + 600));
    if (v6 < 1)
    {
LABEL_51:
      if (CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1[6] + 8) + 24)) >= 1)
      {
        uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
        time1.CMTimeValue value = 0;
        time2.CMTimeValue value = 0;
        uint64_t v28 = *(void *)(DerivedStorage + 152);
        if (v28
          && ((uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(v28),
               (uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
            ? (uint64_t v31 = 0)
            : (uint64_t v31 = v30),
              (v32 = *(unsigned int (**)(uint64_t, __CFString *, void, CMTime *))(v31 + 48)) != 0
           && (uint64_t v33 = *MEMORY[0x1E4F1CF80], !v32(FigBaseObject, @"ChosenTrackIDArray", *MEMORY[0x1E4F1CF80], &time1))))
        {
          BOOL v34 = 0;
          for (CFIndex i = 0; ; ++i)
          {
            CMTimeValue value = time1.value;
            if (time1.value) {
              CMTimeValue value = CFArrayGetCount((CFArrayRef)time1.value);
            }
            if (i >= value || v34) {
              break;
            }
            uint64_t v38 = *(void *)(DerivedStorage + 152);
            CFArrayGetValueAtIndex((CFArrayRef)time1.value, i);
            uint64_t SInt32 = FigCFNumberGetSInt32();
            uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v40) {
              uint64_t v41 = v40;
            }
            else {
              uint64_t v41 = 0;
            }
            v42 = *(unsigned int (**)(uint64_t, uint64_t, __CFString *, uint64_t, CMTime *))(v41 + 40);
            if (v42 && !v42(v38, SInt32, @"FormatDescriptionArray", v33, &time2))
            {
              BOOL v34 = 0;
              for (CFIndex j = 0; ; ++j)
              {
                CFIndex v44 = time2.value ? CFArrayGetCount((CFArrayRef)time2.value) : 0;
                if (j >= v44 || v34) {
                  break;
                }
                ValueAtIndex = (const opaqueCMFormatDescription *)CFArrayGetValueAtIndex((CFArrayRef)time2.value, j);
                if (CMFormatDescriptionGetMediaType(ValueAtIndex) == 1936684398)
                {
                  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(ValueAtIndex);
                  if (RichestDecodableFormat) {
                    int mChannelsPerFrame = RichestDecodableFormat->mASBD.mChannelsPerFrame;
                  }
                  else {
                    int mChannelsPerFrame = CMAudioFormatDescriptionGetChannelCount();
                  }
                  BOOL v34 = mChannelsPerFrame < 3;
                }
                else
                {
                  BOOL v34 = 0;
                }
              }
              if (time2.value)
              {
                CFRelease((CFTypeRef)time2.value);
                time2.CMTimeValue value = 0;
              }
            }
            else
            {
              BOOL v34 = 0;
            }
          }
        }
        else
        {
          BOOL v34 = 0;
        }
        if (time1.value) {
          CFRelease((CFTypeRef)time1.value);
        }
        v35 = &kFigPlayerMultichannelAudioStrategy_PreferStereo;
        if (!v34) {
          v35 = &kFigPlayerMultichannelAudioStrategy_MatchMultichannelTrackPreferenceToAudioDevice;
        }
        *(void *)(*(void *)(a1[7] + 8) + 24) = *v35;
      }
      return;
    }
    CFIndex v7 = v6;
    CFIndex v8 = 0;
    CFIndex v48 = v6;
    while (1)
    {
      v9 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[8] + 600), v8);
      if (v9) {
        CFTypeRef v10 = CFRetain(v9);
      }
      else {
        CFTypeRef v10 = 0;
      }
      uint64_t v11 = (*(uint64_t (**)(void, void, CFTypeRef))(a1[8] + 80))(a1[9], a1[10], v10);
      if ((*(unsigned char *)(*(void *)(a1[4] + 8) + 44) & 1) == 0)
      {
        CMTime time1 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        memset(&time2, 0, sizeof(time2));
        fpic_PredictEventGroupDurationOnPrimary(a1[9], v10, a1[10], 0, (uint64_t)&time1, &time2);
        uint64_t v12 = a1[9];
        uint64_t v13 = a1[10];
        CMTime lhs = time2;
        fpic_GetOffsetForEvent(v12, (uint64_t)v10, (long long *)&lhs.value, v13, (uint64_t)&v55);
        uint64_t v14 = *(void *)(a1[4] + 8);
        *(_OWORD *)(v14 + 32) = v55;
        *(void *)(v14 + 48) = v56;
        if (!*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
        {
          CMTime lhs = *(CMTime *)(*(void *)(a1[4] + 8) + 32);
          CMTime rhs = time1;
          CMTimeSubtract(&v53, &lhs, &rhs);
          *(CMTime *)(*(void *)(a1[4] + 8) + 32) = v53;
          uint64_t v15 = *(void *)(a1[4] + 8);
          FigPlayerInterstitialEventGetFirstItemStartOffset(v11, (uint64_t)&v50);
          CMTime lhs = *(CMTime *)(v15 + 32);
          CMTimeAdd(&v51, &lhs, &v50);
          *(CMTime *)(*(void *)(a1[4] + 8) + 32) = v51;
        }
      }
      if (!fpic_GetPerAssetPerEventTrackedObject(a1[8], v8, 0, @"PlaybackItem")) {
        break;
      }
      if (v10) {
        goto LABEL_17;
      }
LABEL_18:
      if (++v8 == v7) {
        goto LABEL_51;
      }
    }
    v16 = fpic_CopyPerAssetPerEventTrackedObjects(a1[8], v8, @"AssetURL");
    CFIndex v17 = CFArrayGetCount(v16);
    v18 = FigPlayerInterstitialEventCopyAssetListUrl(v11);
    if (v18)
    {
      time1.CMTimeValue value = 0;
      if ((*(unsigned int (**)(void, void, uint64_t, __CFArray *, CMTime *))(a1[8] + 104))(a1[9], a1[10], v11, v16, &time1))
      {
        CMTimeValue v19 = (CMTimeValue)v10;
      }
      else
      {
        fpic_UpdateEventInAddOrder((const void *)a1[9], v10, (const void *)time1.value);
        CFMutableDictionaryRef v20 = fpic_CreateAssetListResponseStatusDidChangeNotificationPayload(time1.value, 0, 0);
        fpic_PostNotification(a1[8], @"fpiAssetListResponseStatusDidChange", (const void *)a1[9], v20);
        CMTimeValue v19 = time1.value;
        if (time1.value) {
          CFRetain((CFTypeRef)time1.value);
        }
        if (v10) {
          CFRelease(v10);
        }
        if (v20) {
          CFRelease(v20);
        }
        if (time1.value) {
          CFRelease((CFTypeRef)time1.value);
        }
      }
      CFTypeRef v10 = (CFTypeRef)v19;
    }
    if (v8) {
      goto LABEL_33;
    }
    uint64_t v21 = *(void *)(a1[4] + 8);
    if (*(unsigned char *)(v21 + 44))
    {
      CMTime time1 = *(CMTime *)(v21 + 32);
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTimeCompare(&time1, &time2);
      if (v17 >= 1)
      {
        CFIndex v22 = 0;
        while (1)
        {
          memset(&time1, 0, sizeof(time1));
          fpic_GetEventItemDurationOnAssetTimeline(a1[9], a1[10], v10, 0, v22, &time1);
          if ((time1.flags & 1) == 0) {
            break;
          }
          CMTime time2 = *(CMTime *)(*(void *)(a1[4] + 8) + 32);
          CMTime lhs = time1;
          if (CMTimeCompare(&time2, &lhs) > 0)
          {
            CMTime time2 = *(CMTime *)(*(void *)(a1[4] + 8) + 32);
            CMTime lhs = time1;
            CMTimeSubtract(&v49, &time2, &lhs);
            *(CMTime *)(*(void *)(a1[4] + 8) + 32) = v49;
            v23 = (CMTime *)a1[8];
            CMTime lhs = v23[19];
            CMTime rhs = time1;
            CMTimeAdd(&time2, &lhs, &rhs);
            v23[19] = time2;
            ++*(void *)(*(void *)(a1[5] + 8) + 24);
            if (v17 != ++v22) {
              continue;
            }
          }
          goto LABEL_48;
        }
        if (v22 < v17 - 1)
        {
          uint64_t v24 = *(void *)(a1[4] + 8);
          uint64_t v25 = MEMORY[0x1E4F1F9F8];
          *(_OWORD *)(v24 + 32) = *MEMORY[0x1E4F1F9F8];
          *(void *)(v24 + 48) = *(void *)(v25 + 16);
        }
      }
    }
LABEL_48:
    uint64_t v26 = *(void *)(a1[5] + 8);
    if (*(void *)(v26 + 24) < v17)
    {
LABEL_33:
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1[6] + 8) + 24), v10);
      if (!v18) {
        goto LABEL_35;
      }
    }
    else
    {
      *(void *)(v26 + 24) = 0;
      if (!v18)
      {
LABEL_35:
        if (v16) {
          CFRelease(v16);
        }
        CFIndex v7 = v48;
        if (!v10) {
          goto LABEL_18;
        }
LABEL_17:
        CFRelease(v10);
        goto LABEL_18;
      }
    }
    CFRelease(v18);
    goto LABEL_35;
  }
  CFIndex v4 = Count;
  CFIndex v5 = 0;
  while (fpic_GetPerAssetPerEventTrackedObject(v2, v5, 0, @"PlaybackItem") == @"DummyItem"
       || fpic_GetPerAssetPerEventTrackedObject(v2, v5, 0, @"AssetURL"))
  {
    if (v4 == ++v5) {
      goto LABEL_7;
    }
  }
}

uint64_t __fpic_EnsureNextEventWillBuffer_block_invoke_120(void *a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[4] + 8) + 24);
  if (v2 >= 1)
  {
    CFIndex v3 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1[5] + 8) + 24), v3);
      CMBaseObjectGetDerivedStorage();
      uint64_t FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
      if ((FirstIndexOfValue & 0x8000000000000000) == 0)
      {
        CFIndex v5 = FirstIndexOfValue;
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1[6] + 8) + 24), v3);
        if (*(uint64_t *)(*(void *)(a1[7] + 8) + 24) >= 1)
        {
          CFIndex v7 = 0;
          do
            fpic_SetPerAssetPerEventTrackedObject(a1[11], v5, v7++, @"PlaybackItem", @"DummyItem");
          while (v7 < *(void *)(*(void *)(a1[7] + 8) + 24));
        }
        CFIndex v8 = 0;
        if (ValueAtIndex)
        {
LABEL_8:
          CFIndex Count = CFArrayGetCount(ValueAtIndex);
          goto LABEL_10;
        }
        while (1)
        {
          CFIndex Count = 0;
LABEL_10:
          if (v8 >= Count) {
            break;
          }
          uint64_t v10 = a1[11];
          CFIndex v11 = v8 + *(void *)(*(void *)(a1[7] + 8) + 24);
          uint64_t v12 = CFArrayGetValueAtIndex(ValueAtIndex, v8);
          fpic_SetPerAssetPerEventTrackedObject(v10, v5, v11, @"PlaybackItem", v12);
          ++v8;
          if (ValueAtIndex) {
            goto LABEL_8;
          }
        }
        *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(void *)(a1[6] + 8) + 24), v3);
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(void *)(a1[5] + 8) + 24), v3--);
        --*(void *)(*(void *)(a1[4] + 8) + 24);
      }
      ++v3;
    }
    while (v3 < *(void *)(*(void *)(a1[4] + 8) + 24));
  }
  if (!*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724)
    || *(unsigned char *)(a1[11] + 860)
    || (CMBaseObjectGetDerivedStorage(), FigCFArrayGetFirstIndexOfValue())
    || (uint64_t v13 = a1[11], (*(unsigned char *)(v13 + 756) & 1) == 0))
  {
    uint64_t result = CMBaseObjectGetDerivedStorage();
    if (*(_DWORD *)(result + 724)) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = v2 < 1;
    }
    if (!v15)
    {
      uint64_t v16 = a1[11];
      if (*(unsigned char *)(v16 + 756))
      {
        uint64_t v17 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)(v16 + 744) = *MEMORY[0x1E4F1F9F8];
        *(void *)(v16 + 760) = *(void *)(v17 + 16);
      }
    }
    return result;
  }
  v18 = *(const void **)(v13 + 736);
  unsigned int v38 = *(_DWORD *)(v13 + 856);
  uint64_t v19 = a1[12];
  uint64_t v20 = a1[10];
  theArray = *(__CFArray **)(*(void *)(a1[9] + 8) + 24);
  *(_OWORD *)&v43.CMTimeValue value = *(_OWORD *)(v13 + 744);
  v43.CMTimeEpoch epoch = *(void *)(v13 + 760);
  CMTime v49 = *(CMTime *)(v13 + 808);
  CMTime v48 = *(CMTime *)(v13 + 832);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMBaseObjectGetDerivedStorage();
  uint64_t v41 = v18;
  CFIndex v22 = FigCFArrayGetFirstIndexOfValue();
  v42 = (CMTime *)DerivedStorage;
  PerEventTrackingCFIndex Count = fpic_GetPerEventTrackingCount(DerivedStorage, v22);
  CMTime v50 = v43;
  if (v22 == -1)
  {
    uint64_t result = FigSignalErrorAt();
    goto LABEL_51;
  }
  CFIndex v24 = PerEventTrackingCount;
  if (PerEventTrackingCount < 1) {
    goto LABEL_40;
  }
  uint64_t v25 = (CMTime *)(DerivedStorage + 456);
  CMTime lhs = v43;
  CMTime rhs = v42[19];
  CMTimeSubtract(&v50, &lhs, &rhs);
  CFIndex v26 = 0;
  while (1)
  {
    PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject((uint64_t)v42, v22, v26, @"PlaybackItem");
    if (PerAssetPerEventTrackedObject) {
      BOOL v28 = PerAssetPerEventTrackedObject == @"DummyItem";
    }
    else {
      BOOL v28 = 1;
    }
    if (v28) {
      goto LABEL_39;
    }
    v29 = PerAssetPerEventTrackedObject;
    uint64_t v30 = CMBaseObjectGetDerivedStorage();
    if (v19) {
      uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t, __CFString *))(v30 + 72))(v20, v19, v29);
    }
    else {
      uint64_t v39 = 0;
    }
    uint64_t v31 = v19;
    fpic_GetEventItemDurationOnAssetTimeline(v20, v19, v41, v22, v26, &lhs);
    CMTimeValue value = lhs.value;
    CMTimeFlags flags = lhs.flags;
    CMTimeScale timescale = lhs.timescale;
    if ((lhs.flags & 1) == 0) {
      goto LABEL_40;
    }
    CMTimeEpoch epoch = lhs.epoch;
    CMTime lhs = v50;
    rhs.CMTimeValue value = value;
    rhs.CMTimeScale timescale = timescale;
    rhs.CMTimeFlags flags = flags;
    rhs.CMTimeEpoch epoch = epoch;
    if (CMTimeCompare(&lhs, &rhs) < 1) {
      break;
    }
    CMTime rhs = v50;
    time1.CMTimeValue value = value;
    time1.CMTimeScale timescale = timescale;
    time1.CMTimeFlags flags = flags;
    time1.CMTimeEpoch epoch = epoch;
    CMTimeSubtract(&lhs, &rhs, &time1);
    CMTime v50 = lhs;
    CFArrayAppendValue(theArray, v29);
    CMTime rhs = *v25;
    time1.CMTimeValue value = value;
    time1.CMTimeScale timescale = timescale;
    time1.CMTimeFlags flags = flags;
    time1.CMTimeEpoch epoch = epoch;
    CMTimeAdd(&lhs, &rhs, &time1);
    *uint64_t v25 = lhs;
    fpic_SetPerAssetPerEventTrackedObject((uint64_t)v42, v22, v26, @"PlaybackItem", @"DummyItem");
    uint64_t v19 = v31;
LABEL_39:
    if (v24 == ++v26) {
      goto LABEL_40;
    }
  }
  if (!v39)
  {
LABEL_40:
    int v34 = 0;
    goto LABEL_41;
  }
  CMTime lhs = v49;
  CMTime rhs = *v25;
  CMTimeSubtract(&time1, &lhs, &rhs);
  CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeMaximum(&v49, &time1, &lhs);
  CMTime lhs = v48;
  CMTime rhs = *v25;
  CMTimeSubtract(&v46, &lhs, &rhs);
  lhs.CMTimeValue value = value;
  lhs.CMTimeScale timescale = timescale;
  lhs.CMTimeFlags flags = flags;
  lhs.CMTimeEpoch epoch = epoch;
  CMTimeMinimum(&v48, &v46, &lhs);
  if (dword_1E9351550)
  {
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterAddWeakListener();
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterAddWeakListener();
  CMTime lhs = v50;
  CMTime rhs = v49;
  CMTime v44 = v48;
  uint64_t result = FPSupport_SetCurrentTimeWithRangeIDAndReason(v39, (long long *)&lhs.value, v38, (long long *)&rhs.value, (long long *)&v44.value);
  if (result)
  {
LABEL_51:
    int v34 = 0;
    goto LABEL_42;
  }
  int v34 = 1;
LABEL_41:
  uint64_t result = 0;
LABEL_42:
  *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = result;
  if (v34 && !*(_DWORD *)(*(void *)(a1[8] + 8) + 24))
  {
    uint64_t v35 = a1[11];
    v36 = (_OWORD *)MEMORY[0x1E4F1F9F8];
    *(void *)(v35 + 760) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v35 + 744) = *v36;
  }
  return result;
}

@end