@interface CalLocationManager
+ (BOOL)isCurrentProcessEntitledToUseLocationServices;
+ (id)placemarkForAddress:(id)a3 withCompletionBlock:(id)a4;
+ (id)placemarkForLocation:(id)a3 withCompletionBlock:(id)a4;
+ (id)strictGeocodeString:(id)a3 withCompletionBlock:(id)a4;
+ (void)_loadMapKit;
+ (void)currentLocationWithCompletionBlock:(id)a3;
@end

@implementation CalLocationManager

+ (id)placemarkForAddress:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    CFRetain(v7);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke;
    v17[3] = &unk_1E56CDA68;
    id v8 = v5;
    id v18 = v8;
    id v20 = v6;
    id v9 = v7;
    id v19 = v9;
    [v9 geocodeAddressString:v8 completionHandler:v17];
    v10 = [CalCancellableSearch alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_53;
    v14[3] = &unk_1E56CD858;
    id v15 = v8;
    id v16 = v9;
    v11 = v9;
    v12 = [(CalCancellableSearch *)v10 initWithCancellationBlock:v14];
  }
  else
  {
    v11 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[CalLocationManager placemarkForAddress:withCompletionBlock:]();
    }
    v12 = 0;
  }

  return v12;
}

void __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_2(v5);
  }

  if ([v5 count])
  {
    id v8 = [v5 objectAtIndex:0];
    id v9 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

+ (id)strictGeocodeString:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[CalLocationManager strictGeocodeString:withCompletionBlock:].cold.5();
  }

  if (!v7)
  {
    id v9 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CalLocationManager strictGeocodeString:withCompletionBlock:].cold.4();
    }
  }
  v10 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_3();
  }

  [a1 _loadMapKit];
  int v11 = _sMapKitLoaded;
  v12 = +[CalFoundationLogSubsystem locations];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13) {
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_2();
    }

    id v14 = objc_alloc_init(NSClassFromString(&cfstr_Mklocalsearchr.isa));
    [v14 _setCanonicalSearchString:v6];
    id v15 = (void *)[objc_alloc(NSClassFromString(&cfstr_Mklocalsearch.isa)) initWithRequest:v14];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke;
    v23[3] = &unk_1E56CDA90;
    id v24 = v7;
    [v15 startWithCompletionHandler:v23];
    id v16 = [CalCancellableSearch alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_61;
    v20[3] = &unk_1E56CD858;
    id v21 = v6;
    id v22 = v15;
    id v17 = v15;
    id v18 = [(CalCancellableSearch *)v16 initWithCancellationBlock:v20];

    goto LABEL_17;
  }
  if (v13) {
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_1();
  }

  if (v7)
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:CalLocationErrorDomain code:4 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
    id v18 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v18 = 0;
LABEL_18:

  return v18;
}

+ (void)_loadMapKit
{
  if (_loadMapKit_onceToken != -1) {
    dispatch_once(&_loadMapKit_onceToken, &__block_literal_global_5);
  }
}

void __33__CalLocationManager__loadMapKit__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MapKit"];
  v1 = v0;
  if (v0)
  {
    int v2 = [v0 load];
    _sMapKitLoaded = v2;
    if (v2) {
      goto LABEL_8;
    }
  }
  else if (_sMapKitLoaded)
  {
    goto LABEL_8;
  }
  v3 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __33__CalLocationManager__loadMapKit__block_invoke_cold_1();
  }

LABEL_8:
}

void __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_cold_1(v5, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)currentLocationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F1E600] locationServicesEnabled];
    id v6 = +[CalFoundationLogSubsystem locations];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        +[CalLocationManager currentLocationWithCompletionBlock:].cold.4();
      }

      id v8 = [MEMORY[0x1E4F28B50] mainBundle];
      id v9 = [v8 bundleIdentifier];

      v10 = +[CalFoundationLogSubsystem locations];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[CalLocationManager currentLocationWithCompletionBlock:]();
      }

      if (([(__CFString *)v9 isEqualToString:@"com.apple.reminders"] & 1) == 0)
      {
        int v11 = +[CalFoundationLogSubsystem locations];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          +[CalLocationManager currentLocationWithCompletionBlock:](v11, v12, v13, v14, v15, v16, v17, v18);
        }

        id v9 = @"com.apple.iCal";
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke;
      v20[3] = &unk_1E56CDA40;
      id v21 = v9;
      id v22 = v4;
      id v23 = a1;
      id v19 = v9;
      +[CalLocationAuthorization authorizationStatusForBundleIdentifier:v19 completion:v20];
    }
    else
    {
      if (v7) {
        +[CalLocationManager currentLocationWithCompletionBlock:].cold.5();
      }

      id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:CalLocationErrorDomain code:2 userInfo:0];
      (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v19);
    }
  }
  else
  {
    id v19 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[CalLocationManager currentLocationWithCompletionBlock:]();
    }
  }
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  unsigned int v3 = a2 - 1;
  id v4 = +[CalFoundationLogSubsystem locations];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 <= 1)
  {
    if (v5) {
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_1();
    }
LABEL_13:

    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:CalLocationErrorDomain code:1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    goto LABEL_16;
  }
  if (v5) {
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_4();
  }

  BOOL v6 = +[CalEntitlementsVerifier currentProcessHasLocationdEffectiveBundleEntitlement];
  id v4 = +[CalFoundationLogSubsystem locations];
  BOOL v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v7) {
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_3();
    }
    goto LABEL_13;
  }
  if (v7) {
    __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_2();
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_34;
  v15[3] = &unk_1E56CDA18;
  id v16 = *(id *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v12;
  long long v17 = v12;
  id v9 = (void (**)(void))MEMORY[0x192FD8850](v15);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v9[2](v9);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_45;
    block[3] = &unk_1E56CD7E8;
    uint64_t v14 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  int v11 = v16;
LABEL_16:
}

+ (id)placemarkForLocation:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[CalFoundationLogSubsystem locations];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      +[CalLocationManager placemarkForLocation:withCompletionBlock:]();
    }

    id v9 = objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    CFRetain(v9);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke;
    v18[3] = &unk_1E56CDA68;
    id v10 = v5;
    id v19 = v10;
    id v21 = v6;
    id v11 = v9;
    id v20 = v11;
    [v11 reverseGeocodeLocation:v10 completionHandler:v18];
    long long v12 = [CalCancellableSearch alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_52;
    v15[3] = &unk_1E56CD858;
    id v16 = v10;
    id v17 = v11;
    BOOL v7 = v11;
    uint64_t v13 = [(CalCancellableSearch *)v12 initWithCancellationBlock:v15];
  }
  else
  {
    if (v8) {
      +[CalLocationManager placemarkForLocation:withCompletionBlock:]();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_2(v5);
  }

  if ([v5 count])
  {
    BOOL v8 = [v5 objectAtIndex:0];
    id v9 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_34(void *a1)
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  int v2 = [CalLocationManagerDelegate alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36;
  v7[3] = &unk_1E56CD9F0;
  uint64_t v4 = a1[4];
  unsigned int v3 = (void *)a1[5];
  uint64_t v10 = a1[6];
  id v8 = v3;
  id v9 = &v11;
  uint64_t v5 = [(CalLocationManagerDelegate *)v2 initWithCurrentBundleID:v4 completionBlock:v7];
  id v6 = (void *)v12[5];
  v12[5] = v5;

  _Block_object_dispose(&v11, 8);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = +[CalFoundationLogSubsystem locations];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_3();
    }

    [*(id *)(a1 + 48) _loadMapKit];
    int v8 = _sMapKitLoaded;
    id v9 = +[CalFoundationLogSubsystem locations];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_2();
      }

      id v11 = objc_alloc_init(NSClassFromString(&cfstr_Mklocationshif.isa));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_40;
      v16[3] = &unk_1E56CD9C8;
      id v17 = *(id *)(a1 + 32);
      [v11 shiftLocation:v5 withCompletionHandler:v16 callbackQueue:MEMORY[0x1E4F14428]];
    }
    else
    {
      if (v10) {
        __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_1();
      }

      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:CalLocationErrorDomain code:4 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

uint64_t __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isCurrentProcessEntitledToUseLocationServices
{
  int v2 = [MEMORY[0x1E4F29268] currentConnection];
  unsigned int v3 = [v2 valueForEntitlement:@"com.apple.locationd.effective_bundle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_52(uint64_t a1)
{
  int v2 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_52_cold_1();
  }

  return [*(id *)(a1 + 40) cancelGeocode];
}

uint64_t __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_53(uint64_t a1)
{
  int v2 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_53_cold_1();
  }

  return [*(id *)(a1 + 40) cancelGeocode];
}

uint64_t __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_61(uint64_t a1)
{
  int v2 = +[CalFoundationLogSubsystem locations];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_61_cold_1();
  }

  return [*(id *)(a1 + 40) cancel];
}

+ (void)currentLocationWithCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Attempting to get our current location without a completion block", v2, v3, v4, v5, v6);
}

+ (void)currentLocationWithCompletionBlock:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)currentLocationWithCompletionBlock:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Current bundle id for location lookup is [%@].", v2, v3, v4, v5, v6);
}

+ (void)currentLocationWithCompletionBlock:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Location services is enabled.", v2, v3, v4, v5, v6);
}

+ (void)currentLocationWithCompletionBlock:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Location services is *disabled*.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Location services is not authorized for Calendar/Reminders.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Current process is code signed and has the correct entitlements.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Current process is not code signed/ does not have the correct entitlements.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Location services is authorized for Calendar/Reminders.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "MapKit *not* loaded.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "MapKit loaded.", v2, v3, v4, v5, v6);
}

void __57__CalLocationManager_currentLocationWithCompletionBlock___block_invoke_36_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Loading mapkit...", v2, v3, v4, v5, v6);
}

+ (void)placemarkForLocation:withCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Attempting to a placemark for a location without a completion block", v2, v3, v4, v5, v6);
}

+ (void)placemarkForLocation:withCompletionBlock:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Attempting to get a placemark for the location [%@].", v2, v3, v4, v5, v6);
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_190D88000, v0, v1, "Choosing this placemark [%@] for this location [%@]");
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_cold_2(void *a1)
{
  os_log_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_190D88000, v2, v3, "Found [%@] placemarks for the location [%@].. placemarks: [%@]", v4, v5, v6, v7, v8);
}

void __63__CalLocationManager_placemarkForLocation_withCompletionBlock___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Cancelled geocode for location [%@].", v2, v3, v4, v5, v6);
}

+ (void)placemarkForAddress:withCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Attempting to a placemark for the address [%@] without a completion block", v2, v3, v4, v5, v6);
}

void __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "No placemarks found for [%@].", v2, v3, v4, v5, v6);
}

void __62__CalLocationManager_placemarkForAddress_withCompletionBlock___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Cancelled geocode for address [%@].", v2, v3, v4, v5, v6);
}

+ (void)strictGeocodeString:withCompletionBlock:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "No completion block", v2, v3, v4, v5, v6);
}

+ (void)strictGeocodeString:withCompletionBlock:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_190D88000, v0, v1, "Attempting to do strict geocoding for a location string.", v2, v3, v4, v5, v6);
}

void __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSNumber;
  uint64_t v5 = [a1 mapItems];
  uint8_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  uint64_t v7 = [a1 mapItems];
  int v8 = 138412546;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Found [%@] locations: [%@].", (uint8_t *)&v8, 0x16u);
}

void __62__CalLocationManager_strictGeocodeString_withCompletionBlock___block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_190D88000, v0, v1, "Cancelled strict geocode for address [%@].", v2, v3, v4, v5, v6);
}

void __33__CalLocationManager__loadMapKit__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_190D88000, v0, OS_LOG_TYPE_ERROR, "Could not load MapKit framework bundle.", v1, 2u);
}

@end