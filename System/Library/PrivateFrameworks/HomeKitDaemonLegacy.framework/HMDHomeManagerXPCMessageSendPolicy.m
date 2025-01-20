@interface HMDHomeManagerXPCMessageSendPolicy
- (BOOL)canSendWithPolicyParameters:(id)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (HMDHomeManagerXPCMessageSendPolicy)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4;
- (HMDHomeManagerXPCMessageSendPolicy)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4 active:(BOOL)a5;
- (id)attributeDescriptions;
- (unint64_t)entitlements;
- (unint64_t)hash;
- (unint64_t)options;
@end

@implementation HMDHomeManagerXPCMessageSendPolicy

- (BOOL)canSendWithPolicyParameters:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      int v25 = 138543874;
      v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = objc_opt_class();
      __int16 v29 = 2112;
      id v30 = v4;
      v15 = "%{public}@Cannot send message with policy parameters because they are of unexpected class %@: %@";
      v16 = v13;
      uint32_t v17 = 32;
LABEL_13:
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v25, v17);
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  uint64_t v7 = [v6 entitlements];
  unint64_t v8 = [(HMDHomeManagerXPCMessageSendPolicy *)self entitlements] & v7;
  if (v8 != [(HMDHomeManagerXPCMessageSendPolicy *)self entitlements])
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      [v6 entitlements];
      v19 = HMXPCClientEntitlementsShortDescription();
      [(HMDHomeManagerXPCMessageSendPolicy *)v18 entitlements];
      v20 = HMXPCClientEntitlementsShortDescription();
      int v25 = 138543874;
      v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v19;
      __int16 v29 = 2112;
      id v30 = v20;
      v21 = "%{public}@Cannot send message with policy parameters because entitlements %@ do not contain all of the requi"
            "red entitlements: %@";
LABEL_16:
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v25, 0x20u);

      goto LABEL_17;
    }
LABEL_18:

    BOOL v10 = 0;
    goto LABEL_19;
  }
  if ([(HMDHomeManagerXPCMessageSendPolicy *)self options])
  {
    unint64_t v9 = [(HMDHomeManagerXPCMessageSendPolicy *)self options];
    if (([v6 options] & v9) == 0)
    {
      v11 = (void *)MEMORY[0x1D9452090]();
      v23 = self;
      v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      v14 = HMFGetLogIdentifier();
      [v6 options];
      v19 = HMHomeManagerOptionsToString();
      [(HMDHomeManagerXPCMessageSendPolicy *)v23 options];
      v20 = HMHomeManagerOptionsToString();
      int v25 = 138543874;
      v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = (uint64_t)v19;
      __int16 v29 = 2112;
      id v30 = v20;
      v21 = "%{public}@Cannot send message with policy parameters because options %@ do not contain one of the required options: %@";
      goto LABEL_16;
    }
  }
  if (-[HMDHomeManagerXPCMessageSendPolicy isActive](self, "isActive") && ([v6 isActive] & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    v14 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v14;
    v15 = "%{public}@Cannot send message with policy parameters because active is NO";
    v16 = v13;
    uint32_t v17 = 12;
    goto LABEL_13;
  }
  BOOL v10 = 1;
LABEL_19:

  return v10;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (BOOL)isActive
{
  return self->_active;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHomeManagerXPCMessageSendPolicy *)self options];
  id v4 = HMHomeManagerOptionsToString();
  v5 = (void *)[v3 initWithName:@"Options" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHomeManagerXPCMessageSendPolicy *)self entitlements];
  uint64_t v7 = HMXPCClientEntitlementsShortDescription();
  unint64_t v8 = (void *)[v6 initWithName:@"Entitlements" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDHomeManagerXPCMessageSendPolicy *)self isActive];
  BOOL v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"Active" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (HMDHomeManagerXPCMessageSendPolicy)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4 active:(BOOL)a5
{
  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDHomeManagerXPCMessageSendPolicy;
    unint64_t v8 = [(HMDHomeManagerXPCMessageSendPolicy *)&v12 init];
    if (v8)
    {
      v8->_options = a4;
      if (a3 <= 1) {
        unint64_t v9 = 1;
      }
      else {
        unint64_t v9 = a3;
      }
      v8->_entitlements = v9;
      v8->_active = a5;
    }
    self = v8;
    BOOL v10 = self;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (HMDHomeManagerXPCMessageSendPolicy)initWithEntitlements:(unint64_t)a3 options:(unint64_t)a4
{
  return [(HMDHomeManagerXPCMessageSendPolicy *)self initWithEntitlements:a3 options:a4 active:0];
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMDHomeManagerXPCMessageSendPolicy *)self options];
  return [(HMDHomeManagerXPCMessageSendPolicy *)self entitlements] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDHomeManagerXPCMessageSendPolicy *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDHomeManagerXPCMessageSendPolicy;
    if ([(HMDXPCMessageSendPolicy *)&v13 isEqual:v4])
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

      if (v7
        && (unint64_t v8 = [(HMDHomeManagerXPCMessageSendPolicy *)self options],
            v8 == [(HMDHomeManagerXPCMessageSendPolicy *)v7 options])
        && (unint64_t v9 = [(HMDHomeManagerXPCMessageSendPolicy *)self entitlements],
            v9 == [(HMDHomeManagerXPCMessageSendPolicy *)v7 entitlements]))
      {
        BOOL v10 = [(HMDHomeManagerXPCMessageSendPolicy *)self isActive];
        BOOL v11 = v10 ^ [(HMDHomeManagerXPCMessageSendPolicy *)v7 isActive] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

@end