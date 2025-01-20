@interface HMSignificantTimeEvent
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMSignificantEvent)significantEvent;
- (HMSignificantTimeEvent)initWithCoder:(id)a3;
- (HMSignificantTimeEvent)initWithDict:(id)a3 significantEvent:(id)a4 offset:(id)a5;
- (HMSignificantTimeEvent)initWithSignificantEvent:(HMSignificantEvent)significantEvent offset:(NSDateComponents *)offset;
- (NSDateComponents)offset;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_updateFromDictionary:(id)a3;
- (void)setOffset:(id)a3;
- (void)setSignificantEvent:(id)a3;
- (void)updateOffset:(id)a3 completionHandler:(id)a4;
- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4;
@end

@implementation HMSignificantTimeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);

  objc_storeStrong((id *)&self->_significantEvent, 0);
}

- (HMSignificantTimeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMSignificantTimeEvent;
  v5 = [(HMEvent *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSignificantTimeEventSignificantEvent"];
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSignificantTimeEventOffset"];
    offset = v5->_offset;
    v5->_offset = (NSDateComponents *)v8;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableSignificantTimeEvent alloc];
  v5 = [(HMSignificantTimeEvent *)self significantEvent];
  uint64_t v6 = [(HMSignificantTimeEvent *)self offset];
  v7 = [(HMSignificantTimeEvent *)v4 initWithSignificantEvent:v5 offset:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_stringForKey:", @"kSignificantTimeEventSignificantEvent");
  uint64_t v6 = [v4 dateComponentsForKey:@"kSignificantTimeEventOffset"];
  v7 = [[HMSignificantTimeEvent alloc] initWithDict:v4 significantEvent:v5 offset:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMSignificantTimeEvent alloc];
  v5 = [(HMSignificantTimeEvent *)self significantEvent];
  uint64_t v6 = [(HMSignificantTimeEvent *)self offset];
  v7 = [(HMSignificantTimeEvent *)v4 initWithSignificantEvent:v5 offset:v6];

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMSignificantTimeEvent;
  BOOL v5 = [(HMEvent *)&v18 mergeFromNewObject:v4];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(HMSignificantTimeEvent *)self significantEvent];
    v10 = [v8 significantEvent];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      v12 = [v8 significantEvent];
      [(HMSignificantTimeEvent *)self setSignificantEvent:v12];

      BOOL v5 = 1;
    }
    v13 = [(HMSignificantTimeEvent *)self offset];
    v14 = [v8 offset];
    char v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
    {
      v16 = [v8 offset];
      [(HMSignificantTimeEvent *)self setOffset:v16];

      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)updateOffset:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSignificantTimeEvent updateOffset:completionHandler:]", @"completion"];
    v26 = (void *)MEMORY[0x19F3A64A0]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v29;
      __int16 v35 = 2112;
      v36 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = [(HMSignificantTimeEvent *)self offset];
    int v11 = [v10 isEqual:v6];

    if (v11)
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        char v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v15;
        __int16 v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Offset is already %@", buf, 0x16u);
      }
      v16 = [v9 delegateCaller];
      [v16 callCompletion:v7 error:0];
    }
    else
    {
      uint64_t v21 = encodeRootObject(v6);
      if (v21)
      {
        v16 = (void *)v21;
        v31 = @"kSignificantTimeEventOffset";
        uint64_t v32 = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        [(HMEvent *)self _updateEventWithPayload:v22 completionHandler:v7];
      }
      else
      {
        v23 = [v9 delegateCaller];
        v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v23 callCompletion:v7 error:v24];

        v16 = 0;
      }
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v20;
      __int16 v35 = 2080;
      v36 = "-[HMSignificantTimeEvent updateOffset:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
  }
}

- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSignificantTimeEvent updateSignificantEvent:completionHandler:]", @"completion"];
    v22 = (void *)MEMORY[0x19F3A64A0]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v25;
      __int16 v31 = 2112;
      uint64_t v32 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = [(HMSignificantTimeEvent *)self significantEvent];
    int v11 = [v10 isEqualToString:v6];

    if (v11)
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        char v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v30 = v15;
        __int16 v31 = 2112;
        uint64_t v32 = v6;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Significant event is already %@", buf, 0x16u);
      }
      v16 = [v9 delegateCaller];
      [v16 callCompletion:v7 error:0];
    }
    else
    {
      v27 = @"kSignificantTimeEventSignificantEvent";
      v28 = v6;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [(HMEvent *)self _updateEventWithPayload:v16 completionHandler:v7];
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v20;
      __int16 v31 = 2080;
      uint64_t v32 = "-[HMSignificantTimeEvent updateSignificantEvent:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
  }
}

- (void)_updateFromDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMSignificantTimeEvent;
  [(HMEvent *)&v7 _updateFromDictionary:v4];
  BOOL v5 = objc_msgSend(v4, "hmf_stringForKey:", @"kSignificantTimeEventSignificantEvent");
  if (v5) {
    [(HMSignificantTimeEvent *)self setSignificantEvent:v5];
  }
  id v6 = [v4 dateComponentsForKey:@"kSignificantTimeEventOffset"];
  if (v6) {
    [(HMSignificantTimeEvent *)self setOffset:v6];
  }
}

- (id)_serializeForAdd
{
  v11.receiver = self;
  v11.super_class = (Class)HMSignificantTimeEvent;
  v3 = [(HMEvent *)&v11 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(HMSignificantTimeEvent *)self significantEvent];
  [v4 setObject:v5 forKeyedSubscript:@"kSignificantTimeEventSignificantEvent"];

  id v6 = [(HMSignificantTimeEvent *)self offset];

  if (v6)
  {
    objc_super v7 = [(HMSignificantTimeEvent *)self offset];
    uint64_t v8 = encodeRootObject(v7);
    [v4 setObject:v8 forKeyedSubscript:@"kSignificantTimeEventOffset"];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (void)setOffset:(id)a3
{
  id v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  offset = self->_offset;
  self->_offset = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (NSDateComponents)offset
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_offset;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSignificantEvent:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  significantEvent = self->_significantEvent;
  self->_significantEvent = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (HMSignificantEvent)significantEvent
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMSignificantTimeEvent)initWithDict:(id)a3 significantEvent:(id)a4 offset:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMSignificantTimeEvent;
  objc_super v11 = [(HMEvent *)&v14 initWithDict:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_significantEvent, a4);
    objc_storeStrong((id *)&v12->_offset, a5);
  }

  return v12;
}

- (HMSignificantTimeEvent)initWithSignificantEvent:(HMSignificantEvent)significantEvent offset:(NSDateComponents *)offset
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"kEventUUIDKey";
  id v6 = (void *)MEMORY[0x1E4F29128];
  objc_super v7 = offset;
  uint64_t v8 = significantEvent;
  id v9 = [v6 UUID];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  objc_super v11 = [(HMSignificantTimeEvent *)self initWithDict:v10 significantEvent:v8 offset:v7];

  return v11;
}

@end