@interface SetProperty
@end

@implementation SetProperty

void __discoverer_SetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!FigEndpointDescriptorUtility_IsAudiomxdGuardRailsEnabled()
    || FigCFEqual()
    || FigCFEqual())
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 48), @"DiscoveryMode"))
    {
      if (FigCFEqual() && MX_FeatureFlags_IsCorianderEnabled())
      {
        v2 = *(const void **)(a1 + 56);
        if (v2) {
          CFRetain(v2);
        }
        NotificationQueue = FigRouteDiscoveryManagerGetNotificationQueue();
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __discoverer_SetProperty_block_invoke_2_47;
        v38[3] = &__block_descriptor_40_e5_v8__0l;
        v38[4] = *(void *)(a1 + 56);
        MXDispatchAsync((uint64_t)"discoverer_SetProperty_block_invoke", (uint64_t)"FigRouteDiscoverer.m", 502, 0, 0, NotificationQueue, (uint64_t)v38);
      }
      else
      {
        if (FigCFEqual()) {
          BOOL v4 = dword_1E9359D80 == 0;
        }
        else {
          BOOL v4 = 1;
        }
        if (!v4)
        {
          int v40 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v7 = *(CFTypeRef **)(a1 + 40);
        if (*v7)
        {
          CFTypeRef v8 = CFRetain(*v7);
          v7 = *(CFTypeRef **)(a1 + 40);
          CFTypeRef v9 = *v7;
        }
        else
        {
          CFTypeRef v9 = 0;
          CFTypeRef v8 = 0;
        }
        v10 = *(const void **)(a1 + 64);
        CFTypeRef *v7 = v10;
        if (v10) {
          CFRetain(v10);
        }
        if (v9) {
          CFRelease(v9);
        }
        if (FigCFEqual())
        {
          if (dword_1E9359D80)
          {
            int v40 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          MEMORY[0x199716E90](*(void *)(*(void *)(a1 + 40) + 64));
          uint64_t v12 = *(void *)(a1 + 40);
          *(unsigned char *)(v12 + 72) = 0;
          MEMORY[0x199716EA0](*(void *)(v12 + 64));
        }
        if (MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled() && !FigCFEqual()) {
          FigRouteDiscoveryManagerRemoveCachedDiscoverers();
        }
        if (FigCFEqual())
        {
          if (dword_1E9359D80)
          {
            int v40 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (v8) {
            CFRelease(v8);
          }
        }
        else
        {
          if (dword_1E9359D80)
          {
            int v40 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!FigRouteDiscovereryManagerIsNewDiscoveryModeHigher() && FigRouteDiscovererShouldLogForClient())
          {
            uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
            MEMORY[0x199716E90](*(void *)(*(void *)(a1 + 40) + 64));
            CFArrayRef v16 = (const __CFArray *)*(id *)(*(void *)(a1 + 40) + 80);
            uint64_t v17 = *(void *)(a1 + 40);
            *(void *)(v17 + 48) = UpTimeNanoseconds;
            MEMORY[0x199716EA0](*(void *)(v17 + 64));
            discoverer_logAvailableRouteDetails(*(void *)(*(void *)(a1 + 40) + 16), *(_DWORD *)(*(void *)(a1 + 40) + 40), v16);
            if (v16) {
              CFRelease(v16);
            }
          }
          if (MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled() && FigCFEqual()) {
            FigRouteDiscoveryManagerAddToCachedDiscoverers();
          }
          FigRouteDiscoveryManagerUpdateDiscoveryMode();
          if (FigRouteDiscovereryManagerIsNewDiscoveryModeHigher())
          {
            uint64_t v45 = 0;
            v46 = &v45;
            uint64_t v47 = 0x2020000000;
            uint64_t v48 = 0;
            uint64_t v41 = 0;
            v42 = &v41;
            uint64_t v43 = 0x2020000000;
            uint64_t v44 = 0;
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v33 = __discoverer_SetProperty_block_invoke_49;
            v34 = &unk_1E57C9240;
            uint64_t v18 = *(void *)(a1 + 40);
            v36 = &v41;
            uint64_t v37 = v18;
            v35 = &v45;
            if (MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled()) {
              FigRouteDiscoveryManagerRunBlockOnSerialQueueIfOnEmbeddedPlatforms((uint64_t)v32);
            }
            else {
              v33(v32);
            }
            MEMORY[0x199716E90](*(void *)(*(void *)(a1 + 40) + 64));

            id v19 = (id)v46[3];
            uint64_t v20 = *(void *)(a1 + 40);
            *(void *)(v20 + 88) = v19;

            v21 = v42;
            if (*(_DWORD *)(*(void *)(a1 + 40) + 40) == 8)
            {
              CFArrayRef v22 = (const __CFArray *)v42[3];
              if (v22)
              {
                CFIndex Count = CFArrayGetCount(v22);
                v21 = v42;
                if (Count)
                {
                  objc_msgSend((id)objc_msgSend((id)v42[3], "objectAtIndex:", 0), "setValue:forKey:", @"Default", @"RouteType");
                  v21 = v42;
                }
              }
            }
            id v24 = (id)v21[3];
            uint64_t v25 = *(void *)(a1 + 40);
            *(void *)(v25 + 80) = v24;
            MEMORY[0x199716EA0](*(void *)(v25 + 64));
            v26 = (const void *)v42[3];
            if (v26)
            {
              CFRelease(v26);
              v42[3] = 0;
            }
            if (FigCFEqual() && FigCFEqual()
              || FigCFEqual()
              && FigCFEqual()
              && *(_DWORD *)(*(void *)(a1 + 40) + 40) == 8)
            {
              discoverer_updateUserSelectionAvailableAndNotifyIfRoutePresentChanged(*(const void **)(a1 + 56), (const __CFArray *)v46[3], 0);
            }
            CFArrayRef v27 = (const __CFArray *)v46[3];
            if (v27 && CFArrayGetCount(v27))
            {
              v28 = *(const void **)(a1 + 56);
              if (v28) {
                CFRetain(v28);
              }
              v29 = FigRouteDiscoveryManagerGetNotificationQueue();
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __discoverer_SetProperty_block_invoke_3;
              v31[3] = &__block_descriptor_40_e5_v8__0l;
              v31[4] = *(void *)(a1 + 56);
              MXDispatchAsync((uint64_t)"discoverer_SetProperty_block_invoke_2", (uint64_t)"FigRouteDiscoverer.m", 636, 0, 0, v29, (uint64_t)v31);
            }
            v30 = (const void *)v46[3];
            if (v30) {
              CFRelease(v30);
            }
            _Block_object_dispose(&v41, 8);
            _Block_object_dispose(&v45, 8);
          }
          if (v8) {
            CFRelease(v8);
          }
        }
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12784;
    }
  }
  else if (dword_1E9359D80)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __central_SetProperty_block_invoke(void *a1)
{
  uint64_t v3 = a1[5];
  v2 = (const void *)a1[6];
  CFBooleanRef v4 = (const __CFBoolean *)a1[7];
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (*DerivedStorage)
  {
    uint64_t result = FigSignalErrorAt();
  }
  else
  {
    v6 = DerivedStorage;
    if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F210A0]))
    {
      if (*v6)
      {
        uint64_t result = 4294954511;
      }
      else if (v4 && (CFTypeID v7 = CFGetTypeID(v4), v7 == CFBooleanGetTypeID()))
      {
        int Value = CFBooleanGetValue(v4);
        if (Value) {
          uint64_t v9 = 0x100000000;
        }
        else {
          uint64_t v9 = 0xFFFFFFFF00000000;
        }
        if (Value) {
          v10 = @"iOS navigation session started";
        }
        else {
          v10 = @"iOS navigation session ended";
        }
        uint64_t result = FigEndpointCentralUpdateiOSDeviceState(v3, v9, 0, (uint64_t)v10, 1);
      }
      else
      {
        uint64_t result = 4294954516;
      }
    }
    else if (CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20CE8]) || CFEqual(v2, (CFTypeRef)*MEMORY[0x1E4F20DA0]))
    {
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
      uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      v15 = *(uint64_t (**)(uint64_t, const void *, const __CFBoolean *))(v14 + 56);
      if (v15) {
        uint64_t result = v15(CMBaseObject, v2, v4);
      }
      else {
        uint64_t result = 4294954514;
      }
    }
    else
    {
      uint64_t result = 4294954509;
    }
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void __discoverer_SetProperty_block_invoke_2_47(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

CFArrayRef __discoverer_SetProperty_block_invoke_49(void *a1)
{
  FigRouteDiscoveryManagerCopyRoutesForTypeAndAudioSessionID(*MEMORY[0x1E4F1CF80], *(_DWORD *)(a1[6] + 40), *(_DWORD *)(a1[6] + 8), *(void *)(a1[6] + 24), (CFMutableArrayRef *)(*(void *)(a1[4] + 8) + 24));
  CFArrayRef result = FigRouteDiscoveryManagerCopyRouteDescriptorsFromEndpointsAndAudioSessionID(*(const __CFArray **)(*(void *)(a1[4] + 8) + 24), *(unsigned int *)(a1[6] + 8));
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

void __discoverer_SetProperty_block_invoke_3(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t __routingContextResilientRemote_SetProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeID v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 56);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

uint64_t __endpointAggregate_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 56);
  if (!v6) {
    return 4294954514;
  }
  return v6(CMBaseObject, v1, v2);
}

@end