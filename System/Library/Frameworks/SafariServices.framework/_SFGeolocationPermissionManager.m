@interface _SFGeolocationPermissionManager
+ (id)sharedManager;
- (BOOL)hasPreciseLocationPermission;
- (void)_showDialogRequestingPermissionForURL:(id)a3 frame:(id)a4 dialogPresenter:(id)a5 browserPersona:(int64_t)a6 completionHandler:(id)a7;
- (void)requestPermissionForURL:(id)a3 frame:(id)a4 dialogPresenter:(id)a5 browserPersona:(int64_t)a6 completionHandler:(id)a7;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6;
@end

@implementation _SFGeolocationPermissionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_49);
  }
  v2 = (void *)sharedManager_instance;

  return v2;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!self->_policyDecider)
  {
    v14 = [MEMORY[0x1E4FB1F38] sharedPolicyDecider];
    policyDecider = self->_policyDecider;
    self->_policyDecider = v14;
  }
  if (objc_opt_respondsToSelector()) {
    [(UIWebGeolocationPolicyDecider *)self->_policyDecider clearAuthorizationForDomain:v12];
  }
  v16.receiver = self;
  v16.super_class = (Class)_SFGeolocationPermissionManager;
  [(WBSGeolocationPreferenceManager *)&v16 setValue:v10 ofPreference:v11 forDomain:v12 completionHandler:v13];
}

- (void)requestPermissionForURL:(id)a3 frame:(id)a4 dialogPresenter:(id)a5 browserPersona:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  objc_super v16 = objc_msgSend(v12, "safari_userVisibleHostWithoutWWWSubdomain");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke;
  v21[3] = &unk_1E5C778F8;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  [(WBSGeolocationPreferenceManager *)self getGeolocationSettingForDomain:v16 completionHandler:v21];
}

- (void)_showDialogRequestingPermissionForURL:(id)a3 frame:(id)a4 dialogPresenter:(id)a5 browserPersona:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, uint64_t))a7;
  objc_super v16 = [v13 securityOrigin];
  id v17 = objc_alloc_init(MEMORY[0x1E4F29088]);
  id v18 = [v16 protocol];
  [v17 setScheme:v18];

  if ([v16 port])
  {
    id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "port"));
    [v17 setPort:v19];
  }
  else
  {
    [v17 setPort:0];
  }
  id v20 = objc_msgSend(v16, "host", a6);
  [v17 setHost:v20];

  id v21 = objc_alloc(MEMORY[0x1E4F46730]);
  id v22 = [v17 URL];
  id v23 = (void *)[v21 initWithURL:v22];

  id v24 = [v13 webView];
  char v25 = objc_msgSend(v24, "webui_privateBrowsingEnabled");

  if (v25)
  {
LABEL_5:
    id v26 = 0;
    goto LABEL_9;
  }
  policyDecider = self->_policyDecider;
  if (!policyDecider)
  {
    v28 = [MEMORY[0x1E4FB1F38] sharedPolicyDecider];
    v29 = self->_policyDecider;
    self->_policyDecider = v28;

    policyDecider = self->_policyDecider;
  }
  v52[0] = 0;
  uint64_t v30 = [(UIWebGeolocationPolicyDecider *)policyDecider getAuthorizationStatusForOrigin:v23 requestingURL:v12 promptInfo:v52];
  id v26 = v52[0];
  if (!v26)
  {
    if (([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari] & v30 & 1) == 0)
    {
      v15[2](v15, v30);
      goto LABEL_11;
    }
    goto LABEL_5;
  }
LABEL_9:
  v31 = [v14 permissionDialogThrottler];
  if (v31)
  {
    v32 = v31;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __128___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke;
    v46[3] = &unk_1E5C77920;
    id v47 = v31;
    id v33 = v13;
    id v48 = v33;
    id v49 = v26;
    v50 = self;
    v51 = v15;
    id v34 = v26;
    id v35 = v32;
    v36 = (void *)MEMORY[0x1AD0C36A0](v46);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __128___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke_2;
    v39[3] = &unk_1E5C74220;
    id v44 = v36;
    id v40 = v33;
    id v41 = v12;
    v42 = self;
    uint64_t v45 = v38;
    id v43 = v14;
    id v37 = v36;
    [v35 requestPermissionDialogPresentation:v39];

LABEL_11:
    return;
  }
  __break(0xC471u);
}

- (BOOL)hasPreciseLocationPermission
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E4F1E600]);
    v5 = self->_locationManager;
    self->_locationManager = v4;

    locationManager = self->_locationManager;
  }
  return [(CLLocationManager *)locationManager authorizationStatus] - 3 <= 1
      && [(CLLocationManager *)self->_locationManager accuracyAuthorization] == CLAccuracyAuthorizationFullAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_policyDecider, 0);
}

@end