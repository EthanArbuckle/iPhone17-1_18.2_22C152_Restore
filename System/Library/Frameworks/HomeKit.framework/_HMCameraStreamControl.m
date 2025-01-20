@interface _HMCameraStreamControl
+ (id)logCategory;
- (HMCameraStream)cameraStream;
- (NSString)sessionID;
- (_HMCameraStreamControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4;
- (_HMCameraStreamControlDelegate)delegate;
- (unint64_t)streamState;
- (void)__configureWithContext:(id)a3;
- (void)_callVideoStartedDelegate;
- (void)_callVideoStoppedDelegateWithError:(id)a3;
- (void)_handleStreamStartedWithResponse:(id)a3 sessionID:(id)a4 error:(id)a5;
- (void)_handleVideoStopResponse:(id)a3 sessionID:(id)a4 error:(id)a5;
- (void)_handleVideoStreamStopped:(id)a3;
- (void)_resetStateWithError:(id)a3;
- (void)dealloc;
- (void)setCameraStream:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStreamState:(unint64_t)a3;
- (void)startStreamWithPreferences:(id)a3;
- (void)stopStream;
@end

@implementation _HMCameraStreamControl

- (_HMCameraStreamControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_HMCameraStreamControl;
  result = [(_HMCameraControl *)&v5 initWithCameraProfile:a3 profileUniqueIdentifier:a4];
  if (result) {
    result->_streamState = 4;
  }
  return result;
}

- (void)dealloc
{
  v3 = [(_HMCameraControl *)self context];
  v4 = [v3 messageDispatcher];
  [v4 deregisterReceiver:self];

  v5.receiver = self;
  v5.super_class = (Class)_HMCameraStreamControl;
  [(_HMCameraStreamControl *)&v5 dealloc];
}

- (void)__configureWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HMCameraStreamControl;
  [(_HMCameraControl *)&v12 __configureWithContext:v4];
  objc_super v5 = [(_HMCameraControl *)self context];
  v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"HMCameraStreamStoppedMessage" receiver:self selector:sel__handleVideoStreamStopped_];

  objc_initWeak(&location, self);
  v7 = [(_HMCameraControl *)self context];
  v8 = [v7 xpcClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___HMCameraStreamControl___configureWithContext___block_invoke;
  v9[3] = &unk_1E59455B8;
  objc_copyWeak(&v10, &location);
  [v8 registerReconnectionHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (unint64_t)streamState
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t streamState = self->_streamState;
  os_unfair_lock_unlock(p_lock);
  return streamState;
}

- (HMCameraStream)cameraStream
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_cameraStream;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cameraStream, 0);
}

- (void)_callVideoStoppedDelegateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(_HMCameraStreamControl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(_HMCameraControl *)self context];
    v7 = [v6 delegateCaller];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61___HMCameraStreamControl__callVideoStoppedDelegateWithError___block_invoke;
    v8[3] = &unk_1E5945650;
    id v9 = v5;
    id v10 = self;
    id v11 = v4;
    [v7 invokeBlock:v8];
  }
}

- (void)_callVideoStartedDelegate
{
  v3 = [(_HMCameraStreamControl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(_HMCameraControl *)self context];
    id v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51___HMCameraStreamControl__callVideoStartedDelegate__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)_handleVideoStopResponse:(id)a3 sessionID:(id)a4 error:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_HMCameraStreamControl *)self sessionID];
  char v12 = HMFEqualObjects();

  if (v12)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    v16 = v15;
    if (v10)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v27 = 138543874;
        v28 = v17;
        __int16 v29 = 2112;
        id v30 = v9;
        __int16 v31 = 2112;
        id v32 = v10;
        v18 = "%{public}@Failed to stop stream for session ID %@: %@";
        v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        uint32_t v21 = 32;
LABEL_10:
        _os_log_impl(&dword_19D1A8000, v19, v20, v18, (uint8_t *)&v27, v21);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v17;
      __int16 v29 = 2112;
      id v30 = v9;
      v18 = "%{public}@Successfully stopped stream for session ID: %@";
      v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      uint32_t v21 = 22;
      goto LABEL_10;
    }

    [(_HMCameraStreamControl *)v14 _resetStateWithError:v10];
    goto LABEL_12;
  }
  v22 = (void *)MEMORY[0x19F3A64A0]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = HMFGetLogIdentifier();
    v26 = [(_HMCameraStreamControl *)v23 sessionID];
    int v27 = 138543874;
    v28 = v25;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v26;
    _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Not handling stop stream response: Received session ID %@ does not match the current one %@", (uint8_t *)&v27, 0x20u);
  }
LABEL_12:
}

- (void)stopStream
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [(_HMCameraControl *)self context];
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping the stream", buf, 0xCu);
    }
    id v9 = [(_HMCameraStreamControl *)v5 sessionID];
    if (v9)
    {
      if ([(_HMCameraStreamControl *)v5 streamState] != 3)
      {
        [(_HMCameraStreamControl *)v5 setStreamState:3];
        v18 = (void *)MEMORY[0x1E4F654B0];
        id v19 = objc_alloc(MEMORY[0x1E4F65488]);
        os_log_type_t v20 = [(_HMCameraControl *)v5 profileUniqueIdentifier];
        uint32_t v21 = (void *)[v19 initWithTarget:v20];
        v36 = @"kCameraSessionID";
        v37 = v9;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v23 = [v18 messageWithName:@"HMCameraStreamStopStreamMessage" destination:v21 payload:v22];

        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        id v32 = __36___HMCameraStreamControl_stopStream__block_invoke;
        uint64_t v33 = &unk_1E59455E8;
        v34 = v5;
        id v24 = v9;
        id v35 = v24;
        v25 = (void *)MEMORY[0x19F3A64A0]([v23 setResponseHandler:&v30]);
        v26 = v5;
        int v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v39 = v28;
          __int16 v40 = 2112;
          v41 = (const char *)v24;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Sending stop video stream message for session ID: %@", buf, 0x16u);
        }
        __int16 v29 = objc_msgSend(v3, "messageDispatcher", v30, v31, v32, v33, v34);
        [v29 sendMessage:v23];

        goto LABEL_18;
      }
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = v5;
      char v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v39 = v13;
        v14 = "%{public}@Not stopping stream because it is already being stopped";
        v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_13:
        _os_log_impl(&dword_19D1A8000, v15, v16, v14, buf, 0xCu);
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = v5;
      char v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v39 = v13;
        v14 = "%{public}@Ignoring stop stream request because no stream session ID exists";
        v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_13;
      }
    }

LABEL_18:

    goto LABEL_19;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v39 = v17;
    __int16 v40 = 2080;
    v41 = "-[_HMCameraStreamControl stopStream]";
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_19:
}

- (void)_handleStreamStartedWithResponse:(id)a3 sessionID:(id)a4 error:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_HMCameraStreamControl *)self sessionID];
  char v12 = HMFEqualObjects();

  if (v12)
  {
    if (v10)
    {
      v13 = (void *)MEMORY[0x19F3A64A0]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v16 = HMFGetLogIdentifier();
        int v38 = 138543618;
        v39 = v16;
        __int16 v40 = 2112;
        id v41 = v10;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to start video stream: %@", (uint8_t *)&v38, 0x16u);
      }
      [(_HMCameraStreamControl *)v14 _resetStateWithError:v10];
    }
    else
    {
      v22 = objc_msgSend(v8, "hmf_stringForKey:", @"kCameraSessionID");
      [(_HMCameraStreamControl *)self setSessionID:v22];

      v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        int v27 = [(_HMCameraStreamControl *)v24 sessionID];
        int v38 = 138543618;
        v39 = v26;
        __int16 v40 = 2112;
        id v41 = v27;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Successfully started video stream for session ID: %@", (uint8_t *)&v38, 0x16u);
      }
      v28 = objc_msgSend(v8, "hmf_numberForKey:", @"kSlotIdentifierKey");
      __int16 v29 = objc_msgSend(v8, "hmf_numberForKey:", @"kAudioStreamSetting");
      uint64_t v30 = objc_msgSend(v8, "hmf_numberForKey:", @"kSourceAspectRatioKey");
      uint64_t v31 = [HMCameraStream alloc];
      id v32 = [(_HMCameraControl *)v24 profileUniqueIdentifier];
      [v30 doubleValue];
      double v34 = v33;
      id v35 = [(_HMCameraStreamControl *)v24 sessionID];
      v36 = -[HMCameraStream initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:sessionID:audioStreamSetting:](v31, "initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:sessionID:audioStreamSetting:", v32, v28, v35, [v29 unsignedIntegerValue], v34);

      v37 = [(_HMCameraControl *)v24 context];
      [(HMCameraSource *)v36 setContext:v37];

      [(_HMCameraStreamControl *)v24 setCameraStream:v36];
      [(_HMCameraStreamControl *)v24 setStreamState:2];
      [(_HMCameraStreamControl *)v24 _callVideoStartedDelegate];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v20 = HMFGetLogIdentifier();
      uint32_t v21 = [(_HMCameraStreamControl *)v18 sessionID];
      int v38 = 138543874;
      v39 = v20;
      __int16 v40 = 2112;
      id v41 = v9;
      __int16 v42 = 2112;
      v43 = v21;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Not handling start stream response: Received session ID %@ does not match the current one %@", (uint8_t *)&v38, 0x20u);
    }
  }
}

- (void)startStreamWithPreferences:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  id v5 = [(_HMCameraControl *)self context];
  v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (!v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v38 = v11;
      __int16 v39 = 2080;
      __int16 v40 = "-[_HMCameraStreamControl startStreamWithPreferences:]";
      char v12 = "%{public}@Nil context - %s";
      v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v38 = v10;
    __int16 v39 = 2112;
    __int16 v40 = v4;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting stream with preferences: %@", buf, 0x16u);
  }
  if ([(_HMCameraStreamControl *)v7 streamState] == 1
    || [(_HMCameraStreamControl *)v7 streamState] == 2)
  {
    v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = v7;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v38 = v11;
      char v12 = "%{public}@Ignoring start stream request because a stream session is already starting or actively streaming";
      v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, buf, v15);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  [(_HMCameraStreamControl *)v7 setStreamState:1];
  os_log_type_t v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [v16 UUIDString];

  [(_HMCameraStreamControl *)v7 setSessionID:v17];
  v18 = [MEMORY[0x1E4F1CA60] dictionary];
  [v18 setObject:v17 forKeyedSubscript:@"kCameraSessionID"];
  if (v4)
  {
    id v19 = encodeRootObject(v4);
    [v18 setObject:v19 forKeyedSubscript:@"kCameraSessionPreference"];
  }
  id v20 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v21 = objc_alloc(MEMORY[0x1E4F65488]);
  v22 = [(_HMCameraControl *)v7 profileUniqueIdentifier];
  v23 = (void *)[v21 initWithTarget:v22];
  id v24 = (void *)[v20 initWithName:@"HMCameraStreamNegotiateStreamMessage" destination:v23 payload:v18];

  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  double v33 = __53___HMCameraStreamControl_startStreamWithPreferences___block_invoke;
  double v34 = &unk_1E59455E8;
  id v35 = v7;
  id v25 = v17;
  id v36 = v25;
  v26 = (void *)MEMORY[0x19F3A64A0]([v24 setResponseHandler:&v31]);
  int v27 = v7;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    __int16 v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v38 = v29;
    __int16 v39 = 2112;
    __int16 v40 = (const char *)v25;
    _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Sending negotiate stream message for session ID: %@", buf, 0x16u);
  }
  uint64_t v30 = objc_msgSend(v5, "messageDispatcher", v31, v32, v33, v34, v35);
  [v30 sendMessage:v24];

LABEL_12:
}

- (void)_handleVideoStreamStopped:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMCameraStreamControl *)self sessionID];
  if (v5)
  {
    v6 = [v4 stringForKey:@"kCameraSessionID"];
    if (([v5 isEqualToString:v6] & 1) == 0)
    {
      id v21 = (void *)MEMORY[0x19F3A64A0]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = HMFGetLogIdentifier();
        int v25 = 138543874;
        v26 = v24;
        __int16 v27 = 2112;
        v28 = v6;
        __int16 v29 = 2112;
        uint64_t v30 = v5;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Not handling video stream stopped message: Received session ID %@ does not match the current one %@", (uint8_t *)&v25, 0x20u);
      }
      goto LABEL_16;
    }
    id v7 = [v4 errorForKey:@"kCameraSessionError"];
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    id v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v12 = HMFGetLogIdentifier();
        int v25 = 138543874;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v5;
        __int16 v29 = 2112;
        uint64_t v30 = v7;
        v13 = "%{public}@Video stream has failed for the session ID %@: %@";
        os_log_type_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 32;
LABEL_14:
        _os_log_impl(&dword_19D1A8000, v14, v15, v13, (uint8_t *)&v25, v16);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v12 = HMFGetLogIdentifier();
      int v25 = 138543618;
      v26 = v12;
      __int16 v27 = 2112;
      v28 = v5;
      v13 = "%{public}@Video stream has stopped for the session ID: %@";
      os_log_type_t v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 22;
      goto LABEL_14;
    }

    [(_HMCameraStreamControl *)v9 _resetStateWithError:v7];

LABEL_16:
    goto LABEL_17;
  }
  v17 = (void *)MEMORY[0x19F3A64A0]();
  v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v20 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v20;
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring stream stopped message because there is no current stream", (uint8_t *)&v25, 0xCu);
  }
LABEL_17:
}

- (void)_resetStateWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting all the stream control state with error: %@", (uint8_t *)&v9, 0x16u);
  }
  [(_HMCameraStreamControl *)v6 setCameraStream:0];
  [(_HMCameraStreamControl *)v6 setSessionID:0];
  [(_HMCameraStreamControl *)v6 setStreamState:4];
  [(_HMCameraStreamControl *)v6 _callVideoStoppedDelegateWithError:v4];
}

- (void)setSessionID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  sessionID = self->_sessionID;
  self->_sessionID = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)sessionID
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_sessionID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setStreamState:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t streamState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setCameraStream:(id)a3
{
  id v4 = (HMCameraStream *)a3;
  os_unfair_lock_lock_with_options();
  cameraStream = self->_cameraStream;
  self->_cameraStream = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (_HMCameraStreamControlDelegate)delegate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (_HMCameraStreamControlDelegate *)WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_63410 != -1) {
    dispatch_once(&logCategory__hmf_once_t29_63410, &__block_literal_global_63411);
  }
  v2 = (void *)logCategory__hmf_once_v30_63412;

  return v2;
}

@end