@interface UNNotificationContentExtensionHostContainerViewController
@end

@implementation UNNotificationContentExtensionHostContainerViewController

uint64_t __85___UNNotificationContentExtensionHostContainerViewController_isMediaSafetyNetEnabled__block_invoke()
{
  uint64_t result = MediaSafetyNetLibraryCore();
  isMediaSafetyNetEnabled_enabled = result != 0;
  return result;
}

uint64_t __98___UNNotificationContentExtensionHostContainerViewController__addExtensionViewFromViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v32[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v11 = v8;
  v12 = (void *)UNLogExtensionsHost;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      v15 = [v13 identifier];
      v16 = *(void **)(a1 + 40);
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2114;
      v31 = v16;
      LOWORD(v32[0]) = 2048;
      *(void *)((char *)v32 + 2) = fabs(v17);
      _os_log_impl(&dword_222224000, v14, OS_LOG_TYPE_DEFAULT, "Loaded host view controller with extension request %{public}@ from extension %{public}@ for notification request %{public}@ (%.2fs)", buf, 0x2Au);
    }
    if (+[_UNNotificationContentExtensionHostContainerViewController isMediaSafetyNetEnabled])
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      v18 = (void (*)(const char *))getMSNMonitorBeginExceptionSymbolLoc_ptr;
      v29 = getMSNMonitorBeginExceptionSymbolLoc_ptr;
      if (!getMSNMonitorBeginExceptionSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getMSNMonitorBeginExceptionSymbolLoc_block_invoke;
        v31 = &unk_264603648;
        v32[0] = &v26;
        v19 = (void *)MediaSafetyNetLibrary();
        v20 = dlsym(v19, "MSNMonitorBeginException");
        *(void *)(*(void *)(v32[0] + 8) + 24) = v20;
        getMSNMonitorBeginExceptionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(v32[0] + 8) + 24);
        v18 = (void (*)(const char *))v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (!v18)
      {
        -[_UNNotificationContentExtensionHostContainerViewController _teardownExtension]();
        __break(1u);
      }
      v18("notificationappex");
    }
    v21 = (id *)(a1 + 32);
    objc_msgSend(v11, "setExtension:", *(void *)(a1 + 32), v26);
    [v11 setExtensionRequestIdentifier:v7];
    [v11 setNotificationRequestIdentifier:*(void *)(a1 + 56)];
    objc_opt_class();
    v22 = UNSafeCast();
    v23 = [*v21 _extensionContextForUUID:v22];
    objc_opt_class();
    v24 = UNSafeCast();
    [v24 setDelegate:WeakRetained];
    [WeakRetained setExtensionHostContext:v24];
    [WeakRetained setExtensionViewController:v11];
    [WeakRetained _setupExtensionViewController:v11];
    v25 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v25 extensionViewControllerDidLoadExtension:WeakRetained];
    }
    if ([WeakRetained isDefaultTitleOverridden]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v25 extensionViewControllerDidUpdateTitle:WeakRetained];
    }
  }
  else if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_FAULT))
  {
    __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke_cold_1(a1, v12, v9);
  }
}

void __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = [v4 identifier];
  id v7 = [a3 localizedDescription];
  int v8 = 138543618;
  id v9 = v6;
  __int16 v10 = 2114;
  id v11 = v7;
  _os_log_fault_impl(&dword_222224000, v5, OS_LOG_TYPE_FAULT, "Failed to load host view controller for extension %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
}

@end