@interface HMIncomingHomeInvitationData
+ (BOOL)supportsSecureCoding;
- (HMIncomingHomeInvitationData)initWithCoder:(id)a3;
- (HMIncomingHomeInvitationData)initWithInviterUserID:(id)a3 invitationIdentifier:(id)a4 inviterName:(id)a5 invitationState:(int64_t)a6 homeName:(id)a7 homeUUID:(id)a8 expiryDate:(id)a9;
- (NSString)homeName;
- (NSString)inviterMergeID;
- (NSString)inviterName;
- (NSString)inviterUserID;
- (NSUUID)homeUUID;
- (NSUUID)inviterUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setInviterName:(id)a3;
@end

@implementation HMIncomingHomeInvitationData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterMergeID, 0);
  objc_storeStrong((id *)&self->_inviterUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_inviterUserID, 0);

  objc_storeStrong((id *)&self->_inviterName, 0);
}

- (NSString)inviterMergeID
{
  return self->_inviterMergeID;
}

- (NSUUID)inviterUUID
{
  return self->_inviterUUID;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSString)inviterUserID
{
  return self->_inviterUserID;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)HMIncomingHomeInvitationData;
  v3 = [(HMHomeInvitationData *)&v14 description];
  v4 = [(HMIncomingHomeInvitationData *)self inviterUserID];
  v5 = [(HMIncomingHomeInvitationData *)self inviterUUID];
  v6 = [v5 UUIDString];
  v7 = [(HMIncomingHomeInvitationData *)self inviterName];
  v8 = [(HMIncomingHomeInvitationData *)self inviterMergeID];
  v9 = [(HMIncomingHomeInvitationData *)self homeName];
  v10 = [(HMIncomingHomeInvitationData *)self homeUUID];
  v11 = [v10 UUIDString];
  v12 = [v3 stringByAppendingFormat:@", [ inviterUserID = %@, inviterUUID = %@, inviterName = %@, inviterMergeID = %@, home = %@, homeUUID = %@ ]", v4, v6, v7, v8, v9, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HMIncomingHomeInvitationData;
  id v4 = a3;
  [(HMHomeInvitationData *)&v11 encodeWithCoder:v4];
  v5 = [(HMIncomingHomeInvitationData *)self inviterUserID];
  [v4 encodeObject:v5 forKey:@"HM.inviterUserID"];

  v6 = [(HMIncomingHomeInvitationData *)self homeName];
  [v4 encodeObject:v6 forKey:@"homeName"];

  v7 = [(HMIncomingHomeInvitationData *)self homeUUID];
  [v4 encodeObject:v7 forKey:@"homeUUID"];

  v8 = [(HMIncomingHomeInvitationData *)self inviterUUID];
  [v4 encodeObject:v8 forKey:@"userUUID"];

  v9 = [(HMIncomingHomeInvitationData *)self inviterName];
  [v4 encodeObject:v9 forKey:@"userDisplayName"];

  v10 = [(HMIncomingHomeInvitationData *)self inviterMergeID];
  [v4 encodeObject:v10 forKey:@"mergeID"];
}

- (HMIncomingHomeInvitationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMIncomingHomeInvitationData;
  v5 = [(HMHomeInvitationData *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeName"];
    uint64_t v7 = objc_msgSend(v6, "hm_truncatedNameString");
    homeName = v5->_homeName;
    v5->_homeName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeUUID"];
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.inviterUserID"];
    inviterUserID = v5->_inviterUserID;
    v5->_inviterUserID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userUUID"];
    inviterUUID = v5->_inviterUUID;
    v5->_inviterUUID = (NSUUID *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDisplayName"];
    uint64_t v16 = objc_msgSend(v15, "hm_truncatedNameString");
    inviterName = v5->_inviterName;
    v5->_inviterName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mergeID"];
    inviterMergeID = v5->_inviterMergeID;
    v5->_inviterMergeID = (NSString *)v18;
  }
  return v5;
}

- (void)setInviterName:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = objc_msgSend(v7, "hm_truncatedNameString");
  v5 = (NSString *)[v4 copy];
  inviterName = self->_inviterName;
  self->_inviterName = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)inviterName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_inviterName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMIncomingHomeInvitationData)initWithInviterUserID:(id)a3 invitationIdentifier:(id)a4 inviterName:(id)a5 invitationState:(int64_t)a6 homeName:(id)a7 homeUUID:(id)a8 expiryDate:(id)a9
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v15 = a4;
  id v55 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v20 = [v18 timeIntervalSinceDate:v19];
  if (v18)
  {
    double v22 = v21;
    if (v21 <= 10800.0)
    {
      v33 = (void *)MEMORY[0x19F3A64A0](v20);
      v34 = HMFGetOSLogHandle();
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      if (v22 >= 0.0)
      {
        if (v35)
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v59 = v38;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v18;
          _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to %@", buf, 0x16u);
        }
        v37 = v18;
      }
      else
      {
        if (v35)
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v59 = v36;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v18;
          _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_INFO, "%{public}@Home invitation expiry date is already in the past, expiryDate: %@", buf, 0x16u);
        }
        v37 = v19;
      }
      v26 = (void *)[v37 copy];
    }
    else
    {
      int64_t v53 = a6;
      v23 = (void *)MEMORY[0x19F3A64A0](v20);
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v59 = v25;
        __int16 v60 = 2048;
        uint64_t v61 = 0x40C5180000000000;
        __int16 v62 = 2112;
        id v63 = v18;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Capping home invitation expiry duration to %g seconds from now, original expiry date: %@", buf, 0x20u);
      }
      v26 = [v19 dateByAddingTimeInterval:10800.0];
      a6 = v53;
    }
  }
  else
  {
    v27 = self;
    int64_t v28 = a6;
    v26 = [v19 dateByAddingTimeInterval:10800.0];
    v29 = (void *)MEMORY[0x19F3A64A0]();
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v54 = v15;
      v32 = id v31 = v17;
      *(_DWORD *)buf = 138543618;
      v59 = v32;
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v26;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to maximum allowed: %@", buf, 0x16u);

      id v17 = v31;
      id v15 = v54;
    }

    a6 = v28;
    self = v27;
  }
  v57.receiver = self;
  v57.super_class = (Class)HMIncomingHomeInvitationData;
  v39 = [(HMHomeInvitationData *)&v57 initWithInvitationState:a6 invitationIdentifier:v15 endDate:v26];
  if (v39)
  {
    uint64_t v40 = [v56 copy];
    inviterUserID = v39->_inviterUserID;
    v39->_inviterUserID = (NSString *)v40;

    v42 = objc_msgSend(v16, "hm_truncatedNameString");
    uint64_t v43 = [v42 copy];
    homeName = v39->_homeName;
    v39->_homeName = (NSString *)v43;

    uint64_t v45 = [v17 copy];
    homeUUID = v39->_homeUUID;
    v39->_homeUUID = (NSUUID *)v45;

    uint64_t v47 = [MEMORY[0x1E4F29128] UUID];
    inviterUUID = v39->_inviterUUID;
    v39->_inviterUUID = (NSUUID *)v47;

    v49 = objc_msgSend(v55, "hm_truncatedNameString");
    uint64_t v50 = [v49 copy];
    inviterName = v39->_inviterName;
    v39->_inviterName = (NSString *)v50;

    v39->_lock._os_unfair_lock_opaque = 0;
  }

  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end