@interface HMDUserPresenceFeed
- (BOOL)isEqual:(id)a3;
- (HMDUser)user;
- (HMDUserPresenceFeed)initWithUser:(id)a3 presenceAuthStatus:(id)a4 presenceComputeStatus:(id)a5 presenceRegion:(id)a6 reason:(id)a7;
- (HMDUserPresenceRegion)presenceRegion;
- (HMDUserPresenceUpdateReason)reason;
- (HMUserPresenceAuthorization)presenceAuthStatus;
- (HMUserPresenceCompute)presenceComputeStatus;
- (id)description;
@end

@implementation HMDUserPresenceFeed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_presenceRegion, 0);
  objc_storeStrong((id *)&self->_presenceComputeStatus, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_destroyWeak((id *)&self->_user);
}

- (HMDUserPresenceUpdateReason)reason
{
  return self->_reason;
}

- (HMDUserPresenceRegion)presenceRegion
{
  return self->_presenceRegion;
}

- (HMUserPresenceCompute)presenceComputeStatus
{
  return self->_presenceComputeStatus;
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  return self->_presenceAuthStatus;
}

- (HMDUser)user
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  return (HMDUser *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDUserPresenceFeed *)a3;
  if (v4 == self)
  {
    char v23 = 1;
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
    if (!v6) {
      goto LABEL_11;
    }
    v7 = [(HMDUserPresenceFeed *)self user];
    v8 = [v7 uuid];
    v9 = [(HMDUserPresenceFeed *)v6 user];
    v10 = [v9 uuid];
    int v11 = [v8 isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
    v12 = [(HMDUserPresenceFeed *)self presenceAuthStatus];
    v13 = [(HMDUserPresenceFeed *)v6 presenceAuthStatus];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_11;
    }
    v15 = [(HMDUserPresenceFeed *)self presenceComputeStatus];
    v16 = [(HMDUserPresenceFeed *)v6 presenceComputeStatus];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
    v18 = [(HMDUserPresenceFeed *)self presenceRegion];
    v19 = [(HMDUserPresenceFeed *)v6 presenceRegion];
    int v20 = [v18 isEqual:v19];

    if (v20)
    {
      v21 = [(HMDUserPresenceFeed *)self reason];
      v22 = [(HMDUserPresenceFeed *)v6 reason];
      char v23 = [v21 isEqual:v22];
    }
    else
    {
LABEL_11:
      char v23 = 0;
    }
  }
  return v23;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDUserPresenceFeed *)self user];
  v5 = [(HMDUserPresenceFeed *)self presenceAuthStatus];
  v6 = [(HMDUserPresenceFeed *)self presenceComputeStatus];
  v7 = [(HMDUserPresenceFeed *)self presenceRegion];
  v8 = [(HMDUserPresenceFeed *)self reason];
  v9 = [v3 stringWithFormat:@"[HMDUserPresenceFeed User: %@, Auth: %@, Compute: %@, Region: %@, Reason: %@]", v4, v5, v6, v7, v8];

  return v9;
}

- (HMDUserPresenceFeed)initWithUser:(id)a3 presenceAuthStatus:(id)a4 presenceComputeStatus:(id)a5 presenceRegion:(id)a6 reason:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserPresenceFeed;
  int v17 = [(HMDUserPresenceFeed *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_user, v12);
    objc_storeStrong((id *)&v18->_presenceAuthStatus, a4);
    objc_storeStrong((id *)&v18->_presenceComputeStatus, a5);
    objc_storeStrong((id *)&v18->_presenceRegion, a6);
    objc_storeStrong((id *)&v18->_reason, a7);
  }

  return v18;
}

@end