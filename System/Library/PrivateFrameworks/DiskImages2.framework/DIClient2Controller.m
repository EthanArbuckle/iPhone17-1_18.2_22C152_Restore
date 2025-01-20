@interface DIClient2Controller
@end

@implementation DIClient2Controller

void __60__DIClient2Controller_XPCHandler_newAttachWithParams_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained signalCommandCompletedWithXpcError:v3];
}

void __77__DIClient2Controller_XPCHandler_keychainUnlockWithEncryptionUnlocker_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    id v9 = 0;
    [v8 updateDiskImageParamsWithFrontend:v5 error:&v9];
    id v6 = v9;
  }
  [WeakRetained signalCommandCompletedWithXpcError:v6];
}

void __82__DIClient2Controller_XPCHandler_GUIAskForPassphraseWithEncryptionFrontend_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    id v9 = 0;
    [v8 updateDiskImageParamsWithFrontend:v5 error:&v9];
    id v6 = v9;
  }
  [WeakRetained signalCommandCompletedWithXpcError:v6];
}

void __90__DIClient2Controller_XPCHandler_createAndStoreInSystemKeychainWithCreator_account_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    id v9 = 0;
    [v8 updateDiskImageParamsWithFrontend:v5 error:&v9];
    id v6 = v9;
  }
  [WeakRetained signalCommandCompletedWithXpcError:v6];
}

@end