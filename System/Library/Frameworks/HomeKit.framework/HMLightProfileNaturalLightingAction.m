@interface HMLightProfileNaturalLightingAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithProtoBuf:(id)a3 home:(id)a4;
- (BOOL)_handleUpdates:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMLightProfile)lightProfile;
- (HMLightProfileNaturalLightingAction)init;
- (HMLightProfileNaturalLightingAction)initWithCoder:(id)a3;
- (HMLightProfileNaturalLightingAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMLightProfileNaturalLightingAction)initWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4;
- (HMLightProfileNaturalLightingAction)initWithUUID:(id)a3;
- (_BYTE)initWithLightProfile:(char)a3 naturalLightingEnabled:(void *)a4 uuid:;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProtoBuf;
- (unint64_t)type;
- (void)__configureWithContext:(id)a3 actionSet:(id)a4;
- (void)updateNaturalLightingEnabled:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMLightProfileNaturalLightingAction

- (void).cxx_destruct
{
}

- (HMLightProfile)lightProfile
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lightProfile;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isNaturalLightingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_naturalLightingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateNaturalLightingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(HMAction *)self context];
  if (!v6)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMLightProfileNaturalLightingAction updateNaturalLightingEnabled:completionHandler:]", @"completion"];
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      __int16 v30 = 2112;
      v31 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  v8 = (void *)v7;
  if (v7)
  {
    v9 = [(HMAction *)self actionSet];
    v10 = [v9 home];
    if (v10)
    {
      v11 = [(HMAction *)self uuid];

      if (v11)
      {
        v26 = @"hmlp.nle";
        v12 = [NSNumber numberWithBool:v4];
        v27 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

        [v9 _updateAction:self changes:v13 completionHandler:v6];
LABEL_12:

        goto LABEL_13;
      }
      os_unfair_lock_lock_with_options();
      self->_naturalLightingEnabled = v4;
      os_unfair_lock_unlock(&self->_lock);
      v18 = [v8 delegateCaller];
      [v18 callCompletion:v6 error:0];
    }
    else
    {
      v18 = [v8 delegateCaller];
      v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      [v18 callCompletion:v6 error:v19];
    }
    goto LABEL_12;
  }
  v14 = (void *)MEMORY[0x19F3A64A0]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v17;
    __int16 v30 = 2080;
    v31 = "-[HMLightProfileNaturalLightingAction updateNaturalLightingEnabled:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  v6[2](v6, v9);
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMLightProfileNaturalLightingAction initWithLightProfile:naturalLightingEnabled:uuid:]([HMLightProfileNaturalLightingAction alloc], self->_lightProfile, self->_naturalLightingEnabled, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (_BYTE)initWithLightProfile:(char)a3 naturalLightingEnabled:(void *)a4 uuid:
{
  id v8 = a2;
  id v9 = a4;
  if (!a1) {
    goto LABEL_8;
  }
  uint64_t v10 = [v8 profileUniqueIdentifier];
  if (!v10)
  {
    _HMFPreconditionFailure();
LABEL_8:
    v14 = 0;
    goto LABEL_6;
  }
  v11 = (void *)v10;
  v16.receiver = a1;
  v16.super_class = (Class)HMLightProfileNaturalLightingAction;
  id v12 = objc_msgSendSuper2(&v16, sel_initWithUUID_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 7, a2);
    v13[52] = a3;
  }
  v14 = v13;

LABEL_6:
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (HMLightProfileNaturalLightingAction *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    uint64_t v7 = v6;
    if (v6
      && (BOOL v8 = [(HMLightProfileNaturalLightingAction *)v6 isNaturalLightingEnabled],
          v8 == [(HMLightProfileNaturalLightingAction *)self isNaturalLightingEnabled]))
    {
      uint64_t v10 = [(HMLightProfileNaturalLightingAction *)v7 lightProfile];
      v11 = [(HMLightProfileNaturalLightingAction *)self lightProfile];
      char v9 = [v10 isEqual:v11];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMLightProfileNaturalLightingAction)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMLightProfileNaturalLightingAction;
  v5 = [(HMAction *)&v17 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hmlp.lp"];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    BOOL v8 = [[HMLightProfile alloc] initWithLightProfile:v6];
    lightProfile = v5->_lightProfile;
    v5->_lightProfile = v8;

    v5->_naturalLightingEnabled = [v4 decodeBoolForKey:@"hmlp.nle"];
LABEL_4:
    uint64_t v10 = v5;
    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = v5;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    uint64_t v15 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing light profile", buf, 0x16u);
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 isNaturalLightingEnabled];
    os_unfair_lock_lock_with_options();
    int naturalLightingEnabled = self->_naturalLightingEnabled;
    BOOL v10 = naturalLightingEnabled != v8;
    if (naturalLightingEnabled != v8) {
      self->_int naturalLightingEnabled = v8;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)encodeAsProtoBuf
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HMLightProfileNaturalLightingAction *)self lightProfile];
  if (v3)
  {
    id v4 = objc_alloc_init(HMPBNaturalLightingAction);
    v5 = [(HMAction *)self uuid];
    id v6 = objc_msgSend(v5, "hm_convertToData");
    [(HMPBNaturalLightingAction *)v4 setUuid:v6];

    uint64_t v7 = [v3 profileUniqueIdentifier];
    int v8 = objc_msgSend(v7, "hm_convertToData");
    [(HMPBNaturalLightingAction *)v4 setLightProfileUUID:v8];

    [(HMPBNaturalLightingAction *)v4 setNaturalLightingEnabled:[(HMLightProfileNaturalLightingAction *)self isNaturalLightingEnabled]];
    char v9 = objc_alloc_init(HMPBActionContainer);
    [(HMPBActionContainer *)v9 setType:3];
    [(HMPBActionContainer *)v9 setNaturalLightingAction:v4];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543874;
      objc_super v16 = v13;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed encode action as protobuf, light profile is invalid %@:%@", (uint8_t *)&v15, 0x20u);
    }
    char v9 = 0;
  }

  return v9;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMLightProfileNaturalLightingAction;
  [(HMAction *)&v12 __configureWithContext:v6 actionSet:v7];
  int v8 = [v7 home];
  os_unfair_lock_lock_with_options();
  char v9 = [(HMAccessoryProfile *)self->_lightProfile profileUniqueIdentifier];
  BOOL v10 = [v8 lightProfileWithProfileUUID:v9];
  lightProfile = self->_lightProfile;
  self->_lightProfile = v10;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)type
{
  return 3;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_numberForKey:", @"hmlp.nle");
  if (v5)
  {
    os_unfair_lock_lock_with_options();
    self->_int naturalLightingEnabled = [v5 BOOLValue];
    os_unfair_lock_unlock(&self->_lock);
  }

  return 1;
}

- (id)_serializeForAdd
{
  v11.receiver = self;
  v11.super_class = (Class)HMLightProfileNaturalLightingAction;
  v3 = [(HMAction *)&v11 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
  [v4 setObject:v5 forKeyedSubscript:@"hmlp.nle"];

  id v6 = [(HMLightProfileNaturalLightingAction *)self lightProfile];
  id v7 = [v6 profileUniqueIdentifier];
  int v8 = [v7 UUIDString];
  [v4 setObject:v8 forKeyedSubscript:@"hmlp.uuid"];

  char v9 = (void *)[v4 copy];

  return v9;
}

- (HMLightProfileNaturalLightingAction)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMLightProfileNaturalLightingAction;
  int v8 = [(HMAction *)&v24 initWithDictionary:v6 home:v7];
  if (!v8) {
    goto LABEL_5;
  }
  char v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"hmlp.uuid");
  if (!v9)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = v8;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_super v16 = HMFGetLogIdentifier();
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      v18 = "%{public}@Unable to decode %@, missing light profile id";
      __int16 v19 = v15;
      uint32_t v20 = 22;
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
LABEL_11:

    objc_super v12 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v7 lightProfileWithProfileUUID:v9];
  lightProfile = v8->_lightProfile;
  v8->_lightProfile = (HMLightProfile *)v10;

  if (!v8->_lightProfile)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = v8;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_super v16 = HMFGetLogIdentifier();
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      __int16 v29 = 2112;
      __int16 v30 = v9;
      v18 = "%{public}@Unable to decode %@, failed to resolve light profile %@";
      __int16 v19 = v15;
      uint32_t v20 = 32;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v8->_int naturalLightingEnabled = objc_msgSend(v6, "hmf_BOOLForKey:", @"hmlp.nle");

LABEL_5:
  objc_super v12 = v8;
LABEL_12:

  return v12;
}

- (HMLightProfileNaturalLightingAction)initWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4
{
  return (HMLightProfileNaturalLightingAction *)-[HMLightProfileNaturalLightingAction initWithLightProfile:naturalLightingEnabled:uuid:](self, a3, a4, 0);
}

- (HMLightProfileNaturalLightingAction)initWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  int v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMLightProfileNaturalLightingAction)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithProtoBuf:(id)a3 home:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F29128];
  int v8 = [v5 uuid];
  char v9 = objc_msgSend(v7, "hmf_UUIDWithBytesAsData:", v8);

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F29128];
    objc_super v11 = [v5 lightProfileUUID];
    objc_super v12 = objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);

    if (v12)
    {
      v13 = [v6 lightProfileWithProfileUUID:v12];
      if (v13)
      {
        v14 = -[HMLightProfileNaturalLightingAction initWithLightProfile:naturalLightingEnabled:uuid:]([HMLightProfileNaturalLightingAction alloc], v13, [v5 naturalLightingEnabled], v9);
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          int v25 = 138543874;
          v26 = v23;
          __int16 v27 = 2112;
          id v28 = v5;
          __int16 v29 = 2112;
          __int16 v30 = v12;
          _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting action from protobuf, light profile with UUID does not exist %@:%@", (uint8_t *)&v25, 0x20u);
        }
        v14 = 0;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint32_t v20 = HMFGetLogIdentifier();
        int v25 = 138543874;
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v5;
        __int16 v29 = 2112;
        __int16 v30 = 0;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting action from protobuf, invalid light profile uuid %@:%@", (uint8_t *)&v25, 0x20u);
      }
      v14 = 0;
    }
  }
  else
  {
    int v15 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v25 = 138543874;
      v26 = v17;
      __int16 v27 = 2112;
      id v28 = v5;
      __int16 v29 = 2112;
      __int16 v30 = 0;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting action from protobuf, invalid uuid %@:%@", (uint8_t *)&v25, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

@end