@interface VCTelephonyInterface
+ (int)ctDirectionForTelephonyLinkDirection:(int64_t)a3;
+ (int64_t)ctSubscriptionSlotForSubscriptionSlot:(int64_t)a3;
+ (int64_t)telephonyLinkDirectionForCtDirection:(int)a3;
- (BOOL)getCarrierBundleValue:(id *)a3 forKey:(id)a4;
- (BOOL)registerForNotifications;
- (VCTelephonyInterface)init;
- (VCTelephonyInterface)initWithTelephonySubscriptionSlot:(int64_t)a3;
- (VCTelephonyInterfaceDelegate)delegate;
- (id)translateVocoderTypeToCoreAudioType:(id)a3;
- (unsigned)getSampleRateFromAudioCodecInfo:(id)a3;
- (unsigned)validateCarrierBundleConfigParameters:(id)a3 forKey:(id)a4 defaultValue:(unsigned int)a5 minValue:(unsigned int)a6 maxValue:(unsigned int)a7;
- (void)anbrActivationState:(id)a3 enabled:(BOOL)a4;
- (void)anbrBitrateRecommendation:(id)a3 bitrate:(id)a4 direction:(int)a5;
- (void)dealloc;
- (void)getAnbrActivationStateWithCompletionHandler:(id)a3;
- (void)handleTelephonyNotification:(id)a3 withInfo:(id)a4;
- (void)handleVocoderNotificationWithInfo:(id)a3;
- (void)init;
- (void)notifyCodecModeChangeEventToCT:(_VCAudioCodecModeChangeEvent *)a3;
- (void)queryAnbrBitrateRecommendation:(unsigned int)a3 direction:(int64_t)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setupVCMediaStreamRateAdaptationConfig:(tagVCMediaStreamRateAdaptationConfig *)a3;
- (void)unregisterForNotifications;
@end

@implementation VCTelephonyInterface

- (VCTelephonyInterface)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VCTelephonyInterface;
  v2 = [(VCTelephonyInterface *)&v17 init];
  if (v2)
  {
    [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v2];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCTelephonyInterface.notificationQueue", 0, CustomRootQueue);
    v2->_notificationQueue = (OS_dispatch_queue *)v4;
    if (!v4)
    {
      if ((VCTelephonyInterface *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTelephonyInterface init]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v7 = (__CFString *)[(VCTelephonyInterface *)v2 performSelector:sel_logPrefix];
        }
        else {
          v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v19 = v10;
            __int16 v20 = 2080;
            v21 = "-[VCTelephonyInterface init]";
            __int16 v22 = 1024;
            int v23 = 79;
            __int16 v24 = 2112;
            v25 = v7;
            __int16 v26 = 2048;
            v27 = v2;
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create queue", buf, 0x30u);
          }
        }
      }
      goto LABEL_24;
    }
    uint64_t v5 = _CTServerConnectionCreateOnTargetQueue();
    v2->_connection = (__CTServerConnection *)v5;
    if (!v5)
    {
      if ((VCTelephonyInterface *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTelephonyInterface init]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v8 = (__CFString *)[(VCTelephonyInterface *)v2 performSelector:sel_logPrefix];
        }
        else {
          v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v19 = v13;
            __int16 v20 = 2080;
            v21 = "-[VCTelephonyInterface init]";
            __int16 v22 = 1024;
            int v23 = 90;
            __int16 v24 = 2112;
            v25 = v8;
            __int16 v26 = 2048;
            v27 = v2;
            _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) _CTServerConnectionCreateOnTargetQueue failed", buf, 0x30u);
          }
        }
      }
    }
    v6 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_notificationQueue];
    v2->_coreTelephonyClient = v6;
    [(CoreTelephonyClient *)v6 setDelegate:v2];
    if (!v2->_coreTelephonyClient)
    {
      if ((VCTelephonyInterface *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTelephonyInterface init]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v9 = (__CFString *)[(VCTelephonyInterface *)v2 performSelector:sel_logPrefix];
        }
        else {
          v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v19 = v15;
            __int16 v20 = 2080;
            v21 = "-[VCTelephonyInterface init]";
            __int16 v22 = 1024;
            int v23 = 97;
            __int16 v24 = 2112;
            v25 = v9;
            __int16 v26 = 2048;
            v27 = v2;
            _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CoreTelephonyClient init failed", buf, 0x30u);
          }
        }
      }
    }
    if (!v2->_connection && !v2->_coreTelephonyClient)
    {

LABEL_24:
      return 0;
    }
  }
  return v2;
}

uint64_t __28__VCTelephonyInterface_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];

  return [v5 handleTelephonyNotification:a2 withInfo:a3];
}

- (VCTelephonyInterface)initWithTelephonySubscriptionSlot:(int64_t)a3
{
  dispatch_queue_t v4 = [(VCTelephonyInterface *)self init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_subscriptionSlot = a3;
    v4->_ctSubscriptionSlot = +[VCTelephonyInterface ctSubscriptionSlotForSubscriptionSlot:a3];
    v5->_ctSubscriptionContext = (CTXPCServiceSubscriptionContext *)[objc_alloc(MEMORY[0x1E4F23A68]) initWithSlot:v5->_ctSubscriptionSlot];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCTelephonyInterface *)self unregisterForNotifications];
  connection = self->_connection;
  if (connection) {
    CFRelease(connection);
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue) {
    dispatch_release(notificationQueue);
  }

  objc_storeWeak(&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)VCTelephonyInterface;
  [(VCTelephonyInterface *)&v5 dealloc];
}

- (BOOL)getCarrierBundleValue:(id *)a3 forKey:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v7 addObject:@"IMSConfig"];
  [v7 addObject:@"Media"];
  [v7 addObject:@"VoiceOnAP"];
  [v7 addObject:@"RateAdaptationAlgorithms"];
  [v7 addObject:a4];
  v11[0] = 0;
  if (!self->_ctSubscriptionContext) {
    return 0;
  }
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F23938]), "initWithBundleType:", 1, v11[0]);
  v9 = (void *)[(CoreTelephonyClient *)self->_coreTelephonyClient context:self->_ctSubscriptionContext getCarrierBundleValue:v7 error:v11];

  if (!v9) {
    return 0;
  }
  *a3 = v9;
  return 1;
}

- (unsigned)validateCarrierBundleConfigParameters:(id)a3 forKey:(id)a4 defaultValue:(unsigned int)a5 minValue:(unsigned int)a6 maxValue:(unsigned int)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v11 = (void *)[a3 objectForKeyedSubscript:a4];
  unsigned int v12 = a5;
  if (v11 && (unsigned int v13 = [v11 intValue], v12 = v13, v13 >= a6) && v13 <= a7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316162;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:]";
        __int16 v23 = 1024;
        int v24 = 167;
        __int16 v25 = 2112;
        id v26 = a4;
        __int16 v27 = 1024;
        unsigned int v28 = v12;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Key=%@ present in carrier bundle, value=%d", (uint8_t *)&v19, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      objc_super v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316418;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCTelephonyInterface validateCarrierBundleConfigParameters:forKey:defaultValue:minValue:maxValue:]";
        __int16 v23 = 1024;
        int v24 = 171;
        __int16 v25 = 2112;
        id v26 = a4;
        __int16 v27 = 1024;
        unsigned int v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = a5;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Key=%@ either not present in carrier bundle or out of range, value=%d default value=%d", (uint8_t *)&v19, 0x32u);
      }
    }
    return a5;
  }
  return v12;
}

- (void)setupVCMediaStreamRateAdaptationConfig:(tagVCMediaStreamRateAdaptationConfig *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  a3->var0 = 0;
  if ([(VCTelephonyInterface *)self getCarrierBundleValue:&v14 forKey:@"UplinkRateAdaptation"])
  {
    objc_super v5 = v14;
    a3->var0 = 1;
    if ((VCTelephonyInterface *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v7;
      __int16 v17 = 2080;
      v18 = "-[VCTelephonyInterface setupVCMediaStreamRateAdaptationConfig:]";
      __int16 v19 = 1024;
      int v20 = 181;
      __int16 v21 = 2112;
      __int16 v22 = v5;
      v9 = " [%s] %s:%d UplinkRateAdaptation config=%@";
      uint64_t v10 = v8;
      uint32_t v11 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCTelephonyInterface *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      unsigned int v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      v18 = "-[VCTelephonyInterface setupVCMediaStreamRateAdaptationConfig:]";
      __int16 v19 = 1024;
      int v20 = 181;
      __int16 v21 = 2112;
      __int16 v22 = v6;
      __int16 v23 = 2048;
      int v24 = self;
      __int16 v25 = 2112;
      id v26 = v5;
      v9 = " [%s] %s:%d %@(%p) UplinkRateAdaptation config=%@";
      uint64_t v10 = v13;
      uint32_t v11 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
    a3->var1.var0.var0 = [(VCTelephonyInterface *)self validateCarrierBundleConfigParameters:v5 forKey:@"RateIncreaseMonitorPeriod" defaultValue:10 minValue:1 maxValue:15];
    a3->var1.var0.var2 = [(VCTelephonyInterface *)self validateCarrierBundleConfigParameters:v5 forKey:@"RateDecreaseMonitorPeriod" defaultValue:5 minValue:1 maxValue:15];
    a3->var1.var0.var1 = [(VCTelephonyInterface *)self validateCarrierBundleConfigParameters:v5 forKey:@"RateIncreaseUplinkBLERThreshold" defaultValue:0 minValue:0 maxValue:100];
    a3->var1.var0.var3 = [(VCTelephonyInterface *)self validateCarrierBundleConfigParameters:v5 forKey:@"RateDecreaseUplinkBLERThreshold" defaultValue:10 minValue:0 maxValue:100];
  }
}

- (BOOL)registerForNotifications
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F23AA0];
  unint64_t v4 = _CTServerConnectionRegisterForNotification();
  int v5 = v4;
  unint64_t v6 = HIDWORD(v4);
  int v7 = HIDWORD(v4) | v4;
  if (v4)
  {
    if ((VCTelephonyInterface *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v26 = v13;
          __int16 v27 = 2080;
          unsigned int v28 = "-[VCTelephonyInterface registerForNotifications]";
          __int16 v29 = 1024;
          int v30 = 194;
          __int16 v31 = 2080;
          *(void *)v32 = CFStringGetCStringPtr(v3, 0x8000100u);
          *(_WORD *)&v32[8] = 1024;
          *(_DWORD *)v33 = v5;
          *(_WORD *)&v33[4] = 1024;
          *(_DWORD *)&v33[6] = v6;
          uint64_t v15 = " [%s] %s:%d _CTServerConnectionRegisterForNotification(%s) failed (%d.%d)\n";
          uint64_t v16 = v14;
          uint32_t v17 = 50;
LABEL_22:
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCTelephonyInterface *)self performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316930;
          uint64_t v26 = v18;
          __int16 v27 = 2080;
          unsigned int v28 = "-[VCTelephonyInterface registerForNotifications]";
          __int16 v29 = 1024;
          int v30 = 194;
          __int16 v31 = 2112;
          *(void *)v32 = v8;
          *(_WORD *)&v32[8] = 2048;
          *(void *)v33 = self;
          *(_WORD *)&v33[8] = 2080;
          *(void *)v34 = CFStringGetCStringPtr(v3, 0x8000100u);
          *(_WORD *)&v34[8] = 1024;
          int v35 = v5;
          __int16 v36 = 1024;
          int v37 = v6;
          uint64_t v15 = " [%s] %s:%d %@(%p) _CTServerConnectionRegisterForNotification(%s) failed (%d.%d)\n";
          uint64_t v16 = v19;
          uint32_t v17 = 70;
          goto LABEL_22;
        }
      }
    }
  }
  else
  {
    unint64_t v9 = _CTServerConnectionCopyAudioVocoderInfo();
    int v10 = v9;
    unint64_t v11 = HIDWORD(v9);
    if ((VCTelephonyInterface *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v26 = v20;
          __int16 v27 = 2080;
          unsigned int v28 = "-[VCTelephonyInterface registerForNotifications]";
          __int16 v29 = 1024;
          int v30 = 204;
          __int16 v31 = 1024;
          *(_DWORD *)v32 = v10;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v11;
          uint64_t v15 = " [%s] %s:%d _CTServerConnectionCopyAudioVocoderInfo failed (%d.%d)\n";
          uint64_t v16 = v21;
          uint32_t v17 = 40;
          goto LABEL_22;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCTelephonyInterface *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        __int16 v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v26 = v22;
          __int16 v27 = 2080;
          unsigned int v28 = "-[VCTelephonyInterface registerForNotifications]";
          __int16 v29 = 1024;
          int v30 = 204;
          __int16 v31 = 2112;
          *(void *)v32 = v12;
          *(_WORD *)&v32[8] = 2048;
          *(void *)v33 = self;
          *(_WORD *)&v33[8] = 1024;
          *(_DWORD *)v34 = v10;
          *(_WORD *)&v34[4] = 1024;
          *(_DWORD *)&v34[6] = v11;
          uint64_t v15 = " [%s] %s:%d %@(%p) _CTServerConnectionCopyAudioVocoderInfo failed (%d.%d)\n";
          uint64_t v16 = v23;
          uint32_t v17 = 60;
          goto LABEL_22;
        }
      }
    }
  }
  return v7 == 0;
}

- (void)unregisterForNotifications
{
}

- (void)setDelegate:(id)a3
{
}

- (VCTelephonyInterfaceDelegate)delegate
{
  return (VCTelephonyInterfaceDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)getAnbrActivationStateWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[VCTelephonyInterface getAnbrActivationStateWithCompletionHandler:]";
      __int16 v11 = 1024;
      int v12 = 229;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Querying CoreTelephony for ANBR enabled state", (uint8_t *)&v7, 0x1Cu);
    }
  }
  [(CoreTelephonyClient *)self->_coreTelephonyClient getAnbrActivationState:self->_ctSubscriptionContext completion:a3];
}

- (void)queryAnbrBitrateRecommendation:(unsigned int)a3 direction:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316162;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCTelephonyInterface queryAnbrBitrateRecommendation:direction:completionHandler:]";
      __int16 v16 = 1024;
      int v17 = 238;
      __int16 v18 = 1024;
      int v19 = v7;
      __int16 v20 = 2048;
      int64_t v21 = a4;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Querying CoreTelephony for the access network bitrate=%d, for direction=%ld", (uint8_t *)&v12, 0x2Cu);
    }
  }
  uint64_t v11 = +[VCTelephonyInterface ctDirectionForTelephonyLinkDirection:a4];
  -[CoreTelephonyClient queryAnbrBitrate:bitrate:direction:completion:](self->_coreTelephonyClient, "queryAnbrBitrate:bitrate:direction:completion:", self->_ctSubscriptionContext, [NSNumber numberWithUnsignedInt:v7], v11, a5);
}

- (void)handleTelephonyNotification:(id)a3 withInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    goto LABEL_9;
  }
  uint64_t v7 = VRTraceErrorLogLevelToCSTR();
  uint64_t v8 = *MEMORY[0x1E4F47A50];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_9;
  }
  if (!a3)
  {
    uint64_t v9 = "<nil>";
    if (a4) {
      goto LABEL_5;
    }
LABEL_7:
    int v10 = "<nil>";
    goto LABEL_8;
  }
  uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
  if (!a4) {
    goto LABEL_7;
  }
LABEL_5:
  int v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_8:
  int v11 = 136316162;
  uint64_t v12 = v7;
  __int16 v13 = 2080;
  __int16 v14 = "-[VCTelephonyInterface handleTelephonyNotification:withInfo:]";
  __int16 v15 = 1024;
  int v16 = 248;
  __int16 v17 = 2080;
  __int16 v18 = v9;
  __int16 v19 = 2080;
  __int16 v20 = v10;
  _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTelephonyInterface: received notification %s, info %s", (uint8_t *)&v11, 0x30u);
LABEL_9:
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AA0]]) {
    [(VCTelephonyInterface *)self handleVocoderNotificationWithInfo:a4];
  }
}

- (void)handleVocoderNotificationWithInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v7 = "<nil>";
      }
      int v11 = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCTelephonyInterface handleVocoderNotificationWithInfo:]";
      __int16 v15 = 1024;
      int v16 = 257;
      __int16 v17 = 2080;
      __int16 v18 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTelephonyInterface: received info %s", (uint8_t *)&v11, 0x26u);
    }
  }
  uint64_t v8 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F23AB0]];
  uint64_t v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F23AA8]];
  id v10 = [(VCTelephonyInterface *)self translateVocoderTypeToCoreAudioType:v8];
  if (v10) {
    [(VCTelephonyInterfaceDelegate *)[(VCTelephonyInterface *)self delegate] telephonyInterface:self vocoderInfoChangedToType:v10 sampleRate:v9];
  }
}

- (id)translateVocoderTypeToCoreAudioType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:*MEMORY[0x1E4F23B10]])
  {
    int v4 = 1902341232;
    goto LABEL_24;
  }
  int v4 = 1702261346;
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AE8]])
  {
    int v4 = 1702261347;
    goto LABEL_24;
  }
  if (([a3 isEqualToString:*MEMORY[0x1E4F23AF0]] & 1) != 0
    || (int v4 = 880176738, ([a3 isEqualToString:*MEMORY[0x1E4F23AB8]] & 1) != 0))
  {
LABEL_24:
    uint64_t v5 = NSString;
    unint64_t v6 = FourccToCStr(v4);
    return (id)[v5 stringWithCString:v6 encoding:1];
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AC8]])
  {
    int v4 = 880179042;
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AC0]])
  {
    int v4 = 880176759;
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23B00]])
  {
    int v4 = 1718755360;
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23B08]])
  {
    int v4 = 1752309792;
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AE0]])
  {
    int v4 = 1701212704;
    goto LABEL_24;
  }
  int v4 = 1935764850;
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AD0]]) {
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23B18]])
  {
    int v4 = 1935767394;
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AD8]])
  {
    int v4 = 1700883826;
    goto LABEL_24;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F23AF8]])
  {
    int v4 = 1936029299;
    goto LABEL_24;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCTelephonyInterface translateVocoderTypeToCoreAudioType:]";
      __int16 v14 = 1024;
      int v15 = 300;
      __int16 v16 = 2080;
      uint64_t v17 = [a3 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTelephonyInterface: translateVocoderTypeToCoreAudioType - invalid vocoder type %s", (uint8_t *)&v10, 0x26u);
    }
  }
  return 0;
}

- (unsigned)getSampleRateFromAudioCodecInfo:(id)a3
{
  if ([a3 codec])
  {
    if ([a3 codec] == 1) {
      return 16000;
    }
    if ([a3 codec] != 2) {
      return 32000;
    }
    if ([a3 evsBandwidth])
    {
      if ([a3 evsBandwidth] == 1) {
        return 16000;
      }
      [a3 evsBandwidth];
      return 32000;
    }
  }
  return 8000;
}

- (void)notifyCodecModeChangeEventToCT:(_VCAudioCodecModeChangeEvent *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = +[VCPayloadUtils codecTypeForPayload:a3->payload];
  id v6 = objc_alloc_init(MEMORY[0x1E4F23920]);
  [v6 setCallId:111];
  objc_msgSend(v6, "setCodec:", +[VCPayloadUtils ctAudioCodecTypeForMediaStreamCodec:](VCPayloadUtils, "ctAudioCodecTypeForMediaStreamCodec:", v5));
  if (v5 - 1 > 1)
  {
    if (v5 <= 0x11 && ((1 << v5) & 0x20018) != 0)
    {
      objc_msgSend(v6, "setEvsBitrate:", +[VCPayloadUtils ctAudioCodecEVSBitrateForBitrate:](VCPayloadUtils, "ctAudioCodecEVSBitrateForBitrate:", a3->codecBitrate));
      objc_msgSend(v6, "setEvsBandwidth:", +[VCPayloadUtils ctAudioCodecEVSBandwidthForAudioCodecBandwidth:](VCPayloadUtils, "ctAudioCodecEVSBandwidthForAudioCodecBandwidth:", a3->codecBandwidth));
    }
  }
  else
  {
    [v6 setAmrMode:a3->codecRateMode];
  }
  objc_msgSend(v6, "setSampleRate:", -[VCTelephonyInterface getSampleRateFromAudioCodecInfo:](self, "getSampleRateFromAudioCodecInfo:", v6));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCTelephonyInterface notifyCodecModeChangeEventToCT:]";
      __int16 v14 = 1024;
      int v15 = 345;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Notifying CoreTelephony of current audio settings %@", (uint8_t *)&v10, 0x26u);
    }
  }
  [(CoreTelephonyClient *)self->_coreTelephonyClient setVoLTEAudioCodec:self->_ctSubscriptionContext codecInfo:v6 completion:&__block_literal_global_101];
}

void __55__VCTelephonyInterface_notifyCodecModeChangeEventToCT___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCTelephonyInterface notifyCodecModeChangeEventToCT:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 348;
      __int16 v11 = 2112;
      uint64_t v12 = a2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreTelephony setVoLTEAudioCodec returned with error %@", (uint8_t *)&v5, 0x26u);
    }
  }
}

+ (int64_t)ctSubscriptionSlotForSubscriptionSlot:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 2) {
    int64_t v3 = 2;
  }
  if (a3) {
    BOOL v4 = a3 <= 2;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int)ctDirectionForTelephonyLinkDirection:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (int64_t)telephonyLinkDirectionForCtDirection:(int)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (void)anbrActivationState:(id)a3 enabled:(BOOL)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 slotID];
  if (v6 == [(CTXPCServiceSubscriptionContext *)self->_ctSubscriptionContext slotID])
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__VCTelephonyInterface_anbrActivationState_enabled___block_invoke;
    block[3] = &unk_1E6DB3DF0;
    block[4] = self;
    BOOL v9 = a4;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __52__VCTelephonyInterface_anbrActivationState_enabled___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      BOOL v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)__int16 v14 = 136315906;
        *(void *)&v14[4] = v3;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCTelephonyInterface anbrActivationState:enabled:]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 403;
        WORD2(v15) = 1024;
        *(_DWORD *)((char *)&v15 + 6) = v5;
        uint64_t v6 = " [%s] %s:%d ANBR activation state enabled=%{BOOL}d";
        __int16 v7 = v4;
        uint32_t v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v14, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)__int16 v14 = 136316418;
        *(void *)&v14[4] = v9;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCTelephonyInterface anbrActivationState:enabled:]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 403;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v2;
        HIWORD(v15) = 2048;
        uint64_t v16 = v11;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = v12;
        uint64_t v6 = " [%s] %s:%d %@(%p) ANBR activation state enabled=%{BOOL}d";
        __int16 v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17, v18), "telephonyInterface:anbrActivationUpdate:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)anbrBitrateRecommendation:(id)a3 bitrate:(id)a4 direction:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a3 slotID];
  if (v8 == [(CTXPCServiceSubscriptionContext *)self->_ctSubscriptionContext slotID])
  {
    if ([a4 unsignedIntValue])
    {
      if (v5)
      {
        int64_t v9 = +[VCTelephonyInterface telephonyLinkDirectionForCtDirection:v5];
        notificationQueue = self->_notificationQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__VCTelephonyInterface_anbrBitrateRecommendation_bitrate_direction___block_invoke;
        block[3] = &unk_1E6DB7288;
        block[4] = self;
        void block[5] = a4;
        int v12 = v5;
        block[6] = v9;
        dispatch_async(notificationQueue, block);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:]();
      }
    }
  }
}

uint64_t __68__VCTelephonyInterface_anbrBitrateRecommendation_bitrate_direction___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      BOOL v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = [*(id *)(a1 + 40) unsignedIntValue];
        int v6 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)uint64_t v16 = 136316162;
        *(void *)&v16[4] = v3;
        *(_WORD *)&v16[12] = 2080;
        *(void *)&v16[14] = "-[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:]_block_invoke";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 419;
        WORD2(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 6) = v5;
        WORD5(v17) = 1024;
        HIDWORD(v17) = v6;
        __int16 v7 = " [%s] %s:%d ANBR bitrate recommendation bitrate=%d direction=%d";
        uint64_t v8 = v4;
        uint32_t v9 = 40;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v16, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = [*(id *)(a1 + 40) unsignedIntValue];
        int v14 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)uint64_t v16 = 136316674;
        *(void *)&v16[4] = v10;
        *(_WORD *)&v16[12] = 2080;
        *(void *)&v16[14] = "-[VCTelephonyInterface anbrBitrateRecommendation:bitrate:direction:]_block_invoke";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 419;
        WORD2(v17) = 2112;
        *(void *)((char *)&v17 + 6) = v2;
        HIWORD(v17) = 2048;
        uint64_t v18 = v12;
        LOWORD(v19) = 1024;
        *(_DWORD *)((char *)&v19 + 2) = v13;
        HIWORD(v19) = 1024;
        LODWORD(v20) = v14;
        __int16 v7 = " [%s] %s:%d %@(%p) ANBR bitrate recommendation bitrate=%d direction=%d";
        uint64_t v8 = v11;
        uint32_t v9 = 60;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v16, *(void *)&v16[16], v17, v18, v19, v20), "telephonyInterface:anbrRecommendation:forDirection:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "unsignedIntValue"), *(void *)(a1 + 48));
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _CTServerConnectionCreateOnTargetQueue failed", v2, v3, v4, v5, v6);
}

- (void)anbrBitrateRecommendation:bitrate:direction:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected bitrate recommendation, ignoring ...", v2, v3, v4, v5, v6);
}

- (void)anbrBitrateRecommendation:bitrate:direction:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unknown direction is not supported", v2, v3, v4, v5, v6);
}

@end