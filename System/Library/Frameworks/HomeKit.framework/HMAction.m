@interface HMAction
+ (BOOL)supportsSecureCoding;
+ (HMAction)new;
- (BOOL)_handleUpdates:(id)a3;
- (BOOL)isAffectedByEndEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (HMAction)init;
- (HMAction)initWithCoder:(id)a3;
- (HMAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMAction)initWithUUID:(id)a3;
- (HMActionSet)actionSet;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProtoBuf;
- (unint64_t)hash;
- (unint64_t)type;
- (void)__configureWithContext:(id)a3 actionSet:(id)a4;
- (void)_unconfigure;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation HMAction

- (unint64_t)hash
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    return 0;
  }
  else {
    return 1073741789 * [(HMAction *)self type] + 1073741789;
  }
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  v6 = (_HMContext *)a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  context = self->_context;
  self->_context = v6;

  objc_storeWeak((id *)&self->_actionSet, v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (HMAction)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMAction;
  v5 = [(HMAction *)&v25 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionUUID"];
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  if (!v7)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = v5;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing uuid", buf, 0x16u);
    }
    goto LABEL_12;
  }
  v8 = (void *)v7;
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionActionSet"];
  if (!v9)
  {
    v19 = (void *)MEMORY[0x19F3A64A0]();
    v20 = v5;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      uint64_t v23 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing action set", buf, 0x16u);
    }

LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  v10 = (void *)v9;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v8);
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v11;

  objc_storeWeak((id *)&v5->_actionSet, v10);
LABEL_5:
  v13 = v5;
LABEL_13:

  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionSet);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (HMActionSet)actionSet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSet);

  return (HMActionSet *)WeakRetained;
}

- (_HMContext)context
{
  return self->_context;
}

- (HMAction)init
{
  return [(HMAction *)self initWithUUID:0];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  uint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v12 = NSString;
    v13 = NSStringFromSelector(a2);
    v14 = [v12 stringWithFormat:@"You must override %@ in a subclass", v13];
    id v15 = [v10 exceptionWithName:v11 reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
  v6 = [HMAction alloc];
  uint64_t v7 = [(HMAction *)self uuid];
  v8 = [(HMAction *)v6 initWithUUID:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)encodeAsProtoBuf
{
  return 0;
}

- (BOOL)_handleUpdates:(id)a3
{
  return 0;
}

- (id)_serializeForAdd
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"kActionType";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAction type](self, "type"));
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (BOOL)isAffectedByEndEvents
{
  return 0;
}

- (BOOL)isValidWithError:(id *)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (a3 && v4 == v5)
  {
    *a3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
  }
  return v4 != v6;
}

- (BOOL)isValid
{
  return [(HMAction *)self isValidWithError:0];
}

- (void)setUuid:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v8);
  }
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v9);
  uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v5;

  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)uuid
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_uuid;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)type
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)_unconfigure
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  context = self->_context;
  self->_context = 0;

  objc_storeWeak((id *)&self->_actionSet, 0);

  os_unfair_lock_unlock(p_lock);
}

- (HMAction)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
  id v9 = v8;
  if (!v8)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v29 = 138543618;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = objc_opt_class();
      v17 = "%{public}@Unable to decode %@, missing action type";
      uint64_t v18 = v15;
      uint32_t v19 = 22;
LABEL_12:
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v29, v19);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v10 = (objc_class *)HMClassForActionType([v8 unsignedIntegerValue]);
  if (!v10)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v29 = 138543874;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 2112;
      v34 = v9;
      v17 = "%{public}@Unable to decode %@, invalid action type: %@";
      goto LABEL_11;
    }
LABEL_13:

    v20 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    v20 = (HMAction *)[[v11 alloc] initWithDictionary:v6 home:v7];
    goto LABEL_14;
  }
  if ((objc_class *)v12 != v11)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v29 = 138543874;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 2112;
      v34 = v9;
      v17 = "%{public}@Unable to decode %@, wrong action type: %@";
LABEL_11:
      uint64_t v18 = v15;
      uint32_t v19 = 32;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v22 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionUUID");
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v22);
    uint64_t v23 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uuid = self->_uuid;
    self->_uuid = v23;

    v20 = self;
  }
  else
  {
    objc_super v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      int v29 = 138543618;
      uint64_t v30 = v28;
      __int16 v31 = 2112;
      uint64_t v32 = objc_opt_class();
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing uuid", (uint8_t *)&v29, 0x16u);
    }
    v20 = 0;
  }

LABEL_14:
  return v20;
}

- (HMAction)initWithUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMAction;
  uint64_t v5 = [(HMAction *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v4);
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v6;
    }
    else
    {
      uint64_t v8 = HMTransientIdentifier();
      uuid = v5->_uniqueIdentifier;
      v5->_uniqueIdentifier = (NSUUID *)v8;
    }
  }
  return v5;
}

+ (HMAction)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HMAction;
  return (HMAction *)objc_msgSendSuper2(&v3, "new");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end