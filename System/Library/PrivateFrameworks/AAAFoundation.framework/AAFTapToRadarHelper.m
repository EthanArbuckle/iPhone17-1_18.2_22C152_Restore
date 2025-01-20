@interface AAFTapToRadarHelper
- (id)_notificationDictionaryForRequest:(id)a3;
- (int64_t)_deviceClassesFromTypes:(id)a3;
- (unint64_t)_adjustedOptionFlags:(unint64_t)a3;
- (void)_launchTTRWithRequest:(id)a3 completion:(id)a4;
- (void)_showAlertForRequest:(id)a3 completion:(id)a4;
- (void)handleRadarRequest:(id)a3 completion:(id)a4;
- (void)silentTapToRadarWithRequest:(id)a3 completion:(id)a4;
- (void)tapToRadarWithRequest:(id)a3 completion:(id)a4;
@end

@implementation AAFTapToRadarHelper

- (void)tapToRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (+[AFUtilities isInternalBuild])
  {
    [(AAFTapToRadarHelper *)self _showAlertForRequest:v6 completion:v7];
  }
  else
  {
    v8 = _AAFLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAFTapToRadarHelper tapToRadarWithRequest:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    if (v7)
    {
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AAFTTRErrorDomain" code:1 userInfo:0];
      v7[2](v7, v16);
    }
  }
}

- (void)_showAlertForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFDictionaryRef v8 = [(AAFTapToRadarHelper *)self _notificationDictionaryForRequest:v6];
  SInt32 error = 0;
  CFUserNotificationRef v9 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, &error, v8);
  if (v9)
  {
    CFUserNotificationRef v10 = v9;
    uint64_t v11 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__AAFTapToRadarHelper__showAlertForRequest_completion___block_invoke;
    block[3] = &unk_1E6CFA948;
    CFUserNotificationRef v17 = v10;
    block[4] = self;
    id v16 = v7;
    id v15 = v6;
    dispatch_async(v11, block);
  }
  else
  {
    uint64_t v12 = _AAFLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AAFTapToRadarHelper _showAlertForRequest:completion:](v8, (uint64_t)&error, v12);
    }

    if (v7)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AAFTTRErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
}

void __55__AAFTapToRadarHelper__showAlertForRequest_completion___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  switch([*(id *)(a1 + 32) _adjustedOptionFlags:responseFlags])
  {
    case 0:
      [*(id *)(a1 + 32) _launchTTRWithRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
      break;
    case 1:
    case 3:
      uint64_t v2 = *(void *)(a1 + 48);
      if (v2) {
        (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
      }
      break;
    case 2:
      v3 = [*(id *)(a1 + 40) alertOtherButtonAction];

      if (v3)
      {
        v4 = [*(id *)(a1 + 40) alertOtherButtonAction];
        v4[2]();
      }
      break;
    default:
      break;
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

- (id)_notificationDictionaryForRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 alertTitle];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1D990]];

  id v6 = [v3 alertMessage];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

  id v7 = [v3 alertDefaultButtonText];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];

  CFDictionaryRef v8 = [v3 alertCancelButtonText];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];

  CFUserNotificationRef v9 = [v3 alertOtherButtonText];

  if (v9)
  {
    CFUserNotificationRef v10 = [v3 alertOtherButtonText];
    [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
  }
  uint64_t v11 = MEMORY[0x1E4F1CC38];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FA7340]];
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FA7290]];
  uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 resourceURL];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1DA00]];

  return v4;
}

- (unint64_t)_adjustedOptionFlags:(unint64_t)a3
{
  return a3 & 3;
}

- (void)_launchTTRWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setScheme:@"tap-to-radar"];
  [v8 setHost:@"new"];
  CFUserNotificationRef v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = objc_alloc(MEMORY[0x1E4F290C8]);
  uint64_t v11 = [v7 componentName];
  uint64_t v12 = (void *)[v10 initWithName:@"ComponentName" value:v11];
  [v9 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F290C8]);
  uint64_t v14 = [v7 componentVersion];
  id v15 = (void *)[v13 initWithName:@"ComponentVersion" value:v14];
  [v9 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F290C8]);
  CFUserNotificationRef v17 = [v7 componentID];
  v18 = (void *)[v16 initWithName:@"ComponentID" value:v17];
  [v9 addObject:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F290C8]);
  v20 = [v7 radarTitle];
  v21 = (void *)[v19 initWithName:@"Title" value:v20];
  [v9 addObject:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F290C8]);
  v23 = [v7 radarDescription];
  v24 = (void *)[v22 initWithName:@"Description" value:v23];
  [v9 addObject:v24];

  id v25 = objc_alloc(MEMORY[0x1E4F290C8]);
  v26 = [v7 formattedKeywords];
  v27 = (void *)[v25 initWithName:@"Keywords" value:v26];
  [v9 addObject:v27];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Serious Bug"];
  [v9 addObject:v28];

  v29 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"I Didn't Try"];
  [v9 addObject:v29];

  LODWORD(v29) = [v7 fullDiagnostic];
  id v30 = objc_alloc(MEMORY[0x1E4F290C8]);
  if (v29) {
    v31 = @"full-log-archive";
  }
  else {
    v31 = @"phone";
  }
  v32 = (void *)[v30 initWithName:@"AutoDiagnostics" value:v31];
  [v9 addObject:v32];

  [v8 setQueryItems:v9];
  v33 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v34 = [v8 URL];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke;
  v36[3] = &unk_1E6CFA970;
  id v37 = v5;
  id v35 = v5;
  [v33 openURL:v34 configuration:0 completionHandler:v36];
}

void __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AAFLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
}

- (void)silentTapToRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (getTapToRadarServiceClass())
  {
    if (+[AFUtilities isInternalBuild])
    {
      [(AAFTapToRadarHelper *)self handleRadarRequest:v6 completion:v7];
      goto LABEL_13;
    }
    v18 = _AAFLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AAFTapToRadarHelper tapToRadarWithRequest:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    if (v7)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = _AAFLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAFTapToRadarHelper silentTapToRadarWithRequest:completion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    if (v7)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = 3;
LABEL_12:
      v26 = [v16 errorWithDomain:@"com.apple.AAFTTRErrorDomain" code:v17 userInfo:0];
      v7[2](v7, v26);
    }
  }
LABEL_13:
}

- (void)handleRadarRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAFLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAFTapToRadarHelper handleRadarRequest:completion:](v6, v8);
  }

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  uint64_t v9 = (void *)getRadarDraftClass_softClass;
  uint64_t v40 = getRadarDraftClass_softClass;
  if (!getRadarDraftClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getRadarDraftClass_block_invoke;
    id v35 = &unk_1E6CFA9C0;
    v36 = &v37;
    TapToRadarKitLibraryCore();
    v38[3] = (uint64_t)objc_getClass("RadarDraft");
    getRadarDraftClass_softClass = *(void *)(v36[1] + 24);
    uint64_t v9 = (void *)v38[3];
  }
  uint64_t v10 = v9;
  _Block_object_dispose(&v37, 8);
  id v11 = objc_alloc_init(v10);
  uint64_t v12 = NSString;
  uint64_t v13 = [v6 componentName];
  uint64_t v14 = [v12 stringWithFormat:@"%@ detected an error", v13];

  uint64_t v15 = [v6 radarTitle];
  [v11 setTitle:v15];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  id v16 = (void *)getRadarComponentClass_softClass;
  uint64_t v40 = getRadarComponentClass_softClass;
  if (!getRadarComponentClass_softClass)
  {
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __getRadarComponentClass_block_invoke;
    id v35 = &unk_1E6CFA9C0;
    v36 = &v37;
    TapToRadarKitLibraryCore();
    v38[3] = (uint64_t)objc_getClass("RadarComponent");
    getRadarComponentClass_softClass = *(void *)(v36[1] + 24);
    id v16 = (void *)v38[3];
  }
  uint64_t v17 = v16;
  _Block_object_dispose(&v37, 8);
  id v18 = [v17 alloc];
  uint64_t v19 = [v6 componentName];
  uint64_t v20 = [v6 componentVersion];
  uint64_t v21 = [v6 componentID];
  uint64_t v22 = objc_msgSend(v18, "initWithName:version:identifier:", v19, v20, (int)objc_msgSend(v21, "intValue"));
  [v11 setComponent:v22];

  uint64_t v23 = [v6 radarDescription];
  [v11 setProblemDescription:v23];

  [v11 setReproducibility:6];
  [v11 setClassification:7];
  uint64_t v24 = [v6 keywordIDs];
  [v11 setKeywords:v24];

  uint64_t v25 = [v6 deviceTypes];
  objc_msgSend(v11, "setRemoteDeviceClasses:", -[AAFTapToRadarHelper _deviceClassesFromTypes:](self, "_deviceClassesFromTypes:", v25));

  if ([v6 fullDiagnostic]) {
    [v11 setAutoDiagnostics:6];
  }
  v26 = [getTapToRadarServiceClass() shared];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke;
  v29[3] = &unk_1E6CFA998;
  id v30 = v14;
  id v31 = v7;
  id v27 = v7;
  id v28 = v14;
  [v26 createDraft:v11 forProcessNamed:0 withDisplayReason:v28 completionHandler:v29];
}

void __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AAFLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_1(a1, v5);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (int64_t)_deviceClassesFromTypes:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 containsString:@"iPhone"];
  if ([v3 containsString:@"iPad"]) {
    v4 |= 2uLL;
  }
  if ([v3 containsString:@"Mac"]) {
    v4 |= 0x20uLL;
  }
  if ([v3 containsString:@"Watch"]) {
    v4 |= 4uLL;
  }
  if ([v3 containsString:@"AppleTV"]) {
    v4 |= 8uLL;
  }
  if ([v3 containsString:@"HomePod"]) {
    int64_t v5 = v4 | 0x10;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 containsString:@"Vision"];

  if (v6) {
    return v5 | 0x40;
  }
  else {
    return v5;
  }
}

- (void)tapToRadarWithRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_showAlertForRequest:(NSObject *)a3 completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F1D990]];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_error_impl(&dword_1DD937000, a3, OS_LOG_TYPE_ERROR, "Showing alert (%@) failed, user notification is nil!. Error: %d", v6, 0x12u);
}

void __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DD937000, v0, OS_LOG_TYPE_DEBUG, "Tap-to-radar launched with result: %@", v1, 0xCu);
}

void __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DD937000, v0, OS_LOG_TYPE_ERROR, "Tap-to-radar failed to launch with error: %@", v1, 0xCu);
}

- (void)silentTapToRadarWithRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleRadarRequest:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 componentID];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DD937000, a2, OS_LOG_TYPE_DEBUG, "Handling Silent Radar Request with id: %@", v4, 0xCu);
}

void __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1DD937000, a2, OS_LOG_TYPE_DEBUG, "Successfully created draft with title: %@", (uint8_t *)&v3, 0xCu);
}

void __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DD937000, v0, OS_LOG_TYPE_ERROR, "Created draft with error: %@", v1, 0xCu);
}

@end