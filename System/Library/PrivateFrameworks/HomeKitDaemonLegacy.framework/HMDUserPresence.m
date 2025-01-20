@interface HMDUserPresence
+ (BOOL)supportsSecureCoding;
- (BOOL)isAtHome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotAtHome;
- (HMDDevice)deviceWhichUpdatedUserPresence;
- (HMDUser)user;
- (HMDUserPresence)initWithCoder:(id)a3;
- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4;
- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4 timeStamp:(id)a5;
- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4 timeStamp:(id)a5 presenceUpdateReason:(id)a6 device:(id)a7;
- (HMDUserPresenceRegion)presenceRegionStatus;
- (HMDUserPresenceRegion)rawPresenceRegionStatus;
- (HMDUserPresenceUpdateReason)presenceUpdateReason;
- (NSDate)updateTimestamp;
- (id)attributeDescriptions;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setPresenceRegionStatus:(id)a3;
- (void)setPresenceUpdateReason:(id)a3;
- (void)setRawPresenceRegionStatus:(id)a3;
@end

@implementation HMDUserPresence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimestamp, 0);
  objc_storeStrong((id *)&self->_presenceUpdateReason, 0);
  objc_storeStrong((id *)&self->_rawPresenceRegionStatus, 0);
  objc_storeStrong((id *)&self->_deviceWhichUpdatedUserPresence, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_presenceRegionStatus, 0);
}

- (NSDate)updateTimestamp
{
  return self->_updateTimestamp;
}

- (void)setPresenceUpdateReason:(id)a3
{
}

- (HMDUserPresenceUpdateReason)presenceUpdateReason
{
  return self->_presenceUpdateReason;
}

- (void)setRawPresenceRegionStatus:(id)a3
{
}

- (HMDDevice)deviceWhichUpdatedUserPresence
{
  return self->_deviceWhichUpdatedUserPresence;
}

- (HMDUser)user
{
  return self->_user;
}

- (id)attributeDescriptions
{
  v31[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v30 = [(HMDUserPresence *)self user];
  v29 = [v30 userID];
  v28 = +[HMDAccountHandleFormatter defaultFormatter];
  v27 = (void *)[v3 initWithName:@"UID" value:v29 options:2 formatter:v28];
  v31[0] = v27;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v26 = [(HMDUserPresence *)self user];
  v25 = [v26 uuid];
  v24 = (void *)[v4 initWithName:@"UUID" value:v25];
  v31[1] = v24;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = [(HMDUserPresence *)self presenceRegionStatus];
  v22 = (void *)[v5 initWithName:@"Reg" value:v23];
  v31[2] = v22;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDUserPresence *)self updateTimestamp];
  v8 = objc_msgSend(v7, "hmf_localTimeDescription");
  v9 = (void *)[v6 initWithName:@"TS" value:v8];
  v31[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDUserPresence *)self presenceUpdateReason];
  v12 = (void *)[v10 initWithName:@"Reason" value:v11];
  v31[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMDUserPresence *)self deviceWhichUpdatedUserPresence];
  v15 = (void *)[v13 initWithName:@"Device" value:v14];
  v31[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = [(HMDUserPresence *)self user];
  v18 = [v17 presenceAuthStatus];
  v19 = (void *)[v16 initWithName:@"Auth" value:v18];
  v31[6] = v19;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:7];

  return v21;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = +[HMDAccountHandleFormatter defaultFormatter];
  id v5 = [(HMDUserPresence *)self user];
  id v6 = [v5 userID];
  v7 = [v4 privateStringForObjectValue:v6];
  v8 = [(HMDUserPresence *)self presenceRegionStatus];
  v9 = [v3 stringWithFormat:@"%@/%@", v7, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserPresence *)self user];
  [v4 encodeObject:v5 forKey:@"HM.user"];

  id v6 = [(HMDUserPresence *)self presenceRegionStatus];
  [v6 addToCoder:v4];

  id v7 = [(HMDUserPresence *)self updateTimestamp];
  [v4 encodeObject:v7 forKey:@"PresenceUpdateTimestamp"];
}

- (HMDUserPresence)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserPresence;
  id v5 = [(HMDUserPresence *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
    user = v5->_user;
    v5->_user = (HMDUser *)v6;

    uint64_t v8 = +[HMDUserPresenceRegion regionWithCoder:v4];
    presenceRegionStatus = v5->_presenceRegionStatus;
    v5->_presenceRegionStatus = (HMDUserPresenceRegion *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PresenceUpdateTimestamp"];
    updateTimestamp = v5->_updateTimestamp;
    v5->_updateTimestamp = (NSDate *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDUserPresence *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    id v7 = [(HMDUserPresence *)self user];
    uint64_t v8 = [v7 uuid];
    v9 = [(HMDUserPresence *)v6 user];
    uint64_t v10 = [v9 uuid];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_9;
    }
    v12 = [(HMDUserPresence *)self presenceRegionStatus];
    objc_super v13 = [(HMDUserPresence *)v6 presenceRegionStatus];
    int v14 = HMFEqualObjects();

    if (v14)
    {
      v15 = [(HMDUserPresence *)self updateTimestamp];
      id v16 = [(HMDUserPresence *)v6 updateTimestamp];
      char v17 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v17 = 0;
    }
  }
  return v17;
}

- (BOOL)isNotAtHome
{
  v2 = [(HMDUserPresence *)self presenceRegionStatus];
  BOOL v3 = [v2 value] == 2;

  return v3;
}

- (BOOL)isAtHome
{
  v2 = [(HMDUserPresence *)self presenceRegionStatus];
  BOOL v3 = [v2 value] == 1;

  return v3;
}

- (void)setPresenceRegionStatus:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDUserPresenceRegion *)a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    updateTimestamp = self->_updateTimestamp;
    self->_updateTimestamp = v5;
  }
  else
  {
    updateTimestamp = self->_updateTimestamp;
    self->_updateTimestamp = 0;
  }

  id v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    presenceRegionStatus = v8->_presenceRegionStatus;
    v12 = [(NSDate *)v8->_updateTimestamp hmf_localTimeDescription];
    int v14 = 138544130;
    v15 = v10;
    __int16 v16 = 2112;
    char v17 = presenceRegionStatus;
    __int16 v18 = 2112;
    v19 = v4;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating region status from %@ to %@ with update timestamp %@", (uint8_t *)&v14, 0x2Au);
  }
  objc_super v13 = v8->_presenceRegionStatus;
  v8->_presenceRegionStatus = v4;
}

- (HMDUserPresenceRegion)presenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (HMDUserPresenceRegion)rawPresenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4 timeStamp:(id)a5 presenceUpdateReason:(id)a6 device:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserPresence;
  char v17 = [(HMDUserPresence *)&v21 init];
  __int16 v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_user, a3);
    objc_storeStrong((id *)&v18->_presenceRegionStatus, a4);
    objc_storeStrong((id *)&v18->_updateTimestamp, a5);
    objc_storeStrong((id *)&v18->_deviceWhichUpdatedUserPresence, a7);
    objc_storeStrong((id *)&v18->_presenceUpdateReason, a6);
  }

  return v18;
}

- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4 timeStamp:(id)a5
{
  return [(HMDUserPresence *)self initWithUser:a3 presenceRegionStatus:a4 timeStamp:a5 presenceUpdateReason:0 device:0];
}

- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(HMDUserPresence *)self initWithUser:v6 presenceRegionStatus:v7 timeStamp:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end