@interface VCSessionUplinkVideoStreamController
- (BOOL)dynamicVideoPriorityEnabled;
- (BOOL)filterPendingTemporalStreams;
- (BOOL)pauseStreams;
- (BOOL)resumeStreams;
- (BOOL)setStreamsUseRTCPWithStreamInfos:(id)a3;
- (BOOL)shouldGenerateIDRWithStreamSchedule:(id)a3;
- (BOOL)shouldSkipIDRScheduler;
- (NSArray)streamIDsCell;
- (NSArray)streamIDsWifi;
- (NSDictionary)activeVideoStreams;
- (NSDictionary)pendingVideoStreams;
- (VCSessionUplinkVideoStreamController)initWithVideoStreams:(id)a3 streamInfos:(id)a4 reportingAgent:(opaqueRTCReporting *)a5 delegate:(id)a6;
- (float)currentFrameTime;
- (id)anchorStreamIDWithCappedVideoStreamIDs:(id)a3;
- (id)delegate;
- (id)getMultiwayConfigForStreamID:(id)a3;
- (id)newVideoStreamKeyFrameScheduleWithStreamIDs:(id)a3;
- (id)schedulerStreamWithVideoStream:(id)a3;
- (id)videoStreamPendingKeyFrameGenerationWithStreamID:(id)a3 shouldRemoveFromPendingArray:(BOOL *)a4;
- (unsigned)captureFrameRate;
- (void)dealloc;
- (void)generateKeyFrameWithStreamID:(id)a3 firType:(int)a4;
- (void)handleStreamsPendingKeyFrameGeneration;
- (void)handleStreamsResetIDR;
- (void)initilizeStreamInfoMapWithStreamInfos:(id)a3;
- (void)lock;
- (void)printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:(float)a3;
- (void)restart;
- (void)resumeStreams;
- (void)selectVideoStreamForVideoPriority;
- (void)setCachedActiveVideoStreams:(id)a3;
- (void)setCaptureFrameRate:(unsigned int)a3;
- (void)setCurrentFrameTime:(float)a3;
- (void)setDynamicVideoPriorityEnabled:(BOOL)a3;
- (void)setIsLocalOnCellular:(BOOL)a3 cappedVideoStreamIDs:(id)a4;
- (void)setPendingVideoStreams:(id)a3;
- (void)setPendingVideoStreamsInternal:(id)a3;
- (void)setShouldSkipIDRScheduler:(BOOL)a3;
- (void)setStreamIDsCell:(id)a3;
- (void)setStreamIDsWifi:(id)a3;
- (void)unlock;
@end

@implementation VCSessionUplinkVideoStreamController

- (VCSessionUplinkVideoStreamController)initWithVideoStreams:(id)a3 streamInfos:(id)a4 reportingAgent:(opaqueRTCReporting *)a5 delegate:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCSessionUplinkVideoStreamController;
  v10 = [(VCSessionUplinkVideoStreamController *)&v19 init];
  v11 = v10;
  if (!v10)
  {
LABEL_16:

    return 0;
  }
  objc_storeWeak(&v10->_delegate, a6);
  v11->_videoStreams = (NSMutableDictionary *)[a3 mutableCopy];
  uint64_t v12 = [a3 count];
  v11->_streamInfoMap = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  [(VCSessionUplinkVideoStreamController *)v11 initilizeStreamInfoMapWithStreamInfos:a4];
  v11->_streamScheduleWifi = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  v11->_streamScheduleCell = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  v11->_activeVideoStreams = v13;
  v11->_cachedActiveVideoStreams = (NSDictionary *)[(NSMutableDictionary *)v13 copy];
  v11->_streamToPause = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v12];
  v11->_streamToResume = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v12];
  v11->_streamsPendingKeyFrameGeneration = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  v30.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v30.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v30);
  pthread_mutexattr_settype(&v30, 2);
  pthread_mutex_init(&v11->_mutex, &v30);
  pthread_mutexattr_destroy(&v30);
  v11->_startTime = 0.0;
  if (a5) {
    v14 = (opaqueRTCReporting *)CFRetain(a5);
  }
  else {
    v14 = 0;
  }
  v11->_reportingAgent = v14;
  if (![(VCSessionUplinkVideoStreamController *)v11 setStreamsUseRTCPWithStreamInfos:a4])
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionUplinkVideoStreamController initWithVideoStreams:streamInfos:reportingAgent:delegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v15 = (__CFString *)[(VCSessionUplinkVideoStreamController *)v11 performSelector:sel_logPrefix];
      }
      else {
        v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v21 = v16;
          __int16 v22 = 2080;
          v23 = "-[VCSessionUplinkVideoStreamController initWithVideoStreams:streamInfos:reportingAgent:delegate:]";
          __int16 v24 = 1024;
          int v25 = 57;
          __int16 v26 = 2112;
          v27 = v15;
          __int16 v28 = 2048;
          v29 = v11;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initialize VCSessionUplinkVideoStreamController. Invalid RTCP config.", buf, 0x30u);
        }
      }
    }
    goto LABEL_16;
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  objc_storeWeak(&self->_delegate, 0);
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  pthread_mutex_destroy(&self->_mutex);
  v4.receiver = self;
  v4.super_class = (Class)VCSessionUplinkVideoStreamController;
  [(VCSessionUplinkVideoStreamController *)&v4 dealloc];
}

- (NSDictionary)activeVideoStreams
{
  [(VCSessionUplinkVideoStreamController *)self lock];
  v3 = self->_cachedActiveVideoStreams;
  [(VCSessionUplinkVideoStreamController *)self unlock];
  return v3;
}

- (void)setCachedActiveVideoStreams:(id)a3
{
  self->_cachedActiveVideoStreams = (NSDictionary *)[a3 copy];
}

- (void)setStreamIDsCell:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self lock];
  if (![a3 count])
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_51;
      }
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E4F47A50];
      v51 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[VCSessionUplinkVideoStreamController setStreamIDsCell:]();
        }
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v59 = v49;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      __int16 v62 = 1024;
      int v63 = 105;
      v38 = " [%s] %s:%d streamIDsCell is nil";
      v44 = v50;
      uint32_t v45 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v48 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        v48 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_51;
      }
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E4F47A50];
      v54 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v59 = v52;
          __int16 v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
          __int16 v62 = 1024;
          int v63 = 105;
          __int16 v64 = 2112;
          v65 = v48;
          __int16 v66 = 2048;
          *(void *)v67 = self;
          _os_log_debug_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) streamIDsCell is nil", buf, 0x30u);
        }
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v59 = v52;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      __int16 v62 = 1024;
      int v63 = 105;
      __int16 v64 = 2112;
      v65 = v48;
      __int16 v66 = 2048;
      *(void *)v67 = self;
      v38 = " [%s] %s:%d %@(%p) streamIDsCell is nil";
      v44 = v53;
      uint32_t v45 = 48;
    }
    goto LABEL_50;
  }
  streamScheduleCell = self->_streamScheduleCell;
  currentStreamSchedule = self->_currentStreamSchedule;

  self->_streamIDsCell = (NSArray *)[a3 copy];
  self->_streamScheduleCell = (NSMutableDictionary *)[(VCSessionUplinkVideoStreamController *)self newVideoStreamKeyFrameScheduleWithStreamIDs:self->_streamIDsCell];

  self->_schedulerCell = [[VCIDRScheduler alloc] initWithStreams:[(NSMutableDictionary *)self->_streamScheduleCell allValues] captureFramerate:self->_captureFrameRate];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_streamScheduleCell allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v74 objects:v73 count:16];
  if (!v6) {
    goto LABEL_27;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v75;
  v57 = v5;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v75 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(NSMutableDictionary **)(*((void *)&v74 + 1) + 8 * v9);
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_22;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        __int16 v22 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          int v23 = [(NSMutableDictionary *)v10 framePosition];
          int v24 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
          *(_DWORD *)buf = 136316418;
          uint64_t v59 = v20;
          __int16 v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
          __int16 v62 = 1024;
          int v63 = 115;
          __int16 v64 = 2112;
          v65 = v10;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v23;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v24;
          v17 = v21;
          v18 = " [%s] %s:%d Cell stream %@ position %d, framesPerIdrPeriod %d";
          uint32_t v19 = 50;
          goto LABEL_18;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int v30 = [(NSMutableDictionary *)v10 framePosition];
          int v31 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
          *(_DWORD *)buf = 136316418;
          uint64_t v59 = v20;
          __int16 v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
          __int16 v62 = 1024;
          int v63 = 115;
          __int16 v64 = 2112;
          v65 = v10;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v30;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v31;
          v27 = v21;
          __int16 v28 = " [%s] %s:%d Cell stream %@ position %d, framesPerIdrPeriod %d";
          uint32_t v29 = 50;
          goto LABEL_25;
        }
      }
      else
      {
        v11 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          v11 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          v14 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            int v15 = [(NSMutableDictionary *)v10 framePosition];
            int v16 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
            *(_DWORD *)buf = 136316930;
            uint64_t v59 = v12;
            __int16 v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
            __int16 v62 = 1024;
            int v63 = 115;
            __int16 v64 = 2112;
            v65 = v11;
            __int16 v66 = 2048;
            *(void *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            __int16 v69 = 1024;
            int v70 = v15;
            uint64_t v5 = v57;
            __int16 v71 = 1024;
            int v72 = v16;
            v17 = v13;
            v18 = " [%s] %s:%d %@(%p) Cell stream %@ position %d, framesPerIdrPeriod %d";
            uint32_t v19 = 70;
LABEL_18:
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
            goto LABEL_22;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            int v25 = [(NSMutableDictionary *)v10 framePosition];
            int v26 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
            *(_DWORD *)buf = 136316930;
            uint64_t v59 = v12;
            __int16 v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
            __int16 v62 = 1024;
            int v63 = 115;
            __int16 v64 = 2112;
            v65 = v11;
            __int16 v66 = 2048;
            *(void *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            __int16 v69 = 1024;
            int v70 = v25;
            uint64_t v5 = v57;
            __int16 v71 = 1024;
            int v72 = v26;
            v27 = v13;
            __int16 v28 = " [%s] %s:%d %@(%p) Cell stream %@ position %d, framesPerIdrPeriod %d";
            uint32_t v29 = 70;
LABEL_25:
            _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, v28, buf, v29);
          }
        }
      }
LABEL_22:
      ++v9;
    }
    while (v7 != v9);
    uint64_t v32 = [v5 countByEnumeratingWithState:&v74 objects:v73 count:16];
    uint64_t v7 = v32;
  }
  while (v32);
LABEL_27:
  if (currentStreamSchedule == streamScheduleCell)
  {
    self->_currentStreamSchedule = self->_streamScheduleCell;
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_51;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      v43 = self->_streamScheduleCell;
      *(_DWORD *)buf = 136315906;
      uint64_t v59 = v42;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      __int16 v62 = 1024;
      int v63 = 119;
      __int16 v64 = 2112;
      v65 = v43;
      v38 = " [%s] %s:%d StreamScheduleCell (active) is %@";
      goto LABEL_44;
    }
    if (objc_opt_respondsToSelector()) {
      v34 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      v34 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_51;
    }
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v47 = self->_streamScheduleCell;
    *(_DWORD *)buf = 136316418;
    uint64_t v59 = v46;
    __int16 v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
    __int16 v62 = 1024;
    int v63 = 119;
    __int16 v64 = 2112;
    v65 = v34;
    __int16 v66 = 2048;
    *(void *)v67 = self;
    *(_WORD *)&v67[8] = 2112;
    v68 = v47;
    v38 = " [%s] %s:%d %@(%p) StreamScheduleCell (active) is %@";
LABEL_49:
    v44 = v40;
    uint32_t v45 = 58;
LABEL_50:
    _os_log_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_DEFAULT, v38, buf, v45);
    goto LABEL_51;
  }
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_51;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v37 = self->_streamScheduleCell;
    *(_DWORD *)buf = 136315906;
    uint64_t v59 = v35;
    __int16 v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
    __int16 v62 = 1024;
    int v63 = 121;
    __int16 v64 = 2112;
    v65 = v37;
    v38 = " [%s] %s:%d StreamScheduleCell is %@";
LABEL_44:
    v44 = v36;
    uint32_t v45 = 38;
    goto LABEL_50;
  }
  if (objc_opt_respondsToSelector()) {
    v33 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
  }
  else {
    v33 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->_streamScheduleCell;
      *(_DWORD *)buf = 136316418;
      uint64_t v59 = v39;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      __int16 v62 = 1024;
      int v63 = 121;
      __int16 v64 = 2112;
      v65 = v33;
      __int16 v66 = 2048;
      *(void *)v67 = self;
      *(_WORD *)&v67[8] = 2112;
      v68 = v41;
      v38 = " [%s] %s:%d %@(%p) StreamScheduleCell is %@";
      goto LABEL_49;
    }
  }
LABEL_51:
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (void)setStreamIDsWifi:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self lock];
  if (![a3 count])
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_51;
      }
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E4F47A50];
      v51 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[VCSessionUplinkVideoStreamController setStreamIDsWifi:]();
        }
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v59 = v49;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      __int16 v62 = 1024;
      int v63 = 130;
      v38 = " [%s] %s:%d streamIDsWifi is nil";
      v44 = v50;
      uint32_t v45 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v48 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        v48 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_51;
      }
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E4F47A50];
      v54 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v59 = v52;
          __int16 v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
          __int16 v62 = 1024;
          int v63 = 130;
          __int16 v64 = 2112;
          v65 = v48;
          __int16 v66 = 2048;
          *(void *)v67 = self;
          _os_log_debug_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) streamIDsWifi is nil", buf, 0x30u);
        }
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v59 = v52;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      __int16 v62 = 1024;
      int v63 = 130;
      __int16 v64 = 2112;
      v65 = v48;
      __int16 v66 = 2048;
      *(void *)v67 = self;
      v38 = " [%s] %s:%d %@(%p) streamIDsWifi is nil";
      v44 = v53;
      uint32_t v45 = 48;
    }
    goto LABEL_50;
  }
  streamScheduleWifi = self->_streamScheduleWifi;
  currentStreamSchedule = self->_currentStreamSchedule;

  self->_streamIDsWifi = (NSArray *)[a3 copy];
  self->_streamScheduleWifi = (NSMutableDictionary *)[(VCSessionUplinkVideoStreamController *)self newVideoStreamKeyFrameScheduleWithStreamIDs:self->_streamIDsWifi];

  self->_schedulerWifi = [[VCIDRScheduler alloc] initWithStreams:[(NSMutableDictionary *)self->_streamScheduleWifi allValues] captureFramerate:self->_captureFrameRate];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_streamScheduleWifi allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v74 objects:v73 count:16];
  if (!v6) {
    goto LABEL_27;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v75;
  v57 = v5;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v75 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(NSMutableDictionary **)(*((void *)&v74 + 1) + 8 * v9);
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_22;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        __int16 v22 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          int v23 = [(NSMutableDictionary *)v10 framePosition];
          int v24 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
          *(_DWORD *)buf = 136316418;
          uint64_t v59 = v20;
          __int16 v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
          __int16 v62 = 1024;
          int v63 = 139;
          __int16 v64 = 2112;
          v65 = v10;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v23;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v24;
          v17 = v21;
          v18 = " [%s] %s:%d Wifi stream %@, position %d, framesPerIdrPeriod %d";
          uint32_t v19 = 50;
          goto LABEL_18;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int v30 = [(NSMutableDictionary *)v10 framePosition];
          int v31 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
          *(_DWORD *)buf = 136316418;
          uint64_t v59 = v20;
          __int16 v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
          __int16 v62 = 1024;
          int v63 = 139;
          __int16 v64 = 2112;
          v65 = v10;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v30;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v31;
          v27 = v21;
          __int16 v28 = " [%s] %s:%d Wifi stream %@, position %d, framesPerIdrPeriod %d";
          uint32_t v29 = 50;
          goto LABEL_25;
        }
      }
      else
      {
        v11 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          v11 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          v14 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_22;
            }
            int v15 = [(NSMutableDictionary *)v10 framePosition];
            int v16 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
            *(_DWORD *)buf = 136316930;
            uint64_t v59 = v12;
            __int16 v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
            __int16 v62 = 1024;
            int v63 = 139;
            __int16 v64 = 2112;
            v65 = v11;
            __int16 v66 = 2048;
            *(void *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            __int16 v69 = 1024;
            int v70 = v15;
            uint64_t v5 = v57;
            __int16 v71 = 1024;
            int v72 = v16;
            v17 = v13;
            v18 = " [%s] %s:%d %@(%p) Wifi stream %@, position %d, framesPerIdrPeriod %d";
            uint32_t v19 = 70;
LABEL_18:
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
            goto LABEL_22;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            int v25 = [(NSMutableDictionary *)v10 framePosition];
            int v26 = [(NSMutableDictionary *)v10 framesPerIdrPeriod];
            *(_DWORD *)buf = 136316930;
            uint64_t v59 = v12;
            __int16 v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
            __int16 v62 = 1024;
            int v63 = 139;
            __int16 v64 = 2112;
            v65 = v11;
            __int16 v66 = 2048;
            *(void *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            __int16 v69 = 1024;
            int v70 = v25;
            uint64_t v5 = v57;
            __int16 v71 = 1024;
            int v72 = v26;
            v27 = v13;
            __int16 v28 = " [%s] %s:%d %@(%p) Wifi stream %@, position %d, framesPerIdrPeriod %d";
            uint32_t v29 = 70;
LABEL_25:
            _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, v28, buf, v29);
          }
        }
      }
LABEL_22:
      ++v9;
    }
    while (v7 != v9);
    uint64_t v32 = [v5 countByEnumeratingWithState:&v74 objects:v73 count:16];
    uint64_t v7 = v32;
  }
  while (v32);
LABEL_27:
  if (currentStreamSchedule == streamScheduleWifi)
  {
    self->_currentStreamSchedule = self->_streamScheduleWifi;
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_51;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      v43 = self->_streamScheduleWifi;
      *(_DWORD *)buf = 136315906;
      uint64_t v59 = v42;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      __int16 v62 = 1024;
      int v63 = 143;
      __int16 v64 = 2112;
      v65 = v43;
      v38 = " [%s] %s:%d StreamScheduleWifi (active) is %@";
      goto LABEL_44;
    }
    if (objc_opt_respondsToSelector()) {
      v34 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      v34 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_51;
    }
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v47 = self->_streamScheduleWifi;
    *(_DWORD *)buf = 136316418;
    uint64_t v59 = v46;
    __int16 v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
    __int16 v62 = 1024;
    int v63 = 143;
    __int16 v64 = 2112;
    v65 = v34;
    __int16 v66 = 2048;
    *(void *)v67 = self;
    *(_WORD *)&v67[8] = 2112;
    v68 = v47;
    v38 = " [%s] %s:%d %@(%p) StreamScheduleWifi (active) is %@";
LABEL_49:
    v44 = v40;
    uint32_t v45 = 58;
LABEL_50:
    _os_log_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_DEFAULT, v38, buf, v45);
    goto LABEL_51;
  }
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_51;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v37 = self->_streamScheduleWifi;
    *(_DWORD *)buf = 136315906;
    uint64_t v59 = v35;
    __int16 v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
    __int16 v62 = 1024;
    int v63 = 145;
    __int16 v64 = 2112;
    v65 = v37;
    v38 = " [%s] %s:%d StreamScheduleWifi is %@";
LABEL_44:
    v44 = v36;
    uint32_t v45 = 38;
    goto LABEL_50;
  }
  if (objc_opt_respondsToSelector()) {
    v33 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
  }
  else {
    v33 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->_streamScheduleWifi;
      *(_DWORD *)buf = 136316418;
      uint64_t v59 = v39;
      __int16 v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      __int16 v62 = 1024;
      int v63 = 145;
      __int16 v64 = 2112;
      v65 = v33;
      __int16 v66 = 2048;
      *(void *)v67 = self;
      *(_WORD *)&v67[8] = 2112;
      v68 = v41;
      v38 = " [%s] %s:%d %@(%p) StreamScheduleWifi is %@";
      goto LABEL_49;
    }
  }
LABEL_51:
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (void)setPendingVideoStreamsInternal:(id)a3
{
  uint64_t v5 = (NSMutableDictionary *)[a3 mutableCopy];
  self->_pendingVideoStreams = v5;
  if ([(NSMutableDictionary *)v5 count])
  {
    BOOL v6 = 1;
  }
  else
  {
    if ([(NSMutableSet *)self->_streamToResume count]) {
      [(NSMutableSet *)self->_streamToResume removeAllObjects];
    }

    self->_streamToPause = (NSMutableSet *)[(NSMutableDictionary *)self->_activeVideoStreams mutableCopy];
    [(VCSessionUplinkVideoStreamController *)self pauseStreams];
    BOOL v6 = 0;
  }
  self->_pendingStreamsUpdated = v6;
}

- (void)setPendingVideoStreams:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionUplinkVideoStreamController setPendingVideoStreams:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = [a3 allKeys];
        uint64_t v8 = " [%s] %s:%d Setting pending streams %@";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionUplinkVideoStreamController setPendingVideoStreams:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        int v15 = self;
        LOWORD(v16) = 2112;
        *(void *)((char *)&v16 + 2) = [a3 allKeys];
        uint64_t v8 = " [%s] %s:%d %@(%p) Setting pending streams %@";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  [(VCSessionUplinkVideoStreamController *)self lock];
  [(VCSessionUplinkVideoStreamController *)self setPendingVideoStreamsInternal:a3];
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (void)selectVideoStreamForVideoPriority
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_dynamicVideoPriorityEnabled)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v3 = (void *)[(NSMutableDictionary *)self->_activeVideoStreams allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      unsigned int v7 = -1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          unsigned int v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig"), "qualityIndex");
          if (v7 >= v9) {
            unsigned int v7 = v9;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }
      while (v5);
    }
    else
    {
      unsigned int v7 = -1;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint32_t v10 = (void *)[(NSMutableDictionary *)self->_activeVideoStreams allValues];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "setEncodingMode:", v7 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "defaultStreamConfig"), "multiwayConfig"), "qualityIndex"));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v15 count:16];
      }
      while (v12);
    }
  }
}

- (void)printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:(float)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_streamsPendingKeyFrameGeneration count])
  {
    self->_double pendingKeyFrameGenerationStartTime = 0.0;
    return;
  }
  double pendingKeyFrameGenerationStartTime = self->_pendingKeyFrameGenerationStartTime;
  double v6 = a3;
  if (pendingKeyFrameGenerationStartTime == 0.0)
  {
    self->_double pendingKeyFrameGenerationStartTime = v6;
    return;
  }
  double v7 = v6 - pendingKeyFrameGenerationStartTime;
  if (v6 - pendingKeyFrameGenerationStartTime > 3.0)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_15;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      streamsPendingKeyFrameGeneration = self->_streamsPendingKeyFrameGeneration;
      int v18 = 136316162;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      long long v21 = "-[VCSessionUplinkVideoStreamController printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:]";
      __int16 v22 = 1024;
      int v23 = 196;
      __int16 v24 = 2048;
      double v25 = v7;
      __int16 v26 = 2112;
      v27 = (VCSessionUplinkVideoStreamController *)streamsPendingKeyFrameGeneration;
      uint64_t v12 = " [%s] %s:%d _streamsPendingKeyFrameGeneration array has been non zero for %5.2f seconds, streams=%@";
      uint64_t v13 = v10;
      uint32_t v14 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_15;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      long long v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      long long v17 = self->_streamsPendingKeyFrameGeneration;
      int v18 = 136316674;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      long long v21 = "-[VCSessionUplinkVideoStreamController printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:]";
      __int16 v22 = 1024;
      int v23 = 196;
      __int16 v24 = 2112;
      double v25 = *(double *)&v8;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2048;
      double v29 = v7;
      __int16 v30 = 2112;
      int v31 = v17;
      uint64_t v12 = " [%s] %s:%d %@(%p) _streamsPendingKeyFrameGeneration array has been non zero for %5.2f seconds, streams=%@";
      uint64_t v13 = v16;
      uint32_t v14 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
LABEL_15:
    reportingSymptom();
  }
}

- (void)setCurrentFrameTime:(float)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self lock];
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_18;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)int v23 = 136315906;
      *(void *)&v23[4] = v6;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&v23[14] = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 204;
      WORD2(v24) = 2048;
      *(double *)((char *)&v24 + 6) = a3;
      uint64_t v9 = " [%s] %s:%d FrameTime is %f";
      uint32_t v10 = v7;
      uint32_t v11 = 38;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v23, v11);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[VCSessionUplinkVideoStreamController setCurrentFrameTime:](v6);
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_DWORD *)int v23 = 136316418;
        *(void *)&v23[4] = v12;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 204;
        WORD2(v24) = 2112;
        *(void *)((char *)&v24 + 6) = v5;
        HIWORD(v24) = 2048;
        double v25 = self;
        LOWORD(v26) = 2048;
        *(double *)((char *)&v26 + 2) = a3;
        uint64_t v9 = " [%s] %s:%d %@(%p) FrameTime is %f";
        uint32_t v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int v23 = 136316418;
        *(void *)&v23[4] = v12;
        *(_WORD *)&v23[12] = 2080;
        *(void *)&v23[14] = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 204;
        WORD2(v24) = 2112;
        *(void *)((char *)&v24 + 6) = v5;
        HIWORD(v24) = 2048;
        double v25 = self;
        LOWORD(v26) = 2048;
        *(double *)((char *)&v26 + 2) = a3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) FrameTime is %f", v23, 0x3Au);
      }
    }
  }
LABEL_18:
  if (self->_startTime == 0.0) {
    self->_startTime = a3;
  }
  self->_currentFrameTime = a3;
  if (self->_pendingStreamsUpdated)
  {
    BOOL v15 = [(VCSessionUplinkVideoStreamController *)self filterPendingTemporalStreams];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[NSMutableDictionary allKeys](self->_pendingVideoStreams, "allKeys"));
    long long v17 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[NSMutableDictionary allKeys](self->_activeVideoStreams, "allKeys"));
    int v18 = (NSMutableSet *)[(id)v16 mutableCopy];
    uint64_t v19 = (NSMutableSet *)[v17 mutableCopy];
    [(NSMutableSet *)v18 minusSet:v17];
    [(NSMutableSet *)v19 minusSet:v16];

    self->_streamToPause = v19;
    self->_streamToResume = v18;
    LOBYTE(v16) = [(VCSessionUplinkVideoStreamController *)self pauseStreams];
    BOOL v20 = [(VCSessionUplinkVideoStreamController *)self resumeStreams];
    self->_pendingStreamsUpdated = 0;
    if ((v16 & 1) != 0 || v20 || v15)
    {
LABEL_27:
      id v21 = [(VCSessionUplinkVideoStreamController *)self delegate];
      objc_msgSend(v21, "controller:didChangeActiveVideoStreams:", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", self->_activeVideoStreams));
    }
  }
  else if ([(NSMutableSet *)self->_streamToResume count] {
         && [(VCSessionUplinkVideoStreamController *)self resumeStreams])
  }
  {
    goto LABEL_27;
  }
  if ([(NSMutableArray *)self->_streamsPendingKeyFrameGeneration count])
  {
    [(VCSessionUplinkVideoStreamController *)self handleStreamsPendingKeyFrameGeneration];
  }
  *(float *)&double v22 = a3;
  [(VCSessionUplinkVideoStreamController *)self printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:v22];
  if ([(NSMutableArray *)self->_streamResetIDR count]) {
    [(VCSessionUplinkVideoStreamController *)self handleStreamsResetIDR];
  }
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (void)setIsLocalOnCellular:(BOOL)a3 cappedVideoStreamIDs:(id)a4
{
  BOOL v5 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self lock];
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v42 = 136316162;
        *(void *)&v42[4] = v8;
        *(_WORD *)&v42[12] = 2080;
        *(void *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
        *(_WORD *)&v42[22] = 1024;
        *(_DWORD *)v43 = 256;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = v5;
        *(_WORD *)&v43[10] = 2112;
        *(void *)&v43[12] = a4;
        uint32_t v10 = " [%s] %s:%d Current interface isLocalOnCellular %d %@";
        uint32_t v11 = v9;
        uint32_t v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v42, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v7 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      double v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v42 = 136316674;
        *(void *)&v42[4] = v13;
        *(_WORD *)&v42[12] = 2080;
        *(void *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
        *(_WORD *)&v42[22] = 1024;
        *(_DWORD *)v43 = 256;
        *(_WORD *)&v43[4] = 2112;
        *(void *)&v43[6] = v7;
        *(_WORD *)&v43[14] = 2048;
        *(void *)&v43[16] = self;
        LOWORD(v44) = 1024;
        *(_DWORD *)((char *)&v44 + 2) = v5;
        WORD3(v44) = 2112;
        *((void *)&v44 + 1) = a4;
        uint32_t v10 = " [%s] %s:%d %@(%p) Current interface isLocalOnCellular %d %@";
        uint32_t v11 = v14;
        uint32_t v12 = 64;
        goto LABEL_11;
      }
    }
  }
  uint64_t v15 = 64;
  if (v5) {
    uint64_t v15 = 72;
  }
  self->_currentStreamSchedule = *(NSMutableDictionary **)((char *)&self->super.isa + v15);
  id v16 = -[VCSessionUplinkVideoStreamController anchorStreamIDWithCappedVideoStreamIDs:](self, "anchorStreamIDWithCappedVideoStreamIDs:", a4, *(_OWORD *)v42, *(void *)&v42[16], *(_OWORD *)v43, *(void *)&v43[16], v44);
  if (!v16)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_21;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      uint64_t v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)uint64_t v42 = 136315650;
      *(void *)&v42[4] = v31;
      *(_WORD *)&v42[12] = 2080;
      *(void *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
      *(_WORD *)&v42[22] = 1024;
      *(_DWORD *)v43 = 265;
      v33 = " [%s] %s:%d anchor stream doesn't exist";
      v34 = v32;
      uint32_t v35 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v28 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_21;
      }
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)uint64_t v42 = 136316162;
      *(void *)&v42[4] = v36;
      *(_WORD *)&v42[12] = 2080;
      *(void *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
      *(_WORD *)&v42[22] = 1024;
      *(_DWORD *)v43 = 265;
      *(_WORD *)&v43[4] = 2112;
      *(void *)&v43[6] = v28;
      *(_WORD *)&v43[14] = 2048;
      *(void *)&v43[16] = self;
      v33 = " [%s] %s:%d %@(%p) anchor stream doesn't exist";
      v34 = v37;
      uint32_t v35 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, v42, v35);
    goto LABEL_21;
  }
  id v17 = v16;
  uint64_t v18 = [(NSMutableDictionary *)self->_streamScheduleWifi objectForKeyedSubscript:v16];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(NSMutableDictionary *)self->_streamScheduleCell objectForKeyedSubscript:v17];
    if (v20)
    {
      id v21 = (void *)v20;
      float v22 = (float)[v19 framePosition];
      float v23 = v22 / (float)[v19 framesPerIdrPeriod];
      float v24 = (float)[v21 framePosition];
      float v25 = v24 / (float)[v21 framesPerIdrPeriod];
      unsigned int v26 = [v19 keyFrameInterval] / 0x3E8;
      if (v5) {
        float v27 = v23 - v25;
      }
      else {
        float v27 = v25 - v23;
      }
      self->_currentFrameTime = self->_currentFrameTime - (float)(v27 * (float)v26);
      goto LABEL_21;
    }
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v30 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v41 = VRTraceErrorLogLevelToCSTR();
        uint64_t v39 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v42 = 136316418;
          *(void *)&v42[4] = v41;
          *(_WORD *)&v42[12] = 2080;
          *(void *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
          *(_WORD *)&v42[22] = 1024;
          *(_DWORD *)v43 = 269;
          *(_WORD *)&v43[4] = 2112;
          *(void *)&v43[6] = v30;
          *(_WORD *)&v43[14] = 2048;
          *(void *)&v43[16] = self;
          LOWORD(v44) = 2112;
          *(void *)((char *)&v44 + 2) = v17;
          v40 = " [%s] %s:%d %@(%p) schedule for anchor stream %@ on cell not found";
          goto LABEL_53;
        }
      }
    }
  }
  else if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v29 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      double v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v42 = 136316418;
        *(void *)&v42[4] = v38;
        *(_WORD *)&v42[12] = 2080;
        *(void *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
        *(_WORD *)&v42[22] = 1024;
        *(_DWORD *)v43 = 267;
        *(_WORD *)&v43[4] = 2112;
        *(void *)&v43[6] = v29;
        *(_WORD *)&v43[14] = 2048;
        *(void *)&v43[16] = self;
        LOWORD(v44) = 2112;
        *(void *)((char *)&v44 + 2) = v17;
        v40 = " [%s] %s:%d %@(%p) schedule for anchor stream %@ on Wifi not found";
LABEL_53:
        _os_log_error_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_ERROR, v40, v42, 0x3Au);
      }
    }
  }
LABEL_21:
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (void)generateKeyFrameWithStreamID:(id)a3 firType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self lock];
  if (self->_shouldSkipIDRScheduler)
  {
    if ([(NSMutableDictionary *)self->_activeVideoStreams objectForKeyedSubscript:a3])
    {
      double v7 = (void *)[(NSMutableDictionary *)self->_activeVideoStreams objectForKeyedSubscript:a3];
LABEL_16:
      [v7 generateKeyFrameWithFIRType:v4];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v8 = (void *)[(NSMutableDictionary *)self->_activeVideoStreams allValues];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v13, "compoundStreamIDs"), "containsObject:", a3))
            {
              double v7 = v13;
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
  }
  else if (([(NSMutableArray *)self->_streamsPendingKeyFrameGeneration containsObject:a3] & 1) == 0)
  {
    [(NSMutableArray *)self->_streamsPendingKeyFrameGeneration addObject:a3];
  }
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (BOOL)setStreamsUseRTCPWithStreamInfos:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a3
    || ![a3 count]
    || !objc_msgSend((id)objc_msgSend(a3, "firstObject"), "streamConfigs")
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "streamConfigs"), "count"))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        long long v17 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        long long v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_44;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v31 = v18;
        __int16 v32 = 2080;
        v33 = "-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]";
        __int16 v34 = 1024;
        int v35 = 308;
        __int16 v36 = 2112;
        *(void *)v37 = v17;
        *(_WORD *)&v37[8] = 2048;
        *(void *)&v37[10] = self;
        float v23 = " [%s] %s:%d %@(%p) StreamInfo array is nil, empty, or its streamConfigs array is nil or empty.";
        float v24 = v19;
        uint32_t v25 = 48;
LABEL_43:
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
        goto LABEL_44;
      }
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v16)
      {
LABEL_30:
        LOBYTE(v5) = 0;
        goto LABEL_45;
      }
      -[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]();
    }
LABEL_44:
    LOBYTE(v5) = 0;
    LOBYTE(v16) = 0;
    goto LABEL_45;
  }
  int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "streamConfigs"), "firstObject"), "isRTCPEnabled");
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v48 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
LABEL_7:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v49 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      double v29 = v10;
      uint64_t v11 = (void *)[v10 streamConfigs];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v42 count:16];
      if (v12) {
        break;
      }
LABEL_18:
      if (++v9 == v7)
      {
        uint64_t v7 = [a3 countByEnumeratingWithState:&v48 objects:v47 count:16];
        LOBYTE(v16) = 1;
        if (v7) {
          goto LABEL_7;
        }
        goto LABEL_45;
      }
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
LABEL_12:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(v11);
      }
      if (v5 != [*(id *)(*((void *)&v43 + 1) + 8 * v15) isRTCPEnabled]) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v42 count:16];
        if (v13) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_44;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      float v22 = *MEMORY[0x1E4F47A50];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v31 = v21;
        __int16 v32 = 2080;
        v33 = "-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]";
        __int16 v34 = 1024;
        int v35 = 318;
        __int16 v36 = 1024;
        *(_DWORD *)v37 = v5;
        *(_WORD *)&v37[4] = 2048;
        *(void *)&v37[6] = [v29 stream];
        float v23 = " [%s] %s:%d Invalid RTCP config. firstStreamRTCPEnabled=%d but stream=%p has a different value. All stream"
              "s must have matching isRTCPEnabled values.";
        float v24 = v22;
        uint32_t v25 = 44;
        goto LABEL_43;
      }
      goto LABEL_30;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_44;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    float v27 = *MEMORY[0x1E4F47A50];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v16) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v31 = v26;
    __int16 v32 = 2080;
    v33 = "-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]";
    __int16 v34 = 1024;
    int v35 = 318;
    __int16 v36 = 2112;
    *(void *)v37 = v20;
    *(_WORD *)&v37[8] = 2048;
    *(void *)&v37[10] = self;
    __int16 v38 = 1024;
    int v39 = v5;
    __int16 v40 = 2048;
    uint64_t v41 = [v29 stream];
    float v23 = " [%s] %s:%d %@(%p) Invalid RTCP config. firstStreamRTCPEnabled=%d but stream=%p has a different value. All str"
          "eams must have matching isRTCPEnabled values.";
    float v24 = v27;
    uint32_t v25 = 64;
    goto LABEL_43;
  }
  LOBYTE(v16) = 1;
LABEL_45:
  self->_streamsUseRTCP = v5;
  return v16;
}

- (id)anchorStreamIDWithCappedVideoStreamIDs:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[NSMutableDictionary allKeys](self->_activeVideoStreams, "allKeys"));
  objc_msgSend(v5, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", a3));
  if (![v5 count])
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionUplinkVideoStreamController anchorStreamIDWithCappedVideoStreamIDs:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v16 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v26 = v17;
          __int16 v27 = 2080;
          __int16 v28 = "-[VCSessionUplinkVideoStreamController anchorStreamIDWithCappedVideoStreamIDs:]";
          __int16 v29 = 1024;
          int v30 = 333;
          __int16 v31 = 2112;
          __int16 v32 = v16;
          __int16 v33 = 2048;
          __int16 v34 = self;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) no streams available", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  uint64_t v6 = (void *)[v5 allObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  unsigned int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInfoMap, "objectForKeyedSubscript:", v13), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
      if ([v14 maxNetworkBitrate] > v9)
      {
        unsigned int v9 = [v14 maxNetworkBitrate];
        uint64_t v10 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v20 count:16];
  }
  while (v8);
  if (v10)
  {

    uint64_t v15 = (NSMutableArray *)[v6 mutableCopy];
    self->_streamResetIDR = v15;
    [(NSMutableArray *)v15 removeObject:v10];
  }
  return v10;
}

- (void)initilizeStreamInfoMapWithStreamInfos:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v17 = [a3 countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v42;
    unint64_t v4 = 0x1E4F28000uLL;
    int v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(a3);
        }
        uint64_t v18 = v6;
        uint64_t v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v20 = (id)[v7 streamConfigs];
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v35 count:16];
        if (v22)
        {
          uint64_t v21 = *(void *)v37;
          uint64_t v19 = v7;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v20);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInfoMap, "setObject:forKeyedSubscript:", v7, objc_msgSend(*(id *)(v4 + 3792), "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "multiwayConfig"), "idsStreamID")));
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                __str = 0;
                streamInfoMap = self->_streamInfoMap;
                uint64_t v10 = streamInfoMap
                    ? (const char *)objc_msgSend((id)-[NSMutableDictionary description](streamInfoMap, "description"), "UTF8String"): "<nil>";
                asprintf(&__str, "(%p) %s", self, v10);
                if (__str)
                {
                  unint64_t v11 = v4;
                  __lasts = 0;
                  uint64_t v12 = strtok_r(__str, "\n", &__lasts);
                  do
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
                      uint64_t v14 = *v5;
                      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136316162;
                        uint64_t v26 = v13;
                        __int16 v27 = 2080;
                        __int16 v28 = "-[VCSessionUplinkVideoStreamController initilizeStreamInfoMapWithStreamInfos:]";
                        __int16 v29 = 1024;
                        int v30 = 360;
                        __int16 v31 = 2080;
                        __int16 v32 = "_streamInfoMap:";
                        __int16 v33 = 2080;
                        __int16 v34 = v12;
                        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                      }
                    }
                    uint64_t v12 = strtok_r(0, "\n", &__lasts);
                  }
                  while (v12);
                  free(__str);
                  unint64_t v4 = v11;
                  uint64_t v7 = v19;
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v35 count:16];
          }
          while (v22);
        }
        uint64_t v6 = v18 + 1;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [a3 countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v17);
  }
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (BOOL)resumeStreams
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  streamToResume = self->_streamToResume;
  uint64_t v5 = [(NSMutableSet *)streamToResume countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(streamToResume);
        }
        uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        int v11 = objc_msgSend(-[VCSessionUplinkVideoStreamController getMultiwayConfigForStreamID:](self, "getMultiwayConfigForStreamID:", v10), "isTemporalStream");
        uint64_t v12 = [(NSMutableDictionary *)self->_currentStreamSchedule objectForKeyedSubscript:v10];
        if (!v12 && (v11 & 1) == 0 && !self->_shouldSkipIDRScheduler)
        {
          if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSessionUplinkVideoStreamController resumeStreams]();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint32_t v25 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
            }
            else {
              uint32_t v25 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v26 = VRTraceErrorLogLevelToCSTR();
              __int16 v27 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int v28 = 136316418;
                uint64_t v29 = v26;
                __int16 v30 = 2080;
                __int16 v31 = "-[VCSessionUplinkVideoStreamController resumeStreams]";
                __int16 v32 = 1024;
                int v33 = 379;
                __int16 v34 = 2112;
                *(void *)uint64_t v35 = v25;
                *(_WORD *)&v35[8] = 2048;
                *(void *)&v35[10] = self;
                __int16 v36 = 2112;
                *(void *)long long v37 = v10;
                _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Non temporal stream's schedule is nil for streamID %@", (uint8_t *)&v28, 0x3Au);
              }
            }
          }
          goto LABEL_23;
        }
        if ((([(VCSessionUplinkVideoStreamController *)self shouldGenerateIDRWithStreamSchedule:v12] | v11) & 1) != 0|| self->_shouldSkipIDRScheduler)
        {
          uint64_t v13 = (void *)[(NSMutableDictionary *)self->_videoStreams objectForKeyedSubscript:v10];
          if ([v13 state] == 4) {
            [v13 setPause:0];
          }
          if (self->_streamsUseRTCP) {
            [v13 setRtcpEnabled:1];
          }
          [(NSMutableDictionary *)self->_activeVideoStreams setObject:v13 forKeyedSubscript:v10];
          [v3 addObject:v10];
          BOOL v7 = 1;
        }
      }
      uint64_t v6 = [(NSMutableSet *)streamToResume countByEnumeratingWithState:&v39 objects:v38 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    [(VCSessionUplinkVideoStreamController *)self setCachedActiveVideoStreams:self->_activeVideoStreams];
    if (v7)
    {
      [(NSMutableSet *)self->_streamToResume minusSet:v3];
      BOOL v7 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    [(VCSessionUplinkVideoStreamController *)self setCachedActiveVideoStreams:self->_activeVideoStreams];
  }
  BOOL v7 = 0;
LABEL_22:
  [(VCSessionUplinkVideoStreamController *)self selectVideoStreamForVideoPriority];
LABEL_23:

  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        activeVideoStreams = self->_activeVideoStreams;
        int v28 = 136316162;
        uint64_t v29 = v15;
        __int16 v30 = 2080;
        __int16 v31 = "-[VCSessionUplinkVideoStreamController resumeStreams]";
        __int16 v32 = 1024;
        int v33 = 401;
        __int16 v34 = 1024;
        *(_DWORD *)uint64_t v35 = v7;
        *(_WORD *)&v35[4] = 2112;
        *(void *)&v35[6] = activeVideoStreams;
        uint64_t v18 = " [%s] %s:%d streamResumed %d activeVideoStreams %@";
        uint64_t v19 = v16;
        uint32_t v20 = 44;
LABEL_33:
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v28, v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = self->_activeVideoStreams;
        int v28 = 136316674;
        uint64_t v29 = v21;
        __int16 v30 = 2080;
        __int16 v31 = "-[VCSessionUplinkVideoStreamController resumeStreams]";
        __int16 v32 = 1024;
        int v33 = 401;
        __int16 v34 = 2112;
        *(void *)uint64_t v35 = v14;
        *(_WORD *)&v35[8] = 2048;
        *(void *)&v35[10] = self;
        __int16 v36 = 1024;
        *(_DWORD *)long long v37 = v7;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v23;
        uint64_t v18 = " [%s] %s:%d %@(%p) streamResumed %d activeVideoStreams %@";
        uint64_t v19 = v22;
        uint32_t v20 = 64;
        goto LABEL_33;
      }
    }
  }
  return v7;
}

- (BOOL)shouldGenerateIDRWithStreamSchedule:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  float v5 = self->_currentFrameTime - self->_startTime;
  unsigned int v6 = [a3 keyFrameInterval];
  float v7 = (float)(v5 - (float)((float)(int)(float)(v5 / (float)(v6 / 0x3E8)) * (float)(v6 / 0x3E8))) / (float)(v6 / 0x3E8);
  float v8 = (float)[a3 framePosition];
  float v9 = v8 / (float)[a3 framesPerIdrPeriod];
  if (v7 < v9 && [(NSMutableArray *)self->_streamsPendingKeyFrameGeneration count])
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          double currentFrameTime = self->_currentFrameTime;
          double startTime = self->_startTime;
          int v23 = 136316674;
          uint64_t v24 = v11;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:]";
          __int16 v27 = 1024;
          int v28 = 418;
          __int16 v29 = 2048;
          double v30 = v7;
          __int16 v31 = 2048;
          double v32 = v9;
          __int16 v33 = 2048;
          double v34 = currentFrameTime;
          __int16 v35 = 2048;
          double v36 = startTime;
          uint64_t v15 = " [%s] %s:%d reminderTimePercentage=%3.2f, expectedTimePercentage=%3.2f, _currentFrameTime=%5.2f, _startTime=%5.2f.";
          uint64_t v16 = v12;
          uint32_t v17 = 68;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        *(double *)&uint64_t v10 = COERCE_DOUBLE([(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix]);
      }
      else {
        *(double *)&uint64_t v10 = COERCE_DOUBLE(&stru_1F3D3E450);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          double v20 = self->_currentFrameTime;
          double v21 = self->_startTime;
          int v23 = 136317186;
          uint64_t v24 = v18;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:]";
          __int16 v27 = 1024;
          int v28 = 418;
          __int16 v29 = 2112;
          double v30 = *(double *)&v10;
          __int16 v31 = 2048;
          double v32 = *(double *)&self;
          __int16 v33 = 2048;
          double v34 = v7;
          __int16 v35 = 2048;
          double v36 = v9;
          __int16 v37 = 2048;
          double v38 = v20;
          __int16 v39 = 2048;
          double v40 = v21;
          uint64_t v15 = " [%s] %s:%d %@(%p) reminderTimePercentage=%3.2f, expectedTimePercentage=%3.2f, _currentFrameTime=%5.2f, "
                "_startTime=%5.2f.";
          uint64_t v16 = v19;
          uint32_t v17 = 88;
          goto LABEL_13;
        }
      }
    }
  }
  return v7 >= v9;
}

- (BOOL)pauseStreams
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  streamToPause = self->_streamToPause;
  uint64_t v4 = [(NSMutableSet *)streamToPause countByEnumeratingWithState:&v27 objects:v26 count:16];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)v28;
    uint64_t v7 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(streamToPause);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = (void *)[(NSMutableDictionary *)self->_activeVideoStreams objectForKeyedSubscript:v9];
        if ([v10 state] == 2)
        {
          if (self->_streamsUseRTCP) {
            [v10 setRtcpEnabled:0];
          }
          [v10 setPause:1];
        }
        [(NSMutableDictionary *)self->_activeVideoStreams setObject:0 forKeyedSubscript:v9];
      }
      uint64_t v7 = [(NSMutableSet *)streamToPause countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v7);
  }
  [(VCSessionUplinkVideoStreamController *)self setCachedActiveVideoStreams:self->_activeVideoStreams];
  [(NSMutableSet *)self->_streamToPause removeAllObjects];
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        activeVideoStreams = self->_activeVideoStreams;
        *(_DWORD *)uint64_t v22 = 136316162;
        *(void *)&v22[4] = v12;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCSessionUplinkVideoStreamController pauseStreams]";
        *(_WORD *)&v22[22] = 1024;
        *(_DWORD *)int v23 = 440;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v5 != 0;
        *(_WORD *)&v23[10] = 2112;
        *(void *)&v23[12] = activeVideoStreams;
        uint64_t v15 = " [%s] %s:%d streamPaused %d activeVideoStreams %@";
        uint64_t v16 = v13;
        uint32_t v17 = 44;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, v22, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v20 = self->_activeVideoStreams;
        *(_DWORD *)uint64_t v22 = 136316674;
        *(void *)&v22[4] = v18;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCSessionUplinkVideoStreamController pauseStreams]";
        *(_WORD *)&v22[22] = 1024;
        *(_DWORD *)int v23 = 440;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = v11;
        *(_WORD *)&v23[14] = 2048;
        *(void *)&v23[16] = self;
        LOWORD(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 2) = v5 != 0;
        HIWORD(v24) = 2112;
        __int16 v25 = v20;
        uint64_t v15 = " [%s] %s:%d %@(%p) streamPaused %d activeVideoStreams %@";
        uint64_t v16 = v19;
        uint32_t v17 = 64;
        goto LABEL_22;
      }
    }
  }
  [(VCSessionUplinkVideoStreamController *)self selectVideoStreamForVideoPriority];
  return v5 != 0;
}

- (void)handleStreamsPendingKeyFrameGeneration
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  streamsPendingKeyFrameGeneration = self->_streamsPendingKeyFrameGeneration;
  uint64_t v6 = [(NSMutableArray *)streamsPendingKeyFrameGeneration countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(streamsPendingKeyFrameGeneration);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        char v17 = 0;
        id v11 = [(VCSessionUplinkVideoStreamController *)self videoStreamPendingKeyFrameGenerationWithStreamID:v10 shouldRemoveFromPendingArray:&v17];
        if (v17)
        {
          id v12 = v11;
          [v3 addObject:v10];
          if (v12) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)streamsPendingKeyFrameGeneration countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v7);
  }
  if ([v3 count])
  {
    [(NSMutableArray *)self->_streamsPendingKeyFrameGeneration removeObjectsInArray:v3];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = [v4 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * j) generateKeyFrameWithFIRType:0];
        }
        uint64_t v14 = [v4 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v14);
    }
  }
}

- (id)videoStreamPendingKeyFrameGenerationWithStreamID:(id)a3 shouldRemoveFromPendingArray:(BOOL *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_activeVideoStreams allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v55 count:16];
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v57;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v57 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
    if (objc_msgSend((id)objc_msgSend(v12, "compoundStreamIDs"), "containsObject:", a3)) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:v55 count:16];
      if (v9) {
        goto LABEL_3;
      }
LABEL_9:
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v13 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v13 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          long long v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v39 = 136316418;
            uint64_t v40 = v20;
            __int16 v41 = 2080;
            long long v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFr"
                  "omPendingArray:]";
            __int16 v43 = 1024;
            int v44 = 483;
            __int16 v45 = 2112;
            id v46 = v13;
            __int16 v47 = 2048;
            long long v48 = self;
            __int16 v49 = 2112;
            id v50 = a3;
            _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Requesting a streamID %@ that is not in any of the compound streamIDs", (uint8_t *)&v39, 0x3Au);
          }
        }
      }
      uint64_t v14 = 0;
LABEL_30:
      uint64_t v16 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v14 = (VCSessionUplinkVideoStreamController *)objc_msgSend((id)objc_msgSend(v12, "sendingStreamID"), "copy");
  uint64_t v15 = [(NSMutableDictionary *)self->_activeVideoStreams objectForKeyedSubscript:v14];
  if (!v15)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_30;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      activeVideoStreams = self->_activeVideoStreams;
      int v39 = 136316418;
      uint64_t v40 = v22;
      __int16 v41 = 2080;
      long long v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      __int16 v43 = 1024;
      int v44 = 485;
      __int16 v45 = 2112;
      id v46 = a3;
      __int16 v47 = 2112;
      long long v48 = v14;
      __int16 v49 = 2112;
      id v50 = activeVideoStreams;
      long long v25 = " [%s] %s:%d  Stream is nil for streamID %@, sendingStreamID %@ activeVideoStreams %@";
      long long v26 = v23;
      uint32_t v27 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v19 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        long long v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_30;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      long long v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      uint64_t v31 = self->_activeVideoStreams;
      int v39 = 136316930;
      uint64_t v40 = v29;
      __int16 v41 = 2080;
      long long v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      __int16 v43 = 1024;
      int v44 = 485;
      __int16 v45 = 2112;
      id v46 = v19;
      __int16 v47 = 2048;
      long long v48 = self;
      __int16 v49 = 2112;
      id v50 = a3;
      __int16 v51 = 2112;
      uint64_t v52 = v14;
      __int16 v53 = 2112;
      v54 = v31;
      long long v25 = " [%s] %s:%d %@(%p)  Stream is nil for streamID %@, sendingStreamID %@ activeVideoStreams %@";
      long long v26 = v30;
      uint32_t v27 = 78;
    }
    _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v39, v27);
    goto LABEL_30;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = [(NSMutableDictionary *)self->_currentStreamSchedule objectForKeyedSubscript:v14];
  if (!v17 && ([v16 isTemporalScalingEnabled] & 1) == 0)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_17;
      }
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      __int16 v33 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      int v39 = 136316162;
      uint64_t v40 = v32;
      __int16 v41 = 2080;
      long long v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      __int16 v43 = 1024;
      int v44 = 489;
      __int16 v45 = 2112;
      id v46 = a3;
      __int16 v47 = 2112;
      long long v48 = v14;
      double v34 = " [%s] %s:%d Non temporal stream's schedule is nil for streamID %@, sendingStreamID %@";
      __int16 v35 = v33;
      uint32_t v36 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v28 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_17;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      double v38 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      int v39 = 136316674;
      uint64_t v40 = v37;
      __int16 v41 = 2080;
      long long v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      __int16 v43 = 1024;
      int v44 = 489;
      __int16 v45 = 2112;
      id v46 = v28;
      __int16 v47 = 2048;
      long long v48 = self;
      __int16 v49 = 2112;
      id v50 = a3;
      __int16 v51 = 2112;
      uint64_t v52 = v14;
      double v34 = " [%s] %s:%d %@(%p) Non temporal stream's schedule is nil for streamID %@, sendingStreamID %@";
      __int16 v35 = v38;
      uint32_t v36 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_ERROR, v34, (uint8_t *)&v39, v36);
LABEL_17:
    *a4 = 1;
    goto LABEL_18;
  }
  if (-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:](self, "shouldGenerateIDRWithStreamSchedule:", v17)|| [v16 isTemporalScalingEnabled])
  {
    goto LABEL_17;
  }
LABEL_18:

  return v16;
}

- (void)handleStreamsResetIDR
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  streamResetIDR = self->_streamResetIDR;
  uint64_t v5 = [(NSMutableArray *)streamResetIDR countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v36;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v36 != v7) {
        objc_enumerationMutation(streamResetIDR);
      }
      uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
      uint64_t v10 = [(NSMutableDictionary *)self->_activeVideoStreams objectForKeyedSubscript:v9];
      if (!v10)
      {
        if ((VCSessionUplinkVideoStreamController *)objc_opt_class() != self)
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v13 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v13 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_20;
          }
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          long long v19 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          int v24 = 136316162;
          uint64_t v25 = v18;
          __int16 v26 = 2080;
          uint32_t v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
          __int16 v28 = 1024;
          int v29 = 503;
          __int16 v30 = 2112;
          uint64_t v31 = v13;
          __int16 v32 = 2048;
          __int16 v33 = self;
          uint64_t v16 = " [%s] %s:%d %@(%p) Stream is nil";
          goto LABEL_42;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_20;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        int v24 = 136315650;
        uint64_t v25 = v14;
        __int16 v26 = 2080;
        uint32_t v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
        __int16 v28 = 1024;
        int v29 = 503;
        uint64_t v16 = " [%s] %s:%d Stream is nil";
LABEL_37:
        long long v21 = v15;
        uint32_t v22 = 28;
LABEL_43:
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v22);
        goto LABEL_20;
      }
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [(NSMutableDictionary *)self->_currentStreamSchedule objectForKeyedSubscript:v9];
      if (!v12 && ([v11 isTemporalScalingEnabled] & 1) == 0)
      {
        if ((VCSessionUplinkVideoStreamController *)objc_opt_class() != self)
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v17 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v17 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_20;
          }
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          long long v19 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          int v24 = 136316162;
          uint64_t v25 = v23;
          __int16 v26 = 2080;
          uint32_t v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
          __int16 v28 = 1024;
          int v29 = 507;
          __int16 v30 = 2112;
          uint64_t v31 = v17;
          __int16 v32 = 2048;
          __int16 v33 = self;
          uint64_t v16 = " [%s] %s:%d %@(%p) Non temporal stream's schedule stream is nil";
LABEL_42:
          long long v21 = v19;
          uint32_t v22 = 48;
          goto LABEL_43;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_20;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        int v24 = 136315650;
        uint64_t v25 = v20;
        __int16 v26 = 2080;
        uint32_t v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
        __int16 v28 = 1024;
        int v29 = 507;
        uint64_t v16 = " [%s] %s:%d Non temporal stream's schedule stream is nil";
        goto LABEL_37;
      }
      if (-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:](self, "shouldGenerateIDRWithStreamSchedule:", v12)|| [v11 isTemporalScalingEnabled])
      {
        if ([v11 state] == 2) {
          [v11 setPause:1];
        }
        if ([v11 state] == 4) {
          [v11 setPause:0];
        }
        [v3 addObject:v9];
      }
    }
    uint64_t v6 = [(NSMutableArray *)streamResetIDR countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_18:
  if ([v3 count]) {
    [(NSMutableArray *)self->_streamResetIDR removeObjectsInArray:v3];
  }
LABEL_20:
}

- (id)getMultiwayConfigForStreamID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInfoMap, "objectForKeyedSubscript:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = (void *)[v4 streamConfigs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v6) {
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v15;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v15 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) multiwayConfig];
    int v11 = [a3 intValue];
    if (v11 == [v10 idsStreamID]) {
      break;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v7) {
        goto LABEL_3;
      }
      break;
    }
  }
  if (!v10) {
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
  }
  return v10;
}

- (id)newVideoStreamKeyFrameScheduleWithStreamIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(VCSessionUplinkVideoStreamController *)self schedulerStreamWithVideoStream:[(VCSessionUplinkVideoStreamController *)self getMultiwayConfigForStreamID:v10]];
        if (v11) {
          [v5 setObject:v11 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)schedulerStreamWithVideoStream:(id)a3
{
  uint64_t v4 = 1000;
  if ([a3 keyFrameInterval]) {
    uint64_t v4 = 1000 * [a3 keyFrameInterval];
  }
  uint64_t v5 = [a3 framerate];
  uint64_t v6 = [a3 maxNetworkBitrate];

  return +[VCIDRSchedulerStream schedulerStreamWithKeyFrameInterval:v4 framerate:v5 weightFactor:v6];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)restart
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(VCSessionUplinkVideoStreamController *)self lock];
  if ([(NSMutableDictionary *)self->_activeVideoStreams count])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_pendingVideoStreams];
    uint64_t v4 = v3;
    if (v3)
    {
      [v3 addEntriesFromDictionary:self->_activeVideoStreams];
      [(VCSessionUplinkVideoStreamController *)self setPendingVideoStreamsInternal:v4];
      [(NSMutableDictionary *)self->_activeVideoStreams removeAllObjects];
      [(VCSessionUplinkVideoStreamController *)self setCachedActiveVideoStreams:self->_activeVideoStreams];
    }
    else
    {
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_4;
        }
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_4;
        }
        *(_DWORD *)uint64_t v13 = 136315650;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionUplinkVideoStreamController restart]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 573;
        uint64_t v8 = " [%s] %s:%d Could not allocate memory for pendingVideoStreams dictionary";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v5 = (__CFString *)[(VCSessionUplinkVideoStreamController *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v5 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_4;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_4;
        }
        *(_DWORD *)uint64_t v13 = 136316162;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionUplinkVideoStreamController restart]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 573;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        long long v15 = self;
        uint64_t v8 = " [%s] %s:%d %@(%p) Could not allocate memory for pendingVideoStreams dictionary";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
    }
LABEL_4:
  }
  [(VCSessionUplinkVideoStreamController *)self unlock];
}

- (BOOL)filterPendingTemporalStreams
{
  v2 = self;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = [(NSMutableDictionary *)self->_activeVideoStreams allValues];
  pendingVideoStreams = v2->_pendingVideoStreams;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__VCSessionUplinkVideoStreamController_filterPendingTemporalStreams__block_invoke;
  v6[3] = &unk_1E6DB56D8;
  v6[4] = v3;
  v6[5] = v2;
  v6[6] = &v7;
  [(NSMutableDictionary *)pendingVideoStreams enumerateKeysAndObjectsUsingBlock:v6];
  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __68__VCSessionUplinkVideoStreamController_filterPendingTemporalStreams__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if (result)
  {
    uint64_t result = [a3 isTemporalScalingEnabled];
    if (result)
    {
      uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 40) + 40) allKeysForObject:a3];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
            int v13 = [a2 intValue];
            if (v13 != [v12 intValue])
            {
              [*(id *)(*(void *)(a1 + 40) + 40) setObject:0 forKeyedSubscript:v12];
              [*(id *)(*(void *)(a1 + 40) + 40) setObject:a3 forKeyedSubscript:a2];
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
        }
        while (v9);
      }
      return [*(id *)(a1 + 40) setCachedActiveVideoStreams:*(void *)(*(void *)(a1 + 40) + 40)];
    }
  }
  return result;
}

- (NSDictionary)pendingVideoStreams
{
  return &self->_pendingVideoStreams->super;
}

- (unsigned)captureFrameRate
{
  return self->_captureFrameRate;
}

- (void)setCaptureFrameRate:(unsigned int)a3
{
  self->_captureFrameRate = a3;
}

- (NSArray)streamIDsCell
{
  return self->_streamIDsCell;
}

- (NSArray)streamIDsWifi
{
  return self->_streamIDsWifi;
}

- (float)currentFrameTime
{
  return self->_currentFrameTime;
}

- (BOOL)dynamicVideoPriorityEnabled
{
  return self->_dynamicVideoPriorityEnabled;
}

- (void)setDynamicVideoPriorityEnabled:(BOOL)a3
{
  self->_dynamicVideoPriorityEnabled = a3;
}

- (BOOL)shouldSkipIDRScheduler
{
  return self->_shouldSkipIDRScheduler;
}

- (void)setShouldSkipIDRScheduler:(BOOL)a3
{
  self->_shouldSkipIDRScheduler = a3;
}

- (void)initWithVideoStreams:streamInfos:reportingAgent:delegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize VCSessionUplinkVideoStreamController. Invalid RTCP config.", v2, v3, v4, v5, v6);
}

- (void)setStreamIDsCell:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 105;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d streamIDsCell is nil", v1, 0x1Cu);
}

- (void)setStreamIDsWifi:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 130;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d streamIDsWifi is nil", v1, 0x1Cu);
}

- (void)setCurrentFrameTime:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
  OUTLINED_FUNCTION_3();
  int v7 = 204;
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d FrameTime is %f", (uint8_t *)&v3, 0x26u);
}

- (void)setIsLocalOnCellular:cappedVideoStreamIDs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d schedule for anchor stream %@ on Wifi not found");
}

- (void)setIsLocalOnCellular:cappedVideoStreamIDs:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d schedule for anchor stream %@ on cell not found");
}

- (void)setStreamsUseRTCPWithStreamInfos:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d StreamInfo array is nil, empty, or its streamConfigs array is nil or empty.", v2, v3, v4, v5, v6);
}

- (void)anchorStreamIDWithCappedVideoStreamIDs:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d no streams available", v2, v3, v4, v5, v6);
}

- (void)resumeStreams
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Non temporal stream's schedule is nil for streamID %@");
}

- (void)videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Requesting a streamID %@ that is not in any of the compound streamIDs");
}

@end