@interface CMSMNotificationUtility
@end

@implementation CMSMNotificationUtility

void __CMSMNotificationUtility_PostDisplayLayoutDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"DisplayLayoutDidChange", *(void *)(a1 + 32), 0);
  v2 = *(void **)(a1 + 32);
}

void __CMSMNotificationUtility_PostReporterIDsDidChange_block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "reporterIDs"), @"ReporterIDs", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [+[MXSessionManagerSidekick sharedInstance] postNotification:@"ReporterIDsDidChange" toSession:*(void *)(a1 + 32) payload:v2];
  }
  else {
    CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), @"ReporterIDsDidChange");
  }
}

void __CMSMNotificationUtility_PostSessionAudioCategoryDidChange_block_invoke(uint64_t a1)
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "audioCategory"), @"AudioCategory", 0);
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), @"AudioCategoryDidChange");
}

void __CMSMNotificationUtility_PostApplicationStateDidChange_block_invoke(uint64_t *a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSameClient, a1[4], @"ApplicationStateDidChange", a1[5], 0);
  id v2 = (const void *)a1[5];
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[4];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[6];
  if (v4)
  {
    CFRelease(v4);
  }
}

void __CMSMNotificationUtility_PostSomeOtherPrimaryAudioCategoryIsPlayingDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(*(void *)(a1 + 32), (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSomeOtherActiveSession, 0, @"SomeOtherNonAmbientSessionIsPlayingDidChange", 0, 0);
  id v2 = *(void **)(a1 + 32);
}

void __CMSMNotificationUtility_PostSessionAudioModeDidChange_block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "audioMode"), @"AudioMode", 0);
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), @"AudioModeDidChange");
}

void __CMSMNotificationUtility_PostPickableRoutesDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, 0, 0, @"PickableRoutesDidChange", 0, 1);
  if (*(unsigned char *)(a1 + 32))
  {
    vaemPostAvailableEndpointsChangedNotification(1);
  }
}

void __CMSMNotificationUtility_PostSomePrimaryAudioCategoryIsPlayingDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(*(void *)(a1 + 32), (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSomeOtherForegroundAndActiveSession, 0, @"SomeNonAmbientAudioCategoryClientIsPlayingDidChange", *(void *)(a1 + 40), 0);
  id v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(void **)(a1 + 32);
}

void __CMSMNotificationUtility_PostSessionPrefersConcurrentAirPlayAudioDidChange_block_invoke(uint64_t a1)
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMUtility_NotifyEachSubscribedSession(0, @"PrefersConcurrentAirPlayAudioDidChange", *(void *)(a1 + 40), 0);
  v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
}

void __CMSMNotificationUtility_PostSessionAudioBehaviourDidChange_block_invoke(uint64_t a1)
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMUtility_PostNotificationToSession(*(void **)(a1 + 32), @"AudioBehaviourDidChange");
}

void __CMSMNotificationUtility_PostSessionRouteControlFeaturesDidChange_block_invoke(void **a1)
{
  if (objc_loadWeak(a1 + 6))
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMUtility_PostNotificationToSession(a1[4], @"RouteControlFeaturesDidChange");
  }
}

void __CMSMNotificationUtility_PostVolumeDidChangeToVolumeButtonClientsWithPayload_block_invoke(uint64_t a1)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"AudioCategory");
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsVolumeButtonClient, (uint64_t)Value, @"SystemVolumeDidChange", *(void *)(a1 + 32), 0);
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

id __CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded_block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded_sLastSpeechDetectStyleLock = (uint64_t)result;
  return result;
}

void __CMSMNotificationUtility_PostSpeechDetectStyleDidChangeIfNeeded_block_invoke_2(uint64_t a1)
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", *(unsigned int *)(a1 + 32)), @"SpeechDetectStyle", 0);
  CMSMUtility_NotifyEachSubscribedSession(0, @"SpeechDetectStyleDidChange", (uint64_t)v4, 0);
}

id __CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange_block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange_sLastNotificationPayloadLock = (uint64_t)result;
  return result;
}

id __CMSMNotificationUtility_PostCallIsActiveDidChangeIfNeeded_block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  CMSMNotificationUtility_PostCallIsActiveDidChangeIfNeeded_sActivePhoneCallInfoLock = (uint64_t)result;
  return result;
}

void __CMSMNotificationUtility_PostSystemHasAudioInputDeviceDidChange_block_invoke()
{
}

void __CMSMNotificationUtility_PostSystemHasAudioInputDeviceExcludingBluetoothDidChange_block_invoke()
{
}

void __CMSMNotificationUtility_PostVibeStopped_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_SessionWantsSystemSoundNotifications, 0, @"SystemSoundVibrateDidFinish", *(void *)(a1 + 32), 0);
  id v2 = *(void **)(a1 + 32);
}

void __CMSMNotificationUtility_PostVoicePromptStyleDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"VoicePromptStyleDidChange", *(void *)(a1 + 32), 0);
  id v2 = *(void **)(a1 + 32);
}

void __CMSMNotificationUtility_PostForceSoundCheckDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSameClient, *(void *)(a1 + 32), @"ForceSoundCheckDidChange", *(void *)(a1 + 40), 0);
  id v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __CMSMNotificationUtility_PostActiveAudioRouteDidChange_block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    CMSMUtility_PostNotificationToSession(v2, @"ActiveAudioRouteDidChange");
  }
  else {
    CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSessionUsingRoutingContext, *(void *)(a1 + 48), @"ActiveAudioRouteDidChange", *(void *)(a1 + 40), 0);
  }

  id v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
  }
}

void __CMSMNotificationUtility_PostActiveNeroVisualStreamDidChange_block_invoke()
{
}

void __CMSMNotificationUtility_PostActiveNeroVisualStreamInfoDidChange_block_invoke()
{
}

void __CMSMNotificationUtility_PostAvailableVirtualFormatsDidChange_block_invoke()
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(v3 + 48);
  if (v4)
  {
    v4(CMBaseObject, 0x1EE5F3068, v0, &cf);
    v5 = (void *)cf;
  }
  else
  {
    v5 = 0;
  }
  v6 = @"Formats";
  BOOL v7 = v5 != 0;
  BOOL v8 = @"Formats" != 0;
  if (!v8 || !v7)
  {
    v6 = 0;
    v5 = 0;
  }
  values = v5;
  keys[0] = v6;
  CFDictionaryRef v9 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v8 & v7, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"AvailablePhysicalFormatsDidChange", (uint64_t)v9, 0);
  if (v9) {
    CFRelease(v9);
  }
  v10 = @"Formats";
  v11 = (void *)cf;
  BOOL v12 = cf != 0;
  BOOL v13 = @"Formats" != 0;
  if (!v13 || !v12)
  {
    v10 = 0;
    v11 = 0;
  }
  values = v11;
  keys[0] = v10;
  CFDictionaryRef v14 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v13 & v12, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"AvailableFormatsDidChange", (uint64_t)v14, 0);
  if (v14) {
    CFRelease(v14);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void __CMSMNotificationUtility_PostInputDataSourcesDidChange_block_invoke()
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(v3 + 48);
  if (v4)
  {
    v4(CMBaseObject, 0x1EE5F3268, v0, &cf);
    v5 = (void *)cf;
  }
  else
  {
    v5 = 0;
  }
  v6 = @"Sources";
  BOOL v7 = v5 != 0;
  BOOL v8 = @"Sources" != 0;
  if (!v8 || !v7)
  {
    v6 = 0;
    v5 = 0;
  }
  values = v5;
  keys[0] = v6;
  CFDictionaryRef v9 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v8 & v7, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"InputSourcesDidChange", (uint64_t)v9, 0);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v9) {
    CFRelease(v9);
  }
}

void __CMSMNotificationUtility_PostOutputDataDestinationsDidChange_block_invoke()
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(v3 + 48);
  if (v4)
  {
    v4(CMBaseObject, 0x1EE5F3288, v0, &cf);
    v5 = (void *)cf;
  }
  else
  {
    v5 = 0;
  }
  v6 = @"Destinations";
  BOOL v7 = v5 != 0;
  BOOL v8 = @"Destinations" != 0;
  if (!v8 || !v7)
  {
    v6 = 0;
    v5 = 0;
  }
  values = v5;
  keys[0] = v6;
  CFDictionaryRef v9 = CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, v8 & v7, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"OutputDestinationsDidChange", (uint64_t)v9, 0);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v9) {
    CFRelease(v9);
  }
}

void __CMSMNotificationUtility_PostInputGainScalarDidChange_block_invoke()
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
  uint64_t v1 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(unsigned int (**)(uint64_t, uint64_t, void, CFTypeRef *))(v2 + 48);
  if (v3)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (!v3(CMBaseObject, 0x1EE5F3328, *MEMORY[0x1E4F1CF80], &cf))
    {
      v5 = @"Gain";
      v6 = (void *)cf;
      BOOL v7 = cf != 0;
      BOOL v8 = @"Gain" != 0;
      if (!v8 || !v7)
      {
        v5 = 0;
        v6 = 0;
      }
      values = v6;
      keys[0] = v5;
      CFDictionaryRef v9 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, v8 & v7, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"InputGainDidChange", (uint64_t)v9, 0);
      if (v9) {
        CFRelease(v9);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
}

void __CMSMNotificationUtility_PostCurrentRouteHasInputGainControlDidChange_block_invoke(uint64_t a1)
{
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"InputGainAvailableDidChange", *(void *)(a1 + 32), 0);
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __CMSMNotificationUtility_PostNumberOfInputChannelsDidChange_block_invoke(uint64_t a1)
{
  CFDictionaryRef SInt32Payload = CMSMNotificationUtility_CreateSInt32Payload(@"ChannelCount", *(_DWORD *)(a1 + 32));
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"NumberOfInputChannelsDidChange", (uint64_t)SInt32Payload, 0);
  if (SInt32Payload)
  {
    CFRelease(SInt32Payload);
  }
}

void __CMSMNotificationUtility_PostNumberOfOutputChannelsDidChange_block_invoke(uint64_t a1)
{
  CFDictionaryRef SInt32Payload = CMSMNotificationUtility_CreateSInt32Payload(@"ChannelCount", *(_DWORD *)(a1 + 32));
  CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_True, 0, @"NumberOfOutputChannelsDidChange", (uint64_t)SInt32Payload, 0);
  if (SInt32Payload)
  {
    CFRelease(SInt32Payload);
  }
}

void __CMSMNotificationUtility_PostBadgeTypeDidChange_block_invoke(uint64_t a1)
{
  if (objc_loadWeak((id *)(a1 + 40)))
  {
    id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 32), "badgeType"), @"BadgeType", 0);
    CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSameClient, [*(id *)(a1 + 32) clientPID], @"BadgeTypeDidChange", (uint64_t)v2, 0);
  }
}

void __CMSMNotificationUtility_PostSupportedBufferedAudioCapabilitiesDidChange_block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    id v2 = Weak;
    id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(Weak, "supportedOutputChannelLayouts"), @"SupportedOutputChannelLayouts", 0);
    CMSMUtility_NotifyEachMatchingSession(0, (unsigned int (*)(uint64_t, void, uint64_t))CMSUtilityPredicate_IsSameClient, [v2 clientPID], @"SupportedOutputChannelLayoutsDidChange", (uint64_t)v3, 0);
  }
}

void __CMSMNotificationUtility_PostIsRecordingMutedDidChange_block_invoke(void **a1)
{
  if (objc_loadWeak(a1 + 6))
  {
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMUtility_PostNotificationToSession(a1[4], @"IsRecordingMutedDidChange");
  }
}

id __CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded_block_invoke()
{
  CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded_sOldHighestArbitrationPriorityForTipiInfo = 0;
  id result = objc_alloc_init(MEMORY[0x1E4F28E08]);
  CMSMNotificationUtility_PostHighestArbitrationPriorityForTipiDidChangeIfNeeded_sOldHighestArbitrationPriorityForTipiInfoLock = (uint64_t)result;
  return result;
}

uint64_t __CMSMNotificationUtility_PostSilentModeEnabledDidChange_block_invoke(uint64_t a1)
{
  return CMSMDeviceState_PostRingerStateDarwinNotification(*(unsigned __int8 *)(a1 + 32) ^ 1u);
}

@end