@interface VCMomentsCollector
- (VCMomentsCollector)initWithStreamToken:(int64_t)a3;
- (void)cleanUpActiveRequests;
- (void)dealloc;
- (void)stream:(id)a3 addAudioSampleBuffer:(opaqueVCAudioBufferList *)a4 timestamp:(unsigned int)a5;
- (void)stream:(id)a3 addVideoSampleBuffer:(opaqueCMSampleBuffer *)a4 cameraStatusBits:(unsigned __int8)a5 timestamp:(unsigned int)a6;
@end

@implementation VCMomentsCollector

- (VCMomentsCollector)initWithStreamToken:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCMomentsCollector;
  v4 = [(VCMomentsCollector *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_streamToken = a3;
    v6 = [[VCMediaRecorder alloc] initWithStreamToken:a3 delegate:0 reportingAgent:0];
    v5->_mediaRecorder = v6;
    [(VCMediaRecorder *)v6 setCapabilities:0];
    [+[VCMediaRecorderManager sharedInstance] registerMediaRecorder:v5->_mediaRecorder withStreamToken:a3];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[VCMomentsCollector dealloc]";
      __int16 v11 = 1024;
      int v12 = 28;
      __int16 v13 = 1024;
      int v14 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMomentsCollector: dealloc for streamToken=%u", buf, 0x22u);
    }
  }
  [(VCMediaRecorder *)self->_mediaRecorder invalidate];

  v6.receiver = self;
  v6.super_class = (Class)VCMomentsCollector;
  [(VCMomentsCollector *)&v6 dealloc];
}

- (void)stream:(id)a3 addVideoSampleBuffer:(opaqueCMSampleBuffer *)a4 cameraStatusBits:(unsigned __int8)a5 timestamp:(unsigned int)a6
{
}

- (void)stream:(id)a3 addAudioSampleBuffer:(opaqueVCAudioBufferList *)a4 timestamp:(unsigned int)a5
{
}

- (void)cleanUpActiveRequests
{
  VCMediaRecorder_ClearHistoryBuffer((uint64_t)self->_mediaRecorder);
  mediaRecorder = self->_mediaRecorder;

  VCMediaRecorder_StopProcessingAllRequests((uint64_t)mediaRecorder);
}

@end