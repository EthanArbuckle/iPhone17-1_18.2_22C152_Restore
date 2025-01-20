@interface AVCVideoDataOutput
- ($47CAAF96BE7E845C10CADA1F045B7D66)videoAttributes;
- (AVCVideoDataOutput)initWithStreamToken:(int64_t)a3 delegate:(id)a4 queue:(id)a5 error:(id *)a6;
- (AVCVideoDataOutputDelegate)delegate;
- (BOOL)isMediaStalled;
- (BOOL)isValid;
- (BOOL)isVideoDegraded;
- (BOOL)isVideoPaused;
- (BOOL)isVideoSuspended;
- (BOOL)parseVideoAttributes:(opaqueCMSampleBuffer *)a3;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)internalReceiverQueue;
- (int64_t)streamToken;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setInternalReceiverQueue:(id)a3;
- (void)setIsMediaStalled:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setIsVideoDegraded:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setIsVideoSuspended:(BOOL)a3;
- (void)setVideoAttributes:(id)a3;
- (void)streamOutput:(id)a3 didDegrade:(BOOL)a4;
- (void)streamOutput:(id)a3 didPause:(BOOL)a4;
- (void)streamOutput:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)streamOutput:(id)a3 didStall:(BOOL)a4;
- (void)streamOutput:(id)a3 didSuspend:(BOOL)a4;
- (void)streamOutputDidBecomeInvalid:(id)a3;
- (void)streamOutputServerDidDie:(id)a3;
@end

@implementation AVCVideoDataOutput

- (AVCVideoDataOutput)initWithStreamToken:(int64_t)a3 delegate:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
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
      *(_DWORD *)buf = 136316674;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      v22 = "-[AVCVideoDataOutput initWithStreamToken:delegate:queue:error:]";
      __int16 v23 = 1024;
      int v24 = 76;
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 2112;
      id v28 = a4;
      __int16 v29 = 2112;
      id v30 = a5;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld, delegate=%@, queue=%@, error=%@", buf, 0x44u);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)AVCVideoDataOutput;
  v14 = [(AVCVideoDataOutput *)&v18 init];
  if (v14)
  {
    VRTraceReset();
    v15 = [[AVCStreamOutput alloc] initWithStreamToken:a3 delegate:v14 queue:a5 error:a6];
    v14->_streamOutput = v15;
    if (v15)
    {
      objc_storeWeak(&v14->_delegate, a4);
      v14->_streamToken = a3;
      v14->_isValid = 1;
      return v14;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCVideoDataOutput initWithStreamToken:delegate:queue:error:]();
      }
    }
    uint64_t v16 = -5;
  }
  else
  {
    uint64_t v16 = -4;
  }

  if (!a6 || *a6) {
    return 0;
  }
  v14 = 0;
  *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"AVCVideoDataOutput" code:v16 userInfo:0];
  return v14;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  internalReceiverQueue = self->_internalReceiverQueue;
  if (internalReceiverQueue)
  {
    dispatch_release(internalReceiverQueue);
    self->_internalReceiverQueue = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCVideoDataOutput;
  [(AVCVideoDataOutput *)&v5 dealloc];
}

- (BOOL)parseVideoAttributes:(opaqueCMSampleBuffer *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFNumberRef v5 = (const __CFNumber *)CMGetAttachment(a3, @"cameraStatusBits", 0);
  CFDictionaryRef v6 = (const __CFDictionary *)CMGetAttachment(a3, @"contentsRect", 0);
  CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(a3, @"aspectRatio", 0);
  CFDictionaryRef v8 = v7;
  if (!self->_videoAttributes.videoAttributes)
  {
    if (v5) {
      BOOL v11 = v6 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11 && v7 != 0)
    {
      v13 = objc_alloc_init(VideoAttributes);
      self->_videoAttributes.videoAttributes = v13;
      if (v13)
      {
LABEL_19:
        LOBYTE(v15.origin.x) = 0;
        CFNumberGetValue(v5, kCFNumberSInt8Type, &v15);
        [(VideoAttributes *)self->_videoAttributes.videoAttributes updateCameraStatusBits:LOBYTE(v15.origin.x)];
        if (!v6) {
          goto LABEL_5;
        }
        goto LABEL_4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        -[AVCVideoDataOutput parseVideoAttributes:]();
      }
    }
    LOBYTE(v10) = 0;
    return v10;
  }
  if (v5) {
    goto LABEL_19;
  }
  if (v6)
  {
LABEL_4:
    v9.width = NAN;
    v9.height = NAN;
    v15.origin = (CGPoint)v9;
    v15.size = v9;
    CGRectMakeWithDictionaryRepresentation(v6, &v15);
    -[VideoAttributes setContentsRect:](self->_videoAttributes.videoAttributes, "setContentsRect:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);
  }
LABEL_5:
  if (v8)
  {
    v15.origin.x = NAN;
    v15.origin.y = NAN;
    CGSizeMakeWithDictionaryRepresentation(v8, (CGSize *)&v15);
    [(VideoAttributes *)self->_videoAttributes.videoAttributes setRatio:*(_OWORD *)&v15.origin];
  }
  [(AVCVideoDataOutputDelegate *)[(AVCVideoDataOutput *)self delegate] videoDataOutput:self didReceiveFrame:a3 videoAttributes:self->_videoAttributes.videoAttributes];
  LOBYTE(v10) = 1;
  return v10;
}

- (AVCVideoDataOutputDelegate)delegate
{
  return (AVCVideoDataOutputDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)streamOutput:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  if ([(AVCVideoDataOutput *)self parseVideoAttributes:a4])
  {
    CFDictionaryRef v6 = [(AVCVideoDataOutput *)self delegate];
    videoAttributes = self->_videoAttributes.videoAttributes;
    [(AVCVideoDataOutputDelegate *)v6 videoDataOutput:self didReceiveFrame:a4 videoAttributes:videoAttributes];
  }
}

- (void)streamOutputServerDidDie:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCVideoDataOutput streamOutputServerDidDie:]();
    }
  }
  [(AVCVideoDataOutputDelegate *)[(AVCVideoDataOutput *)self delegate] videoDataOutputServerDidDie:self];
}

- (void)streamOutputDidBecomeInvalid:(id)a3
{
  self->_isValid = 0;
  v4 = [(AVCVideoDataOutput *)self delegate];

  [(AVCVideoDataOutputDelegate *)v4 videoDataOutputDidBecomeInvalid:self];
}

- (void)streamOutput:(id)a3 didPause:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    CFDictionaryRef v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[AVCVideoDataOutput streamOutput:didPause:]";
      __int16 v13 = 1024;
      int v14 = 184;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      __int16 v17 = 1024;
      int v18 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCVideoDataOutput callback: didPause=%d for streamToken=%u", (uint8_t *)&v9, 0x28u);
    }
  }
  self->_isVideoPaused = v4;
  [(AVCVideoDataOutput *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoDataOutputDelegate *)[(AVCVideoDataOutput *)self delegate] videoDataOutput:self videoDidPause:v4];
  }
}

- (void)streamOutput:(id)a3 didStall:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    CFDictionaryRef v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[AVCVideoDataOutput streamOutput:didStall:]";
      __int16 v13 = 1024;
      int v14 = 193;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      __int16 v17 = 1024;
      int v18 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCVideoDataOutput callback: mediaDidStall=%d for streamToken=%u", (uint8_t *)&v9, 0x28u);
    }
  }
  self->_isMediaStalled = v4;
  [(AVCVideoDataOutput *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoDataOutputDelegate *)[(AVCVideoDataOutput *)self delegate] videoDataOutput:self mediaDidStall:v4];
  }
}

- (void)streamOutput:(id)a3 didDegrade:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    CFDictionaryRef v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[AVCVideoDataOutput streamOutput:didDegrade:]";
      __int16 v13 = 1024;
      int v14 = 202;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      __int16 v17 = 1024;
      int v18 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCVideoDataOutput callback: videoDidDegrade=%d for streamToken=%u", (uint8_t *)&v9, 0x28u);
    }
  }
  self->_isVideoDegraded = v4;
  [(AVCVideoDataOutput *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(AVCVideoDataOutputDelegate *)[(AVCVideoDataOutput *)self delegate] videoDataOutput:self videoDidDegrade:v4];
  }
}

- (void)streamOutput:(id)a3 didSuspend:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isVideoSuspended = a4;
  [(AVCVideoDataOutput *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(AVCVideoDataOutput *)self delegate];
    [(AVCVideoDataOutputDelegate *)v6 videoDataOutput:self videoDidSuspend:v4];
  }
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

- ($47CAAF96BE7E845C10CADA1F045B7D66)videoAttributes
{
  return ($47CAAF96BE7E845C10CADA1F045B7D66)self->_videoAttributes.videoAttributes;
}

- (void)setVideoAttributes:(id)a3
{
  self->_videoAttributes.videoAttributes = (VideoAttributes *)a3.var0;
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
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream output", v2, v3, v4, v5, v6);
}

- (void)parseVideoAttributes:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate video attributes", v2, v3, v4, v5, v6);
}

- (void)streamOutputServerDidDie:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCVideoDataOutput: serverd died, notifying client", v2, v3, v4, v5, v6);
}

@end