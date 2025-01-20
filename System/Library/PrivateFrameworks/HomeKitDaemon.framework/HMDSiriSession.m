@interface HMDSiriSession
+ (id)siriSessionForUI;
- (BOOL)_startStream;
- (BOOL)activateAfterHubInitiation;
- (BOOL)activateWithAccessory:(id)a3 metadata:(id)a4;
- (BOOL)isActivationPending;
- (HMDActiveSiriSessionInfo)activeSessionInfo;
- (HMDSiriRemoteInputServer)server;
- (HMDSiriSession)initWithIdentifier:(id)a3 deviceType:(id)a4;
- (HMDSiriSession)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 deviceType:(id)a5;
- (HMDSiriStreamStartEvent)streamStartMetric;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSNumber)deviceType;
- (NSString)identifier;
- (OS_xpc_object)boostMessage;
- (id)_createArgsDictionaryWithError:(id)a3;
- (void)activeSiriSession:(id)a3 didCreateAudioFrame:(id)a4 sequenceNumber:(id)a5 gain:(id)a6;
- (void)activeSiriSessionDidStop:(id)a3;
- (void)beginTrackingStreamStartMetricWithActivationType:(unint64_t)a3;
- (void)handleResetStream;
- (void)handleStartStream;
- (void)handleStopStream;
- (void)invalidate;
- (void)maybeSubmitStreamStartMetricWithError:(id)a3;
- (void)publish;
- (void)sendMsg:(const char *)a3 args:(id)a4;
- (void)setActiveBulkSendSession:(id)a3;
- (void)setActiveSessionInfo:(id)a3;
- (void)setBoostMessage:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setIsActivationPending:(BOOL)a3;
- (void)setServer:(id)a3;
- (void)setStreamStartMetric:(id)a3;
- (void)stopStream;
@end

@implementation HMDSiriSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_activeSessionInfo, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_streamStartMetric, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setBoostMessage:(id)a3
{
}

- (OS_xpc_object)boostMessage
{
  return self->_boostMessage;
}

- (void)setIsActivationPending:(BOOL)a3
{
  self->_isActivationPending = a3;
}

- (BOOL)isActivationPending
{
  return self->_isActivationPending;
}

- (void)setDeviceType:(id)a3
{
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setActiveSessionInfo:(id)a3
{
}

- (HMDActiveSiriSessionInfo)activeSessionInfo
{
  return self->_activeSessionInfo;
}

- (void)setServer:(id)a3
{
}

- (HMDSiriRemoteInputServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (HMDSiriRemoteInputServer *)WeakRetained;
}

- (void)setStreamStartMetric:(id)a3
{
}

- (HMDSiriStreamStartEvent)streamStartMetric
{
  return self->_streamStartMetric;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_createArgsDictionaryWithError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 encodeObject:v4 forKey:@"kMsgArgError"];

  v9 = @"kMsgArgError";
  v6 = [v5 encodedData];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

- (void)sendMsg:(const char *)a3 args:(id)a4
{
  id v11 = a4;
  v6 = (void *)MEMORY[0x263EFF9A0];
  v7 = [(HMDSiriSession *)self identifier];
  v8 = [v6 dictionaryWithObject:v7 forKey:@"kMsgArgIdentifier"];

  if (v11) {
    [v8 addEntriesFromDictionary:v11];
  }
  v9 = [(HMDSiriSession *)self server];
  v10 = [NSString stringWithUTF8String:a3];
  [v9 sendMsgIfCheckedIn:v10 args:v8];
}

- (BOOL)_startStream
{
  v3 = [(HMDSiriSession *)self activeSessionInfo];

  if (v3 || (BOOL v4 = [(HMDSiriSession *)self activateAfterHubInitiation]))
  {
    id v5 = [(HMDSiriSession *)self activeSessionInfo];
    [v5 markSiriPluginReady];

    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)maybeSubmitStreamStartMetricWithError:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(HMDSiriSession *)self streamStartMetric];

  if (v4)
  {
    id v5 = [(HMDSiriSession *)self logEventSubmitter];
    v6 = [(HMDSiriSession *)self streamStartMetric];
    [v5 submitLogEvent:v6 error:v7];

    [(HMDSiriSession *)self setStreamStartMetric:0];
  }
}

- (void)beginTrackingStreamStartMetricWithActivationType:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  logger = self->_logger;
  v6 = [(HMDSiriSession *)self activeSessionInfo];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(logger, v6);

  v8 = self->_logger;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    if (a3 - 1 > 3) {
      v10 = @"Unknown";
    }
    else {
      v10 = off_264A23028[a3 - 1];
    }
    id v11 = v10;
    v12 = [(HMDSiriSession *)self identifier];
    int v19 = 138412546;
    v20 = v11;
    __int16 v21 = 2112;
    v22 = v12;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SiriSession", "ActivationType=%@ AccessoryID=%@", (uint8_t *)&v19, 0x16u);
  }
  v13 = [(HMDSiriSession *)self streamStartMetric];

  if (v13)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Resetting start stream metric", (uint8_t *)&v19, 0xCu);
    }
  }
  v18 = [[HMDSiriStreamStartEvent alloc] initWithActivationType:a3];
  [(HMDSiriSession *)self setStreamStartMetric:v18];
}

- (void)stopStream
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(HMDSiriSession *)self activeSessionInfo];

  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      v8 = HMFGetLogIdentifier();
      v9 = [(HMDSiriSession *)v5 identifier];
      int v24 = 138543618;
      v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Session %@ stopped the audio", (uint8_t *)&v24, 0x16u);
    }
    v10 = v5->_logger;
    logger = v5->_logger;
    v12 = [(HMDSiriSession *)v5 activeSessionInfo];
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(logger, v12);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v14 = [(HMDSiriSession *)v5 identifier];
      int v24 = 138412290;
      v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v10, OS_SIGNPOST_INTERVAL_END, v13, "SiriSession", "AccessoryID=%@", (uint8_t *)&v24, 0xCu);
    }
    v15 = [(HMDSiriSession *)v5 activeSessionInfo];
    [v15 markSiriPluginStopped];

    v16 = [(HMDSiriSession *)v5 activeSessionInfo];
    [v16 invalidate];

    [(HMDSiriSession *)v5 setActiveSessionInfo:0];
  }
  else
  {
    if (v7)
    {
      v17 = HMFGetLogIdentifier();
      v18 = [(HMDSiriSession *)v5 identifier];
      int v24 = 138543618;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Session %@ did stop but was not active (stale notification?)", (uint8_t *)&v24, 0x16u);
    }
  }
  int v19 = [(HMDSiriSession *)v5 boostMessage];

  if (v19)
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    __int16 v21 = v5;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Releasing boost message", (uint8_t *)&v24, 0xCu);
    }
    [(HMDSiriSession *)v21 setBoostMessage:0];
  }
  [(HMDSiriSession *)v5 setIsActivationPending:0];
}

- (void)activeSiriSessionDidStop:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDSiriSession *)v6 identifier];
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    os_signpost_id_t v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[session %@] Deactivating Siri Session", (uint8_t *)&v10, 0x16u);
  }
  [(HMDSiriSession *)v6 deactivate];
}

- (void)handleResetStream
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDSiriSession *)v4 identifier];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Resetting stream", (uint8_t *)&v8, 0x16u);
  }
  [(HMDSiriSession *)v4 stopStream];
}

- (void)handleStopStream
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDSiriSession *)v4 identifier];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Stopping stream", (uint8_t *)&v8, 0x16u);
  }
  [(HMDSiriSession *)v4 stopStream];
  [(HMDSiriSession *)v4 sendMsg:"TransportDidStop" args:0];
}

- (void)handleStartStream
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDSiriSession *)v4 identifier];
    int v15 = 138543618;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Starting stream", (uint8_t *)&v15, 0x16u);
  }
  int v8 = v4->_logger;
  logger = v4->_logger;
  __int16 v10 = [(HMDSiriSession *)v4 activeSessionInfo];
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(logger, v10);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v12 = [(HMDSiriSession *)v4 identifier];
    int v15 = 138412290;
    v16 = v12;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v8, OS_SIGNPOST_EVENT, v11, "SiriRecording", "AccessoryID=%@", (uint8_t *)&v15, 0xCu);
  }
  if ([(HMDSiriSession *)v4 _startStream])
  {
    os_signpost_id_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1055];
    os_signpost_id_t v13 = [(HMDSiriSession *)v4 _createArgsDictionaryWithError:v14];
  }
  [(HMDSiriSession *)v4 maybeSubmitStreamStartMetricWithError:v14];
  [(HMDSiriSession *)v4 sendMsg:"TransportDidStart" args:v13];
}

- (void)publish
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDSiriSession *)v4 identifier];
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v13 = v6;
    __int16 v14 = 2112;
    int v15 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Telling plugin to add this session as device", buf, 0x16u);
  }
  int v8 = [(HMDSiriSession *)v4 deviceType];
  os_signpost_id_t v11 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [(HMDSiriSession *)v4 sendMsg:"Publish" args:v9];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDSiriSession *)v4 identifier];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    os_signpost_id_t v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[session %@] Invalidate", (uint8_t *)&v8, 0x16u);
  }
  [(HMDSiriSession *)v4 sendMsg:"Unpublish" args:0];
}

- (void)activeSiriSession:(id)a3 didCreateAudioFrame:(id)a4 sequenceNumber:(id)a5 gain:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    v18 = [(HMDSiriSession *)v15 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    v25 = v18;
    __int16 v26 = 2048;
    uint64_t v27 = [v11 length];
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[session %@] Send frame (%lu bytes)", buf, 0x20u);
  }
  v20[0] = @"kMsgArgData";
  v20[1] = @"kSeqNum";
  v21[0] = v11;
  v21[1] = v12;
  v20[2] = @"kGain";
  v21[2] = v13;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [(HMDSiriSession *)v15 sendMsg:"AudioFrame" args:v19];
}

- (void)setActiveBulkSendSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSiriSession *)self activeSessionInfo];
  [v5 setActiveBulkSendSession:v4];

  v6 = [(HMDSiriSession *)self activeSessionInfo];
  if ([v6 isSiriSessionActive])
  {
LABEL_6:

    goto LABEL_7;
  }
  BOOL v7 = [(HMDSiriSession *)self isActivationPending];

  if (v7)
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [(HMDSiriSession *)v9 identifier];
      int v13 = 138543618;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Siri session is inactive and activation is pending, reading first frame (%@)", (uint8_t *)&v13, 0x16u);
    }
    v6 = [(HMDSiriSession *)v9 activeSessionInfo];
    [v6 readFirstFrame];
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)activateAfterHubInitiation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDSiriSession *)v4 identifier];
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Hub initiated Siri input not supported for this Siri session (%@)", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (BOOL)activateWithAccessory:(id)a3 metadata:(id)a4
{
  return 0;
}

- (HMDSiriSession)initWithIdentifier:(id)a3 deviceType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[HMDMetricsManager sharedLogEventSubmitter];
  int v9 = [(HMDSiriSession *)self initWithIdentifier:v7 logEventSubmitter:v8 deviceType:v6];

  return v9;
}

- (HMDSiriSession)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 deviceType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDSiriSession;
  id v12 = [(HMDSiriSession *)&v16 init];
  if (v12)
  {
    uint64_t v13 = HMFGetOSLogHandle();
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_deviceType, a5);
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v12->_logEventSubmitter, a4);
    v12->_isActivationPending = 0;
  }

  return v12;
}

+ (id)siriSessionForUI
{
  return 0;
}

@end