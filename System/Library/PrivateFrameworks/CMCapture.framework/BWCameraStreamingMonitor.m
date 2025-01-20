@interface BWCameraStreamingMonitor
+ (id)sharedCameraStreamingMonitor;
+ (void)initialize;
- (BWCameraStreamingMonitor)initWithMediaStatusDomainPublisher:(id)a3 msnReportingEnabled:(BOOL)a4 systemStatusReportingEnabled:(BOOL)a5 privacyAccountingAccessLogger:(id)a6;
- (uint64_t)_handleClientDeath:(uint64_t)result;
- (uint64_t)_informSystemStatusWithIsStreaming:(long long *)a3 clientAuditToken:(uint64_t)a4 mediaEnvironment:;
- (uint64_t)_updateCameraStreamingMonitorInfoWithStreaming:(char)a3 cameraAccessGranted:(long long *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:(int)a6 updateStreamingStatus:(int)a7 updateAccessStatus:;
- (void)_informInternalFrameworksFromSetStreaming:(int)a3 deviceType:(long long *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:(uint64_t)a6 mediaEnvironment:;
- (void)_informMediaSafetyNetWithIsStreaming:(long long *)a3 clientAuditToken:;
- (void)_informPrivacyAccountingWithIsStreaming:(uint64_t)a3 clientInfo:(long long *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:;
- (void)_updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:(uint64_t)a1 deviceType:(unsigned int)a2 streamUniqueID:(int)a3 clientAuditToken:(void *)a4;
- (void)dealloc;
- (void)setCameraAccess:(BOOL)a3 deviceType:(int)a4 clientAuditToken:(id *)a5 tccIdentity:(id)a6 mediaEnvironment:(id)a7 completionHandler:(id)a8;
- (void)setStreaming:(BOOL)a3 deviceType:(int)a4 streamUniqueID:(id)a5 clientAuditToken:(id *)a6 tccIdentity:(id)a7 mediaEnvironment:(id)a8 completionHandler:(id)a9;
@end

@implementation BWCameraStreamingMonitor

+ (id)sharedCameraStreamingMonitor
{
  if (sharedCameraStreamingMonitor_sOnceToken != -1) {
    dispatch_once(&sharedCameraStreamingMonitor_sOnceToken, &__block_literal_global_90);
  }
  return (id)sharedCameraStreamingMonitor_sSharedBWCameraStreamingMonitor;
}

- (void)setStreaming:(BOOL)a3 deviceType:(int)a4 streamUniqueID:(id)a5 clientAuditToken:(id *)a6 tccIdentity:(id)a7 mediaEnvironment:(id)a8 completionHandler:(id)a9
{
  cameraStreamingMonitorQueue = self->_cameraStreamingMonitorQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  long long v10 = *(_OWORD *)&a6->var0[4];
  long long v12 = *(_OWORD *)a6->var0;
  v11[2] = __131__BWCameraStreamingMonitor_setStreaming_deviceType_streamUniqueID_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke;
  v11[3] = &unk_1E5C2AED8;
  long long v13 = v10;
  BOOL v15 = a3;
  int v14 = a4;
  v11[4] = self;
  v11[5] = a5;
  v11[6] = a7;
  v11[7] = a8;
  v11[8] = a9;
  dispatch_async(cameraStreamingMonitorQueue, v11);
}

- (void)setCameraAccess:(BOOL)a3 deviceType:(int)a4 clientAuditToken:(id *)a5 tccIdentity:(id)a6 mediaEnvironment:(id)a7 completionHandler:(id)a8
{
  cameraStreamingMonitorQueue = self->_cameraStreamingMonitorQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__BWCameraStreamingMonitor_setCameraAccess_deviceType_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke;
  block[3] = &unk_1E5C2AF00;
  BOOL v14 = a3;
  long long v9 = *(_OWORD *)&a5->var0[4];
  long long v11 = *(_OWORD *)a5->var0;
  long long v12 = v9;
  block[4] = self;
  block[5] = a6;
  int v13 = a4;
  block[6] = a7;
  block[7] = a8;
  dispatch_async(cameraStreamingMonitorQueue, block);
}

uint64_t __131__BWCameraStreamingMonitor_setStreaming_deviceType_streamUniqueID_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 88);
  long long v20 = *(_OWORD *)(a1 + 72);
  long long v21 = v2;
  uint64_t PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v20);
  v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", PIDFromAuditToken));
  if (!v4)
  {
    v4 = (void *)[MEMORY[0x1E4F1CA80] set];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v4, objc_msgSend(NSNumber, "numberWithInt:", PIDFromAuditToken));
  }
  v5 = (long long *)(a1 + 72);
  v6 = (void *)[MEMORY[0x1E4F1CAD0] setWithSet:v4];
  int v7 = *(_DWORD *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 108))
  {
    -[BWCameraStreamingMonitor _updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:deviceType:streamUniqueID:clientAuditToken:](v8, 1u, v7, v9);
    [v4 addObject:*(void *)(a1 + 40)];
    if ([v6 count] || !objc_msgSend(v4, "count")) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  -[BWCameraStreamingMonitor _updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:deviceType:streamUniqueID:clientAuditToken:](v8, 0, v7, v9);
  [v4 removeObject:*(void *)(a1 + 40)];
  if (![v4 count])
  {
LABEL_6:
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = *(unsigned char *)(a1 + 108);
    uint64_t v12 = *(void *)(a1 + 48);
    long long v13 = *(_OWORD *)(a1 + 88);
    long long v20 = *v5;
    long long v21 = v13;
    -[BWCameraStreamingMonitor _updateCameraStreamingMonitorInfoWithStreaming:cameraAccessGranted:clientAuditToken:tccIdentity:updateStreamingStatus:updateAccessStatus:](v10, v11, 0, &v20, v12, 1, 0);
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(_DWORD *)(a1 + 104);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    long long v18 = *(_OWORD *)(a1 + 88);
    long long v20 = *v5;
    long long v21 = v18;
    -[BWCameraStreamingMonitor _informInternalFrameworksFromSetStreaming:deviceType:clientAuditToken:tccIdentity:mediaEnvironment:](v14, 1, v15, &v20, v16, v17);
  }
LABEL_7:
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateSpeakerInterferenceMitigationRequirementIfNeededWithIsStreaming:(uint64_t)a1 deviceType:(unsigned int)a2 streamUniqueID:(int)a3 clientAuditToken:(void *)a4
{
  if (a1)
  {
    if (FigCaptureSpeakerInterferenceMitigationIsSupported())
    {
      int v7 = [a4 isEqualToString:@"com.apple.avfoundation.avcapturedevice.built-in_video:1"];
      if ((a3 - 21) <= 0xFFFFFFFB)
      {
        if (v7)
        {
          FigCaptureSpeakerSetInterferenceMitigationIsRequired(a2, 0);
        }
      }
    }
  }
}

uint64_t __119__BWCameraStreamingMonitor_setCameraAccess_deviceType_clientAuditToken_tccIdentity_mediaEnvironment_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 100);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = v5;
  -[BWCameraStreamingMonitor _updateCameraStreamingMonitorInfoWithStreaming:cameraAccessGranted:clientAuditToken:tccIdentity:updateStreamingStatus:updateAccessStatus:](v3, 0, v2, &v13, v4, 0, 1);
  if (*(unsigned char *)(a1 + 100))
  {
    int v6 = *(_DWORD *)(a1 + 96);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    long long v10 = *(_OWORD *)(a1 + 80);
    long long v13 = *(_OWORD *)(a1 + 64);
    long long v14 = v10;
    -[BWCameraStreamingMonitor _informInternalFrameworksFromSetStreaming:deviceType:clientAuditToken:tccIdentity:mediaEnvironment:](v7, 0, v6, &v13, v8, v9);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

- (uint64_t)_updateCameraStreamingMonitorInfoWithStreaming:(char)a3 cameraAccessGranted:(long long *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:(int)a6 updateStreamingStatus:(int)a7 updateAccessStatus:
{
  if (!result) {
    return result;
  }
  uint64_t v14 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v28 = v7;
    LODWORD(v27) = 0;
    FigDebugAssert3();
  }
  uint64_t v34 = 0;
  long long v15 = a4[1];
  long long v32 = *a4;
  long long v33 = v15;
  uint64_t PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v32);
  long long v17 = a4[1];
  long long v32 = *a4;
  long long v33 = v17;
  int PIDVersionFromAuditToken = FigCaptureGetPIDVersionFromAuditToken(&v32);
  v19 = objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", PIDFromAuditToken), &v34);
  if (!a5)
  {
    uint64_t v24 = objc_msgSend(*(id *)(v14 + 40), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", PIDFromAuditToken));
    if (v24)
    {
      long long v21 = (void *)v24;
      long long v25 = a4[1];
      long long v32 = *a4;
      long long v33 = v25;
      uint64_t result = FigCaptureAuditTokenIsValid((uint64_t)&v32);
      if (result)
      {
        v26 = (void *)v21[2];
        if (v26) {
          [v26 auditToken];
        }
        else {
          memset(v29, 0, sizeof(v29));
        }
        uint64_t result = FigCaptureGetPIDVersionFromAuditToken(v29);
        if (PIDVersionFromAuditToken != result) {
          return result;
        }
      }
      goto LABEL_17;
    }
    long long v21 = -[BWCameraStreamingMonitorClientInfo initWithProcessHandle:]([BWCameraStreamingMonitorClientInfo alloc], v19);
    objc_msgSend(*(id *)(v14 + 40), "setObject:forKeyedSubscript:", v21, objc_msgSend(NSNumber, "numberWithInt:", PIDFromAuditToken));
    if (v21) {
      v22 = (void *)v21[2];
    }
    else {
      v22 = 0;
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_3;
    v30[3] = &unk_1E5C2AEB0;
    v30[4] = v14;
    v23 = v30;
    goto LABEL_16;
  }
  uint64_t v20 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
  uint64_t result = [*(id *)(v14 + 48) objectForKeyedSubscript:v20];
  long long v21 = (void *)result;
  if (!result)
  {
    long long v21 = -[BWCameraStreamingMonitorClientInfo initWithProcessHandle:]([BWCameraStreamingMonitorClientInfo alloc], v19);
    [*(id *)(v14 + 48) setObject:v21 forKeyedSubscript:v20];
    if (v21) {
      v22 = (void *)v21[2];
    }
    else {
      v22 = 0;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke;
    v31[3] = &unk_1E5C2AEB0;
    v31[4] = v14;
    v23 = v31;
LABEL_16:
    uint64_t result = objc_msgSend(v22, "monitorForDeath:", v23, v27, v28);
  }
LABEL_17:
  if (a6)
  {
    if (!v21) {
      return result;
    }
    *((unsigned char *)v21 + 8) = a2;
  }
  if (a7)
  {
    if (v21) {
      *((unsigned char *)v21 + 9) = a3;
    }
  }
  return result;
}

- (void)_informInternalFrameworksFromSetStreaming:(int)a3 deviceType:(long long *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:(uint64_t)a6 mediaEnvironment:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v38 = v6;
      LODWORD(v37) = 0;
      FigDebugAssert3();
    }
    long long v13 = a4[1];
    long long v39 = *a4;
    long long v40 = v13;
    uint64_t PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&v39);
    if (a5)
    {
      uint64_t v15 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
      uint64_t v16 = *(void **)(a1 + 48);
    }
    else
    {
      long long v17 = *(void **)(a1 + 40);
      uint64_t v15 = [NSNumber numberWithInt:PIDFromAuditToken];
      uint64_t v16 = v17;
    }
    uint64_t v18 = objc_msgSend(v16, "objectForKeyedSubscript:", v15, v37, v38);
    uint64_t v19 = v18;
    if (v18)
    {
      int v20 = *(unsigned __int8 *)(v18 + 8);
      if (*(unsigned char *)(v18 + 9)) {
        BOOL v21 = v20 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21)
      {
        if (*(unsigned char *)(v18 + 9)) {
          BOOL v22 = v20 == 0;
        }
        else {
          BOOL v22 = 0;
        }
        if (v22 && a2 != 0)
        {
          if ((a3 - 17) >= 4)
          {
            long long v24 = a4[1];
            long long v39 = *a4;
            long long v40 = v24;
            -[BWCameraStreamingMonitor _informSystemStatusWithIsStreaming:clientAuditToken:mediaEnvironment:](a1, 0, &v39, a6);
            long long v25 = a4[1];
            long long v39 = *a4;
            long long v40 = v25;
            -[BWCameraStreamingMonitor _informPrivacyAccountingWithIsStreaming:clientInfo:clientAuditToken:tccIdentity:](a1, 0, v19, &v39, a5);
          }
          long long v26 = a4[1];
          long long v39 = *a4;
          long long v40 = v26;
          -[BWCameraStreamingMonitor _informMediaSafetyNetWithIsStreaming:clientAuditToken:](a1, 0, &v39);
          if (a5)
          {
            uint64_t v27 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
            uint64_t v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:v27];
            if (!v28 || !*(unsigned char *)(v28 + 10)) {
              return;
            }
            v29 = *(void **)(a1 + 48);
            uint64_t v30 = v27;
          }
          else
          {
            uint64_t v34 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", PIDFromAuditToken));
            if (!v34 || !*(unsigned char *)(v34 + 10)) {
              return;
            }
            v35 = *(void **)(a1 + 40);
            uint64_t v30 = [NSNumber numberWithInt:PIDFromAuditToken];
            v29 = v35;
          }
          [v29 removeObjectForKey:v30];
        }
      }
      else
      {
        if ((a3 - 17) > 3)
        {
          long long v32 = a4[1];
          long long v39 = *a4;
          long long v40 = v32;
          -[BWCameraStreamingMonitor _informSystemStatusWithIsStreaming:clientAuditToken:mediaEnvironment:](a1, 1, &v39, a6);
          long long v33 = a4[1];
          long long v39 = *a4;
          long long v40 = v33;
          -[BWCameraStreamingMonitor _informPrivacyAccountingWithIsStreaming:clientInfo:clientAuditToken:tccIdentity:](a1, 1, v19, &v39, a5);
        }
        else if (dword_1EB4C4F50)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        long long v36 = a4[1];
        long long v39 = *a4;
        long long v40 = v36;
        -[BWCameraStreamingMonitor _informMediaSafetyNetWithIsStreaming:clientAuditToken:](a1, 1, &v39);
      }
    }
  }
}

- (uint64_t)_informSystemStatusWithIsStreaming:(long long *)a3 clientAuditToken:(uint64_t)a4 mediaEnvironment:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if (*(unsigned char *)(result + 33))
    {
      if (_FigIsCurrentDispatchQueue())
      {
        if (a2)
        {
LABEL_5:
          long long v9 = a3[1];
          long long v25 = *a3;
          long long v26 = v9;
          if (FigCaptureAuditTokenIsValid((uint64_t)&v25))
          {
            long long v10 = a3[1];
            long long v25 = *a3;
            long long v26 = v10;
            id v11 = +[FigCaptureProcessHandle handleForAuditToken:&v25 error:0];
            if (!v11)
            {
              int v24 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              return fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          else
          {
            id v11 = 0;
          }
          long long v13 = *(void **)(v5 + 16);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __97__BWCameraStreamingMonitor__informSystemStatusWithIsStreaming_clientAuditToken_mediaEnvironment___block_invoke;
          v20[3] = &unk_1E5C2AE68;
          v20[4] = a4;
          v20[5] = v11;
          long long v14 = a3[1];
          long long v21 = *a3;
          long long v22 = v14;
          uint64_t v15 = v20;
          uint64_t v16 = v13;
          return objc_msgSend(v16, "updateVolatileDataWithBlock:", v15, v18, v19);
        }
      }
      else
      {
        uint64_t v19 = v4;
        LODWORD(v18) = 0;
        FigDebugAssert3();
        if (a2) {
          goto LABEL_5;
        }
      }
      if (dword_1EB4C4F50)
      {
        int v24 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        long long v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v16 = *(void **)(v5 + 16);
      uint64_t v15 = &__block_literal_global_35;
      return objc_msgSend(v16, "updateVolatileDataWithBlock:", v15, v18, v19);
    }
  }
  return result;
}

- (void)_informPrivacyAccountingWithIsStreaming:(uint64_t)a3 clientInfo:(long long *)a4 clientAuditToken:(uint64_t)a5 tccIdentity:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = a4[1];
    long long v44 = *a4;
    long long v45 = v10;
    FigCaptureGetPIDFromAuditToken(&v44);
    if (a2)
    {
      if (!a3) {
        goto LABEL_12;
      }
      id v11 = *(void **)(a3 + 24);
      if (v11)
      {
        [v11 end];
        objc_setProperty_nonatomic((id)a3, v12, 0, 24);
      }
      long long v13 = *(void **)(a3 + 16);
      if (v13)
      {
        [v13 auditToken];
        if (FigCaptureClientIsRunningInMediaserverd(v43)) {
          goto LABEL_23;
        }
      }
      else
      {
LABEL_12:
        memset(v43, 0, sizeof(v43));
        if (FigCaptureClientIsRunningInMediaserverd(v43)) {
          goto LABEL_23;
        }
        if (!a3) {
          goto LABEL_21;
        }
      }
      uint64_t v15 = *(void **)(a3 + 16);
      if (v15)
      {
        [v15 auditToken];
        goto LABEL_22;
      }
LABEL_21:
      memset(v42, 0, sizeof(v42));
LABEL_22:
      if (!FigCaptureClientIsAVConferenced(v42))
      {
        if (!a5)
        {
          long long v29 = a4[1];
          long long v44 = *a4;
          long long v45 = v29;
          if (!FigCaptureAuditTokenIsValid((uint64_t)&v44))
          {
            PATCCAccessClass = (void *)getPATCCAccessClass();
            uint64_t v26 = objc_msgSend(PATCCAccessClass, "accessWithAccessor:forService:", (id)objc_msgSend(objc_alloc((Class)getPAApplicationClass()), "initWithBundleID:", 0x1EFA44100), *MEMORY[0x1E4FA9A38]);
            if (dword_1EB4C4F50)
            {
              int v41 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            goto LABEL_28;
          }
          if (dword_1EB4C4F50)
          {
            int v41 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          uint64_t v34 = (void *)getPATCCAccessClass();
          if (a3 && (v35 = *(void **)(a3 + 16)) != 0)
          {
            [v35 auditToken];
          }
          else
          {
            long long v38 = 0u;
            long long v39 = 0u;
          }
          uint64_t v25 = objc_msgSend(v34, "accessWithAuditToken:forService:", &v38, *MEMORY[0x1E4FA9A38], v36, v37);
LABEL_27:
          uint64_t v26 = v25;
LABEL_28:
          uint64_t v27 = objc_msgSend(*(id *)(a1 + 56), "beginIntervalForAccess:", v26, v36, v37, v38, v39);
          if (!a3) {
            return;
          }
          uint64_t v19 = (void *)v27;
          uint64_t v18 = (void *)a3;
          goto LABEL_30;
        }
        [NSString stringWithUTF8String:tcc_identity_get_identifier()];
        if (dword_1EB4C4F50)
        {
          int v41 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v33 = getPATCCAccessClass();
        id v22 = (id)[objc_alloc((Class)getPAApplicationClass()) initWithTCCIdentity:a5];
        uint64_t v23 = *MEMORY[0x1E4FA9A38];
        int v24 = (void *)v33;
LABEL_26:
        uint64_t v25 = objc_msgSend(v24, "accessWithAccessor:forService:", v22, v23, v36, v37);
        goto LABEL_27;
      }
LABEL_23:
      if (dword_1EB4C4F50)
      {
        int v41 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v21 = getPATCCAccessClass();
      id v22 = (id)[(id)getPAApplicationClass() applicationWithType:0 identifier:0x1EFA55AE0];
      uint64_t v23 = *MEMORY[0x1E4FA9A38];
      int v24 = (void *)v21;
      goto LABEL_26;
    }
    if (a5)
    {
      [NSString stringWithUTF8String:tcc_identity_get_identifier()];
      if (dword_1EB4C4F50)
      {
        int v41 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        long long v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
LABEL_18:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (dword_1EB4C4F50)
    {
      int v41 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      goto LABEL_18;
    }
    if (!a3)
    {
      [0 end];
      return;
    }
    [*(id *)(a3 + 24) end];
    uint64_t v18 = (void *)a3;
    uint64_t v19 = 0;
LABEL_30:
    objc_setProperty_nonatomic(v18, v17, v19, 24);
  }
}

- (void)_informMediaSafetyNetWithIsStreaming:(long long *)a3 clientAuditToken:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 32))
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    long long v5 = a3[1];
    long long v15 = *a3;
    long long v16 = v5;
    FigCaptureGetPIDFromAuditToken(&v15);
    if (a2)
    {
      long long v6 = a3[1];
      long long v15 = *a3;
      long long v16 = v6;
      if (FigCaptureAuditTokenIsValid((uint64_t)&v15))
      {
        long long v7 = a3[1];
        long long v15 = *a3;
        long long v16 = v7;
        CFStringRef v8 = FigCaptureCopyClientCodeSigningIdentifier(&v15);
      }
      else
      {
        CFStringRef v8 = (const __CFString *)CFRetain(@"com.apple.camera");
      }
      CFStringRef v10 = v8;
      if (dword_1EB4C4F50)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      MSNMonitorSetCameraState();
      long long v12 = a3[1];
      long long v15 = *a3;
      long long v16 = v12;
      if (FigCaptureClientIsRunningInXCTest(&v15))
      {
        MSNMonitorSetXCTestExceptionState();
        if (!v10) {
          return;
        }
        goto LABEL_16;
      }
      long long v13 = a3[1];
      long long v15 = *a3;
      long long v16 = v13;
      if (FigCaptureClientIsNonStandard(&v15)
        && (long long v14 = a3[1], v15 = *a3, v16 = v14, !FigCaptureClientIsAVConferenced(&v15)))
      {
        CFStringGetCStringPtr(v10, 0x600u);
      }
      else
      {
        MSNMonitorSetXCTestExceptionState();
      }
      MSNMonitorSetCameraNonStandardCameraClient();
      if (v10)
      {
LABEL_16:
        CFStringGetCStringPtr(v10, 0x600u);
        MSNMonitorSetLastCameraClient();
        CFRelease(v10);
      }
    }
    else
    {
      if (dword_1EB4C4F50)
      {
        long long v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      MSNMonitorSetCameraState();
      MSNMonitorSetXCTestExceptionState();
      MSNMonitorSetCameraNonStandardCameraClient();
    }
  }
}

void __97__BWCameraStreamingMonitor__informSystemStatusWithIsStreaming_clientAuditToken_mediaEnvironment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    int v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "extensionPointIdentifier"), "isEqualToString:", 0x1EFA55D60);
    long long v12 = (long long *)(a1 + 48);
    long long v13 = *(_OWORD *)(a1 + 64);
    long long v54 = *(_OWORD *)(a1 + 48);
    long long v55 = v13;
    if (!FigCaptureAuditTokenIsValid((uint64_t)&v54) || (v11 & 1) != 0)
    {
      if (v11)
      {
        id v29 = objc_alloc((Class)getSTExecutableIdentityClass());
        long long v30 = *(_OWORD *)(a1 + 64);
        long long v54 = *v12;
        long long v55 = v30;
        v31 = (void *)[v29 initWithAuditToken:&v54];
        long long v32 = (void *)[objc_alloc((Class)getSTAttributedEntityClass()) initWithExecutableIdentity:v31];
        uint64_t v33 = objc_msgSend(objc_alloc((Class)getSTExecutableIdentityClass()), "initWithApplicationBundleIdentifier:", objc_msgSend(*(id *)(a1 + 40), "extensionContainingAppBundleIdentifier"));
        uint64_t v34 = (void *)[objc_alloc((Class)getSTAttributedEntityClass()) initWithExecutableIdentity:v33];
        v35 = (void *)[objc_alloc((Class)getSTActivityAttributionClass()) initWithAttributedEntity:v34 activeEntity:v32];
        if (dword_1EB4C4F50)
        {
          LODWORD(v47) = 0;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v35, v45, v46));
      }
      else
      {
        int v41 = (void *)[objc_alloc((Class)getSTExecutableIdentityClass()) initWithApplicationBundleIdentifier:0x1EFA44100];
        v42 = (void *)[objc_alloc((Class)getSTAttributedEntityClass()) initWithExecutableIdentity:v41];
        v43 = (void *)[objc_alloc((Class)getSTActivityAttributionClass()) initWithAttributedEntity:v42];
        if (dword_1EB4C4F50)
        {
          long long v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v43, v45, v46));
      }
      return;
    }
    if (dword_1EB4C4F50)
    {
      LODWORD(v47) = 0;
      long long v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
    STActivityAttributionClass = (void *)getSTActivityAttributionClass();
    long long v39 = *v12;
    long long v40 = *(_OWORD *)(a1 + 64);
LABEL_30:
    long long v54 = v39;
    long long v55 = v40;
    objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(v37, "setWithObject:", objc_msgSend(STActivityAttributionClass, "attributionWithAuditToken:", &v54, v45, v46)));
    return;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "rbsProcessHandle"), "endowmentInfoForHandle");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v5)
  {
LABEL_20:
    if (dword_1EB4C4F50)
    {
      LODWORD(v47) = 0;
      uint64_t v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
    STActivityAttributionClass = (void *)getSTActivityAttributionClass();
    long long v39 = *(_OWORD *)(a1 + 48);
    long long v40 = *(_OWORD *)(a1 + 64);
    goto LABEL_30;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v50;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v50 != v7) {
      objc_enumerationMutation(v4);
    }
    long long v9 = *(void **)(*((void *)&v49 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "endowmentNamespace"), "isEqualToString:", 0x1EFA76CC0))
    {
      if (objc_msgSend((id)objc_msgSend(v9, "environment"), "isEqualToString:", *(void *)(a1 + 32)))
      {
        CFStringRef v10 = (void *)[v9 endowment];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  long long v15 = (void *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F76918]];
  uint64_t v16 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F76928]];
  if (!v15) {
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  id v18 = objc_alloc((Class)getSTExecutableIdentityClass());
  long long v19 = *(_OWORD *)(a1 + 64);
  long long v54 = *(_OWORD *)(a1 + 48);
  long long v55 = v19;
  int v20 = (void *)[v18 initWithAuditToken:&v54];
  uint64_t v21 = (void *)[objc_alloc((Class)getSTAttributedEntityClass()) initWithExecutableIdentity:v20];
  *(void *)&long long v22 = -1;
  *((void *)&v22 + 1) = -1;
  long long v47 = v22;
  long long v48 = v22;
  [v15 getBytes:&v47 length:32];
  long long v54 = v47;
  long long v55 = v48;
  FigCaptureGetPIDFromAuditToken(&v54);
  id v23 = objc_alloc((Class)getSTExecutableIdentityClass());
  long long v54 = v47;
  long long v55 = v48;
  int v24 = (void *)[v23 initWithAuditToken:&v54];
  uint64_t v25 = (void *)[objc_alloc((Class)getSTAttributedEntityClass()) initWithExecutableIdentity:v24 website:v17];
  uint64_t v26 = (void *)[objc_alloc((Class)getSTActivityAttributionClass()) initWithAttributedEntity:v25 activeEntity:v21];
  if (dword_1EB4C4F50)
  {
    uint64_t v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "setCameraCaptureAttributions:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v26, v45, v46));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

BWCameraStreamingMonitor *__56__BWCameraStreamingMonitor_sharedCameraStreamingMonitor__block_invoke()
{
  uint64_t result = (BWCameraStreamingMonitor *)SystemStatusLibraryCore();
  if (result && (uint64_t result = (BWCameraStreamingMonitor *)getSTActivityAttributionClass()) != 0)
  {
    uint64_t result = (BWCameraStreamingMonitor *)getSTMediaStatusDomainPublisherClass();
    BOOL v1 = result != 0;
  }
  else
  {
    BOOL v1 = 0;
  }
  if (MEMORY[0x1E4F77890]) {
    BOOL v2 = MEMORY[0x1E4F77898] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  unsigned int v3 = !v2;
  if (MEMORY[0x1E4F778A0]) {
    BOOL v4 = MEMORY[0x1E4F778A8] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v3;
  }
  if ((v5 & 1) != 0 || v1)
  {
    if (v1) {
      id v6 = (id)[objc_alloc((Class)getSTMediaStatusDomainPublisherClass()) init];
    }
    else {
      id v6 = 0;
    }
    uint64_t result = -[BWCameraStreamingMonitor initWithMediaStatusDomainPublisher:msnReportingEnabled:systemStatusReportingEnabled:privacyAccountingAccessLogger:]([BWCameraStreamingMonitor alloc], "initWithMediaStatusDomainPublisher:msnReportingEnabled:systemStatusReportingEnabled:privacyAccountingAccessLogger:", v6, v5, v1, [(id)getPAAccessLoggerClass() sharedInstance]);
    sharedCameraStreamingMonitor_sSharedBWCameraStreamingMonitor = (uint64_t)result;
  }
  return result;
}

- (BWCameraStreamingMonitor)initWithMediaStatusDomainPublisher:(id)a3 msnReportingEnabled:(BOOL)a4 systemStatusReportingEnabled:(BOOL)a5 privacyAccountingAccessLogger:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BWCameraStreamingMonitor;
  CFStringRef v10 = [(BWCameraStreamingMonitor *)&v15 init];
  int v11 = v10;
  if (v10)
  {
    if (v7)
    {
      v10->_systemStatusReportingEnabled = v7;
      v10->_mediaStatusDomainPublisher = (STMediaStatusDomainPublisher *)a3;
      FigCaptureGetCurrentProcessAuditToken(v14);
      if (FigCaptureClientHasEntitlement(v14, @"com.apple.systemstatus.activityattribution"))
      {
        uint64_t v17 = 0;
        id v18 = &v17;
        uint64_t v19 = 0x3052000000;
        int v20 = __Block_byref_object_copy__33;
        uint64_t v21 = __Block_byref_object_dispose__33;
        long long v12 = (void *)getSTDynamicActivityAttributionPublisherClass_softClass;
        uint64_t v22 = getSTDynamicActivityAttributionPublisherClass_softClass;
        if (!getSTDynamicActivityAttributionPublisherClass_softClass)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __getSTDynamicActivityAttributionPublisherClass_block_invoke;
          v16[3] = &unk_1E5C24978;
          v16[4] = &v17;
          __getSTDynamicActivityAttributionPublisherClass_block_invoke((uint64_t)v16);
          long long v12 = (void *)v18[5];
        }
        _Block_object_dispose(&v17, 8);
        [v12 setCurrentAttributionKey:0 andApp:0x1EFA55AE0];
      }
    }
    if (v8) {
      v11->_msnReportingEnabled = v8;
    }
    v11->_activeStreamUniqueIDsByClientPID = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v11->_cameraStreamingMonitorQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v11->_clientInfoByPID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11->_managedClientInfoByBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11->_privacyAccountingAccessLogger = (PAAccessLogger *)a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWCameraStreamingMonitor;
  [(BWCameraStreamingMonitor *)&v3 dealloc];
}

- (uint64_t)_handleClientDeath:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v14 = v2;
    LODWORD(v13) = 0;
    FigDebugAssert3();
  }
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "pid", v13, v14));
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "bundle"), "identifier");
  BOOL v7 = (id *)(v4 + 48);
  if (![*(id *)(v4 + 48) objectForKeyedSubscript:v6])
  {
    CFStringRef v10 = *(void **)(v4 + 40);
    long long v9 = (id *)(v4 + 40);
    uint64_t v11 = [v10 objectForKeyedSubscript:v5];
    if (v11) {
      *(unsigned char *)(v11 + 10) = 1;
    }
    uint64_t result = [*v9 objectForKeyedSubscript:v5];
    if (result)
    {
      BOOL v7 = v9;
      uint64_t v6 = v5;
      if (*(unsigned char *)(result + 8)) {
        return result;
      }
    }
    else
    {
      BOOL v7 = v9;
      uint64_t v6 = v5;
    }
    goto LABEL_16;
  }
  uint64_t v8 = [*v7 objectForKeyedSubscript:v6];
  if (v8) {
    *(unsigned char *)(v8 + 10) = 1;
  }
  uint64_t result = [*v7 objectForKeyedSubscript:v6];
  if (!result || !*(unsigned char *)(result + 8))
  {
LABEL_16:
    id v12 = *v7;
    return [v12 removeObjectForKey:v6];
  }
  return result;
}

uint64_t __97__BWCameraStreamingMonitor__informSystemStatusWithIsStreaming_clientAuditToken_mediaEnvironment___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  return [a2 setCameraCaptureAttributions:v3];
}

void __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_2;
  v4[3] = &unk_1E5C24458;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_2(uint64_t a1)
{
  return -[BWCameraStreamingMonitor _handleClientDeath:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_4;
  v4[3] = &unk_1E5C24458;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __165__BWCameraStreamingMonitor__updateCameraStreamingMonitorInfoWithStreaming_cameraAccessGranted_clientAuditToken_tccIdentity_updateStreamingStatus_updateAccessStatus___block_invoke_4(uint64_t a1)
{
  return -[BWCameraStreamingMonitor _handleClientDeath:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

@end