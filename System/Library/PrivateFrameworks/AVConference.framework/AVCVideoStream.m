@interface AVCVideoStream
+ (id)capabilities;
+ (id)extractClientDownlinkQualityInfoDictionary:(id)a3;
+ (id)extractClientUplinkQualityInfoDictionary:(id)a3;
- (AVCMediaStreamConfig)configuration;
- (AVCVideoStream)initWithIDSDestination:(id)a3 callID:(id)a4 error:(id *)a5;
- (AVCVideoStream)initWithLocalAddress:(id)a3 networkSockets:(id)a4 IDSDestination:(id)a5 connectionClientID:(id)a6 callID:(id)a7 options:(id)a8 error:(id *)a9;
- (AVCVideoStream)initWithNWConnectionClientID:(unsigned __int8)a3[16] options:(id)a4 error:(id *)a5;
- (AVCVideoStream)initWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5;
- (AVCVideoStream)initWithNetworkSockets:(id)a3 options:(id)a4 error:(id *)a5;
- (AVCVideoStreamDelegate)delegate;
- (BOOL)configure:(id)a3 error:(id *)a4;
- (BOOL)isRTCPEnabled;
- (BOOL)isRTCPTimeOutEnabled;
- (BOOL)isRTPTimeOutEnabled;
- (NSDictionary)capabilities;
- (double)rtcpSendIntervalSec;
- (double)rtcpTimeOutIntervalSec;
- (double)rtpTimeOutIntervalSec;
- (id)getStats;
- (int64_t)direction;
- (int64_t)streamToken;
- (void)dealloc;
- (void)deregisterBlocksForDelegateNotifications;
- (void)pause;
- (void)refreshLoggingParameters;
- (void)registerBlocksForDelegateNotifications;
- (void)requestLastDecodedFrame;
- (void)resume;
- (void)setCapabilities:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setRtcpEnabled:(BOOL)a3;
- (void)setRtcpSendIntervalSec:(double)a3;
- (void)setRtcpTimeOutEnabled:(BOOL)a3;
- (void)setRtcpTimeOutIntervalSec:(double)a3;
- (void)setRtpTimeOutEnabled:(BOOL)a3;
- (void)setRtpTimeOutIntervalSec:(double)a3;
- (void)start;
- (void)stop;
- (void)terminateSession;
- (void)updateVideoConfiguration:(id)a3;
- (void)vcMediaStream:(id)a3 didPauseStream:(BOOL)a4 error:(id)a5;
- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4;
- (void)vcMediaStream:(id)a3 didResumeStream:(BOOL)a4 error:(id)a5;
- (void)vcMediaStream:(id)a3 didStartStream:(BOOL)a4 error:(id)a5;
- (void)vcMediaStream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5 dictionary:(id)a6;
- (void)vcMediaStream:(id)a3 downlinkQualityDidChange:(id)a4;
- (void)vcMediaStream:(id)a3 uplinkQualityDidChange:(id)a4;
- (void)vcMediaStreamDidRTCPTimeOut:(id)a3;
- (void)vcMediaStreamDidRTPTimeOut:(id)a3;
- (void)vcMediaStreamDidStop:(id)a3;
- (void)vcMediaStreamServerDidDie:(id)a3;
@end

@implementation AVCVideoStream

- (AVCVideoStream)initWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    return [(AVCVideoStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 connectionClientID:0 callID:a4 options:0 error:a5];
  }
  __str = 0;
  if (a3)
  {
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v9 = "<nil>";
    if (a4) {
      goto LABEL_4;
    }
  }
  v10 = "<nil>";
LABEL_7:
  if (*a5) {
    v11 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  }
  else {
    v11 = "<nil>";
  }
  asprintf(&__str, "socketsDictionary=%s, callID=%s, error=%s", v9, v10, v11);
  if (__str)
  {
    v17 = self;
    v18 = a5;
    __lasts = 0;
    v12 = strtok_r(__str, "\n", &__lasts);
    v13 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v14;
          __int16 v23 = 2080;
          v24 = "-[AVCVideoStream initWithNetworkSockets:callID:error:]";
          __int16 v25 = 1024;
          int v26 = 58;
          __int16 v27 = 2080;
          v28 = "";
          __int16 v29 = 2080;
          v30 = v12;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v12 = strtok_r(0, "\n", &__lasts);
    }
    while (v12);
    free(__str);
    self = v17;
    a5 = v18;
  }
  return [(AVCVideoStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 connectionClientID:0 callID:a4 options:0 error:a5];
}

- (AVCVideoStream)initWithNetworkSockets:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    goto LABEL_17;
  }
  __str = 0;
  if (a3)
  {
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v9 = "<nil>";
    if (a4) {
      goto LABEL_4;
    }
  }
  v10 = "<nil>";
LABEL_7:
  if (*a5) {
    v11 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  }
  else {
    v11 = "<nil>";
  }
  asprintf(&__str, "socketsDictionary=%s, options=%s, error=%s", v9, v10, v11);
  if (__str)
  {
    v18 = self;
    v19 = a5;
    __lasts = 0;
    v12 = strtok_r(__str, "\n", &__lasts);
    v13 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v14;
          __int16 v24 = 2080;
          __int16 v25 = "-[AVCVideoStream initWithNetworkSockets:options:error:]";
          __int16 v26 = 1024;
          int v27 = 63;
          __int16 v28 = 2080;
          __int16 v29 = "";
          __int16 v30 = 2080;
          uint64_t v31 = v12;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v12 = strtok_r(0, "\n", &__lasts);
    }
    while (v12);
    free(__str);
    a5 = v19;
    self = v18;
  }
LABEL_17:
  if (a4) {
    uint64_t v16 = [a4 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"];
  }
  else {
    uint64_t v16 = 0;
  }
  return [(AVCVideoStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 connectionClientID:0 callID:v16 options:a4 error:a5];
}

- (AVCVideoStream)initWithNWConnectionClientID:(unsigned __int8)a3[16] options:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v9 = [a4 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"];
    v10 = (AVCVideoStream *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v11 = (const char *)objc_msgSend((id)-[AVCVideoStream UUIDString](v10, "UUIDString"), "UTF8String");
      v12 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
      uint64_t v16 = *a5 ? (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "clientID=%s, options=%s, error=%s", v11, v12, v16);
      if (__str)
      {
        uint64_t v22 = v9;
        uint64_t v23 = a5;
        __int16 v24 = self;
        __lasts = 0;
        v17 = strtok_r(__str, "\n", &__lasts);
        v18 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v19 = VRTraceErrorLogLevelToCSTR();
            v20 = *v18;
            if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v28 = v19;
              __int16 v29 = 2080;
              __int16 v30 = "-[AVCVideoStream initWithNWConnectionClientID:options:error:]";
              __int16 v31 = 1024;
              int v32 = 86;
              __int16 v33 = 2080;
              v34 = "";
              __int16 v35 = 2080;
              v36 = v17;
              _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v17 = strtok_r(0, "\n", &__lasts);
        }
        while (v17);
        free(__str);
        a5 = v23;
        self = v24;
        uint64_t v9 = v22;
      }
    }
    v15 = [(AVCVideoStream *)self initWithLocalAddress:0 networkSockets:0 IDSDestination:0 connectionClientID:[(AVCVideoStream *)v10 UUIDString] callID:v9 options:a4 error:a5];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = v13;
        __int16 v29 = 2080;
        __int16 v30 = "-[AVCVideoStream initWithNWConnectionClientID:options:error:]";
        __int16 v31 = 1024;
        int v32 = 76;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d clientID is nil", buf, 0x1Cu);
      }
    }
    v15 = 0;
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"clientID may not be nil"];
    }
    v10 = self;
  }

  return v15;
}

- (AVCVideoStream)initWithIDSDestination:(id)a3 callID:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *a5;
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVCVideoStream initWithIDSDestination:callID:error:]";
      __int16 v17 = 1024;
      int v18 = 94;
      __int16 v19 = 2112;
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = a4;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d destination=%@, callID=%@, error=%@", buf, 0x3Au);
    }
  }
  return [(AVCVideoStream *)self initWithLocalAddress:0 networkSockets:0 IDSDestination:a3 connectionClientID:0 callID:a4 options:0 error:a5];
}

- (AVCVideoStream)initWithLocalAddress:(id)a3 networkSockets:(id)a4 IDSDestination:(id)a5 connectionClientID:(id)a6 callID:(id)a7 options:(id)a8 error:(id *)a9
{
  *(void *)((char *)&v80[1] + 6) = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    goto LABEL_25;
  }
  __str = 0;
  if (a3) {
    uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
  }
  else {
    uint64_t v16 = "<nil>";
  }
  id v64 = a3;
  if (a4) {
    __int16 v17 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
  }
  else {
    __int16 v17 = "<nil>";
  }
  id v65 = a5;
  if (a5)
  {
    int v18 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
    if (a6) {
      goto LABEL_10;
    }
  }
  else
  {
    int v18 = "<nil>";
    if (a6)
    {
LABEL_10:
      __int16 v19 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
      if (a7) {
        goto LABEL_11;
      }
LABEL_15:
      id v20 = "<nil>";
      if (a8) {
        goto LABEL_12;
      }
LABEL_16:
      __int16 v21 = "<nil>";
      goto LABEL_17;
    }
  }
  __int16 v19 = "<nil>";
  if (!a7) {
    goto LABEL_15;
  }
LABEL_11:
  id v20 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
  if (!a8) {
    goto LABEL_16;
  }
LABEL_12:
  __int16 v21 = (const char *)objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
LABEL_17:
  asprintf(&__str, "localAddress=%s, socketsDictionary=%s, destination=%s, connectionClientID=%s, callID=%s, options=%s", v16, v17, v18, v19, v20, v21);
  if (__str)
  {
    id v61 = a6;
    id v62 = a4;
    id v63 = a7;
    __lasts = 0;
    id v22 = strtok_r(__str, "\n", &__lasts);
    __int16 v23 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        uint64_t v25 = *v23;
        if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v70 = v24;
          __int16 v71 = 2080;
          v72 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
          __int16 v73 = 1024;
          int v74 = 99;
          __int16 v75 = 2080;
          v76 = "";
          __int16 v77 = 2080;
          uint64_t v78 = (uint64_t)v22;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      id v22 = strtok_r(0, "\n", &__lasts);
    }
    while (v22);
    free(__str);
    a4 = v62;
    a7 = v63;
    a6 = v61;
  }
  a3 = v64;
  a5 = v65;
LABEL_25:
  v66.receiver = self;
  v66.super_class = (Class)AVCVideoStream;
  __int16 v26 = [(AVCVideoStream *)&v66 init];
  if (!v26) {
    goto LABEL_86;
  }
  int v27 = v26;
  v26->_BOOL shouldUseXPC = 1;
  if ([a8 objectForKeyedSubscript:@"avcMediaStreamOptionRunInProcess"]) {
    v27->_BOOL shouldUseXPC = objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"avcMediaStreamOptionRunInProcess"), "BOOLValue") ^ 1;
  }
  if ((AVCVideoStream *)objc_opt_class() == v27)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL shouldUseXPC = v27->_shouldUseXPC;
        *(_DWORD *)buf = 136315906;
        if (shouldUseXPC) {
          int v32 = "out of";
        }
        else {
          int v32 = "in";
        }
        uint64_t v70 = v29;
        __int16 v71 = 2080;
        v72 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
        __int16 v73 = 1024;
        int v74 = 105;
        __int16 v75 = 2080;
        v76 = v32;
        __int16 v33 = "AVCVideoStream [%s] %s:%d Will run %s process";
        v34 = v30;
        uint32_t v35 = 38;
        goto LABEL_44;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = (__CFString *)[(AVCVideoStream *)v27 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      uint64_t v37 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v38 = v27->_shouldUseXPC;
        *(_DWORD *)buf = 136316418;
        if (v38) {
          v39 = "out of";
        }
        else {
          v39 = "in";
        }
        uint64_t v70 = v36;
        __int16 v71 = 2080;
        v72 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
        __int16 v73 = 1024;
        int v74 = 105;
        __int16 v75 = 2112;
        v76 = (const char *)v28;
        __int16 v77 = 2048;
        uint64_t v78 = (uint64_t)v27;
        __int16 v79 = 2080;
        v80[0] = v39;
        __int16 v33 = "AVCVideoStream [%s] %s:%d %@(%p) Will run %s process";
        v34 = v37;
        uint32_t v35 = 58;
LABEL_44:
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      }
    }
  }
  [(AVCVideoStream *)v27 refreshLoggingParameters];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3)
  {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a3, "ip"), @"vcMediaStreamSourceIP");
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a3, "interfaceName"), @"vcMediaStreamSourceInterfaceName");
  }
  if (a5) {
    [v40 setObject:a5 forKeyedSubscript:@"vcMediaStreamDestID"];
  }
  if (a6) {
    [v40 setObject:a6 forKeyedSubscript:@"vcMediaStreamConnectionClientID"];
  }
  if (a7) {
    [v40 setObject:a7 forKeyedSubscript:@"vcMediaStreamCallID"];
  }
  if ([a8 objectForKeyedSubscript:@"avcMediaStreamOptionClientPID"]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", @"avcMediaStreamOptionClientPID"), @"vcMediaStreamClientPID");
  }
  if ([a8 objectForKeyedSubscript:@"avcMediaStreamOptionRemoteEndpointInfo"]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", @"avcMediaStreamOptionRemoteEndpointInfo"), @"vcMediaStreamRemoteEndpointInfo");
  }
  if ([a8 objectForKeyedSubscript:@"avcMediaStreamOptionClientName"]) {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", @"avcMediaStreamOptionClientName"), @"vcMediaStreamClientName");
  }
  if ([a8 objectForKeyedSubscript:@"avcMediaStreamOptionClientSessionID"])
  {
    [a8 objectForKeyedSubscript:@"avcMediaStreamOptionClientSessionID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"avcMediaStreamOptionClientSessionID"), "UUIDString"), @"vcMediaStreamClientSessionID");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:].cold.4();
      }
    }
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v27->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.avcvideostream.callback.queue", 0, CustomRootQueue);
  if (v27->_shouldUseXPC)
  {
    v27->_connection = objc_alloc_init(AVConferenceXPCClient);
    id v42 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v43 = objc_msgSend(v42, "initWithObjectsAndKeys:", v40, @"vcMediaStreamDictionary", MEMORY[0x1E4F1CC38], @"CACHEAUTHTOKEN", 0);
    id v44 = [(AVConferenceXPCClient *)v27->_connection sendMessageSync:"vcMediaStreamInitializeVideo" arguments:v43 xpcArguments:a4];
    [(AVCVideoStream *)v27 registerBlocksForDelegateNotifications];
    if (v44)
    {
      id v45 = (id)[v44 objectForKeyedSubscript:@"ERROR"];
      if (v45 || [v44 objectForKeyedSubscript:@"TIMEOUT"])
      {
        id v46 = a7;
        if (a9) {
          *a9 = v45;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v47 = VRTraceErrorLogLevelToCSTR();
          v48 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            if (v45) {
              v59 = (const char *)objc_msgSend((id)objc_msgSend(v45, "description"), "UTF8String");
            }
            else {
              v59 = "<nil>";
            }
            uint64_t v60 = objc_msgSend((id)objc_msgSend(v44, "description"), "UTF8String");
            *(_DWORD *)buf = 136316162;
            uint64_t v70 = v47;
            __int16 v71 = 2080;
            v72 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
            __int16 v73 = 1024;
            int v74 = 159;
            __int16 v75 = 2080;
            v76 = v59;
            __int16 v77 = 2080;
            uint64_t v78 = v60;
            _os_log_error_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing error[%s] resultDict[%s]", buf, 0x30u);
          }
        }

        int v27 = 0;
        a7 = v46;
LABEL_80:

        if (v27) {
          goto LABEL_81;
        }
        goto LABEL_86;
      }
      -[AVCVideoStream setCapabilities:](v27, "setCapabilities:", [v44 objectForKeyedSubscript:@"vcMediaStreamStreamCapabilities"]);
      if ([(AVCVideoStream *)v27 capabilities])
      {
        if ([v44 objectForKeyedSubscript:@"vcMediaStreamToken"])
        {
          v27->_int streamToken = objc_msgSend((id)objc_msgSend(v44, "objectForKeyedSubscript:", @"vcMediaStreamToken"), "integerValue");
          goto LABEL_80;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v58 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:](v58, v44);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]();
      }
    }

    int v27 = 0;
    goto LABEL_80;
  }
  v49 = objc_alloc_init(VCVideoStream);
  v27->_opaqueStream = v49;
  [(VCMediaStream *)v49 setDelegate:v27];
  v27->_int streamToken = [(VCMediaStream *)v27->_opaqueStream streamToken];
  uint64_t v50 = [(VCMediaStream *)v27->_opaqueStream setLocalParticipantInfo:v40 networkSockets:a4 withError:a9];
  if (v50)
  {
    [(AVCVideoStream *)v27 setCapabilities:v50];

LABEL_81:
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int streamToken = v27->_streamToken;
        if (a9) {
          v54 = (__CFString *)*a9;
        }
        else {
          v54 = @"None";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v70 = v51;
        __int16 v71 = 2080;
        v72 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
        __int16 v73 = 1024;
        int v74 = 200;
        __int16 v75 = 2048;
        v76 = (const char *)v27;
        __int16 v77 = 2112;
        uint64_t v78 = (uint64_t)a7;
        __int16 v79 = 1024;
        LODWORD(v80[0]) = streamToken;
        WORD2(v80[0]) = 2112;
        *(void *)((char *)v80 + 6) = v54;
        _os_log_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-init (%p) callID=%@, streamToken=%d, error=%@", buf, 0x40u);
      }
    }
    return v27;
  }

LABEL_86:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v55 = VRTraceErrorLogLevelToCSTR();
    v56 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v70 = v55;
      __int16 v71 = 2080;
      v72 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
      __int16 v73 = 1024;
      int v74 = 202;
      __int16 v75 = 2048;
      v76 = 0;
      _os_log_impl(&dword_1E1EA4000, v56, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (void)terminateSession
{
  if (self->_shouldUseXPC)
  {
    [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidServerDie"];
    [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamTerminateVideo"];

    self->_connection = 0;
  }
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((AVCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = v4;
    __int16 v17 = 2080;
    int v18 = "-[AVCVideoStream dealloc]";
    __int16 v19 = 1024;
    int v20 = 218;
    v6 = "AVCVideoStream [%s] %s:%d ";
    v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    v3 = (__CFString *)[(AVCVideoStream *)self performSelector:sel_logPrefix];
  }
  else {
    v3 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      int v18 = "-[AVCVideoStream dealloc]";
      __int16 v19 = 1024;
      int v20 = 218;
      __int16 v21 = 2112;
      id v22 = (AVCVideoStream *)v3;
      __int16 v23 = 2048;
      uint64_t v24 = self;
      v6 = "AVCVideoStream [%s] %s:%d %@(%p) ";
      v7 = v10;
      uint32_t v8 = 48;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  [(AVCVideoStream *)self setCapabilities:0];
  [(AVCVideoStream *)self setConfiguration:0];
  if (self->_shouldUseXPC)
  {
    [(AVCVideoStream *)self deregisterBlocksForDelegateNotifications];
    [(AVCVideoStream *)self terminateSession];
  }
  else
  {
    [(VCMediaStream *)self->_opaqueStream stop];
    [(VCMediaStream *)self->_opaqueStream setDelegate:0];
  }
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      int v18 = "-[AVCVideoStream dealloc]";
      __int16 v19 = 1024;
      int v20 = 235;
      __int16 v21 = 2048;
      id v22 = self;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-dealloc (%p)", buf, 0x26u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCVideoStream;
  [(AVCVideoStream *)&v14 dealloc];
}

- (AVCVideoStreamDelegate)delegate
{
  return (AVCVideoStreamDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)refreshLoggingParameters
{
  CFPreferencesAppSynchronize(@"com.apple.AVConference");
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
  VRTraceReset();

  VRTracePrintLoggingInfo();
}

- (BOOL)configure:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v7 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    uint32_t v8 = *a4 ? (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "configuration=%s, error=%s", v7, v8);
    if (__str)
    {
      __int16 v31 = a4;
      __lasts = 0;
      uint64_t v9 = strtok_r(__str, "\n", &__lasts);
      v10 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v36 = v11;
            __int16 v37 = 2080;
            BOOL v38 = "-[AVCVideoStream configure:error:]";
            __int16 v39 = 1024;
            int v40 = 261;
            __int16 v41 = 2080;
            id v42 = "";
            __int16 v43 = 2080;
            id v44 = (AVCVideoStream *)v9;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v9 = strtok_r(0, "\n", &__lasts);
      }
      while (v9);
      free(__str);
      a4 = v31;
    }
  }
  if ([a3 isValidVideoConfig])
  {
    if (self->_shouldUseXPC)
    {
      uint64_t v13 = [a3 dictionary];
      objc_super v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v13, @"vcMediaStreamDictionary", 0);
      id v15 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamSetSessionConfig" arguments:v14];
      if (v15)
      {
        id v16 = (id)[v15 objectForKeyedSubscript:@"ERROR"];
        if (v16)
        {
          __int16 v17 = v16;
          [(AVCVideoStream *)self setConfiguration:0];
          char v18 = 0;
          if (a4) {
            *a4 = v17;
          }
          goto LABEL_40;
        }
        [(AVCVideoStream *)self setConfiguration:a3];
      }
      char v18 = 1;
LABEL_40:

      return v18;
    }
    int v20 = -[VCVideoStreamConfig initWithClientDictionary:]([VCVideoStreamConfig alloc], "initWithClientDictionary:", [a3 dictionary]);
    opaqueStream = self->_opaqueStream;
    v34 = v20;
    char v18 = -[VCMediaStream setStreamConfig:withError:](opaqueStream, "setStreamConfig:withError:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1], a4);

    [(AVCVideoStream *)self setConfiguration:a3];
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCVideoStream.m", 268), @"Invalid Parameter", @"Called with an invalid parameter");
    if ((AVCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCVideoStream configure:error:](v22, a4);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCVideoStream configure:error:](v22, a4, v24);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v19 = (__CFString *)[(AVCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        char v26 = VRTraceIsOSFaultDisabled();
        int v27 = *MEMORY[0x1E4F47A50];
        if (v26)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            if (*a4) {
              uint64_t v28 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
            }
            else {
              uint64_t v28 = "<nil>";
            }
            *(_DWORD *)buf = 136316418;
            uint64_t v36 = v25;
            __int16 v37 = 2080;
            BOOL v38 = "-[AVCVideoStream configure:error:]";
            __int16 v39 = 1024;
            int v40 = 271;
            __int16 v41 = 2112;
            id v42 = (const char *)v19;
            __int16 v43 = 2048;
            id v44 = self;
            __int16 v45 = 2080;
            id v46 = v28;
            _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d %@(%p) Invalid video configuration: error[%s]", buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          if (*a4) {
            uint64_t v29 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            uint64_t v29 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v36 = v25;
          __int16 v37 = 2080;
          BOOL v38 = "-[AVCVideoStream configure:error:]";
          __int16 v39 = 1024;
          int v40 = 271;
          __int16 v41 = 2112;
          id v42 = (const char *)v19;
          __int16 v43 = 2048;
          id v44 = self;
          __int16 v45 = 2080;
          id v46 = v29;
          _os_log_fault_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_FAULT, "AVCVideoStream [%s] %s:%d %@(%p) Invalid video configuration: error[%s]", buf, 0x3Au);
        }
      }
    }
    return 0;
  }
  return v18;
}

- (void)start
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCVideoStream start]");
  if (![(AVCVideoStream *)self configuration])
  {
    id v7 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"AVCVideoStream hasn't been configured"];
    opaqueStream = self->_opaqueStream;
    uint64_t v9 = self;
    BOOL v10 = 0;
LABEL_12:
    [(AVCVideoStream *)v9 vcMediaStream:opaqueStream didStartStream:v10 error:v7];
    goto LABEL_13;
  }
  BOOL shouldUseXPC = self->_shouldUseXPC;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!shouldUseXPC)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315650;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        char v18 = "-[AVCVideoStream start]";
        __int16 v19 = 1024;
        int v20 = 318;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream start (not using XPC)", (uint8_t *)&v15, 0x1Cu);
      }
    }
    id v7 = [(VCMediaStream *)self->_opaqueStream start];
    opaqueStream = self->_opaqueStream;
    BOOL v10 = v7 == 0;
    uint64_t v9 = self;
    goto LABEL_12;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      char v18 = "-[AVCVideoStream start]";
      __int16 v19 = 1024;
      int v20 = 315;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream API_VCMEDIASTREAM_STARTCONFERENCE (client side)", (uint8_t *)&v15, 0x1Cu);
    }
  }
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStartConference"];
LABEL_13:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    objc_super v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      char v18 = "-[AVCVideoStream start]";
      __int16 v19 = 1024;
      int v20 = 327;
      __int16 v21 = 2048;
      uint64_t v22 = self;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-start (%p)", (uint8_t *)&v15, 0x26u);
    }
  }
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCVideoStream stop]");
  if (self->_shouldUseXPC)
  {
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStopConference"];
  }
  else
  {
    [(VCMediaStream *)self->_opaqueStream stop];
    [(AVCVideoStream *)self vcMediaStreamDidStop:self->_opaqueStream];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint32_t v8 = "-[AVCVideoStream stop]";
      __int16 v9 = 1024;
      int v10 = 339;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-stop (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)pause
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCVideoStream pause]");
  if (self->_shouldUseXPC)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC8E80, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetPause" arguments:v3];
  }
  else
  {
    id v4 = [(VCMediaStream *)self->_opaqueStream setPause:1];
    [(AVCVideoStream *)self vcMediaStream:self->_opaqueStream didPauseStream:v4 == 0 error:v4];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[AVCVideoStream pause]";
      __int16 v11 = 1024;
      int v12 = 356;
      __int16 v13 = 2048;
      objc_super v14 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-pause (%p)", buf, 0x26u);
    }
  }
}

- (void)resume
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCVideoStream resume]");
  if (self->_shouldUseXPC)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC8EA8, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetPause" arguments:v3];
  }
  else
  {
    id v4 = [(VCMediaStream *)self->_opaqueStream setPause:0];
    [(AVCVideoStream *)self vcMediaStream:self->_opaqueStream didResumeStream:v4 == 0 error:v4];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[AVCVideoStream resume]";
      __int16 v11 = 1024;
      int v12 = 373;
      __int16 v13 = 2048;
      objc_super v14 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-resume (%p)", buf, 0x26u);
    }
  }
}

- (void)updateVideoConfiguration:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCVideoStream updateVideoConfiguration:]");
  if (objc_msgSend(a3, "isValidForDirection:", -[AVCVideoStream direction](self, "direction")))
  {
    uint64_t v5 = [a3 dictionary];
    if (self->_shouldUseXPC)
    {
      char v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"vcMediaStreamDictionary", 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamUpdateVideoConfig");
    }
    else
    {
      opaqueStream = self->_opaqueStream;
      [(VCVideoStream *)opaqueStream updateVideoConfig:v5];
    }
  }
  else
  {
    id v21 = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v21, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCVideoStream.m", 383), @"Invalid Parameter", @"Called with an invalid parameter");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          if (v21) {
            __int16 v9 = (const char *)objc_msgSend((id)objc_msgSend(v21, "description"), "UTF8String");
          }
          else {
            __int16 v9 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v6;
          __int16 v24 = 2080;
          uint64_t v25 = "-[AVCVideoStream updateVideoConfiguration:]";
          __int16 v26 = 1024;
          int v27 = 386;
          __int16 v28 = 2048;
          uint64_t v29 = self;
          __int16 v30 = 2080;
          __int16 v31 = "-[AVCVideoStream updateVideoConfiguration:]";
          __int16 v32 = 2080;
          __int16 v33 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d AVCVideoStream[%p] %s error[%s]", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        if (v21) {
          __int16 v17 = (const char *)objc_msgSend((id)objc_msgSend(v21, "description"), "UTF8String");
        }
        else {
          __int16 v17 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v6;
        __int16 v24 = 2080;
        uint64_t v25 = "-[AVCVideoStream updateVideoConfiguration:]";
        __int16 v26 = 1024;
        int v27 = 386;
        __int16 v28 = 2048;
        uint64_t v29 = self;
        __int16 v30 = 2080;
        __int16 v31 = "-[AVCVideoStream updateVideoConfiguration:]";
        __int16 v32 = 2080;
        __int16 v33 = v17;
        _os_log_fault_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_FAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream[%p] %s error[%s]", buf, 0x3Au);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      __int16 v11 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "videoConfig=%s", v11);
      if (__str)
      {
        __lasts = 0;
        int v12 = strtok_r(__str, "\n", &__lasts);
        __int16 v13 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            uint64_t v15 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v23 = v14;
              __int16 v24 = 2080;
              uint64_t v25 = "-[AVCVideoStream updateVideoConfiguration:]";
              __int16 v26 = 1024;
              int v27 = 387;
              __int16 v28 = 2080;
              uint64_t v29 = (AVCVideoStream *)"";
              __int16 v30 = 2080;
              __int16 v31 = v12;
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v12 = strtok_r(0, "\n", &__lasts);
        }
        while (v12);
        free(__str);
      }
    }
    [(AVCVideoStream *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [(AVCVideoStream *)self delegate];
      [(AVCVideoStreamDelegate *)v16 stream:self didUpdateVideoConfiguration:0 error:v21];
    }
  }
}

- (id)getStats
{
  return 0;
}

- (void)requestLastDecodedFrame
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = v0;
  id v4 = "-[AVCVideoStream requestLastDecodedFrame]";
  __int16 v5 = 1024;
  int v6 = 415;
  __int16 v7 = v0;
  uint64_t v8 = "-[AVCVideoStream requestLastDecodedFrame]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d %s only supported in the daemon", v2, 0x26u);
}

- (void)setDirection:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCVideoStream setDirection:]";
      __int16 v15 = 1024;
      int v16 = 422;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d direction=%ld", buf, 0x26u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] direction] != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setDirection:a3];
    if (self->_shouldUseXPC)
    {
      uint64_t v9 = @"vcMediaStreamDirection";
      uint64_t v10 = [NSNumber numberWithInteger:a3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetStreamDirection" arguments:v8];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setStreamDirection:+[AVCMediaStreamConfig streamDirectionWithClientDirection:a3]];
    }
  }
}

- (int64_t)direction
{
  v2 = [(AVCVideoStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 direction];
}

- (void)setRtcpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCVideoStream setRtcpEnabled:]";
      __int16 v15 = 1024;
      int v16 = 447;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] isRTCPEnabled] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setRtcpEnabled:v3];
    if (self->_shouldUseXPC)
    {
      uint64_t v9 = @"vcMediaStreamRTCPEnabled";
      uint64_t v10 = [NSNumber numberWithBool:v3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPEnabled" arguments:v8];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpEnabled:v3];
    }
  }
}

- (BOOL)isRTCPEnabled
{
  v2 = [(AVCVideoStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 isRTCPEnabled];
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCVideoStream setRtpTimeOutEnabled:]";
      __int16 v15 = 1024;
      int v16 = 473;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] isRTPTimeOutEnabled] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setRtpTimeOutEnabled:v3];
    if (self->_shouldUseXPC)
    {
      uint64_t v9 = @"vcMediaStreamRTPTimeoutEnabled";
      uint64_t v10 = [NSNumber numberWithBool:v3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTPTimeoutEnabled" arguments:v8];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setRtpTimeOutEnabled:v3];
    }
  }
}

- (BOOL)isRTPTimeOutEnabled
{
  v2 = [(AVCVideoStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 isRTPTimeOutEnabled];
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCVideoStream setRtcpTimeOutEnabled:]";
      __int16 v15 = 1024;
      int v16 = 499;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] isRTCPTimeOutEnabled] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setRtcpTimeOutEnabled:v3];
    if (self->_shouldUseXPC)
    {
      uint64_t v9 = @"vcMediaStreamRTCPTimeoutEnabled";
      uint64_t v10 = [NSNumber numberWithBool:v3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPTimeoutEnabled" arguments:v8];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpTimeOutEnabled:v3];
    }
  }
}

- (BOOL)isRTCPTimeOutEnabled
{
  v2 = [(AVCVideoStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 isRTCPTimeOutEnabled];
}

- (void)setRtpTimeOutIntervalSec:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCVideoStream setRtpTimeOutIntervalSec:]";
      __int16 v16 = 1024;
      int v17 = 525;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] rtpTimeOutInterval];
  if (v7 != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setRtpTimeOutInterval:a3];
    if (self->_shouldUseXPC)
    {
      uint64_t v10 = @"vcMediaStreamRTPTimeoutInterval";
      uint64_t v11 = [NSNumber numberWithDouble:a3];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTPTimeoutInterval" arguments:v9];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setRtpTimeOutInterval:a3];
    }
  }
}

- (double)rtpTimeOutIntervalSec
{
  v2 = [(AVCVideoStream *)self configuration];

  [(AVCMediaStreamConfig *)v2 rtpTimeOutInterval];
  return result;
}

- (void)setRtcpTimeOutIntervalSec:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCVideoStream setRtcpTimeOutIntervalSec:]";
      __int16 v16 = 1024;
      int v17 = 551;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] rtcpTimeOutInterval];
  if (v7 != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setRtcpTimeOutInterval:a3];
    if (self->_shouldUseXPC)
    {
      uint64_t v10 = @"vcMediaStreamRTCPTimeoutInterval";
      uint64_t v11 = [NSNumber numberWithDouble:a3];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPTimeoutInterval" arguments:v9];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpTimeOutInterval:a3];
    }
  }
}

- (double)rtcpTimeOutIntervalSec
{
  v2 = [(AVCVideoStream *)self configuration];

  [(AVCMediaStreamConfig *)v2 rtcpTimeOutInterval];
  return result;
}

- (void)setRtcpSendIntervalSec:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCVideoStream setRtcpSendIntervalSec:]";
      __int16 v16 = 1024;
      int v17 = 577;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpSendIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] rtcpSendInterval];
  if (v7 != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] setRtcpSendInterval:a3];
    if (self->_shouldUseXPC)
    {
      uint64_t v10 = @"vcMediaStreamRTCPSendInterval";
      uint64_t v11 = [NSNumber numberWithDouble:a3];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPSendInterval" arguments:v9];
    }
    else
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpSendInterval:a3];
    }
  }
}

- (double)rtcpSendIntervalSec
{
  v2 = [(AVCVideoStream *)self configuration];

  [(AVCMediaStreamConfig *)v2 rtcpSendInterval];
  return result;
}

- (AVCMediaStreamConfig)configuration
{
  return self->_configuration;
}

- (void)registerBlocksForDelegateNotifications
{
  v16[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke;
  v16[3] = &unk_1E6DB4338;
  v16[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidServerDie" block:v16 queue:self->_callbackQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_150;
  v15[3] = &unk_1E6DB4338;
  v15[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStartConnection" block:v15 queue:self->_callbackQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_170;
  v14[3] = &unk_1E6DB4338;
  v14[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStopConnection" block:v14 queue:self->_callbackQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_172;
  v13[3] = &unk_1E6DB4338;
  v13[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidPause" block:v13 queue:self->_callbackQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_179;
  v12[3] = &unk_1E6DB4338;
  v12[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidResume" block:v12 queue:self->_callbackQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_186;
  v11[3] = &unk_1E6DB4338;
  v11[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTPPacketTimeout" block:v11 queue:self->_callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_190;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTCPPacketTimeout" block:v10 queue:self->_callbackQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_194;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidRecoverFromRTCPTimeout" block:v9 queue:self->_callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_198;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTCPPacketsReceived" block:v8 queue:self->_callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_203;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidGetLastDecodedFrame" block:v7 queue:self->_callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_211;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDownlinkQualityDidChange" block:v6 queue:self->_callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_218;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamUplinkQualityDidChange" block:v5 queue:self->_callbackQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_225;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidUpdateVideoConfiguration" block:v4 queue:self->_callbackQueue];
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) strong];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [a2 objectForKeyedSubscript:@"SERVERDIED"];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v5)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_2();
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_1();
      }
    }
    [v4 delegate];
    if (objc_opt_respondsToSelector())
    {
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-didServerDie");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315906;
          uint64_t v12 = v9;
          __int16 v13 = 2080;
          __int16 v14 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 624;
          __int16 v17 = 2048;
          __int16 v18 = v4;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didServerDie (%p)", (uint8_t *)&v11, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidServerDie:", v4);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 628;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: Server died, but AVCVideoStream has already deallocated, NO-OP", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      int v29 = 136316162;
      uint64_t v30 = v6;
      __int16 v31 = 2080;
      __int16 v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 635;
      __int16 v35 = 2048;
      uint64_t v36 = a3;
      __int16 v37 = 2080;
      v38[0] = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d didStartConnectionBlock: error = %p, double result = %s", (uint8_t *)&v29, 0x30u);
    }
  }
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v9 = [*(id *)(a1 + 32) strong];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      int v11 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamConnectionStarted"];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      __int16 v13 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = [v11 BOOLValue];
          int v29 = 136315906;
          uint64_t v30 = v14;
          __int16 v31 = 2080;
          __int16 v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v33 = 1024;
          int v34 = 646;
          __int16 v35 = 1024;
          LODWORD(v36) = v16;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v29, 0x22u);
        }
      }
      __int16 v17 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      if (v17) {
        __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      [v10 delegate];
      if (objc_opt_respondsToSelector())
      {
        MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "Calling -stream:didStart:error:");
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-didStart");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          uint64_t v19 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = [v11 intValue];
            int v29 = 136316418;
            uint64_t v30 = v18;
            __int16 v31 = 2080;
            __int16 v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v33 = 1024;
            int v34 = 659;
            __int16 v35 = 2048;
            uint64_t v36 = v10;
            __int16 v37 = 1024;
            LODWORD(v38[0]) = v20;
            WORD2(v38[0]) = 2112;
            *(void *)((char *)v38 + 6) = v17;
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v29, 0x36u);
          }
        }
        objc_msgSend((id)objc_msgSend(v10, "delegate"), "stream:didStart:error:", v10, objc_msgSend(v11, "BOOLValue"), v17);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      os_log_t v22 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v23 = [v11 BOOLValue];
      int v29 = 136316162;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      __int16 v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 664;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 1024;
      LODWORD(v38[0]) = v23;
      __int16 v24 = "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didStart started[%d]";
      uint64_t v25 = v22;
      uint32_t v26 = 44;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      __int16 v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v29 = 136315650;
      uint64_t v30 = v27;
      __int16 v31 = 2080;
      __int16 v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 640;
      __int16 v24 = "AVCVideoStream [%s] %s:%d AVCVideoStream: didStartConnectionBlock: strongSelf == nil";
      uint64_t v25 = v28;
      uint32_t v26 = 28;
    }
    _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_170(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    id v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = v4;
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidStop:", v4);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          __int16 v15 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 679;
          __int16 v18 = 2048;
          uint64_t v19 = v5;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didStop", (uint8_t *)&v12, 0x26u);
        }
      }
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-didStop");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          __int16 v15 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 680;
          __int16 v18 = 2048;
          uint64_t v19 = v5;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didStop (%p)", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_172(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamPaused"];
      uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      if (v8) {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-didPause");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136316418;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            int v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 705;
            __int16 v20 = 2048;
            uint64_t v21 = v6;
            __int16 v22 = 1024;
            int v23 = [v7 intValue];
            __int16 v24 = 2112;
            uint64_t v25 = v8;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didPause (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
          }
        }
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didPause:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v7 BOOLValue];
          int v14 = 136316162;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          int v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 710;
          __int16 v20 = 2048;
          uint64_t v21 = v6;
          __int16 v22 = 1024;
          int v23 = v13;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didPause [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_179(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamResumed"];
      uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      if (v8) {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector())
      {
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCVideoStream-didResume");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136316418;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            int v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 735;
            __int16 v20 = 2048;
            uint64_t v21 = v6;
            __int16 v22 = 1024;
            int v23 = [v7 intValue];
            __int16 v24 = 2112;
            uint64_t v25 = v8;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didResume (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
          }
        }
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didResume:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v7 BOOLValue];
          int v14 = 136316162;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          int v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 740;
          __int16 v20 = 2048;
          uint64_t v21 = v6;
          __int16 v22 = 1024;
          int v23 = v13;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didResume [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_186(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    id v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidRTPTimeOut:", v5);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 756;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p RTP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_190(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    id v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidRTCPTimeOut:", v5);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 772;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_194(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    id v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidRecoverFromRTCPTimeOut:", v5);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 788;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client=%p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_198(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = v5;
      objc_msgSend(v5, "vcMediaStream:didReceiveRTCPPackets:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamRTCPPackets"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315906;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          __int16 v12 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 803;
          __int16 v15 = 2048;
          uint64_t v16 = v6;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p received RTCP packets", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_203(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    [v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "stream:didGetLastDecodedFrame:", v5, objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamLastDecodedFrame"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = (objc_class *)objc_opt_class();
          int v9 = 136316162;
          uint64_t v10 = v6;
          __int16 v11 = 2080;
          __int16 v12 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 813;
          __int16 v15 = 2080;
          uint64_t v16 = [NSStringFromClass(v8) UTF8String];
          __int16 v17 = 2048;
          __int16 v18 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s: notified client %p didGetLastDecodedFrame", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_211(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDownlinkQualityInfo"];
      [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:downlinkQualityDidChange:", v6, +[AVCVideoStream extractClientDownlinkQualityInfoDictionary:](AVCVideoStream, "extractClientDownlinkQualityInfoDictionary:", v7));
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136316162;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          __int16 v13 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 833;
          __int16 v16 = 2048;
          __int16 v17 = v6;
          __int16 v18 = 2080;
          uint64_t v19 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of downlinkQualityDidChange [%s]", (uint8_t *)&v10, 0x30u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_218(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamUplinkQualityInfo"];
      [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:uplinkQualityDidChange:", v6, +[AVCVideoStream extractClientUplinkQualityInfoDictionary:](AVCVideoStream, "extractClientUplinkQualityInfoDictionary:", v7));
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136316162;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          __int16 v13 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 852;
          __int16 v16 = 2048;
          __int16 v17 = v6;
          __int16 v18 = 2080;
          uint64_t v19 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of uplinkQualityDidChange [%s]", (uint8_t *)&v10, 0x30u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_225(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDidUpdateVideoConfiguration"];
      uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      uint64_t v9 = [a2 objectForKeyedSubscript:@"vcMediaStreamUpdatedVideoConfiguration"];
      if (v8) {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      if (v9) {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "configuration"), "video"), "setUpWithDictionary:", v9);
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didUpdateVideoConfiguration:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136316162;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          int v15 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 886;
          __int16 v18 = 2048;
          uint64_t v19 = v6;
          __int16 v20 = 1024;
          int v21 = [v7 BOOLValue];
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didUpdateVideoConfiguration [%d]", (uint8_t *)&v12, 0x2Cu);
        }
      }
    }
  }
}

- (void)deregisterBlocksForDelegateNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidStartConnection"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidStopConnection"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidPause"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidResume"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamRTPPacketTimeout"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamRTCPPacketTimeout"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidRecoverFromRTCPTimeout"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamRTCPPacketsReceived"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidGetLastDecodedFrame"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDownlinkQualityDidChange"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamUplinkQualityDidChange"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcMediaStreamDidUpdateVideoConfiguration"];
}

+ (id)extractClientDownlinkQualityInfoDictionary:(id)a3
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"avcKeyVideoStreamDownlinkOperatingBitrate";
  v6[0] = [a3 objectForKeyedSubscript:0x1F3D47B50];
  v5[1] = @"avcKeyVideoStreamDownlinkOptimalBitrate";
  v6[1] = [a3 objectForKeyedSubscript:0x1F3D47B30];
  v5[2] = @"avcKeyVideoStreamDownlinkIsOperatingAtMaxBitrate";
  v6[2] = [a3 objectForKeyedSubscript:0x1F3D47B70];
  v5[3] = @"avcKeyVideoStreamDownlinkIsOperatingAtMinBitrate";
  v6[3] = [a3 objectForKeyedSubscript:0x1F3D47B90];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
}

+ (id)extractClientUplinkQualityInfoDictionary:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"avcKeyVideoStreamUplinkOperatingBitrate";
  v5[0] = [a3 objectForKeyedSubscript:0x1F3D47BB0];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (void)vcMediaStream:(id)a3 didStartStream:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCVideoStream vcMediaStream:didStartStream:error:]";
      __int16 v15 = 1024;
      int v16 = 923;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 1024;
      BOOL v20 = v6;
      __int16 v21 = 2112;
      id v22 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, didStartStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "Calling -stream:didStart:error:");
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self didStart:v6 error:a5];
  }
}

- (void)vcMediaStreamDidStop:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCVideoStream vcMediaStreamDidStop:]";
      __int16 v11 = 1024;
      int v12 = 931;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "Calling -streamDidStop:");
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] streamDidStop:self];
  }
}

- (void)vcMediaStream:(id)a3 didPauseStream:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      id v14 = "-[AVCVideoStream vcMediaStream:didPauseStream:error:]";
      __int16 v15 = 1024;
      int v16 = 939;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 1024;
      BOOL v20 = v6;
      __int16 v21 = 2112;
      id v22 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, didPauseStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self didPause:v6 error:a5];
  }
}

- (void)vcMediaStream:(id)a3 didResumeStream:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      id v14 = "-[AVCVideoStream vcMediaStream:didResumeStream:error:]";
      __int16 v15 = 1024;
      int v16 = 946;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 1024;
      BOOL v20 = v6;
      __int16 v21 = 2112;
      id v22 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, didResumeStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self didResume:v6 error:a5];
  }
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCVideoStream vcMediaStreamDidRTPTimeOut:]";
      __int16 v11 = 1024;
      int v12 = 953;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] streamDidRTPTimeOut:self];
  }
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCVideoStream vcMediaStreamDidRTCPTimeOut:]";
      __int16 v11 = 1024;
      int v12 = 960;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] streamDidRTCPTimeOut:self];
  }
}

- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(a4);
        }
        id v11 = +[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:](AVCRTCPPacket, "newPacketWithRTCPPacket:packetLength:", [*(id *)(*((void *)&v26 + 1) + 8 * v10) bytes], objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v10), "length"));
        if (v11) {
          [v6 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [a4 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v8);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      id v18 = "-[AVCVideoStream vcMediaStream:didReceiveRTCPPackets:]";
      __int16 v19 = 1024;
      int v20 = 979;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d conf=%@, rtcpPackets=%@", buf, 0x30u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self didReceiveRTCPPackets:v6];
  }
}

- (void)vcMediaStream:(id)a3 downlinkQualityDidChange:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCVideoStream vcMediaStream:downlinkQualityDidChange:]";
      __int16 v13 = 1024;
      int v14 = 988;
      __int16 v15 = 2112;
      id v16 = a3;
      __int16 v17 = 2112;
      id v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, downlinkQualityInfo=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self downlinkQualityDidChange:+[AVCVideoStream extractClientDownlinkQualityInfoDictionary:a4]];
  }
}

- (void)vcMediaStream:(id)a3 uplinkQualityDidChange:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCVideoStream vcMediaStream:uplinkQualityDidChange:]";
      __int16 v13 = 1024;
      int v14 = 995;
      __int16 v15 = 2112;
      id v16 = a3;
      __int16 v17 = 2112;
      id v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, uplinkQualityInfo=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self uplinkQualityDidChange:+[AVCVideoStream extractClientUplinkQualityInfoDictionary:a4]];
  }
}

- (void)vcMediaStream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5 dictionary:(id)a6
{
  BOOL v8 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a6 && a4) {
    [(AVCVideoStreamConfig *)[(AVCMediaStreamConfig *)[(AVCVideoStream *)self configuration] video] setUpWithDictionary:a6];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    if (a3)
    {
      __int16 v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      if (a5) {
        goto LABEL_7;
      }
    }
    else
    {
      __int16 v11 = "<nil>";
      if (a5)
      {
LABEL_7:
        uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
        if (a6)
        {
LABEL_8:
          __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
          goto LABEL_12;
        }
LABEL_11:
        __int16 v13 = "<nil>";
LABEL_12:
        asprintf(&__str, "stream=%s, didUpdateVideoConfiguration=%d, error=%s, configDict=%s", v11, v8, v12, v13);
        if (__str)
        {
          id v18 = a5;
          __lasts = 0;
          int v14 = strtok_r(__str, "\n", &__lasts);
          __int16 v15 = (os_log_t *)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              __int16 v17 = *v15;
              if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v22 = v16;
                __int16 v23 = 2080;
                id v24 = "-[AVCVideoStream vcMediaStream:didUpdateVideoConfiguration:error:dictionary:]";
                __int16 v25 = 1024;
                int v26 = 1005;
                __int16 v27 = 2080;
                long long v28 = "";
                __int16 v29 = 2080;
                uint64_t v30 = v14;
                _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            int v14 = strtok_r(0, "\n", &__lasts);
          }
          while (v14);
          free(__str);
          a5 = v18;
        }
        goto LABEL_19;
      }
    }
    uint64_t v12 = "<nil>";
    if (a6) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_19:
  [(AVCVideoStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoStreamDelegate *)[(AVCVideoStream *)self delegate] stream:self didUpdateVideoConfiguration:v8 error:a5];
  }
}

- (void)vcMediaStreamServerDidDie:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCVideoStream vcMediaStreamServerDidDie:]";
      __int16 v11 = 1024;
      int v12 = 1016;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, serverDidDie", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCVideoStream *)self stop];
}

+ (id)capabilities
{
  return +[VCVideoStream capabilities];
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing... no results dict", v2, v3, v4, v5, v6);
}

- (void)initWithLocalAddress:(uint64_t)a1 networkSockets:(void *)a2 IDSDestination:connectionClientID:callID:options:error:.cold.2(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing no capabilities dict result[%s]", v4, v5, v6, v7, v8);
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing... return stream token failed", v2, v3, v4, v5, v6);
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: clientSessionID in the options is not of NSUUIDtype", v2, v3, v4, v5, v6);
}

- (void)configure:(uint64_t)a1 error:(id *)a2 .cold.1(uint64_t a1, id *a2)
{
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_19();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "AVCVideoStream [%s] %s:%d Invalid video configuration: error[%s]", v4, v5, v6, v7, v8);
}

- (void)configure:(NSObject *)a3 error:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_19();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, "AVCVideoStream [%s] %s:%d Invalid video configuration: error[%s]", v4, 0x26u);
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: Media server died, notifying client", v2, v3, v4, v5, v6);
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: AVC server died, notifying client", v2, v3, v4, v5, v6);
}

@end