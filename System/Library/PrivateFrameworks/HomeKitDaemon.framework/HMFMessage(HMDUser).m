@interface HMFMessage(HMDUser)
- (id)matchingRemoteIdentityUserForHome:()HMDUser;
- (id)userForHome:()HMDUser;
- (uint64_t)shouldWeProcessRemoteMessageDespiteNoRemoteAccessAllowedForUser:()HMDUser;
@end

@implementation HMFMessage(HMDUser)

- (uint64_t)shouldWeProcessRemoteMessageDespiteNoRemoteAccessAllowedForUser:()HMDUser
{
  return [a3 shouldWeOverrideRemoteAccessAllowedDespiteNoRemoteAccessAllowed];
}

- (id)userForHome:()HMDUser
{
  id v4 = a3;
  if (v4)
  {
    if ([a1 isRemote] && objc_msgSend(a1, "remoteRestriction") != 4)
    {
      uint64_t v5 = [a1 matchingRemoteIdentityUserForHome:v4];
    }
    else
    {
      uint64_t v5 = [v4 currentUser];
    }
    v6 = (void *)v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)matchingRemoteIdentityUserForHome:()HMDUser
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v15 identifier];
      int v20 = 138543618;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home as home was nil for message %@", (uint8_t *)&v20, 0x16u);

LABEL_16:
    }
LABEL_17:

    v7 = 0;
    goto LABEL_18;
  }
  if (([a1 isRemote] & 1) == 0)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home because message is not remote: %@", (uint8_t *)&v20, 0x16u);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v5 = [a1 remoteSenderContext];
  v6 = [v5 mergeID];

  if (!v6 || ([v4 userWithMergeID:v6], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = [a1 remoteSenderContext];
    v9 = [v8 pairingIdentityIdentifier];

    if (!v9
      || ([v4 userWithPairingIdentityIdentifier:v9],
          (v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        int v20 = 138543618;
        v21 = v13;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home for message %@", (uint8_t *)&v20, 0x16u);
      }
      v7 = 0;
    }
  }
LABEL_18:

  return v7;
}

@end