@interface AVCStreamOutput
+ (id)errorWithStreamOutputError:(int64_t)a3;
- (AVCStreamOutput)initWithStreamToken:(int64_t)a3 delegate:(id)a4 queue:(id)a5 error:(id *)a6;
- (AVCStreamOutputDelegate)delegate;
- (BOOL)isDegraded;
- (BOOL)isPaused;
- (BOOL)isStalled;
- (BOOL)isSuspended;
- (BOOL)isValid;
- (BOOL)validateAccess;
- (BOOL)validateAccessWithProcessName:(id)a3 accessControlPlist:(id)a4;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)internalReceiverQueue;
- (float)synchronizationTimeOffset;
- (int)createReceiverQueue;
- (int)processID;
- (int)setupRemoteQueueWithSenderQueue:(id)a3;
- (int)setupXPCConnection;
- (int64_t)streamToken;
- (void)createReceiverQueue;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)didDegrade:(BOOL)a3;
- (void)didInvalidate;
- (void)didPause:(BOOL)a3;
- (void)didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)didStall:(BOOL)a3;
- (void)didSuspend:(BOOL)a3;
- (void)didUpdateAttachments:(__CFDictionary *)a3;
- (void)registerBlocksForNotification;
- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4;
- (void)serviceHandlerDidDegradeWithArguments:(id)a3 error:(id)a4;
- (void)serviceHandlerDidDieWithArguments:(id)a3 error:(id)a4;
- (void)serviceHandlerDidPauseWithArguments:(id)a3 error:(id)a4;
- (void)serviceHandlerDidReceiveFrameWithArguments:(id)a3 error:(id)a4;
- (void)serviceHandlerDidStallWithArguments:(id)a3 error:(id)a4;
- (void)serviceHandlerDidSuspendWithArguments:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setInternalReceiverQueue:(id)a3;
- (void)setIsDegraded:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setSynchronizationTimeOffset:(float)a3;
- (void)setupDelegateQueue:(id)internalReceiverQueue;
- (void)setupXPCConnection;
- (void)terminateConnection;
- (void)validateAccess;
@end

@implementation AVCStreamOutput

- (AVCStreamOutput)initWithStreamToken:(int64_t)a3 delegate:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v21 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCStreamOutput-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a6) {
        v13 = (__CFString *)*a6;
      }
      else {
        v13 = @"nil";
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v23 = v11;
      __int16 v24 = 2080;
      v25 = "-[AVCStreamOutput initWithStreamToken:delegate:queue:error:]";
      __int16 v26 = 1024;
      int v27 = 122;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2048;
      int64_t v31 = a3;
      __int16 v32 = 2112;
      id v33 = a4;
      __int16 v34 = 2112;
      id v35 = a5;
      __int16 v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d @:@ AVCStreamOutput-init (%p) streamToken=%ld, delegate=%@, queue=%@, error=%@", buf, 0x4Eu);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)AVCStreamOutput;
  v14 = [(AVCStreamOutput *)&v20 init];
  if (!v14) {
    goto LABEL_15;
  }
  VRTraceReset();
  if ([v14 validateAccess])
  {
    v14[120] = (int)VRTraceGetErrorLogLevelForModule() > 7;
    *((void *)v14 + 4) = a3;
    objc_storeWeak((id *)v14 + 3, a4);
    v14[40] = 1;
    *((_DWORD *)v14 + 12) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processIdentifier");
    int v21 = [v14 createReceiverQueue];
    if (v21)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamOutput initWithStreamToken:delegate:queue:error:]();
        }
      }
    }
    else
    {
      [v14 setupDelegateQueue:a5];
      if ([+[VCStreamOutputManager sharedInstance] sourceExistsForStreamToken:*((void *)v14 + 4)])
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v14, @"vcStreamOutputInProcessDelegate", *((void *)v14 + 20), @"vcStreamOutputInProcessDelegateQueue", 0);
        *((void *)v14 + 14) = [+[VCStreamOutputManager sharedInstance] allocStreamOutputWithStreamToken:*((void *)v14 + 4) clientPid:getpid() options:v15 errorCode:&v21];

        if (*((void *)v14 + 14))
        {
          objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "notifyCachedStateForStreamToken:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
LABEL_14:
          uint64_t v16 = MEMORY[0x1E4F1F9F8];
          long long v17 = *MEMORY[0x1E4F1F9F8];
          *((_OWORD *)v14 + 5) = *MEMORY[0x1E4F1F9F8];
          uint64_t v18 = *(void *)(v16 + 16);
          *((void *)v14 + 12) = v18;
          *(_OWORD *)(v14 + 56) = v17;
          *((void *)v14 + 9) = v18;
          kdebug_trace();
          *((void *)v14 + 17) = (id)[MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v14];
          goto LABEL_15;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCStreamOutput initWithStreamToken:delegate:queue:error:]();
          }
        }
      }
      else
      {
        int v21 = [v14 setupXPCConnection];
        if (!v21) {
          goto LABEL_14;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCStreamOutput initWithStreamToken:delegate:queue:error:]();
          }
        }
      }
    }
LABEL_15:
    if (!v21) {
      return (AVCStreamOutput *)v14;
    }
    goto LABEL_16;
  }
  int v21 = -7;
LABEL_16:

  v14 = 0;
  if (a6) {
    *a6 = +[AVCStreamOutput errorWithStreamOutputError:v21];
  }
  return (AVCStreamOutput *)v14;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCStreamOutput-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      v12 = "-[AVCStreamOutput dealloc]";
      __int16 v13 = 1024;
      int v14 = 174;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d @:@ AVCStreamOutput-dealloc (%p)", buf, 0x26u);
    }
  }
  [(VCStreamOutput *)self->_vcStreamOutput invalidate];
  [+[VCStreamOutputManager sharedInstance] cleanupStreamOutput:self->_vcStreamOutput];

  self->_weakSelf = 0;
  objc_storeWeak(&self->_delegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  [(AVCStreamOutput *)self terminateConnection];
  if (self->_receiverQueue) {
    VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);
  }
  attachments = self->_attachments;
  if (attachments) {
    CFRelease(attachments);
  }
  internalReceiverQueue = self->_internalReceiverQueue;
  if (internalReceiverQueue)
  {
    dispatch_release(internalReceiverQueue);
    self->_internalReceiverQueue = 0;
  }
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)AVCStreamOutput;
  [(AVCStreamOutput *)&v8 dealloc];
}

- (BOOL)validateAccessWithProcessName:(id)a3 accessControlPlist:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
LABEL_35:
    LOBYTE(v6) = 0;
    return v6;
  }
  v5 = (void *)[a4 objectForKeyedSubscript:kAVCStreamOutputProcessAllowEntry];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((AVCStreamOutput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v6) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        -[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v21 = (__CFString *)[(AVCStreamOutput *)self performSelector:sel_logPrefix];
      }
      else {
        int v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        uint64_t v23 = *MEMORY[0x1E4F47A50];
        LODWORD(v6) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v27 = v22;
        __int16 v28 = 2080;
        v29 = "-[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]";
        __int16 v30 = 1024;
        int v31 = 195;
        __int16 v32 = 2112;
        id v33 = v21;
        __int16 v34 = 2048;
        id v35 = self;
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Failed to retrieve the allow process name list", buf, 0x30u);
      }
    }
    goto LABEL_35;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = v6;
  objc_super v8 = &selRef_isInputAvailable;
  uint64_t v9 = *(void *)v40;
  do
  {
    uint64_t v10 = 0;
    __int16 v11 = v8[417];
    do
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(v5);
      }
      v12 = *(__CFString **)(*((void *)&v39 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a3 isEqualToString:v12])
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }
      else if ((AVCStreamOutput *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          objc_super v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v27 = v19;
            __int16 v28 = 2080;
            v29 = "-[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]";
            __int16 v30 = 1024;
            int v31 = 199;
            __int16 v32 = 2112;
            id v33 = v12;
            uint64_t v16 = v20;
            uint64_t v17 = "AVCStreamOutput [%s] %s:%d Unexpected type process name entry=%@. Skipping ...";
            uint32_t v18 = 38;
            goto LABEL_22;
          }
        }
      }
      else
      {
        __int16 v13 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          __int16 v13 = (__CFString *)[(AVCStreamOutput *)self performSelector:v11];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          __int16 v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v27 = v14;
            __int16 v28 = 2080;
            v29 = "-[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]";
            __int16 v30 = 1024;
            int v31 = 199;
            __int16 v32 = 2112;
            id v33 = v13;
            __int16 v34 = 2048;
            id v35 = self;
            __int16 v36 = 2112;
            v37 = v12;
            uint64_t v16 = v15;
            uint64_t v17 = "AVCStreamOutput [%s] %s:%d %@(%p) Unexpected type process name entry=%@. Skipping ...";
            uint32_t v18 = 58;
LABEL_22:
            _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
          }
        }
      }
      ++v10;
    }
    while (v7 != v10);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v38 count:16];
    uint64_t v7 = v6;
    objc_super v8 = &selRef_isInputAvailable;
  }
  while (v6);
  return v6;
}

- (BOOL)validateAccess
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  if (!v3)
  {
    if ((AVCStreamOutput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamOutput validateAccess]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = (__CFString *)[(AVCStreamOutput *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v16;
          __int16 v24 = 2080;
          v25 = "-[AVCStreamOutput validateAccess]";
          __int16 v26 = 1024;
          int v27 = 214;
          __int16 v28 = 2112;
          uint64_t v29 = (uint64_t)v15;
          __int16 v30 = 2048;
          int v31 = self;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Failed to get the current process name", buf, 0x30u);
        }
      }
    }
LABEL_28:
    if ((AVCStreamOutput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v14) {
          return v14;
        }
        -[AVCStreamOutput validateAccess]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v18 = (__CFString *)[(AVCStreamOutput *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        objc_super v20 = *MEMORY[0x1E4F47A50];
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v14) {
          return v14;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v19;
        __int16 v24 = 2080;
        v25 = "-[AVCStreamOutput validateAccess]";
        __int16 v26 = 1024;
        int v27 = 231;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v18;
        __int16 v30 = 2048;
        int v31 = self;
        __int16 v32 = 2112;
        uint64_t v33 = v3;
        _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Access denied for process=%@", buf, 0x3Au);
      }
    }
    LOBYTE(v14) = 0;
    return v14;
  }
  uint64_t v4 = [MEMORY[0x1E4F28B50] plistForClass:objc_opt_class() withPath:kAVCStreamOutputAccessControlPlist defaultOverride:@"streamOutputAccessControlPlist"];
  if (v4) {
    uint64_t v5 = [(AVCStreamOutput *)self validateAccessWithProcessName:v3 accessControlPlist:v4];
  }
  else {
    uint64_t v5 = VRTraceIsInternalOSInstalled() ^ 1;
  }
  if (!VCDefaults_GetBoolValueForKey((const __CFString *)[NSString stringWithFormat:@"%@_%@", @"allowStreamOutput", v3], v5))goto LABEL_28; {
  if ((AVCStreamOutput *)objc_opt_class() == self)
  }
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_17;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    objc_super v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = v7;
    __int16 v24 = 2080;
    v25 = "-[AVCStreamOutput validateAccess]";
    __int16 v26 = 1024;
    int v27 = 229;
    __int16 v28 = 2112;
    uint64_t v29 = v3;
    uint64_t v9 = "AVCStreamOutput [%s] %s:%d Access granted for process=%@";
    uint64_t v10 = v8;
    uint32_t v11 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(AVCStreamOutput *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_17;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v23 = v12;
    __int16 v24 = 2080;
    v25 = "-[AVCStreamOutput validateAccess]";
    __int16 v26 = 1024;
    int v27 = 229;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v6;
    __int16 v30 = 2048;
    int v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v3;
    uint64_t v9 = "AVCStreamOutput [%s] %s:%d %@(%p) Access granted for process=%@";
    uint64_t v10 = v13;
    uint32_t v11 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_17:
  LOBYTE(v14) = 1;
  return v14;
}

- (void)setupDelegateQueue:(id)internalReceiverQueue
{
  if (!internalReceiverQueue) {
    internalReceiverQueue = self->_internalReceiverQueue;
  }
  self->_delegateQueue = (OS_dispatch_queue *)internalReceiverQueue;
  dispatch_retain((dispatch_object_t)internalReceiverQueue);
}

- (int)createReceiverQueue
{
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
  uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.avconference.StreamOutput.internalReceiverQueue", 0, CustomRootQueue);
  self->_internalReceiverQueue = v4;
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCStreamOutput createReceiverQueue]();
    }
  }
  if (self->_internalReceiverQueue) {
    return 0;
  }
  else {
    return -3;
  }
}

- (int)setupXPCConnection
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_connection = v3;
  if (v3)
  {
    uint64_t v10 = @"conferenceCallID";
    v11[0] = [NSNumber numberWithInteger:self->_streamToken];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v5 = [(AVConferenceXPCClient *)self->_connection sendMessageSync:"streamOutputInitialize" arguments:v4];
    if (!v5
      || (uint64_t v6 = v5, [v5 count] == 1) && objc_msgSend(v6, "objectForKeyedSubscript:", @"ERROR"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCStreamOutput setupXPCConnection]();
        }
      }
      return -6;
    }
    else
    {
      uint64_t v7 = [v6 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
      if (v7)
      {
        int v8 = [(AVCStreamOutput *)self setupRemoteQueueWithSenderQueue:v7];
        if (v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCStreamOutput setupXPCConnection].cold.4();
            }
          }
        }
        else
        {
          [(AVCStreamOutput *)self registerBlocksForNotification];
          [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"streamOutputCachedNotifications" arguments:v4];
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCStreamOutput setupXPCConnection]();
          }
        }
        return -1;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamOutput setupXPCConnection]();
      }
    }
    return -5;
  }
  return v8;
}

- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4
{
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamOutput remoteQueueOperationHandlerWithError:operation:]();
      }
    }
  }
  else if (a4->var0 == 1)
  {
    var0 = a4->var4.var0.var0;
    [(AVCStreamOutput *)self didUpdateAttachments:var0];
  }
  else if (a4->var0 == 3)
  {
    uint64_t v4 = a4->var4.var0.var0;
    [(AVCStreamOutput *)self didReceiveSampleBuffer:v4];
  }
}

- (int)setupRemoteQueueWithSenderQueue:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AVCStreamOutput_setupRemoteQueueWithSenderQueue___block_invoke;
  v7[3] = &unk_1E6DB5690;
  v7[4] = v5;
  VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v7, (uint64_t)self->_internalReceiverQueue, &self->_receiverQueue);
  if (self->_receiverQueue) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCStreamOutput setupRemoteQueueWithSenderQueue:]();
    }
  }
  return -2;
}

uint64_t __51__AVCStreamOutput_setupRemoteQueueWithSenderQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];

  return [v5 remoteQueueOperationHandlerWithError:a2 operation:a3];
}

- (AVCStreamOutputDelegate)delegate
{
  return (AVCStreamOutputDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setSynchronizationTimeOffset:(float)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  internalReceiverQueue = self->_internalReceiverQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  float v5 = a3;
  dispatch_async(internalReceiverQueue, block);
}

void __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke_cold_1();
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
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 136316162;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        uint32_t v11 = "-[AVCStreamOutput setSynchronizationTimeOffset:]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 318;
        __int16 v14 = 2112;
        __int16 v15 = v2;
        __int16 v16 = 2048;
        uint64_t v17 = v7;
        _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Support for the synchronizationTimeOffset property was discontinued", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  float v6 = *(float *)(a1 + 40);
  if (*(float *)(v5 + 52) != v6) {
    *(float *)(v5 + 52) = v6;
  }
}

- (void)didPause:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    float v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCStreamOutput didPause:]";
      __int16 v15 = 1024;
      int v16 = 362;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      __int16 v19 = 1024;
      int v20 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didPause=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isPaused = v3;
  [(AVCStreamOutput *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__AVCStreamOutput_didPause___block_invoke;
    v9[3] = &unk_1E6DB3DF0;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __28__AVCStreamOutput_didPause___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v2 streamOutput:v3 didPause:v4];
}

- (void)didStall:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    float v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCStreamOutput didStall:]";
      __int16 v15 = 1024;
      int v16 = 373;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      __int16 v19 = 1024;
      int v20 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didStall=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isStalled = v3;
  [(AVCStreamOutput *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__AVCStreamOutput_didStall___block_invoke;
    v9[3] = &unk_1E6DB3DF0;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __28__AVCStreamOutput_didStall___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v2 streamOutput:v3 didStall:v4];
}

- (void)didDegrade:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    float v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCStreamOutput didDegrade:]";
      __int16 v15 = 1024;
      int v16 = 384;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      __int16 v19 = 1024;
      int v20 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didDegrade=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isDegraded = v3;
  [(AVCStreamOutput *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__AVCStreamOutput_didDegrade___block_invoke;
    v9[3] = &unk_1E6DB3DF0;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __30__AVCStreamOutput_didDegrade___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v2 streamOutput:v3 didDegrade:v4];
}

- (void)didSuspend:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    float v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVCStreamOutput didSuspend:]";
      __int16 v15 = 1024;
      int v16 = 395;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      __int16 v19 = 1024;
      int v20 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didSuspend=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isSuspended = v3;
  [(AVCStreamOutput *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__AVCStreamOutput_didSuspend___block_invoke;
    v9[3] = &unk_1E6DB3DF0;
    v9[4] = self;
    BOOL v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __30__AVCStreamOutput_didSuspend___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v2 streamOutput:v3 didSuspend:v4];
}

- (void)didInvalidate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVCStreamOutput didInvalidate]";
      __int16 v13 = 1024;
      int v14 = 406;
      __int16 v15 = 1024;
      int v16 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didInvalidate for streamToken=%u.", buf, 0x22u);
    }
  }
  self->_isValid = 0;
  uint64_t v6 = [(VCWeakObjectHolder *)self->_weakSelf strong];
  if (v6)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__AVCStreamOutput_didInvalidate__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v6;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __32__AVCStreamOutput_didInvalidate__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 streamOutputDidBecomeInvalid:v3];
}

- (void)didUpdateAttachments:(__CFDictionary *)a3
{
  attachments = self->_attachments;
  if (attachments) {
    CFRelease(attachments);
  }
  if (a3) {
    uint64_t v6 = (__CFDictionary *)CFRetain(a3);
  }
  else {
    uint64_t v6 = 0;
  }
  self->_attachments = v6;
}

- (void)didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memset(&v30, 170, sizeof(v30));
    CMSampleBufferGetPresentationTimeStamp(&v30, a3);
    CMTime time = v30;
    CMTimeGetSeconds(&time);
    kdebug_trace();
    if (!self->_printSampleBufferDetailsEnabled) {
      goto LABEL_19;
    }
    int64_t streamToken = self->_streamToken;
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    if (CMFormatDescriptionGetMediaType(FormatDescription) == 1835365473)
    {
      char v44 = -86;
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43[2] = v7;
      v43[3] = v7;
      v43[0] = v7;
      v43[1] = v7;
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      VideoUtil_BlockBufferToString(DataBuffer, (char *)v43, 65);
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_19;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
          LODWORD(time.value) = 136316930;
          *(CMTimeValue *)((char *)&time.value + 4) = v9;
          LOWORD(time.flags) = 2080;
          *(void *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
          HIWORD(time.epoch) = 1024;
          int v32 = 82;
          __int16 v33 = 2048;
          uint64_t v34 = self;
          __int16 v35 = 1024;
          int v36 = streamToken;
          __int16 v37 = 2048;
          uint64_t v38 = (opaqueCMSampleBuffer *)DataLength;
          __int16 v39 = 2080;
          long long v40 = v43;
          __int16 v41 = 2112;
          long long v42 = a3;
          __int16 v13 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u length=%zu data=%s sampleBuffer=%@";
          int v14 = v10;
          uint32_t v15 = 74;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&time, v15);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      size_t v22 = CMBlockBufferGetDataLength(DataBuffer);
      LODWORD(time.value) = 136316930;
      *(CMTimeValue *)((char *)&time.value + 4) = v9;
      LOWORD(time.flags) = 2080;
      *(void *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
      HIWORD(time.epoch) = 1024;
      int v32 = 82;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      __int16 v35 = 1024;
      int v36 = streamToken;
      __int16 v37 = 2048;
      uint64_t v38 = (opaqueCMSampleBuffer *)v22;
      __int16 v39 = 2080;
      long long v40 = v43;
      __int16 v41 = 2112;
      long long v42 = a3;
      uint64_t v23 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u length=%zu data=%s sampleBuffer=%@";
      __int16 v24 = v10;
      uint32_t v25 = 74;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_19;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time.value) = 136316418;
          *(CMTimeValue *)((char *)&time.value + 4) = v19;
          LOWORD(time.flags) = 2080;
          *(void *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
          HIWORD(time.epoch) = 1024;
          int v32 = 84;
          __int16 v33 = 2048;
          uint64_t v34 = self;
          __int16 v35 = 1024;
          int v36 = streamToken;
          __int16 v37 = 2112;
          uint64_t v38 = a3;
          __int16 v13 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u sampleBuffer=%@";
          int v14 = v20;
          uint32_t v15 = 54;
          goto LABEL_15;
        }
LABEL_19:
        attachments = self->_attachments;
        if (attachments) {
          CMSetAttachments(a3, attachments, 1u);
        }
        CFRetain(a3);
        delegateQueue = self->_delegateQueue;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __42__AVCStreamOutput_didReceiveSampleBuffer___block_invoke;
        v28[3] = &unk_1E6DB7FF8;
        v28[4] = self;
        v28[5] = a3;
        CMTime v29 = v30;
        dispatch_async(delegateQueue, v28);
        return;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      LODWORD(time.value) = 136316418;
      *(CMTimeValue *)((char *)&time.value + 4) = v19;
      LOWORD(time.flags) = 2080;
      *(void *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
      HIWORD(time.epoch) = 1024;
      int v32 = 84;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      __int16 v35 = 1024;
      int v36 = streamToken;
      __int16 v37 = 2112;
      uint64_t v38 = a3;
      uint64_t v23 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u sampleBuffer=%@";
      __int16 v24 = v20;
      uint32_t v25 = 54;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&time, v25);
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v18 = self->_streamToken;
      LODWORD(time.value) = 136316162;
      *(CMTimeValue *)((char *)&time.value + 4) = v16;
      LOWORD(time.flags) = 2080;
      *(void *)((char *)&time.flags + 2) = "-[AVCStreamOutput didReceiveSampleBuffer:]";
      HIWORD(time.epoch) = 1024;
      int v32 = 424;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      __int16 v35 = 1024;
      int v36 = v18;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u Received NULL sample buffer", (uint8_t *)&time, 0x2Cu);
    }
  }
}

void __42__AVCStreamOutput_didReceiveSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a1 + 40));
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(opaqueCMSampleBuffer **)(a1 + 40);
  uint64_t v6 = (long long *)(a1 + 48);
  *(_OWORD *)&v30.value = *(_OWORD *)(a1 + 48);
  v30.epoch = *(void *)(a1 + 64);
  ++*(_DWORD *)(v5 + 104);
  if (MediaType == 1835365473)
  {
    long long v7 = (_OWORD *)(v5 + 80);
    if (*(unsigned char *)(v5 + 92))
    {
      DataBuffer = CMSampleBufferGetDataBuffer(v4);
      memset(&time, 170, sizeof(time));
      CMTime lhs = v30;
      *(_OWORD *)&rhs.value = *v7;
      rhs.epoch = *(void *)(v5 + 96);
      CMTimeSubtract(&time, &lhs, &rhs);
      float v9 = (double)time.value / (double)time.timescale;
      float v10 = (double)CMBlockBufferGetDataLength(DataBuffer) * 8.0 / v9;
      VCUtil_ExponentialMovingAverage((float *)(v5 + 108), v10, 10.0);
    }
    *long long v7 = *(_OWORD *)&v30.value;
    *(void *)(v5 + 96) = v30.epoch;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  long long v31 = *v6;
  uint64_t v32 = *(void *)(a1 + 64);
  uint64_t v12 = (_OWORD *)(v11 + 56);
  if ((*(unsigned char *)(v11 + 68) & 1) == 0)
  {
    long long v13 = *v6;
    *(void *)(v11 + 72) = *(void *)(a1 + 64);
    _OWORD *v12 = v13;
    goto LABEL_17;
  }
  memset(&lhs, 170, sizeof(lhs));
  *(_OWORD *)&time.value = *v6;
  time.epoch = *(void *)(a1 + 64);
  *(_OWORD *)&rhs.value = *v12;
  rhs.epoch = *(void *)(v11 + 72);
  CMTimeSubtract(&lhs, &time, &rhs);
  if ((double)lhs.value / (double)lhs.timescale > 5.0)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (MediaType == 1835365473)
    {
      if (ErrorLogLevelForModule < 6) {
        goto LABEL_16;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v17 = *(void *)(v11 + 32);
      int64_t v18 = FourccToCStr(1835365473);
      float v19 = *(float *)(v11 + 108);
      LODWORD(time.value) = 136316674;
      int v20 = *(_DWORD *)(v11 + 104);
      *(CMTimeValue *)((char *)&time.value + 4) = v15;
      LOWORD(time.flags) = 2080;
      *(void *)((char *)&time.flags + 2) = "_AVCStreamOutput_DisplayHealthInfo";
      HIWORD(time.epoch) = 1024;
      int v36 = 334;
      __int16 v37 = 1024;
      int v38 = v17;
      __int16 v39 = 2080;
      long long v40 = v18;
      __int16 v41 = 2048;
      double v42 = (float)(v19 / 1000.0);
      __int16 v43 = 1024;
      int v44 = v20;
      uint64_t v21 = "AVCStreamOutput [%s] %s:%d @=@ Health: AVCStreamOutput StreamToken=%u mediaType=%s estimatedDataRate=%0.2fkb"
            "ps sampleBufferCount=%d";
      size_t v22 = v16;
      uint32_t v23 = 60;
    }
    else
    {
      if (ErrorLogLevelForModule < 6) {
        goto LABEL_16;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint32_t v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v26 = *(void *)(v11 + 32);
      int v27 = FourccToCStr(MediaType);
      int v28 = *(_DWORD *)(v11 + 104);
      LODWORD(time.value) = 136316418;
      *(CMTimeValue *)((char *)&time.value + 4) = v24;
      LOWORD(time.flags) = 2080;
      *(void *)((char *)&time.flags + 2) = "_AVCStreamOutput_DisplayHealthInfo";
      HIWORD(time.epoch) = 1024;
      int v36 = 336;
      __int16 v37 = 1024;
      int v38 = v26;
      __int16 v39 = 2080;
      long long v40 = v27;
      __int16 v41 = 1024;
      LODWORD(v42) = v28;
      uint64_t v21 = "AVCStreamOutput [%s] %s:%d @=@ Health: AVCStreamOutput StreamToken=%u mediaType=%s sampleBufferCount=%d";
      size_t v22 = v25;
      uint32_t v23 = 50;
    }
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&time, v23);
LABEL_16:
    _OWORD *v12 = v31;
    *(void *)(v11 + 72) = v32;
    *(_DWORD *)(v11 + 104) = 0;
  }
LABEL_17:
  *(_OWORD *)&time.value = *v6;
  time.epoch = *(void *)(a1 + 64);
  CMTimeGetSeconds(&time);
  kdebug_trace();
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutput:didReceiveSampleBuffer:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  CMTime v29 = *(const void **)(a1 + 40);
  if (v29) {
    CFRelease(v29);
  }
}

- (int)processID
{
  return self->_processID;
}

- (void)serviceHandlerDidDieWithArguments:(id)a3 error:(id)a4
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCStreamOutput serviceHandlerDidDieWithArguments:error:]();
    }
  }
  delegateQueue = self->_delegateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__AVCStreamOutput_serviceHandlerDidDieWithArguments_error___block_invoke;
  v6[3] = &unk_1E6DB3DC8;
  v6[4] = self;
  dispatch_async(delegateQueue, v6);
}

uint64_t __59__AVCStreamOutput_serviceHandlerDidDieWithArguments_error___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 streamOutputServerDidDie:v3];
}

- (void)serviceHandlerDidPauseWithArguments:(id)a3 error:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"conferenceVideoPause", a4), "BOOLValue");

  [(AVCStreamOutput *)self didPause:v5];
}

- (void)serviceHandlerDidStallWithArguments:(id)a3 error:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"conferenceIsRemoteMediaStalled", a4), "BOOLValue");

  [(AVCStreamOutput *)self didStall:v5];
}

- (void)serviceHandlerDidDegradeWithArguments:(id)a3 error:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"conferenceIsVideoDegraded", a4), "BOOLValue");

  [(AVCStreamOutput *)self didDegrade:v5];
}

- (void)serviceHandlerDidSuspendWithArguments:(id)a3 error:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"conferenceIsVideoSuspended", a4), "BOOLValue");

  [(AVCStreamOutput *)self didSuspend:v5];
}

- (void)serviceHandlerDidReceiveFrameWithArguments:(id)a3 error:(id)a4
{
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamOutput serviceHandlerDidReceiveFrameWithArguments:error:]();
      }
    }
  }
  else
  {
    CMSampleBufferRef v5 = VCStreamInputUtil_DecodeSampleBuffer((void *)[a3 objectForKeyedSubscript:@"USERXPCARGUMENTS"]);
    if (v5)
    {
      CMSampleBufferRef v6 = v5;
      [(AVCStreamOutput *)self didReceiveSampleBuffer:v5];
      CFRelease(v6);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCStreamOutput serviceHandlerDidReceiveFrameWithArguments:error:]();
      }
    }
  }
}

- (void)registerBlocksForNotification
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"conferenceDidServerDie" block:v9 queue:self->_internalReceiverQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_72;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"streamOutputDidRemoteVideoPause" block:v8 queue:self->_internalReceiverQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_74;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"streamOutputDidRemoteMediaStall" block:v7 queue:self->_internalReceiverQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_76;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"streamOutputDidVideoDegrade" block:v6 queue:self->_internalReceiverQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_78;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"streamOutputDidVideoSuspend" block:v5 queue:self->_internalReceiverQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_80;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"streamOutputDidReleaseRemoteVideoQueue" block:v4 queue:self->_internalReceiverQueue];
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    CMSampleBufferRef v6 = (void *)[*(id *)(a1 + 32) strong];
    if (v6)
    {
      [v6 serviceHandlerDidDieWithArguments:a2 error:a3];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_cold_1();
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_72(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    CMSampleBufferRef v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      [v5 serviceHandlerDidPauseWithArguments:a2 error:0];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 522;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_74(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    CMSampleBufferRef v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      [v5 serviceHandlerDidStallWithArguments:a2 error:0];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 534;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    CMSampleBufferRef v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      [v5 serviceHandlerDidDegradeWithArguments:a2 error:0];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 546;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_78(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    CMSampleBufferRef v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      [v5 serviceHandlerDidSuspendWithArguments:a2 error:0];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 558;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_80(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    CMSampleBufferRef v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      [v5 serviceHandlerDidReleaseOutputQueueWithArguments:a2 error:0];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 570;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"conferenceDidServerDie"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"streamOutputDidReleaseRemoteVideoQueue"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"streamOutputDidVideoSuspend"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"streamOutputDidVideoDegrade"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"streamOutputDidRemoteMediaStall"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"streamOutputDidRemoteVideoPause"];
}

- (void)terminateConnection
{
  if (self->_connection)
  {
    [(AVCStreamOutput *)self deregisterBlocksForNotifications];
    dispatch_sync((dispatch_queue_t)self->_internalReceiverQueue, &__block_literal_global_58);
    [(AVConferenceXPCClient *)self->_connection sendMessageAsync:"streamOutputTerminate"];

    self->_connection = 0;
  }
}

+ (id)errorWithStreamOutputError:(int64_t)a3
{
  if ((unint64_t)a3 < 0xFFFFFFFFFFFFFFF9)
  {
    uint64_t v6 = 0;
    uint64_t v5 = 32000;
  }
  else
  {
    int64_t v4 = 8 * a3 + 56;
    uint64_t v5 = *(void *)((char *)&unk_1E25A0478 + v4);
    uint64_t v6 = *(uint64_t *)((char *)off_1E6DB8018 + v4);
  }
  return (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:v5 detailCode:a3 description:v6];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (float)synchronizationTimeOffset
{
  return self->_synchronizationTimeOffset;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)internalReceiverQueue
{
  return self->_internalReceiverQueue;
}

- (void)setInternalReceiverQueue:(id)a3
{
}

- (void)initWithStreamToken:delegate:queue:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[AVCStreamOutput initWithStreamToken:delegate:queue:error:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to allocate the VCStreamOutput for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[AVCStreamOutput initWithStreamToken:delegate:queue:error:]" >> 16, 145);
}

- (void)initWithStreamToken:delegate:queue:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to setup the XPC connection", v2, v3, v4, v5, v6);
}

- (void)initWithStreamToken:delegate:queue:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to allocate receiver queue", v2, v3, v4, v5, v6);
}

- (void)validateAccessWithProcessName:accessControlPlist:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to retrieve the allow process name list", v2, v3, v4, v5, v6);
}

- (void)validateAccess
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to get the current process name", v2, v3, v4, v5, v6);
}

- (void)createReceiverQueue
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Error creating internal Queue", v2, v3, v4, v5, v6);
}

- (void)setupXPCConnection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to setup the remote queue", v2, v3, v4, v5, v6);
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Error received from the remote Queue %d", v2, v3, v4, 288);
}

- (void)setupRemoteQueueWithSenderQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Error making the receiver queue", v2, v3, v4, v5, v6);
}

void __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Support for the synchronizationTimeOffset property was discontinued", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerDidDieWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: serverd died, notifying client", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerDidReceiveFrameWithArguments:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d Could not decode SampleBuffer", v2, v3, v4, v5, v6);
}

- (void)serviceHandlerDidReceiveFrameWithArguments:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d XPC connection error=%@");
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: server died", v2, v3, v4, v5, v6);
}

@end