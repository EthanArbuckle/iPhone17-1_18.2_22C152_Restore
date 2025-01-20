@interface UpdateCurrentSessionFromLikelyDestinations
@end

@implementation UpdateCurrentSessionFromLikelyDestinations

void __routingSessionManager_UpdateCurrentSessionFromLikelyDestinations_block_invoke(uint64_t a1)
{
  v37[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  routingSessionManager_getConfiguration(&v35);
  double v3 = v36;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  double v5 = CFAbsoluteTimeGetCurrent();
  routingSessionManager_getConfiguration(&v33);
  CFDateRef v6 = CFDateCreate(v4, v5 - v34);
  char isVideoOnScreen = routingSessionManager_isVideoOnScreen(*(void *)(a1 + 32));
  MEMORY[0x199716EE0](*(void *)(*(void *)(a1 + 40) + 40));
  CFArrayRef v8 = *(const __CFArray **)(*(void *)(a1 + 40) + 48);
  CFDateRef v30 = v6;
  if (v8)
  {
    CFIndex v9 = 0;
    while (CFArrayGetCount(v8) > v9)
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 48), v9);
      LOBYTE(v37[0]) = 0;
      FigCFDictionaryGetBooleanIfPresent();
      if (LOBYTE(v37[0]))
      {
        char v10 = 0;
        goto LABEL_8;
      }
      ++v9;
      CFArrayRef v8 = *(const __CFArray **)(*(void *)(a1 + 40) + 48);
      if (!v8) {
        break;
      }
    }
  }
  char v10 = 1;
LABEL_8:
  v37[0] = 0;
  v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D048];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  v14 = CFArrayCreateMutable(v4, 0, MEMORY[0x1E4F1D510]);
  v15 = CFDictionaryCreateMutable(v4, 0, v11, v12);
  Float32 = (const void *)FigCFNumberCreateFloat32();
  CFDictionarySetValue(v15, @"RouteName", @"Fake route name");
  CFDictionarySetValue(v15, @"RouteUID", @"Fake route ID");
  CFDictionarySetValue(v15, @"AudioRouteName", @"AirTunes");
  CFDictionarySetValue(v15, @"AudioRouteSubType", @"AppleTV");
  v17 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(v15, @"RouteSupportsAirPlayVideo", (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionarySetValue(v15, @"RouteSupportsAirPlayScreen", v17);
  CFArrayAppendValue(v14, v15);
  if (v14) {
    CFDictionarySetValue(Mutable, @"routingSessionDestination_RouteDescriptors", v14);
  }
  CFDictionarySetValue(Mutable, @"routingSessionDestination_Probability", Float32);
  CFDictionarySetValue(Mutable, @"routingSessionDestination_ProvidesExternalVideoPlayback", v17);
  if ((v10 & 1) == 0) {
    CFDictionarySetValue(Mutable, @"routingSessionDestination_FromForcedPrediction", v17);
  }
  int v18 = FigRoutingSessionCreate((uint64_t)v4, 1, Mutable, v37);
  if (!v18 && v37[0])
  {
    CFTypeRef v19 = CFRetain(v37[0]);
    if (!Float32) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  CFTypeRef v19 = 0;
  if (Float32) {
LABEL_15:
  }
    CFRelease(Float32);
LABEL_16:
  if (v37[0]) {
    CFRelease(v37[0]);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v18)
  {
    FakePredictionContext = 0;
    CFDateRef v24 = v30;
    if (!v19) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  FakePredictionContext = (void *)routingSessionManager_createFakePredictionContext();
  int shouldUpdateCurrentSession = routingSessionManager_shouldUpdateCurrentSession(*(void **)(*(void *)(a1 + 40) + 24), *(void *)(*(void *)(a1 + 40) + 72), *(void **)(*(void *)(a1 + 40) + 88), *(unsigned __int8 *)(*(void *)(a1 + 40) + 96), (uint64_t)v19, FakePredictionContext, 1, 0, 0, isVideoOnScreen);
  MEMORY[0x199716EF0](*(void *)(*(void *)(a1 + 40) + 40));
  if (shouldUpdateCurrentSession)
  {
    double v22 = Current + v3;
    v23 = *(const void **)(a1 + 32);
    CFDateRef v24 = v30;
    if (v23)
    {
      CFRetain(v23);
      v25 = *(const void **)(a1 + 32);
    }
    else
    {
      v25 = 0;
    }
    CFAbsoluteTime v27 = CFAbsoluteTimeGetCurrent();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __routingSessionManager_UpdateCurrentSessionFromLikelyDestinations_block_invoke_2;
    v31[3] = &__block_descriptor_64_e42_v24__0__NSArray_8__ARPPredictionContext_16l;
    v31[4] = *(void *)(a1 + 32);
    *(double *)&v31[5] = v22;
    long long v32 = *(_OWORD *)(a1 + 48);
    routingSessionManager_waitForRecentPredictions(v25, v30, (uint64_t)v31, v22 - v27);
    if (!v19) {
      goto LABEL_39;
    }
LABEL_38:
    CFRelease(v19);
    goto LABEL_39;
  }
  CFDateRef v24 = v30;
  if (dword_1E9359DE0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v28 = *(void (**)(void, void))(a1 + 48);
  if (v28) {
    v28(*(void *)(a1 + 56), 0);
  }
  if (v19) {
    goto LABEL_38;
  }
LABEL_39:

  if (v24) {
    CFRelease(v24);
  }
  v29 = *(const void **)(a1 + 32);
  if (v29) {
    CFRelease(v29);
  }
}

void __routingSessionManager_UpdateCurrentSessionFromLikelyDestinations_block_invoke_2(uint64_t a1)
{
  v2 = *(const void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  if (v2)
  {
    long long v6 = *(_OWORD *)(a1 + 48);
    CFRetain(*(CFTypeRef *)(a1 + 32));
    long long v4 = v6;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __routingSessionManager_startSessionIfNecessary_block_invoke;
  v7[3] = &__block_descriptor_56_e56_v32__0i8____CFDictionary__12__ARPPredictionContext_20C28l;
  v7[4] = v2;
  long long v8 = v4;
  if (v2) {
    CFRetain(v2);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __routingSessionManager_findTopAvailablePredictedDestination_block_invoke;
  v10[3] = &unk_1E57CB540;
  v10[4] = v7;
  v10[5] = v2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __routingSessionManager_findTopAvailablePredictedDestination_block_invoke_196;
  v9[3] = &unk_1E57CB568;
  v9[4] = v7;
  v9[5] = v2;
  routingSessionManager_discoverRoutes((uint64_t)v10, (uint64_t)v9, v3);
  double v5 = *(const void **)(a1 + 32);
  if (v5) {
    CFRelease(v5);
  }
}

@end