@interface FigCaptureClientApplicationStateMonitorClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasBackgroundCameraAccess;
- (BOOL)isForThirdPartyTorch;
- (BOOL)isSecureCaptureExtension;
- (BOOL)isSwiftPlaygroundsDevelopmentApp;
- (BOOL)isXPCService;
- (FigCaptureClientApplicationStateMonitorClient)initWithAuditToken:(id *)a3 mediaEnvironment:(id)a4 forThirdPartyTorch:(BOOL)a5 applicationAndLayoutStateHandler:(id)a6;
- (FigCaptureProcessHandle)processHandle;
- (NSArray)avconferenceClientApplicationIDs;
- (NSString)applicationID;
- (NSString)applicationIDToInheritAppStateFrom;
- (NSString)mediaEnvironment;
- (NSString)mediaEnvironmentBundleID;
- (NSString)xpcServiceRootHostApplicationID;
- (OS_tcc_identity)mediaEnvironmentTCCIdentity;
- (id)applicationAndLayoutStateHandler;
- (id)debugDescription;
- (id)description;
- (int)clientType;
- (int)pid;
- (int)pidToInheritAppStateFrom;
- (int)xpcServiceRootHostPID;
- (void)_setUpClientInfoWithAuditToken:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)setApplicationIDToInheritAppStateFrom:(id)a3;
- (void)setMediaEnvironmentBundleID:(id)a3;
- (void)setMediaEnvironmentTCCIdentity:(id)a3;
- (void)setPidToInheritAppStateFrom:(int)a3;
@end

@implementation FigCaptureClientApplicationStateMonitorClient

- (NSString)applicationID
{
  return self->_applicationID;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)mediaEnvironment
{
  return self->_mediaEnvironment;
}

- (BOOL)isSwiftPlaygroundsDevelopmentApp
{
  return self->_isSwiftPlaygroundsDevelopmentApp;
}

- (NSString)applicationIDToInheritAppStateFrom
{
  return self->_applicationIDToInheritAppStateFrom;
}

- (NSArray)avconferenceClientApplicationIDs
{
  return self->_avconferenceClientApplicationIDs;
}

- (id)applicationAndLayoutStateHandler
{
  return self->_applicationAndLayoutStateHandler;
}

- (FigCaptureClientApplicationStateMonitorClient)initWithAuditToken:(id *)a3 mediaEnvironment:(id)a4 forThirdPartyTorch:(BOOL)a5 applicationAndLayoutStateHandler:(id)a6
{
  if (!a6)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"An application and layout state handler is required to create this object." userInfo:0]);
  }
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureClientApplicationStateMonitorClient;
  v10 = [(FigCaptureClientApplicationStateMonitorClient *)&v15 init];
  v11 = v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a3->var0[4];
    v14[0] = *(_OWORD *)a3->var0;
    v14[1] = v12;
    -[FigCaptureClientApplicationStateMonitorClient _setUpClientInfoWithAuditToken:]((uint64_t)v10, v14);
    v11->_mediaEnvironment = (NSString *)[a4 copy];
    v11->_isForThirdPartyTorch = a5;
    v11->_applicationAndLayoutStateHandler = (id)[a6 copy];
  }
  return v11;
}

- (BOOL)isForThirdPartyTorch
{
  return self->_isForThirdPartyTorch;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (id)debugDescription
{
  long long v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"pid: %d, ID: %@", self->_pid, self->_applicationID];
  v4 = v3;
  if (self->_mediaEnvironment)
  {
    [v3 appendFormat:@", mediaEnvironment: %@", self->_mediaEnvironment];
    if (self->_mediaEnvironmentBundleID) {
      [v4 appendFormat:@" (%@)", self->_mediaEnvironmentBundleID];
    }
  }
  if (self->_isXPCService) {
    [v4 appendFormat:@", host: %@[%d]", self->_xpcServiceRootHostApplicationID, self->_xpcServiceRootHostPID];
  }
  int v5 = self->_clientType - 1;
  if (v5 > 7) {
    v6 = @"--- Undefined client type ---";
  }
  else {
    v6 = *(&off_1E5C26D60 + v5);
  }
  [v4 appendFormat:@", clientType: %@", v6];
  v7 = NSString;
  return (id)[v7 stringWithString:v4];
}

- (void)_setUpClientInfoWithAuditToken:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (_setUpClientInfoWithAuditToken__onceToken != -1) {
      dispatch_once(&_setUpClientInfoWithAuditToken__onceToken, &__block_literal_global_43);
    }
    long long v4 = a2[1];
    *(_OWORD *)token.val = *a2;
    *(_OWORD *)&token.val[4] = v4;
    *(void *)(a1 + 8) = +[FigCaptureProcessHandle handleForAuditToken:&token error:0];
    long long v5 = a2[1];
    *(_OWORD *)(a1 + 16) = *a2;
    *(_OWORD *)(a1 + 32) = v5;
    long long v6 = a2[1];
    *(_OWORD *)token.val = *a2;
    *(_OWORD *)&token.val[4] = v6;
    int PIDFromAuditToken = FigCaptureGetPIDFromAuditToken(&token);
    v8 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
    *(_DWORD *)(a1 + 48) = PIDFromAuditToken;
    CFAllocatorRef v9 = *v8;
    long long v10 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)token.val = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&token.val[4] = v10;
    SecTaskRef v11 = SecTaskCreateWithAuditToken(v9, &token);
    if (!v11)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return;
    }
    long long v12 = v11;
    uint64_t v27 = 0;
    v13 = objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)), &v27);
    uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "bundle"), "identifier"), "copy");
    *(void *)(a1 + 56) = v14;
    if (!v14) {
      *(void *)(a1 + 56) = SecTaskCopySigningIdentifier(v12, 0);
    }
    *(unsigned char *)(a1 + 93) = FigCaptureClientIsSwiftPlaygroundsDevelopmentAppWithSecTask(v12) != 0;
    long long v15 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)token.val = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&token.val[4] = v15;
    if (FigCaptureClientIsAllowedToRunInBackground(&token)
      && [(id)_setUpClientInfoWithAuditToken__sApplicationIDsEligibleForBackgroundCameraAccess containsObject:*(void *)(a1 + 56)])
    {
      *(unsigned char *)(a1 + 95) = 1;
    }
    if (([v13 isApplication] & 1) != 0
      || [*(id *)(a1 + 56) isEqualToString:0x1EFA55C40])
    {
      int v16 = 1;
    }
    else if ([(id)_setUpClientInfoWithAuditToken__sLaunchAngelApplicationIDsEligibleForCameraUsage containsObject:*(void *)(a1 + 56)])
    {
      int v16 = 2;
    }
    else if ([v13 isXPCService])
    {
      *(unsigned char *)(a1 + 96) = 1;
      *(unsigned char *)(a1 + 94) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "bundle"), "extensionPointIdentifier"), "isEqualToString:", 0x1EFA55D60);
      v17 = v13;
      do
      {
        v18 = (void *)[v17 hostProcess];
        v17 = (void *)[v17 hostProcess];
      }
      while ([v17 hostProcess]);
      *(_DWORD *)(a1 + 100) = [v18 pid];
      *(void *)(a1 + 104) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "bundle"), "identifier"), "copy");
      if (FigCaptureClientHasPrivateCaptureEntitlement(v12)
        || ([(id)_setUpClientInfoWithAuditToken__sExtensionApplicationIDsEligibleForCameraUsage containsObject:*(void *)(a1 + 56)] & 1) != 0|| (objc_msgSend((id)_setUpClientInfoWithAuditToken__sExtensionPointIDsEligibleForCameraUsage, "containsObject:", objc_msgSend((id)objc_msgSend(v13, "bundle"), "extensionPointIdentifier")) & 1) != 0|| objc_msgSend((id)_setUpClientInfoWithAuditToken__sHostApplicationIDsEligibleForCameraUsageInExtension, "containsObject:", *(void *)(a1 + 104)))
      {
        int v16 = 3;
      }
      else
      {
        int v16 = 4;
      }
    }
    else
    {
      if (!FigCaptureClientIsRunningInXCTestWithSecTask(v12))
      {
        if (FigCaptureClientIsNonStandardWithSecTask(v12)
          || FigCaptureClientHasPrivateCaptureEntitlement(v12))
        {
          char v19 = 0;
        }
        else
        {
          char v19 = [*(id *)(a1 + 56) isEqualToString:0x1EFA45300] ^ 1;
        }
        int v20 = [(id)_setUpClientInfoWithAuditToken__sNonstandardClientCodeSigningIDsEligibleForCameraUsage containsObject:*(void *)(a1 + 56)];
        if ((v19 & 1) != 0 || !v20)
        {
          *(_DWORD *)(a1 + 88) = 7;
          if (FigGetCFPreferenceBooleanWithDefault() && FigDebugIsInternalBuild())
          {
            unsigned int v29 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v22 = v29;
            if (os_log_type_enabled(v21, type)) {
              unsigned int v23 = v22;
            }
            else {
              unsigned int v23 = v22 & 0xFFFFFFFE;
            }
            if (v23)
            {
              uint64_t v24 = *(void *)(a1 + 56);
              int v25 = *(_DWORD *)(a1 + 48);
              int v30 = 136315650;
              v31 = "-[FigCaptureClientApplicationStateMonitorClient _setUpClientInfoWithAuditToken:]";
              __int16 v32 = 2112;
              uint64_t v33 = v24;
              __int16 v34 = 1024;
              int v35 = v25;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        else
        {
          *(_DWORD *)(a1 + 88) = 6;
          if (([*(id *)(a1 + 56) isEqualToString:0x1EFA55840] & 1) != 0
            || [*(id *)(a1 + 56) isEqualToString:0x1EFA45300])
          {

            *(void *)(a1 + 56) = [@"com.apple.facetime" copy];
            *(_DWORD *)(a1 + 88) = 5;
            v36[0] = 0x1EFA55AE0;
            v36[1] = 0x1EFA55940;
            v36[2] = @"com.apple.VideoConference.AVConferenceTestRunneriOS";
            v36[3] = @"com.apple.AVConferenceTestRunnertvOS";
            *(void *)(a1 + 128) = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
          }
        }
        goto LABEL_14;
      }
      int v16 = 8;
    }
    *(_DWORD *)(a1 + 88) = v16;
LABEL_14:
    CFRelease(v12);
  }
}

- (int)clientType
{
  return self->_clientType;
}

- (BOOL)hasBackgroundCameraAccess
{
  return self->_hasBackgroundCameraAccess;
}

- (void)invalidate
{
  self->_applicationAndLayoutStateHandler = 0;
}

- (void)dealloc
{
  [(FigCaptureClientApplicationStateMonitorClient *)self invalidate];

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureClientApplicationStateMonitorClient;
  [(FigCaptureClientApplicationStateMonitorClient *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureClientApplicationStateMonitorClient debugDescription](self, "debugDescription")];
}

uint64_t __80__FigCaptureClientApplicationStateMonitorClient__setUpClientInfoWithAuditToken___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", 0x1EFA55A20, 0x1EFA55920, 0x1EFA55A80, 0x1EFA55C00, 0x1EFA55C80, 0);
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", 0x1EFA55B20, 0);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", @"com.apple.AppleAccountUI.AAUIFollowUpExtension", @"com.apple.AssetViewer.ASVAssetViewer", @"com.apple.ist.colosseum.action.extension", @"com.apple.ist.concierge-development.extension-queue", @"com.apple.ist.concierge.extension.queue", @"com.apple.ist.easypay-uat.extension", @"com.apple.ist.easypay.extension", @"com.apple.ist.wtb-uat.extension", @"com.apple.ist.wtb.extension", @"com.apple.ist.runner5.submissionextension", @"com.apple.ist.catalog.extension", @"com.apple.ist.scanner.extension", @"com.apple.ist.mysteryshop.extension", @"com.apple.ist.sprinter.extension", @"com.apple.MLKit.MLModelPreview", @"com.apple.MLKit.MLPackagePreview", @"com.apple.NewDeviceOutreach.Extension",
         @"com.apple.quicklook.extension.previewUI",
         @"com.apple.sidecar.extension.camera",
         @"com.apple.tula.extension",
         0x1EFA55960,
         @"com.apple.WebKit.WebContent",
         @"com.apple.WebKit.WebContent.Development",
         @"com.apple.WebKit.GPU",
         @"com.apple.WebKit.GPU.Development",
         0);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", @"com.apple.ar.viewer", @"com.apple.contact-view", @"com.apple.diagnostics-restricted-ui-service", @"com.apple.gamecenter-services", @"com.apple.message-payload-provider", @"com.apple.message-payload-provider.highmemory", @"com.apple.people-picker", 0x1EFA55D60, @"com.apple.web-browser-engine.gpu", @"com.apple.web-browser-engine.rendering", 0);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", 0x1EFA55A40, 0x1EFA55800, 0x1EFA55820, 0x1EFA55840, 0x1EFA55860, @"com.apple.biometrickitd", @"com.apple.CheckerBoard", @"com.apple.companionfindlocallyd", 0x1EFA558C0, @"com.apple.FactoryOTAd", @"com.apple.facemetricsd", 0x1EFA45300, @"com.apple.monkeybars", @"com.apple.NanoLeash", @"com.apple.nearbyd", 0x1EFA55A80, @"com.apple.pearloid",
         0x1EFA55B60,
         @"com.apple.TVSystemUIService",
         0x1EFA55C80,
         0);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", 0x1EFA55A20, 0x1EFA55920, @"com.apple.ShortcutsUI", 0);
  _setUpClientInfoWithAuditToken__sApplicationIDsEligibleForBackgroundCameraAccess = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v0];
  _setUpClientInfoWithAuditToken__sHostApplicationIDsEligibleForCameraUsageInExtension = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v1];
  _setUpClientInfoWithAuditToken__sExtensionApplicationIDsEligibleForCameraUsage = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v2];
  _setUpClientInfoWithAuditToken__sExtensionPointIDsEligibleForCameraUsage = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v3];
  _setUpClientInfoWithAuditToken__sNonstandardClientCodeSigningIDsEligibleForCameraUsage = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
  _setUpClientInfoWithAuditToken__sLaunchAngelApplicationIDsEligibleForCameraUsage = result;
  return result;
}

- (FigCaptureProcessHandle)processHandle
{
  return self->_processHandle;
}

- (NSString)mediaEnvironmentBundleID
{
  return self->_mediaEnvironmentBundleID;
}

- (void)setMediaEnvironmentBundleID:(id)a3
{
}

- (OS_tcc_identity)mediaEnvironmentTCCIdentity
{
  return self->_mediaEnvironmentTCCIdentity;
}

- (void)setMediaEnvironmentTCCIdentity:(id)a3
{
}

- (BOOL)isSecureCaptureExtension
{
  return self->_isSecureCaptureExtension;
}

- (BOOL)isXPCService
{
  return self->_isXPCService;
}

- (int)xpcServiceRootHostPID
{
  return self->_xpcServiceRootHostPID;
}

- (NSString)xpcServiceRootHostApplicationID
{
  return self->_xpcServiceRootHostApplicationID;
}

- (int)pidToInheritAppStateFrom
{
  return self->_pidToInheritAppStateFrom;
}

- (void)setPidToInheritAppStateFrom:(int)a3
{
  self->_pidToInheritAppStateFrom = a3;
}

- (void)setApplicationIDToInheritAppStateFrom:(id)a3
{
}

@end