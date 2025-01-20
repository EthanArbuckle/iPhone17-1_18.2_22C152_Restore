@interface FigCaptureSourceVibeMitigation
+ (void)initialize;
- (FigCaptureSourceVibeMitigation)initWithFigCaptureSourceBackings:(id)a3;
- (uint64_t)_setupStateMachine;
- (uint64_t)_startMitigation;
- (void)_cancelCurrentTimer;
- (void)_handleVibeNotification:(uint64_t)a3 userInfo:;
- (void)_registerNotifications;
- (void)_setupTimerWithDuration:(uint64_t)a1;
- (void)_stopMitigation;
- (void)dealloc;
@end

@implementation FigCaptureSourceVibeMitigation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigCaptureSourceVibeMitigation)initWithFigCaptureSourceBackings:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)FigCaptureSourceVibeMitigation;
  v4 = [(FigCaptureSourceVibeMitigation *)&v25 init];
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)[a3 sourceInfoDictionaries];
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v20 = *(void *)v22;
      uint64_t v7 = *MEMORY[0x1E4F55298];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v20) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v10 = (void *)[v9 objectForKeyedSubscript:0x1EFA53D60];
          v11 = (void *)[v9 objectForKeyedSubscript:0x1EFA53CC0];
          uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"DeviceType"), "intValue");
          uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"Position"), "intValue");
          if (objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v7), "BOOLValue"))
          {
            positions = v4->_positions;
            if (!positions)
            {
              positions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v4->_positions = positions;
            }
            if (!v4->_deviceTypes)
            {
              v4->_deviceTypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              positions = v4->_positions;
            }
            -[NSMutableArray addObject:](positions, "addObject:", [NSNumber numberWithInt:v13]);
            -[NSMutableArray addObject:](v4->_deviceTypes, "addObject:", [NSNumber numberWithInt:v12]);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
    if (dword_1EB4C5190)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ([(NSMutableArray *)v4->_positions count])
    {
      v4->_vibeMitigationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      v4->_hapticDuration = 30;
      -[FigCaptureSourceVibeMitigation _setupStateMachine]((uint64_t)v4);
      -[FigCaptureSourceVibeMitigation _registerNotifications](v4);
      v4->_mitigationWhileCameraStreamingSupported = 0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"FigCaptureSourceVibeMitigationStateMachine" stateCount:4 initialState:1 owner:result];
    *(void *)(v1 + 64) = v2;
    [(FigStateMachine *)v2 setPerformsAtomicStateTransitions:0];
    [*(id *)(v1 + 64) setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 64) setLabel:@"Activating" forState:2];
    [*(id *)(v1 + 64) setLabel:@"Active" forState:4];
    [*(id *)(v1 + 64) setLabel:@"Deactivating" forState:8];
    v3 = *(void **)(v1 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke;
    v6[3] = &unk_1E5C24858;
    v6[4] = v1;
    [v3 whenTransitioningFromState:1 toState:2 callHandler:v6];
    [*(id *)(v1 + 64) whenTransitioningFromState:4 toState:8 callHandler:&__block_literal_global_6];
    [*(id *)(v1 + 64) whenTransitioningFromState:8 toState:1 callHandler:&__block_literal_global_29];
    [*(id *)(v1 + 64) whenTransitioningFromState:4 toState:1 callHandler:&__block_literal_global_31];
    v4 = *(void **)(v1 + 64);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_5;
    v5[3] = &unk_1E5C24858;
    v5[4] = v1;
    return [v4 whenTransitioningFromState:8 toState:4 callHandler:v5];
  }
  return result;
}

- (void)_registerNotifications
{
  if (a1)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)fcsvm_vibeNotificationCallback, @"HapticActuatorProtectionModeNotification_MinimalProtection", @"HapticEngineNotificationObject", CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)fcsvm_vibeNotificationCallback, @"HapticActuatorProtectionModeNotification_DefaultProtection", @"HapticEngineNotificationObject", CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DistributedCenter, a1, (CFNotificationCallback)fcsvm_vibeNotificationCallback, @"HapticSequenceNotification_SequenceWillStart", @"HapticEngineNotificationObject", CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer) {
    dispatch_release(timer);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSourceVibeMitigation;
  [(FigCaptureSourceVibeMitigation *)&v4 dealloc];
}

uint64_t __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  int started = -[FigCaptureSourceVibeMitigation _startMitigation](a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (started)
  {
    uint64_t v6 = 1;
  }
  else
  {
    -[FigCaptureSourceVibeMitigation _setupTimerWithDuration:](a2, *(_DWORD *)(v5 + 72));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 4;
  }
  uint64_t v7 = *(void **)(v5 + 64);
  return [v7 transitionToState:v6];
}

- (uint64_t)_startMitigation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v23 = 0;
    if (*(unsigned char *)(result + 77))
    {
      *(_DWORD *)(result + 32) = 0;
      uint64_t v2 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDefaultDeviceForVibeMitigation:", &v23);
    }
    else
    {
      id v3 = +[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor];
      uint64_t v4 = getpid();
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__FigCaptureSourceVibeMitigation__startMitigation__block_invoke;
      v22[3] = &unk_1E5C248C8;
      v22[4] = v1;
      LOBYTE(v15) = 0;
      *(_DWORD *)(v1 + 32) = [v3 registerClientWithPID:v4 clientDescription:@"FigCaptureSourceVibeMitigation" clientPriority:2 canStealFromClientsWithSamePriority:0 deviceSharingWithOtherClientsAllowed:0 deviceSharingWithAVFlashlightAllowed:0 clientIsAVFlashlight:v15 deviceAvailabilityChangedHandler:v22];
      uint64_t v2 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyDeviceForClient:informClientWhenDeviceAvailableAgain:error:", *(unsigned int *)(v1 + 32), 0, &v23);
    }
    *(void *)(v1 + 40) = v2;
    if (v2)
    {
      uint64_t v5 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "copyStreamsWithoutControlFromDevice:positions:deviceTypes:error:", *(void *)(v1 + 40), *(void *)(v1 + 8), *(void *)(v1 + 16), &v23);
      *(void *)(v1 + 48) = v5;
      if (v23)
      {
        objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", *(void *)(v1 + 40), *(unsigned int *)(v1 + 32), 0, 0);
        uint64_t v6 = *(const void **)(v1 + 40);
        if (v6)
        {
          CFRelease(v6);
          *(void *)(v1 + 40) = 0;
        }
      }
      else if (*(void *)(v1 + 40))
      {
        uint64_t v7 = v5;
        if (v5)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v19;
            uint64_t v17 = *MEMORY[0x1E4F54CA8];
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v19 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
                if (*(unsigned char *)(v1 + 77))
                {
                  if (dword_1EB4C5190)
                  {
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  objc_msgSend(v12, "setVibeMitigationEnabled:", 1, v15, v16);
                }
                else
                {
                  unsigned int v23 = [*(id *)(*((void *)&v18 + 1) + 8 * i) setPropertyIfSupported:v17 value:MEMORY[0x1E4F1CC38]];
                  if (v23 || dword_1EB4C5190)
                  {
                    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
            }
            while (v9);
          }
          return v23;
        }
      }
      FigDebugAssert3();
    }
    return v23;
  }
  return result;
}

- (void)_setupTimerWithDuration:(uint64_t)a1
{
  if (a1)
  {
    -[FigCaptureSourceVibeMitigation _cancelCurrentTimer](a1);
    uint64_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 24));
    *(void *)(a1 + 56) = v4;
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * a2);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v6 = *(NSObject **)(a1 + 56);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__FigCaptureSourceVibeMitigation__setupTimerWithDuration___block_invoke;
    handler[3] = &unk_1E5C24430;
    handler[4] = a1;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 56));
  }
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (void)_stopMitigation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[FigCaptureSourceVibeMitigation _cancelCurrentTimer](a1);
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2 && *(void *)(a1 + 40))
    {
      if (!*(unsigned char *)(a1 + 76))
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v3)
        {
          uint64_t v4 = v3;
          uint64_t v5 = *(void *)v18;
          uint64_t v16 = *MEMORY[0x1E4F54CA8];
          do
          {
            uint64_t v6 = 0;
            uint64_t v15 = v4;
            do
            {
              if (*(void *)v18 != v5) {
                objc_enumerationMutation(v2);
              }
              uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
              if (*(unsigned char *)(a1 + 77))
              {
                if (dword_1EB4C5190)
                {
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                objc_msgSend(v7, "setVibeMitigationEnabled:", 0, v13, v14);
              }
              else if ([*(id *)(*((void *)&v17 + 1) + 8 * v6) setPropertyIfSupported:v16 value:MEMORY[0x1E4F1CC28]])
              {
                uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                uint64_t v4 = v15;
              }
              else if (dword_1EB4C5190)
              {
                uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              ++v6;
            }
            while (v4 != v6);
            uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v4);
        }
      }
      objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor", v13), "takeBackDevice:forClient:informClientWhenDeviceAvailableAgain:prefersDeviceInvalidatedImmediately:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 32), 0, 0);
      v11 = *(const void **)(a1 + 40);
      if (v11)
      {
        CFRelease(v11);
        *(void *)(a1 + 40) = 0;
      }
      uint64_t v12 = *(const void **)(a1 + 48);
      if (v12)
      {
        CFRelease(v12);
        *(void *)(a1 + 48) = 0;
      }
      *(_DWORD *)(a1 + 32) = 0;
      *(unsigned char *)(a1 + 76) = 0;
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_4(uint64_t a1, uint64_t a2)
{
}

void __52__FigCaptureSourceVibeMitigation__setupStateMachine__block_invoke_5(uint64_t a1, uint64_t a2)
{
}

- (void)_handleVibeNotification:(uint64_t)a3 userInfo:
{
  if (a1)
  {
    uint64_t v3 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__FigCaptureSourceVibeMitigation__handleVibeNotification_userInfo___block_invoke;
    block[3] = &unk_1E5C248A0;
    block[4] = a2;
    block[5] = a1;
    block[6] = a3;
    dispatch_async(v3, block);
  }
}

void __67__FigCaptureSourceVibeMitigation__handleVibeNotification_userInfo___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"HapticActuatorProtectionModeNotification_MinimalProtection"])
  {
    int v2 = [*(id *)(*(void *)(a1 + 40) + 64) currentState];
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 64);
    if (v2 == 1)
    {
      uint64_t v4 = 2;
    }
    else
    {
      if ([v3 currentState] != 8) {
        return;
      }
      uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 64);
      uint64_t v4 = 4;
    }
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"HapticActuatorProtectionModeNotification_DefaultProtection"])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 64) currentState] != 4) {
      return;
    }
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 64);
    uint64_t v4 = 8;
LABEL_9:
    [v3 transitionToState:v4];
    return;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"HapticSequenceNotification_SequenceWillStart"])
  {
    if ([*(id *)(a1 + 48) objectForKeyedSubscript:@"SequenceDuration"])
    {
      if ([*(id *)(*(void *)(a1 + 40) + 64) currentState] == 4)
      {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"SequenceDuration"), "floatValue");
        if (v5 <= 0x257)
        {
          *(_DWORD *)(*(void *)(a1 + 40) + 72) = v5 + 5;
          uint64_t v6 = *(void *)(a1 + 40);
          unsigned int v7 = *(_DWORD *)(v6 + 72);
          -[FigCaptureSourceVibeMitigation _setupTimerWithDuration:](v6, v7);
        }
      }
    }
  }
}

uint64_t __50__FigCaptureSourceVibeMitigation__startMitigation__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) currentState];
  if (result == 4 && (a3 & 1) == 0)
  {
    if (dword_1EB4C5190)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 76) = 1;
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "transitionToState:", 1, v7, v8);
  }
  return result;
}

- (void)_cancelCurrentTimer
{
  if (a1)
  {
    int v2 = *(NSObject **)(a1 + 56);
    if (v2)
    {
      dispatch_source_cancel(v2);

      *(void *)(a1 + 56) = 0;
    }
  }
}

uint64_t __58__FigCaptureSourceVibeMitigation__setupTimerWithDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) transitionToState:1];
}

@end