@interface HMDCameraStreamSession
+ (id)logCategory;
- (HMDCameraProtocolParameters)protocolParameters;
- (HMDCameraStreamManager)streamManager;
- (HMDCameraStreamSession)initWithSessionID:(id)a3 streamingTierType:(unint64_t)a4 remoteCapabilities:(id)a5 streamPreference:(id)a6;
- (HMDCameraStreamSessionID)sessionID;
- (HMDCameraVideoTierParameters)videoTierParameters;
- (HMDStreamingCapabilities)streamingCapabilities;
- (id)logIdentifier;
- (id)negotiatedParameters;
- (void)setProtocolParameters:(id)a3;
- (void)setStreamManager:(id)a3;
- (void)setVideoTierParameters:(id)a3;
@end

@implementation HMDCameraStreamSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoTierParameters, 0);
  objc_storeStrong((id *)&self->_protocolParameters, 0);
  objc_storeStrong((id *)&self->_streamingCapabilities, 0);
  objc_storeStrong((id *)&self->_streamManager, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setVideoTierParameters:(id)a3
{
}

- (HMDCameraVideoTierParameters)videoTierParameters
{
  return self->_videoTierParameters;
}

- (void)setProtocolParameters:(id)a3
{
}

- (HMDCameraProtocolParameters)protocolParameters
{
  return self->_protocolParameters;
}

- (HMDStreamingCapabilities)streamingCapabilities
{
  return self->_streamingCapabilities;
}

- (void)setStreamManager:(id)a3
{
}

- (HMDCameraStreamManager)streamManager
{
  return self->_streamManager;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraStreamSession *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (id)negotiatedParameters
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08910];
  v4 = [(HMDCameraStreamSession *)self protocolParameters];
  v5 = [v3 archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];

  v6 = (void *)MEMORY[0x263F08910];
  v7 = [(HMDCameraStreamSession *)self videoTierParameters];
  v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];

  v9 = 0;
  if (v5) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v12[0] = @"kSelectedStreamParameters";
    v12[1] = @"kVideoTierParameters";
    v13[0] = v5;
    v13[1] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  }

  return v9;
}

- (HMDCameraStreamSession)initWithSessionID:(id)a3 streamingTierType:(unint64_t)a4 remoteCapabilities:(id)a5 streamPreference:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)HMDCameraStreamSession;
  v14 = [(HMDCameraStreamSession *)&v41 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sessionID, a3);
    v16 = objc_alloc_init(HMDCameraProtocolParameters);
    protocolParameters = v15->_protocolParameters;
    v15->_protocolParameters = v16;

    v18 = [[HMDStreamingCapabilities alloc] initWithStreamPreference:v13];
    streamingCapabilities = v15->_streamingCapabilities;
    v15->_streamingCapabilities = v18;

    [(HMDStreamingCapabilities *)v15->_streamingCapabilities setStreamingTierType:a4];
    v20 = objc_msgSend(v12, "hmf_dataForKey:", @"kRemoteStreamCapabilities");
    if (v20)
    {
      id v40 = 0;
      v21 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v20 error:&v40];
      v22 = (HMDStreamingCapabilities *)v40;
      if (v21)
      {
        [(HMDStreamingCapabilities *)v15->_streamingCapabilities updateWithRemoteSettings:v21];
      }
      else
      {
        id v39 = v11;
        v23 = (void *)MEMORY[0x230FBD990]();
        v24 = v15;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = v38 = v23;
          *(_DWORD *)buf = 138543618;
          v43 = v26;
          __int16 v44 = 2112;
          v45 = v22;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive remote streaming capabilities from remote capabilities data: %@", buf, 0x16u);

          v23 = v38;
        }

        id v11 = v39;
      }
    }
    v27 = [v13 videoPreferences];

    if (v27)
    {
      v28 = [v13 videoPreferences];
      uint64_t v29 = [v28 maximumQuality];
    }
    else
    {
      uint64_t v29 = 5;
    }
    v30 = [[HMDCameraVideoTierParameters alloc] initWithSessionID:v11 streamingCapabilities:v15->_streamingCapabilities maximumQuality:v29];
    videoTierParameters = v15->_videoTierParameters;
    v15->_videoTierParameters = v30;

    v32 = (void *)MEMORY[0x230FBD990]();
    v33 = v15;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = HMFGetLogIdentifier();
      v36 = v15->_streamingCapabilities;
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      __int16 v44 = 2112;
      v45 = v36;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Initialized stream session with capabilities: %@", buf, 0x16u);
    }
  }
  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_247220 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_247220, &__block_literal_global_247221);
  }
  v2 = (void *)logCategory__hmf_once_v3_247222;
  return v2;
}

void __37__HMDCameraStreamSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_247222;
  logCategory__hmf_once_v3_247222 = v0;
}

@end