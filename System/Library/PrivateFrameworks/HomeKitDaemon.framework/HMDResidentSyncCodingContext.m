@interface HMDResidentSyncCodingContext
- (BOOL)_shouldExcludeForRestrictedGuestObject:(id)a3 context:(id)a4;
- (BOOL)targetIsResident;
- (HMDDeviceAddress)targetDeviceAddress;
- (HMDHomeMember)targetUser;
- (HMDResidentSyncCodingContext)initWithTargetUser:(id)a3 targetIsResident:(BOOL)a4 targetDeviceAddress:(id)a5;
@end

@implementation HMDResidentSyncCodingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceAddress, 0);
  objc_storeStrong((id *)&self->_targetUser, 0);
  objc_storeStrong((id *)&self->_relevantBulletinRegistrations, 0);
  objc_storeStrong((id *)&self->_relevantTriggers, 0);
}

- (HMDDeviceAddress)targetDeviceAddress
{
  return self->_targetDeviceAddress;
}

- (BOOL)targetIsResident
{
  return self->_targetIsResident;
}

- (HMDHomeMember)targetUser
{
  return self->_targetUser;
}

- (BOOL)_shouldExcludeForRestrictedGuestObject:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = [v13 targetUser];
      int v15 = [v14 isRestrictedGuest];

      if (v15)
      {
        int v16 = [v10 shouldIncludeForRestrictedGuestWithContext:v13] ^ 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v20;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@nil codingContext after cast: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    LOBYTE(v16) = 0;
    goto LABEL_16;
  }
  LOBYTE(v16) = 0;
LABEL_17:

  return v16;
}

- (HMDResidentSyncCodingContext)initWithTargetUser:(id)a3 targetIsResident:(BOOL)a4 targetDeviceAddress:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (v6 && ([v9 isOwner] & 1) == 0)
  {
    v14 = (_MKFZone *)_HMFPreconditionFailure();
    return (HMDResidentSyncCodingContext *)[(_MKFZone *)v14 shouldIncludeForRestrictedGuestWithContext:v16];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDResidentSyncCodingContext;
    id v11 = [(HMDResidentSyncCodingContext *)&v17 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_targetUser, a3);
      v12->_targetIsResident = v6;
      objc_storeStrong((id *)&v12->_targetDeviceAddress, a5);
    }

    return v12;
  }
}

@end