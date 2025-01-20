@interface AVCSessionParticipant
+ (BOOL)isMediaStateAPISupportedForMediaType:(unsigned int)a3;
+ (id)archiveMediaStates:(id)a3;
+ (id)loopbackNegotiationDataWithData:(id)a3;
+ (id)unarchiveMediaStatesWithData:(id)a3;
+ (unsigned)defaultStateForMediaType:(unsigned int)a3 isLocal:(BOOL)a4;
- (AVCSessionParticipant)initWithParticipantID:(unint64_t)a3 data:(id)a4 delegate:(id)a5 queue:(id)a6;
- (AVCSessionParticipantDelegate)delegate;
- (BOOL)configurationInProgress;
- (BOOL)generateMediaStateEntryForMediaType:(unsigned int)a3;
- (BOOL)hasPendingChanges;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioMuted;
- (BOOL)isAudioPaused;
- (BOOL)isConnectedToSession;
- (BOOL)isEnabledMediaType:(unsigned int)a3;
- (BOOL)isOneToOneEnabled;
- (BOOL)isPausedMediaType:(unsigned int)a3;
- (BOOL)isScreenControlEnabled;
- (BOOL)isScreenEnabled;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)remoteScreenEnabled;
- (BOOL)setupMediaStates;
- (NSData)frequencyLevels;
- (NSData)negotiationData;
- (NSDictionary)config;
- (NSString)description;
- (NSString)uuid;
- (OS_dispatch_queue)delegateNotificationQueue;
- (OS_dispatch_queue)stateQueue;
- (VCXPCClientShared)sharedXPCConnection;
- (float)volume;
- (id)newNSErrorWithErrorDictionary:(id)a3;
- (int64_t)screenToken;
- (int64_t)streamTokenForStreamGroupID:(unsigned int)a3;
- (int64_t)videoToken;
- (tagAVCPositionalInfo)videoPositionalInfo;
- (unint64_t)participantID;
- (unint64_t)spatialAudioSourceID;
- (unint64_t)spatialAudioSourceIDForMediaType:(unsigned int)a3;
- (unsigned)dispatchedMediaStateForMediaType:(unsigned int)a3;
- (unsigned)mediaStateForMediaType:(unsigned int)a3;
- (unsigned)prominenceIndex;
- (unsigned)videoQuality;
- (unsigned)visibilityIndex;
- (void)appendConfigurationToXPCConfiguration:(id)a3;
- (void)completeAudioEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)completeAudioPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)completeScreenEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)completeSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)completeVideoEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)completeVideoPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)dealloc;
- (void)deregisterFromNotifications;
- (void)dispatchedCompleteAudioEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)dispatchedCompleteAudioPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)dispatchedCompleteScreenEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)dispatchedCompleteVideoEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)dispatchedCompleteVideoPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5;
- (void)dispatchedLegacySetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)dispatchedSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)handleLegacyTransitionsForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4 previousState:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)printMediaStates;
- (void)registerBlocksForNotifications;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioMuted:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setConfigurationInProgress:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHasPendingChanges:(BOOL)a3;
- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)setMediaType:(unsigned int)a3 enabled:(BOOL)a4 mediaString:(const char *)a5 xpcMessageKey:(char *)a6 xpcOperationKey:(id)a7 completionBlock:(id)a8;
- (void)setMediaType:(unsigned int)a3 paused:(BOOL)a4 mediaString:(const char *)a5 xpcMessageKey:(char *)a6 xpcOperationKey:(id)a7 completionBlock:(id)a8;
- (void)setMediaTypeToSpatialSourceIDMap:(id)a3;
- (void)setOneToOneEnabled:(BOOL)a3;
- (void)setProminenceIndex:(unsigned int)a3;
- (void)setRemoteScreenEnabled:(BOOL)a3;
- (void)setScreenControlEnabled:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setScreenToken:(int64_t)a3;
- (void)setSharedXPCConnection:(id)a3;
- (void)setStateQueue:(id)a3;
- (void)setStreamTokens:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVideoPositionalInfo:(tagAVCPositionalInfo *)a3;
- (void)setVideoQuality:(unsigned __int8)a3;
- (void)setVideoToken:(int64_t)a3;
- (void)setVisibilityIndex:(unsigned int)a3;
- (void)setVolume:(float)a3;
- (void)setupConfig;
- (void)setupMediaStates;
- (void)setupNotificationQueue:(id)a3;
- (void)stateTransitionForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4 previousState:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)storeMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)updateLegacyStates;
@end

@implementation AVCSessionParticipant

- (AVCSessionParticipant)initWithParticipantID:(unint64_t)a3 data:(id)a4 delegate:(id)a5 queue:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)AVCSessionParticipant;
  v10 = [(AVCSessionParticipant *)&v38 init];
  if (v10)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v40 = v12;
          __int16 v41 = 2080;
          v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
          __int16 v43 = 1024;
          int v44 = 81;
          v14 = " [%s] %s:%d ";
          v15 = v13;
          uint32_t v16 = 28;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v11 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
      }
      else {
        v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v40 = v17;
          __int16 v41 = 2080;
          v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
          __int16 v43 = 1024;
          int v44 = 81;
          __int16 v45 = 2112;
          v46 = v11;
          __int16 v47 = 2048;
          v48 = v10;
          v14 = " [%s] %s:%d %@(%p) ";
          v15 = v18;
          uint32_t v16 = 48;
          goto LABEL_12;
        }
      }
    }
    v10->_videoQuality = 5;
    v10->_idsParticipantID = a3;
    if (a4)
    {
      v19 = objc_alloc_init(VCPositionalInfo);
      v10->_videoPositionalInfo = v19;
      if (v19)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v10->_mediaStates = v20;
        if (v20)
        {
          if (VCDefaults_GetBoolValueForKey(@"forceLoopback", 0)) {
            a4 = +[AVCSessionParticipant loopbackNegotiationDataWithData:a4];
          }
          uint64_t v21 = objc_msgSend((id)objc_msgSend(+[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", a4), "objectForKeyedSubscript:", @"vcSessionParticipantKeyUUID"), "copy");
          v10->_participantID = (NSString *)v21;
          if (v21)
          {
            v22 = (NSData *)+[VCSessionParticipant participantDataWithParticipantData:a4 isReinit:a3 == 0];
            v10->_participantData = v22;
            if (v22)
            {
              if ([(AVCSessionParticipant *)v10 setupMediaStates])
              {
                pthread_mutex_init(&v10->_mediaStateMutex, 0);
                objc_storeWeak(&v10->_delegate, a5);
                [(AVCSessionParticipant *)v10 setupNotificationQueue:a6];
                [(AVCSessionParticipant *)v10 setupConfig];
                return v10;
              }
              if ((AVCSessionParticipant *)objc_opt_class() == v10)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.6();
                  }
                }
                goto LABEL_84;
              }
              if (objc_opt_respondsToSelector()) {
                v29 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
              }
              else {
                v29 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v37 = VRTraceErrorLogLevelToCSTR();
                v31 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v40 = v37;
                  __int16 v41 = 2080;
                  v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
                  __int16 v43 = 1024;
                  int v44 = 99;
                  __int16 v45 = 2112;
                  v46 = v29;
                  __int16 v47 = 2048;
                  v48 = v10;
                  v32 = " [%s] %s:%d %@(%p) Failed to initialize the media states";
                  goto LABEL_83;
                }
              }
LABEL_84:

              return 0;
            }
            if ((AVCSessionParticipant *)objc_opt_class() == v10)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.5();
                }
              }
              goto LABEL_84;
            }
            if (objc_opt_respondsToSelector()) {
              v28 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
            }
            else {
              v28 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_84;
            }
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_84;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v40 = v36;
            __int16 v41 = 2080;
            v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
            __int16 v43 = 1024;
            int v44 = 97;
            __int16 v45 = 2112;
            v46 = v28;
            __int16 v47 = 2048;
            v48 = v10;
            v32 = " [%s] %s:%d %@(%p) The participant data is nil";
          }
          else
          {
            if ((AVCSessionParticipant *)objc_opt_class() == v10)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:].cold.4();
                }
              }
              goto LABEL_84;
            }
            if (objc_opt_respondsToSelector()) {
              v27 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
            }
            else {
              v27 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_84;
            }
            uint64_t v35 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_84;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v40 = v35;
            __int16 v41 = 2080;
            v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
            __int16 v43 = 1024;
            int v44 = 95;
            __int16 v45 = 2112;
            v46 = v27;
            __int16 v47 = 2048;
            v48 = v10;
            v32 = " [%s] %s:%d %@(%p) The participant ID is nil";
          }
        }
        else
        {
          if ((AVCSessionParticipant *)objc_opt_class() == v10)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]();
              }
            }
            goto LABEL_84;
          }
          if (objc_opt_respondsToSelector()) {
            v26 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
          }
          else {
            v26 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_84;
          }
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_84;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v40 = v34;
          __int16 v41 = 2080;
          v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
          __int16 v43 = 1024;
          int v44 = 88;
          __int16 v45 = 2112;
          v46 = v26;
          __int16 v47 = 2048;
          v48 = v10;
          v32 = " [%s] %s:%d %@(%p) Failed to allocate the media states dictionary";
        }
      }
      else
      {
        if ((AVCSessionParticipant *)objc_opt_class() == v10)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]();
            }
          }
          goto LABEL_84;
        }
        if (objc_opt_respondsToSelector()) {
          v25 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
        }
        else {
          v25 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_84;
        }
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_84;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v40 = v33;
        __int16 v41 = 2080;
        v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
        __int16 v43 = 1024;
        int v44 = 86;
        __int16 v45 = 2112;
        v46 = v25;
        __int16 v47 = 2048;
        v48 = v10;
        v32 = " [%s] %s:%d %@(%p) Failed to allocate the positional info";
      }
    }
    else
    {
      if ((AVCSessionParticipant *)objc_opt_class() == v10)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]();
          }
        }
        goto LABEL_84;
      }
      if (objc_opt_respondsToSelector()) {
        v24 = (__CFString *)[(AVCSessionParticipant *)v10 performSelector:sel_logPrefix];
      }
      else {
        v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_84;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_84;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v40 = v30;
      __int16 v41 = 2080;
      v42 = "-[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]";
      __int16 v43 = 1024;
      int v44 = 84;
      __int16 v45 = 2112;
      v46 = v24;
      __int16 v47 = 2048;
      v48 = v10;
      v32 = " [%s] %s:%d %@(%p) Participant Data is nil";
    }
LABEL_83:
    _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x30u);
    goto LABEL_84;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue) {
    dispatch_release(delegateNotificationQueue);
  }
  objc_storeWeak((id *)&self->_connection, 0);

  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  pthread_mutex_destroy(&self->_mediaStateMutex);
  v5.receiver = self;
  v5.super_class = (Class)AVCSessionParticipant;
  [(AVCSessionParticipant *)&v5 dealloc];
}

+ (BOOL)isMediaStateAPISupportedForMediaType:(unsigned int)a3
{
  return a3 - 4 < 5;
}

- (NSString)description
{
  BOOL v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4B90), "unsignedIntValue") != 0;
  BOOL v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4BA8), "unsignedIntValue") != 0;
  objc_super v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  return (NSString *)[v5 stringWithFormat:@"%@[%p] idsParticipantID[%llu] _participantID[%@] _hasPendingChanges[%d] audioEnabled[%d] videoEnabled[%d] videoQuality[%d] visibilityIndex[%d] promienceIndex[%d] participantData[%@]", NSStringFromClass(v6), self, self->_idsParticipantID, self->_participantID, self->_hasPendingChanges, v3, v4, self->_videoQuality, self->_visibilityIndex, self->_prominenceIndex, self->_participantData];
}

- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = VCSessionMediaType_FromAVCSessionMediaType(*(uint64_t *)&a4);
  uint64_t v7 = VCSessionMediaState_FromAVCSessionMediaState(v4);
  if (![(AVCSessionParticipant *)self isConnectedToSession])
  {
    pthread_mutex_lock(&self->_mediaStateMutex);
    uint64_t v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6)), "unsignedIntValue");
    v10 = VCSessionMediaState_Name(v7);
    v11 = VCSessionMediaType_Name(v6);
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_15;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      participantID = self->_participantID;
      *(_DWORD *)buf = 136316418;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      v28 = "-[AVCSessionParticipant setMediaState:forMediaType:]";
      __int16 v29 = 1024;
      int v30 = 184;
      __int16 v31 = 2112;
      v32 = (__CFString *)participantID;
      __int16 v33 = 2112;
      uint64_t v34 = (AVCSessionParticipant *)v11;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      uint32_t v16 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ mediaState=%@";
      uint64_t v17 = v14;
      uint32_t v18 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_15;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v21 = self->_participantID;
      *(_DWORD *)buf = 136316930;
      uint64_t v26 = v19;
      __int16 v27 = 2080;
      v28 = "-[AVCSessionParticipant setMediaState:forMediaType:]";
      __int16 v29 = 1024;
      int v30 = 184;
      __int16 v31 = 2112;
      v32 = v12;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      __int16 v35 = 2112;
      uint64_t v36 = (__CFString *)v21;
      __int16 v37 = 2112;
      objc_super v38 = v11;
      __int16 v39 = 2112;
      uint64_t v40 = v10;
      uint32_t v16 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ mediaState=%@";
      uint64_t v17 = v20;
      uint32_t v18 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_15:
    [(AVCSessionParticipant *)self storeMediaState:v7 forMediaType:v6];
    pthread_mutex_unlock(&self->_mediaStateMutex);
    [(AVCSessionParticipant *)self stateTransitionForMediaType:v6 mediaState:v7 previousState:v9 didSucceed:1 error:0];
    return;
  }
  stateQueue = self->_stateQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__AVCSessionParticipant_setMediaState_forMediaType___block_invoke;
  v22[3] = &unk_1E6DB4568;
  v22[4] = self;
  int v23 = v6;
  int v24 = v7;
  if (stateQueue) {
    dispatch_async(stateQueue, v22);
  }
}

uint64_t __52__AVCSessionParticipant_setMediaState_forMediaType___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  v2 = VCSessionMediaType_Name(*(unsigned int *)(a1 + 40));
  BOOL v3 = VCSessionMediaState_Name(*(unsigned int *)(a1 + 44));
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40))), "unsignedIntValue");
  objc_super v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)));
  if (v5 && [v5 unsignedIntValue] == *(_DWORD *)(a1 + 44))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_28;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)__int16 v33 = 136316418;
      *(void *)&v33[4] = v23;
      *(_WORD *)&v33[12] = 2080;
      *(void *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
      *(_WORD *)&v33[22] = 1024;
      LODWORD(v34) = 199;
      WORD2(v34) = 2112;
      *(void *)((char *)&v34 + 6) = v25;
      HIWORD(v34) = 2112;
      __int16 v35 = v2;
      *(_WORD *)uint64_t v36 = 2112;
      *(void *)&v36[2] = v3;
      uint64_t v26 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ is already in mediaState=%@";
      __int16 v27 = v24;
      uint32_t v28 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_28;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      int v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      __int16 v31 = *(__CFString **)(a1 + 32);
      data = v31->data;
      *(_DWORD *)__int16 v33 = 136316930;
      *(void *)&v33[4] = v29;
      *(_WORD *)&v33[12] = 2080;
      *(void *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
      *(_WORD *)&v33[22] = 1024;
      LODWORD(v34) = 199;
      WORD2(v34) = 2112;
      *(void *)((char *)&v34 + 6) = v6;
      HIWORD(v34) = 2048;
      __int16 v35 = v31;
      *(_WORD *)uint64_t v36 = 2112;
      *(void *)&v36[2] = data;
      *(_WORD *)&v36[10] = 2112;
      *(void *)&v36[12] = v2;
      *(_WORD *)&v36[20] = 2112;
      *(void *)&v36[22] = v3;
      uint64_t v26 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ is already in mediaState=%@";
      __int16 v27 = v30;
      uint32_t v28 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, v33, v28);
LABEL_28:
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
    return [*(id *)(a1 + 32) stateTransitionForMediaType:*(unsigned int *)(a1 + 40) mediaState:*(unsigned int *)(a1 + 44) previousState:v4 didSucceed:1 error:0];
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_17;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)__int16 v33 = 136316418;
    *(void *)&v33[4] = v8;
    *(_WORD *)&v33[12] = 2080;
    *(void *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
    *(_WORD *)&v33[22] = 1024;
    LODWORD(v34) = 205;
    WORD2(v34) = 2112;
    *(void *)((char *)&v34 + 6) = v10;
    HIWORD(v34) = 2112;
    __int16 v35 = v2;
    *(_WORD *)uint64_t v36 = 2112;
    *(void *)&v36[2] = v3;
    v11 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ mediaState=%@";
    uint64_t v12 = v9;
    uint32_t v13 = 58;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_17;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    uint32_t v16 = *(__CFString **)(a1 + 32);
    uint64_t v17 = v16->data;
    *(_DWORD *)__int16 v33 = 136316930;
    *(void *)&v33[4] = v14;
    *(_WORD *)&v33[12] = 2080;
    *(void *)&v33[14] = "-[AVCSessionParticipant setMediaState:forMediaType:]_block_invoke";
    *(_WORD *)&v33[22] = 1024;
    LODWORD(v34) = 205;
    WORD2(v34) = 2112;
    *(void *)((char *)&v34 + 6) = v7;
    HIWORD(v34) = 2048;
    __int16 v35 = v16;
    *(_WORD *)uint64_t v36 = 2112;
    *(void *)&v36[2] = v17;
    *(_WORD *)&v36[10] = 2112;
    *(void *)&v36[12] = v2;
    *(_WORD *)&v36[20] = 2112;
    *(void *)&v36[22] = v3;
    v11 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ mediaState=%@";
    uint64_t v12 = v15;
    uint32_t v13 = 78;
  }
  _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v33, v13);
LABEL_17:
  BOOL v18 = +[AVCSessionParticipant isMediaStateAPISupportedForMediaType:](AVCSessionParticipant, "isMediaStateAPISupportedForMediaType:", *(unsigned int *)(a1 + 40), *(_OWORD *)v33, *(void *)&v33[16], v34, v35, *(_OWORD *)v36, *(_OWORD *)&v36[16]);
  uint64_t v19 = *(void **)(a1 + 32);
  uint64_t v21 = *(unsigned int *)(a1 + 40);
  uint64_t v20 = *(unsigned int *)(a1 + 44);
  if (v18) {
    return [v19 dispatchedSetMediaState:v20 forMediaType:v21];
  }
  else {
    return [v19 dispatchedLegacySetMediaState:v20 forMediaType:v21];
  }
}

- (unsigned)mediaStateForMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_mediaStateMutex = &self->_mediaStateMutex;
  pthread_mutex_lock(&self->_mediaStateMutex);
  uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "unsignedIntValue");
  pthread_mutex_unlock(p_mediaStateMutex);

  return VCSessionMediaState_FromAVCSessionMediaState(v6);
}

- (void)setAudioMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__AVCSessionParticipant_setAudioMuted___block_invoke;
    block[3] = &unk_1E6DB3DF0;
    block[4] = self;
    BOOL v9 = v3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    self->_audioMuted = v3;
    uint64_t v6 = [NSNumber numberWithBool:v3];
    participantConfig = self->_participantConfig;
    [(NSMutableDictionary *)participantConfig setObject:v6 forKeyedSubscript:@"vcSessionParameterMute"];
  }
}

void __39__AVCSessionParticipant_setAudioMuted___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 104);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      int v16 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v14;
      __int16 v32 = 2080;
      __int16 v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
      __int16 v34 = 1024;
      int v35 = 234;
      __int16 v36 = 1024;
      LODWORD(v37) = v16;
      uint64_t v17 = " [%s] %s:%d audioMuted[%d]";
      BOOL v18 = v15;
      uint32_t v19 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      uint64_t v26 = *(void *)(a1 + 32);
      int v27 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v24;
      __int16 v32 = 2080;
      __int16 v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
      __int16 v34 = 1024;
      int v35 = 234;
      __int16 v36 = 2112;
      uint64_t v37 = v7;
      __int16 v38 = 2048;
      uint64_t v39 = v26;
      __int16 v40 = 1024;
      int v41 = v27;
      uint64_t v17 = " [%s] %s:%d %@(%p) audioMuted[%d]";
      BOOL v18 = v25;
      uint32_t v19 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_24:
    *(unsigned char *)(*(void *)(a1 + 32) + 104) = *(unsigned char *)(a1 + 40);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), @"vcSessionParameterMute");
    v29[1] = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40), @"vcSessionParticipantID", @"vcSessionParameterMute", *(void *)(*(void *)(a1 + 32) + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetMute", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 2));
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      BOOL v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v31 = v8;
        __int16 v32 = 2080;
        __int16 v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
        __int16 v34 = 1024;
        int v35 = 231;
        __int16 v36 = 1024;
        LODWORD(v37) = v10;
        v11 = " [%s] %s:%d Participant audio is already muted [%d]";
        uint64_t v12 = v9;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v31 = v20;
        __int16 v32 = 2080;
        __int16 v33 = "-[AVCSessionParticipant setAudioMuted:]_block_invoke";
        __int16 v34 = 1024;
        int v35 = 231;
        __int16 v36 = 2112;
        uint64_t v37 = v6;
        __int16 v38 = 2048;
        uint64_t v39 = v22;
        __int16 v40 = 1024;
        int v41 = v23;
        v11 = " [%s] %s:%d %@(%p) Participant audio is already muted [%d]";
        uint64_t v12 = v21;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (BOOL)isAudioEnabled
{
  return [(AVCSessionParticipant *)self isEnabledMediaType:0];
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7[5] = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(AVCSessionParticipant *)self mediaStateForMediaType:0];
  if (v3 && v5 == 2)
  {
    uint64_t v6 = [(AVCSessionParticipant *)self delegateNotificationQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__AVCSessionParticipant_setAudioEnabled___block_invoke;
    v7[3] = &unk_1E6DB3DC8;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)v6, v7);
  }
  else
  {
    [(AVCSessionParticipant *)self setMediaState:v3 forMediaType:0];
  }
}

uint64_t __41__AVCSessionParticipant_setAudioEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleLegacyTransitionsForMediaType:0 mediaState:1 previousState:1 didSucceed:1 error:0];
}

- (BOOL)isVideoEnabled
{
  return [(AVCSessionParticipant *)self isEnabledMediaType:1];
}

- (void)setVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7[5] = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(AVCSessionParticipant *)self mediaStateForMediaType:1];
  if (v3 && v5 == 2)
  {
    uint64_t v6 = [(AVCSessionParticipant *)self delegateNotificationQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__AVCSessionParticipant_setVideoEnabled___block_invoke;
    v7[3] = &unk_1E6DB3DC8;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)v6, v7);
  }
  else
  {
    [(AVCSessionParticipant *)self setMediaState:v3 forMediaType:1];
  }
}

uint64_t __41__AVCSessionParticipant_setVideoEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleLegacyTransitionsForMediaType:1 mediaState:1 previousState:1 didSucceed:1 error:0];
}

- (BOOL)isScreenEnabled
{
  return [(AVCSessionParticipant *)self isEnabledMediaType:2];
}

- (void)setScreenEnabled:(BOOL)a3
{
}

- (BOOL)isAudioPaused
{
  return [(AVCSessionParticipant *)self isPausedMediaType:0];
}

- (void)setAudioPaused:(BOOL)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  unsigned int v6 = [(AVCSessionParticipant *)self mediaStateForMediaType:0];
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026 detailCode:0 description:@"Invalid transition"];
    uint64_t v7 = [(AVCSessionParticipant *)self delegateNotificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVCSessionParticipant_setAudioPaused___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = v9;
    uint64_t v8 = block;
    goto LABEL_9;
  }
  if (v6 == 1 && !a3)
  {
    uint64_t v7 = [(AVCSessionParticipant *)self delegateNotificationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__AVCSessionParticipant_setAudioPaused___block_invoke_2;
    v10[3] = &unk_1E6DB3DC8;
    v10[4] = self;
    uint64_t v8 = v10;
LABEL_9:
    dispatch_async((dispatch_queue_t)v7, v8);
    return;
  }

  [(AVCSessionParticipant *)self setMediaState:v5 forMediaType:0];
}

uint64_t __40__AVCSessionParticipant_setAudioPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleLegacyTransitionsForMediaType:0 mediaState:1 previousState:2 didSucceed:0 error:*(void *)(a1 + 40)];
}

uint64_t __40__AVCSessionParticipant_setAudioPaused___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleLegacyTransitionsForMediaType:0 mediaState:1 previousState:2 didSucceed:1 error:0];
}

- (BOOL)isVideoPaused
{
  return [(AVCSessionParticipant *)self isPausedMediaType:1];
}

- (void)setVideoPaused:(BOOL)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  unsigned int v6 = [(AVCSessionParticipant *)self mediaStateForMediaType:1];
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026 detailCode:0 description:@"Invalid transition"];
    uint64_t v7 = [(AVCSessionParticipant *)self delegateNotificationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVCSessionParticipant_setVideoPaused___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = v9;
    uint64_t v8 = block;
    goto LABEL_9;
  }
  if (v6 == 1 && !a3)
  {
    uint64_t v7 = [(AVCSessionParticipant *)self delegateNotificationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__AVCSessionParticipant_setVideoPaused___block_invoke_2;
    v10[3] = &unk_1E6DB3DC8;
    v10[4] = self;
    uint64_t v8 = v10;
LABEL_9:
    dispatch_async((dispatch_queue_t)v7, v8);
    return;
  }

  [(AVCSessionParticipant *)self setMediaState:v5 forMediaType:1];
}

uint64_t __40__AVCSessionParticipant_setVideoPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleLegacyTransitionsForMediaType:1 mediaState:1 previousState:2 didSucceed:0 error:*(void *)(a1 + 40)];
}

uint64_t __40__AVCSessionParticipant_setVideoPaused___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleLegacyTransitionsForMediaType:1 mediaState:1 previousState:2 didSucceed:1 error:0];
}

- (void)setVolume:(float)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__AVCSessionParticipant_setVolume___block_invoke;
    block[3] = &unk_1E6DB3F08;
    block[4] = self;
    float v10 = a3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    self->_volume = a3;
    *(float *)&double v5 = a3;
    uint64_t v7 = [NSNumber numberWithFloat:v5];
    participantConfig = self->_participantConfig;
    [(NSMutableDictionary *)participantConfig setObject:v7 forKeyedSubscript:@"vcSessionParameterVolume"];
  }
}

void __35__AVCSessionParticipant_setVolume___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  float v2 = *(float *)(*(void *)(a1 + 32) + 108);
  float v3 = *(float *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      double v21 = *(float *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v19;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 341;
      __int16 v39 = 2048;
      double v40 = v21;
      uint64_t v22 = " [%s] %s:%d volume[%f]";
      int v23 = v20;
      uint32_t v24 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      double v28 = *(float *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v34 = v25;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 341;
      __int16 v39 = 2112;
      double v40 = *(double *)&v7;
      __int16 v41 = 2048;
      uint64_t v42 = v27;
      __int16 v43 = 2048;
      double v44 = v28;
      uint64_t v22 = " [%s] %s:%d %@(%p) volume[%f]";
      int v23 = v26;
      uint32_t v24 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_24:
    *(_DWORD *)(*(void *)(a1 + 32) + 108) = *(_DWORD *)(a1 + 40);
    LODWORD(v18) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v18), @"vcSessionParameterVolume");
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 16);
    v31[1] = @"vcSessionParameterVolume";
    v32[0] = v29;
    v31[0] = @"vcSessionParticipantID";
    LODWORD(v30) = *(_DWORD *)(a1 + 40);
    v32[1] = objc_msgSend(NSNumber, "numberWithFloat:", v30, @"vcSessionParticipantID", @"vcSessionParameterVolume", v29);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetVolume", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v10 = *(float *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v34 = v8;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 338;
        __int16 v39 = 2048;
        double v40 = v10;
        uint64_t v11 = " [%s] %s:%d Participant volume is already [%f]";
        uint64_t v12 = v9;
        uint32_t v13 = 38;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      unsigned int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        double v17 = *(float *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v14;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVCSessionParticipant setVolume:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 338;
        __int16 v39 = 2112;
        double v40 = *(double *)&v6;
        __int16 v41 = 2048;
        uint64_t v42 = v16;
        __int16 v43 = 2048;
        double v44 = v17;
        uint64_t v11 = " [%s] %s:%d %@(%p) Participant volume is already [%f]";
        uint64_t v12 = v15;
        uint32_t v13 = 58;
        goto LABEL_15;
      }
    }
  }
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__AVCSessionParticipant_setVideoQuality___block_invoke;
    block[3] = &unk_1E6DB3DF0;
    block[4] = self;
    char v9 = v3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    self->_videoQuality = v3;
    uint64_t v6 = [NSNumber numberWithUnsignedChar:v3];
    participantConfig = self->_participantConfig;
    [(NSMutableDictionary *)participantConfig setObject:v6 forKeyedSubscript:@"vcSessionParameterVideoQuality"];
  }
}

void __41__AVCSessionParticipant_setVideoQuality___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  float v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v43 = v4;
        __int16 v44 = 2080;
        uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 358;
        __int16 v48 = 1024;
        LODWORD(v49) = v6;
        uint64_t v7 = " [%s] %s:%d videoQuality[%d]";
        uint64_t v8 = v5;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        int v13 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v43 = v10;
        __int16 v44 = 2080;
        uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 358;
        __int16 v48 = 2112;
        uint64_t v49 = v3;
        __int16 v50 = 2048;
        id v51 = v12;
        __int16 v52 = 1024;
        int v53 = v13;
        uint64_t v7 = " [%s] %s:%d %@(%p) videoQuality[%d]";
        uint64_t v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  int v14 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v14 == *(unsigned __int8 *)(v15 + 80))
  {
    if ((id)objc_opt_class() != *v2)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        uint64_t v27 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          id v28 = *v2;
          int v29 = *((unsigned __int8 *)*v2 + 80);
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 360;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          __int16 v50 = 2048;
          id v51 = v28;
          __int16 v52 = 1024;
          int v53 = v29;
          int v23 = " [%s] %s:%d %@(%p) videoQuality is already at %d";
          uint32_t v24 = v26;
          goto LABEL_38;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v38 = *v2;
          int v39 = *((unsigned __int8 *)*v2 + 80);
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 360;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          __int16 v50 = 2048;
          id v51 = v38;
          __int16 v52 = 1024;
          int v53 = v39;
          _os_log_debug_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) videoQuality is already at %d", buf, 0x36u);
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    double v21 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __41__AVCSessionParticipant_setVideoQuality___block_invoke_cold_1();
      }
      return;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = *((unsigned __int8 *)*v2 + 80);
    *(_DWORD *)buf = 136315906;
    uint64_t v43 = v19;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
    __int16 v46 = 1024;
    int v47 = 360;
    __int16 v48 = 1024;
    LODWORD(v49) = v22;
    int v23 = " [%s] %s:%d videoQuality is already at %d";
    uint32_t v24 = v20;
LABEL_33:
    uint32_t v33 = 34;
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v33);
    return;
  }
  *(unsigned char *)(v15 + 80) = v14;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 40)), @"vcSessionParameterVideoQuality");
  uint64_t v17 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v17 + 112))
  {
    v41[1] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", *(unsigned __int8 *)(v17 + 80), @"vcSessionParticipantID", @"vcSessionParameterVideoQuality", *(void *)(v17 + 16));
    objc_msgSend((id)objc_msgSend(*v2, "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetVideoQuality", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v41, &v40, 2));
    return;
  }
  *(unsigned char *)(v17 + 113) = 1;
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v32 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v43 = v30;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
    __int16 v46 = 1024;
    int v47 = 370;
    __int16 v48 = 1024;
    LODWORD(v49) = v32;
    int v23 = " [%s] %s:%d videoQuality[%d] is cached until endParticipantConfiguration is called.";
    uint32_t v24 = v31;
    goto LABEL_33;
  }
  if (objc_opt_respondsToSelector()) {
    double v18 = (__CFString *)[*v2 performSelector:sel_logPrefix];
  }
  else {
    double v18 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    __int16 v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = *(void **)(a1 + 32);
      int v37 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v43 = v34;
      __int16 v44 = 2080;
      uint64_t v45 = "-[AVCSessionParticipant setVideoQuality:]_block_invoke";
      __int16 v46 = 1024;
      int v47 = 370;
      __int16 v48 = 2112;
      uint64_t v49 = v18;
      __int16 v50 = 2048;
      id v51 = v36;
      __int16 v52 = 1024;
      int v53 = v37;
      int v23 = " [%s] %s:%d %@(%p) videoQuality[%d] is cached until endParticipantConfiguration is called.";
      uint32_t v24 = v35;
LABEL_38:
      uint32_t v33 = 54;
      goto LABEL_39;
    }
  }
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AVCSessionParticipant_setVisibilityIndex___block_invoke;
    block[3] = &unk_1E6DB3F08;
    block[4] = self;
    int v9 = v3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    self->_visibilityIndex = v3;
    [(VCPositionalInfo *)self->_videoPositionalInfo setIsVisible:v3 == 0];
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
    participantConfig = self->_participantConfig;
    [(NSMutableDictionary *)participantConfig setObject:v6 forKeyedSubscript:@"vcSessionParameterVisibilityIndex"];
  }
}

void __44__AVCSessionParticipant_setVisibilityIndex___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  float v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v43 = v4;
        __int16 v44 = 2080;
        uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 385;
        __int16 v48 = 1024;
        LODWORD(v49) = v6;
        uint64_t v7 = " [%s] %s:%d visibilityIndex[%d]";
        uint64_t v8 = v5;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        int v13 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v43 = v10;
        __int16 v44 = 2080;
        uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 385;
        __int16 v48 = 2112;
        uint64_t v49 = v3;
        __int16 v50 = 2048;
        id v51 = v12;
        __int16 v52 = 1024;
        int v53 = v13;
        uint64_t v7 = " [%s] %s:%d %@(%p) visibilityIndex[%d]";
        uint64_t v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  int v14 = *(_DWORD *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v14 == *(_DWORD *)(v15 + 84))
  {
    if ((id)objc_opt_class() != *v2)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        uint64_t v27 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          id v28 = *v2;
          int v29 = *((_DWORD *)*v2 + 21);
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 387;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          __int16 v50 = 2048;
          id v51 = v28;
          __int16 v52 = 1024;
          int v53 = v29;
          int v23 = " [%s] %s:%d %@(%p) visibilityIndex is already at %d";
          uint32_t v24 = v26;
          goto LABEL_38;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v38 = *v2;
          int v39 = *((_DWORD *)*v2 + 21);
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 387;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          __int16 v50 = 2048;
          id v51 = v38;
          __int16 v52 = 1024;
          int v53 = v39;
          _os_log_debug_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) visibilityIndex is already at %d", buf, 0x36u);
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    double v21 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __44__AVCSessionParticipant_setVisibilityIndex___block_invoke_cold_1();
      }
      return;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = *((_DWORD *)*v2 + 21);
    *(_DWORD *)buf = 136315906;
    uint64_t v43 = v19;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
    __int16 v46 = 1024;
    int v47 = 387;
    __int16 v48 = 1024;
    LODWORD(v49) = v22;
    int v23 = " [%s] %s:%d visibilityIndex is already at %d";
    uint32_t v24 = v20;
LABEL_33:
    uint32_t v33 = 34;
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v33);
    return;
  }
  *(_DWORD *)(v15 + 84) = v14;
  [*(id *)(*(void *)(a1 + 32) + 120) setIsVisible:*(_DWORD *)(*(void *)(a1 + 32) + 84) == 0];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)), @"vcSessionParameterVisibilityIndex");
  uint64_t v17 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v17 + 112))
  {
    v41[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40), @"vcSessionParticipantID", @"vcSessionParameterVisibilityIndex", *(void *)(v17 + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetVisibilityIndex", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v41, &v40, 2));
    return;
  }
  *(unsigned char *)(v17 + 113) = 1;
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v32 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v43 = v30;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
    __int16 v46 = 1024;
    int v47 = 398;
    __int16 v48 = 1024;
    LODWORD(v49) = v32;
    int v23 = " [%s] %s:%d visibilityIndex[%d] is cached until endParticipantConfiguration is called.";
    uint32_t v24 = v31;
    goto LABEL_33;
  }
  if (objc_opt_respondsToSelector()) {
    double v18 = (__CFString *)[*v2 performSelector:sel_logPrefix];
  }
  else {
    double v18 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    __int16 v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = *(void **)(a1 + 32);
      int v37 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v43 = v34;
      __int16 v44 = 2080;
      uint64_t v45 = "-[AVCSessionParticipant setVisibilityIndex:]_block_invoke";
      __int16 v46 = 1024;
      int v47 = 398;
      __int16 v48 = 2112;
      uint64_t v49 = v18;
      __int16 v50 = 2048;
      id v51 = v36;
      __int16 v52 = 1024;
      int v53 = v37;
      int v23 = " [%s] %s:%d %@(%p) visibilityIndex[%d] is cached until endParticipantConfiguration is called.";
      uint32_t v24 = v35;
LABEL_38:
      uint32_t v33 = 54;
      goto LABEL_39;
    }
  }
}

- (void)setScreenControlEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke;
    block[3] = &unk_1E6DB3DF0;
    block[4] = self;
    BOOL v9 = v3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    self->_screenControlEnabled = v3;
    uint64_t v6 = [NSNumber numberWithBool:v3];
    participantConfig = self->_participantConfig;
    [(NSMutableDictionary *)participantConfig setObject:v6 forKeyedSubscript:@"vcSessionParameterParticipantScreenControlEnabled"];
  }
}

void __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  float v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v34 = v4;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 411;
        __int16 v39 = 1024;
        LODWORD(v40) = v6;
        uint64_t v7 = " [%s] %s:%d remoteScreenControlEnabled[%d]";
        uint64_t v8 = v5;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      BOOL v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        int v13 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v10;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 411;
        __int16 v39 = 2112;
        uint64_t v40 = v3;
        __int16 v41 = 2048;
        id v42 = v12;
        __int16 v43 = 1024;
        int v44 = v13;
        uint64_t v7 = " [%s] %s:%d %@(%p) remoteScreenControlEnabled[%d]";
        uint64_t v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  int v14 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v14 != *(unsigned __int8 *)(v15 + 137))
  {
    *(unsigned char *)(v15 + 137) = v14;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), @"vcSessionParameterParticipantScreenControlEnabled");
    v32[1] = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40), @"vcSessionParticipantID", @"vcSessionParameterParticipantScreenControlEnabled", *(void *)(*(void *)(a1 + 32) + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetScreenControlEnabled", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, &v31, 2));
    return;
  }
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    double v18 = *MEMORY[0x1E4F47A50];
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v20 = *((unsigned __int8 *)*v2 + 137);
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v17;
      __int16 v35 = 2080;
      __int16 v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 413;
      __int16 v39 = 1024;
      LODWORD(v40) = v20;
      double v21 = " [%s] %s:%d remoteScreenControlEnabled is already set to %d";
      int v22 = v18;
      uint32_t v23 = 34;
LABEL_26:
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      return;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke_cold_1();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        id v27 = *v2;
        int v28 = *((unsigned __int8 *)*v2 + 137);
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v24;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 413;
        __int16 v39 = 2112;
        uint64_t v40 = v16;
        __int16 v41 = 2048;
        id v42 = v27;
        __int16 v43 = 1024;
        int v44 = v28;
        double v21 = " [%s] %s:%d %@(%p) remoteScreenControlEnabled is already set to %d";
        int v22 = v25;
        uint32_t v23 = 54;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        id v29 = *v2;
        int v30 = *((unsigned __int8 *)*v2 + 137);
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v24;
        __int16 v35 = 2080;
        __int16 v36 = "-[AVCSessionParticipant setScreenControlEnabled:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 413;
        __int16 v39 = 2112;
        uint64_t v40 = v16;
        __int16 v41 = 2048;
        id v42 = v29;
        __int16 v43 = 1024;
        int v44 = v30;
        _os_log_debug_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) remoteScreenControlEnabled is already set to %d", buf, 0x36u);
      }
    }
  }
}

- (void)setProminenceIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AVCSessionParticipant_setProminenceIndex___block_invoke;
    block[3] = &unk_1E6DB3F08;
    block[4] = self;
    int v9 = v3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    self->_prominenceIndex = v3;
    [(VCPositionalInfo *)self->_videoPositionalInfo setProminenceIndex:v3];
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
    participantConfig = self->_participantConfig;
    [(NSMutableDictionary *)participantConfig setObject:v6 forKeyedSubscript:@"vcSessionParameterProminenceIndex"];
  }
}

void __44__AVCSessionParticipant_setProminenceIndex___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  float v2 = (id *)(a1 + 32);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v43 = v4;
        __int16 v44 = 2080;
        uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 432;
        __int16 v48 = 1024;
        LODWORD(v49) = v6;
        uint64_t v7 = " [%s] %s:%d prominenceIndex[%d]";
        uint64_t v8 = v5;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        int v13 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v43 = v10;
        __int16 v44 = 2080;
        uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
        __int16 v46 = 1024;
        int v47 = 432;
        __int16 v48 = 2112;
        uint64_t v49 = v3;
        __int16 v50 = 2048;
        id v51 = v12;
        __int16 v52 = 1024;
        int v53 = v13;
        uint64_t v7 = " [%s] %s:%d %@(%p) prominenceIndex[%d]";
        uint64_t v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  int v14 = *(_DWORD *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v14 == *(_DWORD *)(v15 + 88))
  {
    if ((id)objc_opt_class() != *v2)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        id v27 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            return;
          }
          id v28 = *v2;
          int v29 = *((_DWORD *)*v2 + 22);
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 434;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          __int16 v50 = 2048;
          id v51 = v28;
          __int16 v52 = 1024;
          int v53 = v29;
          uint32_t v23 = " [%s] %s:%d %@(%p) prominenceIndex is already at %d";
          uint64_t v24 = v26;
          goto LABEL_38;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v38 = *v2;
          int v39 = *((_DWORD *)*v2 + 22);
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v25;
          __int16 v44 = 2080;
          uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
          __int16 v46 = 1024;
          int v47 = 434;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          __int16 v50 = 2048;
          id v51 = v38;
          __int16 v52 = 1024;
          int v53 = v39;
          _os_log_debug_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) prominenceIndex is already at %d", buf, 0x36u);
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x1E4F47A50];
    double v21 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __44__AVCSessionParticipant_setProminenceIndex___block_invoke_cold_1();
      }
      return;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v22 = *((_DWORD *)*v2 + 22);
    *(_DWORD *)buf = 136315906;
    uint64_t v43 = v19;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
    __int16 v46 = 1024;
    int v47 = 434;
    __int16 v48 = 1024;
    LODWORD(v49) = v22;
    uint32_t v23 = " [%s] %s:%d prominenceIndex is already at %d";
    uint64_t v24 = v20;
LABEL_33:
    uint32_t v33 = 34;
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v33);
    return;
  }
  *(_DWORD *)(v15 + 88) = v14;
  [*(id *)(*(void *)(a1 + 32) + 120) setProminenceIndex:*(unsigned int *)(a1 + 40)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)), @"vcSessionParameterProminenceIndex");
  uint64_t v17 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v17 + 112))
  {
    v41[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40), @"vcSessionParticipantID", @"vcSessionParameterProminenceIndex", *(void *)(v17 + 16));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetProminenceIndex", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v41, &v40, 2));
    return;
  }
  *(unsigned char *)(v17 + 113) = 1;
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v32 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v43 = v30;
    __int16 v44 = 2080;
    uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
    __int16 v46 = 1024;
    int v47 = 445;
    __int16 v48 = 1024;
    LODWORD(v49) = v32;
    uint32_t v23 = " [%s] %s:%d prominenceIndex[%d] is cached until endParticipantConfiguration is called.";
    uint64_t v24 = v31;
    goto LABEL_33;
  }
  if (objc_opt_respondsToSelector()) {
    double v18 = (__CFString *)[*v2 performSelector:sel_logPrefix];
  }
  else {
    double v18 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    __int16 v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = *(void **)(a1 + 32);
      int v37 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v43 = v34;
      __int16 v44 = 2080;
      uint64_t v45 = "-[AVCSessionParticipant setProminenceIndex:]_block_invoke";
      __int16 v46 = 1024;
      int v47 = 445;
      __int16 v48 = 2112;
      uint64_t v49 = v18;
      __int16 v50 = 2048;
      id v51 = v36;
      __int16 v52 = 1024;
      int v53 = v37;
      uint32_t v23 = " [%s] %s:%d %@(%p) prominenceIndex[%d] is cached until endParticipantConfiguration is called.";
      uint64_t v24 = v35;
LABEL_38:
      uint32_t v33 = 54;
      goto LABEL_39;
    }
  }
}

- (tagAVCPositionalInfo)videoPositionalInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    uint64_t v5 = &v11;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x5010000000;
    int v14 = "";
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__AVCSessionParticipant_videoPositionalInfo__block_invoke;
    block[3] = &unk_1E6DB4540;
    block[4] = self;
    void block[5] = &v11;
    if (stateQueue)
    {
      dispatch_sync(stateQueue, block);
      uint64_t v5 = v12;
    }
    long long v7 = *((_OWORD *)v5 + 2);
    long long v8 = *((_OWORD *)v5 + 4);
    *(_OWORD *)&retstr->var1.height = *((_OWORD *)v5 + 3);
    *(_OWORD *)&retstr->var3 = v8;
    *(_OWORD *)&retstr->var0 = v7;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    result = (tagAVCPositionalInfo *)self->_videoPositionalInfo;
    if (result)
    {
      return (tagAVCPositionalInfo *)[(tagAVCPositionalInfo *)result avcPositionalInfo];
    }
    else
    {
      *(_OWORD *)&retstr->var1.height = 0u;
      *(_OWORD *)&retstr->var3 = 0u;
      *(_OWORD *)&retstr->var0 = 0u;
    }
  }
  return result;
}

__n128 __44__AVCSessionParticipant_videoPositionalInfo__block_invoke(uint64_t a1)
{
  float v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    [v2 avcPositionalInfo];
  }
  else
  {
    long long v6 = 0u;
    __n128 v7 = 0u;
    long long v5 = 0u;
  }
  uint64_t v3 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  __n128 result = v7;
  v3[2] = v5;
  v3[3] = v6;
  v3[4] = v7;
  return result;
}

- (void)setVideoPositionalInfo:(tagAVCPositionalInfo *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3->var0 >= 2)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCSessionParticipant setVideoPositionalInfo:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __n128 v7 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        __n128 v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          unsigned int var0 = a3->var0;
          *(_DWORD *)buf = 136316418;
          uint64_t v19 = v10;
          __int16 v20 = 2080;
          double v21 = "-[AVCSessionParticipant setVideoPositionalInfo:]";
          __int16 v22 = 1024;
          int v23 = 464;
          __int16 v24 = 2112;
          uint64_t v25 = v7;
          __int16 v26 = 2048;
          id v27 = self;
          __int16 v28 = 1024;
          unsigned int v29 = var0;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) [AVC SPATIAL AUDIO] Invalid flags=%08x", buf, 0x36u);
        }
      }
    }
  }
  else if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    long long v6 = *(_OWORD *)&a3->var1.height;
    long long v14 = *(_OWORD *)&a3->var0;
    long long v15 = v6;
    block[2] = __48__AVCSessionParticipant_setVideoPositionalInfo___block_invoke;
    block[3] = &unk_1E6DB7F08;
    block[4] = self;
    long long v16 = *(_OWORD *)&a3->var3;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)&a3->var1.height;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v8;
    v17[2] = *(_OWORD *)&a3->var3;
    [(VCPositionalInfo *)self->_videoPositionalInfo setAvcPositionalInfo:v17];
    id v9 = [(VCPositionalInfo *)self->_videoPositionalInfo serialize];
    if (v9) {
      [(NSMutableDictionary *)self->_participantConfig setObject:v9 forKeyedSubscript:@"vcSessionPositionalInfo"];
    }
    self->_hasPendingChanges = 1;
  }
}

void __48__AVCSessionParticipant_setVideoPositionalInfo___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long __s1 = xmmword_1E25A0438;
  long long v15 = unk_1E25A0448;
  long long v16 = xmmword_1E25A0458;
  float v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    [v2 avcPositionalInfo];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long __s1 = 0u;
  }
  if (!memcmp(&__s1, (const void *)(a1 + 40), 0x30uLL)) {
    return;
  }
  long long v3 = *(_OWORD *)(a1 + 56);
  v13[0] = *(_OWORD *)(a1 + 40);
  v13[1] = v3;
  v13[2] = *(_OWORD *)(a1 + 72);
  [*(id *)(*(void *)(a1 + 32) + 120) setAvcPositionalInfo:v13];
  *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 112)) {
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    long long v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = v5;
    __int16 v19 = 2080;
    __int16 v20 = "-[AVCSessionParticipant setVideoPositionalInfo:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 485;
    __n128 v7 = " [%s] %s:%d [AVC SPATIAL AUDIO] Video position info will not be applied until endParticipantConfiguration is called.";
    long long v8 = v6;
    uint32_t v9 = 28;
LABEL_17:
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      __int16 v20 = "-[AVCSessionParticipant setVideoPositionalInfo:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 485;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      __n128 v7 = " [%s] %s:%d %@(%p) [AVC SPATIAL AUDIO] Video position info will not be applied until endParticipantConfiguration is called.";
      long long v8 = v11;
      uint32_t v9 = 48;
      goto LABEL_17;
    }
  }
}

- (void)dispatchedSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = self->_participantID;
  v6[0] = @"vcSessionParticipantID";
  v6[1] = @"vcSessionParameterMediaType";
  v7[1] = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  v6[2] = @"vcSessionParameterMediaState";
  v7[2] = [NSNumber numberWithUnsignedInt:v4];
  -[AVConferenceXPCClient sendMessageAsync:arguments:](-[AVCSessionParticipant sharedXPCConnection](self, "sharedXPCConnection"), "sendMessageAsync:arguments:", "vcSessionSetMediaState", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3]);
}

- (void)dispatchedLegacySetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_mediaStateMutex = &self->_mediaStateMutex;
  pthread_mutex_lock(&self->_mediaStateMutex);
  uint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4)), "unsignedIntValue");
  pthread_mutex_unlock(p_mediaStateMutex);
  BOOL v9 = v5 == 0;
  BOOL v10 = v5 != 1 || v8 == 2;
  uint64_t v11 = !v10;
  if (!v10) {
    BOOL v9 = 1;
  }
  switch(v4)
  {
    case 2:
      if (v9)
      {
        long long v14 = "screen";
        uint64_t v12 = "vcSessionSetScreenEnabled";
        uint64_t v13 = @"vcSessionParameterScreenEnabled";
LABEL_30:
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke;
        v22[3] = &unk_1E6DB7F30;
        v22[4] = self;
        int v23 = v4;
        int v24 = v5;
        int v25 = v8;
        [(AVCSessionParticipant *)self setMediaType:v4 enabled:v11 mediaString:v14 xpcMessageKey:v12 xpcOperationKey:v13 completionBlock:v22];
        return;
      }
      uint64_t v15 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026 detailCode:0 description:@"Screen doesn't support pause/resume"];
      long long v16 = self;
      uint64_t v17 = 2;
      break;
    case 1:
      if (v9) {
        uint64_t v12 = "vcSessionSetVideoEnabled";
      }
      else {
        uint64_t v12 = "vcSessionSetVideoPaused";
      }
      if (v9) {
        uint64_t v13 = @"vcSessionParameterVideoEnabled";
      }
      else {
        uint64_t v13 = @"vcSessionParameterVideoPaused";
      }
      long long v14 = "video";
      if (v9) {
        goto LABEL_30;
      }
      goto LABEL_27;
    case 0:
      if (v9) {
        uint64_t v12 = "vcSessionSetAudioEnabled";
      }
      else {
        uint64_t v12 = "vcSessionSetAudioPaused";
      }
      if (v9) {
        uint64_t v13 = @"vcSessionParameterAudioEnabled";
      }
      else {
        uint64_t v13 = @"vcSessionParameterAudioPaused";
      }
      long long v14 = "audio";
      if (v9) {
        goto LABEL_30;
      }
LABEL_27:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke_2;
      v18[3] = &unk_1E6DB7F30;
      v18[4] = self;
      int v19 = v4;
      int v20 = v5;
      int v21 = v8;
      [(AVCSessionParticipant *)self setMediaType:v4 paused:v5 == 2 mediaString:v14 xpcMessageKey:v12 xpcOperationKey:v13 completionBlock:v18];
      return;
    default:
      uint64_t v15 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32016 detailCode:0 description:@"Unsupported media type pause/resume"];
      long long v16 = self;
      uint64_t v17 = v4;
      break;
  }

  [(AVCSessionParticipant *)v16 stateTransitionForMediaType:v17 mediaState:v5 previousState:v8 didSucceed:0 error:v15];
}

uint64_t __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) stateTransitionForMediaType:*(unsigned int *)(a1 + 40) mediaState:*(unsigned int *)(a1 + 44) previousState:*(unsigned int *)(a1 + 48) didSucceed:a3 error:a4];
}

uint64_t __68__AVCSessionParticipant_dispatchedLegacySetMediaState_forMediaType___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) stateTransitionForMediaType:*(unsigned int *)(a1 + 40) mediaState:*(unsigned int *)(a1 + 44) previousState:*(unsigned int *)(a1 + 48) didSucceed:a3 error:a4];
}

- (void)completeSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__AVCSessionParticipant_completeSetMediaState_forMediaType_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7490;
  unsigned int v9 = a4;
  unsigned int v10 = a3;
  BOOL v11 = a5;
  block[4] = self;
  void block[5] = a6;
  if (stateQueue) {
    dispatch_async(stateQueue, block);
  }
}

uint64_t __77__AVCSessionParticipant_completeSetMediaState_forMediaType_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  float v2 = VCSessionMediaType_Name(*(unsigned int *)(a1 + 48));
  long long v3 = VCSessionMediaState_Name(*(unsigned int *)(a1 + 52));
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "unsignedIntValue");
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v15 = *(__CFString **)(a1 + 32);
    data = (__CFString *)v15->data;
    int v17 = *(unsigned __int8 *)(a1 + 56);
    int v19 = 136317186;
    uint64_t v20 = v13;
    __int16 v21 = 2080;
    int v22 = "-[AVCSessionParticipant completeSetMediaState:forMediaType:didSucceed:error:]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 550;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    __int16 v27 = 2048;
    __int16 v28 = v15;
    __int16 v29 = 2112;
    uint64_t v30 = data;
    __int16 v31 = 2112;
    int v32 = v2;
    __int16 v33 = 2112;
    uint64_t v34 = v3;
    __int16 v35 = 1024;
    int v36 = v17;
    unsigned int v10 = " [%s] %s:%d %@(%p) ParticipantID=%@ mediaType=%@ mediaState=%@ did succeed[%d]";
    BOOL v11 = v14;
    uint32_t v12 = 84;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    __n128 v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(__CFString **)(*(void *)(a1 + 32) + 16);
      int v9 = *(unsigned __int8 *)(a1 + 56);
      int v19 = 136316674;
      uint64_t v20 = v6;
      __int16 v21 = 2080;
      int v22 = "-[AVCSessionParticipant completeSetMediaState:forMediaType:didSucceed:error:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 550;
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      __int16 v27 = 2112;
      __int16 v28 = v2;
      __int16 v29 = 2112;
      uint64_t v30 = v3;
      __int16 v31 = 1024;
      LODWORD(v32) = v9;
      unsigned int v10 = " [%s] %s:%d ParticipantID=%@ mediaType=%@ mediaState=%@ did succeed[%d]";
      BOOL v11 = v7;
      uint32_t v12 = 64;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
    }
  }
LABEL_12:
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) storeMediaState:*(unsigned int *)(a1 + 52) forMediaType:*(unsigned int *)(a1 + 48)];
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  return [*(id *)(a1 + 32) stateTransitionForMediaType:*(unsigned int *)(a1 + 48) mediaState:*(unsigned int *)(a1 + 52) previousState:v4 didSucceed:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
}

- (BOOL)generateMediaStateEntryForMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  if (![(NSMutableDictionary *)self->_mediaStates objectForKeyedSubscript:v5]) {
    [(NSMutableDictionary *)self->_mediaStates setObject:&unk_1F3DC4B90 forKeyedSubscript:v5];
  }
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]) != 0;
}

- (void)printMediaStates
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  mediaStates = self->_mediaStates;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__AVCSessionParticipant_printMediaStates__block_invoke;
  _OWORD v13[3] = &unk_1E6DB7F58;
  v13[4] = v3;
  [(NSMutableDictionary *)mediaStates enumerateKeysAndObjectsUsingBlock:v13];
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      __n128 v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        int v17 = "-[AVCSessionParticipant printMediaStates]";
        __int16 v18 = 1024;
        int v19 = 576;
        __int16 v20 = 2112;
        uint64_t v21 = v3;
        uint64_t v8 = " [%s] %s:%d Media state update: %@";
        int v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        int v17 = "-[AVCSessionParticipant printMediaStates]";
        __int16 v18 = 1024;
        int v19 = 576;
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v5;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Media state update: %@";
        int v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

uint64_t __41__AVCSessionParticipant_printMediaStates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = VCSessionMediaType_Name([a2 unsignedIntValue]);
  return [v4 appendFormat:@"%@[%@] ", v5, VCSessionMediaState_Name(objc_msgSend(a3, "unsignedIntValue"))];
}

- (void)storeMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  [(AVCSessionParticipant *)self generateMediaStateEntryForMediaType:v4];
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_mediaStates objectForKeyedSubscript:v7];
  if (v8)
  {
    if ([v8 unsignedIntValue] != v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v5], v7);
      id v9 = +[AVCSessionParticipant archiveMediaStates:self->_mediaStates];
      if (v9)
      {
        [(NSMutableDictionary *)self->_participantConfig setObject:v9 forKeyedSubscript:@"vcSessionParameterMediaStates"];
        [(AVCSessionParticipant *)self updateLegacyStates];
        goto LABEL_5;
      }
      if ((AVCSessionParticipant *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCSessionParticipant storeMediaState:forMediaType:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          __int16 v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v21 = 136316162;
            *(void *)&v21[4] = v19;
            *(_WORD *)&v21[12] = 2080;
            *(void *)&v21[14] = "-[AVCSessionParticipant storeMediaState:forMediaType:]";
            *(_WORD *)&v21[22] = 1024;
            LODWORD(v22) = 590;
            WORD2(v22) = 2112;
            *(void *)((char *)&v22 + 6) = v11;
            HIWORD(v22) = 2048;
            __int16 v23 = self;
            __int16 v16 = " [%s] %s:%d %@(%p) Error encoding media type settings dictionary";
            int v17 = v20;
            uint32_t v18 = 48;
            goto LABEL_26;
          }
        }
      }
    }
  }
  else if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCSessionParticipant storeMediaState:forMediaType:](v12, v4, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v10 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v21 = 136316418;
        *(void *)&v21[4] = v14;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[AVCSessionParticipant storeMediaState:forMediaType:]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 586;
        WORD2(v22) = 2112;
        *(void *)((char *)&v22 + 6) = v10;
        HIWORD(v22) = 2048;
        __int16 v23 = self;
        LOWORD(v24) = 2112;
        *(void *)((char *)&v24 + 2) = VCSessionMediaType_Name(v4);
        __int16 v16 = " [%s] %s:%d %@(%p) Failed to retrieve media state for mediaType=%@";
        int v17 = v15;
        uint32_t v18 = 58;
LABEL_26:
        _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, v21, v18);
      }
    }
  }
LABEL_5:
  [(AVCSessionParticipant *)self printMediaStates];
}

- (void)handleLegacyTransitionsForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4 previousState:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v12 = a5 == 2 && a4 == 1;
  uint64_t v13 = (a4 == 1) ^ v12;
  uint64_t v14 = [(AVCSessionParticipant *)self delegate];
  if (a3)
  {
    if (a3 == 2)
    {
      char v17 = v13 ^ 1;
      if (!a4) {
        char v17 = 0;
      }
      if (v17 & 1) == 0 && (objc_opt_respondsToSelector())
      {
        [(AVCSessionParticipantDelegate *)v14 participant:self screenEnabled:v13 didSucceed:v8 error:a7];
      }
    }
    else if (a3 == 1)
    {
      BOOL v15 = !v12;
      if (a4 == 2) {
        BOOL v15 = 0;
      }
      if (v15 || (objc_opt_respondsToSelector() & 1) == 0)
      {
        char v18 = v13 ^ 1;
        if (!a4) {
          char v18 = 0;
        }
        if (v18 & 1) == 0 && (objc_opt_respondsToSelector())
        {
          [(AVCSessionParticipantDelegate *)v14 participant:self videoEnabled:v13 didSucceed:v8 error:a7];
        }
      }
      else
      {
        [(AVCSessionParticipantDelegate *)v14 participant:self videoPaused:a4 == 2 didSucceed:v8 error:a7];
      }
    }
  }
  else
  {
    BOOL v16 = !v12;
    if (a4 == 2) {
      BOOL v16 = 0;
    }
    if (v16 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      char v19 = v13 ^ 1;
      if (!a4) {
        char v19 = 0;
      }
      if (v19 & 1) == 0 && (objc_opt_respondsToSelector())
      {
        [(AVCSessionParticipantDelegate *)v14 participant:self audioEnabled:v13 didSucceed:v8 error:a7];
      }
    }
    else
    {
      [(AVCSessionParticipantDelegate *)v14 participant:self audioPaused:a4 == 2 didSucceed:v8 error:a7];
    }
  }
}

- (void)stateTransitionForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4 previousState:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [(AVCSessionParticipant *)self delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__AVCSessionParticipant_stateTransitionForMediaType_mediaState_previousState_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7F80;
  unsigned int v15 = a3;
  unsigned int v16 = a4;
  BOOL v18 = a6;
  block[4] = self;
  void block[5] = a7;
  unsigned int v17 = a5;
  dispatch_async((dispatch_queue_t)v13, block);
}

uint64_t __95__AVCSessionParticipant_stateTransitionForMediaType_mediaState_previousState_didSucceed_error___block_invoke(uint64_t a1)
{
  float v2 = (void *)[*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 48));
    [v2 participant:*(void *)(a1 + 32) mediaStateDidChange:VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)) forMediaType:v3 didSucceed:*(unsigned __int8 *)(a1 + 60) error:*(void *)(a1 + 40)];
  }
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 52);
  uint64_t v6 = *(unsigned int *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 60);
  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);

  return [v8 handleLegacyTransitionsForMediaType:v4 mediaState:v5 previousState:v6 didSucceed:v7 error:v9];
}

- (void)setMediaType:(unsigned int)a3 enabled:(BOOL)a4 mediaString:(const char *)a5 xpcMessageKey:(char *)a6 xpcOperationKey:(id)a7 completionBlock:(id)a8
{
  BOOL v12 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(AVCSessionParticipant *)self isConnectedToSession])
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_15;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      BOOL v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v17;
      __int16 v29 = 2080;
      uint64_t v30 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
      __int16 v31 = 1024;
      int v32 = 657;
      __int16 v33 = 2080;
      uint64_t v34 = a5;
      __int16 v35 = 1024;
      LODWORD(v36) = v12;
      uint64_t v19 = " [%s] %s:%d %sEnabled[%d]";
      __int16 v20 = v18;
      uint32_t v21 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v16 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_15;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v28 = v22;
      __int16 v29 = 2080;
      uint64_t v30 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
      __int16 v31 = 1024;
      int v32 = 657;
      __int16 v33 = 2112;
      uint64_t v34 = (const char *)v16;
      __int16 v35 = 2048;
      int v36 = self;
      __int16 v37 = 2080;
      id v38 = a5;
      __int16 v39 = 1024;
      BOOL v40 = v12;
      uint64_t v19 = " [%s] %s:%d %@(%p) %sEnabled[%d]";
      __int16 v20 = v23;
      uint32_t v21 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_15:
    (*((void (**)(id, BOOL, uint64_t, void))a8 + 2))(a8, v12, 1, 0);
    return;
  }
  stateQueue = self->_stateQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __104__AVCSessionParticipant_setMediaType_enabled_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke;
  v24[3] = &unk_1E6DB7FA8;
  BOOL v26 = v12;
  unsigned int v25 = a3;
  v24[6] = a8;
  v24[7] = a5;
  v24[4] = self;
  v24[5] = a7;
  v24[8] = a6;
  if (stateQueue) {
    dispatch_async(stateQueue, v24);
  }
}

uint64_t __104__AVCSessionParticipant_setMediaType_enabled_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 76);
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  int v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72))), "unsignedIntValue");
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3 == v2)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      uint32_t v10 = *(__CFString **)(a1 + 56);
      int v11 = *(unsigned __int8 *)(a1 + 76);
      *(_DWORD *)buf = 136316162;
      uint64_t v36 = v8;
      __int16 v37 = 2080;
      id v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      __int16 v39 = 1024;
      int v40 = 668;
      __int16 v41 = 2080;
      id v42 = v10;
      __int16 v43 = 1024;
      LODWORD(v44) = v11;
      BOOL v12 = " [%s] %s:%d Participant %s is already enabled[%d]";
      uint64_t v13 = v9;
      uint32_t v14 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 56);
      int v26 = *(unsigned __int8 *)(a1 + 76);
      *(_DWORD *)buf = 136316674;
      uint64_t v36 = v22;
      __int16 v37 = 2080;
      id v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      __int16 v39 = 1024;
      int v40 = 668;
      __int16 v41 = 2112;
      id v42 = v6;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      __int16 v45 = 2080;
      uint64_t v46 = v25;
      __int16 v47 = 1024;
      int v48 = v26;
      BOOL v12 = " [%s] %s:%d %@(%p) Participant %s is already enabled[%d]";
      uint64_t v13 = v23;
      uint32_t v14 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_25;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    unsigned int v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    uint64_t v17 = *(__CFString **)(a1 + 56);
    int v18 = *(unsigned __int8 *)(a1 + 76);
    *(_DWORD *)buf = 136316162;
    uint64_t v36 = v15;
    __int16 v37 = 2080;
    id v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
    __int16 v39 = 1024;
    int v40 = 672;
    __int16 v41 = 2080;
    id v42 = v17;
    __int16 v43 = 1024;
    LODWORD(v44) = v18;
    uint64_t v19 = " [%s] %s:%d %sEnabled[%d]";
    __int16 v20 = v16;
    uint32_t v21 = 44;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_25;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    __int16 v29 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = *(void *)(a1 + 56);
    int v32 = *(unsigned __int8 *)(a1 + 76);
    *(_DWORD *)buf = 136316674;
    uint64_t v36 = v28;
    __int16 v37 = 2080;
    id v38 = "-[AVCSessionParticipant setMediaType:enabled:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
    __int16 v39 = 1024;
    int v40 = 672;
    __int16 v41 = 2112;
    id v42 = v7;
    __int16 v43 = 2048;
    uint64_t v44 = v30;
    __int16 v45 = 2080;
    uint64_t v46 = v31;
    __int16 v47 = 1024;
    int v48 = v32;
    uint64_t v19 = " [%s] %s:%d %@(%p) %sEnabled[%d]";
    __int16 v20 = v29;
    uint32_t v21 = 64;
  }
  _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_25:
  v34[1] = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 76), @"vcSessionParticipantID", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", *(void *)(a1 + 64), objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v34, &v33, 2));
}

- (void)setMediaType:(unsigned int)a3 paused:(BOOL)a4 mediaString:(const char *)a5 xpcMessageKey:(char *)a6 xpcOperationKey:(id)a7 completionBlock:(id)a8
{
  BOOL v12 = a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__AVCSessionParticipant_setMediaType_paused_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke;
    block[3] = &unk_1E6DB7FD0;
    if (v12) {
      int v16 = 2;
    }
    else {
      int v16 = 1;
    }
    BOOL v29 = v12;
    int v27 = v13;
    int v28 = v16;
    void block[6] = a8;
    void block[7] = a5;
    block[4] = self;
    void block[5] = a7;
    block[8] = a6;
    if (stateQueue) {
      dispatch_async(stateQueue, block);
    }
    return;
  }
  if ((AVCSessionParticipant *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_18;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    uint64_t v24 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v31 = v23;
    __int16 v32 = 2080;
    uint64_t v33 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
    __int16 v34 = 1024;
    int v35 = 687;
    __int16 v36 = 2112;
    __int16 v37 = (const char *)v17;
    __int16 v38 = 2048;
    __int16 v39 = self;
    __int16 v40 = 2080;
    __int16 v41 = a5;
    __int16 v42 = 1024;
    BOOL v43 = v12;
    __int16 v20 = " [%s] %s:%d %@(%p) %sPaused[%d]";
    uint32_t v21 = v24;
    uint32_t v22 = 64;
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v31 = v18;
      __int16 v32 = 2080;
      uint64_t v33 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]";
      __int16 v34 = 1024;
      int v35 = 687;
      __int16 v36 = 2080;
      __int16 v37 = a5;
      __int16 v38 = 1024;
      LODWORD(v39) = v12;
      __int16 v20 = " [%s] %s:%d %sPaused[%d]";
      uint32_t v21 = v19;
      uint32_t v22 = 44;
LABEL_17:
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    }
  }
LABEL_18:
  pthread_mutex_lock(&self->_mediaStateMutex);
  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13)), "unsignedIntValue"))id v25 = 0; {
  else
  }
    id v25 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSessionParticipant.m", 691));
  pthread_mutex_unlock(&self->_mediaStateMutex);
  (*((void (**)(id, BOOL, BOOL, id))a8 + 2))(a8, v12, v25 == 0, v25);
}

uint64_t __103__AVCSessionParticipant_setMediaType_paused_mediaString_xpcMessageKey_xpcOperationKey_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72))), "unsignedIntValue");
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 152));
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 76);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    if (v3 == v2)
    {
      if (v4 == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        BOOL v12 = *(__CFString **)(a1 + 56);
        int v13 = *(unsigned __int8 *)(a1 + 80);
        *(_DWORD *)buf = 136316162;
        uint64_t v38 = v10;
        __int16 v39 = 2080;
        __int16 v40 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 706;
        __int16 v43 = 2080;
        uint64_t v44 = v12;
        __int16 v45 = 1024;
        LODWORD(v46) = v13;
        uint32_t v14 = " [%s] %s:%d Participant %s is already paused[%d]";
        uint64_t v15 = v11;
        uint32_t v16 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          uint64_t v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        id v25 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 56);
        int v28 = *(unsigned __int8 *)(a1 + 80);
        *(_DWORD *)buf = 136316674;
        uint64_t v38 = v24;
        __int16 v39 = 2080;
        __int16 v40 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
        __int16 v41 = 1024;
        int v42 = 706;
        __int16 v43 = 2112;
        uint64_t v44 = v6;
        __int16 v45 = 2048;
        uint64_t v46 = v26;
        __int16 v47 = 2080;
        uint64_t v48 = v27;
        __int16 v49 = 1024;
        int v50 = v28;
        uint32_t v14 = " [%s] %s:%d %@(%p) Participant %s is already paused[%d]";
        uint64_t v15 = v25;
        uint32_t v16 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_29;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      uint64_t v19 = *(__CFString **)(a1 + 56);
      int v20 = *(unsigned __int8 *)(a1 + 80);
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v17;
      __int16 v39 = 2080;
      __int16 v40 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      __int16 v41 = 1024;
      int v42 = 709;
      __int16 v43 = 2080;
      uint64_t v44 = v19;
      __int16 v45 = 1024;
      LODWORD(v46) = v20;
      uint32_t v21 = " [%s] %s:%d %sPaused[%d]";
      uint32_t v22 = v18;
      uint32_t v23 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_29;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      uint64_t v31 = *(void *)(a1 + 32);
      uint64_t v32 = *(void *)(a1 + 56);
      int v33 = *(unsigned __int8 *)(a1 + 80);
      *(_DWORD *)buf = 136316674;
      uint64_t v38 = v29;
      __int16 v39 = 2080;
      __int16 v40 = "-[AVCSessionParticipant setMediaType:paused:mediaString:xpcMessageKey:xpcOperationKey:completionBlock:]_block_invoke";
      __int16 v41 = 1024;
      int v42 = 709;
      __int16 v43 = 2112;
      uint64_t v44 = v9;
      __int16 v45 = 2048;
      uint64_t v46 = v31;
      __int16 v47 = 2080;
      uint64_t v48 = v32;
      __int16 v49 = 1024;
      int v50 = v33;
      uint32_t v21 = " [%s] %s:%d %@(%p) %sPaused[%d]";
      uint32_t v22 = v30;
      uint32_t v23 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_29:
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 16);
    v35[1] = *(void *)(a1 + 40);
    v36[0] = v34;
    v35[0] = @"vcSessionParticipantID";
    v36[1] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sharedXPCConnection"), "sendMessageAsync:arguments:", *(void *)(a1 + 64), objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  }
  +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSessionParticipant.m", 703));
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v7();
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__AVCSessionParticipant_isEnabledMediaType___block_invoke;
    v9[3] = &unk_1E6DB6790;
    int v10 = v3;
    v9[4] = self;
    v9[5] = &v11;
    if (stateQueue) {
      dispatch_sync(stateQueue, v9);
    }
    BOOL v6 = *((unsigned char *)v12 + 24) == 0;
  }
  else
  {
    BOOL v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "unsignedIntValue") == 0;
  }
  BOOL v7 = !v6;
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __44__AVCSessionParticipant_isEnabledMediaType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "unsignedIntValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)isPausedMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([(AVCSessionParticipant *)self isConnectedToSession])
  {
    stateQueue = self->_stateQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__AVCSessionParticipant_isPausedMediaType___block_invoke;
    v8[3] = &unk_1E6DB6790;
    int v9 = v3;
    v8[4] = self;
    v8[5] = &v10;
    if (stateQueue) {
      dispatch_sync(stateQueue, v8);
    }
    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "unsignedIntValue") == 2;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __43__AVCSessionParticipant_isPausedMediaType___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))), "unsignedIntValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 2;
  return result;
}

- (void)dispatchedCompleteAudioEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession]) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  }
  int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4B90), "unsignedIntValue");
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7], &unk_1F3DC4B90);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v7], @"vcSessionParameterAudioEnabled");
  }
  uint64_t v10 = [(AVCSessionParticipant *)self delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVCSessionParticipant_dispatchedCompleteAudioEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB6E88;
  int v12 = v9;
  BOOL v13 = v7;
  BOOL v14 = v6;
  block[4] = self;
  void block[5] = a5;
  BOOL v15 = v7;
  dispatch_async((dispatch_queue_t)v10, block);
}

uint64_t __73__AVCSessionParticipant_dispatchedCompleteAudioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(void *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 0, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 40);
    }
    uint64_t result = [v3 participant:*(void *)(a1 + 32) audioEnabled:*(unsigned __int8 *)(a1 + 57) != 0 didSucceed:*(unsigned __int8 *)(a1 + 56) != 0 error:v4];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    if (*(_DWORD *)(a1 + 48) == 2)
    {
      [*(id *)(a1 + 32) delegate];
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v5 = (void *)[*(id *)(a1 + 32) delegate];
        uint64_t v6 = *(void *)(a1 + 32);
        return [v5 participant:v6 audioPaused:0 didSucceed:1 error:0];
      }
    }
  }
  return result;
}

- (void)completeAudioEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AVCSessionParticipant_completeAudioEnabled_didSucceed_error___block_invoke;
  v7[3] = &unk_1E6DB66B8;
  BOOL v8 = a3;
  BOOL v9 = a4;
  void v7[4] = self;
  v7[5] = a5;
  if (stateQueue) {
    dispatch_async(stateQueue, v7);
  }
}

uint64_t __63__AVCSessionParticipant_completeAudioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCompleteAudioEnabled:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 40)];
}

- (void)dispatchedCompleteAudioPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession]) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  }
  int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4B90), "unsignedIntValue");
  if (v7) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v10], &unk_1F3DC4B90);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v7], @"vcSessionParameterAudioPaused");
  }
  uint64_t v11 = [(AVCSessionParticipant *)self delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVCSessionParticipant_dispatchedCompleteAudioPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB6E88;
  int v13 = v9;
  int v14 = v10;
  BOOL v15 = v6;
  block[4] = self;
  void block[5] = a5;
  BOOL v16 = v7;
  dispatch_async((dispatch_queue_t)v11, block);
}

uint64_t __72__AVCSessionParticipant_dispatchedCompleteAudioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(void *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 0, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 participant:v6 audioPaused:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)completeAudioPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AVCSessionParticipant_completeAudioPaused_didSucceed_error___block_invoke;
  v7[3] = &unk_1E6DB66B8;
  BOOL v8 = a3;
  BOOL v9 = a4;
  void v7[4] = self;
  v7[5] = a5;
  if (stateQueue) {
    dispatch_async(stateQueue, v7);
  }
}

uint64_t __62__AVCSessionParticipant_completeAudioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCompleteAudioPaused:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 40)];
}

- (void)dispatchedCompleteVideoEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession]) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  }
  int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4BA8), "unsignedIntValue");
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7], &unk_1F3DC4BA8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v7], @"vcSessionParameterVideoEnabled");
  }
  uint64_t v10 = [(AVCSessionParticipant *)self delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVCSessionParticipant_dispatchedCompleteVideoEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB6E88;
  int v12 = v9;
  BOOL v13 = v7;
  BOOL v14 = v6;
  block[4] = self;
  void block[5] = a5;
  BOOL v15 = v7;
  dispatch_async((dispatch_queue_t)v10, block);
}

uint64_t __73__AVCSessionParticipant_dispatchedCompleteVideoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(void *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 1, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 40);
    }
    uint64_t result = [v3 participant:*(void *)(a1 + 32) videoEnabled:*(unsigned __int8 *)(a1 + 57) != 0 didSucceed:*(unsigned __int8 *)(a1 + 56) != 0 error:v4];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    if (*(_DWORD *)(a1 + 48) == 2)
    {
      [*(id *)(a1 + 32) delegate];
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v5 = (void *)[*(id *)(a1 + 32) delegate];
        uint64_t v6 = *(void *)(a1 + 32);
        return [v5 participant:v6 videoPaused:0 didSucceed:1 error:0];
      }
    }
  }
  return result;
}

- (void)completeVideoEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AVCSessionParticipant_completeVideoEnabled_didSucceed_error___block_invoke;
  v7[3] = &unk_1E6DB66B8;
  BOOL v8 = a3;
  BOOL v9 = a4;
  void v7[4] = self;
  v7[5] = a5;
  if (stateQueue) {
    dispatch_async(stateQueue, v7);
  }
}

uint64_t __63__AVCSessionParticipant_completeVideoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCompleteVideoEnabled:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 40)];
}

- (void)dispatchedCompleteVideoPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession]) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  }
  int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4BA8), "unsignedIntValue");
  if (v7) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v10], &unk_1F3DC4BA8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v7], @"vcSessionParameterVideoPaused");
  }
  uint64_t v11 = [(AVCSessionParticipant *)self delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVCSessionParticipant_dispatchedCompleteVideoPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB6E88;
  int v13 = v9;
  int v14 = v10;
  BOOL v15 = v6;
  block[4] = self;
  void block[5] = a5;
  BOOL v16 = v7;
  dispatch_async((dispatch_queue_t)v11, block);
}

uint64_t __72__AVCSessionParticipant_dispatchedCompleteVideoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(void *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 1, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 participant:v6 videoPaused:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)completeVideoPaused:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AVCSessionParticipant_completeVideoPaused_didSucceed_error___block_invoke;
  v7[3] = &unk_1E6DB66B8;
  BOOL v8 = a3;
  BOOL v9 = a4;
  void v7[4] = self;
  v7[5] = a5;
  if (stateQueue) {
    dispatch_async(stateQueue, v7);
  }
}

uint64_t __62__AVCSessionParticipant_completeVideoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCompleteVideoPaused:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 40)];
}

- (void)dispatchedCompleteScreenEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(AVCSessionParticipant *)self isConnectedToSession]) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  }
  int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4BC0), "unsignedIntValue");
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7], &unk_1F3DC4BC0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7], &unk_1F3DC4BD8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v7], @"vcSessionParameterScreenEnabled");
  }
  uint64_t v10 = [(AVCSessionParticipant *)self delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__AVCSessionParticipant_dispatchedCompleteScreenEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB6E88;
  int v12 = v9;
  BOOL v13 = v7;
  BOOL v14 = v6;
  block[4] = self;
  void block[5] = a5;
  BOOL v15 = v7;
  dispatch_async((dispatch_queue_t)v10, block);
}

uint64_t __74__AVCSessionParticipant_dispatchedCompleteScreenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48) != *(_DWORD *)(a1 + 52))
  {
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "participant:mediaStateDidChange:forMediaType:didSucceed:error:", *(void *)(a1 + 32), VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 52)), 2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 57);
    int v6 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = *(void *)(a1 + 40);
    }
    return [v3 participant:v4 screenEnabled:v5 != 0 didSucceed:v6 != 0 error:v7];
  }
  return result;
}

- (void)completeScreenEnabled:(BOOL)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__AVCSessionParticipant_completeScreenEnabled_didSucceed_error___block_invoke;
  v7[3] = &unk_1E6DB66B8;
  BOOL v8 = a3;
  BOOL v9 = a4;
  void v7[4] = self;
  v7[5] = a5;
  if (stateQueue) {
    dispatch_async(stateQueue, v7);
  }
}

uint64_t __64__AVCSessionParticipant_completeScreenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCompleteScreenEnabled:*(unsigned __int8 *)(a1 + 48) didSucceed:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 40)];
}

- (BOOL)isConnectedToSession
{
  return [(AVCSessionParticipant *)self sharedXPCConnection] != 0;
}

- (unsigned)dispatchedMediaStateForMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  int v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);

  return [v5 unsignedIntValue];
}

- (void)setDelegate:(id)a3
{
}

- (AVCSessionParticipantDelegate)delegate
{
  return (AVCSessionParticipantDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setSharedXPCConnection:(id)a3
{
  if (a3)
  {
    objc_storeWeak((id *)&self->_connection, a3);
    [(AVCSessionParticipant *)self registerBlocksForNotifications];
  }
  else
  {
    [(AVCSessionParticipant *)self deregisterFromNotifications];
    objc_storeWeak((id *)&self->_connection, 0);
  }
}

- (VCXPCClientShared)sharedXPCConnection
{
  return (VCXPCClientShared *)objc_loadWeak((id *)&self->_connection);
}

- (void)setVideoToken:(int64_t)a3
{
  self->_videoToken = a3;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (void)setStreamTokens:(id)a3
{
  streamGroupIDToStreamTokenMap = self->_streamGroupIDToStreamTokenMap;
  if (streamGroupIDToStreamTokenMap != a3)
  {

    self->_streamGroupIDToStreamTokenMap = (NSDictionary *)a3;
  }
}

- (void)setMediaTypeToSpatialSourceIDMap:(id)a3
{
  mediaTypeToSpatialSourceIDMap = self->_mediaTypeToSpatialSourceIDMap;
  if (mediaTypeToSpatialSourceIDMap != a3)
  {

    self->_mediaTypeToSpatialSourceIDMap = (NSDictionary *)a3;
  }
}

- (unint64_t)spatialAudioSourceID
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_mediaTypeToSpatialSourceIDMap, "objectForKeyedSubscript:", &unk_1F3DC4B90), "unsignedIntValue");
}

- (int64_t)streamTokenForStreamGroupID:(unsigned int)a3
{
  streamGroupIDToStreamTokenMap = self->_streamGroupIDToStreamTokenMap;
  if (a3 == 1835623282) {
    uint64_t v4 = &unk_1F3DC4BF0;
  }
  else {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](streamGroupIDToStreamTokenMap, "objectForKeyedSubscript:", v4), "unsignedIntValue");
}

- (NSDictionary)config
{
  return &self->_participantConfig->super;
}

- (unint64_t)spatialAudioSourceIDForMediaType:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = VCSessionMediaType_FromAVCSessionMediaType(*(uint64_t *)&a3);
  if (v5 == -1)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCSessionParticipant spatialAudioSourceIDForMediaType:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v8 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316418;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          uint32_t v22 = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
          __int16 v23 = 1024;
          int v24 = 965;
          __int16 v25 = 2112;
          uint64_t v26 = v8;
          __int16 v27 = 2048;
          int v28 = self;
          __int16 v29 = 1024;
          unsigned int v30 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid mediaType=%d", (uint8_t *)&v19, 0x36u);
        }
      }
    }
    return 0;
  }
  id v6 = -[NSDictionary objectForKeyedSubscript:](self->_mediaTypeToSpatialSourceIDMap, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v5]);
  if (!v6)
  {
    if ((AVCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      int v19 = 136315906;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      uint32_t v22 = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
      __int16 v23 = 1024;
      int v24 = 968;
      __int16 v25 = 1024;
      LODWORD(v26) = a3;
      int v12 = " [%s] %s:%d Source ID not found for mediaType=%d";
      BOOL v13 = v11;
      uint32_t v14 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v9 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      int v19 = 136316418;
      uint64_t v20 = v17;
      __int16 v21 = 2080;
      uint32_t v22 = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
      __int16 v23 = 1024;
      int v24 = 968;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      __int16 v27 = 2048;
      int v28 = self;
      __int16 v29 = 1024;
      unsigned int v30 = a3;
      int v12 = " [%s] %s:%d %@(%p) Source ID not found for mediaType=%d";
      BOOL v13 = v18;
      uint32_t v14 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, v14);
    return 0;
  }

  return [v6 unsignedLongLongValue];
}

+ (id)loopbackNegotiationDataWithData:(id)a3
{
  id v3 = +[VCSessionParticipant participantInfoWithParticipantData:a3];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), @"vcSessionParticipantKeyUUID");

  return +[VCSessionParticipant participantDataWithParticipantInfo:v4];
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

- (void)registerBlocksForNotifications
{
  v19[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke;
  v19[3] = &unk_1E6DB4338;
  v19[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionVideoEnabledDidSucceed" block:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_155;
  v18[3] = &unk_1E6DB4338;
  v18[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionScreenEnabledDidSucceed" block:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_157;
  _OWORD v17[3] = &unk_1E6DB4338;
  v17[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionAudioEnabledDidSucceed" block:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_159;
  v16[3] = &unk_1E6DB4338;
  v16[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteAudioEnabledDidChange" block:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2;
  v15[3] = &unk_1E6DB4338;
  v15[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteVideoEnabledDidChange" block:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_168;
  v14[3] = &unk_1E6DB4338;
  v14[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteScreenEnabledDidChange" block:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_173;
  _OWORD v13[3] = &unk_1E6DB4338;
  v13[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteMediaStateDidChange" block:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_178;
  v12[3] = &unk_1E6DB4338;
  v12[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteMixingMediaDidChange" block:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_188;
  v11[3] = &unk_1E6DB4338;
  v11[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionAudioPausedDidSucceed" block:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_190;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionVideoPausedDidSucceed" block:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_192;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteAudioPausedDidChange" block:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_197;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionRemoteVideoPausedDidChange" block:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_202;
  v7[3] = &unk_1E6DB4338;
  void v7[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionMediaStateDidChange" block:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_3;
  void v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionMediaPrioritiesDidChange" block:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_214;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionReactionDidStart" block:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_222;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] registerBlockWithUUID:self->_participantID service:"vcSessionReactionDidStopReacting" block:v4];
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterVideoEnabled"), "BOOLValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)uint64_t v18 = 136316418;
        *(void *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1003;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = [v6 uuid];
        HIWORD(v19) = 1024;
        *(_DWORD *)uint64_t v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        int v12 = " [%s] %s:%d Participant[%@] received callback for video enabled[%d] did succeed[%d]";
        BOOL v13 = v11;
        uint32_t v14 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          BOOL v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)uint64_t v18 = 136316930;
        *(void *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1003;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(void *)uint64_t v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = [v6 uuid];
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        int v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for video enabled[%d] did succeed[%d]";
        BOOL v13 = v16;
        uint32_t v14 = 70;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      uint64_t v17 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError", *(_OWORD *)v18, *(void *)&v18[16], v19, *(void *)v20, *(_OWORD *)&v20[8], v21, v22));
      [v6 completeVideoEnabled:v7 didSucceed:v8 error:v17];
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_155(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterScreenEnabled"), "BOOLValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)uint64_t v18 = 136316418;
        *(void *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1021;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = [v6 uuid];
        HIWORD(v19) = 1024;
        *(_DWORD *)uint64_t v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        int v12 = " [%s] %s:%d Participant[%@] received callback for screen enabled[%d] did succeed[%d]";
        BOOL v13 = v11;
        uint32_t v14 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          BOOL v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)uint64_t v18 = 136316930;
        *(void *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1021;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(void *)uint64_t v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = [v6 uuid];
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        int v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for screen enabled[%d] did succeed[%d]";
        BOOL v13 = v16;
        uint32_t v14 = 70;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      uint64_t v17 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError", *(_OWORD *)v18, *(void *)&v18[16], v19, *(void *)v20, *(_OWORD *)&v20[8], v21, v22));
      [v6 completeScreenEnabled:v7 didSucceed:v8 error:v17];
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_157(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterAudioEnabled"), "BOOLValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)uint64_t v18 = 136316418;
        *(void *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1039;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = [v6 uuid];
        HIWORD(v19) = 1024;
        *(_DWORD *)uint64_t v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        int v12 = " [%s] %s:%d Participant[%@] received callback for audio enabled[%d] did succeed[%d]";
        BOOL v13 = v11;
        uint32_t v14 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          BOOL v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)uint64_t v18 = 136316930;
        *(void *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1039;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(void *)uint64_t v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = [v6 uuid];
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        int v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for audio enabled[%d] did succeed[%d]";
        BOOL v13 = v16;
        uint32_t v14 = 70;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      uint64_t v17 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError", *(_OWORD *)v18, *(void *)&v18[16], v19, *(void *)v20, *(_OWORD *)&v20[8], v21, v22));
      [v6 completeAudioEnabled:v7 didSucceed:v8 error:v17];
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_159(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterAudioEnabled"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1056;
        __int16 v25 = 2112;
        uint64_t v26 = [v6 uuid];
        __int16 v27 = 1024;
        LODWORD(v28) = v7;
        uint64_t v11 = " [%s] %s:%d Participant[%@] received callback for remote audio enabled[%d] did change";
        int v12 = v10;
        uint32_t v13 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1056;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v8;
        __int16 v27 = 2048;
        int v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = [v6 uuid];
        __int16 v31 = 1024;
        int v32 = v7;
        uint64_t v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote audio enabled[%d] did change";
        int v12 = v15;
        uint32_t v13 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_160;
      _OWORD v17[3] = &unk_1E6DB3DF0;
      v17[4] = v6;
      char v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_160(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 participant:v4 remoteAudioEnabledDidChange:v5];
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterVideoEnabled"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        __int16 v23 = 1024;
        int v24 = 1075;
        __int16 v25 = 2112;
        uint64_t v26 = [v6 uuid];
        __int16 v27 = 1024;
        LODWORD(v28) = v7;
        uint64_t v11 = " [%s] %s:%d Participant[%@] received callback for remote video enabled[%d] did change";
        int v12 = v10;
        uint32_t v13 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1075;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v8;
        __int16 v27 = 2048;
        int v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = [v6 uuid];
        __int16 v31 = 1024;
        int v32 = v7;
        uint64_t v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote video enabled[%d] did change";
        int v12 = v15;
        uint32_t v13 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_164;
      _OWORD v17[3] = &unk_1E6DB3DF0;
      v17[4] = v6;
      char v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_164(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 participant:v4 remoteVideoEnabledDidChange:v5];
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_168(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterScreenEnabled"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        __int16 v23 = 1024;
        int v24 = 1094;
        __int16 v25 = 2112;
        uint64_t v26 = [v6 uuid];
        __int16 v27 = 1024;
        LODWORD(v28) = v7;
        uint64_t v11 = " [%s] %s:%d Participant[%@] received callback for remote screen video enabled[%d] did change";
        int v12 = v10;
        uint32_t v13 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1094;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v8;
        __int16 v27 = 2048;
        int v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = [v6 uuid];
        __int16 v31 = 1024;
        int v32 = v7;
        uint64_t v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote screen video enabled[%d] did change";
        int v12 = v15;
        uint32_t v13 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      [v6 setRemoteScreenEnabled:v7];
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_169;
      _OWORD v17[3] = &unk_1E6DB3DF0;
      v17[4] = v6;
      char v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_169(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 participant:v4 remoteScreenEnabledDidChange:v5];
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_173(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (__CFString *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMediaType"), "unsignedIntValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMediaState"), "unsignedIntValue");
      if ((__CFString *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        int v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        __int16 v25 = 1024;
        int v26 = 1114;
        __int16 v27 = 2112;
        uint64_t v28 = [(__CFString *)v6 uuid];
        __int16 v29 = 2112;
        uint64_t v30 = VCSessionMediaType_Name(v7);
        __int16 v31 = 2112;
        int v32 = VCSessionMediaState_Name(v8);
        int v12 = " [%s] %s:%d Participant=%@ received callback for remote mediaType=%@ change to mediaState=%@";
        uint32_t v13 = v11;
        uint32_t v14 = 58;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v9 = (__CFString *)[(__CFString *)v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v22 = v15;
        __int16 v23 = 2080;
        int v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 1114;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v9;
        __int16 v29 = 2048;
        uint64_t v30 = v6;
        __int16 v31 = 2112;
        int v32 = (__CFString *)[(__CFString *)v6 uuid];
        __int16 v33 = 2112;
        uint64_t v34 = VCSessionMediaType_Name(v7);
        __int16 v35 = 2112;
        __int16 v36 = VCSessionMediaState_Name(v8);
        int v12 = " [%s] %s:%d %@(%p) Participant=%@ received callback for remote mediaType=%@ change to mediaState=%@";
        uint32_t v13 = v16;
        uint32_t v14 = 78;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_15:
      uint64_t v17 = [(__CFString *)v6 delegateNotificationQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_174;
      v18[3] = &unk_1E6DB4568;
      v18[4] = v6;
      int v19 = v8;
      int v20 = v7;
      dispatch_async(v17, v18);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_174(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = VCSessionMediaState_FromAVCSessionMediaState(*(unsigned int *)(a1 + 40));
    uint64_t v6 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 44));
    return [v3 participant:v4 remoteMediaStateDidChange:v5 forMediaType:v6];
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_178(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (__CFString *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMediaType"), "unsignedIntValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMixingMediaType"), "unsignedIntValue");
      if ((__CFString *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        int v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        __int16 v25 = 1024;
        int v26 = 1136;
        __int16 v27 = 2112;
        uint64_t v28 = [(__CFString *)v6 uuid];
        __int16 v29 = 2112;
        uint64_t v30 = VCSessionMediaType_Name(v7);
        __int16 v31 = 2112;
        int v32 = VCSessionMediaType_Name(v8);
        int v12 = " [%s] %s:%d Participant=%@ received callback for mediaType=%@ change to mixingMediaType=%@";
        uint32_t v13 = v11;
        uint32_t v14 = 58;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v9 = (__CFString *)[(__CFString *)v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v22 = v15;
        __int16 v23 = 2080;
        int v24 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 1136;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v9;
        __int16 v29 = 2048;
        uint64_t v30 = v6;
        __int16 v31 = 2112;
        int v32 = (__CFString *)[(__CFString *)v6 uuid];
        __int16 v33 = 2112;
        uint64_t v34 = VCSessionMediaType_Name(v7);
        __int16 v35 = 2112;
        __int16 v36 = VCSessionMediaType_Name(v8);
        int v12 = " [%s] %s:%d %@(%p) Participant=%@ received callback for mediaType=%@ change to mixingMediaType=%@";
        uint32_t v13 = v16;
        uint32_t v14 = 78;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_15:
      uint64_t v17 = [(__CFString *)v6 delegateNotificationQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_182;
      v18[3] = &unk_1E6DB4568;
      int v19 = v7;
      int v20 = v8;
      v18[4] = v6;
      dispatch_async(v17, v18);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_182(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 44);
  [*(id *)(a1 + 32) delegate];
  if (v2 == v3)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v5 = (void *)[*(id *)(a1 + 32) delegate];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 40));
      return [v5 participant:v6 mixingDidStopForMediaType:v7];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v8 = (void *)[*(id *)(a1 + 32) delegate];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 40));
      uint64_t v11 = VCSessionMediaType_FromAVCSessionMediaType(*(unsigned int *)(a1 + 44));
      return [v8 participant:v9 mixingDidStartForMediaType:v10 mixingMediaType:v11];
    }
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_188(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterAudioPaused"), "BOOLValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)char v18 = 136316418;
        *(void *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1162;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = [v6 uuid];
        HIWORD(v19) = 1024;
        *(_DWORD *)int v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        int v12 = " [%s] %s:%d Participant[%@] received callback for audio paused[%d] did succeed[%d]";
        uint32_t v13 = v11;
        uint32_t v14 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)char v18 = 136316930;
        *(void *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1162;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(void *)int v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = [v6 uuid];
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        int v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for audio paused[%d] did succeed[%d]";
        uint32_t v13 = v16;
        uint32_t v14 = 70;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      uint64_t v17 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError", *(_OWORD *)v18, *(void *)&v18[16], v19, *(void *)v20, *(_OWORD *)&v20[8], v21, v22));
      [v6 completeAudioPaused:v7 didSucceed:v8 error:0];
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_190(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterVideoPaused"), "BOOLValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)char v18 = 136316418;
        *(void *)&v18[4] = v10;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1179;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = [v6 uuid];
        HIWORD(v19) = 1024;
        *(_DWORD *)int v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v8;
        int v12 = " [%s] %s:%d Participant[%@] received callback for video paused[%d] did succeed[%d]";
        uint32_t v13 = v11;
        uint32_t v14 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)char v18 = 136316930;
        *(void *)&v18[4] = v15;
        *(_WORD *)&v18[12] = 2080;
        *(void *)&v18[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v18[22] = 1024;
        LODWORD(v19) = 1179;
        WORD2(v19) = 2112;
        *(void *)((char *)&v19 + 6) = v9;
        HIWORD(v19) = 2048;
        *(void *)int v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = [v6 uuid];
        *(_WORD *)&v20[18] = 1024;
        *(_DWORD *)&v20[20] = v7;
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = v8;
        int v12 = " [%s] %s:%d %@(%p) Participant[%@] received callback for video paused[%d] did succeed[%d]";
        uint32_t v13 = v16;
        uint32_t v14 = 70;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v18, v14);
LABEL_15:
      uint64_t v17 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError", *(_OWORD *)v18, *(void *)&v18[16], v19, *(void *)v20, *(_OWORD *)&v20[8], v21, v22));
      [v6 completeVideoPaused:v7 didSucceed:v8 error:0];
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_192(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterAudioPaused"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1196;
        __int16 v25 = 2112;
        uint64_t v26 = [v6 uuid];
        __int16 v27 = 1024;
        LODWORD(v28) = v7;
        uint64_t v11 = " [%s] %s:%d Participant[%@] received callback for remote audio paused[%d] did change";
        int v12 = v10;
        uint32_t v13 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1196;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v8;
        __int16 v27 = 2048;
        uint64_t v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = [v6 uuid];
        __int16 v31 = 1024;
        int v32 = v7;
        uint64_t v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote audio paused[%d] did change";
        int v12 = v15;
        uint32_t v13 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_193;
      _OWORD v17[3] = &unk_1E6DB3DF0;
      v17[4] = v6;
      char v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_193(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 participant:v4 remoteAudioPausedDidChange:v5];
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_197(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterVideoPaused"), "BOOLValue");
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_2";
        __int16 v23 = 1024;
        int v24 = 1215;
        __int16 v25 = 2112;
        uint64_t v26 = [v6 uuid];
        __int16 v27 = 1024;
        LODWORD(v28) = v7;
        uint64_t v11 = " [%s] %s:%d Participant[%@] received callback for remote video paused[%d] did change";
        int v12 = v10;
        uint32_t v13 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1215;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v8;
        __int16 v27 = 2048;
        uint64_t v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = [v6 uuid];
        __int16 v31 = 1024;
        int v32 = v7;
        uint64_t v11 = " [%s] %s:%d %@(%p) Participant[%@] received callback for remote video paused[%d] did change";
        int v12 = v15;
        uint32_t v13 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_198;
      _OWORD v17[3] = &unk_1E6DB3DF0;
      v17[4] = v6;
      char v18 = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_198(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 participant:v4 remoteVideoPausedDidChange:v5];
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_2_202(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMediaType"), "unsignedIntValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionParameterMediaState"), "unsignedIntValue");
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
      id v10 = (id)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError"));
      [v6 completeSetMediaState:v8 forMediaType:v7 didSucceed:v9 error:0];
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [a2 objectForKeyedSubscript:@"vcSessionParameterParticipantMediaPriority"];
      uint64_t v8 = [a2 objectForKeyedSubscript:@"vcSessionParameterParticipantMediaPriorityString"];
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_20;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        int v12 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v25 = v10;
            __int16 v26 = 2080;
            __int16 v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke_3";
            __int16 v28 = 1024;
            int v29 = 1254;
            __int16 v30 = 2112;
            uint64_t v31 = [v6 uuid];
            __int16 v32 = 2112;
            uint64_t v33 = v7;
            __int16 v34 = 2112;
            uint64_t v35 = v8;
            uint32_t v13 = " [%s] %s:%d Participant[%@] received callback for media priority change:[%@] (%@)";
            uint64_t v14 = v11;
            uint32_t v15 = 58;
LABEL_16:
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
          }
LABEL_20:
          uint64_t v22 = [v6 delegateNotificationQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_210;
          block[3] = &unk_1E6DB43D8;
          block[4] = v6;
          void block[5] = v7;
          void block[6] = v8;
          dispatch_async(v22, block);
          return;
        }
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v10;
        __int16 v26 = 2080;
        __int16 v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 1254;
        __int16 v30 = 2112;
        uint64_t v31 = [v6 uuid];
        __int16 v32 = 2112;
        uint64_t v33 = v7;
        __int16 v34 = 2112;
        uint64_t v35 = v8;
        long long v19 = " [%s] %s:%d Participant[%@] received callback for media priority change:[%@] (%@)";
        uint64_t v20 = v11;
        uint32_t v21 = 58;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_20;
        }
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        char v18 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316930;
            uint64_t v25 = v16;
            __int16 v26 = 2080;
            __int16 v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 1254;
            __int16 v30 = 2112;
            uint64_t v31 = (uint64_t)v9;
            __int16 v32 = 2048;
            uint64_t v33 = (uint64_t)v6;
            __int16 v34 = 2112;
            uint64_t v35 = [v6 uuid];
            __int16 v36 = 2112;
            uint64_t v37 = v7;
            __int16 v38 = 2112;
            uint64_t v39 = v8;
            uint32_t v13 = " [%s] %s:%d %@(%p) Participant[%@] received callback for media priority change:[%@] (%@)";
            uint64_t v14 = v17;
            uint32_t v15 = 78;
            goto LABEL_16;
          }
          goto LABEL_20;
        }
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v25 = v16;
        __int16 v26 = 2080;
        __int16 v27 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 1254;
        __int16 v30 = 2112;
        uint64_t v31 = (uint64_t)v9;
        __int16 v32 = 2048;
        uint64_t v33 = (uint64_t)v6;
        __int16 v34 = 2112;
        uint64_t v35 = [v6 uuid];
        __int16 v36 = 2112;
        uint64_t v37 = v7;
        __int16 v38 = 2112;
        uint64_t v39 = v8;
        long long v19 = " [%s] %s:%d %@(%p) Participant[%@] received callback for media priority change:[%@] (%@)";
        uint64_t v20 = v17;
        uint32_t v21 = 78;
      }
      _os_log_debug_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
      goto LABEL_20;
    }
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_210(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v2 = [*(id *)(a1 + 40) unsignedIntValue];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (*(void *)(a1 + 48))
    {
      if (v2 >= 0xFF) {
        unsigned int v4 = 255;
      }
      else {
        unsigned int v4 = v2;
      }
      if (v4 <= 1) {
        LOWORD(v4) = 1;
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (unsigned __int16)(254 * v4 - 254) / 0xFEu + 1), *(void *)(a1 + 48));
    }
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_25;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)uint64_t v22 = 136316162;
          *(void *)&v22[4] = v6;
          *(_WORD *)&v22[12] = 2080;
          *(void *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v22[22] = 1024;
          LODWORD(v23) = 1263;
          WORD2(v23) = 2112;
          *(void *)((char *)&v23 + 6) = v9;
          HIWORD(v23) = 2112;
          id v24 = v3;
          uint64_t v10 = " [%s] %s:%d [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
          uint64_t v11 = v7;
          uint32_t v12 = 48;
LABEL_21:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v22, v12);
        }
LABEL_25:
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v22, *(void *)&v22[16], v23, v24, *(_OWORD *)v25, *(void *)&v25[16]), "participant:mediaPrioritiesDidChange:", *(void *)(a1 + 32), v3);

        return;
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v22 = 136316162;
      *(void *)&v22[4] = v6;
      *(_WORD *)&v22[12] = 2080;
      *(void *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v22[22] = 1024;
      LODWORD(v23) = 1263;
      WORD2(v23) = 2112;
      *(void *)((char *)&v23 + 6) = v21;
      HIWORD(v23) = 2112;
      id v24 = v3;
      char v18 = " [%s] %s:%d [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
      long long v19 = v7;
      uint32_t v20 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_25;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void **)(a1 + 32);
          *(_DWORD *)uint64_t v22 = 136316674;
          *(void *)&v22[4] = v13;
          *(_WORD *)&v22[12] = 2080;
          *(void *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v22[22] = 1024;
          LODWORD(v23) = 1263;
          WORD2(v23) = 2112;
          *(void *)((char *)&v23 + 6) = v5;
          HIWORD(v23) = 2048;
          id v24 = v16;
          *(_WORD *)uint64_t v25 = 2112;
          *(void *)&v25[2] = v16;
          *(_WORD *)&v25[10] = 2112;
          *(void *)&v25[12] = v3;
          uint64_t v10 = " [%s] %s:%d %@(%p) [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
          uint64_t v11 = v14;
          uint32_t v12 = 68;
          goto LABEL_21;
        }
        goto LABEL_25;
      }
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      uint64_t v17 = *(void **)(a1 + 32);
      *(_DWORD *)uint64_t v22 = 136316674;
      *(void *)&v22[4] = v13;
      *(_WORD *)&v22[12] = 2080;
      *(void *)&v22[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v22[22] = 1024;
      LODWORD(v23) = 1263;
      WORD2(v23) = 2112;
      *(void *)((char *)&v23 + 6) = v5;
      HIWORD(v23) = 2048;
      id v24 = v17;
      *(_WORD *)uint64_t v25 = 2112;
      *(void *)&v25[2] = v17;
      *(_WORD *)&v25[10] = 2112;
      *(void *)&v25[12] = v3;
      char v18 = " [%s] %s:%d %@(%p) [Media Priority] Participant[%@] calling mediaPrioritiesDidChange:%@";
      long long v19 = v14;
      uint32_t v20 = 68;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEBUG, v18, v22, v20);
    goto LABEL_25;
  }
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_214(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      if (objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_16;
        }
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1279;
        __int16 v25 = 2112;
        uint64_t v26 = [v6 uuid];
        __int16 v27 = 2112;
        __int16 v28 = a2;
        uint64_t v10 = " [%s] %s:%d Participant[%@] received callback for reaction did start status=%@";
        uint64_t v11 = v9;
        uint32_t v12 = 48;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_16;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1279;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v7;
        __int16 v27 = 2048;
        __int16 v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = [v6 uuid];
        __int16 v31 = 2112;
        __int16 v32 = a2;
        uint64_t v10 = " [%s] %s:%d %@(%p) Participant[%@] received callback for reaction did start status=%@";
        uint64_t v11 = v14;
        uint32_t v12 = 68;
      }
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_16:
      uint64_t v15 = [a2 objectForKeyedSubscript:@"vcSessionParameterReactionType"];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = [v6 delegateNotificationQueue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_218;
        v18[3] = &unk_1E6DB3E40;
        v18[4] = v6;
        void v18[5] = v16;
        dispatch_async(v17, v18);
      }
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_218(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = *(void *)(a1 + 40);
          *(_DWORD *)int v24 = 136316162;
          *(void *)&v24[4] = v4;
          *(_WORD *)&v24[12] = 2080;
          *(void *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v24[22] = 1024;
          LODWORD(v25) = 1286;
          WORD2(v25) = 2112;
          *(void *)((char *)&v25 + 6) = v7;
          HIWORD(v25) = 2112;
          uint64_t v26 = v8;
          uint64_t v9 = " [%s] %s:%d Participant[%@] calling didReact:%@";
          uint64_t v10 = v5;
          uint32_t v11 = 48;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v24, v11);
        }
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      }
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)int v24 = 136316162;
      *(void *)&v24[4] = v4;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 1286;
      WORD2(v25) = 2112;
      *(void *)((char *)&v25 + 6) = v22;
      HIWORD(v25) = 2112;
      uint64_t v26 = v23;
      long long v19 = " [%s] %s:%d Participant[%@] calling didReact:%@";
      uint64_t v20 = v5;
      uint32_t v21 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        id v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = *(void *)(a1 + 40);
          *(_DWORD *)int v24 = 136316674;
          *(void *)&v24[4] = v12;
          *(_WORD *)&v24[12] = 2080;
          *(void *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v24[22] = 1024;
          LODWORD(v25) = 1286;
          WORD2(v25) = 2112;
          *(void *)((char *)&v25 + 6) = v3;
          HIWORD(v25) = 2048;
          uint64_t v26 = v15;
          *(_WORD *)__int16 v27 = 2112;
          *(void *)&v27[2] = v15;
          *(_WORD *)&v27[10] = 2112;
          *(void *)&v27[12] = v16;
          uint64_t v9 = " [%s] %s:%d %@(%p) Participant[%@] calling didReact:%@";
          uint64_t v10 = v13;
          uint32_t v11 = 68;
          goto LABEL_14;
        }
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
      }
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)int v24 = 136316674;
      *(void *)&v24[4] = v12;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 1286;
      WORD2(v25) = 2112;
      *(void *)((char *)&v25 + 6) = v3;
      HIWORD(v25) = 2048;
      uint64_t v26 = v17;
      *(_WORD *)__int16 v27 = 2112;
      *(void *)&v27[2] = v17;
      *(_WORD *)&v27[10] = 2112;
      *(void *)&v27[12] = v18;
      long long v19 = " [%s] %s:%d %@(%p) Participant[%@] calling didReact:%@";
      uint64_t v20 = v13;
      uint32_t v21 = 68;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEBUG, v19, v24, v21);
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v24, *(void *)&v24[16], v25, v26, *(_OWORD *)v27, *(void *)&v27[16]), "participant:didReact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_222(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      if (objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        long long v19 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 1301;
        __int16 v22 = 2112;
        uint64_t v23 = [v5 uuid];
        uint64_t v9 = " [%s] %s:%d Participant[%@] did stop reacting";
        uint64_t v10 = v8;
        uint32_t v11 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        long long v19 = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 1301;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v6;
        __int16 v24 = 2048;
        long long v25 = v5;
        __int16 v26 = 2112;
        uint64_t v27 = [v5 uuid];
        uint64_t v9 = " [%s] %s:%d %@(%p) Participant[%@] did stop reacting";
        uint64_t v10 = v13;
        uint32_t v11 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
      uint64_t v14 = [v5 delegateNotificationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_223;
      block[3] = &unk_1E6DB3DC8;
      block[4] = v5;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_223(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if ((id)objc_opt_class() == *v1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
            __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_223_cold_1();
          }
          return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(void *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = *v1;
          *(_DWORD *)uint64_t v16 = 136315906;
          *(void *)&v16[4] = v4;
          *(_WORD *)&v16[12] = 2080;
          *(void *)&v16[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 1304;
          WORD2(v17) = 2112;
          *(void *)((char *)&v17 + 6) = v7;
          uint64_t v8 = " [%s] %s:%d Participant[%@] calling didStopReacting";
          uint64_t v9 = v5;
          uint32_t v10 = 38;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v16, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v3 = (__CFString *)[*v1 performSelector:sel_logPrefix];
      }
      else {
        id v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(void *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          id v15 = *v1;
          *(_DWORD *)uint64_t v16 = 136316418;
          *(void *)&v16[4] = v11;
          *(_WORD *)&v16[12] = 2080;
          *(void *)&v16[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v16[22] = 1024;
          LODWORD(v17) = 1304;
          WORD2(v17) = 2112;
          *(void *)((char *)&v17 + 6) = v3;
          HIWORD(v17) = 2048;
          id v18 = v15;
          LOWORD(v19) = 2112;
          *(void *)((char *)&v19 + 2) = v15;
          _os_log_debug_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) Participant[%@] calling didStopReacting", v16, 0x3Au);
        }
        return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(void *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *v1;
        *(_DWORD *)uint64_t v16 = 136316418;
        *(void *)&v16[4] = v11;
        *(_WORD *)&v16[12] = 2080;
        *(void *)&v16[14] = "-[AVCSessionParticipant registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v16[22] = 1024;
        LODWORD(v17) = 1304;
        WORD2(v17) = 2112;
        *(void *)((char *)&v17 + 6) = v3;
        HIWORD(v17) = 2048;
        id v18 = v14;
        LOWORD(v19) = 2112;
        *(void *)((char *)&v19 + 2) = v14;
        uint64_t v8 = " [%s] %s:%d %@(%p) Participant[%@] calling didStopReacting";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_14;
      }
    }
    return objc_msgSend((id)objc_msgSend(*v1, "delegate", *(_OWORD *)v16, *(void *)&v16[16], v17, v18, v19), "participantDidStopReacting:", *v1);
  }
  return result;
}

- (void)deregisterFromNotifications
{
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionAudioEnabledDidSucceed"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionVideoEnabledDidSucceed"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionScreenEnabledDidSucceed"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionRemoteAudioEnabledDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionRemoteVideoEnabledDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionRemoteScreenEnabledDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionAudioPausedDidSucceed"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionVideoPausedDidSucceed"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionRemoteAudioPausedDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionRemoteVideoPausedDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionMediaPrioritiesDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionMediaStateDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionRemoteMediaStateDidChange"];
  [(VCXPCClientShared *)[(AVCSessionParticipant *)self sharedXPCConnection] deregisterWithUUID:self->_participantID service:"vcSessionReactionDidStart"];
  id v3 = [(AVCSessionParticipant *)self sharedXPCConnection];
  participantID = self->_participantID;

  [(VCXPCClientShared *)v3 deregisterWithUUID:participantID service:"vcSessionReactionDidStopReacting"];
}

- (void)setupNotificationQueue:(id)a3
{
  if (a3)
  {
    self->_delegateNotificationQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCSessionParticipant.notificationQueue", 0, CustomRootQueue);
  }
}

- (BOOL)setupMediaStates
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v3 = +[VCSessionParticipant streamGroupIDsFromParticipantData:self->_participantData];
  if ([v3 count])
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v79 objects:v78 count:16];
    if (!v4)
    {
LABEL_29:
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v27 = (void *)[(NSMutableDictionary *)self->_mediaStates allKeys];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v55 objects:v54 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v56 != v30) {
              objc_enumerationMutation(v27);
            }
            __int16 v32 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            uint64_t v33 = +[AVCSessionParticipant defaultStateForMediaType:isLocal:](AVCSessionParticipant, "defaultStateForMediaType:isLocal:", [v32 unsignedIntValue], self->_idsParticipantID == 0);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaStates, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v33], v32);
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v55 objects:v54 count:16];
        }
        while (v29);
      }
      LOBYTE(v34) = 1;
      return v34;
    }
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v80;
    uint64_t v8 = &selRef_isInputAvailable;
    *(void *)&long long v5 = 136315906;
    long long v51 = v5;
    id obj = v3;
LABEL_4:
    uint64_t v9 = 0;
    __int16 v52 = v8[417];
    while (1)
    {
      if (*(void *)v80 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * v9), "unsignedIntValue", v51);
      id v11 = +[VCSessionParticipant mediaTypesFromStreamGroupID:v10];
      if ([v11 count])
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v73 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v75;
LABEL_10:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v75 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v74 + 1) + 8 * v15) unsignedIntValue];
            if (![(AVCSessionParticipant *)self generateMediaStateEntryForMediaType:v16])break; {
            if (v13 == ++v15)
            }
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v74 objects:v73 count:16];
              if (v13) {
                goto LABEL_10;
              }
              goto LABEL_27;
            }
          }
          if ((AVCSessionParticipant *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_49;
            }
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            uint64_t v37 = *MEMORY[0x1E4F47A50];
            BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (v34)
            {
              __int16 v38 = FourccToCStr(v10);
              uint64_t v39 = VCSessionMediaType_Name(v16);
              *(_DWORD *)buf = 136316162;
              uint64_t v60 = v36;
              __int16 v61 = 2080;
              v62 = "-[AVCSessionParticipant setupMediaStates]";
              __int16 v63 = 1024;
              int v64 = 1355;
              __int16 v65 = 2080;
              v66 = v38;
              __int16 v67 = 2112;
              v68 = (AVCSessionParticipant *)v39;
              uint64_t v40 = " [%s] %s:%d Failed to add streamGroupID=%s for mediaType=%@";
              __int16 v41 = v37;
              goto LABEL_43;
            }
            return v34;
          }
          if (objc_opt_respondsToSelector()) {
            uint64_t v35 = (__CFString *)[(AVCSessionParticipant *)self performSelector:v52];
          }
          else {
            uint64_t v35 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_49;
          }
          uint64_t v43 = VRTraceErrorLogLevelToCSTR();
          uint64_t v44 = *MEMORY[0x1E4F47A50];
          BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v34) {
            return v34;
          }
          __int16 v45 = FourccToCStr(v10);
          uint64_t v46 = VCSessionMediaType_Name(v16);
          *(_DWORD *)buf = 136316674;
          uint64_t v60 = v43;
          __int16 v61 = 2080;
          v62 = "-[AVCSessionParticipant setupMediaStates]";
          __int16 v63 = 1024;
          int v64 = 1355;
          __int16 v65 = 2112;
          v66 = v35;
          __int16 v67 = 2048;
          v68 = self;
          __int16 v69 = 2080;
          v70 = v45;
          __int16 v71 = 2112;
          v72 = v46;
          uint64_t v40 = " [%s] %s:%d %@(%p) Failed to add streamGroupID=%s for mediaType=%@";
          __int16 v41 = v44;
          uint32_t v42 = 68;
LABEL_48:
          _os_log_error_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);
LABEL_49:
          LOBYTE(v34) = 0;
          return v34;
        }
      }
      else
      {
        if ((AVCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_27;
          }
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          long long v25 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          __int16 v26 = FourccToCStr(v10);
          *(_DWORD *)buf = v51;
          uint64_t v60 = v24;
          __int16 v61 = 2080;
          v62 = "-[AVCSessionParticipant setupMediaStates]";
          __int16 v63 = 1024;
          int v64 = 1348;
          __int16 v65 = 2080;
          v66 = v26;
          int v21 = v25;
          __int16 v22 = " [%s] %s:%d Unknown streamGroupID=%s";
          uint32_t v23 = 38;
        }
        else
        {
          long long v17 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            long long v17 = (__CFString *)[(AVCSessionParticipant *)self performSelector:v52];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_27;
          }
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          long long v19 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          uint64_t v20 = FourccToCStr(v10);
          *(_DWORD *)buf = 136316418;
          uint64_t v60 = v18;
          __int16 v61 = 2080;
          v62 = "-[AVCSessionParticipant setupMediaStates]";
          __int16 v63 = 1024;
          int v64 = 1348;
          __int16 v65 = 2112;
          v66 = v17;
          __int16 v67 = 2048;
          v68 = self;
          __int16 v69 = 2080;
          v70 = v20;
          int v21 = v19;
          __int16 v22 = " [%s] %s:%d %@(%p) Unknown streamGroupID=%s";
          uint32_t v23 = 58;
        }
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
      }
LABEL_27:
      if (++v9 == v6)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v79 objects:v78 count:16];
        uint64_t v8 = &selRef_isInputAvailable;
        if (v6) {
          goto LABEL_4;
        }
        goto LABEL_29;
      }
    }
  }
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_49;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v34)
    {
      -[AVCSessionParticipant setupMediaStates]();
      goto LABEL_49;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v47 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v47 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_49;
    }
    uint64_t v48 = VRTraceErrorLogLevelToCSTR();
    __int16 v49 = *MEMORY[0x1E4F47A50];
    BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v34)
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v48;
      __int16 v61 = 2080;
      v62 = "-[AVCSessionParticipant setupMediaStates]";
      __int16 v63 = 1024;
      int v64 = 1342;
      __int16 v65 = 2112;
      v66 = v47;
      __int16 v67 = 2048;
      v68 = self;
      uint64_t v40 = " [%s] %s:%d %@(%p) No stream groups found";
      __int16 v41 = v49;
LABEL_43:
      uint32_t v42 = 48;
      goto LABEL_48;
    }
  }
  return v34;
}

+ (unsigned)defaultStateForMediaType:(unsigned int)a3 isLocal:(BOOL)a4
{
  if (a3 >= 3) {
    return !a4;
  }
  else {
    return dword_1E25A0468[a3];
  }
}

- (void)setupConfig
{
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_participantConfig = v3;
  self->_volume = 1.0;
  [(NSMutableDictionary *)v3 setObject:self->_participantID forKeyedSubscript:@"vcSessionParticipantID"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:self->_idsParticipantID], @"vcSessionIDSParticipantID");
  [(NSMutableDictionary *)self->_participantConfig setObject:self->_participantData forKeyedSubscript:@"vcSessionParticipantData"];
  *(float *)&double v4 = self->_volume;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithFloat:v4], @"vcSessionParameterVolume");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:self->_audioMuted], @"vcSessionParameterMute");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedChar:self->_videoQuality], @"vcSessionParameterVideoQuality");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:self->_visibilityIndex], @"vcSessionParameterVisibilityIndex");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:self->_prominenceIndex], @"vcSessionParameterProminenceIndex");
  [(NSMutableDictionary *)self->_participantConfig setObject:+[AVCSessionParticipant archiveMediaStates:self->_mediaStates] forKeyedSubscript:@"vcSessionParameterMediaStates"];

  [(AVCSessionParticipant *)self updateLegacyStates];
}

- (void)updateLegacyStates
{
  int v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4B90), "unsignedIntValue");
  int v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4BA8), "unsignedIntValue");
  int v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaStates, "objectForKeyedSubscript:", &unk_1F3DC4BC0), "unsignedIntValue");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v3 != 0], @"vcSessionParameterAudioEnabled");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v4 != 0], @"vcSessionParameterVideoEnabled");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v5 != 0], @"vcSessionParameterScreenEnabled");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantConfig, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v3 == 2], @"vcSessionParameterAudioPaused");
  uint64_t v6 = [NSNumber numberWithInt:v4 == 2];
  participantConfig = self->_participantConfig;

  [(NSMutableDictionary *)participantConfig setObject:v6 forKeyedSubscript:@"vcSessionParameterVideoPaused"];
}

- (void)appendConfigurationToXPCConfiguration:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!self->_hasPendingChanges) {
    return;
  }
  if ((AVCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_13;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    BOOL hasPendingChanges = self->_hasPendingChanges;
    participantID = self->_participantID;
    int videoQuality = self->_videoQuality;
    unsigned int visibilityIndex = self->_visibilityIndex;
    unsigned int prominenceIndex = self->_prominenceIndex;
    *(_DWORD *)buf = 136316930;
    uint64_t v29 = v6;
    __int16 v30 = 2080;
    __int16 v31 = "-[AVCSessionParticipant appendConfigurationToXPCConfiguration:]";
    __int16 v32 = 1024;
    int v33 = 1414;
    __int16 v34 = 1024;
    *(_DWORD *)uint64_t v35 = hasPendingChanges;
    *(_WORD *)&v35[4] = 2112;
    *(void *)&v35[6] = participantID;
    *(_WORD *)&v35[14] = 1024;
    *(_DWORD *)&v35[16] = videoQuality;
    *(_WORD *)uint64_t v36 = 1024;
    *(_DWORD *)&void v36[2] = visibilityIndex;
    LOWORD(v37) = 1024;
    *(_DWORD *)((char *)&v37 + 2) = prominenceIndex;
    uint64_t v13 = " [%s] %s:%d (%d) uuid=%@ videoQuality=%d visibilityIndex=%d prominenceIndex=%d";
    uint64_t v14 = v7;
    uint32_t v15 = 62;
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector()) {
    int v5 = (__CFString *)[(AVCSessionParticipant *)self performSelector:sel_logPrefix];
  }
  else {
    int v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    long long v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = self->_hasPendingChanges;
      long long v19 = self->_participantID;
      int v20 = self->_videoQuality;
      unsigned int v21 = self->_visibilityIndex;
      unsigned int v22 = self->_prominenceIndex;
      *(_DWORD *)buf = 136317442;
      uint64_t v29 = v16;
      __int16 v30 = 2080;
      __int16 v31 = "-[AVCSessionParticipant appendConfigurationToXPCConfiguration:]";
      __int16 v32 = 1024;
      int v33 = 1414;
      __int16 v34 = 2112;
      *(void *)uint64_t v35 = v5;
      *(_WORD *)&v35[8] = 2048;
      *(void *)&v35[10] = self;
      *(_WORD *)&v35[18] = 1024;
      *(_DWORD *)uint64_t v36 = v18;
      *(_WORD *)&v36[4] = 2112;
      uint64_t v37 = v19;
      __int16 v38 = 1024;
      int v39 = v20;
      __int16 v40 = 1024;
      unsigned int v41 = v21;
      __int16 v42 = 1024;
      unsigned int v43 = v22;
      uint64_t v13 = " [%s] %s:%d %@(%p) (%d) uuid=%@ videoQuality=%d visibilityIndex=%d prominenceIndex=%d";
      uint64_t v14 = v17;
      uint32_t v15 = 82;
LABEL_12:
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }
LABEL_13:
  id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v27[0] = self->_participantID;
  v27[1] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", self->_videoQuality, @"vcSessionParticipantID", @"vcSessionParameterVideoQuality");
  v26[2] = @"vcSessionParameterVisibilityIndex";
  v27[2] = [NSNumber numberWithUnsignedInt:self->_visibilityIndex];
  v26[3] = @"vcSessionParameterProminenceIndex";
  v27[3] = [NSNumber numberWithUnsignedInt:self->_prominenceIndex];
  uint64_t v24 = objc_msgSend(v23, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  if ([(VCPositionalInfo *)self->_videoPositionalInfo hasPendingChanges])
  {
    id v25 = [(VCPositionalInfo *)self->_videoPositionalInfo serialize];
    if (v25) {
      [v24 setObject:v25 forKeyedSubscript:@"vcSessionPositionalInfo"];
    }
  }
  [a3 addObject:v24];

  *(_WORD *)&self->_configurationInProgress = 0;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  self->_stateQueue = (OS_dispatch_queue *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

+ (id)archiveMediaStates:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint32_t v15 = 0;
  id result = (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v15];
  if (result) {
    BOOL v6 = v15 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      long long v19 = "+[AVCSessionParticipant archiveMediaStates:]";
      __int16 v20 = 1024;
      int v21 = 1455;
      __int16 v22 = 2112;
      id v23 = a3;
      __int16 v24 = 2112;
      id v25 = v15;
      uint64_t v10 = " [%s] %s:%d Failed to archive mediaStates=%@. error=%@";
      id v11 = v9;
      uint32_t v12 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      long long v19 = "+[AVCSessionParticipant archiveMediaStates:]";
      __int16 v20 = 1024;
      int v21 = 1455;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2048;
      id v25 = a1;
      __int16 v26 = 2112;
      id v27 = a3;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      uint64_t v10 = " [%s] %s:%d %@(%p) Failed to archive mediaStates=%@. error=%@";
      id v11 = v14;
      uint32_t v12 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    return 0;
  }
  return result;
}

+ (id)unarchiveMediaStatesWithData:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  int v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28DC0], "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), a3, &v17);
  if (v7) {
    return v7;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return v7;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    id v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = v10;
    __int16 v20 = 2080;
    int v21 = "+[AVCSessionParticipant unarchiveMediaStatesWithData:]";
    __int16 v22 = 1024;
    int v23 = 1465;
    __int16 v24 = 2112;
    id v25 = v17;
    uint32_t v12 = " [%s] %s:%d Failed to decode the media state dictionary. error=%@";
    uint64_t v13 = v11;
    uint32_t v14 = 38;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return v7;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = (__CFString *)[a1 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      int v21 = "+[AVCSessionParticipant unarchiveMediaStatesWithData:]";
      __int16 v22 = 1024;
      int v23 = 1465;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2048;
      id v27 = a1;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      uint32_t v12 = " [%s] %s:%d %@(%p) Failed to decode the media state dictionary. error=%@";
      uint64_t v13 = v16;
      uint32_t v14 = 58;
      goto LABEL_13;
    }
  }
  return v7;
}

- (NSString)uuid
{
  return self->_participantID;
}

- (unint64_t)participantID
{
  return self->_idsParticipantID;
}

- (NSData)negotiationData
{
  return self->_participantData;
}

- (int64_t)videoToken
{
  return self->_videoToken;
}

- (OS_dispatch_queue)delegateNotificationQueue
{
  return self->_delegateNotificationQueue;
}

- (unsigned)videoQuality
{
  return self->_videoQuality;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (NSData)frequencyLevels
{
  return self->_frequencyLevels;
}

- (BOOL)isAudioMuted
{
  return self->_audioMuted;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)configurationInProgress
{
  return self->_configurationInProgress;
}

- (void)setConfigurationInProgress:(BOOL)a3
{
  self->_configurationInProgress = a3;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (void)setHasPendingChanges:(BOOL)a3
{
  self->_BOOL hasPendingChanges = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (BOOL)isOneToOneEnabled
{
  return self->_oneToOneEnabled;
}

- (void)setOneToOneEnabled:(BOOL)a3
{
  self->_oneToOneEnabled = a3;
}

- (BOOL)remoteScreenEnabled
{
  return self->_remoteScreenEnabled;
}

- (void)setRemoteScreenEnabled:(BOOL)a3
{
  self->_remoteScreenEnabled = a3;
}

- (BOOL)isScreenControlEnabled
{
  return self->_screenControlEnabled;
}

- (void)initWithParticipantID:data:delegate:queue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant Data is nil", v2, v3, v4, v5, v6);
}

- (void)initWithParticipantID:data:delegate:queue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the positional info", v2, v3, v4, v5, v6);
}

- (void)initWithParticipantID:data:delegate:queue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the media states dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithParticipantID:data:delegate:queue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The participant ID is nil", v2, v3, v4, v5, v6);
}

- (void)initWithParticipantID:data:delegate:queue:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The participant data is nil", v2, v3, v4, v5, v6);
}

- (void)initWithParticipantID:data:delegate:queue:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize the media states", v2, v3, v4, v5, v6);
}

void __41__AVCSessionParticipant_setVideoQuality___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d videoQuality is already at %d", v2, v3, v4, v5);
}

void __44__AVCSessionParticipant_setVisibilityIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d visibilityIndex is already at %d", v2, v3, v4, v5);
}

void __49__AVCSessionParticipant_setScreenControlEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d remoteScreenControlEnabled is already set to %d", v2, v3, v4, v5);
}

void __44__AVCSessionParticipant_setProminenceIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d prominenceIndex is already at %d", v2, v3, v4, v5);
}

- (void)setVideoPositionalInfo:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d [AVC SPATIAL AUDIO] Invalid flags=%08x", v2, v3, v4, v5);
}

- (void)storeMediaState:(NSObject *)a3 forMediaType:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[AVCSessionParticipant storeMediaState:forMediaType:]";
  __int16 v8 = 1024;
  int v9 = 586;
  __int16 v10 = 2112;
  id v11 = VCSessionMediaType_Name(a2);
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to retrieve media state for mediaType=%@", (uint8_t *)&v4, 0x26u);
}

- (void)storeMediaState:forMediaType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error encoding media type settings dictionary", v2, v3, v4, v5, v6);
}

- (void)spatialAudioSourceIDForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Invalid mediaType=%d", v3, *(const char **)v4, (unint64_t)"-[AVCSessionParticipant spatialAudioSourceIDForMediaType:]" >> 16, 965);
}

void __55__AVCSessionParticipant_registerBlocksForNotifications__block_invoke_223_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v3 = 1304;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Participant[%@] calling didStopReacting", v2, 0x26u);
}

- (void)setupMediaStates
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No stream groups found", v2, v3, v4, v5, v6);
}

@end