@interface HMDAccessoryDiagnosticsSession
- (BOOL)_handleReceivedData:(id)a3;
- (BOOL)_validDataSequenceNumber:(id)a3;
- (BOOL)dataStreamAdapter:(id)a3 didReceiveData:(id)a4;
- (BOOL)readyForDataTransfer;
- (HMDAccessoryDataStreamAdapter)dataStream;
- (HMDAccessoryDiagnosticsSession)initWithAccessory:(id)a3 settings:(id)a4;
- (HMDAccessoryDiagnosticsSettings)settings;
- (NSDictionary)urlParameters;
- (NSFileHandle)fileHandle;
- (NSNumber)expectedDataSequenceNumber;
- (NSString)reason;
- (id)_createLogFile;
- (id)attributeDescriptions;
- (id)fileExtension;
- (id)hapAccessory;
- (id)pendingCompletionHandler;
- (void)_callCompletionHandlerWithError:(id)a3;
- (void)_setUpWithOptions:(id)a3 completion:(id)a4;
- (void)dataStreamAdapterDidCompleteDataRead:(id)a3;
- (void)dataStreamAdapterDidFailDataRead:(id)a3;
- (void)dealloc;
- (void)readDataWithCompletion:(id)a3;
- (void)setDataStream:(id)a3;
- (void)setExpectedDataSequenceNumber:(id)a3;
- (void)setFileHandle:(id)a3;
- (void)setPendingCompletionHandler:(id)a3;
- (void)setReadyForDataTransfer:(BOOL)a3;
- (void)setUpWithOptions:(id)a3 completion:(id)a4;
- (void)setUrlParameters:(id)a3;
- (void)shutDown;
@end

@implementation HMDAccessoryDiagnosticsSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_expectedDataSequenceNumber, 0);
  objc_storeStrong((id *)&self->_urlParameters, 0);
  objc_storeStrong(&self->_pendingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dataStream, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)setReadyForDataTransfer:(BOOL)a3
{
  self->_readyForDataTransfer = a3;
}

- (BOOL)readyForDataTransfer
{
  return self->_readyForDataTransfer;
}

- (void)setFileHandle:(id)a3
{
}

- (NSFileHandle)fileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 104, 1);
}

- (void)setExpectedDataSequenceNumber:(id)a3
{
}

- (NSNumber)expectedDataSequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUrlParameters:(id)a3
{
}

- (NSDictionary)urlParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPendingCompletionHandler:(id)a3
{
}

- (id)pendingCompletionHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setDataStream:(id)a3
{
}

- (HMDAccessoryDataStreamAdapter)dataStream
{
  return (HMDAccessoryDataStreamAdapter *)objc_getProperty(self, a2, 72, 1);
}

- (HMDAccessoryDiagnosticsSettings)settings
{
  return (HMDAccessoryDiagnosticsSettings *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)_callCompletionHandlerWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Calling completion handler with error:%@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDAccessoryDiagnosticsSession *)v7 pendingCompletionHandler];
  [(HMDAccessoryDiagnosticsSession *)v7 setPendingCompletionHandler:0];
  ((void (**)(void, id, void, void))v10)[2](v10, v4, 0, 0);
}

- (BOOL)_validDataSequenceNumber:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDAccessoryDiagnosticsSession *)self expectedDataSequenceNumber];
  int v7 = [v6 isEqualToNumber:v4];

  if (v7)
  {
    v8 = NSNumber;
    v9 = [(HMDAccessoryDiagnosticsSession *)self expectedDataSequenceNumber];
    v10 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "longLongValue") + 1);
    [(HMDAccessoryDiagnosticsSession *)self setExpectedDataSequenceNumber:v10];
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v4 longLongValue];
      v16 = [(HMDAccessoryDiagnosticsSession *)v12 expectedDataSequenceNumber];
      int v18 = 138543874;
      v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      uint64_t v23 = [v16 longLongValue];
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid data sequence number received:%lld expected:%lld", (uint8_t *)&v18, 0x20u);
    }
  }

  return v7;
}

- (id)_createLogFile
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = HMDCreateHomeKitDaemonCacheDirectory();
  v5 = [v4 stringByAppendingString:@"/ManufacturerDiagnostics"];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v40 = 0;
  char v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v40];
  id v8 = v40;

  if (v7)
  {
    uint64_t v9 = [(HMDAccessoryDiagnosticsSession *)self fileExtension];
    v10 = (void *)v9;
    if (v9)
    {
      v37 = (void *)v9;
      id v39 = v8;
      int v11 = NSString;
      v12 = [MEMORY[0x1E4F1C9C8] date];
      __int16 v13 = [MEMORY[0x1E4F29128] UUID];
      id v14 = [v13 UUIDString];
      uint64_t v15 = [v11 stringWithFormat:@"%@_%@", v12, v14];
      v16 = [(HMDAccessoryDiagnosticsSession *)self fileExtension];
      uint64_t v17 = [(id)v15 stringByAppendingPathExtension:v16];

      v38 = (void *)v17;
      int v18 = [v5 stringByAppendingPathComponent:v17];
      v19 = (void *)[v18 copy];
      [(HMDAccessoryDiagnosticsSessionInternal *)self setFilePath:v19];

      __int16 v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      LOBYTE(v15) = [v20 createFileAtPath:v18 contents:0 attributes:0];

      uint64_t v21 = (void *)MEMORY[0x1D9452090]();
      __int16 v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      uint64_t v24 = v23;
      if (v15)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v25;
          __int16 v43 = 2112;
          v44 = v18;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Created log file path:%@", buf, 0x16u);
        }
        v26 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v18];
        id v8 = v39;
      }
      else
      {
        id v8 = v39;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v42 = v35;
          __int16 v43 = 2112;
          v44 = v18;
          __int16 v45 = 2112;
          id v46 = v39;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create file at path: %@ error: %@", buf, 0x20u);
        }
        v26 = 0;
      }
      v10 = v37;
    }
    else
    {
      v31 = (void *)MEMORY[0x1D9452090]();
      v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        __int16 v43 = 2112;
        v44 = 0;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@FileType:%@ not supported ", buf, 0x16u);
      }
      v26 = 0;
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
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      __int16 v43 = 2112;
      v44 = v5;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create directory at path: %@ error: %@", buf, 0x20u);
    }
    v26 = 0;
  }

  return v26;
}

- (BOOL)_handleReceivedData:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDAccessoryDiagnosticsSession *)self fileHandle];

  if (!v6)
  {
    char v7 = [(HMDAccessoryDiagnosticsSession *)self _createLogFile];
    [(HMDAccessoryDiagnosticsSession *)self setFileHandle:v7];

    id v8 = [(HMDAccessoryDiagnosticsSession *)self fileHandle];

    if (!v8)
    {
      int v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v23 = [(HMDAccessoryDiagnosticsSessionInternal *)v12 accessory];
        uint64_t v24 = [(HMDAccessoryDiagnosticsSessionInternal *)v12 filePath];
        *(_DWORD *)buf = 138543874;
        v28 = v14;
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v23;
        __int16 v31 = 2112;
        uint64_t v32 = (uint64_t)v24;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create log file for accessory:%@ file path:%@", buf, 0x20u);

        goto LABEL_14;
      }
LABEL_15:

      BOOL v17 = 0;
      goto LABEL_16;
    }
  }
  unint64_t v9 = [(HMDAccessoryDiagnosticsSessionInternal *)self bytesWritten];
  unint64_t v10 = [v4 length] + v9;
  if (v10 > [(HMDAccessoryDiagnosticsSessionInternal *)self maxBytes])
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v28 = v14;
      __int16 v29 = 2048;
      uint64_t v30 = [(HMDAccessoryDiagnosticsSessionInternal *)v12 bytesWritten];
      __int16 v31 = 2048;
      uint64_t v32 = [v4 length];
      __int16 v33 = 2048;
      uint64_t v34 = [(HMDAccessoryDiagnosticsSessionInternal *)v12 maxBytes];
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics exceeded max size (written: %llu, new data: %lu, max: %llu)", buf, 0x2Au);
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  uint64_t v15 = [(HMDAccessoryDiagnosticsSession *)self fileHandle];
  id v26 = 0;
  [v15 writeData:v4 error:&v26];
  id v16 = v26;

  BOOL v17 = v16 == 0;
  if (v16)
  {
    int v18 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      __int16 v22 = [(HMDAccessoryDiagnosticsSessionInternal *)v19 filePath];
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v22;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v16;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to write data to file: %@ error: %@", buf, 0x20u);
    }
  }
  else
  {
    -[HMDAccessoryDiagnosticsSessionInternal setBytesWritten:](self, "setBytesWritten:", -[HMDAccessoryDiagnosticsSessionInternal bytesWritten](self, "bytesWritten") + [v4 length]);
  }

LABEL_16:
  return v17;
}

- (void)dataStreamAdapterDidFailDataRead:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    unint64_t v9 = HMFGetLogIdentifier();
    unint64_t v10 = [(HMDAccessoryDiagnosticsSessionInternal *)v7 accessory];
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to read data for accessory:%@", (uint8_t *)&v13, 0x16u);
  }
  int v11 = [(HMDAccessoryDiagnosticsSession *)v7 pendingCompletionHandler];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [(HMDAccessoryDiagnosticsSession *)v7 _callCompletionHandlerWithError:v12];
  }
}

- (void)dataStreamAdapterDidCompleteDataRead:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDAccessoryDiagnosticsSession *)self pendingCompletionHandler];

  if (v6)
  {
    char v7 = [(HMDAccessoryDiagnosticsSession *)self fileHandle];

    id v8 = (void *)MEMORY[0x1D9452090]();
    unint64_t v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    int v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        int v13 = [(HMDAccessoryDiagnosticsSessionInternal *)v9 accessory];
        int v23 = 138543618;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Data read completed for accessory:%@", (uint8_t *)&v23, 0x16u);
      }
      id v14 = [(HMDAccessoryDiagnosticsSession *)v9 pendingCompletionHandler];
      [(HMDAccessoryDiagnosticsSession *)v9 setPendingCompletionHandler:0];
      __int16 v15 = [(HMDAccessoryDiagnosticsSessionInternal *)v9 filePath];
      id v16 = [(HMDAccessoryDiagnosticsSession *)v9 urlParameters];
      ((void (**)(void, void, void *, void *))v14)[2](v14, 0, v15, v16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        __int16 v22 = [(HMDAccessoryDiagnosticsSessionInternal *)v9 accessory];
        int v23 = 138543618;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        id v26 = v22;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Data read completed for accessory:%@ but file path not present", (uint8_t *)&v23, 0x16u);
      }
      id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [(HMDAccessoryDiagnosticsSession *)v9 _callCompletionHandlerWithError:v14];
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Data read completed but no completion handler", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (BOOL)dataStreamAdapter:(id)a3 didReceiveData:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v8);

  unint64_t v9 = [v7 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v12 = [v7 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      __int16 v15 = [(HMDAccessoryDiagnosticsSession *)self fileHandle];

      if (!v15)
      {
        id v16 = [v14 objectForKeyedSubscript:@"urlParameters"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0;
        }
        id v18 = v17;

        [(HMDAccessoryDiagnosticsSession *)self setUrlParameters:v18];
        v19 = (void *)MEMORY[0x1D9452090]();
        __int16 v20 = self;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          __int16 v22 = HMFGetLogIdentifier();
          int v23 = [(HMDAccessoryDiagnosticsSession *)v20 urlParameters];
          int v37 = 138543618;
          v38 = v22;
          __int16 v39 = 2112;
          id v40 = v23;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@URL parameters: %@ received in packet metadata", (uint8_t *)&v37, 0x16u);
        }
      }
      uint64_t v24 = [v14 objectForKeyedSubscript:@"dataSequenceNumber"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v25 = v24;
      }
      else {
        __int16 v25 = 0;
      }
      id v26 = v25;

      if (v26) {
        [(HMDAccessoryDiagnosticsSession *)self _validDataSequenceNumber:v26];
      }
    }
    uint64_t v27 = (void *)MEMORY[0x1D9452090]();
    v28 = self;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      int v37 = 138543362;
      v38 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Data frame received", (uint8_t *)&v37, 0xCu);
    }
    BOOL v31 = [(HMDAccessoryDiagnosticsSession *)v28 _handleReceivedData:v11];
  }
  else
  {
    uint64_t v32 = (void *)MEMORY[0x1D9452090]();
    __int16 v33 = self;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      int v37 = 138543362;
      v38 = v35;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@No data present in frame", (uint8_t *)&v37, 0xCu);
    }
    BOOL v31 = 0;
  }

  return v31;
}

- (void)readDataWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryDiagnosticsSession *)self dataStream];

  if (!v6)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    unint64_t v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      v12 = "%{public}@Data stream not present";
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0xCu);
    }
LABEL_9:

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:-1 userInfo:0];
    (*((void (**)(id, void *, void, void))v4 + 2))(v4, v7, 0, 0);
    goto LABEL_10;
  }
  if (![(HMDAccessoryDiagnosticsSession *)self readyForDataTransfer])
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    unint64_t v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      v12 = "%{public}@Session not ready for data read";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(HMDAccessoryDiagnosticsSession *)self setPendingCompletionHandler:v4];
  id v7 = [(HMDAccessoryDiagnosticsSession *)self dataStream];
  [v7 readData];
LABEL_10:
}

- (void)_setUpWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v8);

  unint64_t v9 = [(HMDAccessoryDiagnosticsSession *)self hapAccessory];
  if (([v9 canAcceptBulkSendListenersSync] & 1) != 0
    || ([v9 bulkSendListenersRequireCharacteristicReadsSync] & 1) != 0)
  {
    if (v6)
    {
      unint64_t v10 = [v6 logSize];

      if (v10)
      {
        id v11 = [v6 logSize];
        -[HMDAccessoryDiagnosticsSessionInternal setMaxBytes:](self, "setMaxBytes:", [v11 integerValue]);
      }
    }
    v12 = [HMDAccessoryDataStreamAdapter alloc];
    int v13 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
    id v14 = [v6 payloadMetadata];
    uint64_t v15 = [(HMDAccessoryDataStreamAdapter *)v12 initWithAccessory:v9 workQueue:v13 fileType:@"diagnostics.snapshot" metadata:v14 reason:@"DiagnosticsData"];
    [(HMDAccessoryDiagnosticsSession *)self setDataStream:v15];

    id v16 = [(HMDAccessoryDiagnosticsSession *)self dataStream];
    [v16 setDelegate:self];

    objc_initWeak((id *)location, self);
    uint64_t v17 = [(HMDAccessoryDiagnosticsSession *)self dataStream];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__HMDAccessoryDiagnosticsSession__setUpWithOptions_completion___block_invoke;
    v23[3] = &unk_1E6A0BD58;
    objc_copyWeak(&v25, (id *)location);
    id v24 = v7;
    [v17 setUpWithCallback:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v19 = (void *)MEMORY[0x1D9452090]();
    __int16 v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v22;
      __int16 v27 = 2112;
      v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Accessory:%@ does not support data stream, error: %@", location, 0x20u);
    }
    (*((void (**)(id, void *, void))v7 + 2))(v7, v18, 0);
  }
}

void __63__HMDAccessoryDiagnosticsSession__setUpWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v9 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v9);

    unint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v8;
    v12 = HMFGetOSLogHandle();
    int v13 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        int v22 = 138543618;
        int v23 = v14;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to setup data stream with error: %@", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v22 = 138543362;
        int v23 = v20;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Diagnostics data stream was setup successfully", (uint8_t *)&v22, 0xCu);
      }
      [v11 setReadyForDataTransfer:1];
      uint64_t v21 = (void *)[objc_alloc(NSNumber) initWithLongLong:1];
      [v11 setExpectedDataSequenceNumber:v21];

      uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v15();
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v22 = 138543362;
      int v23 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Setting up data stream failed, diagnostics session is nil", (uint8_t *)&v22, 0xCu);
    }
    v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setUpWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v8);

  unint64_t v9 = [(HMDAccessoryDiagnosticsSession *)self hapAccessory];
  unint64_t v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  v12 = HMFGetOSLogHandle();
  int v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v22 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Establishing local HAP session with accessory if needed", buf, 0xCu);
    }
    uint64_t v15 = [(HMDAccessoryDiagnosticsSessionInternal *)v11 workQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__HMDAccessoryDiagnosticsSession_setUpWithOptions_completion___block_invoke;
    v18[3] = &unk_1E6A18F68;
    v18[4] = v11;
    id v20 = v7;
    id v19 = v6;
    [v9 establishLocalHAPConnectionWithQueue:v15 completion:v18];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v22 = v16;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot set up diagnostics transfer session because accessory is nil", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v17, 0);
  }
}

void __62__HMDAccessoryDiagnosticsSession_setUpWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      unint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start HAP session with accessory: %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _setUpWithOptions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (id)fileExtension
{
  id v3 = [(HMDAccessoryDiagnosticsSession *)self settings];
  id v4 = [v3 currentSnapshot];
  id v5 = [v4 format];
  uint64_t v6 = [v5 value];

  if (!v6) {
    return @"zip";
  }
  id v7 = [(HMDAccessoryDiagnosticsSession *)self settings];
  id v8 = [v7 currentSnapshot];
  int v9 = [v8 format];
  uint64_t v10 = [v9 value];

  if (v10 == 1) {
    return @"txt";
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDAccessoryDiagnosticsSession;
  [(HMDAccessoryDiagnosticsSession *)&v7 dealloc];
}

- (id)hapAccessory
{
  v2 = [(HMDAccessoryDiagnosticsSessionInternal *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)shutDown
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryDiagnosticsSessionInternal *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down", buf, 0xCu);
  }
  id v8 = [(HMDAccessoryDiagnosticsSession *)v5 dataStream];
  [v8 shutDown];

  [(HMDAccessoryDiagnosticsSession *)v5 setDataStream:0];
  int v9 = [(HMDAccessoryDiagnosticsSession *)v5 pendingCompletionHandler];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    [(HMDAccessoryDiagnosticsSession *)v5 _callCompletionHandlerWithError:v10];
  }
  [(HMDAccessoryDiagnosticsSessionInternal *)v5 setFilePath:0];
  __int16 v11 = [(HMDAccessoryDiagnosticsSession *)v5 fileHandle];
  id v19 = 0;
  [v11 closeAndReturnError:&v19];
  id v12 = v19;

  uint64_t v13 = [(HMDAccessoryDiagnosticsSession *)v5 setFileHandle:0];
  if (v12)
  {
    id v14 = (void *)MEMORY[0x1D9452090](v13);
    uint64_t v15 = v5;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      id v18 = [(HMDAccessoryDiagnosticsSessionInternal *)v15 accessory];
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to close file for accessory:%@ with error:%@", buf, 0x20u);
    }
  }
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryDiagnosticsSession;
  id v3 = [(HMDAccessoryDiagnosticsSessionInternal *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAccessoryDiagnosticsSession *)self readyForDataTransfer];
  id v5 = HMFBooleanToString();
  uint64_t v6 = (void *)[v4 initWithName:@"readyForDataTransfer" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v8 = [(HMDAccessoryDiagnosticsSession *)self urlParameters];
  int v9 = (void *)[v7 initWithName:@"urlParameters" value:v8];
  v14[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  __int16 v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (HMDAccessoryDiagnosticsSession)initWithAccessory:(id)a3 settings:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryDiagnosticsSession;
  id v8 = [(HMDAccessoryDiagnosticsSessionInternal *)&v11 initWithAccessory:a3];
  int v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_settings, a4);
  }

  return v9;
}

@end