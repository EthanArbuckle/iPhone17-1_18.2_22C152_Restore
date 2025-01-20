@interface HMOutgoingHomeInvitationData
+ (BOOL)supportsSecureCoding;
- (HMOutgoingHomeInvitationData)initWithCoder:(id)a3;
- (HMOutgoingHomeInvitationData)initWithUUID:(id)a3 inviteeUserID:(id)a4 inviteeName:(id)a5 invitationState:(int64_t)a6 expiryDate:(id)a7;
- (NSString)inviteeName;
- (NSString)inviteeUserID;
- (NSUUID)inviteeUUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setInviteeName:(id)a3;
@end

@implementation HMOutgoingHomeInvitationData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteeUUID, 0);
  objc_storeStrong((id *)&self->_inviteeUserID, 0);

  objc_storeStrong((id *)&self->_inviteeName, 0);
}

- (NSUUID)inviteeUUID
{
  return self->_inviteeUUID;
}

- (NSString)inviteeUserID
{
  return self->_inviteeUserID;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)HMOutgoingHomeInvitationData;
  v3 = [(HMHomeInvitationData *)&v10 description];
  v4 = [(HMOutgoingHomeInvitationData *)self inviteeUserID];
  v5 = [(HMOutgoingHomeInvitationData *)self inviteeUUID];
  v6 = [v5 UUIDString];
  v7 = [(HMOutgoingHomeInvitationData *)self inviteeName];
  v8 = [v3 stringByAppendingFormat:@", [ inviteeUserID = %@, inviteeUUID = %@, inviteeName = %@ ]", v4, v6, v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMOutgoingHomeInvitationData;
  id v4 = a3;
  [(HMHomeInvitationData *)&v8 encodeWithCoder:v4];
  v5 = [(HMOutgoingHomeInvitationData *)self inviteeUserID];
  [v4 encodeObject:v5 forKey:@"HM.inviteeUserID"];

  v6 = [(HMOutgoingHomeInvitationData *)self inviteeUUID];
  [v4 encodeObject:v6 forKey:@"userUUID"];

  v7 = [(HMOutgoingHomeInvitationData *)self inviteeName];
  [v4 encodeObject:v7 forKey:@"userDisplayName"];
}

- (HMOutgoingHomeInvitationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMOutgoingHomeInvitationData;
  v5 = [(HMHomeInvitationData *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.inviteeUserID"];
    inviteeUserID = v5->_inviteeUserID;
    v5->_inviteeUserID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userUUID"];
    inviteeUUID = v5->_inviteeUUID;
    v5->_inviteeUUID = (NSUUID *)v8;

    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDisplayName"];
    uint64_t v11 = objc_msgSend(v10, "hm_truncatedNameString");
    inviteeName = v5->_inviteeName;
    v5->_inviteeName = (NSString *)v11;
  }
  return v5;
}

- (void)setInviteeName:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = objc_msgSend(v7, "hm_truncatedNameString");
  v5 = (NSString *)[v4 copy];
  inviteeName = self->_inviteeName;
  self->_inviteeName = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)inviteeName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_inviteeName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMOutgoingHomeInvitationData)initWithUUID:(id)a3 inviteeUserID:(id)a4 inviteeName:(id)a5 invitationState:(int64_t)a6 expiryDate:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v17 = [v15 timeIntervalSinceDate:v16];
  if (v15)
  {
    double v19 = v18;
    if (v18 <= 3153600000.0)
    {
      v32 = (void *)MEMORY[0x19F3A64A0](v17);
      v33 = HMFGetOSLogHandle();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
      if (v19 >= 0.0)
      {
        if (v34)
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v50 = v37;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v15;
          _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to %@", buf, 0x16u);
        }
        v36 = v15;
      }
      else
      {
        if (v34)
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v50 = v35;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v15;
          _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Home invitation expiry date is already in the past, expiryDate: %@", buf, 0x16u);
        }
        v36 = v16;
      }
      uint64_t v23 = [v36 copy];
    }
    else
    {
      v20 = (void *)MEMORY[0x19F3A64A0](v17);
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v50 = v22;
        __int16 v51 = 2048;
        uint64_t v52 = 0x41E77F03C0000000;
        __int16 v53 = 2112;
        id v54 = v15;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Capping home invitation expiry duration to %g seconds from now, original expiry date: %@", buf, 0x20u);
      }
      uint64_t v23 = [v16 dateByAddingTimeInterval:3153600000.0];
    }
    v24 = (void *)v23;
  }
  else
  {
    v24 = [v16 dateByAddingTimeInterval:3153600000.0];
    v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v47 = v12;
      id v27 = v14;
      id v28 = v13;
      v29 = self;
      v31 = int64_t v30 = a6;
      *(_DWORD *)buf = 138543618;
      v50 = v31;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v24;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to maximum allowed: %@", buf, 0x16u);

      a6 = v30;
      self = v29;
      id v13 = v28;
      id v14 = v27;
      id v12 = v47;
    }
  }
  v48.receiver = self;
  v48.super_class = (Class)HMOutgoingHomeInvitationData;
  v38 = [(HMHomeInvitationData *)&v48 initWithInvitationState:a6 invitationIdentifier:v12 endDate:v24];
  if (v38)
  {
    uint64_t v39 = [v13 copy];
    inviteeUserID = v38->_inviteeUserID;
    v38->_inviteeUserID = (NSString *)v39;

    uint64_t v41 = [MEMORY[0x1E4F29128] UUID];
    inviteeUUID = v38->_inviteeUUID;
    v38->_inviteeUUID = (NSUUID *)v41;

    v43 = objc_msgSend(v14, "hm_truncatedNameString");
    uint64_t v44 = [v43 copy];
    inviteeName = v38->_inviteeName;
    v38->_inviteeName = (NSString *)v44;

    v38->_lock._os_unfair_lock_opaque = 0;
  }

  return v38;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end