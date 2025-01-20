@interface VCCaptionsStream
- (BOOL)captionsEnabled;
- (BOOL)captionsSupported;
- (VCCaptionsStream)init;
- (VCCaptionsStream)initWithTransportSessionID:(unsigned int)a3 idsParticipantID:(unint64_t)a4 ssrc:(unsigned int)a5 streamToken:(int64_t)a6;
- (id)captionsDelegate;
- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)videoReceiverDelegateFunctions;
- (void)dealloc;
- (void)didReceiveCaptions:(id)a3;
- (void)enableCaptions:(BOOL)a3;
- (void)onStartWithCompletionHandler:(id)a3;
- (void)onStopWithCompletionHandler:(id)a3;
- (void)registerCaptionsEventDelegate:(id)a3;
@end

@implementation VCCaptionsStream

- (VCCaptionsStream)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCCaptionsStream;
  v2 = [(VCVideoStream *)&v4 init];
  if (v2) {
    v2->super._cachedRemoteScreenAttributes = (VideoAttributes *)[[VCCaptionsReceiver alloc] initWithDelegate:v2];
  }
  return v2;
}

- (VCCaptionsStream)initWithTransportSessionID:(unsigned int)a3 idsParticipantID:(unint64_t)a4 ssrc:(unsigned int)a5 streamToken:(int64_t)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCCaptionsStream;
  v6 = [(VCVideoStream *)&v8 initWithTransportSessionID:*(void *)&a3 idsParticipantID:a4 ssrc:*(void *)&a5 streamToken:a6];
  if (v6) {
    v6->super._cachedRemoteScreenAttributes = (VideoAttributes *)[[VCCaptionsReceiver alloc] initWithDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->_captionsReceiver, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsStream;
  [(VCVideoStream *)&v3 dealloc];
}

- (void)onStartWithCompletionHandler:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCCaptionsStream;
  [(VCVideoStream *)&v4 onStartWithCompletionHandler:a3];
  objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "registerCaptionsSource:streamToken:", self, -[VCMediaStream streamToken](self, "streamToken"));
}

- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)videoReceiverDelegateFunctions
{
  v2 = _VCCaptionsStream_DidReceiveSampleBuffer;
  objc_super v3 = 0;
  result.didReceiveRemoteFrame = v3;
  result.didReceiveSampleBuffer = v2;
  return result;
}

- (void)onStopWithCompletionHandler:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", -[VCMediaStream streamToken](self, "streamToken"));
  v5.receiver = self;
  v5.super_class = (Class)VCCaptionsStream;
  [(VCVideoStream *)&v5 onStopWithCompletionHandler:a3];
}

- (void)didReceiveCaptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCCaptionsStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        v18 = "-[VCCaptionsStream didReceiveCaptions:]";
        __int16 v19 = 1024;
        int v20 = 81;
        objc_super v8 = " [%s] %s:%d Received remote captions transcription!";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v5 = (__CFString *)[(VCCaptionsStream *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        v18 = "-[VCCaptionsStream didReceiveCaptions:]";
        __int16 v19 = 1024;
        int v20 = 81;
        __int16 v21 = 2112;
        v22 = v5;
        __int16 v23 = 2048;
        v24 = self;
        objc_super v8 = " [%s] %s:%d %@(%p) Received remote captions transcription!";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__VCCaptionsStream_didReceiveCaptions___block_invoke;
  v14[3] = &unk_1E6DB3E40;
  v14[4] = self;
  v14[5] = a3;
  dispatch_async(global_queue, v14);
}

uint64_t __39__VCCaptionsStream_didReceiveCaptions___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[149];
  uint64_t v4 = [v2 streamToken];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 streamToken:v4 didUpdateCaptions:v5];
}

- (void)registerCaptionsEventDelegate:(id)a3
{
  if ([a3 conformsToProtocol:&unk_1F3DDCC90])
  {
    objc_storeWeak((id *)&self->_captionsReceiver, a3);
  }
}

- (id)captionsDelegate
{
  return objc_loadWeak((id *)&self->_captionsReceiver);
}

- (BOOL)captionsEnabled
{
  return (BOOL)self->_captionsDelegate;
}

- (BOOL)captionsSupported
{
  return 1;
}

- (void)enableCaptions:(BOOL)a3
{
  LOBYTE(self->_captionsDelegate) = a3;
}

@end