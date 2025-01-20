@interface HMFMutableNetService
- (HMFMutableNetService)initWithDomain:(id)a3 type:(id)a4 name:(id)a5 port:(unint64_t)a6;
- (HMFMutableNetService)initWithNetService:(id)a3;
- (id)internal;
- (id)publishBlock;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)netServiceWillPublish:(id)a3;
- (void)removeTXTRecordValueForKey:(id)a3;
- (void)setInternal:(id)a3;
- (void)setPort:(unint64_t)a3;
- (void)setPublishBlock:(id)a3;
- (void)setTXTRecord:(id)a3;
- (void)setTXTRecordValue:(id)a3 forKey:(id)a4;
- (void)startPublishingWithCompletionHandler:(id)a3;
- (void)stopPublishing;
- (void)updateTXTRecord;
@end

@implementation HMFMutableNetService

- (HMFMutableNetService)initWithNetService:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMFMutableNetService)initWithDomain:(id)a3 type:(id)a4 name:(id)a5 port:(unint64_t)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v26 = (void *)MEMORY[0x19F3A87A0]();
    v24 = self;
    v27 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v28 = HMFGetLogIdentifier(v24);
    *(_DWORD *)buf = 138543362;
    v34 = v28;
    v29 = "%{public}@Service domain is required";
LABEL_13:
    _os_log_impl(&dword_19D57B000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

    goto LABEL_14;
  }
  if (!v11)
  {
    v26 = (void *)MEMORY[0x19F3A87A0]();
    v24 = self;
    v27 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v28 = HMFGetLogIdentifier(v24);
    *(_DWORD *)buf = 138543362;
    v34 = v28;
    v29 = "%{public}@Service type is required";
    goto LABEL_13;
  }
  if (!v12)
  {
    v26 = (void *)MEMORY[0x19F3A87A0]();
    v24 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier(v24);
      *(_DWORD *)buf = 138543362;
      v34 = v28;
      v29 = "%{public}@Service name is required";
      goto LABEL_13;
    }
LABEL_14:

    v25 = 0;
    goto LABEL_15;
  }
  v31.receiver = self;
  v31.super_class = (Class)HMFMutableNetService;
  v14 = [(HMFNetService *)&v31 initWithNetService:0];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    domain = v14->super._domain;
    v14->super._domain = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    type = v14->super._type;
    v14->super._type = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    name = v14->super._name;
    v14->super._name = (NSString *)v19;

    v14->super._port = a6;
    v21 = +[HMFNetAddress localAddress];
    v32 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    addresses = v14->super._addresses;
    v14->super._addresses = (NSArray *)v22;
  }
  v24 = v14;
  v25 = v24;
LABEL_15:

  return v25;
}

- (void)setPort:(unint64_t)a3
{
}

- (void)setTXTRecord:(id)a3
{
  id v10 = a3;
  id v4 = (void *)[v10 mutableCopy];
  os_unfair_lock_lock_with_options();
  if ([(NSMutableDictionary *)self->super._TXTRecord isEqualToDictionary:v4])
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      v5 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    TXTRecord = self->super._TXTRecord;
    self->super._TXTRecord = v5;

    [(HMFMutableNetService *)self updateTXTRecord];
    os_unfair_lock_unlock(&self->super._lock);
    uint64_t v7 = [v4 copy];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = (void *)MEMORY[0x1E4F1CC08];
    }
    __notifyUpdatedTXTRecord(self, v9);
  }
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (__CFString *)v7;
  id v10 = (void *)MEMORY[0x1E4F18D60];
  v24 = v9;
  id v11 = [MEMORY[0x1E4F1C9B8] data];
  v25[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v13 = (id)[v10 dataFromTXTRecordDictionary:v12];

  id v14 = 0;
  uint64_t v15 = v8;
  id v16 = v6;
  uint64_t v17 = (void *)MEMORY[0x1E4F18D60];
  v24 = @"key";
  v25[0] = v16;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v19 = (id)[v17 dataFromTXTRecordDictionary:v18];

  id v20 = v14;
  os_unfair_lock_lock_with_options();
  v21 = [(NSMutableDictionary *)v15->super._TXTRecord objectForKey:v9];
  int v22 = [v21 isEqualToData:v16];

  if (v22)
  {
    os_unfair_lock_unlock(&v15->super._lock);
  }
  else
  {
    [(NSMutableDictionary *)v15->super._TXTRecord setObject:v16 forKey:v9];
    [(HMFMutableNetService *)v15 updateTXTRecord];
    v23 = (void *)[(NSMutableDictionary *)v15->super._TXTRecord copy];
    os_unfair_lock_unlock(&v15->super._lock);
    if (v23)
    {
      __notifyUpdatedTXTRecord(v15, v23);
    }
  }
}

- (void)removeTXTRecordValueForKey:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->super._TXTRecord removeObjectForKey:v5];
  [(HMFMutableNetService *)self updateTXTRecord];
  id v4 = (void *)[(NSMutableDictionary *)self->super._TXTRecord copy];
  os_unfair_lock_unlock(&self->super._lock);
  if (v4) {
    __notifyUpdatedTXTRecord(self, v4);
  }
}

- (void)updateTXTRecord
{
  v3 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HMFMutableNetService_updateTXTRecord__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__HMFMutableNetService_updateTXTRecord__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isPublishing])
  {
    v2 = [*(id *)(a1 + 32) internal];
    v3 = (void *)MEMORY[0x1E4F18D60];
    id v4 = [*(id *)(a1 + 32) TXTRecord];
    id v5 = [v3 dataFromTXTRecordDictionary:v4];
    char v6 = [v2 setTXTRecordData:v5];

    if ((v6 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x19F3A87A0]();
      id v8 = *(id *)(a1 + 32);
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier(v8);
        int v11 = 138543362;
        id v12 = v10;
        _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to update TXT record", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (id)internal
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->super._internal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternal:(id)a3
{
  id v4 = (NSNetService *)a3;
  os_unfair_lock_lock_with_options();
  internal = self->super._internal;
  self->super._internal = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)startPublishingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFNetService *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMFMutableNetService_startPublishingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5957780;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMFMutableNetService_startPublishingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isPublishing])
  {
    v2 = (void *)MEMORY[0x19F3A87A0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier(v3);
      int v28 = 138543362;
      v29 = v5;
      _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@The service is already publishing", (uint8_t *)&v28, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    return;
  }
  if ([*(id *)(a1 + 32) port])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F18D60]);
    id v8 = [*(id *)(a1 + 32) domain];
    v9 = [*(id *)(a1 + 32) type];
    id v10 = [*(id *)(a1 + 32) name];
    int v11 = objc_msgSend(v7, "initWithDomain:type:name:port:", v8, v9, v10, objc_msgSend(*(id *)(a1 + 32), "port"));

    if (v11)
    {
      [*(id *)(a1 + 32) setInternal:v11];
      [v11 setDelegate:*(void *)(a1 + 32)];
      id v12 = (void *)MEMORY[0x1E4F18D60];
      uint64_t v13 = [*(id *)(a1 + 32) TXTRecord];
      id v14 = [v12 dataFromTXTRecordDictionary:v13];
      [v11 setTXTRecordData:v14];

      uint64_t v15 = (void *)MEMORY[0x19F3A87A0]();
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier(v16);
        int v28 = 138543362;
        v29 = v18;
        _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@Start publishing the net service", (uint8_t *)&v28, 0xCu);
      }
      [*(id *)(a1 + 32) setPublishing:1];
      [*(id *)(a1 + 32) setPublishBlock:*(void *)(a1 + 40)];
      id v19 = [*(id *)(a1 + 32) internal];
      [v19 publishWithOptions:0];
    }
    else
    {
      v24 = (void *)MEMORY[0x19F3A87A0]();
      id v25 = *(id *)(a1 + 32);
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier(v25);
        int v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_19D57B000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to create internal net service", (uint8_t *)&v28, 0xCu);
      }
      if (!*(void *)(a1 + 40)) {
        goto LABEL_20;
      }
      id v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Failed to create record."];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

LABEL_20:
    return;
  }
  id v20 = (void *)MEMORY[0x19F3A87A0]();
  id v21 = *(id *)(a1 + 32);
  int v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = HMFGetLogIdentifier(v21);
    int v28 = 138543362;
    v29 = v23;
    _os_log_impl(&dword_19D57B000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot publish without a resolved port", (uint8_t *)&v28, 0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    int v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Cannot publish without a resolved port."];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
}

- (void)stopPublishing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(HMFNetService *)self isPublishing])
  {
    id v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      *(_DWORD *)buf = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping the net service", buf, 0xCu);
    }
    [(HMFNetService *)v4 setPublishing:0];
    id v7 = [(HMFNetService *)v4 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HMFMutableNetService_stopPublishing__block_invoke;
    block[3] = &unk_1E5957698;
    block[4] = v4;
    dispatch_async(v7, block);
  }
}

void __38__HMFMutableNetService_stopPublishing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) internal];
  [v1 stop];
}

- (void)netServiceWillPublish:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier(v6);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Net service will publish", (uint8_t *)&v9, 0xCu);
  }
}

- (void)netServiceDidPublish:(id)a3
{
  id v4 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMFMutableNetService_netServiceDidPublish___block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v4, block);
}

void __45__HMFMutableNetService_netServiceDidPublish___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Published", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) publishBlock];
  if (v6)
  {
    [*(id *)(a1 + 32) setPublishBlock:0];
    v6[2](v6, 0);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMFNetService *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HMFMutableNetService_netService_didNotPublish___block_invoke;
  v8[3] = &unk_1E5957730;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __49__HMFMutableNetService_netService_didNotPublish___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Failed to publish", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v6 = (void *)MEMORY[0x19F3A87A0]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier(v7);
    uint64_t v10 = *(void *)(a1 + 40);
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Failed to publish with error: %@", (uint8_t *)&v15, 0x16u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) publishBlock];
  if (v11)
  {
    [*(id *)(a1 + 32) setPublishBlock:0];
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = [(id)objc_opt_class() errorFromNetServiceErrorDict:*(void *)(a1 + 40)];
    id v14 = [v12 hmfErrorWithCode:11 reason:@"Failed to publish net service." suggestion:0 underlyingError:v13];

    ((void (**)(void, void *))v11)[2](v11, v14);
  }
}

- (void)netServiceDidStop:(id)a3
{
  id v4 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__HMFMutableNetService_netServiceDidStop___block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v4, block);
}

void __42__HMFMutableNetService_netServiceDidStop___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service did stop", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) setPublishing:0];
  [*(id *)(a1 + 32) setInternal:0];
  uint64_t v6 = [*(id *)(a1 + 32) publishBlock];
  if (v6)
  {
    [*(id *)(a1 + 32) setPublishBlock:0];
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12 reason:@"Net service stopped publishing."];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
}

- (id)publishBlock
{
  return self->_publishBlock;
}

- (void)setPublishBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end