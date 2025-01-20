@interface EnsureNextEventHasAssets
@end

@implementation EnsureNextEventHasAssets

void __fpic_EnsureNextEventHasAssets_block_invoke(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_96;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v2 + 232) && !*(unsigned char *)(v2 + 233)) {
    goto LABEL_96;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned __int8 *)(DerivedStorage + 352) | *(unsigned __int8 *)(DerivedStorage + 353)) {
    goto LABEL_96;
  }
  if (fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(void *)(a1 + 48))) {
    goto LABEL_96;
  }
  if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728)) {
    goto LABEL_96;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v4 + 860)) {
    goto LABEL_96;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v4 + 184));
  CFTypeRef v73 = 0;
  uint64_t v5 = (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 64))(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 40) + 40));
  v6 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime v72 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  fpic_AccumulateDuration((CMTime *)(*(void *)(a1 + 40) + 384), MEMORY[0x1E4F1FA48]);
  fpic_AccumulateDuration((CMTime *)(*(void *)(a1 + 40) + 432), v6);
  if (v5) {
    fpic_CopyNextItem(v5, &v73);
  }
  if (CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 600)) < 1)
  {
    CFIndex FirstIndexOfValue = 0;
  }
  else
  {
    CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 600), 0);
    CMBaseObjectGetDerivedStorage();
    CFIndex FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
  }
  if (FirstIndexOfValue >= Count)
  {
    Mutable = 0;
    goto LABEL_55;
  }
  theArray = 0;
  int v63 = 0;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 184), FirstIndexOfValue);
    uint64_t v9 = (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 40) + 80))(*(void *)(a1 + 48), *(void *)(a1 + 56), ValueAtIndex);
    uint64_t v10 = *(void *)(a1 + 40);
    fpic_EventDateTimeMoment(v9, (uint64_t)v71);
    long long v11 = *(_OWORD *)(v10 + 216);
    *(_OWORD *)lhs = *(_OWORD *)(v10 + 200);
    *(_OWORD *)&lhs[16] = v11;
    uint64_t v77 = *(void *)(v10 + 232);
    LODWORD(v10) = fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)v71);
    unsigned int v12 = FigPlayerInterstitialEventIsPostRoll(v9);
    if (v10 | v12)
    {
      unsigned int v13 = v12;
      if (!CFSetContainsValue(*(CFSetRef *)(*(void *)(a1 + 40) + 632), ValueAtIndex))
      {
        CMBaseObjectGetDerivedStorage();
        CFIndex v14 = FigCFArrayGetFirstIndexOfValue();
        memset(&cf, 0, sizeof(cf));
        fpic_PredictEventDurationOnPrimary(*(void *)(a1 + 48), ValueAtIndex, *(void *)(a1 + 56), (uint64_t)&cf);
        if (cf.flags)
        {
          *(CMTime *)lhs = v72;
          CMTime rhs = cf;
          CMTimeAdd(&v72, (CMTime *)lhs, &rhs);
        }
        if (v14 != -1)
        {
          if (!v5) {
            goto LABEL_17;
          }
          if (!v73) {
            goto LABEL_17;
          }
          CFIndex PerEventTrackingCount = fpic_GetPerEventTrackingCount(*(void *)(a1 + 40), v14);
          if (PerEventTrackingCount < 1) {
            goto LABEL_17;
          }
          CFIndex v16 = PerEventTrackingCount;
          CFIndex v17 = 0;
          while (2)
          {
            PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(*(void *)(a1 + 40), v14, v17, @"PlaybackItem");
            uint64_t v19 = fpic_UnwrapPlaybackItem(*(void *)(a1 + 48), PerAssetPerEventTrackedObject, *(void *)(a1 + 56));
            if (PerAssetPerEventTrackedObject != @"DummyItem")
            {
              CFTypeRef v20 = (CFTypeRef)v19;
              CFIndex v66 = v16;
              CFIndex v21 = v14;
              while (1)
              {
                CFTypeRef v22 = v73;
                if (v20 == v73 || v73 == 0) {
                  break;
                }
                CFTypeRef v24 = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 864);
                if (v24) {
                  BOOL v25 = v24 == v22;
                }
                else {
                  BOOL v25 = 0;
                }
                if (!v25)
                {
                  *(_DWORD *)v69 = 0;
                  type[0] = OS_LOG_TYPE_DEFAULT;
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                fpic_CopyNextItem(v5, &v73);
              }
              if (v20 == v73)
              {
                fpic_CopyNextItem(v5, &v73);
                CFIndex v14 = v21;
              }
              else
              {
                CFIndex v14 = v21;
                if (v73)
                {
                  *(_DWORD *)v69 = 0;
                  type[0] = OS_LOG_TYPE_DEFAULT;
                  v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  fpic_RemovePerAssetPerEventTrackedObjects(*(void *)(a1 + 40), v21, v17--);
                  CFIndex v16 = v66 - 1;
                  goto LABEL_43;
                }
              }
              CFIndex v16 = v66;
            }
LABEL_43:
            if (++v17 >= v16) {
              goto LABEL_17;
            }
            continue;
          }
        }
        if (theArray || (theArray = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E4F1D510])) != 0)
        {
          memset(lhs, 0, 24);
          uint64_t v28 = *(void *)(a1 + 48);
          uint64_t v29 = *(void *)(a1 + 56);
          CMTime rhs = v72;
          fpic_GetOffsetForEvent(v28, (uint64_t)ValueAtIndex, (long long *)&rhs.value, v29, (uint64_t)lhs);
          if (v13)
          {
            int v63 = 1;
          }
          else if (lhs[12])
          {
            CFArrayAppendValue(theArray, ValueAtIndex);
          }
          else if (cf.flags)
          {
            v30 = (CMTime *)(*(void *)(a1 + 40) + 384);
            CMTime rhs = cf;
            fpic_AccumulateDuration(v30, &rhs);
          }
        }
        else
        {
          theArray = 0;
        }
      }
    }
LABEL_17:
    ++FirstIndexOfValue;
  }
  while (FirstIndexOfValue != Count);
  if (theArray)
  {
    BOOL v58 = CFArrayGetCount(theArray) == 0;
    Mutable = theArray;
  }
  else
  {
    Mutable = 0;
    BOOL v58 = 1;
  }
  if (v58
    && v63
    && (!CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 600)) || *(unsigned char *)(*(void *)(a1 + 40) + 978)))
  {
    if (!theArray) {
      Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E4F1D510]);
    }
    if (Count >= 1 && Mutable)
    {
      for (CFIndex i = 0; i < Count; ++i)
      {
        v60 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 184), i);
        uint64_t v61 = (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 40) + 80))(*(void *)(a1 + 48), *(void *)(a1 + 56), v60);
        if (FigPlayerInterstitialEventIsPostRoll(v61))
        {
          CMBaseObjectGetDerivedStorage();
          if (FigCFArrayGetFirstIndexOfValue() == -1)
          {
            if (!*(unsigned char *)(*(void *)(a1 + 40) + 978)) {
              fpic_AssertPostRoll(*(void *)(a1 + 48), *(void *)(a1 + 64));
            }
            CFArrayAppendValue(Mutable, v60);
          }
        }
      }
    }
  }
LABEL_55:
  int v32 = 0;
  CFIndex v33 = 0;
  if (!Mutable) {
    goto LABEL_58;
  }
LABEL_56:
  if (v33 < CFArrayGetCount(Mutable))
  {
    while (1)
    {
      v34 = CFArrayGetValueAtIndex(Mutable, v33);
      uint64_t v35 = (*(uint64_t (**)(void, void, const void *))(*(void *)(a1 + 40) + 80))(*(void *)(a1 + 48), *(void *)(a1 + 56), v34);
      v36 = FigPlayerInterstitialEventCopyInterstitialAssetURLs(v35);
      CFArrayRef v37 = (const __CFArray *)v36;
      if (v36) {
        CFIndex v38 = CFArrayGetCount((CFArrayRef)v36);
      }
      else {
        CFIndex v38 = 0;
      }
      CFIndex v39 = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 600));
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1 + 40) + 600), v34);
      if (v38 >= 1)
      {
        for (CFIndex j = 0; j != v38; ++j)
        {
          uint64_t v41 = *(void *)(a1 + 40);
          v42 = CFArrayGetValueAtIndex(v37, j);
          fpic_SetPerAssetPerEventTrackedObject(v41, v39, j, @"AssetURL", v42);
        }
        goto LABEL_65;
      }
      *(void *)v69 = 0;
      cf.value = 0;
      CFTypeRef v67 = 0;
      *(void *)type = 0;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fpic_ScheduleAssetListReadForEvent(*(void *)(a1 + 48), *(void *)(a1 + 56), v34, 0, &cf, v69, type, (CMBlockBufferRef *)&v67);
      value = (const void *)cf.value;
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        break;
      }
      if (cf.value)
      {
        fpic_AddNewHttpReq(*(void *)(a1 + 48), v34, (const void *)cf.value, v67);
LABEL_80:
        CFRelease(value);
LABEL_81:
        CFTypeRef v48 = v67;
        if (!v67) {
          goto LABEL_83;
        }
LABEL_82:
        CFRelease(v48);
        goto LABEL_83;
      }
      if (!*(void *)v69) {
        goto LABEL_81;
      }
      CFTypeRef v48 = v67;
      fpic_AddNewCustomURLReq(*(void *)(a1 + 48), v34, *(const void **)v69, *(uint64_t *)type, v67);
      if (v48) {
        goto LABEL_82;
      }
LABEL_83:
      if (*(void *)v69) {
        CFRelease(*(CFTypeRef *)v69);
      }
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v50 = *(void *)(a1 + 40);
        int v51 = *(_DWORD *)(v50 + 1024) + 1;
        *(_DWORD *)(v50 + 1024) = v51;
        fpic_setItemPropertyInt32(*(void *)(v50 + 152), @"interstitialPlaybackFailureCount", v51);
        fpic_ClearAssetListResponseAfterAssetListReadFailure(*(const void **)(a1 + 48), v34, *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        fpic_RemoveEvent(*(const void **)(a1 + 48), v34, 0, 0, 0);
        --v33;
        goto LABEL_87;
      }
LABEL_65:
      if (v37) {
        CFRelease(v37);
      }
      if (dword_1E9351550)
      {
        LODWORD(cf.value) = 0;
        v69[0] = OS_LOG_TYPE_DEFAULT;
        v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v44 = cf.value;
        if (os_log_type_enabled(v43, v69[0])) {
          unsigned int v45 = v44;
        }
        else {
          unsigned int v45 = v44 & 0xFFFFFFFE;
        }
        if (v45)
        {
          uint64_t v46 = *(void *)(a1 + 48);
          LODWORD(rhs.value) = 136315650;
          *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsureNextEventHasAssets_block_invoke";
          LOWORD(rhs.flags) = 2048;
          *(void *)((char *)&rhs.flags + 2) = v46;
          HIWORD(rhs.epoch) = 2112;
          uint64_t v75 = v35;
          _os_log_send_and_compose_impl();
        }
        int v32 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        int v32 = 1;
      }
LABEL_87:
      ++v33;
      if (Mutable) {
        goto LABEL_56;
      }
LABEL_58:
      if ((v33 & 0x8000000000000000) == 0) {
        goto LABEL_92;
      }
    }
    if (cf.value) {
      goto LABEL_80;
    }
    goto LABEL_81;
  }
  CFRelease(Mutable);
LABEL_92:
  if (v32) {
    fpic_GatePrimaryPlaybackAtCurrentEvent(*(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  if (v73) {
    CFRelease(v73);
  }
LABEL_96:
  uint64_t v52 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v52 + 975))
  {
    if ((*(unsigned char *)(v52 + 908) & 1) != 0 && !CFArrayGetCount(*(CFArrayRef *)(v52 + 600)))
    {
      uint64_t v53 = CMBaseObjectGetDerivedStorage();
      if (!(*(unsigned __int8 *)(v53 + 352) | *(unsigned __int8 *)(v53 + 353))
        && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728)
        && !*(unsigned char *)(*(void *)(a1 + 40) + 860))
      {
        if (dword_1E9351550)
        {
          LODWORD(v72.value) = 0;
          LOBYTE(cf.value) = 0;
          v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v55 = v72.value;
          if (os_log_type_enabled(v54, cf.value)) {
            unsigned int v56 = v55;
          }
          else {
            unsigned int v56 = v55 & 0xFFFFFFFE;
          }
          if (v56)
          {
            uint64_t v57 = *(void *)(a1 + 48);
            LODWORD(rhs.value) = 136315394;
            *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsureNextEventHasAssets_block_invoke";
            LOWORD(rhs.flags) = 2048;
            *(void *)((char *)&rhs.flags + 2) = v57;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_UngatePrimaryPlayback(*(void *)(a1 + 48));
      }
    }
  }
}

@end