void sub_194A50EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avplayeritem_fpItemNotificationCallback(uint64_t a1, void *a2, const void *a3, const void *a4, const void *a5)
{
  v9 = (void *)MEMORY[0x199715AE0]();
  uint64_t v10 = [a2 _player];
  if (a3) {
    CFRetain(a3);
  }
  if (a5) {
    CFRetain(a5);
  }
  if (a4) {
    CFRetain(a4);
  }
  v11 = [a2 _copyStateDispatchQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __avplayeritem_fpItemNotificationCallback_block_invoke;
  v12[3] = &unk_1E57B42A0;
  v12[4] = a2;
  v12[5] = v10;
  v12[6] = v11;
  v12[7] = a3;
  v12[8] = a5;
  v12[9] = a4;
  dispatch_async(v11, v12);
  dispatch_release(v11);
}

uint64_t AVOutputDeviceVolumeControlTypeFromFigType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_194C5FE48[a1 - 1];
  }
}

void sub_194A51604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A516F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A517B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avplayeritem_figassetNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, const __CFDictionary *a5)
{
  v8 = (void *)MEMORY[0x199715AE0]();
  v9 = [a2 _copyStateDispatchQueue];
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31ED8])) {
    goto LABEL_13;
  }
  CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F32168]);
  int v10 = FigCFEqual();
  if (v10)
  {
    [a2 _markAsReadyForInspectionOfDuration];
LABEL_4:
    int v11 = 0;
    int v12 = 0;
    goto LABEL_5;
  }
  if (FigCFEqual() && objc_msgSend((id)objc_msgSend(a2, "asset"), "_isStreaming"))
  {
    [a2 _markAsReadyForInspectionOfTracks];
    int v12 = 0;
    int v11 = 1;
  }
  else
  {
    if (!FigCFEqual()) {
      goto LABEL_4;
    }
    [a2 _markFigAssetAsReadyForInspectionOfMediaSelectionOptions];
    int v11 = 0;
    int v12 = 1;
  }
LABEL_5:
  if (v10) {
    int v13 = 1;
  }
  else {
    int v13 = v11;
  }
  if ((v13 | v12) != 1 || v9 == 0)
  {
LABEL_13:
    if (!v9) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  uint64_t v15 = [a2 _player];
  v16 = (const void *)v15;
  if (v11)
  {
    uint64_t v17 = [a2 _tracks];
    if (!v16) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v17 = 0;
  if (v15) {
LABEL_22:
  }
    CFRetain(v16);
LABEL_23:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __avplayeritem_figassetNotificationCallback_block_invoke;
  v18[3] = &unk_1E57B42C8;
  BOOL v19 = v10 != 0;
  char v20 = v11;
  v18[4] = a2;
  v18[5] = v17;
  char v21 = v12;
  v18[6] = v16;
  dispatch_async(v9, v18);
LABEL_24:
  dispatch_release(v9);
LABEL_25:
}

uint64_t AVStringForOSType(unsigned int a1)
{
  unsigned int v1 = bswap32(a1);
  uint64_t v2 = 3;
  if (HIBYTE(a1)) {
    uint64_t v2 = 4;
  }
  uint64_t v3 = v2 - (a1 < 0x10000) - (a1 < 0x100) - (a1 == 0);
  unsigned int v6 = v1;
  __strncpy_chk();
  v5[v3] = 0;
  return [NSString stringWithCString:v5 encoding:30];
}

uint64_t AVOutputDeviceGetDeviceTypeAndSubTypeFromRouteDescriptor(const __CFDictionary *a1, uint64_t *a2, uint64_t *a3)
{
  CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E4F75180]);
  CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E4F75288]);
  CFDictionaryGetValue(a1, @"IsContinuityScreenOutput");
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 18;
    goto LABEL_17;
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v8 = 1;
    uint64_t v7 = 14;
    goto LABEL_17;
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v7 = 1;
    uint64_t v8 = 1;
    goto LABEL_17;
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v8 = 3;
LABEL_9:
    uint64_t v7 = 1;
    goto LABEL_17;
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v8 = 4;
LABEL_12:
    uint64_t v7 = 2;
    goto LABEL_17;
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t v8 = 4;
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t result = FigCFEqual();
    if (result)
    {
      uint64_t v8 = 3;
      uint64_t v7 = 4;
    }
    else
    {
      uint64_t result = FigCFEqual();
      if (result)
      {
        uint64_t v8 = 1;
        goto LABEL_12;
      }
      uint64_t result = FigCFEqual();
      if (result || (uint64_t result = FigCFEqual(), result))
      {
        uint64_t v8 = 4;
        uint64_t v7 = 5;
      }
      else
      {
        uint64_t result = FigCFEqual();
        if (result)
        {
          uint64_t v8 = 4;
          uint64_t v7 = 6;
        }
        else
        {
          uint64_t result = FigCFEqual();
          if (result)
          {
            uint64_t v8 = 4;
            uint64_t v7 = 7;
          }
          else if (FigCFEqual())
          {
            CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E4F75200]);
            uint64_t result = FigCFEqual();
            if (result || (uint64_t result = FigCFEqual(), result))
            {
              uint64_t v8 = 0;
              goto LABEL_9;
            }
            uint64_t result = FigCFEqual();
            if (result)
            {
              uint64_t v8 = 0;
              uint64_t v7 = 11;
            }
            else
            {
              uint64_t result = FigCFEqual();
              if (result)
              {
                uint64_t v8 = 0;
                uint64_t v7 = 16;
              }
              else
              {
                uint64_t result = FigCFEqual();
                if (result)
                {
                  uint64_t v8 = 0;
                  uint64_t v7 = 17;
                }
                else
                {
                  uint64_t result = FigCFEqual();
                  if (result)
                  {
                    uint64_t v8 = 0;
                    uint64_t v7 = 13;
                  }
                  else
                  {
                    uint64_t result = FigCFEqual();
                    if (result)
                    {
                      uint64_t v8 = 0;
                      uint64_t v7 = 12;
                    }
                    else
                    {
                      uint64_t result = FigCFEqual();
                      if (result)
                      {
                        uint64_t v8 = 0;
                        uint64_t v7 = 18;
                      }
                      else
                      {
                        uint64_t result = FigCFEqual();
                        if (result)
                        {
                          uint64_t v8 = 0;
                          uint64_t v7 = 19;
                        }
                        else
                        {
                          uint64_t result = FigCFEqual();
                          if (result)
                          {
                            uint64_t v8 = 0;
                            uint64_t v7 = 20;
                          }
                          else
                          {
                            uint64_t result = FigCFEqual();
                            if (result || (uint64_t result = FigCFEqual(), result))
                            {
                              uint64_t v8 = 0;
                              uint64_t v7 = 15;
                            }
                            else
                            {
                              uint64_t result = FigCFEqual();
                              uint64_t v8 = 0;
                              uint64_t v7 = 15;
                              if (!result) {
                                uint64_t v7 = 0;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          else
          {
            uint64_t result = FigCFEqual();
            if (result)
            {
              uint64_t v8 = 4;
              uint64_t v7 = 8;
            }
            else
            {
              uint64_t result = FigCFEqual();
              if (result)
              {
                uint64_t v8 = 1;
                uint64_t v7 = 9;
              }
              else
              {
                uint64_t result = FigCFEqual();
                if (result)
                {
                  uint64_t v8 = 4;
                  uint64_t v7 = 10;
                }
                else
                {
                  uint64_t result = FigCFEqual();
                  if (result)
                  {
                    uint64_t v7 = 0;
                    uint64_t v8 = 2;
                  }
                  else
                  {
                    uint64_t result = FigCFEqual();
                    uint64_t v8 = result != 0;
                    uint64_t v7 = 3;
                    if (!result) {
                      uint64_t v7 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_17:
  if (a2) {
    *a2 = v8;
  }
  if (a3) {
    *a3 = v7;
  }
  return result;
}

void handleFigAssetLoadingNotification(uint64_t a1, void *a2, const void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a2 _loadingMutex];
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EA8]))
  {
LABEL_7:
    a5 = 0;
    goto LABEL_8;
  }
  if (dword_1EB2D3A80)
  {
    int v25 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a5)
  {
    CFTypeID v11 = CFGetTypeID(a5);
    if (v11 == CFDictionaryGetTypeID())
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F32138]);
      a5 = &v19;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      char v21 = __handleFigAssetLoadingNotification_block_invoke;
      v22 = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v23 = Value;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:
  MEMORY[0x199715030](v9);
  int v13 = (void *)[a2 _loadingBatches];
  v14 = v13;
  if (a5) {
    [v13 enumerateObjectsUsingBlock:a5];
  }
  uint64_t v15 = objc_msgSend(v14, "indexesOfObjectsPassingTest:", &__block_literal_global_532, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v16 = [v14 objectsAtIndexes:v15];
  [v14 removeObjectsAtIndexes:v15];
  MEMORY[0x199715040](v9);
  [a2 _invokeCompletionHandlerForLoadingBatches:v16];
}

void sub_194A53C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A53D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A53E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A53F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A54728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A54B18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A55254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVAssetUTIsAreComplementary(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = a2 != 0;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a2);
        }
        if (objc_msgSend(a1, "containsObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10)) {
          return 0;
        }
      }
      uint64_t v6 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v4;
}

void sub_194A564E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVOutputContextUsesRouteConfigUpdatedNotification()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseRouteConfigUpdatedNotification", @"com.apple.avfoundation", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 0;
  }
  return !v1;
}

uint64_t AVDefaultRoutingContextFactory()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseFigRoutingContextResilientRemote", @"com.apple.avfoundation", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1) {
    return FigRemoteRoutingContextFactoryGetCurrent();
  }
  else {
    return FigResilientRemoteRoutingContextFactoryGetCurrent();
  }
}

dispatch_queue_t av_readwrite_dispatch_queue_create(const char *a1)
{
  uint64_t v2 = dispatch_queue_attr_make_with_overcommit();
  return dispatch_queue_create(a1, v2);
}

uint64_t AVOutputDeviceIsConversationDetectionFeatureEnabled()
{
  return _os_feature_enabled_impl();
}

void sub_194A579F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVVideoOutputSettingsValidPixelBufferAttributesKeys()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F24D70], *MEMORY[0x1E4F24D38], *MEMORY[0x1E4F24E10], *MEMORY[0x1E4F24D08], *MEMORY[0x1E4F24CE0], *MEMORY[0x1E4F24CF0], *MEMORY[0x1E4F24CE8], *MEMORY[0x1E4F24CD0], *MEMORY[0x1E4F24C98], *MEMORY[0x1E4F24CA0], *MEMORY[0x1E4F24CA8], *MEMORY[0x1E4F24D50], *MEMORY[0x1E4F24D78], *MEMORY[0x1E4F24D20], *MEMORY[0x1E4F24D58], *MEMORY[0x1E4F24D40], *MEMORY[0x1E4F24DF8],
           *MEMORY[0x1E4F24CB8],
           *MEMORY[0x1E4F24D68],
           *MEMORY[0x1E4F24CC8],
           *MEMORY[0x1E4F24CB0],
           *MEMORY[0x1E4F24DA8],
           0);
}

void sub_194A58B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A58DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  if (AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_gAVOutputDeviceRouteDiscoverer_Once != -1) {
    dispatch_once(&AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_gAVOutputDeviceRouteDiscoverer_Once, &__block_literal_global_21);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_block_invoke_2;
  v4[3] = &unk_1E57B4010;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)gAVOutputDeviceRouteDiscovererQueue, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_194A5AF18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

AVSerializedMostlySynchronousReentrantBlockScheduler *AVMakeBlockSchedulerThatSerializesBlocksPrefersSynchronousExecutionAndAllowsReentrantExecution()
{
  v0 = objc_alloc_init(AVSerializedMostlySynchronousReentrantBlockScheduler);
  return v0;
}

void *AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(void *result)
{
  if (result)
  {
    BOOL v1 = result;
    if ([result isEqualToString:@"AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted"])
    {
      uint64_t v2 = MEMORY[0x1E4F21F80];
      return *(void **)v2;
    }
    if ([v1 isEqualToString:@"AVCoordinatedPlaybackSuspensionReasonStallRecovery"])
    {
      uint64_t v2 = MEMORY[0x1E4F21FB0];
      return *(void **)v2;
    }
    if ([v1 isEqualToString:@"AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial"])
    {
      uint64_t v2 = MEMORY[0x1E4F21F98];
      return *(void **)v2;
    }
    if ([v1 isEqualToString:@"AVCoordinatedPlaybackSuspensionReasonUserActionRequired"])
    {
      uint64_t v2 = MEMORY[0x1E4F21FB8];
      return *(void **)v2;
    }
    if ([v1 isEqualToString:@"AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible"])
    {
      uint64_t v2 = MEMORY[0x1E4F21F90];
      return *(void **)v2;
    }
    if ([v1 isEqualToString:@"AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime"])return (void *)*MEMORY[0x1E4F21F88]; {
    else
    }
      return v1;
  }
  return result;
}

void sub_194A5C774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A5D154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A5D220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

void __Block_byref_object_dispose__35(uint64_t a1)
{
}

void __Block_byref_object_dispose__36(uint64_t a1)
{
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
}

void __Block_byref_object_dispose__40(uint64_t a1)
{
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
}

void __Block_byref_object_dispose__45(uint64_t a1)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
}

{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
}

{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__19(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__20(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__28(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__31(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__32(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__33(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__34(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__35(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__36(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__37(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__40(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__41(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__43(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__44(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
}

__CFString *AVOutputDeviceAVFListeningModeForFigListeningMode(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t v4 = AVOutputDeviceBluetoothListeningModeNormal;
      goto LABEL_8;
    case 2:
      uint64_t v4 = AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation;
      goto LABEL_8;
    case 3:
      uint64_t v4 = AVOutputDeviceBluetoothListeningModeAudioTransparency;
LABEL_8:
      uint64_t result = *v4;
      break;
    default:
      if (((a1 == 4) & _os_feature_enabled_impl()) != 0) {
        uint64_t result = @"AVOutputDeviceBluetoothListeningModeAutomatic";
      }
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

void *AVOutputDeviceDescriptionsFromFigDescriptions(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [a1 count];
  if (!v2) {
    return 0;
  }
  uint64_t v19 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v23 = *(void *)v25;
    uint64_t v21 = *MEMORY[0x1E4F20450];
    uint64_t v22 = *MEMORY[0x1E4F20458];
    uint64_t v5 = *MEMORY[0x1E4F20460];
    uint64_t v6 = *MEMORY[0x1E4F20430];
    uint64_t v7 = *MEMORY[0x1E4F20438];
    id obj = a1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = [v9 objectForKeyedSubscript:v22];
        uint64_t v11 = [v9 objectForKeyedSubscript:v21];
        uint64_t v12 = [v9 objectForKeyedSubscript:v5];
        uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v6), "BOOLValue");
        uint64_t v14 = AVOutputDeviceSubTypeFromFigSubType(v12);
        uint64_t v15 = [v9 objectForKeyedSubscript:v7];
        if (v10) {
          BOOL v16 = v11 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          uint64_t v17 = [[AVClusterComponentOutputDeviceDescription alloc] initWithDeviceID:v10 deviceName:v11 deviceSubType:v14 isClusterLeader:v13 modelID:v15];
          [v19 addObject:v17];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  return v19;
}

uint64_t AVFigRouteDiscovererFactoryCreateRouteDiscovererWithType(void *a1, int a2)
{
  int valuePtr = a2;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFTypeRef cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  CFDictionaryRef v4 = CFDictionaryCreate(v3, MEMORY[0x1E4F75528], &cf, 1, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t v5 = [a1 createRouteDiscovererWithAllocator:v3 options:v4];
  if (v4) {
    CFRelease(v4);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

AVFigRemoteRouteDiscovererFactory *AVFigRouteDiscovererFactoryGetCurrent()
{
  v0 = objc_alloc_init(AVFigRemoteRouteDiscovererFactory);
  uint64_t result = (AVFigRemoteRouteDiscovererFactory *)dispatch_get_specific(@"AVCurrentRouteDiscovererFactoryKey");
  if (!result) {
    return v0;
  }
  return result;
}

id AVOutputContextGetDefaultDeviceTranslator(uint64_t a1)
{
  BOOL v2 = +[AVOutputDevice prefersRouteDescriptors];
  CFAllocatorRef v3 = off_1E57AD788;
  if (!v2) {
    CFAllocatorRef v3 = off_1E57AD770;
  }
  CFDictionaryRef v4 = (void *)[objc_alloc(*v3) initForUsingRouteConfigUpdatedNotification:a1];
  return v4;
}

void sub_194A607D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __ensureDictionariesOfFigPropertiesForKeys_block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F322E8];
  uint64_t v1 = *MEMORY[0x1E4F32260];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32190], *MEMORY[0x1E4F322E8], *MEMORY[0x1E4F32270], *MEMORY[0x1E4F322E0], *MEMORY[0x1E4F32318], *MEMORY[0x1E4F32260], *MEMORY[0x1E4F32250], *MEMORY[0x1E4F32178], *MEMORY[0x1E4F32238], 0);
  uint64_t v3 = *MEMORY[0x1E4F32188];
  uint64_t v4 = *MEMORY[0x1E4F32310];
  uint64_t v5 = *MEMORY[0x1E4F32308];
  uint64_t v6 = *MEMORY[0x1E4F32180];
  sFigAssetMediaSelectionProperties = (uint64_t)(id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32188], *MEMORY[0x1E4F32310], *MEMORY[0x1E4F347F8], *MEMORY[0x1E4F32308], *MEMORY[0x1E4F32180], @"LocalizedMSODisplayNames", 0);
  uint64_t v49 = *MEMORY[0x1E4F348A8];
  sFigAssetTrackMediaSelectionProperties = (uint64_t)(id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34868], *MEMORY[0x1E4F34870], *MEMORY[0x1E4F34888], *MEMORY[0x1E4F34860], *MEMORY[0x1E4F34878], *MEMORY[0x1E4F324D8], *MEMORY[0x1E4F34838], *MEMORY[0x1E4F34840], *MEMORY[0x1E4F324D0], *MEMORY[0x1E4F32498], *MEMORY[0x1E4F324C8], *MEMORY[0x1E4F348A8], *MEMORY[0x1E4F324B0], 0);
  if (AVUseBackwardCompatibleID3MetadataReader())
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v2];
    [v7 removeObject:v1];
    v46 = v7;
    [v7 addObject:*MEMORY[0x1E4F32268]];
  }
  else
  {
    v46 = (void *)v2;
  }
  v48 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v47 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F347E0], 0);
  uint64_t v45 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32248], 0);
  uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObject:@"playbackCapabilities"];
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32258], 0);
  uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34810], 0);
  uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34820], 0);
  uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34828], 0);
  uint64_t v40 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34818], 0);
  uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);
  uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322D8], 0);
  uint64_t v37 = [MEMORY[0x1E4F1C978] array];
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F347D8], 0);
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F347F0], 0);
  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F321B8], 0);
  uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v1, 0);
  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F321B0], *MEMORY[0x1E4F347D0], 0);
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObject:@"availableMediaCharacteristicsWithMediaSelectionOptions"];
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObject:@"availableMediaCharacteristicsWithMediaSelectionOptions"];
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObject:@"availableMediaCharacteristicsWithMediaSelectionOptions"];
  uint64_t v8 = *MEMORY[0x1E4F322D0];
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322D0], 0);
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322C8], 0);
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, *MEMORY[0x1E4F322A8], 0);
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, v8, v0, 0);
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, v8, v0, 0);
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, v8, v0, 0);
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F321A8], 0);
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F321C0], 0);
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32200], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v5, 0);
  uint64_t v9 = *MEMORY[0x1E4F32290];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32290], 0);
  uint64_t v10 = *MEMORY[0x1E4F32298];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32298], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, v10, v9, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32280], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322F0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32220], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322F8], 0);
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  uint64_t v11 = *MEMORY[0x1E4F32230];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32230], 0);
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v11, 0);
  uint64_t v12 = *MEMORY[0x1E4F321E8];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F321E8], 0);
  uint64_t v13 = *MEMORY[0x1E4F321D0];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F321D0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v12, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v13, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32228], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32240], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322B0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32320], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322B8], v9, v10, 0);
  [MEMORY[0x1E4F1C978] array];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F347E8], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F347C8], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F322A0], 0);
  uint64_t v14 = *MEMORY[0x1E4F32198];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32198], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v14, *MEMORY[0x1E4F322C0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34800], 0);
  sFigAssetPropertiesForKeys = (uint64_t)objc_retain((id)objc_msgSend(v48, "dictionaryWithObjectsAndKeys:", v47, @"duration", v45, @"variants", v44, @"playbackCapabilities", v29, @"contentKeySpecifiersEligibleForPreloading", v43, @"preferredRate", v42, @"preferredVolume", v41, @"preferredSoundCheckVolumeNormalization", v40, @"preferredTransform", v39,
                                                          @"naturalSize",
                                                          v38,
                                                          @"providesPreciseDurationAndTiming",
                                                          v37,
                                                          @"referenceRestrictions",
                                                          v36,
                                                          @"tracks",
                                                          v35,
                                                          @"creationDate",
                                                          v34,
                                                          @"lyrics",
                                                          v33,
                                                          @"commonMetadata",
                                                          v46,
                                                          @"availableMetadataFormats",
                                                          v46,
                                                          @"metadata",
                                                          v32,
                                                          @"ID3Metadata",
                                                          v31,
                                                          @"availableChapterLocales",
                                                          v30,
                                                          @"availableMediaCharacteristicsWithMediaSelectionOptions",
                                                          v18,
                                                          @"preferredMediaSelection",
                                                          v28,
                                                          @"allMediaSelections",
                                                          v27,
                                                          @"hasProtectedContent",
                                                          v26,
                                                          @"originalNetworkContentURL",
                                                          v25,
                                                          @"playable",
                                                          v24,
                                                          @"exportable",
                                                          v23,
                                                          @"readable",
                                                          v22,
                                                          @"composable",
                                                          v21,
                                                          @"compatibleWithSavedPhotosAlbum",
                                                          v20,
                                                          @"compatibleWithAirPlayVideo",
                                                          v19));
  uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v49, 0);
  id result = (id)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, @"tracks", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348C8], 0), @"naturalSize", 0);
  sFigAssetTrackPropertiesForKeys = (uint64_t)result;
  return result;
}

void *AVOutputDeviceSupportedListeningModesForFigListeningModes(char a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:@"AVOutputDeviceBluetoothListeningModeNormal"];
  uint64_t v3 = v2;
  if (a1) {
    [v2 addObject:@"AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"AVOutputDeviceBluetoothListeningModeAudioTransparency"];
  }
  int v4 = _os_feature_enabled_impl();
  if ((a1 & 4) != 0 && v4) {
    [v3 addObject:@"AVOutputDeviceBluetoothListeningModeAutomatic"];
  }
  return v3;
}

uint64_t AVUseBackwardCompatibleID3MetadataReader()
{
  return dyld_program_sdk_at_least() ^ 1;
}

void sub_194A62F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSerializeOnQueueAsyncIfNecessary(NSObject *a1, void *a2)
{
  if (dispatch_get_current_queue() == a1
    || a1 == MEMORY[0x1E4F14428] && [MEMORY[0x1E4F29060] isMainThread])
  {
    int v4 = (void (*)(void *))a2[2];
    v4(a2);
  }
  else
  {
    dispatch_async(a1, a2);
  }
}

void sub_194A63604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194A6379C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A63988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVLayerVideoRectForPlayerLayerBoundsPresentationSizeAndVideoGravity(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
}

double AVLayerScaledPresentationSizeForPlayerLayerBoundsPresentationSizeAndVideoGravity(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  memset(&v12, 0, sizeof(v12));
  AVLayerTransformForPlacement(a1, 0, (uint64_t)&v12, a6, a7, a4, a5);
  CATransform3D v10 = v12;
  memset(&v11, 0, sizeof(v11));
  CATransform3DGetAffineTransform(&v11, &v10);
  return a7 * v11.c + v11.a * a6;
}

void *AVLayerTransformForPlacement@<X0>(void *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  CATransform3D v10 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)(a3 + 80) = v11;
  long long v12 = v10[7];
  *(_OWORD *)(a3 + 96) = v10[6];
  *(_OWORD *)(a3 + 112) = v12;
  long long v13 = v10[1];
  *(_OWORD *)a3 = *v10;
  *(_OWORD *)(a3 + 16) = v13;
  long long v14 = v10[3];
  *(_OWORD *)(a3 + 32) = v10[2];
  *(_OWORD *)(a3 + 48) = v14;
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a4 != *MEMORY[0x1E4F1DB30] || a5 != v15)
  {
    uint64_t v19 = result;
    if (!a2 || (a6 == *MEMORY[0x1E4F1DB30] ? (BOOL v20 = a7 == v15) : (BOOL v20 = 0), !v20))
    {
      id result = (void *)[result isEqualToString:@"AVLayerVideoGravityResize"];
      if (result)
      {
        double v21 = a6 / a4;
        double v22 = a7 / a5;
      }
      else
      {
        id result = (void *)[v19 isEqualToString:@"AVLayerVideoGravityResizeAspectFill"];
        double v23 = fmin(a6 / a4, a7 / a5);
        double v22 = fmax(a6 / a4, a7 / a5);
        if (result) {
          double v21 = v22;
        }
        else {
          double v21 = v23;
        }
        if (!result) {
          double v22 = v23;
        }
      }
      *(double *)a3 = v21;
      *(double *)(a3 + 40) = v22;
    }
  }
  return result;
}

void sub_194A64364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double getVideoPresentationBounds(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  memset(&v14, 0, sizeof(v14));
  AVLayerTransformForPlacement(a1, 0, (uint64_t)&v14, a2, a3, a6, a7);
  CATransform3D v12 = v14;
  memset(&v13, 0, sizeof(v13));
  CATransform3DGetAffineTransform(&v13, &v12);
  return a4 + (a6 - (a3 * v13.c + v13.a * a2)) * 0.5;
}

void sub_194A64834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A64AA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194A64C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A64D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v1 + 504) = *(void *)(a1 + 56);
  *(__n128 *)(v1 + 488) = result;
  return result;
}

__CFString *AVOutputDeviceHeadTrackedSpatialAudioModeFromFigMode(const __CFNumber *a1)
{
  uint64_t v1 = AVOutputDeviceHeadTrackedSpatialAudioModeNever;
  if (a1)
  {
    int valuePtr = 0;
    if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr))
    {
      switch(valuePtr)
      {
        case 0:
          return AVOutputDeviceHeadTrackedSpatialAudioModeNever;
        case 1:
          uint64_t v2 = &AVOutputDeviceHeadTrackedSpatialAudioModeAutomatic;
          goto LABEL_8;
        case 2:
          uint64_t v2 = &AVOutputDeviceHeadTrackedSpatialAudioModeAlways;
          goto LABEL_8;
        case 3:
          uint64_t v2 = &AVOutputDeviceHeadTrackedSpatialAudioModeMultichannelOnly;
LABEL_8:
          uint64_t v1 = *v2;
          break;
        default:
          return v1;
      }
    }
  }
  return v1;
}

void sub_194A65EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6617C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194A663E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A66634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A66ED0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void playerItem_createDefaultProxyTimebase()
{
  CMTimebaseRef timebaseOut = 0;
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  HostTimeClock = CMClockGetHostTimeClock();
  if (!CMTimebaseCreateWithSourceClock(v0, HostTimeClock, &timebaseOut)) {
    CMTimebaseCreateReadOnlyTimebase();
  }
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
}

double AVPlayerItemGetFigPlayerSnapTimesForTimeAndTolerances(CMTime *a1, CMTime *a2, CMTime *a3, CMTime *a4, CMTime *a5)
{
  memset(&v13, 0, sizeof(v13));
  CMTime lhs = *a1;
  CMTime rhs = *a2;
  CMTimeSubtract(&v13, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  CMTime rhs = *a1;
  CMTime v10 = *a3;
  CMTimeAdd(&lhs, &rhs, &v10);
  if (a4)
  {
    double result = *(double *)&v13.value;
    *a4 = v13;
  }
  if (a5)
  {
    double result = *(double *)&lhs.value;
    *a5 = lhs;
  }
  return result;
}

uint64_t AVPlayerItemGetFigPlayerSetTimeFlagsForTolerances(CMTime *a1, CMTime *a2)
{
  long long v6 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&time1.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  time1.epoch = v3;
  CMTime time2 = *a1;
  uint64_t v4 = 3;
  if (!CMTimeCompare(&time1, &time2))
  {
    *(_OWORD *)&time1.value = v6;
    time1.epoch = v3;
    CMTime time2 = *a2;
    if (CMTimeCompare(&time1, &time2)) {
      return 3;
    }
    else {
      return 5;
    }
  }
  return v4;
}

void sub_194A678D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVTelemetryGenerateID()
{
  return 0;
}

uint64_t AVOSTypeForString(void *a1)
{
  uint64_t v5 = 0;
  unint64_t v2 = [a1 length];
  if (v2 >= 4) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = v2;
  }
  objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)&v5 - v3 + 4, 0, v3, 0);
  return bswap32(v5);
}

void sub_194A67EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A680FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A682F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A683B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A68528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A685F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A686C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A68790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A68968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A68A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A68B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A68C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A69504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A695F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A69F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6A990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6AA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6AB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6AC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6ACE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6ADAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6AE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6AF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6BFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6C268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6C67C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A6C940(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194A6CB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6CDE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A6CEBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A6CF90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A6D164(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A6D2D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A6D80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6DCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6DDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __avplayeritem_figassetNotificationCallback_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x199715AE0]();
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    long long v5 = *MEMORY[0x1E4F1F9F8];
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v3 _informObserversAboutAvailabilityOfDuration:&v5];
  }
  if (*(unsigned char *)(a1 + 57)) {
    [*(id *)(a1 + 32) _informObserversAboutAvailabilityOfTracks:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 58)) {
    [*(id *)(a1 + 32) _informObserversAboutAvailabilityOfCurrentMediaSelection];
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
}

void sub_194A6E1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6E3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6E578(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_194A6E794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDiscovererAvailableRoutesChanged(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _availableRoutesChanged];
}

void sub_194A6F67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6F868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A6F930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AVOutputDeviceImplIsMutedForEndpointID(uint64_t a1, uint64_t a2)
{
  char v8 = 0;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, char *))(v5 + 160);
  if (!v6) {
    return 0;
  }
  v6(a1, a2, &v8);
  return v8 != 0;
}

void sub_194A70198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_194A702D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_194A70588(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_194A70D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_194A710D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __AVPlayerGetFigPlayerTypeForAsset_block_invoke(void *a1)
{
  unint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  if (v3 <= 1) {
    uint64_t v3 = [v2 statusOfValueForKey:@"streaming" error:0];
  }
  if (v3 == 2) {
    [v2 _isStreaming];
  }
  uint64_t v4 = *(uint64_t (**)(void))(a1[5] + 16);
  return v4();
}

id __AVMetadataGetCommonKeyForIdentifier_block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = @"m3u8/NAME";
  v2[0] = *MEMORY[0x1E4F32FA0];
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:&v1 count:1];
  AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiers = (uint64_t)result;
  return result;
}

CFDictionaryRef NSDictionaryFromCMTime(CMTime *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v3 = *a1;
  return CMTimeCopyAsDictionary(&v3, v1);
}

void sub_194A73650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_194A73A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A73C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A73D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (AVFCaptureLibrary_sOnce != -1) {
    dispatch_once(&AVFCaptureLibrary_sOnce, &__block_literal_global_427);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)AVFCaptureLibrary_sLib, "AVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription");
  softLinkAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t __handleFigAssetLoadingNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a2 objectForKey:@"AVAsynchronousLoadingPropertyBatchIDKey"];
  if (FigCFEqual())
  {
    if (dword_1EB2D3A80)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(a2, "removeObjectForKey:", @"AVAsynchronousLoadingPropertyBatchIDKey", v9, v10);
    *a4 = 1;
  }
  [a2 objectForKey:@"AVAsynchronousLoadingTrackPropertyBatchIDKey"];
  uint64_t result = FigCFEqual();
  if (result)
  {
    if (dword_1EB2D3A80)
    {
      char v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t result = objc_msgSend(a2, "removeObjectForKey:", @"AVAsynchronousLoadingTrackPropertyBatchIDKey", v9, v10);
    *a4 = 1;
  }
  return result;
}

void AVFigPlaybackItemNotificationCallback_TaggedMetadataArrayChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_updateTaggedMetadataArray:", objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F33790]));
}

void sub_194A77720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A7780C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t needsTaggedRanges()
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

void sub_194A77AA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A78138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A78374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A78590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A78E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_194A79088(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_194A7934C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A79B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_6(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 998) = result;
  return result;
}

void sub_194A7AE58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A7B73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A7B804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void mediatedPixelBufferAttributesChanged(uint64_t a1, void *a2)
{
  CMTime v3 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPixelBufferAttributeMediatorPixelBufferAttributesDidChangeNotification", a2, objc_msgSend(a2, "mediatedPixelBufferAttributes"));
}

void sub_194A7BCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A7BFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A7C084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A7C698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_194A7C88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194A7CA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AVTwoPartKeyPath *AVTwoPartKeyPathMake(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = [[AVTwoPartKeyPath alloc] initWithTopLevelPropertyKey:a1 secondLevelPropertyKey:a2];
  return v2;
}

void handleAndReflectFigAssetNotification(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EE8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EF0]))
  {
    if (dword_1EB2D3A80)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v7 = objc_msgSend(a2, "_loadingMutex", v10, v11);
    MEMORY[0x199715030]();
    char v8 = (void *)[a2 _loadingBatches];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
    [v8 removeAllObjects];
    MEMORY[0x199715040](v7);
    [a2 _invokeCompletionHandlerForLoadingBatches:v9];
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
}

void sub_194A7E2FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t AVPlayerGetFigPlayerTypeForAsset(void *a1, uint64_t a2)
{
  uint64_t v4 = [a1 statusOfValueForKey:@"streaming" error:0];
  uint64_t v5 = v4;
  if (a1 && v4 < 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:@"streaming"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __AVPlayerGetFigPlayerTypeForAsset_block_invoke;
    v10[3] = &unk_1E57B3C30;
    v10[5] = a2;
    v10[6] = v5;
    v10[4] = a1;
    return [a1 loadValuesAsynchronouslyForKeys:v6 completionHandler:v10];
  }
  else
  {
    if (v4 <= 1) {
      uint64_t v5 = [a1 statusOfValueForKey:@"streaming" error:0];
    }
    if (v5 == 2) {
      uint64_t v8 = [a1 _isStreaming];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
    return v9(a2, v8);
  }
}

uint64_t AVLoadValueAsynchronously(void *a1, uint64_t a2, uint64_t a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = a2;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AVLoadValuesAsynchronously_block_invoke;
  v7[3] = &unk_1E57B32E8;
  v7[4] = v5;
  v7[5] = a1;
  v7[6] = a3;
  return [a1 loadValuesAsynchronouslyForKeys:v5 completionHandler:v7];
}

uint64_t AVLoadValuesAsynchronously(void *a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __AVLoadValuesAsynchronously_block_invoke;
  v4[3] = &unk_1E57B32E8;
  v4[4] = a2;
  v4[5] = a1;
  void v4[6] = a3;
  return [a1 loadValuesAsynchronouslyForKeys:a2 completionHandler:v4];
}

void sub_194A7EBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        [v2 addObject:AVTranslateFigMediaCharacteristicToAVMediaCharacteristic(*(void *)(*((void *)&v8 + 1) + 8 * i))];
      }
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

void sub_194A7F37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVTranslateFigMediaCharacteristicToAVMediaCharacteristic(uint64_t a1)
{
  if (AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDictOnce != -1) {
    dispatch_once(&AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDictOnce, &__block_literal_global_19);
  }
  uint64_t result = [(id)AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDict objectForKey:a1];
  if (!result) {
    return a1;
  }
  return result;
}

uint64_t __AVLoadValuesAsynchronously_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = *MEMORY[0x1E4F28228];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(a1 + 40) statusOfValueForKey:*(void *)(*((void *)&v12 + 1) + 8 * i) error:&v16];
        if ((unint64_t)(v8 - 2) >= 2)
        {
          if (v8 == 4)
          {
            uint64_t v9 = -11878;
            long long v10 = 0;
          }
          else
          {
            uint64_t v17 = v6;
            uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected terminal status %d", v8);
            long long v10 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
            uint64_t v9 = -11800;
          }
          uint64_t v16 = AVLocalizedError(@"AVFoundationErrorDomain", v9, v10);
          if (v16) {
            return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
          }
        }
        else if (v16)
        {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v4);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_194A7FEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A802CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 997) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 999) = result;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_3(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 976) = result;
  return result;
}

void sub_194A81AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avplayer_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a2 _nameForLogging];
  if (a3) {
    CFRetain(a3);
  }
  if (a5) {
    CFRetain(a5);
  }
  long long v10 = *(NSObject **)(a2[1] + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __avplayer_fpNotificationCallback_block_invoke;
  v11[3] = &unk_1E57B3CD0;
  v11[6] = a3;
  v11[7] = a5;
  v11[4] = a2;
  v11[5] = v9;
  dispatch_async(v10, v11);
}

void sub_194A821E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

void __avplayer_fpNotificationCallback_block_invoke(uint64_t a1)
{
  v152[1] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x199715AE0]();
  unint64_t v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  char v3 = [*(id *)(a1 + 32) _hasCurrentInterstitialEvent];
  int v4 = CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34048]);
  uint64_t v5 = "Support) issueContentKeyRequests:forInitializationData:]_block_invoke";
  uint64_t v6 = (void *)MEMORY[0x1E4F34110];
  if (v4) {
    goto LABEL_2;
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34078]))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34018]))
    {
      double v22 = (void *)[*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34100]];
      if (v22) {
        int v23 = [v22 BOOLValue];
      }
      else {
        int v23 = [*(id *)(a1 + 32) _isMuted];
      }
      char v33 = v23;
      float v15 = 0.0;
      if (v23 == [*(id *)(a1 + 32) isMuted])
      {
        int v10 = 0;
        char v11 = 0;
        long long v12 = 0;
        int v13 = 0;
        id v14 = 0;
        goto LABEL_58;
      }
      [*(id *)(a1 + 32) willChangeValueForKey:@"muted"];
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v35 = *(NSObject **)(*(void *)(v34 + 8) + 56);
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = __avplayer_fpNotificationCallback_block_invoke_2;
      v146[3] = &unk_1E57B20E8;
      v146[4] = v34;
      char v147 = v33;
      av_readwrite_dispatch_queue_write(v35, v146);
      [*(id *)(a1 + 32) didChangeValueForKey:@"muted"];
      int v10 = 0;
      char v11 = 0;
      long long v12 = 0;
      int v13 = 0;
      id v14 = 0;
      goto LABEL_36;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F33FE0]))
    {
      uint64_t v25 = *(void **)(a1 + 32);
      if (*(unsigned char *)(v25[1] + 88)) {
        [v25 _logPerformanceDataForPreviousItem];
      }
      uint64_t v26 = (void *)[*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34140]];
      uint64_t v27 = *(void **)(a1 + 32);
      uint64_t v28 = v27[1];
      long long v12 = *(const void **)(v28 + 736);
      if (v12)
      {
        *(void *)(v28 + 736) = 0;
        uint64_t v27 = *(void **)(a1 + 32);
      }
      uint64_t v29 = objc_msgSend((id)objc_msgSend(v27, "currentItem"), "_copyFigPlaybackItem");
      if ((const void *)v29 == v12)
      {
        uint64_t v43 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v44 = *(void *)(a1 + 32);
        if (v26)
        {
          uint64_t v45 = *(void *)(a1 + 56);
        }
        else
        {
          v151 = @"ReasonForCurrentItemDidChange";
          v152[0] = @"ReasonUnknown";
          uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:&v151 count:1];
        }
        [v43 postNotificationName:@"AVPlayerCurrentItemDidChangeNotification" object:v44 userInfo:v45];
        goto LABEL_73;
      }
      uint64_t v30 = (const void *)v29;
      if (v26
        && (([v26 isEqualToString:*MEMORY[0x1E4F33F00]] & 1) != 0
         || [v26 isEqualToString:*MEMORY[0x1E4F33F08]]))
      {
        uint64_t v31 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v32 = *(void *)(a1 + 32);
      }
      else
      {
        [*(id *)(a1 + 32) _advanceCurrentItemAccordingToFigPlaybackItem:v12];
        uint64_t v31 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v32 = *(void *)(a1 + 32);
        if (!v26)
        {
          v149 = @"ReasonForCurrentItemDidChange";
          v150 = @"ReasonUnknown";
          uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
          goto LABEL_57;
        }
      }
      uint64_t v46 = *(void *)(a1 + 56);
LABEL_57:
      [v31 postNotificationName:@"AVPlayerCurrentItemDidChangeNotification" object:v32 userInfo:v46];
      int v10 = 0;
      char v11 = 0;
      int v13 = 0;
      id v14 = 0;
      float v15 = 0.0;
      long long v12 = v30;
      goto LABEL_58;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34070]))
    {
      uint64_t v36 = (void *)[*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34470]];
      uint64_t v37 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      uint64_t v38 = [v36 countByEnumeratingWithState:&v142 objects:v148 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v143;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v143 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v142 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v42 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:v41];
              if (v42) {
                [v37 addObject:v42];
              }
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v142 objects:v148 count:16];
        }
        while (v38);
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "_setTimedMetadata:", v37);
      int v10 = 0;
      char v11 = 0;
      long long v12 = 0;
      int v13 = 0;
      id v14 = 0;
      float v15 = 0.0;
      uint64_t v5 = "-[AVContentKeySession(AVContentKeyRequestSupport) issueContentKeyRequests:forInitializationData:]_block_invoke"
         + 41;
      goto LABEL_58;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34050])) {
      goto LABEL_83;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34058]))
    {
      uint64_t v65 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34440]];
      uint64_t v66 = AVLocalizedError(@"AVFoundationErrorDomain", -11912, 0);
      [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
      [*(id *)(a1 + 32) _changeStatusToFailedWithError:v66];
      [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
      [*(id *)(a1 + 32) cancelPendingPrerolls];
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "cancelPendingSeeks");
      AVMediaStatePurgePostMediaStateWasPurgedNotificationForObject(*(void *)(a1 + 32), v65);
      goto LABEL_6;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F21770]))
    {
LABEL_83:
      if ([*(id *)(a1 + 32) status] != 2)
      {
        uint64_t v64 = AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
        [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
        [*(id *)(a1 + 32) _changeStatusToFailedWithError:v64];
        [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
      }
      [*(id *)(a1 + 32) cancelPendingPrerolls];
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "cancelPendingSeeks");
      goto LABEL_6;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34068]))
    {
      v67 = *(const void **)(a1 + 56);
      if (v67)
      {
        CFTypeID v68 = CFGetTypeID(v67);
        if (v68 == CFDictionaryGetTypeID())
        {
          LODWORD(BOOLean[0]) = 0;
          FigCFDictionaryGetInt32IfPresent();
        }
      }
      uint64_t v69 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
      if ([*(id *)(a1 + 32) status] != 2)
      {
        [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
        [*(id *)(a1 + 32) _changeStatusToFailedWithError:v69];
        [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
      }
      [*(id *)(a1 + 32) cancelPendingPrerolls];
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "cancelPendingSeeks");
      int v10 = 0;
      char v11 = 0;
      long long v12 = 0;
      int v13 = 0;
      id v14 = 0;
      float v15 = 0.0;
LABEL_36:
      uint64_t v5 = "Support) issueContentKeyRequests:forInitializationData:]_block_invoke";
      goto LABEL_58;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34000]))
    {
      LOBYTE(BOOLean[0]) = 0;
      if (FigCFDictionaryGetBooleanIfPresent())
      {
        uint64_t v70 = *(void *)(a1 + 32);
        v71 = *(NSObject **)(*(void *)(v70 + 8) + 56);
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = __avplayer_fpNotificationCallback_block_invoke_3;
        v140[3] = &unk_1E57B20E8;
        v140[4] = v70;
        char v141 = (char)BOOLean[0];
        av_readwrite_dispatch_queue_write(v71, v140);
        [*(id *)(a1 + 32) _canOverlapPlaybackConditionsChanged];
      }
      goto LABEL_129;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F33FF8]))
    {
      int v72 = [*(id *)(a1 + 32) _airPlayVideoActive];
      if (v72 != [*(id *)(a1 + 32) _isAirPlayVideoActive])
      {
        [*(id *)(a1 + 32) willChangeValueForKey:@"airPlayVideoActive"];
        uint64_t v73 = *(void *)(a1 + 32);
        v74 = *(NSObject **)(*(void *)(v73 + 8) + 56);
        v138[0] = MEMORY[0x1E4F143A8];
        v138[1] = 3221225472;
        v138[2] = __avplayer_fpNotificationCallback_block_invoke_4;
        v138[3] = &unk_1E57B20E8;
        v138[4] = v73;
        char v139 = v72;
        av_readwrite_dispatch_queue_write(v74, v138);
        [*(id *)(a1 + 32) didChangeValueForKey:@"airPlayVideoActive"];
      }
      BOOLean[0] = 0;
      int v75 = FigPlayerCopyProperty(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728), *MEMORY[0x1E4F342A8], *MEMORY[0x1E4F1CF80], (uint64_t)BOOLean);
      CFBooleanRef v76 = BOOLean[0];
      if (!v75 && BOOLean[0])
      {
        if (CFBooleanGetValue(BOOLean[0])) {
          int v72 = 1;
        }
        CFBooleanRef v76 = BOOLean[0];
      }
      if (v76)
      {
        CFRelease(v76);
        BOOLean[0] = 0;
      }
      if (v72 != [*(id *)(a1 + 32) isExternalPlaybackActive])
      {
        [*(id *)(a1 + 32) willChangeValueForKey:@"externalPlaybackActive"];
        uint64_t v77 = *(void *)(a1 + 32);
        v78 = *(NSObject **)(*(void *)(v77 + 8) + 56);
        v136[0] = MEMORY[0x1E4F143A8];
        v136[1] = 3221225472;
        v136[2] = __avplayer_fpNotificationCallback_block_invoke_5;
        v136[3] = &unk_1E57B20E8;
        v136[4] = v77;
        char v137 = v72;
        av_readwrite_dispatch_queue_write(v78, v136);
        [*(id *)(a1 + 32) didChangeValueForKey:@"externalPlaybackActive"];
      }
      goto LABEL_129;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34020]))
    {
      LOBYTE(BOOLean[0]) = 0;
      FigCFDictionaryGetBooleanIfPresent();
      if ([*(id *)(a1 + 32) _isPIPModePossible])
      {
        [*(id *)(a1 + 32) willChangeValueForKey:@"PIPModePossible"];
        uint64_t v79 = *(void *)(a1 + 32);
        v80 = *(NSObject **)(*(void *)(v79 + 8) + 56);
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __avplayer_fpNotificationCallback_block_invoke_6;
        v134[3] = &unk_1E57B20E8;
        v134[4] = v79;
        char v135 = 0;
        av_readwrite_dispatch_queue_write(v80, v134);
        [*(id *)(a1 + 32) didChangeValueForKey:@"PIPModePossible"];
      }
      goto LABEL_129;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34008]))
    {
      v81 = (void *)[*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F340F8]];
      if (([*(id *)(a1 + 32) _airPlayVideoActive] & 1) != 0
        || [v81 BOOLValue])
      {
        if (([*(id *)(a1 + 32) isExternalPlaybackActive] & 1) == 0)
        {
          LOBYTE(v82) = 1;
LABEL_125:
          [*(id *)(a1 + 32) willChangeValueForKey:@"externalPlaybackActive"];
          uint64_t v86 = *(void *)(a1 + 32);
          v87 = *(NSObject **)(*(void *)(v86 + 8) + 56);
          v132[0] = MEMORY[0x1E4F143A8];
          v132[1] = 3221225472;
          v132[2] = __avplayer_fpNotificationCallback_block_invoke_7;
          v132[3] = &unk_1E57B20E8;
          v132[4] = v86;
          char v133 = v82;
          av_readwrite_dispatch_queue_write(v87, v132);
          [*(id *)(a1 + 32) didChangeValueForKey:@"externalPlaybackActive"];
        }
      }
      else
      {
        int v82 = [*(id *)(a1 + 32) _externalPlaybackActive];
        if (v82 != [*(id *)(a1 + 32) isExternalPlaybackActive]) {
          goto LABEL_125;
        }
      }
    }
    else
    {
      if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34038]))
      {
        v83 = *(void **)(a1 + 32);
        uint64_t v84 = *(void *)(a1 + 56);
        uint64_t v85 = 1;
      }
      else
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34040]))
        {
          if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F33FF0]))
          {
            uint64_t v88 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F340E8]];
            v89 = *(void **)(a1 + 32);
            if (v88) {
              uint64_t v90 = objc_msgSend(v89, "_extractFPExternalProtectionStatus:");
            }
            else {
              uint64_t v90 = [v89 _externalProtectionStatusCopiedFromFig];
            }
            uint64_t v93 = v90;
            float v15 = 0.0;
            if ((v90 != 0) != [*(id *)(a1 + 32) outputObscuredDueToInsufficientExternalProtection])
            {
              [*(id *)(a1 + 32) willChangeValueForKey:@"outputObscuredDueToInsufficientExternalProtection"];
              uint64_t v94 = *(void *)(a1 + 32);
              v95 = *(NSObject **)(*(void *)(v94 + 8) + 56);
              v130[0] = MEMORY[0x1E4F143A8];
              v130[1] = 3221225472;
              v130[2] = __avplayer_fpNotificationCallback_block_invoke_8;
              v130[3] = &unk_1E57B3CF8;
              BOOL v131 = v93 != 0;
              v130[4] = v94;
              v130[5] = v93;
              av_readwrite_dispatch_queue_write(v95, v130);
              [*(id *)(a1 + 32) didChangeValueForKey:@"outputObscuredDueToInsufficientExternalProtection"];
            }
          }
          else if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F33FE8]))
          {
            v91 = (void *)[*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F340E0]];
            if (v91) {
              int v92 = [v91 BOOLValue];
            }
            else {
              int v92 = [*(id *)(a1 + 32) _isDisplayingClosedCaptions];
            }
            char v96 = v92;
            float v15 = 0.0;
            if (v92 != [*(id *)(a1 + 32) isDisplayingClosedCaptions])
            {
              [*(id *)(a1 + 32) willChangeValueForKey:@"isDisplayingClosedCaptions"];
              uint64_t v97 = *(void *)(a1 + 32);
              v98 = *(NSObject **)(*(void *)(v97 + 8) + 56);
              v128[0] = MEMORY[0x1E4F143A8];
              v128[1] = 3221225472;
              v128[2] = __avplayer_fpNotificationCallback_block_invoke_9;
              v128[3] = &unk_1E57B20E8;
              v128[4] = v97;
              char v129 = v96;
              av_readwrite_dispatch_queue_write(v98, v128);
              [*(id *)(a1 + 32) didChangeValueForKey:@"isDisplayingClosedCaptions"];
              uint64_t v99 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerIsDisplayingClosedCaptionsDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v99);
            }
          }
          else
          {
            if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34028]))
            {
              BOOL v17 = 0;
              char v11 = 0;
              float v15 = 0.0;
              goto LABEL_12;
            }
            int v100 = CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34060]);
            uint64_t v6 = (void *)MEMORY[0x1E4F34110];
            if (v100)
            {
LABEL_2:
              uint64_t v7 = (void *)[*(id *)(a1 + 56) objectForKey:*v6];
              if (v7) {
                [v7 floatValue];
              }
              else {
                [*(id *)(a1 + 32) _rate];
              }
              float v15 = v8;
              [*(id *)(a1 + 32) rate];
              BOOL v17 = v15 != v16;
              if (v4)
              {
                char v11 = 0;
                int v13 = 0;
                id v14 = 0;
                int v10 = 0;
                long long v12 = 0;
                if (v15 == v16) {
                  goto LABEL_58;
                }
                goto LABEL_20;
              }
              char v11 = 1;
LABEL_12:
              uint64_t v18 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34108]];
              v123[0] = MEMORY[0x1E4F143A8];
              v123[1] = 3221225472;
              v123[2] = __avplayer_fpNotificationCallback_block_invoke_12;
              v123[3] = &unk_1E57B3D20;
              char v124 = v3;
              uint64_t v19 = *(void *)(a1 + 40);
              v123[4] = v18;
              v123[5] = v19;
              v123[6] = v2;
              id v14 = (id)[v123 copy];
              BOOLean[0] = 0;
              BOOLean[1] = (CFBooleanRef)BOOLean;
              uint64_t v121 = 0x2020000000;
              char v122 = 0;
              uint64_t v116 = 0;
              v117 = &v116;
              uint64_t v118 = 0x2020000000;
              char v119 = 0;
              uint64_t v20 = *(void *)(a1 + 32);
              double v21 = *(NSObject **)(*(void *)(v20 + 8) + 56);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __avplayer_fpNotificationCallback_block_invoke_13;
              block[3] = &unk_1E57B3C80;
              block[4] = v20;
              block[5] = v14;
              block[6] = BOOLean;
              block[7] = &v116;
              av_readwrite_dispatch_queue_read(v21, block);
              if (*((unsigned char *)BOOLean[1] + 24))
              {
                _Block_object_dispose(&v116, 8);
                _Block_object_dispose(BOOLean, 8);
              }
              else
              {
                int v24 = *((unsigned __int8 *)v117 + 24);
                _Block_object_dispose(&v116, 8);
                _Block_object_dispose(BOOLean, 8);
                if (!v24)
                {
                  int v10 = 0;
                  if (v17)
                  {
                    int v13 = 0;
                    goto LABEL_19;
                  }
                  long long v12 = 0;
                  int v13 = 0;
LABEL_22:
                  uint64_t v5 = "Support) issueContentKeyRequests:forInitializationData:]_block_invoke";
                  goto LABEL_58;
                }
              }
              [*(id *)(a1 + 32) willChangeValueForKey:@"timeControlStatus"];
              [*(id *)(a1 + 32) willChangeValueForKey:@"reasonForWaitingToPlay"];
              int v13 = 1;
              if (v17)
              {
LABEL_19:
                uint64_t v5 = "Support) issueContentKeyRequests:forInitializationData:]_block_invoke";
LABEL_20:
                [*(id *)(a1 + 32) willChangeValueForKey:@"rate"];
                long long v12 = 0;
                int v10 = 1;
                goto LABEL_58;
              }
              int v10 = 0;
              long long v12 = 0;
              goto LABEL_22;
            }
            if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34030]))
            {
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerPlaybackWasInterruptedNotification", *(void *)(a1 + 32), 0);
              goto LABEL_129;
            }
            if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F33FD8]))
            {
              int v101 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E4F340D8]), "BOOLValue");
              float v15 = 0.0;
              if (v101 != [*(id *)(a1 + 32) isSilencedDueToConflictWithOtherPlayback])
              {
                [*(id *)(a1 + 32) willChangeValueForKey:@"isSilencedDueToConflictWithOtherPlayback"];
                uint64_t v102 = *(void *)(a1 + 32);
                v103 = *(NSObject **)(*(void *)(v102 + 8) + 56);
                v126[0] = MEMORY[0x1E4F143A8];
                v126[1] = 3221225472;
                v126[2] = __avplayer_fpNotificationCallback_block_invoke_10;
                v126[3] = &unk_1E57B20E8;
                v126[4] = v102;
                char v127 = v101;
                av_readwrite_dispatch_queue_write(v103, v126);
                [*(id *)(a1 + 32) didChangeValueForKey:@"isSilencedDueToConflictWithOtherPlayback"];
              }
            }
            else
            {
              float v15 = 0.0;
              if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E4F34010]))
              {
                v104 = (void *)[*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34120]];
                uint64_t v105 = [*(id *)(a1 + 32) mxSessionID];
                if (v104 != (void *)v105 && ([v104 isEqual:v105] & 1) == 0)
                {
                  [*(id *)(a1 + 32) willChangeValueForKey:@"mxSessionID"];
                  uint64_t v106 = *(void *)(a1 + 32);
                  v107 = *(NSObject **)(*(void *)(v106 + 8) + 56);
                  v125[0] = MEMORY[0x1E4F143A8];
                  v125[1] = 3221225472;
                  v125[2] = __avplayer_fpNotificationCallback_block_invoke_11;
                  v125[3] = &unk_1E57B2098;
                  v125[4] = v106;
                  v125[5] = v104;
                  av_readwrite_dispatch_queue_write(v107, v125);
                  [*(id *)(a1 + 32) didChangeValueForKey:@"mxSessionID"];
                }
              }
            }
          }
          int v10 = 0;
          char v11 = 0;
          long long v12 = 0;
          int v13 = 0;
          id v14 = 0;
          goto LABEL_22;
        }
        v83 = *(void **)(a1 + 32);
        uint64_t v84 = *(void *)(a1 + 56);
        uint64_t v85 = 0;
      }
      [v83 prerollOperationDidComplete:v85 notificationPayload:v84];
    }
LABEL_129:
    int v10 = 0;
    char v11 = 0;
    long long v12 = 0;
    int v13 = 0;
    id v14 = 0;
    float v15 = 0.0;
    goto LABEL_22;
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend(*(id *)(a1 + 56), "objectForKey:", @"AVController_Volume"), @"_AVPlayer_Volume", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"_AVPlayer_VolumeDidChangeNotification", *(void *)(a1 + 32), v9);
LABEL_6:
  int v10 = 0;
  char v11 = 0;
  long long v12 = 0;
  int v13 = 0;
  id v14 = 0;
  float v15 = 0.0;
LABEL_58:
  v109[0] = MEMORY[0x1E4F143A8];
  long long v47 = *(_OWORD *)(a1 + 32);
  v48 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
  v109[1] = *((void *)v5 + 416);
  v109[2] = __avplayer_fpNotificationCallback_block_invoke_14;
  v109[3] = &unk_1E57B3D48;
  char v113 = v10;
  float v112 = v15;
  long long v110 = v47;
  char v114 = v13;
  id v111 = v14;
  av_readwrite_dispatch_queue_write(v48, v109);
  if (v10)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E4F34110]), "floatValue");
    unsigned int v50 = v49;
    uint64_t v51 = *MEMORY[0x1E4F34148];
    int v52 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *MEMORY[0x1E4F34148]), "intValue");
    int v53 = [*(id *)(a1 + 32) _isInterstitialPlayer];
    if (v52 == 33) {
      int v54 = v53;
    }
    else {
      int v54 = 0;
    }
    if (v54 == 1)
    {
      v55 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_weakReferenceToPrimaryPlayer"), "referencedObject");
      *(_OWORD *)BOOLean = *MEMORY[0x1E4F1F9F8];
      uint64_t v121 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      objc_msgSend(v55, "_handleSetRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", BOOLean, 0, 33, 0, COERCE_DOUBLE(__PAIR64__(HIDWORD(BOOLean[0]), v50)));
    }
    [*(id *)(a1 + 32) didChangeValueForKey:@"rate"];
    uint64_t v56 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F34138]];
    unsigned int v57 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v51), "intValue");
    if ((v11 & (v57 == 0)) != 0) {
      uint64_t v58 = 2;
    }
    else {
      uint64_t v58 = v57;
    }
    uint64_t v59 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F340D0]];
    if (v59) {
      id v60 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v59];
    }
    else {
      id v60 = 0;
    }
    uint64_t v61 = [*(id *)(a1 + 32) _rateDidChangeNotificationPayloadForFigRateChangeReason:v58 rateChangeIdentifier:v56 rateChangeOriginator:v60];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerRateDidChangeNotification", *(void *)(a1 + 32), v61);
  }
  if (v13)
  {
    [*(id *)(a1 + 32) didChangeValueForKey:@"timeControlStatus"];
    [*(id *)(a1 + 32) didChangeValueForKey:@"reasonForWaitingToPlay"];
  }
LABEL_73:
  if (v12) {
    CFRelease(v12);
  }
  v62 = *(const void **)(a1 + 48);
  if (v62) {
    CFRelease(v62);
  }
  v63 = *(const void **)(a1 + 56);
  if (v63) {
    CFRelease(v63);
  }
  if (v2) {
    CFRelease(v2);
  }
}

void sub_194A836B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_194A83C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A83D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A843D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A844A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8466C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A84758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVRunLoopConditionSignal(void *a1)
{
  unint64_t v2 = (void *)MEMORY[0x199715AE0]();
  [a1 setSignaled:1];
}

void sub_194A84984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

dispatch_queue_t __AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_block_invoke()
{
  CFAllocatorRef v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.avfoundation.avoutputdevice.routediscovererqueue", v0);
  gAVOutputDeviceRouteDiscovererQueue = (uint64_t)result;
  return result;
}

void sub_194A851F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A85424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A855DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A85848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *avurlasset_setupGuts(void *a1, void *a2, void *a3, id a4, uint64_t a5)
{
  uint64_t v41 = a5;
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v10 = [a3 valueForKey:@"AVURLAssetInspectorLoaderKey"];
  uint64_t v11 = [a3 objectForKey:@"AVURLAssetDownloadTokenKey"];
  long long v12 = (void *)v11;
  if (!a2 && !v11 && !v10) {
    goto LABEL_14;
  }
  int v13 = objc_alloc_init(AVURLAssetInternal);
  if (!v13) {
    goto LABEL_14;
  }
  id v14 = v13;
  uint64_t v15 = [a3 objectForKey:@"AVURLAssetLoggingIdentifier"];
  if (v15) {
    [a1 _setLoggingIdentifier:v15];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVURLAssetHasSecurityScopedURLKey"), "BOOLValue"))v14->requiresSecurityScopeRelease = objc_msgSend(a2, "startAccessingSecurityScopedResource"); {
  float v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  }
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.avurlasset.tracks", v16);
  v14->tracksAccessQueue = (OS_dispatch_queue *)v17;
  if (v17)
  {
    a1[2] = CFRetain(v14);
    v14->URLRequestHelper = [[AVAssetClientURLRequestHelper alloc] initWithAsset:a1];
    v14->makeOneResourceLoaderOnly = objc_alloc_init(AVDispatchOnce);
    v14->makeOneAssetDownloadCacheOnly = objc_alloc_init(AVDispatchOnce);
    uint64_t v18 = (void *)[a3 valueForKey:@"AVURLAssetAllowsExpensiveNetworkAccessKey"];
    if (v18) {
      char v19 = [v18 BOOLValue];
    }
    else {
      char v19 = 1;
    }
    v14->allowsExpensiveNetworkAccess = v19;
    double v21 = (void *)[a3 valueForKey:@"AVURLAssetAllowsConstrainedNetworkAccessKey"];
    if (v21) {
      char v22 = [v21 BOOLValue];
    }
    else {
      char v22 = 1;
    }
    v14->allowsConstrainedNetworkAccess = v22;
    if (v12)
    {
      [v12 unsignedLongLongValue];
      CFTypeRef cf = 0;
      if (+[AVAsset _assetCreationOptionsRequiresInProcessOperation:a3])
      {
        uint64_t v23 = FigAssetCopyAssetWithDownloadToken();
      }
      else
      {
        uint64_t v23 = FigAssetRemoteCopyAssetWithDownloadToken();
      }
      int v24 = [[AVUnreachableAssetInspectorLoader alloc] initWithFigError:v23 userInfo:0];
      [a1 _setAssetInspectorLoader:v24];

      v14->URL = (NSURL *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_assetInspectorLoader"), "URL"), "copy");
      if (cf) {
        CFRelease(cf);
      }
    }
    else if (v10)
    {
      [a1 _setAssetInspectorLoader:v10];
      v14->URL = (NSURL *)[a2 copy];
    }
    else
    {
      CFTypeRef cf = 0;
      if (!a4)
      {
        a4 = +[AVURLAsset _getFigAssetCreationOptionsFromURLAssetInitializationOptions:assetLoggingIdentifier:figAssetCreationFlags:error:](AVURLAsset, "_getFigAssetCreationOptionsFromURLAssetInitializationOptions:assetLoggingIdentifier:figAssetCreationFlags:error:", a3, [a1 _nameForLogging], &v41, &cf);
        if (!a4)
        {
          if ([(id)cf code] == -11999)
          {
            if (*v9 == 1) {
              kdebug_trace();
            }
            uint64_t v29 = a1;
            uint64_t v30 = objc_msgSend((id)objc_msgSend((id)cf, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
            uint64_t v31 = [v30 reason];
            uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v38 = [v30 name];
            if (v31) {
              [NSString stringWithFormat:@": %@", v31];
            }
            uint64_t v39 = (void *)[v32 exceptionWithName:v38, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, sel_initWithURL_options_, @"Cannot honor specified AVURLAsset initialization options for AVURLAsset <%p>%@", v33, v34, v35, v36, v37, (uint64_t)a1), 0 reason userInfo];
            objc_exception_throw(v39);
          }
          a4 = 0;
        }
      }
      unsigned int v40 = 0;
      id v25 = objc_alloc((Class)[a1 _classForFigAssetInspectorLoader]);
      uint64_t v26 = (AVUnreachableAssetInspectorLoader *)[v25 initWithURL:a2 figAssetCreationFlags:v41 figAssetCreationOptions:a4 avAssetInitializationOptions:a3 forAsset:a1 figErr:&v40];
      if (!v26)
      {
        uint64_t v27 = [AVUnreachableAssetInspectorLoader alloc];
        uint64_t v26 = [(AVUnreachableAssetInspectorLoader *)v27 initWithFigError:v40 userInfo:0];
      }
      v14->customURLBridgeForNSURLProtocol = [[AVAssetCustomURLBridgeForNSURLProtocol alloc] initWithFigAsset:[(AVAssetInspectorLoader *)v26 _figAsset]];
      v14->customURLAuthenticationUsingKeychain = [[AVAssetCustomURLAuthentication alloc] initWithFigAsset:[(AVAssetInspectorLoader *)v26 _figAsset]];
      v14->URL = (NSURL *)[a2 copy];
      v14->initializationOptions = (NSDictionary *)[a3 copy];
      [a1 _setAssetInspectorLoader:v26];
    }
    uint64_t v28 = [a3 objectForKey:@"AVURLAssetRemoteCustomURLHandlerContextKey"];
    if (v28) {
      [a1 _resourceLoaderWithRemoteHandlerContext:v28];
    }
    if (*v9 == 1)
    {
      strncpy((char *)&cf, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "loggingIdentifier"), "description"), "UTF8String"), 8uLL);
      kdebug_trace();
    }
  }
  else
  {
LABEL_14:
    if (*v9 == 1) {
      kdebug_trace();
    }

    return 0;
  }
  return a1;
}

void sub_194A86F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 232), 8);
  _Block_object_dispose((const void *)(v40 - 184), 8);
  _Block_object_dispose((const void *)(v40 - 136), 8);
  _Block_object_dispose((const void *)(v40 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_194A87144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A872D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8739C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A87464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A87ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A87BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A87C9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A87F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A880DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t AVRequireConcreteObject(void *a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_opt_class();
  if (result == a3)
  {
    id v7 = a1;
    float v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = (objc_class *)objc_opt_class();
    return [v8 raise:v9, @"*** initialization method -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!", v10, NSStringFromClass(v11) format];
  }
  return result;
}

void sub_194A88F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A89068(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A89330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVPlayerItemVideoOutput_figVCSequentialAvailableCallback(uint64_t a1, long long *a2, char a3, void *a4)
{
  id v7 = (void *)MEMORY[0x199715AE0]();
  uint64_t v8 = [a4 referencedObject];
  if (v8)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    if (*(unsigned char *)(v9 + 108))
    {
      uint64_t v10 = *(NSObject **)(v9 + 56);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke;
      v16[3] = &unk_1E57B1E80;
      v16[4] = v8;
      uint64_t v11 = v16;
    }
    else
    {
      uint64_t v10 = *(NSObject **)(v9 + 56);
      if (a3)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_2;
        block[3] = &unk_1E57B2098;
        block[4] = v9;
        block[5] = v8;
        uint64_t v11 = block;
      }
      else
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_3;
        v12[3] = &unk_1E57B3FC0;
        v12[4] = v9;
        long long v13 = *a2;
        uint64_t v14 = *((void *)a2 + 2);
        uint64_t v11 = v12;
      }
    }
    dispatch_sync(v10, v11);
  }
}

void figLoaderNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EC8]))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28EA0];
    uint64_t v10 = @"AVURLAssetDownloadCompleteSuccessNotification";
LABEL_3:
    uint64_t v11 = a2;
    uint64_t v12 = 0;
LABEL_17:
    uint64_t v16 = [v9 notificationWithName:v10 object:v11 userInfo:v12];
    dispatch_queue_t v17 = (void *)MEMORY[0x1E4F28EB8];
LABEL_18:
    objc_msgSend((id)objc_msgSend(v17, "defaultCenter"), "postNotification:", v16);
    goto LABEL_19;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EC0]))
  {
    uint64_t v13 = [a2 _errorForFigNotificationPayload:a5 key:*MEMORY[0x1E4F32170]];
    uint64_t v14 = (void *)MEMORY[0x1E4F28EA0];
    if (v13) {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:@"AVURLAssetDownloadCompleteNotificationErrorKey"];
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v10 = @"AVURLAssetDownloadCompleteFailedNotification";
LABEL_16:
    uint64_t v9 = v14;
    uint64_t v11 = a2;
    goto LABEL_17;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EE8]))
  {
    uint64_t v15 = AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
    uint64_t v14 = (void *)MEMORY[0x1E4F28EA0];
    if (v15) {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:@"AVAssetMediaServicesWereResetErrorKey"];
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v10 = @"AVAssetMediaServicesWereResetNotification";
    goto LABEL_16;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EF0]))
  {
    AVMediaStatePurgePostMediaStateWasPurgedNotificationForObject(a2, [a5 objectForKey:*MEMORY[0x1E4F32458]]);
    goto LABEL_19;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EE0]))
  {
    uint64_t v18 = (void *)[a5 objectForKey:*MEMORY[0x1E4F32168]];
    if ([v18 isEqualToString:*MEMORY[0x1E4F347E0]])
    {
      if ([(id)objc_opt_class() expectsPropertyRevisedNotifications])
      {
        uint64_t v19 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVAssetDurationDidChangeNotification" object:a2 userInfo:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v19);
        if ([a2 _needsLegacyChangeNotifications])
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28EA0];
          double v21 = &AVFragmentedMovieDurationDidChangeNotification;
LABEL_27:
          uint64_t v16 = [v20 notificationWithName:*v21 object:a2 userInfo:0];
          dispatch_queue_t v17 = (void *)MEMORY[0x1E4F28EB8];
          goto LABEL_18;
        }
      }
    }
    else
    {
      if (([v18 isEqualToString:*MEMORY[0x1E4F321B0]] & 1) != 0
        || [v18 isEqualToString:*MEMORY[0x1E4F347D0]])
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28EA0];
        uint64_t v10 = @"AVAssetChapterMetadataGroupsDidChangeNotification";
        goto LABEL_3;
      }
      if ([v18 isEqualToString:*MEMORY[0x1E4F347F8]])
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28EA0];
        uint64_t v10 = @"AVAssetMediaSelectionGroupsDidChangeNotification";
        goto LABEL_3;
      }
      if ([v18 isEqualToString:*MEMORY[0x1E4F321E8]])
      {
        uint64_t v22 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVAssetWasDefragmentedNotification" object:a2 userInfo:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v22);
        if ([a2 _needsLegacyChangeNotifications])
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28EA0];
          double v21 = &AVFragmentedMovieWasDefragmentedNotification;
          goto LABEL_27;
        }
      }
      else if ([v18 isEqualToString:*MEMORY[0x1E4F321D0]])
      {
        uint64_t v23 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVAssetContainsFragmentsDidChangeNotification" object:a2 userInfo:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v23);
        if ([a2 _needsLegacyChangeNotifications])
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28EA0];
          double v21 = &AVFragmentedMovieContainsMovieFragmentsDidChangeNotification;
          goto LABEL_27;
        }
      }
    }
  }
LABEL_19:
}

BOOL addObjectToArray(void *a1, uint64_t a2)
{
  int v4 = [a1 count];
  if (a2 && ([a1 containsObject:a2] & 1) == 0) {
    [a1 addObject:a2];
  }
  return v4 != [a1 count];
}

void sub_194A8AA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8AB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8AC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8ACC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8AF08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194A8AFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8B2F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194A8B710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8BD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8BE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8BF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8C19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194A8C404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *__AVOutputDeviceCopySharedRouteDiscovererForRouteDescriptor_block_invoke_2(uint64_t a1)
{
  if (objc_msgSend((id)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x1E4F75408]), "BOOLValue"))
  {
    uint64_t result = (const void *)gAVOutputDeviceRouteDiscoverer_Screen;
    if (!gAVOutputDeviceRouteDiscoverer_Screen)
    {
      uint64_t result = (const void *)AVCreateRouteDiscovererWithType(0);
      gAVOutputDeviceRouteDiscoverer_Screen = (uint64_t)result;
      if (!result) {
        goto LABEL_8;
      }
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
      uint64_t result = (const void *)gAVOutputDeviceRouteDiscoverer_Screen;
      if (!gAVOutputDeviceRouteDiscoverer_Screen) {
        goto LABEL_8;
      }
    }
LABEL_7:
    uint64_t result = CFRetain(result);
    goto LABEL_8;
  }
  uint64_t result = (const void *)gAVOutputDeviceRouteDiscoverer_AudioVideo;
  if (gAVOutputDeviceRouteDiscoverer_AudioVideo) {
    goto LABEL_7;
  }
  uint64_t result = (const void *)AVCreateRouteDiscovererWithType(3);
  gAVOutputDeviceRouteDiscoverer_AudioVideo = (uint64_t)result;
  if (result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    uint64_t result = (const void *)gAVOutputDeviceRouteDiscoverer_AudioVideo;
    if (gAVOutputDeviceRouteDiscoverer_AudioVideo) {
      goto LABEL_7;
    }
  }
LABEL_8:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t AVCreateRouteDiscovererWithType(int a1)
{
  Current = AVFigRouteDiscovererFactoryGetCurrent();
  return AVFigRouteDiscovererFactoryCreateRouteDiscovererWithType(Current, a1);
}

void __AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue_block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x199715AE0]();
  AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue(a1[4], a1[5], a1[6]);
}

void AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue(void *a1, NSObject *a2, uint64_t a3)
{
  dispatch_object_t v8 = 0;
  id v9 = 0;
  [a1 getRetainedDelegate:&v9 retainedDelegateQueue:&v8];
  if (v8) {
    BOOL v6 = v8 == a2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v9);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue_block_invoke;
    block[3] = &unk_1E57B32E8;
    block[4] = a1;
    block[5] = v8;
    void block[6] = a3;
    dispatch_async(v8, block);
  }

  if (v8) {
    dispatch_release(v8);
  }
}

void sub_194A8D0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194A8D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8E1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8E330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  CGFloat height = boundingRect.size.height;
  CGFloat width = boundingRect.size.width;
  CGFloat y = boundingRect.origin.y;
  CGFloat x = boundingRect.origin.x;
  double v6 = aspectRatio.height;
  double v7 = aspectRatio.width;
  double v16 = boundingRect.size.width / aspectRatio.width;
  double v8 = boundingRect.size.height / aspectRatio.height;
  double MidX = CGRectGetMidX(boundingRect);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v17);
  double v11 = fmin(v16, v8);
  double v12 = v7 * v11;
  double v13 = v6 * v11;
  double v14 = MidY + v6 * v11 * -0.5;
  double v15 = MidX + v12 * -0.5;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v15;
  return result;
}

void sub_194A8ED0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8EDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8EE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8EF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8F330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A8F660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getTypeAccessMutex_block_invoke()
{
  uint64_t result = FigReentrantMutexCreate();
  getTypeAccessMutex_sTypeAccessMuteCGFloat x = result;
  return result;
}

void sub_194A90B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A90D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_194A90ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A910F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A91368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A91674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A91DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A91EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A91F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A92058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A92124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A921F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVEnsureNotOnMainThread(void *a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, a1);
  }
  else
  {
    char v3 = (void (*)(void *))a1[2];
    v3(a1);
  }
}

void *__AVFCaptureLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AVFCapture.framework/AVFCapture", 2);
  AVFCaptureLibrary_sLib = (uint64_t)result;
  return result;
}

id __AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"AVMediaCharacteristicVisual", *MEMORY[0x1E4F346F8], @"AVMediaCharacteristicAudible", *MEMORY[0x1E4F346E0], @"AVMediaCharacteristicLegible", *MEMORY[0x1E4F346E8], 0);
  AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDict = (uint64_t)result;
  return result;
}

uint64_t AVLocalizedErrorWithUnderlyingOSStatus(signed int a1, id a2)
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  uint64_t v4 = *MEMORY[0x1E4F28A50];
  if (![a2 objectForKey:*MEMORY[0x1E4F28A50]])
  {
    if (a2) {
      id v5 = (id)[a2 mutableCopy];
    }
    else {
      id v5 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    a2 = v5;
    objc_msgSend(v5, "setObject:forKey:", AVOSStatusToNSError(a1, 0), v4);
  }
  double v6 = @"AVFoundationErrorDomain";
  uint64_t v7 = -11822;
  if (a1 > -12815)
  {
    if (a1 > -12150)
    {
      if (a1 <= -1207)
      {
        if (a1 <= -12084)
        {
          switch(a1)
          {
            case -12149:
            case -12148:
            case -12143:
            case -12124:
            case -12115:
              goto LABEL_132;
            case -12147:
            case -12145:
            case -12144:
            case -12142:
            case -12141:
            case -12140:
            case -12139:
            case -12138:
            case -12136:
            case -12135:
            case -12131:
            case -12130:
            case -12129:
            case -12128:
            case -12127:
            case -12126:
            case -12123:
            case -12122:
            case -12121:
            case -12120:
              goto LABEL_249;
            case -12146:
            case -12133:
            case -12132:
            case -12117:
            case -12116:
              uint64_t v7 = -11831;
              goto LABEL_262;
            case -12137:
              goto LABEL_90;
            case -12134:
            case -12119:
            case -12118:
              goto LABEL_138;
            case -12125:
LABEL_53:
              uint64_t v7 = -11847;
              goto LABEL_262;
            default:
              switch(a1)
              {
                case -12109:
                  goto LABEL_124;
                case -12108:
                case -12107:
                case -12106:
                case -12105:
                case -12104:
                case -12102:
                  goto LABEL_249;
                case -12103:
                  goto LABEL_175;
                case -12101:
                  goto LABEL_158;
                case -12100:
                  goto LABEL_137;
                default:
                  if (a1 != -12084) {
                    goto LABEL_249;
                  }
                  goto LABEL_53;
              }
          }
        }
        if (a1 <= -3008)
        {
          if ((a1 + 6690) > 0x1C || ((1 << (a1 + 34)) & 0x10000003) == 0)
          {
            int v10 = -12083;
            goto LABEL_156;
          }
          goto LABEL_137;
        }
        if ((a1 + 3007) >= 8 && a1 != -2000) {
          goto LABEL_249;
        }
      }
      else
      {
        if (a1 > 1)
        {
          if (a1 > 268435458)
          {
            if (a1 > 561606516)
            {
              if (a1 == 561606517) {
                goto LABEL_173;
              }
              if (a1 == 1650549857)
              {
LABEL_90:
                uint64_t v7 = -11821;
                goto LABEL_262;
              }
              goto LABEL_249;
            }
            if (a1 != 268435459)
            {
              if (a1 != 560226676) {
                goto LABEL_249;
              }
LABEL_24:
              uint64_t v7 = -11855;
              goto LABEL_262;
            }
            goto LABEL_157;
          }
          if (a1 == 2)
          {
LABEL_113:
            double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
            uint64_t v7 = -1100;
            goto LABEL_262;
          }
          if (a1 != 12)
          {
            if (a1 != 28) {
              goto LABEL_249;
            }
LABEL_79:
            uint64_t v7 = -11807;
            goto LABEL_262;
          }
          goto LABEL_137;
        }
        if ((a1 + 1021) >= 0x16 && (a1 + 1206) >= 7 && (a1 + 1103) >= 4) {
          goto LABEL_249;
        }
      }
      double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
      uint64_t v7 = a1;
      goto LABEL_262;
    }
    if (a1 > -12534)
    {
      if (a1 <= -12414)
      {
        if (a1 > -12451)
        {
          switch(a1)
          {
            case -12436:
            case -12435:
              goto LABEL_124;
            case -12434:
              goto LABEL_137;
            case -12433:
            case -12432:
              goto LABEL_249;
            case -12431:
LABEL_115:
              uint64_t v7 = -11832;
              break;
            case -12430:
LABEL_174:
              uint64_t v7 = -11869;
              break;
            default:
              int v13 = -12450;
              goto LABEL_190;
          }
        }
        else
        {
          uint64_t v7 = -11858;
          double v6 = @"Source frame missing";
          switch(a1)
          {
            case -12509:
              double v6 = @"No custom callbacks";
              goto LABEL_258;
            case -12508:
              double v6 = @"Frame was cancelled";
              goto LABEL_258;
            case -12507:
              double v6 = @"No output callback";
              goto LABEL_258;
            case -12506:
              double v6 = @"Blitting failed";
              goto LABEL_258;
            case -12505:
              double v6 = @"Invalid composition instruction";
              goto LABEL_258;
            case -12504:
              double v6 = @"Invalid parameter";
              goto LABEL_258;
            case -12503:
              double v6 = @"Destination frame unsupported format";
              goto LABEL_258;
            case -12502:
              double v6 = @"Source frame unsupported format";
              goto LABEL_258;
            case -12501:
              double v6 = @"Render dimensions unknown";
              goto LABEL_258;
            case -12500:
              goto LABEL_258;
            case -12499:
            case -12498:
            case -12497:
            case -12496:
            case -12495:
            case -12494:
              goto LABEL_249;
            case -12493:
              goto LABEL_191;
            default:
              if (a1 != -12533) {
                goto LABEL_249;
              }
              uint64_t v7 = -11903;
              break;
          }
        }
        goto LABEL_262;
      }
      if (a1 <= -12205)
      {
        switch(a1)
        {
          case -12413:
            goto LABEL_262;
          case -12412:
LABEL_158:
            uint64_t v7 = -11823;
            break;
          case -12411:
          case -12401:
            goto LABEL_137;
          case -12410:
          case -12409:
          case -12408:
          case -12406:
          case -12405:
          case -12404:
          case -12402:
            goto LABEL_249;
          case -12407:
LABEL_124:
            uint64_t v7 = -11838;
            break;
          case -12403:
LABEL_175:
            double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
            uint64_t v7 = -3001;
            break;
          default:
            int v13 = -12282;
LABEL_190:
            if (a1 != v13) {
              goto LABEL_249;
            }
LABEL_191:
            double v6 = @"AVFoundationErrorDomain";
            uint64_t v7 = -11842;
            break;
        }
        goto LABEL_262;
      }
      if (a1 > -12179)
      {
        if (a1 > -12167)
        {
          if (a1 != -12166)
          {
            int v9 = -12161;
            goto LABEL_171;
          }
          goto LABEL_173;
        }
        if (a1 != -12178)
        {
          if (a1 == -12167)
          {
LABEL_112:
            uint64_t v7 = -11839;
            goto LABEL_262;
          }
          goto LABEL_249;
        }
        goto LABEL_157;
      }
      if (a1 == -12204)
      {
        double v6 = (__CFString *)*MEMORY[0x1E4F281F8];
        uint64_t v7 = 513;
        goto LABEL_262;
      }
      if (a1 == -12203)
      {
        double v6 = (__CFString *)*MEMORY[0x1E4F281F8];
        uint64_t v7 = 257;
        goto LABEL_262;
      }
      int v10 = -12184;
LABEL_156:
      if (a1 != v10) {
        goto LABEL_249;
      }
      goto LABEL_157;
    }
    if (a1 > -12652)
    {
      switch(a1)
      {
        case -12651:
          uint64_t v7 = -11861;
          break;
        case -12650:
        case -12649:
        case -12648:
        case -12647:
        case -12646:
        case -12645:
        case -12644:
        case -12643:
        case -12642:
        case -12641:
        case -12640:
        case -12637:
          goto LABEL_249;
        case -12639:
          uint64_t v7 = -11906;
          double v6 = @"Media writing - predetermined file size too small";
          goto LABEL_258;
        case -12638:
          uint64_t v7 = -11907;
          double v6 = @"Media writing - predetermined media data size too small";
          goto LABEL_258;
        case -12636:
          goto LABEL_137;
        case -12635:
          uint64_t v7 = -11800;
          double v6 = @"Media writing - invalid edit";
          goto LABEL_258;
        case -12634:
          uint64_t v7 = -11800;
          double v6 = @"Media writing - invalid format";
          goto LABEL_258;
        case -12633:
          uint64_t v7 = -11800;
          double v6 = @"Media writing - invalid timestamp";
          goto LABEL_258;
        case -12632:
          uint64_t v7 = -11800;
          double v6 = @"Media writing - no such track";
          goto LABEL_258;
        case -12631:
          uint64_t v7 = -11800;
          double v6 = @"Media writing - read only property";
          goto LABEL_258;
        case -12630:
          uint64_t v7 = -11800;
          double v6 = @"Media writing - no such property";
          goto LABEL_258;
        default:
          switch(a1)
          {
            case -12556:
              goto LABEL_157;
            case -12555:
              uint64_t v7 = -11862;
              break;
            case -12553:
            case -12551:
            case -12550:
              uint64_t v7 = -11880;
              break;
            case -12541:
              goto LABEL_79;
            case -12540:
              uint64_t v7 = -11900;
              break;
            default:
              goto LABEL_249;
          }
          break;
      }
      goto LABEL_262;
    }
    if (a1 > -12745)
    {
      switch(a1)
      {
        case -12719:
          uint64_t v7 = -11800;
          double v6 = @"Media format - slice has an invalid value";
          goto LABEL_258;
        case -12718:
          goto LABEL_249;
        case -12717:
          uint64_t v7 = -11800;
          double v6 = @"Media format - sample description is unsupported for the specified format flavor";
          goto LABEL_258;
        case -12716:
          uint64_t v7 = -11800;
          double v6 = @"Media format - format description has an incompatible format (e.g. unknown format / incompatible atom)";
          goto LABEL_258;
        case -12715:
          uint64_t v7 = -11800;
          double v6 = @"Media format - format description is invalid (e.g. invalid size)";
          goto LABEL_258;
        case -12714:
          uint64_t v7 = -11800;
          double v6 = @"Media format - sample description is invalid (e.g. invalid size)";
          goto LABEL_258;
        case -12713:
          goto LABEL_137;
        case -12712:
          uint64_t v7 = -11800;
          double v6 = @"Media format - invalid parameter";
          goto LABEL_258;
        default:
          switch(a1)
          {
            case -12668:
            case -12661:
              goto LABEL_37;
            case -12667:
            case -12666:
            case -12665:
            case -12663:
            case -12662:
              goto LABEL_249;
            case -12664:
              goto LABEL_137;
            case -12660:
              double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
              uint64_t v7 = -1102;
              break;
            default:
              int v12 = -12744;
              goto LABEL_247;
          }
          break;
      }
      goto LABEL_262;
    }
    if (a1 == -12814)
    {
      uint64_t v7 = -11800;
      double v6 = @"CoreAnimation image queue is full";
      goto LABEL_258;
    }
    if (a1 != -12786)
    {
      if (a1 != -12763) {
        goto LABEL_249;
      }
      uint64_t v7 = -11862;
      double v6 = @"Cannot append media data after ending session";
      goto LABEL_258;
    }
LABEL_137:
    uint64_t v7 = -11801;
    goto LABEL_262;
  }
  if (a1 > -16451)
  {
    if (a1 <= -15433)
    {
      if (a1 > -16126)
      {
        if (a1 <= -15842)
        {
          switch(a1)
          {
            case -16121:
            case -16120:
            case -16111:
            case -16110:
            case -16101:
            case -16100:
              goto LABEL_53;
            case -16119:
            case -16118:
            case -16117:
            case -16116:
            case -16115:
            case -16112:
            case -16109:
            case -16108:
            case -16107:
            case -16106:
            case -16105:
            case -16104:
            case -16103:
              goto LABEL_249;
            case -16114:
              uint64_t v7 = -11875;
              double v6 = @"Value for kVTDecompressionPropertyKey_RequestedMVHEVCVideoLayerIDs does not match content";
              goto LABEL_258;
            case -16113:
              uint64_t v7 = -11875;
              double v6 = @"Can only use kVTDecompressionPropertyKey_RequestedMVHEVCVideoLayerIDs for MV-HEVC video";
              goto LABEL_258;
            case -16102:
              goto LABEL_124;
            default:
              if (a1 != -16125) {
                goto LABEL_249;
              }
              uint64_t v7 = -11862;
              double v6 = @"Cannot append tagged buffer that contains no CVPixelBuffers";
              break;
          }
          goto LABEL_258;
        }
        if ((a1 + 15519) < 5 || (a1 + 15811) < 2)
        {
LABEL_93:
          uint64_t v7 = -11848;
          goto LABEL_262;
        }
        if (a1 != -15841) {
          goto LABEL_249;
        }
        goto LABEL_181;
      }
      if (a1 <= -16223)
      {
        switch(a1)
        {
          case -16434:
          case -16405:
            goto LABEL_157;
          case -16433:
          case -16430:
          case -16429:
          case -16428:
          case -16427:
          case -16426:
          case -16425:
          case -16424:
          case -16423:
          case -16421:
          case -16420:
          case -16416:
          case -16415:
          case -16408:
          case -16407:
          case -16406:
          case -16404:
          case -16403:
            goto LABEL_249;
          case -16432:
            goto LABEL_262;
          case -16431:
          case -16422:
            goto LABEL_124;
          case -16419:
            uint64_t v7 = -11859;
            break;
          case -16418:
            uint64_t v7 = -11805;
            break;
          case -16417:
            uint64_t v7 = -11904;
            break;
          case -16414:
            uint64_t v7 = -11818;
            break;
          case -16413:
            uint64_t v7 = -11810;
            break;
          case -16412:
            uint64_t v7 = -11811;
            break;
          case -16411:
            goto LABEL_79;
          case -16410:
            goto LABEL_158;
          case -16409:
            uint64_t v7 = -11803;
            break;
          case -16402:
            goto LABEL_53;
          default:
            if (a1 != -16450) {
              goto LABEL_249;
            }
            uint64_t v7 = -11808;
            break;
        }
        goto LABEL_262;
      }
      if (a1 == -16222)
      {
        uint64_t v7 = -11856;
        goto LABEL_262;
      }
      if (a1 == -16180)
      {
        uint64_t v7 = -11858;
        double v6 = @"Custom compositor failed with client NSError";
        goto LABEL_258;
      }
      int v10 = -16155;
      goto LABEL_156;
    }
    if (a1 > -12889)
    {
      if (a1 <= -12849)
      {
        switch(a1)
        {
          case -12888:
          case -12887:
            uint64_t v7 = -11866;
            break;
          case -12886:
            uint64_t v7 = -11853;
            double v6 = @"JSON format error";
            goto LABEL_258;
          case -12885:
            goto LABEL_87;
          case -12884:
            goto LABEL_37;
          case -12880:
            uint64_t v7 = -11867;
            break;
          case -12875:
            double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
            uint64_t v7 = -1001;
            break;
          case -12873:
            uint64_t v7 = -11849;
            break;
          case -12867:
            goto LABEL_115;
          case -12864:
            goto LABEL_174;
          case -12862:
            goto LABEL_137;
          default:
            goto LABEL_249;
        }
        goto LABEL_262;
      }
      if (a1 == -12848)
      {
        uint64_t v7 = -11829;
        goto LABEL_262;
      }
      if (a1 == -12847)
      {
LABEL_138:
        uint64_t v7 = -11828;
        goto LABEL_262;
      }
      int v11 = -12846;
    }
    else
    {
      if (a1 > -12940)
      {
        switch(a1)
        {
          case -12939:
            uint64_t v7 = -11850;
            break;
          case -12938:
            goto LABEL_113;
          case -12937:
            goto LABEL_120;
          case -12935:
            double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
            uint64_t v7 = -1;
            break;
          case -12929:
            uint64_t v7 = -11857;
            break;
          case -12926:
            uint64_t v7 = -11882;
            break;
          case -12925:
            goto LABEL_93;
          case -12915:
            uint64_t v7 = -11840;
            break;
          case -12913:
            goto LABEL_112;
          case -12912:
            uint64_t v7 = -11883;
            break;
          case -12911:
          case -12909:
            goto LABEL_90;
          case -12910:
            goto LABEL_24;
          case -12908:
            a2 = (id)ensureUserInfoDictionaryContainsObjectForKey(a2, @"vide");
            uint64_t v7 = -11834;
            break;
          case -12906:
            a2 = (id)ensureUserInfoDictionaryContainsObjectForKey(a2, @"vide");
            uint64_t v7 = -11833;
            break;
          default:
            goto LABEL_249;
        }
        goto LABEL_262;
      }
      if (a1 == -15432)
      {
LABEL_132:
        double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
        uint64_t v7 = -3000;
        goto LABEL_262;
      }
      if (a1 == -15430)
      {
        uint64_t v7 = -11911;
        goto LABEL_262;
      }
      int v11 = -12953;
    }
    if (a1 != v11) {
      goto LABEL_249;
    }
    goto LABEL_137;
  }
  if (a1 <= -17544)
  {
    if (a1 <= -42006)
    {
      if (a1 <= -42598)
      {
        char v8 = a1 - 71;
        if ((a1 + 42681) > 0xD)
        {
LABEL_15:
          if (a1 == -536870208)
          {
            uint64_t v7 = -11804;
            goto LABEL_262;
          }
          int v9 = -42783;
LABEL_171:
          if (a1 == v9) {
            goto LABEL_172;
          }
          goto LABEL_249;
        }
        if (((1 << v8) & 0x21C1) == 0)
        {
          if (((1 << v8) & 0x206) != 0)
          {
LABEL_172:
            uint64_t v7 = -11836;
            goto LABEL_262;
          }
          if (a1 != -42676) {
            goto LABEL_15;
          }
          goto LABEL_137;
        }
LABEL_173:
        uint64_t v7 = -11835;
        goto LABEL_262;
      }
      if ((a1 + 42597) <= 0xD)
      {
        if (((1 << (a1 + 101)) & 0x1F87) != 0) {
          goto LABEL_173;
        }
        if (a1 == -42584)
        {
LABEL_87:
          uint64_t v7 = -11863;
          goto LABEL_262;
        }
      }
LABEL_249:
      if ((a1 + 11999) >= 0xC8) {
        int v14 = -11800;
      }
      else {
        int v14 = a1;
      }
      uint64_t v7 = v14;
LABEL_261:
      double v6 = @"AVFoundationErrorDomain";
      goto LABEL_262;
    }
    if (a1 <= -19033)
    {
      if (a1 <= -19231)
      {
        if ((a1 + 42005) < 2) {
          goto LABEL_173;
        }
        if (a1 == -19232)
        {
          uint64_t v7 = -11800;
          double v6 = @"CoreAnimation image queue does not support this image type";
        }
        else
        {
          if (a1 != -19231) {
            goto LABEL_249;
          }
          uint64_t v7 = -11800;
          double v6 = @"CoreAnimation image queue registration failed";
        }
        goto LABEL_258;
      }
      if (a1 == -19230)
      {
        uint64_t v7 = -11800;
        double v6 = @"CoreAnimation image queue does not support this pixel format";
        goto LABEL_258;
      }
      if (a1 != -19163)
      {
        if (a1 != -19034) {
          goto LABEL_249;
        }
        uint64_t v7 = -11862;
        double v6 = @"Cannot append tagged buffer group due to left and right view IDs mismatch";
        goto LABEL_258;
      }
LABEL_181:
      uint64_t v7 = -11879;
      goto LABEL_262;
    }
    if (a1 <= -17773)
    {
      if (a1 == -19032)
      {
        uint64_t v7 = -11862;
        double v6 = @"Values for kVTCompressionPropertyKey_MVHEVCVideoLayerIDs are invalid";
        goto LABEL_258;
      }
      if (a1 == -19031)
      {
        uint64_t v7 = -11862;
        double v6 = @"Value at index 0 for kVTCompressionPropertyKey_MVHEVCVideoLayerIDs is not 0";
        goto LABEL_258;
      }
      int v10 = -17774;
      goto LABEL_156;
    }
    if ((a1 + 17693) < 2 || a1 == -17772)
    {
      uint64_t v7 = -11877;
      goto LABEL_262;
    }
    if (a1 != -17698) {
      goto LABEL_249;
    }
    uint64_t v7 = -11862;
    double v6 = @"Cannot append tagged buffer group due to video layer IDs mismatch";
LABEL_258:
    double v15 = (void *)[MEMORY[0x1E4F28E78] string];
    uint64_t v16 = *MEMORY[0x1E4F1D138];
    uint64_t v17 = [a2 objectForKey:*MEMORY[0x1E4F1D138]];
    if (v17) {
      [v15 appendFormat:@"%@, ", v17];
    }
    [v15 appendString:v6];
    a2 = (id)[a2 mutableCopy];
    [a2 setObject:v15 forKey:v16];
    goto LABEL_261;
  }
  if (a1 > -16851)
  {
    if (a1 <= -16823)
    {
      if ((a1 + 16850) >= 6)
      {
        if ((a1 + 16844) < 5)
        {
LABEL_120:
          double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
          uint64_t v7 = -1013;
          goto LABEL_262;
        }
        goto LABEL_249;
      }
LABEL_37:
      double v6 = (__CFString *)*MEMORY[0x1E4F289A0];
      uint64_t v7 = -1008;
      goto LABEL_262;
    }
    if (a1 > -16541)
    {
      if (a1 > -16455)
      {
        if (a1 == -16454)
        {
          uint64_t v7 = -11837;
          goto LABEL_262;
        }
        if (a1 == -16451)
        {
          uint64_t v7 = -11817;
          goto LABEL_262;
        }
      }
      else if (a1 == -16540 || a1 == -16530)
      {
        uint64_t v7 = -11846;
        goto LABEL_262;
      }
      goto LABEL_249;
    }
    if (a1 != -16822)
    {
      if (a1 == -16751)
      {
        uint64_t v7 = -11878;
        goto LABEL_262;
      }
      int v12 = -16750;
LABEL_247:
      if (a1 == v12)
      {
        uint64_t v7 = -11881;
        goto LABEL_262;
      }
      goto LABEL_249;
    }
LABEL_157:
    uint64_t v7 = -11819;
    goto LABEL_262;
  }
  if (a1 > -17227)
  {
    if (a1 > -16979)
    {
      switch(a1)
      {
        case -16978:
          goto LABEL_157;
        case -16977:
          goto LABEL_90;
        case -16976:
          goto LABEL_124;
        case -16975:
          uint64_t v7 = -11843;
          break;
        case -16970:
          goto LABEL_137;
        default:
          goto LABEL_249;
      }
      goto LABEL_262;
    }
    if (a1 == -17226)
    {
      uint64_t v7 = -11870;
      goto LABEL_262;
    }
    if (a1 == -17223)
    {
      uint64_t v7 = -11868;
      goto LABEL_262;
    }
    int v10 = -17221;
    goto LABEL_156;
  }
  if (a1 <= -17509)
  {
    if (a1 == -17543)
    {
      uint64_t v7 = -11876;
      double v6 = @"Media writing - segment is not allowed to star with a non-sync sample.";
    }
    else
    {
      if (a1 != -17540) {
        goto LABEL_249;
      }
      uint64_t v7 = -11800;
      double v6 = @"iTT requires languageCode or extendedLanguageTag property to be set";
    }
    goto LABEL_258;
  }
  switch(a1)
  {
    case -17508:
      goto LABEL_113;
    case -17507:
      uint64_t v7 = -11884;
      break;
    case -17506:
    case -17501:
      goto LABEL_137;
    case -17505:
    case -17504:
    case -17503:
    case -17502:
      goto LABEL_249;
    default:
      if (a1 == -17391)
      {
        uint64_t v7 = -11871;
      }
      else
      {
        if (a1 != -17390) {
          goto LABEL_249;
        }
        uint64_t v7 = -11841;
      }
      break;
  }
LABEL_262:
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return AVLocalizedError(v6, v7, a2);
}

uint64_t AVOSStatusToNSError(signed int a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = 0;
  signed int v10 = a1;
  uint64_t v5 = *MEMORY[0x1E4F28798];
  uint64_t v6 = *MEMORY[0x1E4F28760];
  while (*((unsigned __int8 *)&v10 + v4) - 127 >= 0xFFFFFFA1)
  {
    if (++v4 == 4)
    {
      uint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a2];
      [v2 setObject:objc_msgSend(NSString, "stringWithFormat:", @"'%@'", AVStringForOSType(a1)), @"AVErrorFourCharCode" forKey];
      break;
    }
  }
  if ((a1 - 1) >= 0x6A) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  char v8 = (void *)MEMORY[0x1E4F28C58];
  return [v8 errorWithDomain:v7 code:a1 userInfo:v2];
}

void sub_194A94DF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void *AVLocalizedStringFromTableWithBundleIdentifier(uint64_t a1, uint64_t a2, __CFString *a3)
{
  if (!a3) {
    a3 = @"com.apple.AVFCore";
  }
  char v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", a3), "localizedStringForKey:value:table:", a1, @"xxxxDefaultValuexxxx", a2);
  if ([v3 isEqualToString:@"xxxxDefaultValuexxxx"]) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t AVLocalizedError(void *a1, uint64_t a2, void *a3)
{
  if ([a1 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    id v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C58], "_web_errorWithDomain:code:URL:", a1, a2, objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F289D0])), "userInfo"), "mutableCopy");
    [v6 addEntriesFromDictionary:a3];
    a3 = v6;
  }
  uint64_t v7 = 0;
  char v8 = @"AVErrorUnknown";
  int v9 = 0;
  signed int v10 = 0;
  switch(a2)
  {
    case -11999:
      char v8 = @"AVErrorClientProgrammingError";
      goto LABEL_90;
    case -11998:
    case -11997:
    case -11996:
    case -11995:
    case -11994:
    case -11993:
    case -11992:
    case -11991:
    case -11990:
    case -11989:
    case -11988:
    case -11987:
    case -11986:
    case -11985:
    case -11984:
    case -11983:
    case -11982:
    case -11981:
    case -11980:
    case -11979:
    case -11978:
    case -11977:
    case -11976:
    case -11975:
    case -11974:
    case -11973:
    case -11972:
    case -11971:
    case -11970:
    case -11969:
    case -11968:
    case -11967:
    case -11966:
    case -11965:
    case -11964:
    case -11963:
    case -11962:
    case -11961:
    case -11960:
    case -11959:
    case -11958:
    case -11957:
    case -11956:
    case -11955:
    case -11954:
    case -11953:
    case -11952:
    case -11951:
    case -11950:
    case -11949:
    case -11948:
    case -11947:
    case -11946:
    case -11945:
    case -11944:
    case -11943:
    case -11942:
    case -11941:
    case -11940:
    case -11939:
    case -11938:
    case -11937:
    case -11936:
    case -11935:
    case -11934:
    case -11933:
    case -11932:
    case -11931:
    case -11930:
    case -11929:
    case -11928:
    case -11927:
    case -11926:
    case -11925:
    case -11924:
    case -11923:
    case -11922:
    case -11921:
    case -11920:
    case -11919:
    case -11918:
    case -11917:
    case -11916:
    case -11915:
    case -11914:
    case -11913:
    case -11912:
    case -11905:
    case -11902:
    case -11901:
    case -11899:
    case -11898:
    case -11897:
    case -11896:
    case -11895:
    case -11894:
    case -11893:
    case -11892:
    case -11891:
    case -11890:
    case -11889:
    case -11888:
    case -11887:
    case -11886:
    case -11885:
    case -11879:
    case -11874:
    case -11860:
    case -11851:
    case -11845:
    case -11844:
    case -11816:
    case -11802:
      goto LABEL_114;
    case -11911:
      char v8 = @"AVErrorPointlessOverCapture";
      goto LABEL_90;
    case -11910:
      char v8 = @"AVErrorOperationRequiresBothBudsInEar";
      goto LABEL_90;
    case -11909:
      char v8 = @"AVErrorIncorrectPassword";
      goto LABEL_90;
    case -11908:
      char v8 = @"AVErrorIncorrectPIN";
      goto LABEL_90;
    case -11907:
      char v8 = @"AVErrorMediaDataWritingExceededPredeterminedSize";
      goto LABEL_90;
    case -11906:
      char v8 = @"AVErrorFileWritingExceededPredeterminedSize";
      goto LABEL_90;
    case -11904:
      char v8 = @"AVErrorRecordingNotAllowedWhenMultipleAppsAreForeground";
      goto LABEL_90;
    case -11903:
      char v8 = @"AVErrorFileChecksumFailed";
      goto LABEL_90;
    case -11900:
      char v8 = @"AVErrorInvalidFileAtDownloadDestinationURL";
      goto LABEL_90;
    case -11884:
      char v8 = @"AVErrorSandboxExtensionDenied";
      goto LABEL_90;
    case -11883:
      char v8 = @"AVErrorEncodeFailed";
      goto LABEL_90;
    case -11882:
      char v8 = @"AVErrorAirPlayReceiverTemporarilyUnavailable";
      goto LABEL_90;
    case -11881:
      char v8 = @"AVErrorFailedToLoadSampleData";
      goto LABEL_90;
    case -11880:
      char v8 = @"AVErrorInvalidSampleCursor";
      goto LABEL_90;
    case -11878:
      char v8 = @"AVErrorOperationCancelled";
      goto LABEL_90;
    case -11877:
      char v8 = @"AVErrorRosettaNotInstalled";
      goto LABEL_90;
    case -11876:
      char v8 = @"AVErrorSegmentStartedWithNonSyncSample";
      goto LABEL_90;
    case -11875:
      char v8 = @"AVErrorIncorrectlyConfigured";
      goto LABEL_90;
    case -11873:
      char v8 = @"AVErrorUnsupportedDeviceActiveFormat";
      goto LABEL_90;
    case -11872:
      char v8 = @"AVErrorSessionHardwareCostOverage";
      goto LABEL_90;
    case -11871:
      char v8 = @"AVErrorOperationNotSupportedForPreset";
      goto LABEL_90;
    case -11870:
      char v8 = @"AVErrorExternalPlaybackNotSupportedForAsset";
      goto LABEL_90;
    case -11869:
      char v8 = @"AVErrorNoSourceTrack";
      goto LABEL_90;
    case -11868:
      char v8 = @"AVErrorNoCompatibleAlternatesForExternalDisplay";
      goto LABEL_90;
    case -11867:
      char v8 = @"AVErrorNoLongerPlayable";
      goto LABEL_90;
    case -11866:
      char v8 = @"AVErrorContentNotUpdated";
      goto LABEL_90;
    case -11865:
      char v8 = @"AVErrorMalformedDepth";
      goto LABEL_90;
    case -11864:
      char v8 = @"AVErrorFormatUnsupported";
      goto LABEL_90;
    case -11863:
      char v8 = @"AVErrorContentIsUnavailable";
      goto LABEL_90;
    case -11862:
      char v8 = @"AVErrorOperationNotAllowed";
      goto LABEL_90;
    case -11861:
      char v8 = @"AVErrorUnsupportedOutputSettings";
      goto LABEL_90;
    case -11859:
      char v8 = @"AVErrorRecordingAlreadyInProgress";
      goto LABEL_90;
    case -11858:
      char v8 = @"AVErrorVideoCompositorFailed";
      goto LABEL_90;
    case -11857:
      char v8 = @"AVErrorAirPlayReceiverRequiresInternet";
      goto LABEL_90;
    case -11856:
      char v8 = @"AVErrorAirPlayControllerRequiresInternet";
      goto LABEL_90;
    case -11855:
      char v8 = @"AVErrorUndecodableMediaData";
      goto LABEL_90;
    case -11854:
      char v8 = @"AVErrorFileTypeDoesNotSupportSampleReferences";
      goto LABEL_90;
    case -11853:
      char v8 = @"AVErrorFailedToParse";
      goto LABEL_90;
    case -11852:
      char v8 = @"AVErrorApplicationIsNotAuthorizedToUseDevice";
      goto LABEL_90;
    case -11850:
      char v8 = @"AVErrorServerIncorrectlyConfigured";
      goto LABEL_90;
    case -11849:
      char v8 = @"AVErrorFailedToLoadMediaData";
      goto LABEL_90;
    case -11848:
      char v8 = @"AVErrorIncompatibleAsset";
      goto LABEL_90;
    case -11847:
      char v8 = @"AVErrorOperationInterrupted";
      goto LABEL_90;
    case -11846:
      char v8 = @"AVErrorTorchLevelUnavailable";
      goto LABEL_90;
    case -11843:
      char v8 = @"AVErrorInvalidOutputURLPathExtension";
      goto LABEL_90;
    case -11842:
      char v8 = @"AVErrorReferenceForbiddenByReferencePolicy";
      goto LABEL_90;
    case -11841:
      char v8 = @"AVErrorInvalidVideoComposition";
      goto LABEL_90;
    case -11840:
      char v8 = @"AVErrorEncoderTemporarilyUnavailable";
      goto LABEL_90;
    case -11839:
      char v8 = @"AVErrorDecoderTemporarilyUnavailable";
      goto LABEL_90;
    case -11838:
      char v8 = @"AVErrorOperationNotSupportedForAsset";
      goto LABEL_90;
    case -11837:
      char v8 = @"AVErrorDeviceIsNotAvailableInBackground";
      goto LABEL_90;
    case -11836:
      char v8 = @"AVErrorApplicationIsNotAuthorized";
      goto LABEL_90;
    case -11835:
      char v8 = @"AVErrorContentIsNotAuthorized";
      goto LABEL_90;
    case -11834:
      char v8 = @"AVErrorEncoderNotFound";
      goto LABEL_90;
    case -11833:
      char v8 = @"AVErrorDecoderNotFound";
      goto LABEL_90;
    case -11832:
      char v8 = @"AVErrorNoImageAtTime";
      goto LABEL_90;
    case -11831:
      char v8 = @"AVErrorContentIsProtected";
      goto LABEL_90;
    case -11830:
      char v8 = @"AVErrorMaximumStillImageCaptureRequestsExceeded";
      goto LABEL_90;
    case -11829:
      char v8 = @"AVErrorFileFailedToParse";
      goto LABEL_90;
    case -11828:
      char v8 = @"AVErrorFileFormatNotRecognized";
      goto LABEL_90;
    case -11827:
      char v8 = @"AVErrorInvalidCompositionTrackSegmentSourceDuration";
      goto LABEL_90;
    case -11826:
      char v8 = @"AVErrorInvalidCompositionTrackSegmentSourceStartTime";
      goto LABEL_90;
    case -11825:
      char v8 = @"AVErrorInvalidCompositionTrackSegmentDuration";
      goto LABEL_90;
    case -11824:
      char v8 = @"AVErrorCompositionTrackSegmentsNotContiguous";
      goto LABEL_90;
    case -11823:
      char v8 = @"AVErrorFileAlreadyExists";
      goto LABEL_90;
    case -11822:
      char v8 = @"AVErrorInvalidSourceMedia";
      goto LABEL_90;
    case -11821:
      char v8 = @"AVErrorDecodeFailed";
      goto LABEL_90;
    case -11820:
      char v8 = @"AVErrorExportFailed";
      goto LABEL_90;
    case -11819:
      char v8 = @"AVErrorMediaServicesWereReset";
      goto LABEL_90;
    case -11818:
      char v8 = @"AVErrorSessionWasInterrupted";
      goto LABEL_90;
    case -11817:
      char v8 = @"AVErrorDeviceLockedForConfigurationByAnotherProcess";
      goto LABEL_90;
    case -11815:
      char v8 = @"AVErrorDeviceInUseByAnotherApplication";
      goto LABEL_90;
    case -11814:
      char v8 = @"AVErrorDeviceNotConnected";
      goto LABEL_90;
    case -11813:
      char v8 = @"AVErrorMaximumNumberOfSamplesForFileFormatReached";
      goto LABEL_90;
    case -11812:
      char v8 = @"AVErrorMediaDiscontinuity";
      goto LABEL_90;
    case -11811:
      char v8 = @"AVErrorMaximumFileSizeReached";
      goto LABEL_90;
    case -11810:
      char v8 = @"AVErrorMaximumDurationReached";
      goto LABEL_90;
    case -11809:
      char v8 = @"AVErrorMediaChanged";
      goto LABEL_90;
    case -11808:
      char v8 = @"AVErrorDeviceWasDisconnected";
      goto LABEL_90;
    case -11807:
      char v8 = @"AVErrorDiskFull";
      goto LABEL_90;
    case -11806:
      char v8 = @"AVErrorSessionConfigurationChanged";
      goto LABEL_90;
    case -11805:
      char v8 = @"AVErrorNoDataCaptured";
      goto LABEL_90;
    case -11804:
      char v8 = @"AVErrorDeviceAlreadyUsedByAnotherSession";
      goto LABEL_90;
    case -11803:
      char v8 = @"AVErrorSessionNotRunning";
      goto LABEL_90;
    case -11801:
      char v8 = @"AVErrorOutOfMemory";
      goto LABEL_90;
    case -11800:
LABEL_90:
      int v11 = (void *)[a1 stringByAppendingFormat:@"_%@", v8];
      signed int v10 = v11;
      if (!v11)
      {
        uint64_t v7 = 0;
        int v9 = 0;
        goto LABEL_114;
      }
      uint64_t v7 = AVLocalizedStringFromTable([v11 stringByAppendingString:@"_Description"], @"AVError");
      int v9 = AVLocalizedStringFromTable([v10 stringByAppendingString:@"_FailureReason"], @"AVError");
      signed int v10 = AVLocalizedStringFromTable([v10 stringByAppendingString:@"_RecoverySuggestion"], @"AVError");
      if (![a1 isEqualToString:@"AVFoundationErrorDomain"]) {
        goto LABEL_114;
      }
      if (a2 <= -11818)
      {
        if (a2 == -11854)
        {
          uint64_t v23 = [a3 objectForKey:@"AVErrorFileTypeKey"];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v23), "localizedDescription");
            if (v25) {
              uint64_t v26 = v25;
            }
            else {
              uint64_t v26 = v24;
            }
          }
          else
          {
            uint64_t v26 = 0;
          }
          if (v9)
          {
            int v13 = NSString;
            uint64_t v28 = v26;
            uint64_t v29 = 0;
            goto LABEL_112;
          }
          goto LABEL_114;
        }
        if (a2 != -11852)
        {
          if (a2 == -11837)
          {
            uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVErrorDeviceKey"), "localizedName");
            uint64_t v29 = 0;
            if (v7) {
              uint64_t v7 = (void *)[NSString stringWithValidatedFormat:v7, @"%@", &v29, v12 validFormatSpecifiers error];
            }
            if (v9) {
              goto LABEL_111;
            }
          }
          goto LABEL_114;
        }
      }
      else
      {
        if (a2 > -11805)
        {
          if (a2 == -11804)
          {
            uint64_t v27 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVErrorDeviceKey"), "localizedName");
            if (v10)
            {
              uint64_t v29 = 0;
              signed int v10 = (void *)[NSString stringWithValidatedFormat:v10, @"%@", &v29, v27 validFormatSpecifiers error];
            }
          }
          else if (a2 == -11800)
          {
            double v21 = (void *)[a3 objectForKey:*MEMORY[0x1E4F28A50]];
            uint64_t v22 = v21 ? [v21 code] : 4294955496;
            if (v9)
            {
              uint64_t v14 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%d", &v29, v22, 0);
              goto LABEL_113;
            }
          }
          goto LABEL_114;
        }
        if (a2 != -11817 && a2 != -11815) {
          goto LABEL_114;
        }
      }
      uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVErrorDeviceKey"), "localizedName");
      if (v7)
      {
        uint64_t v29 = 0;
        uint64_t v7 = (void *)[NSString stringWithValidatedFormat:v7, @"%@", &v29, v12 validFormatSpecifiers error];
      }
      if (v10)
      {
        uint64_t v29 = 0;
        signed int v10 = (void *)[NSString stringWithValidatedFormat:v10, @"%@", &v29, v12 validFormatSpecifiers error];
      }
      if (v9)
      {
        uint64_t v29 = 0;
LABEL_111:
        int v13 = NSString;
        uint64_t v28 = v12;
LABEL_112:
        uint64_t v14 = [v13 stringWithValidatedFormat:v9, @"%@", &v29, v28, v29 validFormatSpecifiers error];
LABEL_113:
        int v9 = (void *)v14;
      }
LABEL_114:
      if (a3) {
        id v15 = (id)[a3 mutableCopy];
      }
      else {
        id v15 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
      }
      uint64_t v16 = v15;
      if (v7)
      {
        uint64_t v17 = *MEMORY[0x1E4F28568];
        if (![a3 objectForKey:*MEMORY[0x1E4F28568]]) {
          [v16 setObject:v7 forKey:v17];
        }
      }
      if (v9)
      {
        uint64_t v18 = *MEMORY[0x1E4F28588];
        if (![a3 objectForKey:*MEMORY[0x1E4F28588]]) {
          [v16 setObject:v9 forKey:v18];
        }
      }
      if (v10)
      {
        uint64_t v19 = *MEMORY[0x1E4F285A0];
        if (![a3 objectForKey:*MEMORY[0x1E4F285A0]]) {
          [v16 setObject:v10 forKey:v19];
        }
      }
      return [MEMORY[0x1E4F28C58] errorWithDomain:a1 code:a2 userInfo:v16];
    default:
      int v9 = 0;
      signed int v10 = 0;
      goto LABEL_114;
  }
}

void *AVLocalizedStringFromTable(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.AVFCore"), "localizedStringForKey:value:table:", a1, @"xxxxDefaultValuexxxx", a2);
  if ([v2 isEqualToString:@"xxxxDefaultValuexxxx"]) {
    return 0;
  }
  else {
    return v2;
  }
}

void sub_194A959B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_194A96234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A963DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194A964DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_194A96688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __avplayeritem_fpItemNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x199715AE0]();
  if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33640]))
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33648]))
    {
      [*(id *)(a1 + 32) _markAsReadyForBasicInspection];
      [*(id *)(a1 + 32) _markAsReadyForInspectionOfDuration];
      [*(id *)(a1 + 32) _markAsReadyForInspectionOfPresentationSize];
      CFDictionaryRef v8 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33758]];
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (v8)
      {
        CMTimeMakeFromDictionary(&valuePtr, v8);
      }
      else
      {
        id v15 = *(void **)(a1 + 32);
        if (v15) {
          [v15 _duration];
        }
      }
      CMTime time1 = valuePtr;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
      if (CMTimeCompare(&time1, &time2))
      {
        CMTime time1 = valuePtr;
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
        if (CMTimeCompare(&time1, &time2))
        {
          [*(id *)(a1 + 32) willChangeValueForKey:@"duration"];
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v17 = *(NSObject **)(*(void *)(v16 + 8) + 16);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_2;
          block[3] = &unk_1E57B3FC0;
          CMTime v205 = valuePtr;
          block[4] = v16;
          av_readwrite_dispatch_queue_write(v17, block);
          [*(id *)(a1 + 32) didChangeValueForKey:@"duration"];
        }
      }
      *(_OWORD *)&time1.CMTimeValue value = *MEMORY[0x1E4F1DB30];
      CFDictionaryRef v18 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33748]];
      if (!v18 || !CGSizeMakeWithDictionaryRepresentation(v18, (CGSize *)&time1))
      {
        [*(id *)(a1 + 32) _presentationSize];
        time1.CMTimeValue value = v19;
        *(void *)&time1.CMTimeScale timescale = v20;
      }
      [*(id *)(a1 + 32) willChangeValueForKey:@"presentationSize"];
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = *(NSObject **)(*(void *)(v21 + 8) + 16);
      v202[0] = MEMORY[0x1E4F143A8];
      v202[1] = 3221225472;
      v202[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_3;
      v202[3] = &unk_1E57B36D0;
      v202[4] = v21;
      long long v203 = *(_OWORD *)&time1.value;
      av_readwrite_dispatch_queue_write(v22, v202);
      [*(id *)(a1 + 40) _noteNewPresentationSizeForPlayerItem:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) didChangeValueForKey:@"presentationSize"];
      uint64_t v23 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemPresentationSizeDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v23);
      uint64_t v24 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F337C0]];
      if (v24)
      {
        uint64_t v25 = v24;
        [*(id *)(a1 + 32) willChangeValueForKey:@"hasEnabledAudio"];
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(NSObject **)(*(void *)(v26 + 8) + 16);
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        v201[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_4;
        v201[3] = &unk_1E57B2098;
        v201[4] = v26;
        v201[5] = v25;
        av_readwrite_dispatch_queue_write(v27, v201);
        [*(id *)(a1 + 32) didChangeValueForKey:@"hasEnabledAudio"];
      }
      uint64_t v28 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F337C8]];
      if (v28)
      {
        uint64_t v29 = v28;
        [*(id *)(a1 + 32) willChangeValueForKey:@"hasEnabledVideo"];
        uint64_t v30 = *(void *)(a1 + 32);
        uint64_t v31 = *(NSObject **)(*(void *)(v30 + 8) + 16);
        v200[0] = MEMORY[0x1E4F143A8];
        v200[1] = 3221225472;
        v200[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_5;
        v200[3] = &unk_1E57B2098;
        v200[4] = v30;
        v200[5] = v29;
        av_readwrite_dispatch_queue_write(v31, v200);
        [*(id *)(a1 + 32) didChangeValueForKey:@"hasEnabledVideo"];
      }
      uint64_t v32 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F337B8]];
      if (v32)
      {
        uint64_t v33 = v32;
        [*(id *)(a1 + 32) willChangeValueForKey:@"hasVideo"];
        uint64_t v34 = *(void *)(a1 + 32);
        uint64_t v35 = *(NSObject **)(*(void *)(v34 + 8) + 16);
        v199[0] = MEMORY[0x1E4F143A8];
        v199[1] = 3221225472;
        v199[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_6;
        v199[3] = &unk_1E57B2098;
        v199[4] = v34;
        v199[5] = v33;
        av_readwrite_dispatch_queue_write(v35, v199);
        [*(id *)(a1 + 32) didChangeValueForKey:@"hasVideo"];
      }
      uint64_t v36 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33750]];
      if (!v36) {
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isNonForcedSubtitleDisplayEnabled"));
      }
      [*(id *)(a1 + 32) willChangeValueForKey:@"nonForcedSubtitleDisplayEnabled"];
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(NSObject **)(*(void *)(v37 + 8) + 16);
      v198[0] = MEMORY[0x1E4F143A8];
      v198[1] = 3221225472;
      v198[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_7;
      v198[3] = &unk_1E57B2098;
      v198[4] = v37;
      v198[5] = v36;
      av_readwrite_dispatch_queue_write(v38, v198);
      [*(id *)(a1 + 40) _noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) didChangeValueForKey:@"nonForcedSubtitleDisplayEnabled"];
      uint64_t v39 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemNonForcedSubtitleDisplayEnabledDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v39);
      [*(id *)(a1 + 32) _setAssetToAssetWithFigPlaybackItemIfAppropriate];
      [*(id *)(a1 + 32) _updateTimebase];
      objc_msgSend(*(id *)(a1 + 32), "_updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:updateStatusToReadyToPlay:", *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "status") != 1);
      [*(id *)(a1 + 40) _itemIsReadyToPlay:*(void *)(a1 + 32)];
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336D8]))
    {
      [*(id *)(a1 + 32) _updateTimebase];
      if (!objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_player"), "currentItem")))goto LABEL_51; {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      }
      signed int v10 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = @"AVPlayerItemTimebaseChangedNotification";
      goto LABEL_16;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33598])
      || CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33590]))
    {
      uint64_t v41 = [*(id *)(a1 + 32) _playbackItemNotificationPayloadToError:*(void *)(a1 + 64)];
      if (v41)
      {
LABEL_41:
        [*(id *)(a1 + 32) _changeStatusToFailedWithError:v41];
        id v42 = *(void **)(a1 + 32);
LABEL_50:
        [v42 _invokeReadyForEnqueueingHandlers];
        goto LABEL_51;
      }
LABEL_40:
      uint64_t v41 = AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
      goto LABEL_41;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336A0]))
    {
      unsigned int v49 = *(const void **)(a1 + 64);
      if (v49)
      {
        CFTypeID v50 = CFGetTypeID(v49);
        if (v50 == CFDictionaryGetTypeID())
        {
          LODWORD(valuePtr.value) = 0;
          FigCFDictionaryGetInt32IfPresent();
        }
      }
      goto LABEL_40;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33610]))
    {
      time1.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
      CMTimeFlags v51 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
      time1.CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
      CMTimeEpoch v52 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      time2.CMTimeValue value = time1.value;
      time2.CMTimeScale timescale = time1.timescale;
      CFDictionaryRef v53 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33768]];
      CFDictionaryRef v54 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33740]];
      [*(id *)(a1 + 32) _markAsReadyForInspectionOfRecommendedTimeOffsetFromLive];
      CMTimeEpoch epoch = v52;
      CMTimeFlags flags = v51;
      if (v53)
      {
        CMTimeMakeFromDictionary(&valuePtr, v53);
        time1.CMTimeValue value = valuePtr.value;
        CMTimeFlags flags = valuePtr.flags;
        time1.CMTimeScale timescale = valuePtr.timescale;
        CMTimeEpoch epoch = valuePtr.epoch;
      }
      if ((flags & 1) == 0)
      {
        unsigned int v57 = *(void **)(a1 + 32);
        if (v57)
        {
          [v57 _recommendedTimeOffsetFromLive];
          CMTimeFlags flags = valuePtr.flags;
          CMTimeEpoch epoch = valuePtr.epoch;
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          memset(&valuePtr, 0, sizeof(valuePtr));
        }
        time1.CMTimeValue value = valuePtr.value;
        time1.CMTimeScale timescale = valuePtr.timescale;
      }
      if (v54)
      {
        CMTimeMakeFromDictionary(&valuePtr, v54);
        time2.CMTimeValue value = valuePtr.value;
        CMTimeFlags v51 = valuePtr.flags;
        time2.CMTimeScale timescale = valuePtr.timescale;
        CMTimeEpoch v52 = valuePtr.epoch;
      }
      v63 = *(void **)(a1 + 32);
      if ((v51 & 1) == 0)
      {
        if (v63)
        {
          [v63 _configuredTimeOffsetFromLive];
          CMTimeFlags v51 = valuePtr.flags;
          CMTimeEpoch v52 = valuePtr.epoch;
          v63 = *(void **)(a1 + 32);
        }
        else
        {
          CMTimeEpoch v52 = 0;
          CMTimeFlags v51 = 0;
          memset(&valuePtr, 0, sizeof(valuePtr));
        }
        time2.CMTimeValue value = valuePtr.value;
        time2.CMTimeScale timescale = valuePtr.timescale;
      }
      uint64_t v64 = *(NSObject **)(v63[1] + 16);
      v190[0] = MEMORY[0x1E4F143A8];
      v190[1] = 3221225472;
      v190[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_8;
      v190[3] = &unk_1E57B4278;
      v190[4] = v63;
      v190[5] = time1.value;
      CMTimeScale timescale = time1.timescale;
      CMTimeFlags v192 = flags;
      CMTimeEpoch v193 = epoch;
      CMTimeValue value = time2.value;
      CMTimeScale v195 = time2.timescale;
      CMTimeFlags v196 = v51;
      CMTimeEpoch v197 = v52;
      av_readwrite_dispatch_queue_write(v64, v190);
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      signed int v10 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = @"AVPlayerItemRecommendedTimeOffsetFromLiveDidChangeNotification";
      goto LABEL_16;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336B0]))
    {
      uint64_t v58 = @"playbackLikelyToKeepUp";
      [*(id *)(a1 + 32) willChangeValueForKey:@"playbackLikelyToKeepUp"];
      uint64_t v59 = *(void *)(a1 + 32);
      id v60 = *(NSObject **)(*(void *)(v59 + 8) + 16);
      v189[0] = MEMORY[0x1E4F143A8];
      v189[1] = 3221225472;
      v189[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_9;
      v189[3] = &unk_1E57B1E80;
      v189[4] = v59;
      uint64_t v61 = v189;
LABEL_87:
      av_readwrite_dispatch_queue_write(v60, v61);
      v67 = *(void **)(a1 + 32);
      CFTypeID v68 = v58;
      goto LABEL_88;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336C0]))
    {
      uint64_t v58 = @"playbackLikelyToKeepUp";
      [*(id *)(a1 + 32) willChangeValueForKey:@"playbackLikelyToKeepUp"];
      uint64_t v62 = *(void *)(a1 + 32);
      id v60 = *(NSObject **)(*(void *)(v62 + 8) + 16);
      v188[0] = MEMORY[0x1E4F143A8];
      v188[1] = 3221225472;
      v188[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_10;
      v188[3] = &unk_1E57B1E80;
      v188[4] = v62;
      uint64_t v61 = v188;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336B8]))
    {
      uint64_t v58 = @"playbackBufferEmpty";
      [*(id *)(a1 + 32) willChangeValueForKey:@"playbackBufferEmpty"];
      uint64_t v65 = *(void *)(a1 + 32);
      id v60 = *(NSObject **)(*(void *)(v65 + 8) + 16);
      v187[0] = MEMORY[0x1E4F143A8];
      v187[1] = 3221225472;
      v187[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_11;
      v187[3] = &unk_1E57B1E80;
      v187[4] = v65;
      uint64_t v61 = v187;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336A8]))
    {
      uint64_t v58 = @"playbackBufferFull";
      [*(id *)(a1 + 32) willChangeValueForKey:@"playbackBufferFull"];
      uint64_t v66 = *(void *)(a1 + 32);
      id v60 = *(NSObject **)(*(void *)(v66 + 8) + 16);
      v186[0] = MEMORY[0x1E4F143A8];
      v186[1] = 3221225472;
      v186[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_12;
      v186[3] = &unk_1E57B1E80;
      v186[4] = v66;
      uint64_t v61 = v186;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33628]))
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      signed int v10 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = @"AVPlayerItemPlaybackStalledNotification";
LABEL_16:
      uint64_t v13 = [v10 notificationWithName:v12 object:v11];
      uint64_t v14 = (void *)v9;
LABEL_17:
      [v14 postNotification:v13];
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33688]))
    {
      uint64_t v69 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33770]];
      uint64_t v70 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33CD0]];
      v71 = *(void **)(a1 + 32);
      if (v69) {
        uint64_t v72 = [v71 _seekableTimeRangesFromFPSeekableTimeIntervals:v69];
      }
      else {
        uint64_t v72 = [v71 _seekableTimeRanges];
      }
      uint64_t v82 = v72;
      [*(id *)(a1 + 32) willChangeValueForKey:@"seekableTimeRanges"];
      if (v70) {
        [*(id *)(a1 + 32) willChangeValueForKey:@"seekableTimeRangesLastModifiedTime"];
      }
      uint64_t v83 = *(void *)(a1 + 32);
      uint64_t v84 = *(NSObject **)(*(void *)(v83 + 8) + 16);
      v185[0] = MEMORY[0x1E4F143A8];
      v185[1] = 3221225472;
      v185[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_13;
      v185[3] = &unk_1E57B2138;
      v185[4] = v83;
      v185[5] = v82;
      v185[6] = v70;
      av_readwrite_dispatch_queue_write(v84, v185);
      [*(id *)(a1 + 32) didChangeValueForKey:@"seekableTimeRanges"];
      if (!v70) {
        goto LABEL_51;
      }
      v67 = *(void **)(a1 + 32);
      CFTypeID v68 = @"seekableTimeRangesLastModifiedTime";
LABEL_88:
      [v67 didChangeValueForKey:v68];
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33620]))
    {
      uint64_t v73 = (void *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33720]];
      char v74 = [v73 isEqual:*MEMORY[0x1E4F334F8]];
      if ([*(id *)(a1 + 32) isPlaybackBufferFull] && (v74 & 1) == 0)
      {
        [*(id *)(a1 + 32) willChangeValueForKey:@"playbackBufferFull"];
        uint64_t v75 = *(void *)(a1 + 32);
        CFBooleanRef v76 = *(NSObject **)(*(void *)(v75 + 8) + 16);
        v184[0] = MEMORY[0x1E4F143A8];
        v184[1] = 3221225472;
        v184[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_14;
        v184[3] = &unk_1E57B1E80;
        v184[4] = v75;
        av_readwrite_dispatch_queue_write(v76, v184);
        [*(id *)(a1 + 32) didChangeValueForKey:@"playbackBufferFull"];
      }
      if ([*(id *)(a1 + 32) isPlaybackBufferEmpty])
      {
        [*(id *)(a1 + 32) willChangeValueForKey:@"playbackBufferEmpty"];
        uint64_t v77 = *(void *)(a1 + 32);
        v78 = *(NSObject **)(*(void *)(v77 + 8) + 16);
        v183[0] = MEMORY[0x1E4F143A8];
        v183[1] = 3221225472;
        v183[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_15;
        v183[3] = &unk_1E57B1E80;
        v183[4] = v77;
        av_readwrite_dispatch_queue_write(v78, v183);
        [*(id *)(a1 + 32) didChangeValueForKey:@"playbackBufferEmpty"];
      }
      uint64_t v79 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33760]];
      v80 = *(void **)(a1 + 32);
      if (v79) {
        uint64_t v81 = objc_msgSend(v80, "_loadedTimeRangesFromFPPlaybableTimeIntervals:");
      }
      else {
        uint64_t v81 = [v80 _loadedTimeRanges];
      }
      uint64_t v95 = v81;
      char v96 = @"loadedTimeRanges";
      [*(id *)(a1 + 32) willChangeValueForKey:@"loadedTimeRanges"];
      uint64_t v97 = *(void *)(a1 + 32);
      v98 = *(NSObject **)(*(void *)(v97 + 8) + 16);
      v182[0] = MEMORY[0x1E4F143A8];
      v182[1] = 3221225472;
      v182[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_16;
      v182[3] = &unk_1E57B2098;
      v182[4] = v97;
      v182[5] = v95;
      uint64_t v99 = v182;
LABEL_116:
      av_readwrite_dispatch_queue_write(v98, v99);
      v67 = *(void **)(a1 + 32);
      CFTypeID v68 = v96;
      goto LABEL_88;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33578]))
    {
      *(_OWORD *)&valuePtr.CMTimeValue value = *MEMORY[0x1E4F1DB30];
      CFDictionaryRef v85 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33748]];
      if (!v85 || !CGSizeMakeWithDictionaryRepresentation(v85, (CGSize *)&valuePtr))
      {
        [*(id *)(a1 + 32) _presentationSize];
        valuePtr.CMTimeValue value = v86;
        *(void *)&valuePtr.CMTimeScale timescale = v87;
      }
      [*(id *)(a1 + 32) _markAsReadyForInspectionOfPresentationSize];
      [*(id *)(a1 + 32) willChangeValueForKey:@"presentationSize"];
      uint64_t v88 = *(void *)(a1 + 32);
      v89 = *(NSObject **)(*(void *)(v88 + 8) + 16);
      v180[0] = MEMORY[0x1E4F143A8];
      v180[1] = 3221225472;
      v180[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_17;
      v180[3] = &unk_1E57B36D0;
      v180[4] = v88;
      long long v181 = *(_OWORD *)&valuePtr.value;
      av_readwrite_dispatch_queue_write(v89, v180);
      [*(id *)(a1 + 40) _noteNewPresentationSizeForPlayerItem:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) didChangeValueForKey:@"presentationSize"];
      uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v91 = *(void *)(a1 + 32);
      int v92 = @"AVPlayerItemPresentationSizeDidChangeNotification";
      goto LABEL_112;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336E0]))
    {
      [*(id *)(a1 + 32) _markAsReadyForInspectionOfTracks];
      if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) _isStreaming]
        && +[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem])
      {
        [*(id *)(a1 + 32) _markAssetWithFigPlaybackItemAsNeedingNewTracks];
      }
      uint64_t v100 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33798]];
      uint64_t v101 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33780]];
      dispatch_retain(*(dispatch_object_t *)(a1 + 48));
      uint64_t v102 = *(void *)(a1 + 32);
      v103 = *(NSObject **)(*(void *)(v102 + 8) + 40);
      v179[0] = MEMORY[0x1E4F143A8];
      v179[1] = 3221225472;
      v179[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_18;
      v179[3] = &unk_1E57B3248;
      v179[4] = v100;
      v179[5] = v102;
      v179[6] = *(void *)(a1 + 48);
      v179[7] = v101;
      v104 = v179;
      goto LABEL_122;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33588]))
    {
      [*(id *)(a1 + 32) _markAsReadyForInspectionOfDuration];
      if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112) _isStreaming]
        && !+[AVPlayerItem _forStreamingItemsVendAssetWithFigPlaybackItem])
      {
        [*(id *)(a1 + 32) _markAsNeedingNewAssetWithFigPlaybackItem];
      }
      memset(&valuePtr, 0, sizeof(valuePtr));
      CFDictionaryRef v105 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33758]];
      if (v105)
      {
        CMTimeMakeFromDictionary(&valuePtr, v105);
      }
      else
      {
        v107 = *(void **)(a1 + 32);
        if (v107) {
          [v107 _duration];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime valuePtr = time1;
      }
      uint64_t v58 = @"duration";
      [*(id *)(a1 + 32) willChangeValueForKey:@"duration"];
      uint64_t v111 = *(void *)(a1 + 32);
      id v60 = *(NSObject **)(*(void *)(v111 + 8) + 16);
      v177[0] = MEMORY[0x1E4F143A8];
      v177[1] = 3221225472;
      v177[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_21;
      v177[3] = &unk_1E57B3FC0;
      CMTime v178 = valuePtr;
      v177[4] = v111;
      uint64_t v61 = v177;
      goto LABEL_87;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33568]))
    {
      uint64_t v106 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      objc_msgSend(v106, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:", @"AVPlayerItemDidPlayToEndTimeNotification", *(void *)(a1 + 32)));
      if ([*(id *)(a1 + 40) _shouldLogPerformanceData]
        && [*(id *)(a1 + 40) actionAtItemEnd])
      {
        [*(id *)(a1 + 40) _logPerformanceDataForCurrentItem];
      }
      goto LABEL_51;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335A0]))
    {
      uint64_t v108 = [*(id *)(a1 + 32) _playbackItemNotificationPayloadToError:*(void *)(a1 + 64)];
      if ([*(id *)(a1 + 40) _shouldLogPerformanceData]
        && [*(id *)(a1 + 40) actionAtItemEnd])
      {
        [*(id *)(a1 + 40) _logPerformanceDataForCurrentItem];
      }
      v109 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v110 = *(void *)(a1 + 32);
      if (v108) {
        uint64_t v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v108 forKey:@"AVPlayerItemFailedToPlayToEndTimeErrorKey"];
      }
      else {
        uint64_t v93 = 0;
      }
      int v92 = @"AVPlayerItemFailedToPlayToEndTimeNotification";
      uint64_t v90 = v109;
      uint64_t v91 = v110;
      goto LABEL_113;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335A8]))
    {
      uint64_t v112 = *(void *)(a1 + 32);
      char v113 = *(NSObject **)(*(void *)(v112 + 8) + 16);
      v176[0] = MEMORY[0x1E4F143A8];
      v176[1] = 3221225472;
      v176[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_22;
      v176[3] = &unk_1E57B1E80;
      v176[4] = v112;
      char v114 = v176;
LABEL_150:
      av_readwrite_dispatch_queue_write(v113, v114);
      uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
      uint64_t v91 = *(void *)(a1 + 32);
      int v92 = @"AVPlayerItemHasEnqueuedVideoFrameDidChangeNotification";
      goto LABEL_112;
    }
    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33570]))
    {
      uint64_t v115 = *(void *)(a1 + 32);
      char v113 = *(NSObject **)(*(void *)(v115 + 8) + 16);
      v175[0] = MEMORY[0x1E4F143A8];
      v175[1] = 3221225472;
      v175[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_23;
      v175[3] = &unk_1E57B1E80;
      v175[4] = v115;
      char v114 = v175;
      goto LABEL_150;
    }
    if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F336D0]))
    {
      if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33600]))
      {
        uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
        uint64_t v91 = *(void *)(a1 + 32);
        int v92 = @"AVPlayerItemNewAccessLogEntry";
        goto LABEL_112;
      }
      if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33608]))
      {
        uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
        uint64_t v91 = *(void *)(a1 + 32);
        int v92 = @"AVPlayerItemNewErrorLogEntry";
        goto LABEL_112;
      }
      if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33678]))
      {
        int v117 = [*(id *)(a1 + 32) _timeJumpedNotificationIncludesExtendedDiagnosticPayload];
        uint64_t v118 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33718]];
        uint64_t v119 = v118;
        if ((v117 & 1) != 0 || v118)
        {
          v120 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          if (v119)
          {
            id v121 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v119];
            if (v121)
            {
              uint64_t v122 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_playbackCoordinator"), "participantForIdentifier:", v121);
              if (v122) {
                [v120 setObject:v122 forKey:@"AVPlayerItemTimeJumpedOriginatingParticipantKey"];
              }
            }
          }
          if (v117)
          {
            unsigned int v123 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E4F33838]), "integerValue")- 1;
            if (v123 > 5) {
              char v124 = @"AVPlayerItemTimeJumpedReasonUnknown";
            }
            else {
              char v124 = off_1E57B4308[v123];
            }
            [v120 setObject:v124 forKey:@"AVPlayerItemTimeJumpedReasonKey"];
          }
          uint64_t v133 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemTimeJumpedNotification" object:*(void *)(a1 + 32) userInfo:v120];
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v133);
        }
        v134 = *(const void **)(a1 + 64);
        if (!v134) {
          goto LABEL_51;
        }
        CFTypeID v135 = CFGetTypeID(v134);
        if (v135 != CFDictionaryGetTypeID()) {
          goto LABEL_51;
        }
        CFNumberRef v136 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E4F33830]);
        if (!v136) {
          goto LABEL_51;
        }
        CFNumberRef v137 = v136;
        CFTypeID v138 = CFGetTypeID(v136);
        if (v138 != CFNumberGetTypeID()) {
          goto LABEL_51;
        }
        LODWORD(valuePtr.value) = 0;
        CFNumberGetValue(v137, kCFNumberSInt32Type, &valuePtr);
        v130 = *(void **)(a1 + 32);
        uint64_t value_low = LODWORD(valuePtr.value);
        uint64_t v132 = 1;
      }
      else
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33680]))
        {
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335C8]))
          {
            [*(id *)(a1 + 40) _setFigPlaybackItemToMakeCurrent:*(void *)(a1 + 72)];
            uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
            uint64_t v91 = *(void *)(a1 + 32);
            int v92 = @"AVPlayerItemBecameCurrentNotification";
            goto LABEL_112;
          }
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335D0]))
          {
            uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
            uint64_t v91 = *(void *)(a1 + 32);
            int v92 = @"AVPlayerItemStoppedBeingCurrentNotification";
            goto LABEL_112;
          }
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335D8]))
          {
            [*(id *)(a1 + 32) _removeInterstitialEventCollector];
            uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
            uint64_t v91 = *(void *)(a1 + 32);
            int v92 = @"AVPlayerItemWasRemovedFromPlayQueueNotification";
            goto LABEL_112;
          }
          if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33550]))
          {
            [*(id *)(a1 + 32) _updateCanPlayAndCanStepPropertiesWhenReadyToPlayWithNotificationPayload:*(void *)(a1 + 64) updateStatusToReadyToPlay:0];
            uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
            uint64_t v91 = *(void *)(a1 + 32);
            int v92 = @"AVPlayerItemVariantChangedNotification";
            goto LABEL_112;
          }
          if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33560]))
          {
            if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33580]))
            {
              uint64_t v139 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33750]];
              if (!v139) {
                uint64_t v139 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isNonForcedSubtitleDisplayEnabled"));
              }
              [*(id *)(a1 + 32) willChangeValueForKey:@"nonForcedSubtitleDisplayEnabled"];
              uint64_t v140 = *(void *)(a1 + 32);
              char v141 = *(NSObject **)(*(void *)(v140 + 8) + 16);
              v162[0] = MEMORY[0x1E4F143A8];
              v162[1] = 3221225472;
              v162[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_24;
              v162[3] = &unk_1E57B2098;
              v162[4] = v140;
              v162[5] = v139;
              av_readwrite_dispatch_queue_write(v141, v162);
              [*(id *)(a1 + 40) _noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:*(void *)(a1 + 32)];
              [*(id *)(a1 + 32) didChangeValueForKey:@"nonForcedSubtitleDisplayEnabled"];
              uint64_t v142 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemNonForcedSubtitleDisplayEnabledDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v142);
            }
            else
            {
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33660]))
              {
                uint64_t v144 = *(void *)(a1 + 32);
                v103 = *(NSObject **)(*(void *)(v144 + 8) + 40);
                v161[0] = MEMORY[0x1E4F143A8];
                v161[1] = 3221225472;
                v161[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_25;
                v161[3] = &unk_1E57B2098;
                uint64_t v145 = *(void *)(a1 + 48);
                v161[4] = v144;
                v161[5] = v145;
                v104 = v161;
LABEL_122:
                dispatch_async(v103, v104);
                goto LABEL_51;
              }
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335B8]))
              {
                uint64_t v146 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F337C0]];
                if (!v146) {
                  uint64_t v146 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_hasEnabledAudio"));
                }
                char v96 = @"hasEnabledAudio";
                [*(id *)(a1 + 32) willChangeValueForKey:@"hasEnabledAudio"];
                uint64_t v147 = *(void *)(a1 + 32);
                v98 = *(NSObject **)(*(void *)(v147 + 8) + 16);
                v160[0] = MEMORY[0x1E4F143A8];
                v160[1] = 3221225472;
                v160[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_28;
                v160[3] = &unk_1E57B2098;
                v160[4] = v147;
                v160[5] = v146;
                uint64_t v99 = v160;
                goto LABEL_116;
              }
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335C0]))
              {
                uint64_t v148 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F337C8]];
                if (!v148) {
                  uint64_t v148 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_hasEnabledVideo"));
                }
                char v96 = @"hasEnabledVideo";
                [*(id *)(a1 + 32) willChangeValueForKey:@"hasEnabledVideo"];
                uint64_t v149 = *(void *)(a1 + 32);
                v98 = *(NSObject **)(*(void *)(v149 + 8) + 16);
                v159[0] = MEMORY[0x1E4F143A8];
                v159[1] = 3221225472;
                v159[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_29;
                v159[3] = &unk_1E57B2098;
                v159[4] = v149;
                v159[5] = v148;
                uint64_t v99 = v159;
                goto LABEL_116;
              }
              if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F335B0]))
              {
                uint64_t v58 = @"hasVideo";
                [*(id *)(a1 + 32) willChangeValueForKey:@"hasVideo"];
                uint64_t v150 = *(void *)(a1 + 32);
                id v60 = *(NSObject **)(*(void *)(v150 + 8) + 16);
                v158[0] = MEMORY[0x1E4F143A8];
                v158[1] = 3221225472;
                v158[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_30;
                v158[3] = &unk_1E57B1E80;
                v158[4] = v150;
                uint64_t v61 = v158;
                goto LABEL_87;
              }
              if (!CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33690]))
              {
                if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33698]))
                {
                  uint64_t v151 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33810]];
                  uint64_t v152 = MEMORY[0x1E4F1CC28];
                  if (v151) {
                    uint64_t v152 = v151;
                  }
                  uint64_t v153 = *(void *)(a1 + 32);
                  v154 = *(NSObject **)(*(void *)(v153 + 8) + 16);
                  v157[0] = MEMORY[0x1E4F143A8];
                  v157[1] = 3221225472;
                  v157[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_31;
                  v157[3] = &unk_1E57B2098;
                  v157[4] = v153;
                  v157[5] = v152;
                  av_readwrite_dispatch_queue_write(v154, v157);
                  uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
                  uint64_t v91 = *(void *)(a1 + 32);
                  int v92 = @"AVPlayerItemSpatialAudioRenderingDidChangeNotification";
                }
                else
                {
                  if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33548]))
                  {
                    [*(id *)(a1 + 32) _updateAllowedAudioSpatializationFormatsFromFigItem];
                    goto LABEL_51;
                  }
                  if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33630]))
                  {
                    uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
                    uint64_t v91 = *(void *)(a1 + 32);
                    int v92 = @"AVPlayerItemReachedTimeToPauseBufferingNotification";
                  }
                  else
                  {
                    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33638]))
                    {
                      uint64_t v155 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F337B0]];
                      uint64_t v93 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v155, @"AVPlayerItemTimeToPausePlaybackKey", 0);
                      uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
                      uint64_t v91 = *(void *)(a1 + 32);
                      int v92 = @"AVPlayerItemReachedTimeToPausePlaybackNotification";
                      goto LABEL_113;
                    }
                    if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F33618]))
                    {
                      uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
                      uint64_t v91 = *(void *)(a1 + 32);
                      int v92 = @"AVPlayerItemOverlappedPlaybackWillBeginNotification";
                    }
                    else
                    {
                      if (!CFEqual(*(CFTypeRef *)(a1 + 56), @"OverlappedPlaybackItemDidComplete"))
                      {
                        if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F34058]))
                        {
                          uint64_t v156 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F34440]];
                          [*(id *)(a1 + 32) _changeStatusToFailedWithError:AVLocalizedError(@"AVFoundationErrorDomain", -11912, 0)];
                          AVMediaStatePurgePostMediaStateWasPurgedNotificationForObject(*(void *)(a1 + 32), v156);
                        }
                        else if (CFEqual(*(CFTypeRef *)(a1 + 56), (CFTypeRef)*MEMORY[0x1E4F21770]))
                        {
                          [*(id *)(a1 + 32) _changeStatusToFailedWithError:AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0)];
                        }
                        goto LABEL_51;
                      }
                      uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
                      uint64_t v91 = *(void *)(a1 + 32);
                      int v92 = @"AVPlayerItemOverlappedPlaybackDidCompleteNotification";
                    }
                  }
                }
LABEL_112:
                uint64_t v93 = 0;
LABEL_113:
                uint64_t v94 = [v90 notificationWithName:v92 object:v91 userInfo:v93];
                uint64_t v14 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
                uint64_t v13 = v94;
                goto LABEL_17;
              }
            }
          }
          uint64_t v143 = [*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33778]];
          if (v143) {
            objc_msgSend(*(id *)(a1 + 32), "_setCurrentMediaSelection:", objc_msgSend(*(id *)(a1 + 32), "_currentMediaSelectionFromFigSelectedMediaArray:", v143));
          }
          goto LABEL_51;
        }
        v125 = *(const void **)(a1 + 64);
        if (!v125) {
          goto LABEL_51;
        }
        CFTypeID v126 = CFGetTypeID(v125);
        if (v126 != CFDictionaryGetTypeID()) {
          goto LABEL_51;
        }
        CFNumberRef v127 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E4F33830]);
        if (!v127) {
          goto LABEL_51;
        }
        CFNumberRef v128 = v127;
        CFTypeID v129 = CFGetTypeID(v127);
        if (v129 != CFNumberGetTypeID()) {
          goto LABEL_51;
        }
        LODWORD(valuePtr.value) = 0;
        CFNumberGetValue(v128, kCFNumberSInt32Type, &valuePtr);
        v130 = *(void **)(a1 + 32);
        uint64_t value_low = LODWORD(valuePtr.value);
        uint64_t v132 = 0;
      }
      [v130 _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:value_low finished:v132];
      goto LABEL_51;
    }
    uint64_t v116 = *(void **)(a1 + 32);
    if (v116)
    {
      [v116 loopTimeRange];
      uint64_t v91 = *(void *)(a1 + 32);
      if (BYTE12(v172))
      {
        if (v91)
        {
          [*(id *)(a1 + 32) loopTimeRange];
          uint64_t v91 = *(void *)(a1 + 32);
          if (BYTE4(v171))
          {
            if (!v91)
            {
              long long v167 = 0u;
              long long v168 = 0u;
              long long v166 = 0u;
              goto LABEL_179;
            }
            [*(id *)(a1 + 32) loopTimeRange];
            uint64_t v91 = *(void *)(a1 + 32);
            if (!*((void *)&v168 + 1))
            {
              if (v91)
              {
                [*(id *)(a1 + 32) loopTimeRange];
                if ((*((void *)&v164 + 1) & 0x8000000000000000) == 0) {
                  goto LABEL_51;
                }
                uint64_t v91 = *(void *)(a1 + 32);
                goto LABEL_167;
              }
LABEL_179:
              long long v164 = 0u;
              long long v165 = 0u;
              long long v163 = 0u;
              goto LABEL_51;
            }
          }
        }
        else
        {
          long long v170 = 0u;
          long long v171 = 0u;
          long long v169 = 0u;
        }
      }
    }
    else
    {
      uint64_t v91 = 0;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v172 = 0u;
    }
LABEL_167:
    uint64_t v90 = (void *)MEMORY[0x1E4F28EA0];
    int v92 = @"AVPlayerItemTimeJumpedNotification";
    goto LABEL_112;
  }
  CMTime valuePtr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  char v3 = *(const void **)(a1 + 64);
  if (!v3 || (CFTypeID v4 = CFGetTypeID(v3), v4 != CFDictionaryGetTypeID()))
  {
LABEL_46:
    uint64_t v44 = *(void **)(a1 + 32);
    CMTime time1 = valuePtr;
    [v44 _respondToBecomingReadyForBasicInspectionWithDuration:&time1];
    goto LABEL_47;
  }
  uint64_t v5 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E4F337F0]);
  if (!v5)
  {
    CFDictionaryRef v40 = (const __CFDictionary *)[*(id *)(a1 + 64) objectForKey:*MEMORY[0x1E4F33758]];
    if (v40)
    {
      CMTimeMakeFromDictionary(&valuePtr, v40);
    }
    else
    {
      uint64_t v43 = *(void **)(a1 + 32);
      if (v43) {
        [v43 _duration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime valuePtr = time1;
    }
    goto LABEL_46;
  }
  id v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == CFArrayGetTypeID())
  {
    if ([v6 containsObject:*MEMORY[0x1E4F33A00]]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1416) = 1;
    }
    if ([v6 containsObject:*MEMORY[0x1E4F33920]]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1417) = 1;
    }
  }
LABEL_47:
  if ([*(id *)(a1 + 32) _isReadyForBasicInspection])
  {
    id v42 = *(void **)(a1 + 32);
    uint64_t v45 = v42[1];
    if (*(unsigned char *)(v45 + 1416))
    {
      if (*(unsigned char *)(v45 + 1417)) {
        goto LABEL_50;
      }
    }
  }
LABEL_51:
  uint64_t v46 = *(const void **)(a1 + 56);
  if (v46) {
    CFRelease(v46);
  }
  long long v47 = *(const void **)(a1 + 64);
  if (v47) {
    CFRelease(v47);
  }
  v48 = *(const void **)(a1 + 72);
  if (v48) {
    CFRelease(v48);
  }
}

void sub_194A987A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A9886C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A98A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A98FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194A99798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getDisplayScale_block_invoke()
{
  CFAllocatorRef v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v2 = v0;
    [v0 floatValue];
    *(double *)&sMaxDisplayScale = v1;
  }
}

void sub_194A99FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ensureSupportedFormatsChangedNotificationRegistered_block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  objc_opt_class();
  return CMNotificationCenterAddListener();
}

void sub_194A9A7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVPlayerItemVideoOutput_timebaseNotificationCallback(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  uint64_t v6 = *(void *)(a2 + 16);
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F1FA58]))
  {
    CFTypeID v7 = *(NSObject **)(v6 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __AVPlayerItemVideoOutput_timebaseNotificationCallback_block_invoke;
    v8[3] = &unk_1E57B2098;
    v8[4] = v6;
    v8[5] = a2;
    dispatch_sync(v7, v8);
  }
}

void sub_194A9C318(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDiscovererFactorySetFactoryForQueue(NSObject *a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_set_specific(a1, @"AVCurrentRouteDiscovererFactoryKey", v3, AVFigRouteDiscovererFactoryReleaseObject);
}

id _animationByTransformingValues(void *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (id)[a1 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 fromValue];
    uint64_t v5 = [v3 toValue];
    uint64_t v6 = [v3 byValue];
    if (v4) {
      objc_msgSend(v3, "setFromValue:", (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v4));
    }
    if (v5) {
      objc_msgSend(v3, "setToValue:", (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5));
    }
    if (v6) {
      objc_msgSend(v3, "setByValue:", (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v6));
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFTypeID v7 = (void *)[v3 values];
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v8);
              }
              objc_msgSend(v9, "addObject:", (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(*((void *)&v15 + 1) + 8 * v13++)));
            }
            while (v11 != v13);
            uint64_t v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v11);
        }
        [v3 setValues:v9];
      }
    }
  }
  return v3;
}

void sub_194A9E7BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194A9F010(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void *AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a1 sublayers];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v5, "addEntriesFromDictionary:", AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(*(void *)(*((void *)&v11 + 1) + 8 * v9), objc_msgSend(a2, "indexPathByAddingIndex:", objc_msgSend(v4, "indexOfObject:", *(void *)(*((void *)&v11 + 1) + 8 * v9)))));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v5 setObject:a1 forKey:a2];
      }
    }
  }
  return v5;
}

void sub_194A9F8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AA0798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AVPlayerLayerSortedIndexPathsForKeys_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 length];
  uint64_t v6 = [a3 length];
  unint64_t v7 = [a2 length];
  uint64_t v8 = v7;
  if (v5 == v6)
  {
    if (v7)
    {
      uint64_t v9 = 0;
      uint64_t v8 = 1;
      while (1)
      {
        unint64_t v10 = [a2 indexAtPosition:v9];
        if (v10 < [a3 indexAtPosition:v9]) {
          break;
        }
        unint64_t v11 = [a2 indexAtPosition:v9];
        if (v11 > [a3 indexAtPosition:v9]) {
          return v8;
        }
        if ([a2 length] <= (unint64_t)++v9) {
          return 0;
        }
      }
      return -1;
    }
  }
  else if (v7 < [a3 length])
  {
    return -1;
  }
  else
  {
    return 1;
  }
  return v8;
}

void _avplLoopingItemFailedToPlayToEndTimeNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  if (a4
    && objc_msgSend((id)objc_msgSend(a2, "loopingPlayerItems"), "indexOfObjectIdenticalTo:", a4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a2, "_changeStatusToFailedWithError:", objc_msgSend(a5, "objectForKey:", @"AVPlayerItemFailedToPlayToEndTimeErrorKey"));
    [a2 _turnOffLooping];
  }
}

void sub_194AA1520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AA1748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AA1B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CMTimeEpoch CMTimeHash(CMTime *a1)
{
  CMTimeFlags flags = a1->flags;
  if ((~flags & 5) == 0) {
    return 1;
  }
  if ((~flags & 9) == 0) {
    return 2;
  }
  if ((~flags & 0x11) == 0) {
    return 3;
  }
  if ((a1->flags & 0x1D) != 1) {
    return 0;
  }
  memset(&v4, 0, sizeof(v4));
  CMTime v3 = *a1;
  CMTimeConvertScale(&v4, &v3, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v4.epoch ^ v4.value;
}

void sub_194AA3BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AA3D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194AA4080(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t handleCaptionConversionWarning(uint64_t a1, void *a2)
{
  return 0;
}

void sub_194AA446C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AA45A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AAAA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AAAC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AAAE18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void chapterItem_handleFigChapterLoadingNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5)
{
  unint64_t v7 = (void *)MEMORY[0x199715AE0]();
  int v8 = FigCFEqual();
  if (!v8 && !FigCFEqual())
  {
    if (!FigCFEqual()) {
      goto LABEL_24;
    }
    uint64_t v27 = a2;
    uint64_t v28 = 268435459;
    goto LABEL_23;
  }
  if (a5)
  {
    CFTypeID v9 = CFGetTypeID(a5);
    if (v9 == CFDictionaryGetTypeID())
    {
      unint64_t v10 = (const void *)*MEMORY[0x1E4F32160];
      unint64_t v11 = (const void *)*MEMORY[0x1E4F32148];
      Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F32158]);
      long long v13 = CFDictionaryGetValue((CFDictionaryRef)a5, v10);
      long long v14 = CFDictionaryGetValue((CFDictionaryRef)a5, v11);
      if (Value)
      {
        long long v15 = v14;
        CFTypeID v16 = CFGetTypeID(Value);
        if (v16 == CFNumberGetTypeID() && v13 != 0)
        {
          CFTypeID v18 = CFGetTypeID(v13);
          if (v18 == CFNumberGetTypeID())
          {
            if (v15)
            {
              CFTypeID v19 = CFGetTypeID(v15);
              if (v19 == CFNumberGetTypeID())
              {
                uint64_t v34 = 0;
                uint64_t valuePtr = 0;
                uint64_t v33 = 0;
                CFNumberGetValue((CFNumberRef)Value, kCFNumberLongType, &valuePtr);
                CFNumberGetValue((CFNumberRef)v13, kCFNumberLongType, &v34);
                CFNumberGetValue((CFNumberRef)v15, kCFNumberLongType, &v33);
                uint64_t v20 = valuePtr;
                if (v20 == [a2 _chapterGroupIndex])
                {
                  uint64_t v21 = v34;
                  if (v21 == [a2 _chapterIndex] && v33 >= 1)
                  {
                    if (v8)
                    {
                      uint64_t v22 = (void *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F32150]);
                      if (v22)
                      {
                        uint64_t v23 = v22;
                        CFTypeID v24 = CFGetTypeID(v22);
                        CFTypeID TypeID = CFArrayGetTypeID();
                        uint64_t v26 = [v23 count];
                        if (v24 == TypeID)
                        {
                          if (v26)
                          {
                            objc_msgSend(a2, "_takeValueFrom:", objc_msgSend(v23, "objectAtIndex:", 0));
                            goto LABEL_24;
                          }
                        }
                      }
                      uint64_t v27 = a2;
                      uint64_t v28 = 0;
                    }
                    else
                    {
                      CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F32170]);
                      unsigned int v32 = 0;
                      if (v29 && (CFNumberRef v30 = v29, v31 = CFGetTypeID(v29), v31 == CFNumberGetTypeID()))
                      {
                        CFNumberGetValue(v30, kCFNumberSInt32Type, &v32);
                        uint64_t v28 = v32;
                      }
                      else
                      {
                        uint64_t v28 = 0;
                      }
                      uint64_t v27 = a2;
                    }
LABEL_23:
                    [v27 _setValueStatus:3 figErrorCode:v28];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_24:
}

void sub_194AAC1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AAC404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t initAVMetadataMakeMetadataObjectFromBoxedMetadata(uint64_t a1, uint64_t a2, long long *a3, long long *a4)
{
  if (AVFCaptureLibrary_sOnce != -1) {
    dispatch_once(&AVFCaptureLibrary_sOnce, &__block_literal_global_427);
  }
  softLinkAVMetadataMakeMetadataObjectFromBoxedMetadata = (uint64_t (*)())dlsym((void *)AVFCaptureLibrary_sLib, "AVMetadataMakeMetadataObjectFromBoxedMetadata");
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  long long v9 = *a4;
  uint64_t v10 = *((void *)a4 + 2);
  return ((uint64_t (*)(uint64_t, uint64_t, long long *, long long *))softLinkAVMetadataMakeMetadataObjectFromBoxedMetadata)(a1, a2, &v11, &v9);
}

uint64_t initAVMetadataMakeDependentSpecificationsForValue(uint64_t a1)
{
  if (AVFCaptureLibrary_sOnce != -1) {
    dispatch_once(&AVFCaptureLibrary_sOnce, &__block_literal_global_427);
  }
  id v2 = (uint64_t (*)())dlsym((void *)AVFCaptureLibrary_sLib, "AVMetadataMakeDependentSpecificationsForValue");
  softLinkAVMetadataMakeDependentSpecificationsForValue = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t __AVMetadataItemLoadValueFromURI_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a2
    && ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "scheme"), "isEqualToString:", @"http") & 1) == 0
     && !objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "scheme"), "isEqualToString:", @"https")
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     && [a3 statusCode] - 400 > 0xFFFFFF37))
  {
    if ([a3 MIMEType]) {
      uint64_t CoreMediaDataType = FigMetadataGetCoreMediaDataType();
    }
    else {
      uint64_t CoreMediaDataType = 0;
    }
    long long v11 = *(void **)(a1 + 32);
    return [v11 respondWithValue:a2 dataType:CoreMediaDataType];
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    return [v8 respondWithError:a4];
  }
}

uint64_t appendCaptionGroupToQueue(const __CFArray *a1, _OWORD *a2, void *a3)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  CFTypeRef cf = 0;
  CFIndex Count = CFArrayGetCount(a1);
  int v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
  uint64_t v9 = *MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    long long v11 = Mutable;
    uint64_t v27 = a2;
    context = v6;
    if (Count)
    {
      CFIndex v12 = 0;
      uint64_t v30 = *MEMORY[0x1E4F1FF40];
      keCGFloat y = (void *)*MEMORY[0x1E4F20130];
      do
      {
        ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(a1, v12);
        id v14 = (id)[a3 pairedAVCaptionForFigCaption:ValueAtIndex];
        if (!v14)
        {
          id v14 = +[AVCaption captionFromFigCaption:ValueAtIndex];
          if ([a3 validationDelegate])
          {
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
            uint64_t CMBaseObject = FigCaptionGetCMBaseObject();
            uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v16) {
              uint64_t v17 = v16;
            }
            else {
              uint64_t v17 = 0;
            }
            CFTypeID v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v17 + 48);
            if (!v18)
            {
              uint64_t v25 = 4294954514;
              goto LABEL_20;
            }
            uint64_t v19 = v18(CMBaseObject, v30, v9, &cf);
            if (v19)
            {
              uint64_t v25 = v19;
              goto LABEL_20;
            }
            if (cf)
            {
              Value = CFDictionaryGetValue((CFDictionaryRef)cf, key);
              if (Value)
              {
                uint64_t v21 = Value;
                uint64_t v22 = (void *)[a3 validationDelegate];
                if (v22) {
                  [v22 captionAdaptor:a3 didVendCaption:v14 skippingUnsupportedSourceSyntaxElements:v21];
                }
              }
            }
          }
        }
        objc_msgSend(v8, "addObject:", v14, v27);
        CFDictionaryAddValue(v11, ValueAtIndex, v14);
        ++v12;
      }
      while (Count != v12);
    }
    uint64_t v23 = [AVCaptionGroup alloc];
    long long v24 = v27[1];
    v31[0] = *v27;
    v31[1] = v24;
    v31[2] = v27[2];
    objc_msgSend(a3, "appendOutputCaptionGroup:", -[AVCaptionGroup initWithCaptions:timeRange:](v23, "initWithCaptions:timeRange:", v8, v31));
    [a3 setFigCaptionToAVCaptionMapping:v11];
    uint64_t v25 = 0;
LABEL_20:
    CFRelease(v11);
    uint64_t v6 = context;
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v25 = FigSignalErrorAt();
  }
  return v25;
}

void sub_194AAE220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_194AAE27C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AVAssetShouldPreferNominalDurations(void *a1, uint64_t a2)
{
  id v2 = (void *)[a1 objectForKey:a2];
  if (!v2) {
    return dyld_program_sdk_at_least() ^ 1;
  }
  return [v2 BOOLValue];
}

uint64_t figAssetCreationFlagsForAssetReferenceRestrictionsAsNumber(void *a1)
{
  if (a1) {
    return 4 * ([a1 unsignedIntegerValue] & 0xF);
  }
  else {
    return 8;
  }
}

void sub_194AB3C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t figAssetCreationFlagsForAssetReferenceRestrictions(char a1)
{
  return 4 * (a1 & 0xF);
}

uint64_t figAssetDefaultCreationFlags()
{
  return 8;
}

void avasset_formatsChangedNotificationCallback()
{
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  MEMORY[0x199714DD0](getTypeAccessMutex_sTypeAccessMutex);

  gUTTypes = 0;
  gFileUTTypes = 0;

  gStreamingUTTypes = 0;
  gFigMIMETypes = 0;
  if (getTypeAccessMutex_onceToken != -1) {
    dispatch_once(&getTypeAccessMutex_onceToken, &__block_literal_global_1043);
  }
  JUMPOUT(0x199714DF0);
}

void aig_didGenerateCGImage(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = (void *)MEMORY[0x199715AE0]();
  [a2 _didGenerateCGImage:a5];
}

void aig_failedToGenerateCGImage(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7 = (void *)MEMORY[0x199715AE0]();
  [a2 _failedToGenerateCGImage:a5];
}

void aig_serverDied(uint64_t a1, void *a2)
{
  CMTime v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _serverDied];
}

void sub_194AB8464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void assetTrackNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  int v8 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F32468]))
  {
    uint64_t v9 = (void *)[a5 objectForKey:*MEMORY[0x1E4F32168]];
    if ([v9 isEqualToString:*MEMORY[0x1E4F348F8]])
    {
      if (![(id)objc_opt_class() expectsPropertyRevisedNotifications]) {
        goto LABEL_18;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F28EA0];
      long long v11 = @"AVAssetTrackTimeRangeDidChangeNotification";
      goto LABEL_17;
    }
    if (([v9 isEqualToString:*MEMORY[0x1E4F32478]] & 1) != 0
      || [v9 isEqualToString:*MEMORY[0x1E4F324B8]])
    {
      if ([(id)objc_opt_class() expectsPropertyRevisedNotifications])
      {
        uint64_t v12 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVAssetTrackSegmentsDidChangeNotification" object:a2 userInfo:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v12);
      }
      if (objc_msgSend((id)objc_msgSend(a2, "asset"), "_needsLegacyChangeNotifications"))
      {
        uint64_t v13 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVFragmentedMovieTrackTimeRangeDidChangeNotification" object:a2 userInfo:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v13);
        uint64_t v10 = (void *)MEMORY[0x1E4F28EA0];
        long long v11 = @"AVFragmentedMovieTrackSegmentsDidChangeNotification";
LABEL_17:
        uint64_t v14 = [v10 notificationWithName:v11 object:a2 userInfo:0];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v14);
      }
    }
    else
    {
      if ([v9 isEqualToString:*MEMORY[0x1E4F324D8]])
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28EA0];
        long long v11 = @"AVAssetTrackTrackAssociationsDidChangeNotification";
        goto LABEL_17;
      }
      if (([v9 isEqualToString:*MEMORY[0x1E4F324C8]] & 1) != 0
        || ([v9 isEqualToString:*MEMORY[0x1E4F324D0]] & 1) != 0
        || [v9 isEqualToString:*MEMORY[0x1E4F32498]])
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28EA0];
        long long v11 = @"AVAssetTrackMetadataDidChangeNotification";
        goto LABEL_17;
      }
    }
  }
LABEL_18:
}

AVCaptionDimension AVCaptionDimensionMake(CGFloat value, AVCaptionUnitsType units)
{
  result.units = units;
  result.CMTimeValue value = value;
  return result;
}

AVCaptionPoint *__cdecl AVCaptionPointMake(AVCaptionPoint *__return_ptr retstr, AVCaptionDimension x, AVCaptionDimension y)
{
  retstr->CGFloat x = x;
  retstr->CGFloat y = y;
  return *(AVCaptionPoint **)&x.value;
}

AVCaptionSize *__cdecl AVCaptionSizeMake(AVCaptionSize *__return_ptr retstr, AVCaptionDimension width, AVCaptionDimension height)
{
  retstr->CGFloat width = width;
  retstr->CGFloat height = height;
  return *(AVCaptionSize **)&width.value;
}

uint64_t _convertFigGeometryDimensionToAVCaptionDimension(uint64_t a1, uint64_t a2)
{
  if (a2 == 2 || a2 == 1) {
    return FigGeometryDimensionMake();
  }
  else {
    return *MEMORY[0x1E4F216B0];
  }
}

void avplayer_iapdNotificationCallback(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v4 = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a2);
  if (v4)
  {
    uint64_t v5 = v4;
    if (a3) {
      CFRetain(a3);
    }
    char v6 = [(id)objc_opt_class() isIAPDExtendedModeActive];
    if (AVPlayerInitializeIAPD_onceToken != -1) {
      dispatch_once(&AVPlayerInitializeIAPD_onceToken, &__block_literal_global_1270);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AVPlayerSetCachedIAPDModeActive_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v10 = v6;
    av_readwrite_dispatch_queue_write((dispatch_queue_t)sAVPlayerIAPDReadWriteQueue, block);
    unint64_t v7 = *(NSObject **)(*(void *)(v5 + 8) + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __avplayer_iapdNotificationCallback_block_invoke;
    v8[3] = &unk_1E57B2228;
    v8[4] = v5;
    v8[5] = a3;
    dispatch_async(v7, v8);
  }
}

void sub_194AC4140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC46F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVPlayerFindItemMatchingFigPlaybackItem(void *a1, const void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a1);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 _copyFigPlaybackItem];
        if ((const void *)v12 == a2)
        {
          if (a2) {
            CFRelease(a2);
          }
          if (a3 && v11) {
            *a3 = v6;
          }
          return v11;
        }
        uint64_t v13 = (const void *)v12;
        [v6 addObject:v11];
        if (v13) {
          CFRelease(v13);
        }
      }
      uint64_t v8 = [a1 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  return 0;
}

uint64_t FigPlayerCopyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  char v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10) {
    return 4294954514;
  }
  return v10(FigBaseObject, a2, a3, a4);
}

void sub_194AC6484(_Unwind_Exception *a1)
{
}

void sub_194AC74CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC7ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC8050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC83BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC867C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194AC9170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC9828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AC9DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACA48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACA914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACAD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACB02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACB8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACBA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACBD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACC154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACC89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACCD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACD234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194ACD4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194ACDF8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194ACE6EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void avplayer_fpInterstitialCoordinatorNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a2 _nameForLogging];
  if (a3) {
    CFRetain(a3);
  }
  if (a5) {
    CFRetain(a5);
  }
  char v10 = *(NSObject **)(a2[1] + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke;
  v11[3] = &unk_1E57B3CD0;
  v11[4] = a2;
  v11[5] = v9;
  v11[6] = a3;
  v11[7] = a5;
  dispatch_async(v10, v11);
}

void sub_194ACF25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACF370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t avplayer_displayModeChanged()
{
  return +[AVPlayer checkForAvailableHDRModesChanges];
}

uint64_t addToHDRModes(const __CFNumber *a1, void *a2)
{
  int valuePtr = 0;
  uint64_t result = CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr);
  if ((valuePtr - 2) <= 3) {
    *a2 |= qword_194C5FD48[valuePtr - 2];
  }
  return result;
}

void sub_194ACF674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACF9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ACFFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD030C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD0720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD15F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD1908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD1EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD20AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD2688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD29CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD2D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD314C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD37A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD3AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD3E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD4144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD4598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD4C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD51C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD5500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD560C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD5974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD5C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD5D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD60C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD61F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AD6668(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194AD6A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD6EB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194AD7224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194AD755C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD768C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AD798C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AD7C14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AD7E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x199715AE0]();
  char v3 = [*(id *)(a1 + 32) _hasCurrentInterstitialEvent];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_2;
  v14[3] = &unk_1E57B3C58;
  char v16 = v3;
  long long v15 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(v15 + 8) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_3;
  block[3] = &unk_1E57B3C80;
  void block[4] = v15;
  void block[5] = v14;
  void block[6] = &v21;
  void block[7] = &v17;
  av_readwrite_dispatch_queue_read(v4, block);
  if (*((unsigned char *)v22 + 24) || *((unsigned char *)v18 + 24))
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"timeControlStatus"];
    [*(id *)(a1 + 32) willChangeValueForKey:@"reasonForWaitingToPlay"];
    v10[0] = MEMORY[0x1E4F143A8];
    long long v5 = *(_OWORD *)(a1 + 32);
    char v6 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    v10[1] = 3221225472;
    v10[2] = __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_4;
    v10[3] = &unk_1E57B3CA8;
    uint64_t v12 = v14;
    long long v11 = v5;
    av_readwrite_dispatch_queue_write(v6, v10);
    [*(id *)(a1 + 32) didChangeValueForKey:@"timeControlStatus"];
    [*(id *)(a1 + 32) didChangeValueForKey:@"reasonForWaitingToPlay"];
  }
  else if (dword_1EB2D3AA0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = *(const void **)(a1 + 56);
  if (v8) {
    CFRelease(v8);
  }
}

void sub_194AD8B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 rateStateByUpdatingBasedOnFigPlayer:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728) hasCurrentItem:a3 hasCurrentInterstitialEvent:*(unsigned __int8 *)(a1 + 48) nameForLogging:*(void *)(a1 + 40)];
}

uint64_t __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_3(void *a1)
{
  id v2 = *(void **)(*(void *)(a1[4] + 8) + 488);
  uint64_t v3 = [v2 timeControlStatus];
  uint64_t v4 = (void *)[v2 reasonForWaitingToPlay];
  long long v5 = (void *)(*(uint64_t (**)(void, void *, BOOL))(a1[5] + 16))(a1[5], v2, *(void *)(*(void *)(a1[4] + 8) + 176) != 0);
  uint64_t v6 = [v5 timeControlStatus];
  uint64_t result = [v5 reasonForWaitingToPlay];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3 != v6;
  if (v4 == (void *)result)
  {
    char v8 = 0;
  }
  else
  {
    uint64_t result = [v4 isEqual:result];
    char v8 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v8;
  return result;
}

void __avplayer_fpInterstitialCoordinatorNotificationCallback_block_invoke_4(uint64_t a1)
{
  id v2 = (void *)(*(uint64_t (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 488), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) != 0);
  if (dword_1EB2D3AA0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v4 = v2;

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48_Block_object_dispose(&STACK[0x420], 8) = v2;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 395) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 46_Block_object_dispose(&STACK[0x420], 8) = *(unsigned char *)(result + 40) != 0;
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 467) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 466) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 464) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_7(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 466) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 470) = *(unsigned char *)(result + 48);
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 472) = *(void *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_9(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 465) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_10(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 557) = *(unsigned char *)(result + 40) != 0;
  return result;
}

id __avplayer_fpNotificationCallback_block_invoke_11(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 560) = result;
  return result;
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = [v5 intValue];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    return [a2 rateStateByUpdatingBasedOnFigPlayerPlaybackState:v6 hasCurrentInterstitialEvent:v7 nameForLogging:v8];
  }
  else
  {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    return [a2 rateStateByUpdatingBasedOnFigPlayer:v12 hasCurrentItem:a3 hasCurrentInterstitialEvent:v11 nameForLogging:v13];
  }
}

uint64_t __avplayer_fpNotificationCallback_block_invoke_13(void *a1)
{
  id v2 = *(void **)(*(void *)(a1[4] + 8) + 488);
  uint64_t v3 = [v2 timeControlStatus];
  id v4 = (void *)[v2 reasonForWaitingToPlay];
  long long v5 = (void *)(*(uint64_t (**)(void, void *, BOOL))(a1[5] + 16))(a1[5], v2, *(void *)(*(void *)(a1[4] + 8) + 176) != 0);
  uint64_t v6 = [v5 timeControlStatus];
  uint64_t result = [v5 reasonForWaitingToPlay];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3 != v6;
  if (v4 == (void *)result)
  {
    char v8 = 0;
  }
  else
  {
    uint64_t result = [v4 isEqual:result];
    char v8 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v8;
  return result;
}

void __avplayer_fpNotificationCallback_block_invoke_14(uint64_t a1, double a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 488);
  if (*(unsigned char *)(a1 + 60))
  {
    LODWORD(a2) = *(_DWORD *)(a1 + 56);
    uint64_t v3 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 488) rateStateBySettingRate:*(void *)(a1 + 40) nameForLogging:a2];
  }
  if (*(unsigned char *)(a1 + 61)) {
    uint64_t v3 = (void *)(*(uint64_t (**)(void, void *, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) != 0);
  }
  if (*(unsigned char *)(a1 + 60) || *(unsigned char *)(a1 + 61))
  {
    if (dword_1EB2D3AA0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    id v5 = v3;

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48_Block_object_dispose(&STACK[0x420], 8) = v3;
  }
}

void __avplayer_iapdNotificationCallback_block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x199715AE0]();
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(void *)(v3[1] + 728) && objc_msgSend((id)objc_msgSend(v3, "_videoLayers"), "count"))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __avplayer_iapdNotificationCallback_block_invoke_2;
    v5[3] = &unk_1E57B1E80;
    v5[4] = *(void *)(a1 + 32);
    AVEnsureNotOnMainThread(v5);
  }
  id v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
}

void __avplayer_iapdNotificationCallback_block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _shouldDetachVideoLayersFromFigPlayer];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(*(void *)(v3 + 8) + 32);
  if (v2)
  {
    id v5 = v8;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    uint64_t v6 = __avplayer_iapdNotificationCallback_block_invoke_3;
  }
  else
  {
    id v5 = v7;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    uint64_t v6 = __avplayer_iapdNotificationCallback_block_invoke_4;
  }
  v5[2] = v6;
  v5[3] = &unk_1E57B1E80;
  v5[4] = v3;
  AVSerializeOnQueueAsyncIfNecessary(v4, v5);
}

uint64_t __avplayer_iapdNotificationCallback_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _detachVideoLayersFromFigPlayer:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728)];
}

uint64_t __avplayer_iapdNotificationCallback_block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attachVideoLayersToFigPlayer];
}

uint64_t __AVPlayerSetCachedIAPDModeActive_block_invoke(uint64_t result)
{
  sAVPlayerIAPDExtendedModeIsActive = *(unsigned char *)(result + 32);
  return result;
}

BOOL __AVPlayerInitializeIAPD_block_invoke()
{
  sAVPlayerIAPDReadWriteQueue = (uint64_t)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avplayer.iapd");
  BOOL result = +[AVPlayer isIAPDExtendedModeActive];
  sAVPlayerIAPDExtendedModeIsActive = result;
  return result;
}

uint64_t __AVPlayerGetCachedIAPDModeActive_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = sAVPlayerIAPDExtendedModeIsActive;
  return result;
}

uint64_t avplayer_interstitial_WrapperToPlayer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(*(void *)(a3 + 8) + 728);
}

id avplayer_interstitial_WrapperToPlayerItem(uint64_t a1, uint64_t a2, void *a3)
{
  if (![a3 _isFigItemConfigured]) {
    return 0;
  }
  id v4 = (void *)[a3 _copyFigPlaybackItem];
  return v4;
}

uint64_t avplayer_interstitial_WrapperToEvent(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 figEvent];
}

id avplayer_interstitial_WrapperToEventPrimaryItem(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)[a3 primaryItem];
  if (![v3 _isFigItemConfigured]) {
    return 0;
  }
  id v4 = (void *)[v3 _copyFigPlaybackItem];
  return v4;
}

uint64_t avplayer_interstitial_PlayerItemWrapperToFigAsset(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = (void *)[a3 asset];
  return [v3 _figAsset];
}

uint64_t avplayer_interstitial_CreateWrapEvent(uint64_t a1, uint64_t a2, uint64_t a3, const __CFArray *a4, void *a5)
{
  char v8 = (void *)FigPlayerInterstitialEventCopyPrimaryItem();
  uint64_t v9 = (void *)[v8 asset];
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = [v9 httpSessionIdentifier];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  CFArrayRef v12 = (const __CFArray *)FigPlayerInterstitialEventCopyInterstitialAssetURLs();
  if (a4 && CFArrayGetCount(a4) > 0 || (a4 = v12) != 0) {
    CFIndex Count = CFArrayGetCount(a4);
  }
  else {
    CFIndex Count = 0;
  }
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFTypeRef cf = 0;
  [v9 _figAsset];
  if (!v8)
  {
    uint64_t v20 = 4294951625;
    if (!v12) {
      return v20;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 setObject:v10 forKey:@"AVURLAssetPrimarySessionIdentifierKey"];
  }
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  long long v18 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v17 + 48);
  CFArrayRef v24 = v12;
  if (v18)
  {
    uint64_t v19 = a3;
    uint64_t v20 = v18(CMBaseObject, *MEMORY[0x1E4F32208], *MEMORY[0x1E4F1CF80], &cf);
    if (!v20 && cf)
    {
      [v11 setObject:cf forKey:0x1EE594DD8];
      if (cf) {
        CFRelease(cf);
      }
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v19 = a3;
    uint64_t v20 = 4294954514;
  }
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(a4, i);
      if (ValueAtIndex) {
        objc_msgSend(v14, "addObject:", +[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", +[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", ValueAtIndex, v11)));
      }
    }
  }
  *a5 = [[AVPlayerInterstitialEvent alloc] initWithPrimaryItemAndFigEvent:v8 templateItems:v14 figEvent:v19];
  CFRelease(v8);
  CFArrayRef v12 = v24;
  if (v24) {
LABEL_28:
  }
    CFRelease(v12);
  return v20;
}

uint64_t avplayer_interstitial_CreateAndEnqueueItems(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long *a9, uint64_t a10, __CFArray **a11)
{
  long long v15 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ((void *)[a2 _interstitialPlayerIfCreated] == a4)
  {
    if (a8) {
      [v15 setMultichannelAudioStrategy:a8];
    }
    theArraCGFloat y = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    uint64_t v17 = (void *)[a3 _internalTemplateItems];
    unsigned int v36 = [a3 _participatesInCoordinatedPlayback];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v17;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v21 = *(void *)v46;
      uint64_t v34 = a7;
      uint64_t v35 = a5;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(obj);
          }
          if (a10)
          {
            --a10;
            continue;
          }
          uint64_t v23 = v15;
          CFArrayRef v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v25 = (void *)[v24 asset];
          if (objc_opt_respondsToSelector()) {
            uint64_t v26 = (void *)[v25 creationOptions];
          }
          else {
            uint64_t v26 = 0;
          }
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "objectForKey:", @"AVURLAssetPrimarySessionIdentifierKey"), "UUIDString"), "isEqualToString:", a6))
          {
            if ([v25 conformsToProtocol:&unk_1EE5E92F0])
            {
              uint64_t v28 = (void *)[v25 contentKeySession];
              if (v26) {
                goto LABEL_18;
              }
LABEL_20:
              id v29 = (id)[MEMORY[0x1E4F1CA60] dictionary];
            }
            else
            {
              uint64_t v28 = 0;
              if (!v26) {
                goto LABEL_20;
              }
LABEL_18:
              id v29 = (id)[v26 mutableCopy];
            }
            id v30 = v29;
            long long v15 = v23;
            objc_msgSend(v29, "setValue:forKey:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", a6), @"AVURLAssetPrimarySessionIdentifierKey");
            id v31 = (id)[v24 copyWithZone:0 newAssetOptions:v30];
            id v27 = v31;
            if (v28) {
              objc_msgSend(v28, "addContentKeyRecipient:", objc_msgSend(v31, "asset"));
            }
            a7 = v34;
            a5 = v35;
            goto LABEL_24;
          }
          id v27 = (id)[v24 copy];
          long long v15 = v23;
LABEL_24:
          [v27 setAutomaticallyHandlesInterstitialEvents:0];
          [v27 _setTemplatePlayerItem:v24];
          [v27 _setInterstitialEventID:a5];
          [v27 _setCoordinatorIdentifier:a7];
          [v27 _setParticipatesInCoordinatedPlayback:v36];
          CFArrayAppendValue(theArray, v27);
          if (*((unsigned char *)a9 + 12))
          {
            long long v43 = *a9;
            uint64_t v44 = *((void *)a9 + 2);
            long long v41 = *MEMORY[0x1E4F1FA48];
            uint64_t v42 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            long long v39 = v41;
            uint64_t v40 = v42;
            [v27 seekToTime:&v43 toleranceBefore:&v41 toleranceAfter:&v39 completionHandler:0];
            uint64_t v32 = MEMORY[0x1E4F1F9F8];
            *a9 = *MEMORY[0x1E4F1F9F8];
            *((void *)a9 + 2) = *(void *)(v32 + 16);
          }
          [v15 insertItem:v27 afterItem:0];
          a10 = 0;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v19);
    }
    *a11 = theArray;
  }
  return 0;
}

uint64_t avplayer_interstitial_DequeueItem(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if ((void *)[a2 _interstitialPlayerIfCreated] == a4) {
    [a4 removeItem:a3];
  }
  return 0;
}

uint64_t avplayer_interstitial_ShowInterstitialInstead(double a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = (void *)[a3 _avPlayerLayers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    LOBYTE(v11) = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v13 _setShowInterstitialInstead:a4 != 0 afterDelay:a1];
        if (v11) {
          uint64_t v11 = [v13 _showInterstitialInstead];
        }
        else {
          uint64_t v11 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v11 = 1;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = objc_msgSend(a3, "_playerCaptionLayers", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * j) _setShowInterstitialInstead:a4 != 0];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
  return v11;
}

uint64_t avplayer_playbackcoordinator_SetPlaybackCoordinatorInterstitialActive(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (void *)[a2 _playbackCoordinatorWithoutTriggeringFullSetup];
  if (v4) {
    [v4 _setInterstitialActive:a3];
  }
  return 0;
}

void sub_194ADA280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADAAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADAC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADAE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADB170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADBA28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void avplayerinterstitialeventmonitor_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33F50]))
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = (void *)MEMORY[0x1E4F28EA0];
    uint64_t v11 = @"EventsDidChangeNotification";
LABEL_5:
    uint64_t v12 = [v10 notificationWithName:v11 object:a2];
    uint64_t v13 = (void *)v9;
LABEL_6:
    [v13 postNotification:v12];
    goto LABEL_7;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33F48]))
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = (void *)MEMORY[0x1E4F28EA0];
    uint64_t v11 = @"CurrentEventDidChangeNotification";
    goto LABEL_5;
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33F58]))
  {
    if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33F28])) {
      goto LABEL_7;
    }
    uint64_t v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    id v16 = (id)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F33F38]), "copy");
    [v16 setImmutable];
    int v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F33F40]), "intValue");
    [v15 setObject:v16 forKey:@"AssetListResponseStatusDidChangeEventKey"];
    if (v17 == 2)
    {
      uint64_t v19 = [a5 objectForKey:*MEMORY[0x1E4F33F30]];
      [v15 setObject:&unk_1EE5E1800 forKey:@"AssetListResponseStatusDidChangeStatusKey"];
      long long v20 = @"AssetListResponseStatusDidChangeErrorKey";
      long long v21 = v15;
      uint64_t v18 = (void *)v19;
    }
    else
    {
      if (v17 == 1)
      {
        uint64_t v18 = &unk_1EE5E17E8;
      }
      else
      {
        if (v17)
        {
LABEL_22:
          uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v12 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AssetListResponseStatusDidChangeNotification" object:a2 userInfo:v15];
          uint64_t v13 = (void *)v22;
          goto LABEL_6;
        }
        uint64_t v18 = &unk_1EE5E17D0;
      }
      long long v20 = @"AssetListResponseStatusDidChangeStatusKey";
      long long v21 = v15;
    }
    [v21 setObject:v18 forKey:v20];
    goto LABEL_22;
  }
  uint64_t v14 = [a5 objectForKey:*MEMORY[0x1E4F33F20]];
  [a2 _removeMonitorListeners];
  if (v14) {
    [a2 _addMonitorListeners:v14];
  }
LABEL_7:
}

void sub_194ADD5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADDA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADDD20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194ADE058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADE1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a5 objectForKey:*MEMORY[0x1E4F337D0]];
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)[a5 objectForKey:*MEMORY[0x1E4F337B0]]);
  uint64_t v10 = [a5 objectForKey:*MEMORY[0x1E4F337D8]];
  uint64_t v11 = [a5 objectForKey:*MEMORY[0x1E4F337E0]];
  CMTime v12 = v13;
  [a2 _figPlaybackItem:a4 didOutputAttributedStrings:v9 nativeSampleBuffers:v11 atItemTime:&v12 withLegibleOutputsDictionaryKey:v10];
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemLegibleOutputWasFlushed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_figPlaybackItem:didFlushLegibleOutputWithDictionaryKey:", a4, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F337D8]));
}

void AVFigPlaybackItemNotificationCallback_MetadataOutputChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a5 objectForKey:*MEMORY[0x1E4F337E8]];
  uint64_t v10 = [a5 objectForKey:*MEMORY[0x1E4F33828]];
  objc_msgSend(a2, "_figPlaybackItem:didOutputSampleBuffers:fromTrackWithID:forMetadataOutputWithDictionaryKey:", a4, v10, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F33840]), "unsignedIntValue"), v9);
}

void AVFigPlaybackItemNotificationCallback_MetadataOutputWasFlushed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_figPlaybackItem:didFlushMetadataOutputWithDictionaryKey:", a4, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F337E8]));
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  uint64_t v8 = (void *)[a5 objectForKey:*MEMORY[0x1E4F33800]];
  uint64_t v9 = (void *)[a5 objectForKey:*MEMORY[0x1E4F33808]];
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeFromDictionary(&v19, (CFDictionaryRef)[a5 objectForKey:*MEMORY[0x1E4F337B0]]);
  uint64_t v10 = [a5 objectForKey:*MEMORY[0x1E4F337F8]];
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    unint64_t v12 = 0;
    CMTime v13 = (CGPoint *)MEMORY[0x1E4F1DAD8];
    do
    {
      point.CGFloat x = 0.0;
      point.CGFloat y = 0.0;
      if (v9 && [v9 count]) {
        CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)[v9 objectAtIndexedSubscript:v12], &point);
      }
      else {
        CGPoint point = *v13;
      }
      uint64_t v14 = [AVRenderedCaptionImage alloc];
      uint64_t v15 = [v8 objectAtIndexedSubscript:v12];
      objc_msgSend(v11, "addObject:", -[AVRenderedCaptionImage initWithPixelBuffer:atPosition:](v14, "initWithPixelBuffer:atPosition:", v15, point.x, point.y));
      ++v12;
    }
    while (v12 < [v8 count]);
  }
  CGPoint point = *(CGPoint *)&v19.value;
  CMTimeEpoch epoch = v19.epoch;
  [a2 _figPlaybackItem:a4 didOutputRenderedCaptionImages:v11 atItemTime:&point withRenderedLegibleOutputsDictionaryKey:v10];
}

void AVFigPlaybackItemNotificationCallback_FigPlaybackItemRenderedLegibleOutputWasFlushed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_figPlaybackItem:didFlushRenderedLegibleOutputWithDictionaryKey:", a4, objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F337F8]));
}

void cmTimebaseNotificationCallback_TimeJumped(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  uint64_t v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemTimeJumpedNotification" object:a2 userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v4);
}

void sub_194ADF454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADF66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADF8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADF998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADFA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADFC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194ADFD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE0348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE0630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE0820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE1E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE21C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE24DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE27F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE2B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE2E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE3138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE3BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE4824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE4B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE4DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE5118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE5468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE5A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE6A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194AE7AD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AE7D58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AE80A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE832C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE88A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE89AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE8BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE8CF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AE9280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE95C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE98DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE99EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AE9B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEA848(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AEAC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_194AEB154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194AEB840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEB920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEBA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEBC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AED968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEDB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEDEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEDF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEE40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AEEA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF0AC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194AF0D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF0EC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194AF155C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF1AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF1CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF1EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF2298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF24F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF32F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 996) = result;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v2 = *(_OWORD *)(a1 + 40);
  *(void *)(v1 + 480) = *(void *)(a1 + 56);
  *(_OWORD *)(v1 + 464) = v2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 64);
  *(void *)(v3 + 456) = *(void *)(a1 + 80);
  *(__n128 *)(v3 + 440) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_9(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 994) = 1;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_10(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 994) = 0;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_11(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 992) = 1;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_12(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 993) = 1;
  return result;
}

void *__avplayeritem_fpItemNotificationCallback_block_invoke_13(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1016) = [*(id *)(a1 + 40) copy];
  __n128 result = *(void **)(a1 + 48);
  if (result)
  {
    __n128 result = (void *)[result doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1024) = v3;
  }
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_14(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 993) = 0;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_15(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 992) = 0;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_16(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1032) = result;
  return result;
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_17(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 976) = result;
  return result;
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_18(void *a1)
{
  long long v2 = (void *)MEMORY[0x199715AE0]();
  uint64_t v4 = a1[4];
  uint64_t v3 = (void *)a1[5];
  if (v4) {
    uint64_t v5 = [v3 _tracksWithFPTrackIDArray:v4 fromFigPlaybackItem:*(void *)(v3[1] + 120)];
  }
  else {
    uint64_t v5 = [v3 _tracks];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_19;
  block[3] = &unk_1E57B2138;
  uint64_t v6 = a1[6];
  void block[4] = a1[5];
  void block[5] = v5;
  void block[6] = a1[7];
  dispatch_async(v6, block);
  uint64_t v7 = a1[6];
  if (v7) {
    dispatch_release(v7);
  }
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_19(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x199715AE0]();
  [*(id *)(a1 + 32) willChangeValueForKey:@"tracks"];
  block[0] = MEMORY[0x1E4F143A8];
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  block[1] = 3221225472;
  block[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_20;
  block[3] = &unk_1E57B2138;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 48);
  av_readwrite_dispatch_queue_write(v4, block);
  [*(id *)(a1 + 32) didChangeValueForKey:@"tracks"];
  uint64_t v5 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerItemTracksDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v5);
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_20(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 144) = [*(id *)(a1 + 40) copy];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 1384);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 1384) = [*(id *)(a1 + 48) copy];
}

__n128 __avplayeritem_fpItemNotificationCallback_block_invoke_21(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = *(__n128 *)(a1 + 40);
  *(void *)(v1 + 504) = *(void *)(a1 + 56);
  *(__n128 *)(v1 + 48_Block_object_dispose(&STACK[0x420], 8) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_22(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1000) = 1;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_23(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 1000) = 0;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_24(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 996) = result;
  return result;
}

void __avplayeritem_fpItemNotificationCallback_block_invoke_25(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _isExternalProtectionRequiredForPlaybackInternal];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_26;
  v4[3] = &unk_1E57B2098;
  long long v3 = *(NSObject **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  dispatch_async(v3, v4);
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_26(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"_externalProtectionRequiredForPlayback"];
  v5[0] = MEMORY[0x1E4F143A8];
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  v5[1] = 3221225472;
  v5[2] = __avplayeritem_fpItemNotificationCallback_block_invoke_27;
  v5[3] = &unk_1E57B2098;
  long long v6 = v2;
  av_readwrite_dispatch_queue_write(v3, v5);
  return [*(id *)(a1 + 32) didChangeValueForKey:@"_externalProtectionRequiredForPlayback"];
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_27(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1001) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_28(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 999) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_29(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 997) = result;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_30(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 99_Block_object_dispose(&STACK[0x420], 8) = 1;
  return result;
}

uint64_t __avplayeritem_fpItemNotificationCallback_block_invoke_31(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 1120) = result;
  return result;
}

void sub_194AF4210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194AF48A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF5718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF6A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194AF6DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AVCompositionTrackSegmentInternal *AVCompositionTrackSegmentCreateIvars(void *a1, int a2)
{
  uint64_t v4 = objc_alloc_init(AVCompositionTrackSegmentInternal);
  if (v4)
  {
    v4->editAssetURL = (NSURL *)[a1 copy];
    v4->editAssetTrackID = a2;
    CFRetain(v4);
  }
  return v4;
}

void AVAssetReaderHandleServerDiedNotification(uint64_t a1, void *a2)
{
  long long v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _handleServerDiedNotification];
}

void sub_194B02EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B03058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194B03248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figAssetReaderSampleBufferDidBecomeAvailable(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  long long v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_figAssetReaderSampleBufferDidBecomeAvailableForExtractionID:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F32390]), "integerValue"));
}

void figAssetReaderDecodeError(uint64_t a1, void *a2)
{
  long long v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _figAssetReaderDecodeError];
}

void figAssetReaderFailed(uint64_t a1, void *a2)
{
  long long v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _figAssetReaderFailed];
}

void figAssetReaderServerConnectionDied(uint64_t a1, void *a2)
{
  long long v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _figAssetReaderServerConnectionDied];
}

uint64_t AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(void *a1)
{
  if ([a1 isEqualToString:@"Spectral"])
  {
    uint64_t v2 = MEMORY[0x1E4F323E8];
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"TimeDomain"])
  {
    uint64_t v2 = MEMORY[0x1E4F323F0];
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"Varispeed"])
  {
    uint64_t v2 = MEMORY[0x1E4F323F8];
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"LowQualityZeroLatency"]) {
    return *MEMORY[0x1E4F323E0];
  }
  else {
    return 0;
  }
}

uint64_t FigAssetReaderEnableReencodedAudioExtractionFromTrack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  CMTime v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if (!v19) {
    return 4294954514;
  }
  return v19(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t FigAssetReaderEnableDecodedAudioExtractionFromTrackWithAudioOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  CMTime v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 112);
  if (!v19) {
    return 4294954514;
  }
  return v19(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

BOOL isSupportedStereoMultiviewCodec(int a1)
{
  BOOL result = 0;
  if (a1 <= 1836415072)
  {
    if (a1 > 1751479856)
    {
      if (a1 == 1751479857) {
        return VTIsStereoMVHEVCDecodeSupported() != 0;
      }
      int v3 = 1752589105;
    }
    else
    {
      if (a1 == 1667790435) {
        return VTIsStereoMVHEVCDecodeSupported() != 0;
      }
      int v3 = 1718908520;
    }
LABEL_13:
    if (a1 != v3) {
      return result;
    }
    return VTIsStereoMVHEVCDecodeSupported() != 0;
  }
  if (a1 <= 1902667125)
  {
    if (a1 == 1836415073) {
      return VTIsStereoMVHEVCDecodeSupported() != 0;
    }
    int v3 = 1869117027;
    goto LABEL_13;
  }
  if (a1 != 1902667126 && a1 != 1902998904)
  {
    int v3 = 1902671459;
    goto LABEL_13;
  }
  return VTIsStereoMVHEVCDecodeSupported() != 0;
}

void sub_194B0DD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B0DEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVAssetWriterFigAssetWriterHandleServerDiedNotification(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _handleServerDiedNotification];
}

void AVAssetWriterFigAssetWriterHandleCompletedNotification(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _handleCompletedWritingNotification];
}

void AVAssetWriterFigAssetWriterHandleFailedNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  long long v7 = (void *)MEMORY[0x199715AE0]();
  if (!a5
    || (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID != CFGetTypeID(a5))
    || (uint64_t v9 = [a5 objectForKey:*MEMORY[0x1E4F32510]]) == 0
    || (uint64_t v10 = (void *)v9, (objc_opt_respondsToSelector() & 1) == 0)
    || (id v11 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", [v10 intValue])) == 0)
  {
    id v11 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
  }
  [a2 _handleFailedNotificationWithError:v11];
}

uint64_t aw_FragmentedHeaderDataCallback(OpaqueCMBlockBuffer *a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x199715AE0]();
  uint64_t v5 = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a2);
  if (v5)
  {
    long long v6 = v5;
    long long v7 = (void *)[v5 delegate];
    CMBlockBufferRef blockBufferOut = 0;
    if (!CMBlockBufferIsRangeContiguous(a1, 0, 0)
      && (CFDataWithBlockBufferNoCopCGFloat y = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, 0, &blockBufferOut), CFDataWithBlockBufferNoCopy)|| (CFDataWithBlockBufferNoCopCGFloat y = FigCreateCFDataWithBlockBufferNoCopy(), CFDataWithBlockBufferNoCopy))
    {
      uint64_t v9 = CFDataWithBlockBufferNoCopy;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        [v7 assetWriter:v6 didOutputSegmentData:0 segmentType:1 segmentReport:0];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v7 assetWriter:v6 didOutputSegmentData:0 segmentType:1];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v7 assetWriter:v6 didProduceFragmentedHeaderData:0];
      }
      uint64_t v9 = 0;
    }
    if (blockBufferOut) {
      CFRelease(blockBufferOut);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

uint64_t aw_FragmentedMediaDataCallback(OpaqueCMBlockBuffer *a1, uint64_t a2, uint64_t a3)
{
  long long v6 = (void *)MEMORY[0x199715AE0]();
  long long v7 = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a3);
  if (!v7)
  {
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  uint64_t v9 = (void *)[v7 delegate];
  CMBlockBufferRef blockBufferOut = 0;
  if (CMBlockBufferIsRangeContiguous(a1, 0, 0)
    || (CFDataWithBlockBufferNoCopCGFloat y = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, 0, &blockBufferOut), !CFDataWithBlockBufferNoCopy))
  {
    CFDataWithBlockBufferNoCopCGFloat y = FigCreateCFDataWithBlockBufferNoCopy();
    if (!CFDataWithBlockBufferNoCopy)
    {
      if (objc_opt_respondsToSelector())
      {
        id v11 = [[AVAssetSegmentReport alloc] initWithFigSegmentReportDictionary:a2];
        [v9 assetWriter:v8 didOutputSegmentData:0 segmentType:2 segmentReport:v11];
LABEL_12:

        goto LABEL_13;
      }
      if (objc_opt_respondsToSelector())
      {
        [v9 assetWriter:v8 didOutputSegmentData:0 segmentType:2];
      }
      else if (objc_opt_respondsToSelector())
      {
        id v11 = [[AVFragmentedMediaDataReport alloc] initWithFigFragmentedMediaDataReportDictionary:a2];
        [v9 assetWriter:v8 didProduceFragmentedMediaData:0 fragmentedMediaDataReport:v11];
        goto LABEL_12;
      }
LABEL_13:
      uint64_t v12 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v12 = CFDataWithBlockBufferNoCopy;
LABEL_14:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
LABEL_16:
  return v12;
}

void sub_194B14278(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t AVExecuteOperationsSynchronously(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(a1);
        }
        long long v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (([v6 isFinished] & 1) == 0)
        {
          AVExecuteOperationsSynchronously([v6 dependencies]);
          [v6 start];
          [v6 waitUntilFinished];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [a1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t AVAssetWriterCanAddPassthroughInputWithMediaTypeToAssetWriterWithFileType(uint64_t a1, void *a2)
{
  uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", @"vide", @"text", @"clcp", @"sbtl", @"tmcd", @"meta", @"hapt", @"auxv", @"scen", 0);
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", @"vide", @"text", @"clcp", @"sbtl", @"meta", 0);
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", @"vide", @"text", @"clcp", @"sbtl", 0);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", @"vide", @"text", @"clcp", @"sbtl", @"hapt", 0);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", @"vide", @"text", @"clcp", @"sbtl", @"tmcd", @"meta", @"hapt", @"auxv", @"scen", 0);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", @"vide", @"text", 0);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", 0);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", 0);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", 0);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", 0);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"soun", 0);
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:@"clcp"];
  long long v6 = objc_msgSend((id)objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v16, @"com.apple.quicktime-movie", v15, @"public.mpeg-4", v14, @"com.apple.m4v-video", v13, @"com.apple.m4a-audio", v12, @"com.apple.immersive-video", v11, @"public.3gpp", v10, @"com.apple.coreaudio-format", v9, @"com.microsoft.waveform-audio",
                       v8,
                       @"public.aiff-audio",
                       v2,
                       @"public.aifc-audio",
                       v3,
                       @"org.3gpp.adaptive-multi-rate-audio",
                       v4,
                       @"com.apple.itunes-timed-text",
                       v5,
                       @"com.scenarist.closed-caption",
                       [MEMORY[0x1E4F1CAD0] setWithObject:@"text"],
                       @"org.w3.webvtt",
                       0),
                 "objectForKey:",
                 [a2 UTI]);
  return [v6 containsObject:a1];
}

void AVTimebaseObserver_timebaseNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  long long v6 = *(NSObject **)(a2 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AVTimebaseObserver_timebaseNotificationCallback_block_invoke;
  v7[3] = &unk_1E57B2228;
  v7[4] = a2;
  void v7[5] = a3;
  dispatch_async(v6, v7);
}

__n128 AVTimebaseObserver_figTimebaseGetTime@<Q0>(__n128 *a1@<X8>)
{
  char v9 = 0;
  memset(&v8, 0, sizeof(v8));
  CMTimebaseGetTimeClampedAboveAnchorTime();
  uint64_t v2 = (__n128 *)MEMORY[0x1E4F1FA48];
  if ((unsigned __int128)0 >> 96 != 1) {
    CMTime v8 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  if (v8.epoch) {
    CMTime v8 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  CMTime time1 = v8;
  CMTime v6 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v3 = CMTimeCompare(&time1, &v6);
  uint64_t v4 = (__n128 *)&v8;
  if (v3 < 0) {
    uint64_t v4 = v2;
  }
  __n128 result = *v4;
  *a1 = *v4;
  a1[1].n128_u64[0] = v4[1].n128_u64[0];
  return result;
}

void sub_194B1BC30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B1BE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVRoutingSessionManagerCurrentSessionChanged(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int32_t v3 = (void *)MEMORY[0x199715AE0]();
  uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "postNotificationName:object:", @"AVRoutingSessionManagerCurrentSessionDidChangeNotification", a2, v6, v7);
}

void AVRoutingSessionManagerLikelyDestinationsChanged(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int32_t v3 = (void *)MEMORY[0x199715AE0]();
  uint64_t v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "postNotificationName:object:", @"AVRoutingSessionManagerLikelyExternalDestinationsDidChangeNotification", a2, v7, v9);
  if (dword_1E9356A50)
  {
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v4, "postNotificationName:object:", @"AVRoutingSessionManagerAllLikelyDestinationsDidChangeNotification", a2, v8, v10);
}

void *AVRoutingSessionManagerGetLikelyDestinationsFromFig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  theArraCGFloat y = 0;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(uint64_t, CFArrayRef *))(v6 + 24);
  if (v7 && !v7(a1, &theArray))
  {
    for (CFIndex i = 0; ; ++i)
    {
      CFIndex Count = (CFIndex)theArray;
      if (theArray) {
        CFIndex Count = CFArrayGetCount(theArray);
      }
      if (i >= Count) {
        break;
      }
      uint64_t v10 = [[AVRoutingSessionDestination alloc] initWithFigRoutingSessionDestination:CFArrayGetValueAtIndex(theArray, i)];
      if ((*(unsigned int (**)(uint64_t, AVRoutingSessionDestination *))(a2 + 16))(a2, v10)) {
        [v4 addObject:v10];
      }
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
  return v4;
}

void AVRoutingSessionManagerStartHighConfidenceDestinationComplete(void *a1, signed int a2)
{
  uint64_t v4 = (void *)MEMORY[0x199715AE0]();
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler((uint64_t)a1, a2);
}

void AVRoutingSessionManagerInvokeStartHighConfidenceCompletionHandler(uint64_t a1, signed int a2)
{
  uint64_t v4 = (void *)MEMORY[0x199715AE0]();
  if (dword_1E9356A50)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a2)
  {
    uint64_t v6 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
    if (!a1) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (!a1) {
      goto LABEL_10;
    }
  }
  if (dword_1E9356A50)
  {
    uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 16))(a1, v6);
LABEL_10:
}

void sub_194B1F3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B20F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B210DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B229E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B22B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B22D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B23024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figAssetWriterTrackDidDropBelowLowWaterLevel(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_figAssetWriterDidDropBelowLowWaterLevelForTrackID:", objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F32520]), "integerValue"));
}

void sub_194B2AB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVAssetWriterInputFigAssetWriterEndPassOperationPassFinished(int a1, void *a2, int a3, int a4, CFDictionaryRef theDict)
{
  Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F32508]);
  uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = (void *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F32518]);
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = [v10 length];
    uint64_t v13 = [v11 bytes];
    if (v12 >= 0x30)
    {
      uint64_t v14 = (long long *)v13;
      unint64_t v15 = v12 / 0x30;
      do
      {
        long long v16 = v14[1];
        long long v19 = *v14;
        long long v20 = v16;
        long long v21 = v14[2];
        v18[0] = v19;
        v18[1] = v16;
        v18[2] = v21;
        objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeRange:", v18));
        v14 += 3;
        --v15;
      }
      while (v15);
    }
  }
  return objc_msgSend(a2, "_notifyWhetherMorePassesAreNeeded:timeRanges:forTrackWithID:", Value == v8, v9, objc_msgSend((id)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F32520]), "integerValue"));
}

id NSArrayFromCGAffineTransform()
{
  return (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
}

void *NSArrayFromRGBAComponents(float a1, float a2, float a3, float a4)
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  *(float *)&double v9 = a4;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v9));
  *(float *)&double v10 = a1;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v10));
  *(float *)&double v11 = a2;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v11));
  *(float *)&double v12 = a3;
  objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v12));
  return v8;
}

unint64_t NSArrayGetRGBAComponents(void *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5)
  {
    *a5 = 0;
    unint64_t result = [a1 count];
    if (result < 4) {
      return result;
    }
    unint64_t result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 0), "floatValue");
    *a5 = v11;
  }
  else
  {
    unint64_t result = [a1 count];
    if (result < 4) {
      return result;
    }
  }
  if (a2)
  {
    unint64_t result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 1), "floatValue");
    *a2 = v12;
  }
  if (a3)
  {
    unint64_t result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 2), "floatValue");
    *a3 = v13;
  }
  if (a4)
  {
    unint64_t result = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", 3), "floatValue");
    *a4 = v14;
  }
  return result;
}

id _rampArrayWithTimeRangesAsValues(void *a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  unint64_t v3 = [a1 count];
  if (v3 >= 2)
  {
    unint64_t v4 = v3 >> 1;
    uint64_t v5 = 1;
    do
    {
      memset(&v8, 0, sizeof(v8));
      CMTimeRangeMakeFromDictionary(&v8, (CFDictionaryRef)[a1 objectAtIndex:v5 - 1]);
      CMTimeRange v7 = v8;
      objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeRange:", &v7));
      objc_msgSend(v2, "addObject:", objc_msgSend(a1, "objectAtIndex:", v5));
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return v2;
}

id _rampArrayWithTimeRangesAsDictionaries(void *a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  unint64_t v3 = [a1 count];
  if (v3 >= 2)
  {
    unint64_t v4 = v3 >> 1;
    uint64_t v5 = 1;
    long long v6 = 0uLL;
    do
    {
      long long v11 = v6;
      long long v12 = v6;
      long long v10 = v6;
      CMTimeRange v7 = (void *)[a1 objectAtIndex:v5 - 1];
      if (v7)
      {
        [v7 CMTimeRangeValue];
      }
      else
      {
        long long v11 = 0u;
        long long v12 = 0u;
        long long v10 = 0u;
      }
      v9[0] = v10;
      v9[1] = v11;
      v9[2] = v12;
      [v2 addObject:AVDictionaryWithTimeRange(v9)];
      objc_msgSend(v2, "addObject:", objc_msgSend(a1, "objectAtIndex:", v5));
      v5 += 2;
      --v4;
      long long v6 = 0uLL;
    }
    while (v4);
  }
  return v2;
}

void sub_194B2E354(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_194B2EC20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_194B2F5C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t trackLayerSort(void *a1, void *a2)
{
  uint64_t v3 = [a1 layer];
  uint64_t v4 = [a2 layer];
  if (v3 < v4) {
    return -1;
  }
  else {
    return v3 > v4;
  }
}

void *AVVideoCompositionSerializeSourceTrackWindows(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v2 = [a1 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v19 = *(void *)v26;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v17 = *MEMORY[0x1E4F34B50];
    uint64_t v18 = *MEMORY[0x1E4F34B60];
    uint64_t v15 = *MEMORY[0x1E4F34B58];
    uint64_t v16 = *MEMORY[0x1E4F34B40];
    uint64_t v5 = *MEMORY[0x1E4F34B48];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        CMTimeRange v8 = objc_msgSend(a1, "objectForKeyedSubscript:", v7, v15, v16, v17, v18);
        if (v8)
        {
          double v9 = v8;
          [v8 durationBefore];
          CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, v4);
          [v9 durationAfter];
          CFDictionaryRef v11 = CMTimeCopyAsDictionary(&v23, v4);
          [v9 durationBeforeWhenSeeking];
          CFDictionaryRef v12 = CMTimeCopyAsDictionary(&v22, v4);
          [v9 durationAfterWhenSeeking];
        }
        else
        {
          memset(&time, 0, sizeof(time));
          CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, v4);
          memset(&v23, 0, sizeof(v23));
          CFDictionaryRef v11 = CMTimeCopyAsDictionary(&v23, v4);
          memset(&v22, 0, sizeof(v22));
          CFDictionaryRef v12 = CMTimeCopyAsDictionary(&v22, v4);
          memset(&v21, 0, sizeof(v21));
        }
        CFDictionaryRef v13 = CMTimeCopyAsDictionary(&v21, v4);
        v29[0] = v18;
        v29[1] = v17;
        v30[0] = v7;
        v30[1] = v10;
        v29[2] = v16;
        v29[3] = v15;
        v30[2] = v11;
        v30[3] = v12;
        v29[4] = v5;
        v30[4] = v13;
        objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v30, v29, 5));
        if (v10) {
          CFRelease(v10);
        }
        if (v11) {
          CFRelease(v11);
        }
        if (v12) {
          CFRelease(v12);
        }
        if (v13) {
          CFRelease(v13);
        }
      }
      uint64_t v3 = [a1 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v3);
  }
  return v20;
}

void __getPerFrameHDRDisplayMetadataDefault_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue(@"videoCompositionHDRDisplayMetadata", @"com.apple.avfoundation", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v0)
  {
    uint64_t v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 != CFStringGetTypeID())
    {
LABEL_10:
      CFRelease(v1);
      return;
    }
    if (FigCFEqual())
    {
      uint64_t v3 = @"PerFrameHDRDisplayMetadataPolicy_Generate";
    }
    else
    {
      if (!FigCFEqual()) {
        goto LABEL_8;
      }
      uint64_t v3 = @"PerFrameHDRDisplayMetadataPolicy_Propagate";
    }
    getPerFrameHDRDisplayMetadataDefault_sDefaultPerFrameHDRDisplayMetadataPolicCGFloat y = (uint64_t)v3;
LABEL_8:
    if (dword_1E93569D0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_10;
  }
}

double avvc_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)(a1 + 8);
  double v5 = *(double *)(a1 + 16);
  double v6 = *(double *)(a1 + 24);
  double v7 = sqrt(v4 * v4 + *(double *)a1 * *(double *)a1);
  double v8 = sqrt(v6 * v6 + v5 * v5);
  double v9 = *(double *)a1 * v6 - v5 * v4;
  double v10 = -v8;
  double v11 = -v7;
  if (*(double *)a1 < v6) {
    double v10 = v8;
  }
  else {
    double v11 = v7;
  }
  if (v9 < 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = v7;
  }
  if (v9 < 0.0) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v14;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, 1.0 / v12, 1.0 / v13);
  long long v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  double v16 = atan2(*(long double *)(a1 + 8), *(long double *)a1);
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v21, &v20, -v16);
  long long v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  *(double *)a2 = v12;
  *(double *)(a2 + _Block_object_dispose(&STACK[0x420], 8) = v13;
  *(double *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = *(void *)a1;
  *(void *)(a2 + 32) = *(void *)(a1 + 8);
  *(void *)(a2 + 40) = *(void *)(a1 + 16);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x420], 8) = *(void *)(a1 + 24);
  *(void *)(a2 + 56) = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 64) = result;
  return result;
}

void AVExportSessionDetermineCompatibilityOfExportPresetCompletionHandler(void (**a1)(void, void), int a2)
{
  ((void (**)(void, BOOL))a1)[2](a1, a2 != 0);
}

void AVExportSessionEstimateMaximumDurationCompletionHandler(void *a1, long long *a2, __CFError *a3)
{
  ErrorFromCFError = avAssetExportSession_GetErrorFromCFError(a3);
  double v6 = (void (*)(void *, long long *, __CFError *))a1[2];
  long long v7 = *a2;
  uint64_t v8 = *((void *)a2 + 2);
  v6(a1, &v7, ErrorFromCFError);
}

void AVExportSessionEstimateOutputFileLengthCompletionHandler(void (**a1)(void, void, void), uint64_t a2, __CFError *a3)
{
  ErrorFromCFError = avAssetExportSession_GetErrorFromCFError(a3);
  ((void (**)(void, uint64_t, __CFError *))a1)[2](a1, a2, ErrorFromCFError);
}

uint64_t AVAssetExportSessionPropertyChangeCallback(void *a1, int a2)
{
  if (FigCFEqual())
  {
    double v4 = @"error";
  }
  else
  {
    uint64_t result = FigCFEqual();
    if (!result) {
      return result;
    }
    double v4 = @"status";
  }
  if (a2)
  {
    return [a1 didChangeValueForKey:v4];
  }
  else
  {
    return [a1 willChangeValueForKey:v4];
  }
}

void AVExportSessionDetermineCompatibilityOfFileTypesCompletionHandler(void (**a1)(void))
{
  a1[2]();
}

__CFError *avAssetExportSession_GetErrorFromCFError(__CFError *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFErrorGetDomain(result);
    if (FigCFEqual())
    {
      CFTypeID v2 = (void *)[(__CFError *)v1 userInfo];
      signed int v3 = [(__CFError *)v1 code];
      return (__CFError *)AVLocalizedErrorWithUnderlyingOSStatus(v3, v2);
    }
    else
    {
      double v4 = (void *)[(__CFError *)v1 copy];
      return (__CFError *)v4;
    }
  }
  return result;
}

void sub_194B38788(_Unwind_Exception *a1)
{
}

uint64_t AVAssetExportSessionGetFigRemakerAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(void *a1)
{
  if ([a1 isEqualToString:@"Spectral"])
  {
    uint64_t v2 = MEMORY[0x1E4F344E8];
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"TimeDomain"])
  {
    uint64_t v2 = MEMORY[0x1E4F344F0];
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"Varispeed"])
  {
    uint64_t v2 = MEMORY[0x1E4F344F8];
    return *(void *)v2;
  }
  if ([a1 isEqualToString:@"LowQualityZeroLatency"]) {
    return *MEMORY[0x1E4F344E0];
  }
  else {
    return 0;
  }
}

uint64_t avAssetExportSession_IsVideoCompositionValidForAssetWithTimeRange(void *a1, _OWORD *a2)
{
  uint64_t v4 = [a1 asset];
  double v5 = (void *)[a1 videoComposition];
  long long v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  void v8[2] = a2[2];
  return [v5 isValidForAsset:v4 timeRange:v8 validationDelegate:0];
}

uint64_t avAssetExportSession_VideoCompositionOutputColorPropertiesWithCustomCompositor(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result) {
    return [*(id *)(*(void *)(result + 8) + 56) videoCompositionOutputColorPropertiesWithCustomCompositor:*(void *)(*(void *)(result + 8) + 48) formatDescriptions:a2 colorPrimaries:a3 transferFunction:a4 yCbCrMatrix:a5 perFrameHDRDisplayMetadataPolicy:a6];
  }
  return result;
}

uint64_t avAssetExportSession_CustomVideoCompositorSessionGetAndClearClientError(uint64_t result)
{
  if (result) {
    return [*(id *)(*(void *)(result + 8) + 48) getAndClearClientError];
  }
  return result;
}

void sub_194B3B0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194B3B820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v33);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void AVDelegatingPlaybackCoordinatorSetRateAndAnchorTimeCallback(void *a1, uint64_t a2, uint64_t a3, long long *a4, long long *a5, uint64_t a6, float a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  long long v18 = (void *)MEMORY[0x199715AE0]();
  if (a1)
  {
    if (a6)
    {
      a6 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", a6));
      [a1 _prepareToInitiatePlayback];
    }
    uint64_t v19 = [AVDelegatingPlaybackCoordinatorPlayCommand alloc];
    long long v25 = *a4;
    uint64_t v26 = *((void *)a4 + 2);
    long long v23 = *a5;
    uint64_t v24 = *((void *)a5 + 2);
    CGAffineTransform v20 = [(AVDelegatingPlaybackCoordinatorPlayCommand *)v19 initWithCoordinator:a1 originator:a6 expectedCurrentItemIdentifier:a2 commandOrderIndex:a3 rate:&v25 itemTime:&v23 hostClockTime:COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(a7)))];
    CGAffineTransform v21 = (void *)[a1 playbackControlDelegate];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __AVDelegatingPlaybackCoordinatorSetRateAndAnchorTimeCallback_block_invoke;
    v22[3] = &__block_descriptor_48_e5_v8__0l;
    v22[4] = a11;
    v22[5] = a10;
    [v21 playbackCoordinator:a1 didIssuePlayCommand:v20 completionHandler:v22];
  }
}

void AVDelegatingPlaybackCoordinatorJumpToTimeCallback(void *a1, uint64_t a2, uint64_t a3, long long *a4, float a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  CGAffineTransform v20 = (void *)MEMORY[0x199715AE0]();
  if (a1)
  {
    if (a8)
    {
      a8 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", a8));
      if (a7) {
        [a1 _prepareToInitiatePlayback];
      }
    }
    CGAffineTransform v21 = [AVDelegatingPlaybackCoordinatorSeekCommand alloc];
    long long v26 = *a4;
    uint64_t v27 = *((void *)a4 + 2);
    LOBYTE(v24) = a7 != 0;
    CMTime v22 = -[AVDelegatingPlaybackCoordinatorSeekCommand initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:itemTime:shouldPause:shouldBufferInAnticipationOfPlayback:anticipatedPlaybackRate:completionDueDate:](v21, "initWithCoordinator:originator:expectedCurrentItemIdentifier:commandOrderIndex:itemTime:shouldPause:shouldBufferInAnticipationOfPlayback:anticipatedPlaybackRate:completionDueDate:", a1, a8, a2, a3, &v26, COERCE_DOUBLE(__PAIR64__(DWORD1(v26), LODWORD(a5))), v24, a9);
    long long v23 = (void *)[a1 playbackControlDelegate];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __AVDelegatingPlaybackCoordinatorJumpToTimeCallback_block_invoke;
    v25[3] = &__block_descriptor_48_e5_v8__0l;
    v25[4] = a12;
    v25[5] = a11;
    [v23 playbackCoordinator:a1 didIssueSeekCommand:v22 completionHandler:v25];
  }
}

void AVDelegatingPlaybackCoordinatorPauseCallback(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, float a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  long long v17 = (void *)MEMORY[0x199715AE0]();
  if (a1)
  {
    if (a5)
    {
      a5 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", a5));
      if (a4) {
        [a1 _prepareToInitiatePlayback];
      }
    }
    long long v18 = [AVDelegatingPlaybackCoordinatorPauseCommand alloc];
    *(float *)&double v19 = a6;
    CGAffineTransform v20 = [(AVDelegatingPlaybackCoordinatorPauseCommand *)v18 initWithCoordinator:a1 originator:a5 expectedCurrentItemIdentifier:a2 commandOrderIndex:a3 shouldBufferInAnticipationOfPlayback:a4 != 0 anticipatedPlaybackRate:v19];
    CGAffineTransform v21 = (void *)[a1 playbackControlDelegate];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __AVDelegatingPlaybackCoordinatorPauseCallback_block_invoke;
    v22[3] = &__block_descriptor_48_e5_v8__0l;
    v22[4] = a10;
    v22[5] = a9;
    [v21 playbackCoordinator:a1 didIssuePauseCommand:v20 completionHandler:v22];
  }
}

void AVDelegatingPlaybackCoordinatorPrepareToSetRateCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v17 = (void *)MEMORY[0x199715AE0]();
  if (a1)
  {
    if (a4)
    {
      a4 = objc_msgSend(a1, "participantForIdentifier:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", a4));
      [a1 _prepareToInitiatePlayback];
    }
    long long v18 = [AVDelegatingPlaybackCoordinatorBufferingCommand alloc];
    *(float *)&double v19 = a6;
    CGAffineTransform v20 = [(AVDelegatingPlaybackCoordinatorBufferingCommand *)v18 initWithCoordinator:a1 originator:a4 expectedCurrentItemIdentifier:a2 commandOrderIndex:a3 anticipatedPlaybackRate:a5 completionDueDate:v19];
    CGAffineTransform v21 = (void *)[a1 playbackControlDelegate];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __AVDelegatingPlaybackCoordinatorPrepareToSetRateCallback_block_invoke;
    v22[3] = &__block_descriptor_48_e5_v8__0l;
    v22[4] = a9;
    v22[5] = a8;
    [v21 playbackCoordinator:a1 didIssueBufferingCommand:v20 completionHandler:v22];
  }
}

void AVDelegatingPlaybackCoordinatorBroadcastTimelineStateCallback(void *a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x199715AE0]();
  double v5 = (void *)[a1 coordinationMediumDelegate];
  [a1 _updateTransportControlStateDictionaryWithTransportControlState:a2];
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "playbackCoordinator:broadcastTransportControlStateDictionary:forItemWithIdentifier:", a1, a2, objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F21FF8]));
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [a1 setCoordinationMediumDelegate:0];
  }
}

void AVDelegatingPlaybackCoordinatorBroadcastParticipantStateCallback(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x199715AE0]();
  double v5 = (void *)[a1 coordinationMediumDelegate];
  [a1 _updateParticipantStateDictionaryWithParticipantState:a2];
  [a1 _removeUnusedTransportControlStates];
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 playbackCoordinator:a1 broadcastLocalParticipantStateDictionary:a2];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [a1 setCoordinationMediumDelegate:0];
  }
}

void AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  v12[26] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a1 coordinationMediumDelegate];
  if (a1 && (double v10 = (void *)v9, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback_block_invoke;
    v12[3] = &unk_1E57B36D0;
    v12[4] = a1;
    void v12[5] = a4;
    v12[6] = a3;
    [v10 playbackCoordinator:a1 reloadTransportControlStateForItemWithIdentifier:a2 completionHandler:v12];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [a1 setCoordinationMediumDelegate:0];
    a4(a3);
  }
}

void sub_194B3C858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3CD60(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B3CEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3CFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3D434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3D634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3DD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3E0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3E2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3ED88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B3EEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3F2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3F69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3FC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B3FF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AVDelegatingPlaybackCoordinatorSetRateAndAnchorTimeCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), 0);
}

uint64_t __AVDelegatingPlaybackCoordinatorJumpToTimeCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), 0);
}

uint64_t __AVDelegatingPlaybackCoordinatorPauseCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), 0);
}

uint64_t __AVDelegatingPlaybackCoordinatorPrepareToSetRateCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), 0);
}

void __AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _figTimelineCoordinatorConfigQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback_block_invoke_2;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

void sub_194B40E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194B41578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B42108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B42338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVExportSettingsForOutputSettingsPreset(uint64_t a1)
{
  uint64_t result = exportSettings_exportPresetForOutputSettingsPreset(a1);
  if (result)
  {
    return FigExportSettingsForExportPreset();
  }
  return result;
}

uint64_t exportSettings_exportPresetForOutputSettingsPreset(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"AVAssetExportPreset640x480", @"AVOutputSettingsPreset640x480", @"AVAssetExportPreset960x540", @"AVOutputSettingsPreset960x540", @"AVAssetExportPreset1280x720", @"AVOutputSettingsPreset1280x720", @"AVAssetExportPreset1920x1080", @"AVOutputSettingsPreset1920x1080", @"AVAssetExportPreset3840x2160", @"AVOutputSettingsPreset3840x2160", @"AVAssetExportPresetHEVC1920x1080", @"AVOutputSettingsPresetHEVC1920x1080", @"AVAssetExportPresetHEVC1920x1080WithAlpha", @"AVOutputSettingsPresetHEVC1920x1080WithAlpha", @"AVAssetExportPresetHEVC3840x2160", @"AVOutputSettingsPresetHEVC3840x2160", @"AVAssetExportPresetHEVC3840x2160WithAlpha",
                 @"AVOutputSettingsPresetHEVC3840x2160WithAlpha",
                 @"AVAssetExportPresetMVHEVC960x960",
                 @"AVOutputSettingsPresetMVHEVC960x960",
                 @"AVAssetExportPresetMVHEVC1440x1440",
                 @"AVOutputSettingsPresetMVHEVC1440x1440",
                 0);
  return [v2 objectForKey:a1];
}

uint64_t AVExportSettingsAverageBitRateForSourceAndExportPresetWithEncoderSpecification(int a1, int a2, int a3, CMVideoFormatDescriptionRef videoDesc)
{
  if (!videoDesc) {
    return 0;
  }
  CMVideoFormatDescriptionGetDimensions(videoDesc);
  CMFormatDescriptionGetExtension(videoDesc, (CFStringRef)*MEMORY[0x1E4F24BC8]);
  return (int)FigExportSettingsAverageBitRateForSourceAndExportPreset();
}

uint64_t AVExportSettingsAverageBitRateForSourceAndOutputSettingsPreset(int a1, int a2, uint64_t a3, const opaqueCMFormatDescription *a4)
{
  int v7 = exportSettings_exportPresetForOutputSettingsPreset(a3);
  return AVExportSettingsAverageBitRateForSourceAndExportPresetWithEncoderSpecification(a1, a2, v7, a4);
}

id AVExportSettingsEffectiveColorPropertyForPresetAndInputOutputFormat()
{
  CFPropertyListRef v0 = (void *)FigExportSettings_CopyEffectiveColorPropertyForPresetAndInputOutputFormat();
  return v0;
}

void avqsbar_figRendererNowBelowLowWaterLevelNotificationHandler(uint64_t a1, void *a2)
{
  signed int v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _triggerMediaRequestCallback];
}

void avqsbar_figRendererWasFlushedAutomaticallyNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  int v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F34588]);
  memset(&v10, 0, sizeof(v10));
  CMTimeMakeFromDictionary(&v10, Value);
  CMTime v9 = v10;
  [a2 _wasFlushedAutomaticallyAtTime:&v9];
}

void avqsbar_figRendererRebuildCouldBenefitFidelityNotificationHandler(uint64_t a1, uint64_t a2)
{
  signed int v3 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVSampleBufferAudioRendererOutputConfigurationDidChangeNotification", a2);
}

void avqsbar_figRendererServerDied(uint64_t a1, void *a2)
{
  signed int v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _transitionToStatus:2, AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0) error];
}

void AVSampleBufferAudioRendererFlushFromMediaTimeCallback(int a1, void (**a2)(void, void))
{
  ((void (**)(void, BOOL))a2)[2](a2, a1 == 0);
}

void sub_194B460B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B46298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B46464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t setup(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  [v2 dictionaryWithObject:v3 forKey:*MEMORY[0x1E4F32748]];
  uint64_t v4 = FigCPEProtectorRemoteCreateForScheme();
  if (v4)
  {
    uint64_t v5 = v4;
    goto LABEL_3;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  uint64_t v5 = CMNotificationCenterAddListener();
  if (v5) {
LABEL_3:
  }
    teardown(a1);
  return v5;
}

void teardown(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterBarrier();
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + _Block_object_dispose(&STACK[0x420], 8) = 0;
  }
}

void NotificationHandler(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  CFRetain(a3);
  long long v6 = *(NSObject **)(a2 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __NotificationHandler_block_invoke;
  v7[3] = &unk_1E57B2228;
  v7[4] = a2;
  void v7[5] = a3;
  dispatch_async(v6, v7);
}

void __NotificationHandler_block_invoke(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E4F32740]))
  {
    teardown(*(void *)(a1 + 32));
    setup(*(void *)(a1 + 32));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E4F1FE28]))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVExternalProtectionMonitorExternalProtectionStateChangedNotification", *(void *)(*(void *)(a1 + 32) + 16));
  }
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void sub_194B47B10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B47DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B47F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplHandleEvent(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  long long v6 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4)
  {
    if (FigCFEqual())
    {
      [a4 _didReceiveData:a3];
    }
    else if (FigCFEqual())
    {
      [a4 _didCloseCommunicationChannel];
    }
  }
}

void AVFigEndpointRemoteControlSessionOutputDeviceCommunicationChannelImplSendDataCompletion(signed int a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a1)
  {
    uint64_t v7 = 0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v7 = AVLocalizedErrorWithUnderlyingOSStatus(a1, 0);
  if (a3) {
LABEL_5:
  }
    a3[2](a3, v7);
LABEL_6:
}

void sub_194B4981C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B49E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4A164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4A270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4B1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4BBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4BF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t AVNSLocalesMatchAccordingToRFC4647FilteringRules(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v4 = (void *)[a1 localeIdentifier];
  uint64_t v5 = (void *)[a2 localeIdentifier];
  return AVNSLanguageIdentifiersMatchAccordingToRFC4647FilteringRules(v4, v5);
}

uint64_t AVNSLanguageIdentifiersMatchAccordingToRFC4647FilteringRules(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  if (a1)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a1];
    if (!v2) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v3 = 0;
  if (a2) {
LABEL_4:
  }
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v2];
LABEL_5:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_7:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(v3);
    }
    uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
    uint64_t result = [v2 objectForKey:v8];
    if (!result) {
      return result;
    }
    uint64_t result = objc_msgSend((id)result, "isEqual:", objc_msgSend(v3, "objectForKey:", v8));
    if (!result) {
      return result;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t result = 1;
      if (v5) {
        goto LABEL_7;
      }
      return result;
    }
  }
}

CFLocaleIdentifier AVLanguageCodeFromPackedLanguageCode(CFLocaleIdentifier result)
{
  unsigned __int16 valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt16Type, &valuePtr);
    unsigned int v1 = valuePtr;
    if (valuePtr == 0x7FFF) {
      return @"und";
    }
    if (valuePtr > 0x3FFu) {
      return (CFLocaleIdentifier)objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c", (v1 >> 10) | 0x60, (v1 >> 5) & 0x1F | 0x60, v1 & 0x1F | 0x60);
    }
    uint64_t result = CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], valuePtr, -1);
    if (!result) {
      return result;
    }
    CFLocaleIdentifier v2 = result;
    unsigned __int16 valuePtr = FigMetadataGetPackedISO639_2TFromLocaleIdentifier();
    CFRelease(v2);
    unsigned int v1 = valuePtr;
    if (valuePtr < 0x400u) {
      return 0;
    }
    else {
      return (CFLocaleIdentifier)objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c", (v1 >> 10) | 0x60, (v1 >> 5) & 0x1F | 0x60, v1 & 0x1F | 0x60);
    }
  }
  return result;
}

uint64_t AVExtendedLanguageTagFromLocale(void *a1)
{
  CFLocaleIdentifier v2 = (void *)[a1 localeIdentifier];
  if (objc_msgSend((id)objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E4F1C438]), "isEqualToString:", @"root"))CFLocaleIdentifier v2 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", @"root", @"und"); {
  return [v2 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  }
}

uint64_t AVLanguageCodeFromExtendedLanguageTag(void *a1)
{
  unsigned int v1 = (void *)[a1 componentsSeparatedByString:@"-"];
  return [v1 firstObject];
}

uint64_t AVIsSpecialSpokenExtendedLanguageTag(void *a1)
{
  if (![a1 compare:@"cmn" options:1]) {
    return 0;
  }
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "componentsSeparatedByString:", @"-"), "firstObject");
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  if (AVIsSpecialSpokenExtendedLanguageTag_sInitLangCodesOnce != -1) {
    dispatch_once(&AVIsSpecialSpokenExtendedLanguageTag_sInitLangCodesOnce, &__block_literal_global_16);
  }
  uint64_t v4 = (void *)AVIsSpecialSpokenExtendedLanguageTag_sSpecialSpokenLanguageCodes;
  uint64_t v5 = [v3 lowercaseString];
  return [v4 containsObject:v5];
}

void *__AVIsSpecialSpokenExtendedLanguageTag_block_invoke()
{
  AVIsSpecialSpokenExtendedLanguageTag_sSpecialSpokenLanguageCodes = (uint64_t)&unk_1EE5E1AE8;
  return &unk_1EE5E1AE8;
}

void *AVAllAvailableNSBundleCompatibleLanguageTagsForObjects(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v8 = [v7 unicodeLanguageIdentifier]) != 0
          || (objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v8 = [v7 unicodeLanguageCode]) != 0)
        {
          uint64_t v9 = v8;
          if (([v2 containsObject:v8] & 1) == 0) {
            [v2 addObject:v9];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  return v2;
}

void AVExternalPlaybackMonitorAirPlayVideoActiveChanged(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1E9356990)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v5, v6), "postNotificationName:object:", @"AVExternalPlaybackMonitorAirPlayVideoActiveDidChangeNotification", a2);
}

void AVExternalPlaybackMonitorAirPlayVideoPlayingChanged(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1E9356990)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v5, v6), "postNotificationName:object:", @"AVExternalPlaybackMonitorAirPlayVideoPlayingDidChangeNotification", a2);
}

void AVSampleBufferVideoOutput_figVCAvailableImmediate(uint64_t a1, long long *a2, char a3, void *a4)
{
  uint64_t v6 = [a4 referencedObject];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v9 = *(NSObject **)(v8 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke;
    block[3] = &unk_1E57B3FC0;
    void block[4] = v8;
    long long v13 = *a2;
    uint64_t v14 = *((void *)a2 + 2);
    dispatch_sync(v9, block);
    if (a3)
    {
      long long v10 = *(NSObject **)(v8 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke_2;
      v11[3] = &unk_1E57B1E80;
      v11[4] = v7;
      dispatch_sync(v10, v11);
    }
  }
}

void sub_194B4E5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B4EB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

dispatch_queue_t __createDispatchQueueOnce_block_invoke()
{
  dispatch_queue_t result = av_readwrite_dispatch_queue_create("com.apple.avuxmdisplaymanager");
  sAVUXMDisplayManagerQueue = (uint64_t)result;
  return result;
}

void sub_194B4F048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B4F1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B4F254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B4F2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

AVSynchronousBlockScheduler *AVMakeBlockSchedulerThatExecutesBlocksSynchronously()
{
  CFPropertyListRef v0 = objc_alloc_init(AVSynchronousBlockScheduler);
  return v0;
}

uint64_t AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(uint64_t a1)
{
  if (AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDictOnce != -1) {
    dispatch_once(&AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDictOnce, &__block_literal_global_12);
  }
  uint64_t result = [(id)AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDict objectForKey:a1];
  if (!result) {
    return a1;
  }
  return result;
}

id __AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F346F8], @"AVMediaCharacteristicVisual", *MEMORY[0x1E4F346E0], @"AVMediaCharacteristicAudible", *MEMORY[0x1E4F346E8], @"AVMediaCharacteristicLegible", 0);
  AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDict = (uint64_t)result;
  return result;
}

void *AVSynthesizeAVMediaCharacteristicsFromFigValues(void *a1, int a2)
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v4 addObjectsFromArray:AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(a1)];
  uint64_t v5 = 0;
  if (a2 <= 1952807027)
  {
    if (a2 != 1835365473)
    {
      int v6 = 1935832172;
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:@"AVMediaCharacteristicFrameBased"];
    goto LABEL_8;
  }
  if (a2 == 1986618469) {
    goto LABEL_7;
  }
  int v6 = 1952807028;
LABEL_6:
  if (a2 == v6) {
    goto LABEL_7;
  }
LABEL_8:
  [v4 addObjectsFromArray:v5];
  return v4;
}

void *AVTranslateAVMediaCharacteristicsToFigMediaCharacteristics(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        [v2 addObject:AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(*(void *)(*((void *)&v8 + 1) + 8 * i))];
      }
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return v2;
}

uint64_t AVUnsupportedOutputURLPathExtensions()
{
  if (AVUnsupportedOutputURLPathExtensions_createExtensionListOnce != -1) {
    dispatch_once(&AVUnsupportedOutputURLPathExtensions_createExtensionListOnce, &__block_literal_global_15);
  }
  return AVUnsupportedOutputURLPathExtensions_sUnsupportedExtensionList;
}

uint64_t __AVUnsupportedOutputURLPathExtensions_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"mp3", @"m1a", @"m2a", @"aac", @"adts", @"gsm", @"mpa", 0);
  AVUnsupportedOutputURLPathExtensions_sUnsupportedExtensionList = result;
  return result;
}

id AVMediaSubtypeDescriptionStringForFormatDescription(const opaqueCMFormatDescription *a1)
{
  return 0;
}

CFDictionaryRef AVDictionaryWithTime(CMTime *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v3 = *a1;
  return CMTimeCopyAsDictionary(&v3, v1);
}

CFDictionaryRef AVDictionaryWithTimeRange(_OWORD *a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v2 = a1[1];
  *(_OWORD *)&v4.start.CMTimeValue value = *a1;
  *(_OWORD *)&v4.start.CMTimeEpoch epoch = v2;
  *(_OWORD *)&v4.duration.CMTimeScale timescale = a1[2];
  return CMTimeRangeCopyAsDictionary(&v4, v1);
}

void *AVRampsIncludesRampThatOverlapsTimeRange(void *result, long long *a2)
{
  if (result)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __AVRampsIncludesRampThatOverlapsTimeRange_block_invoke;
    v3[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
    long long v2 = a2[1];
    long long v4 = *a2;
    long long v5 = v2;
    long long v6 = a2[2];
    return (void *)([result indexOfObjectPassingTest:v3] != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t __AVRampsIncludesRampThatOverlapsTimeRange_block_invoke(uint64_t a1, void *a2, char a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((a3 & 1) == 0)
  {
    memset(&v23, 0, sizeof(v23));
    if (a2) {
      [a2 CMTimeRangeValue];
    }
    memset(&v22, 0, sizeof(v22));
    CMTimeRange range = v23;
    CMTimeRangeGetEnd(&v22, &range);
    long long v6 = *(_OWORD *)(a1 + 48);
    long long v24 = *(_OWORD *)(a1 + 32);
    long long v25 = v6;
    CMTimeFlags flags = *(_DWORD *)(a1 + 68);
    CMTimeScale timescale = *(_DWORD *)(a1 + 64);
    CMTimeEpoch epoch = *(void *)(a1 + 72);
    memset(&v20, 0, sizeof(v20));
    long long v9 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&range.start.CMTimeEpoch epoch = v9;
    range.duration.CMTimeScale timescale = *(_DWORD *)(a1 + 64);
    range.duration.CMTimeFlags flags = flags;
    range.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetEnd(&v20, &range);
    range.CMTime start = v22;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    time2.start.CMTimeEpoch epoch = v25;
    if (CMTimeCompare(&range.start, &time2.start) >= 1)
    {
      memset(&range, 0, 24);
      time2.CMTime start = v22;
      *(_OWORD *)&rhs.CMTimeValue value = v24;
      rhs.CMTimeEpoch epoch = v25;
      CMTimeSubtract(&range.start, &time2.start, &rhs);
      *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&range.start.value;
      time2.start.CMTimeEpoch epoch = range.start.epoch;
      *(_OWORD *)&rhs.CMTimeValue value = AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_slopTime;
      rhs.CMTimeEpoch epoch = 0;
      if (CMTimeCompare(&time2.start, &rhs) <= 0)
      {
        long long v24 = *(_OWORD *)&v22.value;
        *(void *)&long long v25 = v22.epoch;
        rhs.CMTimeValue value = *((void *)&v25 + 1);
        rhs.CMTimeScale timescale = timescale;
        rhs.CMTimeFlags flags = flags;
        rhs.CMTimeEpoch epoch = epoch;
        CMTime start = range.start;
        CMTimeSubtract(&time2.start, &rhs, &start);
        *((void *)&v25 + 1) = time2.start.value;
        CMTimeFlags flags = time2.start.flags;
        CMTimeScale timescale = time2.start.timescale;
        CMTimeEpoch epoch = time2.start.epoch;
      }
    }
    range.CMTime start = v20;
    *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
    time2.start.CMTimeEpoch epoch = v23.start.epoch;
    if (CMTimeCompare(&range.start, &time2.start) >= 1)
    {
      memset(&time2, 0, 24);
      range.CMTime start = v20;
      CMTime rhs = v23.start;
      CMTimeSubtract(&time2.start, &range.start, &rhs);
      *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&time2.start.value;
      range.start.CMTimeEpoch epoch = time2.start.epoch;
      *(_OWORD *)&rhs.CMTimeValue value = AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_slopTime;
      rhs.CMTimeEpoch epoch = 0;
      if (CMTimeCompare(&range.start, &rhs) <= 0)
      {
        rhs.CMTimeValue value = *((void *)&v25 + 1);
        rhs.CMTimeScale timescale = timescale;
        rhs.CMTimeFlags flags = flags;
        rhs.CMTimeEpoch epoch = epoch;
        CMTime start = time2.start;
        CMTimeSubtract(&range.start, &rhs, &start);
        CMTimeFlags flags = range.start.flags;
        CMTimeScale timescale = range.start.timescale;
        *((void *)&v25 + 1) = range.start.value;
        CMTimeEpoch epoch = range.start.epoch;
        *(_OWORD *)&range.start.CMTimeValue value = v24;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = v25;
        range.duration.CMTimeScale timescale = timescale;
        range.duration.CMTimeFlags flags = flags;
        range.duration.CMTimeEpoch epoch = epoch;
        CMTimeRangeGetEnd(&rhs, &range);
        CMTime v20 = rhs;
      }
    }
    CMTimeRange range = v23;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
    time2.duration.CMTimeScale timescale = timescale;
    time2.duration.CMTimeFlags flags = flags;
    time2.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetIntersection(&v17, &range, &time2);
    if ((v17.start.flags & 1) == 0) {
      goto LABEL_27;
    }
    CMTimeRange range = v23;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
    time2.duration.CMTimeScale timescale = timescale;
    time2.duration.CMTimeFlags flags = flags;
    time2.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetIntersection(&v15, &range, &time2);
    if ((v15.duration.flags & 1) == 0) {
      goto LABEL_27;
    }
    CMTimeRange range = v23;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
    time2.duration.CMTimeScale timescale = timescale;
    time2.duration.CMTimeFlags flags = flags;
    time2.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetIntersection(&v14, &range, &time2);
    if (v14.duration.epoch) {
      goto LABEL_27;
    }
    CMTimeRange range = v23;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
    time2.duration.CMTimeScale timescale = timescale;
    time2.duration.CMTimeFlags flags = flags;
    time2.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetIntersection(&v13, &range, &time2);
    if (v13.duration.value < 0) {
      goto LABEL_27;
    }
    CMTimeRange range = v23;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
    time2.duration.CMTimeScale timescale = timescale;
    time2.duration.CMTimeFlags flags = flags;
    time2.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetIntersection(&v11, &range, &time2);
    CMTime time1 = v11.duration;
    *(_OWORD *)&range.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
    range.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    if (CMTimeCompare(&time1, &range.start))
    {
LABEL_27:
      if ((~flags & 5) != 0
        || (*(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&v23.start.value,
            range.start.CMTimeEpoch epoch = v23.start.epoch,
            *(_OWORD *)&time2.start.CMTimeValue value = v24,
            time2.start.CMTimeEpoch epoch = v25,
            CMTimeCompare(&range.start, &time2.start) <= 0))
      {
        *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
        range.start.CMTimeEpoch epoch = v23.start.epoch;
        *(_OWORD *)&time2.start.CMTimeValue value = v24;
        time2.start.CMTimeEpoch epoch = v25;
        uint64_t result = CMTimeCompare(&range.start, &time2.start);
        if (!result) {
          return result;
        }
        if ((~v23.duration.flags & 5) != 0) {
          return 1;
        }
        *(_OWORD *)&range.start.CMTimeValue value = v24;
        range.start.CMTimeEpoch epoch = v25;
        *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
        time2.start.CMTimeEpoch epoch = v23.start.epoch;
        if (CMTimeCompare(&range.start, &time2.start) <= 0) {
          return 1;
        }
      }
    }
    else
    {
      range.CMTime start = v20;
      *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
      time2.start.CMTimeEpoch epoch = v23.start.epoch;
      if (CMTimeCompare(&range.start, &time2.start) <= 0)
      {
        uint64_t result = 0;
        *a4 = 1;
        return result;
      }
    }
  }
  return 0;
}

void *AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange(void *result, long long *a2)
{
  if (result)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_block_invoke;
    v3[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
    long long v2 = a2[1];
    long long v4 = *a2;
    long long v5 = v2;
    long long v6 = a2[2];
    return (void *)([result indexOfObjectPassingTest:v3] != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t __AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  memset(&v23, 0, sizeof(v23));
  if (a2) {
    [a2 timeRange];
  }
  memset(&v22, 0, sizeof(v22));
  CMTimeRange range = v23;
  CMTimeRangeGetEnd(&v22, &range);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v24 = *(_OWORD *)(a1 + 32);
  long long v25 = v6;
  CMTimeFlags flags = *(_DWORD *)(a1 + 68);
  CMTimeScale timescale = *(_DWORD *)(a1 + 64);
  CMTimeEpoch epoch = *(void *)(a1 + 72);
  memset(&v20, 0, sizeof(v20));
  long long v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v9;
  range.duration.CMTimeScale timescale = *(_DWORD *)(a1 + 64);
  range.duration.CMTimeFlags flags = flags;
  range.duration.CMTimeEpoch epoch = epoch;
  CMTimeRangeGetEnd(&v20, &range);
  range.CMTime start = v22;
  *(_OWORD *)&time2.start.CMTimeValue value = v24;
  time2.start.CMTimeEpoch epoch = v25;
  if (CMTimeCompare(&range.start, &time2.start) >= 1)
  {
    memset(&range, 0, 24);
    time2.CMTime start = v22;
    *(_OWORD *)&rhs.CMTimeValue value = v24;
    rhs.CMTimeEpoch epoch = v25;
    CMTimeSubtract(&range.start, &time2.start, &rhs);
    *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&range.start.value;
    time2.start.CMTimeEpoch epoch = range.start.epoch;
    *(_OWORD *)&rhs.CMTimeValue value = AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_slopTime;
    rhs.CMTimeEpoch epoch = 0;
    if (CMTimeCompare(&time2.start, &rhs) <= 0)
    {
      long long v24 = *(_OWORD *)&v22.value;
      *(void *)&long long v25 = v22.epoch;
      rhs.CMTimeValue value = *((void *)&v25 + 1);
      rhs.CMTimeScale timescale = timescale;
      rhs.CMTimeFlags flags = flags;
      rhs.CMTimeEpoch epoch = epoch;
      CMTime start = range.start;
      CMTimeSubtract(&time2.start, &rhs, &start);
      *((void *)&v25 + 1) = time2.start.value;
      CMTimeFlags flags = time2.start.flags;
      CMTimeScale timescale = time2.start.timescale;
      CMTimeEpoch epoch = time2.start.epoch;
    }
  }
  range.CMTime start = v20;
  *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
  time2.start.CMTimeEpoch epoch = v23.start.epoch;
  if (CMTimeCompare(&range.start, &time2.start) >= 1)
  {
    memset(&time2, 0, 24);
    range.CMTime start = v20;
    CMTime rhs = v23.start;
    CMTimeSubtract(&time2.start, &range.start, &rhs);
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&time2.start.value;
    range.start.CMTimeEpoch epoch = time2.start.epoch;
    *(_OWORD *)&rhs.CMTimeValue value = AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange_slopTime;
    rhs.CMTimeEpoch epoch = 0;
    if (CMTimeCompare(&range.start, &rhs) <= 0)
    {
      rhs.CMTimeValue value = *((void *)&v25 + 1);
      rhs.CMTimeScale timescale = timescale;
      rhs.CMTimeFlags flags = flags;
      rhs.CMTimeEpoch epoch = epoch;
      CMTime start = time2.start;
      CMTimeSubtract(&range.start, &rhs, &start);
      CMTimeFlags flags = range.start.flags;
      CMTimeScale timescale = range.start.timescale;
      *((void *)&v25 + 1) = range.start.value;
      CMTimeEpoch epoch = range.start.epoch;
      *(_OWORD *)&range.start.CMTimeValue value = v24;
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v25;
      range.duration.CMTimeScale timescale = timescale;
      range.duration.CMTimeFlags flags = flags;
      range.duration.CMTimeEpoch epoch = epoch;
      CMTimeRangeGetEnd(&rhs, &range);
      CMTime v20 = rhs;
    }
  }
  CMTimeRange range = v23;
  *(_OWORD *)&time2.start.CMTimeValue value = v24;
  *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
  time2.duration.CMTimeScale timescale = timescale;
  time2.duration.CMTimeFlags flags = flags;
  time2.duration.CMTimeEpoch epoch = epoch;
  CMTimeRangeGetIntersection(&v17, &range, &time2);
  if (v17.start.flags)
  {
    CMTimeRange range = v23;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
    time2.duration.CMTimeScale timescale = timescale;
    time2.duration.CMTimeFlags flags = flags;
    time2.duration.CMTimeEpoch epoch = epoch;
    CMTimeRangeGetIntersection(&v15, &range, &time2);
    if (v15.duration.flags)
    {
      CMTimeRange range = v23;
      *(_OWORD *)&time2.start.CMTimeValue value = v24;
      *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
      time2.duration.CMTimeScale timescale = timescale;
      time2.duration.CMTimeFlags flags = flags;
      time2.duration.CMTimeEpoch epoch = epoch;
      CMTimeRangeGetIntersection(&v14, &range, &time2);
      if (!v14.duration.epoch)
      {
        CMTimeRange range = v23;
        *(_OWORD *)&time2.start.CMTimeValue value = v24;
        *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
        time2.duration.CMTimeScale timescale = timescale;
        time2.duration.CMTimeFlags flags = flags;
        time2.duration.CMTimeEpoch epoch = epoch;
        CMTimeRangeGetIntersection(&v13, &range, &time2);
        if ((v13.duration.value & 0x8000000000000000) == 0)
        {
          CMTimeRange range = v23;
          *(_OWORD *)&time2.start.CMTimeValue value = v24;
          *(_OWORD *)&time2.start.CMTimeEpoch epoch = v25;
          time2.duration.CMTimeScale timescale = timescale;
          time2.duration.CMTimeFlags flags = flags;
          time2.duration.CMTimeEpoch epoch = epoch;
          CMTimeRangeGetIntersection(&v11, &range, &time2);
          CMTime time1 = v11.duration;
          *(_OWORD *)&range.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
          range.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          if (!CMTimeCompare(&time1, &range.start))
          {
            range.CMTime start = v20;
            *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
            time2.start.CMTimeEpoch epoch = v23.start.epoch;
            if (CMTimeCompare(&range.start, &time2.start) <= 0)
            {
              uint64_t result = 0;
              *a4 = 1;
              return result;
            }
            return 0;
          }
        }
      }
    }
  }
  if ((~flags & 5) == 0)
  {
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
    range.start.CMTimeEpoch epoch = v23.start.epoch;
    *(_OWORD *)&time2.start.CMTimeValue value = v24;
    time2.start.CMTimeEpoch epoch = v25;
    if (CMTimeCompare(&range.start, &time2.start) > 0) {
      return 0;
    }
  }
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
  range.start.CMTimeEpoch epoch = v23.start.epoch;
  *(_OWORD *)&time2.start.CMTimeValue value = v24;
  time2.start.CMTimeEpoch epoch = v25;
  uint64_t result = CMTimeCompare(&range.start, &time2.start);
  if (result)
  {
    if ((~v23.duration.flags & 5) == 0)
    {
      *(_OWORD *)&range.start.CMTimeValue value = v24;
      range.start.CMTimeEpoch epoch = v25;
      *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&v23.start.value;
      time2.start.CMTimeEpoch epoch = v23.start.epoch;
      if (CMTimeCompare(&range.start, &time2.start) > 0) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t AVFileNameWithExtensionThatAccordsWithUTI(void *a1, void *a2)
{
  if (!a2) {
    return (uint64_t)a1;
  }
  uint64_t v4 = [a1 pathExtension];
  if (v4) {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithFilenameExtension:", v4), "identifier");
  }
  if ([a2 isEqualToString:v4]) {
    return (uint64_t)a1;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", a2), "preferredFilenameExtension");
  if (!v5) {
    return (uint64_t)a1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = (void *)[a1 stringByDeletingPathExtension];
  return [v7 stringByAppendingPathExtension:v6];
}

uint64_t AVSerializedAtomDataFromFormatDescription(void *a1)
{
  values = a1;
  if (!a1) {
    return 0;
  }
  CFArrayRef v1 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
  if (!v1) {
    return 0;
  }
  CFArrayRef v2 = v1;
  if (FigRemote_CreateSerializedAtomDataForFormatDescriptions()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:0 length:0];
  }
  CFRelease(v2);
  return v3;
}

void *AVFormatDescriptionFromSerializedAtomData(void *a1)
{
  CFArrayRef v1 = a1;
  if (a1)
  {
    [a1 bytes];
    [v1 length];
    FigRemote_CreateFormatDescriptionArrayFromSerializedAtomData();
    return 0;
  }
  return v1;
}

void AVResetMediaServices()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avfoundation.settings", MEMORY[0x1E4F14430]);
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFArrayRef v2 = (void *)MEMORY[0x1E4F1CA80];
    if (audiomxd_enabled()) {
      uint64_t v3 = @"audiomxd";
    }
    else {
      uint64_t v3 = @"mediaserverd";
    }
    if (_os_feature_enabled_impl()) {
      uint64_t v4 = @"cameracaptured";
    }
    else {
      uint64_t v4 = @"mediaserverd";
    }
    uint64_t v5 = @"mediaplaybackd";
    if (FigRemote_ShouldConnectToMediaplaybackd()) {
      uint64_t v6 = @"mediaplaybackd";
    }
    else {
      uint64_t v6 = @"mediaserverd";
    }
    if (VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode()
      || VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode())
    {
      uint64_t v5 = @"videocodecd";
    }
    else if (!FigRemote_ShouldConnectToMediaplaybackd())
    {
      uint64_t v5 = @"mediaserverd";
    }
    uint64_t v7 = @"mediaparserd";
    if (!FigRemote_ShouldConnectToMediaparserdForFileParsing()
      && !FigRemote_ShouldConnectToMediaparserdFile_OptIn())
    {
      uint64_t v7 = @"mediaserverd";
    }
    long long v8 = objc_msgSend(v2, "setWithObjects:", @"mediaserverd", v3, v4, v6, v5, v7, 0);
    if ([v8 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __AVResetMediaServices_block_invoke;
            block[3] = &unk_1E57B1E80;
            void block[4] = v13;
            dispatch_async(v1, block);
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
    else
    {
      FigSignalErrorAt();
    }
    dispatch_release(v1);
  }
  else
  {
    FigSignalErrorAt();
  }
}

uint64_t __AVResetMediaServices_block_invoke(uint64_t a1)
{
  return softLinkSFTerminateProcessNamed(*(void *)(a1 + 32), 0, (uint64_t)&stru_1EE5953B8);
}

uint64_t initSFTerminateProcessNamed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (SettingsFoundationLibrary_sOnce != -1) {
    dispatch_once(&SettingsFoundationLibrary_sOnce, &__block_literal_global_70);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)SettingsFoundationLibrary_sLib, "SFTerminateProcessNamed");
  softLinkSFTerminateProcessNamed = v6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void *__SettingsFoundationLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/SettingsFoundation.framework/SettingsFoundation", 2);
  SettingsFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

void sub_194B58460(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B587B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5890C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B58A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B58BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B58D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B58EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDescriptorOutputDeviceImplCanSetEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_canSetEndpointVolumeDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]));
}

void AVFigRouteDescriptorOutputDeviceImplEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_volumeDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]));
}

void AVFigRouteDescriptorOutputDeviceImplEndpointVolumeControlTypeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_endpointVolumeControlTypeDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]));
}

void AVFigRouteDescriptorOutputDeviceImplEndpointMutedDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_mutedDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]));
}

void AVFigRouteDescriptorOutputDeviceImplEndpointCanMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_canMuteDidChangeForEndpointWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]));
}

void AVFigRouteDescriptorOutputDeviceImplEndpointRoomVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  objc_msgSend(a2, "_volumeForEndpointDidChange:forRoomID:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75850]));
}

void AVFigRouteDescriptorOutputDeviceImplRouteDescriptionEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, @"configUpdateReasonEndpointDescriptorChanged_RouteDescriptor");
  uint64_t v9 = CFDictionaryGetValue(a5, @"configUpdateReasonEndpointDescriptorChanged_RouteNotification");
  uint64_t v10 = CFDictionaryGetValue(a5, @"configUpdateReasonEndpointDescriptorChanged_RoutePayload");
  [a2 _routeDescriptionDidChange:Value];
  [a2 _handleRouteDescriptionEvent:v9 payload:v10];
}

void sub_194B5A354(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B5A484(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B5C3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5C964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5CA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5CD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5CF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5D170(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B5D2A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t AVOutputDeviceGetFigRouteDescriptor(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v4 = (void *)[a1 impl];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a1 = (void *)[v4 routeDescriptor];
    }
    else
    {
      uint64_t result = objc_msgSend(v3, "isEqual:", +[AVOutputDevice sharedLocalDevice](AVOutputDevice, "sharedLocalDevice"));
      if (!result) {
        return result;
      }
      a1 = 0;
    }
  }
  *a2 = a1;
  return 1;
}

__CFDictionary *AVCreateFigRouteDescriptorFromOutputDeviceDescription(void *a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if ([a1 deviceName]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F753F8], (const void *)[a1 deviceName]);
  }
  if ([a1 deviceID]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75420], (const void *)[a1 deviceID]);
  }
  return Mutable;
}

uint64_t AVSuccinctRouteDescriptorDescription(const __CFDictionary *a1)
{
  if (!a1) {
    return [NSString stringWithFormat:@"%@", 0, v4];
  }
  CFDictionaryRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E4F753F8]);
  return [NSString stringWithFormat:@"(name: %@, ID: %@)", Value, CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E4F75420])];
}

uint64_t AVSuccinctRouteDescriptorsDescription(const __CFArray *a1)
{
  CFArrayRef v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFIndex v3 = 0;
  if (!a1) {
    goto LABEL_3;
  }
LABEL_2:
  for (CFIndex i = CFArrayGetCount(a1); v3 < i; CFIndex i = 0)
  {
    ValueAtIndeCGFloat x = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v3);
    [v2 addObject:AVSuccinctRouteDescriptorDescription(ValueAtIndex)];
    ++v3;
    if (a1) {
      goto LABEL_2;
    }
LABEL_3:
    ;
  }
  return [v2 componentsJoinedByString:@", "];
}

void AVOutputDeviceRouteDiscovererServerDeathNotificationCallback(uint64_t a1, NSObject *a2)
{
  CFIndex v3 = (void *)MEMORY[0x199715AE0]();
  if (gAVOutputDeviceRouteDiscovererQueue == a2)
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      a2 = gAVOutputDeviceRouteDiscovererQueue;
    }
    dispatch_async(a2, &__block_literal_global_528);
  }
}

void __AVOutputDeviceRouteDiscovererServerDeathNotificationCallback_block_invoke()
{
  if (gAVOutputDeviceRouteDiscoverer_Screen)
  {
    CFRelease((CFTypeRef)gAVOutputDeviceRouteDiscoverer_Screen);
    gAVOutputDeviceRouteDiscoverer_Screen = 0;
  }
  if (gAVOutputDeviceRouteDiscoverer_AudioVideo)
  {
    CFRelease((CFTypeRef)gAVOutputDeviceRouteDiscoverer_AudioVideo);
    gAVOutputDeviceRouteDiscoverer_AudioVideo = 0;
  }
}

BOOL ErrorIsAVFoundationError(int a1)
{
  return (a1 + 11999) < 0xC8;
}

uint64_t ensureUserInfoDictionaryContainsObjectForKey(void *a1, uint64_t a2)
{
  if (a1)
  {
    CFIndex v3 = a1;
    if (![a1 objectForKey:@"AVErrorMediaTypeKey"])
    {
      CFIndex v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
      [v3 setObject:a2 forKey:@"AVErrorMediaTypeKey"];
    }
    return (uint64_t)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
    return [v5 dictionaryWithObject:a2 forKey:@"AVErrorMediaTypeKey"];
  }
}

uint64_t AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(signed int a1, void *a2, void *a3, int a4)
{
  uint64_t v6 = a2;
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  if (![a2 objectForKey:*MEMORY[0x1E4F28A50]])
  {
    if (!a3) {
      goto LABEL_9;
    }
    if (!a4
      || !objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", @"AVFoundationErrorDomain"))
    {
      goto LABEL_8;
    }
    do
    {
      if ([a3 code] != -11800) {
        break;
      }
      a3 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", v8);
    }
    while ((objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", @"AVFoundationErrorDomain") & 1) != 0);
    if (!a3)
    {
LABEL_9:
      uint64_t v9 = 0;
    }
    else
    {
LABEL_8:
      uint64_t v12 = v8;
      v13[0] = a3;
      uint64_t v9 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    uint64_t v10 = AVOSStatusToNSError(a1, v9);
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    [v6 setObject:v10 forKey:v8];
  }
  return AVLocalizedErrorWithUnderlyingOSStatus(a1, v6);
}

uint64_t AVErrorWithNSErrorAndOSStatus(uint64_t a1, signed int a2, void *a3)
{
  if (a1)
  {
    uint64_t v4 = a1;
    if (a3) {
      id v5 = (id)[a3 mutableCopy];
    }
    else {
      id v5 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    uint64_t v7 = v5;
    [v5 setObject:v4 forKey:*MEMORY[0x1E4F28A50]];
    uint64_t v8 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(a2, v7);
    if (!objc_msgSend((id)objc_msgSend(v8, "domain"), "isEqualToString:", @"AVFoundationErrorDomain")|| objc_msgSend(v8, "code") != -11800)
    {
      return (uint64_t)v8;
    }
    return v4;
  }
  else
  {
    return AVLocalizedErrorWithUnderlyingOSStatus(a2, a3);
  }
}

uint64_t AVErrorForClientProgrammingError(uint64_t a1)
{
  uint64_t v1 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:a1 forKey:@"AVErrorExceptionKey"];
  return AVLocalizedError(@"AVFoundationErrorDomain", -11999, v1);
}

void sub_194B5EC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B5EF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_194B5F688(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t metadataSupplierResourceLifeCycleCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 resourceLifeCycleHandler];
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_194B601F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__102(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__103(uint64_t a1)
{
}

uint64_t CMTagCollectionCreateWithVideoOutputPreset(const __CFAllocator *a1, int a2, CMTagCollectionRef *newCollectionOut)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    CFIndex v3 = (long long *)MEMORY[0x1E4F1F410];
    goto LABEL_5;
  }
  if (!a2)
  {
    CFIndex v3 = (long long *)MEMORY[0x1E4F1F420];
LABEL_5:
    long long v6 = *v3;
    CMTag tags = (CMTag)*MEMORY[0x1E4F1F3E0];
    long long v8 = v6;
    long long v4 = *MEMORY[0x1E4F1F408];
    long long v9 = *MEMORY[0x1E4F1F3E8];
    long long v10 = v4;
    return CMTagCollectionCreate(a1, &tags, 4, newCollectionOut);
  }
  return FigSignalErrorAt();
}

void figPlaybackItemTrackSampleBufferDidBecomeAvailable(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F33840]), "integerValue");
  objc_msgSend(a2, "_figPlaybackItemTrackSampleBufferDidBecomeAvailableForTrackID:extractionID:", v8, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F337A8]), "integerValue"));
}

void figPlaybackItemTrackResetSampleBufferExtraction(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F33840]), "integerValue");
  objc_msgSend(a2, "_figPlaybackItemTrackOutputSequenceWasFlushedForTrackID:extractionID:", v8, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F337A8]), "integerValue"));
}

uint64_t AVOutputDeviceFigListeningModeForAVFListeningMode(void *a1)
{
  if ([a1 isEqualToString:@"AVOutputDeviceBluetoothListeningModeNormal"]) {
    return 1;
  }
  if ([a1 isEqualToString:@"AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation"]) {
    return 2;
  }
  if ([a1 isEqualToString:@"AVOutputDeviceBluetoothListeningModeAudioTransparency"]) {
    return 3;
  }
  if (_os_feature_enabled_impl()
    && ([a1 isEqualToString:@"AVOutputDeviceBluetoothListeningModeAutomatic"] & 1) != 0)
  {
    return 4;
  }
  return 0;
}

uint64_t AVOutputDeviceSubTypeFromFigSubType(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if ([(id)result isEqualToString:*MEMORY[0x1E4F214F0]])
    {
      return 1;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F214F8]])
    {
      return 11;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F214E8]])
    {
      return 16;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F21500]])
    {
      return 17;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F214D0]])
    {
      return 12;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F214A8]])
    {
      return 13;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F214E0]])
    {
      return 18;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F21510]])
    {
      return 19;
    }
    else if ([v1 isEqualToString:@"EndpointSubType_visionOS"])
    {
      return 20;
    }
    else if (([v1 isEqualToString:*MEMORY[0x1E4F214B0]] & 1) != 0 {
           || ([v1 isEqualToString:*MEMORY[0x1E4F214C8]] & 1) != 0)
    }
    {
      return 15;
    }
    else if ([v1 isEqualToString:*MEMORY[0x1E4F214C0]])
    {
      return 15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t AVOutputDeviceNotificationFromFigNotification(uint64_t a1)
{
  if (AVOutputDeviceNotificationFromFigNotification_createFigToAVFNotificationMappingOnce != -1) {
    dispatch_once(&AVOutputDeviceNotificationFromFigNotification_createFigToAVFNotificationMappingOnce, &__block_literal_global_22);
  }
  uint64_t v2 = (void *)AVOutputDeviceNotificationFromFigNotification_figToAVFNotificationMapping;
  return [v2 objectForKey:a1];
}

uint64_t __AVOutputDeviceNotificationFromFigNotification_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", @"AVOutputDeviceScreenBecameAvailableNotification", *MEMORY[0x1E4F20410], @"AVOutputDeviceScreenBecameUnavailableNotification", *MEMORY[0x1E4F20418], @"AVOutputDeviceOwnsTurnByTurnNavigationChangedNotification", *MEMORY[0x1E4F20428], @"AVOutputDeviceiOSEntityHasMainAudioNotification", *MEMORY[0x1E4F20420], @"AVOutputDeviceVehicleHasMainAudioNotification", *MEMORY[0x1E4F20408], @"AVOutputDeviceNightModeChangedNotification", *MEMORY[0x1E4F20758], @"AVOutputDevicePerformanceReportPostedNotification", *MEMORY[0x1E4F20760], @"AVOutputDeviceMFiCertificateSerialNumberChangedNotification", *MEMORY[0x1E4F206D8], @"AVOutputDeviceCarPlayTestNotification",
             *MEMORY[0x1E4F206F8],
             @"AVOutputDeviceiOSUIRequestedNotification",
             *MEMORY[0x1E4F207B0],
             @"AVOutputDeviceSiriRequestedNotification",
             *MEMORY[0x1E4F20770],
             @"AVOutputDeviceLimitedUIChangedNotification",
             *MEMORY[0x1E4F20748],
             @"AVOutputDeviceUnhandledRemoteEventNotification",
             *MEMORY[0x1E4F20780],
             @"AVOutputDeviceVoiceTriggerModeChangedNotification",
             *MEMORY[0x1E4F202E8],
             0);
  AVOutputDeviceNotificationFromFigNotification_figToAVFNotificationMapping = result;
  return result;
}

uint64_t AVOutputDeviceElectronicTollCollectionStateFromVehicleInfo(void *a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v1 = (void *)[a1 valueForKey:*MEMORY[0x1E4F21598]];
  if (!v1) {
    return 1;
  }
  if (objc_msgSend((id)objc_msgSend(v1, "valueForKey:", @"active"), "BOOLValue")) {
    return 2;
  }
  return 3;
}

uint64_t AVOutputDeviceNavigationAidedDrivingStateFromVehicleInfo(void *a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v1 = (void *)[a1 valueForKey:*MEMORY[0x1E4F215A0]];
  if (!v1) {
    return 1;
  }
  if (objc_msgSend((id)objc_msgSend(v1, "valueForKey:", @"active"), "BOOLValue")) {
    return 2;
  }
  return 3;
}

uint64_t AVOutputDeviceTransportTypeFromFigTransportType()
{
  if (FigCFEqual()) {
    return 1;
  }
  if (FigCFEqual()) {
    return 2;
  }
  if (FigCFEqual() || FigCFEqual()) {
    return 3;
  }
  return 0;
}

uint64_t AVOutputDeviceSetDisplayCornerMasksEndpoint(uint64_t a1, uint64_t a2)
{
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  long long v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 56);
  if (!v6) {
    return 4294954514;
  }
  uint64_t v7 = *MEMORY[0x1E4F20DA0];
  return v6(CMBaseObject, v7, a2);
}

void *AVOutputDeviceAVOutputDeviceIconsFromOEMIcons(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = [[AVOutputDeviceIcon alloc] initWithDict:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
        [v2 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  return v2;
}

void *AVOutputDeviceAVOutputDeviceScreenInfoFromFigScreens(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a1);
        }
        uint64_t v7 = [[AVOutputDeviceScreenInfo alloc] initWithDict:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
        [v2 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  return v2;
}

void *AVOutputDeviceMakeAVOutputDeviceHIDsFromFigHIDs(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = a1;
  uint64_t v5 = [a1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F20598];
    uint64_t v9 = *MEMORY[0x1E4F20590];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v11 = -[AVOutputDeviceHID initWithUUID:screenUUID:endpoint:]([AVOutputDeviceHID alloc], "initWithUUID:screenUUID:endpoint:", [*(id *)(*((void *)&v14 + 1) + 8 * v10) objectForKey:v8], objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "objectForKey:", v9), a2);
        [v4 addObject:v11];

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v4;
}

uint64_t AVOutputDeviceAuthenticationTypeFromFigAuthenticationType()
{
  if (FigCFEqual()) {
    return 1;
  }
  else {
    return 2 * (FigCFEqual() != 0);
  }
}

uint64_t AVOutputDeviceRequestViewAreaForFigEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294950576;
  }
  FigEndpointExtendedGetClassID();
  if (!CMBaseObjectIsMemberOfClass()) {
    return 4294950576;
  }
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 112);
  if (!v9) {
    return 4294954514;
  }
  return v9(a1, a2, a3);
}

uint64_t AVOutputDeviceRequestCarUIForEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294950576;
  }
  FigEndpointExtendedGetClassID();
  if (!CMBaseObjectIsMemberOfClass()) {
    return 4294950576;
  }
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8);
  if (!v9) {
    return 4294954514;
  }
  return v9(a1, a2, a3);
}

uint64_t AVOutputDeviceTakeScreenForClient(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294950576;
  }
  FigEndpointExtendedGetClassID();
  if (!CMBaseObjectIsMemberOfClass()) {
    return 4294950576;
  }
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  if (!v9) {
    return 4294954514;
  }
  return v9(a1, a2, a3);
}

uint64_t AVOutputDeviceSetAlternateSiriOnEndpoint(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
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
  uint64_t v7 = *MEMORY[0x1E4F20CE8];
  uint64_t v8 = *v2;
  return v6(CMBaseObject, v7, v8);
}

id AVOutputDeviceGetCurrentScreenViewAreaFromEndpoint(void *a1, uint64_t a2)
{
  uint64_t v8 = 0;
  if (a1)
  {
    uint64_t v3 = a1;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass()
      && ((uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 24)) == 0 ? (v5 = 0) : (v5 = v4),
          (uint64_t v6 = *(void (**)(void *, uint64_t, void **))(v5 + 120)) != 0))
    {
      v6(v3, a2, &v8);
      a1 = v8;
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

id AVOutputDeviceGetDisplayCornerMasksFromEndpoint()
{
  uint64_t v6 = 0;
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v1 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v1) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void (**)(uint64_t, void, void, void **))(v2 + 48);
  if (v3)
  {
    v3(CMBaseObject, *MEMORY[0x1E4F20DA0], *MEMORY[0x1E4F1CF80], &v6);
    uint64_t v4 = v6;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t AVOutputDeviceGetSiriRequestedActionFromFigAction()
{
  if (FigCFEqual()) {
    return 0;
  }
  if (FigCFEqual()) {
    return 2;
  }
  if (FigCFEqual()) {
    return 1;
  }
  return 3;
}

void AVFigEndpointOutputDeviceImplCanSetEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canSetEndpointVolumeDidChangeForEndpointWithID:", Value, v10, v11);
}

void AVFigEndpointOutputDeviceImplEndpointVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_volumeDidChangeForEndpointWithID:", Value, v10, v11);
}

void AVFigEndpointOutputDeviceImplEndpointVolumeControlTypeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_endpointVolumeControlTypeDidChangeForEndpointWithID:", Value, v10, v11);
}

void AVFigEndpointOutputDeviceImplEndpointMutedDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_mutedDidChangeForEndpointWithID:", Value, v10, v11);
}

void AVFigEndpointOutputDeviceImplEndpointCanMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canMuteDidChangeForEndpointWithID:", Value, v10, v11);
}

void AVFigEndpointOutputDeviceImplEndpointRoomVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E0]);
  objc_msgSend(a2, "_volumeForEndpointDidChange:forRoomID:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75850]));
}

uint64_t AVOutputDeviceSetAllowsHeadTrackedSpatialAudioOnEndpoint(uint64_t a1, int a2)
{
  uint64_t v2 = *MEMORY[0x1E4F20CE0];
  if (a2) {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v4 = *v3;
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v9) {
    return v9(CMBaseObject, v2, v4);
  }
  else {
    return 4294954514;
  }
}

uint64_t AVOutputDeviceSetHeadTrackedSpatialAudioModeOnEndpoint(uint64_t a1, void *a2)
{
  if (([a2 isEqualToString:AVOutputDeviceHeadTrackedSpatialAudioModeNever] & 1) == 0
    && ([a2 isEqualToString:AVOutputDeviceHeadTrackedSpatialAudioModeAlways] & 1) == 0
    && ([a2 isEqualToString:AVOutputDeviceHeadTrackedSpatialAudioModeAutomatic] & 1) == 0
    && ![a2 isEqualToString:AVOutputDeviceHeadTrackedSpatialAudioModeMultichannelOnly])
  {
    return 0;
  }
  uint64_t SInt32 = FigCFNumberCreateSInt32();
  if (!SInt32) {
    return 0;
  }
  uint64_t v4 = (const void *)SInt32;
  uint64_t v5 = *MEMORY[0x1E4F20E28];
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, const void *))(v9 + 56);
  if (v10) {
    uint64_t v11 = v10(CMBaseObject, v5, v4);
  }
  else {
    uint64_t v11 = 4294954514;
  }
  CFRelease(v4);
  return v11;
}

uint64_t AVOutputDeviceSetSecondDisplayEnabledOnEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  uint64_t v7 = @"disable";
  if (a3) {
    uint64_t v7 = @"enable";
  }
  uint64_t v8 = [NSString stringWithFormat:@"Output device %@ screen %@", a2, v7];
  if (!a1 || (FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass())) {
    a1 = 0;
  }
  if (a3)
  {
    if (dword_1EB2D3A40)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    if (v13) {
      return v13(a1, v6, v8);
    }
  }
  else
  {
    if (dword_1EB2D3A40)
    {
      uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 24);
    if (v13) {
      return v13(a1, v6, v8);
    }
  }
  return 4294954514;
}

void AVOutputDeviceSetSecondDisplayModeOnEndpoint(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1 || (FigEndpointExtendedGetClassID(), uint64_t v6 = a1, !CMBaseObjectIsMemberOfClass())) {
    uint64_t v6 = 0;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t v8 = [[AVFigEndpointSecondDisplayModeToken alloc] initWithEndpoint:a1];
  [a2 isEqualToString:@"AVOutputDeviceSecondDisplayModeDefault"];
  FigCFDictionarySetInt64();
  uint64_t v9 = (void *)MEMORY[0x1E4F21240];
  if (dword_1EB2D3A40)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __AVOutputDeviceSetSecondDisplayModeOnEndpoint_block_invoke;
  v17[3] = &unk_1E57B5EE8;
  v17[4] = v8;
  v17[5] = a3;
  uint64_t v11 = objc_msgSend(v17, "copy", v15, v16);
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  long long v14 = *(void (**)(uint64_t, void, CFMutableDictionaryRef, void (*)(uint64_t, uint64_t, uint64_t, void (**)(void)), uint64_t))(v13 + 72);
  if (v14) {
    v14(v6, *v9, Mutable, AVOutputDeviceEndpointSendCommandCompleted, v11);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
}

void AVOutputDeviceSetMediaRemoteDataOnEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1 || (uint64_t v4 = a1, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass())) {
    uint64_t v4 = 0;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  FigCFDictionarySetValue();
  uint64_t v6 = (void *)MEMORY[0x1E4F21238];
  if (dword_1EB2D3A40)
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __AVOutputDeviceSetMediaRemoteDataOnEndpoint_block_invoke;
  v14[3] = &unk_1E57B5EC0;
  void v14[4] = a3;
  uint64_t v8 = objc_msgSend(v14, "copy", v12, v13);
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void (**)(uint64_t, void, CFMutableDictionaryRef, void (*)(uint64_t, uint64_t, uint64_t, void (**)(void)), uint64_t))(v10 + 72);
  if (v11) {
    v11(v4, *v6, Mutable, AVOutputDeviceEndpointSendCommandCompleted, v8);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void AVOutputDeviceEndpointSendCommandCompleted(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void))
{
  a4[2](a4);
}

uint64_t __AVOutputDeviceSetMediaRemoteDataOnEndpoint_block_invoke(uint64_t a1, signed int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t AVOutputDeviceSuggestUIWithURLSAndCompletionHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!a1 || (uint64_t v5 = a1, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass())) {
    uint64_t v5 = 0;
  }
  uint64_t v20 = @"urls";
  v21[0] = a2;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  if (dword_1EB2D3A40)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __AVOutputDeviceSuggestUIWithURLSAndCompletionHandler_block_invoke;
  v17[3] = &unk_1E57B5EC0;
  v17[4] = a3;
  uint64_t v8 = objc_msgSend(v17, "copy", v15, v16);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  long long v14 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, void (**)(void)), uint64_t))(v13 + 72);
  if (v14) {
    return v14(v5, @"suggestUI", v6, AVOutputDeviceEndpointSendCommandCompleted, v8);
  }
  return result;
}

uint64_t __AVOutputDeviceSuggestUIWithURLSAndCompletionHandler_block_invoke(uint64_t a1, signed int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t AVOutputDevicePerformHapticFeedback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (!a1 || (uint64_t v7 = a1, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass())) {
    uint64_t v7 = 0;
  }
  v22[0] = @"uuid";
  v22[1] = @"hapticFeedbackType";
  v23[0] = a2;
  v23[1] = a3;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  if (dword_1EB2D3A40)
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __AVOutputDevicePerformHapticFeedback_block_invoke;
  v19[3] = &unk_1E57B5EC0;
  v19[4] = a4;
  uint64_t v10 = objc_msgSend(v19, "copy", v17, v18);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v14 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v13 = v14;
  if (v14) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t, void (*)(uint64_t, uint64_t, uint64_t, void (**)(void)), uint64_t))(v15 + 72);
  if (v16) {
    return v16(v7, @"performHapticFeedback", v8, AVOutputDeviceEndpointSendCommandCompleted, v10);
  }
  return result;
}

uint64_t __AVOutputDevicePerformHapticFeedback_block_invoke(uint64_t a1, signed int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __AVOutputDeviceSetSecondDisplayModeOnEndpoint_block_invoke(uint64_t a1, signed int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v3 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v5 = v2;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v3 = 0;
  }
  return v4(v5, v6, v3);
}

uint64_t AVOutputDeviceImplChangeVolumeByCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v10 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, float))(v11 + 56);
  if (v12) {
    return v12(a1, a2, (float)a3);
  }
  return result;
}

uint64_t AVOutputDeviceImplChangeRoomVolumeForEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, float))(v13 + 208);
  if (v14) {
    return v14(a1, a2, a3, a4);
  }
  return result;
}

BOOL AVOutputDeviceImplCanMuteForEndpointID(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, char *))(v6 + 192);
  if (!v7) {
    return 0;
  }
  v7(a1, a2, &v9);
  return v9 != 0;
}

uint64_t AVOutputDeviceImplSetMutedForEndpointID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v10 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 152);
  if (v12) {
    return v12(a1, a2, a3);
  }
  return result;
}

uint64_t AVOutputDeviceGetFigEndpoint(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v4 = (void *)[a1 figEndpointOutputDeviceImpl];
    if (v4)
    {
      a1 = (void *)[v4 figEndpoint];
    }
    else
    {
      uint64_t result = objc_msgSend(v3, "isEqual:", +[AVOutputDevice sharedLocalDevice](AVOutputDevice, "sharedLocalDevice"));
      if (!result) {
        return result;
      }
      a1 = 0;
    }
  }
  *a2 = a1;
  return 1;
}

uint64_t AVSuccinctEndpointDescription(uint64_t a1)
{
  CFTypeRef v16 = 0;
  CFTypeRef cf = 0;
  if (!a1) {
    return [NSString stringWithFormat:@"%@", 0];
  }
  uint64_t v1 = *MEMORY[0x1E4F1CF80];
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, CFTypeRef *))(v4 + 48);
  if (v6)
  {
    uint64_t v7 = v6(CMBaseObject, *MEMORY[0x1E4F20F28], v1, &cf);
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = 4294954514;
  }
  CFTypeRef v8 = (CFTypeRef)objc_msgSend(NSString, "stringWithFormat:", @"(error %d)", v7);
  if (v8) {
    CFTypeRef v8 = CFRetain(v8);
  }
  CFTypeRef cf = v8;
LABEL_13:
  uint64_t v9 = FigEndpointGetCMBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, void, uint64_t, CFTypeRef *))(v11 + 48);
  if (!v12)
  {
    uint64_t v13 = 4294954514;
    goto LABEL_20;
  }
  uint64_t v13 = v12(v9, *MEMORY[0x1E4F20E38], v1, &v16);
  if (v13)
  {
LABEL_20:
    CFTypeRef v14 = (CFTypeRef)objc_msgSend(NSString, "stringWithFormat:", @"(error %d)", v13);
    if (v14) {
      CFTypeRef v14 = CFRetain(v14);
    }
    CFTypeRef v16 = v14;
    goto LABEL_23;
  }
  CFTypeRef v14 = v16;
LABEL_23:
  uint64_t v15 = [NSString stringWithFormat:@"(name: %@, ID: %@)", cf, v14];
  if (cf) {
    CFRelease(cf);
  }
  if (v16) {
    CFRelease(v16);
  }
  return v15;
}

uint64_t AVSuccinctEndpointsDescription(const __CFArray *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFIndex v3 = 0;
  if (!a1) {
    goto LABEL_3;
  }
LABEL_2:
  for (CFIndex i = CFArrayGetCount(a1); v3 < i; CFIndex i = 0)
  {
    ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(a1, v3);
    [v2 addObject:AVSuccinctEndpointDescription((uint64_t)ValueAtIndex)];
    ++v3;
    if (a1) {
      goto LABEL_2;
    }
LABEL_3:
    ;
  }
  return [v2 componentsJoinedByString:@", "];
}

void AVFigEndpointOutputDeviceImplFigEndpointNotification(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFTypeRef v8 = (void *)MEMORY[0x199715AE0]();
  [a2 _handleFigEndpointEvent:a3 payload:a5];
}

void FigCFRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CFTypeRef FigCFRetain(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void sub_194B6A1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figCustomURLHandlerHandleRequestForNSURLSession(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void, uint64_t), uint64_t a6)
{
  uint64_t v11 = (void *)MEMORY[0x199715AE0]();
  unsigned __int8 v13 = 0;
  uint64_t v12 = [a1 _handleRequest:a3 requestID:a4 canHandleRequestOut:&v13];
  a5(a6, v13, v12);
}

uint64_t figCustomURLHandlerRequestCancelledForNSURLSession(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [a1 _cancelRequestID:a4];
}

uint64_t figCustomURLHandlerHandleRequestForNSURLProtocol(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  uint64_t v7 = objc_msgSend(a1, "_handleRequest:requestID:");
  return a5(a6, 1, v7);
}

uint64_t figCustomURLHandlerRequestCancelledForNSURLProtocol(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [a1 _cancelRequestID:a4];
}

void SetHeaderFieldToCFHTTPMessageApplierFunc(CFStringRef headerField, CFStringRef value, CFHTTPMessageRef message)
{
}

const void *AVNSURLProtocolWillCopyAndSendRequest(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  char v5 = objc_msgSend((id)objc_msgSend(a4, "bridge"), "_willSendRequest:request:redirectionResponse:", a4, a2, a3);
  uint64_t result = 0;
  if (a2)
  {
    if ((v5 & 1) == 0)
    {
      CFRetain(a2);
      return a2;
    }
  }
  return result;
}

uint64_t AVNSURLProtocolDidReceiveResponse(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = (void *)[a3 bridge];
  return [v5 _didReceiveResponse:a3 response:a2];
}

uint64_t AVNSURLProtocolDidReceiveData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)[a4 bridge];
  return [v6 _didReceiveData:a4 data:a2];
}

void *AVNSURLProtocolDidFinishLoading(uint64_t a1, void *a2)
{
  uint64_t result = (void *)[a2 bridge];
  if (result)
  {
    [result reportSuccessfulURLLoad];
    uint64_t v4 = (void *)[a2 bridge];
    return (void *)[v4 _didFinish:a2 error:0];
  }
  return result;
}

uint64_t AVNSURLProtocolDidFail(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = (void *)[a3 bridge];
  return [v5 _didFinish:a3 error:a2];
}

uint64_t figCustomURLHandlerHandleAuthenticationChallenge(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, void, uint64_t), uint64_t a6)
{
  unsigned __int8 v10 = 0;
  uint64_t v8 = [a1 _handleAuthChallenge:a3 requestID:a4 canHandleRequestOut:&v10];
  return a5(a6, v10, v8);
}

uint64_t avacu_getLengthsfromContentRange(uint64_t a1, uint64_t *a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F28FE8] scannerWithString:a1];
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  [v7 scanString:@"bytes" intoString:&v14];
  if (!v14) {
    return 0;
  }
  uint64_t result = [v7 scanUnsignedLongLong:&v13];
  if (!result) {
    return result;
  }
  [v7 scanString:@"-" intoString:&v14];
  if (!v14)
  {
    char v10 = 0;
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t result = [v7 scanUnsignedLongLong:&v12];
  if (!result) {
    return result;
  }
  if (v12 < v13) {
    return 0;
  }
  uint64_t v9 = v12 - v13 + 1;
  [v7 scanString:@"/" intoString:&v14];
  if (v14)
  {
    char v10 = [v7 scanUnsignedLongLong:&v11];
    if ((v10 & 1) == 0)
    {
      uint64_t result = objc_msgSend(v7, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"*"), 0);
      if (!result) {
        return result;
      }
    }
    uint64_t result = [v7 isAtEnd];
    if (!result) {
      return result;
    }
  }
  else
  {
    char v10 = 0;
  }
LABEL_10:
  if (a2) {
    *a2 = v9;
  }
  if (a3) {
    *a3 = v11;
  }
  if (a4) {
    *a4 = v10;
  }
  return 1;
}

CGFloat AVOutputDeviceViewAreaInfoNSRectFromDictionary(const __CFDictionary *a1)
{
  memset(&v3, 0, sizeof(v3));
  if (!CGRectMakeWithDictionaryRepresentation(a1, &v3))
  {
    CGSize v1 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v3.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v3.size = v1;
  }
  return v3.origin.x;
}

void __AVOutputContextIsSystemContextAllowed_block_invoke()
{
  id v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (v0)
  {
    CGSize v1 = v0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.avfoundation.allow-system-wide-context", 0);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID()) {
        AVOutputContextIsSystemContextAllowed_isAllowed = CFBooleanGetValue(v3) != 0;
      }
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

void sub_194B70790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B70F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B74714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B74C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B74D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B75440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSystemRemotePoolOutputDeviceCommunicationChannelManagerDidReceiveData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755C0]);
  uint64_t v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755F0]);
  objc_msgSend(a2, "_didReceiveData:fromDeviceWithID:fromChannelWithUUID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755E8]), v9, Value);
}

void AVSystemRemotePoolOutputDeviceCommunicationChannelManagerDidCloseCommChannel(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755C0]);
  objc_msgSend(a2, "_didCloseCommChannelWithUUID:forDeviceWithID:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755F0]));
}

void sub_194B758A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194B76480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B767EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSystemRemotePoolOutputDeviceCommunicationChannelSendDataCompletion(uint64_t a1, uint64_t a2, signed int a3, void (**a4)(void, void))
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A40)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a3)
  {
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  if (a4) {
LABEL_5:
  }
    a4[2](a4, v8);
LABEL_6:
}

void sub_194B77094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B77170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B77768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B77808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVMutableMovieTrack;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_194B7793C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void mutableMovieTrackNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  id v9 = a2;
  if (v9)
  {
    if (a3)
    {
      int v10 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F32468]);
      if (a5)
      {
        if (v10)
        {
          uint64_t v11 = [a5 objectForKey:*MEMORY[0x1E4F32168]];
          unint64_t v12 = v11;
          if (v11
            && (([v11 isEqualToString:*MEMORY[0x1E4F324C8]] & 1) != 0
             || ([v12 isEqualToString:*MEMORY[0x1E4F324D0]] & 1) != 0
             || [v12 isEqualToString:*MEMORY[0x1E4F32498]]))
          {
            [v9 _signalMetadataUpdated];
          }
        }
      }
    }
  }
}

void sub_194B77A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B77B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B77B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B77C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B78C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B79284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B7940C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B79524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B79B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7A19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7A520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7ABC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7B2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7B5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7BB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7BCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194B7BE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B7C01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194B7C200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t AVMediaSubtypesForAC3()
{
  id v0 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1633889587];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1885430579];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:2053202739];
  return objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", 1902207795), 0);
}

uint64_t AVMediaSubtypesForEnhancedAC3()
{
  id v0 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v1 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1700998451];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1885692723];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:2053464883];
  return objc_msgSend(v0, "arrayWithObjects:", v1, v2, v3, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", 1902469939), 0);
}

uint64_t AVMediaTypesForCaptionEditing()
{
  v1[2] = *MEMORY[0x1E4F143B8];
  v1[0] = @"text";
  v1[1] = @"clcp";
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:2];
}

void *AVSampleBufferGenerator_remapSampleBufferTiming(void *result, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  if (result)
  {
    memset(&v4[1], 0, sizeof(CMTime));
    [result overrideTime];
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v4[0] = v4[1];
      return (void *)CMSampleBufferSetOutputPresentationTimeStamp(a3, v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_194B7D1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void AVSampleBufferGenerator_dataBecameReady(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)MEMORY[0x199715AE0]();
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__26;
  unint64_t v12 = __Block_byref_object_dispose__26;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AVSampleBufferGenerator_dataBecameReady_block_invoke;
  v7[3] = &unk_1E57B4010;
  v7[4] = &v8;
  void v7[5] = a4;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, v7);
  uint64_t v6 = v9[5];
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 1, 0);
  }
  _Block_object_dispose(&v8, 8);
}

void sub_194B7D370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSampleBufferGenerator_dataFailed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  CFTypeRef v16 = __Block_byref_object_copy__26;
  uint64_t v17 = __Block_byref_object_dispose__26;
  uint64_t v18 = 0;
  signed int valuePtr = 0;
  if (a5)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F1F3A0]);
    if (Value) {
      CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AVSampleBufferGenerator_dataFailed_block_invoke;
  block[3] = &unk_1E57B4010;
  void block[4] = &v13;
  void block[5] = a4;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, block);
  uint64_t v9 = v14[5];
  if (v9)
  {
    uint64_t v10 = AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v9, 0, v10);
  }
  _Block_object_dispose(&v13, 8);
}

void sub_194B7D4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVSampleBufferGeneratorBatch_BatchCompleted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__26;
  uint64_t v18 = __Block_byref_object_dispose__26;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __AVSampleBufferGeneratorBatch_BatchCompleted_block_invoke;
  _OWORD v9[3] = &unk_1E57B4B60;
  v9[4] = a2;
  v9[5] = &v14;
  v9[6] = &v10;
  v9[7] = a4;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGeneratorBatch_DispatchQueue, v9);
  if (v15[5])
  {
    int v7 = *((_DWORD *)v11 + 6);
    if (v7 == 3)
    {
      uint64_t v8 = -11881;
    }
    else
    {
      if (v7 != 4)
      {
LABEL_7:
        (*(void (**)(void))(v15[5] + 16))();

        goto LABEL_8;
      }
      uint64_t v8 = -11878;
    }
    AVLocalizedError(@"AVFoundationErrorDomain", v8, 0);
    goto LABEL_7;
  }
LABEL_8:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

void sub_194B7DCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194B82450(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194B834E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B835FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B83BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void avWaitForNotificationOrDeallocationOperationNotificationHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  if ([a2 _monitoredObject] == a4) {
    [a2 _signalMonitoringIsFinishedIfNeeded];
  }
}

uint64_t ___avDepartureAnnouncingObjectMonitorAnnounceDeparture_block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) referencedObject];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [v1 monitoredObjectHasDeparted];
  }
  return result;
}

void handlePlaybackItemNotification(uint64_t a1, void *a2, const void *a3, uint64_t a4, const void *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a2 _loadingMutex];
  uint64_t v9 = (void *)MEMORY[0x199715AE0]();
  MEMORY[0x199715030](v8);
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33590]))
  {
    unsigned int valuePtr = 0;
    if (!a5) {
      goto LABEL_9;
    }
    CFTypeID v10 = CFGetTypeID(a5);
    if (v10 != CFDictionaryGetTypeID()) {
      goto LABEL_9;
    }
    CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F337F0]);
    if (Value)
    {
      CFGetTypeID(Value);
      CFArrayGetTypeID();
    }
    CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F33818]);
    if (v12 && (CFNumberRef v13 = v12, v14 = CFGetTypeID(v12), v14 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v13, kCFNumberSInt32Type, &valuePtr);
      uint64_t v15 = valuePtr;
    }
    else
    {
LABEL_9:
      uint64_t v15 = 0;
    }
    [a2 _updateStatusWhileMutexLocked:3 figErrorCode:v15];
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33640]))
  {
    [a2 _updateStatusWhileMutexLocked:2 figErrorCode:0];
    if (a5)
    {
      CFTypeID v21 = CFGetTypeID(a5);
      if (v21 == CFDictionaryGetTypeID())
      {
        CMTime v22 = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F337F0]);
        if (v22)
        {
          CFGetTypeID(v22);
          CFArrayGetTypeID();
        }
      }
    }
  }
  uint64_t v16 = (void *)[a2 _getAndPruneCompletionsWhileMutexLocked];
  MEMORY[0x199715040](v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * v20++) + 16))();
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

void __getDictionaryOfSpecialLoadingMethodsForKeys_block_invoke()
{
  if (!getDictionaryOfSpecialLoadingMethodsForKeys_sSpecialLoadingMethodsForKeys) {
    getDictionaryOfSpecialLoadingMethodsForKeys_sSpecialLoadingMethodsForKeys = (uint64_t)(id)[MEMORY[0x1E4F1C9E8] dictionary];
  }
}

void __getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_block_invoke()
{
  if (!getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_sSpecialPlaybackItemGettersForKeyValueStatus)
  {
    uint64_t v1 = sel__statusOfValueForKeyThatIsAlwaysLoaded;
    uint64_t v0 = [MEMORY[0x1E4F29238] value:&v1 withObjCType:":"];
    getDictionaryOfSpecialPlaybackItemGettersForKeyValueStatus_sSpecialPlaybackItemGettersForKeyValueStatus = (uint64_t)(id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"URL", v0, @"assetCache", v0, @"shouldMatchDataInCacheByURLPathComponentOnly", v0, @"shouldMatchDataInCacheByURLWithoutQueryComponent", v0, @"cacheKey", v0, @"downloadDestinationURL", v0, @"downloadToken", v0, @"isProxy", 0);
  }
}

BOOL __handleFigAssetLoadingNotification_block_invoke_529(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 count] < 2;
}

uint64_t dictionaryOfFigAssetTrackPropertiesForTrackKeys(int a1)
{
  if (dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce != -1) {
    dispatch_once(&dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce, &__block_literal_global_31);
  }
  uint64_t v2 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys;
  if (!a1) {
    uint64_t v2 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys;
  }
  return *v2;
}

uint64_t __dictionaryOfFigAssetTrackPropertiesForTrackKeys_block_invoke()
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v42 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v41 = [MEMORY[0x1E4F1C978] array];
  uint64_t v40 = [MEMORY[0x1E4F1C978] array];
  uint64_t v39 = [MEMORY[0x1E4F1C978] array];
  uint64_t v0 = *MEMORY[0x1E4F34868];
  uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34868], 0);
  uint64_t v1 = *MEMORY[0x1E4F324B0];
  uint64_t v37 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F324B0], 0);
  uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F324A8], 0);
  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v1, 0);
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34870], 0);
  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34880], 0);
  uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34900], 0);
  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348F8], 0);
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348B8], 0);
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348B0], 0);
  uint64_t v28 = [MEMORY[0x1E4F1C978] array];
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348D0], 0);
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34858], 0);
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348E0], 0);
  uint64_t v2 = *MEMORY[0x1E4F34888];
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34888], 0);
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348A8], 0);
  uint64_t v3 = *MEMORY[0x1E4F34860];
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34860], 0);
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348C8], 0);
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34850], 0);
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348E8], 0);
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34908], 0);
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348A0], 0);
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348D8], 0);
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348C0], 0);
  uint64_t v4 = *MEMORY[0x1E4F324B8];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F324B8], 0);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32480], 0);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32490], 0);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34840], 0);
  uint64_t v5 = *MEMORY[0x1E4F34838];
  uint64_t v6 = *MEMORY[0x1E4F324D0];
  uint64_t v7 = *MEMORY[0x1E4F324C8];
  uint64_t v8 = *MEMORY[0x1E4F32498];
  uint64_t v9 = *MEMORY[0x1E4F32488];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34838], *MEMORY[0x1E4F324D0], *MEMORY[0x1E4F324C8], *MEMORY[0x1E4F32498], *MEMORY[0x1E4F32488], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v5, v6, v7, v8, v9, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34890], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34830], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34848], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F348F0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34878], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v2, v3, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v0, 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v0, 0);
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F324D8], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F324C0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F324E0], 0);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F32470], 0);
  [MEMORY[0x1E4F1C978] array];
  [MEMORY[0x1E4F1C978] array];
  dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys = (uint64_t)(id)objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v41, @"asset", v40, @"trackID", v39, @"mediaType", v38, @"formatDescriptions", v37, @"playable", v36, @"decodable", v35, @"playabilityValidationResult", v34, @"enabled", v33, @"selfContained", v32, @"totalSampleDataLength", v31, @"timeRange", v30, @"mediaPresentationTimeRange", v29, @"mediaDecodeTimeRange", v28, @"requiresFrameReordering", v27, @"naturalTimeScale", v26, @"estimatedDataRate", v25, @"peakDataRate", v24, @"languageCode", v23, @"mediaCharacteristics", v22, @"extendedLanguageTag", v21, @"naturalSize", v20, @"dimensions", v19, @"preferredTransform", v18, @"preferredVolume", v17, @"loudnessInfo", v16, @"nominalFrameRate", v15, @"minFrameDuration", v14, @"segments", v13, @"segmentsExcludeAudioPrimingAndRemainderDurations", v12, @"gaplessSourceTimeRange", v11);
  dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys = (uint64_t)(id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys];
  v43[0] = *MEMORY[0x1E4F32478];
  return objc_msgSend((id)dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 1), @"segments");
}

void handleFigAssetTrackNotification(uint64_t a1, void *a2, const void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a2 _loadingMutex];
  int v10 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F32460]);
  uint64_t v11 = 0;
  if (a5 && v10)
  {
    CFTypeID v12 = CFGetTypeID(a5);
    if (v12 == CFDictionaryGetTypeID())
    {
      CFNumberRef Value = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E4F32138]);
      uint64_t v11 = v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __handleFigAssetTrackNotification_block_invoke;
      _OWORD v18[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v18[4] = Value;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  MEMORY[0x199715030](v9);
  uint64_t v14 = (void *)[a2 _loadingBatches];
  uint64_t v15 = v14;
  if (v11) {
    [v14 enumerateObjectsUsingBlock:v11];
  }
  uint64_t v16 = [v15 indexesOfObjectsPassingTest:&__block_literal_global_442];
  uint64_t v17 = [v15 objectsAtIndexes:v16];
  [v15 removeObjectsAtIndexes:v16];
  MEMORY[0x199715040](v9);
  [a2 _invokeCompletionHandlerForLoadingBatches:v17];
}

void handleFigAssetNotification(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EE8]))
  {
    uint64_t v6 = [a2 _loadingMutex];
    MEMORY[0x199715030]();
    uint64_t v7 = (void *)[a2 _loadingBatches];
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
    [v7 removeAllObjects];
    MEMORY[0x199715040](v6);
    [a2 _invokeCompletionHandlerForLoadingBatches:v8];
  }
}

uint64_t __handleFigAssetTrackNotification_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 objectForKey:0x1EE5A3478];
  uint64_t result = FigCFEqual();
  if (result)
  {
    uint64_t result = [a2 removeObjectForKey:0x1EE5A3478];
    *a4 = 1;
  }
  return result;
}

BOOL __handleFigAssetTrackNotification_block_invoke_2(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 count] < 2;
}

uint64_t AVFullMethodName(objc_class *a1, const char *a2)
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = v4;
  uint64_t v6 = NSString;
  if (v4) {
    uint64_t v7 = (__CFString *)NSStringFromClass(v4);
  }
  else {
    uint64_t v7 = @"Nil";
  }
  int v10 = NSStringFromSelector(a2);
  uint64_t v8 = 45;
  if (v5 == a1) {
    uint64_t v8 = 43;
  }
  return [v6 stringWithFormat:@"%c[%@ %@]", v8, v7, v10];
}

uint64_t AVFullMethodNameFromClass(objc_class *a1, const char *a2)
{
  uint64_t v4 = NSString;
  Method ClassMethod = class_getClassMethod(a1, a2);
  if (a1) {
    uint64_t v6 = (__CFString *)NSStringFromClass(a1);
  }
  else {
    uint64_t v6 = @"Nil";
  }
  uint64_t v9 = NSStringFromSelector(a2);
  uint64_t v7 = 43;
  if (!ClassMethod) {
    uint64_t v7 = 45;
  }
  return [v4 stringWithFormat:@"%c[%@ %@]", v7, v6, v9];
}

uint64_t AVRequestConcreteImplementation(objc_class *a1, const char *a2, objc_class *a3)
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  if (v6 == a3) {
    return [MEMORY[0x1E4F1CA00] raise:v9, @"*** -%@ cannot be sent to an abstract object of class %@: Create a concrete instance!", v8, v7 format];
  }
  else {
    return [MEMORY[0x1E4F1CA00] raise:v9, @"*** -%@ only defined for abstract class.  Define %@!", v8, AVFullMethodName(a1, a2) format];
  }
}

__CFString *AVLocalizedStringFromTableWithLocale(uint64_t a1, uint64_t a2, void *a3)
{
  return AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(a1, a2, a3, 0);
}

__CFString *AVLocalizedStringFromTableWithLocaleWithBundleIdentifier(uint64_t a1, uint64_t a2, void *a3, __CFString *bundleID)
{
  if (!a3) {
    goto LABEL_7;
  }
  if (CFBundleGetBundleWithIdentifier(bundleID)
    || (BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AVFCore")) != 0)
  {
    [a3 localeIdentifier];
    BundleWithIdentifier = (void *)CFBundleCopyLocalizedStringForLocalization();
  }
  id v9 = BundleWithIdentifier;
  if (([v9 isEqualToString:@"xxxxDefaultValuexxxx"] & 1) != 0 || !v9)
  {
LABEL_7:
    if (bundleID) {
      int v10 = bundleID;
    }
    else {
      int v10 = @"com.apple.AVFCore";
    }
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", v10), "localizedStringForKey:value:table:", a1, @"xxxxDefaultValuexxxx", a2);
    if ([v11 isEqualToString:@"xxxxDefaultValuexxxx"]) {
      id v9 = 0;
    }
    else {
      id v9 = v11;
    }
  }
  if (v9) {
    return (__CFString *)v9;
  }
  else {
    return &stru_1EE5953B8;
  }
}

void sub_194B8E250(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_194B8E7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B8F220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194B8F500(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectEndpointOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectEndpointOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    id v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756C0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectEndpointOperation_block_invoke_10;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    id v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Select endpoint %@ on routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeSelectEndpointOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 8);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeSelectEndpointOperation_block_invoke_10(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectRouteDescriptorOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectRouteDescriptorOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756C0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectRouteDescriptorOperation_block_invoke_15;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Select route descriptor %@ on routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeSelectRouteDescriptorOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 16);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeSelectRouteDescriptorOperation_block_invoke_15(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectEndpointsOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectEndpointsOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756C0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectEndpointsOperation_block_invoke_19;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Select endpoints %@ on routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeSelectEndpointsOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 40);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeSelectEndpointsOperation_block_invoke_19(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeSelectRouteDescriptorsOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeSelectRouteDescriptorsOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756C0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeSelectRouteDescriptorsOperation_block_invoke_23;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Select route descriptors %@ on routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeSelectRouteDescriptorsOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 48);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeSelectRouteDescriptorsOperation_block_invoke_23(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeAddEndpointOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeAddEndpointOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756B8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeAddEndpointOperation_block_invoke_27;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Add endpoint %@ to routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeAddEndpointOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 80);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeAddEndpointOperation_block_invoke_27(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 80);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeAddRouteDescriptorOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeAddRouteDescriptorOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      a2 = CFRetain(a2);
    }
    if (a3) {
      a3 = CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756B8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeAddRouteDescriptorOperation_block_invoke_31;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Add route descriptor %@ to routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeAddRouteDescriptorOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 88);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeAddRouteDescriptorOperation_block_invoke_31(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 88);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeRemoveEndpointOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeRemoveEndpointOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756B8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeRemoveEndpointOperation_block_invoke_35;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Remove endpoint %@ from routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeRemoveEndpointOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 96);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeRemoveEndpointOperation_block_invoke_35(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 96);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *AVMakeRemoveRouteDescriptorOperation(CFTypeRef cf, CFTypeRef a2, CFTypeRef a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    uint64_t v8 = [AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __AVMakeRemoveRouteDescriptorOperation_block_invoke;
    v15[3] = &unk_1E57B6638;
    v15[4] = v7;
    v15[5] = a3;
    v15[6] = a2;
    v15[7] = cf;
    uint64_t v9 = [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)v8 initWithRoutingContext:cf routeChangeID:v7 routeChangeBlock:v15];
  }
  else
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a2) {
      CFRetain(a2);
    }
    if (a3) {
      CFRetain(a3);
    }
    int v10 = [AVFigRoutingContextRouteChangeOperation alloc];
    uint64_t v11 = *MEMORY[0x1E4F756B8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __AVMakeRemoveRouteDescriptorOperation_block_invoke_39;
    v14[3] = &__block_descriptor_56_e5_i8__0l;
    void v14[4] = a2;
    void v14[5] = cf;
    v14[6] = a3;
    uint64_t v9 = [(AVFigRoutingContextRouteChangeOperation *)v10 initWithRoutingContext:cf successNotification:v11 routeChangeBlock:v14];
  }
  CFTypeID v12 = v9;
  -[AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation setName:](v9, "setName:", [NSString stringWithFormat:@"Remove route descriptor %@ from routing context %@", a2, cf]);
  return v12;
}

uint64_t __AVMakeRemoveRouteDescriptorOperation_block_invoke(uint64_t a1)
{
  MutableCopCGFloat y = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75768]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75750]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75758]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75780]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F75770], *(const void **)(a1 + 32));
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(v7 + 104);
  if (v8) {
    uint64_t v9 = v8(v4, v5, MutableCopy);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = *(const void **)(a1 + 56);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 48);
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = *(const void **)(a1 + 40);
  if (v12) {
    CFRelease(v12);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v9;
}

uint64_t __AVMakeRemoveRouteDescriptorOperation_block_invoke_39(void *a1)
{
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);
  if (v8) {
    uint64_t v9 = v8(v3, v4, v5);
  }
  else {
    uint64_t v9 = 4294954514;
  }
  int v10 = (const void *)a1[5];
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = (const void *)a1[4];
  if (v11) {
    CFRelease(v11);
  }
  CFTypeID v12 = (const void *)a1[6];
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

void AVSendCommandCompletion(uint64_t a1, const __CFDictionary *a2, signed int a3, void *a4)
{
  uint64_t v7 = MEMORY[0x199715AE0]();
  uint64_t v8 = (void *)v7;
  if (a2)
  {
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F20500]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F20518]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F204D0]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F204E0]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F20508]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F20510]);
    CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F204F8]);
    if (dword_1E93569B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else if (dword_1E93569B0)
  {
    int v10 = (void *)v7;
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v8 = v10;
    if (a3) {
      goto LABEL_7;
    }
LABEL_9:
    CFTypeID v12 = [[AVFigRoutingContextCommandOutputDeviceConfiguration alloc] initWithRoutingContextComandResponse:a2];
    [a4 setFinalConfiguration:v12];
    [a4 markAsCompleted];

    goto LABEL_10;
  }
  if (!a3) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend(a4, "markAsFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(a3, 0));
LABEL_10:
}

void AVFigRoutingContextRouteChangeOperationRouteChangeStarted(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(a2, "_routeChangeStartedWithID:", CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75600]));
}

void AVFigRoutingContextRouteChangeOperationRouteChangeEnded(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75600]);
  objc_msgSend(a2, "_routeChangeWithID:endedWithReason:", Value, CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755F8]));
}

void AVFigRoutingContextRouteChangeOperationRouteChangeComplete(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _routeChangeComplete];
}

void sub_194B94664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B94ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194B94C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVRouteConfigUpdatedFigRoutingContextRouteChangeOperationRouteConfigUpdated(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75608]);
  uint64_t v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75618]);
  if (dword_1E93569B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!FigCFEqual() && !FigCFEqual()) {
    [a2 _routeConfigUpdateWithID:Value endedWithReason:v9];
  }
}

void sub_194B952A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVNSValueWithCGPoint(double a1, double a2)
{
  *(double *)uint64_t v3 = a1;
  *(double *)&v3[1] = a2;
  return [MEMORY[0x1E4F29238] valueWithBytes:v3 objCType:"{CGPoint=dd}"];
}

uint64_t AVNSValueWithCGRect(double a1, double a2, double a3, double a4)
{
  *(double *)uint64_t v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

uint64_t AVNSValueWithCGSize(double a1, double a2)
{
  *(double *)uint64_t v3 = a1;
  *(double *)&v3[1] = a2;
  return [MEMORY[0x1E4F29238] valueWithBytes:v3 objCType:"{CGSize=dd}"];
}

BOOL AVCGPointFromNSValue(void *a1, _OWORD *a2)
{
  long long v6 = *MEMORY[0x1E4F1DAD8];
  int v4 = strcmp((const char *)[a1 objCType], "{CGPoint=dd}");
  if (!v4)
  {
    [a1 getValue:&v6];
    if (!a2) {
      return v4 == 0;
    }
    goto LABEL_3;
  }
  if (a2) {
LABEL_3:
  }
    *a2 = v6;
  return v4 == 0;
}

BOOL AVCGRectFromNSValue(void *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v8 = *MEMORY[0x1E4F1DB28];
  long long v9 = v4;
  int v5 = strcmp((const char *)[a1 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}");
  if (!v5)
  {
    [a1 getValue:&v8];
    if (!a2) {
      return v5 == 0;
    }
    goto LABEL_3;
  }
  if (a2)
  {
LABEL_3:
    long long v6 = v9;
    *a2 = v8;
    a2[1] = v6;
  }
  return v5 == 0;
}

BOOL AVCGSizeFromNSValue(void *a1, _OWORD *a2)
{
  long long v6 = *MEMORY[0x1E4F1DB30];
  int v4 = strcmp((const char *)[a1 objCType], "{CGSize=dd}");
  if (!v4)
  {
    [a1 getValue:&v6];
    if (!a2) {
      return v4 == 0;
    }
    goto LABEL_3;
  }
  if (a2) {
LABEL_3:
  }
    *a2 = v6;
  return v4 == 0;
}

void sub_194B95BA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194B96130(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t AVMethodExceptionReasonWithObjectAndSelector(objc_class *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [NSString stringWithFormat:@"%@ %@", objc_msgSend(NSString, "stringWithFormat:", @"*** %@", AVFullMethodName(a1, a2)), (id)objc_msgSend([NSString alloc], "initWithFormat:arguments:", a3, &a9)];
}

uint64_t AVMethodExceptionReasonWithClassAndSelector(objc_class *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return [NSString stringWithFormat:@"%@ %@", objc_msgSend(NSString, "stringWithFormat:", @"*** %@", AVFullMethodNameFromClass(a1, a2)), (id)objc_msgSend([NSString alloc], "initWithFormat:arguments:", a3, &a9)];
}

void sub_194B9CBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_DWORD *AVCopyBestAudioChannelLayoutFromFormatDescription(const opaqueCMFormatDescription *a1, size_t *a2)
{
  size_t sizeOut = 0;
  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(a1);
  if (RichestDecodableFormat)
  {
    AudioChannelLayoutTag mChannelLayoutTag = RichestDecodableFormat->mChannelLayoutTag;
    if (mChannelLayoutTag != -65536)
    {
      size_t sizeOut = 12;
      long long v6 = malloc_type_malloc(0xCuLL, 0x4E69D805uLL);
      if (v6)
      {
        uint64_t v7 = v6;
        v6[1] = 0;
        v6[2] = 0;
        *long long v6 = mChannelLayoutTag;
        if (!a2) {
          return v7;
        }
        goto LABEL_10;
      }
    }
  }
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(a1, &sizeOut);
  if (!sizeOut)
  {
    uint64_t v7 = 0;
    if (!a2) {
      return v7;
    }
    goto LABEL_10;
  }
  long long v9 = malloc_type_malloc(sizeOut, 0x5A60B01FuLL);
  uint64_t v7 = v9;
  if (v9) {
    memcpy(v9, ChannelLayout, sizeOut);
  }
  if (a2) {
LABEL_10:
  }
    *a2 = sizeOut;
  return v7;
}

void *AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [a1 objectForKey:@"AVVideoPixelAspectRatioHorizontalSpacingKey"];
  uint64_t v4 = [a1 objectForKey:@"AVVideoPixelAspectRatioVerticalSpacingKey"];
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x1E4F24B90]];
  }
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x1E4F24BA0]];
  }
  return v2;
}

void *AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [a1 objectForKey:@"AVVideoCleanApertureWidthKey"];
  uint64_t v4 = [a1 objectForKey:@"AVVideoCleanApertureHeightKey"];
  uint64_t v5 = [a1 objectForKey:@"AVVideoCleanApertureHorizontalOffsetKey"];
  uint64_t v6 = [a1 objectForKey:@"AVVideoCleanApertureVerticalOffsetKey"];
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x1E4F24A88]];
  }
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x1E4F24A68]];
  }
  if (v5) {
    [v2 setObject:v5 forKey:*MEMORY[0x1E4F24A70]];
  }
  if (v6) {
    [v2 setObject:v6 forKey:*MEMORY[0x1E4F24A80]];
  }
  return v2;
}

void *getLoadedTimeRangesFromTimeIntervals(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    uint64_t v7 = *MEMORY[0x1E4F33850];
    uint64_t v8 = *MEMORY[0x1E4F33848];
    long long v15 = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(a1);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        *(_OWORD *)&v21.CMTimeValue value = v15;
        v21.CMTimeEpoch epoch = v9;
        *(_OWORD *)&v20.CMTimeValue value = v15;
        v20.CMTimeEpoch epoch = v9;
        CFDictionaryRef v12 = (const __CFDictionary *)objc_msgSend(v11, "objectForKey:", v7, v15);
        CFDictionaryRef v13 = (const __CFDictionary *)[v11 objectForKey:v8];
        if (v12) {
          CMTimeMakeFromDictionary(&v21, v12);
        }
        if (v13)
        {
          CMTimeMakeFromDictionary(&lhs, v13);
          rhs.CMTimeRange start = v21;
          CMTimeSubtract(&v20, &lhs, &rhs.start);
        }
        memset(&rhs, 0, sizeof(rhs));
        start.CMTimeRange start = v21;
        CMTime duration = v20;
        CMTimeRangeMake(&rhs, &start.start, &duration);
        CMTimeRange start = rhs;
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeRange:", &start));
      }
      uint64_t v5 = [a1 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
  return v3;
}

void sub_194BACAD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t encoderExistsForFormat(int a1)
{
  if (a1 == 1819304813) {
    return 1;
  }
  UInt32 outPropertyDataSize = 0;
  BOOL v1 = 0;
  if (!AudioFormatGetPropertyInfo(0x61636F66u, 0, 0, &outPropertyDataSize))
  {
    uint64_t v3 = (int *)malloc_type_malloc(outPropertyDataSize, 0xFAFB1EFDuLL);
    BOOL v1 = 0;
    if (!AudioFormatGetProperty(0x61636F66u, 0, 0, &outPropertyDataSize, v3))
    {
      if (outPropertyDataSize >= 4)
      {
        unint64_t v4 = ((unint64_t)outPropertyDataSize >> 2) - 1;
        uint64_t v5 = v3;
        do
        {
          int v6 = *v5++;
          BOOL v1 = v6 == a1;
        }
        while (v6 != a1 && v4-- != 0);
      }
      else
      {
        BOOL v1 = 0;
      }
    }
    free(v3);
  }
  return v1;
}

uint64_t audioChannelLayoutChannelCount(void *inSpecifier, UInt32 a2)
{
  unsigned int outPropertyData = 0;
  UInt32 ioPropertyDataSize = 4;
  if (AudioFormatGetProperty(0x6E63686Du, a2, inSpecifier, &ioPropertyDataSize, &outPropertyData)) {
    return 0;
  }
  else {
    return outPropertyData;
  }
}

unsigned int *copyAudioChannelLayoutFromData(void *a1, unint64_t *a2)
{
  if (!a1 || ![a1 length])
  {
    unint64_t v6 = 0;
    uint64_t v5 = 0;
    if (!a2) {
      return v5;
    }
    goto LABEL_9;
  }
  size_t v4 = [a1 length];
  uint64_t v5 = (unsigned int *)malloc_type_malloc(v4, 0xA17C52CFuLL);
  if (!v5)
  {
    unint64_t v6 = 0;
    if (!a2) {
      return v5;
    }
    goto LABEL_9;
  }
  [a1 getBytes:v5 length:v4];
  unint64_t v6 = 20 * v5[2] + 12;
  if (v4 < v6) {
    unint64_t v6 = v4;
  }
  if (a2) {
LABEL_9:
  }
    *a2 = v6;
  return v5;
}

_DWORD *copyDefaultChannelLayoutForChannelCount(uint64_t a1, uint64_t *a2)
{
  if (a1 == 2)
  {
    uint64_t v3 = 12;
    uint64_t result = malloc_type_calloc(1uLL, 0xCuLL, 0xDAACE931uLL);
    int v5 = 6619138;
LABEL_5:
    *uint64_t result = v5;
    if (!a2) {
      return result;
    }
    goto LABEL_6;
  }
  if (a1 == 1)
  {
    uint64_t v3 = 12;
    uint64_t result = malloc_type_calloc(1uLL, 0xCuLL, 0xDAACE931uLL);
    int v5 = 6553601;
    goto LABEL_5;
  }
  uint64_t v3 = 0;
  uint64_t result = 0;
  if (!a2) {
    return result;
  }
LABEL_6:
  *a2 = v3;
  return result;
}

BOOL AVVideoOutputSettingsValidateAVPixelAspectRatioDictionaryAndReturnVTPixelAspectRatioDictionary(void *a1, void *a2, __CFString **a3)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL result = 0;
    uint64_t v8 = @"Value for AVVideoPixelAspectRatioKey must be an instance of NSDictionary";
    goto LABEL_5;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVVideoPixelAspectRatioHorizontalSpacingKey", @"AVVideoPixelAspectRatioVerticalSpacingKey", 0);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a1, "allKeys"));
  [v7 minusSet:v6];
  if ([v7 count])
  {
    uint64_t v8 = (__CFString *)[NSString stringWithFormat:@"Dictionary for AVVideoPixelAspectRatioKey contains one or more unrecognized keys: %@", objc_msgSend((id)objc_msgSend(v7, "allObjects"), "componentsJoinedByString:", @", ")];
    BOOL result = 0;
LABEL_5:
    *a3 = v8;
    return result;
  }
  int v10 = AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(a1);
  BOOL result = AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(v10, a3);
  if (result)
  {
    *a2 = v10;
    return 1;
  }
  return result;
}

BOOL AVVideoOutputSettingsValidateAVCleanApertureDictionaryAndReturnVTCleanApertureDictionary(void *a1, void *a2, void *a3, void *a4, __CFString **a5)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AVVideoCleanApertureWidthKey", @"AVVideoCleanApertureHeightKey", @"AVVideoCleanApertureHorizontalOffsetKey", @"AVVideoCleanApertureVerticalOffsetKey", 0);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a1, "allKeys"));
    [v11 minusSet:v10];
    if ([v11 count])
    {
      uint64_t v12 = [NSString stringWithFormat:@"Dictionary for AVVideoCleanApertureKey contains one or more unrecognized keys: %@", objc_msgSend((id)objc_msgSend(v11, "allObjects"), "componentsJoinedByString:", @", ")];
      int v13 = 0;
      *a5 = (__CFString *)v12;
    }
    else
    {
      long long v15 = AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(a1);
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      int v16 = AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(v15, &v23, &v22, &v21, &v20, a5);
      int v17 = v16;
      if (!a2) {
        goto LABEL_11;
      }
      if (!a3) {
        goto LABEL_11;
      }
      if (!v16) {
        goto LABEL_11;
      }
      uint64_t v18 = [a2 integerValue];
      uint64_t v19 = [a3 integerValue];
      v24.size.CGFloat width = (double)v18;
      v24.size.CGFloat height = (double)v19;
      v25.size.CGFloat width = (double)v23;
      v25.origin.CGFloat x = (double)v18 * 0.5 - (double)v23 * 0.5 + (double)v21;
      v25.size.CGFloat height = (double)v22;
      v25.origin.CGFloat y = (double)v19 * 0.5 - (double)v22 * 0.5 + (double)v20;
      v24.origin.CGFloat x = 0.0;
      v24.origin.CGFloat y = 0.0;
      if (!CGRectContainsRect(v24, v25))
      {
        int v13 = 0;
        *a5 = @"Clean aperture region must be contained within the bounds specified by width & height";
      }
      else
      {
LABEL_11:
        if (v17)
        {
          *a4 = v15;
          int v13 = 1;
        }
        else
        {
          int v13 = 0;
        }
      }
    }
    return v13 != 0;
  }
  else
  {
    BOOL result = 0;
    *a5 = @"Value for AVVideoCleanApertureKey must be an instance of NSDictionary";
  }
  return result;
}

uint64_t AVVideoOutputSettingsValidateVideoColorProperties(void *a1, __CFString **a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [a1 objectForKey:@"ColorPrimaries"];
    uint64_t v5 = [a1 objectForKey:@"TransferFunction"];
    uint64_t v6 = [a1 objectForKey:@"YCbCrMatrix"];
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v8 = v7 || v6 == 0;
    if (v8 || (uint64_t v9 = v6, [a1 count] != 3))
    {
      uint64_t v12 = @"Dictionary for AVVideoColorPropertiesKey must contain all three color keys (AVVideoColorPrimariesKey, AVVideoTransferFunctionKey, AVVideoYCbCrMatrixKey) and it may not contain any other keys";
    }
    else
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ITU_R_709_2", @"SMPTE_C", @"P3_D65", @"ITU_R_2020", 0);
      if ([v10 containsObject:v4])
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ITU_R_709_2", @"SMPTE_ST_2084_PQ", @"ITU_R_2100_HLG", @"Linear", @"IEC_sRGB", 0);
        if ([v10 containsObject:v5])
        {
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ITU_R_709_2", @"ITU_R_601_4", @"ITU_R_2020", 0);
          if ([v10 containsObject:v9]) {
            return 1;
          }
          int v13 = @"Value for AVVideoYCbCrMatrixKey must be one of: %@";
        }
        else
        {
          int v13 = @"Value for AVVideoTransferFunctionKey must be one of: %@";
        }
      }
      else
      {
        int v13 = @"Value for AVVideoColorPrimariesKey must be one of: %@";
      }
      uint64_t v12 = (__CFString *)[NSString stringWithFormat:v13, objc_msgSend((id)objc_msgSend(v10, "allObjects"), "componentsJoinedByString:", @", ")];
    }
  }
  else
  {
    uint64_t v12 = @"Dictionary for AVVideoColorPropertiesKey must be an NSDictionary";
  }
  uint64_t v11 = 0;
  if (a2) {
    *a2 = v12;
  }
  return v11;
}

BOOL AVVideoOutputSettingsValidateMinimumFrameDuration(const __CFDictionary *a1, __CFString **a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL result = 0;
    BOOL v7 = @"Dictionary for AVVideoMinimumFrameDuration must be an NSDictionary";
    if (!a2) {
      return result;
    }
    goto LABEL_10;
  }
  memset(&v10, 0, sizeof(v10));
  CMTimeMakeFromDictionary(&v10, a1);
  if ((v10.flags & 0x1D) != 1)
  {
    BOOL result = 0;
    BOOL v7 = @"AVVideoMinimumFrameDuration must be numeric";
    if (!a2) {
      return result;
    }
    goto LABEL_10;
  }
  CMTime time1 = v10;
  CMTime v8 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v4 = CMTimeCompare(&time1, &v8);
  BOOL v5 = v4 <= 0;
  BOOL result = v4 > 0;
  BOOL v7 = @"AVVideoMinimumFrameDuration must be greater than kCMTimeZero";
  if (!v5) {
    BOOL v7 = 0;
  }
  if (a2)
  {
LABEL_10:
    if (!result) {
      *a2 = v7;
    }
  }
  return result;
}

uint64_t AVVideoOutputSettingsValidateFrameRateConversionAlgorithm(void *a1, __CFString **a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t result = 0;
    BOOL v5 = @"String for AVVideoFrameRateConversionAlgorithm must be an NSString";
    if (!a2) {
      return result;
    }
    goto LABEL_9;
  }
  if ([a1 isEqualToString:@"AVVideoFrameRateConversionAlgorithmFast"]) {
    return 1;
  }
  uint64_t result = [a1 isEqualToString:@"AVVideoFrameRateConversionAlgorithmPrecise"];
  BOOL v5 = @"AVVideoFrameRateConversionAlgorithm must be either AVVideoFrameRateConversionAlgorithmFast or AVVideoFrameRateConversionAlgorithmPrecise";
  if (result) {
    BOOL v5 = 0;
  }
  if (a2)
  {
LABEL_9:
    if ((result & 1) == 0)
    {
      uint64_t result = 0;
      *a2 = v5;
    }
  }
  return result;
}

BOOL AVVideoOutputSettingsValidateEmitSequencesAtSyncFramesOnly(void *a1, __CFString **a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL result = 0;
    BOOL v7 = @"AVVideoEmitSequencesAtSyncFramesOnly must be an NSNumber";
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  uint64_t v4 = [a1 integerValue];
  BOOL v5 = v4 <= 0;
  BOOL result = v4 > 0;
  BOOL v7 = @"AVVideoEmitSequencesAtSyncFramesOnly must be greater than zero";
  if (!v5) {
    BOOL v7 = 0;
  }
  if (a2)
  {
LABEL_7:
    if (!result) {
      *a2 = v7;
    }
  }
  return result;
}

BOOL AVVideoOutputSettingsExtractPixelAspectRatioAndCleanApertureFromAVVideoSettingsDictionary(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v31 = 0;
  uint64_t v12 = (void *)[a1 objectForKey:@"AVVideoCompressionPropertiesKey"];
  int v13 = (void *)[a1 objectForKey:@"AVVideoPixelAspectRatioKey"];
  if (v13) {
    BOOL v14 = AVVideoOutputSettingsValidateAVPixelAspectRatioDictionaryAndReturnVTPixelAspectRatioDictionary(v13, a4, &v31);
  }
  else {
    BOOL v14 = 1;
  }
  long long v15 = (void *)[a1 objectForKey:@"AVVideoCleanApertureKey"];
  if (v14 && v15) {
    BOOL v14 = AVVideoOutputSettingsValidateAVCleanApertureDictionaryAndReturnVTCleanApertureDictionary(v15, a2, a3, a5, &v31);
  }
  if (!v14 || !v12) {
    goto LABEL_49;
  }
  uint64_t v16 = [v12 objectForKey:@"AVVideoPixelAspectRatioKey"];
  if (v16)
  {
    if (*a4)
    {
      BOOL v14 = 0;
      int v17 = @"AVVideoPixelAspectRatioKey can only be specified at the top level of the dictionary or in the AVVideoCompressionPropertiesKey sub-dictionary, not both";
LABEL_17:
      uint64_t v31 = v17;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v14 = 0;
      int v17 = @"Value for AVVideoPixelAspectRatioKey must be an instance of NSDictionary";
      goto LABEL_17;
    }
    uint64_t v19 = AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(v18);
    if (!AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(v19, &v31))
    {
      BOOL v14 = 0;
      goto LABEL_18;
    }
    *a4 = v19;
  }
  BOOL v14 = 1;
LABEL_18:
  uint64_t v20 = [v12 objectForKey:*MEMORY[0x1E4F44A60]];
  if (v14)
  {
    uint64_t v21 = (void *)v20;
    if (v20)
    {
      if (*a4)
      {
        uint64_t v22 = @"Pixel aspect ratio can only be specified once";
LABEL_33:
        uint64_t v31 = v22;
        goto LABEL_34;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v22 = @"Value for pixel aspect ratio must be an instance of NSDictionary";
        goto LABEL_33;
      }
      if (!AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(v21, &v31))
      {
LABEL_34:
        [v12 objectForKey:@"AVVideoCleanApertureKey"];
        goto LABEL_35;
      }
      *a4 = v21;
      BOOL v14 = 1;
    }
  }
  uint64_t v23 = [v12 objectForKey:@"AVVideoCleanApertureKey"];
  if (v14)
  {
    CGRect v24 = (void *)v23;
    if (v23)
    {
      if (*a5)
      {
        BOOL v14 = 0;
        CGRect v25 = @"AVVideoCleanApertureKey can only be specified at the top level of the dictionary or in the AVVideoCompressionPropertiesKey sub-dictionary, not both";
LABEL_38:
        uint64_t v31 = v25;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v14 = 0;
        CGRect v25 = @"Value for AVVideoCleanApertureKey must be an instance of NSDictionary";
        goto LABEL_38;
      }
      uint64_t v26 = AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(v24);
      if (!AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(v26, 0, 0, 0, 0, &v31))
      {
LABEL_35:
        BOOL v14 = 0;
        goto LABEL_39;
      }
      *a5 = v26;
      BOOL v14 = 1;
    }
  }
LABEL_39:
  uint64_t v27 = [v12 objectForKey:*MEMORY[0x1E4F44858]];
  if (v14)
  {
    uint64_t v28 = (void *)v27;
    if (v27)
    {
      if (*a5)
      {
        BOOL v14 = 0;
        uint64_t v29 = @"Clean aperture can only be specified once";
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(v28, 0, 0, 0, 0, &v31))
          {
            *a5 = v28;
            BOOL v14 = 1;
            if (!a6) {
              return v14;
            }
          }
          else
          {
            BOOL v14 = 0;
            if (!a6) {
              return v14;
            }
          }
          goto LABEL_50;
        }
        BOOL v14 = 0;
        uint64_t v29 = @"Value for clean aperture must be an instance of NSDictionary";
      }
      uint64_t v31 = v29;
    }
  }
LABEL_49:
  if (a6) {
LABEL_50:
  }
    *a6 = v31;
  return v14;
}

BOOL AVVideoOutputSettingsValidateVTPixelAspectRatioDictionary(void *a1, __CFString **a2)
{
  uint64_t v4 = (void *)[a1 objectForKey:*MEMORY[0x1E4F24B90]];
  BOOL v5 = (void *)[a1 objectForKey:*MEMORY[0x1E4F24BA0]];
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL result = 0;
    uint64_t v9 = @"Dictionary for AVVideoPixelAspectRatioKey must contain NSNumber values for both AVVideoPixelAspectRatioHorizontalSpacingKey and AVVideoPixelAspectRatioVerticalSpacingKey";
    if (!a2) {
      return result;
    }
    goto LABEL_9;
  }
  if ([v4 integerValue] < 1)
  {
    BOOL result = 0;
    uint64_t v9 = @"Dictionary for AVVideoPixelAspectRatioKey must specify a positive value for AVVideoPixelAspectRatioHorizontalSpacingKey";
    if (!a2) {
      return result;
    }
    goto LABEL_9;
  }
  uint64_t v6 = [v5 integerValue];
  BOOL v7 = v6 <= 0;
  BOOL result = v6 > 0;
  uint64_t v9 = @"Dictionary for AVVideoPixelAspectRatioKey must specify a positive value for AVVideoPixelAspectRatioVerticalSpacingKey";
  if (!v7) {
    uint64_t v9 = 0;
  }
  if (a2)
  {
LABEL_9:
    if (!result) {
      *a2 = v9;
    }
  }
  return result;
}

uint64_t AVVideoOutputSettingsValidateAndExtractValuesFromVTCleanApertureDictionary(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, __CFString **a6)
{
  uint64_t v12 = (void *)[a1 objectForKey:*MEMORY[0x1E4F24A88]];
  int v13 = (void *)[a1 objectForKey:*MEMORY[0x1E4F24A68]];
  BOOL v14 = (void *)[a1 objectForKey:*MEMORY[0x1E4F24A70]];
  uint64_t v15 = [a1 objectForKey:*MEMORY[0x1E4F24A80]];
  if (v12)
  {
    if (v13)
    {
      if (v14)
      {
        uint64_t v16 = (void *)v15;
        if (v15)
        {
          if (objc_opt_respondsToSelector())
          {
            if (objc_opt_respondsToSelector())
            {
              if (objc_opt_respondsToSelector())
              {
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v17 = [v12 integerValue];
                  uint64_t v18 = [v13 integerValue];
                  uint64_t v19 = [v14 integerValue];
                  uint64_t v20 = [v16 integerValue];
                  if (v17 < 1)
                  {
                    uint64_t v22 = @"Dictionary for AVVideoCleanApertureKey must specify a positive value for AVVideoCleanApertureWidthKey";
                  }
                  else
                  {
                    if (v18 >= 1)
                    {
                      if (a2) {
                        *a2 = v17;
                      }
                      if (a3) {
                        *a3 = v18;
                      }
                      if (a4) {
                        *a4 = v19;
                      }
                      if (a5) {
                        *a5 = v20;
                      }
                      return 1;
                    }
                    uint64_t v22 = @"Dictionary for AVVideoCleanApertureKey must specify a positive value for AVVideoCleanApertureHeightKey";
                  }
                }
                else
                {
                  uint64_t v22 = @"Value for AVVideoCleanApertureVerticalOffsetKey must be an instance of NSNumber";
                }
              }
              else
              {
                uint64_t v22 = @"Value for AVVideoCleanApertureHorizontalOffsetKey must be an instance of NSNumber";
              }
            }
            else
            {
              uint64_t v22 = @"Value for AVVideoCleanApertureHeightKey must be an instance of NSNumber";
            }
          }
          else
          {
            uint64_t v22 = @"Value for AVVideoCleanApertureWidthKey must be an instance of NSNumber";
          }
        }
        else
        {
          uint64_t v22 = @"Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureVerticalOffsetKey";
        }
      }
      else
      {
        uint64_t v22 = @"Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureHorizontalOffsetKey";
      }
    }
    else
    {
      uint64_t v22 = @"Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureHeightKey";
    }
  }
  else
  {
    uint64_t v22 = @"Dictionary for AVVideoCleanApertureKey must specify a value for AVVideoCleanApertureWidthKey";
  }
  uint64_t result = 0;
  if (a6) {
    *a6 = v22;
  }
  return result;
}

__CFString *AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(__CFString *result)
{
  if (result)
  {
    BOOL v1 = result;
    if ([(__CFString *)result isEqualToString:*MEMORY[0x1E4F21F80]])
    {
      return @"AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted";
    }
    else if ([(__CFString *)v1 isEqualToString:*MEMORY[0x1E4F21FB0]])
    {
      return @"AVCoordinatedPlaybackSuspensionReasonStallRecovery";
    }
    else if ([(__CFString *)v1 isEqualToString:*MEMORY[0x1E4F21F98]])
    {
      return @"AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial";
    }
    else if ([(__CFString *)v1 isEqualToString:*MEMORY[0x1E4F21FB8]])
    {
      return @"AVCoordinatedPlaybackSuspensionReasonUserActionRequired";
    }
    else if ([(__CFString *)v1 isEqualToString:*MEMORY[0x1E4F21F90]])
    {
      return @"AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible";
    }
    else if ([(__CFString *)v1 isEqualToString:*MEMORY[0x1E4F21F88]])
    {
      return @"AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime";
    }
    else
    {
      return v1;
    }
  }
  return result;
}

uint64_t AVPlaybackCoordinatorArrayContainsSameElementsAsArray(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a1];
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:a2];
  return [v3 isEqualToSet:v4];
}

void *AVPlaybackCoordinatorArrayMinusArray(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:a1];
  [v3 removeObjectsInArray:a2];
  return v3;
}

id AVPlaybackCoordinatorGetNSUUIDFromCFUUID(CFUUIDRef uuid)
{
  if (uuid)
  {
    CFStringRef v1 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], uuid);
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v1];
    if (v1) {
      CFRelease(v1);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

CFUUIDRef AVPlaybackCoordinatorCreateCFUUIDFromNSUUID(CFUUIDRef result)
{
  if (result)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v2 = (const __CFString *)[(__CFUUID *)result UUIDString];
    return CFUUIDCreateFromString(v1, v2);
  }
  return result;
}

id AVPlaybackCoordinatorMakeUserInfoForDidIssueCommandToPlaybackObjectNotification(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F21EF0]];
  id v4 = (void *)[a1 objectForKeyedSubscript:*MEMORY[0x1E4F21EE8]];
  uint64_t v5 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F21EF8]];
  uint64_t v6 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F21F00]];
  if ([v4 isEqualToString:*MEMORY[0x1E4F21FE0]])
  {
    BOOL v7 = @"AVPlaybackCoordinatorPlaybackObjectCommandSetRate";
    if (!v3) {
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", v3), @"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyParticipantUUID");
    goto LABEL_12;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F21FF0]])
  {
    BOOL v7 = @"AVPlaybackCoordinatorPlaybackObjectCommandSetTime";
    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F21FE8]]) {
      BOOL v7 = @"AVPlaybackCoordinatorPlaybackObjectCommandSetRateAndTime";
    }
    else {
      BOOL v7 = 0;
    }
    if (v3) {
      goto LABEL_11;
    }
  }
LABEL_12:
  [v2 setObject:v7 forKeyedSubscript:@"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyCommand"];
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyRate"];
  }
  if (v6) {
    [v2 setObject:v6 forKeyedSubscript:@"AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectKeyTime"];
  }
  return v2;
}

void sub_194BB5078(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_194BB58AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void AVPlayerPlaybackCoordinatorBroadcastTransportControlStateCallback(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x199715AE0]();
  uint64_t v5 = (void *)[a1 coordinationMediumDelegate];
  uint64_t v6 = [a2 objectForKeyedSubscript:@"Identifier"];
  [a1 _updateTransportControlStateDictionaryWithTransportControlState:a2];
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "playbackCoordinator:broadcastTransportControlStateDictionary:forItemWithIdentifier:", a1, a2, objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F21FF8]));
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [a1 setCoordinationMediumDelegate:0];
  }
  objc_msgSend((id)objc_msgSend(a1, "interstitialPlaybackCoordinator", v8, v9), "_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:", v6);
  objc_msgSend((id)objc_msgSend(a1, "primaryPlaybackCoordinatorForInterstitial"), "_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:", v6);
}

void AVPlayerPlaybackCoordinatorBroadcastParticipantStateCallback(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x199715AE0]();
  uint64_t v5 = (void *)[a1 coordinationMediumDelegate];
  uint64_t v6 = [a2 objectForKeyedSubscript:@"UUID"];
  [a1 _updateParticipantStateDictionaryWithParticipantState:a2];
  [a1 _removeUnusedTransportControlStates];
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 playbackCoordinator:a1 broadcastLocalParticipantStateDictionary:a2];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [a1 setCoordinationMediumDelegate:0];
  }
  objc_msgSend((id)objc_msgSend(a1, "interstitialPlaybackCoordinator", v8, v9), "_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:", v6);
  objc_msgSend((id)objc_msgSend(a1, "primaryPlaybackCoordinatorForInterstitial"), "_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:", v6);
}

void AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  v12[26] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  uint64_t v9 = [a1 coordinationMediumDelegate];
  if (a1 && (uint64_t v10 = (void *)v9, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke;
    v12[3] = &unk_1E57B36D0;
    v12[4] = a1;
    void v12[5] = a4;
    v12[6] = a3;
    [v10 playbackCoordinator:a1 reloadTransportControlStateForItemWithIdentifier:a2 completionHandler:v12];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    [a1 setCoordinationMediumDelegate:0];
    a4(a3);
  }
}

void sub_194BB6518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB6654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB6894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BB6B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB6CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB6FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BB7180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BB75EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BB774C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB7888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB7CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB7E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB7FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB8C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB9148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB978C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB9B14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BB9C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BB9DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BBA638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BBAAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BBB0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BBB40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BBB7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _figPlaybackCoordinatorConfigQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke_2;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

void *audioValueRangeArrayWithAudioValueRanges(uint64_t a1, uint64_t a2)
{
  long long v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a2 >= 1)
  {
    uint64_t v5 = (double *)(a1 + 8);
    do
    {
      objc_msgSend(v4, "addObject:", +[AVFloat64Range float64RangeWithAudioValueRange:](AVFloat64Range, "float64RangeWithAudioValueRange:", *(v5 - 1), *v5));
      v5 += 2;
      --a2;
    }
    while (a2);
  }
  return v4;
}

uint64_t indexOfValueInAudioValueRangeArray(void *a1, uint64_t a2, double a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v17;
LABEL_3:
  uint64_t v10 = 0;
  uint64_t v11 = v8;
  while (1)
  {
    if (*(void *)v17 != v9) {
      objc_enumerationMutation(a1);
    }
    uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
    [v8 minimum];
    if (v12 > a3) {
      break;
    }
    [v8 maximum];
    if (v13 >= a3)
    {
      if (v8) {
        return [a1 indexOfObject:v8];
      }
      break;
    }
    ++v10;
    uint64_t v11 = v8;
    if (v7 == v10)
    {
      uint64_t v7 = [a1 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v11 = v8;
      if (v7) {
        goto LABEL_3;
      }
      break;
    }
  }
  if (v11)
  {
    unint64_t v14 = [a1 indexOfObject:v11];
    if (a2 != -1)
    {
      if (a2 == 1)
      {
        if (v14 < [a1 count] - 1) {
          ++v14;
        }
      }
      else
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  else
  {
LABEL_26:
    if ([a1 count]) {
      return 0;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v14;
}

void sub_194BBDF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BBE604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avad_downloadSuccessCallback(void *a1)
{
  id v2 = (void *)MEMORY[0x199715AE0]();
  [a1 _downloadSuccessCallback];
}

void avad_downloadFailureCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  [a1 _downloadFailureCallbackWithError:a3];
}

void avad_loadedTimeRangeChangedCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (void *)MEMORY[0x199715AE0]();
  [a1 _sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange:a3 currentLoadedTimeRanges:a4 timeRangeExpectedToLoad:a5 selectedMediaArray:a6];
}

void avad_didResolveMediaSelection(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  [a1 _sendDidResolveMediaSelectionWithMediaSelection:a3];
}

void avad_didFinishDownloadForMediaSelection(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  [a1 _sendDidFinishDownloadForMediaSelectionWithMediaSelection:a3];
}

void avad_progressUpdate(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  [a1 _sendProgessUpdateWithExpectedBytesToDownload:a3 bytesDownloaded:a4];
}

void avad_willDownloadAlternates(void *a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      for (CFIndex i = 0; i != v8; ++i)
      {
        uint64_t v10 = [[AVAssetVariant alloc] initWithFigAlternate:CFArrayGetValueAtIndex(a3, i)];
        if (v10)
        {
          uint64_t v11 = v10;
          [v6 addObject:v10];
        }
      }
    }
  }
  if ([v6 count]) {
    [a1 _sendWillDownloadVariants:v6];
  }
}

void sub_194BC1348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void avAssetDownloadSession_figAssetNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, const __CFDictionary *a5)
{
  CFIndex v8 = (void *)MEMORY[0x199715AE0]();
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31ED8]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31ED0]))
    {
      CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F32168]);
      if (!FigCFEqual() && !FigCFEqual() && !FigCFEqual()) {
        goto LABEL_18;
      }
    }
    else
    {
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EC8]))
      {
        uint64_t v10 = a2;
        uint64_t v11 = 3;
        uint64_t v12 = 0;
LABEL_17:
        [v10 _transitionToTerminalStatus:v11 error:v12];
        goto LABEL_18;
      }
      if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EC0]))
      {
        if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EE8])) {
          goto LABEL_18;
        }
        uint64_t v9 = AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
        goto LABEL_16;
      }
    }
    uint64_t v9 = [a2 _errorFromAssetNotificationPayload:a5];
LABEL_16:
    uint64_t v12 = v9;
    uint64_t v10 = a2;
    uint64_t v11 = 4;
    goto LABEL_17;
  }
  CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F32168]);
  if (FigCFEqual())
  {
    [a2 _primeCacheOnDispatchQueue];
    goto LABEL_18;
  }
  if (FigCFEqual())
  {
    uint64_t v9 = [a2 _verifyDownloadConfigurationForAssetType];
    if (v9) {
      goto LABEL_16;
    }
  }
LABEL_18:
}

void avAssetDownloadSession_figPlaybackItemNotificationCallback(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x199715AE0]();
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33558]))
  {
    if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F33640])) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  char v19 = 0;
  [a2 _playbackItem];
  uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, void, void))(v8 + 56);
  if (v9) {
    v9(FigBaseObject, *MEMORY[0x1E4F339A0], *MEMORY[0x1E4F1CFD0]);
  }
  uint64_t v10 = [a2 _playbackItem];
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  double v13 = *(uint64_t (**)(uint64_t, void, char *))(v12 + 48);
  if (v13)
  {
    signed int v14 = v13(v10, 0, &v19);
    signed int v15 = v14;
    if (!v14 && v19)
    {
LABEL_15:
      [a2 _readyForInspection];
      goto LABEL_21;
    }
    if (!v14) {
      goto LABEL_21;
    }
  }
  else
  {
    signed int v15 = -12782;
  }
  if ([a2 URL])
  {
    long long v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = [a2 URL];
    long long v18 = (void *)[v16 dictionaryWithObject:v17 forKey:*MEMORY[0x1E4F289D0]];
  }
  else
  {
    long long v18 = 0;
  }
  objc_msgSend(a2, "_transitionToTerminalStatus:error:", 4, AVLocalizedErrorWithUnderlyingOSStatus(v15, v18));
LABEL_21:
}

dispatch_time_t AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(uint64_t a1, CMTime *a2, Float64 a3)
{
  CMTime v15 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  memset(&v14, 0, sizeof(v14));
  uint64_t v5 = *(const void **)(a1 + 8);
  CMClockRef HostTimeClock = CMClockGetHostTimeClock();
  CMTime time = *a2;
  CMSyncConvertTime(&v14, &time, v5, HostTimeClock);
  memset(&time, 0, sizeof(time));
  CMTimeMakeWithSeconds(&time, a3, 1000);
  CMTime lhs = v14;
  CMTime rhs = time;
  CMTimeSubtract(&v15, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  uint64_t v7 = CMClockGetHostTimeClock();
  CMClockGetTime(&v10, v7);
  CMTime rhs = v15;
  CMTimeSubtract(&lhs, &rhs, &v10);
  CMTime rhs = lhs;
  CMTimeConvertScale(&v9, &rhs, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return dispatch_time(0, v9.value & ~(v9.value >> 63));
}

void sub_194BC31C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC3844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _targetReadOnlyTimebaseAtDummyTimebase()
{
  CMTimebaseRef timebaseOut = 0;
  CMClockRef HostTimeClock = CMClockGetHostTimeClock();
  if (!CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut)) {
    FigReadOnlyTimebaseSetTargetTimebase();
  }
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
}

void sub_194BC3A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BC3BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC3F24(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194BC45C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Block_object_dispose((const void *)(v15 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BC484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC5160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC59AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_194BC5DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC5F88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BC633C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC6478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC6794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC70B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC7394(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_194BC76A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BC78D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t _enqueueSingleSampleBufferStatic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)a3 _enqueueSingleSampleBuffer:a1 bufferEnqueueingInfo:*(void *)(a3 + 8)];
  }
  else {
    return FigSignalErrorAt();
  }
}

void sub_194BC7EEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194BC8330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__91(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__92(uint64_t a1)
{
}

void sub_194BC89D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC8D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC9090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC9310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BC95A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BC9850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BC9AA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194BC9FDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BCA2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCA614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCA824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BCAA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BCAE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BCB1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BCB694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCB8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCBB1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BCC014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCC1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCC308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCC440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void _figVideoQueueDidDropBelowLowWaterLevel(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _refreshAboveHighWaterLevel];
}

void _figVideoQueueDecodeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    signed int v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F34C70]), "intValue");
    uint64_t v9 = [a5 objectForKey:*MEMORY[0x1E4F34C68]];
    CFDictionaryRef v10 = (const __CFDictionary *)[a5 objectForKey:*MEMORY[0x1E4F34C78]];
  }
  else
  {
    signed int v8 = 0;
    uint64_t v9 = 0;
    CFDictionaryRef v10 = 0;
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:@"vide" forKey:@"AVErrorMediaTypeKey"];
  if (v9) {
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v9), @"AVErrorMediaSubTypeKey");
  }
  if (v10)
  {
    memset(&v18, 0, sizeof(v18));
    CMTimeMakeFromDictionary(&v18, v10);
    CMTime v17 = v18;
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTime:", &v17), @"AVErrorPresentationTimeStampKey");
  }
  uint64_t v12 = AVLocalizedErrorWithUnderlyingOSStatus(v8, v11);
  double v13 = (void *)MEMORY[0x1E4F28EA0];
  if (v12) {
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:@"AVSampleBufferVideoRendererDidFailToDecodeNotificationErrorKey"];
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [v13 notificationWithName:@"AVSampleBufferVideoRendererDidFailToDecodeNotification" object:a2 userInfo:v14];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v15);
  if (v12) {
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:@"AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey"];
  }
  else {
    uint64_t v16 = 0;
  }
  [a2 _fireDisplayLayerNotificationNowThenReleaseOnMainThread:@"AVSampleBufferDisplayLayerFailedToDecodeNotification" userInfo:v16];
}

void _figVideoQueueFlushComplete(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _flushComplete];
}

void _figVideoQueueCompletedDecodeForPreroll(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F34C80]), "intValue");
  }
  else {
    uint64_t v8 = 0;
  }
  [a2 _completedDecodeForPrerollForRequestID:v8];
}

void _figVideoQueueExternalProtectionStatusChanged(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  CFDictionaryRef v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  uint64_t v5 = a2[17];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___figVideoQueueExternalProtectionStatusChanged_block_invoke;
  block[3] = &unk_1E57B40A0;
  void block[5] = &v13;
  void block[6] = a4;
  void block[4] = &v9;
  dispatch_sync(v5, block);
  if (!*((_DWORD *)v10 + 6))
  {
    uint64_t v6 = (void *)[(id)v14[3] valueForKey:*MEMORY[0x1E4F34C50]];
    objc_msgSend(a2, "_setOutputObscuredDueToInsufficientExternalProtection:", objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E4F34C58]));
  }
  uint64_t v7 = (const void *)v14[3];
  if (v7) {
    CFRelease(v7);
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

void sub_194BCCAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void _figVideoQueueFailed(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  signed int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F34C70]);
  if (Value && (v9 = Value, CFTypeID v10 = CFGetTypeID(Value), v10 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
    uint64_t v11 = AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  [a2 _setStatus:2 error:v11];
}

void _figVideoQueueServerConnectionDied(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _setStatus:2, AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0) error];
}

void _figVideoQueueServerDependencyLost(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _setStatus:2, AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0) error];
}

void _figVideoQueueLostDecoderState(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _setRequiresFlushToResumeDecoding:1];
}

void _figVideoQueueFirstVideoFrameEnqueued(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 setReadyForDisplayWithoutKVO:1];
  if (dword_1E9356A30)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t ___figVideoQueueExternalProtectionStatusChanged_block_invoke(void *a1)
{
  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v3 = *(void *)(a1[5] + 8);
    uint64_t CMBaseObject = FigVideoQueueGetCMBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v6 + 48);
    if (v7) {
      uint64_t result = v7(CMBaseObject, *MEMORY[0x1E4F34CB0], *MEMORY[0x1E4F1CF80], v3 + 24);
    }
    else {
      uint64_t result = 4294954514;
    }
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

void sub_194BCD534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BCD9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194BCDB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCDD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BCDFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194BCE9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BCEB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void customURLHandlerHandleRequestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  int v12 = (void *)MEMORY[0x199715AE0]();
  unsigned __int8 v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a1 _customURLHandler] == a2)
  {
    [a1 _handleRequest:a3 requestID:a4 willHandleRequest:&v15];
    uint64_t v13 = 0;
    uint64_t v14 = v15;
  }
  else
  {
    uint64_t v13 = FigSignalErrorAt();
    uint64_t v14 = 0;
  }
  a5(a6, v14, v13);
}

void customURLHandlerRequestCancelled(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a1 _customURLHandler] == a2) {
    [a1 _cancelRequest:a3 requestID:a4];
  }
  else {
    FigSignalErrorAt();
  }
}

uint64_t customURLAuthHandlerHandleRequestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a1 _authHandler] == a2)
  {
    uint64_t v12 = FigCustomURLRequestInfoCopyNSURLAuthenticationChallenge();
    if (!v12)
    {
      [a1 _poseAuthenticationChallengeWithRequestInfo:a3 requestID:a4 challenge:0];
      uint64_t v13 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = FigSignalErrorAt();
  }
  uint64_t v13 = 0;
LABEL_6:

  return a5(a6, v13, v12);
}

void customURLAuthHandlerRequestCancelled(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a1 _authHandler] == a2) {
    [a1 _cancelRequest:a3 requestID:a4];
  }
  else {
    FigSignalErrorAt();
  }
}

uint64_t avarl_createAndInstallRemoteHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = FigCustomURLHandlerRemoteCreateWithID();
  if (v8) {
    return v8;
  }
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, void, uint64_t))(v10 + 8);
  if (!v11) {
    return 4294954514;
  }
  uint64_t v12 = v11(a3, 0, a4);
  if (!v12) {
    *a5 = 0;
  }
  return v12;
}

void sub_194BCFF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD0264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD049C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_194BD08CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD0ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD1168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD17AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD1900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD1CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD1E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD2604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD27A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD2978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD2B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD2E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD3980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD3B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD3F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVCanWriteFilesToDirectoryAtURL(void *a1, void *a2)
{
  if (!a1)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "BOOL AVCanWriteFilesToDirectoryAtURL(NSURL *, NSError **)"), @"AVFileSystemUtilities.m", 38, @"Invalid parameter not satisfying: %@", @"directoryURL != nil" file lineNumber description];
  }
  id v13 = 0;
  uint64_t v4 = [a1 URLByAppendingPathComponent:@"TemporaryFileForAVFoundation"];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data"), "writeToURL:options:error:", v4, 0, &v13);
  if (v5)
  {
    uint64_t v12 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", v4, &v12);
  }
  else
  {
    uint64_t v6 = (void *)[v13 domain];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    if ([v6 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(v13, "code") == 4)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v13, "userInfo"), "mutableCopy");
      [v8 removeObjectForKey:*MEMORY[0x1E4F28328]];
      uint64_t v9 = *MEMORY[0x1E4F289D0];
      [v8 removeObjectForKey:*MEMORY[0x1E4F289D0]];
      [v8 setObject:a1 forKey:v9];
      id v13 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v7 code:4 userInfo:v8];
    }
    if (a2) {
      *a2 = v13;
    }
  }
  return v5;
}

void avrendersynchronizer_timebaseRateChanged(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _updateRateFromTimebase];
}

void sub_194BD61D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194BD66E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_194BD6A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD6C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BD6E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v1 = *(void **)(a1 + 72);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v1);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v5)
          {
            if (objc_msgSend((id)objc_msgSend(v9, "_sampleBufferVideoRenderer"), "_STSLabel")) {
              uint64_t v5 = v9;
            }
            else {
              uint64_t v5 = 0;
            }
          }
          if (!v4) {
            uint64_t v4 = v9;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && !v6)
          {
            if ([v9 _STSLabel]) {
              uint64_t v6 = (uint64_t)v9;
            }
            else {
              uint64_t v6 = 0;
            }
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v10 = *(void **)(a1 + 104);
  if (v10)
  {
    uint64_t v10 = (void *)[v10 _STSLabel];
    if (v10) {
      uint64_t v10 = *(void **)(a1 + 104);
    }
    else {
      *(void *)(a1 + 104) = 0;
    }
  }
  if ([v10 _displayLayer] && v6) {
    goto LABEL_29;
  }
  uint64_t v11 = *(void **)(a1 + 104);
  if (!v11)
  {
    if (!v6)
    {
      if (v5)
      {
        char v19 = v5;
      }
      else
      {
        objc_msgSend(v4, "setSTSLabel:", +[AVSampleBufferRenderSynchronizer _makeSTSLabel](AVSampleBufferRenderSynchronizer, "_makeSTSLabel"));
        char v19 = v4;
      }
      uint64_t v6 = [v19 _sampleBufferVideoRenderer];
    }
LABEL_29:
    *(void *)(a1 + 104) = v6;
    uint64_t v11 = (void *)v6;
  }
  uint64_t v12 = [v11 _STSLabel];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = *(void **)(a1 + 72);
  uint64_t result = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        CMTime v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v18 setSTSLabel:v12];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t result = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v15 = result;
    }
    while (result);
  }
  return result;
}

void sub_194BD7508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

id avrendersynchronize_getTimebaseObserverForRenderer(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = (void *)[a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        if ([v8 objectForKey:@"renderer"] == a1)
        {
          uint64_t v4 = (void *)[v8 objectForKey:@"onceTimebaseObserver"];
          return v4;
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      uint64_t v4 = (void *)[a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

id avrendersynchronize_getClientCompletionHandlerForRenderer(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = (void *)[a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        if ([v8 objectForKey:@"renderer"] == a1)
        {
          uint64_t v4 = (void *)[v8 objectForKey:@"clientCompletionHandler"];
          return v4;
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      uint64_t v4 = (void *)[a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

uint64_t avrendersynchronize_removeTimebaseObserverForRenderer(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        uint64_t result = [v8 objectForKey:@"renderer"];
        if (result == a1)
        {
          if (v8) {
            return [a2 removeObject:v8];
          }
          return result;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_194BD7ECC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void avrendersynchronize_performRendererRemoval(uint64_t a1, void *a2)
{
  CFTypeRef v13 = 0;
  id TimebaseObserverForRenderer = avrendersynchronize_getTimebaseObserverForRenderer((uint64_t)a2, *(void **)(a1 + 80));
  id ClientCompletionHandlerForRenderer = avrendersynchronize_getClientCompletionHandlerForRenderer((uint64_t)a2, *(void **)(a1 + 80));
  avrendersynchronize_removeTimebaseObserverForRenderer((uint64_t)a2, *(void **)(a1 + 80));
  [a2 copyFigSampleBufferAudioRenderer:&v13];
  [a2 setRenderSynchronizer:0 error:0];
  [*(id *)(a1 + 72) removeObject:a2];
  id v6 = +[AVSampleBufferRenderSynchronizer _videoRendererForRenderer:a2];
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", v6));
    if (v7 == *(id *)(a1 + 104)) {
      *(void *)(a1 + 104) = 0;
    }
  }
  avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(a1);
  uint64_t v8 = *(void *)(a1 + 96);
  long long v9 = *(NSObject **)(a1 + 64);
  if (v8) {
    CFRetain(*(CFTypeRef *)(a1 + 96));
  }
  if (v13) {
    CFRetain(v13);
  }
  dispatch_retain(v9);
  id v10 = TimebaseObserverForRenderer;
  long long v11 = *(NSObject **)(a1 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __avrendersynchronize_performRendererRemoval_block_invoke;
  v12[3] = &unk_1E57B7278;
  v12[7] = v13;
  v12[8] = v8;
  void v12[5] = TimebaseObserverForRenderer;
  v12[6] = ClientCompletionHandlerForRenderer;
  v12[4] = v9;
  dispatch_async(v11, v12);
  if (v13) {
    CFRelease(v13);
  }
}

BOOL avsbrs_rendererIsAudioRenderer(void *a1)
{
  CFTypeRef cf = 0;
  [a1 copyFigSampleBufferAudioRenderer:&cf];
  CFTypeRef v1 = cf;
  if (cf) {
    CFRelease(cf);
  }
  return v1 != 0;
}

void __avrendersynchronize_performRendererRemoval_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v6 = *(void *)(VTable + 16);
    a1 = VTable + 16;
    uint64_t v5 = v6;
    uint64_t v7 = v6 ? v5 : 0;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 16);
    if (v8) {
      a1 = v8(v3, v2);
    }
  }
  if (*(void *)(v1 + 48))
  {
    long long v9 = (void *)MEMORY[0x199715AE0](a1);
    (*(void (**)(void))(*(void *)(v1 + 48) + 16))();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __avrendersynchronize_performRendererRemoval_block_invoke_2;
  block[3] = &unk_1E57B1E80;
  id v10 = *(NSObject **)(v1 + 32);
  void block[4] = *(void *)(v1 + 40);
  dispatch_async(v10, block);
  long long v11 = *(const void **)(v1 + 64);
  if (v11) {
    CFRelease(v11);
  }
  long long v12 = *(const void **)(v1 + 56);
  if (v12) {
    CFRelease(v12);
  }
  dispatch_release(*(dispatch_object_t *)(v1 + 32));
}

void __avrendersynchronize_performRendererRemoval_block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t publicCriteriaAreExceptional(void *a1, void *a2, void *a3, void *a4, __CFString **a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v10 = [a1 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(a1);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [a1 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if (!a5) {
      return 1;
    }
    long long v26 = @"preferredLanguages must contain only items of type NSString";
  }
  else
  {
LABEL_9:
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v14 = [a2 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(a2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [a2 countByEnumeratingWithState:&v35 objects:v45 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      if (!a5) {
        return 1;
      }
      long long v26 = @"preferredMediaCharacteristics must contain only items of type NSString";
    }
    else
    {
LABEL_17:
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v18 = [a3 countByEnumeratingWithState:&v31 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
LABEL_19:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(a3);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [a3 countByEnumeratingWithState:&v31 objects:v44 count:16];
            if (v19) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
        if (!a5) {
          return 1;
        }
        long long v26 = @"principalMediaCharacteristics must contain only items of type NSString";
      }
      else
      {
LABEL_25:
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t result = [a4 countByEnumeratingWithState:&v27 objects:v43 count:16];
        if (!result) {
          return result;
        }
        uint64_t v23 = result;
        uint64_t v24 = *(void *)v28;
LABEL_27:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(a4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v23 == ++v25)
          {
            uint64_t v23 = [a4 countByEnumeratingWithState:&v27 objects:v43 count:16];
            uint64_t result = 0;
            if (v23) {
              goto LABEL_27;
            }
            return result;
          }
        }
        if (!a5) {
          return 1;
        }
        long long v26 = @"premiumMediaCharacteristics must contain only items of type NSString";
      }
    }
  }
  *a5 = v26;
  return 1;
}

void sub_194BDB668(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BDBA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BDBB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194BDBD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BDBF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194BDC078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BDC1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void AVFigRouteDiscovererRoutePresentChanged(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _routePresentChanged];
}

void AVFigRouteDiscovererRouteServerDied(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D39E0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_serverDied", v5, v6);
}

void AVFigRouteDiscovererEndpointDescriptorChanged(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _endpointDescriptorChanged];
}

uint64_t timeline_WrapSegment(uint64_t a1)
{
  uint64_t v2 = [AVPlayerItemSegment alloc];
  return (uint64_t)[(AVPlayerItemSegment *)v2 _initWithFigSegment:a1];
}

void avitemintegratedtimeline_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F32F70]))
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    int v10 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F32F58]), "integerValue");
    int v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F32F50]), "BOOLValue");
    uint64_t v12 = @"AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonSegmentsChanged";
    if (v10 == 2) {
      uint64_t v12 = @"AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonCurrentSegmentChanged";
    }
    if (v10 == 3) {
      uint64_t v13 = @"AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonLoadedTimeRangesChanged";
    }
    else {
      uint64_t v13 = v12;
    }
    [v9 setObject:v13 forKey:@"AVPlayerIntegratedTimelineSnapshotsOutOfSyncReasonKey"];
    [a2 _issueCachedSeekIfNecessary];
    if (v10 != 2 && v11 == 0)
    {
      if (v10 == 1) {
        [a2 _ensureObserversHandleSnapshotSegmentsChanged];
      }
    }
    else
    {
      if ([a2 _currentSegmentTypeOfCurrentSnapshot]) {
        uint64_t v15 = objc_msgSend((id)objc_msgSend(a2, "_interstitialPlayer"), "currentItem");
      }
      else {
        uint64_t v15 = [a2 _primaryItem];
      }
      [a2 _ensureObserversAreScheduledForItem:v15];
    }
    uint64_t v19 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerIntegratedTimelineSnapshotsOutOfSyncNotification" object:a2 userInfo:v9];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v19);
  }
  else
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F32F60]))
    {
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F32F48]), "integerValue");
      uint64_t v17 = a2;
      uint64_t v18 = 1;
    }
    else
    {
      if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F32F68])) {
        goto LABEL_23;
      }
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F32F48]), "integerValue");
      uint64_t v17 = a2;
      uint64_t v18 = 0;
    }
    [v17 _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:v16 finished:v18];
  }
LABEL_23:
}

void avitemintegratedtimeline_interstitialPlayer_fpNotificationCallback(uint64_t a1, void *a2, const void *a3, void *a4, void *a5)
{
  uint64_t v9 = (void *)MEMORY[0x199715AE0]();
  if (CFEqual(a3, @"AVPlayerCurrentItemDidChangeNotification")
    && objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"ReasonForCurrentItemDidChange"), "isEqual:", @"ReasonAdvanceAtEnd")&& objc_msgSend(a2, "_currentSegmentTypeOfCurrentSnapshot") == 1)
  {
    objc_msgSend(a2, "_ensureObserversAreScheduledForItem:", objc_msgSend(a4, "currentItem"));
  }
}

void sub_194BE2A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BE7FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void figEndpointNotificationCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)a2[1];
  uint64_t v9 = (void *)MEMORY[0x199715AE0]();
  if (figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce != -1) {
    dispatch_once(&figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce, &__block_literal_global_36);
  }
  uint64_t v10 = [(id)figEndpointNotificationCallback_figToAVFNotificationMapping objectForKey:a3];
  if (v10)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", v10, a2, a5);
    goto LABEL_10;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F20768]])
  {
    AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
    goto LABEL_10;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F206D8]])
  {
    int v11 = v8[7];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __figEndpointNotificationCallback_block_invoke_2;
    block[3] = &unk_1E57B1E80;
    void block[4] = v8;
    dispatch_sync(v11, block);
    uint64_t v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = @"ExternalDevice_MFiCertificateSerialNumberChangedNotification";
LABEL_9:
    [v12 postNotificationName:v13 object:a2];
    goto LABEL_10;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F20788]])
  {
    uint64_t v14 = (void *)[a5 objectForKey:*MEMORY[0x1E4F21590]];
    if (v14)
    {
      uint64_t v15 = v14;
      if ([v14 valueForKey:*MEMORY[0x1E4F21598]]) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"ExternalDevice_ElectronicTollCollectionChangedNotification", a2);
      }
      if ([v15 valueForKey:*MEMORY[0x1E4F215A0]])
      {
        uint64_t v12 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v13 = @"ExternalDevice_NavigationAidedDrivingChangedNotification";
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)v8[2];
    if ([a3 isEqualToString:*MEMORY[0x1E4F207B0]])
    {
      if (v16 && (objc_opt_respondsToSelector() & 1) != 0) {
        objc_msgSend(v16, "iOSUIRequestedForApplicationURL:", objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F215A8]));
      }
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F20770]])
    {
      if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v17 = (void *)[a5 objectForKey:*MEMORY[0x1E4F21280]];
        if ([v17 isEqualToString:*MEMORY[0x1E4F21270]])
        {
          uint64_t v18 = 0;
        }
        else if ([v17 isEqualToString:*MEMORY[0x1E4F21260]])
        {
          uint64_t v18 = 1;
        }
        else if ([v17 isEqualToString:*MEMORY[0x1E4F21268]])
        {
          uint64_t v18 = 2;
        }
        else
        {
          uint64_t v18 = 0;
        }
        [v16 siriRequestedWithAction:v18];
      }
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F20790]])
    {
      uint64_t v19 = a2;
      id v20 = a5;
      uint64_t v21 = v8[10];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __figEndpointNotificationCallback_block_invoke_3;
      v22[3] = &unk_1E57B3248;
      v22[4] = v8;
      v22[5] = a5;
      void v22[6] = v16;
      v22[7] = a2;
      dispatch_async(v21, v22);
    }
  }
LABEL_10:
}

uint64_t __figEndpointNotificationCallback_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", @"ExternalDevice_ScreenBecameAvailable", *MEMORY[0x1E4F20410], @"ExternalDevice_ScreenBecameUnavailable", *MEMORY[0x1E4F20418], @"ExternalDevice_OwnsTurnByTurnNavigationChangedNotification", *MEMORY[0x1E4F20428], @"ExternalDevice_NightModeChangedNotification", *MEMORY[0x1E4F20758], @"ExternalDevice_LimitedUIChangedNotification", *MEMORY[0x1E4F20748], @"ExternalDevice_PerformanceReportNotificationPosted", *MEMORY[0x1E4F20760], 0);
  figEndpointNotificationCallback_figToAVFNotificationMapping = result;
  return result;
}

void __figEndpointNotificationCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v1)
  {

    *(void *)(*(void *)(a1 + 32) + 4_Block_object_dispose(&STACK[0x420], 8) = 0;
  }
}

void __figEndpointNotificationCallback_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"uuid"));
  if (*(void *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(*(id *)(a1 + 48), "setViewAreaIndex:andAdjacentViewAreas:forScreenID:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"viewAreaIndex"), "integerValue"), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"adjacentViewAreas"), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"uuid"));
  }

  uint64_t v2 = *(void **)(a1 + 56);
}

void sub_194BE9974(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_194BEA318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BEA668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 208), 8);
  _Block_object_dispose((const void *)(v28 - 176), 8);
  _Block_object_dispose((const void *)(v28 - 128), 8);
  _Unwind_Resume(a1);
}

void _customCompositorPropertyChangedNotificationReceived(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  [a2 _customCompositorFigPropertyDidChange];
}

uint64_t _customCompositorShouldCancelPendingFramesCallback(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x199715AE0]();
  uint64_t v3 = objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 _customCompositorShouldCancelPendingFrames];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v4;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldCancelPendingFramesCallback_block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = v4;
  dispatch_async(global_queue, block);
  return v5;
}

uint64_t _customCompositorShouldAnticipateRendering(uint64_t a1, long long *a2, long long *a3, long long *a4, long long *a5)
{
  uint64_t v10 = (void *)MEMORY[0x199715AE0]();
  int v11 = objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  uint64_t v12 = v11;
  if (v11)
  {
    long long v24 = *a2;
    uint64_t v25 = *((void *)a2 + 2);
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    long long v20 = *a4;
    uint64_t v21 = *((void *)a4 + 2);
    long long v18 = *a5;
    uint64_t v19 = *((void *)a5 + 2);
    uint64_t v13 = [v11 _customCompositorShouldAnticipateRenderingFromTime:&v24 toTime:&v22 andThenFromTime:&v20 toTime:&v18];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = v12;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldAnticipateRendering_block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = v12;
  dispatch_async(global_queue, block);
  return v13;
}

uint64_t _customCompositorShouldPrerollForRendering(uint64_t a1, long long *a2, long long *a3, long long *a4, long long *a5, int a6)
{
  uint64_t v12 = (void *)MEMORY[0x199715AE0]();
  uint64_t v13 = objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  id v14 = v13;
  if (v13)
  {
    long long v26 = *a2;
    uint64_t v27 = *((void *)a2 + 2);
    long long v24 = *a3;
    uint64_t v25 = *((void *)a3 + 2);
    long long v22 = *a4;
    uint64_t v23 = *((void *)a4 + 2);
    long long v20 = *a5;
    uint64_t v21 = *((void *)a5 + 2);
    uint64_t v15 = [v13 _customCompositorShouldPrerollForRenderingFromTime:&v26 toTime:&v24 andThenFromTime:&v22 toTime:&v20 requestID:a6];
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = v14;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldPrerollForRendering_block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = v14;
  dispatch_async(global_queue, block);
  return v15;
}

uint64_t _customCompositorShouldRenderFrameFromWindowCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6)
{
  uint64_t v12 = (void *)MEMORY[0x199715AE0]();
  uint64_t v13 = objc_msgSend((id)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "callbackContextForToken:", a1), "referencedObject");
  id v14 = v13;
  if (v13)
  {
    if (a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F1CC08];
    }
    if (a3) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = MEMORY[0x1E4F1CC08];
    }
    long long v22 = *a5;
    uint64_t v23 = *((void *)a5 + 2);
    uint64_t v17 = [v13 _compositionFrame:a6 atTime:&v22 requiresRenderUsingSources:v15 requiresSampleBuffersUsingSources:v16 withInstruction:a4];
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = v14;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___customCompositorShouldRenderFrameFromWindowCallback_block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = v14;
  dispatch_async(global_queue, block);
  return v17;
}

void ___customCompositorShouldCancelPendingFramesCallback_block_invoke(uint64_t a1)
{
}

void ___customCompositorShouldAnticipateRendering_block_invoke(uint64_t a1)
{
}

void ___customCompositorShouldPrerollForRendering_block_invoke(uint64_t a1)
{
}

void ___customCompositorShouldRenderFrameFromWindowCallback_block_invoke(uint64_t a1)
{
}

uint64_t GetBitDepthFromPixelFormatType(OSType pixelFormat)
{
  CFDictionaryRef v1 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], pixelFormat);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = v1;
  if (CFDictionaryGetValue(v1, (const void *)*MEMORY[0x1E4F24E20])) {
    uint64_t UInt64 = FigCFNumberGetUInt64();
  }
  else {
    uint64_t UInt64 = 0;
  }
  CFRelease(v2);
  return UInt64;
}

uint64_t AVOutputContextCreatePlatformDependentScreenOrVideoRoutingContext(void *a1, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v4 = (__CFString *)objc_msgSend(+[AVExecutionEnvironment sharedExecutionEnvironment](AVExecutionEnvironment, "sharedExecutionEnvironment"), "platformIdentifier");
  uint64_t v5 = *MEMORY[0x1E4F1CF80];
  if (v4 == @"AVPlatformIdentifierMacOS") {
    [a1 createVideoContextWithAllocator:v5 options:a2 context:&v7];
  }
  else {
    [a1 createPerAppSecondDisplayContextWithAllocator:v5 options:a2 context:&v7];
  }
  return v7;
}

void AVFigRoutingContextSystemPickerVideoRouteChanged(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_systemPickerVideoRouteChanged", v5, v6);
}

void AVFigRoutingContextRouteConfigUpdated(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75608]);
  uint64_t v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75618]);
  uint64_t v10 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75610]);
  int v11 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755D8]);
  uint64_t v12 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755D0]);
  uint64_t v13 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755C8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_routeConfigUpdatedWithID:reason:initiator:endedError:deviceID:previousDeviceIDs:", Value, v9, v10, v11, v12, v13, v15, v16);
}

void AVFigRoutingContextCurrentRouteChanged(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_currentRouteChanged", v5, v6);
}

void AVFigRoutingContextRouteChangeStarted(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75600]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_routeChangeStartedWithID:", Value, v10, v11);
}

void AVFigRoutingContextRouteChangeEnded(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75600]);
  uint64_t v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755F8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_routeChangeEndedWithID:reason:", Value, v9, v11, v12);
}

void AVFigRoutingContextGroupConfigurationChanged(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_groupConfigurationChanged", v5, v6);
}

void AVFigRoutingContextServerConnectionDied(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_serverConnectionDied", v5, v6);
}

void AVFigRoutingContextRemoteControlChannelAvailabilityChanged(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_remoteControlChannelAvailabilityChanged", v5, v6);
}

void AVFigRoutingContextPredictedSelectedRouteDescriptorChanged(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_predictedSelectedRouteDescriptorChanged", v5, v6);
}

void AVFigVolumeControllerCanUseForRoutingContextDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canUseForRoutingContextDidChangeForRoutingContextWIthID:", Value, v10, v11);
}

void AVFigVolumeControllerCanSetMasterVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canSetMasterVolumeDidChangeForRoutingContextWithID:", Value, v10, v11);
}

void AVFigVolumeControllerMasterVolumeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_masterVolumeDidChangeForRoutingContextWithID:", Value, v10, v11);
}

void AVFigVolumeControllerMasterVolumeControlTypeDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_masterVolumeControlTypeDidChangeForRoutingContextWithID:", Value, v10, v11);
}

void AVFigVolumeControllerCanMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_canMuteDidChangeForRoutingContextWithID:", Value, v10, v11);
}

void AVFigVolumeControllerMuteDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F757E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_muteDidChangeForRoutingContextWithID:", Value, v10, v11);
}

void sub_194BF0760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BF0C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(__CFDictionary *a1, const void *a2)
{
  if (!a2) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  CFDictionarySetValue(a1, @"showErrorPromptDictionaryToEcho", a2);
  return 1;
}

void AVOutputContextSendCommandCompletion(uint64_t a1, uint64_t a2, signed int a3, void (**a4)(void, void))
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  if (a3) {
    uint64_t v7 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  }
  else {
    uint64_t v7 = 0;
  }
  a4[2](a4, v7);
}

void AVCommChannelDidReceiveData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755C0]);
  uint64_t v9 = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755E8]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_didReceiveData:fromCommChannelUUID:", v9, Value, v11, v12);
}

void AVCommChannelDidClose(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFNumberRef Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F755C0]);
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "didCloseCommChannelUUID:", Value, v10, v11);
}

void sub_194BF3474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BF3AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194BF3D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AVFigRoutingContextSendDataCompletion(uint64_t a1, uint64_t a2, signed int a3, void (**a4)(void, void))
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a3)
  {
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  if (a4) {
LABEL_5:
  }
    a4[2](a4, v8);
LABEL_6:
}

void AVOutputContextManagerServerConnectionDied(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (sSharedAgentQueue == a2)
  {
    dispatch_async(a2, &__block_literal_global_385);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVFigEndpointUIAgentOutputContextManagerSharedEndpointUIAgentDidChangeNotification", 0);
  }
}

void AVOutputContextManagerShowErrorPrompt(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75498]);
  uint64_t v9 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F75518]);
  uint64_t v10 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F754C8]);
  uint64_t v11 = CFDictionaryGetValue(a5, @"echoedDictionary");
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_showErrorPromptForRouteDescriptor:reason:didFailToConnectToOutputDeviceDictionary:", v9, v10, v11, v13, v14);
}

void __AVOutputContextManagerServerConnectionDied_block_invoke()
{
  if (sSharedAgent)
  {
    CFRelease((CFTypeRef)sSharedAgent);
    sSharedAgent = 0;
  }
}

uint64_t AVGetValidAudioTimePitchAlgorithms()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"LowQualityZeroLatency", @"Spectral", @"TimeDomain", @"Varispeed", 0);
}

void sub_194BF61DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF62A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF63C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF6640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BF6750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BF69CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

AVMovieInternal *_createMovieStorageWithLoader(void *a1)
{
  id v2 = a1;
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(AVMovieInternal);
    uint64_t v4 = v3;
    if (v3)
    {
      objc_storeStrong((id *)&v3->loader, a1);
      uint64_t v5 = objc_alloc_init(AVDispatchOnce);
      makeTracksArrayOnce = v4->makeTracksArrayOnce;
      v4->makeTracksArrayOnce = v5;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_194BF6A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF6B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF6CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _movieOptionsDictionaryToFigAssetOptionsDictionary(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  uint64_t v5 = [v3 objectForKey:@"AVMovieReferenceRestrictionsKey"];
  uint64_t v6 = figAssetCreationFlagsForAssetReferenceRestrictionsAsNumber(v5);
  int ShouldPreferNominalDurations = AVAssetShouldPreferNominalDurations(v3, @"AVAssetPreferNominalDurationsKey");
  uint64_t v8 = *MEMORY[0x1E4F1CFD0];
  [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F32030]];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F32B10]];
  [v4 setObject:v9 forKey:*MEMORY[0x1E4F31FF0]];
  uint64_t v10 = [v3 objectForKey:@"AVMovieShouldPrepareToOptimizeForExclusivePlaybackKey"];
  int v11 = [v10 BOOLValue];

  if (v11) {
    [v4 setObject:v8 forKey:*MEMORY[0x1E4F320B0]];
  }
  uint64_t v12 = [v3 objectForKey:@"AVMovieShouldSupportAliasDataReferencesKey"];
  if (v12) {
    [v4 setObject:v12 forKey:*MEMORY[0x1E4F32100]];
  }
  uint64_t v13 = [v3 objectForKey:0x1EE5949F8];
  if (v13) {
    [v4 setObject:v13 forKey:*MEMORY[0x1E4F320B8]];
  }
  uint64_t v14 = v6 | 0x100;
  if (!ShouldPreferNominalDurations) {
    uint64_t v14 = v6;
  }
  *a2 |= v14;

  return v4;
}

void sub_194BF6F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF6FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF72B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF741C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF7504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF7700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF7810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF78EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF797C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AVMovie;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_194BF7A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF7C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BF7E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF8040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF8224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _figOptionsFromAVMovieOptions(void *a1)
{
  id v1 = a1;
  if (AVAssetShouldPreferNominalDurations(v1, @"AVAssetPreferNominalDurationsKey"))
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v1];
    [v2 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F330D8]];
  }
  else
  {
    id v2 = v1;
  }
  return v2;
}

void sub_194BF82D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF84BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF8704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF8960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_194BF8ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF8D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _configureFigObjects(uint64_t *a1, void *a2)
{
  id v3 = a2;
  if (a1 && (uint64_t v4 = *a1) != 0)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, void, void, uint64_t *))(v6 + 8);
    if (v7)
    {
      uint64_t v8 = v7(v4, 0, 0, a1 + 1);
      if (v8)
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v61 = 0;
        uint64_t v9 = _movieOptionsDictionaryToFigAssetOptionsDictionary(v3, &v61);
        uint64_t v10 = *MEMORY[0x1E4F1CF80];
        uint64_t v8 = FigAssetRemoteCreateWithFormatReader();
        if (!v8)
        {
          CFTypeRef cf = 0;
          uint64_t CMBaseObject = FigAssetGetCMBaseObject();
          uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v12) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v14 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v13 + 48);
          if (v14) {
            v14(CMBaseObject, *MEMORY[0x1E4F32310], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v15 = FigAssetGetCMBaseObject();
          uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v16) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = 0;
          }
          id v18 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v17 + 48);
          if (v18) {
            v18(v15, *MEMORY[0x1E4F347E0], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v19 = FigAssetGetCMBaseObject();
          uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v20) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = 0;
          }
          long long v22 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v21 + 48);
          if (v22) {
            v22(v19, *MEMORY[0x1E4F321B0], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v23 = FigAssetGetCMBaseObject();
          uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v24) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          long long v26 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v25 + 48);
          if (v26) {
            v26(v23, *MEMORY[0x1E4F347D0], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v27 = FigAssetGetCMBaseObject();
          uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v28) {
            uint64_t v29 = v28;
          }
          else {
            uint64_t v29 = 0;
          }
          long long v30 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v29 + 48);
          if (v30) {
            v30(v27, *MEMORY[0x1E4F347F8], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v31 = FigAssetGetCMBaseObject();
          uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v32) {
            uint64_t v33 = v32;
          }
          else {
            uint64_t v33 = 0;
          }
          long long v34 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v33 + 48);
          if (v34) {
            v34(v31, *MEMORY[0x1E4F321B8], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v35 = FigAssetGetCMBaseObject();
          uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v36) {
            uint64_t v37 = v36;
          }
          else {
            uint64_t v37 = 0;
          }
          long long v38 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v37 + 48);
          if (v38) {
            v38(v35, *MEMORY[0x1E4F322E8], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v39 = FigAssetGetCMBaseObject();
          uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v40) {
            uint64_t v41 = v40;
          }
          else {
            uint64_t v41 = 0;
          }
          long long v42 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v41 + 48);
          if (v42) {
            v42(v39, *MEMORY[0x1E4F322E0], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v43 = FigAssetGetCMBaseObject();
          uint64_t v44 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v44) {
            uint64_t v45 = v44;
          }
          else {
            uint64_t v45 = 0;
          }
          long long v46 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v45 + 48);
          if (v46) {
            v46(v43, *MEMORY[0x1E4F32270], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v47 = FigAssetGetCMBaseObject();
          uint64_t v48 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v48) {
            uint64_t v49 = v48;
          }
          else {
            uint64_t v49 = 0;
          }
          uint64_t v50 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v49 + 48);
          if (v50) {
            v50(v47, *MEMORY[0x1E4F32318], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v51 = FigAssetGetCMBaseObject();
          uint64_t v52 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v52) {
            uint64_t v53 = v52;
          }
          else {
            uint64_t v53 = 0;
          }
          CFDictionaryRef v54 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v53 + 48);
          if (v54) {
            v54(v51, *MEMORY[0x1E4F32260], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v55 = FigAssetGetCMBaseObject();
          uint64_t v56 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v56) {
            uint64_t v57 = v56;
          }
          else {
            uint64_t v57 = 0;
          }
          uint64_t v58 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v57 + 48);
          if (v58) {
            v58(v55, *MEMORY[0x1E4F32250], v10, &cf);
          }
          if (cf)
          {
            CFRelease(cf);
            uint64_t v8 = 0;
            CFTypeRef cf = 0;
          }
          else
          {
            uint64_t v8 = 0;
          }
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 4294954514;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 4294954516;
  }

  return v8;
}

void sub_194BF9758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

AVMutableMovieInternal *_createMutableMovieStorageWithFigObjects(uint64_t a1)
{
  id v2 = objc_alloc_init(AVMutableMovieInternal);
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    trackWaitingSemaphore = v2->trackWaitingSemaphore;
    v2->trackWaitingSemaphore = (OS_dispatch_semaphore *)v3;

    if (v2->trackWaitingSemaphore)
    {
      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      metadataWaitingSemaphore = v2->metadataWaitingSemaphore;
      v2->metadataWaitingSemaphore = (OS_dispatch_semaphore *)v5;

      if (v2->metadataWaitingSemaphore)
      {
        uint64_t v7 = *(OpaqueFigMutableMovie **)a1;
        if (*(void *)a1) {
          uint64_t v7 = (OpaqueFigMutableMovie *)CFRetain(v7);
        }
        v2->figMutableMovie = v7;
        uint64_t v8 = *(OpaqueFigFormatReader **)(a1 + 8);
        if (v8) {
          uint64_t v8 = (OpaqueFigFormatReader *)CFRetain(v8);
        }
        v2->formatReader = v8;
        uint64_t v9 = *(OpaqueFigAsset **)(a1 + 16);
        if (v9) {
          uint64_t v9 = (OpaqueFigAsset *)CFRetain(v9);
        }
        v2->figAsset = v9;
        uint64_t v10 = objc_alloc_init(AVDispatchOnce);
        makeTracksArrayOnce = v2->makeTracksArrayOnce;
        v2->makeTracksArrayOnce = v10;
      }
    }
  }
  return v2;
}

void sub_194BF9838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF98C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF9BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF9CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BF9EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFA158(_Unwind_Exception *a1)
{
  if (v1) {

  }
  _Unwind_Resume(a1);
}

void sub_194BFA254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFA33C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFA4C4(_Unwind_Exception *a1)
{
  uint64_t v4 = v1;

  _Unwind_Resume(a1);
}

void sub_194BFA5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void mutableMovieNotificationHandler(uint64_t a1, void *a2, const void *a3, uint64_t a4, void *a5)
{
  id v10 = a2;
  if (v10)
  {
    if (a3)
    {
      int v7 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F31EE0]);
      if (a5)
      {
        if (v7)
        {
          uint64_t v8 = [a5 objectForKey:*MEMORY[0x1E4F32168]];
          uint64_t v9 = v8;
          if (v8)
          {
            if ([v8 isEqualToString:*MEMORY[0x1E4F32310]]) {
              [v10 _signalTracksUpdated];
            }
            if (([v9 isEqualToString:*MEMORY[0x1E4F321B8]] & 1) != 0
              || ([v9 isEqualToString:*MEMORY[0x1E4F322E8]] & 1) != 0
              || ([v9 isEqualToString:*MEMORY[0x1E4F322E0]] & 1) != 0
              || ([v9 isEqualToString:*MEMORY[0x1E4F32270]] & 1) != 0
              || ([v9 isEqualToString:*MEMORY[0x1E4F32318]] & 1) != 0
              || ([v9 isEqualToString:*MEMORY[0x1E4F32260]] & 1) != 0
              || [v9 isEqualToString:*MEMORY[0x1E4F32250]])
            {
              [v10 _signalMetadataUpdated];
            }
          }
        }
      }
    }
  }
}

void sub_194BFA74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BFA83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BFA8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AVMutableMovie;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_194BFA9A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFAA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFABC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFAF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFAF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFB484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFC1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BFC2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFCC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_194BFD214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFD41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFD638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFDD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_194BFE004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194BFE50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFE6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_194BFE820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __runningAnInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  runningAnInternalBuild_internalBuild = result;
  return result;
}

void avcks_didProvideKeyRequest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v10 = (void *)MEMORY[0x199715AE0]();
  [a1 didProvideKeyRequestWithBoss:a2 keySpecifier:a3 requestID:a4 renewalRequest:0 supportsOfflineKey:a5 != 0];
}

void avcks_didProvideRenewalKeyRequest(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v10 = (void *)MEMORY[0x199715AE0]();
  [a1 didProvideKeyRequestWithBoss:a2 keySpecifier:a3 requestID:a4 renewalRequest:1 supportsOfflineKey:a5 != 0];
}

void avcks_didUpdatePersistableKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  [a1 _handleUpdateToPersistentKey:a4 forKeyIdentifier:FigContentKeySpecifierGetIdentifier()];
}

void avcks_contentKeyRequestDidSucceed(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (void *)MEMORY[0x199715AE0]();
  [a1 contentKeyRequestDidSucceedWithBoss:a2 keySpecifier:a3 requestID:a4 cryptor:a5];
}

void avcks_contentKeyRequestDidFail(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend((id)objc_msgSend(a1, "keyRequestByID:", a4), "_handleKeyResponseError:", a5);
  [a1 removeResourcesForID:a4];
}

void avcks_externalProtectionStateChangedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  [a1 externalProtectionStateChangedCallbackWithBoss:a2 keySpecifier:a3];
}

void sub_194C07620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_194C08020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t avcks_decodeInitializationDataAndCopyInformation(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, void *a6)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  uint64_t v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a1 options:0 error:&v38];
  if (!v11) {
    goto LABEL_34;
  }
  uint64_t v12 = (void *)v11;
  objc_opt_class();
  uint64_t v31 = a2;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v32 = 0;
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_34:
    uint64_t v30 = 0;
    uint64_t v18 = 0;
    uint64_t v33 = 0;
    goto LABEL_35;
  }
  uint64_t v16 = [v12 objectForKeyedSubscript:@"sinf"];
  uint64_t v15 = [v12 objectForKeyedSubscript:@"codc"];
  uint64_t v32 = [v12 objectForKeyedSubscript:@"mtyp"];
  uint64_t v14 = [v12 objectForKeyedSubscript:@"cont"];
  uint64_t v13 = (void *)[v12 objectForKeyedSubscript:@"pssh"];
  if (!v16)
  {
    uint64_t v12 = 0;
    char v17 = 1;
    goto LABEL_9;
  }
  uint64_t v12 = (void *)v16;
  a2 = v31;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v33 = v14;
    uint64_t v30 = v15;
    uint64_t v18 = v32;
    goto LABEL_35;
  }
  char v17 = 0;
LABEL_9:
  uint64_t v33 = v14;
  uint64_t v30 = v15;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_51:
      a2 = v31;
      uint64_t v18 = v32;
      goto LABEL_35;
    }
  }
  uint64_t v18 = v32;
  if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!v33 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!v13)
      {
        id v19 = 0;
        if ((v17 & 1) == 0)
        {
LABEL_19:
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t result = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (result)
          {
            uint64_t v21 = result;
            uint64_t v27 = a4;
            uint64_t v28 = a5;
            uint64_t v29 = a6;
            long long v22 = 0;
            uint64_t v23 = *(void *)v35;
            while (2)
            {
              uint64_t v24 = 0;
              do
              {
                if (*(void *)v35 != v23) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v24), "dataUsingEncoding:", 4, v27, v28, v29);
                if (!v25)
                {
                  uint64_t result = 4294955465;
                  goto LABEL_38;
                }
                uint64_t result = (uint64_t)(id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v25 options:0];
                if (!result) {
                  goto LABEL_38;
                }
                uint64_t v26 = result;
                if (!v22) {
                  long long v22 = (void *)[MEMORY[0x1E4F1CA48] array];
                }
                [v22 addObject:v26];
                ++v24;
              }
              while (v21 != v24);
              uint64_t result = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
              uint64_t v21 = result;
              if (result) {
                continue;
              }
              break;
            }
LABEL_38:
            a5 = v28;
            a6 = v29;
            a4 = v27;
LABEL_39:
            a2 = v31;
            uint64_t v18 = v32;
            if (!v31) {
              goto LABEL_41;
            }
            goto LABEL_40;
          }
LABEL_33:
          long long v22 = 0;
          goto LABEL_39;
        }
LABEL_32:
        uint64_t result = 0;
        goto LABEL_33;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBase64EncodedData:options:", objc_msgSend(v13, "dataUsingEncoding:", 4), 0);
        if (v19)
        {
          if ((v17 & 1) == 0) {
            goto LABEL_19;
          }
          goto LABEL_32;
        }
      }
    }
    goto LABEL_51;
  }
  a2 = v31;
LABEL_35:
  uint64_t result = FigSignalErrorAt();
  long long v22 = 0;
  id v19 = 0;
  if (a2) {
LABEL_40:
  }
    *a2 = v22;
LABEL_41:
  if (a3) {
    *a3 = v30;
  }
  if (a4) {
    *a4 = v18;
  }
  if (a5) {
    *a5 = v33;
  }
  if (a6) {
    *a6 = v19;
  }
  return result;
}

void sub_194C0B840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194C0BB4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_194C0C2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194C0C550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_194C0DD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194C0E1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void customURLHandlerHandleRequestCallback_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  uint64_t v12 = (void *)MEMORY[0x199715AE0]();
  unsigned __int8 v15 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 _handleRequest:a3 withRequestID:a4 fromHandler:a2 willHandleRequest:&v15];
    uint64_t v13 = 0;
    uint64_t v14 = v15;
  }
  else
  {
    uint64_t v13 = FigSignalErrorAt();
    uint64_t v14 = 0;
  }
  a5(a6, v14, v13);
}

void sub_194C0EC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_194C10910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_194C10BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void avckrg_keyResponseErrorCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleKeyResponseError:forCryptorUUID:andCryptorKeyRequestID:", a4, a2, a3);
  }
  else {
    FigSignalErrorAt();
  }
}

void avckrg_keyResponseSuccessfullyProcessedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleKeyResponseSuccessfullyProcessedForCryptorUUID:andCryptorKeyRequestID:", a2, a3);
  }
  else {
    FigSignalErrorAt();
  }
}

void avckrg_persistentKeyUpdatedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleUpdateToPersistentKey:forKeyIdentifier:", a3, a2);
  }
  else {
    FigSignalErrorAt();
  }
}

void avckrg_secureStopDidFinalizeRecordCallback(void *a1)
{
  id v2 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleSecureStopDidFinalizeRecordCallback");
  }
  else {
    FigSignalErrorAt();
  }
}

void avckrg_externalProtectionStateChangedCallback(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x199715AE0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)objc_msgSend(a1, "_contentKeySession"), "_handleExternalProtectionStateChangedCallbackForCryptKeyIdentifier:", a2);
  }
  else {
    FigSignalErrorAt();
  }
}

void sub_194C1113C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194C1149C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL AVSampleBufferAttachContentKey(CMSampleBufferRef sbuf, AVContentKey *contentKey, NSError **outError)
{
  FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  if (![(AVContentKey *)contentKey cryptor]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Content key is not valid" userInfo:0]);
  }
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(FormatDescription);
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  if ([(NSString *)[(AVContentKeySpecifier *)[(AVContentKey *)contentKey contentKeySpecifier] keySystem] isEqual:@"FairPlayStreaming"])
  {
    if (MediaSubType == 1903587385) {
      goto LABEL_8;
    }
    if (clientCanDecryptContentKey_getBrowserEngineOnce != -1) {
      dispatch_once(&clientCanDecryptContentKey_getBrowserEngineOnce, &__block_literal_global_42);
    }
    if (!clientCanDecryptContentKey_browserEngineAllowedToDecrypt && MediaType == 1936684398)
    {
LABEL_8:
      uint64_t v8 = [(AVContentKey *)contentKey cryptor];
      uint64_t v14 = *MEMORY[0x1E4F1CFC8];
      uint64_t v9 = *(void **)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      if (*v10 >= 6uLL)
      {
        uint64_t v11 = (void (*)(OpaqueFigCPECryptor *, void, uint64_t, void, uint64_t *))v10[19];
        if (v11) {
          v11(v8, *MEMORY[0x1E4F1FD78], 1903587385, *MEMORY[0x1E4F1CF80], &v14);
        }
      }
      if (FigCFEqual())
      {
LABEL_15:
        FigSampleBufferSetDecryptor();
        uint64_t v12 = 0;
        if (!outError) {
          return v12 == 0;
        }
        goto LABEL_19;
      }
    }
    else if (clientCanDecryptContentKey_browserEngineAllowedToDecrypt)
    {
      goto LABEL_15;
    }
  }
  uint64_t v12 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(-12161, 0);
  if (outError) {
LABEL_19:
  }
    *outError = v12;
  return v12 == 0;
}

void __clientCanDecryptContentKey_block_invoke()
{
  id v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  CFTypeRef v1 = SecTaskCopyValueForEntitlement(v0, @"com.apple.private.coremedia.allow-fps-attachment", 0);
  clientCanDecryptContentKey_browserEngineAllowedToDecrypt = FigIsSecTaskGPUExtensionOfBrowserEngine() | (v1 == (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
  if (v1) {
    CFRelease(v1);
  }
  if (v0)
  {
    CFRelease(v0);
  }
}

void AVOutputDeviceAuthorizationSessionShowAuthPrompt(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = (void *)MEMORY[0x199715AE0]();
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a5, (const void *)*MEMORY[0x1E4F75490]);
  uint64_t v9 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F75520]);
  id v10 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F75518]);
  CFBooleanRef v11 = (const __CFBoolean *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F754C0]);
  uint64_t v12 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F754C8]);
  if (dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_showAuthPromptWithUniqueID:routeDescriptor:pinMode:reason:", v9, v10, CFBooleanGetValue(v11) != 0, v12, v14, v15);
}

void AVOutputDeviceAuthorizationSessionShowFinishedWithPrompt(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = (void *)MEMORY[0x199715AE0]();
  if (dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "_finishedWithPrompt", v5, v6);
}

void sub_194C13634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void sub_194C1367C()
{
}

void sub_194C13B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194C13C54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194C13D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194C13EC4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_194C13FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_194C14148(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_194C1439C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

SEL __AVRouteDetectorShouldAppBeConsideredForeground_block_invoke()
{
  AVRouteDetectorShouldAppBeConsideredForeground_uiApplicationClass = (uint64_t)NSClassFromString(&cfstr_Uiapplication.isa);
  AVRouteDetectorShouldAppBeConsideredForeground_sharedApplicationSelector = (uint64_t)NSSelectorFromString(&cfstr_Sharedapplicat.isa);
  SEL result = NSSelectorFromString(&cfstr_Applicationsta.isa);
  AVRouteDetectorShouldAppBeConsideredForeground_applicationStateSelector = (uint64_t)result;
  return result;
}

Class initDADiscoveryConfiguration()
{
  if (DeviceAccessLibrary_sOnce != -1) {
    dispatch_once(&DeviceAccessLibrary_sOnce, &__block_literal_global_70_0);
  }
  Class result = objc_getClass("DADiscoveryConfiguration");
  classDADiscoveryConfiguration = (uint64_t)result;
  getDADiscoveryConfigurationClass = DADiscoveryConfigurationFunction;
  return result;
}

uint64_t DADiscoveryConfigurationFunction()
{
  return classDADiscoveryConfiguration;
}

void *__DeviceAccessLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/DeviceAccess.framework/DeviceAccess", 2);
  DeviceAccessLibrary_sLib = (uint64_t)result;
  return result;
}

Class initDADiscovery()
{
  if (DeviceAccessLibrary_sOnce != -1) {
    dispatch_once(&DeviceAccessLibrary_sOnce, &__block_literal_global_70_0);
  }
  Class result = objc_getClass("DADiscovery");
  classDADiscoverCGFloat y = (uint64_t)result;
  getDADiscoveryClass[0] = DADiscoveryFunction;
  return result;
}

uint64_t DADiscoveryFunction()
{
  return classDADiscovery;
}

uint64_t _figManifoldDiscoveredNewTrackInStream(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = AVStringForOSType(a3);
  return [a2 _figManifold:a1 discoveredNewTrackID:a4 mediaType:v7];
}

uint64_t _figManifoldAllNewTracksReady(uint64_t a1, void *a2)
{
  return [a2 _figManifoldAllNewTracksReady:a1];
}

uint64_t _figManifoldError()
{
  return 0;
}

uint64_t _figManifoldFormatDescriptionOrDecryptorDidChange(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return [a3 _figManifold:a1 formatDescription:a4 orDecryptorDidChange:a5 forTrackID:a2];
}

uint64_t _figManifoldPushedSampleBuffer(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [a3 _figManifold:a1 pushedSampleBuffer:a6 trackID:a2 flags:a4];
}

uint64_t _figManifoldTrackDidEnd(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _figManifold:a1 trackDidEnd:a2];
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1F40D4BA8](inAudioConverter);
}

OSStatus AudioConverterGetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F40D4BC8](inAudioConverter, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioConverterGetPropertyInfo(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *outSize, Boolean *outWritable)
{
  return MEMORY[0x1F40D4BD0](inAudioConverter, *(void *)&inPropertyID, outSize, outWritable);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1F40D4BE8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioFileGetGlobalInfo(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x1F40D4C28](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetGlobalInfoSize(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *outDataSize)
{
  return MEMORY[0x1F40D4C30](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, outDataSize);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F40D4CB0](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFormatGetPropertyInfo(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *outPropertyDataSize)
{
  return MEMORY[0x1F40D4CB8](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, outPropertyDataSize);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40F4CE8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1F40D5288](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x1F40D5298](message, headerField);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1F40D52D8](alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x1F40D52E8](response);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(CFAllocatorRef allocator, LangCode lcode, RegionCode rcode)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BF0](allocator, lcode, rcode);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CFURLConnectionCancel()
{
  return MEMORY[0x1F40D53C8]();
}

uint64_t CFURLConnectionCreate()
{
  return MEMORY[0x1F40D53D0]();
}

uint64_t CFURLConnectionScheduleWithRunLoop()
{
  return MEMORY[0x1F40D53E8]();
}

uint64_t CFURLConnectionStart()
{
  return MEMORY[0x1F40D53F0]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1F40D88F0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

uint64_t CFURLRequestCopyAllHTTPHeaderFields()
{
  return MEMORY[0x1F40D5438]();
}

uint64_t CFURLRequestCreateHTTPRequest()
{
  return MEMORY[0x1F40D5450]();
}

uint64_t CFURLRequestGetURL()
{
  return MEMORY[0x1F40D5478]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1F40D54F8]();
}

uint64_t CFURLResponseGetMIMEType()
{
  return MEMORY[0x1F40D5500]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D9998](gray, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

OSStatus CMAudioFormatDescriptionCreateSummary(CFAllocatorRef allocator, CFArrayRef formatDescriptionArray, uint32_t flags, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DB888](allocator, formatDescriptionArray, *(void *)&flags, formatDescriptionOut);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1F40DB8A0](desc, sizeOut);
}

const AudioFormatListItem *__cdecl CMAudioFormatDescriptionGetRichestDecodableFormat(CMAudioFormatDescriptionRef desc)
{
  return (const AudioFormatListItem *)MEMORY[0x1F40DB8C8](desc);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1F40DB8D8](desc);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

uint64_t CMBaseObjectIsMemberOfClass()
{
  return MEMORY[0x1F40DB938]();
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB950](theBuffer, targetBBuf, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1F40DB968](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB970](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB978](structureAllocator, *(void *)&subBlockCapacity, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB980](structureAllocator, bufferReference, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1F40DB9C0](theBuffer, offset, length);
}

uint64_t CMByteStreamCreateForBlockBuffer()
{
  return MEMORY[0x1F40DBAF0]();
}

uint64_t CMByteStreamGetCMBaseObject()
{
  return MEMORY[0x1F40DBB08]();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1F40DBB30]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x1F40DBB38](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x1F40DBB50](retstr, hostTime);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1F40DBBA8](formatDescription, otherFormatDescription);
}

Boolean CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription, CFTypeRef formatDescriptionExtensionKeysToIgnore, CFTypeRef sampleDescriptionExtensionAtomKeysToIgnore)
{
  return MEMORY[0x1F40DBBB0](formatDescription, otherFormatDescription, formatDescriptionExtensionKeysToIgnore, sampleDescriptionExtensionAtomKeysToIgnore);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBD0](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1F40DBBD8]();
}

uint64_t CMFormatDescriptionGetWidestColorPropertiesFromFormatDescriptions()
{
  return MEMORY[0x1F40DBBE0]();
}

uint64_t CMFormatDescriptionGetWidestGamutAndLargestDynamicRangeColorPropertiesFromFormatDescriptions()
{
  return MEMORY[0x1F40DBBE8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

OSStatus CMMetadataCreateIdentifierForKeyAndKeySpace(CFAllocatorRef allocator, CFTypeRef key, CFStringRef keySpace, CFStringRef *identifierOut)
{
  return MEMORY[0x1F40DBC28](allocator, key, keySpace, identifierOut);
}

OSStatus CMMetadataCreateKeyFromIdentifier(CFAllocatorRef allocator, CFStringRef identifier, CFTypeRef *keyOut)
{
  return MEMORY[0x1F40DBC30](allocator, identifier, keyOut);
}

OSStatus CMMetadataCreateKeySpaceFromIdentifier(CFAllocatorRef allocator, CFStringRef identifier, CFStringRef *keySpaceOut)
{
  return MEMORY[0x1F40DBC38](allocator, identifier, keySpaceOut);
}

Boolean CMMetadataDataTypeRegistryDataTypeConformsToDataType(CFStringRef dataType, CFStringRef conformsToDataType)
{
  return MEMORY[0x1F40DBC40](dataType, conformsToDataType);
}

CFStringRef CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(CFStringRef dataType)
{
  return (CFStringRef)MEMORY[0x1F40DBC48](dataType);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC80](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1F40DBCA8]();
}

uint64_t CMNotificationCenterBarrier()
{
  return MEMORY[0x1F40DBCB0]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1F40DBCB8]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x1F40DBCC0]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1F40DBCD8]();
}

OSStatus CMSampleBufferCallForEachSample(CMSampleBufferRef sbuf, OSStatus (__cdecl *callback)(CMSampleBufferRef, CMItemCount, void *), void *refcon)
{
  return MEMORY[0x1F40DBD18](sbuf, callback, refcon);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBD80](sbuf);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB8](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE8](retstr, sbuf);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1F40DBE08](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE30](sbuf);
}

Boolean CMSampleBufferHasDataFailed(CMSampleBufferRef sbuf, OSStatus *statusOut)
{
  return MEMORY[0x1F40DBE40](sbuf, statusOut);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x1F40DBE98](sbuf, outputPresentationTimeStamp);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x1F40DBF20](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

OSStatus CMTagCollectionCreate(CFAllocatorRef allocator, const CMTag *tags, CMItemCount tagCount, CMTagCollectionRef *newCollectionOut)
{
  return MEMORY[0x1F40DBF68](allocator, tags, tagCount, newCollectionOut);
}

CFTypeID CMTagCollectionGetTypeID(void)
{
  return MEMORY[0x1F40DBF98]();
}

OSStatus CMTextFormatDescriptionGetDisplayFlags(CMFormatDescriptionRef desc, CMTextDisplayFlags *displayFlagsOut)
{
  return MEMORY[0x1F40DC068](desc, displayFlagsOut);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

CMTime *__cdecl CMTimeFoldIntoRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *foldRange)
{
  return (CMTime *)MEMORY[0x1F40DC0F8](retstr, time, foldRange);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x1F40DC130](retstr, t, fromRange, toRange);
}

CFDictionaryRef CMTimeMappingCopyAsDictionary(CMTimeMapping *mapping, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC138](mapping, allocator);
}

CMTimeMapping *__cdecl CMTimeMappingMake(CMTimeMapping *__return_ptr retstr, CMTimeRange *source, CMTimeRange *target)
{
  return (CMTimeMapping *)MEMORY[0x1F40DC148](retstr, source, target);
}

CMTimeMapping *__cdecl CMTimeMappingMakeFromDictionary(CMTimeMapping *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeMapping *)MEMORY[0x1F40DC158](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC178](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMTimebaseAddTimerDispatchSource(CMTimebaseRef timebase, dispatch_source_t timerSource)
{
  return MEMORY[0x1F40DC208](timebase, timerSource);
}

uint64_t CMTimebaseCreateLoopingTimebase()
{
  return MEMORY[0x1F40DC230]();
}

uint64_t CMTimebaseCreateReadOnlyTimebase()
{
  return MEMORY[0x1F40DC238]();
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return MEMORY[0x1F40DC240](allocator, sourceClock, timebaseOut);
}

Float64 CMTimebaseGetRate(CMTimebaseRef timebase)
{
  MEMORY[0x1F40DC258](timebase);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x1F40DC260](retstr, timebase);
}

uint64_t CMTimebaseGetTimeClampedAboveAnchorTime()
{
  return MEMORY[0x1F40DC270]();
}

OSStatus CMTimebaseRemoveTimerDispatchSource(CMTimebaseRef timebase, dispatch_source_t timerSource)
{
  return MEMORY[0x1F40DC298](timebase, timerSource);
}

OSStatus CMTimebaseSetRate(CMTimebaseRef timebase, Float64 rate)
{
  return MEMORY[0x1F40DC2A8](timebase, rate);
}

OSStatus CMTimebaseSetTime(CMTimebaseRef timebase, CMTime *time)
{
  return MEMORY[0x1F40DC2D0](timebase, time);
}

OSStatus CMTimebaseSetTimerDispatchSourceNextFireTime(CMTimebaseRef timebase, dispatch_source_t timerSource, CMTime *fireTime, uint32_t flags)
{
  return MEMORY[0x1F40DC2D8](timebase, timerSource, fireTime, *(void *)&flags);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  MEMORY[0x1F40DC360](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1F40DC368]();
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDD0](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1F40DFE18](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1F40DFE58]();
}

uint64_t FCSupport_CopyChapterTimeRangesForChapterGroup()
{
  return MEMORY[0x1F40ED0C0]();
}

uint64_t FPSupport_CreateAllVideoRangesSupportedByDisplays()
{
  return MEMORY[0x1F40ED0D0]();
}

uint64_t FPSupport_CreateDestinationPixelBufferAttributes()
{
  return MEMORY[0x1F40ED0D8]();
}

uint64_t FPSupport_GetCurrentDisplayModeVideoRangeAndSizeAndFrameRate()
{
  return MEMORY[0x1F40ED0F0]();
}

uint64_t FPSupport_GetDisplayVideoRangeNotificationSingleton()
{
  return MEMORY[0x1F40ED0F8]();
}

uint64_t FPSupport_GetModeString()
{
  return MEMORY[0x1F40ED100]();
}

uint64_t FPSupport_IncrementSeekID()
{
  return MEMORY[0x1F40ED108]();
}

uint64_t FPSupport_InitialSeekIDForSource()
{
  return MEMORY[0x1F40ED110]();
}

uint64_t FPSupport_SeekIDGetSource()
{
  return MEMORY[0x1F40ED118]();
}

uint64_t FigAlternateCopyAsXPCObjectWithContext()
{
  return MEMORY[0x1F40ED150]();
}

uint64_t FigAlternateCreateWithXPCObject()
{
  return MEMORY[0x1F40ED158]();
}

uint64_t FigAssetCacheInspectorCreate_Remote()
{
  return MEMORY[0x1F40ED160]();
}

uint64_t FigAssetCacheInspectorGetCMBaseObject()
{
  return MEMORY[0x1F40ED168]();
}

uint64_t FigAssetCopyAssetWithDownloadToken()
{
  return MEMORY[0x1F40ED170]();
}

uint64_t FigAssetCreateOptionsDictFromPList()
{
  return MEMORY[0x1F40ED178]();
}

uint64_t FigAssetCreatePListFromOptionsDict()
{
  return MEMORY[0x1F40ED180]();
}

uint64_t FigAssetCreateWithBlockBuffer()
{
  return MEMORY[0x1F40ED188]();
}

uint64_t FigAssetCreateWithByteStream()
{
  return MEMORY[0x1F40ED190]();
}

uint64_t FigAssetCreateWithURL()
{
  return MEMORY[0x1F40ED198]();
}

uint64_t FigAssetDownloadStorageManagementCopyExpirationDateForAssetAtURL()
{
  return MEMORY[0x1F40ED1A0]();
}

uint64_t FigAssetDownloadStorageManagementCopyPriorityForAssetAtURL()
{
  return MEMORY[0x1F40ED1A8]();
}

uint64_t FigAssetDownloadStorageManagementSetExpirationDateForAssetAtURL()
{
  return MEMORY[0x1F40ED1B0]();
}

uint64_t FigAssetDownloaderGetCMBaseObject()
{
  return MEMORY[0x1F40ED1C0]();
}

uint64_t FigAssetExportSessionCopyProperty()
{
  return MEMORY[0x1F40ED1D8]();
}

uint64_t FigAssetExportSessionCreateWithAsset()
{
  return MEMORY[0x1F40ED1E0]();
}

uint64_t FigAssetExportSessionExportAsynchronously()
{
  return MEMORY[0x1F40ED208]();
}

uint64_t FigAssetExportSessionGetEstimatedOutputFileLength()
{
  return MEMORY[0x1F40ED220]();
}

uint64_t FigAssetExportSessionProperty_GetAudioMix_CFDictionaryValueCallBacks()
{
  return MEMORY[0x1F40ED230]();
}

uint64_t FigAssetExportSessionSetProperty()
{
  return MEMORY[0x1F40ED238]();
}

uint64_t FigAssetExportSessionVideoCompositionCreate()
{
  return MEMORY[0x1F40ED240]();
}

uint64_t FigAssetGetCMBaseObject()
{
  return MEMORY[0x1F40ED248]();
}

uint64_t FigAssetImageGeneratorCreateFromAssetWithOptions()
{
  return MEMORY[0x1F40ED250]();
}

uint64_t FigAssetImageGeneratorCreateRemoteFromAssetWithOptions()
{
  return MEMORY[0x1F40ED258]();
}

uint64_t FigAssetImageGeneratorGetFigBaseObject()
{
  return MEMORY[0x1F40ED260]();
}

uint64_t FigAssetReaderCreateWithURLAndFormatReader()
{
  return MEMORY[0x1F40ED270]();
}

uint64_t FigAssetReaderGetFigBaseObject()
{
  return MEMORY[0x1F40ED278]();
}

uint64_t FigAssetReaderRemoteCreateWithURLAndFormatReader()
{
  return MEMORY[0x1F40ED280]();
}

uint64_t FigAssetRemoteCopyAssetWithDownloadToken()
{
  return MEMORY[0x1F40ED288]();
}

uint64_t FigAssetRemoteCreateWithBlockBuffer()
{
  return MEMORY[0x1F40ED290]();
}

uint64_t FigAssetRemoteCreateWithFormatReader()
{
  return MEMORY[0x1F40ED298]();
}

uint64_t FigAssetRemoteCreateWithMovieProxyData()
{
  return MEMORY[0x1F40ED2A0]();
}

uint64_t FigAssetRemoteCreateWithURL()
{
  return MEMORY[0x1F40ED2A8]();
}

uint64_t FigAssetRemoteCreateWithURLAndRetry()
{
  return MEMORY[0x1F40ED2B0]();
}

uint64_t FigAssetTrackGetCMBaseObject()
{
  return MEMORY[0x1F40ED2B8]();
}

uint64_t FigAssetWriterCreateForWritingFragmentedData()
{
  return MEMORY[0x1F40ED2C0]();
}

uint64_t FigAssetWriterCreateWithURL()
{
  return MEMORY[0x1F40ED2C8]();
}

uint64_t FigAssetWriterGetFigBaseObject()
{
  return MEMORY[0x1F40ED2D0]();
}

uint64_t FigAssetWriterRemoteCreateForWritingFragmentedData()
{
  return MEMORY[0x1F40ED2D8]();
}

uint64_t FigAssetWriterRemoteCreateWithURL()
{
  return MEMORY[0x1F40ED2E0]();
}

uint64_t FigAssetWriterRemoteDoesSupportVirtualCaptureCard()
{
  return MEMORY[0x1F40ED2E8]();
}

uint64_t FigAtomicAdd32()
{
  return MEMORY[0x1F40DC578]();
}

uint64_t FigAtomicCompareAndSwap32()
{
  return MEMORY[0x1F40DC590]();
}

uint64_t FigAtomicCompareAndSwapPtr()
{
  return MEMORY[0x1F40DC598]();
}

uint64_t FigAtomicIncrement32()
{
  return MEMORY[0x1F40DC5A8]();
}

uint64_t FigAudioCompressionOptionsGetPreset()
{
  return MEMORY[0x1F40ED2F0]();
}

uint64_t FigAudioFormatDescriptionGetRichestDecodableFormatAndChannelLayout()
{
  return MEMORY[0x1F40DC638]();
}

uint64_t FigBoxedMetadataAppendCFTypedValue()
{
  return MEMORY[0x1F40DC678]();
}

uint64_t FigBoxedMetadataAppendCGPoint()
{
  return MEMORY[0x1F40DC680]();
}

uint64_t FigBoxedMetadataAppendCGRect()
{
  return MEMORY[0x1F40DC688]();
}

uint64_t FigBoxedMetadataAppendCGSize()
{
  return MEMORY[0x1F40DC690]();
}

uint64_t FigBoxedMetadataCreateForConstruction()
{
  return MEMORY[0x1F40DC6B8]();
}

uint64_t FigBoxedMetadataEndConstruction()
{
  return MEMORY[0x1F40DC6C8]();
}

uint64_t FigBoxedMetadataGetBlockBuffer()
{
  return MEMORY[0x1F40DC6D0]();
}

uint64_t FigBoxedMetadataGetFormatDescription()
{
  return MEMORY[0x1F40DC6D8]();
}

uint64_t FigBoxedMetadataGetTypeID()
{
  return MEMORY[0x1F40DC6F8]();
}

uint64_t FigCDSSessionCreate()
{
  return MEMORY[0x1F40ED328]();
}

uint64_t FigCDSSessionSetBounds()
{
  return MEMORY[0x1F40ED330]();
}

uint64_t FigCDSSessionSetCGContextDevice()
{
  return MEMORY[0x1F40ED338]();
}

uint64_t FigCDSSessionSetCaptionCacheRange()
{
  return MEMORY[0x1F40ED340]();
}

uint64_t FigCDSSessionSetMasterClock()
{
  return MEMORY[0x1F40ED350]();
}

uint64_t FigCDSSessionSetTime()
{
  return MEMORY[0x1F40ED358]();
}

uint64_t FigCDSSessionStart()
{
  return MEMORY[0x1F40ED360]();
}

uint64_t FigCDSSessionStop()
{
  return MEMORY[0x1F40ED368]();
}

uint64_t FigCDSSessionSynchronizeDefaults()
{
  return MEMORY[0x1F40ED370]();
}

uint64_t FigCDSSessionUpdateCGContext()
{
  return MEMORY[0x1F40ED378]();
}

uint64_t FigCFArrayAppendInt32()
{
  return MEMORY[0x1F40DC810]();
}

uint64_t FigCFArrayCreateMutableCopy()
{
  return MEMORY[0x1F40DC870]();
}

uint64_t FigCFArrayGetInt32AtIndex()
{
  return MEMORY[0x1F40DC8D0]();
}

uint64_t FigCFCopyCompactDescription()
{
  return MEMORY[0x1F40DC918]();
}

uint64_t FigCFDateCreateFromString()
{
  return MEMORY[0x1F40DC938]();
}

uint64_t FigCFDictionaryCopyArrayOfValues()
{
  return MEMORY[0x1F40DC958]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x1F40DC970]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x1F40DC988]();
}

uint64_t FigCFDictionaryGetCMTimeIfPresent()
{
  return MEMORY[0x1F40DC9B8]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1F40DC9F0]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x1F40DCA00]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x1F40DCA38]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x1F40DCA48]();
}

uint64_t FigCFDictionarySetBoolean()
{
  return MEMORY[0x1F40DCA60]();
}

uint64_t FigCFDictionarySetCGSize()
{
  return MEMORY[0x1F40DCA80]();
}

uint64_t FigCFDictionarySetCMTime()
{
  return MEMORY[0x1F40DCA88]();
}

uint64_t FigCFDictionarySetFloat()
{
  return MEMORY[0x1F40DCAA0]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x1F40DCAC0]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x1F40DCAC8]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x1F40DCAE8]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1F40DCAF8]();
}

uint64_t FigCFNumberCreateFloat64()
{
  return MEMORY[0x1F40DCB20]();
}

uint64_t FigCFNumberCreateSInt32()
{
  return MEMORY[0x1F40DCB30]();
}

uint64_t FigCFNumberCreateSInt64()
{
  return MEMORY[0x1F40DCB38]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x1F40DCB50]();
}

uint64_t FigCFNumberCreateUInt64()
{
  return MEMORY[0x1F40DCB58]();
}

uint64_t FigCFNumberGetFloat64()
{
  return MEMORY[0x1F40DCB70]();
}

uint64_t FigCFNumberGetUInt64()
{
  return MEMORY[0x1F40DCB98]();
}

uint64_t FigCFStringCreateLoggingIdentifierOfLength()
{
  return MEMORY[0x1F40DCBF8]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x1F40DCC20]();
}

uint64_t FigCFURLCreateCacheKey()
{
  return MEMORY[0x1F40DCC48]();
}

uint64_t FigCFURLIsLocalResource()
{
  return MEMORY[0x1F40DCC90]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x1F40DCCA8]();
}

uint64_t FigCLCPCaptionConversionValidatorCreate()
{
  return MEMORY[0x1F40ED380]();
}

uint64_t FigCLCPCaptionFormatConformerCreate()
{
  return MEMORY[0x1F40ED388]();
}

uint64_t FigCPEIsSupportedFormatDescription()
{
  return MEMORY[0x1F40ED390]();
}

uint64_t FigCPEProtectorRemoteCreateForScheme()
{
  return MEMORY[0x1F40ED398]();
}

uint64_t FigCPERemoteInitializeWithOptions()
{
  return MEMORY[0x1F40ED3A0]();
}

uint64_t FigCPERemoteUninitialize()
{
  return MEMORY[0x1F40ED3A8]();
}

uint64_t FigCaptionClientCreate()
{
  return MEMORY[0x1F40ED3B0]();
}

uint64_t FigCaptionClientSetBounds()
{
  return MEMORY[0x1F40ED3B8]();
}

uint64_t FigCaptionClientSetCGContextDevice()
{
  return MEMORY[0x1F40ED3C0]();
}

uint64_t FigCaptionClientSetCaptionArray()
{
  return MEMORY[0x1F40ED3C8]();
}

uint64_t FigCaptionClientSetCaptionCacheRange()
{
  return MEMORY[0x1F40ED3D0]();
}

uint64_t FigCaptionClientSetMasterClock()
{
  return MEMORY[0x1F40ED3E0]();
}

uint64_t FigCaptionClientSetTime()
{
  return MEMORY[0x1F40ED3E8]();
}

uint64_t FigCaptionClientStart()
{
  return MEMORY[0x1F40ED3F0]();
}

uint64_t FigCaptionClientStop()
{
  return MEMORY[0x1F40ED3F8]();
}

uint64_t FigCaptionClientSynchronizeDefaults()
{
  return MEMORY[0x1F40ED400]();
}

uint64_t FigCaptionClientUpdateCGContext()
{
  return MEMORY[0x1F40ED408]();
}

uint64_t FigCaptionConversionValidatorGetCMBaseObject()
{
  return MEMORY[0x1F40ED410]();
}

uint64_t FigCaptionCreate()
{
  return MEMORY[0x1F40ED418]();
}

uint64_t FigCaptionDataCreateMutable()
{
  return MEMORY[0x1F40DCD78]();
}

uint64_t FigCaptionDataCreateMutableCopy()
{
  return MEMORY[0x1F40DCD80]();
}

uint64_t FigCaptionDataGetCMBaseObject()
{
  return MEMORY[0x1F40DCD88]();
}

uint64_t FigCaptionDynamicStyleCreate()
{
  return MEMORY[0x1F40DCDB8]();
}

uint64_t FigCaptionDynamicStyleGetInitialValue()
{
  return MEMORY[0x1F40DCDC8]();
}

uint64_t FigCaptionDynamicStyleGetTypeID()
{
  return MEMORY[0x1F40DCDD8]();
}

uint64_t FigCaptionGeometryCopyCellBasedDimensionAsDictionary()
{
  return MEMORY[0x1F40DCE08]();
}

uint64_t FigCaptionGeometryGetCellBasedDimensionFromDictionary()
{
  return MEMORY[0x1F40DCE20]();
}

uint64_t FigCaptionGetCMBaseObject()
{
  return MEMORY[0x1F40ED420]();
}

uint64_t FigCaptionGroupCreate()
{
  return MEMORY[0x1F40DCE30]();
}

uint64_t FigCaptionRegionCreateMutable()
{
  return MEMORY[0x1F40DCE78]();
}

uint64_t FigCaptionRegionCreateMutableCopy()
{
  return MEMORY[0x1F40DCE80]();
}

uint64_t FigCaptionRegionGetCMBaseObject()
{
  return MEMORY[0x1F40DCE88]();
}

uint64_t FigCaptionTimelineGeneratorAddSampleBuffer()
{
  return MEMORY[0x1F40ED428]();
}

uint64_t FigCaptionTimelineGeneratorCreate()
{
  return MEMORY[0x1F40ED430]();
}

uint64_t FigCaptionTimelineGeneratorFinish()
{
  return MEMORY[0x1F40ED438]();
}

uint64_t FigConcurrentAccessDetectorBeginReading()
{
  return MEMORY[0x1F40DCF40]();
}

uint64_t FigConcurrentAccessDetectorBeginWriting()
{
  return MEMORY[0x1F40DCF48]();
}

uint64_t FigConcurrentAccessDetectorCreate()
{
  return MEMORY[0x1F40DCF50]();
}

uint64_t FigConcurrentAccessDetectorDestroy()
{
  return MEMORY[0x1F40DCF58]();
}

uint64_t FigConcurrentAccessDetectorEndReading()
{
  return MEMORY[0x1F40DCF60]();
}

uint64_t FigConcurrentAccessDetectorEndWriting()
{
  return MEMORY[0x1F40DCF68]();
}

uint64_t FigContentKeyBossCreateRemote()
{
  return MEMORY[0x1F40ED450]();
}

uint64_t FigContentKeyRequestDataParamsCreate()
{
  return MEMORY[0x1F40ED458]();
}

uint64_t FigContentKeyRequestParamsCreate()
{
  return MEMORY[0x1F40ED460]();
}

uint64_t FigContentKeyResponseParamsCreate()
{
  return MEMORY[0x1F40ED468]();
}

uint64_t FigContentKeySecureTokenRequestParamsCreate()
{
  return MEMORY[0x1F40ED470]();
}

uint64_t FigContentKeySessionRemoteCreateSession()
{
  return MEMORY[0x1F40ED478]();
}

uint64_t FigContentKeySpecifierCreate()
{
  return MEMORY[0x1F40ED480]();
}

uint64_t FigContentKeySpecifierGetIdentifier()
{
  return MEMORY[0x1F40ED490]();
}

uint64_t FigContentKeySpecifierGetKeySystem()
{
  return MEMORY[0x1F40ED498]();
}

uint64_t FigCopyCGColorSRGBAsArray()
{
  return MEMORY[0x1F40DCFA8]();
}

uint64_t FigCopyMPEGTransportStreamMIMETypes()
{
  return MEMORY[0x1F40ED4A0]();
}

uint64_t FigCopyQTMovieMIMETypes()
{
  return MEMORY[0x1F40ED4A8]();
}

uint64_t FigCopyRankedLanguagesAccordingToPreferredLanguages()
{
  return MEMORY[0x1F40DCFC8]();
}

uint64_t FigCopyRankedLanguagesAccordingToPreferredLanguages2()
{
  return MEMORY[0x1F40DCFD0]();
}

uint64_t FigCopySetOfAudioSupportedMIMETypes()
{
  return MEMORY[0x1F40ED4B0]();
}

uint64_t FigCopySetOfFormatReaderSupportedFileExtensions()
{
  return MEMORY[0x1F40ED4B8]();
}

uint64_t FigCopySetOfFormatReaderSupportedFileTypes()
{
  return MEMORY[0x1F40ED4C0]();
}

uint64_t FigCopySetOfFormatReaderSupportedMIMETypes()
{
  return MEMORY[0x1F40ED4C8]();
}

uint64_t FigCopySetOfFormatReaderSupportedUTIs()
{
  return MEMORY[0x1F40ED4D0]();
}

uint64_t FigCopySetOfPlaylistSupportedMIMETypes()
{
  return MEMORY[0x1F40ED4D8]();
}

uint64_t FigCopySetOfStreamingSupportedMIMETypes()
{
  return MEMORY[0x1F40ED4E0]();
}

uint64_t FigCopySetOfStreamingSupportedUTIs()
{
  return MEMORY[0x1F40ED4E8]();
}

uint64_t FigCopyWebVTTMIMETypes()
{
  return MEMORY[0x1F40ED4F0]();
}

uint64_t FigCreate3x2MatrixArrayFromCGAffineTransform()
{
  return MEMORY[0x1F40ED4F8]();
}

uint64_t FigCreate3x3MatrixArrayFromCGAffineTransform()
{
  return MEMORY[0x1F40ED500]();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return MEMORY[0x1F40DD008]();
}

uint64_t FigCreateCFDataWithBlockBufferNoCopy()
{
  return MEMORY[0x1F40DD040]();
}

uint64_t FigCreateCGColorSRGBFromArray()
{
  return MEMORY[0x1F40DD058]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x1F4103098]();
}

uint64_t FigCustomURLHandlerRemoteClientCreateWithXPCEndpoint()
{
  return MEMORY[0x1F40DD090]();
}

uint64_t FigCustomURLHandlerRemoteCreateWithID()
{
  return MEMORY[0x1F40DD098]();
}

uint64_t FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID()
{
  return MEMORY[0x1F40DD0A0]();
}

uint64_t FigCustomURLHandlerServerCopyXPCEndpoint()
{
  return MEMORY[0x1F40DD0A8]();
}

uint64_t FigCustomURLHandlerServerEnsure()
{
  return MEMORY[0x1F40DD0B0]();
}

uint64_t FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers()
{
  return MEMORY[0x1F40DD0F0]();
}

uint64_t FigCustomURLRequestInfoCopyCryptKeyAttributes()
{
  return MEMORY[0x1F40DD0F8]();
}

uint64_t FigCustomURLRequestInfoCopyCryptor()
{
  return MEMORY[0x1F40DD100]();
}

uint64_t FigCustomURLRequestInfoCopyHTTPHeaders()
{
  return MEMORY[0x1F40DD108]();
}

uint64_t FigCustomURLRequestInfoCopyNSURLAuthenticationChallenge()
{
  return MEMORY[0x1F40DD110]();
}

uint64_t FigCustomURLRequestInfoCopyURL()
{
  return MEMORY[0x1F40DD118]();
}

uint64_t FigCustomURLRequestInfoCopyUserAgent()
{
  return MEMORY[0x1F40DD120]();
}

uint64_t FigCustomURLRequestInfoGetByteRange()
{
  return MEMORY[0x1F40DD130]();
}

uint64_t FigCustomURLRequestInfoGetCryptorKeyRequestID()
{
  return MEMORY[0x1F40DD138]();
}

uint64_t FigCustomURLRequestInfoGetIsPingRequest()
{
  return MEMORY[0x1F40DD140]();
}

uint64_t FigCustomURLRequestInfoGetIsRenewalRequest()
{
  return MEMORY[0x1F40DD148]();
}

uint64_t FigCustomURLRequestInfoGetIsSecureStopSupported()
{
  return MEMORY[0x1F40DD150]();
}

uint64_t FigCustomURLResponseInfoCreateMutable()
{
  return MEMORY[0x1F40DD208]();
}

uint64_t FigCustomURLResponseInfoSetContentLength()
{
  return MEMORY[0x1F40DD248]();
}

uint64_t FigCustomURLResponseInfoSetContentRenewalDate()
{
  return MEMORY[0x1F40DD250]();
}

uint64_t FigCustomURLResponseInfoSetFinalURL()
{
  return MEMORY[0x1F40DD258]();
}

uint64_t FigCustomURLResponseInfoSetHTTPHeaders()
{
  return MEMORY[0x1F40DD260]();
}

uint64_t FigCustomURLResponseInfoSetHTTPStatusCode()
{
  return MEMORY[0x1F40DD268]();
}

uint64_t FigCustomURLResponseInfoSetIsByteRangeAccessSupported()
{
  return MEMORY[0x1F40DD270]();
}

uint64_t FigCustomURLResponseInfoSetIsCachingDisabled()
{
  return MEMORY[0x1F40DD278]();
}

uint64_t FigCustomURLResponseInfoSetIsEntireLengthAvailableOnDemand()
{
  return MEMORY[0x1F40DD280]();
}

uint64_t FigCustomURLResponseInfoSetNSURLCredential()
{
  return MEMORY[0x1F40DD288]();
}

uint64_t FigCustomURLResponseInfoSetNSURLSessionAuthChallengeDisposition()
{
  return MEMORY[0x1F40DD290]();
}

uint64_t FigCustomURLResponseInfoSetRedirectLocation()
{
  return MEMORY[0x1F40DD298]();
}

uint64_t FigCustomURLResponseInfoSetRedirectRequestHeaders()
{
  return MEMORY[0x1F40DD2A0]();
}

uint64_t FigCustomURLResponseInfoSetResourceSize()
{
  return MEMORY[0x1F40DD2A8]();
}

uint64_t FigCustomURLResponseInfoSetRoundTripTime()
{
  return MEMORY[0x1F40DD2B0]();
}

uint64_t FigCustomURLResponseInfoSetSuppressErrorLogging()
{
  return MEMORY[0x1F40DD2B8]();
}

uint64_t FigCustomURLResponseInfoSetUniversalTypeIdentifier()
{
  return MEMORY[0x1F40DD2C0]();
}

uint64_t FigDataChannelGroupAddDataChannel()
{
  return MEMORY[0x1F40ED518]();
}

uint64_t FigDataChannelGroupCreate()
{
  return MEMORY[0x1F40ED520]();
}

uint64_t FigEndpointCopyActiveEndpointOfType()
{
  return MEMORY[0x1F40DD438]();
}

uint64_t FigEndpointExtendedGetClassID()
{
  return MEMORY[0x1F40DD458]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x1F40DD468]();
}

uint64_t FigEndpointUIAgentXPCRemoteCreate()
{
  return MEMORY[0x1F412CA40]();
}

uint64_t FigExportSettingsAverageBitRateForSourceAndExportPreset()
{
  return MEMORY[0x1F40ED5A0]();
}

uint64_t FigExportSettingsForExportPreset()
{
  return MEMORY[0x1F40ED5A8]();
}

uint64_t FigExportSettings_CopyEffectiveColorPropertyForPresetAndInputOutputFormat()
{
  return MEMORY[0x1F40ED5B0]();
}

uint64_t FigExportSettings_GetMaximumBitsPerComponent()
{
  return MEMORY[0x1F40ED5B8]();
}

uint64_t FigFileIsFileOnExternalStorageDevice()
{
  return MEMORY[0x1F40DD6B0]();
}

uint64_t FigFileTypeDoesSupportExternalSampleReferences()
{
  return MEMORY[0x1F40ED5C0]();
}

uint64_t FigFormatReaderGetFigBaseObject()
{
  return MEMORY[0x1F40ED5D8]();
}

uint64_t FigGeometryDimensionCopyAsDictionary()
{
  return MEMORY[0x1F40DD740]();
}

uint64_t FigGeometryDimensionMake()
{
  return MEMORY[0x1F40DD760]();
}

uint64_t FigGeometryDimensionMakeFromDictionary()
{
  return MEMORY[0x1F40DD768]();
}

uint64_t FigGeometryMarginsCopyAsDictionary()
{
  return MEMORY[0x1F40DD798]();
}

uint64_t FigGeometryMarginsMake()
{
  return MEMORY[0x1F40DD7A8]();
}

uint64_t FigGeometryPointCopyAsDictionary()
{
  return MEMORY[0x1F40DD7B8]();
}

uint64_t FigGeometryPointMake()
{
  return MEMORY[0x1F40DD7D8]();
}

uint64_t FigGeometryPointMakeFromDictionary()
{
  return MEMORY[0x1F40DD7E0]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x1F40DD840]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x1F40DD858]();
}

uint64_t FigGetCGAffineTransformFrom3x2MatrixArray()
{
  return MEMORY[0x1F40ED600]();
}

uint64_t FigGetCGAffineTransformFrom3x3MatrixArray()
{
  return MEMORY[0x1F40ED608]();
}

uint64_t FigGetContinuousUpTimeNanoseconds()
{
  return MEMORY[0x1F40DD880]();
}

uint64_t FigGetRotationAngleAndFlipsFromCGAffineTransform()
{
  return MEMORY[0x1F40ED610]();
}

uint64_t FigIsReferenceAllowedBySecurityPolicy()
{
  return MEMORY[0x1F40DDB58]();
}

uint64_t FigIsSecTaskGPUExtensionOfBrowserEngine()
{
  return MEMORY[0x1F40DDB60]();
}

uint64_t FigItemIntegratedTimelineCreate()
{
  return MEMORY[0x1F40ED630]();
}

uint64_t FigKTraceInit()
{
  return MEMORY[0x1F40DDB70]();
}

uint64_t FigManifoldCreateForMPEG2()
{
  return MEMORY[0x1F40ED640]();
}

uint64_t FigManifoldCreateForMovieFragmentStream()
{
  return MEMORY[0x1F40ED648]();
}

uint64_t FigManifoldCreateForWebVTT()
{
  return MEMORY[0x1F40ED650]();
}

uint64_t FigManifoldCreateRemoteForMPEG2()
{
  return MEMORY[0x1F40ED660]();
}

uint64_t FigManifoldCreateRemoteForMovieFragmentStream()
{
  return MEMORY[0x1F40ED668]();
}

uint64_t FigManifoldCreateRemoteForWebVTT()
{
  return MEMORY[0x1F40ED670]();
}

uint64_t FigManifoldGetFigBaseObject()
{
  return MEMORY[0x1F40ED678]();
}

uint64_t FigMediaSelectionGroupsCreateMatchingSelection()
{
  return MEMORY[0x1F40ED680]();
}

uint64_t FigMediaValidatorCreateMediaValidatorPropertyList()
{
  return MEMORY[0x1F40ED688]();
}

uint64_t FigMediaValidatorValidateFormatDescription()
{
  return MEMORY[0x1F40ED690]();
}

uint64_t FigMediaValidatorValidateRFC4281ExtendedMIMEType()
{
  return MEMORY[0x1F40ED6A8]();
}

uint64_t FigMediaValidatorValidateRFC4281ExtendedMIMETypeForStreaming()
{
  return MEMORY[0x1F40ED6B0]();
}

uint64_t FigMetadataCopyMovieCommonMetadata()
{
  return MEMORY[0x1F40ED6B8]();
}

uint64_t FigMetadataCopyTrackCommonMetadata()
{
  return MEMORY[0x1F40ED6C0]();
}

uint64_t FigMetadataCreateMetadataItemsFromSampleBuffer()
{
  return MEMORY[0x1F40ED6D8]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1F40DDC58]();
}

uint64_t FigMetadataGetCommonKey()
{
  return MEMORY[0x1F40ED6E0]();
}

uint64_t FigMetadataGetCoreMediaDataType()
{
  return MEMORY[0x1F40ED6E8]();
}

uint64_t FigMetadataGetDataTypeWithNamespaceForCoreMediaDataType()
{
  return MEMORY[0x1F40ED6F0]();
}

uint64_t FigMetadataGetISO639_1FromISO639_2T()
{
  return MEMORY[0x1F40ED6F8]();
}

uint64_t FigMetadataGetPackedISO639_2TFromLocaleIdentifier()
{
  return MEMORY[0x1F40ED700]();
}

uint64_t FigMetadataReaderGetFigBaseObject()
{
  return MEMORY[0x1F40ED708]();
}

uint64_t FigMetadataStringKeyToOSTypeKeyWithKeySpace()
{
  return MEMORY[0x1F40ED718]();
}

uint64_t FigMetricInstallAllPlaybackDeserializationHandlers()
{
  return MEMORY[0x1F40ED728]();
}

uint64_t FigMovieFormatWriterCanFileTypeSupportFormatDescription()
{
  return MEMORY[0x1F40ED730]();
}

uint64_t FigMutableCompositionGetFigBaseObject()
{
  return MEMORY[0x1F40ED750]();
}

uint64_t FigMutableMovieCreateFromData()
{
  return MEMORY[0x1F40ED758]();
}

uint64_t FigMutableMovieGetFigBaseObject()
{
  return MEMORY[0x1F40ED768]();
}

uint64_t FigMutableMovieRemoteCreateEmpty()
{
  return MEMORY[0x1F40ED770]();
}

uint64_t FigMutableMovieRemoteCreateFromData()
{
  return MEMORY[0x1F40ED778]();
}

uint64_t FigMutableMovieRemoteCreateFromFormatReader()
{
  return MEMORY[0x1F40ED780]();
}

uint64_t FigMutableMovieRemoteCreateWithURL()
{
  return MEMORY[0x1F40ED788]();
}

uint64_t FigNWActivityCreateToken()
{
  return MEMORY[0x1F40ED790]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x1F40DDD50]();
}

uint64_t FigNotificationCenterAddListeners()
{
  return MEMORY[0x1F40DDD80]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x1F40DDD90]();
}

uint64_t FigNotificationCenterAddWeakListeners()
{
  return MEMORY[0x1F40DDD98]();
}

uint64_t FigNotificationCenterRemoveListeners()
{
  return MEMORY[0x1F40DDDA0]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x1F40DDDB0]();
}

uint64_t FigNotificationCenterRemoveWeakListeners()
{
  return MEMORY[0x1F40DDDB8]();
}

uint64_t FigPKDParsePSSHAndCopyContentKeyInfo()
{
  return MEMORY[0x1F40ED798]();
}

uint64_t FigPlaybackCoordinatorGetCMBaseObject()
{
  return MEMORY[0x1F40ED8E0]();
}

uint64_t FigPlaybackItemGetFigBaseObject()
{
  return MEMORY[0x1F40ED8E8]();
}

uint64_t FigPlaybackItemLogCreateW3CLogData()
{
  return MEMORY[0x1F40ED8F0]();
}

uint64_t FigPlaybackItemSegmentGetInterstitialEvent()
{
  return MEMORY[0x1F40ED8F8]();
}

uint64_t FigPlaybackItemSegmentGetLoadedTimeRanges()
{
  return MEMORY[0x1F40ED900]();
}

uint64_t FigPlaybackItemSegmentGetStartDate()
{
  return MEMORY[0x1F40ED908]();
}

uint64_t FigPlaybackItemSegmentGetType()
{
  return MEMORY[0x1F40ED918]();
}

uint64_t FigPlayerAsyncDispatchToPlayerQueue()
{
  return MEMORY[0x1F40ED920]();
}

uint64_t FigPlayerGetFigBaseObject()
{
  return MEMORY[0x1F40ED928]();
}

uint64_t FigPlayerInterstitialCoordinatorCreate()
{
  return MEMORY[0x1F40ED930]();
}

uint64_t FigPlayerInterstitialCoordinatorIsRemote()
{
  return MEMORY[0x1F40ED938]();
}

uint64_t FigPlayerInterstitialEventContentMayVary()
{
  return MEMORY[0x1F40ED940]();
}

uint64_t FigPlayerInterstitialEventCopyAsDictionary()
{
  return MEMORY[0x1F40ED948]();
}

uint64_t FigPlayerInterstitialEventCopyAssetListResponse()
{
  return MEMORY[0x1F40ED950]();
}

uint64_t FigPlayerInterstitialEventCopyExtraAttributes()
{
  return MEMORY[0x1F40ED958]();
}

uint64_t FigPlayerInterstitialEventCopyIdentifier()
{
  return MEMORY[0x1F40ED960]();
}

uint64_t FigPlayerInterstitialEventCopyInterstitialAssetURLs()
{
  return MEMORY[0x1F40ED968]();
}

uint64_t FigPlayerInterstitialEventCopyPrimaryItem()
{
  return MEMORY[0x1F40ED970]();
}

uint64_t FigPlayerInterstitialEventCopyStartDate()
{
  return MEMORY[0x1F40ED978]();
}

uint64_t FigPlayerInterstitialEventCreate()
{
  return MEMORY[0x1F40ED980]();
}

uint64_t FigPlayerInterstitialEventCreateFromDictionary()
{
  return MEMORY[0x1F40ED988]();
}

uint64_t FigPlayerInterstitialEventCueOnce()
{
  return MEMORY[0x1F40ED990]();
}

uint64_t FigPlayerInterstitialEventGetRestrictions()
{
  return MEMORY[0x1F40ED9A0]();
}

uint64_t FigPlayerInterstitialEventGetSnapOptions()
{
  return MEMORY[0x1F40ED9B0]();
}

uint64_t FigPlayerInterstitialEventGetTimelineOccupancy()
{
  return MEMORY[0x1F40ED9C8]();
}

uint64_t FigPlayerInterstitialEventIsImmutable()
{
  return MEMORY[0x1F40ED9D0]();
}

uint64_t FigPlayerInterstitialEventIsPostRoll()
{
  return MEMORY[0x1F40ED9D8]();
}

uint64_t FigPlayerInterstitialEventIsPreRoll()
{
  return MEMORY[0x1F40ED9E0]();
}

uint64_t FigPlayerInterstitialEventSetFirstItemStartOffset()
{
  return MEMORY[0x1F40EDA00]();
}

uint64_t FigPlayerInterstitialEventSetInterstitialAssetURLs()
{
  return MEMORY[0x1F40EDA18]();
}

uint64_t FigPlayerInterstitialEventSetIsPreRoll()
{
  return MEMORY[0x1F40EDA28]();
}

uint64_t FigPlayerInterstitialEventSetPlannedDuration()
{
  return MEMORY[0x1F40EDA30]();
}

uint64_t FigPlayerInterstitialEventSetPlayoutLimit()
{
  return MEMORY[0x1F40EDA38]();
}

uint64_t FigPlayerInterstitialEventSetResumptionOffset()
{
  return MEMORY[0x1F40EDA50]();
}

uint64_t FigPlayerInterstitialEventSetStartTime()
{
  return MEMORY[0x1F40EDA68]();
}

uint64_t FigPlayerInterstitialEventSupplementsPrimaryContent()
{
  return MEMORY[0x1F40EDA80]();
}

uint64_t FigPlayerInterstitialEventValidate()
{
  return MEMORY[0x1F40EDA88]();
}

uint64_t FigPlayerInterstitialEventsCreateFromTaggedRangeMetadata()
{
  return MEMORY[0x1F40EDA90]();
}

uint64_t FigPlayerInterstitialRemoteCoordinatorCreate()
{
  return MEMORY[0x1F40EDA98]();
}

uint64_t FigPlayerInterstitialRemoteCoordinatorSetCurrentEvent()
{
  return MEMORY[0x1F40EDAA0]();
}

uint64_t FigPlayerInterstitialRemoteCoordinatorSetEvents()
{
  return MEMORY[0x1F40EDAA8]();
}

uint64_t FigProcessStateMonitorEnrollEligibleConnectionsInPurge()
{
  return MEMORY[0x1F40DDED0]();
}

uint64_t FigProcessStateMonitorGetServerPurgeState()
{
  return MEMORY[0x1F40DDED8]();
}

uint64_t FigProcessStateMonitorMayPurgeClientObjects()
{
  return MEMORY[0x1F40DDEE0]();
}

uint64_t FigProcessStateMonitorMustNotPurgeClientObjects()
{
  return MEMORY[0x1F40DDEE8]();
}

uint64_t FigReadOnlyTimebaseSetTargetTimebase()
{
  return MEMORY[0x1F40DDF68]();
}

uint64_t FigReadWriteLockCreate()
{
  return MEMORY[0x1F40DDF70]();
}

uint64_t FigReadWriteLockDestroy()
{
  return MEMORY[0x1F40DDF78]();
}

uint64_t FigReadWriteLockLockForRead()
{
  return MEMORY[0x1F40DDF80]();
}

uint64_t FigReadWriteLockLockForWrite()
{
  return MEMORY[0x1F40DDF88]();
}

uint64_t FigReadWriteLockUnlockForRead()
{
  return MEMORY[0x1F40DDF90]();
}

uint64_t FigReentrantMutexCreate()
{
  return MEMORY[0x1F40DDFA0]();
}

uint64_t FigReentrantMutexDestroy()
{
  return MEMORY[0x1F40DDFA8]();
}

uint64_t FigReentrantMutexLock()
{
  return MEMORY[0x1F40DDFB0]();
}

uint64_t FigReentrantMutexTryLock()
{
  return MEMORY[0x1F40DDFB8]();
}

uint64_t FigReentrantMutexUnlock()
{
  return MEMORY[0x1F40DDFC0]();
}

uint64_t FigRemakerCanFileTypeSupportFormatDescription()
{
  return MEMORY[0x1F40EDAC0]();
}

uint64_t FigRemoteRoutingContextFactoryGetCurrent()
{
  return MEMORY[0x1F412CA68]();
}

uint64_t FigRemoteStreamingAssetDownloadOrchestratorCreate()
{
  return MEMORY[0x1F40EDAC8]();
}

uint64_t FigRemote_CreateFormatDescriptionArrayFromSerializedAtomData()
{
  return MEMORY[0x1F40DE038]();
}

uint64_t FigRemote_CreateSerializedAtomDataForFormatDescriptions()
{
  return MEMORY[0x1F40DE0F0]();
}

uint64_t FigRemote_ShouldConnectToMediaparserdFile_OptIn()
{
  return MEMORY[0x1F40DE138]();
}

uint64_t FigRemote_ShouldConnectToMediaparserdForFileParsing()
{
  return MEMORY[0x1F40DE140]();
}

uint64_t FigRemote_ShouldConnectToMediaplaybackd()
{
  return MEMORY[0x1F40DE148]();
}

uint64_t FigResilientRemoteRoutingContextFactoryGetCurrent()
{
  return MEMORY[0x1F412CA70]();
}

uint64_t FigRouteDiscovererXPCRemoteCreate()
{
  return MEMORY[0x1F412CA88]();
}

uint64_t FigRoutingSessionGetCMBaseObject()
{
  return MEMORY[0x1F412CAC0]();
}

uint64_t FigRoutingSessionManagerGetConfidenceThresholds()
{
  return MEMORY[0x1F412CAD0]();
}

uint64_t FigRoutingSessionManagerResilientRemoteCopyLongFormVideoManager()
{
  return MEMORY[0x1F412CAE0]();
}

uint64_t FigSampleBufferAudioRendererCreateRemoteWithOptionsAndRetry()
{
  return MEMORY[0x1F40EDAF8]();
}

uint64_t FigSampleBufferAudioRendererGetFigBaseObject()
{
  return MEMORY[0x1F40EDB08]();
}

uint64_t FigSampleBufferCreateForCaptionGroup()
{
  return MEMORY[0x1F40DE1F8]();
}

uint64_t FigSampleBufferGetCaptionGroup()
{
  return MEMORY[0x1F40DE208]();
}

uint64_t FigSampleBufferRenderSynchronizerCreateRemoteWithOptions()
{
  return MEMORY[0x1F40EDB58]();
}

uint64_t FigSampleBufferSetDecryptor()
{
  return MEMORY[0x1F40DE230]();
}

uint64_t FigSampleCursorGetFigBaseObject()
{
  return MEMORY[0x1F40EDB68]();
}

uint64_t FigSampleGeneratorRemoteCreateForFormatReader()
{
  return MEMORY[0x1F40EDB80]();
}

uint64_t FigSecureStopManagerRemoteCopyDefaultRuntimeInstance()
{
  return MEMORY[0x1F40EDB88]();
}

uint64_t FigSharedPlayerCreate()
{
  return MEMORY[0x1F40EDB90]();
}

uint64_t FigSharedPlayerCreateWithOptions()
{
  return MEMORY[0x1F40EDB98]();
}

uint64_t FigSharedPlayerGetDefaultEngineTopology()
{
  return MEMORY[0x1F40EDBA0]();
}

uint64_t FigSharedRemote_CopyVideoCompressorSupportedPropertyDictionary()
{
  return MEMORY[0x1F40EDBA8]();
}

uint64_t FigShared_CopyCacheLastModifiedDate()
{
  return MEMORY[0x1F40EDBB0]();
}

uint64_t FigShared_CopyDiskCacheCheckedInIDs()
{
  return MEMORY[0x1F40EDBB8]();
}

uint64_t FigShared_CopyDiskCacheParams()
{
  return MEMORY[0x1F40EDBC0]();
}

uint64_t FigShared_GetCacheFileSize()
{
  return MEMORY[0x1F40EDBD0]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1F40DE340]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1F40DE348]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1F40DE350]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1F40DE360]();
}

uint64_t FigStreamAssetImageGeneratorCreateFromAssetWithOptions()
{
  return MEMORY[0x1F40EDBE0]();
}

uint64_t FigStreamingAssetDownloadConfigAddAuxConfig()
{
  return MEMORY[0x1F40EDBE8]();
}

uint64_t FigStreamingAssetDownloadConfigCreate()
{
  return MEMORY[0x1F40EDBF0]();
}

uint64_t FigStreamingAssetDownloadConfigSetAssetNameAndImage()
{
  return MEMORY[0x1F40EDBF8]();
}

uint64_t FigStreamingAssetDownloadConfigSetDownloadsInterstitialAssets()
{
  return MEMORY[0x1F40EDC00]();
}

uint64_t FigStreamingAssetDownloadConfigSetOptimizesAuxiliaryContentConfigurations()
{
  return MEMORY[0x1F40EDC08]();
}

uint64_t FigStreamingAssetDownloadConfigSetPrimaryContentConfig()
{
  return MEMORY[0x1F40EDC10]();
}

uint64_t FigStreamingAssetDownloadConfigSetTimeRange()
{
  return MEMORY[0x1F40EDC18]();
}

uint64_t FigStreamingAssetDownloadContentConfigCreate()
{
  return MEMORY[0x1F40EDC20]();
}

uint64_t FigStreamingAssetDownloadContentConfigSetAlternate()
{
  return MEMORY[0x1F40EDC28]();
}

uint64_t FigStreamingAssetDownloadContentConfigSetAlternateQualifiers()
{
  return MEMORY[0x1F40EDC30]();
}

uint64_t FigStreamingAssetDownloadContentConfigSetMediaSelections()
{
  return MEMORY[0x1F40EDC38]();
}

uint64_t FigThreadGetGlobalNetworkBufferingRunloop()
{
  return MEMORY[0x1F40DE5B8]();
}

uint64_t FigTimeOfDayTimeFromNTPTimestamp()
{
  return MEMORY[0x1F40DE610]();
}

uint64_t FigTimelineCoordinationParticipantSnapshotCopySuspensionReasons()
{
  return MEMORY[0x1F40DE618]();
}

uint64_t FigTimelineCoordinationParticipantSnapshotIsReadyToSetNonZeroRate()
{
  return MEMORY[0x1F40DE620]();
}

uint64_t FigTimelineCoordinatorBeginSuspension()
{
  return MEMORY[0x1F40DE628]();
}

uint64_t FigTimelineCoordinatorCoordinateJumpToTime()
{
  return MEMORY[0x1F40DE638]();
}

uint64_t FigTimelineCoordinatorCopyParticipantSnapshotForUUID()
{
  return MEMORY[0x1F40DE650]();
}

uint64_t FigTimelineCoordinatorCreate()
{
  return MEMORY[0x1F40DE668]();
}

uint64_t FigTimelineCoordinatorEndSuspensionProposingNewTime()
{
  return MEMORY[0x1F40DE680]();
}

uint64_t FigTimelineCoordinatorGetExpectedTimeAtHostTime()
{
  return MEMORY[0x1F40DE6B0]();
}

uint64_t FigTimelineCoordinatorHandleAssignmentOfUUIDToLocalParticipantByMedium()
{
  return MEMORY[0x1F40DE6B8]();
}

uint64_t FigTimelineCoordinatorHandleRemovalOfParticipantStateFromMedium()
{
  return MEMORY[0x1F40DE6C0]();
}

uint64_t FigTimelineCoordinatorHandleReplacementOfAllParticipantStatesFromMedium()
{
  return MEMORY[0x1F40DE6C8]();
}

uint64_t FigTimelineCoordinatorHandleUpdatedParticipantStateFromMedium()
{
  return MEMORY[0x1F40DE6E0]();
}

uint64_t FigTimelineCoordinatorHandleUpdatedTimelineStateFromMedium()
{
  return MEMORY[0x1F40DE6E8]();
}

uint64_t FigTimelineCoordinatorSetWeakMediumAndCallbacks()
{
  return MEMORY[0x1F40DE718]();
}

uint64_t FigTimelineCoordinatorSuspensionCreate()
{
  return MEMORY[0x1F40DE720]();
}

uint64_t FigTimelineStateDictionaryGetStateLoggingIdentifier()
{
  return MEMORY[0x1F40DE728]();
}

uint64_t FigTrackReaderCreateSegmentData()
{
  return MEMORY[0x1F40EDC40]();
}

uint64_t FigTrackReaderGetFigBaseObject()
{
  return MEMORY[0x1F40EDC50]();
}

uint64_t FigVCPGetTimedSampleAtTimeFromOrderedArray()
{
  return MEMORY[0x1F40EDC58]();
}

uint64_t FigVCPTimedSampleGetPTS()
{
  return MEMORY[0x1F40EDC60]();
}

uint64_t FigVCPTimedSampleGetPixelBuffer()
{
  return MEMORY[0x1F40EDC68]();
}

uint64_t FigVCPTimedSampleGetSampleBuffer()
{
  return MEMORY[0x1F40EDC70]();
}

uint64_t FigVideoCompositorCreateRemote()
{
  return MEMORY[0x1F40EDC78]();
}

uint64_t FigVideoCompositorGetFigBaseObject()
{
  return MEMORY[0x1F40EDC80]();
}

uint64_t FigVideoCompositorUtilityCopyRenderPixelBufferDimensionsAndCleanAperture()
{
  return MEMORY[0x1F40EDC88]();
}

uint64_t FigVideoFormatDescriptionContainsStereoMultiviewVideo()
{
  return MEMORY[0x1F40DE828]();
}

uint64_t FigVideoQueueCreateRemote()
{
  return MEMORY[0x1F40EDC90]();
}

uint64_t FigVideoQueueGetCMBaseObject()
{
  return MEMORY[0x1F40EDC98]();
}

uint64_t FigVideoReceiverCreate()
{
  return MEMORY[0x1F40EDCA0]();
}

uint64_t FigVideoTargetCreateSharingVideoReceiverFromVideoTarget()
{
  return MEMORY[0x1F40EDCA8]();
}

uint64_t FigVideoTargetCreateWithVideoReceiver()
{
  return MEMORY[0x1F40EDCB0]();
}

uint64_t FigVisualContextCreateRemote()
{
  return MEMORY[0x1F40EDD28]();
}

uint64_t FigVisualContextGetEarliestSequentialImageTime()
{
  return MEMORY[0x1F40EDD30]();
}

uint64_t FigVolumeControllerCopySharedControllerRemote()
{
  return MEMORY[0x1F412CB28]();
}

uint64_t FigXPCRelease()
{
  return MEMORY[0x1F40DEB78]();
}

uint64_t FigXPCRemoteClientDispose()
{
  return MEMORY[0x1F40DEBC0]();
}

uint64_t FigXPCRetain()
{
  return MEMORY[0x1F40DEC08]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MTCopyStringsForMediaTypeAndSubType()
{
  return MEMORY[0x1F40EDD40]();
}

uint64_t MTGetVideoDynamicRangeQualityGrade()
{
  return MEMORY[0x1F40EDD48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

BOOL NSShouldRetainWithZone(id anObject, NSZone *requestedZone)
{
  return MEMORY[0x1F40E7268](anObject, requestedZone);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PKDCopyDecryptFormatTypeFromCodecType()
{
  return MEMORY[0x1F40EDD68]();
}

uint64_t PKDCopyDecryptFormatTypeFromSinfArray()
{
  return MEMORY[0x1F40EDD70]();
}

uint64_t PKDCopyDefaultKeyIDFromSinfArray()
{
  return MEMORY[0x1F40EDD78]();
}

uint64_t PKDCopyIdentifierForFormatDescription()
{
  return MEMORY[0x1F40EDD80]();
}

uint64_t PKDGetIdentifierForTransportStream()
{
  return MEMORY[0x1F40EDD88]();
}

uint64_t PKDIsContentKeyBossEnabled()
{
  return MEMORY[0x1F40EDD90]();
}

uint64_t PKDLogPrivateData()
{
  return MEMORY[0x1F40EDD98]();
}

uint64_t PKDPersistentKeyIsForCTRModeDecryption()
{
  return MEMORY[0x1F40EDDA0]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C380]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t VTBuildPixelBufferPools()
{
  return MEMORY[0x1F41030D8]();
}

OSStatus VTCopyVideoEncoderList(CFDictionaryRef options, CFArrayRef *listOfVideoEncodersOut)
{
  return MEMORY[0x1F4103188](options, listOfVideoEncodersOut);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

Boolean VTIsStereoMVHEVCDecodeSupported(void)
{
  return MEMORY[0x1F4103380]();
}

uint64_t VTPixelBufferAttributesMediatorAddLayer()
{
  return MEMORY[0x1F4103420]();
}

uint64_t VTPixelBufferAttributesMediatorCopyProperty()
{
  return MEMORY[0x1F4103428]();
}

uint64_t VTPixelBufferAttributesMediatorCreate()
{
  return MEMORY[0x1F4103430]();
}

uint64_t VTPixelBufferAttributesMediatorNotificationBarrier()
{
  return MEMORY[0x1F4103438]();
}

uint64_t VTPixelBufferAttributesMediatorRemoveLayer()
{
  return MEMORY[0x1F4103440]();
}

uint64_t VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey()
{
  return MEMORY[0x1F4103448]();
}

uint64_t VTPixelBufferAttributesMediatorSetProperty()
{
  return MEMORY[0x1F4103450]();
}

uint64_t VTPixelBufferAttributesMediatorSetRequestedPixelBufferAttributesForKey()
{
  return MEMORY[0x1F4103458]();
}

uint64_t VTPixelBufferConformerCopyConformedPixelBuffer()
{
  return MEMORY[0x1F4103468]();
}

uint64_t VTPixelBufferConformerCreateWithAttributes()
{
  return MEMORY[0x1F4103478]();
}

uint64_t VTPixelBufferConformerSetColorProperties()
{
  return MEMORY[0x1F4103488]();
}

uint64_t VTVideoCodecService_ShouldUseSeparateCodecProcessForDecode()
{
  return MEMORY[0x1F41035F0]();
}

uint64_t VTVideoCodecService_ShouldUseSeparateCodecProcessForEncode()
{
  return MEMORY[0x1F41035F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFLocaleCopyNumberingSystemForLocaleIdentifier()
{
  return MEMORY[0x1F40D8E48]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

uint64_t _FigIsNotCurrentDispatchQueue()
{
  return MEMORY[0x1F40DED40]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1F40C9CE8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

uint64_t audiomxd_enabled()
{
  return MEMORY[0x1F40D51C0]();
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1F40CBBB0]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1F40DED58]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1F40DED60]();
}

uint64_t fig_note_initialize_category_with_default_work()
{
  return MEMORY[0x1F40DED78]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40CD038](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1F40CE3E8](*(void *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1F40CE3F8]();
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

void xpc_release(xpc_object_t object)
{
}