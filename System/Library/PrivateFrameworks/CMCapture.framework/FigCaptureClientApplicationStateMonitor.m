@interface FigCaptureClientApplicationStateMonitor
+ (uint64_t)_applicationStateForBKSApplicationState:(int)a3 clientType:(int)a4 backgroundCameraAccess:;
+ (uint64_t)_applicationStateForClientLayoutState:(unsigned int)a3 clientType:(int)a4 backgroundCameraAccess:;
+ (uint64_t)_mapRBSProcessStateToFigCaptureBKSApplicationState:(uint64_t)a1;
+ (void)initialize;
+ (void)startContinuityCaptureTerminationMonitorWithHandler:(id)a3;
+ (void)startPrewarmingMonitorWithHandler:(id)a3;
+ (void)stopPrewarmingMonitor;
- (FigCaptureClientApplicationStateMonitor)initWithClientAuditToken:(id *)a3 mediaEnvironment:(id)a4 forThirdPartyTorch:(BOOL)a5 applicationAndLayoutStateHandler:(id)a6;
- (NSString)applicationID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)mediaEnvironment;
- (OS_tcc_identity)mediaEnvironmentTCCIdentity;
- (char)_initWithClient:(void *)a1;
- (id)_updateBKSApplicationStateFromRBSState;
- (int)applicationState;
- (int)clientType;
- (uint64_t)_createAndObserveAVAudioSessionForBKSApplicationStateMonitoring;
- (uint64_t)_createAndObserveCMSessionForBKSApplicationStateMonitoring;
- (uint64_t)_handleAVAudioSessionApplicationStateDidChangeNotification:(uint64_t)result;
- (uint64_t)_handleAVAudioSessionMediaServicesWereResetNotification:(uint64_t)result;
- (uint64_t)_handleBKSApplicationStateChange:(uint64_t)result;
- (uint64_t)_handleCMSessionApplicationStateDidChangeNotification:(uint64_t)result;
- (uint64_t)_handleLayout:(uint64_t)result;
- (uint64_t)_handleMediaEndowmentUpdate:(uint64_t)result;
- (uint64_t)_handleVisibilityEndowmentUpdate:(uint64_t)result;
- (uint64_t)_resolveAggregateLayoutState;
- (uint64_t)_resolveApplicationIDForLayoutMonitoring;
- (uint64_t)_resolveApplicationState;
- (uint64_t)_updateBKSApplicationStateFromAVAudioSession;
- (uint64_t)_updateBKSApplicationStateFromCMSession;
- (uint64_t)_updateClientStateCondition:(void *)a3 newValue:;
- (uint64_t)_updateMediaEnvironmentWithEndowmentInfos:(int)a3 evaluateLayout:;
- (uint64_t)loggingPrefix;
- (void)_deregisterAndReleaseAVAudioSession;
- (void)_deregisterAndReleaseCMSession;
- (void)dealloc;
- (void)deviceLockStateMonitor:(id)a3 didUpdateDeviceLockState:(BOOL)a4;
- (void)invalidate;
- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4;
- (void)updateApplicationState;
@end

@implementation FigCaptureClientApplicationStateMonitor

- (uint64_t)_handleLayout:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  if (*(unsigned char *)(result + 168)) {
    return result;
  }
  pthread_mutex_lock(*(pthread_mutex_t **)(result + 16));
  uint64_t v4 = -[FigCaptureClientApplicationStateMonitor _resolveApplicationIDForLayoutMonitoring](v2);
  if (dword_1EB4C5370)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend(a2, "isPaymentServiceVisible", v13, v14) & 1) == 0)
  {
    if ([*(id *)(v2 + 8) clientType] == 5)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(*(id *)(v2 + 8), "avconferenceClientApplicationIDs"));
      v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a2, "foregroundApps"));
      [v8 intersectSet:v7];
      if ([v8 count])
      {
        if ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") <= 1) {
          unsigned int v6 = 2;
        }
        else {
          unsigned int v6 = 3;
        }
      }
      else
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a2, "pipApps"));
        [v9 intersectSet:v7];
        unsigned int v6 = 4 * ([v9 count] != 0);
      }
      goto LABEL_24;
    }
    if (objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "applicationID"), "isEqualToString:", 0x1EFA55960))
    {
      if ([*(id *)(v2 + 128) isOnLockScreen]
        && !objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "xpcServiceRootHostApplicationID"), "isEqualToString:", 0x1EFA55C40))
      {
        unsigned int v6 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "applicationID"), "isEqualToString:", 0x1EFA55C20))
      {
        if ([a2 isSiriVisible]) {
          unsigned int v6 = 2;
        }
        else {
          unsigned int v6 = 0;
        }
        goto LABEL_24;
      }
      if (!objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "containsObject:", v4))
      {
        if (objc_msgSend((id)objc_msgSend(a2, "obscuredApps"), "containsObject:", v4))
        {
          unsigned int v6 = 5;
        }
        else if (objc_msgSend((id)objc_msgSend(a2, "pipApps"), "containsObject:", v4))
        {
          unsigned int v6 = 4;
        }
        else
        {
          unsigned int v6 = objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") != 0;
        }
        goto LABEL_24;
      }
      if (objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") != 1)
      {
        if ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "foregroundApps"), "count") <= 1) {
          unsigned int v6 = 0;
        }
        else {
          unsigned int v6 = 3;
        }
        goto LABEL_24;
      }
    }
    unsigned int v6 = 2;
    goto LABEL_24;
  }
  unsigned int v6 = 6;
LABEL_24:
  unsigned __int8 v10 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "applicationID"), "isEqualToString:", 0x1EFA55D40);
  unint64_t v11 = [a2 displayType];
  if (v11 <= 2)
  {
    if (((v6 == 3) & v10) != 0) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v6;
    }
    -[FigCaptureClientApplicationStateMonitor _updateClientStateCondition:newValue:](v2, (_DWORD *)(v2 + 8 * v11 + 100), (void *)[NSNumber numberWithInt:v12]);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 16));
}

- (uint64_t)loggingPrefix
{
  if (result) {
    return [NSString stringWithFormat:@"<%p[%d][%@]>", result, objc_msgSend(*(id *)(result + 8), "pid"), objc_msgSend(*(id *)(result + 8), "applicationID")];
  }
  return result;
}

- (uint64_t)_updateClientStateCondition:(void *)a3 newValue:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (!*(unsigned char *)(result + 168))
    {
      FigSimpleMutexCheckIsLockedOnThisThread();
      if ((_DWORD *)(v3 + 84) == a2)
      {
        result = [a3 unsignedIntValue];
        int v7 = result;
        if ((*a2 != result || !*(unsigned char *)(v3 + 88)) && dword_1EB4C5370)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v7;
        uint64_t v15 = 88;
      }
      else if ((_DWORD *)(v3 + 100) == a2)
      {
        result = [a3 intValue];
        int v9 = result;
        if ((*a2 != result || !*(unsigned char *)(v3 + 104)) && dword_1EB4C5370)
        {
          unsigned __int8 v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v9;
        uint64_t v15 = 104;
      }
      else if ((_DWORD *)(v3 + 108) == a2)
      {
        result = [a3 intValue];
        int v11 = result;
        if ((*a2 != result || !*(unsigned char *)(v3 + 112)) && dword_1EB4C5370)
        {
          uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v11;
        uint64_t v15 = 112;
      }
      else if ((_DWORD *)(v3 + 116) == a2)
      {
        result = [a3 intValue];
        int v13 = result;
        if ((*a2 != result || !*(unsigned char *)(v3 + 120)) && dword_1EB4C5370)
        {
          uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *a2 = v13;
        uint64_t v15 = 120;
      }
      else
      {
        if ((_DWORD *)(v3 + 153) != a2)
        {
          unsigned int v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
          return fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        result = [a3 BOOLValue];
        char v16 = result;
        if ((*(unsigned __int8 *)a2 != result || !*(unsigned char *)(v3 + 154)) && dword_1EB4C5370)
        {
          v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          result = fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *(unsigned char *)a2 = v16;
        uint64_t v15 = 154;
      }
      *(unsigned char *)(v3 + v15) = 1;
      if ((!*(unsigned char *)(v3 + 80) || *(unsigned char *)(v3 + 88))
        && (!*(unsigned char *)(v3 + 96) || *(unsigned char *)(v3 + 104))
        && (!*(unsigned char *)(v3 + 105) || *(unsigned char *)(v3 + 112))
        && (!*(unsigned char *)(v3 + 113) || *(unsigned char *)(v3 + 120))
        && (!*(unsigned char *)(v3 + 152) || *(unsigned char *)(v3 + 154)))
      {
        int v18 = -[FigCaptureClientApplicationStateMonitor _resolveApplicationState](v3);
        result = -[FigCaptureClientApplicationStateMonitor _resolveAggregateLayoutState](v3);
        int v19 = *(_DWORD *)(v3 + 92);
        BOOL v20 = v19 == 2 && *(_DWORD *)(v3 + 124) != result;
        if (v19 != v18 || v20)
        {
          *(_DWORD *)(v3 + 92) = v18;
          *(_DWORD *)(v3 + 124) = result;
          if (dword_1EB4C5370)
          {
            v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          uint64_t v22 = objc_msgSend(*(id *)(v3 + 8), "applicationAndLayoutStateHandler", v23, v24);
          return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v22 + 16))(v22, [*(id *)(v3 + 8) pid], *(unsigned int *)(v3 + 92), *(unsigned int *)(v3 + 124));
        }
      }
    }
  }
  return result;
}

- (uint64_t)_resolveAggregateLayoutState
{
  if (result)
  {
    v1 = (_DWORD *)result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    int v2 = v1[25];
    if (v2 == 6) {
      return 6;
    }
    int v3 = v1[27];
    if (v3 == 6) {
      return 6;
    }
    int v4 = v1[29];
    if (v4 == 6)
    {
      return 6;
    }
    else
    {
      result = 5;
      if (v2 != 5 && v3 != 5 && v4 != 5)
      {
        result = 4;
        if (v2 != 4 && v3 != 4 && v4 != 4)
        {
          result = 3;
          if (v2 != 3 && v3 != 3 && v4 != 3)
          {
            if (v2 == 2 || v3 == 2 || v4 == 2)
            {
              if (v2 != 1 && v3 != 1)
              {
                if (v4 == 1) {
                  return 3;
                }
                else {
                  return 2;
                }
              }
            }
            else
            {
              return v3 == 1 && v4 == 1 && v2 == 1;
            }
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_resolveApplicationIDForLayoutMonitoring
{
  v22[24] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  FigSimpleMutexCheckIsLockedOnThisThread();
  if ([*(id *)(a1 + 8) isSwiftPlaygroundsDevelopmentApp]) {
    return 0x1EFA55B20;
  }
  uint64_t v4 = [*(id *)(a1 + 8) mediaEnvironment];
  v5 = *(void **)(a1 + 8);
  if (!v4)
  {
    if ([v5 clientType] == 3)
    {
      char v6 = [*(id *)(a1 + 8) isSecureCaptureExtension];
      int v7 = *(void **)(a1 + 8);
      if ((v6 & 1) == 0)
      {
        uint64_t v8 = [v7 xpcServiceRootHostApplicationID];
        goto LABEL_15;
      }
    }
    else
    {
      int v7 = *(void **)(a1 + 8);
      if (*(unsigned char *)(a1 + 64))
      {
        uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "processHandle"), "nonRootSourceProcessHandleForVisibilityEndowment"), "bundleIdentifier");
        goto LABEL_15;
      }
    }
    uint64_t v8 = [v7 applicationID];
LABEL_15:
    uint64_t v2 = v8;
    v22[0] = 0;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      if (!*(unsigned char *)(a1 + 80)) {
        goto LABEL_29;
      }
      int v9 = (void *)[*(id *)(a1 + 24) getMXSessionProperty:*MEMORY[0x1E4F763C0] error:v22];
      if (v22[0])
      {
LABEL_41:
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        goto LABEL_36;
      }
      uint64_t v10 = [v9 intValue];
      if (!v10)
      {
LABEL_29:
        if ([*(id *)(a1 + 8) applicationIDToInheritAppStateFrom])
        {
          if (dword_1EB4C5370)
          {
            uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(*(id *)(a1 + 8), "setApplicationIDToInheritAppStateFrom:", 0, v20, v21);
          [*(id *)(a1 + 8) setPidToInheritAppStateFrom:0];
        }
        return v2;
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 80)) {
        goto LABEL_29;
      }
      if (CMSessionCopyProperty())
      {
        int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
LABEL_36:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return v2;
      }
      uint64_t v10 = [0 intValue];

      if (!v10) {
        goto LABEL_29;
      }
    }
    if (v10 == [*(id *)(a1 + 8) pidToInheritAppStateFrom])
    {
LABEL_33:
      if (dword_1EB4C5370)
      {
        uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      int v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "applicationIDToInheritAppStateFrom", v20, v21), "isEqualToString:", 0x1EFA55C40);
      v17 = *(void **)(a1 + 8);
      if (v16) {
        return [v17 applicationID];
      }
      else {
        return [v17 applicationIDToInheritAppStateFrom];
      }
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(NSNumber, "numberWithInt:", v10), v22);
    if (!v22[0])
    {
      int v13 = v12;
      while ([v12 hostProcess])
      {
        uint64_t v12 = (void *)[v13 hostProcess];
        int v13 = v12;
      }
      objc_msgSend(*(id *)(a1 + 8), "setPidToInheritAppStateFrom:", objc_msgSend(v13, "pid"));
      objc_msgSend(*(id *)(a1 + 8), "setApplicationIDToInheritAppStateFrom:", objc_msgSend((id)objc_msgSend(v13, "bundle"), "identifier"));
      goto LABEL_33;
    }
    goto LABEL_41;
  }
  return [v5 mediaEnvironmentBundleID];
}

- (FigCaptureClientApplicationStateMonitor)initWithClientAuditToken:(id *)a3 mediaEnvironment:(id)a4 forThirdPartyTorch:(BOOL)a5 applicationAndLayoutStateHandler:(id)a6
{
  BOOL v7 = a5;
  int v11 = [FigCaptureClientApplicationStateMonitorClient alloc];
  long long v12 = *(_OWORD *)&a3->var0[4];
  v16[0] = *(_OWORD *)a3->var0;
  v16[1] = v12;
  int v13 = [(FigCaptureClientApplicationStateMonitorClient *)v11 initWithAuditToken:v16 mediaEnvironment:a4 forThirdPartyTorch:v7 applicationAndLayoutStateHandler:a6];
  uint64_t v14 = -[FigCaptureClientApplicationStateMonitor _initWithClient:](self, v13);

  return (FigCaptureClientApplicationStateMonitor *)v14;
}

- (NSString)applicationID
{
  return [(FigCaptureClientApplicationStateMonitorClient *)self->_client applicationID];
}

- (char)_initWithClient:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v28.receiver = a1;
  v28.super_class = (Class)FigCaptureClientApplicationStateMonitor;
  int v3 = (char *)objc_msgSendSuper2(&v28, sel_init);
  if (!v3) {
    return v3;
  }
  *((void *)v3 + 1) = a2;
  if (dword_1EB4C5370)
  {
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *((void *)v3 + 2) = FigSimpleMutexCreate();
  v3[80] = [*((id *)v3 + 1) clientType] != 5;
  v3[96] = objc_msgSend(*((id *)v3 + 1), "isForThirdPartyTorch", v20, v21) ^ 1;
  if ([*((id *)v3 + 1) isForThirdPartyTorch]) {
    char v5 = 0;
  }
  else {
    char v5 = MGGetBoolAnswer();
  }
  v3[105] = v5;
  char v6 = (void *)*((void *)v3 + 1);
  char v7 = BWDeviceIsiPhone();
  v3[113] = v7 & ~[v6 isForThirdPartyTorch];
  uint64_t v8 = (void *)*((void *)v3 + 1);
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  v29[0] = v24;
  v29[1] = v25;
  v3[152] = FigCaptureClientIsFacemetricsd(v29);
  int v9 = (void *)*((void *)v3 + 1);
  if (objc_msgSend((id)objc_msgSend(v9, "applicationID"), "isEqualToString:", @"com.apple.StickerKit.StickerPickerService") & 1) != 0|| (objc_msgSend((id)objc_msgSend(v9, "applicationID"), "isEqualToString:", @"com.apple.mobilenotes"))
  {
    char v10 = 1;
  }
  else
  {
    char v10 = objc_msgSend((id)objc_msgSend(v9, "applicationID"), "isEqualToString:", @"com.apple.PassbookUIService");
  }
  v3[64] = v10;
  *((_DWORD *)v3 + 21) = 0;
  v3[88] = 0;
  *((_DWORD *)v3 + 23) = 0;
  if ([*((id *)v3 + 1) mediaEnvironment])
  {
    int v11 = (void *)[*((id *)v3 + 1) processHandle];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke;
    v23[3] = &unk_1E5C26CA0;
    v23[4] = v3;
    *((void *)v3 + 7) = (id)[v11 rbsProcessMonitorForEndowmentNamespace:0x1EFA76CC0 serviceClass:33 updateHandler:v23];
    -[FigCaptureClientApplicationStateMonitor _updateMediaEnvironmentWithEndowmentInfos:evaluateLayout:]((uint64_t)v3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*((id *)v3 + 1), "pid")), 0), "endowmentInfoForHandle"), 0);
  }
  if (v3[80])
  {
    if (FigCaptureAudiomxdSupportEnabled()
       ? -[FigCaptureClientApplicationStateMonitor _createAndObserveAVAudioSessionForBKSApplicationStateMonitoring]((uint64_t)v3)
       : -[FigCaptureClientApplicationStateMonitor _createAndObserveCMSessionForBKSApplicationStateMonitoring]((uint64_t)v3))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  *((_DWORD *)v3 + 31) = 0;
  *((_DWORD *)v3 + 25) = 0;
  v3[104] = 0;
  if (v3[96])
  {
    id v13 = +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor];
    *((void *)v3 + 16) = v13;
    [v13 addLayoutObserver:v3];
  }
  *((_DWORD *)v3 + 27) = 0;
  v3[112] = 0;
  if (v3[105])
  {
    id v14 = +[FigCaptureDisplayLayoutMonitor sharedExternalDisplayLayoutMonitor];
    *((void *)v3 + 17) = v14;
    [v14 addLayoutObserver:v3];
  }
  *((_DWORD *)v3 + 29) = 0;
  v3[120] = 0;
  if (v3[113])
  {
    id v15 = +[FigCaptureDisplayLayoutMonitor sharedContinuityDisplayLayoutMonitor];
    *((void *)v3 + 18) = v15;
    [v15 addLayoutObserver:v3];
  }
  if (v3[64])
  {
    int v16 = (void *)[*((id *)v3 + 1) processHandle];
    uint64_t v17 = *MEMORY[0x1E4F62718];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke_2;
    v22[3] = &unk_1E5C26CA0;
    v22[4] = v3;
    *((void *)v3 + 9) = (id)[v16 rbsProcessMonitorForEndowmentNamespace:v17 serviceClass:33 updateHandler:v22];
  }
  *(_WORD *)(v3 + 153) = 0;
  if (v3[152])
  {
    id v18 = +[FigCaptureDeviceLockStateMonitor sharedDeviceLockStateMonitor];
    *((void *)v3 + 20) = v18;
    [v18 addDeviceLockStateObserver:v3];
  }
  return v3;
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  if (!self->_invalid) {
    -[FigCaptureClientApplicationStateMonitor _handleLayout:]((uint64_t)self, a4);
  }
}

void __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_msgSend((id)objc_msgSend(a3, "bundle"), "identifier");
  if (objc_msgSend((id)objc_msgSend(a4, "state"), "taskState") == 4)
  {
    char v6 = objc_msgSend((id)objc_msgSend(a4, "state"), "endowmentNamespaces");
    if ([v6 containsObject:*MEMORY[0x1E4F62718]])
    {
      if (*(void *)(a1 + 32) && *(unsigned char *)(a1 + 40))
      {
        char v7 = (void *)MEMORY[0x1A6272C70]();
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

- (uint64_t)_resolveApplicationState
{
  if (!a1) {
    return 0;
  }
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (*(unsigned char *)(a1 + 80)) {
    uint64_t v2 = +[FigCaptureClientApplicationStateMonitor _applicationStateForBKSApplicationState:clientType:backgroundCameraAccess:]((uint64_t)FigCaptureClientApplicationStateMonitor, *(_DWORD *)(a1 + 84), [*(id *)(a1 + 8) clientType], objc_msgSend(*(id *)(a1 + 8), "hasBackgroundCameraAccess"));
  }
  else {
    uint64_t v2 = 2;
  }
  if (!*(unsigned char *)(a1 + 96) && !*(unsigned char *)(a1 + 105))
  {
    if (!*(unsigned char *)(a1 + 113) || v2 != 2)
    {
LABEL_9:
      if (*(unsigned char *)(a1 + 152) && v2 == 2)
      {
        if (*(unsigned char *)(a1 + 153)) {
          uint64_t v2 = 1;
        }
        else {
          uint64_t v2 = 2;
        }
      }
      goto LABEL_15;
    }
LABEL_8:
    int v3 = -[FigCaptureClientApplicationStateMonitor _resolveAggregateLayoutState](a1);
    uint64_t v2 = +[FigCaptureClientApplicationStateMonitor _applicationStateForClientLayoutState:clientType:backgroundCameraAccess:]((uint64_t)FigCaptureClientApplicationStateMonitor, v3, [*(id *)(a1 + 8) clientType], objc_msgSend(*(id *)(a1 + 8), "hasBackgroundCameraAccess"));
    goto LABEL_9;
  }
  if (v2 == 2) {
    goto LABEL_8;
  }
  uint64_t v2 = 1;
LABEL_15:
  if ([*(id *)(a1 + 8) clientType] == 3)
  {
    pthread_mutex_lock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID")), "referencedObject");
    uint64_t v5 = v4;
    if (v2 == 2)
    {
      if (!v4
        || (int v6 = [*(id *)(v4 + 8) pid], v6 == objc_msgSend(*(id *)(a1 + 8), "pid"))
        || (objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "applicationID"), "isEqualToString:", 0x1EFA55960) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "applicationID"), "isEqualToString:", 0x1EFA55960) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "applicationID"), "isEqualToString:", 0x1EFA55C00) & 1) != 0)
      {
        char v7 = [[FigWeakReference alloc] initWithReferencedObject:a1];
        objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "setObject:forKeyedSubscript:", v7, objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID"));

        uint64_t v2 = 2;
      }
      else
      {
        [*(id *)(a1 + 8) xpcServiceRootHostApplicationID];
        [*(id *)(a1 + 8) applicationID];
        [*(id *)(a1 + 8) pid];
        [*(id *)(v5 + 8) applicationID];
        [*(id *)(v5 + 8) pid];
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        uint64_t v2 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      if (v4 == a1) {
        objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "setObject:forKeyedSubscript:", 0, objc_msgSend(*(id *)(a1 + 8), "xpcServiceRootHostApplicationID"));
      }
      uint64_t v2 = 1;
    }
    pthread_mutex_unlock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
  }
  return v2;
}

- (int)clientType
{
  return [(FigCaptureClientApplicationStateMonitorClient *)self->_client clientType];
}

+ (uint64_t)_applicationStateForClientLayoutState:(unsigned int)a3 clientType:(int)a4 backgroundCameraAccess:
{
  self;
  uint64_t result = 1;
  if (a3 <= 8)
  {
    if (((1 << a3) & 0x2E) != 0)
    {
      int v8 = a2 - 2;
      if (a2 - 2) < 5 && ((0x17u >> v8))
      {
        return dword_1A5F0C0C4[v8];
      }
      else if (a4)
      {
        return 2;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      if (a2 == 6) {
        unsigned int v9 = 1;
      }
      else {
        unsigned int v9 = 2;
      }
      if (((1 << a3) & 0x140) != 0) {
        return v9;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

+ (uint64_t)_applicationStateForBKSApplicationState:(int)a3 clientType:(int)a4 backgroundCameraAccess:
{
  self;
  uint64_t result = 1;
  if (a2)
  {
    if (a2 == 4)
    {
      if (a4) {
        return 2;
      }
      else {
        return 1;
      }
    }
    else if (a2 == 8)
    {
      if ((a3 - 3) >= 5) {
        return 2;
      }
      else {
        return dword_1A5F0C0B0[a3 - 3];
      }
    }
  }
  else if (((a3 - 6) & 0xFFFFFFFD) != 0)
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return result;
}

- (uint64_t)_createAndObserveAVAudioSessionForBKSApplicationStateMonitoring
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if ((FigCaptureAudiomxdSupportEnabled() & 1) == 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294954514;
    }
    uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"FigCaptureClient-%d", objc_msgSend(*(id *)(v1 + 8), "pid"));
    id v3 = objc_alloc(MEMORY[0x1E4F4E9F0]);
    uint64_t v4 = *(void **)(v1 + 8);
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    uint64_t v5 = [v3 initSiblingSession:0xFFFFFFFFLL auditToken:v24 clientIdentifier:v2 autoReconnect:1];
    *(void *)(v1 + 24) = v5;
    if (!v5)
    {
      FigDebugAssert3();
      return 4294954510;
    }
    id v6 = +[FigWeakReference weakReferenceToObject:v1];
    char v7 = *(void **)(v1 + 24);
    uint64_t v8 = *MEMORY[0x1E4F75D38];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke;
    v23[3] = &unk_1E5C247D8;
    v23[4] = v6;
    unsigned int v9 = (void *)[v7 addObserverForType:2 name:v8 block:v23];
    if (v9)
    {
      *(void *)(v1 + 40) = v9;
      char v10 = *(void **)(v1 + 24);
      uint64_t v11 = *MEMORY[0x1E4F4E8A0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke_317;
      v22[3] = &unk_1E5C247D8;
      v22[4] = v6;
      long long v12 = (void *)[v10 addObserverForType:1 name:v11 block:v22];
      if (v12)
      {
        *(void *)(v1 + 48) = v12;
        -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromAVAudioSession](v1);
        return 0;
      }
      unsigned int v26 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      id v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v19 = v26;
      if (os_log_type_enabled(v18, type)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (!v20) {
        goto LABEL_24;
      }
      uint64_t v21 = -[FigCaptureClientApplicationStateMonitor loggingPrefix](v1);
      int v27 = 136315394;
      objc_super v28 = "-[FigCaptureClientApplicationStateMonitor _createAndObserveAVAudioSessionForBKSApplicationStateMonitoring]";
      __int16 v29 = 2114;
      uint64_t v30 = v21;
    }
    else
    {
      unsigned int v26 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      id v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v15 = v26;
      if (os_log_type_enabled(v14, type)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v17 = -[FigCaptureClientApplicationStateMonitor loggingPrefix](v1);
      int v27 = 136315394;
      objc_super v28 = "-[FigCaptureClientApplicationStateMonitor _createAndObserveAVAudioSessionForBKSApplicationStateMonitoring]";
      __int16 v29 = 2114;
      uint64_t v30 = v17;
    }
    _os_log_send_and_compose_impl();
LABEL_24:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 4294954510;
  }
  return result;
}

- (uint64_t)_updateBKSApplicationStateFromAVAudioSession
{
  v5[24] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 16));
      v5[0] = 0;
      uint64_t v2 = (void *)[*(id *)(v1 + 24) getMXSessionProperty:*MEMORY[0x1E4F75EB0] error:v5];
      if (v5[0])
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v1, [v2 intValue]);
      }
      return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 16));
    }
    else
    {
      uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (uint64_t)_handleBKSApplicationStateChange:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    if (*(unsigned char *)(v3 + 80))
    {
      uint64_t v4 = (void *)[NSNumber numberWithUnsignedInt:a2];
      return -[FigCaptureClientApplicationStateMonitor _updateClientStateCondition:newValue:](v3, (_DWORD *)(v3 + 84), v4);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A6272C70]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  -[FigCaptureClientApplicationStateMonitor _handleAVAudioSessionApplicationStateDidChangeNotification:]((uint64_t)v5, a2);
}

- (uint64_t)_handleAVAudioSessionApplicationStateDidChangeNotification:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = (void *)[a2 name];
  if (([v4 isEqualToString:*MEMORY[0x1E4F75D38]] & 1) == 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1EB4C5370)
  {
    id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v6 = objc_msgSend(a2, "userInfo", v11, v12);
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F75C90]];
  if (!v7)
  {
    char v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v8 = (void *)v7;
  pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 16));
  if (!*(unsigned char *)(v3 + 168)) {
    -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v3, [v8 intValue]);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 16));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
  if (initialize_sLayoutMonitorOnceToken != -1)
  {
    dispatch_once(&initialize_sLayoutMonitorOnceToken, &__block_literal_global_280);
  }
}

uint64_t __53__FigCaptureClientApplicationStateMonitor_initialize__block_invoke()
{
  sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t result = FigSimpleMutexCreate();
  sLatestForegroundedXPCServiceLock = result;
  return result;
}

uint64_t __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return -[FigCaptureClientApplicationStateMonitor _handleMediaEndowmentUpdate:](*(void *)(a1 + 32), a4);
}

- (uint64_t)_handleMediaEndowmentUpdate:(uint64_t)result
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (dword_1EB4C5370)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -[FigCaptureClientApplicationStateMonitor _updateMediaEnvironmentWithEndowmentInfos:evaluateLayout:](v3, objc_msgSend((id)objc_msgSend(a2, "state", v5, v6), "endowmentInfos"), 1);
  }
  return result;
}

- (uint64_t)_updateMediaEnvironmentWithEndowmentInfos:(int)a3 evaluateLayout:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = &unk_1EB4C5000;
    if (dword_1EB4C5370)
    {
      unsigned int v29 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v38, 16, v20, v22);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "endowmentNamespace"), "isEqualToString:", 0x1EFA76CC0))
          {
            if (objc_msgSend((id)objc_msgSend(v12, "environment"), "isEqualToString:", objc_msgSend(*(id *)(v5 + 8), "mediaEnvironment")))
            {
              uint64_t v13 = (void *)[v12 endowment];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F76920]];
                goto LABEL_16;
              }
            }
          }
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v24 objects:v38 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      uint64_t v14 = 0;
LABEL_16:
      uint64_t v6 = (_DWORD *)&unk_1EB4C5000;
    }
    else
    {
      uint64_t v14 = 0;
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 16));
    if ([*(id *)(v5 + 8) mediaEnvironmentBundleID] == v14
      || (objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "mediaEnvironmentBundleID"), "isEqualToString:", v14) & 1) != 0)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      if (v6[220])
      {
        unsigned int v29 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        unsigned int v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v16 = v29;
        if (os_log_type_enabled(v15, type)) {
          unsigned int v17 = v16;
        }
        else {
          unsigned int v17 = v16 & 0xFFFFFFFE;
        }
        if (v17)
        {
          uint64_t v18 = [NSString stringWithFormat:@"<%p[%d][%@]>", v5, objc_msgSend(*(id *)(v5 + 8), "pid"), objc_msgSend(*(id *)(v5 + 8), "applicationID")];
          uint64_t v19 = [*(id *)(v5 + 8) mediaEnvironmentBundleID];
          int v30 = 136315906;
          uint64_t v31 = "-[FigCaptureClientApplicationStateMonitor _updateMediaEnvironmentWithEndowmentInfos:evaluateLayout:]";
          __int16 v32 = 2114;
          uint64_t v33 = v18;
          __int16 v34 = 2114;
          uint64_t v35 = v19;
          __int16 v36 = 2114;
          uint64_t v37 = v14;
          LODWORD(v23) = 42;
          uint64_t v21 = &v30;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(v5 + 8), "setMediaEnvironmentBundleID:", v14, v21, v23);
      if (v14)
      {
        [(id)v14 UTF8String];
        uint64_t v14 = tcc_identity_create();
        [*(id *)(v5 + 8) setMediaEnvironmentTCCIdentity:v14];

        LOBYTE(v14) = 0;
      }
      else
      {
        [*(id *)(v5 + 8) setMediaEnvironmentTCCIdentity:0];
      }
    }
    uint64_t result = pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 16));
    if ((v14 & 1) == 0)
    {
      if (a3) {
        return -[FigCaptureClientApplicationStateMonitor _handleLayout:](v5, (void *)[*(id *)(v5 + 128) currentLayout]);
      }
    }
  }
  return result;
}

- (uint64_t)_createAndObserveCMSessionForBKSApplicationStateMonitoring
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (FigCaptureAudiomxdSupportEnabled())
  {
    unsigned int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v10 = 4294954514;
  }
  else
  {
    uint64_t v2 = CMSessionCreate();
    if (v2)
    {
      uint64_t v10 = v2;
      FigDebugAssert3();
      unsigned int v24 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"FigCaptureClient-%d", objc_msgSend(*(id *)(a1 + 8), "pid"));
      uint64_t v3 = CMSessionSetProperty();
      if (v3
        || (objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 8), "pid")),
            uint64_t v3 = CMSessionSetProperty(),
            v3))
      {
        uint64_t v10 = v3;
        unsigned int v24 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      }
      else
      {
        memset(v22, 0, sizeof(v22));
        uint64_t v4 = *(void **)(a1 + 8);
        if (v4) {
          [v4 auditToken];
        }
        [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:32];
        uint64_t v5 = CMSessionSetProperty();
        if (!v5)
        {
          id v6 = +[FigWeakReference weakReferenceToObject:a1];
          uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v8 = *MEMORY[0x1E4F75D38];
          uint64_t v9 = *(void *)(a1 + 32);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __101__FigCaptureClientApplicationStateMonitor__createAndObserveCMSessionForBKSApplicationStateMonitoring__block_invoke;
          v21[3] = &unk_1E5C247D8;
          v21[4] = v6;
          *(void *)(a1 + 40) = (id)[v7 addObserverForName:v8 object:v9 queue:0 usingBlock:v21];
          -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromCMSession](a1);
          return 0;
        }
        uint64_t v10 = v5;
        unsigned int v24 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        unsigned int v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v16 = v24;
        if (os_log_type_enabled(v15, type)) {
          unsigned int v17 = v16;
        }
        else {
          unsigned int v17 = v16 & 0xFFFFFFFE;
        }
        if (v17)
        {
          uint64_t v18 = -[FigCaptureClientApplicationStateMonitor loggingPrefix](a1);
          uint64_t v19 = *(void *)(a1 + 32);
          int v25 = 136315906;
          long long v26 = "-[FigCaptureClientApplicationStateMonitor _createAndObserveCMSessionForBKSApplicationStateMonitoring]";
          __int16 v27 = 2114;
          uint64_t v28 = v18;
          __int16 v29 = 2112;
          uint64_t v30 = v19;
          __int16 v31 = 1024;
          int v32 = v10;
          _os_log_send_and_compose_impl();
        }
      }
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v20 = *(const void **)(a1 + 32);
  if (v20)
  {
    CFRelease(v20);
    *(void *)(a1 + 32) = 0;
  }
  return v10;
}

uint64_t __59__FigCaptureClientApplicationStateMonitor__initWithClient___block_invoke_2(uint64_t a1)
{
  return -[FigCaptureClientApplicationStateMonitor _handleVisibilityEndowmentUpdate:](*(void *)(a1 + 32));
}

- (uint64_t)_handleVisibilityEndowmentUpdate:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    if (dword_1EB4C5370)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      uint64_t result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (*(unsigned char *)(v1 + 96)) {
      uint64_t result = -[FigCaptureClientApplicationStateMonitor _handleLayout:](v1, (void *)[*(id *)(v1 + 128) currentLayout]);
    }
    if (*(unsigned char *)(v1 + 105)) {
      uint64_t result = -[FigCaptureClientApplicationStateMonitor _handleLayout:](v1, (void *)[*(id *)(v1 + 136) currentLayout]);
    }
    if (*(unsigned char *)(v1 + 113)) {
      return -[FigCaptureClientApplicationStateMonitor _handleLayout:](v1, (void *)[*(id *)(v1 + 144) currentLayout]);
    }
  }
  return result;
}

- (void)invalidate
{
  stateChangeLock = self->_stateChangeLock;
  if (stateChangeLock)
  {
    pthread_mutex_lock((pthread_mutex_t *)stateChangeLock);
    self->_invalid = 1;
    pthread_mutex_unlock((pthread_mutex_t *)self->_stateChangeLock);
  }
  if ([(FigCaptureClientApplicationStateMonitorClient *)self->_client xpcServiceRootHostApplicationID])
  {
    pthread_mutex_lock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
    uint64_t v4 = (FigCaptureClientApplicationStateMonitor *)objc_msgSend((id)objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "objectForKeyedSubscript:", -[FigCaptureClientApplicationStateMonitorClient xpcServiceRootHostApplicationID](self->_client, "xpcServiceRootHostApplicationID")), "referencedObject");
    if (v4 == self || v4 == 0) {
      objc_msgSend((id)sLatestForegroundXPCServiceApplicationStateMonitorsByHostApplicationID, "setObject:forKeyedSubscript:", 0, -[FigCaptureClientApplicationStateMonitorClient xpcServiceRootHostApplicationID](self->_client, "xpcServiceRootHostApplicationID"));
    }
    pthread_mutex_unlock((pthread_mutex_t *)sLatestForegroundedXPCServiceLock);
  }
  if (FigCaptureAudiomxdSupportEnabled()) {
    -[FigCaptureClientApplicationStateMonitor _deregisterAndReleaseAVAudioSession]((uint64_t)self);
  }
  else {
    -[FigCaptureClientApplicationStateMonitor _deregisterAndReleaseCMSession]((uint64_t)self);
  }
  [(FigCaptureClientApplicationStateMonitorClient *)self->_client invalidate];
  [(RBSProcessMonitor *)self->_mediaEndowmentMonitor invalidate];

  self->_mediaEndowmentMonitor = 0;
  [(RBSProcessMonitor *)self->_visibilityEndowmentMonitor invalidate];

  self->_visibilityEndowmentMonitor = 0;
  [(FigCaptureDisplayLayoutMonitor *)self->_displayLayoutMonitor removeLayoutObserver:self];

  self->_displayLayoutMonitor = 0;
  [(FigCaptureDisplayLayoutMonitor *)self->_externalDisplayLayoutMonitor removeLayoutObserver:self];

  self->_externalDisplayLayoutMonitor = 0;
  [(FigCaptureDisplayLayoutMonitor *)self->_continuityDisplayLayoutMonitor removeLayoutObserver:self];

  self->_continuityDisplayLayoutMonitor = 0;
}

- (void)_deregisterAndReleaseAVAudioSession
{
  if (a1)
  {
    if (FigCaptureAudiomxdSupportEnabled())
    {
      uint64_t v2 = *(void **)(a1 + 24);
      if (v2)
      {
        if (*(unsigned char *)(a1 + 80))
        {
          [v2 removeObserverForType:2 observer:*(void *)(a1 + 40) name:*MEMORY[0x1E4F75D38]];

          *(void *)(a1 + 40) = 0;
          [*(id *)(a1 + 24) removeObserverForType:1 observer:*(void *)(a1 + 48) name:*MEMORY[0x1E4F4E8A0]];

          *(void *)(a1 + 48) = 0;
          uint64_t v2 = *(void **)(a1 + 24);
        }

        *(void *)(a1 + 24) = 0;
      }
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)_deregisterAndReleaseCMSession
{
  if (a1)
  {
    if (FigCaptureAudiomxdSupportEnabled())
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      uint64_t v2 = *(const void **)(a1 + 32);
      if (v2)
      {
        if (!*(unsigned char *)(a1 + 80)
          || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(a1 + 40)), *(id *)(a1 + 40), *(void *)(a1 + 40) = 0, (uint64_t v2 = *(const void **)(a1 + 32)) != 0))
        {
          CFRelease(v2);
          *(void *)(a1 + 32) = 0;
        }
      }
    }
  }
}

- (void)dealloc
{
  [(FigCaptureClientApplicationStateMonitor *)self invalidate];

  if (self->_stateChangeLock)
  {
    FigSimpleMutexDestroy();
    self->_stateChangeLock = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureClientApplicationStateMonitor;
  [(FigCaptureClientApplicationStateMonitor *)&v3 dealloc];
}

- (int)applicationState
{
  return self->_applicationState;
}

- (NSString)mediaEnvironment
{
  uint64_t v2 = [(FigCaptureClientApplicationStateMonitorClient *)self->_client mediaEnvironment];
  return v2;
}

- (OS_tcc_identity)mediaEnvironmentTCCIdentity
{
  uint64_t v2 = [(FigCaptureClientApplicationStateMonitorClient *)self->_client mediaEnvironmentTCCIdentity];
  return v2;
}

- (NSString)debugDescription
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(FigCaptureClientApplicationStateMonitorClient *)self->_client debugDescription];
  int applicationState = self->_applicationState;
  id v6 = @"--- Undefined application state ---";
  if (applicationState == 2) {
    id v6 = @"Foregrounded";
  }
  if (applicationState == 1) {
    uint64_t v7 = @"Backgrounded";
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = (void *)[v3 stringWithFormat:@"%@, state: %@", v4, v7];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (self->_isBKSApplicationStateMonitoringRequiredForClient) {
    [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"bksAppState: %@", FigCaptureBKSApplicationStateToString(self->_bksApplicationState))];
  }
  if (self->_isLayoutMonitoringRequiredForClient || self->_isExternalDisplayLayoutMonitoringRequiredForClient)
  {
    uint64_t aggregateLayoutState = self->_aggregateLayoutState;
    if (aggregateLayoutState > 6) {
      uint64_t v11 = @"--- Undefined layout state ---";
    }
    else {
      uint64_t v11 = *(&off_1E5C26DA0 + aggregateLayoutState);
    }
    [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"layout: %@", v11)];
  }
  if (self->_isDeviceLockStateMonitoringRequiredForClient) {
    [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"device locked: %d", self->_deviceIsLocked)];
  }
  [v8 appendFormat:@" (%@)", objc_msgSend(v9, "componentsJoinedByString:", @", ")];
  uint64_t v12 = NSString;
  return (NSString *)[v12 stringWithString:v8];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureClientApplicationStateMonitor debugDescription](self, "debugDescription")];
}

void __106__FigCaptureClientApplicationStateMonitor__createAndObserveAVAudioSessionForBKSApplicationStateMonitoring__block_invoke_317(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x1A6272C70]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  -[FigCaptureClientApplicationStateMonitor _handleAVAudioSessionMediaServicesWereResetNotification:]((uint64_t)v5, a2);
}

- (uint64_t)_handleAVAudioSessionMediaServicesWereResetNotification:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (void *)[a2 name];
    if ([v3 isEqualToString:*MEMORY[0x1E4F4E8A0]])
    {
      if (dword_1EB4C5370)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromAVAudioSession](v2);
    }
    else
    {
      id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void __101__FigCaptureClientApplicationStateMonitor__createAndObserveCMSessionForBKSApplicationStateMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x1A6272C70]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  -[FigCaptureClientApplicationStateMonitor _handleCMSessionApplicationStateDidChangeNotification:]((uint64_t)v5, a2);
}

- (uint64_t)_handleCMSessionApplicationStateDidChangeNotification:(uint64_t)result
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  id v4 = (void *)[a2 name];
  if (([v4 isEqualToString:*MEMORY[0x1E4F75D38]] & 1) == 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (dword_1EB4C5370)
  {
    id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v6 = objc_msgSend(a2, "userInfo", v11, v12);
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F75C90]];
  if (!v7)
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v8 = (void *)v7;
  pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 16));
  if (!*(unsigned char *)(v3 + 168)) {
    -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v3, [v8 intValue]);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 16));
}

- (uint64_t)_updateBKSApplicationStateFromCMSession
{
  if (result)
  {
    uint64_t v1 = result;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 16));
      if (CMSessionCopyProperty())
      {
        uint64_t v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v1, [0 intValue]);
      }

      return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 16));
    }
  }
  return result;
}

+ (uint64_t)_mapRBSProcessStateToFigCaptureBKSApplicationState:(uint64_t)a1
{
  self;
  switch([a2 taskState])
  {
    case 1u:
      uint64_t result = 1;
      break;
    case 2u:
    case 4u:
      uint64_t v3 = (void *)[a2 endowmentNamespaces];
      if ([v3 containsObject:*MEMORY[0x1E4F62718]]) {
        uint64_t result = 8;
      }
      else {
        uint64_t result = 4;
      }
      break;
    case 3u:
      uint64_t result = 2;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (id)_updateBKSApplicationStateFromRBSState
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingIdentifier:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(result[1], "pid")));
    uint64_t v3 = (void *)[MEMORY[0x1E4F96448] descriptor];
    v8[0] = *MEMORY[0x1E4F62718];
    objc_msgSend(v3, "setEndowmentNamespaces:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 1));
    id v4 = (void *)[MEMORY[0x1E4F96438] statesForPredicate:v2 withDescriptor:v3 error:0];
    uint64_t result = (id *)[v4 count];
    if (result == (id *)1)
    {
      uint64_t result = (id *)[v4 firstObject];
      if (result)
      {
        uint64_t v5 = +[FigCaptureClientApplicationStateMonitor _mapRBSProcessStateToFigCaptureBKSApplicationState:]((uint64_t)FigCaptureClientApplicationStateMonitor, result);
        pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 16));
        if (dword_1EB4C5370)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[FigCaptureClientApplicationStateMonitor _handleBKSApplicationStateChange:](v1, v5);
        if (dword_1EB4C5370)
        {
          uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return (id *)pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 16));
      }
    }
  }
  return result;
}

- (void)updateApplicationState
{
  if (!self->_invalid) {
    -[FigCaptureClientApplicationStateMonitor _updateBKSApplicationStateFromRBSState]((id *)&self->super.isa);
  }
}

- (void)deviceLockStateMonitor:(id)a3 didUpdateDeviceLockState:(BOOL)a4
{
  BOOL v4 = a4;
  pthread_mutex_lock((pthread_mutex_t *)self->_stateChangeLock);
  -[FigCaptureClientApplicationStateMonitor _updateClientStateCondition:newValue:]((uint64_t)self, &self->_deviceIsLocked, (void *)[NSNumber numberWithBool:v4]);
  stateChangeLock = self->_stateChangeLock;
  pthread_mutex_unlock((pthread_mutex_t *)stateChangeLock);
}

+ (void)startPrewarmingMonitorWithHandler:(id)a3
{
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", 0x1EFA44100, 0x1EFA55980, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke;
  v5[3] = &unk_1E5C26CF0;
  v5[4] = v4;
  v5[5] = a3;
  char v6 = 1;
  sPrewarmingProcessMonitor = (uint64_t)(id)[MEMORY[0x1E4F96418] monitorWithConfiguration:v5];
}

uint64_t __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)[MEMORY[0x1E4F96448] descriptor];
  [v4 setValues:1];
  v9[0] = *MEMORY[0x1E4F62718];
  objc_msgSend(v4, "setEndowmentNamespaces:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 1));
  [a2 setStateDescriptor:v4];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingBundleIdentifiers:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *(void *)(a1 + 32)));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v8, 1));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__FigCaptureClientApplicationStateMonitor_startPrewarmingMonitorWithHandler___block_invoke_2;
  v6[3] = &unk_1E5C26CC8;
  v6[4] = *(void *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  return [a2 setUpdateHandler:v6];
}

+ (void)stopPrewarmingMonitor
{
  sPrewarmingProcessMonitor = 0;
}

+ (void)startContinuityCaptureTerminationMonitorWithHandler:(id)a3
{
  if (!sContinuityCaptureProcessTerminationMonitor)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke;
    v3[3] = &unk_1E5C26D40;
    v3[4] = a3;
    sContinuityCaptureProcessTerminationMonitor = (uint64_t)(id)[MEMORY[0x1E4F96418] monitorWithConfiguration:v3];
  }
}

uint64_t __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F96448], "descriptor"), "setValues:", 1);
  [a2 setEvents:1];
  v6[0] = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:0x1EFA55C00];
  v6[1] = [MEMORY[0x1E4F96430] predicateMatchingJobLabel:0x1EFA558C0];
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 2));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke_2;
  v5[3] = &unk_1E5C26D18;
  v5[4] = *(void *)(a1 + 32);
  return [a2 setUpdateHandler:v5];
}

void __95__FigCaptureClientApplicationStateMonitor_startContinuityCaptureTerminationMonitorWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "exitEvent"), "process"), "pid");
  uint64_t v7 = v5;
  if (dword_1EB4C5370)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    uint64_t v5 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v9 = (void *)MEMORY[0x1A6272C70](v5, v6);
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7);
  }
}

@end