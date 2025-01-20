@interface IXGizmoInstallingAppInstallCoordinator
+ (BOOL)modifiesLocalLaunchServicesDatabase;
+ (unint64_t)intent;
- (BOOL)setTargetGizmoPairingID:(id)a3 error:(id *)a4;
- (id)targetGizmoPairingIDWithError:(id *)a3;
- (id)validInstallTypes;
@end

@implementation IXGizmoInstallingAppInstallCoordinator

+ (BOOL)modifiesLocalLaunchServicesDatabase
{
  return 0;
}

+ (unint64_t)intent
{
  return 7;
}

- (id)validInstallTypes
{
  return &unk_1EFE06E10;
}

- (BOOL)setTargetGizmoPairingID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  v7 = +[IXServerConnection sharedConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke;
  v20[3] = &unk_1E5D175A0;
  id v8 = v6;
  id v21 = v8;
  v22 = self;
  v23 = &v24;
  v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v10 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke_10;
  v15[3] = &unk_1E5D175C8;
  id v11 = v8;
  id v16 = v11;
  v17 = self;
  v18 = &v24;
  v19 = &v30;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setTargetGizmoPairingID:completion:", v10, v11, v15);

  int v12 = *((unsigned __int8 *)v31 + 24);
  if (a4 && !*((unsigned char *)v31 + 24))
  {
    *a4 = (id) v25[5];
    int v12 = *((unsigned __int8 *)v31 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v13;
}

void __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    v10 = "-[IXGizmoInstallingAppInstallCoordinator setTargetGizmoPairingID:error:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set target gizmo pairing ID to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __72__IXGizmoInstallingAppInstallCoordinator_setTargetGizmoPairingID_error___block_invoke_10(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[5];
      int v8 = 136315906;
      int v9 = "-[IXGizmoInstallingAppInstallCoordinator setTargetGizmoPairingID:error:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1A7B2D000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set target gizmo pairing ID to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)targetGizmoPairingIDWithError:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  uint64_t v5 = +[IXServerConnection sharedConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke;
  v12[3] = &unk_1E5D17550;
  v12[4] = self;
  v12[5] = &v13;
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v7 = [(IXAppInstallCoordinator *)self uniqueIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke_11;
  v11[3] = &unk_1E5D17CA0;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &v19;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:targetGizmoPairingIDWithCompletion:", v7, v11);

  int v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    int v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315650;
    id v9 = "-[IXGizmoInstallingAppInstallCoordinator targetGizmoPairingIDWithError:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get target gizmo pairing ID from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __72__IXGizmoInstallingAppInstallCoordinator_targetGizmoPairingIDWithError___block_invoke_11(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v12 = 136315650;
      id v13 = "-[IXGizmoInstallingAppInstallCoordinator targetGizmoPairingIDWithError:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1A7B2D000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get target gizmo pairing ID from %@ : %@", (uint8_t *)&v12, 0x20u);
    }

    __int16 v10 = (id *)(*(void *)(a1[5] + 8) + 40);
    uint64_t v11 = a3;
  }
  else
  {
    __int16 v10 = (id *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v11 = a2;
  }
  objc_storeStrong(v10, v11);
}

@end