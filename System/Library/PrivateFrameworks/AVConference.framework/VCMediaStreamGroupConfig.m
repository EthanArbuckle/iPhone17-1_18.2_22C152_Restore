@interface VCMediaStreamGroupConfig
- (BOOL)addMediaStreamInfo:(id)a3;
- (BOOL)hasRepairedStreams;
- (NSArray)mediaStreamInfoArray;
- (NSArray)mediaStreams;
- (NSDictionary)groupEntries;
- (NSDictionary)streamIDToMediaStreamMap;
- (NSString)participantUUID;
- (NSString)sessionUUID;
- (OS_dispatch_queue)delegateQueue;
- (VCMediaCaptureController)captureController;
- (VCMediaStreamGroupConfig)init;
- (VCMediaStreamGroupDelegate)delegate;
- (VCNetworkFeedbackController)networkFeedbackController;
- (int)captureSource;
- (int64_t)streamToken;
- (tagVCJBTargetEstimatorSynchronizer)jbTargetEstimatorSynchronizer;
- (unint64_t)idsParticipantID;
- (unsigned)mediaSubtype;
- (unsigned)mediaType;
- (unsigned)rtpTimestampRate;
- (unsigned)streamGroupID;
- (unsigned)syncGroupID;
- (void)dealloc;
- (void)lock;
- (void)setCaptureController:(id)a3;
- (void)setCaptureSource:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setIdsParticipantID:(unint64_t)a3;
- (void)setJbTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3;
- (void)setMediaSubtype:(unsigned int)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)setNetworkFeedbackController:(id)a3;
- (void)setParticipantUUID:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setStreamGroupID:(unsigned int)a3;
- (void)setStreamToken:(int64_t)a3;
- (void)setSyncGroupID:(unsigned int)a3;
- (void)setupStreams;
- (void)unlock;
@end

@implementation VCMediaStreamGroupConfig

- (VCMediaStreamGroupConfig)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamGroupConfig;
  v2 = [(VCMediaStreamGroupConfig *)&v4 init];
  if (v2)
  {
    v2->_mediaStreamInfoArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_groupEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pthread_mutex_init(&v2->_mutex, 0);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
  {
    CFRelease(jbTargetEstimatorSynchronizer);
    self->_jbTargetEstimatorSynchronizer = 0;
  }
  pthread_mutex_destroy(&self->_mutex);
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamGroupConfig;
  [(VCMediaStreamGroupConfig *)&v5 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)setDelegateQueue:(id)a3
{
  delegateQueue = self->_delegateQueue;
  if (delegateQueue != a3)
  {
    if (delegateQueue)
    {
      CFRelease(delegateQueue);
      self->_delegateQueue = 0;
    }
    if (a3)
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_delegateQueue = (OS_dispatch_queue *)a3;
    }
  }
}

- (BOOL)addMediaStreamInfo:(id)a3
{
  if (a3)
  {
    [(VCMediaStreamGroupConfig *)self lock];
    self->_shouldSetupStreams = 1;
    [(NSMutableArray *)self->_mediaStreamInfoArray addObject:a3];
    [(VCMediaStreamGroupConfig *)self unlock];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStreamGroupConfig addMediaStreamInfo:](v5, v6);
    }
  }
  return a3 != 0;
}

- (NSArray)mediaStreams
{
  [(VCMediaStreamGroupConfig *)self lock];
  if (self->_shouldSetupStreams) {
    [(VCMediaStreamGroupConfig *)self setupStreams];
  }
  v3 = self->_mediaStreams;
  [(VCMediaStreamGroupConfig *)self unlock];
  return v3;
}

- (NSDictionary)streamIDToMediaStreamMap
{
  [(VCMediaStreamGroupConfig *)self lock];
  if (self->_shouldSetupStreams) {
    [(VCMediaStreamGroupConfig *)self setupStreams];
  }
  v3 = self->_streamIDToMediaStreamMap;
  [(VCMediaStreamGroupConfig *)self unlock];
  return v3;
}

- (NSDictionary)groupEntries
{
  [(VCMediaStreamGroupConfig *)self lock];
  if (self->_shouldSetupStreams) {
    [(VCMediaStreamGroupConfig *)self setupStreams];
  }
  v3 = self->_groupEntries;
  [(VCMediaStreamGroupConfig *)self unlock];
  return &v3->super;
}

- (BOOL)hasRepairedStreams
{
  [(VCMediaStreamGroupConfig *)self lock];
  if (self->_shouldSetupStreams) {
    [(VCMediaStreamGroupConfig *)self setupStreams];
  }
  BOOL hasRepairedStreams = self->_hasRepairedStreams;
  [(VCMediaStreamGroupConfig *)self unlock];
  return hasRepairedStreams;
}

- (unsigned)rtpTimestampRate
{
  [(VCMediaStreamGroupConfig *)self lock];
  if (self->_shouldSetupStreams) {
    [(VCMediaStreamGroupConfig *)self setupStreams];
  }
  unsigned int rtpTimestampRate = self->_rtpTimestampRate;
  [(VCMediaStreamGroupConfig *)self unlock];
  return rtpTimestampRate;
}

- (void)setupStreams
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[VCMediaStreamGroupConfig setupStreams]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the stream map for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaStreamGroupConfig setupStreams]" >> 16, 199);
}

- (tagVCJBTargetEstimatorSynchronizer)jbTargetEstimatorSynchronizer
{
  return self->_jbTargetEstimatorSynchronizer;
}

- (void)setJbTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3
{
  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer) {
    CFRelease(jbTargetEstimatorSynchronizer);
  }
  self->_jbTargetEstimatorSynchronizer = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (unsigned)streamGroupID
{
  return self->_streamGroupID;
}

- (void)setStreamGroupID:(unsigned int)a3
{
  self->_streamGroupID = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaSubtype
{
  return self->_mediaSubtype;
}

- (void)setMediaSubtype:(unsigned int)a3
{
  self->_mediaSubtype = a3;
}

- (unsigned)syncGroupID
{
  return self->_syncGroupID;
}

- (void)setSyncGroupID:(unsigned int)a3
{
  self->_syncGroupID = a3;
}

- (VCMediaStreamGroupDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (VCMediaCaptureController)captureController
{
  return self->_captureController;
}

- (void)setCaptureController:(id)a3
{
}

- (NSArray)mediaStreamInfoArray
{
  return &self->_mediaStreamInfoArray->super;
}

- (NSString)participantUUID
{
  return self->_participantUUID;
}

- (void)setParticipantUUID:(id)a3
{
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (void)setIdsParticipantID:(unint64_t)a3
{
  self->_idsParticipantID = a3;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (void)addMediaStreamInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCMediaStreamGroupConfig addMediaStreamInfo:]";
  __int16 v6 = 1024;
  int v7 = 124;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d media stream is nil", (uint8_t *)&v2, 0x1Cu);
}

@end