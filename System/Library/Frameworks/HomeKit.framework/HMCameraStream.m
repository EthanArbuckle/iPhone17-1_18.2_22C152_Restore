@interface HMCameraStream
+ (id)logCategory;
- (HMCameraStream)init;
- (HMCameraStream)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(double)a5 sessionID:(id)a6 audioStreamSetting:(unint64_t)a7;
- (NSNumber)internalAudioVolume;
- (NSString)sessionID;
- (unint64_t)internalAudioStreamSetting;
- (void)_handleAudioStreamSettingUpdate:(unint64_t)a3 withError:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)_issueUpdateAudioStreamSettingRequest:(unint64_t)a3 completionHandler:(id)a4;
- (void)_updateAudioStreamSetting:(unint64_t)a3 completionHandler:(id)a4;
- (void)_updateAudioVolume:(id)a3 completionHandler:(id)a4;
- (void)_updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)setAudioStreamSetting:(HMCameraAudioStreamSetting)audioStreamSetting;
- (void)setInternalAudioStreamSetting:(unint64_t)a3;
- (void)setInternalAudioVolume:(id)a3;
- (void)updateAudioStreamSetting:(HMCameraAudioStreamSetting)audioStreamSetting completionHandler:(void *)completion;
- (void)updateAudioVolume:(id)a3 completionHandler:(id)a4;
- (void)updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation HMCameraStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAudioVolume, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setInternalAudioVolume:(id)a3
{
}

- (NSNumber)internalAudioVolume
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInternalAudioStreamSetting:(unint64_t)a3
{
  self->_internalAudioStreamSetting = a3;
}

- (unint64_t)internalAudioStreamSetting
{
  return self->_internalAudioStreamSetting;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)_updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMCameraSource *)self context];
  if (!v6)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream _updateMaximumVideoResolutionQuality:completionHandler:]", @"completion"];
    v31 = (void *)MEMORY[0x19F3A64A0]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v34;
      __int16 v43 = 2112;
      v44 = (const char *)v30;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    objc_exception_throw(v35);
  }
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v13;
      __int16 v43 = 2048;
      v44 = (const char *)a3;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating stream video resolution quality to: %lu", buf, 0x16u);
    }
    v39[0] = @"kCameraSessionID";
    v14 = [(HMCameraStream *)v10 sessionID];
    v39[1] = @"HMCameraStreamVideoResolutionQualityMessageKey";
    v40[0] = v14;
    v15 = [NSNumber numberWithInteger:a3];
    v40[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

    id v17 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    v19 = [(HMCameraSource *)v10 profileUniqueIdentifier];
    v20 = (void *)[v18 initWithTarget:v19];
    v21 = (void *)[v17 initWithName:@"HMCameraStreamUpdateMaximumVideoResolutionQualityMessage" destination:v20 payload:v16];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __73__HMCameraStream__updateMaximumVideoResolutionQuality_completionHandler___block_invoke;
    v36[3] = &unk_1E5945510;
    v36[4] = v10;
    id v22 = v8;
    id v37 = v22;
    id v38 = v6;
    v23 = (void *)MEMORY[0x19F3A64A0]([v21 setResponseHandler:v36]);
    v24 = v10;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [(HMCameraStream *)v24 sessionID];
      *(_DWORD *)buf = 138543618;
      v42 = v26;
      __int16 v43 = 2112;
      v44 = v27;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Sending update video resolution quality message for session ID: %@", buf, 0x16u);
    }
    v28 = [v22 messageDispatcher];
    [v28 sendMessage:v21];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v42 = v29;
      __int16 v43 = 2080;
      v44 = "-[HMCameraStream _updateMaximumVideoResolutionQuality:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v16);
  }
}

void __73__HMCameraStream__updateMaximumVideoResolutionQuality_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      v12 = "%{public}@Failed to update video resoluiton quality: %@";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v11;
    v12 = "%{public}@Successfully updated video resolution quality";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)_handleAudioStreamSettingUpdate:(unint64_t)a3 withError:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x19F3A64A0]();
  os_log_type_t v14 = self;
  uint32_t v15 = HMFGetOSLogHandle();
  v16 = v15;
  if (v10)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v21 = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio stream setting: %@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v21 = 138543362;
      id v22 = v18;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully updated audio stream setting", (uint8_t *)&v21, 0xCu);
    }
    [(HMCameraStream *)v14 setInternalAudioStreamSetting:a3];
  }
  __int16 v19 = [v11 delegateCaller];
  id v20 = [v10 hmPublicError];
  [v19 callCompletion:v12 error:v20];
}

- (void)_issueUpdateAudioStreamSettingRequest:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMCameraSource *)self context];
  if (!v6)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream _issueUpdateAudioStreamSettingRequest:completionHandler:]", @"completion"];
    __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v26;
      __int16 v36 = 2112;
      id v37 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v8 = (void *)v7;
  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F65488]);
    id v10 = [(HMCameraSource *)self profileUniqueIdentifier];
    id v11 = (void *)[v9 initWithTarget:v10];

    v32[0] = @"kCameraSessionID";
    id v12 = [(HMCameraStream *)self sessionID];
    v32[1] = @"kAudioStreamSetting";
    v33[0] = v12;
    v13 = [NSNumber numberWithUnsignedInteger:a3];
    v33[1] = v13;
    os_log_type_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

    uint32_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMCameraStreamSetAudioStreamSettingMessage" destination:v11 payload:v14];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __74__HMCameraStream__issueUpdateAudioStreamSettingRequest_completionHandler___block_invoke;
    v28[3] = &unk_1E5941330;
    v28[4] = self;
    unint64_t v31 = a3;
    id v16 = v8;
    id v29 = v16;
    id v30 = v6;
    [v15 setResponseHandler:v28];
    int v17 = [v16 messageDispatcher];
    [v17 sendMessage:v15];
  }
  else
  {
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v21;
      __int16 v36 = 2080;
      id v37 = "-[HMCameraStream _issueUpdateAudioStreamSettingRequest:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

uint64_t __74__HMCameraStream__issueUpdateAudioStreamSettingRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAudioStreamSettingUpdate:*(void *)(a1 + 56) withError:a2 context:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_updateAudioVolume:(id)a3 completionHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = [(HMCameraSource *)self context];
  if (!v7)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream _updateAudioVolume:completionHandler:]", @"completion"];
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v28;
      __int16 v38 = 2112;
      v39 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v9 = (void *)v8;
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v14;
      __int16 v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating audio volume to %@", buf, 0x16u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F65488]);
    id v16 = [(HMCameraSource *)v11 profileUniqueIdentifier];
    int v17 = (void *)[v15 initWithTarget:v16];

    v34[0] = @"kCameraSessionID";
    id v18 = [(HMCameraStream *)v11 sessionID];
    v34[1] = @"HMCameraStreamAudioVolumeSettingMessageKey";
    v35[0] = v18;
    v35[1] = v6;
    __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMCameraStreamSetAudioVolumeMessage" destination:v17 payload:v19];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __55__HMCameraStream__updateAudioVolume_completionHandler___block_invoke;
    v30[3] = &unk_1E59441B0;
    v30[4] = v11;
    unint64_t v31 = v6;
    id v21 = v9;
    id v32 = v21;
    id v33 = v7;
    [v20 setResponseHandler:v30];
    uint64_t v22 = [v21 messageDispatcher];
    [v22 sendMessage:v20];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v23;
      __int16 v38 = 2080;
      v39 = "-[HMCameraStream _updateAudioVolume:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

void __55__HMCameraStream__updateAudioVolume_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio volume: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully updated audio volume", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 32) setInternalAudioVolume:*(void *)(a1 + 40)];
  }
  v13 = [*(id *)(a1 + 48) delegateCaller];
  [v13 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)_updateAudioStreamSetting:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMCameraSource *)self context];
  if (!v6)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream _updateAudioStreamSetting:completionHandler:]", @"completion"];
    __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v26;
      __int16 v34 = 2112;
      id v35 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v8 = (void *)v7;
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      HMCameraAudioStreamSettingAsString(a3);
      int v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating audio stream setting to %@", buf, 0x16u);
    }
    if (a3 - 1 >= 2)
    {
      if (a3 == 3)
      {
        id v17 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v18 = v10;
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v33 = v20;
          _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Requesting access for microphone", buf, 0xCu);
        }
        id v21 = [v8 queue];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __62__HMCameraStream__updateAudioStreamSetting_completionHandler___block_invoke;
        v28[3] = &unk_1E593F660;
        v28[4] = v18;
        uint64_t v31 = 3;
        id v30 = v6;
        id v29 = v8;
        __HMPrivacyRequestAccessForService(*MEMORY[0x1E4FA9AA8], v21, v28);
      }
    }
    else
    {
      [(HMCameraStream *)v10 _issueUpdateAudioStreamSettingRequest:a3 completionHandler:v6];
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v15;
      __int16 v34 = 2080;
      id v35 = "-[HMCameraStream _updateAudioStreamSetting:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v16);
  }
}

void __62__HMCameraStream__updateAudioStreamSetting_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v8;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Request for microphone access was granted", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) _issueUpdateAudioStreamSettingRequest:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    if (v7)
    {
      id v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v9;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Request for microphone access was not granted", (uint8_t *)&v13, 0xCu);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:89];
    [v10 _handleAudioStreamSettingUpdate:v11 withError:v12 context:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)updateMaximumVideoResolutionQuality:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(HMCameraSource *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream updateMaximumVideoResolutionQuality:completionHandler:]", @"completion"];
    __int16 v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMCameraStream_updateMaximumVideoResolutionQuality_completionHandler___block_invoke;
    block[3] = &unk_1E5944C10;
    block[4] = self;
    int64_t v23 = a3;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v13;
      __int16 v26 = 2080;
      id v27 = "-[HMCameraStream updateMaximumVideoResolutionQuality:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __72__HMCameraStream_updateMaximumVideoResolutionQuality_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaximumVideoResolutionQuality:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)setAudioStreamSetting:(HMCameraAudioStreamSetting)audioStreamSetting
{
}

- (void)updateAudioVolume:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMCameraSource *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream updateAudioVolume:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMCameraStream_updateAudioVolume_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMCameraStream updateAudioVolume:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __54__HMCameraStream_updateAudioVolume_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAudioVolume:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)updateAudioStreamSetting:(HMCameraAudioStreamSetting)audioStreamSetting completionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = completion;
  id v7 = [(HMCameraSource *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraStream updateAudioStreamSetting:completionHandler:]", @"completion"];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      __int16 v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HMCameraStream_updateAudioStreamSetting_completionHandler___block_invoke;
    block[3] = &unk_1E5944C10;
    block[4] = self;
    HMCameraAudioStreamSetting v23 = audioStreamSetting;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v13;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMCameraStream updateAudioStreamSetting:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __61__HMCameraStream_updateAudioStreamSetting_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAudioStreamSetting:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  v3 = [(HMCameraSource *)self context];
  v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  v5.receiver = self;
  v5.super_class = (Class)HMCameraStream;
  [(HMCameraStream *)&v5 dealloc];
}

- (HMCameraStream)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(double)a5 sessionID:(id)a6 audioStreamSetting:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (a5 == 0.0)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_11:
    id v21 = (HMCameraStream *)_HMFPreconditionFailure();
    return [(HMCameraStream *)v21 init];
  }
  v23.receiver = self;
  v23.super_class = (Class)HMCameraStream;
  uint64_t v16 = [(HMCameraSource *)&v23 initWithProfileUniqueIdentifier:v12 slotIdentifier:v13 aspectRatio:a5];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    sessionID = v16->_sessionID;
    v16->_sessionID = (NSString *)v17;

    v16->_internalAudioStreamSetting = a7;
    internalAudioVolume = v16->_internalAudioVolume;
    v16->_internalAudioVolume = (NSNumber *)&unk_1EEF08F90;
  }
  return v16;
}

- (HMCameraStream)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraStream;
  return [(HMCameraSource *)&v3 init];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27 != -1) {
    dispatch_once(&logCategory__hmf_once_t27, &__block_literal_global_55);
  }
  v2 = (void *)logCategory__hmf_once_v28;

  return v2;
}

uint64_t __29__HMCameraStream_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v28;
  logCategory__hmf_once_uint64_t v28 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end