@interface HMWeeklyScheduleEntry
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMWeeklyScheduleEntry)initWithCoder:(id)a3;
- (HMWeeklyScheduleEntry)initWithDictionary:(id)a3;
- (HMWeeklyScheduleEntry)initWithStart:(id)a3 end:(id)a4;
- (NSDateComponents)end;
- (NSDateComponents)start;
- (id)serializeForAdd;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMWeeklyScheduleEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

- (NSDateComponents)end
{
  return self->_end;
}

- (NSDateComponents)start
{
  return self->_start;
}

- (HMWeeklyScheduleEntry)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "hmf_integerForKey:error:", @"startWeekday", 0);
    uint64_t v7 = objc_msgSend(v5, "hmf_integerForKey:error:", @"startHour", 0);
    uint64_t v8 = objc_msgSend(v5, "hmf_integerForKey:error:", @"startMinute", 0);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v9 setWeekday:v6];
    [v9 setHour:v7];
    uint64_t v10 = [v9 setMinute:v8];
    if (v9)
    {
      uint64_t v11 = objc_msgSend(v5, "hmf_integerForKey:error:", @"endWeekday", 0);
      uint64_t v12 = objc_msgSend(v5, "hmf_integerForKey:error:", @"endHour", 0);
      uint64_t v13 = objc_msgSend(v5, "hmf_integerForKey:error:", @"endMinute", 0);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v14 setWeekday:v11];
      [v14 setHour:v12];
      uint64_t v15 = [v14 setMinute:v13];
      if (v14)
      {
        self = [(HMWeeklyScheduleEntry *)self initWithStart:v9 end:v14];
        v16 = self;
      }
      else
      {
        v20 = (void *)MEMORY[0x19F3A64A0](v15);
        self = self;
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = HMFGetLogIdentifier();
          int v24 = 138543362;
          v25 = v22;
          _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the end date components", (uint8_t *)&v24, 0xCu);
        }
        v16 = 0;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x19F3A64A0](v10);
      self = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v24 = 138543362;
        v25 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the start date components", (uint8_t *)&v24, 0xCu);
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)serializeForAdd
{
  v24[6] = *MEMORY[0x1E4F143B8];
  v23[0] = @"startWeekday";
  v3 = NSNumber;
  v22 = [(HMWeeklyScheduleEntry *)self start];
  v21 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v22, "weekday"));
  v24[0] = v21;
  v23[1] = @"startHour";
  id v4 = NSNumber;
  v20 = [(HMWeeklyScheduleEntry *)self start];
  v5 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v20, "hour"));
  v24[1] = v5;
  v23[2] = @"startMinute";
  uint64_t v6 = NSNumber;
  uint64_t v7 = [(HMWeeklyScheduleEntry *)self start];
  uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "minute"));
  v24[2] = v8;
  v23[3] = @"endWeekday";
  id v9 = NSNumber;
  uint64_t v10 = [(HMWeeklyScheduleEntry *)self end];
  uint64_t v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "weekday"));
  v24[3] = v11;
  v23[4] = @"endHour";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [(HMWeeklyScheduleEntry *)self end];
  id v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "hour"));
  v24[4] = v14;
  v23[5] = @"endMinute";
  uint64_t v15 = NSNumber;
  v16 = [(HMWeeklyScheduleEntry *)self end];
  v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "minute"));
  v24[5] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  return v18;
}

- (HMWeeklyScheduleEntry)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMScheduleEntryStartCodingKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMScheduleEntryEndCodingKey"];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding start:%@, end:%@", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = [(HMWeeklyScheduleEntry *)self initWithStart:v5 end:v6];
    uint64_t v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMWeeklyScheduleEntry *)self start];
  [v4 encodeObject:v5 forKey:@"HMScheduleEntryStartCodingKey"];

  id v6 = [(HMWeeklyScheduleEntry *)self end];
  [v4 encodeObject:v6 forKey:@"HMScheduleEntryEndCodingKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMWeeklyScheduleEntry *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      uint64_t v7 = v6;

      BOOL v8 = [(HMWeeklyScheduleEntry *)self start];
      id v9 = [(HMWeeklyScheduleEntry *)v7 start];
      if ([v8 isEqual:v9])
      {
        uint64_t v10 = [(HMWeeklyScheduleEntry *)self end];
        uint64_t v11 = [(HMWeeklyScheduleEntry *)v7 end];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (HMWeeklyScheduleEntry)initWithStart:(id)a3 end:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMWeeklyScheduleEntry;
  id v9 = [(HMWeeklyScheduleEntry *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong((id *)&v10->_end, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1) {
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_472);
  }
  v2 = (void *)logCategory__hmf_once_v5;

  return v2;
}

uint64_t __36__HMWeeklyScheduleEntry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5;
  logCategory__hmf_once_v5 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end