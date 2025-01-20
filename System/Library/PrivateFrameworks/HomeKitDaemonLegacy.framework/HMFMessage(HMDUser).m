@interface HMFMessage(HMDUser)
- (id)matchingRemoteIdentityUserForHome:()HMDUser;
- (id)userForHome:()HMDUser;
@end

@implementation HMFMessage(HMDUser)

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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = a1;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [v16 identifier];
      int v21 = 138543618;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home as home was nil for message %@", (uint8_t *)&v21, 0x16u);

LABEL_19:
    }
LABEL_20:

    v7 = 0;
    goto LABEL_21;
  }
  if (([a1 isRemote] & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = a1;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home because message is not remote: %@", (uint8_t *)&v21, 0x16u);
      goto LABEL_19;
    }
    goto LABEL_20;
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
      v10 = [a1 remoteUserPairingIdentity];
      if (!v10
        || ([v4 userWithPairingIdentity:v10], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v11 = (void *)MEMORY[0x1D9452090]();
        id v12 = a1;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = HMFGetLogIdentifier();
          int v21 = 138543618;
          v22 = v14;
          __int16 v23 = 2112;
          id v24 = v12;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home for message %@", (uint8_t *)&v21, 0x16u);
        }
        v7 = 0;
      }
    }
  }

LABEL_21:
  return v7;
}

@end