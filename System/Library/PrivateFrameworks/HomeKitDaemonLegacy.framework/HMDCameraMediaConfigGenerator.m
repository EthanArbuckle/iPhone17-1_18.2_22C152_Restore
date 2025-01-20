@interface HMDCameraMediaConfigGenerator
+ (id)logCategory;
- (BOOL)_loadAVCAudioStreamConfig:(id)a3 protocolParameters:(id)a4;
- (BOOL)_loadAVCVideoStreamConfig:(id)a3 protocolParameters:(id)a4;
- (BOOL)_loadConfig:(id)a3 cipherCuite:(id)a4;
- (BOOL)extractReselectedConfigFromVideoTier:(id)a3 videoStreamConfig:(id *)a4;
- (BOOL)extractSelectedConfigFromProtocolParameters:(id)a3 videoStreamConfig:(id *)a4 audioStreamConfig:(id *)a5;
- (void)_loadConfig:(id)a3 sendSrtpParameters:(id)a4 receiveSrtpParameters:(id)a5;
- (void)_loadMiscConfig:(id)a3;
@end

@implementation HMDCameraMediaConfigGenerator

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_46180 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_46180, &__block_literal_global_46181);
  }
  v2 = (void *)logCategory__hmf_once_v9_46182;
  return v2;
}

uint64_t __44__HMDCameraMediaConfigGenerator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_46182;
  logCategory__hmf_once_v9_46182 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_loadMiscConfig:(id)a3
{
  id v3 = a3;
  [v3 setRtcpEnabled:1];
  [v3 setRtcpTimeOutEnabled:1];
  [v3 setRtcpTimeOutInterval:30.0];
  [v3 setRtpTimeOutEnabled:1];
  [v3 setRtpTimeOutInterval:30.0];
  [v3 setRateAdaptationEnabled:1];
}

- (BOOL)_loadConfig:(id)a3 cipherCuite:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [a4 srtpCryptoSuite];
  v7 = (uint64_t *)((char *)&unk_1D54D3DE0 + 8 * v6);
  if (v6 >= 3) {
    v7 = (uint64_t *)&kIPCameraUnknownParameter;
  }
  uint64_t v8 = *v7;
  if (*v7 != -1)
  {
    [v5 setSRTPCipherSuite:*v7];
    [v5 setSRTCPCipherSuite:v8];
  }

  return v8 != -1;
}

- (void)_loadConfig:(id)a3 sendSrtpParameters:(id)a4 receiveSrtpParameters:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 srtpMasterKey];
  v11 = (void *)[v10 mutableCopy];

  v12 = [v8 srtpMasterSalt];

  [v11 appendData:v12];
  [v9 setSendMasterKey:v11];
  v13 = [v7 srtpMasterKey];
  id v15 = (id)[v13 mutableCopy];

  v14 = [v7 srtpMasterSalt];

  [v15 appendData:v14];
  [v9 setReceiveMasterKey:v15];
}

- (BOOL)extractReselectedConfigFromVideoTier:(id)a3 videoStreamConfig:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = objc_alloc_init(HMDVideoStreamConfig);
  id v7 = [v5 videoResolution];
  uint64_t v8 = [v7 resolutionType];
  if ((unint64_t)(v8 - 1) >= 0x1D) {
    id v9 = (uint64_t *)&kIPCameraUnknownParameter;
  }
  else {
    id v9 = (uint64_t *)((char *)&unk_1D54D3CF8 + 8 * v8 - 8);
  }
  uint64_t v10 = *v9;

  if (v10 == -1)
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to translate image resolution", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    v11 = [(AVCMediaStreamConfig *)v6 video];
    [v11 setVideoResolution:v10];

    v12 = [v5 framerate];
    uint64_t v13 = [v12 unsignedIntegerValue];
    v14 = [(AVCMediaStreamConfig *)v6 video];
    [v14 setFramerate:v13];

    id v15 = [v5 maxBitRate];
    uint64_t v16 = [v15 unsignedIntegerValue];
    v17 = [(AVCMediaStreamConfig *)v6 video];
    [v17 setRxMaxBitrate:v16];

    v18 = [v5 minBitRate];
    uint64_t v19 = [v18 unsignedIntegerValue];
    v20 = [(AVCMediaStreamConfig *)v6 video];
    [v20 setRxMinBitrate:v19];

    *a4 = v6;
  }

  return v10 != -1;
}

- (BOOL)_loadAVCVideoStreamConfig:(id)a3 protocolParameters:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 selectedStreamConfigurationWrite];
  id v9 = [v8 videoParameters];
  uint64_t v10 = [v9 codec];
  uint64_t v11 = [v10 codecType];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [v7 selectedStreamConfigurationWrite];
      uint64_t v16 = [v15 videoParameters];
      v17 = [v16 codec];
      int v100 = 138543618;
      v101 = v14;
      __int16 v102 = 2048;
      uint64_t v103 = [v17 decodedNumber];
      v18 = "%{public}@Failed to translate to video codec type from %lu";
LABEL_4:
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v100, 0x16u);

LABEL_5:
    }
  }
  else
  {
    v21 = [v6 video];
    [v21 setTxCodecType:0];

    v22 = [v6 video];
    [v22 setRxCodecType:0];

    v23 = [v7 selectedStreamConfigurationWrite];
    v24 = [v23 videoParameters];
    int v25 = [v24 rtpParameters];
    v26 = [v25 payloadType];
    objc_msgSend(v6, "setTxPayloadType:", objc_msgSend(v26, "unsignedIntegerValue"));

    uint64_t v27 = [v7 selectedStreamConfigurationWrite];
    v28 = [v27 videoParameters];
    v29 = [v28 rtpParameters];
    v30 = [v29 payloadType];
    objc_msgSend(v6, "setRxPayloadType:", objc_msgSend(v30, "unsignedIntegerValue"));

    [v6 setDirection:2];
    v31 = [v7 selectedStreamConfigurationWrite];
    v32 = [v31 videoParameters];
    v33 = [v32 videoAttributes];
    v34 = [v33 videoResolution];
    uint64_t v35 = [v34 resolutionType];
    if ((unint64_t)(v35 - 1) >= 0x1D) {
      v36 = (uint64_t *)&kIPCameraUnknownParameter;
    }
    else {
      v36 = (uint64_t *)((char *)&unk_1D54D3CF8 + 8 * v35 - 8);
    }
    uint64_t v37 = *v36;

    if (v37 == -1)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      uint64_t v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      v14 = HMFGetLogIdentifier();
      int v100 = 138543362;
      v101 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to translate image resolution", (uint8_t *)&v100, 0xCu);
      goto LABEL_5;
    }
    v38 = [v6 video];
    [v38 setVideoResolution:v37];

    v39 = [v7 selectedStreamConfigurationWrite];
    v40 = [v39 videoParameters];
    v41 = [v40 videoAttributes];
    v42 = [v41 framerate];
    uint64_t v43 = [v42 unsignedIntegerValue];
    v44 = [v6 video];
    [v44 setFramerate:v43];

    v45 = [v7 selectedStreamConfigurationWrite];
    v46 = [v45 videoParameters];
    v47 = [v46 rtpParameters];
    v48 = [v47 maximumBitrate];
    uint64_t v49 = [v48 unsignedIntegerValue];
    v50 = [v6 video];
    [v50 setRxMaxBitrate:v49];

    v51 = [v7 selectedStreamConfigurationWrite];
    v52 = [v51 videoParameters];
    v53 = [v52 rtpParameters];
    v54 = [v53 minimumBitrate];
    uint64_t v55 = [v54 unsignedIntegerValue];
    v56 = [v6 video];
    [v56 setRxMinBitrate:v55];

    v57 = [v7 selectedStreamConfigurationWrite];
    v58 = [v57 videoParameters];
    v59 = [v58 rtpParameters];
    v60 = [v59 rtcpInterval];
    [v60 floatValue];
    [v6 setRtcpSendInterval:v61];

    v62 = [v7 setupEndPointWrite];
    v63 = [v62 address];
    v64 = [v63 ipAddress];
    v65 = [v6 localAddress];
    [v65 setIp:v64];

    v66 = [v7 setupEndPointWrite];
    v67 = [v66 address];
    v68 = [v67 videoRTPPort];
    uint64_t v69 = [v68 unsignedShortValue];
    v70 = [v6 localAddress];
    [v70 setPort:v69];

    v71 = [v7 setupEndPointWrite];
    v72 = [v71 address];
    uint64_t v73 = [v72 isIPv6Address];
    v74 = [v6 localAddress];
    [v74 setIsIPv6:v73];

    v75 = [v7 setupEndPointRead];
    v76 = [v75 address];
    v77 = [v76 ipAddress];
    v78 = [v6 remoteAddress];
    [v78 setIp:v77];

    v79 = [v7 setupEndPointRead];
    v80 = [v79 address];
    v81 = [v80 videoRTPPort];
    uint64_t v82 = [v81 unsignedShortValue];
    v83 = [v6 remoteAddress];
    [v83 setPort:v82];

    v84 = [v7 setupEndPointRead];
    v85 = [v84 address];
    uint64_t v86 = [v85 isIPv6Address];
    uint64_t v87 = [v6 remoteAddress];
    [(id)v87 setIsIPv6:v86];

    v88 = [v7 setupEndPointRead];
    v89 = [v88 address];
    v90 = [v89 videoRTPPort];
    objc_msgSend(v6, "setRtcpRemotePort:", objc_msgSend(v90, "unsignedShortValue"));

    v91 = [v7 setupEndPointRead];
    v92 = [v91 videoSrtpParameters];
    v93 = [v92 srtpCryptoSuite];
    LOBYTE(v87) = [(HMDCameraMediaConfigGenerator *)self _loadConfig:v6 cipherCuite:v93];

    if (v87)
    {
      v94 = [v7 setupEndPointWrite];
      v95 = [v94 videoSrtpParameters];
      v96 = [v7 setupEndPointRead];
      v97 = [v96 videoSrtpParameters];
      [(HMDCameraMediaConfigGenerator *)self _loadConfig:v6 sendSrtpParameters:v95 receiveSrtpParameters:v97];

      [(HMDCameraMediaConfigGenerator *)self _loadMiscConfig:v6];
      v98 = [v7 setupEndPointRead];
      v99 = [v98 videoSSRC];
      objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend(v99, "unsignedIntegerValue"));

      BOOL v19 = 1;
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [v7 setupEndPointRead];
      uint64_t v16 = [v15 videoSrtpParameters];
      v17 = [v16 srtpCryptoSuite];
      int v100 = 138543618;
      v101 = v14;
      __int16 v102 = 2048;
      uint64_t v103 = [v17 decodedNumber];
      v18 = "%{public}@Failed to translate to crypto suite for video from %lu";
      goto LABEL_4;
    }
  }
LABEL_6:

  BOOL v19 = 0;
LABEL_7:

  return v19;
}

- (BOOL)_loadAVCAudioStreamConfig:(id)a3 protocolParameters:(id)a4
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v109 = a3;
  id v5 = a4;
  v107 = [v5 selectedStreamConfigurationWrite];
  v106 = [v107 audioParameters];
  id v6 = [v106 codecGroup];
  uint64_t v7 = [v6 codec];
  v108 = v5;
  uint64_t v8 = [v5 selectedStreamConfigurationWrite];
  id v9 = [v8 audioParameters];
  uint64_t v10 = [v9 codecParameters];
  uint64_t v11 = [v10 audioSampleRates];
  v12 = [v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 sampleRate];
  uint64_t v14 = v13;
  int v15 = 0;
  uint64_t v16 = 2;
  switch(v7)
  {
    case 0:
      break;
    case 1:
      int v15 = 0;
      uint64_t v16 = 3;
      break;
    case 2:
      if (v13 == 1)
      {
        int v15 = 0;
        uint64_t v16 = 4;
      }
      else
      {
        if (v13 != 2) {
          goto LABEL_9;
        }
        int v15 = 0;
        uint64_t v16 = 5;
      }
      break;
    case 3:
      if (v13 == 1)
      {
        int v15 = 0;
        uint64_t v16 = 10;
      }
      else
      {
        if (v13 != 2) {
          goto LABEL_9;
        }
        int v15 = 0;
        uint64_t v16 = 9;
      }
      break;
    case 5:
      int v15 = 0;
      uint64_t v16 = 0;
      break;
    case 6:
      int v15 = 0;
      uint64_t v16 = 1;
      break;
    default:
LABEL_9:
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v104 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v111 = v104;
        __int16 v112 = 2048;
        uint64_t v113 = v7;
        __int16 v114 = 2048;
        uint64_t v115 = v14;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to translate the HMD audio codec type: %tu, sample rate: %tu", buf, 0x20u);
      }
      uint64_t v16 = -1;
      int v15 = 1;
      break;
  }

  if (v15)
  {
    BOOL v19 = (void *)MEMORY[0x1D9452090]();
    v20 = HMFGetOSLogHandle();
    v22 = v108;
    v21 = v109;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v108 selectedStreamConfigurationWrite];
      int v25 = [v24 audioParameters];
      v26 = [v25 codecGroup];
      uint64_t v27 = [v26 decodedNumber];
      *(_DWORD *)buf = 138543618;
      v111 = v23;
      __int16 v112 = 2048;
      uint64_t v113 = v27;
      v28 = "%{public}@Failed to translate to audio codec type from %lu";
LABEL_23:
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v21 = v109;
  v29 = [v109 audio];
  [v29 setCodecType:v16];

  v30 = [v109 audio];
  [v30 setOctetAligned:1];

  v31 = [v109 audio];
  [v31 setDtxEnabled:1];

  v22 = v108;
  v32 = [v108 selectedStreamConfigurationWrite];
  v33 = [v32 audioParameters];
  v34 = [v33 rtpParameters];
  uint64_t v35 = [v34 payloadType];
  objc_msgSend(v109, "setTxPayloadType:", objc_msgSend(v35, "unsignedIntegerValue"));

  v36 = [v108 selectedStreamConfigurationWrite];
  uint64_t v37 = [v36 audioParameters];
  v38 = [v37 rtpParameters];
  v39 = [v38 payloadType];
  objc_msgSend(v109, "setRxPayloadType:", objc_msgSend(v39, "unsignedIntegerValue"));

  [v109 setDirection:3];
  v40 = [v108 selectedStreamConfigurationWrite];
  v41 = [v40 audioParameters];
  v42 = [v41 rtpParameters];
  uint64_t v43 = [v42 rtcpInterval];
  [v43 floatValue];
  [v109 setRtcpSendInterval:v44];

  v45 = [v108 setupEndPointWrite];
  v46 = [v45 address];
  v47 = [v46 ipAddress];
  v48 = [v109 localAddress];
  [v48 setIp:v47];

  uint64_t v49 = [v108 setupEndPointWrite];
  v50 = [v49 address];
  v51 = [v50 audioRTPPort];
  uint64_t v52 = [v51 unsignedShortValue];
  v53 = [v109 localAddress];
  [v53 setPort:v52];

  v54 = [v108 setupEndPointWrite];
  uint64_t v55 = [v54 address];
  uint64_t v56 = [v55 isIPv6Address];
  v57 = [v109 localAddress];
  [v57 setIsIPv6:v56];

  v58 = [v108 setupEndPointRead];
  v59 = [v58 address];
  v60 = [v59 ipAddress];
  float v61 = [v109 remoteAddress];
  [v61 setIp:v60];

  v62 = [v108 setupEndPointRead];
  v63 = [v62 address];
  v64 = [v63 audioRTPPort];
  uint64_t v65 = [v64 unsignedShortValue];
  v66 = [v109 remoteAddress];
  [v66 setPort:v65];

  v67 = [v108 setupEndPointRead];
  v68 = [v67 address];
  uint64_t v69 = [v68 isIPv6Address];
  v70 = [v109 remoteAddress];
  [v70 setIsIPv6:v69];

  v71 = [v108 setupEndPointRead];
  v72 = [v71 address];
  uint64_t v73 = [v72 audioRTPPort];
  objc_msgSend(v109, "setRtcpRemotePort:", objc_msgSend(v73, "unsignedShortValue"));

  v74 = [v109 audio];
  [v74 setAudioStreamMode:3];

  v75 = [v108 selectedStreamConfigurationWrite];
  v76 = [v75 audioParameters];
  v77 = [v76 comfortNoiseEnabled];
  uint64_t v78 = [v77 BOOLValue];
  v79 = [v109 audio];
  [v79 setCnEnabled:v78];

  v80 = [v108 selectedStreamConfigurationWrite];
  v81 = [v80 audioParameters];
  uint64_t v82 = [v81 rtpParameters];
  v83 = [v82 comfortNoisePayloadType];
  uint64_t v84 = [v83 unsignedIntegerValue];
  v85 = [v109 audio];
  [v85 setCnPayloadType:v84];

  uint64_t v86 = [v108 selectedStreamConfigurationWrite];
  uint64_t v87 = [v86 audioParameters];
  v88 = [v87 codecParameters];
  uint64_t v89 = [v88 rtpPtime];
  uint64_t v90 = [(id)v89 unsignedIntegerValue];
  v91 = [v109 audio];
  [v91 setPtime:v90];

  v92 = [v108 setupEndPointRead];
  v93 = [v92 audioSrtpParameters];
  v94 = [v93 srtpCryptoSuite];
  LOBYTE(v89) = [(HMDCameraMediaConfigGenerator *)self _loadConfig:v109 cipherCuite:v94];

  if ((v89 & 1) == 0)
  {
    BOOL v19 = (void *)MEMORY[0x1D9452090]();
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v108 setupEndPointRead];
      int v25 = [v24 audioSrtpParameters];
      v26 = [v25 srtpCryptoSuite];
      uint64_t v102 = [v26 decodedNumber];
      *(_DWORD *)buf = 138543618;
      v111 = v23;
      __int16 v112 = 2048;
      uint64_t v113 = v102;
      v28 = "%{public}@Failed to translate to crypto suite for audio from %lu";
      goto LABEL_23;
    }
LABEL_24:

    BOOL v101 = 0;
    goto LABEL_25;
  }
  v95 = [v108 setupEndPointWrite];
  v96 = [v95 audioSrtpParameters];
  v97 = [v108 setupEndPointRead];
  v98 = [v97 audioSrtpParameters];
  [(HMDCameraMediaConfigGenerator *)self _loadConfig:v109 sendSrtpParameters:v96 receiveSrtpParameters:v98];

  [(HMDCameraMediaConfigGenerator *)self _loadMiscConfig:v109];
  v99 = [v108 setupEndPointRead];
  int v100 = [v99 audioSSRC];
  objc_msgSend(v109, "setRemoteSSRC:", objc_msgSend(v100, "unsignedIntegerValue"));

  BOOL v101 = 1;
LABEL_25:

  return v101;
}

- (BOOL)extractSelectedConfigFromProtocolParameters:(id)a3 videoStreamConfig:(id *)a4 audioStreamConfig:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(HMDVideoStreamConfig);
  if ([(HMDCameraMediaConfigGenerator *)self _loadAVCVideoStreamConfig:v9 protocolParameters:v8])
  {
    uint64_t v10 = objc_alloc_init(HMDAudioStreamConfig);
    BOOL v11 = [(HMDCameraMediaConfigGenerator *)self _loadAVCAudioStreamConfig:v10 protocolParameters:v8];
    if (v11)
    {
      if (a4) {
        *a4 = v9;
      }
      if (a5) {
        *a5 = v10;
      }
    }
    else
    {
      int v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v19 = 138543362;
        v20 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to load audio config from the protocol parameters", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to load video config from the protocol parameters", (uint8_t *)&v19, 0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

@end