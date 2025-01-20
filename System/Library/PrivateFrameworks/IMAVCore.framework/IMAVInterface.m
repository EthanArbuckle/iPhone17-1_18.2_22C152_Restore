@interface IMAVInterface
+ (id)sharedInstance;
- (BOOL)_submitEndCallMetric:(id)a3 forCallID:(int64_t)a4;
- (BOOL)_submitLoggingInformation:(id)a3 forChat:(id)a4;
- (BOOL)avChat:(id)a3 generateCallInfoForID:(id)a4 service:(id)a5 usingRelay:(BOOL)a6 callInfo:(id)a7;
- (BOOL)isAVInterfaceReady;
- (BOOL)isMuteForAVChat:(id)a3;
- (BOOL)isPausedForAVChat:(id)a3;
- (BOOL)isRemoteMuteForAVChat:(id)a3;
- (BOOL)isSendingAudioForAVChat:(id)a3;
- (BOOL)isSendingVideoForAVChat:(id)a3;
- (BOOL)shouldKeepCameraRunning;
- (BOOL)startPreviewWithError:(id *)a3;
- (BOOL)stopPreview;
- (BOOL)supportsLayers;
- (BOOL)supportsRelay;
- (BOOL)systemCanAudioChat;
- (BOOL)systemCanVideoChat;
- (BOOL)systemSupportsBackFacingCamera;
- (BOOL)systemSupportsFrontFacingCamera;
- (id)_controller;
- (id)avChat:(id)a3 IPAndPortDataWithCallerIP:(id)a4 callerSIPPort:(unsigned int)a5 shouldFindExternalIP:(BOOL)a6;
- (id)avChat:(id)a3 IPAndPortDataWithCallerIPAndPortData:(id)a4 shouldFindExternalIP:(BOOL)a5;
- (id)controller;
- (id)delegate;
- (id)getNatIPFromICEData:(id)a3;
- (id)natTypeForAVChat:(id)a3;
- (int)avChat:(id)a3 endConferenceForUserID:(id)a4;
- (int)endConferenceForAVChat:(id)a3;
- (int64_t)_checkNetworkForChat:(id)a3 requiresWifi:(BOOL)a4;
- (int64_t)_runPingTestForChat:(id)a3;
- (unint64_t)capabilities;
- (unsigned)maxBitrate;
- (unsigned)overallChatState;
- (void)chatStateUpdated;
- (void)dealloc;
- (void)localVideoBackLayer;
- (void)localVideoLayer;
- (void)setDelegate:(id)a3;
- (void)unsetDelegate:(id)a3;
@end

@implementation IMAVInterface

+ (id)sharedInstance
{
  if (qword_26AB796C0 != -1) {
    dispatch_once(&qword_26AB796C0, &unk_26D85A530);
  }
  v2 = (void *)qword_26AB796F0;
  return v2;
}

- (void)dealloc
{
  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)IMAVInterface;
  [(IMAVInterface *)&v3 dealloc];
}

- (unsigned)overallChatState
{
  v5 = objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  unsigned int v10 = objc_msgSend__callState(v5, v6, v7, v8, v9);

  return v10;
}

- (void)chatStateUpdated
{
  objc_msgSend_sharedInstance(IMAVCallManager, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateOverallChatState(v9, v5, v6, v7, v8);
}

- (BOOL)isAVInterfaceReady
{
  return 1;
}

- (void)unsetDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    unsigned int v10 = sub_224FB12A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = v4;
      __int16 v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Unsetting %p as the delegate on %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend_setDelegate_(self, v11, 0, v12, v13);
  }
}

- (BOOL)systemCanVideoChat
{
  return ((unint64_t)objc_msgSend_capabilities(self, a2, v2, v3, v4) >> 18) & 1;
}

- (BOOL)systemCanAudioChat
{
  return ((unint64_t)objc_msgSend_capabilities(self, a2, v2, v3, v4) >> 19) & 1;
}

- (BOOL)systemSupportsFrontFacingCamera
{
  v5 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], a2, v2, v3, v4);
  char v10 = objc_msgSend_supportsFrontFacingCamera(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)systemSupportsBackFacingCamera
{
  v5 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], a2, v2, v3, v4);
  char v10 = objc_msgSend_supportsBackFacingCamera(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isMuteForAVChat:(id)a3
{
  return 0;
}

- (BOOL)isPausedForAVChat:(id)a3
{
  return 0;
}

- (BOOL)isRemoteMuteForAVChat:(id)a3
{
  return 0;
}

- (BOOL)isSendingAudioForAVChat:(id)a3
{
  return 1;
}

- (BOOL)isSendingVideoForAVChat:(id)a3
{
  return 1;
}

- (unint64_t)capabilities
{
  return 0;
}

- (BOOL)startPreviewWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (BOOL)stopPreview
{
  return 1;
}

- (int)endConferenceForAVChat:(id)a3
{
  return -1;
}

- (int)avChat:(id)a3 endConferenceForUserID:(id)a4
{
  return -1;
}

- (BOOL)avChat:(id)a3 generateCallInfoForID:(id)a4 service:(id)a5 usingRelay:(BOOL)a6 callInfo:(id)a7
{
  return 0;
}

- (id)getNatIPFromICEData:(id)a3
{
  return 0;
}

- (id)natTypeForAVChat:(id)a3
{
  return 0;
}

- (id)avChat:(id)a3 IPAndPortDataWithCallerIPAndPortData:(id)a4 shouldFindExternalIP:(BOOL)a5
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263EFF8F8], sel_data, a3, a4, a5);
}

- (id)avChat:(id)a3 IPAndPortDataWithCallerIP:(id)a4 callerSIPPort:(unsigned int)a5 shouldFindExternalIP:(BOOL)a6
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263EFF8F8], sel_data, a3, a4, *(void *)&a5);
}

- (BOOL)supportsLayers
{
  return 0;
}

- (void)localVideoLayer
{
  return 0;
}

- (void)localVideoBackLayer
{
  return 0;
}

- (unsigned)maxBitrate
{
  return 0;
}

- (BOOL)supportsRelay
{
  return 0;
}

- (id)controller
{
  return 0;
}

- (id)_controller
{
  return (id)((uint64_t (*)(IMAVInterface *, char *))MEMORY[0x270F9A6D0])(self, sel_controller);
}

- (BOOL)shouldKeepCameraRunning
{
  return 1;
}

- (BOOL)_submitLoggingInformation:(id)a3 forChat:(id)a4
{
  return 1;
}

- (BOOL)_submitEndCallMetric:(id)a3 forCallID:(int64_t)a4
{
  return 1;
}

- (int64_t)_checkNetworkForChat:(id)a3 requiresWifi:(BOOL)a4
{
  return -1;
}

- (int64_t)_runPingTestForChat:(id)a3
{
  return -1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end