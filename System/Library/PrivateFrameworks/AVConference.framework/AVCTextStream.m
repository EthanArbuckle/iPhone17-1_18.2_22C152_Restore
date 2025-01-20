@interface AVCTextStream
- (AVCMediaStreamConfig)configuration;
- (AVCTextStream)initWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5;
- (AVCTextStream)initWithRTPNWConnectionClientID:(id)a3 rtcpNWConnectionClientID:(id)a4 options:(id)a5 error:(id *)a6;
- (AVCTextStreamDelegate)delegate;
- (BOOL)configure:(id)a3 error:(id *)a4;
- (BOOL)initializeServerWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5;
- (BOOL)isRTCPEnabled;
- (BOOL)isRTCPTimeOutEnabled;
- (BOOL)isRTPTimeOutEnabled;
- (BOOL)setupTextStreamOutOfProcessWithClientArgs:(id)a3 error:(id *)a4;
- (BOOL)validateResultsDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)capabilities;
- (double)rtcpSendIntervalSec;
- (double)rtcpTimeOutIntervalSec;
- (double)rtpTimeOutIntervalSec;
- (id)newNSErrorWithErrorDictionary:(id)a3;
- (id)validateInitializeConnectionResult:(id)a3;
- (int64_t)direction;
- (int64_t)streamToken;
- (void)dealloc;
- (void)deregisterBlocksForDelegateNotifications;
- (void)pause;
- (void)refreshLoggingParameters;
- (void)registerBlocksForDelegateNotifications;
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
@end

@implementation AVCTextStream

- (AVCTextStream)initWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        v11 = (__CFString *)*a5;
      }
      else {
        v11 = @"nil";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v35 = v9;
      __int16 v36 = 2080;
      v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
      __int16 v38 = 1024;
      int v39 = 58;
      __int16 v40 = 2112;
      id v41 = a3;
      __int16 v42 = 2112;
      *(void *)v43 = a4;
      *(_WORD *)&v43[8] = 2112;
      *(void *)&v43[10] = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d socketsDictionary=%@, callID=%@, error=%@", buf, 0x3Au);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)AVCTextStream;
  v12 = [(AVCTextStream *)&v33 init];
  if (!v12) {
    goto LABEL_47;
  }
  v13 = v12;
  [(AVCTextStream *)v12 refreshLoggingParameters];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v15 = dispatch_queue_create_with_target_V2("com.apple.AVConference.avctextstream.callback.queue", 0, CustomRootQueue);
  v13->_queue = (OS_dispatch_queue *)v15;
  if (!v15)
  {
    if ((AVCTextStream *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream initWithNetworkSockets:callID:error:]();
        }
      }
      goto LABEL_46;
    }
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[(AVCTextStream *)v13 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_46;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v35 = v25;
    __int16 v36 = 2080;
    v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
    __int16 v38 = 1024;
    int v39 = 64;
    __int16 v40 = 2112;
    id v41 = v22;
    __int16 v42 = 2048;
    *(void *)v43 = v13;
    v27 = "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback queue";
    goto LABEL_53;
  }
  v16 = objc_alloc_init(AVConferenceXPCClient);
  v13->_connection = v16;
  if (!v16)
  {
    if ((AVCTextStream *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream initWithNetworkSockets:callID:error:]();
        }
      }
      goto LABEL_46;
    }
    if (objc_opt_respondsToSelector()) {
      v23 = (__CFString *)[(AVCTextStream *)v13 performSelector:sel_logPrefix];
    }
    else {
      v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_46;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v35 = v28;
    __int16 v36 = 2080;
    v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
    __int16 v38 = 1024;
    int v39 = 69;
    __int16 v40 = 2112;
    id v41 = v23;
    __int16 v42 = 2048;
    *(void *)v43 = v13;
    v27 = "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback XPC connection";
LABEL_53:
    _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
    goto LABEL_46;
  }
  [(AVCTextStream *)v13 registerBlocksForDelegateNotifications];
  if ([(AVCTextStream *)v13 initializeServerWithNetworkSockets:a3 callID:a4 error:a5])
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        pid_t v19 = getpid();
        int streamToken = v13->_streamToken;
        if (a5) {
          v21 = (__CFString *)*a5;
        }
        else {
          v21 = @"None";
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v35 = v17;
        __int16 v36 = 2080;
        v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
        __int16 v38 = 1024;
        int v39 = 94;
        __int16 v40 = 2048;
        id v41 = v13;
        __int16 v42 = 1024;
        *(_DWORD *)v43 = v19;
        *(_WORD *)&v43[4] = 2112;
        *(void *)&v43[6] = a4;
        *(_WORD *)&v43[14] = 1024;
        *(_DWORD *)&v43[16] = streamToken;
        __int16 v44 = 2112;
        v45 = v21;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p) PID=%d, callID=%@, streamToken=%d, error=%@", buf, 0x46u);
      }
    }
    return v13;
  }
  if ((AVCTextStream *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCTextStream initWithNetworkSockets:callID:error:]();
      }
    }
    goto LABEL_46;
  }
  if (objc_opt_respondsToSelector()) {
    v24 = (__CFString *)[(AVCTextStream *)v13 performSelector:sel_logPrefix];
  }
  else {
    v24 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = v29;
      __int16 v36 = 2080;
      v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
      __int16 v38 = 1024;
      int v39 = 74;
      __int16 v40 = 2112;
      id v41 = v24;
      __int16 v42 = 2048;
      *(void *)v43 = v13;
      v27 = "AVCTextStream [%s] %s:%d %@(%p) Failed to instantiate servers side object";
      goto LABEL_53;
    }
  }
LABEL_46:

LABEL_47:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v35 = v30;
      __int16 v36 = 2080;
      v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
      __int16 v38 = 1024;
      int v39 = 96;
      __int16 v40 = 2048;
      id v41 = 0;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (AVCTextStream)initWithRTPNWConnectionClientID:(id)a3 rtcpNWConnectionClientID:(id)a4 options:(id)a5 error:(id *)a6
{
  *(void *)&v70[3] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [a3 UUIDString];
      uint64_t v14 = [a4 UUIDString];
      if (a5)
      {
        dispatch_queue_t v15 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
        if (a6) {
          goto LABEL_5;
        }
      }
      else
      {
        dispatch_queue_t v15 = "<nil>";
        if (a6)
        {
LABEL_5:
          v16 = (__CFString *)*a6;
          if (!*a6)
          {
            uint64_t v17 = "<nil>";
LABEL_10:
            *(_DWORD *)buf = 136316674;
            uint64_t v61 = v11;
            __int16 v62 = 2080;
            v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
            __int16 v64 = 1024;
            int v65 = 125;
            __int16 v66 = 2112;
            uint64_t v67 = v13;
            __int16 v68 = 2112;
            *(void *)v69 = v14;
            *(_WORD *)&v69[8] = 2080;
            *(void *)&v69[10] = v15;
            *(_WORD *)&v69[18] = 2080;
            *(void *)v70 = v17;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpClientID=%@, rtcpClientID=%@, options=%s, error=%s", buf, 0x44u);
            goto LABEL_11;
          }
LABEL_9:
          uint64_t v17 = (const char *)objc_msgSend((id)-[__CFString description](v16, "description"), "UTF8String");
          goto LABEL_10;
        }
      }
      v16 = @"nil";
      goto LABEL_9;
    }
  }
LABEL_11:
  v59.receiver = self;
  v59.super_class = (Class)AVCTextStream;
  v18 = [(AVCTextStream *)&v59 init];
  if (!v18) {
    goto LABEL_69;
  }
  pid_t v19 = v18;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v20)
  {
    if ((AVCTextStream *)objc_opt_class() == v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]();
        }
      }
      goto LABEL_68;
    }
    if (objc_opt_respondsToSelector()) {
      v51 = (__CFString *)[(AVCTextStream *)v19 performSelector:sel_logPrefix];
    }
    else {
      v51 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_68;
    }
    uint64_t v53 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v61 = v53;
    __int16 v62 = 2080;
    v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
    __int16 v64 = 1024;
    int v65 = 129;
    __int16 v66 = 2112;
    uint64_t v67 = (uint64_t)v51;
    __int16 v68 = 2048;
    *(void *)v69 = v19;
    uint64_t v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate clientArgs dictionary";
    goto LABEL_77;
  }
  if ([a5 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"]) {
    uint64_t v21 = [a5 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"];
  }
  else {
    uint64_t v21 = 0;
  }
  if ([a5 objectForKeyedSubscript:@"avcMediaStreamOptionIsOriginator"]) {
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"avcMediaStreamOptionIsOriginator"), "BOOLValue");
  }
  int v22 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"avcMediaStreamOptionRunInProcess"), "BOOLValue");
  if (!a3)
  {
    if (a6) {
      *a6 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"rtpClientID cannot not be nil"];
    }
    if ((AVCTextStream *)objc_opt_class() == v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]();
        }
      }
      goto LABEL_68;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v25 = (__CFString *)[(AVCTextStream *)v19 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_68;
    }
    uint64_t v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v61 = v44;
    __int16 v62 = 2080;
    v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
    __int16 v64 = 1024;
    int v65 = 132;
    __int16 v66 = 2112;
    uint64_t v67 = (uint64_t)v25;
    __int16 v68 = 2048;
    *(void *)v69 = v19;
    uint64_t v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to initialize AVCTextStream because of invalid parameters";
    goto LABEL_77;
  }
  int v23 = v22;
  uint64_t v58 = v21;
  if ((AVCTextStream *)objc_opt_class() == v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = "out of";
        uint64_t v61 = v26;
        *(_DWORD *)buf = 136315906;
        v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
        __int16 v62 = 2080;
        if (v23) {
          uint64_t v28 = "in";
        }
        __int16 v64 = 1024;
        int v65 = 134;
        __int16 v66 = 2080;
        uint64_t v67 = (uint64_t)v28;
        uint64_t v29 = "AVCTextStream [%s] %s:%d AVCTextStream will run %s process";
        uint64_t v30 = v27;
        uint32_t v31 = 38;
        goto LABEL_38;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v24 = (__CFString *)[(AVCTextStream *)v19 performSelector:sel_logPrefix];
    }
    else {
      v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      objc_super v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v34 = "out of";
        uint64_t v61 = v32;
        *(_DWORD *)buf = 136316418;
        v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
        __int16 v62 = 2080;
        if (v23) {
          v34 = "in";
        }
        __int16 v64 = 1024;
        int v65 = 134;
        __int16 v66 = 2112;
        uint64_t v67 = (uint64_t)v24;
        __int16 v68 = 2048;
        *(void *)v69 = v19;
        *(_WORD *)&v69[8] = 2080;
        *(void *)&v69[10] = v34;
        uint64_t v29 = "AVCTextStream [%s] %s:%d %@(%p) AVCTextStream will run %s process";
        uint64_t v30 = v33;
        uint32_t v31 = 58;
LABEL_38:
        _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
  }
  [(AVCTextStream *)v19 refreshLoggingParameters];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(a3, "UUIDString"), @"vcMediaStreamConnectionClientID");
  if (a4) {
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(a4, "UUIDString"), @"vcMediaStreamRTCPConnectionClientID");
  }
  uint64_t v35 = v58;
  if (v58) {
    [v20 setObject:v58 forKeyedSubscript:@"vcMediaStreamCallID"];
  }
  if ([a5 objectForKeyedSubscript:@"avcMediaStreamOptionRemoteEndpointInfo"]) {
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(a5, "objectForKeyedSubscript:", @"avcMediaStreamOptionRemoteEndpointInfo"), @"vcMediaStreamRemoteEndpointInfo");
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v37 = dispatch_queue_create_with_target_V2("com.apple.AVConference.avctextstream.callback.queue", 0, CustomRootQueue);
  v19->_queue = (OS_dispatch_queue *)v37;
  if (v37)
  {
    if (v23)
    {
      if ((AVCTextStream *)objc_opt_class() == v19)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.4();
          }
        }
        goto LABEL_68;
      }
      if (objc_opt_respondsToSelector()) {
        __int16 v38 = (__CFString *)[(AVCTextStream *)v19 performSelector:sel_logPrefix];
      }
      else {
        __int16 v38 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v47 = VRTraceErrorLogLevelToCSTR(),
            v45 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_68:

LABEL_69:
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-init");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v48 = VRTraceErrorLogLevelToCSTR();
          v49 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v61 = v48;
            __int16 v62 = 2080;
            v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
            __int16 v64 = 1024;
            int v65 = 172;
            __int16 v66 = 2048;
            uint64_t v67 = 0;
            _os_log_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p)", buf, 0x26u);
          }
        }
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v61 = v47;
      __int16 v62 = 2080;
      v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      __int16 v64 = 1024;
      int v65 = 159;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v38;
      __int16 v68 = 2048;
      *(void *)v69 = v19;
      uint64_t v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to create in process VCTextStream as it is not supported";
LABEL_77:
      _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x30u);
      goto LABEL_68;
    }
    if (![(AVCTextStream *)v19 setupTextStreamOutOfProcessWithClientArgs:v20 error:a6])
    {
      if ((AVCTextStream *)objc_opt_class() == v19)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.5();
          }
        }
        goto LABEL_68;
      }
      if (objc_opt_respondsToSelector()) {
        v54 = (__CFString *)[(AVCTextStream *)v19 performSelector:sel_logPrefix];
      }
      else {
        v54 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_68;
      }
      uint64_t v57 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v61 = v57;
      __int16 v62 = 2080;
      v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      __int16 v64 = 1024;
      int v65 = 156;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v54;
      __int16 v68 = 2048;
      *(void *)v69 = v19;
      uint64_t v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to instantiate servers side object";
      goto LABEL_77;
    }
  }
  else if ((AVCTextStream *)objc_opt_class() == v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v52 = (__CFString *)[(AVCTextStream *)v19 performSelector:sel_logPrefix];
    }
    else {
      v52 = &stru_1F3D3E450;
    }
    uint64_t v35 = v58;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v61 = v55;
        __int16 v62 = 2080;
        v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
        __int16 v64 = 1024;
        int v65 = 152;
        __int16 v66 = 2112;
        uint64_t v67 = (uint64_t)v52;
        __int16 v68 = 2048;
        *(void *)v69 = v19;
        _os_log_error_impl(&dword_1E1EA4000, v56, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback queue", buf, 0x30u);
      }
    }
  }

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    __int16 v40 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      pid_t v41 = getpid();
      int streamToken = v19->_streamToken;
      if (a6) {
        v43 = (__CFString *)*a6;
      }
      else {
        v43 = @"None";
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v61 = v39;
      __int16 v62 = 2080;
      v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      __int16 v64 = 1024;
      int v65 = 170;
      __int16 v66 = 2048;
      uint64_t v67 = (uint64_t)v19;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = v41;
      *(_WORD *)&v69[4] = 2112;
      *(void *)&v69[6] = v35;
      *(_WORD *)&v69[14] = 1024;
      *(_DWORD *)&v69[16] = streamToken;
      LOWORD(v70[0]) = 2112;
      *(void *)((char *)v70 + 2) = v43;
      _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p) PID=%d, callID=%@, streamToken=%d, error=%@", buf, 0x46u);
    }
  }
  return v19;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(AVCTextStream *)self setCapabilities:0];
  [(AVCTextStream *)self setConfiguration:0];
  [(AVCTextStream *)self deregisterBlocksForDelegateNotifications];
  [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamTerminateText"];

  self->_connection = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      v10 = "-[AVCTextStream dealloc]";
      __int16 v11 = 1024;
      int v12 = 193;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-dealloc (%p)", buf, 0x26u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCTextStream;
  [(AVCTextStream *)&v6 dealloc];
}

- (void)refreshLoggingParameters
{
  CFPreferencesAppSynchronize(@"com.apple.VideoConference");
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
  VRTraceReset();

  VRTracePrintLoggingInfo();
}

- (BOOL)validateResultsDictionary:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_58;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v12)
      {
        -[AVCTextStream validateResultsDictionary:error:]();
        goto LABEL_58;
      }
      return v12;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_58;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v12) {
      return v12;
    }
    int v29 = 136316162;
    uint64_t v30 = v16;
    __int16 v31 = 2080;
    uint64_t v32 = "-[AVCTextStream validateResultsDictionary:error:]";
    __int16 v33 = 1024;
    int v34 = 211;
    __int16 v35 = 2112;
    __int16 v36 = v8;
    __int16 v37 = 2048;
    __int16 v38 = self;
    v18 = "AVCTextStream [%s] %s:%d %@(%p) no results dict";
    pid_t v19 = v17;
LABEL_56:
    uint32_t v27 = 48;
LABEL_57:
    _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v29, v27);
    goto LABEL_58;
  }
  if ([a3 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            -[AVCTextStream validateResultsDictionary:error:]();
            if (a4)
            {
LABEL_48:
              uint64_t v26 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"server died"];
              LOBYTE(v12) = 0;
              *a4 = v26;
              return v12;
            }
LABEL_58:
            LOBYTE(v12) = 0;
            return v12;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateResultsDictionary:error:]();
          if (!a4) {
            goto LABEL_58;
          }
          goto LABEL_48;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v29 = 136316162;
            uint64_t v30 = v13;
            __int16 v31 = 2080;
            uint64_t v32 = "-[AVCTextStream validateResultsDictionary:error:]";
            __int16 v33 = 1024;
            int v34 = 216;
            __int16 v35 = 2112;
            __int16 v36 = v7;
            __int16 v37 = 2048;
            __int16 v38 = self;
            _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) server died", (uint8_t *)&v29, 0x30u);
            if (!a4) {
              goto LABEL_58;
            }
            goto LABEL_48;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          int v29 = 136316162;
          uint64_t v30 = v13;
          __int16 v31 = 2080;
          uint64_t v32 = "-[AVCTextStream validateResultsDictionary:error:]";
          __int16 v33 = 1024;
          int v34 = 216;
          __int16 v35 = 2112;
          __int16 v36 = v7;
          __int16 v37 = 2048;
          __int16 v38 = self;
          _os_log_fault_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_FAULT, "AVCTextStream [%s] %s:%d %@(%p) server died", (uint8_t *)&v29, 0x30u);
          if (!a4) {
            goto LABEL_58;
          }
          goto LABEL_48;
        }
      }
    }
    if (a4) {
      goto LABEL_48;
    }
    goto LABEL_58;
  }
  id v9 = (id)[a3 objectForKeyedSubscript:@"ERROR"];
  v10 = v9;
  if (a4) {
    *a4 = v9;
  }
  if (!v9 && ![a3 objectForKeyedSubscript:@"TIMEOUT"])
  {
    LOBYTE(v12) = 1;
    return v12;
  }
  if ((AVCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_58;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v12) {
      return v12;
    }
    if (v10) {
      int v22 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
    }
    else {
      int v22 = "<nil>";
    }
    int v29 = 136316162;
    uint64_t v30 = v20;
    __int16 v31 = 2080;
    uint64_t v32 = "-[AVCTextStream validateResultsDictionary:error:]";
    __int16 v33 = 1024;
    int v34 = 230;
    __int16 v35 = 2080;
    __int16 v36 = (void *)v22;
    __int16 v37 = 2080;
    __int16 v38 = (AVCTextStream *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    v18 = "AVCTextStream [%s] %s:%d error initializing error[%s] resultDict[%s]";
    pid_t v19 = v21;
    goto LABEL_56;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v11 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v11 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_58;
  }
  uint64_t v23 = VRTraceErrorLogLevelToCSTR();
  v24 = *MEMORY[0x1E4F47A50];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (v10) {
      uint64_t v25 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
    }
    else {
      uint64_t v25 = "<nil>";
    }
    int v29 = 136316674;
    uint64_t v30 = v23;
    __int16 v31 = 2080;
    uint64_t v32 = "-[AVCTextStream validateResultsDictionary:error:]";
    __int16 v33 = 1024;
    int v34 = 230;
    __int16 v35 = 2112;
    __int16 v36 = v11;
    __int16 v37 = 2048;
    __int16 v38 = self;
    __int16 v39 = 2080;
    __int16 v40 = v25;
    __int16 v41 = 2080;
    uint64_t v42 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    v18 = "AVCTextStream [%s] %s:%d %@(%p) error initializing error[%s] resultDict[%s]";
    pid_t v19 = v24;
    uint32_t v27 = 68;
    goto LABEL_57;
  }
  return v12;
}

- (BOOL)initializeServerWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v10 = v9;
  if (a4) {
    [v9 setObject:a4 forKeyedSubscript:@"vcMediaStreamCallID"];
  }
  __int16 v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"vcMediaStreamDictionary", 0);
  id v12 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamInitializeText" arguments:v11 xpcArguments:a3];
  if (![(AVCTextStream *)self validateResultsDictionary:v12 error:a5]) {
    goto LABEL_15;
  }
  -[AVCTextStream setCapabilities:](self, "setCapabilities:", [v12 objectForKeyedSubscript:@"vcMediaStreamStreamCapabilities"]);
  self->_int streamToken = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"vcMediaStreamToken"), "integerValue");
  if (!self->_capabilities)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream initializeServerWithNetworkSockets:callID:error:](v15, v12, v16);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          if (v12) {
            uint64_t v20 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
          }
          else {
            uint64_t v20 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v22 = v17;
          __int16 v23 = 2080;
          v24 = "-[AVCTextStream initializeServerWithNetworkSockets:callID:error:]";
          __int16 v25 = 1024;
          int v26 = 253;
          __int16 v27 = 2112;
          uint64_t v28 = v14;
          __int16 v29 = 2048;
          uint64_t v30 = self;
          __int16 v31 = 2080;
          uint64_t v32 = v20;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) error initializing no capabilities dict result[%s]", buf, 0x3Au);
        }
      }
    }
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_16:

  return v13;
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"ERROR_DOMAIN"];
  uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue");
  uint64_t v7 = [a3 objectForKeyedSubscript:@"ERROR_USERINFO"];

  return (id)[v4 initWithDomain:v5 code:v6 userInfo:v7];
}

- (void)registerBlocksForDelegateNotifications
{
  v13[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke;
  v13[3] = &unk_1E6DB90F8;
  v13[4] = v4;
  v13[5] = a2;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidServerDie" block:v13 queue:self->_queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_69;
  v12[3] = &unk_1E6DB4338;
  v12[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStartConnection" block:v12 queue:self->_queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_77;
  v11[3] = &unk_1E6DB4338;
  v11[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStopConnection" block:v11 queue:self->_queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_79;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidPause" block:v10 queue:self->_queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_86;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidResume" block:v9 queue:self->_queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_93;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTPPacketTimeout" block:v8 queue:self->_queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_97;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTCPPacketTimeout" block:v7 queue:self->_queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_101;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidRecoverFromRTCPTimeout" block:v6 queue:self->_queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_105;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v4;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTCPPacketsReceived" block:v5 queue:self->_queue];
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    v3 = (char *)[*(id *)(a1 + 32) strong];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          BOOL v13 = (objc_class *)objc_opt_class();
          Name = class_getName(v13);
          uint64_t v15 = sel_getName(*(SEL *)(a1 + 40));
          int v16 = 136316162;
          uint64_t v17 = v6;
          __int16 v18 = 2080;
          pid_t v19 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 279;
          __int16 v22 = 2080;
          __int16 v23 = Name;
          __int16 v24 = 2080;
          __int16 v25 = v15;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d [%s %s] server died, notifying client", (uint8_t *)&v16, 0x30u);
        }
      }
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-didServerDie");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        id v9 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315906;
          uint64_t v17 = v8;
          __int16 v18 = 2080;
          pid_t v19 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 280;
          __int16 v22 = 2048;
          __int16 v23 = v3;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didServerDie (%p)", (uint8_t *)&v16, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v3, "delegate"), "streamDidServerDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      id v12 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315650;
          uint64_t v17 = v10;
          __int16 v18 = 2080;
          pid_t v19 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 283;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d AVCTextStream: server died, but AVCTextStream has already deallocated, NO-OP", (uint8_t *)&v16, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_cold_1();
      }
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_69(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
      int v33 = 136316162;
      uint64_t v34 = v6;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 291;
      __int16 v39 = 2048;
      __int16 v40 = a3;
      __int16 v41 = 2080;
      *(void *)uint64_t v42 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d didStartConnectionBlock: error = %p, result = %s", (uint8_t *)&v33, 0x30u);
    }
  }
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v9 = [*(id *)(a1 + 32) strong];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      __int16 v11 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamConnectionStarted"];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      BOOL v13 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule > 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = (objc_class *)objc_opt_class();
          Name = class_getName(v16);
          int v18 = [v11 BOOLValue];
          int v33 = 136316162;
          uint64_t v34 = v14;
          __int16 v35 = 2080;
          __int16 v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v37 = 1024;
          int v38 = 302;
          __int16 v39 = 2080;
          __int16 v40 = Name;
          __int16 v41 = 1024;
          *(_DWORD *)uint64_t v42 = v18;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d %s: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v33, 0x2Cu);
        }
      }
      pid_t v19 = objc_msgSend(v10, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamError"));
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-didStart");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v21 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = [v11 intValue];
          int v33 = 136316418;
          uint64_t v34 = v20;
          __int16 v35 = 2080;
          __int16 v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v37 = 1024;
          int v38 = 305;
          __int16 v39 = 2048;
          __int16 v40 = (const char *)v10;
          __int16 v41 = 1024;
          *(_DWORD *)uint64_t v42 = v22;
          *(_WORD *)&v42[4] = 2112;
          *(void *)&v42[6] = v19;
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v33, 0x36u);
        }
      }
      objc_msgSend((id)objc_msgSend(v10, "delegate"), "stream:didStart:error:", v10, objc_msgSend(v11, "BOOLValue"), v19);

      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      os_log_t v24 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      __int16 v25 = (objc_class *)objc_opt_class();
      uint64_t v26 = class_getName(v25);
      int v27 = [v11 BOOLValue];
      int v33 = 136316418;
      uint64_t v34 = v23;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 309;
      __int16 v39 = 2080;
      __int16 v40 = v26;
      __int16 v41 = 2048;
      *(void *)uint64_t v42 = v10;
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = v27;
      uint64_t v28 = "AVCTextStream [%s] %s:%d %s: notified client %p of didStart started[%d]";
      __int16 v29 = v24;
      uint32_t v30 = 54;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      uint64_t v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v33 = 136315650;
      uint64_t v34 = v31;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 296;
      uint64_t v28 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didStartConnectionBlock: strongSelf == nil";
      __int16 v29 = v32;
      uint32_t v30 = 28;
    }
    _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v33, v30);
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_77(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3 || [a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v4 = [*(id *)(a1 + 32) strong];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v19 = 136315650;
    uint64_t v20 = v17;
    __int16 v21 = 2080;
    int v22 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 319;
    uint64_t v14 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didStopConnectionBlock: strongSelf == nil";
    uint64_t v15 = v18;
    uint32_t v16 = 28;
LABEL_14:
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    return;
  }
  uint64_t v5 = (char *)v4;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-didStop");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315906;
      uint64_t v20 = v8;
      __int16 v21 = 2080;
      int v22 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 322;
      __int16 v25 = 2048;
      uint64_t v26 = v5;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didStop (%p)", (uint8_t *)&v19, 0x26u);
    }
  }
  objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidStop:", v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    os_log_t v11 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      int v19 = 136316162;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      int v22 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 324;
      __int16 v25 = 2080;
      uint64_t v26 = Name;
      __int16 v27 = 2048;
      uint64_t v28 = v5;
      uint64_t v14 = "AVCTextStream [%s] %s:%d %s: notified client %p of didStop";
      uint64_t v15 = v11;
      uint32_t v16 = 48;
      goto LABEL_14;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_79(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 || [a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) strong];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v21 = 136315650;
    uint64_t v22 = v19;
    __int16 v23 = 2080;
    int v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 334;
    uint32_t v16 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didPauseBlock: strongSelf == nil";
    uint64_t v17 = v20;
    uint32_t v18 = 28;
LABEL_16:
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    return;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamPaused"];
  uint64_t v8 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamError"));
  [v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-didPause");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136316418;
        uint64_t v22 = v9;
        __int16 v23 = 2080;
        int v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 342;
        __int16 v27 = 2048;
        uint64_t v28 = (const char *)v6;
        __int16 v29 = 1024;
        *(_DWORD *)uint32_t v30 = [v7 intValue];
        *(_WORD *)&v30[4] = 2112;
        *(void *)&v30[6] = v8;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didPause (%p) didSucceed=%d, error=%@", (uint8_t *)&v21, 0x36u);
      }
    }
    objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didPause:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
  }

  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    id v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = (objc_class *)objc_opt_class();
      Name = class_getName(v13);
      int v15 = [v7 BOOLValue];
      int v21 = 136316418;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      int v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 347;
      __int16 v27 = 2080;
      uint64_t v28 = Name;
      __int16 v29 = 2048;
      *(void *)uint32_t v30 = v6;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = v15;
      uint32_t v16 = "AVCTextStream [%s] %s:%d %s: notified client %p of didPause [%d]";
      uint64_t v17 = v12;
      uint32_t v18 = 54;
      goto LABEL_16;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_86(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 || [a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) strong];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v21 = 136315650;
    uint64_t v22 = v19;
    __int16 v23 = 2080;
    int v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 357;
    uint32_t v16 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didResumeBlock: strongSelf == nil";
    uint64_t v17 = v20;
    uint32_t v18 = 28;
LABEL_16:
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    return;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamResumed"];
  uint64_t v8 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamError"));
  [v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-didResume");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136316418;
        uint64_t v22 = v9;
        __int16 v23 = 2080;
        int v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 365;
        __int16 v27 = 2048;
        uint64_t v28 = (const char *)v6;
        __int16 v29 = 1024;
        *(_DWORD *)uint32_t v30 = [v7 intValue];
        *(_WORD *)&v30[4] = 2112;
        *(void *)&v30[6] = v8;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didResume (%p) didSucceed=%d, error=%@", (uint8_t *)&v21, 0x36u);
      }
    }
    objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didResume:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
  }

  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    id v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = (objc_class *)objc_opt_class();
      Name = class_getName(v13);
      int v15 = [v7 BOOLValue];
      int v21 = 136316418;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      int v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 370;
      __int16 v27 = 2080;
      uint64_t v28 = Name;
      __int16 v29 = 2048;
      *(void *)uint32_t v30 = v6;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = v15;
      uint32_t v16 = "AVCTextStream [%s] %s:%d %s: notified client %p of didSucceed [%d]";
      uint64_t v17 = v12;
      uint32_t v18 = 54;
      goto LABEL_16;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_93(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 || [a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    BOOL v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v14 = 136315650;
    uint64_t v15 = v12;
    __int16 v16 = 2080;
    uint64_t v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 381;
    uint64_t v9 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didRTPPacketTimeoutBlock: strongSelf == nil";
    uint64_t v10 = v13;
    uint32_t v11 = 28;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return;
  }
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
      uint64_t v8 = (objc_class *)objc_opt_class();
      int v14 = 136316162;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 388;
      __int16 v20 = 2080;
      Name = class_getName(v8);
      __int16 v22 = 2048;
      __int16 v23 = v5;
      uint64_t v9 = "AVCTextStream [%s] %s:%d %s: notified client %p RTP packet timeout";
      uint64_t v10 = v7;
      uint32_t v11 = 48;
      goto LABEL_13;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_97(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 || [a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    BOOL v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v14 = 136315650;
    uint64_t v15 = v12;
    __int16 v16 = 2080;
    uint64_t v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 398;
    uint64_t v9 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didRTCPPacketTimeoutBlock: strongSelf == nil";
    uint64_t v10 = v13;
    uint32_t v11 = 28;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return;
  }
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
      uint64_t v8 = (objc_class *)objc_opt_class();
      int v14 = 136316162;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 406;
      __int16 v20 = 2080;
      Name = class_getName(v8);
      __int16 v22 = 2048;
      __int16 v23 = v5;
      uint64_t v9 = "AVCTextStream [%s] %s:%d %s: notified client %p RTCP packet timeout";
      uint64_t v10 = v7;
      uint32_t v11 = 48;
      goto LABEL_13;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_101(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
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
          uint32_t v11 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 422;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d AVCTextStream: notified client=%p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_105(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = v5;
      [v5 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didReceiveRTCPPackets:", v6, objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamRTCPPackets"));
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = (objc_class *)objc_opt_class();
          int v10 = 136316162;
          uint64_t v11 = v7;
          __int16 v12 = 2080;
          int v13 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 437;
          __int16 v16 = 2080;
          Name = class_getName(v9);
          __int16 v18 = 2048;
          int v19 = v6;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d %s: notified client %p received RTCP packets", (uint8_t *)&v10, 0x30u);
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
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidStartSynchronization"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamRTPPacketTimeout"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamRTCPPacketTimeout"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidRecoverFromRTCPTimeout"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamRTCPPacketsReceived"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcMediaStreamDidServerDie"];
}

- (BOOL)configure:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (([a3 isValidTextConfig] & 1) == 0)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_15;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      -[AVCTextStream configure:error:](v12, a4, v13);
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v14 = VRTraceErrorLogLevelToCSTR(),
            int v15 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_15:
        if (!a4)
        {
          LOBYTE(v9) = 0;
          return v9;
        }
        goto LABEL_16;
      }
      if (*a4) {
        uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
      }
      else {
        uint64_t v17 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      int v21 = "-[AVCTextStream configure:error:]";
      __int16 v22 = 1024;
      int v23 = 462;
      __int16 v24 = 2112;
      __int16 v25 = v11;
      __int16 v26 = 2048;
      __int16 v27 = self;
      __int16 v28 = 2080;
      __int16 v29 = v17;
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) Invalid text configuration: error[%s]", buf, 0x3Au);
    }
LABEL_16:
    LOBYTE(v9) = 0;
    *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"AVCTextStream configuration is invalid"];
    return v9;
  }
  uint64_t v7 = [a3 dictionary];
  int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
  BOOL v9 = [(AVCTextStream *)self validateResultsDictionary:[(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamSetSessionConfig" arguments:v8] error:a4];

  if (v9) {
    id v10 = a3;
  }
  else {
    id v10 = 0;
  }
  [(AVCTextStream *)self setConfiguration:v10];
  return v9;
}

- (void)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCTextStream start]");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v15 = 136315650;
      *(void *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[AVCTextStream start]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 490;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", v15, 0x1Cu);
    }
  }
  if (!self->_configuration)
  {
    -[AVCTextStreamDelegate stream:didStart:error:](-[AVCTextStream delegate](self, "delegate"), "stream:didStart:error:", self, 0, [MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"AVCTextStream hasn't been configured"]);
    goto LABEL_18;
  }
  if ((AVCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_17;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)int v15 = 136315650;
    *(void *)&v15[4] = v6;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[AVCTextStream start]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 494;
    int v8 = "AVCTextStream [%s] %s:%d API_VCMEDIASTREAM_STARTCONFERENCE (client side)";
    BOOL v9 = v7;
    uint32_t v10 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_17;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)int v15 = 136316162;
    *(void *)&v15[4] = v11;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[AVCTextStream start]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 494;
    WORD2(v16) = 2112;
    *(void *)((char *)&v16 + 6) = v5;
    HIWORD(v16) = 2048;
    uint64_t v17 = self;
    int v8 = "AVCTextStream [%s] %s:%d %@(%p) API_VCMEDIASTREAM_STARTCONFERENCE (client side)";
    BOOL v9 = v12;
    uint32_t v10 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v15, v10);
LABEL_17:
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStartConference", *(_OWORD *)v15, *(void *)&v15[16], v16, v17);
LABEL_18:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v15 = 136315906;
      *(void *)&v15[4] = v13;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[AVCTextStream start]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 504;
      WORD2(v16) = 2048;
      *(void *)((char *)&v16 + 6) = self;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-start (%p)", v15, 0x26u);
    }
  }
}

- (void)stop
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCTextStream stop]");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCTextStream stop]";
      __int16 v13 = 1024;
      int v14 = 509;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStopConference"];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCTextStream stop]";
      __int16 v13 = 1024;
      int v14 = 516;
      __int16 v15 = 2048;
      long long v16 = self;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-stop (%p)", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)pause
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCTextStream pause]");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      __int16 v13 = "-[AVCTextStream pause]";
      __int16 v14 = 1024;
      int v15 = 521;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC8D68, @"vcMediaStreamDictionary", 0);
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetPause" arguments:v7];

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[AVCTextStream pause]";
      __int16 v14 = 1024;
      int v15 = 532;
      __int16 v16 = 2048;
      uint64_t v17 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-pause (%p)", buf, 0x26u);
    }
  }
}

- (void)resume
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCTextStream resume]");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      __int16 v13 = "-[AVCTextStream resume]";
      __int16 v14 = 1024;
      int v15 = 537;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC8D90, @"vcMediaStreamDictionary", 0);
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetPause" arguments:v7];

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCTextStream-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[AVCTextStream resume]";
      __int16 v14 = 1024;
      int v15 = 548;
      __int16 v16 = 2048;
      uint64_t v17 = self;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-resume (%p)", buf, 0x26u);
    }
  }
}

- (AVCTextStreamDelegate)delegate
{
  return (AVCTextStreamDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCTextStream setDelegate:]";
      __int16 v11 = 1024;
      int v12 = 558;
      __int16 v13 = 2048;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d delegate=%p", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak(&self->_delegate, a3);
}

- (void)setDirection:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = "-[AVCTextStream setDirection:]";
      __int16 v18 = 1024;
      int v19 = 563;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d direction=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)self->_configuration direction] == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [(AVCMediaStreamConfig *)self->_configuration direction];
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        uint64_t v17 = "-[AVCTextStream setDirection:]";
        __int16 v18 = 1024;
        int v19 = 565;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d direction is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setDirection:a3];
    int v12 = @"vcMediaStreamDirection";
    uint64_t v13 = [NSNumber numberWithInteger:a3];
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    __int16 v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetStreamDirection" arguments:v11];
  }
}

- (int64_t)direction
{
  return [(AVCMediaStreamConfig *)self->_configuration direction];
}

- (void)setRtcpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = "-[AVCTextStream setRtcpEnabled:]";
      __int16 v18 = 1024;
      int v19 = 587;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)self->_configuration isRTCPEnabled] == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [(AVCMediaStreamConfig *)self->_configuration isRTCPEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[AVCTextStream setRtcpEnabled:]";
        __int16 v18 = 1024;
        int v19 = 590;
        __int16 v20 = 1024;
        BOOL v21 = v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpEnabled is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setRtcpEnabled:v3];
    int v12 = @"vcMediaStreamRTCPEnabled";
    uint64_t v13 = [NSNumber numberWithBool:v3];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPEnabled" arguments:v8];
  }
}

- (BOOL)isRTCPEnabled
{
  return [(AVCMediaStreamConfig *)self->_configuration isRTCPEnabled];
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = "-[AVCTextStream setRtpTimeOutEnabled:]";
      __int16 v18 = 1024;
      int v19 = 613;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)self->_configuration isRTPTimeOutEnabled] == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [(AVCMediaStreamConfig *)self->_configuration isRTPTimeOutEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[AVCTextStream setRtpTimeOutEnabled:]";
        __int16 v18 = 1024;
        int v19 = 616;
        __int16 v20 = 1024;
        BOOL v21 = v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutEnabled is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setRtpTimeOutEnabled:v3];
    int v12 = @"vcMediaStreamRTPTimeoutEnabled";
    uint64_t v13 = [NSNumber numberWithBool:v3];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTPTimeoutEnabled" arguments:v8];
  }
}

- (BOOL)isRTPTimeOutEnabled
{
  return [(AVCMediaStreamConfig *)self->_configuration isRTPTimeOutEnabled];
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = "-[AVCTextStream setRtcpTimeOutEnabled:]";
      __int16 v18 = 1024;
      int v19 = 639;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)self->_configuration isRTCPTimeOutEnabled] == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = [(AVCMediaStreamConfig *)self->_configuration isRTCPTimeOutEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[AVCTextStream setRtcpTimeOutEnabled:]";
        __int16 v18 = 1024;
        int v19 = 642;
        __int16 v20 = 1024;
        BOOL v21 = v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutEnabled is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setRtcpTimeOutEnabled:v3];
    int v12 = @"vcMediaStreamRTCPTimeoutEnabled";
    uint64_t v13 = [NSNumber numberWithBool:v3];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPTimeoutEnabled" arguments:v8];
  }
}

- (BOOL)isRTCPTimeOutEnabled
{
  return [(AVCMediaStreamConfig *)self->_configuration isRTCPTimeOutEnabled];
}

- (void)setRtpTimeOutIntervalSec:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      float v7 = a3;
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v5;
      __int16 v18 = 2080;
      int v19 = "-[AVCTextStream setRtpTimeOutIntervalSec:]";
      __int16 v20 = 1024;
      int v21 = 665;
      __int16 v22 = 2048;
      double v23 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)self->_configuration rtpTimeOutInterval];
  if (v8 == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [(AVCMediaStreamConfig *)self->_configuration rtpTimeOutInterval];
        *(float *)&double v11 = v11;
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[AVCTextStream setRtpTimeOutIntervalSec:]";
        __int16 v20 = 1024;
        int v21 = 668;
        __int16 v22 = 2048;
        double v23 = *(float *)&v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutInterval is already set to %f", buf, 0x26u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setRtpTimeOutInterval:a3];
    id v14 = @"vcMediaStreamRTPTimeoutInterval";
    uint64_t v15 = [NSNumber numberWithDouble:a3];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTPTimeoutInterval" arguments:v13];
  }
}

- (double)rtpTimeOutIntervalSec
{
  [(AVCMediaStreamConfig *)self->_configuration rtpTimeOutInterval];
  return result;
}

- (void)setRtcpTimeOutIntervalSec:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      float v7 = a3;
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v5;
      __int16 v18 = 2080;
      int v19 = "-[AVCTextStream setRtcpTimeOutIntervalSec:]";
      __int16 v20 = 1024;
      int v21 = 692;
      __int16 v22 = 2048;
      double v23 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)self->_configuration rtcpTimeOutInterval];
  if (v8 == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [(AVCMediaStreamConfig *)self->_configuration rtcpTimeOutInterval];
        *(float *)&double v11 = v11;
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[AVCTextStream setRtcpTimeOutIntervalSec:]";
        __int16 v20 = 1024;
        int v21 = 695;
        __int16 v22 = 2048;
        double v23 = *(float *)&v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutIntervalSec is already set to %f", buf, 0x26u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setRtcpTimeOutInterval:a3];
    id v14 = @"vcMediaStreamRTCPTimeoutInterval";
    uint64_t v15 = [NSNumber numberWithDouble:a3];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPTimeoutInterval" arguments:v13];
  }
}

- (double)rtcpTimeOutIntervalSec
{
  [(AVCMediaStreamConfig *)self->_configuration rtcpTimeOutInterval];
  return result;
}

- (void)setRtcpSendIntervalSec:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      float v7 = a3;
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v5;
      __int16 v18 = 2080;
      int v19 = "-[AVCTextStream setRtcpSendIntervalSec:]";
      __int16 v20 = 1024;
      int v21 = 718;
      __int16 v22 = 2048;
      double v23 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpSendIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)self->_configuration rtcpSendInterval];
  if (v8 == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [(AVCMediaStreamConfig *)self->_configuration rtcpSendInterval];
        *(float *)&double v11 = v11;
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[AVCTextStream setRtcpSendIntervalSec:]";
        __int16 v20 = 1024;
        int v21 = 721;
        __int16 v22 = 2048;
        double v23 = *(float *)&v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpSendIntervalSec is already set to %f", buf, 0x26u);
      }
    }
  }
  else
  {
    [(AVCMediaStreamConfig *)self->_configuration setRtcpSendInterval:a3];
    id v14 = @"vcMediaStreamRTCPSendInterval";
    uint64_t v15 = [NSNumber numberWithDouble:a3];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPSendInterval" arguments:v13];
  }
}

- (double)rtcpSendIntervalSec
{
  [(AVCMediaStreamConfig *)self->_configuration rtcpSendInterval];
  return result;
}

- (AVCMediaStreamConfig)configuration
{
  return self->_configuration;
}

- (id)validateInitializeConnectionResult:(id)a3
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream validateInitializeConnectionResult:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCTextStream validateInitializeConnectionResult:]();
      }
    }
    float v7 = (void *)MEMORY[0x1E4F28C58];
    double v8 = @"Missing result dictionary";
    return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
  }
  if ([a3 objectForKeyedSubscript:@"SERVERDIED"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCTextStream validateInitializeConnectionResult:]1();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCTextStream validateInitializeConnectionResult:]2();
      }
    }
    float v7 = (void *)MEMORY[0x1E4F28C58];
    double v8 = @"Server died";
    return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
  }
  if ([a3 objectForKeyedSubscript:@"ERROR"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(AVCTextStream *)v4 validateInitializeConnectionResult:v6];
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        [(AVCTextStream *)v4 validateInitializeConnectionResult:v6];
      }
    }
    return (id)[a3 objectForKeyedSubscript:@"ERROR"];
  }
  else
  {
    if ([a3 objectForKeyedSubscript:@"TIMEOUT"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCTextStream validateInitializeConnectionResult:].cold.7();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateInitializeConnectionResult:].cold.8();
        }
      }
      float v7 = (void *)MEMORY[0x1E4F28C58];
      double v8 = @"IPC Timeout";
      return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
    }
    if (![a3 objectForKeyedSubscript:@"vcMediaStreamStreamCapabilities"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCTextStream validateInitializeConnectionResult:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateInitializeConnectionResult:].cold.4();
        }
      }
      float v7 = (void *)MEMORY[0x1E4F28C58];
      double v8 = @"Missing capabilities dictionary";
      return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
    }
    if (![a3 objectForKeyedSubscript:@"vcMediaStreamToken"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCTextStream validateInitializeConnectionResult:].cold.5();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateInitializeConnectionResult:].cold.6();
        }
      }
      float v7 = (void *)MEMORY[0x1E4F28C58];
      double v8 = @"Missing stream token";
      return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
    }
    return 0;
  }
}

- (BOOL)setupTextStreamOutOfProcessWithClientArgs:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  float v7 = objc_alloc_init(AVConferenceXPCClient);
  self->_connection = v7;
  if (!v7)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v9) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v9) {
          return (char)v9;
        }
        -[AVCTextStream setupTextStreamOutOfProcessWithClientArgs:error:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        double v11 = (__CFString *)[(AVCTextStream *)self performSelector:sel_logPrefix];
      }
      else {
        double v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        LODWORD(v9) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v9) {
          return (char)v9;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        __int16 v20 = "-[AVCTextStream setupTextStreamOutOfProcessWithClientArgs:error:]";
        __int16 v21 = 1024;
        int v22 = 777;
        __int16 v23 = 2112;
        uint64_t v24 = v11;
        __int16 v25 = 2048;
        __int16 v26 = self;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback XPC connection", buf, 0x30u);
      }
    }
    goto LABEL_16;
  }
  [(AVCTextStream *)self registerBlocksForDelegateNotifications];
  uint64_t v15 = @"vcMediaStreamDictionary";
  id v16 = a3;
  id v8 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamInitializeText", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
  id v9 = [(AVCTextStream *)self validateInitializeConnectionResult:v8];
  if (!v9)
  {
    -[AVCTextStream setCapabilities:](self, "setCapabilities:", [v8 objectForKeyedSubscript:@"vcMediaStreamStreamCapabilities"]);
    self->_int streamToken = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"vcMediaStreamToken"), "integerValue");
    LOBYTE(v9) = 1;
    return (char)v9;
  }
  if (!a4)
  {
LABEL_16:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  uint64_t v10 = v9;
  LOBYTE(v9) = 0;
  *a4 = v10;
  return (char)v9;
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

- (void)initWithNetworkSockets:callID:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback queue", v2, v3, v4, v5, v6);
}

- (void)initWithNetworkSockets:callID:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback XPC connection", v2, v3, v4, v5, v6);
}

- (void)initWithNetworkSockets:callID:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to instantiate servers side object", v2, v3, v4, v5, v6);
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate clientArgs dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to initialize AVCTextStream because of invalid parameters", v2, v3, v4, v5, v6);
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback queue", v2, v3, v4, v5, v6);
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to create in process VCTextStream as it is not supported", v2, v3, v4, v5, v6);
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to instantiate servers side object", v2, v3, v4, v5, v6);
}

- (void)validateResultsDictionary:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d no results dict", v2, v3, v4, v5, v6);
}

- (void)validateResultsDictionary:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_15();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d server died", v2, v3, v4, v5, v6);
}

- (void)validateResultsDictionary:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_15();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d server died", v2, v3, v4, v5, v6);
}

- (void)initializeServerWithNetworkSockets:(uint64_t)a1 callID:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2) {
    objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  }
  int v8 = 136315906;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v10 = "-[AVCTextStream initializeServerWithNetworkSockets:callID:error:]";
  __int16 v11 = 1024;
  int v12 = 253;
  __int16 v13 = v5;
  uint64_t v14 = v6;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v7, "AVCTextStream [%s] %s:%d error initializing no capabilities dict result[%s]", (uint8_t *)&v8);
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 283;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "AVCTextStream [%s] %s:%d AVCTextStream: server died, but AVCTextStream has already deallocated, NO-OP", v1, 0x1Cu);
}

- (void)configure:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  int v8 = 136315906;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v10 = "-[AVCTextStream configure:error:]";
  __int16 v11 = 1024;
  int v12 = 462;
  __int16 v13 = v5;
  uint64_t v14 = v6;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v7, "AVCTextStream [%s] %s:%d Invalid text configuration: error[%s]", (uint8_t *)&v8);
}

- (void)validateInitializeConnectionResult:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_11();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_11();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[AVCTextStream validateInitializeConnectionResult:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "AVCTextStream [%s] %s:%d Missing capabilities dictionary: result=%@", v1);
}

- (void)validateInitializeConnectionResult:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10_10(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Missing capabilities dictionary: result=%@");
}

- (void)validateInitializeConnectionResult:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.7()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[AVCTextStream validateInitializeConnectionResult:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "AVCTextStream [%s] %s:%d IPC Timeout: result=%@", v1);
}

- (void)validateInitializeConnectionResult:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10_10(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d IPC Timeout: result=%@");
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.9(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"ERROR"];
  int v5 = 136316162;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_16();
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.10(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"ERROR"];
  int v5 = 136316162;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_16();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, "AVCTextStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
}

- (void)validateInitializeConnectionResult:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10_13();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
}

- (void)setupTextStreamOutOfProcessWithClientArgs:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback XPC connection", v2, v3, v4, v5, v6);
}

@end