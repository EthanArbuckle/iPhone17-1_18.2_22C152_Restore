@interface FigRoutingManager
@end

@implementation FigRoutingManager

dispatch_queue_t __FigRoutingManager_GetDataTransmissionQueue_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.mx.datatransmissionqueue", v0);
  FigRoutingManager_GetDataTransmissionQueue_dataTransmissionQueue = (uint64_t)result;
  return result;
}

void __FigRoutingManager_CloseRelayCommChannels_block_invoke(uint64_t a1)
{
  cf[22] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  FigRoutingManagerContextUtilities_CopyFigEndpointFromAggregateEndpointForClientUse(*(void *)(a1 + 32), (uint64_t)cf);
  CFTypeRef v1 = cf[0];
  if (cf[0])
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      if (dword_1E9359DC0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 0;
      }
      v5 = *(void (**)(CFTypeRef))(v4 + 144);
      if (v5) {
        v5(v1);
      }
    }
    if (cf[0]) {
      CFRelease(cf[0]);
    }
  }
}

void __FigRoutingManager_iOSEndpointActivateCompletionCallback_block_invoke(uint64_t a1)
{
  v60[16] = *(CFNumberRef *)MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  CFTypeRef v57 = 0;
  CFTypeRef v58 = 0;
  CFTypeRef v55 = 0;
  CFTypeRef v56 = 0;
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = *MEMORY[0x1E4F1CF80];
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v5 + 48);
    if (v6) {
      v6(CMBaseObject, *MEMORY[0x1E4F20F28], v2, &v58);
    }
    uint64_t v7 = FigEndpointGetCMBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v9 + 48);
    if (v10) {
      v10(v7, *MEMORY[0x1E4F20E38], v2, &v57);
    }
    uint64_t v11 = FigEndpointGetCMBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    v14 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v13 + 48);
    if (v14) {
      v14(v11, *MEMORY[0x1E4F20D08], v2, &v56);
    }
    uint64_t v15 = FigEndpointGetCMBaseObject();
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v17 + 48);
    if (v18) {
      v18(v15, *MEMORY[0x1E4F20EF0], v2, &v55);
    }
  }
  if (dword_1E9359DC0)
  {
    LODWORD(cf) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFTypeRef cf = 0;
  FigRoutingManagerContextUtilities_CopyMostRecentCurrentlyActivatingEndpoint(*(void *)(a1 + 64), &cf);
  int v20 = *(_DWORD *)(a1 + 104);
  if (v20 == -16727) {
    goto LABEL_111;
  }
  if (v20)
  {
    FigRoutingManagerCrossfadePlayback();
    if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40))) {
      FigEndpointUIAgentHelper_CleanupPrompt(v58, (uint64_t)v57, (uint64_t)v55, 0);
    }
    if (cf == *(CFTypeRef *)(a1 + 40))
    {
      if (FigRoutingManagerIsEndpointOfType((uint64_t)cf)) {
        FigRoutingManagerProcessCarPlayEndpointDeactivation(1);
      }
      FigRoutingManager_iOSHandleEndpointActivationError(*(void *)(a1 + 40), *(void *)(a1 + 56), *(_DWORD *)(a1 + 104), *(void *)(a1 + 48), *(void *)(a1 + 64));
    }
    goto LABEL_111;
  }
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
  {
    CFTypeRef v22 = v57;
    CFTypeRef v21 = v58;
    CFTypeRef v23 = v55;
    int v24 = FigCFEqual();
    FigEndpointUIAgentHelper_CleanupPrompt(v21, (uint64_t)v22, (uint64_t)v23, v24);
  }
  CFTypeRef v25 = *(CFTypeRef *)(a1 + 40);
  if (cf != v25 && !FigRoutingManagerIsEndpointOfType((uint64_t)v25))
  {
    *(void *)type = 0;
    if (cf)
    {
      uint64_t v31 = FigEndpointGetCMBaseObject();
      uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v33 = v32 ? v32 : 0;
      v38 = *(void (**)(uint64_t, void, void, os_log_type_t *))(v33 + 48);
      if (v38) {
        v38(v31, *MEMORY[0x1E4F20F28], *MEMORY[0x1E4F1CF80], type);
      }
    }
    if (!FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
    {
      if (dword_1E9359DC0)
      {
        LODWORD(theArray) = 0;
        v50[0] = OS_LOG_TYPE_DEFAULT;
        v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigRoutingManager_iOSDeactivateEndpoint(*(void *)(a1 + 40), *(void *)(a1 + 48), 1);
      FigRoutingManagerContextUtilities_ResetCurrentlyActivatingEndpointInfo(*(void *)(a1 + 64), *(void *)(a1 + 40), @"configUpdateReasonEndedUserCancelled");
    }
    if (*(void *)type)
    {
      CFRelease(*(CFTypeRef *)type);
      *(void *)type = 0;
    }
    FigRoutingManagerContextUtilities_SetPickingState(*(void *)(a1 + 64), 0);
    goto LABEL_111;
  }
  FigRoutingManagerContextUtilities_SetPickingState(*(void *)(a1 + 64), 7);
  FigRoutingManagerRegisterForFigEndpointNotifications(*(void *)(a1 + 40));
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
  {
    v60[0] = 0;
    uint64_t v26 = *(void *)(a1 + 56);
    uint64_t valuePtr = v26;
    uint64_t v27 = FigEndpointGetCMBaseObject();
    uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v28) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = 0;
    }
    v34 = *(void (**)(uint64_t, void, void, CFNumberRef *))(v29 + 48);
    if (v34)
    {
      v34(v27, *MEMORY[0x1E4F20C88], *MEMORY[0x1E4F1CF80], v60);
      if (v60[0])
      {
        CFNumberGetValue(v60[0], kCFNumberSInt64Type, &valuePtr);
        uint64_t v26 = valuePtr;
      }
    }
    FigRoutingManager_iOSHandleFigEndpointFeaturesActivation(*(void *)(a1 + 40), v26, *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
    FigRoutingManagerContextUtilities_AddActivatedEndpoint(*(void *)(a1 + 64), *(void *)(a1 + 40), valuePtr, *(void *)(a1 + 48));
    CFArrayRef v35 = v60[0];
    if (!v60[0]) {
      goto LABEL_111;
    }
LABEL_91:
    CFRelease(v35);
    goto LABEL_111;
  }
  if (!FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
  {
    if (!FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40))
      || CMSMDeviceState_IsHomePodHub())
    {
LABEL_107:
      FigRoutingManager_iOSHandleFigEndpointFeaturesActivation(*(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
      FigRoutingManagerContextUtilities_AddActivatedEndpoint(*(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
      if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
      {
        if (MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled()) {
          FigRoutingManagerNotifyClientsOfCarPlayActivation();
        }
        CMSMNotificationUtility_PostCarPlayIsConnectedDidChange(1);
        notify_post("com.apple.coremedia.carplayisconnected");
        int v45 = FigRoutingManager_iOSIsCarPlayAuxStreamSupported();
        CMSMNotificationUtility_PostCarPlayAuxStreamSupportDidChange(v45);
        FigRoutingManagerUtilities_RegisterAirPlayStreamCapabilitiesDidChangeListener(0, *(void *)(a1 + 40));
      }
      goto LABEL_111;
    }
    *(void *)type = 0;
    FigEndpointCopyProperty(*(void *)(a1 + 40), *MEMORY[0x1E4F20FB0], *MEMORY[0x1E4F1CF80], (uint64_t)type);
    CFArrayRef theArray = 0;
    FigRoutingManagerContextUtilities_CopyCurrentlyActivatingSubEndpoints(*(void *)(a1 + 64), *(void *)(a1 + 40), (uint64_t)&theArray);
    if ((!theArray || !CFArrayGetCount(theArray)) && (!*(void *)type || !CFArrayGetCount(*(CFArrayRef *)type)))
    {
      if (dword_1E9359DC0)
      {
        *(_DWORD *)v50 = 0;
        v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      FigRoutingManagerAggregateAddLocalAirPlayEndpoint(*(const void **)(a1 + 64), *(void **)(a1 + 40));
      goto LABEL_103;
    }
    if (theArray && CFArrayGetCount(theArray))
    {
      CFArrayRef v36 = theArray;
      v37 = @"There are currently activating SubEndpoints: ";
    }
    else
    {
      if (!*(void *)type || !CFArrayGetCount(*(CFArrayRef *)type)) {
        goto LABEL_103;
      }
      CFArrayRef v36 = *(const __CFArray **)type;
      v37 = @"There are activated SubEndpoints: ";
    }
    FigRoutingManagerLogEndpointIDs((uint64_t)v37, v36, 0, 1);
LABEL_103:
    if (theArray)
    {
      CFRelease(theArray);
      CFArrayRef theArray = 0;
    }
    if (*(void *)type) {
      CFRelease(*(CFTypeRef *)type);
    }
    goto LABEL_107;
  }
  *(void *)type = 0;
  FigRoutingManagerContextUtilities_CopyCurrentlyActivatingEndpoints(*(void *)(a1 + 64), (uint64_t)type);
  CFArrayRef theArray = 0;
  FigRoutingManagerContextUtilities_CopyMostRecentCurrentlyActivatingEndpoint(*(void *)(a1 + 64), &theArray);
  if (!CMSMVAUtility_IsA2DPPortAvailableForEndpoint(*(void *)(a1 + 40), 0))
  {
    FigRoutingManagerContextUtilities_SetPickingState(*(void *)(a1 + 64), 8);
    goto LABEL_88;
  }
  char v51 = 0;
  FigCFDictionaryGetBooleanIfPresent();
  *(void *)v50 = 0;
  FigRoutingManagerContextUtilities_CopyPickedEndpointAtIndex(*(void *)(a1 + 64), 0, (uint64_t)v50);
  if (dword_1E9359DC0)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  v41 = Mutable;
  if (Mutable)
  {
    if (*(void *)v50) {
      CFArrayAppendValue(Mutable, *(const void **)v50);
    }
    CFArrayAppendValue(v41, *(const void **)(a1 + 40));
  }
  if (!v51) {
    goto LABEL_82;
  }
  if (!*(void *)type
    || CFArrayGetCount(*(CFArrayRef *)type) < 2
    || !FigRoutingManagerAreAllEndpointsBluetoothShareable(*(const __CFArray **)type))
  {
    if (v41
      && FigRoutingManagerIsEndpointBluetoothShareable(*(uint64_t *)v50)
      && FigRoutingManagerIsEndpointBluetoothShareable(*(void *)(a1 + 40)))
    {
      v42 = *(const void **)(a1 + 64);
      CFArrayRef v43 = v41;
      goto LABEL_81;
    }
LABEL_82:
    if (FigRoutingManagerIsEndpointOfType((uint64_t)theArray)) {
      FigRoutingManagerRouteToBluetoothDevice(*(const void **)(a1 + 64), (uint64_t)theArray);
    }
    goto LABEL_84;
  }
  v42 = *(const void **)(a1 + 64);
  CFArrayRef v43 = *(const __CFArray **)type;
LABEL_81:
  FigRoutingManagerEnableBluetoothSharingSession(v42, v43);
LABEL_84:
  if (*(void *)v50)
  {
    CFRelease(*(CFTypeRef *)v50);
    *(void *)v50 = 0;
  }
  if (v41) {
    CFRelease(v41);
  }
LABEL_88:
  if (*(void *)type)
  {
    CFRelease(*(CFTypeRef *)type);
    *(void *)type = 0;
  }
  CFArrayRef v35 = theArray;
  if (theArray) {
    goto LABEL_91;
  }
LABEL_111:
  FigRoutingManagerDestroyEndpointActivateCompletionContext(*(CFTypeRef **)(a1 + 96));
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v58)
  {
    CFRelease(v58);
    CFTypeRef v58 = 0;
  }
  if (v56)
  {
    CFRelease(v56);
    CFTypeRef v56 = 0;
  }
  if (v55)
  {
    CFRelease(v55);
    CFTypeRef v55 = 0;
  }
  if (v57)
  {
    CFRelease(v57);
    CFTypeRef v57 = 0;
  }
  v46 = *(const void **)(a1 + 64);
  if (v46) {
    CFRelease(v46);
  }
  v47 = *(const void **)(a1 + 40);
  if (v47) {
    CFRelease(v47);
  }
  v48 = *(const void **)(a1 + 72);
  if (v48) {
    CFRelease(v48);
  }
  v49 = *(const void **)(a1 + 80);
  if (v49) {
    CFRelease(v49);
  }
}

void __FigRoutingManager_iOSEndpointDeactivateCompletionCallback_block_invoke(uint64_t a1)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  CFTypeRef v23 = 0;
  uint64_t v2 = (void *)MEMORY[0x1E4F1CF80];
  if (*(void *)(a1 + 40))
  {
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v5 = v4 ? v4 : 0;
    v6 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v5 + 48);
    if (v6) {
      v6(CMBaseObject, *MEMORY[0x1E4F20F28], *v2, &v23);
    }
  }
  if (dword_1E9359DC0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v8 = *(CFTypeRef **)(a1 + 64);
  if (v8)
  {
    cf[0] = *v8;
    if (cf[0])
    {
LABEL_11:
      int v9 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    cf[0] = 0;
  }
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
  {
    FigRoutingManagerContextUtilities_CopySystemAudioContextUUID((uint64_t)cf);
    FigRoutingManagerUtilities_UnRegisterAirPlayStreamCapabilitiesDidChangeListener(0, *(const void **)(a1 + 40));
  }
  else
  {
    if (!FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40))) {
      goto LABEL_11;
    }
    FigRoutingManagerContextUtilities_CopySystemMirroringContextUUID((uint64_t)cf);
  }
  int v9 = 1;
LABEL_18:
  uint64_t v10 = *(void *)(a1 + 40);
  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_32;
  }
  FigEndpointAggregateGetClassID();
  int IsMemberOfClass = CMBaseObjectIsMemberOfClass();
  uint64_t v12 = *(const void **)(a1 + 40);
  if (!IsMemberOfClass) {
    goto LABEL_32;
  }
  CFArrayRef theArray = 0;
  uint64_t v13 = FigEndpointGetCMBaseObject();
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(void (**)(uint64_t, void, void, CFArrayRef *))(v15 + 48);
  if (!v16) {
    goto LABEL_29;
  }
  v16(v13, *MEMORY[0x1E4F20FB0], *v2, &theArray);
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v18 = Count;
      for (CFIndex i = 0; i != v18; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
        FigRoutingManagerRemoveEndpointFromAggregate(v10, ValueAtIndex, 0, 0, 0, (uint64_t)FigRoutingManagerAggregateRemoveEndpointCompletionCallback);
      }
    }
LABEL_29:
    if (theArray) {
      CFRelease(theArray);
    }
  }
  uint64_t v12 = *(const void **)(a1 + 40);
LABEL_32:
  FigRoutingManager_iOSHandleFigEndpointFeaturesDeactivation(v12, *(void *)(a1 + 56), (uint64_t)cf[0]);
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40))) {
    FigRoutingManagerProcessCarPlayEndpointDeactivation(1);
  }
  FigRoutingManagerContextUtilities_RemoveActivatedEndpoint((uint64_t)cf[0], *(void *)(a1 + 40), *(void *)(a1 + 48));
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40))
    || FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 40)))
  {
    FigRoutingManagerRemoveCachedDelegateContext(*(void *)(a1 + 40));
  }
  if (cf[0]) {
    int v21 = v9;
  }
  else {
    int v21 = 0;
  }
  if (v21 == 1)
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  FigRoutingManagerDestroyEndpointDeactivateCompletionContext(*(const void ***)(a1 + 72));
  CFTypeRef v22 = *(const void **)(a1 + 40);
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
}

void __FigRoutingManager_iOSDeactivateEndpoint_block_invoke(uint64_t a1)
{
  FigRoutingManagerStopDeactivateAirPlayEndpointTimer();
  FigRoutingManagerStopCarPlayAudioMainPortPublishedCheckTimer();
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __FigRoutingManager_iOSHandleEndpointFailedDelegate_block_invoke(uint64_t a1)
{
  cf[16] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFTypeRef v62 = 0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 32);
  if (!v4)
  {
    Value = 0;
    goto LABEL_7;
  }
  Value = CFDictionaryGetValue(v4, @"EndpointDelegateContextKey_RoutingContextUUID");
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 32);
  if (!v6)
  {
LABEL_7:
    uint64_t v7 = 0;
LABEL_8:
    MutableCopy = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    goto LABEL_9;
  }
  uint64_t v7 = CFDictionaryGetValue(v6, @"EndpointDelegateContextKey_ClientRouteChangeOptions");
  CFDictionaryRef v8 = *(const __CFDictionary **)(a1 + 32);
  if (!v8) {
    goto LABEL_8;
  }
  CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(v8, @"EndpointDelegateContextKey_InternalRouteChangeOptions");
  if (!v9) {
    goto LABEL_8;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(v2, 0, v9);
LABEL_9:
  uint64_t v11 = MutableCopy;
  uint64_t v12 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(MutableCopy, @"RouteChangeOptionKey_IsRemoveOperation", (const void *)*MEMORY[0x1E4F1CFD0]);
  int v61 = 0;
  FigCFDictionaryGetInt32IfPresent();
  uint64_t v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E4F205A0]);
  uint64_t v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E4F20368]);
  if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v14, v15)
    && FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 48))
    && !v14)
  {
    FigRoutingManagerHandleAggregateFailure(*(void *)(a1 + 48));
    goto LABEL_75;
  }
  if (FigRoutingManagerIsEndpointOfType(*(void *)(a1 + 48)))
  {
    uint64_t v60 = 0;
    FigCFDictionaryGetInt64IfPresent();
    if (!v14)
    {
      LODWORD(v59) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_75;
    }
    if (FigRoutingManagerIsEndpointActivated((uint64_t)v14))
    {
      CFTypeRef v59 = 0;
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      CFTypeRef v23 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v18 + 48);
      if (v23) {
        v23(CMBaseObject, *MEMORY[0x1E4F20E38], v2, &v59);
      }
      uint64_t v24 = FigEndpointGetCMBaseObject();
      uint64_t v25 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v25) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v27 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v26 + 48);
      if (v27) {
        v27(v24, *MEMORY[0x1E4F20F28], v2, &v62);
      }
      uint64_t v28 = FigEndpointDescriptorUtility_CopyDescriptorForEndpoint((uint64_t)v14, 0);
      FigCFDictionarySetValue();
      FigCFDictionarySetValue();
      CFTypeRef v56 = v28;
      FigCFDictionarySetValue();
      if (v61)
      {
        cf[0] = 0;
        uint64_t v29 = FigEndpointGetCMBaseObject();
        uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v30) {
          uint64_t v31 = v30;
        }
        else {
          uint64_t v31 = 0;
        }
        v39 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v31 + 48);
        if (v39) {
          v39(v29, *MEMORY[0x1E4F20FB0], v2, cf);
        }
        CFMutableDictionaryRef RouteConfigUpdatedFailedPayload = FigRoutingContextUtilities_CreateRouteConfigUpdatedFailedPayload(0, (uint64_t)v59, v61, (const __CFArray *)cf[0]);
        FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers((uint64_t)Value, @"routeConfigUpdated", (uint64_t)RouteConfigUpdatedFailedPayload);
        if (RouteConfigUpdatedFailedPayload) {
          CFRelease(RouteConfigUpdatedFailedPayload);
        }
        if (cf[0]) {
          CFRelease(cf[0]);
        }
      }
      *(void *)type = 0;
      FigRoutingManagerContextUtilities_CopyAggregateEndpointAsFigEndpointAggregate((uint64_t)Value, (uint64_t)type);
      if (*(void *)type)
      {
        CFTypeRef v57 = 0;
        v41 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(v41, @"RouteChangeOptionKey_IsRemoveOperation", v12);
        FigRoutingManagerCreateAggregateAddEndpointCompletionContext(Value, v41, v41, &v57);
        v42 = FigRoutingManagerAggregateShouldEndpointRemovalInterruptSystemMusicSessions(*(uint64_t *)type, v14, (uint64_t *)v57);
        FigRoutingManagerDestroyAggregateAddEndpointCompletionContext((const void **)v57);
        if (v41) {
          CFRelease(v41);
        }
        if (*(void *)(a1 + 32))
        {
          FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers((uint64_t)Value, 0, @"configUpdateReasonEndedFailed");
          uint64_t v43 = *(void *)type;
          v44 = v14;
          int v45 = Value;
          v46 = v7;
          v47 = v11;
        }
        else
        {
          v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          uint64_t v43 = *(void *)type;
          v44 = v14;
          int v45 = 0;
          v46 = 0;
          v47 = 0;
        }
        if (FigRoutingManagerRemoveEndpointFromAggregate(v43, v44, v45, v46, v47, (uint64_t)FigRoutingManagerAggregateRemoveEndpointCompletionCallback))
        {
          v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        else
        {
          FigRoutingManagerLogEndpointID(@"HandleEndpointFailedDelegate: Removed endpoint with ID from aggregate: ", (uint64_t)v14, 0, 0);
        }
      }
      else
      {
        v42 = 0;
      }
      FigRoutingManagerCleanupSystemMusicIfAggregateIsEmpty(*(void *)(a1 + 48), *(void *)(a1 + 56), v42);
      if (FigCFEqual()) {
        FigRoutingManager_iOSHandleStartupFailed(v61, Mutable);
      }
      if (*(void *)type)
      {
        CFRelease(*(CFTypeRef *)type);
        *(void *)type = 0;
      }
      if (v59)
      {
        CFRelease(v59);
        CFTypeRef v59 = 0;
      }
      v38 = v56;
      if (v56) {
        goto LABEL_74;
      }
    }
  }
  else if (FigRoutingManagerIsEndpointActivated(*(void *)(a1 + 48)))
  {
    cf[0] = 0;
    uint64_t v19 = FigEndpointGetCMBaseObject();
    uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v32 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v21 + 48);
    if (v32) {
      v32(v19, *MEMORY[0x1E4F20E38], v2, cf);
    }
    uint64_t v33 = FigEndpointGetCMBaseObject();
    uint64_t v34 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v34) {
      uint64_t v35 = v34;
    }
    else {
      uint64_t v35 = 0;
    }
    CFArrayRef v36 = *(void (**)(uint64_t, void, const __CFAllocator *, CFTypeRef *))(v35 + 48);
    if (v36) {
      v36(v33, *MEMORY[0x1E4F20F28], v2, &v62);
    }
    v37 = FigEndpointDescriptorUtility_CopyDescriptorForEndpoint(*(void *)(a1 + 48), 0);
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigCFDictionarySetValue();
    FigRoutingManager_iOSDeactivateEndpoint(*(void *)(a1 + 48), *(void *)(a1 + 56), 0);
    if (FigRoutingManagerContextUtilities_GetContextType((uint64_t)Value) == 1) {
      FigRoutingManagerContextUtilities_PostRouteConfigUpdatedToClientsOfContextWithUUIDAndItsFollowers((uint64_t)Value, 0, @"configUpdateReasonEndedFailed");
    }
    else {
      FigRoutingManagerContextUtilities_SetPickedEndpoints(Value, 0, @"configUpdateReasonEndedFailed", (uint64_t)v7, 0);
    }
    if (FigCFEqual()) {
      FigRoutingManager_iOSHandleStartupFailed(v61, Mutable);
    }
    if (cf[0])
    {
      CFRelease(cf[0]);
      cf[0] = 0;
    }
    if (v37)
    {
      v38 = v37;
LABEL_74:
      CFRelease(v38);
    }
  }
LABEL_75:
  if (dword_1E9359DC0)
  {
    LODWORD(v60) = 0;
    LOBYTE(v59) = 0;
    v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v51 = v60;
    if (os_log_type_enabled(v50, (os_log_type_t)v59)) {
      unsigned int v52 = v51;
    }
    else {
      unsigned int v52 = v51 & 0xFFFFFFFE;
    }
    if (v52)
    {
      int v63 = 136315906;
      v64 = "FigRoutingManager_iOSHandleEndpointFailedDelegate_block_invoke";
      __int16 v65 = 2114;
      CFTypeRef v66 = v62;
      __int16 v67 = 1024;
      int v68 = v61;
      __int16 v69 = 2114;
      v70 = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v62)
  {
    CFRelease(v62);
    CFTypeRef v62 = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v11) {
    CFRelease(v11);
  }
  v53 = *(const void **)(a1 + 48);
  if (v53) {
    CFRelease(v53);
  }
  v54 = *(const void **)(a1 + 40);
  if (v54) {
    CFRelease(v54);
  }
  CFTypeRef v55 = *(const void **)(a1 + 32);
  if (v55) {
    CFRelease(v55);
  }
}

void __FigRoutingManager_HandleDidReceiveDataFromCommChannelDelegate_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32);
  if (v2)
  {
    Value = CFDictionaryGetValue(v2, @"EndpointDelegateContextKey_RoutingContextUUID");
    if (Value)
    {
      uint64_t v4 = (uint64_t)Value;
      uint64_t v5 = *MEMORY[0x1E4F1CF80];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (FigRoutingManagerContextUtilities_GetContextType(v4) == 9)
      {
        CFTypeRef v20 = 0;
        uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v10 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v9 + 48);
        if (v10) {
          v10(CMBaseObject, *MEMORY[0x1E4F20F28], v5, &v20);
        }
        CFTypeRef cf = 0;
        uint64_t v11 = FigEndpointGetCMBaseObject();
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v13 + 48);
        if (v14)
        {
          v14(v11, *MEMORY[0x1E4F20E38], v5, &cf);
          CFTypeRef v15 = cf;
        }
        else
        {
          CFTypeRef v15 = 0;
        }
        CFDictionarySetValue(Mutable, @"deviceID", v15);
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (v20) {
          CFRelease(v20);
        }
      }
      CFDictionarySetValue(Mutable, @"commChannelUUID", *(const void **)(a1 + 48));
      CFDictionarySetValue(Mutable, @"data", *(const void **)(a1 + 56));
      FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers(v4, @"didReceiveData", (uint64_t)Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
  uint64_t v16 = *(const void **)(a1 + 40);
  if (v16) {
    CFRelease(v16);
  }
  uint64_t v17 = *(const void **)(a1 + 48);
  if (v17) {
    CFRelease(v17);
  }
  uint64_t v18 = *(const void **)(a1 + 56);
  if (v18) {
    CFRelease(v18);
  }
}

void __FigRoutingManager_HandleDidCloseCommChannelDelegate_block_invoke(void *a1)
{
  v19[24] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFDictionaryRef v2 = (const __CFDictionary *)a1[4];
  if (v2)
  {
    Value = CFDictionaryGetValue(v2, @"EndpointDelegateContextKey_RoutingContextUUID");
    if (Value)
    {
      uint64_t v4 = (uint64_t)Value;
      uint64_t v5 = *MEMORY[0x1E4F1CF80];
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (FigRoutingManagerContextUtilities_GetContextType(v4) == 9)
      {
        v19[0] = 0;
        uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v10 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v9 + 48);
        if (v10) {
          v10(CMBaseObject, *MEMORY[0x1E4F20F28], v5, v19);
        }
        CFTypeRef cf = 0;
        uint64_t v11 = FigEndpointGetCMBaseObject();
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v13 + 48);
        if (v14) {
          v14(v11, *MEMORY[0x1E4F20E38], v5, &cf);
        }
        FigCFDictionarySetValue();
        if (dword_1E9359DC0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (v19[0]) {
          CFRelease(v19[0]);
        }
      }
      FigCFDictionarySetValue();
      FigRoutingManagerContextUtilities_PostNotificationToClientsOfContextWithUUIDAndItsFollowers(v4, @"commChannelDidClose", (uint64_t)Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
  uint64_t v16 = (const void *)a1[5];
  if (v16) {
    CFRelease(v16);
  }
  uint64_t v17 = (const void *)a1[6];
  if (v17) {
    CFRelease(v17);
  }
}

@end