@interface HMDUIDialogPresenter
+ (id)sharedUIDialogPresenter;
- (BOOL)_addCurrentNotification:(__CFUserNotification *)a3 withContext:(id)a4;
- (BOOL)_addToPendingContext:(id)a3;
- (BOOL)_isPendingContext:(id)a3;
- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 targetResponse:(unint64_t)a5 textField:(id *)a6 withContext:(id)a7;
- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 targetResponse:(unint64_t)a5 textField:(id *)a6 withContext:(id)a7 selectedByPeerDevice:(BOOL *)a8 timeout:(double)a9;
- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 textField:(id *)a5 withContext:(id)a6;
- (BOOL)_removeCurrentNotification:(__CFUserNotification *)a3 currentSelection:(BOOL)a4 selectedByPeerDevice:(BOOL *)a5 andContext:(id)a6;
- (BOOL)peerDeviceAcceptedSelection;
- (BOOL)selectedByPeerDevice;
- (BOOL)shouldSkipAuthPromptDialog;
- (HMDUIDialogPresenter)init;
- (NSMutableArray)pendingContexts;
- (OS_dispatch_queue)workQueue;
- (__CFUserNotification)currentNotification;
- (id)currentContext;
- (void)_displayInternalTTRErrorWithContext:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (void)_displayKeychainSyncForHome:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_displayUpgradeNeededWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_displayiCloudSwitchWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_requestUserPermissionForDeletionOfHomeWithName:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_requestUserPermissionForLegacyWACAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_requestUserPermissionForRemovalOfRouter:(id)a3 accessoriesRequiringManualReconfiguration:(id)a4 withContext:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (void)_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_requestUserPermissionForUnauthenticatedAliroLockWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_requestUserPermissionWithAccessoryPPIDInfo:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)_showUserDialogForIncompatibleAccessory:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)confirmReportAccessory:(id)a3 context:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)dismissPendingDialogDueToPeerDeviceSelection:(BOOL)a3 context:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)dismissPendingDialogWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)displayExecutionErrorOfTrigger:(id)a3 partialSuccess:(BOOL)a4 context:(id)a5 completionQueue:(id)a6 completionHandler:(id)a7;
- (void)displayInternalTTRErrorWithContext:(id)a3 message:(id)a4 waitForResponse:(BOOL)a5 completionHandler:(id)a6;
- (void)displayKeychainSyncForHome:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)displayRestrictedBluetoothCharacteristicsWarningWithDeviceName:(id)a3 completionHandler:(id)a4;
- (void)displayUpgradeNeededWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)displayiCloudSwitchWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)requestUserPermissionForDeletionOfHomeWithName:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)requestUserPermissionForLegacyWACAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)requestUserPermissionForRemovalOfRouter:(id)a3 accessoriesRequiringManualReconfiguration:(id)a4 withContext:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (void)requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)requestUserPermissionForUnauthenticatedAliroLockWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)requestUserPermissionWithAccessoryPPIDInfo:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentNotification:(__CFUserNotification *)a3;
- (void)setPeerDeviceAcceptedSelection:(BOOL)a3;
- (void)setPendingContexts:(id)a3;
- (void)setSelectedByPeerDevice:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)showUserDialogForIncompatibleAccessory:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8;
@end

@implementation HMDUIDialogPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingContexts, 0);
  objc_storeStrong(&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setPeerDeviceAcceptedSelection:(BOOL)a3
{
  self->_peerDeviceAcceptedSelection = a3;
}

- (BOOL)peerDeviceAcceptedSelection
{
  return self->_peerDeviceAcceptedSelection;
}

- (void)setSelectedByPeerDevice:(BOOL)a3
{
  self->_selectedByPeerDevice = a3;
}

- (BOOL)selectedByPeerDevice
{
  return self->_selectedByPeerDevice;
}

- (void)setPendingContexts:(id)a3
{
}

- (NSMutableArray)pendingContexts
{
  return self->_pendingContexts;
}

- (void)setCurrentContext:(id)a3
{
}

- (id)currentContext
{
  return self->_currentContext;
}

- (__CFUserNotification)currentNotification
{
  return self->_currentNotification;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 targetResponse:(unint64_t)a5 textField:(id *)a6 withContext:(id)a7
{
  return [(HMDUIDialogPresenter *)self _presentDialogWithInfo:a3 options:a4 targetResponse:a5 textField:a6 withContext:a7 selectedByPeerDevice:0 timeout:0.0];
}

- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 textField:(id *)a5 withContext:(id)a6
{
  return [(HMDUIDialogPresenter *)self _presentDialogWithInfo:a3 options:a4 targetResponse:0 textField:a5 withContext:a6 selectedByPeerDevice:0 timeout:0.0];
}

- (BOOL)_presentDialogWithInfo:(id)a3 options:(unint64_t)a4 targetResponse:(unint64_t)a5 textField:(id *)a6 withContext:(id)a7 selectedByPeerDevice:(BOOL *)a8 timeout:(double)a9
{
  id v16 = a7;
  SInt32 error = -1;
  v17 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a9, a4, &error, (CFDictionaryRef)a3);
  if (error
    || ![(HMDUIDialogPresenter *)self _addCurrentNotification:v17 withContext:v16]|| (CFOptionFlags v21 = 0, CFUserNotificationReceiveResponse(v17, 0.0, &v21))|| (v21 & 3) != a5)
  {
    uint64_t v18 = 0;
  }
  else
  {
    if (a6)
    {
      CFUserNotificationGetResponseValue(v17, (CFStringRef)*MEMORY[0x263F00030], 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v18 = 1;
  }
  BOOL v19 = [(HMDUIDialogPresenter *)self _removeCurrentNotification:v17 currentSelection:v18 selectedByPeerDevice:a8 andContext:v16];
  if (v17) {
    CFRelease(v17);
  }

  return v19;
}

- (void)displayRestrictedBluetoothCharacteristicsWarningWithDeviceName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDUIDialogPresenter *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__HMDUIDialogPresenter_displayRestrictedBluetoothCharacteristicsWarningWithDeviceName_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __105__HMDUIDialogPresenter_displayRestrictedBluetoothCharacteristicsWarningWithDeviceName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = HMDLocalizedStringForKey(@"RESTRICTED_BT_CHARS_ACCESS_TITLE");
  v3 = NSString;
  v4 = HMDLocalizedStringForKey(@"RESTRICTED_BT_CHARS_ACCESS_MESSAGE");
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = 0;
  v5 = [v3 localizedStringWithValidatedFormat:v4, @"%@", &v16, v15 validFormatSpecifiers error];
  id v6 = v16;

  id v7 = v5;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = @"RESTRICTED_BT_CHARS_ACCESS_MESSAGE";
      __int16 v23 = 2112;
      v24 = @"%@";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    id v7 = @"RESTRICTED_BT_CHARS_ACCESS_MESSAGE";
  }
  v11 = v7;

  id v12 = HMDLocalizedStringForKey(@"OK");
  uint64_t v13 = *MEMORY[0x263EFFFD8];
  v17[0] = *MEMORY[0x263EFFFC8];
  v17[1] = v13;
  v18[0] = v2;
  v18[1] = v11;
  v17[2] = *MEMORY[0x263F00000];
  v18[2] = v12;
  id v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  [*(id *)(a1 + 40) _presentDialogWithInfo:v14 options:0 textField:0 withContext:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)shouldSkipAuthPromptDialog
{
  return skipAuthPromptDialog;
}

- (void)displayExecutionErrorOfTrigger:(id)a3 partialSuccess:(BOOL)a4 context:(id)a5 completionQueue:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(HMDUIDialogPresenter *)self workQueue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke;
  v21[3] = &unk_264A20318;
  v21[4] = self;
  id v22 = v13;
  id v24 = v12;
  id v25 = v15;
  BOOL v26 = a4;
  id v23 = v14;
  id v17 = v12;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(v16, v21);
}

void __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) _addToPendingContext:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      v2 = HMDLocalizedStringForKey(@"TRIGGER_EXECUTION_ERROR_TITLE_PARTIAL_SUCCESS");
      v3 = NSString;
      v4 = HMDLocalizedStringForKey(@"TRIGGER_EXECUTION_ERROR_BODY_PARTIAL_SUCCESS");
      id v31 = 0;
      v5 = [v3 localizedStringWithValidatedFormat:v4, @"%@", &v31, *(void *)(a1 + 56) validFormatSpecifiers error];
      id v6 = v31;

      if (!v5)
      {
        id v7 = (void *)MEMORY[0x230FBD990]();
        v8 = HMFGetOSLogHandle();
        v5 = @"TRIGGER_EXECUTION_ERROR_BODY_PARTIAL_SUCCESS";
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v38 = v9;
          __int16 v39 = 2112;
          v40 = @"TRIGGER_EXECUTION_ERROR_BODY_PARTIAL_SUCCESS";
          __int16 v41 = 2112;
          v42 = @"%@";
          __int16 v43 = 2112;
          id v44 = v6;
LABEL_13:
          _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      v2 = HMDLocalizedStringForKey(@"TRIGGER_EXECUTION_ERROR_TITLE");
      id v12 = NSString;
      id v13 = HMDLocalizedStringForKey(@"TRIGGER_EXECUTION_ERROR_BODY");
      id v30 = 0;
      v5 = [v12 localizedStringWithValidatedFormat:v13, @"%@", &v30, *(void *)(a1 + 56) validFormatSpecifiers error];
      id v6 = v30;

      if (!v5)
      {
        id v7 = (void *)MEMORY[0x230FBD990]();
        v8 = HMFGetOSLogHandle();
        v5 = @"TRIGGER_EXECUTION_ERROR_BODY";
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v38 = v9;
          __int16 v39 = 2112;
          v40 = @"TRIGGER_EXECUTION_ERROR_BODY";
          __int16 v41 = 2112;
          v42 = @"%@";
          __int16 v43 = 2112;
          id v44 = v6;
          goto LABEL_13;
        }
LABEL_14:

        id v14 = 0;
        goto LABEL_15;
      }
    }
    id v14 = v5;
LABEL_15:
    id v15 = v5;

    id v16 = HMDLocalizedStringForKey(@"CLOSE");
    id v17 = HMDLocalizedStringForKey(@"OPEN_HOME_APP");
    uint64_t v18 = *MEMORY[0x263EFFFD8];
    v35[0] = *MEMORY[0x263EFFFC8];
    v35[1] = v18;
    v36[0] = v2;
    v36[1] = v15;
    uint64_t v19 = *MEMORY[0x263EFFFE8];
    v35[2] = *MEMORY[0x263F00000];
    v35[3] = v19;
    v36[2] = v17;
    v36[3] = v16;
    uint64_t v20 = *MEMORY[0x263F79628];
    v35[4] = *MEMORY[0x263EFFFE0];
    v35[5] = v20;
    v36[4] = MEMORY[0x263EFFA88];
    v36[5] = MEMORY[0x263EFFA88];
    __int16 v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];
    char v22 = [*(id *)(a1 + 32) _presentDialogWithInfo:v21 options:0 textField:0 withContext:*(void *)(a1 + 40)];
    id v23 = *(NSObject **)(a1 + 48);
    if (v23)
    {
      id v24 = *(void **)(a1 + 64);
      if (v24)
      {
        char v25 = v22;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_166;
        v26[3] = &unk_264A24FC8;
        id v28 = v24;
        char v29 = v25;
        id v27 = *(id *)(a1 + 40);
        dispatch_async(v23, v26);
      }
    }

    goto LABEL_19;
  }
  id v10 = *(NSObject **)(a1 + 48);
  if (v10)
  {
    v11 = *(void **)(a1 + 64);
    if (v11)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_2;
      block[3] = &unk_264A2F870;
      id v34 = v11;
      id v33 = *(id *)(a1 + 40);
      dispatch_async(v10, block);

      v2 = v34;
LABEL_19:
    }
  }
}

uint64_t __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __112__HMDUIDialogPresenter_displayExecutionErrorOfTrigger_partialSuccess_context_completionQueue_completionHandler___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)confirmReportAccessory:(id)a3 context:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v11])
  {
    id v14 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    id v15 = (id *)v19;
    v19[0] = v10;
    v19[1] = self;
    id v20 = v11;
    __int16 v21 = v12;
    id v22 = v13;
    dispatch_async(v14, block);

LABEL_6:
    goto LABEL_7;
  }
  if (v12 && v13)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_2;
    v16[3] = &unk_264A2DFA0;
    id v15 = &v17;
    id v17 = v13;
    dispatch_async(v12, v16);
    goto LABEL_6;
  }
LABEL_7:
}

void __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = NSString;
  v3 = HMDLocalizedStringForKey(@"REPORT_ACCESSORY_TITLE");
  id v24 = 0;
  v4 = [v2 localizedStringWithValidatedFormat:v3, @"%@", &v24, *(void *)(a1 + 32) validFormatSpecifiers error];
  id v5 = v24;

  id v6 = v4;
  if (!v4)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = @"REPORT_ACCESSORY_TITLE";
      __int16 v31 = 2112;
      v32 = @"%@";
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    id v6 = @"REPORT_ACCESSORY_TITLE";
  }
  id v10 = v6;

  id v11 = HMDLocalizedStringForKey(@"REPORT_ACCESSORY_DESCRIPTION");
  id v12 = HMDLocalizedStringForKey(@"NOT_NOW");
  id v13 = HMDLocalizedStringForKey(@"REPORT_PROBLEM");
  uint64_t v14 = *MEMORY[0x263EFFFD8];
  v25[0] = *MEMORY[0x263EFFFC8];
  v25[1] = v14;
  v26[0] = v10;
  v26[1] = v11;
  uint64_t v15 = *MEMORY[0x263EFFFE8];
  v25[2] = *MEMORY[0x263F00020];
  v25[3] = v15;
  v26[2] = v12;
  v26[3] = v13;
  id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  char v17 = [*(id *)(a1 + 40) _presentDialogWithInfo:v16 options:35 targetResponse:1 textField:0 withContext:*(void *)(a1 + 48)];
  uint64_t v18 = *(NSObject **)(a1 + 56);
  if (v18)
  {
    uint64_t v19 = *(void **)(a1 + 64);
    if (v19)
    {
      char v20 = v17;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_147;
      block[3] = &unk_264A1B858;
      id v22 = v19;
      char v23 = v20;
      dispatch_async(v18, block);
    }
  }
}

uint64_t __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__HMDUIDialogPresenter_confirmReportAccessory_context_completionQueue_completionHandler___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_displayInternalTTRErrorWithContext:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  v18[4] = *MEMORY[0x263EF8340];
  v8 = (void (**)(id, BOOL))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = HMDLocalizedStringForKey(@"REPORT_PROBLEM");
  id v12 = HMDLocalizedStringForKey(@"NOT_NOW");
  uint64_t v13 = *MEMORY[0x263EFFFD8];
  v17[0] = *MEMORY[0x263EFFFC8];
  v17[1] = v13;
  v18[0] = v11;
  v18[1] = v9;
  uint64_t v14 = *MEMORY[0x263F00000];
  v17[2] = *MEMORY[0x263F00020];
  void v17[3] = v14;
  v18[2] = v12;
  void v18[3] = @"Tap-to-Radar";
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  BOOL v16 = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v15 options:0 textField:0 withContext:v10];
  v8[2](v8, v16);
}

- (void)displayInternalTTRErrorWithContext:(id)a3 message:(id)a4 waitForResponse:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (isInternalBuild()
    && [(HMDUIDialogPresenter *)self _addToPendingContext:v10])
  {
    uint64_t v13 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke;
    block[3] = &unk_264A2EE30;
    void block[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    dispatch_async(v13, block);

    uint64_t v14 = v20;
  }
  else
  {
    uint64_t v15 = [(HMDUIDialogPresenter *)self workQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke_2;
    void v17[3] = &unk_264A2DFA0;
    id v18 = v12;
    dispatch_async(v15, v17);

    uint64_t v14 = v18;
  }

  if (v7)
  {
    BOOL v16 = [(HMDUIDialogPresenter *)self workQueue];
    dispatch_sync(v16, &__block_literal_global_131);
  }
}

uint64_t __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayInternalTTRErrorWithContext:*(void *)(a1 + 40) message:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __101__HMDUIDialogPresenter_displayInternalTTRErrorWithContext_message_waitForResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_displayUpgradeNeededWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  v20[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = HMDLocalizedStringForKey(@"OS_UPGRADE_NEEDED_TITLE");
  id v12 = HMDLocalizedStringForKey(@"OS_UPGRADE_NEEDED_INFO");
  uint64_t v13 = HMDLocalizedStringForKey(@"OK");
  uint64_t v14 = *MEMORY[0x263EFFFD8];
  v19[0] = *MEMORY[0x263EFFFC8];
  v19[1] = v14;
  v20[0] = v11;
  v20[1] = v12;
  void v19[2] = *MEMORY[0x263F00000];
  v20[2] = v13;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v15 options:0 textField:0 withContext:v10];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__HMDUIDialogPresenter__displayUpgradeNeededWithContext_queue_completionHandler___block_invoke;
  void v17[3] = &unk_264A2DFA0;
  id v18 = v8;
  id v16 = v8;
  dispatch_async(v9, v17);
}

uint64_t __81__HMDUIDialogPresenter__displayUpgradeNeededWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayUpgradeNeededWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v8])
  {
    id v11 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2EE30;
    void block[4] = self;
    id v18 = v8;
    uint64_t v19 = v9;
    id v20 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    uint64_t v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke_2;
    v15[3] = &unk_264A2DFA0;
    id v16 = v10;
    id v14 = v10;
    dispatch_async(v9, v15);
    uint64_t v13 = v16;
  }
}

uint64_t __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayUpgradeNeededWithContext:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __80__HMDUIDialogPresenter_displayUpgradeNeededWithContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_displayiCloudSwitchWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  v23[4] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = HMDLocalizedStringForKey(@"ENABLE_ICLOUD_SWITCH_TITLE");
  id v12 = HMDLocalizedStringForKey(@"ICLOUD_SWITCH_INFO");
  uint64_t v13 = HMDLocalizedStringForKey(@"CANCEL");
  id v14 = HMDLocalizedStringForKey(@"USE_ICLOUD");
  uint64_t v15 = *MEMORY[0x263EFFFD8];
  v22[0] = *MEMORY[0x263EFFFC8];
  v22[1] = v15;
  v23[0] = v11;
  v23[1] = v12;
  uint64_t v16 = *MEMORY[0x263EFFFE8];
  v22[2] = *MEMORY[0x263F00000];
  v22[3] = v16;
  v23[2] = v14;
  v23[3] = v13;
  char v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  LOBYTE(self) = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v17 options:0 textField:0 withContext:v10];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDUIDialogPresenter__displayiCloudSwitchWithContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v20 = v8;
  char v21 = (char)self;
  id v18 = v8;
  dispatch_async(v9, block);
}

uint64_t __80__HMDUIDialogPresenter__displayiCloudSwitchWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)displayiCloudSwitchWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v8])
  {
    id v11 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2EE30;
    void block[4] = self;
    id v18 = v8;
    uint64_t v19 = v9;
    id v20 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    uint64_t v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke_2;
    v15[3] = &unk_264A2DFA0;
    id v16 = v10;
    id v14 = v10;
    dispatch_async(v9, v15);
    uint64_t v13 = v16;
  }
}

uint64_t __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayiCloudSwitchWithContext:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __79__HMDUIDialogPresenter_displayiCloudSwitchWithContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_displayKeychainSyncForHome:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = HMDLocalizedStringForKey(@"ENABLE_KEYCHAIN_SYNC_TITLE");
  uint64_t v15 = NSString;
  id v16 = HMDLocalizedStringForKey(@"KEYCHAIN_SYNC_INFO");
  id v36 = 0;
  v32 = v10;
  char v17 = [v15 localizedStringWithValidatedFormat:v16, @"%@", &v36, v10 validFormatSpecifiers error];
  id v18 = v36;

  uint64_t v19 = v17;
  if (!v17)
  {
    id v31 = v13;
    id v20 = (void *)MEMORY[0x230FBD990]();
    char v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v40 = v22;
      __int16 v41 = 2112;
      v42 = @"KEYCHAIN_SYNC_INFO";
      __int16 v43 = 2112;
      id v44 = @"%@";
      __int16 v45 = 2112;
      id v46 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    uint64_t v19 = @"KEYCHAIN_SYNC_INFO";
    id v13 = v31;
  }
  char v23 = v19;

  id v24 = HMDLocalizedStringForKey(@"SETTINGS");
  char v25 = HMDLocalizedStringForKey(@"OK");
  uint64_t v26 = *MEMORY[0x263EFFFD8];
  v37[0] = *MEMORY[0x263EFFFC8];
  v37[1] = v26;
  v38[0] = v14;
  v38[1] = v23;
  uint64_t v27 = *MEMORY[0x263EFFFE8];
  v37[2] = *MEMORY[0x263F00000];
  v37[3] = v27;
  v38[2] = v25;
  v38[3] = v24;
  id v28 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  BOOL v29 = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v28 options:0 textField:0 withContext:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__HMDUIDialogPresenter__displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v34 = v13;
  BOOL v35 = v29;
  id v30 = v13;
  dispatch_async(v12, block);
}

uint64_t __88__HMDUIDialogPresenter__displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0);
}

- (void)displayKeychainSyncForHome:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v11])
  {
    id v14 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    void block[4] = self;
    id v21 = v10;
    id v22 = v11;
    char v23 = v12;
    id v24 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    id v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke_2;
    void v18[3] = &unk_264A2DFA0;
    id v19 = v13;
    id v17 = v13;
    dispatch_async(v12, v18);
    id v16 = v19;
  }
}

uint64_t __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayKeychainSyncForHome:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __87__HMDUIDialogPresenter_displayKeychainSyncForHome_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestUserPermissionForLegacyWACAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = HMDLocalizedStringForKey(@"ACCESSORY_LEGACYWAC_TITLE");
  id v14 = NSString;
  id v15 = localizedWiFiStringKey();
  id v16 = HMDLocalizedStringForKey(v15);
  id v38 = 0;
  id v17 = [v14 localizedStringWithValidatedFormat:v16, @"%@", &v38, v9 validFormatSpecifiers error];
  id v18 = v38;

  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v22 = v32 = v9;
      localizedWiFiStringKey();
      char v23 = v33 = v20;
      *(_DWORD *)buf = 138544130;
      v42 = v22;
      __int16 v43 = 2112;
      id v44 = v23;
      __int16 v45 = 2112;
      id v46 = @"%@";
      __int16 v47 = 2112;
      id v48 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      id v20 = v33;
      id v9 = v32;
    }

    localizedWiFiStringKey();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v24 = v19;

  char v25 = HMDLocalizedStringForKey(@"DONT_ALLOW");
  uint64_t v26 = HMDLocalizedStringForKey(@"ALLOW");
  uint64_t v27 = *MEMORY[0x263EFFFD8];
  v39[0] = *MEMORY[0x263EFFFC8];
  v39[1] = v27;
  v40[0] = v13;
  v40[1] = v24;
  uint64_t v28 = *MEMORY[0x263F00000];
  v39[2] = *MEMORY[0x263EFFFE8];
  v39[3] = v28;
  v40[2] = v25;
  v40[3] = v26;
  BOOL v29 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  BOOL v30 = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v29 options:0 textField:0 withContext:v10];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__HMDUIDialogPresenter__requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v36 = v12;
  BOOL v37 = v30;
  id v31 = v12;
  dispatch_async(v11, block);
}

uint64_t __104__HMDUIDialogPresenter__requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0);
}

- (void)_showUserDialogForIncompatibleAccessory:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  v23[3] = *MEMORY[0x263EF8340];
  id v11 = a8;
  id v12 = a7;
  id v13 = a6;
  id v14 = HMDLocalizedStringForKey(@"ACCESSORY_INCOMPATIBLE_HEADER");
  id v15 = HMDLocalizedStringForKey(@"ACCESSORY_INCOMPATIBLE_DETAIL");
  id v16 = HMDLocalizedStringForKey(@"OK");
  uint64_t v17 = *MEMORY[0x263EFFFD8];
  v22[0] = *MEMORY[0x263EFFFC8];
  v22[1] = v17;
  v23[0] = v14;
  v23[1] = v15;
  v22[2] = *MEMORY[0x263F00000];
  v23[2] = v16;
  id v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v18 options:0 textField:0 withContext:v13];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __114__HMDUIDialogPresenter__showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke;
  v20[3] = &unk_264A2DFA0;
  id v21 = v11;
  id v19 = v11;
  dispatch_async(v12, v20);
}

uint64_t __114__HMDUIDialogPresenter__showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showUserDialogForIncompatibleAccessory:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v17])
  {
    id v20 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2C9E0;
    void block[4] = self;
    id v27 = v14;
    id v28 = v15;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    id v32 = v19;
    id v21 = v19;
    dispatch_async(v20, block);

    id v22 = v27;
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke_2;
    v24[3] = &unk_264A2DFA0;
    id v25 = v19;
    id v23 = v19;
    dispatch_async(v18, v24);
    id v22 = v25;
  }
}

uint64_t __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showUserDialogForIncompatibleAccessory:*(void *)(a1 + 40) name:*(void *)(a1 + 48) category:*(void *)(a1 + 56) withContext:*(void *)(a1 + 64) queue:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 80)];
}

uint64_t __113__HMDUIDialogPresenter_showUserDialogForIncompatibleAccessory_name_category_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  v44[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v43[0] = *MEMORY[0x263EFFFC8];
  id v14 = NSString;
  id v15 = HMDLocalizedStringForKey(@"ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_TITLE");
  id v34 = 0;
  id v30 = v10;
  id v16 = [v14 localizedStringWithValidatedFormat:v15, @"%@", &v34, v10 validFormatSpecifiers error];
  id v17 = v34;

  id v18 = v16;
  if (!v16)
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v21 = v29 = v19;
      *(_DWORD *)buf = 138544130;
      id v36 = v21;
      __int16 v37 = 2112;
      id v38 = @"ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_TITLE";
      __int16 v39 = 2112;
      v40 = @"%@";
      __int16 v41 = 2112;
      id v42 = v17;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      id v19 = v29;
    }

    id v18 = @"ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_TITLE";
  }
  id v22 = v18;

  v44[0] = v22;
  v43[1] = *MEMORY[0x263EFFFD8];
  id v23 = HMDLocalizedStringForKey(@"ACCESSORY_WITH_SPECIFIC_WIFI_CREDENTIAL_REMOVAL_CONFIRM_DETAIL");
  v44[1] = v23;
  v43[2] = *MEMORY[0x263EFFFE8];
  id v24 = HMDLocalizedStringForKey(@"CANCEL");
  v44[2] = v24;
  v43[3] = *MEMORY[0x263F00000];
  id v25 = HMDLocalizedStringForKey(@"REMOVE");
  v43[4] = *MEMORY[0x263F795F8];
  v44[3] = v25;
  v44[4] = &unk_26E4711D0;
  uint64_t v26 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];

  BOOL v27 = [(HMDUIDialogPresenter *)self _addToPendingContext:v11];
  if (v27) {
    LOBYTE(v27) = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v26 options:0 textField:0 withContext:v11];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__HMDUIDialogPresenter__requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v32 = v13;
  BOOL v33 = v27;
  id v28 = v13;
  dispatch_async(v12, block);
}

uint64_t __128__HMDUIDialogPresenter__requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0);
}

- (void)requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDUIDialogPresenter *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __127__HMDUIDialogPresenter_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __127__HMDUIDialogPresenter_requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForRemovalOfSpecificWiFiCredentialedAccessory:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)_requestUserPermissionForRemovalOfRouter:(id)a3 accessoriesRequiringManualReconfiguration:(id)a4 withContext:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  v71[5] = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = a6;
  id v51 = a7;
  id v53 = v11;
  uint64_t v13 = [v11 count];
  uint64_t v45 = *MEMORY[0x263EFFFC8];
  v70[0] = *MEMORY[0x263EFFFC8];
  id v14 = localizedWiFiStringKey();
  id v15 = HMDLocalizedStringForKey(v14);
  v71[0] = v15;
  uint64_t v16 = *MEMORY[0x263EFFFD8];
  v70[1] = *MEMORY[0x263EFFFD8];
  id v17 = localizedWiFiStringKey();
  id v18 = HMDLocalizedStringForKey(v17);
  v71[1] = v18;
  uint64_t v50 = *MEMORY[0x263EFFFE8];
  v70[2] = *MEMORY[0x263EFFFE8];
  id v19 = HMDLocalizedStringForKey(@"CANCEL");
  v71[2] = v19;
  uint64_t v49 = *MEMORY[0x263F00000];
  v70[3] = *MEMORY[0x263F00000];
  if (v13) {
    id v20 = @"CONTINUE";
  }
  else {
    id v20 = @"REMOVE";
  }
  if (v13) {
    id v21 = &unk_26E4711E8;
  }
  else {
    id v21 = &unk_26E4711D0;
  }
  id v22 = HMDLocalizedStringForKey(v20);
  uint64_t v48 = *MEMORY[0x263F795F8];
  v70[4] = *MEMORY[0x263F795F8];
  v71[3] = v22;
  v71[4] = v21;
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:5];

  id v24 = v12;
  if (![(HMDUIDialogPresenter *)self _addToPendingContext:v12])
  {
    id v25 = (void *)v23;
    BOOL v27 = 0;
    goto LABEL_17;
  }
  id v25 = (void *)v23;
  BOOL v26 = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v23 options:0 textField:0 withContext:v24];
  BOOL v27 = v26;
  if (!v26)
  {
LABEL_17:
    id v28 = v53;
    goto LABEL_20;
  }
  id v28 = v53;
  if (v13)
  {
    id v44 = v24;
    uint64_t v29 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v53];
    v68[0] = v45;
    id v30 = HMDLocalizedStringForKey(@"ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_TITLE");
    v69[0] = v30;
    v68[1] = v16;
    id v31 = NSString;
    id v32 = HMDLocalizedStringForKey(@"ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_DETAIL");
    id v59 = 0;
    BOOL v33 = [v31 localizedStringWithValidatedFormat:v32, @"%@", &v59, v29 validFormatSpecifiers error];
    id v34 = v59;

    BOOL v35 = v33;
    if (!v33)
    {
      id v36 = (void *)MEMORY[0x230FBD990]();
      __int16 v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = id v46 = v36;
        *(_DWORD *)buf = 138544130;
        v61 = v38;
        __int16 v62 = 2112;
        v63 = @"ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_DETAIL";
        __int16 v64 = 2112;
        v65 = @"%@";
        __int16 v66 = 2112;
        id v67 = v34;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        id v36 = v46;
      }

      BOOL v35 = @"ROUTER_REMOVAL_CONFIRM_MANUAL_RECONFIGURATION_DETAIL";
    }
    __int16 v47 = (void *)v29;
    __int16 v39 = v35;

    v69[1] = v39;
    v68[2] = v50;
    v40 = HMDLocalizedStringForKey(@"CANCEL");
    v69[2] = v40;
    v68[3] = v49;
    __int16 v41 = HMDLocalizedStringForKey(@"REMOVE");
    v68[4] = v48;
    v69[3] = v41;
    v69[4] = &unk_26E4711D0;
    id v42 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:5];

    id v24 = v44;
    if ([(HMDUIDialogPresenter *)self _addToPendingContext:v44]) {
      BOOL v27 = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v42 options:0 textField:0 withContext:v44];
    }
    else {
      BOOL v27 = 0;
    }
  }
LABEL_20:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __143__HMDUIDialogPresenter__requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v57 = v51;
  BOOL v58 = v27;
  id v43 = v51;
  dispatch_async(queue, block);
}

uint64_t __143__HMDUIDialogPresenter__requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0);
}

- (void)requestUserPermissionForRemovalOfRouter:(id)a3 accessoriesRequiringManualReconfiguration:(id)a4 withContext:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(HMDUIDialogPresenter *)self workQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __142__HMDUIDialogPresenter_requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke;
  v23[3] = &unk_264A2DF78;
  void v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

uint64_t __142__HMDUIDialogPresenter_requestUserPermissionForRemovalOfRouter_accessoriesRequiringManualReconfiguration_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForRemovalOfRouter:*(void *)(a1 + 40) accessoriesRequiringManualReconfiguration:*(void *)(a1 + 48) withContext:*(void *)(a1 + 56) queue:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
}

- (void)_requestUserPermissionForDeletionOfHomeWithName:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v37 = a4;
  queue = a5;
  id v10 = a6;
  id v11 = NSString;
  id v12 = HMDLocalizedStringForKey(@"HOME_DELETION_CONFIRM_TITLE");
  id v42 = 0;
  id v13 = [v11 localizedStringWithValidatedFormat:v12, @"%@", &v42, v9 validFormatSpecifiers error];
  id v14 = v42;

  id v15 = v13;
  if (!v13)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v46 = v18;
      __int16 v47 = 2112;
      uint64_t v48 = @"HOME_DELETION_CONFIRM_TITLE";
      __int16 v49 = 2112;
      uint64_t v50 = @"%@";
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    id v15 = @"HOME_DELETION_CONFIRM_TITLE";
  }
  id v19 = v15;

  id v20 = NSString;
  id v21 = HMDLocalizedStringForKey(@"HOME_DELETION_CONFIRM_BUTTON");
  id v41 = 0;
  id v22 = [v20 localizedStringWithValidatedFormat:v21, @"%@", &v41, v9 validFormatSpecifiers error];
  id v23 = v41;

  id v24 = v22;
  if (!v22)
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      id v46 = v27;
      __int16 v47 = 2112;
      uint64_t v48 = @"HOME_DELETION_CONFIRM_BUTTON";
      __int16 v49 = 2112;
      uint64_t v50 = @"%@";
      __int16 v51 = 2112;
      id v52 = v23;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);
    }
    id v24 = @"HOME_DELETION_CONFIRM_BUTTON";
  }
  id v28 = v24;

  uint64_t v29 = HMDLocalizedStringForKey(@"DONT_ALLOW");
  uint64_t v30 = *MEMORY[0x263EFFFE8];
  v43[0] = *MEMORY[0x263EFFFC8];
  v43[1] = v30;
  v44[0] = v19;
  v44[1] = v28;
  uint64_t v31 = *MEMORY[0x263F00000];
  v43[2] = *MEMORY[0x263F795E0];
  v43[3] = v31;
  v44[2] = &unk_26E4711D0;
  v44[3] = v29;
  id v32 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
  BOOL v33 = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v32 options:0 textField:0 withContext:v37];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__HMDUIDialogPresenter__requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v39 = v10;
  BOOL v40 = v33;
  id v34 = v10;
  dispatch_async(queue, block);
}

uint64_t __108__HMDUIDialogPresenter__requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)requestUserPermissionForDeletionOfHomeWithName:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v11])
  {
    id v14 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    void block[4] = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    id v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke_2;
    void v18[3] = &unk_264A2DFA0;
    id v19 = v13;
    id v17 = v13;
    dispatch_async(v12, v18);
    id v16 = v19;
  }
}

uint64_t __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForDeletionOfHomeWithName:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __107__HMDUIDialogPresenter_requestUserPermissionForDeletionOfHomeWithName_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestUserPermissionWithAccessoryPPIDInfo:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  queue = a7;
  id v18 = (__CFString *)a8;
  if ([v14 isDenylisted])
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v71 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Accessory is Blacklisted - Rejecting", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2DFA0;
    id v67 = v18;
    id v23 = v18;
    id v24 = queue;
    dispatch_async(queue, block);
    id v25 = v67;
  }
  else
  {
    BOOL v58 = self;
    HMDLocalizedStringForKey(@"ACCESSORY_CONFIRM_PPID_INFO_TITLE");
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v59 = v16;
    id v57 = v17;
    if (([v14 isCertified] & 1) == 0)
    {
      uint64_t v26 = HMDLocalizedStringForKey(@"ACCESSORY_CONFIRM_UNCERTIFIED_PPID_INFO_TITLE");

      id v23 = (__CFString *)v26;
    }
    id v27 = NSString;
    id v28 = HMDLocalizedStringForKey(@"ACCESSORY_CONFIRM_UNKNOWN_DETAIL");
    id v65 = 0;
    uint64_t v29 = [v27 localizedStringWithValidatedFormat:v28, @"%@", &v65, v15 validFormatSpecifiers error];
    id v30 = v65;

    uint64_t v31 = v29;
    if (!v29)
    {
      id v32 = (void *)MEMORY[0x230FBD990]();
      BOOL v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v34 = v56 = v15;
        *(_DWORD *)buf = 138544130;
        v71 = v34;
        __int16 v72 = 2112;
        v73 = @"ACCESSORY_CONFIRM_UNKNOWN_DETAIL";
        __int16 v74 = 2112;
        v75 = @"%@";
        __int16 v76 = 2112;
        id v77 = v30;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        id v15 = v56;
      }

      uint64_t v31 = @"ACCESSORY_CONFIRM_UNKNOWN_DETAIL";
    }
    id v25 = v31;

    uint64_t v35 = [v14 category];
    if (v35)
    {
      id v36 = (void *)v35;
      id v37 = [v14 manufacturer];

      if (v37)
      {
        id v38 = NSString;
        id v39 = HMDLocalizedStringForKey(@"ACCESSORY_CONFIRM_PPID_DETAIL");
        id v64 = 0;
        [v14 manufacturer];
        id v41 = v40 = v15;
        id v42 = [v38 localizedStringWithValidatedFormat:v39, @"%@ %@", &v64, v59, v41 validFormatSpecifiers error];
        id v43 = v64;

        id v15 = v40;
        id v44 = v42;
        if (!v42)
        {
          uint64_t v45 = (void *)MEMORY[0x230FBD990]();
          id v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            __int16 v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v71 = v47;
            __int16 v72 = 2112;
            v73 = @"ACCESSORY_CONFIRM_PPID_DETAIL";
            __int16 v74 = 2112;
            v75 = @"%@ %@";
            __int16 v76 = 2112;
            id v77 = v43;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

            id v15 = v40;
          }

          id v44 = @"ACCESSORY_CONFIRM_PPID_DETAIL";
        }
        uint64_t v48 = v44;

        id v25 = v48;
      }
    }
    __int16 v49 = HMDLocalizedStringForKey(@"DONT_ALLOW");
    uint64_t v50 = HMDLocalizedStringForKey(@"ALLOW");
    uint64_t v51 = *MEMORY[0x263EFFFD8];
    v68[0] = *MEMORY[0x263EFFFC8];
    v68[1] = v51;
    v69[0] = v23;
    v69[1] = v25;
    uint64_t v52 = *MEMORY[0x263F00000];
    v68[2] = *MEMORY[0x263EFFFE8];
    v68[3] = v52;
    v69[2] = v49;
    v69[3] = v50;
    uint64_t v53 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
    id v17 = v57;
    BOOL v54 = [(HMDUIDialogPresenter *)v58 _presentDialogWithInfo:v53 options:0 textField:0 withContext:v57];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_62;
    v61[3] = &unk_264A1B858;
    __int16 v62 = v18;
    BOOL v63 = v54;
    v55 = v18;
    id v24 = queue;
    dispatch_async(queue, v61);

    id v16 = v59;
  }
}

uint64_t __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __118__HMDUIDialogPresenter__requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0);
}

- (void)requestUserPermissionWithAccessoryPPIDInfo:(id)a3 name:(id)a4 category:(id)a5 withContext:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v17])
  {
    id v20 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2C9E0;
    void block[4] = self;
    id v27 = v14;
    id v28 = v15;
    id v29 = v16;
    id v30 = v17;
    uint64_t v31 = v18;
    id v32 = v19;
    id v21 = v19;
    dispatch_async(v20, block);

    id v22 = v27;
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_2;
    v24[3] = &unk_264A2DFA0;
    id v25 = v19;
    id v23 = v19;
    dispatch_async(v18, v24);
    id v22 = v25;
  }
}

uint64_t __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionWithAccessoryPPIDInfo:*(void *)(a1 + 40) name:*(void *)(a1 + 48) category:*(void *)(a1 + 56) withContext:*(void *)(a1 + 64) queue:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 80)];
}

uint64_t __117__HMDUIDialogPresenter_requestUserPermissionWithAccessoryPPIDInfo_name_category_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestUserPermissionForLegacyWACAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v11])
  {
    id v14 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    void block[4] = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    id v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke_2;
    void v18[3] = &unk_264A2DFA0;
    id v19 = v13;
    id v17 = v13;
    dispatch_async(v12, v18);
    id v16 = v19;
  }
}

uint64_t __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForLegacyWACAccessory:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __103__HMDUIDialogPresenter_requestUserPermissionForLegacyWACAccessory_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  void v24[4] = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = HMDLocalizedStringForKey(@"BRIDGE_ACCESSORIES_HOME_BEHAVIOR_TITLE");
  id v13 = HMDLocalizedStringForKey(@"BRIDGE_ACCESSORIES_HOME_BEHAVIOR_DETAIL");
  id v14 = HMDLocalizedStringForKey(@"OK");
  id v15 = HMDLocalizedStringForKey(@"CANCEL");
  uint64_t v16 = *MEMORY[0x263EFFFD8];
  v23[0] = *MEMORY[0x263EFFFC8];
  v23[1] = v16;
  v24[0] = v12;
  v24[1] = v13;
  uint64_t v17 = *MEMORY[0x263F00000];
  v23[2] = *MEMORY[0x263EFFFE8];
  v23[3] = v17;
  v24[2] = v14;
  v24[3] = v15;
  id v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  LOBYTE(self) = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v18 options:0 textField:0 withContext:v11];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__HMDUIDialogPresenter__requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v21 = v9;
  char v22 = (char)self;
  id v19 = v9;
  dispatch_async(v10, block);
}

uint64_t __101__HMDUIDialogPresenter__requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v11])
  {
    id v14 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    void block[4] = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    uint64_t v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_2;
    void v18[3] = &unk_264A2DFA0;
    id v19 = v13;
    id v17 = v13;
    dispatch_async(v12, v18);
    uint64_t v16 = v19;
  }
}

uint64_t __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForBridgeAccessory:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __100__HMDUIDialogPresenter_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestUserPermissionForUnauthenticatedAliroLockWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  void v24[4] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDUIDialogPresenter *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = HMDLocalizedStringForKey(@"NOAUTH_ALIRO_LOCK_TITLE");
  id v13 = HMDLocalizedStringForKey(@"NOAUTH_ALIRO_LOCK_BODY");
  id v14 = HMDLocalizedStringForKey(@"CONTINUE");
  id v15 = HMDLocalizedStringForKey(@"EXIT_SETUP");
  uint64_t v16 = *MEMORY[0x263EFFFD8];
  v23[0] = *MEMORY[0x263EFFFC8];
  v23[1] = v16;
  v24[0] = v12;
  v24[1] = v13;
  uint64_t v17 = *MEMORY[0x263F00000];
  v23[2] = *MEMORY[0x263EFFFE8];
  v23[3] = v17;
  v24[2] = v14;
  v24[3] = v15;
  id v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  LOBYTE(self) = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v18 options:0 textField:0 withContext:v10];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__HMDUIDialogPresenter__requestUserPermissionForUnauthenticatedAliroLockWithContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v21 = v8;
  char v22 = (char)self;
  id v19 = v8;
  dispatch_async(v9, block);
}

uint64_t __109__HMDUIDialogPresenter__requestUserPermissionForUnauthenticatedAliroLockWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)requestUserPermissionForUnauthenticatedAliroLockWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v8])
  {
    id v11 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __108__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAliroLockWithContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2EE30;
    void block[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    id v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __108__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAliroLockWithContext_queue_completionHandler___block_invoke_2;
    v15[3] = &unk_264A2DFA0;
    id v16 = v10;
    id v14 = v10;
    dispatch_async(v9, v15);
    id v13 = v16;
  }
}

uint64_t __108__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAliroLockWithContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForUnauthenticatedAliroLockWithContext:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __108__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAliroLockWithContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  void v24[4] = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = HMDLocalizedStringForKey(@"ACCESSORY_NOAUTH_TITLE");
  id v13 = HMDLocalizedStringForKey(@"ACCESSORY_NOAUTH_DETAIL");
  id v14 = HMDLocalizedStringForKey(@"ADD_ANYWAY");
  id v15 = HMDLocalizedStringForKey(@"CANCEL");
  uint64_t v16 = *MEMORY[0x263EFFFD8];
  v23[0] = *MEMORY[0x263EFFFC8];
  v23[1] = v16;
  v24[0] = v12;
  v24[1] = v13;
  uint64_t v17 = *MEMORY[0x263F00000];
  v23[2] = *MEMORY[0x263EFFFE8];
  v23[3] = v17;
  v24[2] = v14;
  v24[3] = v15;
  id v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  LOBYTE(self) = [(HMDUIDialogPresenter *)self _presentDialogWithInfo:v18 options:0 textField:0 withContext:v11];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__HMDUIDialogPresenter__requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A1B858;
  id v21 = v9;
  char v22 = (char)self;
  id v19 = v9;
  dispatch_async(v10, block);
}

uint64_t __110__HMDUIDialogPresenter__requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HMDUIDialogPresenter *)self _addToPendingContext:v11])
  {
    id v14 = [(HMDUIDialogPresenter *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    void block[4] = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    id v15 = v13;
    dispatch_async(v14, block);

    uint64_t v16 = v21;
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_2;
    void v18[3] = &unk_264A2DFA0;
    id v19 = v13;
    id v17 = v13;
    dispatch_async(v12, v18);
    uint64_t v16 = v19;
  }
}

uint64_t __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestUserPermissionForUnauthenticatedAccessory:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

uint64_t __109__HMDUIDialogPresenter_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_removeCurrentNotification:(__CFUserNotification *)a3 currentSelection:(BOOL)a4 selectedByPeerDevice:(BOOL *)a5 andContext:(id)a6
{
  id v10 = a6;
  if (a5) {
    *a5 = 0;
  }
  os_unfair_lock_lock_with_options();
  id v11 = [(HMDUIDialogPresenter *)self pendingContexts];
  [v11 removeObject:v10];

  if ([(HMDUIDialogPresenter *)self currentNotification]
    && [(HMDUIDialogPresenter *)self currentNotification] == a3)
  {
    if ([(HMDUIDialogPresenter *)self selectedByPeerDevice])
    {
      a4 = [(HMDUIDialogPresenter *)self peerDeviceAcceptedSelection];
      if (a5) {
        *a5 = 1;
      }
    }
    [(HMDUIDialogPresenter *)self setCurrentNotification:0];
    [(HMDUIDialogPresenter *)self setCurrentContext:0];
  }
  [(HMDUIDialogPresenter *)self setSelectedByPeerDevice:0];
  [(HMDUIDialogPresenter *)self setPeerDeviceAcceptedSelection:0];
  os_unfair_lock_unlock(&self->_lock);

  return a4;
}

- (BOOL)_addCurrentNotification:(__CFUserNotification *)a3 withContext:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  BOOL v7 = [(HMDUIDialogPresenter *)self pendingContexts];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    [(HMDUIDialogPresenter *)self setCurrentNotification:a3];
    [(HMDUIDialogPresenter *)self setCurrentContext:v6];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (BOOL)_addToPendingContext:(id)a3
{
  id v4 = a3;
  if (v4 && !isAppleTV())
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    BOOL v7 = [(HMDUIDialogPresenter *)self pendingContexts];
    char v8 = [v7 containsObject:v4];

    if ((v8 & 1) == 0)
    {
      id v9 = [(HMDUIDialogPresenter *)self pendingContexts];
      [v9 addObject:v4];
    }
    char v5 = v8 ^ 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_isPendingContext:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDUIDialogPresenter *)self pendingContexts];
  char v7 = [v6 containsObject:v4];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)dismissPendingDialogDueToPeerDeviceSelection:(BOOL)a3 context:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v16 = a4;
  id v10 = a5;
  id v11 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMDUIDialogPresenter *)self setSelectedByPeerDevice:1];
  [(HMDUIDialogPresenter *)self setPeerDeviceAcceptedSelection:v8];
  id v13 = [(HMDUIDialogPresenter *)self currentContext];
  int v14 = [v13 isEqual:v16];

  if (v14)
  {
    CFUserNotificationCancel([(HMDUIDialogPresenter *)self currentNotification]);
  }
  else
  {
    id v15 = [(HMDUIDialogPresenter *)self pendingContexts];
    [v15 removeObject:v16];
  }
  os_unfair_lock_unlock(p_lock);
  dispatch_async(v10, v11);
}

- (void)dismissPendingDialogWithContext:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  BOOL v8 = a4;
  id v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v11 = [(HMDUIDialogPresenter *)self currentContext];
  int v12 = [v11 isEqual:v14];

  if (v12)
  {
    CFUserNotificationCancel([(HMDUIDialogPresenter *)self currentNotification]);
  }
  else
  {
    id v13 = [(HMDUIDialogPresenter *)self pendingContexts];
    [v13 removeObject:v14];
  }
  os_unfair_lock_unlock(p_lock);
  dispatch_async(v8, v9);
}

- (void)setCurrentNotification:(__CFUserNotification *)a3
{
  currentNotification = self->_currentNotification;
  if (currentNotification != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      currentNotification = self->_currentNotification;
    }
    if (currentNotification) {
      CFRelease(currentNotification);
    }
    self->_currentNotification = a3;
  }
}

- (void)dealloc
{
  currentNotification = self->_currentNotification;
  if (currentNotification) {
    CFRelease(currentNotification);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDUIDialogPresenter;
  [(HMDUIDialogPresenter *)&v4 dealloc];
}

- (HMDUIDialogPresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMDUIDialogPresenter;
  v2 = [(HMDUIDialogPresenter *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dialog", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    pendingContexts = v2->_pendingContexts;
    v2->_pendingContexts = (NSMutableArray *)v6;
  }
  return v2;
}

+ (id)sharedUIDialogPresenter
{
  if (sharedUIDialogPresenter_onceToken != -1) {
    dispatch_once(&sharedUIDialogPresenter_onceToken, &__block_literal_global_60125);
  }
  v2 = (void *)sharedUIDialogPresenter_singleton;
  return v2;
}

void __47__HMDUIDialogPresenter_sharedUIDialogPresenter__block_invoke()
{
  v0 = objc_alloc_init(HMDUIDialogPresenter);
  v1 = (void *)sharedUIDialogPresenter_singleton;
  sharedUIDialogPresenter_singleton = (uint64_t)v0;
}

@end