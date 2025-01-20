@interface FigCapturePowerLogMissingCameraStopEventObserver
- (uint64_t)_cameraAppIsForegroundInLayout:(uint64_t)result;
- (void)_cancelCameraAppStreamingTimer;
- (void)_checkCameraAppPowerEventsForAnyStreamingCameras;
- (void)_handleLayoutUpdate:(uint64_t)a1;
- (void)_showTTRPromptIfNecessary;
- (void)_startCameraAppStreamingTimer;
- (void)dealloc;
- (void)initWithQueue:(void *)a1;
- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation FigCapturePowerLogMissingCameraStopEventObserver

- (void)startObserving
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    *(unsigned char *)(a1 + 16) = 1;
    [*(id *)(a1 + 24) addLayoutObserverWithoutImmediateCallback:a1];
    v2 = (void *)[*(id *)(a1 + 24) currentLayout];
    -[FigCapturePowerLogMissingCameraStopEventObserver _handleLayoutUpdate:](a1, v2);
  }
}

- (void)initWithQueue:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)FigCapturePowerLogMissingCameraStopEventObserver;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    v3[1] = a2;
    v3[3] = +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v3[6] = v4;
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
  }
  return v3;
}

- (void)stopObserving
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    *(unsigned char *)(a1 + 16) = 0;
    [*(id *)(a1 + 24) removeLayoutObserver:a1];
    *(unsigned char *)(a1 + 40) = 0;
    -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](a1);
  }
}

- (void)dealloc
{
  cameraAppStreamingTimer = self->_cameraAppStreamingTimer;
  if (cameraAppStreamingTimer) {
    dispatch_release(cameraAppStreamingTimer);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCapturePowerLogMissingCameraStopEventObserver;
  [(FigCapturePowerLogMissingCameraStopEventObserver *)&v4 dealloc];
}

- (void)_handleLayoutUpdate:(uint64_t)a1
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    int v4 = -[FigCapturePowerLogMissingCameraStopEventObserver _cameraAppIsForegroundInLayout:](a1, a2);
    char v5 = v4;
    if (!*(unsigned char *)(a1 + 40) || (v4 & 1) != 0)
    {
      if (v4) {
        -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](a1);
      }
    }
    else
    {
      -[FigCapturePowerLogMissingCameraStopEventObserver _startCameraAppStreamingTimer](a1);
    }
    *(unsigned char *)(a1 + 40) = v5;
  }
}

- (void)_cancelCameraAppStreamingTimer
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(NSObject **)(a1 + 32);
    if (v2)
    {
      if (dword_1EB4C55B0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = *(NSObject **)(a1 + 32);
      }
      dispatch_source_cancel(v2);
      dispatch_release(*(dispatch_object_t *)(a1 + 32));
      *(void *)(a1 + 32) = 0;
    }
  }
}

- (void)_startCameraAppStreamingTimer
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 32)) {
      -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](a1);
    }
    if (dword_1EB4C55B0)
    {
      int v8 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 8));
    *(void *)(a1 + 32) = v3;
    dispatch_time_t v4 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x29A2241AF62C0000uLL);
    char v5 = *(NSObject **)(a1 + 32);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __81__FigCapturePowerLogMissingCameraStopEventObserver__startCameraAppStreamingTimer__block_invoke;
    handler[3] = &unk_1E5C24430;
    handler[4] = a1;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 32));
  }
}

void __81__FigCapturePowerLogMissingCameraStopEventObserver__startCameraAppStreamingTimer__block_invoke(uint64_t a1)
{
  if (dword_1EB4C55B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[FigCapturePowerLogMissingCameraStopEventObserver _cancelCameraAppStreamingTimer](*(void *)(a1 + 32));
  -[FigCapturePowerLogMissingCameraStopEventObserver _checkCameraAppPowerEventsForAnyStreamingCameras](*(void *)(a1 + 32));
}

- (void)_checkCameraAppPowerEventsForAnyStreamingCameras
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    char v2 = -[FigCapturePowerLogMissingCameraStopEventObserver _cameraAppIsForegroundInLayout:](a1, (void *)[*(id *)(a1 + 24) currentLayout]);
    if (dword_1EB4C55B0)
    {
      unsigned int v25 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((v2 & 1) == 0)
    {
      if (sPendingPowerEventsCount)
      {
        if (dword_1EB4C55B0)
        {
          v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      else
      {
        dispatch_time_t v4 = cpls_portTypesReportedStreamingForCameraApp();
        if ([v4 count])
        {
          uint64_t v19 = a1;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
          if (v5)
          {
            uint64_t v6 = v5;
            uint64_t v7 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v6; ++i)
              {
                if (*(void *)v21 != v7) {
                  objc_enumerationMutation(v4);
                }
                uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                unsigned int v25 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v11 = v25;
                if (os_log_type_enabled(v10, type)) {
                  unsigned int v13 = v11;
                }
                else {
                  unsigned int v13 = v11 & 0xFFFFFFFE;
                }
                if (v13)
                {
                  uint64_t v14 = BWPortTypeToDisplayString(v9, v12);
                  int v27 = 136315394;
                  v28 = "-[FigCapturePowerLogMissingCameraStopEventObserver _checkCameraAppPowerEventsForAnyStreamingCameras]";
                  __int16 v29 = 2112;
                  uint64_t v30 = v14;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
            }
            while (v6);
          }
          unsigned int v25 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v16 = v25;
          if (os_log_type_enabled(v15, type)) {
            unsigned int v17 = v16;
          }
          else {
            unsigned int v17 = v16 & 0xFFFFFFFE;
          }
          if (v17)
          {
            int v27 = 136315138;
            v28 = "-[FigCapturePowerLogMissingCameraStopEventObserver _checkCameraAppPowerEventsForAnyStreamingCameras]";
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          -[FigCapturePowerLogMissingCameraStopEventObserver _showTTRPromptIfNecessary](v19);
        }
      }
    }
  }
}

- (uint64_t)_cameraAppIsForegroundInLayout:(uint64_t)result
{
  if (result)
  {
    if ((objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "containsObject:", 0x1EFA44100) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a2, "transitioningApps"), "containsObject:", 0x1EFA44100) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "containsObject:", 0x1EFA55980) & 1) != 0)
    {
      return 1;
    }
    else
    {
      v3 = (void *)[a2 transitioningApps];
      return [v3 containsObject:0x1EFA55980];
    }
  }
  return result;
}

- (void)_showTTRPromptIfNecessary
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (FigDebugIsInternalBuild())
    {
      CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFPropertyListRef v4 = (id)CFPreferencesCopyValue(@"LastShownMissingCameraStopPowerEventTTRPromptDate", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      uint64_t v5 = (const void *)[MEMORY[0x1E4F1C9C8] date];
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar"), "isDate:inSameDayAsDate:", v4, v5)|| (uint64_t v6 = (id)CFPreferencesCopyValue(@"LastShownMissingCameraStopPowerEventTTRPromptBuildVersion", @"com.apple.cameracapture.volatile", v2, v3), v7 = (id)MGCopyAnswer(), objc_msgSend(v6, "isEqualToString:", v7)))
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        int v8 = NSString;
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
        FigCapturePromptOpenTapToRadar(@"Missing camera stop power event. Please file a radar.", @"Missing camera stop power event!", [v8 stringWithFormat:@"%@: Camera Streaming Power Events: %@", v9, sCameraStreamingPowerEventsByPortType], 1, 3, 6, 0.0);
        CFPreferencesSetValue(@"LastShownMissingCameraStopPowerEventTTRPromptDate", v5, @"com.apple.cameracapture.volatile", v2, v3);
        CFPreferencesSetValue(@"LastShownMissingCameraStopPowerEventTTRPromptBuildVersion", v7, @"com.apple.cameracapture.volatile", v2, v3);
      }
    }
  }
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_observerQueue);
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__FigCapturePowerLogMissingCameraStopEventObserver_layoutMonitor_didUpdateLayout___block_invoke;
  v7[3] = &unk_1E5C24458;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(observerQueue, v7);
}

void __82__FigCapturePowerLogMissingCameraStopEventObserver_layoutMonitor_didUpdateLayout___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 16))
  {
    CFStringRef v3 = *(void **)(a1 + 40);
    -[FigCapturePowerLogMissingCameraStopEventObserver _handleLayoutUpdate:](v2, v3);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end