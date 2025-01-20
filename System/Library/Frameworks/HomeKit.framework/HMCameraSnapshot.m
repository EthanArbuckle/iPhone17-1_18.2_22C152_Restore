@interface HMCameraSnapshot
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)didFillSlot;
- (HMCameraSnapshot)init;
- (HMCameraSnapshot)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(double)a5 captureDate:(id)a6;
- (NSArray)attributeDescriptions;
- (NSDate)captureDate;
- (NSString)description;
- (NSString)shortDescription;
- (void)_releaseSlotIdentifier;
- (void)dealloc;
- (void)fillSlotWithCompletionHandler:(id)a3;
- (void)setDidFillSlot:(BOOL)a3;
@end

@implementation HMCameraSnapshot

- (void).cxx_destruct
{
}

- (void)setDidFillSlot:(BOOL)a3
{
  self->_didFillSlot = a3;
}

- (BOOL)didFillSlot
{
  return self->_didFillSlot;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (NSArray)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMCameraSource *)self slotIdentifier];
  v5 = (void *)[v3 initWithName:@"Slot Identifier" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = NSNumber;
  [(HMCameraSource *)self aspectRatio];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)[v6 initWithName:@"Aspect Ratio" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMCameraSnapshot *)self captureDate];
  v12 = (void *)[v10 initWithName:@"Capture Date" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return (NSArray *)v13;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (void)_releaseSlotIdentifier
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [(HMCameraSource *)v4 slotIdentifier];
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot slot identifier: %@", buf, 0x16u);
  }
  uint64_t v8 = [(HMCameraSource *)v4 context];
  if (!v8) {
    _HMFPreconditionFailure();
  }
  v9 = (void *)v8;
  id v10 = objc_alloc(MEMORY[0x1E4F65488]);
  v11 = [(HMCameraSource *)v4 profileUniqueIdentifier];
  v12 = (void *)[v10 initWithTarget:v11];

  v13 = [(HMCameraSource *)v4 slotIdentifier];
  v18 = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMCameraSnapshotReleaseSnapshotMessage" destination:v12 payload:v14];
  v16 = [v9 messageDispatcher];
  [v16 sendMessage:v15];
}

- (void)fillSlotWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    v9 = [(HMCameraSource *)v6 slotIdentifier];
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    __int16 v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot slot identifier: %@", buf, 0x16u);
  }
  [(HMCameraSnapshot *)v6 setDidFillSlot:1];
  uint64_t v10 = [(HMCameraSource *)v6 context];
  if (!v10) {
    _HMFPreconditionFailure();
  }
  v11 = (void *)v10;
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  v13 = [(HMCameraSource *)v6 profileUniqueIdentifier];
  v14 = (void *)[v12 initWithTarget:v13];

  v24 = @"kSlotIdentifierKey";
  v15 = [(HMCameraSource *)v6 slotIdentifier];
  v25 = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMCameraSnapshotFillSnapshotSlotMessage" destination:v14 payload:v16];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__HMCameraSnapshot_fillSlotWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E5945510;
  v21[4] = v6;
  id v22 = v11;
  id v23 = v4;
  id v18 = v4;
  id v19 = v11;
  [v17 setResponseHandler:v21];
  v20 = [v19 messageDispatcher];
  [v20 sendMessage:v17];
}

void __50__HMCameraSnapshot_fillSlotWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      id v12 = "%{public}@Failed to fill slot: %@";
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
    id v12 = "%{public}@Successfully filled slot";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)dealloc
{
  if (self->_didFillSlot) {
    [(HMCameraSnapshot *)self _releaseSlotIdentifier];
  }
  v3.receiver = self;
  v3.super_class = (Class)HMCameraSnapshot;
  [(HMCameraSnapshot *)&v3 dealloc];
}

- (HMCameraSnapshot)initWithProfileUniqueIdentifier:(id)a3 slotIdentifier:(id)a4 aspectRatio:(double)a5 captureDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
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
  v13 = v12;
  if (!v12)
  {
LABEL_11:
    id v18 = (HMCameraSnapshot *)_HMFPreconditionFailure();
    return [(HMCameraSnapshot *)v18 init];
  }
  v20.receiver = self;
  v20.super_class = (Class)HMCameraSnapshot;
  os_log_type_t v14 = [(HMCameraSource *)&v20 initWithProfileUniqueIdentifier:v10 slotIdentifier:v11 aspectRatio:a5];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    captureDate = v14->_captureDate;
    v14->_captureDate = (NSDate *)v15;
  }
  return v14;
}

- (HMCameraSnapshot)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraSnapshot;
  return [(HMCameraSource *)&v3 init];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_5962 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_5962, &__block_literal_global_5963);
  }
  v2 = (void *)logCategory__hmf_once_v5_5964;

  return v2;
}

uint64_t __31__HMCameraSnapshot_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_5964;
  logCategory__hmf_once_v5_5964 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end