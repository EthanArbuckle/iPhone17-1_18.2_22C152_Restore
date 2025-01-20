@interface HMDAccessoryReachabilityElectionParameter
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (HMDAccessoryReachabilityElectionParameter)initWithDictionaryRepresentation:(id)a3;
- (HMDAccessoryReachabilityElectionParameter)initWithIdentifier:(id)a3 isReachable:(BOOL)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDAccessoryReachabilityElectionParameter

- (void).cxx_destruct
{
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAccessoryReachabilityElectionParameter *)self identifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryReachabilityElectionParameter *)self isReachable];
  v7 = HMFBooleanToString();
  v8 = (void *)[v6 initWithName:@"Reachable" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (BOOL)isEqual:(id)a3
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
  if (v6)
  {
    v7 = [(HMDAccessoryReachabilityElectionParameter *)self identifier];
    v8 = [v6 identifier];
    if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
    {
      BOOL v9 = [(HMDAccessoryReachabilityElectionParameter *)self isReachable];
      int v10 = v9 ^ [v6 isReachable] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryReachabilityElectionParameter *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDAccessoryReachabilityElectionParameter *)self identifier];
  id v4 = [v3 UUIDString];
  BOOL v9 = v4;
  BOOL v5 = [(HMDAccessoryReachabilityElectionParameter *)self isReachable];
  id v6 = &unk_26E4737E0;
  if (v5) {
    id v6 = &unk_26E4737C8;
  }
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return (NSDictionary *)v7;
}

- (HMDAccessoryReachabilityElectionParameter)initWithIdentifier:(id)a3 isReachable:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v15.receiver = self;
    v15.super_class = (Class)HMDAccessoryReachabilityElectionParameter;
    v8 = [(HMDAccessoryReachabilityElectionParameter *)&v15 init];
    if (v8)
    {
      uint64_t v9 = [v7 copy];
      identifier = v8->_identifier;
      v8->_identifier = (NSUUID *)v9;

      v8->_reachable = a4;
    }

    return v8;
  }
  else
  {
    v12 = (HMDAccessoryReachabilityElectionParameter *)_HMFPreconditionFailure();
    return [(HMDAccessoryReachabilityElectionParameter *)v12 initWithDictionaryRepresentation:v14];
  }
}

- (HMDAccessoryReachabilityElectionParameter)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 allKeys];
    if ([v6 count] != 1)
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      self = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v32 = 138543618;
        v33 = v19;
        __int16 v34 = 2112;
        id v35 = v5;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected representation, invalid keys: %@", (uint8_t *)&v32, 0x16u);
      }
      goto LABEL_23;
    }
    v7 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
      if (v10)
      {
        v11 = (void *)v10;

        v12 = [v5 allValues];
        SEL v13 = [v12 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          self = -[HMDAccessoryReachabilityElectionParameter initWithIdentifier:isReachable:](self, "initWithIdentifier:isReachable:", v11, [v15 BOOLValue]);
          v16 = self;
        }
        else
        {
          v27 = (void *)MEMORY[0x230FBD990]();
          self = self;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = HMFGetLogIdentifier();
            v30 = [v5 allValues];
            v31 = [v30 firstObject];
            int v32 = 138543618;
            v33 = v29;
            __int16 v34 = 2112;
            id v35 = v31;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid reachability: %@", (uint8_t *)&v32, 0x16u);
          }
          v16 = 0;
        }

        id v6 = v11;
        goto LABEL_24;
      }
      v20 = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      v22 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      v23 = HMFGetLogIdentifier();
      int v32 = 138543618;
      v33 = v23;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid identifier: %@", (uint8_t *)&v32, 0x16u);
    }
    else
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

LABEL_23:
        v16 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v23 = HMFGetLogIdentifier();
      v24 = [v6 firstObject];
      int v32 = 138543618;
      v33 = v23;
      __int16 v34 = 2112;
      id v35 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid key type: %@", (uint8_t *)&v32, 0x16u);
    }
    goto LABEL_22;
  }
  v16 = 0;
LABEL_25:

  return v16;
}

@end