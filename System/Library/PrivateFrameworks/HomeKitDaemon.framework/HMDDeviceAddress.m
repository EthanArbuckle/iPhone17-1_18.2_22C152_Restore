@interface HMDDeviceAddress
+ (HMDDeviceAddress)addressWithIDSIdentifier:(id)a3 idsDestination:(id)a4;
+ (id)localDeviceIDSIdentifier;
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToDeviceAddress:(id)a3;
- (HMDDeviceAddress)initWithIDSIdentifier:(id)a3 idsDestination:(id)a4;
- (NSString)idsDestination;
- (NSUUID)idsIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMDDeviceAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (BOOL)isCurrentDevice
{
  v2 = [(HMDDeviceAddress *)self idsIdentifier];
  v3 = +[HMDDeviceAddress localDeviceIDSIdentifier];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMDDeviceAddress *)self idsIdentifier];
  v6 = [(HMDDeviceAddress *)self idsDestination];
  v7 = [v3 stringWithFormat:@"<%@ %@ %{sensitive}@>", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDDeviceAddress *)self idsIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEquivalentToDeviceAddress:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(HMDDeviceAddress *)self idsDestination];
  v6 = +[HMDDeviceHandle deviceHandleForDestination:v5];

  v7 = [v4 idsDestination];
  v8 = +[HMDDeviceHandle deviceHandleForDestination:v7];

  v9 = [(HMDDeviceAddress *)self idsIdentifier];
  v10 = [v4 idsIdentifier];

  if ([v9 isEqual:v10]) {
    char v11 = [v6 isEqual:v8];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDeviceAddress *)a3;
  if (v4 == self)
  {
    char v11 = 1;
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
    if (v6)
    {
      v7 = [(HMDDeviceAddress *)self idsDestination];
      v8 = [(HMDDeviceAddress *)v6 idsDestination];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(HMDDeviceAddress *)self idsIdentifier];
        v10 = [(HMDDeviceAddress *)v6 idsIdentifier];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (HMDDeviceAddress)initWithIDSIdentifier:(id)a3 idsDestination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMDDeviceAddress *)+[HMDDeviceAddress localDeviceIDSIdentifier];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDDeviceAddress;
  v10 = [(HMDDeviceAddress *)&v15 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_idsIdentifier, a3);
    objc_storeStrong((id *)&v11->_idsDestination, a4);
  }

  return v11;
}

+ (id)localDeviceIDSIdentifier
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock_with_options();
  if (localDeviceIDSIdentifier_localDeviceID)
  {
    id v2 = (id)localDeviceIDSIdentifier_localDeviceID;
    os_unfair_lock_unlock((os_unfair_lock_t)&localDeviceIDSIdentifier_lock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&localDeviceIDSIdentifier_lock);
    unint64_t v3 = (void *)IDSCopyLocalDeviceUniqueID();
    os_unfair_lock_lock_with_options();
    if (localDeviceIDSIdentifier_localDeviceID) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v3 == 0;
    }
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
      v6 = (void *)localDeviceIDSIdentifier_localDeviceID;
      localDeviceIDSIdentifier_localDeviceID = v5;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&localDeviceIDSIdentifier_lock);
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = localDeviceIDSIdentifier_localDeviceID;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@localDeviceID: %@", (uint8_t *)&v11, 0x16u);
    }
    id v2 = (id)localDeviceIDSIdentifier_localDeviceID;
  }
  return v2;
}

+ (HMDDeviceAddress)addressWithIDSIdentifier:(id)a3 idsDestination:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    BOOL v4 = (void *)[objc_alloc((Class)a1) initWithIDSIdentifier:v8 idsDestination:v7];
  }
  return (HMDDeviceAddress *)v4;
}

@end