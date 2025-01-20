@interface HMHomeInvitationData
+ (BOOL)supportsSecureCoding;
+ (id)homeInvitationStateDescription:(int64_t)a3;
- (HMHomeInvitationData)initWithCoder:(id)a3;
- (HMHomeInvitationData)initWithInvitationState:(int64_t)a3 invitationIdentifier:(id)a4 endDate:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)identifier;
- (id)description;
- (int64_t)invitationState;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setInvitationState:(int64_t)a3;
@end

@implementation HMHomeInvitationData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setInvitationState:(int64_t)a3
{
  self->_invitationState = a3;
}

- (int64_t)invitationState
{
  return self->_invitationState;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMHomeInvitationData *)self identifier];
  v5 = [v4 UUIDString];
  v6 = [(HMHomeInvitationData *)self startDate];
  v7 = [(HMHomeInvitationData *)self endDate];
  v8 = +[HMHomeInvitationData homeInvitationStateDescription:[(HMHomeInvitationData *)self invitationState]];
  v9 = [v3 stringWithFormat:@"[ identifier = %@, startDate = %@, endDate = %@, state = %@ ]", v5, v6, v7, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(HMHomeInvitationData *)self identifier];
  [v7 encodeObject:v4 forKey:@"HM.identifier"];

  v5 = [(HMHomeInvitationData *)self startDate];
  [v7 encodeObject:v5 forKey:@"HM.startDate"];

  v6 = [(HMHomeInvitationData *)self endDate];
  [v7 encodeObject:v6 forKey:@"HM.endDate"];

  objc_msgSend(v7, "encodeInt32:forKey:", -[HMHomeInvitationData invitationState](self, "invitationState"), @"HM.invitationState");
}

- (HMHomeInvitationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMHomeInvitationData;
  v5 = [(HMHomeInvitationData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v5->_invitationState = (int)[v4 decodeInt32ForKey:@"HM.invitationState"];
  }

  return v5;
}

- (HMHomeInvitationData)initWithInvitationState:(int64_t)a3 invitationIdentifier:(id)a4 endDate:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMHomeInvitationData;
  uint64_t v10 = [(HMHomeInvitationData *)&v19 init];
  if (v10)
  {
    if (v8)
    {
      uint64_t v11 = [v8 copy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    }
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v13;

    v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v10->_endDate, a5);
    v10->_invitationState = a3;
  }

  return v10;
}

+ (id)homeInvitationStateDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return @"HMHomeInvitationStateUnknown";
  }
  else {
    return off_1E5943E10[a3 - 1];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end