@interface EstablishCurrentPrimaryItem
@end

@implementation EstablishCurrentPrimaryItem

void __fpic_EstablishCurrentPrimaryItem_block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v2 = *(const void **)(a1 + 40);
  v3 = *(const void **)(*(void *)(a1 + 48) + 152);
  if (v2 != v3 && v3 != 0)
  {
    fpic_DisengageFromPrimaryItem(*(const void **)(a1 + 56), *(void *)(a1 + 64), (CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    v2 = *(const void **)(a1 + 40);
    v3 = *(const void **)(*(void *)(a1 + 48) + 152);
  }
  if (v2) {
    BOOL v5 = v2 == v3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_110;
  }
  value = (const void *)*MEMORY[0x1E4F1CFC8];
  v93[0].value = *MEMORY[0x1E4F1CFC8];
  uint64_t v7 = *MEMORY[0x1E4F1CF80];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject(v2);
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t, CMTime *))(v10 + 48);
  if (!v11
    || ((int v12 = v11(FigBaseObject, @"BasicsReadyForInspection", v7, v93), value = (const void *)v93[0].value, !v12)
      ? (BOOL v13 = *MEMORY[0x1E4F1CFD0] == v93[0].value)
      : (BOOL v13 = 0),
        !v13))
  {
    int v14 = 0;
    if (!value) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v91[0] = 0;
  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  v32 = *(uint64_t (**)(const void *, CFTypeRef *))(v24 + 152);
  if (v32)
  {
    int v33 = v32(v2, v91);
    int v14 = 0;
    CFTypeRef v34 = v91[0];
    if (!v33 && v91[0])
    {
      LODWORD(v90.value) = 0;
      uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v35) {
        uint64_t v36 = v35;
      }
      else {
        uint64_t v36 = 0;
      }
      v79 = *(unsigned int (**)(CFTypeRef, __CFString *, CMTime *, void, void))(v36 + 8);
      if (v79)
      {
        if (v79(v34, @"MediaSelectionArray", &v90, 0, 0)) {
          BOOL v80 = 0;
        }
        else {
          BOOL v80 = LODWORD(v90.value) == 2;
        }
        int v14 = v80;
      }
      else
      {
        int v14 = 0;
      }
      CFTypeRef v34 = v91[0];
    }
    if (v34) {
      CFRelease(v34);
    }
  }
  else
  {
    int v14 = 0;
  }
  value = (const void *)v93[0].value;
  if (v93[0].value) {
LABEL_19:
  }
    CFRelease(value);
LABEL_20:
  v2 = *(const void **)(a1 + 40);
  if (v14)
  {
    v15 = *(const void **)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    v90.value = 0;
    uint64_t PrimaryPlayerAndCopyWrapper = fpic_GetPrimaryPlayerAndCopyWrapper((uint64_t)v15, &v90);
    CFTypeRef v88 = 0;
    CFTypeRef v89 = 0;
    CFTypeRef cf = 0;
    CFTypeRef v87 = 0;
    float v85 = 1.0;
    v20 = *(const void **)(DerivedStorage + 152);
    if (v20 != v2)
    {
      uint64_t v21 = PrimaryPlayerAndCopyWrapper;
      if (v20) {
        fpic_DisengageFromPrimaryItem(v15, v16, (CFTypeRef *)(v17 + 24));
      }
      *(void *)(DerivedStorage + 1020) = 0;
      *(_OWORD *)(DerivedStorage + 1000) = 0u;
      if (v2) {
        CFTypeRef v22 = CFRetain(v2);
      }
      else {
        CFTypeRef v22 = 0;
      }
      *(void *)(DerivedStorage + 152) = v22;
      if (dword_1E9351550)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v26) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = 0;
      }
      v28 = *(unsigned int (**)(const void *, CFTypeRef *))(v27 + 152);
      if (v28 && !v28(v2, &cf) && cf)
      {
        uint64_t CMBaseObject = FigAssetGetCMBaseObject(cf);
        uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v30) {
          uint64_t v31 = v30;
        }
        else {
          uint64_t v31 = 0;
        }
        v37 = *(void (**)(uint64_t, __CFString *, uint64_t, uint64_t))(v31 + 48);
        if (v37) {
          v37(CMBaseObject, @"assetProperty_InstanceUUID", v7, DerivedStorage + 160);
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      uint64_t v38 = FigPlaybackItemGetFigBaseObject(v2);
      uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v39) {
        uint64_t v40 = v39;
      }
      else {
        uint64_t v40 = 0;
      }
      v41 = *(void (**)(uint64_t, __CFString *, uint64_t, CFTypeRef *))(v40 + 48);
      if (v41) {
        v41(v38, @"Timebase", v7, &v89);
      }
      uint64_t v42 = FigPlaybackItemGetFigBaseObject(v2);
      uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v43) {
        uint64_t v44 = v43;
      }
      else {
        uint64_t v44 = 0;
      }
      v45 = *(void (**)(uint64_t, __CFString *, uint64_t, CFTypeRef *))(v44 + 48);
      if (v45) {
        v45(v42, @"SelectedMediaArray", v7, &v88);
      }
      v46 = *(const void **)(DerivedStorage + 984);
      CFTypeRef v47 = v88;
      *(void *)(DerivedStorage + 984) = v88;
      if (v47) {
        CFRetain(v47);
      }
      if (v46) {
        CFRelease(v46);
      }
      uint64_t v48 = FigPlaybackItemGetFigBaseObject(v2);
      uint64_t v49 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v49) {
        uint64_t v50 = v49;
      }
      else {
        uint64_t v50 = 0;
      }
      v51 = *(void (**)(uint64_t, __CFString *, uint64_t, CFTypeRef *))(v50 + 48);
      if (v51) {
        v51(v48, @"CoordinationIdentifier", v7, &v87);
      }
      v52 = *(const void **)(DerivedStorage + 168);
      CFTypeRef v53 = v87;
      *(void *)(DerivedStorage + 168) = v87;
      if (v53) {
        CFRetain(v53);
      }
      if (v52) {
        CFRelease(v52);
      }
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterAddWeakListener();
      if (v89)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        FigNotificationCenterAddWeakListener();
        CMNotificationCenterGetDefaultLocalCenter();
        FigNotificationCenterAddWeakListener();
        *(void *)(DerivedStorage + 1048) = CFRetain(v89);
        CFRelease(v89);
      }
      else
      {
        v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v55 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v55) {
        uint64_t v56 = v55;
      }
      else {
        uint64_t v56 = 0;
      }
      v57 = *(unsigned int (**)(uint64_t, float *))(v56 + 48);
      if (v57 && !v57(v21, &v85) && v85 > 0.0) {
        *(float *)(DerivedStorage + 712) = v85;
      }
      uint64_t v58 = *(void *)(DerivedStorage + 152);
      CMBaseObjectGetDerivedStorage();
      uint64_t v59 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v59)
      {
        v60 = (const void *)v59;
        CFArrayRef v61 = (const __CFArray *)FigCFDictionaryCopyArrayOfKeys();
        CFIndex v62 = 0;
        while (1)
        {
          CFIndex v63 = v61 ? CFArrayGetCount(v61) : 0;
          if (v62 >= v63) {
            break;
          }
          ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v61, v62);
          uint64_t v65 = CMBaseObjectGetDerivedStorage();
          uint64_t v66 = 0;
          if (ValueAtIndex && ValueAtIndex != @"DummyItem") {
            uint64_t v66 = (*(uint64_t (**)(const void *, const void *, __CFString *))(v65 + 72))(v15, v60, ValueAtIndex);
          }
          ++v62;
          if (v66 == v58)
          {
            uint64_t v67 = CMBaseObjectGetDerivedStorage();
            CFArrayRef v68 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(v67 + 176), ValueAtIndex);
            if (!v61) {
              goto LABEL_98;
            }
            goto LABEL_97;
          }
        }
        ValueAtIndex = 0;
        CFArrayRef v68 = 0;
        if (!v61) {
          goto LABEL_98;
        }
LABEL_97:
        CFRelease(v61);
LABEL_98:
        CFRelease(v60);
        if (v68 && CFArrayGetCount(v68) >= 1)
        {
          FigCFArrayAppendArray();
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(DerivedStorage + 176), ValueAtIndex);
          if (dword_1E9351550)
          {
            v69 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          fpic_PostNotification(DerivedStorage, @"fpiEventsDidChange", v15, 0);
        }
      }
      fpic_UpdatePlaybackItemEventList((uint64_t)v15, *(void *)(DerivedStorage + 152));
      fpic_ReplaceNetworkURLsWithOfflineURLs(v15, v16);
      if (v87) {
        CFRelease(v87);
      }
    }
    if (v88) {
      CFRelease(v88);
    }
    if (v90.value) {
      CFRelease((CFTypeRef)v90.value);
    }
    fpic_SwapToInterstitialPlayerLayerIfPrerollDetected(*(void *)(a1 + 56), *(void *)(a1 + 64));
    v2 = *(const void **)(a1 + 40);
  }
LABEL_110:
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v70 = *(void *)(a1 + 48);
  uint64_t v71 = *(void *)(v70 + 152);
  if (v71 && !*(unsigned char *)(v70 + 974))
  {
    *(_OWORD *)v91 = *MEMORY[0x1E4F1F9F8];
    uint64_t v92 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    uint64_t v72 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v73 = v72 ? v72 : 0;
    v74 = *(unsigned int (**)(uint64_t, CFTypeRef *))(v73 + 16);
    if (v74)
    {
      if (!v74(v71, v91) && (BYTE4(v91[1]) & 1) != 0)
      {
        if ((BYTE4(v91[1]) & 0x10) != 0)
        {
          memset(v93, 0, 24);
          fpic_GetSeekableRange(*(void *)(*(void *)(a1 + 48) + 152), 0, v93, &v90);
          uint64_t v77 = *(void *)(a1 + 48);
          if ((v93[0].flags & 1) == 0)
          {
            int v78 = *(unsigned __int8 *)(v77 + 974);
LABEL_141:
            if (v78 && dword_1E9351550 >= 2)
            {
              LODWORD(v89) = 0;
              LOBYTE(v88) = 0;
              v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v82 = v89;
              if (os_log_type_enabled(v81, (os_log_type_t)v88)) {
                unsigned int v83 = v82;
              }
              else {
                unsigned int v83 = v82 & 0xFFFFFFFE;
              }
              if (v83)
              {
                CMTimeFlags v84 = *(unsigned __int8 *)(*(void *)(a1 + 48) + 973);
                LODWORD(v90.value) = 136315394;
                *(CMTimeValue *)((char *)&v90.value + 4) = (CMTimeValue)"fpic_EstablishCurrentPrimaryItem_block_invoke";
                LOWORD(v90.flags) = 1024;
                *(CMTimeFlags *)((char *)&v90.flags + 2) = v84;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            return;
          }
          v75 = (__int16 *)(v77 + 973);
          __int16 v76 = 257;
        }
        else
        {
          v75 = (__int16 *)(*(void *)(a1 + 48) + 973);
          __int16 v76 = 256;
        }
        __int16 *v75 = v76;
        int v78 = 1;
        goto LABEL_141;
      }
    }
  }
}

@end