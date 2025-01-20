@interface HMDActiveSiriSessionInfo
- (BOOL)_handleFrame:(id)a3;
- (BOOL)_maybeHandleFrame:(id)a3 error:(id)a4;
- (BOOL)didBulkSendSessionComplete;
- (BOOL)didBulkSendSessionFail;
- (BOOL)didSiriSessionStart;
- (BOOL)didSiriSessionStop;
- (BOOL)isBulkSendActive;
- (BOOL)isSiriSessionActive;
- (HMDActiveSiriSessionInfo)initWithIdentifier:(id)a3 delegate:(id)a4;
- (HMDActiveSiriSessionInfoDelegate)delegate;
- (HMDDataStreamBulkSendSession)bulkSendSession;
- (NSString)description;
- (NSString)identifier;
- (void)_bulkSendDidComplete;
- (void)_bulkSendDidFail;
- (void)_doReadAudioFrames;
- (void)invalidate;
- (void)markSiriPluginReady;
- (void)markSiriPluginStopped;
- (void)readFirstFrame;
- (void)setActiveBulkSendSession:(id)a3;
- (void)setBulkSendSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidBulkSendSessionComplete:(BOOL)a3;
- (void)setDidBulkSendSessionFail:(BOOL)a3;
- (void)setDidSiriSessionStart:(BOOL)a3;
- (void)setDidSiriSessionStop:(BOOL)a3;
@end

@implementation HMDActiveSiriSessionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulkSendSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setBulkSendSession:(id)a3
{
}

- (HMDDataStreamBulkSendSession)bulkSendSession
{
  return self->_bulkSendSession;
}

- (void)setDidSiriSessionStop:(BOOL)a3
{
  self->_didSiriSessionStop = a3;
}

- (BOOL)didSiriSessionStop
{
  return self->_didSiriSessionStop;
}

- (void)setDidSiriSessionStart:(BOOL)a3
{
  self->_didSiriSessionStart = a3;
}

- (BOOL)didSiriSessionStart
{
  return self->_didSiriSessionStart;
}

- (void)setDidBulkSendSessionComplete:(BOOL)a3
{
  self->_didBulkSendSessionComplete = a3;
}

- (BOOL)didBulkSendSessionComplete
{
  return self->_didBulkSendSessionComplete;
}

- (void)setDidBulkSendSessionFail:(BOOL)a3
{
  self->_didBulkSendSessionFail = a3;
}

- (BOOL)didBulkSendSessionFail
{
  return self->_didBulkSendSessionFail;
}

- (void)setDelegate:(id)a3
{
}

- (HMDActiveSiriSessionInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDActiveSiriSessionInfoDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)_handleFrame:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [(HMDActiveSiriSessionInfo *)self delegate];
    v12 = [v10 objectForKeyedSubscript:@"firstPassResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14 && ![v7 length])
    {
      v37 = (void *)MEMORY[0x1D9452090]();
      v38 = self;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        v41 = [(HMDActiveSiriSessionInfo *)v38 identifier];
        *(_DWORD *)buf = 138543618;
        v53 = v40;
        __int16 v54 = 2112;
        v55 = v41;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@First pass metadata packet observed (%@)", buf, 0x16u);
      }
      [v11 activeSiriSession:v38 didReceiveFirstPassMetadata:v14];
      BOOL v21 = 1;
    }
    else if ([v7 length])
    {
      v15 = [v10 objectForKeyedSubscript:@"sequenceNumber"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        v18 = [v10 objectForKeyedSubscript:@"rms"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        BOOL v21 = v20 != 0;
        if (v20)
        {
          context = v17;
          [v10 objectForKeyedSubscript:@"holdTimeMs"];
          v23 = v22 = v11;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v24 = v23;
          }
          else {
            v24 = 0;
          }
          id v25 = v24;

          v11 = v22;
          if (v25) {
            [v22 activeSiriSession:self didReceiveButtonUpWithDuration:v25];
          }
          v26 = v22;
          id v17 = context;
          [v26 activeSiriSession:self didCreateAudioFrame:v7 sequenceNumber:context gain:v20];
        }
        else
        {
          contexta = (void *)MEMORY[0x1D9452090]();
          v46 = self;
          v47 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v49 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v53 = v49;
            _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@Audio received packet but no Gain", buf, 0xCu);
          }
        }
      }
      else
      {
        v42 = (void *)MEMORY[0x1D9452090]();
        v43 = self;
        v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v53 = v45;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Audio received packet but no sequence number", buf, 0xCu);
        }
        BOOL v21 = 0;
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = self;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        v36 = [(HMDActiveSiriSessionInfo *)v33 identifier];
        *(_DWORD *)buf = 138543618;
        v53 = v35;
        __int16 v54 = 2112;
        v55 = v36;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Received packet, but no audio was included (%@)", buf, 0x16u);
      }
      BOOL v21 = 0;
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [(HMDActiveSiriSessionInfo *)v28 identifier];
      *(_DWORD *)buf = 138543618;
      v53 = v30;
      __int16 v54 = 2112;
      v55 = v31;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Received packet, but no metadata was included (%@)", buf, 0x16u);
    }
    BOOL v21 = 0;
  }

  return v21;
}

- (void)_bulkSendDidComplete
{
  if ([(HMDActiveSiriSessionInfo *)self isBulkSendActive]) {
    [(HMDActiveSiriSessionInfo *)self setDidBulkSendSessionComplete:1];
  }
  if ([(HMDActiveSiriSessionInfo *)self isSiriSessionActive])
  {
    id v3 = [(HMDActiveSiriSessionInfo *)self delegate];
    [v3 activeSiriSessionDidStop:self];
  }
}

- (void)_bulkSendDidFail
{
  if ([(HMDActiveSiriSessionInfo *)self isBulkSendActive])
  {
    [(HMDActiveSiriSessionInfo *)self setDidBulkSendSessionFail:1];
    [(HMDActiveSiriSessionInfo *)self setBulkSendSession:0];
  }
  if ([(HMDActiveSiriSessionInfo *)self isSiriSessionActive])
  {
    id v3 = [(HMDActiveSiriSessionInfo *)self delegate];
    [v3 activeSiriSessionDidStop:self];
  }
}

- (void)_doReadAudioFrames
{
  id v3 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];

  if (v3)
  {
    id v4 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__HMDActiveSiriSessionInfo__doReadAudioFrames__block_invoke;
    v5[3] = &unk_1E6A18CB8;
    v5[4] = self;
    [v4 read:v5];
  }
}

void __46__HMDActiveSiriSessionInfo__doReadAudioFrames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _maybeHandleFrame:v5 error:v6])
  {
    id v7 = [*(id *)(a1 + 32) bulkSendSession];
    int v8 = [v7 isActive];

    if (v8)
    {
      [*(id *)(a1 + 32) _doReadAudioFrames];
    }
    else
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = *(id *)(a1 + 32);
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Audio receive channel is complete", (uint8_t *)&v13, 0xCu);
      }
      [*(id *)(a1 + 32) _bulkSendDidComplete];
    }
  }
}

- (BOOL)_maybeHandleFrame:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    self = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Audio receive channel has error; closing. (%@)",
        (uint8_t *)&v14,
        0x16u);
    }
  }
  else
  {
    if (!v6 || [(HMDActiveSiriSessionInfo *)self _handleFrame:v6])
    {
      BOOL v11 = 1;
      goto LABEL_9;
    }
    int v13 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];
    [v13 cancelWithReason:5];
  }
  [(HMDActiveSiriSessionInfo *)self _bulkSendDidFail];
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (void)readFirstFrame
{
  id v3 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__HMDActiveSiriSessionInfo_readFirstFrame__block_invoke;
  v4[3] = &unk_1E6A18CB8;
  v4[4] = self;
  [v3 read:v4];
}

uint64_t __42__HMDActiveSiriSessionInfo_readFirstFrame__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _maybeHandleFrame:a2 error:a3];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(HMDActiveSiriSessionInfo *)self isBulkSendActive])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v6;
      __int16 v10 = 2112;
      BOOL v11 = v4;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Plugin removed before all audio was received; cancelling (%@)",
        (uint8_t *)&v8,
        0x16u);
    }
    id v7 = [(HMDActiveSiriSessionInfo *)v4 bulkSendSession];
    [v7 cancelWithReason:3];

    [(HMDActiveSiriSessionInfo *)v4 setBulkSendSession:0];
  }
}

- (void)setActiveBulkSendSession:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      BOOL v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Siri active session got two send sessions? Canceling the latter one.", (uint8_t *)&v10, 0xCu);
    }
    [v4 cancelWithReason:2];
  }
  else
  {
    [(HMDActiveSiriSessionInfo *)self setBulkSendSession:v4];
    if ([(HMDActiveSiriSessionInfo *)self isSiriSessionActive]) {
      [(HMDActiveSiriSessionInfo *)self _doReadAudioFrames];
    }
  }
}

- (void)markSiriPluginStopped
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(HMDActiveSiriSessionInfo *)self didBulkSendSessionComplete];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v11 = 138543618;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        int v14 = v7;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Plugin stopped and all audio was received; closing as complete (%@)",
          (uint8_t *)&v11,
          0x16u);
      }
      int v10 = [(HMDActiveSiriSessionInfo *)v7 bulkSendSession];
      [v10 cancelWithReason:0];

      [(HMDActiveSiriSessionInfo *)v7 setBulkSendSession:0];
    }
  }
}

- (void)markSiriPluginReady
{
  [(HMDActiveSiriSessionInfo *)self setDidSiriSessionStart:1];
  if ([(HMDActiveSiriSessionInfo *)self isBulkSendActive])
  {
    [(HMDActiveSiriSessionInfo *)self _doReadAudioFrames];
  }
}

- (BOOL)isSiriSessionActive
{
  BOOL v3 = [(HMDActiveSiriSessionInfo *)self didSiriSessionStart];
  if (v3) {
    LOBYTE(v3) = ![(HMDActiveSiriSessionInfo *)self didSiriSessionStop];
  }
  return v3;
}

- (BOOL)isBulkSendActive
{
  BOOL v3 = [(HMDActiveSiriSessionInfo *)self bulkSendSession];
  if (v3 && ![(HMDActiveSiriSessionInfo *)self didBulkSendSessionFail]) {
    BOOL v4 = ![(HMDActiveSiriSessionInfo *)self didBulkSendSessionComplete];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSString)description
{
  BOOL v3 = NSString;
  BOOL v4 = [(HMDActiveSiriSessionInfo *)self identifier];
  BOOL v5 = [v3 stringWithFormat:@"(id=%@, bsFail=%d, bsDone=%d, ssStart=%d, ssStop=%d)", v4, -[HMDActiveSiriSessionInfo didBulkSendSessionFail](self, "didBulkSendSessionFail"), -[HMDActiveSiriSessionInfo didBulkSendSessionComplete](self, "didBulkSendSessionComplete"), -[HMDActiveSiriSessionInfo didSiriSessionStart](self, "didSiriSessionStart"), -[HMDActiveSiriSessionInfo didSiriSessionStop](self, "didSiriSessionStop")];

  return (NSString *)v5;
}

- (HMDActiveSiriSessionInfo)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDActiveSiriSessionInfo;
  v9 = [(HMDActiveSiriSessionInfo *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

@end