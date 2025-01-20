@interface SFUserMediaPermissionController
@end

@implementation SFUserMediaPermissionController

void __54___SFUserMediaPermissionController_savePendingChanges__block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXUserMediaCapture();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_cold_1(v2);
  }
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __85___SFUserMediaPermissionController_coalescedAsynchronousWriter_didFinishWritingData___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4F28C40], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

uint64_t __125___SFUserMediaPermissionController_requestUserMediaAuthorizationForDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didRetrieveUserMediaPermission:a2 forDevices:*(void *)(a1 + 72) url:*(void *)(a1 + 40) mainFrameURL:*(void *)(a1 + 48) decisionHandler:*(void *)(a1 + 64) dialogPresenter:*(void *)(a1 + 56)];
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_3(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "safari_userVisibleString");
  v3 = objc_msgSend(v2, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

  if (objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL"))
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleHostOrExtensionDisplayName");

    v3 = (void *)v4;
  }
  uint64_t v5 = [*(id *)(a1 + 48) permissionDialogThrottler];
  if (v5)
  {
    v6 = (void *)v5;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_4;
    v20[3] = &unk_1E5C741F8;
    __int16 v24 = *(_WORD *)(a1 + 96);
    v7 = *(void **)(a1 + 64);
    v20[4] = *(void *)(a1 + 56);
    id v21 = v7;
    id v22 = *(id *)(a1 + 72);
    id v23 = *(id *)(a1 + 80);
    v8 = (void *)MEMORY[0x1AD0C36A0](v20);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_5;
    v13[3] = &unk_1E5C74220;
    id v18 = v8;
    id v14 = *(id *)(a1 + 48);
    id v15 = v3;
    uint64_t v19 = *(void *)(a1 + 88);
    uint64_t v9 = *(void *)(a1 + 56);
    id v16 = v6;
    uint64_t v17 = v9;
    id v10 = v6;
    id v11 = v3;
    id v12 = v8;
    [v10 requestPermissionDialogPresentation:v13];
  }
  else
  {
    __break(0xC471u);
  }
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v3 = 2;
  if (a2) {
    uint64_t v3 = 4;
  }
  uint64_t v4 = 16;
  if (a2) {
    uint64_t v4 = 32;
  }
  if (!*(unsigned char *)(a1 + 64)) {
    uint64_t v3 = 0;
  }
  if (*(unsigned char *)(a1 + 65)) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 32) setPermission:v5 | v3 expirationPolicy:0 forOrigin:*(void *)(a1 + 40) topLevelOrigin:*(void *)(a1 + 48)];
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v6();
}

void __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_5(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F78270];
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_6;
    id v12 = &unk_1E5C737D0;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 64);
    v7 = [v3 userMediaPermissionDialogWithHost:v5 permissions:v6 completionHandler:&v9];
    objc_msgSend(v4, "presentDialog:sender:", v7, *(void *)(a1 + 56), v9, v10, v11, v12);
  }
  else
  {
    v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v8();
  }
}

uint64_t __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) didCompletePermissionDialog:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to save permissions before app suspend", v1, 2u);
}

@end