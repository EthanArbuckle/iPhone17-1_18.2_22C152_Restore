@interface HMIMemoryAVAsset
- (BOOL)loadValuesSynchronously;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (HMIMemoryAVAsset)initWithData:(id)a3;
@end

@implementation HMIMemoryAVAsset

- (HMIMemoryAVAsset)initWithData:(id)a3
{
  id v5 = a3;
  v6 = [NSURL URLWithString:@"hmi://in-memory"];
  v12.receiver = self;
  v12.super_class = (Class)HMIMemoryAVAsset;
  v7 = [(HMIMemoryAVAsset *)&v12 initWithURL:v6 options:0];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("HMIMemoryAVAsset", v8);

    v10 = [(HMIMemoryAVAsset *)v7 resourceLoader];
    [v10 setDelegate:v7 queue:v9];
  }
  return v7;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 contentInformationRequest];
  dispatch_queue_t v9 = v8;
  if (v8)
  {
    [v8 setContentType:*MEMORY[0x263EF9888]];
    objc_msgSend(v9, "setContentLength:", -[NSData length](self->_data, "length"));
    v10 = (void *)MEMORY[0x22A641C70]([v9 setByteRangeAccessSupported:1]);
    v11 = self;
    objc_super v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Fullfilled content request: %@", (uint8_t *)&v27, 0x16u);
    }
  }
  v14 = [v7 dataRequest];
  v15 = v14;
  if (!v14) {
    goto LABEL_13;
  }
  if (([v14 requestedOffset] & 0x8000000000000000) == 0
    && ([v15 requestedLength] & 0x8000000000000000) == 0)
  {
    uint64_t v16 = [v15 requestedOffset];
    unint64_t v17 = [v15 requestedLength] + v16;
    if (v17 <= [(NSData *)self->_data length])
    {
      v19 = [(NSData *)self->_data bytes];
      v20 = &v19[[v15 requestedOffset]];
      v21 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v20, objc_msgSend(v15, "requestedLength"), 0);
      [v15 respondWithData:v21];

      v22 = (void *)MEMORY[0x22A641C70]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = HMFGetLogIdentifier();
        int v27 = 138543618;
        v28 = v25;
        __int16 v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Fullfilled data request: %@", (uint8_t *)&v27, 0x16u);
      }
LABEL_13:
      [v7 finishLoading];
      BOOL v18 = 1;
      goto LABEL_14;
    }
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)loadValuesSynchronously
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__HMIMemoryAVAsset_loadValuesSynchronously__block_invoke;
  v12[3] = &unk_26477B7D8;
  v4 = v3;
  v13 = v4;
  [(HMIMemoryAVAsset *)self loadValuesAsynchronouslyForKeys:&unk_26D9A96D8 completionHandler:v12];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);
  if (v6)
  {
    id v7 = (void *)MEMORY[0x22A641C70]();
    v8 = self;
    dispatch_queue_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to loadValuesAsynchronouslyForKeys, due to timeout.", buf, 0xCu);
    }
  }

  return v6 == 0;
}

intptr_t __43__HMIMemoryAVAsset_loadValuesSynchronously__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end