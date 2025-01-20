@interface HMDCameraStreamSnapshotHandler
+ (id)logCategory;
- (BOOL)isStreamAvailable;
- (BOOL)isStreamSetupInProgress;
- (HMDCameraStreamSnapshotHandler)initWithWorkQueue:(id)a3 services:(id)a4 logIdentifier:(id)a5;
- (NSString)logIdentifier;
- (void)_callDidGetNewSnapshot:(void *)a1;
- (void)addDelegate:(id)a3;
- (void)addVideoStreamInterface:(id)a3;
- (void)getSnapshot:(unint64_t)a3;
- (void)removeDelegate:(id)a3;
- (void)removeVideoStreamInterface:(id)a3;
- (void)setStreamAvailable:(uint64_t)a1;
- (void)setStreamSetupStatusForService:(id)a3 inProgress:(BOOL)a4;
- (void)streamSnapshotCapture:(id)a3 didGetLastSnapshot:(id)a4;
- (void)streamSnapshotCapture:(id)a3 didGetNewSnapshot:(id)a4;
@end

@implementation HMDCameraStreamSnapshotHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_serviceInstanceStreamStatus, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_retiredStreamSnapshotCaptures, 0);
  objc_storeStrong((id *)&self->_streamSnapshotCaptures, 0);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)streamSnapshotCapture:(id)a3 didGetLastSnapshot:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    id Property = 0;
  }
  if ([Property containsObject:v6])
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v14;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing %@ from retired stream snapshot captures", buf, 0x16u);
    }
    if (self) {
      id v16 = objc_getProperty(v12, v15, 24, 1);
    }
    else {
      id v16 = 0;
    }
    [v16 removeObject:v6];
  }
  if (self) {
    id v17 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v17 = 0;
  }
  if ([v17 containsObject:v6])
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v21;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing %@ from stream snapshot captures", buf, 0x16u);
    }
    if (self) {
      id v23 = objc_getProperty(v19, v22, 16, 1);
    }
    else {
      id v23 = 0;
    }
    [v23 removeObject:v6];
  }
  id v24 = v8;
  if (self)
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v41 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotHandler:didGetLastSnapshot", buf, 0xCu);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v30 = objc_getProperty(v26, v29, 48, 1);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:buf count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v37;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v37 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v36 + 1) + 8 * v34);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v35, "streamSnapshotHandler:didGetLastSnapshot:", v26, v24, (void)v36);
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v36 objects:buf count:16];
      }
      while (v32);
    }
  }
}

- (void)streamSnapshotCapture:(id)a3 didGetNewSnapshot:(id)a4
{
}

- (void)_callDidGetNewSnapshot:(void *)a1
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 32, 1);
    dispatch_assert_queue_V2(Property);
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotHandler:didGetNewSnapshot", buf, 0xCu);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = objc_getProperty(v7, v10, 48, 1);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v16, "streamSnapshotHandler:didGetNewSnapshot:", v7, v4, (void)v17);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)getSnapshot:(unint64_t)a3
{
  v3 = self;
  if (self) {
    self = (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 32, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HMDCameraStreamSnapshotHandler_getSnapshot___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v3;
  dispatch_async(&self->super.super, block);
}

void __46__HMDCameraStreamSnapshotHandler_getSnapshot___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 16, 1);
  }
  if ([Property countByEnumeratingWithState:v8 objects:v11 count:16])
  {
    objc_msgSend(**((id **)&v8[0] + 1), "captureCurrentFrame", *(void *)&v8[0]);
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990](0);
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      SEL v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@There is no valid snapshot capture object", buf, 0xCu);
    }
    -[HMDCameraStreamSnapshotHandler _callDidGetNewSnapshot:](*(void **)(a1 + 32), 0);
  }
}

- (void)removeVideoStreamInterface:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HMDCameraStreamSnapshotHandler_removeVideoStreamInterface___block_invoke;
  v8[3] = &unk_264A2F820;
  _OWORD v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __61__HMDCameraStreamSnapshotHandler_removeVideoStreamInterface___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 16, 1);
  }
  id v4 = objc_msgSend(Property, "copy", (void)v26);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        SEL v10 = [v9 videoStreamInterface];
        id v11 = *(void **)(a1 + 40);

        if (v10 == v11)
        {
          uint64_t v12 = (void *)MEMORY[0x230FBD990]();
          id v13 = *(id *)(a1 + 32);
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v31 = v15;
            __int16 v32 = 2112;
            uint64_t v33 = v9;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing %@", buf, 0x16u);
          }
          id v17 = *(id *)(a1 + 32);
          if (v17) {
            id v17 = objc_getProperty(v17, v16, 16, 1);
          }
          [v17 removeObject:v9];
          if ([*(id *)(a1 + 40) state] == 2)
          {
            long long v18 = (void *)MEMORY[0x230FBD990]();
            id v19 = *(id *)(a1 + 32);
            long long v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v31 = v21;
              __int16 v32 = 2112;
              uint64_t v33 = v9;
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding %@ to retired-snapshot-captures", buf, 0x16u);
            }
            id v23 = *(id *)(a1 + 32);
            if (v23) {
              id v23 = objc_getProperty(v23, v22, 24, 1);
            }
            [v23 addObject:v9];
            [v9 captureLastFrame];
          }
          goto LABEL_22;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  id v25 = *(id *)(a1 + 32);
  if (v25) {
    id v25 = objc_getProperty(v25, v24, 16, 1);
  }
  if (![v25 count]) {
    -[HMDCameraStreamSnapshotHandler setStreamAvailable:](*(void *)(a1 + 32), 0);
  }
}

- (void)setStreamAvailable:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 12) = a2;
    os_unfair_lock_unlock(v4);
  }
}

- (void)addVideoStreamInterface:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HMDCameraStreamSnapshotHandler_addVideoStreamInterface___block_invoke;
  v8[3] = &unk_264A2F820;
  _OWORD v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __58__HMDCameraStreamSnapshotHandler_addVideoStreamInterface___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) sessionID];
    int v18 = 138543618;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Adding video stream interface %@", (uint8_t *)&v18, 0x16u);
  }
  id v8 = [HMDCameraStreamSnapshotCapture alloc];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 32, 1);
  }
  id v11 = Property;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v13) {
    id v14 = objc_getProperty(*(id *)(a1 + 32), v10, 32, 1);
  }
  else {
    id v14 = 0;
  }
  uint64_t v15 = [(HMDCameraStreamSnapshotCapture *)v8 initWithWorkQueue:v11 videoStreamInterface:v12 delegate:v13 delegateQueue:v14];

  id v17 = *(id *)(a1 + 32);
  if (v17) {
    id v17 = objc_getProperty(v17, v16, 16, 1);
  }
  [v17 addObject:v15];
  -[HMDCameraStreamSnapshotHandler setStreamAvailable:](*(void *)(a1 + 32), 1);
}

- (void)setStreamSetupStatusForService:(id)a3 inProgress:(BOOL)a4
{
  id v7 = a3;
  if (self) {
    id Property = objc_getProperty(self, v6, 32, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraStreamSnapshotHandler_setStreamSetupStatusForService_inProgress___block_invoke;
  block[3] = &unk_264A2DFC8;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a4;
  id v9 = v7;
  dispatch_async(Property, block);
}

void __76__HMDCameraStreamSnapshotHandler_setStreamSetupStatusForService_inProgress___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 40, 1);
  }
  id v5 = *(void **)(a1 + 40);
  id v6 = Property;
  id v7 = [v5 instanceID];
  [v6 setObject:v3 forKeyedSubscript:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *(id *)(a1 + 32);
  if (v9) {
    id v9 = objc_getProperty(v9, v8, 40, 1);
  }
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    LOBYTE(v14) = 0;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v10);
        }
        if (v14)
        {
          int v14 = 1;
        }
        else
        {
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v18 = *(id *)(a1 + 32);
          if (v18) {
            id v18 = objc_getProperty(v18, v12, 40, 1);
          }
          id v19 = objc_msgSend(v18, "objectForKeyedSubscript:", v17, (void)v23);
          int v14 = [v19 BOOLValue];
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v13);
  }
  else
  {
    int v14 = 0;
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20)
  {
    os_unfair_lock_lock_with_options();
    if (*(unsigned __int8 *)(v20 + 13) == v14)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 8));
    }
    else
    {
      *(unsigned char *)(v20 + 13) = v14;
      os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 8));
      uint64_t v22 = objc_getProperty((id)v20, v21, 32, 1);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__HMDCameraStreamSnapshotHandler_callStreamSetupInProgress___block_invoke;
      block[3] = &unk_264A2B870;
      block[4] = v20;
      char v28 = v14;
      dispatch_async(v22, block);
    }
  }
}

void __60__HMDCameraStreamSnapshotHandler_callStreamSetupInProgress___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id Property = objc_getProperty(*(id *)(a1 + 32), a2, 32, 1);
    dispatch_assert_queue_V2(Property);
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v2;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      SEL v21 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotHandler:didChangeStreamSetupInProgress", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = objc_getProperty(v6, v9, 48, 1);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "streamSnapshotHandler:didChangeStreamSetupInProgress:", v6, v3 != 0, (void)v16);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:buf count:16];
      }
      while (v12);
    }
  }
}

- (BOOL)isStreamSetupInProgress
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_streamSetupInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isStreamAvailable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_streamAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__HMDCameraStreamSnapshotHandler_removeDelegate___block_invoke;
  v8[3] = &unk_264A2F820;
  _OWORD v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

uint64_t __49__HMDCameraStreamSnapshotHandler_removeDelegate___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 48, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  return [Property removeObject:v4];
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__HMDCameraStreamSnapshotHandler_addDelegate___block_invoke;
  v8[3] = &unk_264A2F820;
  _OWORD v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

uint64_t __46__HMDCameraStreamSnapshotHandler_addDelegate___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 48, 1);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  return [Property addObject:v4];
}

- (HMDCameraStreamSnapshotHandler)initWithWorkQueue:(id)a3 services:(id)a4 logIdentifier:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)HMDCameraStreamSnapshotHandler;
  uint64_t v12 = [(HMDCameraStreamSnapshotHandler *)&v37 init];
  uint64_t v13 = v12;
  if (v12)
  {
    id v31 = v11;
    id v32 = v9;
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_workQueue, a3);
    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    streamSnapshotCaptures = v13->_streamSnapshotCaptures;
    v13->_streamSnapshotCaptures = (NSMutableSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    retiredStreamSnapshotCaptures = v13->_retiredStreamSnapshotCaptures;
    v13->_retiredStreamSnapshotCaptures = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    serviceInstanceStreamStatus = v13->_serviceInstanceStreamStatus;
    v13->_serviceInstanceStreamStatus = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v13->_logIdentifier, a5);
    uint64_t v20 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    delegates = v13->_delegates;
    v13->_delegates = (NSHashTable *)v20;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      uint64_t v26 = MEMORY[0x263EFFA80];
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          char v28 = v13->_serviceInstanceStreamStatus;
          long long v29 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v27), "instanceID", v31, v32, (void)v33);
          [(NSMutableDictionary *)v28 setObject:v26 forKeyedSubscript:v29];

          ++v27;
        }
        while (v24 != v27);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v24);
    }

    id v11 = v31;
    id v9 = v32;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_57915 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_57915, &__block_literal_global_57916);
  }
  v2 = (void *)logCategory__hmf_once_v1_57917;
  return v2;
}

void __45__HMDCameraStreamSnapshotHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_57917;
  logCategory__hmf_once_v1_57917 = v0;
}

@end