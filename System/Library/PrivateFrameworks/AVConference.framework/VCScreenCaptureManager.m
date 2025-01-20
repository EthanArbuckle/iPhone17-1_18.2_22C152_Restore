@interface VCScreenCaptureManager
+ (int64_t)contentTypeForFilter:(id)a3;
- (BOOL)isPickerClientProcessId:(id)a3;
- (BOOL)shouldUpdateFilter:(id)a3;
- (SCContentFilter)contentFilter;
- (SCStream)screenStream;
- (VCScreenCaptureManager)init;
- (VCScreenCapturePicker)picker;
- (id)attributesForContentFilter:(id)a3;
- (id)errorForAttributesError:(id)a3;
- (id)getErrorDictionaryFromError:(id)a3;
- (id)newCaptureSourceID;
- (id)newScreenShareWithConfig:(id)a3 pid:(id)a4;
- (id)screenShareDictionary:(id)a3;
- (id)startScreenShare:(id)a3;
- (id)stopScreenShare:(id)a3;
- (id)stopScreenShareAndNotifyDelegate:(id)a3;
- (id)updateCurrentPickerScreenCapture;
- (id)updateScreenCapture:(id)a3 withConfig:(id)a4;
- (void)createPicker;
- (void)dealloc;
- (void)endPrivacyAccountingInterval:(id)a3;
- (void)init;
- (void)invalidatePicker;
- (void)registerBlocksForService;
- (void)removePickerClientScreenShare:(id)a3;
- (void)screenCaptureStartFor:(id)a3 didSucceed:(BOOL)a4 withError:(id)a5;
- (void)screenCaptureStopFor:(id)a3 didSucceed:(BOOL)a4 withError:(id)a5;
- (void)setScreenStream:(id)a3;
- (void)startPrivacyAccountingInterval:(id)a3;
@end

@implementation VCScreenCaptureManager

- (VCScreenCaptureManager)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCScreenCaptureManager;
  v2 = [(VCScreenCaptureManager *)&v7 init];
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCScreenCaptureManager.xpc.commands", 0, CustomRootQueue);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v2->_screenShare = v5;
      if (v5) {
        return v2;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCaptureManager init]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCaptureManager init]();
      }
    }

    return 0;
  }
  return v2;
}

VCScreenCaptureManager *__VCScreenCaptureManager_SharedInstance_block_invoke()
{
  result = objc_alloc_init(VCScreenCaptureManager);
  VCScreenCaptureManager_SharedInstance__vcScreenCaptureManager = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(VCScreenCaptureManager *)self invalidatePicker];
  v3.receiver = self;
  v3.super_class = (Class)VCScreenCaptureManager;
  [(VCScreenCaptureManager *)&v3 dealloc];
}

- (id)getErrorDictionaryFromError:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Screen Capture unknown error"];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  if (a3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "domain"), @"ERROR_DOMAIN");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code")), @"ERROR_CODE");
    id v6 = a3;
  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v4, "domain"), @"ERROR_DOMAIN");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")), @"ERROR_CODE");
    id v6 = v4;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v6, "userInfo"), @"ERROR_USERINFO");

  return v5;
}

- (void)screenCaptureStartFor:(id)a3 didSucceed:(BOOL)a4 withError:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VCScreenCaptureManager_screenCaptureStartFor_didSucceed_withError___block_invoke;
  block[3] = &unk_1E6DB5238;
  BOOL v7 = a4;
  block[4] = self;
  block[5] = a5;
  block[6] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __69__VCScreenCaptureManager_screenCaptureStartFor_didSucceed_withError___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"vcScreenCaptureDidStartSuccess";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v5[1] = @"vcScreenCaptureDidStartError";
  v6[0] = v2;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) getErrorDictionaryFromError:*(void *)(a1 + 40)];
  }
  v6[1] = v3;
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcScreenCaptureStartReturn", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, v5, 2), *(void *)(a1 + 48));
}

- (void)screenCaptureStopFor:(id)a3 didSucceed:(BOOL)a4 withError:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCScreenCaptureManager_screenCaptureStopFor_didSucceed_withError___block_invoke;
  block[3] = &unk_1E6DB5238;
  BOOL v7 = a4;
  block[4] = a5;
  block[5] = self;
  block[6] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __68__VCScreenCaptureManager_screenCaptureStopFor_didSucceed_withError___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"vcScreenCaptureDidStopSuccess";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v5[1] = @"vcScreenCaptureDidStopError";
  v6[0] = v2;
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "getErrorDictionaryFromError:");
  }
  else {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v6[1] = v3;
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcScreenCaptureStopReturn", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, v5, 2), *(void *)(a1 + 48));
}

void __VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40)));
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v7 = @"vcScreenCaptureIsScreenCleared";
    v8[0] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcScreenCaptureScreenDidClear", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), v4);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke_cold_1(v5, v2, v6);
    }
  }
}

- (id)screenShareDictionary:(id)a3
{
  v11[11] = *MEMORY[0x1E4F143B8];
  v10[0] = @"ScreenCaptureIsWindowed";
  v11[0] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isWindowed"));
  v10[1] = @"ScreenCaptureUUID";
  if ([a3 selectiveScreenUUID]) {
    uint64_t v4 = [a3 selectiveScreenUUID];
  }
  else {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v4;
  v10[2] = @"ScreenDisplayID";
  v11[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "screenCaptureDisplayID"));
  v10[3] = @"ScreenCaptureConfigurationDisplayMode";
  v11[3] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "displayMode"));
  v10[4] = @"IsCursorCapturedForScreen";
  v11[4] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isCursorCaptured"));
  v10[5] = @"CaptureSourceID";
  v11[5] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "captureSourceID"));
  v10[6] = @"ClientBundleID";
  if ([a3 clientBundleID]) {
    uint64_t v5 = [a3 clientBundleID];
  }
  else {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[6] = v5;
  v10[7] = @"HasPrivateCaptureEntitlement";
  v11[7] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "privateContentCaptureAllowed"));
  v10[8] = @"CaptureExcludedBundleIDs";
  if ([a3 excludedApplicationBundleIDs]) {
    uint64_t v6 = [a3 excludedApplicationBundleIDs];
  }
  else {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[8] = v6;
  v10[9] = @"ScreenVirtualDisplayLabel";
  if ([a3 screenVirtualDisplayLabel]) {
    uint64_t v7 = [a3 screenVirtualDisplayLabel];
  }
  else {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[9] = v7;
  v10[10] = @"AuditTokenData";
  if ([a3 clientAuditTokenData]) {
    uint64_t v8 = [a3 clientAuditTokenData];
  }
  else {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[10] = v8;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:11];
}

- (id)newCaptureSourceID
{
  uint64_t v3 = 0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  do
  {
    do
    {

      uint64_t v3 = (void *)[objc_alloc(NSNumber) initWithInt:arc4random_uniform(0x7FFFFFFFu)];
    }
    while (![v3 integerValue]);
  }
  while ([(NSMutableDictionary *)self->_screenShare objectForKeyedSubscript:v3]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      v10 = "-[VCScreenCaptureManager newCaptureSourceID]";
      __int16 v11 = 1024;
      int v12 = 188;
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d captureSourceID=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

- (BOOL)isPickerClientProcessId:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  uint64_t v4 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", __b, proc_pidpath(objc_msgSend(a3, "intValue"), __b, 0x1000u), 4);
  if (v4 && [MEMORY[0x1E4F1CB10] fileURLWithPath:v4])
  {
    if (objc_msgSend(@"callservicesd", "isEqualToString:", objc_msgSend(v4, "lastPathComponent"))) {
      char v5 = 1;
    }
    else {
      char v5 = objc_msgSend(@"AVConferenceTestRunner", "isEqualToString:", objc_msgSend(v4, "lastPathComponent"));
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)newScreenShareWithConfig:(id)a3 pid:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = [(VCScreenCaptureManager *)self newCaptureSourceID];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCaptureManager newScreenShareWithConfig:pid:]();
      }
    }
    goto LABEL_15;
  }
  uint64_t v8 = [[VCScreenShare alloc] initWithConfig:a3 pid:a4 captureSourceID:v7];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v8)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCaptureManager newScreenShareWithConfig:pid:]();
      }
    }
LABEL_15:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    __int16 v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      v16 = "-[VCScreenCaptureManager newScreenShareWithConfig:pid:]";
      __int16 v17 = 1024;
      int v18 = 218;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCScreenShare created: %@", (uint8_t *)&v13, 0x26u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenShare, "setObject:forKeyedSubscript:", v8, objc_msgSend(NSNumber, "numberWithInteger:", -[VCScreenShare captureSourceID](v8, "captureSourceID")));
  if ([(VCScreenCaptureManager *)self isPickerClientProcessId:a4])
  {

    self->_pickerClientScreenShare = v8;
  }
LABEL_8:

  return v8;
}

- (void)removePickerClientScreenShare:(id)a3
{
  if (self->_pickerClientScreenShare == a3)
  {

    self->_pickerClientScreenShare = 0;
  }
}

- (id)stopScreenShare:(id)a3
{
  if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "stopScreenShareCapture:", objc_msgSend(a3, "captureSourceID")))char v5 = 0; {
  else
  }
    char v5 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Screen Capture failed to stop"];
  [(VCScreenCaptureManager *)self endPrivacyAccountingInterval:a3];

  self->_screenStream = 0;
  return v5;
}

- (id)stopScreenShareAndNotifyDelegate:(id)a3
{
  *(void *)&v29[11] = *MEMORY[0x1E4F143B8];
  pickerClientScreenShare = self->_pickerClientScreenShare;
  if (!pickerClientScreenShare) {
    return 0;
  }
  id v6 = [(VCScreenCaptureManager *)self stopScreenShare:self->_pickerClientScreenShare];
  if (v6)
  {
    BOOL v7 = [a3 code] != 32000;
    if ((VCScreenCaptureManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCScreenCaptureManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316418;
          uint64_t v21 = v9;
          __int16 v22 = 2080;
          v23 = "-[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]";
          __int16 v24 = 1024;
          int v25 = 265;
          __int16 v26 = 2112;
          *(void *)v27 = v8;
          *(_WORD *)&v27[8] = 2048;
          *(void *)&v27[10] = self;
          __int16 v28 = 2112;
          *(void *)v29 = v6;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to stop video capture server error=%@", (uint8_t *)&v20, 0x3Au);
        }
      }
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  if (!a3) {
    a3 = v6;
  }
  [(VCScreenCaptureManager *)self screenCaptureStopFor:pickerClientScreenShare didSucceed:v7 withError:a3];
  if ((VCScreenCaptureManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316162;
        uint64_t v21 = v12;
        __int16 v22 = 2080;
        v23 = "-[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]";
        __int16 v24 = 1024;
        int v25 = 270;
        __int16 v26 = 1024;
        *(_DWORD *)v27 = v7;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = a3;
        uint64_t v14 = " [%s] %s:%d didSucceed=%hhd error=%@";
        __int16 v15 = v13;
        uint32_t v16 = 44;
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = (__CFString *)[(VCScreenCaptureManager *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316674;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        v23 = "-[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]";
        __int16 v24 = 1024;
        int v25 = 270;
        __int16 v26 = 2112;
        *(void *)v27 = v11;
        *(_WORD *)&v27[8] = 2048;
        *(void *)&v27[10] = self;
        __int16 v28 = 1024;
        *(_DWORD *)v29 = v7;
        v29[2] = 2112;
        *(void *)&v29[3] = a3;
        uint64_t v14 = " [%s] %s:%d %@(%p) didSucceed=%hhd error=%@";
        __int16 v15 = v18;
        uint32_t v16 = 64;
        goto LABEL_26;
      }
    }
  }
  return v6;
}

- (id)startScreenShare:(id)a3
{
  if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "startScreenShareCapture:", -[VCScreenCaptureManager screenShareDictionary:](self, "screenShareDictionary:")))char v5 = 0; {
  else
  }
    char v5 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Screen Capture failed to start"];
  [(VCScreenCaptureManager *)self startPrivacyAccountingInterval:a3];
  return v5;
}

- (id)updateScreenCapture:(id)a3 withConfig:(id)a4
{
  [a3 updateScreenCaptureWithConfig:a4];
  -[VCScreenCapturePicker setRepickingAllowed:](self->_picker, "setRepickingAllowed:", [a3 contentRepickingAllowed]);
  id v6 = [(VCScreenCaptureManager *)self screenShareDictionary:a3];
  id v7 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
  uint64_t v8 = [a3 captureSourceID];

  return (id)[v7 updateScreenCapture:v8 withConfig:v6];
}

- (void)createPicker
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Picker already exists", v2, v3, v4, v5, v6);
}

- (void)invalidatePicker
{
  self->_picker = 0;
}

- (void)registerBlocksForService
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke;
  v10[3] = &unk_1E6DB5478;
  v10[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureInitialize", v10, self->_xpcCommandQueue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_75;
  v9[3] = &unk_1E6DB5478;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureTerminate", v9, self->_xpcCommandQueue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_77;
  v8[3] = &unk_1E6DB5478;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureStart", v8, self->_xpcCommandQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_79;
  v7[3] = &unk_1E6DB5478;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureStop", v7, self->_xpcCommandQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_81;
  void v6[3] = &unk_1E6DB5478;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureUpdate", v6, self->_xpcCommandQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2;
  v5[3] = &unk_1E6DB5478;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerInitialize", v5, self->_xpcCommandQueue);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_84;
  v4[3] = &unk_1E6DB5478;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerTerminate", v4, self->_xpcCommandQueue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_86;
  v3[3] = &unk_1E6DB5478;
  v3[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerShow", v3, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerShowUsingContentStyle", &__block_literal_global_90, self->_xpcCommandQueue);
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    if ([a2 objectForKeyedSubscript:@"CONTEXT"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        uint8_t v6 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v18 = v4;
            __int16 v19 = 2080;
            int v20 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
            __int16 v21 = 1024;
            int v22 = 323;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client has died. Cleaning up VCScreenCaptureManager by removing associated objects", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_3();
        }
      }
      uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"));
      if (v14)
      {
        __int16 v15 = (void *)v14;
        [*(id *)(a1 + 32) removePickerClientScreenShare:v14];
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "captureSourceID")));
      }
    }
    return 0;
  }
  uint64_t v7 = [a2 objectForKeyedSubscript:@"CLIENTPID"];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_1();
      }
    }
    return 0;
  }
  uint64_t v8 = (void *)[*(id *)(a1 + 32) newScreenShareWithConfig:a2 pid:v7];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_2();
      }
    }
    return 0;
  }
  uint64_t v9 = v8;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setRepickingAllowed:", objc_msgSend(v8, "contentRepickingAllowed"));
  id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", v9, @"CONTEXT", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "captureSourceID")), @"vcScreenCaptureCaptureSourceID", 0);

  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = v12;
      __int16 v19 = 2080;
      int v20 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 345;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client initialized", buf, 0x1Cu);
    }
  }
  return v11;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
    uint8_t v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    if (v6)
    {
      uint64_t v7 = v6;
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "stopScreenShareCapture:", objc_msgSend(v6, "captureSourceID"));
      [*(id *)(a1 + 32) endPrivacyAccountingInterval:v7];
      [*(id *)(a1 + 32) removePickerClientScreenShare:v7];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "captureSourceID")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          uint32_t v16 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
          __int16 v17 = 1024;
          int v18 = 367;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Capture stopped and removed from manager", buf, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_75_cold_1();
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        uint32_t v16 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 354;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d context is not a class of VCScreenShare", buf, 0x1Cu);
      }
    }
    return 0;
  }
  return v5;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v5 = [*(id *)(a1 + 32) startScreenShare:v4];
    uint64_t v6 = v5;
    if (v4)
    {
      if (v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_77_cold_2();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_77_cold_1();
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        int v13 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 387;
        __int16 v16 = 1024;
        BOOL v17 = v6 == 0;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStart=%d error=%@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    [*(id *)(a1 + 32) screenCaptureStartFor:v4 didSucceed:v6 == 0 withError:v6];
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v5 = [*(id *)(a1 + 32) stopScreenShare:v4];
    uint64_t v6 = v5;
    if (v4)
    {
      if (v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_79_cold_2();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_79_cold_1();
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        int v13 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 406;
        __int16 v16 = 1024;
        BOOL v17 = v6 == 0;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d screenCaptureStopFor didSucceed=%d error=%@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    [*(id *)(a1 + 32) screenCaptureStopFor:v4 didSucceed:v6 == 0 withError:v6];
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_81(uint64_t a1, void *a2, uint64_t *a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [*(id *)(a1 + 32) updateScreenCapture:v6 withConfig:a2];
      if (a3)
      {
        if (v7) {
          *a3 = v7;
        }
      }
    }
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  [*(id *)(a1 + 32) createPicker];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(void *)(v5 + 40))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v17 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v18;
          __int16 v23 = 2080;
          __int16 v24 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 440;
          __int16 v27 = 2112;
          __int16 v28 = v17;
          __int16 v29 = 2048;
          uint64_t v30 = v20;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) could not create picker", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  [*(id *)(v5 + 40) setActive:1];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", *(void *)(*(void *)(a1 + 32) + 40), @"CONTEXT", 0);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(__CFString **)(*(void *)(a1 + 32) + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v7;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 444;
        __int16 v27 = 2048;
        __int16 v28 = v9;
        int v10 = " [%s] %s:%d picker=%p initialized";
        uint64_t v11 = v8;
        uint32_t v12 = 38;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(v15 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v13;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 444;
        __int16 v27 = 2112;
        __int16 v28 = v6;
        __int16 v29 = 2048;
        uint64_t v30 = v15;
        __int16 v31 = 2048;
        uint64_t v32 = v16;
        int v10 = " [%s] %s:%d %@(%p) picker=%p initialized";
        uint64_t v11 = v14;
        uint32_t v12 = 58;
        goto LABEL_15;
      }
    }
  }
  return v3;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4 == v5[5])
    {
      [v5 invalidatePicker];
      id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      return objc_msgSend(v9, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 456;
        __int16 v16 = 2048;
        uint64_t v17 = v4;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid picker=%p", buf, 0x26u);
      }
    }
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_86(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    [*(id *)(*(void *)(a1 + 32) + 40) showWithStream:*(void *)(*(void *)(a1 + 32) + 56)];
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2_88(uint64_t a1, void *a2)
{
  return 0;
}

- (void)startPrivacyAccountingInterval:(id)a3
{
  if ([a3 selectiveScreenUUID])
  {
    uint64_t v4 = [MEMORY[0x1E4F934E0] applicationWithType:0 identifier:@"com.apple.facetime"];
    uint64_t v5 = (void *)[MEMORY[0x1E4F934D0] sharedInstance];
    self->_accessInterval = (PAAccessInterval *)(id)objc_msgSend(v5, "beginIntervalForAccess:", objc_msgSend(MEMORY[0x1E4F93500], "accessWithAccessor:fromBroadcaster:", v4, v4));
  }
}

- (void)endPrivacyAccountingInterval:(id)a3
{
  if ([a3 selectiveScreenUUID])
  {
    accessInterval = self->_accessInterval;
    if (accessInterval)
    {
      [(PAAccessInterval *)accessInterval end];

      self->_accessInterval = 0;
    }
  }
}

- (id)errorForAttributesError:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCaptureManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v21 = v6;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCScreenCaptureManager errorForAttributesError:]";
          __int16 v24 = 1024;
          int v25 = 517;
          __int16 v26 = 2112;
          id v27 = a3;
          id v9 = " [%s] %s:%d error=%@";
          int v10 = v7;
          uint32_t v11 = 38;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCScreenCaptureManager errorForAttributesError:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCScreenCaptureManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v21 = v12;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCScreenCaptureManager errorForAttributesError:]";
          __int16 v24 = 1024;
          int v25 = 517;
          __int16 v26 = 2112;
          id v27 = v5;
          __int16 v28 = 2048;
          __int16 v29 = self;
          __int16 v30 = 2112;
          id v31 = a3;
          id v9 = " [%s] %s:%d %@(%p) error=%@";
          int v10 = v13;
          uint32_t v11 = 58;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v12;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCScreenCaptureManager errorForAttributesError:]";
        __int16 v24 = 1024;
        int v25 = 517;
        __int16 v26 = 2112;
        id v27 = v5;
        __int16 v28 = 2048;
        __int16 v29 = self;
        __int16 v30 = 2112;
        id v31 = a3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
      }
    }
  }
  v18[0] = @"vcScreenCaptureAttributesErrorDomain";
  v19[0] = [a3 domain];
  v18[1] = @"vcScreenCaptureAttributesErrorCode";
  v19[1] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code"));
  v18[2] = @"vcScreenCaptureAttributesErrorUserInfo";
  v19[2] = [a3 userInfo];
  __int16 v16 = @"vcScreenCaptureAttributesError";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
}

+ (int64_t)contentTypeForFilter:(id)a3
{
  return 1;
}

- (id)attributesForContentFilter:(id)a3
{
  return 0;
}

- (id)updateCurrentPickerScreenCapture
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (SCContentFilter *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "updateScreenCapture:withConfig:", -[VCScreenShare captureSourceID](self->_pickerClientScreenShare, "captureSourceID"), -[VCScreenCaptureManager screenShareDictionary:](self, "screenShareDictionary:", self->_pickerClientScreenShare));
  if (!v3) {
    return v3;
  }
  if ((VCScreenCaptureManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v3;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v3;
    }
    contentFilter = self->_contentFilter;
    pickerClientScreenShare = self->_pickerClientScreenShare;
    int v17 = 136316418;
    uint64_t v18 = v5;
    __int16 v19 = 2080;
    uint64_t v20 = "-[VCScreenCaptureManager updateCurrentPickerScreenCapture]";
    __int16 v21 = 1024;
    int v22 = 569;
    __int16 v23 = 2048;
    __int16 v24 = contentFilter;
    __int16 v25 = 2112;
    __int16 v26 = (VCScreenCaptureManager *)pickerClientScreenShare;
    __int16 v27 = 2112;
    __int16 v28 = v3;
    id v9 = " [%s] %s:%d failed to update content filter=%p on screenshare=%@ with error=%@";
    int v10 = v6;
    uint32_t v11 = 58;
LABEL_13:
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, v11);
    return v3;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = (__CFString *)[(VCScreenCaptureManager *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v15 = self->_contentFilter;
      __int16 v16 = self->_pickerClientScreenShare;
      int v17 = 136316930;
      uint64_t v18 = v12;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCScreenCaptureManager updateCurrentPickerScreenCapture]";
      __int16 v21 = 1024;
      int v22 = 569;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      __int16 v25 = 2048;
      __int16 v26 = self;
      __int16 v27 = 2048;
      __int16 v28 = v15;
      __int16 v29 = 2112;
      __int16 v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v3;
      id v9 = " [%s] %s:%d %@(%p) failed to update content filter=%p on screenshare=%@ with error=%@";
      int v10 = v13;
      uint32_t v11 = 78;
      goto LABEL_13;
    }
  }
  return v3;
}

- (BOOL)shouldUpdateFilter:(id)a3
{
  return 0;
}

- (VCScreenCapturePicker)picker
{
  return self->_picker;
}

- (SCContentFilter)contentFilter
{
  return self->_contentFilter;
}

- (SCStream)screenStream
{
  return self->_screenStream;
}

- (void)setScreenStream:(id)a3
{
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create client to vcscreenshare array", v2, v3, v4, v5, v6);
}

void __VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke";
  LODWORD(v4) = 156;
  WORD2(v4) = 2048;
  *(void *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, (uint64_t)a2, a3, " [%s] %s:%d Missing screen share object for captureSourceID=%ld", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke" >> 16, (void)v4);
}

- (void)newScreenShareWithConfig:pid:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get capture source id", v2, v3, v4, v5, v6);
}

- (void)newScreenShareWithConfig:pid:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCScreenShare object", v2, v3, v4, v5, v6);
}

- (void)stopScreenShareAndNotifyDelegate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to stop video capture server error=%@");
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get client pid", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCScreenShare object", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 323;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Client has died. Cleaning up VCScreenCaptureManager by removing associated objects", v1, 0x1Cu);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Did not find corresponding screen share while terminating", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_77_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed get corresponding screen share object", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_77_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed setup and start video capture server", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed get corresponding screen share object", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_79_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to stop video capture server", v2, v3, v4, v5, v6);
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create picker", v2, v3, v4, v5, v6);
}

- (void)errorForAttributesError:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCScreenCaptureManager errorForAttributesError:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d error=%@", v1, 0x26u);
}

@end