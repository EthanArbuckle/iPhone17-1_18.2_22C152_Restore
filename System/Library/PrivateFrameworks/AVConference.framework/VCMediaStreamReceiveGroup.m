@interface VCMediaStreamReceiveGroup
- (NSNumber)activeStreamID;
- (NSNumber)optedInStreamID;
- (VCMediaStreamReceiveGroup)initWithConfig:(id)a3;
- (void)dealloc;
- (void)notifyChangeInActiveMediaBitrateTo:(unsigned int)a3 from:(unsigned int)a4;
- (void)setActiveStreamID:(id)a3;
- (void)setActiveStreamIDs:(id)a3;
- (void)setActualBitrateForOptedInStreamWithActiveStreamID:(id)a3;
- (void)setupMaxBitrateMap;
- (void)vcMediaStreamDidDecryptionTimeOut:(id)a3;
- (void)vcMediaStreamDidDecryptionTimeOutForMKMRecovery:(id)a3;
- (void)vcMediaStreamDidRTCPTimeOut:(id)a3;
- (void)vcMediaStreamDidRTPTimeOut:(id)a3;
@end

@implementation VCMediaStreamReceiveGroup

- (VCMediaStreamReceiveGroup)initWithConfig:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCMediaStreamReceiveGroup;
  v3 = [(VCMediaStreamGroup *)&v14 initWithConfig:a3];
  if (!v3) {
    goto LABEL_24;
  }
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3->_streamToMaxNetworkBitrate = v4;
  if (!v4)
  {
    if ((VCMediaStreamReceiveGroup *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamReceiveGroup initWithConfig:](v7);
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCMediaStreamReceiveGroup *)v3 performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_24;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = v9;
    __int16 v17 = 2080;
    v18 = "-[VCMediaStreamReceiveGroup initWithConfig:]";
    __int16 v19 = 1024;
    int v20 = 27;
    __int16 v21 = 2112;
    v22 = v5;
    __int16 v23 = 2048;
    v24 = v3;
    v11 = " [%s] %s:%d %@(%p) Failed to allocate max bitrate map";
    goto LABEL_27;
  }
  v3->_streamToActualNetworkBitrate = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v3->_streamToMaxNetworkBitrate)
  {
    if ((VCMediaStreamReceiveGroup *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamReceiveGroup initWithConfig:](v8);
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      v6 = (__CFString *)[(VCMediaStreamReceiveGroup *)v3 performSelector:sel_logPrefix];
    }
    else {
      v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v12 = VRTraceErrorLogLevelToCSTR(),
          v10 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_24:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = v12;
    __int16 v17 = 2080;
    v18 = "-[VCMediaStreamReceiveGroup initWithConfig:]";
    __int16 v19 = 1024;
    int v20 = 29;
    __int16 v21 = 2112;
    v22 = v6;
    __int16 v23 = 2048;
    v24 = v3;
    v11 = " [%s] %s:%d %@(%p) Failed to allocate actual bitrate map";
LABEL_27:
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    goto LABEL_24;
  }
  [(VCMediaStreamReceiveGroup *)v3 setupMaxBitrateMap];
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamReceiveGroup;
  [(VCMediaStreamGroup *)&v3 dealloc];
}

- (NSNumber)optedInStreamID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  uint64_t v11 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCMediaStreamReceiveGroup_optedInStreamID__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  objc_super v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__VCMediaStreamReceiveGroup_optedInStreamID__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 432);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)activeStreamID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  uint64_t v11 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCMediaStreamReceiveGroup_activeStreamID__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  objc_super v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__VCMediaStreamReceiveGroup_activeStreamID__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 440);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setActiveStreamIDs:(id)a3
{
}

- (void)setActiveStreamID:(id)a3
{
  if (!-[NSNumber isEqualToNumber:](self->_activeStreamID, "isEqualToNumber:"))
  {
    activeStreamID = self->_activeStreamID;
    if (activeStreamID)
    {
      [(VCMediaStreamReceiveGroup *)self setActualBitrateForOptedInStreamWithActiveStreamID:a3];
      activeStreamID = self->_activeStreamID;
    }

    self->_activeStreamID = (NSNumber *)a3;
  }
}

- (void)setActualBitrateForOptedInStreamWithActiveStreamID:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamToMaxNetworkBitrate, "objectForKeyedSubscript:", self->_optedInStreamID), "unsignedIntValue");
  uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamToActualNetworkBitrate, "objectForKeyedSubscript:", self->_optedInStreamID), "unsignedIntValue");
  uint64_t v7 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamToMaxNetworkBitrate, "objectForKeyedSubscript:", a3), "unsignedIntValue");
  if (![(NSNumber *)self->_optedInStreamID isEqual:a3])
  {
    BOOL v8 = v7 >= v5;
    uint64_t v5 = v7;
    if (v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v6 != v5)
  {
LABEL_5:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamToActualNetworkBitrate, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v5], self->_optedInStreamID);
    [(VCMediaStreamReceiveGroup *)self notifyChangeInActiveMediaBitrateTo:v5 from:v6];
  }
LABEL_6:
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        activeStreamID = self->_activeStreamID;
        optedInStreamID = self->_optedInStreamID;
        int v21 = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        v24 = "-[VCMediaStreamReceiveGroup setActualBitrateForOptedInStreamWithActiveStreamID:]";
        __int16 v25 = 1024;
        int v26 = 101;
        __int16 v27 = 2112;
        v28 = activeStreamID;
        __int16 v29 = 2112;
        v30 = a3;
        __int16 v31 = 2112;
        v32 = optedInStreamID;
        objc_super v14 = " [%s] %s:%d Switching from stream %@ to new stream %@, with opted-in stream %@";
        v15 = v11;
        uint32_t v16 = 58;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCMediaStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = self->_activeStreamID;
        int v20 = self->_optedInStreamID;
        int v21 = 136316930;
        uint64_t v22 = v17;
        __int16 v23 = 2080;
        v24 = "-[VCMediaStreamReceiveGroup setActualBitrateForOptedInStreamWithActiveStreamID:]";
        __int16 v25 = 1024;
        int v26 = 101;
        __int16 v27 = 2112;
        v28 = v9;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2112;
        v32 = v19;
        __int16 v33 = 2112;
        id v34 = a3;
        __int16 v35 = 2112;
        v36 = v20;
        objc_super v14 = " [%s] %s:%d %@(%p) Switching from stream %@ to new stream %@, with opted-in stream %@";
        v15 = v18;
        uint32_t v16 = 78;
        goto LABEL_16;
      }
    }
  }
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamReceiveGroup vcMediaStreamDidRTPTimeOut:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidRTPTimeOut:]";
        __int16 v12 = 1024;
        int v13 = 107;
        __int16 v14 = 2112;
        v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2048;
        id v19 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream=%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamReceiveGroup vcMediaStreamDidRTCPTimeOut:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidRTCPTimeOut:]";
        __int16 v12 = 1024;
        int v13 = 111;
        __int16 v14 = 2112;
        v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2048;
        id v19 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream=%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidDecryptionTimeOut:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOut:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        __int16 v12 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOut:]";
        __int16 v13 = 1024;
        int v14 = 115;
        __int16 v15 = 2112;
        __int16 v16 = v5;
        __int16 v17 = 2048;
        __int16 v18 = self;
        __int16 v19 = 2048;
        id v20 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream=%p", buf, 0x3Au);
      }
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOut___block_invoke;
  v8[3] = &unk_1E6DB4630;
  v8[4] = self;
  [(VCMediaStreamGroup *)self callDelegateWithBlock:v8];
}

uint64_t __63__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOut___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didMediaDecryptionTimeOutForStreamGroup:*(void *)(a1 + 32)];
}

- (void)vcMediaStreamDidDecryptionTimeOutForMKMRecovery:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOutForMKMRecovery:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        __int16 v12 = "-[VCMediaStreamReceiveGroup vcMediaStreamDidDecryptionTimeOutForMKMRecovery:]";
        __int16 v13 = 1024;
        int v14 = 122;
        __int16 v15 = 2112;
        __int16 v16 = v5;
        __int16 v17 = 2048;
        __int16 v18 = self;
        __int16 v19 = 2048;
        id v20 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", buf, 0x3Au);
      }
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOutForMKMRecovery___block_invoke;
  v8[3] = &unk_1E6DB4630;
  v8[4] = self;
  [(VCMediaStreamGroup *)self callDelegateWithBlock:v8];
}

uint64_t __77__VCMediaStreamReceiveGroup_vcMediaStreamDidDecryptionTimeOutForMKMRecovery___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didDecryptionTimeOutForMKMRecoveryForStreamGroup:*(void *)(a1 + 32)];
}

- (void)setupMaxBitrateMap
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->super._mediaStreamInfoArray;
  uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = v3;
        uint64_t v4 = *(void **)(*((void *)&v22 + 1) + 8 * v3);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v5 = (void *)[v4 streamConfigs];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v18 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
              uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v10, "multiwayConfig"), "maxNetworkBitrate"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamToMaxNetworkBitrate, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(v10, "multiwayConfig"), "idsStreamID")));
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
          }
          while (v7);
        }
        uint64_t v3 = v15 + 1;
      }
      while (v15 + 1 != v14);
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)notifyChangeInActiveMediaBitrateTo:(unsigned int)a3 from:(unsigned int)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCMediaStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        optedInStreamID = self->_optedInStreamID;
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCMediaStreamReceiveGroup notifyChangeInActiveMediaBitrateTo:from:]";
        __int16 v22 = 1024;
        int v23 = 139;
        __int16 v24 = 2112;
        long long v25 = optedInStreamID;
        __int16 v26 = 1024;
        *(_DWORD *)__int16 v27 = a4;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a3;
        uint64_t v11 = " [%s] %s:%d Actual Network Bitrate optedInStreamID=%@ has been updated from %d bps, to %d bps";
        __int16 v12 = v9;
        uint32_t v13 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCMediaStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = self->_optedInStreamID;
        *(_DWORD *)buf = 136316930;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCMediaStreamReceiveGroup notifyChangeInActiveMediaBitrateTo:from:]";
        __int16 v22 = 1024;
        int v23 = 139;
        __int16 v24 = 2112;
        long long v25 = v7;
        __int16 v26 = 2048;
        *(void *)__int16 v27 = self;
        *(_WORD *)&v27[8] = 2112;
        v28 = v16;
        __int16 v29 = 1024;
        unsigned int v30 = a4;
        __int16 v31 = 1024;
        unsigned int v32 = a3;
        uint64_t v11 = " [%s] %s:%d %@(%p) Actual Network Bitrate optedInStreamID=%@ has been updated from %d bps, to %d bps";
        __int16 v12 = v15;
        uint32_t v13 = 70;
        goto LABEL_11;
      }
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__VCMediaStreamReceiveGroup_notifyChangeInActiveMediaBitrateTo_from___block_invoke;
  v17[3] = &unk_1E6DB4630;
  v17[4] = self;
  [(VCMediaStreamGroup *)self callDelegateWithBlock:v17];
}

uint64_t __69__VCMediaStreamReceiveGroup_notifyChangeInActiveMediaBitrateTo_from___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didChangeActualNetworkBitrateForStreamGroup:*(void *)(a1 + 32)];
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 27;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate max bitrate map", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithConfig:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 29;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate actual bitrate map", (uint8_t *)&v2, 0x1Cu);
}

- (void)vcMediaStreamDidRTPTimeOut:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream=%p", v2, v3, v4, v5);
}

- (void)vcMediaStreamDidRTCPTimeOut:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream=%p", v2, v3, v4, v5);
}

- (void)vcMediaStreamDidDecryptionTimeOut:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream=%p", v2, v3, v4, v5);
}

- (void)vcMediaStreamDidDecryptionTimeOutForMKMRecovery:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stream:%p", v2, v3, v4, v5);
}

@end