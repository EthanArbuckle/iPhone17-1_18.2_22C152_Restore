@interface INCAppProxy
+ (BOOL)shouldLaunchAppInBackgroundWithIntent:(id)a3 intentResponse:(id)a4;
+ (void)initialize;
- (INCExtensionConnection)_connection;
- (id)_initWithConnection:(id)a3;
- (void)launchAppInBackground:(BOOL)a3 completionHandler:(id)a4;
- (void)launchAppInBackground:(BOOL)a3 restrictAppsToCarPlay:(BOOL)a4 userActivityIdentifier:(id)a5 completionHandler:(id)a6;
- (void)launchAppInBackground:(BOOL)a3 restrictAppsToCarPlay:(BOOL)a4 userActivityIdentifier:(id)a5 retainsSiri:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation INCAppProxy

- (id)_initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INCAppProxy;
  v5 = [(INCAppProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (INCExtensionConnection)_connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (INCExtensionConnection *)WeakRetained;
}

- (void)launchAppInBackground:(BOOL)a3 restrictAppsToCarPlay:(BOOL)a4 userActivityIdentifier:(id)a5 retainsSiri:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v13 = (void (**)(id, void, id))a7;
  v14 = [(INCAppProxy *)self _connection];
  v15 = [v14 _transaction];

  v16 = [v15 currentIntent];
  v17 = [v15 state];
  v18 = [v17 intentResponse];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v16 response:v18];
  if (v12)
  {
    v20 = [v15 userActivityWithIdentifier:v12];
    if (!v20)
    {
      v21 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSir"
                             "i:completionHandler:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v12;
        _os_log_error_impl(&dword_1BC57D000, v21, OS_LOG_TYPE_ERROR, "%s Unable to find user activity for identifier %{public}@", buf, 0x16u);
      }
      v20 = 0;
    }
  }
  else
  {
    v20 = [v15 currentUserActivity];
  }
  id v44 = 0;
  v22 = [[INCAppLaunchRequest alloc] initWithInteraction:v19 userActivity:v20 inBackground:v10 retainsSiri:v8 error:&v44];
  id v40 = v44;
  if (!v22)
  {
    v30 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:"
                           "completionHandler:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v40;
      _os_log_error_impl(&dword_1BC57D000, v30, OS_LOG_TYPE_ERROR, "%s Unable to construct launch request: %{public}@", buf, 0x16u);
      if (!v13) {
        goto LABEL_30;
      }
    }
    else if (!v13)
    {
      goto LABEL_30;
    }
    v13[2](v13, 0, v40);
    goto LABEL_30;
  }
  if (!v9 || v10) {
    goto LABEL_13;
  }
  v23 = (void *)[objc_alloc((Class)getCARSessionStatusClass()) initAndWaitUntilSessionUpdated];
  v24 = [v23 currentSession];

  if (!v24 || [(INCAppLaunchRequest *)v22 isSupportedInCarPlay])
  {

LABEL_13:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2050000000;
      v25 = (void *)getTUCallCenterClass_softClass;
      uint64_t v48 = getTUCallCenterClass_softClass;
      if (!getTUCallCenterClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getTUCallCenterClass_block_invoke;
        v52 = &unk_1E62BBC68;
        v53 = &v45;
        __getTUCallCenterClass_block_invoke((uint64_t)buf);
        v25 = (void *)v46[3];
      }
      id v26 = v25;
      _Block_object_dispose(&v45, 8);
      v27 = [v26 sharedInstance];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v16 response:v18];
      [v27 applicationWillLaunchForStartCallInteraction:v28];
    }
    v29 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:"
                           "completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_1BC57D000, v29, OS_LOG_TYPE_INFO, "%s Performing launch request: %@", buf, 0x16u);
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __112__INCAppProxy_launchAppInBackground_restrictAppsToCarPlay_userActivityIdentifier_retainsSiri_completionHandler___block_invoke;
    v41[3] = &unk_1E62BB4A8;
    v42 = v22;
    v43 = v13;
    [(INCAppLaunchRequest *)v42 performWithCompletionHandler:v41];

    goto LABEL_30;
  }
  v31 = (void *)*MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    log = v31;
    v34 = [(INCAppLaunchRequest *)v22 bundleIdentifier];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:co"
                         "mpletionHandler:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v34;
    _os_log_error_impl(&dword_1BC57D000, log, OS_LOG_TYPE_ERROR, "%s Refusing to launch \"%{public}@\" while CarPlay is active because it is not available in CarPlay", buf, 0x16u);
  }
  if (v13)
  {
    os_log_t loga = (os_log_t)NSString;
    v32 = [(INCAppLaunchRequest *)v22 bundleIdentifier];
    os_log_t logb = [loga stringWithFormat:@"Cannot launch \"%@\" while CarPlay is active because it is not available in CarPlay", v32];

    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28228];
    os_log_t v50 = logb;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v36 = [v35 errorWithDomain:@"INCExtensionErrorDomain" code:1319 userInfo:v33];

    v13[2](v13, 0, v36);
  }

LABEL_30:
}

void __112__INCAppProxy_launchAppInBackground_restrictAppsToCarPlay_userActivityIdentifier_retainsSiri_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *MEMORY[0x1E4F30240];
  v7 = *MEMORY[0x1E4F30240];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 136315394;
      id v12 = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandl"
            "er:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Successfully performed launch request %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 136315650;
    id v12 = "-[INCAppProxy launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandler:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_error_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_ERROR, "%s Failed to perform launch request %@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

- (void)launchAppInBackground:(BOOL)a3 restrictAppsToCarPlay:(BOOL)a4 userActivityIdentifier:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v11 = (unsigned int (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  v18 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke;
    v14[3] = &unk_1E62BBC68;
    v14[4] = &v15;
    __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke((uint64_t)v14);
    int v11 = (unsigned int (*)(void))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v11)
  {
    dlerror();
    __int16 v13 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v13);
  }
  if (v11()) {
    uint64_t v12 = _os_feature_enabled_impl();
  }
  else {
    uint64_t v12 = 0;
  }
  [(INCAppProxy *)self launchAppInBackground:v7 restrictAppsToCarPlay:0 userActivityIdentifier:0 retainsSiri:v12 completionHandler:v10];
}

- (void)launchAppInBackground:(BOOL)a3 completionHandler:(id)a4
{
}

+ (BOOL)shouldLaunchAppInBackgroundWithIntent:(id)a3 intentResponse:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
    _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  uint64_t v8 = (void *)[objc_alloc((Class)getCARSessionStatusClass()) initAndWaitUntilSessionUpdated];
  id v9 = [v8 currentSession];
  BOOL v10 = v9 != 0;

  if ((INIsDeviceLocked() | v10) == 1)
  {
    id v11 = v5;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      unint64_t v39 = v12;

      id v13 = v11;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      unint64_t v15 = v14;

      id v16 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
    }
    else
    {
      unint64_t v15 = 0;
      unint64_t v39 = 0;
      uint64_t v17 = 0;
    }
    id v18 = v17;

    if (!(v39 | v15) && !v18)
    {
      LOBYTE(v10) = 0;
LABEL_47:

      goto LABEL_48;
    }
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v19 = (void *)getTUCallProviderManagerClass_softClass;
    uint64_t v45 = getTUCallProviderManagerClass_softClass;
    if (!getTUCallProviderManagerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getTUCallProviderManagerClass_block_invoke;
      uint64_t v47 = &unk_1E62BBC68;
      uint64_t v48 = &v42;
      __getTUCallProviderManagerClass_block_invoke((uint64_t)buf);
      v19 = (void *)v43[3];
    }
    v20 = v19;
    _Block_object_dispose(&v42, 8);
    id v21 = objc_alloc_init(v20);
    v22 = objc_msgSend(v11, "_intents_bundleIdForLaunching");
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __68__INCAppProxy_shouldLaunchAppInBackgroundWithIntent_intentResponse___block_invoke;
    v40[3] = &unk_1E62BB4D0;
    id v23 = v22;
    id v41 = v23;
    v24 = [v21 providersPassingTest:v40];
    v25 = [v24 firstObject];

    if (!v25)
    {
      id v26 = *MEMORY[0x1E4F30240];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      v27 = "%s Calling intent has an unknown call provider (%{public}@), preventing us from determining if the app shoul"
            "d be launched in the background";
      v28 = v26;
      uint32_t v29 = 22;
LABEL_26:
      _os_log_fault_impl(&dword_1BC57D000, v28, OS_LOG_TYPE_FAULT, v27, buf, v29);
      goto LABEL_46;
    }
    if ([v25 isSystemProvider])
    {
LABEL_23:
      LOBYTE(v10) = 1;
LABEL_46:

      goto LABEL_47;
    }
    if ([v6 _intentResponseCode] == 6)
    {
      v30 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
        _os_log_impl(&dword_1BC57D000, v30, OS_LOG_TYPE_INFO, "%s Call intent failed requiring app launch, launching app in the foreground", buf, 0xCu);
      }
      LOBYTE(v10) = 0;
      goto LABEL_46;
    }
    if (v39 | v15)
    {
      if (v39) {
        v31 = (void *)v39;
      }
      else {
        v31 = (void *)v15;
      }
      uint64_t v32 = [v31 destinationType];
      uint64_t v33 = v32;
      if (v32 == 3)
      {
        char v34 = [v25 supportsVoicemail];
        goto LABEL_45;
      }
      if (v32 == 2)
      {
        char v34 = [v25 supportsEmergency];
LABEL_45:
        LOBYTE(v10) = v34;
        goto LABEL_46;
      }
      if (v39)
      {
        uint64_t v37 = [(id)v39 callCapability];
        v35 = (void *)v37;
        if (v37 != 2)
        {
          if (v37 != 1) {
            goto LABEL_42;
          }
          goto LABEL_54;
        }
LABEL_55:
        char v34 = [v25 supportsAudioAndVideo];
        goto LABEL_45;
      }
      if (v15)
      {
LABEL_54:
        if ([v25 supportsAudioOnly]) {
          goto LABEL_23;
        }
        goto LABEL_55;
      }
    }
    else
    {
      uint64_t v33 = 0;
    }
    if (!v18)
    {
      v35 = 0;
LABEL_42:
      v38 = *MEMORY[0x1E4F30240];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "+[INCAppProxy shouldLaunchAppInBackgroundWithIntent:intentResponse:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v47 = v35;
      v27 = "%s Calling intent had an unknown call destination (%lu) and/or an unknown call capability (%lu), preventing "
            "us from determining if the app should be launched in the background.";
      v28 = v38;
      uint32_t v29 = 32;
      goto LABEL_26;
    }
    goto LABEL_55;
  }
  LOBYTE(v10) = 0;
LABEL_48:

  return v10;
}

uint64_t __68__INCAppProxy_shouldLaunchAppInBackgroundWithIntent_intentResponse___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end