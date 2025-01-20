@interface NotifyServiceCurrentEvent
@end

@implementation NotifyServiceCurrentEvent

void __fpic_NotifyServiceCurrentEvent_block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v39 = *MEMORY[0x1E4F1F9F8];
  uint64_t v40 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  if (dword_1E9351550 >= 3)
  {
    LODWORD(v43.value) = 0;
    LOBYTE(type.value) = 0;
    os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v3 = CFEqual(*(CFTypeRef *)(a1 + 40), @"ItemStoppedBeingCurrent");
  v4 = (CFTypeRef *)MEMORY[0x1E4F1FA58];
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
LABEL_7:
    char v7 = 0;
LABEL_8:
    fpic_PruneCurrentEvents(v5, v6, v7);
    goto LABEL_9;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"ItemBecameCurrent"))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"FailedToBecomeReadyForInspection")
    || CFEqual(*(CFTypeRef *)(a1 + 40), @"FailedToBecomeReadyForPlayback"))
  {
    fpic_eventItemReadyStateChange(*(void *)(a1 + 32), *(void *)(a1 + 48), 0);
    goto LABEL_9;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"FailedToPlayToEnd"))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    char v7 = 1;
    goto LABEL_8;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 40), @"RateDidChange"))
  {
    fpic_NoticeRateChange(*(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"IsAirPlayVideoActiveDidChange"))
  {
    fpic_HandleAirPlayVideoActiveDidChange(*(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"SelectedMediaOptionsDidChange"))
  {
    fpic_mediaSelectionsChanged(*(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"CoordinationIdentifierChanged"))
  {
    fpic_coordinationIdentifierChanged(*(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"ReadyForInspection"))
  {
    fpic_eventItemReadyStateChange(*(void *)(a1 + 32), *(void *)(a1 + 48), 1);
    fpic_setMediaSelectionsForCurrentEventItems(*(void *)(a1 + 32));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"ReachedTimeToPauseBuffering") {
         || CFEqual(*(CFTypeRef *)(a1 + 40), @"AlmostReachedTimeToPausePlayback")
  }
         || CFEqual(*(CFTypeRef *)(a1 + 40), @"ReachedTimeToPausePlayback")
         || CFEqual(*(CFTypeRef *)(a1 + 40), @"SnappedTimeToPausePlayback"))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), @"ReachedTimeToPauseBuffering")) {
      fpic_checkForSnappedTimeToPauseBuffering(*(void *)(a1 + 32));
    }
    fpic_checkForSnapOut(*(void *)(a1 + 32));
    if (CFEqual(*(CFTypeRef *)(a1 + 40), @"AlmostReachedTimeToPausePlayback"))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), @"FigTime");
      uint64_t v21 = *(void *)(a1 + 32);
      CMTimeMakeFromDictionary(&v38, Value);
      fpic_schedulePrimaryToInterstitialTransition(v21, (long long *)&v38.value);
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 40), @"ReachedTimeToPausePlayback"))
    {
      uint64_t v22 = *(void *)(a1 + 64);
      if (*(void *)(v22 + 152))
      {
        if (*(unsigned char *)(v22 + 908))
        {
          CFDictionaryRef v23 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 56), @"FigTime");
          memset(outOfClockOrTimebaseAnchorTime, 0, 24);
          CMTimeMakeFromDictionary((CMTime *)outOfClockOrTimebaseAnchorTime, v23);
          uint64_t v24 = *(void *)(a1 + 32);
          CMTime outRelativeToClockOrTimebaseAnchorTime = *(CMTime *)outOfClockOrTimebaseAnchorTime;
          fpic_CheckIfPlayheadHasReachedPrimaryPlaybackGate(v24, &outRelativeToClockOrTimebaseAnchorTime);
        }
      }
    }
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"SeekDidComplete") {
         || CFEqual(*(CFTypeRef *)(a1 + 40), @"SeekWasCanceled"))
  }
  {
    fpic_HandleSeekDidFinishNotification(*(void *)(a1 + 32), *(void *)(a1 + 40), *(const void **)(a1 + 56), (uint64_t)&v39);
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"DidPlayToTheEnd"))
  {
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 64);
    if (v25 == *(void *)(v26 + 152) && !*(unsigned char *)(v26 + 977))
    {
      *(unsigned char *)(v26 + 977) = 1;
      if (*(unsigned char *)(v26 + 978))
      {
        if (*(unsigned char *)(v26 + 232) || *(unsigned char *)(v26 + 233))
        {
          uint64_t v27 = v26 + 200;
          fpic_CurrentItemMoment(v25, (uint64_t)outOfClockOrTimebaseAnchorTime);
          long long v28 = *(_OWORD *)&outOfClockOrTimebaseAnchorTime[16];
          *(_OWORD *)uint64_t v27 = *(_OWORD *)outOfClockOrTimebaseAnchorTime;
          *(_OWORD *)(v27 + 16) = v28;
          *(void *)(v27 + 32) = v46;
          uint64_t v29 = *(void *)(a1 + 64);
          long long v30 = *(_OWORD *)(v29 + 216);
          *(_OWORD *)outOfClockOrTimebaseAnchorTime = *(_OWORD *)(v29 + 200);
          *(_OWORD *)&outOfClockOrTimebaseAnchorTime[16] = v30;
          v46 = *(NSObject ***)(v29 + 232);
          CFStringRef MomentDesc = fpic_CreateMomentDesc((uint64_t)outOfClockOrTimebaseAnchorTime);
          if (MomentDesc) {
            CFRelease(MomentDesc);
          }
          v32 = **(NSObject ***)(a1 + 64);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __fpic_NotifyServiceCurrentEvent_block_invoke_145;
          block[3] = &__block_descriptor_40_e5_v8__0l;
          block[4] = *(void *)(a1 + 32);
          dispatch_sync(v32, block);
        }
      }
    }
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"EndTimeChanged"))
  {
    fpic_HandleEndTimeChangedNotification(*(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), *v4))
  {
    fpic_ReportInterstitialPlaybackDeadTime(*(void *)(a1 + 32), *(OpaqueCMTimebase **)(a1 + 48));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), @"PlayableRangeChanged"))
  {
    v33 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
    uint64_t v34 = FigCFDictionaryGetValue();
    fpic_updateEventLoadedTimeIntervals(*(void *)(a1 + 32), (uint64_t)v33, *(void *)(a1 + 48), v34);
    if (v33) {
      CFRelease(v33);
    }
  }
LABEL_9:
  int v8 = CFEqual(*(CFTypeRef *)(a1 + 40), *v4);
  v9 = (CFTypeRef *)MEMORY[0x1E4F1FA68];
  if (v8 || CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E4F1FA68]))
  {
    v10 = *(OpaqueCMTimebase **)(a1 + 48);
    if (v10 == *(OpaqueCMTimebase **)(*(void *)(a1 + 64) + 1048))
    {
      FigCFDictionaryGetCMTimeIfPresent();
      long long v35 = v39;
      uint64_t v36 = v40;
      memset(&v43, 0, sizeof(v43));
      CMClockOrTimebaseRef v11 = CMTimebaseCopySource(v10);
      if (v11)
      {
        v12 = v11;
        memset(outOfClockOrTimebaseAnchorTime, 0, 24);
        memset(&outRelativeToClockOrTimebaseAnchorTime, 0, sizeof(outRelativeToClockOrTimebaseAnchorTime));
        CMSyncGetRelativeRateAndAnchorTime(v10, v11, 0, (CMTime *)outOfClockOrTimebaseAnchorTime, &outRelativeToClockOrTimebaseAnchorTime);
        CMSyncGetTime(&v43, v12);
        if (CMTimebaseGetRate(v10) > 0.0)
        {
          CMTime type = outRelativeToClockOrTimebaseAnchorTime;
          CMTime time2 = v43;
          if (CMTimeCompare(&type, &time2) >= 1)
          {
            long long v35 = *(_OWORD *)outOfClockOrTimebaseAnchorTime;
            uint64_t v36 = *(void *)&outOfClockOrTimebaseAnchorTime[16];
          }
        }
        CFRelease(v12);
      }
      long long v39 = v35;
      uint64_t v40 = v36;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    Boolean v14 = CFEqual(*(CFTypeRef *)(a1 + 40), *v9);
    DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
    v16 = *DerivedStorage;
    *(void *)outOfClockOrTimebaseAnchorTime = MEMORY[0x1E4F143A8];
    *(void *)&outOfClockOrTimebaseAnchorTime[8] = 3221225472;
    *(void *)&outOfClockOrTimebaseAnchorTime[16] = __fpic_checkScheduledTransition_block_invoke;
    *(void *)&outOfClockOrTimebaseAnchorTime[24] = &__block_descriptor_57_e5_v8__0l;
    v46 = DerivedStorage;
    uint64_t v47 = v13;
    v48 = v10;
    Boolean v49 = v14;
    dispatch_sync(v16, outOfClockOrTimebaseAnchorTime);
  }
  uint64_t v17 = *(void *)(a1 + 32);
  *(_OWORD *)outOfClockOrTimebaseAnchorTime = v39;
  *(void *)&outOfClockOrTimebaseAnchorTime[16] = v40;
  fpic_ServiceCurrentEvent(v17, (long long *)outOfClockOrTimebaseAnchorTime);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v18 = *(const void **)(a1 + 56);
  if (v18) {
    CFRelease(v18);
  }
  v19 = *(const void **)(a1 + 48);
  if (v19) {
    CFRelease(v19);
  }
}

void __fpic_NotifyServiceCurrentEvent_block_invoke_145(uint64_t a1)
{
}

@end