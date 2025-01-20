@interface AVCAudioStream
+ (id)capabilities;
- (AVCAudioStream)initWithIDSDestination:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6;
- (AVCAudioStream)initWithIDSDestination:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5;
- (AVCAudioStream)initWithLocalAddress:(id)a3 callID:(id)a4 error:(id *)a5;
- (AVCAudioStream)initWithLocalAddress:(id)a3 error:(id *)a4;
- (AVCAudioStream)initWithLocalAddress:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6;
- (AVCAudioStream)initWithLocalAddress:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5;
- (AVCAudioStream)initWithLocalAddress:(id)a3 networkSockets:(id)a4 IDSDestination:(id)a5 rtpConnectionClientID:(id)a6 rtcpConnectionClientID:(id)a7 callID:(id)a8 options:(id)a9 error:(id *)a10;
- (AVCAudioStream)initWithNetworkSockets:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6;
- (AVCAudioStream)initWithNetworkSockets:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5;
- (AVCAudioStream)initWithNetworkSockets:(id)a3 options:(id)a4 error:(id *)a5;
- (AVCAudioStream)initWithRTPNWConnectionClientID:(id)a3 rtcpNWConnectionClientID:(id)a4 options:(id)a5 error:(id *)a6;
- (AVCAudioStreamDelegate)delegate;
- (AVCMediaStreamConfig)configuration;
- (BOOL)configure:(id)a3 error:(id *)a4;
- (BOOL)configureInProcess:(id)a3 error:(id *)a4;
- (BOOL)configureOutOfProcess:(id)a3 error:(id *)a4;
- (BOOL)isInputFrequencyMeteringEnabled;
- (BOOL)isOutputFrequencyMeteringEnabled;
- (BOOL)isRTCPEnabled;
- (BOOL)isRTCPTimeOutEnabled;
- (BOOL)isRTPTimeOutEnabled;
- (BOOL)setupAudioStreamInProcessWithClientArgs:(id)a3 networkSockets:(id)a4 error:(id *)a5;
- (BOOL)setupAudioStreamOutOfProcessWithClientArgs:(id)a3 networkSockets:(id)a4 error:(id *)a5;
- (BOOL)shouldRunInProcessWithOptions:(id)a3;
- (NSDictionary)capabilities;
- (double)rtcpSendIntervalSec;
- (double)rtcpTimeOutIntervalSec;
- (double)rtpTimeOutIntervalSec;
- (float)volume;
- (id)validateInitializeConnectionResult:(id)a3;
- (int64_t)direction;
- (int64_t)downlinkToken;
- (int64_t)streamToken;
- (int64_t)uplinkToken;
- (unsigned)jitterBufferMode;
- (void)dealloc;
- (void)deregisterBlocksForDelegateNotifications;
- (void)didInterruptionBeginHandler;
- (void)didInterruptionEndHandler;
- (void)pause;
- (void)processDTMFEventWithDigit:(id)a3;
- (void)refreshLoggingParameters;
- (void)registerBlocksForDelegateNotifications;
- (void)resume;
- (void)sendDTMFDigitString:(id)a3 withVolume:(unsigned __int8)a4 duration:(unsigned __int16)a5 interval:(unsigned __int16)a6;
- (void)setCapabilities:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setInputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setJitterBufferMode:(unsigned int)a3;
- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setRtcpEnabled:(BOOL)a3;
- (void)setRtcpSendIntervalSec:(double)a3;
- (void)setRtcpTimeOutEnabled:(BOOL)a3;
- (void)setRtcpTimeOutIntervalSec:(double)a3;
- (void)setRtpTimeOutEnabled:(BOOL)a3;
- (void)setRtpTimeOutIntervalSec:(double)a3;
- (void)setVolume:(float)a3;
- (void)start;
- (void)startContinuousDTMFWithDigit:(char)a3 volume:(unsigned __int8)a4;
- (void)startSynchronizeWithStream:(int64_t)a3;
- (void)stop;
- (void)stopContinuousDTMF;
- (void)terminateSession;
- (void)vcMediaStream:(id)a3 didPauseStream:(BOOL)a4 error:(id)a5;
- (void)vcMediaStream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4;
- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4;
- (void)vcMediaStream:(id)a3 didResumeStream:(BOOL)a4 error:(id)a5;
- (void)vcMediaStream:(id)a3 didStartStream:(BOOL)a4 error:(id)a5;
- (void)vcMediaStream:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)vcMediaStream:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)vcMediaStreamDidRTCPTimeOut:(id)a3;
- (void)vcMediaStreamDidRTPTimeOut:(id)a3;
- (void)vcMediaStreamDidStop:(id)a3;
- (void)vcMediaStreamServerDidDie:(id)a3;
@end

@implementation AVCAudioStream

- (AVCAudioStream)initWithLocalAddress:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *a4;
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      v14 = "-[AVCAudioStream initWithLocalAddress:error:]";
      __int16 v15 = 1024;
      int v16 = 75;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, error=%@", buf, 0x30u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:a3 networkSockets:0 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:0 options:0 error:a4];
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 callID:(id)a4 error:(id *)a5
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
      int v16 = "-[AVCAudioStream initWithLocalAddress:callID:error:]";
      __int16 v17 = 1024;
      int v18 = 80;
      __int16 v19 = 2112;
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = a4;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, callID=%@, error=%@", buf, 0x3Au);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:a3 networkSockets:0 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:a4 options:0 error:a5];
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
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
      int v16 = "-[AVCAudioStream initWithLocalAddress:isOriginator:error:]";
      __int16 v17 = 1024;
      int v18 = 85;
      __int16 v19 = 2112;
      id v20 = a3;
      __int16 v21 = 1024;
      BOOL v22 = v6;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, isOriginator=%d, error=%@", buf, 0x36u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:a3 networkSockets:0 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:0 options:0 error:a5];
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a6;
      *(_DWORD *)buf = 136316674;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      int v18 = "-[AVCAudioStream initWithLocalAddress:isOriginator:callID:error:]";
      __int16 v19 = 1024;
      int v20 = 90;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 2112;
      id v26 = a5;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, isOriginator=%d, callID=%@, error=%@", buf, 0x40u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:a3 networkSockets:0 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:a5 options:0 error:a6];
}

- (AVCAudioStream)initWithNetworkSockets:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
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
      uint64_t v16 = "-[AVCAudioStream initWithNetworkSockets:isOriginator:error:]";
      __int16 v17 = 1024;
      int v18 = 95;
      __int16 v19 = 2112;
      id v20 = a3;
      __int16 v21 = 1024;
      BOOL v22 = v6;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d socketsDictionary=%@, isOriginator=%d, error=%@", buf, 0x36u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:0 options:0 error:a5];
}

- (AVCAudioStream)initWithNetworkSockets:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a6;
      *(_DWORD *)buf = 136316674;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      int v18 = "-[AVCAudioStream initWithNetworkSockets:isOriginator:callID:error:]";
      __int16 v19 = 1024;
      int v20 = 100;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 2112;
      id v26 = a5;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d socketsDictionary=%@, isOriginator=%d, callID=%@, error=%@", buf, 0x40u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:a5 options:0 error:a6];
}

- (AVCAudioStream)initWithNetworkSockets:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([a4 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"]) {
    uint64_t v9 = (void *)[a4 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"];
  }
  else {
    uint64_t v9 = 0;
  }
  if ([a4 objectForKeyedSubscript:@"avcMediaStreamOptionIsOriginator"]) {
    int v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"avcMediaStreamOptionIsOriginator"), "BOOLValue");
  }
  else {
    int v10 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    return [(AVCAudioStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:v9 options:a4 error:a5];
  }
  __str = 0;
  if (a3)
  {
    uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (v9) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v12 = "<nil>";
    if (a4) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v11 = "<nil>";
  if (!v9) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
  if (a4)
  {
LABEL_11:
    id v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    goto LABEL_15;
  }
LABEL_14:
  id v13 = "<nil>";
LABEL_15:
  if (*a5) {
    uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  }
  else {
    uint64_t v14 = "<nil>";
  }
  asprintf(&__str, "socketsDictionary=%s, isOriginator=%d, callID=%s, options=%s, error=%s", v11, v10, v12, v13, v14);
  if (__str)
  {
    int v20 = v9;
    __int16 v21 = self;
    id v22 = a3;
    __lasts = 0;
    __int16 v15 = strtok_r(__str, "\n", &__lasts);
    uint64_t v16 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        int v18 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v26 = v17;
          __int16 v27 = 2080;
          id v28 = "-[AVCAudioStream initWithNetworkSockets:options:error:]";
          __int16 v29 = 1024;
          int v30 = 114;
          __int16 v31 = 2080;
          v32 = "";
          __int16 v33 = 2080;
          v34 = v15;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      __int16 v15 = strtok_r(0, "\n", &__lasts);
    }
    while (v15);
    free(__str);
    self = v21;
    a3 = v22;
    uint64_t v9 = v20;
  }
  return [(AVCAudioStream *)self initWithLocalAddress:0 networkSockets:a3 IDSDestination:0 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:v9 options:a4 error:a5];
}

- (AVCAudioStream)initWithIDSDestination:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *a5;
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVCAudioStream initWithIDSDestination:isOriginator:error:]";
      __int16 v17 = 1024;
      int v18 = 120;
      __int16 v19 = 2112;
      id v20 = a3;
      __int16 v21 = 1024;
      BOOL v22 = v6;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d destination=%@, isOriginator=%d, error=%@", buf, 0x36u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:0 networkSockets:0 IDSDestination:a3 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:0 options:0 error:a5];
}

- (AVCAudioStream)initWithIDSDestination:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a6;
      *(_DWORD *)buf = 136316674;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      int v18 = "-[AVCAudioStream initWithIDSDestination:isOriginator:callID:error:]";
      __int16 v19 = 1024;
      int v20 = 125;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 2112;
      id v26 = a5;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d destination=%@, isOriginator=%d, callID=%@, error=%@", buf, 0x40u);
    }
  }
  return [(AVCAudioStream *)self initWithLocalAddress:0 networkSockets:0 IDSDestination:a3 rtpConnectionClientID:0 rtcpConnectionClientID:0 callID:a5 options:0 error:a6];
}

- (AVCAudioStream)initWithRTPNWConnectionClientID:(id)a3 rtcpNWConnectionClientID:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([a5 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"]) {
    uint64_t v11 = [a5 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"];
  }
  else {
    uint64_t v11 = 0;
  }
  if ([a5 objectForKeyedSubscript:@"avcMediaStreamOptionIsOriginator"]) {
    int v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"avcMediaStreamOptionIsOriginator"), "BOOLValue");
  }
  else {
    int v12 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [a3 UUIDString];
      uint64_t v18 = [a4 UUIDString];
      if (a5) {
        __int16 v15 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        __int16 v15 = "<nil>";
      }
      if (*a6) {
        uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend(*a6, "description"), "UTF8String");
      }
      else {
        uint64_t v16 = "<nil>";
      }
      *(_DWORD *)buf = 136317186;
      uint64_t v21 = v13;
      __int16 v22 = 2080;
      __int16 v23 = "-[AVCAudioStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      __int16 v24 = 1024;
      int v25 = 138;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 1024;
      int v31 = v12;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      __int16 v34 = 2080;
      uint64_t v35 = v15;
      __int16 v36 = 2080;
      v37 = v16;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtpClientID=%@, rtcpClientID=%@, isOriginator=%d, callID=%@, options=%s, error=%s", buf, 0x54u);
    }
  }
  if (a3) {
    return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, 0, 0, [a3 UUIDString], objc_msgSend(a4, "UUIDString"), v11, a5, a6);
  }
  if (a6) {
    *a6 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"rtpClientID cannot not be nil"];
  }

  return 0;
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 networkSockets:(id)a4 IDSDestination:(id)a5 rtpConnectionClientID:(id)a6 rtcpConnectionClientID:(id)a7 callID:(id)a8 options:(id)a9 error:(id *)a10
{
  id v17 = a9;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    goto LABEL_28;
  }
  __str = 0;
  if (a3)
  {
    v47 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      uint64_t v18 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v47 = "<nil>";
    if (a4) {
      goto LABEL_4;
    }
  }
  uint64_t v18 = "<nil>";
LABEL_7:
  id v45 = a3;
  if (a5) {
    uint64_t v19 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
  }
  else {
    uint64_t v19 = "<nil>";
  }
  id v46 = a6;
  if (a6) {
    int v20 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
  }
  else {
    int v20 = "<nil>";
  }
  v44 = self;
  if (a7)
  {
    uint64_t v21 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
    if (a8) {
      goto LABEL_15;
    }
LABEL_18:
    __int16 v22 = "<nil>";
    if (a9) {
      goto LABEL_16;
    }
LABEL_19:
    __int16 v23 = "<nil>";
    goto LABEL_20;
  }
  uint64_t v21 = "<nil>";
  if (!a8) {
    goto LABEL_18;
  }
LABEL_15:
  __int16 v22 = (const char *)objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
  if (!a9) {
    goto LABEL_19;
  }
LABEL_16:
  __int16 v23 = (const char *)objc_msgSend((id)objc_msgSend(a9, "description"), "UTF8String");
LABEL_20:
  asprintf(&__str, "localAddress=%s, socketsDictionary=%s, destination=%s, rtpConnectionClientID=%s, rtcpConnectionClientID=%s, callID=%s, options=%s", v47, v18, v19, v20, v21, v22, v23);
  if (__str)
  {
    id v42 = a7;
    id v43 = a4;
    __lasts = 0;
    __int16 v24 = strtok_r(__str, "\n", &__lasts);
    int v25 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        uint64_t v27 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v52 = v26;
          __int16 v53 = 2080;
          v54 = "-[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnection"
                "ClientID:callID:options:error:]";
          __int16 v55 = 1024;
          int v56 = 152;
          __int16 v57 = 2080;
          v58 = "";
          __int16 v59 = 2080;
          *(void *)v60 = v24;
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      __int16 v24 = strtok_r(0, "\n", &__lasts);
    }
    while (v24);
    free(__str);
    a4 = v43;
    a7 = v42;
    id v17 = a9;
  }
  a3 = v45;
  a6 = v46;
  self = v44;
LABEL_28:
  v48.receiver = self;
  v48.super_class = (Class)AVCAudioStream;
  __int16 v28 = [(AVCAudioStream *)&v48 init];
  if (v28)
  {
    uint64_t v29 = v28;
    v28->_isInProcess = [(AVCAudioStream *)v28 shouldRunInProcessWithOptions:v17];
    [(AVCAudioStream *)v29 refreshLoggingParameters];
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a3)
    {
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(a3, "ip"), @"vcMediaStreamSourceIP");
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(a3, "interfaceName"), @"vcMediaStreamSourceInterfaceName");
    }
    if (a5) {
      [v30 setObject:a5 forKeyedSubscript:@"vcMediaStreamDestID"];
    }
    if (a6) {
      [v30 setObject:a6 forKeyedSubscript:@"vcMediaStreamConnectionClientID"];
    }
    if (a7) {
      [v30 setObject:a7 forKeyedSubscript:@"vcMediaStreamRTCPConnectionClientID"];
    }
    if (a8) {
      [v30 setObject:a8 forKeyedSubscript:@"vcMediaStreamCallID"];
    }
    if ([v17 objectForKeyedSubscript:@"avcMediaStreamOptionRemoteEndpointInfo"]) {
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", @"avcMediaStreamOptionRemoteEndpointInfo"), @"vcMediaStreamRemoteEndpointInfo");
    }
    if ([v17 objectForKeyedSubscript:@"avcMediaStreamOptionClientName"]) {
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", @"avcMediaStreamOptionClientName"), @"vcMediaStreamClientName");
    }
    if ([v17 objectForKeyedSubscript:@"avcMediaStreamOptionDelayNWConnectionStart"]) {
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", @"avcMediaStreamOptionDelayNWConnectionStart"), @"vcMediaStreamDelayNWConnectionStart");
    }
    if ([v17 objectForKeyedSubscript:@"avcMediaStreamOptionClientSessionID"])
    {
      [v17 objectForKeyedSubscript:@"avcMediaStreamOptionClientSessionID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"avcMediaStreamOptionClientSessionID"), "UUIDString"), @"vcMediaStreamClientSessionID");
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:]();
        }
      }
    }
    objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", VCFeatureFlagManager_CallRecordingEnabled()), @"vcMediaStreamSetUpCaptioning");
    objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", VCFeatureFlagManager_CallRecordingEnabled()), @"vcMediaStreamSetUpRecording");
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v29->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.avcaudiostream.callback.queue", 0, CustomRootQueue);
    if (v29->_isInProcess) {
      BOOL v32 = [(AVCAudioStream *)v29 setupAudioStreamInProcessWithClientArgs:v30 networkSockets:a4 error:a10];
    }
    else {
      BOOL v32 = [(AVCAudioStream *)v29 setupAudioStreamOutOfProcessWithClientArgs:v30 networkSockets:a4 error:a10];
    }
    BOOL v33 = v32;

    if (v33)
    {
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-init");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v34 = VRTraceErrorLogLevelToCSTR();
        uint64_t v35 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          pid_t v36 = getpid();
          int streamToken = v29->_streamToken;
          if (a10) {
            uint64_t v38 = (__CFString *)*a10;
          }
          else {
            uint64_t v38 = @"None";
          }
          *(_DWORD *)buf = 136316930;
          uint64_t v52 = v34;
          __int16 v53 = 2080;
          v54 = "-[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnection"
                "ClientID:callID:options:error:]";
          __int16 v55 = 1024;
          int v56 = 212;
          __int16 v57 = 2048;
          v58 = (const char *)v29;
          __int16 v59 = 1024;
          *(_DWORD *)v60 = v36;
          *(_WORD *)&v60[4] = 2112;
          *(void *)&v60[6] = a8;
          __int16 v61 = 1024;
          int v62 = streamToken;
          __int16 v63 = 2112;
          v64 = v38;
          _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-init (%p) PID=%d, callID=%@, streamToken=%d, error=%@", buf, 0x46u);
        }
      }
      return v29;
    }
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v52 = v39;
      __int16 v53 = 2080;
      v54 = "-[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClie"
            "ntID:callID:options:error:]";
      __int16 v55 = 1024;
      int v56 = 214;
      __int16 v57 = 2048;
      v58 = 0;
      _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (BOOL)shouldRunInProcessWithOptions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"avcMediaStreamOptionRunInProcess"), "BOOLValue");
  if ((AVCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = "out of";
        uint64_t v17 = v6;
        int v16 = 136315906;
        uint64_t v19 = "-[AVCAudioStream shouldRunInProcessWithOptions:]";
        __int16 v18 = 2080;
        if (v4) {
          BOOL v8 = "in";
        }
        __int16 v20 = 1024;
        int v21 = 221;
        __int16 v22 = 2080;
        __int16 v23 = (void *)v8;
        uint64_t v9 = "AVCAudioStream [%s] %s:%d AVCAudioStream will run %s process";
        int v10 = v7;
        uint32_t v11 = 38;
        goto LABEL_15;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(AVCAudioStream *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = "out of";
        uint64_t v17 = v12;
        int v16 = 136316418;
        uint64_t v19 = "-[AVCAudioStream shouldRunInProcessWithOptions:]";
        __int16 v18 = 2080;
        if (v4) {
          uint64_t v14 = "in";
        }
        __int16 v20 = 1024;
        int v21 = 221;
        __int16 v22 = 2112;
        __int16 v23 = v5;
        __int16 v24 = 2048;
        int v25 = self;
        __int16 v26 = 2080;
        uint64_t v27 = v14;
        uint64_t v9 = "AVCAudioStream [%s] %s:%d %@(%p) AVCAudioStream will run %s process";
        int v10 = v13;
        uint32_t v11 = 58;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  return v4;
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
          -[AVCAudioStream validateInitializeConnectionResult:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCAudioStream validateInitializeConnectionResult:]();
      }
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    BOOL v8 = @"Missing result dictionary";
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
          -[AVCAudioStream validateInitializeConnectionResult:]5();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCAudioStream validateInitializeConnectionResult:]6();
      }
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    BOOL v8 = @"Server died";
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
          [(AVCAudioStream *)v4 validateInitializeConnectionResult:v6];
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        [(AVCAudioStream *)v4 validateInitializeConnectionResult:v6];
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
            -[AVCAudioStream validateInitializeConnectionResult:]1();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:]2();
        }
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      BOOL v8 = @"IPC Timeout";
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
            -[AVCAudioStream validateInitializeConnectionResult:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.4();
        }
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      BOOL v8 = @"Missing capabilities dictionary";
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
            -[AVCAudioStream validateInitializeConnectionResult:].cold.5();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.6();
        }
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      BOOL v8 = @"Missing stream token";
      return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
    }
    if (![a3 objectForKeyedSubscript:@"vcMediaStreamTokenUplink"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCAudioStream validateInitializeConnectionResult:].cold.7();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.8();
        }
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      BOOL v8 = @"Missing stream token (uplink)";
      return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
    }
    if (![a3 objectForKeyedSubscript:@"vcMediaStreamTokenDownlink"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCAudioStream validateInitializeConnectionResult:].cold.9();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:]0();
        }
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      BOOL v8 = @"Missing stream token (downlink)";
      return (id)[v7 AVConferenceServiceError:32000 detailCode:0 description:v8];
    }
    return 0;
  }
}

- (void)refreshLoggingParameters
{
  CFPreferencesAppSynchronize(@"com.apple.VideoConference");
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
  VRTraceReset();

  VRTracePrintLoggingInfo();
}

- (void)terminateSession
{
  if (!self->_isInProcess)
  {
    [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidServerDie"];
    [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamTerminateAudio"];

    self->_connection = 0;
  }
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((AVCAudioStream *)objc_opt_class() == self)
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
    __int16 v18 = "-[AVCAudioStream dealloc]";
    __int16 v19 = 1024;
    int v20 = 277;
    uint64_t v6 = "AVCAudioStream [%s] %s:%d ";
    uint64_t v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    v3 = (__CFString *)[(AVCAudioStream *)self performSelector:sel_logPrefix];
  }
  else {
    v3 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVCAudioStream dealloc]";
      __int16 v19 = 1024;
      int v20 = 277;
      __int16 v21 = 2112;
      __int16 v22 = (AVCAudioStream *)v3;
      __int16 v23 = 2048;
      __int16 v24 = self;
      uint64_t v6 = "AVCAudioStream [%s] %s:%d %@(%p) ";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  [(AVCAudioStream *)self setCapabilities:0];
  [(AVCAudioStream *)self setConfiguration:0];
  if (self->_isInProcess)
  {
    [(VCMediaStream *)self->_opaqueStream stop];
    [(VCMediaStream *)self->_opaqueStream setDelegate:0];
  }
  else
  {
    [(AVCAudioStream *)self deregisterBlocksForDelegateNotifications];
    [(AVCAudioStream *)self terminateSession];
  }
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVCAudioStream dealloc]";
      __int16 v19 = 1024;
      int v20 = 295;
      __int16 v21 = 2048;
      __int16 v22 = self;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-dealloc (%p)", buf, 0x26u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCAudioStream;
  [(AVCAudioStream *)&v14 dealloc];
}

- (AVCAudioStreamDelegate)delegate
{
  return (AVCAudioStreamDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)configure:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    uint64_t v7 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    uint32_t v8 = *a4 ? (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "configuration=%s, error=%s", v7, v8);
    if (__str)
    {
      uint64_t v28 = a4;
      __lasts = 0;
      uint64_t v9 = strtok_r(__str, "\n", &__lasts);
      int v10 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v32 = v11;
            __int16 v33 = 2080;
            uint64_t v34 = "-[AVCAudioStream configure:error:]";
            __int16 v35 = 1024;
            int v36 = 310;
            __int16 v37 = 2080;
            uint64_t v38 = (AVCAudioStream *)"";
            __int16 v39 = 2080;
            *(void *)v40 = v9;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v9 = strtok_r(0, "\n", &__lasts);
      }
      while (v9);
      free(__str);
      a4 = v28;
    }
  }
  if ([a3 isValidAudioConfig])
  {
    if (self->_isInProcess) {
      BOOL v13 = [(AVCAudioStream *)self configureInProcess:a3 error:a4];
    }
    else {
      BOOL v13 = [(AVCAudioStream *)self configureOutOfProcess:a3 error:a4];
    }
    BOOL v15 = v13;
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-configure");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          __int16 v18 = (__CFString *)*a4;
        }
        else {
          __int16 v18 = @"None";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v16;
        __int16 v33 = 2080;
        uint64_t v34 = "-[AVCAudioStream configure:error:]";
        __int16 v35 = 1024;
        int v36 = 329;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v15;
        *(_WORD *)&v40[4] = 2112;
        *(void *)&v40[6] = v18;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-configure (%p) didSucceed=%d, error=%@", buf, 0x36u);
      }
    }
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCAudioStream.m", 317), @"Invalid Parameter", @"Called with an invalid parameter");
    if ((AVCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCAudioStream configure:error:](v19, a4, v21);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream configure:error:](v19, a4, v21);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v14 = (__CFString *)[(AVCAudioStream *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        char v23 = VRTraceIsOSFaultDisabled();
        __int16 v24 = *MEMORY[0x1E4F47A50];
        if (v23)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            if (*a4) {
              uint64_t v25 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
            }
            else {
              uint64_t v25 = "<nil>";
            }
            *(_DWORD *)buf = 136316418;
            uint64_t v32 = v22;
            __int16 v33 = 2080;
            uint64_t v34 = "-[AVCAudioStream configure:error:]";
            __int16 v35 = 1024;
            int v36 = 320;
            __int16 v37 = 2112;
            uint64_t v38 = (AVCAudioStream *)v14;
            __int16 v39 = 2048;
            *(void *)v40 = self;
            *(_WORD *)&v40[8] = 2080;
            *(void *)&v40[10] = v25;
            _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, "AVCAudioStream [%s] %s:%d %@(%p) Invalid audio configuration: error[%s]", buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          if (*a4) {
            __int16 v26 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            __int16 v26 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v32 = v22;
          __int16 v33 = 2080;
          uint64_t v34 = "-[AVCAudioStream configure:error:]";
          __int16 v35 = 1024;
          int v36 = 320;
          __int16 v37 = 2112;
          uint64_t v38 = (AVCAudioStream *)v14;
          __int16 v39 = 2048;
          *(void *)v40 = self;
          *(_WORD *)&v40[8] = 2080;
          *(void *)&v40[10] = v26;
          _os_log_fault_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_FAULT, "AVCAudioStream [%s] %s:%d %@(%p) Invalid audio configuration: error[%s]", buf, 0x3Au);
        }
      }
    }
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)start
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCAudioStream start]");
  if (![(AVCAudioStream *)self configuration])
  {
    id v7 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"AVCAudioStream hasn't been configured"];
    opaqueStream = self->_opaqueStream;
    int v10 = self;
    BOOL v9 = 0;
LABEL_8:
    [(AVCAudioStream *)v10 vcMediaStream:opaqueStream didStartStream:v9 error:v7];
    goto LABEL_13;
  }
  BOOL isInProcess = self->_isInProcess;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (isInProcess)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315650;
        uint64_t v16 = v5;
        __int16 v17 = 2080;
        __int16 v18 = "-[AVCAudioStream start]";
        __int16 v19 = 1024;
        int v20 = 342;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream start (not using XPC)", (uint8_t *)&v15, 0x1Cu);
      }
    }
    id v7 = [(VCMediaStream *)self->_opaqueStream start];
    opaqueStream = self->_opaqueStream;
    BOOL v9 = v7 == 0;
    int v10 = self;
    goto LABEL_8;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVCAudioStream start]";
      __int16 v19 = 1024;
      int v20 = 339;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream API_VCMEDIASTREAM_STARTCONFERENCE (client side)", (uint8_t *)&v15, 0x1Cu);
    }
  }
  [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStartConference"];
LABEL_13:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    objc_super v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      __int16 v18 = "-[AVCAudioStream start]";
      __int16 v19 = 1024;
      int v20 = 350;
      __int16 v21 = 2048;
      uint64_t v22 = self;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-start (%p)", (uint8_t *)&v15, 0x26u);
    }
  }
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCAudioStream stop]");
  if (self->_isInProcess)
  {
    [(VCMediaStream *)self->_opaqueStream stop];
    [(AVCAudioStream *)self vcMediaStreamDidStop:self->_opaqueStream];
  }
  else
  {
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStopConference"];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint32_t v8 = "-[AVCAudioStream stop]";
      __int16 v9 = 1024;
      int v10 = 362;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-stop (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)pause
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCAudioStream pause]");
  if (self->_isInProcess)
  {
    id v3 = [(VCMediaStream *)self->_opaqueStream setPause:1];
    [(AVCAudioStream *)self vcMediaStream:self->_opaqueStream didPauseStream:v3 == 0 error:v3];
  }
  else
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC8D18, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetPause" arguments:v4];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[AVCAudioStream pause]";
      __int16 v11 = 1024;
      int v12 = 379;
      __int16 v13 = 2048;
      objc_super v14 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-pause (%p)", buf, 0x26u);
    }
  }
}

- (void)resume
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[AVCAudioStream resume]");
  if (self->_isInProcess)
  {
    id v3 = [(VCMediaStream *)self->_opaqueStream setPause:0];
    [(AVCAudioStream *)self vcMediaStream:self->_opaqueStream didResumeStream:v3 == 0 error:v3];
  }
  else
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC8D40, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetPause" arguments:v4];
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[AVCAudioStream resume]";
      __int16 v11 = 1024;
      int v12 = 396;
      __int16 v13 = 2048;
      objc_super v14 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-resume (%p)", buf, 0x26u);
    }
  }
}

- (void)sendDTMFDigitString:(id)a3 withVolume:(unsigned __int8)a4 duration:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      int v20 = "-[AVCAudioStream sendDTMFDigitString:withVolume:duration:interval:]";
      __int16 v21 = 1024;
      int v22 = 401;
      __int16 v23 = 2112;
      id v24 = a3;
      __int16 v25 = 1024;
      int v26 = v8;
      __int16 v27 = 1024;
      int v28 = v7;
      __int16 v29 = 1024;
      int v30 = v6;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d digits=%@, volume=%hhu, duration=%hu, interval=%hu", buf, 0x38u);
    }
  }
  v16[0] = a3;
  v15[0] = @"event";
  v15[1] = @"volume";
  v16[1] = [NSNumber numberWithUnsignedChar:v8];
  v15[2] = @"duration";
  v16[2] = [NSNumber numberWithUnsignedShort:v7];
  v15[3] = @"interval";
  v16[3] = [NSNumber numberWithUnsignedShort:v6];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (self->_isInProcess)
  {
    [(VCAudioStream *)self->_opaqueStream sendDTMFEvent:v13];
  }
  else
  {
    objc_super v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v13, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSendDTMFEvent" arguments:v14];
  }
}

- (void)startContinuousDTMFWithDigit:(char)a3 volume:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  int v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVCAudioStream startContinuousDTMFWithDigit:volume:]";
      __int16 v18 = 1024;
      int v19 = 419;
      __int16 v20 = 1024;
      int v21 = v5;
      __int16 v22 = 1024;
      int v23 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d digit=%c, volume=%u", buf, 0x28u);
    }
  }
  v12[0] = @"event";
  uint64_t v11 = [NSNumber numberWithUnsignedChar:v5];
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v12[1] = @"volume";
  v13[1] = [NSNumber numberWithUnsignedChar:v4];
  v13[2] = &unk_1F3DC5AA8;
  v12[2] = @"duration";
  v12[3] = @"interval";
  v13[3] = &unk_1F3DC5AA8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (self->_isInProcess)
  {
    [(VCAudioStream *)self->_opaqueStream sendDTMFEvent:v9];
  }
  else
  {
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSendDTMFEvent" arguments:v10];
  }
}

- (void)stopContinuousDTMF
{
  if (self->_isInProcess) {
    [(VCAudioStream *)self->_opaqueStream stopSendDTMFEvent];
  }
  else {
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStopSendDTMFEvent"];
  }
}

- (void)startSynchronizeWithStream:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      objc_super v14 = "-[AVCAudioStream startSynchronizeWithStream:]";
      __int16 v15 = 1024;
      int v16 = 445;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d syncStreamToken=%ld", buf, 0x26u);
    }
  }
  if (!self->_isInProcess)
  {
    uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamToken", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamStartSynchronization" arguments:v8];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        objc_super v14 = "-[AVCAudioStream startSynchronizeWithStream:]";
        __int16 v15 = 1024;
        int v16 = 453;
        __int16 v17 = 1024;
        LODWORD(v18) = a3;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: synchronizeWithStream %u", buf, 0x22u);
      }
    }
  }
}

+ (id)capabilities
{
  return +[VCAudioStream capabilities];
}

- (void)setJitterBufferMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCAudioStream setJitterBufferMode:]";
      __int16 v16 = 1024;
      int v17 = 466;
      __int16 v18 = 1024;
      int v19 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d Handover between cellular and wifi AVCJitterBufferMode=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] jitterBufferMode] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setJitterBufferMode:v3];
    uint64_t v7 = +[AVCMediaStreamConfig streamJitterBufferModeWithClientJitterBufferMode:v3];
    if (self->_isInProcess)
    {
      [(VCAudioStream *)self->_opaqueStream setJitterBufferMode:v7];
    }
    else
    {
      int v10 = @"vcMediaStreamJitterBufferMode";
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v7];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetJitterBufferMode" arguments:v9];
    }
  }
}

- (unsigned)jitterBufferMode
{
  v2 = [(AVCAudioStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 jitterBufferMode];
}

- (void)setDirection:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCAudioStream setDirection:]";
      __int16 v15 = 1024;
      int v16 = 492;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d direction=%ld", buf, 0x26u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] direction] != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setDirection:a3];
    if (self->_isInProcess)
    {
      [(VCAudioStream *)self->_opaqueStream setStreamDirection:+[AVCMediaStreamConfig streamDirectionWithClientDirection:a3]];
    }
    else
    {
      uint64_t v9 = @"vcMediaStreamDirection";
      uint64_t v10 = [NSNumber numberWithInteger:a3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetStreamDirection" arguments:v8];
    }
  }
}

- (int64_t)direction
{
  v2 = [(AVCAudioStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 direction];
}

- (void)setRtcpEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCAudioStream setRtcpEnabled:]";
      __int16 v15 = 1024;
      int v16 = 516;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] isRTCPEnabled] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setRtcpEnabled:v3];
    if (self->_isInProcess)
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpEnabled:v3];
    }
    else
    {
      uint64_t v9 = @"vcMediaStreamRTCPEnabled";
      uint64_t v10 = [NSNumber numberWithBool:v3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPEnabled" arguments:v8];
    }
  }
}

- (BOOL)isRTCPEnabled
{
  v2 = [(AVCAudioStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 isRTCPEnabled];
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCAudioStream setRtpTimeOutEnabled:]";
      __int16 v15 = 1024;
      int v16 = 542;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] isRTPTimeOutEnabled] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setRtpTimeOutEnabled:v3];
    if (self->_isInProcess)
    {
      [(VCMediaStream *)self->_opaqueStream setRtpTimeOutEnabled:v3];
    }
    else
    {
      uint64_t v9 = @"vcMediaStreamRTPTimeoutEnabled";
      uint64_t v10 = [NSNumber numberWithBool:v3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTPTimeoutEnabled" arguments:v8];
    }
  }
}

- (BOOL)isRTPTimeOutEnabled
{
  v2 = [(AVCAudioStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 isRTPTimeOutEnabled];
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCAudioStream setRtcpTimeOutEnabled:]";
      __int16 v15 = 1024;
      int v16 = 568;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if ([(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] isRTCPTimeOutEnabled] != v3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setRtcpTimeOutEnabled:v3];
    if (self->_isInProcess)
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpTimeOutEnabled:v3];
    }
    else
    {
      uint64_t v9 = @"vcMediaStreamRTCPTimeoutEnabled";
      uint64_t v10 = [NSNumber numberWithBool:v3];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPTimeoutEnabled" arguments:v8];
    }
  }
}

- (BOOL)isRTCPTimeOutEnabled
{
  v2 = [(AVCAudioStream *)self configuration];

  return [(AVCMediaStreamConfig *)v2 isRTCPTimeOutEnabled];
}

- (void)setRtpTimeOutIntervalSec:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCAudioStream setRtpTimeOutIntervalSec:]";
      __int16 v16 = 1024;
      int v17 = 594;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] rtpTimeOutInterval];
  if (v7 != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setRtpTimeOutInterval:a3];
    if (self->_isInProcess)
    {
      [(VCMediaStream *)self->_opaqueStream setRtpTimeOutInterval:a3];
    }
    else
    {
      uint64_t v10 = @"vcMediaStreamRTPTimeoutInterval";
      uint64_t v11 = [NSNumber numberWithDouble:a3];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTPTimeoutInterval" arguments:v9];
    }
  }
}

- (double)rtpTimeOutIntervalSec
{
  v2 = [(AVCAudioStream *)self configuration];

  [(AVCMediaStreamConfig *)v2 rtpTimeOutInterval];
  return result;
}

- (void)setRtcpTimeOutIntervalSec:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCAudioStream setRtcpTimeOutIntervalSec:]";
      __int16 v16 = 1024;
      int v17 = 620;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] rtcpTimeOutInterval];
  if (v7 != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setRtcpTimeOutInterval:a3];
    if (self->_isInProcess)
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpTimeOutInterval:a3];
    }
    else
    {
      uint64_t v10 = @"vcMediaStreamRTCPTimeoutInterval";
      uint64_t v11 = [NSNumber numberWithDouble:a3];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPTimeoutInterval" arguments:v9];
    }
  }
}

- (double)rtcpTimeOutIntervalSec
{
  v2 = [(AVCAudioStream *)self configuration];

  [(AVCMediaStreamConfig *)v2 rtcpTimeOutInterval];
  return result;
}

- (void)setRtcpSendIntervalSec:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCAudioStream setRtcpSendIntervalSec:]";
      __int16 v16 = 1024;
      int v17 = 646;
      __int16 v18 = 2048;
      double v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpSendIntervalSec=%f", buf, 0x26u);
    }
  }
  [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] rtcpSendInterval];
  if (v7 != a3)
  {
    [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] setRtcpSendInterval:a3];
    if (self->_isInProcess)
    {
      [(VCMediaStream *)self->_opaqueStream setRtcpSendInterval:a3];
    }
    else
    {
      uint64_t v10 = @"vcMediaStreamRTCPSendInterval";
      uint64_t v11 = [NSNumber numberWithDouble:a3];
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"vcMediaStreamDictionary", 0);
      [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetRTCPSendInterval" arguments:v9];
    }
  }
}

- (double)rtcpSendIntervalSec
{
  v2 = [(AVCAudioStream *)self configuration];

  [(AVCMediaStreamConfig *)v2 rtcpSendInterval];
  return result;
}

- (float)volume
{
  v2 = [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] audio];

  [(AVCAudioStreamConfig *)v2 volume];
  return result;
}

- (void)setVolume:(float)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v5;
      __int16 v20 = 2080;
      int v21 = "-[AVCAudioStream setVolume:]";
      __int16 v22 = 1024;
      int v23 = 676;
      __int16 v24 = 2048;
      double v25 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d volume=%f", buf, 0x26u);
    }
  }
  [(AVCAudioStreamConfig *)[(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] audio] volume];
  if (*(float *)&v7 != a3)
  {
    LODWORD(v7) = 0;
    LODWORD(v8) = 1065353216;
    if (a3 < 0.0 || a3 > 1.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioStream setVolume:](v10);
        }
      }
    }
    else
    {
      uint64_t v11 = [(AVCMediaStreamConfig *)[(AVCAudioStream *)self configuration] audio];
      *(float *)&double v12 = a3;
      [(AVCAudioStreamConfig *)v11 setVolume:v12];
      if (self->_isInProcess)
      {
        *(float *)&double v13 = a3;
        [(VCAudioStream *)self->_opaqueStream setVolume:v13];
      }
      else
      {
        __int16 v16 = @"vcMediaStreamVolume";
        *(float *)&double v13 = a3;
        uint64_t v17 = [NSNumber numberWithFloat:v13];
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        __int16 v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v14, @"vcMediaStreamDictionary", 0);
        [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetVolume" arguments:v15];
      }
    }
  }
}

- (BOOL)isInputFrequencyMeteringEnabled
{
  if (self->_isInProcess)
  {
    opaqueStream = self->_opaqueStream;
    return [(VCAudioStream *)opaqueStream isFrequencyMeteringEnabled:0];
  }
  else
  {
    id v4 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamGetInputFrequencyMeteringEnabled" arguments:0];
    if (v4
      && (uint64_t v5 = (void *)[v4 objectForKeyedSubscript:@"vcMediaStreamInputFreqMeterEnabled"]) != 0)
    {
      return [v5 BOOLValue];
    }
    else
    {
      return 0;
    }
  }
}

- (void)setInputFrequencyMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCAudioStream setInputFrequencyMeteringEnabled:]";
      __int16 v15 = 1024;
      int v16 = 719;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d isEnabled=%d", buf, 0x22u);
    }
  }
  if (self->_isInProcess)
  {
    [(VCAudioStream *)self->_opaqueStream setFrequencyMeteringEnabled:v3 meterType:0];
  }
  else
  {
    uint64_t v9 = @"vcMediaStreamInputFreqMeterEnabled";
    uint64_t v10 = [NSNumber numberWithBool:v3];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetInputFrequencyMeteringEnabled" arguments:v8];
  }
}

- (BOOL)isOutputFrequencyMeteringEnabled
{
  if (self->_isInProcess)
  {
    opaqueStream = self->_opaqueStream;
    return [(VCAudioStream *)opaqueStream isFrequencyMeteringEnabled:1];
  }
  else
  {
    id v4 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcMediaStreamGetOutputFrequencyMeteringEnabled" arguments:0];
    if (v4
      && (uint64_t v5 = (void *)[v4 objectForKeyedSubscript:@"vcMediaStreamOutputFreqMeterEnabled"]) != 0)
    {
      return [v5 BOOLValue];
    }
    else
    {
      return 0;
    }
  }
}

- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCAudioStream setOutputFrequencyMeteringEnabled:]";
      __int16 v15 = 1024;
      int v16 = 749;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d isEnabled=%d", buf, 0x22u);
    }
  }
  if (self->_isInProcess)
  {
    [(VCAudioStream *)self->_opaqueStream setFrequencyMeteringEnabled:v3 meterType:1];
  }
  else
  {
    uint64_t v9 = @"vcMediaStreamOutputFreqMeterEnabled";
    uint64_t v10 = [NSNumber numberWithBool:v3];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"vcMediaStreamDictionary", 0);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"vcMediaStreamSetOutputFrequencyMeteringEnabled" arguments:v8];
  }
}

- (AVCMediaStreamConfig)configuration
{
  return self->_configuration;
}

- (void)didInterruptionBeginHandler
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p interruption begin", v2, v3, v4, v5);
}

- (void)didInterruptionEndHandler
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p interruption end", v2, v3, v4, v5);
}

- (void)processDTMFEventWithDigit:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 charValue];
  uint64_t v5 = [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-didReceiveDTMFEventWithDigit");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136316162;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[AVCAudioStream processDTMFEventWithDigit:]";
        __int16 v12 = 1024;
        int v13 = 788;
        __int16 v14 = 2048;
        __int16 v15 = self;
        __int16 v16 = 1024;
        int v17 = v4;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didReceiveDTMFEventWithDigit (%p) dtmfDigit=%c", (uint8_t *)&v8, 0x2Cu);
      }
    }
    [(AVCAudioStreamDelegate *)v5 stream:self didReceiveDTMFEventWithDigit:v4];
  }
}

- (void)registerBlocksForDelegateNotifications
{
  v18[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke;
  v18[3] = &unk_1E6DB4338;
  v18[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidServerDie" block:v18 queue:self->_callbackQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_212;
  v17[3] = &unk_1E6DB4338;
  v17[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStartConnection" block:v17 queue:self->_callbackQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_231;
  v16[3] = &unk_1E6DB4338;
  void v16[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStopConnection" block:v16 queue:self->_callbackQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_233;
  v15[3] = &unk_1E6DB4338;
  void v15[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidPause" block:v15 queue:self->_callbackQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_240;
  v14[3] = &unk_1E6DB4338;
  v14[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidResume" block:v14 queue:self->_callbackQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_247;
  v13[3] = &unk_1E6DB4338;
  void v13[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidStartSynchronization" block:v13 queue:self->_callbackQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_254;
  v12[3] = &unk_1E6DB4338;
  void v12[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTPPacketTimeout" block:v12 queue:self->_callbackQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_256;
  v11[3] = &unk_1E6DB4338;
  v11[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTCPPacketTimeout" block:v11 queue:self->_callbackQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_258;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidRecoverFromRTCPTimeout" block:v10 queue:self->_callbackQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_262;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamRTCPPacketsReceived" block:v9 queue:self->_callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_267;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamUpdateInputFrequencyMetering" block:v8 queue:self->_callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_272;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamUpdateOutputFrequencyMetering" block:v7 queue:self->_callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_277;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidInterruptionBegin" block:v6 queue:self->_callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_2;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDidInterruptionEnd" block:v5 queue:self->_callbackQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_3;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcMediaStreamDTMFDigitReceived" block:v4 queue:self->_callbackQueue];
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) strong];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [a2 objectForKeyedSubscript:@"SERVERDIED"];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v5)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_2();
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_1();
      }
    }
    [v4 delegate];
    if (objc_opt_respondsToSelector())
    {
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-didServerDie");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315906;
          uint64_t v12 = v9;
          __int16 v13 = 2080;
          __int16 v14 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 811;
          __int16 v17 = 2048;
          uint64_t v18 = v4;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didServerDie (%p)", (uint8_t *)&v11, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidServerDie:", v4);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 815;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: Server died, but AVCAudioStream has already deallocated, NO-OP", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        int v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        int v8 = "<nil>";
      }
      int v29 = 136316162;
      uint64_t v30 = v6;
      __int16 v31 = 2080;
      uint64_t v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 822;
      __int16 v35 = 2048;
      int v36 = a3;
      __int16 v37 = 2080;
      v38[0] = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d didStartConnectionBlock: error = %p, float result = %s", (uint8_t *)&v29, 0x30u);
    }
  }
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v9 = [*(id *)(a1 + 32) strong];
    if (v9)
    {
      __int16 v10 = (void *)v9;
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
          uint64_t v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v33 = 1024;
          int v34 = 833;
          __int16 v35 = 1024;
          LODWORD(v36) = v16;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v29, 0x22u);
        }
      }
      __int16 v17 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      if (v17) {
        __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v17, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      [v10 delegate];
      if (objc_opt_respondsToSelector())
      {
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-didStart");
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
            uint64_t v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v33 = 1024;
            int v34 = 845;
            __int16 v35 = 2048;
            int v36 = v10;
            __int16 v37 = 1024;
            LODWORD(v38[0]) = v20;
            WORD2(v38[0]) = 2112;
            *(void *)((char *)v38 + 6) = v17;
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v29, 0x36u);
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
      uint64_t v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 850;
      __int16 v35 = 2048;
      int v36 = v10;
      __int16 v37 = 1024;
      LODWORD(v38[0]) = v23;
      __int16 v24 = "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didStart started[%d]";
      double v25 = v22;
      uint32_t v26 = 44;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      int v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v29 = 136315650;
      uint64_t v30 = v27;
      __int16 v31 = 2080;
      uint64_t v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 827;
      __int16 v24 = "AVCAudioStream [%s] %s:%d AVCAudioStream: didStartConnectionBlock: strongSelf == nil";
      double v25 = v28;
      uint32_t v26 = 28;
    }
    _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_231(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-didStop");
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
          __int16 v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 862;
          __int16 v18 = 2048;
          uint64_t v19 = v5;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didStop (%p)", (uint8_t *)&v12, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidStop:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          __int16 v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 865;
          __int16 v18 = 2048;
          uint64_t v19 = v5;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didStop", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_233(uint64_t a1, void *a2, uint64_t a3)
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
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-didPause");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136316418;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            int v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 890;
            __int16 v20 = 2048;
            uint64_t v21 = v6;
            __int16 v22 = 1024;
            int v23 = [v7 intValue];
            __int16 v24 = 2112;
            double v25 = v8;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didPause (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
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
          int v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 895;
          __int16 v20 = 2048;
          uint64_t v21 = v6;
          __int16 v22 = 1024;
          int v23 = v13;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didPause [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_240(uint64_t a1, void *a2, uint64_t a3)
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
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCAudioStream-didResume");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136316418;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            int v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v18 = 1024;
            int v19 = 920;
            __int16 v20 = 2048;
            uint64_t v21 = v6;
            __int16 v22 = 1024;
            int v23 = [v7 intValue];
            __int16 v24 = 2112;
            double v25 = v8;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didResume (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
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
          int v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 925;
          __int16 v20 = 2048;
          uint64_t v21 = v6;
          __int16 v22 = 1024;
          int v23 = v13;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didResume [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_247(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamSynchronizationStarted"];
      uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamError"];
      if (v8) {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_DOMAIN"), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", @"ERROR_USERINFO"));
      }
      [v6 delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didStartSynchronizer:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136316162;
          uint64_t v12 = v9;
          __int16 v13 = 2080;
          int v14 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 955;
          __int16 v17 = 2048;
          __int16 v18 = v6;
          __int16 v19 = 1024;
          int v20 = [v7 BOOLValue];
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didStartSynchronizer [%d]", (uint8_t *)&v11, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_254(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = v4;
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidRTPTimeOut:", v4);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          int v11 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 970;
          __int16 v14 = 2048;
          __int16 v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p RTP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_256(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = v4;
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidRTCPTimeOut:", v4);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          int v11 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 985;
          __int16 v14 = 2048;
          __int16 v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_258(uint64_t a1, void *a2, uint64_t a3)
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
          int v11 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 1001;
          __int16 v14 = 2048;
          __int16 v15 = v5;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client=%p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_262(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = v5;
      objc_msgSend(v5, "vcMediaStream:didReceiveRTCPPackets:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamRTCPPackets"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315906;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          __int16 v12 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 1016;
          __int16 v15 = 2048;
          uint64_t v16 = v6;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received RTCP packets", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_267(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = v5;
      objc_msgSend(v5, "vcMediaStream:updateInputFrequencyLevel:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamInputFreqMetering"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        int v9 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136315906;
            uint64_t v11 = v7;
            __int16 v12 = 2080;
            __int16 v13 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v14 = 1024;
            int v15 = 1033;
            __int16 v16 = 2048;
            uint64_t v17 = v6;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", (uint8_t *)&v10, 0x26u);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_267_cold_1();
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_272(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = v5;
      objc_msgSend(v5, "vcMediaStream:updateOutputFrequencyLevel:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamOutputFreqMetering"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        int v9 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136315906;
            uint64_t v11 = v7;
            __int16 v12 = 2080;
            __int16 v13 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            __int16 v14 = 1024;
            int v15 = 1050;
            __int16 v16 = 2048;
            uint64_t v17 = v6;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", (uint8_t *)&v10, 0x26u);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_272_cold_1();
        }
      }
    }
  }
}

id *__56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_277(id *result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v3 = result;
    float result = (id *)[a2 objectForKeyedSubscript:@"SERVERDIED"];
    if (!result)
    {
      float result = (id *)[v3[4] strong];
      if (result)
      {
        return (id *)[result didInterruptionBeginHandler];
      }
    }
  }
  return result;
}

id *__56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_2(id *result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v3 = result;
    float result = (id *)[a2 objectForKeyedSubscript:@"SERVERDIED"];
    if (!result)
    {
      float result = (id *)[v3[4] strong];
      if (result)
      {
        return (id *)[result didInterruptionEndHandler];
      }
    }
  }
  return result;
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        int v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        int v8 = "<nil>";
      }
      int v12 = 136316162;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      int v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke_3";
      __int16 v16 = 1024;
      int v17 = 1078;
      __int16 v18 = 2048;
      uint64_t v19 = a3;
      __int16 v20 = 2080;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d didReceiveDTMFEventWithDigitBlock: error=%p, result=%s", (uint8_t *)&v12, 0x30u);
    }
  }
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    int v9 = (void *)[*(id *)(a1 + 32) strong];
    if (v9)
    {
      objc_msgSend(v9, "processDTMFEventWithDigit:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamDTMFDigitReceived"));
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
        int v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1083;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: didReceiveDTMFEventWithDigit: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
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
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamUpdateInputFrequencyMetering"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamUpdateOutputFrequencyMetering"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidInterruptionBegin"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcMediaStreamDidInterruptionEnd"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcMediaStreamDTMFDigitReceived"];
}

- (BOOL)setupAudioStreamInProcessWithClientArgs:(id)a3 networkSockets:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v9 = [VCAudioStream alloc];
  uint64_t v10 = -[VCAudioStream initWithClientPid:](v9, "initWithClientPid:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processIdentifier"));
  self->_opaqueStream = v10;
  if (!v10)
  {
    BOOL v12 = 0;
    if (!a5) {
      return v12;
    }
    goto LABEL_5;
  }
  [(VCMediaStream *)v10 setDelegate:self];
  [(VCMediaStream *)self->_opaqueStream setDelegateFunctions:_AVCAudioStream_UpdateFrequencyLevel];
  id v11 = [(VCAudioStream *)self->_opaqueStream setLocalParticipantInfo:a3 networkSockets:a4 withError:a5];
  BOOL v12 = v11 != 0;
  if (v11) {
    [(AVCAudioStream *)self setCapabilities:v11];
  }
  self->_int streamToken = [(VCMediaStream *)self->_opaqueStream streamToken];
  if (a5)
  {
LABEL_5:
    if (!v12 && !*a5)
    {
      uint64_t v14 = *MEMORY[0x1E4F28588];
      v15[0] = @"Failed to create VCAudioStream";
      *a5 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"AVCAudioStream", -2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioStream setupAudioStreamInProcessWithClientArgs:networkSockets:error:]();
        }
      }
    }
  }
  return v12;
}

- (BOOL)configureInProcess:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -[VCAudioStreamConfig initWithClientDictionary:]([VCAudioStreamConfig alloc], "initWithClientDictionary:", [a3 dictionary]);
  int v8 = v7;
  if (v7
    && (opaqueStream = self->_opaqueStream,
        v13[0] = v7,
        -[VCMediaStream setStreamConfig:withError:](opaqueStream, "setStreamConfig:withError:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1], a4)))
  {
    [(AVCAudioStream *)self setConfiguration:a3];
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    if (!*a4)
    {
      uint64_t v11 = *MEMORY[0x1E4F28588];
      BOOL v12 = @"Failed to create VCAudioStreamConfig from config dictionary.";
      *a4 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"AVCAudioStream", -1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCAudioStream configureInProcess:error:]();
        }
      }
    }
    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)setupAudioStreamOutOfProcessWithClientArgs:(id)a3 networkSockets:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  self->_connection = objc_alloc_init(AVConferenceXPCClient);
  uint64_t v13 = @"vcMediaStreamDictionary";
  v14[0] = a3;
  id v9 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->_connection, "sendMessageSync:arguments:xpcArguments:", "vcMediaStreamInitializeAudio", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1], a4);
  [(AVCAudioStream *)self registerBlocksForDelegateNotifications];
  id v10 = [(AVCAudioStream *)self validateInitializeConnectionResult:v9];
  id v11 = v10;
  if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
  }
  else
  {
    -[AVCAudioStream setCapabilities:](self, "setCapabilities:", [v9 objectForKeyedSubscript:@"vcMediaStreamStreamCapabilities"]);
    self->_int streamToken = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"vcMediaStreamToken"), "integerValue");
    self->_uplinkToken = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"vcMediaStreamTokenUplink"), "integerValue");
    self->_downlinkToken = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"vcMediaStreamTokenDownlink"), "integerValue");
  }
  return v11 == 0;
}

- (BOOL)configureOutOfProcess:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v12 = @"vcMediaStreamDictionary";
  v13[0] = [a3 dictionary];
  BOOL v7 = 1;
  id v8 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamSetSessionConfig", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1]);
  if (v8)
  {
    id v9 = (id)[v8 objectForKeyedSubscript:@"ERROR"];
    if (v9)
    {
      id v10 = v9;
      [(AVCAudioStream *)self setConfiguration:0];
      BOOL v7 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      [(AVCAudioStream *)self setConfiguration:a3];
      return 1;
    }
  }
  return v7;
}

- (void)vcMediaStream:(id)a3 didStartStream:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      id v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316418;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        uint64_t v14 = "-[AVCAudioStream vcMediaStream:didStartStream:error:]";
        __int16 v15 = 1024;
        int v16 = 1211;
        __int16 v17 = 2112;
        id v18 = a3;
        __int16 v19 = 1024;
        BOOL v20 = v6;
        __int16 v21 = 2112;
        id v22 = a5;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, didStartStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
      }
    }
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] stream:self didStart:v6 error:a5];
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
      id v10 = "-[AVCAudioStream vcMediaStreamDidStop:]";
      __int16 v11 = 1024;
      int v12 = 1217;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] streamDidStop:self];
  }
}

- (void)vcMediaStream:(id)a3 didPauseStream:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    id v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      id v14 = "-[AVCAudioStream vcMediaStream:didPauseStream:error:]";
      __int16 v15 = 1024;
      int v16 = 1224;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 1024;
      BOOL v20 = v6;
      __int16 v21 = 2112;
      id v22 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, didPauseStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] stream:self didPause:v6 error:a5];
  }
}

- (void)vcMediaStream:(id)a3 didResumeStream:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(AVCAudioStream *)self delegate];
    [(AVCAudioStreamDelegate *)v8 stream:self didResume:v6 error:a5];
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
      id v10 = "-[AVCAudioStream vcMediaStreamDidRTPTimeOut:]";
      __int16 v11 = 1024;
      int v12 = 1237;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] streamDidRTPTimeOut:self];
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
      id v10 = "-[AVCAudioStream vcMediaStreamDidRTCPTimeOut:]";
      __int16 v11 = 1024;
      int v12 = 1244;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] streamDidRTCPTimeOut:self];
  }
}

- (void)vcMediaStream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  uint64_t v4 = a4;
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
      int v12 = "-[AVCAudioStream vcMediaStream:didReceiveDTMFEventWithDigit:]";
      __int16 v13 = 1024;
      int v14 = 1251;
      __int16 v15 = 2112;
      id v16 = a3;
      __int16 v17 = 1024;
      int v18 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, digit=%c", (uint8_t *)&v9, 0x2Cu);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] stream:self didReceiveDTMFEventWithDigit:v4];
  }
}

- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(a4);
        }
        id v11 = +[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:](AVCRTCPPacket, "newPacketWithRTCPPacket:packetLength:", [*(id *)(*((void *)&v32 + 1) + 8 * i) bytes], objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "length"));
        if (v11) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [a4 countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v8);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    if (a3)
    {
      int v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      if (a4)
      {
LABEL_13:
        __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        goto LABEL_16;
      }
    }
    else
    {
      int v12 = "<nil>";
      if (a4) {
        goto LABEL_13;
      }
    }
    __int16 v13 = "<nil>";
LABEL_16:
    asprintf(&__str, "stream=%s, rtcpPackets=%s", v12, v13);
    if (__str)
    {
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
            __int16 v24 = "-[AVCAudioStream vcMediaStream:didReceiveRTCPPackets:]";
            __int16 v25 = 1024;
            int v26 = 1270;
            __int16 v27 = 2080;
            int v28 = "";
            __int16 v29 = 2080;
            uint64_t v30 = v14;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        int v14 = strtok_r(0, "\n", &__lasts);
      }
      while (v14);
      free(__str);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] stream:self didReceiveRTCPPackets:v6];
  }
}

- (void)vcMediaStream:(id)a3 updateInputFrequencyLevel:(id)a4
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
      int v12 = "-[AVCAudioStream vcMediaStream:updateInputFrequencyLevel:]";
      __int16 v13 = 1024;
      int v14 = 1279;
      __int16 v15 = 2112;
      id v16 = a3;
      __int16 v17 = 2112;
      id v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, inputFreq=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] stream:self updateInputFrequencyLevel:a4];
  }
}

- (void)vcMediaStream:(id)a3 updateOutputFrequencyLevel:(id)a4
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
      int v12 = "-[AVCAudioStream vcMediaStream:updateOutputFrequencyLevel:]";
      __int16 v13 = 1024;
      int v14 = 1286;
      __int16 v15 = 2112;
      id v16 = a3;
      __int16 v17 = 2112;
      id v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, outputFreq=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  [(AVCAudioStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCAudioStreamDelegate *)[(AVCAudioStream *)self delegate] stream:self updateOutputFrequencyLevel:a4];
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
      uint64_t v10 = "-[AVCAudioStream vcMediaStreamServerDidDie:]";
      __int16 v11 = 1024;
      int v12 = 1306;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, serverDidDie", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVCAudioStream *)self stop];
}

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (int64_t)uplinkToken
{
  return self->_uplinkToken;
}

- (int64_t)downlinkToken
{
  return self->_downlinkToken;
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCVideoStream: clientSessionID in the options is not of NSUUIDtype", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[AVCAudioStream validateInitializeConnectionResult:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "AVCAudioStream [%s] %s:%d Missing capabilities dictionary: result=%@", v1);
}

- (void)validateInitializeConnectionResult:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10_10(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing capabilities dictionary: result=%@");
}

- (void)validateInitializeConnectionResult:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the uplink", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the uplink", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the downlink", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the downlink", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.11()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[AVCAudioStream validateInitializeConnectionResult:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "AVCAudioStream [%s] %s:%d IPC Timeout: result=%@", v1);
}

- (void)validateInitializeConnectionResult:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10_10(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d IPC Timeout: result=%@");
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.13(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"ERROR"];
  int v5 = 136316162;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_16();
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "AVCAudioStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.14(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a2 objectForKeyedSubscript:@"ERROR"];
  int v5 = 136316162;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_16();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, "AVCAudioStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
}

- (void)validateInitializeConnectionResult:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_7();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
}

- (void)validateInitializeConnectionResult:.cold.16()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_7();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
}

- (void)configure:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  int v6 = 136315906;
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v5, "AVCAudioStream [%s] %s:%d Invalid audio configuration: error[%s]", (uint8_t *)&v6);
}

- (void)configure:(NSObject *)a3 error:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  }
  int v5 = 136315906;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_11();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, "AVCAudioStream [%s] %s:%d Invalid audio configuration: error[%s]", (uint8_t *)&v5, 0x26u);
}

- (void)setVolume:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0();
  int v6 = 683;
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v2, v3, "AVCAudioStream [%s] %s:%d Volume out of range:%f expected [0.0 - 1.0]", (uint8_t *)&v4);
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: Media server died, notifying client", v2, v3, v4, v5, v6);
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: AVC server died, notifying client", v2, v3, v4, v5, v6);
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_267_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", v2, v3, v4, v5);
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_272_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", v2, v3, v4, v5);
}

- (void)setupAudioStreamInProcessWithClientArgs:networkSockets:error:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 1131;
  __int16 v4 = 2112;
  uint64_t v5 = @"Failed to create VCAudioStream";
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d error=%@", v2);
}

- (void)configureInProcess:error:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 1148;
  __int16 v4 = 2112;
  uint64_t v5 = @"Failed to create VCAudioStreamConfig from config dictionary.";
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v1, "AVCAudioStream [%s] %s:%d error=%@", v2);
}

@end