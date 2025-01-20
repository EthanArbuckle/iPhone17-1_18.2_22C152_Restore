@interface VCMediaStreamSendGroup
- (BOOL)dispatchedEnableRedundancy:(BOOL)a3;
- (BOOL)enableRedundancy:(BOOL)a3;
- (BOOL)isRetransmissionEnabled;
- (BOOL)isSuspended;
- (BOOL)setStreamGroupMode:(unsigned int)a3;
- (BOOL)setupStreamGroupWithConfig:(id)a3;
- (BOOL)shouldCompoundListIgnoreStream:(id)a3 streamConfig:(id)a4 activeStreamIds:(id)a5;
- (BOOL)shouldSubscribeToStreamID:(id)a3 peerSubscribedStreams:(id)a4;
- (BOOL)updateConfig:(id)a3 forMode:(unsigned int)a4;
- (BOOL)updatePeerSubscribedStreams:(id)a3 containsRepairStreams:(BOOL)a4;
- (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3;
- (BOOL)v2PayloadsAllowed;
- (VCMediaStreamSendGroup)initWithConfig:(id)a3;
- (VCRedundancyControllerProtocol)redundancyController;
- (id)activeStreamKeys;
- (id)checkStreamsForAdditionalOptIn:(id)a3;
- (id)dispatchedMediaStreamInfosForEndToEndConnection:(BOOL)a3;
- (id)peerSubscribedStreams;
- (id)streamDescriptionForMediaStreamConfig:(id)a3;
- (id)streamGroupConfigForMode:(unsigned int)a3;
- (unsigned)calculateUplinkTotalBitrateForMediaStreams:(id)a3;
- (unsigned)currentUplinkTargetBitrate;
- (unsigned)currentUplinkTotalBitrate;
- (unsigned)streamGroupMode;
- (unsigned)uplinkBitrateCapCell;
- (unsigned)uplinkBitrateCapWifi;
- (void)dealloc;
- (void)didPause:(BOOL)a3;
- (void)didReceiveRTCPPackets:(_RTCPPacketList *)a3;
- (void)didStart;
- (void)didStop;
- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6;
- (void)dispatchedUpdateStreamsWithActiveConnection:(id)a3;
- (void)setActiveConnection:(id)a3 uplinkBitrateCap:(unsigned int)a4 activeMediaStreamIDs:(id)a5 mediaBitrates:(id)a6 rateChangeCounter:(unsigned int)a7;
- (void)setCurrentUplinkTargetBitrate:(unsigned int)a3;
- (void)setCurrentUplinkTotalBitrate:(unsigned int)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setRedundancyController:(id)a3;
- (void)setRetransmissionEnabled:(BOOL)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setUplinkBitrateCapCell:(unsigned int)a3;
- (void)setUplinkBitrateCapWifi:(unsigned int)a3;
- (void)updateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6;
- (void)updateActiveStreamsCount:(unsigned int)a3;
- (void)updateEncryptionInformationWithConfig:(id)a3;
- (void)updateStreamIDCompoundingWithBlock:(id)a3 activeStreamIds:(id)a4;
- (void)updateUplinkBitrateCapCell:(unsigned int)a3 activeStreamIDs:(id)a4;
- (void)updateUplinkBitrateCapWifi:(unsigned int)a3 activeStreamIDs:(id)a4;
@end

@implementation VCMediaStreamSendGroup

- (VCMediaStreamSendGroup)initWithConfig:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaStreamSendGroup;
  v4 = -[VCMediaStreamGroup initWithConfig:](&v12, sel_initWithConfig_);
  v5 = v4;
  if (v4)
  {
    v4->_isSuspended = 1;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_peerSubscribedStreams = v6;
    if (v6)
    {
      v5->_shouldSynchronizeWithSourceRTPTimestamps = [a3 shouldSynchronizeWithSourceRTPTimestamps];
      pthread_rwlock_init(&v5->_sourceTimestampRWLock, 0);
      v5->_lastSentSourceHostTime = NAN;
      if ([(VCMediaStreamGroup *)v5 streamGroupID] == 1937339233) {
        v5->super._areStreamsSuspended = 1;
      }
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      v5->_sendGroupConfigForMode = (NSMutableDictionary *)v7;
      if (v7)
      {
        v5->_streamGroupMode = [a3 streamGroupMode];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_sendGroupConfigForMode, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupMode")));
        [a3 setDelegate:0];
        return v5;
      }
      if ((VCMediaStreamSendGroup *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaStreamSendGroup initWithConfig:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v9 = (__CFString *)[(VCMediaStreamSendGroup *)v5 performSelector:sel_logPrefix];
        }
        else {
          v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v14 = v10;
            __int16 v15 = 2080;
            v16 = "-[VCMediaStreamSendGroup initWithConfig:]";
            __int16 v17 = 1024;
            int v18 = 76;
            __int16 v19 = 2112;
            v20 = v9;
            __int16 v21 = 2048;
            v22 = v5;
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) The dictionary for stream send group config for stream mode is nil", buf, 0x30u);
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamSendGroup initWithConfig:]();
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  pthread_rwlock_destroy(&self->_sourceTimestampRWLock);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroup;
  [(VCMediaStreamGroup *)&v3 dealloc];
}

- (id)streamGroupConfigForMode:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__24;
  stateQueue = self->super._stateQueue;
  objc_super v12 = __Block_byref_object_dispose__24;
  uint64_t v13 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VCMediaStreamSendGroup_streamGroupConfigForMode___block_invoke;
  v6[3] = &unk_1E6DB6470;
  v6[4] = self;
  v6[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(stateQueue, v6);
  uint64_t v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __51__VCMediaStreamSendGroup_streamGroupConfigForMode___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)setStreamGroupMode:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  stateQueue = self->super._stateQueue;
  char v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__VCMediaStreamSendGroup_setStreamGroupMode___block_invoke;
  v6[3] = &unk_1E6DB6790;
  unsigned int v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __45__VCMediaStreamSendGroup_setStreamGroupMode___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 316)
    || !objc_msgSend(*(id *)(v2 + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(_DWORD *)(v7 + 316);
      uint64_t v9 = objc_msgSend(*(id *)(v7 + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
      *(_DWORD *)v51 = 136316162;
      *(void *)&v51[4] = v5;
      *(_WORD *)&v51[12] = 2080;
      *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 115;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v8;
      *(_WORD *)&v52[10] = 2112;
      *(void *)&v52[12] = v9;
      uint64_t v10 = " [%s] %s:%d Stream group mode cannot be changed. Current state=%u, configForMode=%@";
      char v11 = v6;
      uint32_t v12 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        objc_super v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v41 = *(void *)(a1 + 32);
      int v42 = *(_DWORD *)(v41 + 316);
      uint64_t v43 = objc_msgSend(*(id *)(v41 + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
      *(_DWORD *)v51 = 136316674;
      *(void *)&v51[4] = v13;
      *(_WORD *)&v51[12] = 2080;
      *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 115;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v3;
      *(_WORD *)&v52[14] = 2048;
      *(void *)&v52[16] = v41;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v42;
      WORD3(v53) = 2112;
      *((void *)&v53 + 1) = v43;
      uint64_t v10 = " [%s] %s:%d %@(%p) Stream group mode cannot be changed. Current state=%u, configForMode=%@";
      char v11 = v14;
      uint32_t v12 = 64;
    }
LABEL_42:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v10, v51, v12);
    return;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setupStreamGroupWithConfig:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_34;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      int v30 = *(_DWORD *)(*(void *)(a1 + 32) + 472);
      int v31 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)v51 = 136316162;
      *(void *)&v51[4] = v28;
      *(_WORD *)&v51[12] = 2080;
      *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 125;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v30;
      *(_WORD *)&v52[10] = 1024;
      *(_DWORD *)&v52[12] = v31;
      v32 = " [%s] %s:%d Failed to set stream group mode. Current mode=%u new mode=%u";
      v33 = v29;
      uint32_t v34 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        __int16 v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v35 = VRTraceErrorLogLevelToCSTR(),
            v36 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_34:
        if (objc_msgSend(*(id *)(a1 + 32), "setupStreamGroupWithConfig:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)(a1 + 32) + 472), *(_OWORD *)v51, *(void *)&v51[16], *(_OWORD *)v52, *(void *)&v52[16], v53))))return; {
        if (objc_opt_class() == *(void *)(a1 + 32))
        }
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return;
          }
          uint64_t v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return;
          }
          int v40 = *(_DWORD *)(*(void *)(a1 + 32) + 472);
          *(_DWORD *)v51 = 136315906;
          *(void *)&v51[4] = v38;
          *(_WORD *)&v51[12] = 2080;
          *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
          *(_WORD *)&v51[22] = 1024;
          *(_DWORD *)v52 = 129;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v40;
          uint64_t v10 = " [%s] %s:%d Failed to reset stream group back to original mode. Current mode=%u";
          char v11 = v39;
          uint32_t v12 = 34;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v37 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
          }
          else {
            v37 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return;
          }
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return;
          }
          uint64_t v46 = *(void *)(a1 + 32);
          int v47 = *(_DWORD *)(v46 + 472);
          *(_DWORD *)v51 = 136316418;
          *(void *)&v51[4] = v44;
          *(_WORD *)&v51[12] = 2080;
          *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
          *(_WORD *)&v51[22] = 1024;
          *(_DWORD *)v52 = 129;
          *(_WORD *)&v52[4] = 2112;
          *(void *)&v52[6] = v37;
          *(_WORD *)&v52[14] = 2048;
          *(void *)&v52[16] = v46;
          LOWORD(v53) = 1024;
          *(_DWORD *)((char *)&v53 + 2) = v47;
          uint64_t v10 = " [%s] %s:%d %@(%p) Failed to reset stream group back to original mode. Current mode=%u";
          char v11 = v45;
          uint32_t v12 = 54;
        }
        goto LABEL_42;
      }
      uint64_t v48 = *(void *)(a1 + 32);
      int v49 = *(_DWORD *)(v48 + 472);
      int v50 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)v51 = 136316674;
      *(void *)&v51[4] = v35;
      *(_WORD *)&v51[12] = 2080;
      *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
      *(_WORD *)&v51[22] = 1024;
      *(_DWORD *)v52 = 125;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v15;
      *(_WORD *)&v52[14] = 2048;
      *(void *)&v52[16] = v48;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = v49;
      WORD3(v53) = 1024;
      DWORD2(v53) = v50;
      v32 = " [%s] %s:%d %@(%p) Failed to set stream group mode. Current mode=%u new mode=%u";
      v33 = v36;
      uint32_t v34 = 60;
    }
    _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v32, v51, v34);
    goto LABEL_34;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 472) = *(_DWORD *)(a1 + 48);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = FourccToCStr([*(id *)(a1 + 32) streamGroupID]);
        int v19 = *(_DWORD *)(*(void *)(a1 + 32) + 472);
        *(_DWORD *)v51 = 136316162;
        *(void *)&v51[4] = v16;
        *(_WORD *)&v51[12] = 2080;
        *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
        *(_WORD *)&v51[22] = 1024;
        *(_DWORD *)v52 = 123;
        *(_WORD *)&v52[4] = 2080;
        *(void *)&v52[6] = v18;
        *(_WORD *)&v52[14] = 1024;
        *(_DWORD *)&v52[16] = v19;
        v20 = " [%s] %s:%d Successfully set Stream Send GroupID=%s to mode=%u";
        __int16 v21 = v17;
        uint32_t v22 = 44;
LABEL_27:
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, v51, v22);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      char v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(void **)(a1 + 32);
        v26 = FourccToCStr([v25 streamGroupID]);
        int v27 = *(_DWORD *)(*(void *)(a1 + 32) + 472);
        *(_DWORD *)v51 = 136316674;
        *(void *)&v51[4] = v23;
        *(_WORD *)&v51[12] = 2080;
        *(void *)&v51[14] = "-[VCMediaStreamSendGroup setStreamGroupMode:]_block_invoke";
        *(_WORD *)&v51[22] = 1024;
        *(_DWORD *)v52 = 123;
        *(_WORD *)&v52[4] = 2112;
        *(void *)&v52[6] = v4;
        *(_WORD *)&v52[14] = 2048;
        *(void *)&v52[16] = v25;
        LOWORD(v53) = 2080;
        *(void *)((char *)&v53 + 2) = v26;
        WORD5(v53) = 1024;
        HIDWORD(v53) = v27;
        v20 = " [%s] %s:%d %@(%p) Successfully set Stream Send GroupID=%s to mode=%u";
        __int16 v21 = v24;
        uint32_t v22 = 64;
        goto LABEL_27;
      }
    }
  }
}

- (void)setCurrentUplinkTargetBitrate:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCMediaStreamSendGroup_setCurrentUplinkTargetBitrate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __56__VCMediaStreamSendGroup_setCurrentUplinkTargetBitrate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 440) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)streamGroupMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCMediaStreamSendGroup_streamGroupMode__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__VCMediaStreamSendGroup_streamGroupMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 472);
  return result;
}

- (void)updateEncryptionInformationWithConfig:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  VCSecurityKeyHolder_CopyKeyMaterialForKeyIndex((uint64_t)[(VCMediaStreamGroup *)self securityKeyHolder], 0, (uint64_t *)&v12);
  char v4 = (void *)[v12 firstObject];
  int v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"SecurityLocallyGenerated"), "BOOLValue");
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = (void *)[a3 mediaStreamInfoArray];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11++), "stream"), "handleEncryptionInfoChange:", v4);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamGroup *)self unregisterMediaStreamNotificationDelegate];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaStreamSendGroup;
  if ([(VCMediaStreamGroup *)&v13 setupStreamsWithConfig:a3])
  {
    -[VCMediaStreamSendGroup setRedundancyController:](self, "setRedundancyController:", [a3 redundancyController]);
    [(VCMediaStreamGroup *)self registerMediaStreamNotificationDelegate];
    if ([(VCMediaStreamGroup *)self configureStreams])
    {
      [(VCMediaStreamSendGroup *)self updateEncryptionInformationWithConfig:a3];
      LOBYTE(v5) = 1;
      return v5;
    }
    if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCMediaStreamSendGroup setupStreamGroupWithConfig:]();
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCMediaStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      long long v17 = "-[VCMediaStreamSendGroup setupStreamGroupWithConfig:]";
      __int16 v18 = 1024;
      int v19 = 177;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      uint64_t v10 = " [%s] %s:%d %@(%p) Failed to configure streams";
LABEL_25:
      _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
    }
  }
  else
  {
    if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCMediaStreamSendGroup setupStreamGroupWithConfig:]();
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCMediaStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      long long v17 = "-[VCMediaStreamSendGroup setupStreamGroupWithConfig:]";
      __int16 v18 = 1024;
      int v19 = 171;
      __int16 v20 = 2112;
      __int16 v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      uint64_t v10 = " [%s] %s:%d %@(%p) Failed to setup streams with configuration";
      goto LABEL_25;
    }
  }
LABEL_26:
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)updateConfig:(id)a3 forMode:(unsigned int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCMediaStreamSendGroup_updateConfig_forMode___block_invoke;
  block[3] = &unk_1E6DB84A8;
  unsigned int v8 = a4;
  void block[5] = a3;
  void block[6] = &v9;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __47__VCMediaStreamSendGroup_updateConfig_forMode___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 316);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v2)
  {
    if (v3 == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v17 = VRTraceErrorLogLevelToCSTR(),
            __int16 v18 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        int v27 = *(_DWORD **)(a1 + 32);
        if (v27[118] == *(_DWORD *)(a1 + 56)) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v27 setupStreamGroupWithConfig:*(void *)(a1 + 40)];
        }
        else {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setObject:forKeyedSubscript:", *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "streamGroupMode", *(_OWORD *)v28, *(void *)&v28[16], v29, v30, v31, v32)));
        [*(id *)(a1 + 40) setDelegate:0];
        return;
      }
      int v19 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)uint64_t v28 = 136315906;
      *(void *)&v28[4] = v17;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = 193;
      WORD2(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 6) = v19;
      __int16 v20 = " [%s] %s:%d Updating streamGroupConfig for mode=%d";
      __int16 v21 = v18;
      uint32_t v22 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      uint64_t v25 = *(void *)(a1 + 32);
      int v26 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)uint64_t v28 = 136316418;
      *(void *)&v28[4] = v23;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = 193;
      WORD2(v29) = 2112;
      *(void *)((char *)&v29 + 6) = v6;
      HIWORD(v29) = 2048;
      uint64_t v30 = v25;
      LOWORD(v31) = 1024;
      *(_DWORD *)((char *)&v31 + 2) = v26;
      __int16 v20 = " [%s] %s:%d %@(%p) Updating streamGroupConfig for mode=%d";
      __int16 v21 = v24;
      uint32_t v22 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, v28, v22);
    goto LABEL_24;
  }
  if (v3 == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      unsigned int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 316);
        *(_DWORD *)uint64_t v28 = 136315906;
        *(void *)&v28[4] = v7;
        *(_WORD *)&v28[12] = 2080;
        *(void *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 189;
        WORD2(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 6) = v9;
        uint64_t v10 = " [%s] %s:%d Stream group config cannot be changed. Current state=%u";
        uint64_t v11 = v8;
        uint32_t v12 = 34;
LABEL_15:
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v10, v28, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      char v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      long long v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = *(_DWORD *)(v15 + 316);
        *(_DWORD *)uint64_t v28 = 136316418;
        *(void *)&v28[4] = v13;
        *(_WORD *)&v28[12] = 2080;
        *(void *)&v28[14] = "-[VCMediaStreamSendGroup updateConfig:forMode:]_block_invoke";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 189;
        WORD2(v29) = 2112;
        *(void *)((char *)&v29 + 6) = v5;
        HIWORD(v29) = 2048;
        uint64_t v30 = v15;
        LOWORD(v31) = 1024;
        *(_DWORD *)((char *)&v31 + 2) = v16;
        uint64_t v10 = " [%s] %s:%d %@(%p) Stream group config cannot be changed. Current state=%u";
        uint64_t v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_15;
      }
    }
  }
}

- (BOOL)shouldCompoundListIgnoreStream:(id)a3 streamConfig:(id)a4 activeStreamIds:(id)a5
{
  return 0;
}

- (void)updateStreamIDCompoundingWithBlock:(id)a3 activeStreamIds:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->super._mediaStreamInfoArray, "count"));
  unsigned int v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->super._mediaStreamInfoArray, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obj = self->super._mediaStreamInfoArray;
  uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v21)
  {
    uint64_t v25 = 0;
    int v26 = v8;
    uint64_t v20 = *(void *)v34;
    uint64_t v23 = (void (**)(id, uint64_t, void *, void *, void))a3;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v9;
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v24 = v10;
        uint64_t v11 = (void *)[v10 streamConfigs];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              int v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v17 = (void *)[v16 multiwayConfig];
              uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "idsStreamID"));
              if (![(VCMediaStreamSendGroup *)self shouldCompoundListIgnoreStream:v18 streamConfig:v16 activeStreamIds:a4])
              {
                if ([a4 containsObject:v18])
                {
                  if (v25) {
                    v23[2](v23, v25, v7, v26, 0);
                  }
                  [v7 removeAllObjects];
                  [v26 removeAllObjects];
                  uint64_t v25 = [v24 stream];
                }
                [v7 addObject:v18];
                if ([v17 hasRepairedStreamID]) {
                  objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "repairedStreamID")));
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v27 count:16];
          }
          while (v13);
        }
        uint64_t v9 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v21);
    unsigned int v8 = v26;
    if (v25) {
      ((void (*)(void))v23[2])();
    }
  }
}

- (id)streamDescriptionForMediaStreamConfig:(id)a3
{
  uint64_t v3 = (void *)[a3 multiwayConfig];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"streamId=%hu quality=%u", objc_msgSend(v3, "idsStreamID"), objc_msgSend(v3, "qualityIndex"));
}

- (BOOL)shouldSubscribeToStreamID:(id)a3 peerSubscribedStreams:(id)a4
{
  return [a4 containsObject:a3];
}

- (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3
{
  return 0;
}

- (void)updateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__VCMediaStreamSendGroup_updateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter___block_invoke;
  block[3] = &unk_1E6DB6560;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a5;
  unsigned int v8 = a4;
  unsigned int v9 = a6;
  dispatch_async(stateQueue, block);
}

uint64_t __103__VCMediaStreamSendGroup_updateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedUpdateActiveMediaStreamIDs:*(void *)(a1 + 40) withTargetBitrate:*(unsigned int *)(a1 + 56) mediaBitrates:*(void *)(a1 + 48) rateChangeCounter:*(unsigned int *)(a1 + 60)];
}

- (BOOL)v2PayloadsAllowed
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v17 = self;
  obuint64_t j = self->super._mediaStreamInfoArray;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned int v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        unsigned int v9 = (void *)[v8 streamConfigs];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * j) multiwayConfig];
              objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v14, "idsStreamID")));
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v19 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v5);
  }
  objc_msgSend(v3, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v17->_peerSubscribedStreams));
  BOOL v15 = [v3 count] == 0;

  return v15;
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  self->_isSuspended = [a3 count] == 0;
}

- (BOOL)dispatchedEnableRedundancy:(BOOL)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  int v5 = *((unsigned __int8 *)&self->super._ignoreMKINotifications + 4);
  if (v5 != v3) {
    *(&self->super._ignoreMKINotifications + 4) = v3;
  }
  return v5 != v3;
}

- (BOOL)enableRedundancy:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  stateQueue = self->super._stateQueue;
  char v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__VCMediaStreamSendGroup_enableRedundancy___block_invoke;
  v6[3] = &unk_1E6DB7A38;
  v6[4] = self;
  v6[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __43__VCMediaStreamSendGroup_enableRedundancy___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedEnableRedundancy:*(unsigned __int8 *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setRetransmissionEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCMediaStreamSendGroup_setRetransmissionEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __51__VCMediaStreamSendGroup_setRetransmissionEnabled___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 728) = *(unsigned char *)(a1 + 40);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v2 = *(void **)(*(void *)(a1 + 32) + 176);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) setUplinkRetransmissionEnabled:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)updateUplinkBitrateCapCell:(unsigned int)a3 activeStreamIDs:(id)a4
{
  self->_uplinkBitrateCapWifuint64_t i = a3;
}

- (void)updateUplinkBitrateCapWifi:(unsigned int)a3 activeStreamIDs:(id)a4
{
  *(_DWORD *)&self->_isRedundancyEnabled = a3;
}

- (id)peerSubscribedStreams
{
  return self->_peerSubscribedStreams;
}

- (BOOL)updatePeerSubscribedStreams:(id)a3 containsRepairStreams:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCMediaStreamSendGroup_updatePeerSubscribedStreams_containsRepairStreams___block_invoke;
  block[3] = &unk_1E6DB6A40;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v9;
  BOOL v8 = a4;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __76__VCMediaStreamSendGroup_updatePeerSubscribedStreams_containsRepairStreams___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) checkStreamsForAdditionalOptIn:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) updateUplinkStreamsForPeerSubscribedStreams:v2];
  [*(id *)(*(void *)(a1 + 32) + 448) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 448) addObjectsFromArray:v2];
  uint64_t result = [*(id *)(a1 + 32) dispatchedEnableRedundancy:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v5 = (result & 1) != 0 || *(unsigned char *)(v4 + 24) != 0;
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

- (id)checkStreamsForAdditionalOptIn:(id)a3
{
  return a3;
}

- (id)dispatchedMediaStreamInfosForEndToEndConnection:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  BOOL v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendGroupConfigForMode, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);

  return (id)[v5 mediaStreamInfoArray];
}

- (void)dispatchedUpdateStreamsWithActiveConnection:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
  id v6 = [(VCMediaStreamSendGroup *)self dispatchedMediaStreamInfosForEndToEndConnection:IsEndToEndLink];
  if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int streamGroupMode = self->_streamGroupMode;
        *(_DWORD *)buf = 136316162;
        uint64_t v27 = v8;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCMediaStreamSendGroup dispatchedUpdateStreamsWithActiveConnection:]";
        __int16 v30 = 1024;
        int v31 = 374;
        __int16 v32 = 1024;
        *(_DWORD *)long long v33 = IsEndToEndLink;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = streamGroupMode;
        uint64_t v11 = " [%s] %s:%d Updating active connection connectionIsEndToEnd=%d streamGroupMode=%u";
        char v12 = v9;
        uint32_t v13 = 40;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v7 = (__CFString *)[(VCMediaStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      BOOL v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = self->_streamGroupMode;
        *(_DWORD *)buf = 136316674;
        uint64_t v27 = v14;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCMediaStreamSendGroup dispatchedUpdateStreamsWithActiveConnection:]";
        __int16 v30 = 1024;
        int v31 = 374;
        __int16 v32 = 2112;
        *(void *)long long v33 = v7;
        *(_WORD *)&v33[8] = 2048;
        long long v34 = self;
        __int16 v35 = 1024;
        int v36 = IsEndToEndLink;
        __int16 v37 = 1024;
        unsigned int v38 = v16;
        uint64_t v11 = " [%s] %s:%d %@(%p) Updating active connection connectionIsEndToEnd=%d streamGroupMode=%u";
        char v12 = v15;
        uint32_t v13 = 60;
        goto LABEL_11;
      }
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = [v6 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "stream"), "handleActiveConnectionChange:", a3);
      }
      uint64_t v18 = [v6 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v18);
  }
}

- (void)setActiveConnection:(id)a3 uplinkBitrateCap:(unsigned int)a4 activeMediaStreamIDs:(id)a5 mediaBitrates:(id)a6 rateChangeCounter:(unsigned int)a7
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116__VCMediaStreamSendGroup_setActiveConnection_uplinkBitrateCap_activeMediaStreamIDs_mediaBitrates_rateChangeCounter___block_invoke;
  v8[3] = &unk_1E6DB84D0;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a5;
  v8[7] = a6;
  unsigned int v9 = a4;
  unsigned int v10 = a7;
  dispatch_async(stateQueue, v8);
}

uint64_t __116__VCMediaStreamSendGroup_setActiveConnection_uplinkBitrateCap_activeMediaStreamIDs_mediaBitrates_rateChangeCounter___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) dispatchedUpdateStreamsWithActiveConnection:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 64) < *(_DWORD *)(result + 440))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17);
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      BOOL v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17);
      }
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 440);
      *(_DWORD *)uint64_t v14 = 136315906;
      *(void *)&v14[4] = v4;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = "-[VCMediaStreamSendGroup setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitr"
                            "ates:rateChangeCounter:]_block_invoke";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 390;
      WORD2(v15) = 1024;
      *(_DWORD *)((char *)&v15 + 6) = v6;
      BOOL v7 = " [%s] %s:%d Updating active streams for active connection change %d.";
      uint64_t v8 = v5;
      uint32_t v9 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17);
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17);
      }
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = *(_DWORD *)(v12 + 440);
      *(_DWORD *)uint64_t v14 = 136316418;
      *(void *)&v14[4] = v10;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = "-[VCMediaStreamSendGroup setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitr"
                            "ates:rateChangeCounter:]_block_invoke";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 390;
      WORD2(v15) = 2112;
      *(void *)((char *)&v15 + 6) = v3;
      HIWORD(v15) = 2048;
      uint64_t v16 = v12;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v13;
      BOOL v7 = " [%s] %s:%d %@(%p) Updating active streams for active connection change %d.";
      uint64_t v8 = v11;
      uint32_t v9 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
    return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56), *(unsigned int *)(a1 + 68), *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17);
  }
  return result;
}

- (id)activeStreamKeys
{
}

- (unsigned)calculateUplinkTotalBitrateForMediaStreams:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (*(&self->super._ignoreMKINotifications + 4)
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig"), "repairedMaxNetworkBitrate"))
        {
          int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "defaultStreamConfig"), "multiwayConfig"), "repairedMaxNetworkBitrate");
        }
        else
        {
          int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "defaultStreamConfig"), "multiwayConfig"), "maxNetworkBitrate");
        }
        v7 += v11;
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }
  self->_currentUplinkTotalBitrate = v7;
  return v7;
}

- (void)updateActiveStreamsCount:(unsigned int)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unsigned int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL areStreamsSuspended = self->super._areStreamsSuspended;
        *(_DWORD *)buf = 136316162;
        uint64_t v35 = v6;
        __int16 v36 = 2080;
        __int16 v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
        __int16 v38 = 1024;
        int v39 = 413;
        __int16 v40 = 1024;
        *(_DWORD *)uint64_t v41 = a3;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = areStreamsSuspended;
        uint32_t v9 = " [%s] %s:%d Active stream count %d, streams currently suspended: %d";
        uint64_t v10 = v7;
        uint32_t v11 = 40;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = self->super._areStreamsSuspended;
        *(_DWORD *)buf = 136316674;
        uint64_t v35 = v12;
        __int16 v36 = 2080;
        __int16 v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
        __int16 v38 = 1024;
        int v39 = 413;
        __int16 v40 = 2112;
        *(void *)uint64_t v41 = v5;
        *(_WORD *)&v41[8] = 2048;
        int v42 = self;
        __int16 v43 = 1024;
        unsigned int v44 = a3;
        __int16 v45 = 1024;
        BOOL v46 = v14;
        uint32_t v9 = " [%s] %s:%d %@(%p) Active stream count %d, streams currently suspended: %d";
        uint64_t v10 = v13;
        uint32_t v11 = 60;
        goto LABEL_11;
      }
    }
  }
  if (!a3)
  {
    if (self->super._areStreamsSuspended) {
      return;
    }
    if ([(VCMediaStreamGroup *)self state] != 1) {
      goto LABEL_42;
    }
    if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_41;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      long long v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = v25;
      __int16 v36 = 2080;
      __int16 v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
      __int16 v38 = 1024;
      int v39 = 416;
      uint64_t v27 = " [%s] %s:%d Active stream count has dropped to zero. Will signal delegate that streams have suspended.";
      __int16 v28 = v26;
      uint32_t v29 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v16 = (__CFString *)[(VCMediaStreamSendGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_41;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      int v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = v30;
      __int16 v36 = 2080;
      __int16 v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
      __int16 v38 = 1024;
      int v39 = 416;
      __int16 v40 = 2112;
      *(void *)uint64_t v41 = v16;
      *(_WORD *)&v41[8] = 2048;
      int v42 = self;
      uint64_t v27 = " [%s] %s:%d %@(%p) Active stream count has dropped to zero. Will signal delegate that streams have suspended.";
      __int16 v28 = v31;
      uint32_t v29 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_41:
    [(VCMediaStreamGroup *)self stopCapture];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke;
    v33[3] = &unk_1E6DB4630;
    v33[4] = self;
    [(VCMediaStreamGroup *)self callDelegateWithBlock:v33];
LABEL_42:
    BOOL v24 = 1;
    goto LABEL_43;
  }
  if (!self->super._areStreamsSuspended) {
    return;
  }
  if ([(VCMediaStreamGroup *)self state] != 1) {
    goto LABEL_32;
  }
  if ((VCMediaStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_31;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v35 = v17;
    __int16 v36 = 2080;
    __int16 v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
    __int16 v38 = 1024;
    int v39 = 426;
    uint64_t v19 = " [%s] %s:%d Active stream count is no longer zero. Will signal delegate that streams will be resumed.";
    long long v20 = v18;
    uint32_t v21 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v15 = (__CFString *)[(VCMediaStreamSendGroup *)self performSelector:sel_logPrefix];
    }
    else {
      long long v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_31;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    long long v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v35 = v22;
    __int16 v36 = 2080;
    __int16 v37 = "-[VCMediaStreamSendGroup updateActiveStreamsCount:]";
    __int16 v38 = 1024;
    int v39 = 426;
    __int16 v40 = 2112;
    *(void *)uint64_t v41 = v15;
    *(_WORD *)&v41[8] = 2048;
    int v42 = self;
    uint64_t v19 = " [%s] %s:%d %@(%p) Active stream count is no longer zero. Will signal delegate that streams will be resumed.";
    long long v20 = v23;
    uint32_t v21 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_31:
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke_67;
  v32[3] = &unk_1E6DB4630;
  v32[4] = self;
  [(VCMediaStreamGroup *)self callDelegateWithBlock:v32];
  [(VCMediaStreamGroup *)self startCapture];
LABEL_32:
  BOOL v24 = 0;
LABEL_43:
  self->super._BOOL areStreamsSuspended = v24;
}

uint64_t __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) didSuspendStreams:1];
}

uint64_t __51__VCMediaStreamSendGroup_updateActiveStreamsCount___block_invoke_67(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) didSuspendStreams:0];
}

- (void)didStart
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamSendGroup *)self updateEnabledState];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroup;
  [(VCMediaStreamGroup *)&v3 didStart];
}

- (void)didStop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamSendGroup *)self updateEnabledState];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSendGroup;
  [(VCMediaStreamGroup *)&v3 didStop];
}

- (void)didPause:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamSendGroup *)self updateEnabledState];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamSendGroup;
  [(VCMediaStreamGroup *)&v5 didPause:v3];
}

- (void)setStatisticsCollector:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCMediaStreamSendGroup_setStatisticsCollector___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

void *__49__VCMediaStreamSendGroup_setStatisticsCollector___block_invoke(void *result)
{
  v1 = *(void **)(result[4] + 232);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    if (objc_msgSend(*(id *)(v2[4] + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v2[4] + 472))))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v2[4] + 464), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v2[4] + 472))), "setStatisticsCollector:", v2[5]);
    }
    uint64_t result = (id)v2[5];
    *(void *)(v2[4] + 232) = result;
  }
  return result;
}

- (void)didReceiveRTCPPackets:(_RTCPPacketList *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x68810000000;
  v7[3] = "";
  memset(v8, 170, sizeof(v8));
  RTCPShallowCopyPacketList(a3, v8);
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCMediaStreamSendGroup_didReceiveRTCPPackets___block_invoke;
  block[3] = &unk_1E6DB7008;
  block[4] = self;
  void block[5] = v7;
  void block[6] = a3;
  dispatch_async(stateQueue, block);
  _Block_object_dispose(v7, 8);
}

void __48__VCMediaStreamSendGroup_didReceiveRTCPPackets___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 472) == 1)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v3 = *(unsigned __int8 *)(v2 + 40);
    if (*(unsigned char *)(v2 + 40))
    {
      uint64_t v4 = 0;
      uint64_t v5 = v2 + 48;
      while (1)
      {
        int v6 = *(unsigned __int8 *)(*(void *)(v5 + 8 * v4) + 1);
        if ((v6 - 245) < 2)
        {
          objc_msgSend(*(id *)(a1 + 32), "didReceiveCustomReportPacket:arrivalNTPTime:");
          goto LABEL_10;
        }
        if ((v6 - 200) <= 1) {
          break;
        }
        if (++v4 >= v3) {
          goto LABEL_10;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "didReceiveReportPacket:arrivalNTPTime:");
    }
  }
LABEL_10:
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 32;

  RTCPCleanupPacketList(v7);
}

- (unsigned)currentUplinkTotalBitrate
{
  return self->_currentUplinkTotalBitrate;
}

- (void)setCurrentUplinkTotalBitrate:(unsigned int)a3
{
  self->_currentUplinkTotalBitrate = a3;
}

- (unsigned)currentUplinkTargetBitrate
{
  return self->_uplinkBitrateCapCell;
}

- (unsigned)uplinkBitrateCapCell
{
  return self->_uplinkBitrateCapWifi;
}

- (void)setUplinkBitrateCapCell:(unsigned int)a3
{
  self->_uplinkBitrateCapWifuint64_t i = a3;
}

- (unsigned)uplinkBitrateCapWifi
{
  return *(_DWORD *)&self->_isRedundancyEnabled;
}

- (void)setUplinkBitrateCapWifi:(unsigned int)a3
{
  *(_DWORD *)&self->_isRedundancyEnabled = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (VCRedundancyControllerProtocol)redundancyController
{
  return self->_redundancyController;
}

- (void)setRedundancyController:(id)a3
{
}

- (BOOL)isRetransmissionEnabled
{
  return self->_isRetransmissionEnabled;
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate peer subscribed streams", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The dictionary for stream send group config for stream mode is nil", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure streams", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup streams with configuration", v2, v3, v4, v5, v6);
}

@end