@interface EnsureCurrentEventPlayoutLimitApplied
@end

@implementation EnsureCurrentEventPlayoutLimitApplied

void __fpic_EnsureCurrentEventPlayoutLimitApplied_block_invoke(void *a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[6];
  if ((*(unsigned char *)(v1 + 884) & 1) == 0) {
    return;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 600));
  if (Count < 1) {
    return;
  }
  CFIndex v4 = Count;
  CFIndex v5 = 0;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v6 = @"PlaybackItem";
  CFIndex v35 = Count;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[6] + 600), v5);
    uint64_t v7 = (*(uint64_t (**)(void, void))(a1[6] + 80))(a1[7], a1[8]);
    memset(&v42, 0, sizeof(v42));
    FigPlayerInterstitialEventGetPlayoutLimit(v7, (uint64_t)&v42);
    if ((v42.flags & 1) == 0) {
      goto LABEL_38;
    }
    memset(&v41, 0, sizeof(v41));
    v8 = (CMTime *)a1[6];
    CMTime lhs = v8[17];
    CMTime rhs = v8[19];
    CMTimeAdd(&v41, &lhs, &rhs);
    PerEventTrackingCFIndex Count = fpic_GetPerEventTrackingCount(a1[6], v5);
    CFIndex v10 = PerEventTrackingCount - 1;
    if (PerEventTrackingCount < 1) {
      goto LABEL_37;
    }
    CFIndex v11 = PerEventTrackingCount;
    CFIndex v12 = 0;
    while (1)
    {
      PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(a1[6], v5, v12, v6);
      uint64_t v14 = fpic_UnwrapPlaybackItem(a1[7], PerAssetPerEventTrackedObject, a1[8]);
      if (PerAssetPerEventTrackedObject != @"DummyItem") {
        break;
      }
LABEL_15:
      if (v11 == ++v12) {
        goto LABEL_37;
      }
    }
    uint64_t v15 = v14;
    fpic_GetEventItemDurationOnEventTimeline(a1[7], a1[8], ValueAtIndex, v5, v12, (uint64_t)&lhs);
    CMTimeValue value = lhs.value;
    CMTimeFlags flags = lhs.flags;
    CMTimeScale timescale = lhs.timescale;
    if (v15) {
      BOOL v17 = (lhs.flags & 0x1D) == 1;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17) {
      goto LABEL_37;
    }
    v18 = v6;
    CMTimeEpoch epoch = lhs.epoch;
    memset(&v40, 0, sizeof(v40));
    CMTime lhs = v42;
    CMTime rhs = v41;
    CMTimeSubtract(&v40, &lhs, &rhs);
    CMTime lhs = v40;
    rhs.CMTimeValue value = value;
    rhs.CMTimeScale timescale = timescale;
    rhs.CMTimeFlags flags = flags;
    rhs.CMTimeEpoch epoch = epoch;
    if (CMTimeCompare(&lhs, &rhs) > 0)
    {
      CMTime rhs = v41;
      v38.CMTimeValue value = value;
      v38.CMTimeScale timescale = timescale;
      v38.CMTimeFlags flags = flags;
      v38.CMTimeEpoch epoch = epoch;
      CMTimeAdd(&lhs, &rhs, &v38);
      CMTime v41 = lhs;
      v6 = v18;
      goto LABEL_15;
    }
    CMTime lhs = v40;
    CFAllocatorRef v20 = allocator;
    CFDictionaryRef v21 = CMTimeCopyAsDictionary(&lhs, allocator);
    CFDictionaryRef v22 = v21;
    if (dword_1E9351550)
    {
      CFDictionaryRef v37 = v21;
      LODWORD(v38.value) = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v24 = v38.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        CMTime lhs = v40;
        Float64 Seconds = CMTimeGetSeconds(&lhs);
        lhs.CMTimeValue value = value;
        lhs.CMTimeScale timescale = timescale;
        lhs.CMTimeFlags flags = flags;
        lhs.CMTimeEpoch epoch = epoch;
        Float64 v27 = CMTimeGetSeconds(&lhs);
        LODWORD(rhs.value) = 136316162;
        *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsureCurrentEventPlayoutLimitApplied_block_invoke";
        LOWORD(rhs.flags) = 2048;
        *(void *)((char *)&rhs.flags + 2) = v15;
        HIWORD(rhs.epoch) = 1024;
        int v44 = v12;
        __int16 v45 = 2048;
        Float64 v46 = Seconds;
        __int16 v47 = 2048;
        Float64 v48 = v27;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CFAllocatorRef v20 = allocator;
      CFDictionaryRef v22 = v37;
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(v15);
    uint64_t v29 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v29) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
    v6 = v18;
    v31 = *(void (**)(uint64_t, __CFString *, CFDictionaryRef))(v30 + 56);
    if (v31) {
      v31(FigBaseObject, @"EndTime", v22);
    }
    if (v22) {
      CFRelease(v22);
    }
    while (v12 < v10)
    {
      v32 = fpic_GetPerAssetPerEventTrackedObject(a1[6], v5, v10, v18);
      v33 = *(__CFArray **)(*(void *)(a1[4] + 8) + 24);
      if (!v33)
      {
        *(void *)(*(void *)(a1[4] + 8) + 24) = CFArrayCreateMutable(v20, 0, MEMORY[0x1E4F1D510]);
        v33 = *(__CFArray **)(*(void *)(a1[4] + 8) + 24);
        if (!v33)
        {
          *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = FigSignalErrorAt();
          return;
        }
      }
      if (v32) {
        CFArrayAppendValue(v33, v32);
      }
      fpic_RemovePerAssetPerEventTrackedObjects(a1[6], v5, v10--);
    }
LABEL_37:
    CFIndex v4 = v35;
LABEL_38:
    ++v5;
  }
  while (v5 != v4);
}

@end