@interface APEndpointStreamScreenAVCWrapper
- (APEndpointStreamScreenAVCWrapper)initWithClientPID:(__CFNumber *)a3 hdrMode:(__CFString *)a4 presentationMode:(BOOL)a5 hdrMirroringSupported:(BOOL)a6 eventHandlers:(id *)a7 error:(int *)a8;
- (id)negotiationDataForPresentationMode:(unsigned __int8)a3;
- (int)createVideoStreamConfig:(id *)a3 withDirection:(int64_t)a4 screenOptions:(id *)a5 previousConfig:(id)a6;
- (int)getClientUPID:(unint64_t *)a3;
- (int)initScreeenCaptureWithScreenOptions:(id *)a3;
- (int)initializeNegotiatorWithMode:(__CFString *)a3 presentationMode:(BOOL)a4 hdrMirroringSupported:(BOOL)a5;
- (int)restartWithScreenOptions:(id *)a3 negotiatedBlob:(id)a4;
- (int)setCaptureSourceIDForStreamConfig:(id)a3;
- (int)start;
- (int)startWithNWConnectionClientID:(unsigned __int8)a3[16] negotiatedBlob:(id)a4 screenOptions:(id *)a5 completion:(id *)a6;
- (int)stop;
- (unint64_t)convertHDRMode:(__CFString *)a3;
- (unsigned)isConfigPresentForPresentationMode:(unsigned __int8)a3;
- (void)dealloc;
- (void)getVideoResolutionFromOptions:(id *)a3 width:(unint64_t *)a4 height:(unint64_t *)a5;
- (void)handleFailureWithError:(int)a3 reason:(__CFString *)a4;
- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 screenDidClear:(BOOL)a4;
- (void)serverDidDisconnect:(id)a3;
- (void)stopWithCompletion:(id *)a3;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation APEndpointStreamScreenAVCWrapper

- (APEndpointStreamScreenAVCWrapper)initWithClientPID:(__CFNumber *)a3 hdrMode:(__CFString *)a4 presentationMode:(BOOL)a5 hdrMirroringSupported:(BOOL)a6 eventHandlers:(id *)a7 error:(int *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APEndpointStreamScreenAVCWrapper;
  v14 = [(APEndpointStreamScreenAVCWrapper *)&v19 init];
  v15 = v14;
  if (v14)
  {
    if (a3) {
      CFNumberGetValue(a3, kCFNumberIntType, &v14->_clientPID);
    }
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v15->_completionSemaphore = (OS_dispatch_semaphore *)v16;
    if (!v16) {
      goto LABEL_7;
    }
    v15->_eventWeakContext = (void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v15->_eventHandleStart = a7->var1;
    v15->_eventHandleStop = a7->var2;
    v15->_eventHandleFailed = a7->var3;
    v15->_eventHandleClearScreen = a7->var4;
    v15->_isSubFrameEnabled = FigGetCFPreferenceNumberWithDefault();
    int v17 = [(APEndpointStreamScreenAVCWrapper *)v15 initializeNegotiatorWithMode:a4 presentationMode:v11 hdrMirroringSupported:v10];
    *a8 = v17;
    if (v17) {
LABEL_7:
    }
      APSLogErrorAt();
  }
  return v15;
}

- (int)initializeNegotiatorWithMode:(__CFString *)a3 presentationMode:(BOOL)a4 hdrMirroringSupported:(BOOL)a5
{
  BOOL v5 = a4;
  id v14 = 0;
  if (a4 || a5) {
    unint64_t v7 = [(APEndpointStreamScreenAVCWrapper *)self convertHDRMode:a3];
  }
  else {
    unint64_t v7 = 0;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:v7];
  if (v8
    && (uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, getAVCMediaStreamNegotiatorHDRMode(), 0)) != 0)
  {
    BOOL v10 = (objc_class *)[objc_alloc((Class)getAVCMediaStreamNegotiatorClass()) initWithMode:2 options:v9 error:&v14];
    uint64_t v11 = 32;
    if (v5) {
      uint64_t v11 = 40;
    }
    *(Class *)((char *)&self->super.isa + v11) = v10;
    if (v14)
    {
      APSLogErrorAt();
      int v12 = [v14 code];
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    int v12 = -16761;
  }

  return v12;
}

- (int)initScreeenCaptureWithScreenOptions:(id *)a3
{
  id v5 = objc_alloc_init((Class)getAVCScreenCaptureConfigurationClass[0]());
  v6 = v5;
  if (v5
    && (([v5 setScreenCaptureDisplayID:0xFFFFFFFFLL], a3->var7) ? (uint64_t v7 = 1) : (uint64_t v7 = 2),
        [v6 setDisplayMode:v7],
        v8 = (AVCScreenCapture *)[objc_alloc((Class)getAVCScreenCaptureClass[0]()) initWithDelegate:self withConfig:v6], (self->_avcScreenCapture = v8) != 0))
  {
    int v9 = 0;
  }
  else
  {
    APSLogErrorAt();
    int v9 = -6718;
  }

  return v9;
}

- (int)setCaptureSourceIDForStreamConfig:(id)a3
{
  avcScreenCapture = self->_avcScreenCapture;
  if (!avcScreenCapture || !a3)
  {
    APSLogErrorAt();
    return -6727;
  }
  objc_msgSend((id)objc_msgSend(a3, "video"), "setCaptureSourceID:", -[AVCScreenCapture captureSourceID](avcScreenCapture, "captureSourceID"));
  if (gLogCategory_APEndpointStreamScreenUDP > 50) {
    return 0;
  }
  if (gLogCategory_APEndpointStreamScreenUDP != -1 || (int result = _LogCategory_Initialize()) != 0)
  {
    objc_msgSend((id)objc_msgSend(a3, "video"), "captureSourceID");
    LogPrintF();
    return 0;
  }
  return result;
}

- (void)dealloc
{
  eventWeakContext = self->_eventWeakContext;
  if (eventWeakContext)
  {
    CFRelease(eventWeakContext);
    self->_eventWeakContext = 0;
  }
  completionSemaphore = self->_completionSemaphore;
  if (completionSemaphore)
  {
    dispatch_release(completionSemaphore);
    self->_completionSemaphore = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APEndpointStreamScreenAVCWrapper;
  [(APEndpointStreamScreenAVCWrapper *)&v5 dealloc];
}

- (int)start
{
  [(AVCScreenCapture *)self->_avcScreenCapture startCapture];
  [(AVCVideoStream *)self->_avcVideoStream start];
  completionSemaphore = self->_completionSemaphore;
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  if (!dispatch_semaphore_wait(completionSemaphore, v4)) {
    return self->_didStartStatus;
  }
  APSLogErrorAt();
  return -6722;
}

- (int)startWithNWConnectionClientID:(unsigned __int8)a3[16] negotiatedBlob:(id)a4 screenOptions:(id *)a5 completion:(id *)a6
{
  id v31 = 0;
  if (a5->var4) {
    uint64_t v10 = 56;
  }
  else {
    uint64_t v10 = 48;
  }
  uint64_t v11 = 40;
  if (!a5->var4) {
    uint64_t v11 = 32;
  }
  int v12 = *(Class *)((char *)&self->super.isa + v11);
  [v12 setAnswer:a4 withError:&v31];
  if (v31)
  {
    APSLogErrorAt();
    LODWORD(v25) = [v31 code];
LABEL_25:
    objc_super v19 = 0;
    v20 = 0;
    v18 = 0;
    goto LABEL_19;
  }
  v13 = (Class *)((char *)&self->super.isa + v10);
  int v14 = [(APEndpointStreamScreenAVCWrapper *)self createVideoStreamConfig:(char *)self + v10 withDirection:1 screenOptions:a5 previousConfig:0];
  if (v14)
  {
    LODWORD(v25) = v14;
LABEL_24:
    APSLogErrorAt();
    goto LABEL_25;
  }
  int v15 = [(APEndpointStreamScreenAVCWrapper *)self initScreeenCaptureWithScreenOptions:a5];
  if (v15)
  {
    LODWORD(v25) = v15;
    goto LABEL_24;
  }
  int v16 = [(APEndpointStreamScreenAVCWrapper *)self setCaptureSourceIDForStreamConfig:*v13];
  if (v16)
  {
    LODWORD(v25) = v16;
    goto LABEL_24;
  }
  int v17 = (void *)[v12 generateMediaStreamInitOptionsWithError:&v31];
  if (v31)
  {
    APSLogErrorAt();
    int v29 = [v31 code];
    objc_super v19 = 0;
    v20 = 0;
    v18 = 0;
LABEL_30:
    LODWORD(v25) = v29;
    goto LABEL_19;
  }
  v18 = (void *)[v17 objectForKeyedSubscript:getkAVCMediaStreamOptionCallID[0]()];
  if (!v18)
  {
    APSLogErrorAt();
    LODWORD(v25) = 0;
    objc_super v19 = 0;
    v20 = 0;
    goto LABEL_19;
  }
  v30 = a6;
  objc_super v19 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithBool:APSHasUDPMirroringOutOfProcessSupport() == 0];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:self->_clientPID];
  id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v22 = getkAVCMediaStreamOptionRunInProcess[0]();
  uint64_t v23 = getkAVCMediaStreamOptionClientPID[0]();
  v18 = objc_msgSend(v21, "initWithObjectsAndKeys:", v19, v22, v20, v23, v18, getkAVCMediaStreamOptionCallID[0](), 0);
  if (!v18)
  {
    APSLogErrorAt();
    LODWORD(v25) = -16761;
    goto LABEL_19;
  }
  v24 = (AVCVideoStream *)[objc_alloc((Class)getAVCVideoStreamClass[0]()) initWithNWConnectionClientID:a3 options:v18 error:&v31];
  self->_avcVideoStream = v24;
  if (v31
    || ([(AVCVideoStream *)v24 setDelegate:self],
        [(AVCVideoStream *)self->_avcVideoStream configure:*v13 error:&v31],
        v31))
  {
    APSLogErrorAt();
    int v29 = [v31 code];
    goto LABEL_30;
  }
  uint64_t v25 = [(APEndpointStreamScreenAVCWrapper *)self start];
  if (self->_eventHandleStart)
  {
    if (self->_eventWeakContext)
    {
      uint64_t v26 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v26)
      {
        v27 = (const void *)v26;
        ((void (*)(uint64_t, $68F4C1BE55AAC8698867A047E72A1EE9 *, uint64_t))self->_eventHandleStart)(v26, v30, v25);
        CFRelease(v27);
      }
    }
  }
LABEL_19:

  return v25;
}

- (int)stop
{
  [(AVCScreenCapture *)self->_avcScreenCapture stopCapture];

  self->_avcScreenCapture = 0;
  [(AVCVideoStream *)self->_avcVideoStream stop];
  completionSemaphore = self->_completionSemaphore;
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  intptr_t v5 = dispatch_semaphore_wait(completionSemaphore, v4);
  if (v5)
  {
    APSLogErrorAt();
    LODWORD(v5) = -6722;
  }
  return v5;
}

- (void)stopWithCompletion:(id *)a3
{
  uint64_t v5 = [(APEndpointStreamScreenAVCWrapper *)self stop];
  if (self->_eventHandleStop)
  {
    uint64_t v6 = v5;
    if (self->_eventWeakContext)
    {
      uint64_t v7 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v7)
      {
        v8 = (const void *)v7;
        ((void (*)(uint64_t, $68F4C1BE55AAC8698867A047E72A1EE9 *, uint64_t))self->_eventHandleStop)(v7, a3, v6);
        CFRelease(v8);
      }
    }
  }

  self->_avcVideoStream = 0;
  self->_videoStreamConfigForMirroring = 0;

  self->_videoStreamConfigForPresentationMode = 0;
  self->_avcScreenCapture = 0;
}

- (unint64_t)convertHDRMode:(__CFString *)a3
{
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F34D80])) {
    return 1;
  }
  else {
    return 2 * (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F34D78]) != 0);
  }
}

- (void)getVideoResolutionFromOptions:(id *)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  *a4 = (int)APSSettingsGetIntWithDefault();
  *a5 = (int)APSSettingsGetIntWithDefault();
}

- (int)restartWithScreenOptions:(id *)a3 negotiatedBlob:(id)a4
{
  id v19 = 0;
  uint64_t v7 = 56;
  if (a3->var4) {
    uint64_t v8 = 56;
  }
  else {
    uint64_t v8 = 48;
  }
  if (a3->var4) {
    uint64_t v7 = 48;
  }
  int v9 = *(Class *)((char *)&self->super.isa + v7);
  if (a3->var4) {
    p_videoStreamConfigForPresentationMode = &self->_videoStreamConfigForPresentationMode;
  }
  else {
    p_videoStreamConfigForPresentationMode = &self->_videoStreamConfigForMirroring;
  }
  uint64_t v11 = 40;
  if (!a3->var4) {
    uint64_t v11 = 32;
  }
  int v12 = *(Class *)((char *)&self->super.isa + v11);
  int v13 = [(APEndpointStreamScreenAVCWrapper *)self stop];
  if (v13)
  {
    int v17 = v13;
LABEL_30:
    APSLogErrorAt();
    return v17;
  }
  if (a4)
  {
    [v12 setAnswer:a4 withError:&v19];
    if (v19) {
      goto LABEL_25;
    }
  }
  if (!*(Class *)((char *)&self->super.isa + v8))
  {
    if (!v9)
    {
      APSLogErrorAt();
      return -6727;
    }
    int v14 = -[APEndpointStreamScreenAVCWrapper createVideoStreamConfig:withDirection:screenOptions:previousConfig:](self, "createVideoStreamConfig:withDirection:screenOptions:previousConfig:", p_videoStreamConfigForPresentationMode, [v9 direction], a3, v9);
    if (v14)
    {
      int v17 = v14;
      goto LABEL_30;
    }
  }
  int v15 = [(APEndpointStreamScreenAVCWrapper *)self initScreeenCaptureWithScreenOptions:a3];
  if (v15)
  {
    int v17 = v15;
    goto LABEL_30;
  }
  int v16 = [(APEndpointStreamScreenAVCWrapper *)self setCaptureSourceIDForStreamConfig:*(Class *)((char *)&self->super.isa + v8)];
  if (v16)
  {
    int v17 = v16;
    goto LABEL_30;
  }
  [(AVCVideoStream *)self->_avcVideoStream configure:*(Class *)((char *)&self->super.isa + v8) error:&v19];
  if (v19)
  {
LABEL_25:
    APSLogErrorAt();
    return [v19 code];
  }
  int v17 = [(APEndpointStreamScreenAVCWrapper *)self start];
  if (v17) {
    goto LABEL_30;
  }
  return v17;
}

- (int)createVideoStreamConfig:(id *)a3 withDirection:(int64_t)a4 screenOptions:(id *)a5 previousConfig:(id)a6
{
  uint64_t v21 = 0;
  id v22 = 0;
  uint64_t v20 = 0;
  uint64_t v11 = 40;
  if (!a5->var4) {
    uint64_t v11 = 32;
  }
  uint64_t v12 = [*(id *)((char *)&self->super.isa + v11) generateMediaStreamConfigurationWithError:&v22];
  if (v22)
  {
    APSLogErrorAt();
    return [v22 code];
  }
  else
  {
    int v13 = (void *)v12;
    [(APEndpointStreamScreenAVCWrapper *)self getVideoResolutionFromOptions:a5 width:&v21 height:&v20];
    objc_msgSend((id)objc_msgSend(v13, "video"), "setVideoResolution:", 12);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setCustomWidth:", v21);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setCustomHeight:", v20);
    [v13 setDirection:a4];
    uint64_t var1 = a5->var1;
    if (var1) {
      objc_msgSend((id)objc_msgSend(v13, "video"), "setFramerate:", var1);
    }
    if (self->_isSubFrameEnabled && !a5->var4) {
      objc_msgSend((id)objc_msgSend(v13, "video"), "setTilesPerFrame:", 4);
    }
    uint64_t IntWithDefault = (int)APSSettingsGetIntWithDefault();
    uint64_t v16 = (int)APSSettingsGetIntWithDefault();
    objc_msgSend((id)objc_msgSend(v13, "video"), "setTxMaxBitrate:", IntWithDefault);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setTxMinBitrate:", v16);
    [v13 setRtcpTimeOutEnabled:1];
    [v13 setRtcpSendInterval:1.0];
    [v13 setRtcpTimeOutInterval:30.0];
    [v13 setSRTPCipherSuite:5];
    [v13 setSRTCPCipherSuite:5];
    if (a6)
    {
      objc_msgSend(v13, "setReceiveMasterKey:", objc_msgSend(a6, "receiveMasterKey"));
      id var2 = (id)[a6 sendMasterKey];
    }
    else
    {
      [v13 setReceiveMasterKey:a5->var3];
      id var2 = a5->var2;
    }
    [v13 setSendMasterKey:var2];
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend((id)objc_msgSend(v13, "video"), "tilesPerFrame");
      objc_msgSend((id)objc_msgSend(v13, "video"), "hdrMode");
      objc_msgSend((id)objc_msgSend(v13, "video"), "pixelFormat");
      LogPrintF();
    }
    id v18 = v13;
    int result = 0;
    *a3 = v18;
  }
  return result;
}

- (int)getClientUPID:(unint64_t *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  if (APSHasUDPMirroringOutOfProcessSupport())
  {
    dispatch_time_t v4 = objc_msgSend((Class)getAVCDaemonProcessInfoClass[0](), "getDaemonProcessInfo", v7);
    if (v4)
    {
      *a3 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", getAVCKeyDaemonProcessInfoUniquePID()), "longLongValue");
      return 0;
    }
    APSLogErrorAt();
  }
  else
  {
    pid_t v5 = getpid();
    if (proc_pidinfo(v5, 17, 1uLL, &v7, 56) == 56)
    {
      *a3 = v8;
      return 0;
    }
    *a3 = 0;
  }
  if (gLogCategory_APEndpointStreamScreenUDP <= 90
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

- (id)negotiationDataForPresentationMode:(unsigned __int8)a3
{
  uint64_t v3 = 40;
  if (!a3) {
    uint64_t v3 = 32;
  }
  return (id)[*(id *)((char *)&self->super.isa + v3) offer];
}

- (unsigned)isConfigPresentForPresentationMode:(unsigned __int8)a3
{
  uint64_t v3 = 56;
  if (!a3) {
    uint64_t v3 = 48;
  }
  return *(Class *)((char *)&self->super.isa + v3) != 0;
}

- (void)handleFailureWithError:(int)a3 reason:(__CFString *)a4
{
  if (self->_eventHandleFailed)
  {
    if (self->_eventWeakContext)
    {
      uint64_t v6 = *(void *)&a3;
      uint64_t v7 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v7)
      {
        long long v8 = (const void *)v7;
        ((void (*)(uint64_t, uint64_t, __CFString *))self->_eventHandleFailed)(v7, v6, a4);
        CFRelease(v8);
      }
    }
  }
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  if (a5) {
    int v6 = [a5 code];
  }
  else {
    int v6 = 0;
  }
  if (gLogCategory_APEndpointStreamScreenUDP <= 30
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_didStartStatus = v6;
  completionSemaphore = self->_completionSemaphore;
  dispatch_semaphore_signal(completionSemaphore);
}

- (void)streamDidStop:(id)a3
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 30
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  completionSemaphore = self->_completionSemaphore;
  dispatch_semaphore_signal(completionSemaphore);
}

- (void)streamDidServerDie:(id)a3
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 30
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APEndpointStreamScreenAVCWrapper *)self handleFailureWithError:0 reason:@"Server Died"];
}

- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)screenCapture:(id)a3 screenDidClear:(BOOL)a4
{
  BOOL v4 = a4;
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_eventHandleClearScreen)
  {
    if (self->_eventWeakContext)
    {
      uint64_t v6 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v6)
      {
        uint64_t v7 = (const void *)v6;
        ((void (*)(uint64_t, BOOL))self->_eventHandleClearScreen)(v6, v4);
        CFRelease(v7);
      }
    }
  }
}

- (void)serverDidDisconnect:(id)a3
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end