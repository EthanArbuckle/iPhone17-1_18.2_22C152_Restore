@interface HMDCameraRecordingBulkSendSessionReader
+ (id)logCategory;
- (HMDCameraRecordingBulkSendSessionReader)initWithWorkQueue:(id)a3 session:(id)a4 readCallbackTimer:(id)a5 logIdentifier:(id)a6;
- (HMDCameraRecordingBulkSendSessionReader)initWithWorkQueue:(id)a3 session:(id)a4 readTimeout:(double)a5 logIdentifier:(id)a6;
- (HMDCameraRecordingBulkSendSessionReaderDelegate)delegate;
- (HMDDataStreamBulkSendSession)session;
- (NSString)logIdentifier;
- (void)_readNextDataChunk;
- (void)_stopWithReason:(void *)a1;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stopWithReason:(unsigned __int16)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraRecordingBulkSendSessionReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentChunkAssembler, 0);
  objc_storeStrong((id *)&self->_readCallbackTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraRecordingBulkSendSessionReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraRecordingBulkSendSessionReaderDelegate *)WeakRetained;
}

- (HMDDataStreamBulkSendSession)session
{
  return (HMDDataStreamBulkSendSession *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 32, 1);
    dispatch_assert_queue_V2(Property);
    id v8 = objc_getProperty(self, v7, 40, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id v8 = 0;
  }
  if (v8 == v5)
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Read callback timer fired, closing bulk send session", (uint8_t *)&v13, 0xCu);
    }
    -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](v10, (const char *)6);
  }
}

- (void)_stopWithReason:(void *)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1)
  {
    Property = objc_getProperty(a1, a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = a1;
    SEL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 1024;
      int v15 = (int)a2;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping bulk send session reader with reason: %d", (uint8_t *)&v12, 0x12u);
    }
    v9 = [v6 session];
    [v9 cancelWithReason:a2];

    v10 = [v6 delegate];
    [v10 bulkSendSessionReader:v6 didFinishWithReason:a2];

    objc_setProperty_atomic(v6, v11, 0, 40);
  }
}

- (void)stopWithReason:(unsigned __int16)a3
{
  if (self)
  {
    v4 = (const char *)a3;
    Property = objc_getProperty(self, a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](self, v4);
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
}

- (void)start
{
  v2 = self;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self) {
    self = (HMDCameraRecordingBulkSendSessionReader *)objc_getProperty(self, a2, 32, 1);
  }
  dispatch_assert_queue_V2(&self->super.super);
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  v4 = v2;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v12 = 138543362;
    int v13 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting bulk send session reader", (uint8_t *)&v12, 0xCu);
  }
  if (v2)
  {
    objc_msgSend(objc_getProperty(v4, v7, 40, 1), "setDelegate:", v4);
    v2 = (HMDCameraRecordingBulkSendSessionReader *)objc_getProperty(v4, v8, 32, 1);
    id Property = objc_getProperty(v4, v9, 40, 1);
  }
  else
  {
    [0 setDelegate:0];
    id Property = 0;
  }
  [Property setDelegateQueue:v2];

  [(HMDCameraRecordingBulkSendSessionReader *)v4 _readNextDataChunk];
}

- (void)_readNextDataChunk
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    objc_msgSend(objc_getProperty(a1, v4, 40, 1), "resume");
    id v5 = [a1 session];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__HMDCameraRecordingBulkSendSessionReader__readNextDataChunk__block_invoke;
    v6[3] = &unk_264A2E660;
    v6[4] = a1;
    [v5 read:v6];
  }
}

void __61__HMDCameraRecordingBulkSendSessionReader__readNextDataChunk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a2;
  SEL v7 = a3;
  id Property = *(NSObject **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 32, 1);
  }
  dispatch_assert_queue_V2(Property);
  SEL v9 = [*(id *)(a1 + 32) session];
  int v10 = [v9 isActive];

  if (v10)
  {
    if (v5)
    {
      SEL v11 = *(void **)(a1 + 32);
      id v13 = v5;
      if (!v11) {
        goto LABEL_30;
      }
      uint64_t v14 = objc_getProperty(v11, v12, 32, 1);
      dispatch_assert_queue_V2(v14);
      uint64_t v16 = [[HMDDataStreamFragmentChunk alloc] initWithDictionaryRepresentation:v13];
      if (v16)
      {
        if (!objc_getProperty(v11, v15, 48, 1))
        {
          v18 = [HMDDataStreamFragmentAssembler alloc];
          v19 = [(HMDDataStreamFragmentChunk *)v16 fragmentSequenceNumber];
          v20 = [(HMDDataStreamFragmentChunk *)v16 type];
          v21 = [(HMDDataStreamFragmentAssembler *)v18 initWithSequenceNumber:v19 type:v20];
          objc_setProperty_atomic(v11, v22, v21, 48);
        }
        v23 = objc_msgSend(objc_getProperty(v11, v17, 48, 1), "sequenceNumber");
        v24 = [(HMDDataStreamFragmentChunk *)v16 fragmentSequenceNumber];
        char v25 = [v23 isEqual:v24];

        if (v25)
        {
          id v59 = v13;
          id v61 = 0;
          char v27 = objc_msgSend(objc_getProperty(v11, v26, 48, 1), "addFragmentChunk:error:", v16, &v61);
          id v29 = v61;
          if (v27)
          {
            objc_msgSend(objc_getProperty(v11, v28, 48, 1), "assembledFragment");
            v31 = (HMDDataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_setProperty_atomic(v11, v30, 0, 48);
              v32 = (void *)MEMORY[0x230FBD990]();
              id v33 = v11;
              v34 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                v35 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v63 = v35;
                __int16 v64 = 2112;
                v65 = v31;
                _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Assembled fragment: %@", buf, 0x16u);
              }
              v36 = [v33 delegate];
              [v36 bulkSendSessionReader:v33 didReadFragment:v31];
            }
          }
          else
          {
            v49 = (void *)MEMORY[0x230FBD990]();
            id v50 = v11;
            v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v63 = v52;
              __int16 v64 = 2112;
              v65 = v16;
              __int16 v66 = 2112;
              id v67 = v29;
              _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to add data chunk %@ to assembler: %@", buf, 0x20u);
            }
            -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](v50, (const char *)7);
          }

          id v13 = v59;
          goto LABEL_29;
        }
        v41 = (void *)MEMORY[0x230FBD990]();
        id v42 = v11;
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = HMFGetLogIdentifier();
          [(HMDDataStreamFragmentChunk *)v16 fragmentSequenceNumber];
          v60 = v41;
          v45 = (HMDDataStreamFragmentChunk *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(objc_getProperty(v42, v46, 48, 1), "sequenceNumber");
          v48 = id v47 = v13;
          *(_DWORD *)buf = 138543874;
          v63 = v44;
          __int16 v64 = 2112;
          v65 = v45;
          __int16 v66 = 2112;
          id v67 = v48;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Received fragment chunk for fragment sequence number %@ even though we haven't received last chunk for fragment sequence number %@", buf, 0x20u);

          id v13 = v47;
          v41 = v60;
          goto LABEL_23;
        }
      }
      else
      {
        v41 = (void *)MEMORY[0x230FBD990]();
        id v42 = v11;
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v63 = v44;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fragment chunk from stream data dictionary", buf, 0xCu);
LABEL_23:
        }
      }

      -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](v42, (const char *)7);
LABEL_29:

LABEL_30:
      v53 = [*(id *)(a1 + 32) session];
      char v54 = [v53 isActive];

      if (v54)
      {
        -[HMDCameraRecordingBulkSendSessionReader _readNextDataChunk](*(void *)(a1 + 32));
      }
      else
      {
        v55 = (void *)MEMORY[0x230FBD990]();
        id v56 = *(id *)(a1 + 32);
        v57 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v63 = v58;
          _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_INFO, "%{public}@Data processing marked the bulk send session as inactive", buf, 0xCu);
        }
      }
      goto LABEL_35;
    }
    v37 = (void *)MEMORY[0x230FBD990]();
    id v38 = *(id *)(a1 + 32);
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v40;
      __int16 v64 = 2112;
      v65 = v7;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to read from bulk send session: %@", buf, 0x16u);
    }
    -[HMDCameraRecordingBulkSendSessionReader _stopWithReason:](*(void **)(a1 + 32), (const char *)5);
  }
LABEL_35:
}

- (HMDCameraRecordingBulkSendSessionReader)initWithWorkQueue:(id)a3 session:(id)a4 readCallbackTimer:(id)a5 logIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraRecordingBulkSendSessionReader;
  int v15 = [(HMDCameraRecordingBulkSendSessionReader *)&v20 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_session, a4);
    objc_storeStrong((id *)&v16->_readCallbackTimer, a5);
    uint64_t v17 = [v14 copy];
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v17;
  }
  return v16;
}

- (HMDCameraRecordingBulkSendSessionReader)initWithWorkQueue:(id)a3 session:(id)a4 readTimeout:(double)a5 logIdentifier:(id)a6
{
  int v10 = (objc_class *)MEMORY[0x263F42658];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[[v10 alloc] initWithTimeInterval:0 options:a5];
  int v15 = [(HMDCameraRecordingBulkSendSessionReader *)self initWithWorkQueue:v13 session:v12 readCallbackTimer:v14 logIdentifier:v11];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_171253 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_171253, &__block_literal_global_171254);
  }
  v2 = (void *)logCategory__hmf_once_v9_171255;
  return v2;
}

void __54__HMDCameraRecordingBulkSendSessionReader_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_171255;
  logCategory__hmf_once_v9_171255 = v0;
}

@end