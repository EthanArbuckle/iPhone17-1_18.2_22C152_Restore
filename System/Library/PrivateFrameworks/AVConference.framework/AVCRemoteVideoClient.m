@interface AVCRemoteVideoClient
- (AVCRemoteVideoClient)initWithStreamToken:(int64_t)a3 delegate:(id)a4;
- (AVCRemoteVideoClient)initWithStreamToken:(int64_t)a3 endpointID:(id)a4 delegate:(id)a5;
- (AVCRemoteVideoClientDelegate)delegate;
- (BOOL)createCALayerHostForRootLayer:(id)a3 withContextId:(unsigned int)a4;
- (BOOL)hasReceivedFirstFrame;
- (BOOL)hasReceivedLastFrame;
- (BOOL)isMediaStalled;
- (BOOL)isNetworkDegraded;
- (BOOL)isNetworkDegradedLocal;
- (BOOL)isTransformForRemoteVideoOrientationEnabled;
- (BOOL)isVideoDegraded;
- (BOOL)isVideoPaused;
- (BOOL)isVideoSuspended;
- (BOOL)setVideoLayerHost:(id)a3 forMode:(int)a4;
- (BOOL)shouldDisplayVideoInfoLayer;
- (NSString)connectionTypeString;
- (VideoAttributes)remoteScreenAttributes;
- (VideoAttributes)remoteVideoAttributes;
- (id)findInfoSubLayerFromLayer:(id)a3;
- (id)newXPCObjectForFenceHandle:(id *)a3;
- (id)slotForMode:(int)a3;
- (id)subLayerForMode:(int)a3;
- (id)subLayerRefForMode:(int)a3;
- (int64_t)streamToken;
- (void)adjustInfoSubLayerBounds:(CGRect)a3 forSuperLayer:(id)a4;
- (void)checkpointDidReceiveFirstFrame;
- (void)checkpointVideoAttributesDidChange;
- (void)cleanupLayerHost;
- (void)cleanupSubLayerForMode:(int)a3;
- (void)cleanupVideoLayerForAllModes;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)drawText:(id)a3 inSubLayer:(id)a4;
- (void)insertInfoSubLayerIntoLayer:(id)a3 videoMode:(int)a4;
- (void)insertSubLayerInLayer:(id)a3 videoMode:(int)a4 videoSlot:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerBlocksForNotifications;
- (void)setActiveVideoLayerForMode:(int)a3;
- (void)setActiveVideoModeFromRemoteVideoAttribute:(id)a3;
- (void)setConnectionTypeString:(id)a3;
- (void)setHasReceivedFirstFrame:(BOOL)a3;
- (void)setHasReceivedLastFrame:(BOOL)a3;
- (void)setIsMediaStalled:(BOOL)a3;
- (void)setIsNetworkDegraded:(BOOL)a3;
- (void)setIsNetworkDegradedLocal:(BOOL)a3;
- (void)setIsVideoDegraded:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setIsVideoSuspended:(BOOL)a3;
- (void)setLayerHostBounds:(CGRect)a3;
- (void)setRemoteScreenAttributes:(id)a3;
- (void)setRemoteVideoAttributes:(id)a3;
- (void)setRemoteVideoLayerBounds:(CGRect)a3;
- (void)setRootLayer:(id)a3;
- (void)setShouldDisplayVideoInfoLayer:(BOOL)a3;
- (void)setTransformForRemoteVideoOrientationEnabled:(BOOL)a3;
- (void)setVideoLayer:(id)a3 forMode:(int)a4;
- (void)terminateConnection;
- (void)updateConnectionInfoWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4;
@end

@implementation AVCRemoteVideoClient

- (AVCRemoteVideoClient)initWithStreamToken:(int64_t)a3 delegate:(id)a4
{
  return [(AVCRemoteVideoClient *)self initWithStreamToken:a3 endpointID:0 delegate:a4];
}

- (AVCRemoteVideoClient)initWithStreamToken:(int64_t)a3 endpointID:(id)a4 delegate:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)AVCRemoteVideoClient;
  v8 = [(AVCRemoteVideoClient *)&v22 init];
  if (v8)
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCRemoteVideoClient-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = v9;
        __int16 v25 = 2080;
        v26 = "-[AVCRemoteVideoClient initWithStreamToken:endpointID:delegate:]";
        __int16 v27 = 1024;
        int v28 = 151;
        __int16 v29 = 2048;
        v30 = v8;
        __int16 v31 = 2048;
        int64_t v32 = a3;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-init (%p) streamToken=%ld", buf, 0x30u);
      }
    }
    VRTraceReset();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v8->_avcRemoteVideoQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.remotevideo", 0, CustomRootQueue);
    v8->_activeVideoMode = 0;
    v8->_streamToken = a3;
    v8->_transformForRemoteVideoOrientationEnabled = 1;
    BOOL v12 = [+[VCDefaults sharedInstance] shouldDisplayVideoInfoLayer];
    v8->_shouldDisplayVideoInfoLayer = v12;
    if (v12 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = v13;
        __int16 v25 = 2080;
        v26 = "-[AVCRemoteVideoClient initWithStreamToken:endpointID:delegate:]";
        __int16 v27 = 1024;
        int v28 = 161;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video info layer is enabled.", buf, 0x1Cu);
      }
    }
    v8->_connection = objc_alloc_init(AVConferenceXPCClient);
    objc_storeWeak(&v8->_delegate, a5);
    v15 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v15, @"conferenceCallID", 0);
    id v17 = [(AVConferenceXPCClient *)v8->_connection sendMessageSync:"vcRemoteVideoInitializeRemoteVideoForStreamToken" arguments:v16 xpcArguments:a4];
    if (v17)
    {
      v18 = v17;
      char v19 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"vcRemoteVideoInitialized"), "BOOLValue");
      uint64_t v20 = [v18 objectForKeyedSubscript:@"vcRemoteVideoSlotsForModes"];
      if (v19)
      {
        v8->_slotsForModes = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v20];
        [(AVCRemoteVideoClient *)v8 registerBlocksForNotifications];
        [(AVConferenceXPCClient *)v8->_connection sendMessageAsync:"vcRemoteVideoGetCachedNotifications" arguments:v16];

        return v8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient initWithStreamToken:endpointID:delegate:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRemoteVideoClient initWithStreamToken:endpointID:delegate:]();
      }
    }

    return 0;
  }
  return v8;
}

- (void)cleanupVideoLayerForAllModes
{
  [(AVCRemoteVideoClient *)self setVideoLayer:0 forMode:0];
  [(AVCRemoteVideoClient *)self setVideoLayer:0 forMode:1];

  [(AVCRemoteVideoClient *)self setVideoLayer:0 forMode:2];
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  if (self->_layerHostMode)
  {
    [(AVCRemoteVideoClient *)self cleanupLayerHost];
    [(AVCRemoteVideoClient *)self setRootLayer:0];
  }
  [(AVCRemoteVideoClient *)self cleanupVideoLayerForAllModes];
  [(AVCRemoteVideoClient *)self terminateConnection];

  avcRemoteVideoQueue = self->_avcRemoteVideoQueue;
  if (avcRemoteVideoQueue)
  {
    dispatch_release(avcRemoteVideoQueue);
    self->_avcRemoteVideoQueue = 0;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCRemoteVideoClient-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      BOOL layerHostMode = self->_layerHostMode;
      int activeVideoMode = self->_activeVideoMode;
      *(_DWORD *)buf = 136316674;
      uint64_t v11 = v4;
      __int16 v12 = 2080;
      uint64_t v13 = "-[AVCRemoteVideoClient dealloc]";
      __int16 v14 = 1024;
      int v15 = 247;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 1024;
      int v19 = streamToken;
      __int16 v20 = 1024;
      BOOL v21 = layerHostMode;
      __int16 v22 = 1024;
      int v23 = activeVideoMode;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-dealloc (%p) streamToken=%u layerHostMode=%d activeVideoMode=%d", buf, 0x38u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)AVCRemoteVideoClient;
  [(AVCRemoteVideoClient *)&v9 dealloc];
}

- (AVCRemoteVideoClientDelegate)delegate
{
  return (AVCRemoteVideoClientDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setVideoLayer:(id)a3 forMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136316162;
      uint64_t v19 = v7;
      __int16 v20 = 2080;
      BOOL v21 = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
      __int16 v22 = 1024;
      int v23 = 256;
      __int16 v24 = 2112;
      id v25 = a3;
      __int16 v26 = 1024;
      int v27 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoLayer=%@, mode=%d", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v11 = "<nil>";
      }
      int v18 = 136316162;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      BOOL v21 = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
      __int16 v22 = 1024;
      int v23 = 257;
      __int16 v24 = 2080;
      id v25 = (id)v11;
      __int16 v26 = 1024;
      int v27 = v4;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: setVideoLayer %s for mode %d", (uint8_t *)&v18, 0x2Cu);
    }
  }
  [(AVCRemoteVideoClient *)self cleanupSubLayerForMode:v4];
  if (v4 == 2)
  {
    screenLayer = self->_screenLayer;
    self->_screenLayer = (CALayer *)a3;
  }
  else if (v4 == 1)
  {
    screenLayer = self->_secondaryCameraLayer;
    self->_secondaryCameraLayer = (CALayer *)a3;
  }
  else if (v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRemoteVideoClient setVideoLayer:forMode:]();
      }
    }
    screenLayer = 0;
  }
  else
  {
    screenLayer = self->_primaryCameraLayer;
    self->_primaryCameraLayer = (CALayer *)a3;
  }

  if (a3)
  {
    id v13 = -[NSDictionary objectForKeyedSubscript:](self->_slotsForModes, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", v4), "stringValue"));
    if (v13)
    {
      __int16 v14 = v13;
      [MEMORY[0x1E4F39CF8] begin];
      [(AVCRemoteVideoClient *)self insertSubLayerInLayer:a3 videoMode:v4 videoSlot:v14];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        __int16 v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v14 unsignedLongValue];
          int v18 = 136316418;
          uint64_t v19 = v15;
          __int16 v20 = 2080;
          BOOL v21 = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
          __int16 v22 = 1024;
          int v23 = 286;
          __int16 v24 = 2048;
          id v25 = a3;
          __int16 v26 = 1024;
          int v27 = v4;
          __int16 v28 = 2048;
          uint64_t v29 = v17;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: connect layer %p mode=%d with  <--> slot %lu", (uint8_t *)&v18, 0x36u);
        }
      }
      [(AVCRemoteVideoClient *)self setActiveVideoLayerForMode:self->_activeVideoMode];
      [(AVCRemoteVideoClient *)self insertInfoSubLayerIntoLayer:a3 videoMode:v4];
      [MEMORY[0x1E4F39CF8] commit];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRemoteVideoClient setVideoLayer:forMode:]();
      }
    }
  }
}

- (id)slotForMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCRemoteVideoClient slotForMode:]";
      __int16 v15 = 1024;
      int v16 = 313;
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d", (uint8_t *)&v11, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCRemoteVideoClient slotForMode:]";
      __int16 v15 = 1024;
      int v16 = 314;
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: slotForMode %d", (uint8_t *)&v11, 0x22u);
    }
  }
  id v9 = -[NSDictionary objectForKeyedSubscript:](self->_slotsForModes, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", v3), "stringValue"));
  if (!v9 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCRemoteVideoClient slotForMode:]();
    }
  }
  return v9;
}

- (void)setRootLayer:(id)a3
{
  self->_primaryCameraLayer = (CALayer *)a3;
}

- (void)setLayerHostBounds:(CGRect)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_caLayerHost)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    if (!CGRectIsNull(a3))
    {
      v24.origin.double x = x;
      v24.origin.double y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      if (!CGRectIsEmpty(v24))
      {
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        if (!CGRectEqualToRect(v25, *MEMORY[0x1E4F1DB28]))
        {
          -[VCCALayerHost setFrame:](self->_caLayerHost, "setFrame:", x, y, width, height);
          caLayerHost = self->_caLayerHost;
          -[VCCALayerHost setPosition:](caLayerHost, "setPosition:", width * 0.5, height * 0.5);
        }
      }
    }
  }
  else if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRemoteVideoClient setLayerHostBounds:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v9 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      id v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        __int16 v15 = "-[AVCRemoteVideoClient setLayerHostBounds:]";
        __int16 v16 = 1024;
        int v17 = 329;
        __int16 v18 = 2112;
        uint64_t v19 = v9;
        __int16 v20 = 2048;
        BOOL v21 = self;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid CALayerHost instance", (uint8_t *)&v12, 0x30u);
      }
    }
  }
}

- (BOOL)createCALayerHostForRootLayer:(id)a3 withContextId:(unsigned int)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3 || (uint64_t v5 = *(void *)&a4, !a4))
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]();
        }
      }
      goto LABEL_43;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v20 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_43;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    CGRect v24 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v23;
    __int16 v31 = 2080;
    int64_t v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    __int16 v33 = 1024;
    int v34 = 342;
    __int16 v35 = 2112;
    id v36 = v20;
    __int16 v37 = 2048;
    v38 = self;
    CGRect v25 = " [%s] %s:%d %@(%p) Invalid rootLayer or contextId";
    goto LABEL_50;
  }
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"AVCRemoteVideoCALayerHost%p", self);
  if (!v7)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]();
        }
      }
      goto LABEL_43;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v21 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v26 = VRTraceErrorLogLevelToCSTR(),
          CGRect v24 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_43:
      v8 = 0;
LABEL_44:
      BOOL v18 = 0;
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v26;
    __int16 v31 = 2080;
    int64_t v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    __int16 v33 = 1024;
    int v34 = 344;
    __int16 v35 = 2112;
    id v36 = v21;
    __int16 v37 = 2048;
    v38 = self;
    CGRect v25 = " [%s] %s:%d %@(%p) Failed to allocate layer host name";
LABEL_50:
    _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x30u);
    goto LABEL_43;
  }
  v8 = (void *)v7;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v9 = [[VCCALayerHost alloc] initWithRemoteVideoClient:self];
  self->_caLayerHost = v9;
  if (!v9)
  {
    [MEMORY[0x1E4F39CF8] commit];
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v22 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v22 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        __int16 v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v30 = v27;
          __int16 v31 = 2080;
          int64_t v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
          __int16 v33 = 1024;
          int v34 = 353;
          __int16 v35 = 2112;
          id v36 = v22;
          __int16 v37 = 2048;
          v38 = self;
          _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate CALayerHost", buf, 0x30u);
        }
      }
    }
    goto LABEL_44;
  }
  [(CALayerHost *)v9 setContextId:v5];
  [a3 bounds];
  -[AVCRemoteVideoClient setLayerHostBounds:](self, "setLayerHostBounds:");
  [(VCCALayerHost *)self->_caLayerHost setName:v8];
  [(CALayerHost *)self->_caLayerHost setPreservesFlip:1];
  [(VCCALayerHost *)self->_caLayerHost setGeometryFlipped:1];
  [(VCCALayerHost *)self->_caLayerHost setAllowsHitTesting:0];
  [a3 addSublayer:self->_caLayerHost];
  [a3 setMasksToBounds:1];
  [a3 setContinuousCorners:1];
  [a3 setAllowsHitTesting:0];
  [a3 setName:@"RemoteParticipantVideoLayerScreen"];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] synchronize];
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_16;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v30 = v11;
    __int16 v31 = 2080;
    int64_t v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    __int16 v33 = 1024;
    int v34 = 370;
    __int16 v35 = 2048;
    id v36 = a3;
    __int16 v37 = 1024;
    LODWORD(v38) = v5;
    uint64_t v13 = " [%s] %s:%d AVCRemoteVideoClient: connect layer=%p with  <--> contextId=%u";
    __int16 v14 = v12;
    uint32_t v15 = 44;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_16;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    int v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v30 = v16;
    __int16 v31 = 2080;
    int64_t v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    __int16 v33 = 1024;
    int v34 = 370;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2048;
    v38 = self;
    __int16 v39 = 2048;
    id v40 = a3;
    __int16 v41 = 1024;
    int v42 = v5;
    uint64_t v13 = " [%s] %s:%d %@(%p) AVCRemoteVideoClient: connect layer=%p with  <--> contextId=%u";
    __int16 v14 = v17;
    uint32_t v15 = 64;
  }
  _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_16:
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (id)newXPCObjectForFenceHandle:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_5;
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F39BB8] newFenceFromDefaultServer];
  *a3 = v5;
  if (v5)
  {
    if (objc_msgSend((id)-[VCCALayerHost context](self->_caLayerHost, "context"), "addFence:", *a3))
    {
      id result = (id)[*a3 createXPCRepresentation];
      if (result) {
        return result;
      }
      goto LABEL_5;
    }
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      uint64_t v11 = (__CFString *)*a3;
      caLayerHost = self->_caLayerHost;
      int v22 = 136316418;
      uint64_t v23 = v9;
      __int16 v24 = 2080;
      CGRect v25 = "-[AVCRemoteVideoClient newXPCObjectForFenceHandle:]";
      __int16 v26 = 1024;
      int v27 = 386;
      __int16 v28 = 2048;
      uint64_t v29 = v11;
      __int16 v30 = 2048;
      __int16 v31 = (AVCRemoteVideoClient *)caLayerHost;
      __int16 v32 = 2048;
      uint64_t v33 = [(VCCALayerHost *)caLayerHost context];
      uint64_t v13 = " [%s] %s:%d Failed to add fence=%p for root layer=%p with context=%p";
      __int16 v14 = v10;
      uint32_t v15 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      id v20 = *a3;
      BOOL v21 = self->_caLayerHost;
      int v22 = 136316930;
      uint64_t v23 = v18;
      __int16 v24 = 2080;
      CGRect v25 = "-[AVCRemoteVideoClient newXPCObjectForFenceHandle:]";
      __int16 v26 = 1024;
      int v27 = 386;
      __int16 v28 = 2112;
      uint64_t v29 = v8;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2048;
      uint64_t v33 = (uint64_t)v20;
      __int16 v34 = 2048;
      __int16 v35 = v21;
      __int16 v36 = 2048;
      uint64_t v37 = [(VCCALayerHost *)v21 context];
      uint64_t v13 = " [%s] %s:%d %@(%p) Failed to add fence=%p for root layer=%p with context=%p";
      __int16 v14 = v19;
      uint32_t v15 = 78;
    }
    goto LABEL_28;
  }
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCRemoteVideoClient newXPCObjectForFenceHandle:]();
      }
    }
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    int v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v22 = 136316162;
      uint64_t v23 = v16;
      __int16 v24 = 2080;
      CGRect v25 = "-[AVCRemoteVideoClient newXPCObjectForFenceHandle:]";
      __int16 v26 = 1024;
      int v27 = 383;
      __int16 v28 = 2112;
      uint64_t v29 = v7;
      __int16 v30 = 2048;
      __int16 v31 = self;
      uint64_t v13 = " [%s] %s:%d %@(%p) Failed to create new fence";
      __int16 v14 = v17;
      uint32_t v15 = 48;
LABEL_28:
      _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_5:
  id result = *a3;
  if (*a3)
  {
    [result invalidate];

    id result = 0;
    *a3 = 0;
  }
  return result;
}

- (void)setRemoteVideoLayerBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v44 = 0;
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v60.origin.double x = x;
        v60.origin.double y = y;
        v60.size.double width = width;
        v60.size.double height = height;
        *(_DWORD *)buf = 136315906;
        uint64_t v48 = v9;
        __int16 v49 = 2080;
        v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
        __int16 v51 = 1024;
        int v52 = 405;
        __int16 v53 = 2112;
        p_isa = NSStringFromRect(v60);
        uint64_t v11 = " [%s] %s:%d bounds=%@";
        int v12 = v10;
        uint32_t v13 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v8 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v61.origin.double x = x;
        v61.origin.double y = y;
        v61.size.double width = width;
        v61.size.double height = height;
        *(_DWORD *)buf = 136316418;
        uint64_t v48 = v14;
        __int16 v49 = 2080;
        v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
        __int16 v51 = 1024;
        int v52 = 405;
        __int16 v53 = 2112;
        p_isa = &v8->isa;
        __int16 v55 = 2048;
        v56 = self;
        __int16 v57 = 2112;
        v58 = NSStringFromRect(v61);
        uint64_t v11 = " [%s] %s:%d %@(%p) bounds=%@";
        int v12 = v15;
        uint32_t v13 = 58;
        goto LABEL_11;
      }
    }
  }
  if (!VideoUtil_LayerBoundsAreValid(x, y, width, height))
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        __int16 v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.5(x, y, width, height, v31, v32);
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      CGRect v25 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      CGRect v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_67;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    __int16 v34 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v63.origin.double x = x;
    v63.origin.double y = y;
    v63.size.double width = width;
    v63.size.double height = height;
    __int16 v35 = NSStringFromRect(v63);
    *(_DWORD *)buf = 136316418;
    uint64_t v48 = v33;
    __int16 v49 = 2080;
    v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
    __int16 v51 = 1024;
    int v52 = 406;
    __int16 v53 = 2112;
    p_isa = &v25->isa;
    __int16 v55 = 2048;
    v56 = self;
    __int16 v57 = 2112;
    v58 = v35;
    __int16 v36 = " [%s] %s:%d %@(%p) Failed due to invalid root layer bounds=%@";
    uint64_t v37 = v34;
    uint32_t v38 = 58;
LABEL_75:
    _os_log_error_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
    goto LABEL_67;
  }
  if (!self->_caLayerHost)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:]();
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v26 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_67;
    }
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    id v40 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v48 = v39;
    __int16 v49 = 2080;
    v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
    __int16 v51 = 1024;
    int v52 = 407;
    __int16 v53 = 2112;
    p_isa = &v26->isa;
    __int16 v55 = 2048;
    v56 = self;
    __int16 v36 = " [%s] %s:%d %@(%p) CALayerHost invalid";
LABEL_74:
    uint64_t v37 = v40;
    uint32_t v38 = 48;
    goto LABEL_75;
  }
  v62.origin.double x = x;
  v62.origin.double y = y;
  v62.size.double width = width;
  v62.size.double height = height;
  uint64_t v16 = NSStringFromRect(v62);
  uint64_t v17 = [objc_alloc(NSNumber) initWithInteger:self->_streamToken];
  if (!v17)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:]();
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      int v27 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      int v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v41 = VRTraceErrorLogLevelToCSTR(),
          id v40 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_67:
      BOOL v21 = 0;
      uint64_t v18 = 0;
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v48 = v41;
    __int16 v49 = 2080;
    v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
    __int16 v51 = 1024;
    int v52 = 413;
    __int16 v53 = 2112;
    p_isa = &v27->isa;
    __int16 v55 = 2048;
    v56 = self;
    __int16 v36 = " [%s] %s:%d %@(%p) Failed to allocate stream token number";
    goto LABEL_74;
  }
  uint64_t v18 = (void *)v17;
  v45[0] = @"conferenceCallID";
  v45[1] = @"conferenceVisualRectangle";
  v46[0] = v17;
  v46[1] = v16;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  id v20 = [(AVCRemoteVideoClient *)self newXPCObjectForFenceHandle:&v44];
  if (v20)
  {
    BOOL v21 = v20;
    id v22 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcRemoteVideoSetLayerBoundsForStreamToken" arguments:v19 xpcArguments:v20];
    if (!v22
      || (uint64_t v23 = v22, [v22 objectForKeyedSubscript:@"ERROR"])
      || [v23 objectForKeyedSubscript:@"SERVERDIED"])
    {
      if ((AVCRemoteVideoClient *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.4();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v24 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v24 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          __int16 v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v48 = v29;
            __int16 v49 = 2080;
            v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
            __int16 v51 = 1024;
            int v52 = 425;
            __int16 v53 = 2112;
            p_isa = &v24->isa;
            __int16 v55 = 2048;
            v56 = self;
            _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Set layer bounds xpc call failed", buf, 0x30u);
          }
        }
      }
    }
  }
  else
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v28 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        uint64_t v43 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v48 = v42;
          __int16 v49 = 2080;
          v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
          __int16 v51 = 1024;
          int v52 = 421;
          __int16 v53 = 2112;
          p_isa = &v28->isa;
          __int16 v55 = 2048;
          v56 = self;
          _os_log_error_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create XPC representation for fence", buf, 0x30u);
        }
      }
    }
    BOOL v21 = 0;
  }
LABEL_19:
  if (v44)
  {
    [v44 invalidate];

    id v44 = 0;
  }
}

- (void)setTransformForRemoteVideoOrientationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v6;
        __int16 v23 = 2080;
        __int16 v24 = "-[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]";
        __int16 v25 = 1024;
        int v26 = 442;
        __int16 v27 = 1024;
        LODWORD(v28) = v3;
        v8 = " [%s] %s:%d transformForRemoteVideoOrientationEnabled=%d";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v11;
        __int16 v23 = 2080;
        __int16 v24 = "-[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]";
        __int16 v25 = 1024;
        int v26 = 442;
        __int16 v27 = 2112;
        __int16 v28 = v5;
        __int16 v29 = 2048;
        __int16 v30 = self;
        __int16 v31 = 1024;
        BOOL v32 = v3;
        v8 = " [%s] %s:%d %@(%p) transformForRemoteVideoOrientationEnabled=%d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_transformForRemoteVideoOrientationEnabled = v3;
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", self->_streamToken, @"conferenceCallID");
  v19[1] = @"conferenceTransformForRemoteVideoOrientationEnabled";
  v20[0] = v13;
  v20[1] = [NSNumber numberWithBool:v3];
  id v14 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcRemoteVideoSetTransformForRemoteVideoOrientationEnabled", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2]);
  if (!v14
    || (uint32_t v15 = v14, [v14 objectForKeyedSubscript:@"ERROR"])
    || [v15 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v17;
          __int16 v23 = 2080;
          __int16 v24 = "-[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]";
          __int16 v25 = 1024;
          int v26 = 453;
          __int16 v27 = 2112;
          __int16 v28 = v16;
          __int16 v29 = 2048;
          __int16 v30 = self;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Set transformForRemoteVideoOrientationEnabled xpc call failed", buf, 0x30u);
        }
      }
    }
  }
}

- (BOOL)setVideoLayerHost:(id)a3 forMode:(int)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [a3 bounds];
        *(_DWORD *)buf = 136316162;
        uint64_t v51 = v7;
        __int16 v52 = 2080;
        __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
        __int16 v54 = 1024;
        int v55 = 470;
        __int16 v56 = 2112;
        id v57 = a3;
        __int16 v58 = 2112;
        uint64_t v59 = (AVCRemoteVideoClient *)NSStringFromRect(v65);
        uint64_t v9 = " [%s] %s:%d rootLayer=%@ bounds=%@";
        uint32_t v10 = v8;
        uint32_t v11 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [a3 bounds];
        *(_DWORD *)buf = 136316674;
        uint64_t v51 = v12;
        __int16 v52 = 2080;
        __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
        __int16 v54 = 1024;
        int v55 = 470;
        __int16 v56 = 2112;
        id v57 = v6;
        __int16 v58 = 2048;
        uint64_t v59 = self;
        __int16 v60 = 2112;
        id v61 = a3;
        __int16 v62 = 2112;
        NSRect v63 = NSStringFromRect(v66);
        uint64_t v9 = " [%s] %s:%d %@(%p) rootLayer=%@ bounds=%@";
        uint32_t v10 = v13;
        uint32_t v11 = 68;
        goto LABEL_11;
      }
    }
  }
  if (!a3)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:]();
        }
      }
      goto LABEL_74;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_74;
    }
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    __int16 v35 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v51 = v34;
    __int16 v52 = 2080;
    __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    __int16 v54 = 1024;
    int v55 = 471;
    __int16 v56 = 2112;
    id v57 = v25;
    __int16 v58 = 2048;
    uint64_t v59 = self;
    __int16 v36 = " [%s] %s:%d %@(%p) Invalid rootLayer parameter";
    goto LABEL_93;
  }
  if (self->_caLayerHost)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.7();
        }
      }
      goto LABEL_74;
    }
    if (objc_opt_respondsToSelector()) {
      int v26 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      int v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_74;
    }
    uint64_t v37 = VRTraceErrorLogLevelToCSTR();
    __int16 v35 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v51 = v37;
    __int16 v52 = 2080;
    __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    __int16 v54 = 1024;
    int v55 = 472;
    __int16 v56 = 2112;
    id v57 = v26;
    __int16 v58 = 2048;
    uint64_t v59 = self;
    __int16 v36 = " [%s] %s:%d %@(%p) CALayerHost exist already, reconfigure not supported currently";
    goto LABEL_93;
  }
  self->_BOOL layerHostMode = 1;
  [a3 bounds];
  id v14 = NSStringFromRect(v67);
  uint64_t v15 = [objc_alloc(NSNumber) initWithInteger:self->_streamToken];
  if (!v15)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:]();
        }
      }
      goto LABEL_74;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v38 = VRTraceErrorLogLevelToCSTR(),
          __int16 v35 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_74:
      uint64_t v18 = 0;
      uint64_t v16 = 0;
      goto LABEL_91;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v51 = v38;
    __int16 v52 = 2080;
    __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    __int16 v54 = 1024;
    int v55 = 478;
    __int16 v56 = 2112;
    id v57 = v27;
    __int16 v58 = 2048;
    uint64_t v59 = self;
    __int16 v36 = " [%s] %s:%d %@(%p) Failed to allocate stream token number";
LABEL_93:
    _os_log_error_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_ERROR, v36, buf, 0x30u);
    goto LABEL_74;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v15, @"conferenceCallID", v14, @"conferenceVisualRectangle", 0);
  if (!v17)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v28 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        id v40 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v51 = v39;
          __int16 v52 = 2080;
          __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
          __int16 v54 = 1024;
          int v55 = 480;
          __int16 v56 = 2112;
          id v57 = v28;
          __int16 v58 = 2048;
          uint64_t v59 = self;
          _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate args dictionary", buf, 0x30u);
        }
      }
    }
    uint64_t v18 = 0;
    goto LABEL_91;
  }
  uint64_t v18 = (void *)v17;
  id v19 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcRemoteVideoGetContextIdForStreamToken" arguments:v17];
  if (!v19)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        uint64_t v33 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.4(v32, v16, v33);
        }
      }
      goto LABEL_91;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v29 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_91;
    }
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    uint64_t v42 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    int v43 = [v16 unsignedIntValue];
    *(_DWORD *)buf = 136316418;
    uint64_t v51 = v41;
    __int16 v52 = 2080;
    __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    __int16 v54 = 1024;
    int v55 = 482;
    __int16 v56 = 2112;
    id v57 = v29;
    __int16 v58 = 2048;
    uint64_t v59 = self;
    __int16 v60 = 1024;
    LODWORD(v61) = v43;
    id v44 = " [%s] %s:%d %@(%p) GetContextIdForStreamToken=%u failed";
    v45 = v42;
    uint32_t v46 = 54;
LABEL_96:
    _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
    goto LABEL_91;
  }
  uint64_t v20 = [v19 objectForKeyedSubscript:@"vcRemoteVideoSlotsForModes"];
  if (!v20)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.5();
        }
      }
      goto LABEL_91;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v30 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_91;
    }
    uint64_t v47 = VRTraceErrorLogLevelToCSTR();
    uint64_t v48 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_91;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v51 = v47;
    __int16 v52 = 2080;
    __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    __int16 v54 = 1024;
    int v55 = 484;
    __int16 v56 = 2112;
    id v57 = v30;
    __int16 v58 = 2048;
    uint64_t v59 = self;
    id v44 = " [%s] %s:%d %@(%p) Invalid contextIdForModes dictionary returned";
LABEL_95:
    v45 = v48;
    uint32_t v46 = 48;
    goto LABEL_96;
  }
  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v20];
  if (!v21)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.6();
        }
      }
      goto LABEL_91;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v31 = (__CFString *)[(AVCRemoteVideoClient *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v31 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v49 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v48 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_91:
      BOOL v23 = 0;
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v51 = v49;
    __int16 v52 = 2080;
    __int16 v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    __int16 v54 = 1024;
    int v55 = 486;
    __int16 v56 = 2112;
    id v57 = v31;
    __int16 v58 = 2048;
    uint64_t v59 = self;
    id v44 = " [%s] %s:%d %@(%p) Failed to allocate slotsForModes dictionary";
    goto LABEL_95;
  }
  uint64_t v22 = (NSDictionary *)v21;

  self->_slotsForModes = v22;
  BOOL v23 = -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:](self, "createCALayerHostForRootLayer:withContextId:", a3, objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", objc_msgSend(&unk_1F3DC66A8, "stringValue")), "unsignedIntValue"));
  [(AVCRemoteVideoClient *)self setRootLayer:a3];
LABEL_20:

  return v23;
}

- (void)insertSubLayerInLayer:(id)a3 videoMode:(int)a4 videoSlot:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 && a5)
  {
    uint64_t v6 = *(void *)&a4;
    uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"AVCRemoteVideoSubLayer%p(%d)", self, *(void *)&a4);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint32_t v10 = (void *)[a3 sublayers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
LABEL_5:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
        if (objc_msgSend((id)objc_msgSend(v15, "name"), "isEqualToString:", v9)) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_13;
        }
      }
      if (v15) {
        goto LABEL_14;
      }
    }
LABEL_13:
    uint64_t v15 = (void *)[MEMORY[0x1E4F39BE8] layer];
    [a3 addSublayer:v15];
LABEL_14:
    [a3 bounds];
    double v17 = v16;
    double v19 = v18;
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v18, v16);
    objc_msgSend(v15, "setPosition:", v17 * 0.5, v19 * 0.5);
    CGAffineTransformMakeRotation(&m, 1.57079633);
    CATransform3DMakeAffineTransform(&v22, &m);
    [v15 setTransform:&v22];
    [v15 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
    [v15 setName:v9];
    objc_msgSend(v15, "setContents:", objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", objc_msgSend(a5, "intValue")));
    [v15 setMasksToBounds:1];
    uint64_t v20 = [(AVCRemoteVideoClient *)self subLayerRefForMode:v6];
    if (v20) {
      *uint64_t v20 = v15;
    }
  }
}

- (id)subLayerRefForMode:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      return (id *)&self->_screenSubLayer;
    case 1:
      return (id *)&self->_secondaryCameraSubLayer;
    case 0:
      return (id *)&self->_primaryCameraSubLayer;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint32_t v10 = "-[AVCRemoteVideoClient subLayerRefForMode:]";
      __int16 v11 = 1024;
      int v12 = 639;
      __int16 v13 = 1024;
      int v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid video mode:%d", (uint8_t *)&v7, 0x22u);
    }
  }
  return 0;
}

- (id)subLayerForMode:(int)a3
{
  id result = [(AVCRemoteVideoClient *)self subLayerRefForMode:*(void *)&a3];
  if (result) {
    return *(id *)result;
  }
  return result;
}

- (void)setActiveVideoLayerForMode:(int)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke;
  block[3] = &unk_1E6DB3F08;
  int v4 = a3;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v3 = a1 + 40;
  int v2 = *(_DWORD *)(a1 + 40);
  switch(v2)
  {
    case 2:
      [*(id *)(*(void *)(a1 + 32) + 64) setAllowsDisplayCompositing:1];
      [*(id *)(*(void *)(a1 + 32) + 48) setAllowsDisplayCompositing:0];
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
LABEL_8:
      [v5 setAllowsDisplayCompositing:0];
      return [MEMORY[0x1E4F39CF8] commit];
    case 1:
      [*(id *)(*(void *)(a1 + 32) + 56) setAllowsDisplayCompositing:1];
      int v4 = *(void **)(*(void *)(a1 + 32) + 48);
      goto LABEL_7;
    case 0:
      [*(id *)(*(void *)(a1 + 32) + 48) setAllowsDisplayCompositing:1];
      int v4 = *(void **)(*(void *)(a1 + 32) + 56);
LABEL_7:
      [v4 setAllowsDisplayCompositing:0];
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 64);
      goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke_cold_1(v7, v3, v8);
    }
  }
  return [MEMORY[0x1E4F39CF8] commit];
}

- (void)cleanupSubLayerForMode:(int)a3
{
  int v4 = [(AVCRemoteVideoClient *)self subLayerRefForMode:*(void *)&a3];
  if (v4)
  {
    uint64_t v5 = v4;
    if (*v4)
    {
      if ([(AVCRemoteVideoClient *)self shouldDisplayVideoInfoLayer]) {
        objc_msgSend((id)objc_msgSend(*v5, "superlayer"), "removeObserver:forKeyPath:", self, @"bounds");
      }
      [*v5 setContents:0];
      [*v5 removeFromSuperlayer];

      id *v5 = 0;
    }
  }
}

- (void)cleanupLayerHost
{
  caLayerHost = self->_caLayerHost;
  if (caLayerHost)
  {
    [(VCCALayerHost *)caLayerHost removeFromSuperlayer];

    self->_caLayerHost = 0;
  }
}

- (void)terminateConnection
{
  self->_connection = 0;
}

- (void)setActiveVideoModeFromRemoteVideoAttribute:(id)a3
{
  if ([a3 videoSourceScreen])
  {
    int v5 = 2;
  }
  else
  {
    int v6 = [a3 camera];
    if (v6 == 1) {
      int v5 = 1;
    }
    else {
      int v5 = -1;
    }
    if (!v6) {
      int v5 = 0;
    }
  }
  self->_int activeVideoMode = v5;
}

- (void)registerBlocksForNotifications
{
  v14[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke;
  v14[3] = &unk_1E6DB4338;
  v14[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"conferenceDidServerDie" block:v14 queue:self->_avcRemoteVideoQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_73;
  v13[3] = &unk_1E6DB4338;
  v13[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidReceiveRemoteFrame" block:v13 queue:self->_avcRemoteVideoQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_77;
  v12[3] = &unk_1E6DB4338;
  v12[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidRemoteScreenAttributesChange" block:v12 queue:self->_avcRemoteVideoQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_85;
  v11[3] = &unk_1E6DB4338;
  v11[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidRemoteAttributesChange" block:v11 queue:self->_avcRemoteVideoQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_92;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidRemoteVideoPause" block:v10 queue:self->_avcRemoteVideoQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_99;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidRemoteMediaStall" block:v9 queue:self->_avcRemoteVideoQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_106;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidVideoDegrade" block:v8 queue:self->_avcRemoteVideoQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_113;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidNetworkDegrade" block:v7 queue:self->_avcRemoteVideoQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_123;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidVideoSuspend" block:v6 queue:self->_avcRemoteVideoQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_130;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidReleaseRemoteVideoQueue" block:v5 queue:self->_avcRemoteVideoQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_134;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcRemoteVideoDidConnectionChange" block:v4 queue:self->_avcRemoteVideoQueue];
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_2();
        }
      }
      [v3 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v3, "delegate"), "remoteVideoServerDidDie:", v3);
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_1();
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_73(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    int v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      int v5 = v4;
      [v4 delegate];
      if (objc_opt_respondsToSelector())
      {
        [v5 setHasReceivedFirstFrame:1];
        [v5 checkpointDidReceiveFirstFrame];
        int v6 = (void *)[v5 delegate];
        [v6 remoteVideoClientDidReceiveFirstFrame:v5];
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        int v12 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 758;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v9, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_77(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"conferenceRemoteScreenAttributes"]);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136316162;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          double v17 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 781;
          __int16 v20 = 1024;
          *(_DWORD *)uint64_t v21 = [v6 streamToken];
          v21[2] = 2048;
          *(void *)&v21[3] = [v6 delegate];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteScreenAttributesDidChange for streamToken=%u, delegate=%p", (uint8_t *)&v14, 0x2Cu);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          __int16 v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315906;
            uint64_t v15 = v10;
            __int16 v16 = 2080;
            double v17 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 783;
            __int16 v20 = 2112;
            *(void *)uint64_t v21 = v7;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteScreenAttributesDidChange:%@", (uint8_t *)&v14, 0x26u);
          }
        }
        [v6 setRemoteScreenAttributes:v7];
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteScreenAttributesDidChange:", v6, v7);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        double v17 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 775;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_85(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (unsigned int *)v5;
      uint64_t v7 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"conferenceRemoteVideoAttributes"]);
      [v6 setActiveVideoModeFromRemoteVideoAttribute:v7];
      [v6 setActiveVideoLayerForMode:v6[22]];
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        [v6 setRemoteVideoAttributes:v7];
        [v6 checkpointVideoAttributesDidChange];
        if (v7) {
          [(VideoAttributes *)v7 framePresentationTime];
        }
        else {
          memset(&v10, 0, sizeof(v10));
        }
        CMTime buf = v10;
        CMTimeGetSeconds(&buf);
        [(VideoAttributes *)v7 contentsRect];
        [(VideoAttributes *)v7 contentsRect];
        [(VideoAttributes *)v7 scaleFactor];
        kdebug_trace();
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteVideoAttributesDidChange:", v6, v7);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136315650;
        *(CMTimeValue *)((char *)&buf.value + 4) = v8;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        HIWORD(buf.epoch) = 1024;
        int v12 = 796;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&buf, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_92(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceVideoPause"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 824;
          __int16 v18 = 1024;
          int v19 = [v7 BOOLValue];
          __int16 v20 = 1024;
          int v21 = [v6 streamToken];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteVideoDidPause=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "setIsVideoPaused:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteVideoDidPause:", v6, objc_msgSend(v6, "isVideoPaused"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 819;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_99(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceIsRemoteMediaStalled"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 842;
          __int16 v18 = 1024;
          int v19 = [v7 BOOLValue];
          __int16 v20 = 1024;
          int v21 = [v6 streamToken];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteMediaDidStall=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "setIsMediaStalled:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteMediaDidStall:", v6, objc_msgSend(v6, "isMediaStalled"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 837;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_106(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceIsVideoDegraded"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 860;
          __int16 v18 = 1024;
          int v19 = [v7 BOOLValue];
          __int16 v20 = 1024;
          int v21 = [v6 streamToken];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: videoDidDegrade=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "setIsVideoDegraded:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:videoDidDegrade:", v6, objc_msgSend(v6, "isVideoDegraded"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 856;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_113(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceIsNetworkDegraded"];
      uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"conferenceIsNetworkDegradedLocal"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 136316418;
          uint64_t v16 = v9;
          __int16 v17 = 2080;
          __int16 v18 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v19 = 1024;
          int v20 = 879;
          __int16 v21 = 1024;
          int v22 = [v7 BOOLValue];
          __int16 v23 = 1024;
          int v24 = [v8 BOOLValue];
          __int16 v25 = 1024;
          int v26 = [v6 streamToken];
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: networkDidDegrade=%d isNetworkDegradedLocal=%d for streamToken=%u", buf, 0x2Eu);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "setIsNetworkDegraded:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend(v6, "setIsNetworkDegradedLocal:", objc_msgSend(v8, "BOOLValue"));
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isNetworkDegradedLocal", @"isLocalConnectionUnstable"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:networkQualityDidDegrade:info:", v6, objc_msgSend(v6, "isNetworkDegraded"), objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136315650;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 874;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", buf, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_123(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceIsVideoSuspended"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 899;
          __int16 v18 = 1024;
          int v19 = [v7 BOOLValue];
          __int16 v20 = 1024;
          int v21 = [v6 streamToken];
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: videoDidSuspend=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v6, "setIsVideoSuspended:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:videoDidSuspend:", v6, objc_msgSend(v6, "isVideoSuspended"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 895;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_130(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    int v4 = (void *)[*(id *)(a1 + 32) strong];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v4)
    {
      if (ErrorLogLevelForModule >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315906;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          uint64_t v13 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 916;
          __int16 v16 = 1024;
          int v17 = [v4 streamToken];
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteVideoClientDidReceiveLastFrame for streamToken=%u.", (uint8_t *)&v10, 0x22u);
        }
      }
      [v4 delegate];
      if (objc_opt_respondsToSelector())
      {
        [v4 setHasReceivedLastFrame:1];
        objc_msgSend((id)objc_msgSend(v4, "delegate"), "remoteVideoClientDidReceiveLastFrame:", v4);
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        uint64_t v13 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 913;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_134(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [a2 objectForKeyedSubscript:@"conferenceConnectionTypeLocal"];
      uint64_t v8 = [a2 objectForKeyedSubscript:@"conferenceConnectionTypeRemote"];
      if (![a2 objectForKeyedSubscript:@"SERVERDIED"])
      {
        [v6 updateConnectionInfoWithLocalInterfaceType:v7 remoteInterfaceType:v8];
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 930;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"conferenceDidServerDie"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidReceiveRemoteFrame"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidRemoteScreenAttributesChange"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidRemoteAttributesChange"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidRemoteVideoPause"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidRemoteMediaStall"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidReleaseRemoteVideoQueue"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidVideoDegrade"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidConnectionChange"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcRemoteVideoDidVideoSuspend"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcRemoteVideoDidNetworkDegrade"];
}

- (void)checkpointDidReceiveFirstFrame
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCRemoteVideoClient-didReceiveFirstFrame");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id delegate = self->_delegate;
      int64_t streamToken = self->_streamToken;
      int activeVideoMode = self->_activeVideoMode;
      int v8 = 136316674;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      int v11 = "-[AVCRemoteVideoClient checkpointDidReceiveFirstFrame]";
      __int16 v12 = 1024;
      int v13 = 960;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 1024;
      int v17 = streamToken;
      __int16 v18 = 2048;
      id v19 = delegate;
      __int16 v20 = 1024;
      int v21 = activeVideoMode;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-didReceiveFirstFrame (%p) streamToken=%u, delegate=%p, activeVideoMode=%d", (uint8_t *)&v8, 0x3Cu);
    }
  }
}

- (void)checkpointVideoAttributesDidChange
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCRemoteVideoClient-remoteVideoAttributesDidChange");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      remoteVideoAttributes = self->_remoteVideoAttributes;
      id delegate = self->_delegate;
      int64_t streamToken = self->_streamToken;
      int activeVideoMode = self->_activeVideoMode;
      int v9 = 136316930;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCRemoteVideoClient checkpointVideoAttributesDidChange]";
      __int16 v13 = 1024;
      int v14 = 964;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = remoteVideoAttributes;
      __int16 v19 = 1024;
      int v20 = streamToken;
      __int16 v21 = 2048;
      id v22 = delegate;
      __int16 v23 = 1024;
      int v24 = activeVideoMode;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-remoteVideoAttributesDidChange (%p) attributes=%@, streamToken=%u, delegate=%p, activeVideoMode=%d", (uint8_t *)&v9, 0x46u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"bounds", a4, a5, a6))
  {
    BOOL v8 = [(AVCRemoteVideoClient *)self shouldDisplayVideoInfoLayer];
    if (a4)
    {
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [a4 bounds];
          double x = v15.origin.x;
          double y = v15.origin.y;
          double width = v15.size.width;
          double height = v15.size.height;
          if (CGRectIsNull(v15))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVCRemoteVideoClient observeValueForKeyPath:ofObject:change:context:]();
              }
            }
          }
          else
          {
            -[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:](self, "adjustInfoSubLayerBounds:forSuperLayer:", [(AVCRemoteVideoClient *)self subLayerForMode:0], x, y, width, height);
            -[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:](self, "adjustInfoSubLayerBounds:forSuperLayer:", [(AVCRemoteVideoClient *)self subLayerForMode:1], x, y, width, height);
            id v13 = [(AVCRemoteVideoClient *)self subLayerForMode:2];
            -[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:](self, "adjustInfoSubLayerBounds:forSuperLayer:", v13, x, y, width, height);
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCRemoteVideoClient observeValueForKeyPath:ofObject:change:context:]();
          }
        }
      }
    }
  }
}

- (void)adjustInfoSubLayerBounds:(CGRect)a3 forSuperLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = -[AVCRemoteVideoClient findInfoSubLayerFromLayer:](self, "findInfoSubLayerFromLayer:", a4, a3.origin.x, a3.origin.y);
  if (v6)
  {
    uint64_t v7 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136316162;
          uint64_t v12 = v8;
          __int16 v13 = 2080;
          int v14 = "-[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:]";
          __int16 v15 = 1024;
          int v16 = 993;
          __int16 v17 = 2048;
          double v18 = width;
          __int16 v19 = 2048;
          double v20 = height;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting bounds %f x %f", (uint8_t *)&v11, 0x30u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 136316162;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        int v14 = "-[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:]";
        __int16 v15 = 1024;
        int v16 = 993;
        __int16 v17 = 2048;
        double v18 = width;
        __int16 v19 = 2048;
        double v20 = height;
        _os_log_debug_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Setting bounds %f x %f", (uint8_t *)&v11, 0x30u);
      }
    }
    [MEMORY[0x1E4F39CF8] begin];
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height * 0.5);
    objc_msgSend(v7, "setPosition:", height * 0.25, width * 0.5);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)insertInfoSubLayerIntoLayer:(id)a3 videoMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(AVCRemoteVideoClient *)self shouldDisplayVideoInfoLayer])
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"AVCRemoteVideoInfoLayer%p(%d)", self, v4);
    [a3 addObserver:self forKeyPath:@"bounds" options:1 context:0];
    [a3 bounds];
    double v9 = v8;
    double v11 = v10;
    id v12 = (id)[MEMORY[0x1E4F39CE8] layer];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    [v12 setFontSize:14.0];
    [v12 setWrapped:1];
    *(_OWORD *)components = xmmword_1E25A2AB8;
    long long v18 = unk_1E25A2AC8;
    int v14 = CGColorCreate(DeviceRGB, components);
    [v12 setForegroundColor:v14];
    objc_msgSend(v12, "setBounds:", 0.0, 0.0, v9, v11 * 0.5);
    objc_msgSend(v12, "setPosition:", v11 * 0.25, v9 * 0.5);
    objc_msgSend(v12, "setString:", -[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"));
    [v12 setAlignmentMode:*MEMORY[0x1E4F39D38]];
    CGAffineTransformMakeRotation(&m, -1.57079633);
    CATransform3DMakeAffineTransform(&v16, &m);
    [v12 setTransform:&v16];
    [v12 setName:v7];
    objc_msgSend(-[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", v4), "addSublayer:", v12);

    CGColorRelease(v14);
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (void)updateConnectionInfoWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(AVCRemoteVideoClient *)self setActiveVideoLayerForMode:self->_activeVideoMode];
  if ([(AVCRemoteVideoClient *)self shouldDisplayVideoInfoLayer])
  {
    -[AVCRemoteVideoClient setConnectionTypeString:](self, "setConnectionTypeString:", [NSString stringWithFormat:@"L:%@ -- R:%@", a3, a4]);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      double v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if ([(AVCRemoteVideoClient *)self connectionTypeString]) {
          double v9 = [[(NSString *)[(AVCRemoteVideoClient *)self connectionTypeString] description] UTF8String];
        }
        else {
          double v9 = "<nil>";
        }
        *(_DWORD *)CMTime buf = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[AVCRemoteVideoClient updateConnectionInfoWithLocalInterfaceType:remoteInterfaceType:]";
        __int16 v14 = 1024;
        int v15 = 1035;
        __int16 v16 = 2080;
        __int16 v17 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection changed to: %s", buf, 0x26u);
      }
    }
    [(AVCRemoteVideoClient *)self drawText:[(AVCRemoteVideoClient *)self connectionTypeString] inSubLayer:[(AVCRemoteVideoClient *)self subLayerForMode:0]];
    [(AVCRemoteVideoClient *)self drawText:[(AVCRemoteVideoClient *)self connectionTypeString] inSubLayer:[(AVCRemoteVideoClient *)self subLayerForMode:1]];
    [(AVCRemoteVideoClient *)self drawText:[(AVCRemoteVideoClient *)self connectionTypeString] inSubLayer:[(AVCRemoteVideoClient *)self subLayerForMode:2]];
  }
}

- (void)drawText:(id)a3 inSubLayer:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v5 = [(AVCRemoteVideoClient *)self findInfoSubLayerFromLayer:a4];
    if (v5)
    {
      id v6 = v5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        double v8 = *MEMORY[0x1E4F47A50];
        double v9 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136315650;
            uint64_t v11 = v7;
            __int16 v12 = 2080;
            __int16 v13 = "-[AVCRemoteVideoClient drawText:inSubLayer:]";
            __int16 v14 = 1024;
            int v15 = 1055;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting textLayer", (uint8_t *)&v10, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          -[AVCRemoteVideoClient drawText:inSubLayer:]();
        }
      }
      [MEMORY[0x1E4F39CF8] begin];
      [v6 setString:a3];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (id)findInfoSubLayerFromLayer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)[a3 sublayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(v3);
    }
    double v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
    if (objc_msgSend((id)objc_msgSend(v8, "name"), "containsString:", @"AVCRemoteVideoInfoLayer")) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)hasReceivedFirstFrame
{
  return self->_hasReceivedFirstFrame;
}

- (void)setHasReceivedFirstFrame:(BOOL)a3
{
  self->_hasReceivedFirstFrame = a3;
}

- (BOOL)hasReceivedLastFrame
{
  return self->_hasReceivedLastFrame;
}

- (void)setHasReceivedLastFrame:(BOOL)a3
{
  self->_hasReceivedLastFrame = a3;
}

- (BOOL)isVideoDegraded
{
  return self->_isVideoDegraded;
}

- (void)setIsVideoDegraded:(BOOL)a3
{
  self->_isVideoDegraded = a3;
}

- (BOOL)isVideoSuspended
{
  return self->_isVideoSuspended;
}

- (void)setIsVideoSuspended:(BOOL)a3
{
  self->_isVideoSuspended = a3;
}

- (BOOL)isMediaStalled
{
  return self->_isMediaStalled;
}

- (void)setIsMediaStalled:(BOOL)a3
{
  self->_isMediaStalled = a3;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (VideoAttributes)remoteScreenAttributes
{
  return self->_remoteScreenAttributes;
}

- (void)setRemoteScreenAttributes:(id)a3
{
}

- (VideoAttributes)remoteVideoAttributes
{
  return self->_remoteVideoAttributes;
}

- (void)setRemoteVideoAttributes:(id)a3
{
}

- (BOOL)shouldDisplayVideoInfoLayer
{
  return self->_shouldDisplayVideoInfoLayer;
}

- (void)setShouldDisplayVideoInfoLayer:(BOOL)a3
{
  self->_shouldDisplayVideoInfoLayer = a3;
}

- (NSString)connectionTypeString
{
  return self->_connectionTypeString;
}

- (void)setConnectionTypeString:(id)a3
{
}

- (BOOL)isNetworkDegraded
{
  return self->_isNetworkDegraded;
}

- (void)setIsNetworkDegraded:(BOOL)a3
{
  self->_isNetworkDegraded = a3;
}

- (BOOL)isNetworkDegradedLocal
{
  return self->_isNetworkDegradedLocal;
}

- (void)setIsNetworkDegradedLocal:(BOOL)a3
{
  self->_isNetworkDegradedLocal = a3;
}

- (BOOL)isTransformForRemoteVideoOrientationEnabled
{
  return self->_transformForRemoteVideoOrientationEnabled;
}

- (void)initWithStreamToken:endpointID:delegate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCRemoteVideoClient initWithStreamToken:endpointID:delegate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ERROR queue for streamToken=%u doesn't exist", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient initWithStreamToken:endpointID:delegate:]" >> 16, 185);
}

- (void)initWithStreamToken:endpointID:delegate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ERROR slotsForModes dictionary missing", v2, v3, v4, v5, v6);
}

- (void)setVideoLayer:forMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ERROR no valid slot for mode=%d", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient setVideoLayer:forMode:]" >> 16, v4);
}

- (void)setVideoLayer:forMode:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCRemoteVideoClient: ERROR invalid videoMode in setVideoLayer:forMode:%d", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient setVideoLayer:forMode:]" >> 16, v4);
}

- (void)slotForMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCRemoteVideoClient slotForMode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d ERROR no valid slot for mode=%d", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient slotForMode:]" >> 16, v4);
}

- (void)setLayerHostBounds:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid CALayerHost instance", v2, v3, v4, v5, v6);
}

- (void)createCALayerHostForRootLayer:withContextId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid rootLayer or contextId", v2, v3, v4, v5, v6);
}

- (void)createCALayerHostForRootLayer:withContextId:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate layer host name", v2, v3, v4, v5, v6);
}

- (void)createCALayerHostForRootLayer:withContextId:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate CALayerHost", v2, v3, v4, v5, v6);
}

- (void)newXPCObjectForFenceHandle:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create new fence", v2, v3, v4, v5, v6);
}

- (void)setRemoteVideoLayerBounds:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CALayerHost invalid", v2, v3, v4, v5, v6);
}

- (void)setRemoteVideoLayerBounds:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream token number", v2, v3, v4, v5, v6);
}

- (void)setRemoteVideoLayerBounds:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create XPC representation for fence", v2, v3, v4, v5, v6);
}

- (void)setRemoteVideoLayerBounds:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Set layer bounds xpc call failed", v2, v3, v4, v5, v6);
}

- (void)setRemoteVideoLayerBounds:(double)a3 .cold.5(double a1, double a2, double a3, double a4, uint64_t a5, NSObject *a6)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  NSStringFromRect(*(NSRect *)&a1);
  OUTLINED_FUNCTION_7_1();
  double v9 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
  OUTLINED_FUNCTION_3();
  int v10 = 406;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a6, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed due to invalid root layer bounds=%@", v8, 0x26u);
}

- (void)setTransformForRemoteVideoOrientationEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Set transformForRemoteVideoOrientationEnabled xpc call failed", v2, v3, v4, v5, v6);
}

- (void)setVideoLayerHost:forMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid rootLayer parameter", v2, v3, v4, v5, v6);
}

- (void)setVideoLayerHost:forMode:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream token number", v2, v3, v4, v5, v6);
}

- (void)setVideoLayerHost:forMode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate args dictionary", v2, v3, v4, v5, v6);
}

- (void)setVideoLayerHost:(NSObject *)a3 forMode:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a2 unsignedIntValue];
  OUTLINED_FUNCTION_7_1();
  uint64_t v7 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
  OUTLINED_FUNCTION_3();
  int v8 = 482;
  __int16 v9 = v4;
  int v10 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d GetContextIdForStreamToken=%u failed", v6, 0x22u);
}

- (void)setVideoLayerHost:forMode:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid contextIdForModes dictionary returned", v2, v3, v4, v5, v6);
}

- (void)setVideoLayerHost:forMode:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate slotsForModes dictionary", v2, v3, v4, v5, v6);
}

- (void)setVideoLayerHost:forMode:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CALayerHost exist already, reconfigure not supported currently", v2, v3, v4, v5, v6);
}

void __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&unsigned char v3[14] = "-[AVCRemoteVideoClient setActiveVideoLayerForMode:]_block_invoke";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d AVCRemoteVideoClient: invalide videoMode=%d when setActiveVideoLayerForMode", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCRemoteVideoClient setActiveVideoLayerForMode:]_block_invoke" >> 16, 670);
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCRemoteVideoClient: server died", v2, v3, v4, v5, v6);
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCRemoteVideoClient: serverd died, notifying client", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Bounds are NULL", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Object is not a CA Layer", v2, v3, v4, v5, v6);
}

- (void)drawText:inSubLayer:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 1055;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Setting textLayer", v1, 0x1Cu);
}

@end