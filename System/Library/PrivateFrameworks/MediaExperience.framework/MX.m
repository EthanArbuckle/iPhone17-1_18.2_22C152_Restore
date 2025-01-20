@interface MX
@end

@implementation MX

void __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    int v16 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  dispatch_semaphore_t v23 = 0;
  dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
  if (!v19[5])
  {
    *(_DWORD *)type = 0;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_23;
  v12[3] = &unk_1E57C9758;
  long long v13 = *(_OWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_2;
  v11[3] = &unk_1E57C5B30;
  v11[4] = &v18;
  objc_msgSend((id)stMediaStatusDomainPublisher, "updateVolatileDataWithBlock:completion:", v12, v11, v9, v10);
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v19[5], v4))
  {
    *(_DWORD *)type = 0;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v6 = *(_DWORD *)type;
    if (os_log_type_enabled(v5, v14)) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = v6 & 0xFFFFFFFE;
    }
    if (v7)
    {
      int v16 = 136315138;
      v17 = "MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_3";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x199716E90](sSystemStatusMutex);
  v8 = v19[5];
  if (v8)
  {
    dispatch_release(v8);
    v19[5] = 0;
  }
  MEMORY[0x199716EA0](sSystemStatusMutex);

  _Block_object_dispose(&v18, 8);
}

uint64_t __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_23(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setMicrophoneAttributions:", objc_msgSend(*(id *)(a1 + 32), "allObjects"));
  uint64_t v4 = *(void *)(a1 + 40);
  return [a2 setMutedAudioRecordingAttributions:v4];
}

void __MX_RunningBoardServices_StartMonitoringForPID_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPredicates:", objc_msgSend(*(id *)(a1 + 32), "allObjects"));
  v3 = *(void **)(a1 + 32);
}

void __MX_FrontBoardServices_Initialize_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x1997179E0]();
  CFArrayRef v5 = (const __CFArray *)[a3 elements];
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5) < 1)
    {
      unsigned __int8 v11 = 0;
      unsigned __int8 v10 = 0;
      unsigned __int8 v9 = 0;
      v8 = 0;
    }
    else
    {
      CFIndex v7 = 0;
      v8 = 0;
      unsigned __int8 v9 = 0;
      unsigned __int8 v10 = 0;
      unsigned __int8 v11 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v6, v7);
        if (ValueAtIndex)
        {
          long long v13 = ValueAtIndex;
          switch([ValueAtIndex layoutRole])
          {
            case 1:
              v8 = (const void *)[v13 bundleIdentifier];
              break;
            case 3:
              unsigned __int8 v10 = 1;
              break;
            case 4:
              unsigned __int8 v9 = 1;
              break;
            case 7:
              if ([v13 level] == 2) {
                unsigned __int8 v11 = 1;
              }
              break;
            default:
              break;
          }
        }
        ++v7;
      }
      while (v7 < CFArrayGetCount(v6));
    }
    cmsmDisplayLayoutChanged(v11, v10, v9, v8);
  }
}

void __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_2(uint64_t a1)
{
  MEMORY[0x199716E90](sSystemStatusMutex);
  v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2) {
    dispatch_semaphore_signal(v2);
  }
  JUMPOUT(0x199716EA0);
}

uint64_t __MX_FeatureFlags_IsSharePlayEnabled_block_invoke()
{
  uint64_t result = CMSMDeviceState_ItsAHomePod();
  if (result)
  {
    char v1 = 0;
  }
  else
  {
    uint64_t result = TelephonyUtilitiesLibraryCore();
    if (!result) {
      return result;
    }
    uint64_t v5 = 0;
    CFArrayRef v6 = &v5;
    uint64_t v7 = 0x2020000000;
    v2 = (uint64_t (*)(void))getTUSharePlayForceDisabledSymbolLoc_ptr;
    v8 = getTUSharePlayForceDisabledSymbolLoc_ptr;
    if (!getTUSharePlayForceDisabledSymbolLoc_ptr)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __getTUSharePlayForceDisabledSymbolLoc_block_invoke;
      v4[3] = &unk_1E57C5B30;
      v4[4] = &v5;
      __getTUSharePlayForceDisabledSymbolLoc_block_invoke((uint64_t)v4);
      v2 = (uint64_t (*)(void))v6[3];
    }
    _Block_object_dispose(&v5, 8);
    if (!v2)
    {
      v3 = (_Unwind_Exception *)__68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
      _Block_object_dispose(&v5, 8);
      _Unwind_Resume(v3);
    }
    uint64_t result = v2();
    char v1 = result ^ 1;
  }
  MX_FeatureFlags_IsSharePlayEnabled_sharePlayEnabled = v1;
  return result;
}

uint64_t __MX_FeatureFlags_IsAdditiveRoutingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAdditiveRoutingEnabled_additiveRoutingEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCorianderEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCorianderEnabled_corianderEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_relativeVoiceOverVolumeEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAlertsRelativeVoiceOverVolumeEnabled_block_invoke()
{
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_onceToken != -1) {
    dispatch_once(&MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_onceToken, &__block_literal_global_12);
  }
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_relativeVoiceOverVolumeEnabled) {
    uint64_t result = _os_feature_enabled_impl();
  }
  else {
    uint64_t result = 0;
  }
  MX_FeatureFlags_IsAlertsRelativeVoiceOverVolumeEnabled_alertsRelativeVoiceOverVolumeEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCallManagementMuteControlEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCallManagementMuteControlEnabled_sCallManagementMuteControlEnabled = result;
  return result;
}

uint64_t __MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled_sIsDiscoveryEnhancementEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCounterfeitDetectionEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCounterfeitDetectionEnabled_gapaEnabled = result;
  return result;
}

uint64_t __MX_FeatureFlags_IsConversationDetectSupported_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsConversationDetectSupported_conversationDetectSupported = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSmartRoutingOnActivationEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSmartRoutingOnActivationEnabled_sSmartRoutingOnActivationEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsInterruptOnRouteDisconnectEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsInterruptOnRouteDisconnectEnabled_sInterruptOnRouteDisconnect = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsInterruptLongFormVideoOnSpeechDetectEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsInterruptLongFormVideoOnSpeechDetectEnabled_sInterruptLongFormVideoOnSpeechDetect = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAssertionActivityReportingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAssertionActivityReportingEnabled_sAssertionActivityReportingEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAudioFormatArbitrationEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAudioFormatArbitrationEnabled_sAudioFormatArbitrationEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsOffloadACQEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsOffloadACQEnabled_sIsOffloadACQEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsMXSilentModeEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsMXSilentModeEnabled_sIsUseMXSilentModeEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAdaptiveVolumeControlEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAdaptiveVolumeControlEnabled_sAdaptiveVolumeControlEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSpeechDetectEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSpeechDetectEnabled_sSpeechDetectEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsKeyboardCHAudioEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsKeyboardCHAudioEnabled_sIsKeyboardCHAudioEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled_block_invoke()
{
  uint64_t result = CMSMDeviceState_ItsAniPad();
  if (result)
  {
    uint64_t result = MGGetBoolAnswer();
    if (result) {
      uint64_t result = _os_feature_enabled_impl();
    }
  }
  MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled_sIsQuiesceableWiredConnectionEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsPublishHostAttributionToSystemStatusEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsPublishHostAttributionToSystemStatusEnabled_sPublishHostAttributionToSystemStatusEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSystemInputPickerEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSystemInputPickerEnabled_sIsSystemInputPickerEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsBufferedBadgingAndCapabilitiesEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsBufferedBadgingAndCapabilitiesEnabled_isBufferedBadgingAndCapabilitiesEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAsyncDuckingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAsyncDuckingEnabled_isAsyncDuckingEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __MX_FeatureFlags_IsOffloadActivationOffACQEnabled_block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    if (MX_FeatureFlags_IsAsyncDuckingEnabled_onceToken != -1) {
      dispatch_once(&MX_FeatureFlags_IsAsyncDuckingEnabled_onceToken, &__block_literal_global_101);
    }
    BOOL v0 = MX_FeatureFlags_IsAsyncDuckingEnabled_isAsyncDuckingEnabled != 0;
  }
  else
  {
    BOOL v0 = 0;
  }
  MX_FeatureFlags_IsOffloadActivationOffACQEnabled_isOffloadActivationOffACQEnabled = v0;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled_isSystemRemoteDisplayContextEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsMaxSpeakerVolumeLimitEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsMaxSpeakerVolumeLimitEnabled_sIsMaxSpeakerVolumeLimitEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsOnenessEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsOnenessEnabled_sIsOnenessEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __MX_FeatureFlags_IsSystemSoundsMutingBehaviorInOnenessEnabled_block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    if (MX_FeatureFlags_IsOnenessEnabled_onceToken != -1) {
      dispatch_once(&MX_FeatureFlags_IsOnenessEnabled_onceToken, &__block_literal_global_114);
    }
    BOOL v0 = MX_FeatureFlags_IsOnenessEnabled_sIsOnenessEnabled != 0;
  }
  else
  {
    BOOL v0 = 0;
  }
  MX_FeatureFlags_IsSystemSoundsMutingBehaviorInOnenessEnabled_sIsSystemSoundsMutingBehaviorInOnenessEnabled = v0;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __MX_FeatureFlags_IsInterruptingPlayingSessionsInOnenessEnabled_block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    if (MX_FeatureFlags_IsOnenessEnabled_onceToken != -1) {
      dispatch_once(&MX_FeatureFlags_IsOnenessEnabled_onceToken, &__block_literal_global_114);
    }
    BOOL v0 = MX_FeatureFlags_IsOnenessEnabled_sIsOnenessEnabled != 0;
  }
  else
  {
    BOOL v0 = 0;
  }
  MX_FeatureFlags_IsInterruptingPlayingSessionsInOnenessEnabled_sIsInterruptingPlayingSessionsInOnenessEnabled = v0;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __MX_FeatureFlags_IsHangsBufferedSizeHintEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsHangsBufferedSizeHintEnabled_sHangsBufferedSizeHintEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsHangsAudioSessionClientCachingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsHangsAudioSessionClientCachingEnabled_sHangsAudioSessionClientCachingEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCarPlayRingtoneFadeInEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCarPlayRingtoneFadeInEnabled_sIsCarPlayRingtoneFadeInEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSmartRoutingInEarQueryEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSmartRoutingInEarQueryEnabled_sIsSmartRoutingInEarQueryEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsStartupSequenceChangeEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsStartupSequenceChangeEnabled_isStartupSequenceChangeEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsNowPlayingAppStackEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsNowPlayingAppStackEnabled_sIsNowPlayingAppStackEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSessionBasedMutingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  MX_FeatureFlags_IsSessionBasedMutingEnabled_isSessionBasedMutingEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled_reduceRouteDiscoveryQueueHopping = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsProtectedAppsEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsProtectedAppsEnabled_isProtectedAppsEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAllowBackgroundPlaybackEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAllowBackgroundPlaybackEnabled_isAllowBackgroundPlaybackEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsOverdubRecordingEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsOverdubRecordingEnabled_isOverdubRecordingEnabled = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

id __26__MX_TelephonyClient_init__block_invoke(uint64_t a1)
{
  v5[20] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) getUserDefaultVoiceSubscriptionContext:v5];
  if (v5[0]
    || result
    && ((result = (id)[*(id *)(*(void *)(a1 + 32) + 8) copyMobileSubscriberCountryCode:result error:v5], v5[0])|| result&& ((result = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "copyMobileSubscriberIsoCountryCode:error:", result, v5), v5[0])|| (result ? (BOOL v4 = dword_1E9359ED0 == 0) : (BOOL v4 = 1), !v4))))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __46__MX_TelephonyClient_copyIsoCountryCodeForMCC__block_invoke(uint64_t a1)
{
  v5[20] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) getUserDefaultVoiceSubscriptionContext:v5];
  if (v5[0]) {
    goto LABEL_7;
  }
  if (!result) {
    return result;
  }
  uint64_t result = (uint64_t)(id)[*(id *)(*(void *)(a1 + 32) + 8) copyMobileSubscriberCountryCode:result error:v5];
  if (v5[0]) {
    goto LABEL_7;
  }
  if (!result) {
    return result;
  }
  uint64_t result = (uint64_t)(id)[*(id *)(*(void *)(a1 + 32) + 8) copyMobileSubscriberIsoCountryCode:result error:v5];
  if (v5[0])
  {
LABEL_7:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    BOOL v4 = (void *)result;
    if (result)
    {
      uint64_t result = [(id)result length];
      if (result)
      {
        uint64_t result = [v4 isEqualToString:&stru_1EE5E8D28];
        if ((result & 1) == 0)
        {
          uint64_t result = [v4 uppercaseString];
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
        }
      }
    }
  }
  return result;
}

id __40__MX_TelephonyClient_getIsInHomeCountry__block_invoke(uint64_t a1)
{
  v4[20] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) getUserDefaultVoiceSubscriptionContext:v4];
  if (v4[0]) {
    goto LABEL_4;
  }
  if (!result) {
    return result;
  }
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 8) copyIsInHomeCountry:result error:v4];
  if (v4[0])
  {
LABEL_4:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else if (result)
  {
    id result = (id)[result BOOLValue];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

void __62__MX_TelephonyClient_copyCountryNameFromOperatorCountryBundle__block_invoke(uint64_t a1)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) getUserDefaultVoiceSubscriptionContext:&v10];
  if (v10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    uint64_t v4 = v2;
    if (v2)
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x3052000000;
      os_log_type_t v14 = __Block_byref_object_copy__2;
      v15 = __Block_byref_object_dispose__2;
      uint64_t v5 = (objc_class *)getCTBundleClass_softClass;
      uint64_t v16 = getCTBundleClass_softClass;
      if (!getCTBundleClass_softClass)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __getCTBundleClass_block_invoke;
        v17[3] = &unk_1E57C5B30;
        v17[4] = &v11;
        __getCTBundleClass_block_invoke((uint64_t)v17);
        uint64_t v5 = (objc_class *)v12[5];
      }
      _Block_object_dispose(&v11, 8);
      CFArrayRef v6 = (void *)[[v5 alloc] initWithBundleType:6];
      uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copyCarrierBundleValue:v4 key:@"CountryName" bundleType:v6 error:&v10];
      v8 = v7;
      if (v10)
      {
        unsigned __int8 v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else if ([v7 length])
      {
        if (([v8 isEqualToString:&stru_1EE5E8D28] & 1) == 0) {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8;
        }
      }
    }
  }
}

MX_TelephonyClient *__mx_telephonyClient_Initialize_block_invoke()
{
  id result = (MX_TelephonyClient *)CoreTelephonyLibraryCore();
  if (result)
  {
    id result = objc_alloc_init(MX_TelephonyClient);
    gTelephonyClient = (uint64_t)result;
    if (!result)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (MX_TelephonyClient *)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void *__MX_CoreServices_Initialize_block_invoke()
{
  id result = dlopen("/System/Library/Frameworks/CoreServices.framework/CoreServices", 4);
  gCoreServicesLib = (uint64_t)result;
  if (result)
  {
    gLSApplicationProxyClass = (uint64_t)objc_getClass("LSApplicationProxy");
    gLSApplicationWorkspaceClass = (uint64_t)objc_getClass("LSApplicationWorkspace");
    gLSBundleRecordClass = (uint64_t)objc_getClass("LSBundleRecord");
    gLSApplicationExtensionRecordClass = (uint64_t)objc_getClass("LSApplicationExtensionRecord");
    gDeviceManagementPolicyCache = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    gObserver = objc_alloc_init(MX_DeviceManagementPolicyDidChangeObserver);
    char v1 = (void *)[(id)gLSApplicationWorkspaceClass defaultWorkspace];
    id result = (void *)[v1 addObserver:gObserver];
    gCoreServicesIsInitialized = 1;
  }
  return result;
}

dispatch_queue_t __MX_CoreServices_GetSerialQueue_block_invoke()
{
  BOOL v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.mediaexperience.CoreServices", v0);
  MX_CoreServices_GetSerialQueue_sSerialQueue = (uint64_t)result;
  return result;
}

void __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (gCoreServicesIsInitialized == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v1 = *(void **)(a1 + 32);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v19 != v4) {
            objc_enumerationMutation(v1);
          }
          CFArrayRef v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "bundleIdentifier", v12, v13);
          cmsmLSUpdateDeviceManagementCache([v6 deviceManagementPolicy]);
          if ([v6 deviceManagementPolicy])
          {
            if (CMSMUtility_IsCarPlaySessionPresent())
            {
              if (dword_1E9359ED0)
              {
                unsigned int v17 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v8 = v17;
                if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                  unsigned int v9 = v8;
                }
                else {
                  unsigned int v9 = v8 & 0xFFFFFFFE;
                }
                if (v9)
                {
                  uint64_t v10 = [v6 bundleIdentifier];
                  int v22 = 136315394;
                  dispatch_semaphore_t v23 = "-[MX_DeviceManagementPolicyDidChangeObserver deviceManagementPolicyDidChange:]_block_invoke";
                  __int16 v24 = 2114;
                  uint64_t v25 = v10;
                  LODWORD(v13) = 22;
                  v12 = &v22;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            else
            {
              uint64_t v11 = MXGetNotificationSenderQueue();
              v15[0] = MEMORY[0x1E4F143A8];
              v15[1] = 3221225472;
              v15[2] = __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke_2;
              v15[3] = &unk_1E57C6368;
              v15[4] = v6;
              MXDispatchAsync((uint64_t)"-[MX_DeviceManagementPolicyDidChangeObserver deviceManagementPolicyDidChange:]_block_invoke", (uint64_t)"MX_CoreServices.m", 275, 0, 0, v11, (uint64_t)v15);
            }
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v3);
    }
  }
}

void __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMNotificationUtility_PostStopCommandToActiveClientWithDisplayID(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier", v3, v4), 0);
}

id __MX_FrontBoardServices_Initialize_block_invoke()
{
  BOOL v0 = (void *)[(id)gFBSDisplayLayoutMonitorConfigurationClass configurationForDefaultMainDisplayMonitor];
  [v0 setTransitionHandler:&__block_literal_global_6_0];
  id result = (id)[(id)gFBSDisplayLayoutMonitorClass monitorWithConfiguration:v0];
  gFrontBoardServicesMonitor = (uint64_t)result;
  return result;
}

uint64_t __42__MX_GEOCountryConfigurationObserver_init__block_invoke(uint64_t a1)
{
  v13[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  uint64_t v2 = (void *)getGEOCountryConfigurationClass_softClass;
  uint64_t v12 = getGEOCountryConfigurationClass_softClass;
  if (!getGEOCountryConfigurationClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getGEOCountryConfigurationClass_block_invoke;
    v13[3] = &unk_1E57C5B30;
    v13[4] = &v7;
    __getGEOCountryConfigurationClass_block_invoke((uint64_t)v13);
    uint64_t v2 = (void *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  *(void *)(*(void *)(a1 + 32) + 16) = [v2 sharedConfiguration];
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) countryCode];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v5, v6), "addObserver:selector:name:object:", *(void *)(a1 + 32), sel_countryConfigurationDidChange_, getGEOCountryConfigurationCountryCodeDidChangeNotification(), 0);
}

uint64_t __59__MX_GEOCountryConfigurationObserver_getCurrentCountryCode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) length];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) isEqualToString:&stru_1EE5E8D28];
    if ((result & 1) == 0) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(a1 + 32) + 24);
    }
  }
  return result;
}

uint64_t __91__MX_GEOCountryConfigurationObserver__updateCountryCodeFromCurrentGeoCountryConfiguration___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

MX_GEOCountryConfigurationObserver *__mx_geoCountryConfigurationObserver_Initialize_block_invoke()
{
  uint64_t result = (MX_GEOCountryConfigurationObserver *)GeoServicesLibraryCore();
  if (result)
  {
    uint64_t result = objc_alloc_init(MX_GEOCountryConfigurationObserver);
    gGeoCountryConfigurationObserver = (uint64_t)result;
    if (!result)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (MX_GEOCountryConfigurationObserver *)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void __27__MX_HIDEventObserver_init__block_invoke(uint64_t a1)
{
  v9[23] = *MEMORY[0x1E4F143B8];
  v8[0] = [MEMORY[0x1E4F28ED0] numberWithInteger:65280];
  v9[0] = @"PrimaryUsagePage";
  v8[1] = [MEMORY[0x1E4F28ED0] numberWithInteger:6];
  v9[1] = @"PrimaryUsage";
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  *(void *)(*(void *)(a1 + 32) + 8) = IOHIDEventSystemClientCreateWithType();
  if (*(void *)(*(void *)(a1 + 32) + 8)
    && (IOHIDEventSystemClientSetMatching(),
        IOHIDEventSystemClientRegisterEventCallback(),
        CFRunLoopGetMain(),
        IOHIDEventSystemClientScheduleWithRunLoop(),
        (uint64_t v2 = *(__IOHIDEventSystemClient **)(*(void *)(a1 + 32) + 8)) != 0))
  {
    CFArrayRef v3 = IOHIDEventSystemClientCopyServices(v2);
    int SmartCoverState = mx_ioKit_getSmartCoverState(v3, 1);
    unsigned int v5 = mx_ioKit_getSmartCoverState(v3, 2) | SmartCoverState;
    BOOL v6 = v5 == 3;
    gFlap1StateIsEngaged = v5 > 1;
    gOpenStateIsEngaged = v5 & 1;
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = v6;
  CMSMDeviceState_UpdateSmartCoverState(*(unsigned __int8 *)(*(void *)(a1 + 32) + 16));
}

void __35__MX_HIDEventObserver_handleEvent___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) smartCoverClosed];
  if (IOHIDEventGetType() == 3) {
    [*(id *)(a1 + 32) handleButtonEvent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
  int v3 = [*(id *)(a1 + 32) smartCoverClosed];
  if (v2 != v3) {
    CMSMDeviceState_UpdateSmartCoverState(v3);
  }
  uint64_t v4 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v4)
  {
    CFRelease(v4);
  }
}

void __MX_IOKit_Initialize_block_invoke()
{
  BOOL v0 = (void *)MEMORY[0x1997179E0]();
  gMXHIDEventObserver = objc_alloc_init(MX_HIDEventObserver);
  if (!gMXHIDEventObserver)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __MX_RunningBoardServices_StopMonitoringForPID_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPredicates:", objc_msgSend(*(id *)(a1 + 32), "allObjects"));
  int v3 = *(void **)(a1 + 32);
}

uint64_t __26__MX_NetworkObserver_init__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v2 = (uint64_t (*)(uint64_t))getnw_path_monitor_create_with_typeSymbolLoc_ptr;
  v37 = getnw_path_monitor_create_with_typeSymbolLoc_ptr;
  if (!getnw_path_monitor_create_with_typeSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getnw_path_monitor_create_with_typeSymbolLoc_block_invoke;
    v32 = &unk_1E57C5B30;
    v33 = &v34;
    int v3 = (void *)NetworkLibrary();
    v35[3] = (uint64_t)dlsym(v3, "nw_path_monitor_create_with_type");
    getnw_path_monitor_create_with_typeSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    int v2 = (uint64_t (*)(uint64_t))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v2) {
    goto LABEL_24;
  }
  *(void *)(*(void *)(a1 + 32) + 16) = v2(2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __26__MX_NetworkObserver_init__block_invoke_2;
  v28[3] = &unk_1E57CADC8;
  v28[4] = v4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  BOOL v6 = (void (*)(uint64_t, void *))getnw_path_monitor_set_update_handlerSymbolLoc_ptr;
  v37 = getnw_path_monitor_set_update_handlerSymbolLoc_ptr;
  if (!getnw_path_monitor_set_update_handlerSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getnw_path_monitor_set_update_handlerSymbolLoc_block_invoke;
    v32 = &unk_1E57C5B30;
    v33 = &v34;
    uint64_t v7 = (void *)NetworkLibrary();
    v35[3] = (uint64_t)dlsym(v7, "nw_path_monitor_set_update_handler");
    getnw_path_monitor_set_update_handlerSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    BOOL v6 = (void (*)(uint64_t, void *))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v6)
  {
LABEL_24:
    __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
    goto LABEL_27;
  }
  v6(v5, v28);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v8 + 8);
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v11 = (void (*)(uint64_t, uint64_t))getnw_path_monitor_set_queueSymbolLoc_ptr;
  v37 = getnw_path_monitor_set_queueSymbolLoc_ptr;
  if (!getnw_path_monitor_set_queueSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getnw_path_monitor_set_queueSymbolLoc_block_invoke;
    v32 = &unk_1E57C5B30;
    v33 = &v34;
    uint64_t v12 = (void *)NetworkLibrary();
    uint64_t v13 = dlsym(v12, "nw_path_monitor_set_queue");
    *(void *)(v33[1] + 24) = v13;
    getnw_path_monitor_set_queueSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    uint64_t v11 = (void (*)(uint64_t, uint64_t))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v11) {
    goto LABEL_26;
  }
  v11(v9, v10);
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  v15 = (void (*)(uint64_t))getnw_path_monitor_startSymbolLoc_ptr;
  v37 = getnw_path_monitor_startSymbolLoc_ptr;
  if (!getnw_path_monitor_startSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getnw_path_monitor_startSymbolLoc_block_invoke;
    v32 = &unk_1E57C5B30;
    v33 = &v34;
    uint64_t v16 = (void *)NetworkLibrary();
    unsigned int v17 = dlsym(v16, "nw_path_monitor_start");
    *(void *)(v33[1] + 24) = v17;
    getnw_path_monitor_startSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    v15 = (void (*)(uint64_t))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v15) {
    goto LABEL_26;
  }
  v15(v14);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  long long v18 = getnw_path_create_evaluator_for_endpointSymbolLoc_ptr;
  v37 = getnw_path_create_evaluator_for_endpointSymbolLoc_ptr;
  if (!getnw_path_create_evaluator_for_endpointSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getnw_path_create_evaluator_for_endpointSymbolLoc_block_invoke;
    v32 = &unk_1E57C5B30;
    v33 = &v34;
    long long v19 = (void *)NetworkLibrary();
    long long v20 = dlsym(v19, "nw_path_create_evaluator_for_endpoint");
    *(void *)(v33[1] + 24) = v20;
    getnw_path_create_evaluator_for_endpointSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    long long v18 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v18) {
    goto LABEL_26;
  }
  uint64_t result = ((uint64_t (*)(void, void))v18)(0, 0);
  uint64_t v22 = result;
  if (!result) {
    goto LABEL_21;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  dispatch_semaphore_t v23 = (uint64_t (*)(uint64_t))getnw_path_evaluator_copy_pathSymbolLoc_ptr;
  v37 = getnw_path_evaluator_copy_pathSymbolLoc_ptr;
  if (!getnw_path_evaluator_copy_pathSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getnw_path_evaluator_copy_pathSymbolLoc_block_invoke;
    v32 = &unk_1E57C5B30;
    v33 = &v34;
    __int16 v24 = (void *)NetworkLibrary();
    uint64_t v25 = dlsym(v24, "nw_path_evaluator_copy_path");
    *(void *)(v33[1] + 24) = v25;
    getnw_path_evaluator_copy_pathSymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    dispatch_semaphore_t v23 = (uint64_t (*)(uint64_t))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v23)
  {
LABEL_26:
    __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
LABEL_27:
    __break(1u);
  }
  uint64_t v26 = v23(v22);
  [*(id *)(a1 + 32) networkPathUpdate:v26];
  uint64_t result = soft_nw_release(v26);
LABEL_21:
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __26__MX_NetworkObserver_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) networkPathUpdate:a2];
}

uint64_t __47__MX_NetworkObserver_isCarrierNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

MX_NetworkObserver *__mx_networkObserver_Initialize_block_invoke()
{
  uint64_t result = (MX_NetworkObserver *)NetworkLibraryCore();
  if (result)
  {
    uint64_t result = objc_alloc_init(MX_NetworkObserver);
    gNetworkObserver = (uint64_t)result;
    if (!result)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (MX_NetworkObserver *)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

@end