@interface CRPluginsController
- (BOOL)isApplicationInstalledWithMaxRetries:(int)a3 bundleName:(id)a4;
- (BOOL)rebuildApplicationDataBase;
@end

@implementation CRPluginsController

- (BOOL)isApplicationInstalledWithMaxRetries:(int)a3 bundleName:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v9 = v5;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    int v10 = 0;
    if (a3 <= 1) {
      int v11 = 1;
    }
    else {
      int v11 = a3;
    }
    while (1)
    {
      v12 = handleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v23 = v10;
        _os_log_impl(&dword_1D9666000, v12, OS_LOG_TYPE_DEFAULT, "application is not installed Sleeping retry:%d", buf, 8u);
      }

      sleep(0xAu);
      v16 = objc_msgSend_defaultWorkspace(MEMORY[0x1E4F223E0], v13, v14, v15);
      if (objc_msgSend_applicationIsInstalled_(v16, v17, (uint64_t)v9, v18)) {
        break;
      }
      ++v10;

      if (v11 == v10)
      {
        int v10 = v11;
LABEL_16:
        v20 = handleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1D9673D78(v10, v20);
        }
        BOOL v19 = 0;
        goto LABEL_19;
      }
    }

    if (v10 >= a3) {
      goto LABEL_16;
    }
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9666000, v20, OS_LOG_TYPE_DEFAULT, "Application found", buf, 2u);
    }
    BOOL v19 = 1;
LABEL_19:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)rebuildApplicationDataBase
{
  v4 = objc_msgSend_defaultWorkspace(MEMORY[0x1E4F223E0], a2, v2, v3);
  char v6 = objc_msgSend__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_(v4, v5, 1, 0, 0);

  uint64_t v7 = handleForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1D9666000, v8, OS_LOG_TYPE_DEFAULT, "Re building DB successful", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1D9673DF0(v8);
  }

  return v6;
}

@end