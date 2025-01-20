@interface MSProtocolUtilities
+ (id)Win32SHA1OfUDID:(id)a3;
+ (id)_urlSession;
+ (id)appleIDSession;
+ (id)currentOwnerCKUserID;
+ (id)deviceInfoDictForPersonID:(id)a3;
+ (id)retryAfterDateBasedOnRetryAfterHeaderString:(id)a3;
+ (void)applyUserDefaultOverridesToResponse:(id)a3;
+ (void)fetchMPSStateWithBaseAvailabilityURL:(id)a3 personID:(id)a4 originalLibrarySize:(id)a5 completionBlock:(id)a6;
@end

@implementation MSProtocolUtilities

+ (id)currentOwnerCKUserID
{
  return (id)*MEMORY[0x1E4F19C08];
}

+ (void)applyUserDefaultOverridesToResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 stringForKey:@"MPSStateResponseOverride"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 componentsSeparatedByString:@":"];
    if ([v7 count] == 6)
    {
      v8 = [v7 objectAtIndexedSubscript:0];
      objc_msgSend(v3, "setHasRetryAfterSeconds:", objc_msgSend(v8, "BOOLValue"));

      v9 = [v7 objectAtIndexedSubscript:1];
      objc_msgSend(v3, "setRetryAfterSeconds:", objc_msgSend(v9, "integerValue"));

      v10 = [v7 objectAtIndexedSubscript:2];
      objc_msgSend(v3, "setHasMpsAction:", objc_msgSend(v10, "BOOLValue"));

      v11 = [v7 objectAtIndexedSubscript:3];
      objc_msgSend(v3, "setMpsAction:", objc_msgSend(v11, "intValue"));

      v12 = [v7 objectAtIndexedSubscript:4];
      objc_msgSend(v3, "setHasIcplAction:", objc_msgSend(v12, "BOOLValue"));

      v13 = [v7 objectAtIndexedSubscript:5];
      objc_msgSend(v3, "setIcplAction:", objc_msgSend(v13, "intValue"));

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        id v15 = v3;
        __int16 v16 = 2114;
        v17 = @"MPSStateResponseOverride";
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Overriding MPS state response to %{public}@ because %{public}@ user default is set", (uint8_t *)&v14, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid override string, unexpected item count: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

+ (void)fetchMPSStateWithBaseAvailabilityURL:(id)a3 personID:(id)a4 originalLibrarySize:(id)a5 completionBlock:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v43 = a6;
  id v11 = a5;
  v12 = [a3 URLByAppendingPathComponent:v10];
  v13 = [v12 URLByAppendingPathComponent:@"sharedstreams"];
  uint64_t v14 = [v13 URLByAppendingPathComponent:@"mpsstate"];

  v46 = (void *)v14;
  id v15 = [MEMORY[0x1E4F18D50] requestWithURL:v14];
  __int16 v16 = [MEMORY[0x1E4F1CA60] dictionary];
  id v40 = a1;
  v17 = [a1 deviceInfoDictForPersonID:v10];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v60 = v17;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "deviceInfo %@", buf, 0xCu);
  }
  uint64_t v18 = [(__CFString *)v17 objectForKey:@"authToken"];
  if (v18)
  {
    v19 = [NSString stringWithFormat:@"%@:%@", v10, v18];
    CFDataRef v20 = [v19 dataUsingEncoding:4];
    v21 = (__CFString *)MSPCUCreateBase64StringFromData(v20);
    if (v21)
    {
      v22 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v21];
      [v16 setObject:v22 forKey:@"authorization"];
    }
  }
  uint64_t v23 = [(__CFString *)v17 objectForKey:@"clientInfo"];
  if (v23) {
    [v16 setObject:v23 forKey:@"X-MMe-Client-Info"];
  }
  v41 = (void *)v23;
  [v16 setObject:@"application/protobuf" forKey:@"Content-Type"];
  v45 = v16;
  [(__CFString *)v15 setAllHTTPHeaderFields:v16];
  v24 = objc_alloc_init(MPSStateRequest);
  v39 = [(__CFString *)v17 objectForKey:@"UDID"];
  CFStringRef SHA1StringOfUDID = createSHA1StringOfUDID(v39);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v60 = SHA1StringOfUDID;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting MPS deviceID: %@", buf, 0xCu);
  }
  v38 = (__CFString *)SHA1StringOfUDID;
  [(MPSStateRequest *)v24 setMPSDeviceID:SHA1StringOfUDID];
  v26 = dispatch_group_create();
  v27 = [getCKContainerClass() containerWithIdentifier:@"com.apple.photos.cloud"];
  if (v27)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v60 = v27;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "iCPLContainer is %p", buf, 0xCu);
    }
    dispatch_group_enter(v26);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke;
    v56[3] = &unk_1E6C3CEB0;
    v57 = v24;
    v58 = v26;
    [(__CFString *)v27 fetchCurrentDeviceIDWithCompletionHandler:v56];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v60 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "iCPLContainer is %p", buf, 0xCu);
  }
  v48 = [getCKContainerClass() containerWithIdentifier:@"com.apple.backup.ios"];
  v44 = v17;
  if (v48)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v60 = v48;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "backupContainer is %p", buf, 0xCu);
    }
    dispatch_group_enter(v26);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_54;
    v53[3] = &unk_1E6C3CEB0;
    v54 = v24;
    v55 = v26;
    [(__CFString *)v48 fetchCurrentDeviceIDWithCompletionHandler:v53];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v60 = 0;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "backupContainer is %p", buf, 0xCu);
  }
  v42 = (void *)v18;
  id v28 = objc_alloc_init(MEMORY[0x1E4F78010]);
  v29 = [v28 backupDeviceUUID];
  if (v29)
  {
    [(MPSStateRequest *)v24 setBackupDeviceUUID:v29];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v60 = v29;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting Backup deviceUUID: %@", buf, 0xCu);
    }
  }
  v37 = v27;
  v30 = [v28 backupDeviceUDID];
  if (v30)
  {
    [(MPSStateRequest *)v24 setBackupDeviceUDID:v30];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v60 = v30;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting Backup deviceUDID: %@", buf, 0xCu);
    }
  }
  v47 = v10;
  dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v31 = [v11 longLongValue];

  [(MPSStateRequest *)v24 setOriginalLibrarySize:v31];
  v32 = [(MPSStateRequest *)v24 data];
  [(__CFString *)v15 setHTTPBody:v32];
  [(__CFString *)v15 setHTTPMethod:@"POST"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v60 = v15;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Request %@", buf, 0xCu);
  }
  v33 = [(id)objc_opt_class() _urlSession];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_59;
  v49[3] = &unk_1E6C3CED8;
  v50 = v15;
  id v51 = v43;
  id v52 = v40;
  id v34 = v43;
  v35 = v15;
  v36 = [v33 dataTaskWithRequest:v35 completionHandler:v49];

  [v36 resume];
}

void __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setICPLDeviceID:v5];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting iCPL deviceID: %@ Error: %@", (uint8_t *)&v7, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setBackupDeviceID:v5];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting Backup deviceID: %@ Error: %@", (uint8_t *)&v7, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_59(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Response %@", buf, 0xCu);
    }
    v12 = v8;
    uint64_t v13 = [(MPSStateResponse *)v12 statusCode];
    if (v13 == 200)
    {
      if (v7)
      {
        uint64_t v11 = [[MPSStateResponse alloc] initWithData:v7];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v11;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "MPSStateResponse %{public}@", buf, 0xCu);
        }
        [*(id *)(a1 + 48) applyUserDefaultOverridesToResponse:v11];
        id v10 = 0;
        goto LABEL_16;
      }
      id v10 = [MEMORY[0x1E4F28C58] MSErrorWithDomain:@"MSASProtocolErrorDomain" code:4 description:@"Missing data in the response"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Missing data from response", buf, 2u);
      }
    }
    else
    {
      uint64_t v14 = v13;
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid status code %ld in the response", v13);
      id v10 = [MEMORY[0x1E4F28C58] MSErrorWithDomain:@"MSASProtocolErrorDomain" code:4 description:v15];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = (MPSStateResponse *)v14;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid status code %ld, ignoring", buf, 0xCu);
      }
    }
    uint64_t v11 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = *(MPSStateResponse **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v16;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Received error for request %@: %@", buf, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F28C58] MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:@"received an error from server" underlyingError:v9];
  uint64_t v11 = 0;
LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_urlSession
{
  if (_urlSession_onceToken != -1) {
    dispatch_once(&_urlSession_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)_urlSession_session;
  return v2;
}

void __34__MSProtocolUtilities__urlSession__block_invoke()
{
  id v3 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"com.apple.mediastream"];
  objc_msgSend(v3, "set_appleIDContext:", v0);

  uint64_t v1 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v3];
  v2 = (void *)_urlSession_session;
  _urlSession_session = v1;
}

+ (id)appleIDSession
{
  if (appleIDSession_onceToken != -1) {
    dispatch_once(&appleIDSession_onceToken, &__block_literal_global_6331);
  }
  v2 = (void *)appleIDSession_session;
  return v2;
}

uint64_t __37__MSProtocolUtilities_appleIDSession__block_invoke()
{
  appleIDSession_session = [objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"com.apple.mediastream"];
  return MEMORY[0x1F41817F8]();
}

+ (id)retryAfterDateBasedOnRetryAfterHeaderString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  if (!v3) {
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  if (_nonNumericNonSpaceCharacterSet_onceToken != -1) {
    dispatch_once(&_nonNumericNonSpaceCharacterSet_onceToken, &__block_literal_global_93);
  }
  CFCharacterSetRef v4 = (const __CFCharacterSet *)_nonNumericNonSpaceCharacterSet_charSet_6333;
  v17.length = CFStringGetLength(v3);
  v17.location = 0;
  if (!CFStringFindCharacterFromSet(v3, v4, v17, 0, 0)) {
    goto LABEL_11;
  }
  if (_retryAfterDateFormatter_once_6334 != -1) {
    dispatch_once(&_retryAfterDateFormatter_once_6334, &__block_literal_global_98);
  }
  CFDateRef DateFromString = CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)_retryAfterDateFormatter_df_6335, v3, 0);
  if (!DateFromString)
  {
LABEL_11:
    int v7 = [(__CFString *)v3 intValue];
    if (v7 >= 1)
    {
      int v8 = v7;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v10 = CFDateCreate(0, Current + (double)v8);
      if (v10)
      {
        CFDateRef v6 = v10;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          int v13 = 67109378;
          *(_DWORD *)uint64_t v14 = v8;
          *(_WORD *)&v14[4] = 2114;
          *(void *)&v14[6] = v6;
          _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Found a retry-after header with a relative interval of %d seconds. Date: %{public}@", (uint8_t *)&v13, 0x12u);
        }
        goto LABEL_15;
      }
    }
LABEL_19:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      *(void *)uint64_t v14 = v3;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Found a retry-after header that could not be parsed: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_21;
  }
  CFDateRef v6 = DateFromString;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    *(void *)uint64_t v14 = v3;
    *(_WORD *)&v14[8] = 2114;
    *(void *)&v14[10] = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Found a retry-after header with a date string: %{public}@. Date: %{public}@", (uint8_t *)&v13, 0x16u);
  }
LABEL_15:
  [(__CFDate *)v6 timeIntervalSinceNow];
  if (v11 > 0.0) {
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    *(void *)uint64_t v14 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Received a retry-after date which occurs in the past: %{public}@. Ignoring.", (uint8_t *)&v13, 0xCu);
  }

LABEL_21:
  CFDateRef v6 = 0;
LABEL_22:

  return v6;
}

+ (id)deviceInfoDictForPersonID:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSProtocolUtilities_deviceInfoDictForPersonID___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceInfoDictForPersonID__once != -1) {
    dispatch_once(&deviceInfoDictForPersonID__once, block);
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  CFDateRef v6 = MSPlatform();
  int v7 = [v6 UDID];
  if (v7) {
    [v5 setObject:v7 forKey:@"UDID"];
  }

  if (deviceInfoDictForPersonID__clientInfo) {
    [v5 setObject:deviceInfoDictForPersonID__clientInfo forKey:@"clientInfo"];
  }
  int v8 = MSPlatform();
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    CFDateRef v10 = MSPlatform();
    double v11 = [v10 pushTokenForPersonID:v4];

    if (v11) {
      [v5 setObject:v11 forKey:@"pushToken"];
    }
  }
  v12 = MSPlatform();
  int v13 = [v12 authTokenForPersonID:v4];

  if (v13) {
    [v5 setObject:v13 forKey:@"authToken"];
  }

  return v5;
}

void __49__MSProtocolUtilities_deviceInfoDictForPersonID___block_invoke()
{
  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v0 = [v13 infoDictionary];
  v12 = [v0 objectForKey:*MEMORY[0x1E4F1CFF8]];
  uint64_t v1 = [v0 objectForKey:@"CFBundleShortVersionString"];
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v12, v1];
  id v3 = [NSString alloc];
  id v4 = MSPlatform();
  id v5 = [v4 hardwareString];
  CFDateRef v6 = MSPlatform();
  int v7 = [v6 OSString];
  int v8 = MSPlatform();
  char v9 = [v8 appBundleInfoString];
  uint64_t v10 = [v3 initWithFormat:@"<%@><%@><%@ (%@)>", v5, v7, v2, v9];
  double v11 = (void *)deviceInfoDictForPersonID__clientInfo;
  deviceInfoDictForPersonID__clientInfo = v10;
}

+ (id)Win32SHA1OfUDID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(&v10, 0, sizeof(v10));
  CC_SHA1_Init(&v10);
  CC_SHA1_Update(&v10, &Win32SHA1OfUDID___prepend, 3u);
  id v4 = v3;
  id v5 = (const char *)[v4 UTF8String];
  size_t v6 = strlen(v5);
  if (v6 >= 0xFFFFFFFF) {
    __assert_rtn("+[MSProtocolUtilities Win32SHA1OfUDID:]", "MSProtocolUtilities.m", 54, "udidLength < UINT32_MAX");
  }
  CC_SHA1_Update(&v10, v5, v6);
  CC_SHA1_Final(md, &v10);
  int v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:md length:20 freeWhenDone:0];
  int v8 = [v7 MSHexString];

  return v8;
}

@end